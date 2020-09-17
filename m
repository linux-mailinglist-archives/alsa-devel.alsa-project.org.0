Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD1426DDE5
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 16:19:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFBE3168A;
	Thu, 17 Sep 2020 16:18:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFBE3168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600352373;
	bh=dUteBxx+9AlSMIpxgevWBJwj7PpPeg6k7TvZl94d8dw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P1qDKm9qEexcWdFQMqWnPr4CGkpuL97Yuik+vOMXAWOOvRtwkGCvzTeQiifdaggw1
	 EBUjMenOap3TyYDd1EgtSGzoUcihHEyBLCol+cfZmmUFGXt34P1i0WT0gT4WogNkFC
	 +WvLWQLccRD66gvfl8TvPiJy3T9cNMFRdYckUh3Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95B76F80315;
	Thu, 17 Sep 2020 16:14:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FA73F80307; Thu, 17 Sep 2020 16:14:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47486F80303
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 16:14:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47486F80303
IronPort-SDR: HZ18TYzNnXHePLPn2f5518jg+IrkbqswKQ6+MHbmoqK3WmGC9F7jN/5wrizyL82sdmO4mSwEbR
 gAeatWqkm05Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="221251238"
X-IronPort-AV: E=Sophos;i="5.76,437,1592895600"; d="scan'208";a="221251238"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 07:14:02 -0700
IronPort-SDR: kDyAtEeYjXTlb8aN9e1gwtIrrHHohAYtCElDOk8OefFJ6NFV3/ePbDPViQfenTfwsPJ7R9HuMT
 oJWfRYphjjGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,437,1592895600"; d="scan'208";a="452318199"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga004.jf.intel.com with ESMTP; 17 Sep 2020 07:13:58 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v6 13/14] ASoC: Intel: bdw-5650: Remove haswell-solution
 specific code
Date: Thu, 17 Sep 2020 16:12:41 +0200
Message-Id: <20200917141242.9081-14-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200917141242.9081-1-cezary.rojewski@intel.com>
References: <20200917141242.9081-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@linux.intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com,
 cujomalainey@chromium.org, krzysztof.hejmowski@intel.com,
 ppapierkowski@habana.ai, vamshi.krishna.gopal@intel.com
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---

No changes since initial version.

 sound/soc/intel/boards/bdw-rt5650.c | 36 -----------------------------
 1 file changed, 36 deletions(-)

diff --git a/sound/soc/intel/boards/bdw-rt5650.c b/sound/soc/intel/boards/bdw-rt5650.c
index 1412a9941ed4..c44315af6a4c 100644
--- a/sound/soc/intel/boards/bdw-rt5650.c
+++ b/sound/soc/intel/boards/bdw-rt5650.c
@@ -16,9 +16,6 @@
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
 
-#include "../common/sst-dsp.h"
-#include "../haswell/sst-haswell-ipc.h"
-
 #include "../../codecs/rt5645.h"
 
 struct bdw_rt5650_priv {
@@ -138,30 +135,6 @@ static struct snd_soc_ops bdw_rt5650_ops = {
 	.hw_params = bdw_rt5650_hw_params,
 };
 
-#if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
-static int bdw_rt5650_rtd_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, DRV_NAME);
-	struct sst_pdata *pdata = dev_get_platdata(component->dev);
-	struct sst_hsw *broadwell = pdata->dsp;
-	int ret;
-
-	/* Set ADSP SSP port settings
-	 * clock_divider = 4 means BCLK = MCLK/5 = 24MHz/5 = 4.8MHz
-	 */
-	ret = sst_hsw_device_set_config(broadwell, SST_HSW_DEVICE_SSP_0,
-		SST_HSW_DEVICE_MCLK_FREQ_24_MHZ,
-		SST_HSW_DEVICE_TDM_CLOCK_MASTER, 4);
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
 	2, 4,
 };
@@ -251,10 +224,8 @@ SND_SOC_DAILINK_DEF(platform,
 SND_SOC_DAILINK_DEF(be,
 	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC5650:00", "rt5645-aif1")));
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
 SND_SOC_DAILINK_DEF(ssp0_port,
 	    DAILINK_COMP_ARRAY(COMP_CPU("ssp0-port")));
-#endif
 
 static struct snd_soc_dai_link bdw_rt5650_dais[] = {
 	/* Front End DAI links */
@@ -263,9 +234,6 @@ static struct snd_soc_dai_link bdw_rt5650_dais[] = {
 		.stream_name = "System Playback",
 		.dynamic = 1,
 		.ops = &bdw_rt5650_fe_ops,
-#if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
-		.init = bdw_rt5650_rtd_init,
-#endif
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST,
 			SND_SOC_DPCM_TRIGGER_POST
@@ -289,11 +257,7 @@ static struct snd_soc_dai_link bdw_rt5650_dais[] = {
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.init = bdw_rt5650_init,
-#if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
-		SND_SOC_DAILINK_REG(dummy, be, dummy),
-#else
 		SND_SOC_DAILINK_REG(ssp0_port, be, platform),
-#endif
 	},
 };
 
-- 
2.17.1

