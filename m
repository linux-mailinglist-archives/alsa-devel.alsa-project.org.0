Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFC541C053
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 10:11:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F147A169F;
	Wed, 29 Sep 2021 10:10:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F147A169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632903062;
	bh=DDmTN8mpcudd5apv0mX+JJVxmmzchMauTNyYAZ7cQ3o=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bRr95XwFMkm+/xplKtuK1MkUGCyt+txGg5777lmhw1OhfOXPkqEV4tKJ0/7TmreiO
	 MJN+JTrcI30M5U6U97VDgA1DAJs8UkBbs19adla7gH4e9DY6KWCcMSNOU79r/rLKc3
	 px075+QZUDhpircqjH8qlC2+kzoN5xB9H04LGQlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0471F804F2;
	Wed, 29 Sep 2021 10:09:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73C2BF804EC; Wed, 29 Sep 2021 10:09:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35DECF80227
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 10:08:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35DECF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="Z8lGC/3u"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="1N0CI9Y5"
Received: from relay1.suse.de (relay1.suse.de [149.44.160.133])
 by smtp-out1.suse.de (Postfix) with ESMTP id DFADF22531
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 08:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632902928; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=44i3fBlABMfkpKFb1FRDRrVSWyiqiWPJD3tF2CZ3Kno=;
 b=Z8lGC/3umxUkmaQxOQrSLsYi5ELvPz670cP776PXmdQx+R3pEtVJRAmAGGFMo4lrtF7WL5
 r5onJuRblJ43mJoRqQUYL97Okz8wCp4SLr21ynB5J6LQ8TbZbcRhayaHZWVm3z15kFxFvR
 9ccDq6kShlSrLBtEry3VHU2gve+few0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632902928;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=44i3fBlABMfkpKFb1FRDRrVSWyiqiWPJD3tF2CZ3Kno=;
 b=1N0CI9Y52bCqyr4sSe+ZyKWFw+zYDra2lF9G8RBeCX0pg4gVC7/HGNRfyM47JCVIxiGBS3
 cxwDw1nvTB4FxCDw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay1.suse.de (Postfix) with ESMTP id CF03225D65;
 Wed, 29 Sep 2021 08:08:48 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/9] ALSA: usb-audio: Check available frames for the next
 packet size
Date: Wed, 29 Sep 2021 10:08:41 +0200
Message-Id: <20210929080844.11583-7-tiwai@suse.de>
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

This is yet more preparation for the upcoming changes.

Extend snd_usb_endpoint_next_packet_size() to check the available
frames and return -EAGAIN if the next packet size is equal or exceeds
the given size.  This will be needed for avoiding XRUN during the low
latency operation.

As of this patch, avail=0 is passed, i.e. the check is skipped and no
behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 51 +++++++++++++++++++++++++++++++-------------
 sound/usb/endpoint.h |  3 ++-
 sound/usb/pcm.c      |  2 +-
 3 files changed, 39 insertions(+), 17 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 8e164d71d9ac..1f757a7eeafe 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -148,18 +148,23 @@ int snd_usb_endpoint_implicit_feedback_sink(struct snd_usb_endpoint *ep)
  * This won't be used for implicit feedback which takes the packet size
  * returned from the sync source
  */
