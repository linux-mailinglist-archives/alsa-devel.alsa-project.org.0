Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 251788A21C1
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Apr 2024 00:33:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AE5B2BF1;
	Fri, 12 Apr 2024 00:32:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AE5B2BF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712874785;
	bh=NwczKBxooXquJwHqESbYnZX1CKyd5ctIdsT/ZkpjhWA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qyXSnCZgVmskFJROWXnqYtXuMbkFDpe8QfKM3hDtG8L6CAbUbOEF2rzcWAbwPVSGi
	 vp1/EMU2NsEMZsbHnvoVW/HXJTOO5XaZg57cVzH1BuXhLLy//UMHqxxavMMi4P+f17
	 zY5uHyA9qmXO4GblbNXXNeB4dT7XDobGqlu6v+zk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21524F8060C; Fri, 12 Apr 2024 00:31:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF354F80622;
	Fri, 12 Apr 2024 00:31:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D407EF8026D; Fri, 12 Apr 2024 00:16:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 308CCF80571
	for <alsa-devel@alsa-project.org>; Fri, 12 Apr 2024 00:04:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 308CCF80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IW3NHMUB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712873069; x=1744409069;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NwczKBxooXquJwHqESbYnZX1CKyd5ctIdsT/ZkpjhWA=;
  b=IW3NHMUB/aZ7633dsT3LDDk9W/HGjCk9vJ3tbqEpRh5i1O97exD5SrZt
   rOCiMo3P6C98NDpHar1APtPz9S1CBaD4xiDwSe1p1gWh9zVXJaYySIwx6
   GhrvuCeJpMI04cKEhzr/ubAAAcIVO2oA7Klqx7AvfqGxP+eUxTG+df6Pq
   fPq0CZImq5ZbjxVT8B17T+JJ0PSHvVof7/wY8dG0dFLvSTMJLhhNM9QJU
   CtKpfzV1stHLpnyNjlk/H+0tTHS7noexUVDzZ9l43IZvISCs0a8ZGTGVd
   qd7qbTzEznWuCqEvtjnhJI/AE0Pip0wq0vIYBx1sAf+QrKRCbn8/S4Rpp
   A==;
X-CSE-ConnectionGUID: 7KVK67seT7KW/G9Sa7IS+w==
X-CSE-MsgGUID: 0tIwQHm/QZOh4rWQS64lkA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19708386"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000";
   d="scan'208";a="19708386"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 15:04:20 -0700
X-CSE-ConnectionGUID: cilZuo5ISTml0wh107hhPA==
X-CSE-MsgGUID: kLByJ/icRrWPnJd+lkztiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000";
   d="scan'208";a="21628768"
Received: from aramana1-mobl.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.213.177.233])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 15:04:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Chao Song <chao.song@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 11/12] ASoC: Intel: cml_rt1011_rt5682: delete driver
Date: Thu, 11 Apr 2024 17:03:46 -0500
Message-Id: <20240411220347.131267-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
References: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2P2FWMDCOH3IWHIOLTJOWYMN43DBWFRN
X-Message-ID-Hash: 2P2FWMDCOH3IWHIOLTJOWYMN43DBWFRN
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2P2FWMDCOH3IWHIOLTJOWYMN43DBWFRN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Delete this driver and use sof_rt5682 machine driver instead.

Reviewed-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig                |  12 +-
 sound/soc/intel/boards/Makefile               |   2 -
 sound/soc/intel/boards/cml_rt1011_rt5682.c    | 609 ------------------
 .../intel/common/soc-acpi-intel-cml-match.c   |   2 +-
 4 files changed, 4 insertions(+), 621 deletions(-)
 delete mode 100644 sound/soc/intel/boards/cml_rt1011_rt5682.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 9f4a85513702..0ad7b0a1e237 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -595,17 +595,11 @@ config SND_SOC_INTEL_CML_LP_DA7219_MAX98357A_MACH
 
 config SND_SOC_INTEL_SOF_CML_RT1011_RT5682_MACH
 	tristate "CML with RT1011 and RT5682 in I2S Mode"
