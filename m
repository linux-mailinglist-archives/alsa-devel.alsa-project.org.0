Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D2F3DD147
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 09:35:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE25E1849;
	Mon,  2 Aug 2021 09:34:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE25E1849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627889748;
	bh=eswuxo1W0i5PFWZAUUURjJvjkpw1DjGr+M4WxdwxYyQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BizSCvcuBUt4yAqVzfxiYnyM+a8dsNApUpFca5zE2VzCKq/IN8ZO1x+1BDO0YpWJU
	 r3RjrsTWqru8wNVDfky9v6+pHQS/EJ6FltmF1PwutN1PwmUVaTtRrPRWLsWGTZhDjs
	 55zsSMUkCVob0MAPzADEN7R9Qm6SEZeBZZRLy62k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B11EF8056F;
	Mon,  2 Aug 2021 09:29:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFE93F8054A; Mon,  2 Aug 2021 09:29:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7432F804E1
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 09:28:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7432F804E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="kATXn2br"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="f4W+Jtk+"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 32CF721FDF;
 Mon,  2 Aug 2021 07:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627889298; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KhGlkJrcDMMTRRbAadaufuaM9yTH4rtTjIKubH+IHQQ=;
 b=kATXn2bru6zGMh26LRoOLg2wayUIOfa8CHI1xq/MJzUJf7exFW8lt4dTq7wCZflxIXZXC4
 1KTo8/hF811oDLg5SuRczDgylehozkVgsKu5/oS8N+LOVHH/0nQlLINAfKp83UG9cJ08rN
 f6EeCS0O7O5xfuAF5keC2qV/IZy0Bds=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627889298;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KhGlkJrcDMMTRRbAadaufuaM9yTH4rtTjIKubH+IHQQ=;
 b=f4W+Jtk+zNGs/JiCTRTFkaSz5E7xQA7NGg31rFJcPiZ00sbxA/uLlajbP1oFra5WyUrGts
 kHnOyr1FOA4ZjxCw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 20284A3B83;
 Mon,  2 Aug 2021 07:28:18 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/15] ASoC: fsl: imx-pcm-rpmsg: Use managed buffer allocation
