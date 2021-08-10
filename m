Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F60E3E59D9
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Aug 2021 14:24:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3D9C1695;
	Tue, 10 Aug 2021 14:23:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3D9C1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628598286;
	bh=1d/yWPxQ17Q8Iwxml+sPboUMgRcOJNGMwgQ9HrCcQPU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U7RigObFjfdqchiv7ipvnC+NSPFTmkjh0wbclj5er8xE/Pcb7Nf8mKFo5LOpzu8sB
	 DKJKwWV4vUt6De6IpsirPkkLV7BbMY0PDcsxy8Av3tOfotaEs0uDCm9YLtcmJjALZl
	 cA2Pb+DqespaWMX6KtUfplaKGIgZWD6zrfCj+WVA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A021EF804EB;
	Tue, 10 Aug 2021 14:22:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A4F3F8025D; Tue, 10 Aug 2021 14:22:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 070F6F8016B
 for <alsa-devel@alsa-project.org>; Tue, 10 Aug 2021 14:22:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 070F6F8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="dLWbGYV8"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="M9uSO8iR"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id C41311FE4B
 for <alsa-devel@alsa-project.org>; Tue, 10 Aug 2021 12:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628598123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3OlSDU7YB2UMwzi2nG0Xk724oFxja1GqTCKV8x2q2l4=;
 b=dLWbGYV8zNbp+Y1Z+48x9lSTvqp8z+ffMwX6Q9X5jy/9Z9kvKkbsqHUnc9g15G/NJJpkgj
 goei1b7ezrrj/oO4q2M4hpiaQbQkkOBBm+wE+rJ/kubnixsB3XRCDm9MUTe9WE+9ozEi0B
 NvjYn0FdR4J/81rkNymbemI7DNf8meI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628598123;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3OlSDU7YB2UMwzi2nG0Xk724oFxja1GqTCKV8x2q2l4=;
 b=M9uSO8iRXORiAr34x0Xk7aXxd1YkvqHUSeDw84XqxpH2No2s3uvA5rKiooGtCKQvnKO/Om
 zHwRZnFOo5nNySAw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id B2D08A3B88;
 Tue, 10 Aug 2021 12:22:03 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH RFC 3/5] ALSA: memalloc: Assign ops field to snd_dma_buffer
Date: Tue, 10 Aug 2021 14:21:58 +0200
Message-Id: <20210810122200.971-4-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210810122200.971-1-tiwai@suse.de>
References: <20210810122200.971-1-tiwai@suse.de>
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

This is for performance optimization.  Instead of deducing the ops
from the type at each time, store the ops table directly in
snd_dma_buffer struct and refer to it.  The upcoming sync ops will be
in a hot path, hence some optimization is required.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/memalloc.h |  2 ++
 sound/core/memalloc.c    | 53 ++++++++++++++++------------------------
 2 files changed, 23 insertions(+), 32 deletions(-)

diff --git a/include/sound/memalloc.h b/include/sound/memalloc.h
index b197e3f431c1..f5f0d32f6d61 100644
--- a/include/sound/memalloc.h
+++ b/include/sound/memalloc.h
@@ -13,6 +13,7 @@
 
 struct device;
 struct vm_area_struct;
+struct snd_malloc_ops;
 
 /*
  * buffer device info
@@ -55,6 +56,7 @@ struct snd_dma_buffer {
 	dma_addr_t addr;	/* physical address */
 	size_t bytes;		/* buffer size in bytes */
 	void *private_data;	/* private for allocator; don't touch */
