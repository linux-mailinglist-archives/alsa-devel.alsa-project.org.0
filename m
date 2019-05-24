Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1DD29F17
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 21:27:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B66BC1763;
	Fri, 24 May 2019 21:26:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B66BC1763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558726061;
	bh=pz6JN40JcPZ9b1vFnKWJdIbw9txFCNQku5MHZ+ukh3A=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sQKDSdr7gfK7QMVw+WHT8FqweJ2gpMlwfFX4Tz5wjPsxkYxdJFodpqi7j7+hL54o4
	 FcQafs2T1DSQ3vDvpc3ePcNT51KTEABCLesxPBA3MqD7HLxbmLZDfsBjOdMzg5brLl
	 20CEBD08kR/HpBgV9Br7WDjfzlqn8Ks2Zdpm4E9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94067F89735;
	Fri, 24 May 2019 21:23:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 359D2F89720; Fri, 24 May 2019 21:23:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7E85F89625
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 21:23:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7E85F89625
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 May 2019 12:23:17 -0700
X-ExtLoop1: 1
Received: from tattafos-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.178.85])
 by orsmga002.jf.intel.com with ESMTP; 24 May 2019 12:23:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 24 May 2019 14:23:07 -0500
Message-Id: <20190524192309.6359-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190524192309.6359-1-pierre-louis.bossart@linux.intel.com>
References: <20190524192309.6359-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 3/5] ASoC: SOF: trace: move to opt-in with
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
index a9a1d502daae..b56b0a4982cd 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -131,6 +131,14 @@ config SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE
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
 endif ## SND_SOC_SOF_DEBUG
 
 endif ## SND_SOC_SOF_OPTIONS
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
index 01a6219c326b..03d852293d27 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -415,6 +415,7 @@ struct snd_sof_dev {
 	int dma_trace_pages;
 	wait_queue_head_t trace_sleep;
 	u32 host_offset;
+	u32 dtrace_is_supported; /* set with Kconfig or module parameter */
 	u32 dtrace_is_enabled;
 	u32 dtrace_error;
 	u32 dtrace_draining;
diff --git a/sound/soc/sof/trace.c b/sound/soc/sof/trace.c
index b02520f8e595..2613dd3e0dfc 100644
--- a/sound/soc/sof/trace.c
+++ b/sound/soc/sof/trace.c
@@ -165,6 +165,9 @@ int snd_sof_init_trace_ipc(struct snd_sof_dev *sdev)
 	struct sof_ipc_reply ipc_reply;
 	int ret;
 
+	if (!sdev->dtrace_is_supported)
+		return 0;
+
 	if (sdev->dtrace_is_enabled || !sdev->dma_trace_pages)
 		return -EINVAL;
 
@@ -217,6 +220,9 @@ int snd_sof_init_trace(struct snd_sof_dev *sdev)
 {
 	int ret;
 
+	if (!sdev->dtrace_is_supported)
+		return 0;
+
 	/* set false before start initialization */
 	sdev->dtrace_is_enabled = false;
 
@@ -272,6 +278,9 @@ EXPORT_SYMBOL(snd_sof_init_trace);
 int snd_sof_trace_update_pos(struct snd_sof_dev *sdev,
 			     struct sof_ipc_dma_trace_posn *posn)
 {
+	if (!sdev->dtrace_is_supported)
+		return 0;
+
 	if (sdev->dtrace_is_enabled && sdev->host_offset != posn->host_offset) {
 		sdev->host_offset = posn->host_offset;
 		wake_up(&sdev->trace_sleep);
@@ -288,6 +297,9 @@ int snd_sof_trace_update_pos(struct snd_sof_dev *sdev,
 /* an error has occurred within the DSP that prevents further trace */
 void snd_sof_trace_notify_for_error(struct snd_sof_dev *sdev)
 {
+	if (!sdev->dtrace_is_supported)
+		return;
+
 	if (sdev->dtrace_is_enabled) {
 		dev_err(sdev->dev, "error: waking up any trace sleepers\n");
 		sdev->dtrace_error = true;
@@ -300,7 +312,7 @@ void snd_sof_release_trace(struct snd_sof_dev *sdev)
 {
 	int ret;
 
-	if (!sdev->dtrace_is_enabled)
+	if (!sdev->dtrace_is_supported || !sdev->dtrace_is_enabled)
 		return;
 
 	ret = snd_sof_dma_trace_trigger(sdev, SNDRV_PCM_TRIGGER_STOP);
@@ -321,6 +333,9 @@ EXPORT_SYMBOL(snd_sof_release_trace);
 
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
