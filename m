Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7984B0B94
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 11:57:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F3AD1899;
	Thu, 10 Feb 2022 11:57:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F3AD1899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644490678;
	bh=zG0rPmc+M7NnPQ92kjKfNGFNbwAdhoZlDMjs1VeaqKs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A/cJfdGDNXH5jHCD9mWOdE1vZktaZI8Be3Rzof/0Gid5oh5ZMwB5FFocIuPF6i2Np
	 6ckv8SXyMC9PuaTJ/RKdbhLu8/PUvdGEq/fhudxcJvvG14Fbu2kf80B6P0yDYeMjeF
	 PSnUbfDgbfV72kMqMY1GiSMVHXSHs6QPva79E1eM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4C65F8051E;
	Thu, 10 Feb 2022 11:55:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF07DF8051A; Thu, 10 Feb 2022 11:55:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B6C3F8016C
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 11:55:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B6C3F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="gXiS0Yf1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644490537; x=1676026537;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zG0rPmc+M7NnPQ92kjKfNGFNbwAdhoZlDMjs1VeaqKs=;
 b=gXiS0Yf1Y4+DMedxxWH30GrYYQ7ddiDINIl+lJVoKNu2SsEqCyT7ouDB
 F6eiRaTUBqRqwdNXiyh819NlIjDmFL2a/x7eI+dTtcOJ9sw+WTyqQ8cTY
 OFW7nDyKQjcwo0WGJjeOqzDOYLk2pdxjwRwqD2hksetc18HmYSnSMlYVi
 2+IoEpDTVXXPAgFEA9XG/ESbfcV4OHQK/m44xJt/7cJ9ZUyyHEkOa3hF7
 Buz5G+EHCS3XLnrzfAw6FybCQpX/mhsdPS9GurZUoOghJ9/E2zyIif4pW
 UhFsUCVH5MM+5Cfv16M0Aeoumrti5I7eZ3MEAguJLv2/nZDag3uU47hTh w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="310202857"
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="310202857"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 02:55:35 -0800
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="679106853"
Received: from barabano-mobl.ccr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.41.18])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 02:55:32 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com
Subject: [PATCH 4/9] ASoC: SOF: Split up utils.c into sof-utils and iomem-utils
Date: Thu, 10 Feb 2022 12:55:14 +0200
Message-Id: <20220210105519.19795-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220210105519.19795-1-peter.ujfalusi@linux.intel.com>
References: <20220210105519.19795-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, fred.oh@linux.intel.com, daniel.baluta@nxp.com
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

The utils.c contains wrappers and implementation for accessing iomem mapped
regions and a single unrelated function to create a compressed page table
from snd_dma_buffer for firmware use.

The latter is used by the PCM and the dma trace code and it needs to be
moved to a generic source/header for the client conversion to be possible.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/Makefile                   |  5 +-
 sound/soc/sof/{utils.c => iomem-utils.c} | 61 +------------------
 sound/soc/sof/pcm.c                      |  1 +
 sound/soc/sof/sof-priv.h                 |  4 --
 sound/soc/sof/sof-utils.c                | 77 ++++++++++++++++++++++++
 sound/soc/sof/sof-utils.h                | 19 ++++++
 sound/soc/sof/trace.c                    |  1 +
 7 files changed, 103 insertions(+), 65 deletions(-)
 rename sound/soc/sof/{utils.c => iomem-utils.c} (59%)
 create mode 100644 sound/soc/sof/sof-utils.c
 create mode 100644 sound/soc/sof/sof-utils.h

diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 964b429146be..4b9fccacc2b7 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 
 snd-sof-objs := core.o ops.o loader.o ipc.o pcm.o pm.o debug.o topology.o\
-		control.o trace.o utils.o sof-audio.o stream-ipc.o
+		control.o trace.o iomem-utils.o sof-audio.o stream-ipc.o
 
 snd-sof-$(CONFIG_SND_SOC_SOF_DEBUG_PROBES) += sof-probes.o
 snd-sof-$(CONFIG_SND_SOC_SOF_COMPRESS) += compress.o
@@ -12,9 +12,12 @@ snd-sof-of-objs := sof-of-dev.o
 
 snd-sof-nocodec-objs := nocodec.o
 
