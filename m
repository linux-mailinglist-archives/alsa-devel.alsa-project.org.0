Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6618B528283
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 12:48:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D046E1680;
	Mon, 16 May 2022 12:47:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D046E1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652698111;
	bh=UGwKRk4cWTNgwF2Wv+HiO1LYQNBjEmeVJ8ld7RI01FI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fs6RvRBGyRpk/ZSJz6HdfgiXISXsRMmyKpd2vHfIirflEcYe49dnyDD+2oXgNVfUE
	 FuiDU4TjVP2kll9+RswP5enVafbWK8l7ByZljRz3vjbF6nsXjGwd/fe4WgqeDGYAha
	 9Sm+x7qZDMe33peOsKS6JQpB+abba8uIEoycMc2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 240D2F8051C;
	Mon, 16 May 2022 12:47:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D0A5F800D8; Mon, 16 May 2022 12:47:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6063F800D8
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 12:47:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6063F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BvlBNez6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652698045; x=1684234045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UGwKRk4cWTNgwF2Wv+HiO1LYQNBjEmeVJ8ld7RI01FI=;
 b=BvlBNez6Ajbf4U8KESKfEuac4g3MVAV+c1GkFSsvzk0ydN6KPUvh04wj
 MJaMg7BYr4YSh03PnXsi2CtEtCGS7xg3nu7V4CtRf5MSrof8ccfGkXRMM
 P5eCLVOTfotj54PAGIZEcu9FAf0j1istoHbiCgk+B9k8zDudeHKqBv+vE
 ZEwOpOeD2TlnCMdD9NP69ar+ORxdmtyVbyIS5JNfN3TroILziKiftlNsD
 RABYaDZEUkuRC9qsssSIrabmBiwp+Q8S6Mn2HqfEFmWou7SEQ7q2MscTK
 MzLLOGCxIFX+DNYE8P/l4ULQ6hUst3hx7EUu7Bagv3a9IpGhRmjmRaS5D A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="333853239"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="333853239"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 03:46:52 -0700
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="596459785"
Received: from afialcko-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.51.55])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 03:46:50 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com,
 AjitKumar.Pandey@amd.com
Subject: [PATCH 2/8] ASoC: SOF: Rename dtrace_is_supported flag to
 fw_trace_is_supported
Date: Mon, 16 May 2022 13:47:05 +0300
Message-Id: <20220516104711.26115-3-peter.ujfalusi@linux.intel.com>
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

Rename the internal flag to not limit it's use for dma-trace, but to be
used for generic firmware tracing functionality.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/core.c          |  2 +-
 sound/soc/sof/intel/hda-dsp.c |  2 +-
 sound/soc/sof/sof-priv.h      |  4 +++-
 sound/soc/sof/trace.c         | 14 +++++++-------
 4 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 2d12e8bab769..ff636f0e2435 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -250,7 +250,7 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 	}
 
 	if (sof_debug_check_flag(SOF_DBG_ENABLE_TRACE)) {
-		sdev->dtrace_is_supported = true;
+		sdev->fw_trace_is_supported = true;
 
 		/* init DMA trace */
 		ret = snd_sof_init_trace(sdev);
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index c068a3f2f6df..000ea906670c 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -432,7 +432,7 @@ static int hda_dsp_set_D0_state(struct snd_sof_dev *sdev,
 		 * when the DSP enters D0I3 while the system is in S0
 		 * for debug purpose.
 		 */
-		if (!sdev->dtrace_is_supported ||
+		if (!sdev->fw_trace_is_supported ||
 		    !hda_enable_trace_D0I3_S0 ||
 		    sdev->system_suspend_target != SOF_SUSPEND_NONE)
 			flags = HDA_PM_NO_DMA_TRACE;
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index a7ffb6ecf332..f1cbd2b0d1c9 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -546,13 +546,15 @@ struct snd_sof_dev {
 	int ipc_timeout;
 	int boot_timeout;
 
+	/* firmwre tracing */
+	bool fw_trace_is_supported; /* set with Kconfig or module parameter */
+
 	/* DMA for Trace */
 	struct snd_dma_buffer dmatb;
 	struct snd_dma_buffer dmatp;
 	int dma_trace_pages;
 	wait_queue_head_t trace_sleep;
 	u32 host_offset;
-	bool dtrace_is_supported; /* set with Kconfig or module parameter */
 	bool dtrace_error;
 	bool dtrace_draining;
 	enum sof_dtrace_state dtrace_state;
diff --git a/sound/soc/sof/trace.c b/sound/soc/sof/trace.c
index 5d171bf8a5ea..c5cc78c1958f 100644
--- a/sound/soc/sof/trace.c
+++ b/sound/soc/sof/trace.c
@@ -392,7 +392,7 @@ static int snd_sof_enable_trace(struct snd_sof_dev *sdev)
 	struct sof_ipc_reply ipc_reply;
 	int ret;
 
-	if (!sdev->dtrace_is_supported)
+	if (!sdev->fw_trace_is_supported)
 		return 0;
 
 	if (sdev->dtrace_state == SOF_DTRACE_ENABLED || !sdev->dma_trace_pages)
@@ -459,9 +459,9 @@ int snd_sof_init_trace(struct snd_sof_dev *sdev)
 
 	/* dtrace is only supported with SOF_IPC */
 	if (sdev->pdata->ipc_type != SOF_IPC)
-		sdev->dtrace_is_supported = false;
+		sdev->fw_trace_is_supported = false;
 
-	if (!sdev->dtrace_is_supported)
+	if (!sdev->fw_trace_is_supported)
 		return 0;
 
 	/* set false before start initialization */
@@ -521,7 +521,7 @@ EXPORT_SYMBOL(snd_sof_init_trace);
 int snd_sof_trace_update_pos(struct snd_sof_dev *sdev,
 			     struct sof_ipc_dma_trace_posn *posn)
 {
-	if (!sdev->dtrace_is_supported)
+	if (!sdev->fw_trace_is_supported)
 		return 0;
 
 	if (sdev->dtrace_state == SOF_DTRACE_ENABLED &&
@@ -541,7 +541,7 @@ int snd_sof_trace_update_pos(struct snd_sof_dev *sdev,
 /* an error has occurred within the DSP that prevents further trace */
 void snd_sof_trace_notify_for_error(struct snd_sof_dev *sdev)
 {
-	if (!sdev->dtrace_is_supported)
+	if (!sdev->fw_trace_is_supported)
 		return;
 
 	if (sdev->dtrace_state == SOF_DTRACE_ENABLED) {
@@ -559,7 +559,7 @@ static void snd_sof_release_trace(struct snd_sof_dev *sdev, bool only_stop)
 	struct sof_ipc_reply ipc_reply;
 	int ret;
 
-	if (!sdev->dtrace_is_supported || sdev->dtrace_state == SOF_DTRACE_DISABLED)
+	if (!sdev->fw_trace_is_supported || sdev->dtrace_state == SOF_DTRACE_DISABLED)
 		return;
 
 	ret = snd_sof_dma_trace_trigger(sdev, SNDRV_PCM_TRIGGER_STOP);
@@ -611,7 +611,7 @@ EXPORT_SYMBOL(snd_sof_trace_resume);
 
 void snd_sof_free_trace(struct snd_sof_dev *sdev)
 {
-	if (!sdev->dtrace_is_supported)
+	if (!sdev->fw_trace_is_supported)
 		return;
 
 	/* release trace */
-- 
2.36.1

