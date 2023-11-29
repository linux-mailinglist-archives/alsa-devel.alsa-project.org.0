Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9030D7FD7A8
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 14:14:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1072A836;
	Wed, 29 Nov 2023 14:14:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1072A836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701263694;
	bh=Uy5zXgx0lci9B4dbDx3tNmZ0OM0U2EZB8iLhIeUb45E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OOGcXcTskKgPsFrwDlNXXpyNhZSdV/8EWNHie4qWcvQLM9hG6oaF5IvIT/HWjEazv
	 /ifdHVjSJPPGBb2TaVTsx7AgDHj/c6BvFlUW5v7wsJ8rOHHxOaijCYCuhjhPLvIiqi
	 bS05juDL1oSSiqKRSh4BLNGtdlKuklhwQKIxAYgY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E55CFF805DA; Wed, 29 Nov 2023 14:13:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77C93F805D6;
	Wed, 29 Nov 2023 14:13:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19BF4F805A0; Wed, 29 Nov 2023 14:13:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B5A6F80166
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 14:13:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B5A6F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UYxAw8Nc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701263627; x=1732799627;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Uy5zXgx0lci9B4dbDx3tNmZ0OM0U2EZB8iLhIeUb45E=;
  b=UYxAw8NcP9NdvOtFOa0RXqFCqnJA3DQqd34281MAeXgNGNVnQR3vLZSC
   GEfvTdpcTIyQkyvV3ONz8lRiJfTjAaMf2zRWz2jBohTspFbHTEa+NHokX
   aj9fw8ccqqkiulCQ5+yQ+tfmpZzeVHToZEXJiYgd9fV0heI6M4zEpBARc
   qyG/pkltUgVWQZ61wrxw1Aht+OlEzVNnmh2YqwI500JwgWJLoZTmy5U6z
   0uhWTI6WpasL9JzcWLChsYv/sApdUcC/kvF9u7wvME6Sj7sHDOe7u4fM8
   r9pyERbayKQ/woBc4aHvV++kLH7gplv2szhhK73Yz0/k8W+qDkqtXHohY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="383553844"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="383553844"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 05:13:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="912850193"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="912850193"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 05:13:40 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 2/2] ASoC: SOF: ipc4-topology: Correct data structures for the
 GAIN module
Date: Wed, 29 Nov 2023 15:14:11 +0200
Message-ID: <20231129131411.27516-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129131411.27516-1-peter.ujfalusi@linux.intel.com>
References: <20231129131411.27516-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZQ5T3OXJ4C4MQLQYJBUO647QU2LD6PS5
X-Message-ID-Hash: ZQ5T3OXJ4C4MQLQYJBUO647QU2LD6PS5
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZQ5T3OXJ4C4MQLQYJBUO647QU2LD6PS5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move the base_cfg to struct sof_ipc4_gain_data. This struct
describes the message payload passed to the firmware via the mailbox.

It is not wise to be 'clever' and try to use the first part of a struct
as IPC message without marking the message section as packed and aligned.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-control.c  | 20 ++++++++++----------
 sound/soc/sof/ipc4-topology.c | 31 +++++++++++++++----------------
 sound/soc/sof/ipc4-topology.h | 18 +++++++++++++-----
 3 files changed, 38 insertions(+), 31 deletions(-)

diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
index 3d2a35f27a87..1be9519de909 100644
--- a/sound/soc/sof/ipc4-control.c
+++ b/sound/soc/sof/ipc4-control.c
@@ -89,7 +89,7 @@ sof_ipc4_set_volume_data(struct snd_sof_dev *sdev, struct snd_sof_widget *swidge
 	struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
 	struct sof_ipc4_gain *gain = swidget->private;
 	struct sof_ipc4_msg *msg = &cdata->msg;
-	struct sof_ipc4_gain_data data;
+	struct sof_ipc4_gain_params params;
 	bool all_channels_equal = true;
 	u32 value;
 	int ret, i;
@@ -109,20 +109,20 @@ sof_ipc4_set_volume_data(struct snd_sof_dev *sdev, struct snd_sof_widget *swidge
 	 */
 	for (i = 0; i < scontrol->num_channels; i++) {
 		if (all_channels_equal) {
-			data.channels = SOF_IPC4_GAIN_ALL_CHANNELS_MASK;
-			data.init_val = cdata->chanv[0].value;
+			params.channels = SOF_IPC4_GAIN_ALL_CHANNELS_MASK;
+			params.init_val = cdata->chanv[0].value;
 		} else {
-			data.channels = cdata->chanv[i].channel;
-			data.init_val = cdata->chanv[i].value;
+			params.channels = cdata->chanv[i].channel;
+			params.init_val = cdata->chanv[i].value;
 		}
 
 		/* set curve type and duration from topology */
-		data.curve_duration_l = gain->data.curve_duration_l;
-		data.curve_duration_h = gain->data.curve_duration_h;
-		data.curve_type = gain->data.curve_type;
+		params.curve_duration_l = gain->data.params.curve_duration_l;
+		params.curve_duration_h = gain->data.params.curve_duration_h;
+		params.curve_type = gain->data.params.curve_type;
 
-		msg->data_ptr = &data;
-		msg->data_size = sizeof(data);
+		msg->data_ptr = &params;
+		msg->data_size = sizeof(params);
 
 		ret = sof_ipc4_set_get_kcontrol_data(scontrol, true, lock);
 		msg->data_ptr = NULL;
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 417e841173fb..06744ce96331 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -130,12 +130,12 @@ static const struct sof_topology_token comp_ext_tokens[] = {
 
 static const struct sof_topology_token gain_tokens[] = {
 	{SOF_TKN_GAIN_RAMP_TYPE, SND_SOC_TPLG_TUPLE_TYPE_WORD,
-		get_token_u32, offsetof(struct sof_ipc4_gain_data, curve_type)},
+		get_token_u32, offsetof(struct sof_ipc4_gain_params, curve_type)},
 	{SOF_TKN_GAIN_RAMP_DURATION,
 		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc4_gain_data, curve_duration_l)},
+		offsetof(struct sof_ipc4_gain_params, curve_duration_l)},
 	{SOF_TKN_GAIN_VAL, SND_SOC_TPLG_TUPLE_TYPE_WORD,
-		get_token_u32, offsetof(struct sof_ipc4_gain_data, init_val)},
+		get_token_u32, offsetof(struct sof_ipc4_gain_params, init_val)},
 };
 
 /* SRC */
@@ -740,15 +740,15 @@ static int sof_ipc4_widget_setup_comp_pga(struct snd_sof_widget *swidget)
 
 	swidget->private = gain;
 
-	gain->data.channels = SOF_IPC4_GAIN_ALL_CHANNELS_MASK;
-	gain->data.init_val = SOF_IPC4_VOL_ZERO_DB;
+	gain->data.params.channels = SOF_IPC4_GAIN_ALL_CHANNELS_MASK;
+	gain->data.params.init_val = SOF_IPC4_VOL_ZERO_DB;
 
-	ret = sof_ipc4_get_audio_fmt(scomp, swidget, &gain->available_fmt, &gain->base_config);
+	ret = sof_ipc4_get_audio_fmt(scomp, swidget, &gain->available_fmt, &gain->data.base_config);
 	if (ret)
 		goto err;
 
-	ret = sof_update_ipc_object(scomp, &gain->data, SOF_GAIN_TOKENS, swidget->tuples,
-				    swidget->num_tuples, sizeof(gain->data), 1);
+	ret = sof_update_ipc_object(scomp, &gain->data.params, SOF_GAIN_TOKENS,
+				    swidget->tuples, swidget->num_tuples, sizeof(gain->data), 1);
 	if (ret) {
 		dev_err(scomp->dev, "Parsing gain tokens failed\n");
 		goto err;
@@ -756,8 +756,8 @@ static int sof_ipc4_widget_setup_comp_pga(struct snd_sof_widget *swidget)
 
 	dev_dbg(scomp->dev,
 		"pga widget %s: ramp type: %d, ramp duration %d, initial gain value: %#x\n",
-		swidget->widget->name, gain->data.curve_type, gain->data.curve_duration_l,
-		gain->data.init_val);
+		swidget->widget->name, gain->data.params.curve_type,
+		gain->data.params.curve_duration_l, gain->data.params.init_val);
 
 	ret = sof_ipc4_widget_setup_msg(swidget, &gain->msg);
 	if (ret)
