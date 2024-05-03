Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 194118BADC5
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2024 15:34:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA464DF6;
	Fri,  3 May 2024 15:34:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA464DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714743292;
	bh=+Q6B5US8cjIZuGqrA77g1CRrT/PNP5/O70Mnu78eYec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P1F2TJRBA7AYnCBFMiDHur+Sw+5c3HHixHRN6DFFgtegjSWCOPYUKjdDjI31H6V8R
	 wjWcIK4frIUB0wG32fpqg2VrBpZ1V3ZSrSnoef07nKhKu5JxOLCpYnfRjokWAT17Da
	 +LPwEzfkKftZkVddfSgaSO+ns48N9/fMfe63LuHk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F387F8061B; Fri,  3 May 2024 15:33:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD738F805F9;
	Fri,  3 May 2024 15:33:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A735EF805CA; Fri,  3 May 2024 15:33:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06A99F80269
	for <alsa-devel@alsa-project.org>; Fri,  3 May 2024 15:33:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06A99F80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bgbBHtiT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714743203; x=1746279203;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+Q6B5US8cjIZuGqrA77g1CRrT/PNP5/O70Mnu78eYec=;
  b=bgbBHtiTBB4zz58iV5PfSTqNtcS4mOKMT9DONH31Li4vkGzchOZWJerr
   jqBhJcOcSA7v2Gkn60ajfj5FaQapsXU5MnAZO4FhLdckUj4wASENFXoTp
   SVQVxaU9DsJQCCcl734Bc4k1F48xeVF+0jxmZMQbm63SwHZ/y3wB9jGyT
   e+hDCaA08vKuH5tWa9e/3TXriPkOGw8Kg76tHaIkvECwBVGsXANYK2mQN
   74cL5RUzwPHGh8016IubeI2NcrRjfgyZiXhfpTERVparRwRsQ3B7y8/RZ
   ISMeB3A5cxCMZU2MMULrSmBwQGg7GJ+g9FPpylKU+xiOPgat9aPDMtzc8
   g==;
X-CSE-ConnectionGUID: /0aIxlNcSw6I1yvlohkUdg==
X-CSE-MsgGUID: pYtXQaGWROKaFQxUmtSpKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="13499113"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="13499113"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 06:33:07 -0700
X-CSE-ConnectionGUID: T9jhZxjBSS+sY48eN7RXww==
X-CSE-MsgGUID: H4ZvY/RSQb25h8WxaLWspA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="27501254"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.113.3])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 06:33:03 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 2/3] ASoC: SOF: ipc4-topology: Allow selective update in
 sof_ipc4_update_hw_params
