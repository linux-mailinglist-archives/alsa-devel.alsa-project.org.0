Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6DE195A61
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 16:56:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C667916BC;
	Fri, 27 Mar 2020 16:55:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C667916BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585324561;
	bh=wZESEANyVERmM/Lz9ocyOk1l37EKSAQSWtB/UdRjmnk=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=mWvfcktmWT7y24OI9cj/N9xRr4vj85k9WSK2Q+C8kWp3e++55LpOPjgxcOzS42LBf
	 Wh4VO4zDRitxwbVptfPMUKZnmeKOZ8EJrJAd9P5nactJQTKIn6ady1GHC5YWzIAROM
	 xZEOH3unSYDOuu7aBfING/qzmfgrsxpOoaKtHDus=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF8DCF8043C;
	Fri, 27 Mar 2020 16:36:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90960F8042B; Fri, 27 Mar 2020 16:36:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id D1C02F803FE
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 16:36:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1C02F803FE
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 518DC1FB;
 Fri, 27 Mar 2020 08:36:00 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D0813F71F;
 Fri, 27 Mar 2020 08:35:59 -0700 (PDT)
Date: Fri, 27 Mar 2020 15:35:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: intel: use asoc_rtd_to_cpu() / asoc_rtd_to_codec()
 macro for DAI pointer" to the asoc tree
In-Reply-To: <87r1xjir7a.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87r1xjir7a.wl-kuninori.morimoto.gx@renesas.com>
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

   ASoC: intel: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer

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

