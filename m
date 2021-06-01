Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10016397800
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 18:26:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 991B716DB;
	Tue,  1 Jun 2021 18:25:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 991B716DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622564798;
	bh=VrseM5FpkCAFR4lkbDaSP+JIGI0Ijvnf++JHBEdvkxs=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V8XQZQxnazeCaaQV0CVAdymDfMX/aU66G2Qg282RmLlXrwxG2By4UIe4E3TAK03OE
	 9y4E0ZukJIdQLVoeGG8+qoqghYeWylVqGDSKuYN/9PjSaSD11UV2WrnjMw8E3A+Vcl
	 lWtR9FWKHfosPl01DiMFhT0+JZiivSGaxTkopIOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32ADEF80269;
	Tue,  1 Jun 2021 18:25:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 402E1F804B0; Tue,  1 Jun 2021 18:25:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D40F1F800B2
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 18:24:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D40F1F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="dOPIUvbJ"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="8RDhxjbC"
Received: from relay2.suse.de (unknown [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id AADF721962
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 16:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622564698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/0YFotyzjNX0LaaqZyHwENV/YIVPfrs9t3MrkdeGork=;
 b=dOPIUvbJqYxn6z6eISze4DlQIWDgkMdgK/yZTLmAcGaN5O6zKi85vOAduth38/qUxw3Uo4
 xgdZrBgvviNb9B4ct1MICqpKPunUWolHUjVvN+fXbVSvwEPC13UdR4mnA11vilcZOPa98P
 I4njE7UUThOrnSLKXbrTtcfeQiZM/Rk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622564698;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/0YFotyzjNX0LaaqZyHwENV/YIVPfrs9t3MrkdeGork=;
 b=8RDhxjbCM9UJz0HhDaQ4mNfZeWC9Lf+1rDVk9G+/APTxuzgRwy3ehHHjgwXc1fLU3YxvOC
 O0zdQ0M91iHl3rDA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 99177A3B84;
 Tue,  1 Jun 2021 16:24:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/5] ALSA: usb-audio: Pre-calculate buffer byte size
Date: Tue,  1 Jun 2021 18:24:54 +0200
Message-Id: <20210601162457.4877-3-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601162457.4877-1-tiwai@suse.de>
References: <20210601162457.4877-1-tiwai@suse.de>
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

There are a bunch of lines calculating the buffer size in bytes at
each time.  Keep the value in subs->buffer_bytes and use it
consistently for the code simplicity.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.h |  1 +
 sound/usb/pcm.c  | 48 ++++++++++++++++++++++++------------------------
 2 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index a741e7da83a2..b346653d4b76 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -158,6 +158,7 @@ struct snd_usb_substream {
 
 	unsigned int running: 1;	/* running status */
 
+	unsigned int buffer_bytes;	/* buffer size in bytes */
 	unsigned int hwptr_done;	/* processed byte position in the buffer */
 	unsigned int transfer_done;		/* processed frames since last period update */
 	unsigned int frame_limit;	/* limits number of packets in URB */
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 359c759a7023..e8121af8e1d5 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -600,6 +600,7 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
 		goto unlock;
 
 	/* reset the pointer */
+	subs->buffer_bytes = frames_to_bytes(runtime, runtime->buffer_size);
 	subs->hwptr_done = 0;
 	subs->transfer_done = 0;
 	subs->last_delay = 0;
@@ -1147,8 +1148,8 @@ static void retire_capture_urb(struct snd_usb_substream *subs,
 		spin_lock_irqsave(&subs->lock, flags);
 		oldptr = subs->hwptr_done;
 		subs->hwptr_done += bytes;
-		if (subs->hwptr_done >= runtime->buffer_size * stride)
-			subs->hwptr_done -= runtime->buffer_size * stride;
+		if (subs->hwptr_done >= subs->buffer_bytes)
+			subs->hwptr_done -= subs->buffer_bytes;
 		frames = (bytes + (oldptr % stride)) / stride;
 		subs->transfer_done += frames;
 		if (subs->transfer_done >= runtime->period_size) {
@@ -1166,9 +1167,9 @@ static void retire_capture_urb(struct snd_usb_substream *subs,
 
 		spin_unlock_irqrestore(&subs->lock, flags);
 		/* copy a data chunk */
-		if (oldptr + bytes > runtime->buffer_size * stride) {
-			unsigned int bytes1 =
-					runtime->buffer_size * stride - oldptr;
+		if (oldptr + bytes > subs->buffer_bytes) {
+			unsigned int bytes1 = subs->buffer_bytes - oldptr;
+
 			memcpy(runtime->dma_area + oldptr, cp, bytes1);
 			memcpy(runtime->dma_area, cp + bytes1, bytes - bytes1);
 		} else {
@@ -1184,10 +1185,9 @@ static inline void fill_playback_urb_dsd_dop(struct snd_usb_substream *subs,
 					     struct urb *urb, unsigned int bytes)
 {
 	struct snd_pcm_runtime *runtime = subs->pcm_substream->runtime;
-	unsigned int stride = runtime->frame_bits >> 3;
 	unsigned int dst_idx = 0;
 	unsigned int src_idx = subs->hwptr_done;
-	unsigned int wrap = runtime->buffer_size * stride;
+	unsigned int wrap = subs->buffer_bytes;
 	u8 *dst = urb->transfer_buffer;
 	u8 *src = runtime->dma_area;
 	u8 marker[] = { 0x05, 0xfa };
@@ -1233,8 +1233,8 @@ static inline void fill_playback_urb_dsd_dop(struct snd_usb_substream *subs,
 			subs->hwptr_done++;
 		}
 	}
-	if (subs->hwptr_done >= runtime->buffer_size * stride)
-		subs->hwptr_done -= runtime->buffer_size * stride;
+	if (subs->hwptr_done >= subs->buffer_bytes)
+		subs->hwptr_done -= subs->buffer_bytes;
 }
 
 static void copy_to_urb(struct snd_usb_substream *subs, struct urb *urb,
@@ -1242,10 +1242,10 @@ static void copy_to_urb(struct snd_usb_substream *subs, struct urb *urb,
 {
 	struct snd_pcm_runtime *runtime = subs->pcm_substream->runtime;
 
-	if (subs->hwptr_done + bytes > runtime->buffer_size * stride) {
+	if (subs->hwptr_done + bytes > subs->buffer_bytes) {
 		/* err, the transferred area goes over buffer boundary. */
-		unsigned int bytes1 =
-			runtime->buffer_size * stride - subs->hwptr_done;
+		unsigned int bytes1 = subs->buffer_bytes - subs->hwptr_done;
+
 		memcpy(urb->transfer_buffer + offset,
 		       runtime->dma_area + subs->hwptr_done, bytes1);
 		memcpy(urb->transfer_buffer + offset + bytes1,
@@ -1255,8 +1255,8 @@ static void copy_to_urb(struct snd_usb_substream *subs, struct urb *urb,
 		       runtime->dma_area + subs->hwptr_done, bytes);
 	}
 	subs->hwptr_done += bytes;
-	if (subs->hwptr_done >= runtime->buffer_size * stride)
-		subs->hwptr_done -= runtime->buffer_size * stride;
+	if (subs->hwptr_done >= subs->buffer_bytes)
+		subs->hwptr_done -= subs->buffer_bytes;
 }
 
 static unsigned int copy_to_urb_quirk(struct snd_usb_substream *subs,
@@ -1295,7 +1295,7 @@ static void prepare_playback_urb(struct snd_usb_substream *subs,
 	int i, stride, period_elapsed = 0;
 	unsigned long flags;
 
-	stride = runtime->frame_bits >> 3;
+	stride = ep->stride;
 
 	frames = 0;
 	urb->number_of_packets = 0;
@@ -1304,8 +1304,8 @@ static void prepare_playback_urb(struct snd_usb_substream *subs,
 	for (i = 0; i < ctx->packets; i++) {
 		counts = snd_usb_endpoint_next_packet_size(ep, ctx, i);
 		/* set up descriptor */
-		urb->iso_frame_desc[i].offset = frames * ep->stride;
-		urb->iso_frame_desc[i].length = counts * ep->stride;
+		urb->iso_frame_desc[i].offset = frames * stride;
+		urb->iso_frame_desc[i].length = counts * stride;
 		frames += counts;
 		urb->number_of_packets++;
 		subs->transfer_done += counts;
@@ -1320,14 +1320,14 @@ static void prepare_playback_urb(struct snd_usb_substream *subs,
 					frames -= subs->transfer_done;
 					counts -= subs->transfer_done;
 					urb->iso_frame_desc[i].length =
-						counts * ep->stride;
+						counts * stride;
 					subs->transfer_done = 0;
 				}
 				i++;
 				if (i < ctx->packets) {
 					/* add a transfer delimiter */
 					urb->iso_frame_desc[i].offset =
-						frames * ep->stride;
+						frames * stride;
 					urb->iso_frame_desc[i].length = 0;
 					urb->number_of_packets++;
 				}
@@ -1340,7 +1340,7 @@ static void prepare_playback_urb(struct snd_usb_substream *subs,
 		    !snd_usb_endpoint_implicit_feedback_sink(ep))
 			break;
 	}
-	bytes = frames * ep->stride;
+	bytes = frames * stride;
 
 	if (unlikely(ep->cur_format == SNDRV_PCM_FORMAT_DSD_U16_LE &&
 		     subs->cur_audiofmt->dsd_dop)) {
@@ -1350,14 +1350,14 @@ static void prepare_playback_urb(struct snd_usb_substream *subs,
 		/* bit-reverse the bytes */
 		u8 *buf = urb->transfer_buffer;
 		for (i = 0; i < bytes; i++) {
-			int idx = (subs->hwptr_done + i)
-				% (runtime->buffer_size * stride);
+			int idx = (subs->hwptr_done + i) % subs->buffer_bytes;
+
 			buf[i] = bitrev8(runtime->dma_area[idx]);
 		}
 
 		subs->hwptr_done += bytes;
-		if (subs->hwptr_done >= runtime->buffer_size * stride)
-			subs->hwptr_done -= runtime->buffer_size * stride;
+		if (subs->hwptr_done >= subs->buffer_bytes)
+			subs->hwptr_done -= subs->buffer_bytes;
 	} else {
 		/* usual PCM */
 		if (!subs->tx_length_quirk)
-- 
2.26.2

