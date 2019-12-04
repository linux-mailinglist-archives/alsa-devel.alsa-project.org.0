Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C2D1136FF
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Dec 2019 22:21:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF4EE1677;
	Wed,  4 Dec 2019 22:20:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF4EE1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575494487;
	bh=VwexC7699/D1rgz5+k0j8XLvY7LOiB7I4ItOVmjVOio=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WtHMxBikAbH4/Y/wjJKTpuD1BrW+MYBDsRT/GePh2zOilNDhI3V8WUERYbeJsx0xM
	 VPJYLVAa1zf/CHse54RSS5HUBOsuA19lao8lf1D+2ZTrlGeFOHvQe8yVliaWMZilbR
	 mDQ7ndSoDkMHBU63dWtY72uyXUNOprceVUPgoWAY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E9D2F8025F;
	Wed,  4 Dec 2019 22:16:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F007F8023E; Wed,  4 Dec 2019 22:16:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AB96F80217
 for <alsa-devel@alsa-project.org>; Wed,  4 Dec 2019 22:16:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AB96F80217
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Dec 2019 13:16:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,278,1571727600"; d="scan'208";a="223378569"
Received: from rgolani-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.153.236])
 by orsmga002.jf.intel.com with ESMTP; 04 Dec 2019 13:16:14 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  4 Dec 2019 15:15:48 -0600
Message-Id: <20191204211556.12671-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191204211556.12671-1-pierre-louis.bossart@linux.intel.com>
References: <20191204211556.12671-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 05/13] ASoC: SOF: core: modify the signature
	for snd_sof_create_page_table
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Modify the signature for snd_sof_create_page_table to
take struct device pointer as an argument instead of
struct snd_sof_dev as this will be used by both the SOF
core device and its clients. Also, move the definition
out of core.c to utils.c.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/core.c     | 59 ---------------------------------------
 sound/soc/sof/pcm.c      |  2 +-
 sound/soc/sof/sof-priv.h |  2 +-
 sound/soc/sof/trace.c    |  4 +--
 sound/soc/sof/utils.c    | 60 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 64 insertions(+), 63 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 805918d3bcc0..6a7f342203e9 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -10,7 +10,6 @@
 
 #include <linux/firmware.h>
 #include <linux/module.h>
-#include <asm/unaligned.h>
 #include <sound/soc.h>
 #include <sound/sof.h>
 #include "sof-priv.h"
@@ -213,64 +212,6 @@ void snd_sof_get_status(struct snd_sof_dev *sdev, u32 panic_code,
 }
 EXPORT_SYMBOL(snd_sof_get_status);
 