From 0d1571c197a920eb8567e9376da04f4fb7965f23 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 23 Mar 2020 14:19:05 +0900
Subject: [PATCH] ASoC: intel: use asoc_rtd_to_cpu() / asoc_rtd_to_codec()
 macro for DAI pointer

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87r1xjir7a.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c  |  6 ++---
 sound/soc/intel/boards/bdw-rt5650.c           |  6 ++---
 sound/soc/intel/boards/bdw-rt5677.c           |  6 ++---
 sound/soc/intel/boards/broadwell.c            |  4 +--
 sound/soc/intel/boards/bxt_da7219_max98357a.c |  8 +++---
 sound/soc/intel/boards/bxt_rt298.c            |  8 +++---
 sound/soc/intel/boards/byt-max98090.c         |  2 +-
 sound/soc/intel/boards/byt-rt5640.c           |  4 +--
 sound/soc/intel/boards/bytcht_cx2072x.c       | 10 +++----
 sound/soc/intel/boards/bytcht_da7213.c        |  8 +++---
 sound/soc/intel/boards/bytcht_es8316.c        |  8 +++---
 sound/soc/intel/boards/bytcht_nocodec.c       |  4 +--
 sound/soc/intel/boards/bytcr_rt5640.c         |  8 +++---
 sound/soc/intel/boards/bytcr_rt5651.c         |  8 +++---
 sound/soc/intel/boards/cht_bsw_max98090_ti.c  |  6 ++---
 sound/soc/intel/boards/cht_bsw_nau8824.c      |  4 +--
 sound/soc/intel/boards/cht_bsw_rt5645.c       | 14 +++++-----
 sound/soc/intel/boards/cht_bsw_rt5672.c       |  8 +++---
 sound/soc/intel/boards/cml_rt1011_rt5682.c    |  6 ++---
 sound/soc/intel/boards/glk_rt5682_max98357a.c | 10 +++----
 sound/soc/intel/boards/haswell.c              |  2 +-
 sound/soc/intel/boards/kbl_da7219_max98357a.c |  8 +++---
 sound/soc/intel/boards/kbl_da7219_max98927.c  |  6 ++---
 sound/soc/intel/boards/kbl_rt5660.c           |  6 ++---
 sound/soc/intel/boards/kbl_rt5663_max98927.c  |  8 +++---
 .../intel/boards/kbl_rt5663_rt5514_max98927.c |  8 +++---
 .../soc/intel/boards/skl_nau88l25_max98357a.c | 12 ++++-----
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c | 16 ++++++------
 sound/soc/intel/boards/skl_rt286.c            |  8 +++---
 sound/soc/intel/boards/sof_da7219_max98373.c  |  8 +++---
 sound/soc/intel/boards/sof_pcm512x.c          |  8 +++---
 sound/soc/intel/boards/sof_rt5682.c           |  6 ++---
 sound/soc/intel/haswell/sst-haswell-pcm.c     | 26 +++++++++----------
 sound/soc/intel/skylake/skl-pcm.c             | 10 +++----
 34 files changed, 135 insertions(+), 135 deletions(-)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index 340bd2be39a7..82f2b6357778 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -649,7 +649,7 @@ static snd_pcm_uframes_t sst_soc_pointer(struct snd_soc_component *component,
 static int sst_soc_pcm_new(struct snd_soc_component *component,
 			   struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *dai = rtd->cpu_dai;
+	struct snd_soc_dai *dai = asoc_rtd_to_cpu(rtd, 0);
 	struct snd_pcm *pcm = rtd->pcm;
 
 	if (dai->driver->playback.channels_min ||
@@ -741,7 +741,7 @@ static int sst_soc_prepare(struct device *dev)
 
 	/* set the SSPs to idle */
 	for_each_card_rtds(drv->soc_card, rtd) {
-		struct snd_soc_dai *dai = rtd->cpu_dai;
+		struct snd_soc_dai *dai = asoc_rtd_to_cpu(rtd, 0);
 
 		if (dai->active) {
 			send_ssp_cmd(dai, dai->name, 0);
@@ -762,7 +762,7 @@ static void sst_soc_complete(struct device *dev)
 
 	/* restart SSPs */
 	for_each_card_rtds(drv->soc_card, rtd) {
-		struct snd_soc_dai *dai = rtd->cpu_dai;
+		struct snd_soc_dai *dai = asoc_rtd_to_cpu(rtd, 0);
 
 		if (dai->active) {
 			sst_handle_vb_timer(dai, true);
diff --git a/sound/soc/intel/boards/bdw-rt5650.c b/sound/soc/intel/boards/bdw-rt5650.c
index 058abf3eec50..53ca3d8da5de 100644
--- a/sound/soc/intel/boards/bdw-rt5650.c
+++ b/sound/soc/intel/boards/bdw-rt5650.c
@@ -107,7 +107,7 @@ static int bdw_rt5650_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	/* Workaround: set codec PLL to 19.2MHz that PLL source is
@@ -166,8 +166,8 @@ static int bdw_rt5650_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct bdw_rt5650_priv *bdw_rt5650 =
 		snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *component = rtd->codec_dai->component;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_component *component = codec_dai->component;
 	int ret;
 
 	/* Enable codec ASRC function for Stereo DAC/Stereo1 ADC/DMIC/I2S1.
diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index a94f498388e1..06a5396082dd 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -157,7 +157,7 @@ static int bdw_rt5677_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, RT5677_SCLK_S_MCLK, 24576000,
@@ -174,7 +174,7 @@ static int bdw_rt5677_dsp_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, RT5677_SCLK_S_PLL1, 24576000,
@@ -226,7 +226,7 @@ static int bdw_rt5677_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct bdw_rt5677_priv *bdw_rt5677 =
 			snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	int ret;
 
diff --git a/sound/soc/intel/boards/broadwell.c b/sound/soc/intel/boards/broadwell.c
index 25178000c6a5..8318914227e5 100644
--- a/sound/soc/intel/boards/broadwell.c
+++ b/sound/soc/intel/boards/broadwell.c
@@ -70,7 +70,7 @@ static const struct snd_soc_dapm_route broadwell_rt286_map[] = {
 
 static int broadwell_rt286_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 	int ret = 0;
 	ret = snd_soc_card_jack_new(rtd->card, "Headset",
 		SND_JACK_HEADSET | SND_JACK_BTN_0, &broadwell_headset,
@@ -104,7 +104,7 @@ static int broadwell_rt286_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, RT286_SCLK_S_PLL, 24000000,
diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index 061462248bce..44016c16f25e 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -179,8 +179,8 @@ static int broxton_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
 static int broxton_da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	int ret;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 	int clk_freq;
 
 	/* Configure sysclk for codec */
@@ -226,7 +226,7 @@ static int broxton_da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 static int broxton_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct bxt_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = rtd->codec_dai;
+	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
 	struct bxt_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -244,7 +244,7 @@ static int broxton_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 static int broxton_da7219_fe_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dapm_context *dapm;
-	struct snd_soc_component *component = rtd->cpu_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_cpu(rtd, 0)->component;
 
 	dapm = snd_soc_component_get_dapm(component);
 	snd_soc_dapm_ignore_suspend(dapm, "Reference Capture");
diff --git a/sound/soc/intel/boards/bxt_rt298.c b/sound/soc/intel/boards/bxt_rt298.c
index 4b5e7f6dbdf1..7a4decf34191 100644
--- a/sound/soc/intel/boards/bxt_rt298.c
+++ b/sound/soc/intel/boards/bxt_rt298.c
@@ -155,7 +155,7 @@ static const struct snd_soc_dapm_route geminilake_rt298_map[] = {
 static int broxton_rt298_fe_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dapm_context *dapm;
-	struct snd_soc_component *component = rtd->cpu_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_cpu(rtd, 0)->component;
 
 	dapm = snd_soc_component_get_dapm(component);
 	snd_soc_dapm_ignore_suspend(dapm, "Reference Capture");
@@ -165,7 +165,7 @@ static int broxton_rt298_fe_init(struct snd_soc_pcm_runtime *rtd)
 
 static int broxton_rt298_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 	int ret = 0;
 
 	ret = snd_soc_card_jack_new(rtd->card, "Headset",
@@ -186,7 +186,7 @@ static int broxton_rt298_codec_init(struct snd_soc_pcm_runtime *rtd)
 static int broxton_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct bxt_rt286_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = rtd->codec_dai;
+	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
 	struct bxt_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -225,7 +225,7 @@ static int broxton_rt298_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, RT298_SCLK_S_PLL,
diff --git a/sound/soc/intel/boards/byt-max98090.c b/sound/soc/intel/boards/byt-max98090.c
index 01739ad75b12..f5097da28828 100644
--- a/sound/soc/intel/boards/byt-max98090.c
+++ b/sound/soc/intel/boards/byt-max98090.c
@@ -89,7 +89,7 @@ static int byt_max98090_init(struct snd_soc_pcm_runtime *runtime)
 
 	card->dapm.idle_bias_off = true;
 
-	ret = snd_soc_dai_set_sysclk(runtime->codec_dai,
+	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(runtime, 0),
 				     M98090_REG_SYSTEM_CLOCK,
 				     25000000, SND_SOC_CLOCK_IN);
 	if (ret < 0) {
diff --git a/sound/soc/intel/boards/byt-rt5640.c b/sound/soc/intel/boards/byt-rt5640.c
index 0c76dafdd572..ace232f8aed6 100644
--- a/sound/soc/intel/boards/byt-rt5640.c
+++ b/sound/soc/intel/boards/byt-rt5640.c
@@ -73,7 +73,7 @@ static int byt_rt5640_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, RT5640_SCLK_S_PLL1,
@@ -123,7 +123,7 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 static int byt_rt5640_init(struct snd_soc_pcm_runtime *runtime)
 {
 	int ret;
-	struct snd_soc_component *component = runtime->codec_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
 	struct snd_soc_card *card = runtime->card;
 	const struct snd_soc_dapm_route *custom_map;
 	int num_routes;
diff --git a/sound/soc/intel/boards/bytcht_cx2072x.c b/sound/soc/intel/boards/bytcht_cx2072x.c
index 67f06c95eec5..3b3df7c9008c 100644
--- a/sound/soc/intel/boards/bytcht_cx2072x.c
+++ b/sound/soc/intel/boards/bytcht_cx2072x.c
@@ -70,7 +70,7 @@ static const struct acpi_gpio_mapping byt_cht_cx2072x_acpi_gpios[] = {
 static int byt_cht_cx2072x_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_component *codec = rtd->codec_dai->component;
+	struct snd_soc_component *codec = asoc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
 	if (devm_acpi_dev_add_driver_gpios(codec->dev,
@@ -80,7 +80,7 @@ static int byt_cht_cx2072x_init(struct snd_soc_pcm_runtime *rtd)
 	card->dapm.idle_bias_off = true;
 
 	/* set the default PLL rate, the clock is handled by the codec driver */
-	ret = snd_soc_dai_set_sysclk(rtd->codec_dai, CX2072X_MCLK_EXTERNAL_PLL,
+	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0), CX2072X_MCLK_EXTERNAL_PLL,
 				     19200000, SND_SOC_CLOCK_IN);
 	if (ret) {
 		dev_err(rtd->dev, "Could not set sysclk\n");
@@ -97,7 +97,7 @@ static int byt_cht_cx2072x_init(struct snd_soc_pcm_runtime *rtd)
 
 	snd_soc_component_set_jack(codec, &byt_cht_cx2072x_headset, NULL);
 
-	snd_soc_dai_set_bclk_ratio(rtd->codec_dai, 50);
+	snd_soc_dai_set_bclk_ratio(asoc_rtd_to_codec(rtd, 0), 50);
 
 	return ret;
 }
@@ -123,7 +123,7 @@ static int byt_cht_cx2072x_fixup(struct snd_soc_pcm_runtime *rtd,
 	 * with explicit setting to I2S 2ch 24-bit. The word length is set with
 	 * dai_set_tdm_slot() since there is no other API exposed
 	 */
-	ret = snd_soc_dai_set_fmt(rtd->cpu_dai,
+	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				SND_SOC_DAIFMT_I2S     |
 				SND_SOC_DAIFMT_NB_NF   |
 				SND_SOC_DAIFMT_CBS_CFS);
@@ -132,7 +132,7 @@ static int byt_cht_cx2072x_fixup(struct snd_soc_pcm_runtime *rtd,
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_tdm_slot(rtd->cpu_dai, 0x3, 0x3, 2, 24);
+	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, 24);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set I2S config, err %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/bytcht_da7213.c b/sound/soc/intel/boards/bytcht_da7213.c
index d6b912c013fc..5e96e7d02733 100644
--- a/sound/soc/intel/boards/bytcht_da7213.c
+++ b/sound/soc/intel/boards/bytcht_da7213.c
@@ -78,7 +78,7 @@ static int codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	 * with explicit setting to I2S 2ch 24-bit. The word length is set with
 	 * dai_set_tdm_slot() since there is no other API exposed
 	 */
-	ret = snd_soc_dai_set_fmt(rtd->cpu_dai,
+	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				  SND_SOC_DAIFMT_I2S     |
 				  SND_SOC_DAIFMT_NB_NF   |
 				  SND_SOC_DAIFMT_CBS_CFS);
@@ -87,7 +87,7 @@ static int codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_tdm_slot(rtd->cpu_dai, 0x3, 0x3, 2, 24);
+	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, 24);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set I2S config, err %d\n", ret);
 		return ret;
@@ -106,7 +106,7 @@ static int aif1_hw_params(struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, DA7213_CLKSRC_MCLK,
@@ -127,7 +127,7 @@ static int aif1_hw_params(struct snd_pcm_substream *substream,
 static int aif1_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_pll(codec_dai, 0,
diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 0adc5a5e134a..ddcd070100ef 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -157,7 +157,7 @@ static struct snd_soc_jack_pin byt_cht_es8316_jack_pins[] = {
 
 static int byt_cht_es8316_init(struct snd_soc_pcm_runtime *runtime)
 {
-	struct snd_soc_component *codec = runtime->codec_dai->component;
+	struct snd_soc_component *codec = asoc_rtd_to_codec(runtime, 0)->component;
 	struct snd_soc_card *card = runtime->card;
 	struct byt_cht_es8316_private *priv = snd_soc_card_get_drvdata(card);
 	const struct snd_soc_dapm_route *custom_map;
@@ -212,7 +212,7 @@ static int byt_cht_es8316_init(struct snd_soc_pcm_runtime *runtime)
 	if (ret)
 		dev_err(card->dev, "unable to enable MCLK\n");
 
-	ret = snd_soc_dai_set_sysclk(runtime->codec_dai, 0, 19200000,
+	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(runtime, 0), 0, 19200000,
 				     SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		dev_err(card->dev, "can't set codec clock %d\n", ret);
@@ -262,7 +262,7 @@ static int byt_cht_es8316_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	 * with explicit setting to I2S 2ch 24-bit. The word length is set with
 	 * dai_set_tdm_slot() since there is no other API exposed
 	 */
-	ret = snd_soc_dai_set_fmt(rtd->cpu_dai,
+	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				SND_SOC_DAIFMT_I2S     |
 				SND_SOC_DAIFMT_NB_NF   |
 				SND_SOC_DAIFMT_CBS_CFS
@@ -272,7 +272,7 @@ static int byt_cht_es8316_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_tdm_slot(rtd->cpu_dai, 0x3, 0x3, 2, bits);
+	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, bits);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set I2S config, err %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/bytcht_nocodec.c b/sound/soc/intel/boards/bytcht_nocodec.c
index 479af808ef43..8c0dab1f4030 100644
--- a/sound/soc/intel/boards/bytcht_nocodec.c
+++ b/sound/soc/intel/boards/bytcht_nocodec.c
@@ -58,7 +58,7 @@ static int codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	 * with explicit setting to I2S 2ch 24-bit. The word length is set with
 	 * dai_set_tdm_slot() since there is no other API exposed
 	 */
-	ret = snd_soc_dai_set_fmt(rtd->cpu_dai,
+	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				  SND_SOC_DAIFMT_I2S     |
 				  SND_SOC_DAIFMT_NB_NF   |
 				  SND_SOC_DAIFMT_CBS_CFS);
@@ -68,7 +68,7 @@ static int codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_tdm_slot(rtd->cpu_dai, 0x3, 0x3, 2, 24);
+	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, 24);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set I2S config, err %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 6bd9ae813be2..33fb8ea4e5cb 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -381,7 +381,7 @@ static int byt_rt5640_aif1_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *dai = rtd->codec_dai;
+	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
 
 	return byt_rt5640_prepare_and_enable_pll1(dai, params_rate(params));
 }
@@ -805,7 +805,7 @@ static int byt_rt5640_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct snd_soc_card *card = runtime->card;
 	struct byt_rt5640_private *priv = snd_soc_card_get_drvdata(card);
-	struct snd_soc_component *component = runtime->codec_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
 	const struct snd_soc_dapm_route *custom_map;
 	int num_routes;
 	int ret;
@@ -962,7 +962,7 @@ static int byt_rt5640_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	 * with explicit setting to I2S 2ch. The word length is set with
 	 * dai_set_tdm_slot() since there is no other API exposed
 	 */
-	ret = snd_soc_dai_set_fmt(rtd->cpu_dai,
+	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				  SND_SOC_DAIFMT_I2S     |
 				  SND_SOC_DAIFMT_NB_NF   |
 				  SND_SOC_DAIFMT_CBS_CFS);
@@ -971,7 +971,7 @@ static int byt_rt5640_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_tdm_slot(rtd->cpu_dai, 0x3, 0x3, 2, bits);
+	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, bits);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set I2S config, err %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 5074bb53f98e..214ef41e23e6 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -348,7 +348,7 @@ static int byt_rt5651_aif1_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	snd_pcm_format_t format = params_format(params);
 	int rate = params_rate(params);
 	int bclk_ratio;
@@ -540,7 +540,7 @@ static int byt_rt5651_add_codec_device_props(struct device *i2c_dev)
 static int byt_rt5651_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct snd_soc_card *card = runtime->card;
-	struct snd_soc_component *codec = runtime->codec_dai->component;
+	struct snd_soc_component *codec = asoc_rtd_to_codec(runtime, 0)->component;
 	struct byt_rt5651_private *priv = snd_soc_card_get_drvdata(card);
 	const struct snd_soc_dapm_route *custom_map;
 	int num_routes;
@@ -685,7 +685,7 @@ static int byt_rt5651_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	 * with explicit setting to I2S 2ch. The word length is set with
 	 * dai_set_tdm_slot() since there is no other API exposed
 	 */
-	ret = snd_soc_dai_set_fmt(rtd->cpu_dai,
+	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				  SND_SOC_DAIFMT_I2S     |
 				  SND_SOC_DAIFMT_NB_NF   |
 				  SND_SOC_DAIFMT_CBS_CFS
@@ -696,7 +696,7 @@ static int byt_rt5651_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		return ret;
 	}
 
-	ret = snd_soc_dai_set_tdm_slot(rtd->cpu_dai, 0x3, 0x3, 2, bits);
+	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, bits);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set I2S config, err %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/cht_bsw_max98090_ti.c b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
index ea119d523926..135701738a44 100644
--- a/sound/soc/intel/boards/cht_bsw_max98090_ti.c
+++ b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
@@ -113,7 +113,7 @@ static int cht_aif1_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, M98090_REG_SYSTEM_CLOCK,
@@ -257,7 +257,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	int ret = 0;
 	unsigned int fmt = 0;
 
-	ret = snd_soc_dai_set_tdm_slot(rtd->cpu_dai, 0x3, 0x3, 2, 16);
+	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, 16);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set cpu_dai slot fmt: %d\n", ret);
 		return ret;
@@ -266,7 +266,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBS_CFS;
 
-	ret = snd_soc_dai_set_fmt(rtd->cpu_dai, fmt);
+	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0), fmt);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set cpu_dai set fmt: %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/cht_bsw_nau8824.c b/sound/soc/intel/boards/cht_bsw_nau8824.c
index 34d4e17e3295..f456150f89c2 100644
--- a/sound/soc/intel/boards/cht_bsw_nau8824.c
+++ b/sound/soc/intel/boards/cht_bsw_nau8824.c
@@ -73,7 +73,7 @@ static int cht_aif1_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, NAU8824_CLK_FLL_FS, 0,
@@ -96,7 +96,7 @@ static int cht_codec_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct cht_mc_private *ctx = snd_soc_card_get_drvdata(runtime->card);
 	struct snd_soc_jack *jack = &ctx->jack;
-	struct snd_soc_dai *codec_dai = runtime->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	int ret, jack_type;
 
diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
index 452691db12cc..e64eca56e426 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5645.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
@@ -208,7 +208,7 @@ static int cht_aif1_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	/* set codec PLL source to the 19.2MHz platform clock (MCLK) */
@@ -252,7 +252,7 @@ static int cht_codec_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct snd_soc_card *card = runtime->card;
 	struct cht_mc_private *ctx = snd_soc_card_get_drvdata(runtime->card);
-	struct snd_soc_component *component = runtime->codec_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
 	int jack_type;
 	int ret;
 
@@ -359,7 +359,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		 * with explicit setting to I2S 2ch 16-bit. The word length is set with
 		 * dai_set_tdm_slot() since there is no other API exposed
 		 */
-		ret = snd_soc_dai_set_fmt(rtd->cpu_dai,
+		ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 					SND_SOC_DAIFMT_I2S     |
 					SND_SOC_DAIFMT_NB_NF   |
 					SND_SOC_DAIFMT_CBS_CFS
@@ -369,7 +369,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 			return ret;
 		}
 
-		ret = snd_soc_dai_set_fmt(rtd->codec_dai,
+		ret = snd_soc_dai_set_fmt(asoc_rtd_to_codec(rtd, 0),
 					SND_SOC_DAIFMT_I2S     |
 					SND_SOC_DAIFMT_NB_NF   |
 					SND_SOC_DAIFMT_CBS_CFS
@@ -379,7 +379,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 			return ret;
 		}
 
-		ret = snd_soc_dai_set_tdm_slot(rtd->cpu_dai, 0x3, 0x3, 2, 16);
+		ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, 16);
 		if (ret < 0) {
 			dev_err(rtd->dev, "can't set I2S config, err %d\n", ret);
 			return ret;
@@ -393,7 +393,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		/*
 		 * Default mode for SSP configuration is TDM 4 slot
 		 */
-		ret = snd_soc_dai_set_fmt(rtd->codec_dai,
+		ret = snd_soc_dai_set_fmt(asoc_rtd_to_codec(rtd, 0),
 					SND_SOC_DAIFMT_DSP_B |
 					SND_SOC_DAIFMT_IB_NF |
 					SND_SOC_DAIFMT_CBS_CFS);
@@ -403,7 +403,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		}
 
 		/* TDM 4 slots 24 bit, set Rx & Tx bitmask to 4 active slots */
-		ret = snd_soc_dai_set_tdm_slot(rtd->codec_dai, 0xF, 0xF, 4, 24);
+		ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_codec(rtd, 0), 0xF, 0xF, 4, 24);
 		if (ret < 0) {
 			dev_err(rtd->dev, "can't set codec TDM slot %d\n", ret);
 			return ret;
diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index 9d657421730a..097023a3ec14 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -144,7 +144,7 @@ static int cht_aif1_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	/* set codec PLL source to the 19.2MHz platform clock (MCLK) */
@@ -176,7 +176,7 @@ static const struct acpi_gpio_mapping cht_rt5672_gpios[] = {
 static int cht_codec_init(struct snd_soc_pcm_runtime *runtime)
 {
 	int ret;
-	struct snd_soc_dai *codec_dai = runtime->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	struct cht_mc_private *ctx = snd_soc_card_get_drvdata(runtime->card);
 
@@ -255,7 +255,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	/*
 	 * Default mode for SSP configuration is TDM 4 slot
 	 */
-	ret = snd_soc_dai_set_fmt(rtd->codec_dai,
+	ret = snd_soc_dai_set_fmt(asoc_rtd_to_codec(rtd, 0),
 				  SND_SOC_DAIFMT_DSP_B |
 				  SND_SOC_DAIFMT_IB_NF |
 				  SND_SOC_DAIFMT_CBS_CFS);
@@ -265,7 +265,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	}
 
 	/* TDM 4 slots 24 bit, set Rx & Tx bitmask to 4 active slots */
-	ret = snd_soc_dai_set_tdm_slot(rtd->codec_dai, 0xF, 0xF, 4, 24);
+	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_codec(rtd, 0), 0xF, 0xF, 4, 24);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set codec TDM slot %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/cml_rt1011_rt5682.c b/sound/soc/intel/boards/cml_rt1011_rt5682.c
index ed6c26a256e7..8167b2977e1d 100644
--- a/sound/soc/intel/boards/cml_rt1011_rt5682.c
+++ b/sound/soc/intel/boards/cml_rt1011_rt5682.c
@@ -85,7 +85,7 @@ static const struct snd_soc_dapm_route cml_rt1011_rt5682_map[] = {
 static int cml_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 	struct snd_soc_jack *jack;
 	int ret;
 
@@ -125,7 +125,7 @@ static int cml_rt5682_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int clk_id, clk_freq, pll_out, ret;
 
 	clk_id = RT5682_PLL1_S_MCLK;
@@ -274,7 +274,7 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 static int hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = rtd->codec_dai;
+	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
 	struct hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
diff --git a/sound/soc/intel/boards/glk_rt5682_max98357a.c b/sound/soc/intel/boards/glk_rt5682_max98357a.c
index 3c576b33b9c6..f13158e4a1fc 100644
--- a/sound/soc/intel/boards/glk_rt5682_max98357a.c
+++ b/sound/soc/intel/boards/glk_rt5682_max98357a.c
@@ -136,8 +136,8 @@ static int geminilake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
 static int geminilake_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct glk_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *component = rtd->codec_dai->component;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct snd_soc_jack *jack;
 	int ret;
 
@@ -188,7 +188,7 @@ static int geminilake_rt5682_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	/* Set valid bitmask & configuration for I2S in 24 bit */
@@ -208,7 +208,7 @@ static struct snd_soc_ops geminilake_rt5682_ops = {
 static int geminilake_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct glk_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = rtd->codec_dai;
+	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
 	struct glk_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -225,7 +225,7 @@ static int geminilake_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 
 static int geminilake_rt5682_fe_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = rtd->cpu_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_cpu(rtd, 0)->component;
 	struct snd_soc_dapm_context *dapm;
 	int ret;
 
diff --git a/sound/soc/intel/boards/haswell.c b/sound/soc/intel/boards/haswell.c
index 6589fa56873f..3ed53d7db4e6 100644
--- a/sound/soc/intel/boards/haswell.c
+++ b/sound/soc/intel/boards/haswell.c
@@ -56,7 +56,7 @@ static int haswell_rt5640_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, RT5640_SCLK_S_MCLK, 12288000,
diff --git a/sound/soc/intel/boards/kbl_da7219_max98357a.c b/sound/soc/intel/boards/kbl_da7219_max98357a.c
index bc7f9a9ce9af..32cd90b8d4c4 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98357a.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98357a.c
@@ -159,8 +159,8 @@ static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
 static int kabylake_da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *component = rtd->codec_dai->component;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct snd_soc_jack *jack;
 	int ret;
 
@@ -203,7 +203,7 @@ static int kabylake_da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 static int kabylake_hdmi_init(struct snd_soc_pcm_runtime *rtd, int device)
 {
 	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = rtd->codec_dai;
+	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
 	struct kbl_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -236,7 +236,7 @@ static int kabylake_hdmi3_init(struct snd_soc_pcm_runtime *rtd)
 static int kabylake_da7219_fe_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dapm_context *dapm;
-	struct snd_soc_component *component = rtd->cpu_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_cpu(rtd, 0)->component;
 
 	dapm = snd_soc_component_get_dapm(component);
 	snd_soc_dapm_ignore_suspend(dapm, "Reference Capture");
diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c b/sound/soc/intel/boards/kbl_da7219_max98927.c
index 0ceb1748a262..abd4e3839678 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98927.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
@@ -331,7 +331,7 @@ static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
 static int kabylake_da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 	struct snd_soc_jack *jack;
 	struct snd_soc_card *card = rtd->card;
 	int ret;
@@ -381,7 +381,7 @@ static int kabylake_dmic_init(struct snd_soc_pcm_runtime *rtd)
 static int kabylake_hdmi_init(struct snd_soc_pcm_runtime *rtd, int device)
 {
 	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = rtd->codec_dai;
+	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
 	struct kbl_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -414,7 +414,7 @@ static int kabylake_hdmi3_init(struct snd_soc_pcm_runtime *rtd)
 static int kabylake_da7219_fe_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dapm_context *dapm;
-	struct snd_soc_component *component = rtd->cpu_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_cpu(rtd, 0)->component;
 
 	dapm = snd_soc_component_get_dapm(component);
 	snd_soc_dapm_ignore_suspend(dapm, "Reference Capture");
diff --git a/sound/soc/intel/boards/kbl_rt5660.c b/sound/soc/intel/boards/kbl_rt5660.c
index e23dea9ab79a..6460e3f0c974 100644
--- a/sound/soc/intel/boards/kbl_rt5660.c
+++ b/sound/soc/intel/boards/kbl_rt5660.c
@@ -157,7 +157,7 @@ static int kabylake_rt5660_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	int ret;
 	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 
 	ret = devm_acpi_dev_add_driver_gpios(component->dev, acpi_rt5660_gpios);
@@ -210,7 +210,7 @@ static int kabylake_rt5660_codec_init(struct snd_soc_pcm_runtime *rtd)
 static int kabylake_hdmi_init(struct snd_soc_pcm_runtime *rtd, int device)
 {
 	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = rtd->codec_dai;
+	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
 	struct kbl_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -244,7 +244,7 @@ static int kabylake_rt5660_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai,
diff --git a/sound/soc/intel/boards/kbl_rt5663_max98927.c b/sound/soc/intel/boards/kbl_rt5663_max98927.c
index 20d566e9dd9d..658a9da3a40f 100644
--- a/sound/soc/intel/boards/kbl_rt5663_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_max98927.c
@@ -242,7 +242,7 @@ static int kabylake_rt5663_fe_init(struct snd_soc_pcm_runtime *rtd)
 {
 	int ret;
 	struct snd_soc_dapm_context *dapm;
-	struct snd_soc_component *component = rtd->cpu_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_cpu(rtd, 0)->component;
 
 	dapm = snd_soc_component_get_dapm(component);
 	ret = snd_soc_dapm_ignore_suspend(dapm, "Reference Capture");
@@ -258,7 +258,7 @@ static int kabylake_rt5663_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	int ret;
 	struct kbl_rt5663_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 	struct snd_soc_jack *jack;
 
 	/*
@@ -305,7 +305,7 @@ static int kabylake_rt5663_max98927_codec_init(struct snd_soc_pcm_runtime *rtd)
 static int kabylake_hdmi_init(struct snd_soc_pcm_runtime *rtd, int device)
 {
 	struct kbl_rt5663_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = rtd->codec_dai;
+	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
 	struct kbl_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -431,7 +431,7 @@ static int kabylake_rt5663_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	/* use ASRC for internal clocks, as PLL rate isn't multiple of BCLK */
diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
index 6493ede89300..1b1f8d7a4ea3 100644
--- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
@@ -206,7 +206,7 @@ static struct snd_soc_codec_conf max98927_codec_conf[] = {
 static int kabylake_rt5663_fe_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dapm_context *dapm;
-	struct snd_soc_component *component = rtd->cpu_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_cpu(rtd, 0)->component;
 	int ret;
 
 	dapm = snd_soc_component_get_dapm(component);
@@ -221,7 +221,7 @@ static int kabylake_rt5663_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	int ret;
 	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 	struct snd_soc_jack *jack;
 
 	/*
@@ -255,7 +255,7 @@ static int kabylake_rt5663_codec_init(struct snd_soc_pcm_runtime *rtd)
 static int kabylake_hdmi_init(struct snd_soc_pcm_runtime *rtd, int device)
 {
 	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = rtd->codec_dai;
+	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
 	struct kbl_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -372,7 +372,7 @@ static int kabylake_rt5663_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	/* use ASRC for internal clocks, as PLL rate isn't multiple of BCLK */
diff --git a/sound/soc/intel/boards/skl_nau88l25_max98357a.c b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
index 8216c15fc8da..d7b8154c43a4 100644
--- a/sound/soc/intel/boards/skl_nau88l25_max98357a.c
+++ b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
@@ -157,7 +157,7 @@ static int skylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
 static int skylake_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	int ret;
-	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 
 	/*
 	 * Headset buttons map to the google Reference headset.
@@ -182,7 +182,7 @@ static int skylake_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
 static int skylake_hdmi1_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct skl_nau8825_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = rtd->codec_dai;
+	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
 	struct skl_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -200,7 +200,7 @@ static int skylake_hdmi1_init(struct snd_soc_pcm_runtime *rtd)
 static int skylake_hdmi2_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct skl_nau8825_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = rtd->codec_dai;
+	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
 	struct skl_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -218,7 +218,7 @@ static int skylake_hdmi2_init(struct snd_soc_pcm_runtime *rtd)
 static int skylake_hdmi3_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct skl_nau8825_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = rtd->codec_dai;
+	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
 	struct skl_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -236,7 +236,7 @@ static int skylake_hdmi3_init(struct snd_soc_pcm_runtime *rtd)
 static int skylake_nau8825_fe_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dapm_context *dapm;
-	struct snd_soc_component *component = rtd->cpu_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_cpu(rtd, 0)->component;
 
 	dapm = snd_soc_component_get_dapm(component);
 	snd_soc_dapm_ignore_suspend(dapm, "Reference Capture");
@@ -296,7 +296,7 @@ static int skylake_nau8825_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai,
diff --git a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
index 40f8eb53e822..4b317bcf6ea0 100644
--- a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
+++ b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
@@ -161,12 +161,12 @@ static int skylake_ssm4567_codec_init(struct snd_soc_pcm_runtime *rtd)
 	int ret;
 
 	/* Slot 1 for left */
-	ret = snd_soc_dai_set_tdm_slot(rtd->codec_dais[0], 0x01, 0x01, 2, 48);
+	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_codec(rtd, 0), 0x01, 0x01, 2, 48);
 	if (ret < 0)
 		return ret;
 
 	/* Slot 2 for right */
-	ret = snd_soc_dai_set_tdm_slot(rtd->codec_dais[1], 0x02, 0x02, 2, 48);
+	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_codec(rtd, 1), 0x02, 0x02, 2, 48);
 	if (ret < 0)
 		return ret;
 
@@ -176,7 +176,7 @@ static int skylake_ssm4567_codec_init(struct snd_soc_pcm_runtime *rtd)
 static int skylake_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	int ret;
-	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 
 	/*
 	 * 4 buttons here map to the google Reference headset
@@ -201,7 +201,7 @@ static int skylake_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
 static int skylake_hdmi1_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct skl_nau88125_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = rtd->codec_dai;
+	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
 	struct skl_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -219,7 +219,7 @@ static int skylake_hdmi1_init(struct snd_soc_pcm_runtime *rtd)
 static int skylake_hdmi2_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct skl_nau88125_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = rtd->codec_dai;
+	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
 	struct skl_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -238,7 +238,7 @@ static int skylake_hdmi2_init(struct snd_soc_pcm_runtime *rtd)
 static int skylake_hdmi3_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct skl_nau88125_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = rtd->codec_dai;
+	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
 	struct skl_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -256,7 +256,7 @@ static int skylake_hdmi3_init(struct snd_soc_pcm_runtime *rtd)
 static int skylake_nau8825_fe_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dapm_context *dapm;
-	struct snd_soc_component *component = rtd->cpu_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_cpu(rtd, 0)->component;
 
 	dapm = snd_soc_component_get_dapm(component);
 	snd_soc_dapm_ignore_suspend(dapm, "Reference Capture");
@@ -348,7 +348,7 @@ static int skylake_nau8825_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai,
diff --git a/sound/soc/intel/boards/skl_rt286.c b/sound/soc/intel/boards/skl_rt286.c
index a9aec66a2351..903ae1b28ec9 100644
--- a/sound/soc/intel/boards/skl_rt286.c
+++ b/sound/soc/intel/boards/skl_rt286.c
@@ -112,7 +112,7 @@ static const struct snd_soc_dapm_route skylake_rt286_map[] = {
 static int skylake_rt286_fe_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dapm_context *dapm;
-	struct snd_soc_component *component = rtd->cpu_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_cpu(rtd, 0)->component;
 
 	dapm = snd_soc_component_get_dapm(component);
 	snd_soc_dapm_ignore_suspend(dapm, "Reference Capture");
@@ -122,7 +122,7 @@ static int skylake_rt286_fe_init(struct snd_soc_pcm_runtime *rtd)
 
 static int skylake_rt286_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
 	ret = snd_soc_card_jack_new(rtd->card, "Headset",
@@ -143,7 +143,7 @@ static int skylake_rt286_codec_init(struct snd_soc_pcm_runtime *rtd)
 static int skylake_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct skl_rt286_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = rtd->codec_dai;
+	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
 	struct skl_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -229,7 +229,7 @@ static int skylake_rt286_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, RT286_SCLK_S_PLL, 24000000,
diff --git a/sound/soc/intel/boards/sof_da7219_max98373.c b/sound/soc/intel/boards/sof_da7219_max98373.c
index 239d8ffdbccd..b707dd3b5625 100644
--- a/sound/soc/intel/boards/sof_da7219_max98373.c
+++ b/sound/soc/intel/boards/sof_da7219_max98373.c
@@ -129,8 +129,8 @@ static struct snd_soc_jack headset;
 
 static int da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = rtd->codec_dai->component;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_component *component = codec_dai->component;
 	struct snd_soc_jack *jack;
 	int ret;
 
@@ -173,7 +173,7 @@ static int ssp1_hw_params(struct snd_pcm_substream *substream,
 	int ret, j;
 
 	for (j = 0; j < runtime->num_codecs; j++) {
-		struct snd_soc_dai *codec_dai = runtime->codec_dais[j];
+		struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, j);
 
 		if (!strcmp(codec_dai->component->name, MAXIM_DEV0_NAME)) {
 			/* vmon_slot_no = 0 imon_slot_no = 1 for TX slots */
@@ -214,7 +214,7 @@ static struct snd_soc_codec_conf max98373_codec_conf[] = {
 static int hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = rtd->codec_dai;
+	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
 	struct hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
diff --git a/sound/soc/intel/boards/sof_pcm512x.c b/sound/soc/intel/boards/sof_pcm512x.c
index 4ce707b6eb79..fb7811899999 100644
--- a/sound/soc/intel/boards/sof_pcm512x.c
+++ b/sound/soc/intel/boards/sof_pcm512x.c
@@ -66,7 +66,7 @@ static const struct dmi_system_id sof_pcm512x_quirk_table[] = {
 static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = rtd->codec_dai;
+	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
 	struct sof_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -84,7 +84,7 @@ static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 
 static int sof_pcm512x_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *codec = rtd->codec_dai->component;
+	struct snd_soc_component *codec = asoc_rtd_to_codec(rtd, 0)->component;
 
 	snd_soc_component_update_bits(codec, PCM512x_GPIO_EN, 0x08, 0x08);
 	snd_soc_component_update_bits(codec, PCM512x_GPIO_OUTPUT_4, 0x0f, 0x02);
@@ -97,7 +97,7 @@ static int sof_pcm512x_codec_init(struct snd_soc_pcm_runtime *rtd)
 static int aif1_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *codec = rtd->codec_dai->component;
+	struct snd_soc_component *codec = asoc_rtd_to_codec(rtd, 0)->component;
 
 	snd_soc_component_update_bits(codec, PCM512x_GPIO_CONTROL_1,
 				      0x08, 0x08);
@@ -108,7 +108,7 @@ static int aif1_startup(struct snd_pcm_substream *substream)
 static void aif1_shutdown(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *codec = rtd->codec_dai->component;
+	struct snd_soc_component *codec = asoc_rtd_to_codec(rtd, 0)->component;
 
 	snd_soc_component_update_bits(codec, PCM512x_GPIO_CONTROL_1,
 				      0x08, 0x00);
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 2eeaa14e59c0..8c29431b5847 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -124,7 +124,7 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = rtd->codec_dai;
+	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
 	struct sof_hdmi_pcm *pcm;
 
 	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
@@ -143,7 +143,7 @@ static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 static int sof_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 	struct snd_soc_jack *jack;
 	int ret;
 
@@ -211,7 +211,7 @@ static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int clk_id, clk_freq, pll_out, ret;
 
 	if (sof_rt5682_quirk & SOF_RT5682_MCLK_EN) {
diff --git a/sound/soc/intel/haswell/sst-haswell-pcm.c b/sound/soc/intel/haswell/sst-haswell-pcm.c
index 033d7c05d7fb..c183f8e94ee4 100644
--- a/sound/soc/intel/haswell/sst-haswell-pcm.c
+++ b/sound/soc/intel/haswell/sst-haswell-pcm.c
@@ -476,7 +476,7 @@ static int hsw_pcm_hw_params(struct snd_soc_component *component,
 	u8 channels;
 	int ret, dai;
 
-	dai = mod_map[rtd->cpu_dai->id].dai_id;
+	dai = mod_map[asoc_rtd_to_cpu(rtd, 0)->id].dai_id;
 	pcm_data = &pdata->pcm[dai][substream->stream];
 
 	/* check if we are being called a subsequent time */
@@ -494,7 +494,7 @@ static int hsw_pcm_hw_params(struct snd_soc_component *component,
 		}
 		pcm_data->allocated = false;
 
-		pcm_data->stream = sst_hsw_stream_new(hsw, rtd->cpu_dai->id,
+		pcm_data->stream = sst_hsw_stream_new(hsw, asoc_rtd_to_cpu(rtd, 0)->id,
 			hsw_notify_pointer, pcm_data);
 		if (pcm_data->stream == NULL) {
 			dev_err(rtd->dev, "error: failed to create stream\n");
@@ -509,7 +509,7 @@ static int hsw_pcm_hw_params(struct snd_soc_component *component,
 		path_id = SST_HSW_STREAM_PATH_SSP0_IN;
 
 	/* DSP stream type depends on DAI ID */
-	switch (rtd->cpu_dai->id) {
+	switch (asoc_rtd_to_cpu(rtd, 0)->id) {
 	case 0:
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 			stream_type = SST_HSW_STREAM_TYPE_SYSTEM;
@@ -533,7 +533,7 @@ static int hsw_pcm_hw_params(struct snd_soc_component *component,
 		break;
 	default:
 		dev_err(rtd->dev, "error: invalid DAI ID %d\n",
-			rtd->cpu_dai->id);
+			asoc_rtd_to_cpu(rtd, 0)->id);
 		return -EINVAL;
 	}
 
@@ -595,7 +595,7 @@ static int hsw_pcm_hw_params(struct snd_soc_component *component,
 	dmab = snd_pcm_get_dma_buf(substream);
 
 	ret = create_adsp_page_table(substream, pdata, rtd, runtime->dma_area,
-		runtime->dma_bytes, rtd->cpu_dai->id);
+		runtime->dma_bytes, asoc_rtd_to_cpu(rtd, 0)->id);
 	if (ret < 0)
 		return ret;
 
@@ -608,7 +608,7 @@ static int hsw_pcm_hw_params(struct snd_soc_component *component,
 		pages = runtime->dma_bytes / PAGE_SIZE;
 
 	ret = sst_hsw_stream_buffer(hsw, pcm_data->stream,
-		pdata->dmab[rtd->cpu_dai->id][substream->stream].addr,
+		pdata->dmab[asoc_rtd_to_cpu(rtd, 0)->id][substream->stream].addr,
 		pages, runtime->dma_bytes, 0,
 		snd_sgbuf_get_addr(dmab, 0) >> PAGE_SHIFT);
 	if (ret < 0) {
@@ -661,7 +661,7 @@ static int hsw_pcm_trigger(struct snd_soc_component *component,
 	snd_pcm_uframes_t pos;
 	int dai;
 
-	dai = mod_map[rtd->cpu_dai->id].dai_id;
+	dai = mod_map[asoc_rtd_to_cpu(rtd, 0)->id].dai_id;
 	pcm_data = &pdata->pcm[dai][substream->stream];
 	sst_stream = pcm_data->stream;
 
@@ -770,7 +770,7 @@ static snd_pcm_uframes_t hsw_pcm_pointer(struct snd_soc_component *component,
 	u32 position;
 	int dai;
 
-	dai = mod_map[rtd->cpu_dai->id].dai_id;
+	dai = mod_map[asoc_rtd_to_cpu(rtd, 0)->id].dai_id;
 	pcm_data = &pdata->pcm[dai][substream->stream];
 	position = sst_hsw_get_dsp_position(hsw, pcm_data->stream);
 
@@ -791,7 +791,7 @@ static int hsw_pcm_open(struct snd_soc_component *component,
 	struct sst_hsw *hsw = pdata->hsw;
 	int dai;
 
-	dai = mod_map[rtd->cpu_dai->id].dai_id;
+	dai = mod_map[asoc_rtd_to_cpu(rtd, 0)->id].dai_id;
 	pcm_data = &pdata->pcm[dai][substream->stream];
 
 	mutex_lock(&pcm_data->mutex);
@@ -801,7 +801,7 @@ static int hsw_pcm_open(struct snd_soc_component *component,
 
 	snd_soc_set_runtime_hwparams(substream, &hsw_pcm_hardware);
 
-	pcm_data->stream = sst_hsw_stream_new(hsw, rtd->cpu_dai->id,
+	pcm_data->stream = sst_hsw_stream_new(hsw, asoc_rtd_to_cpu(rtd, 0)->id,
 		hsw_notify_pointer, pcm_data);
 	if (pcm_data->stream == NULL) {
 		dev_err(rtd->dev, "error: failed to create stream\n");
@@ -824,7 +824,7 @@ static int hsw_pcm_close(struct snd_soc_component *component,
 	struct sst_hsw *hsw = pdata->hsw;
 	int ret, dai;
 
-	dai = mod_map[rtd->cpu_dai->id].dai_id;
+	dai = mod_map[asoc_rtd_to_cpu(rtd, 0)->id].dai_id;
 	pcm_data = &pdata->pcm[dai][substream->stream];
 
 	mutex_lock(&pcm_data->mutex);
@@ -923,9 +923,9 @@ static int hsw_pcm_new(struct snd_soc_component *component,
 			hsw_pcm_hardware.buffer_bytes_max);
 	}
 	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream)
-		priv_data->pcm[rtd->cpu_dai->id][SNDRV_PCM_STREAM_PLAYBACK].hsw_pcm = pcm;
+		priv_data->pcm[asoc_rtd_to_cpu(rtd, 0)->id][SNDRV_PCM_STREAM_PLAYBACK].hsw_pcm = pcm;
 	if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream)
-		priv_data->pcm[rtd->cpu_dai->id][SNDRV_PCM_STREAM_CAPTURE].hsw_pcm = pcm;
+		priv_data->pcm[asoc_rtd_to_cpu(rtd, 0)->id][SNDRV_PCM_STREAM_CAPTURE].hsw_pcm = pcm;
 
 	return 0;
 }
diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index 05a9677c5a53..89dcccdfb1cd 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -545,7 +545,7 @@ static int skl_link_hw_params(struct snd_pcm_substream *substream,
 	struct hdac_bus *bus = dev_get_drvdata(dai->dev);
 	struct hdac_ext_stream *link_dev;
 	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct skl_pipe_params p_params = {0};
 	struct hdac_ext_link *link;
 	int stream_tag;
@@ -644,7 +644,7 @@ static int skl_link_hw_free(struct snd_pcm_substream *substream,
 
 	link_dev->link_prepared = 0;
 
-	link = snd_hdac_ext_bus_get_link(bus, rtd->codec_dai->component->name);
+	link = snd_hdac_ext_bus_get_link(bus, asoc_rtd_to_codec(rtd, 0)->component->name);
 	if (!link)
 		return -EINVAL;
 
@@ -1074,7 +1074,7 @@ static int skl_platform_soc_open(struct snd_soc_component *component,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 
-	dev_dbg(rtd->cpu_dai->dev, "In %s:%s\n", __func__,
+	dev_dbg(asoc_rtd_to_cpu(rtd, 0)->dev, "In %s:%s\n", __func__,
 					dai_link->cpus->dai_name);
 
 	snd_soc_set_runtime_hwparams(substream, &azx_pcm_hw);
@@ -1226,7 +1226,7 @@ static u64 skl_adjust_codec_delay(struct snd_pcm_substream *substream,
 				u64 nsec)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	u64 codec_frames, codec_nsecs;
 
 	if (!codec_dai->driver->ops->delay)
@@ -1281,7 +1281,7 @@ static int skl_platform_soc_get_time_info(
 static int skl_platform_soc_new(struct snd_soc_component *component,
 				struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *dai = rtd->cpu_dai;
+	struct snd_soc_dai *dai = asoc_rtd_to_cpu(rtd, 0);
 	struct hdac_bus *bus = dev_get_drvdata(dai->dev);
 	struct snd_pcm *pcm = rtd->pcm;
 	unsigned int size;
-- 
2.20.1

