Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D156B7816
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 13:53:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BCE2144C;
	Mon, 13 Mar 2023 13:52:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BCE2144C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678712005;
	bh=GrCqQakktUShNdNDHrcu0Qk8MUnq9vB+0KQXIqD2jck=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DrHT9z0jkIyW+wzmTI5L7mysN8EQMlNjS/HfocBDLTQ77tmTS2g++sxU1j1FPRZOx
	 xqyGAar0QgORTb1G+F2hPAYGZu/wsfxD6OCn1NS3wjMpytpmaMssHG/dJugATz4B9W
	 Z2h/wLgR+xXkM8KpDv5BwSc1/Mp225/pgEpRQHdU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85840F805AE;
	Mon, 13 Mar 2023 13:49:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90F1FF80580; Mon, 13 Mar 2023 13:49:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77553F8056F
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 13:49:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77553F8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ChqWi6kA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678711777; x=1710247777;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GrCqQakktUShNdNDHrcu0Qk8MUnq9vB+0KQXIqD2jck=;
  b=ChqWi6kAf4IrYLJ/aFt0a1/OkU5fuQ6Jii2YISgZyeyb5Bu+cmcBcqTL
   ZsvJExa/BbDtK085U6WzEIDylzvJZoqFWrsiMOvrfOyyL6L/d8IeIud11
   0OleVtSlEIFjf5rKY11WyJM+b6u0ul70zXCox9dDZj6jvkom3tqI3ny3J
   TO8HlABzb0l/01J2xb+Xhs/f7c/024U7N+M8cEZ0M/facradKr+0VSjO1
   JmV+heBMMM5iEQEGU9lR9Xv4oH2LN0hMr9yZz3RJ8kKe7U3zFm7Qx8ToG
   NC/zy1xcQGl7XKGMJtF65yDUsGmseMIh5hWT7QdVsVJ6HM1KYwm//MMSo
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="399728133"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="399728133"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 05:49:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="711116534"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="711116534"
Received: from tchambon-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.43.68])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 05:49:00 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 10/11] ASoC: SOF: ipc4-topology: Add new tokens for
 input/output pin format count
Date: Mon, 13 Mar 2023 14:48:55 +0200
Message-Id: <20230313124856.8140-11-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313124856.8140-1-peter.ujfalusi@linux.intel.com>
References: <20230313124856.8140-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2CSYHQPVUZOFFWFULRVA5MCLVRSTNSE4
X-Message-ID-Hash: 2CSYHQPVUZOFFWFULRVA5MCLVRSTNSE4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2CSYHQPVUZOFFWFULRVA5MCLVRSTNSE4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

In preparation for handling processing modules with different
input/output pin counts, introduce two new tokens for input/output
audio format counts. Use these token values to parse all the available
audio formats from topology.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/uapi/sound/sof/tokens.h |   2 +
 sound/soc/sof/ipc4-topology.c   | 143 +++++++++++++++++++-------------
 sound/soc/sof/ipc4-topology.h   |   6 +-
 sound/soc/sof/topology.c        |  42 ++++++----
 4 files changed, 116 insertions(+), 77 deletions(-)

diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index 92360601b49c..bd02842124f9 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -96,6 +96,8 @@
  */
 #define SOF_TKN_COMP_INPUT_PIN_BINDING_WNAME	413
 #define SOF_TKN_COMP_OUTPUT_PIN_BINDING_WNAME	414
