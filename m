Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C858F6B7808
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 13:50:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A147147A;
	Mon, 13 Mar 2023 13:50:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A147147A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678711854;
	bh=6lx+IDN7Vg0u/rxrZaaPYDHqLUGeCU+443PdxZesOfg=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YgY4kBUFdbsAPngadFyVlyiUY/sOG9WNV2UfRk8Cbptovq/jYFZUlErtnVBCtI2+z
	 yP3fezWIYtm4cf9BVvhRpf5BGrhNz9lbmLHqLgr0MVKlxlS7ofMVJtwisBvPjjEYVd
	 deF9tGyF31OFQYPU0PK4IF+KkE2opV6wPIAxkR9I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 968B2F80529;
	Mon, 13 Mar 2023 13:49:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AF4DF8052E; Mon, 13 Mar 2023 13:49:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40D15F80482
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 13:49:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40D15F80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SRDNobR3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678711744; x=1710247744;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6lx+IDN7Vg0u/rxrZaaPYDHqLUGeCU+443PdxZesOfg=;
  b=SRDNobR3lBsworW/CSsOSqbe4q8iOd/xOMsoW/MWtzDvNpkqwciGjVe7
   pbjMuWF0WuNjUIvvO48DaVErAz1g1U4uJNQltcpakqxLWlfMMM32Ndgbi
   vSc4EaqqGYvE6uty+nrSU7zdVdhrTZi2yYwPI0Nm4bLeLxGjrswwDVhO+
   gY8rPtoObVX7G9W18VUIDGswPLgJLCdmkzHDrihKBLTZosigYms7Bf2Pg
   8tNeOHCTucuBp9W1FzDkdv5JDbT4jcu3gFJP5MgJwgq+VOr/79CoQZyPk
   su3P9PfYLVDoDUXxrQ/f4y7CLfcIyS+wa0f+BrnSeg3DibRnkY6rEEtzd
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="399728070"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="399728070"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 05:48:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="711116426"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="711116426"
Received: from tchambon-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.43.68])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 05:48:43 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 04/11] ASoC: SOF: ipc4-topology: Do not parse the
 DMA_BUFFER_SIZE token
Date: Mon, 13 Mar 2023 14:48:49 +0200
Message-Id: <20230313124856.8140-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313124856.8140-1-peter.ujfalusi@linux.intel.com>
References: <20230313124856.8140-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AHIRCUUDR5GK6SLFZABED2XHPL4JWXYN
X-Message-ID-Hash: AHIRCUUDR5GK6SLFZABED2XHPL4JWXYN
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AHIRCUUDR5GK6SLFZABED2XHPL4JWXYN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Do not parse the SOF_TKN_CAVS_AUDIO_FORMAT_DMA_BUFFER_SIZE token as the
dma_buffer_size can be derived from the input/output buffer size and the
type of widget during copier prepare. For the deep buffer case,
introduce a new token that will be used to get the deep buffer DMA size
for the host copier from topology.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/uapi/sound/sof/tokens.h |   1 +
 sound/soc/sof/ipc4-topology.c   | 112 ++++++++++++++------------------
 sound/soc/sof/ipc4-topology.h   |   5 +-
 sound/soc/sof/sof-audio.h       |   2 +-
 sound/soc/sof/topology.c        |   1 -
 5 files changed, 52 insertions(+), 69 deletions(-)

diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index 0b5110427132..9e91e2640dd4 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -197,6 +197,7 @@
 
 /* COPIER */
 #define SOF_TKN_INTEL_COPIER_NODE_TYPE		1980
+#define SOF_TKN_INTEL_COPIER_DEEP_BUFFER_DMA_MS	1981
 
 /* ACP I2S */
 #define SOF_TKN_AMD_ACPI2S_RATE			1700
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index d56e0f12b5d0..50cd4fe3141c 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -78,8 +78,8 @@ static const struct sof_topology_token ipc4_out_audio_format_tokens[] = {
 		offsetof(struct sof_ipc4_audio_format, fmt_cfg)},
 };
 
