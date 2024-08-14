Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 535AF95196F
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2024 12:54:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6327F2190;
	Wed, 14 Aug 2024 12:53:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6327F2190
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723632849;
	bh=PUkQ0MvOxadj7/VsCqKSSn1F0CYlFMR/9K2Z8dzZmis=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZlmioVus5MBlbMewLgsceiPI93AJqXwb5YSzPV4YtywK91ibhDw9VlEsAxT2F1yH6
	 mjyBjtoQJburcGLSxRma1lYb65JZvYHP2fi9WZGXXqSGHDhrTkq++5aDPf+prg4nTK
	 EygHoY7YLNQ4LSG1M7lWEp+L2z2UU5f64x50Tfd0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37EFCF80602; Wed, 14 Aug 2024 12:53:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D942F80615;
	Wed, 14 Aug 2024 12:53:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB5DDF8047C; Wed, 14 Aug 2024 10:41:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 734C1F80423
	for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2024 10:40:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 734C1F80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=G10Do3Fd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723624833; x=1755160833;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PUkQ0MvOxadj7/VsCqKSSn1F0CYlFMR/9K2Z8dzZmis=;
  b=G10Do3FdQ3FyL5VpnEoN5HLBWXryQA16uKsTTYdezFMawQFEtzPal862
   Gey78brmVmNTVb6sANB9sI+r5bkOrj+LzS7hFZ8BeYCnEev0xGVCorJb6
   2UbfUbyZFpduPHpiRUO3TtgWTx3ggvbgEltAKUgGPVdokL8AypLVH5VFa
   VwS67Cytz5rMBgnoLMifVJyu+S7yyChydXqZh9/2HM53fFX/xVpgppabr
   yH0gmyH2yh2Al5amIBCgKIhUeHvufO9hl7D7oioJK4AkL8SBECEMrfhHo
   84eUCk4wn2NpvwlEYpGQbR5P79GrBDzpe+khRiUXSUxtvPb2p9UBv2shK
   g==;
X-CSE-ConnectionGUID: YfkSgeGwQvS9EbPiU5k/3g==
X-CSE-MsgGUID: E1SjVJ5oTquU5+lhLA8EWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="24735262"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800";
   d="scan'208";a="24735262"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 01:40:30 -0700
X-CSE-ConnectionGUID: bVx0X7uMT/6PQyUcmRfAxg==
X-CSE-MsgGUID: lq6bRoK3TnOjM2B7fQ7y0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800";
   d="scan'208";a="63868038"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa004.jf.intel.com with ESMTP; 14 Aug 2024 01:40:26 -0700
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
Subject: [PATCH v2 10/14] ASoC: Intel: Remove skl_rt286 board driver
Date: Wed, 14 Aug 2024 10:39:25 +0200
Message-Id: <20240814083929.1217319-11-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240814083929.1217319-1-cezary.rojewski@intel.com>
References: <20240814083929.1217319-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LYDQ7DZJBWYV6PFNO4AKXQTAIPNXY2CD
X-Message-ID-Hash: LYDQ7DZJBWYV6PFNO4AKXQTAIPNXY2CD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LYDQ7DZJBWYV6PFNO4AKXQTAIPNXY2CD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver has no users.

Succeeded by:
- avs_rt286 (./intel/avs/boards/rt286.c)

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/boards/Kconfig     |  13 -
 sound/soc/intel/boards/Makefile    |   2 -
 sound/soc/intel/boards/skl_rt286.c | 568 -----------------------------
 3 files changed, 583 deletions(-)
 delete mode 100644 sound/soc/intel/boards/skl_rt286.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 3973f5c351d3..03244ec1933f 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -254,19 +254,6 @@ endif ## SND_SST_ATOM_HIFI2_PLATFORM
 
 if SND_SOC_INTEL_SKL
 
