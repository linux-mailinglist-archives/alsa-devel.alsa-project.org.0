Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 759C47A1F1E
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 14:46:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A993E85;
	Fri, 15 Sep 2023 14:45:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A993E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694781999;
	bh=dI+Ms/XPAG3smkdJ6NySi5sgSztrEsipffKFUAvfAFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LyGYZbaSy01ApWQmiv0093AFcKFv9DpgLWOGUQPy27os7b70n618FwXP1pY3vK6hO
	 l54vYv78CjnzjHp7mbl+YFL8zji6Gq47U1qTf/gUlVVdwzjuispQf056pBk8T0fGB6
	 z7K+ABv3FbeWLxsn4B+ic1apEq37vlAnaAxhGHpk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BFF8F80656; Fri, 15 Sep 2023 14:41:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FD09F80656;
	Fri, 15 Sep 2023 14:41:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BC8DF80606; Fri, 15 Sep 2023 14:41:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4D0FF805EC
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 14:40:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4D0FF805EC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=K6Z58H34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694781655; x=1726317655;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dI+Ms/XPAG3smkdJ6NySi5sgSztrEsipffKFUAvfAFs=;
  b=K6Z58H34zJJUArrbqfgKzm0wjOa6gOa8lwte9CwXZ4VbTcN/ZK9VE1EA
   5IWADfWHUdvKYLPWfnlIUYA2ANXC5sjlCSRZUjsRZCQUSesY3TfbUqy7q
   BlKIqzuot+v5iOAyfk3OQNXsL89KieLxCUCvexSwNG3oiC/SGPVoP0o0l
   2uDA6weaAdVzub2Eb5LTXT5kovQwzm2KiFsPibloldFO8JKs8HgzZ4H2P
   G0P6whTQktpTla2SyfBBtwYBp+Z+VsTFiy8OOb5r5Z87Avm4CtcA7hD2F
   KFUWuseN8HU1NbWv+kahCdZeEZj1F1d4nU1OFFC7eAAD5RbQZhccNxF1z
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="358653255"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="358653255"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="774304701"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="774304701"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:50 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	brent.lu@intel.com,
	uday.m.bhat@intel.com,
	balamurugan.c@intel.com
Subject: [PATCH 17/19] ASoC: Intel: sof_da7219: use maxim-common module
Date: Fri, 15 Sep 2023 20:48:50 +0800
Message-Id: <20230915124852.1696857-18-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
References: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7VIE2F6XZVL72KQ7ZSAWSAII4GXDD5KV
X-Message-ID-Hash: 7VIE2F6XZVL72KQ7ZSAWSAII4GXDD5KV
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7VIE2F6XZVL72KQ7ZSAWSAII4GXDD5KV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Use maxim-common module to handle speaker amp DAI link registration.
No functional change in this commit.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig      |   1 +
 sound/soc/intel/boards/sof_da7219.c | 182 ++++++++++------------------
 2 files changed, 63 insertions(+), 120 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index b6aa8db86b67..6c97e22f248c 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -620,6 +620,7 @@ config SND_SOC_INTEL_SOF_DA7219_MACH
 	select SND_SOC_MAX98357A
 	select SND_SOC_MAX98373_I2C
 	select SND_SOC_DMIC
+	select SND_SOC_INTEL_SOF_MAXIM_COMMON
 	help
 	  This adds support for ASoC machine driver for SOF platforms
 	  with Dialog DA7219 I2S audio codec.
diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index bbd47e7e4343..c204c3dfd133 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -2,7 +2,7 @@
 // Copyright(c) 2019 Intel Corporation.
 
 /*
- * Intel SOF Machine driver for DA7219 + MAX98373/MAX98360A codec
+ * Intel SOF Machine driver for Dialog headphone codec
  */
 
 #include <linux/input.h>
@@ -15,11 +15,15 @@
 #include <sound/soc-acpi.h>
 #include "../../codecs/da7219.h"
 #include "hda_dsp_common.h"
+#include "sof_maxim_common.h"
+
+/* Speaker amp type
+ * TBD: use ssp-common module for type detection
+ */
+#define SOF_MAX98360A_SPEAKER_AMP_PRESENT	BIT(0)
+#define SOF_MAX98373_SPEAKER_AMP_PRESENT	BIT(1)
 
 #define DIALOG_CODEC_DAI	"da7219-hifi"