-static const struct sof_topology_token ipc4_copier_gateway_cfg_tokens[] = {
-	{SOF_TKN_CAVS_AUDIO_FORMAT_DMA_BUFFER_SIZE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32, 0},
+static const struct sof_topology_token ipc4_copier_deep_buffer_tokens[] = {
+	{SOF_TKN_INTEL_COPIER_DEEP_BUFFER_DMA_MS, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32, 0},
 };
 
 static const struct sof_topology_token ipc4_copier_tokens[] = {
@@ -138,8 +138,8 @@ static const struct sof_token_info ipc4_token_list[SOF_TOKEN_COUNT] = {
 	[SOF_AUDIO_FORMAT_BUFFER_SIZE_TOKENS] = {"IPC4 Audio format buffer size tokens",
 		ipc4_audio_format_buffer_size_tokens,
 		ARRAY_SIZE(ipc4_audio_format_buffer_size_tokens)},
-	[SOF_COPIER_GATEWAY_CFG_TOKENS] = {"IPC4 Copier gateway config tokens",
-		ipc4_copier_gateway_cfg_tokens, ARRAY_SIZE(ipc4_copier_gateway_cfg_tokens)},
+	[SOF_COPIER_DEEP_BUFFER_TOKENS] = {"IPC4 Copier deep buffer tokens",
+		ipc4_copier_deep_buffer_tokens, ARRAY_SIZE(ipc4_copier_deep_buffer_tokens)},
 	[SOF_COPIER_TOKENS] = {"IPC4 Copier tokens", ipc4_copier_tokens,
 		ARRAY_SIZE(ipc4_copier_tokens)},
 	[SOF_AUDIO_FMT_NUM_TOKENS] = {"IPC4 Audio format number tokens",
@@ -348,7 +348,7 @@ static int sof_ipc4_widget_setup_pcm(struct snd_sof_widget *swidget)
 	struct snd_soc_component *scomp = swidget->scomp;
 	struct sof_ipc4_copier *ipc4_copier;
 	int node_type = 0;
-	int ret, i;
+	int ret;
 
 	ipc4_copier = kzalloc(sizeof(*ipc4_copier), GFP_KERNEL);
 	if (!ipc4_copier)
@@ -363,13 +363,6 @@ static int sof_ipc4_widget_setup_pcm(struct snd_sof_widget *swidget)
 	if (ret)
 		goto free_copier;
 
-	available_fmt->dma_buffer_size = kcalloc(available_fmt->audio_fmt_num, sizeof(u32),
-						 GFP_KERNEL);
-	if (!available_fmt->dma_buffer_size) {
-		ret = -ENOMEM;
-		goto free_available_fmt;
-	}
-
 	/*
 	 * This callback is used by host copier and module-to-module copier,
 	 * and only host copier needs to set gtw_cfg.
@@ -377,21 +370,6 @@ static int sof_ipc4_widget_setup_pcm(struct snd_sof_widget *swidget)
 	if (!WIDGET_IS_AIF(swidget->id))
 		goto skip_gtw_cfg;
 
-	ret = sof_update_ipc_object(scomp, available_fmt->dma_buffer_size,
-				    SOF_COPIER_GATEWAY_CFG_TOKENS, swidget->tuples,
-				    swidget->num_tuples, sizeof(u32),
-				    available_fmt->audio_fmt_num);
-	if (ret) {
-		dev_err(scomp->dev, "Failed to parse dma buffer size in audio format for %s\n",
-			swidget->widget->name);
-		goto err;
-	}
-
-	dev_dbg(scomp->dev, "dma buffer size:\n");
-	for (i = 0; i < available_fmt->audio_fmt_num; i++)
-		dev_dbg(scomp->dev, "%d: %u\n", i,
-			available_fmt->dma_buffer_size[i]);
-
 	ret = sof_update_ipc_object(scomp, &node_type,
 				    SOF_COPIER_TOKENS, swidget->tuples,
 				    swidget->num_tuples, sizeof(node_type), 1);
@@ -399,7 +377,7 @@ static int sof_ipc4_widget_setup_pcm(struct snd_sof_widget *swidget)
 	if (ret) {
 		dev_err(scomp->dev, "parse host copier node type token failed %d\n",
 			ret);
-		goto err;
+		goto free_available_fmt;
 	}
 	dev_dbg(scomp->dev, "host copier '%s' node_type %u\n", swidget->widget->name, node_type);
 
@@ -407,7 +385,7 @@ static int sof_ipc4_widget_setup_pcm(struct snd_sof_widget *swidget)
 	ipc4_copier->gtw_attr = kzalloc(sizeof(*ipc4_copier->gtw_attr), GFP_KERNEL);
 	if (!ipc4_copier->gtw_attr) {
 		ret = -ENOMEM;
-		goto err;
+		goto free_available_fmt;
 	}
 
 	ipc4_copier->copier_config = (uint32_t *)ipc4_copier->gtw_attr;
@@ -438,8 +416,6 @@ static int sof_ipc4_widget_setup_pcm(struct snd_sof_widget *swidget)
 
 free_gtw_attr:
 	kfree(ipc4_copier->gtw_attr);
-err:
-	kfree(available_fmt->dma_buffer_size);
 free_available_fmt:
 	sof_ipc4_free_audio_fmt(available_fmt);
 free_copier:
@@ -457,7 +433,6 @@ static void sof_ipc4_widget_free_comp_pcm(struct snd_sof_widget *swidget)
 		return;
 
 	available_fmt = &ipc4_copier->available_fmt;
-	kfree(available_fmt->dma_buffer_size);
 	kfree(available_fmt->base_config);
 	kfree(available_fmt->out_audio_fmt);
 	kfree(ipc4_copier->gtw_attr);
@@ -472,7 +447,7 @@ static int sof_ipc4_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 	struct snd_sof_dai *dai = swidget->private;
 	struct sof_ipc4_copier *ipc4_copier;
 	int node_type = 0;
-	int ret, i;
+	int ret;
 
 	ipc4_copier = kzalloc(sizeof(*ipc4_copier), GFP_KERNEL);
 	if (!ipc4_copier)
@@ -486,33 +461,12 @@ static int sof_ipc4_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 	if (ret)
 		goto free_copier;
 
-	available_fmt->dma_buffer_size = kcalloc(available_fmt->audio_fmt_num, sizeof(u32),
-						 GFP_KERNEL);
-	if (!available_fmt->dma_buffer_size) {
-		ret = -ENOMEM;
-		goto free_available_fmt;
-	}
-
-	ret = sof_update_ipc_object(scomp, available_fmt->dma_buffer_size,
-				    SOF_COPIER_GATEWAY_CFG_TOKENS, swidget->tuples,
-				    swidget->num_tuples, sizeof(u32),
-				    available_fmt->audio_fmt_num);
-	if (ret) {
-		dev_err(scomp->dev, "Failed to parse dma buffer size in audio format for %s\n",
-			swidget->widget->name);
-		goto err;
-	}
-
-	for (i = 0; i < available_fmt->audio_fmt_num; i++)
-		dev_dbg(scomp->dev, "%d: dma buffer size: %u\n", i,
-			available_fmt->dma_buffer_size[i]);
-
 	ret = sof_update_ipc_object(scomp, &node_type,
 				    SOF_COPIER_TOKENS, swidget->tuples,
 				    swidget->num_tuples, sizeof(node_type), 1);
 	if (ret) {
 		dev_err(scomp->dev, "parse dai node type failed %d\n", ret);
-		goto err;
+		goto free_available_fmt;
 	}
 
 	ret = sof_update_ipc_object(scomp, ipc4_copier,
@@ -520,7 +474,7 @@ static int sof_ipc4_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 				    swidget->num_tuples, sizeof(u32), 1);
 	if (ret) {
 		dev_err(scomp->dev, "parse dai copier node token failed %d\n", ret);
-		goto err;
+		goto free_available_fmt;
 	}
 
 	dev_dbg(scomp->dev, "dai %s node_type %u dai_type %u dai_index %d\n", swidget->widget->name,
@@ -554,7 +508,7 @@ static int sof_ipc4_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 		blob = kzalloc(sizeof(*blob), GFP_KERNEL);
 		if (!blob) {
 			ret = -ENOMEM;
-			goto err;
+			goto free_available_fmt;
 		}
 
 		list_for_each_entry(w, &sdev->widget_list, list) {
@@ -583,7 +537,7 @@ static int sof_ipc4_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 		ipc4_copier->gtw_attr = kzalloc(sizeof(*ipc4_copier->gtw_attr), GFP_KERNEL);
 		if (!ipc4_copier->gtw_attr) {
 			ret = -ENOMEM;
-			goto err;
+			goto free_available_fmt;
 		}
 
 		ipc4_copier->copier_config = (uint32_t *)ipc4_copier->gtw_attr;
@@ -604,8 +558,6 @@ static int sof_ipc4_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 
 free_copier_config:
 	kfree(ipc4_copier->copier_config);
-err:
-	kfree(available_fmt->dma_buffer_size);
 free_available_fmt:
 	sof_ipc4_free_audio_fmt(available_fmt);
 free_copier:
@@ -633,7 +585,6 @@ static void sof_ipc4_widget_free_comp_dai(struct snd_sof_widget *swidget)
 	ipc4_copier = dai->private;
 	available_fmt = &ipc4_copier->available_fmt;
 
-	kfree(available_fmt->dma_buffer_size);
 	kfree(available_fmt->base_config);
 	kfree(available_fmt->out_audio_fmt);
 	if (ipc4_copier->dai_type != SOF_DAI_INTEL_SSP &&
@@ -1166,6 +1117,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	int *ipc_config_size;
 	u32 **data;
 	int ipc_size, ret;
+	u32 deep_buffer_dma_ms = 0;
 
 	dev_dbg(sdev->dev, "copier %s, type %d", swidget->widget->name, swidget->id);
 
@@ -1177,6 +1129,16 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		struct snd_sof_widget *pipe_widget;
 		struct sof_ipc4_pipeline *pipeline;
 
+		/* parse the deep buffer dma size */
+		ret = sof_update_ipc_object(scomp, &deep_buffer_dma_ms,
+					    SOF_COPIER_DEEP_BUFFER_TOKENS, swidget->tuples,
+					    swidget->num_tuples, sizeof(u32), 1);
+		if (ret) {
+			dev_err(scomp->dev, "Failed to parse deep buffer dma size for %s\n",
+				swidget->widget->name);
+			return ret;
+		}
+
 		pipe_widget = swidget->spipe->pipe_widget;
 		pipeline = pipe_widget->private;
 		ipc4_copier = (struct sof_ipc4_copier *)swidget->private;
@@ -1367,8 +1329,29 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		return -EINVAL;
 	}
 
-	/* set the gateway dma_buffer_size using the matched ID returned above */
-	copier_data->gtw_cfg.dma_buffer_size = available_fmt->dma_buffer_size[ret];
+	/*
+	 * Set the gateway dma_buffer_size to 2ms buffer size to meet the FW expectation. In the
+	 * deep buffer case, set the dma_buffer_size depending on the deep_buffer_dma_ms set
+	 * in topology.
+	 */
+	switch (swidget->id) {
+	case snd_soc_dapm_dai_in:
+		copier_data->gtw_cfg.dma_buffer_size =
+			SOF_IPC4_MIN_DMA_BUFFER_SIZE * copier_data->base_config.ibs;
+		break;
+	case snd_soc_dapm_aif_in:
+			copier_data->gtw_cfg.dma_buffer_size =
+				max((u32)SOF_IPC4_MIN_DMA_BUFFER_SIZE, deep_buffer_dma_ms) *
+					copier_data->base_config.ibs;
+		break;
+	case snd_soc_dapm_dai_out:
+	case snd_soc_dapm_aif_out:
+		copier_data->gtw_cfg.dma_buffer_size =
+			SOF_IPC4_MIN_DMA_BUFFER_SIZE * copier_data->base_config.obs;
+		break;
+	default:
+		break;
+	}
 
 	data = &ipc4_copier->copier_config;
 	ipc_config_size = &ipc4_copier->ipc_config_size;
@@ -2170,7 +2153,7 @@ static enum sof_tokens common_copier_token_list[] = {
 	SOF_AUDIO_FORMAT_BUFFER_SIZE_TOKENS,
 	SOF_IN_AUDIO_FORMAT_TOKENS,
 	SOF_OUT_AUDIO_FORMAT_TOKENS,
-	SOF_COPIER_GATEWAY_CFG_TOKENS,
+	SOF_COPIER_DEEP_BUFFER_TOKENS,
 	SOF_COPIER_TOKENS,
 	SOF_COMP_EXT_TOKENS,
 };
@@ -2186,7 +2169,6 @@ static enum sof_tokens dai_token_list[] = {
 	SOF_AUDIO_FORMAT_BUFFER_SIZE_TOKENS,
 	SOF_IN_AUDIO_FORMAT_TOKENS,
 	SOF_OUT_AUDIO_FORMAT_TOKENS,
-	SOF_COPIER_GATEWAY_CFG_TOKENS,
 	SOF_COPIER_TOKENS,
 	SOF_DAI_TOKENS,
 	SOF_COMP_EXT_TOKENS,
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index addc5b55cc10..696d6c39a21b 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -55,6 +55,9 @@
 
 #define SOF_IPC4_INVALID_NODE_ID	0xffffffff
 
+/* FW requires minimum 2ms DMA buffer size */
+#define SOF_IPC4_MIN_DMA_BUFFER_SIZE	2
+
 /*
  * The base of multi-gateways. Multi-gateways addressing starts from
  * ALH_MULTI_GTW_BASE and there are ALH_MULTI_GTW_COUNT multi-sources
@@ -148,7 +151,6 @@ struct ipc4_pipeline_set_state_data {
  * @out_audio_fmt: Available output audio format
  * @input_audio_fmts: Available input audio formats
  * @ref_audio_fmt: Reference audio format to match runtime audio format
- * @dma_buffer_size: Available Gateway DMA buffer size (in bytes)
  * @audio_fmt_num: Number of available audio formats
  */
 struct sof_ipc4_available_audio_format {
@@ -156,7 +158,6 @@ struct sof_ipc4_available_audio_format {
 	struct sof_ipc4_audio_format *out_audio_fmt;
 	struct sof_ipc4_audio_format *input_audio_fmts;
 	struct sof_ipc4_audio_format *ref_audio_fmt;
-	u32 *dma_buffer_size;
 	int audio_fmt_num;
 };
 
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index a1c4d3f34153..4504f9efdc50 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -257,7 +257,7 @@ enum sof_tokens {
 	SOF_IN_AUDIO_FORMAT_TOKENS,
 	SOF_OUT_AUDIO_FORMAT_TOKENS,
 	SOF_AUDIO_FORMAT_BUFFER_SIZE_TOKENS,
-	SOF_COPIER_GATEWAY_CFG_TOKENS,
+	SOF_COPIER_DEEP_BUFFER_TOKENS,
 	SOF_COPIER_TOKENS,
 	SOF_AUDIO_FMT_NUM_TOKENS,
 	SOF_COPIER_FORMAT_TOKENS,
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 9f84b4c362c3..2d76ab13b3d1 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1232,7 +1232,6 @@ static int sof_widget_parse_tokens(struct snd_soc_component *scomp, struct snd_s
 			continue;
 		case SOF_IN_AUDIO_FORMAT_TOKENS:
 		case SOF_OUT_AUDIO_FORMAT_TOKENS:
-		case SOF_COPIER_GATEWAY_CFG_TOKENS:
 		case SOF_AUDIO_FORMAT_BUFFER_SIZE_TOKENS:
 			num_sets = sof_get_token_value(SOF_TKN_COMP_NUM_AUDIO_FORMATS,
 						       swidget->tuples, swidget->num_tuples);
-- 
2.39.2

