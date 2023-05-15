Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E27B7702AAA
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 12:36:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 203D791;
	Mon, 15 May 2023 12:35:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 203D791
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684146998;
	bh=BVGYFgIQ+0SCKhJx4K3gC+2K2vOkV2U3q+e28jRGrX4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bfKVXaPr18FtrihAE+L4fTfk/2V08HTMnR3BKafRI8W8VZkjNPsYftwnu4fz4pFAI
	 OmQvsYKVCBBvKt74RqoR+OYAR/euRu92Ly5UyUKgnnV6qgkuBFLGGrPWTQUFW//mMH
	 z1zFOXrJg/mIncWve17WjIZpGFbB3PHSdG2UZ/v4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B31D3F805EF; Mon, 15 May 2023 12:33:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9FDAF805E3;
	Mon, 15 May 2023 12:33:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DA7AF805AC; Mon, 15 May 2023 12:33:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3DE65F8024E
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 12:33:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DE65F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OSDWpiaR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684146786; x=1715682786;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BVGYFgIQ+0SCKhJx4K3gC+2K2vOkV2U3q+e28jRGrX4=;
  b=OSDWpiaRmoqpknw2GrsfqkmhPHmfus8mKa7LdBfYcBcaT0U2DBQselNS
   j5qHw/oAhdToKSME88+nE7WSuAtzN6kOXazLSLZy69iignsY3G1Iw88/1
   PXV73yndIRPtqB3zMZec1zgbvFIqp2FxhHbtQnxKOx+4D/RXOjSgmXF0b
   egYCIRNhRTcH46QtoFoFZhTH8wlukyQwMBKHGgMWmGHfcBMSDS2I0CN3J
   YEHxxBsH3xT8ZEwrLwLS1HSzq1NI2JiVr0DEQW59KNguwf+Arvj1TZdp9
   2jOrLnJ18sl2+44+SIOgTyPXPbx6hm/IVhlaYImoyRg7SgC8r/E12+rna
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="351200431"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200";
   d="scan'208";a="351200431"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 03:33:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694967726"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200";
   d="scan'208";a="694967726"
Received: from lpilolli-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.48.230])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 03:33:02 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 9/9] ASoC: SOF: ipc4-topology: Modify input audio format
 selection logic
Date: Mon, 15 May 2023 13:33:36 +0300
Message-Id: <20230515103336.16132-10-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515103336.16132-1-peter.ujfalusi@linux.intel.com>
References: <20230515103336.16132-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VWLGSHQS3AWTZSEL6KDM2PUY3REROFO2
X-Message-ID-Hash: VWLGSHQS3AWTZSEL6KDM2PUY3REROFO2
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VWLGSHQS3AWTZSEL6KDM2PUY3REROFO2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

