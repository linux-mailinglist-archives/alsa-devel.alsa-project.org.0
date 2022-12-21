Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5628D652F6E
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Dec 2022 11:26:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4E6116AA;
	Wed, 21 Dec 2022 11:25:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4E6116AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671618402;
	bh=ne1mU1q5e1SXuBOzAP3jYBXRpyIT4ZVsc/s4oryunLg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IPyz/LKrbYSpANELF41+64rnMidWMzSTMpQVrQbp9Or2JS2Y1K4pAxPtypEuaFM/a
	 nBVWdhR/Cp5YkCEs8zRJLfVRgdalowiHsSh7dBULvvkQcWKwkinMgdTzsm3vXwefCg
	 erddp98bl1AW7N+PG8P/EYYD2sSy/yUZE+wIEO14=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B4A0F80553;
	Wed, 21 Dec 2022 11:24:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14C7FF804AD; Wed, 21 Dec 2022 11:23:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B823F8024D
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 11:23:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B823F8024D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HgSbJIG6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671618220; x=1703154220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ne1mU1q5e1SXuBOzAP3jYBXRpyIT4ZVsc/s4oryunLg=;
 b=HgSbJIG6Y2Ex3wZdVtecOGZvS/zukZuX3KOHZNsLJpPS3HdklFWSzjPY
 AbgDN+qgNvp0rVWyO0A0s6cRzQYtkXxDUyVHojTVgI4GLwfZCW34KgU2K
 6f7VypHxQDz1XFudunjsWg1luZW6wTJJpSzkS2B/9X90KaY46QCQWhmuo
 8fau6e2RURQXBojve7+WqN55/lNhCf5IMbbBspnPHAGzW2mLjKWTPzWu+
 TAtpylgTzEYskZYXl+mRXSACUn5ZKOs3Ga+Ca2HP78nsMjQi8dVOXipxN
 rHwBKhrUBlTlF0n9adacf/H7yX7PuAFMwKAFGYn1Dl01Hez2cz5GsPhBa w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="406078648"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="406078648"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 02:23:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="681984321"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="681984321"
Received: from cofearra-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.20.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 02:23:35 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 06/11] ASoC: SOF: sof-audio: Extend the optionality of IPC ops
 to IPC as well
Date: Wed, 21 Dec 2022 12:23:23 +0200
Message-Id: <20221221102328.9635-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221102328.9635-1-peter.ujfalusi@linux.intel.com>
References: <20221221102328.9635-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
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

The IPC ops are optional, but they require that the ops struct is to be
allocated with all callbacks set to NULL.

