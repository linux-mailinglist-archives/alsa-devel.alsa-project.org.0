Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 248F149F986
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jan 2022 13:37:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 147B51753;
	Fri, 28 Jan 2022 13:36:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 147B51753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643373466;
	bh=jN0C1AA2Z+suqyDEJUzeaonkLDk231nm5Op9z7h1RVo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LDDG6aR3G9fOgvjRWx2I9Hy8IQjNwKKaCwnxs/OPsbILvs+9fJbg4j0eBYVmmeITA
	 WF4XvAj475S4H1IluDXxrPUCLS215G1KSfMBnIqurXutjRjBgwIxhs0wgC7OVNCJR8
	 vT2OUYOPUi4aewXc73VGd95ILukl6npDovEDPbTA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AE21F8050F;
	Fri, 28 Jan 2022 13:36:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CAC9F80246; Fri, 28 Jan 2022 13:36:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F6A2F80240
 for <alsa-devel@alsa-project.org>; Fri, 28 Jan 2022 13:35:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F6A2F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CqBq669A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643373360; x=1674909360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jN0C1AA2Z+suqyDEJUzeaonkLDk231nm5Op9z7h1RVo=;
 b=CqBq669AcEmxWG0jQFCNNMijG7LTZL0+bPwKOnXS7wscBmH5qEyM/UXo
 Apega03A6mnVrNK3C2wmeEAcvvXLDa7u1X2bhMCOOGiGg6RdjTwsqwbMV
 8C5ivIvtka9fdOwIp3WEU1w2l1twEGiVJspbhGUj+FspT0lzUuGVxVxIC
 7tNx57/b9IS/QIo4N6kkmJ0rOS24HDiOIfitKlwqWdnm+e+QlDhU+8YAw
 8zvSh6/mNnG65cLw6CRYOcuMtdfvb6itcoXNREn4Pcb+0iNv3mglzsRmP
 WoPfMUDEtvmF/7qf8EPjDxAQ6tDfDver+GCONypKXEeG3SeKV+LJesqv2 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="310426937"
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="310426937"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 04:35:56 -0800
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="536117091"
Received: from dlita-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.43.152])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 04:35:53 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 2/2] ASoC: SOF: dma-trace: Pass pointer to params_ext struct
 in trace_init()
Date: Fri, 28 Jan 2022 14:36:23 +0200
Message-Id: <20220128123623.23569-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220128123623.23569-1-peter.ujfalusi@linux.intel.com>
References: <20220128123623.23569-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 AjitKumar.Pandey@amd.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, vsreddy@amd.com, daniel.baluta@nxp.com
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

Instead of passing a pointer to the stream_tag within the
struct sof_ipc_dma_trace_params_ext, pass the pointer to the containing
struct.

AMD needs to update buffer.phy_addr (and don't really use the stream_tag)
for the trace implementation.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/amd/acp-trace.c   | 38 ++++++++-------------------------
 sound/soc/sof/amd/acp.h         |  3 ++-
 sound/soc/sof/intel/hda-trace.c | 10 +++++----
 sound/soc/sof/intel/hda.h       |  3 ++-
 sound/soc/sof/ops.h             |  4 ++--
 sound/soc/sof/sof-priv.h        |  2 +-
 sound/soc/sof/trace.c           |  2 +-
 7 files changed, 23 insertions(+), 39 deletions(-)

diff --git a/sound/soc/sof/amd/acp-trace.c b/sound/soc/sof/amd/acp-trace.c
index fa4da8947186..903b6cc3dda3 100644
--- a/sound/soc/sof/amd/acp-trace.c
+++ b/sound/soc/sof/amd/acp-trace.c
@@ -34,51 +34,31 @@ int acp_sof_trace_release(struct snd_sof_dev *sdev)
 }
 EXPORT_SYMBOL_NS(acp_sof_trace_release, SND_SOC_SOF_AMD_COMMON);
 
-static int acp_sof_trace_prepare(struct snd_sof_dev *sdev,
-				 struct sof_ipc_dma_trace_params_ext *params)
+int acp_sof_trace_init(struct snd_sof_dev *sdev,
+		       struct sof_ipc_dma_trace_params_ext *dtrace_params)
 {
 	struct acp_dsp_stream *stream;
 	struct acp_dev_data *adata;
 	int ret;
 
 	adata = sdev->pdata->hw_pdata;
-	stream = adata->dtrace_stream;
+	stream = acp_dsp_stream_get(sdev, ACP_LOGGER_STREAM);
+	if (!stream)
+		return -ENODEV;
+
 	stream->dmab = &sdev->dmatb;
 	stream->num_pages = NUM_PAGES;
 
 	ret = acp_dsp_stream_config(sdev, stream);
 	if (ret < 0) {
-		dev_err(sdev->dev, "Failed to configure trace stream\n");
+		acp_dsp_stream_put(sdev, stream);
 		return ret;
 	}
 
-	params->buffer.phy_addr = stream->reg_offset;
-	params->stream_tag = stream->stream_tag;
-
-	return 0;
-}
-
-int acp_sof_trace_init(struct snd_sof_dev *sdev, u32 *stream_tag)
-{
-	struct sof_ipc_dma_trace_params_ext *params;
-	struct acp_dsp_stream *stream;
-	struct acp_dev_data *adata;
-	int ret;
-
-	adata = sdev->pdata->hw_pdata;
-	stream = acp_dsp_stream_get(sdev, ACP_LOGGER_STREAM);
-	if (!stream)
-		return -ENODEV;
-
 	adata->dtrace_stream = stream;
-	params = container_of(stream_tag, struct sof_ipc_dma_trace_params_ext, stream_tag);
-	ret = acp_sof_trace_prepare(sdev, params);
-	if (ret < 0) {
-		acp_dsp_stream_put(sdev, stream);
-		return ret;
-	}
+	dtrace_params->stream_tag = stream->stream_tag;
+	dtrace_params->buffer.phy_addr = stream->reg_offset;
 
-	*stream_tag = stream->stream_tag;
 	return 0;
 }
 EXPORT_SYMBOL_NS(acp_sof_trace_init, SND_SOC_SOF_AMD_COMMON);
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index a2f8e4219066..7ceb8bee0d8f 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -210,7 +210,8 @@ extern const struct snd_sof_dsp_ops sof_renoir_ops;
 int snd_amd_acp_find_config(struct pci_dev *pci);
 
 /* Trace */
