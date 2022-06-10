Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EBA5466A6
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 14:29:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 399721F06;
	Fri, 10 Jun 2022 14:29:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 399721F06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654864198;
	bh=YOK2wOTKnfoEMs78PzQR47Kz5JWbwboudShuXlNTgVY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kn746m64YKw7MHj5dcRdwzXXyOD82dBWL34NEJgZ0l6ytk15PCY3KTuC/DtOpdNXY
	 koW+MxS3hKF3Sk6osOMmKPbVSYYFdRpnSm+/rU6o/5MXFP0ln+bR2IxhuNhtJjwGvG
	 ozo2yzJ0jV3r+KxhjFjHfoupPX3x1pcEjl08rJEo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9730AF8057A;
	Fri, 10 Jun 2022 14:26:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15546F8054A; Fri, 10 Jun 2022 14:26:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 105C2F80537
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 14:26:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 105C2F80537
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="k/SaGrq/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654863992; x=1686399992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YOK2wOTKnfoEMs78PzQR47Kz5JWbwboudShuXlNTgVY=;
 b=k/SaGrq/VYNYR1dVor9xubQy3MoToNEfJP7GGE+f0usSG5cpmwwMZvc3
 h/MJUfT85WXPkNBFF7nBhkSCTIshKNFbbASuOXCOzvqA1PxdgzWTg9L5s
 8Vl+IY3jGOMsjU1p6T4uUMFnt1Qug7WOk+gpymiXXiXIWwH0TFnNeWo/W
 51dY1QcnZ74jReonX6C+VQW3BzJ7QXoinymQRGHpq76S75XyvaFQkPBgU
 +l/5GkFB1CXUDZJTN6ZuHA/ppyXxvBprXIA6t2h+ghGURbBBaP8vfSChE
 R6BgRdt8G0G4/qYtOzG0CFgT4biVkkmEeI5ODCt4aY3vuhNAx05uaFNaK w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="278414466"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="278414466"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 05:26:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="684517923"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 10 Jun 2022 05:26:28 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 11/17] ASoC: Intel: bdw_rt286: Update code indentation
Date: Fri, 10 Jun 2022 14:36:21 +0200
Message-Id: <20220610123627.1339985-12-cezary.rojewski@intel.com>
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

Make use of 100 character limit and modify indentation so code is easier
to read. While at it, sort includes in alphabetical order.

While at it, rename local variable 'chan' to 'channels' to match
hsw_rt5640 board's equivalent.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/boards/bdw_rt286.c | 87 +++++++++++-------------------
 1 file changed, 32 insertions(+), 55 deletions(-)

diff --git a/sound/soc/intel/boards/bdw_rt286.c b/sound/soc/intel/boards/bdw_rt286.c
index 0e67741aea79..fbef19a545b0 100644
--- a/sound/soc/intel/boards/bdw_rt286.c
+++ b/sound/soc/intel/boards/bdw_rt286.c
@@ -8,12 +8,11 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <sound/core.h>
-#include <sound/pcm.h>
-#include <sound/soc.h>
 #include <sound/jack.h>
+#include <sound/pcm.h>
 #include <sound/pcm_params.h>
+#include <sound/soc.h>
 #include <sound/soc-acpi.h>
-
 #include "../../codecs/rt286.h"
 
 static struct snd_soc_jack card_headset;
@@ -44,7 +43,6 @@ static const struct snd_soc_dapm_widget card_widgets[] = {
 };
 
 static const struct snd_soc_dapm_route card_routes[] = {
-
 	/* speaker */
 	{"Speaker", NULL, "SPOR"},
 	{"Speaker", NULL, "SPOL"},
@@ -69,9 +67,10 @@ static int codec_link_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 	int ret = 0;
-	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset",
-		SND_JACK_HEADSET | SND_JACK_BTN_0, &card_headset,
-		card_headset_pins, ARRAY_SIZE(card_headset_pins));
+
+	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset", SND_JACK_HEADSET | SND_JACK_BTN_0,
+					 &card_headset, card_headset_pins,
+					 ARRAY_SIZE(card_headset_pins));
 	if (ret)
 		return ret;
 
@@ -79,34 +78,29 @@ static int codec_link_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
-
 static int codec_link_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
-			struct snd_pcm_hw_params *params)
+				      struct snd_pcm_hw_params *params)
 {
-	struct snd_interval *rate = hw_param_interval(params,
-						      SNDRV_PCM_HW_PARAM_RATE);
-	struct snd_interval *chan = hw_param_interval(params,
-						      SNDRV_PCM_HW_PARAM_CHANNELS);
+	struct snd_interval *channels = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
+	struct snd_interval *rate = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
 
 	/* The ADSP will covert the FE rate to 48k, stereo */
 	rate->min = rate->max = 48000;
-	chan->min = chan->max = 2;
-
+	channels->min = channels->max = 2;
 	/* set SSP0 to 16 bit */
 	params_set_format(params, SNDRV_PCM_FORMAT_S16_LE);
+
 	return 0;
 }
 
 static int codec_link_hw_params(struct snd_pcm_substream *substream,
-	struct snd_pcm_hw_params *params)
+				struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT286_SCLK_S_PLL, 24000000,
-		SND_SOC_CLOCK_IN);
-
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT286_SCLK_S_PLL, 24000000, SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set codec sysclk configuration\n");
 		return ret;
@@ -135,8 +129,7 @@ static int bdw_rt286_fe_startup(struct snd_pcm_substream *substream)
 
 	/* Board supports stereo configuration only */
 	runtime->hw.channels_max = 2;
