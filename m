Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4EB28464F
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Oct 2020 08:52:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A815A177F;
	Tue,  6 Oct 2020 08:51:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A815A177F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601967151;
	bh=kouBKKCa+Fa8LFf6VjqIPsYz9L/Ac7e98dyKmMgwlsg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I5j6ZHHpw7ky9pIH5JzGYf011htcwFwdYXBd5IZ2vcuwh3xBx8WB1PdHzMbK4QRtM
	 Z/N8XEgA/JSazLQtwqCKdATxjmb3B4TP8N2S7hu6wLcJxaZcPi0tSkPq6VGpdvoP38
	 7+vhRGFtf8i/d1norGGFlMS5iThFs73MCZUOgEjU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0935F802E9;
	Tue,  6 Oct 2020 08:50:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 463E3F802DB; Tue,  6 Oct 2020 08:50:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59198F80255
 for <alsa-devel@alsa-project.org>; Tue,  6 Oct 2020 08:50:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59198F80255
IronPort-SDR: /lATb56thF2YyDS0YWiJOSBfwFjS/u46Wj33fLDG5tgLdn8K0BoPCSEiDPbb+0ZvlJz9pr4g9e
 KUCMkIdyCOQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="249091234"
X-IronPort-AV: E=Sophos;i="5.77,342,1596524400"; d="scan'208";a="249091234"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2020 23:49:58 -0700
IronPort-SDR: b3g1mCw7d0OQIwffsvpZi/zMkNePptrlGmbf/IstQRUcHk9/iPd2/GZSuYH/ZgluaVC2hnu3fy
 8Bqbl3b8bLTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,342,1596524400"; d="scan'208";a="315491099"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 05 Oct 2020 23:49:54 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 03/13] ASoC: Intel: Remove rt5640 support for baytrail
 solution
Date: Tue,  6 Oct 2020 08:48:57 +0200
Message-Id: <20201006064907.16277-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201006064907.16277-1-cezary.rojewski@intel.com>
References: <20201006064907.16277-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@linux.intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com,
 cujomalainey@chromium.org, krzysztof.hejmowski@intel.com,
 ppapierkowski@habana.ai, vamshi.krishna.gopal@intel.com
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

byt-rt5640 is deprecated in favor of bytcr_rt5640 used by
sound/soc/intel/atom and SOF solutions both. Remove redundant machine
board and all related code.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/sound/soc-acpi-intel-match.h          |   1 -
 sound/soc/intel/boards/Kconfig                |  14 --
 sound/soc/intel/boards/Makefile               |   2 -
 sound/soc/intel/boards/byt-rt5640.c           | 224 ------------------
 .../intel/common/soc-acpi-intel-byt-match.c   |  10 -
 5 files changed, 251 deletions(-)
 delete mode 100644 sound/soc/intel/boards/byt-rt5640.c

diff --git a/include/sound/soc-acpi-intel-match.h b/include/sound/soc-acpi-intel-match.h
index ab6f75a86611..5c49e7d78002 100644
--- a/include/sound/soc-acpi-intel-match.h
+++ b/include/sound/soc-acpi-intel-match.h
@@ -16,7 +16,6 @@
  */
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_haswell_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_broadwell_machines[];
-extern struct snd_soc_acpi_mach snd_soc_acpi_intel_baytrail_legacy_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_baytrail_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_cherrytrail_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_skl_machines[];
diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index a8da892441be..c10c37803c67 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -85,20 +85,6 @@ config SND_SOC_INTEL_BROADWELL_MACH
 	  If unsure select "N".
 endif ## SND_SOC_INTEL_CATPT || SND_SOC_SOF_BROADWELL
 
-if SND_SOC_INTEL_BAYTRAIL
-
-config SND_SOC_INTEL_BYT_RT5640_MACH
-	tristate "Baytrail with RT5640 codec"
-	depends on I2C
-	depends on X86_INTEL_LPSS || COMPILE_TEST
-	select SND_SOC_RT5640
-	help
-	  This adds audio driver for Intel Baytrail platform based boards
-	  with the RT5640 audio codec. This driver is deprecated, use
-	  SND_SOC_INTEL_BYTCR_RT5640_MACH instead for better functionality.
-
-endif ## SND_SOC_INTEL_BAYTRAIL
-
 if SND_SST_ATOM_HIFI2_PLATFORM || SND_SOC_SOF_BAYTRAIL
 
 config SND_SOC_INTEL_BYTCR_RT5640_MACH
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index b2e5709a097b..a58e4d22e9c8 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 snd-soc-sst-haswell-objs := haswell.o
-snd-soc-sst-byt-rt5640-mach-objs := byt-rt5640.o
 snd-soc-sst-bdw-rt5650-mach-objs := bdw-rt5650.o
 snd-soc-sst-bdw-rt5677-mach-objs := bdw-rt5677.o
 snd-soc-sst-broadwell-objs := broadwell.o
