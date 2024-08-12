Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E025F94EA3A
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2024 11:47:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 779C414EB;
	Mon, 12 Aug 2024 11:47:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 779C414EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723456045;
	bh=w7Aap0RS+tWXmLnHAqSp74ee1IUZdmlFrgRoj9o5okU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U4QTFcbmgZqDG1Z7hbMbkGL71t3bYUvQJa02YX6bmd16PAxdmgW0G2y8RQUPHy+gN
	 LwzdLyO3+6nc4UJSBHn9E84cTn8+2Hcgj0sH8tlcepM1NiZk2aseRuW2vvIBa/vRt8
	 SLCHwfdHooDTs9CgvilLkohxbVmAfqGuMEfDTfYQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DC3AF80616; Mon, 12 Aug 2024 11:46:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30388F80517;
	Mon, 12 Aug 2024 11:46:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11912F805D3; Mon, 12 Aug 2024 11:46:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC20DF8047C
	for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2024 11:42:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC20DF8047C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eAuvs9nh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723455772; x=1754991772;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w7Aap0RS+tWXmLnHAqSp74ee1IUZdmlFrgRoj9o5okU=;
  b=eAuvs9nhdiHfcUYKBG7wIi2EAAikXqY9kd0Ew4AvvfC5b7jFyhjROgeM
   KTrzgik8FWb2LiH8Gc6Z7LAWfEewi+ejH67E89sCAoyiSp0PsAFDR4J0g
   jb9+APA8EVmqpCOnOo+I+X1U3dSJHDlQHRseHD2RIOQ8kQ9XjJQbefhFB
   j+8p4HuSFhFhCZi50+RW9jNo4N5FYVwdhUGxWnd2PDC7Vr0qd4j1/WvX3
   kGYOpvcME4T2jYOrTK6M4nqfstARQCSe0y5BOgcgL9PQbeDuXcCc7djzw
   xfWc75PQ+R+2o21wD2WZgC9rvJJsjKECjxmsxojYSscBgXxoPdfIF8uGw
   w==;
X-CSE-ConnectionGUID: WBmviH/uToewL8GtR836BQ==
X-CSE-MsgGUID: 2BMT9UBlS/WMT6Zaip2dtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21705387"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800";
   d="scan'208";a="21705387"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 02:42:51 -0700
X-CSE-ConnectionGUID: DT2fPZniSfyzNONYKlDLXQ==
X-CSE-MsgGUID: CsYn5kW8QGC25CogrxN4tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800";
   d="scan'208";a="63056924"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa005.jf.intel.com with ESMTP; 12 Aug 2024 02:42:47 -0700
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
Subject: [PATCH 05/12] ASoC: Intel: Remove kbl_rt5660 board driver
Date: Mon, 12 Aug 2024 11:43:21 +0200
Message-Id: <20240812094328.842661-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240812094328.842661-1-cezary.rojewski@intel.com>
References: <20240812094328.842661-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 34SZSHUPJQLPF5CHGFULB4I6KPXO4TR7
X-Message-ID-Hash: 34SZSHUPJQLPF5CHGFULB4I6KPXO4TR7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/34SZSHUPJQLPF5CHGFULB4I6KPXO4TR7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver has no users.

Succeeded by:
- avs_rt5660 (./intel/avs/boards/rt5660.c)

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/boards/Kconfig      |  12 -
 sound/soc/intel/boards/Makefile     |   2 -
 sound/soc/intel/boards/kbl_rt5660.c | 567 ----------------------------
 3 files changed, 581 deletions(-)
 delete mode 100644 sound/soc/intel/boards/kbl_rt5660.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 842003b4dbe9..5fb9b993ae3f 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -348,18 +348,6 @@ config SND_SOC_INTEL_KBL_DA7219_MAX98927_MACH
 	  Say Y if you have such a device.
 	  If unsure select "N".
 
