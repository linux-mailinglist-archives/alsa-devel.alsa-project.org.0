Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BF35466A5
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 14:29:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 613E31EF2;
	Fri, 10 Jun 2022 14:28:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 613E31EF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654864185;
	bh=5BQ5MHlwnuq9iDJwDNaNV0k8nuJSTLk9Bmi2Dkel+dg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j9UiUnBlORjpHTTXRFEWd/dtG35/D20XBaV8ZUfka3gEEYXDelAZp/yzJ5oJ82YdR
	 a4Vx0RrwuAT/bL9W0DMfjhiXGqhwOt1o1oqVwwU1imDWwJ/efBhVqVtVLka0A+DWpJ
	 TT03OHWxh00KZgDaPbAyUpozF4yuJmkxjop0/jIo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EB69F80568;
	Fri, 10 Jun 2022 14:26:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E8B1F80548; Fri, 10 Jun 2022 14:26:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B483F800E5
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 14:26:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B483F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="anGvW/mU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654863988; x=1686399988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5BQ5MHlwnuq9iDJwDNaNV0k8nuJSTLk9Bmi2Dkel+dg=;
 b=anGvW/mUUDYKQ/D3ijK48WAr8In47pLNfEettKqhF2pEcc5xOM5C1Ikd
 +iUkgfQx+Z7GSr6DwDPF5NrJ9cshVSfHDnPpsZeqHbYlro4PGTtw7eelu
 Zu0oPxOeKbH/183JaJ9CZTmn9IAi1raxrDDdoczGlwdd1YE1j+tV83s12
 U8bKHfNvhwzKjymxWa5F+tusy9RXu0Vqqlyyz+LEEVJtUiItR1mAHZ+Oh
 RKFDMO2GVlWiOA6QQoQ3IzoWIQVgfIg7p6AIJwP3pc6to4/366nhoRFDF
 MFqA3WO00f4uaY1rD1zaVSw/llZ4W6QQJFGmN+AfLSvJR4cEs548xSR/B Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="278414454"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="278414454"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 05:26:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="684517910"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 10 Jun 2022 05:26:24 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 09/17] ASoC: Intel: bdw_rt286: Reword prefixes of all driver
 members
Date: Fri, 10 Jun 2022 14:36:19 +0200
Message-Id: <20220610123627.1339985-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610123627.1339985-1-cezary.rojewski@intel.com>
References: <20220610123627.1339985-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Replace ambiguous 'broadwell_rt286_' prefixes in favour of 'card_',
'link_' and other similar strings to clearly state which object given
member implements behavior for.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/boards/bdw_rt286.c | 96 +++++++++++++++---------------
 1 file changed, 48 insertions(+), 48 deletions(-)

diff --git a/sound/soc/intel/boards/bdw_rt286.c b/sound/soc/intel/boards/bdw_rt286.c
index b29d77dfb281..092bc9a45548 100644
--- a/sound/soc/intel/boards/bdw_rt286.c
+++ b/sound/soc/intel/boards/bdw_rt286.c
@@ -16,9 +16,9 @@
 
 #include "../../codecs/rt286.h"
 
-static struct snd_soc_jack broadwell_headset;
+static struct snd_soc_jack card_headset;
 /* Headset jack detection DAPM pins */
