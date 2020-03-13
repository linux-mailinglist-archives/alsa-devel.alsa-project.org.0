Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE63E184C56
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 17:21:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50E4E1822;
	Fri, 13 Mar 2020 17:20:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50E4E1822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584116493;
	bh=ChMoFeA7sw2fHJeuOdSe2QdrdRL97KvWhYtSjm2lLbc=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Dkelrg87dzxRrOfzPUlK937Afpmh+295leIuGlW5d46c9oI1ySOf9SST3jGGZmTCz
	 m2BiDhHWHGXSh+MzKP8nHEApydIcDkhBBFMQ3a9VEDmBcM/8a/3So5r4eUPDtJ42//
	 11/a+ScwmaKr8oqP5wKXPtwReI1W3mEinKAVvXe8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 119CCF802A9;
	Fri, 13 Mar 2020 17:17:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98343F8028B; Fri, 13 Mar 2020 17:17:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 2ACF6F8023E
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 17:17:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2ACF6F8023E
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B207EFEC;
 Fri, 13 Mar 2020 09:17:30 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 346F43F6CF;
 Fri, 13 Mar 2020 09:17:30 -0700 (PDT)
Date: Fri, 13 Mar 2020 16:17:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Yong Zhi <yong.zhi@intel.com>
Subject: Applied "ASoC: Intel: sof_rt5682: Add rt1015 speaker amp support" to
 the asoc tree
In-Reply-To: <20200312194859.4051-10-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200312194859.4051-10-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

   ASoC: Intel: sof_rt5682: Add rt1015 speaker amp support

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

From a79ae0f6c95652752774e66fd4fa5191d868df9f Mon Sep 17 00:00:00 2001
From: Yong Zhi <yong.zhi@intel.com>
Date: Thu, 12 Mar 2020 14:48:58 -0500
Subject: [PATCH] ASoC: Intel: sof_rt5682: Add rt1015 speaker amp support

This patch adds jsl_rt5682_rt1015 which supports the
RT5682 headset codec and RT1015 speaker amplifier combination
on JasperLake platform.

Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200312194859.4051-10-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/Kconfig                |   1 +
 sound/soc/intel/boards/sof_rt5682.c           | 108 +++++++++++++++++-
 .../intel/common/soc-acpi-intel-jsl-match.c   |  15 ++-
 3 files changed, 118 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index ab4ce652cc1a..fb8d83518c47 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -450,6 +450,7 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
 	depends on (SND_SOC_SOF_HDA_LINK && (MFD_INTEL_LPSS || COMPILE_TEST)) ||\
 		   (SND_SOC_SOF_BAYTRAIL && (X86_INTEL_LPSS || COMPILE_TEST))
 	depends on SND_HDA_CODEC_HDMI
+	select SND_SOC_RT1015
 	select SND_SOC_RT5682
 	select SND_SOC_DMIC
 	select SND_SOC_HDAC_HDMI
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 99b5a5e01e38..6defe7c85c32 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
-// Copyright(c) 2019 Intel Corporation.
+// Copyright(c) 2019-2020 Intel Corporation.
 
 /*
  * Intel SOF Machine Driver with Realtek rt5682 Codec
- * and speaker codec MAX98357A
+ * and speaker codec MAX98357A or RT1015.
  */
 #include <linux/i2c.h>
 #include <linux/input.h>
@@ -18,6 +18,7 @@
 #include <sound/soc.h>
 #include <sound/rt5682.h>
 #include <sound/soc-acpi.h>
+#include "../../codecs/rt1015.h"
 #include "../../codecs/rt5682.h"
 #include "../../codecs/hdac_hdmi.h"
 #include "../common/soc-intel-quirks.h"
@@ -39,6 +40,7 @@
 #define SOF_RT5682_NUM_HDMIDEV_MASK		(GENMASK(12, 10))
 #define SOF_RT5682_NUM_HDMIDEV(quirk)	\
 	((quirk << SOF_RT5682_NUM_HDMIDEV_SHIFT) & SOF_RT5682_NUM_HDMIDEV_MASK)
+#define SOF_RT1015_SPEAKER_AMP_PRESENT		BIT(13)
 
 /* Default: MCLK on, MCLK 19.2M, SSP0  */
 static unsigned long sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
@@ -260,6 +262,42 @@ static struct snd_soc_ops sof_rt5682_ops = {
 	.hw_params = sof_rt5682_hw_params,
 };
 
