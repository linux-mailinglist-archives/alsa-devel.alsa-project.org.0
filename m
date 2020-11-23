Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E712D2C01EE
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 10:06:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52AF916D1;
	Mon, 23 Nov 2020 10:05:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52AF916D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606122404;
	bh=8V6FC/5DRb0UCefESLlSf8eHWCxqNU0NBT44qqbPXHI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fPvdIlO5nNy6BtnQY5VJDCxwjLFidljA05sbB3s/PDX5tlGn4MXJCfUptoyiXBelO
	 Rt2BUk+2Kpgtmo+w404npKixWge0tMMkbNafoNbkDGTDfAjbuOOWMgcUANCsSEXetK
	 StApELa3kBnB2nk5b2rW9BAei7njNKY7WTgj0BGo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E5E9F805E0;
	Mon, 23 Nov 2020 09:55:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC6F5F8053C; Mon, 23 Nov 2020 09:54:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CFC8F804E6
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CFC8F804E6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 28CDDAFC9;
 Mon, 23 Nov 2020 08:53:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 22/41] ALSA: usb-audio: Set callbacks via
 snd_usb_endpoint_set_callback()
Date: Mon, 23 Nov 2020 09:53:28 +0100
Message-Id: <20201123085347.19667-23-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20201123085347.19667-1-tiwai@suse.de>
References: <20201123085347.19667-1-tiwai@suse.de>
Cc: Matwey Kornilov <matwey.kornilov@gmail.com>,
 Dylan Robinson <dylan_robinson@motu.com>,
 Keith Milner <kamilner@superlative.org>
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

The prepare_data_urb and retire_data_urb fields of the endpoint object
are set dynamically at PCM trigger start/stop.  Those are evaluated in
the endpoint handler, but there can be a race, especially if two
different PCM substreams are handling the same endpoint for the
implicit feedback case.  Also, the data_subs field of the endpoint is
set and accessed dynamically, too, which has the same risk.

As a slight improvement for the concurrency, this patch introduces the
function to set the callbacks and the data in a shot with the memory
barrier.  In the reader side, it's also fetched with the memory
barrier.

There is still a room of race if prepare and retire callbacks are set
during executing the URB completion.  But such an inconsistency may
happen only for the implicit fb source, i.e. it's only about the
capture stream.  And luckily, the capture stream never sets the
prepare callback, hence the problem doesn't happen practically.

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 60 +++++++++++++++++++++++++++++++++++-----------------
 sound/usb/endpoint.h |  7 ++++++
 sound/usb/pcm.c      | 33 ++++++++++++++++-------------
 3 files changed, 66 insertions(+), 34 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 0cc7e9c01263..7012fdafc3d8 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -169,11 +169,20 @@ int snd_usb_endpoint_next_packet_size(struct snd_usb_endpoint *ep)
 	return ret;
 }
 
