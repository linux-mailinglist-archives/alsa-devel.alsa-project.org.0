Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38579EF6D2
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 09:06:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B5E8171B;
	Tue,  5 Nov 2019 09:05:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B5E8171B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572941167;
	bh=shbkpw2GDtaG6oVDQs7dspz/gaGAAl0xlXl5OKnijC4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XhhQnMIsyc6EQLNAeSaR1GI9Pw274lS+6/Lkg0skE9AypTrXjxQtlACTyRcBWQ4xf
	 9Y6Sk5rNuGRPUl95Uaf3evURxfIiaK6wMJfXT4N3DUMUZlB/aATKfZG7V7TfQjgyrE
	 7xFxoUJCRMVUSX6q2TQOe+w4+VMkAxxa3oXcrAtU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C432BF8063E;
	Tue,  5 Nov 2019 09:01:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA0FAF80600; Tue,  5 Nov 2019 09:01:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38B18F8049B
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 09:01:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38B18F8049B
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 08D27B028
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 08:01:40 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 09:01:36 +0100
Message-Id: <20191105080138.1260-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191105080138.1260-1-tiwai@suse.de>
References: <20191105080138.1260-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 2/4] ALSA: memalloc: Add vmalloc buffer
	allocation support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch adds the vmalloc buffer support to ALSA memalloc core.  A
new type, SNDRV_DMA_TYPE_VMALLOC was added.

The vmalloc buffer has been already supported in the PCM via a few own
helper functions, but the user sometimes get confused and misuse
them.  With this patch, the whole buffer management is integrated into
the memalloc core, so they can be used in a sole common way.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/memalloc.h |  1 +
 sound/core/memalloc.c    | 20 ++++++++++++++++----
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/include/sound/memalloc.h b/include/sound/memalloc.h
index 240622d89c0b..6ada3b8ede4e 100644
--- a/include/sound/memalloc.h
+++ b/include/sound/memalloc.h
@@ -44,6 +44,7 @@ struct snd_dma_device {
 #else
 #define SNDRV_DMA_TYPE_DEV_IRAM	SNDRV_DMA_TYPE_DEV
 #endif
+#define SNDRV_DMA_TYPE_VMALLOC		7	/* vmalloc'ed buffer */
 
 /*
  * info for buffer allocation
diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index e56f84fbd659..ac4cd94dbd66 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -10,6 +10,7 @@
 #include <linux/mm.h>
 #include <linux/dma-mapping.h>
 #include <linux/genalloc.h>
+#include <linux/vmalloc.h>
 #ifdef CONFIG_X86
 #include <asm/set_memory.h>
 #endif
@@ -99,10 +100,11 @@ static void snd_free_dev_iram(struct snd_dma_buffer *dmab)
  *
  */
 
-static inline gfp_t snd_mem_get_gfp_flags(const struct device *dev)
+static inline gfp_t snd_mem_get_gfp_flags(const struct device *dev,
+					  gfp_t default_gfp)
 {
 	if (!dev)
-		return GFP_KRENEL;
+		return default_gfp;
 	else
 		return (__force gfp_t)(unsigned long)dev;
 }
@@ -123,6 +125,8 @@ static inline gfp_t snd_mem_get_gfp_flags(const struct device *dev)
 int snd_dma_alloc_pages(int type, struct device *device, size_t size,
 			struct snd_dma_buffer *dmab)
 {
+	gfp_t gfp;
+
 	if (WARN_ON(!size))
 		return -ENXIO;
 	if (WARN_ON(!dmab))
@@ -135,8 +139,13 @@ int snd_dma_alloc_pages(int type, struct device *device, size_t size,
 	dmab->bytes = 0;
 	switch (type) {
 	case SNDRV_DMA_TYPE_CONTINUOUS:
-		dmab->area = alloc_pages_exact(size,
-					       snd_mem_get_gfp_flags(device));
+		gfp = snd_mem_get_gfp_flags(device, GFP_KERNEL);
+		dmab->area = alloc_pages_exact(size, gfp);
+		dmab->addr = 0;
+		break;
+	case SNDRV_DMA_TYPE_VMALLOC:
+		gfp = snd_mem_get_gfp_flags(device, GFP_KERNEL | __GFP_HIGHMEM);
+		dmab->area = __vmalloc(size, gfp, PAGE_KERNEL);
 		dmab->addr = 0;
 		break;
 #ifdef CONFIG_HAS_DMA
@@ -222,6 +231,9 @@ void snd_dma_free_pages(struct snd_dma_buffer *dmab)
 	case SNDRV_DMA_TYPE_CONTINUOUS:
 		free_pages_exact(dmab->area, dmab->bytes);
 		break;
+	case SNDRV_DMA_TYPE_VMALLOC:
+		vfree(dmab->area);
+		break;
 #ifdef CONFIG_HAS_DMA
 #ifdef CONFIG_GENERIC_ALLOCATOR
 	case SNDRV_DMA_TYPE_DEV_IRAM:
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
