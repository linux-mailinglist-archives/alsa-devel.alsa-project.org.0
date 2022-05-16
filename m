Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE6952828F
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 12:50:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5653B168B;
	Mon, 16 May 2022 12:49:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5653B168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652698205;
	bh=1kNnH+7BxZ6e/P4QbUKV5n8cQdSuDxedzb5TjYetAAk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FVHVt70a34K+zwFQHa6RMwGzFhx1OVzNMtwTYchEO1iTBot21CRFB9BTTE3pjfaCc
	 7spB+n7lETCmK7756mTFrTL71oqewd760j+tlW8tHo6ocm4LaG2SDcyGK/TTOJoZ9F
	 C9HMoZBdFFksHu0JaqknY16c0JKzOke9aOqZfuCs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C650CF8052E;
	Mon, 16 May 2022 12:47:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4D30F80525; Mon, 16 May 2022 12:47:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1996F8014B
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 12:47:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1996F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lFRCGT0n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652698047; x=1684234047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1kNnH+7BxZ6e/P4QbUKV5n8cQdSuDxedzb5TjYetAAk=;
 b=lFRCGT0nAFKnxeMi4HMdA6ACj8imPXqH/Z+eumnJE3pq5p2gwn9RwKuY
 vII4viOtkRNDrzGerk9SPfvIlTWBSfi8EPufvyftOfNxjqJ/ZV2AcEYfe
 Wgncgrq7J5gJo81bl0U0hp2EWTyEXV1kNPHIqvCypOVwuSQ93KxDL163E
 SYjlutYN7BcDzc/y7LJNA4pUEqjrVSAuxH3NORlpXjCtQ82VXI5owVbRE
 /rowcB2ZdDYt17UXDy28zDaVsNqCuFDdsZ4AK9kXDJLGQcBS/W1opdw1x
 4HABjRa3GxzTctAs+xsPMkU5Yw8WfbHoqCNKZuCfiyRe7GXcsO9pQHvEv Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="333853246"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="333853246"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 03:46:55 -0700
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="596459795"
Received: from afialcko-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.51.55])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 03:46:52 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com,
 AjitKumar.Pandey@amd.com
Subject: [PATCH 3/8] ASoC: SOF: Clone the trace code to ipc3-dtrace as
 fw_tracing implementation
Date: Mon, 16 May 2022 13:47:06 +0300
Message-Id: <20220516104711.26115-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516104711.26115-1-peter.ujfalusi@linux.intel.com>
References: <20220516104711.26115-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

The existing trace.c file is implementing the IPC3 dma-trace support.

Clone the existing code with prefix fixes as ipc3 fw_tracing
implementation to be used when the core is converted to use generic ops
for firmware tracing.

Drop the dual licensing of the content as the implementation is based on
debugfs.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/Makefile      |   1 +
 sound/soc/sof/ipc3-dtrace.c | 605 ++++++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc3-priv.h   |   5 +
 sound/soc/sof/ipc3.c        |   1 +
 4 files changed, 612 insertions(+)
 create mode 100644 sound/soc/sof/ipc3-dtrace.c

diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 8a79f03207fe..92b5e83601be 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -3,6 +3,7 @@
 snd-sof-objs := core.o ops.o loader.o ipc.o pcm.o pm.o debug.o topology.o\
 		control.o trace.o iomem-utils.o sof-audio.o stream-ipc.o\
 		ipc3-topology.o ipc3-control.o ipc3.o ipc3-pcm.o ipc3-loader.o\
+		ipc3-dtrace.o\
 		ipc4.o ipc4-loader.o
 ifneq ($(CONFIG_SND_SOC_SOF_CLIENT),)
 snd-sof-objs += sof-client.o
