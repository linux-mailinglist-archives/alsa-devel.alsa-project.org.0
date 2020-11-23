Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0429B2C01ED
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 10:06:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89FF5166C;
	Mon, 23 Nov 2020 10:05:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89FF5166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606122383;
	bh=6EbO6fe3QhnZMlw1/OCWHRhmoxzMAPYIgftOrYO+ETk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nOgOMdBuZpaDeF+Scc2W1JcuHCA54wlk2Y1KLYjmTh4klPylFj1dpkmkwiR24TCZu
	 NV5pmrqcnE6264d0Y9ulS5dIdS5TnN+5xgRyCEzlDmFsS9Y08IqxVJVpvmuVYzy0n9
	 42DIj1CACtrqzXGPvJYJ/ceXqvjm+f9jK7/zQd5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B34DEF805D8;
	Mon, 23 Nov 2020 09:55:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2AB3F80542; Mon, 23 Nov 2020 09:54:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CECCF804E1
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CECCF804E1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 82626AFCF;
 Mon, 23 Nov 2020 08:53:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 28/41] ALSA: usb-audio: Use atomic_t for endpoint use_count
Date: Mon, 23 Nov 2020 09:53:34 +0100
Message-Id: <20201123085347.19667-29-tiwai@suse.de>
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

The endpoint objects may be started/stopped concurrently by different
substreams in the case of implicit feedback mode, while the current
code handles the reference counter without any protection.

This patch changes the refcount to atomic_t for avoiding the
inconsistency.  We need no reference_t here as the refcount goes only
up to 2.

Also the name "use_count" is renamed to "running" since this is about
actually the running status, not the open refcount.

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.h     |  2 +-
 sound/usb/endpoint.c | 26 ++++++++++++++------------
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index 53f0ce61f858..f58c3769b058 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -60,7 +60,7 @@ struct snd_usb_endpoint {
 	struct snd_usb_audio *chip;
 
 	int opened;		/* open refcount; protect with chip->mutex */
-	int use_count;
+	atomic_t running;	/* running status */
 	int ep_num;		/* the referenced endpoint number */
 	int type;		/* SND_USB_ENDPOINT_TYPE_* */
 	unsigned long flags;
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 49fb934ee432..4d733b2d8287 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1234,7 +1234,7 @@ int snd_usb_endpoint_configure(struct snd_usb_audio *chip,
  *
  * @ep: the endpoint to start
  *
- * A call to this function will increment the use count of the endpoint.
+ * A call to this function will increment the running count of the endpoint.
  * In case it is not already running, the URBs for this endpoint will be
  * submitted. Otherwise, this function does nothing.
  *
@@ -1253,11 +1253,12 @@ int snd_usb_endpoint_start(struct snd_usb_endpoint *ep)
 	if (ep->sync_master)
 		WRITE_ONCE(ep->sync_master->sync_slave, ep);
 
-	usb_audio_dbg(ep->chip, "Starting %s EP 0x%x (count %d)\n",
-		      ep_type_name(ep->type), ep->ep_num, ep->use_count);
+	usb_audio_dbg(ep->chip, "Starting %s EP 0x%x (running %d)\n",
+		      ep_type_name(ep->type), ep->ep_num,
+		      atomic_read(&ep->running));
 
 	/* already running? */
-	if (++ep->use_count != 1)
+	if (atomic_inc_return(&ep->running) != 1)
 		return 0;
 
 	/* just to be sure */
@@ -1319,7 +1320,7 @@ int snd_usb_endpoint_start(struct snd_usb_endpoint *ep)
 	if (ep->sync_master)
 		WRITE_ONCE(ep->sync_master->sync_slave, NULL);
 	clear_bit(EP_FLAG_RUNNING, &ep->flags);
-	ep->use_count--;
+	atomic_dec(&ep->running);
 	deactivate_urbs(ep, false);
 	return -EPIPE;
 }
@@ -1329,7 +1330,7 @@ int snd_usb_endpoint_start(struct snd_usb_endpoint *ep)
  *
  * @ep: the endpoint to stop (may be NULL)
  *
- * A call to this function will decrement the use count of the endpoint.
+ * A call to this function will decrement the running count of the endpoint.
  * In case the last user has requested the endpoint stop, the URBs will
  * actually be deactivated.
  *
@@ -1343,16 +1344,17 @@ void snd_usb_endpoint_stop(struct snd_usb_endpoint *ep)
 	if (!ep)
 		return;
 
-	usb_audio_dbg(ep->chip, "Stopping %s EP 0x%x (count %d)\n",
-		      ep_type_name(ep->type), ep->ep_num, ep->use_count);
+	usb_audio_dbg(ep->chip, "Stopping %s EP 0x%x (running %d)\n",
+		      ep_type_name(ep->type), ep->ep_num,
+		      atomic_read(&ep->running));
 
-	if (snd_BUG_ON(ep->use_count == 0))
+	if (snd_BUG_ON(!atomic_read(&ep->running)))
 		return;
 
 	if (ep->sync_master)
 		WRITE_ONCE(ep->sync_master->sync_slave, NULL);
 
-	if (--ep->use_count == 0) {
+	if (!atomic_dec_return(&ep->running)) {
 		deactivate_urbs(ep, false);
 		set_bit(EP_FLAG_STOPPING, &ep->flags);
 	}
@@ -1363,7 +1365,7 @@ void snd_usb_endpoint_stop(struct snd_usb_endpoint *ep)
  *
  * @ep: the endpoint to release
  *
- * This function does not care for the endpoint's use count but will tear
+ * This function does not care for the endpoint's running count but will tear
  * down all the streaming URBs immediately.
  */
 void snd_usb_endpoint_release(struct snd_usb_endpoint *ep)
@@ -1410,7 +1412,7 @@ static void snd_usb_handle_sync_urb(struct snd_usb_endpoint *ep,
 	 * will take care of them later.
 	 */
 	if (snd_usb_endpoint_implicit_feedback_sink(ep) &&
-	    ep->use_count != 0) {
+	    atomic_read(&ep->running)) {
 
 		/* implicit feedback case */
 		int i, bytes = 0;
-- 
2.16.4

