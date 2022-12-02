Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 308B064091E
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 16:15:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1B441845;
	Fri,  2 Dec 2022 16:14:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1B441845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669994131;
	bh=SYmMvv2QSpD8R3ylgRF7oDI7zKg81poDaVjC09Xb7Xk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LkhvMfjnhDGiDGkyQWaUJjW6qBakWxksR5ISdz0WGdi5lDdhKWktyomelP/MPnrye
	 kRcaxLVx4G8g1XBr7V3JYIfZzaZn5l0mIrFW8sJvY55hBoP0qwWCkw8tTWniXKte+e
	 hkFlK1/UoKKDLfklgA8WeHGCdXGyEXqktsrUHj1Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FEC1F805C0;
	Fri,  2 Dec 2022 16:12:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F82DF805C0; Fri,  2 Dec 2022 16:12:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54EDBF805B3
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 16:12:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54EDBF805B3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="A02xpUE1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669993923; x=1701529923;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SYmMvv2QSpD8R3ylgRF7oDI7zKg81poDaVjC09Xb7Xk=;
 b=A02xpUE1zV5f/Md4xO1b0HEbkDWOJ8y1FgDHXM6fEs5BmRKrdmmdly3m
 6HjFfL5lD3SNUH+Zr5Hcfy+oClDpBn0vR42nPBXTozd04oS9Sn2hrpmb+
 UsCaihtK4CBDhzQ3b7GCwnvXzDp4RChSHi5jIIG3OMh6KcQkXPiLDFY2O
 MyvHjSdUVLoE/ljt1bkHAfJbBZavk2lJ4ebhac5KTXypr0DhUgBTOG78Y
 qsQCL5EYwPpBjG4S8eEeQmNMfPTfu7R+DsUHa8kaBFFS+FLpUCofFmhpx
 t2/qkbJgLO1ZERqbNxv77sGURq6Q9C6X41XZvMkfxjUW/YYSlRUwOSm76 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="402251833"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="402251833"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 07:12:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="708504759"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="708504759"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 02 Dec 2022 07:11:59 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 13/16] ASoC: Intel: avs: Probing and firmware tracing over
 debugfs
Date: Fri,  2 Dec 2022 16:28:38 +0100
Message-Id: <20221202152841.672536-14-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221202152841.672536-1-cezary.rojewski@intel.com>
References: <20221202152841.672536-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Define debugfs subdirectory delegated for IPC communication with DSP.
Input format: uint,uint,(...) which are later translated into DWORDS
sequence and further into instances of struct of interest given the IPC
type.

