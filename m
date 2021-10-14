Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7C342DE4D
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Oct 2021 17:38:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63EFD1672;
	Thu, 14 Oct 2021 17:37:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63EFD1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634225910;
	bh=jVt5rDkLdOSuYOV/f1C+WViSdEwD4SonNFAaXsneboY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PiI6kg/fxpk77Ze/t1im1syyERjLs7uVvsoNJ80sgJC5bh4FeHsrdwTicuTqoYxjR
	 RJNt+kHSGHlAbfYCtGRI+KtHi2h9oIRovqPJKOIKYkK0iTbH1Hryq+DlDaE/15YnJT
	 P7ezCIdOke5VnWcUckeOLB3Skw0cYHmkhthq9ohM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4827EF80212;
	Thu, 14 Oct 2021 17:37:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31210F80212; Thu, 14 Oct 2021 17:37:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B9EDF80212
 for <alsa-devel@alsa-project.org>; Thu, 14 Oct 2021 17:37:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B9EDF80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="QfToHvQx"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="WS/G5Rf8"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id ACCC521A8A
 for <alsa-devel@alsa-project.org>; Thu, 14 Oct 2021 15:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634225823; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B1JsLi2Zz0o4zD3DPg6HQWbOTg6iVJfKp4v/IK8Kdvs=;
 b=QfToHvQx4tRGt4WV9Nz8J0I69rSctka/4PKD045xIxXfGq4ej13Fl8kb392QMt9VJSM+2B
 r65Ig+GSAa8Be35IKt3PTpaQNfOjCfgb8VVpn3I7635f/LvYWsMXRktQkCQlAVPT8TFtGD
 gw8wYX4OVJZU/3EouIiRHFMMZ7CXqRs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634225823;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B1JsLi2Zz0o4zD3DPg6HQWbOTg6iVJfKp4v/IK8Kdvs=;
 b=WS/G5Rf8Rq0L6sZ596tvpJdd/mmvq/ptAQhTXgIMdl8DZRgkb8nJCp+fl3SFPPtSQ1p62F
 tVXrLrDM+XkpBXDw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 9CAAFA3B84;
 Thu, 14 Oct 2021 15:37:03 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ALSA: memalloc: Support for non-coherent page allocation
Date: Thu, 14 Oct 2021 17:37:01 +0200
Message-Id: <20211014153702.5077-3-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211014153702.5077-1-tiwai@suse.de>
References: <20211014153702.5077-1-tiwai@suse.de>
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

Following after the addition of non-contiguous pages, this patch adds
the new contiguous non-coherent page allocation to the standard
memalloc helper.  Like the previous non-contig type, this non-coherent
type is also directional and requires the explicit sync, too.  Hence
the driver using this type of buffer may need to set
SNDRV_PCM_INFO_EXPLICIT_SYNC flag to the PCM hardware.info as well,
unless it's set up in the managed mode.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/memalloc.h |  1 +
 sound/core/memalloc.c    | 47 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/include/sound/memalloc.h b/include/sound/memalloc.h
index 1457eba1ac53..0bdaa6753282 100644
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
index 11f9a68bf94c..99681e651223 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -560,6 +560,52 @@ static const struct snd_malloc_ops snd_dma_noncontig_ops = {
 	.get_chunk_size = snd_dma_vmalloc_get_chunk_size,
 };
 
+/*
+ * Non-coherent pages allocator
+ */
+static void *snd_dma_noncoherent_alloc(struct snd_dma_buffer *dmab, size_t size)
+{
+	dmab->dev.need_sync = dma_need_sync(dmab->dev.dev, dmab->dev.dir);
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
+	if (mode == SNDRV_DMA_SYNC_CPU) {
+		if (dmab->dev.dir != DMA_TO_DEVICE)
+			dma_sync_single_for_cpu(dmab->dev.dev, dmab->addr,
+						dmab->bytes, dmab->dev.dir);
+	} else {
+		if (dmab->dev.dir != DMA_FROM_DEVICE)
+			dma_sync_single_for_device(dmab->dev.dev, dmab->addr,
+						   dmab->bytes, dmab->dev.dir);
+	}
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
@@ -572,6 +618,7 @@ static const struct snd_malloc_ops *dma_ops[] = {
 	[SNDRV_DMA_TYPE_DEV] = &snd_dma_dev_ops,
 	[SNDRV_DMA_TYPE_DEV_WC] = &snd_dma_wc_ops,
 	[SNDRV_DMA_TYPE_NONCONTIG] = &snd_dma_noncontig_ops,
+	[SNDRV_DMA_TYPE_NONCOHERENT] = &snd_dma_noncoherent_ops,
 #ifdef CONFIG_GENERIC_ALLOCATOR
 	[SNDRV_DMA_TYPE_DEV_IRAM] = &snd_dma_iram_ops,
 #endif /* CONFIG_GENERIC_ALLOCATOR */
-- 
2.26.2

