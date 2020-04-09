Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B43371A3A2E
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 21:07:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 595281691;
	Thu,  9 Apr 2020 21:06:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 595281691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586459237;
	bh=/rNfNGn4egmb4ePiJE1aQ1q6qGGRGhysexO4Lhufuu0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EvrUaLeXgoBjzPdYyQv8FHc3kDdogwaJpm3q3zUybArfrIYRdVTmGqKdQjz/2wQJL
	 VsSaj9a6h+hgXwxrbS+XH4oMcg/BVS3K5Iv8Xm2/iWxf43F5hqBXGTSVueNJit4GiX
	 FMudRwmBroMbKPxUzb3O5agNVnK+zUJroe8qQ43g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19D32F80306;
	Thu,  9 Apr 2020 20:59:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB860F802EA; Thu,  9 Apr 2020 20:59:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF6E9F80216
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 20:58:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF6E9F80216
IronPort-SDR: OXdfWE+AwXBX5OJgRh82j46hI94FRBFdY2YU9YVYreAz7yK3mRzWQiKHN4ai3gGFJer2U9yMcn
 IOk8uDTvFY4A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 11:58:39 -0700
IronPort-SDR: n3xBqPzp0D3ni4IYvIPOM+2Byi+rSkJjYoBBEYp7QxbJ5mIRtFEWSRzKDoAxe7eXokvH1Xvd2H
 m2WA0e8/w/zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; d="scan'208";a="255248837"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
 by orsmga006.jf.intel.com with ESMTP; 09 Apr 2020 11:58:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/13] ASoC: Intel: boards: support Elkhart Lake with rt5660
Date: Thu,  9 Apr 2020 13:58:19 -0500
Message-Id: <20200409185827.16255-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409185827.16255-1-pierre-louis.bossart@linux.intel.com>
References: <20200409185827.16255-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Muhammad Nazif Bin Mohd Borhan <muhammad.nazif.mohd.borhan@intel.com>,
 broonie@kernel.org, Libin Yang <libin.yang@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Libin Yang <libin.yang@linux.intel.com>

This patch adds the support of Intel Elkhart Lake with
Realtek rt5660 codec.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Libin Yang <libin.yang@linux.intel.com>
Signed-off-by: Muhammad Nazif Bin Mohd Borhan <muhammad.nazif.mohd.borhan@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig                |  15 +
 sound/soc/intel/boards/Makefile               |   2 +
 sound/soc/intel/boards/ehl_rt5660.c           | 323 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-ehl-match.c   |   7 +
 4 files changed, 347 insertions(+)
 create mode 100644 sound/soc/intel/boards/ehl_rt5660.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 556c3104e641..c57bc6d0f145 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -524,6 +524,21 @@ config SND_SOC_INTEL_SOF_DA7219_MAX98373_MACH
 
 endif ## SND_SOC_SOF_JASPERLAKE
 
+if SND_SOC_SOF_ELKHARTLAKE
+
+config SND_SOC_INTEL_EHL_RT5660_MACH
+	tristate "EHL with RT5660 in I2S mode"
+	depends on I2C && ACPI
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	depends on SND_HDA_CODEC_HDMI
+	select SND_SOC_RT5660
+	select SND_SOC_DMIC
+	help
+	  This adds support for ASoC machine driver for Elkhart Lake
+	  platform with RT5660 I2S audio codec.
+
+endif ## SND_SOC_SOF_ELKHARTLAKE
+
 if SND_SOC_SOF_INTEL_SOUNDWIRE
 
 config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 1ef6e60bc2a0..98bf42463a1b 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -31,6 +31,7 @@ snd-soc-skl_hda_dsp-objs := skl_hda_dsp_generic.o skl_hda_dsp_common.o hda_dsp_c
 snd-skl_nau88l25_max98357a-objs := skl_nau88l25_max98357a.o
 snd-soc-skl_nau88l25_ssm4567-objs := skl_nau88l25_ssm4567.o
 snd-soc-sof_da7219_max98373-objs := sof_da7219_max98373.o hda_dsp_common.o
+snd-soc-ehl-rt5660-objs := ehl_rt5660.o hda_dsp_common.o
 snd-soc-sof-sdw-objs += sof_sdw.o				\
 			sof_sdw_rt711.o sof_sdw_rt700.o		\
 			sof_sdw_rt1308.o sof_sdw_rt715.o	\
@@ -68,4 +69,5 @@ obj-$(CONFIG_SND_SOC_INTEL_SKL_NAU88L25_MAX98357A_MACH) += snd-skl_nau88l25_max9
 obj-$(CONFIG_SND_SOC_INTEL_SKL_NAU88L25_SSM4567_MACH) += snd-soc-skl_nau88l25_ssm4567.o
 obj-$(CONFIG_SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH) += snd-soc-skl_hda_dsp.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_DA7219_MAX98373_MACH) += snd-soc-sof_da7219_max98373.o
+obj-$(CONFIG_SND_SOC_INTEL_EHL_RT5660_MACH) += snd-soc-ehl-rt5660.o
 obj-$(CONFIG_SND_SOC_INTEL_SOUNDWIRE_SOF_MACH) += snd-soc-sof-sdw.o
