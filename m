Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D31583BF87A
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 12:33:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B8D116A6;
	Thu,  8 Jul 2021 12:33:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B8D116A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625740436;
	bh=5LImT9vrj6YIDqA51qYbJ0WPAdoqxMXJpy3vBFG5zGM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nKMf2bT+3d9xUix8PRO0dJx2LgqEd5qBY/trTGGGG1MNNFK2SaUC2WVzIIeWO6UTv
	 Eg0Z07LH7Q/e1mAC2+m/eklYUQ9CV7jdpUEV76b6rDbyaExjA7yyl91nnQxVtWrNvx
	 wSRMz/KxcrYLIeEV3yQgxP1vlmPamTat6sEncxXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66207F804CB;
	Thu,  8 Jul 2021 12:32:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4880CF80425; Thu,  8 Jul 2021 12:32:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09CD9F80143
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 12:32:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09CD9F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uVJgCFDb"
Received: by mail-wm1-x336.google.com with SMTP id
 y21-20020a7bc1950000b02902161fccabf1so3139539wmi.2
 for <alsa-devel@alsa-project.org>; Thu, 08 Jul 2021 03:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tO5HC3gfmh06E2sEiP3cU1erx77lS2IeuRXzwxdfzxI=;
 b=uVJgCFDb1ggGJRSuhFrurxiWu+llAWdvcyt8LrQgCHxk953RMruRelUJes2MTLCq24
 IUCHHT/EII4lN02aj3kvJaG3O7XSjzkjCuw7uTarkjfjFzNdk26XDOt74IGa51bFOPqE
 ZPJrvHYWXSeb6P+97YV4kA2Hr4xz/T5n1TPsKWG5NkyASMJil8Tazqr+KhC+sV5Swsoz
 XqM+MWL4qkab8ZhfxUcJ2e1w0z5D/nbDb3uFLxc7C1/kNdI8NmKpejbOCkVNbnqLsClG
 A8lGtE2ylp/JrROlBIAJCMg/J/CNAa5EZsxhBDZUpjEZafjbv3A12Fd4g0drmVt5kuDx
 ix1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tO5HC3gfmh06E2sEiP3cU1erx77lS2IeuRXzwxdfzxI=;
 b=GM8rItcWdoOAuDi56vOdzNnuXmsZUWP4l1mCRoUGj/Nxn8l+tOofCp0L1mIQXKO+vQ
 Xsji/WtAAukk+E3dNhjx+pIZaOthvN12hZEhOKAddedSdmpFPm1nLaNu9pwNFQm9Nj1O
 +l6vG2eXIVgMbDLIuc/oNJptuNpyAJi6t92+w/OTG2zwr5auSpYROkyHyAr47DJv8x+k
 iXcHo5jk/gycFVOOuaDU+poeqAaPIV5w7BUZjCGMbxMUIJbkRIEQFbUxcsiBvApboNEQ
 le2foT6Dp9KX8hG1qpWrIkVzDYzP45CwxyHNpdKCyephHSKfrcsbLVFonRwxX9pm35M2
 10IQ==
X-Gm-Message-State: AOAM532p/8eD2iyiICjIkH+X3xT2NIqSEgBBfNpySCcqF42RzgPzoFws
 YfohSVvabrnrzbHPHt+1k9Q=
X-Google-Smtp-Source: ABdhPJwE9uGdNnIM/YZazj6nUG7ix2UX4o0q/RCAlx6gO1L2U88Odw0lzqYHHJSJNgD5Wr9eu49MMg==
X-Received: by 2002:a1c:59c3:: with SMTP id n186mr4520767wmb.48.1625740326040; 
 Thu, 08 Jul 2021 03:32:06 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id v30sm1617813wrv.85.2021.07.08.03.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 03:32:05 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 1/2] ASoC: tegra: Use ADMAIF component for DMA allocations
Date: Thu,  8 Jul 2021 12:34:31 +0200
Message-Id: <20210708103432.1690385-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210708103432.1690385-1-thierry.reding@gmail.com>
References: <20210708103432.1690385-1-thierry.reding@gmail.com>
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
Changes in v2:
- add backwards-compatibility fallback for Tegra186

 sound/soc/tegra/tegra_pcm.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
index 573374b89b10..d3276b4595af 100644
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
@@ -284,7 +281,16 @@ static int tegra_pcm_dma_allocate(struct snd_soc_pcm_runtime *rtd,
 int tegra_pcm_construct(struct snd_soc_component *component,
 			struct snd_soc_pcm_runtime *rtd)
 {
-	return tegra_pcm_dma_allocate(rtd, tegra_pcm_hardware.buffer_bytes_max);
+	struct device *dev = component->dev;
+
+	/*
+	 * Fallback for backwards-compatibility with older device trees that
+	 * have the iommus property in the virtual, top-level "sound" node.
+	 */
+	if (!of_get_property(dev->of_node, "iommus", NULL))
+		dev = rtd->card->snd_card->dev;
+
+	return tegra_pcm_dma_allocate(dev, rtd, tegra_pcm_hardware.buffer_bytes_max);
 }
 EXPORT_SYMBOL_GPL(tegra_pcm_construct);
 
-- 
2.32.0

