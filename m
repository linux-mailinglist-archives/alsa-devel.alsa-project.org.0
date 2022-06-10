Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDE55466AA
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 14:30:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D31681ED6;
	Fri, 10 Jun 2022 14:29:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D31681ED6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654864235;
	bh=EyGmrKRw3Kskh9z2l/biC22smat8lnm1gYePTEilGvY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NFMRWe8Pmris2COU2RVpVoScRvie1hauyrF2pPTaNnf1p9Wyg6UTENvsafJKeSseI
	 pLCpIbVQU401/LGXEl+Xb/fjn6k0b9GRyITLRLC3mlP6hsLUyaWBVaLmExvQ4p9/oY
	 c3E3NTDbojQJPU1RRkZJnbvNDeDsnzCJ+gkpldb8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67DD6F805A0;
	Fri, 10 Jun 2022 14:26:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD842F8057D; Fri, 10 Jun 2022 14:26:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18168F8053D
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 14:26:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18168F8053D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jxoFPQ8a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654863994; x=1686399994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EyGmrKRw3Kskh9z2l/biC22smat8lnm1gYePTEilGvY=;
 b=jxoFPQ8afIfmWg451OAEtnJSK6MsxgqiUMkuNwffRSuw83pkrSGpUrur
 1+GXTnPGKXcvVztrKsH15Qc/s5FiZs9x9xbIHuJb+accwXzsqau4sU2PC
 CmWOwTE7rrQb1JrDtKoe/O5481DxGO0/nUuJllluk6VNkeVAGBoW/TX9L
 ocy1+wIDP5N6QcEuhI4kFi67XhJdvUz7LzJi/fDnXa4CxuStiieOt1l6L
 ODDz6qbOeuSuS/op24ODxw+JkjIP/qzgV/DfUpl4znCudORr3X6tzq72S
 HZPGl0AeONsxHI35y/ZjEOrqIDfr5XkvFXx9cEbHSyWXiH527AeFYzvsO w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="278414469"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="278414469"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 05:26:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; d="scan'208";a="684517926"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 10 Jun 2022 05:26:30 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 12/17] ASoC: Intel: bdw_rt286: Update file comments
Date: Fri, 10 Jun 2022 14:36:22 +0200
Message-Id: <20220610123627.1339985-13-cezary.rojewski@intel.com>
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

Drop redundant and update valuable comments within the file to increase
readability. This patch also revisits module information and kconfig
help strings.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig     |  2 +-
 sound/soc/intel/boards/bdw_rt286.c | 23 +++++++----------------
 2 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 817b4c04bf6a..aa12d7e3dd2f 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -85,7 +85,7 @@ config SND_SOC_INTEL_BDW_RT5677_MACH
 	  If unsure select "N".
 
 config SND_SOC_INTEL_BROADWELL_MACH
-	tristate "Broadwell Wildcatpoint"
+	tristate "Broadwell with RT286 I2S codec"
 	depends on I2C
 	depends on I2C_DESIGNWARE_PLATFORM || COMPILE_TEST
 	depends on X86_INTEL_LPSS || COMPILE_TEST
diff --git a/sound/soc/intel/boards/bdw_rt286.c b/sound/soc/intel/boards/bdw_rt286.c
index fbef19a545b0..51b37dafb469 100644
--- a/sound/soc/intel/boards/bdw_rt286.c
+++ b/sound/soc/intel/boards/bdw_rt286.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Intel Broadwell Wildcatpoint SST Audio
+ * Sound card driver for Intel Broadwell Wildcat Point with Realtek 286
  *
  * Copyright (C) 2013, Intel Corporation. All rights reserved.
  */
@@ -16,7 +16,7 @@
 #include "../../codecs/rt286.h"
 
 static struct snd_soc_jack card_headset;