@@ -42,7 +41,6 @@ snd-soc-sof-sdw-objs += sof_sdw.o				\
 			sof_sdw_dmic.o sof_sdw_hdmi.o hda_dsp_common.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_RT5682_MACH) += snd-soc-sof_rt5682.o
 obj-$(CONFIG_SND_SOC_INTEL_HASWELL_MACH) += snd-soc-sst-haswell.o
-obj-$(CONFIG_SND_SOC_INTEL_BYT_RT5640_MACH) += snd-soc-sst-byt-rt5640-mach.o
 obj-$(CONFIG_SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON) += snd-soc-sst-bxt-da7219_max98357a.o
 obj-$(CONFIG_SND_SOC_INTEL_BXT_RT298_MACH) += snd-soc-sst-bxt-rt298.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_PCM512x_MACH) += snd-soc-sst-sof-pcm512x.o
diff --git a/sound/soc/intel/boards/byt-rt5640.c b/sound/soc/intel/boards/byt-rt5640.c
deleted file mode 100644
index 8851949f38e2..000000000000
--- a/sound/soc/intel/boards/byt-rt5640.c
+++ /dev/null
@@ -1,224 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Intel Baytrail SST RT5640 machine driver
- * Copyright (c) 2014, Intel Corporation.
- */
-
-#include <linux/init.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/acpi.h>
-#include <linux/device.h>
-#include <linux/dmi.h>
-#include <linux/slab.h>
-#include <sound/pcm.h>
-#include <sound/pcm_params.h>
-#include <sound/soc.h>
-#include <sound/jack.h>
-#include "../../codecs/rt5640.h"
-
-#include "../common/sst-dsp.h"
-
-static const struct snd_soc_dapm_widget byt_rt5640_widgets[] = {
-	SND_SOC_DAPM_HP("Headphone", NULL),
-	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-	SND_SOC_DAPM_MIC("Internal Mic", NULL),
-	SND_SOC_DAPM_SPK("Speaker", NULL),
-};
-
-static const struct snd_soc_dapm_route byt_rt5640_audio_map[] = {
-	{"Headset Mic", NULL, "MICBIAS1"},
-	{"IN2P", NULL, "Headset Mic"},
-	{"Headphone", NULL, "HPOL"},
-	{"Headphone", NULL, "HPOR"},
-	{"Speaker", NULL, "SPOLP"},
-	{"Speaker", NULL, "SPOLN"},
-	{"Speaker", NULL, "SPORP"},
-	{"Speaker", NULL, "SPORN"},
-};
-
-static const struct snd_soc_dapm_route byt_rt5640_intmic_dmic1_map[] = {
-	{"DMIC1", NULL, "Internal Mic"},
-};
-
-static const struct snd_soc_dapm_route byt_rt5640_intmic_dmic2_map[] = {
-	{"DMIC2", NULL, "Internal Mic"},
-};
-
-static const struct snd_soc_dapm_route byt_rt5640_intmic_in1_map[] = {
-	{"Internal Mic", NULL, "MICBIAS1"},
-	{"IN1P", NULL, "Internal Mic"},
-};
-
-enum {
-	BYT_RT5640_DMIC1_MAP,
-	BYT_RT5640_DMIC2_MAP,
-	BYT_RT5640_IN1_MAP,
-};
-
-#define BYT_RT5640_MAP(quirk)	((quirk) & 0xff)
-#define BYT_RT5640_DMIC_EN	BIT(16)
-
-static unsigned long byt_rt5640_quirk = BYT_RT5640_DMIC1_MAP |
-					BYT_RT5640_DMIC_EN;
-
-static const struct snd_kcontrol_new byt_rt5640_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Headphone"),
-	SOC_DAPM_PIN_SWITCH("Headset Mic"),
-	SOC_DAPM_PIN_SWITCH("Internal Mic"),
-	SOC_DAPM_PIN_SWITCH("Speaker"),
-};
-
-static int byt_rt5640_hw_params(struct snd_pcm_substream *substream,
-				struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	int ret;
-
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT5640_SCLK_S_PLL1,
-				     params_rate(params) * 256,
-				     SND_SOC_CLOCK_IN);
-	if (ret < 0) {
-		dev_err(codec_dai->dev, "can't set codec clock %d\n", ret);
-		return ret;
-	}
-	ret = snd_soc_dai_set_pll(codec_dai, 0, RT5640_PLL1_S_BCLK1,
-				  params_rate(params) * 64,
-				  params_rate(params) * 256);
-	if (ret < 0) {
-		dev_err(codec_dai->dev, "can't set codec pll: %d\n", ret);
-		return ret;
-	}
-	return 0;
-}
-
-static int byt_rt5640_quirk_cb(const struct dmi_system_id *id)
-{
-	byt_rt5640_quirk = (unsigned long)id->driver_data;
-	return 1;
-}
-
-static const struct dmi_system_id byt_rt5640_quirk_table[] = {
-	{
-		.callback = byt_rt5640_quirk_cb,
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "T100TA"),
-		},
-		.driver_data = (unsigned long *)BYT_RT5640_IN1_MAP,
-	},
-	{
-		.callback = byt_rt5640_quirk_cb,
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "DellInc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Venue 8 Pro 5830"),
-		},
-		.driver_data = (unsigned long *)(BYT_RT5640_DMIC2_MAP |
-						 BYT_RT5640_DMIC_EN),
-	},
-	{}
-};
-
-static int byt_rt5640_init(struct snd_soc_pcm_runtime *runtime)
-{
-	int ret;
-	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
-	struct snd_soc_card *card = runtime->card;
-	const struct snd_soc_dapm_route *custom_map;
-	int num_routes;
-
-	card->dapm.idle_bias_off = true;
-
-	ret = snd_soc_add_card_controls(card, byt_rt5640_controls,
-					ARRAY_SIZE(byt_rt5640_controls));
-	if (ret) {
-		dev_err(card->dev, "unable to add card controls\n");
-		return ret;
-	}
-
-	dmi_check_system(byt_rt5640_quirk_table);
-	switch (BYT_RT5640_MAP(byt_rt5640_quirk)) {
-	case BYT_RT5640_IN1_MAP:
-		custom_map = byt_rt5640_intmic_in1_map;
-		num_routes = ARRAY_SIZE(byt_rt5640_intmic_in1_map);
-		break;
-	case BYT_RT5640_DMIC2_MAP:
-		custom_map = byt_rt5640_intmic_dmic2_map;
-		num_routes = ARRAY_SIZE(byt_rt5640_intmic_dmic2_map);
-		break;
-	default:
-		custom_map = byt_rt5640_intmic_dmic1_map;
-		num_routes = ARRAY_SIZE(byt_rt5640_intmic_dmic1_map);
-	}
-
-	ret = snd_soc_dapm_add_routes(&card->dapm, custom_map, num_routes);
-	if (ret)
-		return ret;
-
-	if (byt_rt5640_quirk & BYT_RT5640_DMIC_EN) {
-		ret = rt5640_dmic_enable(component, 0, 0);
-		if (ret)
-			return ret;
-	}
-
-	snd_soc_dapm_ignore_suspend(&card->dapm, "Headphone");
-	snd_soc_dapm_ignore_suspend(&card->dapm, "Speaker");
-
-	return ret;
-}
-
-static struct snd_soc_ops byt_rt5640_ops = {
-	.hw_params = byt_rt5640_hw_params,
-};
-
-SND_SOC_DAILINK_DEFS(audio,
-	DAILINK_COMP_ARRAY(COMP_CPU("baytrail-pcm-audio")),
-	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC5640:00", "rt5640-aif1")),
-	DAILINK_COMP_ARRAY(COMP_PLATFORM("baytrail-pcm-audio")));
-
-static struct snd_soc_dai_link byt_rt5640_dais[] = {
-	{
-		.name = "Baytrail Audio",
-		.stream_name = "Audio",
-		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			   SND_SOC_DAIFMT_CBS_CFS,
-		.init = byt_rt5640_init,
-		.ops = &byt_rt5640_ops,
-		SND_SOC_DAILINK_REG(audio),
-	},
-};
-
-static struct snd_soc_card byt_rt5640_card = {
-	.name = "byt-rt5640",
-	.owner = THIS_MODULE,
-	.dai_link = byt_rt5640_dais,
-	.num_links = ARRAY_SIZE(byt_rt5640_dais),
-	.dapm_widgets = byt_rt5640_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(byt_rt5640_widgets),
-	.dapm_routes = byt_rt5640_audio_map,
-	.num_dapm_routes = ARRAY_SIZE(byt_rt5640_audio_map),
-	.fully_routed = true,
-};
-
-static int byt_rt5640_probe(struct platform_device *pdev)
-{
-	struct snd_soc_card *card = &byt_rt5640_card;
-
-	card->dev = &pdev->dev;
-	return devm_snd_soc_register_card(&pdev->dev, card);
-}
-
-static struct platform_driver byt_rt5640_audio = {
-	.probe = byt_rt5640_probe,
-	.driver = {
-		.name = "byt-rt5640",
-		.pm = &snd_soc_pm_ops,
-	},
-};
-module_platform_driver(byt_rt5640_audio)
-
-MODULE_DESCRIPTION("ASoC Intel(R) Baytrail Machine driver");
-MODULE_AUTHOR("Omair Md Abdullah, Jarkko Nikula");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:byt-rt5640");
diff --git a/sound/soc/intel/common/soc-acpi-intel-byt-match.c b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
index 4043a1ab44b3..c348607b49a5 100644
--- a/sound/soc/intel/common/soc-acpi-intel-byt-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
@@ -120,16 +120,6 @@ static struct snd_soc_acpi_mach *byt_quirk(void *arg)
 	}
 }
 
-struct snd_soc_acpi_mach snd_soc_acpi_intel_baytrail_legacy_machines[] = {
-	{
-		.id = "10EC5640",
-		.drv_name = "byt-rt5640",
-		.fw_filename = "intel/fw_sst_0f28.bin-48kHz_i2s_master",
-	},
-	{}
-};
-EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_baytrail_legacy_machines);
-
 struct snd_soc_acpi_mach  snd_soc_acpi_intel_baytrail_machines[] = {
 	{
 		.id = "10EC5640",
-- 
2.17.1

