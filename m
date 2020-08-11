Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FAE241960
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 12:05:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A60551666;
	Tue, 11 Aug 2020 12:04:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A60551666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597140312;
	bh=eilDDQCow8U8OnH3s5pTbsyWkeC0gOiaVFEgGR5g/Yk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bFR7ljhN2Q7nf7rlLPBKYAK9IGaiVxFyEVhDT58LFmRd2qQfWua4SHjMp5DKjS4pE
	 0ZGuJdhaRiMGMhZbudwtgDZBBEmGfJsChmFJOwlFzM3d3L5pHKgHTdR4RcQmqiXCkS
	 Bs2Kix254kb+1tmk3v7LOrPiP8bpFQfuetXQJ0EY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A21F8F8027B;
	Tue, 11 Aug 2020 12:01:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47518F802EC; Tue, 11 Aug 2020 12:01:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB292F8014C
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 12:01:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB292F8014C
IronPort-SDR: +auKQfgYYfsMa9JGCu4DSlHzU1LVnMD8Kjw8nMnLjtKiRYAzXjFZ2ifcgDoiQybAnwHCzZjb4N
 3WPrrqiuYSPQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9709"; a="152924788"
X-IronPort-AV: E=Sophos;i="5.75,460,1589266800"; d="scan'208";a="152924788"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2020 03:01:01 -0700
IronPort-SDR: Hf34WGaYmo3WGKB/svO5ARc0tHN8uzk6xRUI81CEbTDLRf+ka0wrYtK67v1PwdLGVIh1AAVAWr
 EXLfEG6op3Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,460,1589266800"; d="scan'208";a="494625249"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 11 Aug 2020 03:00:56 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 03/13] ASoC: Intel: catpt: Firmware loading and context
 restore
Date: Tue, 11 Aug 2020 12:00:24 +0200
Message-Id: <20200811100034.6875-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200811100034.6875-1-cezary.rojewski@intel.com>
References: <20200811100034.6875-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com,
 cujomalainey@chromium.org, krzysztof.hejmowski@intel.com,
 ppapierkowski@habana.ai, vamshi.krishna.gopal@intel.com
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

For Lynxpoint and Wildcat Point solution, is it host's responsibility to
allocate SRAM regions and ensure those already taken are not overwritten
with other data until released. Blocks are transferred to SRAM - either
IRAM or DRAM - via DW DMA controller. Once basefw is booted, ownership
of DMA transfer is lost in favour of DSP.

Hosts reponsibilities don't end on initial block allocation and binary
transfer. During Dx transitions host must store FW runtime context from
DRAM before putting AudioDSP subsystem into lower power state. Said
context gets flashed after D0 entry to bring DSP right where it was just
before suspending.

Load and restore procedures are finalized with SRAM power gating and
adequate clock level selection. This power gates unused EBBs and clock
speed effectively reducing power consumption.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/loader.c | 676 +++++++++++++++++++++++++++++++++
 1 file changed, 676 insertions(+)
 create mode 100644 sound/soc/intel/catpt/loader.c

