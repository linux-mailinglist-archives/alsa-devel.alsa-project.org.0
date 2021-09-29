Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 634A141C05A
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 10:12:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC8ED16A9;
	Wed, 29 Sep 2021 10:11:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC8ED16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632903142;
	bh=sa6+IAMH2IQ4y1e77VedA4piUsiMt3thEE+QaCSS+hA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qe8BteQ5BDtUytpI0O8ZifqZCljt5oBoqSNtJgv72Nd038GBVfeRk7+fzTUD2lHL5
	 tMsBqD/FWjP2d3pIa+L07GFyAMeSB8m1EiGz2CMaQV5BoqVpDFQMeTDf3OBva5iEgj
	 5Tp/4KXuSj6aHLCgDFsnckq3ZYbo6d6OWf/LO07Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10F8EF80517;
	Wed, 29 Sep 2021 10:09:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1C41F804FA; Wed, 29 Sep 2021 10:09:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F40CF80161
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 10:08:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F40CF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="H+/W2KY/"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="rH0x4OOI"
Received: from relay1.suse.de (relay1.suse.de [149.44.160.133])
 by smtp-out1.suse.de (Postfix) with ESMTP id 1A9D622533
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 08:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632902929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OVMKSpnQqZuBPveHYDm6qGTNYPO6pzyFKD7aS5uAnEM=;
 b=H+/W2KY/6xO1mfdo2g0/tGYyiwtZFfeQP2hGBMTurx8UFTIeHPwgRjzbbZiDRnQVhMZ16u
 6XW9jtDtw5Gz2vnMTbt3CEKmIj7g9CcbVe+5MeQPlco8A5+5MR+jchePbrUeKC3FOi3Vzc
 OHdp5ykny7wYq58BgieiSuxqTet3ldQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632902929;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OVMKSpnQqZuBPveHYDm6qGTNYPO6pzyFKD7aS5uAnEM=;
 b=rH0x4OOIwuvceKJkJfUU8WIajzz01q5Rjo33Yb58xEUNMBJRqr6Ks/qQz1EeCJg1l4R1Ha
 qt34h6FHrF3J5HBw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay1.suse.de (Postfix) with ESMTP id 0AA4025D63;
 Wed, 29 Sep 2021 08:08:49 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 9/9] ALSA: usb-audio: Avoid killing in-flight URBs during
 draining
Date: Wed, 29 Sep 2021 10:08:44 +0200
Message-Id: <20210929080844.11583-10-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210929080844.11583-1-tiwai@suse.de>
References: <20210929080844.11583-1-tiwai@suse.de>
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

While draining a stream, ALSA PCM core stops the stream by issuing
snd_pcm_stop() after all data has been sent out.  And, at PCM trigger
stop, currently USB-audio driver kills the in-flight URBs explicitly,
then at sync-stop ops, sync with the finish of all remaining URBs.
This might result in a drop of the drained samples as most of
USB-audio devices / hosts allow relatively long in-flight samples (as
a sort of FIFO).

For avoiding the trimming, this patch changes the stream-stop behavior
during PCM draining state.  Under that condition, the pending URBs
won't be killed.  The leftover in-flight URBs are caught by the
sync-stop operation that shall be performed after the trigger-stop
operation.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 14 +++++++++-----
 sound/usb/endpoint.h |  2 +-
 sound/usb/pcm.c      | 16 ++++++++--------
 3 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 0b336876e36d..42c0d2db8ba8 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -955,7 +955,7 @@ void snd_usb_endpoint_sync_pending_stop(struct snd_usb_endpoint *ep)
  *
  * This function moves the EP to STOPPING state if it's being RUNNING.
  */