-	depends on I2C && ACPI
-	depends on MFD_INTEL_LPSS || COMPILE_TEST
-	depends on SND_HDA_CODEC_HDMI && SND_SOC_SOF_HDA_AUDIO_CODEC
-	select SND_SOC_RT1011
-	select SND_SOC_RT5682_I2C
-	select SND_SOC_DMIC
-	select SND_SOC_HDAC_HDMI
-	select SND_SOC_INTEL_HDA_DSP_COMMON
+	imply SND_SOC_INTEL_SOF_RT5682_MACH
 	help
 	  This adds support for ASoC machine driver for SOF platform with
-	  RT1011 + RT5682 I2S codec.
+	  RT1011 + RT5682 I2S codec. This option is deprecated and please used
+	  SND_SOC_INTEL_SOF_RT5682_MACH instead.
 	  Say Y if you have such a device.
 	  If unsure select "N".
 
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index a93b658ed672..119413c262de 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -24,7 +24,6 @@ snd-soc-sof_cs42l42-objs := sof_cs42l42.o
 snd-soc-sof_es8336-objs := sof_es8336.o
 snd-soc-sof_nau8825-objs := sof_nau8825.o
 snd-soc-sof_da7219-objs := sof_da7219.o
-snd-soc-cml_rt1011_rt5682-objs := cml_rt1011_rt5682.o
 snd-soc-kbl_da7219_max98357a-objs := kbl_da7219_max98357a.o
 snd-soc-kbl_da7219_max98927-objs := kbl_da7219_max98927.o
 snd-soc-kbl_rt5663_max98927-objs := kbl_rt5663_max98927.o
@@ -71,7 +70,6 @@ obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_CX2072X_MACH) += snd-soc-sst-byt-cht-cx2072x.
 obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_DA7213_MACH) += snd-soc-sst-byt-cht-da7213.o
 obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_ES8316_MACH) += snd-soc-sst-byt-cht-es8316.o
 obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_NOCODEC_MACH) += snd-soc-sst-byt-cht-nocodec.o
-obj-$(CONFIG_SND_SOC_INTEL_SOF_CML_RT1011_RT5682_MACH) += snd-soc-cml_rt1011_rt5682.o
 obj-$(CONFIG_SND_SOC_INTEL_KBL_DA7219_MAX98357A_MACH) += snd-soc-kbl_da7219_max98357a.o
 obj-$(CONFIG_SND_SOC_INTEL_KBL_DA7219_MAX98927_MACH) += snd-soc-kbl_da7219_max98927.o
 obj-$(CONFIG_SND_SOC_INTEL_KBL_RT5663_MAX98927_MACH) += snd-soc-kbl_rt5663_max98927.o
