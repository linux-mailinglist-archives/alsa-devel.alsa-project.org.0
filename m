Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A100E528289
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 12:49:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17C3D1698;
	Mon, 16 May 2022 12:48:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17C3D1698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652698171;
	bh=ThEZB4wssOt00icRf3+xWcgiNcEl65wptgdwX61zNQY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q7mLQeyLqzCEcrDJ9/UDgwKsL6dFM2lhm3odoI/I9iVDLdZAt4xwwjJBb0BInBcb2
	 9ssWhIJ2V6dyux4Y3SQsW2Kfxme5B0+HkQLbC1WdwtoB+aAyeseHDuUcTWfXF9Sbyo
	 ygFWBlKW72xViJ8JP4mpHH2yYSVDCrs0dofxUbUg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91A06F80524;
	Mon, 16 May 2022 12:47:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2EF0F80520; Mon, 16 May 2022 12:47:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD4D0F8025C
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 12:47:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD4D0F8025C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cHvpScPA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652698047; x=1684234047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ThEZB4wssOt00icRf3+xWcgiNcEl65wptgdwX61zNQY=;
 b=cHvpScPAM9YzZ4gS/YOcCzWGI6UnkKkxai+4wdRHJ7hD8n2vzHjOhxCW
 7w4ycgDoeuGjmsxtiFFEV8fSrJs6iycpu+c2gsdlIdmWC7hWrMJcYzPuk
 Nc6AM0WnBB6/qBnzR+icGnpZoVhOq2095eIKDOCA5mIb0T1GjgEh2aCy0
 tOW655YLzIk/TPQ2ySXrziwgzm7qbJ5SIHvZy9aWHOu2STrmRFgHGDmhM
 BR3CuZtgPvC0RAC2QhP6myemJ70C1cDGfwex0nD+WK4XtQ/94IpPDnHJ4
 WGX6yiVkw6FHsiROIHlh733Cx5myz+S076QpEQoPeuCtQJ4oLJ012k8Dj w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="333853250"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="333853250"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 03:46:58 -0700
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="596459810"
Received: from afialcko-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.51.55])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 03:46:55 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com,
 AjitKumar.Pandey@amd.com
Subject: [PATCH 4/8] ASoC: SOF: Switch to IPC generic firmware tracing
Date: Mon, 16 May 2022 13:47:07 +0300
Message-Id: <20220516104711.26115-5-peter.ujfalusi@linux.intel.com>
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

