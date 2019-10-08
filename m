Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D47DECFB28
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:19:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FF78169B;
	Tue,  8 Oct 2019 15:18:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FF78169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570540759;
	bh=SiBsuM9T66HE9e4uUTHatHZQ9Di2qxx14rNVmQbgTJc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=eLu7QE1wn0Xkn5Au10puKk0XpV5DRarRCuzFpiC2iJfSJYuWBaKColcAigJlg4jxA
	 iz+JdSd5iUsrtIFV63ZyKV+YYf5B8VcSCy64ii5PgCceaK8bxkEqm3cQPUVPvmePDa
	 Fl8UEGJu9KKUlkUHnL3czR7E7b45T0cu18dTfBSY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1BAFF89616;
	Tue,  8 Oct 2019 14:54:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85924F80797; Tue,  8 Oct 2019 14:54:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07F6CF8064C
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07F6CF8064C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="lByydmBO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=CvjC86uxVOvnF8QGqOFBAF3WnMhQ4SPGNyL8md+QVfg=; b=lByydmBO4tBl
 GTNtFwR1XymKmk9+ocEPsrCruKD4BQLzXoqnpnEc7PF/+Ct3GqWMGvI2pHJ5O1XehV3q26EecEB8y
 Ot3EZwFoZfJNHfiobB1K4P/F/D8xy6hGSEvOtcICBMyFdny65+cb7/xxkrMOvGfEDWvFgHzukKBo5
 CAmnU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozd-0008PD-LE; Tue, 08 Oct 2019 12:53:33 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 1DD532740D4B; Tue,  8 Oct 2019 13:53:33 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87k19naf1y.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125333.1DD532740D4B@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:33 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: amd: acp3x-pcm-dma: remove snd_pcm_ops"
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

   ASoC: amd: acp3x-pcm-dma: remove snd_pcm_ops

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

From f52368f36443b4f77758999e34e7a6b54c4b3471 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:31:53 +0900
Subject: [PATCH] ASoC: amd: acp3x-pcm-dma: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87k19naf1y.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 54 ++++++++++++-----------------
 1 file changed, 23 insertions(+), 31 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index ea57088d50ce..60709e3ba99d 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -275,16 +275,12 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
 		  rtd->acp3x_base + mmACP_EXTERNAL_INTR_CNTL);
 }
 
-static int acp3x_dma_open(struct snd_pcm_substream *substream)
+static int acp3x_dma_open(struct snd_soc_component *component,
+			  struct snd_pcm_substream *substream)
 {
 	int ret = 0;
-
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *prtd = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(prtd,
-								    DRV_NAME);
 	struct i2s_dev_data *adata = dev_get_drvdata(component->dev);
-
 	struct i2s_stream_instance *i2s_data = kzalloc(sizeof(struct i2s_stream_instance),
 						       GFP_KERNEL);
 	if (!i2s_data)
@@ -334,7 +330,8 @@ static u64 acp_get_byte_count(struct i2s_stream_instance *rtd, int direction)
 	return byte_count;
 }
 
-static int acp3x_dma_hw_params(struct snd_pcm_substream *substream,
+static int acp3x_dma_hw_params(struct snd_soc_component *component,
+			       struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params)
 {
 	int status;
@@ -362,7 +359,8 @@ static int acp3x_dma_hw_params(struct snd_pcm_substream *substream,
 	return status;
 }
 
-static snd_pcm_uframes_t acp3x_dma_pointer(struct snd_pcm_substream *substream)
+static snd_pcm_uframes_t acp3x_dma_pointer(struct snd_soc_component *component,
+					   struct snd_pcm_substream *substream)
 {
 	u32 pos = 0;
 	u32 buffersize = 0;
@@ -379,33 +377,32 @@ static snd_pcm_uframes_t acp3x_dma_pointer(struct snd_pcm_substream *substream)
 	return bytes_to_frames(substream->runtime, pos);
 }
 
-static int acp3x_dma_new(struct snd_soc_pcm_runtime *rtd)
+static int acp3x_dma_new(struct snd_soc_component *component,
+			 struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd,
-								    DRV_NAME);
 	struct device *parent = component->dev->parent;
 	snd_pcm_lib_preallocate_pages_for_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
 					      parent, MIN_BUFFER, MAX_BUFFER);
 	return 0;
 }
 
-static int acp3x_dma_hw_free(struct snd_pcm_substream *substream)
+static int acp3x_dma_hw_free(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream)
 {
 	return snd_pcm_lib_free_pages(substream);
 }
 
-static int acp3x_dma_mmap(struct snd_pcm_substream *substream,
+static int acp3x_dma_mmap(struct snd_soc_component *component,
+			  struct snd_pcm_substream *substream,
 			  struct vm_area_struct *vma)
 {
 	return snd_pcm_lib_default_mmap(substream, vma);
 }
 
-static int acp3x_dma_close(struct snd_pcm_substream *substream)
+static int acp3x_dma_close(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *prtd = substream->private_data;
 	struct i2s_stream_instance *rtd = substream->runtime->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(prtd,
-								    DRV_NAME);
 	struct i2s_dev_data *adata = dev_get_drvdata(component->dev);
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
@@ -422,17 +419,6 @@ static int acp3x_dma_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static struct snd_pcm_ops acp3x_dma_ops = {
-	.open = acp3x_dma_open,
-	.close = acp3x_dma_close,
-	.ioctl = snd_pcm_lib_ioctl,
-	.hw_params = acp3x_dma_hw_params,
-	.hw_free = acp3x_dma_hw_free,
-	.pointer = acp3x_dma_pointer,
-	.mmap = acp3x_dma_mmap,
-};
-
-
 static int acp3x_dai_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 {
 
@@ -610,9 +596,15 @@ static struct snd_soc_dai_driver acp3x_i2s_dai_driver = {
 };
 
 static const struct snd_soc_component_driver acp3x_i2s_component = {
-	.name           = DRV_NAME,
-	.ops		= &acp3x_dma_ops,
-	.pcm_new	= acp3x_dma_new,
+	.name		= DRV_NAME,
+	.open		= acp3x_dma_open,
+	.close		= acp3x_dma_close,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.hw_params	= acp3x_dma_hw_params,
+	.hw_free	= acp3x_dma_hw_free,
+	.pointer	= acp3x_dma_pointer,
+	.mmap		= acp3x_dma_mmap,
+	.pcm_construct	= acp3x_dma_new,
 };
 
 static int acp3x_audio_probe(struct platform_device *pdev)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
