Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72283B433
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2019 20:07:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A50615D9;
	Sat, 27 Apr 2019 20:06:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A50615D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556388430;
	bh=6TXFsYorKm8pTy9Q/2phClJyI+j4TyWJSVDTq5Pnnic=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=oSJzjadMAvarFqmL8KFs4xIxo9GNobTCM36wrHYvcJgEZWQsFjMvHrGL09CmhbwRw
	 8GEBWuIr3DaWZ7P5IxlEZDEtpHOErq5ijpdU8U+We6E1PTEtWjdf7GpR3bRybuxLKE
	 4rXslwyeCZalhJiJ/3PTPcP/i1fE9r+sd7m+bUjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8393FF897AE;
	Sat, 27 Apr 2019 19:54:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4003BF8975B; Sat, 27 Apr 2019 19:53:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D1D4F8972E;
 Sat, 27 Apr 2019 19:53:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D1D4F8972E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="lfvmimWs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=8UJpgC1gBByOhlU0J0qD1vxYivQjSN2rVX+IF0iVvEE=; b=lfvmimWs/OoV
 9gUq9RzHyb9ixnY1yvolBAK4A64zQOC4dJIvKd5PioCMsLsGu8UYY93rGsZFFm19IibY3gndjxBW/
 nwG67mGr+NIMy/8zE8RXGD6jeTL4EHl7T8VlLiHj/FE6rrnsPa4nuCoMx/GK8tk7ZcNJR1jx1+eph
 DUIs0=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hKRVU-0004qI-3G; Sat, 27 Apr 2019 17:53:00 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 518F0441D3B; Sat, 27 Apr 2019 18:52:56 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20190412160519.30207-15-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190427175256.518F0441D3B@finisterre.ee.mobilebroadband>
Date: Sat, 27 Apr 2019 18:52:56 +0100 (BST)
Cc: Dragos Tarcatu <dragos_tarcatu@mentor.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, sound-open-firmware@alsa-project.org,
 tiwai@suse.de, Keyon Jie <yang.jie@linux.intel.com>,
 alsa-devel@alsa-project.org, liam.r.girdwood@linux.intel.com, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, andriy.shevchenko@linux.intel.com,
 Alan Cox <alan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Add utils" to the asoc tree
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

   ASoC: SOF: Add utils

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

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

From 3bafac46065eb7ea6f3e3fcbdb8b70b66f6c71b4 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Fri, 12 Apr 2019 11:05:19 -0500
Subject: [PATCH] ASoC: SOF: Add utils

Helpers to set-up back-ends, create platform devices and common
IO/block read/write operations

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/utils.c | 112 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 sound/soc/sof/utils.c

diff --git a/sound/soc/sof/utils.c b/sound/soc/sof/utils.c
new file mode 100644
index 000000000000..2ac4c3da0320
--- /dev/null
+++ b/sound/soc/sof/utils.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2018 Intel Corporation. All rights reserved.
+//
+// Author: Keyon Jie <yang.jie@linux.intel.com>
+//
+
+#include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/platform_device.h>
+#include <sound/soc.h>
+#include <sound/sof.h>
+#include "sof-priv.h"
+
+/*
+ * Register IO
+ *
+ * The sof_io_xyz() wrappers are typically referenced in snd_sof_dsp_ops
+ * structures and cannot be inlined.
+ */
+
+void sof_io_write(struct snd_sof_dev *sdev, void __iomem *addr, u32 value)
+{
+	writel(value, addr);
+}
+EXPORT_SYMBOL(sof_io_write);
+
+u32 sof_io_read(struct snd_sof_dev *sdev, void __iomem *addr)
+{
+	return readl(addr);
+}
+EXPORT_SYMBOL(sof_io_read);
+
+void sof_io_write64(struct snd_sof_dev *sdev, void __iomem *addr, u64 value)
+{
+	writeq(value, addr);
+}
+EXPORT_SYMBOL(sof_io_write64);
+
+u64 sof_io_read64(struct snd_sof_dev *sdev, void __iomem *addr)
+{
+	return readq(addr);
+}
+EXPORT_SYMBOL(sof_io_read64);
+
+/*
+ * IPC Mailbox IO
+ */
+
+void sof_mailbox_write(struct snd_sof_dev *sdev, u32 offset,
+		       void *message, size_t bytes)
+{
+	void __iomem *dest = sdev->bar[sdev->mailbox_bar] + offset;
+
+	memcpy_toio(dest, message, bytes);
+}
+EXPORT_SYMBOL(sof_mailbox_write);
+
+void sof_mailbox_read(struct snd_sof_dev *sdev, u32 offset,
+		      void *message, size_t bytes)
+{
+	void __iomem *src = sdev->bar[sdev->mailbox_bar] + offset;
+
+	memcpy_fromio(message, src, bytes);
+}
+EXPORT_SYMBOL(sof_mailbox_read);
+
+/*
+ * Memory copy.
+ */
+
+void sof_block_write(struct snd_sof_dev *sdev, u32 bar, u32 offset, void *src,
+		     size_t size)
+{
+	void __iomem *dest = sdev->bar[bar] + offset;
+	const u8 *src_byte = src;
+	u32 affected_mask;
+	u32 tmp;
+	int m, n;
+
+	m = size / 4;
+	n = size % 4;
+
+	/* __iowrite32_copy use 32bit size values so divide by 4 */
+	__iowrite32_copy(dest, src, m);
+
+	if (n) {
+		affected_mask = (1 << (8 * n)) - 1;
+
+		/* first read the 32bit data of dest, then change affected
+		 * bytes, and write back to dest. For unaffected bytes, it
+		 * should not be changed
+		 */
+		tmp = ioread32(dest + m * 4);
+		tmp &= ~affected_mask;
+
+		tmp |= *(u32 *)(src_byte + m * 4) & affected_mask;
+		iowrite32(tmp, dest + m * 4);
+	}
+}
+EXPORT_SYMBOL(sof_block_write);
+
+void sof_block_read(struct snd_sof_dev *sdev, u32 bar, u32 offset, void *dest,
+		    size_t size)
+{
+	void __iomem *src = sdev->bar[bar] + offset;
+
+	memcpy_fromio(dest, src, size);
+}
+EXPORT_SYMBOL(sof_block_read);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