+static void call_retire_callback(struct snd_usb_endpoint *ep,
+				 struct urb *urb)
+{
+	struct snd_usb_substream *data_subs;
+
+	data_subs = READ_ONCE(ep->data_subs);
+	if (data_subs && ep->retire_data_urb)
+		ep->retire_data_urb(data_subs, urb);
+}
+
 static void retire_outbound_urb(struct snd_usb_endpoint *ep,
 				struct snd_urb_ctx *urb_ctx)
 {
-	if (ep->retire_data_urb)
-		ep->retire_data_urb(ep->data_subs, urb_ctx->urb);
+	call_retire_callback(ep, urb_ctx->urb);
 }
 
 static void retire_inbound_urb(struct snd_usb_endpoint *ep,
@@ -189,8 +198,7 @@ static void retire_inbound_urb(struct snd_usb_endpoint *ep,
 	if (ep->sync_slave)
 		snd_usb_handle_sync_urb(ep->sync_slave, ep, urb);
 
-	if (ep->retire_data_urb)
-		ep->retire_data_urb(ep->data_subs, urb);
+	call_retire_callback(ep, urb);
 }
 
 static void prepare_silent_urb(struct snd_usb_endpoint *ep,
@@ -244,17 +252,17 @@ static void prepare_outbound_urb(struct snd_usb_endpoint *ep,
 {
 	struct urb *urb = ctx->urb;
 	unsigned char *cp = urb->transfer_buffer;
+	struct snd_usb_substream *data_subs;
 
 	urb->dev = ep->chip->dev; /* we need to set this at each time */
 
 	switch (ep->type) {
 	case SND_USB_ENDPOINT_TYPE_DATA:
-		if (ep->prepare_data_urb) {
-			ep->prepare_data_urb(ep->data_subs, urb);
-		} else {
-			/* no data provider, so send silence */
+		data_subs = READ_ONCE(ep->data_subs);
+		if (data_subs && ep->prepare_data_urb)
+			ep->prepare_data_urb(data_subs, urb);
+		else /* no data provider, so send silence */
 			prepare_silent_urb(ep, ctx);
-		}
 		break;
 
 	case SND_USB_ENDPOINT_TYPE_SYNC:
@@ -381,7 +389,7 @@ static void snd_complete_urb(struct urb *urb)
 {
 	struct snd_urb_ctx *ctx = urb->context;
 	struct snd_usb_endpoint *ep = ctx->ep;
-	struct snd_pcm_substream *substream;
+	struct snd_usb_substream *data_subs;
 	unsigned long flags;
 	int err;
 
@@ -430,10 +438,9 @@ static void snd_complete_urb(struct urb *urb)
 		return;
 
 	usb_audio_err(ep->chip, "cannot submit urb (err = %d)\n", err);
-	if (ep->data_subs && ep->data_subs->pcm_substream) {
-		substream = ep->data_subs->pcm_substream;
-		snd_pcm_stop_xrun(substream);
-	}
+	data_subs = READ_ONCE(ep->data_subs);
+	if (data_subs && data_subs->pcm_substream)
+		snd_pcm_stop_xrun(data_subs->pcm_substream);
 
 exit_clear:
 	clear_bit(ctx->index, &ep->active_mask);
@@ -532,6 +539,24 @@ void snd_usb_endpoint_set_syncinterval(struct snd_usb_audio *chip,
 	}
 }
 
+/*
+ * Set data endpoint callbacks and the assigned data stream
+ *
+ * Called at PCM trigger and cleanups.
+ * Pass NULL to deactivate each callback.
+ */
+void snd_usb_endpoint_set_callback(struct snd_usb_endpoint *ep,
+				   void (*prepare)(struct snd_usb_substream *subs,
+						   struct urb *urb),
+				   void (*retire)(struct snd_usb_substream *subs,
+						  struct urb *urb),
+				   struct snd_usb_substream *data_subs)
+{
+	ep->prepare_data_urb = prepare;
+	ep->retire_data_urb = retire;
+	WRITE_ONCE(ep->data_subs, data_subs);
+}
+
 /*
  *  wait until all urbs are processed.
  */
@@ -554,10 +579,8 @@ static int wait_clear_urbs(struct snd_usb_endpoint *ep)
 			alive, ep->ep_num);
 	clear_bit(EP_FLAG_STOPPING, &ep->flags);
 
-	ep->data_subs = NULL;
 	ep->sync_slave = NULL;
-	ep->retire_data_urb = NULL;
-	ep->prepare_data_urb = NULL;
+	snd_usb_endpoint_set_callback(ep, NULL, NULL, NULL);
 
 	return 0;
 }
@@ -607,8 +630,7 @@ static void release_urbs(struct snd_usb_endpoint *ep, int force)
 	int i;
 
 	/* route incoming urbs to nirvana */
-	ep->retire_data_urb = NULL;
-	ep->prepare_data_urb = NULL;
+	snd_usb_endpoint_set_callback(ep, NULL, NULL, NULL);
 
 	/* stop urbs */
 	deactivate_urbs(ep, force);
diff --git a/sound/usb/endpoint.h b/sound/usb/endpoint.h
index 76b6de7de991..e2fddb3dcf7a 100644
--- a/sound/usb/endpoint.h
+++ b/sound/usb/endpoint.h
@@ -20,6 +20,13 @@ int snd_usb_endpoint_set_params(struct snd_usb_endpoint *ep,
 				struct audioformat *fmt,
 				struct snd_usb_endpoint *sync_ep);
 
+void snd_usb_endpoint_set_callback(struct snd_usb_endpoint *ep,
+				   void (*prepare)(struct snd_usb_substream *subs,
+						   struct urb *urb),
+				   void (*retire)(struct snd_usb_substream *subs,
+						  struct urb *urb),
+				   struct snd_usb_substream *data_subs);
+
 int  snd_usb_endpoint_start(struct snd_usb_endpoint *ep);
 void snd_usb_endpoint_stop(struct snd_usb_endpoint *ep);
 void snd_usb_endpoint_sync_pending_stop(struct snd_usb_endpoint *ep);
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index c4e39aa92a84..32237623de96 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -232,7 +232,6 @@ static int start_endpoints(struct snd_usb_substream *subs)
 	if (!test_and_set_bit(SUBSTREAM_FLAG_DATA_EP_STARTED, &subs->flags)) {
 		struct snd_usb_endpoint *ep = subs->data_endpoint;
 
-		ep->data_subs = subs;
 		err = snd_usb_endpoint_start(ep);
 		if (err < 0) {
 			clear_bit(SUBSTREAM_FLAG_DATA_EP_STARTED, &subs->flags);
@@ -1830,18 +1829,24 @@ static int snd_usb_substream_playback_trigger(struct snd_pcm_substream *substrea
 		subs->trigger_tstamp_pending_update = true;
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		subs->data_endpoint->prepare_data_urb = prepare_playback_urb;
-		subs->data_endpoint->retire_data_urb = retire_playback_urb;
+		snd_usb_endpoint_set_callback(subs->data_endpoint,
+					      prepare_playback_urb,
+					      retire_playback_urb,
+					      subs);
 		subs->running = 1;
 		return 0;
 	case SNDRV_PCM_TRIGGER_STOP:
 		stop_endpoints(subs);
+		snd_usb_endpoint_set_callback(subs->data_endpoint,
+					      NULL, NULL, NULL);
 		subs->running = 0;
 		return 0;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		subs->data_endpoint->prepare_data_urb = NULL;
 		/* keep retire_data_urb for delay calculation */
-		subs->data_endpoint->retire_data_urb = retire_playback_urb;
+		snd_usb_endpoint_set_callback(subs->data_endpoint,
+					      NULL,
+					      retire_playback_urb,
+					      subs);
 		subs->running = 0;
 		return 0;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
@@ -1867,23 +1872,21 @@ static int snd_usb_substream_capture_trigger(struct snd_pcm_substream *substream
 		err = start_endpoints(subs);
 		if (err < 0)
 			return err;
-
-		subs->data_endpoint->retire_data_urb = retire_capture_urb;
+		fallthrough;
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		snd_usb_endpoint_set_callback(subs->data_endpoint,
+					      NULL, retire_capture_urb,
+					      subs);
 		subs->running = 1;
 		return 0;
 	case SNDRV_PCM_TRIGGER_STOP:
 		stop_endpoints(subs);
-		subs->data_endpoint->retire_data_urb = NULL;
-		subs->running = 0;
-		return 0;
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		subs->data_endpoint->retire_data_urb = NULL;
+		snd_usb_endpoint_set_callback(subs->data_endpoint,
+					      NULL, NULL, NULL);
 		subs->running = 0;
 		return 0;
-	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		subs->data_endpoint->retire_data_urb = retire_capture_urb;
-		subs->running = 1;
-		return 0;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 		if (subs->stream->chip->setup_fmt_after_resume_quirk) {
 			stop_endpoints(subs);
-- 
2.16.4

