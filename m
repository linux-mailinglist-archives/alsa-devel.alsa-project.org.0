Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 715E24193E0
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 14:10:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC98516BC;
	Mon, 27 Sep 2021 14:10:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC98516BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632744659;
	bh=rkEjWsnDwSM5SvEJp1PZ4vslEB39U82UHE/3rzFoKj0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eTxEFW9wnj9DTShiRC8d33/snWPawk8HdGndFfKKbPdGW/jOIkTuSIsUF4RPjT+4C
	 XxnrTnyz9kOTz5JY2FDVNqCraIDyFHEzl5krvig0I7zE8PPvG2cfQCSPtzCe+ScGB7
	 qzNz+F4qUB65WCrVtd7tPfGZsWP1zIfakW/TkSis=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBDA3F80272;
	Mon, 27 Sep 2021 14:07:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24E33F804CA; Mon, 27 Sep 2021 14:07:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF3A7F80227
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 14:05:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF3A7F80227
X-IronPort-AV: E=McAfee;i="6200,9189,10119"; a="221260462"
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="221260462"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 05:05:25 -0700
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="553164374"
Received: from unknown (HELO pujfalus-desk.ger.corp.intel.com)
 ([10.251.220.221])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 05:05:22 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com
Subject: [PATCH v3 03/12] ASoC: SOF: topology: Add new token for dynamic
 pipeline
Date: Mon, 27 Sep 2021 15:05:08 +0300
Message-Id: <20210927120517.20505-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210927120517.20505-1-peter.ujfalusi@linux.intel.com>
References: <20210927120517.20505-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 seppo.ingalsuo@intel.com, ranjani.sridharan@linux.intel.com,
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Today, we set up all widgets required for all PCM streams
at the time of topology parsing even if they are not
used. An optimization would be to only set up the widgets
required for currently active PCM streams. This would give
the FW the opportunity to power gate unused memory blocks,
thereby saving power.

For dynamic pipelines, the widgets in the connected DAPM path
for each PCM will need to be set up at runtime. This patch
introduces a new token, DYNAMIC_PIPELINE, for scheduler type
widgets that indicate whether a pipeline should be set up
statically during topology load or at runtime when the PCM is
opened. Introduce a new field called dynamic_pipeline_widget
in struct snd_sof_widget to save the value of the parsed token.

The token is set only for the pipeline (scheduler type)
widget and must be propagated to all widgets in the same
pipeline during topology load. Introduce another field called
pipe_widget in struct snd_sof_widget that saves the pointer to
the scheduler widget with the same pipeline ID as that of the
widget. This field is populated when the pipeline completion
callback is invoked during topology loading.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/uapi/sound/sof/tokens.h |  1 +
 sound/soc/sof/sof-audio.h       | 13 +++++++
 sound/soc/sof/topology.c        | 62 ++++++++++++++++++++++++++++++++-
 3 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index a642bf30c027..02b71a8deea4 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -51,6 +51,7 @@
 #define SOF_TKN_SCHED_CORE			203
 #define SOF_TKN_SCHED_FRAMES			204
 #define SOF_TKN_SCHED_TIME_DOMAIN		205
+#define SOF_TKN_SCHED_DYNAMIC_PIPELINE		206
 
 /* volume */
 #define SOF_TKN_VOLUME_RAMP_STEP_TYPE		250
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 78a4a0c90a29..4a1c38c5618d 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -81,6 +81,8 @@ struct snd_sof_control {
 	bool comp_data_dirty;
 };
 
