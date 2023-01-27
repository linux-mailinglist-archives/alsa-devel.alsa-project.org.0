Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D80067E48E
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 13:05:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D8A0ED5;
	Fri, 27 Jan 2023 13:04:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D8A0ED5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674821099;
	bh=PPo0KwcTlNQHFN82YqyJJd1QX7wbrdoJBDXbFwxNjTk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DPx6DQnn8UON3QudFXVKQaPClL47wtMPbwhsSGrrpGMUJ+Lg737jR9k4nzi1tiHtX
	 mTkwUK7hBLMxiF0H0ZzYoAKspEJgS7xE9Q1xBYWN+jARD4LqJNixQr7xEKlRApgAsG
	 YefBbsgp8BdqEkZEUm7tqmWqYfBLJ4P4wTzIRT1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B87CF805B2;
	Fri, 27 Jan 2023 13:01:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E2CFF80589; Fri, 27 Jan 2023 13:01:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECD88F80571
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 13:01:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECD88F80571
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DRw22snM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674820862; x=1706356862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PPo0KwcTlNQHFN82YqyJJd1QX7wbrdoJBDXbFwxNjTk=;
 b=DRw22snMa5XBCgi5tvpLEY1MEmKqm/g3fxWbEhvJSr7oJyPEOcD0aXt1
 nUHA1DTsQbOLKfgol2oFiVTkwGrfC08R34MlOOgZVvO66YkUWG1UUMPKg
 29d3tZHzKby0nTbPbgF+HRhg3TYbTj0K0Zam6zB3CcE9KwNNSZbDahgXG
 SLBLRePU3H5feXOPQHkacZyTotH07aXzTYON3qpYENkHGtK4nooDNBsS+
 nBtVan+r/qD9zZudcLWhbM818zj3pKroC4ayBTY4PH6Woko6AHtUSpWBD
 UG/0DuBBeG/VlHmGPNRNObxymsnVync/S7ycphvZ1F9zuLrM1ddCyu5Kt A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="327091924"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="327091924"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:00:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="805782275"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="805782275"
Received: from aaralsto-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.30.130])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:00:56 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 13/18] ASoC: SOF: ipc4-pcm: Rename 'data' variable to
 trigger_list
Date: Fri, 27 Jan 2023 14:00:26 +0200
Message-Id: <20230127120031.10709-14-peter.ujfalusi@linux.intel.com>
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

For more clarity, rename the struct ipc4_pipeline_set_state_data
variable to trigger_list instead of data. No functionality change.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 17a116e8c47c..284e402709be 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -14,14 +14,14 @@
 #include "ipc4-topology.h"
 
 static int sof_ipc4_set_multi_pipeline_state(struct snd_sof_dev *sdev, u32 state,
-					     struct ipc4_pipeline_set_state_data *data)
+					     struct ipc4_pipeline_set_state_data *trigger_list)
 {
 	struct sof_ipc4_msg msg = {{ 0 }};
 	u32 primary, ipc_size;
 
 	/* trigger a single pipeline */
-	if (data->count == 1)
-		return sof_ipc4_set_pipeline_state(sdev, data->pipeline_ids[0], state);
+	if (trigger_list->count == 1)
+		return sof_ipc4_set_pipeline_state(sdev, trigger_list->pipeline_ids[0], state);
 
 	primary = state;
 	primary |= SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_GLB_SET_PIPELINE_STATE);
@@ -33,9 +33,9 @@ static int sof_ipc4_set_multi_pipeline_state(struct snd_sof_dev *sdev, u32 state
 	msg.extension = SOF_IPC4_GLB_PIPE_STATE_EXT_MULTI;
 
 	/* ipc_size includes the count and the pipeline IDs for the number of pipelines */
-	ipc_size = sizeof(u32) * (data->count + 1);
+	ipc_size = sizeof(u32) * (trigger_list->count + 1);
 	msg.data_size = ipc_size;
-	msg.data_ptr = data;
+	msg.data_ptr = trigger_list;
 
 	return sof_ipc_tx_message(sdev->ipc, &msg, ipc_size, NULL, 0);
 }
