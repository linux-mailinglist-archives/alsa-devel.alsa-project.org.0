Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8B695193D
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2024 12:44:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09DBA2318;
	Wed, 14 Aug 2024 12:44:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09DBA2318
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723632294;
	bh=yBUfvr+aRJfJXyfgn823RD0SrbewZq7tXJJoiNAwbqg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N4C3eYK3DHVyPupyAG5ORcN4EcIo1p4A0C7mzyTSxcSNz4Q+W/UaUcA7PlYhR1Qff
	 mTn9BXV5goSgnbwAVXclSqwnEiofkHwYbihl9DcLer0f54+tjc5zR8ChW9yDYdXtRY
	 y1qDUcUS5TYPwy3BjtkG3fHnU8RRKaIvejxR/v4I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27505F805BB; Wed, 14 Aug 2024 12:44:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3062F800B0;
	Wed, 14 Aug 2024 12:44:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 835D2F805A0; Wed, 14 Aug 2024 10:40:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 767B4F80579
	for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2024 10:40:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 767B4F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WuclKWaB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723624820; x=1755160820;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yBUfvr+aRJfJXyfgn823RD0SrbewZq7tXJJoiNAwbqg=;
  b=WuclKWaBPpO4xGQciXtL0Cb4GJbDWfn7W1DscGUYs7Dtuy/lzNNGYfYd
   2sstekVYVx1kvNqSzI247/ltZY/g+dMIelyOMFDBf4+Ck8BZObPPMpbYe
   9qxbsXXb1U2T0V5W1u0ZjtgFSoT7yTZV+FhemTiy4PFS/NAYJDlumUaJF
   0W/dWaBrsLnAAUZK/OUFs7tHhn7vrYcyJt//pj3zBj8zHYJZTwzbRpB/I
   ummvpRB5Q87Ho2L9zaDnMsXlmBfJP0nHvRaGlNxlDsqIvWZnD68ThB9Ko
   23+avE/I6JnxLWyQ8G0r0/XTLmyyPfceleWsctpJ3weO4Y9PzDAIsWAY1
   A==;
X-CSE-ConnectionGUID: wjwN1bZ0R3eIoCrX+BOaxw==
X-CSE-MsgGUID: 8EK/w44NQD+U+DLMXtB0Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="24735189"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800";
   d="scan'208";a="24735189"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 01:40:17 -0700
X-CSE-ConnectionGUID: j0qBaxifR/eDy3mLv1qbxQ==
X-CSE-MsgGUID: 1WQ4pyGjQEeEz9xpKBLtmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800";
   d="scan'208";a="63867985"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa004.jf.intel.com with ESMTP; 14 Aug 2024 01:40:13 -0700
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
Subject: [PATCH v2 06/14] ASoC: Intel: Remove kbl_rt5663_max98927 board driver
Date: Wed, 14 Aug 2024 10:39:21 +0200
Message-Id: <20240814083929.1217319-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240814083929.1217319-1-cezary.rojewski@intel.com>
References: <20240814083929.1217319-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SYRO6VYDCET6U3PPTXTSPAPT2JZOAKHI
X-Message-ID-Hash: SYRO6VYDCET6U3PPTXTSPAPT2JZOAKHI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SYRO6VYDCET6U3PPTXTSPAPT2JZOAKHI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver has no users.

Succeeded by:
- avs_rt5663 (./intel/avs/boards/rt5663.c)
- avs_max98927 (./intel/avs/boards/max98927.c)

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/boards/Kconfig               |   15 -
 sound/soc/intel/boards/Makefile              |    2 -
 sound/soc/intel/boards/kbl_rt5663_max98927.c | 1073 ------------------
 3 files changed, 1090 deletions(-)
 delete mode 100644 sound/soc/intel/boards/kbl_rt5663_max98927.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 245a12427132..842003b4dbe9 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -323,21 +323,6 @@ endif ## SND_SOC_SOF_APOLLOLAKE
 
 if SND_SOC_INTEL_KBL
 
