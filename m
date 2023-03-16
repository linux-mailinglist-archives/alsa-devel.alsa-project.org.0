Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 274AE6BD229
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 15:16:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1746C10FD;
	Thu, 16 Mar 2023 15:16:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1746C10FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678976211;
	bh=PPNU5HGGIj4324bhQcWJDgpxRNZxgRIR44uOsmwhx8o=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j5qRZfneeKae51DBb0+JgIoWHDVTPvJGU2gVDgtdr5nAD/C6FqcIR7cSx7FS8pyyN
	 dTEOpsJuDuugVxpChJep2lk7Hn8Tf5LEFkNxfQt+Lxl8rPcVI37pEOQCwtUIlRXFzY
	 qGKNwQDpq0saBN9WnnUGhZhsnjlH46NQR+JHjwPA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24441F80527;
	Thu, 16 Mar 2023 15:15:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FBD0F8051B; Thu, 16 Mar 2023 15:15:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5B39F800C9
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 15:15:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5B39F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ccM/iVdT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678976103; x=1710512103;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PPNU5HGGIj4324bhQcWJDgpxRNZxgRIR44uOsmwhx8o=;
  b=ccM/iVdTVG3QXx0EzjgliyaK/cn72V+pYOb1OyNLoGt4l+z6PtWBIegB
   R0Hj3TuAROOIK6ZzWywyPbyrWd4T2xsnj7xCsl4v9vL2+jeg7nBpxt6iH
   +/t7sTz3oVE0WNHU/Yj5k4baflGlojkkGLKgBO5YEhL6+Dujpjvld3G/3
   4iCwi5YOrwSu83CrvbdlC6bfH3ZlSQdCu63EPeGAbnXx6Z79py0H7IxNu
   iskinZRBzh2Hy4jEKJNFw3xVIunfdvpI9kLzBNvcTIlY9+6bEQqayMOZB
   nL0wPXQwIV503wWudns15yNuDzxtDTkDc0tjIoERQNsZkcX8V4g2RjRna
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="365690619"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400";
   d="scan'208";a="365690619"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 07:14:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="1009238087"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400";
   d="scan'208";a="1009238087"
Received: from raberjix-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.62.186])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 07:14:33 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 1/2] ASoC: SOF: ipc4-pcm: support multiple configs for BE DAIs
Date: Thu, 16 Mar 2023 16:14:57 +0200
Message-Id: <20230316141458.13940-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316141458.13940-1-peter.ujfalusi@linux.intel.com>
References: <20230316141458.13940-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZPD5PMXVPI6ZHDNJIQ5BO7JSUDCT2C53
X-Message-ID-Hash: ZPD5PMXVPI6ZHDNJIQ5BO7JSUDCT2C53
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.com, kai.vehmanen@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZPD5PMXVPI6ZHDNJIQ5BO7JSUDCT2C53/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Backend DAIs may support multiple audio formats. Modify pipeline
setup to select a suitable configuration based on topology and
frontend DAI runtime configuration.

For sampling rate, if one of the BE DAI configurations has
a sampling rate matching that of FE DAI, configure BE DAI to
this rate.

For sample format, the current code hardcodes DAI copier sample format
to 32bit for both playback and capture pipelines. This is not always
desired, so lift the limitation and set the sample format based on
topology definitions for the copiers. For capture pipelines, we want to
set the BE DAI pipeline format based on topology instead of using the FE
DAI format. This covers the common use-case where BE DAI outputs data at
a higher sample precision and sample width is reduced later in the
pipeline. Instead of hardcoding to 32bit, use the BE DAI copier output
format defined in topology.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c      | 66 +++++++++++++++++++++++++++----
 sound/soc/sof/ipc4-topology.c | 74 +++++++++++++++++++++++++++++++----
 2 files changed, 125 insertions(+), 15 deletions(-)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 701da5ee4e4e..4598057b7f28 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -362,15 +362,68 @@ static void ipc4_ssp_dai_config_pcm_params_match(struct snd_sof_dev *sdev, const
 	}
 }
 
