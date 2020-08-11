Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3F0241DF6
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 18:15:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79A2C83D;
	Tue, 11 Aug 2020 18:14:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79A2C83D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597162534;
	bh=jhqBLr20k5k5w5IEB79z3lCaWtkZ++9so3lTFaejjI0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O9nIS23hBOFD27r/aSbHchCBW0Tt2QWIupF0RLRv2mw362nrsemU4+3I/DZhEQi8c
	 fNXkU2CQnLLJ4/Cva3wriNQx5Iezzi6qJyo87FgNLUmfcf1Y3xbB5ZBNqCpKKoMh16
	 F6DIVgH3hoEZdf+bAA4q9MlWZLK3oPY1j/5wrwiI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4367BF80347;
	Tue, 11 Aug 2020 18:07:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42236F80342; Tue, 11 Aug 2020 18:07:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0ECAF80315
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 18:07:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0ECAF80315
IronPort-SDR: U6J5xbV+vFOGTgxj1O7OcJd2DGGCOqDF9j35O5Gn+XRgrGbXXguu3/hL4RM4tlWysIssZam2L7
 84Q8fX9BF7TA==
X-IronPort-AV: E=McAfee;i="6000,8403,9710"; a="153734074"
X-IronPort-AV: E=Sophos;i="5.76,300,1592895600"; d="scan'208";a="153734074"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2020 09:07:16 -0700
IronPort-SDR: WPbFrts5yVTnjR0DLOMxTlKDoUIbnRGRN0gKueAn17QosS8aGaIdipZ95hUc90ZY+B1qrmsOq2
 qRZVv4qqCRUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,300,1592895600"; d="scan'208";a="317777836"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 11 Aug 2020 09:07:12 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 11/13] ASoC: Intel: broadwell: Remove haswell-solution
 specific code
Date: Tue, 11 Aug 2020 18:06:08 +0200
Message-Id: <20200811160610.32735-12-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200811160610.32735-1-cezary.rojewski@intel.com>
References: <20200811160610.32735-1-cezary.rojewski@intel.com>
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
 sound/soc/intel/boards/broadwell.c | 33 ------------------------------
 1 file changed, 33 deletions(-)

diff --git a/sound/soc/intel/boards/broadwell.c b/sound/soc/intel/boards/broadwell.c
index f6399077d291..ea2818f27105 100644
--- a/sound/soc/intel/boards/broadwell.c
+++ b/sound/soc/intel/boards/broadwell.c
@@ -14,9 +14,6 @@
 #include <sound/pcm_params.h>
 #include <sound/soc-acpi.h>
 
-#include "../common/sst-dsp.h"
-#include "../haswell/sst-haswell-ipc.h"
-
 #include "../../codecs/rt286.h"
 
 static struct snd_soc_jack broadwell_headset;
@@ -122,27 +119,6 @@ static const struct snd_soc_ops broadwell_rt286_ops = {
 	.hw_params = broadwell_rt286_hw_params,
 };
 
-#if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
-static int broadwell_rtd_init(struct snd_soc_pcm_runtime *rtd)
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
@@ -189,10 +165,8 @@ SND_SOC_DAILINK_DEF(platform,
 SND_SOC_DAILINK_DEF(codec,
 	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-INT343A:00", "rt286-aif1")));
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
 SND_SOC_DAILINK_DEF(ssp0_port,
 	    DAILINK_COMP_ARRAY(COMP_CPU("ssp0-port")));
-#endif
 
 /* broadwell digital audio interface glue - connects codec <--> CPU */
 static struct snd_soc_dai_link broadwell_rt286_dais[] = {
@@ -201,9 +175,6 @@ static struct snd_soc_dai_link broadwell_rt286_dais[] = {
 		.name = "System PCM",
 		.stream_name = "System Playback/Capture",
 		.dynamic = 1,
-#if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
-		.init = broadwell_rtd_init,
-#endif
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.ops = &broadwell_fe_ops,
 		.dpcm_playback = 1,
@@ -248,11 +219,7 @@ static struct snd_soc_dai_link broadwell_rt286_dais[] = {
 		.ops = &broadwell_rt286_ops,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
-#if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
-		SND_SOC_DAILINK_REG(dummy, codec, dummy),
-#else
 		SND_SOC_DAILINK_REG(ssp0_port, codec, platform),
-#endif
 	},
 };
 
-- 
2.17.1

