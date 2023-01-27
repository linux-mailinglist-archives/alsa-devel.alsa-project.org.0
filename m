Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A5A67E482
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 13:04:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46D9BEDB;
	Fri, 27 Jan 2023 13:03:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46D9BEDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674821051;
	bh=kGFffIQ+TZLB+Io2ley2iXEMkqrlz19ht5/2zQw9TqQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FFMJRP1nKb1gLJPsmhiZTVZxbYyyKVk/oYBgBH/IXXzJFSnXgDqHTSArzOM/kb/mP
	 CyXL4RB9LMLMZ/GkJyTAoP64Qjoj/akEnQpi7Y1hFb1ibEE5aB3LyuKso3bQPx7zmV
	 i9QC6R+MKy1yodLp2V5BJrnWIvu42CABkIdYaBuQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04D57F805A1;
	Fri, 27 Jan 2023 13:01:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF478F8056F; Fri, 27 Jan 2023 13:00:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D19A7F80548
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 13:00:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D19A7F80548
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DKiGmqF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674820852; x=1706356852;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kGFffIQ+TZLB+Io2ley2iXEMkqrlz19ht5/2zQw9TqQ=;
 b=DKiGmqF5xuupJ+A8vOn9kbbuaFHQBhZILoVj1C375s2OsgDsVOuSx5sL
 /cprIDBRYzYx377X+yEZacJTx0cXJ09sSvo9B/0rLBWGNxw1N51jd8VYx
 H74C4rW+2pzjBOPumRgwIJg8qpOdqi9Ms6zY9tj26uGyH3tM1jfolNgBz
 DRKcr1pqfNV0BDE9lucbkJHWhfR+3jJeSj8sqyIKtnc6pB6vkkmKKCS+Y
 N+4jW/L6X9pBazkF0tNpIxE+qJCm2qm/dUEB+M2AAuEJlM+7FOkykfuad
 qt1ply+2X2lZvXyRnf3VF2WaHSmh3HS8WVR9bO5EPRoDOHQfM145rzGuo Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="327091875"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="327091875"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:00:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="805782200"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="805782200"
Received: from aaralsto-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.30.130])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:00:46 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 09/18] ASoC: SOF: ipc4: Add flag to skip triggering pipelines
 during FE DAI trigger
Date: Fri, 27 Jan 2023 14:00:22 +0200
Message-Id: <20230127120031.10709-10-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127120031.10709-1-peter.ujfalusi@linux.intel.com>
References: <20230127120031.10709-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Add a new flag, skip_during_fe_trigger, to struct sof_ipc4_pipeline to
skip triggering pipelines in the FE DAI trigger. Set this flag for the
HDA DAI BE pipelines so that their BE pipeline will not be triggered in
the FE DAI trigger. Also, move the trigger handling for all commands
include START/PAUSE_RELEASE for the HDA DAI's to the backend DAI trigger
ops.