-#define MAX98373_CODEC_DAI	"max98373-aif1"
-#define MAXIM_DEV0_NAME		"i2c-MX98373:00"
-#define MAXIM_DEV1_NAME		"i2c-MX98373:01"
 
 struct hdmi_pcm {
 	struct list_head head;
@@ -28,7 +32,7 @@ struct hdmi_pcm {
 };
 
 struct card_private {
-	struct snd_soc_jack headset;
+	struct snd_soc_jack headset_jack;
 	struct list_head hdmi_pcm_list;
 	struct snd_soc_jack hdmi[3];
 };
@@ -70,14 +74,6 @@ static const struct snd_kcontrol_new controls[] = {
 	SOC_DAPM_PIN_SWITCH("Right Spk"),
 };
 
-static const struct snd_kcontrol_new m98360a_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
-	SOC_DAPM_PIN_SWITCH("Headset Mic"),
-	SOC_DAPM_PIN_SWITCH("Line Out"),
-	SOC_DAPM_PIN_SWITCH("Spk"),
-};
-
-/* For MAX98373 amp */
 static const struct snd_soc_dapm_widget widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
@@ -103,40 +99,6 @@ static const struct snd_soc_dapm_route audio_map[] = {
 	{ "Headset Mic", NULL, "Platform Clock" },
 	{ "Line Out", NULL, "Platform Clock" },
 
-	{ "Left Spk", NULL, "Left BE_OUT" },
-	{ "Right Spk", NULL, "Right BE_OUT" },
-
-	/* digital mics */
-	{"DMic", NULL, "SoC DMIC"},
-};
-
-/* For MAX98360A amp */
-static const struct snd_soc_dapm_widget max98360a_widgets[] = {
-	SND_SOC_DAPM_HP("Headphone Jack", NULL),
-	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-	SND_SOC_DAPM_LINE("Line Out", NULL),
-
-	SND_SOC_DAPM_SPK("Spk", NULL),
-
-	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
-			    platform_clock_control, SND_SOC_DAPM_POST_PMD |
-			    SND_SOC_DAPM_PRE_PMU),
-
-	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
-};
-
-static const struct snd_soc_dapm_route max98360a_map[] = {
-	{ "Headphone Jack", NULL, "HPL" },
-	{ "Headphone Jack", NULL, "HPR" },
-
-	{ "MIC", NULL, "Headset Mic" },
-
-	{ "Headphone Jack", NULL, "Platform Clock" },
-	{ "Headset Mic", NULL, "Platform Clock" },
-	{ "Line Out", NULL, "Platform Clock" },
-
-	{"Spk", NULL, "Speaker"},
-
 	/* digital mics */
 	{"DMic", NULL, "SoC DMIC"},
 };
@@ -156,13 +118,12 @@ static struct snd_soc_jack_pin jack_pins[] = {
 	},
 };
 
-static struct snd_soc_jack headset;
-
 static int da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
+	struct card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
-	struct snd_soc_jack *jack;
+	struct snd_soc_jack *jack = &ctx->headset_jack;
 	int ret;
 
 	/* Configure sysclk for codec */
@@ -181,25 +142,27 @@ static int da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 					 SND_JACK_HEADSET | SND_JACK_BTN_0 |
 					 SND_JACK_BTN_1 | SND_JACK_BTN_2 |
 					 SND_JACK_BTN_3 | SND_JACK_LINEOUT,
-					 &headset,
-					 jack_pins,
-					 ARRAY_SIZE(jack_pins));
+					 jack, jack_pins, ARRAY_SIZE(jack_pins));
 	if (ret) {
 		dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
 		return ret;
 	}
 
-	jack = &headset;
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
-	snd_soc_component_set_jack(component, jack, NULL);
+
+	ret = snd_soc_component_set_jack(component, jack, NULL);
+	if (ret) {
+		dev_err(rtd->dev, "fail to set component jack, ret %d\n", ret);
+		return ret;
+	}
 
 	return ret;
 }
 
