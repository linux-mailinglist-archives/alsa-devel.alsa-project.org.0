Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC77126DDD6
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 16:18:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EC401694;
	Thu, 17 Sep 2020 16:17:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EC401694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600352289;
	bh=WaO5P2stU2cnjh7a4E/IbyN5yPKCR8s80+czcxNVdcA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=goSY0ANWOWw+0TVnouh1tamIdMjADT2F2DLWXalIZfAJ7mnNJOQcYSfm0xcpVNiZA
	 BDVRJ8mtvjk+vW2ntHg7Xoj65sbUBQp8mIyZRf0HQCD7l2SXTDrMu/gzzktU3HrRmM
	 za59SkjFLHQPW4Iych2aPx7gJKfOEwJF+2AjaC1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A3DAF80306;
	Thu, 17 Sep 2020 16:14:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9B7EF80304; Thu, 17 Sep 2020 16:14:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF9EAF802E9
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 16:13:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF9EAF802E9
IronPort-SDR: 7nq/tfniX7qqC7xr+oH1wrlXdB6QdtoXTCBlfYJydR1rhwjdg/BAzJTOFWN1WD6Nj5x+UVuqpo
 oezL4vaeI5cw==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="221251224"
X-IronPort-AV: E=Sophos;i="5.76,437,1592895600"; d="scan'208";a="221251224"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 07:13:54 -0700
IronPort-SDR: IcDs28eHRka69Erx6y1yp1Igs+JK3jwzJtKzly1AD2MaB1mfXi2FgRIrbEL6pIKUgoaKgxpbnZ
 nwsCiDrpVORQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,437,1592895600"; d="scan'208";a="452318146"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga004.jf.intel.com with ESMTP; 17 Sep 2020 07:13:50 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v6 11/14] ASoC: Intel: haswell: Remove haswell-solution
 specific code
Date: Thu, 17 Sep 2020 16:12:39 +0200
Message-Id: <20200917141242.9081-12-cezary.rojewski@intel.com>
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

 sound/soc/intel/boards/haswell.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/sound/soc/intel/boards/haswell.c b/sound/soc/intel/boards/haswell.c
index 744b7b5b8106..c268405e5594 100644
--- a/sound/soc/intel/boards/haswell.c
+++ b/sound/soc/intel/boards/haswell.c
@@ -13,9 +13,6 @@
 #include <sound/soc-acpi.h>
 #include <sound/pcm_params.h>
 
-#include "../common/sst-dsp.h"
-#include "../haswell/sst-haswell-ipc.h"
-
 #include "../../codecs/rt5640.h"
 
 /* Haswell ULT platforms have a Headphone and Mic jack */
@@ -77,25 +74,6 @@ static const struct snd_soc_ops haswell_rt5640_ops = {
 	.hw_params = haswell_rt5640_hw_params,
 };
 
-static int haswell_rtd_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
-	struct sst_pdata *pdata = dev_get_platdata(component->dev);
-	struct sst_hsw *haswell = pdata->dsp;
-	int ret;
-
-	/* Set ADSP SSP port settings */
-	ret = sst_hsw_device_set_config(haswell, SST_HSW_DEVICE_SSP_0,
-		SST_HSW_DEVICE_MCLK_FREQ_24_MHZ,
-		SST_HSW_DEVICE_CLOCK_MASTER, 9);
-	if (ret < 0) {
-		dev_err(rtd->dev, "failed to set device config\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 SND_SOC_DAILINK_DEF(dummy,
 	DAILINK_COMP_ARRAY(COMP_DUMMY()));
 
@@ -117,13 +95,15 @@ SND_SOC_DAILINK_DEF(codec,
 SND_SOC_DAILINK_DEF(platform,
 	DAILINK_COMP_ARRAY(COMP_PLATFORM("haswell-pcm-audio")));
 
+SND_SOC_DAILINK_DEF(ssp0_port,
+	    DAILINK_COMP_ARRAY(COMP_CPU("ssp0-port")));
+
 static struct snd_soc_dai_link haswell_rt5640_dais[] = {
 	/* Front End DAI links */
 	{
 		.name = "System",
 		.stream_name = "System Playback/Capture",
 		.dynamic = 1,
-		.init = haswell_rtd_init,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
@@ -167,7 +147,7 @@ static struct snd_soc_dai_link haswell_rt5640_dais[] = {
 		.ops = &haswell_rt5640_ops,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
-		SND_SOC_DAILINK_REG(dummy, codec, dummy),
+		SND_SOC_DAILINK_REG(ssp0_port, codec, platform),
 	},
 };
 
-- 
2.17.1

