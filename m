Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC165441F3
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 05:31:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE07C202B;
	Thu,  9 Jun 2022 05:30:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE07C202B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654745485;
	bh=pq+YYyE5KhiAvZbaJDrRllSU1h3jFDWB53dUWeCt5fc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nnmf1VRM+TniG2dWo/y7ewe3uHZ1rEaTELD/xUKTJFJ6QZr4fNISZCflXC5qeFAcQ
	 hvMOpJ+NrAHXZqbvQeif5Z6Ww3iBsYHfnA/yATaAGZ2t5dOZ+yB2bOQMDlKrVIoIiR
	 G8zt0jg2Dyk6/6ON3EerpcEgoA9udYOSwl8RA06o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 790B7F805B0;
	Thu,  9 Jun 2022 05:27:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33F81F805B3; Thu,  9 Jun 2022 05:27:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99A16F8051E
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 05:27:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99A16F8051E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="eoVG/7eG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654745233; x=1686281233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pq+YYyE5KhiAvZbaJDrRllSU1h3jFDWB53dUWeCt5fc=;
 b=eoVG/7eG/auSoVOUHl3fs1bv4CHaxXJFzF6m3JcHWHzI9N8QfSYecC5Y
 4oqf8Aw3Zy3fUDtaMTV+jgEOLGix2XWa5YEBTSFRSnpUz4VrINkaeEuKt
 /nwPPl1duhMlT/AO/+pvHUxXn7Yh9I54TxOnwV84m/clZV39c9hey6ZQG
 t00i9z7puhHBP9M3munPxFAxd8dfUODmwlTMstl4pQKwwE90iyOnNr/f5
 sJzpKMGlgrVw3y3cld9hWtwq1hNxBj+YeQwxJEvZ7R8W+v1NMoLXppfZr
 R8rm43in24YlwtGbtPbYygqTG2Bl/+pDog3gFVrkODBe0mqJ2b8jc47f9 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="341219551"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="341219551"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:26:58 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="585260230"
Received: from mandalag-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.38.40])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:26:58 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/23] ASoC: SOF: ipc4-topology: Add support for parsing
 DAI_IN/DAI_OUT widgets
Date: Wed,  8 Jun 2022 20:26:24 -0700
Message-Id: <20220609032643.916882-5-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
References: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

Add support for parsing and setting up the IPC structure for
DAI_IN/DAI_OUT type widgets in IPC4.

Co-developed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
Co-developed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 135 ++++++++++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 559148f5644c..5bb80306794b 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -82,6 +82,13 @@ static const struct sof_topology_token ipc4_audio_fmt_num_tokens[] = {
 		0},
 };
 
