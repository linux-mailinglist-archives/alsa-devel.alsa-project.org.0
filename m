Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36269609FD2
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 13:09:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D78497B41;
	Mon, 24 Oct 2022 13:09:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D78497B41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666609793;
	bh=tJ1qcTpN3sGmaz2aSYl4PnFrJQbQm5Ryiu1sEd2BMOk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BvxPTSjJCR5czZRVYsIJcX+ljrkVYoYFepAJLhzcnk98TxZhKjn2WlU4YUoHp40QL
	 9XmI7PEilAcTUpwQyV8DYvuwje0BCTfUVMZBl3N/2PmkkCCu5HgmsurgyNW4Fd5zfm
	 QeQI5exJ3cL/Kt61VqNYn5KGzeW6xcaRw1R7iKac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2A5FF80552;
	Mon, 24 Oct 2022 13:08:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57742F8052F; Mon, 24 Oct 2022 13:08:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DB95F8052F
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 13:08:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DB95F8052F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="T8RvIMg8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666609692; x=1698145692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tJ1qcTpN3sGmaz2aSYl4PnFrJQbQm5Ryiu1sEd2BMOk=;
 b=T8RvIMg8TA7l9F8aLHk9fZOtDMKMlc3rfaUi4F1aSy8EUzkqeKa0Q7DA
 /e4gfbJD4IGj4pNOP+izL1QlNmllvqkKibsmqHW20/fpVpuhD3Y1zr0JM
 zLRtsX8Pokwp/QFsV555YvgvaFzYz15LmEIXzG8EuPJI+Fo3JGwziSiun
 +2x+wMxfv8JOOAYZs+h4kHxWgGzj3MzRCqJQPaMnbzkw2R8UsJ2q8Br9r
 frL4rNnUYo4KY5Vm/K9VTAbHhuwCJnYWsBjxHjl/ZNDLqZoJdB7FtsRpL
 7aMrPZZMcNPYtoRN9G6G+AMoRk1qmIjIsUgi81XXaUcRY3lSLHy6nf3Ml g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="369457557"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="369457557"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 04:08:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="633673426"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="633673426"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga007.fm.intel.com with ESMTP; 24 Oct 2022 04:08:04 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: Intel: boards: Fix typo in comments
Date: Mon, 24 Oct 2022 21:08:40 +0200
Message-Id: <20221024190841.31572-2-amadeuszx.slawinski@linux.intel.com>
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
 sound/soc/intel/boards/bdw-rt5650.c             | 2 +-
 sound/soc/intel/boards/bdw-rt5677.c             | 2 +-
 sound/soc/intel/boards/bxt_rt298.c              | 2 +-
 sound/soc/intel/boards/bytcht_cx2072x.c         | 2 +-
 sound/soc/intel/boards/bytcht_es8316.c          | 2 +-
 sound/soc/intel/boards/bytcr_rt5640.c           | 2 +-
 sound/soc/intel/boards/bytcr_rt5651.c           | 2 +-
 sound/soc/intel/boards/bytcr_wm5102.c           | 2 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c    | 2 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c        | 2 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c         | 2 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c         | 2 +-
 sound/soc/intel/boards/skl_nau88l25_max98357a.c | 2 +-
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c   | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/intel/boards/bdw-rt5650.c b/sound/soc/intel/boards/bdw-rt5650.c
index 67c3f49b924c..d0682bc543c9 100644
--- a/sound/soc/intel/boards/bdw-rt5650.c
+++ b/sound/soc/intel/boards/bdw-rt5650.c
@@ -88,7 +88,7 @@ static int broadwell_ssp0_fixup(struct snd_soc_pcm_runtime *rtd,
 	struct snd_interval *chan = hw_param_interval(params,
 						      SNDRV_PCM_HW_PARAM_CHANNELS);
 
-	/* The ADSP will covert the FE rate to 48k, max 4-channels */
+	/* The ADSP will convert the FE rate to 48k, max 4-channels */
 	rate->min = rate->max = 48000;
 	chan->min = 2;
 	chan->max = 4;
diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index 31488702768e..f3e08d258ac1 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -141,7 +141,7 @@ static int broadwell_ssp0_fixup(struct snd_soc_pcm_runtime *rtd,
 	struct snd_interval *chan = hw_param_interval(params,
 						      SNDRV_PCM_HW_PARAM_CHANNELS);
 
-	/* The ADSP will covert the FE rate to 48k, stereo */
+	/* The ADSP will convert the FE rate to 48k, stereo */
 	rate->min = rate->max = 48000;
 	chan->min = chan->max = 2;
 
diff --git a/sound/soc/intel/boards/bxt_rt298.c b/sound/soc/intel/boards/bxt_rt298.c
index 4bd93c3ba377..bf89fe80423d 100644
--- a/sound/soc/intel/boards/bxt_rt298.c
+++ b/sound/soc/intel/boards/bxt_rt298.c
@@ -210,7 +210,7 @@ static int broxton_ssp5_fixup(struct snd_soc_pcm_runtime *rtd,
 					SNDRV_PCM_HW_PARAM_CHANNELS);
 	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 
-	/* The ADSP will covert the FE rate to 48k, stereo */
+	/* The ADSP will convert the FE rate to 48k, stereo */
 	rate->min = rate->max = 48000;
 	chan->min = chan->max = 2;
 
diff --git a/sound/soc/intel/boards/bytcht_cx2072x.c b/sound/soc/intel/boards/bytcht_cx2072x.c
index ae899866863e..41cec67157b6 100644
--- a/sound/soc/intel/boards/bytcht_cx2072x.c
+++ b/sound/soc/intel/boards/bytcht_cx2072x.c
@@ -111,7 +111,7 @@ static int byt_cht_cx2072x_fixup(struct snd_soc_pcm_runtime *rtd,
 		hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
 	int ret;
 
-	/* The DSP will covert the FE rate to 48k, stereo, 24bits */
+	/* The DSP will convert the FE rate to 48k, stereo, 24bits */
 	rate->min = rate->max = 48000;
 	channels->min = channels->max = 2;
 
diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 6432b83f616f..cdcb448d5212 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -243,7 +243,7 @@ static int byt_cht_es8316_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 						SNDRV_PCM_HW_PARAM_CHANNELS);
 	int ret, bits;
 
-	/* The DSP will covert the FE rate to 48k, stereo */
+	/* The DSP will convert the FE rate to 48k, stereo */
 	rate->min = rate->max = 48000;
 	channels->min = channels->max = 2;
 
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index fb9d9e271845..6db07b2417ca 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1390,7 +1390,7 @@ static int byt_rt5640_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 						SNDRV_PCM_HW_PARAM_CHANNELS);
 	int ret, bits;
 
-	/* The DSP will covert the FE rate to 48k, stereo */
+	/* The DSP will convert the FE rate to 48k, stereo */
 	rate->min = rate->max = 48000;
 	channels->min = channels->max = 2;
 
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 2beb686768f2..81ac6eeda2e6 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -683,7 +683,7 @@ static int byt_rt5651_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 						SNDRV_PCM_HW_PARAM_CHANNELS);
 	int ret, bits;
 