Introduce new, generic API for firmware tracing with sof_fw_trace_ prefix
and switch to use it.
At the same time the old IPC3 code can be dropped from trace.c, which is
now a generic wrapper for the firmware tracing ops.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/core.c     |  11 +-
 sound/soc/sof/debug.c    |   2 +-
 sound/soc/sof/ipc.c      |   6 +
 sound/soc/sof/ipc3.c     |   2 +-
 sound/soc/sof/ops.c      |   2 +-
 sound/soc/sof/pm.c       |   8 +-
 sound/soc/sof/sof-priv.h |  13 +-
 sound/soc/sof/trace.c    | 615 ++-------------------------------------
 8 files changed, 44 insertions(+), 615 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index ff636f0e2435..53719c04658f 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -252,12 +252,11 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 	if (sof_debug_check_flag(SOF_DBG_ENABLE_TRACE)) {
 		sdev->fw_trace_is_supported = true;
 
-		/* init DMA trace */
-		ret = snd_sof_init_trace(sdev);
+		/* init firmware tracing */
+		ret = sof_fw_trace_init(sdev);
 		if (ret < 0) {
 			/* non fatal */
-			dev_warn(sdev->dev,
-				 "warning: failed to initialize trace %d\n",
+			dev_warn(sdev->dev, "failed to initialize firmware tracing %d\n",
 				 ret);
 		}
 	} else {
@@ -308,7 +307,7 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 sof_machine_err:
 	snd_sof_machine_unregister(sdev, plat_data);
 fw_trace_err:
-	snd_sof_free_trace(sdev);
+	sof_fw_trace_free(sdev);
 fw_run_err:
 	snd_sof_fw_unload(sdev);
 fw_load_err:
@@ -447,7 +446,7 @@ int snd_sof_device_remove(struct device *dev)
 	snd_sof_machine_unregister(sdev, pdata);
 
 	if (sdev->fw_state > SOF_FW_BOOT_NOT_STARTED) {
-		snd_sof_free_trace(sdev);
+		sof_fw_trace_free(sdev);
 		ret = snd_sof_dsp_power_down_notify(sdev);
 		if (ret < 0)
 			dev_warn(dev, "error: %d failed to prepare DSP for device removal",
diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 54d3643b46ad..cf1271eb29b2 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -443,6 +443,6 @@ void snd_sof_handle_fw_exception(struct snd_sof_dev *sdev)
 	snd_sof_ipc_dump(sdev);
 	snd_sof_dsp_dbg_dump(sdev, "Firmware exception",
 			     SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_MBOX);
-	snd_sof_trace_notify_for_error(sdev);
+	sof_fw_trace_fw_crashed(sdev);
 }
 EXPORT_SYMBOL(snd_sof_handle_fw_exception);
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 41f3a217be5d..c5aef5fc056b 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -184,6 +184,12 @@ struct snd_sof_ipc *snd_sof_ipc_init(struct snd_sof_dev *sdev)
 		return NULL;
 	}
 
+	if (ops->fw_tracing && (!ops->fw_tracing->init || !ops->fw_tracing->suspend ||
+				!ops->fw_tracing->resume)) {
+		dev_err(sdev->dev, "Missing firmware tracing ops\n");
+		return NULL;
+	}
+
 	return ipc;
 }
 EXPORT_SYMBOL(snd_sof_ipc_init);
diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index 124d4442c6c3..dff5feaad370 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -946,7 +946,7 @@ static void ipc3_trace_message(struct snd_sof_dev *sdev, void *msg_buf)
 
 	switch (msg_type) {
 	case SOF_IPC_TRACE_DMA_POSITION:
-		snd_sof_trace_update_pos(sdev, msg_buf);
+		ipc3_dtrace_posn_update(sdev, msg_buf);
 		break;
 	default:
 		dev_err(sdev->dev, "unhandled trace message %#x\n", msg_type);
diff --git a/sound/soc/sof/ops.c b/sound/soc/sof/ops.c
index 235e2ef72178..ff066de4ceb9 100644
--- a/sound/soc/sof/ops.c
+++ b/sound/soc/sof/ops.c
@@ -177,7 +177,7 @@ void snd_sof_dsp_panic(struct snd_sof_dev *sdev, u32 offset, bool non_recoverabl
 		snd_sof_dsp_dbg_dump(sdev, "DSP panic!",
 				     SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_MBOX);
 		sof_set_fw_state(sdev, SOF_FW_CRASHED);
-		snd_sof_trace_notify_for_error(sdev);
+		sof_fw_trace_fw_crashed(sdev);
 	} else {
 		snd_sof_dsp_dbg_dump(sdev,
 				     "DSP panic (recovery will be attempted)",
diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index fa3f5514c00f..18eb327a57f0 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -107,7 +107,7 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 	 */
 	if (!runtime_resume && sof_ops(sdev)->set_power_state &&
 	    old_state == SOF_DSP_PM_D0) {
-		ret = snd_sof_trace_resume(sdev);
+		ret = sof_fw_trace_resume(sdev);
 		if (ret < 0)
 			/* non fatal */
 			dev_warn(sdev->dev,
@@ -143,7 +143,7 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 	}
 
 	/* resume DMA trace */
-	ret = snd_sof_trace_resume(sdev);
+	ret = sof_fw_trace_resume(sdev);
 	if (ret < 0) {
 		/* non fatal */
 		dev_warn(sdev->dev,
@@ -208,7 +208,7 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 
 	/* Skip to platform-specific suspend if DSP is entering D0 */
 	if (target_state == SOF_DSP_PM_D0) {
-		snd_sof_trace_suspend(sdev, pm_state);
+		sof_fw_trace_suspend(sdev, pm_state);
 		/* Notify clients not managed by pm framework about core suspend */
 		sof_suspend_clients(sdev, pm_state);
 		goto suspend;
@@ -218,7 +218,7 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 		tplg_ops->tear_down_all_pipelines(sdev, false);
 
 	/* suspend DMA trace */
-	snd_sof_trace_suspend(sdev, pm_state);
+	sof_fw_trace_suspend(sdev, pm_state);
 
 	/* Notify clients not managed by pm framework about core suspend */
 	sof_suspend_clients(sdev, pm_state);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index f1cbd2b0d1c9..61ef739461f0 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -660,27 +660,26 @@ static inline void snd_sof_ipc_process_reply(struct snd_sof_dev *sdev, u32 msg_i
 /*
  * Trace/debug
  */
-int snd_sof_init_trace(struct snd_sof_dev *sdev);
-void snd_sof_free_trace(struct snd_sof_dev *sdev);
 int snd_sof_dbg_init(struct snd_sof_dev *sdev);
 void snd_sof_free_debug(struct snd_sof_dev *sdev);
 int snd_sof_debugfs_buf_item(struct snd_sof_dev *sdev,
 			     void *base, size_t size,
 			     const char *name, mode_t mode);
-int snd_sof_trace_update_pos(struct snd_sof_dev *sdev,
-			     struct sof_ipc_dma_trace_posn *posn);
-void snd_sof_trace_notify_for_error(struct snd_sof_dev *sdev);
 void sof_print_oops_and_stack(struct snd_sof_dev *sdev, const char *level,
 			      u32 panic_code, u32 tracep_code, void *oops,
 			      struct sof_ipc_panic_info *panic_info,
 			      void *stack, size_t stack_words);
-void snd_sof_trace_suspend(struct snd_sof_dev *sdev, pm_message_t pm_state);
-int snd_sof_trace_resume(struct snd_sof_dev *sdev);
 void snd_sof_handle_fw_exception(struct snd_sof_dev *sdev);
 int snd_sof_dbg_memory_info_init(struct snd_sof_dev *sdev);
 int snd_sof_debugfs_add_region_item_iomem(struct snd_sof_dev *sdev,
 		enum snd_sof_fw_blk_type blk_type, u32 offset, size_t size,
 		const char *name, enum sof_debugfs_access_type access_type);
+/* Firmware tracing */
+int sof_fw_trace_init(struct snd_sof_dev *sdev);
+void sof_fw_trace_free(struct snd_sof_dev *sdev);
+void sof_fw_trace_fw_crashed(struct snd_sof_dev *sdev);
+void sof_fw_trace_suspend(struct snd_sof_dev *sdev, pm_message_t pm_state);
+int sof_fw_trace_resume(struct snd_sof_dev *sdev);
 
 /*
  * DSP Architectures.
diff --git a/sound/soc/sof/trace.c b/sound/soc/sof/trace.c
index c5cc78c1958f..6f662642d611 100644
--- a/sound/soc/sof/trace.c
+++ b/sound/soc/sof/trace.c
@@ -1,626 +1,51 @@
-// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
-//
-// This file is provided under a dual BSD/GPLv2 license.  When using or
-// redistributing this file, you may do so under either license.
-//
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
-//
-// Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
+// SPDX-License-Identifier: GPL-2.0-only
 //
+// Copyright(c) 2022 Intel Corporation. All rights reserved.
 
-#include <linux/debugfs.h>
-#include <linux/sched/signal.h>
 #include "sof-priv.h"
-#include "sof-audio.h"
-#include "ops.h"
-#include "sof-utils.h"
-
-#define TRACE_FILTER_ELEMENTS_PER_ENTRY 4
-#define TRACE_FILTER_MAX_CONFIG_STRING_LENGTH 1024
-
-static int trace_filter_append_elem(struct snd_sof_dev *sdev, uint32_t key, uint32_t value,
-				    struct sof_ipc_trace_filter_elem *elem_list,
-				    int capacity, int *counter)
-{
-	if (*counter >= capacity)
-		return -ENOMEM;
-
-	elem_list[*counter].key = key;
-	elem_list[*counter].value = value;
-	++*counter;
-
-	return 0;
-}
-
-static int trace_filter_parse_entry(struct snd_sof_dev *sdev, const char *line,
-				    struct sof_ipc_trace_filter_elem *elem,
-				    int capacity, int *counter)
-{
-	int len = strlen(line);
-	int cnt = *counter;
-	uint32_t uuid_id;
-	int log_level;
-	int pipe_id;
-	int comp_id;
-	int read;
-	int ret;
-
-	/* ignore empty content */
-	ret = sscanf(line, " %n", &read);
-	if (!ret && read == len)
-		return len;
-
-	ret = sscanf(line, " %d %x %d %d %n", &log_level, &uuid_id, &pipe_id, &comp_id, &read);
-	if (ret != TRACE_FILTER_ELEMENTS_PER_ENTRY || read != len) {
-		dev_err(sdev->dev, "error: invalid trace filter entry '%s'\n", line);
-		return -EINVAL;
-	}
-
-	if (uuid_id > 0) {
-		ret = trace_filter_append_elem(sdev, SOF_IPC_TRACE_FILTER_ELEM_BY_UUID,
-					       uuid_id, elem, capacity, &cnt);
-		if (ret)
-			return ret;
-	}
-	if (pipe_id >= 0) {
-		ret = trace_filter_append_elem(sdev, SOF_IPC_TRACE_FILTER_ELEM_BY_PIPE,
-					       pipe_id, elem, capacity, &cnt);
-		if (ret)
-			return ret;
-	}
-	if (comp_id >= 0) {
-		ret = trace_filter_append_elem(sdev, SOF_IPC_TRACE_FILTER_ELEM_BY_COMP,
-					       comp_id, elem, capacity, &cnt);
-		if (ret)
-			return ret;
-	}
-
-	ret = trace_filter_append_elem(sdev, SOF_IPC_TRACE_FILTER_ELEM_SET_LEVEL |
-				       SOF_IPC_TRACE_FILTER_ELEM_FIN,
-				       log_level, elem, capacity, &cnt);
-	if (ret)
-		return ret;
-
-	/* update counter only when parsing whole entry passed */
-	*counter = cnt;
-
-	return len;
-}
-
-static int trace_filter_parse(struct snd_sof_dev *sdev, char *string,
-			      int *out_elem_cnt,
-			      struct sof_ipc_trace_filter_elem **out)
-{
-	static const char entry_delimiter[] = ";";
-	char *entry = string;
-	int capacity = 0;
-	int entry_len;
-	int cnt = 0;
-
-	/*
-	 * Each entry contains at least 1, up to TRACE_FILTER_ELEMENTS_PER_ENTRY
-	 * IPC elements, depending on content. Calculate IPC elements capacity
-	 * for the input string where each element is set.
-	 */
-	while (entry) {
-		capacity += TRACE_FILTER_ELEMENTS_PER_ENTRY;
-		entry = strchr(entry + 1, entry_delimiter[0]);
-	}
-	*out = kmalloc(capacity * sizeof(**out), GFP_KERNEL);
-	if (!*out)
-		return -ENOMEM;
-
-	/* split input string by ';', and parse each entry separately in trace_filter_parse_entry */
-	while ((entry = strsep(&string, entry_delimiter))) {
-		entry_len = trace_filter_parse_entry(sdev, entry, *out, capacity, &cnt);
-		if (entry_len < 0) {
-			dev_err(sdev->dev, "error: %s failed for '%s', %d\n", __func__, entry,
-				entry_len);
-			return -EINVAL;
-		}
-	}
-
-	*out_elem_cnt = cnt;
-
-	return 0;
-}
-
-static int sof_ipc_trace_update_filter(struct snd_sof_dev *sdev, int num_elems,
-				       struct sof_ipc_trace_filter_elem *elems)
-{
-	struct sof_ipc_trace_filter *msg;
-	struct sof_ipc_reply reply;
-	size_t size;
-	int ret;
-
-	size = struct_size(msg, elems, num_elems);
-	if (size > SOF_IPC_MSG_MAX_SIZE)
-		return -EINVAL;
-
-	msg = kmalloc(size, GFP_KERNEL);
-	if (!msg)
-		return -ENOMEM;
-
-	msg->hdr.size = size;
-	msg->hdr.cmd = SOF_IPC_GLB_TRACE_MSG | SOF_IPC_TRACE_FILTER_UPDATE;
-	msg->elem_cnt = num_elems;
-	memcpy(&msg->elems[0], elems, num_elems * sizeof(*elems));
-
-	ret = pm_runtime_get_sync(sdev->dev);
-	if (ret < 0 && ret != -EACCES) {
-		pm_runtime_put_noidle(sdev->dev);
-		dev_err(sdev->dev, "error: enabling device failed: %d\n", ret);
-		goto error;
-	}
-	ret = sof_ipc_tx_message(sdev->ipc, msg, msg->hdr.size, &reply, sizeof(reply));
-	pm_runtime_mark_last_busy(sdev->dev);
-	pm_runtime_put_autosuspend(sdev->dev);
-
-error:
-	kfree(msg);
-	return ret ? ret : reply.error;
-}
-
-static ssize_t sof_dfsentry_trace_filter_write(struct file *file, const char __user *from,
-					       size_t count, loff_t *ppos)
-{
-	struct snd_sof_dfsentry *dfse = file->private_data;
-	struct sof_ipc_trace_filter_elem *elems = NULL;
-	struct snd_sof_dev *sdev = dfse->sdev;
-	loff_t pos = 0;
-	int num_elems;
-	char *string;
-	int ret;
-
-	if (count > TRACE_FILTER_MAX_CONFIG_STRING_LENGTH) {
-		dev_err(sdev->dev, "%s too long input, %zu > %d\n", __func__, count,
-			TRACE_FILTER_MAX_CONFIG_STRING_LENGTH);
-		return -EINVAL;
-	}
-
-	string = kmalloc(count + 1, GFP_KERNEL);
-	if (!string)
-		return -ENOMEM;
-
-	/* assert null termination */
-	string[count] = 0;
-	ret = simple_write_to_buffer(string, count, &pos, from, count);
-	if (ret < 0)
-		goto error;
-
-	ret = trace_filter_parse(sdev, string, &num_elems, &elems);
-	if (ret < 0) {
-		dev_err(sdev->dev, "error: fail in trace_filter_parse, %d\n", ret);
-		goto error;
-	}
-
-	if (num_elems) {
-		ret = sof_ipc_trace_update_filter(sdev, num_elems, elems);
-		if (ret < 0) {
-			dev_err(sdev->dev, "error: fail in sof_ipc_trace_update_filter %d\n", ret);
-			goto error;
-		}
-	}
-	ret = count;
-error:
-	kfree(string);
-	kfree(elems);
-	return ret;
-}
-
-static const struct file_operations sof_dfs_trace_filter_fops = {
-	.open = simple_open,
-	.write = sof_dfsentry_trace_filter_write,
-	.llseek = default_llseek,
-};
-
-static int trace_debugfs_filter_create(struct snd_sof_dev *sdev)
-{
-	struct snd_sof_dfsentry *dfse;
-
-	dfse = devm_kzalloc(sdev->dev, sizeof(*dfse), GFP_KERNEL);
-	if (!dfse)
-		return -ENOMEM;
-
-	dfse->sdev = sdev;
-	dfse->type = SOF_DFSENTRY_TYPE_BUF;
-
-	debugfs_create_file("filter", 0200, sdev->debugfs_root, dfse,
-			    &sof_dfs_trace_filter_fops);
-	/* add to dfsentry list */
-	list_add(&dfse->list, &sdev->dfsentry_list);
-
-	return 0;
-}
-
-static size_t sof_trace_avail(struct snd_sof_dev *sdev,
-			      loff_t pos, size_t buffer_size)
-{
-	loff_t host_offset = READ_ONCE(sdev->host_offset);
-
-	/*
-	 * If host offset is less than local pos, it means write pointer of
-	 * host DMA buffer has been wrapped. We should output the trace data
-	 * at the end of host DMA buffer at first.
-	 */
-	if (host_offset < pos)
-		return buffer_size - pos;
-
-	/* If there is available trace data now, it is unnecessary to wait. */
-	if (host_offset > pos)
-		return host_offset - pos;
-
-	return 0;
-}
-
-static size_t sof_wait_trace_avail(struct snd_sof_dev *sdev,
-				   loff_t pos, size_t buffer_size)
-{
-	wait_queue_entry_t wait;
-	size_t ret = sof_trace_avail(sdev, pos, buffer_size);
-
-	/* data immediately available */
-	if (ret)
-		return ret;
-
-	if (sdev->dtrace_state != SOF_DTRACE_ENABLED && sdev->dtrace_draining) {
-		/*
-		 * tracing has ended and all traces have been
-		 * read by client, return EOF
-		 */
-		sdev->dtrace_draining = false;
-		return 0;
-	}
-
-	/* wait for available trace data from FW */
-	init_waitqueue_entry(&wait, current);
-	set_current_state(TASK_INTERRUPTIBLE);
-	add_wait_queue(&sdev->trace_sleep, &wait);
-
-	if (!signal_pending(current)) {
-		/* set timeout to max value, no error code */
-		schedule_timeout(MAX_SCHEDULE_TIMEOUT);
-	}
-	remove_wait_queue(&sdev->trace_sleep, &wait);
-
-	return sof_trace_avail(sdev, pos, buffer_size);
-}
-
-static ssize_t sof_dfsentry_trace_read(struct file *file, char __user *buffer,
-				       size_t count, loff_t *ppos)
-{
-	struct snd_sof_dfsentry *dfse = file->private_data;
-	struct snd_sof_dev *sdev = dfse->sdev;
-	unsigned long rem;
-	loff_t lpos = *ppos;
-	size_t avail, buffer_size = dfse->size;
-	u64 lpos_64;
-
-	/* make sure we know about any failures on the DSP side */
-	sdev->dtrace_error = false;
-
-	/* check pos and count */
-	if (lpos < 0)
-		return -EINVAL;
-	if (!count)
-		return 0;
 
-	/* check for buffer wrap and count overflow */
-	lpos_64 = lpos;
-	lpos = do_div(lpos_64, buffer_size);
-
-	/* get available count based on current host offset */
-	avail = sof_wait_trace_avail(sdev, lpos, buffer_size);
-	if (sdev->dtrace_error) {
-		dev_err(sdev->dev, "error: trace IO error\n");
-		return -EIO;
-	}
-
-	/* make sure count is <= avail */
-	if (count > avail)
-		count = avail;
-
-	/*
-	 * make sure that all trace data is available for the CPU as the trace
-	 * data buffer might be allocated from non consistent memory.
-	 * Note: snd_dma_buffer_sync() is called for normal audio playback and
-	 *	 capture streams also.
-	 */
-	snd_dma_buffer_sync(&sdev->dmatb, SNDRV_DMA_SYNC_CPU);
-	/* copy available trace data to debugfs */
-	rem = copy_to_user(buffer, ((u8 *)(dfse->buf) + lpos), count);
-	if (rem)
-		return -EFAULT;
-
-	*ppos += count;
-
-	/* move debugfs reading position */
-	return count;
-}
-
-static int sof_dfsentry_trace_release(struct inode *inode, struct file *file)
+int sof_fw_trace_init(struct snd_sof_dev *sdev)
 {
-	struct snd_sof_dfsentry *dfse = inode->i_private;
-	struct snd_sof_dev *sdev = dfse->sdev;
-
-	/* avoid duplicate traces at next open */
-	if (sdev->dtrace_state != SOF_DTRACE_ENABLED)
-		sdev->host_offset = 0;
-
-	return 0;
-}
-
-static const struct file_operations sof_dfs_trace_fops = {
-	.open = simple_open,
-	.read = sof_dfsentry_trace_read,
-	.llseek = default_llseek,
-	.release = sof_dfsentry_trace_release,
-};
-
-static int trace_debugfs_create(struct snd_sof_dev *sdev)
-{
-	struct snd_sof_dfsentry *dfse;
-	int ret;
-
-	if (!sdev)
-		return -EINVAL;
-
-	ret = trace_debugfs_filter_create(sdev);
-	if (ret < 0)
-		dev_err(sdev->dev, "error: fail in %s, %d", __func__, ret);
-
-	dfse = devm_kzalloc(sdev->dev, sizeof(*dfse), GFP_KERNEL);
-	if (!dfse)
-		return -ENOMEM;
-
-	dfse->type = SOF_DFSENTRY_TYPE_BUF;
-	dfse->buf = sdev->dmatb.area;
-	dfse->size = sdev->dmatb.bytes;
-	dfse->sdev = sdev;
-
-	debugfs_create_file("trace", 0444, sdev->debugfs_root, dfse,
-			    &sof_dfs_trace_fops);
-
-	return 0;
-}
-
-static int snd_sof_enable_trace(struct snd_sof_dev *sdev)
-{
-	struct sof_ipc_fw_ready *ready = &sdev->fw_ready;
-	struct sof_ipc_fw_version *v = &ready->version;
-	struct sof_ipc_dma_trace_params_ext params;
-	struct sof_ipc_reply ipc_reply;
-	int ret;
-
-	if (!sdev->fw_trace_is_supported)
-		return 0;
-
-	if (sdev->dtrace_state == SOF_DTRACE_ENABLED || !sdev->dma_trace_pages)
-		return -EINVAL;
-
-	if (sdev->dtrace_state == SOF_DTRACE_STOPPED)
-		goto start;
-
-	/* set IPC parameters */
-	params.hdr.cmd = SOF_IPC_GLB_TRACE_MSG;
-	/* PARAMS_EXT is only supported from ABI 3.7.0 onwards */
-	if (v->abi_version >= SOF_ABI_VER(3, 7, 0)) {
-		params.hdr.size = sizeof(struct sof_ipc_dma_trace_params_ext);
-		params.hdr.cmd |= SOF_IPC_TRACE_DMA_PARAMS_EXT;
-		params.timestamp_ns = ktime_get(); /* in nanosecond */
-	} else {
-		params.hdr.size = sizeof(struct sof_ipc_dma_trace_params);
-		params.hdr.cmd |= SOF_IPC_TRACE_DMA_PARAMS;
-	}
-	params.buffer.phy_addr = sdev->dmatp.addr;
-	params.buffer.size = sdev->dmatb.bytes;
-	params.buffer.pages = sdev->dma_trace_pages;
-	params.stream_tag = 0;
-
-	sdev->host_offset = 0;
-	sdev->dtrace_draining = false;
-
-	ret = snd_sof_dma_trace_init(sdev, &params);
-	if (ret < 0) {
-		dev_err(sdev->dev,
-			"error: fail in snd_sof_dma_trace_init %d\n", ret);
-		return ret;
-	}
-	dev_dbg(sdev->dev, "%s: stream_tag: %d\n", __func__, params.stream_tag);
-
-	/* send IPC to the DSP */
-	ret = sof_ipc_tx_message(sdev->ipc, &params, sizeof(params), &ipc_reply, sizeof(ipc_reply));
-	if (ret < 0) {
-		dev_err(sdev->dev,
-			"error: can't set params for DMA for trace %d\n", ret);
-		goto trace_release;
-	}
-
-start:
-	ret = snd_sof_dma_trace_trigger(sdev, SNDRV_PCM_TRIGGER_START);
-	if (ret < 0) {
-		dev_err(sdev->dev,
-			"error: snd_sof_dma_trace_trigger: start: %d\n", ret);
-		goto trace_release;
-	}
-
-	sdev->dtrace_state = SOF_DTRACE_ENABLED;
-
-	return 0;
-
-trace_release:
-	snd_sof_dma_trace_release(sdev);
-	return ret;
-}
-
-int snd_sof_init_trace(struct snd_sof_dev *sdev)
-{
-	int ret;
-
-	/* dtrace is only supported with SOF_IPC */
-	if (sdev->pdata->ipc_type != SOF_IPC)
+	if (!sdev->ipc->ops->fw_tracing) {
+		dev_info(sdev->dev, "Firmware tracing is not available\n");
 		sdev->fw_trace_is_supported = false;
 
-	if (!sdev->fw_trace_is_supported)
 		return 0;
-
-	/* set false before start initialization */
-	sdev->dtrace_state = SOF_DTRACE_DISABLED;
-
-	/* allocate trace page table buffer */
-	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, sdev->dev,
-				  PAGE_SIZE, &sdev->dmatp);
-	if (ret < 0) {
-		dev_err(sdev->dev,
-			"error: can't alloc page table for trace %d\n", ret);
-		return ret;
-	}
-
-	/* allocate trace data buffer */
-	ret = snd_dma_alloc_dir_pages(SNDRV_DMA_TYPE_DEV_SG, sdev->dev,
-				      DMA_FROM_DEVICE, DMA_BUF_SIZE_FOR_TRACE,
-				      &sdev->dmatb);
-	if (ret < 0) {
-		dev_err(sdev->dev,
-			"error: can't alloc buffer for trace %d\n", ret);
-		goto page_err;
-	}
-
-	/* create compressed page table for audio firmware */
-	ret = snd_sof_create_page_table(sdev->dev, &sdev->dmatb,
-					sdev->dmatp.area, sdev->dmatb.bytes);
-	if (ret < 0)
-		goto table_err;
-
-	sdev->dma_trace_pages = ret;
-	dev_dbg(sdev->dev, "%s: dma_trace_pages: %d\n",
-		__func__, sdev->dma_trace_pages);
-
-	if (sdev->first_boot) {
-		ret = trace_debugfs_create(sdev);
-		if (ret < 0)
-			goto table_err;
 	}
 
-	init_waitqueue_head(&sdev->trace_sleep);
-
-	ret = snd_sof_enable_trace(sdev);
-	if (ret < 0)
-		goto table_err;
-
-	return 0;
-table_err:
-	sdev->dma_trace_pages = 0;
-	snd_dma_free_pages(&sdev->dmatb);
-page_err:
-	snd_dma_free_pages(&sdev->dmatp);
-	return ret;
+	return sdev->ipc->ops->fw_tracing->init(sdev);
 }
-EXPORT_SYMBOL(snd_sof_init_trace);
 
-int snd_sof_trace_update_pos(struct snd_sof_dev *sdev,
-			     struct sof_ipc_dma_trace_posn *posn)
+void sof_fw_trace_free(struct snd_sof_dev *sdev)
 {
-	if (!sdev->fw_trace_is_supported)
-		return 0;
-
-	if (sdev->dtrace_state == SOF_DTRACE_ENABLED &&
-	    sdev->host_offset != posn->host_offset) {
-		sdev->host_offset = posn->host_offset;
-		wake_up(&sdev->trace_sleep);
-	}
-
-	if (posn->overflow != 0)
-		dev_err(sdev->dev,
-			"error: DSP trace buffer overflow %u bytes. Total messages %d\n",
-			posn->overflow, posn->messages);
+	if (!sdev->fw_trace_is_supported || !sdev->ipc->ops->fw_tracing)
+		return;
 
-	return 0;
+	if (sdev->ipc->ops->fw_tracing->free)
+		sdev->ipc->ops->fw_tracing->free(sdev);
 }
 
-/* an error has occurred within the DSP that prevents further trace */
-void snd_sof_trace_notify_for_error(struct snd_sof_dev *sdev)
+void sof_fw_trace_fw_crashed(struct snd_sof_dev *sdev)
 {
 	if (!sdev->fw_trace_is_supported)
 		return;
 
-	if (sdev->dtrace_state == SOF_DTRACE_ENABLED) {
-		sdev->dtrace_error = true;
-		wake_up(&sdev->trace_sleep);
-	}
+	if (sdev->ipc->ops->fw_tracing->fw_crashed)
+		sdev->ipc->ops->fw_tracing->fw_crashed(sdev);
 }
-EXPORT_SYMBOL(snd_sof_trace_notify_for_error);
 
-static void snd_sof_release_trace(struct snd_sof_dev *sdev, bool only_stop)
+void sof_fw_trace_suspend(struct snd_sof_dev *sdev, pm_message_t pm_state)
 {
-	struct sof_ipc_fw_ready *ready = &sdev->fw_ready;
-	struct sof_ipc_fw_version *v = &ready->version;
-	struct sof_ipc_cmd_hdr hdr;
-	struct sof_ipc_reply ipc_reply;
-	int ret;
-
-	if (!sdev->fw_trace_is_supported || sdev->dtrace_state == SOF_DTRACE_DISABLED)
+	if (!sdev->fw_trace_is_supported)
 		return;
 
-	ret = snd_sof_dma_trace_trigger(sdev, SNDRV_PCM_TRIGGER_STOP);
-	if (ret < 0)
-		dev_err(sdev->dev,
-			"error: snd_sof_dma_trace_trigger: stop: %d\n", ret);
-	sdev->dtrace_state = SOF_DTRACE_STOPPED;
-
-	/*
-	 * stop and free trace DMA in the DSP. TRACE_DMA_FREE is only supported from
-	 * ABI 3.20.0 onwards
-	 */
-	if (v->abi_version >= SOF_ABI_VER(3, 20, 0)) {
-		hdr.size = sizeof(hdr);
-		hdr.cmd = SOF_IPC_GLB_TRACE_MSG | SOF_IPC_TRACE_DMA_FREE;
-
-		ret = sof_ipc_tx_message(sdev->ipc, &hdr, hdr.size,
-					 &ipc_reply, sizeof(ipc_reply));
-		if (ret < 0)
-			dev_err(sdev->dev, "DMA_TRACE_FREE failed with error: %d\n", ret);
-	}
-
-	if (only_stop)
-		goto out;
-
-	ret = snd_sof_dma_trace_release(sdev);
-	if (ret < 0)
-		dev_err(sdev->dev,
-			"error: fail in snd_sof_dma_trace_release %d\n", ret);
-
-	sdev->dtrace_state = SOF_DTRACE_DISABLED;
-
-out:
-	sdev->dtrace_draining = true;
-	wake_up(&sdev->trace_sleep);
+	sdev->ipc->ops->fw_tracing->suspend(sdev, pm_state);
 }
 
-void snd_sof_trace_suspend(struct snd_sof_dev *sdev, pm_message_t pm_state)
-{
-	snd_sof_release_trace(sdev, pm_state.event == SOF_DSP_PM_D0);
-}
-EXPORT_SYMBOL(snd_sof_trace_suspend);
-
-int snd_sof_trace_resume(struct snd_sof_dev *sdev)
-{
-	return snd_sof_enable_trace(sdev);
-}
-EXPORT_SYMBOL(snd_sof_trace_resume);
-
-void snd_sof_free_trace(struct snd_sof_dev *sdev)
+int sof_fw_trace_resume(struct snd_sof_dev *sdev)
 {
 	if (!sdev->fw_trace_is_supported)
-		return;
-
-	/* release trace */
-	snd_sof_release_trace(sdev, false);
+		return 0;
 
-	if (sdev->dma_trace_pages) {
-		snd_dma_free_pages(&sdev->dmatb);
-		snd_dma_free_pages(&sdev->dmatp);
-		sdev->dma_trace_pages = 0;
-	}
+	return sdev->ipc->ops->fw_tracing->resume(sdev);
 }
-EXPORT_SYMBOL(snd_sof_free_trace);
-- 
2.36.1

