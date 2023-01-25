Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C46EE67B5FC
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jan 2023 16:32:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C9D2E78;
	Wed, 25 Jan 2023 16:31:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C9D2E78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674660738;
	bh=2BLuXO3OoJ20vX4rih8dy86kuM91XqFUbmGDPL402oU=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=h7Z9yTt4mR0anrAEIlmlThWg5o0vUoLRaxwOKtlH0w4N/SnefiQnhtO8jDBl9ltfU
	 1nhOqxqN6Ur516PdxHvcTjYJRlmTG6roiwjHZA28GN4PUshJzV1idMS4Lznr/1vJh+
	 7cZWLAa2c0FbLiRGAzkpxgctiMJUNMm7AP5ZyYjk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DA21F804A9;
	Wed, 25 Jan 2023 16:31:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA091F80424; Wed, 25 Jan 2023 16:31:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D559FF80163
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 16:31:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D559FF80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Zt3LQnNf; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=0TAR/cl/
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 313D121C08;
 Wed, 25 Jan 2023 15:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674660667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BaPzTgAhXgjhLJ9iCeP2BgaAMAECYvwOcd0pySFcLHo=;
 b=Zt3LQnNf80N1eSDIejcpgHrlerE+aIp/J3DvRyH1qlS/3Y8E2vgNl4W9cdlT8uvW+Thr6Y
 888DbyUTk+7y45jWKLvN9kH0n0auAKB9qlR8CREJOoPnsgeXh/1OIFVCrBvjeAjTxwOXPw
 7MMBAHS0hnuV1PYOLFSt025MTiywJNY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674660667;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BaPzTgAhXgjhLJ9iCeP2BgaAMAECYvwOcd0pySFcLHo=;
 b=0TAR/cl/E0RQf3qaOL6ePWE3oA/IjVu9UuJaYELVhlzCa1GZ4oG/0Txn0FzwHpCqaKgjNX
 hscrz+yBYy10fhCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1230C1339E;
 Wed, 25 Jan 2023 15:31:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8nezAztL0WMrcAAAMHmgww
 (envelope-from <tiwai@suse.de>); Wed, 25 Jan 2023 15:31:07 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: memalloc: Workaround for Xen PV
Date: Wed, 25 Jan 2023 16:31:04 +0100
Message-Id: <20230125153104.5527-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

We change recently the memalloc helper to use
dma_alloc_noncontiguous() and the fallback to get_pages().  Although
lots of issues with IOMMU (or non-IOMMU) have been addressed, but
there seems still a regression on Xen PV.  Interestingly, the only
proper way to work is use dma_alloc_coherent().  The use of
dma_alloc_coherent() for SG buffer was dropped as it's problematic on
IOMMU systems.  OTOH, Xen PV has a different way, and it's fine to use
the dma_alloc_coherent().

This patch is a workaround for Xen PV.  It consists of the following
changes:
- For Xen PV, use only the fallback allocation without
  dma_alloc_noncontiguous()
- In the fallback allocation, use dma_alloc_coherent();
  the DMA address from dma_alloc_coherent() is returned in get_addr
  ops
- The DMA addresses are stored in an array; the first entry stores the
  number of allocated pages in lower bits, which are referred at
  releasing pages again

Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Fixes: a8d302a0b770 ("ALSA: memalloc: Revive x86-specific WC page allocations again")
Fixes: 9736a325137b ("ALSA: memalloc: Don't fall back for SG-buffer with IOMMU")
Link: https://lore.kernel.org/r/87tu256lqs.wl-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

Marek, this is another respin of the fix.
Please check this one and report back.  Thanks!

 sound/core/memalloc.c | 87 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 69 insertions(+), 18 deletions(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 81025f50a542..f901504b5afc 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -541,16 +541,15 @@ static void *snd_dma_noncontig_alloc(struct snd_dma_buffer *dmab, size_t size)
 	struct sg_table *sgt;
 	void *p;
 
+#ifdef CONFIG_SND_DMA_SGBUF
+	if (cpu_feature_enabled(X86_FEATURE_XENPV))
+		return snd_dma_sg_fallback_alloc(dmab, size);
+#endif
 	sgt = dma_alloc_noncontiguous(dmab->dev.dev, size, dmab->dev.dir,
 				      DEFAULT_GFP, 0);
 #ifdef CONFIG_SND_DMA_SGBUF
-	if (!sgt && !get_dma_ops(dmab->dev.dev)) {
-		if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG)
-			dmab->dev.type = SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK;
-		else
-			dmab->dev.type = SNDRV_DMA_TYPE_DEV_SG_FALLBACK;
+	if (!sgt && !get_dma_ops(dmab->dev.dev))
 		return snd_dma_sg_fallback_alloc(dmab, size);
-	}
 #endif
 	if (!sgt)
 		return NULL;
