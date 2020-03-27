Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0643195A3D
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 16:48:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 827551688;
	Fri, 27 Mar 2020 16:47:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 827551688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585324097;
	bh=pGg8nEVCXPN+HJvynUm8VERSYRj/ZRDaQXJv92PRWLs=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Xa0M1h/RXJY+Kwd7MXBxDfDfUSptFdH7IUZsRJx9DNkypuHV15LPuSQSAQF07ghX9
	 m4YKHZG/YpRp1WtUs6RCmgJ45EGEjHgkyWtFVAVPbW92fGIjffTbdLXdX5hpmyl3BB
	 BEsfTsyjBst/8VyyZ94CSdvK5GBGfF2RcBUle/pc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EFBBF8037D;
	Fri, 27 Mar 2020 16:35:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D957F80377; Fri, 27 Mar 2020 16:35:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 34781F80369
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 16:35:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34781F80369
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EAD31FB;
 Fri, 27 Mar 2020 08:35:06 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A76593F71F;
 Fri, 27 Mar 2020 08:35:05 -0700 (PDT)
Date: Fri, 27 Mar 2020 15:35:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: stm: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro
 for DAI pointer" to the asoc tree
In-Reply-To: <87a747ir4b.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87a747ir4b.wl-kuninori.morimoto.gx@renesas.com>
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

   ASoC: stm: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer

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

From b1bee67c327de14bc7e9a84c91892747ee1f9ab0 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 23 Mar 2020 14:20:52 +0900
Subject: [PATCH] ASoC: stm: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro
 for DAI pointer

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87a747ir4b.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/stm/stm32_adfsdm.c  | 12 ++++++------
 sound/soc/stm/stm32_sai_sub.c |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index 51407a21c440..16ff02953015 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -215,7 +215,7 @@ static int stm32_adfsdm_trigger(struct snd_soc_component *component,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct stm32_adfsdm_priv *priv =
-		snd_soc_dai_get_drvdata(rtd->cpu_dai);
+		snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -235,7 +235,7 @@ static int stm32_adfsdm_pcm_open(struct snd_soc_component *component,
 				 struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct stm32_adfsdm_priv *priv = snd_soc_dai_get_drvdata(rtd->cpu_dai);
+	struct stm32_adfsdm_priv *priv = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 	int ret;
 
 	ret =  snd_soc_set_runtime_hwparams(substream, &stm32_adfsdm_pcm_hw);
@@ -250,7 +250,7 @@ static int stm32_adfsdm_pcm_close(struct snd_soc_component *component,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct stm32_adfsdm_priv *priv =
-		snd_soc_dai_get_drvdata(rtd->cpu_dai);
+		snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 
 	priv->substream = NULL;
 
@@ -263,7 +263,7 @@ static snd_pcm_uframes_t stm32_adfsdm_pcm_pointer(
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct stm32_adfsdm_priv *priv =
-		snd_soc_dai_get_drvdata(rtd->cpu_dai);
+		snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 
 	return bytes_to_frames(substream->runtime, priv->pos);
 }
@@ -274,7 +274,7 @@ static int stm32_adfsdm_pcm_hw_params(struct snd_soc_component *component,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct stm32_adfsdm_priv *priv =
-		snd_soc_dai_get_drvdata(rtd->cpu_dai);
+		snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 
 	priv->pcm_buff = substream->runtime->dma_area;
 
@@ -287,7 +287,7 @@ static int stm32_adfsdm_pcm_new(struct snd_soc_component *component,
 {
 	struct snd_pcm *pcm = rtd->pcm;
 	struct stm32_adfsdm_priv *priv =
-		snd_soc_dai_get_drvdata(rtd->cpu_dai);
+		snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 	unsigned int size = DFSDM_MAX_PERIODS * DFSDM_MAX_PERIOD_SIZE;
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index fe4903260d4e..2bd280c01c33 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1238,7 +1238,7 @@ static int stm32_sai_pcm_process_spdif(struct snd_pcm_substream *substream,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct stm32_sai_sub_data *sai = dev_get_drvdata(cpu_dai->dev);
 	int *ptr = (int *)(runtime->dma_area + hwoff +
 			   channel * (runtime->dma_bytes / runtime->channels));
-- 
2.20.1