-config SND_SOC_INTEL_KBL_RT5663_MAX98927_MACH
-	tristate "KBL with RT5663 and MAX98927 in I2S Mode"
-	depends on I2C && ACPI
-	depends on MFD_INTEL_LPSS || COMPILE_TEST
-	select SND_SOC_RT5663
-	select SND_SOC_MAX98927
-	select SND_SOC_DMIC
-	select SND_SOC_HDAC_HDMI
-	select SND_SOC_INTEL_SKYLAKE_SSP_CLK
-	help
-	  This adds support for ASoC Onboard Codec I2S machine driver. This will
-	  create an alsa sound card for RT5663 + MAX98927.
-	  Say Y or m if you have such a device. This is a recommended option.
-	  If unsure select "N".
-
 config SND_SOC_INTEL_KBL_DA7219_MAX98357A_MACH
 	tristate "KBL with DA7219 and MAX98357A in I2S Mode"
 	depends on I2C && ACPI
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index dbdb5292c296..d4a1ada47b38 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -23,7 +23,6 @@ snd-soc-sof_nau8825-y := sof_nau8825.o
 snd-soc-sof_da7219-y := sof_da7219.o
 snd-soc-kbl_da7219_max98357a-y := kbl_da7219_max98357a.o
 snd-soc-kbl_da7219_max98927-y := kbl_da7219_max98927.o
-snd-soc-kbl_rt5663_max98927-y := kbl_rt5663_max98927.o
 snd-soc-kbl_rt5660-y := kbl_rt5660.o
 snd-soc-skl_rt286-y := skl_rt286.o
 snd-soc-skl_hda_dsp-y := skl_hda_dsp_generic.o skl_hda_dsp_common.o
@@ -57,7 +56,6 @@ obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_ES8316_MACH) += snd-soc-sst-byt-cht-es8316.o
 obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_NOCODEC_MACH) += snd-soc-sst-byt-cht-nocodec.o
 obj-$(CONFIG_SND_SOC_INTEL_KBL_DA7219_MAX98357A_MACH) += snd-soc-kbl_da7219_max98357a.o
 obj-$(CONFIG_SND_SOC_INTEL_KBL_DA7219_MAX98927_MACH) += snd-soc-kbl_da7219_max98927.o
-obj-$(CONFIG_SND_SOC_INTEL_KBL_RT5663_MAX98927_MACH) += snd-soc-kbl_rt5663_max98927.o
 obj-$(CONFIG_SND_SOC_INTEL_KBL_RT5660_MACH) += snd-soc-kbl_rt5660.o
 obj-$(CONFIG_SND_SOC_INTEL_SKL_RT286_MACH) += snd-soc-skl_rt286.o
 obj-$(CONFIG_SND_SOC_INTEL_SKL_NAU88L25_MAX98357A_MACH) += snd-skl_nau88l25_max98357a.o