@@ -717,19 +716,38 @@ static const struct snd_malloc_ops snd_dma_sg_wc_ops = {
 
 /* Fallback SG-buffer allocations for x86 */
 struct snd_dma_sg_fallback {
+	bool use_dma_alloc_coherent;
 	size_t count;
 	struct page **pages;
+	/* DMA address array; the first page contains #pages in ~PAGE_MASK */
+	dma_addr_t *addrs;
 };
 
 static void __snd_dma_sg_fallback_free(struct snd_dma_buffer *dmab,
 				       struct snd_dma_sg_fallback *sgbuf)
 {
-	bool wc = dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK;
-	size_t i;
-
-	for (i = 0; i < sgbuf->count && sgbuf->pages[i]; i++)
-		do_free_pages(page_address(sgbuf->pages[i]), PAGE_SIZE, wc);
+	size_t i, size;
+
+	if (sgbuf->pages && sgbuf->addrs) {
+		i = 0;
+		while (i < sgbuf->count) {
+			if (!sgbuf->pages[i] || !sgbuf->addrs[i])
+				break;
+			size = sgbuf->addrs[i] & ~PAGE_MASK;
+			if (WARN_ON(!size))
+				break;
+			if (sgbuf->use_dma_alloc_coherent)
+				dma_free_coherent(dmab->dev.dev, size << PAGE_SHIFT,
+						  page_address(sgbuf->pages[i]),
+						  sgbuf->addrs[i] & PAGE_MASK);
+			else
+				do_free_pages(page_address(sgbuf->pages[i]),
+					      size << PAGE_SHIFT, false);
+			i += size;
+		}
+	}
 	kvfree(sgbuf->pages);
+	kvfree(sgbuf->addrs);
 	kfree(sgbuf);
 }
 
@@ -738,24 +756,36 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 	struct snd_dma_sg_fallback *sgbuf;
 	struct page **pagep, *curp;
 	size_t chunk, npages;
+	dma_addr_t *addrp;
 	dma_addr_t addr;
 	void *p;
-	bool wc = dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK;
+
+	/* correct the type */
+	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_SG)
+		dmab->dev.type = SNDRV_DMA_TYPE_DEV_SG_FALLBACK;
+	else if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG)
+		dmab->dev.type = SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK;
 
 	sgbuf = kzalloc(sizeof(*sgbuf), GFP_KERNEL);
 	if (!sgbuf)
 		return NULL;
+	sgbuf->use_dma_alloc_coherent = cpu_feature_enabled(X86_FEATURE_XENPV);
 	size = PAGE_ALIGN(size);
 	sgbuf->count = size >> PAGE_SHIFT;
 	sgbuf->pages = kvcalloc(sgbuf->count, sizeof(*sgbuf->pages), GFP_KERNEL);
-	if (!sgbuf->pages)
+	sgbuf->addrs = kvcalloc(sgbuf->count, sizeof(*sgbuf->addrs), GFP_KERNEL);
+	if (!sgbuf->pages || !sgbuf->addrs)
 		goto error;
 
 	pagep = sgbuf->pages;
-	chunk = size;
+	addrp = sgbuf->addrs;
+	chunk = (PAGE_SIZE - 1) << PAGE_SHIFT; /* to fit in low bits in addrs */
 	while (size > 0) {
 		chunk = min(size, chunk);
-		p = do_alloc_pages(dmab->dev.dev, chunk, &addr, wc);
+		if (sgbuf->use_dma_alloc_coherent)
+			p = dma_alloc_coherent(dmab->dev.dev, chunk, &addr, DEFAULT_GFP);
+		else
+			p = do_alloc_pages(dmab->dev.dev, chunk, &addr, false);
 		if (!p) {
 			if (chunk <= PAGE_SIZE)
 				goto error;
@@ -767,17 +797,25 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 		size -= chunk;
 		/* fill pages */
 		npages = chunk >> PAGE_SHIFT;
+		*addrp = npages; /* store in lower bits */
 		curp = virt_to_page(p);
-		while (npages--)
+		while (npages--) {
 			*pagep++ = curp++;
+			*addrp++ |= addr;
+			addr += PAGE_SIZE;
+		}
 	}
 
 	p = vmap(sgbuf->pages, sgbuf->count, VM_MAP, PAGE_KERNEL);
 	if (!p)
 		goto error;
+
+	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK)
+		set_pages_array_wc(sgbuf->pages, sgbuf->count);
+
 	dmab->private_data = sgbuf;
 	/* store the first page address for convenience */
-	dmab->addr = snd_sgbuf_get_addr(dmab, 0);
+	dmab->addr = sgbuf->addrs[0] & PAGE_MASK;
 	return p;
 
  error:
@@ -787,10 +825,23 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 
 static void snd_dma_sg_fallback_free(struct snd_dma_buffer *dmab)
 {
+	struct snd_dma_sg_fallback *sgbuf = dmab->private_data;
+
+	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK)
+		set_pages_array_wb(sgbuf->pages, sgbuf->count);
 	vunmap(dmab->area);
 	__snd_dma_sg_fallback_free(dmab, dmab->private_data);
 }
 
+static dma_addr_t snd_dma_sg_fallback_get_addr(struct snd_dma_buffer *dmab,
+					       size_t offset)
+{
+	struct snd_dma_sg_fallback *sgbuf = dmab->private_data;
+	size_t index = offset >> PAGE_SHIFT;
+
+	return (sgbuf->addrs[index] & PAGE_MASK) | (offset & ~PAGE_MASK);
+}
+
 static int snd_dma_sg_fallback_mmap(struct snd_dma_buffer *dmab,
 				    struct vm_area_struct *area)
 {
@@ -805,8 +856,8 @@ static const struct snd_malloc_ops snd_dma_sg_fallback_ops = {
 	.alloc = snd_dma_sg_fallback_alloc,
 	.free = snd_dma_sg_fallback_free,
 	.mmap = snd_dma_sg_fallback_mmap,
+	.get_addr = snd_dma_sg_fallback_get_addr,
 	/* reuse vmalloc helpers */
-	.get_addr = snd_dma_vmalloc_get_addr,
 	.get_page = snd_dma_vmalloc_get_page,
 	.get_chunk_size = snd_dma_vmalloc_get_chunk_size,
 };
-- 
2.35.3

