Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7937E528290
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 12:50:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA701168F;
	Mon, 16 May 2022 12:49:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA701168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652698219;
	bh=oeLzRuEtYq7MBvwQOZoFG8mmvTfooDe2+nL6Z6Ba0nY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sxb7sRAeJjGfgzcQUO9uQOuq7YdwMPiM1nZIXmY1x0d27Y7Bxb5Q/pAfsH7z7x641
	 y+narYqkRoQtvlVY71UJ96lXnEuWXJBT60DoV9EHXitNpMRGbOF1ZsX7hGUhiuV0SN
	 0sIjODSoDjCRI7ynqZkSsdnwbKFQWAadRcZ+dLDY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 511BCF80535;
	Mon, 16 May 2022 12:47:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDF5EF80524; Mon, 16 May 2022 12:47:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CD4CF80171
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 12:47:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CD4CF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ESdacAOn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652698049; x=1684234049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oeLzRuEtYq7MBvwQOZoFG8mmvTfooDe2+nL6Z6Ba0nY=;
 b=ESdacAOnpzjyr9AQnfUcQYk9aDcGLQJgjV0fPbwB9pVOt0Ts8Yf+KcoJ
 5SvR82OsZo41C9zjkHu3YNvQmWtEVK6cVT6tEF4J9w3DM6+czS8F2JYIE
 EnPulL/mvPAxnL3nUHJKDyXonmn8x8Bd5d1zB1+kWNDVbvSjB0GGHQUrk
 XMXjfEfBPfGaiPsCAlAOL6NQJtJvf9FCz2j+Rg+mA/FsOd4rQ+kcCK5Lo
 M3rv4nuJ9vM/H34QjSskeYpkBawxIBZfDvjJmaEa393dM9Vj95719Rfx3
 hX0NBuzSVFORlHxxVdHjM6AWBIdT+T8K2fm0bz7cjT5YvUbrrsESRBPkG Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="333853257"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="333853257"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 03:47:03 -0700
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="596459828"
Received: from afialcko-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.51.55])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 03:47:01 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com,
 AjitKumar.Pandey@amd.com
Subject: [PATCH 6/8] ASoC: SOF: Modify the host trace_init parameter list to
 include dmab
Date: Mon, 16 May 2022 13:47:09 +0300
Message-Id: <20220516104711.26115-7-peter.ujfalusi@linux.intel.com>
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

Stop host code (AMD, Intel) to access sdev->dmatb directly.
Modify the trace_init prototype to include the pointer to a
struct snd_dma_buffer. The ipc3-dtrace passes for now the pointer to
sdev->dmatb, but the aim is to move all tracing related runtime information
local to a trace implementation.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/amd/acp-trace.c   | 4 ++--
 sound/soc/sof/amd/acp.h         | 2 +-
 sound/soc/sof/intel/hda-trace.c | 4 ++--
 sound/soc/sof/intel/hda.h       | 2 +-
 sound/soc/sof/ipc3-dtrace.c     | 2 +-
 sound/soc/sof/ipc3-priv.h       | 3 ++-
 sound/soc/sof/sof-priv.h        | 3 ++-
 7 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/amd/acp-trace.c b/sound/soc/sof/amd/acp-trace.c
index 903b6cc3dda3..c9482b27cbe3 100644
--- a/sound/soc/sof/amd/acp-trace.c
+++ b/sound/soc/sof/amd/acp-trace.c
@@ -34,7 +34,7 @@ int acp_sof_trace_release(struct snd_sof_dev *sdev)
 }
 EXPORT_SYMBOL_NS(acp_sof_trace_release, SND_SOC_SOF_AMD_COMMON);
 
