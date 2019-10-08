Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6F9CFAB3
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 14:57:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF9021676;
	Tue,  8 Oct 2019 14:56:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF9021676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570539469;
	bh=mT91K7kV31xcVyITWMQGVsyQBr2iljImdtpZAuN8WkY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=mVuvYEKMyYg2LaojMplXAYK9xl+lk4KjWOV7JEk0mMnTX/AjTltUosBfJ6tjGBsl1
	 ryDH5hXMt6W4dNA05CmEsnAs5yYlRb7UYLiPz/SjH2Z/R2SzahT/6cbh1SMX38fqMr
	 AGy0NDDz0tlzyvGs7OSgCrz3ttLpH8EbOEq++IdQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39BB9F8068A;
	Tue,  8 Oct 2019 14:53:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BA50F80659; Tue,  8 Oct 2019 14:53:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0E0BF804CA
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0E0BF804CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="vn3kFcBf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=cuv+j+kbvQTSHi9K9zkzDmHxo6wNsbmyHmCYkMUEsTI=; b=vn3kFcBfnEF9
 oEq8cN4oD4uonGVYexzVH7IOryrZgKyNVDQinKoN7ElU2rtnblwcYd59W5bNC2OxGB2CJKYsw4H3H
 VxeGIFUkvjGsCsDO825i6ojlx+SRAdyywV6MMxdiXQhufA5jlh30OuJsmdyqlEl1Yw3ssUUaAOYgM
 567f4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozW-0008MG-73; Tue, 08 Oct 2019 12:53:26 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id AD9B52740D4A; Tue,  8 Oct 2019 13:53:25 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a7aj90cx.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125325.AD9B52740D4A@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:25 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: fsl: mpc5200_dma: remove snd_pcm_ops"
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

   ASoC: fsl: mpc5200_dma: remove snd_pcm_ops

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

From 6d1048bc115259bb2664b8ef363351428a4aef30 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:34:38 +0900
Subject: [PATCH] ASoC: fsl: mpc5200_dma: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87a7aj90cx.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/mpc5200_dma.c | 51 +++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/sound/soc/fsl/mpc5200_dma.c b/sound/soc/fsl/mpc5200_dma.c
index ccf9301889fe..5237ac96b756 100644
--- a/sound/soc/fsl/mpc5200_dma.c
+++ b/sound/soc/fsl/mpc5200_dma.c
@@ -98,7 +98,8 @@ static irqreturn_t psc_dma_bcom_irq(int irq, void *_psc_dma_stream)
 	return IRQ_HANDLED;
 }
 
-static int psc_dma_hw_free(struct snd_pcm_substream *substream)
+static int psc_dma_hw_free(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream)
 {
 	snd_pcm_set_runtime_buffer(substream, NULL);
 	return 0;
@@ -110,7 +111,8 @@ static int psc_dma_hw_free(struct snd_pcm_substream *substream)
  * This function is called by ALSA to start, stop, pause, and resume the DMA
  * transfer of data.
  */
-static int psc_dma_trigger(struct snd_pcm_substream *substream, int cmd)
+static int psc_dma_trigger(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct psc_dma *psc_dma = snd_soc_dai_get_drvdata(rtd->cpu_dai);
@@ -210,7 +212,8 @@ static const struct snd_pcm_hardware psc_dma_hardware = {
 	.fifo_size		= 512,
 };
 
-static int psc_dma_open(struct snd_pcm_substream *substream)
+static int psc_dma_open(struct snd_soc_component *component,
+			struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
@@ -238,7 +241,8 @@ static int psc_dma_open(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int psc_dma_close(struct snd_pcm_substream *substream)
+static int psc_dma_close(struct snd_soc_component *component,
+			 struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct psc_dma *psc_dma = snd_soc_dai_get_drvdata(rtd->cpu_dai);
@@ -263,7 +267,8 @@ static int psc_dma_close(struct snd_pcm_substream *substream)
 }
 
 static snd_pcm_uframes_t
-psc_dma_pointer(struct snd_pcm_substream *substream)
+psc_dma_pointer(struct snd_soc_component *component,
+		struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct psc_dma *psc_dma = snd_soc_dai_get_drvdata(rtd->cpu_dai);
@@ -280,29 +285,19 @@ psc_dma_pointer(struct snd_pcm_substream *substream)
 	return bytes_to_frames(substream->runtime, count);
 }
 
-static int
-psc_dma_hw_params(struct snd_pcm_substream *substream,
-			 struct snd_pcm_hw_params *params)
+static int psc_dma_hw_params(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params)
 {
 	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
 
 	return 0;
 }
 
-static const struct snd_pcm_ops psc_dma_ops = {
-	.open		= psc_dma_open,
-	.close		= psc_dma_close,
-	.hw_free	= psc_dma_hw_free,
-	.ioctl		= snd_pcm_lib_ioctl,
-	.pointer	= psc_dma_pointer,
-	.trigger	= psc_dma_trigger,
-	.hw_params	= psc_dma_hw_params,
-};
-
-static int psc_dma_new(struct snd_soc_pcm_runtime *rtd)
+static int psc_dma_new(struct snd_soc_component *component,
+		       struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_card *card = rtd->card->snd_card;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct snd_soc_dai *dai = rtd->cpu_dai;
 	struct snd_pcm *pcm = rtd->pcm;
 	size_t size = psc_dma_hardware.buffer_bytes_max;
@@ -341,10 +336,10 @@ static int psc_dma_new(struct snd_soc_pcm_runtime *rtd)
 	return -ENOMEM;
 }
 
-static void psc_dma_free(struct snd_pcm *pcm)
+static void psc_dma_free(struct snd_soc_component *component,
+			 struct snd_pcm *pcm)
 {
 	struct snd_soc_pcm_runtime *rtd = pcm->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct snd_pcm_substream *substream;
 	int stream;
 
@@ -362,9 +357,15 @@ static void psc_dma_free(struct snd_pcm *pcm)
 
 static const struct snd_soc_component_driver mpc5200_audio_dma_component = {
 	.name		= DRV_NAME,
-	.ops		= &psc_dma_ops,
-	.pcm_new	= &psc_dma_new,
-	.pcm_free	= &psc_dma_free,
+	.open		= psc_dma_open,
+	.close		= psc_dma_close,
+	.hw_free	= psc_dma_hw_free,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.pointer	= psc_dma_pointer,
+	.trigger	= psc_dma_trigger,
+	.hw_params	= psc_dma_hw_params,
+	.pcm_construct	= psc_dma_new,
+	.pcm_destruct	= psc_dma_free,
 };
 
 int mpc5200_audio_dma_create(struct platform_device *op)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