+	const struct snd_malloc_ops *ops;	/* assigned ops */
 };
 
 /*
diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index c7c943c661e6..3f42376dfb0b 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -29,15 +29,6 @@ static inline gfp_t snd_mem_get_gfp_flags(const struct snd_dma_buffer *dmab,
 		return (__force gfp_t)(unsigned long)dmab->dev.dev;
 }
 
-static void *__snd_dma_alloc_pages(struct snd_dma_buffer *dmab, size_t size)
-{
-	const struct snd_malloc_ops *ops = snd_dma_get_ops(dmab);
-
-	if (WARN_ON_ONCE(!ops || !ops->alloc))
-		return NULL;
-	return ops->alloc(dmab, size);
-}
-
 /**
  * snd_dma_alloc_pages - allocate the buffer area according to the given type
  * @type: the DMA buffer type
@@ -54,6 +45,7 @@ static void *__snd_dma_alloc_pages(struct snd_dma_buffer *dmab, size_t size)
 int snd_dma_alloc_pages(int type, struct device *device, size_t size,
 			struct snd_dma_buffer *dmab)
 {
+	const struct snd_malloc_ops *ops;
 	if (WARN_ON(!size))
 		return -ENXIO;
 	if (WARN_ON(!dmab))
@@ -65,9 +57,15 @@ int snd_dma_alloc_pages(int type, struct device *device, size_t size,
 	dmab->bytes = 0;
 	dmab->addr = 0;
 	dmab->private_data = NULL;
-	dmab->area = __snd_dma_alloc_pages(dmab, size);
-	if (!dmab->area)
+	ops = snd_dma_get_ops(dmab);
+	if (WARN_ON(!ops || !ops->alloc))
+		return -ENXIO;
+	dmab->ops = ops;
+	dmab->area = ops->alloc(dmab, size);
+	if (!dmab->area) {
+		dmab->ops = NULL;
 		return -ENOMEM;
+	}
 	dmab->bytes = size;
 	return 0;
 }
@@ -115,10 +113,8 @@ EXPORT_SYMBOL(snd_dma_alloc_pages_fallback);
  */
 void snd_dma_free_pages(struct snd_dma_buffer *dmab)
 {
-	const struct snd_malloc_ops *ops = snd_dma_get_ops(dmab);
-
-	if (ops && ops->free)
-		ops->free(dmab);
+	if (dmab->ops && dmab->ops->free)
+		dmab->ops->free(dmab);
 }
 EXPORT_SYMBOL(snd_dma_free_pages);
 
@@ -176,10 +172,8 @@ EXPORT_SYMBOL_GPL(snd_devm_alloc_pages);
 int snd_dma_buffer_mmap(struct snd_dma_buffer *dmab,
 			struct vm_area_struct *area)
 {
-	const struct snd_malloc_ops *ops = snd_dma_get_ops(dmab);
-
-	if (ops && ops->mmap)
-		return ops->mmap(dmab, area);
+	if (dmab && dmab->ops && dmab->ops->mmap)
+		return dmab->ops->mmap(dmab, area);
 	else
 		return -ENOENT;
 }
@@ -192,10 +186,8 @@ EXPORT_SYMBOL(snd_dma_buffer_mmap);
  */
 dma_addr_t snd_sgbuf_get_addr(struct snd_dma_buffer *dmab, size_t offset)
 {
-	const struct snd_malloc_ops *ops = snd_dma_get_ops(dmab);
-
-	if (ops && ops->get_addr)
-		return ops->get_addr(dmab, offset);
+	if (dmab->ops && dmab->ops->get_addr)
+		return dmab->ops->get_addr(dmab, offset);
 	else
 		return dmab->addr + offset;
 }
@@ -208,10 +200,8 @@ EXPORT_SYMBOL(snd_sgbuf_get_addr);
  */
 struct page *snd_sgbuf_get_page(struct snd_dma_buffer *dmab, size_t offset)
 {
-	const struct snd_malloc_ops *ops = snd_dma_get_ops(dmab);
-
-	if (ops && ops->get_page)
-		return ops->get_page(dmab, offset);
+	if (dmab->ops && dmab->ops->get_page)
+		return dmab->ops->get_page(dmab, offset);
 	else
 		return virt_to_page(dmab->area + offset);
 }
@@ -227,10 +217,8 @@ EXPORT_SYMBOL(snd_sgbuf_get_page);
 unsigned int snd_sgbuf_get_chunk_size(struct snd_dma_buffer *dmab,
 				      unsigned int ofs, unsigned int size)
 {
-	const struct snd_malloc_ops *ops = snd_dma_get_ops(dmab);
-
-	if (ops && ops->get_chunk_size)
-		return ops->get_chunk_size(dmab, ofs, size);
+	if (dmab->ops && dmab->ops->get_chunk_size)
+		return dmab->ops->get_chunk_size(dmab, ofs, size);
 	else
 		return size;
 }
@@ -362,7 +350,8 @@ static void *snd_dma_iram_alloc(struct snd_dma_buffer *dmab, size_t size)
 	 * so if we fail to malloc, try to fetch memory traditionally.
 	 */
 	dmab->dev.type = SNDRV_DMA_TYPE_DEV;
-	return __snd_dma_alloc_pages(dmab, size);
+	dmab->ops = snd_dma_get_ops(dmab);
+	return dmab->ops->alloc(dmab, size);
 }
 
 static void snd_dma_iram_free(struct snd_dma_buffer *dmab)
-- 
2.26.2

