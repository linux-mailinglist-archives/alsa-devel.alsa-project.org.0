Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F019CCFB15
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:14:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D877168C;
	Tue,  8 Oct 2019 15:13:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D877168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570540481;
	bh=rDu+hT983oq8KPi8Gx8ci8IDp/Z+FqMqMgggPC+LXyU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=cufw3WJTPI1ffJwSUaqEea94WaELLNGNlwOefbb8YoHQX9lFbygNoo6we9s7slwEC
	 44AIO4Pxdhq4sAnpXACFyUYepzXwPgq1o21rPx6vfpHXI+5/mevCvgz+esURtWQ1Hm
	 FjQuFAMMFZ6oovahEVnDEQqiVa0bTrFIs+ZBRWVI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19E48F80C17;
	Tue,  8 Oct 2019 14:54:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3BF1F80765; Tue,  8 Oct 2019 14:54:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52A40F8063D
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52A40F8063D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="jhuvGvnU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=EWeKaFmJi9ItD7Xt+oaCnYYHSDbu7VnvDcaDnLuu90s=; b=jhuvGvnUzEFt
 DWiLWLbaLhg4UY+2B/3uvqP8VsqzMCPw76uOLgtTBG++hsyvYCMcggujvlVdi4Qlu3uO+Gh1nZMw1
 hYhjE5nbLj9UefNOuUvqx7wm3SWdHqiDwaT4QavJMNkHOxhyLbGh+vjj0j5b0iomyOo8ujlei0xpe
 uYnA4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozb-0008Oa-UD; Tue, 08 Oct 2019 12:53:32 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 6BA862740D4A; Tue,  8 Oct 2019 13:53:31 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878sq3af0r.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125331.6BA862740D4A@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:31 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: uniphier: aio-dma: remove snd_pcm_ops"
	to the asoc tree
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

   ASoC: uniphier: aio-dma: remove snd_pcm_ops

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From c645ea1179a4c22ddf58f32be7f69284eae98566 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:32:36 +0900
Subject: [PATCH] ASoC: uniphier: aio-dma: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/878sq3af0r.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/uniphier/aio-dma.c | 51 ++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 23 deletions(-)

diff --git a/sound/soc/uniphier/aio-dma.c b/sound/soc/uniphier/aio-dma.c
index e8446cc4e8f8..700d936ed94e 100644
--- a/sound/soc/uniphier/aio-dma.c
+++ b/sound/soc/uniphier/aio-dma.c
@@ -93,7 +93,8 @@ static irqreturn_t aiodma_irq(int irq, void *p)
 	return ret;
 }
 
-static int uniphier_aiodma_open(struct snd_pcm_substream *substream)
+static int uniphier_aiodma_open(struct snd_soc_component *component,
+				struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
@@ -103,7 +104,8 @@ static int uniphier_aiodma_open(struct snd_pcm_substream *substream)
 		SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 256);
 }
 
-static int uniphier_aiodma_hw_params(struct snd_pcm_substream *substream,
+static int uniphier_aiodma_hw_params(struct snd_soc_component *component,
+				     struct snd_pcm_substream *substream,
 				     struct snd_pcm_hw_params *params)
 {
 	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
@@ -112,7 +114,8 @@ static int uniphier_aiodma_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int uniphier_aiodma_hw_free(struct snd_pcm_substream *substream)
+static int uniphier_aiodma_hw_free(struct snd_soc_component *component,
+				   struct snd_pcm_substream *substream)
 {
 	snd_pcm_set_runtime_buffer(substream, NULL);
 	substream->runtime->dma_bytes = 0;
@@ -120,7 +123,8 @@ static int uniphier_aiodma_hw_free(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int uniphier_aiodma_prepare(struct snd_pcm_substream *substream)
+static int uniphier_aiodma_prepare(struct snd_soc_component *component,
+				   struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
@@ -146,7 +150,8 @@ static int uniphier_aiodma_prepare(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int uniphier_aiodma_trigger(struct snd_pcm_substream *substream, int cmd)
+static int uniphier_aiodma_trigger(struct snd_soc_component *component,
+				   struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
@@ -181,6 +186,7 @@ static int uniphier_aiodma_trigger(struct snd_pcm_substream *substream, int cmd)
 }
 
 static snd_pcm_uframes_t uniphier_aiodma_pointer(
+					struct snd_soc_component *component,
 					struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -204,7 +210,8 @@ static snd_pcm_uframes_t uniphier_aiodma_pointer(
 	return pos;
 }
 
-static int uniphier_aiodma_mmap(struct snd_pcm_substream *substream,
+static int uniphier_aiodma_mmap(struct snd_soc_component *component,
+				struct snd_pcm_substream *substream,
 				struct vm_area_struct *vma)
 {
 	vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
@@ -214,18 +221,8 @@ static int uniphier_aiodma_mmap(struct snd_pcm_substream *substream,
 			       vma->vm_end - vma->vm_start, vma->vm_page_prot);
 }
 
-static const struct snd_pcm_ops uniphier_aiodma_ops = {
-	.open      = uniphier_aiodma_open,
-	.ioctl     = snd_pcm_lib_ioctl,
-	.hw_params = uniphier_aiodma_hw_params,
-	.hw_free   = uniphier_aiodma_hw_free,
-	.prepare   = uniphier_aiodma_prepare,
-	.trigger   = uniphier_aiodma_trigger,
-	.pointer   = uniphier_aiodma_pointer,
-	.mmap      = uniphier_aiodma_mmap,
-};
-
-static int uniphier_aiodma_new(struct snd_soc_pcm_runtime *rtd)
+static int uniphier_aiodma_new(struct snd_soc_component *component,
+			       struct snd_soc_pcm_runtime *rtd)
 {
 	struct device *dev = rtd->card->snd_card->dev;
 	struct snd_pcm *pcm = rtd->pcm;
@@ -242,16 +239,24 @@ static int uniphier_aiodma_new(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
-static void uniphier_aiodma_free(struct snd_pcm *pcm)
+static void uniphier_aiodma_free(struct snd_soc_component *component,
+				 struct snd_pcm *pcm)
 {
 	snd_pcm_lib_preallocate_free_for_all(pcm);
 }
 
 static const struct snd_soc_component_driver uniphier_soc_platform = {
-	.pcm_new   = uniphier_aiodma_new,
-	.pcm_free  = uniphier_aiodma_free,
-	.ops       = &uniphier_aiodma_ops,
-	.compr_ops = &uniphier_aio_compr_ops,
+	.open		= uniphier_aiodma_open,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.hw_params	= uniphier_aiodma_hw_params,
+	.hw_free	= uniphier_aiodma_hw_free,
+	.prepare	= uniphier_aiodma_prepare,
+	.trigger	= uniphier_aiodma_trigger,
+	.pointer	= uniphier_aiodma_pointer,
+	.mmap		= uniphier_aiodma_mmap,
+	.pcm_construct	= uniphier_aiodma_new,
+	.pcm_destruct	= uniphier_aiodma_free,
+	.compr_ops	= &uniphier_aio_compr_ops,
 };
 
 static const struct regmap_config aiodma_regmap_config = {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
