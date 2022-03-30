Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C53F4ECDD2
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 22:23:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 196601ADC;
	Wed, 30 Mar 2022 22:22:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 196601ADC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648671817;
	bh=v11+v2k1DlGBmwphV6cblvuhJSgKZv8bXM99X6gnTfk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bn5rwLqDuTBouX8FsEzfQzIqDLY1S5WwMN2ctMybd0AQkkDVD8yOdYlkwc12hejuQ
	 s1UYjlgbwMi/PCroucGH8R7I+/It+r5Kmr7+2ILb7OuKCbBLkAmZO6W4vRe442WGlF
	 SzHhsSw4g3OT1ltOxqCzkGj3KMoxVGQw2G8alIJs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5737F80544;
	Wed, 30 Mar 2022 22:20:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 825B0F8052E; Wed, 30 Mar 2022 22:19:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26F66F804E4
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 22:19:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26F66F804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="j/K6FUw3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648671586; x=1680207586;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v11+v2k1DlGBmwphV6cblvuhJSgKZv8bXM99X6gnTfk=;
 b=j/K6FUw38OnClq1LqKlIFtrQHrbufb4uPr1CXU09M1/2astYIO6c5znY
 VFrq0ceWyjaTJ8+56r6K9zzzqBpR8kXMBfUpJumDpe8iaKqf3JivvdihF
 tvinYtZyWf3AQG+KHL2/e8c4wJxxfg72Jv0SSQ3uWTxL5L5u1pn89B2Ze
 YI2XTxM3/UUcOOrNV0aqX7WV9C4AyMfT8DVl2u/pgrF4CiiiPTe8Vmzvo
 71w2Zh4vRJtfWLExUO+0DNdW+P3mjZKhrUKpRS2reYIDvUkPWRTTXglbZ
 dPJR/n08rk89CzA1Geyr/SkFfOHYrt6iLoBTDTqLxJQkSIs3gSFknQ1uP g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="322819831"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="322819831"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 13:19:37 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="522045034"
Received: from ggunnam-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.28.195])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 13:19:37 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/11] ASoC: SOF: extend the interface to stop DMA trace
Date: Wed, 30 Mar 2022 13:19:21 -0700
Message-Id: <20220330201926.1330402-7-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220330201926.1330402-1-ranjani.sridharan@linux.intel.com>
References: <20220330201926.1330402-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Libin Yang <libin.yang@intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@intel.com>, broonie@kernel.org,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

From: Libin Yang <libin.yang@intel.com>

Change the interface to stop the DMA trace for suspend. Replace the
snd_sof_init_trace_ipc() and snd_sof_release_trace() calls with more
explicit interface for PM (the sole user for this interface).

The new snd_sof_trace_suspend() call takes the target PM state as argument,
allowing the trace implementation to decide how to handle the transition.
Use this information to release DMA resources only if DSP is suspended and
will not remain in D0.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Libin Yang <libin.yang@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/pm.c       |  8 +++----
 sound/soc/sof/sof-priv.h | 12 +++++++---
 sound/soc/sof/trace.c    | 52 +++++++++++++++++++++++++++++-----------
 3 files changed, 51 insertions(+), 21 deletions(-)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 1c319582ca6f..a1a645a13c6d 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -135,8 +135,8 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 		return ret;
 	}
 
