Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B8911752A
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 20:04:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 168A5166A;
	Mon,  9 Dec 2019 20:03:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 168A5166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575918277;
	bh=Vtua8lvwUAEa6maCh9sJIEqJtkqcrdVqBB0E7OqmA3U=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=YOLlCgHHB9lhef6E2uMclf4FndSIEVD8CPTJJNl68UYcsgFKHxYDX5X8kwGECVTYK
	 4kU4HWBiYvO+Sky0oDMdBKsqU3xJ9x1rmQYL565cvaqX1uT94MQPStJIfinMq7eI+L
	 lprHm8GG9cbA6DfCv8uD3BAf1SPfO3bErYhUVhUg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC3D6F8028F;
	Mon,  9 Dec 2019 19:59:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F015EF8028E; Mon,  9 Dec 2019 19:59:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 4725BF80276
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 19:58:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4725BF80276
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60A451045;
 Mon,  9 Dec 2019 10:58:56 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2FC03F6CF;
 Mon,  9 Dec 2019 10:58:55 -0800 (PST)
Date: Mon, 09 Dec 2019 18:58:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20191204211556.12671-6-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191204211556.12671-6-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: core: modify the signature for
	snd_sof_create_page_table" to the asoc tree
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

The patch

   ASoC: SOF: core: modify the signature for snd_sof_create_page_table

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 3e62579436c6a7fc35de7318e6c5f495b8d0046c Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Wed, 4 Dec 2019 15:15:48 -0600
Subject: [PATCH] ASoC: SOF: core: modify the signature for
 snd_sof_create_page_table

Modify the signature for snd_sof_create_page_table to
take struct device pointer as an argument instead of
struct snd_sof_dev as this will be used by both the SOF
core device and its clients. Also, move the definition
out of core.c to utils.c.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191204211556.12671-6-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
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
