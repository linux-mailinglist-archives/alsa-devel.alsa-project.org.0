Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7920C3B6819
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Jun 2021 20:11:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13E54169B;
	Mon, 28 Jun 2021 20:10:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13E54169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624903869;
	bh=nLPJExen2H2/1t54II+2JCJescJB28C8ELL1jHvrQwc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h5fWomY4KEQAs1pL/mhfdwA/RyfYsNR/RV+58r9nGdbTiJjL6opECbY9Q8MVhZjFg
	 5qWkDVEBU17+PpdhH1R1CLJ/nee7A7ZU6wCHcjutOOBxn71uBhGnIZPl474yo/UyFW
	 FqfPdkAqvdEyCjvVklVD5S2aePnum3fkFJEQ6ynU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3375DF804DA;
	Mon, 28 Jun 2021 20:09:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7A87F80257; Mon, 28 Jun 2021 20:09:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85414F80217
 for <alsa-devel@alsa-project.org>; Mon, 28 Jun 2021 20:09:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85414F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VzxGxsEC"
Received: by mail-wm1-x329.google.com with SMTP id w13so12082293wmc.3
 for <alsa-devel@alsa-project.org>; Mon, 28 Jun 2021 11:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7cXvDI8Kzqpcqy3dBcYOT9+SxskkDGP9OBiIpKbc+vw=;
 b=VzxGxsECFusZYeydLXp3kGqX1kEeuRJ7P2YVsTKQsEiydF716gM2ynykirBFKoaGED
 3lOA641YG8eqvsQN3oh6RfKGZ0/Ficce7v1w0ZNPY6Wq2iBB47gBe+UHyZatmOo7O9sD
 QvOO5AmcPh/mJMCzCcTkBjQhmvvjMXO+aJCEgSCIZ+O9ERtnYxFMFKYpfet3LsHh5y5g
 rGIi/y42VvVKwmf7Ai7l/bu11nMjVb3Huled2MEugk5kcd9O84U9XRr+T1r4cj2JALel
 KyMyPUOf+h2dW+OsCatNKSOsZsIjVLlR21DbyxuygkG9qidZF1L4z7xAhXRjh7qh8pPs
 8swQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7cXvDI8Kzqpcqy3dBcYOT9+SxskkDGP9OBiIpKbc+vw=;
 b=JExg+gRVnE37/yq5krmY+UuxZfA8YrnhDl31zCkallVecLyW8FOZk8Cu7wTbo3znIn
 tT8eZrvxLew0MabdBtBmUJsbtfKRerk18CQRPerz7dsXMMdJj9iQ5ciyk6fu8ucXhrgZ
 LmnPj48bUp8caBOez8/HUR5YTw4Iypu+Uiu3dw2GUv9kXfnyhxIebLbLSzfGKGJKm1Px
 FnvGkOzqBvgcSg0AswMnrioxPMPv6QygWLYHkaNJRTAfGu35w8z1cQxcptgUQ/DsEcI2
 upWVsoKohjVMWQm6Nr1xMQ6UvMxl/AzoPRKbVS2DDs15Sdu0TxmutaX8bNBrRn6He1zg
 Nfrw==
X-Gm-Message-State: AOAM531uvamxvxo8Vu4rP2aYk7/YAdLqxspCk7cZMTuzt2S7FgNoeqIf
 XgD2dVgkoWEYU5Ymw+sfFto=
X-Google-Smtp-Source: ABdhPJxGfuPsUAde8SSnlWeeLPCBE0PsAoaICKAart/xt6DmvZRurJux+PMaWqH81mTbQHk0Oi8cSQ==
X-Received: by 2002:a1c:7402:: with SMTP id p2mr27595934wmc.88.1624903752551; 
 Mon, 28 Jun 2021 11:09:12 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id x17sm3796487wrn.62.2021.06.28.11.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 11:09:11 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: tegra: Use ADMAIF component for DMA allocations
Date: Mon, 28 Jun 2021 20:11:17 +0200
Message-Id: <20210628181118.2295007-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210628181118.2295007-1-thierry.reding@gmail.com>
References: <20210628181118.2295007-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org
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

From: Thierry Reding <treding@nvidia.com>

