Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 075CF67E470
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 13:02:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E25FBEC5;
	Fri, 27 Jan 2023 13:01:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E25FBEC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674820966;
	bh=gIMwkMidUhA4Ii5fiqwjJHw3CbGLAGaZpvsrfz91oBE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ErmoxDQSwk2hI57wNJXnq3f4ms9st6dOnsHBLh1nSa2tp9Cls04+toFDqgNIljq1H
	 r6cqI4XPWddb5K9CCbbY5wymC+NN/BZwEhc0I/cHN3sm0F6547PdUJ+JfLHXNwgsGJ
	 IsQ4u2mH1pDumgo6OH//NMz/6pEXS8oRkRnFmXRE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 068D2F80558;
	Fri, 27 Jan 2023 13:00:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1B55F80549; Fri, 27 Jan 2023 13:00:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2AD1F804F3
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 13:00:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2AD1F804F3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jmWQgsub
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674820838; x=1706356838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gIMwkMidUhA4Ii5fiqwjJHw3CbGLAGaZpvsrfz91oBE=;
 b=jmWQgsub8axtekOFMFueI0rW5nYbOuj48zVYnjLg1D7UxkI7cNRv3vNy
 xIo1+4hTOKe+el68SILM+hM4UKGfXQwg/XcJOSlMfW8Rj/hFnZiTQTSxD
 4NB6AKN21XmxOwMa234dUpTIrJkrzwtATaybKwScDuo8cAP1Z3zAJTgCc
 0xGxyjoXAQFqkL3O5F3UvJHoWbbytD07hWcWfWosv9ZnaLvd6UnrmiqFG
 j558wWk8MGCSxeN0CSkaQxwEiEoIs8FEMwu/FUYTgYGw2Ts8HI3yYoFvy
 1ZQ9XHrM99N7N9OmszliOSJqLcM2PRMDf8YxiS3zF+bRxxc8+pVev0vWb w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="327091819"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="327091819"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:00:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="805782124"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="805782124"
Received: from aaralsto-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.30.130])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:00:34 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 04/18] ASoC: SOF: sof-audio: Only process widgets in the
 connected widget list
Date: Fri, 27 Jan 2023 14:00:17 +0200
Message-Id: <20230127120031.10709-5-peter.ujfalusi@linux.intel.com>
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

When walking the list of the widgets from the source to the sink, we
accidentally also end up preparing/setting up the widgets that are not
in the list of connected DAPM widgets associated with the PCM. Avoid
this by checking if a widget is part of the connected DAPM widget list
during widget prepare, unprepare, setup or free.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 51 +++++++++++++++++++++++++++------------
 1 file changed, 36 insertions(+), 15 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 572ac6a0c9ac..b127b304298c 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -241,24 +241,32 @@ static int sof_setup_pipeline_connections(struct snd_sof_dev *sdev,
 			if (!widget->dobj.private)
 				continue;
 
-			snd_soc_dapm_widget_for_each_sink_path(widget, p)
+			snd_soc_dapm_widget_for_each_sink_path(widget, p) {
+				if (!widget_in_list(list, p->sink))
+					continue;
+
 				if (p->sink->dobj.private) {
 					ret = sof_route_setup(sdev, widget, p->sink);
 					if (ret < 0)
 						return ret;
 				}
+			}
 		}
 	} else {
 		for_each_dapm_widgets(list, i, widget) {
 			if (!widget->dobj.private)
 				continue;
 
-			snd_soc_dapm_widget_for_each_source_path(widget, p)
+			snd_soc_dapm_widget_for_each_source_path(widget, p) {
+				if (!widget_in_list(list, p->source))
+					continue;
+
 				if (p->source->dobj.private) {
 					ret = sof_route_setup(sdev, p->source, widget);
 					if (ret < 0)
 						return ret;
 				}
+			}
 		}
 	}
 
@@ -266,7 +274,8 @@ static int sof_setup_pipeline_connections(struct snd_sof_dev *sdev,
 }
 
 static void
