Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB503511355
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 10:12:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 639CB17A2;
	Wed, 27 Apr 2022 10:11:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 639CB17A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651047155;
	bh=sKaK1xgwQ90Lr5wLei68Sh2VFn5Y4VXvUQ0T4pte7Ew=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pgerUretFAcTkn3Faax1G9/klJUYO+8sYradp7+WVPLOTjOhpdR1TdMHFnrQ3iye0
	 31rS8tDJSeXmA2Bgfg/tUzTRosbzJqlmlcTnIoI9MPB7ArVjpZ/zru8ljfsZauhq6o
	 brSr260RUZjytSNEg0GbAAnxKq/GuFXmFuqeXMBE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5121F80551;
	Wed, 27 Apr 2022 10:09:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EB45F8053C; Wed, 27 Apr 2022 10:09:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B4C2F80534
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 10:09:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B4C2F80534
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cJnL54Ya"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651046983; x=1682582983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sKaK1xgwQ90Lr5wLei68Sh2VFn5Y4VXvUQ0T4pte7Ew=;
 b=cJnL54YamOObTetIrWZNuyBcxWFY44Y4NwuvGQq6ojdePI+znS8IKqi+
 tH4vUKgQjZPxbG0PEEt1VviB7x7jTZRm/b9hXe++AFGywZYm3P46RL3FK
 rjgmOrmZwd8LmQrVEwFAt3RzwO1B4rvFE6UIeMiYi6UoJzB9Diwa4AbxH
 1Ws1hVNq11aD8g7KAD3jlUnGOKyxOP5+A/c7UcEc9tvv9UwnCi8jF0OYv
 6b/EE+j5hB1ku/hehkOo7Hq9P8Uza4eJHSpF83iMj4LfUAT1DN5Nh9owJ
 b/TGQ/CzjFxvWgvv/XcJBCsJBZXLbvwvF8YMt412WVZG4kJtgLkn9aPdk Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="291006294"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="291006294"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 01:09:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="705437576"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 27 Apr 2022 01:09:31 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 11/14] ASoC: Intel: avs: Add ssm4567 machine board
Date: Wed, 27 Apr 2022 10:18:59 +0200
Message-Id: <20220427081902.3525183-12-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427081902.3525183-1-cezary.rojewski@intel.com>
References: <20220427081902.3525183-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

To support AVS-ssm4567 configuration add machine board connecting AVS
platform component driver with ssm4567 codec one.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/Kconfig   |  11 ++
 sound/soc/intel/avs/boards/Makefile  |   2 +
 sound/soc/intel/avs/boards/ssm4567.c | 270 +++++++++++++++++++++++++++
 3 files changed, 283 insertions(+)
 create mode 100644 sound/soc/intel/avs/boards/ssm4567.c

diff --git a/sound/soc/intel/avs/boards/Kconfig b/sound/soc/intel/avs/boards/Kconfig
index f9ecee648830..8af85953adac 100644
--- a/sound/soc/intel/avs/boards/Kconfig
+++ b/sound/soc/intel/avs/boards/Kconfig
@@ -71,6 +71,17 @@ config SND_SOC_INTEL_AVS_MACH_RT5682
 	   Say Y or m if you have such a device. This is a recommended option.
 	   If unsure select "N".
 
+config SND_SOC_INTEL_AVS_MACH_SSM4567
+	tristate "ssm4567 I2S board"
+	depends on I2C
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	select SND_SOC_SSM4567
+	help
+	   This adds support for ASoC machine driver with SSM4567 I2S audio codec.
+	   It is meant to be used with AVS driver.
+	   Say Y or m if you have such a device. This is a recommended option.
+	   If unsure select "N".
+
 config SND_SOC_INTEL_AVS_MACH_SSP_TEST
 	tristate "SSP test board"
 	help
diff --git a/sound/soc/intel/avs/boards/Makefile b/sound/soc/intel/avs/boards/Makefile
index ece733a96c1e..30d0eac6c22a 100644
--- a/sound/soc/intel/avs/boards/Makefile
+++ b/sound/soc/intel/avs/boards/Makefile
@@ -7,6 +7,7 @@ snd-soc-avs-rt274-objs := rt274.o
 snd-soc-avs-rt286-objs := rt286.o
 snd-soc-avs-rt298-objs := rt298.o
 snd-soc-avs-rt5682-objs := rt5682.o