-	return snd_pcm_hw_constraint_list(runtime, 0,
-					  SNDRV_PCM_HW_PARAM_CHANNELS,
+	return snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 					  &constraints_channels);
 }
 
@@ -144,29 +137,15 @@ static const struct snd_soc_ops bdw_rt286_fe_ops = {
 	.startup = bdw_rt286_fe_startup,
 };
 
-SND_SOC_DAILINK_DEF(system,
-	DAILINK_COMP_ARRAY(COMP_CPU("System Pin")));
-
-SND_SOC_DAILINK_DEF(offload0,
-	DAILINK_COMP_ARRAY(COMP_CPU("Offload0 Pin")));
+SND_SOC_DAILINK_DEF(system, DAILINK_COMP_ARRAY(COMP_CPU("System Pin")));
+SND_SOC_DAILINK_DEF(offload0, DAILINK_COMP_ARRAY(COMP_CPU("Offload0 Pin")));
+SND_SOC_DAILINK_DEF(offload1, DAILINK_COMP_ARRAY(COMP_CPU("Offload1 Pin")));
+SND_SOC_DAILINK_DEF(loopback, DAILINK_COMP_ARRAY(COMP_CPU("Loopback Pin")));
 
-SND_SOC_DAILINK_DEF(offload1,
-	DAILINK_COMP_ARRAY(COMP_CPU("Offload1 Pin")));
-
-SND_SOC_DAILINK_DEF(loopback,
-	DAILINK_COMP_ARRAY(COMP_CPU("Loopback Pin")));
-
-SND_SOC_DAILINK_DEF(dummy,
-	DAILINK_COMP_ARRAY(COMP_DUMMY()));
-
-SND_SOC_DAILINK_DEF(platform,
-	DAILINK_COMP_ARRAY(COMP_PLATFORM("haswell-pcm-audio")));
-
-SND_SOC_DAILINK_DEF(codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-INT343A:00", "rt286-aif1")));
-
-SND_SOC_DAILINK_DEF(ssp0_port,
-	    DAILINK_COMP_ARRAY(COMP_CPU("ssp0-port")));
+SND_SOC_DAILINK_DEF(dummy, DAILINK_COMP_ARRAY(COMP_DUMMY()));
+SND_SOC_DAILINK_DEF(platform, DAILINK_COMP_ARRAY(COMP_PLATFORM("haswell-pcm-audio")));
+SND_SOC_DAILINK_DEF(codec, DAILINK_COMP_ARRAY(COMP_CODEC("i2c-INT343A:00", "rt286-aif1")));
+SND_SOC_DAILINK_DEF(ssp0_port, DAILINK_COMP_ARRAY(COMP_CPU("ssp0-port")));
 
 /* broadwell digital audio interface glue - connects codec <--> CPU */
 static struct snd_soc_dai_link card_dai_links[] = {
@@ -176,7 +155,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.stream_name = "System Playback/Capture",
 		.nonatomic = 1,
 		.dynamic = 1,
-		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
+		.trigger = { SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST },
 		.ops = &bdw_rt286_fe_ops,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
@@ -187,7 +166,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.stream_name = "Offload0 Playback",
 		.nonatomic = 1,
 		.dynamic = 1,
-		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
+		.trigger = { SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST },
 		.dpcm_playback = 1,
 		SND_SOC_DAILINK_REG(offload0, dummy, platform),
 	},
@@ -196,7 +175,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.stream_name = "Offload1 Playback",
 		.nonatomic = 1,
 		.dynamic = 1,
-		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
+		.trigger = { SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST },
 		.dpcm_playback = 1,
 		SND_SOC_DAILINK_REG(offload1, dummy, platform),
 	},
@@ -205,7 +184,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.stream_name = "Loopback",
 		.nonatomic = 1,
 		.dynamic = 1,
-		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
+		.trigger = { SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST },
 		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(loopback, dummy, platform),
 	},
@@ -216,8 +195,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.id = 0,
 		.no_pcm = 1,
 		.init = codec_link_init,
-		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBC_CFC,
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = codec_link_hw_params_fixup,
 		.ops = &codec_link_ops,
@@ -233,7 +211,6 @@ static void broadwell_disable_jack(struct snd_soc_card *card)
 
 	for_each_card_components(card, component) {
 		if (!strcmp(component->name, "i2c-INT343A:00")) {
-
 			dev_dbg(component->dev, "disabling jack detect before going to suspend.\n");
 			rt286_mic_detect(component, NULL);
 			break;
@@ -248,17 +225,18 @@ static int card_suspend_pre(struct snd_soc_card *card)
 	return 0;
 }
 
-static int card_resume_post(struct snd_soc_card *card){
+static int card_resume_post(struct snd_soc_card *card)
+{
 	struct snd_soc_component *component;
 
 	for_each_card_components(card, component) {
 		if (!strcmp(component->name, "i2c-INT343A:00")) {
-
 			dev_dbg(component->dev, "enabling jack detect for resume.\n");
 			rt286_mic_detect(component, &card_headset);
 			break;
 		}
 	}
+
 	return 0;
 }
 
@@ -291,11 +269,10 @@ static int bdw_rt286_probe(struct platform_device *pdev)
 	int ret;
 
 	bdw_rt286_card.dev = &pdev->dev;
-
 	/* override platform name, if required */
 	mach = pdev->dev.platform_data;
-	ret = snd_soc_fixup_dai_links_platform_name(&bdw_rt286_card,
-						    mach->mach_params.platform);
+
+	ret = snd_soc_fixup_dai_links_platform_name(&bdw_rt286_card, mach->mach_params.platform);
 	if (ret)
 		return ret;
 
-- 
2.25.1

