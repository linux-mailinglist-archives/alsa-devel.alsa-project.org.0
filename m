Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D027C7684
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 21:15:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D1ADBC0;
	Thu, 12 Oct 2023 21:14:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D1ADBC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697138128;
	bh=RJ5oW1mUbECgH9cxDBvcNO6pvytJ0neydw+2M9o5XYo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MR4b+WiTBglbCGQA3xWbOxtH9W3ZO9BEoubzrxDKGumZNuA65MzIC2gJndzTZYn7q
	 IDt1m8fxCrK2KcwadiMps0yi5oqNKz2h3mq7mzkJpm6Kv4wO1qQO+4No8QLFq97IN+
	 sNUbynMjkui5jMp4Nz6OzuGPbTW6l/S8UgZHnbqw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46F63F80656; Thu, 12 Oct 2023 21:10:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB3D0F8064F;
	Thu, 12 Oct 2023 21:10:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8114DF80619; Thu, 12 Oct 2023 21:09:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E6101F8057B
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 21:09:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6101F8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=d3GlpewT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697137749; x=1728673749;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RJ5oW1mUbECgH9cxDBvcNO6pvytJ0neydw+2M9o5XYo=;
  b=d3GlpewTNQpm8QU2EV4f41MiIL9pfUy6c+uJclF8CYNHtov+wZ8WWGla
   Y8KhMh37i7aBW/JAxaur6TCgDQgAZGvQ1zO+Xb3n5aSl1S09eE4hgmxdb
   drJHPlumr5hxwfLyn2VYHAOgELc93dKGwapWoP4UhWbbmu8Zm1OtacUUE
   +/0jdvEqv/aD5ZFXfdqeDZN7kTGeQeN7YMo6Iw1ZeyvNSFruD0nuskdu5
   5jvpPv5YEemE12dtQS75zmDuaSYMdgtD0K+/3y03Ocgs9cqbltXtRjlll
   ZkC5S8jMZcLtq/e1y9UI0O/K9bhhqTdIatj+g6H73QNl46DfCMzlujpv3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="416060260"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="416060260"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="845108126"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="845108126"
Received: from gchoudha-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.hsd1.md.comcast.net) ([10.212.114.241])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:56 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 22/23] ASoC: Intel: sof_rt5682: use common module for HDMI
 link
Date: Thu, 12 Oct 2023 15:08:25 -0400
Message-Id: <20231012190826.142619-23-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
References: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MACPTMAXBE2A32YXPMBENBRIZX6MH7OF
X-Message-ID-Hash: MACPTMAXBE2A32YXPMBENBRIZX6MH7OF
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MACPTMAXBE2A32YXPMBENBRIZX6MH7OF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Use intel_board module for Intel HDMI DAI link initialization.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig      |   1 +
 sound/soc/intel/boards/sof_rt5682.c | 126 +++++++---------------------
 2 files changed, 33 insertions(+), 94 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 126224824105..f085daef5ee1 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -499,6 +499,7 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
 	select SND_SOC_RT5682S
 	select SND_SOC_DMIC
 	select SND_SOC_INTEL_HDA_DSP_COMMON
+	select SND_SOC_INTEL_SOF_BOARD_HELPERS
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
 	select SND_SOC_INTEL_SOF_REALTEK_COMMON
 	select SND_SOC_INTEL_SOF_SSP_COMMON
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 0f4923fb4d89..1e90dff61b9b 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -24,8 +24,7 @@
 #include "../../codecs/rt5682s.h"
 #include "../../codecs/rt5645.h"
 #include "../common/soc-intel-quirks.h"
-#include "hda_dsp_common.h"
-#include "sof_hdmi_common.h"
+#include "sof_board_helpers.h"
 #include "sof_maxim_common.h"
 #include "sof_realtek_common.h"
 #include "sof_ssp_common.h"
@@ -60,16 +59,6 @@
 static unsigned long sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
 					SOF_RT5682_SSP_CODEC(0);
 
-static int is_legacy_cpu;
-
-struct sof_card_private {
-	struct clk *mclk;
-	struct snd_soc_jack sof_headset;
-	struct sof_hdmi_private hdmi;
-	enum sof_ssp_codec codec_type;
-	enum sof_ssp_codec amp_type;
-};
-
 static int sof_rt5682_quirk_cb(const struct dmi_system_id *id)
 {
 	sof_rt5682_quirk = (unsigned long)id->driver_data;
@@ -221,16 +210,6 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 	{}
 };
 
