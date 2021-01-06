Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB5F2EBEC9
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jan 2021 14:39:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA0DA16A6;
	Wed,  6 Jan 2021 14:38:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA0DA16A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609940346;
	bh=p7xzUkjPyGNHn9DyNhcZMdU0yoQmYJafcelh8P6W44c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H8Z/jzdwgoQNtdcbSvk70sJG20vKmDqn5T/Dx+UbClUM7C0DY1JuO5o5cUo2LMgzI
	 6LTtkyJA0zAM5zMTb2B+lGXwzBGOs8qV8kI6yYJo8OK1vziLs+u8T8LMxbxcRhNkEB
	 gl0wKg3hen9cxf5XrtGtpDuioc3mzeNfnMwSrEBY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83A2AF8016A;
	Wed,  6 Jan 2021 14:37:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9692CF80165; Wed,  6 Jan 2021 14:37:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3855EF800E3
 for <alsa-devel@alsa-project.org>; Wed,  6 Jan 2021 14:37:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3855EF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="DcnMGwJq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=JsnCf8uS3kOotlzPk/RWMbJ00sgpWETYOlV8QC5+Y9Q=; b=DcnMGwJq0CZ7UVSXUX7hC8xECF
 HPqlGHX7Mb7ewoY9DG3kV21PGBztnDPuvYJ/9Z82yfQeJ9sBDWxxGCdHftCsr+z7uEE7FjiEP0kWW
 Yk8FbZ4kl9ajezM84N3avuhqrVkEZetHh16tKXbjCbYawJH8W9MB9oT+3/aaq6ucQCJurEs+qhYXf
 3l/iasU46vxEBMtmiLtlG1Pkguu0+SmJPQnDf4ArpYGSU8ljkOX3HxL7WrIjtjeJ1uATYGdrGUi1C
 mYvHDZZXoCfv8dGq+9W2ilNLvAQvMw+p2hmrRJkAwVriDPo6VK7T8fRFJUNtDWmiQwb3uax0dG3RS
 jgeSr/oA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1kx8zi-000Eyv-Go; Wed, 06 Jan 2021 14:36:58 +0100
Received: from [2001:a61:2bd0:3301:9e5c:8eff:fe01:8578]
 (helo=lars-desktop.fritz.box)
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1kx8zi-000Wdj-BV; Wed, 06 Jan 2021 14:36:58 +0100
From: Lars-Peter Clausen <lars@metafoo.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/3] ASoC: bcm: cygnus: Use managed DMA buffer allocation
Date: Wed,  6 Jan 2021 14:36:49 +0100
Message-Id: <20210106133650.13509-2-lars@metafoo.de>
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
 sound/soc/bcm/cygnus-pcm.c | 107 ++-----------------------------------
 1 file changed, 3 insertions(+), 104 deletions(-)

diff --git a/sound/soc/bcm/cygnus-pcm.c b/sound/soc/bcm/cygnus-pcm.c
index 7ad07239f99c..56b71b965624 100644
--- a/sound/soc/bcm/cygnus-pcm.c
+++ b/sound/soc/bcm/cygnus-pcm.c
@@ -636,36 +636,6 @@ static int cygnus_pcm_close(struct snd_soc_component *component,
 	return 0;
 }
 
