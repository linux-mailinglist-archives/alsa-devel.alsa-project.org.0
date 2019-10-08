Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6212CCFB27
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:18:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 059871698;
	Tue,  8 Oct 2019 15:17:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 059871698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570540719;
	bh=VxPxUKfW7FlHKQbbn33asqAP7f4hYK4hu4Jde9KDOY4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jByAzxnaOqLDMBTc8DsyVGcclD/jjJ51UMkWKQo76Q4L/AdLbj5ftb8azklEqYEaR
	 AEHIfjGQ8fQnesIs1+E1TynuualFt48eCVk4plHrMCXQxvTI8Rto0/EYC3FPNU7S/b
	 aLQkMfENjFW+od7qJPCU7rHFMBoOIdTDEohuFoz0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDCACF80CC1;
	Tue,  8 Oct 2019 14:54:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4CFAF80791; Tue,  8 Oct 2019 14:54:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C27E0F804CA
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C27E0F804CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="xHAkLsHv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=07N86l6J2yeky0wC0i9WSTBn+fyTBLrIkgnPsSzzIK0=; b=xHAkLsHvDSXi
 qFwisiY0KzduEp44kO+RZz3RvlOh/9L/CK8SqW1tr+xwSgiivc6ohIjY6RiKqH/QRakPMazfTyyuq
 A2+mP+z/wSBDzMH7P7mgQHeCIE9b6R7C+s9NKnAm4YYNRaw7/7PIjBtGORqq0A6NRh+PhGMLK8PjG
 VqiQY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozd-0008P9-Cw; Tue, 08 Oct 2019 12:53:33 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D4BF62740D4A; Tue,  8 Oct 2019 13:53:32 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87imp7af1t.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125332.D4BF62740D4A@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:32 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: amd: acp-pcm-dma: remove snd_pcm_ops"
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

   ASoC: amd: acp-pcm-dma: remove snd_pcm_ops

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

From 8c028a4038ec4d4580971ff0aad86124b684994d Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:31:58 +0900
Subject: [PATCH] ASoC: amd: acp-pcm-dma: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87imp7af1t.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/amd/acp-pcm-dma.c | 63 +++++++++++++++++--------------------
 1 file changed, 29 insertions(+), 34 deletions(-)

diff --git a/sound/soc/amd/acp-pcm-dma.c b/sound/soc/amd/acp-pcm-dma.c
index 52225b4b6382..4b9a27e25206 100644
--- a/sound/soc/amd/acp-pcm-dma.c
+++ b/sound/soc/amd/acp-pcm-dma.c
@@ -759,14 +759,12 @@ static irqreturn_t dma_irq_handler(int irq, void *arg)
 		return IRQ_NONE;
 }
 
