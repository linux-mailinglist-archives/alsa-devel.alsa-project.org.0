Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 928F0609FCF
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 13:09:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 379857B7B;
	Mon, 24 Oct 2022 13:08:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 379857B7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666609774;
	bh=6vA90svX/CtocyPjbFjYoAGHyRDf1RMA89t4Qrwqg+U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AwtzgKBOQErE1ncV87+OKlrOPlyflGgiFnGa4fPpQ6UweZWwEN0JW4Ij/SrWu6++E
	 2lLxiKhi3S4Rb/8Nnp9JsqQlUC6txLIiehrLnFQCfityERDqq8v+tASsXjLhoxGlYA
	 qCWFSnuosB7/WHNbzDOSp9LcTCrURHwWyRBt8n8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64DC4F80551;
	Mon, 24 Oct 2022 13:08:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52774F80552; Mon, 24 Oct 2022 13:08:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E61F5F80506
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 13:08:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E61F5F80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="eTI2fJpv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666609693; x=1698145693;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6vA90svX/CtocyPjbFjYoAGHyRDf1RMA89t4Qrwqg+U=;
 b=eTI2fJpvns132h2IFQMLaY6Sl2vP4GHvbW/x6dBgYnmj2fiePMupKu5p
 6OEjuMLJV/LYtYEbiTwDQBlor3E3VqIlTXNlFlYgDt2zlC0WFoIUByPPO
 ejYMM1wDPlfG/F4bcJvvFpIvjOsiwwE0Z+xD2Vd5SHEVC0fIQ20LDHEKM
 U3GQpDZo4KMsYpyqxYWUWCSfI1hjE04j29H0JvewNfLBLrzvTIuZG9ar4
 wNdeEw8gpsgoZWtXeO5XpbZablQiIWZkEZ8mTRyuzjVaY0+fY2cJkyuXh
 u0MU11Kwv5o94VE89kUxhsIqB95jGm9q0lr3aCKl0WNTblg4n8g31ZOqg g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="369457561"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="369457561"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 04:08:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="633673432"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="633673432"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga007.fm.intel.com with ESMTP; 24 Oct 2022 04:08:07 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: Intel: avs: boards: Fix typo in comments
Date: Mon, 24 Oct 2022 21:08:41 +0200
Message-Id: <20221024190841.31572-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221024190841.31572-1-amadeuszx.slawinski@linux.intel.com>
References: <20221024190841.31572-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

It keeps propagating through machine boards, fix it once and for all.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/max98373.c | 2 +-
 sound/soc/intel/avs/boards/max98927.c | 2 +-
 sound/soc/intel/avs/boards/ssm4567.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/boards/max98373.c b/sound/soc/intel/avs/boards/max98373.c
index 0fa8f5606385..8e221ecd34b0 100644
--- a/sound/soc/intel/avs/boards/max98373.c
+++ b/sound/soc/intel/avs/boards/max98373.c
@@ -53,7 +53,7 @@ avs_max98373_be_fixup(struct snd_soc_pcm_runtime *runrime, struct snd_pcm_hw_par
 	channels = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
 	fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 
-	/* The ADSP will covert the FE rate to 48k, stereo */
+	/* The ADSP will convert the FE rate to 48k, stereo */
 	rate->min = rate->max = 48000;
 	channels->min = channels->max = 2;
 
diff --git a/sound/soc/intel/avs/boards/max98927.c b/sound/soc/intel/avs/boards/max98927.c
index 35c4f8f55035..7cccce99f92e 100644
--- a/sound/soc/intel/avs/boards/max98927.c
+++ b/sound/soc/intel/avs/boards/max98927.c
@@ -53,7 +53,7 @@ avs_max98927_be_fixup(struct snd_soc_pcm_runtime *runrime, struct snd_pcm_hw_par
 	channels = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
 	fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 
-	/* The ADSP will covert the FE rate to 48k, stereo */
+	/* The ADSP will convert the FE rate to 48k, stereo */
 	rate->min = rate->max = 48000;
 	channels->min = channels->max = 2;
 
diff --git a/sound/soc/intel/avs/boards/ssm4567.c b/sound/soc/intel/avs/boards/ssm4567.c
index 9f84c8ab3447..c5db69612762 100644
--- a/sound/soc/intel/avs/boards/ssm4567.c
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -103,7 +103,7 @@ avs_ssm4567_be_fixup(struct snd_soc_pcm_runtime *runrime, struct snd_pcm_hw_para
 	channels = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
 	fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 
-	/* The ADSP will covert the FE rate to 48k, stereo */
+	/* The ADSP will convert the FE rate to 48k, stereo */
 	rate->min = rate->max = 48000;
 	channels->min = channels->max = 2;
 
-- 
2.25.1

