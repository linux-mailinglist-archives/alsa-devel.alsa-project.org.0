Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B56F567E485
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 13:04:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33569EBB;
	Fri, 27 Jan 2023 13:03:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33569EBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674821067;
	bh=w9n5zT80vCbdVvQ5MJ7or2NBoNtNjWK0nKVW2cFHFYE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kYwJrAkV8Nr3UP4IGiE5LIv3AzUtFG/CAeGyPpvYWlCSs9YPkHqb1uT8F8hcFmA4e
	 8Joaz/U0vnIxXWlRbQsnOQ/qlSVAGwAKejOhLQxfaKV5hatQuxQxd+kYVw7ZXnZWXP
	 calI9hdxzTf7LPaJZmKGkIuI1YlEdAd7n7yXJtpY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D044F805AA;
	Fri, 27 Jan 2023 13:01:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90B84F8056F; Fri, 27 Jan 2023 13:00:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA081F80563
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 13:00:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA081F80563
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BXP40Fn0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674820854; x=1706356854;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w9n5zT80vCbdVvQ5MJ7or2NBoNtNjWK0nKVW2cFHFYE=;
 b=BXP40Fn0GF3QnIeaBQ6x5ktBbTKRNmmBhYVN8WhAdEZ/agw3DiY2+Z1J
 6HqJxKYyxcwVYkv28CqO1hOSoUN2MbBT81J9R7KyWKdsFgdObHkRVVLkK
 esQT08I5RI31O8vEg2VyJc/xpTWoTypoiQHk7dJjZQFzdiT49sXklk6ar
 DvH/k7peuDJMy73hlIvri8dNMIK7449YM4GIGC1nwuio45pnTQtjlq466
 vKXkyFvjaG4yYhIyvzOwgYqKqaypM0twqVcd01Jc3hWgETiNBmU2335vv
 1QUUO37Z0RFrjRRgTxVtW8s/Sdps/uhMs3X/e/dp6d6wfJzntD3kA2edE g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="327091883"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="327091883"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:00:51 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="805782215"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="805782215"
Received: from aaralsto-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.30.130])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:00:49 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 10/18] ASoC: SOF: sof-audio: Populate the PCM stream
 pipeline_info
Date: Fri, 27 Jan 2023 14:00:23 +0200
Message-Id: <20230127120031.10709-11-peter.ujfalusi@linux.intel.com>
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

Populate the pipeline_info for the PCM stream with the list of pipeline
widgets that need to be handled during the PCM trigger. This will be
used in the IPC-specific PCM trigger op to trigger the pipelines.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Libin Yang <libin.yang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 69 +++++++++++++++++++++++++++++----------
 1 file changed, 52 insertions(+), 17 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index b127b304298c..e6796c59e04b 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -367,8 +367,9 @@ sof_prepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget
  * (DAI type for capture, AIF type for playback)
  */
 static int sof_free_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *widget,
