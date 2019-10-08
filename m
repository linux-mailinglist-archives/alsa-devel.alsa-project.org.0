Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85342CFAB7
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 14:58:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 095E0165D;
	Tue,  8 Oct 2019 14:57:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 095E0165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570539520;
	bh=4ZEbwMgSNU2VCkyLgwpm7u5KuwNd4fXpWRAI6KxfWnA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=MGr/Wi+gfv6eXWU22gTr/Os1Orl+YP5fy7NFhRTQwXagfO+D0fCb5DMaBF91o66AG
	 8asVaJwOVCpbGIS+ppirphyUJuL+Ru/mOGIvPc1tI5sAJu7xrB3fS8jBxMSRb6UTOY
	 oKMQ7WVO6kIn5GDUG/c+K87lybB36M+5lPgvVZ18=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D43EBF806F0;
	Tue,  8 Oct 2019 14:53:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A96F9F80659; Tue,  8 Oct 2019 14:53:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CEB3F800BF
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CEB3F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="gnHamUD+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=O4gd209kfpQlZPxIHFvbBZnMgdzW5Hdu+QSutVV5l0c=; b=gnHamUD+7Opk
 2dM2c3l4LQz0DM4D/N9cScPegjHu7MVswMq/laz3nrT7D4fwL+O6cGD42EbusZM6zIVJx1aueIJM+
 pHQhovrW5I/fCcZDZ5k7TWRcFKyuRP2aw7v08Qq8ow0hK+nD34u0MkGYUtBcu2IxB4pLRl3a2fWoj
 zQ1AA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozV-0008M0-I8; Tue, 08 Oct 2019 12:53:25 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 0B01B2740D4B; Tue,  8 Oct 2019 13:53:24 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875zl790cb.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125325.0B01B2740D4B@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:25 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-generic-dmaengine-pcm: remove
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

   ASoC: soc-generic-dmaengine-pcm: remove snd_pcm_ops

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

From ece23171ea95c4fe9395c1c861af0c1bd50ad9e5 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:35:00 +0900
Subject: [PATCH] ASoC: soc-generic-dmaengine-pcm: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/875zl790cb.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-generic-dmaengine-pcm.c | 102 +++++++++++++-------------
 1 file changed, 51 insertions(+), 51 deletions(-)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index f2c98a9cbf75..f4c755209e03 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -75,12 +75,10 @@ int snd_dmaengine_pcm_prepare_slave_config(struct snd_pcm_substream *substream,
 }
 EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_prepare_slave_config);
 
-static int dmaengine_pcm_hw_params(struct snd_pcm_substream *substream,
-	struct snd_pcm_hw_params *params)
+static int dmaengine_pcm_hw_params(struct snd_soc_component *component,
+				   struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, SND_DMAENGINE_PCM_DRV_NAME);
 	struct dmaengine_pcm *pcm = soc_component_to_pcm(component);
 	struct dma_chan *chan = snd_dmaengine_pcm_get_chan(substream);
 	int (*prepare_slave_config)(struct snd_pcm_substream *substream,
@@ -109,11 +107,11 @@ static int dmaengine_pcm_hw_params(struct snd_pcm_substream *substream,
 	return snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
 }
 
-static int dmaengine_pcm_set_runtime_hwparams(struct snd_pcm_substream *substream)
+static int
+dmaengine_pcm_set_runtime_hwparams(struct snd_soc_component *component,
+				   struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, SND_DMAENGINE_PCM_DRV_NAME);
 	struct dmaengine_pcm *pcm = soc_component_to_pcm(component);
 	struct device *dma_dev = dmaengine_dma_dev(pcm, substream);
 	struct dma_chan *chan = pcm->chan[substream->stream];
@@ -150,28 +148,43 @@ static int dmaengine_pcm_set_runtime_hwparams(struct snd_pcm_substream *substrea
 	return snd_soc_set_runtime_hwparams(substream, &hw);
 }
 
-static int dmaengine_pcm_open(struct snd_pcm_substream *substream)
+static int dmaengine_pcm_open(struct snd_soc_component *component,
+			      struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, SND_DMAENGINE_PCM_DRV_NAME);
 	struct dmaengine_pcm *pcm = soc_component_to_pcm(component);
 	struct dma_chan *chan = pcm->chan[substream->stream];
 	int ret;
 
-	ret = dmaengine_pcm_set_runtime_hwparams(substream);
+	ret = dmaengine_pcm_set_runtime_hwparams(component, substream);
 	if (ret)
 		return ret;
 
 	return snd_dmaengine_pcm_open(substream, chan);
 }
 
+static int dmaengine_pcm_close(struct snd_soc_component *component,
+			       struct snd_pcm_substream *substream)
+{
+	return snd_dmaengine_pcm_close(substream);
+}
+
+static int dmaengine_pcm_hw_free(struct snd_soc_component *component,
+				 struct snd_pcm_substream *substream)
+{
+	return snd_pcm_lib_free_pages(substream);
+}
+
+static int dmaengine_pcm_trigger(struct snd_soc_component *component,
+				 struct snd_pcm_substream *substream, int cmd)
+{
+	return snd_dmaengine_pcm_trigger(substream, cmd);
+}
+
 static struct dma_chan *dmaengine_pcm_compat_request_channel(
+	struct snd_soc_component *component,
 	struct snd_soc_pcm_runtime *rtd,
 	struct snd_pcm_substream *substream)
 {
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, SND_DMAENGINE_PCM_DRV_NAME);
 	struct dmaengine_pcm *pcm = soc_component_to_pcm(component);
 	struct snd_dmaengine_dai_dma_data *dma_data;
 	dma_filter_fn fn = NULL;
