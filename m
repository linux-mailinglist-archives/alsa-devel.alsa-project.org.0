Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83447311FF2
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Feb 2021 21:34:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1ADA167E;
	Sat,  6 Feb 2021 21:33:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1ADA167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612643641;
	bh=h5CLuc/bxaDJ1SGZvXIe4y1DWL2jGsbWdUKcNQXkUQI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hiIxv45nZK5Wy7Js3kl9kI94KTcZcTFwFAF4IGVPtPYFUjhAgKQeHikinTVxSE1ml
	 oaKGhlHyKFN3UbLZLabiUE1TMxS3ZqcfYC8vjU+yUP3VM5mnLZD2Fvh9unKLY+raYe
	 oEeOqbF/ewF6L1WZjm39NtjYEunGVHR9cFo2IWf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DAC4F80277;
	Sat,  6 Feb 2021 21:31:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 380C8F800B8; Sat,  6 Feb 2021 21:31:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EE3CF800B8
 for <alsa-devel@alsa-project.org>; Sat,  6 Feb 2021 21:30:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EE3CF800B8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DA68BAFF2
 for <alsa-devel@alsa-project.org>; Sat,  6 Feb 2021 20:30:53 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ALSA: usb-audio: More strict state change in EP
Date: Sat,  6 Feb 2021 21:30:51 +0100
Message-Id: <20210206203052.15606-3-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210206203052.15606-1-tiwai@suse.de>
References: <20210206203052.15606-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The endpoint management has bit flags to indicate the current state,
and we're dealing two things: the running bit and the stopping bit.
There is a thin window in transition from the running to the stopping
in stop_urbs(), and as long as the bit flags are used, it's difficult
to plug.

This patch modifies the state management code to use the atomic int
and follow the explicit three states, STOPPED, RUNNING and STOPPING.
The state change is done via atomic_cmpxhg() for avoiding possible
races, and check the state change more strictly.  The unexpected state
change is now handled as an error.

Fixes: d0f09d1e4a88 ("ALSA: usb-audio: Refactoring endpoint URB deactivation")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.h     |  2 +-
 sound/usb/endpoint.c | 42 ++++++++++++++++++++++++++++--------------
 2 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index 37091b117614..a741e7da83a2 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -71,7 +71,7 @@ struct snd_usb_endpoint {
 	unsigned char altsetting;	/* corresponding alternate setting */
 	unsigned char ep_idx;		/* endpoint array index */
 
-	unsigned long flags;	/* running bit flags */
+	atomic_t state;		/* running state */
 
 	void (*prepare_data_urb) (struct snd_usb_substream *subs,
 				  struct urb *urb);
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index e102c024c21f..4390075b2c6f 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -21,8 +21,11 @@
 #include "clock.h"
 #include "quirks.h"
 
-#define EP_FLAG_RUNNING		1
-#define EP_FLAG_STOPPING	2
+enum {
+	EP_STATE_STOPPED,
+	EP_STATE_RUNNING,
+	EP_STATE_STOPPING,
+};
 
 /* interface refcounting */
 struct snd_usb_iface_ref {
@@ -115,6 +118,16 @@ static const char *usb_error_string(int err)
 	}
 }
 
