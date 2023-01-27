Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6985867E489
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 13:04:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B68A2E71;
	Fri, 27 Jan 2023 13:03:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B68A2E71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674821085;
	bh=+kymWazXPBD0SKozUzfVf3F8zIOViQsRVsyzwhHuWas=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KARwN1Dy0M882dSBElrPZ4iQpGO43uTcguy5jhH+F+oliInsXB3T+4R08QpBqnN4o
	 +LHKJt9T+vP1/4PYU1oWimlE5NqR5i1NfwFx5CotsDYsqF5jjRXBIHtR6k2CwgSVYN
	 tIBcqCH8L8wJiwjk42VOsxqQFNbSzQNdFdwDIraM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EBADF805AF;
	Fri, 27 Jan 2023 13:01:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44C16F80568; Fri, 27 Jan 2023 13:00:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57131F80548
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 13:00:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57131F80548
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UFsWS556
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674820855; x=1706356855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+kymWazXPBD0SKozUzfVf3F8zIOViQsRVsyzwhHuWas=;
 b=UFsWS556v4Vwj52HJtEVddd+3ANTgu+8uujwjFkkhzMd9Xz8AZG5xXHU
 PQtfdnoOyhwtcMNnEGEi+Kvz+qeBP+B9B3vh48w2LtMV4XfsoldKqdJAQ
 tsgPcopG0lrD3RsfRpouy+EDfGcMpn0bbC5q+uTSHdbeyt4hIluKF4DI7
 RSTye0u899qCKsnxBMKUwQX7WSZnZKsztaclNtMWeNZz1NnL9/JfvoP6x
 BKv9PjGSL/QVExcCZZYbIKz1nyod7IRUpeMrogrUnNsgtiTYIoXQWH4bJ
 4APciuuokEJgT5mwcc25XBRWWGl+H1cOhtb2ySpiLvLaMDtj2ehIdZyOr A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="327091900"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="327091900"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:00:53 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="805782231"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="805782231"
Received: from aaralsto-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.30.130])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:00:51 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 11/18] ASoC: SOF: ipc4-pcm: Use the PCM stream's pipeline_info
 during trigger
Date: Fri, 27 Jan 2023 14:00:24 +0200
Message-Id: <20230127120031.10709-12-peter.ujfalusi@linux.intel.com>
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

Use the list of pipelines in the PCM stream's pipeline info to trigger
the pipelines in the right order. Add a helper for triggering pipelines
in batch mode that will be used to trigger multiple pipelines at the
same time.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Libin Yang <libin.yang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/sof/ipc4/header.h |   3 +
 sound/soc/sof/ipc4-pcm.c        | 137 ++++++++++++++++++++++++--------
 sound/soc/sof/ipc4-topology.h   |  10 +++
 3 files changed, 115 insertions(+), 35 deletions(-)

