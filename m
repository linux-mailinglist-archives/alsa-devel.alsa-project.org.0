Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D81B4D8DE5
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 21:09:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D853189C;
	Mon, 14 Mar 2022 21:09:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D853189C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647288591;
	bh=7Q8YP3IiZPAWOO+benVq2T2wSSIZzIILNOt5YGoW1vA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gne7vYxPOrQuOtOS6Dnev0IL+Gj1TyKC7uUMsOBXCOKCm/McgGgH+BPSPwg2nN14s
	 6IlLTionS8Or7MHQu4Bkr0vZUmr6HDUJA94Wu8B/y4NxTFPISQkxrKBrSkyDV2LGxL
	 gJHKNbrQM71UP4BFsdR6B03bPAq/AeeLMZe551Tg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFEF7F80553;
	Mon, 14 Mar 2022 21:06:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 740FDF8053B; Mon, 14 Mar 2022 21:05:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B2E2F8051D
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 21:05:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B2E2F8051D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TgXAjXxd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647288347; x=1678824347;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7Q8YP3IiZPAWOO+benVq2T2wSSIZzIILNOt5YGoW1vA=;
 b=TgXAjXxd9MEvS7FAzK+Rq1Mwrc/we+Fr/wOPLHiBrvrh1KDl4f0KWmlx
 LoKXzAJf9FHWGv2ggpA/Whj/wMgU7ifWarZMPleF1bFepmu+uFNChD5sB
 S1zDYi/sQnJ+8mbwGADWeq19Qs2sG3QKg7ii8GpOSirNNzDOuiyEpaO3o
 GRKFvmQr1xlwW2tNCMI9Hatn0d1tTPlHWajXpVDgrbCn8fwLHjpBt5D3N
 S9zcLMLKmZuW2rB6HQuY8d6StYJ12ZZPjukifPCaWbP/xDLNFzfu0hGTM
 ke67OB8SgHU+GP3nUcYz7sCgh/WWCcpLjGxI8INNCZuCjYLJvHPXMMyEz w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="342563477"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="342563477"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:33 -0700
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="634339897"
Received: from pmishr1-mobl1.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.25.117])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:33 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/18] ASoC: SOF: topology: Make src widget parsing IPC
 agnostic
Date: Mon, 14 Mar 2022 13:05:12 -0700
Message-Id: <20220314200520.1233427-12-ranjani.sridharan@linux.intel.com>
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

Define the list of tokens pertaining to the src widgets, parse and
save them as part of the swidget tuples array. Once topology parsing is
complete, these tokens will be applied to create the IPC structure for the
src component based on the topology widget_setup op in ipc3_tplg_ops.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 59 ++++++++++++++++++++++++++++++++
 sound/soc/sof/topology.c      | 64 +----------------------------------
 2 files changed, 60 insertions(+), 63 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 5501a18babaf..44ba3190e570 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -51,6 +51,14 @@ static const struct sof_topology_token volume_tokens[] = {
 		offsetof(struct sof_ipc_comp_volume, initial_ramp)},
 };
 
