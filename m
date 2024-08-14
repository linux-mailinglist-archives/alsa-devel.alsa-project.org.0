Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D053F951966
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2024 12:53:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C60F12344;
	Wed, 14 Aug 2024 12:53:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C60F12344
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723632813;
	bh=GNGjIlgW4kApnwQA/RclUH088CvETCCFQ/gS7I5AZa0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=esGXsAjeeoPtQUP7lcDXxTDDCgoChRnFyTIRX6L5u6Vb6Fxpag9q2UAe6ndpsc9z8
	 e/scAPi/U6LmhHNcSW+3yYsWuRWI4+vcFO09lDHo2qZDaA75gPzBxRLyI4TL6dyTmy
	 6PXkKa5yiIydpVKKj9YXQnG6/lWzLxdcU0CyJI6Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79BECF805B5; Wed, 14 Aug 2024 12:53:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63EEFF805AC;
	Wed, 14 Aug 2024 12:53:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F7DEF8047C; Wed, 14 Aug 2024 10:41:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F675F8049C
	for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2024 10:40:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F675F8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=oGvpBStx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723624813; x=1755160813;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GNGjIlgW4kApnwQA/RclUH088CvETCCFQ/gS7I5AZa0=;
  b=oGvpBStxHuT86EJypkOYJ4iFa9C2kJZO4ij0LHmjzC6Srvgmarr7zkFl
   nAizFMQ2mbsu9MyjHR32ESvXa70zL1QK955l8nWxN21HsQ+5qQ2iiPuuV
   KMTTlyiGMCAoZdNbco9exdEvpusaOv97s2Ywcv+hVqqXg70VmpTSVq3iS
   Mx0XrruCEtmVwZGDTBfL7TTGLkhz55fsrlbyND/LH4VMYowiNdWhrXSEt
   WkaO3b2tCtDCPHe40KyipEaCLaGJII293QQIFBZm8Sr3ZZ6RDtz7hh3H2
   fVxlJz6wE9qpApHBbvWqHr0sC5UgS9yGlzHAIMty8643XUpWWshMPmmpQ
   Q==;
X-CSE-ConnectionGUID: OW+GwEjMTY60h1UnEispTw==
X-CSE-MsgGUID: c9c23zVPQVaqJLo2cn+lRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="24735147"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800";
   d="scan'208";a="24735147"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 01:40:10 -0700
X-CSE-ConnectionGUID: w62Mrhm5TMeFVy81OA9ZNg==
X-CSE-MsgGUID: dsmOPKmDRcSngj56UlqGkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800";
   d="scan'208";a="63867935"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa004.jf.intel.com with ESMTP; 14 Aug 2024 01:40:06 -0700
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
Subject: [PATCH v2 04/14] ASoC: Intel: Remove bxt_da7219_max98357a board
 driver
Date: Wed, 14 Aug 2024 10:39:19 +0200
Message-Id: <20240814083929.1217319-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240814083929.1217319-1-cezary.rojewski@intel.com>
References: <20240814083929.1217319-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OL6MJEX23NP3UCUQQ4QU4FAHCZSY66QG
X-Message-ID-Hash: OL6MJEX23NP3UCUQQ4QU4FAHCZSY66QG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OL6MJEX23NP3UCUQQ4QU4FAHCZSY66QG/>
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
 sound/soc/intel/boards/Kconfig                |  16 -
 sound/soc/intel/boards/Makefile               |   2 -
 sound/soc/intel/boards/bxt_da7219_max98357a.c | 720 ------------------
 3 files changed, 738 deletions(-)
 delete mode 100644 sound/soc/intel/boards/bxt_da7219_max98357a.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 0892f2c19ade..fb1da74451c1 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -305,22 +305,6 @@ config SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
 	select SND_SOC_HDAC_HDMI
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 
-if SND_SOC_INTEL_APL
-
-config SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH
-	tristate "Broxton with DA7219 and MAX98357A in I2S Mode"
-	depends on I2C && ACPI
-	depends on MFD_INTEL_LPSS || COMPILE_TEST
-	depends on SND_HDA_CODEC_HDMI
-	select SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
-	help
-	   This adds support for ASoC machine driver for Broxton-P platforms
-	   with DA7219 + MAX98357A I2S audio codec.
-	   Say Y or m if you have such a device. This is a recommended option.
-	   If unsure select "N".
-
-endif ## SND_SOC_INTEL_APL
-
 if SND_SOC_SOF_APOLLOLAKE
 
 config SND_SOC_INTEL_SOF_WM8804_MACH
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index ae758a8aa61d..a1d53d1eac13 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -3,7 +3,6 @@ snd-soc-hsw-rt5640-y := hsw_rt5640.o
 snd-soc-sst-bdw-rt5650-mach-y := bdw-rt5650.o
 snd-soc-sst-bdw-rt5677-mach-y := bdw-rt5677.o
 snd-soc-bdw-rt286-y := bdw_rt286.o
