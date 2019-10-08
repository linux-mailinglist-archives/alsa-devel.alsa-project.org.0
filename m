Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E21D0CFB04
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:12:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78F6B1673;
	Tue,  8 Oct 2019 15:11:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78F6B1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570540326;
	bh=wL3jUugArUfDRxnzt+jFYdqh7aF5b13uU8iABUZO4jo=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=nKwatKEBO7+UhUjfuCmpRw62LePfB6CQomC+LdCqF/JVcDgSjpFv/VQmh0rzOTA0U
	 yubYntb+TmUPPgbnDv+CcqH39Qd0Vx+aJ4bl+8WB+tvvAE6hCKqp5UGxAm3cTA18s/
	 9COIc+HQvLrmabn2+mdSQMORzzq8U+48IzQM1BGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4729AF80864;
	Tue,  8 Oct 2019 14:54:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D760F80733; Tue,  8 Oct 2019 14:53:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C580F80639
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C580F80639
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="tHUPLYvD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=ZEFs0Q7SsH8DCX2SEY7oc+1DGtPmIs0TwuIOpubsvBw=; b=tHUPLYvDV5D+
 orFUyH+pP6DUUQ7TqKYrREr3kp6yyIPgZISLAaJUchE83HMyX13Ap3iqfV+Hu34Vcv12dqelOYt/2
 3R9esqx2clxGBY9/W5/rV0paHJd5shYE+35j6OsYLOvtWcdJH/rDX1h6RwTjyWnotLN1hOvl9q4BQ
 1R58Q=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozb-0008O9-3Q; Tue, 08 Oct 2019 12:53:31 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 7D3A92740D48; Tue,  8 Oct 2019 13:53:30 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <8736gbaf07.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125330.7D3A92740D48@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:30 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: sof: pcm: remove snd_pcm_ops" to the
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

   ASoC: sof: pcm: remove snd_pcm_ops

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

From 1c91d77e1775e0d497382cc3494f42e08582f065 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:32:56 +0900
Subject: [PATCH] ASoC: sof: pcm: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/8736gbaf07.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/pcm.c | 88 ++++++++++++++++++++++-----------------------
 1 file changed, 44 insertions(+), 44 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 2b876d497447..6490b1577152 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -19,12 +19,11 @@
 #define DRV_NAME	"sof-audio-component"
 
 /* Create DMA buffer page table for DSP */