+/* SRC */
+static const struct sof_topology_token src_tokens[] = {
+	{SOF_TKN_SRC_RATE_IN, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_comp_src, source_rate)},
+	{SOF_TKN_SRC_RATE_OUT, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_comp_src, sink_rate)},
+};
+
 /* PCM */
 static const struct sof_topology_token pcm_tokens[] = {
 	{SOF_TKN_PCM_DMAC_CONFIG, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
@@ -89,6 +97,7 @@ static const struct sof_token_info ipc3_token_list[SOF_TOKEN_COUNT] = {
 	[SOF_COMP_EXT_TOKENS] = {"AFE tokens", comp_ext_tokens, ARRAY_SIZE(comp_ext_tokens)},
 	[SOF_BUFFER_TOKENS] = {"Buffer tokens", buffer_tokens, ARRAY_SIZE(buffer_tokens)},
 	[SOF_VOLUME_TOKENS] = {"Volume tokens", volume_tokens, ARRAY_SIZE(volume_tokens)},
+	[SOF_SRC_TOKENS] = {"SRC tokens", src_tokens, ARRAY_SIZE(src_tokens)},
 };
 
 /**
@@ -324,6 +333,47 @@ static int sof_ipc3_widget_setup_comp_buffer(struct snd_sof_widget *swidget)
 	return 0;
 }
 
+static int sof_ipc3_widget_setup_comp_src(struct snd_sof_widget *swidget)
+{
+	struct snd_soc_component *scomp = swidget->scomp;
+	struct sof_ipc_comp_src *src;
+	size_t ipc_size = sizeof(*src);
+	int ret;
+
+	src = sof_comp_alloc(swidget, &ipc_size, swidget->pipeline_id);
+	if (!src)
+		return -ENOMEM;
+
+	swidget->private = src;
+
+	/* configure src IPC message */
+	src->comp.type = SOF_COMP_SRC;
+	src->config.hdr.size = sizeof(src->config);
+
+	/* parse one set of src tokens */
+	ret = sof_update_ipc_object(scomp, src, SOF_SRC_TOKENS, swidget->tuples,
+				    swidget->num_tuples, sizeof(*src), 1);
+	if (ret < 0)
+		goto err;
+
+	/* parse one set of comp tokens */
+	ret = sof_update_ipc_object(scomp, &src->config, SOF_COMP_TOKENS,
+				    swidget->tuples, swidget->num_tuples, sizeof(src->config), 1);
+	if (ret < 0)
+		goto err;
+
+	dev_dbg(scomp->dev, "src %s: source rate %d sink rate %d\n",
+		swidget->widget->name, src->source_rate, src->sink_rate);
+	sof_dbg_comp_config(scomp, &src->config);
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
@@ -444,6 +494,13 @@ static enum sof_tokens pipeline_token_list[] = {
 	SOF_SCHED_TOKENS,
 };
 
+static enum sof_tokens src_token_list[] = {
+	SOF_CORE_TOKENS,
+	SOF_COMP_EXT_TOKENS,
+	SOF_SRC_TOKENS,
+	SOF_COMP_TOKENS
+};
+
 static enum sof_tokens pga_token_list[] = {
 	SOF_CORE_TOKENS,
 	SOF_COMP_EXT_TOKENS,
@@ -461,6 +518,8 @@ static const struct sof_ipc_tplg_widget_ops tplg_ipc3_widget_ops[SND_SOC_DAPM_TY
 	[snd_soc_dapm_mixer] = {sof_ipc3_widget_setup_comp_mixer, sof_ipc3_widget_free_comp,
 				comp_generic_token_list, ARRAY_SIZE(comp_generic_token_list),
 				NULL},
+	[snd_soc_dapm_src] = {sof_ipc3_widget_setup_comp_src, sof_ipc3_widget_free_comp,
+			      src_token_list, ARRAY_SIZE(src_token_list), NULL},
 	[snd_soc_dapm_scheduler] = {sof_ipc3_widget_setup_comp_pipeline, sof_ipc3_widget_free_comp,
 				    pipeline_token_list, ARRAY_SIZE(pipeline_token_list), NULL},
 	[snd_soc_dapm_pga] = {sof_ipc3_widget_setup_comp_pga, sof_ipc3_widget_free_comp,
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 42da7b8e7180..f41bf7dfbd02 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -629,14 +629,6 @@ static const struct sof_topology_token dai_link_tokens[] = {
 		offsetof(struct sof_ipc_dai_config, dai_index)},
 };
 
-/* SRC */
-static const struct sof_topology_token src_tokens[] = {
-	{SOF_TKN_SRC_RATE_IN, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_comp_src, source_rate)},
-	{SOF_TKN_SRC_RATE_OUT, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc_comp_src, sink_rate)},
-};
-
 /* ASRC */
 static const struct sof_topology_token asrc_tokens[] = {
 	{SOF_TKN_ASRC_RATE_IN, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
@@ -1792,58 +1784,6 @@ static int sof_widget_parse_tokens(struct snd_soc_component *scomp, struct snd_s
 	return ret;
 }
 
-/*
- * SRC Topology
- */
-
-static int sof_widget_load_src(struct snd_soc_component *scomp, int index,
-			       struct snd_sof_widget *swidget,
-			       struct snd_soc_tplg_dapm_widget *tw)
-{
-	struct snd_soc_tplg_private *private = &tw->priv;
-	struct sof_ipc_comp_src *src;
-	size_t ipc_size = sizeof(*src);
-	int ret;
-
-	src = (struct sof_ipc_comp_src *)
-	      sof_comp_alloc(swidget, &ipc_size, index);
-	if (!src)
-		return -ENOMEM;
-
-	/* configure src IPC message */
-	src->comp.type = SOF_COMP_SRC;
-	src->config.hdr.size = sizeof(src->config);
-
-	ret = sof_parse_tokens(scomp, src, src_tokens,
-			       ARRAY_SIZE(src_tokens), private->array,
-			       le32_to_cpu(private->size));
-	if (ret != 0) {
-		dev_err(scomp->dev, "error: parse src tokens failed %d\n",
-			private->size);
-		goto err;
-	}
-
-	ret = sof_parse_tokens(scomp, &src->config, comp_tokens,
-			       ARRAY_SIZE(comp_tokens), private->array,
-			       le32_to_cpu(private->size));
-	if (ret != 0) {
-		dev_err(scomp->dev, "error: parse src.cfg tokens failed %d\n",
-			le32_to_cpu(private->size));
-		goto err;
-	}
-
-	dev_dbg(scomp->dev, "src %s: source rate %d sink rate %d\n",
-		swidget->widget->name, src->source_rate, src->sink_rate);
-	sof_dbg_comp_config(scomp, &src->config);
-
-	swidget->private = src;
-
-	return 0;
-err:
-	kfree(src);
-	return ret;
-}
-
 /*
  * ASRC Topology
  */
@@ -2278,13 +2218,11 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 	case snd_soc_dapm_scheduler:
 	case snd_soc_dapm_aif_out:
 	case snd_soc_dapm_aif_in:
+	case snd_soc_dapm_src:
 	case snd_soc_dapm_mux:
 	case snd_soc_dapm_demux:
 		ret = sof_widget_parse_tokens(scomp, swidget, tw,  token_list, token_list_size);
 		break;
-	case snd_soc_dapm_src:
-		ret = sof_widget_load_src(scomp, index, swidget, tw);
-		break;
 	case snd_soc_dapm_asrc:
 		ret = sof_widget_load_asrc(scomp, index, swidget, tw);
 		break;
-- 
2.25.1

