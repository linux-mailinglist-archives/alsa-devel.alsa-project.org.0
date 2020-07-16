Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A53C52228C7
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 19:16:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40C671660;
	Thu, 16 Jul 2020 19:15:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40C671660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594919761;
	bh=4lyoQPXsDqos+4BPtgy2qqY6GjpVpGeOF8pV6xNAF2M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VlrIpmSa010Nkw+jN99re/WYzyjINIFqSmYdWuKSLQjau5MTQJuL0GSYMcb+fsLNs
	 nYpd2w35vzAlEt152TrjeLGlribGsuMNZCWM5lZb1gBugCD/uWLtgZ3yZIyifljHQ1
	 XoxREzc+qmXkMotvXn0aX/qTVvx08YcLqwEwtT54=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64213F8014E;
	Thu, 16 Jul 2020 19:14:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BF5CF801EC; Thu, 16 Jul 2020 19:14:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5D95F80110
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 19:14:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5D95F80110
IronPort-SDR: H02jpG8rzczmCfPOa3l+v0FmWFGsL3thRRtmFarYqmGdzgFxD7Tk7U5U/XuuiXkOZHzHokt8u2
 agc3OXe8kpGg==
X-IronPort-AV: E=McAfee;i="6000,8403,9684"; a="149431762"
X-IronPort-AV: E=Sophos;i="5.75,360,1589266800"; d="scan'208";a="149431762"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2020 10:14:07 -0700
IronPort-SDR: 6R0t2Qz3xSDnnYjKm0gNGfTjzRigT680d016xG8ijHFG4kqpS3pVSpC4YV+DWV4U1Pt2CT/GuN
 Ad4BlzF4EQGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,360,1589266800"; d="scan'208";a="308707428"
Received: from joycetoh-desk.sc.intel.com ([172.25.206.187])
 by fmsmga004.fm.intel.com with ESMTP; 16 Jul 2020 10:14:06 -0700
From: Harsha Priya <harshapriya.n@intel.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH v6] ASoC: Intel: kbl_rt5663_rt5514_max98927: Fix
 kabylake_ssp_fixup function
Date: Thu, 16 Jul 2020 10:13:57 -0700
Message-Id: <1594919637-31460-1-git-send-email-harshapriya.n@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: Harsha Priya <harshapriya.n@intel.com>, yang.jie@linux.intel.com,
 rad@semihalf.com, zwisler@google.com, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 sathya.prakash.m.r@intel.com, brndt@google.com, mw@semihalf.com,
 levinale@chromium.org, lma@semihalf.com
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

From: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>

kabylake_ssp_fixup function uses snd_soc_dpcm to identify the codecs DAIs.
The hw parameters are changed based on the codec DAI,
the stream is intended for. The earlier approach to get
snd_soc_dpcm was using container_of() macro on snd_pcm_hw_params.
The structures have been modified over time and snd_soc_dpcm does 
not have snd_pcm_hw_params as a reference but as a copy.
This causes the current driver to crash when used.
This patch changes the way snd_soc_dpcm is extracted.
The snd_soc_pcm_runtime holds 2 dpcm
instances (one for playback and one for capture).
The 2 codecs on this SSP are dmic and speakers.
One is for capture and one is for playback respectively.
Based on the direction of the stream,
the snd_soc_dpcm is extracted from the snd_soc_pcm_runtime structure.
Tested for all use cases of the driver.

Signed-off-by: Harsha Priya <harshapriya.n@intel.com>
Signed-off-by: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
Tested-by: Lukasz Majczak <lma@semihalf.com>
---
v1 -> v2:
- Extract dmic from SSP0 as every BE should have own fixup function.
v2 -> v3:
- Restore naming in the dapm route table to not confuse with other
drivers
- Fixed indentations
v3 -> v4:
- Updated code and commit description according to
solution proposed by Harsha
v4 -> v5:
- Cosmetic Changes
v5 -> v6:
- Dmic regression seen with v4 fixed 
- Using available routines for obtaining dpcm information
---
---
 .../intel/boards/kbl_rt5663_rt5514_max98927.c | 26 ++++++++++++-------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
index 584e4f9cedc2..b261b1c466a8 100644
--- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
@@ -379,22 +379,30 @@ static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
 	struct snd_interval *chan = hw_param_interval(params,
 			SNDRV_PCM_HW_PARAM_CHANNELS);
 	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
-	struct snd_soc_dpcm *dpcm = container_of(
-			params, struct snd_soc_dpcm, hw_params);
-	struct snd_soc_dai_link *fe_dai_link = dpcm->fe->dai_link;
-	struct snd_soc_dai_link *be_dai_link = dpcm->be->dai_link;
+	struct snd_soc_dpcm *dpcm, *rtd_dpcm;
+
+	/*
+	 * This macro will be called for playback stream
+	 */
+	for_each_dpcm_fe(rtd, SNDRV_PCM_STREAM_PLAYBACK, dpcm)
+		rtd_dpcm = dpcm;
+	/*
+	 * This macro will be called for capture stream
+	 */
+	for_each_dpcm_fe(rtd, SNDRV_PCM_STREAM_CAPTURE, dpcm)
+		rtd_dpcm = dpcm;
 
 	/*
 	 * The ADSP will convert the FE rate to 48k, stereo, 24 bit
 	 */
-	if (!strcmp(fe_dai_link->name, "Kbl Audio Port") ||
-	    !strcmp(fe_dai_link->name, "Kbl Audio Headset Playback") ||
-	    !strcmp(fe_dai_link->name, "Kbl Audio Capture Port")) {
+	if (!strcmp(rtd_dpcm->fe->dai_link->name, "Kbl Audio Port") ||
+	    !strcmp(rtd_dpcm->fe->dai_link->name, "Kbl Audio Headset Playback") ||
+	    !strcmp(rtd_dpcm->fe->dai_link->name, "Kbl Audio Capture Port")) {
 		rate->min = rate->max = 48000;
 		chan->min = chan->max = 2;
 		snd_mask_none(fmt);
 		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
-	} else if (!strcmp(fe_dai_link->name, "Kbl Audio DMIC cap")) {
+	} else if (!strcmp(rtd_dpcm->fe->dai_link->name, "Kbl Audio DMIC cap")) {
 		if (params_channels(params) == 2 ||
 				DMIC_CH(dmic_constraints) == 2)
 			chan->min = chan->max = 2;
@@ -405,7 +413,7 @@ static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
 	 * The speaker on the SSP0 supports S16_LE and not S24_LE.
 	 * thus changing the mask here
 	 */
-	if (!strcmp(be_dai_link->name, "SSP0-Codec"))
+	if (!strcmp(rtd_dpcm->be->dai_link->name, "SSP0-Codec"))
 		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
 
 	return 0;
-- 
2.17.1