-	/* The DSP will covert the FE rate to 48k, stereo */
+	/* The DSP will convert the FE rate to 48k, stereo */
 	rate->min = rate->max = 48000;
 	channels->min = channels->max = 2;
 
diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index 45a6805787f5..1669eb3bd80f 100644
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -248,7 +248,7 @@ static int byt_wm5102_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 							  SNDRV_PCM_HW_PARAM_CHANNELS);
 	int ret;
 
-	/* The DSP will covert the FE rate to 48k, stereo */
+	/* The DSP will convert the FE rate to 48k, stereo */
 	rate->min = 48000;
 	rate->max = 48000;
 	channels->min = 2;
diff --git a/sound/soc/intel/boards/cht_bsw_max98090_ti.c b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
index 64eb73525ee3..2c086e901aae 100644
--- a/sound/soc/intel/boards/cht_bsw_max98090_ti.c
+++ b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
@@ -272,7 +272,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		return ret;
 	}
 
-	/* The DSP will covert the FE rate to 48k, stereo, 24bits */
+	/* The DSP will convert the FE rate to 48k, stereo, 24bits */
 	rate->min = rate->max = 48000;
 	channels->min = channels->max = 2;
 
diff --git a/sound/soc/intel/boards/cht_bsw_nau8824.c b/sound/soc/intel/boards/cht_bsw_nau8824.c
index 4c1d83b317c7..af2d9a78465d 100644
--- a/sound/soc/intel/boards/cht_bsw_nau8824.c
+++ b/sound/soc/intel/boards/cht_bsw_nau8824.c
@@ -136,7 +136,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 	int ret;
 
-	/* The DSP will covert the FE rate to 48k, stereo, 24bits */
+	/* The DSP will convert the FE rate to 48k, stereo, 24bits */
 	rate->min = rate->max = 48000;
 	channels->min = channels->max = 2;
 
diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
index 96501aed8bee..25a054bd4073 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5645.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
@@ -344,7 +344,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	struct snd_interval *channels = hw_param_interval(params,
 						SNDRV_PCM_HW_PARAM_CHANNELS);
 
-	/* The DSP will covert the FE rate to 48k, stereo, 24bits */
+	/* The DSP will convert the FE rate to 48k, stereo, 24bits */
 	rate->min = rate->max = 48000;
 	channels->min = channels->max = 2;
 
diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index ca47f6476b07..49d3da8f7316 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -270,7 +270,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 						SNDRV_PCM_HW_PARAM_CHANNELS);
 	int ret, bits;
 
-	/* The DSP will covert the FE rate to 48k, stereo, 24bits */
+	/* The DSP will convert the FE rate to 48k, stereo, 24bits */
 	rate->min = rate->max = 48000;
 	channels->min = channels->max = 2;
 
diff --git a/sound/soc/intel/boards/skl_nau88l25_max98357a.c b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
index 8dceb0b02581..e13a5a4d8f7e 100644
--- a/sound/soc/intel/boards/skl_nau88l25_max98357a.c
+++ b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
@@ -154,7 +154,7 @@ static int skylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
 			SNDRV_PCM_HW_PARAM_CHANNELS);
 	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 
-	/* The ADSP will covert the FE rate to 48k, stereo */
+	/* The ADSP will convert the FE rate to 48k, stereo */
 	rate->min = rate->max = 48000;
 	chan->min = chan->max = 2;
 
diff --git a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
index 62c0d46d0086..575604dc8936 100644
--- a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
+++ b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
@@ -333,7 +333,7 @@ static int skylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
 						SNDRV_PCM_HW_PARAM_CHANNELS);
 	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 
-	/* The ADSP will covert the FE rate to 48k, stereo */
+	/* The ADSP will convert the FE rate to 48k, stereo */
 	rate->min = rate->max = 48000;
 	chan->min = chan->max = 2;
 
-- 
2.25.1

