Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD1A4D8DEA
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 21:10:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E10171755;
	Mon, 14 Mar 2022 21:09:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E10171755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647288626;
	bh=iaRoFYy4FnEZ37BwiDr88p/xxJXd7c3vK+pQm98Kt8E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iAwEjMFYbfIDoL1QCCBagYCuWXojEIH5/tFUSI6pBhPN2Q94N56UK/x5ZZD9IAG0j
	 s7YNOUe+YPNiaXsV+vEaSFoTpja6SVLI3avrT8rpEjjH6ODoltrcmYVHWbMR1E0cJg
	 fDhOXwuHqYYNTFbmOnxIHFYY8Oq+7LzUiQU3ncYk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6855F80568;
	Mon, 14 Mar 2022 21:06:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B9ABF8051D; Mon, 14 Mar 2022 21:05:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9903F8051B
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 21:05:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9903F8051B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TaIQQ3He"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647288348; x=1678824348;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iaRoFYy4FnEZ37BwiDr88p/xxJXd7c3vK+pQm98Kt8E=;
 b=TaIQQ3Her/+aQZWEhK337ijJLUtEvEnyNx+FSLAofA9p7SGp5FSMX9wW
 RzBkqFVI3tB1u++D09EvHT9fMLySuOuQB2uYCvlVc+5QYU9OudrFBOBaC
 qfGirStXooKGQF9tHZLadZh/1s42KjfIVvID6x8FMQ7HPojeAJ52NTH1G
 SbGr5oL//Zwoiy1S4z5NDGjfshYT7/K1ArYj3df8l8z8Wmxwyks9tIv0A
 MQpB5vU+qSu4UtmyYGuQzQBlrRfC8Kh3E3ML+AM1M3veHwrqh2aL51/Zq
 th5utBJqUQQ0ATuzxFgUKPvvCbcIjlF7L/MdE1FoWYavGD+GQzS/vsC9N w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="342563478"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="342563478"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:33 -0700
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="634339898"
Received: from pmishr1-mobl1.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.25.117])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:33 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/18] ASoC: SOF: topology: Make asrc widget parsing IPC
 agnostic
Date: Mon, 14 Mar 2022 13:05:13 -0700
Message-Id: <20220314200520.1233427-13-ranjani.sridharan@linux.intel.com>
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

Define the list of tokens pertaining to the asrc widgets, parse and
save them as part of the swidget tuples array. Once topology parsing is
complete, these tokens will be applied to create the IPC structure for the
asrc component based on the topology widget_setup op in ipc3_tplg_ops.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 65 +++++++++++++++++++++++++++++++
 sound/soc/sof/topology.c      | 72 +----------------------------------
 2 files changed, 66 insertions(+), 71 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 44ba3190e570..7dc6530efdba 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -59,6 +59,18 @@ static const struct sof_topology_token src_tokens[] = {
 		offsetof(struct sof_ipc_comp_src, sink_rate)},
 };
 
