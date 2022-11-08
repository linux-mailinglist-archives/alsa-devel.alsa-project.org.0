Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4876204AB
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 01:25:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21C7A1E0;
	Tue,  8 Nov 2022 01:24:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21C7A1E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667867145;
	bh=jbDzep2ixMXURV4WZfqw8ysOkd1UL1MMY7suiO1EPeI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Oy9rRas4m79rEggSl/WjjWodEmzC1Jt4YvamycrfHYkcqrzQz2uVfBY3Dcu8Ms3X9
	 vxiceEinrAA+mCocRq2nAD1rfTKejN8WQMOYjTxCNIpzOhloYwJ+KGH0FItNZeTly4
	 aEjOoCc4EU5eYoLvzRhnegszz/MuFa9qFSkRxdQA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A689AF80566;
	Tue,  8 Nov 2022 01:24:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27EC5F80559; Tue,  8 Nov 2022 01:24:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9888AF80116
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 01:24:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9888AF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HHzNu5tt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667867055; x=1699403055;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jbDzep2ixMXURV4WZfqw8ysOkd1UL1MMY7suiO1EPeI=;
 b=HHzNu5ttZqqgUrDcZJ79/ceCp4LBxIXuNYSFXD74PD1xvQMyIH88y0rC
 cd82LTfWbGhD5ZoIfAps7av0zL9nMJRdzQcMqnDk9A1Z1wEBOlFp4fvJF
 2Gbz+Vm2mzdzzeKUpyea+AB2AuzauiXlFBvipiuFOCgcwESpvhcj5SucK
 ETs88SDzAoZLSxd1YGJ7MwZN7usDdKmMjnoLigQIWWDRpQJZrvQ7fOiv2
 TH//Xo753El7jzfPnCZXNRinGu+EraBMZURFAA0Gc343ypYp1lvQLKpHn
 IjYYgdp0DSUgMnPp9mARzTrbbErEbRQ534hwEmv4vrlkzhs3GNJmiPg4O g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="293927279"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="293927279"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 16:23:50 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="614070241"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="614070241"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 16:23:48 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 3/3] ASoC: SOF: ipc4: get pipeline instance id from
 pipe_widget->instance_id
Date: Tue,  8 Nov 2022 08:29:10 +0800
Message-Id: <20221108002910.2819709-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221108002910.2819709-1-yung-chuan.liao@linux.intel.com>
References: <20221108002910.2819709-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com,
 ranjani.sridharan@linux.intel.com
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

