Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA1F195A64
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 16:57:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74A4216A5;
	Fri, 27 Mar 2020 16:56:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74A4216A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585324638;
	bh=OjIdLzUWnSfEHULcx289rkt6xNb5qmYpJw8TtKXfokA=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=U17oGfbl2R2ZqtP8YH2UKdfaVdH9TMt5hK2x6BYQ85KvQSgrhWJg4DMHaT7POg6u/
	 WUkKgA8vzFD4n1MeU9zr2jfJQosWD565h2f7dZDpVlecyTxHH2YDF76oX3NUh7W49N
	 MUuOWXrldTrP64tXZ5c82HXb+q/QASWRJWXRpIBc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CA51F80292;
	Fri, 27 Mar 2020 16:36:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0E3DF8043B; Fri, 27 Mar 2020 16:36:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 103E9F80443
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 16:36:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 103E9F80443
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DD3E1FB;
 Fri, 27 Mar 2020 08:36:14 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CBD233F71F;
 Fri, 27 Mar 2020 08:36:13 -0700 (PDT)
Date: Fri, 27 Mar 2020 15:36:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: fsl: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro
 for DAI pointer" to the asoc tree
In-Reply-To: <87v9mvir89.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87v9mvir89.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

   ASoC: fsl: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer

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

From 17198ae76e0ffcb891d34f59ad3725d9c536ac99 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 23 Mar 2020 14:18:30 +0900
Subject: [PATCH] ASoC: fsl: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro
 for DAI pointer

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87v9mvir89.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/eukrea-tlv320.c   |  4 ++--
 sound/soc/fsl/fsl-asoc-card.c   | 10 +++++-----
 sound/soc/fsl/fsl_asrc_dma.c    |  6 +++---
 sound/soc/fsl/fsl_spdif.c       | 10 +++++-----
 sound/soc/fsl/fsl_ssi.c         |  8 ++++----
 sound/soc/fsl/imx-audmix.c      |  8 ++++----
 sound/soc/fsl/imx-mc13783.c     |  4 ++--
 sound/soc/fsl/imx-sgtl5000.c    |  2 +-
 sound/soc/fsl/mpc5200_dma.c     | 10 +++++-----
 sound/soc/fsl/mpc5200_psc_i2s.c |  2 +-
 sound/soc/fsl/mpc8610_hpcd.c    |  4 ++--
 sound/soc/fsl/mx27vis-aic32x4.c |  4 ++--
 sound/soc/fsl/p1022_ds.c        |  4 ++--
 sound/soc/fsl/p1022_rdk.c       |  4 ++--
 sound/soc/fsl/wm1133-ev1.c      |  6 +++---
 15 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/sound/soc/fsl/eukrea-tlv320.c b/sound/soc/fsl/eukrea-tlv320.c
