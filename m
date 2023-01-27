Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D6E67E499
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 13:05:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05A4EEDC;
	Fri, 27 Jan 2023 13:04:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05A4EEDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674821128;
	bh=YnmSLJaFnFtOzmsH3VkHh5gTAVhICMT69MYMah7BKLA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DgiwFgR2s6QnrWmywsibugISjP/EAwmCrK+UDMGtv1iyoFm5SwFExZlIakxA7Oy8p
	 WtcOclERCu+vdiKI20sYHI7U5ZRAth4fQW5IAQY5TWC/WvkqFOC6TpkK2k5Iac9NpI
	 gFzGVjtfO5qDMAIKA0pkyEthq4iXS4HyJpTpMmKw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B15A7F805B4;
	Fri, 27 Jan 2023 13:01:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADE43F8057A; Fri, 27 Jan 2023 13:01:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03DCAF8057A
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 13:01:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03DCAF8057A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=W2xJjXmy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674820863; x=1706356863;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YnmSLJaFnFtOzmsH3VkHh5gTAVhICMT69MYMah7BKLA=;
 b=W2xJjXmyhM4X1ZQ6UPIq4ysaqyVQTn+ym3G97rLzk+5O4o+5R5bgd7zG
 o2XUwCj4Kqm6Wv/jUNXOyt+AZfzn97xecbUF9RiFzFtnNiRexpaDl0cPy
 oBN4sGzepql5saJtGCREblARF448WH9AhAAE8qyPj/lv+j1MH8Wgdpsn2
 YX9POsMA4l/fRz+isZKfj2pgoDtfIFp3pqD+vmTzQ7ZGusgiIFAeQ7GYY
 X1vHdlv5ejeyO0F7BDKFzr5rZmzm0qXnWuZi++3W5uYSiP2nApkfCzs4c
 VdZhnvDlTH7eiyRWtnGiopK09dhkB2faMGoBxID8DdbibsTt358nKTg39 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="327091936"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="327091936"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:01:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="805782295"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="805782295"
Received: from aaralsto-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.30.130])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:00:59 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 14/18] ASoC: SOF: ipc4-pcm: Implement pipeline trigger
 reference counting
Date: Fri, 27 Jan 2023 14:00:27 +0200
Message-Id: <20230127120031.10709-15-peter.ujfalusi@linux.intel.com>
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

Use the started_count and paused_count to implement reference counting
when making decisions to start/stop/pause pipelines during the FE DAI
trigger. This is necessary to trigger the shared pipelines in the FE DAI
trigger properly.

With IPC4, the FE trigger will issue multiple pipeline state changes,
and the triggers are propagated downstream to connected pipelines by
the SOF driver - not the firmware. This creates a window for race
conditions where an FE trigger preempts another one, which results
in inconsistent pipeline states and refcounts.

This patch introduces a mutex lock for the pcm trigger that guarantees
that IPC4 state and resources are accessed in a serialized manner.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c  | 228 +++++++++++++++++++++++++++++---------
 sound/soc/sof/ipc4-priv.h |   2 +
 sound/soc/sof/ipc4.c      |   2 +
 3 files changed, 182 insertions(+), 50 deletions(-)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 284e402709be..ababa29d6eac 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -59,19 +59,152 @@ int sof_ipc4_set_pipeline_state(struct snd_sof_dev *sdev, u32 id, u32 state)
 }
 EXPORT_SYMBOL(sof_ipc4_set_pipeline_state);
 
