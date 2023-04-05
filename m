Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 474726D87FA
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 22:14:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D93371FC;
	Wed,  5 Apr 2023 22:13:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D93371FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680725674;
	bh=x0psNQeW939A0fUStsWiMemK4R/8Uk0uxPFQbNOgoms=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=gftjwj23g0QJt78+turCzMTruO7c2EkLzK4vFh1bknShSFWg0y49YYdj1SKScH6Yh
	 6nC2dk2WbzdmXt4tGpzwE9XToMcm77glg75/l84+WoTPCGloILQYMWLSd78O8KR6cT
	 UsLyxGPf1UAOzECHmjvuyPt3wbWu0X69yhvs8n8Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84EEEF80557;
	Wed,  5 Apr 2023 22:12:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0D06F80542; Wed,  5 Apr 2023 22:12:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1AA50F80529
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 22:12:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AA50F80529
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 1FFC524224
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 16:12:20 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pk9UR-DkT-00
	for <alsa-devel@alsa-project.org>; Wed, 05 Apr 2023 22:12:19 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: pcm: auto-fill buffer with silence when draining
 playback
Date: Wed,  5 Apr 2023 22:12:19 +0200
Message-Id: <20230405201219.2197789-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230405201219.2197789-1-oswald.buddenhagen@gmx.de>
References: <20230405201219.2197789-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WBZDYZ6HWEN7Z6EPUS7FSMNNSU55D7FG
X-Message-ID-Hash: WBZDYZ6HWEN7Z6EPUS7FSMNNSU55D7FG
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
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
auto-silencing machinery. This patch makes it work out of the box.

Rather than figuring out the right threshold (which is one period plus
the card-specific FIFO size plus some IRQ jitter), we use "top-up" mode.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/core/pcm_lib.c    | 5 +++--
 sound/core/pcm_native.c | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index b074c5b926db..1dd870a2093d 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -71,7 +71,8 @@ void snd_pcm_playback_silence(struct snd_pcm_substream *substream)
 	}
 
 	noise_dist = hw_avail + runtime->silence_filled;
-	if (runtime->silence_size < runtime->boundary) {
+	if (runtime->silence_size < runtime->boundary &&
+	    runtime->state != SNDRV_PCM_STATE_DRAINING) {
 		frames = runtime->silence_threshold - noise_dist;
 		if ((snd_pcm_sframes_t) frames <= 0)
 			return;
@@ -445,7 +446,7 @@ static int snd_pcm_update_hw_ptr0(struct snd_pcm_substream *substream,
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