-snd-soc-sst-bxt-da7219_max98357a-y := bxt_da7219_max98357a.o
 snd-soc-sst-sof-pcm512x-y := sof_pcm512x.o
 snd-soc-sst-sof-wm8804-y := sof_wm8804.o
 snd-soc-sst-bytcr-rt5640-y := bytcr_rt5640.o
@@ -41,7 +40,6 @@ obj-$(CONFIG_SND_SOC_INTEL_SOF_ES8336_MACH) += snd-soc-sof_es8336.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_NAU8825_MACH) += snd-soc-sof_nau8825.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_DA7219_MACH) += snd-soc-sof_da7219.o
 obj-$(CONFIG_SND_SOC_INTEL_HASWELL_MACH) += snd-soc-hsw-rt5640.o
-obj-$(CONFIG_SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH) += snd-soc-sst-bxt-da7219_max98357a.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_PCM512x_MACH) += snd-soc-sst-sof-pcm512x.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_WM8804_MACH) += snd-soc-sst-sof-wm8804.o
 obj-$(CONFIG_SND_SOC_INTEL_BROADWELL_MACH) += snd-soc-bdw-rt286.o
diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
deleted file mode 100644
index e1082bfe5ca9..000000000000
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ /dev/null
@@ -1,720 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Intel Broxton-P I2S Machine Driver
- *
- * Copyright (C) 2016, Intel Corporation
- *
- * Modified from:
- *   Intel Skylake I2S Machine driver
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
-#include <sound/soc-acpi.h>
-#include "../../codecs/hdac_hdmi.h"
-#include "../../codecs/da7219.h"
-#include "../common/soc-intel-quirks.h"
-#include "hda_dsp_common.h"
-
-#define BXT_DIALOG_CODEC_DAI	"da7219-hifi"
-#define BXT_MAXIM_CODEC_DAI	"HiFi"
-#define DUAL_CHANNEL		2
-#define QUAD_CHANNEL		4
-
-static struct snd_soc_jack broxton_headset;
-static struct snd_soc_jack broxton_hdmi[3];
-
-struct bxt_hdmi_pcm {
-	struct list_head head;
-	struct snd_soc_dai *codec_dai;
-	int device;
-};
-
-struct bxt_card_private {
-	struct list_head hdmi_pcm_list;
-	bool common_hdmi_codec_drv;
-};
-
-enum {
-	BXT_DPCM_AUDIO_PB = 0,
-	BXT_DPCM_AUDIO_CP,
-	BXT_DPCM_AUDIO_HS_PB,
-	BXT_DPCM_AUDIO_REF_CP,
-	BXT_DPCM_AUDIO_DMIC_CP,
-	BXT_DPCM_AUDIO_HDMI1_PB,
-	BXT_DPCM_AUDIO_HDMI2_PB,
-	BXT_DPCM_AUDIO_HDMI3_PB,
-};
-
-static int platform_clock_control(struct snd_soc_dapm_widget *w,
-	struct snd_kcontrol *k, int  event)
-{
-	int ret = 0;
-	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct snd_soc_card *card = dapm->card;
-	struct snd_soc_dai *codec_dai;
-
-	codec_dai = snd_soc_card_get_codec_dai(card, BXT_DIALOG_CODEC_DAI);
-	if (!codec_dai) {
-		dev_err(card->dev, "Codec dai not found; Unable to set/unset codec pll\n");
-		return -EIO;
-	}
-
-	if (SND_SOC_DAPM_EVENT_OFF(event)) {
-		ret = snd_soc_dai_set_pll(codec_dai, 0,
-			DA7219_SYSCLK_MCLK, 0, 0);
-		if (ret)
-			dev_err(card->dev, "failed to stop PLL: %d\n", ret);
-	} else if(SND_SOC_DAPM_EVENT_ON(event)) {
-		ret = snd_soc_dai_set_pll(codec_dai, 0,
-			DA7219_SYSCLK_PLL_SRM, 0, DA7219_PLL_FREQ_OUT_98304);
-		if (ret)
-			dev_err(card->dev, "failed to start PLL: %d\n", ret);
-	}
-
-	return ret;
-}
-
-static const struct snd_kcontrol_new broxton_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
-	SOC_DAPM_PIN_SWITCH("Headset Mic"),
-	SOC_DAPM_PIN_SWITCH("Line Out"),
-	SOC_DAPM_PIN_SWITCH("Spk"),
-};
-
-static const struct snd_soc_dapm_widget broxton_widgets[] = {
-	SND_SOC_DAPM_HP("Headphone Jack", NULL),
-	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-	SND_SOC_DAPM_LINE("Line Out", NULL),
-	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
-	SND_SOC_DAPM_SPK("HDMI1", NULL),
-	SND_SOC_DAPM_SPK("HDMI2", NULL),
-	SND_SOC_DAPM_SPK("HDMI3", NULL),
-	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
-			platform_clock_control,	SND_SOC_DAPM_POST_PMD|SND_SOC_DAPM_PRE_PMU),
-	SND_SOC_DAPM_SPK("Spk", NULL),
-};
-
-static const struct snd_soc_dapm_route audio_map[] = {
-	/* HP jack connectors - unknown if we have jack detection */
-	{"Headphone Jack", NULL, "HPL"},
-	{"Headphone Jack", NULL, "HPR"},
-
-	/* other jacks */
-	{"MIC", NULL, "Headset Mic"},
-
-	/* digital mics */
-	{"DMic", NULL, "SoC DMIC"},
-
-	/* CODEC BE connections */
-	{"HDMI1", NULL, "hif5-0 Output"},
-	{"HDMI2", NULL, "hif6-0 Output"},
-	{"HDMI2", NULL, "hif7-0 Output"},
-
-	{"hifi3", NULL, "iDisp3 Tx"},
-	{"iDisp3 Tx", NULL, "iDisp3_out"},
-	{"hifi2", NULL, "iDisp2 Tx"},
-	{"iDisp2 Tx", NULL, "iDisp2_out"},
-	{"hifi1", NULL, "iDisp1 Tx"},
-	{"iDisp1 Tx", NULL, "iDisp1_out"},
-
-	/* DMIC */
-	{"dmic01_hifi", NULL, "DMIC01 Rx"},
-	{"DMIC01 Rx", NULL, "DMIC AIF"},
-
-	{ "Headphone Jack", NULL, "Platform Clock" },
-	{ "Headset Mic", NULL, "Platform Clock" },
-	{ "Line Out", NULL, "Platform Clock" },
-
-	/* speaker */
-	{"Spk", NULL, "Speaker"},
-
-	{"HiFi Playback", NULL, "ssp5 Tx"},
-	{"ssp5 Tx", NULL, "codec0_out"},
-
-	{"Playback", NULL, "ssp1 Tx"},
-	{"ssp1 Tx", NULL, "codec1_out"},
-
-	{"codec0_in", NULL, "ssp1 Rx"},
-	{"ssp1 Rx", NULL, "Capture"},
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
-static int broxton_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
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
-static int broxton_da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
-{
-	int ret;
-	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
-	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
-	int clk_freq;
-
-	/* Configure sysclk for codec */
-	clk_freq = 19200000;
-
-	ret = snd_soc_dai_set_sysclk(codec_dai, DA7219_CLKSRC_MCLK, clk_freq,
-				     SND_SOC_CLOCK_IN);
-
-	if (ret) {
-		dev_err(rtd->dev, "can't set codec sysclk configuration\n");
-		return ret;
-	}
-
-	/*
-	 * Headset buttons map to the google Reference headset.
-	 * These can be configured by userspace.
-	 */
-	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
-					 SND_JACK_HEADSET | SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-					 SND_JACK_BTN_2 | SND_JACK_BTN_3 | SND_JACK_LINEOUT,
-					 &broxton_headset,
-					 jack_pins,
-					 ARRAY_SIZE(jack_pins));
-	if (ret) {
-		dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
-		return ret;
-	}
-
-	snd_jack_set_key(broxton_headset.jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
-	snd_jack_set_key(broxton_headset.jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
-	snd_jack_set_key(broxton_headset.jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
-	snd_jack_set_key(broxton_headset.jack, SND_JACK_BTN_3,
-			 KEY_VOICECOMMAND);
-
-	snd_soc_component_set_jack(component, &broxton_headset, NULL);
-
-	snd_soc_dapm_ignore_suspend(&rtd->card->dapm, "SoC DMIC");
-
-	return ret;
-}
-
-static int broxton_hdmi_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct bxt_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
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
-static int broxton_da7219_fe_init(struct snd_soc_pcm_runtime *rtd)
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
-static const unsigned int channels_quad[] = {
-	QUAD_CHANNEL,
-};
-
-static const struct snd_pcm_hw_constraint_list constraints_channels_quad = {
-	.count = ARRAY_SIZE(channels_quad),
-	.list = channels_quad,
-	.mask = 0,
-};
-
-static int bxt_fe_startup(struct snd_pcm_substream *substream)
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
-static const struct snd_soc_ops broxton_da7219_fe_ops = {
-	.startup = bxt_fe_startup,
-};
-
-static int broxton_dmic_fixup(struct snd_soc_pcm_runtime *rtd,
-			struct snd_pcm_hw_params *params)
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
-static int broxton_dmic_startup(struct snd_pcm_substream *substream)
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
-static const struct snd_soc_ops broxton_dmic_ops = {
-	.startup = broxton_dmic_startup,
-};
-
-static const unsigned int rates_16000[] = {
-	16000,
-};
-
-static const struct snd_pcm_hw_constraint_list constraints_16000 = {
-	.count = ARRAY_SIZE(rates_16000),
-	.list  = rates_16000,
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
-static int broxton_refcap_startup(struct snd_pcm_substream *substream)
-{
-	substream->runtime->hw.channels_max = 1;
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
-				   SNDRV_PCM_HW_PARAM_CHANNELS,
-				   &constraints_refcap);
-
-	return snd_pcm_hw_constraint_list(substream->runtime, 0,
-			SNDRV_PCM_HW_PARAM_RATE,
-			&constraints_16000);
-};
-
-static const struct snd_soc_ops broxton_refcap_ops = {
-	.startup = broxton_refcap_startup,
-};
-
-/* broxton digital audio interface glue - connects codec <--> CPU */
-SND_SOC_DAILINK_DEF(dummy,
-	DAILINK_COMP_ARRAY(COMP_DUMMY()));
-
-SND_SOC_DAILINK_DEF(system,
-	DAILINK_COMP_ARRAY(COMP_CPU("System Pin")));
-
-SND_SOC_DAILINK_DEF(system2,
-	DAILINK_COMP_ARRAY(COMP_CPU("System Pin2")));
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
- /* Back End DAI */
-SND_SOC_DAILINK_DEF(ssp5_pin,
-	DAILINK_COMP_ARRAY(COMP_CPU("SSP5 Pin")));
-SND_SOC_DAILINK_DEF(ssp5_codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC("MX98357A:00",
-				      BXT_MAXIM_CODEC_DAI)));
-
-SND_SOC_DAILINK_DEF(ssp1_pin,
-	DAILINK_COMP_ARRAY(COMP_CPU("SSP1 Pin")));
-SND_SOC_DAILINK_DEF(ssp1_codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-DLGS7219:00",
-				      BXT_DIALOG_CODEC_DAI)));
-
-SND_SOC_DAILINK_DEF(dmic_pin,
-	DAILINK_COMP_ARRAY(COMP_CPU("DMIC01 Pin")));
-
-SND_SOC_DAILINK_DEF(dmic16k_pin,
-	DAILINK_COMP_ARRAY(COMP_CPU("DMIC16k Pin")));
-
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
-static struct snd_soc_dai_link broxton_dais[] = {
-	/* Front End DAI links */
-	[BXT_DPCM_AUDIO_PB] =
-	{
-		.name = "Bxt Audio Port",
-		.stream_name = "Audio",
-		.dynamic = 1,
-		.nonatomic = 1,
-		.init = broxton_da7219_fe_init,
-		.trigger = {
-			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.ops = &broxton_da7219_fe_ops,
-		SND_SOC_DAILINK_REG(system, dummy, platform),
-	},
-	[BXT_DPCM_AUDIO_CP] =
-	{
-		.name = "Bxt Audio Capture Port",
-		.stream_name = "Audio Record",
-		.dynamic = 1,
-		.nonatomic = 1,
-		.trigger = {
-			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
-		.ops = &broxton_da7219_fe_ops,
-		SND_SOC_DAILINK_REG(system, dummy, platform),
-	},
-	[BXT_DPCM_AUDIO_HS_PB] = {
-		.name = "Bxt Audio Headset Playback",
-		.stream_name = "Headset Playback",
-		.dynamic = 1,
-		.nonatomic = 1,
-		.trigger = {
-			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.ops = &broxton_da7219_fe_ops,
-		SND_SOC_DAILINK_REG(system2, dummy, platform),
-	},
-	[BXT_DPCM_AUDIO_REF_CP] =
-	{
-		.name = "Bxt Audio Reference cap",
-		.stream_name = "Refcap",
-		.init = NULL,
-		.dpcm_capture = 1,
-		.nonatomic = 1,
-		.dynamic = 1,
-		.ops = &broxton_refcap_ops,
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
-		.dai_fmt = SND_SOC_DAIFMT_I2S |
-			SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBC_CFC,
-		.ignore_pmdown_time = 1,
-		.be_hw_params_fixup = broxton_ssp_fixup,
-		.dpcm_playback = 1,
-		SND_SOC_DAILINK_REG(ssp5_pin, ssp5_codec, platform),
-	},
-	{
-		/* SSP1 - Codec */
-		.name = "SSP1-Codec",
-		.id = 1,
-		.no_pcm = 1,
-		.init = broxton_da7219_codec_init,
-		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBC_CFC,
-		.ignore_pmdown_time = 1,
-		.be_hw_params_fixup = broxton_ssp_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
-		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
-	},
-	{
-		.name = "dmic01",
-		.id = 2,
-		.ignore_suspend = 1,
-		.be_hw_params_fixup = broxton_dmic_fixup,
-		.dpcm_capture = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
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
-	{
-		.name = "dmic16k",
-		.id = 6,
-		.be_hw_params_fixup = broxton_dmic_fixup,
-		.dpcm_capture = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(dmic16k_pin, dmic_codec, platform),
-	},
-};
-
-#define NAME_SIZE	32
-static int bxt_card_late_probe(struct snd_soc_card *card)
-{
-	struct bxt_card_private *ctx = snd_soc_card_get_drvdata(card);
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
-/* broxton audio machine driver for SPT + da7219 */
-static struct snd_soc_card broxton_audio_card = {
-	.name = "bxtda7219max",
-	.owner = THIS_MODULE,
-	.dai_link = broxton_dais,
-	.num_links = ARRAY_SIZE(broxton_dais),
-	.controls = broxton_controls,
-	.num_controls = ARRAY_SIZE(broxton_controls),
-	.dapm_widgets = broxton_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(broxton_widgets),
-	.dapm_routes = audio_map,
-	.num_dapm_routes = ARRAY_SIZE(audio_map),
-	.fully_routed = true,
-	.disable_route_checks = true,
-	.late_probe = bxt_card_late_probe,
-};
-
-static int broxton_audio_probe(struct platform_device *pdev)
-{
-	struct bxt_card_private *ctx;
-	struct snd_soc_acpi_mach *mach;
-	const char *platform_name;
-	int ret;
-
-	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
-
-	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
-
-	broxton_audio_card.dev = &pdev->dev;
-	snd_soc_card_set_drvdata(&broxton_audio_card, ctx);
-
-	/* override platform name, if required */
-	mach = pdev->dev.platform_data;
-	platform_name = mach->mach_params.platform;
-
-	ret = snd_soc_fixup_dai_links_platform_name(&broxton_audio_card,
-						    platform_name);
-	if (ret)
-		return ret;
-
-	ctx->common_hdmi_codec_drv = mach->mach_params.common_hdmi_codec_drv;
-
-	return devm_snd_soc_register_card(&pdev->dev, &broxton_audio_card);
-}
-
-static const struct platform_device_id bxt_board_ids[] = {
-	{ .name = "bxt_da7219_mx98357a" },
-	{ }
-};
-MODULE_DEVICE_TABLE(platform, bxt_board_ids);
-
-static struct platform_driver broxton_audio = {
-	.probe = broxton_audio_probe,
-	.driver = {
-		.name = "bxt_da7219_max98357a",
-		.pm = &snd_soc_pm_ops,
-	},
-	.id_table = bxt_board_ids,
-};
-module_platform_driver(broxton_audio)
-
-/* Module information */
-MODULE_DESCRIPTION("Audio Machine driver-DA7219 & MAX98357A in I2S mode");
-MODULE_AUTHOR("Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>");
-MODULE_AUTHOR("Rohit Ainapure <rohit.m.ainapure@intel.com>");
-MODULE_AUTHOR("Harsha Priya <harshapriya.n@intel.com>");
-MODULE_AUTHOR("Conrad Cooke <conrad.cooke@intel.com>");
-MODULE_AUTHOR("Naveen Manohar <naveen.m@intel.com>");
-MODULE_AUTHOR("Mac Chiang <mac.chiang@intel.com>");
-MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
-MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
-- 
2.25.1

