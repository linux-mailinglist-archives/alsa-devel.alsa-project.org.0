Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 628B151052A
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 19:19:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E90DD18A3;
	Tue, 26 Apr 2022 19:18:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E90DD18A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650993570;
	bh=jeEKr9769O5BZNKQMUv8VqXtzZkm9a7Z0Cc/mFbCcf8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kvfyNNiuXoIBXsKdrziIUIKPZxTIvdy0bpSRd8jr9kcIKj8LW5BSLOUGQneXY+nNJ
	 /xYP3in4ISmEnYlDji/K+nbgz6CeUk1mgz9OK1II9Ny0qMbux85SdjDtOfreVeMGwB
	 07EUzq5RueQHUXRGJBI8hrf9z9AQ/lQ3IfQA2KbQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40F55F8057C;
	Tue, 26 Apr 2022 19:15:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB4E8F8056F; Tue, 26 Apr 2022 19:15:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A50FF80152
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 19:15:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A50FF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="aVjQrWbG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650993342; x=1682529342;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jeEKr9769O5BZNKQMUv8VqXtzZkm9a7Z0Cc/mFbCcf8=;
 b=aVjQrWbG8am4DWFlBvQ6uDZQipDXiOJaHPKQb0C0iObblxYErZizoSil
 /GSvDdlXV/gernQ0OzM4P2oPMiE9bV0fSJi2+1AIJouPOBU1ThH1ykZrK
 JeM5r8djaHxQ4yrLBx/SITxexAKJu4dzI4XyuvJ4OamG2IRJ9FPFiDB/3
 G0sUvHIBXsSste8TsnkticVSmxqz0fyR6Iidt8kAMhsUmGx1BsumRyXG6
 L7CExZGNl01fBQITIOoDKvA7l2n474W+PqnrvcLAANx1lr13JzFhD9N3B
 FGojCpq3wOka8GIBa42Ak+be1YIxEjxAqSJbgrcNAOIdbnPSbl8ARtqLH g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="264508123"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="264508123"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 10:15:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="650305717"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Apr 2022 10:15:22 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 13/14] ASoC: Intel: avs: SKL-based platforms support
Date: Tue, 26 Apr 2022 19:23:45 +0200
Message-Id: <20220426172346.3508411-14-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426172346.3508411-1-cezary.rojewski@intel.com>
References: <20220426172346.3508411-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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
 sound/soc/intel/avs/core.c      |  18 +++++
 sound/soc/intel/avs/messages.h  |  18 +++++
 sound/soc/intel/avs/registers.h |   4 +
 sound/soc/intel/avs/skl.c       | 125 ++++++++++++++++++++++++++++++++
 6 files changed, 170 insertions(+)
 create mode 100644 sound/soc/intel/avs/skl.c

diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index 592d4dc02c56..7d09385bc970 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -3,6 +3,7 @@
 snd-soc-avs-objs := dsp.o ipc.o messages.o utils.o core.o loader.o \
 		    topology.o path.o pcm.o board_selection.o
 snd-soc-avs-objs += cldma.o
+snd-soc-avs-objs += skl.o
 
 snd-soc-avs-objs += trace.o
 # tell define_trace.h where to find the trace header
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 67a80d56c7ae..c0b8d6354089 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -56,6 +56,8 @@ struct avs_dsp_ops {
 #define avs_dsp_op(adev, op, ...) \
 	((adev)->spec->dsp_ops->op(adev, ## __VA_ARGS__))
 
+extern const struct avs_dsp_ops skl_dsp_ops;
+
 #define AVS_PLATATTR_CLDMA		BIT_ULL(0)
 #define AVS_PLATATTR_IMR		BIT_ULL(1)
 
@@ -249,6 +251,8 @@ void avs_ipc_block(struct avs_ipc *ipc);
 int avs_dsp_disable_d0ix(struct avs_dev *adev);
 int avs_dsp_enable_d0ix(struct avs_dev *adev);
 
+int skl_log_buffer_offset(struct avs_dev *adev, u32 core);
+
 /* Firmware resources management */
 
 int avs_get_module_entry(struct avs_dev *adev, const guid_t *uuid, struct avs_module_entry *entry);
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index c2f8fb87cfc2..b6387c2c6361 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -658,7 +658,25 @@ static const struct dev_pm_ops avs_dev_pm = {
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
+	.dsp_ops = &skl_dsp_ops,
+	.core_init_mask = 1,
+	.attributes = AVS_PLATATTR_CLDMA,
+	.sram_base_offset = SKL_ADSP_SRAM_BASE_OFFSET,
+	.sram_window_size = SKL_ADSP_SRAM_WINDOW_SIZE,
+	.rom_status = SKL_ADSP_SRAM_BASE_OFFSET,
+};
+
 static const struct pci_device_id avs_ids[] = {
+	{ PCI_VDEVICE(INTEL, 0x9d70), (unsigned long)&skl_desc }, /* SKL */
+	{ PCI_VDEVICE(INTEL, 0x9d71), (unsigned long)&skl_desc }, /* KBL */
 	{ 0 }
 };
 MODULE_DEVICE_TABLE(pci, avs_ids);
diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index 257482e160bc..981ec024b152 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -347,6 +347,24 @@ enum avs_log_enable {
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
index b2100dc630e4..68f06aa4e10f 100644
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
index 000000000000..bda5ec7510fe
--- /dev/null
+++ b/sound/soc/intel/avs/skl.c
@@ -0,0 +1,125 @@
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
+#include <sound/hdaudio_ext.h>
+#include "avs.h"
+#include "messages.h"
+
+static int skl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
+			   u32 fifo_full_period, unsigned long resource_mask, u32 *priorities)
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
+int skl_log_buffer_offset(struct avs_dev *adev, u32 core)
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
+	write = readl(avs_sram_addr(adev, AVS_FW_REGS_WINDOW) + FW_REGS_DBG_LOG_WP(msg->log.core));
+	/* determine buffer half */
+	offset = (write < size) ? size : 0;
+
+	/* Address is guaranteed to exist in SRAM2. */
+	buf = avs_log_buffer_addr(adev, msg->log.core) + offset;
+	__kfifo_fromio_locked(&adev->dbg.trace_fifo, buf, size, &adev->dbg.fifo_lock);
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

