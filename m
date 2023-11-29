Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AEB7FD7A7
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 14:14:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1833BE10;
	Wed, 29 Nov 2023 14:14:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1833BE10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701263674;
	bh=dwq0e7l0x80Z1wmsmGQRwkvzL5jXKW5PrzdytkqWisY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HGH246+SPHCY4CQtMhi/ETwacaoVimced1BMOxHJ8XnB9E+i2VlmfDeIETejQYxBp
	 MZZhVq3dwVsvUNpC9EyerlIGb5JeZ5mPRhMEnnlK7qGqQEBPZ+2mwqbelwqEeLlFv8
	 1Oyk426nm3m2GONJqHz4M4n/hXZcrZB7wrLnMOnU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C046BF80166; Wed, 29 Nov 2023 14:13:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5087EF805A8;
	Wed, 29 Nov 2023 14:13:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E29C7F801D5; Wed, 29 Nov 2023 14:13:50 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id F0863F80114
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 14:13:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0863F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fI89LKAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701263626; x=1732799626;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dwq0e7l0x80Z1wmsmGQRwkvzL5jXKW5PrzdytkqWisY=;
  b=fI89LKAAMIaUf4r19aq0RgsDDIysRmhWam+9eQdEgsTSnccrPxdUt/0+
   6NEauICoqOSvzSMito4DRa5k1cb7WLGC5hdbm3NBFn5fNEDPEy5xI7knh
   91OA2CekyiM2ixEGS/4DRcANrjIupoGdwkSRmwZU8Ed1uRnNSKCRbo+Vu
   t+ohJhaIO152aFxbwSCnV3834RR9Gt68W5yYOS9ajVgoL7Mn9XX3oIszU
   51GYr7Y+Xuna87jhq+Sw5LClaDUrXnVChZFn7f1G1Lf4qp6WsZ2ZTHCp9
   /vVr2234wDv38t+XSckem5BxKJqKFmK31RBJlOx+szfaIFJxan/GJFHP/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="383553831"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="383553831"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 05:13:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="912850185"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600";
   d="scan'208";a="912850185"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 05:13:38 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 1/2] ASoC: SOF: ipc4-topology: Correct data structures for the
 SRC module
Date: Wed, 29 Nov 2023 15:14:10 +0200
Message-ID: <20231129131411.27516-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129131411.27516-1-peter.ujfalusi@linux.intel.com>
References: <20231129131411.27516-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KHKHQVL7H3CLTVFB2Y5UYHQYEJ65OAKB
X-Message-ID-Hash: KHKHQVL7H3CLTVFB2Y5UYHQYEJ65OAKB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KHKHQVL7H3CLTVFB2Y5UYHQYEJ65OAKB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Separate the IPC message part as struct sof_ipc4_src_data. This struct
describes the message payload passed to the firmware via the mailbox.

