Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1C55441E8
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 05:29:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 485EA1FF8;
	Thu,  9 Jun 2022 05:28:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 485EA1FF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654745384;
	bh=Nncdf/Vvovv6vTjcc2YQESZozAGLNJ/3b1FiyaHTGZY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ej5cZMDleYAUhWm/zkrWjon3TTI6+5jFugARH8uqpZwYJmps/+8RwZtJOd5gRYtpr
	 jKSf62xIYk1GH9lNpRhNpRglbx9rZqbHl+gF1pz3HfF5XQjbPpZuo45b+hEUG7hQWC
	 pbwYanWX9PDkKxvyIiOyzPQPhMG19wnAkAT2LEqI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5793F80563;
	Thu,  9 Jun 2022 05:27:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92017F80527; Thu,  9 Jun 2022 05:27:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29D1AF80527
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 05:27:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29D1AF80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TePTjvum"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654745236; x=1686281236;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nncdf/Vvovv6vTjcc2YQESZozAGLNJ/3b1FiyaHTGZY=;
 b=TePTjvumd2Zd+WZSN44EKI/v0HVAlPxT+tv79tWrRstiZ9aJYIHV3Uc3
 JUd425N1ldIY+4hndLTocWNvPc8tXUfi2DoVTE6Y4MMHfyGHfyjq8ekQ2
 HfmgA6lfPj6G3UqjSJb8MC33OX9zlF+S/yw89U506oVDDqPDtpE9jzd24
 8GeEwXjtKo+vMR04Zr4e2WnFX9r0mF1tm4yTZJIGleEMe1zDcwcj7bvj5
 VWaWJluhR25dR/nFCK6HcI66I6ouyvQzyR7jaTi4JxtiHuniQoFPE6dDM
 dAXhIvQqHpRuRsoMqoosYBEB7Q8il8AgkEiLsTxZ/RBUlVXlRRkCqajiG A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="341219555"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="341219555"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:26:59 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="585260236"
Received: from mandalag-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.38.40])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:26:59 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/23] ASoC: SOF: ipc4-topology: Add support for parsing and
 preparing pga widgets
Date: Wed,  8 Jun 2022 20:26:27 -0700
Message-Id: <20220609032643.916882-8-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
References: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Paul Olaru <paul.olaru@oss.nxp.com>,
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

Add support for parsing and preparing pga type widgets. Define the
token ID's and the associated token arrays needed to parse these
widgets.

Co-developed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
Co-developed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
---
 sound/soc/sof/ipc4-topology.c | 113 ++++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc4-topology.h |  60 ++++++++++++++++++
 sound/soc/sof/sof-audio.h     |   1 +
 3 files changed, 174 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 1bc5ff0154c5..30549573bd34 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -95,6 +95,16 @@ static const struct sof_topology_token comp_ext_tokens[] = {
 		offsetof(struct snd_sof_widget, uuid)},
 };
 
+static const struct sof_topology_token gain_tokens[] = {
+	{SOF_TKN_GAIN_RAMP_TYPE, SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		get_token_u32, offsetof(struct sof_ipc4_gain_data, curve_type)},
+	{SOF_TKN_GAIN_RAMP_DURATION,
+		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc4_gain_data, curve_duration)},
+	{SOF_TKN_GAIN_VAL, SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		get_token_u32, offsetof(struct sof_ipc4_gain_data, init_val)},
+};
+
 static const struct sof_token_info ipc4_token_list[SOF_TOKEN_COUNT] = {
 	[SOF_DAI_TOKENS] = {"DAI tokens", dai_tokens, ARRAY_SIZE(dai_tokens)},
 	[SOF_PIPELINE_TOKENS] = {"Pipeline tokens", pipeline_tokens, ARRAY_SIZE(pipeline_tokens)},
@@ -117,6 +127,7 @@ static const struct sof_token_info ipc4_token_list[SOF_TOKEN_COUNT] = {
 		ARRAY_SIZE(ipc4_copier_tokens)},
 	[SOF_AUDIO_FMT_NUM_TOKENS] = {"IPC4 Audio format number tokens",
 		ipc4_audio_fmt_num_tokens, ARRAY_SIZE(ipc4_audio_fmt_num_tokens)},
+	[SOF_GAIN_TOKENS] = {"Gain tokens", gain_tokens, ARRAY_SIZE(gain_tokens)},
 };
 
 static void sof_ipc4_dbg_audio_format(struct device *dev,
@@ -557,6 +568,62 @@ static int sof_ipc4_widget_setup_comp_pipeline(struct snd_sof_widget *swidget)
 	return ret;
 }
 