-config SND_SOC_INTEL_SKL_RT286_MACH
-	tristate "SKL with RT286 I2S mode"
-	depends on I2C && ACPI
-	depends on MFD_INTEL_LPSS || COMPILE_TEST
-	select SND_SOC_RT286
-	select SND_SOC_DMIC
-	select SND_SOC_HDAC_HDMI
-	help
-	   This adds support for ASoC machine driver for Skylake platforms
-	   with RT286 I2S audio codec.
-	   Say Y or m if you have such a device.
-	   If unsure select "N".
-
 config SND_SOC_INTEL_SKL_NAU88L25_SSM4567_MACH
 	tristate "SKL with NAU88L25 and SSM4567 in I2S Mode"
 	depends on I2C && ACPI
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 37f301a302a4..3ef77c99ff09 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -21,7 +21,6 @@ snd-soc-sof_cs42l42-y := sof_cs42l42.o
 snd-soc-sof_es8336-y := sof_es8336.o
 snd-soc-sof_nau8825-y := sof_nau8825.o
 snd-soc-sof_da7219-y := sof_da7219.o
-snd-soc-skl_rt286-y := skl_rt286.o
 snd-soc-skl_hda_dsp-y := skl_hda_dsp_generic.o skl_hda_dsp_common.o
 snd-skl_nau88l25_max98357a-y := skl_nau88l25_max98357a.o
 snd-soc-skl_nau88l25_ssm4567-y := skl_nau88l25_ssm4567.o
@@ -51,7 +50,6 @@ obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_CX2072X_MACH) += snd-soc-sst-byt-cht-cx2072x.
 obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_DA7213_MACH) += snd-soc-sst-byt-cht-da7213.o
 obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_ES8316_MACH) += snd-soc-sst-byt-cht-es8316.o
 obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_NOCODEC_MACH) += snd-soc-sst-byt-cht-nocodec.o
-obj-$(CONFIG_SND_SOC_INTEL_SKL_RT286_MACH) += snd-soc-skl_rt286.o
 obj-$(CONFIG_SND_SOC_INTEL_SKL_NAU88L25_MAX98357A_MACH) += snd-skl_nau88l25_max98357a.o
 obj-$(CONFIG_SND_SOC_INTEL_SKL_NAU88L25_SSM4567_MACH) += snd-soc-skl_nau88l25_ssm4567.o
 obj-$(CONFIG_SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH) += snd-soc-skl_hda_dsp.o
