Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 738D43C7221
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 16:26:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 452F816D0;
	Tue, 13 Jul 2021 16:25:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 452F816D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626186408;
	bh=2BGYWrXBGZJ2umOkUHgE/h0NhuwHvsi2h/cJRb6EGOY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r5MFjy+mHkrFIU6P+VY6D6qCDSSbCuLqDjDhFqfyzHoFMFQxp6wmvNpTicegIX56t
	 lYId47QXalpCDcWRM6oBAoeIDfNg6J0CY4l8+qMHv3sCu8dX94uZgJ3vVKn6UB19As
	 aPaLCs9AXCkn50c7x30AXwIvBZ46q64hKYZqkoks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB882F804E3;
	Tue, 13 Jul 2021 16:25:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79C1EF804E0; Tue, 13 Jul 2021 16:25:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFC9DF800ED
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 16:24:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFC9DF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="yY0I8Ohg"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="qMBZf6nV"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id D3DED201DA
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 14:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626186294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5joqZEry4ixJz2fagLW3ZFdGm3Atk1p7KkBSww/qRU4=;
 b=yY0I8OhgDdAz3JSRsuqHxYNNXAdUDIVlS6ybc8WBeT7iFqWKXjiXYvHy8GYgFx5q0+CeMn
 b0oaGCTiiCIMyhEvMZGXxhqlvdPeDcz1cDArxXAudKJe6SNNVbRlTLMBMohQdyVrK8dp0s
 TuFJKL5jBM27sSeht03x7dKJ+7ILyD4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626186294;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5joqZEry4ixJz2fagLW3ZFdGm3Atk1p7KkBSww/qRU4=;
 b=qMBZf6nVa4/0XZnaYwipNcZL0p+bVwguWM7IWpEltnv6/yUmLFgcfth1eBeByG7yoSzl6R
 wPwSz251xg4v6GBQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id C4D1AA3B8A;
 Tue, 13 Jul 2021 14:24:54 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/51] ALSA: core: Add device-managed page allocator helper
Date: Tue, 13 Jul 2021 16:24:37 +0200
Message-Id: <20210713142445.19252-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210713142445.19252-1-tiwai@suse.de>
References: <20210713142445.19252-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is a preparation for allowing devres usages more widely in
various sound drivers.  As a first step, this patch adds a new
allocator function, snd_devm_alloc_pages(), to manage the allocated
pages via devres, so that the pages will be automagically released as
device unbinding.

Unlike the old snd_dma_alloc_pages(), the new function returns
directly the snd_dma_buffer pointer.  The caller needs NULL-check for
the allocation error appropriately.

Also, since a real device pointer is mandatory for devres,
SNDRV_DMA_TYPE_CONTINUOUS or SNDRV_DMA_TYPE_VMALLOC type can't be used
for this function.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/memalloc.h |  4 ++++
 sound/core/memalloc.c    | 46 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/include/sound/memalloc.h b/include/sound/memalloc.h
index 44d87775b352..d22c9387b2ba 100644
--- a/include/sound/memalloc.h
+++ b/include/sound/memalloc.h
@@ -79,5 +79,9 @@ struct page *snd_sgbuf_get_page(struct snd_dma_buffer *dmab, size_t offset);
 unsigned int snd_sgbuf_get_chunk_size(struct snd_dma_buffer *dmab,
 				      unsigned int ofs, unsigned int size);
 
+/* device-managed memory allocator */
+struct snd_dma_buffer *snd_devm_alloc_pages(struct device *dev, int type,
+					    size_t size);
+
 #endif /* __SOUND_MEMALLOC_H */
 
diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 83b79edfa52d..3a78fdad1ab4 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -127,6 +127,52 @@ void snd_dma_free_pages(struct snd_dma_buffer *dmab)
 }
 EXPORT_SYMBOL(snd_dma_free_pages);
 
+/* called by devres */
+static void __snd_release_pages(struct device *dev, void *res)
+{
+	snd_dma_free_pages(res);
+}
+
+/**
+ * snd_devm_alloc_pages - allocate the buffer and manage with devres
+ * @dev: the device pointer
+ * @type: the DMA buffer type
+ * @size: the buffer size to allocate
+ *
+ * Allocate buffer pages depending on the given type and manage using devres.
+ * The pages will be released automatically at the device removal.
+ *
+ * Unlike snd_dma_alloc_pages(), this function requires the real device pointer,
+ * hence it can't work with SNDRV_DMA_TYPE_CONTINUOUS or
+ * SNDRV_DMA_TYPE_VMALLOC type.
+ *
+ * The function returns the snd_dma_buffer object at success, or NULL if failed.
+ */
+struct snd_dma_buffer *
+snd_devm_alloc_pages(struct device *dev, int type, size_t size)
+{
+	struct snd_dma_buffer *dmab;
+	int err;
+
+	if (WARN_ON(type == SNDRV_DMA_TYPE_CONTINUOUS ||
+		    type == SNDRV_DMA_TYPE_VMALLOC))
+		return NULL;
+
+	dmab = devres_alloc(__snd_release_pages, sizeof(*dmab), GFP_KERNEL);
+	if (!dmab)
+		return NULL;
+
+	err = snd_dma_alloc_pages(type, dev, size, dmab);
+	if (err < 0) {
+		devres_free(dmab);
+		return NULL;
+	}
+
+	devres_add(dev, dmab);
+	return dmab;
+}
+EXPORT_SYMBOL_GPL(snd_devm_alloc_pages);
+
 /**
  * snd_dma_buffer_mmap - perform mmap of the given DMA buffer
  * @dmab: buffer allocation information
-- 
2.26.2