+static int sof_ipc4_widget_setup_comp_pga(struct snd_sof_widget *swidget)
+{
+	struct snd_soc_component *scomp = swidget->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct sof_ipc4_fw_module *fw_module;
+	struct snd_sof_control *scontrol;
+	struct sof_ipc4_gain *gain;
+	int ret;
+
+	gain = kzalloc(sizeof(*gain), GFP_KERNEL);
+	if (!gain)
+		return -ENOMEM;
+
+	swidget->private = gain;
+
+	gain->data.channels = SOF_IPC4_GAIN_ALL_CHANNELS_MASK;
+	gain->data.init_val = SOF_IPC4_VOL_ZERO_DB;
+
+	/* The out_audio_fmt in topology is ignored as it is not required to be sent to the FW */
+	ret = sof_ipc4_get_audio_fmt(scomp, swidget, &gain->available_fmt, false);
+	if (ret)
+		goto err;
+
+	ret = sof_update_ipc_object(scomp, &gain->data, SOF_GAIN_TOKENS, swidget->tuples,
+				    swidget->num_tuples, sizeof(gain->data), 1);
+	if (ret) {
+		dev_err(scomp->dev, "Parsing gain tokens failed\n");
+		goto err;
+	}
+
+	dev_dbg(scomp->dev,
+		"pga widget %s: ramp type: %d, ramp duration %d, initial gain value: %#x, cpc %d\n",
+		swidget->widget->name, gain->data.curve_type, gain->data.curve_duration,
+		gain->data.init_val, gain->base_config.cpc);
+
+	ret = sof_ipc4_widget_setup_msg(swidget, &gain->msg);
+	if (ret)
+		goto err;
+
+	fw_module = swidget->module_info;
+
+	/* update module ID for all kcontrols for this widget */
+	list_for_each_entry(scontrol, &sdev->kcontrol_list, list)
+		if (scontrol->comp_id == swidget->comp_id) {
+			struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
+			struct sof_ipc4_msg *msg = &cdata->msg;
+
+			msg->primary |= fw_module->man4_module_entry.id;
+		}
+
+	return 0;
+err:
+	kfree(gain);
+	return ret;
+}
+
 static void
 sof_ipc4_update_pipeline_mem_usage(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget,
 				   struct sof_ipc4_base_module_cfg *base_config)
@@ -874,6 +941,39 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	return sof_ipc4_widget_assign_instance_id(sdev, swidget);
 }
 