+struct snd_sof_widget;
+
 /* ASoC SOF DAPM widget */
 struct snd_sof_widget {
 	struct snd_soc_component *scomp;
@@ -90,8 +92,19 @@ struct snd_sof_widget {
 	int core;
 	int id;
 
+	/*
+	 * Flag indicating if the widget should be set up dynamically when a PCM is opened.
+	 * This flag is only set for the scheduler type widget in topology. During topology
+	 * loading, this flag is propagated to all the widgets belonging to the same pipeline.
+	 * When this flag is not set, a widget is set up at the time of topology loading
+	 * and retained until the DSP enters D3. It will need to be set up again when resuming
+	 * from D3.
+	 */
+	bool dynamic_pipeline_widget;
+
 	struct snd_soc_dapm_widget *widget;
 	struct list_head list;	/* list in sdev widget list */
+	struct snd_sof_widget *pipe_widget;
 
 	/* extended data for UUID components */
 	struct sof_ipc_comp_ext comp_ext;
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index d8f7b1edefc3..60d1db6a9193 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -572,6 +572,12 @@ static const struct sof_topology_token sched_tokens[] = {
 		offsetof(struct sof_ipc_pipe_new, time_domain), 0},
 };
 
+static const struct sof_topology_token pipeline_tokens[] = {
+	{SOF_TKN_SCHED_DYNAMIC_PIPELINE, SND_SOC_TPLG_TUPLE_TYPE_BOOL, get_token_u16,
+		offsetof(struct snd_sof_widget, dynamic_pipeline_widget), 0},
+
+};
+
 /* volume */
 static const struct sof_topology_token volume_tokens[] = {
 	{SOF_TKN_VOLUME_RAMP_STEP_TYPE, SND_SOC_TPLG_TUPLE_TYPE_WORD,
@@ -1765,6 +1771,15 @@ static int sof_widget_load_pipeline(struct snd_soc_component *scomp, int index,
 		goto err;
 	}
 
+	ret = sof_parse_tokens(scomp, swidget, pipeline_tokens,
+			       ARRAY_SIZE(pipeline_tokens), private->array,
+			       le32_to_cpu(private->size));
+	if (ret != 0) {
+		dev_err(scomp->dev, "error: parse dynamic pipeline token failed %d\n",
+			private->size);
+		goto err;
+	}
+
 	dev_dbg(scomp->dev, "pipeline %s: period %d pri %d mips %d core %d frames %d\n",
 		swidget->widget->name, pipeline->period, pipeline->priority,
 		pipeline->period_mips, pipeline->core, pipeline->frames_per_sched);
@@ -3567,11 +3582,45 @@ int snd_sof_complete_pipeline(struct device *dev,
 	return 1;
 }
 
+/**
+ * sof_set_pipe_widget - Set pipe_widget for a component
+ * @sdev: pointer to struct snd_sof_dev
+ * @pipe_widget: pointer to struct snd_sof_widget of type snd_soc_dapm_scheduler
+ * @swidget: pointer to struct snd_sof_widget that has the same pipeline ID as @pipe_widget
+ *
+ * Return: 0 if successful, -EINVAL on error.
+ * The function checks if @swidget is associated with any volatile controls. If so, setting
+ * the dynamic_pipeline_widget is disallowed.
+ */
+static int sof_set_pipe_widget(struct snd_sof_dev *sdev, struct snd_sof_widget *pipe_widget,
+			       struct snd_sof_widget *swidget)
+{
+	struct snd_sof_control *scontrol;
+
+	if (pipe_widget->dynamic_pipeline_widget) {
+		/* dynamic widgets cannot have volatile kcontrols */
+		list_for_each_entry(scontrol, &sdev->kcontrol_list, list)
+			if (scontrol->comp_id == swidget->comp_id &&
+			    (scontrol->access & SNDRV_CTL_ELEM_ACCESS_VOLATILE)) {
+				dev_err(sdev->dev,
+					"error: volatile control found for dynamic widget %s\n",
+					swidget->widget->name);
+				return -EINVAL;
+			}
+	}
+
+	/* set the pipe_widget and apply the dynamic_pipeline_widget_flag */
+	swidget->pipe_widget = pipe_widget;
+	swidget->dynamic_pipeline_widget = pipe_widget->dynamic_pipeline_widget;
+
+	return 0;
+}
+
 /* completion - called at completion of firmware loading */
 static int sof_complete(struct snd_soc_component *scomp)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	struct snd_sof_widget *swidget;
+	struct snd_sof_widget *swidget, *comp_swidget;
 	int ret;
 
 	/* some widget types require completion notificattion */
@@ -3586,6 +3635,17 @@ static int sof_complete(struct snd_soc_component *scomp)
 				return ret;
 
 			swidget->complete = ret;
+
+			/*
+			 * Apply the dynamic_pipeline_widget flag and set the pipe_widget field
+			 * for all widgets that have the same pipeline ID as the scheduler widget
+			 */
+			list_for_each_entry_reverse(comp_swidget, &sdev->widget_list, list)
+				if (comp_swidget->pipeline_id == swidget->pipeline_id) {
+					ret = sof_set_pipe_widget(sdev, swidget, comp_swidget);
+					if (ret < 0)
+						return ret;
+				}
 			break;
 		default:
 			break;
-- 
2.33.0

