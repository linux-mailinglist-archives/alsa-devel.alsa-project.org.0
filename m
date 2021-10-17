Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2F143071C
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Oct 2021 09:51:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7CBF1877;
	Sun, 17 Oct 2021 09:50:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7CBF1877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634457076;
	bh=jVt5rDkLdOSuYOV/f1C+WViSdEwD4SonNFAaXsneboY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i4kFuPFAttaI1pkBpbazE5+3aFSQ+IY7oLKUE2MLPfU/JBcaV8OUpmQAR9AE3lZF8
	 wqvcuaX+rVC03H/E0cw13GEjtYDl5ui5qS77qFD2lLHCwDlnqf7QN/fiVc7VTUkEFZ
	 Ul4t+rpCKbe+VwXDEcANJS71hpOb56Pvhs3WgWwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4B31F801DB;
	Sun, 17 Oct 2021 09:49:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 766FBF804ED; Sun, 17 Oct 2021 09:49:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBB9EF80254
 for <alsa-devel@alsa-project.org>; Sun, 17 Oct 2021 09:49:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBB9EF80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="QuSDXITQ"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="6VtrvPNE"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id B1ABB2199E
 for <alsa-devel@alsa-project.org>; Sun, 17 Oct 2021 07:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634456940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B1JsLi2Zz0o4zD3DPg6HQWbOTg6iVJfKp4v/IK8Kdvs=;
 b=QuSDXITQZk99WNJ+XB5plBvUuiVXFHXvrnJ02I8zpL63GzQ+RwRfL4ZvdAEaKJjrEE7pZ/
 38AYYhzJuKLqpPjrQlCTGnoE0DEWEKqS+l1qr9wszs2mkaP3S5L8TJ/njTYV29UdaXVFt+
 pm2HWNHf+Ao1L15IEJBP2c7NgZbS6ow=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634456940;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B1JsLi2Zz0o4zD3DPg6HQWbOTg6iVJfKp4v/IK8Kdvs=;
 b=6VtrvPNEYmuFJi0fEAE6HZfb3W1lhGcxeIrQCIMroaUXZP4eIzIOehX+pjGAuOvXXyB9e6
 KxkSSn27TSe9o4Cg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id A0AF1A3B81;
 Sun, 17 Oct 2021 07:49:00 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 2/3] ALSA: memalloc: Support for non-coherent page
 allocation
Date: Sun, 17 Oct 2021 09:48:58 +0200
Message-Id: <20211017074859.24112-3-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211017074859.24112-1-tiwai@suse.de>
References: <20211017074859.24112-1-tiwai@suse.de>
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