-static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
-
-	ctx->hdmi.hdmi_comp = dai->component;
-
-	return 0;
-}
-
 static struct snd_soc_jack_pin jack_pins[] = {
 	{
 		.pin    = "Headphone Jack",
@@ -246,7 +225,7 @@ static int sof_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
-	struct snd_soc_jack *jack;
+	struct snd_soc_jack *jack = &ctx->headset_jack;
 	int extra_jack_data;
 	int ret, mclk_freq;
 
@@ -302,11 +281,11 @@ static int sof_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
 			 * to disable a clock that has not been enabled,
 			 * we need to enable the clock first.
 			 */
-			ret = clk_prepare_enable(ctx->mclk);
+			ret = clk_prepare_enable(ctx->rt5682.mclk);
 			if (!ret)
-				clk_disable_unprepare(ctx->mclk);
+				clk_disable_unprepare(ctx->rt5682.mclk);
 
-			ret = clk_set_rate(ctx->mclk, 19200000);
+			ret = clk_set_rate(ctx->rt5682.mclk, 19200000);
 
 			if (ret)
 				dev_err(rtd->dev, "unable to set MCLK rate\n");
@@ -321,7 +300,7 @@ static int sof_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
 					 SND_JACK_HEADSET | SND_JACK_BTN_0 |
 					 SND_JACK_BTN_1 | SND_JACK_BTN_2 |
 					 SND_JACK_BTN_3,
-					 &ctx->sof_headset,
+					 jack,
 					 jack_pins,
 					 ARRAY_SIZE(jack_pins));
 	if (ret) {
@@ -329,8 +308,6 @@ static int sof_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	jack = &ctx->sof_headset;
-
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
@@ -367,7 +344,7 @@ static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
 
 	if (sof_rt5682_quirk & SOF_RT5682_MCLK_EN) {
 		if (sof_rt5682_quirk & SOF_RT5682_MCLK_BYTCHT_EN) {
-			ret = clk_prepare_enable(ctx->mclk);
+			ret = clk_prepare_enable(ctx->rt5682.mclk);
 			if (ret < 0) {
 				dev_err(rtd->dev,
 					"could not configure MCLK state");
@@ -508,14 +485,7 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 			return err;
 	}
 
-	/* HDMI is not supported by SOF on Baytrail/CherryTrail */
-	if (is_legacy_cpu || !ctx->hdmi.idisp_codec)
-		return 0;
-
-	if (!ctx->hdmi.hdmi_comp)
-		return -EINVAL;
-
-	return hda_dsp_hdmi_build_controls(card, ctx->hdmi.hdmi_comp);
+	return sof_intel_board_card_late_probe(card);
 }
 
 static const struct snd_kcontrol_new sof_controls[] = {
@@ -642,12 +612,13 @@ static struct snd_soc_dai_link *
 sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec codec_type,
 			  enum sof_ssp_codec amp_type, int ssp_codec,
 			  int ssp_amp, int dmic_be_num, int hdmi_num,
-			  bool idisp_codec)
+			  bool idisp_codec, bool is_legacy_cpu)
 {
-	struct snd_soc_dai_link_component *idisp_components;
 	struct snd_soc_dai_link_component *cpus;
 	struct snd_soc_dai_link *links;
-	int i, id = 0;
+	int i;
+	int id = 0;
+	int ret;
 	int hdmi_id_offset = 0;
 
 	links = devm_kcalloc(dev, sof_audio_card_rt5682.num_links,
@@ -748,47 +719,12 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec codec_type,
 	}
 
 	/* HDMI */
-	if (hdmi_num > 0) {
-		idisp_components = devm_kcalloc(dev,
-				   hdmi_num,
-				   sizeof(struct snd_soc_dai_link_component),
-				   GFP_KERNEL);
-		if (!idisp_components)
-			goto devm_err;
-	}
 	for (i = 1; i <= hdmi_num; i++) {
-		links[id].name = devm_kasprintf(dev, GFP_KERNEL,
-						"iDisp%d", i);
-		if (!links[id].name)
-			goto devm_err;
+		ret = sof_intel_board_set_intel_hdmi_link(dev, &links[id], id,
+							  i, idisp_codec);
+		if (ret)
+			return NULL;
 
-		links[id].id = id;
-		links[id].cpus = &cpus[id];
-		links[id].num_cpus = 1;
-		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-							  "iDisp%d Pin", i);
-		if (!links[id].cpus->dai_name)
-			goto devm_err;
-
-		if (idisp_codec) {
-			idisp_components[i - 1].name = "ehdaudio0D2";
-			idisp_components[i - 1].dai_name = devm_kasprintf(dev,
-									  GFP_KERNEL,
-									  "intel-hdmi-hifi%d",
-									  i);
-			if (!idisp_components[i - 1].dai_name)
-				goto devm_err;
-		} else {
-			idisp_components[i - 1] = snd_soc_dummy_dlc;
-		}
-
-		links[id].codecs = &idisp_components[i - 1];
-		links[id].num_codecs = 1;
-		links[id].platforms = platform_component;
-		links[id].num_platforms = ARRAY_SIZE(platform_component);
-		links[id].init = (i == 1) ? sof_hdmi_init : NULL;
-		links[id].dpcm_playback = 1;
-		links[id].no_pcm = 1;
 		id++;
 	}
 
@@ -929,7 +865,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct snd_soc_dai_link *dai_links;
 	struct sof_card_private *ctx;
-	int dmic_be_num, hdmi_num;
+	int dmic_be_num;
 	int ret, ssp_amp, ssp_codec;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
@@ -954,20 +890,21 @@ static int sof_audio_probe(struct platform_device *pdev)
 	}
 
 	if (soc_intel_is_byt() || soc_intel_is_cht()) {
-		is_legacy_cpu = 1;
+		ctx->rt5682.is_legacy_cpu = true;
 		dmic_be_num = 0;
-		hdmi_num = 0;
+		/* HDMI is not supported by SOF on Baytrail/CherryTrail */
+		ctx->hdmi_num = 0;
 		/* default quirk for legacy cpu */
 		sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
 						SOF_RT5682_MCLK_BYTCHT_EN |
 						SOF_RT5682_SSP_CODEC(2);
 	} else {
 		dmic_be_num = 2;
-		hdmi_num = (sof_rt5682_quirk & SOF_RT5682_NUM_HDMIDEV_MASK) >>
+		ctx->hdmi_num = (sof_rt5682_quirk & SOF_RT5682_NUM_HDMIDEV_MASK) >>
 			 SOF_RT5682_NUM_HDMIDEV_SHIFT;
 		/* default number of HDMI DAI's */
-		if (!hdmi_num)
-			hdmi_num = 3;
+		if (!ctx->hdmi_num)
+			ctx->hdmi_num = 3;
 
 		if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
 			ctx->hdmi.idisp_codec = true;
@@ -975,9 +912,9 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	/* need to get main clock from pmc */
 	if (sof_rt5682_quirk & SOF_RT5682_MCLK_BYTCHT_EN) {
-		ctx->mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");
-		if (IS_ERR(ctx->mclk)) {
-			ret = PTR_ERR(ctx->mclk);
+		ctx->rt5682.mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");
+		if (IS_ERR(ctx->rt5682.mclk)) {
+			ret = PTR_ERR(ctx->rt5682.mclk);
 
 			dev_err(&pdev->dev,
 				"Failed to get MCLK from pmc_plt_clk_3: %d\n",
@@ -985,7 +922,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 			return ret;
 		}
 
-		ret = clk_prepare_enable(ctx->mclk);
+		ret = clk_prepare_enable(ctx->rt5682.mclk);
 		if (ret < 0) {
 			dev_err(&pdev->dev,
 				"could not configure MCLK state");
@@ -1001,7 +938,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	ssp_codec = sof_rt5682_quirk & SOF_RT5682_SSP_CODEC_MASK;
 
 	/* compute number of dai links */
-	sof_audio_card_rt5682.num_links = 1 + dmic_be_num + hdmi_num;
+	sof_audio_card_rt5682.num_links = 1 + dmic_be_num + ctx->hdmi_num;
 
 	if (ctx->amp_type != CODEC_NONE)
 		sof_audio_card_rt5682.num_links++;
@@ -1016,8 +953,9 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->codec_type,
 					      ctx->amp_type, ssp_codec, ssp_amp,
-					      dmic_be_num, hdmi_num,
-					      ctx->hdmi.idisp_codec);
+					      dmic_be_num, ctx->hdmi_num,
+					      ctx->hdmi.idisp_codec,
+					      ctx->rt5682.is_legacy_cpu);
 	if (!dai_links)
 		return -ENOMEM;
 
@@ -1277,7 +1215,7 @@ MODULE_AUTHOR("Sathya Prakash M R <sathya.prakash.m.r@intel.com>");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_AUTHOR("Mac Chiang <mac.chiang@intel.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_REALTEK_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_SSP_COMMON);
-- 
2.39.2

