Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B43F131E9DD
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Feb 2021 13:34:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49C04166F;
	Thu, 18 Feb 2021 13:33:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49C04166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613651664;
	bh=MijjuBs6/+CkMDOTXX2/4aaZBXzeX8MyibLd3PESfi0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u5ADTTS7g7pwvPHByIYyFuCF5OUdp9XLATtzfsGfJOiTZ/84BNxls2NF0JcL08BLx
	 xsiav60zJ3RJMrgS5URTgBvSLecB6HyBvRg7nX+D2r0HRWG37zkniD1sHUszL5xMys
	 Sf0OmHM3TjA2646w94oIchK041COuWCwHA6DeRE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EDD8F802A9;
	Thu, 18 Feb 2021 13:32:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74E87F80274; Thu, 18 Feb 2021 13:32:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C5ABF8015A
 for <alsa-devel@alsa-project.org>; Thu, 18 Feb 2021 13:31:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C5ABF8015A
IronPort-SDR: 5lm29FsGYRUH2nCsWvzhmRoCfbZtM/24TE57tTj2zmHrn0CjHRBVwSTbOsu+w76j/fwMJpxiFY
 Y573ffULJyOw==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="163264986"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="163264986"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 04:31:52 -0800
IronPort-SDR: JASdCYefBoISByXmV8hKQe/EdID6gB0lNKdpFeKo3IAPV0At5uNnJoI5mvndJraY43ORXEcsJM
 sho13oX/R+CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="364821601"
Received: from snappy-s2600wt2r.iind.intel.com ([10.223.163.26])
 by orsmga006.jf.intel.com with ESMTP; 18 Feb 2021 04:31:50 -0800
From: vamshi.krishna.gopal@intel.com
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: Intel: kbl: update dmic fixup params
Date: Thu, 18 Feb 2021 18:01:25 +0530
Message-Id: <20210218123125.15438-3-vamshi.krishna.gopal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210218123125.15438-1-vamshi.krishna.gopal@intel.com>
References: <20210218123125.15438-1-vamshi.krishna.gopal@intel.com>
Cc: harshapriya.n@intel.com, naveen.m@intel.com, biernacki@google.com,
 sathya.prakash.m.r@intel.com
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

From: Naveen Manohar <naveen.m@intel.com>

Update dmic fixup params to always expose QUAD channel capture
device, enabling User-space to control channel count.
Assign min and max channel only based on input hw_params.

Signed-off-by: Naveen Manohar <naveen.m@intel.com>
Acked-by: Vinod Koul <vinod.koul@intel.com>
Signed-off-by: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
---
 sound/soc/intel/boards/kbl_rt5663_max98927.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/kbl_rt5663_max98927.c b/sound/soc/intel/boards/kbl_rt5663_max98927.c
index adfa2c044aed..a1bcde7851b7 100644
--- a/sound/soc/intel/boards/kbl_rt5663_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_max98927.c
@@ -29,9 +29,9 @@
 #define DMIC_CH(p) p->list[p->count-1]
 #define MAXIM_DEV0_NAME "i2c-MX98927:00"
 #define MAXIM_DEV1_NAME "i2c-MX98927:01"
+#define QUAD_CHANNEL 4
 
 static struct snd_soc_card *kabylake_audio_card;
-static const struct snd_pcm_hw_constraint_list *dmic_constraints;
 static struct snd_soc_jack skylake_hdmi[3];
 
 struct kbl_hdmi_pcm {
@@ -365,6 +365,16 @@ static const struct snd_pcm_hw_constraint_list constraints_channels = {
 	.mask = 0,
 };
 
+static const unsigned int channels_quad[] = {
+	QUAD_CHANNEL,
+};
+
+static const struct snd_pcm_hw_constraint_list constraints_channels_quad = {
+	.count = ARRAY_SIZE(channels_quad),
+	.list = channels_quad,
+	.mask = 0,
+};
+
 static int kbl_fe_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -480,7 +490,7 @@ static int kabylake_dmic_fixup(struct snd_soc_pcm_runtime *rtd,
 	struct snd_interval *chan = hw_param_interval(params,
 				SNDRV_PCM_HW_PARAM_CHANNELS);
 
-	if (params_channels(params) == 2 || DMIC_CH(dmic_constraints) == 2)
+	if (params_channels(params) == 2)
 		chan->min = chan->max = 2;
 	else
 		chan->min = chan->max = 4;
@@ -528,9 +538,9 @@ static int kabylake_dmic_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
-	runtime->hw.channels_max = DMIC_CH(dmic_constraints);
+	runtime->hw.channels_min = runtime->hw.channels_max = QUAD_CHANNEL;
 	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
-			dmic_constraints);
+			&constraints_channels_quad);
 
 	return snd_pcm_hw_constraint_list(substream->runtime, 0,
 			SNDRV_PCM_HW_PARAM_RATE, &constraints_rates);
-- 
2.17.1