-static int ssp1_hw_params(struct snd_pcm_substream *substream,
+static int max98373_hw_params(struct snd_pcm_substream *substream,
 			      struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *runtime = asoc_substream_to_rtd(substream);
@@ -208,7 +171,7 @@ static int ssp1_hw_params(struct snd_pcm_substream *substream,
 	for (j = 0; j < runtime->dai_link->num_codecs; j++) {
 		struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(runtime, j);
 
-		if (!strcmp(codec_dai->component->name, MAXIM_DEV0_NAME)) {
+		if (!strcmp(codec_dai->component->name, MAX_98373_DEV0_NAME)) {
 			/* vmon_slot_no = 0 imon_slot_no = 1 for TX slots */
 			ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x3, 3, 4, 16);
 			if (ret < 0) {
@@ -216,7 +179,7 @@ static int ssp1_hw_params(struct snd_pcm_substream *substream,
 				return ret;
 			}
 		}
-		if (!strcmp(codec_dai->component->name, MAXIM_DEV1_NAME)) {
+		if (!strcmp(codec_dai->component->name, MAX_98373_DEV1_NAME)) {
 			/* vmon_slot_no = 2 imon_slot_no = 3 for TX slots */
 			ret = snd_soc_dai_set_tdm_slot(codec_dai, 0xC, 3, 4, 16);
 			if (ret < 0) {
@@ -229,19 +192,8 @@ static int ssp1_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_ops ssp1_ops = {
-	.hw_params = ssp1_hw_params,
-};
-
-static struct snd_soc_codec_conf max98373_codec_conf[] = {
-	{
-		.dlc = COMP_CODEC_CONF(MAXIM_DEV0_NAME),
-		.name_prefix = "Right",
-	},
-	{
-		.dlc = COMP_CODEC_CONF(MAXIM_DEV1_NAME),
-		.name_prefix = "Left",
-	},
+static const struct snd_soc_ops max98373_ops = {
+	.hw_params = max98373_hw_params,
 };
 
 static int hdmi_init(struct snd_soc_pcm_runtime *rtd)
@@ -285,13 +237,6 @@ SND_SOC_DAILINK_DEF(ssp0_codec,
 
 SND_SOC_DAILINK_DEF(ssp1_pin,
 	DAILINK_COMP_ARRAY(COMP_CPU("SSP1 Pin")));
-SND_SOC_DAILINK_DEF(ssp1_amps,
-	DAILINK_COMP_ARRAY(
-	/* Left */	COMP_CODEC(MAXIM_DEV0_NAME, MAX98373_CODEC_DAI),
-	/* Right */	COMP_CODEC(MAXIM_DEV1_NAME, MAX98373_CODEC_DAI)));
-
-SND_SOC_DAILINK_DEF(ssp1_m98360a,
-	DAILINK_COMP_ARRAY(COMP_CODEC("MX98360A:00", "HiFi")));
 
 SND_SOC_DAILINK_DEF(dmic_pin,
 	DAILINK_COMP_ARRAY(COMP_CPU("DMIC01 Pin")));
@@ -328,8 +273,7 @@ static struct snd_soc_dai_link dais[] = {
 		.no_pcm = 1,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1, /* IV feedback */
-		.ops = &ssp1_ops,
-		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_amps, platform),
+		SND_SOC_DAILINK_REG(ssp1_pin, max_98373_components, platform),
 	},
 	{
 		.name = "SSP0-Codec",
@@ -383,8 +327,8 @@ static struct snd_soc_dai_link dais[] = {
 	}
 };
 
-static struct snd_soc_card card_da7219_m98373 = {
-	.name = "da7219max",
+static struct snd_soc_card card_da7219 = {
+	.name = "da7219", /* the sof- prefix is added by the core */
 	.owner = THIS_MODULE,
 	.dai_link = dais,
 	.num_links = ARRAY_SIZE(dais),
@@ -394,72 +338,68 @@ static struct snd_soc_card card_da7219_m98373 = {
 	.num_dapm_widgets = ARRAY_SIZE(widgets),
 	.dapm_routes = audio_map,
 	.num_dapm_routes = ARRAY_SIZE(audio_map),
-	.codec_conf = max98373_codec_conf,
-	.num_configs = ARRAY_SIZE(max98373_codec_conf),
-	.fully_routed = true,
-	.late_probe = card_late_probe,
-};
-
-static struct snd_soc_card card_da7219_m98360a = {
-	.name = "da7219max98360a",
-	.owner = THIS_MODULE,
-	.dai_link = dais,
-	.num_links = ARRAY_SIZE(dais),
-	.controls = m98360a_controls,
-	.num_controls = ARRAY_SIZE(m98360a_controls),
-	.dapm_widgets = max98360a_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(max98360a_widgets),
-	.dapm_routes = max98360a_map,
-	.num_dapm_routes = ARRAY_SIZE(max98360a_map),
 	.fully_routed = true,
 	.late_probe = card_late_probe,
 };
 
 static int audio_probe(struct platform_device *pdev)
 {
-	static struct snd_soc_card *card;
-	struct snd_soc_acpi_mach *mach;
+	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct card_private *ctx;
+	unsigned long board_quirk = 0;
 	int ret;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 
-	/* By default dais[0] is configured for max98373 */
-	if (!strcmp(pdev->name, "sof_da7219_mx98360a")) {
-		dais[0] = (struct snd_soc_dai_link) {
-			.name = "SSP1-Codec",
-			.id = 0,
-			.no_pcm = 1,
-			.dpcm_playback = 1,
-			.ignore_pmdown_time = 1,
-			SND_SOC_DAILINK_REG(ssp1_pin, ssp1_m98360a, platform) };
+	if (pdev->id_entry && pdev->id_entry->driver_data)
+		board_quirk = (unsigned long)pdev->id_entry->driver_data;
+
+	/* backward-compatible with existing devices */
+	if (board_quirk & SOF_MAX98360A_SPEAKER_AMP_PRESENT)
+		card_da7219.name = devm_kstrdup(&pdev->dev, "da7219max98360a",
+						GFP_KERNEL);
+	else if (board_quirk & SOF_MAX98373_SPEAKER_AMP_PRESENT)
+		card_da7219.name = devm_kstrdup(&pdev->dev, "da7219max",
+						GFP_KERNEL);
+
+	dev_dbg(&pdev->dev, "board_quirk = %lx\n", board_quirk);
+
+	/* speaker amp */
+	if (board_quirk & SOF_MAX98360A_SPEAKER_AMP_PRESENT) {
+		max_98360a_dai_link(&dais[0]);
+	} else if (board_quirk & SOF_MAX98373_SPEAKER_AMP_PRESENT) {
+		dais[0].codecs = max_98373_components;
+		dais[0].num_codecs = ARRAY_SIZE(max_98373_components);
+		dais[0].init = max_98373_spk_codec_init;
+		dais[0].ops = &max98373_ops; /* use local ops */
+
+		max_98373_set_codec_conf(&card_da7219);
 	}
 
 	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
-	card = (struct snd_soc_card *)pdev->id_entry->driver_data;
-	card->dev = &pdev->dev;
 
-	mach = pdev->dev.platform_data;
-	ret = snd_soc_fixup_dai_links_platform_name(card,
+	card_da7219.dev = &pdev->dev;
+
+	ret = snd_soc_fixup_dai_links_platform_name(&card_da7219,
 						    mach->mach_params.platform);
 	if (ret)
 		return ret;
 
-	snd_soc_card_set_drvdata(card, ctx);
+	snd_soc_card_set_drvdata(&card_da7219, ctx);
 
-	return devm_snd_soc_register_card(&pdev->dev, card);
+	return devm_snd_soc_register_card(&pdev->dev, &card_da7219);
 }
 
 static const struct platform_device_id board_ids[] = {
 	{
 		.name = "sof_da7219_mx98373",
-		.driver_data = (kernel_ulong_t)&card_da7219_m98373,
+		.driver_data = (kernel_ulong_t)(SOF_MAX98373_SPEAKER_AMP_PRESENT),
 	},
 	{
 		.name = "sof_da7219_mx98360a",
-		.driver_data = (kernel_ulong_t)&card_da7219_m98360a,
+		.driver_data = (kernel_ulong_t)(SOF_MAX98360A_SPEAKER_AMP_PRESENT),
 	},
 	{ }
 };
@@ -468,7 +408,7 @@ MODULE_DEVICE_TABLE(platform, board_ids);
 static struct platform_driver audio = {
 	.probe = audio_probe,
 	.driver = {
-		.name = "sof_da7219_max98_360a_373",
+		.name = "sof_da7219",
 		.pm = &snd_soc_pm_ops,
 	},
 	.id_table = board_ids,
@@ -476,7 +416,9 @@ static struct platform_driver audio = {
 module_platform_driver(audio)
 
 /* Module information */
-MODULE_DESCRIPTION("ASoC Intel(R) SOF Machine driver");
+MODULE_DESCRIPTION("ASoC Intel(R) SOF Machine driver for Dialog codec");
 MODULE_AUTHOR("Yong Zhi <yong.zhi@intel.com>");
+MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
-- 
2.25.1

