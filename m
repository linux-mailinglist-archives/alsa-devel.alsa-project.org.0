Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9388325ACA0
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 16:12:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0ED61839;
	Wed,  2 Sep 2020 16:11:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0ED61839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599055922;
	bh=Lgo9A9VjMvPjE/Vur9fKVz6dmsJOmTlBVwRMHDufrRw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dWEdCp3CB72H5f7HL5UeWlgvLp0r++GhY6U/bxkjHlrmsHURhSz1EeHbc7Bfd028r
	 WrRBr5WbXuFEZs9P42CwsGzH9qxZqyhEOdM8nJUPqkVIzmwj1XrTLr7MW1RKIr1GBP
	 Slx6yFxK4Uc2PobUG/zRmzmNtXs55Aha2kSu9Bmc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7C21F8024A;
	Wed,  2 Sep 2020 16:09:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 832C2F801DA; Wed,  2 Sep 2020 16:09:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 451B7F800F3
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 16:09:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 451B7F800F3
IronPort-SDR: ghSH0PrJo9fUtRavKstqNEZMAgNOOYzcufn1hiTZeEnCfPg28d7pHZEqRd61jrzghMf23ZSLId
 Y/HTfOFko+ng==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="156650001"
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; d="scan'208";a="156650001"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 07:09:23 -0700
IronPort-SDR: VVJSBAX0TeQH2pixcQK9pw4TGH2IWxrh418Kqko54F7rCb51vObfwL6CslEcZxAgBDbDEs2qr4
 hZ/yDOLr9G8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; d="scan'208";a="338934372"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Sep 2020 07:09:21 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 2/3] ASoC: SOF: support topology components on secondary cores
Date: Wed,  2 Sep 2020 17:07:55 +0300
Message-Id: <20200902140756.1427005-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200902140756.1427005-1-kai.vehmanen@linux.intel.com>
References: <20200902140756.1427005-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, Pan Xiuli <xiuli.pan@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com
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

From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>

Currently SOF supports running pipelines on secondary DSP cores in a
limited way. This patch represents the next step in SOF multi-core DSP
support, it adds checks for core ID to individual topology components.
It takes care to power up all the requested cores. More advanced DSP
core power management should be added in the future.

Signed-off-by: Pan Xiuli <xiuli.pan@linux.intel.com>
Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/uapi/sound/sof/tokens.h |   1 +
 sound/soc/sof/pm.c              |   1 +
 sound/soc/sof/sof-audio.c       |  25 +++++++
 sound/soc/sof/sof-audio.h       |   5 ++
 sound/soc/sof/topology.c        | 128 +++++++++++++++++++++++---------
 5 files changed, 126 insertions(+), 34 deletions(-)

diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index 5941e2eb1588..37f5aaa09c2b 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -73,6 +73,7 @@
 /* Token retired with ABI 3.2, do not use for new capabilities
  * #define SOF_TKN_COMP_PRELOAD_COUNT		403
  */
+#define SOF_TKN_COMP_CORE_ID			404
 
 /* SSP */
 #define SOF_TKN_INTEL_SSP_CLKS_CONTROL		500
diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 92e5f9b15f3a..a5f7c7f024a1 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -256,6 +256,7 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 
 	/* reset FW state */
 	sdev->fw_state = SOF_FW_BOOT_NOT_STARTED;
+	sdev->enabled_cores_mask = 0;
 
 	return ret;
 }
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 33d84405cf9c..d05f99cd7919 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -142,6 +142,22 @@ static int sof_restore_kcontrols(struct device *dev)
 	return 0;
 }
 
+const struct sof_ipc_pipe_new *snd_sof_pipeline_find(struct snd_sof_dev *sdev,
+						     int pipeline_id)
+{
+	const struct snd_sof_widget *swidget;
+
+	list_for_each_entry(swidget, &sdev->widget_list, list)
+		if (swidget->id == snd_soc_dapm_scheduler) {
+			const struct sof_ipc_pipe_new *pipeline =
+				swidget->private;
+			if (pipeline->pipeline_id == pipeline_id)
+				return pipeline;
+		}
+
+	return NULL;
+}
+
 int sof_restore_pipelines(struct device *dev)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
