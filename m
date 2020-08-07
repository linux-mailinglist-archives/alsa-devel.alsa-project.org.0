Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C9823EC3C
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 13:16:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 896B8165E;
	Fri,  7 Aug 2020 13:15:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 896B8165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596799005;
	bh=pUp2qjTBHdwSr7Cis4uwxJJj8R/M1wbYJ2trqO2DMDc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K0sr+B3H65n3fhthkSqqLf52dUdMFDn3L27RteqQxCkymI9IA72oF0SPrbv7fbXCP
	 uIWUEbc4xVdOQyoQboAmHCAf+bHNSKQcaYl+Cmu7XgbAaX1kspPElwXjQJvxo5jdCx
	 W0uitDbgAKo95+zcloiGBX3/v0He7yXpVL7WkFpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9181EF8034F;
	Fri,  7 Aug 2020 13:08:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D354DF8034E; Fri,  7 Aug 2020 13:07:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57B93F80346
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 13:07:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57B93F80346
IronPort-SDR: Csb8TvyAidrsXFMYj0lbgKXXxyIm0wJF873JNpCkCuY8SsnE2/rixRfl+sAQ/eu/HOad3DOAz4
 3YR11h04FG+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9705"; a="214585546"
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; d="scan'208";a="214585546"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2020 04:07:52 -0700
IronPort-SDR: OCgpuTmd8tfqL92YNrPJBf2j7gNMWWML16ekvkL6GVBUrdh2R0yziiM3KYaOVK1L/ydXTWqUUZ
 uSP+dfzT5bbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; d="scan'208";a="333514110"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga007.jf.intel.com with ESMTP; 07 Aug 2020 04:07:49 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 13/13] ASoC: Intel: bdw-5677: Remove haswell-solution specific
 code
Date: Fri,  7 Aug 2020 13:06:49 +0200
Message-Id: <20200807110649.17114-14-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807110649.17114-1-cezary.rojewski@intel.com>
References: <20200807110649.17114-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org, michal.wasko@intel.com,
 cujomalainey@chromium.org, ppapierkowski@habana.ai,
 vamshi.krishna.gopal@intel.com
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

Remove code specific to sound/soc/intel/haswell. Update BE dai_link
definition to provide seamless transition to catpt solution.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/boards/bdw-rt5677.c | 33 -----------------------------
 1 file changed, 33 deletions(-)

diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index 86e427e3822f..4451957fc170 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -17,9 +17,6 @@
 #include <sound/jack.h>
 #include <sound/soc-acpi.h>
 
-#include "../common/sst-dsp.h"
-#include "../haswell/sst-haswell-ipc.h"
-
 #include "../../codecs/rt5677.h"
 
 struct bdw_rt5677_priv {
@@ -201,27 +198,6 @@ static const struct snd_soc_ops bdw_rt5677_dsp_ops = {
 	.hw_params = bdw_rt5677_dsp_hw_params,
 };
 
-#if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
-static int bdw_rt5677_rtd_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
-	struct sst_pdata *pdata = dev_get_platdata(component->dev);
-	struct sst_hsw *broadwell = pdata->dsp;
-	int ret;
-
-	/* Set ADSP SSP port settings */
-	ret = sst_hsw_device_set_config(broadwell, SST_HSW_DEVICE_SSP_0,
-		SST_HSW_DEVICE_MCLK_FREQ_24_MHZ,
-		SST_HSW_DEVICE_CLOCK_MASTER, 9);
-	if (ret < 0) {
-		dev_err(rtd->dev, "error: failed to set device config\n");
-		return ret;
-	}
-
-	return 0;
-}
-#endif
-
 static const unsigned int channels[] = {
 	2,
 };
@@ -333,10 +309,8 @@ SND_SOC_DAILINK_DEF(platform,
 SND_SOC_DAILINK_DEF(be,
 	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-RT5677CE:00", "rt5677-aif1")));
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
 SND_SOC_DAILINK_DEF(ssp0_port,
 	    DAILINK_COMP_ARRAY(COMP_CPU("ssp0-port")));
-#endif
 
 /* Wake on voice interface */
 SND_SOC_DAILINK_DEFS(dsp,
@@ -350,9 +324,6 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 		.name = "System PCM",
 		.stream_name = "System Playback/Capture",
 		.dynamic = 1,
-#if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
-		.init = bdw_rt5677_rtd_init,
-#endif
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST,
 			SND_SOC_DPCM_TRIGGER_POST
@@ -387,11 +358,7 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 		.dpcm_capture = 1,
 		.init = bdw_rt5677_init,
 		.exit = bdw_rt5677_exit,
-#if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
-		SND_SOC_DAILINK_REG(dummy, be, dummy),
-#else
 		SND_SOC_DAILINK_REG(ssp0_port, be, platform),
-#endif
 	},
 };
 
-- 
2.17.1