+static inline bool ep_state_running(struct snd_usb_endpoint *ep)
+{
+	return atomic_read(&ep->state) == EP_STATE_RUNNING;
+}
+
+static inline bool ep_state_update(struct snd_usb_endpoint *ep, int old, int new)
+{
+	return atomic_cmpxchg(&ep->state, old, new) == old;
+}
+
 /**
  * snd_usb_endpoint_implicit_feedback_sink: Report endpoint usage type
  *
@@ -393,7 +406,7 @@ next_packet_fifo_dequeue(struct snd_usb_endpoint *ep)
  */
 static void queue_pending_output_urbs(struct snd_usb_endpoint *ep)
 {
-	while (test_bit(EP_FLAG_RUNNING, &ep->flags)) {
+	while (ep_state_running(ep)) {
 
 		unsigned long flags;
 		struct snd_usb_packet_info *packet;
@@ -454,13 +467,13 @@ static void snd_complete_urb(struct urb *urb)
 	if (unlikely(atomic_read(&ep->chip->shutdown)))
 		goto exit_clear;
 
-	if (unlikely(!test_bit(EP_FLAG_RUNNING, &ep->flags)))
+	if (unlikely(!ep_state_running(ep)))
 		goto exit_clear;
 
 	if (usb_pipeout(ep->pipe)) {
 		retire_outbound_urb(ep, ctx);
 		/* can be stopped during retire callback */
-		if (unlikely(!test_bit(EP_FLAG_RUNNING, &ep->flags)))
+		if (unlikely(!ep_state_running(ep)))
 			goto exit_clear;
 
 		if (snd_usb_endpoint_implicit_feedback_sink(ep)) {
@@ -474,12 +487,12 @@ static void snd_complete_urb(struct urb *urb)
 
 		prepare_outbound_urb(ep, ctx);
 		/* can be stopped during prepare callback */
-		if (unlikely(!test_bit(EP_FLAG_RUNNING, &ep->flags)))
+		if (unlikely(!ep_state_running(ep)))
 			goto exit_clear;
 	} else {
 		retire_inbound_urb(ep, ctx);
 		/* can be stopped during retire callback */
-		if (unlikely(!test_bit(EP_FLAG_RUNNING, &ep->flags)))
+		if (unlikely(!ep_state_running(ep)))
 			goto exit_clear;
 
 		prepare_inbound_urb(ep, ctx);
@@ -835,7 +848,7 @@ static int wait_clear_urbs(struct snd_usb_endpoint *ep)
 	unsigned long end_time = jiffies + msecs_to_jiffies(1000);
 	int alive;
 
-	if (!test_bit(EP_FLAG_STOPPING, &ep->flags))
+	if (atomic_read(&ep->state) != EP_STATE_STOPPING)
 		return 0;
 
 	do {
@@ -850,10 +863,11 @@ static int wait_clear_urbs(struct snd_usb_endpoint *ep)
 		usb_audio_err(ep->chip,
 			"timeout: still %d active urbs on EP #%x\n",
 			alive, ep->ep_num);
-	clear_bit(EP_FLAG_STOPPING, &ep->flags);
 
-	ep->sync_sink = NULL;
-	snd_usb_endpoint_set_callback(ep, NULL, NULL, NULL);
+	if (ep_state_update(ep, EP_STATE_STOPPING, EP_STATE_STOPPED)) {
+		ep->sync_sink = NULL;
+		snd_usb_endpoint_set_callback(ep, NULL, NULL, NULL);
+	}
 
 	return 0;
 }
@@ -882,10 +896,9 @@ static int stop_urbs(struct snd_usb_endpoint *ep, bool force)
 	if (!force && atomic_read(&ep->running))
 		return -EBUSY;
 
-	if (!test_and_clear_bit(EP_FLAG_RUNNING, &ep->flags))
+	if (!ep_state_update(ep, EP_STATE_RUNNING, EP_STATE_STOPPING))
 		return 0;
 
-	set_bit(EP_FLAG_STOPPING, &ep->flags);
 	INIT_LIST_HEAD(&ep->ready_playback_urbs);
 	ep->next_packet_head = 0;
 	ep->next_packet_queued = 0;
@@ -1362,7 +1375,8 @@ int snd_usb_endpoint_start(struct snd_usb_endpoint *ep)
 	 * from that context.
 	 */
 
-	set_bit(EP_FLAG_RUNNING, &ep->flags);
+	if (!ep_state_update(ep, EP_STATE_STOPPED, EP_STATE_RUNNING))
+		goto __error;
 
 	if (snd_usb_endpoint_implicit_feedback_sink(ep)) {
 		for (i = 0; i < ep->nurbs; i++) {
-- 
2.26.2

