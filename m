Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FACF523896
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 18:19:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A32F41AB6;
	Wed, 11 May 2022 18:18:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A32F41AB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652285966;
	bh=B4jixN4AD3zYEAlCT/ljGfn1ZcKqJbhLR3exyRHeFVQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hNOCzIkfgkAczIHmeMAk/qa9tXohBVLSLh4k0yOsgkOZby6+Xkk3+mBNt+99zwP7R
	 Exo2OKz3DRhZEJURaSAOKCqDDzPw9QOLv9fXqdY5VxEVCrZsKajMOZW950A9YhICMq
	 Ls54jqZLhPpCrVQARhbVscgiFH6HwZps4rUCI9HA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0A9EF80529;
	Wed, 11 May 2022 18:16:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEB94F80510; Wed, 11 May 2022 18:16:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0E6BF804D8
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 18:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0E6BF804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZJRR37c6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652285774; x=1683821774;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B4jixN4AD3zYEAlCT/ljGfn1ZcKqJbhLR3exyRHeFVQ=;
 b=ZJRR37c6RQlAtFw2QFVlwM7yLttVlc7hsAWVjEWsuAaduxMFaBBcDmxo
 OkForUfdvv0IKJZqhLOXcGJYS/fmwZuaK5IFGwzjHl1BerbV6TsVClecC
 0uvRKSPguVs77v7GCH77FTDjLyUtRv5zgNZH/dLqZMWv41u2ETW7piAcx
 f2LaBXT9tgvbL6ezYzAVYxBXnNHf+zFpYysYJse3h2q0+dU+PDr2Eo4RN
 XSedi5Hc3TGaAblEwVyhUwho65BX/C76EUNJxC6F/wRBN1shuAa+d3PGd
 D3MLzbOwhF3UcUjym8fWQE/i4+BkSsIfZJNNfkslPpV3Yfa9FUYNbUf/Q g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="269680275"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="269680275"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 09:15:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="594210243"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga008.jf.intel.com with ESMTP; 11 May 2022 09:15:11 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 13/14] ASoC: Intel: avs: Add max98373 machine board
Date: Wed, 11 May 2022 18:24:02 +0200
Message-Id: <20220511162403.3987658-14-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511162403.3987658-1-cezary.rojewski@intel.com>
References: <20220511162403.3987658-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 kai.vehmanen@linux.intel.com, harshapriya.n@intel.com, rad@semihalf.com,
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

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

To support AVS-max98373 configuration add machine board connecting AVS
platform component driver with max98373 codec one.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/Kconfig    |  10 ++
 sound/soc/intel/avs/boards/Makefile   |   2 +
 sound/soc/intel/avs/boards/max98373.c | 239 ++++++++++++++++++++++++++
 3 files changed, 251 insertions(+)
 create mode 100644 sound/soc/intel/avs/boards/max98373.c

diff --git a/sound/soc/intel/avs/boards/Kconfig b/sound/soc/intel/avs/boards/Kconfig
index 28e6691270d9..d3be6dc1fc10 100644
--- a/sound/soc/intel/avs/boards/Kconfig
+++ b/sound/soc/intel/avs/boards/Kconfig
@@ -36,6 +36,16 @@ config SND_SOC_INTEL_AVS_MACH_MAX98357A
 	  Say Y or m if you have such a device. This is a recommended option.
 	  If unsure select "N".
 
+config SND_SOC_INTEL_AVS_MACH_MAX98373
+	tristate "max98373 I2S board"
+	depends on I2C
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	select SND_SOC_MAX98373
+	help
+	  This adds support for AVS with MAX98373 I2S codec configuration.
+	  Say Y or m if you have such a device. This is a recommended option.
+	  If unsure select "N".
+
 config SND_SOC_INTEL_AVS_MACH_NAU8825
 	tristate "nau8825 I2S board"
 	depends on I2C
diff --git a/sound/soc/intel/avs/boards/Makefile b/sound/soc/intel/avs/boards/Makefile
index f7ac1151a8f7..0bce31e192ce 100644
--- a/sound/soc/intel/avs/boards/Makefile
+++ b/sound/soc/intel/avs/boards/Makefile
@@ -4,6 +4,7 @@ snd-soc-avs-dmic-objs := dmic.o
 snd-soc-avs-hdaudio-objs := hdaudio.o
 snd-soc-avs-i2s-test-objs := i2s_test.o
 snd-soc-avs-max98357a-objs := max98357a.o
