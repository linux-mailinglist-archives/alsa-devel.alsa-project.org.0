Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A63195A44
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 16:50:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0818B16A2;
	Fri, 27 Mar 2020 16:49:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0818B16A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585324238;
	bh=KchIG5SSTlL/PeMk3nh09kZywm/msAtFLmLl/ZPkDV8=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=bWhydEAbsCSQkMP621gcxQYLVNFnFsUDvysWwo6aBZU43mEsAdkvgi309OdP3U3oJ
	 BEQMAHgAwxHRjQE6g+CrcBK55a8jWlBbakrMqMbHuRakCctixotneXodqePv2hHjyM
	 yAJA54VVYDEPMegZ8clhA6eLXcQxZSz65+etynBc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FCB9F80390;
	Fri, 27 Mar 2020 16:35:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C6CAF80390; Fri, 27 Mar 2020 16:35:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id B5BD7F8028B
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 16:35:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5BD7F8028B
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33A461FB;
 Fri, 27 Mar 2020 08:35:24 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 856603F71F;
 Fri, 27 Mar 2020 08:35:23 -0700 (PDT)
Date: Fri, 27 Mar 2020 15:35:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: samsung: use asoc_rtd_to_cpu() / asoc_rtd_to_codec()
 macro for DAI pointer" to the asoc tree
In-Reply-To: <87ftdzir57.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87ftdzir57.wl-kuninori.morimoto.gx@renesas.com>
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

   ASoC: samsung: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer

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

From 7de6b6bc1a58ec3118ca825d8b48faac3a956a85 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 23 Mar 2020 14:20:20 +0900
Subject: [PATCH] ASoC: samsung: use asoc_rtd_to_cpu() / asoc_rtd_to_codec()
 macro for DAI pointer

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87ftdzir57.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/arndale.c         |  6 +++---
 sound/soc/samsung/bells.c           | 16 ++++++++--------
 sound/soc/samsung/h1940_uda1380.c   |  2 +-
 sound/soc/samsung/i2s.c             |  2 +-
 sound/soc/samsung/jive_wm8750.c     |  4 ++--
 sound/soc/samsung/littlemill.c      | 14 +++++++-------
 sound/soc/samsung/lowland.c         |  4 ++--
 sound/soc/samsung/neo1973_wm8753.c  | 10 +++++-----
 sound/soc/samsung/odroid.c          |  2 +-
 sound/soc/samsung/pcm.c             |  4 ++--
 sound/soc/samsung/rx1950_uda1380.c  |  2 +-
 sound/soc/samsung/s3c-i2s-v2.c      |  2 +-
 sound/soc/samsung/s3c24xx_simtec.c  |  4 ++--
 sound/soc/samsung/s3c24xx_uda134x.c |  6 +++---
 sound/soc/samsung/smartq_wm8987.c   |  4 ++--
 sound/soc/samsung/smdk_spdif.c      |  2 +-
 sound/soc/samsung/smdk_wm8580.c     |  2 +-
 sound/soc/samsung/smdk_wm8994.c     |  2 +-
 sound/soc/samsung/smdk_wm8994pcm.c  |  4 ++--
 sound/soc/samsung/snow.c            |  4 ++--
 sound/soc/samsung/spdif.c           |  8 ++++----
 sound/soc/samsung/speyside.c        |  8 ++++----
 sound/soc/samsung/tm2_wm5110.c      | 16 ++++++++--------
 sound/soc/samsung/tobermory.c       |  8 ++++----
 24 files changed, 68 insertions(+), 68 deletions(-)

