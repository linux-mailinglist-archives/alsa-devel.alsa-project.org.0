Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0DBC3F3F
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 20:02:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87631168B;
	Tue,  1 Oct 2019 20:01:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87631168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569952929;
	bh=dP1imH22as9cWmJoepVqUTw9TtroIbBxj6AtZ1LyvEw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ChFr4SEJyD0UZ84U1L/HvvrULLIvT0drZb+8v0ihZAwWLX0upWUzM9yt9a9nnETDn
	 E9bmj3moYpfm2/aPCbR61CDXUALb+XRKROcmP8pt0b3AO4O+4Mi8amycqJbkWkz9Mh
	 bPmXfBOCZr2jGuBcQZPF0rcxnZSTEMy3RdgWwuIw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94802F8063A;
	Tue,  1 Oct 2019 19:57:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E92F7F805E1; Tue,  1 Oct 2019 19:56:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21C1BF80634
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 19:56:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21C1BF80634
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="SotlZ+pY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=zP4Uow8Db/+xwDTIZBrTtJfMN/Pb9fRgFyaumdZXM9k=; b=SotlZ+pYDCxb
 yWiXhqULJ0GRu9t/0LbbSSgAVKls0wPV8eubBZzQFt821cC9tViLUD6GbHsBPXICjUV3IAzaX/Sdt
 drl9C2xrTn5dRQWpAGwiheL+HvFAhWYZw6L1OH5kVmQTiDoHLBB+IQCfOHPGVU9BbTGZL0Wy1yYxx
 70uKs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFMOF-0005sj-HS; Tue, 01 Oct 2019 17:56:47 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 090462742A30; Tue,  1 Oct 2019 18:56:46 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20190927200538.660-4-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001175647.090462742A30@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 18:56:46 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: trace: move to opt-in with Kconfig
	and module parameter" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: trace: move to opt-in with Kconfig and module parameter

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 2ab4c50f6955514150f83b47b7aee3ba5fe3ac1d Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Fri, 27 Sep 2019 15:05:28 -0500
Subject: [PATCH] ASoC: SOF: trace: move to opt-in with Kconfig and module
 parameter

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
Link: https://lore.kernel.org/r/20190927200538.660-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/Kconfig    |  8 ++++++++
 sound/soc/sof/core.c     | 25 +++++++++++++++++++------
 sound/soc/sof/sof-priv.h | 13 +++++++++----
 sound/soc/sof/trace.c    | 17 ++++++++++++++++-
 4 files changed, 52 insertions(+), 11 deletions(-)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index bb8036ae567e..cc592bcadae7 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -142,6 +142,14 @@ config SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE
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
index 81f28f7ff1a0..15167b8220ed 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -16,6 +16,11 @@
 #include "sof-priv.h"
 #include "ops.h"
 
+/* see SOF_DBG_ flags */
+int sof_core_debug;
+module_param_named(sof_debug, sof_core_debug, int, 0444);
+MODULE_PARM_DESC(sof_debug, "SOF core debug options (0x0 all off)");
+
 /* SOF defaults if not provided by the platform in ms */
 #define TIMEOUT_DEFAULT_IPC_MS  500
 #define TIMEOUT_DEFAULT_BOOT_MS 2000
@@ -350,12 +355,20 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 		goto fw_run_err;
 	}
 
-	/* init DMA trace */
-	ret = snd_sof_init_trace(sdev);
-	if (ret < 0) {
-		/* non fatal */
-		dev_warn(sdev->dev,
-			 "warning: failed to initialize trace %d\n", ret);
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_FIRMWARE_TRACE) ||
+	    (sof_core_debug & SOF_DBG_ENABLE_TRACE)) {
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
index 730f3259dd02..d5b1a4f895da 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -28,10 +28,14 @@
 #include <uapi/sound/sof/fw.h>
 
 /* debug flags */
-#define SOF_DBG_REGS	BIT(1)
-#define SOF_DBG_MBOX	BIT(2)
-#define SOF_DBG_TEXT	BIT(3)
-#define SOF_DBG_PCI	BIT(4)
+#define SOF_DBG_ENABLE_TRACE	BIT(0)
+#define SOF_DBG_REGS		BIT(1)
+#define SOF_DBG_MBOX		BIT(2)
+#define SOF_DBG_TEXT		BIT(3)
+#define SOF_DBG_PCI		BIT(4)
+
+/* global debug state set by SOF_DBG_ flags */
+extern int sof_core_debug;
 
 /* max BARs mmaped devices can use */
 #define SND_SOF_BARS	8
@@ -434,6 +438,7 @@ struct snd_sof_dev {
 	int dma_trace_pages;
 	wait_queue_head_t trace_sleep;
 	u32 host_offset;
+	u32 dtrace_is_supported; /* set with Kconfig or module parameter */
 	u32 dtrace_is_enabled;
 	u32 dtrace_error;
 	u32 dtrace_draining;
diff --git a/sound/soc/sof/trace.c b/sound/soc/sof/trace.c
index 4c3cff031fd6..b0e4556c8536 100644
--- a/sound/soc/sof/trace.c
+++ b/sound/soc/sof/trace.c
@@ -162,6 +162,9 @@ int snd_sof_init_trace_ipc(struct snd_sof_dev *sdev)
 	struct sof_ipc_reply ipc_reply;
 	int ret;
 
+	if (!sdev->dtrace_is_supported)
+		return 0;
+
 	if (sdev->dtrace_is_enabled || !sdev->dma_trace_pages)
 		return -EINVAL;
 
@@ -222,6 +225,9 @@ int snd_sof_init_trace(struct snd_sof_dev *sdev)
 {
 	int ret;
 
+	if (!sdev->dtrace_is_supported)
+		return 0;
+
 	/* set false before start initialization */
 	sdev->dtrace_is_enabled = false;
 
@@ -277,6 +283,9 @@ EXPORT_SYMBOL(snd_sof_init_trace);
 int snd_sof_trace_update_pos(struct snd_sof_dev *sdev,
 			     struct sof_ipc_dma_trace_posn *posn)
 {
+	if (!sdev->dtrace_is_supported)
+		return 0;
+
 	if (sdev->dtrace_is_enabled && sdev->host_offset != posn->host_offset) {
 		sdev->host_offset = posn->host_offset;
 		wake_up(&sdev->trace_sleep);
@@ -293,6 +302,9 @@ int snd_sof_trace_update_pos(struct snd_sof_dev *sdev,
 /* an error has occurred within the DSP that prevents further trace */
 void snd_sof_trace_notify_for_error(struct snd_sof_dev *sdev)
 {
+	if (!sdev->dtrace_is_supported)
+		return;
+
 	if (sdev->dtrace_is_enabled) {
 		dev_err(sdev->dev, "error: waking up any trace sleepers\n");
 		sdev->dtrace_error = true;
@@ -305,7 +317,7 @@ void snd_sof_release_trace(struct snd_sof_dev *sdev)
 {
 	int ret;
 
-	if (!sdev->dtrace_is_enabled)
+	if (!sdev->dtrace_is_supported || !sdev->dtrace_is_enabled)
 		return;
 
 	ret = snd_sof_dma_trace_trigger(sdev, SNDRV_PCM_TRIGGER_STOP);
@@ -326,6 +338,9 @@ EXPORT_SYMBOL(snd_sof_release_trace);
 
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
