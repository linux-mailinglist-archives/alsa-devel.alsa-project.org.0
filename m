Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 051363C650C
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jul 2021 22:37:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9361F16B5;
	Mon, 12 Jul 2021 22:36:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9361F16B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626122222;
	bh=scxRVlRUUc4/CeWasph9jlxNXWQRo6zNIRUd5HYjx+0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EdMX6WdbCC2ffYpt8KfaQDN/sQGG9TqLXN53EOzYWuNrJvJxqT3FytjarhPG48u79
	 HOCHJoalpVNzb2D63snS4of1HiXswsSnMV8Fnj9YwzfEQhy34afr+n9RaXi4RF5Sfz
	 YCqTrqDmWX8vp/B9TRvFealZ0ffN8mxA9QeUkYfc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F45BF804FD;
	Mon, 12 Jul 2021 22:33:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AA08F802E7; Mon, 12 Jul 2021 22:33:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E1F7F80269
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 22:32:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E1F7F80269
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="190431647"
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="190431647"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 13:32:56 -0700
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="561880771"
Received: from yangbosh-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.95.167])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 13:32:55 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/7] ASoC: Intel: sof_rt5682: code refactor for max98360a
Date: Mon, 12 Jul 2021 15:32:37 -0500
Message-Id: <20210712203240.46960-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712203240.46960-1-pierre-louis.bossart@linux.intel.com>
References: <20210712203240.46960-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Brent Lu <brent.lu@intel.com>,
 Bard Liao <bard.liao@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Brent Lu <brent.lu@intel.com>

Refactor the machine driver by using the common code in maxim-common
module to support max98360a.

Reviewed-by: Bard Liao <bard.liao@intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 52 +----------------------------
 1 file changed, 1 insertion(+), 51 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 39217223d50c..adfb4214f24b 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -456,10 +456,6 @@ static const struct snd_kcontrol_new sof_controls[] = {
 
 };
 
-static const struct snd_kcontrol_new speaker_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Spk"),
-};
-
 static const struct snd_soc_dapm_widget sof_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
@@ -467,10 +463,6 @@ static const struct snd_soc_dapm_widget sof_widgets[] = {
 	SND_SOC_DAPM_SPK("Right Spk", NULL),
 };
 
-static const struct snd_soc_dapm_widget speaker_widgets[] = {
-	SND_SOC_DAPM_SPK("Spk", NULL),
-};
-
 static const struct snd_soc_dapm_widget dmic_widgets[] = {
 	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
 };
@@ -484,11 +476,6 @@ static const struct snd_soc_dapm_route sof_map[] = {
 	{ "IN1P", NULL, "Headset Mic" },
 };
 
-static const struct snd_soc_dapm_route speaker_map[] = {
-	/* speaker */
-	{ "Spk", NULL, "Speaker" },
-};
-
 static const struct snd_soc_dapm_route speaker_map_lr[] = {
 	{ "Left Spk", NULL, "Left SPO" },
 	{ "Right Spk", NULL, "Right SPO" },
@@ -505,34 +492,6 @@ static int speaker_codec_init_lr(struct snd_soc_pcm_runtime *rtd)
 				       ARRAY_SIZE(speaker_map_lr));
 }
 
-static int speaker_codec_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_card *card = rtd->card;
-	int ret;
-
-	ret = snd_soc_dapm_new_controls(&card->dapm, speaker_widgets,
-					ARRAY_SIZE(speaker_widgets));
-	if (ret) {
-		dev_err(rtd->dev, "unable to add dapm controls, ret %d\n", ret);
-		/* Don't need to add routes if widget addition failed */
-		return ret;
-	}
-
-	ret = snd_soc_add_card_controls(card, speaker_controls,
-					ARRAY_SIZE(speaker_controls));
-	if (ret) {
-		dev_err(rtd->dev, "unable to add card controls, ret %d\n", ret);
-		return ret;
-	}
-
-	ret = snd_soc_dapm_add_routes(&card->dapm, speaker_map,
-				      ARRAY_SIZE(speaker_map));
-
-	if (ret)
-		dev_err(rtd->dev, "Speaker map addition failed: %d\n", ret);
-	return ret;
-}
-
 static int dmic_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
@@ -594,13 +553,6 @@ static struct snd_soc_dai_link_component dmic_component[] = {
 	}
 };
 
-static struct snd_soc_dai_link_component max98360a_component[] = {
-	{
-		.name = "MX98360A:00",
-		.dai_name = "HiFi",
-	}
-};
-
 static struct snd_soc_dai_link_component rt1015_components[] = {
 	{
 		.name = "i2c-10EC1015:00",
@@ -775,9 +727,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			links[id].dpcm_capture = 1;
 		} else if (sof_rt5682_quirk &
 				SOF_MAX98360A_SPEAKER_AMP_PRESENT) {
-			links[id].codecs = max98360a_component;
-			links[id].num_codecs = ARRAY_SIZE(max98360a_component);
-			links[id].init = speaker_codec_init;
+			max_98360a_dai_link(&links[id]);
 		} else if (sof_rt5682_quirk &
 				SOF_RT1011_SPEAKER_AMP_PRESENT) {
 			sof_rt1011_dai_link(&links[id]);
-- 
2.25.1

