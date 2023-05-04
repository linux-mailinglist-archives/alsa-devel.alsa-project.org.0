Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 354A76F6C86
	for <lists+alsa-devel@lfdr.de>; Thu,  4 May 2023 15:01:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3903D189E;
	Thu,  4 May 2023 15:00:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3903D189E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683205271;
	bh=eUVAYJdBoGHiAM+EZ90cUwGT0E2zL1nyqeijWCZtHr8=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BE/wOgF7gA9azZzjSbRagBOwONMaAv6ABWN0TbJt+tyxKZGV0w2Wn780a9gMBRh59
	 9TGh8ZItSyBWp2jfy4k2R9npHDM3KvCwCqZYiSPcw0ggQ45dZvaRUcrfx9+qCDEWwf
	 at3ML5hsQAgGI50RDKD4y3xE3U3Dv8hz7qTVOUiE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0797F80529;
	Thu,  4 May 2023 15:00:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EC18F8052D; Thu,  4 May 2023 15:00:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E92BDF80520
	for <alsa-devel@alsa-project.org>; Thu,  4 May 2023 15:00:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E92BDF80520
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 9A3E823FBC;
	Thu,  4 May 2023 09:00:07 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1puYZ5-Gdp-00; Thu, 04 May 2023 15:00:07 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: pcm: fix snd_pcm_playback_silence() with free-running
 mode
Date: Thu,  4 May 2023 15:00:07 +0200
Message-Id: <20230504130007.2208916-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QGWS67ZELK277FXSP2FYTLEBOV5NFCV4
X-Message-ID-Hash: QGWS67ZELK277FXSP2FYTLEBOV5NFCV4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QGWS67ZELK277FXSP2FYTLEBOV5NFCV4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Turns out that we cannot rely on the application pointer being updated
in top-up mode, as its primary purpose is to remain operational in
free-running mode as used by dmix.

So we logically revert some bits from commit 9f656705c5faa ("ALSA: pcm:
rewrite snd_pcm_playback_silence()"), but we retain the bug fixes and
try to make the code paths congruent.

Reported-by: Jeff Chua <jeff.chua.linux@gmail.com>
Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/core/pcm_lib.c    | 82 +++++++++++++++++++++++++++--------------
 sound/core/pcm_local.h  |  3 +-
 sound/core/pcm_native.c |  6 +--
 3 files changed, 60 insertions(+), 31 deletions(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index d21c73944efd..cd5f2ef14ab4 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -42,41 +42,69 @@ static int fill_silence_frames(struct snd_pcm_substream *substream,
  *
  * when runtime->silence_size >= runtime->boundary - fill processed area with silence immediately
  */
-void snd_pcm_playback_silence(struct snd_pcm_substream *substream)
+void snd_pcm_playback_silence(struct snd_pcm_substream *substream, snd_pcm_uframes_t new_hw_ptr)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	snd_pcm_uframes_t appl_ptr = READ_ONCE(runtime->control->appl_ptr);
-	snd_pcm_sframes_t added, hw_avail, frames;
+	snd_pcm_sframes_t hw_avail, frames;
 	snd_pcm_uframes_t noise_dist, ofs, transfer;
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
+		snd_pcm_uframes_t appl_ptr = READ_ONCE(runtime->control->appl_ptr);
+		snd_pcm_sframes_t added = appl_ptr - runtime->silence_start;
+		if (added) {
+			if (added < 0)
+				added += runtime->boundary;
+			if (added < runtime->silence_filled)
+				runtime->silence_filled -= added;
+			else
+				runtime->silence_filled = 0;
+			runtime->silence_start = appl_ptr;
+		}
+
+		if (new_hw_ptr == ULONG_MAX)  // initialization
+			new_hw_ptr = runtime->status->hw_ptr;
+		// This will "legitimately" turn negative on underrun, and will be mangled
+		// into a huge number by the boundary crossing handling. The initial state
+		// might also be not quite sane. The code below MUST account for these cases.
+		hw_avail = appl_ptr - new_hw_ptr;
+		if (hw_avail < 0)
+			hw_avail += runtime->boundary;
+
+		noise_dist = hw_avail + runtime->silence_filled;
 		frames = runtime->silence_threshold - noise_dist;
 		if (frames <= 0)
 			return;
 		if (frames > runtime->silence_size)
 			frames = runtime->silence_size;
 	} else {
-		frames = runtime->buffer_size - noise_dist;
+		// This filling mode aims at free-running mode (used for example by dmix),
+		// which doesn't update the application pointer.
+		snd_pcm_uframes_t hw_ptr = runtime->status->hw_ptr;
+		if (new_hw_ptr == ULONG_MAX) {  // initialization
+			// Usually, this is entered while stopped, before data is queued,
+			// so both pointers are expected to be zero.
+			hw_avail = runtime->control->appl_ptr - hw_ptr;
+			if (hw_avail < 0)
+				hw_avail += runtime->boundary;
+			// In free-running mode, appl_ptr will be zero even while running,
+			// so we end up with a huge number. There is no useful way to
+			// handle this, so we just clear the whole buffer.
+			runtime->silence_filled = hw_avail > runtime->buffer_size ? 0 : hw_avail;
+			runtime->silence_start = hw_ptr;
+		} else {
+			snd_pcm_sframes_t played = new_hw_ptr - hw_ptr;
+			if (played) {
+				if (played < 0)
+					played += runtime->boundary;
+				if (played < runtime->silence_filled)
+					runtime->silence_filled -= played;
+				else  // This may happen due to a reset.
+					runtime->silence_filled = 0;
+				runtime->silence_start = new_hw_ptr;
+			}
+		}
+		frames = runtime->buffer_size - runtime->silence_filled;
 		if (frames <= 0)
 			return;
 	}
@@ -425,6 +453,10 @@ static int snd_pcm_update_hw_ptr0(struct snd_pcm_substream *substream,
 		return 0;
 	}
 
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+	    runtime->silence_size > 0)
+		snd_pcm_playback_silence(substream, new_hw_ptr);
+
 	if (in_interrupt) {
 		delta = new_hw_ptr - runtime->hw_ptr_interrupt;
 		if (delta < 0)
@@ -442,10 +474,6 @@ static int snd_pcm_update_hw_ptr0(struct snd_pcm_substream *substream,
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

