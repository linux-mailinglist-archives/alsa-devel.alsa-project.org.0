Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D006A6B7814
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 13:53:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 430F71492;
	Mon, 13 Mar 2023 13:52:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 430F71492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678711988;
	bh=9Ik4AHMVR+Mwcmw0qKQgE5IdSS8hbEWBcq0b/fer4m8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L4aKgT/TgpUTGikNqvWWUnx1hSJoVJWJAel0mGNG6Y51FmIoMrXB/oxikqT5+ikjC
	 1PbqFOX6FVEtKx9xiPeu7Jw9fSbOxJtW1g+wyB4TeNyfLeamE2gG6jyLbqLV8aSMWJ
	 pvGGBVSWAepYKHJWfA57APQoxRWTtnmu6CeXsQ4w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8730F805AB;
	Mon, 13 Mar 2023 13:49:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26EFDF8057D; Mon, 13 Mar 2023 13:49:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A639F80567
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 13:49:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A639F80567
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FBa2zQcC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678711776; x=1710247776;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9Ik4AHMVR+Mwcmw0qKQgE5IdSS8hbEWBcq0b/fer4m8=;
  b=FBa2zQcC+gWOuiCHJR+melDp8AybistMqDn/O9DNDxZwiCREozgXGrJ0
   wncMP7oKr3uhqJ98Oms/tnquDcESGnKvG7DkoSbsEHSaJySK98B5Dzcce
   Qm2lLaPC/hCQAAJY/kr0hTqQ6bWywfE6V1eqOM1w8re62b87Gx3JpavLI
   p9yOuRXcDSwEAwN+2oTDeEEqThCTlm4c2sUpDputikSpneujw8e5uTdM/
   6zLV9fTERy/Vv4G70odeGVuvS+thDWxkT372SZgYbShqdqEJXhWXyl7EZ
   AH3TL8ebbkqutXaCRgmSjSzrYev5mn4J/xotLWX//IrZ4WmRBNhiO0Z8n
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="399728121"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="399728121"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 05:49:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="711116520"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="711116520"
Received: from tchambon-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.43.68])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 05:48:57 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 09/11] ASoC: SOF: ipc4-topology: Remove the ref_audio_fmt
 field