+#define SOF_TKN_COMP_NUM_INPUT_AUDIO_FORMATS	415
+#define SOF_TKN_COMP_NUM_OUTPUT_AUDIO_FORMATS	416
 
 
 /* SSP */
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 3aacc440a5e4..c91a90dd8a6e 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -90,8 +90,10 @@ static const struct sof_topology_token ipc4_copier_tokens[] = {
 };
 
 static const struct sof_topology_token ipc4_audio_fmt_num_tokens[] = {
-	{SOF_TKN_COMP_NUM_AUDIO_FORMATS, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		0},
+	{SOF_TKN_COMP_NUM_INPUT_AUDIO_FORMATS, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc4_available_audio_format, num_input_formats)},
+	{SOF_TKN_COMP_NUM_OUTPUT_AUDIO_FORMATS, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc4_available_audio_format, num_output_formats)},
 };
 
 static const struct sof_topology_token dai_tokens[] = {
@@ -178,19 +180,24 @@ static int sof_ipc4_get_audio_fmt(struct snd_soc_component *scomp,
 				  struct sof_ipc4_base_module_cfg *module_base_cfg)
 {
 	struct sof_ipc4_pin_format *out_format, *in_format;
-	int audio_fmt_num = 0;
 	int ret;
 
-	ret = sof_update_ipc_object(scomp, &audio_fmt_num,
+	ret = sof_update_ipc_object(scomp, available_fmt,
 				    SOF_AUDIO_FMT_NUM_TOKENS, swidget->tuples,
-				    swidget->num_tuples, sizeof(audio_fmt_num), 1);
-	if (ret || audio_fmt_num <= 0) {
-		dev_err(scomp->dev, "Invalid number of audio formats: %d\n", audio_fmt_num);
+				    swidget->num_tuples, sizeof(available_fmt), 1);
+	if (ret) {
+		dev_err(scomp->dev, "Failed to parse audio format token count\n");
+		return ret;
+	}
+
+	if (!available_fmt->num_input_formats && !available_fmt->num_output_formats) {
+		dev_err(scomp->dev, "No input/output pin formats set in topology\n");
 		return -EINVAL;
 	}
-	available_fmt->audio_fmt_num = audio_fmt_num;
 
-	dev_dbg(scomp->dev, "Number of audio formats: %d\n", available_fmt->audio_fmt_num);
+	dev_dbg(scomp->dev,
+		"Number of input audio formats: %d. Number of output audio formats: %d\n",
+		available_fmt->num_input_formats, available_fmt->num_output_formats);
 
 	/* set cpc and is_pages in the module's base_config */
 	ret = sof_update_ipc_object(scomp, module_base_cfg, SOF_COMP_TOKENS, swidget->tuples,
@@ -204,51 +211,57 @@ static int sof_ipc4_get_audio_fmt(struct snd_soc_component *scomp,
 	dev_dbg(scomp->dev, "widget %s cpc: %d is_pages: %d\n",
 		swidget->widget->name, module_base_cfg->cpc, module_base_cfg->is_pages);
 
-	in_format = kcalloc(available_fmt->audio_fmt_num, sizeof(*in_format), GFP_KERNEL);
-	if (!in_format)
-		return -ENOMEM;
+	if (available_fmt->num_input_formats) {
+		in_format = kcalloc(available_fmt->num_input_formats,
+				    sizeof(*in_format), GFP_KERNEL);
+		if (!in_format)
+			return -ENOMEM;
+		available_fmt->input_pin_fmts = in_format;
+
+		ret = sof_update_ipc_object(scomp, in_format,
+					    SOF_IN_AUDIO_FORMAT_TOKENS, swidget->tuples,
+					    swidget->num_tuples, sizeof(*in_format),
+					    available_fmt->num_input_formats);
+		if (ret) {
+			dev_err(scomp->dev, "parse input audio fmt tokens failed %d\n", ret);
+			goto err_in;
+		}
 
-	ret = sof_update_ipc_object(scomp, in_format,
-				    SOF_IN_AUDIO_FORMAT_TOKENS, swidget->tuples,
-				    swidget->num_tuples, sizeof(*in_format),
-				    available_fmt->audio_fmt_num);
-	if (ret) {
-		dev_err(scomp->dev, "parse base_config audio_fmt tokens failed %d\n", ret);
-		goto err_in;
+		dev_dbg(scomp->dev, "Input audio formats for %s\n", swidget->widget->name);
+		sof_ipc4_dbg_audio_format(scomp->dev, in_format,
+					  available_fmt->num_input_formats);
 	}
 
-	dev_dbg(scomp->dev, "Get input audio formats for %s\n", swidget->widget->name);
-	sof_ipc4_dbg_audio_format(scomp->dev, available_fmt->input_pin_fmts,
-				  available_fmt->audio_fmt_num);
-
-	out_format = kcalloc(available_fmt->audio_fmt_num, sizeof(*out_format), GFP_KERNEL);
-	if (!out_format) {
-		ret = -ENOMEM;
-		goto err_in;
-	}
+	if (available_fmt->num_output_formats) {
+		out_format = kcalloc(available_fmt->num_output_formats, sizeof(*out_format),
+				     GFP_KERNEL);
+		if (!out_format) {
+			ret = -ENOMEM;
+			goto err_in;
+		}
 
-	ret = sof_update_ipc_object(scomp, out_format,
-				    SOF_OUT_AUDIO_FORMAT_TOKENS, swidget->tuples,
-				    swidget->num_tuples, sizeof(*out_format),
-				    available_fmt->audio_fmt_num);
+		ret = sof_update_ipc_object(scomp, out_format,
+					    SOF_OUT_AUDIO_FORMAT_TOKENS, swidget->tuples,
+					    swidget->num_tuples, sizeof(*out_format),
+					    available_fmt->num_output_formats);
+		if (ret) {
+			dev_err(scomp->dev, "parse output audio fmt tokens failed\n");
+			goto err_out;
+		}
 
-	if (ret) {
-		dev_err(scomp->dev, "parse output audio_fmt tokens failed\n");
-		goto err_out;
+		available_fmt->output_pin_fmts = out_format;
+		dev_dbg(scomp->dev, "Output audio formats for %s\n", swidget->widget->name);
+		sof_ipc4_dbg_audio_format(scomp->dev, out_format,
+					  available_fmt->num_output_formats);
 	}
 
-	dev_dbg(scomp->dev, "Get output audio formats for %s\n", swidget->widget->name);
-	sof_ipc4_dbg_audio_format(scomp->dev, out_format, available_fmt->audio_fmt_num);
-
-	available_fmt->output_pin_fmts = out_format;
-	available_fmt->input_pin_fmts = in_format;
-
 	return 0;
 
 err_out:
 	kfree(out_format);
 err_in:
 	kfree(in_format);
+	available_fmt->input_pin_fmts = NULL;
 	return ret;
 }
 
@@ -830,7 +843,7 @@ static int sof_ipc4_init_audio_fmt(struct snd_sof_dev *sdev,
 				   struct sof_ipc4_base_module_cfg *base_config,
 				   struct snd_pcm_hw_params *params,
 				   struct sof_ipc4_available_audio_format *available_fmt,
-				   struct sof_ipc4_pin_format *pin_fmts)
+				   struct sof_ipc4_pin_format *pin_fmts, u32 pin_fmts_size)
 {
 	u32 valid_bits;
 	u32 channels;
@@ -858,7 +871,7 @@ static int sof_ipc4_init_audio_fmt(struct snd_sof_dev *sdev,
 		return -EINVAL;
 	}
 
-	if (!available_fmt->audio_fmt_num) {
+	if (!pin_fmts_size) {
 		dev_err(sdev->dev, "no formats available for %s\n", swidget->widget->name);
 		return -EINVAL;
 	}
@@ -867,7 +880,7 @@ static int sof_ipc4_init_audio_fmt(struct snd_sof_dev *sdev,
 	 * Search supported audio formats to match rate, channels ,and
 	 * sample_valid_bytes from runtime params
 	 */
-	for (i = 0; i < available_fmt->audio_fmt_num; i++) {
+	for (i = 0; i < pin_fmts_size; i++) {
 		struct sof_ipc4_audio_format *fmt = &pin_fmts[i].audio_fmt;
 
 		rate = fmt->sampling_frequency;
@@ -881,22 +894,26 @@ static int sof_ipc4_init_audio_fmt(struct snd_sof_dev *sdev,
 		}
 	}
 
-	if (i == available_fmt->audio_fmt_num) {
+	if (i == pin_fmts_size) {
 		dev_err(sdev->dev, "%s: Unsupported audio format: %uHz, %ubit, %u channels\n",
 			__func__, params_rate(params), sample_valid_bits, params_channels(params));
 		return -EINVAL;
 	}
 
 	/* copy input format */
-	memcpy(&base_config->audio_fmt, &available_fmt->input_pin_fmts[i].audio_fmt,
-	       sizeof(struct sof_ipc4_audio_format));
+	if (available_fmt->num_input_formats && i < available_fmt->num_input_formats) {
+		memcpy(&base_config->audio_fmt, &available_fmt->input_pin_fmts[i].audio_fmt,
+		       sizeof(struct sof_ipc4_audio_format));
+
+		/* set base_cfg ibs/obs */
+		base_config->ibs = available_fmt->input_pin_fmts[i].buffer_size;
 
-	/* set base_cfg ibs/obs */
-	base_config->ibs = available_fmt->input_pin_fmts[i].buffer_size;
-	base_config->obs = available_fmt->output_pin_fmts[i].buffer_size;
+		dev_dbg(sdev->dev, "Init input audio formats for %s\n", swidget->widget->name);
+		sof_ipc4_dbg_audio_format(sdev->dev, &available_fmt->input_pin_fmts[i], 1);
+	}
 
-	dev_dbg(sdev->dev, "Init input audio formats for %s\n", swidget->widget->name);
-	sof_ipc4_dbg_audio_format(sdev->dev, &available_fmt->input_pin_fmts[i], 1);
+	if (available_fmt->num_output_formats && i < available_fmt->num_output_formats)
+		base_config->obs = available_fmt->output_pin_fmts[i].buffer_size;
 
 	/* Return the index of the matched format */
 	return i;
@@ -1070,6 +1087,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	u32 **data;
 	int ipc_size, ret;
 	u32 deep_buffer_dma_ms = 0;
+	u32 format_list_count;
 
 	dev_dbg(sdev->dev, "copier %s, type %d", swidget->widget->name, swidget->id);
 
@@ -1102,10 +1120,13 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		 * Use the input_pin_fmts to match pcm params for playback and the output_pin_fmts
 		 * for capture.
 		 */
-		if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+		if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
 			format_list_to_search = available_fmt->input_pin_fmts;
-		else
+			format_list_count = available_fmt->num_input_formats;
+		} else {
 			format_list_to_search = available_fmt->output_pin_fmts;
+			format_list_count = available_fmt->num_output_formats;
+		}
 
 		copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
 		copier_data->gtw_cfg.node_id |=
@@ -1126,6 +1147,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		available_fmt = &ipc4_copier->available_fmt;
 		if (dir == SNDRV_PCM_STREAM_CAPTURE) {
 			format_list_to_search = available_fmt->output_pin_fmts;
+			format_list_count = available_fmt->num_output_formats;
 
 			/*
 			 * modify the input params for the dai copier as it only supports
@@ -1136,6 +1158,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 			snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
 		} else {
 			format_list_to_search = available_fmt->input_pin_fmts;
+			format_list_count = available_fmt->num_input_formats;
 		}
 
 		ref_params = pipeline_params;
@@ -1157,6 +1180,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 
 		/* Use the input formats to match pcm params */
 		format_list_to_search = available_fmt->input_pin_fmts;
+		format_list_count = available_fmt->num_input_formats;
 		ref_params = pipeline_params;
 
 		break;
@@ -1169,7 +1193,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 
 	/* set input and output audio formats */
 	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &copier_data->base_config, ref_params,
-				      available_fmt, format_list_to_search);
+				      available_fmt, format_list_to_search, format_list_count);
 	if (ret < 0)
 		return ret;
 
@@ -1356,7 +1380,8 @@ static int sof_ipc4_prepare_gain_module(struct snd_sof_widget *swidget,
 
 	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &gain->base_config,
 				      pipeline_params, available_fmt,
-				      available_fmt->input_pin_fmts);
+				      available_fmt->input_pin_fmts,
+				      available_fmt->num_input_formats);
 	if (ret < 0)
 		return ret;
 
@@ -1379,7 +1404,8 @@ static int sof_ipc4_prepare_mixer_module(struct snd_sof_widget *swidget,
 
 	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &mixer->base_config,
 				      pipeline_params, available_fmt,
-				      available_fmt->input_pin_fmts);
+				      available_fmt->input_pin_fmts,
+				      available_fmt->num_input_formats);
 	if (ret < 0)
 		return ret;
 
@@ -1403,7 +1429,8 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 
 	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &src->base_config,
 				      pipeline_params, available_fmt,
-				      available_fmt->input_pin_fmts);
+				      available_fmt->input_pin_fmts,
+				      available_fmt->num_input_formats);
 	if (ret < 0)
 		return ret;
 
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 6359ef8736ae..fad7a628f782 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -164,12 +164,14 @@ struct sof_ipc4_pin_format {
  * struct sof_ipc4_available_audio_format - Available audio formats
  * @output_pin_fmts: Available output pin formats
  * @input_pin_fmts: Available input pin formats
- * @audio_fmt_num: Number of available audio formats
+ * @num_input_formats: Number of input pin formats
+ * @num_output_formats: Number of output pin formats
  */
 struct sof_ipc4_available_audio_format {
 	struct sof_ipc4_pin_format *output_pin_fmts;
 	struct sof_ipc4_pin_format *input_pin_fmts;
-	int audio_fmt_num;
+	u32 num_input_formats;
+	u32 num_output_formats;
 };
 
 /**
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 3a091f18731f..b642835e14df 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1231,35 +1231,43 @@ static int sof_widget_parse_tokens(struct snd_soc_component *scomp, struct snd_s
 
 			continue;
 		case SOF_IN_AUDIO_FORMAT_TOKENS:
-		case SOF_OUT_AUDIO_FORMAT_TOKENS:
-			num_sets = sof_get_token_value(SOF_TKN_COMP_NUM_AUDIO_FORMATS,
+			num_sets = sof_get_token_value(SOF_TKN_COMP_NUM_INPUT_AUDIO_FORMATS,
 						       swidget->tuples, swidget->num_tuples);
-
 			if (num_sets < 0) {
-				dev_err(sdev->dev, "Invalid audio format count for %s\n",
+				dev_err(sdev->dev, "Invalid input audio format count for %s\n",
 					swidget->widget->name);
 				ret = num_sets;
 				goto err;
 			}
-
-			if (num_sets > 1) {
-				struct snd_sof_tuple *new_tuples;
-
-				num_tuples += token_list[object_token_list[i]].count * num_sets;
-				new_tuples = krealloc(swidget->tuples,
-						      sizeof(*new_tuples) * num_tuples, GFP_KERNEL);
-				if (!new_tuples) {
-					ret = -ENOMEM;
-					goto err;
-				}
-
-				swidget->tuples = new_tuples;
+			break;
+		case SOF_OUT_AUDIO_FORMAT_TOKENS:
+			num_sets = sof_get_token_value(SOF_TKN_COMP_NUM_OUTPUT_AUDIO_FORMATS,
+						       swidget->tuples, swidget->num_tuples);
+			if (num_sets < 0) {
+				dev_err(sdev->dev, "Invalid output audio format count for %s\n",
+					swidget->widget->name);
+				ret = num_sets;
+				goto err;
 			}
 			break;
 		default:
 			break;
 		}
 
+		if (num_sets > 1) {
+			struct snd_sof_tuple *new_tuples;
+
+			num_tuples += token_list[object_token_list[i]].count * num_sets;
+			new_tuples = krealloc(swidget->tuples,
+					      sizeof(*new_tuples) * num_tuples, GFP_KERNEL);
+			if (!new_tuples) {
+				ret = -ENOMEM;
+				goto err;
+			}
+
+			swidget->tuples = new_tuples;
+		}
+
 		/* copy one set of tuples per token ID into swidget->tuples */
 		ret = sof_copy_tuples(sdev, private->array, le32_to_cpu(private->size),
 				      object_token_list[i], num_sets, swidget->tuples,
-- 
2.39.2