-int acp_sof_trace_init(struct snd_sof_dev *sdev, u32 *stream_tag);
+int acp_sof_trace_init(struct snd_sof_dev *sdev,
+		       struct sof_ipc_dma_trace_params_ext *dtrace_params);
 int acp_sof_trace_release(struct snd_sof_dev *sdev);
 
 struct sof_amd_acp_desc {
diff --git a/sound/soc/sof/intel/hda-trace.c b/sound/soc/sof/intel/hda-trace.c
index c5dc833b57b8..1791ec045a54 100644
--- a/sound/soc/sof/intel/hda-trace.c
+++ b/sound/soc/sof/intel/hda-trace.c
@@ -36,7 +36,8 @@ static int hda_dsp_trace_prepare(struct snd_sof_dev *sdev, struct snd_dma_buffer
 	return ret;
 }
 
-int hda_dsp_trace_init(struct snd_sof_dev *sdev, u32 *stream_tag)
+int hda_dsp_trace_init(struct snd_sof_dev *sdev,
+		       struct sof_ipc_dma_trace_params_ext *dtrace_params)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	int ret;
@@ -50,7 +51,7 @@ int hda_dsp_trace_init(struct snd_sof_dev *sdev, u32 *stream_tag)
 		return -ENODEV;
 	}
 
-	*stream_tag = hda->dtrace_stream->hstream.stream_tag;
+	dtrace_params->stream_tag = hda->dtrace_stream->hstream.stream_tag;
 
 	/*
 	 * initialize capture stream, set BDL address and return corresponding
@@ -59,9 +60,10 @@ int hda_dsp_trace_init(struct snd_sof_dev *sdev, u32 *stream_tag)
 	ret = hda_dsp_trace_prepare(sdev, &sdev->dmatb);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: hdac trace init failed: %d\n", ret);
-		hda_dsp_stream_put(sdev, SNDRV_PCM_STREAM_CAPTURE, *stream_tag);
+		hda_dsp_stream_put(sdev, SNDRV_PCM_STREAM_CAPTURE,
+				   dtrace_params->stream_tag);
 		hda->dtrace_stream = NULL;
-		*stream_tag = 0;
+		dtrace_params->stream_tag = 0;
 	}
 
 	return ret;
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 7838a998ea95..2390561906dd 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -670,7 +670,8 @@ static inline int hda_codec_i915_exit(struct snd_sof_dev *sdev) { return 0; }
 /*
  * Trace Control.
  */
-int hda_dsp_trace_init(struct snd_sof_dev *sdev, u32 *stream_tag);
+int hda_dsp_trace_init(struct snd_sof_dev *sdev,
+		       struct sof_ipc_dma_trace_params_ext *dtrace_params);
 int hda_dsp_trace_release(struct snd_sof_dev *sdev);
 int hda_dsp_trace_trigger(struct snd_sof_dev *sdev, int cmd);
 
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index ffe7456e7713..1f84d30296cf 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -369,10 +369,10 @@ static inline int snd_sof_dsp_send_msg(struct snd_sof_dev *sdev,
 
 /* host DMA trace */
 static inline int snd_sof_dma_trace_init(struct snd_sof_dev *sdev,
-					 u32 *stream_tag)
+					 struct sof_ipc_dma_trace_params_ext *dtrace_params)
 {
 	if (sof_ops(sdev)->trace_init)
-		return sof_ops(sdev)->trace_init(sdev, stream_tag);
+		return sof_ops(sdev)->trace_init(sdev, dtrace_params);
 
 	return 0;
 }
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 29bb56b7267a..e48402ce4bdb 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -281,7 +281,7 @@ struct snd_sof_dsp_ops {
 
 	/* host DMA trace initialization */
 	int (*trace_init)(struct snd_sof_dev *sdev,
-			  u32 *stream_tag); /* optional */
+			  struct sof_ipc_dma_trace_params_ext *dtrace_params); /* optional */
 	int (*trace_release)(struct snd_sof_dev *sdev); /* optional */
 	int (*trace_trigger)(struct snd_sof_dev *sdev,
 			     int cmd); /* optional */
diff --git a/sound/soc/sof/trace.c b/sound/soc/sof/trace.c
index 9b505c4fe794..2335d0f06d42 100644
--- a/sound/soc/sof/trace.c
+++ b/sound/soc/sof/trace.c
@@ -409,7 +409,7 @@ int snd_sof_init_trace_ipc(struct snd_sof_dev *sdev)
 	sdev->host_offset = 0;
 	sdev->dtrace_draining = false;
 
-	ret = snd_sof_dma_trace_init(sdev, &params.stream_tag);
+	ret = snd_sof_dma_trace_init(sdev, &params);
 	if (ret < 0) {
 		dev_err(sdev->dev,
 			"error: fail in snd_sof_dma_trace_init %d\n", ret);
-- 
2.35.0

