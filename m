Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 802E03DD146
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 09:35:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11EDD181D;
	Mon,  2 Aug 2021 09:34:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11EDD181D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627889720;
	bh=wKHvLjiKWIBZOLo/9fS7MsdTILFBc15noup0EYr/U8I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GapcctThnrOaLU0eqBE4TBuGWmWn3GyMWR5hAjb390XdbWFCutTj7saJCwJ4Itr+x
	 m165z4dIt8LWLrXdwiiXVh+e0LG60gPV1hbI+KMedJqvwdUZQKcihDrt7sMPkjQ9qG
	 8aj2OEyiAlDXkkeNzcaOdwcc+HuoiJ6IS4yTyyuM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 692A5F80558;
	Mon,  2 Aug 2021 09:29:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4944F8053B; Mon,  2 Aug 2021 09:29:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6318F80271
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 09:28:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6318F80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="dYZ0kLU5"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="JVlC1eE8"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 651AF21FE3;
 Mon,  2 Aug 2021 07:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627889298; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M/WvhjUnCELc0LVjUlcabPo/7Rtp/A5ga8IO3Ub1nHw=;
 b=dYZ0kLU5TreYIlo8gPFpDau9azuYSYjUqU+4Fn68XMlvBTLYwjgCnXr0Qvjmlr4sWxGwHt
 PqWExTuZV73QgfaQV2WLxMHwSmDAUBHp5BYUC9I0Htg6oFMk10tH8KVU8Gjimgvf9ZJwkX
 lLnvvJqv25vEEXU/C/JjE/0cHTEUbco=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627889298;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M/WvhjUnCELc0LVjUlcabPo/7Rtp/A5ga8IO3Ub1nHw=;
 b=JVlC1eE8OEJ58ehC9NDcyIvgYM0wxOmc0maelRwduiwdwBVUUg5bN1KiJXkkIIb+a1LWPG
 UHLKDqUZ1Mw5FHDw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 533D5A3B85;
 Mon,  2 Aug 2021 07:28:18 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/15] ASoC: fsl_dma: Use managed buffer allocation
Date: Mon,  2 Aug 2021 09:28:11 +0200
Message-Id: <20210802072815.13551-12-tiwai@suse.de>
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

This patch simplifies the buffer pre-allocation code of fsl_dma
driver with the standard managed buffer helper.  It uses the newly
introduced fixed-size buffer allocation helper.

Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/fsl/fsl_dma.c | 50 +++--------------------------------------
 1 file changed, 3 insertions(+), 47 deletions(-)

diff --git a/sound/soc/fsl/fsl_dma.c b/sound/soc/fsl/fsl_dma.c
index 84bd8a5356eb..808fb61a7a0f 100644
--- a/sound/soc/fsl/fsl_dma.c
+++ b/sound/soc/fsl/fsl_dma.c
@@ -290,32 +290,9 @@ static int fsl_dma_new(struct snd_soc_component *component,
 	if (ret)
 		return ret;
 
-	/* Some codecs have separate DAIs for playback and capture, so we
-	 * should allocate a DMA buffer only for the streams that are valid.
-	 */
-
-	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream) {
-		ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, card->dev,
-			fsl_dma_hardware.buffer_bytes_max,
-			&pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream->dma_buffer);
-		if (ret) {
-			dev_err(card->dev, "can't alloc playback dma buffer\n");
-			return ret;
-		}
-	}
-
-	if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream) {
-		ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, card->dev,
-			fsl_dma_hardware.buffer_bytes_max,
-			&pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream->dma_buffer);
-		if (ret) {
-			dev_err(card->dev, "can't alloc capture dma buffer\n");
-			snd_dma_free_pages(&pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream->dma_buffer);
-			return ret;
-		}
-	}
-
-	return 0;
+	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+					    card->dev,
+					    fsl_dma_hardware.buffer_bytes_max);
 }
 
 /**
@@ -442,7 +419,6 @@ static int fsl_dma_open(struct snd_soc_component *component,
 
 	dma->assigned = true;
 
-	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
 	snd_soc_set_runtime_hwparams(substream, &fsl_dma_hardware);
 	runtime->private_data = dma_private;
 
@@ -815,25 +791,6 @@ static int fsl_dma_close(struct snd_soc_component *component,
 	return 0;
 }
 
-/*
- * Remove this PCM driver.
- */
-static void fsl_dma_free_dma_buffers(struct snd_soc_component *component,
-				     struct snd_pcm *pcm)
-{
-	struct snd_pcm_substream *substream;
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(pcm->streams); i++) {
-		substream = pcm->streams[i].substream;
-		if (substream) {
-			snd_dma_free_pages(&substream->dma_buffer);
-			substream->dma_buffer.area = NULL;
-			substream->dma_buffer.addr = 0;
-		}
-	}
-}
-
 /**
  * find_ssi_node -- returns the SSI node that points to its DMA channel node
  *
@@ -904,7 +861,6 @@ static int fsl_soc_dma_probe(struct platform_device *pdev)
 	dma->dai.hw_free = fsl_dma_hw_free;
 	dma->dai.pointer = fsl_dma_pointer;
 	dma->dai.pcm_construct = fsl_dma_new;
-	dma->dai.pcm_destruct = fsl_dma_free_dma_buffers;
 
 	/* Store the SSI-specific information that we need */
 	dma->ssi_stx_phys = res.start + REG_SSI_STX0;
-- 
2.26.2

