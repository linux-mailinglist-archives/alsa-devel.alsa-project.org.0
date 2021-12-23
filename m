Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB4947E268
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 12:38:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B69061853;
	Thu, 23 Dec 2021 12:37:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B69061853
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640259528;
	bh=/wlZ8DyxRUmqfQm9ZXK31HDGWeexHXsFXisouT+nn94=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uR3Vw9dxpylrDCWKyvX3FO+jDch3rhaaWrXGso9cPkgi2ByUO9MYA2IcKCgQJQ4zU
	 1rllJxl/6aad0iLtuRsJ8CmndESWYXDecdBS4gpinoptzwM4gvhBhTrz5jmQ6xdJZi
	 v8lm71wDNLnwo8AAZ/COHrhGg3v7Q8EVmYwsktPw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCF16F80516;
	Thu, 23 Dec 2021 12:36:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE0CCF804FA; Thu, 23 Dec 2021 12:36:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32F14F80084
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 12:36:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32F14F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BehgdtTY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640259382; x=1671795382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/wlZ8DyxRUmqfQm9ZXK31HDGWeexHXsFXisouT+nn94=;
 b=BehgdtTYuLySRBJf/iYMKupW8/RdPp21fL6jlXHM0r7SsPKCHe3cQhJQ
 hYedqeX8Ff8V8GA6j0VpHAg4T09eHgK6XX3BdV6CRUV2BlKuQG9hYGqdI
 GrTR++zjzh+7m9kgPcma4Ubx3/Eqa4W2gQ142z3yxoD/CVFr9meyZP36N
 EwOrT16R24j3gLbFLr1xGfTA/xRAYAcIlIQuPK//bXyAJ4u2BxVPcDqA7
 RJu6VPtKDE29r3NJHUycuaARA8H4/2MVheHUBD+c30JnFpT0xO61Mysxz
 M1m4+2NE2J8yQZs3UwLuqbuCF9upVCv+s1gfgd9zT+Wi3jdaeXSIgT/EJ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="304180798"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="304180798"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="522065073"
Received: from gcatala-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.214.126])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:16 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 04/20] ASoC: SOF: Use sof_debug_check_flag() instead of
 sof_core_debug directly
Date: Thu, 23 Dec 2021 13:36:12 +0200
Message-Id: <20211223113628.18582-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211223113628.18582-1-peter.ujfalusi@linux.intel.com>
References: <20211223113628.18582-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 chao.song@intel.com, daniel.baluta@nxp.com
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

The sof_debug_check_flag() is available for checking flags set in
sof_core_debug.

sof_core_debug can be marked static in core.c

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/core.c     |  4 ++--
 sound/soc/sof/debug.c    |  6 +++---
 sound/soc/sof/sof-priv.h |  1 -
 sound/soc/sof/topology.c | 12 ++++++------
 4 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 1224a7da053a..00f8ffee2866 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -19,7 +19,7 @@
 #endif
 
 /* see SOF_DBG_ flags */
-int sof_core_debug =  IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_FIRMWARE_TRACE);
+static int sof_core_debug =  IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_FIRMWARE_TRACE);
 module_param_named(sof_debug, sof_core_debug, int, 0444);
 MODULE_PARM_DESC(sof_debug, "SOF core debug options (0x0 all off)");
 
@@ -218,7 +218,7 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 		goto fw_run_err;
 	}
 