-static int stop_urbs(struct snd_usb_endpoint *ep, bool force)
+static int stop_urbs(struct snd_usb_endpoint *ep, bool force, bool keep_pending)
 {
 	unsigned int i;
 	unsigned long flags;
@@ -972,6 +972,9 @@ static int stop_urbs(struct snd_usb_endpoint *ep, bool force)
 	ep->next_packet_queued = 0;
 	spin_unlock_irqrestore(&ep->lock, flags);
 
+	if (keep_pending)
+		return 0;
+
 	for (i = 0; i < ep->nurbs; i++) {
 		if (test_bit(i, &ep->active_mask)) {
 			if (!test_and_set_bit(i, &ep->unlink_mask)) {
@@ -995,7 +998,7 @@ static int release_urbs(struct snd_usb_endpoint *ep, bool force)
 	snd_usb_endpoint_set_callback(ep, NULL, NULL, NULL);
 
 	/* stop and unlink urbs */
-	err = stop_urbs(ep, force);
+	err = stop_urbs(ep, force, false);
 	if (err)
 		return err;
 
@@ -1527,7 +1530,7 @@ int snd_usb_endpoint_start(struct snd_usb_endpoint *ep)
 	return 0;
 
 __error:
-	snd_usb_endpoint_stop(ep);
+	snd_usb_endpoint_stop(ep, false);
 	return -EPIPE;
 }
 
@@ -1535,6 +1538,7 @@ int snd_usb_endpoint_start(struct snd_usb_endpoint *ep)
  * snd_usb_endpoint_stop: stop an snd_usb_endpoint
  *
  * @ep: the endpoint to stop (may be NULL)
+ * @keep_pending: keep in-flight URBs
  *
  * A call to this function will decrement the running count of the endpoint.
  * In case the last user has requested the endpoint stop, the URBs will
@@ -1545,7 +1549,7 @@ int snd_usb_endpoint_start(struct snd_usb_endpoint *ep)
  * The caller needs to synchronize the pending stop operation via
  * snd_usb_endpoint_sync_pending_stop().
  */
-void snd_usb_endpoint_stop(struct snd_usb_endpoint *ep)
+void snd_usb_endpoint_stop(struct snd_usb_endpoint *ep, bool keep_pending)
 {
 	if (!ep)
 		return;
@@ -1560,7 +1564,7 @@ void snd_usb_endpoint_stop(struct snd_usb_endpoint *ep)
 	if (!atomic_dec_return(&ep->running)) {
 		if (ep->sync_source)
 			WRITE_ONCE(ep->sync_source->sync_sink, NULL);
-		stop_urbs(ep, false);
+		stop_urbs(ep, false, keep_pending);
 	}
 }
 
diff --git a/sound/usb/endpoint.h b/sound/usb/endpoint.h
index 6895d50d14d1..6a9af04cf175 100644
--- a/sound/usb/endpoint.h
+++ b/sound/usb/endpoint.h
@@ -38,7 +38,7 @@ void snd_usb_endpoint_set_callback(struct snd_usb_endpoint *ep,
 				   struct snd_usb_substream *data_subs);
 
 int snd_usb_endpoint_start(struct snd_usb_endpoint *ep);
-void snd_usb_endpoint_stop(struct snd_usb_endpoint *ep);
+void snd_usb_endpoint_stop(struct snd_usb_endpoint *ep, bool keep_pending);
 void snd_usb_endpoint_sync_pending_stop(struct snd_usb_endpoint *ep);
 void snd_usb_endpoint_suspend(struct snd_usb_endpoint *ep);
 int  snd_usb_endpoint_activate(struct snd_usb_endpoint *ep);
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index d5a14e5b9ad3..f09c7380a923 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -219,16 +219,16 @@ int snd_usb_init_pitch(struct snd_usb_audio *chip,
 	return 0;
 }
 
-static bool stop_endpoints(struct snd_usb_substream *subs)
+static bool stop_endpoints(struct snd_usb_substream *subs, bool keep_pending)
 {
 	bool stopped = 0;
 
 	if (test_and_clear_bit(SUBSTREAM_FLAG_SYNC_EP_STARTED, &subs->flags)) {
-		snd_usb_endpoint_stop(subs->sync_endpoint);
+		snd_usb_endpoint_stop(subs->sync_endpoint, keep_pending);
 		stopped = true;
 	}
 	if (test_and_clear_bit(SUBSTREAM_FLAG_DATA_EP_STARTED, &subs->flags)) {
-		snd_usb_endpoint_stop(subs->data_endpoint);
+		snd_usb_endpoint_stop(subs->data_endpoint, keep_pending);
 		stopped = true;
 	}
 	return stopped;
@@ -261,7 +261,7 @@ static int start_endpoints(struct snd_usb_substream *subs)
 	return 0;
 
  error:
-	stop_endpoints(subs);
+	stop_endpoints(subs, false);
 	return err;
 }
 
@@ -437,7 +437,7 @@ static int configure_endpoints(struct snd_usb_audio *chip,
 
 	if (subs->data_endpoint->need_setup) {
 		/* stop any running stream beforehand */
-		if (stop_endpoints(subs))
+		if (stop_endpoints(subs, false))
 			sync_pending_stops(subs);
 		err = snd_usb_endpoint_configure(chip, subs->data_endpoint);
 		if (err < 0)
@@ -572,7 +572,7 @@ static int snd_usb_hw_free(struct snd_pcm_substream *substream)
 	subs->cur_audiofmt = NULL;
 	mutex_unlock(&chip->mutex);
 	if (!snd_usb_lock_shutdown(chip)) {
-		if (stop_endpoints(subs))
+		if (stop_endpoints(subs, false))
 			sync_pending_stops(subs);
 		close_endpoints(chip, subs);
 		snd_usb_unlock_shutdown(chip);
@@ -1559,7 +1559,7 @@ static int snd_usb_substream_playback_trigger(struct snd_pcm_substream *substrea
 		return 0;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
-		stop_endpoints(subs);
+		stop_endpoints(subs, substream->runtime->status->state == SNDRV_PCM_STATE_DRAINING);
 		snd_usb_endpoint_set_callback(subs->data_endpoint,
 					      NULL, NULL, NULL);
 		subs->running = 0;
@@ -1607,7 +1607,7 @@ static int snd_usb_substream_capture_trigger(struct snd_pcm_substream *substream
 		return 0;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
-		stop_endpoints(subs);
+		stop_endpoints(subs, false);
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		snd_usb_endpoint_set_callback(subs->data_endpoint,
-- 
2.26.2