-				    int dir, struct snd_soc_dapm_widget_list *list)
+				    int dir, struct snd_sof_pcm *spcm)
 {
+	struct snd_soc_dapm_widget_list *list = spcm->stream[dir].list;
 	struct snd_soc_dapm_path *p;
 	int err;
 	int ret = 0;
@@ -387,7 +388,7 @@ static int sof_free_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dap
 
 			p->walking = true;
 
-			err = sof_free_widgets_in_path(sdev, p->sink, dir, list);
+			err = sof_free_widgets_in_path(sdev, p->sink, dir, spcm);
 			if (err < 0)
 				ret = err;
 			p->walking = false;
@@ -403,17 +404,44 @@ static int sof_free_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dap
  * The error path in this function ensures that all successfully set up widgets getting freed.
  */
 static int sof_set_up_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *widget,
-				      int dir, struct snd_soc_dapm_widget_list *list)
+				      int dir, struct snd_sof_pcm *spcm)
 {
+	struct snd_sof_pcm_stream_pipeline_list *pipeline_list = &spcm->stream[dir].pipeline_list;
+	struct snd_soc_dapm_widget_list *list = spcm->stream[dir].list;
+	struct snd_sof_widget *swidget = widget->dobj.private;
+	struct snd_sof_widget *pipe_widget;
 	struct snd_soc_dapm_path *p;
 	int ret;
 
-	if (widget->dobj.private) {
+	if (swidget) {
+		int i;
+
 		ret = sof_widget_setup(sdev, widget->dobj.private);
 		if (ret < 0)
 			return ret;
+
+		/* skip populating the pipe_widgets array if it is NULL */
+		if (!pipeline_list->pipe_widgets)
+			goto sink_setup;
+
+		/*
+		 * Add the widget's pipe_widget to the list of pipelines to be triggered if not
+		 * already in the list. This will result in the pipelines getting added in the
+		 * order source to sink.
+		 */
+		for (i = 0; i < pipeline_list->count; i++) {
+			pipe_widget = pipeline_list->pipe_widgets[i];
+			if (pipe_widget == swidget->pipe_widget)
+				break;
+		}
+
+		if (i == pipeline_list->count) {
+			pipeline_list->count++;
+			pipeline_list->pipe_widgets[i] = swidget->pipe_widget;
+		}
 	}
 
+sink_setup:
 	snd_soc_dapm_widget_for_each_sink_path(widget, p) {
 		if (!p->walking) {
 			if (!widget_in_list(list, p->sink))
@@ -421,11 +449,11 @@ static int sof_set_up_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_d
 
 			p->walking = true;
 
-			ret = sof_set_up_widgets_in_path(sdev, p->sink, dir, list);
+			ret = sof_set_up_widgets_in_path(sdev, p->sink, dir, spcm);
 			p->walking = false;
 			if (ret < 0) {
-				if (widget->dobj.private)
-					sof_widget_free(sdev, widget->dobj.private);
+				if (swidget)
+					sof_widget_free(sdev, swidget);
 				return ret;
 			}
 		}
@@ -435,16 +463,20 @@ static int sof_set_up_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_d
 }
 
 static int
-sof_walk_widgets_in_order(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget_list *list,
+sof_walk_widgets_in_order(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm,
 			  struct snd_pcm_hw_params *fe_params,
 			  struct snd_sof_platform_stream_params *platform_params, int dir,
 			  enum sof_widget_op op)
 {
+	struct snd_soc_dapm_widget_list *list = spcm->stream[dir].list;
 	struct snd_soc_dapm_widget *widget;
 	char *str;
 	int ret = 0;
 	int i;
 
+	if (!list)
+		return 0;
+
 	for_each_dapm_widgets(list, i, widget) {
 		/* starting widget for playback is AIF type */
 		if (dir == SNDRV_PCM_STREAM_PLAYBACK && widget->id != snd_soc_dapm_aif_in)
@@ -456,11 +488,11 @@ sof_walk_widgets_in_order(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget_l
 
 		switch (op) {
 		case SOF_WIDGET_SETUP:
-			ret = sof_set_up_widgets_in_path(sdev, widget, dir, list);
+			ret = sof_set_up_widgets_in_path(sdev, widget, dir, spcm);
 			str = "set up";
 			break;
 		case SOF_WIDGET_FREE:
-			ret = sof_free_widgets_in_path(sdev, widget, dir, list);
+			ret = sof_free_widgets_in_path(sdev, widget, dir, spcm);
 			str = "free";
 			break;
 		case SOF_WIDGET_PREPARE:
@@ -514,16 +546,16 @@ int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm,
 	 * Prepare widgets for set up. The prepare step is used to allocate memory, assign
 	 * instance ID and pick the widget configuration based on the runtime PCM params.
 	 */
-	ret = sof_walk_widgets_in_order(sdev, list, fe_params, platform_params,
+	ret = sof_walk_widgets_in_order(sdev, spcm, fe_params, platform_params,
 					dir, SOF_WIDGET_PREPARE);
 	if (ret < 0)
 		return ret;
 
 	/* Set up is used to send the IPC to the DSP to create the widget */
-	ret = sof_walk_widgets_in_order(sdev, list, fe_params, platform_params,
+	ret = sof_walk_widgets_in_order(sdev, spcm, fe_params, platform_params,
 					dir, SOF_WIDGET_SETUP);
 	if (ret < 0) {
-		ret = sof_walk_widgets_in_order(sdev, list, fe_params, platform_params,
+		ret = sof_walk_widgets_in_order(sdev, spcm, fe_params, platform_params,
 						dir, SOF_WIDGET_UNPREPARE);
 		return ret;
 	}
@@ -567,15 +599,16 @@ int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm,
 	return 0;
 
 widget_free:
-	sof_walk_widgets_in_order(sdev, list, fe_params, platform_params, dir,
+	sof_walk_widgets_in_order(sdev, spcm, fe_params, platform_params, dir,
 				  SOF_WIDGET_FREE);
-	sof_walk_widgets_in_order(sdev, list, NULL, NULL, dir, SOF_WIDGET_UNPREPARE);
+	sof_walk_widgets_in_order(sdev, spcm, NULL, NULL, dir, SOF_WIDGET_UNPREPARE);
 
 	return ret;
 }
 
 int sof_widget_list_free(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, int dir)
 {
+	struct snd_sof_pcm_stream_pipeline_list *pipeline_list = &spcm->stream[dir].pipeline_list;
 	struct snd_soc_dapm_widget_list *list = spcm->stream[dir].list;
 	int ret;
 
@@ -584,14 +617,16 @@ int sof_widget_list_free(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, int
 		return 0;
 
 	/* send IPC to free widget in the DSP */
-	ret = sof_walk_widgets_in_order(sdev, list, NULL, NULL, dir, SOF_WIDGET_FREE);
+	ret = sof_walk_widgets_in_order(sdev, spcm, NULL, NULL, dir, SOF_WIDGET_FREE);
 
 	/* unprepare the widget */
-	sof_walk_widgets_in_order(sdev, list, NULL, NULL, dir, SOF_WIDGET_UNPREPARE);
+	sof_walk_widgets_in_order(sdev, spcm, NULL, NULL, dir, SOF_WIDGET_UNPREPARE);
 
 	snd_soc_dapm_dai_free_widgets(&list);
 	spcm->stream[dir].list = NULL;
 
+	pipeline_list->count = 0;
+
 	return ret;
 }
 
-- 
2.39.1

