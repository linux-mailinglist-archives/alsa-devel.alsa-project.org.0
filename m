Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E994C950D
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 20:51:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 002C61AB2;
	Tue,  1 Mar 2022 20:50:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 002C61AB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646164262;
	bh=UCbHTQfNfGrq+Q5MNsFEtHhPITOCx++8yy3x8AYF5GM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m9wo7VmE7Ukb0Oh7z1D4+x8kj+bkUXIP6CA9CKfHEvZO5/WNapQzXsaoAevWGUCju
	 p1LLZbkGrdz3s/o7wc+Fstaq/EYyundCqWijMGQHY7F5+XFmm1mTJ1BdiqFmWn2h41
	 Ize84sKXBm3NsIMNmb37eHWtuHglTzStv+LVOYVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAF7CF802D2;
	Tue,  1 Mar 2022 20:49:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 807E6F80095; Tue,  1 Mar 2022 20:49:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9587BF80095
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 20:49:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9587BF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BhKNNhyX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646164159; x=1677700159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UCbHTQfNfGrq+Q5MNsFEtHhPITOCx++8yy3x8AYF5GM=;
 b=BhKNNhyXUP7xGEsbe4PmdE0dHfaK0DYnpCiyDhE/MtDz8BBxffruBVMC
 MMZ4DWkyzHBYbMxmZ2wcGMurhwU29w66sGmtWT3dL6JtK4dt+prPRJu9h
 GLMMVc6HPEXhrKSS0OOtyztTeSB+vW+NgkQ9J66TciYIr8o9Mmoy8/uIo
 +Ofm/n3QmqLZvzFTjXTzVjQPkGnw4e3p3egMRbIjEPHdMuzkkAYAlsCKg
 hPglxIiFlVQN4XLTvg5L1HoOLm66WsJ3qcF9Xz6XGNqruZEEZBJksPNqG
 vh6dX2czTs11x79XCZUX/p5/w3jGwpkLL/iKqfOUOweGZ0NU4pSJ9TXeO g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="233841063"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="233841063"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 11:49:15 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="630131851"
Received: from rbrosius-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.131.146])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 11:49:14 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/8] ASoC: Intel: add RT1308 I2S machine driver and HDMI-in
 capture via I2S support.
Date: Tue,  1 Mar 2022 13:48:58 -0600
Message-Id: <20220301194903.60859-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301194903.60859-1-pierre-louis.bossart@linux.intel.com>
References: <20220301194903.60859-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, "balamurugan.c" <balamurugan.c@intel.com>,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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

From: "balamurugan.c" <balamurugan.c@intel.com>

Adding separate I2S machine driver for RT1308.

Adding support for HDMI-In capture via I2S in slave mode configuration.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: balamurugan.c <balamurugan.c@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig                |  12 +
 sound/soc/intel/boards/Makefile               |   2 +
 sound/soc/intel/boards/sof_rt1308.c           | 305 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-tgl-match.c   |  12 +
 4 files changed, 331 insertions(+)
 create mode 100644 sound/soc/intel/boards/sof_rt1308.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 34ccefcc30c7..ad0664ca4915 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -599,6 +599,18 @@ config SND_SOC_INTEL_SOF_DA7219_MAX98373_MACH
 
 endif ## SND_SOC_SOF_JASPERLAKE
 
+config SND_SOC_INTEL_SOF_RT1308_MACH
+	tristate "SOF with RT1308 in I2S Mode"
+	depends on I2C && ACPI && GPIOLIB
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	select SND_SOC_RT1308
+	select SND_SOC_DMIC
+	help
+	   This adds support for ASoC machine driver for Tigerlake platforms
+	   with RT1308 I2S audio codec.
+	   Say Y if you have such a device.
+	   If unsure select "N".
+
 if SND_SOC_SOF_ELKHARTLAKE
 
 config SND_SOC_INTEL_EHL_RT5660_MACH
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 3ea273d27168..9f044290b420 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -35,6 +35,7 @@ snd-skl_nau88l25_max98357a-objs := skl_nau88l25_max98357a.o
 snd-soc-skl_nau88l25_ssm4567-objs := skl_nau88l25_ssm4567.o
 snd-soc-sof_da7219_max98373-objs := sof_da7219_max98373.o
 snd-soc-ehl-rt5660-objs := ehl_rt5660.o
+snd-soc-sof-rt1308-objs := sof_rt1308.o
 snd-soc-sof-sdw-objs += sof_sdw.o				\
 			sof_sdw_max98373.o			\
 			sof_sdw_rt1308.o sof_sdw_rt1316.o	\
