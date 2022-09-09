Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9723B5B36A2
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 13:46:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 484F2169B;
	Fri,  9 Sep 2022 13:45:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 484F2169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662723994;
	bh=IsBURceTRSfTzoxEFtpRYQAvaU5JrZJ6MtIfvjWyvZQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cZrRB9iIHuoc5Ok3HLfQF8HFdQCpZZ6JEyjqMgQJh6cRdjAipblaGGyRj0nBtmp2b
	 Te8pFSRaKt1EezCNgzvUGKcZRjO/NQJ/A6mTtrCpqBPYpOIhBsp85zLR4BxaEhLViP
	 3pAOUxcrOF2cZHDG0+h++zsoUFlAaubpKhk5gCp8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34F28F80563;
	Fri,  9 Sep 2022 13:43:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A839AF8053B; Fri,  9 Sep 2022 13:43:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B376F8032B
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 13:43:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B376F8032B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Hm+mjB9W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662723825; x=1694259825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IsBURceTRSfTzoxEFtpRYQAvaU5JrZJ6MtIfvjWyvZQ=;
 b=Hm+mjB9WMZ+KSM43dJPwLTXFK8pyCLoXrLbwFidiL3cDib9XGx0fq+8k
 i7UUxtC2D5RkIEZQTI3J45ijOa27e61fe++I2TVfOJNHlZuGylMYKQsY1
 aeqG6FNPSliD+by/V4l9FuA6Qq2U+JBEydRnwWe1BewtLFJf4/lDanaqH
 H0Eg4dEnB9GFMXEvyzOfekP12jao+Nrt5Ip99frvO2GanbXDfxAcWlHFw
 x5W/ch5q2zLAt90NfNPfADBzqoZXhIpuUBWd/hKyRZ2Kjk9H8OKxXbksC
 Yv5ZYhmJQGvGHS7TrT35PF5gc12dgYxZ68bK+mfnTUIEmvKwAQ3q/cR6n g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="359180108"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="359180108"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 04:43:43 -0700
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="683613879"
Received: from desharpe-mobl1.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.0.89])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 04:43:40 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 5/7] ASoC: SOF: ipc4: Add support for mtrace log extraction
Date: Fri,  9 Sep 2022 14:43:30 +0300
Message-Id: <20220909114332.31393-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220909114332.31393-1-peter.ujfalusi@linux.intel.com>
References: <20220909114332.31393-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com
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

One of the debugging/logging features for an IPC4 based firmware is the use
of the debug window to deliver log messages to host via the shared SRAM.

The initial implementation of the mtrace supports only TGL/MTL style of
logging, but can be extended to support other types, like APL, SKL, CNL,
etc.

The window is split into 16 'slots' where the first slot contains the
descriptors for the remaining 15 slots.

Each DSP core logs to a separate slot and the slot allocation is not fixed,
we can not assume that the first slot is always used by core0 for example.

The firmware sends LOG_BUFFER_STATUS message when new log batch is
available from one of the cores (after it updated the write_ptr in the
given slot).
Host should update the read_ptr in the same slot when it has taken out log
data.

The patch also updates the sof_ipc4_fw_data struct with parameters needed
for the mtrace to be enabled and used safely.

Co-developed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Rander Wang <rander.wang@intel.com>
Co-developed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/Makefile      |   3 +-
 sound/soc/sof/ipc4-loader.c |   2 +
 sound/soc/sof/ipc4-mtrace.c | 643 ++++++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc4-priv.h   |  14 +-
 sound/soc/sof/ipc4.c        |   4 +
 5 files changed, 664 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/sof/ipc4-mtrace.c

diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 9a74ed116ed9..eab7cc53f71a 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -9,7 +9,8 @@ snd-sof-objs +=	ipc3.o ipc3-loader.o ipc3-topology.o ipc3-control.o ipc3-pcm.o\
 		ipc3-dtrace.o
 endif
 ifneq ($(CONFIG_SND_SOC_SOF_INTEL_IPC4),)
-snd-sof-objs += ipc4.o ipc4-loader.o ipc4-topology.o ipc4-control.o ipc4-pcm.o
+snd-sof-objs += ipc4.o ipc4-loader.o ipc4-topology.o ipc4-control.o ipc4-pcm.o\
+		ipc4-mtrace.o
 endif
 
 # SOF client support
