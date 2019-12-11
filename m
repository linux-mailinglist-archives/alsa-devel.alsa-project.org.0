Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9508211BA3C
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 18:25:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3772816B3;
	Wed, 11 Dec 2019 18:24:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3772816B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576085128;
	bh=J063RsFfTDyQiJ7KEnhkqHecTqIGyBLwbwqHKZvms3o=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=AsiX7ceXmHt0gHLXIC6pMhpodO6UR2Q5ec/jxaBpJHV9hxp/DSXma/UNTPJd5KVNm
	 BcqL1DGQ2CZLGEc78/dNYNwtYPoNSbtiVzgCugNoDOzRZtnVHAZ2AR7S6hyxEnr63O
	 UyuHwuK1aSL4Ai61W4glaUiZUE+qHzBk7BcIwyEI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98EBFF804CC;
	Wed, 11 Dec 2019 17:55:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FB9CF804B0; Wed, 11 Dec 2019 17:55:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 4F7A5F8049F
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 17:54:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F7A5F8049F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C33FE30E;
 Wed, 11 Dec 2019 08:54:57 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41BFF3F52E;
 Wed, 11 Dec 2019 08:54:57 -0800 (PST)
Date: Wed, 11 Dec 2019 16:54:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20191210142614.19405-2-tiwai@suse.de>
Message-Id: <applied-20191210142614.19405-2-tiwai@suse.de>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: amd: Use managed buffer allocation" to
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

   ASoC: amd: Use managed buffer allocation

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From 7f4aee8fa79c2d753aa1b2e9ffcad24689317f75 Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 10 Dec 2019 15:25:52 +0100
Subject: [PATCH] ASoC: amd: Use managed buffer allocation

Clean up the drivers with the new managed buffer allocation API.
The superfluous snd_pcm_lib_malloc_pages() and
snd_pcm_lib_free_pages() calls are dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20191210142614.19405-2-tiwai@suse.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/amd/acp-pcm-dma.c         | 58 ++++++++++-------------------
 sound/soc/amd/raven/acp3x-pcm-dma.c | 30 +++------------
 2 files changed, 26 insertions(+), 62 deletions(-)

diff --git a/sound/soc/amd/acp-pcm-dma.c b/sound/soc/amd/acp-pcm-dma.c
index 4b9a27e25206..98400aaf0305 100644
--- a/sound/soc/amd/acp-pcm-dma.c
+++ b/sound/soc/amd/acp-pcm-dma.c
@@ -836,7 +836,6 @@ static int acp_dma_hw_params(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
-	int status;
 	uint64_t size;
 	u32 val = 0;
 	struct snd_pcm_runtime *runtime;
@@ -967,35 +966,19 @@ static int acp_dma_hw_params(struct snd_soc_component *component,
 	}
 
 	size = params_buffer_bytes(params);
-	status = snd_pcm_lib_malloc_pages(substream, size);
-	if (status < 0)
-		return status;
-
-	memset(substream->runtime->dma_area, 0, params_buffer_bytes(params));
 
-	if (substream->dma_buffer.area) {
-		acp_set_sram_bank_state(rtd->acp_mmio, 0, true);
-		/* Save for runtime private data */
-		rtd->dma_addr = substream->dma_buffer.addr;
-		rtd->order = get_order(size);
+	acp_set_sram_bank_state(rtd->acp_mmio, 0, true);
+	/* Save for runtime private data */
+	rtd->dma_addr = substream->dma_buffer.addr;
+	rtd->order = get_order(size);
 
-		/* Fill the page table entries in ACP SRAM */
-		rtd->size = size;
-		rtd->num_of_pages = PAGE_ALIGN(size) >> PAGE_SHIFT;
-		rtd->direction = substream->stream;
+	/* Fill the page table entries in ACP SRAM */
+	rtd->size = size;
+	rtd->num_of_pages = PAGE_ALIGN(size) >> PAGE_SHIFT;
+	rtd->direction = substream->stream;
 
-		config_acp_dma(rtd->acp_mmio, rtd, adata->asic_type);
-		status = 0;
-	} else {
-		status = -ENOMEM;
-	}
-	return status;
-}
-
-static int acp_dma_hw_free(struct snd_soc_component *component,
-			   struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
+	config_acp_dma(rtd->acp_mmio, rtd, adata->asic_type);
+	return 0;
 }
 
 static u64 acp_get_byte_count(struct audio_substream_data *rtd)
