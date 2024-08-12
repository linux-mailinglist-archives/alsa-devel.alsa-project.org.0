Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A643994EA31
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2024 11:45:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C47E218D;
	Mon, 12 Aug 2024 11:45:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C47E218D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723455949;
	bh=4n95epjkk1Jj88i4P8lWbB3fmW7WO1oP/Eqckur2FFE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n/c+KR0vnOMiM+1WXn4SecD9ReebhTUUrY8Tx/zu/QhvaPWLIHRAdFgMjc11bQXFO
	 zaHmBFLZWvJODkS66Utzh5RNfqgwuD7SzOMFV6RI0t9jsVf6uDpw63DHOpQH2yZfM/
	 PdEVcSBBEAH5ulCgysrdZHgXy53VvApHTPt1axZE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 311E5F80691; Mon, 12 Aug 2024 11:44:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F514F8068A;
	Mon, 12 Aug 2024 11:44:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EB88F80588; Mon, 12 Aug 2024 11:44:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C158F8016E
	for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2024 11:42:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C158F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WBOfSVgO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723455760; x=1754991760;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4n95epjkk1Jj88i4P8lWbB3fmW7WO1oP/Eqckur2FFE=;
  b=WBOfSVgO0AHgElJKhlA32tRHDeTTErlB3z8k3qayH5AQdA0Ad1bSwPCW
   UbTvpFr8ekW7yk6bT4JvoiC3KgwWIky16bSG83hOUyMR6C7MPRk2NW99V
   okRWtcaS14X9nPgaYtnGoS1HPpPepr0kGI4TU9MEYd5KEWJm3/xQOCf/L
   AluvbmO+E0yKKltT0suPnNRhvJrUXNV0qgaORLdAuTP/Tpuu/I3nL3Zn9
   rxkPjiAh/ehIc2vfrp63VZ/g2jaiEJOUSKNfHlA/DGUS1PlrnzNCc+uz/
   nqltpnXq7SqUyVag3SRTqF57HmGH7u7qG9tsAPZiep6NmEbxrmhwTpiX7
   A==;
X-CSE-ConnectionGUID: uJdfZpv8QrWWX3DLhJGnrw==
X-CSE-MsgGUID: OMTpG1g4RA+Mj0T7sA/QvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21705349"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800";
   d="scan'208";a="21705349"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 02:42:36 -0700
X-CSE-ConnectionGUID: ah42GgFbSvGMI+teP6mCTw==
X-CSE-MsgGUID: AK9+iR5eQJyaUlA4DGQ6/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800";
   d="scan'208";a="63056810"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa005.jf.intel.com with ESMTP; 12 Aug 2024 02:42:32 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	andriy.shevchenko@linux.intel.com,
	cujomalainey@chromium.org,
	lmajczak@google.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 01/12] ASoC: Intel: Remove bxt_rt298 board driver
Date: Mon, 12 Aug 2024 11:43:17 +0200
Message-Id: <20240812094328.842661-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240812094328.842661-1-cezary.rojewski@intel.com>
References: <20240812094328.842661-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3RW53IILU2MUXPKXILZJMC74JFTK3RGM
X-Message-ID-Hash: 3RW53IILU2MUXPKXILZJMC74JFTK3RGM
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3RW53IILU2MUXPKXILZJMC74JFTK3RGM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver has no users.

Succeeded by:
- avs_rt298 (./intel/avs/boards/rt298.c)

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/boards/Kconfig     |  14 -
 sound/soc/intel/boards/Makefile    |   2 -
 sound/soc/intel/boards/bxt_rt298.c | 670 -----------------------------
 3 files changed, 686 deletions(-)
 delete mode 100644 sound/soc/intel/boards/bxt_rt298.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 3d59d6982763..0892f2c19ade 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -319,20 +319,6 @@ config SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH
 	   Say Y or m if you have such a device. This is a recommended option.
 	   If unsure select "N".
 
