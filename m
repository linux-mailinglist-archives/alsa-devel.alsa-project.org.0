Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98214374318
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 18:51:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AFC2178F;
	Wed,  5 May 2021 18:50:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AFC2178F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620233492;
	bh=PgcP7XnYGOJBiIk9CD8XzEZ2pRFMbkiALljFm6EU4aA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rPm7i5LggVryyu0Qv6jBZdvU3bzkiilMLBwXA3T2XBRek+z7668PVLwpdEbUot10k
	 +zwGNzfWAI3V8sMPPUCmmZ7PQtf9MW4MUJ+uDhnwCVtslc5oYGa4vBJJh0gMCK9uY+
	 VaKE/aC6SfpS9pdyeCanJgclh/RuB1+tFUNTyBwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5773F805EA;
	Wed,  5 May 2021 18:37:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BB21F805CB; Wed,  5 May 2021 18:37:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11A1AF8058C
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 18:37:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11A1AF8058C
IronPort-SDR: MRXQgZpZOZ9xgUWW1NDkheTDOZw6YYOItKuYC4a0q0TxErOGbN7Z7eLjC0c4WSIIK9Hba7UGKR
 EAexNhZ4DQ+w==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="196219211"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="196219211"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 09:37:29 -0700
IronPort-SDR: jGGmJmuhuI7OdJjGYXppRIw+1xBsuBesANby/C24S6YbLLbNNIyPloNeydVFYDWV9DxLFh4FdN
 8+2tZj7dO5lw==
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="458800073"
Received: from rtsagpan-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.51.38])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 09:37:29 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 13/13] ASoC: Intel: sof_rt5682: code refactor for max98357a
Date: Wed,  5 May 2021 11:37:05 -0500
Message-Id: <20210505163705.305616-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505163705.305616-1-pierre-louis.bossart@linux.intel.com>
References: <20210505163705.305616-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Brent Lu <brent.lu@intel.com>,
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
module to support max98357a.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 36 +++++++++++++++++++----------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 6be78a206242..f3d370517101 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -451,20 +451,26 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 static const struct snd_kcontrol_new sof_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
-	SOC_DAPM_PIN_SWITCH("Spk"),
 	SOC_DAPM_PIN_SWITCH("Left Spk"),
 	SOC_DAPM_PIN_SWITCH("Right Spk"),
 
 };
 
+static const struct snd_kcontrol_new speaker_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Spk"),
+};
+
 static const struct snd_soc_dapm_widget sof_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-	SND_SOC_DAPM_SPK("Spk", NULL),
 	SND_SOC_DAPM_SPK("Left Spk", NULL),
 	SND_SOC_DAPM_SPK("Right Spk", NULL),
 };
 
+static const struct snd_soc_dapm_widget speaker_widgets[] = {
+	SND_SOC_DAPM_SPK("Spk", NULL),
+};
+
 static const struct snd_soc_dapm_widget dmic_widgets[] = {
 	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
 };
@@ -504,6 +510,21 @@ static int speaker_codec_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_card *card = rtd->card;
 	int ret;
 
+	ret = snd_soc_dapm_new_controls(&card->dapm, speaker_widgets,
+					ARRAY_SIZE(speaker_widgets));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add dapm controls, ret %d\n", ret);
+		/* Don't need to add routes if widget addition failed */
+		return ret;
+	}
+
+	ret = snd_soc_add_card_controls(card, speaker_controls,
+					ARRAY_SIZE(speaker_controls));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add card controls, ret %d\n", ret);
+		return ret;
+	}
+
 	ret = snd_soc_dapm_add_routes(&card->dapm, speaker_map,
 				      ARRAY_SIZE(speaker_map));
 
@@ -573,13 +594,6 @@ static struct snd_soc_dai_link_component dmic_component[] = {
 	}
 };
 
-static struct snd_soc_dai_link_component max98357a_component[] = {
-	{
-		.name = "MX98357A:00",
-		.dai_name = "HiFi",
-	}
-};
-
 static struct snd_soc_dai_link_component max98360a_component[] = {
 	{
 		.name = "MX98360A:00",
@@ -768,9 +782,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 				SOF_RT1011_SPEAKER_AMP_PRESENT) {
 			sof_rt1011_dai_link(&links[id]);
 		} else {
-			links[id].codecs = max98357a_component;
-			links[id].num_codecs = ARRAY_SIZE(max98357a_component);
-			links[id].init = speaker_codec_init;
+			max_98357a_dai_link(&links[id]);
 		}
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
-- 
2.25.1