Date: Fri,  3 May 2024 08:32:52 -0500
Message-Id: <20240503133253.108201-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240503133253.108201-1-pierre-louis.bossart@linux.intel.com>
References: <20240503133253.108201-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GAETLECPJZKLBA7BYTG3EOZWDRY3LBSB
X-Message-ID-Hash: GAETLECPJZKLBA7BYTG3EOZWDRY3LBSB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GAETLECPJZKLBA7BYTG3EOZWDRY3LBSB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Add a bitmask parameter to sof_ipc4_update_hw_params() to be able to select
the param to be updated.
This feature can be used when not all params should be updated, for example
if caller only wants to update the format in the params, leaving the
channels and rates untouched.

Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 83 +++++++++++++++++++++--------------
 1 file changed, 51 insertions(+), 32 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index a972b2b5122a..f56b7fbbe10f 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1119,42 +1119,50 @@ static int sof_ipc4_widget_assign_instance_id(struct snd_sof_dev *sdev,
 
 /* update hw_params based on the audio stream format */
 static int sof_ipc4_update_hw_params(struct snd_sof_dev *sdev, struct snd_pcm_hw_params *params,
-				     struct sof_ipc4_audio_format *fmt)
+				     struct sof_ipc4_audio_format *fmt, u32 param_to_update)
 {
-	snd_pcm_format_t snd_fmt;
 	struct snd_interval *i;
-	struct snd_mask *m;
-	int valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(fmt->fmt_cfg);
-	unsigned int channels, rate;
 
-	switch (valid_bits) {
-	case 16:
-		snd_fmt = SNDRV_PCM_FORMAT_S16_LE;
-		break;
-	case 24:
-		snd_fmt = SNDRV_PCM_FORMAT_S24_LE;
-		break;
-	case 32:
-		snd_fmt = SNDRV_PCM_FORMAT_S32_LE;
-		break;
-	default:
-		dev_err(sdev->dev, "invalid PCM valid_bits %d\n", valid_bits);
-		return -EINVAL;
+	if (param_to_update & BIT(SNDRV_PCM_HW_PARAM_FORMAT)) {
+		int valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(fmt->fmt_cfg);
+		snd_pcm_format_t snd_fmt;
+		struct snd_mask *m;
+
+		switch (valid_bits) {
+		case 16:
+			snd_fmt = SNDRV_PCM_FORMAT_S16_LE;
+			break;
+		case 24:
+			snd_fmt = SNDRV_PCM_FORMAT_S24_LE;
+			break;
+		case 32:
+			snd_fmt = SNDRV_PCM_FORMAT_S32_LE;
+			break;
+		default:
+			dev_err(sdev->dev, "invalid PCM valid_bits %d\n", valid_bits);
+			return -EINVAL;
+		}
+
+		m = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+		snd_mask_none(m);
+		snd_mask_set_format(m, snd_fmt);
 	}
 
-	m = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
-	snd_mask_none(m);
-	snd_mask_set_format(m, snd_fmt);
+	if (param_to_update & BIT(SNDRV_PCM_HW_PARAM_RATE)) {
+		unsigned int rate = fmt->sampling_frequency;
 
-	rate = fmt->sampling_frequency;
-	i = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
-	i->min = rate;
-	i->max = rate;
+		i = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
+		i->min = rate;
+		i->max = rate;
+	}
 
-	channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(fmt->fmt_cfg);
-	i = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
-	i->min = channels;
-	i->max = channels;
+	if (param_to_update & BIT(SNDRV_PCM_HW_PARAM_CHANNELS)) {
+		unsigned int channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(fmt->fmt_cfg);
+
+		i = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
+		i->min = channels;
+		i->max = channels;
+	}
 
 	return 0;
 }
@@ -1844,7 +1852,11 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	}
 
 	/* modify the input params for the next widget */
-	ret = sof_ipc4_update_hw_params(sdev, pipeline_params, &copier_data->out_format);
+	ret = sof_ipc4_update_hw_params(sdev, pipeline_params,
+					&copier_data->out_format,
+					BIT(SNDRV_PCM_HW_PARAM_FORMAT) |
+					BIT(SNDRV_PCM_HW_PARAM_CHANNELS) |
+					BIT(SNDRV_PCM_HW_PARAM_RATE));
 	if (ret)
 		return ret;
 
@@ -2069,7 +2081,10 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	src->data.sink_rate = out_audio_fmt->sampling_frequency;
 
 	/* update pipeline_params for sink widgets */
-	return sof_ipc4_update_hw_params(sdev, pipeline_params, out_audio_fmt);
+	return sof_ipc4_update_hw_params(sdev, pipeline_params, out_audio_fmt,
+					 BIT(SNDRV_PCM_HW_PARAM_FORMAT) |
+					 BIT(SNDRV_PCM_HW_PARAM_CHANNELS) |
+					 BIT(SNDRV_PCM_HW_PARAM_RATE));
 }
 
 static int
@@ -2193,7 +2208,11 @@ static int sof_ipc4_prepare_process_module(struct snd_sof_widget *swidget,
 		       sizeof(struct sof_ipc4_audio_format));
 
 		/* modify the pipeline params with the pin 0 output format */
-		ret = sof_ipc4_update_hw_params(sdev, pipeline_params, &process->output_format);
+		ret = sof_ipc4_update_hw_params(sdev, pipeline_params,
+						&process->output_format,
+						BIT(SNDRV_PCM_HW_PARAM_FORMAT) |
+						BIT(SNDRV_PCM_HW_PARAM_CHANNELS) |
+						BIT(SNDRV_PCM_HW_PARAM_RATE));
 		if (ret)
 			return ret;
 	}
-- 
2.40.1

