Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 842814D8DE1
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 21:09:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AFC7174F;
	Mon, 14 Mar 2022 21:08:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AFC7174F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647288546;
	bh=MF/NrejJ9f0K+Zj2qwVH2Hg8IO/qPb32lo2W44pYOtE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=shPV8SZXJ1KHCrISeIrKWPZS7aX9L+lh4km1OjbO5hVwknkF7FOKCKPV3f1Qu27hi
	 7WPJEdIC6rYpPUKoHdfz4xGAS4UP+IuvqIdH9n8id0Rc9bmwgL1LuTrlpt7SnQ4w1a
	 HvlYMAj/J3ufohGwLImn2Hjhdz+SejKSiaQEMH2w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61F1DF80544;
	Mon, 14 Mar 2022 21:06:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61FA7F80533; Mon, 14 Mar 2022 21:05:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1097BF8012C
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 21:05:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1097BF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FMUFdEMW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647288345; x=1678824345;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MF/NrejJ9f0K+Zj2qwVH2Hg8IO/qPb32lo2W44pYOtE=;
 b=FMUFdEMWY6UOakuYYxHjw8hLclHIx5ko99f1yw0QFThg+FvO+UGqrH1P
 YegjbRdtk+RfLsRBOQd3ACUYVEB9W/qRVplcYjktQBi/7EBRQaxYaML6M
 a4V1l8SyLsX7Kh0vjLd/1d+JLYyXf1cyHjTuhgINMgPMh1Tr3ovgakmkB
 B+ewcBvs+LPxZCN5Mh41fyM+jg8A0g3xUilGnjvVNP8ZOvFPKT8E9OJ5q
 AB9hZ6sZY9BkX2wJbBalwR6XZy4PIGCyXK1NxmQoQGZ+LL9LeV9HkJ2qJ
 ZG+UV3Q3oDp/wy96nU0YiKCjF+1q8q42q2OM3xLA6fyIZ5yQ9Dx86lAu+ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="342563474"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="342563474"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:33 -0700
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="634339894"
Received: from pmishr1-mobl1.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.25.117])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:33 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/18] ASoC: SOF: topology: Make pga widget parsing IPC
 agnostic
Date: Mon, 14 Mar 2022 13:05:09 -0700
Message-Id: <20220314200520.1233427-9-ranjani.sridharan@linux.intel.com>
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

Define the list of tokens pertaining to the pga type widgets, parse and
save them as part of the swidget tuples array. Once topology parsing is
complete, these tokens will be applied to create the IPC structure for the
pga component based on the topology widget_setup op in ipc3_tplg_ops.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 78 ++++++++++++++++++++++++++++++
 sound/soc/sof/topology.c      | 91 +++--------------------------------
 2 files changed, 86 insertions(+), 83 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index e05d6b816fac..517ba84eb4c4 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -43,6 +43,14 @@ static const struct sof_topology_token pipeline_tokens[] = {
 
 };
 
