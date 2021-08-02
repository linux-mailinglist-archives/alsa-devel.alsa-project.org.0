Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D6F3DD12D
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 09:31:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE5EF17F4;
	Mon,  2 Aug 2021 09:31:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE5EF17F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627889510;
	bh=rf3J/rPN4vHK92EDAthoNBunfEy6R87dHZQfnFxdn4Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d4EQmumf1R+SGvU00pwcvwXc5sh7KjvE6yE5s0XMw5/uJtIvVTurqvpy+U7eJ4ZW5
	 7K4c/jLUcJMJGZiF9X3NINdADFQPLgzImGqJG2iw7a4Ct3tpNLn8+gICrrWW3TQT0K
	 qwF1a49wX7AxHMYhZDmhW5apSS2xQPwBM2Te1hBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 465E6F804FF;
	Mon,  2 Aug 2021 09:28:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CC8FF804EC; Mon,  2 Aug 2021 09:28:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7409F8026A
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 09:28:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7409F8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="Uc9vefOe"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="OJZt1rAS"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 212DD21FDE;
 Mon,  2 Aug 2021 07:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627889298; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OgJl5d3Ooc6rLhcIDVXe1Xf0JLn2fDZ9mL/uQrwlgyY=;
 b=Uc9vefOerwJC9ewjAmbCpI39nzsfw52Ewv8jtJ21VaiHhpd+cPfwlYHsiEjnAt7Tl26W7z
 SQp1it9zPvFsR+TWrHMCVtcwRAmEWlG8IrQfFnorbZhlqmqb5fYEcW5Km8420ZIqpKFNC4
 neT/8mQLluElUpiJ8w+j0USZ5RgA/1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627889298;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OgJl5d3Ooc6rLhcIDVXe1Xf0JLn2fDZ9mL/uQrwlgyY=;
 b=OJZt1rASc+s0StoE/6cgoeMJ3r6JF4g3QkpTgOmV8Fy6EC+1icWYK9/rXqHYEu1HLG7zuu
 Fx/RUyL/P3WLCwDA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 0F90BA3B85;
 Mon,  2 Aug 2021 07:28:18 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/15] ASoC: fsl: imx-pcm-fiq: Use managed buffer allocation
Date: Mon,  2 Aug 2021 09:28:07 +0200
Message-Id: <20210802072815.13551-8-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210802072815.13551-1-tiwai@suse.de>
References: <20210802072815.13551-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Nicolin Chen <nicoleotsuka@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>
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

As the standard buffer allocation helper supports WC pages now, we can
convert imx-pcm-fiq driver to use that.  This allows us to remove lots
of superfluous code.

Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/fsl/imx-pcm-fiq.c | 75 ++-----------------------------------
 1 file changed, 3 insertions(+), 72 deletions(-)

diff --git a/sound/soc/fsl/imx-pcm-fiq.c b/sound/soc/fsl/imx-pcm-fiq.c
index f20d5b1c3848..0d124002678e 100644
--- a/sound/soc/fsl/imx-pcm-fiq.c
+++ b/sound/soc/fsl/imx-pcm-fiq.c
@@ -81,7 +81,6 @@ static int snd_imx_pcm_hw_params(struct snd_soc_component *component,
 	iprtd->offset = 0;
 	iprtd->poll_time_ns = 1000000000 / params_rate(params) *
 				params_period_size(params);
-	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
 
 	return 0;
 }
@@ -213,40 +212,6 @@ static int snd_imx_close(struct snd_soc_component *component,
 	return 0;
 }
 
-static int snd_imx_pcm_mmap(struct snd_soc_component *component,
-			    struct snd_pcm_substream *substream,
-			    struct vm_area_struct *vma)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	int ret;
-
-	ret = dma_mmap_wc(substream->pcm->card->dev, vma, runtime->dma_area,
-			  runtime->dma_addr, runtime->dma_bytes);
-
-	pr_debug("%s: ret: %d %p %pad 0x%08zx\n", __func__, ret,
-			runtime->dma_area,
-			&runtime->dma_addr,
-			runtime->dma_bytes);
-	return ret;
-}
-
-static int imx_pcm_preallocate_dma_buffer(struct snd_pcm *pcm, int stream)
-{
-	struct snd_pcm_substream *substream = pcm->streams[stream].substream;
-	struct snd_dma_buffer *buf = &substream->dma_buffer;
-	size_t size = IMX_SSI_DMABUF_SIZE;
-
-	buf->dev.type = SNDRV_DMA_TYPE_DEV;
-	buf->dev.dev = pcm->card->dev;
-	buf->private_data = NULL;
-	buf->area = dma_alloc_wc(pcm->card->dev, size, &buf->addr, GFP_KERNEL);
-	if (!buf->area)
-		return -ENOMEM;
-	buf->bytes = size;
-
-	return 0;
-}
-
 static int imx_pcm_new(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_card *card = rtd->card->snd_card;
@@ -257,21 +222,9 @@ static int imx_pcm_new(struct snd_soc_pcm_runtime *rtd)
 	if (ret)
 		return ret;
 
-	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream) {
-		ret = imx_pcm_preallocate_dma_buffer(pcm,
-			SNDRV_PCM_STREAM_PLAYBACK);
-		if (ret)
-			return ret;
-	}
-
-	if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream) {
-		ret = imx_pcm_preallocate_dma_buffer(pcm,
-			SNDRV_PCM_STREAM_CAPTURE);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
+	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV_WC,
+					    pcm->card->dev,
+					    IMX_SSI_DMABUF_SIZE);
 }
 
 static int ssi_irq;
@@ -307,32 +260,11 @@ static int snd_imx_pcm_new(struct snd_soc_component *component,
 	return 0;
 }
 
-static void imx_pcm_free(struct snd_pcm *pcm)
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
-
-		dma_free_wc(pcm->card->dev, buf->bytes, buf->area, buf->addr);
-		buf->area = NULL;
-	}
-}
-
 static void snd_imx_pcm_free(struct snd_soc_component *component,
 			     struct snd_pcm *pcm)
 {
 	mxc_set_irq_fiq(ssi_irq, 0);
 	release_fiq(&fh);
-	imx_pcm_free(pcm);
 }
 
 static const struct snd_soc_component_driver imx_soc_component_fiq = {
@@ -342,7 +274,6 @@ static const struct snd_soc_component_driver imx_soc_component_fiq = {
 	.prepare	= snd_imx_pcm_prepare,
 	.trigger	= snd_imx_pcm_trigger,
 	.pointer	= snd_imx_pcm_pointer,
-	.mmap		= snd_imx_pcm_mmap,
 	.pcm_construct	= snd_imx_pcm_new,
 	.pcm_destruct	= snd_imx_pcm_free,
 };
-- 
2.26.2

