Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E032EBED1
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jan 2021 14:39:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33EA81694;
	Wed,  6 Jan 2021 14:38:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33EA81694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609940387;
	bh=ryEJHnGNVY8qnqE2xhFQTG3Noc71+vzE5ycUSUEIHpo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=j1MOeS8sUrZJwOfQGOUfZtxf84EQYdYeRVePhlSULpafPp8zytXnGqNwKG5icmukM
	 ohPcMJa3qMW2KiaJeqDqDSO3/mH8fIhTc41XBLZtsNeupbmqzOHoHJlVQDodfLazFR
	 Rmu1tjfFG9mK75xWSSrJ6vlHkimWPVS8wumz3sOI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F598F804CA;
	Wed,  6 Jan 2021 14:37:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E226F80165; Wed,  6 Jan 2021 14:37:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3ECA8F800DD
 for <alsa-devel@alsa-project.org>; Wed,  6 Jan 2021 14:37:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ECA8F800DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="i16DWJCh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=DC/Rv5ctzn//WyaF6Gz6f8bFcJTd2H5qSQ0vJXsg0QM=; b=i16DWJChDA4smM/S6xlIs3T15Z
 P/EhKYOxt39VMMGw9ue+K5CZBQpY/nwBL1nD5XO4kAyZvoXkvCuGnwKRb+6ie319btajGkQeSxdVL
 2Qv+DfftAPZK+O6cJ/17+0UBhNoD+MUOkjWmGOfMuMJd+I2848Mm3BcdzZ6UB6/DbTSHgQzixNSg9
 MfjdioFRBs69RgIXSNZEtQf81Y/ENFtrfbGSvJZ8jq8NaMheOnqR7T95FmdCZpe/+2XjaoGnCMG5n
 w5efq5IlJShq0jdmdr/tiJWEn9fYeWkXYCN21hrqipxjanMSDcMNu7edxuToYOm7zWBnGyEvjim9j
 5kDEXjLw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1kx8zi-000Eyr-FC; Wed, 06 Jan 2021 14:36:58 +0100
Received: from [2001:a61:2bd0:3301:9e5c:8eff:fe01:8578]
 (helo=lars-desktop.fritz.box)
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1kx8zi-000Wdj-8o; Wed, 06 Jan 2021 14:36:58 +0100
From: Lars-Peter Clausen <lars@metafoo.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/3] ASoC: atmel-pdc: Use managed DMA buffer allocation
Date: Wed,  6 Jan 2021 14:36:48 +0100
Message-Id: <20210106133650.13509-1-lars@metafoo.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26040/Wed Jan  6 05:30:56 2021)
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Simran Rai <ssimran@broadcom.com>
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

Instead of manually managing its DMA buffers using
dma_{alloc,free}_coherent() lets the sound core take care of this using
managed buffers.

On one hand this reduces the amount of boiler plate code, but the main
motivation for the change is to use the shared code where possible. This
makes it easier to argue about correctness and that the code does not
contain subtle bugs like data leakage or similar.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 sound/soc/atmel/atmel-pcm-pdc.c | 78 ++-------------------------------
 1 file changed, 4 insertions(+), 74 deletions(-)

diff --git a/sound/soc/atmel/atmel-pcm-pdc.c b/sound/soc/atmel/atmel-pcm-pdc.c
index 704f700013d3..3e7ea2021b46 100644
--- a/sound/soc/atmel/atmel-pcm-pdc.c
+++ b/sound/soc/atmel/atmel-pcm-pdc.c
@@ -34,86 +34,21 @@
 #include "atmel-pcm.h"
 
 
-static int atmel_pcm_preallocate_dma_buffer(struct snd_pcm *pcm,
-	int stream)
-{
-	struct snd_pcm_substream *substream = pcm->streams[stream].substream;
-	struct snd_dma_buffer *buf = &substream->dma_buffer;
-	size_t size = ATMEL_SSC_DMABUF_SIZE;
-
-	buf->dev.type = SNDRV_DMA_TYPE_DEV;
-	buf->dev.dev = pcm->card->dev;
-	buf->private_data = NULL;
-	buf->area = dma_alloc_coherent(pcm->card->dev, size,
-			&buf->addr, GFP_KERNEL);
-	pr_debug("atmel-pcm: alloc dma buffer: area=%p, addr=%p, size=%zu\n",
-			(void *)buf->area, (void *)(long)buf->addr, size);
-
-	if (!buf->area)
-		return -ENOMEM;
-
-	buf->bytes = size;
-	return 0;
-}
-
-static int atmel_pcm_mmap(struct snd_soc_component *component,
-			  struct snd_pcm_substream *substream,
-			  struct vm_area_struct *vma)
-{
-	return remap_pfn_range(vma, vma->vm_start,
-		       substream->dma_buffer.addr >> PAGE_SHIFT,
-		       vma->vm_end - vma->vm_start, vma->vm_page_prot);
-}
-
 static int atmel_pcm_new(struct snd_soc_component *component,
 			 struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_card *card = rtd->card->snd_card;
-	struct snd_pcm *pcm = rtd->pcm;
 	int ret;
 
 	ret = dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
 	if (ret)
 		return ret;
 
-	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream) {
-		pr_debug("atmel-pcm: allocating PCM playback DMA buffer\n");
-		ret = atmel_pcm_preallocate_dma_buffer(pcm,
-			SNDRV_PCM_STREAM_PLAYBACK);
-		if (ret)
-			goto out;
-	}
+	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
+				       card->dev, ATMEL_SSC_DMABUF_SIZE,
+				       ATMEL_SSC_DMABUF_SIZE);
 
-	if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream) {
-		pr_debug("atmel-pcm: allocating PCM capture DMA buffer\n");
-		ret = atmel_pcm_preallocate_dma_buffer(pcm,
-			SNDRV_PCM_STREAM_CAPTURE);
-		if (ret)
-			goto out;
-	}
- out:
-	return ret;
-}
-
-static void atmel_pcm_free(struct snd_soc_component *component,
-			   struct snd_pcm *pcm)
-{
-	struct snd_pcm_substream *substream;
-	struct snd_dma_buffer *buf;
-	int stream;
-
-	for (stream = 0; stream < 2; stream++) {
-		substream = pcm->streams[stream].substream;
-		if (!substream)
-			continue;
-
-		buf = &substream->dma_buffer;
-		if (!buf->area)
-			continue;
-		dma_free_coherent(pcm->card->dev, buf->bytes,
-				  buf->area, buf->addr);
-		buf->area = NULL;
-	}
+	return 0;
 }
 
 /*--------------------------------------------------------------------------*\
@@ -210,9 +145,6 @@ static int atmel_pcm_hw_params(struct snd_soc_component *component,
 	/* this may get called several times by oss emulation
 	 * with different params */
 
-	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
-	runtime->dma_bytes = params_buffer_bytes(params);
-
 	prtd->params = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
 	prtd->params->dma_intr_handler = atmel_pcm_dma_irq;
 
@@ -384,9 +316,7 @@ static const struct snd_soc_component_driver atmel_soc_platform = {
 	.prepare	= atmel_pcm_prepare,
 	.trigger	= atmel_pcm_trigger,
 	.pointer	= atmel_pcm_pointer,
-	.mmap		= atmel_pcm_mmap,
 	.pcm_construct	= atmel_pcm_new,
-	.pcm_destruct	= atmel_pcm_free,
 };
 
 int atmel_pcm_pdc_platform_register(struct device *dev)
-- 
2.20.1