diff --git a/include/sound/sof/ipc4/header.h b/include/sound/sof/ipc4/header.h
index 622193be7ac4..d31349bf011d 100644
--- a/include/sound/sof/ipc4/header.h
+++ b/include/sound/sof/ipc4/header.h
@@ -185,6 +185,9 @@ enum sof_ipc4_pipeline_state {
 #define SOF_IPC4_GLB_PIPE_STATE_MASK		GENMASK(15, 0)
 #define SOF_IPC4_GLB_PIPE_STATE(x)		((x) << SOF_IPC4_GLB_PIPE_STATE_SHIFT)
 
+/* pipeline set state IPC msg extension */
+#define SOF_IPC4_GLB_PIPE_STATE_EXT_MULTI	BIT(0)
+
 /* load library ipc msg */
 #define SOF_IPC4_GLB_LOAD_LIBRARY_LIB_ID_SHIFT	16
 #define SOF_IPC4_GLB_LOAD_LIBRARY_LIB_ID(x)	((x) << SOF_IPC4_GLB_LOAD_LIBRARY_LIB_ID_SHIFT)
diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index db9d0adb2717..a5482185cd6c 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -13,6 +13,33 @@
 #include "ipc4-priv.h"
 #include "ipc4-topology.h"
 
+static int sof_ipc4_set_multi_pipeline_state(struct snd_sof_dev *sdev, u32 state,
+					     struct ipc4_pipeline_set_state_data *data)
+{
+	struct sof_ipc4_msg msg = {{ 0 }};
+	u32 primary, ipc_size;
+
+	/* trigger a single pipeline */
+	if (data->count == 1)
+		return sof_ipc4_set_pipeline_state(sdev, data->pipeline_ids[0], state);
+
+	primary = state;
+	primary |= SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_GLB_SET_PIPELINE_STATE);
+	primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
+	primary |= SOF_IPC4_MSG_TARGET(SOF_IPC4_FW_GEN_MSG);
+	msg.primary = primary;
+
+	/* trigger multiple pipelines with a single IPC */
+	msg.extension = SOF_IPC4_GLB_PIPE_STATE_EXT_MULTI;
+
+	/* ipc_size includes the count and the pipeline IDs for the number of pipelines */
+	ipc_size = sizeof(u32) * (data->count + 1);
+	msg.data_size = ipc_size;
+	msg.data_ptr = data;
+
+	return sof_ipc_tx_message(sdev->ipc, &msg, ipc_size, NULL, 0);
+}
+
 int sof_ipc4_set_pipeline_state(struct snd_sof_dev *sdev, u32 id, u32 state)
 {
 	struct sof_ipc4_msg msg = {{ 0 }};
@@ -37,60 +64,100 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_sof_widget *pipeline_widget;
-	struct snd_soc_dapm_widget_list *list;
-	struct snd_soc_dapm_widget *widget;
+	struct snd_sof_pcm_stream_pipeline_list *pipeline_list;
+	struct ipc4_pipeline_set_state_data *data;
+	struct snd_sof_widget *pipe_widget;
 	struct sof_ipc4_pipeline *pipeline;
-	struct snd_sof_widget *swidget;
 	struct snd_sof_pcm *spcm;
-	int ret = 0;
-	int num_widgets;
+	int ret;
+	int i, j;
 
 	spcm = snd_sof_find_spcm_dai(component, rtd);
 	if (!spcm)
 		return -EINVAL;
 
-	list = spcm->stream[substream->stream].list;
-
-	for_each_dapm_widgets(list, num_widgets, widget) {
-		swidget = widget->dobj.private;
+	pipeline_list = &spcm->stream[substream->stream].pipeline_list;
+
+	/* nothing to trigger if the list is empty */
+	if (!pipeline_list->pipe_widgets)
+		return 0;
+
+	/* allocate memory for the pipeline data */
+	data = kzalloc(struct_size(data, pipeline_ids, pipeline_list->count), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	/*
+	 * IPC4 requires pipelines to be triggered in order starting at the sink and
+	 * walking all the way to the source. So traverse the pipeline_list in the reverse order.
+	 * Skip the pipelines that have their skip_during_fe_trigger flag set or if they're already
+	 * in the requested state. If there is a fork in the pipeline, the order of triggering
+	 * between the left/right paths will be indeterministic. But the sink->source trigger order
+	 * sink->source would still be guaranteed for each fork independently.
+	 */
+	for (i = pipeline_list->count - 1; i >= 0; i--) {
+		pipe_widget = pipeline_list->pipe_widgets[i];
+		pipeline = pipe_widget->private;
+		if (pipeline->state != state && !pipeline->skip_during_fe_trigger)
+			data->pipeline_ids[data->count++] = pipe_widget->instance_id;
+	}
 
-		if (!swidget)
-			continue;
+	/* return if all pipelines are in the requested state already */
+	if (!data->count) {
+		kfree(data);
+		return 0;
+	}
 
-		pipeline_widget = swidget->pipe_widget;
-		pipeline = (struct sof_ipc4_pipeline *)pipeline_widget->private;
+	/*
+	 * Pause all pipelines. This could result in an extra IPC to pause all pipelines even if
+	 * they are already paused. But it helps keep the logic simpler and the firmware handles
+	 * the repeated pause gracefully. This can be optimized in the future if needed.
+	 */
+	ret = sof_ipc4_set_multi_pipeline_state(sdev, SOF_IPC4_PIPE_PAUSED, data);
+	if (ret < 0) {
+		dev_err(sdev->dev, "failed to pause all pipelines\n");
+		goto free;
+	}
 
-		if (pipeline->state == state || pipeline->skip_during_fe_trigger)
-			continue;
+	/* update PAUSED state for all pipelines that were just triggered */
+	for (i = 0; i < data->count; i++) {
+		for (j = 0; j < pipeline_list->count; j++) {
+			pipe_widget = pipeline_list->pipe_widgets[j];
+			pipeline = pipe_widget->private;
 
-		/* first set the pipeline to PAUSED state */
-		if (pipeline->state != SOF_IPC4_PIPE_PAUSED) {
-			ret = sof_ipc4_set_pipeline_state(sdev, pipeline_widget->instance_id,
-							  SOF_IPC4_PIPE_PAUSED);
-			if (ret < 0) {
-				dev_err(sdev->dev, "failed to pause pipeline %d\n",
-					swidget->pipeline_id);
-				return ret;
+			if (data->pipeline_ids[i] == pipe_widget->instance_id) {
+				pipeline->state = SOF_IPC4_PIPE_PAUSED;
+				break;
 			}
 		}
+	}
 
-		pipeline->state = SOF_IPC4_PIPE_PAUSED;
+	/* return if this is the final state */
+	if (state == SOF_IPC4_PIPE_PAUSED)
+		goto free;
 
-		if (pipeline->state == state)
-			continue;
+	/* else set the final state in the DSP */
+	ret = sof_ipc4_set_multi_pipeline_state(sdev, state, data);
+	if (ret < 0) {
+		dev_err(sdev->dev, "failed to set final state %d for all pipelines\n", state);
+		goto free;
+	}
 
-		/* then set the final state */
-		ret = sof_ipc4_set_pipeline_state(sdev, pipeline_widget->instance_id, state);
-		if (ret < 0) {
-			dev_err(sdev->dev, "failed to set state %d for pipeline %d\n",
-				state, swidget->pipeline_id);
-			break;
-		}
+	/* update final state for all pipelines that were just triggered */
+	for (i = 0; i < data->count; i++) {
+		for (j = 0; j < pipeline_list->count; j++) {
+			pipe_widget = pipeline_list->pipe_widgets[j];
+			pipeline = pipe_widget->private;
 
-		pipeline->state = state;
+			if (data->pipeline_ids[i] == pipe_widget->instance_id) {
+				pipeline->state = state;
+				break;
+			}
+		}
 	}
 
+free:
+	kfree(data);
 	return ret;
 }
 
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 028b5d91b9db..ee5d31e68a77 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -84,6 +84,16 @@ struct sof_ipc4_pipeline {
 	bool skip_during_fe_trigger;
 };
 
+/**
+ * struct sof_ipc4_multi_pipeline_data - multi pipeline trigger IPC data
+ * @count: Number of pipelines to be triggered
+ * @pipeline_ids: Flexible array of IDs of the pipelines to be triggered
+ */
+struct ipc4_pipeline_set_state_data {
+	u32 count;
+	DECLARE_FLEX_ARRAY(u32, pipeline_ids);
+} __packed;
+
 /**
  * struct sof_ipc4_available_audio_format - Available audio formats
  * @base_config: Available base config
-- 
2.39.1

