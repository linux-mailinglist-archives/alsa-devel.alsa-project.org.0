Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF2794EA2C
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2024 11:45:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4510D210B;
	Mon, 12 Aug 2024 11:44:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4510D210B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723455900;
	bh=k4VkIH98ZFpmVpOG03fATVuas2sxjUqfvf5im5/BQcc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GVwtS5umymWSQMY7bFM20yCHcbYFPFDvSmoImg3VPRtsia3YebBrdt3sJq1r3Reqk
	 d+YSVFQNq0ti6obJwgU7+33MSkmJkd+SkM+jBdwGOeE1SaUsTdP/1ol+DFgrVjknPX
	 ahv+m0FIfXo/p61lW8vn2zEXgfmoYT8ed825xELY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2184BF8061B; Mon, 12 Aug 2024 11:43:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF2C5F8061F;
	Mon, 12 Aug 2024 11:43:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEDC4F8057A; Mon, 12 Aug 2024 11:43:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2385F805BE
	for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2024 11:43:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2385F805BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WHW5vGzT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723455787; x=1754991787;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k4VkIH98ZFpmVpOG03fATVuas2sxjUqfvf5im5/BQcc=;
  b=WHW5vGzTrk40sh7gl+/cxn4VhYDyJCFJVGgIjhTbsnPWauVrBHzu6MwN
   y15sdMtFSPAnfUAxJ++xOIWeWfwM1yu/yhCcWuSD5TErgv9ueFcjQyfpd
   rNAPkPEFLpxdLhh4f/ke4MNxu527nPUk3eHOAqLzGxPLf2Q2Fn2L4Idnm
   ghYC7nKuwGGWfj9iDT2+vnwjV7H/Mabo1jBCeLpHBRAFTJKOzRV+JMBw1
   mk6eL1fKxeePenwKsKxd5RecZcx2zqHQkIFlNu2CLig48pSc+MVwOdZid
   SiURTelUPa12uZiaQO/SYyyKB9oMG9lJFnQbSXNYD0oZGK+no1g8jp60D
   w==;
X-CSE-ConnectionGUID: yDD8x/LSSa+8qkjRapPKkg==
X-CSE-MsgGUID: /x4A4WyFTU69KddnPZjjsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21705425"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800";
   d="scan'208";a="21705425"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 02:43:06 -0700
X-CSE-ConnectionGUID: WIRAmYFSSGOgRQxkGiLx8g==
X-CSE-MsgGUID: M4XScATMQdqCQCqBzbo8lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800";
   d="scan'208";a="63057013"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa005.jf.intel.com with ESMTP; 12 Aug 2024 02:43:02 -0700
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
Subject: [PATCH 09/12] ASoC: Intel: Remove skl_nau88l25_ssm4567 board driver
Date: Mon, 12 Aug 2024 11:43:25 +0200
Message-Id: <20240812094328.842661-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240812094328.842661-1-cezary.rojewski@intel.com>
References: <20240812094328.842661-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: X63XNDJMC4XY66EGHUBVPKUC4SYBXI45
X-Message-ID-Hash: X63XNDJMC4XY66EGHUBVPKUC4SYBXI45
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X63XNDJMC4XY66EGHUBVPKUC4SYBXI45/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver has no users.

Succeeded by:
- avs_nau8825 (./intel/avs/boards/nau8825.c)
- avs_ssm4567 (./intel/avs/boards/ssm4567.c)

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/boards/Kconfig                |  14 -
 sound/soc/intel/boards/Makefile               |   2 -
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c | 751 ------------------
 3 files changed, 767 deletions(-)
 delete mode 100644 sound/soc/intel/boards/skl_nau88l25_ssm4567.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 03244ec1933f..243b91501e7f 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -254,20 +254,6 @@ endif ## SND_SST_ATOM_HIFI2_PLATFORM
 
 if SND_SOC_INTEL_SKL
 
