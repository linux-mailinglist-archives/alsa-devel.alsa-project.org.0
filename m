Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CA9CFAC3
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 14:59:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AC101616;
	Tue,  8 Oct 2019 14:58:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AC101616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570539565;
	bh=GQ86Wfidts0OE8mYK7ieqsYJIGCp+zSGi4BddcdN6dI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=CzjAWnVaJYD3BpWikek59bNTLDhNtdj+ZkHqaxaIy4uDvCizvYMvXZTab0AV+ziOz
	 ZphFgKMP3HiiMH7G2g7g72v+6wUeJ5WmGaFMWDMx4dmKRmTh7liwqFAqaLjdWWGiUD
	 lz+0TFs4SAmYzdIy+mq3CuqfzBUDrHRwanaT1Cq0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 740E8F8070C;
	Tue,  8 Oct 2019 14:53:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E23C8F8065A; Tue,  8 Oct 2019 14:53:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD3C7F8038F
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD3C7F8038F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="LHGZxK8c"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=nJbDa23/n+MdV0gwmK3lwG7XFLsWrhKAAcP+rl146e4=; b=LHGZxK8cZI6e
 VOPULEFWOqixecKFBJYKoEs64XhPtTGQ74hJNXbJGP3+ITnAZsT5j1P6KMyz4Vp6alUv22DIdXZtK
 gay/LeUbj/un72Q9dg3kTRrN/GpvlNX0rYbPIRysWOh3aS4xgTfJcyKP9s0hRPQ9ttOokvBNSGvni
 kg2/o=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozW-0008ML-EW; Tue, 08 Oct 2019 12:53:26 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id DF4B62740D4B; Tue,  8 Oct 2019 13:53:25 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bluz90d1.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125325.DF4B62740D4B@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:25 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: fsl: fsl_dma: remove snd_pcm_ops" to
	the asoc tree
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

   ASoC: fsl: fsl_dma: remove snd_pcm_ops

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

From 4ac85de9977e7361ef10be23a33313f3cf56e073 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:34:34 +0900
Subject: [PATCH] ASoC: fsl: fsl_dma: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87bluz90d1.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_dma.c | 50 +++++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 27 deletions(-)

diff --git a/sound/soc/fsl/fsl_dma.c b/sound/soc/fsl/fsl_dma.c
index e22508301412..bc8691a45131 100644
--- a/sound/soc/fsl/fsl_dma.c
+++ b/sound/soc/fsl/fsl_dma.c
@@ -280,7 +280,8 @@ static irqreturn_t fsl_dma_isr(int irq, void *dev_id)
  * Regardless of where the memory is actually allocated, since the device can
  * technically DMA to any 36-bit address, we do need to set the DMA mask to 36.
  */
-static int fsl_dma_new(struct snd_soc_pcm_runtime *rtd)
+static int fsl_dma_new(struct snd_soc_component *component,
+		       struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_card *card = rtd->card->snd_card;
 	struct snd_pcm *pcm = rtd->pcm;
@@ -380,11 +381,10 @@ static int fsl_dma_new(struct snd_soc_pcm_runtime *rtd)
  *    buffer, which is what ALSA expects.  We're just dividing it into
  *    contiguous parts, and creating a link descriptor for each one.
  */
-static int fsl_dma_open(struct snd_pcm_substream *substream)
+static int fsl_dma_open(struct snd_soc_component *component,
+			struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct device *dev = component->dev;
 	struct dma_object *dma =
 		container_of(component->driver, struct dma_object, dai);
@@ -533,13 +533,12 @@ static int fsl_dma_open(struct snd_pcm_substream *substream)
  * and 8 bytes at a time).  So we do not support packed 24-bit samples.
  * 24-bit data must be padded to 32 bits.
  */
-static int fsl_dma_hw_params(struct snd_pcm_substream *substream,
-	struct snd_pcm_hw_params *hw_params)
+static int fsl_dma_hw_params(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *hw_params)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct fsl_dma_private *dma_private = runtime->private_data;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct device *dev = component->dev;
 
 	/* Number of bits per sample */
@@ -698,12 +697,11 @@ static int fsl_dma_hw_params(struct snd_pcm_substream *substream,
  * The base address of the buffer is stored in the source_addr field of the
  * first link descriptor.
  */
-static snd_pcm_uframes_t fsl_dma_pointer(struct snd_pcm_substream *substream)
+static snd_pcm_uframes_t fsl_dma_pointer(struct snd_soc_component *component,
+					 struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct fsl_dma_private *dma_private = runtime->private_data;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct device *dev = component->dev;
 	struct ccsr_dma_channel __iomem *dma_channel = dma_private->dma_channel;
 	dma_addr_t position;
@@ -763,7 +761,8 @@ static snd_pcm_uframes_t fsl_dma_pointer(struct snd_pcm_substream *substream)
  *
  * This function can be called multiple times.
  */
-static int fsl_dma_hw_free(struct snd_pcm_substream *substream)
+static int fsl_dma_hw_free(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct fsl_dma_private *dma_private = runtime->private_data;
@@ -796,12 +795,11 @@ static int fsl_dma_hw_free(struct snd_pcm_substream *substream)
 /**
  * fsl_dma_close: close the stream.
  */
-static int fsl_dma_close(struct snd_pcm_substream *substream)
+static int fsl_dma_close(struct snd_soc_component *component,
+			 struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct fsl_dma_private *dma_private = runtime->private_data;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct device *dev = component->dev;
 	struct dma_object *dma =
 		container_of(component->driver, struct dma_object, dai);
@@ -824,7 +822,8 @@ static int fsl_dma_close(struct snd_pcm_substream *substream)
 /*
  * Remove this PCM driver.
  */
-static void fsl_dma_free_dma_buffers(struct snd_pcm *pcm)
+static void fsl_dma_free_dma_buffers(struct snd_soc_component *component,
+				     struct snd_pcm *pcm)
 {
 	struct snd_pcm_substream *substream;
 	unsigned int i;
@@ -872,15 +871,6 @@ static struct device_node *find_ssi_node(struct device_node *dma_channel_np)
 	return NULL;
 }
 
-static const struct snd_pcm_ops fsl_dma_ops = {
-	.open   	= fsl_dma_open,
-	.close  	= fsl_dma_close,
-	.ioctl  	= snd_pcm_lib_ioctl,
-	.hw_params      = fsl_dma_hw_params,
-	.hw_free	= fsl_dma_hw_free,
-	.pointer	= fsl_dma_pointer,
-};
-
 static int fsl_soc_dma_probe(struct platform_device *pdev)
 {
 	struct dma_object *dma;
@@ -913,8 +903,14 @@ static int fsl_soc_dma_probe(struct platform_device *pdev)
 
 	dma->dai.name = DRV_NAME;
 	dma->dai.ops = &fsl_dma_ops;
-	dma->dai.pcm_new = fsl_dma_new;
-	dma->dai.pcm_free = fsl_dma_free_dma_buffers;
+	dma->dai.open = fsl_dma_open;
+	dma->dai.close = fsl_dma_close;
+	dma->dai.ioctl = snd_soc_pcm_lib_ioctl;
+	dma->dai.hw_params = fsl_dma_hw_params;
+	dma->dai.hw_free = fsl_dma_hw_free;
+	dma->dai.pointer = fsl_dma_pointer;
+	dma->dai.pcm_construct = fsl_dma_new;
+	dma->dai.pcm_destruct = fsl_dma_free_dma_buffers;
 
 	/* Store the SSI-specific information that we need */
 	dma->ssi_stx_phys = res.start + REG_SSI_STX0;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
