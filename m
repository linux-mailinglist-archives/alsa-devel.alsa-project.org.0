Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA97A3742ED
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 18:49:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EE61178C;
	Wed,  5 May 2021 18:48:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EE61178C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620233384;
	bh=7ue+aeqqZiV+zpCSB4vWjyP7UasZoB2ZwNUqyKsoekE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y8dIo/vbJB3pt8mJvvunuxmrY6xV1k7yiDLNHPUIUwjzKShQixOpN8qBDsrVFoLuO
	 yYJ4awiq5Ex7s4r9TwEVv0aSEbT8FydAnHEMDuCk6v2G5E9y/Nu+gnE6UYbMVrabvB
	 k1jmSsxeAjx5zolBWHxdULKy9iAk4J7xaZL+jLjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B3ECF804FE;
	Wed,  5 May 2021 18:37:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4108BF805BB; Wed,  5 May 2021 18:37:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BDAAF805AD
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 18:37:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BDAAF805AD
IronPort-SDR: rlpvJwNN1HuAfSafFdn/TDrTCQ4fBEVFf2DMOG/qKnZFUoT68Y0QnTXL1iK3G3m6f/bO10AhrT
 4FAMnjg0fosQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="196219197"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="196219197"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 09:37:24 -0700
IronPort-SDR: 2VBYgZTxFsbMK4rsNb9K3sLscq9HPP8Ceaux2AvPTudxXg+hnXeu8egKxTzXIS9zRkxxY9/LzR
 qYneTfCIV5lA==
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="458800033"
Received: from rtsagpan-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.51.38])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 09:37:23 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/13] ASoC: Intel: boards: remove .nonatomic for BE dailinks
Date: Wed,  5 May 2021 11:37:00 -0500
Message-Id: <20210505163705.305616-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505163705.305616-1-pierre-louis.bossart@linux.intel.com>
References: <20210505163705.305616-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

Somehow with copy/paste and inertia we keep re-adding this field for
BE dailinks, when it's only required for hard-coded FE links.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/intel/boards/bytcht_cx2072x.c | 1 -
 sound/soc/intel/boards/bytcht_da7213.c  | 1 -
 sound/soc/intel/boards/bytcht_es8316.c  | 1 -
 sound/soc/intel/boards/bytcht_nocodec.c | 1 -
 sound/soc/intel/boards/bytcr_rt5640.c   | 1 -
 sound/soc/intel/boards/bytcr_rt5651.c   | 1 -
 sound/soc/intel/boards/bytcr_wm5102.c   | 1 -
 sound/soc/intel/boards/cht_bsw_rt5645.c | 1 -
 sound/soc/intel/boards/cht_bsw_rt5672.c | 1 -
 sound/soc/intel/boards/ehl_rt5660.c     | 1 -
 sound/soc/intel/boards/sof_pcm512x.c    | 1 -
 sound/soc/intel/boards/sof_rt5682.c     | 2 --
 sound/soc/intel/boards/sof_sdw.c        | 1 -
 sound/soc/intel/boards/sof_wm8804.c     | 1 -
 14 files changed, 15 deletions(-)

