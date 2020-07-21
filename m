Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B23DC228A5D
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 23:09:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C69D1662;
	Tue, 21 Jul 2020 23:08:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C69D1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595365771;
	bh=d0xPyR/ydHTQwVoRTL0+7cAsSJr5OLQg3Uq88NZDKx4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IWjxnr9gpK7gALAFISShNagmuogwGJPMwBBkHWxBW//QlUpzeS0VOfckV72Xldzkh
	 Y2jqEoLophknqWruj0gYC6sOMm/Koh5rgkiMM95JhZ3rpLS7c+cbTEmxSbq/rFMOnL
	 cd5dmHgVSKnC1ERD/eiTDMW8wFGD2irHD89ylANk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5464AF8024A;
	Tue, 21 Jul 2020 23:07:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E406F8024A; Tue, 21 Jul 2020 23:07:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4AD0F80117
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 23:07:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4AD0F80117
IronPort-SDR: +oXTDkSUjlwY1OvKhN2G8lr/YrxHMxZI0kEtmX8UoxCsDHmaGs99llekRwMwNurtWwh0W2JgYU
 t184rYSMuX+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="129799767"
X-IronPort-AV: E=Sophos;i="5.75,380,1589266800"; d="scan'208";a="129799767"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 14:07:36 -0700
IronPort-SDR: xfiJ9NNJ4KGguu1iWyDcO576Ka4bjPrUvFlOQGqJSMEBEWg/5exeu91oTouiAq4N3bNDx/yM0L
 NUjgCdoyY2Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,380,1589266800"; d="scan'208";a="310380758"
Received: from joycetoh-desk.sc.intel.com ([172.25.206.187])
 by fmsmga004.fm.intel.com with ESMTP; 21 Jul 2020 14:07:36 -0700
From: Harsha Priya <harshapriya.n@intel.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH v7] ASoC: Intel: kbl_rt5663_rt5514_max98927: Fix
 kabylake_ssp_fixup function
Date: Tue, 21 Jul 2020 14:07:29 -0700
Message-Id: <1595365649-8019-1-git-send-email-harshapriya.n@intel.com>
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
v6 -> v7:
- Updated comments
- initilize rtd_dpcm variable
- added break statement in the loop

---
---
 .../intel/boards/kbl_rt5663_rt5514_max98927.c | 38 ++++++++++++++-----
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
index 584e4f9cedc2..9f4b949cc39c 100644
--- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
@@ -379,22 +379,42 @@ static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
 	struct snd_interval *chan = hw_param_interval(params,
 			SNDRV_PCM_HW_PARAM_CHANNELS);
 	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
-	struct snd_soc_dpcm *dpcm = container_of(
-			params, struct snd_soc_dpcm, hw_params);
-	struct snd_soc_dai_link *fe_dai_link = dpcm->fe->dai_link;
-	struct snd_soc_dai_link *be_dai_link = dpcm->be->dai_link;
+	struct snd_soc_dpcm *dpcm, *rtd_dpcm = NULL;
+
+	/*
+	 * The following loop will be called only for playback stream
+	 * In this platform, there is only one playback device on every SSP
+	 */
+	for_each_dpcm_fe(rtd, SNDRV_PCM_STREAM_PLAYBACK, dpcm) {
+		rtd_dpcm = dpcm;
+		break;
+	}
+
+	/*
+	 * This following loop will be called only for capture stream
+	 * In this platform, there is only one capture device on every SSP
+	 */
+	for_each_dpcm_fe(rtd, SNDRV_PCM_STREAM_CAPTURE, dpcm) {
+		rtd_dpcm = dpcm;
+		break;
+	}
+
+	/*
+	 * The above 2 loops are mutually exclusive based on the strem direction,
+	 * thus rtd_dpcm variable will never be overwritten
+	 */
 
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
@@ -405,7 +425,7 @@ static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
 	 * The speaker on the SSP0 supports S16_LE and not S24_LE.
 	 * thus changing the mask here
 	 */
-	if (!strcmp(be_dai_link->name, "SSP0-Codec"))
+	if (!strcmp(rtd_dpcm->be->dai_link->name, "SSP0-Codec"))
 		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
 
 	return 0;
-- 
2.17.1

