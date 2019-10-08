Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4F0CFAEF
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:08:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8677950;
	Tue,  8 Oct 2019 15:07:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8677950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570540092;
	bh=iZUh2ojrSTSrXPvCnBVFwaXfIgOr59pRmaA0gn6WdNU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Ju4BXuB/DVQr0nC25K7DhQdj2DRZglehlCPVD2D8XB8eMEtHrXeyhHGj89UeuOBaY
	 pHHBe7dIwvCgXnkYPI0KnGiZP7yxF3ejnI320bVk+64JTT9Nj/pU4d+1MBGN23cS/8
	 gyXciNg/OuxSeV5D7UIEB7zPOZRCSsm23QuEUlHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B75BF800BF;
	Tue,  8 Oct 2019 14:54:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EDA2F8071D; Tue,  8 Oct 2019 14:53:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 539DBF80633
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 539DBF80633
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="suFynw3x"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Cn5+6goNFk2sxtodoF0l7JZHZegARrzLxNxc3TB+L7Q=; b=suFynw3xk175
 9a54WzT3efmyYvvZohuqs+InQjdHIvLioaKGCJ1yNiVeY7PgrQHEvvcbBV5TxguS2SbxaVOYkEczN
 iYl/5M/Ps/KP0aH47zeHZyBuDl2yS7IRgKAtGzZkmFiWH1znsjDXEnRaxDTDaAROVdXAq2qNJG8Yl
 ncnAU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozZ-0008Nj-Sg; Tue, 08 Oct 2019 12:53:29 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 5DB592740D4A; Tue,  8 Oct 2019 13:53:29 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87v9t790f2.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125329.5DB592740D4A@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:29 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: samsung: idma: remove snd_pcm_ops" to
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

   ASoC: samsung: idma: remove snd_pcm_ops

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

From ba40ab6275173ef9b35b466324a25921a3f49b42 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:33:21 +0900
Subject: [PATCH] ASoC: samsung: idma: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87v9t790f2.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/idma.c | 58 ++++++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 26 deletions(-)

diff --git a/sound/soc/samsung/idma.c b/sound/soc/samsung/idma.c
index 65497cd477a5..294dce111b05 100644
--- a/sound/soc/samsung/idma.c
+++ b/sound/soc/samsung/idma.c
@@ -137,8 +137,9 @@ static void idma_done(void *id, int bytes_xfer)
 		snd_pcm_period_elapsed(substream);
 }
 
-static int idma_hw_params(struct snd_pcm_substream *substream,
-				struct snd_pcm_hw_params *params)
+static int idma_hw_params(struct snd_soc_component *component,
+			  struct snd_pcm_substream *substream,
+			  struct snd_pcm_hw_params *params)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct idma_ctrl *prtd = substream->runtime->private_data;
@@ -163,14 +164,16 @@ static int idma_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int idma_hw_free(struct snd_pcm_substream *substream)
+static int idma_hw_free(struct snd_soc_component *component,
+			struct snd_pcm_substream *substream)
 {
 	snd_pcm_set_runtime_buffer(substream, NULL);
 
 	return 0;
 }
 
-static int idma_prepare(struct snd_pcm_substream *substream)
+static int idma_prepare(struct snd_soc_component *component,
+			struct snd_pcm_substream *substream)
 {
 	struct idma_ctrl *prtd = substream->runtime->private_data;
 
@@ -183,7 +186,8 @@ static int idma_prepare(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int idma_trigger(struct snd_pcm_substream *substream, int cmd)
+static int idma_trigger(struct snd_soc_component *component,
+			struct snd_pcm_substream *substream, int cmd)
 {
 	struct idma_ctrl *prtd = substream->runtime->private_data;
 	int ret = 0;
@@ -216,7 +220,8 @@ static int idma_trigger(struct snd_pcm_substream *substream, int cmd)
 }
 
 static snd_pcm_uframes_t
-	idma_pointer(struct snd_pcm_substream *substream)
+idma_pointer(struct snd_soc_component *component,
+	     struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct idma_ctrl *prtd = runtime->private_data;
@@ -233,7 +238,8 @@ static snd_pcm_uframes_t
 	return bytes_to_frames(substream->runtime, res);
 }
 
-static int idma_mmap(struct snd_pcm_substream *substream,
+static int idma_mmap(struct snd_soc_component *component,
+		     struct snd_pcm_substream *substream,
 	struct vm_area_struct *vma)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -278,7 +284,8 @@ static irqreturn_t iis_irq(int irqno, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int idma_open(struct snd_pcm_substream *substream)
+static int idma_open(struct snd_soc_component *component,
+		     struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct idma_ctrl *prtd;
@@ -304,7 +311,8 @@ static int idma_open(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int idma_close(struct snd_pcm_substream *substream)
+static int idma_close(struct snd_soc_component *component,
+		      struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct idma_ctrl *prtd = runtime->private_data;
@@ -319,19 +327,8 @@ static int idma_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static const struct snd_pcm_ops idma_ops = {
-	.open		= idma_open,
-	.close		= idma_close,
-	.ioctl		= snd_pcm_lib_ioctl,
-	.trigger	= idma_trigger,
-	.pointer	= idma_pointer,
-	.mmap		= idma_mmap,
-	.hw_params	= idma_hw_params,
-	.hw_free	= idma_hw_free,
-	.prepare	= idma_prepare,
-};
-
-static void idma_free(struct snd_pcm *pcm)
+static void idma_free(struct snd_soc_component *component,
+		      struct snd_pcm *pcm)
 {
 	struct snd_pcm_substream *substream;
 	struct snd_dma_buffer *buf;
@@ -367,7 +364,8 @@ static int preallocate_idma_buffer(struct snd_pcm *pcm, int stream)
 	return 0;
 }
 
-static int idma_new(struct snd_soc_pcm_runtime *rtd)
+static int idma_new(struct snd_soc_component *component,
+		    struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_card *card = rtd->card->snd_card;
 	struct snd_pcm *pcm = rtd->pcm;
@@ -394,9 +392,17 @@ void idma_reg_addr_init(void __iomem *regs, dma_addr_t addr)
 EXPORT_SYMBOL_GPL(idma_reg_addr_init);
 
 static const struct snd_soc_component_driver asoc_idma_platform = {
-	.ops = &idma_ops,
-	.pcm_new = idma_new,
-	.pcm_free = idma_free,
+	.open		= idma_open,
+	.close		= idma_close,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.trigger	= idma_trigger,
+	.pointer	= idma_pointer,
+	.mmap		= idma_mmap,
+	.hw_params	= idma_hw_params,
+	.hw_free	= idma_hw_free,
+	.prepare	= idma_prepare,
+	.pcm_construct	= idma_new,
+	.pcm_destruct	= idma_free,
 };
 
 static int asoc_idma_platform_probe(struct platform_device *pdev)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
