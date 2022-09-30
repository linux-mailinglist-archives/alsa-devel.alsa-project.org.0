Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8FF5F0BE9
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 14:46:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8132F169D;
	Fri, 30 Sep 2022 14:45:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8132F169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664542009;
	bh=2UxfJFUCOwBLaxIJ8l/OW411fsXfoz0Cejue2oFAA/M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H2GJzeS2hVXwVmhwM1ThbUQZClvlVB5y9HSKZ0QTVTfHOrWti6Jpnnmq9LIwxZUZx
	 gO62YdkMb5vBgLnbRKGZmFmGGSzsVQmxEO8uUVopxD18sO4K5gz8P5R6wvQ0kh++ch
	 357owZ+2mkMUf338yk2cjinnOsDQSx4QE2ledCqQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D4B1F804E5;
	Fri, 30 Sep 2022 14:45:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A2E6F804D8; Fri, 30 Sep 2022 14:45:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72BE3F80153
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 14:45:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72BE3F80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="C5nkn3JK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664541923; x=1696077923;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2UxfJFUCOwBLaxIJ8l/OW411fsXfoz0Cejue2oFAA/M=;
 b=C5nkn3JKktmTNKSlEqkEYjr200ktCN0biJbhkOEoRHQnT4o713eXiopm
 9iUmBgpP/hP1ql+vUlaNmQETIlF8wPN4nXAzJZziEEdRfUVO4Y0Mr6h0A
 iAn/enfFEFPjdQhQr15kKLLkdALLNjhrEHapKL4iQGH7d7t0PKPkgagu0
 GvJX5ay8nYlhf3SNKS6UzoZ0RMakxdUdqyDPAVqb2tvXshso9Eij8ggOl
 LSsOj9Xx4Bw9l82FBjG+yDhD00yzzTeb83eJ7R9Iom2SV4Hc2+Ia9+anh
 m1esa5MXNlzrgDfIrcY+Qlg6Sb6I8HXanZ7u3Bh/KZY9/NfLeT+AtrGsZ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="303667488"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="303667488"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 05:44:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="748219009"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="748219009"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga004.jf.intel.com with ESMTP; 30 Sep 2022 05:44:55 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: Intel: avs: Add max98927 machine board
Date: Fri, 30 Sep 2022 14:45:37 +0200
Message-Id: <20220930124538.354992-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220930124538.354992-1-amadeuszx.slawinski@linux.intel.com>
References: <20220930124538.354992-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

To support AVS-max98927 configuration add machine board connecting AVS
platform component driver with max98927 codec one.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/Kconfig    |  10 ++
 sound/soc/intel/avs/boards/Makefile   |   2 +
 sound/soc/intel/avs/boards/max98927.c | 236 ++++++++++++++++++++++++++
 3 files changed, 248 insertions(+)
 create mode 100644 sound/soc/intel/avs/boards/max98927.c

diff --git a/sound/soc/intel/avs/boards/Kconfig b/sound/soc/intel/avs/boards/Kconfig
index 4d68e3ef992b..9bd40fdd9028 100644
--- a/sound/soc/intel/avs/boards/Kconfig
+++ b/sound/soc/intel/avs/boards/Kconfig
@@ -36,6 +36,16 @@ config SND_SOC_INTEL_AVS_MACH_I2S_TEST
 	   This adds support for I2S test-board which can be used to verify
 	   transfer over I2S interface with SSP loopback scenarios.
 
+config SND_SOC_INTEL_AVS_MACH_MAX98927
+	tristate "max98927 I2S board"
+	depends on I2C
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	select SND_SOC_MAX98927
+	help
+	  This adds support for AVS with MAX98927 I2S codec configuration.
+	  Say Y or m if you have such a device. This is a recommended option.
+	  If unsure select "N".
+
 config SND_SOC_INTEL_AVS_MACH_MAX98357A
 	tristate "max98357A I2S board"
 	depends on I2C
diff --git a/sound/soc/intel/avs/boards/Makefile b/sound/soc/intel/avs/boards/Makefile
index bc75376d58c2..4d70b8d09ce5 100644
--- a/sound/soc/intel/avs/boards/Makefile
+++ b/sound/soc/intel/avs/boards/Makefile
@@ -4,6 +4,7 @@ snd-soc-avs-da7219-objs := da7219.o
 snd-soc-avs-dmic-objs := dmic.o
 snd-soc-avs-hdaudio-objs := hdaudio.o
 snd-soc-avs-i2s-test-objs := i2s_test.o
+snd-soc-avs-max98927-objs := max98927.o
 snd-soc-avs-max98357a-objs := max98357a.o
 snd-soc-avs-max98373-objs := max98373.o
 snd-soc-avs-nau8825-objs := nau8825.o