@@ -1846,7 +1846,7 @@ static int sof_ipc4_prepare_gain_module(struct snd_sof_widget *swidget,
 	u32 out_ref_rate, out_ref_channels, out_ref_valid_bits;
 	int ret;
 
-	ret = sof_ipc4_init_input_audio_fmt(sdev, swidget, &gain->base_config,
+	ret = sof_ipc4_init_input_audio_fmt(sdev, swidget, &gain->data.base_config,
 					    pipeline_params, available_fmt);
 	if (ret < 0)
 		return ret;
@@ -1856,7 +1856,7 @@ static int sof_ipc4_prepare_gain_module(struct snd_sof_widget *swidget,
 	out_ref_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_fmt->fmt_cfg);
 	out_ref_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_fmt->fmt_cfg);
 
-	ret = sof_ipc4_init_output_audio_fmt(sdev, &gain->base_config, available_fmt,
+	ret = sof_ipc4_init_output_audio_fmt(sdev, &gain->data.base_config, available_fmt,
 					     out_ref_rate, out_ref_channels, out_ref_valid_bits);
 	if (ret < 0) {
 		dev_err(sdev->dev, "Failed to initialize output format for %s",
@@ -1865,7 +1865,7 @@ static int sof_ipc4_prepare_gain_module(struct snd_sof_widget *swidget,
 	}
 
 	/* update pipeline memory usage */
-	sof_ipc4_update_resource_usage(sdev, swidget, &gain->base_config);
+	sof_ipc4_update_resource_usage(sdev, swidget, &gain->data.base_config);
 
 	return 0;
 }
@@ -2344,9 +2344,8 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 	{
 		struct sof_ipc4_gain *gain = swidget->private;
 
-		ipc_size = sizeof(struct sof_ipc4_base_module_cfg) +
-			   sizeof(struct sof_ipc4_gain_data);
-		ipc_data = gain;
+		ipc_size = sizeof(gain->data);
+		ipc_data = &gain->data;
 
 		msg = &gain->msg;
 		break;
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 127caca5262a..dce174a190dd 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -361,7 +361,7 @@ struct sof_ipc4_control_msg_payload {
 } __packed;
 
 /**
- * struct sof_ipc4_gain_data - IPC gain blob
+ * struct sof_ipc4_gain_params - IPC gain parameters
  * @channels: Channels
  * @init_val: Initial value
  * @curve_type: Curve type
@@ -369,24 +369,32 @@ struct sof_ipc4_control_msg_payload {
  * @curve_duration_l: Curve duration low part
  * @curve_duration_h: Curve duration high part
  */
-struct sof_ipc4_gain_data {
+struct sof_ipc4_gain_params {
 	uint32_t channels;
 	uint32_t init_val;
 	uint32_t curve_type;
 	uint32_t reserved;
 	uint32_t curve_duration_l;
 	uint32_t curve_duration_h;
-} __aligned(8);
+} __packed __aligned(4);
 
 /**
- * struct sof_ipc4_gain - gain config data
+ * struct sof_ipc4_gain_data - IPC gain init blob
  * @base_config: IPC base config data
+ * @params: Initial parameters for the gain module
+ */
+struct sof_ipc4_gain_data {
+	struct sof_ipc4_base_module_cfg base_config;
+	struct sof_ipc4_gain_params params;
+} __packed __aligned(4);
+
+/**
+ * struct sof_ipc4_gain - gain config data
  * @data: IPC gain blob
  * @available_fmt: Available audio format
  * @msg: message structure for gain
  */
 struct sof_ipc4_gain {
-	struct sof_ipc4_base_module_cfg base_config;
 	struct sof_ipc4_gain_data data;
 	struct sof_ipc4_available_audio_format available_fmt;
 	struct sof_ipc4_msg msg;
-- 
2.43.0