+static void
+sof_ipc4_add_pipeline_to_trigger_list(struct snd_sof_dev *sdev, int state,
+				      struct snd_sof_pipeline *spipe,
+				      struct ipc4_pipeline_set_state_data *trigger_list)
+{
+	struct snd_sof_widget *pipe_widget = spipe->pipe_widget;
+	struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
+
+	if (pipeline->skip_during_fe_trigger)
+		return;
+
+	switch (state) {
+	case SOF_IPC4_PIPE_RUNNING:
+		/*
+		 * Trigger pipeline if all PCMs containing it are paused or if it is RUNNING
+		 * for the first time
+		 */
+		if (spipe->started_count == spipe->paused_count)
+			trigger_list->pipeline_ids[trigger_list->count++] =
+				pipe_widget->instance_id;
+		break;
+	case SOF_IPC4_PIPE_RESET:
+		/* RESET if the pipeline is neither running nor paused */
+		if (!spipe->started_count && !spipe->paused_count)
+			trigger_list->pipeline_ids[trigger_list->count++] =
+				pipe_widget->instance_id;
+		break;
+	case SOF_IPC4_PIPE_PAUSED:
+		/* Pause the pipeline only when its started_count is 1 more than paused_count */
+		if (spipe->paused_count == (spipe->started_count - 1))
+			trigger_list->pipeline_ids[trigger_list->count++] =
+				pipe_widget->instance_id;
+		break;
+	default:
+		break;
+	}
+}
+
+static void
+sof_ipc4_update_pipeline_state(struct snd_sof_dev *sdev, int state, int cmd,
+			       struct snd_sof_pipeline *spipe,
+			       struct ipc4_pipeline_set_state_data *trigger_list)
+{
+	struct snd_sof_widget *pipe_widget = spipe->pipe_widget;
+	struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
+	int i;
+
+	if (pipeline->skip_during_fe_trigger)
+		return;
+
+	/* set state for pipeline if it was just triggered */
+	for (i = 0; i < trigger_list->count; i++) {
+		if (trigger_list->pipeline_ids[i] == pipe_widget->instance_id) {
+			pipeline->state = state;
+			break;
+		}
+	}
+
+	switch (state) {
+	case SOF_IPC4_PIPE_PAUSED:
+		switch (cmd) {
+		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+			/*
+			 * increment paused_count if the PAUSED is the final state during
+			 * the PAUSE trigger
+			 */
+			spipe->paused_count++;
+			break;
+		case SNDRV_PCM_TRIGGER_STOP:
+		case SNDRV_PCM_TRIGGER_SUSPEND:
+			/*
+			 * decrement started_count if PAUSED is the final state during the
+			 * STOP trigger
+			 */
+			spipe->started_count--;
+			break;
+		default:
+			break;
+		}
+		break;
+	case SOF_IPC4_PIPE_RUNNING:
+		switch (cmd) {
+		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+			/* decrement paused_count for RELEASE */
+			spipe->paused_count--;
+			break;
+		case SNDRV_PCM_TRIGGER_START:
+		case SNDRV_PCM_TRIGGER_RESUME:
+			/* increment started_count for START/RESUME */
+			spipe->started_count++;
+			break;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+}
+
+/*
+ * The picture below represents the pipeline state machine wrt PCM actions corresponding to the
+ * triggers and ioctls
+ *				+---------------+
+ *				|               |
+ *				|    INIT       |
+ *				|               |
+ *				+-------+-------+
+ *					|
+ *					|
+ *					| START
+ *					|
+ *					|
+ * +----------------+		   +------v-------+		  +-------------+
+ * |                |   START     |              |   HW_FREE	  |             |
+ * |   RUNNING      <-------------+  PAUSED      +--------------> +   RESET     |
+ * |                |   PAUSE     |              |		  |             |
+ * +------+---------+   RELEASE   +---------+----+		  +-------------+
+ *	  |				     ^
+ *	  |				     |
+ *	  |				     |
+ *	  |				     |
+ *	  |		PAUSE		     |
+ *	  +---------------------------------+
+ *			STOP/SUSPEND
+ *
+ * Note that during system suspend, the suspend trigger is followed by a hw_free in
+ * sof_pcm_trigger(). So, the final state during suspend would be RESET.
+ * Also, since the SOF driver doesn't support full resume, streams would be restarted with the
+ * prepare ioctl before the START trigger.
+ */
+
 static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
-				      struct snd_pcm_substream *substream, int state)
+				      struct snd_pcm_substream *substream, int state, int cmd)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_sof_pcm_stream_pipeline_list *pipeline_list;
+	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
 	struct ipc4_pipeline_set_state_data *trigger_list;
