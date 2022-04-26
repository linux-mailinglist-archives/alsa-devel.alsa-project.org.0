Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AFE510554
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 19:23:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1455518FD;
	Tue, 26 Apr 2022 19:22:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1455518FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650993809;
	bh=tCQF6BtXsLk7t2YAzV8fkHRBA6ZGDebJG3rbzBRP/ss=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BkWYss/AT9UEI+GXIOUokkXM/yfCdHPx8ctVpc2amGmNqba2XeDBv3KhTOvsISjdq
	 O/bcpyTUZeYcgy7iNqIBjMZvVKn0brcLibg9tTPynVFwBz552yBo3BLKcHn933KJoj
	 btU4lxD6ywcSIbLhiptPpVQbSJYHlhhh2d008TgY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD79DF805BB;
	Tue, 26 Apr 2022 19:18:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4A61F8053D; Tue, 26 Apr 2022 19:18:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2B95F80533
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 19:18:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2B95F80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hbOpVV8n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650993483; x=1682529483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tCQF6BtXsLk7t2YAzV8fkHRBA6ZGDebJG3rbzBRP/ss=;
 b=hbOpVV8nKRZEEiEjifPQvJdN+V3m7Gm2FZek7ahANX3bE358C24gGNYH
 ElRBi7PfIX6lAUufyiCANyvCsevcI09i3BKObfcShu6MiIu4nefl13BT5
 Xn9YzEoFQmaRqw5fBkiMDXRBy8Bhjy0bJZTagztqOOG8sW2LcYtmVuzU2
 lrXtAiGU9vsHHrrjdqbHSPTKgn/nboQLZWbnhS7yxw/l9G9cvNQ41n0pS
 ZdQUky+OfjITylwQZYvSy1wURr3LZvowDRj2rleOaRMTGK8/gUx8tS1Q1
 AVpcvBOZyZYc4LTgqaZcGt8jvzUYERf14fspKWSquIFjv3zmn3gYsnpLn A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="290807983"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="290807983"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 10:17:52 -0700
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="558431225"
Received: from shashinx-mobl.gar.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.0.53])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 10:17:51 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/11] ASoC: SOF: Add a prepare op to IPC topology widget ops
Date: Tue, 26 Apr 2022 10:17:43 -0700
Message-Id: <20220426171743.171061-12-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426171743.171061-1-ranjani.sridharan@linux.intel.com>
References: <20220426171743.171061-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

In order to set up a pipeline with IPC4, the total memory usage for the
pipeline needs to be calculated based on the list of connected widgets.
Add a new ipc_prepare() op to struct sof_ipc_tplg_widget_ops that will be
used to calculate the memory usage for each widget in the pipelines
associated with a PCM and prepare the widget for getting set up in the
DSP. The prepare step will be used to allocate memory for the IPC
payload, assign instance ID and update the config data for the widget
based on the runtime PCM params. Once prepared, the setup step is used
to send the IPC to create the widget in the DSP.

Add an ipc_unprepare() op to unprepare the widget i.e free the memory
allocated during prepare, free the instance ID etc. This should be
invoked after the widget is freed.

A new flag "prepared" is added to struct snd_sof_widget to track the
prepared status of widgets.

