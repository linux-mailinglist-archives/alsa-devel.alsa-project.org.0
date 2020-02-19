Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F18163866
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 01:19:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E33B16DD;
	Wed, 19 Feb 2020 01:18:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E33B16DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582071576;
	bh=IYfLTleOxEdfzehq6h/3tqvZMcKFbvpSGloLn1EXtTo=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=j7XADOZL2sExQLXP0mix/uOQZeJcTV2s919P4o7b/NxVkIwy7DQbrnlMC/99+DPUU
	 Z9GZRbYEKUADlEZANi01EBYYp8dvptemdP8iir/muoutl/wPP1aMTXYGF1pYJa0QT0
	 8y7JSKdHzQYhb6Xix11pVIza1u3oh1JJbN5QM7X0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C978F8031A;
	Wed, 19 Feb 2020 01:10:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DB1AF8031A; Wed, 19 Feb 2020 01:10:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 67DB1F80308
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 01:10:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67DB1F80308
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C9D11FB;
 Tue, 18 Feb 2020 16:10:12 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 008913F68F;
 Tue, 18 Feb 2020 16:10:11 -0800 (PST)
Date: Wed, 19 Feb 2020 00:10:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc-pcm: use dai_get_widget() at
 dpcm_end_walk_at_be()" to the asoc tree
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

   ASoC: soc-pcm: use dai_get_widget() at dpcm_end_walk_at_be()

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

From c2cd821603c216a6a7242b2b4c1a093051e26aaf Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 17 Feb 2020 17:27:48 +0900
Subject: [PATCH] ASoC: soc-pcm: use dai_get_widget() at dpcm_end_walk_at_be()

dpcm_end_walk_at_be() has very duplicate code.

	dpcm_end_walk_at_be() {
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
Link: https://lore.kernel.org/r/87eeutboul.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 37 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index b708db972310..7d4419ae63f6 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1297,34 +1297,29 @@ static bool dpcm_end_walk_at_be(struct snd_soc_dapm_widget *widget,
 {
 	struct snd_soc_card *card = widget->dapm->card;
 	struct snd_soc_pcm_runtime *rtd;
+	struct snd_soc_dapm_widget *w;
 	struct snd_soc_dai *dai;
+	int stream;
 	int i;
 
-	if (dir == SND_SOC_DAPM_DIR_OUT) {
-		for_each_card_rtds(card, rtd) {
-			if (!rtd->dai_link->no_pcm)
-				continue;
+	/* adjust dir to stream */
+	if (dir == SND_SOC_DAPM_DIR_OUT)
+		stream = SNDRV_PCM_STREAM_PLAYBACK;
+	else
+		stream = SNDRV_PCM_STREAM_CAPTURE;
 
-			if (rtd->cpu_dai->playback_widget == widget)
-				return true;
+	for_each_card_rtds(card, rtd) {
+		if (!rtd->dai_link->no_pcm)
+			continue;
 
-			for_each_rtd_codec_dai(rtd, i, dai) {
-				if (dai->playback_widget == widget)
-					return true;
-			}
-		}
-	} else { /* SND_SOC_DAPM_DIR_IN */
-		for_each_card_rtds(card, rtd) {
-			if (!rtd->dai_link->no_pcm)
-				continue;
+		w = dai_get_widget(rtd->cpu_dai, stream);
+		if (w == widget)
+			return true;
 
-			if (rtd->cpu_dai->capture_widget == widget)
+		for_each_rtd_codec_dai(rtd, i, dai) {
+			w = dai_get_widget(dai, stream);
+			if (w == widget)
 				return true;
-
-			for_each_rtd_codec_dai(rtd, i, dai) {
-				if (dai->capture_widget == widget)
-					return true;
-			}
 		}
 	}
 
-- 
2.20.1

