Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B88C551547
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 12:06:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DE281900;
	Mon, 20 Jun 2022 12:05:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DE281900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655719589;
	bh=OOacUxvRRrGGYEJB1AD2BU2NHaEu2rv6h6lR9tsOpQs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uhXDtwE1N5BwyP4niXPfk2ceerlPEXpOWrTLbrVJvL+PMjai9n3EdECEak6LJMhxR
	 F4cTKpkBSjK4xOKNKB9oJg8fkhMrr0Q4mAjQZEkGysL0RFnzXOLZh3VXUUQcI/zp5b
	 YubMvKkyVYtlj8eq1lESuYAON6nfkmZNR6euQN0Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 884F4F804EB;
	Mon, 20 Jun 2022 12:04:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4840F8053D; Mon, 20 Jun 2022 12:04:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FF07F80535
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 12:03:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FF07F80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UGXgfhN0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655719440; x=1687255440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OOacUxvRRrGGYEJB1AD2BU2NHaEu2rv6h6lR9tsOpQs=;
 b=UGXgfhN0u6E8p95GU18K7P7jptiOlxVYNhxLwRz4GeZCvTTIQ6u76F8J
 zpTpEWo+ZuUi0i6dG4TDR7yJg8/+1W47pHX5h07i/ESF47sIycTOTb7gU
 knN640DlY2wK3q3ECvPGdVxHePOOJhhGfKHP2jFEhS9PFzyHN1LWhzrRJ
 +93NGfCuBP2cXNt0Dh/XVdlnUm/MbMifhb2GlbvwtghrqvoKO4W/9Yoo8
 ZGDEJutdowyMP4HYFe9OUl5otIwZLrkIi6XnkYXH8XWEG38Y1/nELgJN8
 nuwiXlJ1YF5J7BFpHEZdZ86cTrbtuqteBfHspzh7m5shCe1X/SVD15ICy g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="366180682"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="366180682"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 03:03:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="643046288"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 20 Jun 2022 03:03:55 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v4 05/17] ASoC: Intel: hsw_rt5640: Update file comments
Date: Mon, 20 Jun 2022 12:13:50 +0200
Message-Id: <20220620101402.2684366-6-cezary.rojewski@intel.com>
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
 sound/soc/intel/boards/Kconfig      |  2 +-
 sound/soc/intel/boards/hsw_rt5640.c | 16 ++++++----------
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 4b4c1e1e4808..817b4c04bf6a 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -41,7 +41,7 @@ config SND_SOC_INTEL_SOF_CIRRUS_COMMON
 if SND_SOC_INTEL_CATPT
 
 config SND_SOC_INTEL_HASWELL_MACH
-	tristate "Haswell Lynxpoint"
+	tristate "Haswell with RT5640 I2S codec"
 	depends on I2C
 	depends on I2C_DESIGNWARE_PLATFORM || COMPILE_TEST
 	depends on X86_INTEL_LPSS || COMPILE_TEST
diff --git a/sound/soc/intel/boards/hsw_rt5640.c b/sound/soc/intel/boards/hsw_rt5640.c
index da31b011b495..f843ba5f4718 100644
--- a/sound/soc/intel/boards/hsw_rt5640.c
+++ b/sound/soc/intel/boards/hsw_rt5640.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Intel Haswell Lynxpoint SST Audio
+ * Sound card driver for Intel Haswell Lynx Point with Realtek 5640
  *
  * Copyright (C) 2013, Intel Corporation. All rights reserved.
  */
@@ -14,7 +14,6 @@
 #include <sound/soc-acpi.h>
 #include "../../codecs/rt5640.h"
 
-/* Haswell ULT platforms have a Headphone and Mic jack */
 static const struct snd_soc_dapm_widget card_widgets[] = {
 	SND_SOC_DAPM_HP("Headphones", NULL),
 	SND_SOC_DAPM_MIC("Mic", NULL),
@@ -36,10 +35,10 @@ static int codec_link_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	struct snd_interval *channels = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
 	struct snd_interval *rate = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
 
-	/* The ADSP will covert the FE rate to 48k, stereo */
+	/* The ADSP will convert the FE rate to 48k, stereo. */
 	rate->min = rate->max = 48000;
 	channels->min = channels->max = 2;
-	/* set SSP0 to 16 bit */
+	/* Set SSP0 to 16 bit. */
 	params_set_format(params, SNDRV_PCM_FORMAT_S16_LE);
 
 	return 0;
@@ -58,7 +57,7 @@ static int codec_link_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	/* set correct codec filter for DAI format and clock config */
+	/* Set correct codec filter for DAI format and clock config. */
 	snd_soc_component_update_bits(codec_dai->component, 0x83, 0xffff, 0x8000);
 
 	return ret;
@@ -133,7 +132,6 @@ static struct snd_soc_dai_link card_dai_links[] = {
 	},
 };
 
-/* audio machine driver for Haswell Lynxpoint DSP + RT5640 */
 static struct snd_soc_card hsw_rt5640_card = {
 	.name = "haswell-rt5640",
 	.owner = THIS_MODULE,
@@ -152,7 +150,6 @@ static int hsw_rt5640_probe(struct platform_device *pdev)
 	int ret;
 
 	hsw_rt5640_card.dev = &pdev->dev;
-	/* override platform name, if required */
 	mach = pdev->dev.platform_data;
 
 	ret = snd_soc_fixup_dai_links_platform_name(&hsw_rt5640_card, mach->mach_params.platform);
@@ -172,8 +169,7 @@ static struct platform_driver hsw_rt5640_driver = {
 
 module_platform_driver(hsw_rt5640_driver)
 
-/* Module information */
 MODULE_AUTHOR("Liam Girdwood, Xingchao Wang");
-MODULE_DESCRIPTION("Intel SST Audio for Haswell Lynxpoint");
-MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Sound card driver for Intel Haswell Lynx Point with Realtek 5640");
+MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:hsw_rt5640");
-- 
2.25.1

