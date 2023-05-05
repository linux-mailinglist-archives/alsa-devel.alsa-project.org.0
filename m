Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E23046F80D0
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 12:33:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DB482C43;
	Fri,  5 May 2023 12:32:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DB482C43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683282820;
	bh=mh7VCDQhud3R8uYpBhoW9Nh5IYrIP5wu374/xSGx6is=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iKbw0o5tK10XcFGZulIx00ONFEubYUMsvMjhrLCHBJ+f4uXaIUVNpoZqla/xGU6Y7
	 eWQ/NK96Tu4SzkhOxKcMYsU7WjKEa3L0Zgrdl8Ajdz5P3Zm5lI9C8TPUyqvT7zZF1q
	 UQD/udEz9j9I4DWG2kR7REPmeIBQelE1Pg07aFFE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38FADF80087;
	Fri,  5 May 2023 12:31:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C408BF80534; Fri,  5 May 2023 12:31:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 63C64F8052D
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 12:31:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63C64F8052D
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 45DCA23E9C;
	Fri,  5 May 2023 06:31:41 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pusiz-ab7-00; Fri, 05 May 2023 12:31:41 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/7] ALSA: pcm: Revert "ALSA: pcm: rewrite
 snd_pcm_playback_silence()"
Date: Fri,  5 May 2023 12:31:34 +0200
Message-Id: <20230505103140.2285622-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OIICTBS65SUAK6ZAKPRIW5PZDAOU33DZ
X-Message-ID-Hash: OIICTBS65SUAK6ZAKPRIW5PZDAOU33DZ
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>, Jeff Chua <jeff.chua.linux@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OIICTBS65SUAK6ZAKPRIW5PZDAOU33DZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Jaroslav Kysela <perex@perex.cz>

This reverts commit 9f656705c5faa18afb26d922cfc64f9fd103c38d.

There was a regression (in the top-up mode). Unfortunately, the patch
provided from the author of this commit is not easy to review.

Keep the updated and new comments in headers.
Also add a new comment that documents the missed API constraint which
led to the regression.

Reported-by: Jeff Chua <jeff.chua.linux@gmail.com>
Link: https://lore.kernel.org/r/CAAJw_ZsbTVd3Es373x_wTNDF7RknGhCD0r+NKUSwAO7HpLAkYA@mail.gmail.com
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
v2:
- add docu comment
- commit message improvements
---
 sound/core/pcm_lib.c    | 90 ++++++++++++++++++++++++-----------------
 sound/core/pcm_local.h  |  3 +-
 sound/core/pcm_native.c |  6 +--
 3 files changed, 59 insertions(+), 40 deletions(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index d21c73944efd..3357ffae635f 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -42,56 +42,74 @@ static int fill_silence_frames(struct snd_pcm_substream *substream,
  *
  * when runtime->silence_size >= runtime->boundary - fill processed area with silence immediately
  */
-void snd_pcm_playback_silence(struct snd_pcm_substream *substream)
+void snd_pcm_playback_silence(struct snd_pcm_substream *substream, snd_pcm_uframes_t new_hw_ptr)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	snd_pcm_uframes_t appl_ptr = READ_ONCE(runtime->control->appl_ptr);
-	snd_pcm_sframes_t added, hw_avail, frames;
-	snd_pcm_uframes_t noise_dist, ofs, transfer;
+	snd_pcm_uframes_t frames, ofs, transfer;
 	int err;
 
-	added = appl_ptr - runtime->silence_start;
-	if (added) {
-		if (added < 0)
-			added += runtime->boundary;
-		if (added < runtime->silence_filled)
-			runtime->silence_filled -= added;
-		else
-			runtime->silence_filled = 0;
-		runtime->silence_start = appl_ptr;
-	}
-
-	// This will "legitimately" turn negative on underrun, and will be mangled
-	// into a huge number by the boundary crossing handling. The initial state
-	// might also be not quite sane. The code below MUST account for these cases.
-	hw_avail = appl_ptr - runtime->status->hw_ptr;
-	if (hw_avail < 0)
-		hw_avail += runtime->boundary;
-
-	noise_dist = hw_avail + runtime->silence_filled;
 	if (runtime->silence_size < runtime->boundary) {
-		frames = runtime->silence_threshold - noise_dist;
-		if (frames <= 0)
+		snd_pcm_sframes_t noise_dist, n;
+		snd_pcm_uframes_t appl_ptr = READ_ONCE(runtime->control->appl_ptr);
+		if (runtime->silence_start != appl_ptr) {
+			n = appl_ptr - runtime->silence_start;
+			if (n < 0)
+				n += runtime->boundary;
+			if ((snd_pcm_uframes_t)n < runtime->silence_filled)
+				runtime->silence_filled -= n;
+			else
+				runtime->silence_filled = 0;
+			runtime->silence_start = appl_ptr;
+		}
+		if (runtime->silence_filled >= runtime->buffer_size)
 			return;
+		noise_dist = snd_pcm_playback_hw_avail(runtime) + runtime->silence_filled;
+		if (noise_dist >= (snd_pcm_sframes_t) runtime->silence_threshold)
+			return;
+		frames = runtime->silence_threshold - noise_dist;
 		if (frames > runtime->silence_size)
 			frames = runtime->silence_size;
 	} else {
-		frames = runtime->buffer_size - noise_dist;
-		if (frames <= 0)
-			return;
+		/*
+		 * This filling mode aims at free-running mode (used for example by dmix),
+		 * which doesn't update the application pointer.
+		 */
+		if (new_hw_ptr == ULONG_MAX) {	/* initialization */
+			snd_pcm_sframes_t avail = snd_pcm_playback_hw_avail(runtime);
+			if (avail > runtime->buffer_size)
+				avail = runtime->buffer_size;
+			runtime->silence_filled = avail > 0 ? avail : 0;
+			runtime->silence_start = (runtime->status->hw_ptr +
+						  runtime->silence_filled) %
+						 runtime->boundary;
+		} else {
+			ofs = runtime->status->hw_ptr;
+			frames = new_hw_ptr - ofs;
+			if ((snd_pcm_sframes_t)frames < 0)
+				frames += runtime->boundary;
+			runtime->silence_filled -= frames;
+			if ((snd_pcm_sframes_t)runtime->silence_filled < 0) {
+				runtime->silence_filled = 0;
+				runtime->silence_start = new_hw_ptr;
+			} else {
+				runtime->silence_start = ofs;
+			}
+		}
+		frames = runtime->buffer_size - runtime->silence_filled;
 	}
-
 	if (snd_BUG_ON(frames > runtime->buffer_size))
 		return;
-	ofs = (runtime->silence_start + runtime->silence_filled) % runtime->buffer_size;
-	do {
+	if (frames == 0)
+		return;
+	ofs = runtime->silence_start % runtime->buffer_size;
+	while (frames > 0) {
 		transfer = ofs + frames > runtime->buffer_size ? runtime->buffer_size - ofs : frames;
 		err = fill_silence_frames(substream, ofs, transfer);
 		snd_BUG_ON(err < 0);
 		runtime->silence_filled += transfer;
 		frames -= transfer;
 		ofs = 0;
-	} while (frames > 0);
+	}
 	snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_DEVICE);
 }
 
