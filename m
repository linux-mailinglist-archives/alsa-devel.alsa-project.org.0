Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D7A8BADC4
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2024 15:34:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B472AE97;
	Fri,  3 May 2024 15:34:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B472AE97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714743273;
	bh=8vaCRt9dH8dpgQABTYOOMzuiRX0xElKSaoH3xbY4y0w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hn0YsolxO6IYHswUtejlypZ9QVovOr9jywnabVnfI5sNUQJ+MSuWfqfuP2qOoFClF
	 78OGkoskZsRARZ8u9p07GrtW3FT0FznnaSLPb0Skbco7XS+qLlDG7kSjhpTMK5/wPA
	 lOak3FM/6iRVWNpz5SA29tQsQ0FJdpJS6HH9MJps=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB463F805E9; Fri,  3 May 2024 15:33:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F873F805F4;
	Fri,  3 May 2024 15:33:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BA20F805AD; Fri,  3 May 2024 15:33:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4324F800AE
	for <alsa-devel@alsa-project.org>; Fri,  3 May 2024 15:33:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4324F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=B9ZFygRS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714743201; x=1746279201;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8vaCRt9dH8dpgQABTYOOMzuiRX0xElKSaoH3xbY4y0w=;
  b=B9ZFygRSjfbud5Y3tyAg7fEjrvG1f8TgdtHhXPYJfbpkGjK9+R99OvVp
   UxcrjwXkaCa3TWtjdmzWlVDSGV9SspAf40fHlIS1Gk6TkdY+cjVwg9MdM
   whLKPi8r0IAkQWAeIjn+F7g5L+grGnGNP2KIaRGCdyKyRVDPcDWJLV/Dp
   IWD173hzzh1caIJSB1YssmS9r/LipQDhlLmWexZUYtDetN7dd4/QQJ+Xk
   XsKINjb6DWVWNAzAdnIiPexit+he5RHQCopr+4DtGqpBm3z5n9UrhN2Me
   M71Wbyr/Jj066hbX7zkH4GbgCiSHo2i9OMcqWQwMIbkDTk1rhDB+Gh04Z
   w==;
X-CSE-ConnectionGUID: +BA7kGKYS4+6k9Z4fkijlA==
X-CSE-MsgGUID: U7r8iypmR+e9iVq5zAuvdw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="13499115"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="13499115"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 06:33:08 -0700
X-CSE-ConnectionGUID: GjSLQk9pQuKDS1jTkgJBxA==
X-CSE-MsgGUID: 9m7DWjptTL2vNGq511UNYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="27501269"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.113.3])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 06:33:04 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 3/3] ASoC: SOF: ipc4-topology: Correct DAI copier config and
 NHLT blob request
Date: Fri,  3 May 2024 08:32:53 -0500
Message-Id: <20240503133253.108201-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240503133253.108201-1-pierre-louis.bossart@linux.intel.com>
References: <20240503133253.108201-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EBBLN23YGKI4ML7UW3QINH4F5LAKYQRY
X-Message-ID-Hash: EBBLN23YGKI4ML7UW3QINH4F5LAKYQRY
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EBBLN23YGKI4ML7UW3QINH4F5LAKYQRY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

In case of capture and when the DAI copier have single bit depth supported
on it's input side we should use this format instead of the one in
fe_params.

Regardless of the stream direction for the NHLT blob lookup when the DAI
copier only supports single bit depth on the DAI side we should only look
for a blob which matches with this single configuration.

For DMIC if the DAI copier supports multiple bit depths, try to request
32-bit blob first if the requested bit depth is 16-bit.
If the 32-bit blob is available then look for marching (32-bit) copier
format to make sure that both the blob and copier have correct parameters.

Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 162 ++++++++++++++++++++++++++++------
 1 file changed, 136 insertions(+), 26 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index f56b7fbbe10f..d0125fd1c09f 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1420,13 +1420,16 @@ static int snd_sof_get_hw_config_params(struct snd_sof_dev *sdev, struct snd_sof
 	return 0;
 }
 