diff --git a/sound/soc/intel/boards/skl_rt286.c b/sound/soc/intel/boards/skl_rt286.c
deleted file mode 100644
index 3ea03f814403..000000000000
--- a/sound/soc/intel/boards/skl_rt286.c
+++ /dev/null
@@ -1,568 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Intel Skylake I2S Machine Driver
- *
- * Copyright (C) 2014-2015, Intel Corporation
- *
- * Modified from:
- *   Intel Broadwell Wildcatpoint SST Audio
- *
- *   Copyright (C) 2013, Intel Corporation
- */
-
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <sound/core.h>
-#include <sound/pcm.h>
-#include <sound/soc.h>
-#include <sound/jack.h>
-#include <sound/pcm_params.h>
-#include "../../codecs/rt286.h"
-#include "../../codecs/hdac_hdmi.h"
-
-static struct snd_soc_jack skylake_headset;
-static struct snd_soc_jack skylake_hdmi[3];
-
-struct skl_hdmi_pcm {
-	struct list_head head;
-	struct snd_soc_dai *codec_dai;
-	int device;
-};
-
-struct skl_rt286_private {
-	struct list_head hdmi_pcm_list;
-};
-
-enum {
-	SKL_DPCM_AUDIO_PB = 0,
-	SKL_DPCM_AUDIO_DB_PB,
-	SKL_DPCM_AUDIO_CP,
-	SKL_DPCM_AUDIO_REF_CP,
-	SKL_DPCM_AUDIO_DMIC_CP,
-	SKL_DPCM_AUDIO_HDMI1_PB,
-	SKL_DPCM_AUDIO_HDMI2_PB,
-	SKL_DPCM_AUDIO_HDMI3_PB,
-};
-
-/* Headset jack detection DAPM pins */
-static struct snd_soc_jack_pin skylake_headset_pins[] = {
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
-static const struct snd_kcontrol_new skylake_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Speaker"),
-	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
-	SOC_DAPM_PIN_SWITCH("Mic Jack"),
-};
-
-static const struct snd_soc_dapm_widget skylake_widgets[] = {
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
-static const struct snd_soc_dapm_route skylake_rt286_map[] = {
-	/* speaker */
-	{"Speaker", NULL, "SPOR"},
-	{"Speaker", NULL, "SPOL"},
-
-	/* HP jack connectors - unknown if we have jack deteck */
-	{"Headphone Jack", NULL, "HPO Pin"},
-
-	/* other jacks */
-	{"MIC1", NULL, "Mic Jack"},
-
-	/* digital mics */
-	{"DMIC1 Pin", NULL, "DMIC2"},
-	{"DMic", NULL, "SoC DMIC"},
-
-	/* CODEC BE connections */
-	{ "AIF1 Playback", NULL, "ssp0 Tx"},
-	{ "ssp0 Tx", NULL, "codec0_out"},
-	{ "ssp0 Tx", NULL, "codec1_out"},
-
-	{ "codec0_in", NULL, "ssp0 Rx" },
-	{ "codec1_in", NULL, "ssp0 Rx" },
-	{ "ssp0 Rx", NULL, "AIF1 Capture" },
-
-	{ "dmic01_hifi", NULL, "DMIC01 Rx" },
-	{ "DMIC01 Rx", NULL, "DMIC AIF" },
-
-	{ "hifi3", NULL, "iDisp3 Tx"},
-	{ "iDisp3 Tx", NULL, "iDisp3_out"},
-	{ "hifi2", NULL, "iDisp2 Tx"},
-	{ "iDisp2 Tx", NULL, "iDisp2_out"},
-	{ "hifi1", NULL, "iDisp1 Tx"},
-	{ "iDisp1 Tx", NULL, "iDisp1_out"},
-
-};
-
-static int skylake_rt286_fe_init(struct snd_soc_pcm_runtime *rtd)
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
-static int skylake_rt286_codec_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
-	int ret;
-
-	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset",
-		SND_JACK_HEADSET | SND_JACK_BTN_0,
-		&skylake_headset,
-		skylake_headset_pins, ARRAY_SIZE(skylake_headset_pins));
-
-	if (ret)
-		return ret;
-
-	snd_soc_component_set_jack(component, &skylake_headset, NULL);
-
-	snd_soc_dapm_ignore_suspend(&rtd->card->dapm, "SoC DMIC");
-
-	return 0;
-}
-
-static int skylake_hdmi_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct skl_rt286_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
-	struct skl_hdmi_pcm *pcm;
-
-	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
-	if (!pcm)
-		return -ENOMEM;
-
-	pcm->device = SKL_DPCM_AUDIO_HDMI1_PB + dai->id;
-	pcm->codec_dai = dai;
-
-	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
-
-	return 0;
-}
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
-static int skl_fe_startup(struct snd_pcm_substream *substream)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-
-	/*
-	 * on this platform for PCM device we support,
-	 *	48Khz
-	 *	stereo
-	 *	16 bit audio
-	 */
-
-	runtime->hw.channels_max = 2;
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
-					   &constraints_channels);
-
-	runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
-	snd_pcm_hw_constraint_msbits(runtime, 0, 16, 16);
-
-	snd_pcm_hw_constraint_list(runtime, 0,
-				SNDRV_PCM_HW_PARAM_RATE, &constraints_rates);
-
-	return 0;
-}
-
-static const struct snd_soc_ops skylake_rt286_fe_ops = {
-	.startup = skl_fe_startup,
-};
-
-static int skylake_ssp0_fixup(struct snd_soc_pcm_runtime *rtd,
-			struct snd_pcm_hw_params *params)
-{
-	struct snd_interval *rate = hw_param_interval(params,
-			SNDRV_PCM_HW_PARAM_RATE);
-	struct snd_interval *chan = hw_param_interval(params,
-						SNDRV_PCM_HW_PARAM_CHANNELS);
-	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
-
-	/* The output is 48KHz, stereo, 16bits */
-	rate->min = rate->max = 48000;
-	chan->min = chan->max = 2;
-
-	/* set SSP0 to 24 bit */
-	snd_mask_none(fmt);
-	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
-	return 0;
-}
-
-static int skylake_rt286_hw_params(struct snd_pcm_substream *substream,
-	struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
-	int ret;
-
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT286_SCLK_S_PLL, 24000000,
-		SND_SOC_CLOCK_IN);
-	if (ret < 0)
-		dev_err(rtd->dev, "set codec sysclk failed: %d\n", ret);
-
-	return ret;
-}
-
-static const struct snd_soc_ops skylake_rt286_ops = {
-	.hw_params = skylake_rt286_hw_params,
-};
-
-static int skylake_dmic_fixup(struct snd_soc_pcm_runtime *rtd,
-				struct snd_pcm_hw_params *params)
-{
-	struct snd_interval *chan = hw_param_interval(params,
-						SNDRV_PCM_HW_PARAM_CHANNELS);
-	if (params_channels(params) == 2)
-		chan->min = chan->max = 2;
-	else
-		chan->min = chan->max = 4;
-
-	return 0;
-}
-
-static const unsigned int channels_dmic[] = {
-	2, 4,
-};
-
-static const struct snd_pcm_hw_constraint_list constraints_dmic_channels = {
-	.count = ARRAY_SIZE(channels_dmic),
-	.list = channels_dmic,
-	.mask = 0,
-};
-
-static int skylake_dmic_startup(struct snd_pcm_substream *substream)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-
-	runtime->hw.channels_max = 4;
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
-					   &constraints_dmic_channels);
-
-	return snd_pcm_hw_constraint_list(substream->runtime, 0,
-			SNDRV_PCM_HW_PARAM_RATE, &constraints_rates);
-}
-
-static const struct snd_soc_ops skylake_dmic_ops = {
-	.startup = skylake_dmic_startup,
-};
-
-SND_SOC_DAILINK_DEF(dummy,
-	DAILINK_COMP_ARRAY(COMP_DUMMY()));
-
-SND_SOC_DAILINK_DEF(system,
-	DAILINK_COMP_ARRAY(COMP_CPU("System Pin")));
-
-SND_SOC_DAILINK_DEF(deepbuffer,
-	DAILINK_COMP_ARRAY(COMP_CPU("Deepbuffer Pin")));
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
-SND_SOC_DAILINK_DEF(ssp0_pin,
-	DAILINK_COMP_ARRAY(COMP_CPU("SSP0 Pin")));
-SND_SOC_DAILINK_DEF(ssp0_codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-INT343A:00", "rt286-aif1")));
-
-SND_SOC_DAILINK_DEF(dmic01_pin,
-	DAILINK_COMP_ARRAY(COMP_CPU("DMIC01 Pin")));
-SND_SOC_DAILINK_DEF(dmic_codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec", "dmic-hifi")));
-
-SND_SOC_DAILINK_DEF(idisp1_pin,
-	DAILINK_COMP_ARRAY(COMP_CPU("iDisp1 Pin")));
-SND_SOC_DAILINK_DEF(idisp1_codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi1")));
-
-SND_SOC_DAILINK_DEF(idisp2_pin,
-	DAILINK_COMP_ARRAY(COMP_CPU("iDisp2 Pin")));
-SND_SOC_DAILINK_DEF(idisp2_codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi2")));
-
-SND_SOC_DAILINK_DEF(idisp3_pin,
-	DAILINK_COMP_ARRAY(COMP_CPU("iDisp3 Pin")));
-SND_SOC_DAILINK_DEF(idisp3_codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi3")));
-
-SND_SOC_DAILINK_DEF(platform,
-	DAILINK_COMP_ARRAY(COMP_PLATFORM("0000:00:1f.3")));
-
-/* skylake digital audio interface glue - connects codec <--> CPU */
-static struct snd_soc_dai_link skylake_rt286_dais[] = {
-	/* Front End DAI links */
-	[SKL_DPCM_AUDIO_PB] = {
-		.name = "Skl Audio Port",
-		.stream_name = "Audio",
-		.nonatomic = 1,
-		.dynamic = 1,
-		.init = skylake_rt286_fe_init,
-		.trigger = {
-			SND_SOC_DPCM_TRIGGER_POST,
-			SND_SOC_DPCM_TRIGGER_POST
-		},
-		.dpcm_playback = 1,
-		.ops = &skylake_rt286_fe_ops,
-		SND_SOC_DAILINK_REG(system, dummy, platform),
-	},
-	[SKL_DPCM_AUDIO_DB_PB] = {
-		.name = "Skl Deepbuffer Port",
-		.stream_name = "Deep Buffer Audio",
-		.nonatomic = 1,
-		.dynamic = 1,
-		.trigger = {
-			SND_SOC_DPCM_TRIGGER_POST,
-			SND_SOC_DPCM_TRIGGER_POST
-		},
-		.dpcm_playback = 1,
-		.ops = &skylake_rt286_fe_ops,
-		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
-	},
-	[SKL_DPCM_AUDIO_CP] = {
-		.name = "Skl Audio Capture Port",
-		.stream_name = "Audio Record",
-		.nonatomic = 1,
-		.dynamic = 1,
-		.trigger = {
-			SND_SOC_DPCM_TRIGGER_POST,
-			SND_SOC_DPCM_TRIGGER_POST
-		},
-		.dpcm_capture = 1,
-		.ops = &skylake_rt286_fe_ops,
-		SND_SOC_DAILINK_REG(system, dummy, platform),
-	},
-	[SKL_DPCM_AUDIO_REF_CP] = {
-		.name = "Skl Audio Reference cap",
-		.stream_name = "refcap",
-		.init = NULL,
-		.dpcm_capture = 1,
-		.nonatomic = 1,
-		.dynamic = 1,
-		SND_SOC_DAILINK_REG(reference, dummy, platform),
-	},
-	[SKL_DPCM_AUDIO_DMIC_CP] = {
-		.name = "Skl Audio DMIC cap",
-		.stream_name = "dmiccap",
-		.init = NULL,
-		.dpcm_capture = 1,
-		.nonatomic = 1,
-		.dynamic = 1,
-		.ops = &skylake_dmic_ops,
-		SND_SOC_DAILINK_REG(dmic, dummy, platform),
-	},
-	[SKL_DPCM_AUDIO_HDMI1_PB] = {
-		.name = "Skl HDMI Port1",
-		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
-		.init = NULL,
-		.nonatomic = 1,
-		.dynamic = 1,
-		SND_SOC_DAILINK_REG(hdmi1, dummy, platform),
-	},
-	[SKL_DPCM_AUDIO_HDMI2_PB] = {
-		.name = "Skl HDMI Port2",
-		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
-		.init = NULL,
-		.nonatomic = 1,
-		.dynamic = 1,
-		SND_SOC_DAILINK_REG(hdmi2, dummy, platform),
-	},
-	[SKL_DPCM_AUDIO_HDMI3_PB] = {
-		.name = "Skl HDMI Port3",
-		.stream_name = "Hdmi3",
-		.dpcm_playback = 1,
-		.init = NULL,
-		.nonatomic = 1,
-		.dynamic = 1,
-		SND_SOC_DAILINK_REG(hdmi3, dummy, platform),
-	},
-
-	/* Back End DAI links */
-	{
-		/* SSP0 - Codec */
-		.name = "SSP0-Codec",
-		.id = 0,
-		.no_pcm = 1,
-		.init = skylake_rt286_codec_init,
-		.dai_fmt = SND_SOC_DAIFMT_I2S |
-			SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBC_CFC,
-		.ignore_pmdown_time = 1,
-		.be_hw_params_fixup = skylake_ssp0_fixup,
-		.ops = &skylake_rt286_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
-		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
-	},
-	{
-		.name = "dmic01",
-		.id = 1,
-		.be_hw_params_fixup = skylake_dmic_fixup,
-		.ignore_suspend = 1,
-		.dpcm_capture = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(dmic01_pin, dmic_codec, platform),
-	},
-	{
-		.name = "iDisp1",
-		.id = 2,
-		.init = skylake_hdmi_init,
-		.dpcm_playback = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
-	},
-	{
-		.name = "iDisp2",
-		.id = 3,
-		.init = skylake_hdmi_init,
-		.dpcm_playback = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
-	},
-	{
-		.name = "iDisp3",
-		.id = 4,
-		.init = skylake_hdmi_init,
-		.dpcm_playback = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
-	},
-};
-
-#define NAME_SIZE	32
-static int skylake_card_late_probe(struct snd_soc_card *card)
-{
-	struct skl_rt286_private *ctx = snd_soc_card_get_drvdata(card);
-	struct skl_hdmi_pcm *pcm;
-	struct snd_soc_component *component = NULL;
-	int err, i = 0;
-	char jack_name[NAME_SIZE];
-
-	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
-		component = pcm->codec_dai->component;
-		snprintf(jack_name, sizeof(jack_name),
-			"HDMI/DP, pcm=%d Jack", pcm->device);
-		err = snd_soc_card_jack_new(card, jack_name,
-					SND_JACK_AVOUT, &skylake_hdmi[i]);
-
-		if (err)
-			return err;
-
-		err = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
-						&skylake_hdmi[i]);
-		if (err < 0)
-			return err;
-
-		i++;
-	}
-
-	if (!component)
-		return -EINVAL;
-
-	return hdac_hdmi_jack_port_init(component, &card->dapm);
-}
-
-/* skylake audio machine driver for SPT + RT286S */
-static struct snd_soc_card skylake_rt286 = {
-	.name = "skylake-rt286",
-	.owner = THIS_MODULE,
-	.dai_link = skylake_rt286_dais,
-	.num_links = ARRAY_SIZE(skylake_rt286_dais),
-	.controls = skylake_controls,
-	.num_controls = ARRAY_SIZE(skylake_controls),
-	.dapm_widgets = skylake_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(skylake_widgets),
-	.dapm_routes = skylake_rt286_map,
-	.num_dapm_routes = ARRAY_SIZE(skylake_rt286_map),
-	.fully_routed = true,
-	.disable_route_checks = true,
-	.late_probe = skylake_card_late_probe,
-};
-
-static int skylake_audio_probe(struct platform_device *pdev)
-{
-	struct skl_rt286_private *ctx;
-
-	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
-
-	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
-
-	skylake_rt286.dev = &pdev->dev;
-	snd_soc_card_set_drvdata(&skylake_rt286, ctx);
-
-	return devm_snd_soc_register_card(&pdev->dev, &skylake_rt286);
-}
-
-static const struct platform_device_id skl_board_ids[] = {
-	{ .name = "skl_alc286s_i2s" },
-	{ .name = "kbl_alc286s_i2s" },
-	{ }
-};
-MODULE_DEVICE_TABLE(platform, skl_board_ids);
-
-static struct platform_driver skylake_audio = {
-	.probe = skylake_audio_probe,
-	.driver = {
-		.name = "skl_alc286s_i2s",
-		.pm = &snd_soc_pm_ops,
-	},
-	.id_table = skl_board_ids,
-
-};
-
-module_platform_driver(skylake_audio)
-
-/* Module information */
-MODULE_AUTHOR("Omair Mohammed Abdullah <omair.m.abdullah@intel.com>");
-MODULE_DESCRIPTION("Intel SST Audio for Skylake");
-MODULE_LICENSE("GPL v2");
-- 
2.25.1

