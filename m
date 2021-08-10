Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F2E3E59D4
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Aug 2021 14:23:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15AE8167D;
	Tue, 10 Aug 2021 14:23:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15AE8167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628598236;
	bh=3Mp41M4gj7uKiJ/XrrrLT1frlQrTWL5CMHi1zJhkREc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rpCucpjh39KwsLTuiTFUOeNlDINpuwWW+/2Beb2CHNatN5t5E2ZxfGqS4NQOmwfYa
	 V1GPG3PVB3f456OBxckdKuj02Uu/EsMbLhljwrH3UY5ThIAVdfKCn0vZpatgl0w/Xi
	 XI8ahMli2G/YLn6M5KlqPh0JrmCbimH7qgZZegKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6275F800FD;
	Tue, 10 Aug 2021 14:22:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8467F804CF; Tue, 10 Aug 2021 14:22:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B72EBF80245
 for <alsa-devel@alsa-project.org>; Tue, 10 Aug 2021 14:22:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B72EBF80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="ddmw+yYK"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="ZfkRvy47"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id E253022058
 for <alsa-devel@alsa-project.org>; Tue, 10 Aug 2021 12:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628598123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KhgvL821dpw0CiVDE44zwkIbMEg5eBWDJz0RG3DuL04=;
 b=ddmw+yYKfKJb7mjhsvXXikDa6J2Rpe2XCht7uKss6Kxie8A0dKQTohu5iQzjfKqoIYJVXy
 s+Ti+uoGioPqv98n+TgV47pri9IVmYJpwMN3gUk3IxVlGAHXEqkcVik51Mtf92nSQlsfXi
 KTrXYplqxDq/EW21USGYP0cF6CkFzMM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628598123;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KhgvL821dpw0CiVDE44zwkIbMEg5eBWDJz0RG3DuL04=;
 b=ZfkRvy47Puu1oP96KCpZlZN0uuK9LXDcg+FuV78oc1ZD9pIUjUZ+NUuV2pVxeKYalqqJLy
 K+VyppXQVztTrEDw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id D2ACCA3B88;
 Tue, 10 Aug 2021 12:22:03 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH RFC 5/5] ALSA: memalloc: Support for non-coherent page
 allocation
Date: Tue, 10 Aug 2021 14:22:00 +0200
Message-Id: <20210810122200.971-6-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210810122200.971-1-tiwai@suse.de>
References: <20210810122200.971-1-tiwai@suse.de>
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

This patch adds the new non-coherent contiguous page allocation to the
standard memalloc helper.  Like the previous patch to add the
non-contig SG-buffer support, this non-coherent type is also direction
and requires the explicit sync, too.  Hence the driver using this type
of buffer would have to set SNDRV_PCM_INFO_EXPLICIT_SYNC flag to the
PCM hardware.info as well.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/memalloc.h |  1 +
 sound/core/memalloc.c    | 43 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/include/sound/memalloc.h b/include/sound/memalloc.h
index ed54f9dfb2b3..3b03e3266e90 100644
--- a/include/sound/memalloc.h
+++ b/include/sound/memalloc.h
@@ -50,6 +50,7 @@ struct snd_dma_device {
 #endif
 #define SNDRV_DMA_TYPE_VMALLOC		7	/* vmalloc'ed buffer */
 #define SNDRV_DMA_TYPE_NONCONTIG	8	/* non-coherent SG buffer */
+#define SNDRV_DMA_TYPE_NONCOHERENT	9	/* non-coherent buffer */
 
 /*
  * info for buffer allocation
diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 5ffd356e0327..ad092986c7a8 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -539,6 +539,48 @@ static const struct snd_malloc_ops snd_dma_noncontig_ops = {
 	.get_chunk_size = snd_dma_vmalloc_get_chunk_size,
 };
 
+/*
+ * Non-coherent pages allocator
+ */
+static void *snd_dma_noncoherent_alloc(struct snd_dma_buffer *dmab, size_t size)
+{
+	return dma_alloc_noncoherent(dmab->dev.dev, size, &dmab->addr,
+				     dmab->dev.dir, DEFAULT_GFP);
+}
+
+static void snd_dma_noncoherent_free(struct snd_dma_buffer *dmab)
+{
+	dma_free_noncoherent(dmab->dev.dev, dmab->bytes, dmab->area,
+			     dmab->addr, dmab->dev.dir);
+}
+
+static int snd_dma_noncoherent_mmap(struct snd_dma_buffer *dmab,
+				    struct vm_area_struct *area)
+{
+	area->vm_page_prot = vm_get_page_prot(area->vm_flags);
+	return dma_mmap_pages(dmab->dev.dev, area,
+			      area->vm_end - area->vm_start,
+			      virt_to_page(dmab->area));
+}
+
+static void snd_dma_noncoherent_sync(struct snd_dma_buffer *dmab,
+				     enum snd_dma_sync_mode mode)
+{
+	if (mode == SNDRV_DMA_SYNC_CPU)
+		dma_sync_single_for_cpu(dmab->dev.dev, dmab->addr,
+					dmab->bytes, dmab->dev.dir);
+	else
+		dma_sync_single_for_device(dmab->dev.dev, dmab->addr,
+					   dmab->bytes, dmab->dev.dir);
+}
+
+static const struct snd_malloc_ops snd_dma_noncoherent_ops = {
+	.alloc = snd_dma_noncoherent_alloc,
+	.free = snd_dma_noncoherent_free,
+	.mmap = snd_dma_noncoherent_mmap,
+	.sync = snd_dma_noncoherent_sync,
+};
+
 #endif /* CONFIG_HAS_DMA */
 
 /*
@@ -551,6 +593,7 @@ static const struct snd_malloc_ops *dma_ops[] = {
 	[SNDRV_DMA_TYPE_DEV] = &snd_dma_dev_ops,
 	[SNDRV_DMA_TYPE_DEV_WC] = &snd_dma_wc_ops,
 	[SNDRV_DMA_TYPE_NONCONTIG] = &snd_dma_noncontig_ops,
+	[SNDRV_DMA_TYPE_NONCOHERENT] = &snd_dma_noncoherent_ops,
 #ifdef CONFIG_GENERIC_ALLOCATOR
 	[SNDRV_DMA_TYPE_DEV_IRAM] = &snd_dma_iram_ops,
 #endif /* CONFIG_GENERIC_ALLOCATOR */
-- 
2.26.2