It is not wise to be 'clever' and try to use the first part of a struct
as IPC message without marking the message section as packed and aligned.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 21 +++++++++++----------
 sound/soc/sof/ipc4-topology.h | 16 ++++++++++++----
 2 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index b89065abb511..417e841173fb 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -141,7 +141,7 @@ static const struct sof_topology_token gain_tokens[] = {
 /* SRC */
 static const struct sof_topology_token src_tokens[] = {
 	{SOF_TKN_SRC_RATE_OUT, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc4_src, sink_rate)},
+		offsetof(struct sof_ipc4_src_data, sink_rate)},
 };
 
 static const struct sof_token_info ipc4_token_list[SOF_TOKEN_COUNT] = {
@@ -831,11 +831,12 @@ static int sof_ipc4_widget_setup_comp_src(struct snd_sof_widget *swidget)
 
 	swidget->private = src;
 
-	ret = sof_ipc4_get_audio_fmt(scomp, swidget, &src->available_fmt, &src->base_config);
+	ret = sof_ipc4_get_audio_fmt(scomp, swidget, &src->available_fmt,
+				     &src->data.base_config);
 	if (ret)
 		goto err;
 
-	ret = sof_update_ipc_object(scomp, src, SOF_SRC_TOKENS, swidget->tuples,
+	ret = sof_update_ipc_object(scomp, &src->data, SOF_SRC_TOKENS, swidget->tuples,
 				    swidget->num_tuples, sizeof(*src), 1);
 	if (ret) {
 		dev_err(scomp->dev, "Parsing SRC tokens failed\n");
@@ -844,7 +845,7 @@ static int sof_ipc4_widget_setup_comp_src(struct snd_sof_widget *swidget)
 
 	spipe->core_mask |= BIT(swidget->core);
 
-	dev_dbg(scomp->dev, "SRC sink rate %d\n", src->sink_rate);
+	dev_dbg(scomp->dev, "SRC sink rate %d\n", src->data.sink_rate);
 
 	ret = sof_ipc4_widget_setup_msg(swidget, &src->msg);
 	if (ret)
@@ -1920,7 +1921,7 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	u32 out_ref_rate, out_ref_channels, out_ref_valid_bits;
 	int output_format_index, input_format_index;
 
-	input_format_index = sof_ipc4_init_input_audio_fmt(sdev, swidget, &src->base_config,
+	input_format_index = sof_ipc4_init_input_audio_fmt(sdev, swidget, &src->data.base_config,
 							   pipeline_params, available_fmt);
 	if (input_format_index < 0)
 		return input_format_index;
@@ -1950,7 +1951,7 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	 */
 	out_ref_rate = params_rate(fe_params);
 
-	output_format_index = sof_ipc4_init_output_audio_fmt(sdev, &src->base_config,
+	output_format_index = sof_ipc4_init_output_audio_fmt(sdev, &src->data.base_config,
 							     available_fmt, out_ref_rate,
 							     out_ref_channels, out_ref_valid_bits);
 	if (output_format_index < 0) {
@@ -1960,10 +1961,10 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	}
 
 	/* update pipeline memory usage */
-	sof_ipc4_update_resource_usage(sdev, swidget, &src->base_config);
+	sof_ipc4_update_resource_usage(sdev, swidget, &src->data.base_config);
 
 	out_audio_fmt = &available_fmt->output_pin_fmts[output_format_index].audio_fmt;
-	src->sink_rate = out_audio_fmt->sampling_frequency;
+	src->data.sink_rate = out_audio_fmt->sampling_frequency;
 
 	/* update pipeline_params for sink widgets */
 	return sof_ipc4_update_hw_params(sdev, pipeline_params, out_audio_fmt);
@@ -2364,8 +2365,8 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 	{
 		struct sof_ipc4_src *src = swidget->private;
 
-		ipc_size = sizeof(struct sof_ipc4_base_module_cfg) + sizeof(src->sink_rate);
-		ipc_data = src;
+		ipc_size = sizeof(src->data);
+		ipc_data = &src->data;
 
 		msg = &src->msg;
 		break;
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 0a57b8ab3e08..127caca5262a 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -404,16 +404,24 @@ struct sof_ipc4_mixer {
 	struct sof_ipc4_msg msg;
 };
 
-/**
- * struct sof_ipc4_src SRC config data
+/*
+ * struct sof_ipc4_src_data - IPC data for SRC
  * @base_config: IPC base config data
  * @sink_rate: Output rate for sink module
+ */
+struct sof_ipc4_src_data {
+	struct sof_ipc4_base_module_cfg base_config;
+	uint32_t sink_rate;
+} __packed __aligned(4);
+
+/**
+ * struct sof_ipc4_src - SRC config data
+ * @data: IPC base config data
  * @available_fmt: Available audio format
  * @msg: IPC4 message struct containing header and data info
  */
 struct sof_ipc4_src {
-	struct sof_ipc4_base_module_cfg base_config;
-	uint32_t sink_rate;
+	struct sof_ipc4_src_data data;
 	struct sof_ipc4_available_audio_format available_fmt;
 	struct sof_ipc4_msg msg;
 };
-- 
2.43.0

