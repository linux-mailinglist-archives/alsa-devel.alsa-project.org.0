Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B6C702AA0
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 12:34:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9689F851;
	Mon, 15 May 2023 12:33:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9689F851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684146885;
	bh=0/CDwCc5pBY2NVThG7z6a417/8v+xSYsl4OGTVXDk00=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QX9eovqNK2Vu1iFhbPL0KaE6mWj2ATOQH3/KvASP9k1F58C9n3NCMKmP9q7y5EWnz
	 I6tw8xhACcR8ndyJEu/cugyqzgxdSaCd85TduD0hDB0Tvbf/dlshu6v+b73n4bDBF2
	 1pFFBj4N07tD3DOM07guXjkGFO3JTKvR1z7DiMso=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7D75F8057D; Mon, 15 May 2023 12:33:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BDF4F80272;
	Mon, 15 May 2023 12:33:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B59D3F80431; Mon, 15 May 2023 12:32:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 069C6F80272
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 12:32:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 069C6F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=e8SuXGXu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684146772; x=1715682772;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0/CDwCc5pBY2NVThG7z6a417/8v+xSYsl4OGTVXDk00=;
  b=e8SuXGXuvtAjp49wvXTZTkCu/ZLairIxyXJ+egmEqRvHmI0qm8YXfayS
   L2txgwUevanQDjDHcdgJqYZRUPsYHX9wUMJ0eObwfPX5pE12N5ezzqPJZ
   vKRaOy6Z4FFprWulJ3ekWrT8SI45UkpDde7xyEndklb+izBR3WTI1+mMw
   uR6SDrvjOIWN1zNL4tlWFCk1gckNSfJQBpi3c4X3agvrL2tMt7eh5TMEl
   nB/nLVYMZXVmEBn64C7Vf/oIdkCOYQvq90MnuqhwM56rxjZDvAvpdwltW
   qqqkrAagioPwxngtJ9UI73blRVlPPVmjH9h1xbCglWnrZMQ6NeyGUDiyL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="351200360"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200";
   d="scan'208";a="351200360"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 03:32:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694967658"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200";
   d="scan'208";a="694967658"
Received: from lpilolli-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.48.230])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 03:32:48 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 3/9] ASoC: SOF: ipc4-topology: Move the call to init output
 format
Date: Mon, 15 May 2023 13:33:30 +0300
Message-Id: <20230515103336.16132-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515103336.16132-1-peter.ujfalusi@linux.intel.com>
References: <20230515103336.16132-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EZUJB4NFX4WTL2W6RGZWHW7MVFYOBIVO
X-Message-ID-Hash: EZUJB4NFX4WTL2W6RGZWHW7MVFYOBIVO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EZUJB4NFX4WTL2W6RGZWHW7MVFYOBIVO/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

In preparation for changing the logic for input/output format selection,
move the call to sof_ipc4_init_output_audio_fmt() into the individual
widget prepare ops.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 7c448342ff92..87ab415b27da 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1130,7 +1130,7 @@ static int sof_ipc4_init_audio_fmt(struct snd_sof_dev *sdev,
 		sof_ipc4_dbg_audio_format(sdev->dev, &available_fmt->input_pin_fmts[i], 1);
 	}
 
-	return sof_ipc4_init_output_audio_fmt(sdev, base_config, available_fmt, i);
+	return i;
 }
 
 static void sof_ipc4_unprepare_copier_module(struct snd_sof_widget *swidget)
@@ -1375,6 +1375,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	int ipc_size, ret;
 	u32 deep_buffer_dma_ms = 0;
 	u32 format_list_count;
+	int output_fmt_index;
 
 	dev_dbg(sdev->dev, "copier %s, type %d", swidget->widget->name, swidget->id);
 
@@ -1518,6 +1519,9 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	if (ret < 0)
 		return ret;
 
