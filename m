Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79984CFACA
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 14:59:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07ABB1660;
	Tue,  8 Oct 2019 14:59:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07ABB1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570539598;
	bh=VthqIZiyUtjmdQVh3ne3cbd8NJ+/udbHF6OgAkZ7PkU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=m4ZYtM3lHMN2bDyFuLP6bzFnEirFJxrjBtHe+vPgOmF04PRNlxJVIWlgA0IZyW3qW
	 VvvkfmHWKl4RZFXNz5Ya8DumUb5l2rpHVFFVxVYnZmpep1wHhovq4FAAws99FNrNH3
	 WsRIFdxAY59NjtOhEnfY2Um6RHpm726hxBBca+7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DABCF80600;
	Tue,  8 Oct 2019 14:53:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75D1BF8067A; Tue,  8 Oct 2019 14:53:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD1B4F805FB
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD1B4F805FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="aR9JGc3o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=xEVTEbhNolDEFrFX/RNo0wo3oooFI7XxMbOLyoNkVgE=; b=aR9JGc3oTHcw
 gw/GY0EE+sQj/bCeeaHmNNftqs7y8/lQ0fQ/o1xpq+D9gRJcCr9sRv+5GSOLWUYFjAt+i82BZWkj/
 hT7THxVs3B1Pc3qrbtH1ZdU+26GWKy0hDrYDKi2z+sGzDGoKLT4bS9bPy669x6reK9qP6zObKS+hp
 Fcg3w=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozX-0008Mk-KO; Tue, 08 Oct 2019 12:53:27 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2118B2740D4A; Tue,  8 Oct 2019 13:53:27 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87imp790dp.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125327.2118B2740D4A@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:27 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: kirkwood: kirkwood-dma: remove
	snd_pcm_ops" to the asoc tree
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

   ASoC: kirkwood: kirkwood-dma: remove snd_pcm_ops

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

From 851f5abfc83d75b9d021887bd7e89c8dd27a9bd4 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:34:10 +0900
Subject: [PATCH] ASoC: kirkwood: kirkwood-dma: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87imp790dp.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/kirkwood/kirkwood-dma.c | 50 +++++++++++++++++--------------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/sound/soc/kirkwood/kirkwood-dma.c b/sound/soc/kirkwood/kirkwood-dma.c
index 6f69f314f2c2..42bbb7ea20b5 100644
--- a/sound/soc/kirkwood/kirkwood-dma.c
+++ b/sound/soc/kirkwood/kirkwood-dma.c
@@ -98,7 +98,8 @@ kirkwood_dma_conf_mbus_windows(void __iomem *base, int win,
 	}
 }
 
-static int kirkwood_dma_open(struct snd_pcm_substream *substream)
+static int kirkwood_dma_open(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream)
 {
 	int err;
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -160,7 +161,8 @@ static int kirkwood_dma_open(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int kirkwood_dma_close(struct snd_pcm_substream *substream)
+static int kirkwood_dma_close(struct snd_soc_component *component,
+			      struct snd_pcm_substream *substream)
 {
 	struct kirkwood_dma_data *priv = kirkwood_priv(substream);
 
@@ -180,8 +182,9 @@ static int kirkwood_dma_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int kirkwood_dma_hw_params(struct snd_pcm_substream *substream,
-				struct snd_pcm_hw_params *params)
+static int kirkwood_dma_hw_params(struct snd_soc_component *component,
+				  struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
@@ -191,13 +194,15 @@ static int kirkwood_dma_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int kirkwood_dma_hw_free(struct snd_pcm_substream *substream)
+static int kirkwood_dma_hw_free(struct snd_soc_component *component,
+				struct snd_pcm_substream *substream)
 {
 	snd_pcm_set_runtime_buffer(substream, NULL);
 	return 0;
 }
 
-static int kirkwood_dma_prepare(struct snd_pcm_substream *substream)
+static int kirkwood_dma_prepare(struct snd_soc_component *component,
+				struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct kirkwood_dma_data *priv = kirkwood_priv(substream);
@@ -222,8 +227,9 @@ static int kirkwood_dma_prepare(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static snd_pcm_uframes_t kirkwood_dma_pointer(struct snd_pcm_substream
-						*substream)
+static snd_pcm_uframes_t kirkwood_dma_pointer(
+	struct snd_soc_component *component,
+	struct snd_pcm_substream *substream)
 {
 	struct kirkwood_dma_data *priv = kirkwood_priv(substream);
 	snd_pcm_uframes_t count;
@@ -238,16 +244,6 @@ static snd_pcm_uframes_t kirkwood_dma_pointer(struct snd_pcm_substream
 	return count;
 }
 
-static const struct snd_pcm_ops kirkwood_dma_ops = {
-	.open =		kirkwood_dma_open,
-	.close =        kirkwood_dma_close,
-	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	kirkwood_dma_hw_params,
-	.hw_free =      kirkwood_dma_hw_free,
-	.prepare =      kirkwood_dma_prepare,
-	.pointer =	kirkwood_dma_pointer,
-};
-
 static int kirkwood_dma_preallocate_dma_buffer(struct snd_pcm *pcm,
 		int stream)
 {
@@ -267,7 +263,8 @@ static int kirkwood_dma_preallocate_dma_buffer(struct snd_pcm *pcm,
 	return 0;
 }
 
-static int kirkwood_dma_new(struct snd_soc_pcm_runtime *rtd)
+static int kirkwood_dma_new(struct snd_soc_component *component,
+			    struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_card *card = rtd->card->snd_card;
 	struct snd_pcm *pcm = rtd->pcm;
@@ -294,7 +291,8 @@ static int kirkwood_dma_new(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
-static void kirkwood_dma_free_dma_buffers(struct snd_pcm *pcm)
+static void kirkwood_dma_free_dma_buffers(struct snd_soc_component *component,
+					  struct snd_pcm *pcm)
 {
 	struct snd_pcm_substream *substream;
 	struct snd_dma_buffer *buf;
@@ -316,7 +314,13 @@ static void kirkwood_dma_free_dma_buffers(struct snd_pcm *pcm)
 
 const struct snd_soc_component_driver kirkwood_soc_component = {
 	.name		= DRV_NAME,
-	.ops		= &kirkwood_dma_ops,
-	.pcm_new	= kirkwood_dma_new,
-	.pcm_free	= kirkwood_dma_free_dma_buffers,
+	.open		= kirkwood_dma_open,
+	.close		= kirkwood_dma_close,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.hw_params	= kirkwood_dma_hw_params,
+	.hw_free	= kirkwood_dma_hw_free,
+	.prepare	= kirkwood_dma_prepare,
+	.pointer	= kirkwood_dma_pointer,
+	.pcm_construct	= kirkwood_dma_new,
+	.pcm_destruct	= kirkwood_dma_free_dma_buffers,
 };
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
