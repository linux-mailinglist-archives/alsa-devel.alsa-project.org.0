Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B110B62822F
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Nov 2022 15:18:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38E081677;
	Mon, 14 Nov 2022 15:17:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38E081677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668435484;
	bh=G0EnHL9y5sZHJdkiq2P42CKzUluCKHaXCWlUvgTP2oM=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N5ETjk5r+Gyfh7Q1Eo3hpH75cdFfrNcfEBOpicPcnj4IEuWC7o7J/FY863qUb304j
	 ioocxea66UNeBAUG9EJfzfYtCcvQRVYusgZVGX/6U3Y2Tned4CvBBOkIOx7a+Q7a1k
	 iEo1px+nWC9SKnm4zvw9OWicwd65euhS5S8VOcB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBD9AF800AA;
	Mon, 14 Nov 2022 15:17:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6BA0F800AA; Mon, 14 Nov 2022 15:17:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7FCDF800AA
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 15:17:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7FCDF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="yYBqd+u4"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Zn9Bjn0S"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D838C20052;
 Mon, 14 Nov 2022 14:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668435420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=QbLZBgMvET/joyA7ZUgbkREyNuU4E4lztiqfgSeiz+8=;
 b=yYBqd+u4Cfv6AAT9C60Q48KxXVzpugOqj6jHt4uYxNErQSErh9Qh9upUO+X4Krt+WGeeaX
 DjPCyvfLsbBf5NexoyVicxC78RVKKxKbEyapuLhWakbwZ7UGrJPw0G61VCTEIhh5ZYiiDV
 qWbe2HxFVmHUsmE4W6GbJrscb7c8Sck=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668435420;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=QbLZBgMvET/joyA7ZUgbkREyNuU4E4lztiqfgSeiz+8=;
 b=Zn9Bjn0S48GynJOoKRcIfmfwNYyi8tZmjYsQHPuLvKpM39g34sEhuyhFof/cKkWvpG2LwY
 oL26th1i+Y2SJcAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C0F1313A92;
 Mon, 14 Nov 2022 14:17:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aRo/LtxNcmPTZQAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 14 Nov 2022 14:17:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: memalloc: Allocate more contiguous pages for fallback
 case
Date: Mon, 14 Nov 2022 15:16:58 +0100
Message-Id: <20221114141658.29620-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
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

Currently the fallback SG allocation tries to allocate each single
page, and this tends to result in the reverse order of memory
addresses when large space is available at boot, as the kernel takes a
free page from the top to the bottom in the zone.  The end result
looks as if non-contiguous (although it actually is).  What's worth is
that it leads to an overflow of BDL entries for HD-audio.

For avoiding such a problem, this patch modifies the allocation code
slightly; now it tries to allocate the larger contiguous chunks as
much as possible, then reduces to the smaller chunks only if the
allocation failed -- a similar strategy as the existing
snd_dma_alloc_pages_fallback() function.

Along with the trick, drop the unused address array from
snd_dma_sg_fallback object.  It was needed in the past when
dma_alloc_coherent() was used, but with the standard page allocator,
it became superfluous and never referred.

Fixes: a8d302a0b770 ("ALSA: memalloc: Revive x86-specific WC page allocations again")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/memalloc.c | 44 ++++++++++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index ba095558b6d1..7268304009ad 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -720,7 +720,6 @@ static const struct snd_malloc_ops snd_dma_sg_wc_ops = {
 struct snd_dma_sg_fallback {
 	size_t count;
 	struct page **pages;
-	dma_addr_t *addrs;
 };
 
 static void __snd_dma_sg_fallback_free(struct snd_dma_buffer *dmab,
@@ -732,38 +731,49 @@ static void __snd_dma_sg_fallback_free(struct snd_dma_buffer *dmab,
 	for (i = 0; i < sgbuf->count && sgbuf->pages[i]; i++)
 		do_free_pages(page_address(sgbuf->pages[i]), PAGE_SIZE, wc);
 	kvfree(sgbuf->pages);
-	kvfree(sgbuf->addrs);
 	kfree(sgbuf);
 }
 
 static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 {
 	struct snd_dma_sg_fallback *sgbuf;
-	struct page **pages;
-	size_t i, count;
+	struct page **pagep, *curp;
+	size_t chunk, npages;
+	dma_addr_t addr;
 	void *p;
 	bool wc = dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK;
 
 	sgbuf = kzalloc(sizeof(*sgbuf), GFP_KERNEL);
 	if (!sgbuf)
 		return NULL;
-	count = PAGE_ALIGN(size) >> PAGE_SHIFT;
-	pages = kvcalloc(count, sizeof(*pages), GFP_KERNEL);
-	if (!pages)
-		goto error;
-	sgbuf->pages = pages;
-	sgbuf->addrs = kvcalloc(count, sizeof(*sgbuf->addrs), GFP_KERNEL);
-	if (!sgbuf->addrs)
+	size = PAGE_ALIGN(size);
+	sgbuf->count = size >> PAGE_SHIFT;
+	sgbuf->pages = kvcalloc(sgbuf->count, sizeof(*sgbuf->pages), GFP_KERNEL);
+	if (!sgbuf->pages)
 		goto error;
 
-	for (i = 0; i < count; sgbuf->count++, i++) {
-		p = do_alloc_pages(dmab->dev.dev, PAGE_SIZE, &sgbuf->addrs[i], wc);
-		if (!p)
-			goto error;
-		sgbuf->pages[i] = virt_to_page(p);
+	pagep = sgbuf->pages;
+	chunk = size;
+	while (size > 0) {
+		chunk = min(size, chunk);
+		p = do_alloc_pages(dmab->dev.dev, chunk, &addr, wc);
+		if (!p) {
+			if (chunk <= PAGE_SIZE)
+				goto error;
+			chunk >>= 1;
+			chunk = PAGE_SIZE << get_order(chunk);
+			continue;
+		}
+
+		size -= chunk;
+		/* fill pages */
+		npages = chunk >> PAGE_SHIFT;
+		curp = virt_to_page(p);
+		while (npages--)
+			*pagep++ = curp++;
 	}
 
-	p = vmap(pages, count, VM_MAP, PAGE_KERNEL);
+	p = vmap(sgbuf->pages, sgbuf->count, VM_MAP, PAGE_KERNEL);
 	if (!p)
 		goto error;
 	dmab->private_data = sgbuf;
-- 
2.35.3

