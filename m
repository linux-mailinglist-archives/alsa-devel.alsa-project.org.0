Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4F9282A16
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Oct 2020 12:03:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 035A31889;
	Sun,  4 Oct 2020 12:02:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 035A31889
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601805824;
	bh=f/nfMnDytbgGoQ45tB1+GJl1lKlpQ2IBEoixszzUZNQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s4tO4SP8gn0dleqyyK7Q+i41jjXLdXL7KIVlUekPCyNjhOengK3T3nse3qVme8gN4
	 b00GZFfMlxeLXq5o7gJDPuCRjCB7H1/6YUezbXc2QvCEvHzwJ6i1QP7Rt+SXXH6ODk
	 caJWPaMHUQmGwH8aMDUB5mw6jYIhB2EQO3i8JAgs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03BDFF802A0;
	Sun,  4 Oct 2020 12:02:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAEE4F80268; Sun,  4 Oct 2020 12:01:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2FAEF80246
 for <alsa-devel@alsa-project.org>; Sun,  4 Oct 2020 12:01:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2FAEF80246
IronPort-SDR: Xr22WyzItqrDOXdbJVwkRZ4CbDfrUoC7RcaHD6Cp3sHxgnbn59HW0IuXvCe/JvT+ozpGckZn6y
 NDtD2qLrtSZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9763"; a="150905748"
X-IronPort-AV: E=Sophos;i="5.77,335,1596524400"; d="scan'208";a="150905748"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2020 03:01:46 -0700
IronPort-SDR: BdEpJhvtqmsirI3WnJwBuAfiC5M8CcYkH+2VuEDGeyUTPU2OgS6bx66gqqpu4eVHqg1KSzuZPp
 ydDtDNqoQ9Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,335,1596524400"; d="scan'208";a="340527845"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 04 Oct 2020 03:01:42 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/13] ASoC: Intel: Remove max98090 support for baytrail
 solution
Date: Sun,  4 Oct 2020 12:01:17 +0200
Message-Id: <20201004100128.5842-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201004100128.5842-1-cezary.rojewski@intel.com>
References: <20201004100128.5842-1-cezary.rojewski@intel.com>
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

byt-max98090 is deprecated in favor of cht-bsw-max98090 used by
sound/soc/intel/atom and SOF solutions both. Remove redundant machine
board and all related code.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/boards/Kconfig                |  11 --
 sound/soc/intel/boards/Makefile               |   2 -
 sound/soc/intel/boards/byt-max98090.c         | 182 ------------------
 .../intel/common/soc-acpi-intel-byt-match.c   |   5 -
 4 files changed, 200 deletions(-)
 delete mode 100644 sound/soc/intel/boards/byt-max98090.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 6afdd9ac4478..a8da892441be 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -87,17 +87,6 @@ endif ## SND_SOC_INTEL_CATPT || SND_SOC_SOF_BROADWELL
 
 if SND_SOC_INTEL_BAYTRAIL
 
-config SND_SOC_INTEL_BYT_MAX98090_MACH
-	tristate "Baytrail with MAX98090 codec"
-	depends on I2C
-	depends on X86_INTEL_LPSS || COMPILE_TEST
-	select SND_SOC_MAX98090
-	help
-	  This adds audio driver for Intel Baytrail platform based boards
-	  with the MAX98090 audio codec. This driver is deprecated, use
-	  SND_SOC_INTEL_CHT_BSW_MAX98090_TI_MACH instead for better
-	  functionality.
-
 config SND_SOC_INTEL_BYT_RT5640_MACH
 	tristate "Baytrail with RT5640 codec"
 	depends on I2C
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index de7cc9b86354..b2e5709a097b 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 snd-soc-sst-haswell-objs := haswell.o
 snd-soc-sst-byt-rt5640-mach-objs := byt-rt5640.o
-snd-soc-sst-byt-max98090-mach-objs := byt-max98090.o
 snd-soc-sst-bdw-rt5650-mach-objs := bdw-rt5650.o
 snd-soc-sst-bdw-rt5677-mach-objs := bdw-rt5677.o
 snd-soc-sst-broadwell-objs := broadwell.o