Currently we set pipeline instance id = swidget->pipeline_id, but
pipeline_id is from topology and can be any number. In fact, the
number of pipelines is limited. This patch use ida to allocate pipeline
instance id and will be used for pipeline instance id in the IPC
message.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 12 ++++++------
 sound/soc/sof/ipc4-pcm.c      |  4 ++--
 sound/soc/sof/ipc4-topology.c | 25 +++++++++++++++++++++----
 3 files changed, 29 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 0cb7af719c66..1c3d4887aa30 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -478,7 +478,7 @@ static int ipc4_hda_dai_trigger(struct snd_pcm_substream *substream,
 		struct snd_sof_widget *pipe_widget = swidget->pipe_widget;
 		struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
 
-		ret = sof_ipc4_set_pipeline_state(sdev, swidget->pipeline_id,
+		ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
 						  SOF_IPC4_PIPE_PAUSED);
 		if (ret < 0)
 			return ret;
@@ -487,7 +487,7 @@ static int ipc4_hda_dai_trigger(struct snd_pcm_substream *substream,
 
 		snd_hdac_ext_stream_clear(hext_stream);
 
-		ret = sof_ipc4_set_pipeline_state(sdev, swidget->pipeline_id,
+		ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
 						  SOF_IPC4_PIPE_RESET);
 		if (ret < 0)
 			return ret;
@@ -506,7 +506,7 @@ static int ipc4_hda_dai_trigger(struct snd_pcm_substream *substream,
 		struct snd_sof_widget *pipe_widget = swidget->pipe_widget;
 		struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
 
-		ret = sof_ipc4_set_pipeline_state(sdev, swidget->pipeline_id,
+		ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
 						  SOF_IPC4_PIPE_PAUSED);
 		if (ret < 0)
 			return ret;
@@ -721,20 +721,20 @@ static int ipc4_be_dai_common_trigger(struct snd_soc_dai *dai, int cmd, int stre
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
-		ret = sof_ipc4_set_pipeline_state(sdev, swidget->pipeline_id,
+		ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
 						  SOF_IPC4_PIPE_PAUSED);
 		if (ret < 0)
 			return ret;
 		pipeline->state = SOF_IPC4_PIPE_PAUSED;
 
-		ret = sof_ipc4_set_pipeline_state(sdev, swidget->pipeline_id,
+		ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
 						  SOF_IPC4_PIPE_RESET);
 		if (ret < 0)
 			return ret;
 		pipeline->state = SOF_IPC4_PIPE_RESET;
 		break;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		ret = sof_ipc4_set_pipeline_state(sdev, swidget->pipeline_id,
+		ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
 						  SOF_IPC4_PIPE_PAUSED);
 		if (ret < 0)
 			return ret;
diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 732872395980..96941bebc1f1 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -81,7 +81,7 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 
 		/* first set the pipeline to PAUSED state */
 		if (pipeline->state != SOF_IPC4_PIPE_PAUSED) {
-			ret = sof_ipc4_set_pipeline_state(sdev, swidget->pipeline_id,
+			ret = sof_ipc4_set_pipeline_state(sdev, pipeline_widget->instance_id,
 							  SOF_IPC4_PIPE_PAUSED);
 			if (ret < 0) {
 				dev_err(sdev->dev, "failed to pause pipeline %d\n",
@@ -96,7 +96,7 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 			continue;
 
 		/* then set the final state */
-		ret = sof_ipc4_set_pipeline_state(sdev, swidget->pipeline_id, state);
+		ret = sof_ipc4_set_pipeline_state(sdev, pipeline_widget->instance_id, state);
 		if (ret < 0) {
 			dev_err(sdev->dev, "failed to set state %d for pipeline %d\n",
 				state, swidget->pipeline_id);
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 4f056adc7181..57d288bc695e 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -20,6 +20,7 @@
 #define SOF_IPC4_TPLG_ABI_SIZE 6
 
 static DEFINE_IDA(alh_group_ida);
+static DEFINE_IDA(pipeline_ida);
 
 static const struct sof_topology_token ipc4_sched_tokens[] = {
 	{SOF_TKN_SCHED_LP_MODE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
@@ -317,8 +318,7 @@ static int sof_ipc4_widget_setup_msg(struct snd_sof_widget *swidget, struct sof_
 	msg->primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
 	msg->primary |= SOF_IPC4_MSG_TARGET(SOF_IPC4_MODULE_MSG);
 
-	msg->extension = SOF_IPC4_MOD_EXT_PPL_ID(swidget->pipeline_id);
-	msg->extension |= SOF_IPC4_MOD_EXT_CORE_ID(swidget->core);
+	msg->extension = SOF_IPC4_MOD_EXT_CORE_ID(swidget->core);
 
 	type = (fw_module->man4_module_entry.type & SOF_IPC4_MODULE_DP) ? 1 : 0;
 	msg->extension |= SOF_IPC4_MOD_EXT_DOMAIN(type);
@@ -625,7 +625,6 @@ static int sof_ipc4_widget_setup_comp_pipeline(struct snd_sof_widget *swidget)
 	swidget->private = pipeline;
 
 	pipeline->msg.primary = SOF_IPC4_GLB_PIPE_PRIORITY(pipeline->priority);
-	pipeline->msg.primary |= SOF_IPC4_GLB_PIPE_INSTANCE_ID(swidget->pipeline_id);
 	pipeline->msg.primary |= SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_GLB_CREATE_PIPELINE);
 	pipeline->msg.primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
 	pipeline->msg.primary |= SOF_IPC4_MSG_TARGET(SOF_IPC4_FW_GEN_MSG);
@@ -1436,6 +1435,8 @@ static int sof_ipc4_control_setup(struct snd_sof_dev *sdev, struct snd_sof_contr
 
 static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 {
+	struct snd_sof_widget *pipe_widget = swidget->pipe_widget;
+	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
 	struct sof_ipc4_pipeline *pipeline;
 	struct sof_ipc4_msg *msg;
 	void *ipc_data = NULL;
@@ -1451,6 +1452,16 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 
 		msg = &pipeline->msg;
 		msg->primary |= pipeline->mem_usage;
+
+		swidget->instance_id = ida_alloc_max(&pipeline_ida, ipc4_data->max_num_pipelines,
+						     GFP_KERNEL);
+		if (swidget->instance_id < 0) {
+			dev_err(sdev->dev, "failed to assign pipeline id for %s: %d\n",
+				swidget->widget->name, swidget->instance_id);
+			return swidget->instance_id;
+		}
+		msg->primary &= ~SOF_IPC4_GLB_PIPE_INSTANCE_MASK;
+		msg->primary |= SOF_IPC4_GLB_PIPE_INSTANCE_ID(swidget->instance_id);
 		break;
 	case snd_soc_dapm_aif_in:
 	case snd_soc_dapm_aif_out:
@@ -1524,6 +1535,9 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 
 		msg->extension &= ~SOF_IPC4_MOD_EXT_PARAM_SIZE_MASK;
 		msg->extension |= ipc_size >> 2;
+
+		msg->extension &= ~SOF_IPC4_MOD_EXT_PPL_ID_MASK;
+		msg->extension |= SOF_IPC4_MOD_EXT_PPL_ID(pipe_widget->instance_id);
 	}
 	dev_dbg(sdev->dev, "Create widget %s instance %d - pipe %d - core %d\n",
 		swidget->widget->name, swidget->instance_id, swidget->pipeline_id, swidget->core);
@@ -1539,6 +1553,8 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 			struct sof_ipc4_fw_module *fw_module = swidget->module_info;
 
 			ida_free(&fw_module->m_ida, swidget->instance_id);
+		} else {
+			ida_free(&pipeline_ida, swidget->instance_id);
 		}
 	}
 
@@ -1556,7 +1572,7 @@ static int sof_ipc4_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget
 		struct sof_ipc4_msg msg = {{ 0 }};
 		u32 header;
 
-		header = SOF_IPC4_GLB_PIPE_INSTANCE_ID(swidget->pipeline_id);
+		header = SOF_IPC4_GLB_PIPE_INSTANCE_ID(swidget->instance_id);
 		header |= SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_GLB_DELETE_PIPELINE);
 		header |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
 		header |= SOF_IPC4_MSG_TARGET(SOF_IPC4_FW_GEN_MSG);
@@ -1570,6 +1586,7 @@ static int sof_ipc4_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget
 
 		pipeline->mem_usage = 0;
 		pipeline->state = SOF_IPC4_PIPE_UNINITIALIZED;
+		ida_free(&pipeline_ida, swidget->instance_id);
 	} else {
 		ida_free(&fw_module->m_ida, swidget->instance_id);
 	}
-- 
2.25.1

