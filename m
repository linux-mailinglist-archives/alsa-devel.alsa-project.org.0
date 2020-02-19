Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 074CA163886
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 01:27:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95F3B1710;
	Wed, 19 Feb 2020 01:27:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95F3B1710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582072075;
	bh=1yRRYxKumiHFjTBY96Vl6BkMw20bZzFQXkDRV5EL3Xg=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=h/D0t/r4MKnFgtroTolTeDKc6S0GHyL20EWl6r27Mmf5LCRwOuCvZv2hDJB9/+RG4
	 0YZJo1kfUNtnjLqTjcTO2IoIk7p9TzP28kxr05kLoXNEaxD1wRvmJiqMsuIjBk26Gh
	 RZh80YMvfnJhLtRRWX/ApQL8Fuz/epuGSeeQdC0Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A10CF803AF;
	Wed, 19 Feb 2020 01:11:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8461F803AF; Wed, 19 Feb 2020 01:11:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id EB0FAF8038D
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 01:11:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB0FAF8038D
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58B92FEC;
 Tue, 18 Feb 2020 16:11:15 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D08003F68F;
 Tue, 18 Feb 2020 16:11:14 -0800 (PST)
Date: Wed, 19 Feb 2020 00:11:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Applied "ASoC: soc-pcm: fix regression in soc_new_pcm()" to the asoc
 tree
In-Reply-To: <20200218103824.26708-1-stephan@gerhold.net>
Message-Id: <applied-20200218103824.26708-1-stephan@gerhold.net>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
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

The patch

   ASoC: soc-pcm: fix regression in soc_new_pcm()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From a4877a6fb2bd2e356a5eaacd86d6b6d69ff84e69 Mon Sep 17 00:00:00 2001
From: Stephan Gerhold <stephan@gerhold.net>
Date: Tue, 18 Feb 2020 11:38:24 +0100
Subject: [PATCH] ASoC: soc-pcm: fix regression in soc_new_pcm()

Commit af4bac11531f ("ASoC: soc-pcm: crash in snd_soc_dapm_new_dai")
swapped the SNDRV_PCM_STREAM_* parameter in the
snd_soc_dai_stream_valid(cpu_dai, ...) checks. But that works only
for codec2codec links. For normal links it breaks registration of
playback/capture-only PCM devices.

E.g. on qcom/apq8016_sbc there is usually one playback-only and one
capture-only PCM device, but they disappeared after the commit.

The codec2codec case was added in commit a342031cdd08
("ASoC: create pcm for codec2codec links as well") as an extra check
(e.g. `playback = playback && cpu_playback->channels_min`).

We should be able to simplify the code by checking directly for
the correct stream type in the loop.
This also fixes the regression because we check for PLAYBACK for
both codec and cpu dai again when codec2codec is not used.

Fixes: af4bac11531f ("ASoC: soc-pcm: crash in snd_soc_dapm_new_dai")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
Tested-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Sameer Pujar <spujar@nvidia.com>
Link: https://lore.kernel.org/r/20200218103824.26708-1-stephan@gerhold.net
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 6630fadd6e09..65a3856be250 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2858,22 +2858,19 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 		capture = rtd->dai_link->dpcm_capture;
 	} else {
 		/* Adapt stream for codec2codec links */
-		struct snd_soc_pcm_stream *cpu_capture = rtd->dai_link->params ?
-			&cpu_dai->driver->playback : &cpu_dai->driver->capture;
-		struct snd_soc_pcm_stream *cpu_playback = rtd->dai_link->params ?
-			&cpu_dai->driver->capture : &cpu_dai->driver->playback;
+		int cpu_capture = rtd->dai_link->params ?
+			SNDRV_PCM_STREAM_PLAYBACK : SNDRV_PCM_STREAM_CAPTURE;
+		int cpu_playback = rtd->dai_link->params ?
+			SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
 
 		for_each_rtd_codec_dai(rtd, i, codec_dai) {
 			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_CAPTURE))
+			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
 				playback = 1;
 			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_PLAYBACK))
+			    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
 				capture = 1;
 		}
-
-		capture = capture && cpu_capture->channels_min;
-		playback = playback && cpu_playback->channels_min;
 	}
 
 	if (rtd->dai_link->playback_only) {
-- 
2.20.1

