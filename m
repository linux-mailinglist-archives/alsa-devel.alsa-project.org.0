Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 964AA782812
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 13:38:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF8F783E;
	Mon, 21 Aug 2023 13:37:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF8F783E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692617885;
	bh=KEaEIUZt7x+mgZACLaUbvvhztDS+BqyvAtsXcTUmSss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ok0gpSTmGJzxSvupxb0Tl/Qe/Eqd43eP5fxMcxvmHUFTTeSpZ8y91ZYBuyXSXQYUp
	 /ZLwu7UJjkdX/z3+c6jM3gch81l8iMyJzOLIQryIRubqtzy2uNnTPIee8iOdSqsVT4
	 +cxG1ZnW2IVbu7X5ZZ71OzyQumkugMTYHn6To29A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4EC6F8055B; Mon, 21 Aug 2023 13:36:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CCEEF80536;
	Mon, 21 Aug 2023 13:36:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4695F80199; Mon, 21 Aug 2023 13:36:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C3B7F800F8
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 13:36:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C3B7F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MHk/bU/Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692617801; x=1724153801;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KEaEIUZt7x+mgZACLaUbvvhztDS+BqyvAtsXcTUmSss=;
  b=MHk/bU/QJu/odnBGmYmDSqLaV9CwZ1V8x1zZZYwwo/W5P+svkU2dLTfM
   ESXqrVKGlHhvVffihdXsX2lauJrHfbxc/tP64kphH4jJeTfiekM1734US
   wThTm2lixrgD5PVNaDshrTCphRMEJvh07+xkisOPPOmc9n7KAKzVQbDnn
   sOj+Amg2lH0lkujvijhAUCR4EJLEXrwtT8vn2HiBgyLnxznQvits+Q7YE
   NshikfSR4tZN+QoYdSXd0cUWF2JRuabZdH92t6ux6nP0yj/L5yIHX/Ikq
   miPE0PKXt9QfStwJKID5U3tzqMr9ehK/M0XCA8WyKK/ZpiRBuO0UgsS5T
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="459933091"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200";
   d="scan'208";a="459933091"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 04:36:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="770911386"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200";
   d="scan'208";a="770911386"
Received: from yabolano-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.44.22])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 04:36:34 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH 1/4] ASoC: SOF: ipc4-topology: Modify pipeline params based on
 SRC output format
Date: Mon, 21 Aug 2023 14:36:26 +0300
Message-ID: <20230821113629.5017-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821113629.5017-1-peter.ujfalusi@linux.intel.com>
References: <20230821113629.5017-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CJKRYZO52O6JUL367F3TTKGK3WAMKPEC
X-Message-ID-Hash: CJKRYZO52O6JUL367F3TTKGK3WAMKPEC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CJKRYZO52O6JUL367F3TTKGK3WAMKPEC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Modify the pipeline_params based on the SRC output format and set the
sink_rate in the IPC data.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 633f6040d712..8bc12f12888d 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1838,10 +1838,10 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct sof_ipc4_src *src = swidget->private;
 	struct sof_ipc4_available_audio_format *available_fmt = &src->available_fmt;
+	struct sof_ipc4_audio_format *out_audio_fmt;
 	struct sof_ipc4_audio_format *in_fmt;
 	u32 out_ref_rate, out_ref_channels, out_ref_valid_bits;
-	struct snd_interval *rate;
-	int ret;
+	int ret, output_format_index;
 
 	ret = sof_ipc4_init_input_audio_fmt(sdev, swidget, &src->base_config,
 					    pipeline_params, available_fmt);
@@ -1853,22 +1853,23 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	out_ref_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_fmt->fmt_cfg);
 	out_ref_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_fmt->fmt_cfg);
 
-	ret = sof_ipc4_init_output_audio_fmt(sdev, &src->base_config, available_fmt,
-					     out_ref_rate, out_ref_channels, out_ref_valid_bits);
-	if (ret < 0) {
+	output_format_index = sof_ipc4_init_output_audio_fmt(sdev, &src->base_config,
+							     available_fmt, out_ref_rate,
+							     out_ref_channels, out_ref_valid_bits);
+	if (output_format_index < 0) {
 		dev_err(sdev->dev, "Failed to initialize output format for %s",
 			swidget->widget->name);
+		return output_format_index;
 	}
 
 	/* update pipeline memory usage */
 	sof_ipc4_update_resource_usage(sdev, swidget, &src->base_config);
 
-	/* update pipeline_params for sink widgets */
-	rate = hw_param_interval(pipeline_params, SNDRV_PCM_HW_PARAM_RATE);
-	rate->min = src->sink_rate;
-	rate->max = rate->min;
+	out_audio_fmt = &available_fmt->output_pin_fmts[output_format_index].audio_fmt;
+	src->sink_rate = out_audio_fmt->sampling_frequency;
 
-	return 0;
+	/* update pipeline_params for sink widgets */
+	return sof_ipc4_update_hw_params(sdev, pipeline_params, out_audio_fmt);
 }
 
 static int
-- 
2.41.0