-static int snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_sof_dai *dai,
-					  struct snd_pcm_hw_params *params, u32 dai_index,
-					  u32 linktype, u8 dir, u32 **dst, u32 *len)
+static int
+snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_sof_dai *dai,
+			       bool single_format,
+			       struct snd_pcm_hw_params *params, u32 dai_index,
+			       u32 linktype, u8 dir, u32 **dst, u32 *len)
 {
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
 	struct nhlt_specific_cfg *cfg;
 	int sample_rate, channel_count;
+	bool format_change = false;
 	int bit_depth, ret;
 	u32 nhlt_type;
 	int dev_type = 0;
@@ -1435,9 +1438,18 @@ static int snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_s
 	switch (linktype) {
 	case SOF_DAI_INTEL_DMIC:
 		nhlt_type = NHLT_LINK_DMIC;
-		bit_depth = params_width(params);
 		channel_count = params_channels(params);
 		sample_rate = params_rate(params);
+		bit_depth = params_width(params);
+		/*
+		 * Look for 32-bit blob first instead of 16-bit if copier
+		 * supports multiple formats
+		 */
+		if (bit_depth == 16 && !single_format) {
+			dev_dbg(sdev->dev, "Looking for 32-bit blob first for DMIC\n");
+			format_change = true;
+			bit_depth = 32;
+		}
 		break;
 	case SOF_DAI_INTEL_SSP:
 		nhlt_type = NHLT_LINK_SSP;
@@ -1471,22 +1483,56 @@ static int snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_s
 					   dir, dev_type);
 
 	if (!cfg) {
+		if (format_change) {
+			/*
+			 * The 32-bit blob was not found in NHLT table, try to
+			 * look for one based on the params
+			 */
+			bit_depth = params_width(params);
+			format_change = false;
+
+			cfg = intel_nhlt_get_endpoint_blob(sdev->dev, ipc4_data->nhlt,
+							   dai_index, nhlt_type,
+							   bit_depth, bit_depth,
+							   channel_count, sample_rate,
+							   dir, dev_type);
+			if (cfg)
+				goto out;
+		}
+
 		dev_err(sdev->dev,
 			"no matching blob for sample rate: %d sample width: %d channels: %d\n",
 			sample_rate, bit_depth, channel_count);
 		return -EINVAL;
 	}
 
+out:
 	/* config length should be in dwords */
 	*len = cfg->size >> 2;
 	*dst = (u32 *)cfg->caps;
 
+	if (format_change) {
+		/*
+		 * Update the params to reflect that we have loaded 32-bit blob
+		 * instead of the 16-bit.
+		 * This information is going to be used by the caller to find
+		 * matching copier format on the dai side.
+		 */
+		struct snd_mask *m;
+
+		m = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+		snd_mask_none(m);
+		snd_mask_set_format(m, SNDRV_PCM_FORMAT_S32_LE);
+	}
+
 	return 0;
 }
 #else
-static int snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_sof_dai *dai,
-					  struct snd_pcm_hw_params *params, u32 dai_index,
-					  u32 linktype, u8 dir, u32 **dst, u32 *len)
+static int
+snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_sof_dai *dai,
+			       bool single_format,
+			       struct snd_pcm_hw_params *params, u32 dai_index,
+			       u32 linktype, u8 dir, u32 **dst, u32 *len)
 {
 	return 0;
 }
@@ -1517,6 +1563,68 @@ bool sof_ipc4_copier_is_single_format(struct snd_sof_dev *sdev,
 	return true;
 }
 
