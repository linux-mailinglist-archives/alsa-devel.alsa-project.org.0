Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6F0CFAA6
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 14:56:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE8501614;
	Tue,  8 Oct 2019 14:56:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE8501614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570539413;
	bh=lAGNeuhHbYx/ZlqNEb4GB4Qjhi5ERUrP6mZvhmAyQ5o=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=OVYkulc4+4jVCd8JYiwQ/kR5TifBViTN1iZFOZdmoTV7dAQPKkrDveqN5wW/HBttc
	 yWKaLgNPjx4h0QO2UQgMDq09M0pD+UXdP4iIOGwvx+F75bjOxsNr5GALZWQlgzRx4N
	 rps7YdyGXueoySb1Vt7H500OGJh5ZNnHSEWnLWPw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15421F805A8;
	Tue,  8 Oct 2019 14:53:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9306AF8064C; Tue,  8 Oct 2019 14:53:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23A8CF804CB
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23A8CF804CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="f/FKhdj1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=FvAX8aDfi4UGMCCaOtzfS4l5FKNVl9ZRr6x291SrNbo=; b=f/FKhdj1Pfvz
 onr09d1vVi0gfwsfv3IYc9vscSNV1IJaKNkShT2ICVTHDRSrm5Bh0YdLMGiyN6cECs7sNzGBOqiB/
 HWxpDktjTnP901P0M0qXgi1SNjCAQdu2pywpLyZh7y2+SaTwH1mUBNo3Z1ttubFRSZc3o1e56GKvy
 tE1f4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozV-0008M6-VT; Tue, 08 Oct 2019 12:53:26 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 752592740D48; Tue,  8 Oct 2019 13:53:25 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878sq390cs.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125325.752592740D48@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:25 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: fsl: fsl_asrc_dma: remove snd_pcm_ops"
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

   ASoC: fsl: fsl_asrc_dma: remove snd_pcm_ops

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

From 8903ed25e9fdf6cfd02a3a16db69e500803e16b9 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:34:43 +0900
Subject: [PATCH] ASoC: fsl: fsl_asrc_dma: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/878sq390cs.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_asrc_dma.c | 56 +++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 2a60fc6142b1..d6146de9acd2 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -52,13 +52,12 @@ static void fsl_asrc_dma_complete(void *arg)
 	snd_pcm_period_elapsed(substream);
 }
 
