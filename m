Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBE0163868
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 01:20:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6C5216DF;
	Wed, 19 Feb 2020 01:19:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6C5216DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582071610;
	bh=Ax/iPxx5NhUEWtdpkafY3205WP2O6GL9IRNejM4JqvA=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=CXLWtflEql+tcxm42uevjLgcr8/YMKqhTxPrd6ASuMw1Xa+wcb2kswsmWAsLLuc92
	 /NsizORa0MnbYg+irXvgMk/4d7KAwZElWNaBR+1Eubw0d1i3I9jj3ifSF2ijtPvZx+
	 3wP506se4nzyAseQK3hAuj4LogaL1mXP0abatIqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB19CF80321;
	Wed, 19 Feb 2020 01:10:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B95A7F80323; Wed, 19 Feb 2020 01:10:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id AA3B8F80315
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 01:10:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA3B8F80315
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6A511FB;
 Tue, 18 Feb 2020 16:10:16 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A4183F68F;
 Tue, 18 Feb 2020 16:10:16 -0800 (PST)
Date: Wed, 19 Feb 2020 00:10:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc-pcm: use dai_get_widget() at dpcm_get_be()" to the
 asoc tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

   ASoC: soc-pcm: use dai_get_widget() at dpcm_get_be()

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

From 93597fae552a35d27cd1f399ffab6a6862cf9dc3 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 17 Feb 2020 17:27:43 +0900
Subject: [PATCH] ASoC: soc-pcm: use dai_get_widget() at dpcm_get_be()

dpcm_get_be() has very duplicate code.

	dpcm_get_be() {
		...
		if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
(1)			/* code for Playback */
		} else  {
(2)			/* code for Capture */
		}
	}

The difference between Playback (1) and Capture (2) code is pointer only
(= "playback_widget" or "caputre_widget").
OTOH, now we already has dai_get_widget() for it.
This means we can merge (1) and (2).
This patch do it and remove duplicated code.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87ftf9bouq.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 41 ++++++++++++-----------------------------
 1 file changed, 12 insertions(+), 29 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 23e36f4f965c..b708db972310 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1246,47 +1246,30 @@ static struct snd_soc_pcm_runtime *dpcm_get_be(struct snd_soc_card *card,
 		struct snd_soc_dapm_widget *widget, int stream)
 {
 	struct snd_soc_pcm_runtime *be;
+	struct snd_soc_dapm_widget *w;
 	struct snd_soc_dai *dai;
 	int i;
 
 	dev_dbg(card->dev, "ASoC: find BE for widget %s\n", widget->name);
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		for_each_card_rtds(card, be) {
+	for_each_card_rtds(card, be) {
 
-			if (!be->dai_link->no_pcm)
-				continue;
+		if (!be->dai_link->no_pcm)
+			continue;
 
-			dev_dbg(card->dev, "ASoC: try BE : %s\n",
-				be->cpu_dai->playback_widget ?
-				be->cpu_dai->playback_widget->name : "(not set)");
+		w = dai_get_widget(be->cpu_dai, stream);
 
-			if (be->cpu_dai->playback_widget == widget)
-				return be;
+		dev_dbg(card->dev, "ASoC: try BE : %s\n",
+			w ? w->name : "(not set)");
 
-			for_each_rtd_codec_dai(be, i, dai) {
-				if (dai->playback_widget == widget)
-					return be;
-			}
-		}
-	} else {
-
-		for_each_card_rtds(card, be) {
-
-			if (!be->dai_link->no_pcm)
-				continue;
+		if (w == widget)
+			return be;
 
-			dev_dbg(card->dev, "ASoC: try BE %s\n",
-				be->cpu_dai->capture_widget ?
-				be->cpu_dai->capture_widget->name : "(not set)");
+		for_each_rtd_codec_dai(be, i, dai) {
+			w = dai_get_widget(dai, stream);
 
-			if (be->cpu_dai->capture_widget == widget)
+			if (w == widget)
 				return be;
-
-			for_each_rtd_codec_dai(be, i, dai) {
-				if (dai->capture_widget == widget)
-					return be;
-			}
 		}
 	}
 
-- 
2.20.1

