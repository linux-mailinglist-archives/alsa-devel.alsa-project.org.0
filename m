Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1264C5466A2
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 14:28:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC73C1B26;
	Fri, 10 Jun 2022 14:28:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC73C1B26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654864135;
	bh=3tPMe99bTOkQE9DysdgkDAUkjYxsM7CWAZAt8mQ7eFg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N3v25gaBbKRDzA81MsIQWzHbIkzIOWcWhv/ZtGdnA1GGwW/xxVnuSWzcCF3bo/efw
	 hM5iS0JpN0A0QZUymrZRWMJNwH4WUn8C/8hBYnxXNEmKZV/oJlUUp0yHWWrpWkC0hJ
	 JgGA9WUAulZLtya+qTYDz9Y3s9RAFhiyS09bV8es=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6114F80548;
	Fri, 10 Jun 2022 14:26:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 044FEF804D8; Fri, 10 Jun 2022 14:26:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80D57F80527
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 14:26:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80D57F80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Q5lHa4Th"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654863978; x=1686399978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3tPMe99bTOkQE9DysdgkDAUkjYxsM7CWAZAt8mQ7eFg=;
 b=Q5lHa4ThQsJdmL4xtVuspxCHP0xUj5AyvzLJULDeArzgBFZ20lMur1ex
 489u/BbuV5ymt4jRKizSmvttheL3KCBxY+gCU1FebeEMOTyHdbI3jjhyj
 R+gJ0L7JhMKIKZc4mU7akovevbWxcWyfokGovSUofi/Stvfhxw6LYr+sE
 BBjhfLqkxM43+7Wgh6RvmVizYzPOBkc4u8IfgBRYrzxqmQJpXtbltb8Rs
 c5zY/+NiOdlBs14rdwpsBN7KUW2/WgDFHZVy7/eD4GxjQppOpHxyMpKof
 0k+PCxqCVRGey90SxKtrzKF3cZ+oP98b9WW70vn22JmR7lyn727hP696r A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="278414356"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="278414356"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 05:26:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="684517854"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 10 Jun 2022 05:26:13 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 04/17] ASoC: Intel: hsw_rt5640: Update code indentation
Date: Fri, 10 Jun 2022 14:36:14 +0200
Message-Id: <20220610123627.1339985-5-cezary.rojewski@intel.com>
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

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/boards/hsw_rt5640.c | 67 ++++++++++-------------------
 1 file changed, 22 insertions(+), 45 deletions(-)

diff --git a/sound/soc/intel/boards/hsw_rt5640.c b/sound/soc/intel/boards/hsw_rt5640.c
index a096453bf1df..69be5086b98d 100644
--- a/sound/soc/intel/boards/hsw_rt5640.c
+++ b/sound/soc/intel/boards/hsw_rt5640.c
@@ -9,10 +9,9 @@
 #include <linux/platform_device.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
+#include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
-#include <sound/pcm_params.h>
-
 #include "../../codecs/rt5640.h"
 
 /* Haswell ULT platforms have a Headphone and Mic jack */
@@ -22,7 +21,6 @@ static const struct snd_soc_dapm_widget card_widgets[] = {
 };
 
 static const struct snd_soc_dapm_route card_routes[] = {
-
 	{"Headphones", NULL, "HPOR"},
 	{"Headphones", NULL, "HPOL"},
 	{"IN2P", NULL, "Mic"},
@@ -33,32 +31,28 @@ static const struct snd_soc_dapm_route card_routes[] = {
 };
 
 static int codec_link_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
-			struct snd_pcm_hw_params *params)
+				      struct snd_pcm_hw_params *params)
 {
-	struct snd_interval *rate = hw_param_interval(params,
-			SNDRV_PCM_HW_PARAM_RATE);
-	struct snd_interval *channels = hw_param_interval(params,
-						SNDRV_PCM_HW_PARAM_CHANNELS);
+	struct snd_interval *channels = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
+	struct snd_interval *rate = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
 
 	/* The ADSP will covert the FE rate to 48k, stereo */
 	rate->min = rate->max = 48000;
 	channels->min = channels->max = 2;
-
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
 
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT5640_SCLK_S_MCLK, 12288000,
-		SND_SOC_CLOCK_IN);
-
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5640_SCLK_S_MCLK, 12288000, SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set codec sysclk configuration\n");
 		return ret;
@@ -74,29 +68,15 @@ static const struct snd_soc_ops codec_link_ops = {
 	.hw_params = codec_link_hw_params,
 };
 
