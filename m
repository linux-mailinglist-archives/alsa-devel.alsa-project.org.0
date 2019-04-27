Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 313B3B440
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2019 20:16:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE19516CB;
	Sat, 27 Apr 2019 20:15:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE19516CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556388985;
	bh=5eDdJ9rhSZ2J/JZ+kRbsQLW2x+kt84pbY51czFYBHv4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=XnrXaLP4LcIVrdL49tP3XAofBhchnHUrw7Fa9NGSo5lcD6Zb9gPq5y0DGZ21Y4qO1
	 SQUN2QlXR+q8+WkMM4jm0n/8+CziX/qzzpOIKE//xgYreCJtHcMbDKL8fO3rOW1W82
	 d3/LXo/51+iI+QI+j6JMIvHHP3Yk5PSeeIlwevHI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 856DEF89846;
	Sat, 27 Apr 2019 19:55:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0D97F89762; Sat, 27 Apr 2019 19:54:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9D37F8973C;
 Sat, 27 Apr 2019 19:53:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9D37F8973C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="og1dyRTW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=3dphZDOYKWs6Rmfo4rzINQZnxHgKIg9t5a+vXm7+zFs=; b=og1dyRTWrBGD
 pPjPcohRrDoLEJ+1eBQs2hCyuY3WxYYU0JLsAAbIApTxsce4EAZ0KC+qHgdREbJq08Obj06VRdkl1
 Efvv22YWB0VspMUo+6v8Ad6zygBw7Yn9pFok9c7dzs1tnlt7Zp6yEKWUGv/6tYlREfYCIlzcpGxbp
 Ng+P8=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hKRVb-0004qi-BN; Sat, 27 Apr 2019 17:53:07 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 3FDC3441D3F; Sat, 27 Apr 2019 18:52:59 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
In-Reply-To: <20190412160519.30207-10-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190427175259.3FDC3441D3F@finisterre.ee.mobilebroadband>
Date: Sat, 27 Apr 2019 18:52:59 +0100 (BST)
Cc: Dragos Tarcatu <dragos_tarcatu@mentor.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, sound-open-firmware@alsa-project.org,
 tiwai@suse.de, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, andriy.shevchenko@linux.intel.com,
 Alan Cox <alan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Add firmware loader support" to
	the asoc tree
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

   ASoC: SOF: Add firmware loader support

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

From 70cd52544b95d02f8b20fadccb7400ce68a2cb84 Mon Sep 17 00:00:00 2001
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Date: Fri, 12 Apr 2019 11:05:14 -0500
Subject: [PATCH] ASoC: SOF: Add firmware loader support

The firmware loader exports APIs that can be called by core to load and
process multiple different file formats.

Signed-off-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/loader.c | 400 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 400 insertions(+)
 create mode 100644 sound/soc/sof/loader.c

diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
new file mode 100644
index 000000000000..81c7452aae17
--- /dev/null
+++ b/sound/soc/sof/loader.c
@@ -0,0 +1,400 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2018 Intel Corporation. All rights reserved.
+//
+// Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
+//
+// Generic firmware loader.
+//
+
+#include <linux/firmware.h>
+#include <sound/sof.h>
+#include "ops.h"
+
+static int get_ext_windows(struct snd_sof_dev *sdev,
+			   struct sof_ipc_ext_data_hdr *ext_hdr)
+{
+	struct sof_ipc_window *w =
+		container_of(ext_hdr, struct sof_ipc_window, ext_hdr);
+	size_t size;
+
+	if (w->num_windows == 0 || w->num_windows > SOF_IPC_MAX_ELEMS)
+		return -EINVAL;
+
+	size = sizeof(*w) + sizeof(struct sof_ipc_window_elem) * w->num_windows;
+
+	/* keep a local copy of the data */
+	sdev->info_window = kmemdup(w, size, GFP_KERNEL);
+	if (!sdev->info_window)
+		return -ENOMEM;
+
+	return 0;
+}
+
+/* parse the extended FW boot data structures from FW boot message */
+int snd_sof_fw_parse_ext_data(struct snd_sof_dev *sdev, u32 bar, u32 offset)
+{
+	struct sof_ipc_ext_data_hdr *ext_hdr;
+	void *ext_data;
+	int ret = 0;
+
+	ext_data = kzalloc(PAGE_SIZE, GFP_KERNEL);
+	if (!ext_data)
+		return -ENOMEM;
+
+	/* get first header */
+	snd_sof_dsp_block_read(sdev, bar, offset, ext_data,
+			       sizeof(*ext_hdr));
+	ext_hdr = ext_data;
+
+	while (ext_hdr->hdr.cmd == SOF_IPC_FW_READY) {
+		/* read in ext structure */
+		offset += sizeof(*ext_hdr);
+		snd_sof_dsp_block_read(sdev, bar, offset,
+				   (void *)((u8 *)ext_data + sizeof(*ext_hdr)),
+				   ext_hdr->hdr.size - sizeof(*ext_hdr));
+
+		dev_dbg(sdev->dev, "found ext header type %d size 0x%x\n",
+			ext_hdr->type, ext_hdr->hdr.size);
+
+		/* process structure data */
+		switch (ext_hdr->type) {
+		case SOF_IPC_EXT_DMA_BUFFER:
+			break;
+		case SOF_IPC_EXT_WINDOW:
+			ret = get_ext_windows(sdev, ext_hdr);
+			break;
+		default:
+			break;
+		}
+
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: failed to parse ext data type %d\n",
+				ext_hdr->type);
+			break;
+		}
+
+		/* move to next header */
+		offset += ext_hdr->hdr.size;
+		snd_sof_dsp_block_read(sdev, bar, offset, ext_data,
+				       sizeof(*ext_hdr));
+		ext_hdr = ext_data;
+	}
+
+	kfree(ext_data);
+	return ret;
+}
+EXPORT_SYMBOL(snd_sof_fw_parse_ext_data);
+
+/* generic module parser for mmaped DSPs */
+int snd_sof_parse_module_memcpy(struct snd_sof_dev *sdev,
+				struct snd_sof_mod_hdr *module)
+{
+	struct snd_sof_blk_hdr *block;
+	int count;
+	u32 offset;
+	size_t remaining;
+
+	dev_dbg(sdev->dev, "new module size 0x%x blocks 0x%x type 0x%x\n",
+		module->size, module->num_blocks, module->type);
+
+	block = (struct snd_sof_blk_hdr *)((u8 *)module + sizeof(*module));
+
+	/* module->size doesn't include header size */
+	remaining = module->size;
+	for (count = 0; count < module->num_blocks; count++) {
+		/* check for wrap */
+		if (remaining < sizeof(*block)) {
+			dev_err(sdev->dev, "error: not enough data remaining\n");
+			return -EINVAL;
+		}
+
+		/* minus header size of block */
+		remaining -= sizeof(*block);
+
+		if (block->size == 0) {
+			dev_warn(sdev->dev,
+				 "warning: block %d size zero\n", count);
+			dev_warn(sdev->dev, " type 0x%x offset 0x%x\n",
+				 block->type, block->offset);
+			continue;
+		}
+
+		switch (block->type) {
+		case SOF_FW_BLK_TYPE_RSRVD0:
+		case SOF_FW_BLK_TYPE_SRAM...SOF_FW_BLK_TYPE_RSRVD14:
+			continue;	/* not handled atm */
+		case SOF_FW_BLK_TYPE_IRAM:
+		case SOF_FW_BLK_TYPE_DRAM:
+			offset = block->offset;
+			break;
+		default:
+			dev_err(sdev->dev, "error: bad type 0x%x for block 0x%x\n",
+				block->type, count);
+			return -EINVAL;
+		}
+
+		dev_dbg(sdev->dev,
+			"block %d type 0x%x size 0x%x ==>  offset 0x%x\n",
+			count, block->type, block->size, offset);
+
+		/* checking block->size to avoid unaligned access */
+		if (block->size % sizeof(u32)) {
+			dev_err(sdev->dev, "error: invalid block size 0x%x\n",
+				block->size);
+			return -EINVAL;
+		}
+		snd_sof_dsp_block_write(sdev, sdev->mmio_bar, offset,
+					block + 1, block->size);
+
+		if (remaining < block->size) {
+			dev_err(sdev->dev, "error: not enough data remaining\n");
+			return -EINVAL;
+		}
+
+		/* minus body size of block */
+		remaining -= block->size;
+		/* next block */
+		block = (struct snd_sof_blk_hdr *)((u8 *)block + sizeof(*block)
+			+ block->size);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(snd_sof_parse_module_memcpy);
+
+static int check_header(struct snd_sof_dev *sdev, const struct firmware *fw)
+{
+	struct snd_sof_fw_header *header;
+
+	/* Read the header information from the data pointer */
+	header = (struct snd_sof_fw_header *)fw->data;
+
+	/* verify FW sig */
+	if (strncmp(header->sig, SND_SOF_FW_SIG, SND_SOF_FW_SIG_SIZE) != 0) {
+		dev_err(sdev->dev, "error: invalid firmware signature\n");
+		return -EINVAL;
+	}
+
+	/* check size is valid */
+	if (fw->size != header->file_size + sizeof(*header)) {
+		dev_err(sdev->dev, "error: invalid filesize mismatch got 0x%zx expected 0x%zx\n",
+			fw->size, header->file_size + sizeof(*header));
+		return -EINVAL;
+	}
+
+	dev_dbg(sdev->dev, "header size=0x%x modules=0x%x abi=0x%x size=%zu\n",
+		header->file_size, header->num_modules,
+		header->abi, sizeof(*header));
+
+	return 0;
+}
+
+static int load_modules(struct snd_sof_dev *sdev, const struct firmware *fw)
+{
+	struct snd_sof_fw_header *header;
+	struct snd_sof_mod_hdr *module;
+	int (*load_module)(struct snd_sof_dev *sof_dev,
+			   struct snd_sof_mod_hdr *hdr);
+	int ret, count;
+	size_t remaining;
+
+	header = (struct snd_sof_fw_header *)fw->data;
+	load_module = sof_ops(sdev)->load_module;
+	if (!load_module)
+		return -EINVAL;
+
+	/* parse each module */
+	module = (struct snd_sof_mod_hdr *)((u8 *)(fw->data) + sizeof(*header));
+	remaining = fw->size - sizeof(*header);
+	/* check for wrap */
+	if (remaining > fw->size) {
+		dev_err(sdev->dev, "error: fw size smaller than header size\n");
+		return -EINVAL;
+	}
+
+	for (count = 0; count < header->num_modules; count++) {
+		/* check for wrap */
+		if (remaining < sizeof(*module)) {
+			dev_err(sdev->dev, "error: not enough data remaining\n");
+			return -EINVAL;
+		}
+
+		/* minus header size of module */
+		remaining -= sizeof(*module);
+
+		/* module */
+		ret = load_module(sdev, module);
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: invalid module %d\n", count);
+			return ret;
+		}
+
+		if (remaining < module->size) {
+			dev_err(sdev->dev, "error: not enough data remaining\n");
+			return -EINVAL;
+		}
+
+		/* minus body size of module */
+		remaining -=  module->size;
+		module = (struct snd_sof_mod_hdr *)((u8 *)module
+			+ sizeof(*module) + module->size);
+	}
+
+	return 0;
+}
+
+int snd_sof_load_firmware_raw(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_pdata *plat_data = sdev->pdata;
+	const char *fw_filename;
+	int ret;
+
+	/* set code loading condition to true */
+	sdev->code_loading = 1;
+
+	/* Don't request firmware again if firmware is already requested */
+	if (plat_data->fw)
+		return 0;
+
+	fw_filename = kasprintf(GFP_KERNEL, "%s/%s",
+				plat_data->fw_filename_prefix,
+				plat_data->fw_filename);
+	if (!fw_filename)
+		return -ENOMEM;
+
+	ret = request_firmware(&plat_data->fw, fw_filename, sdev->dev);
+
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: request firmware %s failed err: %d\n",
+			fw_filename, ret);
+	}
+
+	kfree(fw_filename);
+
+	return ret;
+}
+EXPORT_SYMBOL(snd_sof_load_firmware_raw);
+
+int snd_sof_load_firmware_memcpy(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_pdata *plat_data = sdev->pdata;
+	int ret;
+
+	ret = snd_sof_load_firmware_raw(sdev);
+	if (ret < 0)
+		return ret;
+
+	/* make sure the FW header and file is valid */
+	ret = check_header(sdev, plat_data->fw);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: invalid FW header\n");
+		goto error;
+	}
+
+	/* prepare the DSP for FW loading */
+	ret = snd_sof_dsp_reset(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed to reset DSP\n");
+		goto error;
+	}
+
+	/* parse and load firmware modules to DSP */
+	ret = load_modules(sdev, plat_data->fw);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: invalid FW modules\n");
+		goto error;
+	}
+
+	return 0;
+
+error:
+	release_firmware(plat_data->fw);
+	plat_data->fw = NULL;
+	return ret;
+
+}
+EXPORT_SYMBOL(snd_sof_load_firmware_memcpy);
+
+int snd_sof_load_firmware(struct snd_sof_dev *sdev)
+{
+	dev_dbg(sdev->dev, "loading firmware\n");
+
+	if (sof_ops(sdev)->load_firmware)
+		return sof_ops(sdev)->load_firmware(sdev);
+	return 0;
+}
+EXPORT_SYMBOL(snd_sof_load_firmware);
+
+int snd_sof_run_firmware(struct snd_sof_dev *sdev)
+{
+	int ret;
+	int init_core_mask;
+
+	init_waitqueue_head(&sdev->boot_wait);
+	sdev->boot_complete = false;
+
+	/* create fw_version debugfs to store boot version info */
+	if (sdev->first_boot) {
+		ret = snd_sof_debugfs_buf_item(sdev, &sdev->fw_version,
+					       sizeof(sdev->fw_version),
+					       "fw_version");
+		/* errors are only due to memory allocation, not debugfs */
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: snd_sof_debugfs_buf_item failed\n");
+			return ret;
+		}
+	}
+
+	/* perform pre fw run operations */
+	ret = snd_sof_dsp_pre_fw_run(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed pre fw run op\n");
+		return ret;
+	}
+
+	dev_dbg(sdev->dev, "booting DSP firmware\n");
+
+	/* boot the firmware on the DSP */
+	ret = snd_sof_dsp_run(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed to reset DSP\n");
+		return ret;
+	}
+
+	init_core_mask = ret;
+
+	/* now wait for the DSP to boot */
+	ret = wait_event_timeout(sdev->boot_wait, sdev->boot_complete,
+				 msecs_to_jiffies(sdev->boot_timeout));
+	if (ret == 0) {
+		dev_err(sdev->dev, "error: firmware boot failure\n");
+		snd_sof_dsp_dbg_dump(sdev, SOF_DBG_REGS | SOF_DBG_MBOX |
+			SOF_DBG_TEXT | SOF_DBG_PCI);
+		return -EIO;
+	}
+
+	dev_info(sdev->dev, "firmware boot complete\n");
+
+	/* perform post fw run operations */
+	ret = snd_sof_dsp_post_fw_run(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed post fw run op\n");
+		return ret;
+	}
+
+	/* fw boot is complete. Update the active cores mask */
+	sdev->enabled_cores_mask = init_core_mask;
+
+	return 0;
+}
+EXPORT_SYMBOL(snd_sof_run_firmware);
+
+void snd_sof_fw_unload(struct snd_sof_dev *sdev)
+{
+	/* TODO: support module unloading at runtime */
+}
+EXPORT_SYMBOL(snd_sof_fw_unload);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
