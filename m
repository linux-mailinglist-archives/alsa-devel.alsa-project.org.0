Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 089FA241972
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 12:11:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0B071662;
	Tue, 11 Aug 2020 12:10:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0B071662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597140669;
	bh=pUp2qjTBHdwSr7Cis4uwxJJj8R/M1wbYJ2trqO2DMDc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kpr3UUwSRGVmV1EFj7+4FVGdxKQqeufN6cq+LK4OR1JMirz4pQ9CK09cmaoEIENcX
	 WmAK7TiTSzyzc7uz+K7m+oSzMofY7gma1hi7zDVUvoFJk1ZFi28mJ0ueKYW+hPbHZF
	 VEjlAHMJM9aDZpAbhmNOvSQeNfV8/AiXCfhfZeMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34AEEF80368;
	Tue, 11 Aug 2020 12:01:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B44EEF80367; Tue, 11 Aug 2020 12:01:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DE66F8034A
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 12:01:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DE66F8034A
IronPort-SDR: AI7rgeTlSX4E65Bu+L2moThAlFrbcJVf6brnEOY8sz1OeBkEHRC0pB3ChKLHGOBQrNWtKA2ocN
 tagtQU9fivhg==
X-IronPort-AV: E=McAfee;i="6000,8403,9709"; a="152924870"
X-IronPort-AV: E=Sophos;i="5.75,460,1589266800"; d="scan'208";a="152924870"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2020 03:01:38 -0700
IronPort-SDR: AOpw/xkX8PfApZsWn+2ER27L+oRjPzc5FlA0lZPJaTC92ScrZX9nR9NLaEF538FRj8VinB4N17
 MroTPPJloBfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,460,1589266800"; d="scan'208";a="494625415"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 11 Aug 2020 03:01:34 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 13/13] ASoC: Intel: bdw-5677: Remove haswell-solution
 specific code
Date: Tue, 11 Aug 2020 12:00:34 +0200
Message-Id: <20200811100034.6875-14-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200811100034.6875-1-cezary.rojewski@intel.com>
References: <20200811100034.6875-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@intel.com,
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