+/* volume */
+static const struct sof_topology_token volume_tokens[] = {
+	{SOF_TKN_VOLUME_RAMP_STEP_TYPE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_comp_volume, ramp)},
+	{SOF_TKN_VOLUME_RAMP_STEP_MS, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_comp_volume, initial_ramp)},
+};
+
 /* PCM */
 static const struct sof_topology_token pcm_tokens[] = {
 	{SOF_TKN_PCM_DMAC_CONFIG, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
@@ -80,6 +88,7 @@ static const struct sof_token_info ipc3_token_list[SOF_TOKEN_COUNT] = {
 	[SOF_CORE_TOKENS] = {"Core tokens", core_tokens, ARRAY_SIZE(core_tokens)},
 	[SOF_COMP_EXT_TOKENS] = {"AFE tokens", comp_ext_tokens, ARRAY_SIZE(comp_ext_tokens)},
 	[SOF_BUFFER_TOKENS] = {"Buffer tokens", buffer_tokens, ARRAY_SIZE(buffer_tokens)},
+	[SOF_VOLUME_TOKENS] = {"Volume tokens", volume_tokens, ARRAY_SIZE(volume_tokens)},
 };
 
 /**
@@ -281,6 +290,66 @@ static int sof_ipc3_widget_setup_comp_buffer(struct snd_sof_widget *swidget)
 	return 0;
 }
 
+/*
+ * PGA Topology
+ */
+
+static int sof_ipc3_widget_setup_comp_pga(struct snd_sof_widget *swidget)
+{
+	struct snd_soc_component *scomp = swidget->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct sof_ipc_comp_volume *volume;
+	struct snd_sof_control *scontrol;
+	size_t ipc_size = sizeof(*volume);
+	int min_step, max_step;
+	int ret;
+
+	volume = sof_comp_alloc(swidget, &ipc_size, swidget->pipeline_id);
+	if (!volume)
+		return -ENOMEM;
+
+	swidget->private = volume;
+
+	/* configure volume IPC message */
+	volume->comp.type = SOF_COMP_VOLUME;
+	volume->config.hdr.size = sizeof(volume->config);
+
+	/* parse one set of volume tokens */
+	ret = sof_update_ipc_object(scomp, volume, SOF_VOLUME_TOKENS, swidget->tuples,
+				    swidget->num_tuples, sizeof(*volume), 1);
+	if (ret < 0)
+		goto err;
+
+	/* parse one set of comp tokens */
+	ret = sof_update_ipc_object(scomp, &volume->config, SOF_COMP_TOKENS,
+				    swidget->tuples, swidget->num_tuples,
+				    sizeof(volume->config), 1);
+	if (ret < 0)
+		goto err;
+
+	dev_dbg(scomp->dev, "loaded PGA %s\n", swidget->widget->name);
+	sof_dbg_comp_config(scomp, &volume->config);
+
+	list_for_each_entry(scontrol, &sdev->kcontrol_list, list) {
+		if (scontrol->comp_id == swidget->comp_id &&
+		    scontrol->volume_table) {
+			min_step = scontrol->min_volume_step;
+			max_step = scontrol->max_volume_step;
+			volume->min_value = scontrol->volume_table[min_step];
+			volume->max_value = scontrol->volume_table[max_step];
+			volume->channels = scontrol->num_channels;
+			break;
+		}
+	}
+
+	return 0;
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
@@ -300,6 +369,13 @@ static enum sof_tokens pipeline_token_list[] = {
 	SOF_SCHED_TOKENS,
 };
 
+static enum sof_tokens pga_token_list[] = {
+	SOF_CORE_TOKENS,
+	SOF_COMP_EXT_TOKENS,
+	SOF_VOLUME_TOKENS,
+	SOF_COMP_TOKENS,
+};
+
 static const struct sof_ipc_tplg_widget_ops tplg_ipc3_widget_ops[SND_SOC_DAPM_TYPE_COUNT] = {
 	[snd_soc_dapm_aif_in] =  {sof_ipc3_widget_setup_comp_host, sof_ipc3_widget_free_comp,
 				  host_token_list, ARRAY_SIZE(host_token_list), NULL},
@@ -309,6 +385,8 @@ static const struct sof_ipc_tplg_widget_ops tplg_ipc3_widget_ops[SND_SOC_DAPM_TY
 				 buffer_token_list, ARRAY_SIZE(buffer_token_list), NULL},
 	[snd_soc_dapm_scheduler] = {sof_ipc3_widget_setup_comp_pipeline, sof_ipc3_widget_free_comp,
 				    pipeline_token_list, ARRAY_SIZE(pipeline_token_list), NULL},
+	[snd_soc_dapm_pga] = {sof_ipc3_widget_setup_comp_pga, sof_ipc3_widget_free_comp,
+			      pga_token_list, ARRAY_SIZE(pga_token_list), NULL},
 };
 
 static const struct sof_ipc_tplg_ops ipc3_tplg_ops = {
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 88214ec2df5a..bd62658629f5 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -629,15 +629,6 @@ static const struct sof_topology_token dai_link_tokens[] = {
 		offsetof(struct sof_ipc_dai_config, dai_index)},
 };
 
-/* volume */
-static const struct sof_topology_token volume_tokens[] = {
-	{SOF_TKN_VOLUME_RAMP_STEP_TYPE, SND_SOC_TPLG_TUPLE_TYPE_WORD,
-		get_token_u32, offsetof(struct sof_ipc_comp_volume, ramp)},
-	{SOF_TKN_VOLUME_RAMP_STEP_MS,
-		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_comp_volume, initial_ramp)},
-};
-
 /* SRC */
 static const struct sof_topology_token src_tokens[] = {
 	{SOF_TKN_SRC_RATE_IN, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
@@ -1878,78 +1869,6 @@ static int sof_widget_load_mux(struct snd_soc_component *scomp, int index,
 	return 0;
 }
 
-/*
- * PGA Topology
- */
-
-static int sof_widget_load_pga(struct snd_soc_component *scomp, int index,
-			       struct snd_sof_widget *swidget,
-			       struct snd_soc_tplg_dapm_widget *tw)
-{
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	struct snd_soc_tplg_private *private = &tw->priv;
-	struct sof_ipc_comp_volume *volume;
-	struct snd_sof_control *scontrol;
-	size_t ipc_size = sizeof(*volume);
-	int min_step;
-	int max_step;
-	int ret;
-
-	volume = (struct sof_ipc_comp_volume *)
-		 sof_comp_alloc(swidget, &ipc_size, index);
-	if (!volume)
-		return -ENOMEM;
-
-	if (!le32_to_cpu(tw->num_kcontrols)) {
-		dev_err(scomp->dev, "error: invalid kcontrol count %d for volume\n",
-			tw->num_kcontrols);
-		ret = -EINVAL;
-		goto err;
-	}
-
-	/* configure volume IPC message */
-	volume->comp.type = SOF_COMP_VOLUME;
-	volume->config.hdr.size = sizeof(volume->config);
-
-	ret = sof_parse_tokens(scomp, volume, volume_tokens,
-			       ARRAY_SIZE(volume_tokens), private->array,
-			       le32_to_cpu(private->size));
-	if (ret != 0) {
-		dev_err(scomp->dev, "error: parse volume tokens failed %d\n",
-			private->size);
-		goto err;
-	}
-	ret = sof_parse_tokens(scomp, &volume->config, comp_tokens,
-			       ARRAY_SIZE(comp_tokens), private->array,
-			       le32_to_cpu(private->size));
-	if (ret != 0) {
-		dev_err(scomp->dev, "error: parse volume.cfg tokens failed %d\n",
-			le32_to_cpu(private->size));
-		goto err;
-	}
-
-	sof_dbg_comp_config(scomp, &volume->config);
-
-	swidget->private = volume;
-
-	list_for_each_entry(scontrol, &sdev->kcontrol_list, list) {
-		if (scontrol->comp_id == swidget->comp_id &&
-		    scontrol->volume_table) {
-			min_step = scontrol->min_volume_step;
-			max_step = scontrol->max_volume_step;
-			volume->min_value = scontrol->volume_table[min_step];
-			volume->max_value = scontrol->volume_table[max_step];
-			volume->channels = scontrol->num_channels;
-			break;
-		}
-	}
-
-	return 0;
-err:
-	kfree(volume);
-	return ret;
-}
-
 /*
  * SRC Topology
  */
@@ -2426,8 +2345,14 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 		ret = sof_widget_load_mixer(scomp, index, swidget, tw);
 		break;
 	case snd_soc_dapm_pga:
-		ret = sof_widget_load_pga(scomp, index, swidget, tw);
-		break;
+		if (!le32_to_cpu(tw->num_kcontrols)) {
+			dev_err(scomp->dev, "invalid kcontrol count %d for volume\n",
+				tw->num_kcontrols);
+			ret = -EINVAL;
+			break;
+		}
+
+		fallthrough;
 	case snd_soc_dapm_buffer:
 	case snd_soc_dapm_scheduler:
 	case snd_soc_dapm_aif_out:
-- 
2.25.1

