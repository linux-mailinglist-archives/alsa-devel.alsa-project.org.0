Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC33A3DD140
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 09:33:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FDDB17D2;
	Mon,  2 Aug 2021 09:33:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FDDB17D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627889631;
	bh=dDocxdnP31OV4cTq93oMKznVRR3zRz0UnXBYlBFV5aU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k0MePbdxR3EEvZ0amwuUra+A8kRfQvRdl5P1eZF1udk7xhpnFJfMK2buRjcnqfLz3
	 YiUICJxoDIQHu1jTcTGlQcCMJ1nvhooty4IetyRDUzB+ZJrwDitp1LfeAezPDxdm4u
	 x6wDQPPJCram54j6q8aj0M7EF2DYBdcjdLB3SU/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78BB8F80533;
	Mon,  2 Aug 2021 09:29:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70A3DF804F2; Mon,  2 Aug 2021 09:28:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D1A0F804E3
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 09:28:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D1A0F804E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="tLW4uWEl"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="7HgH2jOb"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id C24601FF32;
 Mon,  2 Aug 2021 07:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627889297; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4KBXmAS+1ciBjn48XuRD20cRwww90JYs3RxIaA2oBUM=;
 b=tLW4uWElwuAmNeWEr8QISbVi/QXFIFLF2yOa0tGH6SRVPxlKKwJFwx7HvpRRECwvkBDo40
 59qLMJtaG+/1lh8nISPmgxHLKNUCidAz+dD4qt6v7sNNbGo2tH7T5H7L0dzAStzU8qFxtz
 VTLw74o3BJySK3hXOMjsZgKlVxwy6OE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627889297;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4KBXmAS+1ciBjn48XuRD20cRwww90JYs3RxIaA2oBUM=;
 b=7HgH2jOb0UF0ODO64IQXGMYkrQ+LVQPo120Gx2oYo2ZCwNIQJU3AOnP0Jfe/4MSXWbglLA
 vMZrIUpphlMgjUBg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id AF503A3B85;
 Mon,  2 Aug 2021 07:28:17 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/15] ALSA: memalloc: Minor refactoring
Date: Mon,  2 Aug 2021 09:28:01 +0200
Message-Id: <20210802072815.13551-2-tiwai@suse.de>
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