The current selection logic assumes that input and output formats always
come in pairs in topology. Handle this special case by checking if all
input formats are the same. And for the case where there are multiple
supported input audio formats, modify the selection logic to pick the
audio formats based on the reference params which is either the FE
hw_params or the pipeline params based on the type of module.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 132 +++++++++-------------------------
 1 file changed, 32 insertions(+), 100 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 723e72d2d325..f2c5e3c61f90 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1119,36 +1119,34 @@ static int sof_ipc4_init_input_audio_fmt(struct snd_sof_dev *sdev,
 					 struct snd_sof_widget *swidget,
 					 struct sof_ipc4_base_module_cfg *base_config,
 					 struct snd_pcm_hw_params *params,
-					 struct sof_ipc4_available_audio_format *available_fmt,
-					 struct sof_ipc4_pin_format *pin_fmts, u32 pin_fmts_size)
+					 struct sof_ipc4_available_audio_format *available_fmt)
 {
+	struct sof_ipc4_pin_format *pin_fmts = available_fmt->input_pin_fmts;
+	u32 pin_fmts_size = available_fmt->num_input_formats;
 	u32 valid_bits;
 	u32 channels;
 	u32 rate;
+	bool single_format;
 	int sample_valid_bits;
 	int i = 0;
 
-	if (!pin_fmts) {
-		dev_err(sdev->dev, "no reference formats for %s\n", swidget->widget->name);
+	if (!available_fmt->num_input_formats) {
+		dev_err(sdev->dev, "no input formats for %s\n", swidget->widget->name);
 		return -EINVAL;
 	}
 
+	single_format = sof_ipc4_is_single_format(sdev, available_fmt->input_pin_fmts,
+						  available_fmt->num_input_formats);
+	if (single_format)
+		goto in_fmt;
+
 	sample_valid_bits = sof_ipc4_get_valid_bits(sdev, params);
 	if (sample_valid_bits < 0)
 		return sample_valid_bits;
 
-	if (!pin_fmts_size) {
-		dev_err(sdev->dev, "no formats available for %s\n", swidget->widget->name);
-		return -EINVAL;
-	}
-
-	/* pick the only available input format */
-	if (available_fmt->num_input_formats == 1)
-		goto in_fmt;
-
 	/*
-	 * Search supported audio formats with pin index 0 to match rate, channels ,and
-	 * sample_valid_bytes from runtime params
+	 * Search supported input audio formats with pin index 0 to match rate, channels and
+	 * sample_valid_bits from reference params
 	 */
 	for (i = 0; i < pin_fmts_size; i++) {
 		struct sof_ipc4_audio_format *fmt = &pin_fmts[i].audio_fmt;
@@ -1365,50 +1363,6 @@ static int ipc4_set_fmt_mask(struct snd_mask *fmt, unsigned int bit_depth)
 	return 0;
 }
 
-static int ipc4_copier_set_capture_fmt(struct snd_sof_dev *sdev,
-				       struct snd_pcm_hw_params *pipeline_params,
-				       struct snd_pcm_hw_params *fe_params,
-				       struct sof_ipc4_available_audio_format *available_fmt)
-{
-	struct sof_ipc4_audio_format *audio_fmt;
-	unsigned int sample_valid_bits;
-	bool multiple_formats = false;
-	bool fe_format_match = false;
-	struct snd_mask *fmt;
-	int i;
-
-	for (i = 0; i < available_fmt->num_output_formats; i++) {
-		unsigned int val;
-
-		audio_fmt = &available_fmt->output_pin_fmts[i].audio_fmt;
-		val = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(audio_fmt->fmt_cfg);
-
-		if (i == 0)
-			sample_valid_bits = val;
-		else if (sample_valid_bits != val)
-			multiple_formats = true;
-
-		if (snd_pcm_format_width(params_format(fe_params)) == val)
-			fe_format_match = true;
-	}
-
-	fmt = hw_param_mask(pipeline_params, SNDRV_PCM_HW_PARAM_FORMAT);
-	snd_mask_none(fmt);
-
-	if (multiple_formats) {
-		if (fe_format_match) {
-			/* multiple formats defined and one matches FE */
-			snd_mask_set_format(fmt, params_format(fe_params));
-			return 0;
-		}
-
-		dev_err(sdev->dev, "Multiple audio formats for single dai_out not supported\n");
-		return -EINVAL;
-	}
-
-	return ipc4_set_fmt_mask(fmt, sample_valid_bits);
-}
-
 static int
 sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 			       struct snd_pcm_hw_params *fe_params,
@@ -1418,7 +1372,6 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	struct sof_ipc4_available_audio_format *available_fmt;
 	struct snd_soc_component *scomp = swidget->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	struct sof_ipc4_pin_format *format_list_to_search;
 	struct sof_ipc4_copier_data *copier_data;
 	struct snd_pcm_hw_params *ref_params;
 	struct sof_ipc4_copier *ipc4_copier;
@@ -1431,7 +1384,6 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	int ipc_size, ret;
 	u32 out_ref_rate, out_ref_channels, out_ref_valid_bits;
 	u32 deep_buffer_dma_ms = 0;
-	u32 format_list_count;
 	int output_fmt_index;
 
 	dev_dbg(sdev->dev, "copier %s, type %d", swidget->widget->name, swidget->id);
@@ -1496,13 +1448,10 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		 * Use the input_pin_fmts to match pcm params for playback and the output_pin_fmts
 		 * for capture.
 		 */
-		if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
-			format_list_to_search = available_fmt->input_pin_fmts;
-			format_list_count = available_fmt->num_input_formats;
-		} else {
-			format_list_to_search = available_fmt->output_pin_fmts;
-			format_list_count = available_fmt->num_output_formats;
-		}
+		if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+			ref_params = fe_params;
+		else
+			ref_params = pipeline_params;
 
 		copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
 		copier_data->gtw_cfg.node_id |=
@@ -1510,7 +1459,6 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 
 		/* set gateway attributes */
 		gtw_attr->lp_buffer_alloc = pipeline->lp_mode;
-		ref_params = fe_params;
 		break;
 	}
 	case snd_soc_dapm_dai_in:
