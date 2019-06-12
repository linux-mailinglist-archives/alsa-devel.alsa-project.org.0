Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C31542CA6
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 18:50:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA49B177F;
	Wed, 12 Jun 2019 18:49:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA49B177F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560358205;
	bh=et9ZsYxNgdgPTmqYPGplMLlscWQECNyVoVTvDTToIh4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HELgAOjAADbyVe7FZoqtmraCjAEj3hM4qqKrM/iPLlepZECLG7wFOP237MHwJU6lk
	 11i6giGS56zms2T026OTp8g/BxxIjbflRIaejUL6LfS6iBGSkKYJmv1tdJfn8weZIN
	 Enx4W9UvyJiYvAsri8LrfzJ9XCXJKimS7nCnel64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D83EF89716;
	Wed, 12 Jun 2019 18:47:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A5D8F896FA; Wed, 12 Jun 2019 18:47:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F2D8F896CE
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 18:47:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F2D8F896CE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 09:47:32 -0700
X-ExtLoop1: 1
Received: from adorrell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.122])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Jun 2019 09:47:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 12 Jun 2019 11:47:24 -0500
Message-Id: <20190612164726.26768-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612164726.26768-1-pierre-louis.bossart@linux.intel.com>
References: <20190612164726.26768-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 1/3] ASoC: SOF: trace: move to opt-in with
	Kconfig and module parameter
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

In a number of debug cases, the DMA-based trace can add problems
(e.g. with HDaudio channel allocation). It also generates additional
traffic on the bus and if the DMA handling is unreliable will prevent
audio use-cases from working normally. Using the trace also requires
tools to be installed on the target.

The trace can be instead handled as dynamic debug. We can use a
Kconfig to force the trace to be enabled in all cases, or use a module
parameter to enable it on a need-basis, e.g. by setting "options
snd_sof sof_debug=0x1" in a /etc/modprobe.d file.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/Kconfig    |  8 ++++++++
 sound/soc/sof/core.c     | 26 ++++++++++++++++++++------
 sound/soc/sof/sof-priv.h |  1 +
 sound/soc/sof/trace.c    | 17 ++++++++++++++++-
 4 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 41f79cdcbf47..efb4cf3eec56 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -132,6 +132,14 @@ config SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE
 	  Say Y if you want to enable caching the memory windows.
 	  If unsure, select "N".
 
+config SND_SOC_SOF_DEBUG_ENABLE_FIRMWARE_TRACE
+	bool "SOF enable firmware trace"
+	help
+	  The firmware trace can be enabled either at build-time with
+	  this option, or dynamically by setting flags in the SOF core
+	  module parameter (similar to dynamic debug)
+	  If unsure, select "N".
+
 config SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST
 	bool "SOF enable IPC flood test"
 	help
diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 5beda47cdf9f..70b471be07b2 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -16,6 +16,12 @@
 #include "sof-priv.h"
 #include "ops.h"
 
+static int sof_core_debug;
+module_param_named(sof_debug, sof_core_debug, int, 0444);
+MODULE_PARM_DESC(sof_debug, "SOF core debug options (0x0 all off)");
+
+#define SOF_CORE_ENABLE_TRACE BIT(0)
+
 /* SOF defaults if not provided by the platform in ms */
 #define TIMEOUT_DEFAULT_IPC_MS  5
 #define TIMEOUT_DEFAULT_BOOT_MS 100
@@ -350,12 +356,20 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 		goto fw_run_err;
 	}
 
-	/* init DMA trace */
-	ret = snd_sof_init_trace(sdev);
-	if (ret < 0) {
-		/* non fatal */
-		dev_warn(sdev->dev,
-			 "warning: failed to initialize trace %d\n", ret);
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_FIRMWARE_TRACE) ||
+	    (sof_core_debug & SOF_CORE_ENABLE_TRACE)) {
+		sdev->dtrace_is_supported = true;
+
+		/* init DMA trace */
+		ret = snd_sof_init_trace(sdev);
+		if (ret < 0) {
+			/* non fatal */
+			dev_warn(sdev->dev,
+				 "warning: failed to initialize trace %d\n",
+				 ret);
+		}
+	} else {
+		dev_dbg(sdev->dev, "SOF firmware trace disabled\n");
 	}
 
 	/* hereafter all FW boot flows are for PM reasons */
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 17f3d2a5a701..563623bcaad6 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -419,6 +419,7 @@ struct snd_sof_dev {
 	int dma_trace_pages;
 	wait_queue_head_t trace_sleep;
 	u32 host_offset;
+	u32 dtrace_is_supported; /* set with Kconfig or module parameter */
 	u32 dtrace_is_enabled;
 	u32 dtrace_error;
 	u32 dtrace_draining;
diff --git a/sound/soc/sof/trace.c b/sound/soc/sof/trace.c
index befed975161c..84d89206a0e0 100644
--- a/sound/soc/sof/trace.c
+++ b/sound/soc/sof/trace.c
@@ -167,6 +167,9 @@ int snd_sof_init_trace_ipc(struct snd_sof_dev *sdev)
 	struct sof_ipc_reply ipc_reply;
 	int ret;
 
+	if (!sdev->dtrace_is_supported)
+		return 0;
+
 	if (sdev->dtrace_is_enabled || !sdev->dma_trace_pages)
 		return -EINVAL;
 
@@ -227,6 +230,9 @@ int snd_sof_init_trace(struct snd_sof_dev *sdev)
 {
 	int ret;
 
+	if (!sdev->dtrace_is_supported)
+		return 0;
+
 	/* set false before start initialization */
 	sdev->dtrace_is_enabled = false;
 
@@ -282,6 +288,9 @@ EXPORT_SYMBOL(snd_sof_init_trace);
 int snd_sof_trace_update_pos(struct snd_sof_dev *sdev,
 			     struct sof_ipc_dma_trace_posn *posn)
 {
+	if (!sdev->dtrace_is_supported)
+		return 0;
+
 	if (sdev->dtrace_is_enabled && sdev->host_offset != posn->host_offset) {
 		sdev->host_offset = posn->host_offset;
 		wake_up(&sdev->trace_sleep);
@@ -298,6 +307,9 @@ int snd_sof_trace_update_pos(struct snd_sof_dev *sdev,
 /* an error has occurred within the DSP that prevents further trace */
 void snd_sof_trace_notify_for_error(struct snd_sof_dev *sdev)
 {
+	if (!sdev->dtrace_is_supported)
+		return;
+
 	if (sdev->dtrace_is_enabled) {
 		dev_err(sdev->dev, "error: waking up any trace sleepers\n");
 		sdev->dtrace_error = true;
@@ -310,7 +322,7 @@ void snd_sof_release_trace(struct snd_sof_dev *sdev)
 {
 	int ret;
 
-	if (!sdev->dtrace_is_enabled)
+	if (!sdev->dtrace_is_supported || !sdev->dtrace_is_enabled)
 		return;
 
 	ret = snd_sof_dma_trace_trigger(sdev, SNDRV_PCM_TRIGGER_STOP);
@@ -331,6 +343,9 @@ EXPORT_SYMBOL(snd_sof_release_trace);
 
 void snd_sof_free_trace(struct snd_sof_dev *sdev)
 {
+	if (!sdev->dtrace_is_supported)
+		return;
+
 	snd_sof_release_trace(sdev);
 
 	snd_dma_free_pages(&sdev->dmatb);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