-static int slave_next_packet_size(struct snd_usb_endpoint *ep)
+static int slave_next_packet_size(struct snd_usb_endpoint *ep,
+				  unsigned int avail)
 {
 	unsigned long flags;
+	unsigned int phase;
 	int ret;
 
 	if (ep->fill_max)
 		return ep->maxframesize;
 
 	spin_lock_irqsave(&ep->lock, flags);
-	ep->phase = (ep->phase & 0xffff)
-		+ (ep->freqm << ep->datainterval);
-	ret = min(ep->phase >> 16, ep->maxframesize);
+	phase = (ep->phase & 0xffff) + (ep->freqm << ep->datainterval);
+	ret = min(phase >> 16, ep->maxframesize);
+	if (avail && ret >= avail)
+		ret = -EAGAIN;
+	else
+		ep->phase = phase;
 	spin_unlock_irqrestore(&ep->lock, flags);
 
 	return ret;
@@ -169,20 +174,25 @@ static int slave_next_packet_size(struct snd_usb_endpoint *ep)
  * Return the number of samples to be sent in the next packet
  * for adaptive and synchronous endpoints
  */
-static int next_packet_size(struct snd_usb_endpoint *ep)
+static int next_packet_size(struct snd_usb_endpoint *ep, unsigned int avail)
 {
+	unsigned int sample_accum;
 	int ret;
 
 	if (ep->fill_max)
 		return ep->maxframesize;
 
-	ep->sample_accum += ep->sample_rem;
-	if (ep->sample_accum >= ep->pps) {
-		ep->sample_accum -= ep->pps;
+	sample_accum += ep->sample_rem;
+	if (sample_accum >= ep->pps) {
+		sample_accum -= ep->pps;
 		ret = ep->packsize[1];
 	} else {
 		ret = ep->packsize[0];
 	}
+	if (avail && ret >= avail)
+		ret = -EAGAIN;
+	else
+		ep->sample_accum = sample_accum;
 
 	return ret;
 }
@@ -190,16 +200,27 @@ static int next_packet_size(struct snd_usb_endpoint *ep)
 /*
  * snd_usb_endpoint_next_packet_size: Return the number of samples to be sent
  * in the next packet
+ *
+ * If the size is equal or exceeds @avail, don't proceed but return -EAGAIN
+ * Exception: @avail = 0 for skipping the check.
  */
 int snd_usb_endpoint_next_packet_size(struct snd_usb_endpoint *ep,
-				      struct snd_urb_ctx *ctx, int idx)
+				      struct snd_urb_ctx *ctx, int idx,
+				      unsigned int avail)
 {
-	if (ctx->packet_size[idx])
-		return ctx->packet_size[idx];
-	else if (ep->sync_source)
-		return slave_next_packet_size(ep);
+	unsigned int packet;
+
+	packet = ctx->packet_size[idx];
+	if (packet) {
+		if (avail && packet >= avail)
+			return -EAGAIN;
+		return packet;
+	}
+
+	if (ep->sync_source)
+		return slave_next_packet_size(ep, avail);
 	else
-		return next_packet_size(ep);
+		return next_packet_size(ep, avail);
 }
 
 static void call_retire_callback(struct snd_usb_endpoint *ep,
@@ -263,7 +284,7 @@ static void prepare_silent_urb(struct snd_usb_endpoint *ep,
 		unsigned int length;
 		int counts;
 
-		counts = snd_usb_endpoint_next_packet_size(ep, ctx, i);
+		counts = snd_usb_endpoint_next_packet_size(ep, ctx, i, 0);
 		length = counts * ep->stride; /* number of silent bytes */
 		offset = offs * ep->stride + extra * i;
 		urb->iso_frame_desc[i].offset = offset;
diff --git a/sound/usb/endpoint.h b/sound/usb/endpoint.h
index a1099ec37e1c..1f1a72535a64 100644
--- a/sound/usb/endpoint.h
+++ b/sound/usb/endpoint.h
@@ -46,6 +46,7 @@ void snd_usb_endpoint_free_all(struct snd_usb_audio *chip);
 
 int snd_usb_endpoint_implicit_feedback_sink(struct snd_usb_endpoint *ep);
 int snd_usb_endpoint_next_packet_size(struct snd_usb_endpoint *ep,
-				      struct snd_urb_ctx *ctx, int idx);
+				      struct snd_urb_ctx *ctx, int idx,
+				      unsigned int avail);
 
 #endif /* __USBAUDIO_ENDPOINT_H */
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index ec7eeb1b82b8..8ad48c35c559 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -1365,7 +1365,7 @@ static void prepare_playback_urb(struct snd_usb_substream *subs,
 	spin_lock_irqsave(&subs->lock, flags);
 	subs->frame_limit += ep->max_urb_frames;
 	for (i = 0; i < ctx->packets; i++) {
-		counts = snd_usb_endpoint_next_packet_size(ep, ctx, i);
+		counts = snd_usb_endpoint_next_packet_size(ep, ctx, i, 0);
 		/* set up descriptor */
 		urb->iso_frame_desc[i].offset = frames * stride;
 		urb->iso_frame_desc[i].length = counts * stride;
-- 
2.26.2

