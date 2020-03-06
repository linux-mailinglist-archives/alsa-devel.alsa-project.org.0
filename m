Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D9717C133
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 16:06:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9133E828;
	Fri,  6 Mar 2020 16:05:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9133E828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583507185;
	bh=DGXSFHvBRSnS7JfXzMvpdEdxpSVv6nTkt2k/x4vKJsY=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=sreLaVRuzADvJyQBa/lJOPmoQHAMgIwvIplCr93t+ciKvStJ3HeA50BgD7pnnnf7X
	 NIi8RH7o6Hb1cpGIjgtiEwaReMT9mn+BcOrL+Tn7LlpeBGiCUpC4vN6nk6Wjwj2ORC
	 ECFSRQ8w7KXYRDnPTG2fnY6VeJ3/U6uTg1q8c6vI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08C98F80299;
	Fri,  6 Mar 2020 16:03:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 815C1F80291; Fri,  6 Mar 2020 16:03:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id A5320F80125
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 16:03:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5320F80125
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2903231B;
 Fri,  6 Mar 2020 07:03:14 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A0BC63F237;
 Fri,  6 Mar 2020 07:03:13 -0800 (PST)
Date: Fri, 06 Mar 2020 15:03:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc-pcm: check DAI's activity more simply" to the asoc
 tree
In-Reply-To: <87k13yp9ub.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87k13yp9ub.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

   ASoC: soc-pcm: check DAI's activity more simply

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

From 67ad877757cea329f74c1e169ec54131c3f223ce Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 6 Mar 2020 10:10:04 +0900
Subject: [PATCH] ASoC: soc-pcm: check DAI's activity more simply

soc_pcm_hw_free() want to call snd_soc_dai_digital_mute()
if it was last user of Playback or Capture.

	bool playback = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
	int playback_active = dai->stream_active[SNDRV_PCM_STREAM_PLAYBACK];
	int capture_active  = dai->stream_active[SNDRV_PCM_STREAM_CAPTURE];

	if ((playback  && playback_active == 1) ||
	    (!playback && capture_active  == 1))
		snd_soc_dai_digital_mute(...)

But it is same as

	int active = dai->stream_active[substream->stream];

	if (active == 1)
		snd_soc_dai_digital_mute(...)

This patch simplify the code.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87k13yp9ub.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 7d787e0966f3..af0e17bfeeab 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1202,7 +1202,6 @@ static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
-	bool playback = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	int i;
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
@@ -1226,11 +1225,9 @@ static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
 
 	/* apply codec digital mute */
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
-		int playback_active = codec_dai->stream_active[SNDRV_PCM_STREAM_PLAYBACK];
-		int capture_active  = codec_dai->stream_active[SNDRV_PCM_STREAM_CAPTURE];
+		int active = codec_dai->stream_active[substream->stream];
 
-		if ((playback && playback_active == 1) ||
-		    (!playback && capture_active == 1))
+		if (active == 1)
 			snd_soc_dai_digital_mute(codec_dai, 1,
 						 substream->stream);
 	}
-- 
2.20.1