-static int fsl_asrc_dma_prepare_and_submit(struct snd_pcm_substream *substream)
+static int fsl_asrc_dma_prepare_and_submit(struct snd_pcm_substream *substream,
+					   struct snd_soc_component *component)
 {
 	u8 dir = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? OUT : IN;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct fsl_asrc_pair *pair = runtime->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct device *dev = component->dev;
 	unsigned long flags = DMA_CTRL_ACK;
 
@@ -95,7 +94,8 @@ static int fsl_asrc_dma_prepare_and_submit(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int fsl_asrc_dma_trigger(struct snd_pcm_substream *substream, int cmd)
+static int fsl_asrc_dma_trigger(struct snd_soc_component *component,
+				struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct fsl_asrc_pair *pair = runtime->private_data;
@@ -105,7 +105,7 @@ static int fsl_asrc_dma_trigger(struct snd_pcm_substream *substream, int cmd)
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		ret = fsl_asrc_dma_prepare_and_submit(substream);
+		ret = fsl_asrc_dma_prepare_and_submit(substream, component);
 		if (ret)
 			return ret;
 		dma_async_issue_pending(pair->dma_chan[IN]);
@@ -124,7 +124,8 @@ static int fsl_asrc_dma_trigger(struct snd_pcm_substream *substream, int cmd)
 	return 0;
 }
 
-static int fsl_asrc_dma_hw_params(struct snd_pcm_substream *substream,
+static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
+				  struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params)
 {
 	enum dma_slave_buswidth buswidth = DMA_SLAVE_BUSWIDTH_2_BYTES;
@@ -132,7 +133,6 @@ static int fsl_asrc_dma_hw_params(struct snd_pcm_substream *substream,
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	struct snd_dmaengine_dai_dma_data *dma_params_fe = NULL;
 	struct snd_dmaengine_dai_dma_data *dma_params_be = NULL;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct fsl_asrc_pair *pair = runtime->private_data;
 	struct fsl_asrc *asrc_priv = pair->asrc_priv;
@@ -247,7 +247,8 @@ static int fsl_asrc_dma_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int fsl_asrc_dma_hw_free(struct snd_pcm_substream *substream)
+static int fsl_asrc_dma_hw_free(struct snd_soc_component *component,
+				struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct fsl_asrc_pair *pair = runtime->private_data;
@@ -266,12 +267,12 @@ static int fsl_asrc_dma_hw_free(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int fsl_asrc_dma_startup(struct snd_pcm_substream *substream)
+static int fsl_asrc_dma_startup(struct snd_soc_component *component,
+				struct snd_pcm_substream *substream)
 {
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct snd_dmaengine_dai_dma_data *dma_data;
 	struct device *dev = component->dev;
 	struct fsl_asrc *asrc_priv = dev_get_drvdata(dev);
@@ -342,7 +343,8 @@ static int fsl_asrc_dma_startup(struct snd_pcm_substream *substream)
 	return ret;
 }
 
-static int fsl_asrc_dma_shutdown(struct snd_pcm_substream *substream)
+static int fsl_asrc_dma_shutdown(struct snd_soc_component *component,
+				 struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct fsl_asrc_pair *pair = runtime->private_data;
@@ -361,7 +363,9 @@ static int fsl_asrc_dma_shutdown(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static snd_pcm_uframes_t fsl_asrc_dma_pcm_pointer(struct snd_pcm_substream *substream)
+static snd_pcm_uframes_t
+fsl_asrc_dma_pcm_pointer(struct snd_soc_component *component,
+			 struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct fsl_asrc_pair *pair = runtime->private_data;
@@ -369,17 +373,8 @@ static snd_pcm_uframes_t fsl_asrc_dma_pcm_pointer(struct snd_pcm_substream *subs
 	return bytes_to_frames(substream->runtime, pair->pos);
 }
 
-static const struct snd_pcm_ops fsl_asrc_dma_pcm_ops = {
-	.ioctl		= snd_pcm_lib_ioctl,
-	.hw_params	= fsl_asrc_dma_hw_params,
-	.hw_free	= fsl_asrc_dma_hw_free,
-	.trigger	= fsl_asrc_dma_trigger,
-	.open		= fsl_asrc_dma_startup,
-	.close		= fsl_asrc_dma_shutdown,
-	.pointer	= fsl_asrc_dma_pcm_pointer,
-};
-
-static int fsl_asrc_dma_pcm_new(struct snd_soc_pcm_runtime *rtd)
+static int fsl_asrc_dma_pcm_new(struct snd_soc_component *component,
+				struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_card *card = rtd->card->snd_card;
 	struct snd_pcm_substream *substream;
@@ -414,7 +409,8 @@ static int fsl_asrc_dma_pcm_new(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
-static void fsl_asrc_dma_pcm_free(struct snd_pcm *pcm)
+static void fsl_asrc_dma_pcm_free(struct snd_soc_component *component,
+				  struct snd_pcm *pcm)
 {
 	struct snd_pcm_substream *substream;
 	int i;
@@ -432,8 +428,14 @@ static void fsl_asrc_dma_pcm_free(struct snd_pcm *pcm)
 
 struct snd_soc_component_driver fsl_asrc_component = {
 	.name		= DRV_NAME,
-	.ops		= &fsl_asrc_dma_pcm_ops,
-	.pcm_new	= fsl_asrc_dma_pcm_new,
-	.pcm_free	= fsl_asrc_dma_pcm_free,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.hw_params	= fsl_asrc_dma_hw_params,
+	.hw_free	= fsl_asrc_dma_hw_free,
+	.trigger	= fsl_asrc_dma_trigger,
+	.open		= fsl_asrc_dma_startup,
+	.close		= fsl_asrc_dma_shutdown,
+	.pointer	= fsl_asrc_dma_pcm_pointer,
+	.pcm_construct	= fsl_asrc_dma_pcm_new,
+	.pcm_destruct	= fsl_asrc_dma_pcm_free,
 };
 EXPORT_SYMBOL_GPL(fsl_asrc_component);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