Also, IPC4 requires the platform_params and the runtime PCM params in
order to prepare a widget for set up. So modify the signature of
sof_pcm_setup_connected_widgets() and sof_widget_list_setup() to accept
these as arguments.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/pcm.c       |   8 ++-
 sound/soc/sof/sof-audio.c | 139 +++++++++++++++++++++++++++++++++++---
 sound/soc/sof/sof-audio.h |  21 +++++-
 3 files changed, 154 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 095ca0d9d5ae..a76d0b5b2ad9 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -84,7 +84,8 @@ EXPORT_SYMBOL(snd_sof_pcm_period_elapsed);
 
 static int
 sof_pcm_setup_connected_widgets(struct snd_sof_dev *sdev, struct snd_soc_pcm_runtime *rtd,
-				struct snd_sof_pcm *spcm, int dir)
+				struct snd_sof_pcm *spcm, struct snd_pcm_hw_params *params,
+				struct snd_sof_platform_stream_params *platform_params, int dir)
 {
 	struct snd_soc_dai *dai;
 	int ret, j;
@@ -103,7 +104,7 @@ sof_pcm_setup_connected_widgets(struct snd_sof_dev *sdev, struct snd_soc_pcm_run
 
 		spcm->stream[dir].list = list;
 
-		ret = sof_widget_list_setup(sdev, spcm, dir);
+		ret = sof_widget_list_setup(sdev, spcm, params, platform_params, dir);
 		if (ret < 0) {
 			dev_err(sdev->dev, "error: failed widget list set up for pcm %d dir %d\n",
 				spcm->pcm.pcm_id, dir);
@@ -159,7 +160,8 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 
 	/* if this is a repeated hw_params without hw_free, skip setting up widgets */
 	if (!spcm->stream[substream->stream].list) {
-		ret = sof_pcm_setup_connected_widgets(sdev, rtd, spcm, substream->stream);
+		ret = sof_pcm_setup_connected_widgets(sdev, rtd, spcm, params, &platform_params,
+						      substream->stream);
 		if (ret < 0)
 			return ret;
 	}
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index f7c9e5db3d9e..26a62b3b3c37 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -257,6 +257,79 @@ static int sof_setup_pipeline_connections(struct snd_sof_dev *sdev,
 	return 0;
 }
 
+static void
+sof_unprepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *widget)
+{
+	const struct sof_ipc_tplg_ops *ipc_tplg_ops = sdev->ipc->ops->tplg;
+	const struct sof_ipc_tplg_widget_ops *widget_ops = ipc_tplg_ops->widget;
+	struct snd_sof_widget *swidget = widget->dobj.private;
+	struct snd_soc_dapm_path *p;
+
+	if (!widget_ops[widget->id].ipc_unprepare || !swidget->prepared)
+		goto sink_unprepare;
+
+	/* unprepare the source widget */
+	widget_ops[widget->id].ipc_unprepare(swidget);
+	swidget->prepared = false;
+
+sink_unprepare:
+	/* unprepare all widgets in the sink paths */
+	snd_soc_dapm_widget_for_each_sink_path(widget, p) {
+		if (!p->walking && p->sink->dobj.private) {
+			p->walking = true;
+			sof_unprepare_widgets_in_path(sdev, p->sink);
+			p->walking = false;
+		}
+	}
+}
+
+static int
+sof_prepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *widget,
+			    struct snd_pcm_hw_params *fe_params,
+			    struct snd_sof_platform_stream_params *platform_params,
+			    struct snd_pcm_hw_params *pipeline_params, int dir)
+{
+	const struct sof_ipc_tplg_ops *ipc_tplg_ops = sdev->ipc->ops->tplg;
+	const struct sof_ipc_tplg_widget_ops *widget_ops = ipc_tplg_ops->widget;
+	struct snd_sof_widget *swidget = widget->dobj.private;
+	struct snd_soc_dapm_path *p;
+	int ret;
+
+	if (!widget_ops[widget->id].ipc_prepare || swidget->prepared)
+		goto sink_prepare;
+
+	/* prepare the source widget */
+	ret = widget_ops[widget->id].ipc_prepare(swidget, fe_params, platform_params,
+					     pipeline_params, dir);
+	if (ret < 0) {
+		dev_err(sdev->dev, "failed to prepare widget %s\n", widget->name);
+		return ret;
+	}
+
+	swidget->prepared = true;
+
+sink_prepare:
+	/* prepare all widgets in the sink paths */
+	snd_soc_dapm_widget_for_each_sink_path(widget, p) {
+		if (!p->walking && p->sink->dobj.private) {
+			p->walking = true;
+			ret = sof_prepare_widgets_in_path(sdev, p->sink,  fe_params,
+							  platform_params, pipeline_params, dir);
+			p->walking = false;
+			if (ret < 0) {
+				/* unprepare the source widget */
+				if (!widget_ops[widget->id].ipc_unprepare && swidget->prepared) {
+					widget_ops[widget->id].ipc_unprepare(swidget);
+					swidget->prepared = false;
+				}
+				return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
 /*
  * free all widgets in the sink path starting from the source widget
  * (DAI type for capture, AIF type for playback)
@@ -336,11 +409,15 @@ static int sof_set_up_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_d
 }
 
 static int
-sof_setup_or_free_widgets_in_order(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget_list *list,
-				   bool dir, enum sof_widget_op op)
+sof_walk_widgets_in_order(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget_list *list,
+			  struct snd_pcm_hw_params *fe_params,
+			  struct snd_sof_platform_stream_params *platform_params, int dir,
+			  enum sof_widget_op op)
 {
 	struct snd_soc_dapm_widget *widget;
-	int ret, i;
+	char *str;
+	int ret = 0;
+	int i;
 
 	for_each_dapm_widgets(list, i, widget) {
 		/* starting widget for playback is AIF type */
@@ -354,17 +431,38 @@ sof_setup_or_free_widgets_in_order(struct snd_sof_dev *sdev, struct snd_soc_dapm
 		switch (op) {
 		case SOF_WIDGET_SETUP:
 			ret = sof_set_up_widgets_in_path(sdev, widget, dir);
+			str = "set up";
 			break;
 		case SOF_WIDGET_FREE:
 			ret = sof_free_widgets_in_path(sdev, widget, dir);
+			str = "free";
+			break;
+		case SOF_WIDGET_PREPARE:
+		{
+			struct snd_pcm_hw_params pipeline_params;
+
+			str = "prepare";
+			/*
+			 * When walking the list of connected widgets, the pipeline_params for each
+			 * widget is modified by the source widget in the path. Use a local
+			 * copy of the runtime params as the pipeline_params so that the runtime
+			 * params does not get overwritten.
+			 */
+			memcpy(&pipeline_params, fe_params, sizeof(*fe_params));
+
+			ret = sof_prepare_widgets_in_path(sdev, widget, fe_params,
+							  platform_params, &pipeline_params, dir);
+			break;
+		}
+		case SOF_WIDGET_UNPREPARE:
+			sof_unprepare_widgets_in_path(sdev, widget);
 			break;
 		default:
 			dev_err(sdev->dev, "Invalid widget op %d\n", op);
 			return -EINVAL;
 		}
 		if (ret < 0) {
-			dev_err(sdev->dev, "Failed to %s connected widgets\n",
-				op == SOF_WIDGET_SETUP ? "set up" : "free");
+			dev_err(sdev->dev, "Failed to %s connected widgets\n", str);
 			return ret;
 		}
 	}
@@ -372,7 +470,10 @@ sof_setup_or_free_widgets_in_order(struct snd_sof_dev *sdev, struct snd_soc_dapm
 	return 0;
 }
 
-int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, int dir)
+int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm,
+			  struct snd_pcm_hw_params *fe_params,
+			  struct snd_sof_platform_stream_params *platform_params,
+			  int dir)
 {
 	const struct sof_ipc_tplg_ops *ipc_tplg_ops = sdev->ipc->ops->tplg;
 	struct snd_soc_dapm_widget_list *list = spcm->stream[dir].list;
@@ -383,10 +484,24 @@ int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, in
 	if (!list)
 		return 0;
 
-	ret = sof_setup_or_free_widgets_in_order(sdev, list, dir, SOF_WIDGET_SETUP);
+	/*
+	 * Prepare widgets for set up. The prepare step is used to allocate memory, assign
+	 * instance ID and pick the widget configuration based on the runtime PCM params.
+	 */
+	ret = sof_walk_widgets_in_order(sdev, list, fe_params, platform_params,
+					dir, SOF_WIDGET_PREPARE);
 	if (ret < 0)
 		return ret;
 
+	/* Set up is used to send the IPC to the DSP to create the widget */
+	ret = sof_walk_widgets_in_order(sdev, list, fe_params, platform_params,
+					dir, SOF_WIDGET_SETUP);
+	if (ret < 0) {
+		ret = sof_walk_widgets_in_order(sdev, list, fe_params, platform_params,
+						dir, SOF_WIDGET_UNPREPARE);
+		return ret;
+	}
+
 	/*
 	 * error in setting pipeline connections will result in route status being reset for
 	 * routes that were successfully set up when the widgets are freed.
@@ -426,7 +541,9 @@ int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, in
 	return 0;
 
 widget_free:
-	sof_setup_or_free_widgets_in_order(sdev, list, dir, SOF_WIDGET_FREE);
+	sof_walk_widgets_in_order(sdev, list, fe_params, platform_params, dir,
+				  SOF_WIDGET_FREE);
+	sof_walk_widgets_in_order(sdev, list, NULL, NULL, dir, SOF_WIDGET_UNPREPARE);
 
 	return ret;
 }
@@ -440,7 +557,11 @@ int sof_widget_list_free(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, int
 	if (!list)
 		return 0;
 
-	ret = sof_setup_or_free_widgets_in_order(sdev, list, dir, SOF_WIDGET_FREE);
+	/* send IPC to free widget in the DSP */
+	ret = sof_walk_widgets_in_order(sdev, list, NULL, NULL, dir, SOF_WIDGET_FREE);
+
+	/* unprepare the widget */
+	sof_walk_widgets_in_order(sdev, list, NULL, NULL, dir, SOF_WIDGET_UNPREPARE);
 
 	snd_soc_dapm_dai_free_widgets(&list);
 	spcm->stream[dir].list = NULL;
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 2db4eb5edcf5..195248d11aaa 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -36,8 +36,10 @@
 #define SOF_DAI_CLK_INTEL_SSP_BCLK	1
 
 enum sof_widget_op {
-	SOF_WIDGET_FREE,
+	SOF_WIDGET_PREPARE,
 	SOF_WIDGET_SETUP,
+	SOF_WIDGET_FREE,
+	SOF_WIDGET_UNPREPARE,
 };
 
 /*
@@ -129,6 +131,8 @@ struct sof_ipc_tplg_control_ops {
  * @token_list: List of token ID's that should be parsed for the widget
  * @token_list_size: number of elements in token_list
  * @bind_event: Function pointer for binding events to the widget
+ * @ipc_prepare: Optional op for preparing a widget for set up
+ * @ipc_unprepare: Optional op for unpreparing a widget
  */
 struct sof_ipc_tplg_widget_ops {
 	int (*ipc_setup)(struct snd_sof_widget *swidget);
@@ -137,6 +141,11 @@ struct sof_ipc_tplg_widget_ops {
 	int token_list_size;
 	int (*bind_event)(struct snd_soc_component *scomp, struct snd_sof_widget *swidget,
 			  u16 event_type);
+	int (*ipc_prepare)(struct snd_sof_widget *swidget,
+			   struct snd_pcm_hw_params *fe_params,
+			   struct snd_sof_platform_stream_params *platform_params,
+			   struct snd_pcm_hw_params *source_params, int dir);
+	void (*ipc_unprepare)(struct snd_sof_widget *swidget);
 };
 
 /**
@@ -332,6 +341,11 @@ struct snd_sof_widget {
 	 * widgets. It is unused for all other widget types.
 	 */
 	int complete;
+	/*
+	 * the prepared flag is used to indicate that a widget has been prepared for getting set
+	 * up in the DSP.
+	 */
+	bool prepared;
 	int use_count; /* use_count will be protected by the PCM mutex held by the core */
 	int core;
 	int id; /* id is the DAPM widget type */
@@ -492,7 +506,10 @@ int sof_route_setup(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *wsourc
 		    struct snd_soc_dapm_widget *wsink);
 
 /* PCM */
-int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, int dir);
+int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm,
+			  struct snd_pcm_hw_params *fe_params,
+			  struct snd_sof_platform_stream_params *platform_params,
+			  int dir);
 int sof_widget_list_free(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, int dir);
 int sof_pcm_dsp_pcm_free(struct snd_pcm_substream *substream, struct snd_sof_dev *sdev,
 			 struct snd_sof_pcm *spcm);
-- 
2.25.1