-static int acp_dma_open(struct snd_pcm_substream *substream)
+static int acp_dma_open(struct snd_soc_component *component,
+			struct snd_pcm_substream *substream)
 {
 	u16 bank;
 	int ret = 0;
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *prtd = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(prtd,
-								    DRV_NAME);
 	struct audio_drv_data *intr_data = dev_get_drvdata(component->dev);
 	struct audio_substream_data *adata =
 		kzalloc(sizeof(struct audio_substream_data), GFP_KERNEL);
@@ -834,7 +832,8 @@ static int acp_dma_open(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int acp_dma_hw_params(struct snd_pcm_substream *substream,
+static int acp_dma_hw_params(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
 	int status;
@@ -843,8 +842,6 @@ static int acp_dma_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_runtime *runtime;
 	struct audio_substream_data *rtd;
 	struct snd_soc_pcm_runtime *prtd = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(prtd,
-								    DRV_NAME);
 	struct audio_drv_data *adata = dev_get_drvdata(component->dev);
 	struct snd_soc_card *card = prtd->card;
 	struct acp_platform_info *pinfo = snd_soc_card_get_drvdata(card);
@@ -995,7 +992,8 @@ static int acp_dma_hw_params(struct snd_pcm_substream *substream,
 	return status;
 }
 
-static int acp_dma_hw_free(struct snd_pcm_substream *substream)
+static int acp_dma_hw_free(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream)
 {
 	return snd_pcm_lib_free_pages(substream);
 }
@@ -1011,7 +1009,8 @@ static u64 acp_get_byte_count(struct audio_substream_data *rtd)
 	return byte_count.bytescount;
 }
 
-static snd_pcm_uframes_t acp_dma_pointer(struct snd_pcm_substream *substream)
+static snd_pcm_uframes_t acp_dma_pointer(struct snd_soc_component *component,
+					 struct snd_pcm_substream *substream)
 {
 	u32 buffersize;
 	u32 pos = 0;
@@ -1053,13 +1052,15 @@ static snd_pcm_uframes_t acp_dma_pointer(struct snd_pcm_substream *substream)
 	return bytes_to_frames(runtime, pos);
 }
 
-static int acp_dma_mmap(struct snd_pcm_substream *substream,
+static int acp_dma_mmap(struct snd_soc_component *component,
+			struct snd_pcm_substream *substream,
 			struct vm_area_struct *vma)
 {
 	return snd_pcm_lib_default_mmap(substream, vma);
 }
 
-static int acp_dma_prepare(struct snd_pcm_substream *substream)
+static int acp_dma_prepare(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct audio_substream_data *rtd = runtime->private_data;
@@ -1086,7 +1087,8 @@ static int acp_dma_prepare(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int acp_dma_trigger(struct snd_pcm_substream *substream, int cmd)
+static int acp_dma_trigger(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream, int cmd)
 {
 	int ret;
 
@@ -1132,10 +1134,9 @@ static int acp_dma_trigger(struct snd_pcm_substream *substream, int cmd)
 	return ret;
 }
 
-static int acp_dma_new(struct snd_soc_pcm_runtime *rtd)
+static int acp_dma_new(struct snd_soc_component *component,
+		       struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd,
-								    DRV_NAME);
 	struct audio_drv_data *adata = dev_get_drvdata(component->dev);
 	struct device *parent = component->dev->parent;
 
@@ -1158,14 +1159,12 @@ static int acp_dma_new(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
-static int acp_dma_close(struct snd_pcm_substream *substream)
+static int acp_dma_close(struct snd_soc_component *component,
+			 struct snd_pcm_substream *substream)
 {
 	u16 bank;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct audio_substream_data *rtd = runtime->private_data;
-	struct snd_soc_pcm_runtime *prtd = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(prtd,
-								    DRV_NAME);
 	struct audio_drv_data *adata = dev_get_drvdata(component->dev);
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
@@ -1216,22 +1215,18 @@ static int acp_dma_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static const struct snd_pcm_ops acp_dma_ops = {
-	.open = acp_dma_open,
-	.close = acp_dma_close,
-	.ioctl = snd_pcm_lib_ioctl,
-	.hw_params = acp_dma_hw_params,
-	.hw_free = acp_dma_hw_free,
-	.trigger = acp_dma_trigger,
-	.pointer = acp_dma_pointer,
-	.mmap = acp_dma_mmap,
-	.prepare = acp_dma_prepare,
-};
-
 static const struct snd_soc_component_driver acp_asoc_platform = {
-	.name = DRV_NAME,
-	.ops = &acp_dma_ops,
-	.pcm_new = acp_dma_new,
+	.name		= DRV_NAME,
+	.open		= acp_dma_open,
+	.close		= acp_dma_close,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.hw_params	= acp_dma_hw_params,
+	.hw_free	= acp_dma_hw_free,
+	.trigger	= acp_dma_trigger,
+	.pointer	= acp_dma_pointer,
+	.mmap		= acp_dma_mmap,
+	.prepare	= acp_dma_prepare,
+	.pcm_construct	= acp_dma_new,
 };
 
 static int acp_audio_probe(struct platform_device *pdev)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
