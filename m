Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A14CFB21
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:16:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13FE31691;
	Tue,  8 Oct 2019 15:15:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13FE31691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570540603;
	bh=Vyx0W2sM+QoSljg7Dqou//SshVFER5ov2NlfaMtFMiw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=hmsyGeLND2dr8Q7GFa9Acq6Px43YL1oRJdt5GaBMrGF+XCfMzxP3J8bdQ/us+FuFp
	 K4wbApBYl6L5ndQ/9iWPzcx/s3ghLZA3/tdRnfCU6wpfrosehjj3YgmQMaysxgfyM7
	 2Px4bxRbywHp+aq3CFaN0Wx9VPg6nCXq7QI3GyTY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44197F80CB5;
	Tue,  8 Oct 2019 14:54:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D732F80766; Tue,  8 Oct 2019 14:54:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FF6BF80447
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FF6BF80447
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="O/vA3+6x"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=4lGjb0F6NCPok6cnofliA6Qo6nF1Lhr/daITBqSy+Ik=; b=O/vA3+6xxnvf
 yXxYOocljCAvRx+WYTSkaGfO6/QmzXYhJYcHHIHJIuTTpy02HIU9ZOAI8NbrpC0LU/2HhPMedl4xK
 PJ3r7+WIsvXkYFHJKKJMcleL5QEv93z7Etn5xT56j4LZ1h8LUTpTYptvDNB/zDa9o4PtXeu7wJe1l
 jBLHo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozc-0008Oo-KO; Tue, 08 Oct 2019 12:53:32 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 24F9C2740D4A; Tue,  8 Oct 2019 13:53:32 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87eezvaf1f.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125332.24F9C2740D4A@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:32 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: au1x: dma: remove snd_pcm_ops" to the
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

   ASoC: au1x: dma: remove snd_pcm_ops

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

From 297bdfd4f59ce9797d600589760554eb30f6a5f7 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:32:13 +0900
Subject: [PATCH] ASoC: au1x: dma: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87eezvaf1f.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/au1x/dma.c | 63 +++++++++++++++++++++++---------------------
 1 file changed, 33 insertions(+), 30 deletions(-)

diff --git a/sound/soc/au1x/dma.c b/sound/soc/au1x/dma.c
index 1e98cc4f9e27..49556eb409cd 100644
--- a/sound/soc/au1x/dma.c
+++ b/sound/soc/au1x/dma.c
@@ -174,22 +174,23 @@ static const struct snd_pcm_hardware alchemy_pcm_hardware = {
 	.fifo_size	  = 16,
 };
 
-static inline struct alchemy_pcm_ctx *ss_to_ctx(struct snd_pcm_substream *ss)
+static inline struct alchemy_pcm_ctx *ss_to_ctx(struct snd_pcm_substream *ss,
+						struct snd_soc_component *component)
 {
-	struct snd_soc_pcm_runtime *rtd = ss->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	return snd_soc_component_get_drvdata(component);
 }
 
-static inline struct audio_stream *ss_to_as(struct snd_pcm_substream *ss)
+static inline struct audio_stream *ss_to_as(struct snd_pcm_substream *ss,
+					    struct snd_soc_component *component)
 {
-	struct alchemy_pcm_ctx *ctx = ss_to_ctx(ss);
+	struct alchemy_pcm_ctx *ctx = ss_to_ctx(ss, component);
 	return &(ctx->stream[ss->stream]);
 }
 
