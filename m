Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EBE4497E2
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Nov 2021 16:12:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21CA91661;
	Mon,  8 Nov 2021 16:11:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21CA91661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636384348;
	bh=dHeSDDHOv2k8Bj2t2gLKsIhG5xozzLXgoFVGFtvFCZc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Vq8KRfBBLtysnyXSazhvZuovSAKgGNWLwl6mY3xsgoZmqg7SPkKMHSH7vn1diDphi
	 JM2+J8wdO4gVfl/dHvlRY+Zm+MZmc7bT86Ykg6cHPOmYo0NHeIChf/h+bieZolEpMh
	 ulHcO6OZjgvtJuGTACngF/8Mkr1ztUNwx6U6O+Yc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78B2CF8007E;
	Mon,  8 Nov 2021 16:11:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33432F8049E; Mon,  8 Nov 2021 16:11:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 332ECF80107
 for <alsa-devel@alsa-project.org>; Mon,  8 Nov 2021 16:11:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 332ECF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="un24smzd"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="fd+6zvqy"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id D4B4121639
 for <alsa-devel@alsa-project.org>; Mon,  8 Nov 2021 15:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636384259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4wB4PaWkd7NDdG/Ydz/RHK5u7JUUyPIupaR/jGL6wGg=;
 b=un24smzdZ4EnTtIPOVOE612pvWAEG7GzGC1zEMdTPRhL5lO2juWtaKZCbiVNXrF2dGdqbk
 tcUBQ9cz0Q/GAQyplj+ZTHrlAy5G1INN6lBt8yo0Tjc2VT+t38XVlDTpgvrr+RmKiyH1yY
 8nDCVef//arwASpCl5yjXfvovZVF2ok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636384259;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4wB4PaWkd7NDdG/Ydz/RHK5u7JUUyPIupaR/jGL6wGg=;
 b=fd+6zvqycJiG9jZnUHEljgY8f8wCfu1tjMAywGCW4BW9pjQT1aY//h6jN/lVaJocfXOsSB
 Ar5Aa9O52cvCOfDg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id C3A49A3B87;
 Mon,  8 Nov 2021 15:10:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: memalloc: Use proper SG helpers for noncontig
 allocations
Date: Mon,  8 Nov 2021 16:10:59 +0100
Message-Id: <20211108151059.31898-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
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

The recently introduced non-contiguous page allocation support helpers
are using the simplified code to calculate the page and DMA address
based on the vmalloc helpers, but this isn't quite right as the vmap
is valid only for the direct DMA.

This patch corrects those accessors to use the proper SG helpers
instead.

Fixes: a25684a95646 ("ALSA: memalloc: Support for non-contiguous page allocation")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/memalloc.c | 64 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 61 insertions(+), 3 deletions(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index ad4a76b47b92..8c362bb5b81a 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -552,15 +552,73 @@ static void snd_dma_noncontig_sync(struct snd_dma_buffer *dmab,
 	}
 }
 
+static inline void snd_dma_noncontig_iter_set(struct snd_dma_buffer *dmab,
+					      struct sg_page_iter *piter,
+					      size_t offset)
+{
+	struct sg_table *sgt = dmab->private_data;
+
+	__sg_page_iter_start(piter, sgt->sgl, sgt->orig_nents,
+			     offset >> PAGE_SHIFT);
+}
+
+static dma_addr_t snd_dma_noncontig_get_addr(struct snd_dma_buffer *dmab,
+					     size_t offset)
+{
+	struct sg_dma_page_iter iter;
+
+	snd_dma_noncontig_iter_set(dmab, &iter.base, offset);
+	__sg_page_iter_dma_next(&iter);
+	return sg_page_iter_dma_address(&iter) + offset % PAGE_SIZE;
+}
+
+static struct page *snd_dma_noncontig_get_page(struct snd_dma_buffer *dmab,
+					       size_t offset)
+{
+	struct sg_page_iter iter;
+
+	snd_dma_noncontig_iter_set(dmab, &iter, offset);
+	__sg_page_iter_next(&iter);
+	return sg_page_iter_page(&iter);
+}
+
+static unsigned int
+snd_dma_noncontig_get_chunk_size(struct snd_dma_buffer *dmab,
+				 unsigned int ofs, unsigned int size)
+{
+	struct sg_dma_page_iter iter;
+	unsigned int start, end;
+	unsigned long addr;
+
+	start = ALIGN_DOWN(ofs, PAGE_SIZE);
+	end = ofs + size - 1; /* the last byte address */
+	snd_dma_noncontig_iter_set(dmab, &iter.base, start);
+	if (!__sg_page_iter_dma_next(&iter))
+		return 0;
+	/* check page continuity */
+	addr = sg_page_iter_dma_address(&iter);
+	for (;;) {
+		start += PAGE_SIZE;
+		if (start > end)
+			break;
+		addr += PAGE_SIZE;
+		if (!__sg_page_iter_dma_next(&iter) ||
+		    sg_page_iter_dma_address(&iter) != addr)
+			return start - ofs;
+	}
+	/* ok, all on continuous pages */
+	return size;
+}
+
 static const struct snd_malloc_ops snd_dma_noncontig_ops = {
 	.alloc = snd_dma_noncontig_alloc,
 	.free = snd_dma_noncontig_free,
 	.mmap = snd_dma_noncontig_mmap,
 	.sync = snd_dma_noncontig_sync,
 	/* re-use vmalloc helpers for get_* ops */
-	.get_addr = snd_dma_vmalloc_get_addr,
-	.get_page = snd_dma_vmalloc_get_page,
-	.get_chunk_size = snd_dma_vmalloc_get_chunk_size,
+	.get_addr = snd_dma_noncontig_get_addr,
+	.get_page = snd_dma_noncontig_get_page,
+	.get_chunk_size = snd_dma_noncontig_get_chunk_size,
 };
 
 /*
-- 
2.26.2