@@ -1142,18 +1125,18 @@ static int acp_dma_new(struct snd_soc_component *component,
 
 	switch (adata->asic_type) {
 	case CHIP_STONEY:
-		snd_pcm_lib_preallocate_pages_for_all(rtd->pcm,
-						      SNDRV_DMA_TYPE_DEV,
-						      parent,
-						      ST_MIN_BUFFER,
-						      ST_MAX_BUFFER);
+		snd_pcm_set_managed_buffer_all(rtd->pcm,
+					       SNDRV_DMA_TYPE_DEV,
+					       parent,
+					       ST_MIN_BUFFER,
+					       ST_MAX_BUFFER);
 		break;
 	default:
-		snd_pcm_lib_preallocate_pages_for_all(rtd->pcm,
-						      SNDRV_DMA_TYPE_DEV,
-						      parent,
-						      MIN_BUFFER,
-						      MAX_BUFFER);
+		snd_pcm_set_managed_buffer_all(rtd->pcm,
+					       SNDRV_DMA_TYPE_DEV,
+					       parent,
+					       MIN_BUFFER,
+					       MAX_BUFFER);
 		break;
 	}
 	return 0;
@@ -1221,7 +1204,6 @@ static const struct snd_soc_component_driver acp_asoc_platform = {
 	.close		= acp_dma_close,
 	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= acp_dma_hw_params,
-	.hw_free	= acp_dma_hw_free,
 	.trigger	= acp_dma_trigger,
 	.pointer	= acp_dma_pointer,
 	.mmap		= acp_dma_mmap,
diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 60709e3ba99d..98b76c38dae0 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -334,7 +334,6 @@ static int acp3x_dma_hw_params(struct snd_soc_component *component,
 			       struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params)
 {
-	int status;
 	u64 size;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct i2s_stream_instance *rtd = runtime->private_data;
@@ -343,20 +342,10 @@ static int acp3x_dma_hw_params(struct snd_soc_component *component,
 		return -EINVAL;
 
 	size = params_buffer_bytes(params);
-	status = snd_pcm_lib_malloc_pages(substream, size);
-	if (status < 0)
-		return status;
-
-	memset(substream->runtime->dma_area, 0, params_buffer_bytes(params));
-	if (substream->dma_buffer.area) {
-		rtd->dma_addr = substream->dma_buffer.addr;
-		rtd->num_pages = (PAGE_ALIGN(size) >> PAGE_SHIFT);
-		config_acp3x_dma(rtd, substream->stream);
-		status = 0;
-	} else {
-		status = -ENOMEM;
-	}
-	return status;
+	rtd->dma_addr = substream->dma_buffer.addr;
+	rtd->num_pages = (PAGE_ALIGN(size) >> PAGE_SHIFT);
+	config_acp3x_dma(rtd, substream->stream);
+	return 0;
 }
 
 static snd_pcm_uframes_t acp3x_dma_pointer(struct snd_soc_component *component,
@@ -381,17 +370,11 @@ static int acp3x_dma_new(struct snd_soc_component *component,
 			 struct snd_soc_pcm_runtime *rtd)
 {
 	struct device *parent = component->dev->parent;
-	snd_pcm_lib_preallocate_pages_for_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
-					      parent, MIN_BUFFER, MAX_BUFFER);
+	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
+				       parent, MIN_BUFFER, MAX_BUFFER);
 	return 0;
 }
 
-static int acp3x_dma_hw_free(struct snd_soc_component *component,
-			     struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-
 static int acp3x_dma_mmap(struct snd_soc_component *component,
 			  struct snd_pcm_substream *substream,
 			  struct vm_area_struct *vma)
@@ -601,7 +584,6 @@ static const struct snd_soc_component_driver acp3x_i2s_component = {
 	.close		= acp3x_dma_close,
 	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= acp3x_dma_hw_params,
-	.hw_free	= acp3x_dma_hw_free,
 	.pointer	= acp3x_dma_pointer,
 	.mmap		= acp3x_dma_mmap,
 	.pcm_construct	= acp3x_dma_new,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
