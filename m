Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B093DD136
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 09:32:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C56817D2;
	Mon,  2 Aug 2021 09:31:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C56817D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627889569;
	bh=UxwNLv6NBg8P8h9RfQupZ81k+QAfy2e+THU8qDXjcBs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H5fR+veQ+6rtl6ex3Uv8/u6PtaHhqvfySLOrc43b1SmUMa143/xlkZds/fQpODVCa
	 VNvuHbpDMvy7+LWr1dNZjz8pRhX8aUGZ9qnDfHOxm/5US69W7GotiF7dBuA4Jq+FQG
	 xy3/2VEQ3+H9FAN2bGtZspknfrGiOlrUvrp6jIPM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8D62F8051D;
	Mon,  2 Aug 2021 09:28:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34F15F80279; Mon,  2 Aug 2021 09:28:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC2F0F802C4
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 09:28:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC2F0F802C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="e8c7s8wV"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="5rNNx3Om"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 54C4B1FF38;
 Mon,  2 Aug 2021 07:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627889298; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pmda/XrSprLClbY/FF5n6lIdWiTtgyzqPauil82aqoQ=;
 b=e8c7s8wVraiczZQqfr2Ky1oH3HUXuXv3iawCoUFe+2tysm4coY8KiNuN4vNqS8mcCNXrmw
 gCYfT6l5AH7Hg3VoBd7So2U9dIroNEPG/mobCURSnQAjPOeTu6r8wK1RPV6SE5j5391fUD
 RfUpS5PGoyBurQ0eRSH4LcBgfldPyWU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627889298;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pmda/XrSprLClbY/FF5n6lIdWiTtgyzqPauil82aqoQ=;
 b=5rNNx3OmjWPwDSUfD2Owj1L8CJougnNvLvhSE5zKjZwpL/ScPFeIaQ076q5eFt6bhEeNv3
 jfpPCWw1IByCdsBA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 41FAEA3B83;
 Mon,  2 Aug 2021 07:28:18 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/15] ASoC: fsl_asrc_dma: Use managed buffer allocation
Date: Mon,  2 Aug 2021 09:28:10 +0200
Message-Id: <20210802072815.13551-11-tiwai@suse.de>
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

This patch simplifies the buffer pre-allocation code of fsl_asrc_dma
driver with the standard managed buffer helper.  It uses the newly
introduced fixed-size buffer allocation helper.

Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/fsl/fsl_asrc_dma.c | 47 +++---------------------------------
 1 file changed, 3 insertions(+), 44 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index c313a26c8f95..cd9b36ec0ecb 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -284,8 +284,6 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 		return ret;
 	}
 
-	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
-
 	return 0;
 }
 
@@ -297,8 +295,6 @@ static int fsl_asrc_dma_hw_free(struct snd_soc_component *component,
 	struct fsl_asrc_pair *pair = runtime->private_data;
 	u8 dir = tx ? OUT : IN;
 
-	snd_pcm_set_runtime_buffer(substream, NULL);
-
 	if (pair->dma_chan[!dir])
 		dma_release_channel(pair->dma_chan[!dir]);
 
@@ -423,9 +419,8 @@ static int fsl_asrc_dma_pcm_new(struct snd_soc_component *component,
 				struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_card *card = rtd->card->snd_card;
-	struct snd_pcm_substream *substream;
 	struct snd_pcm *pcm = rtd->pcm;
-	int ret, i;
+	int ret;
 
 	ret = dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
 	if (ret) {
@@ -433,43 +428,8 @@ static int fsl_asrc_dma_pcm_new(struct snd_soc_component *component,
 		return ret;
 	}
 
-	for_each_pcm_streams(i) {
-		substream = pcm->streams[i].substream;
-		if (!substream)
-			continue;
-
-		ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, pcm->card->dev,
-				FSL_ASRC_DMABUF_SIZE, &substream->dma_buffer);
-		if (ret) {
-			dev_err(card->dev, "failed to allocate DMA buffer\n");
-			goto err;
-		}
-	}
-
-	return 0;
-
-err:
-	if (--i == 0 && pcm->streams[i].substream)
-		snd_dma_free_pages(&pcm->streams[i].substream->dma_buffer);
-
-	return ret;
-}
-
-static void fsl_asrc_dma_pcm_free(struct snd_soc_component *component,
-				  struct snd_pcm *pcm)
-{
-	struct snd_pcm_substream *substream;
-	int i;
-
-	for_each_pcm_streams(i) {
-		substream = pcm->streams[i].substream;
-		if (!substream)
-			continue;
-
-		snd_dma_free_pages(&substream->dma_buffer);
-		substream->dma_buffer.area = NULL;
-		substream->dma_buffer.addr = 0;
-	}
+	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+					    card->dev, FSL_ASRC_DMABUF_SIZE);
 }
 
 struct snd_soc_component_driver fsl_asrc_component = {
@@ -481,6 +441,5 @@ struct snd_soc_component_driver fsl_asrc_component = {
 	.close		= fsl_asrc_dma_shutdown,
 	.pointer	= fsl_asrc_dma_pcm_pointer,
 	.pcm_construct	= fsl_asrc_dma_pcm_new,
-	.pcm_destruct	= fsl_asrc_dma_pcm_free,
 };
 EXPORT_SYMBOL_GPL(fsl_asrc_component);
-- 
2.26.2

