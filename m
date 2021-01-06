Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF9E2EBEC8
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jan 2021 14:38:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 319A8829;
	Wed,  6 Jan 2021 14:38:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 319A8829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609940332;
	bh=Khqu3tr49Ty/osgRTcF23piy9ksH2NIfD2TnONOF6rg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lUv6O9Bn+NSRZi3Ck/4JMAWhgDjmvdJLYh29hxqG2HBmrvgLaN41g4ZKYEpjIX7ak
	 C5xk7UVrKdDVbbcRFv0IfE0/a5zJRaVkqFcbfuc3NMZV8PYd06fJA9PIBXvM7jpQTe
	 /1jPpcoh2/pDmTcwyT1POGVCSAmC1Sx+ktaFBtQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2985F800DD;
	Wed,  6 Jan 2021 14:37:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5760BF8025E; Wed,  6 Jan 2021 14:37:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B711F80165
 for <alsa-devel@alsa-project.org>; Wed,  6 Jan 2021 14:37:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B711F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="d2JW1bAp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=0yxbNT9wTWoc6iG81rGwAhiEYwqPsvjQfLazBY/fsCw=; b=d2JW1bAp4iniehobYFKO0hnPpT
 KdkJoDJndOY54eUr4pwfCjIACA4zKMoMoaG3ILOGuasYkZwenaBx4+2QVE+OrkqtXAQvu/u+i2+I6
 2VBXmWFRkS5UMLRDvcEFYNB5NBc1W3r4E5lS/EXrEVMsTHluTfiPCrRu04xNfch/4BEeSdmbTExp8
 kSlpwtmpaGRR8gS0mCynCqtx+V2yC1sF7HHcreeCkk+rml/N1OIobGvZIuk29APw1rYN02qJ3qEFY
 AMnKQogv2gTiCRZQxweWcHP08BE5IQdncCVPpzN7Jn5rA35ShdXBSswn/ovLbqu1yWrlYURVd8AZk
 n+ZnGs/g==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1kx8zi-000Eyw-JL; Wed, 06 Jan 2021 14:36:58 +0100
Received: from [2001:a61:2bd0:3301:9e5c:8eff:fe01:8578]
 (helo=lars-desktop.fritz.box)
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1kx8zi-000Wdj-E0; Wed, 06 Jan 2021 14:36:58 +0100
From: Lars-Peter Clausen <lars@metafoo.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/3] ASoC: kirkwood: Use managed DMA buffer allocation
Date: Wed,  6 Jan 2021 14:36:50 +0100
Message-Id: <20210106133650.13509-3-lars@metafoo.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210106133650.13509-1-lars@metafoo.de>
References: <20210106133650.13509-1-lars@metafoo.de>
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
 sound/soc/kirkwood/kirkwood-dma.c | 79 ++-----------------------------
 1 file changed, 3 insertions(+), 76 deletions(-)

diff --git a/sound/soc/kirkwood/kirkwood-dma.c b/sound/soc/kirkwood/kirkwood-dma.c
index e037826b2451..c2a5933bfcfc 100644
--- a/sound/soc/kirkwood/kirkwood-dma.c
+++ b/sound/soc/kirkwood/kirkwood-dma.c
@@ -182,25 +182,6 @@ static int kirkwood_dma_close(struct snd_soc_component *component,
 	return 0;
 }
 
-static int kirkwood_dma_hw_params(struct snd_soc_component *component,
-				  struct snd_pcm_substream *substream,
-				  struct snd_pcm_hw_params *params)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-
-	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
-	runtime->dma_bytes = params_buffer_bytes(params);
-
-	return 0;
-}
-
-static int kirkwood_dma_hw_free(struct snd_soc_component *component,
-				struct snd_pcm_substream *substream)
-{
-	snd_pcm_set_runtime_buffer(substream, NULL);
-	return 0;
-}
-
 static int kirkwood_dma_prepare(struct snd_soc_component *component,
 				struct snd_pcm_substream *substream)
 {
@@ -244,82 +225,28 @@ static snd_pcm_uframes_t kirkwood_dma_pointer(
 	return count;
 }
 
-static int kirkwood_dma_preallocate_dma_buffer(struct snd_pcm *pcm,
-		int stream)
-{
-	struct snd_pcm_substream *substream = pcm->streams[stream].substream;
-	struct snd_dma_buffer *buf = &substream->dma_buffer;
-	size_t size = kirkwood_dma_snd_hw.buffer_bytes_max;
-
-	buf->dev.type = SNDRV_DMA_TYPE_DEV;
-	buf->dev.dev = pcm->card->dev;
-	buf->area = dma_alloc_coherent(pcm->card->dev, size,
-			&buf->addr, GFP_KERNEL);
-	if (!buf->area)
-		return -ENOMEM;
-	buf->bytes = size;
-	buf->private_data = NULL;
-
-	return 0;
-}
-
 static int kirkwood_dma_new(struct snd_soc_component *component,
 			    struct snd_soc_pcm_runtime *rtd)
 {
+	size_t size = kirkwood_dma_snd_hw.buffer_bytes_max;
 	struct snd_card *card = rtd->card->snd_card;
-	struct snd_pcm *pcm = rtd->pcm;
 	int ret;
 
 	ret = dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
 	if (ret)
 		return ret;
 
-	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream) {
-		ret = kirkwood_dma_preallocate_dma_buffer(pcm,
-				SNDRV_PCM_STREAM_PLAYBACK);
-		if (ret)
-			return ret;
-	}
-
-	if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream) {
-		ret = kirkwood_dma_preallocate_dma_buffer(pcm,
-				SNDRV_PCM_STREAM_CAPTURE);
-		if (ret)
-			return ret;
-	}
+	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
+				       card->dev, size, size);
 
 	return 0;
 }
 
-static void kirkwood_dma_free_dma_buffers(struct snd_soc_component *component,
-					  struct snd_pcm *pcm)
-{
-	struct snd_pcm_substream *substream;
-	struct snd_dma_buffer *buf;
-	int stream;
-
-	for (stream = 0; stream < 2; stream++) {
-		substream = pcm->streams[stream].substream;
-		if (!substream)
-			continue;
-		buf = &substream->dma_buffer;
-		if (!buf->area)
-			continue;
-
-		dma_free_coherent(pcm->card->dev, buf->bytes,
-				buf->area, buf->addr);
-		buf->area = NULL;
-	}
-}
-
 const struct snd_soc_component_driver kirkwood_soc_component = {
 	.name		= DRV_NAME,
 	.open		= kirkwood_dma_open,
 	.close		= kirkwood_dma_close,
-	.hw_params	= kirkwood_dma_hw_params,
-	.hw_free	= kirkwood_dma_hw_free,
 	.prepare	= kirkwood_dma_prepare,
 	.pointer	= kirkwood_dma_pointer,
 	.pcm_construct	= kirkwood_dma_new,
-	.pcm_destruct	= kirkwood_dma_free_dma_buffers,
 };
-- 
2.20.1