Return the pointer directly from alloc ops instead of setting
dmab->area at each place.  It simplifies the code a bit.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/memalloc.c       | 44 +++++++++++++++----------------------
 sound/core/memalloc_local.h |  2 +-
 sound/core/sgbuf.c          | 13 ++++++-----
 3 files changed, 26 insertions(+), 33 deletions(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 83b79edfa52d..cb56414c0955 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -29,12 +29,12 @@ static inline gfp_t snd_mem_get_gfp_flags(const struct snd_dma_buffer *dmab,
 		return (__force gfp_t)(unsigned long)dmab->dev.dev;
 }
 
-static int __snd_dma_alloc_pages(struct snd_dma_buffer *dmab, size_t size)
+static void *__snd_dma_alloc_pages(struct snd_dma_buffer *dmab, size_t size)
 {
 	const struct snd_malloc_ops *ops = snd_dma_get_ops(dmab);
 
 	if (WARN_ON_ONCE(!ops || !ops->alloc))
-		return -EINVAL;
+		return NULL;
 	return ops->alloc(dmab, size);
 }
 
@@ -54,8 +54,6 @@ static int __snd_dma_alloc_pages(struct snd_dma_buffer *dmab, size_t size)
 int snd_dma_alloc_pages(int type, struct device *device, size_t size,
 			struct snd_dma_buffer *dmab)
 {
-	int err;
-
 	if (WARN_ON(!size))
 		return -ENXIO;
 	if (WARN_ON(!dmab))
@@ -65,12 +63,9 @@ int snd_dma_alloc_pages(int type, struct device *device, size_t size,
 	dmab->dev.type = type;
 	dmab->dev.dev = device;
 	dmab->bytes = 0;
-	dmab->area = NULL;
 	dmab->addr = 0;
 	dmab->private_data = NULL;
-	err = __snd_dma_alloc_pages(dmab, size);
-	if (err < 0)
-		return err;
+	dmab->area = __snd_dma_alloc_pages(dmab, size);
 	if (!dmab->area)
 		return -ENOMEM;
 	dmab->bytes = size;
@@ -198,12 +193,11 @@ EXPORT_SYMBOL(snd_sgbuf_get_chunk_size);
 /*
  * Continuous pages allocator
  */
-static int snd_dma_continuous_alloc(struct snd_dma_buffer *dmab, size_t size)
+static void *snd_dma_continuous_alloc(struct snd_dma_buffer *dmab, size_t size)
 {
 	gfp_t gfp = snd_mem_get_gfp_flags(dmab, GFP_KERNEL);
 
-	dmab->area = alloc_pages_exact(size, gfp);
-	return 0;
+	return alloc_pages_exact(size, gfp);
 }
 
 static void snd_dma_continuous_free(struct snd_dma_buffer *dmab)
@@ -229,12 +223,11 @@ static const struct snd_malloc_ops snd_dma_continuous_ops = {
 /*
  * VMALLOC allocator
  */
-static int snd_dma_vmalloc_alloc(struct snd_dma_buffer *dmab, size_t size)
+static void *snd_dma_vmalloc_alloc(struct snd_dma_buffer *dmab, size_t size)
 {
 	gfp_t gfp = snd_mem_get_gfp_flags(dmab, GFP_KERNEL | __GFP_HIGHMEM);
 
-	dmab->area = __vmalloc(size, gfp);
-	return 0;
+	return __vmalloc(size, gfp);
 }
 
 static void snd_dma_vmalloc_free(struct snd_dma_buffer *dmab)
@@ -286,20 +279,20 @@ static const struct snd_malloc_ops snd_dma_vmalloc_ops = {
  * IRAM allocator
  */
 #ifdef CONFIG_GENERIC_ALLOCATOR
-static int snd_dma_iram_alloc(struct snd_dma_buffer *dmab, size_t size)
+static void *snd_dma_iram_alloc(struct snd_dma_buffer *dmab, size_t size)
 {
 	struct device *dev = dmab->dev.dev;
 	struct gen_pool *pool;
+	void *p;
 
 	if (dev->of_node) {
 		pool = of_gen_pool_get(dev->of_node, "iram", 0);
 		/* Assign the pool into private_data field */
 		dmab->private_data = pool;
 
-		dmab->area = gen_pool_dma_alloc_align(pool, size, &dmab->addr,
-						      PAGE_SIZE);
-		if (dmab->area)
-			return 0;
+		p = gen_pool_dma_alloc_align(pool, size, &dmab->addr, PAGE_SIZE);
+		if (p)
+			return p;
 	}
 
 	/* Internal memory might have limited size and no enough space,
@@ -337,22 +330,21 @@ static const struct snd_malloc_ops snd_dma_iram_ops = {
 /*
  * Coherent device pages allocator
  */
-static int snd_dma_dev_alloc(struct snd_dma_buffer *dmab, size_t size)
+static void *snd_dma_dev_alloc(struct snd_dma_buffer *dmab, size_t size)
 {
 	gfp_t gfp_flags;
+	void *p;
 
 	gfp_flags = GFP_KERNEL
 		| __GFP_COMP	/* compound page lets parts be mapped */
 		| __GFP_NORETRY /* don't trigger OOM-killer */
 		| __GFP_NOWARN; /* no stack trace print - this call is non-critical */
-	dmab->area = dma_alloc_coherent(dmab->dev.dev, size, &dmab->addr,
-					gfp_flags);
+	p = dma_alloc_coherent(dmab->dev.dev, size, &dmab->addr, gfp_flags);
 #ifdef CONFIG_X86
-	if (dmab->area && dmab->dev.type == SNDRV_DMA_TYPE_DEV_UC)
-		set_memory_wc((unsigned long)dmab->area,
-			      PAGE_ALIGN(size) >> PAGE_SHIFT);
+	if (p && dmab->dev.type == SNDRV_DMA_TYPE_DEV_UC)
+		set_memory_wc((unsigned long)p, PAGE_ALIGN(size) >> PAGE_SHIFT);
 #endif
-	return 0;
+	return p;
 }
 
 static void snd_dma_dev_free(struct snd_dma_buffer *dmab)
diff --git a/sound/core/memalloc_local.h b/sound/core/memalloc_local.h
index dbea7f2aed07..9f2e0a608b49 100644
--- a/sound/core/memalloc_local.h
+++ b/sound/core/memalloc_local.h
@@ -3,7 +3,7 @@
 #define __MEMALLOC_LOCAL_H
 
 struct snd_malloc_ops {
-	int (*alloc)(struct snd_dma_buffer *dmab, size_t size);
+	void *(*alloc)(struct snd_dma_buffer *dmab, size_t size);
 	void (*free)(struct snd_dma_buffer *dmab);
 	dma_addr_t (*get_addr)(struct snd_dma_buffer *dmab, size_t offset);
 	struct page *(*get_page)(struct snd_dma_buffer *dmab, size_t offset);
diff --git a/sound/core/sgbuf.c b/sound/core/sgbuf.c
index 232cf3f1bcb3..a46129f3de12 100644
--- a/sound/core/sgbuf.c
+++ b/sound/core/sgbuf.c
@@ -63,7 +63,7 @@ static void snd_dma_sg_free(struct snd_dma_buffer *dmab)
 
 #define MAX_ALLOC_PAGES		32
 
-static int snd_dma_sg_alloc(struct snd_dma_buffer *dmab, size_t size)
+static void *snd_dma_sg_alloc(struct snd_dma_buffer *dmab, size_t size)
 {
 	struct snd_sg_buf *sgbuf;
 	unsigned int i, pages, chunk, maxpages;
@@ -72,10 +72,11 @@ static int snd_dma_sg_alloc(struct snd_dma_buffer *dmab, size_t size)
 	struct page **pgtable;
 	int type = SNDRV_DMA_TYPE_DEV;
 	pgprot_t prot = PAGE_KERNEL;
+	void *area;
 
 	dmab->private_data = sgbuf = kzalloc(sizeof(*sgbuf), GFP_KERNEL);
 	if (!sgbuf)
-		return -ENOMEM;
+		return NULL;
 	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_UC_SG) {
 		type = SNDRV_DMA_TYPE_DEV_UC;
 #ifdef pgprot_noncached
@@ -127,14 +128,14 @@ static int snd_dma_sg_alloc(struct snd_dma_buffer *dmab, size_t size)
 	}
 
 	sgbuf->size = size;
-	dmab->area = vmap(sgbuf->page_table, sgbuf->pages, VM_MAP, prot);
-	if (! dmab->area)
+	area = vmap(sgbuf->page_table, sgbuf->pages, VM_MAP, prot);
+	if (!area)
 		goto _failed;
-	return 0;
+	return area;
 
  _failed:
 	snd_dma_sg_free(dmab); /* free the table */
-	return -ENOMEM;
+	return NULL;
 }
 
 static dma_addr_t snd_dma_sg_get_addr(struct snd_dma_buffer *dmab,
-- 
2.26.2