-int acp_sof_trace_init(struct snd_sof_dev *sdev,
+int acp_sof_trace_init(struct snd_sof_dev *sdev, struct snd_dma_buffer *dmab,
 		       struct sof_ipc_dma_trace_params_ext *dtrace_params)
 {
 	struct acp_dsp_stream *stream;
@@ -46,7 +46,7 @@ int acp_sof_trace_init(struct snd_sof_dev *sdev,
 	if (!stream)
 		return -ENODEV;
 
-	stream->dmab = &sdev->dmatb;
+	stream->dmab = dmab;
 	stream->num_pages = NUM_PAGES;
 
 	ret = acp_dsp_stream_config(sdev, stream);
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index de526a1bce13..291b44c54bcc 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -212,7 +212,7 @@ extern struct snd_sof_dsp_ops sof_renoir_ops;
 int snd_amd_acp_find_config(struct pci_dev *pci);
 
 /* Trace */
-int acp_sof_trace_init(struct snd_sof_dev *sdev,
+int acp_sof_trace_init(struct snd_sof_dev *sdev, struct snd_dma_buffer *dmab,
 		       struct sof_ipc_dma_trace_params_ext *dtrace_params);
 int acp_sof_trace_release(struct snd_sof_dev *sdev);
 
diff --git a/sound/soc/sof/intel/hda-trace.c b/sound/soc/sof/intel/hda-trace.c
index 755ef1d835e0..cbb9bd7770e6 100644
--- a/sound/soc/sof/intel/hda-trace.c
+++ b/sound/soc/sof/intel/hda-trace.c
@@ -36,7 +36,7 @@ static int hda_dsp_trace_prepare(struct snd_sof_dev *sdev, struct snd_dma_buffer
 	return ret;
 }
 
-int hda_dsp_trace_init(struct snd_sof_dev *sdev,
+int hda_dsp_trace_init(struct snd_sof_dev *sdev, struct snd_dma_buffer *dmab,
 		       struct sof_ipc_dma_trace_params_ext *dtrace_params)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
@@ -57,7 +57,7 @@ int hda_dsp_trace_init(struct snd_sof_dev *sdev,
 	 * initialize capture stream, set BDL address and return corresponding
 	 * stream tag which will be sent to the firmware by IPC message.
 	 */
-	ret = hda_dsp_trace_prepare(sdev, &sdev->dmatb);
+	ret = hda_dsp_trace_prepare(sdev, dmab);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: hdac trace init failed: %d\n", ret);
 		hda_dsp_stream_put(sdev, SNDRV_PCM_STREAM_CAPTURE,
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 535791c7d187..3e0f7b0c586a 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -658,7 +658,7 @@ static inline int hda_codec_i915_exit(struct snd_sof_dev *sdev) { return 0; }
 /*
  * Trace Control.
  */
-int hda_dsp_trace_init(struct snd_sof_dev *sdev,
+int hda_dsp_trace_init(struct snd_sof_dev *sdev, struct snd_dma_buffer *dmab,
 		       struct sof_ipc_dma_trace_params_ext *dtrace_params);
 int hda_dsp_trace_release(struct snd_sof_dev *sdev);
 int hda_dsp_trace_trigger(struct snd_sof_dev *sdev, int cmd);
diff --git a/sound/soc/sof/ipc3-dtrace.c b/sound/soc/sof/ipc3-dtrace.c
index 63132baaaa5a..91a2792b9beb 100644
--- a/sound/soc/sof/ipc3-dtrace.c
+++ b/sound/soc/sof/ipc3-dtrace.c
@@ -412,7 +412,7 @@ static int ipc3_dtrace_enable(struct snd_sof_dev *sdev)
 	sdev->host_offset = 0;
 	sdev->dtrace_draining = false;
 
-	ret = sof_dtrace_host_init(sdev, &params);
+	ret = sof_dtrace_host_init(sdev, &sdev->dmatb, &params);
 	if (ret < 0) {
 		dev_err(sdev->dev, "Host dtrace init failed: %d\n", ret);
 		return ret;
diff --git a/sound/soc/sof/ipc3-priv.h b/sound/soc/sof/ipc3-priv.h
index 21f0bd20323f..f5044202f3c5 100644
--- a/sound/soc/sof/ipc3-priv.h
+++ b/sound/soc/sof/ipc3-priv.h
@@ -31,12 +31,13 @@ int ipc3_dtrace_posn_update(struct snd_sof_dev *sdev,
 
 /* dtrace platform callback wrappers */
 static inline int sof_dtrace_host_init(struct snd_sof_dev *sdev,
+				       struct snd_dma_buffer *dmatb,
 				       struct sof_ipc_dma_trace_params_ext *dtrace_params)
 {
 	struct snd_sof_dsp_ops *dsp_ops = sdev->pdata->desc->ops;
 
 	if (dsp_ops->trace_init)
-		return dsp_ops->trace_init(sdev, dtrace_params);
+		return dsp_ops->trace_init(sdev, dmatb, dtrace_params);
 
 	return 0;
 }
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 61ef739461f0..b176fc7e346c 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -254,8 +254,9 @@ struct snd_sof_dsp_ops {
 				       size_t size, const char *name,
 				       enum sof_debugfs_access_type access_type); /* optional */
 
-	/* host DMA trace initialization */
+	/* host DMA trace (IPC3) */
 	int (*trace_init)(struct snd_sof_dev *sdev,
+			  struct snd_dma_buffer *dmatb,
 			  struct sof_ipc_dma_trace_params_ext *dtrace_params); /* optional */
 	int (*trace_release)(struct snd_sof_dev *sdev); /* optional */
 	int (*trace_trigger)(struct snd_sof_dev *sdev,
-- 
2.36.1