+/*
+ * Fixup DAI link parameters for sampling rate based on
+ * DAI copier configuration.
+ */
+static int sof_ipc4_pcm_dai_link_fixup_rate(struct snd_sof_dev *sdev,
+					    struct snd_pcm_hw_params *params,
+					    struct sof_ipc4_copier *ipc4_copier)
+{
+	struct sof_ipc4_pin_format *pin_fmts = ipc4_copier->available_fmt.input_pin_fmts;
+	struct snd_interval *rate = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
+	int num_input_formats = ipc4_copier->available_fmt.num_input_formats;
+	unsigned int fe_rate = params_rate(params);
+	bool fe_be_rate_match = false;
+	bool single_be_rate = true;
+	unsigned int be_rate;
+	int i;
+
+	/*
+	 * Copier does not change sampling rate, so we
+	 * need to only consider the input pin information.
+	 */
+	for (i = 0; i < num_input_formats; i++) {
+		unsigned int val = pin_fmts[i].audio_fmt.sampling_frequency;
+
+		if (i == 0)
+			be_rate = val;
+		else if (val != be_rate)
+			single_be_rate = false;
+
+		if (val == fe_rate) {
+			fe_be_rate_match = true;
+			break;
+		}
+	}
+
+	/*
+	 * If rate is different than FE rate, topology must
+	 * contain an SRC. But we do require topology to
+	 * define a single rate in the DAI copier config in
+	 * this case (FE rate may be variable).
+	 */
+	if (!fe_be_rate_match) {
+		if (!single_be_rate) {
+			dev_err(sdev->dev, "Unable to select sampling rate for DAI link\n");
+			return -EINVAL;
+		}
+
+		rate->min = be_rate;
+		rate->max = rate->min;
+	}
+
+	return 0;
+}
+
 static int sof_ipc4_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 				       struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
 	struct snd_sof_dai *dai = snd_sof_find_dai(component, rtd->dai_link->name);
-	struct snd_interval *rate = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
-	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct sof_ipc4_copier *ipc4_copier;
+	int ret;
 
 	if (!dai) {
 		dev_err(component->dev, "%s: No DAI found with name %s\n", __func__,
@@ -385,12 +438,9 @@ static int sof_ipc4_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 		return -EINVAL;
 	}
 
-	/* always set BE format to 32-bits for both playback and capture */
-	snd_mask_none(fmt);
-	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
-
-	rate->min = ipc4_copier->available_fmt.input_pin_fmts->audio_fmt.sampling_frequency;
-	rate->max = rate->min;
+	ret = sof_ipc4_pcm_dai_link_fixup_rate(sdev, params, ipc4_copier);
+	if (ret)
+		return ret;
 
 	switch (ipc4_copier->dai_type) {
 	case SOF_DAI_INTEL_SSP:
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index e7b3bdc95dd7..cf438f32b4ed 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1069,6 +1069,69 @@ static int snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_s
 }
 #endif
 
+static int ipc4_set_fmt_mask(struct snd_mask *fmt, unsigned int bit_depth)
+{
+	switch (bit_depth) {
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
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ipc4_copier_set_capture_fmt(struct snd_sof_dev *sdev,
+				       struct snd_pcm_hw_params *pipeline_params,
+				       struct snd_pcm_hw_params *fe_params,
+				       struct sof_ipc4_available_audio_format *available_fmt)
+{
+	struct sof_ipc4_audio_format *audio_fmt;
+	unsigned int sample_valid_bits;
+	bool multiple_formats = false;
+	bool fe_format_match = false;
+	struct snd_mask *fmt;
+	int i;
+
+	for (i = 0; i < available_fmt->num_output_formats; i++) {
+		unsigned int val;
+
+		audio_fmt = &available_fmt->output_pin_fmts[i].audio_fmt;
+		val = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(audio_fmt->fmt_cfg);
+
+		if (i == 0)
+			sample_valid_bits = val;
+		else if (sample_valid_bits != val)
+			multiple_formats = true;
+
+		if (snd_pcm_format_width(params_format(fe_params)) == val)
+			fe_format_match = true;
+	}
+
+	fmt = hw_param_mask(pipeline_params, SNDRV_PCM_HW_PARAM_FORMAT);
+	snd_mask_none(fmt);
+
+	if (multiple_formats) {
+		if (fe_format_match) {
+			/* multiple formats defined and one matches FE */
+			snd_mask_set_format(fmt, params_format(fe_params));
+			return 0;
+		}
+
+		dev_err(sdev->dev, "Multiple audio formats for single dai_out not supported\n");
+		return -EINVAL;
+	}
+
+	return ipc4_set_fmt_mask(fmt, sample_valid_bits);
+}
+
 static int
 sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 			       struct snd_pcm_hw_params *fe_params,
@@ -1152,13 +1215,10 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 			format_list_to_search = available_fmt->output_pin_fmts;
 			format_list_count = available_fmt->num_output_formats;
 
-			/*
-			 * modify the input params for the dai copier as it only supports
-			 * 32-bit always
-			 */
-			fmt = hw_param_mask(pipeline_params, SNDRV_PCM_HW_PARAM_FORMAT);
-			snd_mask_none(fmt);
-			snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
+			ret = ipc4_copier_set_capture_fmt(sdev, pipeline_params, fe_params,
+							  available_fmt);
+			if (ret < 0)
+				return ret;
 		} else {
 			format_list_to_search = available_fmt->input_pin_fmts;
 			format_list_count = available_fmt->num_input_formats;
-- 
2.39.2

