Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABDC52828E
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 12:49:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF31816AB;
	Mon, 16 May 2022 12:48:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF31816AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652698187;
	bh=Zwje4zxU2xeTBuAe3WDdJzhLGMj6TakhH0SrNvXIN/U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VE4oDvZQ9Qg6SCy/8JuymP8GiZyavR5gW3gwt/mjT9dMUc6G3Dk/Qmw4tC5rWqu4M
	 McS/TGIeHQvYknknymbNEzeGxM2SQ/SipWIGUtpMPK0juXmbM5lc+hSTvw2et8fh84
	 QTsQaGmI5Ctbz20comawfp0BbBN+3a/m0QkBRwHM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C639F80520;
	Mon, 16 May 2022 12:47:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49A49F8051F; Mon, 16 May 2022 12:47:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89AD0F801D5
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 12:47:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89AD0F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nmGByThb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652698047; x=1684234047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zwje4zxU2xeTBuAe3WDdJzhLGMj6TakhH0SrNvXIN/U=;
 b=nmGByThbHY62ybpJJLXULJRbenm1koTnhDow8uo4yNCREsBUyUFH79TJ
 0LEupQpQVDqv6+IT5obbTarSZWxfBbW3sLzVinK3sOdxCePxDcDCqggPx
 wjrjC1dJuI14tpkHi0YnxMv5L7D6PpdOnM5fRvPqJMMsLdFH/8HpgrcoE
 s7aM5nbAmX5PCtkVX8CqL1xm38HGUemcaGbTsSpSG0hwPHXH8bIEKnqYV
 TLMXvMhQUl8h8fQ9Ih9DT2vCk/8aQ9Iv2x05QR2qED6JfmO4E1ytMVf7Z
 ojgBEUx53tArsTFokWBL5Lle9jajIvPX0pDEMIw1zpJJRUDNNbmWlkSVk Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="333853253"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="333853253"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 03:47:01 -0700
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="596459818"
Received: from afialcko-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.51.55])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 03:46:58 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com,
 AjitKumar.Pandey@amd.com
Subject: [PATCH 5/8] ASoC: SOF: ipc3-dtrace: Move host ops wrappers from
 generic header to private
Date: Mon, 16 May 2022 13:47:08 +0300
Message-Id: <20220516104711.26115-6-peter.ujfalusi@linux.intel.com>
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

Move the snd_sof_dma_trace_* ops wrappers from ops.h to ipc3-priv.h since
they are not used outside of IPC3 code.
While moving, rename them to sof_dtrace_host_*

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc3-dtrace.c | 10 +++++-----
 sound/soc/sof/ipc3-priv.h   | 32 ++++++++++++++++++++++++++++++++
 sound/soc/sof/ops.h         | 26 --------------------------
 3 files changed, 37 insertions(+), 31 deletions(-)

diff --git a/sound/soc/sof/ipc3-dtrace.c b/sound/soc/sof/ipc3-dtrace.c
index 0bc3ad586d23..63132baaaa5a 100644
--- a/sound/soc/sof/ipc3-dtrace.c
+++ b/sound/soc/sof/ipc3-dtrace.c
@@ -412,7 +412,7 @@ static int ipc3_dtrace_enable(struct snd_sof_dev *sdev)
 	sdev->host_offset = 0;
 	sdev->dtrace_draining = false;
 
-	ret = snd_sof_dma_trace_init(sdev, &params);
+	ret = sof_dtrace_host_init(sdev, &params);
 	if (ret < 0) {
 		dev_err(sdev->dev, "Host dtrace init failed: %d\n", ret);
 		return ret;
@@ -427,7 +427,7 @@ static int ipc3_dtrace_enable(struct snd_sof_dev *sdev)
 	}
 
 start:
-	ret = snd_sof_dma_trace_trigger(sdev, SNDRV_PCM_TRIGGER_START);
+	ret = sof_dtrace_host_trigger(sdev, SNDRV_PCM_TRIGGER_START);
 	if (ret < 0) {
 		dev_err(sdev->dev, "Host dtrace trigger start failed: %d\n", ret);
 		goto trace_release;
@@ -438,7 +438,7 @@ static int ipc3_dtrace_enable(struct snd_sof_dev *sdev)
 	return 0;
 
 trace_release:
-	snd_sof_dma_trace_release(sdev);
+	sof_dtrace_host_release(sdev);
 	return ret;
 }
 
