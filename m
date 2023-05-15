Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 343D4702AA9
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 12:36:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21673828;
	Mon, 15 May 2023 12:35:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21673828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684146987;
	bh=iEbruwDIQtVOt0huLfGSiQxMw+mQn5a/b9nu0Je57xE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B47wdMpDtwtQo8FXBuazyKT847UpEI6GpnWg26VYZIorIDYKGA1N+FtsDeoz/qptK
	 z0q+1cQK0aTQzUC1bxesID+nu3Ul8ZQYhIfgs+lob6KpAA3afgNkvC0uGm2aedR+7y
	 wwDxEiENbVyt7wtY51s1AI2FLExukjpyYIJlwY7c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01B5EF805E4; Mon, 15 May 2023 12:33:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B34CAF805DA;
	Mon, 15 May 2023 12:33:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D31FF805A0; Mon, 15 May 2023 12:33:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED867F80553
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 12:33:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED867F80553
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gPBGWyNT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684146783; x=1715682783;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iEbruwDIQtVOt0huLfGSiQxMw+mQn5a/b9nu0Je57xE=;
  b=gPBGWyNTtCU8ArLxkDH29Ol13WDZ0Of3rKTL/EWchk4mWY0VNOWzzLbR
   ruP5CH8fnxc84B61udTwWrrzCe/sAcDpkSDSfXwvpIb/pup6eLr1wC0Ei
   mpuAlfAiNJfZqSicDvsT+zFTwfeuFYIYzSOvqzIYZa13XxoW6dYF4fF83
   gRg3NO3kqMSljNKWA4AFC8N/Jm40s9XkNh0ckSJFYpL+0ZxLsJVHHrkQN
   JqVt4JmDePX60GTzO3q52InxfP/9lx90LtQdaPTzfLNCQ9YtlHsSODZI7
   SWyf+l+jdNkHoiWc8lk8OrlYi5ICLzhBX3Af2C1m75el1cjUeXxeZHeTK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="351200415"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200";
   d="scan'208";a="351200415"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 03:33:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694967697"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200";
   d="scan'208";a="694967697"
Received: from lpilolli-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.48.230])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 03:32:57 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 7/9] ASoC: SOF: ipc4-topology: Modify the output format
 selection logic
Date: Mon, 15 May 2023 13:33:34 +0300
Message-Id: <20230515103336.16132-8-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515103336.16132-1-peter.ujfalusi@linux.intel.com>
References: <20230515103336.16132-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7ZU6QASCYL636LDEWF2SVV6VJXDM7PY4
X-Message-ID-Hash: 7ZU6QASCYL636LDEWF2SVV6VJXDM7PY4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7ZU6QASCYL636LDEWF2SVV6VJXDM7PY4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Modify the output format selection when there are multiple output
formats available to choose the one that matches the reference params.
The reference params depend on the type of module. In the case of
processing modules, the reference params are based on the selected input
audio format. This would be the case when a processing module does not
perform any format conversion during processing.

The only special case is the copier module. The copier module is capable
of format conversion but it is only used in the case when the output
is fixed to a single format. In the case of a module copier, when there are
multiple formats, the reference params is based on the selected input
params and the output format must match that of the selected input
format. In the case of host copier, the reference params should be
based on the input audio format for playback and the FE hw_params for
capture. In the case DAI copier, the reference params should be based on
the input audio format for capture and the FE hw_params for playback
when there is no format conversion in the pipeline from the host to the
DAI.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 127 ++++++++++++++++++++++++++++------
 1 file changed, 107 insertions(+), 20 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 2903e784a5dd..7f5400612bf8 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1031,7 +1031,8 @@ static int sof_ipc4_update_hw_params(struct snd_sof_dev *sdev, struct snd_pcm_hw
 static int sof_ipc4_init_output_audio_fmt(struct snd_sof_dev *sdev,
 					  struct sof_ipc4_base_module_cfg *base_config,
 					  struct sof_ipc4_available_audio_format *available_fmt,
-					  int input_audio_format_index)
+					  u32 out_ref_rate, u32 out_ref_channels,
+					  u32 out_ref_valid_bits)
 {
 	struct sof_ipc4_audio_format *out_fmt;
 	u32 out_rate, out_channels, out_valid_bits;
@@ -1063,16 +1064,31 @@ static int sof_ipc4_init_output_audio_fmt(struct snd_sof_dev *sdev,
 	}
 
 	/* pick the first format if there's only one available or if all formats are the same */
-	if (single_format)
-		i = 0;
-	else
-		i = input_audio_format_index;
+	if (single_format) {
+		base_config->obs = available_fmt->output_pin_fmts[0].buffer_size;
+		return 0;
+	}
+
+	/*
+	 * if there are multiple output formats, then choose the output format that matches
+	 * the reference params
+	 */
+	for (i = 0; i < available_fmt->num_output_formats; i++) {
+		u32 _out_rate, _out_channels, _out_valid_bits;
 
-	if (available_fmt->num_output_formats && i < available_fmt->num_output_formats)
-		base_config->obs = available_fmt->output_pin_fmts[i].buffer_size;
+		out_fmt = &available_fmt->output_pin_fmts[i].audio_fmt;
+		_out_rate = out_fmt->sampling_frequency;
+		_out_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(out_fmt->fmt_cfg);
+		_out_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(out_fmt->fmt_cfg);
 
-	/* Return the index of the chosen output format */
-	return i;
+		if (_out_rate == out_ref_rate && _out_channels == out_ref_channels &&
+		    _out_valid_bits == out_ref_valid_bits) {
+			base_config->obs = available_fmt->output_pin_fmts[i].buffer_size;
+			return i;
+		}
+	}
+
+	return -EINVAL;
 }
 
 static int sof_ipc4_get_valid_bits(struct snd_sof_dev *sdev, struct snd_pcm_hw_params *params)
