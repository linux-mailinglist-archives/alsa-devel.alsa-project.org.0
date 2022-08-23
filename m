Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD97359DB0F
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 14:00:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EC22165E;
	Tue, 23 Aug 2022 13:59:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EC22165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661256021;
	bh=4TkKrNJGCiQwsQXZPh9uK1TpbLnyLoxWI4wmeLCveRQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SKxDLevXY568P27ChoYyn4ztWh0Wt0HSMq5Ba9UG/FxD3cu4FgRn6gfPnuRzET8tX
	 OW9tzZW33Dx+sXFSaQ03H0uNrK/+UqSS0qQn71ZnXF88/Q7dlQaacVC/WwSUDFXI1J
	 8dTQnpuNlAcWDF7+jQcSRn+sR1ladD7fdisRIOXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FA52F8053B;
	Tue, 23 Aug 2022 13:57:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDF35F8052F; Tue, 23 Aug 2022 13:57:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B86FF8030F
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 13:57:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B86FF8030F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="KiW+Y7/e"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="arPYVCNF"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4BE3B1FAA7;
 Tue, 23 Aug 2022 11:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1661255864; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l2ilPtrE9iMiB4IWTA1MpyM0CsvjsxnRcg5rJ32OSxw=;
 b=KiW+Y7/eA6bGB59vFHPU2/XL4ec6cLZmKpdER3r4SG3L6iOD6FQixhHlTXAv27CtvbInEY
 re/cw74qeK6FFrYfiQ1v2ClC6xvwQrEScs+2fObFwBD3fg5zaQNwaYjWoediCCGpRQvwi0
 tAwg3EC5bPbpGv5shmXp6l8ZlAM6eJg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1661255864;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l2ilPtrE9iMiB4IWTA1MpyM0CsvjsxnRcg5rJ32OSxw=;
 b=arPYVCNFwKDlKu3One0xAARFkRsLmm/cHIRbwn2ldjGUdfA8p9wkgnoBJ1BtqE8xSgPUch
 nK/Vh7ToSXSaVfDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3327313AB7;
 Tue, 23 Aug 2022 11:57:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uCfdC7jABGP1OAAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 23 Aug 2022 11:57:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/5] ALSA: memalloc: Drop special handling of GFP for
 CONTINUOUS allocation
Date: Tue, 23 Aug 2022 13:57:39 +0200
Message-Id: <20220823115740.14123-5-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220823115740.14123-1-tiwai@suse.de>
References: <20220823115740.14123-1-tiwai@suse.de>
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

Now that all users of snd_dma_continuous_data() is gone, let's drop
this ugly (and dangerous) way.

After this commit, SNDRV_DMA_TYPE_CONTINUOUS may take the standard
device pointer instead of the hacked pointer by the macro above, and
the memalloc core refers to the coherent_dma_mask of the given
device like other SNDRV_DMA_TYPE.  It's still allowed to pass NULL
there, and in that case, the allocation is performed always in the
normal zone.

For SNDRV_DMA_TYPE_VMALLOC, the device pointer is simply ignored.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/memalloc.h |   3 --
 sound/core/memalloc.c    | 113 +++++++++++++++++----------------------
 2 files changed, 48 insertions(+), 68 deletions(-)

diff --git a/include/sound/memalloc.h b/include/sound/memalloc.h
index 8d79cebf95f3..43d524580bd2 100644
--- a/include/sound/memalloc.h
+++ b/include/sound/memalloc.h
@@ -26,9 +26,6 @@ struct snd_dma_device {
 	struct device *dev;		/* generic device */
 };
 
-#define snd_dma_continuous_data(x)	((struct device *)(__force unsigned long)(x))
-
-
 /*
  * buffer types
  */
diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index b665ac66ccbe..39561faef6e9 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -18,25 +18,18 @@
 #include <sound/memalloc.h>
 #include "memalloc_local.h"
 