-static struct snd_soc_jack_pin broadwell_headset_pins[] = {
+static struct snd_soc_jack_pin card_headset_pins[] = {
 	{
 		.pin = "Mic Jack",
 		.mask = SND_JACK_MICROPHONE,
@@ -29,12 +29,12 @@ static struct snd_soc_jack_pin broadwell_headset_pins[] = {
 	},
 };
 
-static const struct snd_kcontrol_new broadwell_controls[] = {
+static const struct snd_kcontrol_new card_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Speaker"),
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 };
 
-static const struct snd_soc_dapm_widget broadwell_widgets[] = {
+static const struct snd_soc_dapm_widget card_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_SPK("Speaker", NULL),
 	SND_SOC_DAPM_MIC("Mic Jack", NULL),
@@ -43,7 +43,7 @@ static const struct snd_soc_dapm_widget broadwell_widgets[] = {
 	SND_SOC_DAPM_LINE("Line Jack", NULL),
 };
 
-static const struct snd_soc_dapm_route broadwell_rt286_map[] = {
+static const struct snd_soc_dapm_route card_routes[] = {
 
 	/* speaker */
 	{"Speaker", NULL, "SPOR"},
@@ -65,22 +65,22 @@ static const struct snd_soc_dapm_route broadwell_rt286_map[] = {
 	{"AIF1 Playback", NULL, "SSP0 CODEC OUT"},
 };
 
-static int broadwell_rt286_codec_init(struct snd_soc_pcm_runtime *rtd)
+static int codec_link_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 	int ret = 0;
 	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset",
-		SND_JACK_HEADSET | SND_JACK_BTN_0, &broadwell_headset,
-		broadwell_headset_pins, ARRAY_SIZE(broadwell_headset_pins));
+		SND_JACK_HEADSET | SND_JACK_BTN_0, &card_headset,
+		card_headset_pins, ARRAY_SIZE(card_headset_pins));
 	if (ret)
 		return ret;
 
-	rt286_mic_detect(component, &broadwell_headset);
+	rt286_mic_detect(component, &card_headset);
 	return 0;
 }
 
 
-static int broadwell_ssp0_fixup(struct snd_soc_pcm_runtime *rtd,
+static int codec_link_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 			struct snd_pcm_hw_params *params)
 {
 	struct snd_interval *rate = hw_param_interval(params,
@@ -97,7 +97,7 @@ static int broadwell_ssp0_fixup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
-static int broadwell_rt286_hw_params(struct snd_pcm_substream *substream,
+static int codec_link_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
@@ -115,8 +115,8 @@ static int broadwell_rt286_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static const struct snd_soc_ops broadwell_rt286_ops = {
-	.hw_params = broadwell_rt286_hw_params,
+static const struct snd_soc_ops codec_link_ops = {
+	.hw_params = codec_link_hw_params,
 };
 
 static const unsigned int channels[] = {
@@ -129,7 +129,7 @@ static const struct snd_pcm_hw_constraint_list constraints_channels = {
 	.mask = 0,
 };
 
-static int broadwell_fe_startup(struct snd_pcm_substream *substream)
+static int bdw_rt286_fe_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
@@ -140,8 +140,8 @@ static int broadwell_fe_startup(struct snd_pcm_substream *substream)
 					  &constraints_channels);
 }
 
-static const struct snd_soc_ops broadwell_fe_ops = {
-	.startup = broadwell_fe_startup,
+static const struct snd_soc_ops bdw_rt286_fe_ops = {
+	.startup = bdw_rt286_fe_startup,
 };
 
 SND_SOC_DAILINK_DEF(system,
@@ -169,7 +169,7 @@ SND_SOC_DAILINK_DEF(ssp0_port,
 	    DAILINK_COMP_ARRAY(COMP_CPU("ssp0-port")));
 
 /* broadwell digital audio interface glue - connects codec <--> CPU */
-static struct snd_soc_dai_link broadwell_rt286_dais[] = {
+static struct snd_soc_dai_link card_dai_links[] = {
 	/* Front End DAI links */
 	{
 		.name = "System PCM",
@@ -177,7 +177,7 @@ static struct snd_soc_dai_link broadwell_rt286_dais[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.ops = &broadwell_fe_ops,
+		.ops = &bdw_rt286_fe_ops,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
@@ -215,12 +215,12 @@ static struct snd_soc_dai_link broadwell_rt286_dais[] = {
 		.name = "Codec",
 		.id = 0,
 		.no_pcm = 1,
-		.init = broadwell_rt286_codec_init,
+		.init = codec_link_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
-		.be_hw_params_fixup = broadwell_ssp0_fixup,
-		.ops = &broadwell_rt286_ops,
+		.be_hw_params_fixup = codec_link_hw_params_fixup,
+		.ops = &codec_link_ops,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp0_port, codec, platform),
@@ -241,21 +241,21 @@ static void broadwell_disable_jack(struct snd_soc_card *card)
 	}
 }
 
-static int broadwell_suspend(struct snd_soc_card *card)
+static int card_suspend_pre(struct snd_soc_card *card)
 {
 	broadwell_disable_jack(card);
 
 	return 0;
 }
 
-static int broadwell_resume(struct snd_soc_card *card){
+static int card_resume_post(struct snd_soc_card *card){
 	struct snd_soc_component *component;
 
 	for_each_card_components(card, component) {
 		if (!strcmp(component->name, "i2c-INT343A:00")) {
 
 			dev_dbg(component->dev, "enabling jack detect for resume.\n");
-			rt286_mic_detect(component, &broadwell_headset);
+			rt286_mic_detect(component, &card_headset);
 			break;
 		}
 	}
@@ -270,48 +270,48 @@ static int broadwell_resume(struct snd_soc_card *card){
 #define DRIVER_NAME NULL /* card name will be used for driver name */
 
 /* broadwell audio machine driver for WPT + RT286S */
-static struct snd_soc_card broadwell_rt286 = {
+static struct snd_soc_card bdw_rt286_card = {
 	.owner = THIS_MODULE,
-	.dai_link = broadwell_rt286_dais,
-	.num_links = ARRAY_SIZE(broadwell_rt286_dais),
-	.controls = broadwell_controls,
-	.num_controls = ARRAY_SIZE(broadwell_controls),
-	.dapm_widgets = broadwell_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(broadwell_widgets),
-	.dapm_routes = broadwell_rt286_map,
-	.num_dapm_routes = ARRAY_SIZE(broadwell_rt286_map),
+	.dai_link = card_dai_links,
+	.num_links = ARRAY_SIZE(card_dai_links),
+	.controls = card_controls,
+	.num_controls = ARRAY_SIZE(card_controls),
+	.dapm_widgets = card_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(card_widgets),
+	.dapm_routes = card_routes,
+	.num_dapm_routes = ARRAY_SIZE(card_routes),
 	.fully_routed = true,
-	.suspend_pre = broadwell_suspend,
-	.resume_post = broadwell_resume,
+	.suspend_pre = card_suspend_pre,
+	.resume_post = card_resume_post,
 };
 
-static int broadwell_audio_probe(struct platform_device *pdev)
+static int bdw_rt286_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach;
 	int ret;
 
-	broadwell_rt286.dev = &pdev->dev;
+	bdw_rt286_card.dev = &pdev->dev;
 
 	/* override platform name, if required */
 	mach = pdev->dev.platform_data;
-	ret = snd_soc_fixup_dai_links_platform_name(&broadwell_rt286,
+	ret = snd_soc_fixup_dai_links_platform_name(&bdw_rt286_card,
 						    mach->mach_params.platform);
 	if (ret)
 		return ret;
 
 	/* set card and driver name */
 	if (snd_soc_acpi_sof_parent(&pdev->dev)) {
-		broadwell_rt286.name = SOF_CARD_NAME;
-		broadwell_rt286.driver_name = SOF_DRIVER_NAME;
+		bdw_rt286_card.name = SOF_CARD_NAME;
+		bdw_rt286_card.driver_name = SOF_DRIVER_NAME;
 	} else {
-		broadwell_rt286.name = CARD_NAME;
-		broadwell_rt286.driver_name = DRIVER_NAME;
+		bdw_rt286_card.name = CARD_NAME;
+		bdw_rt286_card.driver_name = DRIVER_NAME;
 	}
 
-	return devm_snd_soc_register_card(&pdev->dev, &broadwell_rt286);
+	return devm_snd_soc_register_card(&pdev->dev, &bdw_rt286_card);
 }
 
-static int broadwell_audio_remove(struct platform_device *pdev)
+static int bdw_rt286_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 
@@ -320,16 +320,16 @@ static int broadwell_audio_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static struct platform_driver broadwell_audio = {
-	.probe = broadwell_audio_probe,
-	.remove = broadwell_audio_remove,
+static struct platform_driver bdw_rt286_driver = {
+	.probe = bdw_rt286_probe,
+	.remove = bdw_rt286_remove,
 	.driver = {
 		.name = "broadwell-audio",
 		.pm = &snd_soc_pm_ops
 	},
 };
 
-module_platform_driver(broadwell_audio)
+module_platform_driver(bdw_rt286_driver)
 
 /* Module information */
 MODULE_AUTHOR("Liam Girdwood, Xingchao Wang");
-- 
2.25.1

