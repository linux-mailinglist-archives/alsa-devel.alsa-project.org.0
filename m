Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB7AC3F38
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 20:01:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A9291675;
	Tue,  1 Oct 2019 20:00:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A9291675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569952860;
	bh=9pr7AAhAygUVvtMH5fRfQEAzHg1KlzZND5BoeT9AGCI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=bLTL9RONbSfya2A1tmUBtDpPUhscvcV4NgCnfYvJW363Pruc+2fXLJHxYCL2uWjTX
	 5DNwRkhzdNh82zi2eF1X69Ys9xws0oiCm/cg7KyK4kn94MjTPTAWDLYAr3kIFzbYaF
	 RBGbM78FY+eC/A8C/9F5QQXtpAzBoRbTKGJ1Yo8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E20D7F80637;
	Tue,  1 Oct 2019 19:56:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E0E8F80678; Tue,  1 Oct 2019 19:56:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB69BF80638
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 19:56:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB69BF80638
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="sZuhVOx9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=k0RiAjX59fGoSMJVDxgVcV+kXKJKZSOKVyq+A5FBRI4=; b=sZuhVOx9m+oX
 vvZYkRWodEiYDzfUVYGG5aiB97UHwJx3FRoezR+eQxwNq5EOlGFL85s/suEj8A5oSi7qlzDKG8SrN
 UOZp4cdiAALNdzBgbiIyzUqhr7citDjnPF/LtmRyld1WELmGo3pun9WHkFqfNM5xOLyzxT5ieS0/I
 vCuW4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFMOG-0005t2-EL; Tue, 01 Oct 2019 17:56:48 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id F1BB827429C0; Tue,  1 Oct 2019 18:56:47 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20190927201408.925-3-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001175647.F1BB827429C0@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 18:56:47 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: intel: sof_rt5682: use separate route
	map for dmic" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: intel: sof_rt5682: use separate route map for dmic

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 4413adc4fd872579de87bedaecda633f999ef995 Mon Sep 17 00:00:00 2001
From: Bard Liao <yung-chuan.liao@linux.intel.com>
Date: Fri, 27 Sep 2019 15:14:06 -0500
Subject: [PATCH] ASoC: intel: sof_rt5682: use separate route map for dmic

dmic map can only be added when dmic dai link is present.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190927201408.925-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
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