-static int alchemy_pcm_open(struct snd_pcm_substream *substream)
+static int alchemy_pcm_open(struct snd_soc_component *component,
+			    struct snd_pcm_substream *substream)
 {
-	struct alchemy_pcm_ctx *ctx = ss_to_ctx(substream);
+	struct alchemy_pcm_ctx *ctx = ss_to_ctx(substream, component);
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	int *dmaids, s = substream->stream;
 	char *name;
@@ -213,9 +214,10 @@ static int alchemy_pcm_open(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int alchemy_pcm_close(struct snd_pcm_substream *substream)
+static int alchemy_pcm_close(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream)
 {
-	struct alchemy_pcm_ctx *ctx = ss_to_ctx(substream);
+	struct alchemy_pcm_ctx *ctx = ss_to_ctx(substream, component);
 	int stype = substream->stream;
 
 	ctx->stream[stype].substream = NULL;
@@ -224,10 +226,11 @@ static int alchemy_pcm_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int alchemy_pcm_hw_params(struct snd_pcm_substream *substream,
+static int alchemy_pcm_hw_params(struct snd_soc_component *component,
+				 struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *hw_params)
 {
-	struct audio_stream *stream = ss_to_as(substream);
+	struct audio_stream *stream = ss_to_as(substream, component);
 	int err;
 
 	err = snd_pcm_lib_malloc_pages(substream,
@@ -243,16 +246,18 @@ static int alchemy_pcm_hw_params(struct snd_pcm_substream *substream,
 	return err;
 }
 
-static int alchemy_pcm_hw_free(struct snd_pcm_substream *substream)
+static int alchemy_pcm_hw_free(struct snd_soc_component *component,
+			       struct snd_pcm_substream *substream)
 {
-	struct audio_stream *stream = ss_to_as(substream);
+	struct audio_stream *stream = ss_to_as(substream, component);
 	au1000_release_dma_link(stream);
 	return snd_pcm_lib_free_pages(substream);
 }
 
-static int alchemy_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
+static int alchemy_pcm_trigger(struct snd_soc_component *component,
+			       struct snd_pcm_substream *substream, int cmd)
 {
-	struct audio_stream *stream = ss_to_as(substream);
+	struct audio_stream *stream = ss_to_as(substream, component);
 	int err = 0;
 
 	switch (cmd) {
@@ -269,9 +274,10 @@ static int alchemy_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	return err;
 }
 
-static snd_pcm_uframes_t alchemy_pcm_pointer(struct snd_pcm_substream *ss)
+static snd_pcm_uframes_t alchemy_pcm_pointer(struct snd_soc_component *component,
+					     struct snd_pcm_substream *ss)
 {
-	struct audio_stream *stream = ss_to_as(ss);
+	struct audio_stream *stream = ss_to_as(ss, component);
 	long location;
 
 	location = get_dma_residue(stream->dma);
@@ -281,17 +287,8 @@ static snd_pcm_uframes_t alchemy_pcm_pointer(struct snd_pcm_substream *ss)
 	return bytes_to_frames(ss->runtime, location);
 }
 
-static const struct snd_pcm_ops alchemy_pcm_ops = {
-	.open			= alchemy_pcm_open,
-	.close			= alchemy_pcm_close,
-	.ioctl			= snd_pcm_lib_ioctl,
-	.hw_params	        = alchemy_pcm_hw_params,
-	.hw_free	        = alchemy_pcm_hw_free,
-	.trigger		= alchemy_pcm_trigger,
-	.pointer		= alchemy_pcm_pointer,
-};
-
-static int alchemy_pcm_new(struct snd_soc_pcm_runtime *rtd)
+static int alchemy_pcm_new(struct snd_soc_component *component,
+			   struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_pcm *pcm = rtd->pcm;
 
@@ -303,8 +300,14 @@ static int alchemy_pcm_new(struct snd_soc_pcm_runtime *rtd)
 
 static struct snd_soc_component_driver alchemy_pcm_soc_component = {
 	.name		= DRV_NAME,
-	.ops		= &alchemy_pcm_ops,
-	.pcm_new	= alchemy_pcm_new,
+	.open		= alchemy_pcm_open,
+	.close		= alchemy_pcm_close,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.hw_params	= alchemy_pcm_hw_params,
+	.hw_free	= alchemy_pcm_hw_free,
+	.trigger	= alchemy_pcm_trigger,
+	.pointer	= alchemy_pcm_pointer,
+	.pcm_construct	= alchemy_pcm_new,
 };
 
 static int alchemy_pcm_drvprobe(struct platform_device *pdev)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
