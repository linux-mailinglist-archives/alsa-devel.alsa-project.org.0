Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B785552387C
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 18:17:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BA34180D;
	Wed, 11 May 2022 18:16:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BA34180D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652285850;
	bh=kke2++kpNTIuFQcHBRTVq11yBAHuEZpLVjXGwzrKKp0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nYrKNr7ltzEefj4+4/h9dg6xItFEh9i/MQ+XVzb/5yPhp7YoaonPVKSMAP0Ou7FKg
	 B4kZn56RxpMICNMaS8OT+We3DOUZNRJ1+NMMi3dOHsXoHXjJy7KsAVbo49k0PKx5/D
	 G1CcN47wgGm6CmMIvb1t4aa07hCEgD6cBmsBzT6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BCBCF80542;
	Wed, 11 May 2022 18:14:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52656F80535; Wed, 11 May 2022 18:14:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6603F8052E
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 18:14:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6603F8052E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RJh74cLG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652285694; x=1683821694;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kke2++kpNTIuFQcHBRTVq11yBAHuEZpLVjXGwzrKKp0=;
 b=RJh74cLGWCHf5Mlw5lFi7f8lOn3hPdOSG8Vkc4IYV1fBOeTODqVi/4Ti
 OEZw66A/zhZOfWrI90k72KWeF08Av3/JtiFlrOANHz/05xdekPRNuLPCZ
 dvoy2/D5QpeR80c4OUzihjdwcrYt7dntKAUVjm2YPPObtHmkraqCJNnri
 zkfEzkwqtAaiVD2gxIOzUHiWhC4qYmg+Pbnq1FlKs/5VDWCAvdrj4Nf+x
 scwqp6d2xRlPqQQfZDYZUJU8gWijDEqqXuMp87rnsWJ3WaAKugLxGHCZR
 tGpFBK0wU3OGTpF7ilMCns3TkcTzK1Xb0QoKnemfsdqyr3uF9jHoQTz7d g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="269680022"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="269680022"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 09:14:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="594209765"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga008.jf.intel.com with ESMTP; 11 May 2022 09:14:44 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 06/14] ASoC: Intel: avs: Add rt274 machine board
Date: Wed, 11 May 2022 18:23:55 +0200
Message-Id: <20220511162403.3987658-7-cezary.rojewski@intel.com>
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

To support AVS-rt274 configuration add machine board connecting AVS
platform component driver with rt274 codec one.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/Kconfig  |  10 +
 sound/soc/intel/avs/boards/Makefile |   2 +
 sound/soc/intel/avs/boards/rt274.c  | 310 ++++++++++++++++++++++++++++
 3 files changed, 322 insertions(+)
 create mode 100644 sound/soc/intel/avs/boards/rt274.c

diff --git a/sound/soc/intel/avs/boards/Kconfig b/sound/soc/intel/avs/boards/Kconfig
index 5b89fcb5f07f..9058919c99a7 100644
--- a/sound/soc/intel/avs/boards/Kconfig
+++ b/sound/soc/intel/avs/boards/Kconfig
@@ -26,4 +26,14 @@ config SND_SOC_INTEL_AVS_MACH_I2S_TEST
 	   This adds support for I2S test-board which can be used to verify
 	   transfer over I2S interface with SSP loopback scenarios.
 
+config SND_SOC_INTEL_AVS_MACH_RT274
+	tristate "rt274 in I2S mode"
+	depends on I2C
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	select SND_SOC_RT274
+	help
+	   This adds support for ASoC machine driver with RT274 I2S audio codec.
+	   Say Y or m if you have such a device. This is a recommended option.
+	   If unsure select "N".
+
 endmenu
diff --git a/sound/soc/intel/avs/boards/Makefile b/sound/soc/intel/avs/boards/Makefile
index fa1a279106be..e94f04d00ffc 100644
--- a/sound/soc/intel/avs/boards/Makefile
+++ b/sound/soc/intel/avs/boards/Makefile
@@ -3,7 +3,9 @@
 snd-soc-avs-dmic-objs := dmic.o
 snd-soc-avs-hdaudio-objs := hdaudio.o
 snd-soc-avs-i2s-test-objs := i2s_test.o