@@ -1404,6 +1420,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	int *ipc_config_size;
 	u32 **data;
 	int ipc_size, ret;
+	u32 out_ref_rate, out_ref_channels, out_ref_valid_bits;
 	u32 deep_buffer_dma_ms = 0;
 	u32 format_list_count;
 	int output_fmt_index;
@@ -1551,10 +1568,42 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	if (ret < 0)
 		return ret;
 
+	/* set the reference params for output format selection */
+	switch (swidget->id) {
+	case snd_soc_dapm_aif_in:
+	case snd_soc_dapm_dai_out:
+	case snd_soc_dapm_buffer:
+	{
+		struct sof_ipc4_audio_format *in_fmt;
+
+		in_fmt = &available_fmt->input_pin_fmts[ret].audio_fmt;
+		out_ref_rate = in_fmt->sampling_frequency;
+		out_ref_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_fmt->fmt_cfg);
+		out_ref_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_fmt->fmt_cfg);
+		break;
+	}
+	case snd_soc_dapm_aif_out:
+	case snd_soc_dapm_dai_in:
+		out_ref_valid_bits = sof_ipc4_get_valid_bits(sdev, fe_params);
+		if (out_ref_valid_bits < 0)
+			return out_ref_valid_bits;
+
+		out_ref_rate = params_rate(fe_params);
+		out_ref_channels = params_channels(fe_params);
+		break;
+	default:
+		/*
+		 * Unsupported type should be caught by the former switch default
+		 * case, this should never happen in reality.
+		 */
+		return -EINVAL;
+	}
+
 	output_fmt_index = sof_ipc4_init_output_audio_fmt(sdev, &copier_data->base_config,
-							  available_fmt, ret);
+							  available_fmt, out_ref_rate,
+							  out_ref_channels, out_ref_valid_bits);
 	if (output_fmt_index < 0) {
-		dev_err(sdev->dev, "No output formats in topology for copier %s",
+		dev_err(sdev->dev, "Failed to initialize output format for %s",
 			swidget->widget->name);
 		return output_fmt_index;
 	}
@@ -1727,6 +1776,8 @@ static int sof_ipc4_prepare_gain_module(struct snd_sof_widget *swidget,
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct sof_ipc4_gain *gain = swidget->private;
 	struct sof_ipc4_available_audio_format *available_fmt = &gain->available_fmt;
+	struct sof_ipc4_audio_format *in_fmt;
+	u32 out_ref_rate, out_ref_channels, out_ref_valid_bits;
 	int ret;
 
 	ret = sof_ipc4_init_input_audio_fmt(sdev, swidget, &gain->base_config,
@@ -1736,9 +1787,16 @@ static int sof_ipc4_prepare_gain_module(struct snd_sof_widget *swidget,
 	if (ret < 0)
 		return ret;
 
-	ret = sof_ipc4_init_output_audio_fmt(sdev, &gain->base_config, available_fmt, ret);
+	in_fmt = &available_fmt->input_pin_fmts[ret].audio_fmt;
+	out_ref_rate = in_fmt->sampling_frequency;
+	out_ref_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_fmt->fmt_cfg);
+	out_ref_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_fmt->fmt_cfg);
+
+	ret = sof_ipc4_init_output_audio_fmt(sdev, &gain->base_config, available_fmt,
+					     out_ref_rate, out_ref_channels, out_ref_valid_bits);
 	if (ret < 0) {
-		dev_err(sdev->dev, "No output formats for %s", swidget->widget->name);
+		dev_err(sdev->dev, "Failed to initialize output format for %s",
+			swidget->widget->name);
 		return ret;
 	}
 
@@ -1757,6 +1815,8 @@ static int sof_ipc4_prepare_mixer_module(struct snd_sof_widget *swidget,
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct sof_ipc4_mixer *mixer = swidget->private;
 	struct sof_ipc4_available_audio_format *available_fmt = &mixer->available_fmt;
+	struct sof_ipc4_audio_format *in_fmt;
+	u32 out_ref_rate, out_ref_channels, out_ref_valid_bits;
 	int ret;
 
 	ret = sof_ipc4_init_input_audio_fmt(sdev, swidget, &mixer->base_config,
@@ -1766,9 +1826,16 @@ static int sof_ipc4_prepare_mixer_module(struct snd_sof_widget *swidget,
 	if (ret < 0)
 		return ret;
 
-	ret = sof_ipc4_init_output_audio_fmt(sdev, &mixer->base_config, available_fmt, ret);
+	in_fmt = &available_fmt->input_pin_fmts[ret].audio_fmt;
+	out_ref_rate = in_fmt->sampling_frequency;
+	out_ref_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_fmt->fmt_cfg);
+	out_ref_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_fmt->fmt_cfg);
+
+	ret = sof_ipc4_init_output_audio_fmt(sdev, &mixer->base_config, available_fmt,
+					     out_ref_rate, out_ref_channels, out_ref_valid_bits);
 	if (ret < 0) {
-		dev_err(sdev->dev, "No output formats for %s", swidget->widget->name);
+		dev_err(sdev->dev, "Failed to initialize output format for %s",
+			swidget->widget->name);
 		return ret;
 	}
 
@@ -1787,6 +1854,8 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct sof_ipc4_src *src = swidget->private;
 	struct sof_ipc4_available_audio_format *available_fmt = &src->available_fmt;
+	struct sof_ipc4_audio_format *in_fmt;
+	u32 out_ref_rate, out_ref_channels, out_ref_valid_bits;
 	struct snd_interval *rate;
 	int ret;
 
@@ -1797,10 +1866,16 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	if (ret < 0)
 		return ret;
 
-	ret = sof_ipc4_init_output_audio_fmt(sdev, &src->base_config, available_fmt, ret);
+	in_fmt = &available_fmt->input_pin_fmts[ret].audio_fmt;
+	out_ref_rate = in_fmt->sampling_frequency;
+	out_ref_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_fmt->fmt_cfg);
+	out_ref_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_fmt->fmt_cfg);
+
+	ret = sof_ipc4_init_output_audio_fmt(sdev, &src->base_config, available_fmt,
+					     out_ref_rate, out_ref_channels, out_ref_valid_bits);
 	if (ret < 0) {
-		dev_err(sdev->dev, "No output formats for %s", swidget->widget->name);
-		return ret;
+		dev_err(sdev->dev, "Failed to initialize output format for %s",
+			swidget->widget->name);
 	}
 
 	/* update pipeline memory usage */
@@ -1901,6 +1976,8 @@ static int sof_ipc4_prepare_process_module(struct snd_sof_widget *swidget,
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct sof_ipc4_process *process = swidget->private;
 	struct sof_ipc4_available_audio_format *available_fmt = &process->available_fmt;
+	struct sof_ipc4_audio_format *in_fmt;
+	u32 out_ref_rate, out_ref_channels, out_ref_valid_bits;
 	void *cfg = process->ipc_config_data;
 	int output_fmt_index;
 	int ret;
@@ -1912,9 +1989,19 @@ static int sof_ipc4_prepare_process_module(struct snd_sof_widget *swidget,
 	if (ret < 0)
 		return ret;
 
-	/* No need to check the return value. Some processing modules do not have output pins */
+	in_fmt = &available_fmt->input_pin_fmts[ret].audio_fmt;
+	out_ref_rate = in_fmt->sampling_frequency;
+	out_ref_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_fmt->fmt_cfg);
+	out_ref_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_fmt->fmt_cfg);
+
 	output_fmt_index = sof_ipc4_init_output_audio_fmt(sdev, &process->base_config,
-							  available_fmt, ret);
+							  available_fmt, out_ref_rate,
+							  out_ref_channels, out_ref_valid_bits);
+	if (output_fmt_index < 0 && available_fmt->num_output_formats) {
+		dev_err(sdev->dev, "Failed to initialize output format for %s",
+			swidget->widget->name);
+		return output_fmt_index;
+	}
 
 	/* copy Pin 0 output format */
 	if (available_fmt->num_output_formats &&
-- 
2.40.1

