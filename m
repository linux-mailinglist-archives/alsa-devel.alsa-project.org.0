Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55627195A2D
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 16:45:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61DBD15F9;
	Fri, 27 Mar 2020 16:44:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61DBD15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585323928;
	bh=illVQ4XGFWSZa4iCAY/i0ormBAeyXU2SMMpFZb97sN4=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=vkV0zURIsmcWIiNcTYjmEO7pd1D9YYU3nuycdlrW6elA99cFxMrj4LoGeLQhW2nO3
	 KPqKM8ImCDDWodBqRRAw0ZEx+TdRrYxZAaukEWNlCmCYf7TTwlDixu8xbkP7iJu2f4
	 qrxhtoS7uBiD1O1ArUM8N1MkbjBlFfVhxuw5QwNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B070F80347;
	Fri, 27 Mar 2020 16:34:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6395DF80347; Fri, 27 Mar 2020 16:34:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 34A5CF8033D
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 16:34:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34A5CF8033D
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A925D1FB;
 Fri, 27 Mar 2020 08:34:43 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 29C963F71F;
 Fri, 27 Mar 2020 08:34:43 -0700 (PDT)
Date: Fri, 27 Mar 2020 15:34:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: uniphier: use asoc_rtd_to_cpu() / asoc_rtd_to_codec()
 macro for DAI pointer" to the asoc tree
In-Reply-To: <87369zir3b.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87369zir3b.wl-kuninori.morimoto.gx@renesas.com>
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

   ASoC: uniphier: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer

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

