Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D0719296B
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 14:19:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D2D6167B;
	Wed, 25 Mar 2020 14:18:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D2D6167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585142351;
	bh=KQNNlSBz8DWcYoqMsfxwPITyrzGRNtkeXn/NbqsU9pw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LBQAbBbE4+stDY/NPNMAiKb+i451OzrDmi6znclpfu1ZqEdcDSyQjIEe8fH1g1mxW
	 y8g/5wkZUF7274aOrnJR5W5ja7jTbO1gufJyHrM+2DsgHTntiB6Dj5aVhRcuWrenZr
	 GbuhhL0P+XxCM8xzw0RV7sx/bfFEdS2Cr8hAjsGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0318FF80095;
	Wed, 25 Mar 2020 14:16:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B19A9F801DA; Wed, 25 Mar 2020 14:16:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4268FF8015A
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 14:16:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4268FF8015A
IronPort-SDR: v+u3CABMh20dqjnJrqiKCTDbW6wD5JHwCH1/6HSM4vmj4mCTLm6ayVbsjSSW39UkupvzwMTMxO
 /2z44u6w8w9g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 06:16:38 -0700
IronPort-SDR: N6+oSDfTFWhTsw4eRQ/JQfRIIXkZo8q5dt2wmr5vR4IogoSaR15dGt/kHNayjWcrJn8dipjsLV
 /vITo1v9h9UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; d="scan'208";a="446618815"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 25 Mar 2020 06:16:36 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ASoC: Intel: bdw-rt5650: Revert SSP0 link to use dummy
 components
Date: Wed, 25 Mar 2020 14:16:11 +0100
Message-Id: <20200325131611.545-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325131611.545-1-cezary.rojewski@intel.com>
References: <20200325131611.545-1-cezary.rojewski@intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
 tiwai@suse.com, linux@dominikbrodowski.net,
 pierre-louis.bossart@linux.intel.com
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

Recent series of patches targeting broadwell boards, while enabling
SOF, changed behavior for non-SOF solutions. In essence replacing
platform 'dummy' with actual 'platform' causes redundant stream
initialization to occur during audio start. hw_params for haswell-pcm
destroys initial stream right after its creation - only to recreate it
again from proceed from there.

While harmless so far, this flow isn't right and should be corrected.
The actual need for dummy components for SSP0 link is questionable but
that issue is subject for another series.

Fixes: a40acc6bfceb ("ASoC: Intel: bdw-rt5650: change cpu_dai and platform components for SOF")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/boards/bdw-rt5650.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/bdw-rt5650.c b/sound/soc/intel/boards/bdw-rt5650.c
index 4545dbd48879..fbceea4a66b8 100644
--- a/sound/soc/intel/boards/bdw-rt5650.c
+++ b/sound/soc/intel/boards/bdw-rt5650.c
@@ -226,9 +226,6 @@ SND_SOC_DAILINK_DEF(be,
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
 SND_SOC_DAILINK_DEF(ssp0_port,
 	    DAILINK_COMP_ARRAY(COMP_CPU("ssp0-port")));
-#else
-SND_SOC_DAILINK_DEF(ssp0_port,
-	    DAILINK_COMP_ARRAY(COMP_DUMMY()));
 #endif
 
 static struct snd_soc_dai_link bdw_rt5650_dais[] = {
@@ -263,7 +260,11 @@ static struct snd_soc_dai_link bdw_rt5650_dais[] = {
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.init = bdw_rt5650_init,
+#if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
+		SND_SOC_DAILINK_REG(dummy, be, dummy),
+#else
 		SND_SOC_DAILINK_REG(ssp0_port, be, platform),
+#endif
 	},
 };
 
-- 
2.17.1