+	output_fmt_index = sof_ipc4_init_output_audio_fmt(sdev, &copier_data->base_config,
+							  available_fmt, ret);
+
 	/*
 	 * Set the output format. Current topology defines pin 0 input and output formats in pairs.
 	 * This assumes that the pin 0 formats are defined before all other pins.
@@ -1525,10 +1529,11 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	 * input format. This logic will need to be updated when the format definitions
 	 * in topology change.
 	 */
-	memcpy(&copier_data->out_format, &available_fmt->output_pin_fmts[ret].audio_fmt,
+	memcpy(&copier_data->out_format,
+	       &available_fmt->output_pin_fmts[output_fmt_index].audio_fmt,
 	       sizeof(struct sof_ipc4_audio_format));
 	dev_dbg(sdev->dev, "Output audio format for %s\n", swidget->widget->name);
-	sof_ipc4_dbg_audio_format(sdev->dev, &available_fmt->output_pin_fmts[ret], 1);
+	sof_ipc4_dbg_audio_format(sdev->dev, &available_fmt->output_pin_fmts[output_fmt_index], 1);
 
 	switch (swidget->id) {
 	case snd_soc_dapm_dai_in:
@@ -1694,6 +1699,8 @@ static int sof_ipc4_prepare_gain_module(struct snd_sof_widget *swidget,
 	if (ret < 0)
 		return ret;
 
+	sof_ipc4_init_output_audio_fmt(sdev, &gain->base_config, available_fmt, ret);
+
 	/* update pipeline memory usage */
 	sof_ipc4_update_pipeline_mem_usage(sdev, swidget, &gain->base_config);
 
@@ -1718,6 +1725,8 @@ static int sof_ipc4_prepare_mixer_module(struct snd_sof_widget *swidget,
 	if (ret < 0)
 		return ret;
 
+	sof_ipc4_init_output_audio_fmt(sdev, &mixer->base_config, available_fmt, ret);
+
 	/* update pipeline memory usage */
 	sof_ipc4_update_pipeline_mem_usage(sdev, swidget, &mixer->base_config);
 
@@ -1743,6 +1752,8 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	if (ret < 0)
 		return ret;
 
+	sof_ipc4_init_output_audio_fmt(sdev, &src->base_config, available_fmt, ret);
+
 	/* update pipeline memory usage */
 	sof_ipc4_update_pipeline_mem_usage(sdev, swidget, &src->base_config);
 
@@ -1842,6 +1853,7 @@ static int sof_ipc4_prepare_process_module(struct snd_sof_widget *swidget,
 	struct sof_ipc4_process *process = swidget->private;
 	struct sof_ipc4_available_audio_format *available_fmt = &process->available_fmt;
 	void *cfg = process->ipc_config_data;
+	int output_fmt_index;
 	int ret;
 
 	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &process->base_config,
@@ -1851,10 +1863,15 @@ static int sof_ipc4_prepare_process_module(struct snd_sof_widget *swidget,
 	if (ret < 0)
 		return ret;
 
+	output_fmt_index = sof_ipc4_init_output_audio_fmt(sdev, &process->base_config,
+							  available_fmt, ret);
+
 	/* copy Pin 0 output format */
-	if (available_fmt->num_output_formats && ret < available_fmt->num_output_formats &&
-	    !available_fmt->output_pin_fmts[ret].pin_index) {
-		memcpy(&process->output_format, &available_fmt->output_pin_fmts[ret].audio_fmt,
+	if (available_fmt->num_output_formats &&
+	    output_fmt_index < available_fmt->num_output_formats &&
+	    !available_fmt->output_pin_fmts[output_fmt_index].pin_index) {
+		memcpy(&process->output_format,
+		       &available_fmt->output_pin_fmts[output_fmt_index].audio_fmt,
 		       sizeof(struct sof_ipc4_audio_format));
 
 		/* modify the pipeline params with the pin 0 output format */
-- 
2.40.1

