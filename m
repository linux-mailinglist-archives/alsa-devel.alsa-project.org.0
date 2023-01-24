Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8656F679435
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 10:29:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0821E73;
	Tue, 24 Jan 2023 10:28:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0821E73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674552564;
	bh=7SIOuY3IDrfIaQFtmnxf5ZD2EbUTOQqKWQVKo06zex4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IURu9uV57fOIEN1KFDFhZO/XIGL/n3doTwnkOVtIRdaKJ/OaDSFH6h9KhhW6hGmE3
	 4tvpP2kFZP7PQdFnVAtxaOYR8ZLIdJ1+qg0BOtVqOJxZBsOpCVHFWQh5qe4MUzW5d8
	 wcETXtyF7smY8oXWnwiY7AeJTuHLstk68PIKExSU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E356FF80163;
	Tue, 24 Jan 2023 10:28:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49009F802DF; Tue, 24 Jan 2023 10:27:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A40C4F8025D
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 10:27:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A40C4F8025D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=YAlNilJM; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Senxscqa
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D794521A28;
 Tue, 24 Jan 2023 09:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674552469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QzYbn4C3HYBLORR/jhZRxC8sqg9FAYJkuTrSgW9nsqg=;
 b=YAlNilJM7QWyNu9XtCVy/O+Z1KlG4VgKXIJMWPQV+36+s6TxlgdLlnWJhL7nzIvkLIRiyg
 1EgIvUIN+73LRotLJr/w/VpSpPym55mUl68lqPBNxmGPbCxAobxuYCd1mFDbhAr1OjqBK7
 QibFmO8HxY+ltf7WX+c1nwzB1VRTyX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674552469;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QzYbn4C3HYBLORR/jhZRxC8sqg9FAYJkuTrSgW9nsqg=;
 b=Senxscqa36p1/uSAHDQGPeoDhX1x4Dq0IiZqT3dqXc+hoOZf4nSz+VKYtUp5z7C4sAR3Zy
 zEkEhl021LDSXMCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B3CC9139FB;
 Tue, 24 Jan 2023 09:27:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kJbbKpWkz2NeUgAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 24 Jan 2023 09:27:49 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: memalloc: Use coherent DMA allocation for fallback
 again
Date: Tue, 24 Jan 2023 10:27:44 +0100
Message-Id: <20230124092744.27370-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230124092744.27370-1-tiwai@suse.de>
References: <20230124092744.27370-1-tiwai@suse.de>
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

We switched the memory allocation for fallback cases in the noncontig
type to use the standard alloc_pages*() at the commit a8d302a0b770
("ALSA: memalloc: Revive x86-specific WC page allocations again"),
while we used the dma_alloc_coherent() in the past.  The reason was
that the page address retrieved from the virtual pointer returned from
dma_alloc_coherent() can't be used with IOMMU systems.  Meanwhile, we
explicitly disabled the fallback allocation for IOMMU systems at the
commit 9736a325137b ("ALSA: memalloc: Don't fall back for SG-buffer
with IOMMU") after the commit above; that is, the usage of
dma_alloc_coherent() should be OK again.

Now, we've received reports that the current fallback page allocation
caused a regression on Xen (and maybe other) systems; the sound
disappear partially or completely.  So it's time to take back to
dma_alloc_coherent().

This patch switches back to the dma_alloc_coherent() for the fallback
allocations.  Unlike the previous implementation, the allocation is
implemented in a more optimized way to try larger chunks.  Also, the
proper DMA address from the dma_alloc_coherent() is returned.

The page count for the page chunk is stored in the lower bits of the
first page address. The address is masked and re-calculated at
get_addr memalloc ops in return.

Fixes: a8d302a0b770 ("ALSA: memalloc: Revive x86-specific WC page allocations again")
Fixes: 9736a325137b ("ALSA: memalloc: Don't fall back for SG-buffer with IOMMU")
Reported-and-tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Link: https://lore.kernel.org/r/87tu256lqs.wl-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/memalloc.c | 61 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 49 insertions(+), 12 deletions(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 30c9ad192986..5fe21c0080dc 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -720,17 +720,31 @@ static const struct snd_malloc_ops snd_dma_sg_wc_ops = {
 struct snd_dma_sg_fallback {
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
+			dma_free_coherent(dmab->dev.dev, size << PAGE_SHIFT,
+					  page_address(sgbuf->pages[i]),
+					  sgbuf->addrs[i] & PAGE_MASK);
+			i += size;
+		}
+	}
 	kvfree(sgbuf->pages);
+	kvfree(sgbuf->addrs);
 	kfree(sgbuf);
 }
 
@@ -739,9 +753,9 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 	struct snd_dma_sg_fallback *sgbuf;
 	struct page **pagep, *curp;
 	size_t chunk, npages;
+	dma_addr_t *addrp;
 	dma_addr_t addr;
 	void *p;
-	bool wc = dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK;
 
 	sgbuf = kzalloc(sizeof(*sgbuf), GFP_KERNEL);
 	if (!sgbuf)
@@ -749,14 +763,16 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
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
+		p = dma_alloc_coherent(dmab->dev.dev, chunk, &addr, DEFAULT_GFP);
 		if (!p) {
 			if (chunk <= PAGE_SIZE)
 				goto error;
@@ -768,17 +784,25 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
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
@@ -788,10 +812,23 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 
 static void snd_dma_sg_fallback_free(struct snd_dma_buffer *dmab)
 {
+	struct snd_dma_sg_fallback *sgbuf = dmab->private_data;
+
 	vunmap(dmab->area);
+	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK)
+		set_pages_array_wb(sgbuf->pages, sgbuf->count);
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
@@ -806,8 +843,8 @@ static const struct snd_malloc_ops snd_dma_sg_fallback_ops = {
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