-SND_SOC_DAILINK_DEF(dummy,
-	DAILINK_COMP_ARRAY(COMP_DUMMY()));
-
-SND_SOC_DAILINK_DEF(system,
-	DAILINK_COMP_ARRAY(COMP_CPU("System Pin")));
+SND_SOC_DAILINK_DEF(system, DAILINK_COMP_ARRAY(COMP_CPU("System Pin")));
+SND_SOC_DAILINK_DEF(offload0, DAILINK_COMP_ARRAY(COMP_CPU("Offload0 Pin")));
+SND_SOC_DAILINK_DEF(offload1, DAILINK_COMP_ARRAY(COMP_CPU("Offload1 Pin")));
+SND_SOC_DAILINK_DEF(loopback, DAILINK_COMP_ARRAY(COMP_CPU("Loopback Pin")));
 
-SND_SOC_DAILINK_DEF(offload0,
-	DAILINK_COMP_ARRAY(COMP_CPU("Offload0 Pin")));
-
-SND_SOC_DAILINK_DEF(offload1,
-	DAILINK_COMP_ARRAY(COMP_CPU("Offload1 Pin")));
-
-SND_SOC_DAILINK_DEF(loopback,
-	DAILINK_COMP_ARRAY(COMP_CPU("Loopback Pin")));
-
-SND_SOC_DAILINK_DEF(codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-INT33CA:00", "rt5640-aif1")));
-
-SND_SOC_DAILINK_DEF(platform,
-	DAILINK_COMP_ARRAY(COMP_PLATFORM("haswell-pcm-audio")));
-
-SND_SOC_DAILINK_DEF(ssp0_port,
-	    DAILINK_COMP_ARRAY(COMP_CPU("ssp0-port")));
+SND_SOC_DAILINK_DEF(dummy, DAILINK_COMP_ARRAY(COMP_DUMMY()));
+SND_SOC_DAILINK_DEF(codec, DAILINK_COMP_ARRAY(COMP_CODEC("i2c-INT33CA:00", "rt5640-aif1")));
+SND_SOC_DAILINK_DEF(platform, DAILINK_COMP_ARRAY(COMP_PLATFORM("haswell-pcm-audio")));
+SND_SOC_DAILINK_DEF(ssp0_port, DAILINK_COMP_ARRAY(COMP_CPU("ssp0-port")));
 
 static struct snd_soc_dai_link card_dai_links[] = {
 	/* Front End DAI links */
@@ -105,7 +85,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.stream_name = "System Playback/Capture",
 		.nonatomic = 1,
 		.dynamic = 1,
-		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
+		.trigger = { SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST },
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
@@ -115,7 +95,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.stream_name = "Offload0 Playback",
 		.nonatomic = 1,
 		.dynamic = 1,
-		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
+		.trigger = { SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST },
 		.dpcm_playback = 1,
 		SND_SOC_DAILINK_REG(offload0, dummy, platform),
 	},
@@ -124,7 +104,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.stream_name = "Offload1 Playback",
 		.nonatomic = 1,
 		.dynamic = 1,
-		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
+		.trigger = { SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST },
 		.dpcm_playback = 1,
 		SND_SOC_DAILINK_REG(offload1, dummy, platform),
 	},
@@ -133,19 +113,17 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.stream_name = "Loopback",
 		.nonatomic = 1,
 		.dynamic = 1,
-		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
+		.trigger = { SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST },
 		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(loopback, dummy, platform),
 	},
-
 	/* Back End DAI links */
 	{
 		/* SSP0 - Codec */
 		.name = "Codec",
 		.id = 0,
 		.no_pcm = 1,
-		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBC_CFC,
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = codec_link_hw_params_fixup,
 		.ops = &codec_link_ops,
@@ -174,11 +152,10 @@ static int hsw_rt5640_probe(struct platform_device *pdev)
 	int ret;
 
 	hsw_rt5640_card.dev = &pdev->dev;
-
 	/* override platform name, if required */
 	mach = pdev->dev.platform_data;
-	ret = snd_soc_fixup_dai_links_platform_name(&hsw_rt5640_card,
-						    mach->mach_params.platform);
+
+	ret = snd_soc_fixup_dai_links_platform_name(&hsw_rt5640_card, mach->mach_params.platform);
 	if (ret)
 		return ret;
 
-- 
2.25.1

