Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE855466A1
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 14:28:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C55581B34;
	Fri, 10 Jun 2022 14:27:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C55581B34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654864118;
	bh=MimaEjhfOFMoaFaUoxenQwVquI+Sqlngom9jUe3PD1I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nGxzkrtGG2VbIiD+z1nQnYgPTgPoCQcA7kmjchSQEFDETbMXIiYDPEQEAwUAyVcB4
	 +KD+HuLSbOUJT3/RIucT+g/kdS302V/RvqaxNp3TCtVLCD48Q0rarKg+jFQLADgtGd
	 KqTQavQLupFujlgqTtiO2+6wdkn5wDGD/LF9Bd2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 284DFF80542;
	Fri, 10 Jun 2022 14:26:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8240F80527; Fri, 10 Jun 2022 14:26:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75F88F804DA
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 14:26:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75F88F804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PHKmOjFN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654863980; x=1686399980;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MimaEjhfOFMoaFaUoxenQwVquI+Sqlngom9jUe3PD1I=;
 b=PHKmOjFNxKn+dnjIgaVvpz6zhVsKFEWSUsFLj3z8uMIRd71ch+oeVhEP
 N4/duZ0UOcOpojhk4u4ftiFRGcCjaJUsNLznAxsImkj1xt0tteRKXyZ5r
 YybxTGQpRbSmcXoaH4C8bcUnPv6pNNB7TmOYybxl7z/1QXqdr538//Jie
 aK+IjCvN+P0NOxuNWMRRoorTecUylB+V3U66HmaJe23matXRvrzrXfGsz
 0f2S8HyYCuuA8FgqfummwENfxbujBOpL752WDstNBNixOjcrqYoAKJ/Uq
 O+IPU4VIxUvhinsbsBhWa+3uPsV/dXZ0125N0KxXZjsinmkzv5CrcnGKo g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="278414331"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="278414331"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 05:26:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="684517836"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 10 Jun 2022 05:26:10 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 02/17] ASoC: Intel: hsw_rt5640: Reword prefixes of all driver
 members
Date: Fri, 10 Jun 2022 14:36:12 +0200
Message-Id: <20220610123627.1339985-3-cezary.rojewski@intel.com>
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
 sound/soc/intel/boards/hsw_rt5640.c | 46 ++++++++++++++---------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/sound/soc/intel/boards/hsw_rt5640.c b/sound/soc/intel/boards/hsw_rt5640.c
index aa61e101f793..b51ce8d0ca22 100644
--- a/sound/soc/intel/boards/hsw_rt5640.c
+++ b/sound/soc/intel/boards/hsw_rt5640.c
@@ -16,12 +16,12 @@
 #include "../../codecs/rt5640.h"
 
 /* Haswell ULT platforms have a Headphone and Mic jack */
-static const struct snd_soc_dapm_widget haswell_widgets[] = {
+static const struct snd_soc_dapm_widget card_widgets[] = {
 	SND_SOC_DAPM_HP("Headphones", NULL),
 	SND_SOC_DAPM_MIC("Mic", NULL),
 };
 
-static const struct snd_soc_dapm_route haswell_rt5640_map[] = {
+static const struct snd_soc_dapm_route card_routes[] = {
 
 	{"Headphones", NULL, "HPOR"},
 	{"Headphones", NULL, "HPOL"},
@@ -32,7 +32,7 @@ static const struct snd_soc_dapm_route haswell_rt5640_map[] = {
 	{"AIF1 Playback", NULL, "SSP0 CODEC OUT"},
 };
 
-static int haswell_ssp0_fixup(struct snd_soc_pcm_runtime *rtd,
+static int codec_link_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 			struct snd_pcm_hw_params *params)
 {
 	struct snd_interval *rate = hw_param_interval(params,
@@ -49,7 +49,7 @@ static int haswell_ssp0_fixup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
-static int haswell_rt5640_hw_params(struct snd_pcm_substream *substream,
+static int codec_link_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
@@ -70,8 +70,8 @@ static int haswell_rt5640_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static const struct snd_soc_ops haswell_rt5640_ops = {
-	.hw_params = haswell_rt5640_hw_params,
+static const struct snd_soc_ops codec_link_ops = {
+	.hw_params = codec_link_hw_params,
 };
 
 SND_SOC_DAILINK_DEF(dummy,
@@ -98,7 +98,7 @@ SND_SOC_DAILINK_DEF(platform,
 SND_SOC_DAILINK_DEF(ssp0_port,
 	    DAILINK_COMP_ARRAY(COMP_CPU("ssp0-port")));
 
-static struct snd_soc_dai_link haswell_rt5640_dais[] = {
+static struct snd_soc_dai_link card_dai_links[] = {
 	/* Front End DAI links */
 	{
 		.name = "System",
@@ -147,8 +147,8 @@ static struct snd_soc_dai_link haswell_rt5640_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
-		.be_hw_params_fixup = haswell_ssp0_fixup,
-		.ops = &haswell_rt5640_ops,
+		.be_hw_params_fixup = codec_link_hw_params_fixup,
+		.ops = &codec_link_ops,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp0_port, codec, platform),
@@ -156,44 +156,44 @@ static struct snd_soc_dai_link haswell_rt5640_dais[] = {
 };
 
 /* audio machine driver for Haswell Lynxpoint DSP + RT5640 */
-static struct snd_soc_card haswell_rt5640 = {
+static struct snd_soc_card hsw_rt5640_card = {
 	.name = "haswell-rt5640",
 	.owner = THIS_MODULE,
-	.dai_link = haswell_rt5640_dais,
-	.num_links = ARRAY_SIZE(haswell_rt5640_dais),
-	.dapm_widgets = haswell_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(haswell_widgets),
-	.dapm_routes = haswell_rt5640_map,
-	.num_dapm_routes = ARRAY_SIZE(haswell_rt5640_map),
+	.dai_link = card_dai_links,
+	.num_links = ARRAY_SIZE(card_dai_links),
+	.dapm_widgets = card_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(card_widgets),
+	.dapm_routes = card_routes,
+	.num_dapm_routes = ARRAY_SIZE(card_routes),
 	.fully_routed = true,
 };
 
-static int haswell_audio_probe(struct platform_device *pdev)
+static int hsw_rt5640_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach;
 	int ret;
 
-	haswell_rt5640.dev = &pdev->dev;
+	hsw_rt5640_card.dev = &pdev->dev;
 
 	/* override platform name, if required */
 	mach = pdev->dev.platform_data;
-	ret = snd_soc_fixup_dai_links_platform_name(&haswell_rt5640,
+	ret = snd_soc_fixup_dai_links_platform_name(&hsw_rt5640_card,
 						    mach->mach_params.platform);
 	if (ret)
 		return ret;
 
-	return devm_snd_soc_register_card(&pdev->dev, &haswell_rt5640);
+	return devm_snd_soc_register_card(&pdev->dev, &hsw_rt5640_card);
 }
 
-static struct platform_driver haswell_audio = {
-	.probe = haswell_audio_probe,
+static struct platform_driver hsw_rt5640_driver = {
+	.probe = hsw_rt5640_probe,
 	.driver = {
 		.name = "haswell-audio",
 		.pm = &snd_soc_pm_ops,
 	},
 };
 
-module_platform_driver(haswell_audio)
+module_platform_driver(hsw_rt5640_driver)
 
 /* Module information */
 MODULE_AUTHOR("Liam Girdwood, Xingchao Wang");
-- 
2.25.1

