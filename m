Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5486F7E0A
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 09:40:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDAFB2BD3;
	Fri,  5 May 2023 09:39:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDAFB2BD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683272417;
	bh=CcmUj3S6fUHVn3H6deaWxEM6NfxNQhvKx3YqTs3Ksc0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FGq45/uAvriLxmdsdlKJ9UkTWO/8yB1G5LHZjUVCfQYMzJVHjaLpEssfkw+o/DvEr
	 bpepwrGbAHOZtcYFzVcsKaJBazlFfRNOoxGsb8juGBiQyg9456G39mOlmC0/RsW17w
	 bW1SzNXHTV56nZVI5LiiqvyqVP0IUJj0tQtyczUQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4145F80534;
	Fri,  5 May 2023 09:38:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0267F8053D; Fri,  5 May 2023 09:38:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87016F80529
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 09:38:35 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id D294511E2;
	Fri,  5 May 2023 09:38:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz D294511E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1683272314; bh=70l2F+aiW+P/HA/WXJwk90uEDcdWm5hb9BZF0NXWD/0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mHuF74WgJ7OYHNmcssRTw8DXn96h1gHwhLUSX3WuiH2RG0Lmn0hRoy4CAu2maqa9Y
	 N4dgC2k1Ud36C3V/O6BwJH9a933Vf3NOUcoGycWOQNAkh/n6254OhEcpuhKT8PqKT4
	 9wreQb5k/ArK3vWNyUs60nYj3zrzwqjLYYmBRzgE=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Fri,  5 May 2023 09:38:29 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH 1/5] ALSA: pcm: Revert "ALSA: pcm: rewrite
 snd_pcm_playback_silence()"
Date: Fri,  5 May 2023 09:38:09 +0200
Message-Id: <20230505073813.1219175-2-perex@perex.cz>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230505073813.1219175-1-perex@perex.cz>
References: <20230505073813.1219175-1-perex@perex.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FLWJ3QDXGE5GNSHMDGTRGIOVI32UNOKW
X-Message-ID-Hash: FLWJ3QDXGE5GNSHMDGTRGIOVI32UNOKW
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>,
 Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
 Jeff Chua <jeff.chua.linux@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FLWJ3QDXGE5GNSHMDGTRGIOVI32UNOKW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This reverts commit 9f656705c5faa18afb26d922cfc64f9fd103c38d.

There is a regression (the top-up mode). Unfortunately, the patch
provided from the author of this commit is not easy for the review.

Keep the update and new comments in headers.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/core/pcm_lib.c    | 86 ++++++++++++++++++++++++-----------------
 sound/core/pcm_local.h  |  3 +-
 sound/core/pcm_native.c |  6 +--
 3 files changed, 55 insertions(+), 40 deletions(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index d21c73944efd..af1eb136feb0 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -42,56 +42,70 @@ static int fill_silence_frames(struct snd_pcm_substream *substream,
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
+			return;
+		noise_dist = snd_pcm_playback_hw_avail(runtime) + runtime->silence_filled;
+		if (noise_dist >= (snd_pcm_sframes_t) runtime->silence_threshold)
 			return;
+		frames = runtime->silence_threshold - noise_dist;
 		if (frames > runtime->silence_size)
 			frames = runtime->silence_size;
 	} else {
-		frames = runtime->buffer_size - noise_dist;
-		if (frames <= 0)
-			return;
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
 
@@ -425,6 +439,10 @@ static int snd_pcm_update_hw_ptr0(struct snd_pcm_substream *substream,
 		return 0;
 	}
 
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+	    runtime->silence_size > 0)
+		snd_pcm_playback_silence(substream, new_hw_ptr);
+
 	if (in_interrupt) {
 		delta = new_hw_ptr - runtime->hw_ptr_interrupt;
 		if (delta < 0)
@@ -442,10 +460,6 @@ static int snd_pcm_update_hw_ptr0(struct snd_pcm_substream *substream,
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
index 91c87cdb786e..39a65d1415ab 100644
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
2.39.2

