Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A66DC0C8B
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2019 22:18:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD7A51688;
	Fri, 27 Sep 2019 22:17:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD7A51688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569615512;
	bh=yE+4qkjBia+PvGEhAktu4wKb5zCB+VsNCNpcceXLACw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DaGC7UvavBO08apKbGBNtOhmxhex7iVk8pjHiJdYIzIdgs/3yOBHsTJBOnOIYeyoH
	 KyAKy806O9nq5xuIB9t58ltfSpcn3oZxQArj8y9ftHsscqp52CaX4llCzsop6ao9PM
	 HcE1CBxDjOsU9dgotwo931uomx6XWG9Pixkjgb8A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C97DDF805F9;
	Fri, 27 Sep 2019 22:14:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBEE9F804CA; Fri, 27 Sep 2019 22:14:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EA49F8044C
 for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2019 22:14:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EA49F8044C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Sep 2019 13:14:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,556,1559545200"; d="scan'208";a="202144623"
Received: from wcui-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.251.146.136])
 by orsmga002.jf.intel.com with ESMTP; 27 Sep 2019 13:14:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 27 Sep 2019 15:14:06 -0500
Message-Id: <20190927201408.925-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190927201408.925-1-pierre-louis.bossart@linux.intel.com>
References: <20190927201408.925-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 2/4] ASoC: intel: sof_rt5682: use separate
	route map for dmic
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

dmic map can only be added when dmic dai link is present.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 35 +++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index a437567b8cee..57b4ef75be15 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -308,6 +308,9 @@ static const struct snd_soc_dapm_widget sof_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_SPK("Spk", NULL),
+};
+
+static const struct snd_soc_dapm_widget dmic_widgets[] = {
 	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
 };
 
@@ -318,10 +321,6 @@ static const struct snd_soc_dapm_route sof_map[] = {
 
 	/* other jacks */
 	{ "IN1P", NULL, "Headset Mic" },
-
-	/* digital mics */
-	{"DMic", NULL, "SoC DMIC"},
-
 };
 
 static const struct snd_soc_dapm_route speaker_map[] = {
@@ -329,6 +328,11 @@ static const struct snd_soc_dapm_route speaker_map[] = {
 	{ "Spk", NULL, "Speaker" },
 };
 
+static const struct snd_soc_dapm_route dmic_map[] = {
+	/* digital mics */
+	{"DMic", NULL, "SoC DMIC"},
+};
+
 static int speaker_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
@@ -342,6 +346,28 @@ static int speaker_codec_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
+static int dmic_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, dmic_widgets,
+					ARRAY_SIZE(dmic_widgets));
+	if (ret) {
+		dev_err(card->dev, "DMic widget addition failed: %d\n", ret);
+		/* Don't need to add routes if widget addition failed */
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, dmic_map,
+				      ARRAY_SIZE(dmic_map));
+
+	if (ret)
+		dev_err(card->dev, "DMic map addition failed: %d\n", ret);
+
+	return ret;
+}
+
 /* sof audio machine driver for rt5682 codec */
 static struct snd_soc_card sof_audio_card_rt5682 = {
 	.name = "sof_rt5682",
@@ -445,6 +471,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].name = "dmic01";
 		links[id].cpus = &cpus[id];
 		links[id].cpus->dai_name = "DMIC01 Pin";
+		links[id].init = dmic_init;
 		if (dmic_be_num > 1) {
 			/* set up 2 BE links at most */
 			links[id + 1].name = "dmic16k";
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
