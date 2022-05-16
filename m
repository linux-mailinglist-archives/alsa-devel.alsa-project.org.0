Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DE4528179
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 12:07:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C271C16B4;
	Mon, 16 May 2022 12:06:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C271C16B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652695660;
	bh=79EhPWO2erwZyQ3qgF6p2i8YrbX4v1+cb3BtQ/lu1/E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lyi0NK1ww/186Zx45UNTqpkbAXR1WCw4Ieq9gi88E6+0vXx7l1eIXDEBY4RAOeju0
	 QmJcQa+hMr2mZvhubw7KdaicFQ72FbJ71fuJrcL3lCHoAIN9HESY79zOt1YfE/BqkE
	 Wlz4QaTOfC7pVl9qbNpUNMYDPGlc383Vx22cxUcI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14F28F805BA;
	Mon, 16 May 2022 12:02:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C139F805BD; Mon, 16 May 2022 12:02:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74E27F80587
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 12:02:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74E27F80587
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="j9QBMUdS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652695353; x=1684231353;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=79EhPWO2erwZyQ3qgF6p2i8YrbX4v1+cb3BtQ/lu1/E=;
 b=j9QBMUdSSQ4s9gvsfWXibqMmcZuKH8O3UG3UoshNmGvQ0+KscCNxbZdp
 SKUvoQwxEGdmQoxAr4XQS8i02yz2V9QqlyIcQX+xRFyTPfD99/Xh09SVR
 LndJwKCeFcphJ1CHWyaNEqDDWu7t7D0e1h2RJ6K53berovCg1PBpN38gD
 8VmraoGRSuNZkUwjPHLtb3ajhIAs9bBdlJn0AtDNw7sJjaQ0b8u5a7F77
 iXYGSKSCO3N5ZVmLZCaC7dmv64hOf3shpfLLEgBSOw5i/iMx+TKYd0mJ/
 74ZBSYSHFj3j8UKrezabZ8JkTTaCzCE7yywksd3cmtBEXx+GfPTQcR0zm A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="333846409"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="333846409"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 03:02:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="522382708"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga003.jf.intel.com with ESMTP; 16 May 2022 03:02:29 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v3 15/15] ASoC: Intel: avs: APL-based platforms support
Date: Mon, 16 May 2022 12:11:16 +0200
Message-Id: <20220516101116.190192-16-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220516101116.190192-1-cezary.rojewski@intel.com>
References: <20220516101116.190192-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 rad@semihalf.com, pierre-louis.bossart@linux.intel.com, tiwai@suse.com,
 hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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

Define handlers specific to cAVS 1.5+ platforms, that is, APL and
similar platforms. These differ from SKL-alike ones in terms of AudioDSP
firmware generation and thus the '+' suffix. Introduciton of IMR,
removal of CLDMA, D0IX support and monolithic-ation of library/module
code are most impactful but are not the only changes brought with this
newer generation. Some generic and 1.5 operations are being re-used to
reduce code size.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/Makefile    |   2 +-
 sound/soc/intel/avs/apl.c       | 250 ++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/avs.h       |  13 ++
 sound/soc/intel/avs/core.c      |  18 +++
 sound/soc/intel/avs/loader.c    |   4 +
 sound/soc/intel/avs/messages.h  |   7 +
 sound/soc/intel/avs/registers.h |   2 +
 7 files changed, 295 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/intel/avs/apl.c

diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index 7d09385bc970..b6b93ae80304 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -3,7 +3,7 @@
 snd-soc-avs-objs := dsp.o ipc.o messages.o utils.o core.o loader.o \
 		    topology.o path.o pcm.o board_selection.o
 snd-soc-avs-objs += cldma.o
-snd-soc-avs-objs += skl.o
+snd-soc-avs-objs += skl.o apl.o
 
 snd-soc-avs-objs += trace.o
 # tell define_trace.h where to find the trace header