diff --git a/sound/soc/intel/boards/cml_rt1011_rt5682.c b/sound/soc/intel/boards/cml_rt1011_rt5682.c
deleted file mode 100644
index 679a09b63ea5..000000000000
--- a/sound/soc/intel/boards/cml_rt1011_rt5682.c
+++ /dev/null
@@ -1,609 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-// Copyright(c) 2019 Intel Corporation.
-
-/*
- * Intel Cometlake I2S Machine driver for RT1011 + RT5682 codec
- */
-
-#include <linux/input.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/clk.h>
-#include <linux/dmi.h>
-#include <linux/slab.h>
-#include <linux/acpi.h>
-#include <sound/core.h>
-#include <sound/jack.h>
-#include <sound/pcm.h>
-#include <sound/pcm_params.h>
-#include <sound/soc.h>
-#include <sound/rt5682.h>
-#include <sound/soc-acpi.h>
-#include "../../codecs/rt1011.h"
-#include "../../codecs/rt5682.h"
-#include "../../codecs/hdac_hdmi.h"
-#include "hda_dsp_common.h"
-
-/* The platform clock outputs 24Mhz clock to codec as I2S MCLK */
-#define CML_PLAT_CLK	24000000
-#define CML_RT1011_CODEC_DAI "rt1011-aif"
-#define CML_RT5682_CODEC_DAI "rt5682-aif1"
-#define NAME_SIZE 32
-
-#define SOF_RT1011_SPEAKER_WL		BIT(0)
-#define SOF_RT1011_SPEAKER_WR		BIT(1)
-#define SOF_RT1011_SPEAKER_TL		BIT(2)
-#define SOF_RT1011_SPEAKER_TR		BIT(3)
-
-/* Default: Woofer speakers  */
-static unsigned long sof_rt1011_quirk = SOF_RT1011_SPEAKER_WL |
-					SOF_RT1011_SPEAKER_WR;
-
-static int sof_rt1011_quirk_cb(const struct dmi_system_id *id)
-{
-	sof_rt1011_quirk = (unsigned long)id->driver_data;
-	return 1;
-}
-
-static const struct dmi_system_id sof_rt1011_quirk_table[] = {
-	{
-		.callback = sof_rt1011_quirk_cb,
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Helios"),
-	},
-		.driver_data = (void *)(SOF_RT1011_SPEAKER_WL | SOF_RT1011_SPEAKER_WR |
-					SOF_RT1011_SPEAKER_TL | SOF_RT1011_SPEAKER_TR),
-	},
-	{
-	}
-};
-
-static struct snd_soc_jack hdmi_jack[3];
-
-struct hdmi_pcm {
-	struct list_head head;
-	struct snd_soc_dai *codec_dai;
-	int device;
-};
-
-struct card_private {
-	char codec_name[SND_ACPI_I2C_ID_LEN];
-	struct snd_soc_jack headset;
-	struct list_head hdmi_pcm_list;
-	bool common_hdmi_codec_drv;
-};
-
-static const struct snd_kcontrol_new cml_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
-	SOC_DAPM_PIN_SWITCH("Headset Mic"),
-	SOC_DAPM_PIN_SWITCH("WL Ext Spk"),
-	SOC_DAPM_PIN_SWITCH("WR Ext Spk"),
-};
-
-static const struct snd_kcontrol_new cml_rt1011_tt_controls[] = {
-	SOC_DAPM_PIN_SWITCH("TL Ext Spk"),
-	SOC_DAPM_PIN_SWITCH("TR Ext Spk"),
-};
-
-static const struct snd_soc_dapm_widget cml_rt1011_rt5682_widgets[] = {
-	SND_SOC_DAPM_SPK("WL Ext Spk", NULL),
-	SND_SOC_DAPM_SPK("WR Ext Spk", NULL),
-	SND_SOC_DAPM_HP("Headphone Jack", NULL),
-	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
-};
-
-static const struct snd_soc_dapm_widget cml_rt1011_tt_widgets[] = {
-	SND_SOC_DAPM_SPK("TL Ext Spk", NULL),
-	SND_SOC_DAPM_SPK("TR Ext Spk", NULL),
-};
-
-static const struct snd_soc_dapm_route cml_rt1011_rt5682_map[] = {
-	/*WL/WR speaker*/
-	{"WL Ext Spk", NULL, "WL SPO"},
-	{"WR Ext Spk", NULL, "WR SPO"},
-
-	/* HP jack connectors - unknown if we have jack detection */
-	{ "Headphone Jack", NULL, "HPOL" },
-	{ "Headphone Jack", NULL, "HPOR" },
-
-	/* other jacks */
-	{ "IN1P", NULL, "Headset Mic" },
-
-	/* DMIC */
-	{"DMic", NULL, "SoC DMIC"},
-};
-
-static const struct snd_soc_dapm_route cml_rt1011_tt_map[] = {
-	/*TL/TR speaker*/
-	{"TL Ext Spk", NULL, "TL SPO" },
-	{"TR Ext Spk", NULL, "TR SPO" },
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
-static int cml_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
-	struct snd_soc_jack *jack;
-	int ret;
-
-	/* need to enable ASRC function for 24MHz mclk rate */
-	rt5682_sel_asrc_clk_src(component, RT5682_DA_STEREO1_FILTER |
-					RT5682_AD_STEREO1_FILTER,
-					RT5682_CLK_SEL_I2S1_ASRC);
-
-	/*
-	 * Headset buttons map to the google Reference headset.
-	 * These can be configured by userspace.
-	 */
-	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
-					 SND_JACK_HEADSET | SND_JACK_BTN_0 |
-					 SND_JACK_BTN_1 | SND_JACK_BTN_2 |
-					 SND_JACK_BTN_3,
-					 &ctx->headset,
-					 jack_pins,
-					 ARRAY_SIZE(jack_pins));
-	if (ret) {
-		dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
-		return ret;
-	}
-
-	jack = &ctx->headset;
-
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
-	ret = snd_soc_component_set_jack(component, jack, NULL);
-	if (ret)
-		dev_err(rtd->dev, "Headset Jack call-back failed: %d\n", ret);
-
-	return ret;
-};
-
-static void cml_rt5682_codec_exit(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
-
-	snd_soc_component_set_jack(component, NULL, NULL);
-}
-
-static int cml_rt1011_spk_init(struct snd_soc_pcm_runtime *rtd)
-{
-	int ret = 0;
-	struct snd_soc_card *card = rtd->card;
-
-	if (sof_rt1011_quirk & (SOF_RT1011_SPEAKER_TL |
-				SOF_RT1011_SPEAKER_TR)) {
-
-		ret = snd_soc_add_card_controls(card, cml_rt1011_tt_controls,
-					ARRAY_SIZE(cml_rt1011_tt_controls));
-		if (ret)
-			return ret;
-
-		ret = snd_soc_dapm_new_controls(&card->dapm,
-					cml_rt1011_tt_widgets,
-					ARRAY_SIZE(cml_rt1011_tt_widgets));
-		if (ret)
-			return ret;
-
-		ret = snd_soc_dapm_add_routes(&card->dapm, cml_rt1011_tt_map,
-					ARRAY_SIZE(cml_rt1011_tt_map));
-
-		if (ret)
-			return ret;
-	}
-
-	return ret;
-}
-
-static int cml_rt5682_hw_params(struct snd_pcm_substream *substream,
-				struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
-	int clk_id, clk_freq, pll_out, ret;
-
-	clk_id = RT5682_PLL1_S_MCLK;
-	clk_freq = CML_PLAT_CLK;
-
-	pll_out = params_rate(params) * 512;
-
-	ret = snd_soc_dai_set_pll(codec_dai, 0, clk_id, clk_freq, pll_out);
-	if (ret < 0)
-		dev_warn(rtd->dev, "snd_soc_dai_set_pll err = %d\n", ret);
-
-	/* Configure sysclk for codec */
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1,
-				     pll_out, SND_SOC_CLOCK_IN);
-	if (ret < 0)
-		dev_warn(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n", ret);
-
-	/*
-	 * slot_width should be equal or large than data length, set them
-	 * be the same
-	 */
-	ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x0, 0x0, 2,
-				       params_width(params));
-	if (ret < 0)
-		dev_warn(rtd->dev, "set TDM slot err:%d\n", ret);
-	return ret;
-}
-
-static int cml_rt1011_hw_params(struct snd_pcm_substream *substream,
-				struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai;
-	struct snd_soc_card *card = rtd->card;
-	int srate, i, ret = 0;
-
-	srate = params_rate(params);
-
-	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-
-		/* 100 Fs to drive 24 bit data */
-		ret = snd_soc_dai_set_pll(codec_dai, 0, RT1011_PLL1_S_BCLK,
-					  100 * srate, 256 * srate);
-		if (ret < 0) {
-			dev_err(card->dev, "codec_dai clock not set\n");
-			return ret;
-		}
-
-		ret = snd_soc_dai_set_sysclk(codec_dai,
-					     RT1011_FS_SYS_PRE_S_PLL1,
-					     256 * srate, SND_SOC_CLOCK_IN);
-		if (ret < 0) {
-			dev_err(card->dev, "codec_dai clock not set\n");
-			return ret;
-		}
-
-		/*
-		 * Codec TDM is configured as 24 bit capture/ playback.
-		 * 2 CH PB is done over 4 codecs - 2 Woofers and 2 Tweeters.
-		 * The Left woofer and tweeter plays the Left playback data
-		 * and  similar by the Right.
-		 * Hence 2 codecs (1 T and 1 W pair) share same Rx slot.
-		 * The feedback is captured for each codec individually.
-		 * Hence all 4 codecs use 1 Tx slot each for feedback.
-		 */
-		if (sof_rt1011_quirk & (SOF_RT1011_SPEAKER_WL |
-					SOF_RT1011_SPEAKER_WR)) {
-			if (!strcmp(codec_dai->component->name, "i2c-10EC1011:00")) {
-				ret = snd_soc_dai_set_tdm_slot(codec_dai,
-							       0x4, 0x1, 4, 24);
-				if (ret < 0)
-					break;
-			}
-
-			if (!strcmp(codec_dai->component->name, "i2c-10EC1011:01")) {
-				ret = snd_soc_dai_set_tdm_slot(codec_dai,
-							       0x8, 0x2, 4, 24);
-				if (ret < 0)
-					break;
-			}
-		}
-
-		if (sof_rt1011_quirk & (SOF_RT1011_SPEAKER_TL |
-					SOF_RT1011_SPEAKER_TR)) {
-			if (!strcmp(codec_dai->component->name, "i2c-10EC1011:02")) {
-				ret = snd_soc_dai_set_tdm_slot(codec_dai,
-							       0x1, 0x1, 4, 24);
-				if (ret < 0)
-					break;
-			}
-
-			if (!strcmp(codec_dai->component->name, "i2c-10EC1011:03")) {
-				ret = snd_soc_dai_set_tdm_slot(codec_dai,
-							       0x2, 0x2, 4, 24);
-				if (ret < 0)
-					break;
-			}
-		}
-	}
-	if (ret < 0)
-		dev_err(rtd->dev,
-			"set codec TDM slot for %s failed with error %d\n",
-			codec_dai->component->name, ret);
-	return ret;
-}
-
-static struct snd_soc_ops cml_rt5682_ops = {
-	.hw_params = cml_rt5682_hw_params,
-};
-
-static const struct snd_soc_ops cml_rt1011_ops = {
-	.hw_params = cml_rt1011_hw_params,
-};
-
-static int sof_card_late_probe(struct snd_soc_card *card)
-{
-	struct card_private *ctx = snd_soc_card_get_drvdata(card);
-	struct snd_soc_component *component = NULL;
-	char jack_name[NAME_SIZE];
-	struct hdmi_pcm *pcm;
-	int ret, i = 0;
-
-	if (list_empty(&ctx->hdmi_pcm_list))
-		return -EINVAL;
-
-	if (ctx->common_hdmi_codec_drv) {
-		pcm = list_first_entry(&ctx->hdmi_pcm_list, struct hdmi_pcm,
-				       head);
-		component = pcm->codec_dai->component;
-		return hda_dsp_hdmi_build_controls(card, component);
-	}
-
-	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
-		component = pcm->codec_dai->component;
-		snprintf(jack_name, sizeof(jack_name),
-			 "HDMI/DP, pcm=%d Jack", pcm->device);
-		ret = snd_soc_card_jack_new(card, jack_name,
-					    SND_JACK_AVOUT, &hdmi_jack[i]);
-		if (ret)
-			return ret;
-
-		ret = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
-					  &hdmi_jack[i]);
-		if (ret < 0)
-			return ret;
-
-		i++;
-	}
-
-	return hdac_hdmi_jack_port_init(component, &card->dapm);
-}
-
-static int hdmi_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
-	struct hdmi_pcm *pcm;
-
-	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
-	if (!pcm)
-		return -ENOMEM;
-
-	pcm->device = dai->id;
-	pcm->codec_dai = dai;
-
-	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
-
-	return 0;
-}
-
-/* Cometlake digital audio interface glue - connects codec <--> CPU */
-
-SND_SOC_DAILINK_DEF(ssp0_pin,
-	DAILINK_COMP_ARRAY(COMP_CPU("SSP0 Pin")));
-SND_SOC_DAILINK_DEF(ssp0_codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC5682:00",
-				CML_RT5682_CODEC_DAI)));
-
-SND_SOC_DAILINK_DEF(ssp1_pin,
-	DAILINK_COMP_ARRAY(COMP_CPU("SSP1 Pin")));
-SND_SOC_DAILINK_DEF(ssp1_codec_2spk,
-	DAILINK_COMP_ARRAY(
-	/* WL */ COMP_CODEC("i2c-10EC1011:00", CML_RT1011_CODEC_DAI),
-	/* WR */ COMP_CODEC("i2c-10EC1011:01", CML_RT1011_CODEC_DAI)));
-SND_SOC_DAILINK_DEF(ssp1_codec_4spk,
-	DAILINK_COMP_ARRAY(
-	/* WL */ COMP_CODEC("i2c-10EC1011:00", CML_RT1011_CODEC_DAI),
-	/* WR */ COMP_CODEC("i2c-10EC1011:01", CML_RT1011_CODEC_DAI),
-	/* TL */ COMP_CODEC("i2c-10EC1011:02", CML_RT1011_CODEC_DAI),
-	/* TR */ COMP_CODEC("i2c-10EC1011:03", CML_RT1011_CODEC_DAI)));
-
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
-static struct snd_soc_dai_link cml_rt1011_rt5682_dailink[] = {
-	/* Back End DAI links */
-	{
-		/* SSP0 - Codec */
-		.name = "SSP0-Codec",
-		.id = 0,
-		.init = cml_rt5682_codec_init,
-		.exit = cml_rt5682_codec_exit,
-		.ignore_pmdown_time = 1,
-		.ops = &cml_rt5682_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
-	},
-	{
-		.name = "dmic01",
-		.id = 1,
-		.ignore_suspend = 1,
-		.dpcm_capture = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
-	},
-	{
-		.name = "dmic16k",
-		.id = 2,
-		.ignore_suspend = 1,
-		.dpcm_capture = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(dmic16k_pin, dmic_codec, platform),
-	},
-	{
-		.name = "iDisp1",
-		.id = 3,
-		.init = hdmi_init,
-		.dpcm_playback = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
-	},
-	{
-		.name = "iDisp2",
-		.id = 4,
-		.init = hdmi_init,
-		.dpcm_playback = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
-	},
-	{
-		.name = "iDisp3",
-		.id = 5,
-		.init = hdmi_init,
-		.dpcm_playback = 1,
-		.no_pcm = 1,
-		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
-	},
-	{
-		/*
-		 * SSP1 - Codec : added to end of list ensuring
-		 * reuse of common topologies for other end points
-		 * and changing only SSP1's codec
-		 */
-		.name = "SSP1-Codec",
-		.id = 6,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1, /* Capture stream provides Feedback */
-		.no_pcm = 1,
-		.init = cml_rt1011_spk_init,
-		.ops = &cml_rt1011_ops,
-		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec_2spk, platform),
-	},
-};
-
-static struct snd_soc_codec_conf rt1011_conf[] = {
-	{
-		.dlc = COMP_CODEC_CONF("i2c-10EC1011:00"),
-		.name_prefix = "WL",
-	},
-	{
-		.dlc = COMP_CODEC_CONF("i2c-10EC1011:01"),
-		.name_prefix = "WR",
-	},
-	/* single configuration structure for 2 and 4 channels */
-	{
-		.dlc = COMP_CODEC_CONF("i2c-10EC1011:02"),
-		.name_prefix = "TL",
-	},
-	{
-		.dlc = COMP_CODEC_CONF("i2c-10EC1011:03"),
-		.name_prefix = "TR",
-	},
-};
-
-/* Cometlake audio machine driver for RT1011 and RT5682 */
-static struct snd_soc_card snd_soc_card_cml = {
-	.name = "cml_rt1011_rt5682",
-	.owner = THIS_MODULE,
-	.dai_link = cml_rt1011_rt5682_dailink,
-	.num_links = ARRAY_SIZE(cml_rt1011_rt5682_dailink),
-	.codec_conf = rt1011_conf,
-	.num_configs = ARRAY_SIZE(rt1011_conf),
-	.dapm_widgets = cml_rt1011_rt5682_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(cml_rt1011_rt5682_widgets),
-	.dapm_routes = cml_rt1011_rt5682_map,
-	.num_dapm_routes = ARRAY_SIZE(cml_rt1011_rt5682_map),
-	.controls = cml_controls,
-	.num_controls = ARRAY_SIZE(cml_controls),
-	.fully_routed = true,
-	.late_probe = sof_card_late_probe,
-};
-
-static int snd_cml_rt1011_probe(struct platform_device *pdev)
-{
-	struct snd_soc_dai_link *dai_link;
-	struct card_private *ctx;
-	struct snd_soc_acpi_mach *mach;
-	const char *platform_name;
-	int ret, i;
-
-	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
-
-	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
-	mach = pdev->dev.platform_data;
-	snd_soc_card_cml.dev = &pdev->dev;
-	platform_name = mach->mach_params.platform;
-
-	dmi_check_system(sof_rt1011_quirk_table);
-
-	dev_dbg(&pdev->dev, "sof_rt1011_quirk = %lx\n", sof_rt1011_quirk);
-
-	/* when 4 speaker is available, update codec config */
-	if (sof_rt1011_quirk & (SOF_RT1011_SPEAKER_TL |
-				SOF_RT1011_SPEAKER_TR)) {
-		for_each_card_prelinks(&snd_soc_card_cml, i, dai_link) {
-			if (!strcmp(dai_link->codecs[0].dai_name,
-				    CML_RT1011_CODEC_DAI)) {
-				dai_link->codecs = ssp1_codec_4spk;
-				dai_link->num_codecs = ARRAY_SIZE(ssp1_codec_4spk);
-			}
-		}
-	}
-
-	/* set platform name for each dailink */
-	ret = snd_soc_fixup_dai_links_platform_name(&snd_soc_card_cml,
-						    platform_name);
-	if (ret)
-		return ret;
-
-	ctx->common_hdmi_codec_drv = mach->mach_params.common_hdmi_codec_drv;
-
-	snd_soc_card_set_drvdata(&snd_soc_card_cml, ctx);
-
-	return devm_snd_soc_register_card(&pdev->dev, &snd_soc_card_cml);
-}
-
-static struct platform_driver snd_cml_rt1011_rt5682_driver = {
-	.probe = snd_cml_rt1011_probe,
-	.driver = {
-		.name = "cml_rt1011_rt5682",
-		.pm = &snd_soc_pm_ops,
-	},
-};
-module_platform_driver(snd_cml_rt1011_rt5682_driver);
-
-/* Module information */
-MODULE_DESCRIPTION("Cometlake Audio Machine driver - RT1011 and RT5682 in I2S mode");
-MODULE_AUTHOR("Naveen Manohar <naveen.m@intel.com>");
-MODULE_AUTHOR("Sathya Prakash M R <sathya.prakash.m.r@intel.com>");
-MODULE_AUTHOR("Shuming Fan <shumingf@realtek.com>");
-MODULE_AUTHOR("Mac Chiang <mac.chiang@intel.com>");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:cml_rt1011_rt5682");
-MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
index d47a548959ea..160bfa0e5ef5 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -42,7 +42,7 @@ static const struct snd_soc_acpi_codecs max98390_spk_codecs = {
 struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_machines[] = {
 	{
 		.id = "10EC5682",
-		.drv_name = "cml_rt1011_rt5682",
+		.drv_name = "cml_rt5682_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &rt1011_spk_codecs,
 		.sof_tplg_filename = "sof-cml-rt1011-rt5682.tplg",
-- 
2.40.1

