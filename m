Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2CD7A1F23
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 14:46:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F7CBE95;
	Fri, 15 Sep 2023 14:46:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F7CBE95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694782014;
	bh=1kwE9seIr5/tHV4m+d3hWE9sBvRHG8fh4F5WRVDEh7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VqMfu9MM9x08ME0N6z8xuQ/JKyzMYLz6LN0zcT1kv5REUeJohZWaPMSt+6dFpofKK
	 gI3/tJOln7kMhPorcdMJX4dHajPd3ez+Am2dVBtUDNMwMsX/36wj7df4ddCTZFGN5a
	 u1uulXzt6iifRipIZSjfp9esozIzKYzk/ASuVl38=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4154FF80672; Fri, 15 Sep 2023 14:41:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A93EF80672;
	Fri, 15 Sep 2023 14:41:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A839F80601; Fri, 15 Sep 2023 14:41:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F741F805E6
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 14:40:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F741F805E6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=T5PAglZQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694781658; x=1726317658;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1kwE9seIr5/tHV4m+d3hWE9sBvRHG8fh4F5WRVDEh7I=;
  b=T5PAglZQYGY0Ollu5spnJIiInwB+lyTDwQj2oU8caUl5yO+WZEhRN5Sp
   Hnk3/c0QsbOUUXUsrsIm1DHQCkZYJbXneDpw8+8GN7FkgJcMPNd3z0ODR
   GuxquQQsoKPV+hNS2St47ewnsJK1+IjX0pyuqClTpqPJphIchvemUryrK
   NTBrvtPmkMIvxtLJrbGL8mtUMjAEOmG/2ACAa0RrtVB4rUjlKJf0vKZBq
   1kkYCHOWqyTnPG9KxdGa0yhR6gFeBZX6fe/HR5kTu023IXZJFmF9b1CJZ
   8wJVbGIUqF9xPhuO30j+1QVX9ApSlCHltunl4+rCEkjV3aGGXpy4cT04K
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="358653264"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="358653264"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="774304717"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="774304717"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:53 -0700
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
Subject: [PATCH 18/19] ASoC: Intel: sof_da7219: add adl_mx98360_da7219 board
 config
Date: Fri, 15 Sep 2023 20:48:51 +0800
Message-Id: <20230915124852.1696857-19-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
References: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NFF62TFM5DLYTGGHL7LTABWZ7WCKYLS7
X-Message-ID-Hash: NFF62TFM5DLYTGGHL7LTABWZ7WCKYLS7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NFF62TFM5DLYTGGHL7LTABWZ7WCKYLS7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

This configuration supports ADL boards which implement DA7219 on SSP0
and MAX98360A on SSP1. DA7219 uses PLL bypass mode to avoid WCLK
locking problem. To use this mode, MCLK frequency must be 12.288 or
24.576MHz.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_da7219.c           | 192 ++++++++++++++++--
 .../intel/common/soc-acpi-intel-adl-match.c   |   7 +
 2 files changed, 178 insertions(+), 21 deletions(-)

diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index c204c3dfd133..9fe9fe5e795d 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
+#include <sound/sof.h>
 #include "../../codecs/da7219.h"
 #include "hda_dsp_common.h"
 #include "sof_maxim_common.h"
@@ -23,6 +24,9 @@
 #define SOF_MAX98360A_SPEAKER_AMP_PRESENT	BIT(0)
 #define SOF_MAX98373_SPEAKER_AMP_PRESENT	BIT(1)
 
