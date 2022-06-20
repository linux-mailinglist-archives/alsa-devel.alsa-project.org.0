Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AB7551556
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 12:08:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B92191910;
	Mon, 20 Jun 2022 12:07:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B92191910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655719700;
	bh=V/2mtaAbvJivgSGthFt5uwbbLEP6paf9cIqZdyPhYp8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oKrb++Aujaki5gEMjP0aP3LqmXRLsQptitfwIQZSPAkK90NRhN2Fd6eKTzh064z97
	 nhzdHaUS9Rc/4KU6p7BT5nBYi24cHPCaw8S1NrlM4EcDAPPV4aky52+26YMX10NQL9
	 1RJBNTL7lzJIeXsPMrWM3v6QfRXyJTaT36rliKkU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34C74F805A1;
	Mon, 20 Jun 2022 12:04:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D82DFF80587; Mon, 20 Jun 2022 12:04:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E734F80579
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 12:04:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E734F80579
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KpL3WhKE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655719455; x=1687255455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V/2mtaAbvJivgSGthFt5uwbbLEP6paf9cIqZdyPhYp8=;
 b=KpL3WhKElFlZjyBxbKVelED+x5+KNcqJEb+HdjCSM1XWhG6j0vCZhMl/
 PnLKAItQUl2FTvm3ywE4dhvzBBBh5MrXOq6s+zxHyr9c6nkSuSkTg0L0w
 93IGoZyfFb0fC4WCLFkkXxmxgIy0cd0o429rh76XTLfLmpeVXsZ/n+sdf
 iHKcM3gAOT07MiLkt6FyMKa3MxQoMbU60R/avOJFw91gMFDfbA3pgEeQA
 TI0LULE4LVWMqd+gzUWU18rV9+aJ8nDA9hN2GwCgPC+7k+bN4OvI4/RIr
 YEbt9bb145Kvthq2X4gKqwrf/jLWSJlTUzlGvpu6UHhHiRVKQsxOiwjsh Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="366180720"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="366180720"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 03:04:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="643046393"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 20 Jun 2022 03:04:11 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v4 12/17] ASoC: Intel: bdw_rt286: Update file comments
Date: Mon, 20 Jun 2022 12:13:57 +0200
Message-Id: <20220620101402.2684366-13-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620101402.2684366-1-cezary.rojewski@intel.com>
References: <20220620101402.2684366-1-cezary.rojewski@intel.com>
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
index 6c0cd53224d5..9d815c31e1f4 100644
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
@@ -240,14 +235,13 @@ static int bdw_rt286_resume(struct snd_soc_card *card)
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

