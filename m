Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 681C827D0F7
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Sep 2020 16:22:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DE3517C1;
	Tue, 29 Sep 2020 16:21:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DE3517C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601389334;
	bh=PecAKC6b4ISZuISCpI47SXILjMSAchREsntYK/RpfT4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h6GNRmw40IYfW0Hz09vGoN2E3O79yQIzqmbi1yh0Dyf/80lvqHBlgdIgo3pANEvNw
	 WOkyXx5asSZ4ibBwtexfiNqj8zlC/xgOVx+Kv3YVVQ1xClCRiO+pVC/rAPwJOdfR+i
	 B8evdD9GrEZ5sTdtmKQs7WWyq4Yamflm1sRRlZ24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04F6AF8034F;
	Tue, 29 Sep 2020 16:14:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A103F8033F; Tue, 29 Sep 2020 16:14:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB850F80337
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 16:14:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB850F80337
IronPort-SDR: xsMveeYMqOvzK469r5VCSJ7X9ktcRUCbtTtmjLrPumD+8Di7StfzZOML1EOtvNhcd4nIbcfIu5
 tCUnPodtjskw==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="223788244"
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="223788244"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 07:13:57 -0700
IronPort-SDR: OtN0GZDldn/+m65maSnVrysNo4tzaCgqpOxD2D7Z+9ujdTkZq0eR91o0Z/Sv34kyVOMZg3bGc1
 dcabH+XYMzFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="457294516"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga004.jf.intel.com with ESMTP; 29 Sep 2020 07:13:49 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v10 11/14] ASoC: Intel: broadwell: Remove haswell-solution
 specific code
Date: Tue, 29 Sep 2020 16:12:44 +0200
Message-Id: <20200929141247.8058-12-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929141247.8058-1-cezary.rojewski@intel.com>
References: <20200929141247.8058-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@linux.intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com,
 gregkh@linuxfoundation.org, marcin.barlik@intel.com, zwisler@google.com,
 lgirdwood@gmail.com, tiwai@suse.com, filip.proborszcz@intel.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 michal.wasko@intel.com, cujomalainey@chromium.org,
 krzysztof.hejmowski@intel.com, ppapierkowski@habana.ai,
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---

No changes since initial version.

 sound/soc/intel/boards/broadwell.c | 33 ------------------------------
 1 file changed, 33 deletions(-)

diff --git a/sound/soc/intel/boards/broadwell.c b/sound/soc/intel/boards/broadwell.c
index 56972af13b6f..648b47190051 100644
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

