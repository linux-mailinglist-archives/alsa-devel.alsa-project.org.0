Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEF9442B75
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Nov 2021 11:14:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C044816F4;
	Tue,  2 Nov 2021 11:13:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C044816F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635848060;
	bh=2cBr2WBblmTWXVAr5alIcNvbqlvS1XqeK6h+vCNdVS8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J3egpatmOFngFUHrnaOBcVURXwqwqv9Op1EoiuIvphUFWnOzK9rv/AiJE7PD9kAsn
	 jomCJxbfxVt2U6Rb/F+iB1ujJlzkflY1i7W6e3q6Oen6A6R9/4k1S4vl7ad1wJ3dk5
	 mELShQzvipgQzpYrfI3kwLPCd9vtDeQwWKX9Mw0g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02A4CF804FB;
	Tue,  2 Nov 2021 11:12:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3D35F804FA; Tue,  2 Nov 2021 11:11:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1046F80229
 for <alsa-devel@alsa-project.org>; Tue,  2 Nov 2021 11:11:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1046F80229
X-IronPort-AV: E=McAfee;i="6200,9189,10155"; a="211278032"
X-IronPort-AV: E=Sophos;i="5.87,202,1631602800"; d="scan'208";a="211278032"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 03:10:15 -0700
X-IronPort-AV: E=Sophos;i="5.87,202,1631602800"; d="scan'208";a="500477178"
Received: from asorichi-mobl1.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.44.213])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 03:10:13 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 3/3] ASoC: SOF: trace: send DMA_TRACE_FREE IPC during release
Date: Tue,  2 Nov 2021 12:10:19 +0200
Message-Id: <20211102101019.14037-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102101019.14037-1-peter.ujfalusi@linux.intel.com>
References: <20211102101019.14037-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Send the DMA_TRACE_FREE IPC during release to stop and free the trace
DMA in the DSP.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/core.c  |  2 +-
 sound/soc/sof/trace.c | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index af5bbc861297..40549cdd6d58 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -370,6 +370,7 @@ int snd_sof_device_remove(struct device *dev)
 	snd_sof_machine_unregister(sdev, pdata);
 
 	if (sdev->fw_state > SOF_FW_BOOT_NOT_STARTED) {
+		snd_sof_free_trace(sdev);
 		ret = snd_sof_dsp_power_down_notify(sdev);
 		if (ret < 0)
 			dev_warn(dev, "error: %d failed to prepare DSP for device removal",
@@ -377,7 +378,6 @@ int snd_sof_device_remove(struct device *dev)
 
 		snd_sof_ipc_free(sdev);
 		snd_sof_free_debug(sdev);
-		snd_sof_free_trace(sdev);
 	}
 
 	/*
diff --git a/sound/soc/sof/trace.c b/sound/soc/sof/trace.c
index e3afc3dac7d1..f13024c8ebf2 100644
--- a/sound/soc/sof/trace.c
+++ b/sound/soc/sof/trace.c
@@ -539,6 +539,10 @@ EXPORT_SYMBOL(snd_sof_trace_notify_for_error);
 
 void snd_sof_release_trace(struct snd_sof_dev *sdev)
 {
+	struct sof_ipc_fw_ready *ready = &sdev->fw_ready;
+	struct sof_ipc_fw_version *v = &ready->version;
+	struct sof_ipc_cmd_hdr hdr;
+	struct sof_ipc_reply ipc_reply;
 	int ret;
 
 	if (!sdev->dtrace_is_supported || !sdev->dtrace_is_enabled)
@@ -549,6 +553,20 @@ void snd_sof_release_trace(struct snd_sof_dev *sdev)
 		dev_err(sdev->dev,
 			"error: snd_sof_dma_trace_trigger: stop: %d\n", ret);
 
+	/*
+	 * stop and free trace DMA in the DSP. TRACE_DMA_FREE is only supported from
+	 * ABI 3.20.0 onwards
+	 */
+	if (v->abi_version >= SOF_ABI_VER(3, 20, 0)) {
+		hdr.size = sizeof(hdr);
+		hdr.cmd = SOF_IPC_GLB_TRACE_MSG | SOF_IPC_TRACE_DMA_FREE;
+
+		ret = sof_ipc_tx_message(sdev->ipc, hdr.cmd, &hdr, hdr.size,
+					 &ipc_reply, sizeof(ipc_reply));
+		if (ret < 0)
+			dev_err(sdev->dev, "DMA_TRACE_FREE failed with error: %d\n", ret);
+	}
+
 	ret = snd_sof_dma_trace_release(sdev);
 	if (ret < 0)
 		dev_err(sdev->dev,
-- 
2.33.1

