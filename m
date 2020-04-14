Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C46571A805F
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 16:50:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AFBC16B8;
	Tue, 14 Apr 2020 16:49:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AFBC16B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586875835;
	bh=maahfHpptY+luBTTaPHS+bGGlkOEHHVUGyfuhf0vmbM=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=F7JMkTPe67DDSOWFrGq/W2w2zXknJD9SEQ5eg3WbeayLg7kWVOmnlsIceRohTSYoo
	 Ke5bOvAI453QTA3oTesbm4sYnrb+IhqExbQ43vK/+KbMGxpha4utPVHJwsdt90UTm8
	 5nVye6/r7WsAWdghS80B9Zdy6ItcjU0+oSlUYBnI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FDC0F802D2;
	Tue, 14 Apr 2020 16:46:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97F13F802C4; Tue, 14 Apr 2020 16:46:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0ABC9F802A0
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 16:46:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0ABC9F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lcyJBoXq"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 071DA20787;
 Tue, 14 Apr 2020 14:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586875579;
 bh=maahfHpptY+luBTTaPHS+bGGlkOEHHVUGyfuhf0vmbM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=lcyJBoXqUcmyt1frRT9Sn2AF4JFjr0MyTS6hZBfYQouAbheNPQZYhHzV9sCyU5uXX
 AoFGQJdNO6qFUHJ2dAEFix5sXw9vdZ2Pfvi9UutbA4ISrZaJ+4W1MPIpE2UmPk4X4f
 guie4TGgoU9NnHmdYbNohNC4PiDmHQSn4UD0GKwA=
Date: Tue, 14 Apr 2020 15:46:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Applied "ASoC: dapm: Remove dapm_connect_dai_link_widgets helper" to
 the asoc tree
In-Reply-To: <20200409181209.30130-3-ckeepax@opensource.cirrus.com>
Message-Id: <applied-20200409181209.30130-3-ckeepax@opensource.cirrus.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 patches@opensource.cirrus.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, shreyas.nc@intel.com,
 yung-chuan.liao@linux.intel.com
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

The patch

   ASoC: dapm: Remove dapm_connect_dai_link_widgets helper

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 0eaef95e3cef1f849e8873f929bef3039409c4fc Mon Sep 17 00:00:00 2001
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Thu, 9 Apr 2020 19:12:09 +0100
Subject: [PATCH] ASoC: dapm: Remove dapm_connect_dai_link_widgets helper

This helper is adding very little both it and is one caller are very
small functions simply combine the two.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20200409181209.30130-3-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-dapm.c | 36 ++++++++++++++----------------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 33168980619b..a4143ca190d0 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4358,27 +4358,6 @@ static void dapm_connect_dai_pair(struct snd_soc_card *card,
 	}
 }
 
-static void dapm_connect_dai_link_widgets(struct snd_soc_card *card,
-					  struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_dai *codec_dai;
-	int i;
-
-	if (rtd->num_cpus == 1) {
-		for_each_rtd_codec_dais(rtd, i, codec_dai)
-			dapm_connect_dai_pair(card, rtd, codec_dai,
-					      rtd->cpu_dais[0]);
-	} else if (rtd->num_codecs == rtd->num_cpus) {
-		for_each_rtd_codec_dais(rtd, i, codec_dai)
-			dapm_connect_dai_pair(card, rtd, codec_dai,
-					      rtd->cpu_dais[i]);
-	} else {
-		dev_err(card->dev,
-			"N cpus to M codecs link is not supported yet\n");
-	}
-
-}
-
 static void soc_dapm_dai_stream_event(struct snd_soc_dai *dai, int stream,
 	int event)
 {
@@ -4419,6 +4398,8 @@ static void soc_dapm_dai_stream_event(struct snd_soc_dai *dai, int stream,
 void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
+	struct snd_soc_dai *codec_dai;
+	int i;
 
 	/* for each BE DAI link... */
 	for_each_card_rtds(card, rtd)  {
@@ -4429,7 +4410,18 @@ void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card)
 		if (rtd->dai_link->dynamic)
 			continue;
 
-		dapm_connect_dai_link_widgets(card, rtd);
+		if (rtd->num_cpus == 1) {
+			for_each_rtd_codec_dais(rtd, i, codec_dai)
+				dapm_connect_dai_pair(card, rtd, codec_dai,
+						      rtd->cpu_dais[0]);
+		} else if (rtd->num_codecs == rtd->num_cpus) {
+			for_each_rtd_codec_dais(rtd, i, codec_dai)
+				dapm_connect_dai_pair(card, rtd, codec_dai,
+						      rtd->cpu_dais[i]);
+		} else {
+			dev_err(card->dev,
+				"N cpus to M codecs link is not supported yet\n");
+		}
 	}
 }
 
-- 
2.20.1

