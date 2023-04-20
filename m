Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C97AD6E92E3
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 13:35:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B378EECF;
	Thu, 20 Apr 2023 13:34:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B378EECF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681990525;
	bh=H0TZa4Vf3XHsHNm+g5zBQZg/RSJONDCCh3rJ+U4VyHM=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Uk/tAMiAVNsKpQpJqem4i6umrqn6bKU+xIC84Q4vYmN3o5el5/xW9E5q4wryM7HKN
	 3dyolc7vH6ibD/qFhLA5yReR7aZpb6yThl+Y6FVlMSWyrDqoMEehD1OBbRSXVhCF9d
	 I5r99ZQEzmRwmKZRlwJ/I1WeCWbD9s6GeX0186/g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1E69F804FC;
	Thu, 20 Apr 2023 13:33:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E06ACF80155; Thu, 20 Apr 2023 13:33:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 998B5F800F8
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 13:33:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 998B5F800F8
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 97C21240F9;
	Thu, 20 Apr 2023 07:33:24 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1ppSXU-gBy-00; Thu, 20 Apr 2023 13:33:24 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/2] ALSA: pcm: rewrite snd_pcm_playback_silence()
Date: Thu, 20 Apr 2023 13:33:23 +0200
Message-Id: <20230420113324.877164-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YCYCGM6XUDSD3XIZBXK3JQNDYRCYX3XV
X-Message-ID-Hash: YCYCGM6XUDSD3XIZBXK3JQNDYRCYX3XV
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YCYCGM6XUDSD3XIZBXK3JQNDYRCYX3XV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The auto-silencer supports two modes: "thresholded" to fill up "just
enough", and "top-up" to fill up "as much as possible". The two modes
used rather distinct code paths, which this patch unifies. The only
remaining distinction is how much we actually want to fill.

This fixes a bug in thresholded mode, where we failed to use new_hw_ptr,
resulting in under-fill.

Top-up mode is now more well-behaved and much easier to understand in
corner cases.

This also updates comments in the proximity of silencing-related data
structures.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

---
v2:
- removed useless boundary check
- got rid of casts by using a signed type for deltas.
  i did not adjust the style of the conditionals, because it's not clear
  whether the hangup was actually over that, or merely over the casts.
- dropped use of C99 comments where the surroundings suggest it.
  (in the case of the interspersed multi-line comments, that doesn't
  look like an improvement to me at all ...)
- swapped the `added` and `hw_avail` calculation blocks to reduce
  subsequent churn. it's more logical that way anyway.
---
 .../kernel-api/writing-an-alsa-driver.rst     | 17 ++--
 include/sound/pcm.h                           | 14 +--
 include/uapi/sound/asound.h                   | 11 ++-
 sound/core/pcm_lib.c                          | 86 ++++++++-----------
 sound/core/pcm_local.h                        |  3 +-
 sound/core/pcm_native.c                       |  6 +-
 6 files changed, 66 insertions(+), 71 deletions(-)

diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index a368529e8ed3..e37d9dba320d 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -1577,14 +1577,19 @@ are the contents of this file:
           unsigned int period_step;
           unsigned int sleep_min;		/* min ticks to sleep */
           snd_pcm_uframes_t start_threshold;
-          snd_pcm_uframes_t stop_threshold;
-          snd_pcm_uframes_t silence_threshold; /* Silence filling happens when
-                                                  noise is nearest than this */
-          snd_pcm_uframes_t silence_size;	/* Silence filling size */
+          /*
+           * The following two thresholds alleviate playback buffer underruns; when
+           * hw_avail drops below the threshold, the respective action is triggered:
+           */
+          snd_pcm_uframes_t stop_threshold;	/* - stop playback */
+          snd_pcm_uframes_t silence_threshold;	/* - pre-fill buffer with silence */
+          snd_pcm_uframes_t silence_size;       /* max size of silence pre-fill; when >= boundary,
+                                                 * fill played area with silence immediately */
           snd_pcm_uframes_t boundary;	/* pointers wrap point */
   
-          snd_pcm_uframes_t silenced_start;
-          snd_pcm_uframes_t silenced_size;
+          /* internal data of auto-silencer */
+          snd_pcm_uframes_t silence_start; /* starting pointer to silence area */
+          snd_pcm_uframes_t silence_filled; /* size filled with silence */
   
           snd_pcm_sync_id_t sync;		/* hardware synchronization ID */
   
diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 27040b472a4f..19f564606ac4 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -378,18 +378,18 @@ struct snd_pcm_runtime {
 	unsigned int rate_den;
 	unsigned int no_period_wakeup: 1;
 
-	/* -- SW params -- */
-	int tstamp_mode;		/* mmap timestamp is updated */
+	/* -- SW params; see struct snd_pcm_sw_params for comments -- */
+	int tstamp_mode;
   	unsigned int period_step;
 	snd_pcm_uframes_t start_threshold;
 	snd_pcm_uframes_t stop_threshold;
-	snd_pcm_uframes_t silence_threshold; /* Silence filling happens when
-						noise is nearest than this */
-	snd_pcm_uframes_t silence_size;	/* Silence filling size */
-	snd_pcm_uframes_t boundary;	/* pointers wrap point */
+	snd_pcm_uframes_t silence_threshold;
+	snd_pcm_uframes_t silence_size;
+	snd_pcm_uframes_t boundary;
 
+	/* internal data of auto-silencer */
 	snd_pcm_uframes_t silence_start; /* starting pointer to silence area */
-	snd_pcm_uframes_t silence_filled; /* size filled with silence */
+	snd_pcm_uframes_t silence_filled; /* already filled part of silence area */
 
 	union snd_pcm_sync_id sync;	/* hardware synchronization ID */
 
diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index de6810e94abe..a255a891eb81 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -429,9 +429,14 @@ struct snd_pcm_sw_params {
 	snd_pcm_uframes_t avail_min;		/* min avail frames for wakeup */
 	snd_pcm_uframes_t xfer_align;		/* obsolete: xfer size need to be a multiple */
 	snd_pcm_uframes_t start_threshold;	/* min hw_avail frames for automatic start */
-	snd_pcm_uframes_t stop_threshold;	/* min avail frames for automatic stop */
-	snd_pcm_uframes_t silence_threshold;	/* min distance from noise for silence filling */
-	snd_pcm_uframes_t silence_size;		/* silence block size */
+	/*
+	 * The following two thresholds alleviate playback buffer underruns; when
+	 * hw_avail drops below the threshold, the respective action is triggered:
+	 */
+	snd_pcm_uframes_t stop_threshold;	/* - stop playback */
+	snd_pcm_uframes_t silence_threshold;	/* - pre-fill buffer with silence */
+	snd_pcm_uframes_t silence_size;		/* max size of silence pre-fill; when >= boundary,
+						 * fill played area with silence immediately */
 	snd_pcm_uframes_t boundary;		/* pointers wrap point */
 	unsigned int proto;			/* protocol version */
 	unsigned int tstamp_type;		/* timestamp type (req. proto >= 2.0.12) */
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 02fd65993e7e..5bb2129cceac 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -42,70 +42,56 @@ static int fill_silence_frames(struct snd_pcm_substream *substream,
  *
  * when runtime->silence_size >= runtime->boundary - fill processed area with silence immediately
  */
-void snd_pcm_playback_silence(struct snd_pcm_substream *substream, snd_pcm_uframes_t new_hw_ptr)
+void snd_pcm_playback_silence(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	snd_pcm_uframes_t frames, ofs, transfer;
+	snd_pcm_uframes_t appl_ptr = READ_ONCE(runtime->control->appl_ptr);
+	snd_pcm_sframes_t added, hw_avail, frames;
+	snd_pcm_uframes_t noise_dist, ofs, transfer;
 	int err;
 
+	added = appl_ptr - runtime->silence_start;
+	if (added) {
+		if (added < 0)
+			added += runtime->boundary;
+		if (added < runtime->silence_filled)
+			runtime->silence_filled -= added;
+		else
+			runtime->silence_filled = 0;
+		runtime->silence_start = appl_ptr;
+	}
+
+	// This will "legitimately" turn negative on underrun, and will be mangled
+	// into a huge number by the boundary crossing handling. The initial state
+	// might also be not quite sane. The code below MUST account for these cases.
+	hw_avail = appl_ptr - runtime->status->hw_ptr;
+	if (hw_avail < 0)
+		hw_avail += runtime->boundary;
+
+	noise_dist = hw_avail + runtime->silence_filled;
 	if (runtime->silence_size < runtime->boundary) {
-		snd_pcm_sframes_t noise_dist, n;
-		snd_pcm_uframes_t appl_ptr = READ_ONCE(runtime->control->appl_ptr);
-		if (runtime->silence_start != appl_ptr) {
-			n = appl_ptr - runtime->silence_start;
-			if (n < 0)
-				n += runtime->boundary;
-			if ((snd_pcm_uframes_t)n < runtime->silence_filled)
-				runtime->silence_filled -= n;
-			else
-				runtime->silence_filled = 0;
-			runtime->silence_start = appl_ptr;
-		}
-		if (runtime->silence_filled >= runtime->buffer_size)
-			return;
-		noise_dist = snd_pcm_playback_hw_avail(runtime) + runtime->silence_filled;
-		if (noise_dist >= (snd_pcm_sframes_t) runtime->silence_threshold)
-			return;
 		frames = runtime->silence_threshold - noise_dist;
+		if (frames <= 0)
+			return;
 		if (frames > runtime->silence_size)
 			frames = runtime->silence_size;
 	} else {
-		if (new_hw_ptr == ULONG_MAX) {	/* initialization */
-			snd_pcm_sframes_t avail = snd_pcm_playback_hw_avail(runtime);
-			if (avail > runtime->buffer_size)
-				avail = runtime->buffer_size;
-			runtime->silence_filled = avail > 0 ? avail : 0;
-			runtime->silence_start = (runtime->status->hw_ptr +
-						  runtime->silence_filled) %
-						 runtime->boundary;
-		} else {
-			ofs = runtime->status->hw_ptr;
-			frames = new_hw_ptr - ofs;
-			if ((snd_pcm_sframes_t)frames < 0)
-				frames += runtime->boundary;
-			runtime->silence_filled -= frames;
-			if ((snd_pcm_sframes_t)runtime->silence_filled < 0) {
-				runtime->silence_filled = 0;
-				runtime->silence_start = new_hw_ptr;
-			} else {
-				runtime->silence_start = ofs;
-			}
-		}
-		frames = runtime->buffer_size - runtime->silence_filled;
+		frames = runtime->buffer_size - noise_dist;
+		if (frames <= 0)
+			return;
 	}
+
 	if (snd_BUG_ON(frames > runtime->buffer_size))
 		return;
-	if (frames == 0)
-		return;
-	ofs = runtime->silence_start % runtime->buffer_size;
-	while (frames > 0) {
+	ofs = (runtime->silence_start + runtime->silence_filled) % runtime->buffer_size;
+	do {
 		transfer = ofs + frames > runtime->buffer_size ? runtime->buffer_size - ofs : frames;
 		err = fill_silence_frames(substream, ofs, transfer);
 		snd_BUG_ON(err < 0);
 		runtime->silence_filled += transfer;
 		frames -= transfer;
 		ofs = 0;
-	}
+	} while (frames > 0);
 	snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_DEVICE);
 }
 
@@ -439,10 +425,6 @@ static int snd_pcm_update_hw_ptr0(struct snd_pcm_substream *substream,
 		return 0;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
-	    runtime->silence_size > 0)
-		snd_pcm_playback_silence(substream, new_hw_ptr);
-
 	if (in_interrupt) {
 		delta = new_hw_ptr - runtime->hw_ptr_interrupt;
 		if (delta < 0)
@@ -460,6 +442,10 @@ static int snd_pcm_update_hw_ptr0(struct snd_pcm_substream *substream,
 		runtime->hw_ptr_wrap += runtime->boundary;
 	}
 
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+	    runtime->silence_size > 0)
+		snd_pcm_playback_silence(substream);
+
 	update_audio_tstamp(substream, &curr_tstamp, &audio_tstamp);
 
 	return snd_pcm_update_state(substream, runtime);
diff --git a/sound/core/pcm_local.h b/sound/core/pcm_local.h
index ecb21697ae3a..42fe3a4e9154 100644
--- a/sound/core/pcm_local.h
+++ b/sound/core/pcm_local.h
@@ -29,8 +29,7 @@ int snd_pcm_update_state(struct snd_pcm_substream *substream,
 			 struct snd_pcm_runtime *runtime);
 int snd_pcm_update_hw_ptr(struct snd_pcm_substream *substream);
 
-void snd_pcm_playback_silence(struct snd_pcm_substream *substream,
-			      snd_pcm_uframes_t new_hw_ptr);
+void snd_pcm_playback_silence(struct snd_pcm_substream *substream);
 
 static inline snd_pcm_uframes_t
 snd_pcm_avail(struct snd_pcm_substream *substream)
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 331380c2438b..0e3e7997dc58 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -958,7 +958,7 @@ static int snd_pcm_sw_params(struct snd_pcm_substream *substream,
 	if (snd_pcm_running(substream)) {
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
 		    runtime->silence_size > 0)
-			snd_pcm_playback_silence(substream, ULONG_MAX);
+			snd_pcm_playback_silence(substream);
 		err = snd_pcm_update_state(substream, runtime);
 	}
 	snd_pcm_stream_unlock_irq(substream);
@@ -1455,7 +1455,7 @@ static void snd_pcm_post_start(struct snd_pcm_substream *substream,
 	__snd_pcm_set_state(runtime, state);
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
 	    runtime->silence_size > 0)
-		snd_pcm_playback_silence(substream, ULONG_MAX);
+		snd_pcm_playback_silence(substream);
 	snd_pcm_timer_notify(substream, SNDRV_TIMER_EVENT_MSTART);
 }
 
@@ -1916,7 +1916,7 @@ static void snd_pcm_post_reset(struct snd_pcm_substream *substream,
 	runtime->control->appl_ptr = runtime->status->hw_ptr;
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
 	    runtime->silence_size > 0)
-		snd_pcm_playback_silence(substream, ULONG_MAX);
+		snd_pcm_playback_silence(substream);
 	snd_pcm_stream_unlock_irq(substream);
 }
 
-- 
2.40.0.152.g15d061e6df

