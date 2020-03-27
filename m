Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C699195A59
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 16:54:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFCB116B2;
	Fri, 27 Mar 2020 16:53:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFCB116B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585324459;
	bh=t8zi6GBo5UlHg+zUwvLvqMT9P4XnV1NCZLacK520y0o=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=j6sw1WSwEWUCSB3OXctotJdMGgd0Ma9A59oD2c9G/lQLFrWwQCipAWXTYP9h88dnR
	 Lf1ndX4D/UyrkC+yPAbRgK9gOq6Led6/ShC1D/Gq5YsbNpBRumsH945hj2LLlB2cDs
	 +l5VulsfvVrXEz2t11pM6m844plNAMoDEGvkCUHM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC1EBF803FA;
	Fri, 27 Mar 2020 16:35:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32805F803F9; Fri, 27 Mar 2020 16:35:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 74EF5F803F4
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 16:35:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74EF5F803F4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7AF931B;
 Fri, 27 Mar 2020 08:35:50 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 36D963F71F;
 Fri, 27 Mar 2020 08:35:50 -0700 (PDT)
Date: Fri, 27 Mar 2020 15:35:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: mediatek: use asoc_rtd_to_cpu() / asoc_rtd_to_codec()
 macro for DAI pointer" to the asoc tree
In-Reply-To: <87o8snir6s.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87o8snir6s.wl-kuninori.morimoto.gx@renesas.com>
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

   ASoC: mediatek: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer

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

From c8ac82127c83634847bf63cff00fb29ff2f7140a Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 23 Mar 2020 14:19:23 +0900
Subject: [PATCH] ASoC: mediatek: use asoc_rtd_to_cpu() / asoc_rtd_to_codec()
 macro for DAI pointer

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87o8snir6s.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c             | 10 +++++-----
 sound/soc/mediatek/common/mtk-afe-platform-driver.c    |  2 +-
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c             |  2 +-
 sound/soc/mediatek/mt2701/mt2701-cs42448.c             |  4 ++--
 sound/soc/mediatek/mt2701/mt2701-wm8960.c              |  4 ++--
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c             |  2 +-
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c             |  2 +-
 sound/soc/mediatek/mt8173/mt8173-max98090.c            |  4 ++--
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c       |  2 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c       |  4 ++--
 sound/soc/mediatek/mt8173/mt8173-rt5650.c              |  6 +++---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c             |  2 +-
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c     |  4 ++--
 .../mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c   |  2 +-
 14 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 4254f3a954dd..375e3b492922 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -40,7 +40,7 @@ int mtk_afe_fe_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	int memif_num = rtd->cpu_dai->id;
+	int memif_num = asoc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[memif_num];
 	const struct snd_pcm_hardware *mtk_afe_hardware = afe->mtk_afe_hardware;
 	int ret;