-config SND_SOC_INTEL_BXT_RT298_MACH
-	tristate "Broxton with RT298 I2S mode"
-	depends on I2C && ACPI
-	depends on MFD_INTEL_LPSS || COMPILE_TEST
-	select SND_SOC_RT298
-	select SND_SOC_DMIC
-	select SND_SOC_HDAC_HDMI
-	select SND_SOC_INTEL_HDA_DSP_COMMON
-	help
-	   This adds support for ASoC machine driver for Broxton platforms
-	   with RT286 I2S audio codec.
-	   Say Y or m if you have such a device. This is a recommended option.
-	   If unsure select "N".
-
 endif ## SND_SOC_INTEL_APL
 
 if SND_SOC_SOF_APOLLOLAKE
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 5bd8dc2d166a..ae758a8aa61d 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -4,7 +4,6 @@ snd-soc-sst-bdw-rt5650-mach-y := bdw-rt5650.o
 snd-soc-sst-bdw-rt5677-mach-y := bdw-rt5677.o
 snd-soc-bdw-rt286-y := bdw_rt286.o
 snd-soc-sst-bxt-da7219_max98357a-y := bxt_da7219_max98357a.o
-snd-soc-sst-bxt-rt298-y := bxt_rt298.o
 snd-soc-sst-sof-pcm512x-y := sof_pcm512x.o
 snd-soc-sst-sof-wm8804-y := sof_wm8804.o
 snd-soc-sst-bytcr-rt5640-y := bytcr_rt5640.o
@@ -43,7 +42,6 @@ obj-$(CONFIG_SND_SOC_INTEL_SOF_NAU8825_MACH) += snd-soc-sof_nau8825.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_DA7219_MACH) += snd-soc-sof_da7219.o
 obj-$(CONFIG_SND_SOC_INTEL_HASWELL_MACH) += snd-soc-hsw-rt5640.o
 obj-$(CONFIG_SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH) += snd-soc-sst-bxt-da7219_max98357a.o
-obj-$(CONFIG_SND_SOC_INTEL_BXT_RT298_MACH) += snd-soc-sst-bxt-rt298.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_PCM512x_MACH) += snd-soc-sst-sof-pcm512x.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_WM8804_MACH) += snd-soc-sst-sof-wm8804.o
 obj-$(CONFIG_SND_SOC_INTEL_BROADWELL_MACH) += snd-soc-bdw-rt286.o