+static int
+sof_ipc4_prepare_dai_copier(struct snd_sof_dev *sdev, struct snd_sof_dai *dai,
+			    struct snd_pcm_hw_params *params, int dir)
+{
+	struct sof_ipc4_available_audio_format *available_fmt;
+	struct snd_pcm_hw_params dai_params = *params;
+	struct sof_ipc4_copier_data *copier_data;
+	struct sof_ipc4_copier *ipc4_copier;
+	bool single_format;
+	int ret;
+
+	ipc4_copier = dai->private;
+	copier_data = &ipc4_copier->data;
+	available_fmt = &ipc4_copier->available_fmt;
+
+	/*
+	 * If the copier on the DAI side supports only single bit depth then
+	 * this depth (format) should be used to look for the NHLT blob (if
+	 * needed) and in case of capture this should be used for the input
+	 * format lookup
+	 */
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+		single_format = sof_ipc4_copier_is_single_format(sdev,
+						available_fmt->output_pin_fmts,
+						available_fmt->num_output_formats);
+
+		/* Update the dai_params with the only supported format */
+		if (single_format) {
+			ret = sof_ipc4_update_hw_params(sdev, &dai_params,
+					&available_fmt->output_pin_fmts[0].audio_fmt,
+					BIT(SNDRV_PCM_HW_PARAM_FORMAT));
+			if (ret)
+				return ret;
+		}
+	} else {
+		single_format = sof_ipc4_copier_is_single_format(sdev,
+						available_fmt->input_pin_fmts,
+						available_fmt->num_input_formats);
+
+		/* Update the dai_params with the only supported format */
+		if (single_format) {
+			ret = sof_ipc4_update_hw_params(sdev, &dai_params,
+					&available_fmt->input_pin_fmts[0].audio_fmt,
+					BIT(SNDRV_PCM_HW_PARAM_FORMAT));
+			if (ret)
+				return ret;
+		}
+	}
+
+	ret = snd_sof_get_nhlt_endpoint_data(sdev, dai, single_format,
+					     &dai_params,
+					     ipc4_copier->dai_index,
+					     ipc4_copier->dai_type, dir,
+					     &ipc4_copier->copier_config,
+					     &copier_data->gtw_cfg.config_length);
+	/* Update the params to reflect the changes made in this function */
+	if (!ret)
+		*params = dai_params;
+
+	return ret;
+}
+
 static int
 sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 			       struct snd_pcm_hw_params *fe_params,
@@ -1527,7 +1635,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	struct snd_soc_component *scomp = swidget->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct sof_ipc4_copier_data *copier_data;
-	struct snd_pcm_hw_params *ref_params;
+	struct snd_pcm_hw_params ref_params;
 	struct sof_ipc4_copier *ipc4_copier;
 	struct snd_sof_dai *dai;
 	u32 gtw_cfg_config_length;
@@ -1605,9 +1713,9 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		 * for capture.
 		 */
 		if (dir == SNDRV_PCM_STREAM_PLAYBACK)
-			ref_params = fe_params;
+			ref_params = *fe_params;
 		else
-			ref_params = pipeline_params;
+			ref_params = *pipeline_params;
 
 		copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
 		copier_data->gtw_cfg.node_id |=
@@ -1633,23 +1741,25 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		available_fmt = &ipc4_copier->available_fmt;
 
 		/*
-		 * When there is format conversion within a pipeline, the number of supported
-		 * output formats is typically limited to just 1 for the DAI copiers. But when there
-		 * is no format conversion, the DAI copiers input format must match that of the
-		 * FE hw_params for capture and the pipeline params for playback.
+		 * Use the fe_params as a base for the copier configuration.
+		 * The ref_params might get updated to reflect what format is
+		 * supported by the copier on the DAI side.
+		 *
+		 * In case of capture the ref_params returned will be used to
+		 * find the input configuration of the copier.
 		 */
-		if (dir == SNDRV_PCM_STREAM_PLAYBACK)
-			ref_params = pipeline_params;
-		else
-			ref_params = fe_params;
-
-		ret = snd_sof_get_nhlt_endpoint_data(sdev, dai, fe_params, ipc4_copier->dai_index,
-						     ipc4_copier->dai_type, dir,
-						     &ipc4_copier->copier_config,
-						     &copier_data->gtw_cfg.config_length);
+		ref_params = *fe_params;
+		ret = sof_ipc4_prepare_dai_copier(sdev, dai, &ref_params, dir);
 		if (ret < 0)
 			return ret;
 
+		/*
+		 * For playback the pipeline_params needs to be used to find the
+		 * input configuration of the copier.
+		 */
+		if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+			ref_params = *pipeline_params;
+
 		break;
 	}
 	case snd_soc_dapm_buffer:
@@ -1657,7 +1767,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		ipc4_copier = (struct sof_ipc4_copier *)swidget->private;
 		copier_data = &ipc4_copier->data;
 		available_fmt = &ipc4_copier->available_fmt;
-		ref_params = pipeline_params;
+		ref_params = *pipeline_params;
 
 		break;
 	}
@@ -1668,8 +1778,8 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	}
 
 	/* set input and output audio formats */
-	ret = sof_ipc4_init_input_audio_fmt(sdev, swidget, &copier_data->base_config, ref_params,
-					    available_fmt);
+	ret = sof_ipc4_init_input_audio_fmt(sdev, swidget, &copier_data->base_config,
+					    &ref_params, available_fmt);
 	if (ret < 0)
 		return ret;
 
-- 
2.40.1