-	if (sof_core_debug & SOF_DBG_ENABLE_TRACE) {
+	if (sof_debug_check_flag(SOF_DBG_ENABLE_TRACE)) {
 		sdev->dtrace_is_supported = true;
 
 		/* init DMA trace */
diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 2f8b5ac9b78a..9e4a128b5918 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -957,7 +957,7 @@ static void snd_sof_dbg_print_fw_state(struct snd_sof_dev *sdev)
 
 void snd_sof_dsp_dbg_dump(struct snd_sof_dev *sdev, u32 flags)
 {
-	bool print_all = !!(sof_core_debug & SOF_DBG_PRINT_ALL_DUMPS);
+	bool print_all = sof_debug_check_flag(SOF_DBG_PRINT_ALL_DUMPS);
 
 	if (flags & SOF_DBG_DUMP_OPTIONAL && !print_all)
 		return;
@@ -979,7 +979,7 @@ static void snd_sof_ipc_dump(struct snd_sof_dev *sdev)
 		dev_err(sdev->dev, "------------[ IPC dump start ]------------\n");
 		sof_ops(sdev)->ipc_dump(sdev);
 		dev_err(sdev->dev, "------------[ IPC dump end ]------------\n");
-		if (!(sof_core_debug & SOF_DBG_PRINT_ALL_DUMPS))
+		if (!sof_debug_check_flag(SOF_DBG_PRINT_ALL_DUMPS))
 			sdev->ipc_dump_printed = true;
 	}
 }
@@ -987,7 +987,7 @@ static void snd_sof_ipc_dump(struct snd_sof_dev *sdev)
 void snd_sof_handle_fw_exception(struct snd_sof_dev *sdev)
 {
 	if (IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_RETAIN_DSP_CONTEXT) ||
-	    (sof_core_debug & SOF_DBG_RETAIN_CTX)) {
+	    sof_debug_check_flag(SOF_DBG_RETAIN_CTX)) {
 		/* should we prevent DSP entering D3 ? */
 		if (!sdev->ipc_dump_printed)
 			dev_info(sdev->dev,
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 35c5b2d6930b..0f849cdbfbc8 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -42,7 +42,6 @@
 #define SOF_DBG_DUMP_OPTIONAL		BIT(4) /* only dump if SOF_DBG_PRINT_ALL_DUMPS is set */
 
 /* global debug state set by SOF_DBG_ flags */
-extern int sof_core_debug;
 bool sof_debug_check_flag(int mask);
 
 /* max BARs mmaped devices can use */
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index ec59baf32699..e72dcae5e7ee 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1695,12 +1695,12 @@ static int sof_widget_load_pipeline(struct snd_soc_component *scomp, int index,
 		goto err;
 	}
 
-	if (sof_core_debug & SOF_DBG_DISABLE_MULTICORE)
+	if (sof_debug_check_flag(SOF_DBG_DISABLE_MULTICORE))
 		pipeline->core = SOF_DSP_PRIMARY_CORE;
 
-	if (sof_core_debug & SOF_DBG_DYNAMIC_PIPELINES_OVERRIDE)
-		swidget->dynamic_pipeline_widget = sof_core_debug &
-			SOF_DBG_DYNAMIC_PIPELINES_ENABLE;
+	if (sof_debug_check_flag(SOF_DBG_DYNAMIC_PIPELINES_OVERRIDE))
+		swidget->dynamic_pipeline_widget =
+			sof_debug_check_flag(SOF_DBG_DYNAMIC_PIPELINES_ENABLE);
 
 	dev_dbg(scomp->dev, "pipeline %s: period %d pri %d mips %d core %d frames %d dynamic %d\n",
 		swidget->widget->name, pipeline->period, pipeline->priority,
@@ -2295,7 +2295,7 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 		return ret;
 	}
 
-	if (sof_core_debug & SOF_DBG_DISABLE_MULTICORE)
+	if (sof_debug_check_flag(SOF_DBG_DISABLE_MULTICORE))
 		comp.core = SOF_DSP_PRIMARY_CORE;
 
 	swidget->core = comp.core;
@@ -3542,7 +3542,7 @@ static int sof_complete(struct snd_soc_component *scomp)
 	}
 
 	/* verify topology components loading including dynamic pipelines */
-	if (sof_core_debug & SOF_DBG_VERIFY_TPLG) {
+	if (sof_debug_check_flag(SOF_DBG_VERIFY_TPLG)) {
 		ret = sof_set_up_pipelines(sdev, true);
 		if (ret < 0) {
 			dev_err(sdev->dev, "error: topology verification failed %d\n", ret);
-- 
2.34.1