For the SSP/DMIC/SDW cases, remove the BE DAI trigger as they involve no
DMA operations and can be triggered in the FE DAI trigger. This is in
preparation to perform batch triggering of all pipelines for the non-HDA
case.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Libin Yang <libin.yang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 92 +++++++----------------------------
 sound/soc/sof/ipc4-pcm.c      | 17 +------
 sound/soc/sof/ipc4-topology.c |  1 +
 sound/soc/sof/ipc4-topology.h |  2 +
 4 files changed, 21 insertions(+), 91 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 1c3d4887aa30..98eebb4b07e6 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -450,6 +450,8 @@ static int ipc4_hda_dai_trigger(struct snd_pcm_substream *substream,
 {
 	struct hdac_ext_stream *hext_stream = snd_soc_dai_get_dma_data(dai, substream);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(dai->component);
+	struct snd_sof_widget *pipe_widget;
+	struct sof_ipc4_pipeline *pipeline;
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_sof_widget *swidget;
 	struct snd_soc_dapm_widget *w;
@@ -466,18 +468,30 @@ static int ipc4_hda_dai_trigger(struct snd_pcm_substream *substream,
 
 	w = snd_soc_dai_get_widget(dai, substream->stream);
 	swidget = w->dobj.private;
+	pipe_widget = swidget->pipe_widget;
+	pipeline = pipe_widget->private;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		snd_hdac_ext_stream_start(hext_stream);
+		if (pipeline->state != SOF_IPC4_PIPE_PAUSED) {
+			ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
+							  SOF_IPC4_PIPE_PAUSED);
+			if (ret < 0)
+				return ret;
+			pipeline->state = SOF_IPC4_PIPE_PAUSED;
+		}
+
+		ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
+						  SOF_IPC4_PIPE_RUNNING);
+		if (ret < 0)
+			return ret;
+		pipeline->state = SOF_IPC4_PIPE_RUNNING;
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 	{
-		struct snd_sof_widget *pipe_widget = swidget->pipe_widget;
-		struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
-
 		ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
 						  SOF_IPC4_PIPE_PAUSED);
 		if (ret < 0)
@@ -503,9 +517,6 @@ static int ipc4_hda_dai_trigger(struct snd_pcm_substream *substream,
 	}
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	{
-		struct snd_sof_widget *pipe_widget = swidget->pipe_widget;
-		struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
-
 		ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
 						  SOF_IPC4_PIPE_PAUSED);
 		if (ret < 0)
@@ -703,64 +714,6 @@ static const struct snd_soc_dai_ops ipc3_ssp_dai_ops = {
 	.shutdown = ssp_dai_shutdown,
 };
 
-static int ipc4_be_dai_common_trigger(struct snd_soc_dai *dai, int cmd, int stream)
-{
-	struct snd_sof_widget *pipe_widget;
-	struct sof_ipc4_pipeline *pipeline;
-	struct snd_sof_widget *swidget;
-	struct snd_soc_dapm_widget *w;
-	struct snd_sof_dev *sdev;
-	int ret;
-
-	w = snd_soc_dai_get_widget(dai, stream);
-	swidget = w->dobj.private;
-	pipe_widget = swidget->pipe_widget;
-	pipeline = pipe_widget->private;
-	sdev = snd_soc_component_get_drvdata(swidget->scomp);
-
-	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_SUSPEND:
-	case SNDRV_PCM_TRIGGER_STOP:
-		ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
-						  SOF_IPC4_PIPE_PAUSED);
-		if (ret < 0)
-			return ret;
-		pipeline->state = SOF_IPC4_PIPE_PAUSED;
-
-		ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
-						  SOF_IPC4_PIPE_RESET);
-		if (ret < 0)
-			return ret;
-		pipeline->state = SOF_IPC4_PIPE_RESET;
-		break;
-	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
-						  SOF_IPC4_PIPE_PAUSED);
-		if (ret < 0)
-			return ret;
-		pipeline->state = SOF_IPC4_PIPE_PAUSED;
-		break;
-	default:
-		break;
-	}
-
-	return 0;
-}
-
-static int ipc4_be_dai_trigger(struct snd_pcm_substream *substream,
-			       int cmd, struct snd_soc_dai *dai)
-{
-	return ipc4_be_dai_common_trigger(dai, cmd, substream->stream);
-}
-
-static const struct snd_soc_dai_ops ipc4_dmic_dai_ops = {
-	.trigger = ipc4_be_dai_trigger,
-};
-
-static const struct snd_soc_dai_ops ipc4_ssp_dai_ops = {
-	.trigger = ipc4_be_dai_trigger,
-};
-
 void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops)
 {
 	int i;
@@ -785,14 +738,6 @@ void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops)
 		struct sof_ipc4_fw_data *ipc4_data = sdev->private;
 
 		for (i = 0; i < ops->num_drv; i++) {
-			if (strstr(ops->drv[i].name, "DMIC")) {
-				ops->drv[i].ops = &ipc4_dmic_dai_ops;
-				continue;
-			}
-			if (strstr(ops->drv[i].name, "SSP")) {
-				ops->drv[i].ops = &ipc4_ssp_dai_ops;
-				continue;
-			}
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 			if (strstr(ops->drv[i].name, "iDisp") ||
 			    strstr(ops->drv[i].name, "Analog") ||
@@ -804,9 +749,6 @@ void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops)
 		if (!hda_use_tplg_nhlt)
 			ipc4_data->nhlt = intel_nhlt_init(sdev->dev);
 
-		if (IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE))
-			sdw_callback.trigger = ipc4_be_dai_common_trigger;
-
 		break;
 	}
 	default:
diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 05515e8e6f57..db9d0adb2717 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -58,25 +58,10 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 		if (!swidget)
 			continue;
 
-		/*
-		 * set pipeline state for both FE and BE pipelines for RUNNING state.
-		 * For PAUSE/RESET, set the pipeline state only for the FE pipeline.
-		 */
-		switch (state) {
-		case SOF_IPC4_PIPE_PAUSED:
-		case SOF_IPC4_PIPE_RESET:
-			if (!WIDGET_IS_AIF(swidget->id))
-				continue;
-			break;
-		default:
-			break;
-		}
-
-		/* find pipeline widget for the pipeline that this widget belongs to */
 		pipeline_widget = swidget->pipe_widget;
 		pipeline = (struct sof_ipc4_pipeline *)pipeline_widget->private;
 
-		if (pipeline->state == state)
+		if (pipeline->state == state || pipeline->skip_during_fe_trigger)
 			continue;
 
 		/* first set the pipeline to PAUSED state */
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index b07a405516b1..f3b1a7f81216 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1869,6 +1869,7 @@ static int sof_ipc4_dai_config(struct snd_sof_dev *sdev, struct snd_sof_widget *
 	case SOF_DAI_INTEL_HDA:
 		gtw_attr = ipc4_copier->gtw_attr;
 		gtw_attr->lp_buffer_alloc = pipeline->lp_mode;
+		pipeline->skip_during_fe_trigger = true;
 		fallthrough;
 	case SOF_DAI_INTEL_ALH:
 		copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 8dbbf69b0eb7..028b5d91b9db 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -73,6 +73,7 @@
  * @mem_usage: Memory usage
  * @state: Pipeline state
  * @msg: message structure for pipeline
+ * @skip_during_fe_trigger: skip triggering this pipeline during the FE DAI trigger
  */
 struct sof_ipc4_pipeline {
 	uint32_t priority;
@@ -80,6 +81,7 @@ struct sof_ipc4_pipeline {
 	uint32_t mem_usage;
 	int state;
 	struct sof_ipc4_msg msg;
+	bool skip_during_fe_trigger;
 };
 
 /**
-- 
2.39.1

