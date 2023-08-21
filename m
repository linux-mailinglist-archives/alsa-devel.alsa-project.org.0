Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05134782817
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 13:39:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43EA2832;
	Mon, 21 Aug 2023 13:38:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43EA2832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692617942;
	bh=Qv3hSKuCEiI2/va5kTORBfhU39uC24XuNfy9D1NiTnc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GylPxTyjzgTSaOP0zn/In55Z04McTvpG7T6+IYjQdDOJkwk6/Pt6fR1zfmcmC2Uje
	 V41LKUDGaAoGS/4XpOOQckDiODI9npB2G0ncVTGYblU1U9lS1hMqweKf74vFx2FUBJ
	 eYyn//9Z1FqF6jgK1x+UWpPViVF3XaaVehfLmw88=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B76D0F805A0; Mon, 21 Aug 2023 13:37:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FD08F8057E;
	Mon, 21 Aug 2023 13:37:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D97CF8056F; Mon, 21 Aug 2023 13:37:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C01C4F8025E
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 13:37:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C01C4F8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NOs2naIO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692617834; x=1724153834;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qv3hSKuCEiI2/va5kTORBfhU39uC24XuNfy9D1NiTnc=;
  b=NOs2naIOICgrPGKzTHs0eMPQAQvTbBovmdMXuCl2FPLrItO9zxysxMqA
   4aH07+PSJWEzS3h64h24TrK/4uRT0L1dt9IrVpN+6pxalDiYQxSiYKoMh
   P63ca5TICI3irEyPOu3rlVzB61mzzYvSp+WuWGZcK3Dp57vldNrdXj/EF
   8n8UPIY+JdRADMHMPN9LGoVp7gPGdCMSSLrmMADfiYgEDP/N2ZXTTeXjq
   VQF90H44Tej1tu8/SlntzDrdqrsoBgosr6oPGwVC0d/XJJsVbb8242cH1
   eTnUjRm7Qy/NV03pjjsxouQtBWweZWyPZD0jpZL5jJ4RU9/cYDd8Mpi5i
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="459933142"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200";
   d="scan'208";a="459933142"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 04:36:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="770911433"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200";
   d="scan'208";a="770911433"
Received: from yabolano-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.44.22])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 04:36:43 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH 4/4] ASoC: SOF: ipc4-topology: Modify the reference output
 valid_bits for copier
Date: Mon, 21 Aug 2023 14:36:29 +0300
Message-ID: <20230821113629.5017-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821113629.5017-1-peter.ujfalusi@linux.intel.com>
References: <20230821113629.5017-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IQTTG5LHJPPL3B2KPMWZWVB2SLJJFP2A
X-Message-ID-Hash: IQTTG5LHJPPL3B2KPMWZWVB2SLJJFP2A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IQTTG5LHJPPL3B2KPMWZWVB2SLJJFP2A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

If the copier has only output valid_bits across all its output
formats, the reference for selecting the output format must be set that
instead of the valid_bits from the selected input format.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 58 ++++++++++++++++++++++++++++++++---
 1 file changed, 53 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 310aadd97d28..eff43635a88f 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1349,6 +1349,31 @@ static int snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_s
 }
 #endif
 
+static bool sof_ipc4_copier_is_single_format(struct snd_sof_dev *sdev,
+					     struct sof_ipc4_pin_format *pin_fmts,
+					     u32 pin_fmts_size)
+{
+	struct sof_ipc4_audio_format *fmt;
+	u32 valid_bits;
+	int i;
+
+	fmt = &pin_fmts[0].audio_fmt;
+	valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(fmt->fmt_cfg);
+
+	/* check if all output formats in topology are the same */
+	for (i = 1; i < pin_fmts_size; i++) {
+		u32 _valid_bits;
+
+		fmt = &pin_fmts[i].audio_fmt;
+		_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(fmt->fmt_cfg);
+
+		if (_valid_bits != valid_bits)
+			return false;
+	}
+
+	return true;
+}
+
 static int
 sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 			       struct snd_pcm_hw_params *fe_params,
@@ -1371,6 +1396,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	u32 out_ref_rate, out_ref_channels;
 	u32 deep_buffer_dma_ms = 0;
 	int output_fmt_index;
+	bool single_output_format;
 
 	dev_dbg(sdev->dev, "copier %s, type %d", swidget->widget->name, swidget->id);
 
@@ -1504,6 +1530,9 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		return ret;
 
 	/* set the reference params for output format selection */
+	single_output_format = sof_ipc4_copier_is_single_format(sdev,
+								available_fmt->output_pin_fmts,
+								available_fmt->num_output_formats);
 	switch (swidget->id) {
 	case snd_soc_dapm_aif_in:
 	case snd_soc_dapm_dai_out:
@@ -1514,17 +1543,21 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		in_fmt = &available_fmt->input_pin_fmts[ret].audio_fmt;
 		out_ref_rate = in_fmt->sampling_frequency;
 		out_ref_channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(in_fmt->fmt_cfg);
-		out_ref_valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_fmt->fmt_cfg);
+
+		if (!single_output_format)
+			out_ref_valid_bits =
+				SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(in_fmt->fmt_cfg);
 		break;
 	}
 	case snd_soc_dapm_aif_out:
 	case snd_soc_dapm_dai_in:
-		out_ref_valid_bits = sof_ipc4_get_valid_bits(sdev, fe_params);
-		if (out_ref_valid_bits < 0)
-			return out_ref_valid_bits;
-
 		out_ref_rate = params_rate(fe_params);
 		out_ref_channels = params_channels(fe_params);
+		if (!single_output_format) {
+			out_ref_valid_bits = sof_ipc4_get_valid_bits(sdev, fe_params);
+			if (out_ref_valid_bits < 0)
+				return out_ref_valid_bits;
+		}
 		break;
 	default:
 		/*
@@ -1534,6 +1567,21 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		return -EINVAL;
 	}
 
+	/*
+	 * if the output format is the same across all available output formats, choose
+	 * that as the reference.
+	 */
+	if (single_output_format) {
+		struct sof_ipc4_audio_format *out_fmt;
+
+		out_fmt = &available_fmt->output_pin_fmts[0].audio_fmt;
+		out_ref_valid_bits =
+			SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(out_fmt->fmt_cfg);
+	}
+
+	dev_dbg(sdev->dev, "copier %s: reference output rate %d, channels %d valid_bits %d\n",
+		swidget->widget->name, out_ref_rate, out_ref_channels, out_ref_valid_bits);
+
 	output_fmt_index = sof_ipc4_init_output_audio_fmt(sdev, &copier_data->base_config,
 							  available_fmt, out_ref_rate,
 							  out_ref_channels, out_ref_valid_bits);
-- 
2.41.0