Update the code to extend the optionality to:
sdev->ipc == NULL
sdev->ipc->ops == NULL
sdev->ipc->ops->[ops_group] == NULL
sdev->ipc->ops->[pcmops_group]->ops == NULL (treated optional currently)

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/sof-audio.c | 51 +++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 23 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 2c7d942427c1..e1ab8380e7d8 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -16,12 +16,12 @@
 
 static void sof_reset_route_setup_status(struct snd_sof_dev *sdev, struct snd_sof_widget *widget)
 {
-	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 	struct snd_sof_route *sroute;
 
 	list_for_each_entry(sroute, &sdev->route_list, list)
 		if (sroute->src_widget == widget || sroute->sink_widget == widget) {
-			if (sroute->setup && tplg_ops->route_free)
+			if (sroute->setup && tplg_ops && tplg_ops->route_free)
 				tplg_ops->route_free(sdev, sroute);
 
 			sroute->setup = false;
@@ -30,7 +30,7 @@ static void sof_reset_route_setup_status(struct snd_sof_dev *sdev, struct snd_so
 
 int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 {
-	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 	int err = 0;
 	int ret;
 
@@ -47,7 +47,7 @@ int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	sof_reset_route_setup_status(sdev, swidget);
 
 	/* continue to disable core even if IPC fails */
-	if (tplg_ops->widget_free)
+	if (tplg_ops && tplg_ops->widget_free)
 		err = tplg_ops->widget_free(sdev, swidget);
 
 	/*
@@ -82,7 +82,7 @@ EXPORT_SYMBOL(sof_widget_free);
 
 int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 {
-	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 	int ret;
 
 	/* skip if there is no private data */
@@ -124,7 +124,7 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	}
 
 	/* setup widget in the DSP */
-	if (tplg_ops->widget_setup) {
+	if (tplg_ops && tplg_ops->widget_setup) {
 		ret = tplg_ops->widget_setup(sdev, swidget);
 		if (ret < 0)
 			goto core_put;
@@ -134,7 +134,7 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	if (WIDGET_IS_DAI(swidget->id)) {
 		unsigned int flags = SOF_DAI_CONFIG_FLAGS_NONE;
 
-		if (tplg_ops->dai_config) {
+		if (tplg_ops && tplg_ops->dai_config) {
 			ret = tplg_ops->dai_config(sdev, swidget, flags, NULL);
 			if (ret < 0)
 				goto widget_free;
@@ -142,7 +142,7 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	}
 
 	/* restore kcontrols for widget */
-	if (tplg_ops->control->widget_kcontrol_setup) {
+	if (tplg_ops && tplg_ops->control && tplg_ops->control->widget_kcontrol_setup) {
 		ret = tplg_ops->control->widget_kcontrol_setup(sdev, swidget);
 		if (ret < 0)
 			goto widget_free;
@@ -169,7 +169,7 @@ EXPORT_SYMBOL(sof_widget_setup);
 int sof_route_setup(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *wsource,
 		    struct snd_soc_dapm_widget *wsink)
 {
-	const struct sof_ipc_tplg_ops *ipc_tplg_ops = sdev->ipc->ops->tplg;
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 	struct snd_sof_widget *src_widget = wsource->dobj.private;
 	struct snd_sof_widget *sink_widget = wsink->dobj.private;
 	struct snd_sof_route *sroute;
@@ -211,8 +211,8 @@ int sof_route_setup(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *wsourc
 	if (sroute->setup)
 		return 0;
 
-	if (ipc_tplg_ops->route_setup) {
-		int ret = ipc_tplg_ops->route_setup(sdev, sroute);
+	if (tplg_ops && tplg_ops->route_setup) {
+		int ret = tplg_ops->route_setup(sdev, sroute);
 
 		if (ret < 0)
 			return ret;
@@ -268,16 +268,17 @@ static int sof_setup_pipeline_connections(struct snd_sof_dev *sdev,
 static void
 sof_unprepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *widget)
 {
-	const struct sof_ipc_tplg_ops *ipc_tplg_ops = sdev->ipc->ops->tplg;
-	const struct sof_ipc_tplg_widget_ops *widget_ops = ipc_tplg_ops->widget;
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 	struct snd_sof_widget *swidget = widget->dobj.private;
+	const struct sof_ipc_tplg_widget_ops *widget_ops;
 	struct snd_soc_dapm_path *p;
 
 	/* return if the widget is in use or if it is already unprepared */
 	if (!swidget->prepared || swidget->use_count > 1)
 		return;
 
-	if (widget_ops[widget->id].ipc_unprepare)
+	widget_ops = tplg_ops ? tplg_ops->widget : NULL;
+	if (widget_ops && widget_ops[widget->id].ipc_unprepare)
 		/* unprepare the source widget */
 		widget_ops[widget->id].ipc_unprepare(swidget);
 
@@ -299,12 +300,16 @@ sof_prepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget
 			    struct snd_sof_platform_stream_params *platform_params,
 			    struct snd_pcm_hw_params *pipeline_params, int dir)
 {
-	const struct sof_ipc_tplg_ops *ipc_tplg_ops = sdev->ipc->ops->tplg;
-	const struct sof_ipc_tplg_widget_ops *widget_ops = ipc_tplg_ops->widget;
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 	struct snd_sof_widget *swidget = widget->dobj.private;
+	const struct sof_ipc_tplg_widget_ops *widget_ops;
 	struct snd_soc_dapm_path *p;
 	int ret;
 
+	widget_ops = tplg_ops ? tplg_ops->widget : NULL;
+	if (!widget_ops)
+		return 0;
+
 	if (!widget_ops[widget->id].ipc_prepare || swidget->prepared)
 		goto sink_prepare;
 
@@ -485,7 +490,7 @@ int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm,
 			  struct snd_sof_platform_stream_params *platform_params,
 			  int dir)
 {
-	const struct sof_ipc_tplg_ops *ipc_tplg_ops = sdev->ipc->ops->tplg;
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 	struct snd_soc_dapm_widget_list *list = spcm->stream[dir].list;
 	struct snd_soc_dapm_widget *widget;
 	int i, ret;
@@ -539,8 +544,8 @@ int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm,
 		if (pipe_widget->complete)
 			continue;
 
-		if (ipc_tplg_ops->pipeline_complete) {
-			pipe_widget->complete = ipc_tplg_ops->pipeline_complete(sdev, pipe_widget);
+		if (tplg_ops && tplg_ops->pipeline_complete) {
+			pipe_widget->complete = tplg_ops->pipeline_complete(sdev, pipe_widget);
 			if (pipe_widget->complete < 0) {
 				ret = pipe_widget->complete;
 				goto widget_free;
@@ -628,11 +633,11 @@ bool snd_sof_stream_suspend_ignored(struct snd_sof_dev *sdev)
 int sof_pcm_stream_free(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream,
 			struct snd_sof_pcm *spcm, int dir, bool free_widget_list)
 {
-	const struct sof_ipc_pcm_ops *pcm_ops = sdev->ipc->ops->pcm;
+	const struct sof_ipc_pcm_ops *pcm_ops = sof_ipc_get_ops(sdev, pcm);
 	int ret;
 
 	/* Send PCM_FREE IPC to reset pipeline */
-	if (pcm_ops->hw_free && spcm->prepared[substream->stream]) {
+	if (pcm_ops && pcm_ops->hw_free && spcm->prepared[substream->stream]) {
 		ret = pcm_ops->hw_free(sdev->component, substream);
 		if (ret < 0)
 			return ret;
@@ -762,13 +767,13 @@ static int sof_dai_get_clk(struct snd_soc_pcm_runtime *rtd, int clk_type)
 	struct snd_sof_dai *dai =
 		snd_sof_find_dai(component, (char *)rtd->dai_link->name);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 
 	/* use the tplg configured mclk if existed */
 	if (!dai)
 		return 0;
 
-	if (tplg_ops->dai_get_clk)
+	if (tplg_ops && tplg_ops->dai_get_clk)
 		return tplg_ops->dai_get_clk(sdev, dai, clk_type);
 
 	return 0;
-- 
2.39.0