-	struct snd_sof_widget *pipe_widget;
-	struct sof_ipc4_pipeline *pipeline;
 	struct snd_sof_pipeline *spipe;
 	struct snd_sof_pcm *spcm;
 	int ret;
-	int i, j;
+	int i;
+
+	dev_dbg(sdev->dev, "trigger cmd: %d state: %d\n", cmd, state);
 
 	spcm = snd_sof_find_spcm_dai(component, rtd);
 	if (!spcm)
@@ -89,33 +222,41 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	if (!trigger_list)
 		return -ENOMEM;
 
+	mutex_lock(&ipc4_data->trigger_mutex);
+
 	/*
 	 * IPC4 requires pipelines to be triggered in order starting at the sink and
-	 * walking all the way to the source. So traverse the pipeline_list in the reverse order.
-	 * Skip the pipelines that have their skip_during_fe_trigger flag set or if they're already
-	 * in the requested state. If there is a fork in the pipeline, the order of triggering
-	 * between the left/right paths will be indeterministic. But the sink->source trigger order
-	 * sink->source would still be guaranteed for each fork independently.
+	 * walking all the way to the source. So traverse the pipeline_list in the order
+	 * sink->source when starting PCM's and in the reverse order to pause/stop PCM's.
+	 * Skip the pipelines that have their skip_during_fe_trigger flag set. If there is a fork
+	 * in the pipeline, the order of triggering between the left/right paths will be
+	 * indeterministic. But the sink->source trigger order sink->source would still be
+	 * guaranteed for each fork independently.
 	 */
-	for (i = pipeline_list->count - 1; i >= 0; i--) {
-		spipe = pipeline_list->pipelines[i];
-		pipe_widget = spipe->pipe_widget;
-		pipeline = pipe_widget->private;
-		if (pipeline->state != state && !pipeline->skip_during_fe_trigger)
-			trigger_list->pipeline_ids[trigger_list->count++] =
-				pipe_widget->instance_id;
-	}
+	if (state == SOF_IPC4_PIPE_RUNNING || state == SOF_IPC4_PIPE_RESET)
+		for (i = pipeline_list->count - 1; i >= 0; i--) {
+			spipe = pipeline_list->pipelines[i];
+			sof_ipc4_add_pipeline_to_trigger_list(sdev, state, spipe, trigger_list);
+		}
+	else
+		for (i = 0; i < pipeline_list->count; i++) {
+			spipe = pipeline_list->pipelines[i];
+			sof_ipc4_add_pipeline_to_trigger_list(sdev, state, spipe, trigger_list);
+		}
 
 	/* return if all pipelines are in the requested state already */
 	if (!trigger_list->count) {
-		kfree(trigger_list);
-		return 0;
+		ret = 0;
+		goto free;
 	}
 
+	/* no need to pause before reset or before pause release */
+	if (state == SOF_IPC4_PIPE_RESET || cmd == SNDRV_PCM_TRIGGER_PAUSE_RELEASE)
+		goto skip_pause_transition;
+
 	/*
-	 * Pause all pipelines. This could result in an extra IPC to pause all pipelines even if
-	 * they are already paused. But it helps keep the logic simpler and the firmware handles
-	 * the repeated pause gracefully. This can be optimized in the future if needed.
+	 * set paused state for pipelines if the final state is PAUSED or when the pipeline
+	 * is set to RUNNING for the first time after the PCM is started.
 	 */
 	ret = sof_ipc4_set_multi_pipeline_state(sdev, SOF_IPC4_PIPE_PAUSED, trigger_list);
 	if (ret < 0) {
@@ -123,46 +264,32 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 		goto free;
 	}
 
