Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E29B3A1AE5
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jun 2021 18:28:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0163616C1;
	Wed,  9 Jun 2021 18:27:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0163616C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623256122;
	bh=JBxK/uQxgmeCCNgTHNtQe7Z6TWwJb2JSfJq0bi3gTTs=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FZOYPlX2S0MF5LB8i0pj+CgXpRqHlxy7v+vtAbWpEL4Uufx3dCWyNZTMk25kR/g7+
	 a6N15nRoyh9HP3JBcpb4lJPHr44ul5LEbn0mqJo8q8V9Bgw4Cqn7QK8KLRNOXN8V1y
	 xu+XmnqcMRnEE65sbIlhgOp+dli2ggU6SIyGZJ6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CFABF804D6;
	Wed,  9 Jun 2021 18:26:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33D9DF8026C; Wed,  9 Jun 2021 18:26:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E717FF80212
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 18:25:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E717FF80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="Jq1oYFxq"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="InFg3C4i"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 6394D219BA
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 16:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623255954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jDd/v1I95491q1ynU2Yy+SyCvuaqEE1QblZRWDM+nVk=;
 b=Jq1oYFxqgjJyqTABNhPS6NpkqzNRQh23Vv3/ibVAvCy/tvGzvO2quqevDIvjVKnmTfxbFq
 w+nYYH79zir3fDKTAWf8amhBD12qT4N5H+LITa2OanJADHkINRv+5VdXWE0kg88X5APEoP
 9OcNRkeXjmmn3/Wnq5Ug+fA3EsRmQNY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623255954;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jDd/v1I95491q1ynU2Yy+SyCvuaqEE1QblZRWDM+nVk=;
 b=InFg3C4ilhfZ7hh7v+ZI7HEs3sSNnIB54xo4mWA2DFEX6IfXI8KDRSCN54nzjxIi6WkDfn
 rUPJB3RApuaTUZAw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 53B31A3B8A;
 Wed,  9 Jun 2021 16:25:54 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/5] ALSA: core: Move mmap handler into memalloc ops
Date: Wed,  9 Jun 2021 18:25:50 +0200
Message-Id: <20210609162551.7842-5-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210609162551.7842-1-tiwai@suse.de>
References: <20210609162551.7842-1-tiwai@suse.de>
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

This patch moves the mmap handling code into the common memalloc
handler.  It allows us to reduce the memory-type specific code in PCM
code gracefully.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/memalloc.h    |  3 +++
 sound/core/memalloc.c       | 36 ++++++++++++++++++++++++++++++++++++
 sound/core/memalloc_local.h |  1 +
 sound/core/pcm_native.c     | 19 +++----------------
 4 files changed, 43 insertions(+), 16 deletions(-)

diff --git a/include/sound/memalloc.h b/include/sound/memalloc.h
index 6dc85a7f44ad..1918c60f1f35 100644
--- a/include/sound/memalloc.h
+++ b/include/sound/memalloc.h
@@ -11,6 +11,7 @@
 
 struct device;
 struct page;
+struct vm_area_struct;
 
 /*
  * buffer device info
@@ -69,6 +70,8 @@ int snd_dma_alloc_pages(int type, struct device *dev, size_t size,
 int snd_dma_alloc_pages_fallback(int type, struct device *dev, size_t size,
                                  struct snd_dma_buffer *dmab);
 void snd_dma_free_pages(struct snd_dma_buffer *dmab);
+int snd_dma_buffer_mmap(struct snd_dma_buffer *dmab,
+			struct vm_area_struct *area);
 
 dma_addr_t snd_sgbuf_get_addr(struct snd_dma_buffer *dmab, size_t offset);
 struct page *snd_sgbuf_get_page(struct snd_dma_buffer *dmab, size_t offset);
diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index ad68bcdf82cf..bdcb9230acf8 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -127,6 +127,23 @@ void snd_dma_free_pages(struct snd_dma_buffer *dmab)
 }
 EXPORT_SYMBOL(snd_dma_free_pages);
 
+/**
+ * snd_dma_buffer_mmap - perform mmap of the given DMA buffer
+ * @dmab: buffer allocation information
+ * @area: VM area information
+ */
+int snd_dma_buffer_mmap(struct snd_dma_buffer *dmab,
+			struct vm_area_struct *area)
+{
+	const struct snd_malloc_ops *ops = snd_dma_get_ops(dmab);
+
+	if (ops && ops->mmap)
+		return ops->mmap(dmab, area);
+	else
+		return -ENOENT;
+}
+EXPORT_SYMBOL(snd_dma_buffer_mmap);
+
 /**
  * snd_sgbuf_get_addr - return the physical address at the corresponding offset
  * @dmab: buffer allocation information
@@ -283,9 +300,20 @@ static void snd_dma_iram_free(struct snd_dma_buffer *dmab)
 		gen_pool_free(pool, (unsigned long)dmab->area, dmab->bytes);
 }
 
+static int snd_dma_iram_mmap(struct snd_dma_buffer *dmab,
+			     struct vm_area_struct *area)
+{
+	area->vm_page_prot = pgprot_writecombine(area->vm_page_prot);
+	return remap_pfn_range(area, area->vm_start,
+			       dmab->addr >> PAGE_SHIFT,
+			       area->vm_end - area->vm_start,
+			       area->vm_page_prot);
+}
+
 static const struct snd_malloc_ops snd_dma_iram_ops = {
 	.alloc = snd_dma_iram_alloc,
 	.free = snd_dma_iram_free,
+	.mmap = snd_dma_iram_mmap,
 };
 #endif /* CONFIG_GENERIC_ALLOCATOR */
 