-static int create_page_table(struct snd_pcm_substream *substream,
+static int create_page_table(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream,
 			     unsigned char *dma_area, size_t size)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_sof_pcm *spcm;
 	struct snd_dma_buffer *dmab = snd_pcm_get_dma_buf(substream);
@@ -95,13 +94,12 @@ void snd_sof_pcm_period_elapsed(struct snd_pcm_substream *substream)
 EXPORT_SYMBOL(snd_sof_pcm_period_elapsed);
 
 /* this may get called several times by oss emulation */
-static int sof_pcm_hw_params(struct snd_pcm_substream *substream,
+static int sof_pcm_hw_params(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_sof_pcm *spcm;
 	struct sof_ipc_pcm_params pcm;
@@ -135,7 +133,7 @@ static int sof_pcm_hw_params(struct snd_pcm_substream *substream,
 		 * ret == 0 means the buffer is not changed
 		 * so no need to regenerate the page table
 		 */
-		ret = create_page_table(substream, runtime->dma_area,
+		ret = create_page_table(component, substream, runtime->dma_area,
 					runtime->dma_bytes);
 		if (ret < 0)
 			return ret;
@@ -237,11 +235,10 @@ static int sof_pcm_dsp_pcm_free(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static int sof_pcm_hw_free(struct snd_pcm_substream *substream)
+static int sof_pcm_hw_free(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_sof_pcm *spcm;
 	int ret, err = 0;
@@ -276,11 +273,10 @@ static int sof_pcm_hw_free(struct snd_pcm_substream *substream)
 	return err;
 }
 
-static int sof_pcm_prepare(struct snd_pcm_substream *substream)
+static int sof_pcm_prepare(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_sof_pcm *spcm;
 	int ret;
@@ -300,7 +296,8 @@ static int sof_pcm_prepare(struct snd_pcm_substream *substream)
 		substream->stream);
 
 	/* set hw_params */
-	ret = sof_pcm_hw_params(substream, &spcm->params[substream->stream]);
+	ret = sof_pcm_hw_params(component,
+				substream, &spcm->params[substream->stream]);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: set pcm hw_params after resume\n");
 		return ret;
@@ -313,11 +310,10 @@ static int sof_pcm_prepare(struct snd_pcm_substream *substream)
  * FE dai link trigger actions are always executed in non-atomic context because
  * they involve IPC's.
  */
-static int sof_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
+static int sof_pcm_trigger(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_sof_pcm *spcm;
 	struct sof_ipc_stream stream;
@@ -351,7 +347,7 @@ static int sof_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 		break;
 	case SNDRV_PCM_TRIGGER_RESUME:
 		/* set up hw_params */
-		ret = sof_pcm_prepare(substream);
+		ret = sof_pcm_prepare(component, substream);
 		if (ret < 0) {
 			dev_err(sdev->dev,
 				"error: failed to set up hw_params upon resume\n");
@@ -395,11 +391,10 @@ static int sof_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	return ret;
 }
 
-static snd_pcm_uframes_t sof_pcm_pointer(struct snd_pcm_substream *substream)
+static snd_pcm_uframes_t sof_pcm_pointer(struct snd_soc_component *component,
+					 struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_sof_pcm *spcm;
 	snd_pcm_uframes_t host, dai;
@@ -428,12 +423,22 @@ static snd_pcm_uframes_t sof_pcm_pointer(struct snd_pcm_substream *substream)
 	return host;
 }
 
-static int sof_pcm_open(struct snd_pcm_substream *substream)
+#ifdef CONFIG_SND_DMA_SGBUF
+static struct page *sof_pcm_page(struct snd_soc_component *component,
+				 struct snd_pcm_substream *substream,
+				 unsigned long offset)
+{
+	return snd_pcm_sgbuf_ops_page(substream, offset);
+}
+#else
+#define sof_pcm_page	NULL
+#endif /* CONFIG_SND_DMA_SGBUF */
+
+static int sof_pcm_open(struct snd_soc_component *component,
+			struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_sof_pcm *spcm;
 	struct snd_soc_tplg_stream_caps *caps;
@@ -505,11 +510,10 @@ static int sof_pcm_open(struct snd_pcm_substream *substream)
 	return ret;
 }
 
-static int sof_pcm_close(struct snd_pcm_substream *substream)
+static int sof_pcm_close(struct snd_soc_component *component,
+			 struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_sof_pcm *spcm;
 	int err;
@@ -538,27 +542,14 @@ static int sof_pcm_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static struct snd_pcm_ops sof_pcm_ops = {
-	.open		= sof_pcm_open,
-	.close		= sof_pcm_close,
-	.ioctl		= snd_pcm_lib_ioctl,
-	.hw_params	= sof_pcm_hw_params,
-	.prepare	= sof_pcm_prepare,
-	.hw_free	= sof_pcm_hw_free,
-	.trigger	= sof_pcm_trigger,
-	.pointer	= sof_pcm_pointer,
-	.page		= snd_pcm_sgbuf_ops_page,
-};
-
 /*
  * Pre-allocate playback/capture audio buffer pages.
  * no need to explicitly release memory preallocated by sof_pcm_new in pcm_free
  * snd_pcm_lib_preallocate_free_for_all() is called by the core.
  */
-static int sof_pcm_new(struct snd_soc_pcm_runtime *rtd)
+static int sof_pcm_new(struct snd_soc_component *component,
+		       struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_sof_pcm *spcm;
 	struct snd_pcm *pcm = rtd->pcm;
@@ -752,11 +743,20 @@ void snd_sof_new_platform_drv(struct snd_sof_dev *sdev)
 	pd->name = "sof-audio-component";
 	pd->probe = sof_pcm_probe;
 	pd->remove = sof_pcm_remove;
-	pd->ops	= &sof_pcm_ops;
+	pd->open = sof_pcm_open;
+	pd->close = sof_pcm_close;
+	pd->ioctl = snd_soc_pcm_lib_ioctl;
+	pd->hw_params = sof_pcm_hw_params;
+	pd->prepare = sof_pcm_prepare;
+	pd->hw_free = sof_pcm_hw_free;
+	pd->trigger = sof_pcm_trigger;
+	pd->pointer = sof_pcm_pointer;
+	pd->page = sof_pcm_page;
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_COMPRESS)
 	pd->compr_ops = &sof_compressed_ops;
 #endif
-	pd->pcm_new = sof_pcm_new;
+	pd->pcm_construct = sof_pcm_new;
 	pd->ignore_machine = drv_name;
 	pd->be_hw_params_fixup = sof_pcm_dai_link_fixup;
 	pd->be_pcm_base = SOF_BE_PCM_BASE;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