+static int sof_rt1015_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dai *codec_dai;
+	int i, ret;
+
+	if (!snd_soc_card_get_codec_dai(card, "rt1015-aif"))
+		return 0;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		ret = snd_soc_dai_set_pll(codec_dai, 0, RT1015_PLL_S_BCLK,
+					  params_rate(params) * 50,
+					  params_rate(params) * 256);
+		if (ret < 0) {
+			dev_err(card->dev, "failed to set pll\n");
+			return ret;
+		}
+		/* Configure sysclk for codec */
+		ret = snd_soc_dai_set_sysclk(codec_dai, RT1015_SCLK_S_PLL,
+					     params_rate(params) * 256,
+					     SND_SOC_CLOCK_IN);
+		if (ret < 0) {
+			dev_err(card->dev, "failed to set sysclk\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static struct snd_soc_ops sof_rt1015_ops = {
+	.hw_params = sof_rt1015_hw_params,
+};
+
 static struct snd_soc_dai_link_component platform_component[] = {
 	{
 		/* name might be overridden during probe */
@@ -316,12 +354,17 @@ static const struct snd_kcontrol_new sof_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 	SOC_DAPM_PIN_SWITCH("Spk"),
+	SOC_DAPM_PIN_SWITCH("Left Spk"),
+	SOC_DAPM_PIN_SWITCH("Right Spk"),
+
 };
 
 static const struct snd_soc_dapm_widget sof_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_SPK("Spk", NULL),
+	SND_SOC_DAPM_SPK("Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Right Spk", NULL),
 };
 
 static const struct snd_soc_dapm_widget dmic_widgets[] = {
@@ -342,11 +385,22 @@ static const struct snd_soc_dapm_route speaker_map[] = {
 	{ "Spk", NULL, "Speaker" },
 };
 
+static const struct snd_soc_dapm_route speaker_map_lr[] = {
+	{ "Left Spk", NULL, "Left SPO" },
+	{ "Right Spk", NULL, "Right SPO" },
+};
+
 static const struct snd_soc_dapm_route dmic_map[] = {
 	/* digital mics */
 	{"DMic", NULL, "SoC DMIC"},
 };
 
+static int speaker_codec_init_lr(struct snd_soc_pcm_runtime *rtd)
+{
+	return snd_soc_dapm_add_routes(&rtd->card->dapm, speaker_map_lr,
+				       ARRAY_SIZE(speaker_map_lr));
+}
+
 static int speaker_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
@@ -382,6 +436,17 @@ static int dmic_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
+static struct snd_soc_codec_conf rt1015_amp_conf[] = {
+	{
+		.dlc = COMP_CODEC_CONF("i2c-10EC1015:00"),
+		.name_prefix = "Left",
+	},
+	{
+		.dlc = COMP_CODEC_CONF("i2c-10EC1015:01"),
+		.name_prefix = "Right",
+	},
+};
+
 /* sof audio machine driver for rt5682 codec */
 static struct snd_soc_card sof_audio_card_rt5682 = {
 	.name = "rt5682", /* the sof- prefix is added by the core */
@@ -417,6 +482,17 @@ static struct snd_soc_dai_link_component max98357a_component[] = {
 	}
 };
 
+static struct snd_soc_dai_link_component rt1015_components[] = {
+	{
+		.name = "i2c-10EC1015:00",
+		.dai_name = "rt1015-aif",
+	},
+	{
+		.name = "i2c-10EC1015:01",
+		.dai_name = "rt1015-aif",
+	},
+};
+
 static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 							  int ssp_codec,
 							  int ssp_amp,
@@ -556,11 +632,18 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			goto devm_err;
 
 		links[id].id = id;
-		links[id].codecs = max98357a_component;
-		links[id].num_codecs = ARRAY_SIZE(max98357a_component);
+		if (sof_rt5682_quirk & SOF_RT1015_SPEAKER_AMP_PRESENT) {
+			links[id].codecs = rt1015_components;
+			links[id].num_codecs = ARRAY_SIZE(rt1015_components);
+			links[id].init = speaker_codec_init_lr;
+			links[id].ops = &sof_rt1015_ops;
+		} else {
+			links[id].codecs = max98357a_component;
+			links[id].num_codecs = ARRAY_SIZE(max98357a_component);
+			links[id].init = speaker_codec_init;
+		}
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
-		links[id].init = speaker_codec_init,
 		links[id].nonatomic = true;
 		links[id].dpcm_playback = 1;
 		links[id].no_pcm = 1;
@@ -669,6 +752,11 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	sof_audio_card_rt5682.dai_link = dai_links;
 
+	if (sof_rt5682_quirk & SOF_RT1015_SPEAKER_AMP_PRESENT) {
+		sof_audio_card_rt5682.codec_conf = rt1015_amp_conf;
+		sof_audio_card_rt5682.num_configs = ARRAY_SIZE(rt1015_amp_conf);
+	}
+
 	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
 
 	sof_audio_card_rt5682.dev = &pdev->dev;
@@ -714,6 +802,15 @@ static const struct platform_device_id board_ids[] = {
 					SOF_RT5682_SSP_AMP(1) |
 					SOF_RT5682_NUM_HDMIDEV(4)),
 	},
+	{
+		.name = "jsl_rt5682_rt1015",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_MCLK_24MHZ |
+					SOF_RT5682_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_RT1015_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(1)),
+	},
 	{ }
 };
 
@@ -735,3 +832,4 @@ MODULE_AUTHOR("Sathya Prakash M R <sathya.prakash.m.r@intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:sof_rt5682");
 MODULE_ALIAS("platform:tgl_max98357a_rt5682");
+MODULE_ALIAS("platform:jsl_rt5682_rt1015");
diff --git a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
index 70f01495a166..4388a32718d8 100644
--- a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
@@ -2,7 +2,7 @@
 /*
  * soc-apci-intel-jsl-match.c - tables and support for JSL ACPI enumeration.
  *
- * Copyright (c) 2019, Intel Corporation.
+ * Copyright (c) 2019-2020, Intel Corporation.
  *
  */
 
@@ -14,6 +14,11 @@ static struct snd_soc_acpi_codecs jsl_7219_98373_codecs = {
 	.codecs = {"MX98373"}
 };
 
+static struct snd_soc_acpi_codecs rt1015_spk = {
+	.num_codecs = 1,
+	.codecs = {"10EC1015"}
+};
+
 /*
  * When adding new entry to the snd_soc_acpi_intel_jsl_machines array,
  * use .quirk_data member to distinguish different machine driver,
@@ -34,6 +39,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
 		.sof_fw_filename = "sof-jsl.ri",
 		.sof_tplg_filename = "sof-jsl-da7219-mx98360a.tplg",
 	},
+	{
+		.id = "10EC5682",
+		.drv_name = "jsl_rt5682_rt1015",
+		.sof_fw_filename = "sof-jsl.ri",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &rt1015_spk,
+		.sof_tplg_filename = "sof-jsl-rt5682-rt1015.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_jsl_machines);
-- 
2.20.1

