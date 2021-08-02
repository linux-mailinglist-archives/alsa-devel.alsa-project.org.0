Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 628FF3DD127
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 09:30:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCB1117DA;
	Mon,  2 Aug 2021 09:29:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCB1117DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627889422;
	bh=kUDFfRpgqGweiN7jHoe3QcxyIQW8Vj8+dTEv9QgLV30=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gfMHi8rZWeUSn8QB+c62rusQiRVPOfiwq9Ra522jRHydY7ZsrImx+upKSCOm/aqF3
	 FoMRBWshcR7VXV50ApRDhmyzxaprkWIjyRj38nXN8sxSIQlM8SX5ZkndNFJZRqibIv
	 elJS0DsmDbDZa5OxGy429Rms65mITk6WLhgK06Xg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCCEBF80279;
	Mon,  2 Aug 2021 09:28:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D466F804E4; Mon,  2 Aug 2021 09:28:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55E9CF801F7
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 09:28:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55E9CF801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="MOSE7eW+"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="4ftkZB2i"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 432201FF37;
 Mon,  2 Aug 2021 07:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627889298; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mMa7a2ZIJhTa1n6mMDKX9yZqi+hP2N/DpOoZ8q3npY4=;
 b=MOSE7eW+sPdJh6yTMXPMbVlriDU7/ZYHE5nHXOevKjNzyIpOJGA0UvfMDK2Dq8kxkvufC7
 AVP/VwdF/3nFsrnF9fbazr7EnPSqPatomQm6QgpI/03Dlor14O/MPFJbmFlR7VqV/X4exb
 tBNRWKtzQ1BYqWEJLjGm/M+qZjtHt1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627889298;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mMa7a2ZIJhTa1n6mMDKX9yZqi+hP2N/DpOoZ8q3npY4=;
 b=4ftkZB2iUFh0LvfyrZw4lqjKroELpGg0hv76iBOoENxoIKdH2YkNUfSf3awFmUWDE0olm/
 nel24VCpsG7sFcDA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 31D59A3B85;
 Mon,  2 Aug 2021 07:28:18 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/15] ASoC: tegra: Use managed buffer allocation
Date: Mon,  2 Aug 2021 09:28:09 +0200
Message-Id: <20210802072815.13551-10-tiwai@suse.de>
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

As the standard buffer allocation helper supports WC pages now, we can
convert imx-pcm-rpmsg driver to use that.  This allows us to remove
lots of superfluous code.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/tegra/tegra210_admaif.c |  6 --
 sound/soc/tegra/tegra_pcm.c       | 93 +------------------------------
 sound/soc/tegra/tegra_pcm.h       |  7 ---
 3 files changed, 1 insertion(+), 105 deletions(-)

diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index 0f9beef429a2..bcccdf3ddc52 100644
--- a/sound/soc/tegra/tegra210_admaif.c
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -612,12 +612,9 @@ static const struct snd_soc_component_driver tegra210_admaif_cmpnt = {
 	.controls		= tegra210_admaif_controls,
 	.num_controls		= ARRAY_SIZE(tegra210_admaif_controls),
 	.pcm_construct		= tegra_pcm_construct,
-	.pcm_destruct		= tegra_pcm_destruct,
 	.open			= tegra_pcm_open,
 	.close			= tegra_pcm_close,
 	.hw_params		= tegra_pcm_hw_params,
-	.hw_free		= tegra_pcm_hw_free,
-	.mmap			= tegra_pcm_mmap,
 	.pointer		= tegra_pcm_pointer,
 };
 
@@ -625,12 +622,9 @@ static const struct snd_soc_component_driver tegra186_admaif_cmpnt = {
 	.controls		= tegra186_admaif_controls,
 	.num_controls		= ARRAY_SIZE(tegra186_admaif_controls),
 	.pcm_construct		= tegra_pcm_construct,
-	.pcm_destruct		= tegra_pcm_destruct,
 	.open			= tegra_pcm_open,
 	.close			= tegra_pcm_close,
 	.hw_params		= tegra_pcm_hw_params,
-	.hw_free		= tegra_pcm_hw_free,
-	.mmap			= tegra_pcm_mmap,
 	.pointer		= tegra_pcm_pointer,
 };
 
diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
index d3276b4595af..ef1e74d95236 100644
--- a/sound/soc/tegra/tegra_pcm.c
+++ b/sound/soc/tegra/tegra_pcm.c
@@ -171,41 +171,10 @@ int tegra_pcm_hw_params(struct snd_soc_component *component,
 		return ret;
 	}
 
-	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(tegra_pcm_hw_params);
 
