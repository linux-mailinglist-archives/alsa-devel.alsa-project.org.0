Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 011F8652F71
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Dec 2022 11:26:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D14516CC;
	Wed, 21 Dec 2022 11:26:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D14516CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671618418;
	bh=hCMInpeDYvjC5lEVVFib2aZy3UVhvAqhA8NyXts4xMI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nci39CbXq4EDWVnP+ZJzWqyr/f1wk0pqYq/5AZknk4s0wB+Z1NlYwwPEbkrKawkIF
	 tQJL2y1cr3K+MwW3kugsos2xXuMwLepzudbJSKnLrCgrIPsKnCO0kH4HGtLSFMB2J2
	 jYwbNWk0Tvnp+ZdwOqs1BnWUmVrbnBKej2MhJVlU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECDB5F80567;
	Wed, 21 Dec 2022 11:24:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A512F80423; Wed, 21 Dec 2022 11:23:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B065EF80423
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 11:23:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B065EF80423
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BSdM7+Cu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671618222; x=1703154222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hCMInpeDYvjC5lEVVFib2aZy3UVhvAqhA8NyXts4xMI=;
 b=BSdM7+Cu60S7LVXL0msEWss2vdJ708+UrECmyPTlaMvMSAJ2C+CF8+qk
 Y9qmhZpgoo+97NQY75oaw/C7u24BhyuUYptnvSbpsqf72RtZEHKB9RXr/
 pmtAFtxcVl2kn5iGZjCtVPES3S1VXJHqGM1qmOBzu6yreTQ2NWBmn3hiW
 8vXglpJFvmuRE9u1mwMqsVnT69UA8SAxzqABcjMaK407GqFt1uB9mPIBr
 /oxDdOMWkktsWOzR/fZnYDcBlGnC/a8eZLcTi7+7Y/PsgKvN3BrX3pQvY
 pHLY78fwV2Lj0rtVYl+sJFzuZQAJsj4lZ7e3KlVhoNRNe3Q2q3esHnCqz w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="406078659"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="406078659"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 02:23:41 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="681984327"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="681984327"
Received: from cofearra-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.20.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 02:23:38 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 07/11] ASoC: SOF: topology: Extend the optionality of IPC ops
 to IPC as well
Date: Wed, 21 Dec 2022 12:23:24 +0200
Message-Id: <20221221102328.9635-8-peter.ujfalusi@linux.intel.com>
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
sdev->ipc->ops->[tplg] == NULL
sdev->ipc->ops->[tplg]->ops == NULL (treated optional currently)

At the same time standardize the naming of the ops pointer to tplg_ops

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/topology.c | 91 ++++++++++++++++++++++++----------------
 1 file changed, 55 insertions(+), 36 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index c668bd9d21ec..560771ba8fb9 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -54,11 +54,16 @@ int sof_update_ipc_object(struct snd_soc_component *scomp, void *object, enum so
 			  size_t object_size, int token_instance_num)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	const struct sof_ipc_tplg_ops *ipc_tplg_ops = sdev->ipc->ops->tplg;
-	const struct sof_token_info *token_list = ipc_tplg_ops->token_list;
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
+	const struct sof_token_info *token_list;
 	const struct sof_topology_token *tokens;
 	int i, j;
 