-sof_unprepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *widget)
+sof_unprepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *widget,
+			      struct snd_soc_dapm_widget_list *list)
 {
 	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 	struct snd_sof_widget *swidget = widget->dobj.private;
@@ -287,9 +296,11 @@ sof_unprepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widg
 sink_unprepare:
 	/* unprepare all widgets in the sink paths */
 	snd_soc_dapm_widget_for_each_sink_path(widget, p) {
+		if (!widget_in_list(list, p->sink))
+			continue;
 		if (!p->walking && p->sink->dobj.private) {
 			p->walking = true;
-			sof_unprepare_widgets_in_path(sdev, p->sink);
+			sof_unprepare_widgets_in_path(sdev, p->sink, list);
 			p->walking = false;
 		}
 	}
@@ -299,7 +310,8 @@ static int
 sof_prepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *widget,
 			    struct snd_pcm_hw_params *fe_params,
 			    struct snd_sof_platform_stream_params *platform_params,
-			    struct snd_pcm_hw_params *pipeline_params, int dir)
+			    struct snd_pcm_hw_params *pipeline_params, int dir,
+			    struct snd_soc_dapm_widget_list *list)
 {
 	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 	struct snd_sof_widget *swidget = widget->dobj.private;
@@ -327,10 +339,13 @@ sof_prepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget
 sink_prepare:
 	/* prepare all widgets in the sink paths */
 	snd_soc_dapm_widget_for_each_sink_path(widget, p) {
+		if (!widget_in_list(list, p->sink))
+			continue;
 		if (!p->walking && p->sink->dobj.private) {
 			p->walking = true;
 			ret = sof_prepare_widgets_in_path(sdev, p->sink,  fe_params,
-							  platform_params, pipeline_params, dir);
+							  platform_params, pipeline_params, dir,
+							  list);
 			p->walking = false;
 			if (ret < 0) {
 				/* unprepare the source widget */
@@ -352,7 +367,7 @@ sof_prepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget
  * (DAI type for capture, AIF type for playback)
  */
 static int sof_free_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *widget,
-				    int dir)
+				    int dir, struct snd_soc_dapm_widget_list *list)
 {
 	struct snd_soc_dapm_path *p;
 	int err;
@@ -367,9 +382,12 @@ static int sof_free_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dap
 	/* free all widgets in the sink paths even in case of error to keep use counts balanced */
 	snd_soc_dapm_widget_for_each_sink_path(widget, p) {
 		if (!p->walking) {
+			if (!widget_in_list(list, p->sink))
+				continue;
+
 			p->walking = true;
 
-			err = sof_free_widgets_in_path(sdev, p->sink, dir);
+			err = sof_free_widgets_in_path(sdev, p->sink, dir, list);
 			if (err < 0)
 				ret = err;
 			p->walking = false;
@@ -385,7 +403,7 @@ static int sof_free_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dap
  * The error path in this function ensures that all successfully set up widgets getting freed.
  */
 static int sof_set_up_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *widget,
-				      int dir)
+				      int dir, struct snd_soc_dapm_widget_list *list)
 {
 	struct snd_soc_dapm_path *p;
 	int ret;
@@ -398,9 +416,12 @@ static int sof_set_up_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_d
 
 	snd_soc_dapm_widget_for_each_sink_path(widget, p) {
 		if (!p->walking) {
+			if (!widget_in_list(list, p->sink))
+				continue;
+
 			p->walking = true;
 
-			ret = sof_set_up_widgets_in_path(sdev, p->sink, dir);
+			ret = sof_set_up_widgets_in_path(sdev, p->sink, dir, list);
 			p->walking = false;
 			if (ret < 0) {
 				if (widget->dobj.private)
@@ -435,11 +456,11 @@ sof_walk_widgets_in_order(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget_l
 
 		switch (op) {
 		case SOF_WIDGET_SETUP:
-			ret = sof_set_up_widgets_in_path(sdev, widget, dir);
+			ret = sof_set_up_widgets_in_path(sdev, widget, dir, list);
 			str = "set up";
 			break;
 		case SOF_WIDGET_FREE:
-			ret = sof_free_widgets_in_path(sdev, widget, dir);
+			ret = sof_free_widgets_in_path(sdev, widget, dir, list);
 			str = "free";
 			break;
 		case SOF_WIDGET_PREPARE:
@@ -455,12 +476,12 @@ sof_walk_widgets_in_order(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget_l
 			 */
 			memcpy(&pipeline_params, fe_params, sizeof(*fe_params));
 
-			ret = sof_prepare_widgets_in_path(sdev, widget, fe_params,
-							  platform_params, &pipeline_params, dir);
+			ret = sof_prepare_widgets_in_path(sdev, widget, fe_params, platform_params,
+							  &pipeline_params, dir, list);
 			break;
 		}
 		case SOF_WIDGET_UNPREPARE:
-			sof_unprepare_widgets_in_path(sdev, widget);
+			sof_unprepare_widgets_in_path(sdev, widget, list);
 			break;
 		default:
 			dev_err(sdev->dev, "Invalid widget op %d\n", op);
-- 
2.39.1