@@ -65,7 +65,7 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_sof_pcm_stream_pipeline_list *pipeline_list;
-	struct ipc4_pipeline_set_state_data *data;
+	struct ipc4_pipeline_set_state_data *trigger_list;
 	struct snd_sof_widget *pipe_widget;
 	struct sof_ipc4_pipeline *pipeline;
 	struct snd_sof_pipeline *spipe;
@@ -84,8 +84,9 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 		return 0;
 
 	/* allocate memory for the pipeline data */
-	data = kzalloc(struct_size(data, pipeline_ids, pipeline_list->count), GFP_KERNEL);
-	if (!data)
+	trigger_list = kzalloc(struct_size(trigger_list, pipeline_ids, pipeline_list->count),
+			       GFP_KERNEL);
+	if (!trigger_list)
 		return -ENOMEM;
 
 	/*
@@ -101,12 +102,13 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 		pipe_widget = spipe->pipe_widget;
 		pipeline = pipe_widget->private;
 		if (pipeline->state != state && !pipeline->skip_during_fe_trigger)
-			data->pipeline_ids[data->count++] = pipe_widget->instance_id;
+			trigger_list->pipeline_ids[trigger_list->count++] =
+				pipe_widget->instance_id;
 	}
 
 	/* return if all pipelines are in the requested state already */
-	if (!data->count) {
-		kfree(data);
+	if (!trigger_list->count) {
+		kfree(trigger_list);
 		return 0;
 	}
 
@@ -115,20 +117,20 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	 * they are already paused. But it helps keep the logic simpler and the firmware handles
 	 * the repeated pause gracefully. This can be optimized in the future if needed.
 	 */
-	ret = sof_ipc4_set_multi_pipeline_state(sdev, SOF_IPC4_PIPE_PAUSED, data);
+	ret = sof_ipc4_set_multi_pipeline_state(sdev, SOF_IPC4_PIPE_PAUSED, trigger_list);
 	if (ret < 0) {
 		dev_err(sdev->dev, "failed to pause all pipelines\n");
 		goto free;
 	}
 
 	/* update PAUSED state for all pipelines that were just triggered */
-	for (i = 0; i < data->count; i++) {
+	for (i = 0; i < trigger_list->count; i++) {
 		for (j = 0; j < pipeline_list->count; j++) {
 			spipe = pipeline_list->pipelines[j];
 			pipe_widget = spipe->pipe_widget;
 			pipeline = pipe_widget->private;
 
-			if (data->pipeline_ids[i] == pipe_widget->instance_id) {
+			if (trigger_list->pipeline_ids[i] == pipe_widget->instance_id) {
 				pipeline->state = SOF_IPC4_PIPE_PAUSED;
 				break;
 			}
@@ -140,20 +142,20 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 		goto free;
 
 	/* else set the final state in the DSP */
-	ret = sof_ipc4_set_multi_pipeline_state(sdev, state, data);
+	ret = sof_ipc4_set_multi_pipeline_state(sdev, state, trigger_list);
 	if (ret < 0) {
 		dev_err(sdev->dev, "failed to set final state %d for all pipelines\n", state);
 		goto free;
 	}
 
 	/* update final state for all pipelines that were just triggered */
-	for (i = 0; i < data->count; i++) {
+	for (i = 0; i < trigger_list->count; i++) {
 		for (j = 0; j < pipeline_list->count; j++) {
 			spipe = pipeline_list->pipelines[j];
 			pipe_widget = spipe->pipe_widget;
 			pipeline = pipe_widget->private;
 
-			if (data->pipeline_ids[i] == pipe_widget->instance_id) {
+			if (trigger_list->pipeline_ids[i] == pipe_widget->instance_id) {
 				pipeline->state = state;
 				break;
 			}
@@ -161,7 +163,7 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	}
 
 free:
-	kfree(data);
+	kfree(trigger_list);
 	return ret;
 }
 
-- 
2.39.1

