Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4613EFE55
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 09:56:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 382461672;
	Wed, 18 Aug 2021 09:55:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 382461672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629273407;
	bh=UAKX7nj7woubPparkOGHlLcZvLxQqUamey3/j3FmXXw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FbnD9Xi9ZzMRPDeYTmxTgdQxVL0IJxuFVrSrBU5ruULq3Q/8S0UI5vpb2qJWNyw8J
	 YNKy6KIo+QWy4we9x6wpUHvltsot+QITvgdhkQqdOtfvvP+NDoIazw8I1ZEvtM+MeJ
	 JyLiV7gbvyBRIIo2N4jRWZzPH2Ywr3W6k7+ccp3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46F7AF804CA;
	Wed, 18 Aug 2021 09:55:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A96F4F80425; Wed, 18 Aug 2021 09:55:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D0CAF80246
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 09:55:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D0CAF80246
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="195855476"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="195855476"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 00:54:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="676974674"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 18 Aug 2021 00:54:56 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/11] ASoC: Intel: kbl_da7219_max98927: Fix format selection
 for max98373
Date: Wed, 18 Aug 2021 09:57:32 +0200
Message-Id: <20210818075742.1515155-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818075742.1515155-1-cezary.rojewski@intel.com>
References: <20210818075742.1515155-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, jairaj.arava@intel.com,
 upstream@semihalf.com, harshapriya.n@intel.com, cujomalainey@google.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 broonie@kernel.org, jenny.tc@intel.com, lma@semihalf.com,
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

Contrary to what is said in board's file, topology targeting
kbl_da7219_max98373 expects format 16b, not 24/32b. Partially revert
changes added in 'ASoC: Intel: Boards: Add Maxim98373 support' to bring
old behavior back, aligning with topology expectations.

Fixes: 716d53cc7837 ("ASoC: Intel: Boards: Add Maxim98373 support")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/boards/kbl_da7219_max98927.c | 55 +++-----------------
 1 file changed, 7 insertions(+), 48 deletions(-)

diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c b/sound/soc/intel/boards/kbl_da7219_max98927.c
index a31a7a7bbf66..2b43459adc33 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98927.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
@@ -199,7 +199,7 @@ static int kabylake_ssp0_hw_params(struct snd_pcm_substream *substream,
 		}
 		if (!strcmp(codec_dai->component->name, MAX98373_DEV0_NAME)) {
 			ret = snd_soc_dai_set_tdm_slot(codec_dai,
-							0x03, 3, 8, 24);
+							0x30, 3, 8, 16);
 			if (ret < 0) {
 				dev_err(runtime->dev,
 						"DEV0 TDM slot err:%d\n", ret);
@@ -208,10 +208,10 @@ static int kabylake_ssp0_hw_params(struct snd_pcm_substream *substream,
 		}
 		if (!strcmp(codec_dai->component->name, MAX98373_DEV1_NAME)) {
 			ret = snd_soc_dai_set_tdm_slot(codec_dai,
-							0x0C, 3, 8, 24);
+							0xC0, 3, 8, 16);
 			if (ret < 0) {
 				dev_err(runtime->dev,
-						"DEV0 TDM slot err:%d\n", ret);
+						"DEV1 TDM slot err:%d\n", ret);
 				return ret;
 			}
 		}
@@ -311,24 +311,6 @@ static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
 	 * The above 2 loops are mutually exclusive based on the stream direction,
 	 * thus rtd_dpcm variable will never be overwritten
 	 */
-	/*
-	 * Topology for kblda7219m98373 & kblmax98373 supports only S24_LE,
-	 * where as kblda7219m98927 & kblmax98927 supports S16_LE by default.
-	 * Skipping the port wise FE and BE configuration for kblda7219m98373 &
-	 * kblmax98373 as the topology (FE & BE) supports S24_LE only.
-	 */
-
-	if (!strcmp(rtd->card->name, "kblda7219m98373") ||
-		!strcmp(rtd->card->name, "kblmax98373")) {
-		/* The ADSP will convert the FE rate to 48k, stereo */
-		rate->min = rate->max = 48000;
-		chan->min = chan->max = DUAL_CHANNEL;
-
-		/* set SSP to 24 bit */
-		snd_mask_none(fmt);
-		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
-		return 0;
-	}
 
 	/*
 	 * The ADSP will convert the FE rate to 48k, stereo, 24 bit
@@ -479,31 +461,20 @@ static struct snd_pcm_hw_constraint_list constraints_channels_quad = {
 static int kbl_fe_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *soc_rt = asoc_substream_to_rtd(substream);
 
 	/*
 	 * On this platform for PCM device we support,
 	 * 48Khz
 	 * stereo
+	 * 16 bit audio
 	 */
 
 	runtime->hw.channels_max = DUAL_CHANNEL;
 	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 					   &constraints_channels);
-	/*
-	 * Setup S24_LE (32 bit container and 24 bit valid data) for
-	 * kblda7219m98373 & kblmax98373. For kblda7219m98927 &
-	 * kblmax98927 keeping it as 16/16 due to topology FW dependency.
-	 */
-	if (!strcmp(soc_rt->card->name, "kblda7219m98373") ||
-		!strcmp(soc_rt->card->name, "kblmax98373")) {
-		runtime->hw.formats = SNDRV_PCM_FMTBIT_S24_LE;
-		snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
-
-	} else {
-		runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
-		snd_pcm_hw_constraint_msbits(runtime, 0, 16, 16);
-	}
+
+	runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
+	snd_pcm_hw_constraint_msbits(runtime, 0, 16, 16);
 
 	snd_pcm_hw_constraint_list(runtime, 0,
 				SNDRV_PCM_HW_PARAM_RATE, &constraints_rates);
@@ -536,23 +507,11 @@ static int kabylake_dmic_fixup(struct snd_soc_pcm_runtime *rtd,
 static int kabylake_dmic_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *soc_rt = asoc_substream_to_rtd(substream);
 
 	runtime->hw.channels_min = runtime->hw.channels_max = QUAD_CHANNEL;
 	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 			&constraints_channels_quad);
 
-	/*
-	 * Topology for kblda7219m98373 & kblmax98373 supports only S24_LE.
-	 * The DMIC also configured for S24_LE. Forcing the DMIC format to
-	 * S24_LE due to the topology FW dependency.
-	 */
-	if (!strcmp(soc_rt->card->name, "kblda7219m98373") ||
-		!strcmp(soc_rt->card->name, "kblmax98373")) {
-		runtime->hw.formats = SNDRV_PCM_FMTBIT_S24_LE;
-		snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
-	}
-
 	return snd_pcm_hw_constraint_list(substream->runtime, 0,
 			SNDRV_PCM_HW_PARAM_RATE, &constraints_rates);
 }
-- 
2.25.1