@@ -44,7 +43,6 @@ snd-soc-sof-sdw-objs += sof_sdw.o				\
 obj-$(CONFIG_SND_SOC_INTEL_SOF_RT5682_MACH) += snd-soc-sof_rt5682.o
 obj-$(CONFIG_SND_SOC_INTEL_HASWELL_MACH) += snd-soc-sst-haswell.o
 obj-$(CONFIG_SND_SOC_INTEL_BYT_RT5640_MACH) += snd-soc-sst-byt-rt5640-mach.o
-obj-$(CONFIG_SND_SOC_INTEL_BYT_MAX98090_MACH) += snd-soc-sst-byt-max98090-mach.o
 obj-$(CONFIG_SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON) += snd-soc-sst-bxt-da7219_max98357a.o
 obj-$(CONFIG_SND_SOC_INTEL_BXT_RT298_MACH) += snd-soc-sst-bxt-rt298.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_PCM512x_MACH) += snd-soc-sst-sof-pcm512x.o
diff --git a/sound/soc/intel/boards/byt-max98090.c b/sound/soc/intel/boards/byt-max98090.c
deleted file mode 100644
index f5097da28828..000000000000
--- a/sound/soc/intel/boards/byt-max98090.c
+++ /dev/null
@@ -1,182 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Intel Baytrail SST MAX98090 machine driver
- * Copyright (c) 2014, Intel Corporation.
- */
-
-#include <linux/init.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/acpi.h>
-#include <linux/device.h>
-#include <linux/gpio.h>
-#include <linux/gpio/consumer.h>
-#include <linux/slab.h>
-#include <sound/pcm.h>
-#include <sound/pcm_params.h>
-#include <sound/soc.h>
-#include <sound/jack.h>
-#include "../../codecs/max98090.h"
-
-struct byt_max98090_private {
-	struct snd_soc_jack jack;
-};
-
-static const struct snd_soc_dapm_widget byt_max98090_widgets[] = {
-	SND_SOC_DAPM_HP("Headphone", NULL),
-	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-	SND_SOC_DAPM_MIC("Int Mic", NULL),
-	SND_SOC_DAPM_SPK("Ext Spk", NULL),
-};
-
-static const struct snd_soc_dapm_route byt_max98090_audio_map[] = {
-	{"IN34", NULL, "Headset Mic"},
-	{"Headset Mic", NULL, "MICBIAS"},
-	{"DMICL", NULL, "Int Mic"},
-	{"Headphone", NULL, "HPL"},
-	{"Headphone", NULL, "HPR"},
-	{"Ext Spk", NULL, "SPKL"},
-	{"Ext Spk", NULL, "SPKR"},
-};
-
-static const struct snd_kcontrol_new byt_max98090_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Headphone"),
-	SOC_DAPM_PIN_SWITCH("Headset Mic"),
-	SOC_DAPM_PIN_SWITCH("Int Mic"),
-	SOC_DAPM_PIN_SWITCH("Ext Spk"),
-};
-
-static struct snd_soc_jack_pin hs_jack_pins[] = {
-	{
-		.pin	= "Headphone",
-		.mask	= SND_JACK_HEADPHONE,
-	},
-	{
-		.pin	= "Headset Mic",
-		.mask	= SND_JACK_MICROPHONE,
-	},
-};
-
-static struct snd_soc_jack_gpio hs_jack_gpios[] = {
-	{
-		.name		= "hp",
-		.report		= SND_JACK_HEADPHONE | SND_JACK_LINEOUT,
-		.debounce_time	= 200,
-	},
-	{
-		.name		= "mic",
-		.invert		= 1,
-		.report		= SND_JACK_MICROPHONE,
-		.debounce_time	= 200,
-	},
-};
-
-static const struct acpi_gpio_params hp_gpios = { 0, 0, false };
-static const struct acpi_gpio_params mic_gpios = { 1, 0, false };
-
-static const struct acpi_gpio_mapping acpi_byt_max98090_gpios[] = {
-	{ "hp-gpios", &hp_gpios, 1 },
-	{ "mic-gpios", &mic_gpios, 1 },
-	{},
-};
-
-static int byt_max98090_init(struct snd_soc_pcm_runtime *runtime)
-{
-	int ret;
-	struct snd_soc_card *card = runtime->card;
-	struct byt_max98090_private *drv = snd_soc_card_get_drvdata(card);
-	struct snd_soc_jack *jack = &drv->jack;
-
-	card->dapm.idle_bias_off = true;
-
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(runtime, 0),
-				     M98090_REG_SYSTEM_CLOCK,
-				     25000000, SND_SOC_CLOCK_IN);
-	if (ret < 0) {
-		dev_err(card->dev, "Can't set codec clock %d\n", ret);
-		return ret;
-	}
-
-	/* Enable jack detection */
-	ret = snd_soc_card_jack_new(runtime->card, "Headset",
-				    SND_JACK_LINEOUT | SND_JACK_HEADSET, jack,
-				    hs_jack_pins, ARRAY_SIZE(hs_jack_pins));
-	if (ret)
-		return ret;
-
-	return snd_soc_jack_add_gpiods(card->dev->parent, jack,
-				       ARRAY_SIZE(hs_jack_gpios),
-				       hs_jack_gpios);
-}
-
-SND_SOC_DAILINK_DEFS(baytrail,
-	DAILINK_COMP_ARRAY(COMP_CPU("baytrail-pcm-audio")),
-	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-193C9890:00", "HiFi")),
-	DAILINK_COMP_ARRAY(COMP_PLATFORM("baytrail-pcm-audio")));
-
-static struct snd_soc_dai_link byt_max98090_dais[] = {
-	{
-		.name = "Baytrail Audio",
-		.stream_name = "Audio",
-		.init = byt_max98090_init,
-		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			   SND_SOC_DAIFMT_CBS_CFS,
-		SND_SOC_DAILINK_REG(baytrail),
-	},
-};
-
-static struct snd_soc_card byt_max98090_card = {
-	.name = "byt-max98090",
-	.owner = THIS_MODULE,
-	.dai_link = byt_max98090_dais,
-	.num_links = ARRAY_SIZE(byt_max98090_dais),
-	.dapm_widgets = byt_max98090_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(byt_max98090_widgets),
-	.dapm_routes = byt_max98090_audio_map,
-	.num_dapm_routes = ARRAY_SIZE(byt_max98090_audio_map),
-	.controls = byt_max98090_controls,
-	.num_controls = ARRAY_SIZE(byt_max98090_controls),
-	.fully_routed = true,
-};
-
-static int byt_max98090_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct byt_max98090_private *priv;
-	int ret_val;
-
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv) {
-		dev_err(&pdev->dev, "allocation failed\n");
-		return -ENOMEM;
-	}
-
-	ret_val = devm_acpi_dev_add_driver_gpios(dev->parent, acpi_byt_max98090_gpios);
-	if (ret_val)
-		dev_dbg(dev, "Unable to add GPIO mapping table\n");
-
-	byt_max98090_card.dev = &pdev->dev;
-	snd_soc_card_set_drvdata(&byt_max98090_card, priv);
-	ret_val = devm_snd_soc_register_card(&pdev->dev, &byt_max98090_card);
-	if (ret_val) {
-		dev_err(&pdev->dev,
-			"snd_soc_register_card failed %d\n", ret_val);
-		return ret_val;
-	}
-
-	return 0;
-}
-
-static struct platform_driver byt_max98090_driver = {
-	.probe = byt_max98090_probe,
-	.driver = {
-		.name = "byt-max98090",
-		.pm = &snd_soc_pm_ops,
-	},
-};
-module_platform_driver(byt_max98090_driver)
-
-MODULE_DESCRIPTION("ASoC Intel(R) Baytrail Machine driver");
-MODULE_AUTHOR("Omair Md Abdullah, Jarkko Nikula");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:byt-max98090");
diff --git a/sound/soc/intel/common/soc-acpi-intel-byt-match.c b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
index 1cc801ba92eb..4043a1ab44b3 100644
--- a/sound/soc/intel/common/soc-acpi-intel-byt-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
@@ -126,11 +126,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_baytrail_legacy_machines[] = {
 		.drv_name = "byt-rt5640",
 		.fw_filename = "intel/fw_sst_0f28.bin-48kHz_i2s_master",
 	},
-	{
-		.id = "193C9890",
-		.drv_name = "byt-max98090",
-		.fw_filename = "intel/fw_sst_0f28.bin-48kHz_i2s_master",
-	},
 	{}
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_baytrail_legacy_machines);
-- 
2.17.1