diff --git a/sound/soc/intel/catpt/loader.c b/sound/soc/intel/catpt/loader.c
new file mode 100644
index 000000000000..79609dfee1c5
--- /dev/null
+++ b/sound/soc/intel/catpt/loader.c
@@ -0,0 +1,676 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2020 Intel Corporation. All rights reserved.
+//
+// Author: Cezary Rojewski <cezary.rojewski@intel.com>
+//
+
+#include <linux/dma-mapping.h>
+#include <linux/firmware.h>
+#include "core.h"
+#include "registers.h"
+#include "trace.h"
+
+/* FW load (200ms) plus operational delays */
+#define FW_READY_TIMEOUT_MSECS	250
+
+#define FW_SIGNATURE	"$SST"
+#define FW_SIGNATURE_SIZE 4
+
+/* some nice binary layout picture here */
+
+struct catpt_fw_hdr {
+	char signature[FW_SIGNATURE_SIZE];
+	u32 file_size;
+	u32 modules;
+	u32 file_format;
+	u32 reserved[4];
+} __packed;
+
+struct catpt_fw_mod_hdr {
+	char signature[FW_SIGNATURE_SIZE];
+	u32 mod_size;
+	u32 blocks;
+	u16 slot;
+	enum catpt_module_id id:16;
+	u32 entry_point;
+	u32 persistent_size;
+	u32 scratch_size;
+} __packed;
+
+enum catpt_ram_type {
+	CATPT_RAM_TYPE_IRAM = 1,
+	CATPT_RAM_TYPE_DRAM = 2,
+	/* DRAM with module's initial state */
+	CATPT_RAM_TYPE_INSTANCE = 3,
+};
+
+struct catpt_fw_block_hdr {
+	enum catpt_ram_type type __aligned(4);
+	u32 size;
+	u32 ram_offset;
+	u32 rsvd;
+} __packed;
+
+void catpt_sram_init(struct resource *sram, u32 start, u32 size)
+{
+	sram->start = start;
+	sram->end = start + size - 1;
+}
+
+void catpt_sram_free(struct resource *sram)
+{
+	struct resource *res, *save;
+
+	for (res = sram->child; res;) {
+		save = res->sibling;
+		release_resource(res);
+		kfree(res);
+		res = save;
+	}
+}
+
+struct resource *
+catpt_request_region(struct resource *root, resource_size_t size)
+{
+	struct resource *res = root->child;
+	resource_size_t addr = root->start;
+
+	for (;;) {
+		if (res->start - addr >= size)
+			break;
+		addr = res->end + 1;
+		res = res->sibling;
+		if (!res)
+			return NULL;
+	}
+
+	return __request_region(root, addr, size, NULL, 0);
+}
+
+int catpt_store_streams_context(struct catpt_dev *cdev, struct dma_chan *chan)
+{
+	struct catpt_stream_runtime *stream;
+
+	list_for_each_entry(stream, &cdev->stream_list, node) {
+		u32 off, size;
+		int ret;
+
+		off = stream->persistent->start;
+		size = resource_size(stream->persistent);
+		dev_dbg(cdev->dev, "storing stream %d ctx: off 0x%08x size %d\n",
+			stream->info.stream_hw_id, off, size);
+
+		ret = catpt_dma_memcpy_fromdsp(cdev, chan,
+					       cdev->dxbuf_paddr + off,
+					       cdev->lpe_base + off,
+					       ALIGN(size, 4));
+		if (ret < 0) {
+			dev_err(cdev->dev, "memcpy fromdsp failed: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+int catpt_store_module_states(struct catpt_dev *cdev, struct dma_chan *chan)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(cdev->modules); i++) {
+		struct catpt_module_type *type;
+		u32 off;
+		int ret;
+
+		type = &cdev->modules[i];
+		if (!type->loaded || !type->state_size)
+			continue;
+
+		off = type->state_offset;
+		dev_dbg(cdev->dev, "storing mod %d state: off 0x%08x size %d\n",
+			i, off, type->state_size);
+
+		ret = catpt_dma_memcpy_fromdsp(cdev, chan,
+					       cdev->dxbuf_paddr + off,
+					       cdev->lpe_base + off,
+					       ALIGN(type->state_size, 4));
+		if (ret < 0) {
+			dev_err(cdev->dev, "memcpy fromdsp failed: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+int catpt_store_memdumps(struct catpt_dev *cdev, struct dma_chan *chan)
+{
+	int i;
+
+	for (i = 0; i < cdev->dx_ctx.num_meminfo; i++) {
+		struct catpt_save_meminfo *info;
+		u32 off;
+		int ret;
+
+		info = &cdev->dx_ctx.meminfo[i];
+		if (info->source != CATPT_DX_TYPE_MEMORY_DUMP)
+			continue;
+
+		off = catpt_to_host_offset(info->offset);
+		if (off < cdev->dram.start || off > cdev->dram.end)
+			continue;
+
+		dev_dbg(cdev->dev, "storing memdump: off 0x%08x size %d\n",
+			off, info->size);
+
+		ret = catpt_dma_memcpy_fromdsp(cdev, chan,
+					       cdev->dxbuf_paddr + off,
+					       cdev->lpe_base + off,
+					       ALIGN(info->size, 4));
+		if (ret < 0) {
+			dev_err(cdev->dev, "memcpy fromdsp failed: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int
+catpt_restore_streams_context(struct catpt_dev *cdev, struct dma_chan *chan)
+{
+	struct catpt_stream_runtime *stream;
+
+	list_for_each_entry(stream, &cdev->stream_list, node) {
+		u32 off, size;
+		int ret;
+
+		off = stream->persistent->start;
+		size = resource_size(stream->persistent);
+		dev_dbg(cdev->dev, "restoring stream %d ctx: off 0x%08x size %d\n",
+			stream->info.stream_hw_id, off, size);
+
+		ret = catpt_dma_memcpy_todsp(cdev, chan,
+					     cdev->lpe_base + off,
+					     cdev->dxbuf_paddr + off,
+					     ALIGN(size, 4));
+		if (ret < 0) {
+			dev_err(cdev->dev, "memcpy fromdsp failed: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int catpt_restore_memdumps(struct catpt_dev *cdev, struct dma_chan *chan)
+{
+	int i;
+
+	for (i = 0; i < cdev->dx_ctx.num_meminfo; i++) {
+		struct catpt_save_meminfo *info;
+		u32 off;
+		int ret;
+
+		info = &cdev->dx_ctx.meminfo[i];
+		if (info->source != CATPT_DX_TYPE_MEMORY_DUMP)
+			continue;
+
+		off = catpt_to_host_offset(info->offset);
+		if (off < cdev->dram.start || off > cdev->dram.end)
+			continue;
+
+		dev_dbg(cdev->dev, "restoring memdump: off 0x%08x size %d\n",
+			off, info->size);
+
+		ret = catpt_dma_memcpy_todsp(cdev, chan,
+					     cdev->lpe_base + off,
+					     cdev->dxbuf_paddr + off,
+					     ALIGN(info->size, 4));
+		if (ret < 0) {
+			dev_err(cdev->dev, "restore block failed: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int catpt_restore_fwimage(struct catpt_dev *cdev,
+				 struct dma_chan *chan, dma_addr_t paddr,
+				 struct catpt_fw_block_hdr *blk)
+{
+	struct resource r1, r2, common;
+	int i;
+
+	print_hex_dump_debug(__func__, DUMP_PREFIX_OFFSET, 8, 4,
+			     blk, sizeof(*blk), false);
+
+	r1.start = cdev->dram.start + blk->ram_offset;
+	r1.end = r1.start + blk->size - 1;
+	/* advance to data area */
+	paddr += sizeof(*blk);
+
+	for (i = 0; i < cdev->dx_ctx.num_meminfo; i++) {
+		struct catpt_save_meminfo *info;
+		u32 off;
+		int ret;
+
+		info = &cdev->dx_ctx.meminfo[i];
+
+		if (info->source != CATPT_DX_TYPE_FW_IMAGE)
+			continue;
+
+		off = catpt_to_host_offset(info->offset);
+		if (off < cdev->dram.start || off > cdev->dram.end)
+			continue;
+
+		r2.start = off;
+		r2.end = r2.start + info->size - 1;
+
+		if (!catpt_resource_overlapping(&r2, &r1, &common))
+			continue;
+		/* calculate start offset of common data area */
+		off = common.start - r1.start;
+
+		dev_dbg(cdev->dev, "found intersecting region: 0x%08llx-%08llx\n",
+			common.start, common.end);
+		dev_dbg(cdev->dev, "restoring fwimage: start 0x%08llx size %lld\n",
+			common.start, resource_size(&common));
+
+		ret = catpt_dma_memcpy_todsp(cdev, chan, common.start,
+					     paddr + off,
+					     resource_size(&common));
+		if (ret < 0) {
+			dev_err(cdev->dev, "memcpy todsp failed: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int catpt_load_block(struct catpt_dev *cdev,
+			    struct dma_chan *chan, dma_addr_t paddr,
+			    struct catpt_fw_block_hdr *blk, bool alloc)
+{
+	struct resource *sram, *res;
+	dma_addr_t dst_addr;
+	int ret;
+
+	print_hex_dump_debug(__func__, DUMP_PREFIX_OFFSET, 8, 4,
+			     blk, sizeof(*blk), false);
+
+	switch (blk->type) {
+	case CATPT_RAM_TYPE_IRAM:
+		sram = &cdev->iram;
+		break;
+	default:
+		sram = &cdev->dram;
+		break;
+	};
+
+	dst_addr = sram->start + blk->ram_offset;
+	if (alloc) {
+		res = __request_region(sram, dst_addr, blk->size, NULL, 0);
+		if (!res)
+			return -EBUSY;
+	}
+
+	/* advance to data area */
+	paddr += sizeof(*blk);
+
+	ret = catpt_dma_memcpy_todsp(cdev, chan, dst_addr, paddr, blk->size);
+	if (ret < 0) {
+		dev_err(cdev->dev, "memcpy error: %d\n", ret);
+		__release_region(sram, dst_addr, blk->size);
+	}
+
+	return ret;
+}
+
+static int catpt_restore_basefw(struct catpt_dev *cdev,
+				struct dma_chan *chan, dma_addr_t paddr,
+				struct catpt_fw_mod_hdr *basefw)
+{
+	u32 offset = sizeof(*basefw);
+	int ret, i;
+
+	print_hex_dump_debug(__func__, DUMP_PREFIX_OFFSET, 8, 4,
+			     basefw, sizeof(*basefw), false);
+
+	/* restore basefw image */
+	for (i = 0; i < basefw->blocks; i++) {
+		struct catpt_fw_block_hdr *blk;
+
+		blk = (struct catpt_fw_block_hdr *)((u8 *)basefw + offset);
+
+		switch (blk->type) {
+		case CATPT_RAM_TYPE_IRAM:
+			ret = catpt_load_block(cdev, chan, paddr + offset,
+					       blk, false);
+			break;
+		default:
+			ret = catpt_restore_fwimage(cdev, chan, paddr + offset,
+						    blk);
+			break;
+		}
+
+		if (ret < 0) {
+			dev_err(cdev->dev, "restore block failed: %d\n", ret);
+			return ret;
+		}
+
+		offset += sizeof(*blk) + blk->size;
+	}
+
+	/* then proceed with memory dumps */
+	ret = catpt_restore_memdumps(cdev, chan);
+	if (ret < 0)
+		dev_err(cdev->dev, "restore memdumps failed: %d\n", ret);
+
+	return ret;
+}
+
+static int catpt_restore_module(struct catpt_dev *cdev,
+				struct dma_chan *chan, dma_addr_t paddr,
+				struct catpt_fw_mod_hdr *mod)
+{
+	u32 offset = sizeof(*mod);
+	int i;
+
+	print_hex_dump_debug(__func__, DUMP_PREFIX_OFFSET, 8, 4,
+			     mod, sizeof(*mod), false);
+
+	for (i = 0; i < mod->blocks; i++) {
+		struct catpt_fw_block_hdr *blk;
+		int ret;
+
+		blk = (struct catpt_fw_block_hdr *)((u8 *)mod + offset);
+
+		switch (blk->type) {
+		case CATPT_RAM_TYPE_INSTANCE:
+			/* restore module state */
+			ret = catpt_dma_memcpy_todsp(cdev, chan,
+					cdev->lpe_base + blk->ram_offset,
+					cdev->dxbuf_paddr + blk->ram_offset,
+					ALIGN(blk->size, 4));
+			break;
+		default:
+			ret = catpt_load_block(cdev, chan, paddr + offset,
+					       blk, false);
+			break;
+		}
+
+		if (ret < 0) {
+			dev_err(cdev->dev, "restore block failed: %d\n", ret);
+			return ret;
+		}
+
+		offset += sizeof(*blk) + blk->size;
+	}
+
+	return 0;
+}
+
+static int catpt_load_module(struct catpt_dev *cdev,
+			     struct dma_chan *chan, dma_addr_t paddr,
+			     struct catpt_fw_mod_hdr *mod)
+{
+	struct catpt_module_type *type;
+	u32 offset = sizeof(*mod);
+	int i;
+
+	print_hex_dump_debug(__func__, DUMP_PREFIX_OFFSET, 8, 4,
+			     mod, sizeof(*mod), false);
+
+	type = &cdev->modules[mod->id];
+
+	for (i = 0; i < mod->blocks; i++) {
+		struct catpt_fw_block_hdr *blk;
+		int ret;
+
+		blk = (struct catpt_fw_block_hdr *)((u8 *)mod + offset);
+
+		ret = catpt_load_block(cdev, chan, paddr + offset, blk, true);
+		if (ret < 0) {
+			dev_err(cdev->dev, "load block failed: %d\n", ret);
+			return ret;
+		}
+
+		/*
+		 * Save state window coordinates - these will be
+		 * used to capture module state on D0 exit
+		 */
+		if (blk->type == CATPT_RAM_TYPE_INSTANCE) {
+			type->state_offset = blk->ram_offset;
+			type->state_size = blk->size;
+		}
+
+		offset += sizeof(*blk) + blk->size;
+	}
+
+	/* init module type static info */
+	type->loaded = true;
+	/* DSP expects address from module header substracted by 4 */
+	type->entry_point = mod->entry_point - 4;
+	type->persistent_size = mod->persistent_size;
+	type->scratch_size = mod->scratch_size;
+
+	return 0;
+}
+
+static int catpt_restore_firmware(struct catpt_dev *cdev,
+				  struct dma_chan *chan, dma_addr_t paddr,
+				  struct catpt_fw_hdr *fw)
+{
+	u32 offset = sizeof(*fw);
+	int i;
+
+	print_hex_dump_debug(__func__, DUMP_PREFIX_OFFSET, 8, 4,
+			     fw, sizeof(*fw), false);
+
+	for (i = 0; i < fw->modules; i++) {
+		struct catpt_fw_mod_hdr *mod;
+		int ret;
+
+		mod = (struct catpt_fw_mod_hdr *)((u8 *)fw + offset);
+		if (strncmp(fw->signature, mod->signature,
+			    FW_SIGNATURE_SIZE)) {
+			dev_err(cdev->dev, "module signature mismatch\n");
+			return -EINVAL;
+		}
+
+		if (mod->id > CATPT_MODID_LAST)
+			return -EINVAL;
+
+		switch (mod->id) {
+		case CATPT_MODID_BASE_FW:
+			ret = catpt_restore_basefw(cdev, chan, paddr + offset,
+						   mod);
+			break;
+		default:
+			ret = catpt_restore_module(cdev, chan, paddr + offset,
+						   mod);
+			break;
+		}
+
+		if (ret < 0) {
+			dev_err(cdev->dev, "restore module failed: %d\n", ret);
+			return ret;
+		}
+
+		offset += sizeof(*mod) + mod->mod_size;
+	}
+
+	return 0;
+}
+
+static int catpt_load_firmware(struct catpt_dev *cdev,
+			       struct dma_chan *chan, dma_addr_t paddr,
+			       struct catpt_fw_hdr *fw)
+{
+	u32 offset = sizeof(*fw);
+	int i;
+
+	print_hex_dump_debug(__func__, DUMP_PREFIX_OFFSET, 8, 4,
+			     fw, sizeof(*fw), false);
+
+	for (i = 0; i < fw->modules; i++) {
+		struct catpt_fw_mod_hdr *mod;
+		int ret;
+
+		mod = (struct catpt_fw_mod_hdr *)((u8 *)fw + offset);
+		if (strncmp(fw->signature, mod->signature,
+			    FW_SIGNATURE_SIZE)) {
+			dev_err(cdev->dev, "module signature mismatch\n");
+			return -EINVAL;
+		}
+
+		if (mod->id > CATPT_MODID_LAST)
+			return -EINVAL;
+
+		ret = catpt_load_module(cdev, chan, paddr + offset, mod);
+		if (ret < 0) {
+			dev_err(cdev->dev, "load module failed: %d\n", ret);
+			return ret;
+		}
+
+		offset += sizeof(*mod) + mod->mod_size;
+	}
+
+	return 0;
+}
+
+static int catpt_load_image(struct catpt_dev *cdev, struct dma_chan *chan,
+			    const char *name, const char *signature,
+			    bool restore)
+{
+	struct catpt_fw_hdr *fw;
+	struct firmware *img;
+	dma_addr_t paddr;
+	void *vaddr;
+	int ret;
+
+	ret = request_firmware((const struct firmware **)&img, name, cdev->dev);
+	if (ret < 0)
+		return ret;
+
+	fw = (struct catpt_fw_hdr *)img->data;
+	if (strncmp(fw->signature, signature, FW_SIGNATURE_SIZE)) {
+		dev_err(cdev->dev, "firmware signature mismatch\n");
+		ret = -EINVAL;
+		goto release_fw;
+	}
+
+	vaddr = dma_alloc_coherent(cdev->dev, img->size, &paddr, GFP_KERNEL);
+	if (!vaddr) {
+		ret = -ENOMEM;
+		goto release_fw;
+	}
+
+	memcpy(vaddr, img->data, img->size);
+	fw = (struct catpt_fw_hdr *)vaddr;
+	if (restore)
+		ret = catpt_restore_firmware(cdev, chan, paddr, fw);
+	else
+		ret = catpt_load_firmware(cdev, chan, paddr, fw);
+
+	dma_free_coherent(cdev->dev, img->size, vaddr, paddr);
+release_fw:
+	release_firmware(img);
+	return ret;
+}
+
+static int catpt_load_images(struct catpt_dev *cdev, bool restore)
+{
+	static const char *const names[] = {
+		"intel/IntcSST1.bin",
+		"intel/IntcSST2.bin",
+	};
+	struct dma_chan *chan;
+	int ret;
+
+	chan = catpt_dma_request_config_chan(cdev);
+	if (IS_ERR(chan))
+		return PTR_ERR(chan);
+
+	ret = catpt_load_image(cdev, chan, names[cdev->spec->core_id - 1],
+			       FW_SIGNATURE, restore);
+	if (ret < 0)
+		goto exit;
+
+	if (!restore)
+		goto exit;
+	ret = catpt_restore_streams_context(cdev, chan);
+	if (ret < 0)
+		dev_err(cdev->dev, "restore streams ctx failed: %d\n", ret);
+exit:
+	dma_release_channel(chan);
+	return ret;
+}
+
+int catpt_boot_firmware(struct catpt_dev *cdev, bool restore)
+{
+	int ret;
+
+	catpt_dsp_stall(cdev, true);
+
+	ret = catpt_load_images(cdev, restore);
+	if (ret < 0) {
+		dev_err(cdev->dev, "load binaries failed: %d\n", ret);
+		return ret;
+	}
+
+	reinit_completion(&cdev->fw_ready);
+	catpt_dsp_stall(cdev, false);
+
+	ret = wait_for_completion_timeout(&cdev->fw_ready,
+			msecs_to_jiffies(FW_READY_TIMEOUT_MSECS));
+	if (!ret) {
+		dev_err(cdev->dev, "firmware ready timeout\n");
+		return -ETIMEDOUT;
+	}
+
+	/* update sram pg & clock once done booting */
+	catpt_dsp_update_srampge(cdev, &cdev->dram, cdev->spec->dram_mask);
+	catpt_dsp_update_srampge(cdev, &cdev->iram, cdev->spec->iram_mask);
+
+	return catpt_dsp_update_lpclock(cdev);
+}
+
+int catpt_first_boot_firmware(struct catpt_dev *cdev)
+{
+	struct resource *res;
+	int ret;
+
+	ret = catpt_boot_firmware(cdev, false);
+	if (ret < 0) {
+		dev_err(cdev->dev, "basefw boot failed: %d\n", ret);
+		return ret;
+	}
+
+	/* restrict FW Core dump area */
+	__request_region(&cdev->dram, 0, 0x200, NULL, 0);
+	/* restrict entire area following BASE_FW - highest offset in DRAM */
+	for (res = cdev->dram.child; res->sibling; res = res->sibling)
+		;
+	__request_region(&cdev->dram, res->end + 1,
+			 cdev->dram.end - res->end, NULL, 0);
+
+	ret = catpt_ipc_get_mixer_stream_info(cdev, &cdev->mixer);
+	if (ret)
+		return CATPT_IPC_ERROR(ret);
+
+	ret = catpt_arm_stream_templates(cdev);
+	if (ret < 0) {
+		dev_err(cdev->dev, "arm templates failed: %d\n", ret);
+		return ret;
+	}
+
+	/* update dram pg for scratch and restricted regions */
+	catpt_dsp_update_srampge(cdev, &cdev->dram, cdev->spec->dram_mask);
+
+	return 0;
+}
-- 
2.17.1