diff --git a/sound/soc/intel/boards/bytcht_cx2072x.c b/sound/soc/intel/boards/bytcht_cx2072x.c
index 2bfe3e4c696f..a9e51bbf018c 100644
--- a/sound/soc/intel/boards/bytcht_cx2072x.c
+++ b/sound/soc/intel/boards/bytcht_cx2072x.c
@@ -198,7 +198,6 @@ static struct snd_soc_dai_link byt_cht_cx2072x_dais[] = {
 					      | SND_SOC_DAIFMT_CBS_CFS,
 		.init = byt_cht_cx2072x_init,
 		.be_hw_params_fixup = byt_cht_cx2072x_fixup,
-		.nonatomic = true,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp2, cx2072x, platform),
diff --git a/sound/soc/intel/boards/bytcht_da7213.c b/sound/soc/intel/boards/bytcht_da7213.c
index cfeba27252ba..a28773fb7892 100644
--- a/sound/soc/intel/boards/bytcht_da7213.c
+++ b/sound/soc/intel/boards/bytcht_da7213.c
@@ -197,7 +197,6 @@ static struct snd_soc_dai_link dailink[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBS_CFS,
 		.be_hw_params_fixup = codec_fixup,
-		.nonatomic = true,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.ops = &ssp2_ops,
diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 06df2d46d910..a0af91580184 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -337,7 +337,6 @@ static struct snd_soc_dai_link byt_cht_es8316_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBS_CFS,
 		.be_hw_params_fixup = byt_cht_es8316_codec_fixup,
-		.nonatomic = true,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.init = byt_cht_es8316_init,
diff --git a/sound/soc/intel/boards/bytcht_nocodec.c b/sound/soc/intel/boards/bytcht_nocodec.c
index 8c0dab1f4030..9b48fe701a2c 100644
--- a/sound/soc/intel/boards/bytcht_nocodec.c
+++ b/sound/soc/intel/boards/bytcht_nocodec.c
@@ -144,7 +144,6 @@ static struct snd_soc_dai_link dais[] = {
 						| SND_SOC_DAIFMT_CBS_CFS,
 		.be_hw_params_fixup = codec_fixup,
 		.ignore_suspend = 1,
-		.nonatomic = true,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp2_port, dummy, platform),
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index df2f5d55e8ff..240cb4337dee 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1180,7 +1180,6 @@ static struct snd_soc_dai_link byt_rt5640_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBS_CFS,
 		.be_hw_params_fixup = byt_rt5640_codec_fixup,
-		.nonatomic = true,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.init = byt_rt5640_init,
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 148b7b1bd3e8..e13c0c63a949 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -786,7 +786,6 @@ static struct snd_soc_dai_link byt_rt5651_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBS_CFS,
 		.be_hw_params_fixup = byt_rt5651_codec_fixup,
-		.nonatomic = true,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.init = byt_rt5651_init,
diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index 8d8ab9be256f..580d5fddae5a 100644
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -351,7 +351,6 @@ static struct snd_soc_dai_link byt_wm5102_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBS_CFS,
 		.be_hw_params_fixup = byt_wm5102_codec_fixup,
-		.nonatomic = true,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.init = byt_wm5102_init,
diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
index 6fea554cfed5..804dbc7911d5 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5645.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
@@ -471,7 +471,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.no_pcm = 1,
 		.init = cht_codec_init,
 		.be_hw_params_fixup = cht_codec_fixup,
-		.nonatomic = true,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.ops = &cht_be_ssp2_ops,
diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index e358632f50d7..9509b6e161b8 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -375,7 +375,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.name = "SSP2-Codec",
 		.id = 0,
 		.no_pcm = 1,
-		.nonatomic = true,
 		.init = cht_codec_init,
 		.be_hw_params_fixup = cht_codec_fixup,
 		.dpcm_playback = 1,
diff --git a/sound/soc/intel/boards/ehl_rt5660.c b/sound/soc/intel/boards/ehl_rt5660.c
index b9b72d05b335..00773d17d578 100644
--- a/sound/soc/intel/boards/ehl_rt5660.c
+++ b/sound/soc/intel/boards/ehl_rt5660.c
@@ -181,7 +181,6 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.ops = &rt5660_ops,
-		.nonatomic = true,
 		SND_SOC_DAILINK_REG(ssp0_pin, rt5660_codec, platform),
 	},
 	{
diff --git a/sound/soc/intel/boards/sof_pcm512x.c b/sound/soc/intel/boards/sof_pcm512x.c
index 8620d4f38493..2ec9c62366e2 100644
--- a/sound/soc/intel/boards/sof_pcm512x.c
+++ b/sound/soc/intel/boards/sof_pcm512x.c
@@ -241,7 +241,6 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 	links[id].num_platforms = ARRAY_SIZE(platform_component);
 	links[id].init = sof_pcm512x_codec_init;
 	links[id].ops = &sof_pcm512x_ops;
-	links[id].nonatomic = true;
 	links[id].dpcm_playback = 1;
 	/*
 	 * capture only supported with specific versions of the Hifiberry DAC+
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index ee56a95895db..7eecfe1b4404 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -637,7 +637,6 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 	links[id].init = sof_rt5682_codec_init;
 	links[id].exit = sof_rt5682_codec_exit;
 	links[id].ops = &sof_rt5682_ops;
-	links[id].nonatomic = true;
 	links[id].dpcm_playback = 1;
 	links[id].dpcm_capture = 1;
 	links[id].no_pcm = 1;
@@ -775,7 +774,6 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		}
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
-		links[id].nonatomic = true;
 		links[id].dpcm_playback = 1;
 		links[id].no_pcm = 1;
 		links[id].cpus = &cpus[id];
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 9b32d729cc72..608ae3c93aae 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -505,7 +505,6 @@ static void init_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links
 	dai_links->name = name;
 	dai_links->platforms = platform_component;
 	dai_links->num_platforms = ARRAY_SIZE(platform_component);
-	dai_links->nonatomic = true;
 	dai_links->no_pcm = 1;
 	dai_links->cpus = cpus;
 	dai_links->num_cpus = cpus_num;
diff --git a/sound/soc/intel/boards/sof_wm8804.c b/sound/soc/intel/boards/sof_wm8804.c
index 6a181e45143d..54395e2ededc 100644
--- a/sound/soc/intel/boards/sof_wm8804.c
+++ b/sound/soc/intel/boards/sof_wm8804.c
@@ -167,7 +167,6 @@ static struct snd_soc_dai_link dailink[] = {
 		.name = "SSP5-Codec",
 		.id = 0,
 		.no_pcm = 1,
-		.nonatomic = true,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.ops = &sof_wm8804_ops,
-- 
2.25.1