+static void sof_ipc4_unprepare_generic_module(struct snd_sof_widget *swidget)
+{
+	struct sof_ipc4_fw_module *fw_module = swidget->module_info;
+
+	ida_free(&fw_module->m_ida, swidget->instance_id);
+}
+
+static int sof_ipc4_prepare_gain_module(struct snd_sof_widget *swidget,
+					struct snd_pcm_hw_params *fe_params,
+					struct snd_sof_platform_stream_params *platform_params,
+					struct snd_pcm_hw_params *pipeline_params, int dir)
+{
+	struct snd_soc_component *scomp = swidget->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct sof_ipc4_gain *gain = swidget->private;
+	int ret;
+
+	gain->available_fmt.ref_audio_fmt = &gain->available_fmt.base_config->audio_fmt;
+
+	/* output format is not required to be sent to the FW for gain */
+	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &gain->base_config,
+				      NULL, pipeline_params, &gain->available_fmt,
+				      sizeof(gain->base_config));
+	if (ret < 0)
+		return ret;
+
+	/* update pipeline memory usage */
+	sof_ipc4_update_pipeline_mem_usage(sdev, swidget, &gain->base_config);
+
+	/* assign instance ID */
+	return sof_ipc4_widget_assign_instance_id(sdev, swidget);
+}
+
 static enum sof_tokens host_token_list[] = {
 	SOF_COMP_TOKENS,
 	SOF_AUDIO_FMT_NUM_TOKENS,
@@ -902,6 +1002,15 @@ static enum sof_tokens dai_token_list[] = {
 	SOF_COMP_EXT_TOKENS,
 };
 
+static enum sof_tokens pga_token_list[] = {
+	SOF_COMP_TOKENS,
+	SOF_GAIN_TOKENS,
+	SOF_AUDIO_FMT_NUM_TOKENS,
+	SOF_AUDIO_FORMAT_BUFFER_SIZE_TOKENS,
+	SOF_IN_AUDIO_FORMAT_TOKENS,
+	SOF_COMP_EXT_TOKENS,
+};
+
 static const struct sof_ipc_tplg_widget_ops tplg_ipc4_widget_ops[SND_SOC_DAPM_TYPE_COUNT] = {
 	[snd_soc_dapm_aif_in] =  {sof_ipc4_widget_setup_pcm, sof_ipc4_widget_free_comp_pcm,
 				  host_token_list, ARRAY_SIZE(host_token_list), NULL,
@@ -922,6 +1031,10 @@ static const struct sof_ipc_tplg_widget_ops tplg_ipc4_widget_ops[SND_SOC_DAPM_TY
 	[snd_soc_dapm_scheduler] = {sof_ipc4_widget_setup_comp_pipeline, sof_ipc4_widget_free_comp,
 				    pipeline_token_list, ARRAY_SIZE(pipeline_token_list), NULL,
 				    NULL, NULL},
+	[snd_soc_dapm_pga] = {sof_ipc4_widget_setup_comp_pga, sof_ipc4_widget_free_comp,
+			      pga_token_list, ARRAY_SIZE(pga_token_list), NULL,
+			      sof_ipc4_prepare_gain_module,
+			      sof_ipc4_unprepare_generic_module},
 };
 
 const struct sof_ipc_tplg_ops ipc4_tplg_ops = {
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 5f4c463f329e..060123826db4 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -31,6 +31,9 @@
 #define SOF_IPC4_NODE_INDEX(x)	((x) & SOF_IPC4_NODE_INDEX_MASK)
 #define SOF_IPC4_NODE_TYPE(x)  ((x) << 8)
 
+#define SOF_IPC4_GAIN_ALL_CHANNELS_MASK 0xffffffff
+#define SOF_IPC4_VOL_ZERO_DB	0x7fffffff
+
 /**
  * struct sof_ipc4_pipeline - pipeline config data
  * @priority: Priority of this pipeline
@@ -128,4 +131,61 @@ struct sof_ipc4_copier {
 	int dai_index;
 };
 
+/**
+ * struct sof_ipc4_ctrl_value_chan: generic channel mapped value data
+ * @channel: Channel ID
+ * @value: gain value
+ */
+struct sof_ipc4_ctrl_value_chan {
+	u32 channel;
+	u32 value;
+};
+
+/**
+ * struct sof_ipc4_control_data - IPC data for kcontrol IO
+ * @msg: message structure for kcontrol IO
+ * @index: pipeline ID
+ * @chanv: channel ID and value array used by volume type controls
+ * @data: data for binary kcontrols
+ */
+struct sof_ipc4_control_data {
+	struct sof_ipc4_msg msg;
+	int index;
+
+	union {
+		struct sof_ipc4_ctrl_value_chan chanv[0];
+		struct sof_abi_hdr data[0];
+	};
+};
+
+/**
+ * struct sof_ipc4_gain_data - IPC gain blob
+ * @channels: Channels
+ * @init_val: Initial value
+ * @curve_type: Curve type
+ * @reserved: reserved for future use
+ * @curve_duration: Curve duration
+ */
+struct sof_ipc4_gain_data {
+	uint32_t channels;
+	uint32_t init_val;
+	uint32_t curve_type;
+	uint32_t reserved;
+	uint32_t curve_duration;
+} __aligned(8);
+
+/**
+ * struct sof_ipc4_gain - gain config data
+ * @base_config: IPC base config data
+ * @data: IPC gain blob
+ * @available_fmt: Available audio format
+ * @msg: message structure for gain
+ */
+struct sof_ipc4_gain {
+	struct sof_ipc4_base_module_cfg base_config;
+	struct sof_ipc4_gain_data data;
+	struct sof_ipc4_available_audio_format available_fmt;
+	struct sof_ipc4_msg msg;
+};
+
 #endif
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index c38b4bdd685a..d896da1192c5 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -232,6 +232,7 @@ enum sof_tokens {
 	SOF_COPIER_TOKENS,
 	SOF_AUDIO_FMT_NUM_TOKENS,
 	SOF_COPIER_FORMAT_TOKENS,
+	SOF_GAIN_TOKENS,
 
 	/* this should be the last */
 	SOF_TOKEN_COUNT,
-- 
2.25.1