+/* Board Quirks */
+#define SOF_DA7219_JSL_BOARD			BIT(2)
+
 #define DIALOG_CODEC_DAI	"da7219-hifi"
 
 struct hdmi_pcm {
@@ -35,6 +39,8 @@ struct card_private {
 	struct snd_soc_jack headset_jack;
 	struct list_head hdmi_pcm_list;
 	struct snd_soc_jack hdmi[3];
+
+	unsigned int pll_bypass:1;
 };
 
 static int platform_clock_control(struct snd_soc_dapm_widget *w,
@@ -42,9 +48,14 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_dapm_context *dapm = w->dapm;
 	struct snd_soc_card *card = dapm->card;
+	struct card_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai *codec_dai;
 	int ret = 0;
 
+	if (ctx->pll_bypass)
+		return ret;
+
+	/* PLL SRM mode */
 	codec_dai = snd_soc_card_get_codec_dai(card, DIALOG_CODEC_DAI);
 	if (!codec_dai) {
 		dev_err(card->dev, "Codec dai not found; Unable to set/unset codec pll\n");
@@ -57,6 +68,8 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 		if (ret)
 			dev_err(card->dev, "failed to stop PLL: %d\n", ret);
 	} else if (SND_SOC_DAPM_EVENT_ON(event)) {
+		dev_dbg(card->dev, "pll srm mode\n");
+
 		ret = snd_soc_dai_set_pll(codec_dai, 0, DA7219_SYSCLK_PLL_SRM,
 					  0, DA7219_PLL_FREQ_OUT_98304);
 		if (ret)
@@ -124,16 +137,38 @@ static int da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	struct snd_soc_jack *jack = &ctx->headset_jack;
-	int ret;
+	int mclk_rate, ret;
 
-	/* Configure sysclk for codec */
-	ret = snd_soc_dai_set_sysclk(codec_dai, DA7219_CLKSRC_MCLK, 24000000,
+	mclk_rate = sof_dai_get_mclk(rtd);
+	if (mclk_rate <= 0) {
+		dev_err(rtd->dev, "invalid mclk freq %d\n", mclk_rate);
+		return -EINVAL;
+	}
+
+	ret = snd_soc_dai_set_sysclk(codec_dai, DA7219_CLKSRC_MCLK, mclk_rate,
 				     SND_SOC_CLOCK_IN);
 	if (ret) {
-		dev_err(rtd->dev, "can't set codec sysclk configuration\n");
+		dev_err(rtd->dev, "fail to set sysclk, ret %d\n", ret);
 		return ret;
 	}
 
+	/*
+	 * Use PLL bypass mode if MCLK is available, be sure to set the
+	 * frequency of MCLK to 12.288 or 24.576MHz on topology side.
+	 */
+	if (mclk_rate == 12288000 || mclk_rate == 24576000) {
+		/* PLL bypass mode */
+		dev_dbg(rtd->dev, "pll bypass mode, mclk rate %d\n", mclk_rate);
+
+		ret = snd_soc_dai_set_pll(codec_dai, 0, DA7219_SYSCLK_MCLK, 0, 0);
+		if (ret) {
+			dev_err(rtd->dev, "fail to set pll, ret %d\n", ret);
+			return ret;
+		}
+
+		ctx->pll_bypass = 1;
+	}
+
 	/*
 	 * Headset buttons map to the google Reference headset.
 	 * These can be configured by userspace.
@@ -238,6 +273,11 @@ SND_SOC_DAILINK_DEF(ssp0_codec,
 SND_SOC_DAILINK_DEF(ssp1_pin,
 	DAILINK_COMP_ARRAY(COMP_CPU("SSP1 Pin")));
 
+SND_SOC_DAILINK_DEF(ssp2_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("SSP2 Pin")));
+SND_SOC_DAILINK_DEF(dummy_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("snd-soc-dummy", "snd-soc-dummy-dai")));
+
 SND_SOC_DAILINK_DEF(dmic_pin,
 	DAILINK_COMP_ARRAY(COMP_CPU("DMIC01 Pin")));
 SND_SOC_DAILINK_DEF(dmic_codec,
@@ -261,10 +301,15 @@ SND_SOC_DAILINK_DEF(idisp3_pin,
 SND_SOC_DAILINK_DEF(idisp3_codec,
 	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi3")));
 
+SND_SOC_DAILINK_DEF(idisp4_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("iDisp4 Pin")));
+SND_SOC_DAILINK_DEF(idisp4_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi4")));
+
 SND_SOC_DAILINK_DEF(platform, /* subject to be overridden during probe */
 	DAILINK_COMP_ARRAY(COMP_PLATFORM("0000:00:1f.3")));
 
-static struct snd_soc_dai_link dais[] = {
+static struct snd_soc_dai_link jsl_dais[] = {
 	/* Back End DAI links */
 	{
 		.name = "SSP1-Codec",
@@ -327,11 +372,88 @@ static struct snd_soc_dai_link dais[] = {
 	}
 };
 
+static struct snd_soc_dai_link adl_dais[] = {
+	/* Back End DAI links */
+	{
+		.name = "SSP0-Codec",
+		.id = 0,
+		.no_pcm = 1,
+		.init = da7219_codec_init,
+		.ignore_pmdown_time = 1,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
+	},
+	{
+		.name = "dmic01",
+		.id = 1,
+		.ignore_suspend = 1,
+		.dpcm_capture = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
+	},
+	{
+		.name = "dmic16k",
+		.id = 2,
+		.ignore_suspend = 1,
+		.dpcm_capture = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(dmic16k_pin, dmic_codec, platform),
+	},
+	{
+		.name = "iDisp1",
+		.id = 3,
+		.init = hdmi_init,
+		.dpcm_playback = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
+	},
+	{
+		.name = "iDisp2",
+		.id = 4,
+		.init = hdmi_init,
+		.dpcm_playback = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
+	},
+	{
+		.name = "iDisp3",
+		.id = 5,
+		.init = hdmi_init,
+		.dpcm_playback = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
+	},
+	{
+		.name = "iDisp4",
+		.id = 6,
+		.init = hdmi_init,
+		.dpcm_playback = 1,
+		.no_pcm = 1,
+		SND_SOC_DAILINK_REG(idisp4_pin, idisp4_codec, platform),
+	},
+	{
+		.name = "SSP1-Codec",
+		.id = 7,
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		/* feedback stream or firmware-generated echo reference */
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(ssp1_pin, max_98373_components, platform),
+	},
+	{
+		.name = "SSP2-BT",
+		.id = 8,
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(ssp2_pin, dummy_codec, platform),
+	},
+};
+
 static struct snd_soc_card card_da7219 = {
 	.name = "da7219", /* the sof- prefix is added by the core */
 	.owner = THIS_MODULE,
-	.dai_link = dais,
-	.num_links = ARRAY_SIZE(dais),
 	.controls = controls,
 	.num_controls = ARRAY_SIZE(controls),
 	.dapm_widgets = widgets,
@@ -345,9 +467,10 @@ static struct snd_soc_card card_da7219 = {
 static int audio_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
+	struct snd_soc_dai_link *dai_links;
 	struct card_private *ctx;
 	unsigned long board_quirk = 0;
-	int ret;
+	int ret, amp_idx;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -356,28 +479,49 @@ static int audio_probe(struct platform_device *pdev)
 	if (pdev->id_entry && pdev->id_entry->driver_data)
 		board_quirk = (unsigned long)pdev->id_entry->driver_data;
 
-	/* backward-compatible with existing devices */
-	if (board_quirk & SOF_MAX98360A_SPEAKER_AMP_PRESENT)
-		card_da7219.name = devm_kstrdup(&pdev->dev, "da7219max98360a",
-						GFP_KERNEL);
-	else if (board_quirk & SOF_MAX98373_SPEAKER_AMP_PRESENT)
-		card_da7219.name = devm_kstrdup(&pdev->dev, "da7219max",
-						GFP_KERNEL);
+	if (board_quirk & SOF_DA7219_JSL_BOARD) {
+		/* backward-compatible with existing devices */
+		if (board_quirk & SOF_MAX98360A_SPEAKER_AMP_PRESENT)
+			card_da7219.name = devm_kstrdup(&pdev->dev,
+							"da7219max98360a",
+							GFP_KERNEL);
+		else if (board_quirk & SOF_MAX98373_SPEAKER_AMP_PRESENT)
+			card_da7219.name = devm_kstrdup(&pdev->dev, "da7219max",
+							GFP_KERNEL);
+
+		dai_links = jsl_dais;
+		amp_idx = 0;
+
+		card_da7219.num_links = ARRAY_SIZE(jsl_dais);
+	} else {
+		dai_links = adl_dais;
+		amp_idx = 7;
+
+		card_da7219.num_links = ARRAY_SIZE(adl_dais);
+	}
 
 	dev_dbg(&pdev->dev, "board_quirk = %lx\n", board_quirk);
 
 	/* speaker amp */
 	if (board_quirk & SOF_MAX98360A_SPEAKER_AMP_PRESENT) {
-		max_98360a_dai_link(&dais[0]);
+		max_98360a_dai_link(&dai_links[amp_idx]);
 	} else if (board_quirk & SOF_MAX98373_SPEAKER_AMP_PRESENT) {
-		dais[0].codecs = max_98373_components;
-		dais[0].num_codecs = ARRAY_SIZE(max_98373_components);
-		dais[0].init = max_98373_spk_codec_init;
-		dais[0].ops = &max98373_ops; /* use local ops */
+		dai_links[amp_idx].codecs = max_98373_components;
+		dai_links[amp_idx].num_codecs = ARRAY_SIZE(max_98373_components);
+		dai_links[amp_idx].init = max_98373_spk_codec_init;
+		if (board_quirk & SOF_DA7219_JSL_BOARD) {
+			dai_links[amp_idx].ops = &max98373_ops; /* use local ops */
+		} else {
+			/* TBD: implement the amp for later platform */
+			dev_err(&pdev->dev, "max98373 not support yet\n");
+			return -EINVAL;
+		}
 
 		max_98373_set_codec_conf(&card_da7219);
 	}
 
+	card_da7219.dai_link = dai_links;
+
 	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
 
 	card_da7219.dev = &pdev->dev;
@@ -395,10 +539,16 @@ static int audio_probe(struct platform_device *pdev)
 static const struct platform_device_id board_ids[] = {
 	{
 		.name = "sof_da7219_mx98373",
-		.driver_data = (kernel_ulong_t)(SOF_MAX98373_SPEAKER_AMP_PRESENT),
+		.driver_data = (kernel_ulong_t)(SOF_MAX98373_SPEAKER_AMP_PRESENT |
+					SOF_DA7219_JSL_BOARD),
 	},
 	{
 		.name = "sof_da7219_mx98360a",
+		.driver_data = (kernel_ulong_t)(SOF_MAX98360A_SPEAKER_AMP_PRESENT |
+					SOF_DA7219_JSL_BOARD),
+	},
+	{
+		.name = "adl_mx98360_da7219",
 		.driver_data = (kernel_ulong_t)(SOF_MAX98360A_SPEAKER_AMP_PRESENT),
 	},
 	{ }
diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 4e9787870f60..b513eceb60c3 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -614,6 +614,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.quirk_data = &adl_rt5650_amp,
 		.sof_tplg_filename = "sof-adl-rt5650.tplg",
 	},
+	{
+		.id = "DLGS7219",
+		.drv_name = "adl_mx98360_da7219",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &adl_max98360a_amp,
+		.sof_tplg_filename = "sof-adl-max98360a-da7219.tplg",
+	},
 	/* place amp-only boards in the end of table */
 	{
 		.id = "CSC3541",
-- 
2.25.1

