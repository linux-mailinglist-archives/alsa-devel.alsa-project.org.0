Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D623217FF9C
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 14:57:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7125C1663;
	Tue, 10 Mar 2020 14:56:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7125C1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583848627;
	bh=pykprDb9SkZnEh2LPVOoCfUg4B+1s2Jr30snNyIY5RE=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=mjFSRFkZ2hq2Q2mZIbr0f50njY6aGrt996VtNIbHc+kImYwIoqgAyxuGuD2J5fcNP
	 qRsU3m1PA0kImSveHfEyeP/NLo5B7cJnC9UJLSBsZGeP5FyOD4IdzNbri/2D8K9Gjv
	 1JFI3BPrU64V2MX5ARl7mpJ1t0QzCgjau2GQAiz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB743F802DF;
	Tue, 10 Mar 2020 14:51:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5055EF802DD; Tue, 10 Mar 2020 14:51:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 66905F802D2
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 14:51:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66905F802D2
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D09930E;
 Tue, 10 Mar 2020 06:51:43 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D493C3F6CF;
 Tue, 10 Mar 2020 06:51:42 -0700 (PDT)
Date: Tue, 10 Mar 2020 13:51:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: mediatek: use for_each_rtd_codecs/cpus_dai() macro" to
 the asoc tree
In-Reply-To: <87zhcqgohd.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87zhcqgohd.wl-kuninori.morimoto.gx@renesas.com>
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

   ASoC: mediatek: use for_each_rtd_codecs/cpus_dai() macro

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

From c8654520234192688eefd7b40a66de7cf69c5189 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 9 Mar 2020 13:07:42 +0900
Subject: [PATCH] ASoC: mediatek: use for_each_rtd_codecs/cpus_dai() macro

This patch switch to use plural form macro.

	- for_each_rtd_codec_dai()
	+ for_each_rtd_codec_dais()

	- for_each_rtd_codec_dai_rollback()
	+ for_each_rtd_codec_dais_rollback()

	- for_each_rtd_cpu_dai()
	+ for_each_rtd_cpu_dais()

	- for_each_rtd_cpu_dai_rollback()
	+ for_each_rtd_cpu_dais_rollback()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87zhcqgohd.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c   | 2 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c   | 2 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c          | 2 +-
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
index 2e1e61d8f127..5d82159f4f2e 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
@@ -47,7 +47,7 @@ static int mt8173_rt5650_rt5514_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai;
 	int i, ret;
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		/* pll from mclk 12.288M */
 		ret = snd_soc_dai_set_pll(codec_dai, 0, 0, MCLK_FOR_CODECS,
 					  params_rate(params) * 512);
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
index ebcc0b86286b..f65e3ebe38b8 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
@@ -51,7 +51,7 @@ static int mt8173_rt5650_rt5676_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai;
 	int i, ret;
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		/* pll from mclk 12.288M */
 		ret = snd_soc_dai_set_pll(codec_dai, 0, 0, MCLK_FOR_CODECS,
 					  params_rate(params) * 512);
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650.c b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
index 849b050a54d1..bbc4ad749892 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
@@ -78,7 +78,7 @@ static int mt8173_rt5650_hw_params(struct snd_pcm_substream *substream,
 		break;
 	}
 
-	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		/* pll from mclk */
 		ret = snd_soc_dai_set_pll(codec_dai, 0, 0, mclk_clock,
 					  params_rate(params) * 512);
diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 4a5ef07e956b..c4e4f1f99dde 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -52,7 +52,7 @@ static int mt8183_da7219_i2s_hw_params(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		dev_err(rtd->dev, "failed to set cpu dai sysclk\n");
 
-	for_each_rtd_codec_dai(rtd, j, codec_dai) {
+	for_each_rtd_codec_dais(rtd, j, codec_dai) {
 
 		if (!strcmp(codec_dai->component->name, "da7219.5-001a")) {
 			ret = snd_soc_dai_set_sysclk(codec_dai,
@@ -85,7 +85,7 @@ static int mt8183_da7219_hw_free(struct snd_pcm_substream *substream)
 	struct snd_soc_dai *codec_dai;
 	int ret = 0, j;
 
-	for_each_rtd_codec_dai(rtd, j, codec_dai) {
+	for_each_rtd_codec_dais(rtd, j, codec_dai) {
 
 		if (!strcmp(codec_dai->component->name, "da7219.5-001a")) {
 			ret = snd_soc_dai_set_pll(codec_dai,
-- 
2.20.1