diff --git a/sound/soc/intel/boards/bxt_rt298.c b/sound/soc/intel/boards/bxt_rt298.c
deleted file mode 100644
index dce6a2086f2a..000000000000
--- a/sound/soc/intel/boards/bxt_rt298.c
+++ /dev/null
@@ -1,670 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Intel Broxton-P I2S Machine Driver
- *
- * Copyright (C) 2014-2016, Intel Corporation
- *
- * Modified from:
- *   Intel Skylake I2S Machine driver
- */
-
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <sound/core.h>
-#include <sound/pcm.h>
-#include <sound/soc.h>
-#include <sound/soc-acpi.h>
-#include <sound/jack.h>
-#include <sound/pcm_params.h>
-#include "../../codecs/hdac_hdmi.h"
-#include "../../codecs/rt298.h"
-#include "hda_dsp_common.h"
-
-/* Headset jack detection DAPM pins */
-static struct snd_soc_jack broxton_headset;
-static struct snd_soc_jack broxton_hdmi[3];
-
-struct bxt_hdmi_pcm {
-	struct list_head head;
-	struct snd_soc_dai *codec_dai;
-	int device;
-};
-
-struct bxt_rt286_private {
-	struct list_head hdmi_pcm_list;
-	bool common_hdmi_codec_drv;
-};
-
-enum {
-	BXT_DPCM_AUDIO_PB = 0,
-	BXT_DPCM_AUDIO_CP,
-	BXT_DPCM_AUDIO_REF_CP,
-	BXT_DPCM_AUDIO_DMIC_CP,
-	BXT_DPCM_AUDIO_HDMI1_PB,
-	BXT_DPCM_AUDIO_HDMI2_PB,
-	BXT_DPCM_AUDIO_HDMI3_PB,
-};
-
-static struct snd_soc_jack_pin broxton_headset_pins[] = {
-	{
-		.pin = "Mic Jack",
-		.mask = SND_JACK_MICROPHONE,
-	},
-	{
-		.pin = "Headphone Jack",
-		.mask = SND_JACK_HEADPHONE,
-	},
-};
-
-static const struct snd_kcontrol_new broxton_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Speaker"),
-	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
-	SOC_DAPM_PIN_SWITCH("Mic Jack"),
-};
-
-static const struct snd_soc_dapm_widget broxton_widgets[] = {
-	SND_SOC_DAPM_HP("Headphone Jack", NULL),
-	SND_SOC_DAPM_SPK("Speaker", NULL),
-	SND_SOC_DAPM_MIC("Mic Jack", NULL),
-	SND_SOC_DAPM_MIC("DMIC2", NULL),
-	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
-	SND_SOC_DAPM_SPK("HDMI1", NULL),
-	SND_SOC_DAPM_SPK("HDMI2", NULL),
-	SND_SOC_DAPM_SPK("HDMI3", NULL),
-};
-
-static const struct snd_soc_dapm_route broxton_rt298_map[] = {
-	/* speaker */
-	{"Speaker", NULL, "SPOR"},
-	{"Speaker", NULL, "SPOL"},
-
-	/* HP jack connectors - unknown if we have jack detect */
-	{"Headphone Jack", NULL, "HPO Pin"},
-
-	/* other jacks */
-	{"MIC1", NULL, "Mic Jack"},
-
-	/* digital mics */
-	{"DMIC1 Pin", NULL, "DMIC2"},
-	{"DMic", NULL, "SoC DMIC"},
-
-	{"HDMI1", NULL, "hif5-0 Output"},
-	{"HDMI2", NULL, "hif6-0 Output"},
-	{"HDMI2", NULL, "hif7-0 Output"},
-
-	/* CODEC BE connections */
-	{ "AIF1 Playback", NULL, "ssp5 Tx"},
-	{ "ssp5 Tx", NULL, "codec0_out"},
-	{ "ssp5 Tx", NULL, "codec1_out"},
-
-	{ "codec0_in", NULL, "ssp5 Rx" },
-	{ "ssp5 Rx", NULL, "AIF1 Capture" },
-
-	{ "dmic01_hifi", NULL, "DMIC01 Rx" },
-	{ "DMIC01 Rx", NULL, "Capture" },
-
-	{ "hifi3", NULL, "iDisp3 Tx"},
-	{ "iDisp3 Tx", NULL, "iDisp3_out"},
-	{ "hifi2", NULL, "iDisp2 Tx"},
-	{ "iDisp2 Tx", NULL, "iDisp2_out"},
-	{ "hifi1", NULL, "iDisp1 Tx"},
-	{ "iDisp1 Tx", NULL, "iDisp1_out"},
-};
-
-static const struct snd_soc_dapm_route geminilake_rt298_map[] = {
-	/* speaker */
-	{"Speaker", NULL, "SPOR"},
-	{"Speaker", NULL, "SPOL"},
-
-	/* HP jack connectors - unknown if we have jack detect */
-	{"Headphone Jack", NULL, "HPO Pin"},
-
-	/* other jacks */
-	{"MIC1", NULL, "Mic Jack"},
-
-	/* digital mics */
-	{"DMIC1 Pin", NULL, "DMIC2"},
-	{"DMic", NULL, "SoC DMIC"},
-
-	{"HDMI1", NULL, "hif5-0 Output"},
-	{"HDMI2", NULL, "hif6-0 Output"},
-	{"HDMI2", NULL, "hif7-0 Output"},
-
-	/* CODEC BE connections */
-	{ "AIF1 Playback", NULL, "ssp2 Tx"},
-	{ "ssp2 Tx", NULL, "codec0_out"},
-	{ "ssp2 Tx", NULL, "codec1_out"},
-
-	{ "codec0_in", NULL, "ssp2 Rx" },
-	{ "ssp2 Rx", NULL, "AIF1 Capture" },
-
-	{ "dmic01_hifi", NULL, "DMIC01 Rx" },
-	{ "DMIC01 Rx", NULL, "Capture" },
-
-	{ "dmic_voice", NULL, "DMIC16k Rx" },
-	{ "DMIC16k Rx", NULL, "Capture" },
-
-	{ "hifi3", NULL, "iDisp3 Tx"},
-	{ "iDisp3 Tx", NULL, "iDisp3_out"},
-	{ "hifi2", NULL, "iDisp2 Tx"},
-	{ "iDisp2 Tx", NULL, "iDisp2_out"},
-	{ "hifi1", NULL, "iDisp1 Tx"},
-	{ "iDisp1 Tx", NULL, "iDisp1_out"},
-};
-
-static int broxton_rt298_fe_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_dapm_context *dapm;
-	struct snd_soc_component *component = snd_soc_rtd_to_cpu(rtd, 0)->component;
-
-	dapm = snd_soc_component_get_dapm(component);
-	snd_soc_dapm_ignore_suspend(dapm, "Reference Capture");
-
-	return 0;
-}
-
-static int broxton_rt298_codec_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
-	int ret = 0;
-
-	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset",
-		SND_JACK_HEADSET | SND_JACK_BTN_0,
-		&broxton_headset,
-		broxton_headset_pins, ARRAY_SIZE(broxton_headset_pins));
-
-	if (ret)
-		return ret;
-
-	snd_soc_component_set_jack(component, &broxton_headset, NULL);
-
-	snd_soc_dapm_ignore_suspend(&rtd->card->dapm, "SoC DMIC");
-
-	return 0;
-}
-
-static int broxton_hdmi_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct bxt_rt286_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
-	struct bxt_hdmi_pcm *pcm;
-
-	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
-	if (!pcm)
-		return -ENOMEM;
-
-	pcm->device = BXT_DPCM_AUDIO_HDMI1_PB + dai->id;
-	pcm->codec_dai = dai;
-
-	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
-
-	return 0;
-}
-
-static int broxton_ssp5_fixup(struct snd_soc_pcm_runtime *rtd,
-			struct snd_pcm_hw_params *params)
-{
-	struct snd_interval *rate = hw_param_interval(params,
-					SNDRV_PCM_HW_PARAM_RATE);
-	struct snd_interval *chan = hw_param_interval(params,
-					SNDRV_PCM_HW_PARAM_CHANNELS);
-	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
-
-	/* The ADSP will convert the FE rate to 48k, stereo */
-	rate->min = rate->max = 48000;
-	chan->min = chan->max = 2;
-
-	/* set SSP5 to 24 bit */
-	snd_mask_none(fmt);
-	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
-
-	return 0;
-}
-
-static int broxton_rt298_hw_params(struct snd_pcm_substream *substream,
-	struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
-	int ret;
-
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT298_SCLK_S_PLL,
-					19200000, SND_SOC_CLOCK_IN);
-	if (ret < 0) {
-		dev_err(rtd->dev, "can't set codec sysclk configuration\n");
-		return ret;
-	}
-
-	return ret;
-}
-
-static const struct snd_soc_ops broxton_rt298_ops = {
-	.hw_params = broxton_rt298_hw_params,
-};
-
-static const unsigned int rates[] = {
-	48000,
-};
-
-static const struct snd_pcm_hw_constraint_list constraints_rates = {
-	.count = ARRAY_SIZE(rates),
-	.list  = rates,
-	.mask = 0,
-};
-
-static int broxton_dmic_fixup(struct snd_soc_pcm_runtime *rtd,
-				struct snd_pcm_hw_params *params)
-{
-	struct snd_interval *chan = hw_param_interval(params,
-						SNDRV_PCM_HW_PARAM_CHANNELS);
-	chan->min = chan->max = 4;
-
-	return 0;
-}
-
-static const unsigned int channels_dmic[] = {
-	1, 2, 3, 4,
-};
-
-static const struct snd_pcm_hw_constraint_list constraints_dmic_channels = {
-	.count = ARRAY_SIZE(channels_dmic),
-	.list = channels_dmic,
-	.mask = 0,
-};
-
-static int broxton_dmic_startup(struct snd_pcm_substream *substream)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-
-	runtime->hw.channels_max = 4;
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
-					&constraints_dmic_channels);
-
-	return snd_pcm_hw_constraint_list(substream->runtime, 0,
-				SNDRV_PCM_HW_PARAM_RATE, &constraints_rates);
-}
-
-static const struct snd_soc_ops broxton_dmic_ops = {
-	.startup = broxton_dmic_startup,
-};
-
-static const unsigned int channels[] = {
-	2,
-};
-
-static const struct snd_pcm_hw_constraint_list constraints_channels = {
-	.count = ARRAY_SIZE(channels),
-	.list = channels,
-	.mask = 0,
-};
-
-static int bxt_fe_startup(struct snd_pcm_substream *substream)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-
-	/*
-	 * on this platform for PCM device we support:
-	 *      48Khz
-	 *      stereo
-	 *	16-bit audio
-	 */
-
-	runtime->hw.channels_max = 2;
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
-				&constraints_channels);
-
-	runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
-	snd_pcm_hw_constraint_msbits(runtime, 0, 16, 16);
-	snd_pcm_hw_constraint_list(runtime, 0,
-				SNDRV_PCM_HW_PARAM_RATE, &constraints_rates);
-
-	return 0;
-}
-
-static const struct snd_soc_ops broxton_rt286_fe_ops = {
-	.startup = bxt_fe_startup,
-};
-
-SND_SOC_DAILINK_DEF(dummy,
-	DAILINK_COMP_ARRAY(COMP_DUMMY()));
-
-SND_SOC_DAILINK_DEF(system,
-	DAILINK_COMP_ARRAY(COMP_CPU("System Pin")));
-
-SND_SOC_DAILINK_DEF(reference,
-	DAILINK_COMP_ARRAY(COMP_CPU("Reference Pin")));
-
-SND_SOC_DAILINK_DEF(dmic,
-	DAILINK_COMP_ARRAY(COMP_CPU("DMIC Pin")));
-
-SND_SOC_DAILINK_DEF(hdmi1,
-	DAILINK_COMP_ARRAY(COMP_CPU("HDMI1 Pin")));
-
-SND_SOC_DAILINK_DEF(hdmi2,
-	DAILINK_COMP_ARRAY(COMP_CPU("HDMI2 Pin")));
-
-SND_SOC_DAILINK_DEF(hdmi3,
-	DAILINK_COMP_ARRAY(COMP_CPU("HDMI3 Pin")));
-
-SND_SOC_DAILINK_DEF(ssp5_pin,
-	DAILINK_COMP_ARRAY(COMP_CPU("SSP5 Pin")));
-SND_SOC_DAILINK_DEF(ssp5_codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-INT343A:00",
-				      "rt298-aif1")));
-
-SND_SOC_DAILINK_DEF(dmic_pin,
-	DAILINK_COMP_ARRAY(COMP_CPU("DMIC01 Pin")));
-
-SND_SOC_DAILINK_DEF(dmic_codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec",
-				      "dmic-hifi")));
-
-SND_SOC_DAILINK_DEF(dmic16k,
-	DAILINK_COMP_ARRAY(COMP_CPU("DMIC16k Pin")));
-
-SND_SOC_DAILINK_DEF(idisp1_pin,
-	DAILINK_COMP_ARRAY(COMP_CPU("iDisp1 Pin")));
-SND_SOC_DAILINK_DEF(idisp1_codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2",
-				      "intel-hdmi-hifi1")));
-
-SND_SOC_DAILINK_DEF(idisp2_pin,
-	DAILINK_COMP_ARRAY(COMP_CPU("iDisp2 Pin")));
-SND_SOC_DAILINK_DEF(idisp2_codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2",
-				      "intel-hdmi-hifi2")));
-
-SND_SOC_DAILINK_DEF(idisp3_pin,
-	DAILINK_COMP_ARRAY(COMP_CPU("iDisp3 Pin")));
-SND_SOC_DAILINK_DEF(idisp3_codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2",
-				      "intel-hdmi-hifi3")));
-
-SND_SOC_DAILINK_DEF(platform,
-	DAILINK_COMP_ARRAY(COMP_PLATFORM("0000:00:0e.0")));
-
-/* broxton digital audio interface glue - connects codec <--> CPU */
-static struct snd_soc_dai_link broxton_rt298_dais[] = {
-	/* Front End DAI links */
-	[BXT_DPCM_AUDIO_PB] =
-	{
-		.name = "Bxt Audio Port",
-		.stream_name = "Audio",
-		.nonatomic = 1,
-		.dynamic = 1,
-		.init = broxton_rt298_fe_init,
-		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.ops = &broxton_rt286_fe_ops,
-		SND_SOC_DAILINK_REG(system, dummy, platform),
-	},
-	[BXT_DPCM_AUDIO_CP] =
-	{
-		.name = "Bxt Audio Capture Port",
-		.stream_name = "Audio Record",
-		.nonatomic = 1,
-		.dynamic = 1,
-		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
-		.ops = &broxton_rt286_fe_ops,
-		SND_SOC_DAILINK_REG(system, dummy, platform),
-	},
-	[BXT_DPCM_AUDIO_REF_CP] =
-	{
-		.name = "Bxt Audio Reference cap",
-		.stream_name = "refcap",
-		.init = NULL,
-		.dpcm_capture = 1,
-		.nonatomic = 1,
-		.dynamic = 1,
-		SND_SOC_DAILINK_REG(reference, dummy, platform),
-	},
-	[BXT_DPCM_AUDIO_DMIC_CP] =
-	{
-		.name = "Bxt Audio DMIC cap",
-		.stream_name = "dmiccap",
-		.init = NULL,
-		.dpcm_capture = 1,
-		.nonatomic = 1,
-		.dynamic = 1,
-		.ops = &broxton_dmic_ops,
-		SND_SOC_DAILINK_REG(dmic, dummy, platform),
-	},
-	[BXT_DPCM_AUDIO_HDMI1_PB] =
-	{
-		.name = "Bxt HDMI Port1",
-		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
-		.init = NULL,
-		.nonatomic = 1,
-		.dynamic = 1,
-		SND_SOC_DAILINK_REG(hdmi1, dummy, platform),
-	},
-	[BXT_DPCM_AUDIO_HDMI2_PB] =
-	{
-		.name = "Bxt HDMI Port2",
-		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
-		.init = NULL,
-		.nonatomic = 1,
-		.dynamic = 1,
-		SND_SOC_DAILINK_REG(hdmi2, dummy, platform),
-	},
-	[BXT_DPCM_AUDIO_HDMI3_PB] =
-	{
-		.name = "Bxt HDMI Port3",
-		.stream_name = "Hdmi3",
-		.dpcm_playback = 1,
-		.init = NULL,
-		.nonatomic = 1,
-		.dynamic = 1,
-		SND_SOC_DAILINK_REG(hdmi3, dummy, platform),
-	},
-	/* Back End DAI links */
-	{
-		/* SSP5 - Codec */
-		.name = "SSP5-Codec",
-		.id = 0,
-		.no_pcm = 1,
-		.init = broxton_rt298_codec_init,
-		.dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_NB_NF |
-						SND_SOC_DAIFMT_CBC_CFC,
-		.ignore_pmdown_time = 1,
-		.be_hw_params_fixup = broxton_ssp5_fixup,
-		.ops = &broxton_rt298_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
-		SND_SOC_DAILINK_REG(ssp5_pin, ssp5_codec, platform),
-	},
-	{
-		.name = "dmic01",
-		.id = 1,
-		.be_hw_params_fixup = broxton_dmic_fixup,
-		.ignore_suspend = 1,
-		.dpcm_capture = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
-	},
-	{
-		.name = "dmic16k",
-		.id = 2,
-		.be_hw_params_fixup = broxton_dmic_fixup,
-		.ignore_suspend = 1,
-		.dpcm_capture = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(dmic16k, dmic_codec, platform),
-	},
-	{
-		.name = "iDisp1",
-		.id = 3,
-		.init = broxton_hdmi_init,
-		.dpcm_playback = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
-	},
-	{
-		.name = "iDisp2",
-		.id = 4,
-		.init = broxton_hdmi_init,
-		.dpcm_playback = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
-	},
-	{
-		.name = "iDisp3",
-		.id = 5,
-		.init = broxton_hdmi_init,
-		.dpcm_playback = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
-	},
-};
-
-#define NAME_SIZE	32
-static int bxt_card_late_probe(struct snd_soc_card *card)
-{
-	struct bxt_rt286_private *ctx = snd_soc_card_get_drvdata(card);
-	struct bxt_hdmi_pcm *pcm;
-	struct snd_soc_component *component = NULL;
-	int err, i = 0;
-	char jack_name[NAME_SIZE];
-
-	if (list_empty(&ctx->hdmi_pcm_list))
-		return -EINVAL;
-
-	if (ctx->common_hdmi_codec_drv) {
-		pcm = list_first_entry(&ctx->hdmi_pcm_list, struct bxt_hdmi_pcm,
-				       head);
-		component = pcm->codec_dai->component;
-		return hda_dsp_hdmi_build_controls(card, component);
-	}
-
-	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
-		component = pcm->codec_dai->component;
-		snprintf(jack_name, sizeof(jack_name),
-			"HDMI/DP, pcm=%d Jack", pcm->device);
-		err = snd_soc_card_jack_new(card, jack_name,
-					SND_JACK_AVOUT, &broxton_hdmi[i]);
-
-		if (err)
-			return err;
-
-		err = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
-						&broxton_hdmi[i]);
-		if (err < 0)
-			return err;
-
-		i++;
-	}
-
-	return hdac_hdmi_jack_port_init(component, &card->dapm);
-}
-
-
-/* broxton audio machine driver for SPT + RT298S */
-static struct snd_soc_card broxton_rt298 = {
-	.name = "broxton-rt298",
-	.owner = THIS_MODULE,
-	.dai_link = broxton_rt298_dais,
-	.num_links = ARRAY_SIZE(broxton_rt298_dais),
-	.controls = broxton_controls,
-	.num_controls = ARRAY_SIZE(broxton_controls),
-	.dapm_widgets = broxton_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(broxton_widgets),
-	.dapm_routes = broxton_rt298_map,
-	.num_dapm_routes = ARRAY_SIZE(broxton_rt298_map),
-	.fully_routed = true,
-	.disable_route_checks = true,
-	.late_probe = bxt_card_late_probe,
-
-};
-
-static struct snd_soc_card geminilake_rt298 = {
-	.name = "geminilake-rt298",
-	.owner = THIS_MODULE,
-	.dai_link = broxton_rt298_dais,
-	.num_links = ARRAY_SIZE(broxton_rt298_dais),
-	.controls = broxton_controls,
-	.num_controls = ARRAY_SIZE(broxton_controls),
-	.dapm_widgets = broxton_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(broxton_widgets),
-	.dapm_routes = geminilake_rt298_map,
-	.num_dapm_routes = ARRAY_SIZE(geminilake_rt298_map),
-	.fully_routed = true,
-	.late_probe = bxt_card_late_probe,
-};
-
-static int broxton_audio_probe(struct platform_device *pdev)
-{
-	struct bxt_rt286_private *ctx;
-	struct snd_soc_card *card =
-			(struct snd_soc_card *)pdev->id_entry->driver_data;
-	struct snd_soc_acpi_mach *mach;
-	const char *platform_name;
-	int ret;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(broxton_rt298_dais); i++) {
-		if (card->dai_link[i].codecs->name &&
-		    !strncmp(card->dai_link[i].codecs->name, "i2c-INT343A:00",
-			     I2C_NAME_SIZE)) {
-			if (!strncmp(card->name, "broxton-rt298",
-				     PLATFORM_NAME_SIZE)) {
-				card->dai_link[i].name = "SSP5-Codec";
-				card->dai_link[i].cpus->dai_name = "SSP5 Pin";
-			} else if (!strncmp(card->name, "geminilake-rt298",
-					    PLATFORM_NAME_SIZE)) {
-				card->dai_link[i].name = "SSP2-Codec";
-				card->dai_link[i].cpus->dai_name = "SSP2 Pin";
-			}
-		}
-	}
-
-	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
-
-	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
-
-	card->dev = &pdev->dev;
-	snd_soc_card_set_drvdata(card, ctx);
-
-	/* override platform name, if required */
-	mach = pdev->dev.platform_data;
-	platform_name = mach->mach_params.platform;
-
-	ret = snd_soc_fixup_dai_links_platform_name(card,
-						    platform_name);
-	if (ret)
-		return ret;
-
-	ctx->common_hdmi_codec_drv = mach->mach_params.common_hdmi_codec_drv;
-
-	return devm_snd_soc_register_card(&pdev->dev, card);
-}
-
-static const struct platform_device_id bxt_board_ids[] = {
-	{ .name = "bxt_alc298s_i2s", .driver_data =
-				(unsigned long)&broxton_rt298 },
-	{ .name = "glk_alc298s_i2s", .driver_data =
-				(unsigned long)&geminilake_rt298 },
-	{}
-};
-MODULE_DEVICE_TABLE(platform, bxt_board_ids);
-
-static struct platform_driver broxton_audio = {
-	.probe = broxton_audio_probe,
-	.driver = {
-		.name = "bxt_alc298s_i2s",
-		.pm = &snd_soc_pm_ops,
-	},
-	.id_table = bxt_board_ids,
-};
-module_platform_driver(broxton_audio)
-
-/* Module information */
-MODULE_AUTHOR("Ramesh Babu <Ramesh.Babu@intel.com>");
-MODULE_AUTHOR("Senthilnathan Veppur <senthilnathanx.veppur@intel.com>");
-MODULE_DESCRIPTION("Intel SST Audio for Broxton");
-MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
-- 
2.25.1

