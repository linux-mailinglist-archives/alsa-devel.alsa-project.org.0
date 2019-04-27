Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F38FAB444
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2019 20:18:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8956416D2;
	Sat, 27 Apr 2019 20:17:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8956416D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556389115;
	bh=371QwaiPoTbfyqyCA79I6qLxZOXCOcCOQQa5OD2cs5U=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Quet71JK4wWaFdb25ovceoIcwAirM7sM4/8uThNWBJUhdqUaIFqHZ1efDF+YUJjqA
	 YczecPRvVo7Uylqj+wHuR9yuPuPvNrBeRRQp1GCS9LZoeI3Ylf6a2NL74rzINaRa1o
	 l6m0GbOL1hZw63KaaJ1jTU2VC20xdb2NKweGfPx0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AF02F8985F;
	Sat, 27 Apr 2019 19:55:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 378BCF89774; Sat, 27 Apr 2019 19:54:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE2C2F89742;
 Sat, 27 Apr 2019 19:53:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE2C2F89742
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="jqCV4pYg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=b9fev1A/OzCjrCbC5fdGOkHIceL88R6TLQWiO3IBUQw=; b=jqCV4pYgOuZl
 nuzmkaEY674anZG4hA8x7UR7KpCM88a9JBJP9ooE90O6szYvJdaDP3pk5/OgYb/SPALbl2ZloTcgn
 IQXEvPuq7AOk5iFZzCp/bQIH/QERje7OWWRPt02qP1swnXFIhf+G3M7fCpkosvF4QpzAm3bKDczC0
 /+MbY=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hKRVf-0004rL-7W; Sat, 27 Apr 2019 17:53:11 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 32C2E441D3E; Sat, 27 Apr 2019 18:53:03 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
In-Reply-To: <20190412160519.30207-4-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190427175303.32C2E441D3E@finisterre.ee.mobilebroadband>
Date: Sat, 27 Apr 2019 18:53:03 +0100 (BST)
Cc: Dragos Tarcatu <dragos_tarcatu@mentor.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, sound-open-firmware@alsa-project.org,
 tiwai@suse.de, Pan Xiuli <xiuli.pan@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 andriy.shevchenko@linux.intel.com, Alan Cox <alan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Add driver debug support." to the
	asoc tree
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

   ASoC: SOF: Add driver debug support.

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

From 86b02f71ccf320727473448733503e6f9378102d Mon Sep 17 00:00:00 2001
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Date: Fri, 12 Apr 2019 11:05:08 -0500
Subject: [PATCH] ASoC: SOF: Add driver debug support.

Add debugFS files that can be used to expose DSP memories and
and peripherals to userspace to assist with firmware debugging.

Since we cannot rely on debugFS, errors are logged but don't stop
execution.

When a resource cannot be read in D3, it is optionally cached on
suspend. Copying memories from IO will increase the suspend latency,
this should only used in engineering builds w/ debug options. This
part will have to be enhanced when support for D0ix states is
provided, currently only D0 and D3 are supported.