@@ -17,6 +18,7 @@ obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_DA7219) += snd-soc-avs-da7219.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_DMIC) += snd-soc-avs-dmic.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_HDAUDIO) += snd-soc-avs-hdaudio.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_I2S_TEST) += snd-soc-avs-i2s-test.o
+obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_MAX98927) += snd-soc-avs-max98927.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_MAX98357A) += snd-soc-avs-max98357a.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_MAX98373) += snd-soc-avs-max98373.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_NAU8825) += snd-soc-avs-nau8825.o
diff --git a/sound/soc/intel/avs/boards/max98927.c b/sound/soc/intel/avs/boards/max98927.c
new file mode 100644
index 000000000000..35c4f8f55035
--- /dev/null
+++ b/sound/soc/intel/avs/boards/max98927.c
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2022 Intel Corporation. All rights reserved.
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-dapm.h>
+
+#define MAX98927_DEV0_NAME	"i2c-MX98927:00"
+#define MAX98927_DEV1_NAME	"i2c-MX98927:01"
+#define MAX98927_CODEC_NAME	"max98927-aif1"
+
+static struct snd_soc_codec_conf card_codec_conf[] = {
+	{
+		.dlc = COMP_CODEC_CONF(MAX98927_DEV0_NAME),
+		.name_prefix = "Right",
+	},
+	{
+		.dlc = COMP_CODEC_CONF(MAX98927_DEV1_NAME),
+		.name_prefix = "Left",
+	},
+};
+
+static const struct snd_kcontrol_new card_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Left Spk"),
+	SOC_DAPM_PIN_SWITCH("Right Spk"),
+};
+
+static const struct snd_soc_dapm_widget card_widgets[] = {
+	SND_SOC_DAPM_SPK("Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Right Spk", NULL),
+};
+
+static const struct snd_soc_dapm_route card_base_routes[] = {
+	{ "Left Spk", NULL, "Left BE_OUT" },
+	{ "Right Spk", NULL, "Right BE_OUT" },
+};
+
+static int
+avs_max98927_be_fixup(struct snd_soc_pcm_runtime *runrime, struct snd_pcm_hw_params *params)
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
+	/* set SSP0 to 16 bit */
+	snd_mask_none(fmt);
+	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
+	return 0;
+}
+
+static int avs_max98927_hw_params(struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai;
+	int ret = 0;
+	int i;
+
+	for_each_rtd_codec_dais(runtime, i, codec_dai) {
+		if (!strcmp(codec_dai->component->name, MAX98927_DEV0_NAME))
+			ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x30, 3, 8, 16);
+		else if (!strcmp(codec_dai->component->name, MAX98927_DEV1_NAME))
+			ret = snd_soc_dai_set_tdm_slot(codec_dai, 0xC0, 3, 8, 16);
+
+		if (ret < 0) {
+			dev_err(runtime->dev, "hw_params for %s failed: %d\n",
+				codec_dai->component->name, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_ops avs_max98927_ops = {
+	.hw_params = avs_max98927_hw_params,
+};
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
+	dl->codecs[0].name = devm_kasprintf(dev, GFP_KERNEL, MAX98927_DEV0_NAME);
+	dl->codecs[0].dai_name = devm_kasprintf(dev, GFP_KERNEL, MAX98927_CODEC_NAME);
+	dl->codecs[1].name = devm_kasprintf(dev, GFP_KERNEL, MAX98927_DEV1_NAME);
+	dl->codecs[1].dai_name = devm_kasprintf(dev, GFP_KERNEL, MAX98927_CODEC_NAME);
+	if (!dl->cpus->dai_name || !dl->codecs[0].name || !dl->codecs[0].dai_name ||
+	    !dl->codecs[1].name || !dl->codecs[1].dai_name)
+		return -ENOMEM;
+
+	dl->num_cpus = 1;
+	dl->num_codecs = 2;
+	dl->platforms = platform;
+	dl->num_platforms = 1;
+	dl->id = 0;
+	dl->dai_fmt = SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS;
+	dl->be_hw_params_fixup = avs_max98927_be_fixup;
+	dl->nonatomic = 1;
+	dl->no_pcm = 1;
+	dl->dpcm_capture = 1;
+	dl->dpcm_playback = 1;
+	dl->ignore_pmdown_time = 1;
+	dl->ops = &avs_max98927_ops;
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
+	const int num_dr = num_base + 2;
+	int idx;
+
+	dr = devm_kcalloc(dev, num_dr, sizeof(*dr), GFP_KERNEL);
+	if (!dr)
+		return -ENOMEM;
+
+	memcpy(dr, card_base_routes, num_base * sizeof(*dr));
+
+	idx = num_base;
+	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "Left HiFi Playback");
+	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Tx", ssp_port);
+	if (!dr[idx].sink || !dr[idx].source)
+		return -ENOMEM;
+
+	idx++;
+	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "Right HiFi Playback");
+	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Tx", ssp_port);
+	if (!dr[idx].sink || !dr[idx].source)
+		return -ENOMEM;
+
+	*routes = dr;
+	*num_routes = num_dr;
+
+	return 0;
+}
+
+static int avs_max98927_probe(struct platform_device *pdev)
+{
+	struct snd_soc_dapm_route *routes;
+	struct snd_soc_dai_link *dai_link;
+	struct snd_soc_acpi_mach *mach;
+	struct snd_soc_card *card;
+	struct device *dev = &pdev->dev;
+	const char *pname;
+	int num_routes, ssp_port, ret;
+
+	mach = dev_get_platdata(dev);
+	pname = mach->mach_params.platform;
+	ssp_port = __ffs(mach->mach_params.i2s_link_mask);
+
+	ret = avs_create_dai_link(dev, pname, ssp_port, &dai_link);
+	if (ret) {
+		dev_err(dev, "Failed to create dai link: %d", ret);
+		return ret;
+	}
+
+	ret = avs_create_dapm_routes(dev, ssp_port, &routes, &num_routes);
+	if (ret) {
+		dev_err(dev, "Failed to create dapm routes: %d", ret);
+		return ret;
+	}
+
+	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
+	if (!card)
+		return -ENOMEM;
+
+	card->name = "avs_max98927";
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
+
+	ret = snd_soc_fixup_dai_links_platform_name(card, pname);
+	if (ret)
+		return ret;
+
+	return devm_snd_soc_register_card(dev, card);
+}
+
+static struct platform_driver avs_max98927_driver = {
+	.probe = avs_max98927_probe,
+	.driver = {
+		.name = "avs_max98927",
+		.pm = &snd_soc_pm_ops,
+	},
+};
+
+module_platform_driver(avs_max98927_driver)
+
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:avs_max98927");
-- 
2.25.1

