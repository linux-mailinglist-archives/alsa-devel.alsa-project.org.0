Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 292105441E7
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 05:29:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 826B8200B;
	Thu,  9 Jun 2022 05:28:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 826B8200B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654745370;
	bh=/9oKbQZlHIcznqxyCmBwbqF4GeQ8GDTd0l8RuFrbySE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mm9B1sq4cJx7sbu57kdklSS6dHrjNa47ZanB5FHdl3TIJBlzMs1bVadHfqDGqlde8
	 9LBfXGbDSwURwis1luT0jDBJGwlblohRT0rsXo/8VsGY6mChLTjWG0D7PmN2CdeLtM
	 A9Oi9LdChN6ZJxJPO9lHkw0/Rx3CafdZh2n5kTow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 400B1F80553;
	Thu,  9 Jun 2022 05:27:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE02DF8054A; Thu,  9 Jun 2022 05:27:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C26BF804BD
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 05:27:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C26BF804BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lLxglPR2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654745233; x=1686281233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/9oKbQZlHIcznqxyCmBwbqF4GeQ8GDTd0l8RuFrbySE=;
 b=lLxglPR2fDkBUEt2GHypNuGyPj7PD0OmCAnW4Hz2BBGoi1u0awH2vMPG
 ZPHQ3sYR1AS3dQJgsmRhBVvQqC9unvQnPG8OvmlT61VZMJLx3yfDzJSZx
 E8D2ju3K648nOdi3AJETNeUn7W+8QWBPEF73AoDupf9pyRLVwA44Nxeww
 3iscmkVIvDk29vWwLKfgWjzIdu/NNASMYR5Qsm8k9pmSm2xdIoX/hVPGW
 ldbyiqa9e92jnb2/Nf1I4yjR6UFVUPL1Csq3HQY81ENGg3AxaIroPofSg
 YdRlZluvz0U9gBil6kt/6FBpkCZdRjKVtNMOEA7MPUPcEOIZMqmYPV4ht g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="341219553"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="341219553"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:26:58 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="585260233"
Received: from mandalag-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.38.40])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:26:58 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/23] ASoC: SOF: ipc4-topology: Add prepare op for AIF type
 widgets
Date: Wed,  8 Jun 2022 20:26:25 -0700
Message-Id: <20220609032643.916882-6-ranjani.sridharan@linux.intel.com>
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

Define the prepare op for the AIF type widgets for IPC4.
The prepare op is responsible for choosing the input/output audio
formats for these widgets based on the runtime PCM params, assigning the
instance ID and updating the total memory usage for the pipelines these
widgets belong to.

Co-developed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
Co-developed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 290 +++++++++++++++++++++++++++++++++-
 sound/soc/sof/ipc4-topology.h |  18 +++
 2 files changed, 306 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 5bb80306794b..1a73c16f1624 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -557,6 +557,290 @@ static int sof_ipc4_widget_setup_comp_pipeline(struct snd_sof_widget *swidget)
 	return ret;
 }
 
