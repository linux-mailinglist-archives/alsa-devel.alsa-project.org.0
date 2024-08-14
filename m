Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC81951955
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2024 12:47:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FBA823DF;
	Wed, 14 Aug 2024 12:47:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FBA823DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723632453;
	bh=82upgUa1NZPeVwMaCrnZFNIdUf9gvWRTqyBNOtflUNQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HhtsLYF/WLejvEc1XNuqPo++Pm25PHhHVn8hvLy9MwPulOICEbaK9sV3IJpIaeu9n
	 t806CF8KPLVTGNFlHcrvsrJmOOEB7hYdcQuDhB6+AtsA/7CsYhYb+5NOi+Oyvr00eI
	 c6+fM0+cpyLlwCqErRWuapgXnScldgjcmcjiXDWc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B997BF805E3; Wed, 14 Aug 2024 12:46:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 522C0F805D9;
	Wed, 14 Aug 2024 12:46:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AB6CF80579; Wed, 14 Aug 2024 10:41:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 534A4F80580
	for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2024 10:40:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 534A4F80580
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dcdmFFF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723624829; x=1755160829;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=82upgUa1NZPeVwMaCrnZFNIdUf9gvWRTqyBNOtflUNQ=;
  b=dcdmFFF0+cdkvi67dIM7Cv5Qr5712y1J6/CQ2FwhDluSRUcLKTSOX0g/
   4GmNq+P5DJ7CP9qyxgwCbHuKsueO42aFimSwoX68Rc8ZPlEJqGwL7ROax
   BW3nC5yiGI5pqIChFu8s0qVVQoAr/iOG9Uz2XXVugq8xtTt1qmZ4d//V8
   HIJyu6WeLcyK5asASUoxF2APS3R0wABmhYqHLwUSDbcF1YiIvCJtIHVy5
   ODmnR0suQ9ux47ww/TxdFp4vXApFBIyaTYN7ZUqteEXZ6DWrzmHd1c85E
   L6fGS6GUtCWfZ4hM/vtVA4zDwn02x1MntjI++7jjCKAGxad9FSGOsCk62
   Q==;
X-CSE-ConnectionGUID: RLH/a0jaRpuX2Hn20de3VQ==
X-CSE-MsgGUID: XZLTr85sRfGNVpQ9Bzv+Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="24735249"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800";
   d="scan'208";a="24735249"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 01:40:26 -0700
X-CSE-ConnectionGUID: 2TcpANlBRQe3OmSNROu3Cg==
X-CSE-MsgGUID: Vv29dKrrTCeS9epyv6VrIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800";
   d="scan'208";a="63868012"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa004.jf.intel.com with ESMTP; 14 Aug 2024 01:40:23 -0700
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
Subject: [PATCH v2 09/14] ASoC: Intel: Remove kbl_da7219_max98357a board
 driver
Date: Wed, 14 Aug 2024 10:39:24 +0200
Message-Id: <20240814083929.1217319-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240814083929.1217319-1-cezary.rojewski@intel.com>
References: <20240814083929.1217319-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GLXZYKNUJL63O2ARBVBDUYSFNNQJKZQE
X-Message-ID-Hash: GLXZYKNUJL63O2ARBVBDUYSFNNQJKZQE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GLXZYKNUJL63O2ARBVBDUYSFNNQJKZQE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver has no users.

Succeeded by:
- avs_da7219 (./intel/avs/boards/da7219.c)
- avs_max98357a (./intel/avs/boards/max98357a.c)

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/boards/Kconfig                |  14 -
 sound/soc/intel/boards/Makefile               |   2 -
 sound/soc/intel/boards/kbl_da7219_max98357a.c | 688 ------------------
 3 files changed, 704 deletions(-)
 delete mode 100644 sound/soc/intel/boards/kbl_da7219_max98357a.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index b53678203e3f..3973f5c351d3 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -321,20 +321,6 @@ config SND_SOC_INTEL_SOF_WM8804_MACH
 
 endif ## SND_SOC_SOF_APOLLOLAKE
 