diff --git a/sound/soc/samsung/arndale.c b/sound/soc/samsung/arndale.c
index 6e6d67d6e0ab..c81ece78e036 100644
--- a/sound/soc/samsung/arndale.c
+++ b/sound/soc/samsung/arndale.c
@@ -21,8 +21,8 @@ static int arndale_rt5631_hw_params(struct snd_pcm_substream *substream,
 				    struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int rfs, ret;
 	unsigned long rclk;
 
@@ -56,7 +56,7 @@ static int arndale_wm1811_hw_params(struct snd_pcm_substream *substream,
 				    struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	unsigned int rfs, rclk;
 
 	/* Ensure AIF1CLK is >= 3 MHz for optimal performance */
diff --git a/sound/soc/samsung/bells.c b/sound/soc/samsung/bells.c
index 5de633497f83..8b83f39c3ac9 100644
--- a/sound/soc/samsung/bells.c
+++ b/sound/soc/samsung/bells.c
@@ -60,7 +60,7 @@ static int bells_set_bias_level(struct snd_soc_card *card,
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[DAI_DSP_CODEC]);
-	codec_dai = rtd->codec_dai;
+	codec_dai = asoc_rtd_to_codec(rtd, 0);
 	component = codec_dai->component;
 
 	if (dapm->dev != codec_dai->dev)
@@ -106,7 +106,7 @@ static int bells_set_bias_level_post(struct snd_soc_card *card,
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[DAI_DSP_CODEC]);
-	codec_dai = rtd->codec_dai;
+	codec_dai = asoc_rtd_to_codec(rtd, 0);
 	component = codec_dai->component;
 
 	if (dapm->dev != codec_dai->dev)
@@ -152,11 +152,11 @@ static int bells_late_probe(struct snd_soc_card *card)
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[DAI_AP_DSP]);
-	wm0010 = rtd->codec_dai->component;
+	wm0010 = asoc_rtd_to_codec(rtd, 0)->component;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[DAI_DSP_CODEC]);
-	component = rtd->codec_dai->component;
-	aif1_dai = rtd->codec_dai;
+	component = asoc_rtd_to_codec(rtd, 0)->component;
+	aif1_dai = asoc_rtd_to_codec(rtd, 0);
 
 	ret = snd_soc_component_set_sysclk(component, ARIZONA_CLK_SYSCLK,
 				       ARIZONA_CLK_SRC_FLL1,
@@ -195,7 +195,7 @@ static int bells_late_probe(struct snd_soc_card *card)
 	}
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[DAI_CODEC_CP]);
-	aif2_dai = rtd->cpu_dai;
+	aif2_dai = asoc_rtd_to_cpu(rtd, 0);
 
 	ret = snd_soc_dai_set_sysclk(aif2_dai, ARIZONA_CLK_ASYNCCLK, 0, 0);
 	if (ret != 0) {
@@ -207,8 +207,8 @@ static int bells_late_probe(struct snd_soc_card *card)
 		return 0;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[DAI_CODEC_SUB]);
