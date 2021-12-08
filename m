Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5284346D221
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 12:25:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F419C26F9;
	Wed,  8 Dec 2021 12:24:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F419C26F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638962701;
	bh=xFCo5f2kbAptXvasazgFFy5uTmDikC4NoT81ZnCvcfs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FXUX/unay93bOLIMiYrFRHQBVjEyiTGHGbJGXC07lE3NwGsJ8kSLZRJAWv/DIrFli
	 A6qf95+Dporv4IQzDsN4zTKJh534fZZCwBHynUFyXn1WNSFFNgjZPkf1SDc57cqCPU
	 5U6juC/E1+peUsn3b/AdkFLLtf/tw/B7n58O8UDk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E947BF80631;
	Wed,  8 Dec 2021 12:13:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B7FDF8061E; Wed,  8 Dec 2021 12:13:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7D53F804FF
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 12:12:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7D53F804FF
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="236548540"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="236548540"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 03:12:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="600600606"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2021 03:12:54 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 36/37] ASoC: Intel: avs: SKL-based platforms support
Date: Wed,  8 Dec 2021 12:13:00 +0100
Message-Id: <20211208111301.1817725-37-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211208111301.1817725-1-cezary.rojewski@intel.com>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, yung-chuan.liao@linux.intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 broonie@kernel.org, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 peter.ujfalusi@linux.intel.com, lma@semihalf.com
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

Define handlers specific to cAVS 1.5 platforms, that is SKL, KBL, AML
and all other variants based on this very version of AudioDSP
architecture. Most are specific to SKL-alike platforms with only
skl_log_buffer_offset() being exposed and used later by younger
equivalents.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/Makefile    |   1 +
 sound/soc/intel/avs/avs.h       |   4 +
 sound/soc/intel/avs/core.c      |  26 +++++++
 sound/soc/intel/avs/messages.h  |  18 +++++
 sound/soc/intel/avs/registers.h |   4 +
 sound/soc/intel/avs/skl.c       | 127 ++++++++++++++++++++++++++++++++
 6 files changed, 180 insertions(+)
 create mode 100644 sound/soc/intel/avs/skl.c

diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index e515ed7f18f9..4e931bccb6b3 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -3,6 +3,7 @@
 snd-soc-avs-objs := dsp.o ipc.o messages.o utils.o topology.o path.o \
 		    core.o loader.o pcm.o board_selection.o
 snd-soc-avs-objs += cldma.o