-int tegra_pcm_hw_free(struct snd_soc_component *component,
-		      struct snd_pcm_substream *substream)
-{
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-
-	if (rtd->dai_link->no_pcm)
-		return 0;
-
-	snd_pcm_set_runtime_buffer(substream, NULL);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(tegra_pcm_hw_free);
-
-int tegra_pcm_mmap(struct snd_soc_component *component,
-		   struct snd_pcm_substream *substream,
-		   struct vm_area_struct *vma)
-{
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_pcm_runtime *runtime = substream->runtime;
-
-	if (rtd->dai_link->no_pcm)
-		return 0;
-
-	return dma_mmap_wc(substream->pcm->card->dev, vma, runtime->dma_area,
-			   runtime->dma_addr, runtime->dma_bytes);
-}
-EXPORT_SYMBOL_GPL(tegra_pcm_mmap);
-
 snd_pcm_uframes_t tegra_pcm_pointer(struct snd_soc_component *component,
 				    struct snd_pcm_substream *substream)
 {
@@ -213,41 +182,6 @@ snd_pcm_uframes_t tegra_pcm_pointer(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(tegra_pcm_pointer);
 
-static int tegra_pcm_preallocate_dma_buffer(struct device *dev, struct snd_pcm *pcm, int stream,
-					    size_t size)
-{
-	struct snd_pcm_substream *substream = pcm->streams[stream].substream;
-	struct snd_dma_buffer *buf = &substream->dma_buffer;
-
-	buf->area = dma_alloc_wc(dev, size, &buf->addr, GFP_KERNEL);
-	if (!buf->area)
-		return -ENOMEM;
-
-	buf->private_data = NULL;
-	buf->dev.type = SNDRV_DMA_TYPE_DEV;
-	buf->dev.dev = dev;
-	buf->bytes = size;
-
-	return 0;
-}
-
-static void tegra_pcm_deallocate_dma_buffer(struct snd_pcm *pcm, int stream)
-{
-	struct snd_pcm_substream *substream;
-	struct snd_dma_buffer *buf;
-
-	substream = pcm->streams[stream].substream;
-	if (!substream)
-		return;
-
-	buf = &substream->dma_buffer;
-	if (!buf->area)
-		return;
-
-	dma_free_wc(buf->dev.dev, buf->bytes, buf->area, buf->addr);
-	buf->area = NULL;
-}
-
 static int tegra_pcm_dma_allocate(struct device *dev, struct snd_soc_pcm_runtime *rtd,
 				  size_t size)
 {
@@ -258,24 +192,7 @@ static int tegra_pcm_dma_allocate(struct device *dev, struct snd_soc_pcm_runtime
 	if (ret < 0)
 		return ret;
 
-	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream) {
-		ret = tegra_pcm_preallocate_dma_buffer(dev, pcm, SNDRV_PCM_STREAM_PLAYBACK, size);
-		if (ret)
-			goto err;
-	}
-
-	if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream) {
-		ret = tegra_pcm_preallocate_dma_buffer(dev, pcm, SNDRV_PCM_STREAM_CAPTURE, size);
-		if (ret)
-			goto err_free_play;
-	}
-
-	return 0;
-
-err_free_play:
-	tegra_pcm_deallocate_dma_buffer(pcm, SNDRV_PCM_STREAM_PLAYBACK);
-err:
-	return ret;
+	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV_WC, dev, size);
 }
 
 int tegra_pcm_construct(struct snd_soc_component *component,
@@ -294,14 +211,6 @@ int tegra_pcm_construct(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(tegra_pcm_construct);
 
-void tegra_pcm_destruct(struct snd_soc_component *component,
-			struct snd_pcm *pcm)
-{
-	tegra_pcm_deallocate_dma_buffer(pcm, SNDRV_PCM_STREAM_CAPTURE);
-	tegra_pcm_deallocate_dma_buffer(pcm, SNDRV_PCM_STREAM_PLAYBACK);
-}
-EXPORT_SYMBOL_GPL(tegra_pcm_destruct);
-
 MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
 MODULE_DESCRIPTION("Tegra PCM ASoC driver");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/tegra/tegra_pcm.h b/sound/soc/tegra/tegra_pcm.h
index 4838cdcee20e..d602126c65b7 100644
--- a/sound/soc/tegra/tegra_pcm.h
+++ b/sound/soc/tegra/tegra_pcm.h
@@ -22,8 +22,6 @@
 
 int tegra_pcm_construct(struct snd_soc_component *component,
 			struct snd_soc_pcm_runtime *rtd);
-void tegra_pcm_destruct(struct snd_soc_component *component,
-			struct snd_pcm *pcm);
 int tegra_pcm_open(struct snd_soc_component *component,
 		   struct snd_pcm_substream *substream);
 int tegra_pcm_close(struct snd_soc_component *component,
@@ -31,11 +29,6 @@ int tegra_pcm_close(struct snd_soc_component *component,
 int tegra_pcm_hw_params(struct snd_soc_component *component,
 			struct snd_pcm_substream *substream,
 			struct snd_pcm_hw_params *params);
-int tegra_pcm_hw_free(struct snd_soc_component *component,
-		      struct snd_pcm_substream *substream);
-int tegra_pcm_mmap(struct snd_soc_component *component,
-		   struct snd_pcm_substream *substream,
-		   struct vm_area_struct *vma);
 snd_pcm_uframes_t tegra_pcm_pointer(struct snd_soc_component *component,
 				    struct snd_pcm_substream *substream);
 int tegra_pcm_platform_register(struct device *dev);
-- 
2.26.2

