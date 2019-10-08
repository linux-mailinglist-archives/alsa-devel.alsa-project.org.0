Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C801CFAE5
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:06:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBCA01676;
	Tue,  8 Oct 2019 15:05:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBCA01676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570539971;
	bh=1DE05biKR0nMIgDvYiiIYTu/gKUcGGVnWY9jD3ddOEw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=BYNdUY9XfDxZXPheh5uXaaMVCU32ZACRMZjdJMRlLsvykrd98Mca84vr2XIMtE4tH
	 68H6EQrgiHN2LaYbgF9HOGeaWifaZJmsdKU/ixNtBDz5goLP3RrMGedpQVKF+5oPzu
	 BdzfFNPKo+2Cmyu4VP2QhfiQWJEbQ8fbTDIq8AUE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AF86F8076D;
	Tue,  8 Oct 2019 14:54:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C666F80709; Tue,  8 Oct 2019 14:53:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5328CF80600
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5328CF80600
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="C4Jj+a+/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=QKmM8ituZZLezOrtfZEpY4ng2nKgrHO7pE8iYUreKyw=; b=C4Jj+a+/SWRv
 ZTDUwel9DOJ7oJnqUvuOqMzWdaPxW6OXn3Jbia58BH+oTb3BOv5XOC89iAzcwRxHXhSOr2EhD9dhP
 tEUGp037Kiixglhxe6SSjZuZyX/U67eFRYZSZpyA0iyQT1cFRyNhdm8+FkOhkLwYfYii2VbCEm1uI
 vU5Dc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozY-0008NK-UJ; Tue, 08 Oct 2019 12:53:29 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 631D72740D48; Tue,  8 Oct 2019 13:53:28 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pnjf90ef.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125328.631D72740D48@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:28 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: pxa: mmp-pcm: remove snd_pcm_ops" to
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

   ASoC: pxa: mmp-pcm: remove snd_pcm_ops

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

From 540e59c68bbcd450d711aaddddc9332507a5a504 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:33:44 +0900
Subject: [PATCH] ASoC: pxa: mmp-pcm: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87pnjf90ef.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/pxa/mmp-pcm.c | 62 ++++++++++++++++++++++++++---------------
 1 file changed, 40 insertions(+), 22 deletions(-)

diff --git a/sound/soc/pxa/mmp-pcm.c b/sound/soc/pxa/mmp-pcm.c
index 7096b5263e25..54a4c9213e83 100644
--- a/sound/soc/pxa/mmp-pcm.c
+++ b/sound/soc/pxa/mmp-pcm.c
@@ -55,8 +55,9 @@ static struct snd_pcm_hardware mmp_pcm_hardware[] = {
 	},
 };
 
-static int mmp_pcm_hw_params(struct snd_pcm_substream *substream,
-			      struct snd_pcm_hw_params *params)
+static int mmp_pcm_hw_params(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params)
 {
 	struct dma_chan *chan = snd_dmaengine_pcm_get_chan(substream);
 	struct dma_slave_config slave_config;
@@ -77,6 +78,18 @@ static int mmp_pcm_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int mmp_pcm_trigger(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream, int cmd)
+{
+	return snd_dmaengine_pcm_trigger(substream, cmd);
+}
+
+static snd_pcm_uframes_t mmp_pcm_pointer(struct snd_soc_component *component,
+					 struct snd_pcm_substream *substream)
+{
+	return snd_dmaengine_pcm_pointer(substream);
+}
+
 static bool filter(struct dma_chan *chan, void *param)
 {
 	struct mmp_dma_data *dma_data = param;
@@ -94,10 +107,10 @@ static bool filter(struct dma_chan *chan, void *param)
 	return found;
 }
 
-static int mmp_pcm_open(struct snd_pcm_substream *substream)
+static int mmp_pcm_open(struct snd_soc_component *component,
+			struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct platform_device *pdev = to_platform_device(component->dev);
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	struct mmp_dma_data dma_data;
@@ -117,8 +130,15 @@ static int mmp_pcm_open(struct snd_pcm_substream *substream)
 		    &dma_data);
 }
 
-static int mmp_pcm_mmap(struct snd_pcm_substream *substream,
-			 struct vm_area_struct *vma)
+static int mmp_pcm_close(struct snd_soc_component *component,
+			 struct snd_pcm_substream *substream)
+{
+	return snd_dmaengine_pcm_close_release_chan(substream);
+}
+
+static int mmp_pcm_mmap(struct snd_soc_component *component,
+			struct snd_pcm_substream *substream,
+			struct vm_area_struct *vma)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	unsigned long off = vma->vm_pgoff;
@@ -129,17 +149,8 @@ static int mmp_pcm_mmap(struct snd_pcm_substream *substream,
 		vma->vm_end - vma->vm_start, vma->vm_page_prot);
 }
 
-static const struct snd_pcm_ops mmp_pcm_ops = {
-	.open		= mmp_pcm_open,
-	.close		= snd_dmaengine_pcm_close_release_chan,
-	.ioctl		= snd_pcm_lib_ioctl,
-	.hw_params	= mmp_pcm_hw_params,
-	.trigger	= snd_dmaengine_pcm_trigger,
-	.pointer	= snd_dmaengine_pcm_pointer,
-	.mmap		= mmp_pcm_mmap,
-};
-
-static void mmp_pcm_free_dma_buffers(struct snd_pcm *pcm)
+static void mmp_pcm_free_dma_buffers(struct snd_soc_component *component,
+				     struct snd_pcm *pcm)
 {
 	struct snd_pcm_substream *substream;
 	struct snd_dma_buffer *buf;
@@ -188,7 +199,8 @@ static int mmp_pcm_preallocate_dma_buffer(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int mmp_pcm_new(struct snd_soc_pcm_runtime *rtd)
+static int mmp_pcm_new(struct snd_soc_component *component,
+		       struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_pcm_substream *substream;
 	struct snd_pcm *pcm = rtd->pcm;
@@ -205,15 +217,21 @@ static int mmp_pcm_new(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 
 err:
-	mmp_pcm_free_dma_buffers(pcm);
+	mmp_pcm_free_dma_buffers(component, pcm);
 	return ret;
 }
 
 static const struct snd_soc_component_driver mmp_soc_component = {
 	.name		= DRV_NAME,
-	.ops		= &mmp_pcm_ops,
-	.pcm_new	= mmp_pcm_new,
-	.pcm_free	= mmp_pcm_free_dma_buffers,
+	.open		= mmp_pcm_open,
+	.close		= mmp_pcm_close,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.hw_params	= mmp_pcm_hw_params,
+	.trigger	= mmp_pcm_trigger,
+	.pointer	= mmp_pcm_pointer,
+	.mmap		= mmp_pcm_mmap,
+	.pcm_construct	= mmp_pcm_new,
+	.pcm_destruct	= mmp_pcm_free_dma_buffers,
 };
 
 static int mmp_pcm_probe(struct platform_device *pdev)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