Signed-off-by: Pan Xiuli <xiuli.pan@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/debug.c | 232 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 232 insertions(+)
 create mode 100644 sound/soc/sof/debug.c

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
new file mode 100644
index 000000000000..55f1d808dba0
--- /dev/null
+++ b/sound/soc/sof/debug.c
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2018 Intel Corporation. All rights reserved.
+//
+// Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
+//
+// Generic debug routines used to export DSP MMIO and memories to userspace
+// for firmware debugging.
+//
+
+#include <linux/debugfs.h>
+#include <linux/io.h>
+#include <linux/pm_runtime.h>
+#include "sof-priv.h"
+#include "ops.h"
+
+static ssize_t sof_dfsentry_read(struct file *file, char __user *buffer,
+				 size_t count, loff_t *ppos)
+{
+	struct snd_sof_dfsentry *dfse = file->private_data;
+	struct snd_sof_dev *sdev = dfse->sdev;
+	loff_t pos = *ppos;
+	size_t size_ret;
+	int skip = 0;
+	int size;
+	u8 *buf;
+
+	size = dfse->size;
+
+	/* validate position & count */
+	if (pos < 0)
+		return -EINVAL;
+	if (pos >= size || !count)
+		return 0;
+	/* find the minimum. min() is not used since it adds sparse warnings */
+	if (count > size - pos)
+		count = size - pos;
+
+	/* align io read start to u32 multiple */
+	pos = ALIGN_DOWN(pos, 4);
+
+	/* intermediate buffer size must be u32 multiple */
+	size = ALIGN(count, 4);
+
+	/* if start position is unaligned, read extra u32 */
+	if (unlikely(pos != *ppos)) {
+		skip = *ppos - pos;
+		if (pos + size + 4 < dfse->size)
+			size += 4;
+	}
+
+	buf = kzalloc(size, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	if (dfse->type == SOF_DFSENTRY_TYPE_IOMEM) {
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE)
+		/*
+		 * If the DSP is active: copy from IO.
+		 * If the DSP is suspended:
+		 *	- Copy from IO if the memory is always accessible.
+		 *	- Otherwise, copy from cached buffer.
+		 */
+		if (pm_runtime_active(sdev->dev) ||
+		    dfse->access_type == SOF_DEBUGFS_ACCESS_ALWAYS) {
+			memcpy_fromio(buf, dfse->io_mem + pos, size);
+		} else {
+			dev_info(sdev->dev,
+				 "Copying cached debugfs data\n");
+			memcpy(buf, dfse->cache_buf + pos, size);
+		}
+#else
+		/* if the DSP is in D3 */
+		if (!pm_runtime_active(sdev->dev) &&
+		    dfse->access_type == SOF_DEBUGFS_ACCESS_D0_ONLY) {
+			dev_err(sdev->dev,
+				"error: debugfs entry %s cannot be read in DSP D3\n",
+				dfse->dfsentry->d_name.name);
+			kfree(buf);
+			return -EINVAL;
+		}
+
+		memcpy_fromio(buf, dfse->io_mem + pos, size);
+#endif
+	} else {
+		memcpy(buf, ((u8 *)(dfse->buf) + pos), size);
+	}
+
+	/* copy to userspace */
+	size_ret = copy_to_user(buffer, buf + skip, count);
+
+	kfree(buf);
+
+	/* update count & position if copy succeeded */
+	if (size_ret)
+		return -EFAULT;
+
+	*ppos = pos + count;
+
+	return count;
+}
+
+static const struct file_operations sof_dfs_fops = {
+	.open = simple_open,
+	.read = sof_dfsentry_read,
+	.llseek = default_llseek,
+};
+
+/* create FS entry for debug files that can expose DSP memories, registers */
+int snd_sof_debugfs_io_item(struct snd_sof_dev *sdev,
+			    void __iomem *base, size_t size,
+			    const char *name,
+			    enum sof_debugfs_access_type access_type)
+{
+	struct snd_sof_dfsentry *dfse;
+
+	if (!sdev)
+		return -EINVAL;
+
+	dfse = devm_kzalloc(sdev->dev, sizeof(*dfse), GFP_KERNEL);
+	if (!dfse)
+		return -ENOMEM;
+
+	dfse->type = SOF_DFSENTRY_TYPE_IOMEM;
+	dfse->io_mem = base;
+	dfse->size = size;
+	dfse->sdev = sdev;
+	dfse->access_type = access_type;
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE)
+	/*
+	 * allocate cache buffer that will be used to save the mem window
+	 * contents prior to suspend
+	 */
+	if (access_type == SOF_DEBUGFS_ACCESS_D0_ONLY) {
+		dfse->cache_buf = devm_kzalloc(sdev->dev, size, GFP_KERNEL);
+		if (!dfse->cache_buf)
+			return -ENOMEM;
+	}
+#endif
+
+	dfse->dfsentry = debugfs_create_file(name, 0444, sdev->debugfs_root,
+					     dfse, &sof_dfs_fops);
+	if (!dfse->dfsentry) {
+		/* can't rely on debugfs, only log error and keep going */
+		dev_err(sdev->dev, "error: cannot create debugfs entry %s\n",
+			name);
+	} else {
+		/* add to dfsentry list */
+		list_add(&dfse->list, &sdev->dfsentry_list);
+
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_sof_debugfs_io_item);
+
+/* create FS entry for debug files to expose kernel memory */
+int snd_sof_debugfs_buf_item(struct snd_sof_dev *sdev,
+			     void *base, size_t size,
+			     const char *name)
+{
+	struct snd_sof_dfsentry *dfse;
+
+	if (!sdev)
+		return -EINVAL;
+
+	dfse = devm_kzalloc(sdev->dev, sizeof(*dfse), GFP_KERNEL);
+	if (!dfse)
+		return -ENOMEM;
+
+	dfse->type = SOF_DFSENTRY_TYPE_BUF;
+	dfse->buf = base;
+	dfse->size = size;
+	dfse->sdev = sdev;
+
+	dfse->dfsentry = debugfs_create_file(name, 0444, sdev->debugfs_root,
+					     dfse, &sof_dfs_fops);
+	if (!dfse->dfsentry) {
+		/* can't rely on debugfs, only log error and keep going */
+		dev_err(sdev->dev, "error: cannot create debugfs entry %s\n",
+			name);
+	} else {
+		/* add to dfsentry list */
+		list_add(&dfse->list, &sdev->dfsentry_list);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_sof_debugfs_buf_item);
+
+int snd_sof_dbg_init(struct snd_sof_dev *sdev)
+{
+	const struct snd_sof_dsp_ops *ops = sof_ops(sdev);
+	const struct snd_sof_debugfs_map *map;
+	int i;
+	int err;
+
+	/* use "sof" as top level debugFS dir */
+	sdev->debugfs_root = debugfs_create_dir("sof", NULL);
+	if (IS_ERR_OR_NULL(sdev->debugfs_root)) {
+		dev_err(sdev->dev, "error: failed to create debugfs directory\n");
+		return 0;
+	}
+
+	/* init dfsentry list */
+	INIT_LIST_HEAD(&sdev->dfsentry_list);
+
+	/* create debugFS files for platform specific MMIO/DSP memories */
+	for (i = 0; i < ops->debug_map_count; i++) {
+		map = &ops->debug_map[i];
+
+		err = snd_sof_debugfs_io_item(sdev, sdev->bar[map->bar] +
+					      map->offset, map->size,
+					      map->name, map->access_type);
+		/* errors are only due to memory allocation, not debugfs */
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_sof_dbg_init);
+
+void snd_sof_free_debug(struct snd_sof_dev *sdev)
+{
+	debugfs_remove_recursive(sdev->debugfs_root);
+}
+EXPORT_SYMBOL_GPL(snd_sof_free_debug);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