+/* ASRC */
+static const struct sof_topology_token asrc_tokens[] = {
+	{SOF_TKN_ASRC_RATE_IN, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_comp_asrc, source_rate)},
+	{SOF_TKN_ASRC_RATE_OUT, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_comp_asrc, sink_rate)},
+	{SOF_TKN_ASRC_ASYNCHRONOUS_MODE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_comp_asrc, asynchronous_mode)},
+	{SOF_TKN_ASRC_OPERATION_MODE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_comp_asrc, operation_mode)},
+};
+
 /* PCM */
 static const struct sof_topology_token pcm_tokens[] = {
 	{SOF_TKN_PCM_DMAC_CONFIG, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
@@ -98,6 +110,7 @@ static const struct sof_token_info ipc3_token_list[SOF_TOKEN_COUNT] = {
 	[SOF_BUFFER_TOKENS] = {"Buffer tokens", buffer_tokens, ARRAY_SIZE(buffer_tokens)},
 	[SOF_VOLUME_TOKENS] = {"Volume tokens", volume_tokens, ARRAY_SIZE(volume_tokens)},
 	[SOF_SRC_TOKENS] = {"SRC tokens", src_tokens, ARRAY_SIZE(src_tokens)},
+	[SOF_ASRC_TOKENS] = {"ASRC tokens", asrc_tokens, ARRAY_SIZE(asrc_tokens)},
 };
 
 /**
@@ -374,6 +387,49 @@ static int sof_ipc3_widget_setup_comp_src(struct snd_sof_widget *swidget)
 	return ret;
 }
 
+static int sof_ipc3_widget_setup_comp_asrc(struct snd_sof_widget *swidget)
+{
+	struct snd_soc_component *scomp = swidget->scomp;
+	struct sof_ipc_comp_asrc *asrc;
+	size_t ipc_size = sizeof(*asrc);
+	int ret;
+
+	asrc = sof_comp_alloc(swidget, &ipc_size, swidget->pipeline_id);
+	if (!asrc)
+		return -ENOMEM;
+
+	swidget->private = asrc;
+
+	/* configure ASRC IPC message */
+	asrc->comp.type = SOF_COMP_ASRC;
+	asrc->config.hdr.size = sizeof(asrc->config);
+
+	/* parse one set of asrc tokens */
+	ret = sof_update_ipc_object(scomp, asrc, SOF_ASRC_TOKENS, swidget->tuples,
+				    swidget->num_tuples, sizeof(*asrc), 1);
+	if (ret < 0)
+		goto err;
+
+	/* parse one set of comp tokens */
+	ret = sof_update_ipc_object(scomp, &asrc->config, SOF_COMP_TOKENS,
+				    swidget->tuples, swidget->num_tuples, sizeof(asrc->config), 1);
+	if (ret < 0)
+		goto err;
+
+	dev_dbg(scomp->dev, "asrc %s: source rate %d sink rate %d asynch %d operation %d\n",
+		swidget->widget->name, asrc->source_rate, asrc->sink_rate,
+		asrc->asynchronous_mode, asrc->operation_mode);
+
+	sof_dbg_comp_config(scomp, &asrc->config);
+
+	return 0;
+err:
+	kfree(swidget->private);
+	swidget->private = NULL;
+
+	return ret;
+}
+
 /*
  * Mux topology
  */
@@ -494,6 +550,13 @@ static enum sof_tokens pipeline_token_list[] = {
 	SOF_SCHED_TOKENS,
 };
 
+static enum sof_tokens asrc_token_list[] = {
+	SOF_CORE_TOKENS,
+	SOF_COMP_EXT_TOKENS,
+	SOF_ASRC_TOKENS,
+	SOF_COMP_TOKENS,
+};
+
 static enum sof_tokens src_token_list[] = {
 	SOF_CORE_TOKENS,
 	SOF_COMP_EXT_TOKENS,
@@ -520,6 +583,8 @@ static const struct sof_ipc_tplg_widget_ops tplg_ipc3_widget_ops[SND_SOC_DAPM_TY
 				NULL},
 	[snd_soc_dapm_src] = {sof_ipc3_widget_setup_comp_src, sof_ipc3_widget_free_comp,
 			      src_token_list, ARRAY_SIZE(src_token_list), NULL},
+	[snd_soc_dapm_asrc] = {sof_ipc3_widget_setup_comp_asrc, sof_ipc3_widget_free_comp,
+			       asrc_token_list, ARRAY_SIZE(asrc_token_list), NULL},
 	[snd_soc_dapm_scheduler] = {sof_ipc3_widget_setup_comp_pipeline, sof_ipc3_widget_free_comp,
 				    pipeline_token_list, ARRAY_SIZE(pipeline_token_list), NULL},
 	[snd_soc_dapm_pga] = {sof_ipc3_widget_setup_comp_pga, sof_ipc3_widget_free_comp,
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index f41bf7dfbd02..94449ed370af 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -629,20 +629,6 @@ static const struct sof_topology_token dai_link_tokens[] = {
 		offsetof(struct sof_ipc_dai_config, dai_index)},
 };
 
-/* ASRC */
-static const struct sof_topology_token asrc_tokens[] = {
-	{SOF_TKN_ASRC_RATE_IN, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_comp_asrc, source_rate)},
-	{SOF_TKN_ASRC_RATE_OUT, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_comp_asrc, sink_rate)},
-	{SOF_TKN_ASRC_ASYNCHRONOUS_MODE, SND_SOC_TPLG_TUPLE_TYPE_WORD,
-		get_token_u32,
-		offsetof(struct sof_ipc_comp_asrc, asynchronous_mode)},
-	{SOF_TKN_ASRC_OPERATION_MODE, SND_SOC_TPLG_TUPLE_TYPE_WORD,
-		get_token_u32,
-		offsetof(struct sof_ipc_comp_asrc, operation_mode)},
-};
-
 /* Tone */
 static const struct sof_topology_token tone_tokens[] = {
 };