+snd-soc-avs-rt274-objs := rt274.o
 
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_DMIC) += snd-soc-avs-dmic.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_HDAUDIO) += snd-soc-avs-hdaudio.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_i2s_TEST) += snd-soc-avs-i2s-test.o
+obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_RT274) += snd-soc-avs-rt274.o
diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
new file mode 100644
index 000000000000..afef5a3ca60b
--- /dev/null
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -0,0 +1,310 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+
+#include <linux/module.h>
+#include <sound/jack.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include "../../../codecs/rt274.h"
+
+#define AVS_RT274_FREQ_OUT	24000000
+#define AVS_RT274_BE_FIXUP_RATE	48000
+#define RT274_CODEC_DAI		"rt274-aif1"
+
+static const struct snd_kcontrol_new card_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Mic Jack"),
+};
+
+static int
+avs_rt274_clock_control(struct snd_soc_dapm_widget *w, struct snd_kcontrol *control, int event)
+{
+	struct snd_soc_dapm_context *dapm = w->dapm;
+	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_dai *codec_dai;
+	int ret;
+
+	codec_dai = snd_soc_card_get_codec_dai(card, RT274_CODEC_DAI);
+	if (!codec_dai)
+		return -EINVAL;
+
+	/* Codec needs clock for Jack detection and button press */
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT274_SCLK_S_PLL2, AVS_RT274_FREQ_OUT,
+				     SND_SOC_CLOCK_IN);
+	if (ret < 0) {
+		dev_err(codec_dai->dev, "set codec sysclk failed: %d\n", ret);
+		return ret;
+	}
+
+	if (SND_SOC_DAPM_EVENT_ON(event)) {
+		int ratio = 100;
+
+		snd_soc_dai_set_bclk_ratio(codec_dai, ratio);
+
+		ret = snd_soc_dai_set_pll(codec_dai, 0, RT274_PLL2_S_BCLK,
+					  AVS_RT274_BE_FIXUP_RATE * ratio, AVS_RT274_FREQ_OUT);
+		if (ret) {
+			dev_err(codec_dai->dev, "failed to enable PLL2: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget card_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Mic Jack", NULL),
+	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0, avs_rt274_clock_control,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+};
+
+static const struct snd_soc_dapm_route card_base_routes[] = {
+	{"Headphone Jack", NULL, "HPO Pin"},
+	{"MIC", NULL, "Mic Jack"},
+
+	{"Headphone Jack", NULL, "Platform Clock"},
+	{"MIC", NULL, "Platform Clock"},
+};
+
+static struct snd_soc_jack_pin card_headset_pins[] = {
+	{
+		.pin = "Headphone Jack",
+		.mask = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin = "Mic Jack",
+		.mask = SND_JACK_MICROPHONE,
+	},
+};
+
+static int avs_rt274_codec_init(struct snd_soc_pcm_runtime *runtime)
+{
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, 0);
+	struct snd_soc_component *component = codec_dai->component;
+	struct snd_soc_jack_pin *pins;
+	struct snd_soc_jack *jack;
+	struct snd_soc_card *card = runtime->card;
+	int num_pins, ret;
+
+	jack = snd_soc_card_get_drvdata(card);
+	num_pins = ARRAY_SIZE(card_headset_pins);
+
+	pins = devm_kmemdup(card->dev, card_headset_pins, sizeof(*pins) * num_pins, GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
+
+	ret = snd_soc_card_jack_new_pins(card, "Headset", SND_JACK_HEADSET, jack, pins, num_pins);
+	if (ret)
+		return ret;
+
+	snd_soc_component_set_jack(component, jack, NULL);
+
+	/* TDM 4 slots 24 bit, set Rx & Tx bitmask to 4 active slots */
+	ret = snd_soc_dai_set_tdm_slot(codec_dai, 0xF, 0xF, 4, 24);
+	if (ret < 0) {
+		dev_err(card->dev, "can't set codec pcm format %d\n", ret);
+		return ret;
+	}
+
+	card->dapm.idle_bias_off = true;
+
+	return 0;
+}
+
+static int avs_rt274_be_fixup(struct snd_soc_pcm_runtime *runtime, struct snd_pcm_hw_params *params)
+{
+	struct snd_interval *rate, *channels;
+	struct snd_mask *fmt;
+
+	rate = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
+	channels = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
+	fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+
+	/* The ADSP will convert the FE rate to 48k, stereo */
+	rate->min = rate->max = AVS_RT274_BE_FIXUP_RATE;
+	channels->min = channels->max = 2;
+
+	/* set SSPN to 24 bit */
+	snd_mask_none(fmt);
+	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
+
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
+	dl->codecs = devm_kzalloc(dev, sizeof(*dl->codecs), GFP_KERNEL);
+	if (!dl->name || !dl->cpus || !dl->codecs)
+		return -ENOMEM;
+
+	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", ssp_port);
+	dl->codecs->name = devm_kasprintf(dev, GFP_KERNEL, "i2c-INT34C2:00");
+	dl->codecs->dai_name = devm_kasprintf(dev, GFP_KERNEL, "rt274-aif1");
+	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
+		return -ENOMEM;
+
+	dl->num_cpus = 1;
+	dl->num_codecs = 1;
+	dl->platforms = platform;
+	dl->num_platforms = 1;
+	dl->id = 0;
+	dl->dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS;
+	dl->init = avs_rt274_codec_init;
+	dl->be_hw_params_fixup = avs_rt274_be_fixup;
+	dl->nonatomic = 1;
+	dl->no_pcm = 1;
+	dl->dpcm_capture = 1;
+	dl->dpcm_playback = 1;
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
+	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "AIF1 Playback");
+	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Tx", ssp_port);
+	if (!dr[idx].sink || !dr[idx].source)
+		return -ENOMEM;
+
+	idx++;
+	dr[idx].sink = devm_kasprintf(dev, GFP_KERNEL, "ssp%d Rx", ssp_port);
+	dr[idx].source = devm_kasprintf(dev, GFP_KERNEL, "AIF1 Capture");
+	if (!dr[idx].sink || !dr[idx].source)
+		return -ENOMEM;
+
+	*routes = dr;
+	*num_routes = num_dr;
+
+	return 0;
+}
+
+static int avs_card_set_jack(struct snd_soc_card *card, struct snd_soc_jack *jack)
+{
+	struct snd_soc_component *component;
+
+	for_each_card_components(card, component)
+		snd_soc_component_set_jack(component, jack, NULL);
+	return 0;
+}
+
+static int avs_card_remove(struct snd_soc_card *card)
+{
+	return avs_card_set_jack(card, NULL);
+}
+
+static int avs_card_suspend_pre(struct snd_soc_card *card)
+{
+	return avs_card_set_jack(card, NULL);
+}
+
+static int avs_card_resume_post(struct snd_soc_card *card)
+{
+	struct snd_soc_jack *jack = snd_soc_card_get_drvdata(card);
+
+	return avs_card_set_jack(card, jack);
+}
+
+static int avs_rt274_probe(struct platform_device *pdev)
+{
+	struct snd_soc_dapm_route *routes;
+	struct snd_soc_dai_link *dai_link;
+	struct snd_soc_acpi_mach *mach;
+	struct snd_soc_card *card;
+	struct snd_soc_jack *jack;
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
+	jack = devm_kzalloc(dev, sizeof(*jack), GFP_KERNEL);
+	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
+	if (!jack || !card)
+		return -ENOMEM;
+
+	card->name = "avs_rt274";
+	card->dev = dev;
+	card->owner = THIS_MODULE;
+	card->remove = avs_card_remove;
+	card->suspend_pre = avs_card_suspend_pre;
+	card->resume_post = avs_card_resume_post;
+	card->dai_link = dai_link;
+	card->num_links = 1;
+	card->controls = card_controls;
+	card->num_controls = ARRAY_SIZE(card_controls);
+	card->dapm_widgets = card_widgets;
+	card->num_dapm_widgets = ARRAY_SIZE(card_widgets);
+	card->dapm_routes = routes;
+	card->num_dapm_routes = num_routes;
+	card->fully_routed = true;
+	snd_soc_card_set_drvdata(card, jack);
+
+	ret = snd_soc_fixup_dai_links_platform_name(card, pname);
+	if (ret)
+		return ret;
+
+	return devm_snd_soc_register_card(dev, card);
+}
+
+static struct platform_driver avs_rt274_driver = {
+	.probe = avs_rt274_probe,
+	.driver = {
+		.name = "avs_rt274",
+		.pm = &snd_soc_pm_ops,
+	},
+};
+
+module_platform_driver(avs_rt274_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:avs_rt274");
-- 
2.25.1