@@ -541,7 +541,7 @@ static void ipc3_dtrace_release(struct snd_sof_dev *sdev, bool only_stop)
 	if (!sdev->fw_trace_is_supported || sdev->dtrace_state == SOF_DTRACE_DISABLED)
 		return;
 
-	ret = snd_sof_dma_trace_trigger(sdev, SNDRV_PCM_TRIGGER_STOP);
+	ret = sof_dtrace_host_trigger(sdev, SNDRV_PCM_TRIGGER_STOP);
 	if (ret < 0)
 		dev_err(sdev->dev, "Host dtrace trigger stop failed: %d\n", ret);
 	sdev->dtrace_state = SOF_DTRACE_STOPPED;
@@ -563,7 +563,7 @@ static void ipc3_dtrace_release(struct snd_sof_dev *sdev, bool only_stop)
 	if (only_stop)
 		goto out;
 
-	ret = snd_sof_dma_trace_release(sdev);
+	ret = sof_dtrace_host_release(sdev);
 	if (ret < 0)
 		dev_err(sdev->dev, "Host dtrace release failed %d\n", ret);
 
diff --git a/sound/soc/sof/ipc3-priv.h b/sound/soc/sof/ipc3-priv.h
index bb9cb0678686..21f0bd20323f 100644
--- a/sound/soc/sof/ipc3-priv.h
+++ b/sound/soc/sof/ipc3-priv.h
@@ -29,4 +29,36 @@ int sof_ipc3_validate_fw_version(struct snd_sof_dev *sdev);
 int ipc3_dtrace_posn_update(struct snd_sof_dev *sdev,
 			    struct sof_ipc_dma_trace_posn *posn);
 
+/* dtrace platform callback wrappers */
+static inline int sof_dtrace_host_init(struct snd_sof_dev *sdev,
+				       struct sof_ipc_dma_trace_params_ext *dtrace_params)
+{
+	struct snd_sof_dsp_ops *dsp_ops = sdev->pdata->desc->ops;
+
+	if (dsp_ops->trace_init)
+		return dsp_ops->trace_init(sdev, dtrace_params);
+
+	return 0;
+}
+
+static inline int sof_dtrace_host_release(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_dsp_ops *dsp_ops = sdev->pdata->desc->ops;
+
+	if (dsp_ops->trace_release)
+		return dsp_ops->trace_release(sdev);
+
+	return 0;
+}
+
+static inline int sof_dtrace_host_trigger(struct snd_sof_dev *sdev, int cmd)
+{
+	struct snd_sof_dsp_ops *dsp_ops = sdev->pdata->desc->ops;
+
+	if (dsp_ops->trace_trigger)
+		return dsp_ops->trace_trigger(sdev, cmd);
+
+	return 0;
+}
+
 #endif
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index aa64e3bd645f..b79ae4f66eba 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -375,32 +375,6 @@ static inline int snd_sof_dsp_send_msg(struct snd_sof_dev *sdev,
 	return sof_ops(sdev)->send_msg(sdev, msg);
 }
 
-/* host DMA trace */
-static inline int snd_sof_dma_trace_init(struct snd_sof_dev *sdev,
-					 struct sof_ipc_dma_trace_params_ext *dtrace_params)
-{
-	if (sof_ops(sdev)->trace_init)
-		return sof_ops(sdev)->trace_init(sdev, dtrace_params);
-
-	return 0;
-}
-
-static inline int snd_sof_dma_trace_release(struct snd_sof_dev *sdev)
-{
-	if (sof_ops(sdev)->trace_release)
-		return sof_ops(sdev)->trace_release(sdev);
-
-	return 0;
-}
-
-static inline int snd_sof_dma_trace_trigger(struct snd_sof_dev *sdev, int cmd)
-{
-	if (sof_ops(sdev)->trace_trigger)
-		return sof_ops(sdev)->trace_trigger(sdev, cmd);
-
-	return 0;
-}
-
 /* host PCM ops */
 static inline int
 snd_sof_pcm_platform_open(struct snd_sof_dev *sdev,
-- 
2.36.1