@@ -1784,60 +1770,6 @@ static int sof_widget_parse_tokens(struct snd_soc_component *scomp, struct snd_s
 	return ret;
 }
 
-/*
- * ASRC Topology
- */
-
-static int sof_widget_load_asrc(struct snd_soc_component *scomp, int index,
-				struct snd_sof_widget *swidget,
-				struct snd_soc_tplg_dapm_widget *tw)
-{
-	struct snd_soc_tplg_private *private = &tw->priv;
-	struct sof_ipc_comp_asrc *asrc;
-	size_t ipc_size = sizeof(*asrc);
-	int ret;
-
-	asrc = (struct sof_ipc_comp_asrc *)
-	       sof_comp_alloc(swidget, &ipc_size, index);
-	if (!asrc)
-		return -ENOMEM;
-
-	/* configure ASRC IPC message */
-	asrc->comp.type = SOF_COMP_ASRC;
-	asrc->config.hdr.size = sizeof(asrc->config);
-
-	ret = sof_parse_tokens(scomp, asrc, asrc_tokens,
-			       ARRAY_SIZE(asrc_tokens), private->array,
-			       le32_to_cpu(private->size));
-	if (ret != 0) {
-		dev_err(scomp->dev, "error: parse asrc tokens failed %d\n",
-			private->size);
-		goto err;
-	}
-
-	ret = sof_parse_tokens(scomp, &asrc->config, comp_tokens,
-			       ARRAY_SIZE(comp_tokens), private->array,
-			       le32_to_cpu(private->size));
-	if (ret != 0) {
-		dev_err(scomp->dev, "error: parse asrc.cfg tokens failed %d\n",
-			le32_to_cpu(private->size));
-		goto err;
-	}
-
-	dev_dbg(scomp->dev, "asrc %s: source rate %d sink rate %d "
-		"asynch %d operation %d\n",
-		swidget->widget->name, asrc->source_rate, asrc->sink_rate,
-		asrc->asynchronous_mode, asrc->operation_mode);
-	sof_dbg_comp_config(scomp, &asrc->config);
-
-	swidget->private = asrc;
-
-	return 0;
-err:
-	kfree(asrc);
-	return ret;
-}
-
 /*
  * Signal Generator Topology
  */
@@ -2219,13 +2151,11 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 	case snd_soc_dapm_aif_out:
 	case snd_soc_dapm_aif_in:
 	case snd_soc_dapm_src:
+	case snd_soc_dapm_asrc:
 	case snd_soc_dapm_mux:
 	case snd_soc_dapm_demux:
 		ret = sof_widget_parse_tokens(scomp, swidget, tw,  token_list, token_list_size);
 		break;
-	case snd_soc_dapm_asrc:
-		ret = sof_widget_load_asrc(scomp, index, swidget, tw);
-		break;
 	case snd_soc_dapm_siggen:
 		ret = sof_widget_load_siggen(scomp, index, swidget, tw);
 		break;
-- 
2.25.1

