Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE5054829A
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 11:08:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D26201832;
	Mon, 13 Jun 2022 11:07:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D26201832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655111280;
	bh=ASwBtb78kA/ZxwM96te3oAsVro2Po6ndmsMI8j4Kb+c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BOv1EgFyA+R8g6LJfQtw36OySxv7my5XGe03S1XLkeDpPvJO4vQ0RxtwnxC/fPant
	 ORgaH8UtX9HEYY4HevJtnY2pN5jD5/+Z8MWBLeVdf2+n3m67q2HzNo/IBnZ+Rk8MMd
	 av72B9+obDHuHXAUptNdcV9CHMnsMrid/FopgFHQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95C2EF804BB;
	Mon, 13 Jun 2022 11:05:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A5C3F8053A; Mon, 13 Jun 2022 11:05:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15FBBF804EC
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 11:05:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15FBBF804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mORmHKbg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655111140; x=1686647140;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ASwBtb78kA/ZxwM96te3oAsVro2Po6ndmsMI8j4Kb+c=;
 b=mORmHKbgM2MW/O4a7pPHeOOpFOElPuzfV9vGADbgl1B8PzaJHypY2+eR
 3DO6ybrOoHmsijpvgIgPgwo3xGKoj3V+Zb7RyPUvmzzEGg3c/xC9tjV52
 BxVDmSfzro4sdN+io7PsLwE+XPOo2EiW2r+QExqpo4T/UGRu8f9lkijJH
 ayFIkYnKOvD9F4Kr1aNDEL4XpvZzm/wvXmBX1Xyt7B6ynb/GRurEVJ84b
 7V/JGh8906k5fGtkWRLqUFx3/Oh+W2sr+T/E83mho48cWtC/6wtpKLhQp
 4VF/enNgMIOhj8yS1Ylyu/uLaUdWAZ5UtsYywndS6p2lmrFcy2+AKFJDb Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="275753815"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="275753815"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 02:05:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="639625785"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 13 Jun 2022 02:05:36 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 05/17] ASoC: Intel: hsw_rt5640: Update file comments
Date: Mon, 13 Jun 2022 11:15:34 +0200
Message-Id: <20220613091546.1565167-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613091546.1565167-1-cezary.rojewski@intel.com>
References: <20220613091546.1565167-1-cezary.rojewski@intel.com>
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
index 69be5086b98d..0cd788a73694 100644
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

