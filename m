Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DE16BD322
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 16:14:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AC3F1106;
	Thu, 16 Mar 2023 16:13:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AC3F1106
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678979682;
	bh=jJcTRwah2QVJudrkmUEPQqgDO0SqFVma1wfTMtsVAxI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XJFQGXpNSu38f/TbmdVfUBExFjTV7wxGky6/ZVWBNrl3fcr3nJ5ZzAz/elfgxUocN
	 NFv+FpjTAMClyzArAO4dLvF9FQ5fMnusGSvgrqQZRFqY/T8LwA2tiqpHWJA0YEm1f2
	 WgdhhCazUhb0CxagZvh8gmVlW2DwjqSVZD/QkowQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A647F80564;
	Thu, 16 Mar 2023 16:12:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D76F1F80534; Thu, 16 Mar 2023 16:12:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96C24F80482
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 16:11:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96C24F80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ww1vFw6n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678979500; x=1710515500;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jJcTRwah2QVJudrkmUEPQqgDO0SqFVma1wfTMtsVAxI=;
  b=Ww1vFw6nGEX4WnAHoFRQ4FFz7Ab5qGVyRA46GzZhSvsjHK+kPaP3XhaS
   bv0w8Zvmgi+uf51vHJ7hJVwsZimhxc4nbFgyJ3+h9KSBDBXtrzopiJ/xw
   FJFsffTXlphyUUtodwcrvwY6OSd96DvWu/Wmf3w1KhC/cyvN5cqndT83I
   Xba7Xp+e8ApQsnmcysYUdLhLF0rIqbSkgmz6aJ5fRfz6PyTSkZ9aHs9iL
   65Kt14aXNmVIwezE0cnHmgQ1ZAQSxEDjaC1jhf64zFNeR4/a1f0bBYinb
   XA0pgCXIRcjq3xQn+9kThccWKTvY4hUNfJHSZqEy/+0kW0uX3cApXLoPP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="335501664"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400";
   d="scan'208";a="335501664"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 08:11:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="823286538"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400";
   d="scan'208";a="823286538"
Received: from raberjix-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.62.186])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 08:11:29 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 6/6] ASoC: SOF: ipc4-topology: update pipeline_params in
 process prepare
Date: Thu, 16 Mar 2023 17:11:37 +0200
Message-Id: <20230316151137.7598-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316151137.7598-1-peter.ujfalusi@linux.intel.com>
References: <20230316151137.7598-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VS7AJCGRT2E2JHYMBCCVKGAGV7N4P23I
X-Message-ID-Hash: VS7AJCGRT2E2JHYMBCCVKGAGV7N4P23I
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 libin.yang@intel.com, yung-chuan.liao@linux.intel.com,
 chao.song@linux.intel.com, jaska.uimonen@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VS7AJCGRT2E2JHYMBCCVKGAGV7N4P23I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Libin Yang <libin.yang@intel.com>

Some modules may modify the audio format during processing. So, update the
pipeline params based on pin 0's output format during process prepare.

Signed-off-by: Libin Yang <libin.yang@intel.com>
Co-developed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 50 ++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 962ec38b70cc..963ec730381b 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -964,6 +964,48 @@ static int sof_ipc4_widget_assign_instance_id(struct snd_sof_dev *sdev,
 	return 0;
 }
 
+/* update hw_params based on the audio stream format */
+static int sof_ipc4_update_hw_params(struct snd_sof_dev *sdev, struct snd_pcm_hw_params *params,
+				     struct sof_ipc4_audio_format *fmt)
+{
+	snd_pcm_format_t snd_fmt;
+	struct snd_interval *i;
+	struct snd_mask *m;
+	int valid_bits = SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(fmt->fmt_cfg);
+	unsigned int channels, rate;
+
+	switch (valid_bits) {
+	case 16:
+		snd_fmt = SNDRV_PCM_FORMAT_S16_LE;
+		break;
+	case 24:
+		snd_fmt = SNDRV_PCM_FORMAT_S24_LE;
+		break;
+	case 32:
+		snd_fmt = SNDRV_PCM_FORMAT_S32_LE;
+		break;
+	default:
+		dev_err(sdev->dev, "invalid PCM valid_bits %d\n", valid_bits);
+		return -EINVAL;
+	}
+
+	m = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+	snd_mask_none(m);
+	snd_mask_set_format(m, snd_fmt);
+
+	rate = fmt->sampling_frequency;
+	i = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
+	i->min = rate;
+	i->max = rate;
+
+	channels = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(fmt->fmt_cfg);
+	i = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
+	i->min = channels;
+	i->max = channels;
+
+	return 0;
+}
+
 static int sof_ipc4_init_audio_fmt(struct snd_sof_dev *sdev,
 				   struct snd_sof_widget *swidget,
 				   struct sof_ipc4_base_module_cfg *base_config,
@@ -1673,10 +1715,16 @@ static int sof_ipc4_prepare_process_module(struct snd_sof_widget *swidget,
 
 	/* copy Pin 0 output format */
 	if (available_fmt->num_output_formats && ret < available_fmt->num_output_formats &&
-	    !available_fmt->output_pin_fmts[ret].pin_index)
+	    !available_fmt->output_pin_fmts[ret].pin_index) {
 		memcpy(&process->output_format, &available_fmt->output_pin_fmts[ret].audio_fmt,
 		       sizeof(struct sof_ipc4_audio_format));
 
+		/* modify the pipeline params with the pin 0 output format */
+		ret = sof_ipc4_update_hw_params(sdev, pipeline_params, &process->output_format);
+		if (ret)
+			return ret;
+	}
+
 	/* update pipeline memory usage */
 	sof_ipc4_update_pipeline_mem_usage(sdev, swidget, &process->base_config);
 
-- 
2.39.2