For Extractor probes, following have been enabled:
- PROBE_POINT_ADD (echo <..> probe_points)
- PROBE_POINT_REMOVE (echo <..> probe_points_remove)
- PROBE_POINT_INFO (cat probe_points)

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/avs.h     |   7 +
 sound/soc/intel/avs/core.c    |   2 +
 sound/soc/intel/avs/debugfs.c | 326 ++++++++++++++++++++++++++++++++++
 3 files changed, 335 insertions(+)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index e19d8d89455d..d7fccdcb9c16 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -144,6 +144,7 @@ struct avs_dev {
 	u32 aging_timer_period;
 	u32 fifo_full_timer_period;
 	u32 logged_resources;	/* context dependent: core or library */
+	struct dentry *debugfs_root;
 	/* probes */
 	struct hdac_ext_stream *extractor;
 	unsigned int num_probe_streams;
@@ -378,6 +379,9 @@ void avs_dump_fw_log(struct avs_dev *adev, const void __iomem *src, unsigned int
 void avs_dump_fw_log_wakeup(struct avs_dev *adev, const void __iomem *src, unsigned int len);
 
 int avs_probe_platform_register(struct avs_dev *adev, const char *name);
+
+void avs_debugfs_init(struct avs_dev *adev);
+void avs_debugfs_exit(struct avs_dev *adev);
 #else
 #define AVS_SET_ENABLE_LOGS_OP(name)
 
@@ -399,6 +403,9 @@ static inline int avs_probe_platform_register(struct avs_dev *adev, const char *
 {
 	return 0;
 }
+
+static inline void avs_debugfs_init(struct avs_dev *adev) { }
+static inline void avs_debugfs_exit(struct avs_dev *adev) { }
 #endif
 
 #endif /* __SOUND_SOC_INTEL_AVS_H */
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index f7bc06404dbc..2ca24273c491 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -214,6 +214,7 @@ static void avs_hda_probe_work(struct work_struct *work)
 	adev->nhlt = intel_nhlt_init(adev->dev);
 	if (!adev->nhlt)
 		dev_info(bus->dev, "platform has no NHLT\n");
+	avs_debugfs_init(adev);
 
 	avs_register_all_boards(adev);
 
@@ -491,6 +492,7 @@ static void avs_pci_remove(struct pci_dev *pci)
 
 	avs_unregister_all_boards(adev);
 
+	avs_debugfs_exit(adev);
 	if (adev->nhlt)
 		intel_nhlt_free(adev->nhlt);
 
diff --git a/sound/soc/intel/avs/debugfs.c b/sound/soc/intel/avs/debugfs.c
index 78705bcb09fb..678572ee6b9d 100644
--- a/sound/soc/intel/avs/debugfs.c
+++ b/sound/soc/intel/avs/debugfs.c
@@ -9,7 +9,10 @@
 #include <linux/debugfs.h>
 #include <linux/kfifo.h>
 #include <linux/wait.h>
+#include <linux/sched/signal.h>
+#include <sound/soc.h>
 #include "avs.h"
+#include "messages.h"
 
 static unsigned int __kfifo_fromio(struct kfifo *fifo, const void __iomem *src, unsigned int len)
 {
@@ -44,3 +47,326 @@ void avs_dump_fw_log_wakeup(struct avs_dev *adev, const void __iomem *src, unsig
 	avs_dump_fw_log(adev, src, len);
 	wake_up(&adev->trace_waitq);
 }
+
+static ssize_t probe_points_read(struct file *file, char __user *to, size_t count, loff_t *ppos)
+{
+	struct avs_dev *adev = file->private_data;
+	struct avs_probe_point_desc *desc;
+	size_t num_desc, len = 0;
+	char *buf;
+	int i, ret;
+
+	/* Prevent chaining, send and dump IPC value just once. */
+	if (*ppos)
+		return 0;
+
+	buf = kzalloc(PAGE_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = avs_ipc_probe_get_points(adev, &desc, &num_desc);
+	if (ret) {
+		ret = AVS_IPC_RET(ret);
+		goto exit;
+	}
+
+	for (i = 0; i < num_desc; i++) {
+		ret = snprintf(buf + len, PAGE_SIZE - len,
+			       "Id: %#010x  Purpose: %d  Node id: %#x\n",
+			       desc[i].id.value, desc[i].purpose, desc[i].node_id.val);
+		if (ret < 0)
+			goto free_desc;
+		len += ret;
+	}
+
+	ret = simple_read_from_buffer(to, count, ppos, buf, len);
+free_desc:
+	kfree(desc);
+exit:
+	kfree(buf);
+	return ret;
+}
+
+static ssize_t probe_points_write(struct file *file, const char __user *from, size_t count,
+				  loff_t *ppos)
+{
+	struct avs_dev *adev = file->private_data;
+	struct avs_probe_point_desc *desc;
+	u32 *array, num_elems;
+	size_t bytes;
+	int ret;
+
+	ret = parse_int_array_user(from, count, (int **)&array);
+	if (ret < 0)
+		return ret;
+
+	num_elems = *array;
+	bytes = sizeof(*array) * num_elems;
+	if (bytes % sizeof(*desc)) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	desc = (struct avs_probe_point_desc *)&array[1];
+	ret = avs_ipc_probe_connect_points(adev, desc, bytes / sizeof(*desc));
+	if (ret)
+		ret = AVS_IPC_RET(ret);
+	else
+		ret = count;
+exit:
+	kfree(array);
+	return ret;
+}
+
+static const struct file_operations probe_points_fops = {
+	.open = simple_open,
+	.read = probe_points_read,
+	.write = probe_points_write,
+	.llseek = no_llseek,
+};
+
+static ssize_t probe_points_disconnect_write(struct file *file, const char __user *from,
+					     size_t count, loff_t *ppos)
+{
+	struct avs_dev *adev = file->private_data;
+	union avs_probe_point_id *id;
+	u32 *array, num_elems;
+	size_t bytes;
+	int ret;
+
+	ret = parse_int_array_user(from, count, (int **)&array);
+	if (ret < 0)
+		return ret;
+
+	num_elems = *array;
+	bytes = sizeof(*array) * num_elems;
+	if (bytes % sizeof(*id)) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	id = (union avs_probe_point_id *)&array[1];
+	ret = avs_ipc_probe_disconnect_points(adev, id, bytes / sizeof(*id));
+	if (ret)
+		ret = AVS_IPC_RET(ret);
+	else
+		ret = count;
+exit:
+	kfree(array);
+	return ret;
+}
+
+static const struct file_operations probe_points_disconnect_fops = {
+	.open = simple_open,
+	.write = probe_points_disconnect_write,
+	.llseek = default_llseek,
+};
+
+static ssize_t strace_read(struct file *file, char __user *to, size_t count, loff_t *ppos)
+{
+	struct avs_dev *adev = file->private_data;
+	struct kfifo *fifo = &adev->trace_fifo;
+	unsigned int copied;
+
+	if (kfifo_is_empty(fifo)) {
+		DEFINE_WAIT(wait);
+
+		prepare_to_wait(&adev->trace_waitq, &wait, TASK_INTERRUPTIBLE);
+		if (!signal_pending(current))
+			schedule();
+		finish_wait(&adev->trace_waitq, &wait);
+	}
+
+	if (kfifo_to_user(fifo, to, count, &copied))
+		return -EFAULT;
+	*ppos += copied;
+	return copied;
+}
+
+static int strace_open(struct inode *inode, struct file *file)
+{
+	struct avs_dev *adev = inode->i_private;
+	int ret;
+
+	if (kfifo_initialized(&adev->trace_fifo))
+		return -EBUSY;
+
+	ret = kfifo_alloc(&adev->trace_fifo, PAGE_SIZE, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+
+	file->private_data = adev;
+	return 0;
+}
+
+static int strace_release(struct inode *inode, struct file *file)
+{
+	struct avs_dev *adev = file->private_data;
+	unsigned long flags;
+
+	spin_lock_irqsave(&adev->trace_lock, flags);
+	kfifo_free(&adev->trace_fifo);
+	spin_unlock_irqrestore(&adev->trace_lock, flags);
+
+	return 0;
+}
+
+static const struct file_operations strace_fops = {
+	.llseek = default_llseek,
+	.read = strace_read,
+	.open = strace_open,
+	.release = strace_release,
+};
+
+#define DISABLE_TIMERS	UINT_MAX
+
+static int enable_logs(struct avs_dev *adev, u32 resource_mask, u32 *priorities)
+{
+	int ret;
+
+	/* Logging demands D0i0 state from DSP. */
+	if (!adev->logged_resources) {
+		pm_runtime_get_sync(adev->dev);
+
+		ret = avs_dsp_disable_d0ix(adev);
+		if (ret)
+			goto err_d0ix;
+	}
+
+	ret = avs_ipc_set_system_time(adev);
+	if (ret && ret != AVS_IPC_NOT_SUPPORTED) {
+		ret = AVS_IPC_RET(ret);
+		goto err_ipc;
+	}
+
+	ret = avs_dsp_op(adev, enable_logs, AVS_LOG_ENABLE, adev->aging_timer_period,
+			 adev->fifo_full_timer_period, resource_mask, priorities);
+	if (ret)
+		goto err_ipc;
+
+	adev->logged_resources |= resource_mask;
+	return 0;
+
+err_ipc:
+	if (!adev->logged_resources) {
+		avs_dsp_enable_d0ix(adev);
+err_d0ix:
+		pm_runtime_mark_last_busy(adev->dev);
+		pm_runtime_put_autosuspend(adev->dev);
+	}
+
+	return ret;
+}
+
+static int disable_logs(struct avs_dev *adev, u32 resource_mask)
+{
+	int ret;
+
+	/* Check if there's anything to do. */
+	if (!adev->logged_resources)
+		return 0;
+
+	ret = avs_dsp_op(adev, enable_logs, AVS_LOG_DISABLE, DISABLE_TIMERS, DISABLE_TIMERS,
+			 resource_mask, NULL);
+
+	/*
+	 * If IPC fails causing recovery, logged_resources is already zero
+	 * so unsetting bits is still safe.
+	 */
+	adev->logged_resources &= ~resource_mask;
+
+	/* If that's the last resource, allow for D3. */
+	if (!adev->logged_resources) {
+		avs_dsp_enable_d0ix(adev);
+		pm_runtime_mark_last_busy(adev->dev);
+		pm_runtime_put_autosuspend(adev->dev);
+	}
+
+	return ret;
+}
+
+static ssize_t trace_control_read(struct file *file, char __user *to, size_t count, loff_t *ppos)
+{
+	struct avs_dev *adev = file->private_data;
+	char buf[64];
+	int len;
+
+	len = snprintf(buf, sizeof(buf), "0x%08x\n", adev->logged_resources);
+
+	return simple_read_from_buffer(to, count, ppos, buf, len);
+}
+
+static ssize_t trace_control_write(struct file *file, const char __user *from, size_t count,
+				   loff_t *ppos)
+{
+	struct avs_dev *adev = file->private_data;
+	u32 *array, num_elems;
+	u32 resource_mask;
+	int ret;
+
+	ret = parse_int_array_user(from, count, (int **)&array);
+	if (ret < 0)
+		return ret;
+
+	num_elems = *array;
+	resource_mask = array[1];
+
+	/*
+	 * Disable if just resource mask is provided - no log priority flags.
+	 *
+	 * Enable input format:   mask, prio1, .., prioN
+	 * Where 'N' equals number of bits set in the 'mask'.
+	 */
+	if (num_elems == 1) {
+		ret = disable_logs(adev, resource_mask);
+	} else {
+		if (num_elems != (hweight_long(resource_mask) + 1)) {
+			ret = -EINVAL;
+			goto free_array;
+		}
+
+		ret = enable_logs(adev, resource_mask, &array[2]);
+	}
+
+	if (!ret)
+		ret = count;
+free_array:
+	kfree(array);
+	return ret;
+}
+
+static const struct file_operations trace_control_fops = {
+	.llseek = default_llseek,
+	.read = trace_control_read,
+	.write = trace_control_write,
+	.open = simple_open,
+};
+
+void avs_debugfs_init(struct avs_dev *adev)
+{
+	init_waitqueue_head(&adev->trace_waitq);
+	spin_lock_init(&adev->trace_lock);
+
+	adev->debugfs_root = debugfs_create_dir("avs", snd_soc_debugfs_root);
+
+	/* Initialize timer periods with recommended defaults. */
+	adev->aging_timer_period = 10;
+	adev->fifo_full_timer_period = 10;
+
+	debugfs_create_file("strace", 0444, adev->debugfs_root, adev, &strace_fops);
+	debugfs_create_file("trace_control", 0644, adev->debugfs_root, adev, &trace_control_fops);
+
+	debugfs_create_u32("trace_aging_period", 0644, adev->debugfs_root,
+			   &adev->aging_timer_period);
+	debugfs_create_u32("trace_fifo_full_period", 0644, adev->debugfs_root,
+			   &adev->fifo_full_timer_period);
+
+	debugfs_create_file("probe_points", 0644, adev->debugfs_root, adev, &probe_points_fops);
+	debugfs_create_file("probe_points_disconnect", 0200, adev->debugfs_root, adev,
+			    &probe_points_disconnect_fops);
+}
+
+void avs_debugfs_exit(struct avs_dev *adev)
+{
+	debugfs_remove_recursive(adev->debugfs_root);
+}
-- 
2.25.1