diff --git a/sound/soc/sof/ipc3-dtrace.c b/sound/soc/sof/ipc3-dtrace.c
new file mode 100644
index 000000000000..0bc3ad586d23
--- /dev/null
+++ b/sound/soc/sof/ipc3-dtrace.c
@@ -0,0 +1,605 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2022 Intel Corporation. All rights reserved.
+//
+// Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
+
+#include <linux/debugfs.h>
+#include <linux/sched/signal.h>
+#include "sof-priv.h"
+#include "sof-audio.h"
+#include "ops.h"
+#include "sof-utils.h"
+#include "ipc3-priv.h"
+
+#define TRACE_FILTER_ELEMENTS_PER_ENTRY 4
+#define TRACE_FILTER_MAX_CONFIG_STRING_LENGTH 1024
+
+static int trace_filter_append_elem(struct snd_sof_dev *sdev, u32 key, u32 value,
+				    struct sof_ipc_trace_filter_elem *elem_list,
+				    int capacity, int *counter)
+{
+	if (*counter >= capacity)
+		return -ENOMEM;
+
+	elem_list[*counter].key = key;
+	elem_list[*counter].value = value;
+	++*counter;
+
+	return 0;
+}
+
+static int trace_filter_parse_entry(struct snd_sof_dev *sdev, const char *line,
+				    struct sof_ipc_trace_filter_elem *elem,
+				    int capacity, int *counter)
+{
+	int log_level, pipe_id, comp_id, read, ret;
+	int len = strlen(line);
+	int cnt = *counter;
+	u32 uuid_id;
+
+	/* ignore empty content */
+	ret = sscanf(line, " %n", &read);
+	if (!ret && read == len)
+		return len;
+
+	ret = sscanf(line, " %d %x %d %d %n", &log_level, &uuid_id, &pipe_id, &comp_id, &read);
+	if (ret != TRACE_FILTER_ELEMENTS_PER_ENTRY || read != len) {
+		dev_err(sdev->dev, "Invalid trace filter entry '%s'\n", line);
+		return -EINVAL;
+	}
+
+	if (uuid_id > 0) {
+		ret = trace_filter_append_elem(sdev, SOF_IPC_TRACE_FILTER_ELEM_BY_UUID,
+					       uuid_id, elem, capacity, &cnt);
+		if (ret)
+			return ret;
+	}
+	if (pipe_id >= 0) {
+		ret = trace_filter_append_elem(sdev, SOF_IPC_TRACE_FILTER_ELEM_BY_PIPE,
+					       pipe_id, elem, capacity, &cnt);
+		if (ret)
+			return ret;
+	}
+	if (comp_id >= 0) {
+		ret = trace_filter_append_elem(sdev, SOF_IPC_TRACE_FILTER_ELEM_BY_COMP,
+					       comp_id, elem, capacity, &cnt);
+		if (ret)
+			return ret;
+	}
+
+	ret = trace_filter_append_elem(sdev, SOF_IPC_TRACE_FILTER_ELEM_SET_LEVEL |
+				       SOF_IPC_TRACE_FILTER_ELEM_FIN,
+				       log_level, elem, capacity, &cnt);
+	if (ret)
+		return ret;
+
+	/* update counter only when parsing whole entry passed */
+	*counter = cnt;
+
+	return len;
+}
+
+static int trace_filter_parse(struct snd_sof_dev *sdev, char *string,
+			      int *out_elem_cnt,
+			      struct sof_ipc_trace_filter_elem **out)
+{
+	static const char entry_delimiter[] = ";";
+	char *entry = string;
+	int capacity = 0;
+	int entry_len;
+	int cnt = 0;
+
+	/*
+	 * Each entry contains at least 1, up to TRACE_FILTER_ELEMENTS_PER_ENTRY
+	 * IPC elements, depending on content. Calculate IPC elements capacity
+	 * for the input string where each element is set.
+	 */
+	while (entry) {
+		capacity += TRACE_FILTER_ELEMENTS_PER_ENTRY;
+		entry = strchr(entry + 1, entry_delimiter[0]);
+	}
+	*out = kmalloc(capacity * sizeof(**out), GFP_KERNEL);
+	if (!*out)
+		return -ENOMEM;
+
+	/* split input string by ';', and parse each entry separately in trace_filter_parse_entry */
+	while ((entry = strsep(&string, entry_delimiter))) {
+		entry_len = trace_filter_parse_entry(sdev, entry, *out, capacity, &cnt);
+		if (entry_len < 0) {
+			dev_err(sdev->dev,
+				"Parsing filter entry '%s' failed with %d\n",
+				entry, entry_len);
+			return -EINVAL;
+		}
+	}
+
+	*out_elem_cnt = cnt;
+
+	return 0;
+}
+
+static int ipc3_trace_update_filter(struct snd_sof_dev *sdev, int num_elems,
+				    struct sof_ipc_trace_filter_elem *elems)
+{
+	struct sof_ipc_trace_filter *msg;
+	struct sof_ipc_reply reply;
+	size_t size;
+	int ret;
+
+	size = struct_size(msg, elems, num_elems);
+	if (size > SOF_IPC_MSG_MAX_SIZE)
+		return -EINVAL;
+
+	msg = kmalloc(size, GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+
+	msg->hdr.size = size;
+	msg->hdr.cmd = SOF_IPC_GLB_TRACE_MSG | SOF_IPC_TRACE_FILTER_UPDATE;
+	msg->elem_cnt = num_elems;
+	memcpy(&msg->elems[0], elems, num_elems * sizeof(*elems));
+
+	ret = pm_runtime_get_sync(sdev->dev);
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_noidle(sdev->dev);
+		dev_err(sdev->dev, "enabling device failed: %d\n", ret);
+		goto error;
+	}
+	ret = sof_ipc_tx_message(sdev->ipc, msg, msg->hdr.size, &reply, sizeof(reply));
+	pm_runtime_mark_last_busy(sdev->dev);
+	pm_runtime_put_autosuspend(sdev->dev);
+
+error:
+	kfree(msg);
+	return ret ? ret : reply.error;
+}
+
+static ssize_t dfsentry_trace_filter_write(struct file *file, const char __user *from,
+					   size_t count, loff_t *ppos)
+{
+	struct snd_sof_dfsentry *dfse = file->private_data;
+	struct sof_ipc_trace_filter_elem *elems = NULL;
+	struct snd_sof_dev *sdev = dfse->sdev;
+	loff_t pos = 0;
+	int num_elems;
+	char *string;
+	int ret;
+
+	if (count > TRACE_FILTER_MAX_CONFIG_STRING_LENGTH) {
+		dev_err(sdev->dev, "%s too long input, %zu > %d\n", __func__, count,
+			TRACE_FILTER_MAX_CONFIG_STRING_LENGTH);
+		return -EINVAL;
+	}
+
+	string = kmalloc(count + 1, GFP_KERNEL);
+	if (!string)
+		return -ENOMEM;
+
+	/* assert null termination */
+	string[count] = 0;
+	ret = simple_write_to_buffer(string, count, &pos, from, count);
+	if (ret < 0)
+		goto error;
+
+	ret = trace_filter_parse(sdev, string, &num_elems, &elems);
+	if (ret < 0)
+		goto error;
+
+	if (num_elems) {
+		ret = ipc3_trace_update_filter(sdev, num_elems, elems);
+		if (ret < 0) {
+			dev_err(sdev->dev, "Filter update failed: %d\n", ret);
+			goto error;
+		}
+	}
+	ret = count;
+error:
+	kfree(string);
+	kfree(elems);
+	return ret;
+}
+
+static const struct file_operations sof_dfs_trace_filter_fops = {
+	.open = simple_open,
+	.write = dfsentry_trace_filter_write,
+	.llseek = default_llseek,
+};
+
+static int debugfs_create_trace_filter(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_dfsentry *dfse;
+
+	dfse = devm_kzalloc(sdev->dev, sizeof(*dfse), GFP_KERNEL);
+	if (!dfse)
+		return -ENOMEM;
+
+	dfse->sdev = sdev;
+	dfse->type = SOF_DFSENTRY_TYPE_BUF;
+
+	debugfs_create_file("filter", 0200, sdev->debugfs_root, dfse,
+			    &sof_dfs_trace_filter_fops);
+	/* add to dfsentry list */
+	list_add(&dfse->list, &sdev->dfsentry_list);
+
+	return 0;
+}
+
+static size_t sof_dtrace_avail(struct snd_sof_dev *sdev,
+			       loff_t pos, size_t buffer_size)
+{
+	loff_t host_offset = READ_ONCE(sdev->host_offset);
+
+	/*
+	 * If host offset is less than local pos, it means write pointer of
+	 * host DMA buffer has been wrapped. We should output the trace data
+	 * at the end of host DMA buffer at first.
+	 */
+	if (host_offset < pos)
+		return buffer_size - pos;
+
+	/* If there is available trace data now, it is unnecessary to wait. */
+	if (host_offset > pos)
+		return host_offset - pos;
+
+	return 0;
+}
+
+static size_t sof_wait_dtrace_avail(struct snd_sof_dev *sdev, loff_t pos,
+				    size_t buffer_size)
+{
+	wait_queue_entry_t wait;
+	size_t ret = sof_dtrace_avail(sdev, pos, buffer_size);
+
+	/* data immediately available */
+	if (ret)
+		return ret;
+
+	if (sdev->dtrace_state != SOF_DTRACE_ENABLED && sdev->dtrace_draining) {
+		/*
+		 * tracing has ended and all traces have been
+		 * read by client, return EOF
+		 */
+		sdev->dtrace_draining = false;
+		return 0;
+	}
+
+	/* wait for available trace data from FW */
+	init_waitqueue_entry(&wait, current);
+	set_current_state(TASK_INTERRUPTIBLE);
+	add_wait_queue(&sdev->trace_sleep, &wait);
+
+	if (!signal_pending(current)) {
+		/* set timeout to max value, no error code */
+		schedule_timeout(MAX_SCHEDULE_TIMEOUT);
+	}
+	remove_wait_queue(&sdev->trace_sleep, &wait);
+
+	return sof_dtrace_avail(sdev, pos, buffer_size);
+}
+
+static ssize_t dfsentry_dtrace_read(struct file *file, char __user *buffer,
+				    size_t count, loff_t *ppos)
+{
+	struct snd_sof_dfsentry *dfse = file->private_data;
+	struct snd_sof_dev *sdev = dfse->sdev;
+	unsigned long rem;
+	loff_t lpos = *ppos;
+	size_t avail, buffer_size = dfse->size;
+	u64 lpos_64;
+
+	/* make sure we know about any failures on the DSP side */
+	sdev->dtrace_error = false;
+
+	/* check pos and count */
+	if (lpos < 0)
+		return -EINVAL;
+	if (!count)
+		return 0;
+
+	/* check for buffer wrap and count overflow */
+	lpos_64 = lpos;
+	lpos = do_div(lpos_64, buffer_size);
+
+	/* get available count based on current host offset */
+	avail = sof_wait_dtrace_avail(sdev, lpos, buffer_size);
+	if (sdev->dtrace_error) {
+		dev_err(sdev->dev, "trace IO error\n");
+		return -EIO;
+	}
+
+	/* make sure count is <= avail */
+	if (count > avail)
+		count = avail;
+
+	/*
+	 * make sure that all trace data is available for the CPU as the trace
+	 * data buffer might be allocated from non consistent memory.
+	 * Note: snd_dma_buffer_sync() is called for normal audio playback and
+	 *	 capture streams also.
+	 */
+	snd_dma_buffer_sync(&sdev->dmatb, SNDRV_DMA_SYNC_CPU);
+	/* copy available trace data to debugfs */
+	rem = copy_to_user(buffer, ((u8 *)(dfse->buf) + lpos), count);
+	if (rem)
+		return -EFAULT;
+
+	*ppos += count;
+
+	/* move debugfs reading position */
+	return count;
+}
+
+static int dfsentry_dtrace_release(struct inode *inode, struct file *file)
+{
+	struct snd_sof_dfsentry *dfse = inode->i_private;
+	struct snd_sof_dev *sdev = dfse->sdev;
+
+	/* avoid duplicate traces at next open */
+	if (sdev->dtrace_state != SOF_DTRACE_ENABLED)
+		sdev->host_offset = 0;
+
+	return 0;
+}
+
+static const struct file_operations sof_dfs_dtrace_fops = {
+	.open = simple_open,
+	.read = dfsentry_dtrace_read,
+	.llseek = default_llseek,
+	.release = dfsentry_dtrace_release,
+};
+
+static int debugfs_create_dtrace(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_dfsentry *dfse;
+	int ret;
+
+	if (!sdev)
+		return -EINVAL;
+
+	ret = debugfs_create_trace_filter(sdev);
+	if (ret < 0)
+		dev_warn(sdev->dev, "failed to create filter debugfs file: %d", ret);
+
+	dfse = devm_kzalloc(sdev->dev, sizeof(*dfse), GFP_KERNEL);
+	if (!dfse)
+		return -ENOMEM;
+
+	dfse->type = SOF_DFSENTRY_TYPE_BUF;
+	dfse->buf = sdev->dmatb.area;
+	dfse->size = sdev->dmatb.bytes;
+	dfse->sdev = sdev;
+
+	debugfs_create_file("trace", 0444, sdev->debugfs_root, dfse,
+			    &sof_dfs_dtrace_fops);
+
+	return 0;
+}
+
+static int ipc3_dtrace_enable(struct snd_sof_dev *sdev)
+{
+	struct sof_ipc_fw_ready *ready = &sdev->fw_ready;
+	struct sof_ipc_fw_version *v = &ready->version;
+	struct sof_ipc_dma_trace_params_ext params;
+	struct sof_ipc_reply ipc_reply;
+	int ret;
+
+	if (!sdev->fw_trace_is_supported)
+		return 0;
+
+	if (sdev->dtrace_state == SOF_DTRACE_ENABLED || !sdev->dma_trace_pages)
+		return -EINVAL;
+
+	if (sdev->dtrace_state == SOF_DTRACE_STOPPED)
+		goto start;
+
+	/* set IPC parameters */
+	params.hdr.cmd = SOF_IPC_GLB_TRACE_MSG;
+	/* PARAMS_EXT is only supported from ABI 3.7.0 onwards */
+	if (v->abi_version >= SOF_ABI_VER(3, 7, 0)) {
+		params.hdr.size = sizeof(struct sof_ipc_dma_trace_params_ext);
+		params.hdr.cmd |= SOF_IPC_TRACE_DMA_PARAMS_EXT;
+		params.timestamp_ns = ktime_get(); /* in nanosecond */
+	} else {
+		params.hdr.size = sizeof(struct sof_ipc_dma_trace_params);
+		params.hdr.cmd |= SOF_IPC_TRACE_DMA_PARAMS;
+	}
+	params.buffer.phy_addr = sdev->dmatp.addr;
+	params.buffer.size = sdev->dmatb.bytes;
+	params.buffer.pages = sdev->dma_trace_pages;
+	params.stream_tag = 0;
+
+	sdev->host_offset = 0;
+	sdev->dtrace_draining = false;
+
+	ret = snd_sof_dma_trace_init(sdev, &params);
+	if (ret < 0) {
+		dev_err(sdev->dev, "Host dtrace init failed: %d\n", ret);
+		return ret;
+	}
+	dev_dbg(sdev->dev, "%s: stream_tag: %d\n", __func__, params.stream_tag);
+
+	/* send IPC to the DSP */
+	ret = sof_ipc_tx_message(sdev->ipc, &params, sizeof(params), &ipc_reply, sizeof(ipc_reply));
+	if (ret < 0) {
+		dev_err(sdev->dev, "can't set params for DMA for trace %d\n", ret);
+		goto trace_release;
+	}
+
+start:
+	ret = snd_sof_dma_trace_trigger(sdev, SNDRV_PCM_TRIGGER_START);
+	if (ret < 0) {
+		dev_err(sdev->dev, "Host dtrace trigger start failed: %d\n", ret);
+		goto trace_release;
+	}
+
+	sdev->dtrace_state = SOF_DTRACE_ENABLED;
+
+	return 0;
+
+trace_release:
+	snd_sof_dma_trace_release(sdev);
+	return ret;
+}
+
+static int ipc3_dtrace_init(struct snd_sof_dev *sdev)
+{
+	int ret;
+
+	/* dtrace is only supported with SOF_IPC */
+	if (sdev->pdata->ipc_type != SOF_IPC)
+		return -EOPNOTSUPP;
+
+	/* set false before start initialization */
+	sdev->dtrace_state = SOF_DTRACE_DISABLED;
+
+	/* allocate trace page table buffer */
+	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, sdev->dev,
+				  PAGE_SIZE, &sdev->dmatp);
+	if (ret < 0) {
+		dev_err(sdev->dev, "can't alloc page table for trace %d\n", ret);
+		return ret;
+	}
+
+	/* allocate trace data buffer */
+	ret = snd_dma_alloc_dir_pages(SNDRV_DMA_TYPE_DEV_SG, sdev->dev,
+				      DMA_FROM_DEVICE, DMA_BUF_SIZE_FOR_TRACE,
+				      &sdev->dmatb);
+	if (ret < 0) {
+		dev_err(sdev->dev, "can't alloc buffer for trace %d\n", ret);
+		goto page_err;
+	}
+
+	/* create compressed page table for audio firmware */
+	ret = snd_sof_create_page_table(sdev->dev, &sdev->dmatb,
+					sdev->dmatp.area, sdev->dmatb.bytes);
+	if (ret < 0)
+		goto table_err;
+
+	sdev->dma_trace_pages = ret;
+	dev_dbg(sdev->dev, "%s: dma_trace_pages: %d\n", __func__,
+		sdev->dma_trace_pages);
+
+	if (sdev->first_boot) {
+		ret = debugfs_create_dtrace(sdev);
+		if (ret < 0)
+			goto table_err;
+	}
+
+	init_waitqueue_head(&sdev->trace_sleep);
+
+	ret = ipc3_dtrace_enable(sdev);
+	if (ret < 0)
+		goto table_err;
+
+	return 0;
+table_err:
+	sdev->dma_trace_pages = 0;
+	snd_dma_free_pages(&sdev->dmatb);
+page_err:
+	snd_dma_free_pages(&sdev->dmatp);
+	return ret;
+}
+
+int ipc3_dtrace_posn_update(struct snd_sof_dev *sdev,
+			    struct sof_ipc_dma_trace_posn *posn)
+{
+	if (!sdev->fw_trace_is_supported)
+		return 0;
+
+	if (sdev->dtrace_state == SOF_DTRACE_ENABLED &&
+	    sdev->host_offset != posn->host_offset) {
+		sdev->host_offset = posn->host_offset;
+		wake_up(&sdev->trace_sleep);
+	}
+
+	if (posn->overflow != 0)
+		dev_err(sdev->dev,
+			"DSP trace buffer overflow %u bytes. Total messages %d\n",
+			posn->overflow, posn->messages);
+
+	return 0;
+}
+
+/* an error has occurred within the DSP that prevents further trace */
+static void ipc3_dtrace_fw_crashed(struct snd_sof_dev *sdev)
+{
+	if (sdev->dtrace_state == SOF_DTRACE_ENABLED) {
+		sdev->dtrace_error = true;
+		wake_up(&sdev->trace_sleep);
+	}
+}
+
+static void ipc3_dtrace_release(struct snd_sof_dev *sdev, bool only_stop)
+{
+	struct sof_ipc_fw_ready *ready = &sdev->fw_ready;
+	struct sof_ipc_fw_version *v = &ready->version;
+	struct sof_ipc_cmd_hdr hdr;
+	struct sof_ipc_reply ipc_reply;
+	int ret;
+
+	if (!sdev->fw_trace_is_supported || sdev->dtrace_state == SOF_DTRACE_DISABLED)
+		return;
+
+	ret = snd_sof_dma_trace_trigger(sdev, SNDRV_PCM_TRIGGER_STOP);
+	if (ret < 0)
+		dev_err(sdev->dev, "Host dtrace trigger stop failed: %d\n", ret);
+	sdev->dtrace_state = SOF_DTRACE_STOPPED;
+
+	/*
+	 * stop and free trace DMA in the DSP. TRACE_DMA_FREE is only supported from
+	 * ABI 3.20.0 onwards
+	 */
+	if (v->abi_version >= SOF_ABI_VER(3, 20, 0)) {
+		hdr.size = sizeof(hdr);
+		hdr.cmd = SOF_IPC_GLB_TRACE_MSG | SOF_IPC_TRACE_DMA_FREE;
+
+		ret = sof_ipc_tx_message(sdev->ipc, &hdr, hdr.size,
+					 &ipc_reply, sizeof(ipc_reply));
+		if (ret < 0)
+			dev_err(sdev->dev, "DMA_TRACE_FREE failed with error: %d\n", ret);
+	}
+
+	if (only_stop)
+		goto out;
+
+	ret = snd_sof_dma_trace_release(sdev);
+	if (ret < 0)
+		dev_err(sdev->dev, "Host dtrace release failed %d\n", ret);
+
+	sdev->dtrace_state = SOF_DTRACE_DISABLED;
+
+out:
+	sdev->dtrace_draining = true;
+	wake_up(&sdev->trace_sleep);
+}
+
+static void ipc3_dtrace_suspend(struct snd_sof_dev *sdev, pm_message_t pm_state)
+{
+	ipc3_dtrace_release(sdev, pm_state.event == SOF_DSP_PM_D0);
+}
+
+static int ipc3_dtrace_resume(struct snd_sof_dev *sdev)
+{
+	return ipc3_dtrace_enable(sdev);
+}
+
+static void ipc3_dtrace_free(struct snd_sof_dev *sdev)
+{
+	/* release trace */
+	ipc3_dtrace_release(sdev, false);
+
+	if (sdev->dma_trace_pages) {
+		snd_dma_free_pages(&sdev->dmatb);
+		snd_dma_free_pages(&sdev->dmatp);
+		sdev->dma_trace_pages = 0;
+	}
+}
+
+const struct sof_ipc_fw_tracing_ops ipc3_dtrace_ops = {
+	.init = ipc3_dtrace_init,
+	.free = ipc3_dtrace_free,
+	.fw_crashed = ipc3_dtrace_fw_crashed,
+	.suspend = ipc3_dtrace_suspend,
+	.resume = ipc3_dtrace_resume,
+};
diff --git a/sound/soc/sof/ipc3-priv.h b/sound/soc/sof/ipc3-priv.h
index 82f9d0cbfb93..bb9cb0678686 100644
--- a/sound/soc/sof/ipc3-priv.h
+++ b/sound/soc/sof/ipc3-priv.h
@@ -16,6 +16,7 @@ extern const struct sof_ipc_pcm_ops ipc3_pcm_ops;
 extern const struct sof_ipc_tplg_ops ipc3_tplg_ops;
 extern const struct sof_ipc_tplg_control_ops tplg_ipc3_control_ops;
 extern const struct sof_ipc_fw_loader_ops ipc3_loader_ops;
+extern const struct sof_ipc_fw_tracing_ops ipc3_dtrace_ops;
 
 /* helpers for fw_ready and ext_manifest parsing */
 int sof_ipc3_get_ext_windows(struct snd_sof_dev *sdev,
@@ -24,4 +25,8 @@ int sof_ipc3_get_cc_info(struct snd_sof_dev *sdev,
 			 const struct sof_ipc_ext_data_hdr *ext_hdr);
 int sof_ipc3_validate_fw_version(struct snd_sof_dev *sdev);
 
+/* dtrace position update */
+int ipc3_dtrace_posn_update(struct snd_sof_dev *sdev,
+			    struct sof_ipc_dma_trace_posn *posn);
+
 #endif
diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index a8ffc4f99565..124d4442c6c3 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -1070,6 +1070,7 @@ const struct sof_ipc_ops ipc3_ops = {
 	.pm = &ipc3_pm_ops,
 	.pcm = &ipc3_pcm_ops,
 	.fw_loader = &ipc3_loader_ops,
+	.fw_tracing = &ipc3_dtrace_ops,
 
 	.tx_msg = sof_ipc3_tx_msg,
 	.rx_msg = sof_ipc3_rx_msg,
-- 
2.36.1