+snd-soc-avs-ssm4567-objs := ssm4567.o
 snd-soc-avs-ssp-test-objs := ssp_test.o
 
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_DMIC) += snd-soc-avs-dmic.o
@@ -16,4 +17,5 @@ obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT274) += snd-soc-avs-rt274.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT286) += snd-soc-avs-rt286.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT298) += snd-soc-avs-rt298.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT5682) += snd-soc-avs-rt5682.o
+obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_SSM4567) += snd-soc-avs-ssm4567.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_SSP_TEST) += snd-soc-avs-ssp-test.o
diff --git a/sound/soc/intel/avs/boards/ssm4567.c b/sound/soc/intel/avs/boards/ssm4567.c
new file mode 100644
index 000000000000..d17f36701bc3
--- /dev/null
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -0,0 +1,270 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include "../../../codecs/nau8825.h"
+
+#define SKL_NUVOTON_CODEC_DAI	"nau8825-hifi"
+#define SKL_SSM_CODEC_DAI	"ssm4567-hifi"
+
+static struct snd_soc_codec_conf card_codec_conf[] = {
+	{
+		.dlc = COMP_CODEC_CONF("i2c-INT343B:00"),
+		.name_prefix = "Left",
+	},
+	{
+		.dlc = COMP_CODEC_CONF("i2c-INT343B:01"),
+		.name_prefix = "Right",
+	},
+};
+
+static const struct snd_kcontrol_new card_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Left Speaker"),
+	SOC_DAPM_PIN_SWITCH("Right Speaker"),
+};
+
+static int
+platform_clock_control(struct snd_soc_dapm_widget *w, struct snd_kcontrol *control, int event)
+{
+	struct snd_soc_dapm_context *dapm = w->dapm;
+	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_dai *codec_dai;
+	int ret;
+
+	codec_dai = snd_soc_card_get_codec_dai(card, SKL_NUVOTON_CODEC_DAI);
+	if (!codec_dai) {
+		dev_err(card->dev, "Codec dai not found\n");
+		return -EINVAL;
+	}
+
+	if (SND_SOC_DAPM_EVENT_ON(event)) {
+		ret = snd_soc_dai_set_sysclk(codec_dai, NAU8825_CLK_MCLK, 24000000,
+					     SND_SOC_CLOCK_IN);
+		if (ret < 0)
+			dev_err(card->dev, "set sysclk err = %d\n", ret);
+	} else {
+		ret = snd_soc_dai_set_sysclk(codec_dai, NAU8825_CLK_INTERNAL, 0, SND_SOC_CLOCK_IN);
+		if (ret < 0)
+			dev_err(card->dev, "set sysclk err = %d\n", ret);
+	}
+
+	return ret;
+}
+
+static const struct snd_soc_dapm_widget card_widgets[] = {
+	SND_SOC_DAPM_SPK("Left Speaker", NULL),
+	SND_SOC_DAPM_SPK("Right Speaker", NULL),
+	SND_SOC_DAPM_SPK("DP1", NULL),
+	SND_SOC_DAPM_SPK("DP2", NULL),
+	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0, platform_clock_control,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+};
+
+static const struct snd_soc_dapm_route card_base_routes[] = {
+	{"Left Speaker", NULL, "Left OUT"},
+	{"Right Speaker", NULL, "Right OUT"},
+};
+
+static int avs_ssm4567_codec_init(struct snd_soc_pcm_runtime *runtime)
+{
+	int ret;
+
+	/* Slot 1 for left */
+	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_codec(runtime, 0), 0x01, 0x01, 2, 48);
+	if (ret < 0)
+		return ret;
+
+	/* Slot 2 for right */
+	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_codec(runtime, 1), 0x02, 0x02, 2, 48);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int
+avs_ssm4567_be_fixup(struct snd_soc_pcm_runtime *runrime, struct snd_pcm_hw_params *params)
+{
+	struct snd_interval *rate, *channels;
+	struct snd_mask *fmt;
+
+	rate = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
+	channels = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
+	fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+
+	/* The ADSP will covert the FE rate to 48k, stereo */
+	rate->min = rate->max = 48000;
+	channels->min = channels->max = 2;
+
+	/* set SSP0 to 24 bit */
+	snd_mask_none(fmt);
+	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
+	return 0;
+}
+
+static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
+			       struct snd_soc_dai_link **dai_link)
+{
+	struct snd_soc_dai_link_component *platform;
+	struct snd_soc_dai_link *dl;
+
+	dl = devm_kzalloc(dev, sizeof(*dl), GFP_KERNEL);
+	platform = devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
+	if (!dl || !platform)
+		return -ENOMEM;
+
+	platform->name = platform_name;
+
+	dl->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", ssp_port);
+	dl->cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
+	dl->codecs = devm_kzalloc(dev, sizeof(*dl->codecs) * 2, GFP_KERNEL);
+	if (!dl->name || !dl->cpus || !dl->codecs)
+		return -ENOMEM;
+
+	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", ssp_port);
+	dl->codecs[0].name = devm_kasprintf(dev, GFP_KERNEL, "i2c-INT343B:00");
+	dl->codecs[0].dai_name = devm_kasprintf(dev, GFP_KERNEL, "ssm4567-hifi");
+	dl->codecs[1].name = devm_kasprintf(dev, GFP_KERNEL, "i2c-INT343B:01");
+	dl->codecs[1].dai_name = devm_kasprintf(dev, GFP_KERNEL, "ssm4567-hifi");
+	if (!dl->cpus->dai_name || !dl->codecs[0].name || !dl->codecs[0].dai_name ||
+	    !dl->codecs[1].name || !dl->codecs[1].dai_name)
+		return -ENOMEM;
+
+	dl->num_cpus = 1;
+	dl->num_codecs = 2;
+	dl->platforms = platform;
+	dl->num_platforms = 1;
+	dl->id = 0;
+	dl->dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_CBS_CFS;
+	dl->init = avs_ssm4567_codec_init;
+	dl->be_hw_params_fixup = avs_ssm4567_be_fixup;
+	dl->nonatomic = 1;
+	dl->no_pcm = 1;
+	dl->dpcm_capture = 1;
+	dl->dpcm_playback = 1;
+	dl->ignore_pmdown_time = 1;
+
+	*dai_link = dl;
+
+	return 0;
+}
+
+static int avs_create_dapm_routes(struct device *dev, int ssp_port,
+				  struct snd_soc_dapm_route **routes, int *num_routes)
+{
+	struct snd_soc_dapm_route *dr;
+	const int num_base = ARRAY_SIZE(card_base_routes);
+	const int num_dr = num_base + 4;
+	int idx;
+
+	dr = devm_kcalloc(dev, num_dr, sizeof(*dr), GFP_KERNEL);
+	if (!dr)
+		return -ENOMEM;
+
+	memcpy(dr, card_base_routes, num_base * sizeof(*dr));
+
+	idx = num_base;
+	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "Left Playback");
+	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Tx", ssp_port);
+	if (!dr[idx].sink || !dr[idx].source)
+		return -ENOMEM;
+
+	idx++;
+	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "Right Playback");
+	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Tx", ssp_port);
+	if (!dr[idx].sink || !dr[idx].source)
+		return -ENOMEM;
+
+	idx++;
+	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Rx", ssp_port);
+	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "Left Capture Sense");
+	if (!dr[idx].sink || !dr[idx].source)
+		return -ENOMEM;
+
+	idx++;
+	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Rx", ssp_port);
+	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "Right Capture Sense");
+	if (!dr[idx].sink || !dr[idx].source)
+		return -ENOMEM;
+
+	*routes = dr;
+	*num_routes = num_dr;
+
+	return 0;
+}
+
+static int avs_ssm4567_probe(struct platform_device *pdev)
+{
+	struct snd_soc_dapm_route *routes;
+	struct snd_soc_dai_link *dai_link;
+	struct snd_soc_acpi_mach *mach;
+	struct snd_soc_card *card;
+	struct device *dev = &pdev->dev;
+	const char *pname;
+	int ret, num_routes;
+
+	mach = dev_get_platdata(dev);
+	pname = mach->mach_params.platform;
+
+	ret = avs_create_dai_link(dev, pname, __ffs(mach->link_mask), &dai_link);
+	if (ret) {
+		dev_err(dev, "Failed to create dai link: %d", ret);
+		return ret;
+	}
+
+	ret = avs_create_dapm_routes(dev, __ffs(mach->link_mask), &routes, &num_routes);
+	if (ret) {
+		dev_err(dev, "Failed to create dapm routes: %d", ret);
+		return ret;
+	}
+
+	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
+	if (!card)
+		return -ENOMEM;
+
+	card->name = "avs_ssm4567-adi";
+	card->dev = dev;
+	card->owner = THIS_MODULE;
+	card->dai_link = dai_link;
+	card->num_links = 1;
+	card->codec_conf = card_codec_conf;
+	card->num_configs = ARRAY_SIZE(card_codec_conf);
+	card->controls = card_controls;
+	card->num_controls = ARRAY_SIZE(card_controls);
+	card->dapm_widgets = card_widgets;
+	card->num_dapm_widgets = ARRAY_SIZE(card_widgets);
+	card->dapm_routes = routes;
+	card->num_dapm_routes = num_routes;
+	card->fully_routed = true;
+	card->disable_route_checks = true;
+
+	ret = snd_soc_fixup_dai_links_platform_name(card, pname);
+	if (ret)
+		return ret;
+
+	return devm_snd_soc_register_card(dev, card);
+}
+
+static struct platform_driver avs_ssm4567_driver = {
+	.probe = avs_ssm4567_probe,
+	.driver = {
+		.name = "avs_ssm4567",
+		.pm = &snd_soc_pm_ops,
+	},
+};
+
+module_platform_driver(avs_ssm4567_driver)
+
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:avs_ssm4567");
-- 
2.25.1