-/*
- * Generic buffer page table creation.
- * Take the each physical page address and drop the least significant unused
- * bits from each (based on PAGE_SIZE). Then pack valid page address bits
- * into compressed page table.
- */
-
-int snd_sof_create_page_table(struct snd_sof_dev *sdev,
-			      struct snd_dma_buffer *dmab,
-			      unsigned char *page_table, size_t size)
-{
-	int i, pages;
-
-	pages = snd_sgbuf_aligned_pages(size);
-
-	dev_dbg(sdev->dev, "generating page table for %p size 0x%zx pages %d\n",
-		dmab->area, size, pages);
-
-	for (i = 0; i < pages; i++) {
-		/*
-		 * The number of valid address bits for each page is 20.
-		 * idx determines the byte position within page_table
-		 * where the current page's address is stored
-		 * in the compressed page_table.
-		 * This can be calculated by multiplying the page number by 2.5.
-		 */
-		u32 idx = (5 * i) >> 1;
-		u32 pfn = snd_sgbuf_get_addr(dmab, i * PAGE_SIZE) >> PAGE_SHIFT;
-		u8 *pg_table;
-
-		dev_vdbg(sdev->dev, "pfn i %i idx %d pfn %x\n", i, idx, pfn);
-
-		pg_table = (u8 *)(page_table + idx);
-
-		/*
-		 * pagetable compression:
-		 * byte 0     byte 1     byte 2     byte 3     byte 4     byte 5
-		 * ___________pfn 0__________ __________pfn 1___________  _pfn 2...
-		 * .... ....  .... ....  .... ....  .... ....  .... ....  ....
-		 * It is created by:
-		 * 1. set current location to 0, PFN index i to 0
-		 * 2. put pfn[i] at current location in Little Endian byte order
-		 * 3. calculate an intermediate value as
-		 *    x = (pfn[i+1] << 4) | (pfn[i] & 0xf)
-		 * 4. put x at offset (current location + 2) in LE byte order
-		 * 5. increment current location by 5 bytes, increment i by 2
-		 * 6. continue to (2)
-		 */
-		if (i & 1)
-			put_unaligned_le32((pg_table[0] & 0xf) | pfn << 4,
-					   pg_table);
-		else
-			put_unaligned_le32(pfn, pg_table);
-	}
-
-	return pages;
-}
-
 /*
  * SOF Driver enumeration.
  */
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 549238a98b2a..9fd73ef08904 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -33,7 +33,7 @@ static int create_page_table(struct snd_soc_component *component,
 	if (!spcm)
 		return -EINVAL;
 
-	return snd_sof_create_page_table(sdev, dmab,
+	return snd_sof_create_page_table(sdev->dev, dmab,
 		spcm->stream[stream].page_table.area, size);
 }
 
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 31f0eb31598a..18dd832f2053 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -499,7 +499,7 @@ int snd_sof_set_d0_substate(struct snd_sof_dev *sdev,
 
 void snd_sof_new_platform_drv(struct snd_sof_dev *sdev);
 
-int snd_sof_create_page_table(struct snd_sof_dev *sdev,
+int snd_sof_create_page_table(struct device *dev,
 			      struct snd_dma_buffer *dmab,
 			      unsigned char *page_table, size_t size);
 
diff --git a/sound/soc/sof/trace.c b/sound/soc/sof/trace.c
index b0e4556c8536..4bb65030819d 100644
--- a/sound/soc/sof/trace.c
+++ b/sound/soc/sof/trace.c
@@ -250,8 +250,8 @@ int snd_sof_init_trace(struct snd_sof_dev *sdev)
 	}
 
 	/* create compressed page table for audio firmware */
-	ret = snd_sof_create_page_table(sdev, &sdev->dmatb, sdev->dmatp.area,
-					sdev->dmatb.bytes);
+	ret = snd_sof_create_page_table(sdev->dev, &sdev->dmatb,
+					sdev->dmatp.area, sdev->dmatb.bytes);
 	if (ret < 0)
 		goto table_err;
 
diff --git a/sound/soc/sof/utils.c b/sound/soc/sof/utils.c
index 2ac4c3da0320..9831eb57df6c 100644
--- a/sound/soc/sof/utils.c
+++ b/sound/soc/sof/utils.c
@@ -10,6 +10,7 @@
 
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/platform_device.h>
+#include <asm/unaligned.h>
 #include <sound/soc.h>
 #include <sound/sof.h>
 #include "sof-priv.h"
@@ -110,3 +111,62 @@ void sof_block_read(struct snd_sof_dev *sdev, u32 bar, u32 offset, void *dest,
 	memcpy_fromio(dest, src, size);
 }
 EXPORT_SYMBOL(sof_block_read);
+
+/*
+ * Generic buffer page table creation.
+ * Take the each physical page address and drop the least significant unused
+ * bits from each (based on PAGE_SIZE). Then pack valid page address bits
+ * into compressed page table.
+ */
+
+int snd_sof_create_page_table(struct device *dev,
+			      struct snd_dma_buffer *dmab,
+			      unsigned char *page_table, size_t size)
+{
+	int i, pages;
+
+	pages = snd_sgbuf_aligned_pages(size);
+
+	dev_dbg(dev, "generating page table for %p size 0x%zx pages %d\n",
+		dmab->area, size, pages);
+
+	for (i = 0; i < pages; i++) {
+		/*
+		 * The number of valid address bits for each page is 20.
+		 * idx determines the byte position within page_table
+		 * where the current page's address is stored
+		 * in the compressed page_table.
+		 * This can be calculated by multiplying the page number by 2.5.
+		 */
+		u32 idx = (5 * i) >> 1;
+		u32 pfn = snd_sgbuf_get_addr(dmab, i * PAGE_SIZE) >> PAGE_SHIFT;
+		u8 *pg_table;
+
+		dev_vdbg(dev, "pfn i %i idx %d pfn %x\n", i, idx, pfn);
+
+		pg_table = (u8 *)(page_table + idx);
+
+		/*
+		 * pagetable compression:
+		 * byte 0     byte 1     byte 2     byte 3     byte 4     byte 5
+		 * ___________pfn 0__________ __________pfn 1___________  _pfn 2...
+		 * .... ....  .... ....  .... ....  .... ....  .... ....  ....
+		 * It is created by:
+		 * 1. set current location to 0, PFN index i to 0
+		 * 2. put pfn[i] at current location in Little Endian byte order
+		 * 3. calculate an intermediate value as
+		 *    x = (pfn[i+1] << 4) | (pfn[i] & 0xf)
+		 * 4. put x at offset (current location + 2) in LE byte order
+		 * 5. increment current location by 5 bytes, increment i by 2
+		 * 6. continue to (2)
+		 */
+		if (i & 1)
+			put_unaligned_le32((pg_table[0] & 0xf) | pfn << 4,
+					   pg_table);
+		else
+			put_unaligned_le32(pfn, pg_table);
+	}
+
+	return pages;
+}
+EXPORT_SYMBOL(snd_sof_create_page_table);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