-if SND_SOC_INTEL_KBL
-
-config SND_SOC_INTEL_KBL_DA7219_MAX98357A_MACH
-	tristate "KBL with DA7219 and MAX98357A in I2S Mode"
-	depends on I2C && ACPI
-	depends on MFD_INTEL_LPSS || COMPILE_TEST
-	select SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
-	help
-	  This adds support for ASoC Onboard Codec I2S machine driver. This will
-	  create an alsa sound card for DA7219 + MAX98357A I2S audio codec.
-	  Say Y if you have such a device.
-
-endif ## SND_SOC_INTEL_KBL
-
 if SND_SOC_SOF_GEMINILAKE
 
 config SND_SOC_INTEL_GLK_DA7219_MAX98357A_MACH
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index ff8985783d13..37f301a302a4 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -21,7 +21,6 @@ snd-soc-sof_cs42l42-y := sof_cs42l42.o
 snd-soc-sof_es8336-y := sof_es8336.o
 snd-soc-sof_nau8825-y := sof_nau8825.o
 snd-soc-sof_da7219-y := sof_da7219.o
-snd-soc-kbl_da7219_max98357a-y := kbl_da7219_max98357a.o
 snd-soc-skl_rt286-y := skl_rt286.o
 snd-soc-skl_hda_dsp-y := skl_hda_dsp_generic.o skl_hda_dsp_common.o
 snd-skl_nau88l25_max98357a-y := skl_nau88l25_max98357a.o
@@ -52,7 +51,6 @@ obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_CX2072X_MACH) += snd-soc-sst-byt-cht-cx2072x.
 obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_DA7213_MACH) += snd-soc-sst-byt-cht-da7213.o
 obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_ES8316_MACH) += snd-soc-sst-byt-cht-es8316.o
 obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_NOCODEC_MACH) += snd-soc-sst-byt-cht-nocodec.o
-obj-$(CONFIG_SND_SOC_INTEL_KBL_DA7219_MAX98357A_MACH) += snd-soc-kbl_da7219_max98357a.o
 obj-$(CONFIG_SND_SOC_INTEL_SKL_RT286_MACH) += snd-soc-skl_rt286.o
 obj-$(CONFIG_SND_SOC_INTEL_SKL_NAU88L25_MAX98357A_MACH) += snd-skl_nau88l25_max98357a.o
 obj-$(CONFIG_SND_SOC_INTEL_SKL_NAU88L25_SSM4567_MACH) += snd-soc-skl_nau88l25_ssm4567.o
