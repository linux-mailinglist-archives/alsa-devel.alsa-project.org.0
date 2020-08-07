Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AC123EBF2
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 13:10:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2047C166B;
	Fri,  7 Aug 2020 13:09:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2047C166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596798643;
	bh=aXHhSGnIkD/KM1hGN8jPgzsgUp8gxXKiDplOWNQNda8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yy4SVgH3K6KHypmS6gjipqJnGhOm8SQIOjm3P0+oy1UdtLzogKGxzYqB/y5S9Scxm
	 wTQPKTAQXhnscXZyIznyIj/DRahLrgQ8prX7rFtIjEPevycUpBfBqCoHcbpmhXotWx
	 vWU3ZtxPpnABuI2iGJvKdPLeRl3+dJ3V2C/mHQz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B769BF802E7;
	Fri,  7 Aug 2020 13:07:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 095F6F802E2; Fri,  7 Aug 2020 13:07:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A8A9F80246
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 13:07:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A8A9F80246
IronPort-SDR: oiTqRzBbluGI0UDqOli2EXg5uy9OgNtywU3I64TnIqrJLdDxZWjrRQGDxQfgGDLUpqG/c/BJKl
 D6zgCdzmDK+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9705"; a="214585467"
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; d="scan'208";a="214585467"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2020 04:07:15 -0700
IronPort-SDR: krFzJuz45p8FUkFXgwatjCRfpf1Ebr8P6R37g71XRMVIaldjdFVIEQLG16zpb1ObD/vOizvzmI
 mF3E57uXDIqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; d="scan'208";a="333513964"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga007.jf.intel.com with ESMTP; 07 Aug 2020 04:07:12 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/13] ASoC: Intel: catpt: Firmware loading and context restore
Date: Fri,  7 Aug 2020 13:06:39 +0200
Message-Id: <20200807110649.17114-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807110649.17114-1-cezary.rojewski@intel.com>
References: <20200807110649.17114-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org, michal.wasko@intel.com,
 cujomalainey@chromium.org, ppapierkowski@habana.ai,
 vamshi.krishna.gopal@intel.com
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
 sound/soc/intel/catpt/loader.c | 837 +++++++++++++++++++++++++++++++++
 1 file changed, 837 insertions(+)
 create mode 100644 sound/soc/intel/catpt/loader.c

