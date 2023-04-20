Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E912F6E92DF
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 13:34:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04850EBE;
	Thu, 20 Apr 2023 13:33:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04850EBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681990475;
	bh=fC2pcUTfjBac20rHnPO9d9pntiukz4YAK4I5Lxobr7c=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DPQT5h90C/rku4uVWsccjp6J/yYHIBMOERkL+fgg+D4DxHr4E0RgClFi9hM3BdUYy
	 mHRO1UTwc0s08Pc1o2PWIq6j6mgnlZStbJdL3BCqSXbn2CIrfwrVN3sqid741XDf+g
	 csE2xP9zru9e4ihexTPvnjJhBilNUo3ZNt6tJEpE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48358F800AC;
	Thu, 20 Apr 2023 13:33:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D68CF8019B; Thu, 20 Apr 2023 13:33:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1942F80149
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 13:33:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1942F80149
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 9A46924116;
	Thu, 20 Apr 2023 07:33:24 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1ppSXU-gC4-00; Thu, 20 Apr 2023 13:33:24 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 2/2] ALSA: pcm: auto-fill buffer with silence when draining
 playback
Date: Thu, 20 Apr 2023 13:33:24 +0200
Message-Id: <20230420113324.877164-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230420113324.877164-1-oswald.buddenhagen@gmx.de>
References: <20230420113324.877164-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QNAPNILO227IO3XU45VYE6YUGG37WB7E
X-Message-ID-Hash: QNAPNILO227IO3XU45VYE6YUGG37WB7E
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Draining will always playback somewhat beyond the end of the filled
buffer. This would produce artifacts if the user did not set up the
auto-silencing machinery, which is an extremely easy mistake to make, as
the API strongly suggests convenient fire-and-forget semantics. This
patch makes it work out of the box.

Applying this unconditionally is uncontroversial for RW_ACCESS, as the
buffer is fully controlled by the kernel in this case, which a) makes
failure to set up silencing even more likely and b) no detrimental
effects on user space are possible.

MMAP_ACCESS is a different matter:
- It can be argued that the user can be expected to know that the buffer
  needs to be padded one way or another. I dispute that; of the numerous
  resources I surveyed, only one mentioned this. Draining is a
  convenience function also in the mmap case - an application that wants
  to control things finely would just use start/stop and manage the
  timing itself.
- It can be argued that it's a bad thing to overwrite a buffer the user
  has access to without them explicitly requesting it. While technically
  true, I think that's only a hypothetical issue - applications can be
  expected to treat consumed samples as undefined data:
  - The cases where playing back the same samples would be even useful
    and practical are extremely limited.
  - Most user code uses cross-platform/-API abstractions, which makes it
    even less likely that they would get the idea that it's OK to re-use
    buffered samples.

So I think the trade-off between fixing numerous applications and
potentially breaking some is skewed towards the former to the point that
it's not even a question.

We do the filling even if the driver supports exact draining
(SNDRV_PCM_TRIGGER_DRAIN), because a) the cost of filling two periods
from time to time is negligible, so it's not worth complicating the code
and b) so the behavior is consistent between drivers, so hypothetical
problems with the mmap case would be easier to reproduce.

It would be possible to add an opt-in API to the kernel and leave
actually enabling it to alsa-lib. However, this would add significant
overall complexity, for no obvious gain.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

---
v2:
- fill only up to two periods, to avoid undue load with big buffers
- added discussion to commit message
---
 sound/core/pcm_lib.c    | 47 +++++++++++++++++++++++++----------------
 sound/core/pcm_native.c |  3 ++-
 2 files changed, 31 insertions(+), 19 deletions(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 5bb2129cceac..b8940ceeaedb 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -61,24 +61,35 @@ void snd_pcm_playback_silence(struct snd_pcm_substream *substream)
 		runtime->silence_start = appl_ptr;
 	}
 
-	// This will "legitimately" turn negative on underrun, and will be mangled
-	// into a huge number by the boundary crossing handling. The initial state
-	// might also be not quite sane. The code below MUST account for these cases.
-	hw_avail = appl_ptr - runtime->status->hw_ptr;
-	if (hw_avail < 0)
-		hw_avail += runtime->boundary;
+	if (runtime->state == SNDRV_PCM_STATE_DRAINING) {
+		// We actually need only the next period boundary plus the FIFO size
+		// plus some slack for IRQ delays, but it's not worth calculating that.
+		frames = runtime->period_size * 2 - runtime->silence_filled;
+		if (frames <= 0)
+			return;
+		// Impossible, unless the buffer has only one period.
+		if (frames > runtime->buffer_size)
+			frames = runtime->buffer_size;
+	} else  {
+		// This will "legitimately" turn negative on underrun, and will be mangled
+		// into a huge number by the boundary crossing handling. The initial state
+		// might also be not quite sane. The code below MUST account for these cases.
+		hw_avail = appl_ptr - runtime->status->hw_ptr;
+		if (hw_avail < 0)
+			hw_avail += runtime->boundary;
 
-	noise_dist = hw_avail + runtime->silence_filled;
-	if (runtime->silence_size < runtime->boundary) {
-		frames = runtime->silence_threshold - noise_dist;
-		if (frames <= 0)
-			return;
-		if (frames > runtime->silence_size)
-			frames = runtime->silence_size;
-	} else {
-		frames = runtime->buffer_size - noise_dist;
-		if (frames <= 0)
-			return;
+		noise_dist = hw_avail + runtime->silence_filled;
+		if (runtime->silence_size < runtime->boundary) {
+			frames = runtime->silence_threshold - noise_dist;
+			if (frames <= 0)
+				return;
+			if (frames > runtime->silence_size)
+				frames = runtime->silence_size;
+		} else {
+			frames = runtime->buffer_size - noise_dist;
+			if (frames <= 0)
+				return;
+		}
 	}
 
 	if (snd_BUG_ON(frames > runtime->buffer_size))
@@ -443,7 +454,7 @@ static int snd_pcm_update_hw_ptr0(struct snd_pcm_substream *substream,
 	}
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
-	    runtime->silence_size > 0)
+	    (runtime->silence_size > 0 || runtime->state == SNDRV_PCM_STATE_DRAINING))
 		snd_pcm_playback_silence(substream);
 
 	update_audio_tstamp(substream, &curr_tstamp, &audio_tstamp);
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 0e3e7997dc58..6ecb6a733606 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1454,7 +1454,7 @@ static void snd_pcm_post_start(struct snd_pcm_substream *substream,
 							    runtime->rate;
 	__snd_pcm_set_state(runtime, state);
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
-	    runtime->silence_size > 0)
+	    (runtime->silence_size > 0 || state == SNDRV_PCM_STATE_DRAINING))
 		snd_pcm_playback_silence(substream);
 	snd_pcm_timer_notify(substream, SNDRV_TIMER_EVENT_MSTART);
 }
@@ -2045,6 +2045,7 @@ static int snd_pcm_do_drain_init(struct snd_pcm_substream *substream,
 			break;
 		case SNDRV_PCM_STATE_RUNNING:
 			__snd_pcm_set_state(runtime, SNDRV_PCM_STATE_DRAINING);
+			snd_pcm_playback_silence(substream);
 			break;
 		case SNDRV_PCM_STATE_XRUN:
 			__snd_pcm_set_state(runtime, SNDRV_PCM_STATE_SETUP);
-- 
2.40.0.152.g15d061e6df