@@ -320,9 +348,17 @@ static void snd_dma_dev_free(struct snd_dma_buffer *dmab)
 	dma_free_coherent(dmab->dev.dev, dmab->bytes, dmab->area, dmab->addr);
 }
 
+static int snd_dma_dev_mmap(struct snd_dma_buffer *dmab,
+			    struct vm_area_struct *area)
+{
+	return dma_mmap_coherent(dmab->dev.dev, area,
+				 dmab->area, dmab->addr, dmab->bytes);
+}
+
 static const struct snd_malloc_ops snd_dma_dev_ops = {
 	.alloc = snd_dma_dev_alloc,
 	.free = snd_dma_dev_free,
+	.mmap = snd_dma_dev_mmap,
 };
 #endif /* CONFIG_HAS_DMA */
 
diff --git a/sound/core/memalloc_local.h b/sound/core/memalloc_local.h
index fe55416253bf..dbea7f2aed07 100644
--- a/sound/core/memalloc_local.h
+++ b/sound/core/memalloc_local.h
@@ -9,6 +9,7 @@ struct snd_malloc_ops {
 	struct page *(*get_page)(struct snd_dma_buffer *dmab, size_t offset);
 	unsigned int (*get_chunk_size)(struct snd_dma_buffer *dmab,
 				       unsigned int ofs, unsigned int size);
+	int (*mmap)(struct snd_dma_buffer *dmab, struct vm_area_struct *area);
 };
 
 #ifdef CONFIG_SND_DMA_SGBUF
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 48d63dbb17ba..14e32825c339 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3700,22 +3700,9 @@ int snd_pcm_lib_default_mmap(struct snd_pcm_substream *substream,
 			     struct vm_area_struct *area)
 {
 	area->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
-#ifdef CONFIG_GENERIC_ALLOCATOR
-	if (substream->dma_buffer.dev.type == SNDRV_DMA_TYPE_DEV_IRAM) {
-		area->vm_page_prot = pgprot_writecombine(area->vm_page_prot);
-		return remap_pfn_range(area, area->vm_start,
-				substream->dma_buffer.addr >> PAGE_SHIFT,
-				area->vm_end - area->vm_start, area->vm_page_prot);
-	}
-#endif /* CONFIG_GENERIC_ALLOCATOR */
-	if (IS_ENABLED(CONFIG_HAS_DMA) && !substream->ops->page &&
-	    (substream->dma_buffer.dev.type == SNDRV_DMA_TYPE_DEV ||
-	     substream->dma_buffer.dev.type == SNDRV_DMA_TYPE_DEV_UC))
-		return dma_mmap_coherent(substream->dma_buffer.dev.dev,
-					 area,
-					 substream->runtime->dma_area,
-					 substream->runtime->dma_addr,
-					 substream->runtime->dma_bytes);
+	if (!substream->ops->page &&
+	    !snd_dma_buffer_mmap(snd_pcm_get_dma_buf(substream), area))
+		return 0;
 	/* mmap with fault handler */
 	area->vm_ops = &snd_pcm_vm_ops_data_fault;
 	return 0;
-- 
2.26.2