-	/* update PAUSED state for all pipelines that were just triggered */
-	for (i = 0; i < trigger_list->count; i++) {
-		for (j = 0; j < pipeline_list->count; j++) {
-			spipe = pipeline_list->pipelines[j];
-			pipe_widget = spipe->pipe_widget;
-			pipeline = pipe_widget->private;
-
-			if (trigger_list->pipeline_ids[i] == pipe_widget->instance_id) {
-				pipeline->state = SOF_IPC4_PIPE_PAUSED;
-				break;
-			}
-		}
+	/* update PAUSED state for all pipelines just triggered */
+	for (i = 0; i < pipeline_list->count ; i++) {
+		spipe = pipeline_list->pipelines[i];
+		sof_ipc4_update_pipeline_state(sdev, SOF_IPC4_PIPE_PAUSED, cmd, spipe,
+					       trigger_list);
 	}
 
 	/* return if this is the final state */
 	if (state == SOF_IPC4_PIPE_PAUSED)
 		goto free;
-
-	/* else set the final state in the DSP */
+skip_pause_transition:
+	/* else set the RUNNING/RESET state in the DSP */
 	ret = sof_ipc4_set_multi_pipeline_state(sdev, state, trigger_list);
 	if (ret < 0) {
 		dev_err(sdev->dev, "failed to set final state %d for all pipelines\n", state);
 		goto free;
 	}
 
-	/* update final state for all pipelines that were just triggered */
-	for (i = 0; i < trigger_list->count; i++) {
-		for (j = 0; j < pipeline_list->count; j++) {
-			spipe = pipeline_list->pipelines[j];
-			pipe_widget = spipe->pipe_widget;
-			pipeline = pipe_widget->private;
-
-			if (trigger_list->pipeline_ids[i] == pipe_widget->instance_id) {
-				pipeline->state = state;
-				break;
-			}
-		}
+	/* update RUNNING/RESET state for all pipelines that were just triggered */
+	for (i = 0; i < pipeline_list->count; i++) {
+		spipe = pipeline_list->pipelines[i];
+		sof_ipc4_update_pipeline_state(sdev, state, cmd, spipe, trigger_list);
 	}
 
 free:
+	mutex_unlock(&ipc4_data->trigger_mutex);
 	kfree(trigger_list);
 	return ret;
 }
@@ -192,13 +319,14 @@ static int sof_ipc4_pcm_trigger(struct snd_soc_component *component,
 	}
 
 	/* set the pipeline state */
-	return sof_ipc4_trigger_pipelines(component, substream, state);
+	return sof_ipc4_trigger_pipelines(component, substream, state, cmd);
 }
 
 static int sof_ipc4_pcm_hw_free(struct snd_soc_component *component,
 				struct snd_pcm_substream *substream)
 {
-	return sof_ipc4_trigger_pipelines(component, substream, SOF_IPC4_PIPE_RESET);
+	/* command is not relevant with RESET, so just pass 0 */
+	return sof_ipc4_trigger_pipelines(component, substream, SOF_IPC4_PIPE_RESET, 0);
 }
 
 static void ipc4_ssp_dai_config_pcm_params_match(struct snd_sof_dev *sdev, const char *link_name,
diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index fc9efdce67e0..0c0d48376045 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -70,6 +70,7 @@ struct sof_ipc4_fw_library {
  *		    base firmware
  *
  * @load_library: Callback function for platform dependent library loading
+ * @trigger_mutex: Mutex to protect pipeline triggers, ref counts and states
  */
 struct sof_ipc4_fw_data {
 	u32 manifest_fw_hdr_offset;
@@ -82,6 +83,7 @@ struct sof_ipc4_fw_data {
 
 	int (*load_library)(struct snd_sof_dev *sdev,
 			    struct sof_ipc4_fw_library *fw_lib, bool reload);
+	struct mutex trigger_mutex; /* protect pipeline triggers, ref counts and states */
 };
 
 extern const struct sof_ipc_fw_loader_ops ipc4_loader_ops;
diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index 74cd7e956019..fb4760ae593f 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -662,6 +662,8 @@ static int sof_ipc4_init(struct snd_sof_dev *sdev)
 {
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
 
+	mutex_init(&ipc4_data->trigger_mutex);
+
 	xa_init_flags(&ipc4_data->fw_lib_xa, XA_FLAGS_ALLOC);
 
 	return 0;
-- 
2.39.1