-config SND_SOC_INTEL_SKL_NAU88L25_SSM4567_MACH
-	tristate "SKL with NAU88L25 and SSM4567 in I2S Mode"
-	depends on I2C && ACPI
-	depends on MFD_INTEL_LPSS || COMPILE_TEST
-	select SND_SOC_NAU8825
-	select SND_SOC_SSM4567
-	select SND_SOC_DMIC
-	select SND_SOC_HDAC_HDMI
-	help
-	  This adds support for ASoC Onboard Codec I2S machine driver. This will
-	  create an alsa sound card for NAU88L25 + SSM4567.
-	  Say Y or m if you have such a device. This is a recommended option.
-	  If unsure select "N".
-
 config SND_SOC_INTEL_SKL_NAU88L25_MAX98357A_MACH
 	tristate "SKL with NAU88L25 and MAX98357A in I2S Mode"
 	depends on I2C && ACPI
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 3ef77c99ff09..cde3cfae33c1 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -23,7 +23,6 @@ snd-soc-sof_nau8825-y := sof_nau8825.o
 snd-soc-sof_da7219-y := sof_da7219.o
 snd-soc-skl_hda_dsp-y := skl_hda_dsp_generic.o skl_hda_dsp_common.o
 snd-skl_nau88l25_max98357a-y := skl_nau88l25_max98357a.o
-snd-soc-skl_nau88l25_ssm4567-y := skl_nau88l25_ssm4567.o
 snd-soc-ehl-rt5660-y := ehl_rt5660.o
 snd-soc-sof-ssp-amp-y := sof_ssp_amp.o
 snd-soc-sof-sdw-y += sof_sdw.o				\
@@ -51,7 +50,6 @@ obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_DA7213_MACH) += snd-soc-sst-byt-cht-da7213.o
 obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_ES8316_MACH) += snd-soc-sst-byt-cht-es8316.o
 obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_NOCODEC_MACH) += snd-soc-sst-byt-cht-nocodec.o
 obj-$(CONFIG_SND_SOC_INTEL_SKL_NAU88L25_MAX98357A_MACH) += snd-skl_nau88l25_max98357a.o
-obj-$(CONFIG_SND_SOC_INTEL_SKL_NAU88L25_SSM4567_MACH) += snd-soc-skl_nau88l25_ssm4567.o
 obj-$(CONFIG_SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH) += snd-soc-skl_hda_dsp.o
 obj-$(CONFIG_SND_SOC_INTEL_EHL_RT5660_MACH) += snd-soc-ehl-rt5660.o
 obj-$(CONFIG_SND_SOC_INTEL_SOUNDWIRE_SOF_MACH) += snd-soc-sof-sdw.o
