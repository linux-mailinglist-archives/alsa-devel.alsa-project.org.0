Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6E26C2DDB
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Mar 2023 10:29:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2CFE1F9;
	Tue, 21 Mar 2023 10:28:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2CFE1F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679390974;
	bh=h1GsKTmMcKTIanpSPySFiy2iNgJqMU8B2uUyhDo1SbM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JCbqSD6ezV5dFGYjKnn6IBGmxLC9nQ1mjDcAoLmNfLWTpOYlFpXWrpJtFV9+UzBG6
	 6J7XlpOyV2RlszfqS0HyWhQx9T3oeTKcMlOApYOn35oSsSDWOwvesizRo+nrkCWbiR
	 dhAKQDxrWAVBXrYvoYDFTbo7SXA0acKOBnc931dU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8056F8027B;
	Tue, 21 Mar 2023 10:28:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4075EF8052D; Tue, 21 Mar 2023 10:26:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D4BEF80254
	for <alsa-devel@alsa-project.org>; Tue, 21 Mar 2023 10:26:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D4BEF80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=W/UCS0Pt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679390797; x=1710926797;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h1GsKTmMcKTIanpSPySFiy2iNgJqMU8B2uUyhDo1SbM=;
  b=W/UCS0PthZiq4SoscvDEG7/Z6zx61Evz0S9L8R+DF61DM+0NtxCet2Sa
   sCGiZD4zVPy+D7aIV8IdZKwcAIe/Uxv/mUe8U2BYf06PUTdzUOSLXXGy+
   GESf5cylhgUOfpxGwpLdviPw90zeu5HEPGUI4FKi85iCQr/CkGC8j3kqs
   djSW1QqvtSyDFLZ/6udYIMm09C/OLlajZWmZKpcNRYCJfaXjk7IRbUxew
   TfwSrPbJQnAbqG7q4BbUxk9puK4qgjZ0GLJeuBWUqdeigL0KNSwKcqtN/
   E8NGEtA9G1C8P7y2RmLGRj5zebsw6ACy5dkxDbdqvfQQjfIe4jfZsRVKr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="401462907"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400";
   d="scan'208";a="401462907"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 02:26:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="770559827"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400";
   d="scan'208";a="770559827"
Received: from markusbu-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.60.215])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 02:26:32 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 3/3] ASoC: SOF: ipc4/intel: Add support for chained DMA
Date: Tue, 21 Mar 2023 11:26:54 +0200
Message-Id: <20230321092654.7292-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230321092654.7292-1-peter.ujfalusi@linux.intel.com>
References: <20230321092654.7292-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L23YCSUNA3FQ52RAXGRQANBZFWTRJSAI
X-Message-ID-Hash: L23YCSUNA3FQ52RAXGRQANBZFWTRJSAI
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 jyri.sarha@intel.com, rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L23YCSUNA3FQ52RAXGRQANBZFWTRJSAI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Jyri Sarha <jyri.sarha@intel.com>

Add logic for setting up and tearing down chained DMA connections.

Since pipelines are not used, all the logic to set the pipeline states
can be bypassed, with only the DMA programming sequences remaining. In
addition the same format needs to be used for host- and link-DMA,
without the usual fixup to use the S32_LE format on the link.

Note however that for convenience and compatibility with existing
definitions, the topology relies on the concept of pipelines with a
'USE_CHAIN_DMA' token indicating that all the logic shall be bypassed.

Unlike 'normal' ALSA sequences, the chain DMA is not programmed in
hw_params/hw_free. The IPC message to set-up and tear-down chained DMA
are sent in sof_ipc4_trigger_pipelines(), but the contents prepared
earlier.

Chained DMA is only supported by the Intel HDA DAI for now, and only
S16_LE and S32_LE formats are supported for now.

Signed-off-by: Jyri Sarha <jyri.sarha@intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/uapi/sound/sof/tokens.h   |   1 +
 sound/soc/sof/intel/hda-dai-ops.c |  18 ++++-
 sound/soc/sof/ipc4-pcm.c          | 122 +++++++++++++++++++++++++++++-
 sound/soc/sof/ipc4-topology.c     | 120 ++++++++++++++++++++++++++++-
 sound/soc/sof/ipc4-topology.h     |   2 +
 5 files changed, 255 insertions(+), 8 deletions(-)

diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index bd02842124f9..bbc37877aaff 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -54,6 +54,7 @@
 #define SOF_TKN_SCHED_DYNAMIC_PIPELINE		206
 #define SOF_TKN_SCHED_LP_MODE			207
 #define SOF_TKN_SCHED_MEM_USAGE			208
+#define SOF_TKN_SCHED_USE_CHAIN_DMA		209
 
 /* volume */
 #define SOF_TKN_VOLUME_RAMP_STEP_TYPE		250
diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index be109f33715f..de48f13259f1 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -277,6 +277,15 @@ static const struct hda_dai_widget_dma_ops hda_ipc4_dma_ops = {
 	.post_trigger = hda_ipc4_post_trigger
 };
 
+static const struct hda_dai_widget_dma_ops hda_ipc4_chain_dma_ops = {
+	.get_hext_stream = hda_get_hext_stream,
+	.assign_hext_stream = hda_assign_hext_stream,
+	.release_hext_stream = hda_release_hext_stream,
+	.setup_hext_stream = hda_setup_hext_stream,
+	.reset_hext_stream = hda_reset_hext_stream,
+	.trigger = hda_trigger,
+};
+
 static int hda_ipc3_post_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *cpu_dai,
 				 struct snd_pcm_substream *substream, int cmd)
 {
@@ -331,8 +340,15 @@ hda_select_dai_widget_ops(struct snd_sof_dev *sdev, struct snd_sof_widget *swidg
 	{
 		struct sof_ipc4_copier *ipc4_copier = sdai->private;
 
-		if (ipc4_copier->dai_type == SOF_DAI_INTEL_HDA)
+		if (ipc4_copier->dai_type == SOF_DAI_INTEL_HDA) {
+			struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
+			struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
+
+			if (pipeline->use_chain_dma)
+				return &hda_ipc4_chain_dma_ops;
+
 			return &hda_ipc4_dma_ops;
+		}
 		break;
 	}
 	default:
diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 4598057b7f28..db64200ba1e5 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -193,6 +193,88 @@ sof_ipc4_update_pipeline_state(struct snd_sof_dev *sdev, int state, int cmd,
  * prepare ioctl before the START trigger.
  */
 
+/*
+ * Chained DMA is a special case where there is no processing on
+ * DSP. The samples are just moved over by host side DMA to a single
+ * buffer on DSP and directly from there to link DMA. However, the
+ * model on SOF driver has two notional pipelines, one at host DAI,
+ * and another at link DAI. They both shall have the use_chain_dma
+ * attribute.
+ */
+
+static int sof_ipc4_chain_dma_trigger(struct snd_sof_dev *sdev,
+				      struct snd_sof_pcm_stream_pipeline_list *pipeline_list,
+				      int state, int cmd)
+{
+	bool allocate, enable, set_fifo_size;
+	struct sof_ipc4_msg msg = {{ 0 }};
+	int i;
+
+	switch (state) {
+	case SOF_IPC4_PIPE_RUNNING: /* Allocate and start chained dma */
+		allocate = true;
+		enable = true;
+		/*
+		 * SOF assumes creation of a new stream from the presence of fifo_size
+		 * in the message, so we must leave it out in pause release case.
+		 */
+		if (cmd == SNDRV_PCM_TRIGGER_PAUSE_RELEASE)
+			set_fifo_size = false;
+		else
+			set_fifo_size = true;
+		break;
+	case SOF_IPC4_PIPE_PAUSED: /* Disable chained DMA. */
+		allocate = true;
+		enable = false;
+		set_fifo_size = false;
+		break;
+	case SOF_IPC4_PIPE_RESET: /* Disable and free chained DMA. */
+		allocate = false;
+		enable = false;
+		set_fifo_size = false;
+		break;
+	default:
+		dev_err(sdev->dev, "Unexpected state %d", state);
+		return -EINVAL;
+	}
+
+	msg.primary = SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_GLB_CHAIN_DMA);
+	msg.primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
+	msg.primary |= SOF_IPC4_MSG_TARGET(SOF_IPC4_FW_GEN_MSG);
+
+	/*
+	 * To set-up the DMA chain, the host DMA ID and SCS setting
+	 * are retrieved from the host pipeline configuration. Likewise
+	 * the link DMA ID and fifo_size are retrieved from the link
+	 * pipeline configuration.
+	 */
+	for (i = 0; i < pipeline_list->count; i++) {
+		struct snd_sof_pipeline *spipe = pipeline_list->pipelines[i];
+		struct snd_sof_widget *pipe_widget = spipe->pipe_widget;
+		struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
+
+		if (!pipeline->use_chain_dma) {
+			dev_err(sdev->dev,
+				"All pipelines in chained DMA stream should have use_chain_dma attribute set.");
+			return -EINVAL;
+		}
+
+		msg.primary |= pipeline->msg.primary;
+
+		/* Add fifo_size (actually DMA buffer size) field to the message */
+		if (set_fifo_size)
+			msg.extension |= pipeline->msg.extension;
+	}
+
+	if (allocate)
+		msg.primary |= SOF_IPC4_GLB_CHAIN_DMA_ALLOCATE_MASK;
+
+	if (enable)
+		msg.primary |= SOF_IPC4_GLB_CHAIN_DMA_ENABLE_MASK;
+
+	return sof_ipc_tx_message(sdev->ipc, &msg, 0, NULL, 0);
+}
+
 static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 				      struct snd_pcm_substream *substream, int state, int cmd)
 {
@@ -201,6 +283,8 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	struct snd_sof_pcm_stream_pipeline_list *pipeline_list;
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
 	struct ipc4_pipeline_set_state_data *trigger_list;
+	struct snd_sof_widget *pipe_widget;
+	struct sof_ipc4_pipeline *pipeline;
 	struct snd_sof_pipeline *spipe;
 	struct snd_sof_pcm *spcm;
 	int ret;
@@ -218,6 +302,17 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	if (!pipeline_list->pipelines || !pipeline_list->count)
 		return 0;
 
+	spipe = pipeline_list->pipelines[0];
+	pipe_widget = spipe->pipe_widget;
+	pipeline = pipe_widget->private;
+
+	/*
+	 * If use_chain_dma attribute is set we proceed to chained DMA
+	 * trigger function that handles the rest for the substream.
+	 */
+	if (pipeline->use_chain_dma)
+		return sof_ipc4_chain_dma_trigger(sdev, pipeline_list, state, cmd);
+
 	/* allocate memory for the pipeline data */
 	trigger_list = kzalloc(struct_size(trigger_list, pipeline_ids, pipeline_list->count),
 			       GFP_KERNEL);
@@ -422,8 +517,10 @@ static int sof_ipc4_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
 	struct snd_sof_dai *dai = snd_sof_find_dai(component, rtd->dai_link->name);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct sof_ipc4_copier *ipc4_copier;
-	int ret;
+	bool use_chain_dma = false;
+	int dir;
 
 	if (!dai) {
 		dev_err(component->dev, "%s: No DAI found with name %s\n", __func__,
@@ -438,9 +535,26 @@ static int sof_ipc4_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 		return -EINVAL;
 	}
 
-	ret = sof_ipc4_pcm_dai_link_fixup_rate(sdev, params, ipc4_copier);
-	if (ret)
-		return ret;
+	for_each_pcm_streams(dir) {
+		struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(cpu_dai, dir);
+
+		if (w) {
+			struct snd_sof_widget *swidget = w->dobj.private;
+			struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
+			struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
+
+			if (pipeline->use_chain_dma)
+				use_chain_dma = true;
+		}
+	}
+
+	/* Chain DMA does not use copiers, so no fixup needed */
+	if (!use_chain_dma) {
+		int ret = sof_ipc4_pcm_dai_link_fixup_rate(sdev, params, ipc4_copier);
+
+		if (ret)
+			return ret;
+	}
 
 	switch (ipc4_copier->dai_type) {
 	case SOF_DAI_INTEL_SSP:
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 3a4a3267017b..f1e1aed94da4 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -19,6 +19,7 @@
 
 #define SOF_IPC4_GAIN_PARAM_ID  0
 #define SOF_IPC4_TPLG_ABI_SIZE 6
+#define SOF_IPC4_CHAIN_DMA_BUF_SIZE_MS 2
 
 static DEFINE_IDA(alh_group_ida);
 static DEFINE_IDA(pipeline_ida);
@@ -26,6 +27,8 @@ static DEFINE_IDA(pipeline_ida);
 static const struct sof_topology_token ipc4_sched_tokens[] = {
 	{SOF_TKN_SCHED_LP_MODE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
 		offsetof(struct sof_ipc4_pipeline, lp_mode)},
+	{SOF_TKN_SCHED_USE_CHAIN_DMA, SND_SOC_TPLG_TUPLE_TYPE_BOOL, get_token_u16,
+		offsetof(struct sof_ipc4_pipeline, use_chain_dma)},
 	{SOF_TKN_SCHED_CORE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
 		offsetof(struct sof_ipc4_pipeline, core_id)},
 };
@@ -475,6 +478,8 @@ static int sof_ipc4_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 	struct snd_soc_component *scomp = swidget->scomp;
 	struct snd_sof_dai *dai = swidget->private;
 	struct sof_ipc4_copier *ipc4_copier;
+	struct snd_sof_widget *pipe_widget;
+	struct sof_ipc4_pipeline *pipeline;
 	int node_type = 0;
 	int ret;
 
@@ -512,6 +517,16 @@ static int sof_ipc4_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 
 	ipc4_copier->data.gtw_cfg.node_id = SOF_IPC4_NODE_TYPE(node_type);
 
+	pipe_widget = swidget->spipe->pipe_widget;
+	pipeline = pipe_widget->private;
+	if (pipeline->use_chain_dma && ipc4_copier->dai_type != SOF_DAI_INTEL_HDA) {
+		dev_err(scomp->dev,
+			"Bad DAI type '%d', Chained DMA is only supported by HDA DAIs (%d).\n",
+			ipc4_copier->dai_type, SOF_DAI_INTEL_HDA);
+		ret = -ENODEV;
+		goto free_available_fmt;
+	}
+
 	switch (ipc4_copier->dai_type) {
 	case SOF_DAI_INTEL_ALH:
 	{
@@ -643,6 +658,12 @@ static int sof_ipc4_widget_setup_comp_pipeline(struct snd_sof_widget *swidget)
 
 	swidget->core = pipeline->core_id;
 
+	if (pipeline->use_chain_dma) {
+		dev_dbg(scomp->dev, "Set up chain DMA for %s\n", swidget->widget->name);
+		swidget->private = pipeline;
+		return 0;
+	}
+
 	/* parse one set of pipeline tokens */
 	ret = sof_update_ipc_object(scomp, swidget, SOF_PIPELINE_TOKENS, swidget->tuples,
 				    swidget->num_tuples, sizeof(*swidget), 1);
@@ -1103,11 +1124,21 @@ static void sof_ipc4_unprepare_copier_module(struct snd_sof_widget *swidget)
 	pipeline->mem_usage = 0;
 
 	if (WIDGET_IS_AIF(swidget->id) || swidget->id == snd_soc_dapm_buffer) {
+		if (pipeline->use_chain_dma) {
+			pipeline->msg.primary = 0;
+			pipeline->msg.extension = 0;
+		}
 		ipc4_copier = swidget->private;
 	} else if (WIDGET_IS_DAI(swidget->id)) {
 		struct snd_sof_dai *dai = swidget->private;
 
 		ipc4_copier = dai->private;
+
+		if (pipeline->use_chain_dma) {
+			pipeline->msg.primary = 0;
+			pipeline->msg.extension = 0;
+		}
+
 		if (ipc4_copier->dai_type == SOF_DAI_INTEL_ALH) {
 			struct sof_ipc4_copier_data *copier_data = &ipc4_copier->data;
 			struct sof_ipc4_alh_configuration_blob *blob;
@@ -1344,13 +1375,44 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 			return ret;
 		}
 
-		pipe_widget = swidget->spipe->pipe_widget;
-		pipeline = pipe_widget->private;
 		ipc4_copier = (struct sof_ipc4_copier *)swidget->private;
 		gtw_attr = ipc4_copier->gtw_attr;
 		copier_data = &ipc4_copier->data;
 		available_fmt = &ipc4_copier->available_fmt;
 
+		pipe_widget = swidget->spipe->pipe_widget;
+		pipeline = pipe_widget->private;
+
+		if (pipeline->use_chain_dma) {
+			u32 host_dma_id;
+			u32 fifo_size;
+
+			host_dma_id = platform_params->stream_tag - 1;
+			pipeline->msg.primary |= SOF_IPC4_GLB_CHAIN_DMA_HOST_ID(host_dma_id);
+
+			/* Set SCS bit for S16_LE format only */
+			if (params_format(fe_params) == SNDRV_PCM_FORMAT_S16_LE)
+				pipeline->msg.primary |= SOF_IPC4_GLB_CHAIN_DMA_SCS_MASK;
+
+			/*
+			 * Despite its name the bitfield 'fifo_size' is used to define DMA buffer
+			 * size. The expression calculates 2ms buffer size.
+			 */
+			fifo_size = DIV_ROUND_UP((SOF_IPC4_CHAIN_DMA_BUF_SIZE_MS *
+						  params_rate(fe_params) *
+						  params_channels(fe_params) *
+						  params_physical_width(fe_params)), 8000);
+			pipeline->msg.extension |= SOF_IPC4_GLB_EXT_CHAIN_DMA_FIFO_SIZE(fifo_size);
+
+			/*
+			 * Chain DMA does not support stream timestamping, set node_id to invalid
+			 * to skip the code in sof_ipc4_get_stream_start_offset().
+			 */
+			copier_data->gtw_cfg.node_id = SOF_IPC4_INVALID_NODE_ID;
+
+			return 0;
+		}
+
 		/*
 		 * Use the input_pin_fmts to match pcm params for playback and the output_pin_fmts
 		 * for capture.
@@ -1375,6 +1437,12 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	case snd_soc_dapm_dai_in:
 	case snd_soc_dapm_dai_out:
 	{
+		struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
+		struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
+
+		if (pipeline->use_chain_dma)
+			return 0;
+
 		dai = swidget->private;
 
 		ipc4_copier = (struct sof_ipc4_copier *)dai->private;
@@ -1921,6 +1989,9 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 	case snd_soc_dapm_scheduler:
 		pipeline = swidget->private;
 
+		if (pipeline->use_chain_dma)
+			return 0;
+
 		dev_dbg(sdev->dev, "pipeline: %d memory pages: %d\n", swidget->pipeline_id,
 			pipeline->mem_usage);
 
@@ -1943,6 +2014,10 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 	{
 		struct sof_ipc4_copier *ipc4_copier = swidget->private;
 
+		pipeline = pipe_widget->private;
+		if (pipeline->use_chain_dma)
+			return 0;
+
 		ipc_size = ipc4_copier->ipc_config_size;
 		ipc_data = ipc4_copier->ipc_config_data;
 
@@ -1955,6 +2030,10 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 		struct snd_sof_dai *dai = swidget->private;
 		struct sof_ipc4_copier *ipc4_copier = dai->private;
 
+		pipeline = pipe_widget->private;
+		if (pipeline->use_chain_dma)
+			return 0;
+
 		ipc_size = ipc4_copier->ipc_config_size;
 		ipc_data = ipc4_copier->ipc_config_data;
 
@@ -2066,6 +2145,9 @@ static int sof_ipc4_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget
 		struct sof_ipc4_msg msg = {{ 0 }};
 		u32 header;
 
+		if (pipeline->use_chain_dma)
+			return 0;
+
 		header = SOF_IPC4_GLB_PIPE_INSTANCE_ID(swidget->instance_id);
 		header |= SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_GLB_DELETE_PIPELINE);
 		header |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
@@ -2082,7 +2164,11 @@ static int sof_ipc4_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget
 		pipeline->state = SOF_IPC4_PIPE_UNINITIALIZED;
 		ida_free(&pipeline_ida, swidget->instance_id);
 	} else {
-		ida_free(&fw_module->m_ida, swidget->instance_id);
+		struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
+		struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
+
+		if (!pipeline->use_chain_dma)
+			ida_free(&fw_module->m_ida, swidget->instance_id);
 	}
 
 	mutex_unlock(&ipc4_data->pipeline_state_mutex);
@@ -2234,12 +2320,27 @@ static int sof_ipc4_route_setup(struct snd_sof_dev *sdev, struct snd_sof_route *
 {
 	struct snd_sof_widget *src_widget = sroute->src_widget;
 	struct snd_sof_widget *sink_widget = sroute->sink_widget;
+	struct snd_sof_widget *src_pipe_widget = src_widget->spipe->pipe_widget;
+	struct snd_sof_widget *sink_pipe_widget = sink_widget->spipe->pipe_widget;
 	struct sof_ipc4_fw_module *src_fw_module = src_widget->module_info;
 	struct sof_ipc4_fw_module *sink_fw_module = sink_widget->module_info;
+	struct sof_ipc4_pipeline *src_pipeline = src_pipe_widget->private;
+	struct sof_ipc4_pipeline *sink_pipeline = sink_pipe_widget->private;
 	struct sof_ipc4_msg msg = {{ 0 }};
 	u32 header, extension;
 	int ret;
 
+	/* no route set up if chain DMA is used */
+	if (src_pipeline->use_chain_dma || sink_pipeline->use_chain_dma) {
+		if (!src_pipeline->use_chain_dma || !sink_pipeline->use_chain_dma) {
+			dev_err(sdev->dev,
+				"use_chain_dma must be set for both src %s and sink %s pipelines\n",
+				src_widget->widget->name, sink_widget->widget->name);
+			return -EINVAL;
+		}
+		return 0;
+	}
+
 	sroute->src_queue_id = sof_ipc4_get_queue_id(src_widget, sink_widget,
 						     SOF_PIN_TYPE_OUTPUT);
 	if (sroute->src_queue_id < 0) {
@@ -2310,9 +2411,17 @@ static int sof_ipc4_route_free(struct snd_sof_dev *sdev, struct snd_sof_route *s
 	struct sof_ipc4_fw_module *src_fw_module = src_widget->module_info;
 	struct sof_ipc4_fw_module *sink_fw_module = sink_widget->module_info;
 	struct sof_ipc4_msg msg = {{ 0 }};
+	struct snd_sof_widget *src_pipe_widget = src_widget->spipe->pipe_widget;
+	struct snd_sof_widget *sink_pipe_widget = sink_widget->spipe->pipe_widget;
+	struct sof_ipc4_pipeline *src_pipeline = src_pipe_widget->private;
+	struct sof_ipc4_pipeline *sink_pipeline = sink_pipe_widget->private;
 	u32 header, extension;
 	int ret = 0;
 
+	/* no route is set up if chain DMA is used */
+	if (src_pipeline->use_chain_dma || sink_pipeline->use_chain_dma)
+		return 0;
+
 	dev_dbg(sdev->dev, "unbind modules %s:%d -> %s:%d\n",
 		src_widget->widget->name, sroute->src_queue_id,
 		sink_widget->widget->name, sroute->dst_queue_id);
@@ -2374,6 +2483,11 @@ static int sof_ipc4_dai_config(struct snd_sof_dev *sdev, struct snd_sof_widget *
 
 	switch (ipc4_copier->dai_type) {
 	case SOF_DAI_INTEL_HDA:
+		if (pipeline->use_chain_dma) {
+			pipeline->msg.primary &= ~SOF_IPC4_GLB_CHAIN_DMA_LINK_ID_MASK;
+			pipeline->msg.primary |= SOF_IPC4_GLB_CHAIN_DMA_LINK_ID(data->dai_data);
+			break;
+		}
 		gtw_attr = ipc4_copier->gtw_attr;
 		gtw_attr->lp_buffer_alloc = pipeline->lp_mode;
 		pipeline->skip_during_fe_trigger = true;
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 015027b23588..cf007282867b 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -126,6 +126,7 @@ struct sof_ipc4_copier_config_set_sink_format {
  * @mem_usage: Memory usage
  * @core_id: Target core for the pipeline
  * @state: Pipeline state
+ * @use_chain_dma: flag to indicate if the firmware shall use chained DMA
  * @msg: message structure for pipeline
  * @skip_during_fe_trigger: skip triggering this pipeline during the FE DAI trigger
  */
@@ -135,6 +136,7 @@ struct sof_ipc4_pipeline {
 	uint32_t mem_usage;
 	uint32_t core_id;
 	int state;
+	bool use_chain_dma;
 	struct sof_ipc4_msg msg;
 	bool skip_during_fe_trigger;
 };
-- 
2.40.0