@@ -161,6 +177,15 @@ int sof_restore_pipelines(struct device *dev)
 		if (!swidget->private)
 			continue;
 
+		ret = sof_pipeline_core_enable(sdev, swidget);
+		if (ret < 0) {
+			dev_err(dev,
+				"error: failed to enable target core: %d\n",
+				ret);
+
+			return ret;
+		}
+
 		switch (swidget->id) {
 		case snd_soc_dapm_dai_in:
 		case snd_soc_dapm_dai_out:
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 9629994fe463..7f8be8817e69 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -83,6 +83,7 @@ struct snd_sof_widget {
 	int comp_id;
 	int pipeline_id;
 	int complete;
+	int core;
 	int id;
 
 	struct snd_soc_dapm_widget *widget;
@@ -151,6 +152,8 @@ int snd_sof_complete_pipeline(struct device *dev,
 int sof_load_pipeline_ipc(struct device *dev,
 			  struct sof_ipc_pipe_new *pipeline,
 			  struct sof_ipc_comp_reply *r);
+int sof_pipeline_core_enable(struct snd_sof_dev *sdev,
+			     const struct snd_sof_widget *swidget);
 
 /*
  * Stream IPC
@@ -190,6 +193,8 @@ struct snd_sof_pcm *snd_sof_find_spcm_comp(struct snd_soc_component *scomp,
 					   int *direction);
 struct snd_sof_pcm *snd_sof_find_spcm_pcm_id(struct snd_soc_component *scomp,
 					     unsigned int pcm_id);
+const struct sof_ipc_pipe_new *snd_sof_pipeline_find(struct snd_sof_dev *sdev,
+						     int pipeline_id);
 void snd_sof_pcm_period_elapsed(struct snd_pcm_substream *substream);
 void snd_sof_pcm_period_elapsed_work(struct work_struct *work);
 
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index d41df9337328..46468fb7b6d1 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -8,6 +8,9 @@
 // Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //
 
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/errno.h>
 #include <linux/firmware.h>
 #include <linux/workqueue.h>
 #include <sound/tlv.h>
@@ -715,6 +718,13 @@ static const struct sof_topology_token sai_tokens[] = {
 		offsetof(struct sof_ipc_dai_sai_params, mclk_id), 0},
 };
 
+/* Core tokens */
+static const struct sof_topology_token core_tokens[] = {
+	{SOF_TKN_COMP_CORE_ID,
+		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_comp, core), 0},
+};
+
 /*
  * DMIC PDM Tokens
  * SOF_TKN_INTEL_DMIC_PDM_CTRL_ID should be the first token
@@ -1278,6 +1288,65 @@ static int sof_control_unload(struct snd_soc_component *scomp,
  * DAI Topology
  */
 
+/* Static DSP core power management so far, should be extended in the future */
+static int sof_core_enable(struct snd_sof_dev *sdev, int core)
+{
+	struct sof_ipc_pm_core_config pm_core_config = {
+		.hdr = {
+			.cmd = SOF_IPC_GLB_PM_MSG | SOF_IPC_PM_CORE_ENABLE,
+			.size = sizeof(pm_core_config),
+		},
+		.enable_mask = sdev->enabled_cores_mask | BIT(core),
+	};
+	int ret;
+
+	if (sdev->enabled_cores_mask & BIT(core))
+		return 0;
+
+	/* power up the core */
+	ret = snd_sof_dsp_core_power_up(sdev, BIT(core));
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: %d powering up core %d\n",
+			ret, core);
+		return ret;
+	}
+
+	/* update enabled cores mask */
+	sdev->enabled_cores_mask |= BIT(core);
+
+	/* Now notify DSP that the core has been powered up */
+	ret = sof_ipc_tx_message(sdev->ipc, pm_core_config.hdr.cmd,
+				 &pm_core_config, sizeof(pm_core_config),
+				 &pm_core_config, sizeof(pm_core_config));
+	if (ret < 0)
+		dev_err(sdev->dev, "error: core %d enable ipc failure %d\n",
+			core, ret);
+
+	return ret;
+}
+
+int sof_pipeline_core_enable(struct snd_sof_dev *sdev,
+			     const struct snd_sof_widget *swidget)
+{
+	const struct sof_ipc_pipe_new *pipeline;
+	int ret;
+
+	if (swidget->id == snd_soc_dapm_scheduler) {
+		pipeline = swidget->private;
+	} else {
+		pipeline = snd_sof_pipeline_find(sdev, swidget->pipeline_id);
+		if (!pipeline)
+			return -ENOENT;
+	}
+
+	/* First enable the pipeline core */
+	ret = sof_core_enable(sdev, pipeline->core);
+	if (ret < 0)
+		return ret;
+
+	return sof_core_enable(sdev, swidget->core);
+}
+
 static int sof_connect_dai_widget(struct snd_soc_component *scomp,
 				  struct snd_soc_dapm_widget *w,
 				  struct snd_soc_tplg_dapm_widget *tw,
@@ -1553,44 +1622,15 @@ int sof_load_pipeline_ipc(struct device *dev,
 			  struct sof_ipc_comp_reply *r)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
-	struct sof_ipc_pm_core_config pm_core_config;
-	int ret;
+	int ret = sof_core_enable(sdev, pipeline->core);
 
-	ret = sof_ipc_tx_message(sdev->ipc, pipeline->hdr.cmd, pipeline,
-				 sizeof(*pipeline), r, sizeof(*r));
-	if (ret < 0) {
-		dev_err(dev, "error: load pipeline ipc failure\n");
-		return ret;
-	}
-
-	/* power up the core that this pipeline is scheduled on */
-	ret = snd_sof_dsp_core_power_up(sdev, 1 << pipeline->core);
-	if (ret < 0) {
-		dev_err(dev, "error: powering up pipeline schedule core %d\n",
-			pipeline->core);
+	if (ret < 0)
 		return ret;
-	}
 
-	/* update enabled cores mask */
-	sdev->enabled_cores_mask |= 1 << pipeline->core;
-
-	/*
-	 * Now notify DSP that the core that this pipeline is scheduled on
-	 * has been powered up
-	 */
-	memset(&pm_core_config, 0, sizeof(pm_core_config));
-	pm_core_config.enable_mask = sdev->enabled_cores_mask;
-
-	/* configure CORE_ENABLE ipc message */
-	pm_core_config.hdr.size = sizeof(pm_core_config);
-	pm_core_config.hdr.cmd = SOF_IPC_GLB_PM_MSG | SOF_IPC_PM_CORE_ENABLE;
-
-	/* send ipc */
-	ret = sof_ipc_tx_message(sdev->ipc, pm_core_config.hdr.cmd,
-				 &pm_core_config, sizeof(pm_core_config),
-				 &pm_core_config, sizeof(pm_core_config));
+	ret = sof_ipc_tx_message(sdev->ipc, pipeline->hdr.cmd, pipeline,
+				 sizeof(*pipeline), r, sizeof(*r));
 	if (ret < 0)
-		dev_err(dev, "error: core enable ipc failure\n");
+		dev_err(dev, "error: load pipeline ipc failure\n");
 
 	return ret;
 }
@@ -2316,6 +2356,26 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 		strnlen(tw->sname, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) > 0
 			? tw->sname : "none");
 
+	ret = sof_parse_tokens(scomp, &comp, core_tokens,
+			       ARRAY_SIZE(core_tokens), tw->priv.array,
+			       le32_to_cpu(tw->priv.size));
+	if (ret != 0) {
+		dev_err(scomp->dev, "error: parsing core tokens failed %d\n",
+			ret);
+		kfree(swidget);
+		return ret;
+	}
+
+	swidget->core = comp.core;
+
+	/* default is primary core, safe to call for already enabled cores */
+	ret = sof_core_enable(sdev, comp.core);
+	if (ret < 0) {
+		dev_err(scomp->dev, "error: enable core: %d\n", ret);
+		kfree(swidget);
+		return ret;
+	}
+
 	/* handle any special case widgets */
 	switch (w->id) {
 	case snd_soc_dapm_dai_in:
-- 
2.27.0

