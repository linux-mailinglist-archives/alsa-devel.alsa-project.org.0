Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D91F55118F
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 09:35:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 398DD17E9;
	Mon, 20 Jun 2022 09:34:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 398DD17E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655710549;
	bh=Ked2EAJWLybhnSVfOnX3FQ7RcybL9QnKwORB8VXXJgY=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cGWGbNL60fgpI+hwnInitAvtVR8xhTf0a29Bx+LbClwXqDgkZDk8zNO/Yk4FkIg8A
	 +7nsifXnt5AblFfhYRJvwG72bfsdljPolrjFUevcwGoO7K075rQaavpCVVffGysRue
	 zcRW7WixP7tfOBPkg2tSXWHz6fYVJMyhcK+N5R3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 654E2F800CB;
	Mon, 20 Jun 2022 09:34:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B241F800CB; Mon, 20 Jun 2022 09:34:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2401BF800E3
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 09:34:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2401BF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="fX54+TYF"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="aNhLCIGR"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6B46F21BB8;
 Mon, 20 Jun 2022 07:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655710482; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZDgUTew8dbnoVTo9socEYEL8eIzGXyNWHkryn1S4h8c=;
 b=fX54+TYFOOguFsREJ08OKeQu/44BQ6h6qcjCi4Vv3nhxwnHWwtALW+uN0jR3pTr6U0iqoV
 2DNLGjHEYz4Z9LG1xpQYRXT/zZ2r825vYQlk615oj7TuetIvtvF79VwL/dFzgRu3uhKuNb
 ADpJMmqfiwLHtc+feFCQowtKGy7I398=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655710482;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZDgUTew8dbnoVTo9socEYEL8eIzGXyNWHkryn1S4h8c=;
 b=aNhLCIGReXB91QCn1yry0JUTUB2cbjsIKJgMTIgd6JOfgGLjgCrV9Y47AZpUHwyDQF6Cns
 Bf2+he970vg5udBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 53AF3134CA;
 Mon, 20 Jun 2022 07:34:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ADyhExIjsGLuCQAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 20 Jun 2022 07:34:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: memalloc: Drop x86-specific hack for WC allocations
Date: Mon, 20 Jun 2022 09:34:40 +0200
Message-Id: <20220620073440.7514-1-tiwai@suse.de>
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

The recent report for a crash on Haswell machines implied that the
x86-specific (rather hackish) implementation for write-cache memory
buffer allocation in ALSA core is buggy with the recent kernel in some
corner cases.  This patch drops the x86-specific implementation and
uses the standard dma_alloc_wc() & co generically for avoiding the bug
and also for simplification.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=216112
Cc: <stable@vger.kernel.org> # v5.18+
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/memalloc.c | 23 +----------------------
 1 file changed, 1 insertion(+), 22 deletions(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 15dc7160ba34..8cfdaee77905 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -431,33 +431,17 @@ static const struct snd_malloc_ops snd_dma_iram_ops = {
  */
 static void *snd_dma_dev_alloc(struct snd_dma_buffer *dmab, size_t size)
 {
-	void *p;
-
-	p = dma_alloc_coherent(dmab->dev.dev, size, &dmab->addr, DEFAULT_GFP);
-#ifdef CONFIG_X86
-	if (p && dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC)
-		set_memory_wc((unsigned long)p, PAGE_ALIGN(size) >> PAGE_SHIFT);
-#endif
-	return p;
+	return dma_alloc_coherent(dmab->dev.dev, size, &dmab->addr, DEFAULT_GFP);
 }
 
 static void snd_dma_dev_free(struct snd_dma_buffer *dmab)
 {
-#ifdef CONFIG_X86
-	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC)
-		set_memory_wb((unsigned long)dmab->area,
-			      PAGE_ALIGN(dmab->bytes) >> PAGE_SHIFT);
-#endif
 	dma_free_coherent(dmab->dev.dev, dmab->bytes, dmab->area, dmab->addr);
 }
 
 static int snd_dma_dev_mmap(struct snd_dma_buffer *dmab,
 			    struct vm_area_struct *area)
 {
-#ifdef CONFIG_X86
-	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC)
-		area->vm_page_prot = pgprot_writecombine(area->vm_page_prot);
-#endif
 	return dma_mmap_coherent(dmab->dev.dev, area,
 				 dmab->area, dmab->addr, dmab->bytes);
 }
@@ -471,10 +455,6 @@ static const struct snd_malloc_ops snd_dma_dev_ops = {
 /*
  * Write-combined pages
  */
-#ifdef CONFIG_X86
-/* On x86, share the same ops as the standard dev ops */
-#define snd_dma_wc_ops	snd_dma_dev_ops
-#else /* CONFIG_X86 */
 static void *snd_dma_wc_alloc(struct snd_dma_buffer *dmab, size_t size)
 {
 	return dma_alloc_wc(dmab->dev.dev, size, &dmab->addr, DEFAULT_GFP);
@@ -497,7 +477,6 @@ static const struct snd_malloc_ops snd_dma_wc_ops = {
 	.free = snd_dma_wc_free,
 	.mmap = snd_dma_wc_mmap,
 };
-#endif /* CONFIG_X86 */
 
 #ifdef CONFIG_SND_DMA_SGBUF
 static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size);
-- 
2.35.3

