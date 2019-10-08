Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C67F1CFACE
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:00:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50ABD15E0;
	Tue,  8 Oct 2019 14:59:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50ABD15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570539638;
	bh=1X0SbSUTcVV6bkS/Eud5N3zNQxTmmNa8xKRW39eAHgw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=mhdXGKXftTc62nn0EW+ndiwNux03sTP5V0uQs5Xha07jhr08QA90JHk1CffoLrdG8
	 aqdMV7ZPaC6ZakmucKaIpzGHvIvEeNDvG9GVziboT/U06lbgZSgwHFOQHmgaYYJH0W
	 HpbD37Ij0MrTv/vwl4OWRNVTx8WNYBfaZDWPbh/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D93E5F80610;
	Tue,  8 Oct 2019 14:53:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D238F8068A; Tue,  8 Oct 2019 14:53:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C546FF8045E
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C546FF8045E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="dCPTLbBK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=D0TXRfZces3MnCWgZphYw9PP+mp3smqfjMd1mStxSOI=; b=dCPTLbBKIguM
 EL9b1RHsOHA1JRpEwVKGEEMakI8f4TGnV7jgOq8DP957klKxXWrCV/3qRwXdnEF/mWv1KM6hVClQF
 CBc+m3cpj7ZatJGmyYIYzzk48ed3tvCb2UzJmTrFGgTJq7t3eDwxv+tv25L6I9Tf0ku1wUJVeob6R
 P4Lwo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozX-0008Md-4J; Tue, 08 Oct 2019 12:53:27 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 98A322740D4B; Tue,  8 Oct 2019 13:53:26 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ftkb90df.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125326.98A322740D4B@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:26 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: rt5514-spi: remove snd_pcm_ops" to the
	asoc tree
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

   ASoC: rt5514-spi: remove snd_pcm_ops

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

From 85efbc911ed5ae1d458fe3fc05c4d9cfe13836d6 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:34:20 +0900
Subject: [PATCH] ASoC: rt5514-spi: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87ftkb90df.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5514-spi.c | 41 ++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/sound/soc/codecs/rt5514-spi.c b/sound/soc/codecs/rt5514-spi.c
index 892ea406a69b..57ff5aee452d 100644
--- a/sound/soc/codecs/rt5514-spi.c
+++ b/sound/soc/codecs/rt5514-spi.c
@@ -201,18 +201,18 @@ static irqreturn_t rt5514_spi_irq(int irq, void *data)
 }
 
 /* PCM for streaming audio from the DSP buffer */
-static int rt5514_spi_pcm_open(struct snd_pcm_substream *substream)
+static int rt5514_spi_pcm_open(struct snd_soc_component *component,
+			       struct snd_pcm_substream *substream)
 {
 	snd_soc_set_runtime_hwparams(substream, &rt5514_spi_pcm_hardware);
 
 	return 0;
 }
 
-static int rt5514_spi_hw_params(struct snd_pcm_substream *substream,
-			       struct snd_pcm_hw_params *hw_params)
+static int rt5514_spi_hw_params(struct snd_soc_component *component,
+				struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *hw_params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct rt5514_dsp *rt5514_dsp =
 		snd_soc_component_get_drvdata(component);
 	int ret;
@@ -234,10 +234,9 @@ static int rt5514_spi_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static int rt5514_spi_hw_free(struct snd_pcm_substream *substream)
+static int rt5514_spi_hw_free(struct snd_soc_component *component,
+			      struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct rt5514_dsp *rt5514_dsp =
 		snd_soc_component_get_drvdata(component);
 
@@ -251,24 +250,22 @@ static int rt5514_spi_hw_free(struct snd_pcm_substream *substream)
 }
 
 static snd_pcm_uframes_t rt5514_spi_pcm_pointer(
+		struct snd_soc_component *component,
 		struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct rt5514_dsp *rt5514_dsp =
 		snd_soc_component_get_drvdata(component);
 
 	return bytes_to_frames(runtime, rt5514_dsp->dma_offset);
 }
 
-static const struct snd_pcm_ops rt5514_spi_pcm_ops = {
-	.open		= rt5514_spi_pcm_open,
-	.hw_params	= rt5514_spi_hw_params,
-	.hw_free	= rt5514_spi_hw_free,
-	.pointer	= rt5514_spi_pcm_pointer,
-	.page		= snd_pcm_lib_get_vmalloc_page,
-};
+static struct page *rt5514_spi_pcm_page(struct snd_soc_component *component,
+					struct snd_pcm_substream *substream,
+					unsigned long offset)
+{
+	return snd_pcm_lib_get_vmalloc_page(substream, offset);
+}
 
 static int rt5514_spi_pcm_probe(struct snd_soc_component *component)
 {
@@ -302,9 +299,13 @@ static int rt5514_spi_pcm_probe(struct snd_soc_component *component)
 }
 
 static const struct snd_soc_component_driver rt5514_spi_component = {
-	.name  = DRV_NAME,
-	.probe = rt5514_spi_pcm_probe,
-	.ops = &rt5514_spi_pcm_ops,
+	.name		= DRV_NAME,
+	.probe		= rt5514_spi_pcm_probe,
+	.open		= rt5514_spi_pcm_open,
+	.hw_params	= rt5514_spi_hw_params,
+	.hw_free	= rt5514_spi_hw_free,
+	.pointer	= rt5514_spi_pcm_pointer,
+	.page		= rt5514_spi_pcm_page,
 };
 
 /**
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