diff --git a/sound/soc/sof/ipc4-loader.c b/sound/soc/sof/ipc4-loader.c
index 8bd2132b4f41..c678f05d0ef5 100644
--- a/sound/soc/sof/ipc4-loader.c
+++ b/sound/soc/sof/ipc4-loader.c
@@ -157,6 +157,7 @@ static int sof_ipc4_validate_firmware(struct snd_sof_dev *sdev)
 
 static int sof_ipc4_query_fw_configuration(struct snd_sof_dev *sdev)
 {
+	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
 	const struct sof_ipc_ops *iops = sdev->ipc->ops;
 	struct sof_ipc4_fw_version *fw_ver;
 	struct sof_ipc4_tuple *tuple;
@@ -200,6 +201,7 @@ static int sof_ipc4_query_fw_configuration(struct snd_sof_dev *sdev)
 			break;
 		case SOF_IPC4_FW_CFG_TRACE_LOG_BYTES:
 			dev_vdbg(sdev->dev, "Trace log size: %u\n", *tuple->value);
+			ipc4_data->mtrace_log_bytes = *tuple->value;
 			break;
 		default:
 			break;
diff --git a/sound/soc/sof/ipc4-mtrace.c b/sound/soc/sof/ipc4-mtrace.c
new file mode 100644
index 000000000000..9c7080041d08
--- /dev/null
+++ b/sound/soc/sof/ipc4-mtrace.c
@@ -0,0 +1,643 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2022 Intel Corporation. All rights reserved.
+
+#include <linux/debugfs.h>
+#include <linux/sched/signal.h>
+#include <sound/sof/ipc4/header.h>
+#include "sof-priv.h"
+#include "ipc4-priv.h"
+
+/*
+ * debug info window is organized in 16 (equal sized) pages:
+ *
+ *	------------------------
+ *	| Page0  - descriptors |
+ *	------------------------
+ *	| Page1  - slot0       |
+ *	------------------------
+ *	| Page2  - slot1       |
+ *	------------------------
+ *	|         ...          |
+ *	------------------------
+ *	| Page14  - slot13     |
+ *	------------------------
+ *	| Page15  - slot14     |
+ *	------------------------
+ *
+ * The slot size == page size
+ *
+ * The first page contains descriptors for the remaining 15 cores
+ * The slot descriptor is:
+ * u32 res_id;
+ * u32 type;
+ * u32 vma;
+ *
+ * Log buffer slots have the following layout:
+ * u32 host_read_ptr;
+ * u32 dsp_write_ptr;
+ * u8 buffer[];
+ *
+ * The two pointers are offsets within the buffer.
+ */
+
+#define SOF_MTRACE_DESCRIPTOR_SIZE		12 /* 3 x u32 */
+
+#define FW_EPOCH_DELTA				11644473600LL
+
+#define INVALID_SLOT_OFFSET			0xffffffff
+#define MAX_ALLOWED_LIBRARIES			16
+#define MAX_MTRACE_SLOTS			15
+
+#define SOF_MTRACE_PAGE_SIZE			0x1000
+#define SOF_MTRACE_SLOT_SIZE			SOF_MTRACE_PAGE_SIZE
+
+/* debug log slot types */
+#define SOF_MTRACE_SLOT_UNUSED			0x00000000
+#define SOF_MTRACE_SLOT_CRITICAL_LOG		0x54524300 /* byte 0: core ID */
+#define SOF_MTRACE_SLOT_DEBUG_LOG		0x474f4c00 /* byte 0: core ID */
+#define SOF_MTRACE_SLOT_GDB_STUB		0x42444700
+#define SOF_MTRACE_SLOT_TELEMETRY		0x4c455400
+#define SOF_MTRACE_SLOT_BROKEN			0x44414544
+ /* for debug and critical types */
+#define SOF_MTRACE_SLOT_CORE_MASK		GENMASK(7, 0)
+#define SOF_MTRACE_SLOT_TYPE_MASK		GENMASK(31, 8)
+
+#define DEFAULT_AGING_TIMER_PERIOD_MS		0x100
+#define DEFAULT_FIFO_FULL_TIMER_PERIOD_MS	0x1000
+
+/* ipc4 log level and source definitions for logs_priorities_mask */
+#define SOF_MTRACE_LOG_LEVEL_CRITICAL		BIT(0)
+#define SOF_MTRACE_LOG_LEVEL_ERROR		BIT(1)
+#define SOF_MTRACE_LOG_LEVEL_WARNING		BIT(2)
+#define SOF_MTRACE_LOG_LEVEL_INFO		BIT(3)
+#define SOF_MTRACE_LOG_LEVEL_VERBOSE		BIT(4)
+#define SOF_MTRACE_LOG_SOURCE_INFRA		BIT(5) /* log source 0 */
+#define SOF_MTRACE_LOG_SOURCE_HAL		BIT(6)
+#define SOF_MTRACE_LOG_SOURCE_MODULE		BIT(7)
+#define SOF_MTRACE_LOG_SOURCE_AUDIO		BIT(8)
+#define SOF_MTRACE_LOG_SOURCE_SCHEDULER		BIT(9)
+#define SOF_MTRACE_LOG_SOURCE_ULP_INFRA		BIT(10)
+#define SOF_MTRACE_LOG_SOURCE_ULP_MODULE	BIT(11)
+#define SOF_MTRACE_LOG_SOURCE_VISION		BIT(12) /* log source 7 */
+#define DEFAULT_LOGS_PRIORITIES_MASK	(SOF_MTRACE_LOG_LEVEL_CRITICAL | \
+					 SOF_MTRACE_LOG_LEVEL_ERROR |	 \
+					 SOF_MTRACE_LOG_LEVEL_WARNING |	 \
+					 SOF_MTRACE_LOG_LEVEL_INFO |	 \
+					 SOF_MTRACE_LOG_SOURCE_INFRA |	 \
+					 SOF_MTRACE_LOG_SOURCE_HAL |	 \
+					 SOF_MTRACE_LOG_SOURCE_MODULE |	 \
+					 SOF_MTRACE_LOG_SOURCE_AUDIO)
+
+struct sof_log_state_info {
+	u32 aging_timer_period;
+	u32 fifo_full_timer_period;
+	u32 enable;
+	u32 logs_priorities_mask[MAX_ALLOWED_LIBRARIES];
+} __packed;
+
+enum sof_mtrace_state {
+	SOF_MTRACE_DISABLED,
+	SOF_MTRACE_INITIALIZING,
+	SOF_MTRACE_ENABLED,
+};
+
+struct sof_mtrace_core_data {
+	struct snd_sof_dev *sdev;
+
+	int id;
+	u32 slot_offset;
+	void *log_buffer;
+	u32 host_read_ptr;
+	u32 dsp_write_ptr;
+	/* pos update IPC arrived before the slot offset is known, queried */
+	bool delayed_pos_update;
+	wait_queue_head_t trace_sleep;
+};
+
+struct sof_mtrace_priv {
+	struct snd_sof_dev *sdev;
+	enum sof_mtrace_state mtrace_state;
+	struct sof_log_state_info state_info;
+
+	struct sof_mtrace_core_data cores[];
+};
+
+static int sof_ipc4_mtrace_dfs_open(struct inode *inode, struct file *file)
+{
+	struct sof_mtrace_core_data *core_data = inode->i_private;
+	int ret;
+
+	ret = debugfs_file_get(file->f_path.dentry);
+	if (unlikely(ret))
+		return ret;
+
+	core_data->log_buffer = kmalloc(SOF_MTRACE_SLOT_SIZE, GFP_KERNEL);
+	if (!core_data->log_buffer) {
+		debugfs_file_put(file->f_path.dentry);
+		return -ENOMEM;
+	}
+
+	ret = simple_open(inode, file);
+	if (ret) {
+		kfree(core_data->log_buffer);
+		debugfs_file_put(file->f_path.dentry);
+	}
+
+	return ret;
+}
+
+static bool sof_wait_mtrace_avail(struct sof_mtrace_core_data *core_data)
+{
+	wait_queue_entry_t wait;
+
+	/* data immediately available */
+	if (core_data->host_read_ptr != core_data->dsp_write_ptr)
+		return true;
+
+	/* wait for available trace data from FW */
+	init_waitqueue_entry(&wait, current);
+	set_current_state(TASK_INTERRUPTIBLE);
+	add_wait_queue(&core_data->trace_sleep, &wait);
+
+	if (!signal_pending(current)) {
+		/* set timeout to max value, no error code */
+		schedule_timeout(MAX_SCHEDULE_TIMEOUT);
+	}
+	remove_wait_queue(&core_data->trace_sleep, &wait);
+
+	if (core_data->host_read_ptr != core_data->dsp_write_ptr)
+		return true;
+
+	return false;
+}
+
+static ssize_t sof_ipc4_mtrace_dfs_read(struct file *file, char __user *buffer,
+					size_t count, loff_t *ppos)
+{
+	struct sof_mtrace_core_data *core_data = file->private_data;
+	u32 log_buffer_offset, log_buffer_size, read_ptr, write_ptr;
+	struct snd_sof_dev *sdev = core_data->sdev;
+	struct sof_mtrace_priv *priv = sdev->fw_trace_data;
+	void *log_buffer = core_data->log_buffer;
+	loff_t lpos = *ppos;
+	u32 avail;
+	int ret;
+
+	/* check pos and count */
+	if (lpos < 0)
+		return -EINVAL;
+	if (!count || count < sizeof(avail))
+		return 0;
+
+	/* get available count based on current host offset */
+	if (!sof_wait_mtrace_avail(core_data)) {
+		/* No data available */
+		avail = 0;
+		if (copy_to_user(buffer, &avail, sizeof(avail)))
+			return -EFAULT;
+
+		return 0;
+	}
+
+	if (core_data->slot_offset == INVALID_SLOT_OFFSET)
+		return 0;
+
+	/* The log data buffer starts after the two pointer in the slot */
+	log_buffer_offset =  core_data->slot_offset + (sizeof(u32) * 2);
+	/* The log data size excludes the pointers */
+	log_buffer_size = SOF_MTRACE_SLOT_SIZE - (sizeof(u32) * 2);
+
+	read_ptr = core_data->host_read_ptr;
+	write_ptr = core_data->dsp_write_ptr;
+
+	if (read_ptr < write_ptr)
+		avail = write_ptr - read_ptr;
+	else
+		avail = log_buffer_size - read_ptr + write_ptr;
+
+	if (!avail)
+		return 0;
+
+	if (avail > log_buffer_size)
+		avail = log_buffer_size;
+
+	/* Need space for the initial u32 of the avail */
+	if (avail > count - sizeof(avail))
+		avail = count - sizeof(avail);
+
+	if (sof_debug_check_flag(SOF_DBG_PRINT_DMA_POSITION_UPDATE_LOGS))
+		dev_dbg(sdev->dev,
+			"core%d, host read: %#x, dsp write: %#x, avail: %#x\n",
+			core_data->id, read_ptr, write_ptr, avail);
+
+	if (read_ptr < write_ptr) {
+		/* Read data between read pointer and write pointer */
+		sof_mailbox_read(sdev, log_buffer_offset + read_ptr, log_buffer, avail);
+	} else {
+		/* read from read pointer to end of the slot */
+		sof_mailbox_read(sdev, log_buffer_offset + read_ptr, log_buffer,
+				 avail - write_ptr);
+		/* read from slot start to write pointer */
+		if (write_ptr)
+			sof_mailbox_read(sdev, log_buffer_offset,
+					 (u8 *)(log_buffer) + avail - write_ptr,
+					 write_ptr);
+	}
+
+	/* first write the number of bytes we have gathered */
+	ret = copy_to_user(buffer, &avail, sizeof(avail));
+	if (ret)
+		return -EFAULT;
+
+	/* Followed by the data itself */
+	ret = copy_to_user(buffer + sizeof(avail), log_buffer, avail);
+	if (ret)
+		return -EFAULT;
+
+	/* Update the host_read_ptr in the slot for this core */
+	read_ptr += avail;
+	if (read_ptr >= log_buffer_size)
+		read_ptr -= log_buffer_size;
+	sof_mailbox_write(sdev, core_data->slot_offset, &read_ptr, sizeof(read_ptr));
+
+	/* Only update the host_read_ptr if mtrace is enabled */
+	if (priv->mtrace_state != SOF_MTRACE_DISABLED)
+		core_data->host_read_ptr = read_ptr;
+
+	/*
+	 * Ask for a new buffer from user space for the next chunk, not
+	 * streaming due to the heading number of bytes value.
+	 */
+	*ppos += count;
+
+	return count;
+}
+
+static int sof_ipc4_mtrace_dfs_release(struct inode *inode, struct file *file)
+{
+	struct sof_mtrace_core_data *core_data = inode->i_private;
+
+	debugfs_file_put(file->f_path.dentry);
+
+	kfree(core_data->log_buffer);
+
+	return 0;
+}
+
+static const struct file_operations sof_dfs_mtrace_fops = {
+	.open = sof_ipc4_mtrace_dfs_open,
+	.read = sof_ipc4_mtrace_dfs_read,
+	.llseek = default_llseek,
+	.release = sof_ipc4_mtrace_dfs_release,
+
+	.owner = THIS_MODULE,
+};
+
+static ssize_t sof_ipc4_priority_mask_dfs_read(struct file *file, char __user *to,
+					       size_t count, loff_t *ppos)
+{
+	struct sof_mtrace_priv *priv = file->private_data;
+	int i, ret, offset, remaining;
+	char *buf;
+
+	/*
+	 * one entry (14 char + new line = 15):
+	 * " 0: 000001ef"
+	 *
+	 * 16 * 15 + 1 = 241
+	 */
+	buf = kzalloc(241, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	for (i = 0; i < MAX_ALLOWED_LIBRARIES; i++) {
+		offset = strlen(buf);
+		remaining = 241 - offset;
+		snprintf(buf + offset, remaining, "%2d: 0x%08x\n", i,
+			 priv->state_info.logs_priorities_mask[i]);
+	}
+
+	ret = simple_read_from_buffer(to, count, ppos, buf, strlen(buf));
+
+	kfree(buf);
+	return ret;
+}
+
+static ssize_t sof_ipc4_priority_mask_dfs_write(struct file *file,
+						const char __user *from,
+						size_t count, loff_t *ppos)
+{
+	struct sof_mtrace_priv *priv = file->private_data;
+	int id, ret;
+	char *buf;
+	u32 mask;
+
+	/*
+	 * To update Nth mask entry, write:
+	 * "N,0x1234" or "N,1234" to the debugfs file
+	 * The mask will be interpreted as hexadecimal number
+	 */
+	buf = memdup_user_nul(from, count);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
+
+	ret = sscanf(buf, "%d,0x%x", &id, &mask);
+	if (ret != 2) {
+		ret = sscanf(buf, "%d,%x", &id, &mask);
+		if (ret != 2) {
+			ret = -EINVAL;
+			goto out;
+		}
+	}
+
+	if (id >= MAX_ALLOWED_LIBRARIES) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	priv->state_info.logs_priorities_mask[id] = mask;
+	ret = count;
+
+out:
+	kfree(buf);
+	return ret;
+}
+
+static const struct file_operations sof_dfs_priority_mask_fops = {
+	.open = simple_open,
+	.read = sof_ipc4_priority_mask_dfs_read,
+	.write = sof_ipc4_priority_mask_dfs_write,
+	.llseek = default_llseek,
+
+	.owner = THIS_MODULE,
+};
+
+static int mtrace_debugfs_create(struct snd_sof_dev *sdev)
+{
+	struct sof_mtrace_priv *priv = sdev->fw_trace_data;
+	struct dentry *dfs_root;
+	char dfs_name[100];
+	int i;
+
+	dfs_root = debugfs_create_dir("mtrace", sdev->debugfs_root);
+	if (IS_ERR_OR_NULL(dfs_root))
+		return 0;
+
+	/* Create files for the logging parameters */
+	debugfs_create_u32("aging_timer_period", 0644, dfs_root,
+			   &priv->state_info.aging_timer_period);
+	debugfs_create_u32("fifo_full_timer_period", 0644, dfs_root,
+			   &priv->state_info.fifo_full_timer_period);
+	debugfs_create_file("logs_priorities_mask", 0644, dfs_root, priv,
+			    &sof_dfs_priority_mask_fops);
+
+	/* Separate log files per core */
+	for (i = 0; i < sdev->num_cores; i++) {
+		snprintf(dfs_name, sizeof(dfs_name), "core%d", i);
+		debugfs_create_file(dfs_name, 0444, dfs_root, &priv->cores[i],
+				    &sof_dfs_mtrace_fops);
+	}
+
+	return 0;
+}
+
+static int ipc4_mtrace_enable(struct snd_sof_dev *sdev)
+{
+	struct sof_mtrace_priv *priv = sdev->fw_trace_data;
+	const struct sof_ipc_ops *iops = sdev->ipc->ops;
+	struct sof_ipc4_msg msg;
+	u64 system_time;
+	ktime_t kt;
+	int ret;
+
+	if (priv->mtrace_state != SOF_MTRACE_DISABLED)
+		return 0;
+
+	msg.primary = SOF_IPC4_MSG_TARGET(SOF_IPC4_MODULE_MSG);
+	msg.primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
+	msg.primary |= SOF_IPC4_MOD_ID(SOF_IPC4_MOD_INIT_BASEFW_MOD_ID);
+	msg.primary |= SOF_IPC4_MOD_INSTANCE(SOF_IPC4_MOD_INIT_BASEFW_INSTANCE_ID);
+	msg.extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(SOF_IPC4_FW_PARAM_SYSTEM_TIME);
+
+	/* The system time is in usec, UTC, epoch is 1601-01-01 00:00:00 */
+	kt = ktime_add_us(ktime_get_real(), FW_EPOCH_DELTA * USEC_PER_SEC);
+	system_time = ktime_to_us(kt);
+	msg.data_size = sizeof(system_time);
+	msg.data_ptr = &system_time;
+	ret = iops->set_get_data(sdev, &msg, msg.data_size, true);
+	if (ret)
+		return ret;
+
+	msg.extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(SOF_IPC4_FW_PARAM_ENABLE_LOGS);
+
+	priv->state_info.enable = 1;
+
+	msg.data_size = sizeof(priv->state_info);
+	msg.data_ptr = &priv->state_info;
+
+	priv->mtrace_state = SOF_MTRACE_INITIALIZING;
+	ret = iops->set_get_data(sdev, &msg, msg.data_size, true);
+	if (ret) {
+		priv->mtrace_state = SOF_MTRACE_DISABLED;
+		return ret;
+	}
+
+	priv->mtrace_state = SOF_MTRACE_ENABLED;
+
+	return 0;
+}
+
+static void ipc4_mtrace_disable(struct snd_sof_dev *sdev)
+{
+	struct sof_mtrace_priv *priv = sdev->fw_trace_data;
+	const struct sof_ipc_ops *iops = sdev->ipc->ops;
+	struct sof_ipc4_msg msg;
+	int i;
+
+	if (priv->mtrace_state == SOF_MTRACE_DISABLED)
+		return;
+
+	msg.primary = SOF_IPC4_MSG_TARGET(SOF_IPC4_MODULE_MSG);
+	msg.primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
+	msg.primary |= SOF_IPC4_MOD_ID(SOF_IPC4_MOD_INIT_BASEFW_MOD_ID);
+	msg.primary |= SOF_IPC4_MOD_INSTANCE(SOF_IPC4_MOD_INIT_BASEFW_INSTANCE_ID);
+	msg.extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(SOF_IPC4_FW_PARAM_ENABLE_LOGS);
+
+	priv->state_info.enable = 0;
+
+	msg.data_size = sizeof(priv->state_info);
+	msg.data_ptr = &priv->state_info;
+	iops->set_get_data(sdev, &msg, msg.data_size, true);
+
+	priv->mtrace_state = SOF_MTRACE_DISABLED;
+
+	for (i = 0; i < sdev->num_cores; i++) {
+		struct sof_mtrace_core_data *core_data = &priv->cores[i];
+
+		core_data->host_read_ptr = 0;
+		core_data->dsp_write_ptr = 0;
+		wake_up(&core_data->trace_sleep);
+	}
+}
+
+/*
+ * Each DSP core logs to a dedicated slot.
+ * Parse the slot descriptors at debug_box offset to find the debug log slots
+ * and map them to cores.
+ * There are 15 slots and therefore 15 descriptors to check (MAX_MTRACE_SLOTS)
+ */
+static void sof_mtrace_find_core_slots(struct snd_sof_dev *sdev)
+{
+	struct sof_mtrace_priv *priv = sdev->fw_trace_data;
+	struct sof_mtrace_core_data *core_data;
+	u32 slot_desc_type_offset, type, core;
+	int i;
+
+	for (i = 0; i < MAX_MTRACE_SLOTS; i++) {
+		/* The type is the second u32 in the slot descriptor */
+		slot_desc_type_offset = sdev->debug_box.offset;
+		slot_desc_type_offset += SOF_MTRACE_DESCRIPTOR_SIZE * i + sizeof(u32);
+		sof_mailbox_read(sdev, slot_desc_type_offset, &type, sizeof(type));
+
+		if ((type & SOF_MTRACE_SLOT_TYPE_MASK) == SOF_MTRACE_SLOT_DEBUG_LOG) {
+			core = type & SOF_MTRACE_SLOT_CORE_MASK;
+
+			if (core >= sdev->num_cores) {
+				dev_dbg(sdev->dev, "core%u is invalid for slot%d\n",
+					core, i);
+				continue;
+			}
+
+			core_data = &priv->cores[core];
+			/*
+			 * The area reserved for descriptors have the same size
+			 * as a slot.
+			 * In other words: slot0 starts at
+			 * debug_box + SOF_MTRACE_SLOT_SIZE offset
+			 */
+			core_data->slot_offset = sdev->debug_box.offset;
+			core_data->slot_offset += SOF_MTRACE_SLOT_SIZE * (i + 1);
+			dev_dbg(sdev->dev, "slot%d is used for core%u\n", i, core);
+			if (core_data->delayed_pos_update) {
+				sof_ipc4_mtrace_update_pos(sdev, core);
+				core_data->delayed_pos_update = false;
+			}
+		} else if (type) {
+			dev_dbg(sdev->dev, "slot%d is not a log slot (%#x)\n", i, type);
+		}
+	}
+}
+
+static int ipc4_mtrace_init(struct snd_sof_dev *sdev)
+{
+	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
+	struct sof_mtrace_priv *priv;
+	int i, ret;
+
+	if (sdev->fw_trace_data) {
+		dev_err(sdev->dev, "fw_trace_data has been already allocated\n");
+		return -EBUSY;
+	}
+
+	if (!ipc4_data->mtrace_log_bytes ||
+	    ipc4_data->mtrace_type != SOF_IPC4_MTRACE_INTEL_CAVS_2) {
+		sdev->fw_trace_is_supported = false;
+		return 0;
+	}
+
+	priv = devm_kzalloc(sdev->dev, struct_size(priv, cores, sdev->num_cores),
+			    GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	sdev->fw_trace_data = priv;
+
+	/* Set initial values for mtrace parameters */
+	priv->state_info.aging_timer_period = DEFAULT_AGING_TIMER_PERIOD_MS;
+	priv->state_info.fifo_full_timer_period = DEFAULT_FIFO_FULL_TIMER_PERIOD_MS;
+	/* Only enable basefw logs initially (index 0 is always basefw) */
+	priv->state_info.logs_priorities_mask[0] = DEFAULT_LOGS_PRIORITIES_MASK;
+
+	for (i = 0; i < sdev->num_cores; i++) {
+		struct sof_mtrace_core_data *core_data = &priv->cores[i];
+
+		init_waitqueue_head(&core_data->trace_sleep);
+		core_data->sdev = sdev;
+		core_data->id = i;
+	}
+
+	ret = ipc4_mtrace_enable(sdev);
+	if (ret) {
+		/*
+		 * Mark firmware tracing as not supported and return 0 to not
+		 * block the whole audio stack
+		 */
+		sdev->fw_trace_is_supported = false;
+		dev_dbg(sdev->dev, "initialization failed, fw tracing is disabled\n");
+		return 0;
+	}
+
+	sof_mtrace_find_core_slots(sdev);
+
+	ret = mtrace_debugfs_create(sdev);
+	if (ret)
+		ipc4_mtrace_disable(sdev);
+
+	return ret;
+}
+
+static void ipc4_mtrace_free(struct snd_sof_dev *sdev)
+{
+	ipc4_mtrace_disable(sdev);
+}
+
+int sof_ipc4_mtrace_update_pos(struct snd_sof_dev *sdev, int core)
+{
+	struct sof_mtrace_priv *priv = sdev->fw_trace_data;
+	struct sof_mtrace_core_data *core_data;
+
+	if (!sdev->fw_trace_is_supported ||
+	    priv->mtrace_state == SOF_MTRACE_DISABLED)
+		return 0;
+
+	if (core >= sdev->num_cores)
+		return -EINVAL;
+
+	core_data = &priv->cores[core];
+
+	if (core_data->slot_offset == INVALID_SLOT_OFFSET) {
+		core_data->delayed_pos_update = true;
+		return 0;
+	}
+
+	/* Read out the dsp_write_ptr from the slot for this core */
+	sof_mailbox_read(sdev, core_data->slot_offset + sizeof(u32),
+			 &core_data->dsp_write_ptr, 4);
+	core_data->dsp_write_ptr -= core_data->dsp_write_ptr % 4;
+
+	if (sof_debug_check_flag(SOF_DBG_PRINT_DMA_POSITION_UPDATE_LOGS))
+		dev_dbg(sdev->dev, "core%d, host read: %#x, dsp write: %#x",
+			core, core_data->host_read_ptr, core_data->dsp_write_ptr);
+
+	wake_up(&core_data->trace_sleep);
+
+	return 0;
+}
+
+static int ipc4_mtrace_resume(struct snd_sof_dev *sdev)
+{
+	return ipc4_mtrace_enable(sdev);
+}
+
+static void ipc4_mtrace_suspend(struct snd_sof_dev *sdev, pm_message_t pm_state)
+{
+	ipc4_mtrace_disable(sdev);
+}
+
+const struct sof_ipc_fw_tracing_ops ipc4_mtrace_ops = {
+	.init = ipc4_mtrace_init,
+	.free = ipc4_mtrace_free,
+	.suspend = ipc4_mtrace_suspend,
+	.resume = ipc4_mtrace_resume,
+};
diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index 4599dd95f17d..e3b8484a2f1f 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -17,18 +17,29 @@
 #define SOF_IPC4_OUTBOX_WINDOW_IDX	1
 #define SOF_IPC4_DEBUG_WINDOW_IDX	2
 
+enum sof_ipc4_mtrace_type {
+	SOF_IPC4_MTRACE_NOT_AVAILABLE = 0,
+	SOF_IPC4_MTRACE_INTEL_CAVS_1_5,
+	SOF_IPC4_MTRACE_INTEL_CAVS_1_8,
+	SOF_IPC4_MTRACE_INTEL_CAVS_2,
+};
+
 /**
  * struct sof_ipc4_fw_data - IPC4-specific data
  * @manifest_fw_hdr_offset: FW header offset in the manifest
  * @num_fw_modules : Number of modules in base FW
  * @fw_modules: Array of base FW modules
  * @nhlt: NHLT table either from the BIOS or the topology manifest
+ * @mtrace_type: mtrace type supported on the booted platform
+ * @mtrace_log_bytes: log bytes as reported by the firmware via fw_config reply
  */
 struct sof_ipc4_fw_data {
 	u32 manifest_fw_hdr_offset;
 	int num_fw_modules;
 	void *fw_modules;
 	void *nhlt;
+	enum sof_ipc4_mtrace_type mtrace_type;
+	u32 mtrace_log_bytes;
 };
 
 /**
@@ -49,7 +60,8 @@ extern const struct sof_ipc_fw_loader_ops ipc4_loader_ops;
 extern const struct sof_ipc_tplg_ops ipc4_tplg_ops;
 extern const struct sof_ipc_tplg_control_ops tplg_ipc4_control_ops;
 extern const struct sof_ipc_pcm_ops ipc4_pcm_ops;
+extern const struct sof_ipc_fw_tracing_ops ipc4_mtrace_ops;
 
 int sof_ipc4_set_pipeline_state(struct snd_sof_dev *sdev, u32 id, u32 state);
-
+int sof_ipc4_mtrace_update_pos(struct snd_sof_dev *sdev, int core);
 #endif
diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index 4f7ec18ae7fa..0d830020556d 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -589,6 +589,9 @@ static void sof_ipc4_rx_msg(struct snd_sof_dev *sdev)
 	case SOF_IPC4_NOTIFY_RESOURCE_EVENT:
 		data_size = sizeof(struct sof_ipc4_notify_resource_data);
 		break;
+	case SOF_IPC4_NOTIFY_LOG_BUFFER_STATUS:
+		sof_ipc4_mtrace_update_pos(sdev, SOF_IPC4_LOG_CORE_GET(ipc4_msg->primary));
+		break;
 	default:
 		dev_dbg(sdev->dev, "Unhandled DSP message: %#x|%#x\n",
 			ipc4_msg->primary, ipc4_msg->extension);
@@ -662,4 +665,5 @@ const struct sof_ipc_ops ipc4_ops = {
 	.fw_loader = &ipc4_loader_ops,
 	.tplg = &ipc4_tplg_ops,
 	.pcm = &ipc4_pcm_ops,
+	.fw_tracing = &ipc4_mtrace_ops,
 };
-- 
2.37.3

