Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E779739CC04
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Jun 2021 03:04:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 684041718;
	Sun,  6 Jun 2021 03:03:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 684041718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622941441;
	bh=jMe1td193zJuJxaqJE046Mu6hButE2e3+lAL+bNqxmo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PkQIgmQ7jJ2X7KDaOZCs7j1OJIXGRlVmABFn0kz+otMe7VLhxLlSfKLZk3t2Gw6kl
	 jE5gLvy0HOFXGG+iqIo5C6ukkvRqWoEOPVkHfciL6UTLx+omF5bbzvKrtgkWETgm53
	 DBYJRLP67ZRa4zTnze3erYpzZm1G8y78RUAKBS1Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EC07F802DB;
	Sun,  6 Jun 2021 03:01:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85349F802DB; Sun,  6 Jun 2021 03:01:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53821F802DB
 for <alsa-devel@alsa-project.org>; Sun,  6 Jun 2021 03:01:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53821F802DB
IronPort-SDR: YCRop/dcqQI/bvmpDux98XJLheW0kykZVpjsApFMA3NXD8T49ZHN7xnI3VyVeEVa580fdB1HXd
 qSH1KIHqsNrw==
X-IronPort-AV: E=McAfee;i="6200,9189,10006"; a="191800264"
X-IronPort-AV: E=Sophos;i="5.83,252,1616482800"; d="scan'208";a="191800264"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2021 18:01:38 -0700
IronPort-SDR: N0nuN/A298sqmvJi2BrB0/rNdxzhhGMIMscwyuRGynCC0D9R1JUtqW3nyQDuRrXt1tsEvtysJl
 G14KaxTJPzyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,252,1616482800"; d="scan'208";a="412724682"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.32])
 by fmsmga007.fm.intel.com with ESMTP; 05 Jun 2021 18:01:33 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ASoC: Intel: sof_rt5682: code refactor for max98360a
Date: Sun,  6 Jun 2021 08:41:02 +0800
Message-Id: <20210606004102.26190-5-brent.lu@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210606004102.26190-1-brent.lu@intel.com>
References: <20210606004102.26190-1-brent.lu@intel.com>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rander Wang <rander.wang@intel.com>, Jie Yang <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Yong Zhi <yong.zhi@intel.com>, Dharageswari R <dharageswari.r@intel.com>,
 Mark Brown <broonie@kernel.org>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Naveen Manohar <naveen.m@intel.com>, Brent Lu <brent.lu@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org
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

Refactor the machine driver by using the common code in maxim-common
module to support max98360a.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 52 +----------------------------
 1 file changed, 1 insertion(+), 51 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 3e69feaf052b..910c054b0b42 100644
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
2.17.1