diff --git a/sound/soc/intel/avs/apl.c b/sound/soc/intel/avs/apl.c
new file mode 100644
index 000000000000..b8e2b23c9f64
--- /dev/null
+++ b/sound/soc/intel/avs/apl.c
@@ -0,0 +1,250 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+
+#include <linux/devcoredump.h>
+#include <linux/slab.h>
+#include "avs.h"
+#include "messages.h"
+#include "path.h"
+#include "topology.h"
+
+static int apl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
+			   u32 fifo_full_period, unsigned long resource_mask, u32 *priorities)
+{
+	struct apl_log_state_info *info;
+	u32 size, num_cores = adev->hw_cfg.dsp_cores;
+	int ret, i;
+
+	if (fls_long(resource_mask) > num_cores)
+		return -EINVAL;
+	size = struct_size(info, logs_core, num_cores);
+	info = kzalloc(size, GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	info->aging_timer_period = aging_period;
+	info->fifo_full_timer_period = fifo_full_period;
+	info->core_mask = resource_mask;
+	if (enable)
+		for_each_set_bit(i, &resource_mask, num_cores) {
+			info->logs_core[i].enable = enable;
+			info->logs_core[i].min_priority = *priorities++;
+		}
+	else
+		for_each_set_bit(i, &resource_mask, num_cores)
+			info->logs_core[i].enable = enable;
+
+	ret = avs_ipc_set_enable_logs(adev, (u8 *)info, size);
+	kfree(info);
+	if (ret)
+		return AVS_IPC_RET(ret);
+
+	return 0;
+}
+
+static int apl_log_buffer_status(struct avs_dev *adev, union avs_notify_msg *msg)
+{
+	struct apl_log_buffer_layout layout;
+	unsigned long flags;
+	void __iomem *addr, *buf;
+
+	addr = avs_log_buffer_addr(adev, msg->log.core);
+	if (!addr)
+		return -ENXIO;
+
+	memcpy_fromio(&layout, addr, sizeof(layout));
+
+	spin_lock_irqsave(&adev->dbg.trace_lock, flags);
+	if (!kfifo_initialized(&adev->dbg.trace_fifo))
+		/* consume the logs regardless of consumer presence */
+		goto update_read_ptr;
+
+	buf = apl_log_payload_addr(addr);
+
+	if (layout.read_ptr > layout.write_ptr) {
+		__kfifo_fromio_locked(&adev->dbg.trace_fifo, buf + layout.read_ptr,
+				      apl_log_payload_size(adev) - layout.read_ptr,
+				      &adev->dbg.fifo_lock);
+		layout.read_ptr = 0;
+	}
+	__kfifo_fromio_locked(&adev->dbg.trace_fifo, buf + layout.read_ptr,
+			      layout.write_ptr - layout.read_ptr, &adev->dbg.fifo_lock);
+
+	wake_up(&adev->dbg.trace_waitq);
+
+update_read_ptr:
+	spin_unlock_irqrestore(&adev->dbg.trace_lock, flags);
+	writel(layout.write_ptr, addr);
+	return 0;
+}
+
+static int apl_wait_log_entry(struct avs_dev *adev, u32 core, struct apl_log_buffer_layout *layout)
+{
+	unsigned long timeout;
+	void __iomem *addr;
+
+	addr = avs_log_buffer_addr(adev, core);
+	if (!addr)
+		return -ENXIO;
+
+	timeout = jiffies + msecs_to_jiffies(10);
+
+	do {
+		memcpy_fromio(layout, addr, sizeof(*layout));
+		if (layout->read_ptr != layout->write_ptr)
+			return 0;
+		usleep_range(500, 1000);
+	} while (!time_after(jiffies, timeout));
+
+	return -ETIMEDOUT;
+}
+
+/* reads log header and tests its type */
+#define apl_is_entry_stackdump(addr) ((readl(addr) >> 30) & 0x1)
+
+static int apl_coredump(struct avs_dev *adev, union avs_notify_msg *msg)
+{
+	struct apl_log_buffer_layout layout;
+	void __iomem *addr, *buf;
+	size_t dump_size;
+	u16 offset = 0;
+	u8 *dump, *pos;
+
+	dump_size = AVS_FW_REGS_SIZE + msg->ext.coredump.stack_dump_size;
+	dump = vzalloc(dump_size);
+	if (!dump)
+		return -ENOMEM;
+
+	memcpy_fromio(dump, avs_sram_addr(adev, AVS_FW_REGS_WINDOW), AVS_FW_REGS_SIZE);
+
+	if (!msg->ext.coredump.stack_dump_size)
+		goto exit;
+
+	/* Dump the registers even if an external error prevents gathering the stack. */
+	addr = avs_log_buffer_addr(adev, msg->ext.coredump.core_id);
+	if (!addr)
+		goto exit;
+
+	buf = apl_log_payload_addr(addr);
+	memcpy_fromio(&layout, addr, sizeof(layout));
+	if (!apl_is_entry_stackdump(buf + layout.read_ptr)) {
+		/*
+		 * DSP awaits the remaining logs to be
+		 * gathered before dumping stack
+		 */
+		msg->log.core = msg->ext.coredump.core_id;
+		avs_dsp_op(adev, log_buffer_status, msg);
+	}
+
+	pos = dump + AVS_FW_REGS_SIZE;
+	/* gather the stack */
+	do {
+		u32 count;
+
+		if (apl_wait_log_entry(adev, msg->ext.coredump.core_id, &layout))
+			break;
+
+		if (layout.read_ptr > layout.write_ptr) {
+			count = apl_log_payload_size(adev) - layout.read_ptr;
+			memcpy_fromio(pos + offset, buf + layout.read_ptr, count);
+			layout.read_ptr = 0;
+			offset += count;
+		}
+		count = layout.write_ptr - layout.read_ptr;
+		memcpy_fromio(pos + offset, buf + layout.read_ptr, count);
+		offset += count;
+
+		/* update read pointer */
+		writel(layout.write_ptr, addr);
+	} while (offset < msg->ext.coredump.stack_dump_size);
+
+exit:
+	dev_coredumpv(adev->dev, dump, dump_size, GFP_KERNEL);
+
+	return 0;
+}
+
+static bool apl_lp_streaming(struct avs_dev *adev)
+{
+	struct avs_path *path;
+
+	/* Any gateway without buffer allocated in LP area disqualifies D0IX. */
+	list_for_each_entry(path, &adev->path_list, node) {
+		struct avs_path_pipeline *ppl;
+
+		list_for_each_entry(ppl, &path->ppl_list, node) {
+			struct avs_path_module *mod;
+
+			list_for_each_entry(mod, &ppl->mod_list, node) {
+				struct avs_tplg_modcfg_ext *cfg;
+
+				cfg = mod->template->cfg_ext;
+
+				/* only copiers have gateway attributes */
+				if (!guid_equal(&cfg->type, &AVS_COPIER_MOD_UUID))
+					continue;
+				/* non-gateway copiers do not prevent PG */
+				if (cfg->copier.dma_type == INVALID_OBJECT_ID)
+					continue;
+
+				if (!mod->gtw_attrs.lp_buffer_alloc)
+					return false;
+			}
+		}
+	}
+
+	return true;
+}
+
+static bool apl_d0ix_toggle(struct avs_dev *adev, struct avs_ipc_msg *tx, bool wake)
+{
+	/* wake in all cases */
+	if (wake)
+		return true;
+
+	/*
+	 * If no pipelines are running, allow for d0ix schedule.
+	 * If all gateways have lp=1, allow for d0ix schedule.
+	 * If any gateway with lp=0 is allocated, abort scheduling d0ix.
+	 *
+	 * Note: for cAVS 1.5+ and 1.8, D0IX is LP-firmware transition,
+	 * not the power-gating mechanism known from cAVS 2.0.
+	 */
+	return apl_lp_streaming(adev);
+}
+
+static int apl_set_d0ix(struct avs_dev *adev, bool enable)
+{
+	bool streaming = false;
+	int ret;
+
+	if (enable)
+		/* Either idle or all gateways with lp=1. */
+		streaming = !list_empty(&adev->path_list);
+
+	ret = avs_ipc_set_d0ix(adev, enable, streaming);
+	return AVS_IPC_RET(ret);
+}
+
+const struct avs_dsp_ops apl_dsp_ops = {
+	.power = avs_dsp_core_power,
+	.reset = avs_dsp_core_reset,
+	.stall = avs_dsp_core_stall,
+	.irq_handler = avs_dsp_irq_handler,
+	.irq_thread = avs_dsp_irq_thread,
+	.int_control = avs_dsp_interrupt_control,
+	.load_basefw = avs_hda_load_basefw,
+	.load_lib = avs_hda_load_library,
+	.transfer_mods = avs_hda_transfer_modules,
+	.enable_logs = apl_enable_logs,
+	.log_buffer_offset = skl_log_buffer_offset,
+	.log_buffer_status = apl_log_buffer_status,
+	.coredump = apl_coredump,
+	.d0ix_toggle = apl_d0ix_toggle,
+	.set_d0ix = apl_set_d0ix,
+};
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 237e4422dcad..92e37722d280 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -57,6 +57,7 @@ struct avs_dsp_ops {
 	((adev)->spec->dsp_ops->op(adev, ## __VA_ARGS__))
 
 extern const struct avs_dsp_ops skl_dsp_ops;
+extern const struct avs_dsp_ops apl_dsp_ops;
 
 #define AVS_PLATATTR_CLDMA		BIT_ULL(0)
 #define AVS_PLATATTR_IMR		BIT_ULL(1)
@@ -333,4 +334,16 @@ unsigned int __kfifo_fromio_locked(struct kfifo *fifo, const void __iomem *src,
 			 (avs_sram_addr(adev, AVS_DEBUG_WINDOW) + __offset); \
 })
 
+struct apl_log_buffer_layout {
+	u32 read_ptr;
+	u32 write_ptr;
+	u8 buffer[];
+} __packed;
+
+#define apl_log_payload_size(adev) \
+	(avs_log_buffer_size(adev) - sizeof(struct apl_log_buffer_layout))
+
+#define apl_log_payload_addr(addr) \
+	(addr + sizeof(struct apl_log_buffer_layout))
+
 #endif /* __SOUND_SOC_INTEL_AVS_H */
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 7e78a9a9d166..3a0997c3af2b 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -650,9 +650,27 @@ static const struct avs_spec skl_desc = {
 	.rom_status = SKL_ADSP_SRAM_BASE_OFFSET,
 };
 
+static const struct avs_spec apl_desc = {
+	.name = "apl",
+	.min_fw_version = {
+		.major = 9,
+		.minor = 22,
+		.hotfix = 1,
+		.build = 4323,
+	},
+	.dsp_ops = &apl_dsp_ops,
+	.core_init_mask = 3,
+	.attributes = AVS_PLATATTR_IMR,
+	.sram_base_offset = APL_ADSP_SRAM_BASE_OFFSET,
+	.sram_window_size = APL_ADSP_SRAM_WINDOW_SIZE,
+	.rom_status = APL_ADSP_SRAM_BASE_OFFSET,
+};
+
 static const struct pci_device_id avs_ids[] = {
 	{ PCI_VDEVICE(INTEL, 0x9d70), (unsigned long)&skl_desc }, /* SKL */
 	{ PCI_VDEVICE(INTEL, 0x9d71), (unsigned long)&skl_desc }, /* KBL */
+	{ PCI_VDEVICE(INTEL, 0x5a98), (unsigned long)&apl_desc }, /* APL */
+	{ PCI_VDEVICE(INTEL, 0x3198), (unsigned long)&apl_desc }, /* GML */
 	{ 0 }
 };
 MODULE_DEVICE_TABLE(pci, avs_ids);
diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index 8aa658c52325..542fd44aa501 100644
--- a/sound/soc/intel/avs/loader.c
+++ b/sound/soc/intel/avs/loader.c
@@ -37,6 +37,8 @@
 #define AVS_EXT_MANIFEST_MAGIC		0x31454124
 #define SKL_MANIFEST_MAGIC		0x00000006
 #define SKL_ADSPFW_OFFSET		0x284
+#define APL_MANIFEST_MAGIC		0x44504324
+#define APL_ADSPFW_OFFSET		0x2000
 
 /* Occasionally, engineering (release candidate) firmware is provided for testing. */
 static bool debug_ignore_fw_version;
@@ -87,6 +89,8 @@ static int avs_fw_manifest_offset(struct firmware *fw)
 	switch (magic) {
 	case SKL_MANIFEST_MAGIC:
 		return SKL_ADSPFW_OFFSET;
+	case APL_MANIFEST_MAGIC:
+		return APL_ADSPFW_OFFSET;
 	default:
 		return -EINVAL;
 	}
diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index 981ec024b152..c0f90dba9af8 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -365,6 +365,13 @@ struct skl_log_state_info {
 	struct skl_log_state logs_core[];
 } __packed;
 
+struct apl_log_state_info {
+	u32 aging_timer_period;
+	u32 fifo_full_timer_period;
+	u32 core_mask;
+	struct skl_log_state logs_core[];
+} __packed;
+
 int avs_ipc_set_enable_logs(struct avs_dev *adev, u8 *log_info, size_t size);
 
 struct avs_fw_version {
diff --git a/sound/soc/intel/avs/registers.h b/sound/soc/intel/avs/registers.h
index 68f06aa4e10f..95be86148cf3 100644
--- a/sound/soc/intel/avs/registers.h
+++ b/sound/soc/intel/avs/registers.h
@@ -51,6 +51,8 @@
 /* Intel HD Audio SRAM windows base addresses */
 #define SKL_ADSP_SRAM_BASE_OFFSET	0x8000
 #define SKL_ADSP_SRAM_WINDOW_SIZE	0x2000
+#define APL_ADSP_SRAM_BASE_OFFSET	0x80000
+#define APL_ADSP_SRAM_WINDOW_SIZE	0x20000
 
 /* Constants used when accessing SRAM, space shared with firmware */
 #define AVS_FW_REG_BASE(adev)		((adev)->spec->sram_base_offset)
-- 
2.25.1