Date: Mon, 13 Mar 2023 14:48:54 +0200
Message-Id: <20230313124856.8140-10-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313124856.8140-1-peter.ujfalusi@linux.intel.com>
References: <20230313124856.8140-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 33JD5MHEFHKNIIJB6BHISHZ2RCS7GMGE
X-Message-ID-Hash: 33JD5MHEFHKNIIJB6BHISHZ2RCS7GMGE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/33JD5MHEFHKNIIJB6BHISHZ2RCS7GMGE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Remove the field in struct sof_ipc4_available_audio_format and pass the
format list to be searched as an argument to sof_ipc4_init_audio_fmt()
directly.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 42 +++++++++++++++--------------------
 sound/soc/sof/ipc4-topology.h |  2 --
 2 files changed, 18 insertions(+), 26 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index baa8f4fa6d20..3aacc440a5e4 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -829,16 +829,16 @@ static int sof_ipc4_init_audio_fmt(struct snd_sof_dev *sdev,
 				   struct snd_sof_widget *swidget,
 				   struct sof_ipc4_base_module_cfg *base_config,
 				   struct snd_pcm_hw_params *params,
-				   struct sof_ipc4_available_audio_format *available_fmt)
+				   struct sof_ipc4_available_audio_format *available_fmt,
+				   struct sof_ipc4_pin_format *pin_fmts)
 {
-	struct sof_ipc4_pin_format *pin_fmt = available_fmt->ref_audio_fmt;
 	u32 valid_bits;
 	u32 channels;
 	u32 rate;
 	int sample_valid_bits;
 	int i;
 
-	if (!pin_fmt) {
+	if (!pin_fmts) {
 		dev_err(sdev->dev, "no reference formats for %s\n", swidget->widget->name);
 		return -EINVAL;
 	}
@@ -868,7 +868,7 @@ static int sof_ipc4_init_audio_fmt(struct snd_sof_dev *sdev,
 	 * sample_valid_bytes from runtime params
 	 */
 	for (i = 0; i < available_fmt->audio_fmt_num; i++) {
-		struct sof_ipc4_audio_format *fmt = &pin_fmt[i].audio_fmt;
+		struct sof_ipc4_audio_format *fmt = &pin_fmts[i].audio_fmt;
 
 		rate = fmt->sampling_frequency;
 		channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(fmt->fmt_cfg);
@@ -1058,6 +1058,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	struct sof_ipc4_available_audio_format *available_fmt;
 	struct snd_soc_component *scomp = swidget->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct sof_ipc4_pin_format *format_list_to_search;
 	struct sof_ipc4_copier_data *copier_data;
 	struct snd_pcm_hw_params *ref_params;
 	struct sof_ipc4_copier *ipc4_copier;
@@ -1102,9 +1103,9 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		 * for capture.
 		 */
 		if (dir == SNDRV_PCM_STREAM_PLAYBACK)
-			available_fmt->ref_audio_fmt = available_fmt->input_pin_fmts;
+			format_list_to_search = available_fmt->input_pin_fmts;
 		else
-			available_fmt->ref_audio_fmt = available_fmt->output_pin_fmts;
+			format_list_to_search = available_fmt->output_pin_fmts;
 
 		copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
 		copier_data->gtw_cfg.node_id |=
@@ -1124,7 +1125,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		copier_data = &ipc4_copier->data;
 		available_fmt = &ipc4_copier->available_fmt;
 		if (dir == SNDRV_PCM_STREAM_CAPTURE) {
-			available_fmt->ref_audio_fmt = available_fmt->output_pin_fmts;
+			format_list_to_search = available_fmt->output_pin_fmts;
 
 			/*
 			 * modify the input params for the dai copier as it only supports
@@ -1134,7 +1135,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 			snd_mask_none(fmt);
 			snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
 		} else {
-			available_fmt->ref_audio_fmt = available_fmt->input_pin_fmts;
+			format_list_to_search = available_fmt->input_pin_fmts;
 		}
 
 		ref_params = pipeline_params;
@@ -1154,8 +1155,8 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		copier_data = &ipc4_copier->data;
 		available_fmt = &ipc4_copier->available_fmt;
 
-		/* Use the input formats as the reference to match pcm params */
-		available_fmt->ref_audio_fmt = available_fmt->input_pin_fmts;
+		/* Use the input formats to match pcm params */
+		format_list_to_search = available_fmt->input_pin_fmts;
 		ref_params = pipeline_params;
 
 		break;
@@ -1168,7 +1169,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 
 	/* set input and output audio formats */
 	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &copier_data->base_config, ref_params,
-				      available_fmt);
+				      available_fmt, format_list_to_search);
 	if (ret < 0)
 		return ret;
 
@@ -1353,11 +1354,9 @@ static int sof_ipc4_prepare_gain_module(struct snd_sof_widget *swidget,
 	struct sof_ipc4_available_audio_format *available_fmt = &gain->available_fmt;
 	int ret;
 
-	available_fmt->ref_audio_fmt = available_fmt->input_pin_fmts;
-
-	/* output format is not required to be sent to the FW for gain */
 	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &gain->base_config,
-				      pipeline_params, available_fmt);
+				      pipeline_params, available_fmt,
+				      available_fmt->input_pin_fmts);
 	if (ret < 0)
 		return ret;
 
@@ -1378,12 +1377,9 @@ static int sof_ipc4_prepare_mixer_module(struct snd_sof_widget *swidget,
 	struct sof_ipc4_available_audio_format *available_fmt = &mixer->available_fmt;
 	int ret;
 
-	/* only 32bit is supported by mixer */
-	available_fmt->ref_audio_fmt = available_fmt->input_pin_fmts;
-
-	/* output format is not required to be sent to the FW for mixer */
 	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &mixer->base_config,
-				      pipeline_params, available_fmt);
+				      pipeline_params, available_fmt,
+				      available_fmt->input_pin_fmts);
 	if (ret < 0)
 		return ret;
 
@@ -1405,11 +1401,9 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	struct snd_interval *rate;
 	int ret;
 
-	available_fmt->ref_audio_fmt = available_fmt->input_pin_fmts;
-
-	/* output format is not required to be sent to the FW for SRC */
 	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &src->base_config,
-				      pipeline_params, available_fmt);
+				      pipeline_params, available_fmt,
+				      available_fmt->input_pin_fmts);
 	if (ret < 0)
 		return ret;
 
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 2d9b1ba549f7..6359ef8736ae 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -164,13 +164,11 @@ struct sof_ipc4_pin_format {
  * struct sof_ipc4_available_audio_format - Available audio formats
  * @output_pin_fmts: Available output pin formats
  * @input_pin_fmts: Available input pin formats
- * @ref_audio_fmt: Reference audio format to match runtime audio format
  * @audio_fmt_num: Number of available audio formats
  */
 struct sof_ipc4_available_audio_format {
 	struct sof_ipc4_pin_format *output_pin_fmts;
 	struct sof_ipc4_pin_format *input_pin_fmts;
-	struct sof_ipc4_pin_format *ref_audio_fmt;
 	int audio_fmt_num;
 };
 
-- 
2.39.2