From 41759f4c43f1152d785ae74e31991a4ad8dd7ad8 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 23 Mar 2020 14:21:28 +0900
Subject: [PATCH] ASoC: uniphier: use asoc_rtd_to_cpu() / asoc_rtd_to_codec()
 macro for DAI pointer

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87369zir3b.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/uniphier/aio-compress.c | 22 +++++++++++-----------
 sound/soc/uniphier/aio-dma.c      |  6 +++---
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/uniphier/aio-compress.c b/sound/soc/uniphier/aio-compress.c
index 17f773ac5ca1..232d3cc5bce0 100644
--- a/sound/soc/uniphier/aio-compress.c
+++ b/sound/soc/uniphier/aio-compress.c
@@ -23,7 +23,7 @@ static int uniphier_aio_comprdma_new(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_compr *compr = rtd->compr;
 	struct device *dev = compr->card->dev;
-	struct uniphier_aio *aio = uniphier_priv(rtd->cpu_dai);
+	struct uniphier_aio *aio = uniphier_priv(asoc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[compr->direction];
 	size_t size = AUD_RING_SIZE;
 	int dma_dir = DMA_FROM_DEVICE, ret;
@@ -56,7 +56,7 @@ static int uniphier_aio_comprdma_free(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_compr *compr = rtd->compr;
 	struct device *dev = compr->card->dev;
-	struct uniphier_aio *aio = uniphier_priv(rtd->cpu_dai);
+	struct uniphier_aio *aio = uniphier_priv(asoc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[compr->direction];
 	int dma_dir = DMA_FROM_DEVICE;
 
@@ -73,7 +73,7 @@ static int uniphier_aio_comprdma_free(struct snd_soc_pcm_runtime *rtd)
 static int uniphier_aio_compr_open(struct snd_compr_stream *cstream)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
-	struct uniphier_aio *aio = uniphier_priv(rtd->cpu_dai);
+	struct uniphier_aio *aio = uniphier_priv(asoc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[cstream->direction];
 	int ret;
 
@@ -98,7 +98,7 @@ static int uniphier_aio_compr_open(struct snd_compr_stream *cstream)
 static int uniphier_aio_compr_free(struct snd_compr_stream *cstream)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
-	struct uniphier_aio *aio = uniphier_priv(rtd->cpu_dai);
+	struct uniphier_aio *aio = uniphier_priv(asoc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[cstream->direction];
 	int ret;
 
@@ -118,7 +118,7 @@ static int uniphier_aio_compr_get_params(struct snd_compr_stream *cstream,
 					 struct snd_codec *params)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
-	struct uniphier_aio *aio = uniphier_priv(rtd->cpu_dai);
+	struct uniphier_aio *aio = uniphier_priv(asoc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[cstream->direction];
 
 	*params = sub->cparams.codec;
@@ -130,7 +130,7 @@ static int uniphier_aio_compr_set_params(struct snd_compr_stream *cstream,
 					 struct snd_compr_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
-	struct uniphier_aio *aio = uniphier_priv(rtd->cpu_dai);
+	struct uniphier_aio *aio = uniphier_priv(asoc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[cstream->direction];
 	struct device *dev = &aio->chip->pdev->dev;
 	int ret;
@@ -165,7 +165,7 @@ static int uniphier_aio_compr_set_params(struct snd_compr_stream *cstream,
 static int uniphier_aio_compr_hw_free(struct snd_compr_stream *cstream)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
-	struct uniphier_aio *aio = uniphier_priv(rtd->cpu_dai);
+	struct uniphier_aio *aio = uniphier_priv(asoc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[cstream->direction];
 
 	sub->setting = 0;
@@ -177,7 +177,7 @@ static int uniphier_aio_compr_prepare(struct snd_compr_stream *cstream)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_compr_runtime *runtime = cstream->runtime;
-	struct uniphier_aio *aio = uniphier_priv(rtd->cpu_dai);
+	struct uniphier_aio *aio = uniphier_priv(asoc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[cstream->direction];
 	int bytes = runtime->fragment_size;
 	unsigned long flags;
@@ -215,7 +215,7 @@ static int uniphier_aio_compr_trigger(struct snd_compr_stream *cstream,
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_compr_runtime *runtime = cstream->runtime;
-	struct uniphier_aio *aio = uniphier_priv(rtd->cpu_dai);
+	struct uniphier_aio *aio = uniphier_priv(asoc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[cstream->direction];
 	struct device *dev = &aio->chip->pdev->dev;
 	int bytes = runtime->fragment_size, ret = 0;
@@ -248,7 +248,7 @@ static int uniphier_aio_compr_pointer(struct snd_compr_stream *cstream,
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_compr_runtime *runtime = cstream->runtime;
-	struct uniphier_aio *aio = uniphier_priv(rtd->cpu_dai);
+	struct uniphier_aio *aio = uniphier_priv(asoc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[cstream->direction];
 	int bytes = runtime->fragment_size;
 	unsigned long flags;
@@ -322,7 +322,7 @@ static int uniphier_aio_compr_copy(struct snd_compr_stream *cstream,
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_compr_runtime *runtime = cstream->runtime;
 	struct device *carddev = rtd->compr->card->dev;
-	struct uniphier_aio *aio = uniphier_priv(rtd->cpu_dai);
+	struct uniphier_aio *aio = uniphier_priv(asoc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[cstream->direction];
 	size_t cnt = min_t(size_t, count, aio_rb_space_to_end(sub) / 2);
 	int bytes = runtime->fragment_size;
diff --git a/sound/soc/uniphier/aio-dma.c b/sound/soc/uniphier/aio-dma.c
index da83423c52e2..4bbcb007df41 100644
--- a/sound/soc/uniphier/aio-dma.c
+++ b/sound/soc/uniphier/aio-dma.c
@@ -109,7 +109,7 @@ static int uniphier_aiodma_prepare(struct snd_soc_component *component,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
-	struct uniphier_aio *aio = uniphier_priv(rtd->cpu_dai);
+	struct uniphier_aio *aio = uniphier_priv(asoc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[substream->stream];
 	int bytes = runtime->period_size *
 		runtime->channels * samples_to_bytes(runtime, 1);
@@ -136,7 +136,7 @@ static int uniphier_aiodma_trigger(struct snd_soc_component *component,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
-	struct uniphier_aio *aio = uniphier_priv(rtd->cpu_dai);
+	struct uniphier_aio *aio = uniphier_priv(asoc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[substream->stream];
 	struct device *dev = &aio->chip->pdev->dev;
 	int bytes = runtime->period_size *
@@ -172,7 +172,7 @@ static snd_pcm_uframes_t uniphier_aiodma_pointer(
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
-	struct uniphier_aio *aio = uniphier_priv(rtd->cpu_dai);
+	struct uniphier_aio *aio = uniphier_priv(asoc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[substream->stream];
 	int bytes = runtime->period_size *
 		runtime->channels * samples_to_bytes(runtime, 1);
-- 
2.20.1