+snd-soc-avs-objs += skl.o
 
 snd-soc-avs-objs += trace.o
 # tell define_trace.h where to find the trace header
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index c2ed107d194d..93e5c9a112e0 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -47,6 +47,8 @@ struct avs_dsp_ops {
 #define avs_dsp_op(adev, op, ...) \
 	((adev)->spec->dops->op(adev, ## __VA_ARGS__))
 
+extern const struct avs_dsp_ops skl_dsp_ops;
+
 #define AVS_PLATATTR_CLDMA		BIT_ULL(0)
 #define AVS_PLATATTR_IMR		BIT_ULL(1)
 
@@ -227,6 +229,8 @@ void avs_ipc_block(struct avs_ipc *ipc);
 int avs_dsp_disable_d0ix(struct avs_dev *adev);
 int avs_dsp_enable_d0ix(struct avs_dev *adev);
 
+unsigned int skl_log_buffer_offset(struct avs_dev *adev, u32 core);
+
 /* Firmware resources management */
 
 int avs_get_module_entry(struct avs_dev *adev, const guid_t *uuid, struct avs_module_entry *entry);
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 6cbbdd2a80b2..c3967f6727ce 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -663,7 +663,33 @@ static const struct dev_pm_ops avs_dev_pm = {
 	SET_RUNTIME_PM_OPS(avs_runtime_suspend, avs_runtime_resume, NULL)
 };
 
+static const struct avs_spec skl_desc = {
+	.name = "skl",
+	.min_fw_version = {
+		.major = 9,
+		.minor = 21,
+		.hotfix = 0,
+		.build = 4732,
+	},
+	.dops = &skl_dsp_ops,
+	.core_init_mask = 1,
+	.attributes = AVS_PLATATTR_CLDMA,
+	.sram_base_offset = SKL_ADSP_SRAM_BASE_OFFSET,
+	.sram_window_size = SKL_ADSP_SRAM_WINDOW_SIZE,
+	.rom_status = SKL_ADSP_SRAM_BASE_OFFSET,
+	.hipc_req_offset = SKL_ADSP_REG_HIPCI,
+	.hipc_req_ext_offset = SKL_ADSP_REG_HIPCIE,
+	.hipc_req_busy_mask = SKL_ADSP_HIPCI_BUSY,
+	.hipc_ack_offset = SKL_ADSP_REG_HIPCIE,
+	.hipc_ack_done_mask = SKL_ADSP_HIPCIE_DONE,
+	.hipc_rsp_offset = SKL_ADSP_REG_HIPCT,
+	.hipc_rsp_busy_mask = SKL_ADSP_HIPCT_BUSY,
+	.hipc_ctl_offset = SKL_ADSP_REG_HIPCCTL,
+};
+
 static const struct pci_device_id avs_ids[] = {
+	{ PCI_VDEVICE(INTEL, 0x9d70), (unsigned long)&skl_desc }, /* SKL */
+	{ PCI_VDEVICE(INTEL, 0x9d71), (unsigned long)&skl_desc }, /* KBL */
 	{ 0 }
 };
 MODULE_DEVICE_TABLE(pci, avs_ids);
diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index fa4ba364e5b8..f8e50254e251 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -357,6 +357,24 @@ enum avs_log_enable {
 	AVS_LOG_ENABLE = 1
 };
 
+enum avs_skl_log_priority {
+	AVS_SKL_LOG_CRITICAL = 1,
+	AVS_SKL_LOG_HIGH,
+	AVS_SKL_LOG_MEDIUM,
+	AVS_SKL_LOG_LOW,
+	AVS_SKL_LOG_VERBOSE,
+};
+
+struct skl_log_state {
+	u32 enable;
+	u32 min_priority;
+} __packed;
+
+struct skl_log_state_info {
+	u32 core_mask;
+	struct skl_log_state logs_core[];
+} __packed;
+
 int avs_ipc_set_enable_logs(struct avs_dev *adev, u8 *log_info, size_t size);
 
 struct avs_fw_version {
diff --git a/sound/soc/intel/avs/registers.h b/sound/soc/intel/avs/registers.h
index 3b6b251663b5..c640c8c49d0d 100644
--- a/sound/soc/intel/avs/registers.h
+++ b/sound/soc/intel/avs/registers.h
@@ -48,6 +48,10 @@
 #define SKL_ADSP_HIPCIE_DONE		BIT(30)
 #define SKL_ADSP_HIPCT_BUSY		BIT(31)
 
+/* Intel HD Audio SRAM windows base addresses */
+#define SKL_ADSP_SRAM_BASE_OFFSET	0x8000
+#define SKL_ADSP_SRAM_WINDOW_SIZE	0x2000
+
 /* Constants used when accessing SRAM, space shared with firmware */
 #define AVS_FW_REG_BASE(adev)		((adev)->spec->sram_base_offset)
 #define AVS_FW_REG_STATUS(adev)		(AVS_FW_REG_BASE(adev) + 0x0)
diff --git a/sound/soc/intel/avs/skl.c b/sound/soc/intel/avs/skl.c
new file mode 100644
index 000000000000..94cf7e98cd04
--- /dev/null
+++ b/sound/soc/intel/avs/skl.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021 Intel Corporation. All rights reserved.
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+
+#include <linux/devcoredump.h>
+#include <linux/slab.h>
+#include <sound/hdaudio_ext.h>
+#include "avs.h"
+#include "messages.h"
+
+static int skl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable,
+			   u32 aging_period, u32 fifo_full_period,
+			   unsigned long resource_mask, u32 *priorities)
+{
+	struct skl_log_state_info *info;
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
+	info->core_mask = resource_mask;
+	if (enable)
+		for_each_set_bit(i, &resource_mask, GENMASK(num_cores, 0)) {
+			info->logs_core[i].enable = enable;
+			info->logs_core[i].min_priority = *priorities++;
+		}
+	else
+		for_each_set_bit(i, &resource_mask, GENMASK(num_cores, 0))
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
+unsigned int skl_log_buffer_offset(struct avs_dev *adev, u32 core)
+{
+	return core * avs_log_buffer_size(adev);
+}
+
+/* fw DbgLogWp registers */
+#define FW_REGS_DBG_LOG_WP(core) (0x30 + 0x4 * core)
+
+static int
+skl_log_buffer_status(struct avs_dev *adev, union avs_notify_msg *msg)
+{
+	unsigned long flags;
+	void __iomem *buf;
+	u16 size, write, offset;
+
+	spin_lock_irqsave(&adev->dbg.trace_lock, flags);
+	if (!kfifo_initialized(&adev->dbg.trace_fifo)) {
+		spin_unlock_irqrestore(&adev->dbg.trace_lock, flags);
+		return 0;
+	}
+
+	size = avs_log_buffer_size(adev) / 2;
+	write = readl(avs_sram_addr(adev, AVS_FW_REGS_WINDOW) +
+			FW_REGS_DBG_LOG_WP(msg->log.core));
+	/* determine buffer half */
+	offset = (write < size) ? size : 0;
+
+	buf = avs_log_buffer_addr(adev, msg->log.core) + offset;
+	__kfifo_fromio_locked(&adev->dbg.trace_fifo, buf, size,
+			      &adev->dbg.fifo_lock);
+	wake_up(&adev->dbg.trace_waitq);
+	spin_unlock_irqrestore(&adev->dbg.trace_lock, flags);
+
+	return 0;
+}
+
+static int skl_coredump(struct avs_dev *adev, union avs_notify_msg *msg)
+{
+	u8 *dump;
+
+	dump = vzalloc(AVS_FW_REGS_SIZE);
+	if (!dump)
+		return -ENOMEM;
+
+	memcpy_fromio(dump, avs_sram_addr(adev, AVS_FW_REGS_WINDOW), AVS_FW_REGS_SIZE);
+	dev_coredumpv(adev->dev, dump, AVS_FW_REGS_SIZE, GFP_KERNEL);
+
+	return 0;
+}
+
+static bool
+skl_d0ix_toggle(struct avs_dev *adev, struct avs_ipc_msg *tx, bool wake)
+{
+	/* unsupported on cAVS 1.5 hw */
+	return false;
+}
+
+static int skl_set_d0ix(struct avs_dev *adev, bool enable)
+{
+	/* unsupported on cAVS 1.5 hw */
+	return 0;
+}
+
+const struct avs_dsp_ops skl_dsp_ops = {
+	.power = avs_dsp_core_power,
+	.reset = avs_dsp_core_reset,
+	.stall = avs_dsp_core_stall,
+	.irq_handler = avs_dsp_irq_handler,
+	.irq_thread = avs_dsp_irq_thread,
+	.int_control = avs_dsp_interrupt_control,
+	.load_basefw = avs_cldma_load_basefw,
+	.load_lib = avs_cldma_load_library,
+	.transfer_mods = avs_cldma_transfer_modules,
+	.enable_logs = skl_enable_logs,
+	.log_buffer_offset = skl_log_buffer_offset,
+	.log_buffer_status = skl_log_buffer_status,
+	.coredump = skl_coredump,
+	.d0ix_toggle = skl_d0ix_toggle,
+	.set_d0ix = skl_set_d0ix,
+};
-- 
2.25.1