-config SND_SOC_INTEL_KBL_RT5660_MACH
-	tristate "KBL with RT5660 in I2S Mode"
-	depends on I2C && ACPI
-	depends on MFD_INTEL_LPSS || COMPILE_TEST
-	depends on GPIOLIB || COMPILE_TEST
-	select SND_SOC_RT5660
-	select SND_SOC_HDAC_HDMI
-	help
-	  This adds support for ASoC Onboard Codec I2S machine driver. This will
-	  create an alsa sound card for RT5660 I2S audio codec.
-	  Say Y if you have such a device.
-
 endif ## SND_SOC_INTEL_KBL
 
 if SND_SOC_SOF_GEMINILAKE
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index d4a1ada47b38..be1b8cc4028a 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -23,7 +23,6 @@ snd-soc-sof_nau8825-y := sof_nau8825.o
 snd-soc-sof_da7219-y := sof_da7219.o
 snd-soc-kbl_da7219_max98357a-y := kbl_da7219_max98357a.o
 snd-soc-kbl_da7219_max98927-y := kbl_da7219_max98927.o
-snd-soc-kbl_rt5660-y := kbl_rt5660.o
 snd-soc-skl_rt286-y := skl_rt286.o
 snd-soc-skl_hda_dsp-y := skl_hda_dsp_generic.o skl_hda_dsp_common.o
 snd-skl_nau88l25_max98357a-y := skl_nau88l25_max98357a.o
@@ -56,7 +55,6 @@ obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_ES8316_MACH) += snd-soc-sst-byt-cht-es8316.o
 obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_NOCODEC_MACH) += snd-soc-sst-byt-cht-nocodec.o
 obj-$(CONFIG_SND_SOC_INTEL_KBL_DA7219_MAX98357A_MACH) += snd-soc-kbl_da7219_max98357a.o
 obj-$(CONFIG_SND_SOC_INTEL_KBL_DA7219_MAX98927_MACH) += snd-soc-kbl_da7219_max98927.o
-obj-$(CONFIG_SND_SOC_INTEL_KBL_RT5660_MACH) += snd-soc-kbl_rt5660.o
 obj-$(CONFIG_SND_SOC_INTEL_SKL_RT286_MACH) += snd-soc-skl_rt286.o
 obj-$(CONFIG_SND_SOC_INTEL_SKL_NAU88L25_MAX98357A_MACH) += snd-skl_nau88l25_max98357a.o
 obj-$(CONFIG_SND_SOC_INTEL_SKL_NAU88L25_SSM4567_MACH) += snd-soc-skl_nau88l25_ssm4567.o
