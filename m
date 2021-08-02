Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8204E3DD145
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 09:35:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BBDA1825;
	Mon,  2 Aug 2021 09:34:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BBDA1825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627889700;
	bh=3HxRS/pOsp7jb3AaBrZMJE8ZybrJ0G+mNBMJkVZON+Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uZ+uN42cbp8wwFRmjbtmYlQ7XNac8DSOx5TB/nEZDezO/DDy7YIsNa8o7barLhSUz
	 EpNyebNlCBgBB4j+HoNvN4KoMBSKXb+zqKzgCPQxV6p3Xp+I36GCtDTAHDY1h6CFpP
	 MyUdiL5IJcIbv3lsUzf/i7pqILMV+DV8QqsJEqIE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AD13F80544;
	Mon,  2 Aug 2021 09:29:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A08D3F80544; Mon,  2 Aug 2021 09:29:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA9D7F804BB
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 09:28:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA9D7F804BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="EKqjMT6V"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="KNesE0kA"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 786F91FF3B;
 Mon,  2 Aug 2021 07:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627889298; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nR1sBCV9vZJYsDibr+p+hwpgVADIJo/2b3keeUzfz2c=;
 b=EKqjMT6V5kQm60MbrQHU3dKUxl9ir6AXFm2wQbn+APPyjQaoaGkgMgni06sUcWudkUqhI7
 R1d7N2xiAzpN5R7pooimcZzGmMmryEKyH8TW/DsUe4edC+ndUxguPZI8jKhMc24H82AlCN
 jRgsix4Sgt+bDoNjN9jnAMdzlBnsysU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627889298;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nR1sBCV9vZJYsDibr+p+hwpgVADIJo/2b3keeUzfz2c=;
 b=KNesE0kAWyHCS4P+VYy9ERYKYCTx00DnWspwSDf3sK6diC66JWbHf/+AtbSzVgSJA74hLm
 XZYhuDKE1E+zzsCw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 72619A3B85;
 Mon,  2 Aug 2021 07:28:18 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 13/15] ASoC: qcom: lpass: Use managed buffer allocation
Date: Mon,  2 Aug 2021 09:28:13 +0200
Message-Id: <20210802072815.13551-14-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210802072815.13551-1-tiwai@suse.de>
References: <20210802072815.13551-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Banajit Goswami <bgoswami@codeaurora.org>, Mark Brown <broonie@kernel.org>
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

This patch simplifies the buffer pre-allocation code of qcom lpass
driver with the standard managed buffer helper.  It uses the newly
introduced fixed-size buffer allocation helper.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Banajit Goswami <bgoswami@codeaurora.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/qcom/lpass-platform.c | 60 ++-------------------------------
 1 file changed, 2 insertions(+), 58 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index f9df76d37858..a59e9d20cb46 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -156,8 +156,6 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
-	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
-
 	return 0;
 }
 
@@ -630,16 +628,6 @@ static snd_pcm_uframes_t lpass_platform_pcmops_pointer(
 	return bytes_to_frames(substream->runtime, curr_addr - base_addr);
 }
 
-static int lpass_platform_pcmops_mmap(struct snd_soc_component *component,
-				      struct snd_pcm_substream *substream,
-				      struct vm_area_struct *vma)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-
-	return dma_mmap_coherent(component->dev, vma, runtime->dma_area,
-				 runtime->dma_addr, runtime->dma_bytes);
-}
-
 static irqreturn_t lpass_dma_interrupt_handler(
 			struct snd_pcm_substream *substream,
 			struct lpass_data *drvdata,
@@ -787,52 +775,10 @@ static int lpass_platform_pcm_new(struct snd_soc_component *component,
 				  struct snd_soc_pcm_runtime *soc_runtime)
 {
 	struct snd_pcm *pcm = soc_runtime->pcm;
-	struct snd_pcm_substream *psubstream, *csubstream;
-	int ret;
 	size_t size = lpass_platform_pcm_hardware.buffer_bytes_max;
 
-	psubstream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
-	if (psubstream) {
-		ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV,
-					component->dev,
-					size, &psubstream->dma_buffer);
-		if (ret) {
-			dev_err(soc_runtime->dev, "Cannot allocate buffer(s)\n");
-			return ret;
-		}
-	}
-
-	csubstream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
-	if (csubstream) {
-		ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV,
-					component->dev,
-					size, &csubstream->dma_buffer);
-		if (ret) {
-			dev_err(soc_runtime->dev, "Cannot allocate buffer(s)\n");
-			if (psubstream)
-				snd_dma_free_pages(&psubstream->dma_buffer);
-			return ret;
-		}
-
-	}
-
-	return 0;
-}
-
-static void lpass_platform_pcm_free(struct snd_soc_component *component,
-				    struct snd_pcm *pcm)
-{
-	struct snd_pcm_substream *substream;
-	int i;
-
-	for_each_pcm_streams(i) {
-		substream = pcm->streams[i].substream;
-		if (substream) {
-			snd_dma_free_pages(&substream->dma_buffer);
-			substream->dma_buffer.area = NULL;
-			substream->dma_buffer.addr = 0;
-		}
-	}
+	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+					    component->dev, size);
 }
 
 static int lpass_platform_pcmops_suspend(struct snd_soc_component *component)
@@ -877,9 +823,7 @@ static const struct snd_soc_component_driver lpass_component_driver = {
 	.prepare	= lpass_platform_pcmops_prepare,
 	.trigger	= lpass_platform_pcmops_trigger,
 	.pointer	= lpass_platform_pcmops_pointer,
-	.mmap		= lpass_platform_pcmops_mmap,
 	.pcm_construct	= lpass_platform_pcm_new,
-	.pcm_destruct	= lpass_platform_pcm_free,
 	.suspend		= lpass_platform_pcmops_suspend,
 	.resume			= lpass_platform_pcmops_resume,
 
-- 
2.26.2