diff --git a/sound/soc/intel/catpt/loader.c b/sound/soc/intel/catpt/loader.c
new file mode 100644
index 000000000000..bee9dee4e0a6
--- /dev/null
+++ b/sound/soc/intel/catpt/loader.c
@@ -0,0 +1,837 @@
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
+int catpt_mbank_create(struct catpt_mbank *sram, u32 start, u32 size, u32 mask)
+{
+	struct catpt_mregion *region;
+
+	sram->start = start;
+	sram->end = start + size - 1;
+	sram->mask = mask;
+	mutex_init(&sram->mutex);
+	INIT_LIST_HEAD(&sram->region_list);
+
+	region = kmalloc(sizeof(*region), GFP_KERNEL);
+	if (!region)
+		return -ENOMEM;
+
+	region->start = sram->start;
+	region->end = sram->end;
+	region->busy = false;
+	INIT_LIST_HEAD(&region->node);
+
+	list_add_tail(&region->node, &sram->region_list);
+	return 0;
+}
+
+void catpt_mbank_remove(struct catpt_mbank *sram)
+{
+	struct catpt_mregion *reg, *save;
+
+	list_for_each_entry_safe(reg, save, &sram->region_list, node) {
+		list_del(&reg->node);
+		kfree(reg);
+	}
+}
+
+static struct catpt_mregion *
+catpt_mregion_split(struct catpt_mregion *region, u32 offset)
+{
+	struct catpt_mregion *new;
+
+	new = kmalloc(sizeof(*new), GFP_KERNEL);
+	if (!new)
+		return NULL;
+
+	new->start = region->start;
+	new->end = offset;
+	new->busy = 0;
+	INIT_LIST_HEAD(&new->node);
+	region->start = new->end + 1;
+	list_add_tail(&new->node, &region->node);
+
+	trace_catpt_mregion(new, region, "split");
+
+	return new;
+}
+
+static void
+catpt_mregion_join(struct catpt_mregion *r1, struct catpt_mregion *r2)
+{
+	trace_catpt_mregion(r1, r2, "join");
+
+	r1->end = r2->end;
+	list_del(&r2->node);
+	kfree(r2);
+}
+
+static struct catpt_mregion *
+catpt_mregion_extract(struct catpt_mregion *region, u32 start, u32 end)
+{
+	struct catpt_mregion *ext;
+
+	if (start == region->start) {
+		if (end == region->end)
+			ext = region; /* entire block */
+		else
+			ext = catpt_mregion_split(region, end);
+	} else {
+		ext = catpt_mregion_split(region, start - 1);
+		if (IS_ERR(ext))
+			return ext;
+		ext = region; /* get the latter of two */
+		if (end != region->end)
+			ext = catpt_mregion_split(region, end);
+	}
+
+	return ext;
+}
+
+struct catpt_mregion *
+catpt_mbank_request_region(struct catpt_mbank *sram, u32 size)
+{
+	struct catpt_mregion *pos, *reg;
+	struct catpt_mregion *found = NULL;
+
+	trace_catpt_mbank(sram, "request", UINT_MAX, size);
+
+	if (!size || size > catpt_mbank_size(sram))
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&sram->mutex);
+	list_for_each_entry_reverse(pos, &sram->region_list, node) {
+		if (pos->busy)
+			continue;
+		if (catpt_mregion_size(pos) >= size) {
+			found = pos;
+			break;
+		}
+	}
+	if (!found) {
+		reg = ERR_PTR(-EBUSY);
+		goto exit;
+	}
+
+	trace_catpt_mbank(sram, "found", found->start, found->end);
+
+	reg = catpt_mregion_extract(found, found->end - size + 1, found->end);
+	if (IS_ERR(reg))
+		goto exit;
+
+	reg->busy = 1;
+	trace_catpt_mbank(sram, "allocated", reg->start, reg->end);
+exit:
+	mutex_unlock(&sram->mutex);
+	return reg;
+}
+
+struct catpt_mregion *
+catpt_mbank_reserve_region(struct catpt_mbank *sram, u32 start, u32 size)
+{
+	struct catpt_mregion *pos, *reg;
+	struct catpt_mregion *found = NULL;
+	u32 end = start + size - 1;
+
+	trace_catpt_mbank(sram, "reserve", start, end);
+
+	if (!size || start < sram->start || end > sram->end)
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&sram->mutex);
+	list_for_each_entry_reverse(pos, &sram->region_list, node) {
+		if (pos->busy)
+			continue;
+		if (pos->start <= start && pos->end >= end) {
+			found = pos;
+			break;
+		}
+	}
+	if (!found) {
+		reg = ERR_PTR(-EBUSY);
+		goto exit;
+	}
+
+	trace_catpt_mbank(sram, "found", found->start, found->end);
+
+	reg = catpt_mregion_extract(found, start, end);
+	if (IS_ERR(reg))
+		goto exit;
+
+	reg->busy = 1;
+	trace_catpt_mbank(sram, "allocated", reg->start, reg->end);
+exit:
+	mutex_unlock(&sram->mutex);
+	return reg;
+}
+
+void catpt_mbank_release_region(struct catpt_mbank *sram,
+				struct catpt_mregion *region)
+{
+	struct catpt_mregion *r;
+
+	trace_catpt_mbank(sram, "release", region->start, region->end);
+
+	mutex_lock(&sram->mutex);
+
+	region->busy = 0;
+	if (list_is_singular(&sram->region_list)) {
+		mutex_unlock(&sram->mutex);
+		return;
+	}
+	/*
+	 * region may have free block next to it: from the left,
+	 * right or both. Attempt to join them together
+	 */
+	if (!list_is_last(&region->node, &sram->region_list)) {
+		r = list_next_entry(region, node);
+		if (!r->busy)
+			catpt_mregion_join(region, r);
+	}
+
+	if (!list_is_first(&region->node, &sram->region_list)) {
+		r = list_prev_entry(region, node);
+		if (!r->busy)
+			catpt_mregion_join(r, region);
+	}
+
+	mutex_unlock(&sram->mutex);
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
+		size = catpt_mregion_size(stream->persistent);
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
+		size = catpt_mregion_size(stream->persistent);
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
+	struct catpt_mregion r1, r2, common;
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
+		if (!catpt_mregion_intersecting(&r2, &r1, &common))
+			continue;
+		/* calculate start offset of common data area */
+		off = common.start - r1.start;
+
+		dev_dbg(cdev->dev, "found intersecting region: 0x%08x-%08x\n",
+			common.start, common.end);
+		dev_dbg(cdev->dev, "restoring fwimage: start 0x%08x size %ld\n",
+			common.start, catpt_mregion_size(&common));
+
+		ret = catpt_dma_memcpy_todsp(cdev, chan, common.start,
+					     paddr + off,
+					     catpt_mregion_size(&common));
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
+	struct catpt_mregion *reg = NULL;
+	struct catpt_mbank *sram;
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
+		reg = catpt_mbank_reserve_region(sram, dst_addr, blk->size);
+		if (IS_ERR(reg))
+			return PTR_ERR(reg);
+	}
+
+	/* advance to data area */
+	paddr += sizeof(*blk);
+
+	ret = catpt_dma_memcpy_todsp(cdev, chan, dst_addr, paddr, blk->size);
+	if (ret < 0) {
+		dev_err(cdev->dev, "memcpy error: %d\n", ret);
+		if (reg && IS_ERR(reg))
+			catpt_mbank_release_region(sram, reg);
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
+	ret = catpt_load_image(cdev, chan, names[cdev->pdata->core_id - 1],
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
+	catpt_dsp_update_srampge(cdev, &cdev->dram);
+	catpt_dsp_update_srampge(cdev, &cdev->iram);
+
+	return catpt_dsp_update_lpclock(cdev);
+}
+
+int catpt_first_boot_firmware(struct catpt_dev *cdev)
+{
+	struct catpt_mregion *reg;
+	int ret;
+
+	ret = catpt_boot_firmware(cdev, false);
+	if (ret < 0) {
+		dev_err(cdev->dev, "basefw boot failed: %d\n", ret);
+		return ret;
+	}
+
+	/* restrict FW Core dump area */
+	catpt_mbank_reserve_region(&cdev->dram, 0, 0x200);
+	/* restrict entire area following BASE_FW - highest offset in DRAM */
+	reg = list_last_entry(&cdev->dram.region_list, struct catpt_mregion,
+			      node);
+	reg->busy = true;
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
+	catpt_dsp_update_srampge(cdev, &cdev->dram);
+
+	return 0;
+}
-- 
2.17.1