diff --git a/sound/soc/intel/boards/kbl_rt5660.c b/sound/soc/intel/boards/kbl_rt5660.c
deleted file mode 100644
index 66885cb36f24..000000000000
--- a/sound/soc/intel/boards/kbl_rt5660.c
+++ /dev/null
@@ -1,567 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-// Copyright(c) 2018-19 Canonical Corporation.
-
-/*
- * Intel Kabylake I2S Machine Driver with RT5660 Codec
- *
- * Modified from:
- *   Intel Kabylake I2S Machine driver supporting MAXIM98357a and
- *   DA7219 codecs
- * Also referred to:
- *   Intel Broadwell I2S Machine driver supporting RT5677 codec
- */
-
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/gpio/consumer.h>
-#include <linux/acpi.h>
-#include <sound/core.h>
-#include <sound/jack.h>
-#include <sound/pcm.h>
-#include <sound/pcm_params.h>
-#include <sound/soc.h>
-
-#include "../../codecs/hdac_hdmi.h"
-#include "../../codecs/rt5660.h"
-
-#define KBL_RT5660_CODEC_DAI "rt5660-aif1"
-#define DUAL_CHANNEL 2
-
-static struct snd_soc_card *kabylake_audio_card;
-static struct snd_soc_jack skylake_hdmi[3];
-static struct snd_soc_jack lineout_jack;
-static struct snd_soc_jack mic_jack;
-
-struct kbl_hdmi_pcm {
-	struct list_head head;
-	struct snd_soc_dai *codec_dai;
-	int device;
-};
-
-struct kbl_codec_private {
-	struct gpio_desc *gpio_lo_mute;
-	struct list_head hdmi_pcm_list;
-};
-
-enum {
-	KBL_DPCM_AUDIO_PB = 0,
-	KBL_DPCM_AUDIO_CP,
-	KBL_DPCM_AUDIO_HDMI1_PB,
-	KBL_DPCM_AUDIO_HDMI2_PB,
-	KBL_DPCM_AUDIO_HDMI3_PB,
-};
-
-#define GPIO_LINEOUT_MUTE_INDEX 0
-#define GPIO_LINEOUT_DET_INDEX 3
-#define GPIO_LINEIN_DET_INDEX 4
-
-static const struct acpi_gpio_params lineout_mute_gpio = { GPIO_LINEOUT_MUTE_INDEX, 0, true };
-static const struct acpi_gpio_params lineout_det_gpio = { GPIO_LINEOUT_DET_INDEX, 0, false };
-static const struct acpi_gpio_params mic_det_gpio = { GPIO_LINEIN_DET_INDEX, 0, false };
-
-
-static const struct acpi_gpio_mapping acpi_rt5660_gpios[] = {
-	{ "lineout-mute-gpios", &lineout_mute_gpio, 1 },
-	{ "lineout-det-gpios", &lineout_det_gpio, 1 },
-	{ "mic-det-gpios", &mic_det_gpio, 1 },
-	{ NULL },
-};
-
-static struct snd_soc_jack_pin lineout_jack_pin = {
-	.pin	= "Line Out",
-	.mask	= SND_JACK_LINEOUT,
-};
-
-static struct snd_soc_jack_pin mic_jack_pin = {
-	.pin	= "Line In",
-	.mask	= SND_JACK_MICROPHONE,
-};
-
-static struct snd_soc_jack_gpio lineout_jack_gpio = {
-	.name			= "lineout-det",
-	.report			= SND_JACK_LINEOUT,
-	.debounce_time		= 200,
-};
-
-static struct snd_soc_jack_gpio mic_jack_gpio = {
-	.name			= "mic-det",
-	.report			= SND_JACK_MICROPHONE,
-	.debounce_time		= 200,
-};
-
-static int kabylake_5660_event_lineout(struct snd_soc_dapm_widget *w,
-			struct snd_kcontrol *k, int event)
-{
-	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct kbl_codec_private *priv = snd_soc_card_get_drvdata(dapm->card);
-
-	gpiod_set_value_cansleep(priv->gpio_lo_mute,
-			!(SND_SOC_DAPM_EVENT_ON(event)));
-
-	return 0;
-}
-
-static const struct snd_kcontrol_new kabylake_rt5660_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Line In"),
-	SOC_DAPM_PIN_SWITCH("Line Out"),
-};
-
-static const struct snd_soc_dapm_widget kabylake_rt5660_widgets[] = {
-	SND_SOC_DAPM_MIC("Line In", NULL),
-	SND_SOC_DAPM_LINE("Line Out", kabylake_5660_event_lineout),
-};
-
-static const struct snd_soc_dapm_route kabylake_rt5660_map[] = {
-	/* other jacks */
-	{"IN1P", NULL, "Line In"},
-	{"IN2P", NULL, "Line In"},
-	{"Line Out", NULL, "LOUTR"},
-	{"Line Out", NULL, "LOUTL"},
-
-	/* CODEC BE connections */
-	{ "AIF1 Playback", NULL, "ssp0 Tx"},
-	{ "ssp0 Tx", NULL, "codec0_out"},
-
-	{ "codec0_in", NULL, "ssp0 Rx" },
-	{ "ssp0 Rx", NULL, "AIF1 Capture" },
-
-	{ "hifi1", NULL, "iDisp1 Tx"},
-	{ "iDisp1 Tx", NULL, "iDisp1_out"},
-	{ "hifi2", NULL, "iDisp2 Tx"},
-	{ "iDisp2 Tx", NULL, "iDisp2_out"},
-	{ "hifi3", NULL, "iDisp3 Tx"},
-	{ "iDisp3 Tx", NULL, "iDisp3_out"},
-};
-
-static int kabylake_ssp0_fixup(struct snd_soc_pcm_runtime *rtd,
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
-	/* set SSP0 to 24 bit */
-	snd_mask_none(fmt);
-	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
-
-	return 0;
-}
-
-static int kabylake_rt5660_codec_init(struct snd_soc_pcm_runtime *rtd)
-{
-	int ret;
-	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
-
-	ret = devm_acpi_dev_add_driver_gpios(component->dev, acpi_rt5660_gpios);
-	if (ret)
-		dev_warn(component->dev, "Failed to add driver gpios\n");
-
-	/* Request rt5660 GPIO for lineout mute control, return if fails */
-	ctx->gpio_lo_mute = gpiod_get(component->dev, "lineout-mute",
-				      GPIOD_OUT_HIGH);
-	if (IS_ERR(ctx->gpio_lo_mute)) {
-		dev_err(component->dev, "Can't find GPIO_MUTE# gpio\n");
-		return PTR_ERR(ctx->gpio_lo_mute);
-	}
-
-	/* Create and initialize headphone jack, this jack is not mandatory, don't return if fails */
-	ret = snd_soc_card_jack_new_pins(rtd->card, "Lineout Jack",
-					 SND_JACK_LINEOUT, &lineout_jack,
-					 &lineout_jack_pin, 1);
-	if (ret)
-		dev_warn(component->dev, "Can't create Lineout jack\n");
-	else {
-		lineout_jack_gpio.gpiod_dev = component->dev;
-		ret = snd_soc_jack_add_gpios(&lineout_jack, 1,
-					     &lineout_jack_gpio);
-		if (ret)
-			dev_warn(component->dev, "Can't add Lineout jack gpio\n");
-	}
-
-	/* Create and initialize mic jack, this jack is not mandatory, don't return if fails */
-	ret = snd_soc_card_jack_new_pins(rtd->card, "Mic Jack",
-					 SND_JACK_MICROPHONE, &mic_jack,
-					 &mic_jack_pin, 1);
-	if (ret)
-		dev_warn(component->dev, "Can't create mic jack\n");
-	else {
-		mic_jack_gpio.gpiod_dev = component->dev;
-		ret = snd_soc_jack_add_gpios(&mic_jack, 1, &mic_jack_gpio);
-		if (ret)
-			dev_warn(component->dev, "Can't add mic jack gpio\n");
-	}
-
-	/* Here we enable some dapms in advance to reduce the pop noise for recording via line-in */
-	snd_soc_dapm_force_enable_pin(dapm, "MICBIAS1");
-	snd_soc_dapm_force_enable_pin(dapm, "BST1");
-	snd_soc_dapm_force_enable_pin(dapm, "BST2");
-
-	return 0;
-}
-
-static void kabylake_rt5660_codec_exit(struct snd_soc_pcm_runtime *rtd)
-{
-	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-
-	/*
-	 * The .exit() can be reached without going through the .init()
-	 * so explicitly test if the gpiod is valid
-	 */
-	if (!IS_ERR_OR_NULL(ctx->gpio_lo_mute))
-		gpiod_put(ctx->gpio_lo_mute);
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
-static int kabylake_rt5660_hw_params(struct snd_pcm_substream *substream,
-	struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
-	int ret;
-
-	ret = snd_soc_dai_set_sysclk(codec_dai,
-				     RT5660_SCLK_S_PLL1, params_rate(params) * 512,
-				     SND_SOC_CLOCK_IN);
-	if (ret < 0) {
-		dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n", ret);
-		return ret;
-	}
-
-	ret = snd_soc_dai_set_pll(codec_dai, 0,
-				  RT5660_PLL1_S_BCLK,
-				  params_rate(params) * 50,
-				  params_rate(params) * 512);
-	if (ret < 0)
-		dev_err(codec_dai->dev, "can't set codec pll: %d\n", ret);
-
-	return ret;
-}
-
-static const struct snd_soc_ops kabylake_rt5660_ops = {
-	.hw_params = kabylake_rt5660_hw_params,
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
-static const struct snd_soc_ops kabylake_rt5660_fe_ops = {
-	.startup = kbl_fe_startup,
-};
-
-SND_SOC_DAILINK_DEF(dummy,
-	DAILINK_COMP_ARRAY(COMP_DUMMY()));
-
-SND_SOC_DAILINK_DEF(system,
-	DAILINK_COMP_ARRAY(COMP_CPU("System Pin")));
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
-	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC3277:00", KBL_RT5660_CODEC_DAI)));
-
-SND_SOC_DAILINK_DEF(idisp1_pin,
-		    DAILINK_COMP_ARRAY(COMP_CPU("iDisp1 Pin")));
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
-/* kabylake digital audio interface glue - connects rt5660 codec <--> CPU */
-static struct snd_soc_dai_link kabylake_rt5660_dais[] = {
-	/* Front End DAI links */
-	[KBL_DPCM_AUDIO_PB] = {
-		.name = "Kbl Audio Port",
-		.stream_name = "Audio",
-		.dynamic = 1,
-		.nonatomic = 1,
-		.trigger = {
-			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.ops = &kabylake_rt5660_fe_ops,
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
-		.ops = &kabylake_rt5660_fe_ops,
-		SND_SOC_DAILINK_REG(system, dummy, platform),
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
-		.init = kabylake_rt5660_codec_init,
-		.exit = kabylake_rt5660_codec_exit,
-		.dai_fmt = SND_SOC_DAIFMT_I2S |
-		SND_SOC_DAIFMT_NB_NF |
-		SND_SOC_DAIFMT_CBC_CFC,
-		.ignore_pmdown_time = 1,
-		.be_hw_params_fixup = kabylake_ssp0_fixup,
-		.ops = &kabylake_rt5660_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
-		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
-	},
-	{
-		.name = "iDisp1",
-		.id = 1,
-		.dpcm_playback = 1,
-		.init = kabylake_hdmi1_init,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
-	},
-	{
-		.name = "iDisp2",
-		.id = 2,
-		.init = kabylake_hdmi2_init,
-		.dpcm_playback = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
-	},
-	{
-		.name = "iDisp3",
-		.id = 3,
-		.init = kabylake_hdmi3_init,
-		.dpcm_playback = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
-	},
-};
-
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
-/* kabylake audio machine driver for rt5660 */
-static struct snd_soc_card kabylake_audio_card_rt5660 = {
-	.name = "kblrt5660",
-	.owner = THIS_MODULE,
-	.dai_link = kabylake_rt5660_dais,
-	.num_links = ARRAY_SIZE(kabylake_rt5660_dais),
-	.controls = kabylake_rt5660_controls,
-	.num_controls = ARRAY_SIZE(kabylake_rt5660_controls),
-	.dapm_widgets = kabylake_rt5660_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(kabylake_rt5660_widgets),
-	.dapm_routes = kabylake_rt5660_map,
-	.num_dapm_routes = ARRAY_SIZE(kabylake_rt5660_map),
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
-		.name = "kbl_rt5660",
-		.driver_data =
-			(kernel_ulong_t)&kabylake_audio_card_rt5660,
-	},
-	{ }
-};
-MODULE_DEVICE_TABLE(platform, kbl_board_ids);
-
-static struct platform_driver kabylake_audio = {
-	.probe = kabylake_audio_probe,
-	.driver = {
-		.name = "kbl_rt5660",
-		.pm = &snd_soc_pm_ops,
-	},
-	.id_table = kbl_board_ids,
-};
-
-module_platform_driver(kabylake_audio)
-
-/* Module information */
-MODULE_DESCRIPTION("Audio Machine driver-RT5660 in I2S mode");
-MODULE_AUTHOR("Hui Wang <hui.wang@canonical.com>");
-MODULE_LICENSE("GPL v2");
-- 
2.25.1