@@ -425,6 +443,10 @@ static int snd_pcm_update_hw_ptr0(struct snd_pcm_substream *substream,
 		return 0;
 	}
 
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+	    runtime->silence_size > 0)
+		snd_pcm_playback_silence(substream, new_hw_ptr);
+
 	if (in_interrupt) {
 		delta = new_hw_ptr - runtime->hw_ptr_interrupt;
 		if (delta < 0)
@@ -442,10 +464,6 @@ static int snd_pcm_update_hw_ptr0(struct snd_pcm_substream *substream,
 		runtime->hw_ptr_wrap += runtime->boundary;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
-	    runtime->silence_size > 0)
-		snd_pcm_playback_silence(substream);
-
 	update_audio_tstamp(substream, &curr_tstamp, &audio_tstamp);
 
 	return snd_pcm_update_state(substream, runtime);
diff --git a/sound/core/pcm_local.h b/sound/core/pcm_local.h
index 42fe3a4e9154..ecb21697ae3a 100644
--- a/sound/core/pcm_local.h
+++ b/sound/core/pcm_local.h
@@ -29,7 +29,8 @@ int snd_pcm_update_state(struct snd_pcm_substream *substream,
 			 struct snd_pcm_runtime *runtime);
 int snd_pcm_update_hw_ptr(struct snd_pcm_substream *substream);
 
-void snd_pcm_playback_silence(struct snd_pcm_substream *substream);
+void snd_pcm_playback_silence(struct snd_pcm_substream *substream,
+			      snd_pcm_uframes_t new_hw_ptr);
 
 static inline snd_pcm_uframes_t
 snd_pcm_avail(struct snd_pcm_substream *substream)
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 3d0c4a5b701b..94185267a7b9 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -958,7 +958,7 @@ static int snd_pcm_sw_params(struct snd_pcm_substream *substream,
 	if (snd_pcm_running(substream)) {
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
 		    runtime->silence_size > 0)
-			snd_pcm_playback_silence(substream);
+			snd_pcm_playback_silence(substream, ULONG_MAX);
 		err = snd_pcm_update_state(substream, runtime);
 	}
 	snd_pcm_stream_unlock_irq(substream);
@@ -1455,7 +1455,7 @@ static void snd_pcm_post_start(struct snd_pcm_substream *substream,
 	__snd_pcm_set_state(runtime, state);
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
 	    runtime->silence_size > 0)
-		snd_pcm_playback_silence(substream);
+		snd_pcm_playback_silence(substream, ULONG_MAX);
 	snd_pcm_timer_notify(substream, SNDRV_TIMER_EVENT_MSTART);
 }
 
@@ -1916,7 +1916,7 @@ static void snd_pcm_post_reset(struct snd_pcm_substream *substream,
 	runtime->control->appl_ptr = runtime->status->hw_ptr;
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
 	    runtime->silence_size > 0)
-		snd_pcm_playback_silence(substream);
+		snd_pcm_playback_silence(substream, ULONG_MAX);
 	snd_pcm_stream_unlock_irq(substream);
 }
 
-- 
2.40.0.152.g15d061e6df