@@ -79,6 +80,7 @@ obj-$(CONFIG_SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH) += snd-soc-skl_hda_dsp.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_DA7219_MAX98373_MACH) += snd-soc-sof_da7219_max98373.o
 obj-$(CONFIG_SND_SOC_INTEL_EHL_RT5660_MACH) += snd-soc-ehl-rt5660.o
 obj-$(CONFIG_SND_SOC_INTEL_SOUNDWIRE_SOF_MACH) += snd-soc-sof-sdw.o
+obj-$(CONFIG_SND_SOC_INTEL_SOF_RT1308_MACH) += snd-soc-sof-rt1308.o
 
 # common modules
 snd-soc-intel-hda-dsp-common-objs := hda_dsp_common.o
diff --git a/sound/soc/intel/boards/sof_rt1308.c b/sound/soc/intel/boards/sof_rt1308.c
new file mode 100644
index 000000000000..7e33c49b3531
--- /dev/null
+++ b/sound/soc/intel/boards/sof_rt1308.c
@@ -0,0 +1,305 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2022 Intel Corporation. All rights reserved.
+
+/*
+ * sof_rt1308.c - ASoc Machine driver for Intel platforms
+ * with RT1308 codec.
+ */
+
+#include <linux/acpi.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <sound/core.h>
+#include <sound/jack.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/sof.h>
+#include "../../codecs/rt1308.h"
+
+#define SOF_RT1308_SSP_CODEC(quirk)		((quirk) & GENMASK(3, 0))
+#define SOF_RT1308_SSP_CODEC_MASK			(GENMASK(3, 0))
+
+/* HDMI capture*/
+#define SOF_SSP_HDMI_CAPTURE_PRESENT		BIT(4)
+#define SOF_NO_OF_HDMI_CAPTURE_SSP_SHIFT		5
+#define SOF_NO_OF_HDMI_CAPTURE_SSP_MASK		(GENMASK(6, 5))
+#define SOF_NO_OF_HDMI_CAPTURE_SSP(quirk)	\
+	(((quirk) << SOF_NO_OF_HDMI_CAPTURE_SSP_SHIFT) & SOF_NO_OF_HDMI_CAPTURE_SSP_MASK)
+
+#define SOF_HDMI_CAPTURE_1_SSP_SHIFT		7
+#define SOF_HDMI_CAPTURE_1_SSP_MASK		(GENMASK(9, 7))
+#define SOF_HDMI_CAPTURE_1_SSP(quirk)	\
+	(((quirk) << SOF_HDMI_CAPTURE_1_SSP_SHIFT) & SOF_HDMI_CAPTURE_1_SSP_MASK)
+
+#define SOF_HDMI_CAPTURE_2_SSP_SHIFT		10
+#define SOF_HDMI_CAPTURE_2_SSP_MASK		(GENMASK(12, 10))
+#define SOF_HDMI_CAPTURE_2_SSP(quirk)	\
+	(((quirk) << SOF_HDMI_CAPTURE_2_SSP_SHIFT) & SOF_HDMI_CAPTURE_2_SSP_MASK)
+
+/* Default: SSP2  */
+static unsigned long sof_rt1308_quirk = SOF_RT1308_SSP_CODEC(2);
+
+static const struct snd_soc_dapm_widget sof_rt1308_dapm_widgets[] = {
+	SND_SOC_DAPM_SPK("Speakers", NULL),
+	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
+};
+
+static const struct snd_kcontrol_new sof_rt1308_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Speakers"),
+};
+
+static const struct snd_soc_dapm_route sof_rt1308_dapm_routes[] = {
+	{ "Speakers", NULL, "SPOL" },
+	{ "Speakers", NULL, "SPOR" },
+
+	/* digital mics */
+	{"DMic", NULL, "SoC DMIC"},
+};
+
+static struct snd_soc_card sof_rt1308_card = {
+	.name         = "rt1308",
+	.owner        = THIS_MODULE,
+	.controls = sof_rt1308_controls,
+	.num_controls = ARRAY_SIZE(sof_rt1308_controls),
+	.dapm_widgets = sof_rt1308_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sof_rt1308_dapm_widgets),
+	.dapm_routes = sof_rt1308_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(sof_rt1308_dapm_routes),
+	.fully_routed = true,
+};
+
+static int sof_rt1308_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	int clk_id, clk_freq, pll_out;
+	int ret;
+
+	clk_id = RT1308_PLL_S_MCLK;
+	/* get the tplg configured mclk. */
+	clk_freq = sof_dai_get_mclk(rtd);
+
+	pll_out = params_rate(params) * 512;
+
+	/* Set rt1308 pll */
+	ret = snd_soc_dai_set_pll(codec_dai, 0, clk_id, clk_freq, pll_out);
+	if (ret < 0) {
+		dev_err(card->dev, "Failed to set RT1308 PLL: %d\n", ret);
+		return ret;
+	}
+
+	/* Set rt1308 sysclk */
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT1308_FS_SYS_S_PLL, pll_out,
+				     SND_SOC_CLOCK_IN);
+	if (ret < 0)
+		dev_err(card->dev, "Failed to set RT1308 SYSCLK: %d\n", ret);
+
+	return ret;
+}
+
+static struct snd_soc_dai_link_component platform_component[] = {
+	{
+		/* name might be overridden during probe */
+		.name = "0000:00:1f.3"
+	}
+};
+
+static struct snd_soc_dai_link_component rt1308_component[] = {
+	{
+		.name = "i2c-10EC1308:00",
+		.dai_name = "rt1308-aif",
+	}
+};
+
+static struct snd_soc_dai_link_component dmic_component[] = {
+	{
+		.name = "dmic-codec",
+		.dai_name = "dmic-hifi",
+	}
+};
+
+static struct snd_soc_dai_link_component dummy_component[] = {
+	{
+		.name = "snd-soc-dummy",
+		.dai_name = "snd-soc-dummy-dai",
+	}
+};
+
+/* machine stream operations */
+static const struct snd_soc_ops sof_rt1308_ops = {
+	.hw_params = sof_rt1308_hw_params,
+};
+
+static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
+							  int ssp_codec,
+							  int dmic_be_num)
+{
+	struct snd_soc_dai_link_component *cpus;
+	struct snd_soc_dai_link *links;
+	int i, id = 0;
+
+	links = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link) *
+					sof_rt1308_card.num_links, GFP_KERNEL);
+	cpus = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component) *
+					sof_rt1308_card.num_links, GFP_KERNEL);
+	if (!links || !cpus)
+		return NULL;
+
+	/* HDMI-In SSP */
+	if (sof_rt1308_quirk & SOF_SSP_HDMI_CAPTURE_PRESENT) {
+		int num_of_hdmi_ssp = (sof_rt1308_quirk & SOF_NO_OF_HDMI_CAPTURE_SSP_MASK) >>
+				SOF_NO_OF_HDMI_CAPTURE_SSP_SHIFT;
+
+		for (i = 1; i <= num_of_hdmi_ssp; i++) {
+			int port = (i == 1 ? (sof_rt1308_quirk & SOF_HDMI_CAPTURE_1_SSP_MASK) >>
+						SOF_HDMI_CAPTURE_1_SSP_SHIFT :
+						(sof_rt1308_quirk & SOF_HDMI_CAPTURE_2_SSP_MASK) >>
+						SOF_HDMI_CAPTURE_2_SSP_SHIFT);
+
+			links[id].cpus = &cpus[id];
+			links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
+								  "SSP%d Pin", port);
+			if (!links[id].cpus->dai_name)
+				return NULL;
+			links[id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-HDMI", port);
+			if (!links[id].name)
+				return NULL;
+			links[id].id = id;
+			links[id].codecs = dummy_component;
+			links[id].num_codecs = ARRAY_SIZE(dummy_component);
+			links[id].platforms = platform_component;
+			links[id].num_platforms = ARRAY_SIZE(platform_component);
+			links[id].dpcm_capture = 1;
+			links[id].no_pcm = 1;
+			links[id].num_cpus = 1;
+			id++;
+		}
+	}
+
+	/* codec SSP */
+	links[id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", ssp_codec);
+	if (!links[id].name)
+		return NULL;
+
+	links[id].id = id;
+	links[id].codecs = rt1308_component;
+	links[id].num_codecs = ARRAY_SIZE(rt1308_component);
+	links[id].platforms = platform_component;
+	links[id].num_platforms = ARRAY_SIZE(platform_component);
+	links[id].ops = &sof_rt1308_ops;
+	links[id].dpcm_playback = 1;
+	links[id].no_pcm = 1;
+	links[id].cpus = &cpus[id];
+	links[id].num_cpus = 1;
+	links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", ssp_codec);
+	if (!links[id].cpus->dai_name)
+		return NULL;
+
+	id++;
+
+	/* dmic */
+	if (dmic_be_num > 0) {
+		/* at least we have dmic01 */
+		links[id].name = "dmic01";
+		links[id].cpus = &cpus[id];
+		links[id].cpus->dai_name = "DMIC01 Pin";
+		if (dmic_be_num > 1) {
+			/* set up 2 BE links at most */
+			links[id + 1].name = "dmic16k";
+			links[id + 1].cpus = &cpus[id + 1];
+			links[id + 1].cpus->dai_name = "DMIC16k Pin";
+			dmic_be_num = 2;
+		}
+	}
+
+	for (i = 0; i < dmic_be_num; i++) {
+		links[id].id = id;
+		links[id].num_cpus = 1;
+		links[id].codecs = dmic_component;
+		links[id].num_codecs = ARRAY_SIZE(dmic_component);
+		links[id].platforms = platform_component;
+		links[id].num_platforms = ARRAY_SIZE(platform_component);
+		links[id].ignore_suspend = 1;
+		links[id].dpcm_capture = 1;
+		links[id].no_pcm = 1;
+		id++;
+	}
+
+	return links;
+}
+
+static int sof_rt1308_probe(struct platform_device *pdev)
+{
+	struct snd_soc_dai_link *dai_links;
+	struct snd_soc_acpi_mach *mach;
+	int dmic_be_num;
+	int ret, ssp_codec;
+
+	if (pdev->id_entry && pdev->id_entry->driver_data)
+		sof_rt1308_quirk = (unsigned long)pdev->id_entry->driver_data;
+
+	mach = pdev->dev.platform_data;
+
+	dmic_be_num = mach->mach_params.dmic_num;
+
+	ssp_codec = sof_rt1308_quirk & SOF_RT1308_SSP_CODEC_MASK;
+
+	/* set number of dai links */
+	sof_rt1308_card.num_links = 1 + dmic_be_num;
+
+	if (sof_rt1308_quirk & SOF_SSP_HDMI_CAPTURE_PRESENT)
+		sof_rt1308_card.num_links += (sof_rt1308_quirk & SOF_NO_OF_HDMI_CAPTURE_SSP_MASK) >>
+				SOF_NO_OF_HDMI_CAPTURE_SSP_SHIFT;
+
+	dai_links = sof_card_dai_links_create(&pdev->dev, ssp_codec, dmic_be_num);
+	if (!dai_links)
+		return -ENOMEM;
+
+	sof_rt1308_card.dai_link = dai_links;
+
+	sof_rt1308_card.dev = &pdev->dev;
+
+	/* set platform name for each dailink */
+	ret = snd_soc_fixup_dai_links_platform_name(&sof_rt1308_card,
+						    mach->mach_params.platform);
+	if (ret)
+		return ret;
+
+	snd_soc_card_set_drvdata(&sof_rt1308_card, NULL);
+
+	return devm_snd_soc_register_card(&pdev->dev, &sof_rt1308_card);
+}
+
+static const struct platform_device_id board_ids[] = {
+	{
+		.name = "sof_rt1308",
+	},
+	{
+		.name = "tgl_rt1308_hdmi_ssp",
+		.driver_data = (kernel_ulong_t)(SOF_RT1308_SSP_CODEC(2) |
+					SOF_NO_OF_HDMI_CAPTURE_SSP(2) |
+					SOF_HDMI_CAPTURE_1_SSP(1) |
+					SOF_HDMI_CAPTURE_2_SSP(5) |
+					SOF_SSP_HDMI_CAPTURE_PRESENT),
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, board_ids);
+
+static struct platform_driver sof_rt1308_driver = {
+	.probe          = sof_rt1308_probe,
+	.driver = {
+		.name   = "sof_rt1308",
+		.pm = &snd_soc_pm_ops,
+	},
+	.id_table = board_ids,
+};
+module_platform_driver(sof_rt1308_driver);
+
+MODULE_DESCRIPTION("ASoC Intel(R) SOF + RT1308 Machine driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:sof_rt1308");
diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index daff01466c05..224b54d35c7a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -363,6 +363,11 @@ static const struct snd_soc_acpi_codecs tgl_rt5682_rt5682s_hp = {
 	.codecs = {"10EC5682", "RTL5682"},
 };
 
+static const struct snd_soc_acpi_codecs tgl_lt6911_hdmi = {
+	.num_codecs = 1,
+	.codecs = {"INTC10B0"}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[] = {
 	{
 		.comp_ids = &tgl_rt5682_rt5682s_hp,
@@ -390,6 +395,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[] = {
 		.drv_name = "sof-essx8336",
 		.sof_tplg_filename = "sof-tgl-es8336.tplg",
 	},
+	{
+		.id = "10EC1308",
+		.drv_name = "tgl_rt1308_hdmi_ssp",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &tgl_lt6911_hdmi,
+		.sof_tplg_filename = "sof-tgl-rt1308-ssp2-hdmi-ssp15.tplg"
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_tgl_machines);
-- 
2.25.1

