Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 260533DD12C
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 09:31:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9754817DC;
	Mon,  2 Aug 2021 09:30:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9754817DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627889494;
	bh=QCkb9Thxg6aiRKcLGRd1kI30tT6Pkui2TKzcs/ehPic=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XYDt+IxpSquIWmO8qXohQKjrXpomz6taLCdlz7RDBANz0bDwzswpVOXHsu8YXOTU2
	 s9HxaZNEgaHTIEon+UBIFDuLGgj1U3lJqiCVQ2jS7ErBQijrMktZamWSm9GBeVapos
	 WSNCl99AUOIvJSKfIjJg91B76enn6j09j2bHoxSc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38BDCF804F2;
	Mon,  2 Aug 2021 09:28:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 742ABF80268; Mon,  2 Aug 2021 09:28:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF8ECF8025F
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 09:28:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF8ECF8025F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="vQ70OCfP"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="EiAstPqD"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id E2B8921FDB;
 Mon,  2 Aug 2021 07:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627889297; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FYVr0uSXiXP+MWXMEWmvegmjiXCIhCNLk0Q3Kd+Kcpc=;
 b=vQ70OCfP/fMGWfYMqoOWJRt8UDnM2inpZtAxyeFOglJS07+Y6bxSBOVklrd5r1Z7SN4vcC
 nqLKmETnWmmxeLvRWJ+8bAwEeenGN7YU3LoS+Nco2HkebGt1Uf91rfx8j0cH2sTZwz7+L7
 dorUcL5+LZ4rtLrfofVd6Tj4R+Ho78k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627889297;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FYVr0uSXiXP+MWXMEWmvegmjiXCIhCNLk0Q3Kd+Kcpc=;
 b=EiAstPqDNpYg7w/Pj5FXnoamUt4obeV4kvfjoCz411zOyVbeWdhKKG887O/GGK4axJ7YYM
 6RCPBr5eefyU5QAQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id D2F70A3B83;
 Mon,  2 Aug 2021 07:28:17 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/15] ALSA: memalloc: Support WC allocation on all
 architectures
Date: Mon,  2 Aug 2021 09:28:04 +0200
Message-Id: <20210802072815.13551-5-tiwai@suse.de>
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

There are the generic DMA API calls for allocating and managing the
pages with the write-combined attribute.  Let's use them for all
architectures but x86; x86 still needs the special handling to
override the page attributes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/memalloc.c | 46 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index fe8d834e9206..96cd607fcb42 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -327,19 +327,20 @@ static const struct snd_malloc_ops snd_dma_iram_ops = {
 };
 #endif /* CONFIG_GENERIC_ALLOCATOR */
 
+#define DEFAULT_GFP \
+	(GFP_KERNEL | \
+	 __GFP_COMP |    /* compound page lets parts be mapped */ \
+	 __GFP_NORETRY | /* don't trigger OOM-killer */ \
+	 __GFP_NOWARN)   /* no stack trace print - this call is non-critical */
+
 /*
  * Coherent device pages allocator
  */
 static void *snd_dma_dev_alloc(struct snd_dma_buffer *dmab, size_t size)
 {
-	gfp_t gfp_flags;
 	void *p;
 
-	gfp_flags = GFP_KERNEL
-		| __GFP_COMP	/* compound page lets parts be mapped */
-		| __GFP_NORETRY /* don't trigger OOM-killer */
-		| __GFP_NOWARN; /* no stack trace print - this call is non-critical */
-	p = dma_alloc_coherent(dmab->dev.dev, size, &dmab->addr, gfp_flags);
+	p = dma_alloc_coherent(dmab->dev.dev, size, &dmab->addr, DEFAULT_GFP);
 #ifdef CONFIG_X86
 	if (p && dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC)
 		set_memory_wc((unsigned long)p, PAGE_ALIGN(size) >> PAGE_SHIFT);
@@ -369,6 +370,37 @@ static const struct snd_malloc_ops snd_dma_dev_ops = {
 	.free = snd_dma_dev_free,
 	.mmap = snd_dma_dev_mmap,
 };
+
+/*
+ * Write-combined pages
+ */
+#ifdef CONFIG_X86
+/* On x86, share the same ops as the standard dev ops */
+#define snd_dma_wc_ops	snd_dma_dev_ops
+#else /* CONFIG_X86 */
+static void *snd_dma_wc_alloc(struct snd_dma_buffer *dmab, size_t size)
+{
+	return dma_alloc_wc(dmab->dev.dev, size, &dmab->addr, DEFAULT_GFP);
+}
+
+static void snd_dma_wc_free(struct snd_dma_buffer *dmab)
+{
+	dma_free_wc(dmab->dev.dev, dmab->bytes, dmab->area, dmab->addr);
+}
+
+static int snd_dma_wc_mmap(struct snd_dma_buffer *dmab,
+			   struct vm_area_struct *area)
+{
+	return dma_mmap_wc(dmab->dev.dev, area,
+			   dmab->area, dmab->addr, dmab->bytes);
+}
+
+static const struct snd_malloc_ops snd_dma_wc_ops = {
+	.alloc = snd_dma_wc_alloc,
+	.free = snd_dma_wc_free,
+	.mmap = snd_dma_wc_mmap,
+};
+#endif /* CONFIG_X86 */
 #endif /* CONFIG_HAS_DMA */
 
 /*
@@ -379,7 +411,7 @@ static const struct snd_malloc_ops *dma_ops[] = {
 	[SNDRV_DMA_TYPE_VMALLOC] = &snd_dma_vmalloc_ops,
 #ifdef CONFIG_HAS_DMA
 	[SNDRV_DMA_TYPE_DEV] = &snd_dma_dev_ops,
-	[SNDRV_DMA_TYPE_DEV_WC] = &snd_dma_dev_ops,
+	[SNDRV_DMA_TYPE_DEV_WC] = &snd_dma_wc_ops,
 #ifdef CONFIG_GENERIC_ALLOCATOR
 	[SNDRV_DMA_TYPE_DEV_IRAM] = &snd_dma_iram_ops,
 #endif /* CONFIG_GENERIC_ALLOCATOR */
-- 
2.26.2