+	token_list = tplg_ops ? tplg_ops->token_list : NULL;
+	/* nothing to do if token_list is NULL */
+	if (!token_list)
+		return 0;
+
 	if (token_list[token_id].count < 0) {
 		dev_err(scomp->dev, "Invalid token count for token ID: %d\n", token_id);
 		return -EINVAL;
@@ -263,9 +268,9 @@ static int set_up_volume_table(struct snd_sof_control *scontrol,
 {
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 
-	if (tplg_ops->control->set_up_volume_table)
+	if (tplg_ops && tplg_ops->control && tplg_ops->control->set_up_volume_table)
 		return tplg_ops->control->set_up_volume_table(scontrol, tlv, size);
 
 	dev_err(scomp->dev, "Mandatory op %s not set\n", __func__);
@@ -490,13 +495,14 @@ static int sof_copy_tuples(struct snd_sof_dev *sdev, struct snd_soc_tplg_vendor_
 			   int array_size, u32 token_id, int token_instance_num,
 			   struct snd_sof_tuple *tuples, int tuples_size, int *num_copied_tuples)
 {
-	const struct sof_ipc_tplg_ops *ipc_tplg_ops = sdev->ipc->ops->tplg;
-	const struct sof_token_info *token_list = ipc_tplg_ops->token_list;
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
+	const struct sof_token_info *token_list;
 	const struct sof_topology_token *tokens;
 	int found = 0;
 	int num_tokens, asize;
 	int i, j;
 
+	token_list = tplg_ops ? tplg_ops->token_list : NULL;
 	/* nothing to do if token_list is NULL */
 	if (!token_list)
 		return 0;
@@ -1015,14 +1021,14 @@ static int sof_control_unload(struct snd_soc_component *scomp,
 			      struct snd_soc_dobj *dobj)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	const struct sof_ipc_tplg_ops *ipc_tplg_ops = sdev->ipc->ops->tplg;
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 	struct snd_sof_control *scontrol = dobj->private;
 	int ret = 0;
 
 	dev_dbg(scomp->dev, "tplg: unload control name : %s\n", scontrol->name);
 
-	if (ipc_tplg_ops->control_free) {
-		ret = ipc_tplg_ops->control_free(sdev, scontrol);
+	if (tplg_ops && tplg_ops->control_free) {
+		ret = tplg_ops->control_free(sdev, scontrol);
 		if (ret < 0)
 			dev_err(scomp->dev, "failed to free control: %s\n", scontrol->name);
 	}
@@ -1201,12 +1207,17 @@ static int sof_widget_parse_tokens(struct snd_soc_component *scomp, struct snd_s
 				   enum sof_tokens *object_token_list, int count)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	const struct sof_ipc_tplg_ops *ipc_tplg_ops = sdev->ipc->ops->tplg;
-	const struct sof_token_info *token_list = ipc_tplg_ops->token_list;
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 	struct snd_soc_tplg_private *private = &tw->priv;
+	const struct sof_token_info *token_list;
 	int num_tuples = 0;
 	int ret, i;
 
+	token_list = tplg_ops ? tplg_ops->token_list : NULL;
+	/* nothing to do if token_list is NULL */
+	if (!token_list)
+		return 0;
+
 	if (count > 0 && !object_token_list) {
 		dev_err(scomp->dev, "No token list for widget %s\n", swidget->widget->name);
 		return -EINVAL;
@@ -1375,13 +1386,13 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 			    struct snd_soc_tplg_dapm_widget *tw)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	const struct sof_ipc_tplg_ops *ipc_tplg_ops = sdev->ipc->ops->tplg;
-	const struct sof_ipc_tplg_widget_ops *widget_ops = ipc_tplg_ops->widget;
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
+	const struct sof_ipc_tplg_widget_ops *widget_ops;
 	struct snd_soc_tplg_private *priv = &tw->priv;
+	enum sof_tokens *token_list = NULL;
 	struct snd_sof_widget *swidget;
 	struct snd_sof_dai *dai;
-	enum sof_tokens *token_list;
-	int token_list_size;
+	int token_list_size = 0;
 	int ret = 0;
 
 	swidget = kzalloc(sizeof(*swidget), GFP_KERNEL);
@@ -1440,8 +1451,11 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 		swidget->num_sink_pins, swidget->num_source_pins,
 		strnlen(w->sname, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) > 0 ? w->sname : "none");
 
-	token_list = widget_ops[w->id].token_list;
-	token_list_size = widget_ops[w->id].token_list_size;
+	widget_ops = tplg_ops ? tplg_ops->widget : NULL;
+	if (widget_ops) {
+		token_list = widget_ops[w->id].token_list;
+		token_list_size = widget_ops[w->id].token_list_size;
+	}
 
 	/* handle any special case widgets */
 	switch (w->id) {
@@ -1525,7 +1539,7 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 
 	/* bind widget to external event */
 	if (tw->event_type) {
-		if (widget_ops[w->id].bind_event) {
+		if (widget_ops && widget_ops[w->id].bind_event) {
 			ret = widget_ops[w->id].bind_event(scomp, swidget,
 							   le16_to_cpu(tw->event_type));
 			if (ret) {
@@ -1565,8 +1579,8 @@ static int sof_widget_unload(struct snd_soc_component *scomp,
 			     struct snd_soc_dobj *dobj)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	const struct sof_ipc_tplg_ops *ipc_tplg_ops = sdev->ipc->ops->tplg;
-	const struct sof_ipc_tplg_widget_ops *widget_ops = ipc_tplg_ops->widget;
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
+	const struct sof_ipc_tplg_widget_ops *widget_ops;
 	const struct snd_kcontrol_new *kc;
 	struct snd_soc_dapm_widget *widget;
 	struct snd_sof_control *scontrol;
@@ -1626,7 +1640,8 @@ static int sof_widget_unload(struct snd_soc_component *scomp,
 
 out:
 	/* free IPC related data */
-	if (widget_ops[swidget->id].ipc_free)
+	widget_ops = tplg_ops ? tplg_ops->widget : NULL;
+	if (widget_ops && widget_ops[swidget->id].ipc_free)
 		widget_ops[swidget->id].ipc_free(swidget);
 
 	ida_destroy(&swidget->src_queue_ida);
@@ -1784,9 +1799,9 @@ static int sof_link_load(struct snd_soc_component *scomp, int index, struct snd_
 			 struct snd_soc_tplg_link_config *cfg)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	const struct sof_ipc_tplg_ops *ipc_tplg_ops = sdev->ipc->ops->tplg;
-	const struct sof_token_info *token_list = ipc_tplg_ops->token_list;
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 	struct snd_soc_tplg_private *private = &cfg->priv;
+	const struct sof_token_info *token_list;
 	struct snd_sof_dai_link *slink;
 	u32 token_id = 0;
 	int num_tuples = 0;
@@ -1856,6 +1871,7 @@ static int sof_link_load(struct snd_soc_component *scomp, int index, struct snd_
 		return ret;
 	}
 
+	token_list = tplg_ops ? tplg_ops->token_list : NULL;
 	if (!token_list)
 		goto out;
 
@@ -2100,16 +2116,18 @@ static int sof_set_pipe_widget(struct snd_sof_dev *sdev, struct snd_sof_widget *
 static int sof_complete(struct snd_soc_component *scomp)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 	struct snd_sof_widget *swidget, *comp_swidget;
-	const struct sof_ipc_tplg_ops *ipc_tplg_ops = sdev->ipc->ops->tplg;
-	const struct sof_ipc_tplg_widget_ops *widget_ops = ipc_tplg_ops->widget;
+	const struct sof_ipc_tplg_widget_ops *widget_ops;
 	struct snd_sof_control *scontrol;
 	int ret;
 
+	widget_ops = tplg_ops ? tplg_ops->widget : NULL;
+
 	/* first update all control IPC structures based on the IPC version */
-	if (ipc_tplg_ops->control_setup)
+	if (tplg_ops && tplg_ops->control_setup)
 		list_for_each_entry(scontrol, &sdev->kcontrol_list, list) {
-			ret = ipc_tplg_ops->control_setup(sdev, scontrol);
+			ret = tplg_ops->control_setup(sdev, scontrol);
 			if (ret < 0) {
 				dev_err(sdev->dev, "failed updating IPC struct for control %s\n",
 					scontrol->name);
@@ -2123,7 +2141,7 @@ static int sof_complete(struct snd_soc_component *scomp)
 	 * associated memories.
 	 */
 	list_for_each_entry(swidget, &sdev->widget_list, list) {
-		if (widget_ops[swidget->id].ipc_setup) {
+		if (widget_ops && widget_ops[swidget->id].ipc_setup) {
 			ret = widget_ops[swidget->id].ipc_setup(swidget);
 			if (ret < 0) {
 				dev_err(sdev->dev, "failed updating IPC struct for %s\n",
@@ -2155,15 +2173,16 @@ static int sof_complete(struct snd_soc_component *scomp)
 
 	/* verify topology components loading including dynamic pipelines */
 	if (sof_debug_check_flag(SOF_DBG_VERIFY_TPLG)) {
-		if (ipc_tplg_ops->set_up_all_pipelines && ipc_tplg_ops->tear_down_all_pipelines) {
-			ret = ipc_tplg_ops->set_up_all_pipelines(sdev, true);
+		if (tplg_ops && tplg_ops->set_up_all_pipelines &&
+		    tplg_ops->tear_down_all_pipelines) {
+			ret = tplg_ops->set_up_all_pipelines(sdev, true);
 			if (ret < 0) {
 				dev_err(sdev->dev, "Failed to set up all topology pipelines: %d\n",
 					ret);
 				return ret;
 			}
 
-			ret = ipc_tplg_ops->tear_down_all_pipelines(sdev, true);
+			ret = tplg_ops->tear_down_all_pipelines(sdev, true);
 			if (ret < 0) {
 				dev_err(sdev->dev, "Failed to tear down topology pipelines: %d\n",
 					ret);
@@ -2173,8 +2192,8 @@ static int sof_complete(struct snd_soc_component *scomp)
 	}
 
 	/* set up static pipelines */
-	if (ipc_tplg_ops->set_up_all_pipelines)
-		return ipc_tplg_ops->set_up_all_pipelines(sdev, false);
+	if (tplg_ops && tplg_ops->set_up_all_pipelines)
+		return tplg_ops->set_up_all_pipelines(sdev, false);
 
 	return 0;
 }
@@ -2184,10 +2203,10 @@ static int sof_manifest(struct snd_soc_component *scomp, int index,
 			struct snd_soc_tplg_manifest *man)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	const struct sof_ipc_tplg_ops *ipc_tplg_ops = sdev->ipc->ops->tplg;
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 
-	if (ipc_tplg_ops->parse_manifest)
-		return ipc_tplg_ops->parse_manifest(scomp, index, man);
+	if (tplg_ops && tplg_ops->parse_manifest)
+		return tplg_ops->parse_manifest(scomp, index, man);
 
 	return 0;
 }
-- 
2.39.0

