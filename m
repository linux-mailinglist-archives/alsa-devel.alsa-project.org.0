Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 588A1CFB0A
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:12:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E539A168F;
	Tue,  8 Oct 2019 15:11:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E539A168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570540364;
	bh=2wbUUNGE2PT3qTCh/B6NqqT2+heWsxvl4DyXNUI+7SQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=dOqjWvwEtT0WVtUfxi29P9tjxqu0nEq/rxxCmBHsIAy1DH4d/H7oIWzkqfcg9raMK
	 rdQH6TwpjXN772HrgfiD40sMBo5O8x6pRqzsmQAL0csYV9OPxeqP2iQKlzEh4j5Lgp
	 FGe8lHELuAqJ6ZN9NWuG796/WrbXOrylcig2Ol9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B494F8087B;
	Tue,  8 Oct 2019 14:54:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC24EF80733; Tue,  8 Oct 2019 14:53:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D202F80637
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D202F80637
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="lAkqFB9O"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=cbVZTwfI3kol1lRe5OI5GHj3ix8NQKvJqjGHbbFo2u0=; b=lAkqFB9OTq90
 wyjY28KjQ5Sl88aDy9RjhF2qwT0Ef2SUDm11cIP9jZzmafR7pWFuM2Me4iaiOrOWvM/IKOKgANUK3
 lJwXDkWQ77G8js6QahXB8OMq6Tbzr2FEf1VaX8/T25qXSfyz7TntyiLmt4fhhd5xh16ObxXq0EYCB
 c+9eU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozb-0008OF-7O; Tue, 08 Oct 2019 12:53:31 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id B24E72740D4A; Tue,  8 Oct 2019 13:53:30 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <874l0raf0c.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125330.B24E72740D4A@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:30 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: sprd: sprd-pcm-dma: remove snd_pcm_ops"
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

   ASoC: sprd: sprd-pcm-dma: remove snd_pcm_ops

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

From 6702eed85b40a3106aa532880fc8f0bfa8103c52 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:32:51 +0900
Subject: [PATCH] ASoC: sprd: sprd-pcm-dma: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/874l0raf0c.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sprd/sprd-pcm-dma.c | 74 +++++++++++++++--------------------
 1 file changed, 32 insertions(+), 42 deletions(-)

diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
index d38ebbbbf169..da4b8f5f192b 100644
--- a/sound/soc/sprd/sprd-pcm-dma.c
+++ b/sound/soc/sprd/sprd-pcm-dma.c
@@ -46,12 +46,10 @@ static const struct snd_pcm_hardware sprd_pcm_hardware = {
 	.buffer_bytes_max = 64 * 1024,
 };
 
-static int sprd_pcm_open(struct snd_pcm_substream *substream)
+static int sprd_pcm_open(struct snd_soc_component *component,
+			 struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct device *dev = component->dev;
 	struct sprd_pcm_dma_private *dma_private;
 	int hw_chan = SPRD_PCM_CHANNEL_MAX;
@@ -111,13 +109,11 @@ static int sprd_pcm_open(struct snd_pcm_substream *substream)
 	return ret;
 }
 
-static int sprd_pcm_close(struct snd_pcm_substream *substream)
+static int sprd_pcm_close(struct snd_soc_component *component,
+			  struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct sprd_pcm_dma_private *dma_private = runtime->private_data;
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct device *dev = component->dev;
 	int size = runtime->hw.periods_max * SPRD_PCM_DMA_LINKLIST_SIZE;
 	int i;
@@ -157,14 +153,12 @@ static void sprd_pcm_release_dma_channel(struct snd_pcm_substream *substream)
 	}
 }
 
