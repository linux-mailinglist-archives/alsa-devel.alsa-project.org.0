Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C70CFAE9
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:07:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 529D0167D;
	Tue,  8 Oct 2019 15:06:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 529D0167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570540052;
	bh=C3Mf7BYrdl+qggqspBN3tK4fEA9IRklpdEYOcAs1KhM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Ino8/XbJtguf36Y6y1OWw3Vq8+/gSKbb7OPatB4zxYOOE/arbbba9+ipkv2F7gx4I
	 8Y3W+p173b/V2OBp+KljAjGmjM0KxxhNZlRfkaYPoiu+nWfKr1mWPA3KvymfjpEOis
	 IrnUsRMmLfG1wSo0lhhSLI4cHxynNPw1W8sVzjg4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 452BFF80793;
	Tue,  8 Oct 2019 14:54:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E662F8071C; Tue,  8 Oct 2019 14:53:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67E13F805FE
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67E13F805FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="NjnXhQ3w"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=uGIVP3omgvJQ9D8erB1JgvaOO1PGS9/Or+tkdY1hCdc=; b=NjnXhQ3wIxR1
 DFynqPxA3PrHiMtKCkaXXTwNccdyOz5f6x3dpX1j79gws6A2AJ4cBtFoPqq/hua8YfD/wp3s97m3W
 tJwN8WpCRyOnfVCi5L4yXN4kUci0tOdVoKMZTfL3o3c2ysWAcCHCcv7plJvhXnJHQVo6qIJz3hrpU
 6u7xI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozZ-0008NL-3r; Tue, 08 Oct 2019 12:53:29 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 9E4702740D4A; Tue,  8 Oct 2019 13:53:28 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r23v90ek.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125328.9E4702740D4A@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:28 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: qcom: q6asm-dai: remove snd_pcm_ops" to
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

   ASoC: qcom: q6asm-dai: remove snd_pcm_ops

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

From 2324c8f4cd35280272419df0f45b37429d3256d4 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:33:39 +0900
Subject: [PATCH] ASoC: qcom: q6asm-dai: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87r23v90ek.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 71 ++++++++++++++++----------------
 1 file changed, 35 insertions(+), 36 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 548eb4fa2da6..f59353f510b8 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -206,16 +206,16 @@ static void event_handler(uint32_t opcode, uint32_t token,
 	}
 }
 
