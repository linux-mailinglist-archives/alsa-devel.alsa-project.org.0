Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2611831FF
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 14:49:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AE2B16F1;
	Thu, 12 Mar 2020 14:48:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AE2B16F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584020958;
	bh=7xyV5glIMZ+HaQOdkx9GECemgw2YAoAcnVNXJa4UHjY=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=YMOWingvwrojiVna3CZnFaIApAso3Lmv1YlL0N0zqDmPdnhDEQHzzLCHY27XxlKc+
	 ITjjcgpikQvOR10RdPl/6+RlA+uwsgL3+2Nfj6vlwzptBGaOCehWlNfPKmHji0fS56
	 5HVAcsSy31V65ZcO4uMPW/Hce+7hJdDqv5+TNbjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E372F8028F;
	Thu, 12 Mar 2020 14:46:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D3FFF8028E; Thu, 12 Mar 2020 14:46:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 616A3F801D9;
 Thu, 12 Mar 2020 14:46:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 616A3F801D9
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 570C930E;
 Thu, 12 Mar 2020 06:46:24 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CED393F534;
 Thu, 12 Mar 2020 06:46:23 -0700 (PDT)
Date: Thu, 12 Mar 2020 13:46:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Applied "ASoC: (cosmetic) simplify dpcm_prune_paths()" to the asoc
 tree
In-Reply-To: <20200312095214.15126-2-guennadi.liakhovetski@linux.intel.com>
Message-Id: <applied-20200312095214.15126-2-guennadi.liakhovetski@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, sound-open-firmware@alsa-project.org
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

   ASoC: (cosmetic) simplify dpcm_prune_paths()

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

From 8cce6569e417f557781fe7f3a84667e611c3a160 Mon Sep 17 00:00:00 2001
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Date: Thu, 12 Mar 2020 10:52:13 +0100
Subject: [PATCH] ASoC: (cosmetic) simplify dpcm_prune_paths()

Currently dpcm_prune_paths() has up to 4 nested condition and loop
levels, which forces the code to use flags for flow control.
Extracting widget status verification code from dpcm_prune_paths()
into a separate function simplifies the code.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Link: https://lore.kernel.org/r/20200312095214.15126-2-guennadi.liakhovetski@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 63 +++++++++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 733d7e8a0e55..bf4c5dc903ce 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1626,45 +1626,46 @@ void dpcm_path_put(struct snd_soc_dapm_widget_list **list)
 	snd_soc_dapm_dai_free_widgets(list);
 }
 
-static int dpcm_prune_paths(struct snd_soc_pcm_runtime *fe, int stream,
-	struct snd_soc_dapm_widget_list **list_)
+static bool dpcm_be_is_active(struct snd_soc_dpcm *dpcm, int stream,
+			      struct snd_soc_dapm_widget_list *list)
 {
-	struct snd_soc_dpcm *dpcm;
-	struct snd_soc_dapm_widget_list *list = *list_;
 	struct snd_soc_dapm_widget *widget;
 	struct snd_soc_dai *dai;
-	int prune = 0;
-	int do_prune;
+	unsigned int i;
 
-	/* Destroy any old FE <--> BE connections */
-	for_each_dpcm_be(fe, stream, dpcm) {
-		unsigned int i;
+	/* is there a valid CPU DAI widget for this BE */
+	for_each_rtd_cpu_dais(dpcm->be, i, dai) {
+		widget = snd_soc_dai_get_widget(dai, stream);
 
-		/* is there a valid CPU DAI widget for this BE */
-		do_prune = 1;
-		for_each_rtd_cpu_dais(dpcm->be, i, dai) {
-			widget = snd_soc_dai_get_widget(dai, stream);
+		/*
+		 * The BE is pruned only if none of the cpu_dai
+		 * widgets are in the active list.
+		 */
+		if (widget && widget_in_list(list, widget))
+			return true;
+	}
 
-			/*
-			 * The BE is pruned only if none of the cpu_dai
-			 * widgets are in the active list.
-			 */
-			if (widget && widget_in_list(list, widget))
-				do_prune = 0;
-		}
-		if (!do_prune)
-			continue;
+	/* is there a valid CODEC DAI widget for this BE */
+	for_each_rtd_codec_dais(dpcm->be, i, dai) {
+		widget = snd_soc_dai_get_widget(dai, stream);
 
-		/* is there a valid CODEC DAI widget for this BE */
-		do_prune = 1;
-		for_each_rtd_codec_dais(dpcm->be, i, dai) {
-			widget = snd_soc_dai_get_widget(dai, stream);
+		/* prune the BE if it's no longer in our active list */
+		if (widget && widget_in_list(list, widget))
+			return true;
+	}
 
-			/* prune the BE if it's no longer in our active list */
-			if (widget && widget_in_list(list, widget))
-				do_prune = 0;
-		}
-		if (!do_prune)
+	return false;
+}
+
+static int dpcm_prune_paths(struct snd_soc_pcm_runtime *fe, int stream,
+			    struct snd_soc_dapm_widget_list **list_)
+{
+	struct snd_soc_dpcm *dpcm;
+	int prune = 0;
+
+	/* Destroy any old FE <--> BE connections */
+	for_each_dpcm_be(fe, stream, dpcm) {
+		if (dpcm_be_is_active(dpcm, stream, *list_))
 			continue;
 
 		dev_dbg(fe->dev, "ASoC: pruning %s BE %s for %s\n",
-- 
2.20.1

