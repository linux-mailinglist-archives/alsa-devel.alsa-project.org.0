Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E743DD13F
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 09:33:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB03116A3;
	Mon,  2 Aug 2021 09:32:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB03116A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627889609;
	bh=9Af7SB3PctODiwsqkjtVoJuR6FEIMc3Qihv30zM4gWM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kSq3B1Aco8Z24Ps6L41KDyk8eiTfmiRWWVz9FukEYwhz+kDyM4ByB14WBwHNclDY9
	 FXpRKyYNF7wmz0jF3eqvxCSFJWKmUajggOJzRlbA7vZH0p45N3CCRxI9k4vSqJOBEt
	 HoLyMbONuq0+5VsGT/seTia0X0iV4TU2ZF+av42A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF955F8052E;
	Mon,  2 Aug 2021 09:29:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A0C6F804F2; Mon,  2 Aug 2021 09:28:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA698F80095
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 09:28:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA698F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="aw71b/7m"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="pmHnkkBR"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 744461FF39;
 Mon,  2 Aug 2021 07:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627889298; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RCxKYjZQPU7IXrU9OgGuwm0/3Bp/fVIfCXKuL4GIT8s=;
 b=aw71b/7majcpc5nCGbVqk5wmWKR37dy2bUclPcHvLiXyym76ppFnxYzWLr6SoF210kDayZ
 nKIytObljphJNJRgy9RGN2TdGH5ABEswlNfunRxoUG9/0qSWISIJa+zAVxngFiXFSGaKx1
 ozMoJxuVzAWQCrazGb42fijoUP9zPAk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627889298;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RCxKYjZQPU7IXrU9OgGuwm0/3Bp/fVIfCXKuL4GIT8s=;
 b=pmHnkkBRmPl1F9TBn4d+GuQpT7CzGC1qoVTriz9xFCrQDIeL1u5+Dw0hX6Y9Q0PYMj7xrE
 RLVBxzyX+C/aUeBA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 6386BA3B83;
 Mon,  2 Aug 2021 07:28:18 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 12/15] ASoC: mpc5200: Use managed buffer allocation
Date: Mon,  2 Aug 2021 09:28:12 +0200
Message-Id: <20210802072815.13551-13-tiwai@suse.de>
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

This patch simplifies the buffer pre-allocation code of fsl mpc5200
driver with the standard managed buffer helper.  It uses the newly
introduced fixed-size buffer allocation helper.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/fsl/mpc5200_dma.c | 63 ++-----------------------------------
 1 file changed, 2 insertions(+), 61 deletions(-)

diff --git a/sound/soc/fsl/mpc5200_dma.c b/sound/soc/fsl/mpc5200_dma.c
index 6c65cd858b0b..901497810020 100644
--- a/sound/soc/fsl/mpc5200_dma.c
+++ b/sound/soc/fsl/mpc5200_dma.c
@@ -98,13 +98,6 @@ static irqreturn_t psc_dma_bcom_irq(int irq, void *_psc_dma_stream)
 	return IRQ_HANDLED;
 }
 
-static int psc_dma_hw_free(struct snd_soc_component *component,
-			   struct snd_pcm_substream *substream)
-{
-	snd_pcm_set_runtime_buffer(substream, NULL);
-	return 0;
-}
-
 /**
  * psc_dma_trigger: start and stop the DMA transfer.
  *
@@ -285,15 +278,6 @@ psc_dma_pointer(struct snd_soc_component *component,
 	return bytes_to_frames(substream->runtime, count);
 }
 
-static int psc_dma_hw_params(struct snd_soc_component *component,
-			     struct snd_pcm_substream *substream,
-			     struct snd_pcm_hw_params *params)
-{
-	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
-
-	return 0;
-}
-
 static int psc_dma_new(struct snd_soc_component *component,
 		       struct snd_soc_pcm_runtime *rtd)
 {
@@ -310,60 +294,17 @@ static int psc_dma_new(struct snd_soc_component *component,
 	if (rc)
 		return rc;
 
-	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream) {
-		rc = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, pcm->card->dev,
-				size, &pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream->dma_buffer);
-		if (rc)
-			goto playback_alloc_err;
-	}
-
-	if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream) {
-		rc = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, pcm->card->dev,
-				size, &pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream->dma_buffer);
-		if (rc)
-			goto capture_alloc_err;
-	}
-
-	return 0;
-
- capture_alloc_err:
-	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream)
-		snd_dma_free_pages(&pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream->dma_buffer);
-
- playback_alloc_err:
-	dev_err(card->dev, "Cannot allocate buffer(s)\n");
-
-	return -ENOMEM;
-}
-
-static void psc_dma_free(struct snd_soc_component *component,
-			 struct snd_pcm *pcm)
-{
-	struct snd_pcm_substream *substream;
-	int stream;
-
-	dev_dbg(component->dev, "psc_dma_free(pcm=%p)\n", pcm);
-
-	for (stream = 0; stream < 2; stream++) {
-		substream = pcm->streams[stream].substream;
-		if (substream) {
-			snd_dma_free_pages(&substream->dma_buffer);
-			substream->dma_buffer.area = NULL;
-			substream->dma_buffer.addr = 0;
-		}
-	}
+	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, card->dev,
+					    size);
 }
 
 static const struct snd_soc_component_driver mpc5200_audio_dma_component = {
 	.name		= DRV_NAME,
 	.open		= psc_dma_open,
 	.close		= psc_dma_close,
-	.hw_free	= psc_dma_hw_free,
 	.pointer	= psc_dma_pointer,
 	.trigger	= psc_dma_trigger,
-	.hw_params	= psc_dma_hw_params,
 	.pcm_construct	= psc_dma_new,
-	.pcm_destruct	= psc_dma_free,
 };
 
 int mpc5200_audio_dma_create(struct platform_device *op)
-- 
2.26.2