diff --git a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
deleted file mode 100644
index d53bf3516c0d..000000000000
--- a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
+++ /dev/null
@@ -1,751 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Intel Skylake I2S Machine Driver for NAU88L25+SSM4567
- *
- * Copyright (C) 2015, Intel Corporation
- *
- * Modified from:
- *   Intel Skylake I2S Machine Driver for NAU88L25 and SSM4567
- *
- *   Copyright (C) 2015, Intel Corporation
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
-#include "../../codecs/nau8825.h"
-#include "../../codecs/hdac_hdmi.h"
-
-#define SKL_NUVOTON_CODEC_DAI	"nau8825-hifi"
-#define SKL_SSM_CODEC_DAI	"ssm4567-hifi"
-#define DMIC_CH(p)     p->list[p->count-1]
-
-static struct snd_soc_jack skylake_headset;
-static struct snd_soc_card skylake_audio_card;
-static const struct snd_pcm_hw_constraint_list *dmic_constraints;
-static struct snd_soc_jack skylake_hdmi[3];
-
-struct skl_hdmi_pcm {
-	struct list_head head;
-	struct snd_soc_dai *codec_dai;
-	int device;
-};
-
-struct skl_nau88125_private {
-	struct list_head hdmi_pcm_list;
-};
-enum {
-	SKL_DPCM_AUDIO_PB = 0,
-	SKL_DPCM_AUDIO_CP,
-	SKL_DPCM_AUDIO_REF_CP,
-	SKL_DPCM_AUDIO_DMIC_CP,
-	SKL_DPCM_AUDIO_HDMI1_PB,
-	SKL_DPCM_AUDIO_HDMI2_PB,
-	SKL_DPCM_AUDIO_HDMI3_PB,
-};
-
-static const struct snd_kcontrol_new skylake_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
-	SOC_DAPM_PIN_SWITCH("Headset Mic"),
-	SOC_DAPM_PIN_SWITCH("Left Speaker"),
-	SOC_DAPM_PIN_SWITCH("Right Speaker"),
-};
-
-static int platform_clock_control(struct snd_soc_dapm_widget *w,
-		struct snd_kcontrol *k, int  event)
-{
-	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct snd_soc_card *card = dapm->card;
-	struct snd_soc_dai *codec_dai;
-	int ret;
-
-	codec_dai = snd_soc_card_get_codec_dai(card, SKL_NUVOTON_CODEC_DAI);
-	if (!codec_dai) {
-		dev_err(card->dev, "Codec dai not found\n");
-		return -EIO;
-	}
-
-	if (SND_SOC_DAPM_EVENT_ON(event)) {
-		ret = snd_soc_dai_set_sysclk(codec_dai,
-				NAU8825_CLK_MCLK, 24000000, SND_SOC_CLOCK_IN);
-		if (ret < 0) {
-			dev_err(card->dev, "set sysclk err = %d\n", ret);
-			return -EIO;
-		}
-	} else {
-		ret = snd_soc_dai_set_sysclk(codec_dai,
-				NAU8825_CLK_INTERNAL, 0, SND_SOC_CLOCK_IN);
-		if (ret < 0) {
-			dev_err(card->dev, "set sysclk err = %d\n", ret);
-			return -EIO;
-		}
-	}
-	return ret;
-}
-
-static const struct snd_soc_dapm_widget skylake_widgets[] = {
-	SND_SOC_DAPM_HP("Headphone Jack", NULL),
-	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-	SND_SOC_DAPM_SPK("Left Speaker", NULL),
-	SND_SOC_DAPM_SPK("Right Speaker", NULL),
-	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
-	SND_SOC_DAPM_SPK("DP1", NULL),
-	SND_SOC_DAPM_SPK("DP2", NULL),
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
-static const struct snd_soc_dapm_route skylake_map[] = {
-	/* HP jack connectors - unknown if we have jack detection */
-	{"Headphone Jack", NULL, "HPOL"},
-	{"Headphone Jack", NULL, "HPOR"},
-
-	/* speaker */
-	{"Left Speaker", NULL, "Left OUT"},
-	{"Right Speaker", NULL, "Right OUT"},
-
-	/* other jacks */
-	{"MIC", NULL, "Headset Mic"},
-	{"DMic", NULL, "SoC DMIC"},
-
-	/* CODEC BE connections */
-	{ "Left Playback", NULL, "ssp0 Tx"},
-	{ "Right Playback", NULL, "ssp0 Tx"},
-	{ "ssp0 Tx", NULL, "codec0_out"},
-
-	/* IV feedback path */
-	{ "codec0_lp_in", NULL, "ssp0 Rx"},
-	{ "ssp0 Rx", NULL, "Left Capture Sense" },
-	{ "ssp0 Rx", NULL, "Right Capture Sense" },
-
-	{ "Playback", NULL, "ssp1 Tx"},
-	{ "ssp1 Tx", NULL, "codec1_out"},
-
-	{ "codec0_in", NULL, "ssp1 Rx" },
-	{ "ssp1 Rx", NULL, "Capture" },
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
-
-	{ "Headphone Jack", NULL, "Platform Clock" },
-	{ "Headset Mic", NULL, "Platform Clock" },
-};
-
-static struct snd_soc_codec_conf ssm4567_codec_conf[] = {
-	{
-		.dlc = COMP_CODEC_CONF("i2c-INT343B:00"),
-		.name_prefix = "Left",
-	},
-	{
-		.dlc = COMP_CODEC_CONF("i2c-INT343B:01"),
-		.name_prefix = "Right",
-	},
-};
-
-static int skylake_ssm4567_codec_init(struct snd_soc_pcm_runtime *rtd)
-{
-	int ret;
-
-	/* Slot 1 for left */
-	ret = snd_soc_dai_set_tdm_slot(snd_soc_rtd_to_codec(rtd, 0), 0x01, 0x01, 2, 48);
-	if (ret < 0)
-		return ret;
-
-	/* Slot 2 for right */
-	ret = snd_soc_dai_set_tdm_slot(snd_soc_rtd_to_codec(rtd, 1), 0x02, 0x02, 2, 48);
-	if (ret < 0)
-		return ret;
-
-	return ret;
-}
-
-static int skylake_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
-{
-	int ret;
-	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
-
-	/*
-	 * 4 buttons here map to the google Reference headset
-	 * The use of these buttons can be decided by the user space.
-	 */
-	ret = snd_soc_card_jack_new_pins(&skylake_audio_card, "Headset Jack",
-					 SND_JACK_HEADSET | SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-					 SND_JACK_BTN_2 | SND_JACK_BTN_3, &skylake_headset,
-					 jack_pins,
-					 ARRAY_SIZE(jack_pins));
-	if (ret) {
-		dev_err(rtd->dev, "Headset Jack creation failed %d\n", ret);
-		return ret;
-	}
-
-	nau8825_enable_jack_detect(component, &skylake_headset);
-
-	snd_soc_dapm_ignore_suspend(&rtd->card->dapm, "SoC DMIC");
-
-	return ret;
-}
-
-static int skylake_hdmi1_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct skl_nau88125_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
-	struct skl_hdmi_pcm *pcm;
-
-	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
-	if (!pcm)
-		return -ENOMEM;
-
-	pcm->device = SKL_DPCM_AUDIO_HDMI1_PB;
-	pcm->codec_dai = dai;
-
-	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
-
-	return 0;
-}
-
-static int skylake_hdmi2_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct skl_nau88125_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
-	struct skl_hdmi_pcm *pcm;
-
-	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
-	if (!pcm)
-		return -ENOMEM;
-
-	pcm->device = SKL_DPCM_AUDIO_HDMI2_PB;
-	pcm->codec_dai = dai;
-
-	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
-
-	return 0;
-}
-
-
-static int skylake_hdmi3_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct skl_nau88125_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
-	struct skl_hdmi_pcm *pcm;
-
-	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
-	if (!pcm)
-		return -ENOMEM;
-
-	pcm->device = SKL_DPCM_AUDIO_HDMI3_PB;
-	pcm->codec_dai = dai;
-
-	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
-
-	return 0;
-}
-
-static int skylake_nau8825_fe_init(struct snd_soc_pcm_runtime *rtd)
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
-static const struct snd_soc_ops skylake_nau8825_fe_ops = {
-	.startup = skl_fe_startup,
-};
-
-static int skylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
-			struct snd_pcm_hw_params *params)
-{
-	struct snd_interval *rate = hw_param_interval(params,
-			SNDRV_PCM_HW_PARAM_RATE);
-	struct snd_interval *chan = hw_param_interval(params,
-						SNDRV_PCM_HW_PARAM_CHANNELS);
-	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
-
-	/* The ADSP will convert the FE rate to 48k, stereo */
-	rate->min = rate->max = 48000;
-	chan->min = chan->max = 2;
-
-	/* set SSP0 to 24 bit */
-	snd_mask_none(fmt);
-	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
-	return 0;
-}
-
-static int skylake_dmic_fixup(struct snd_soc_pcm_runtime *rtd,
-			struct snd_pcm_hw_params *params)
-{
-	struct snd_interval *chan = hw_param_interval(params,
-						SNDRV_PCM_HW_PARAM_CHANNELS);
-	if (params_channels(params) == 2 || DMIC_CH(dmic_constraints) == 2)
-		chan->min = chan->max = 2;
-	else
-		chan->min = chan->max = 4;
-
-	return 0;
-}
-
-static int skylake_nau8825_hw_params(struct snd_pcm_substream *substream,
-	struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
-	int ret;
-
-	ret = snd_soc_dai_set_sysclk(codec_dai,
-			NAU8825_CLK_MCLK, 24000000, SND_SOC_CLOCK_IN);
-
-	if (ret < 0)
-		dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n", ret);
-
-	return ret;
-}
-
-static const struct snd_soc_ops skylake_nau8825_ops = {
-	.hw_params = skylake_nau8825_hw_params,
-};
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
-static int skylake_dmic_startup(struct snd_pcm_substream *substream)
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
-static const struct snd_soc_ops skylake_dmic_ops = {
-	.startup = skylake_dmic_startup,
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
-static int skylake_refcap_startup(struct snd_pcm_substream *substream)
-{
-	substream->runtime->hw.channels_max = 1;
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
-					SNDRV_PCM_HW_PARAM_CHANNELS,
-					&constraints_refcap);
-
-	return snd_pcm_hw_constraint_list(substream->runtime, 0,
-			SNDRV_PCM_HW_PARAM_RATE,
-			&constraints_16000);
-}
-
-static const struct snd_soc_ops skylake_refcap_ops = {
-	.startup = skylake_refcap_startup,
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
-	DAILINK_COMP_ARRAY(
-	/* Left */	COMP_CODEC("i2c-INT343B:00", SKL_SSM_CODEC_DAI),
-	/* Right */	COMP_CODEC("i2c-INT343B:01", SKL_SSM_CODEC_DAI)));
-
-SND_SOC_DAILINK_DEF(ssp1_pin,
-	DAILINK_COMP_ARRAY(COMP_CPU("SSP1 Pin")));
-SND_SOC_DAILINK_DEF(ssp1_codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10508825:00", SKL_NUVOTON_CODEC_DAI)));
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
-static struct snd_soc_dai_link skylake_dais[] = {
-	/* Front End DAI links */
-	[SKL_DPCM_AUDIO_PB] = {
-		.name = "Skl Audio Port",
-		.stream_name = "Audio",
-		.dynamic = 1,
-		.nonatomic = 1,
-		.init = skylake_nau8825_fe_init,
-		.trigger = {
-			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.ops = &skylake_nau8825_fe_ops,
-		SND_SOC_DAILINK_REG(system, dummy, platform),
-	},
-	[SKL_DPCM_AUDIO_CP] = {
-		.name = "Skl Audio Capture Port",
-		.stream_name = "Audio Record",
-		.dynamic = 1,
-		.nonatomic = 1,
-		.trigger = {
-			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
-		.ops = &skylake_nau8825_fe_ops,
-		SND_SOC_DAILINK_REG(system, dummy, platform),
-	},
-	[SKL_DPCM_AUDIO_REF_CP] = {
-		.name = "Skl Audio Reference cap",
-		.stream_name = "Wake on Voice",
-		.init = NULL,
-		.dpcm_capture = 1,
-		.nonatomic = 1,
-		.dynamic = 1,
-		.ops = &skylake_refcap_ops,
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
-		.trigger = {
-			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.nonatomic = 1,
-		.dynamic = 1,
-		SND_SOC_DAILINK_REG(hdmi1, dummy, platform),
-	},
-	[SKL_DPCM_AUDIO_HDMI2_PB] = {
-		.name = "Skl HDMI Port2",
-		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
-		.init = NULL,
-		.trigger = {
-			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.nonatomic = 1,
-		.dynamic = 1,
-		SND_SOC_DAILINK_REG(hdmi2, dummy, platform),
-	},
-	[SKL_DPCM_AUDIO_HDMI3_PB] = {
-		.name = "Skl HDMI Port3",
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
-		.dai_fmt = SND_SOC_DAIFMT_DSP_A |
-			SND_SOC_DAIFMT_IB_NF |
-			SND_SOC_DAIFMT_CBC_CFC,
-		.init = skylake_ssm4567_codec_init,
-		.ignore_pmdown_time = 1,
-		.be_hw_params_fixup = skylake_ssp_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
-		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
-	},
-	{
-		/* SSP1 - Codec */
-		.name = "SSP1-Codec",
-		.id = 1,
-		.no_pcm = 1,
-		.init = skylake_nau8825_codec_init,
-		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBC_CFC,
-		.ignore_pmdown_time = 1,
-		.be_hw_params_fixup = skylake_ssp_fixup,
-		.ops = &skylake_nau8825_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
-		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
-	},
-	{
-		.name = "dmic01",
-		.id = 2,
-		.ignore_suspend = 1,
-		.be_hw_params_fixup = skylake_dmic_fixup,
-		.dpcm_capture = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(dmic01_pin, dmic_codec, platform),
-	},
-	{
-		.name = "iDisp1",
-		.id = 3,
-		.dpcm_playback = 1,
-		.init = skylake_hdmi1_init,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
-	},
-	{
-		.name = "iDisp2",
-		.id = 4,
-		.init = skylake_hdmi2_init,
-		.dpcm_playback = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
-	},
-	{
-		.name = "iDisp3",
-		.id = 5,
-		.init = skylake_hdmi3_init,
-		.dpcm_playback = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
-	},
-};
-
-#define NAME_SIZE	32
-static int skylake_card_late_probe(struct snd_soc_card *card)
-{
-	struct skl_nau88125_private *ctx = snd_soc_card_get_drvdata(card);
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
-					SND_JACK_AVOUT,
-					&skylake_hdmi[i]);
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
-/* skylake audio machine driver for SPT + NAU88L25 */
-static struct snd_soc_card skylake_audio_card = {
-	.name = "sklnau8825adi",
-	.owner = THIS_MODULE,
-	.dai_link = skylake_dais,
-	.num_links = ARRAY_SIZE(skylake_dais),
-	.controls = skylake_controls,
-	.num_controls = ARRAY_SIZE(skylake_controls),
-	.dapm_widgets = skylake_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(skylake_widgets),
-	.dapm_routes = skylake_map,
-	.num_dapm_routes = ARRAY_SIZE(skylake_map),
-	.codec_conf = ssm4567_codec_conf,
-	.num_configs = ARRAY_SIZE(ssm4567_codec_conf),
-	.fully_routed = true,
-	.disable_route_checks = true,
-	.late_probe = skylake_card_late_probe,
-};
-
-static int skylake_audio_probe(struct platform_device *pdev)
-{
-	struct skl_nau88125_private *ctx;
-	struct snd_soc_acpi_mach *mach;
-
-	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
-
-	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
-
-	skylake_audio_card.dev = &pdev->dev;
-	snd_soc_card_set_drvdata(&skylake_audio_card, ctx);
-
-	mach = pdev->dev.platform_data;
-	if (mach)
-		dmic_constraints = mach->mach_params.dmic_num == 2 ?
-			&constraints_dmic_2ch : &constraints_dmic_channels;
-
-	return devm_snd_soc_register_card(&pdev->dev, &skylake_audio_card);
-}
-
-static const struct platform_device_id skl_board_ids[] = {
-	{ .name = "skl_n88l25_s4567" },
-	{ .name = "kbl_n88l25_s4567" },
-	{ }
-};
-MODULE_DEVICE_TABLE(platform, skl_board_ids);
-
-static struct platform_driver skylake_audio = {
-	.probe = skylake_audio_probe,
-	.driver = {
-		.name = "skl_n88l25_s4567",
-		.pm = &snd_soc_pm_ops,
-	},
-	.id_table = skl_board_ids,
-};
-
-module_platform_driver(skylake_audio)
-
-/* Module information */
-MODULE_AUTHOR("Conrad Cooke  <conrad.cooke@intel.com>");
-MODULE_AUTHOR("Harsha Priya <harshapriya.n@intel.com>");
-MODULE_AUTHOR("Naveen M <naveen.m@intel.com>");
-MODULE_AUTHOR("Sathya Prakash M R <sathya.prakash.m.r@intel.com>");
-MODULE_AUTHOR("Yong Zhi <yong.zhi@intel.com>");
-MODULE_DESCRIPTION("Intel Audio Machine driver for SKL with NAU88L25 and SSM4567 in I2S Mode");
-MODULE_LICENSE("GPL v2");
-- 
2.25.1