diff --git a/sound/soc/intel/boards/kbl_rt5663_max98927.c b/sound/soc/intel/boards/kbl_rt5663_max98927.c
deleted file mode 100644
index 9da89436a917..000000000000
--- a/sound/soc/intel/boards/kbl_rt5663_max98927.c
+++ /dev/null
@@ -1,1073 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Intel Kabylake I2S Machine Driver with MAXIM98927
- * and RT5663 Codecs
- *
- * Copyright (C) 2017, Intel Corporation
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
-#include "../../codecs/rt5663.h"
-#include "../../codecs/hdac_hdmi.h"
-#include <linux/clk.h>
-#include <linux/clk-provider.h>
-#include <linux/clkdev.h>
-
-#define KBL_REALTEK_CODEC_DAI "rt5663-aif"
-#define KBL_MAXIM_CODEC_DAI "max98927-aif1"
-#define DMIC_CH(p) p->list[p->count-1]
-#define MAXIM_DEV0_NAME "i2c-MX98927:00"
-#define MAXIM_DEV1_NAME "i2c-MX98927:01"
-
-static struct snd_soc_card *kabylake_audio_card;
-static const struct snd_pcm_hw_constraint_list *dmic_constraints;
-static struct snd_soc_jack skylake_hdmi[3];
-
-struct kbl_hdmi_pcm {
-	struct list_head head;
-	struct snd_soc_dai *codec_dai;
-	int device;
-};
-
-struct kbl_rt5663_private {
-	struct snd_soc_jack kabylake_headset;
-	struct list_head hdmi_pcm_list;
-	struct clk *mclk;
-	struct clk *sclk;
-};
-
-enum {
-	KBL_DPCM_AUDIO_PB = 0,
-	KBL_DPCM_AUDIO_CP,
-	KBL_DPCM_AUDIO_HS_PB,
-	KBL_DPCM_AUDIO_ECHO_REF_CP,
-	KBL_DPCM_AUDIO_REF_CP,
-	KBL_DPCM_AUDIO_DMIC_CP,
-	KBL_DPCM_AUDIO_HDMI1_PB,
-	KBL_DPCM_AUDIO_HDMI2_PB,
-	KBL_DPCM_AUDIO_HDMI3_PB,
-};
-
-static const struct snd_kcontrol_new kabylake_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
-	SOC_DAPM_PIN_SWITCH("Headset Mic"),
-	SOC_DAPM_PIN_SWITCH("Left Spk"),
-	SOC_DAPM_PIN_SWITCH("Right Spk"),
-};
-
-static int platform_clock_control(struct snd_soc_dapm_widget *w,
-			struct snd_kcontrol *k, int  event)
-{
-	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct snd_soc_card *card = dapm->card;
-	struct kbl_rt5663_private *priv = snd_soc_card_get_drvdata(card);
-	int ret = 0;
-
-	/*
-	 * MCLK/SCLK need to be ON early for a successful synchronization of
-	 * codec internal clock. And the clocks are turned off during
-	 * POST_PMD after the stream is stopped.
-	 */
-	switch (event) {
-	case SND_SOC_DAPM_PRE_PMU:
-		/* Enable MCLK */
-		ret = clk_set_rate(priv->mclk, 24000000);
-		if (ret < 0) {
-			dev_err(card->dev, "Can't set rate for mclk, err: %d\n",
-				ret);
-			return ret;
-		}
-
-		ret = clk_prepare_enable(priv->mclk);
-		if (ret < 0) {
-			dev_err(card->dev, "Can't enable mclk, err: %d\n", ret);
-			return ret;
-		}
-
-		/* Enable SCLK */
-		ret = clk_set_rate(priv->sclk, 3072000);
-		if (ret < 0) {
-			dev_err(card->dev, "Can't set rate for sclk, err: %d\n",
-				ret);
-			clk_disable_unprepare(priv->mclk);
-			return ret;
-		}
-
-		ret = clk_prepare_enable(priv->sclk);
-		if (ret < 0) {
-			dev_err(card->dev, "Can't enable sclk, err: %d\n", ret);
-			clk_disable_unprepare(priv->mclk);
-		}
-		break;
-	case SND_SOC_DAPM_POST_PMD:
-		clk_disable_unprepare(priv->mclk);
-		clk_disable_unprepare(priv->sclk);
-		break;
-	default:
-		return 0;
-	}
-
-	return 0;
-}
-
-static const struct snd_soc_dapm_widget kabylake_widgets[] = {
-	SND_SOC_DAPM_HP("Headphone Jack", NULL),
-	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-	SND_SOC_DAPM_SPK("Left Spk", NULL),
-	SND_SOC_DAPM_SPK("Right Spk", NULL),
-	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
-	SND_SOC_DAPM_SPK("HDMI1", NULL),
-	SND_SOC_DAPM_SPK("HDMI2", NULL),
-	SND_SOC_DAPM_SPK("HDMI3", NULL),
-	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
-			platform_clock_control, SND_SOC_DAPM_PRE_PMU |
-			SND_SOC_DAPM_POST_PMD),
-};
-
-static const struct snd_soc_dapm_route kabylake_map[] = {
-	/* HP jack connectors - unknown if we have jack detection */
-	{ "Headphone Jack", NULL, "Platform Clock" },
-	{ "Headphone Jack", NULL, "HPOL" },
-	{ "Headphone Jack", NULL, "HPOR" },
-
-	/* speaker */
-	{ "Left Spk", NULL, "Left BE_OUT" },
-	{ "Right Spk", NULL, "Right BE_OUT" },
-
-	/* other jacks */
-	{ "Headset Mic", NULL, "Platform Clock" },
-	{ "IN1P", NULL, "Headset Mic" },
-	{ "IN1N", NULL, "Headset Mic" },
-	{ "DMic", NULL, "SoC DMIC" },
-
-	{"HDMI1", NULL, "hif5-0 Output"},
-	{"HDMI2", NULL, "hif6-0 Output"},
-	{"HDMI3", NULL, "hif7-0 Output"},
-
-	/* CODEC BE connections */
-	{ "Left HiFi Playback", NULL, "ssp0 Tx" },
-	{ "Right HiFi Playback", NULL, "ssp0 Tx" },
-	{ "ssp0 Tx", NULL, "spk_out" },
-
-	{ "AIF Playback", NULL, "ssp1 Tx" },
-	{ "ssp1 Tx", NULL, "codec1_out" },
-
-	{ "hs_in", NULL, "ssp1 Rx" },
-	{ "ssp1 Rx", NULL, "AIF Capture" },
-
-	/* IV feedback path */
-	{ "codec0_fb_in", NULL, "ssp0 Rx"},
-	{ "ssp0 Rx", NULL, "Left HiFi Capture" },
-	{ "ssp0 Rx", NULL, "Right HiFi Capture" },
-
-	/* DMIC */
-	{ "dmic01_hifi", NULL, "DMIC01 Rx" },
-	{ "DMIC01 Rx", NULL, "DMIC AIF" },
-
-	{ "hifi3", NULL, "iDisp3 Tx"},
-	{ "iDisp3 Tx", NULL, "iDisp3_out"},
-	{ "hifi2", NULL, "iDisp2 Tx"},
-	{ "iDisp2 Tx", NULL, "iDisp2_out"},
-	{ "hifi1", NULL, "iDisp1 Tx"},
-	{ "iDisp1 Tx", NULL, "iDisp1_out"},
-};
-
-enum {
-	KBL_DPCM_AUDIO_5663_PB = 0,
-	KBL_DPCM_AUDIO_5663_CP,
-	KBL_DPCM_AUDIO_5663_HDMI1_PB,
-	KBL_DPCM_AUDIO_5663_HDMI2_PB,
-};
-
-static const struct snd_kcontrol_new kabylake_5663_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
-	SOC_DAPM_PIN_SWITCH("Headset Mic"),
-};
-
-static const struct snd_soc_dapm_widget kabylake_5663_widgets[] = {
-	SND_SOC_DAPM_HP("Headphone Jack", NULL),
-	SND_SOC_DAPM_MIC("Headset Mic", NULL),
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
-};
-
-static const struct snd_soc_dapm_route kabylake_5663_map[] = {
-	{ "Headphone Jack", NULL, "Platform Clock" },
-	{ "Headphone Jack", NULL, "HPOL" },
-	{ "Headphone Jack", NULL, "HPOR" },
-
-	/* other jacks */
-	{ "Headset Mic", NULL, "Platform Clock" },
-	{ "IN1P", NULL, "Headset Mic" },
-	{ "IN1N", NULL, "Headset Mic" },
-
-	{"HDMI1", NULL, "hif5-0 Output"},
-	{"HDMI2", NULL, "hif6-0 Output"},
-	{"HDMI3", NULL, "hif7-0 Output"},
-
-	/* CODEC BE connections */
-	{ "AIF Playback", NULL, "ssp1 Tx" },
-	{ "ssp1 Tx", NULL, "codec1_out" },
-
-	{ "codec0_in", NULL, "ssp1 Rx" },
-	{ "ssp1 Rx", NULL, "AIF Capture" },
-
-	{ "hifi2", NULL, "iDisp2 Tx"},
-	{ "iDisp2 Tx", NULL, "iDisp2_out"},
-	{ "hifi1", NULL, "iDisp1 Tx"},
-	{ "iDisp1 Tx", NULL, "iDisp1_out"},
-};
-
-static struct snd_soc_codec_conf max98927_codec_conf[] = {
-	{
-		.dlc = COMP_CODEC_CONF(MAXIM_DEV0_NAME),
-		.name_prefix = "Right",
-	},
-	{
-		.dlc = COMP_CODEC_CONF(MAXIM_DEV1_NAME),
-		.name_prefix = "Left",
-	},
-};
-
-static int kabylake_rt5663_fe_init(struct snd_soc_pcm_runtime *rtd)
-{
-	int ret;
-	struct snd_soc_dapm_context *dapm;
-	struct snd_soc_component *component = snd_soc_rtd_to_cpu(rtd, 0)->component;
-
-	dapm = snd_soc_component_get_dapm(component);
-	ret = snd_soc_dapm_ignore_suspend(dapm, "Reference Capture");
-	if (ret) {
-		dev_err(rtd->dev, "Ref Cap ignore suspend failed %d\n", ret);
-		return ret;
-	}
-
-	return ret;
-}
-
-static int kabylake_rt5663_codec_init(struct snd_soc_pcm_runtime *rtd)
-{
-	int ret;
-	struct kbl_rt5663_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
-	struct snd_soc_jack *jack;
-
-	/*
-	 * Headset buttons map to the google Reference headset.
-	 * These can be configured by userspace.
-	 */
-	ret = snd_soc_card_jack_new_pins(kabylake_audio_card, "Headset Jack",
-					 SND_JACK_HEADSET | SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-					 SND_JACK_BTN_2 | SND_JACK_BTN_3,
-					 &ctx->kabylake_headset,
-					 jack_pins,
-					 ARRAY_SIZE(jack_pins));
-	if (ret) {
-		dev_err(rtd->dev, "Headset Jack creation failed %d\n", ret);
-		return ret;
-	}
-
-	jack = &ctx->kabylake_headset;
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
-
-	snd_soc_component_set_jack(component, &ctx->kabylake_headset, NULL);
-
-	return ret;
-}
-
-static int kabylake_rt5663_max98927_codec_init(struct snd_soc_pcm_runtime *rtd)
-{
-	int ret;
-
-	ret = kabylake_rt5663_codec_init(rtd);
-	if (ret)
-		return ret;
-
-	ret = snd_soc_dapm_ignore_suspend(&rtd->card->dapm, "SoC DMIC");
-	if (ret) {
-		dev_err(rtd->dev, "SoC DMIC ignore suspend failed %d\n", ret);
-		return ret;
-	}
-
-	return ret;
-}
-
-static int kabylake_hdmi_init(struct snd_soc_pcm_runtime *rtd, int device)
-{
-	struct kbl_rt5663_private *ctx = snd_soc_card_get_drvdata(rtd->card);
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
-static int kabylake_5663_hdmi1_init(struct snd_soc_pcm_runtime *rtd)
-{
-	return kabylake_hdmi_init(rtd, KBL_DPCM_AUDIO_5663_HDMI1_PB);
-}
-
-static int kabylake_5663_hdmi2_init(struct snd_soc_pcm_runtime *rtd)
-{
-	return kabylake_hdmi_init(rtd, KBL_DPCM_AUDIO_5663_HDMI2_PB);
-}
-
-static unsigned int rates[] = {
-	48000,
-};
-
-static const struct snd_pcm_hw_constraint_list constraints_rates = {
-	.count = ARRAY_SIZE(rates),
-	.list  = rates,
-	.mask = 0,
-};
-
-static unsigned int channels[] = {
-	2,
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
-static const struct snd_soc_ops kabylake_rt5663_fe_ops = {
-	.startup = kbl_fe_startup,
-};
-
-static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
-	struct snd_pcm_hw_params *params)
-{
-	struct snd_interval *rate = hw_param_interval(params,
-			SNDRV_PCM_HW_PARAM_RATE);
-	struct snd_interval *chan = hw_param_interval(params,
-			SNDRV_PCM_HW_PARAM_CHANNELS);
-	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
-	struct snd_soc_dpcm *dpcm, *rtd_dpcm = NULL;
-
-	/*
-	 * The following loop will be called only for playback stream
-	 * In this platform, there is only one playback device on every SSP
-	 */
-	for_each_dpcm_fe(rtd, SNDRV_PCM_STREAM_PLAYBACK, dpcm) {
-		rtd_dpcm = dpcm;
-		break;
-	}
-
-	/*
-	 * This following loop will be called only for capture stream
-	 * In this platform, there is only one capture device on every SSP
-	 */
-	for_each_dpcm_fe(rtd, SNDRV_PCM_STREAM_CAPTURE, dpcm) {
-		rtd_dpcm = dpcm;
-		break;
-	}
-
-	if (!rtd_dpcm)
-		return -EINVAL;
-
-	/*
-	 * The above 2 loops are mutually exclusive based on the stream direction,
-	 * thus rtd_dpcm variable will never be overwritten
-	 */
-
-	/*
-	 * The ADSP will convert the FE rate to 48k, stereo, 24 bit
-	 */
-	if (!strcmp(rtd_dpcm->fe->dai_link->name, "Kbl Audio Port") ||
-	    !strcmp(rtd_dpcm->fe->dai_link->name, "Kbl Audio Headset Playback") ||
-	    !strcmp(rtd_dpcm->fe->dai_link->name, "Kbl Audio Capture Port")) {
-		rate->min = rate->max = 48000;
-		chan->min = chan->max = 2;
-		snd_mask_none(fmt);
-		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
-	}
-	/*
-	 * The speaker on the SSP0 supports S16_LE and not S24_LE.
-	 * thus changing the mask here
-	 */
-	if (!strcmp(rtd_dpcm->be->dai_link->name, "SSP0-Codec"))
-		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
-
-	return 0;
-}
-
-static int kabylake_rt5663_hw_params(struct snd_pcm_substream *substream,
-	struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
-	int ret;
-
-	/* use ASRC for internal clocks, as PLL rate isn't multiple of BCLK */
-	rt5663_sel_asrc_clk_src(codec_dai->component,
-			RT5663_DA_STEREO_FILTER | RT5663_AD_STEREO_FILTER,
-			RT5663_CLK_SEL_I2S1_ASRC);
-
-	ret = snd_soc_dai_set_sysclk(codec_dai,
-			RT5663_SCLK_S_MCLK, 24576000, SND_SOC_CLOCK_IN);
-	if (ret < 0)
-		dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n", ret);
-
-	return ret;
-}
-
-static const struct snd_soc_ops kabylake_rt5663_ops = {
-	.hw_params = kabylake_rt5663_hw_params,
-};
-
-static int kabylake_dmic_fixup(struct snd_soc_pcm_runtime *rtd,
-		struct snd_pcm_hw_params *params)
-{
-	struct snd_interval *chan = hw_param_interval(params,
-				SNDRV_PCM_HW_PARAM_CHANNELS);
-
-	if (params_channels(params) == 2 || DMIC_CH(dmic_constraints) == 2)
-		chan->min = chan->max = 2;
-	else
-		chan->min = chan->max = 4;
-
-	return 0;
-}
-
-static int kabylake_ssp0_hw_params(struct snd_pcm_substream *substream,
-					struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai;
-	int ret = 0, j;
-
-	for_each_rtd_codec_dais(rtd, j, codec_dai) {
-		if (!strcmp(codec_dai->component->name, MAXIM_DEV0_NAME)) {
-			/*
-			 * Use channel 4 and 5 for the first amp
-			 */
-			ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x30, 3, 8, 16);
-			if (ret < 0) {
-				dev_err(rtd->dev, "set TDM slot err:%d\n", ret);
-				return ret;
-			}
-		}
-		if (!strcmp(codec_dai->component->name, MAXIM_DEV1_NAME)) {
-			/*
-			 * Use channel 6 and 7 for the second amp
-			 */
-			ret = snd_soc_dai_set_tdm_slot(codec_dai, 0xC0, 3, 8, 16);
-			if (ret < 0) {
-				dev_err(rtd->dev, "set TDM slot err:%d\n", ret);
-				return ret;
-			}
-		}
-	}
-	return ret;
-}
-
-static const struct snd_soc_ops kabylake_ssp0_ops = {
-	.hw_params = kabylake_ssp0_hw_params,
-};
-
-static unsigned int channels_dmic[] = {
-	2, 4,
-};
-
-static struct snd_pcm_hw_constraint_list constraints_dmic_channels = {
-	.count = ARRAY_SIZE(channels_dmic),
-	.list = channels_dmic,
-	.mask = 0,
-};
-
-static const unsigned int dmic_2ch[] = {
-	2,
-};
-
-static const struct snd_pcm_hw_constraint_list constraints_dmic_2ch = {
-	.count = ARRAY_SIZE(dmic_2ch),
-	.list = dmic_2ch,
-	.mask = 0,
-};
-
-static int kabylake_dmic_startup(struct snd_pcm_substream *substream)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-
-	runtime->hw.channels_max = DMIC_CH(dmic_constraints);
-	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
-			dmic_constraints);
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
-static int kabylake_refcap_startup(struct snd_pcm_substream *substream)
-{
-	substream->runtime->hw.channels_max = 1;
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
-					SNDRV_PCM_HW_PARAM_CHANNELS,
-					&constraints_refcap);
-
-	return snd_pcm_hw_constraint_list(substream->runtime, 0,
-				SNDRV_PCM_HW_PARAM_RATE,
-				&constraints_16000);
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
-SND_SOC_DAILINK_DEF(system2,
-	DAILINK_COMP_ARRAY(COMP_CPU("System Pin2")));
-
-SND_SOC_DAILINK_DEF(echoref,
-	DAILINK_COMP_ARRAY(COMP_CPU("Echoref Pin")));
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
-	DAILINK_COMP_ARRAY(
-	/* Left */	COMP_CODEC(MAXIM_DEV0_NAME, KBL_MAXIM_CODEC_DAI),
-	/* Right */	COMP_CODEC(MAXIM_DEV1_NAME, KBL_MAXIM_CODEC_DAI)));
-
-SND_SOC_DAILINK_DEF(ssp1_pin,
-	DAILINK_COMP_ARRAY(COMP_CPU("SSP1 Pin")));
-SND_SOC_DAILINK_DEF(ssp1_codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC5663:00",
-				      KBL_REALTEK_CODEC_DAI)));
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
-/* kabylake digital audio interface glue - connects codec <--> CPU */
-static struct snd_soc_dai_link kabylake_dais[] = {
-	/* Front End DAI links */
-	[KBL_DPCM_AUDIO_PB] = {
-		.name = "Kbl Audio Port",
-		.stream_name = "Audio",
-		.dynamic = 1,
-		.nonatomic = 1,
-		.init = kabylake_rt5663_fe_init,
-		.trigger = {
-			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.ops = &kabylake_rt5663_fe_ops,
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
-		.ops = &kabylake_rt5663_fe_ops,
-		SND_SOC_DAILINK_REG(system, dummy, platform),
-	},
-	[KBL_DPCM_AUDIO_HS_PB] = {
-		.name = "Kbl Audio Headset Playback",
-		.stream_name = "Headset Audio",
-		.dpcm_playback = 1,
-		.nonatomic = 1,
-		.dynamic = 1,
-		SND_SOC_DAILINK_REG(system2, dummy, platform),
-	},
-	[KBL_DPCM_AUDIO_ECHO_REF_CP] = {
-		.name = "Kbl Audio Echo Reference cap",
-		.stream_name = "Echoreference Capture",
-		.init = NULL,
-		.dpcm_capture = 1,
-		.nonatomic = 1,
-		SND_SOC_DAILINK_REG(echoref, dummy, platform),
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
-		.dai_fmt = SND_SOC_DAIFMT_DSP_B |
-			SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBC_CFC,
-		.ignore_pmdown_time = 1,
-		.be_hw_params_fixup = kabylake_ssp_fixup,
-		.dpcm_playback = 1,
-		.ops = &kabylake_ssp0_ops,
-		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
-	},
-	{
-		/* SSP1 - Codec */
-		.name = "SSP1-Codec",
-		.id = 1,
-		.no_pcm = 1,
-		.init = kabylake_rt5663_max98927_codec_init,
-		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBC_CFC,
-		.ignore_pmdown_time = 1,
-		.be_hw_params_fixup = kabylake_ssp_fixup,
-		.ops = &kabylake_rt5663_ops,
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
-		SND_SOC_DAILINK_REG(dmic01_pin, dmic_codec, platform),
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
-static struct snd_soc_dai_link kabylake_5663_dais[] = {
-	/* Front End DAI links */
-	[KBL_DPCM_AUDIO_5663_PB] = {
-		.name = "Kbl Audio Port",
-		.stream_name = "Audio",
-		.dynamic = 1,
-		.nonatomic = 1,
-		.trigger = {
-			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.ops = &kabylake_rt5663_fe_ops,
-		SND_SOC_DAILINK_REG(system, dummy, platform),
-	},
-	[KBL_DPCM_AUDIO_5663_CP] = {
-		.name = "Kbl Audio Capture Port",
-		.stream_name = "Audio Record",
-		.dynamic = 1,
-		.nonatomic = 1,
-		.trigger = {
-			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
-		.ops = &kabylake_rt5663_fe_ops,
-		SND_SOC_DAILINK_REG(system, dummy, platform),
-	},
-	[KBL_DPCM_AUDIO_5663_HDMI1_PB] = {
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
-	[KBL_DPCM_AUDIO_5663_HDMI2_PB] = {
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
-
-	/* Back End DAI links */
-	{
-		/* SSP1 - Codec */
-		.name = "SSP1-Codec",
-		.id = 0,
-		.no_pcm = 1,
-		.init = kabylake_rt5663_codec_init,
-		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBC_CFC,
-		.ignore_pmdown_time = 1,
-		.be_hw_params_fixup = kabylake_ssp_fixup,
-		.ops = &kabylake_rt5663_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
-		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
-	},
-	{
-		.name = "iDisp1",
-		.id = 1,
-		.dpcm_playback = 1,
-		.init = kabylake_5663_hdmi1_init,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
-	},
-	{
-		.name = "iDisp2",
-		.id = 2,
-		.init = kabylake_5663_hdmi2_init,
-		.dpcm_playback = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
-	},
-};
-
-#define NAME_SIZE	32
-static int kabylake_card_late_probe(struct snd_soc_card *card)
-{
-	struct kbl_rt5663_private *ctx = snd_soc_card_get_drvdata(card);
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
-/* kabylake audio machine driver for SPT + RT5663 */
-static struct snd_soc_card kabylake_audio_card_rt5663_m98927 = {
-	.name = "kblrt5663max",
-	.owner = THIS_MODULE,
-	.dai_link = kabylake_dais,
-	.num_links = ARRAY_SIZE(kabylake_dais),
-	.controls = kabylake_controls,
-	.num_controls = ARRAY_SIZE(kabylake_controls),
-	.dapm_widgets = kabylake_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(kabylake_widgets),
-	.dapm_routes = kabylake_map,
-	.num_dapm_routes = ARRAY_SIZE(kabylake_map),
-	.codec_conf = max98927_codec_conf,
-	.num_configs = ARRAY_SIZE(max98927_codec_conf),
-	.fully_routed = true,
-	.disable_route_checks = true,
-	.late_probe = kabylake_card_late_probe,
-};
-
-/* kabylake audio machine driver for RT5663 */
-static struct snd_soc_card kabylake_audio_card_rt5663 = {
-	.name = "kblrt5663",
-	.owner = THIS_MODULE,
-	.dai_link = kabylake_5663_dais,
-	.num_links = ARRAY_SIZE(kabylake_5663_dais),
-	.controls = kabylake_5663_controls,
-	.num_controls = ARRAY_SIZE(kabylake_5663_controls),
-	.dapm_widgets = kabylake_5663_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(kabylake_5663_widgets),
-	.dapm_routes = kabylake_5663_map,
-	.num_dapm_routes = ARRAY_SIZE(kabylake_5663_map),
-	.fully_routed = true,
-	.disable_route_checks = true,
-	.late_probe = kabylake_card_late_probe,
-};
-
-static int kabylake_audio_probe(struct platform_device *pdev)
-{
-	struct kbl_rt5663_private *ctx;
-	struct snd_soc_acpi_mach *mach;
-	int ret;
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
-
-	mach = pdev->dev.platform_data;
-	if (mach)
-		dmic_constraints = mach->mach_params.dmic_num == 2 ?
-			&constraints_dmic_2ch : &constraints_dmic_channels;
-
-	ctx->mclk = devm_clk_get(&pdev->dev, "ssp1_mclk");
-	if (IS_ERR(ctx->mclk)) {
-		ret = PTR_ERR(ctx->mclk);
-		if (ret == -ENOENT) {
-			dev_info(&pdev->dev,
-				"Failed to get ssp1_sclk, defer probe\n");
-			return -EPROBE_DEFER;
-		}
-
-		dev_err(&pdev->dev, "Failed to get ssp1_mclk with err:%d\n",
-								ret);
-		return ret;
-	}
-
-	ctx->sclk = devm_clk_get(&pdev->dev, "ssp1_sclk");
-	if (IS_ERR(ctx->sclk)) {
-		ret = PTR_ERR(ctx->sclk);
-		if (ret == -ENOENT) {
-			dev_info(&pdev->dev,
-				"Failed to get ssp1_sclk, defer probe\n");
-			return -EPROBE_DEFER;
-		}
-
-		dev_err(&pdev->dev, "Failed to get ssp1_sclk with err:%d\n",
-								ret);
-		return ret;
-	}
-
-	return devm_snd_soc_register_card(&pdev->dev, kabylake_audio_card);
-}
-
-static const struct platform_device_id kbl_board_ids[] = {
-	{
-		.name = "kbl_rt5663",
-		.driver_data = (kernel_ulong_t)&kabylake_audio_card_rt5663,
-	},
-	{
-		.name = "kbl_rt5663_m98927",
-		.driver_data =
-			(kernel_ulong_t)&kabylake_audio_card_rt5663_m98927,
-	},
-	{ }
-};
-MODULE_DEVICE_TABLE(platform, kbl_board_ids);
-
-static struct platform_driver kabylake_audio = {
-	.probe = kabylake_audio_probe,
-	.driver = {
-		.name = "kbl_rt5663_m98927",
-		.pm = &snd_soc_pm_ops,
-	},
-	.id_table = kbl_board_ids,
-};
-
-module_platform_driver(kabylake_audio)
-
-/* Module information */
-MODULE_DESCRIPTION("Audio Machine driver-RT5663 & MAX98927 in I2S mode");
-MODULE_AUTHOR("Naveen M <naveen.m@intel.com>");
-MODULE_AUTHOR("Harsha Priya <harshapriya.n@intel.com>");
-MODULE_LICENSE("GPL v2");
-- 
2.25.1

