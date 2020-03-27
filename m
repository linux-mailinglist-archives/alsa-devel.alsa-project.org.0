Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A59195A7D
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 16:59:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C878E1691;
	Fri, 27 Mar 2020 16:58:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C878E1691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585324781;
	bh=SKnh+05AgFL1O+rdLZfn1EYmIO3F8rNySOLUFEpSXwE=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Pb/S5dpfyLrqe7UqI+aAwPf4gIh2A5+OIQp5W4cJbFanUh139H9DNxA8reibOixo/
	 2F4OZj5RILTbdBm+DrqnvSa8reTxI1ZgIb+VkAXg7kUTXgl+RkAiUpYb+HEzNd1a4T
	 RSfLJDfSwsBoPZU6rRUCMTdLqKQB79JyI1JZtDFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC46AF80480;
	Fri, 27 Mar 2020 16:36:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D229F80477; Fri, 27 Mar 2020 16:36:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_76, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id D7BC9F8046F
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 16:36:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7BC9F8046F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B4061FB;
 Fri, 27 Mar 2020 08:36:32 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C29FB3F71F;
 Fri, 27 Mar 2020 08:36:31 -0700 (PDT)
Date: Fri, 27 Mar 2020 15:36:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: au1x: use asoc_rtd_to_cpu() / asoc_rtd_to_codec()
 macro for DAI pointer" to the asoc tree
In-Reply-To: <871rpjk5tw.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-871rpjk5tw.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
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

The patch

   ASoC: au1x: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer

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

From 11a828fa8b426a949ce2759e30399695b58114a2 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 23 Mar 2020 14:17:47 +0900
Subject: [PATCH] ASoC: au1x: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro
 for DAI pointer

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/871rpjk5tw.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/au1x/db1200.c   | 2 +-
 sound/soc/au1x/dbdma2.c   | 2 +-
 sound/soc/au1x/dma.c      | 2 +-
 sound/soc/au1x/psc-ac97.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/au1x/db1200.c b/sound/soc/au1x/db1200.c
index d6b692fff29a..d649037bda9b 100644
--- a/sound/soc/au1x/db1200.c
+++ b/sound/soc/au1x/db1200.c
@@ -95,7 +95,7 @@ static struct snd_soc_card db1550_ac97_machine = {
 static int db1200_i2s_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 
 	/* WM8731 has its own 12MHz crystal */
 	snd_soc_dai_set_sysclk(codec_dai, WM8731_SYSCLK_XTAL,
diff --git a/sound/soc/au1x/dbdma2.c b/sound/soc/au1x/dbdma2.c
index 8f855644c6b4..e82bbf2d1eea 100644
--- a/sound/soc/au1x/dbdma2.c
+++ b/sound/soc/au1x/dbdma2.c
@@ -281,7 +281,7 @@ static int au1xpsc_pcm_open(struct snd_soc_component *component,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	int stype = substream->stream, *dmaids;
 
-	dmaids = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
+	dmaids = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
 	if (!dmaids)
 		return -ENODEV;	/* whoa, has ordering changed? */
 
diff --git a/sound/soc/au1x/dma.c b/sound/soc/au1x/dma.c
index c9a038a5e2d3..4e246c7e78f2 100644
--- a/sound/soc/au1x/dma.c
+++ b/sound/soc/au1x/dma.c
@@ -195,7 +195,7 @@ static int alchemy_pcm_open(struct snd_soc_component *component,
 	int *dmaids, s = substream->stream;
 	char *name;
 
-	dmaids = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
+	dmaids = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
 	if (!dmaids)
 		return -ENODEV;	/* whoa, has ordering changed? */
 
diff --git a/sound/soc/au1x/psc-ac97.c b/sound/soc/au1x/psc-ac97.c
index 0227993c5da8..05eb36991f14 100644
--- a/sound/soc/au1x/psc-ac97.c
+++ b/sound/soc/au1x/psc-ac97.c
@@ -58,7 +58,7 @@ static struct au1xpsc_audio_data *au1xpsc_ac97_workdata;
 static inline struct au1xpsc_audio_data *ac97_to_pscdata(struct snd_ac97 *x)
 {
 	struct snd_soc_card *c = x->bus->card->private_data;
-	return snd_soc_dai_get_drvdata(c->rtd->cpu_dai);
+	return snd_soc_dai_get_drvdata(c->asoc_rtd_to_cpu(rtd, 0));
 }
 
 #else
-- 
2.20.1

