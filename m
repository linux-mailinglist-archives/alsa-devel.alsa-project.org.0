Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C17363EB279
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Aug 2021 10:18:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FA6D18B2;
	Fri, 13 Aug 2021 10:17:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FA6D18B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628842703;
	bh=DvyKZMz7EF+ssjfSznv3gqDext1BOubt17m94A+jIQc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LarAGUGhfbXTEwP4mEesKrI3tr/wNtKXdZcBfXo9BgfsXeeX6RzpqFZt/FYG8KkbQ
	 vPtpGSGlhfuzuY1qEbN5Yh+MKkWzZbP8Rl5rkKeFs5Gyf0wKLM/1R7FMxYdHwbmajg
	 R5vM+nPxh2Me1/7Rq9IJIp+JaqvSDu6XCGHrohPo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E07F9F8032D;
	Fri, 13 Aug 2021 10:16:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23759F802D2; Fri, 13 Aug 2021 10:16:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25229F800E5
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 10:16:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25229F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="AoaEVYJF"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="e/3AwCGW"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 298EA1FF8A
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 08:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628842607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=JDV5LvD+W5sczUS4yZwH7w3MapB294d75NkJUxbi5aI=;
 b=AoaEVYJFa9sVFf4wYeblm0mOvaQqdwfavVuQJOrZMl1TvaQNY5124QHWQzUizzYoitk6rF
 wQsFhB2vcghzOELP5jtFVICU6twsu5EwppEHMnY6KLPdeukXYZHWePSAJHk9vPYJso+ZW4
 f5IYUvN8J75WWeZN6b34Wx7/k0v37f4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628842607;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=JDV5LvD+W5sczUS4yZwH7w3MapB294d75NkJUxbi5aI=;
 b=e/3AwCGWJ1iBra8Di/Zc9vMpDkkpV/MHoWxw/YFJJg5+ZftO4jSpQcDynU4aPWPUNDi4rl
 d9zGrX81L0KJrMBQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 178C6A3B84;
 Fri, 13 Aug 2021 08:16:47 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: memalloc: Count continuous pages in vmalloc buffer
 handler
Date: Fri, 13 Aug 2021 10:16:45 +0200
Message-Id: <20210813081645.4680-1-tiwai@suse.de>
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

This is an enhancement for the SG-style page handling in vmalloc
buffer handler to calculate the continuous pages.
When snd_sgbuf_get_chunk_size() is called for a vmalloc buffer,
currently we return only the size that fits into a single page.
However, this API call is rather supposed for obtaining the continuous
pages and most of vmalloc or noncontig buffers do have lots of
continuous pages indeed.  So, in this patch, the callback now
calculates the possibly continuous pages up to the given size limit.

Note that the end address in the function is calculated from the last
byte, hence it's one byte shorter.  This is because ofs + size can be
above the actual buffer size boundary.

Until now, this feature isn't really used, but it'll become useful in
a later patch that adds the non-contiguous buffer type that shares the
same callback function as vmalloc.

Link: https://lore.kernel.org/r/20210812113818.6479-1-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/memalloc.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 1cea8cb9668f..c7c943c661e6 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -290,11 +290,13 @@ static int snd_dma_vmalloc_mmap(struct snd_dma_buffer *dmab,
 	return remap_vmalloc_range(area, dmab->area, 0);
 }
 
+#define get_vmalloc_page_addr(dmab, offset) \
+	page_to_phys(vmalloc_to_page((dmab)->area + (offset)))
+
 static dma_addr_t snd_dma_vmalloc_get_addr(struct snd_dma_buffer *dmab,
 					   size_t offset)
 {
-	return page_to_phys(vmalloc_to_page(dmab->area + offset)) +
-		offset % PAGE_SIZE;
+	return get_vmalloc_page_addr(dmab, offset) + offset % PAGE_SIZE;
 }
 
 static struct page *snd_dma_vmalloc_get_page(struct snd_dma_buffer *dmab,
@@ -307,11 +309,23 @@ static unsigned int
 snd_dma_vmalloc_get_chunk_size(struct snd_dma_buffer *dmab,
 			       unsigned int ofs, unsigned int size)
 {
-	ofs %= PAGE_SIZE;
-	size += ofs;
-	if (size > PAGE_SIZE)
-		size = PAGE_SIZE;
-	return size - ofs;
+	unsigned int start, end;
+	unsigned long addr;
+
+	start = ALIGN_DOWN(ofs, PAGE_SIZE);
+	end = ofs + size - 1; /* the last byte address */
+	/* check page continuity */
+	addr = get_vmalloc_page_addr(dmab, start);
+	for (;;) {
+		start += PAGE_SIZE;
+		if (start > end)
+			break;
+		addr += PAGE_SIZE;
+		if (get_vmalloc_page_addr(dmab, start) != addr)
+			return start - ofs;
+	}
+	/* ok, all on continuous pages */
+	return size;
 }
 
 static const struct snd_malloc_ops snd_dma_vmalloc_ops = {
-- 
2.26.2

