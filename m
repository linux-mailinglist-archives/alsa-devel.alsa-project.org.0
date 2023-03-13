Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D606B780A
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 13:51:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EBD9148C;
	Mon, 13 Mar 2023 13:50:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EBD9148C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678711895;
	bh=nFeVVtukvsYSwpTjJq8ymVe0MOVT9//w7sD/qfHGBvw=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HyZNF2NzZSAWmAppPcIgW1DG+GL8wRFiXEzB78vojbVDQkiE+t1wvFGAk9+7ErEJz
	 Nr7belC7VjAE7sxjIuI5dD6lrhQ3fh60eT3UNj2sJSTQD9cn+6KqArdMNkDSxEyRBS
	 zpeVmwhRF9z6RQvFkN5XTHkg0tEGNtTVLCjHNbyk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91C65F80552;
	Mon, 13 Mar 2023 13:49:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A66E4F80534; Mon, 13 Mar 2023 13:49:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F25AF80425
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 13:49:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F25AF80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Q1uuLSmd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678711742; x=1710247742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nFeVVtukvsYSwpTjJq8ymVe0MOVT9//w7sD/qfHGBvw=;
  b=Q1uuLSmd/+t8Fsq4xLyXHtpoyxS5M/H5UJ2l/Yg0Rz9bREaOCpJABUTF
   umcab9JJuG4QIpMGbtaKpuOI5A72eZqgSqiG4m1KXFOz44MHkkJ62jsJL
   ADveWzsA1zmEUDVLRqkvj0nNq8HFpKl1lhXZGo/mmEKSay3r4v0j4QNs7
   NesNu1m0Zn48+Ywlt8pcE4Ns1GFK6AxV/nl9GTfBGSk9N1KwO3cxJXaYV
   GOVTCvyiHlIeL2vf5yk0BZlS/Q+T0tuD7anYw0cP2CybWHwNykDgnHpPy
   NE57ch8j5NskCzzUQteDjgK5cZ62FWaFNNk+ld0V3ZLKunFISuI0TUJA8
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="399728066"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="399728066"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 05:48:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="711116413"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="711116413"
Received: from tchambon-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.43.68])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 05:48:40 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 03/11] ASoC: SOF: ipc4-topology: Add a new field in struct
 sof_ipc4_available_audio_format
Date: Mon, 13 Mar 2023 14:48:48 +0200
Message-Id: <20230313124856.8140-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313124856.8140-1-peter.ujfalusi@linux.intel.com>
References: <20230313124856.8140-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: C7FR4LKBJEUZV3ONDTF5Z6PHJGC25F6R
X-Message-ID-Hash: C7FR4LKBJEUZV3ONDTF5Z6PHJGC25F6R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C7FR4LKBJEUZV3ONDTF5Z6PHJGC25F6R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Add a new field, input_audio_fmts, in struct
sof_ipc4_available_audio_format and parse all the available input audio
formats into this new field and not into the base_config field. This is
preparation to remove the base_config array from the struct
sof_ipc4_available_audio_format.

This simplifies the sof_ipc4_init_audio_fmt()
function as the reference audio format for matching with input params
has the same size.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c      |   2 +-
 sound/soc/sof/ipc4-topology.c | 119 ++++++++++++++++++----------------
 sound/soc/sof/ipc4-topology.h |   2 +
 3 files changed, 65 insertions(+), 58 deletions(-)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 68258767aace..a679c08d9bb1 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -389,7 +389,7 @@ static int sof_ipc4_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 	snd_mask_none(fmt);
 	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
 