-	aif3_dai = rtd->cpu_dai;
-	wm9081_dai = rtd->codec_dai;
+	aif3_dai = asoc_rtd_to_cpu(rtd, 0);
+	wm9081_dai = asoc_rtd_to_codec(rtd, 0);
 
 	ret = snd_soc_dai_set_sysclk(aif3_dai, ARIZONA_CLK_SYSCLK, 0, 0);
 	if (ret != 0) {
diff --git a/sound/soc/samsung/h1940_uda1380.c b/sound/soc/samsung/h1940_uda1380.c
index a95c34e53a2b..9139a1e7e200 100644
--- a/sound/soc/samsung/h1940_uda1380.c
+++ b/sound/soc/samsung/h1940_uda1380.c
@@ -68,7 +68,7 @@ static int h1940_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	int div;
 	int ret;
 	unsigned int rate = params_rate(params);
diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index a57bb989a0ef..f86e3028b402 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -932,7 +932,7 @@ static int i2s_trigger(struct snd_pcm_substream *substream,
 	struct samsung_i2s_priv *priv = snd_soc_dai_get_drvdata(dai);
 	int capture = (substream->stream == SNDRV_PCM_STREAM_CAPTURE);
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct i2s_dai *i2s = to_info(rtd->cpu_dai);
+	struct i2s_dai *i2s = to_info(asoc_rtd_to_cpu(rtd, 0));
 	unsigned long flags;
 
 	switch (cmd) {
diff --git a/sound/soc/samsung/jive_wm8750.c b/sound/soc/samsung/jive_wm8750.c
index 949d2e029962..30899016cf08 100644
--- a/sound/soc/samsung/jive_wm8750.c
+++ b/sound/soc/samsung/jive_wm8750.c
@@ -33,8 +33,8 @@ static int jive_hw_params(struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct s3c_i2sv2_rate_calc div;
 	unsigned int clk = 0;
 	int ret = 0;
diff --git a/sound/soc/samsung/littlemill.c b/sound/soc/samsung/littlemill.c
index 2f2f83a8c23a..f4375c49f7f4 100644
--- a/sound/soc/samsung/littlemill.c
+++ b/sound/soc/samsung/littlemill.c
@@ -23,7 +23,7 @@ static int littlemill_set_bias_level(struct snd_soc_card *card,
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
-	aif1_dai = rtd->codec_dai;
+	aif1_dai = asoc_rtd_to_codec(rtd, 0);
 
 	if (dapm->dev != aif1_dai->dev)
 		return 0;
@@ -70,7 +70,7 @@ static int littlemill_set_bias_level_post(struct snd_soc_card *card,
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
-	aif1_dai = rtd->codec_dai;
+	aif1_dai = asoc_rtd_to_codec(rtd, 0);
 
 	if (dapm->dev != aif1_dai->dev)
 		return 0;
@@ -105,7 +105,7 @@ static int littlemill_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	sample_rate = params_rate(params);
@@ -181,7 +181,7 @@ static int bbclk_ev(struct snd_soc_dapm_widget *w,
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[1]);
-	aif2_dai = rtd->cpu_dai;
+	aif2_dai = asoc_rtd_to_cpu(rtd, 0);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -264,11 +264,11 @@ static int littlemill_late_probe(struct snd_soc_card *card)
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
-	component = rtd->codec_dai->component;
-	aif1_dai = rtd->codec_dai;
+	component = asoc_rtd_to_codec(rtd, 0)->component;
+	aif1_dai = asoc_rtd_to_codec(rtd, 0);
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[1]);
-	aif2_dai = rtd->cpu_dai;
+	aif2_dai = asoc_rtd_to_cpu(rtd, 0);
 
 	ret = snd_soc_dai_set_sysclk(aif1_dai, WM8994_SYSCLK_MCLK2,
 				     32768, SND_SOC_CLOCK_IN);
diff --git a/sound/soc/samsung/lowland.c b/sound/soc/samsung/lowland.c
index fcc7897ee7d0..998d10cf8c94 100644
--- a/sound/soc/samsung/lowland.c
+++ b/sound/soc/samsung/lowland.c
@@ -32,7 +32,7 @@ static struct snd_soc_jack_pin lowland_headset_pins[] = {
 
 static int lowland_wm5100_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
 	ret = snd_soc_component_set_sysclk(component, WM5100_CLK_SYSCLK,
@@ -65,7 +65,7 @@ static int lowland_wm5100_init(struct snd_soc_pcm_runtime *rtd)
 
 static int lowland_wm9081_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 
 	snd_soc_dapm_nc_pin(&rtd->card->dapm, "LINEOUT");
 
diff --git a/sound/soc/samsung/neo1973_wm8753.c b/sound/soc/samsung/neo1973_wm8753.c
index 1339e41e9860..b7ce1da854ce 100644
--- a/sound/soc/samsung/neo1973_wm8753.c
+++ b/sound/soc/samsung/neo1973_wm8753.c
@@ -26,8 +26,8 @@ static int neo1973_hifi_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	unsigned int pll_out = 0, bclk = 0;
 	int ret = 0;
 	unsigned long iis_clkrate;
@@ -100,7 +100,7 @@ static int neo1973_hifi_hw_params(struct snd_pcm_substream *substream,
 static int neo1973_hifi_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 
 	/* disable the PLL */
 	return snd_soc_dai_set_pll(codec_dai, WM8753_PLL1, 0, 0, 0);
@@ -118,7 +118,7 @@ static int neo1973_voice_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	unsigned int pcmdiv = 0;
 	int ret = 0;
 	unsigned long iis_clkrate;
@@ -155,7 +155,7 @@ static int neo1973_voice_hw_params(struct snd_pcm_substream *substream,
 static int neo1973_voice_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 
 	/* disable the PLL */
 	return snd_soc_dai_set_pll(codec_dai, WM8753_PLL2, 0, 0, 0);
diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index 30c7e1bc2a30..6eda5af989fe 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -98,7 +98,7 @@ static int odroid_card_be_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 
 	if (rtd->num_codecs > 1) {
-		struct snd_soc_dai *codec_dai = rtd->codec_dais[1];
+		struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 1);
 
 		ret = snd_soc_dai_set_sysclk(codec_dai, 0, rclk_freq,
 					     SND_SOC_CLOCK_IN);
diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index f6e67d0e7882..a5b1a12b3496 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -212,7 +212,7 @@ static int s3c_pcm_trigger(struct snd_pcm_substream *substream, int cmd,
 			       struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct s3c_pcm_info *pcm = snd_soc_dai_get_drvdata(rtd->cpu_dai);
+	struct s3c_pcm_info *pcm = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 	unsigned long flags;
 
 	dev_dbg(pcm->dev, "Entered %s\n", __func__);
@@ -256,7 +256,7 @@ static int s3c_pcm_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *socdai)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct s3c_pcm_info *pcm = snd_soc_dai_get_drvdata(rtd->cpu_dai);
+	struct s3c_pcm_info *pcm = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 	void __iomem *regs = pcm->regs;
 	struct clk *clk;
 	int sclk_div, sync_div;
diff --git a/sound/soc/samsung/rx1950_uda1380.c b/sound/soc/samsung/rx1950_uda1380.c
index 4b247e91ae5b..3afe63c0923e 100644
--- a/sound/soc/samsung/rx1950_uda1380.c
+++ b/sound/soc/samsung/rx1950_uda1380.c
@@ -149,7 +149,7 @@ static int rx1950_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	int div;
 	int ret;
 	unsigned int rate = params_rate(params);
diff --git a/sound/soc/samsung/s3c-i2s-v2.c b/sound/soc/samsung/s3c-i2s-v2.c
index 593be1b668d6..358887848293 100644
--- a/sound/soc/samsung/s3c-i2s-v2.c
+++ b/sound/soc/samsung/s3c-i2s-v2.c
@@ -380,7 +380,7 @@ static int s3c2412_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 			       struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct s3c_i2sv2_info *i2s = to_info(rtd->cpu_dai);
+	struct s3c_i2sv2_info *i2s = to_info(asoc_rtd_to_cpu(rtd, 0));
 	int capture = (substream->stream == SNDRV_PCM_STREAM_CAPTURE);
 	unsigned long irqs;
 	int ret = 0;
diff --git a/sound/soc/samsung/s3c24xx_simtec.c b/sound/soc/samsung/s3c24xx_simtec.c
index 4543705b8d87..fd2a4da086f3 100644
--- a/sound/soc/samsung/s3c24xx_simtec.c
+++ b/sound/soc/samsung/s3c24xx_simtec.c
@@ -160,8 +160,8 @@ static int simtec_hw_params(struct snd_pcm_substream *substream,
 			    struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, 0,
diff --git a/sound/soc/samsung/s3c24xx_uda134x.c b/sound/soc/samsung/s3c24xx_uda134x.c
index 55d2a802a6cb..abb5c4713c53 100644
--- a/sound/soc/samsung/s3c24xx_uda134x.c
+++ b/sound/soc/samsung/s3c24xx_uda134x.c
@@ -51,7 +51,7 @@ static int s3c24xx_uda134x_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct s3c24xx_uda134x *priv = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	int ret = 0;
 
 	mutex_lock(&priv->clk_lock);
@@ -119,8 +119,8 @@ static int s3c24xx_uda134x_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	unsigned int clk = 0;
 	int ret = 0;
 	int clk_source, fs_mode;
diff --git a/sound/soc/samsung/smartq_wm8987.c b/sound/soc/samsung/smartq_wm8987.c
index fab3db9fdb98..36bef136d57f 100644
--- a/sound/soc/samsung/smartq_wm8987.c
+++ b/sound/soc/samsung/smartq_wm8987.c
@@ -25,8 +25,8 @@ static int smartq_hifi_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	unsigned int clk = 0;
 	int ret;
 
diff --git a/sound/soc/samsung/smdk_spdif.c b/sound/soc/samsung/smdk_spdif.c
index 4baef84d29ee..776a270261bf 100644
--- a/sound/soc/samsung/smdk_spdif.c
+++ b/sound/soc/samsung/smdk_spdif.c
@@ -101,7 +101,7 @@ static int smdk_hw_params(struct snd_pcm_substream *substream,
 		struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	unsigned long pll_out, rclk_rate;
 	int ret, ratio;
 
diff --git a/sound/soc/samsung/smdk_wm8580.c b/sound/soc/samsung/smdk_wm8580.c
index d096ff912260..02074c34a2b2 100644
--- a/sound/soc/samsung/smdk_wm8580.c
+++ b/sound/soc/samsung/smdk_wm8580.c
@@ -23,7 +23,7 @@ static int smdk_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	unsigned int pll_out;
 	int rfs, ret;
 
diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
index 8fa5f6b387ad..a9f345f19a8a 100644
--- a/sound/soc/samsung/smdk_wm8994.c
+++ b/sound/soc/samsung/smdk_wm8994.c
@@ -45,7 +45,7 @@ static int smdk_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	unsigned int pll_out;
 	int ret;
 
diff --git a/sound/soc/samsung/smdk_wm8994pcm.c b/sound/soc/samsung/smdk_wm8994pcm.c
index 6e44f7927852..746930dde5d7 100644
--- a/sound/soc/samsung/smdk_wm8994pcm.c
+++ b/sound/soc/samsung/smdk_wm8994pcm.c
@@ -44,8 +44,8 @@ static int smdk_wm8994_pcm_hw_params(struct snd_pcm_substream *substream,
 			      struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	unsigned long mclk_freq;
 	int rfs, ret;
 
diff --git a/sound/soc/samsung/snow.c b/sound/soc/samsung/snow.c
index bebcf0a4d608..40c5de8df0ff 100644
--- a/sound/soc/samsung/snow.c
+++ b/sound/soc/samsung/snow.c
@@ -110,9 +110,9 @@ static int snow_late_probe(struct snd_soc_card *card)
 
 	/* In the multi-codec case codec_dais 0 is MAX98095 and 1 is HDMI. */
 	if (rtd->num_codecs > 1)
-		codec_dai = rtd->codec_dais[0];
+		codec_dai = asoc_rtd_to_codec(rtd, 0);
 	else
-		codec_dai = rtd->codec_dai;
+		codec_dai = asoc_rtd_to_codec(rtd, 0);
 
 	/* Set the MCLK rate for the codec */
 	return snd_soc_dai_set_sysclk(codec_dai, 0,
diff --git a/sound/soc/samsung/spdif.c b/sound/soc/samsung/spdif.c
index 1a9f08a50394..759fc6644329 100644
--- a/sound/soc/samsung/spdif.c
+++ b/sound/soc/samsung/spdif.c
@@ -142,7 +142,7 @@ static int spdif_trigger(struct snd_pcm_substream *substream, int cmd,
 				struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct samsung_spdif_info *spdif = to_info(rtd->cpu_dai);
+	struct samsung_spdif_info *spdif = to_info(asoc_rtd_to_cpu(rtd, 0));
 	unsigned long flags;
 
 	dev_dbg(spdif->dev, "Entered %s\n", __func__);
@@ -178,7 +178,7 @@ static int spdif_hw_params(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *socdai)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct samsung_spdif_info *spdif = to_info(rtd->cpu_dai);
+	struct samsung_spdif_info *spdif = to_info(asoc_rtd_to_cpu(rtd, 0));
 	void __iomem *regs = spdif->regs;
 	struct snd_dmaengine_dai_dma_data *dma_data;
 	u32 con, clkcon, cstas;
@@ -194,7 +194,7 @@ static int spdif_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	snd_soc_dai_set_dma_data(rtd->cpu_dai, substream, dma_data);
+	snd_soc_dai_set_dma_data(asoc_rtd_to_cpu(rtd, 0), substream, dma_data);
 
 	spin_lock_irqsave(&spdif->lock, flags);
 
@@ -280,7 +280,7 @@ static void spdif_shutdown(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct samsung_spdif_info *spdif = to_info(rtd->cpu_dai);
+	struct samsung_spdif_info *spdif = to_info(asoc_rtd_to_cpu(rtd, 0));
 	void __iomem *regs = spdif->regs;
 	u32 con, clkcon;
 
diff --git a/sound/soc/samsung/speyside.c b/sound/soc/samsung/speyside.c
index 8f175f204eb7..f5f6ba00d073 100644
--- a/sound/soc/samsung/speyside.c
+++ b/sound/soc/samsung/speyside.c
@@ -25,7 +25,7 @@ static int speyside_set_bias_level(struct snd_soc_card *card,
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[1]);
-	codec_dai = rtd->codec_dai;
+	codec_dai = asoc_rtd_to_codec(rtd, 0);
 
 	if (dapm->dev != codec_dai->dev)
 		return 0;
@@ -61,7 +61,7 @@ static int speyside_set_bias_level_post(struct snd_soc_card *card,
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[1]);
-	codec_dai = rtd->codec_dai;
+	codec_dai = asoc_rtd_to_codec(rtd, 0);
 
 	if (dapm->dev != codec_dai->dev)
 		return 0;
@@ -131,7 +131,7 @@ static void speyside_set_polarity(struct snd_soc_component *component,
 
 static int speyside_wm0010_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *dai = rtd->codec_dai;
+	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(dai, 0, MCLK_AUDIO_RATE, 0);
@@ -143,7 +143,7 @@ static int speyside_wm0010_init(struct snd_soc_pcm_runtime *rtd)
 
 static int speyside_wm8996_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *dai = rtd->codec_dai;
+	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = dai->component;
 	int ret;
 
diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index 043a287728b3..6dfd540e2d74 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -93,7 +93,7 @@ static int tm2_aif1_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 	struct tm2_machine_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 
 	switch (params_rate(params)) {
@@ -134,7 +134,7 @@ static int tm2_aif2_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 	unsigned int asyncclk_rate;
 	int ret;
 
@@ -188,7 +188,7 @@ static int tm2_aif2_hw_params(struct snd_pcm_substream *substream,
 static int tm2_aif2_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
 	/* disable FLL2 */
@@ -209,7 +209,7 @@ static int tm2_hdmi_hw_params(struct snd_pcm_substream *substream,
 			      struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	unsigned int bfs;
 	int bitwidth, ret;
 
@@ -284,7 +284,7 @@ static int tm2_set_bias_level(struct snd_soc_card *card,
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
 
-	if (dapm->dev != rtd->codec_dai->dev)
+	if (dapm->dev != asoc_rtd_to_codec(rtd, 0)->dev)
 		return 0;
 
 	switch (level) {
@@ -315,8 +315,8 @@ static int tm2_late_probe(struct snd_soc_card *card)
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[TM2_DAI_AIF1]);
-	aif1_dai = rtd->codec_dai;
-	priv->component = rtd->codec_dai->component;
+	aif1_dai = asoc_rtd_to_codec(rtd, 0);
+	priv->component = asoc_rtd_to_codec(rtd, 0)->component;
 
 	ret = snd_soc_dai_set_sysclk(aif1_dai, ARIZONA_CLK_SYSCLK, 0, 0);
 	if (ret < 0) {
@@ -325,7 +325,7 @@ static int tm2_late_probe(struct snd_soc_card *card)
 	}
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[TM2_DAI_AIF2]);
-	aif2_dai = rtd->codec_dai;
+	aif2_dai = asoc_rtd_to_codec(rtd, 0);
 
 	ret = snd_soc_dai_set_sysclk(aif2_dai, ARIZONA_CLK_ASYNCCLK, 0, 0);
 	if (ret < 0) {
diff --git a/sound/soc/samsung/tobermory.c b/sound/soc/samsung/tobermory.c
index 1aa3fdb4b152..c962d2c2a7f7 100644
--- a/sound/soc/samsung/tobermory.c
+++ b/sound/soc/samsung/tobermory.c
@@ -23,7 +23,7 @@ static int tobermory_set_bias_level(struct snd_soc_card *card,
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
-	codec_dai = rtd->codec_dai;
+	codec_dai = asoc_rtd_to_codec(rtd, 0);
 
 	if (dapm->dev != codec_dai->dev)
 		return 0;
@@ -66,7 +66,7 @@ static int tobermory_set_bias_level_post(struct snd_soc_card *card,
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
-	codec_dai = rtd->codec_dai;
+	codec_dai = asoc_rtd_to_codec(rtd, 0);
 
 	if (dapm->dev != codec_dai->dev)
 		return 0;
@@ -181,8 +181,8 @@ static int tobermory_late_probe(struct snd_soc_card *card)
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
-	component = rtd->codec_dai->component;
-	codec_dai = rtd->codec_dai;
+	component = asoc_rtd_to_codec(rtd, 0)->component;
+	codec_dai = asoc_rtd_to_codec(rtd, 0);
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, WM8962_SYSCLK_MCLK,
 				     32768, SND_SOC_CLOCK_IN);
-- 
2.20.1