+static const struct sof_topology_token dai_tokens[] = {
+	{SOF_TKN_DAI_TYPE, SND_SOC_TPLG_TUPLE_TYPE_STRING, get_token_dai_type,
+		offsetof(struct sof_ipc4_copier, dai_type)},
+	{SOF_TKN_DAI_INDEX, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc4_copier, dai_index)},
+};
+
 /* Component extended tokens */
 static const struct sof_topology_token comp_ext_tokens[] = {
 	{SOF_TKN_COMP_UUID, SND_SOC_TPLG_TUPLE_TYPE_UUID, get_token_uuid,
@@ -89,6 +96,7 @@ static const struct sof_topology_token comp_ext_tokens[] = {
 };
 
 static const struct sof_token_info ipc4_token_list[SOF_TOKEN_COUNT] = {
+	[SOF_DAI_TOKENS] = {"DAI tokens", dai_tokens, ARRAY_SIZE(dai_tokens)},
 	[SOF_PIPELINE_TOKENS] = {"Pipeline tokens", pipeline_tokens, ARRAY_SIZE(pipeline_tokens)},
 	[SOF_SCHED_TOKENS] = {"Scheduler tokens", ipc4_sched_tokens,
 		ARRAY_SIZE(ipc4_sched_tokens)},
@@ -389,6 +397,117 @@ static void sof_ipc4_widget_free_comp_pcm(struct snd_sof_widget *swidget)
 	swidget->private = NULL;
 }
 
+static int sof_ipc4_widget_setup_comp_dai(struct snd_sof_widget *swidget)
+{
+	struct sof_ipc4_available_audio_format *available_fmt;
+	struct snd_soc_component *scomp = swidget->scomp;
+	struct snd_sof_dai *dai = swidget->private;
+	struct sof_ipc4_copier *ipc4_copier;
+	int node_type = 0;
+	int ret, i;
+
+	ipc4_copier = kzalloc(sizeof(*ipc4_copier), GFP_KERNEL);
+	if (!ipc4_copier)
+		return -ENOMEM;
+
+	available_fmt = &ipc4_copier->available_fmt;
+
+	dev_dbg(scomp->dev, "Updating IPC structure for %s\n", swidget->widget->name);
+
+	ret = sof_ipc4_get_audio_fmt(scomp, swidget, available_fmt, true);
+	if (ret)
+		goto free_copier;
+
+	available_fmt->dma_buffer_size = kcalloc(available_fmt->audio_fmt_num, sizeof(u32),
+						 GFP_KERNEL);
+	if (!available_fmt->dma_buffer_size) {
+		ret = -ENOMEM;
+		goto free_copier;
+	}
+
+	ret = sof_update_ipc_object(scomp, available_fmt->dma_buffer_size,
+				    SOF_COPIER_GATEWAY_CFG_TOKENS, swidget->tuples,
+				    swidget->num_tuples, sizeof(u32),
+				    available_fmt->audio_fmt_num);
+	if (ret) {
+		dev_err(scomp->dev, "Failed to parse dma buffer size in audio format for %s\n",
+			swidget->widget->name);
+		goto err;
+	}
+
+	for (i = 0; i < available_fmt->audio_fmt_num; i++)
+		dev_dbg(scomp->dev, "%d: dma buffer size: %u\n", i,
+			available_fmt->dma_buffer_size[i]);
+
+	ret = sof_update_ipc_object(scomp, &node_type,
+				    SOF_COPIER_TOKENS, swidget->tuples,
+				    swidget->num_tuples, sizeof(node_type), 1);
+	if (ret) {
+		dev_err(scomp->dev, "parse dai node type failed %d\n", ret);
+		goto err;
+	}
+
+	ret = sof_update_ipc_object(scomp, ipc4_copier,
+				    SOF_DAI_TOKENS, swidget->tuples,
+				    swidget->num_tuples, sizeof(u32), 1);
+	if (ret) {
+		dev_err(scomp->dev, "parse dai copier node token failed %d\n", ret);
+		goto err;
+	}
+
+	dev_dbg(scomp->dev, "dai %s node_type %u dai_type %u dai_index %d\n", swidget->widget->name,
+		node_type, ipc4_copier->dai_type, ipc4_copier->dai_index);
+
+	ipc4_copier->data.gtw_cfg.node_id = SOF_IPC4_NODE_TYPE(node_type);
+	ipc4_copier->gtw_attr = kzalloc(sizeof(*ipc4_copier->gtw_attr), GFP_KERNEL);
+	if (!ipc4_copier->gtw_attr) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	ipc4_copier->copier_config = (uint32_t *)ipc4_copier->gtw_attr;
+	ipc4_copier->data.gtw_cfg.config_length = sizeof(struct sof_ipc4_gtw_attributes) >> 2;
+
+	dai->scomp = scomp;
+	dai->private = ipc4_copier;
+
+	/* set up module info and message header */
+	ret = sof_ipc4_widget_setup_msg(swidget, &ipc4_copier->msg);
+	if (ret)
+		goto free_copier_config;
+
+	return 0;
+
+free_copier_config:
+	kfree(ipc4_copier->copier_config);
+err:
+	kfree(available_fmt->dma_buffer_size);
+free_copier:
+	kfree(ipc4_copier);
+	return ret;
+}
+
+static void sof_ipc4_widget_free_comp_dai(struct snd_sof_widget *swidget)
+{
+	struct sof_ipc4_available_audio_format *available_fmt;
+	struct snd_sof_dai *dai = swidget->private;
+	struct sof_ipc4_copier *ipc4_copier;
+
+	if (!dai)
+		return;
+
+	ipc4_copier = dai->private;
+	available_fmt = &ipc4_copier->available_fmt;
+
+	kfree(available_fmt->dma_buffer_size);
+	kfree(available_fmt->base_config);
+	kfree(available_fmt->out_audio_fmt);
+	kfree(ipc4_copier->copier_config);
+	kfree(dai->private);
+	kfree(dai);
+	swidget->private = NULL;
+}
+
 static int sof_ipc4_widget_setup_comp_pipeline(struct snd_sof_widget *swidget)
 {
 	struct snd_soc_component *scomp = swidget->scomp;
@@ -454,6 +573,18 @@ static enum sof_tokens pipeline_token_list[] = {
 	SOF_PIPELINE_TOKENS,
 };
 
+static enum sof_tokens dai_token_list[] = {
+	SOF_COMP_TOKENS,
+	SOF_AUDIO_FMT_NUM_TOKENS,
+	SOF_AUDIO_FORMAT_BUFFER_SIZE_TOKENS,
+	SOF_IN_AUDIO_FORMAT_TOKENS,
+	SOF_OUT_AUDIO_FORMAT_TOKENS,
+	SOF_COPIER_GATEWAY_CFG_TOKENS,
+	SOF_COPIER_TOKENS,
+	SOF_DAI_TOKENS,
+	SOF_COMP_EXT_TOKENS,
+};
+
 static const struct sof_ipc_tplg_widget_ops tplg_ipc4_widget_ops[SND_SOC_DAPM_TYPE_COUNT] = {
 	[snd_soc_dapm_aif_in] =  {sof_ipc4_widget_setup_pcm, sof_ipc4_widget_free_comp_pcm,
 				  host_token_list, ARRAY_SIZE(host_token_list), NULL,
@@ -461,6 +592,10 @@ static const struct sof_ipc_tplg_widget_ops tplg_ipc4_widget_ops[SND_SOC_DAPM_TY
 	[snd_soc_dapm_aif_out] = {sof_ipc4_widget_setup_pcm, sof_ipc4_widget_free_comp_pcm,
 				  host_token_list, ARRAY_SIZE(host_token_list), NULL,
 				  NULL, NULL},
+	[snd_soc_dapm_dai_in] = {sof_ipc4_widget_setup_comp_dai, sof_ipc4_widget_free_comp_dai,
+				 dai_token_list, ARRAY_SIZE(dai_token_list), NULL, NULL, NULL},
+	[snd_soc_dapm_dai_out] = {sof_ipc4_widget_setup_comp_dai, sof_ipc4_widget_free_comp_dai,
+				  dai_token_list, ARRAY_SIZE(dai_token_list), NULL, NULL, NULL},
 	[snd_soc_dapm_scheduler] = {sof_ipc4_widget_setup_comp_pipeline, sof_ipc4_widget_free_comp,
 				    pipeline_token_list, ARRAY_SIZE(pipeline_token_list), NULL,
 				    NULL, NULL},
-- 
2.25.1

