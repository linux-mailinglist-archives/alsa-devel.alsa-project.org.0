Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6583C9A0F
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:02:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6341A16C1;
	Thu, 15 Jul 2021 10:01:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6341A16C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626336160;
	bh=2BGYWrXBGZJ2umOkUHgE/h0NhuwHvsi2h/cJRb6EGOY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TX5Cn+8PeWT0IpfDhsgZ01sOm/p6go5n2gbKX7UqnX6sV5Z9IwQgnCnb3+rfzhVjD
	 xbFZ6K6zxJPKfdzp8atySLmzc3l3SN+VcZdu/GpouUNzV7GY9xlRUkrzMdt1lKFwZu
	 UgreWfiqkan4tYXThdrAZSbP48DfuhM/tUwCgHSg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68727F80537;
	Thu, 15 Jul 2021 10:00:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DA91F80519; Thu, 15 Jul 2021 10:00:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B6CDF8013C
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 09:59:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B6CDF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="fMADzOWS"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="AOuTxo+9"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id A11782284C
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 07:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626335990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5joqZEry4ixJz2fagLW3ZFdGm3Atk1p7KkBSww/qRU4=;
 b=fMADzOWSQ0vQQx/NDbtByGNX+ecegqdMDLDEi5prSpBusk7Na5n/2CB2j9XBbwjv955UwN
 QDhCGkU1hUmt6poqwH1Uhz2beAcBCJvjbsnVd5+aQAjOOZYwqq4X/8M/70z2lPmSNnN8ot
 2F9CeB2K2p6YWU4xTDyjuqdapXFJ7lg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626335990;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5joqZEry4ixJz2fagLW3ZFdGm3Atk1p7KkBSww/qRU4=;
 b=AOuTxo+9dfuqiDTQlf5S1h7QsKH1AoB7ifL7Z4/8HthceCsItjD/qUumiXTxBjVOHdiApP
 nY1bMwPriRUp3pBQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 8FC1DA3B9A;
 Thu, 15 Jul 2021 07:59:50 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 01/79] ALSA: core: Add device-managed page allocator helper
Date: Thu, 15 Jul 2021 09:58:23 +0200
Message-Id: <20210715075941.23332-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210715075941.23332-1-tiwai@suse.de>
References: <20210715075941.23332-1-tiwai@suse.de>
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

This is a preparation for allowing devres usages more widely in
various sound drivers.  As a first step, this patch adds a new
allocator function, snd_devm_alloc_pages(), to manage the allocated
pages via devres, so that the pages will be automagically released as
device unbinding.

Unlike the old snd_dma_alloc_pages(), the new function returns
directly the snd_dma_buffer pointer.  The caller needs NULL-check for
the allocation error appropriately.

Also, since a real device pointer is mandatory for devres,
SNDRV_DMA_TYPE_CONTINUOUS or SNDRV_DMA_TYPE_VMALLOC type can't be used
for this function.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/memalloc.h |  4 ++++
 sound/core/memalloc.c    | 46 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/include/sound/memalloc.h b/include/sound/memalloc.h
index 44d87775b352..d22c9387b2ba 100644
--- a/include/sound/memalloc.h
+++ b/include/sound/memalloc.h
@@ -79,5 +79,9 @@ struct page *snd_sgbuf_get_page(struct snd_dma_buffer *dmab, size_t offset);
 unsigned int snd_sgbuf_get_chunk_size(struct snd_dma_buffer *dmab,
 				      unsigned int ofs, unsigned int size);
 
+/* device-managed memory allocator */
+struct snd_dma_buffer *snd_devm_alloc_pages(struct device *dev, int type,
+					    size_t size);
+
 #endif /* __SOUND_MEMALLOC_H */
 
diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 83b79edfa52d..3a78fdad1ab4 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -127,6 +127,52 @@ void snd_dma_free_pages(struct snd_dma_buffer *dmab)
 }
 EXPORT_SYMBOL(snd_dma_free_pages);
 
+/* called by devres */
+static void __snd_release_pages(struct device *dev, void *res)
+{
+	snd_dma_free_pages(res);
+}
+
+/**
+ * snd_devm_alloc_pages - allocate the buffer and manage with devres
+ * @dev: the device pointer
+ * @type: the DMA buffer type
+ * @size: the buffer size to allocate
+ *
+ * Allocate buffer pages depending on the given type and manage using devres.
+ * The pages will be released automatically at the device removal.
+ *
+ * Unlike snd_dma_alloc_pages(), this function requires the real device pointer,
+ * hence it can't work with SNDRV_DMA_TYPE_CONTINUOUS or
+ * SNDRV_DMA_TYPE_VMALLOC type.
+ *
+ * The function returns the snd_dma_buffer object at success, or NULL if failed.
+ */
+struct snd_dma_buffer *
+snd_devm_alloc_pages(struct device *dev, int type, size_t size)
+{
+	struct snd_dma_buffer *dmab;
+	int err;
+
+	if (WARN_ON(type == SNDRV_DMA_TYPE_CONTINUOUS ||
+		    type == SNDRV_DMA_TYPE_VMALLOC))
+		return NULL;
+
+	dmab = devres_alloc(__snd_release_pages, sizeof(*dmab), GFP_KERNEL);
+	if (!dmab)
+		return NULL;
+
+	err = snd_dma_alloc_pages(type, dev, size, dmab);
+	if (err < 0) {
+		devres_free(dmab);
+		return NULL;
+	}
+
+	devres_add(dev, dmab);
+	return dmab;
+}
+EXPORT_SYMBOL_GPL(snd_devm_alloc_pages);
+
 /**
  * snd_dma_buffer_mmap - perform mmap of the given DMA buffer
  * @dmab: buffer allocation information
-- 
2.26.2