@@ -1527,20 +1475,17 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		ipc4_copier = (struct sof_ipc4_copier *)dai->private;
 		copier_data = &ipc4_copier->data;
 		available_fmt = &ipc4_copier->available_fmt;
-		if (dir == SNDRV_PCM_STREAM_CAPTURE) {
-			format_list_to_search = available_fmt->output_pin_fmts;
-			format_list_count = available_fmt->num_output_formats;
-
-			ret = ipc4_copier_set_capture_fmt(sdev, pipeline_params, fe_params,
-							  available_fmt);
-			if (ret < 0)
-				return ret;
-		} else {
-			format_list_to_search = available_fmt->input_pin_fmts;
-			format_list_count = available_fmt->num_input_formats;
-		}
 
-		ref_params = pipeline_params;
+		/*
+		 * When there is format conversion within a pipeline, the number of supported
+		 * output formats is typically limited to just 1 for the DAI copiers. But when there
+		 * is no format conversion, the DAI copiers input format must match that of the
+		 * FE hw_params for capture and the pipeline params for playback.
+		 */
+		if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+			ref_params = pipeline_params;
+		else
+			ref_params = fe_params;
 
 		ret = snd_sof_get_nhlt_endpoint_data(sdev, dai, fe_params, ipc4_copier->dai_index,
 						     ipc4_copier->dai_type, dir,
@@ -1556,10 +1501,6 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		ipc4_copier = (struct sof_ipc4_copier *)swidget->private;
 		copier_data = &ipc4_copier->data;
 		available_fmt = &ipc4_copier->available_fmt;
-
-		/* Use the input formats to match pcm params */
-		format_list_to_search = available_fmt->input_pin_fmts;
-		format_list_count = available_fmt->num_input_formats;
 		ref_params = pipeline_params;
 
 		break;
@@ -1572,8 +1513,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 
 	/* set input and output audio formats */
 	ret = sof_ipc4_init_input_audio_fmt(sdev, swidget, &copier_data->base_config, ref_params,
-					    available_fmt, format_list_to_search,
-					    format_list_count);
+					    available_fmt);
 	if (ret < 0)
 		return ret;
 
@@ -1790,9 +1730,7 @@ static int sof_ipc4_prepare_gain_module(struct snd_sof_widget *swidget,
 	int ret;
 
 	ret = sof_ipc4_init_input_audio_fmt(sdev, swidget, &gain->base_config,
-					    pipeline_params, available_fmt,
-					    available_fmt->input_pin_fmts,
-					    available_fmt->num_input_formats);
+					    pipeline_params, available_fmt);
 	if (ret < 0)
 		return ret;
 
@@ -1829,9 +1767,7 @@ static int sof_ipc4_prepare_mixer_module(struct snd_sof_widget *swidget,
 	int ret;
 
 	ret = sof_ipc4_init_input_audio_fmt(sdev, swidget, &mixer->base_config,
-					    pipeline_params, available_fmt,
-					    available_fmt->input_pin_fmts,
-					    available_fmt->num_input_formats);
+					    pipeline_params, available_fmt);
 	if (ret < 0)
 		return ret;
 
@@ -1869,9 +1805,7 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	int ret;
 
 	ret = sof_ipc4_init_input_audio_fmt(sdev, swidget, &src->base_config,
-					    pipeline_params, available_fmt,
-					    available_fmt->input_pin_fmts,
-					    available_fmt->num_input_formats);
+					    pipeline_params, available_fmt);
 	if (ret < 0)
 		return ret;
 
@@ -1992,9 +1926,7 @@ static int sof_ipc4_prepare_process_module(struct snd_sof_widget *swidget,
 	int ret;
 
 	ret = sof_ipc4_init_input_audio_fmt(sdev, swidget, &process->base_config,
-					    pipeline_params, available_fmt,
-					    available_fmt->input_pin_fmts,
-					    available_fmt->num_input_formats);
+					    pipeline_params, available_fmt);
 	if (ret < 0)
 		return ret;
 
-- 
2.40.1

