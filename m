Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 002064D8DDF
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 21:08:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E9DE182D;
	Mon, 14 Mar 2022 21:07:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E9DE182D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647288520;
	bh=US4rwkr+I2e0yF2bgNFrnpAGavSAAIg7krwfslCO3ko=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ajh0fhQ/qtCSh3t5+ApgJ/P2oFgBOJt5MuQN/1kcaRVY/GaxeCqhFvJwg2nhAJY90
	 xGPxa+Ir6wa24Yg2IyrDTeniT7DNmix+K6t0t4XUdcejFRddBFxmnGhXHs4eT+XYLI
	 iSHsKKi+dimJ02fiD9GmpJK6vegw5/z663MBDEiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E70F3F8053A;
	Mon, 14 Mar 2022 21:05:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE8C6F80529; Mon, 14 Mar 2022 21:05:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F9D6F80516
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 21:05:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F9D6F80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="I520NWmo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647288343; x=1678824343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=US4rwkr+I2e0yF2bgNFrnpAGavSAAIg7krwfslCO3ko=;
 b=I520NWmo19198/a3pX9tTWjfnxMaYaqTGsdOPtpndqVxtoMYtMJyScVy
 ZkmNbjZatWSE9OulO63BKjyQ2N4Gm38R0BKvTbnjLc3KfL8rL6DA1CHy/
 UVy2RrzxfvEDY0CN9n4Zk0qzIXbAxrzdwzi8CqNMFWAkloCl7AJbR7863
 0eeeBMprbhngSB/duozL3RjJClaOlRoPtZRWEQId8rPOYJ2dSy6uIciZp
 9tXfqxvMFGrarjjDhWKaKyGDCsIc4mSQvpymwCu1dbjzN9kTgJAOfKiLm
 ynmY8E3/TXO3AlHgUiN8uIIdUwQ/lU2x9WIkYnIW2WcDIEWL7lpeGhXLG g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="342563472"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="342563472"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:32 -0700
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="634339890"
Received: from pmishr1-mobl1.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.25.117])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:32 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/18] ASoC: SOF: topology: Make scheduler widget parsing IPC
 agnostic
Date: Mon, 14 Mar 2022 13:05:07 -0700
Message-Id: <20220314200520.1233427-7-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220314200520.1233427-1-ranjani.sridharan@linux.intel.com>
References: <20220314200520.1233427-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =tiwai@suse.com,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Define the list of tokens pertaining to the scheduler widgets, parse and
save them as part of the swidget tuples array. Once topology parsing is
complete, these tokens will be applied to create the IPC structure for the
pipeline component based on the topology widget_setup op in ipc3_tplg_ops.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 98 ++++++++++++++++++++++++++++++++++
 sound/soc/sof/topology.c      | 99 -----------------------------------
 2 files changed, 98 insertions(+), 99 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 33d07b0df640..15299ffb7b15 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -13,6 +13,28 @@
 #include "sof-audio.h"
 #include "ops.h"
 