+#define DEFAULT_GFP \
+	(GFP_KERNEL | \
+	 __GFP_COMP |    /* compound page lets parts be mapped */ \
+	 __GFP_NORETRY | /* don't trigger OOM-killer */ \
+	 __GFP_NOWARN)   /* no stack trace print - this call is non-critical */
+
 static const struct snd_malloc_ops *snd_dma_get_ops(struct snd_dma_buffer *dmab);
 
 #ifdef CONFIG_SND_DMA_SGBUF
-static void *do_alloc_fallback_pages(struct device *dev, size_t size,
-				     dma_addr_t *addr, bool wc);
-static void do_free_fallback_pages(void *p, size_t size, bool wc);
 static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size);
 #endif
 
-/* a cast to gfp flag from the dev pointer; for CONTINUOUS and VMALLOC types */
-static inline gfp_t snd_mem_get_gfp_flags(const struct snd_dma_buffer *dmab,
-					  gfp_t default_gfp)
-{
-	if (!dmab->dev.dev)
-		return default_gfp;
-	else
-		return (__force gfp_t)(unsigned long)dmab->dev.dev;
-}
-
 static void *__snd_dma_alloc_pages(struct snd_dma_buffer *dmab, size_t size)
 {
 	const struct snd_malloc_ops *ops = snd_dma_get_ops(dmab);
@@ -284,24 +277,54 @@ EXPORT_SYMBOL(snd_sgbuf_get_chunk_size);
 /*
  * Continuous pages allocator
  */
-static void *do_alloc_pages(size_t size, dma_addr_t *addr, gfp_t gfp)
+static void *do_alloc_pages(struct device *dev, size_t size, dma_addr_t *addr,
+			    bool wc)
 {
-	void *p = alloc_pages_exact(size, gfp);
+	void *p;
+	gfp_t gfp = GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN;
 
-	if (p)
-		*addr = page_to_phys(virt_to_page(p));
+ again:
+	p = alloc_pages_exact(size, gfp);
+	if (!p)
+		return NULL;
+	*addr = page_to_phys(virt_to_page(p));
+	if (!dev)
+		return p;
+	if ((*addr + size - 1) & ~dev->coherent_dma_mask) {
+		if (IS_ENABLED(CONFIG_ZONE_DMA32) && !(gfp & GFP_DMA32)) {
+			gfp |= GFP_DMA32;
+			goto again;
+		}
+		if (IS_ENABLED(CONFIG_ZONE_DMA) && !(gfp & GFP_DMA)) {
+			gfp = (gfp & ~GFP_DMA32) | GFP_DMA;
+			goto again;
+		}
+	}
+#ifdef CONFIG_X86
+	if (wc)
+		set_memory_wc((unsigned long)(p), size >> PAGE_SHIFT);
+#endif
 	return p;
 }
 
+static void do_free_pages(void *p, size_t size, bool wc)
+{
+#ifdef CONFIG_X86
+	if (wc)
+		set_memory_wb((unsigned long)(p), size >> PAGE_SHIFT);
+#endif
+	free_pages_exact(p, size);
+}
+
+
 static void *snd_dma_continuous_alloc(struct snd_dma_buffer *dmab, size_t size)
 {
-	return do_alloc_pages(size, &dmab->addr,
-			      snd_mem_get_gfp_flags(dmab, GFP_KERNEL));
+	return do_alloc_pages(dmab->dev.dev, size, &dmab->addr, false);
 }
 
 static void snd_dma_continuous_free(struct snd_dma_buffer *dmab)
 {
-	free_pages_exact(dmab->area, dmab->bytes);
+	do_free_pages(dmab->area, dmab->bytes, false);
 }
 
 static int snd_dma_continuous_mmap(struct snd_dma_buffer *dmab,
@@ -324,9 +347,7 @@ static const struct snd_malloc_ops snd_dma_continuous_ops = {
  */
 static void *snd_dma_vmalloc_alloc(struct snd_dma_buffer *dmab, size_t size)
 {
-	gfp_t gfp = snd_mem_get_gfp_flags(dmab, GFP_KERNEL | __GFP_HIGHMEM);
-
-	return __vmalloc(size, gfp);
+	return vmalloc(size);
 }
 
 static void snd_dma_vmalloc_free(struct snd_dma_buffer *dmab)
@@ -440,12 +461,6 @@ static const struct snd_malloc_ops snd_dma_iram_ops = {
 };
 #endif /* CONFIG_GENERIC_ALLOCATOR */
 
-#define DEFAULT_GFP \
-	(GFP_KERNEL | \
-	 __GFP_COMP |    /* compound page lets parts be mapped */ \
-	 __GFP_NORETRY | /* don't trigger OOM-killer */ \
-	 __GFP_NOWARN)   /* no stack trace print - this call is non-critical */
-
 /*
  * Coherent device pages allocator
  */
@@ -479,12 +494,12 @@ static const struct snd_malloc_ops snd_dma_dev_ops = {
 #ifdef CONFIG_SND_DMA_SGBUF
 static void *snd_dma_wc_alloc(struct snd_dma_buffer *dmab, size_t size)
 {
-	return do_alloc_fallback_pages(dmab->dev.dev, size, &dmab->addr, true);
+	return do_alloc_pages(dmab->dev.dev, size, &dmab->addr, true);
 }
 
 static void snd_dma_wc_free(struct snd_dma_buffer *dmab)
 {
-	do_free_fallback_pages(dmab->area, dmab->bytes, true);
+	do_free_pages(dmab->area, dmab->bytes, true);
 }
 
 static int snd_dma_wc_mmap(struct snd_dma_buffer *dmab,
@@ -697,37 +712,6 @@ static const struct snd_malloc_ops snd_dma_sg_wc_ops = {
 	.get_chunk_size = snd_dma_noncontig_get_chunk_size,
 };
 
-/* manual page allocations with wc setup */
-static void *do_alloc_fallback_pages(struct device *dev, size_t size,
-				     dma_addr_t *addr, bool wc)
-{
-	gfp_t gfp = GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN;
-	void *p;
-
- again:
-	p = do_alloc_pages(size, addr, gfp);
-	if (!p || (*addr + size - 1) & ~dev->coherent_dma_mask) {
-		if (IS_ENABLED(CONFIG_ZONE_DMA32) && !(gfp & GFP_DMA32)) {
-			gfp |= GFP_DMA32;
-			goto again;
-		}
-		if (IS_ENABLED(CONFIG_ZONE_DMA) && !(gfp & GFP_DMA)) {
-			gfp = (gfp & ~GFP_DMA32) | GFP_DMA;
-			goto again;
-		}
-	}
-	if (p && wc)
-		set_memory_wc((unsigned long)(p), size >> PAGE_SHIFT);
-	return p;
-}
-
-static void do_free_fallback_pages(void *p, size_t size, bool wc)
-{
-	if (wc)
-		set_memory_wb((unsigned long)(p), size >> PAGE_SHIFT);
-	free_pages_exact(p, size);
-}
-
 /* Fallback SG-buffer allocations for x86 */
 struct snd_dma_sg_fallback {
 	size_t count;
@@ -742,7 +726,7 @@ static void __snd_dma_sg_fallback_free(struct snd_dma_buffer *dmab,
 	size_t i;
 
 	for (i = 0; i < sgbuf->count && sgbuf->pages[i]; i++)
-		do_free_fallback_pages(page_address(sgbuf->pages[i]), PAGE_SIZE, wc);
+		do_free_pages(page_address(sgbuf->pages[i]), PAGE_SIZE, wc);
 	kvfree(sgbuf->pages);
 	kvfree(sgbuf->addrs);
 	kfree(sgbuf);
@@ -769,8 +753,7 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 		goto error;
 
 	for (i = 0; i < count; sgbuf->count++, i++) {
-		p = do_alloc_fallback_pages(dmab->dev.dev, PAGE_SIZE,
-					    &sgbuf->addrs[i], wc);
+		p = do_alloc_pages(dmab->dev.dev, PAGE_SIZE, &sgbuf->addrs[i], wc);
 		if (!p)
 			goto error;
 		sgbuf->pages[i] = virt_to_page(p);
-- 
2.35.3