+snd-sof-utils-objs := sof-utils.o
+
 obj-$(CONFIG_SND_SOC_SOF) += snd-sof.o
 obj-$(CONFIG_SND_SOC_SOF_NOCODEC) += snd-sof-nocodec.o
 
+obj-$(CONFIG_SND_SOC_SOF) += snd-sof-utils.o
 
 obj-$(CONFIG_SND_SOC_SOF_ACPI_DEV) += snd-sof-acpi.o
 obj-$(CONFIG_SND_SOC_SOF_OF_DEV) += snd-sof-of.o
diff --git a/sound/soc/sof/utils.c b/sound/soc/sof/iomem-utils.c
similarity index 59%
rename from sound/soc/sof/utils.c
rename to sound/soc/sof/iomem-utils.c
index 66fa6602fb67..3f57f6cf6542 100644
--- a/sound/soc/sof/utils.c
+++ b/sound/soc/sof/iomem-utils.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018-2022 Intel Corporation. All rights reserved.
 //
 // Author: Keyon Jie <yang.jie@linux.intel.com>
 //
@@ -125,62 +125,3 @@ int sof_block_read(struct snd_sof_dev *sdev, enum snd_sof_fw_blk_type blk_type,
 	return 0;
 }
 EXPORT_SYMBOL(sof_block_read);
-
-/*
- * Generic buffer page table creation.
- * Take the each physical page address and drop the least significant unused
- * bits from each (based on PAGE_SIZE). Then pack valid page address bits
- * into compressed page table.
- */
-
-int snd_sof_create_page_table(struct device *dev,
-			      struct snd_dma_buffer *dmab,
-			      unsigned char *page_table, size_t size)
-{
-	int i, pages;
-
-	pages = snd_sgbuf_aligned_pages(size);
-
-	dev_dbg(dev, "generating page table for %p size 0x%zx pages %d\n",
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
-		dev_vdbg(dev, "pfn i %i idx %d pfn %x\n", i, idx, pfn);
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
-EXPORT_SYMBOL(snd_sof_create_page_table);
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 37fb8e6cd493..62cb61655761 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -19,6 +19,7 @@
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
 #include "sof-probes.h"
 #endif
+#include "sof-utils.h"
 
 /* Create DMA buffer page table for DSP */
 static int create_page_table(struct snd_soc_component *component,
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 2e474048d708..27d2f3ca2f06 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -502,10 +502,6 @@ void snd_sof_complete(struct device *dev);
 
 void snd_sof_new_platform_drv(struct snd_sof_dev *sdev);
 
-int snd_sof_create_page_table(struct device *dev,
-			      struct snd_dma_buffer *dmab,
-			      unsigned char *page_table, size_t size);
-
 /*
  * Firmware loading.
  */
diff --git a/sound/soc/sof/sof-utils.c b/sound/soc/sof/sof-utils.c
new file mode 100644
index 000000000000..a3300ecee062
--- /dev/null
+++ b/sound/soc/sof/sof-utils.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2018-2022 Intel Corporation. All rights reserved.
+//
+// Author: Keyon Jie <yang.jie@linux.intel.com>
+//
+
+#include <asm/unaligned.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/device.h>
+#include <sound/memalloc.h>
+#include <linux/module.h>
+#include "sof-utils.h"
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
+
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/sof-utils.h b/sound/soc/sof/sof-utils.h
new file mode 100644
index 000000000000..6f902893807e
--- /dev/null
+++ b/sound/soc/sof/sof-utils.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2022 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __SOC_SOF_UTILS_H
+#define __SOC_SOF_UTILS_H
+
+struct snd_dma_buffer;
+struct device;
+
+int snd_sof_create_page_table(struct device *dev,
+			      struct snd_dma_buffer *dmab,
+			      unsigned char *page_table, size_t size);
+
+#endif
diff --git a/sound/soc/sof/trace.c b/sound/soc/sof/trace.c
index 2335d0f06d42..104388c551cb 100644
--- a/sound/soc/sof/trace.c
+++ b/sound/soc/sof/trace.c
@@ -12,6 +12,7 @@
 #include <linux/sched/signal.h>
 #include "sof-priv.h"
 #include "ops.h"
+#include "sof-utils.h"
 
 #define TRACE_FILTER_ELEMENTS_PER_ENTRY 4
 #define TRACE_FILTER_MAX_CONFIG_STRING_LENGTH 1024
-- 
2.35.1