diff --git a/sound/soc/intel/boards/kbl_da7219_max98357a.c b/sound/soc/intel/boards/kbl_da7219_max98357a.c
deleted file mode 100644
index 154f6a74ed15..000000000000
--- a/sound/soc/intel/boards/kbl_da7219_max98357a.c
+++ /dev/null
@@ -1,688 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-// Copyright(c) 2017-18 Intel Corporation.
-
-/*
- * Intel Kabylake I2S Machine Driver with MAX98357A & DA7219 Codecs
- *
- * Modified from:
- *   Intel Kabylake I2S Machine driver supporting MAXIM98927 and
- *   RT5663 codecs
- */
-
-#include <linux/input.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <sound/core.h>
-#include <sound/jack.h>
-#include <sound/pcm.h>
-#include <sound/pcm_params.h>
-#include <sound/soc.h>
-#include "../../codecs/da7219.h"
-#include "../../codecs/hdac_hdmi.h"
-
-#define KBL_DIALOG_CODEC_DAI "da7219-hifi"
-#define KBL_MAXIM_CODEC_DAI "HiFi"
-#define MAXIM_DEV0_NAME "MX98357A:00"
-#define DUAL_CHANNEL 2
-#define QUAD_CHANNEL 4
-
-static struct snd_soc_card *kabylake_audio_card;
-static struct snd_soc_jack skylake_hdmi[3];
-
-struct kbl_hdmi_pcm {
-	struct list_head head;
-	struct snd_soc_dai *codec_dai;
-	int device;
-};
-
-struct kbl_codec_private {
-	struct snd_soc_jack kabylake_headset;
-	struct list_head hdmi_pcm_list;
-};
-
-enum {
-	KBL_DPCM_AUDIO_PB = 0,
-	KBL_DPCM_AUDIO_CP,
-	KBL_DPCM_AUDIO_REF_CP,
-	KBL_DPCM_AUDIO_DMIC_CP,
-	KBL_DPCM_AUDIO_HDMI1_PB,
-	KBL_DPCM_AUDIO_HDMI2_PB,
-	KBL_DPCM_AUDIO_HDMI3_PB,
-};
-
-static int platform_clock_control(struct snd_soc_dapm_widget *w,
-					struct snd_kcontrol *k, int  event)
-{
-	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct snd_soc_card *card = dapm->card;
-	struct snd_soc_dai *codec_dai;
-	int ret = 0;
-
-	codec_dai = snd_soc_card_get_codec_dai(card, KBL_DIALOG_CODEC_DAI);
-	if (!codec_dai) {
-		dev_err(card->dev, "Codec dai not found; Unable to set/unset codec pll\n");
-		return -EIO;
-	}
-
-	if (SND_SOC_DAPM_EVENT_OFF(event)) {
-		ret = snd_soc_dai_set_pll(codec_dai, 0,
-				     DA7219_SYSCLK_MCLK, 0, 0);
-		if (ret)
-			dev_err(card->dev, "failed to stop PLL: %d\n", ret);
-	} else if (SND_SOC_DAPM_EVENT_ON(event)) {
-		ret = snd_soc_dai_set_pll(codec_dai, 0,	DA7219_SYSCLK_PLL_SRM,
-				     0, DA7219_PLL_FREQ_OUT_98304);
-		if (ret)
-			dev_err(card->dev, "failed to start PLL: %d\n", ret);
-	}
-
-	return ret;
-}
-
-static const struct snd_kcontrol_new kabylake_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
-	SOC_DAPM_PIN_SWITCH("Headset Mic"),
-	SOC_DAPM_PIN_SWITCH("Spk"),
-	SOC_DAPM_PIN_SWITCH("Line Out"),
-};
-
-static const struct snd_soc_dapm_widget kabylake_widgets[] = {
-	SND_SOC_DAPM_HP("Headphone Jack", NULL),
-	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-	SND_SOC_DAPM_SPK("Spk", NULL),
-	SND_SOC_DAPM_LINE("Line Out", NULL),
-	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
-	SND_SOC_DAPM_SPK("HDMI1", NULL),
-	SND_SOC_DAPM_SPK("HDMI2", NULL),
-	SND_SOC_DAPM_SPK("HDMI3", NULL),
-	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
-			platform_clock_control, SND_SOC_DAPM_PRE_PMU |
-			SND_SOC_DAPM_POST_PMD),
-};
-
-static struct snd_soc_jack_pin jack_pins[] = {
-	{
-		.pin    = "Headphone Jack",
-		.mask   = SND_JACK_HEADPHONE,
-	},
-	{
-		.pin    = "Headset Mic",
-		.mask   = SND_JACK_MICROPHONE,
-	},
-	{
-		.pin    = "Line Out",
-		.mask   = SND_JACK_LINEOUT,
-	},
-};
-
-static const struct snd_soc_dapm_route kabylake_map[] = {
-	{ "Headphone Jack", NULL, "HPL" },
-	{ "Headphone Jack", NULL, "HPR" },
-
-	/* speaker */
-	{ "Spk", NULL, "Speaker" },
-
-	/* other jacks */
-	{ "MIC", NULL, "Headset Mic" },
-	{ "DMic", NULL, "SoC DMIC" },
-
-	{"HDMI1", NULL, "hif5-0 Output"},
-	{"HDMI2", NULL, "hif6-0 Output"},
-	{"HDMI3", NULL, "hif7-0 Output"},
-
-	/* CODEC BE connections */
-	{ "HiFi Playback", NULL, "ssp0 Tx" },
-	{ "ssp0 Tx", NULL, "codec0_out" },
-
-	{ "Playback", NULL, "ssp1 Tx" },
-	{ "ssp1 Tx", NULL, "codec1_out" },
-
-	{ "codec0_in", NULL, "ssp1 Rx" },
-	{ "ssp1 Rx", NULL, "Capture" },
-
-	/* DMIC */
-	{ "dmic01_hifi", NULL, "DMIC01 Rx" },
-	{ "DMIC01 Rx", NULL, "DMIC AIF" },
-
-	{ "hifi1", NULL, "iDisp1 Tx" },
-	{ "iDisp1 Tx", NULL, "iDisp1_out" },
-	{ "hifi2", NULL, "iDisp2 Tx" },
-	{ "iDisp2 Tx", NULL, "iDisp2_out" },
-	{ "hifi3", NULL, "iDisp3 Tx"},
-	{ "iDisp3 Tx", NULL, "iDisp3_out"},
-
-	{ "Headphone Jack", NULL, "Platform Clock" },
-	{ "Headset Mic", NULL, "Platform Clock" },
-	{ "Line Out", NULL, "Platform Clock" },
-};
-
-static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
-			struct snd_pcm_hw_params *params)
-{
-	struct snd_interval *rate = hw_param_interval(params,
-			SNDRV_PCM_HW_PARAM_RATE);
-	struct snd_interval *chan = hw_param_interval(params,
-			SNDRV_PCM_HW_PARAM_CHANNELS);
-	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
-
-	/* The ADSP will convert the FE rate to 48k, stereo */
-	rate->min = rate->max = 48000;
-	chan->min = chan->max = DUAL_CHANNEL;
-
-	/* set SSP to 24 bit */
-	snd_mask_none(fmt);
-	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
-
-	return 0;
-}
-
-static int kabylake_da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
-	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
-	struct snd_soc_jack *jack;
-	int ret;
-
-	/* Configure sysclk for codec */
-	ret = snd_soc_dai_set_sysclk(codec_dai, DA7219_CLKSRC_MCLK, 24576000,
-						SND_SOC_CLOCK_IN);
-	if (ret) {
-		dev_err(rtd->dev, "can't set codec sysclk configuration\n");
-		return ret;
-	}
-
-	/*
-	 * Headset buttons map to the google Reference headset.
-	 * These can be configured by userspace.
-	 */
-	ret = snd_soc_card_jack_new_pins(kabylake_audio_card, "Headset Jack",
-					 SND_JACK_HEADSET | SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-					 SND_JACK_BTN_2 | SND_JACK_BTN_3 | SND_JACK_LINEOUT,
-					 &ctx->kabylake_headset,
-					 jack_pins,
-					 ARRAY_SIZE(jack_pins));
-	if (ret) {
-		dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
-		return ret;
-	}
-
-	jack = &ctx->kabylake_headset;
-
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
-	snd_soc_component_set_jack(component, &ctx->kabylake_headset, NULL);
-
-	ret = snd_soc_dapm_ignore_suspend(&rtd->card->dapm, "SoC DMIC");
-	if (ret)
-		dev_err(rtd->dev, "SoC DMIC - Ignore suspend failed %d\n", ret);
-
-	return ret;
-}
-
-static int kabylake_hdmi_init(struct snd_soc_pcm_runtime *rtd, int device)
-{
-	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
-	struct kbl_hdmi_pcm *pcm;
-
-	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
-	if (!pcm)
-		return -ENOMEM;
-
-	pcm->device = device;
-	pcm->codec_dai = dai;
-
-	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
-
-	return 0;
-}
-
-static int kabylake_hdmi1_init(struct snd_soc_pcm_runtime *rtd)
-{
-	return kabylake_hdmi_init(rtd, KBL_DPCM_AUDIO_HDMI1_PB);
-}
-
-static int kabylake_hdmi2_init(struct snd_soc_pcm_runtime *rtd)
-{
-	return kabylake_hdmi_init(rtd, KBL_DPCM_AUDIO_HDMI2_PB);
-}
-
-static int kabylake_hdmi3_init(struct snd_soc_pcm_runtime *rtd)
-{
-	return kabylake_hdmi_init(rtd, KBL_DPCM_AUDIO_HDMI3_PB);
-}
-
-static int kabylake_da7219_fe_init(struct snd_soc_pcm_runtime *rtd)
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
-	DUAL_CHANNEL,
-};
-
-static const struct snd_pcm_hw_constraint_list constraints_channels = {
-	.count = ARRAY_SIZE(channels),
-	.list = channels,
-	.mask = 0,
-};
-
-static unsigned int channels_quad[] = {
-	QUAD_CHANNEL,
-};
-
-static struct snd_pcm_hw_constraint_list constraints_channels_quad = {
-	.count = ARRAY_SIZE(channels_quad),
-	.list = channels_quad,
-	.mask = 0,
-};
-
-static int kbl_fe_startup(struct snd_pcm_substream *substream)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-
-	/*
-	 * On this platform for PCM device we support,
-	 * 48Khz
-	 * stereo
-	 * 16 bit audio
-	 */
-
-	runtime->hw.channels_max = DUAL_CHANNEL;
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
-static const struct snd_soc_ops kabylake_da7219_fe_ops = {
-	.startup = kbl_fe_startup,
-};
-
-static int kabylake_dmic_fixup(struct snd_soc_pcm_runtime *rtd,
-		struct snd_pcm_hw_params *params)
-{
-	struct snd_interval *chan = hw_param_interval(params,
-				SNDRV_PCM_HW_PARAM_CHANNELS);
-
-	/*
-	 * set BE channel constraint as user FE channels
-	 */
-
-	if (params_channels(params) == 2)
-		chan->min = chan->max = 2;
-	else
-		chan->min = chan->max = 4;
-
-	return 0;
-}
-
-static int kabylake_dmic_startup(struct snd_pcm_substream *substream)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-
-	runtime->hw.channels_min = runtime->hw.channels_max = QUAD_CHANNEL;
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
-			&constraints_channels_quad);
-
-	return snd_pcm_hw_constraint_list(substream->runtime, 0,
-			SNDRV_PCM_HW_PARAM_RATE, &constraints_rates);
-}
-
-static const struct snd_soc_ops kabylake_dmic_ops = {
-	.startup = kabylake_dmic_startup,
-};
-
-static unsigned int rates_16000[] = {
-        16000,
-};
-
-static const struct snd_pcm_hw_constraint_list constraints_16000 = {
-        .count = ARRAY_SIZE(rates_16000),
-        .list  = rates_16000,
-};
-
-static const unsigned int ch_mono[] = {
-	1,
-};
-
-static const struct snd_pcm_hw_constraint_list constraints_refcap = {
-	.count = ARRAY_SIZE(ch_mono),
-	.list  = ch_mono,
-};
-
-static int kabylake_refcap_startup(struct snd_pcm_substream *substream)
-{
-	substream->runtime->hw.channels_max = 1;
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
-					SNDRV_PCM_HW_PARAM_CHANNELS,
-					&constraints_refcap);
-
-	return snd_pcm_hw_constraint_list(substream->runtime, 0,
-					SNDRV_PCM_HW_PARAM_RATE,
-					&constraints_16000);
-}
-
-static const struct snd_soc_ops skylake_refcap_ops = {
-	.startup = kabylake_refcap_startup,
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
-SND_SOC_DAILINK_DEF(ssp0_pin,
-	DAILINK_COMP_ARRAY(COMP_CPU("SSP0 Pin")));
-SND_SOC_DAILINK_DEF(ssp0_codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC(MAXIM_DEV0_NAME,
-				      KBL_MAXIM_CODEC_DAI)));
-
-SND_SOC_DAILINK_DEF(ssp1_pin,
-	DAILINK_COMP_ARRAY(COMP_CPU("SSP1 Pin")));
-SND_SOC_DAILINK_DEF(ssp1_codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-DLGS7219:00",
-				      KBL_DIALOG_CODEC_DAI)));
-
-SND_SOC_DAILINK_DEF(dmic_pin,
-	DAILINK_COMP_ARRAY(COMP_CPU("DMIC01 Pin")));
-SND_SOC_DAILINK_DEF(dmic_codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec", "dmic-hifi")));
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
-/* kabylake digital audio interface glue - connects codec <--> CPU */
-static struct snd_soc_dai_link kabylake_dais[] = {
-	/* Front End DAI links */
-	[KBL_DPCM_AUDIO_PB] = {
-		.name = "Kbl Audio Port",
-		.stream_name = "Audio",
-		.dynamic = 1,
-		.nonatomic = 1,
-		.init = kabylake_da7219_fe_init,
-		.trigger = {
-			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.ops = &kabylake_da7219_fe_ops,
-		SND_SOC_DAILINK_REG(system, dummy, platform),
-	},
-	[KBL_DPCM_AUDIO_CP] = {
-		.name = "Kbl Audio Capture Port",
-		.stream_name = "Audio Record",
-		.dynamic = 1,
-		.nonatomic = 1,
-		.trigger = {
-			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
-		.ops = &kabylake_da7219_fe_ops,
-		SND_SOC_DAILINK_REG(system, dummy, platform),
-	},
-	[KBL_DPCM_AUDIO_REF_CP] = {
-		.name = "Kbl Audio Reference cap",
-		.stream_name = "Wake on Voice",
-		.init = NULL,
-		.dpcm_capture = 1,
-		.nonatomic = 1,
-		.dynamic = 1,
-		.ops = &skylake_refcap_ops,
-		SND_SOC_DAILINK_REG(reference, dummy, platform),
-	},
-	[KBL_DPCM_AUDIO_DMIC_CP] = {
-		.name = "Kbl Audio DMIC cap",
-		.stream_name = "dmiccap",
-		.init = NULL,
-		.dpcm_capture = 1,
-		.nonatomic = 1,
-		.dynamic = 1,
-		.ops = &kabylake_dmic_ops,
-		SND_SOC_DAILINK_REG(dmic, dummy, platform),
-	},
-	[KBL_DPCM_AUDIO_HDMI1_PB] = {
-		.name = "Kbl HDMI Port1",
-		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
-		.init = NULL,
-		.trigger = {
-			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.nonatomic = 1,
-		.dynamic = 1,
-		SND_SOC_DAILINK_REG(hdmi1, dummy, platform),
-	},
-	[KBL_DPCM_AUDIO_HDMI2_PB] = {
-		.name = "Kbl HDMI Port2",
-		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
-		.init = NULL,
-		.trigger = {
-			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.nonatomic = 1,
-		.dynamic = 1,
-		SND_SOC_DAILINK_REG(hdmi2, dummy, platform),
-	},
-	[KBL_DPCM_AUDIO_HDMI3_PB] = {
-		.name = "Kbl HDMI Port3",
-		.stream_name = "Hdmi3",
-		.trigger = {
-			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
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
-		.dai_fmt = SND_SOC_DAIFMT_I2S |
-			SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBC_CFC,
-		.ignore_pmdown_time = 1,
-		.be_hw_params_fixup = kabylake_ssp_fixup,
-		.dpcm_playback = 1,
-		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
-	},
-	{
-		/* SSP1 - Codec */
-		.name = "SSP1-Codec",
-		.id = 1,
-		.no_pcm = 1,
-		.init = kabylake_da7219_codec_init,
-		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBC_CFC,
-		.ignore_pmdown_time = 1,
-		.be_hw_params_fixup = kabylake_ssp_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
-		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
-	},
-	{
-		.name = "dmic01",
-		.id = 2,
-		.be_hw_params_fixup = kabylake_dmic_fixup,
-		.ignore_suspend = 1,
-		.dpcm_capture = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
-	},
-	{
-		.name = "iDisp1",
-		.id = 3,
-		.dpcm_playback = 1,
-		.init = kabylake_hdmi1_init,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
-	},
-	{
-		.name = "iDisp2",
-		.id = 4,
-		.init = kabylake_hdmi2_init,
-		.dpcm_playback = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
-	},
-	{
-		.name = "iDisp3",
-		.id = 5,
-		.init = kabylake_hdmi3_init,
-		.dpcm_playback = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
-	},
-};
-
-#define NAME_SIZE	32
-static int kabylake_card_late_probe(struct snd_soc_card *card)
-{
-	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(card);
-	struct kbl_hdmi_pcm *pcm;
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
-				&skylake_hdmi[i]);
-		if (err < 0)
-			return err;
-
-		i++;
-
-	}
-
-	if (!component)
-		return -EINVAL;
-
-	return hdac_hdmi_jack_port_init(component, &card->dapm);
-}
-
-/* kabylake audio machine driver for SPT + DA7219 */
-static struct snd_soc_card kabylake_audio_card_da7219_m98357a = {
-	.name = "kblda7219max",
-	.owner = THIS_MODULE,
-	.dai_link = kabylake_dais,
-	.num_links = ARRAY_SIZE(kabylake_dais),
-	.controls = kabylake_controls,
-	.num_controls = ARRAY_SIZE(kabylake_controls),
-	.dapm_widgets = kabylake_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(kabylake_widgets),
-	.dapm_routes = kabylake_map,
-	.num_dapm_routes = ARRAY_SIZE(kabylake_map),
-	.fully_routed = true,
-	.disable_route_checks = true,
-	.late_probe = kabylake_card_late_probe,
-};
-
-static int kabylake_audio_probe(struct platform_device *pdev)
-{
-	struct kbl_codec_private *ctx;
-
-	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
-
-	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
-
-	kabylake_audio_card =
-		(struct snd_soc_card *)pdev->id_entry->driver_data;
-
-	kabylake_audio_card->dev = &pdev->dev;
-	snd_soc_card_set_drvdata(kabylake_audio_card, ctx);
-	return devm_snd_soc_register_card(&pdev->dev, kabylake_audio_card);
-}
-
-static const struct platform_device_id kbl_board_ids[] = {
-	{
-		.name = "kbl_da7219_mx98357a",
-		.driver_data =
-			(kernel_ulong_t)&kabylake_audio_card_da7219_m98357a,
-	},
-	{ }
-};
-MODULE_DEVICE_TABLE(platform, kbl_board_ids);
-
-static struct platform_driver kabylake_audio = {
-	.probe = kabylake_audio_probe,
-	.driver = {
-		.name = "kbl_da7219_max98357a",
-		.pm = &snd_soc_pm_ops,
-	},
-	.id_table = kbl_board_ids,
-};
-
-module_platform_driver(kabylake_audio)
-
-/* Module information */
-MODULE_DESCRIPTION("Audio Machine driver-DA7219 & MAX98357A in I2S mode");
-MODULE_AUTHOR("Naveen Manohar <naveen.m@intel.com>");
-MODULE_LICENSE("GPL v2");
-- 
2.25.1