-	/* resume DMA trace, only need send ipc */
-	ret = snd_sof_init_trace_ipc(sdev);
+	/* resume DMA trace */
+	ret = snd_sof_trace_resume(sdev);
 	if (ret < 0) {
 		/* non fatal */
 		dev_warn(sdev->dev,
@@ -209,8 +209,8 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 	if (tplg_ops->tear_down_all_pipelines)
 		tplg_ops->tear_down_all_pipelines(sdev, false);
 
-	/* release trace */
-	snd_sof_release_trace(sdev);
+	/* suspend DMA trace */
+	snd_sof_trace_suspend(sdev, pm_state);
 
 	/* Notify clients not managed by pm framework about core suspend */
 	sof_suspend_clients(sdev, pm_state);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index f75c6f76297e..0fb1db0ed7cd 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -403,6 +403,12 @@ struct snd_sof_ipc {
 	const struct sof_ipc_ops *ops;
 };
 
+enum sof_dtrace_state {
+	SOF_DTRACE_DISABLED,
+	SOF_DTRACE_STOPPED,
+	SOF_DTRACE_ENABLED,
+};
+
 /*
  * SOF Device Level.
  */
@@ -489,9 +495,9 @@ struct snd_sof_dev {
 	wait_queue_head_t trace_sleep;
 	u32 host_offset;
 	bool dtrace_is_supported; /* set with Kconfig or module parameter */
-	bool dtrace_is_enabled;
 	bool dtrace_error;
 	bool dtrace_draining;
+	enum sof_dtrace_state dtrace_state;
 
 	bool msi_enabled;
 
@@ -595,7 +601,6 @@ static inline void snd_sof_ipc_process_reply(struct snd_sof_dev *sdev, u32 msg_i
  * Trace/debug
  */
 int snd_sof_init_trace(struct snd_sof_dev *sdev);
-void snd_sof_release_trace(struct snd_sof_dev *sdev);
 void snd_sof_free_trace(struct snd_sof_dev *sdev);
 int snd_sof_dbg_init(struct snd_sof_dev *sdev);
 void snd_sof_free_debug(struct snd_sof_dev *sdev);
@@ -609,7 +614,8 @@ void sof_print_oops_and_stack(struct snd_sof_dev *sdev, const char *level,
 			      u32 panic_code, u32 tracep_code, void *oops,
 			      struct sof_ipc_panic_info *panic_info,
 			      void *stack, size_t stack_words);
-int snd_sof_init_trace_ipc(struct snd_sof_dev *sdev);
+void snd_sof_trace_suspend(struct snd_sof_dev *sdev, pm_message_t pm_state);
+int snd_sof_trace_resume(struct snd_sof_dev *sdev);
 void snd_sof_handle_fw_exception(struct snd_sof_dev *sdev);
 int snd_sof_dbg_memory_info_init(struct snd_sof_dev *sdev);
 int snd_sof_debugfs_add_region_item_iomem(struct snd_sof_dev *sdev,
diff --git a/sound/soc/sof/trace.c b/sound/soc/sof/trace.c
index ea8e4506d02e..26d9381596ff 100644
--- a/sound/soc/sof/trace.c
+++ b/sound/soc/sof/trace.c
@@ -11,6 +11,7 @@
 #include <linux/debugfs.h>
 #include <linux/sched/signal.h>
 #include "sof-priv.h"
+#include "sof-audio.h"
 #include "ops.h"
 #include "sof-utils.h"
 
@@ -263,7 +264,7 @@ static size_t sof_wait_trace_avail(struct snd_sof_dev *sdev,
 	if (ret)
 		return ret;
 
-	if (!sdev->dtrace_is_enabled && sdev->dtrace_draining) {
+	if (sdev->dtrace_state != SOF_DTRACE_ENABLED && sdev->dtrace_draining) {
 		/*
 		 * tracing has ended and all traces have been
 		 * read by client, return EOF
@@ -344,7 +345,7 @@ static int sof_dfsentry_trace_release(struct inode *inode, struct file *file)
 	struct snd_sof_dev *sdev = dfse->sdev;
 
 	/* avoid duplicate traces at next open */
-	if (!sdev->dtrace_is_enabled)
+	if (sdev->dtrace_state != SOF_DTRACE_ENABLED)
 		sdev->host_offset = 0;
 
 	return 0;
@@ -384,7 +385,7 @@ static int trace_debugfs_create(struct snd_sof_dev *sdev)
 	return 0;
 }
 
-int snd_sof_init_trace_ipc(struct snd_sof_dev *sdev)
+static int snd_sof_enable_trace(struct snd_sof_dev *sdev)
 {
 	struct sof_ipc_fw_ready *ready = &sdev->fw_ready;
 	struct sof_ipc_fw_version *v = &ready->version;
@@ -395,9 +396,12 @@ int snd_sof_init_trace_ipc(struct snd_sof_dev *sdev)
 	if (!sdev->dtrace_is_supported)
 		return 0;
 
-	if (sdev->dtrace_is_enabled || !sdev->dma_trace_pages)
+	if (sdev->dtrace_state == SOF_DTRACE_ENABLED || !sdev->dma_trace_pages)
 		return -EINVAL;
 
+	if (sdev->dtrace_state == SOF_DTRACE_STOPPED)
+		goto start;
+
 	/* set IPC parameters */
 	params.hdr.cmd = SOF_IPC_GLB_TRACE_MSG;
 	/* PARAMS_EXT is only supported from ABI 3.7.0 onwards */
@@ -435,6 +439,7 @@ int snd_sof_init_trace_ipc(struct snd_sof_dev *sdev)
 		goto trace_release;
 	}
 
+start:
 	ret = snd_sof_dma_trace_trigger(sdev, SNDRV_PCM_TRIGGER_START);
 	if (ret < 0) {
 		dev_err(sdev->dev,
@@ -442,7 +447,7 @@ int snd_sof_init_trace_ipc(struct snd_sof_dev *sdev)
 		goto trace_release;
 	}
 
-	sdev->dtrace_is_enabled = true;
+	sdev->dtrace_state = SOF_DTRACE_ENABLED;
 
 	return 0;
 
@@ -459,7 +464,7 @@ int snd_sof_init_trace(struct snd_sof_dev *sdev)
 		return 0;
 
 	/* set false before start initialization */
-	sdev->dtrace_is_enabled = false;
+	sdev->dtrace_state = SOF_DTRACE_DISABLED;
 
 	/* allocate trace page table buffer */
 	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, sdev->dev,
@@ -498,7 +503,7 @@ int snd_sof_init_trace(struct snd_sof_dev *sdev)
 
 	init_waitqueue_head(&sdev->trace_sleep);
 
-	ret = snd_sof_init_trace_ipc(sdev);
+	ret = snd_sof_enable_trace(sdev);
 	if (ret < 0)
 		goto table_err;
 
@@ -518,7 +523,8 @@ int snd_sof_trace_update_pos(struct snd_sof_dev *sdev,
 	if (!sdev->dtrace_is_supported)
 		return 0;
 
-	if (sdev->dtrace_is_enabled && sdev->host_offset != posn->host_offset) {
+	if (sdev->dtrace_state == SOF_DTRACE_ENABLED &&
+	    sdev->host_offset != posn->host_offset) {
 		sdev->host_offset = posn->host_offset;
 		wake_up(&sdev->trace_sleep);
 	}
@@ -537,14 +543,14 @@ void snd_sof_trace_notify_for_error(struct snd_sof_dev *sdev)
 	if (!sdev->dtrace_is_supported)
 		return;
 
-	if (sdev->dtrace_is_enabled) {
+	if (sdev->dtrace_state == SOF_DTRACE_ENABLED) {
 		sdev->dtrace_error = true;
 		wake_up(&sdev->trace_sleep);
 	}
 }
 EXPORT_SYMBOL(snd_sof_trace_notify_for_error);
 
-void snd_sof_release_trace(struct snd_sof_dev *sdev)
+static void snd_sof_release_trace(struct snd_sof_dev *sdev, bool only_stop)
 {
 	struct sof_ipc_fw_ready *ready = &sdev->fw_ready;
 	struct sof_ipc_fw_version *v = &ready->version;
@@ -552,13 +558,14 @@ void snd_sof_release_trace(struct snd_sof_dev *sdev)
 	struct sof_ipc_reply ipc_reply;
 	int ret;
 
-	if (!sdev->dtrace_is_supported || !sdev->dtrace_is_enabled)
+	if (!sdev->dtrace_is_supported || sdev->dtrace_state == SOF_DTRACE_DISABLED)
 		return;
 
 	ret = snd_sof_dma_trace_trigger(sdev, SNDRV_PCM_TRIGGER_STOP);
 	if (ret < 0)
 		dev_err(sdev->dev,
 			"error: snd_sof_dma_trace_trigger: stop: %d\n", ret);
+	sdev->dtrace_state = SOF_DTRACE_STOPPED;
 
 	/*
 	 * stop and free trace DMA in the DSP. TRACE_DMA_FREE is only supported from
@@ -574,23 +581,40 @@ void snd_sof_release_trace(struct snd_sof_dev *sdev)
 			dev_err(sdev->dev, "DMA_TRACE_FREE failed with error: %d\n", ret);
 	}
 
+	if (only_stop)
+		goto out;
+
 	ret = snd_sof_dma_trace_release(sdev);
 	if (ret < 0)
 		dev_err(sdev->dev,
 			"error: fail in snd_sof_dma_trace_release %d\n", ret);
 
-	sdev->dtrace_is_enabled = false;
+	sdev->dtrace_state = SOF_DTRACE_DISABLED;
+
+out:
 	sdev->dtrace_draining = true;
 	wake_up(&sdev->trace_sleep);
 }
-EXPORT_SYMBOL(snd_sof_release_trace);
+
+void snd_sof_trace_suspend(struct snd_sof_dev *sdev, pm_message_t pm_state)
+{
+	snd_sof_release_trace(sdev, pm_state.event == SOF_DSP_PM_D0);
+}
+EXPORT_SYMBOL(snd_sof_trace_suspend);
+
+int snd_sof_trace_resume(struct snd_sof_dev *sdev)
+{
+	return snd_sof_enable_trace(sdev);
+}
+EXPORT_SYMBOL(snd_sof_trace_resume);
 
 void snd_sof_free_trace(struct snd_sof_dev *sdev)
 {
 	if (!sdev->dtrace_is_supported)
 		return;
 
-	snd_sof_release_trace(sdev);
+	/* release trace */
+	snd_sof_release_trace(sdev, false);
 
 	if (sdev->dma_trace_pages) {
 		snd_dma_free_pages(&sdev->dmatb);
-- 
2.25.1