@@ -209,10 +222,9 @@ static bool dmaengine_pcm_can_report_residue(struct device *dev,
 	return true;
 }
 
-static int dmaengine_pcm_new(struct snd_soc_pcm_runtime *rtd)
+static int dmaengine_pcm_new(struct snd_soc_component *component,
+			     struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, SND_DMAENGINE_PCM_DRV_NAME);
 	struct dmaengine_pcm *pcm = soc_component_to_pcm(component);
 	const struct snd_dmaengine_pcm_config *config = pcm->config;
 	struct device *dev = component->dev;
@@ -239,8 +251,8 @@ static int dmaengine_pcm_new(struct snd_soc_pcm_runtime *rtd)
 				config->chan_names[i]);
 
 		if (!pcm->chan[i] && (pcm->flags & SND_DMAENGINE_PCM_FLAG_COMPAT)) {
-			pcm->chan[i] = dmaengine_pcm_compat_request_channel(rtd,
-				substream);
+			pcm->chan[i] = dmaengine_pcm_compat_request_channel(
+				component, rtd, substream);
 		}
 
 		if (!pcm->chan[i]) {
@@ -269,11 +281,9 @@ static int dmaengine_pcm_new(struct snd_soc_pcm_runtime *rtd)
 }
 
 static snd_pcm_uframes_t dmaengine_pcm_pointer(
+	struct snd_soc_component *component,
 	struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, SND_DMAENGINE_PCM_DRV_NAME);
 	struct dmaengine_pcm *pcm = soc_component_to_pcm(component);
 
 	if (pcm->flags & SND_DMAENGINE_PCM_FLAG_NO_RESIDUE)
@@ -282,13 +292,11 @@ static snd_pcm_uframes_t dmaengine_pcm_pointer(
 		return snd_dmaengine_pcm_pointer(substream);
 }
 
-static int dmaengine_copy_user(struct snd_pcm_substream *substream,
+static int dmaengine_copy_user(struct snd_soc_component *component,
+			       struct snd_pcm_substream *substream,
 			       int channel, unsigned long hwoff,
 			       void __user *buf, unsigned long bytes)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, SND_DMAENGINE_PCM_DRV_NAME);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct dmaengine_pcm *pcm = soc_component_to_pcm(component);
 	int (*process)(struct snd_pcm_substream *substream,
@@ -316,39 +324,31 @@ static int dmaengine_copy_user(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const struct snd_pcm_ops dmaengine_pcm_ops = {
+static const struct snd_soc_component_driver dmaengine_pcm_component = {
+	.name		= SND_DMAENGINE_PCM_DRV_NAME,
+	.probe_order	= SND_SOC_COMP_ORDER_LATE,
 	.open		= dmaengine_pcm_open,
-	.close		= snd_dmaengine_pcm_close,
-	.ioctl		= snd_pcm_lib_ioctl,
+	.close		= dmaengine_pcm_close,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= dmaengine_pcm_hw_params,
-	.hw_free	= snd_pcm_lib_free_pages,
-	.trigger	= snd_dmaengine_pcm_trigger,
+	.hw_free	= dmaengine_pcm_hw_free,
+	.trigger	= dmaengine_pcm_trigger,
 	.pointer	= dmaengine_pcm_pointer,
+	.pcm_construct	= dmaengine_pcm_new,
 };
 
-static const struct snd_pcm_ops dmaengine_pcm_process_ops = {
+static const struct snd_soc_component_driver dmaengine_pcm_component_process = {
+	.name		= SND_DMAENGINE_PCM_DRV_NAME,
+	.probe_order	= SND_SOC_COMP_ORDER_LATE,
 	.open		= dmaengine_pcm_open,
-	.close		= snd_dmaengine_pcm_close,
-	.ioctl		= snd_pcm_lib_ioctl,
+	.close		= dmaengine_pcm_close,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= dmaengine_pcm_hw_params,
-	.hw_free	= snd_pcm_lib_free_pages,
-	.trigger	= snd_dmaengine_pcm_trigger,
+	.hw_free	= dmaengine_pcm_hw_free,
+	.trigger	= dmaengine_pcm_trigger,
 	.pointer	= dmaengine_pcm_pointer,
 	.copy_user	= dmaengine_copy_user,
-};
-
-static const struct snd_soc_component_driver dmaengine_pcm_component = {
-	.name		= SND_DMAENGINE_PCM_DRV_NAME,
-	.probe_order	= SND_SOC_COMP_ORDER_LATE,
-	.ops		= &dmaengine_pcm_ops,
-	.pcm_new	= dmaengine_pcm_new,
-};
-
-static const struct snd_soc_component_driver dmaengine_pcm_component_process = {
-	.name		= SND_DMAENGINE_PCM_DRV_NAME,
-	.probe_order	= SND_SOC_COMP_ORDER_LATE,
-	.ops		= &dmaengine_pcm_process_ops,
-	.pcm_new	= dmaengine_pcm_new,
+	.pcm_construct	= dmaengine_pcm_new,
 };
 
 static const char * const dmaengine_pcm_dma_channel_names[] = {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