-static int cygnus_pcm_hw_params(struct snd_soc_component *component,
-				struct snd_pcm_substream *substream,
-				struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct cygnus_aio_port *aio;
-
-	aio = cygnus_dai_get_dma_data(substream);
-	dev_dbg(asoc_rtd_to_cpu(rtd, 0)->dev, "%s  port %d\n", __func__, aio->portnum);
-
-	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
-	runtime->dma_bytes = params_buffer_bytes(params);
-
-	return 0;
-}
-
-static int cygnus_pcm_hw_free(struct snd_soc_component *component,
-			      struct snd_pcm_substream *substream)
-{
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct cygnus_aio_port *aio;
-
-	aio = cygnus_dai_get_dma_data(substream);
-	dev_dbg(asoc_rtd_to_cpu(rtd, 0)->dev, "%s  port %d\n", __func__, aio->portnum);
-
-	snd_pcm_set_runtime_buffer(substream, NULL);
-	return 0;
-}
-
 static int cygnus_pcm_prepare(struct snd_soc_component *component,
 			      struct snd_pcm_substream *substream)
 {
@@ -730,87 +700,19 @@ static snd_pcm_uframes_t cygnus_pcm_pointer(struct snd_soc_component *component,
 	return bytes_to_frames(substream->runtime, res);
 }
 
-static int cygnus_pcm_preallocate_dma_buffer(struct snd_pcm *pcm, int stream)
-{
-	struct snd_pcm_substream *substream = pcm->streams[stream].substream;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_dma_buffer *buf = &substream->dma_buffer;
-	size_t size;
-
-	size = cygnus_pcm_hw.buffer_bytes_max;
-
-	buf->dev.type = SNDRV_DMA_TYPE_DEV;
-	buf->dev.dev = pcm->card->dev;
-	buf->private_data = NULL;
-	buf->area = dma_alloc_coherent(pcm->card->dev, size,
-			&buf->addr, GFP_KERNEL);
-
-	dev_dbg(asoc_rtd_to_cpu(rtd, 0)->dev, "%s: size 0x%zx @ %pK\n",
-				__func__, size, buf->area);
-
-	if (!buf->area) {
-		dev_err(asoc_rtd_to_cpu(rtd, 0)->dev, "%s: dma_alloc failed\n", __func__);
-		return -ENOMEM;
-	}
-	buf->bytes = size;
-
-	return 0;
-}
-
-static void cygnus_dma_free_dma_buffers(struct snd_soc_component *component,
-					struct snd_pcm *pcm)
-{
-	struct snd_pcm_substream *substream;
-	struct snd_dma_buffer *buf;
-
-	substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
-	if (substream) {
-		buf = &substream->dma_buffer;
-		if (buf->area) {
-			dma_free_coherent(pcm->card->dev, buf->bytes,
-				buf->area, buf->addr);
-			buf->area = NULL;
-		}
-	}
-
-	substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
-	if (substream) {
-		buf = &substream->dma_buffer;
-		if (buf->area) {
-			dma_free_coherent(pcm->card->dev, buf->bytes,
-				buf->area, buf->addr);
-			buf->area = NULL;
-		}
-	}
-}
-
 static int cygnus_dma_new(struct snd_soc_component *component,
 			  struct snd_soc_pcm_runtime *rtd)
 {
+	size_t size = cygnus_pcm_hw.buffer_bytes_max;
 	struct snd_card *card = rtd->card->snd_card;
-	struct snd_pcm *pcm = rtd->pcm;
-	int ret;
 
 	if (!card->dev->dma_mask)
 		card->dev->dma_mask = &cygnus_dma_dmamask;
 	if (!card->dev->coherent_dma_mask)
 		card->dev->coherent_dma_mask = DMA_BIT_MASK(32);
 
-	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream) {
-		ret = cygnus_pcm_preallocate_dma_buffer(pcm,
-				SNDRV_PCM_STREAM_PLAYBACK);
-		if (ret)
-			return ret;
-	}
-
-	if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream) {
-		ret = cygnus_pcm_preallocate_dma_buffer(pcm,
-				SNDRV_PCM_STREAM_CAPTURE);
-		if (ret) {
-			cygnus_dma_free_dma_buffers(component, pcm);
-			return ret;
-		}
-	}
+	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
+				       card->dev, size, size);
 
 	return 0;
 }
@@ -818,13 +720,10 @@ static int cygnus_dma_new(struct snd_soc_component *component,
 static struct snd_soc_component_driver cygnus_soc_platform = {
 	.open		= cygnus_pcm_open,
 	.close		= cygnus_pcm_close,
-	.hw_params	= cygnus_pcm_hw_params,
-	.hw_free	= cygnus_pcm_hw_free,
 	.prepare	= cygnus_pcm_prepare,
 	.trigger	= cygnus_pcm_trigger,
 	.pointer	= cygnus_pcm_pointer,
 	.pcm_construct	= cygnus_dma_new,
-	.pcm_destruct	= cygnus_dma_free_dma_buffers,
 };
 
 int cygnus_soc_platform_register(struct device *dev,
-- 
2.20.1