index 6f3b768489f6..4ff2d21bb32f 100644
--- a/sound/soc/fsl/eukrea-tlv320.c
+++ b/sound/soc/fsl/eukrea-tlv320.c
@@ -31,8 +31,8 @@ static int eukrea_tlv320_hw_params(struct snd_pcm_substream *substream,
 			    struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, 0,
diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 9ce55feaac22..bb33601fab84 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -159,7 +159,7 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_substream *substream,
 		return 0;
 
 	/* Specific configurations of DAIs starts from here */
-	ret = snd_soc_dai_set_sysclk(rtd->cpu_dai, cpu_priv->sysclk_id[tx],
+	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), cpu_priv->sysclk_id[tx],
 				     cpu_priv->sysclk_freq[tx],
 				     cpu_priv->sysclk_dir[tx]);
 	if (ret && ret != -ENOTSUPP) {
@@ -168,7 +168,7 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	if (cpu_priv->slot_width) {
-		ret = snd_soc_dai_set_tdm_slot(rtd->cpu_dai, 0x3, 0x3, 2,
+		ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2,
 					       cpu_priv->slot_width);
 		if (ret && ret != -ENOTSUPP) {
 			dev_err(dev, "failed to set TDM slot for cpu dai\n");
@@ -257,7 +257,7 @@ static int fsl_asoc_card_set_bias_level(struct snd_soc_card *card,
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
-	codec_dai = rtd->codec_dai;
+	codec_dai = asoc_rtd_to_codec(rtd, 0);
 	if (dapm->dev != codec_dai->dev)
 		return 0;
 
@@ -446,14 +446,14 @@ static int fsl_asoc_card_late_probe(struct snd_soc_card *card)
 	struct fsl_asoc_card_priv *priv = snd_soc_card_get_drvdata(card);
 	struct snd_soc_pcm_runtime *rtd = list_first_entry(
 			&card->rtd_list, struct snd_soc_pcm_runtime, list);
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct codec_priv *codec_priv = &priv->codec_priv;
 	struct device *dev = card->dev;
 	int ret;
 
 	if (fsl_asoc_card_is_ac97(priv)) {
 #if IS_ENABLED(CONFIG_SND_AC97_CODEC)
-		struct snd_soc_component *component = rtd->codec_dai->component;
+		struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 		struct snd_ac97 *ac97 = snd_soc_component_get_drvdata(component);
 
 		/*
diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 44e5924be870..e7178817d7a7 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -152,7 +152,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	for_each_dpcm_be(rtd, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
 		struct snd_pcm_substream *substream_be;
-		struct snd_soc_dai *dai = be->cpu_dai;
+		struct snd_soc_dai *dai = asoc_rtd_to_cpu(be, 0);
 
 		if (dpcm->fe != rtd)
 			continue;
@@ -169,7 +169,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	}
 
 	/* Override dma_data of the Front-End and config its dmaengine */
-	dma_params_fe = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
+	dma_params_fe = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
 	dma_params_fe->addr = asrc_priv->paddr + REG_ASRDx(!dir, index);
 	dma_params_fe->maxburst = dma_params_be->maxburst;
 
@@ -328,7 +328,7 @@ static int fsl_asrc_dma_startup(struct snd_soc_component *component,
 		goto dma_chan_err;
 	}
 
-	dma_data = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
+	dma_data = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
 
 	/* Refine the snd_imx_hardware according to caps of DMA. */
 	ret = snd_dmaengine_pcm_refine_runtime_hwparams(substream,
diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 7858a5499ac5..c711d2d93280 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -370,7 +370,7 @@ static int spdif_set_sample_rate(struct snd_pcm_substream *substream,
 				int sample_rate)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(rtd->cpu_dai);
+	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 	struct spdif_mixer_control *ctrl = &spdif_priv->fsl_spdif_control;
 	struct regmap *regmap = spdif_priv->regmap;
 	struct platform_device *pdev = spdif_priv->pdev;
@@ -458,7 +458,7 @@ static int fsl_spdif_startup(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *cpu_dai)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(rtd->cpu_dai);
+	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 	struct platform_device *pdev = spdif_priv->pdev;
 	struct regmap *regmap = spdif_priv->regmap;
 	u32 scr, mask;
@@ -534,7 +534,7 @@ static void fsl_spdif_shutdown(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *cpu_dai)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(rtd->cpu_dai);
+	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 	struct regmap *regmap = spdif_priv->regmap;
 	u32 scr, mask, i;
 
@@ -569,7 +569,7 @@ static int fsl_spdif_hw_params(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(rtd->cpu_dai);
+	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 	struct spdif_mixer_control *ctrl = &spdif_priv->fsl_spdif_control;
 	struct platform_device *pdev = spdif_priv->pdev;
 	u32 sample_rate = params_rate(params);
@@ -597,7 +597,7 @@ static int fsl_spdif_trigger(struct snd_pcm_substream *substream,
 				int cmd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(rtd->cpu_dai);
+	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 	struct regmap *regmap = spdif_priv->regmap;
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	u32 intr = SIE_INTR_FOR(tx);
diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index 5c97269be346..bad89b0d129e 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -631,7 +631,7 @@ static int fsl_ssi_startup(struct snd_pcm_substream *substream,
 			   struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct fsl_ssi *ssi = snd_soc_dai_get_drvdata(rtd->cpu_dai);
+	struct fsl_ssi *ssi = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 	int ret;
 
 	ret = clk_prepare_enable(ssi->clk);
@@ -655,7 +655,7 @@ static void fsl_ssi_shutdown(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct fsl_ssi *ssi = snd_soc_dai_get_drvdata(rtd->cpu_dai);
+	struct fsl_ssi *ssi = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 
 	clk_disable_unprepare(ssi->clk);
 }
@@ -854,7 +854,7 @@ static int fsl_ssi_hw_free(struct snd_pcm_substream *substream,
 			   struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct fsl_ssi *ssi = snd_soc_dai_get_drvdata(rtd->cpu_dai);
+	struct fsl_ssi *ssi = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 
 	if (fsl_ssi_is_i2s_master(ssi) &&
 	    ssi->baudclk_streams & BIT(substream->stream)) {
@@ -1059,7 +1059,7 @@ static int fsl_ssi_trigger(struct snd_pcm_substream *substream, int cmd,
 			   struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct fsl_ssi *ssi = snd_soc_dai_get_drvdata(rtd->cpu_dai);
+	struct fsl_ssi *ssi = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 
 	switch (cmd) {
diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 5ef6881395e0..e09b45de0efd 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -85,13 +85,13 @@ static int imx_audmix_fe_hw_params(struct snd_pcm_substream *substream,
 	dir  = tx ? SND_SOC_CLOCK_OUT : SND_SOC_CLOCK_IN;
 
 	/* set DAI configuration */
-	ret = snd_soc_dai_set_fmt(rtd->cpu_dai, fmt);
+	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0), fmt);
 	if (ret) {
 		dev_err(dev, "failed to set cpu dai fmt: %d\n", ret);
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_sysclk(rtd->cpu_dai, FSL_SAI_CLK_MAST1, 0, dir);
+	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), FSL_SAI_CLK_MAST1, 0, dir);
 	if (ret) {
 		dev_err(dev, "failed to set cpu sysclk: %d\n", ret);
 		return ret;
@@ -101,7 +101,7 @@ static int imx_audmix_fe_hw_params(struct snd_pcm_substream *substream,
 	 * Per datasheet, AUDMIX expects 8 slots and 32 bits
 	 * for every slot in TDM mode.
 	 */
-	ret = snd_soc_dai_set_tdm_slot(rtd->cpu_dai, BIT(channels) - 1,
+	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_cpu(rtd, 0), BIT(channels) - 1,
 				       BIT(channels) - 1, 8, 32);
 	if (ret)
 		dev_err(dev, "failed to set cpu dai tdm slot: %d\n", ret);
@@ -125,7 +125,7 @@ static int imx_audmix_be_hw_params(struct snd_pcm_substream *substream,
 	fmt |= SND_SOC_DAIFMT_CBM_CFM;
 
 	/* set AUDMIX DAI configuration */
-	ret = snd_soc_dai_set_fmt(rtd->cpu_dai, fmt);
+	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0), fmt);
 	if (ret)
 		dev_err(dev, "failed to set AUDMIX DAI fmt: %d\n", ret);
 
diff --git a/sound/soc/fsl/imx-mc13783.c b/sound/soc/fsl/imx-mc13783.c
index 2b679680c93f..fab2d6c56653 100644
--- a/sound/soc/fsl/imx-mc13783.c
+++ b/sound/soc/fsl/imx-mc13783.c
@@ -27,8 +27,8 @@ static int imx_mc13783_hifi_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x3, 0x3, 4, 16);
diff --git a/sound/soc/fsl/imx-sgtl5000.c b/sound/soc/fsl/imx-sgtl5000.c
index 15e8b9343c35..f45cb4bbb6c4 100644
--- a/sound/soc/fsl/imx-sgtl5000.c
+++ b/sound/soc/fsl/imx-sgtl5000.c
@@ -30,7 +30,7 @@ static int imx_sgtl5000_dai_init(struct snd_soc_pcm_runtime *rtd)
 	struct device *dev = rtd->card->dev;
 	int ret;
 
-	ret = snd_soc_dai_set_sysclk(rtd->codec_dai, SGTL5000_SYSCLK,
+	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0), SGTL5000_SYSCLK,
 				     data->clk_frequency, SND_SOC_CLOCK_IN);
 	if (ret) {
 		dev_err(dev, "could not set codec driver clock params\n");
diff --git a/sound/soc/fsl/mpc5200_dma.c b/sound/soc/fsl/mpc5200_dma.c
index ed7211d744b3..3b8c796d7829 100644
--- a/sound/soc/fsl/mpc5200_dma.c
+++ b/sound/soc/fsl/mpc5200_dma.c
@@ -115,7 +115,7 @@ static int psc_dma_trigger(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct psc_dma *psc_dma = snd_soc_dai_get_drvdata(rtd->cpu_dai);
+	struct psc_dma *psc_dma = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct psc_dma_stream *s = to_psc_dma_stream(substream, psc_dma);
 	struct mpc52xx_psc __iomem *regs = psc_dma->psc_regs;
@@ -217,7 +217,7 @@ static int psc_dma_open(struct snd_soc_component *component,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct psc_dma *psc_dma = snd_soc_dai_get_drvdata(rtd->cpu_dai);
+	struct psc_dma *psc_dma = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 	struct psc_dma_stream *s;
 	int rc;
 
@@ -245,7 +245,7 @@ static int psc_dma_close(struct snd_soc_component *component,
 			 struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct psc_dma *psc_dma = snd_soc_dai_get_drvdata(rtd->cpu_dai);
+	struct psc_dma *psc_dma = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 	struct psc_dma_stream *s;
 
 	dev_dbg(psc_dma->dev, "psc_dma_close(substream=%p)\n", substream);
@@ -271,7 +271,7 @@ psc_dma_pointer(struct snd_soc_component *component,
 		struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct psc_dma *psc_dma = snd_soc_dai_get_drvdata(rtd->cpu_dai);
+	struct psc_dma *psc_dma = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 	struct psc_dma_stream *s;
 	dma_addr_t count;
 
@@ -298,7 +298,7 @@ static int psc_dma_new(struct snd_soc_component *component,
 		       struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_card *card = rtd->card->snd_card;
-	struct snd_soc_dai *dai = rtd->cpu_dai;
+	struct snd_soc_dai *dai = asoc_rtd_to_cpu(rtd, 0);
 	struct snd_pcm *pcm = rtd->pcm;
 	size_t size = psc_dma_hardware.buffer_bytes_max;
 	int rc;
diff --git a/sound/soc/fsl/mpc5200_psc_i2s.c b/sound/soc/fsl/mpc5200_psc_i2s.c
index 9bc01f374b39..1ab4fbda08cb 100644
--- a/sound/soc/fsl/mpc5200_psc_i2s.c
+++ b/sound/soc/fsl/mpc5200_psc_i2s.c
@@ -39,7 +39,7 @@ static int psc_i2s_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct psc_dma *psc_dma = snd_soc_dai_get_drvdata(rtd->cpu_dai);
+	struct psc_dma *psc_dma = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 	u32 mode;
 
 	dev_dbg(psc_dma->dev, "%s(substream=%p) p_size=%i p_bytes=%i"
diff --git a/sound/soc/fsl/mpc8610_hpcd.c b/sound/soc/fsl/mpc8610_hpcd.c
index 23617eb09ba1..f7bd90051ce7 100644
--- a/sound/soc/fsl/mpc8610_hpcd.c
+++ b/sound/soc/fsl/mpc8610_hpcd.c
@@ -105,7 +105,7 @@ static int mpc8610_hpcd_startup(struct snd_pcm_substream *substream)
 	int ret = 0;
 
 	/* Tell the codec driver what the serial protocol is. */
-	ret = snd_soc_dai_set_fmt(rtd->codec_dai, machine_data->dai_format);
+	ret = snd_soc_dai_set_fmt(asoc_rtd_to_codec(rtd, 0), machine_data->dai_format);
 	if (ret < 0) {
 		dev_err(dev, "could not set codec driver audio format\n");
 		return ret;
@@ -115,7 +115,7 @@ static int mpc8610_hpcd_startup(struct snd_pcm_substream *substream)
 	 * Tell the codec driver what the MCLK frequency is, and whether it's
 	 * a slave or master.
 	 */
-	ret = snd_soc_dai_set_sysclk(rtd->codec_dai, 0,
+	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0), 0,
 				     machine_data->clk_frequency,
 				     machine_data->codec_clk_direction);
 	if (ret < 0) {
diff --git a/sound/soc/fsl/mx27vis-aic32x4.c b/sound/soc/fsl/mx27vis-aic32x4.c
index 38ac4a397742..a36d4e8cd55c 100644
--- a/sound/soc/fsl/mx27vis-aic32x4.c
+++ b/sound/soc/fsl/mx27vis-aic32x4.c
@@ -37,8 +37,8 @@ static int mx27vis_aic32x4_hw_params(struct snd_pcm_substream *substream,
 			    struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, 0,
diff --git a/sound/soc/fsl/p1022_ds.c b/sound/soc/fsl/p1022_ds.c
index 6114b01b90f7..fe3091590f20 100644
--- a/sound/soc/fsl/p1022_ds.c
+++ b/sound/soc/fsl/p1022_ds.c
@@ -128,7 +128,7 @@ static int p1022_ds_startup(struct snd_pcm_substream *substream)
 	int ret = 0;
 
 	/* Tell the codec driver what the serial protocol is. */
-	ret = snd_soc_dai_set_fmt(rtd->codec_dai, mdata->dai_format);
+	ret = snd_soc_dai_set_fmt(asoc_rtd_to_codec(rtd, 0), mdata->dai_format);
 	if (ret < 0) {
 		dev_err(dev, "could not set codec driver audio format\n");
 		return ret;
@@ -138,7 +138,7 @@ static int p1022_ds_startup(struct snd_pcm_substream *substream)
 	 * Tell the codec driver what the MCLK frequency is, and whether it's
 	 * a slave or master.
 	 */
-	ret = snd_soc_dai_set_sysclk(rtd->codec_dai, 0, mdata->clk_frequency,
+	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0), 0, mdata->clk_frequency,
 				     mdata->codec_clk_direction);
 	if (ret < 0) {
 		dev_err(dev, "could not set codec driver clock params\n");
diff --git a/sound/soc/fsl/p1022_rdk.c b/sound/soc/fsl/p1022_rdk.c
index 72687235c0ae..f5374fe354ab 100644
--- a/sound/soc/fsl/p1022_rdk.c
+++ b/sound/soc/fsl/p1022_rdk.c
@@ -134,14 +134,14 @@ static int p1022_rdk_startup(struct snd_pcm_substream *substream)
 	int ret = 0;
 
 	/* Tell the codec driver what the serial protocol is. */
-	ret = snd_soc_dai_set_fmt(rtd->codec_dai, mdata->dai_format);
+	ret = snd_soc_dai_set_fmt(asoc_rtd_to_codec(rtd, 0), mdata->dai_format);
 	if (ret < 0) {
 		dev_err(dev, "could not set codec driver audio format (ret=%i)\n",
 			ret);
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_pll(rtd->codec_dai, 0, 0, mdata->clk_frequency,
+	ret = snd_soc_dai_set_pll(asoc_rtd_to_codec(rtd, 0), 0, 0, mdata->clk_frequency,
 		mdata->clk_frequency);
 	if (ret < 0) {
 		dev_err(dev, "could not set codec PLL frequency (ret=%i)\n",
diff --git a/sound/soc/fsl/wm1133-ev1.c b/sound/soc/fsl/wm1133-ev1.c
index 52d321bede9c..8b1551c55452 100644
--- a/sound/soc/fsl/wm1133-ev1.c
+++ b/sound/soc/fsl/wm1133-ev1.c
@@ -76,8 +76,8 @@ static int wm1133_ev1_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	int i, found = 0;
 	snd_pcm_format_t format = params_format(params);
 	unsigned int rate = params_rate(params);
@@ -196,7 +196,7 @@ static struct snd_soc_jack_pin mic_jack_pins[] = {
 
 static int wm1133_ev1_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 
 	/* Headphone jack detection */
 	snd_soc_card_jack_new(rtd->card, "Headphone", SND_JACK_HEADPHONE,
-- 
2.20.1