-/* Headset jack detection DAPM pins */
+
 static struct snd_soc_jack_pin card_headset_pins[] = {
 	{
 		.pin = "Mic Jack",
@@ -43,18 +43,14 @@ static const struct snd_soc_dapm_widget card_widgets[] = {
 };
 
 static const struct snd_soc_dapm_route card_routes[] = {
-	/* speaker */
 	{"Speaker", NULL, "SPOR"},
 	{"Speaker", NULL, "SPOL"},
 
-	/* HP jack connectors - unknown if we have jack deteck */
 	{"Headphone Jack", NULL, "HPO Pin"},
 
-	/* other jacks */
 	{"MIC1", NULL, "Mic Jack"},
 	{"LINE1", NULL, "Line Jack"},
 
-	/* digital mics */
 	{"DMIC1 Pin", NULL, "DMIC1"},
 	{"DMIC2 Pin", NULL, "DMIC2"},
 
@@ -84,10 +80,10 @@ static int codec_link_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	struct snd_interval *channels = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
 	struct snd_interval *rate = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
 
-	/* The ADSP will covert the FE rate to 48k, stereo */
+	/* The ADSP will convert the FE rate to 48kHz, stereo. */
 	rate->min = rate->max = 48000;
 	channels->min = channels->max = 2;
-	/* set SSP0 to 16 bit */
+	/* Set SSP0 to 16 bit. */
 	params_set_format(params, SNDRV_PCM_FORMAT_S16_LE);
 
 	return 0;
@@ -147,7 +143,6 @@ SND_SOC_DAILINK_DEF(platform, DAILINK_COMP_ARRAY(COMP_PLATFORM("haswell-pcm-audi
 SND_SOC_DAILINK_DEF(codec, DAILINK_COMP_ARRAY(COMP_CODEC("i2c-INT343A:00", "rt286-aif1")));
 SND_SOC_DAILINK_DEF(ssp0_port, DAILINK_COMP_ARRAY(COMP_CPU("ssp0-port")));
 
-/* broadwell digital audio interface glue - connects codec <--> CPU */
 static struct snd_soc_dai_link card_dai_links[] = {
 	/* Front End DAI links */
 	{
@@ -240,14 +235,13 @@ static int card_resume_post(struct snd_soc_card *card)
 	return 0;
 }
 
-/* use space before codec name to simplify card ID, and simplify driver name */
+/* Use space before codec name to simplify card ID, and simplify driver name. */
 #define SOF_CARD_NAME "bdw rt286" /* card name will be 'sof-bdw rt286' */
 #define SOF_DRIVER_NAME "SOF"
 
 #define CARD_NAME "broadwell-rt286"
 #define DRIVER_NAME NULL /* card name will be used for driver name */
 
-/* broadwell audio machine driver for WPT + RT286S */
 static struct snd_soc_card bdw_rt286_card = {
 	.owner = THIS_MODULE,
 	.dai_link = card_dai_links,
@@ -269,14 +263,12 @@ static int bdw_rt286_probe(struct platform_device *pdev)
 	int ret;
 
 	bdw_rt286_card.dev = &pdev->dev;
-	/* override platform name, if required */
 	mach = pdev->dev.platform_data;
 
 	ret = snd_soc_fixup_dai_links_platform_name(&bdw_rt286_card, mach->mach_params.platform);
 	if (ret)
 		return ret;
 
-	/* set card and driver name */
 	if (snd_soc_acpi_sof_parent(&pdev->dev)) {
 		bdw_rt286_card.name = SOF_CARD_NAME;
 		bdw_rt286_card.driver_name = SOF_DRIVER_NAME;
@@ -308,8 +300,7 @@ static struct platform_driver bdw_rt286_driver = {
 
 module_platform_driver(bdw_rt286_driver)
 
-/* Module information */
 MODULE_AUTHOR("Liam Girdwood, Xingchao Wang");
-MODULE_DESCRIPTION("Intel SST Audio for WPT/Broadwell");
-MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Sound card driver for Intel Broadwell Wildcat Point with Realtek 286");
+MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:bdw_rt286");
-- 
2.25.1