Date: Mon,  2 Aug 2021 09:28:08 +0200
Message-Id: <20210802072815.13551-9-tiwai@suse.de>
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
convert imx-pcm-rpmsg driver to use that.  This allows us to remove
lots of superfluous code.

Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 89 +----------------------------------
 1 file changed, 2 insertions(+), 87 deletions(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 6d6c44cf3451..35049043e532 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -139,7 +139,6 @@ static int imx_rpmsg_pcm_hw_params(struct snd_soc_component *component,
 				   struct snd_pcm_hw_params *params)
 {
 	struct rpmsg_info *info = dev_get_drvdata(component->dev);
-	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct rpmsg_msg *msg;
 	int ret = 0;
 
@@ -183,21 +182,11 @@ static int imx_rpmsg_pcm_hw_params(struct snd_soc_component *component,
 		break;
 	}
 
-	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
-	runtime->dma_bytes = params_buffer_bytes(params);
-
 	info->send_message(msg, info);
 
 	return ret;
 }
 
-static int imx_rpmsg_pcm_hw_free(struct snd_soc_component *component,
-				 struct snd_pcm_substream *substream)
-{
-	snd_pcm_set_runtime_buffer(substream, NULL);
-	return 0;
-}
-
 static snd_pcm_uframes_t imx_rpmsg_pcm_pointer(struct snd_soc_component *component,
 					       struct snd_pcm_substream *substream)
 {
@@ -347,18 +336,6 @@ static int imx_rpmsg_pcm_prepare(struct snd_soc_component *component,
 	return 0;
 }
 
-static int imx_rpmsg_pcm_mmap(struct snd_soc_component *component,
-			      struct snd_pcm_substream *substream,
-			      struct vm_area_struct *vma)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-
-	return dma_mmap_wc(substream->pcm->card->dev, vma,
-			   runtime->dma_area,
-			   runtime->dma_addr,
-			   runtime->dma_bytes);
-}
-
 static void imx_rpmsg_pcm_dma_complete(void *arg)
 {
 	struct snd_pcm_substream *substream = arg;
@@ -609,47 +586,6 @@ static int imx_rpmsg_pcm_ack(struct snd_soc_component *component,
 	return 0;
 }
 
-static int imx_rpmsg_pcm_preallocate_dma_buffer(struct snd_pcm *pcm,
-						int stream, int size)
-{
-	struct snd_pcm_substream *substream = pcm->streams[stream].substream;
-	struct snd_dma_buffer *buf = &substream->dma_buffer;
-
-	buf->dev.type = SNDRV_DMA_TYPE_DEV;
-	buf->dev.dev = pcm->card->dev;
-	buf->private_data = NULL;
-	buf->area = dma_alloc_wc(pcm->card->dev, size,
-				 &buf->addr, GFP_KERNEL);
-	if (!buf->area)
-		return -ENOMEM;
-
-	buf->bytes = size;
-	return 0;
-}
-
-static void imx_rpmsg_pcm_free_dma_buffers(struct snd_soc_component *component,
-					   struct snd_pcm *pcm)
-{
-	struct snd_pcm_substream *substream;
-	struct snd_dma_buffer *buf;
-	int stream;
-
-	for (stream = SNDRV_PCM_STREAM_PLAYBACK;
-	     stream < SNDRV_PCM_STREAM_LAST; stream++) {
-		substream = pcm->streams[stream].substream;
-		if (!substream)
-			continue;
-
-		buf = &substream->dma_buffer;
-		if (!buf->area)
-			continue;
-
-		dma_free_wc(pcm->card->dev, buf->bytes,
-			    buf->area, buf->addr);
-		buf->area = NULL;
-	}
-}
-
 static int imx_rpmsg_pcm_new(struct snd_soc_component *component,
 			     struct snd_soc_pcm_runtime *rtd)
 {
@@ -663,40 +599,19 @@ static int imx_rpmsg_pcm_new(struct snd_soc_component *component,
 	if (ret)
 		return ret;
 
-	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream) {
-		ret = imx_rpmsg_pcm_preallocate_dma_buffer(pcm, SNDRV_PCM_STREAM_PLAYBACK,
-							   rpmsg->buffer_size);
-		if (ret)
-			goto out;
-	}
-
-	if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream) {
-		ret = imx_rpmsg_pcm_preallocate_dma_buffer(pcm, SNDRV_PCM_STREAM_CAPTURE,
-							   rpmsg->buffer_size);
-		if (ret)
-			goto out;
-	}
-
 	imx_rpmsg_pcm_hardware.buffer_bytes_max = rpmsg->buffer_size;
-out:
-	/* free preallocated buffers in case of error */
-	if (ret)
-		imx_rpmsg_pcm_free_dma_buffers(component, pcm);
-
-	return ret;
+	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV_WC,
+					    pcm->card->dev, rpmsg->buffer_size);
 }
 
 static const struct snd_soc_component_driver imx_rpmsg_soc_component = {
 	.name		= IMX_PCM_DRV_NAME,
 	.pcm_construct	= imx_rpmsg_pcm_new,
-	.pcm_destruct	= imx_rpmsg_pcm_free_dma_buffers,
 	.open		= imx_rpmsg_pcm_open,
 	.close		= imx_rpmsg_pcm_close,
 	.hw_params	= imx_rpmsg_pcm_hw_params,
-	.hw_free	= imx_rpmsg_pcm_hw_free,
 	.trigger	= imx_rpmsg_pcm_trigger,
 	.pointer	= imx_rpmsg_pcm_pointer,
-	.mmap		= imx_rpmsg_pcm_mmap,
 	.ack		= imx_rpmsg_pcm_ack,
 	.prepare	= imx_rpmsg_pcm_prepare,
 };
-- 
2.26.2