+static void
+sof_ipc4_update_pipeline_mem_usage(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget,
+				   struct sof_ipc4_base_module_cfg *base_config)
+{
+	struct sof_ipc4_fw_module *fw_module = swidget->module_info;
+	struct snd_sof_widget *pipe_widget;
+	struct sof_ipc4_pipeline *pipeline;
+	int task_mem, queue_mem;
+	int ibs, bss, total;
+
+	ibs = base_config->ibs;
+	bss = base_config->is_pages;
+
+	task_mem = SOF_IPC4_PIPELINE_OBJECT_SIZE;
+	task_mem += SOF_IPC4_MODULE_INSTANCE_LIST_ITEM_SIZE + bss;
+
+	if (fw_module->man4_module_entry.type & SOF_IPC4_MODULE_LL) {
+		task_mem += SOF_IPC4_FW_ROUNDUP(SOF_IPC4_LL_TASK_OBJECT_SIZE);
+		task_mem += SOF_IPC4_FW_MAX_QUEUE_COUNT * SOF_IPC4_MODULE_INSTANCE_LIST_ITEM_SIZE;
+		task_mem += SOF_IPC4_LL_TASK_LIST_ITEM_SIZE;
+	} else {
+		task_mem += SOF_IPC4_FW_ROUNDUP(SOF_IPC4_DP_TASK_OBJECT_SIZE);
+		task_mem += SOF_IPC4_DP_TASK_LIST_SIZE;
+	}
+
+	ibs = SOF_IPC4_FW_ROUNDUP(ibs);
+	queue_mem = SOF_IPC4_FW_MAX_QUEUE_COUNT * (SOF_IPC4_DATA_QUEUE_OBJECT_SIZE +  ibs);
+
+	total = SOF_IPC4_FW_PAGE(task_mem + queue_mem);
+
+	pipe_widget = swidget->pipe_widget;
+	pipeline = pipe_widget->private;
+	pipeline->mem_usage += total;
+}
+
+static int sof_ipc4_widget_assign_instance_id(struct snd_sof_dev *sdev,
+					      struct snd_sof_widget *swidget)
+{
+	struct sof_ipc4_fw_module *fw_module = swidget->module_info;
+	int max_instances = fw_module->man4_module_entry.instance_max_count;
+
+	swidget->instance_id = ida_alloc_max(&fw_module->m_ida, max_instances, GFP_KERNEL);
+	if (swidget->instance_id < 0) {
+		dev_err(sdev->dev, "failed to assign instance id for widget %s",
+			swidget->widget->name);
+		return swidget->instance_id;
+	}
+
+	return 0;
+}
+
+static int sof_ipc4_init_audio_fmt(struct snd_sof_dev *sdev,
+				   struct snd_sof_widget *swidget,
+				   struct sof_ipc4_base_module_cfg *base_config,
+				   struct sof_ipc4_audio_format *out_format,
+				   struct snd_pcm_hw_params *params,
+				   struct sof_ipc4_available_audio_format *available_fmt,
+				   size_t object_offset)
+{
+	void *ptr = available_fmt->ref_audio_fmt;
+	u32 valid_bits;
+	u32 channels;
+	u32 rate;
+	int sample_valid_bits;
+	int i;
+
+	if (!ptr) {
+		dev_err(sdev->dev, "no reference formats for %s\n", swidget->widget->name);
+		return -EINVAL;
+	}
+
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S16_LE:
+		sample_valid_bits = 16;
+		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+		sample_valid_bits = 24;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		sample_valid_bits = 32;
+		break;
+	default:
+		dev_err(sdev->dev, "invalid pcm frame format %d\n", params_format(params));
+		return -EINVAL;
+	}
+
+	if (!available_fmt->audio_fmt_num) {
+		dev_err(sdev->dev, "no formats available for %s\n", swidget->widget->name);
+		return -EINVAL;
+	}
+
+	/*
+	 * Search supported audio formats to match rate, channels ,and
+	 * sample_valid_bytes from runtime params
+	 */
+	for (i = 0; i < available_fmt->audio_fmt_num; i++, ptr = (u8 *)ptr + object_offset) {
+		struct sof_ipc4_audio_format *fmt = ptr;
+
+		rate = fmt->sampling_frequency;
+		channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(fmt->fmt_cfg);
+		valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(fmt->fmt_cfg);
+		if (params_rate(params) == rate && params_channels(params) == channels &&
+		    sample_valid_bits == valid_bits) {
+			dev_dbg(sdev->dev, "%s: matching audio format index for %uHz, %ubit, %u channels: %d\n",
+				__func__, rate, valid_bits, channels, i);
+
+			/* copy ibs/obs and input format */
+			memcpy(base_config, &available_fmt->base_config[i],
+			       sizeof(struct sof_ipc4_base_module_cfg));
+
+			/* copy output format */
+			if (out_format)
+				memcpy(out_format, &available_fmt->out_audio_fmt[i],
+				       sizeof(struct sof_ipc4_audio_format));
+			break;
+		}
+	}
+
+	if (i == available_fmt->audio_fmt_num) {
+		dev_err(sdev->dev, "%s: Unsupported audio format: %uHz, %ubit, %u channels\n",
+			__func__, params_rate(params), sample_valid_bits, params_channels(params));
+		return -EINVAL;
+	}
+
+	dev_dbg(sdev->dev, "Init input audio formats for %s\n", swidget->widget->name);
+	sof_ipc4_dbg_audio_format(sdev->dev, &base_config->audio_fmt,
+				  sizeof(*base_config), 1);
+	if (out_format) {
+		dev_dbg(sdev->dev, "Init output audio formats for %s\n", swidget->widget->name);
+		sof_ipc4_dbg_audio_format(sdev->dev, out_format,
+					  sizeof(*out_format), 1);
+	}
+
+	/* Return the index of the matched format */
+	return i;
+}
+
+static void sof_ipc4_unprepare_copier_module(struct snd_sof_widget *swidget)
+{
+	struct sof_ipc4_fw_module *fw_module = swidget->module_info;
+	struct sof_ipc4_copier *ipc4_copier = NULL;
+	struct snd_sof_widget *pipe_widget;
+	struct sof_ipc4_pipeline *pipeline;
+
+	/* reset pipeline memory usage */
+	pipe_widget = swidget->pipe_widget;
+	pipeline = pipe_widget->private;
+	pipeline->mem_usage = 0;
+
+	if (WIDGET_IS_AIF(swidget->id))
+		ipc4_copier = swidget->private;
+
+	if (ipc4_copier) {
+		kfree(ipc4_copier->ipc_config_data);
+		ipc4_copier->ipc_config_data = NULL;
+		ipc4_copier->ipc_config_size = 0;
+	}
+
+	ida_free(&fw_module->m_ida, swidget->instance_id);
+}
+
+static int
+sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
+			       struct snd_pcm_hw_params *fe_params,
+			       struct snd_sof_platform_stream_params *platform_params,
+			       struct snd_pcm_hw_params *pipeline_params, int dir)
+{
+	struct sof_ipc4_available_audio_format *available_fmt;
+	struct snd_soc_component *scomp = swidget->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct sof_ipc4_copier_data *copier_data;
+	struct snd_pcm_hw_params *ref_params;
+	struct sof_ipc4_copier *ipc4_copier;
+	struct snd_mask *fmt;
+	int out_sample_valid_bits;
+	size_t ref_audio_fmt_size;
+	void **ipc_config_data;
+	int *ipc_config_size;
+	u32 **data;
+	int ipc_size, ret;
+
+	dev_dbg(sdev->dev, "%s: copier %s, type %d", __func__, swidget->widget->name, swidget->id);
+
+	switch (swidget->id) {
+	case snd_soc_dapm_aif_in:
+	case snd_soc_dapm_aif_out:
+	{
+		struct sof_ipc4_gtw_attributes *gtw_attr;
+		struct snd_sof_widget *pipe_widget;
+		struct sof_ipc4_pipeline *pipeline;
+
+		pipe_widget = swidget->pipe_widget;
+		pipeline = pipe_widget->private;
+		ipc4_copier = (struct sof_ipc4_copier *)swidget->private;
+		gtw_attr = ipc4_copier->gtw_attr;
+		copier_data = &ipc4_copier->data;
+		available_fmt = &ipc4_copier->available_fmt;
+
+		/*
+		 * base_config->audio_fmt and out_audio_fmt represent the input and output audio
+		 * formats. Use the input format as the reference to match pcm params for playback
+		 * and the output format as reference for capture.
+		 */
+		if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+			available_fmt->ref_audio_fmt = &available_fmt->base_config->audio_fmt;
+			ref_audio_fmt_size = sizeof(struct sof_ipc4_base_module_cfg);
+		} else {
+			available_fmt->ref_audio_fmt = available_fmt->out_audio_fmt;
+			ref_audio_fmt_size = sizeof(struct sof_ipc4_audio_format);
+		}
+		copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
+		copier_data->gtw_cfg.node_id |=
+			SOF_IPC4_NODE_INDEX(platform_params->stream_tag - 1);
+
+		/* set gateway attributes */
+		gtw_attr->lp_buffer_alloc = pipeline->lp_mode;
+		ref_params = fe_params;
+		break;
+	}
+	default:
+		dev_err(sdev->dev, "unsupported type %d for copier %s",
+			swidget->id, swidget->widget->name);
+		return -EINVAL;
+	}
+
+	/* set input and output audio formats */
+	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &copier_data->base_config,
+				      &copier_data->out_format, ref_params,
+				      available_fmt, ref_audio_fmt_size);
+	if (ret < 0)
+		return ret;
+
+	/* modify the input params for the next widget */
+	fmt = hw_param_mask(pipeline_params, SNDRV_PCM_HW_PARAM_FORMAT);
+	out_sample_valid_bits =
+		SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(copier_data->out_format.fmt_cfg);
+	snd_mask_none(fmt);
+	switch (out_sample_valid_bits) {
+	case 16:
+		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
+		break;
+	case 24:
+		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
+		break;
+	case 32:
+		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
+		break;
+	default:
+		dev_err(sdev->dev, "invalid sample frame format %d\n",
+			params_format(pipeline_params));
+		return -EINVAL;
+	}
+
+	/* set the gateway dma_buffer_size using the matched ID returned above */
+	copier_data->gtw_cfg.dma_buffer_size = available_fmt->dma_buffer_size[ret];
+
+	data = &ipc4_copier->copier_config;
+	ipc_config_size = &ipc4_copier->ipc_config_size;
+	ipc_config_data = &ipc4_copier->ipc_config_data;
+
+	/* config_length is DWORD based */
+	ipc_size = sizeof(*copier_data) + copier_data->gtw_cfg.config_length * 4;
+
+	dev_dbg(sdev->dev, "copier %s, IPC size is %d", swidget->widget->name, ipc_size);
+
+	*ipc_config_data = kzalloc(ipc_size, GFP_KERNEL);
+	if (!*ipc_config_data)
+		return -ENOMEM;
+
+	*ipc_config_size = ipc_size;
+
+	/* copy IPC data */
+	memcpy(*ipc_config_data, (void *)copier_data, sizeof(*copier_data));
+	if (copier_data->gtw_cfg.config_length)
+		memcpy(*ipc_config_data + sizeof(*copier_data),
+		       *data, copier_data->gtw_cfg.config_length * 4);
+
+	/* update pipeline memory usage */
+	sof_ipc4_update_pipeline_mem_usage(sdev, swidget, &copier_data->base_config);
+
+	/* assign instance ID */
+	return sof_ipc4_widget_assign_instance_id(sdev, swidget);
+}
+
 static enum sof_tokens host_token_list[] = {
 	SOF_COMP_TOKENS,
 	SOF_AUDIO_FMT_NUM_TOKENS,
@@ -588,10 +872,12 @@ static enum sof_tokens dai_token_list[] = {
 static const struct sof_ipc_tplg_widget_ops tplg_ipc4_widget_ops[SND_SOC_DAPM_TYPE_COUNT] = {
 	[snd_soc_dapm_aif_in] =  {sof_ipc4_widget_setup_pcm, sof_ipc4_widget_free_comp_pcm,
 				  host_token_list, ARRAY_SIZE(host_token_list), NULL,
-				  NULL, NULL},
+				  sof_ipc4_prepare_copier_module,
+				  sof_ipc4_unprepare_copier_module},
 	[snd_soc_dapm_aif_out] = {sof_ipc4_widget_setup_pcm, sof_ipc4_widget_free_comp_pcm,
 				  host_token_list, ARRAY_SIZE(host_token_list), NULL,
-				  NULL, NULL},
+				  sof_ipc4_prepare_copier_module,
+				  sof_ipc4_unprepare_copier_module},
 	[snd_soc_dapm_dai_in] = {sof_ipc4_widget_setup_comp_dai, sof_ipc4_widget_free_comp_dai,
 				 dai_token_list, ARRAY_SIZE(dai_token_list), NULL, NULL, NULL},
 	[snd_soc_dapm_dai_out] = {sof_ipc4_widget_setup_comp_dai, sof_ipc4_widget_free_comp_dai,
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index f4f62dda63a3..5f4c463f329e 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -11,6 +11,24 @@
 
 #include <sound/sof/ipc4/header.h>
 
+#define SOF_IPC4_FW_PAGE_SIZE BIT(12)
+#define SOF_IPC4_FW_PAGE(x) ((((x) + BIT(12) - 1) & ~(BIT(12) - 1)) >> 12)
+#define SOF_IPC4_FW_ROUNDUP(x) (((x) + BIT(6) - 1) & (~(BIT(6) - 1)))
+
+#define SOF_IPC4_MODULE_LL      BIT(5)
+#define SOF_IPC4_MODULE_INSTANCE_LIST_ITEM_SIZE 12
+#define SOF_IPC4_PIPELINE_OBJECT_SIZE 448
+#define SOF_IPC4_DATA_QUEUE_OBJECT_SIZE 128
+#define SOF_IPC4_LL_TASK_OBJECT_SIZE 72
+#define SOF_IPC4_DP_TASK_OBJECT_SIZE 104
+#define SOF_IPC4_DP_TASK_LIST_SIZE (12 + 8)
+#define SOF_IPC4_LL_TASK_LIST_ITEM_SIZE 12
+#define SOF_IPC4_FW_MAX_PAGE_COUNT 20
+#define SOF_IPC4_FW_MAX_QUEUE_COUNT 8
+
+/* Node index and mask applicable for host copier */
+#define SOF_IPC4_NODE_INDEX_MASK	0xFF
+#define SOF_IPC4_NODE_INDEX(x)	((x) & SOF_IPC4_NODE_INDEX_MASK)
 #define SOF_IPC4_NODE_TYPE(x)  ((x) << 8)
 
 /**
-- 
2.25.1