+/* scheduling */
+static const struct sof_topology_token sched_tokens[] = {
+	{SOF_TKN_SCHED_PERIOD, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_pipe_new, period)},
+	{SOF_TKN_SCHED_PRIORITY, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_pipe_new, priority)},
+	{SOF_TKN_SCHED_MIPS, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_pipe_new, period_mips)},
+	{SOF_TKN_SCHED_CORE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_pipe_new, core)},
+	{SOF_TKN_SCHED_FRAMES, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_pipe_new, frames_per_sched)},
+	{SOF_TKN_SCHED_TIME_DOMAIN, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_pipe_new, time_domain)},
+};
+
+static const struct sof_topology_token pipeline_tokens[] = {
+	{SOF_TKN_SCHED_DYNAMIC_PIPELINE, SND_SOC_TPLG_TUPLE_TYPE_BOOL, get_token_u16,
+		offsetof(struct snd_sof_widget, dynamic_pipeline_widget)},
+
+};
+
 /* PCM */
 static const struct sof_topology_token pcm_tokens[] = {
 	{SOF_TKN_PCM_DMAC_CONFIG, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
@@ -44,6 +66,8 @@ static const struct sof_topology_token comp_ext_tokens[] = {
 
 static const struct sof_token_info ipc3_token_list[SOF_TOKEN_COUNT] = {
 	[SOF_PCM_TOKENS] = {"PCM tokens", pcm_tokens, ARRAY_SIZE(pcm_tokens)},
+	[SOF_PIPELINE_TOKENS] = {"Pipeline tokens", pipeline_tokens, ARRAY_SIZE(pipeline_tokens)},
+	[SOF_SCHED_TOKENS] = {"Scheduler tokens", sched_tokens, ARRAY_SIZE(sched_tokens)},
 	[SOF_COMP_TOKENS] = {"Comp tokens", comp_tokens, ARRAY_SIZE(comp_tokens)},
 	[SOF_CORE_TOKENS] = {"Core tokens", core_tokens, ARRAY_SIZE(core_tokens)},
 	[SOF_COMP_EXT_TOKENS] = {"AFE tokens", comp_ext_tokens, ARRAY_SIZE(comp_ext_tokens)},
@@ -148,6 +172,71 @@ static void sof_ipc3_widget_free_comp(struct snd_sof_widget *swidget)
 	kfree(swidget->private);
 }
 
+static int sof_ipc3_widget_setup_comp_pipeline(struct snd_sof_widget *swidget)
+{
+	struct snd_soc_component *scomp = swidget->scomp;
+	struct sof_ipc_pipe_new *pipeline;
+	struct snd_sof_widget *comp_swidget;
+	int ret;
+
+	pipeline = kzalloc(sizeof(*pipeline), GFP_KERNEL);
+	if (!pipeline)
+		return -ENOMEM;
+
+	/* configure pipeline IPC message */
+	pipeline->hdr.size = sizeof(*pipeline);
+	pipeline->hdr.cmd = SOF_IPC_GLB_TPLG_MSG | SOF_IPC_TPLG_PIPE_NEW;
+	pipeline->pipeline_id = swidget->pipeline_id;
+	pipeline->comp_id = swidget->comp_id;
+
+	swidget->private = pipeline;
+
+	/* component at start of pipeline is our stream id */
+	comp_swidget = snd_sof_find_swidget(scomp, swidget->widget->sname);
+	if (!comp_swidget) {
+		dev_err(scomp->dev, "scheduler %s refers to non existent widget %s\n",
+			swidget->widget->name, swidget->widget->sname);
+		ret = -EINVAL;
+		goto err;
+	}
+
+	pipeline->sched_id = comp_swidget->comp_id;
+
+	/* parse one set of scheduler tokens */
+	ret = sof_update_ipc_object(scomp, pipeline, SOF_SCHED_TOKENS, swidget->tuples,
+				    swidget->num_tuples, sizeof(*pipeline), 1);
+	if (ret < 0)
+		goto err;
+
+	/* parse one set of pipeline tokens */
+	ret = sof_update_ipc_object(scomp, swidget, SOF_PIPELINE_TOKENS, swidget->tuples,
+				    swidget->num_tuples, sizeof(*swidget), 1);
+	if (ret < 0)
+		goto err;
+
+	if (sof_debug_check_flag(SOF_DBG_DISABLE_MULTICORE))
+		pipeline->core = SOF_DSP_PRIMARY_CORE;
+
+	if (sof_debug_check_flag(SOF_DBG_DYNAMIC_PIPELINES_OVERRIDE))
+		swidget->dynamic_pipeline_widget =
+			sof_debug_check_flag(SOF_DBG_DYNAMIC_PIPELINES_ENABLE);
+
+	dev_dbg(scomp->dev, "pipeline %s: period %d pri %d mips %d core %d frames %d dynamic %d\n",
+		swidget->widget->name, pipeline->period, pipeline->priority,
+		pipeline->period_mips, pipeline->core, pipeline->frames_per_sched,
+		swidget->dynamic_pipeline_widget);
+
+	swidget->core = pipeline->core;
+
+	return 0;
+
+err:
+	kfree(swidget->private);
+	swidget->private = NULL;
+
+	return ret;
+}
+
 /* token list for each topology object */
 static enum sof_tokens host_token_list[] = {
 	SOF_CORE_TOKENS,
@@ -156,11 +245,20 @@ static enum sof_tokens host_token_list[] = {
 	SOF_COMP_TOKENS,
 };
 
+static enum sof_tokens pipeline_token_list[] = {
+	SOF_CORE_TOKENS,
+	SOF_COMP_EXT_TOKENS,
+	SOF_PIPELINE_TOKENS,
+	SOF_SCHED_TOKENS,
+};
+
 static const struct sof_ipc_tplg_widget_ops tplg_ipc3_widget_ops[SND_SOC_DAPM_TYPE_COUNT] = {
 	[snd_soc_dapm_aif_in] =  {sof_ipc3_widget_setup_comp_host, sof_ipc3_widget_free_comp,
 				  host_token_list, ARRAY_SIZE(host_token_list), NULL},
 	[snd_soc_dapm_aif_out] = {sof_ipc3_widget_setup_comp_host, sof_ipc3_widget_free_comp,
 				  host_token_list, ARRAY_SIZE(host_token_list), NULL},
+	[snd_soc_dapm_scheduler] = {sof_ipc3_widget_setup_comp_pipeline, sof_ipc3_widget_free_comp,
+				    pipeline_token_list, ARRAY_SIZE(pipeline_token_list), NULL},
 };
 
 static const struct sof_ipc_tplg_ops ipc3_tplg_ops = {
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 2258317d7f57..4dd4e98e87cf 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -637,28 +637,6 @@ static const struct sof_topology_token dai_link_tokens[] = {
 		offsetof(struct sof_ipc_dai_config, dai_index)},
 };
 
-/* scheduling */
-static const struct sof_topology_token sched_tokens[] = {
-	{SOF_TKN_SCHED_PERIOD, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_pipe_new, period)},
-	{SOF_TKN_SCHED_PRIORITY, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_pipe_new, priority)},
-	{SOF_TKN_SCHED_MIPS, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_pipe_new, period_mips)},
-	{SOF_TKN_SCHED_CORE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_pipe_new, core)},
-	{SOF_TKN_SCHED_FRAMES, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_pipe_new, frames_per_sched)},
-	{SOF_TKN_SCHED_TIME_DOMAIN, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_pipe_new, time_domain)},
-};
-
-static const struct sof_topology_token pipeline_tokens[] = {
-	{SOF_TKN_SCHED_DYNAMIC_PIPELINE, SND_SOC_TPLG_TUPLE_TYPE_BOOL, get_token_u16,
-		offsetof(struct snd_sof_widget, dynamic_pipeline_widget)},
-
-};
-
 /* volume */
 static const struct sof_topology_token volume_tokens[] = {
 	{SOF_TKN_VOLUME_RAMP_STEP_TYPE, SND_SOC_TPLG_TUPLE_TYPE_WORD,
@@ -1873,81 +1851,6 @@ static int sof_widget_parse_tokens(struct snd_soc_component *scomp, struct snd_s
 	return ret;
 }
 
-/*
- * Pipeline Topology
- */
-static int sof_widget_load_pipeline(struct snd_soc_component *scomp, int index,
-				    struct snd_sof_widget *swidget,
-				    struct snd_soc_tplg_dapm_widget *tw)
-{
-	struct snd_soc_tplg_private *private = &tw->priv;
-	struct sof_ipc_pipe_new *pipeline;
-	struct snd_sof_widget *comp_swidget;
-	int ret;
-
-	pipeline = kzalloc(sizeof(*pipeline), GFP_KERNEL);
-	if (!pipeline)
-		return -ENOMEM;
-
-	/* configure dai IPC message */
-	pipeline->hdr.size = sizeof(*pipeline);
-	pipeline->hdr.cmd = SOF_IPC_GLB_TPLG_MSG | SOF_IPC_TPLG_PIPE_NEW;
-	pipeline->pipeline_id = index;
-	pipeline->comp_id = swidget->comp_id;
-
-	/* component at start of pipeline is our stream id */
-	comp_swidget = snd_sof_find_swidget(scomp, tw->sname);
-	if (!comp_swidget) {
-		dev_err(scomp->dev, "error: widget %s refers to non existent widget %s\n",
-			tw->name, tw->sname);
-		ret = -EINVAL;
-		goto err;
-	}
-
-	pipeline->sched_id = comp_swidget->comp_id;
-
-	dev_dbg(scomp->dev, "tplg: pipeline id %d comp %d scheduling comp id %d\n",
-		pipeline->pipeline_id, pipeline->comp_id, pipeline->sched_id);
-
-	ret = sof_parse_tokens(scomp, pipeline, sched_tokens,
-			       ARRAY_SIZE(sched_tokens), private->array,
-			       le32_to_cpu(private->size));
-	if (ret != 0) {
-		dev_err(scomp->dev, "error: parse pipeline tokens failed %d\n",
-			private->size);
-		goto err;
-	}
-
-	ret = sof_parse_tokens(scomp, swidget, pipeline_tokens,
-			       ARRAY_SIZE(pipeline_tokens), private->array,
-			       le32_to_cpu(private->size));
-	if (ret != 0) {
-		dev_err(scomp->dev, "error: parse dynamic pipeline token failed %d\n",
-			private->size);
-		goto err;
-	}
-
-	if (sof_debug_check_flag(SOF_DBG_DISABLE_MULTICORE))
-		pipeline->core = SOF_DSP_PRIMARY_CORE;
-
-	if (sof_debug_check_flag(SOF_DBG_DYNAMIC_PIPELINES_OVERRIDE))
-		swidget->dynamic_pipeline_widget =
-			sof_debug_check_flag(SOF_DBG_DYNAMIC_PIPELINES_ENABLE);
-
-	dev_dbg(scomp->dev, "pipeline %s: period %d pri %d mips %d core %d frames %d dynamic %d\n",
-		swidget->widget->name, pipeline->period, pipeline->priority,
-		pipeline->period_mips, pipeline->core, pipeline->frames_per_sched,
-		swidget->dynamic_pipeline_widget);
-
-	swidget->core = pipeline->core;
-	swidget->private = pipeline;
-
-	return 0;
-err:
-	kfree(pipeline);
-	return ret;
-}
-
 /*
  * Mixer topology
  */
@@ -2579,8 +2482,6 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 		ret = sof_widget_load_buffer(scomp, index, swidget, tw);
 		break;
 	case snd_soc_dapm_scheduler:
-		ret = sof_widget_load_pipeline(scomp, index, swidget, tw);
-		break;
 	case snd_soc_dapm_aif_out:
 	case snd_soc_dapm_aif_in:
 		ret = sof_widget_parse_tokens(scomp, swidget, tw,  token_list, token_list_size);
-- 
2.25.1