diff --git a/sound/soc/intel/boards/ehl_rt5660.c b/sound/soc/intel/boards/ehl_rt5660.c
new file mode 100644
index 000000000000..2e3244d5496b
--- /dev/null
+++ b/sound/soc/intel/boards/ehl_rt5660.c
@@ -0,0 +1,323 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020 Intel Corporation
+
+/*
+ * ehl_rt5660 - ASOC Machine driver for Elkhart Lake platforms
+ * with rt5660 codec
+ */
+
+#include <linux/acpi.h>
+#include <sound/core.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/gfp.h>
+#include <sound/jack.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+
+#include "hda_dsp_common.h"
+#include "../../codecs/rt5660.h"
+
+#define DUAL_CHANNEL 2
+#define HDMI_LINK_START 3
+#define HDMI_LINE_END 6
+#define NAME_SIZE	32
+#define IDISP_CODEC_MASK	0x4
+
+struct sof_card_private {
+	struct list_head hdmi_pcm_list;
+	bool idisp_codec;
+};
+
+static const struct snd_kcontrol_new rt5660_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Speaker"),
+	/* There are two MICBIAS in rt5660, each for one MIC */
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic2"),
+	SOC_DAPM_PIN_SWITCH("Line Out"),
+};
+
+static const struct snd_soc_dapm_widget rt5660_widgets[] = {
+	SND_SOC_DAPM_SPK("Speaker", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic2", NULL),
+	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
+	SND_SOC_DAPM_LINE("Line Out", NULL),
+};
+
+static const struct snd_soc_dapm_route rt5660_map[] = {
+	{"Speaker", NULL, "SPO"},
+
+	{"Headset Mic", NULL, "MICBIAS1"},
+	{"Headset Mic2", NULL, "MICBIAS2"},
+
+	{"IN1P", NULL, "Headset Mic"},
+	{"IN2P", NULL, "Headset Mic2"},
+
+	{"Line Out", NULL, "LOUTL"},
+	{"Line Out", NULL, "LOUTR"},
+
+	{"DMic", NULL, "SoC DMIC"},
+};
+
+struct sof_hdmi_pcm {
+	struct list_head head;
+	struct snd_soc_dai *codec_dai;
+	int device;
+};
+
+static int hdmi_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct sof_hdmi_pcm *pcm;
+
+	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
+	if (!pcm)
+		return -ENOMEM;
+
+	/* dai_link id is 1:1 mapped to the PCM device */
+	pcm->device = rtd->dai_link->id;
+	pcm->codec_dai = dai;
+
+	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
+
+	return 0;
+}
+
+static int card_late_probe(struct snd_soc_card *card)
+{
+	struct sof_card_private *ctx = snd_soc_card_get_drvdata(card);
+	struct sof_hdmi_pcm *pcm;
+
+	if (list_empty(&ctx->hdmi_pcm_list))
+		return -ENOENT;
+
+	if (!ctx->idisp_codec)
+		return 0;
+
+	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct sof_hdmi_pcm, head);
+
+	return hda_dsp_hdmi_build_controls(card, pcm->codec_dai->component);
+}
+
+static int rt5660_hw_params(struct snd_pcm_substream *substream,
+			    struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	int ret;
+
+	ret = snd_soc_dai_set_sysclk(codec_dai,
+				     RT5660_SCLK_S_PLL1,
+				     params_rate(params) * 512,
+				     SND_SOC_CLOCK_IN);
+	if (ret < 0) {
+		dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dai_set_pll(codec_dai, 0,
+				  RT5660_PLL1_S_BCLK,
+				  params_rate(params) * 50,
+				  params_rate(params) * 512);
+	if (ret < 0)
+		dev_err(codec_dai->dev, "can't set codec pll: %d\n", ret);
+
+	return ret;
+}
+
+static struct snd_soc_ops rt5660_ops = {
+	.hw_params = rt5660_hw_params,
+};
+
+SND_SOC_DAILINK_DEF(ssp0_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("SSP0 Pin")));
+
+SND_SOC_DAILINK_DEF(rt5660_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC5660:00", "rt5660-aif1")));
+
+SND_SOC_DAILINK_DEF(platform,
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("0000:00:1f.3")));
+
+SND_SOC_DAILINK_DEF(dmic_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("DMIC01 Pin")));
+SND_SOC_DAILINK_DEF(dmic_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec", "dmic-hifi")));
+SND_SOC_DAILINK_DEF(dmic16k,
+	DAILINK_COMP_ARRAY(COMP_CPU("DMIC16k Pin")));
+
+SND_SOC_DAILINK_DEF(idisp1_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("iDisp1 Pin")));
+SND_SOC_DAILINK_DEF(idisp1_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi1")));
+
+SND_SOC_DAILINK_DEF(idisp2_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("iDisp2 Pin")));
+SND_SOC_DAILINK_DEF(idisp2_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi2")));
+
+SND_SOC_DAILINK_DEF(idisp3_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("iDisp3 Pin")));
+SND_SOC_DAILINK_DEF(idisp3_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi3")));
+
+SND_SOC_DAILINK_DEF(idisp4_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("iDisp4 Pin")));
+SND_SOC_DAILINK_DEF(idisp4_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi4")));
+
+static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
+	/* back ends */
+	{
+		.name = "SSP0-Codec",
+		.id = 0,
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.ops = &rt5660_ops,
+		.nonatomic = true,
+		SND_SOC_DAILINK_REG(ssp0_pin, rt5660_codec, platform),
+	},
+	{
+		.name = "dmic48k",
+		.id = 1,
+		.ignore_suspend = 1,
+		.dpcm_capture = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
+	},
+	{
+		.name = "dmic16k",
+		.id = 2,
+		.ignore_suspend = 1,
+		.dpcm_capture = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(dmic16k, dmic_codec, platform),
+	},
+	{
+		.name = "iDisp1",
+		.id = 5,
+		.init = hdmi_init,
+		.dpcm_playback = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
+	},
+	{
+		.name = "iDisp2",
+		.id = 6,
+		.init = hdmi_init,
+		.dpcm_playback = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
+	},
+	{
+		.name = "iDisp3",
+		.id = 7,
+		.init = hdmi_init,
+		.dpcm_playback = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
+	},
+	{
+		.name = "iDisp4",
+		.id = 8,
+		.init = hdmi_init,
+		.dpcm_playback = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(idisp4_pin, idisp4_codec, platform),
+	},
+};
+
+/* SoC card */
+static struct snd_soc_card snd_soc_card_ehl_rt5660 = {
+	.name = "ehl-rt5660",
+	.owner = THIS_MODULE,
+	.dai_link = ehl_rt5660_dailink,
+	.num_links = ARRAY_SIZE(ehl_rt5660_dailink),
+	.dapm_widgets = rt5660_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(rt5660_widgets),
+	.dapm_routes = rt5660_map,
+	.num_dapm_routes = ARRAY_SIZE(rt5660_map),
+	.controls = rt5660_controls,
+	.num_controls = ARRAY_SIZE(rt5660_controls),
+	.fully_routed = true,
+	.late_probe = card_late_probe,
+};
+
+/* If hdmi codec is not supported, switch to use dummy codec */
+static void hdmi_link_init(struct snd_soc_card *card,
+			   struct sof_card_private *ctx,
+			   struct snd_soc_acpi_mach *mach)
+{
+	struct snd_soc_dai_link *link;
+	int i;
+
+	if (mach->mach_params.common_hdmi_codec_drv &&
+	    (mach->mach_params.codec_mask & IDISP_CODEC_MASK)) {
+		ctx->idisp_codec = true;
+		return;
+	}
+
+	/*
+	 * if HDMI is not enabled in kernel config, or
+	 * hdmi codec is not supported
+	 */
+	for (i = HDMI_LINK_START; i <= HDMI_LINE_END; i++) {
+		link = &card->dai_link[i];
+		link->codecs[0].name = "snd-soc-dummy";
+		link->codecs[0].dai_name = "snd-soc-dummy-dai";
+	}
+}
+
+static int snd_ehl_rt5660_probe(struct platform_device *pdev)
+{
+	struct snd_soc_acpi_mach *mach;
+	struct snd_soc_card *card = &snd_soc_card_ehl_rt5660;
+	struct sof_card_private *ctx;
+	int ret;
+
+	card->dev = &pdev->dev;
+
+	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
+	snd_soc_card_set_drvdata(card, ctx);
+
+	mach = pdev->dev.platform_data;
+	ret = snd_soc_fixup_dai_links_platform_name(card,
+						    mach->mach_params.platform);
+	if (ret)
+		return ret;
+
+	hdmi_link_init(card, ctx, mach);
+
+	return devm_snd_soc_register_card(&pdev->dev, card);
+}
+
+static const struct platform_device_id ehl_board_ids[] = {
+	{ .name = "ehl_rt5660" },
+	{ }
+};
+
+static struct platform_driver snd_ehl_rt5660_driver = {
+	.driver = {
+		.name = "ehl_rt5660",
+		.pm = &snd_soc_pm_ops,
+	},
+	.probe = snd_ehl_rt5660_probe,
+	.id_table = ehl_board_ids,
+};
+
+module_platform_driver(snd_ehl_rt5660_driver);
+
+MODULE_DESCRIPTION("ASoC Intel(R) Elkhartlake + rt5660 Machine driver");
+MODULE_AUTHOR("libin.yang@intel.com");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:ehl_rt5660");
diff --git a/sound/soc/intel/common/soc-acpi-intel-ehl-match.c b/sound/soc/intel/common/soc-acpi-intel-ehl-match.c
index a1290c3fa99f..b9ae0e2c959f 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ehl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ehl-match.c
@@ -8,8 +8,15 @@
 
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
+#include "../skylake/skl.h"
 
 struct snd_soc_acpi_mach snd_soc_acpi_intel_ehl_machines[] = {
+	{
+		.id = "INTC1027",
+		.drv_name = "ehl_rt5660",
+		.sof_fw_filename = "sof-ehl.ri",
+		.sof_tplg_filename = "sof-ehl-rt5660.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_ehl_machines);
-- 
2.20.1