-	rate->min = ipc4_copier->available_fmt.base_config->audio_fmt.sampling_frequency;
+	rate->min = ipc4_copier->available_fmt.input_audio_fmts->sampling_frequency;
 	rate->max = rate->min;
 
 	switch (ipc4_copier->dai_type) {
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index a501eb9befa8..d56e0f12b5d0 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -180,7 +180,7 @@ static int sof_ipc4_get_audio_fmt(struct snd_soc_component *scomp,
 				  bool has_out_format)
 {
 	struct sof_ipc4_base_module_cfg *base_config;
-	struct sof_ipc4_audio_format *out_format;
+	struct sof_ipc4_audio_format *out_format, *in_format;
 	int audio_fmt_num = 0;
 	int ret, i;
 
@@ -206,7 +206,7 @@ static int sof_ipc4_get_audio_fmt(struct snd_soc_component *scomp,
 					    swidget->num_tuples, sizeof(*base_config), 1);
 		if (ret) {
 			dev_err(scomp->dev, "parse comp tokens failed %d\n", ret);
-			goto err_in;
+			goto err;
 		}
 	}
 
@@ -217,7 +217,7 @@ static int sof_ipc4_get_audio_fmt(struct snd_soc_component *scomp,
 				    available_fmt->audio_fmt_num);
 	if (ret) {
 		dev_err(scomp->dev, "parse buffer size tokens failed %d\n", ret);
-		goto err_in;
+		goto err;
 	}
 
 	for (i = 0; i < available_fmt->audio_fmt_num; i++)
@@ -225,9 +225,17 @@ static int sof_ipc4_get_audio_fmt(struct snd_soc_component *scomp,
 			base_config[i].ibs, base_config[i].obs,
 			base_config[i].cpc, base_config[i].is_pages);
 
-	ret = sof_update_ipc_object(scomp, &base_config->audio_fmt,
+	in_format = kcalloc(available_fmt->audio_fmt_num,
+			    sizeof(struct sof_ipc4_audio_format), GFP_KERNEL);
+	if (!in_format) {
+		kfree(base_config);
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	ret = sof_update_ipc_object(scomp, available_fmt->input_audio_fmts,
 				    SOF_IN_AUDIO_FORMAT_TOKENS, swidget->tuples,
-				    swidget->num_tuples, sizeof(*base_config),
+				    swidget->num_tuples, sizeof(struct sof_ipc4_audio_format),
 				    available_fmt->audio_fmt_num);
 	if (ret) {
 		dev_err(scomp->dev, "parse base_config audio_fmt tokens failed %d\n", ret);
@@ -235,12 +243,10 @@ static int sof_ipc4_get_audio_fmt(struct snd_soc_component *scomp,
 	}
 
 	dev_dbg(scomp->dev, "Get input audio formats for %s\n", swidget->widget->name);
-	sof_ipc4_dbg_audio_format(scomp->dev, &base_config->audio_fmt,
-				  sizeof(*base_config),
+	sof_ipc4_dbg_audio_format(scomp->dev, available_fmt->input_audio_fmts,
+				  sizeof(struct sof_ipc4_audio_format),
 				  available_fmt->audio_fmt_num);
 
-	available_fmt->base_config = base_config;
-
 	if (!has_out_format)
 		return 0;
 
@@ -260,18 +266,22 @@ static int sof_ipc4_get_audio_fmt(struct snd_soc_component *scomp,
 		goto err_out;
 	}
 
-	available_fmt->out_audio_fmt = out_format;
 	dev_dbg(scomp->dev, "Get output audio formats for %s\n", swidget->widget->name);
 	sof_ipc4_dbg_audio_format(scomp->dev, out_format, sizeof(*out_format),
 				  available_fmt->audio_fmt_num);
 
+	available_fmt->base_config = base_config;
+	available_fmt->out_audio_fmt = out_format;
+	available_fmt->input_audio_fmts = in_format;
+
 	return 0;
 
 err_out:
 	kfree(out_format);
 err_in:
+	kfree(in_format);
+err:
 	kfree(base_config);
-
 	return ret;
 }
 
@@ -283,6 +293,8 @@ static void sof_ipc4_free_audio_fmt(struct sof_ipc4_available_audio_format *avai
 	available_fmt->base_config = NULL;
 	kfree(available_fmt->out_audio_fmt);
 	available_fmt->out_audio_fmt = NULL;
+	kfree(available_fmt->input_audio_fmts);
+	available_fmt->input_audio_fmts = NULL;
 }
 
 static void sof_ipc4_widget_free_comp_pipeline(struct snd_sof_widget *swidget)
@@ -904,17 +916,16 @@ static int sof_ipc4_init_audio_fmt(struct snd_sof_dev *sdev,
 				   struct sof_ipc4_base_module_cfg *base_config,
 				   struct sof_ipc4_audio_format *out_format,
 				   struct snd_pcm_hw_params *params,
-				   struct sof_ipc4_available_audio_format *available_fmt,
-				   size_t object_offset)
+				   struct sof_ipc4_available_audio_format *available_fmt)
 {
-	void *ptr = available_fmt->ref_audio_fmt;
+	struct sof_ipc4_audio_format *fmt = available_fmt->ref_audio_fmt;
 	u32 valid_bits;
 	u32 channels;
 	u32 rate;
 	int sample_valid_bits;
 	int i;
 
-	if (!ptr) {
+	if (!fmt) {
 		dev_err(sdev->dev, "no reference formats for %s\n", swidget->widget->name);
 		return -EINVAL;
 	}
@@ -943,25 +954,14 @@ static int sof_ipc4_init_audio_fmt(struct snd_sof_dev *sdev,
 	 * Search supported audio formats to match rate, channels ,and
 	 * sample_valid_bytes from runtime params
 	 */
-	for (i = 0; i < available_fmt->audio_fmt_num; i++, ptr = (u8 *)ptr + object_offset) {
-		struct sof_ipc4_audio_format *fmt = ptr;
-
+	for (i = 0; i < available_fmt->audio_fmt_num; i++, fmt++) {
 		rate = fmt->sampling_frequency;
 		channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(fmt->fmt_cfg);
 		valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(fmt->fmt_cfg);
 		if (params_rate(params) == rate && params_channels(params) == channels &&
 		    sample_valid_bits == valid_bits) {
-			dev_dbg(sdev->dev, "matching audio format index for %uHz, %ubit, %u channels: %d\n",
+			dev_dbg(sdev->dev, "matched audio format index for %uHz, %ubit, %u channels: %d\n",
 				rate, valid_bits, channels, i);
-
-			/* copy ibs/obs and input format */
-			memcpy(base_config, &available_fmt->base_config[i],
-			       sizeof(struct sof_ipc4_base_module_cfg));
-
-			/* copy output format */
-			if (out_format)
-				memcpy(out_format, &available_fmt->out_audio_fmt[i],
-				       sizeof(struct sof_ipc4_audio_format));
 			break;
 		}
 	}
@@ -972,10 +972,25 @@ static int sof_ipc4_init_audio_fmt(struct snd_sof_dev *sdev,
 		return -EINVAL;
 	}
 
+	/* copy input format */
+	memcpy(&base_config->audio_fmt, &available_fmt->input_audio_fmts[i], sizeof(*fmt));
+
+	/* set base_cfg ibs/obs */
+	base_config->ibs = available_fmt->base_config[i].ibs;
+	base_config->obs = available_fmt->base_config[i].obs;
+
 	dev_dbg(sdev->dev, "Init input audio formats for %s\n", swidget->widget->name);
 	sof_ipc4_dbg_audio_format(sdev->dev, &base_config->audio_fmt,
 				  sizeof(*base_config), 1);
 	if (out_format) {
+		/*
+		 * Current topology defines pin 0 input and output formats only in pairs.
+		 * This assumes that the pin 0 formats are defined before all other pins.
+		 * So pick the output audio format with the same index as the chosen
+		 * input format. This logic will need to be updated when the format definitions
+		 * in topology change.
+		 */
+		memcpy(out_format, &available_fmt->out_audio_fmt[i], sizeof(*fmt));
 		dev_dbg(sdev->dev, "Init output audio formats for %s\n", swidget->widget->name);
 		sof_ipc4_dbg_audio_format(sdev->dev, out_format,
 					  sizeof(*out_format), 1);
@@ -1147,7 +1162,6 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	struct snd_sof_dai *dai;
 	struct snd_mask *fmt;
 	int out_sample_valid_bits;
-	size_t ref_audio_fmt_size;
 	void **ipc_config_data;
 	int *ipc_config_size;
 	u32 **data;
@@ -1171,17 +1185,14 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		available_fmt = &ipc4_copier->available_fmt;
 
 		/*
-		 * base_config->audio_fmt and out_audio_fmt represent the input and output audio
-		 * formats. Use the input format as the reference to match pcm params for playback
-		 * and the output format as reference for capture.
+		 * Use the input_audio_fmts to match pcm params for playback and the out_audio_fmt
+		 * for capture.
 		 */
-		if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
-			available_fmt->ref_audio_fmt = &available_fmt->base_config->audio_fmt;
-			ref_audio_fmt_size = sizeof(struct sof_ipc4_base_module_cfg);
-		} else {
+		if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+			available_fmt->ref_audio_fmt = available_fmt->input_audio_fmts;
+		else
 			available_fmt->ref_audio_fmt = available_fmt->out_audio_fmt;
-			ref_audio_fmt_size = sizeof(struct sof_ipc4_audio_format);
-		}
+
 		copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
 		copier_data->gtw_cfg.node_id |=
 			SOF_IPC4_NODE_INDEX(platform_params->stream_tag - 1);
@@ -1201,7 +1212,6 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		available_fmt = &ipc4_copier->available_fmt;
 		if (dir == SNDRV_PCM_STREAM_CAPTURE) {
 			available_fmt->ref_audio_fmt = available_fmt->out_audio_fmt;
-			ref_audio_fmt_size = sizeof(struct sof_ipc4_audio_format);
 
 			/*
 			 * modify the input params for the dai copier as it only supports
@@ -1211,8 +1221,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 			snd_mask_none(fmt);
 			snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
 		} else {
-			available_fmt->ref_audio_fmt = &available_fmt->base_config->audio_fmt;
-			ref_audio_fmt_size = sizeof(struct sof_ipc4_base_module_cfg);
+			available_fmt->ref_audio_fmt = available_fmt->input_audio_fmts;
 		}
 
 		ref_params = pipeline_params;
@@ -1232,12 +1241,8 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		copier_data = &ipc4_copier->data;
 		available_fmt = &ipc4_copier->available_fmt;
 
-		/*
-		 * base_config->audio_fmt represent the input audio formats. Use
-		 * the input format as the reference to match pcm params
-		 */
-		available_fmt->ref_audio_fmt = &available_fmt->base_config->audio_fmt;
-		ref_audio_fmt_size = sizeof(struct sof_ipc4_base_module_cfg);
+		/* Use the input formats as the reference to match pcm params */
+		available_fmt->ref_audio_fmt = available_fmt->input_audio_fmts;
 		ref_params = pipeline_params;
 
 		break;
@@ -1251,7 +1256,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	/* set input and output audio formats */
 	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &copier_data->base_config,
 				      &copier_data->out_format, ref_params,
-				      available_fmt, ref_audio_fmt_size);
+				      available_fmt);
 	if (ret < 0)
 		return ret;
 
@@ -1400,14 +1405,14 @@ static int sof_ipc4_prepare_gain_module(struct snd_sof_widget *swidget,
 	struct snd_soc_component *scomp = swidget->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct sof_ipc4_gain *gain = swidget->private;
+	struct sof_ipc4_available_audio_format *available_fmt = &gain->available_fmt;
 	int ret;
 
-	gain->available_fmt.ref_audio_fmt = &gain->available_fmt.base_config->audio_fmt;
+	available_fmt->ref_audio_fmt = available_fmt->input_audio_fmts;
 
 	/* output format is not required to be sent to the FW for gain */
 	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &gain->base_config,
-				      NULL, pipeline_params, &gain->available_fmt,
-				      sizeof(gain->base_config));
+				      NULL, pipeline_params, available_fmt);
 	if (ret < 0)
 		return ret;
 
@@ -1425,15 +1430,15 @@ static int sof_ipc4_prepare_mixer_module(struct snd_sof_widget *swidget,
 	struct snd_soc_component *scomp = swidget->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct sof_ipc4_mixer *mixer = swidget->private;
+	struct sof_ipc4_available_audio_format *available_fmt = &mixer->available_fmt;
 	int ret;
 
 	/* only 32bit is supported by mixer */
-	mixer->available_fmt.ref_audio_fmt = &mixer->available_fmt.base_config->audio_fmt;
+	available_fmt->ref_audio_fmt = available_fmt->input_audio_fmts;
 
 	/* output format is not required to be sent to the FW for mixer */
 	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &mixer->base_config,
-				      NULL, pipeline_params, &mixer->available_fmt,
-				      sizeof(mixer->base_config));
+				      NULL, pipeline_params, available_fmt);
 	if (ret < 0)
 		return ret;
 
@@ -1451,15 +1456,15 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	struct snd_soc_component *scomp = swidget->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct sof_ipc4_src *src = swidget->private;
+	struct sof_ipc4_available_audio_format *available_fmt = &src->available_fmt;
 	struct snd_interval *rate;
 	int ret;
 
-	src->available_fmt.ref_audio_fmt = &src->available_fmt.base_config->audio_fmt;
+	available_fmt->ref_audio_fmt = available_fmt->input_audio_fmts;
 
 	/* output format is not required to be sent to the FW for SRC */
 	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &src->base_config,
-				      NULL, pipeline_params, &src->available_fmt,
-				      sizeof(src->base_config));
+				      NULL, pipeline_params, available_fmt);
 	if (ret < 0)
 		return ret;
 
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 22900b572766..addc5b55cc10 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -146,6 +146,7 @@ struct ipc4_pipeline_set_state_data {
  * struct sof_ipc4_available_audio_format - Available audio formats
  * @base_config: Available base config
  * @out_audio_fmt: Available output audio format
+ * @input_audio_fmts: Available input audio formats
  * @ref_audio_fmt: Reference audio format to match runtime audio format
  * @dma_buffer_size: Available Gateway DMA buffer size (in bytes)
  * @audio_fmt_num: Number of available audio formats
@@ -153,6 +154,7 @@ struct ipc4_pipeline_set_state_data {
 struct sof_ipc4_available_audio_format {
 	struct sof_ipc4_base_module_cfg *base_config;
 	struct sof_ipc4_audio_format *out_audio_fmt;
+	struct sof_ipc4_audio_format *input_audio_fmts;
 	struct sof_ipc4_audio_format *ref_audio_fmt;
 	u32 *dma_buffer_size;
 	int audio_fmt_num;
-- 
2.39.2