@@ -100,7 +100,7 @@ void mtk_afe_fe_shutdown(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	struct mtk_base_afe_memif *memif = &afe->memif[rtd->cpu_dai->id];
+	struct mtk_base_afe_memif *memif = &afe->memif[asoc_rtd_to_cpu(rtd, 0)->id];
 	int irq_id;
 
 	irq_id = memif->irq_usage;
@@ -122,7 +122,7 @@ int mtk_afe_fe_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	int id = rtd->cpu_dai->id;
+	int id = asoc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
 	int ret;
 	unsigned int channels = params_channels(params);
@@ -199,7 +199,7 @@ int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_runtime * const runtime = substream->runtime;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	int id = rtd->cpu_dai->id;
+	int id = asoc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
 	struct mtk_base_afe_irq *irqs = &afe->irqs[memif->irq_usage];
 	const struct mtk_base_irq_data *irq_data = irqs->irq_data;
@@ -265,7 +265,7 @@ int mtk_afe_fe_prepare(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd  = substream->private_data;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	int id = rtd->cpu_dai->id;
+	int id = asoc_rtd_to_cpu(rtd, 0)->id;
 	int pbuf_size;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index 44dfef713905..0a1a65c86f0e 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -82,7 +82,7 @@ snd_pcm_uframes_t mtk_afe_pcm_pointer(struct snd_soc_component *component,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
-	struct mtk_base_afe_memif *memif = &afe->memif[rtd->cpu_dai->id];
+	struct mtk_base_afe_memif *memif = &afe->memif[asoc_rtd_to_cpu(rtd, 0)->id];
 	const struct mtk_base_memif_data *memif_data = memif->data;
 	struct regmap *regmap = afe->regmap;
 	struct device *dev = afe->dev;
diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index 488603a0c4b1..f0250b0dd734 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -497,7 +497,7 @@ static int mt2701_memif_fs(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	int fs;
 
-	if (rtd->cpu_dai->id != MT2701_MEMIF_ULBT)
+	if (asoc_rtd_to_cpu(rtd, 0)->id != MT2701_MEMIF_ULBT)
 		fs = mt2701_afe_i2s_fs(rate);
 	else
 		fs = (rate == 16000 ? 1 : 0);
diff --git a/sound/soc/mediatek/mt2701/mt2701-cs42448.c b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
index b6941796efca..c47af9b6949b 100644
--- a/sound/soc/mediatek/mt2701/mt2701-cs42448.c
+++ b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
@@ -128,8 +128,8 @@ static int mt2701_cs42448_be_ops_hw_params(struct snd_pcm_substream *substream,
 					   struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	unsigned int mclk_rate;
 	unsigned int rate = params_rate(params);
 	unsigned int div_mclk_over_bck = rate > 192000 ? 2 : 4;
diff --git a/sound/soc/mediatek/mt2701/mt2701-wm8960.c b/sound/soc/mediatek/mt2701/mt2701-wm8960.c
index 8c4c89e4c616..0122e7df067f 100644
--- a/sound/soc/mediatek/mt2701/mt2701-wm8960.c
+++ b/sound/soc/mediatek/mt2701/mt2701-wm8960.c
@@ -25,8 +25,8 @@ static int mt2701_wm8960_be_ops_hw_params(struct snd_pcm_substream *substream,
 					  struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	unsigned int mclk_rate;
 	unsigned int rate = params_rate(params);
 	unsigned int div_mclk_over_bck = rate > 192000 ? 2 : 4;
diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index 378bfc16ef52..7f930556d961 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -143,7 +143,7 @@ static int mt6797_memif_fs(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
-	int id = rtd->cpu_dai->id;
+	int id = asoc_rtd_to_cpu(rtd, 0)->id;
 
 	return mt6797_rate_transform(afe->dev, rate, id);
 }
diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 461e4de8c918..1e3f2d786066 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -485,7 +485,7 @@ static int mt8173_memif_fs(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
-	struct mtk_base_afe_memif *memif = &afe->memif[rtd->cpu_dai->id];
+	struct mtk_base_afe_memif *memif = &afe->memif[asoc_rtd_to_cpu(rtd, 0)->id];
 	int fs;
 
 	if (memif->data->id == MT8173_AFE_MEMIF_DAI ||
diff --git a/sound/soc/mediatek/mt8173/mt8173-max98090.c b/sound/soc/mediatek/mt8173/mt8173-max98090.c
index 22c00600c999..37693d354e66 100644
--- a/sound/soc/mediatek/mt8173/mt8173-max98090.c
+++ b/sound/soc/mediatek/mt8173/mt8173-max98090.c
@@ -53,7 +53,7 @@ static int mt8173_max98090_hw_params(struct snd_pcm_substream *substream,
 				     struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 
 	return snd_soc_dai_set_sysclk(codec_dai, 0, params_rate(params) * 256,
 				      SND_SOC_CLOCK_IN);
@@ -67,7 +67,7 @@ static int mt8173_max98090_init(struct snd_soc_pcm_runtime *runtime)
 {
 	int ret;
 	struct snd_soc_card *card = runtime->card;
-	struct snd_soc_component *component = runtime->codec_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
 
 	/* enable jack detection */
 	ret = snd_soc_card_jack_new(card, "Headphone", SND_JACK_HEADPHONE,
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
index 5d82159f4f2e..51009a172777 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
@@ -73,7 +73,7 @@ static struct snd_soc_jack mt8173_rt5650_rt5514_jack;
 static int mt8173_rt5650_rt5514_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct snd_soc_card *card = runtime->card;
-	struct snd_soc_component *component = runtime->codec_dais[0]->component;
+	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
 	int ret;
 
 	rt5645_sel_asrc_clk_src(component,
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
index f65e3ebe38b8..247ac7690805 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
@@ -77,8 +77,8 @@ static struct snd_soc_jack mt8173_rt5650_rt5676_jack;
 static int mt8173_rt5650_rt5676_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct snd_soc_card *card = runtime->card;
-	struct snd_soc_component *component = runtime->codec_dais[0]->component;
-	struct snd_soc_component *component_sub = runtime->codec_dais[1]->component;
+	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
+	struct snd_soc_component *component_sub = asoc_rtd_to_codec(runtime, 1)->component;
 	int ret;
 
 	rt5645_sel_asrc_clk_src(component,
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650.c b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
index bbc4ad749892..2065c94dbf99 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
@@ -104,8 +104,8 @@ static struct snd_soc_jack mt8173_rt5650_jack, mt8173_rt5650_hdmi_jack;
 static int mt8173_rt5650_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct snd_soc_card *card = runtime->card;
-	struct snd_soc_component *component = runtime->codec_dais[0]->component;
-	const char *codec_capture_dai = runtime->codec_dais[1]->name;
+	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
+	const char *codec_capture_dai = asoc_rtd_to_codec(runtime, 1)->name;
 	int ret;
 
 	rt5645_sel_asrc_clk_src(component,
@@ -154,7 +154,7 @@ static int mt8173_rt5650_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 	if (ret)
 		return ret;
 
-	return hdmi_codec_set_jack_detect(rtd->codec_dai->component,
+	return hdmi_codec_set_jack_detect(asoc_rtd_to_codec(rtd, 0)->component,
 					  &mt8173_rt5650_hdmi_jack);
 }
 
diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 6e2270bbb10e..c8ded53bde1d 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -146,7 +146,7 @@ static int mt8183_memif_fs(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
-	int id = rtd->cpu_dai->id;
+	int id = asoc_rtd_to_cpu(rtd, 0)->id;
 
 	return mt8183_rate_transform(afe->dev, rate, id);
 }
diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index c4e4f1f99dde..5b3dfa79b4ae 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -28,7 +28,7 @@ static int mt8183_mt6358_i2s_hw_params(struct snd_pcm_substream *substream,
 	unsigned int mclk_fs_ratio = 128;
 	unsigned int mclk_fs = rate * mclk_fs_ratio;
 
-	return snd_soc_dai_set_sysclk(rtd->cpu_dai,
+	return snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0),
 				      0, mclk_fs, SND_SOC_CLOCK_OUT);
 }
 
@@ -47,7 +47,7 @@ static int mt8183_da7219_i2s_hw_params(struct snd_pcm_substream *substream,
 	unsigned int freq;
 	int ret = 0, j;
 
-	ret = snd_soc_dai_set_sysclk(rtd->cpu_dai, 0,
+	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), 0,
 				     mclk_fs, SND_SOC_CLOCK_OUT);
 	if (ret < 0)
 		dev_err(rtd->dev, "failed to set cpu dai sysclk\n");
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 0555f7d73d05..1fca8df109b4 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -41,7 +41,7 @@ static int mt8183_mt6358_i2s_hw_params(struct snd_pcm_substream *substream,
 	unsigned int mclk_fs_ratio = 128;
 	unsigned int mclk_fs = rate * mclk_fs_ratio;
 
-	return snd_soc_dai_set_sysclk(rtd->cpu_dai,
+	return snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0),
 				      0, mclk_fs, SND_SOC_CLOCK_OUT);
 }
 
-- 
2.20.1