DMA memory is currently allocated for the soundcard device, which is a
virtual device added for the sole purpose of "stitching" together the
audio device. It is not a real device and therefore doesn't have a DMA
mask or a description of the path to and from memory of accesses.

Memory accesses really originate from the ADMA controller that provides
the DMA channels used by the PCM component. However, since the DMA
memory is allocated up-front and the DMA channels aren't known at that
point, there is no way of knowing the DMA channel provider at allocation
time.

The next best physical device in the memory path is the ADMAIF. Use it
as the device to allocate DMA memory to. iommus and interconnects device
tree properties can thus be added to the ADMAIF device tree node to
describe the memory access path for audio.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 sound/soc/tegra/tegra_pcm.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
index 573374b89b10..33bdbdfb24ba 100644
--- a/sound/soc/tegra/tegra_pcm.c
+++ b/sound/soc/tegra/tegra_pcm.c
@@ -213,19 +213,19 @@ snd_pcm_uframes_t tegra_pcm_pointer(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(tegra_pcm_pointer);
 
-static int tegra_pcm_preallocate_dma_buffer(struct snd_pcm *pcm, int stream,
+static int tegra_pcm_preallocate_dma_buffer(struct device *dev, struct snd_pcm *pcm, int stream,
 					    size_t size)
 {
 	struct snd_pcm_substream *substream = pcm->streams[stream].substream;
 	struct snd_dma_buffer *buf = &substream->dma_buffer;
 
-	buf->area = dma_alloc_wc(pcm->card->dev, size, &buf->addr, GFP_KERNEL);
+	buf->area = dma_alloc_wc(dev, size, &buf->addr, GFP_KERNEL);
 	if (!buf->area)
 		return -ENOMEM;
 
 	buf->private_data = NULL;
 	buf->dev.type = SNDRV_DMA_TYPE_DEV;
-	buf->dev.dev = pcm->card->dev;
+	buf->dev.dev = dev;
 	buf->bytes = size;
 
 	return 0;
@@ -244,31 +244,28 @@ static void tegra_pcm_deallocate_dma_buffer(struct snd_pcm *pcm, int stream)
 	if (!buf->area)
 		return;
 
-	dma_free_wc(pcm->card->dev, buf->bytes, buf->area, buf->addr);
+	dma_free_wc(buf->dev.dev, buf->bytes, buf->area, buf->addr);
 	buf->area = NULL;
 }
 
-static int tegra_pcm_dma_allocate(struct snd_soc_pcm_runtime *rtd,
+static int tegra_pcm_dma_allocate(struct device *dev, struct snd_soc_pcm_runtime *rtd,
 				  size_t size)
 {
-	struct snd_card *card = rtd->card->snd_card;
 	struct snd_pcm *pcm = rtd->pcm;
 	int ret;
 
-	ret = dma_set_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (ret < 0)
 		return ret;
 
 	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream) {
-		ret = tegra_pcm_preallocate_dma_buffer(pcm,
-			SNDRV_PCM_STREAM_PLAYBACK, size);
+		ret = tegra_pcm_preallocate_dma_buffer(dev, pcm, SNDRV_PCM_STREAM_PLAYBACK, size);
 		if (ret)
 			goto err;
 	}
 
 	if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream) {
-		ret = tegra_pcm_preallocate_dma_buffer(pcm,
-			SNDRV_PCM_STREAM_CAPTURE, size);
+		ret = tegra_pcm_preallocate_dma_buffer(dev, pcm, SNDRV_PCM_STREAM_CAPTURE, size);
 		if (ret)
 			goto err_free_play;
 	}
@@ -284,7 +281,7 @@ static int tegra_pcm_dma_allocate(struct snd_soc_pcm_runtime *rtd,
 int tegra_pcm_construct(struct snd_soc_component *component,
 			struct snd_soc_pcm_runtime *rtd)
 {
-	return tegra_pcm_dma_allocate(rtd, tegra_pcm_hardware.buffer_bytes_max);
+	return tegra_pcm_dma_allocate(component->dev, rtd, tegra_pcm_hardware.buffer_bytes_max);
 }
 EXPORT_SYMBOL_GPL(tegra_pcm_construct);
 
-- 
2.32.0