-static int sprd_pcm_request_dma_channel(struct snd_pcm_substream *substream,
+static int sprd_pcm_request_dma_channel(struct snd_soc_component *component,
+					struct snd_pcm_substream *substream,
 					int channels)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct sprd_pcm_dma_private *dma_private = runtime->private_data;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct device *dev = component->dev;
 	struct sprd_pcm_dma_params *dma_params = dma_private->params;
 	int i;
@@ -190,14 +184,13 @@ static int sprd_pcm_request_dma_channel(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int sprd_pcm_hw_params(struct snd_pcm_substream *substream,
+static int sprd_pcm_hw_params(struct snd_soc_component *component,
+			      struct snd_pcm_substream *substream,
 			      struct snd_pcm_hw_params *params)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct sprd_pcm_dma_private *dma_private = runtime->private_data;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct sprd_pcm_dma_params *dma_params;
 	size_t totsize = params_buffer_bytes(params);
 	size_t period = params_period_bytes(params);
@@ -218,7 +211,8 @@ static int sprd_pcm_hw_params(struct snd_pcm_substream *substream,
 
 	if (!dma_private->params) {
 		dma_private->params = dma_params;
-		ret = sprd_pcm_request_dma_channel(substream, channels);
+		ret = sprd_pcm_request_dma_channel(component,
+						   substream, channels);
 		if (ret)
 			return ret;
 	}
@@ -313,7 +307,8 @@ static int sprd_pcm_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static int sprd_pcm_hw_free(struct snd_pcm_substream *substream)
+static int sprd_pcm_hw_free(struct snd_soc_component *component,
+			    struct snd_pcm_substream *substream)
 {
 	snd_pcm_set_runtime_buffer(substream, NULL);
 	sprd_pcm_release_dma_channel(substream);
@@ -321,13 +316,11 @@ static int sprd_pcm_hw_free(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int sprd_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
+static int sprd_pcm_trigger(struct snd_soc_component *component,
+			    struct snd_pcm_substream *substream, int cmd)
 {
 	struct sprd_pcm_dma_private *dma_private =
 		substream->runtime->private_data;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	int ret = 0, i;
 
 	switch (cmd) {
@@ -387,13 +380,11 @@ static int sprd_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	return ret;
 }
 
-static snd_pcm_uframes_t sprd_pcm_pointer(struct snd_pcm_substream *substream)
+static snd_pcm_uframes_t sprd_pcm_pointer(struct snd_soc_component *component,
+					  struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct sprd_pcm_dma_private *dma_private = runtime->private_data;
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	int pointer[SPRD_PCM_CHANNEL_MAX];
 	int bytes_of_pointer = 0, sel_max = 0, i;
 	snd_pcm_uframes_t x;
@@ -444,7 +435,8 @@ static snd_pcm_uframes_t sprd_pcm_pointer(struct snd_pcm_substream *substream)
 	return x;
 }
 
-static int sprd_pcm_mmap(struct snd_pcm_substream *substream,
+static int sprd_pcm_mmap(struct snd_soc_component *component,
+			 struct snd_pcm_substream *substream,
 			 struct vm_area_struct *vma)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -456,18 +448,8 @@ static int sprd_pcm_mmap(struct snd_pcm_substream *substream,
 			       vma->vm_page_prot);
 }
 
-static struct snd_pcm_ops sprd_pcm_ops = {
-	.open = sprd_pcm_open,
-	.close = sprd_pcm_close,
-	.ioctl = snd_pcm_lib_ioctl,
-	.hw_params = sprd_pcm_hw_params,
-	.hw_free = sprd_pcm_hw_free,
-	.trigger = sprd_pcm_trigger,
-	.pointer = sprd_pcm_pointer,
-	.mmap = sprd_pcm_mmap,
-};
-
-static int sprd_pcm_new(struct snd_soc_pcm_runtime *rtd)
+static int sprd_pcm_new(struct snd_soc_component *component,
+			struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_card *card = rtd->card->snd_card;
 	struct snd_pcm *pcm = rtd->pcm;
@@ -506,7 +488,8 @@ static int sprd_pcm_new(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
-static void sprd_pcm_free(struct snd_pcm *pcm)
+static void sprd_pcm_free(struct snd_soc_component *component,
+			  struct snd_pcm *pcm)
 {
 	struct snd_pcm_substream *substream;
 	int i;
@@ -523,10 +506,17 @@ static void sprd_pcm_free(struct snd_pcm *pcm)
 
 static const struct snd_soc_component_driver sprd_soc_component = {
 	.name		= DRV_NAME,
-	.ops		= &sprd_pcm_ops,
+	.open		= sprd_pcm_open,
+	.close		= sprd_pcm_close,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.hw_params	= sprd_pcm_hw_params,
+	.hw_free	= sprd_pcm_hw_free,
+	.trigger	= sprd_pcm_trigger,
+	.pointer	= sprd_pcm_pointer,
+	.mmap		= sprd_pcm_mmap,
+	.pcm_construct	= sprd_pcm_new,
+	.pcm_destruct	= sprd_pcm_free,
 	.compr_ops	= &sprd_platform_compr_ops,
-	.pcm_new	= sprd_pcm_new,
-	.pcm_free	= sprd_pcm_free,
 };
 
 static int sprd_soc_platform_probe(struct platform_device *pdev)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
