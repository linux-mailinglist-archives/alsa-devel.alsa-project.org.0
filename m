Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4848067E491
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 13:05:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B97BAEAC;
	Fri, 27 Jan 2023 13:04:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B97BAEAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674821115;
	bh=2rKTX750cV41OCkc76ovb9epH0NKmhnhadfJ14nQrNg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EY4syxDNWJSeaTItvEpPF5NwayQnoqrjo2reYLBW8QQ2QJodwVxxLNbnmFmq/ZV0T
	 hxrCmgy2uh8fPDnXWSZ+S/ojrojZbF7xMJQQ+k+CYUbuiLYHUBd9l8EfrIYCpkvI1g
	 Sb9KEzO6mVt8PMTQYWobSC7T8nsZfsTqlV6XB+Io=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14CCFF805A0;
	Fri, 27 Jan 2023 13:01:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DC8BF805AB; Fri, 27 Jan 2023 13:01:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 909ACF80548
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 13:00:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 909ACF80548
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VicwOTma
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674820860; x=1706356860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2rKTX750cV41OCkc76ovb9epH0NKmhnhadfJ14nQrNg=;
 b=VicwOTmaqC7mY8EqenlMN0/d32+4dDcJ9NDXwPk9BRe5apZ1g82aZnrU
 zpAK8bfN7xhgA6ven13qpp5F2+bK5CmBuPCkJQZDsgwXUdDfuFs56W3k8
 VztF+s+WETMYThHz+rmwlmdB6KZY0DNhlDIh7fgJ3dbWdYf7MWrbpRURA
 GbWpxDd/2NEvGceRNlQo0RECO65elmqMH9hQgDIDIRxBd8kubfHa5vTdO
 yoJ88lJXZesOp7SNDyFRg4sjFbYD05hLw1RMY4lSbr2NoNJQZpZRxE7/t
 RWQeF/eizZo9ck+sCc1UeBpEa45ruAK9P0Htm/7YzN4dPRxASlGGAunca w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="327091913"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="327091913"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:00:56 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="805782252"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="805782252"
Received: from aaralsto-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.30.130])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:00:53 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 12/18] ASoC: SOF: Introduce struct snd_sof_pipeline
Date: Fri, 27 Jan 2023 14:00:25 +0200
Message-Id: <20230127120031.10709-13-peter.ujfalusi@linux.intel.com>
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

Introduce struct snd_sof_pipeline to save the information about
pipelines including the pipeline widget, their status wrt how many PCM's
are using them and whether they are complete or not.

In struct snd_sof_widget, replace pipe_widget with spipe and remove
complete. In struct snd_sof_pcm_stream_pipeline_list, replace
pipe_widgets with pipelines.

Update all users accordingly.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/core.c          |  1 +
 sound/soc/sof/intel/hda-dai.c |  2 +-
 sound/soc/sof/ipc3-topology.c |  9 +++--
 sound/soc/sof/ipc4-pcm.c      | 23 ++++++-----
 sound/soc/sof/ipc4-topology.c | 12 +++---
 sound/soc/sof/sof-audio.c     | 48 +++++++++++++++--------
 sound/soc/sof/sof-audio.h     | 27 +++++++++----
 sound/soc/sof/sof-priv.h      |  1 +
 sound/soc/sof/topology.c      | 73 +++++++++++++++++++++++------------
 9 files changed, 126 insertions(+), 70 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 26a3f7c8c914..7de8673a01ce 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -390,6 +390,7 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 	INIT_LIST_HEAD(&sdev->pcm_list);
 	INIT_LIST_HEAD(&sdev->kcontrol_list);
 	INIT_LIST_HEAD(&sdev->widget_list);
