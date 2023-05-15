Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 138DC702AA6
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 12:35:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EDAE208;
	Mon, 15 May 2023 12:35:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EDAE208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684146954;
	bh=oL6qalyGFoa9GuJZlqijKIJLe/oytodmibNdW7yCUdo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=brO1dJw00QlIaRdoKjXDBlY7V2KPhRMjhWTVlpqw+z4YMokyczREaTrMHpk8SO2bf
	 DP6nfkrzt/CxDyhFEPfhhGWub2n+he3QtWWxawVP/6hr9yMA+irO+HRQ3u4QIO83wh
	 PuBbR1LRdudLocb6HsUx5niWPqbtfbJVgYrSTRKQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A51E5F805CB; Mon, 15 May 2023 12:33:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CA59F805C2;
	Mon, 15 May 2023 12:33:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03332F8057D; Mon, 15 May 2023 12:33:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B900DF80272
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 12:32:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B900DF80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AF4WCa8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684146777; x=1715682777;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oL6qalyGFoa9GuJZlqijKIJLe/oytodmibNdW7yCUdo=;
  b=AF4WCa8B+p68i7e2JOurorjwY1+/bNv0+NEjDQe6PjsAWjgyrNcjg8Bv
   xts7geWjt1Z1ae76qk8mxkjByG3mnNHSkWc+03hyTPFFCOxCD2KdkwzO+
   Jiu+NM5GTYOB06LllMBLVskUoj8+BxDcZd8kjYGRG5NjVtYsWAobO5l5T
   tpJM8Evt/Y9dPk2H9HNy1n0vat3+gdP5xpUvLYW7UfVejcvsm/GqRvxEQ
   G0PZ4p86//Tfp81JV5+C3S08nB+Jn7usTO+s7l7F5fX3L4mYFW0T+KjJE
   NJaUqWGqtiBXVRVqFtITyR0LRNbbg9FaGJYde79xeCpz4zY7W6E29hPQK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="351200386"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200";
   d="scan'208";a="351200386"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 03:32:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694967674"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200";
   d="scan'208";a="694967674"
Received: from lpilolli-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.48.230])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 03:32:52 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 5/9] ASoC: SOF: ipc4-topology: Handle output format special
 case
Date: Mon, 15 May 2023 13:33:32 +0300
Message-Id: <20230515103336.16132-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515103336.16132-1-peter.ujfalusi@linux.intel.com>
References: <20230515103336.16132-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NNDUFS64JKUNT7CZVRBHKB45DXAFYCR7
X-Message-ID-Hash: NNDUFS64JKUNT7CZVRBHKB45DXAFYCR7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NNDUFS64JKUNT7CZVRBHKB45DXAFYCR7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

The current topologies have input/output formats in pairs and even
though there are multiple output formats, they are all the same. Handle
this case as if there were only one format in topology. Also, add a check
for the number of output formats and reports errors where applicable.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 55 +++++++++++++++++++++++++++++++----
 1 file changed, 50 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index a079dd8eb7e1..f3a6e739e800 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1033,10 +1033,37 @@ static int sof_ipc4_init_output_audio_fmt(struct snd_sof_dev *sdev,
 					  struct sof_ipc4_available_audio_format *available_fmt,
 					  int input_audio_format_index)
 {
+	struct sof_ipc4_audio_format *out_fmt;
+	u32 out_rate, out_channels, out_valid_bits;
+	bool single_format = true;
 	int i;
 
-	/* pick the only available output format */
-	if (available_fmt->num_output_formats == 1)
+	if (!available_fmt->num_output_formats)
+		return -EINVAL;
+
+	out_fmt = &available_fmt->output_pin_fmts[0].audio_fmt;
+	out_rate = out_fmt->sampling_frequency;
+	out_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(out_fmt->fmt_cfg);
+	out_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(out_fmt->fmt_cfg);
+
+	/* check if all output formats in topology are the same */
+	for (i = 1; i < available_fmt->num_output_formats; i++) {
+		u32 _out_rate, _out_channels, _out_valid_bits;
+
+		out_fmt = &available_fmt->output_pin_fmts[i].audio_fmt;
+		_out_rate = out_fmt->sampling_frequency;
+		_out_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(out_fmt->fmt_cfg);
+		_out_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(out_fmt->fmt_cfg);
+
+		if (_out_rate != out_rate || _out_channels != out_channels ||
+		    _out_valid_bits != out_valid_bits) {
+			single_format = false;
+			break;
+		}
+	}
+
+	/* pick the first format if there's only one available or if all formats are the same */
+	if (single_format)
 		i = 0;
 	else
 		i = input_audio_format_index;
@@ -1522,6 +1549,11 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 
 	output_fmt_index = sof_ipc4_init_output_audio_fmt(sdev, &copier_data->base_config,
 							  available_fmt, ret);
+	if (output_fmt_index < 0) {
+		dev_err(sdev->dev, "No output formats in topology for copier %s",
+			swidget->widget->name);
+		return output_fmt_index;
+	}
 
 	/*
 	 * Set the output format. Current topology defines pin 0 input and output formats in pairs.
@@ -1700,7 +1732,11 @@ static int sof_ipc4_prepare_gain_module(struct snd_sof_widget *swidget,
 	if (ret < 0)
 		return ret;
 
-	sof_ipc4_init_output_audio_fmt(sdev, &gain->base_config, available_fmt, ret);
+	ret = sof_ipc4_init_output_audio_fmt(sdev, &gain->base_config, available_fmt, ret);
+	if (ret < 0) {
+		dev_err(sdev->dev, "No output formats for %s", swidget->widget->name);
+		return ret;
+	}
 
 	/* update pipeline memory usage */
 	sof_ipc4_update_pipeline_mem_usage(sdev, swidget, &gain->base_config);
@@ -1726,7 +1762,11 @@ static int sof_ipc4_prepare_mixer_module(struct snd_sof_widget *swidget,
 	if (ret < 0)
 		return ret;
 
-	sof_ipc4_init_output_audio_fmt(sdev, &mixer->base_config, available_fmt, ret);
+	ret = sof_ipc4_init_output_audio_fmt(sdev, &mixer->base_config, available_fmt, ret);
+	if (ret < 0) {
+		dev_err(sdev->dev, "No output formats for %s", swidget->widget->name);
+		return ret;
+	}
 
 	/* update pipeline memory usage */
 	sof_ipc4_update_pipeline_mem_usage(sdev, swidget, &mixer->base_config);
@@ -1753,7 +1793,11 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	if (ret < 0)
 		return ret;
 
-	sof_ipc4_init_output_audio_fmt(sdev, &src->base_config, available_fmt, ret);
+	ret = sof_ipc4_init_output_audio_fmt(sdev, &src->base_config, available_fmt, ret);
+	if (ret < 0) {
+		dev_err(sdev->dev, "No output formats for %s", swidget->widget->name);
+		return ret;
+	}
 
 	/* update pipeline memory usage */
 	sof_ipc4_update_pipeline_mem_usage(sdev, swidget, &src->base_config);
@@ -1864,6 +1908,7 @@ static int sof_ipc4_prepare_process_module(struct snd_sof_widget *swidget,
 	if (ret < 0)
 		return ret;
 
+	/* No need to check the return value. Some processing modules do not have output pins */
 	output_fmt_index = sof_ipc4_init_output_audio_fmt(sdev, &process->base_config,
 							  available_fmt, ret);
 
-- 
2.40.1

