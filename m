Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2B3397808
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 18:27:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAF5A1687;
	Tue,  1 Jun 2021 18:26:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAF5A1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622564861;
	bh=oZYJOMquk0FhzBFezaO6SDfgrOwKPcpM3mHfF5ELKEE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aWwaFcn+Ob0aaAFaVCWkF5G1O9O9KAUiPuZlNTCB0GHUUEPW7NtdI27JZ45wW44Pk
	 bv66fIWf/G+irBNijqy7b1jF1PSZsKSgMlEDdrAL97f1I0GtrvaVAACaICHOMrd2HF
	 e/e3dvsFaGKkWE06k51FWHgMslvv1VkaXPpsXjnU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A0E5F804C3;
	Tue,  1 Jun 2021 18:25:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D76EF804CB; Tue,  1 Jun 2021 18:25:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3409F8025B
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 18:24:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3409F8025B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="BA1xBJTF"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="1abwnFIq"
Received: from relay2.suse.de (unknown [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id AF2201FD4C
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 16:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622564698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MtAvfreVllcyN6I1H6OT4sDGvfDXFw/DB9rRHUWamlI=;
 b=BA1xBJTFTWZ0+a4AedTzTBAJa+w0Pcre47MvoPGDD48gsj6O7hl3PSl4zO9s3kXIRCJGJs
 nPWleBlsXQwo7+TdmjCrMtILlCfVoqNUt3yLzmEwnB0GjvN1geSfHtn3vMco0WOfElgXKh
 iNXZBte594hbuISi8wjNiZLcwYgOEg8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622564698;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MtAvfreVllcyN6I1H6OT4sDGvfDXFw/DB9rRHUWamlI=;
 b=1abwnFIq2iu670XLbMxnYvhx0uKL50H9dhQ1aLxJzJESb41HhzWAKAFnE1BF2DlhNjOwb4
 CMbZB8c9M1GKNwAQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id A83BCA3B87;
 Tue,  1 Jun 2021 16:24:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/5] ALSA: usb-audio: Refactoring delay account code
Date: Tue,  1 Jun 2021 18:24:55 +0200
Message-Id: <20210601162457.4877-4-tiwai@suse.de>
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

The PCM delay accounting in USB-audio driver is a bit complex to
follow, and this is an attempt to improve the readability and provide
some potential fix.

Basically, the PCM position delay is calculated from two factors: the
in-flight data on URBs and the USB frame counter.  For the playback
stream, we advance the hwptr already at submitting URBs.  Those
"in-flight" data amount is now tracked, and this is used as the base
value for the PCM delay correction.  The in-flight data is decreased
again at URB completion in return.  For the capture stream, OTOH,
there is no in-flight data, hence the delay base is zero.

The USB frame counter is used in addition for correcting the current
position.  The reference frame counter is updated at each submission
and receiving time, and the difference from the current counter value
is taken into account.

In this patch, each in-flight data bytes is recorded in the new
snd_usb_ctx.queued field, and the total in-flight amount is tracked in
snd_usb_substream.inflight_bytes field, as the replacement of
last_delay field.

Note that updating the hwptr after URB completion doesn't work for
PulseAudio who tries to scratch the buffer on the fly; USB-audio is
basically a double-buffer implementation, hence the scratching the
buffer can't work for the already submitted data.  So we always update
hwptr beforehand.  It's not ideal, but the delay account should give
enough correctness.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.h     |   7 ++-
 sound/usb/endpoint.c |   1 +
 sound/usb/pcm.c      | 128 +++++++++++++++++--------------------------
 3 files changed, 56 insertions(+), 80 deletions(-)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index b346653d4b76..5577a776561b 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -54,6 +54,7 @@ struct snd_urb_ctx {
 	struct snd_usb_endpoint *ep;
 	int index;	/* index for urb array */
 	int packets;	/* number of packets per urb */
+	int queued;	/* queued data bytes by this urb */
 	int packet_size[MAX_PACKS_HS]; /* size of packets for next submission */
 	struct list_head ready_list;
 };
@@ -159,8 +160,9 @@ struct snd_usb_substream {
 	unsigned int running: 1;	/* running status */
 
 	unsigned int buffer_bytes;	/* buffer size in bytes */
+	unsigned int inflight_bytes;	/* in-flight data bytes on buffer (for playback) */
 	unsigned int hwptr_done;	/* processed byte position in the buffer */
-	unsigned int transfer_done;		/* processed frames since last period update */
+	unsigned int transfer_done;	/* processed frames since last period update */
 	unsigned int frame_limit;	/* limits number of packets in URB */
 
 	/* data and sync endpoints for this stream */
@@ -175,8 +177,7 @@ struct snd_usb_substream {
 	struct list_head fmt_list;	/* format list */
 	spinlock_t lock;
 
-	int last_frame_number;          /* stored frame number */
-	int last_delay;                 /* stored delay */
+	unsigned int last_frame_number;	/* stored frame number */
 
 	struct {
 		int marker;
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 014c43862826..da649211bff3 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -275,6 +275,7 @@ static void prepare_silent_urb(struct snd_usb_endpoint *ep,
 
 	urb->number_of_packets = ctx->packets;
 	urb->transfer_buffer_length = offs * ep->stride + ctx->packets * extra;
+	ctx->queued = 0;
 }
 
 /*
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index e8121af8e1d5..8ee45f2e8dce 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -30,14 +30,20 @@
 
 /* return the estimated delay based on USB frame counters */
 static snd_pcm_uframes_t snd_usb_pcm_delay(struct snd_usb_substream *subs,
-					   unsigned int rate)
+					   struct snd_pcm_runtime *runtime)
 {
-	int current_frame_number;
-	int frame_diff;
+	unsigned int current_frame_number;
+	unsigned int frame_diff;
 	int est_delay;
+	int queued;
 
-	if (!subs->last_delay)
-		return 0; /* short path */
+	if (subs->direction == SNDRV_PCM_STREAM_PLAYBACK) {
+		queued = bytes_to_frames(runtime, subs->inflight_bytes);
+		if (!queued)
+			return 0;
+	} else if (!subs->running) {
+		return 0;
+	}
 
 	current_frame_number = usb_get_current_frame_number(subs->dev);
 	/*
@@ -49,14 +55,14 @@ static snd_pcm_uframes_t snd_usb_pcm_delay(struct snd_usb_substream *subs,
 
 	/* Approximation based on number of samples per USB frame (ms),
 	   some truncation for 44.1 but the estimate is good enough */
-	est_delay =  frame_diff * rate / 1000;
-	if (subs->direction == SNDRV_PCM_STREAM_PLAYBACK)
-		est_delay = subs->last_delay - est_delay;
-	else
-		est_delay = subs->last_delay + est_delay;
+	est_delay = frame_diff * runtime->rate / 1000;
+
+	if (subs->direction == SNDRV_PCM_STREAM_PLAYBACK) {
+		est_delay = queued - est_delay;
+		if (est_delay < 0)
+			est_delay = 0;
+	}
 
-	if (est_delay < 0)
-		est_delay = 0;
 	return est_delay;
 }
 
@@ -65,17 +71,17 @@ static snd_pcm_uframes_t snd_usb_pcm_delay(struct snd_usb_substream *subs,
  */
 static snd_pcm_uframes_t snd_usb_pcm_pointer(struct snd_pcm_substream *substream)
 {
-	struct snd_usb_substream *subs = substream->runtime->private_data;
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_usb_substream *subs = runtime->private_data;
 	unsigned int hwptr_done;
 
 	if (atomic_read(&subs->stream->chip->shutdown))
 		return SNDRV_PCM_POS_XRUN;
 	spin_lock(&subs->lock);
 	hwptr_done = subs->hwptr_done;
-	substream->runtime->delay = snd_usb_pcm_delay(subs,
-						substream->runtime->rate);
+	runtime->delay = snd_usb_pcm_delay(subs, runtime);
 	spin_unlock(&subs->lock);
-	return hwptr_done / (substream->runtime->frame_bits >> 3);
+	return bytes_to_frames(runtime, hwptr_done);
 }
 
 /*
@@ -601,9 +607,9 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
 
 	/* reset the pointer */
 	subs->buffer_bytes = frames_to_bytes(runtime, runtime->buffer_size);
+	subs->inflight_bytes = 0;
 	subs->hwptr_done = 0;
 	subs->transfer_done = 0;
-	subs->last_delay = 0;
 	subs->last_frame_number = 0;
 	runtime->delay = 0;
 
@@ -1156,14 +1162,9 @@ static void retire_capture_urb(struct snd_usb_substream *subs,
 			subs->transfer_done -= runtime->period_size;
 			period_elapsed = 1;
 		}
-		/* capture delay is by construction limited to one URB,
-		 * reset delays here
-		 */
-		runtime->delay = subs->last_delay = 0;
 
 		/* realign last_frame_number */
 		subs->last_frame_number = current_frame_number;
-		subs->last_frame_number &= 0xFF; /* keep 8 LSBs */
 
 		spin_unlock_irqrestore(&subs->lock, flags);
 		/* copy a data chunk */
@@ -1181,6 +1182,18 @@ static void retire_capture_urb(struct snd_usb_substream *subs,
 		snd_pcm_period_elapsed(subs->pcm_substream);
 }
 
+static void urb_ctx_queue_advance(struct snd_usb_substream *subs,
+				  struct urb *urb, unsigned int bytes)
+{
+	struct snd_urb_ctx *ctx = urb->context;
+
+	ctx->queued += bytes;
+	subs->inflight_bytes += bytes;
+	subs->hwptr_done += bytes;
+	if (subs->hwptr_done >= subs->buffer_bytes)
+		subs->hwptr_done -= subs->buffer_bytes;
+}
+
 static inline void fill_playback_urb_dsd_dop(struct snd_usb_substream *subs,
 					     struct urb *urb, unsigned int bytes)
 {
@@ -1191,6 +1204,7 @@ static inline void fill_playback_urb_dsd_dop(struct snd_usb_substream *subs,
 	u8 *dst = urb->transfer_buffer;
 	u8 *src = runtime->dma_area;
 	u8 marker[] = { 0x05, 0xfa };
+	unsigned int queued = 0;
 
 	/*
 	 * The DSP DOP format defines a way to transport DSD samples over
@@ -1229,12 +1243,11 @@ static inline void fill_playback_urb_dsd_dop(struct snd_usb_substream *subs,
 				dst[dst_idx++] = bitrev8(src[idx]);
 			else
 				dst[dst_idx++] = src[idx];
-
-			subs->hwptr_done++;
+			queued++;
 		}
 	}
-	if (subs->hwptr_done >= subs->buffer_bytes)
-		subs->hwptr_done -= subs->buffer_bytes;
+
+	urb_ctx_queue_advance(subs, urb, queued);
 }
 
 static void copy_to_urb(struct snd_usb_substream *subs, struct urb *urb,
@@ -1254,9 +1267,8 @@ static void copy_to_urb(struct snd_usb_substream *subs, struct urb *urb,
 		memcpy(urb->transfer_buffer + offset,
 		       runtime->dma_area + subs->hwptr_done, bytes);
 	}
-	subs->hwptr_done += bytes;
-	if (subs->hwptr_done >= subs->buffer_bytes)
-		subs->hwptr_done -= subs->buffer_bytes;
+
+	urb_ctx_queue_advance(subs, urb, bytes);
 }
 
 static unsigned int copy_to_urb_quirk(struct snd_usb_substream *subs,
@@ -1298,6 +1310,7 @@ static void prepare_playback_urb(struct snd_usb_substream *subs,
 	stride = ep->stride;
 
 	frames = 0;
+	ctx->queued = 0;
 	urb->number_of_packets = 0;
 	spin_lock_irqsave(&subs->lock, flags);
 	subs->frame_limit += ep->max_urb_frames;
@@ -1355,9 +1368,7 @@ static void prepare_playback_urb(struct snd_usb_substream *subs,
 			buf[i] = bitrev8(runtime->dma_area[idx]);
 		}
 
-		subs->hwptr_done += bytes;
-		if (subs->hwptr_done >= subs->buffer_bytes)
-			subs->hwptr_done -= subs->buffer_bytes;
+		urb_ctx_queue_advance(subs, urb, bytes);
 	} else {
 		/* usual PCM */
 		if (!subs->tx_length_quirk)
@@ -1367,14 +1378,7 @@ static void prepare_playback_urb(struct snd_usb_substream *subs,
 			/* bytes is now amount of outgoing data */
 	}
 
-	/* update delay with exact number of samples queued */
-	runtime->delay = subs->last_delay;
-	runtime->delay += frames;
-	subs->last_delay = runtime->delay;
-
-	/* realign last_frame_number */
 	subs->last_frame_number = usb_get_current_frame_number(subs->dev);
-	subs->last_frame_number &= 0xFF; /* keep 8 LSBs */
 
 	if (subs->trigger_tstamp_pending_update) {
 		/* this is the first actual URB submitted,
@@ -1398,48 +1402,17 @@ static void retire_playback_urb(struct snd_usb_substream *subs,
 			       struct urb *urb)
 {
 	unsigned long flags;
-	struct snd_pcm_runtime *runtime = subs->pcm_substream->runtime;
-	struct snd_usb_endpoint *ep = subs->data_endpoint;
-	int processed = urb->transfer_buffer_length / ep->stride;
-	int est_delay;
-
-	/* ignore the delay accounting when processed=0 is given, i.e.
-	 * silent payloads are processed before handling the actual data
-	 */
-	if (!processed)
-		return;
+	struct snd_urb_ctx *ctx = urb->context;
 
 	spin_lock_irqsave(&subs->lock, flags);
-	if (!subs->last_delay)
-		goto out; /* short path */
-
-	est_delay = snd_usb_pcm_delay(subs, runtime->rate);
-	/* update delay with exact number of samples played */
-	if (processed > subs->last_delay)
-		subs->last_delay = 0;
-	else
-		subs->last_delay -= processed;
-	runtime->delay = subs->last_delay;
-
-	/*
-	 * Report when delay estimate is off by more than 2ms.
-	 * The error should be lower than 2ms since the estimate relies
-	 * on two reads of a counter updated every ms.
-	 */
-	if (abs(est_delay - subs->last_delay) * 1000 > runtime->rate * 2)
-		dev_dbg_ratelimited(&subs->dev->dev,
-			"delay: estimated %d, actual %d\n",
-			est_delay, subs->last_delay);
-
-	if (!subs->running) {
-		/* update last_frame_number for delay counting here since
-		 * prepare_playback_urb won't be called during pause
-		 */
-		subs->last_frame_number =
-			usb_get_current_frame_number(subs->dev) & 0xff;
+	if (ctx->queued) {
+		if (subs->inflight_bytes >= ctx->queued)
+			subs->inflight_bytes -= ctx->queued;
+		else
+			subs->inflight_bytes = 0;
 	}
 
- out:
+	subs->last_frame_number = usb_get_current_frame_number(subs->dev);
 	spin_unlock_irqrestore(&subs->lock, flags);
 }
 
@@ -1504,6 +1477,7 @@ static int snd_usb_substream_capture_trigger(struct snd_pcm_substream *substream
 		snd_usb_endpoint_set_callback(subs->data_endpoint,
 					      NULL, retire_capture_urb,
 					      subs);
+		subs->last_frame_number = usb_get_current_frame_number(subs->dev);
 		subs->running = 1;
 		dev_dbg(&subs->dev->dev, "%d:%d Start Capture PCM\n",
 			subs->cur_audiofmt->iface,
-- 
2.26.2