+snd-soc-avs-max98373-objs := max98373.o
 snd-soc-avs-nau8825-objs := nau8825.o
 snd-soc-avs-rt274-objs := rt274.o
 snd-soc-avs-rt286-objs := rt286.o
@@ -15,6 +16,7 @@ obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_DMIC) += snd-soc-avs-dmic.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_HDAUDIO) += snd-soc-avs-hdaudio.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_i2s_TEST) += snd-soc-avs-i2s-test.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_MAX98357A) += snd-soc-avs-max98357a.o
+obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_MAX98373) += snd-soc-avs-max98373.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_NAU8825) += snd-soc-avs-nau8825.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT274) += snd-soc-avs-rt274.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT286) += snd-soc-avs-rt286.o
diff --git a/sound/soc/intel/avs/boards/max98373.c b/sound/soc/intel/avs/boards/max98373.c
new file mode 100644
index 000000000000..0fa8f5606385
--- /dev/null
+++ b/sound/soc/intel/avs/boards/max98373.c
@@ -0,0 +1,239 @@
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
+#define MAX98373_DEV0_NAME	"i2c-MX98373:00"
+#define MAX98373_DEV1_NAME	"i2c-MX98373:01"
+#define MAX98373_CODEC_NAME	"max98373-aif1"
+
+static struct snd_soc_codec_conf card_codec_conf[] = {
+	{
+		.dlc = COMP_CODEC_CONF(MAX98373_DEV0_NAME),
+		.name_prefix = "Right",
+	},
+	{
+		.dlc = COMP_CODEC_CONF(MAX98373_DEV1_NAME),
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
+avs_max98373_be_fixup(struct snd_soc_pcm_runtime *runrime, struct snd_pcm_hw_params *params)
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
+static int avs_max98373_hw_params(struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai;
+	int ret, i;
+
+	for_each_rtd_codec_dais(runtime, i, codec_dai) {
+		if (!strcmp(codec_dai->component->name, MAX98373_DEV0_NAME)) {
+			ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x30, 3, 8, 16);
+			if (ret < 0) {
+				dev_err(runtime->dev, "DEV0 TDM slot err:%d\n", ret);
+				return ret;
+			}
+		}
+		if (!strcmp(codec_dai->component->name, MAX98373_DEV1_NAME)) {
+			ret = snd_soc_dai_set_tdm_slot(codec_dai, 0xC0, 3, 8, 16);
+			if (ret < 0) {
+				dev_err(runtime->dev, "DEV1 TDM slot err:%d\n", ret);
+				return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_ops avs_max98373_ops = {
+	.hw_params = avs_max98373_hw_params,
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
+	dl->codecs[0].name = devm_kasprintf(dev, GFP_KERNEL, MAX98373_DEV0_NAME);
+	dl->codecs[0].dai_name = devm_kasprintf(dev, GFP_KERNEL, MAX98373_CODEC_NAME);
+	dl->codecs[1].name = devm_kasprintf(dev, GFP_KERNEL, MAX98373_DEV1_NAME);
+	dl->codecs[1].dai_name = devm_kasprintf(dev, GFP_KERNEL, MAX98373_CODEC_NAME);
+	if (!dl->cpus->dai_name || !dl->codecs[0].name || !dl->codecs[0].dai_name ||
+	    !dl->codecs[1].name || !dl->codecs[1].dai_name)
+		return -ENOMEM;
+
+	dl->num_cpus = 1;
+	dl->num_codecs = 2;
+	dl->platforms = platform;
+	dl->num_platforms = 1;
+	dl->id = 0;
+	dl->dai_fmt = SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC;
+	dl->be_hw_params_fixup = avs_max98373_be_fixup;
+	dl->nonatomic = 1;
+	dl->no_pcm = 1;
+	dl->dpcm_capture = 1;
+	dl->dpcm_playback = 1;
+	dl->ignore_pmdown_time = 1;
+	dl->ops = &avs_max98373_ops;
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
+static int avs_max98373_probe(struct platform_device *pdev)
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
+	card->name = "avs_max98373";
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
+static struct platform_driver avs_max98373_driver = {
+	.probe = avs_max98373_probe,
+	.driver = {
+		.name = "avs_max98373",
+		.pm = &snd_soc_pm_ops,
+	},
+};
+
+module_platform_driver(avs_max98373_driver)
+
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:avs_max98373");
-- 
2.25.1