-static int q6asm_dai_prepare(struct snd_pcm_substream *substream)
+static int q6asm_dai_prepare(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *soc_prtd = substream->private_data;
 	struct q6asm_dai_rtd *prtd = runtime->private_data;
-	struct snd_soc_component *c = snd_soc_rtdcom_lookup(soc_prtd, DRV_NAME);
 	struct q6asm_dai_data *pdata;
 	int ret, i;
 
-	pdata = snd_soc_component_get_drvdata(c);
+	pdata = snd_soc_component_get_drvdata(component);
 	if (!pdata)
 		return -EINVAL;
 
@@ -294,7 +294,8 @@ static int q6asm_dai_prepare(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int q6asm_dai_trigger(struct snd_pcm_substream *substream, int cmd)
+static int q6asm_dai_trigger(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream, int cmd)
 {
 	int ret = 0;
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -322,21 +323,21 @@ static int q6asm_dai_trigger(struct snd_pcm_substream *substream, int cmd)
 	return ret;
 }
 
-static int q6asm_dai_open(struct snd_pcm_substream *substream)
+static int q6asm_dai_open(struct snd_soc_component *component,
+			  struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *soc_prtd = substream->private_data;
 	struct snd_soc_dai *cpu_dai = soc_prtd->cpu_dai;
-	struct snd_soc_component *c = snd_soc_rtdcom_lookup(soc_prtd, DRV_NAME);
 	struct q6asm_dai_rtd *prtd;
 	struct q6asm_dai_data *pdata;
-	struct device *dev = c->dev;
+	struct device *dev = component->dev;
 	int ret = 0;
 	int stream_id;
 
 	stream_id = cpu_dai->driver->id;
 
-	pdata = snd_soc_component_get_drvdata(c);
+	pdata = snd_soc_component_get_drvdata(component);
 	if (!pdata) {
 		pr_err("Drv data not found ..\n");
 		return -EINVAL;
@@ -414,7 +415,8 @@ static int q6asm_dai_open(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int q6asm_dai_close(struct snd_pcm_substream *substream)
+static int q6asm_dai_close(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *soc_prtd = substream->private_data;
@@ -435,7 +437,8 @@ static int q6asm_dai_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static snd_pcm_uframes_t q6asm_dai_pointer(struct snd_pcm_substream *substream)
+static snd_pcm_uframes_t q6asm_dai_pointer(struct snd_soc_component *component,
+					   struct snd_pcm_substream *substream)
 {
 
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -447,22 +450,21 @@ static snd_pcm_uframes_t q6asm_dai_pointer(struct snd_pcm_substream *substream)
 	return bytes_to_frames(runtime, (prtd->pcm_irq_pos));
 }
 
-static int q6asm_dai_mmap(struct snd_pcm_substream *substream,
-				struct vm_area_struct *vma)
+static int q6asm_dai_mmap(struct snd_soc_component *component,
+			  struct snd_pcm_substream *substream,
+			  struct vm_area_struct *vma)
 {
-
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *soc_prtd = substream->private_data;
-	struct snd_soc_component *c = snd_soc_rtdcom_lookup(soc_prtd, DRV_NAME);
-	struct device *dev = c->dev;
+	struct device *dev = component->dev;
 
 	return dma_mmap_coherent(dev, vma,
 			runtime->dma_area, runtime->dma_addr,
 			runtime->dma_bytes);
 }
 
-static int q6asm_dai_hw_params(struct snd_pcm_substream *substream,
-				struct snd_pcm_hw_params *params)
+static int q6asm_dai_hw_params(struct snd_soc_component *component,
+			       struct snd_pcm_substream *substream,
+			       struct snd_pcm_hw_params *params)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct q6asm_dai_rtd *prtd = runtime->private_data;
@@ -482,17 +484,6 @@ static int q6asm_dai_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_pcm_ops q6asm_dai_ops = {
-	.open           = q6asm_dai_open,
-	.hw_params	= q6asm_dai_hw_params,
-	.close          = q6asm_dai_close,
-	.ioctl          = snd_pcm_lib_ioctl,
-	.prepare        = q6asm_dai_prepare,
-	.trigger        = q6asm_dai_trigger,
-	.pointer        = q6asm_dai_pointer,
-	.mmap		= q6asm_dai_mmap,
-};
-
 static void compress_event_handler(uint32_t opcode, uint32_t token,
 				   uint32_t *payload, void *priv)
 {
@@ -800,15 +791,15 @@ static struct snd_compr_ops q6asm_dai_compr_ops = {
 	.ack		= q6asm_dai_compr_ack,
 };
 
-static int q6asm_dai_pcm_new(struct snd_soc_pcm_runtime *rtd)
+static int q6asm_dai_pcm_new(struct snd_soc_component *component,
+			     struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_pcm_substream *psubstream, *csubstream;
-	struct snd_soc_component *c = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct snd_pcm *pcm = rtd->pcm;
 	struct device *dev;
 	int size, ret;
 
-	dev = c->dev;
+	dev = component->dev;
 	size = q6asm_dai_hardware_playback.buffer_bytes_max;
 	psubstream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
 	if (psubstream) {
@@ -835,7 +826,8 @@ static int q6asm_dai_pcm_new(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
-static void q6asm_dai_pcm_free(struct snd_pcm *pcm)
+static void q6asm_dai_pcm_free(struct snd_soc_component *component,
+			       struct snd_pcm *pcm)
 {
 	struct snd_pcm_substream *substream;
 	int i;
@@ -852,9 +844,16 @@ static void q6asm_dai_pcm_free(struct snd_pcm *pcm)
 
 static const struct snd_soc_component_driver q6asm_fe_dai_component = {
 	.name		= DRV_NAME,
-	.ops		= &q6asm_dai_ops,
-	.pcm_new	= q6asm_dai_pcm_new,
-	.pcm_free	= q6asm_dai_pcm_free,
+	.open		= q6asm_dai_open,
+	.hw_params	= q6asm_dai_hw_params,
+	.close		= q6asm_dai_close,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.prepare	= q6asm_dai_prepare,
+	.trigger	= q6asm_dai_trigger,
+	.pointer	= q6asm_dai_pointer,
+	.mmap		= q6asm_dai_mmap,
+	.pcm_construct	= q6asm_dai_pcm_new,
+	.pcm_destruct	= q6asm_dai_pcm_free,
 	.compr_ops	= &q6asm_dai_compr_ops,
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