+	INIT_LIST_HEAD(&sdev->pipeline_list);
 	INIT_LIST_HEAD(&sdev->dai_list);
 	INIT_LIST_HEAD(&sdev->dai_link_list);
 	INIT_LIST_HEAD(&sdev->route_list);
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 98eebb4b07e6..193b3e74820a 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -468,7 +468,7 @@ static int ipc4_hda_dai_trigger(struct snd_pcm_substream *substream,
 
 	w = snd_soc_dai_get_widget(dai, substream->stream);
 	swidget = w->dobj.private;
-	pipe_widget = swidget->pipe_widget;
+	pipe_widget = swidget->spipe->pipe_widget;
 	pipeline = pipe_widget->private;
 
 	switch (cmd) {
diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 3f52dfb19e01..88b9b9507231 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -2233,9 +2233,9 @@ static int sof_ipc3_set_up_all_pipelines(struct snd_sof_dev *sdev, bool verify)
 					return ret;
 			}
 
-			swidget->complete = sof_ipc3_complete_pipeline(sdev, swidget);
-			if (swidget->complete < 0)
-				return swidget->complete;
+			swidget->spipe->complete = sof_ipc3_complete_pipeline(sdev, swidget);
+			if (swidget->spipe->complete < 0)
+				return swidget->spipe->complete;
 			break;
 		default:
 			break;
@@ -2317,7 +2317,8 @@ static int sof_ipc3_tear_down_all_pipelines(struct snd_sof_dev *sdev, bool verif
 		if (!verify && !swidget->dynamic_pipeline_widget &&
 		    SOF_FW_VER(v->major, v->minor, v->micro) < SOF_FW_VER(2, 2, 0)) {
 			swidget->use_count = 0;
-			swidget->complete = 0;
+			if (swidget->spipe)
+				swidget->spipe->complete = 0;
 			continue;
 		}
 
diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index a5482185cd6c..17a116e8c47c 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -68,6 +68,7 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	struct ipc4_pipeline_set_state_data *data;
 	struct snd_sof_widget *pipe_widget;
 	struct sof_ipc4_pipeline *pipeline;
+	struct snd_sof_pipeline *spipe;
 	struct snd_sof_pcm *spcm;
 	int ret;
 	int i, j;
@@ -79,7 +80,7 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	pipeline_list = &spcm->stream[substream->stream].pipeline_list;
 
 	/* nothing to trigger if the list is empty */
-	if (!pipeline_list->pipe_widgets)
+	if (!pipeline_list->pipelines)
 		return 0;
 
 	/* allocate memory for the pipeline data */
@@ -96,7 +97,8 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	 * sink->source would still be guaranteed for each fork independently.
 	 */
 	for (i = pipeline_list->count - 1; i >= 0; i--) {
-		pipe_widget = pipeline_list->pipe_widgets[i];
+		spipe = pipeline_list->pipelines[i];
+		pipe_widget = spipe->pipe_widget;
 		pipeline = pipe_widget->private;
 		if (pipeline->state != state && !pipeline->skip_during_fe_trigger)
 			data->pipeline_ids[data->count++] = pipe_widget->instance_id;
@@ -122,7 +124,8 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	/* update PAUSED state for all pipelines that were just triggered */
 	for (i = 0; i < data->count; i++) {
 		for (j = 0; j < pipeline_list->count; j++) {
-			pipe_widget = pipeline_list->pipe_widgets[j];
+			spipe = pipeline_list->pipelines[j];
+			pipe_widget = spipe->pipe_widget;
 			pipeline = pipe_widget->private;
 
 			if (data->pipeline_ids[i] == pipe_widget->instance_id) {
@@ -146,7 +149,8 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	/* update final state for all pipelines that were just triggered */
 	for (i = 0; i < data->count; i++) {
 		for (j = 0; j < pipeline_list->count; j++) {
-			pipe_widget = pipeline_list->pipe_widgets[j];
+			spipe = pipeline_list->pipelines[j];
+			pipe_widget = spipe->pipe_widget;
 			pipeline = pipe_widget->private;
 
 			if (data->pipeline_ids[i] == pipe_widget->instance_id) {
@@ -274,8 +278,8 @@ static void sof_ipc4_pcm_free(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm
 
 	for_each_pcm_streams(stream) {
 		pipeline_list = &spcm->stream[stream].pipeline_list;
-		kfree(pipeline_list->pipe_widgets);
-		pipeline_list->pipe_widgets = NULL;
+		kfree(pipeline_list->pipelines);
+		pipeline_list->pipelines = NULL;
 	}
 }
 
@@ -289,10 +293,9 @@ static int sof_ipc4_pcm_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm
 		pipeline_list = &spcm->stream[stream].pipeline_list;
 
 		/* allocate memory for max number of pipeline IDs */
-		pipeline_list->pipe_widgets = kcalloc(ipc4_data->max_num_pipelines,
-						      sizeof(struct snd_sof_widget *),
-						      GFP_KERNEL);
-		if (!pipeline_list->pipe_widgets) {
+		pipeline_list->pipelines = kcalloc(ipc4_data->max_num_pipelines,
+						   sizeof(struct snd_sof_widget *), GFP_KERNEL);
+		if (!pipeline_list->pipelines) {
 			sof_ipc4_pcm_free(sdev, spcm);
 			return -ENOMEM;
 		}
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index f3b1a7f81216..2f82b5e02a27 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -855,7 +855,7 @@ sof_ipc4_update_pipeline_mem_usage(struct snd_sof_dev *sdev, struct snd_sof_widg
 
 	total = SOF_IPC4_FW_PAGE(task_mem + queue_mem);
 
-	pipe_widget = swidget->pipe_widget;
+	pipe_widget = swidget->spipe->pipe_widget;
 	pipeline = pipe_widget->private;
 	pipeline->mem_usage += total;
 }
@@ -969,7 +969,7 @@ static void sof_ipc4_unprepare_copier_module(struct snd_sof_widget *swidget)
 	struct sof_ipc4_pipeline *pipeline;
 
 	/* reset pipeline memory usage */
-	pipe_widget = swidget->pipe_widget;
+	pipe_widget = swidget->spipe->pipe_widget;
 	pipeline = pipe_widget->private;
 	pipeline->mem_usage = 0;
 
@@ -1136,7 +1136,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		struct snd_sof_widget *pipe_widget;
 		struct sof_ipc4_pipeline *pipeline;
 
-		pipe_widget = swidget->pipe_widget;
+		pipe_widget = swidget->spipe->pipe_widget;
 		pipeline = pipe_widget->private;
 		ipc4_copier = (struct sof_ipc4_copier *)swidget->private;
 		gtw_attr = ipc4_copier->gtw_attr;
@@ -1495,7 +1495,7 @@ static int sof_ipc4_control_setup(struct snd_sof_dev *sdev, struct snd_sof_contr
 
 static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 {
-	struct snd_sof_widget *pipe_widget = swidget->pipe_widget;
+	struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
 	struct sof_ipc4_pipeline *pipeline;
 	struct sof_ipc4_msg *msg;
@@ -1815,7 +1815,7 @@ static int sof_ipc4_route_free(struct snd_sof_dev *sdev, struct snd_sof_route *s
 	 * routes belonging to the same pipeline will be disconnected by the FW when the pipeline
 	 * is freed. So avoid sending this IPC which will be ignored by the FW anyway.
 	 */
-	if (src_widget->pipe_widget == sink_widget->pipe_widget)
+	if (src_widget->spipe->pipe_widget == sink_widget->spipe->pipe_widget)
 		goto out;
 
 	header = src_fw_module->man4_module_entry.id;
@@ -1846,7 +1846,7 @@ static int sof_ipc4_route_free(struct snd_sof_dev *sdev, struct snd_sof_route *s
 static int sof_ipc4_dai_config(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget,
 			       unsigned int flags, struct snd_sof_dai_config_data *data)
 {
-	struct snd_sof_widget *pipe_widget = swidget->pipe_widget;
+	struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
 	struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
 	struct snd_sof_dai *dai = swidget->private;
 	struct sof_ipc4_gtw_attributes *gtw_attr;
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index e6796c59e04b..158f7b03fbc2 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -31,6 +31,7 @@ static void sof_reset_route_setup_status(struct snd_sof_dev *sdev, struct snd_so
 int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 {
 	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
+	struct snd_sof_widget *pipe_widget;
 	int err = 0;
 	int ret;
 
@@ -43,6 +44,8 @@ int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	if (--swidget->use_count)
 		return 0;
 
+	pipe_widget = swidget->spipe->pipe_widget;
+
 	/* reset route setup status for all routes that contain this widget */
 	sof_reset_route_setup_status(sdev, swidget);
 
@@ -67,12 +70,15 @@ int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	 * skip for static pipelines
 	 */
 	if (swidget->dynamic_pipeline_widget && swidget->id != snd_soc_dapm_scheduler) {
-		ret = sof_widget_free(sdev, swidget->pipe_widget);
+		ret = sof_widget_free(sdev, pipe_widget);
 		if (ret < 0 && !err)
 			err = ret;
-		swidget->pipe_widget->complete = 0;
 	}
 
+	/* clear pipeline complete */
+	if (swidget->id == snd_soc_dapm_scheduler)
+		swidget->spipe->complete = 0;
+
 	if (!err)
 		dev_dbg(sdev->dev, "widget %s freed\n", swidget->widget->name);
 
@@ -103,14 +109,13 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	 * widget in the pipeline is freed. Skip setting up scheduler widget for static pipelines.
 	 */
 	if (swidget->dynamic_pipeline_widget && swidget->id != snd_soc_dapm_scheduler) {
-		if (!swidget->pipe_widget) {
-			dev_err(sdev->dev, "No scheduler widget set for %s\n",
-				swidget->widget->name);
+		if (!swidget->spipe || !swidget->spipe->pipe_widget) {
+			dev_err(sdev->dev, "No pipeline set for %s\n", swidget->widget->name);
 			ret = -EINVAL;
 			goto use_count_dec;
 		}
 
-		ret = sof_widget_setup(sdev, swidget->pipe_widget);
+		ret = sof_widget_setup(sdev, swidget->spipe->pipe_widget);
 		if (ret < 0)
 			goto use_count_dec;
 	}
@@ -159,7 +164,7 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	snd_sof_dsp_core_put(sdev, swidget->core);
 pipe_widget_free:
 	if (swidget->id != snd_soc_dapm_scheduler)
-		sof_widget_free(sdev, swidget->pipe_widget);
+		sof_widget_free(sdev, swidget->spipe->pipe_widget);
 use_count_dec:
 	swidget->use_count--;
 	return ret;
@@ -409,7 +414,7 @@ static int sof_set_up_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_d
 	struct snd_sof_pcm_stream_pipeline_list *pipeline_list = &spcm->stream[dir].pipeline_list;
 	struct snd_soc_dapm_widget_list *list = spcm->stream[dir].list;
 	struct snd_sof_widget *swidget = widget->dobj.private;
-	struct snd_sof_widget *pipe_widget;
+	struct snd_sof_pipeline *spipe;
 	struct snd_soc_dapm_path *p;
 	int ret;
 
@@ -421,7 +426,7 @@ static int sof_set_up_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_d
 			return ret;
 
 		/* skip populating the pipe_widgets array if it is NULL */
-		if (!pipeline_list->pipe_widgets)
+		if (!pipeline_list->pipelines)
 			goto sink_setup;
 
 		/*
@@ -430,14 +435,14 @@ static int sof_set_up_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_d
 		 * order source to sink.
 		 */
 		for (i = 0; i < pipeline_list->count; i++) {
-			pipe_widget = pipeline_list->pipe_widgets[i];
-			if (pipe_widget == swidget->pipe_widget)
+			spipe = pipeline_list->pipelines[i];
+			if (spipe == swidget->spipe)
 				break;
 		}
 
 		if (i == pipeline_list->count) {
 			pipeline_list->count++;
-			pipeline_list->pipe_widgets[i] = swidget->pipe_widget;
+			pipeline_list->pipelines[i] = swidget->spipe;
 		}
 	}
 
@@ -572,11 +577,20 @@ int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm,
 	for_each_dapm_widgets(list, i, widget) {
 		struct snd_sof_widget *swidget = widget->dobj.private;
 		struct snd_sof_widget *pipe_widget;
+		struct snd_sof_pipeline *spipe;
 
 		if (!swidget)
 			continue;
 
-		pipe_widget = swidget->pipe_widget;
+		spipe = swidget->spipe;
+		if (!spipe) {
+			dev_err(sdev->dev, "no pipeline found for %s\n",
+				swidget->widget->name);
+			ret = -EINVAL;
+			goto widget_free;
+		}
+
+		pipe_widget = spipe->pipe_widget;
 		if (!pipe_widget) {
 			dev_err(sdev->dev, "error: no pipeline widget found for %s\n",
 				swidget->widget->name);
@@ -584,13 +598,13 @@ int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm,
 			goto widget_free;
 		}
 
-		if (pipe_widget->complete)
+		if (spipe->complete)
 			continue;
 
 		if (tplg_ops && tplg_ops->pipeline_complete) {
-			pipe_widget->complete = tplg_ops->pipeline_complete(sdev, pipe_widget);
-			if (pipe_widget->complete < 0) {
-				ret = pipe_widget->complete;
+			spipe->complete = tplg_ops->pipeline_complete(sdev, pipe_widget);
+			if (spipe->complete < 0) {
+				ret = spipe->complete;
 				goto widget_free;
 			}
 		}
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index bb5c61dd9b1e..f1bbd1adc8b6 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -288,11 +288,11 @@ struct sof_token_info {
 /**
  * struct snd_sof_pcm_stream_pipeline_list - List of pipelines associated with a PCM stream
  * @count: number of pipeline widgets in the @pipe_widgets array
- * @pipe_widgets: array of pipeline widgets
+ * @pipelines: array of pipelines
  */
 struct snd_sof_pcm_stream_pipeline_list {
 	u32 count;
-	struct snd_sof_widget **pipe_widgets;
+	struct snd_sof_pipeline **pipelines;
 };
 
 /* PCM stream, mapped to FW component  */
@@ -382,11 +382,6 @@ struct snd_sof_widget {
 	struct snd_soc_component *scomp;
 	int comp_id;
 	int pipeline_id;
-	/*
-	 * complete flag is used to indicate that pipeline set up is complete for scheduler type
-	 * widgets. It is unused for all other widget types.
-	 */
-	int complete;
 	/*
 	 * the prepared flag is used to indicate that a widget has been prepared for getting set
 	 * up in the DSP.
@@ -413,7 +408,7 @@ struct snd_sof_widget {
 
 	struct snd_soc_dapm_widget *widget;
 	struct list_head list;	/* list in sdev widget list */
-	struct snd_sof_widget *pipe_widget;
+	struct snd_sof_pipeline *spipe;
 	void *module_info;
 
 	const guid_t uuid;
@@ -451,6 +446,22 @@ struct snd_sof_widget {
 	void *private;		/* core does not touch this */
 };
 
+/** struct snd_sof_pipeline - ASoC SOF pipeline
+ * @pipe_widget: Pointer to the pipeline widget
+ * @started_count: Count of number of PCM's that have started this pipeline
+ * @paused_count: Count of number of PCM's that have started and have currently paused this
+		  pipeline
+ * @complete: flag used to indicate that pipeline set up is complete.
+ * @list: List item in sdev pipeline_list
+ */
+struct snd_sof_pipeline {
+	struct snd_sof_widget *pipe_widget;
+	int started_count;
+	int paused_count;
+	int complete;
+	struct list_head list;
+};
+
 /* ASoC SOF DAPM route */
 struct snd_sof_route {
 	struct snd_soc_component *scomp;
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 86fc5c6a9c39..208a30ff3db9 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -578,6 +578,7 @@ struct snd_sof_dev {
 	struct list_head pcm_list;
 	struct list_head kcontrol_list;
 	struct list_head widget_list;
+	struct list_head pipeline_list;
 	struct list_head dai_list;
 	struct list_head dai_link_list;
 	struct list_head route_list;
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 51f6fed45ae7..33ca3067262b 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1402,7 +1402,6 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 	swidget->scomp = scomp;
 	swidget->widget = w;
 	swidget->comp_id = sdev->next_comp_id++;
-	swidget->complete = 0;
 	swidget->id = w->id;
 	swidget->pipeline_id = index;
 	swidget->private = NULL;
@@ -1553,6 +1552,23 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 		}
 	}
 
+	/* create and add pipeline for scheduler type widgets */
+	if (w->id == snd_soc_dapm_scheduler) {
+		struct snd_sof_pipeline *spipe;
+
+		spipe = kzalloc(sizeof(*spipe), GFP_KERNEL);
+		if (!spipe) {
+			kfree(swidget->private);
+			kfree(swidget->tuples);
+			kfree(swidget);
+			return -ENOMEM;
+		}
+
+		spipe->pipe_widget = swidget;
+		swidget->spipe = spipe;
+		list_add(&spipe->list, &sdev->pipeline_list);
+	}
+
 	w->dobj.private = swidget;
 	list_add(&swidget->list, &sdev->widget_list);
 	return ret;
@@ -1608,6 +1624,15 @@ static int sof_widget_unload(struct snd_soc_component *scomp,
 		sof_disconnect_dai_widget(scomp, widget);
 
 		break;
+	case snd_soc_dapm_scheduler:
+	{
+		struct snd_sof_pipeline *spipe = swidget->spipe;
+
+		list_del(&spipe->list);
+		kfree(spipe);
+		swidget->spipe = NULL;
+		break;
+	}
 	default:
 		break;
 	}
@@ -2082,18 +2107,19 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 }
 
 /**
- * sof_set_pipe_widget - Set pipe_widget for a component
+ * sof_set_widget_pipeline - Set pipeline for a component
  * @sdev: pointer to struct snd_sof_dev
- * @pipe_widget: pointer to struct snd_sof_widget of type snd_soc_dapm_scheduler
+ * @spipe: pointer to struct snd_sof_pipeline
  * @swidget: pointer to struct snd_sof_widget that has the same pipeline ID as @pipe_widget
  *
  * Return: 0 if successful, -EINVAL on error.
  * The function checks if @swidget is associated with any volatile controls. If so, setting
  * the dynamic_pipeline_widget is disallowed.
  */
-static int sof_set_pipe_widget(struct snd_sof_dev *sdev, struct snd_sof_widget *pipe_widget,
-			       struct snd_sof_widget *swidget)
+static int sof_set_widget_pipeline(struct snd_sof_dev *sdev, struct snd_sof_pipeline *spipe,
+				   struct snd_sof_widget *swidget)
 {
+	struct snd_sof_widget *pipe_widget = spipe->pipe_widget;
 	struct snd_sof_control *scontrol;
 
 	if (pipe_widget->dynamic_pipeline_widget) {
@@ -2108,8 +2134,8 @@ static int sof_set_pipe_widget(struct snd_sof_dev *sdev, struct snd_sof_widget *
 			}
 	}
 
-	/* set the pipe_widget and apply the dynamic_pipeline_widget_flag */
-	swidget->pipe_widget = pipe_widget;
+	/* set the pipeline and apply the dynamic_pipeline_widget_flag */
+	swidget->spipe = spipe;
 	swidget->dynamic_pipeline_widget = pipe_widget->dynamic_pipeline_widget;
 
 	return 0;
@@ -2123,6 +2149,7 @@ static int sof_complete(struct snd_soc_component *scomp)
 	struct snd_sof_widget *swidget, *comp_swidget;
 	const struct sof_ipc_tplg_widget_ops *widget_ops;
 	struct snd_sof_control *scontrol;
+	struct snd_sof_pipeline *spipe;
 	int ret;
 
 	widget_ops = tplg_ops ? tplg_ops->widget : NULL;
@@ -2155,23 +2182,21 @@ static int sof_complete(struct snd_soc_component *scomp)
 	}
 
 	/* set the pipe_widget and apply the dynamic_pipeline_widget_flag */
-	list_for_each_entry(swidget, &sdev->widget_list, list) {
-		switch (swidget->id) {
-		case snd_soc_dapm_scheduler:
-			/*
-			 * Apply the dynamic_pipeline_widget flag and set the pipe_widget field
-			 * for all widgets that have the same pipeline ID as the scheduler widget
-			 */
-			list_for_each_entry(comp_swidget, &sdev->widget_list, list)
-				if (comp_swidget->pipeline_id == swidget->pipeline_id) {
-					ret = sof_set_pipe_widget(sdev, swidget, comp_swidget);
-					if (ret < 0)
-						return ret;
-				}
-			break;
-		default:
-			break;
-		}
+	list_for_each_entry(spipe, &sdev->pipeline_list, list) {
+		struct snd_sof_widget *pipe_widget = spipe->pipe_widget;
+
+		/*
+		 * Apply the dynamic_pipeline_widget flag and set the pipe_widget field
+		 * for all widgets that have the same pipeline ID as the scheduler widget.
+		 * Skip the scheduler widgets as they have their pipeline set during widget_ready
+		 */
+		list_for_each_entry(comp_swidget, &sdev->widget_list, list)
+			if (comp_swidget->widget->id != snd_soc_dapm_scheduler &&
+			    comp_swidget->pipeline_id == pipe_widget->pipeline_id) {
+				ret = sof_set_widget_pipeline(sdev, spipe, comp_swidget);
+				if (ret < 0)
+					return ret;
+			}
 	}
 
 	/* verify topology components loading including dynamic pipelines */
-- 
2.39.1

