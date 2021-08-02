Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FECB3DD141
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 09:34:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A892D176E;
	Mon,  2 Aug 2021 09:33:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A892D176E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627889654;
	bh=cgFcUs5NC1sTMgVNfIgRnpkmlKgFT6AQUok4Muq7ORo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FVHADA8s3h4qhvBm1a+xDoM309rUe4NG7ivAmBEaWmSfJt0xDkhsj/b1E4XKeG/oV
	 TChYVxQDOJc8EJX5w+oNLMWq737LCf8lV8z6eJgL5oBAid9ZtOz7HcxMsXcr1gDF2V
	 zi6pXm/8Fre/6fcTmKrbHM8QjXKk8Au6/lrzZ93I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E796F8053A;
	Mon,  2 Aug 2021 09:29:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEFBEF80515; Mon,  2 Aug 2021 09:28:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02A21F801F7
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 09:28:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02A21F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="dAVCJzJ8"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="k0BTXIDU"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 81D8521FE4;
 Mon,  2 Aug 2021 07:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627889298; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T/9Ei4GtsCFAyBdbXBde4yyEC4s3IL0aTIPbnSZs+zs=;
 b=dAVCJzJ8d1B3Zy8J/KlbqxZlhxvLqUc56V5xLEkhMOpbnWX9xUfFvSsYp4C318KZYE6alE
 cV9Xom5jABo8L1ilwpxeE+xRvmq1IV5ceBHFsrLA8LJv8C+S4lzMyGVnMt2nUHzNZhrFjl
 jCa6sM8HkuCc27YcCrVcV+dE8PUTVh4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627889298;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T/9Ei4GtsCFAyBdbXBde4yyEC4s3IL0aTIPbnSZs+zs=;
 b=k0BTXIDUEptgOrcA1KD3mrv5Lv/nvC5mUCWJ67dAm74RFjGeR58BS2EJRlsuB8hsSYk7fC
 Ou20/yuV5X2gWCBQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 7C2EEA3B83;
 Mon,  2 Aug 2021 07:28:18 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 15/15] ASoC: sprd: Use managed buffer allocation
Date: Mon,  2 Aug 2021 09:28:15 +0200
Message-Id: <20210802072815.13551-16-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210802072815.13551-1-tiwai@suse.de>
References: <20210802072815.13551-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch simplifies the buffer pre-allocation code of sprd driver
with the standard managed buffer helper.  It uses the newly
introduced fixed-size buffer allocation helper.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/sprd/sprd-pcm-dma.c | 67 ++---------------------------------
 1 file changed, 3 insertions(+), 64 deletions(-)

diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
index 5e3a96d4793c..48d90616b23f 100644
--- a/sound/soc/sprd/sprd-pcm-dma.c
+++ b/sound/soc/sprd/sprd-pcm-dma.c
@@ -204,8 +204,6 @@ static int sprd_pcm_hw_params(struct snd_soc_component *component,
 	if (!dma_params) {
 		dev_warn(component->dev, "no dma parameters setting\n");
 		dma_private->params = NULL;
-		snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
-		runtime->dma_bytes = totsize;
 		return 0;
 	}
 
@@ -217,9 +215,6 @@ static int sprd_pcm_hw_params(struct snd_soc_component *component,
 			return ret;
 	}
 
-	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
-
-	runtime->dma_bytes = totsize;
 	sg_num = totsize / period;
 	dma_private->dma_addr_offset = totsize / channels;
 
@@ -310,7 +305,6 @@ static int sprd_pcm_hw_params(struct snd_soc_component *component,
 static int sprd_pcm_hw_free(struct snd_soc_component *component,
 			    struct snd_pcm_substream *substream)
 {
-	snd_pcm_set_runtime_buffer(substream, NULL);
 	sprd_pcm_release_dma_channel(substream);
 
 	return 0;
@@ -435,73 +429,20 @@ static snd_pcm_uframes_t sprd_pcm_pointer(struct snd_soc_component *component,
 	return x;
 }
 
-static int sprd_pcm_mmap(struct snd_soc_component *component,
-			 struct snd_pcm_substream *substream,
-			 struct vm_area_struct *vma)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-
-	vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
-	return remap_pfn_range(vma, vma->vm_start,
-			       runtime->dma_addr >> PAGE_SHIFT,
-			       vma->vm_end - vma->vm_start,
-			       vma->vm_page_prot);
-}
-
 static int sprd_pcm_new(struct snd_soc_component *component,
 			struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_card *card = rtd->card->snd_card;
 	struct snd_pcm *pcm = rtd->pcm;
-	struct snd_pcm_substream *substream;
 	int ret;
 
 	ret = dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
 	if (ret)
 		return ret;
 
-	substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
-	if (substream) {
-		ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, card->dev,
-					  sprd_pcm_hardware.buffer_bytes_max,
-					  &substream->dma_buffer);
-		if (ret) {
-			dev_err(card->dev,
-				"can't alloc playback dma buffer: %d\n", ret);
-			return ret;
-		}
-	}
-
-	substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
-	if (substream) {
-		ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, card->dev,
-					  sprd_pcm_hardware.buffer_bytes_max,
-					  &substream->dma_buffer);
-		if (ret) {
-			dev_err(card->dev,
-				"can't alloc capture dma buffer: %d\n", ret);
-			snd_dma_free_pages(&pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream->dma_buffer);
-			return ret;
-		}
-	}
-
-	return 0;
-}
-
-static void sprd_pcm_free(struct snd_soc_component *component,
-			  struct snd_pcm *pcm)
-{
-	struct snd_pcm_substream *substream;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(pcm->streams); i++) {
-		substream = pcm->streams[i].substream;
-		if (substream) {
-			snd_dma_free_pages(&substream->dma_buffer);
-			substream->dma_buffer.area = NULL;
-			substream->dma_buffer.addr = 0;
-		}
-	}
+	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+					    card->dev,
+					    sprd_pcm_hardware.buffer_bytes_max);
 }
 
 static const struct snd_soc_component_driver sprd_soc_component = {
@@ -512,9 +453,7 @@ static const struct snd_soc_component_driver sprd_soc_component = {
 	.hw_free	= sprd_pcm_hw_free,
 	.trigger	= sprd_pcm_trigger,
 	.pointer	= sprd_pcm_pointer,
-	.mmap		= sprd_pcm_mmap,
 	.pcm_construct	= sprd_pcm_new,
-	.pcm_destruct	= sprd_pcm_free,
 	.compress_ops	= &sprd_platform_compress_ops,
 };
 
-- 
2.26.2

