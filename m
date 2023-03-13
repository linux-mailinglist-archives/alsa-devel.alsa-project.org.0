Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 523FD6B7810
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 13:52:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 844DD1468;
	Mon, 13 Mar 2023 13:51:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 844DD1468
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678711960;
	bh=NdNzVXyhDLsW+Rvf9RPNvOputQmmL7Xipvl0Hfx7rLw=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fcAPfVdpVNe0pDB96OgHpX50K6NZtlqqsIGXsbgIym+o/etWA3mkGx1OfezA+Iz4l
	 UCSY3ELi+4/2vfeoi42awq2V4w/HUiDFpFMhFuwXvPBELvbpO1qtKRVrkTPquL4Og/
	 ZJZqa4NsFyR0la6RK1CEQucMz5p406ZwrelFqwNQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F629F8057F;
	Mon, 13 Mar 2023 13:49:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36CC2F8057E; Mon, 13 Mar 2023 13:49:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51695F80564
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 13:49:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51695F80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZW0LCqxk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678711776; x=1710247776;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NdNzVXyhDLsW+Rvf9RPNvOputQmmL7Xipvl0Hfx7rLw=;
  b=ZW0LCqxkUPZZ1rbEKoeoF1K9/vEW17zlzrqzxvEH2BpzlYahpxaJX6AD
   MKMDazOKXI6Kue+K8C1vPTbELXI6K10DbobsmXKLeUq6yEWVFXrMorSAd
   0WHlSLXwMxoZARZR585XMnaGamiBXuoR2PcLeDAFoAV+CVLDDTH9su1sx
   uAIRS+DMeIRUPZZqjwg98MTAuFfhNAcCaUyOyXDUmT052/4jxlY6D8Da+
   ttsHQ9D9pA8/+feAY/mUt9ACn6AnOjN/SyZV5EPu4/s9owPhXWP0r9LIi
   eiUpZJeeLEHj5jrCdvJixKtEZVfVUxd9zhxH532f86UMGlrvZqQ4q+W8J
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="399728105"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="399728105"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 05:48:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="711116509"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="711116509"
Received: from tchambon-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.43.68])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 05:48:54 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 08/11] ASoC: SOF: ipc4-topology: Modify the signature of
 sof_ipc4_init_audio_fmt()
Date: Mon, 13 Mar 2023 14:48:53 +0200
Message-Id: <20230313124856.8140-9-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313124856.8140-1-peter.ujfalusi@linux.intel.com>
References: <20230313124856.8140-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: F6UL53RAGIVUMMQ5LQP4FIS2IGHN6QZK
X-Message-ID-Hash: F6UL53RAGIVUMMQ5LQP4FIS2IGHN6QZK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F6UL53RAGIVUMMQ5LQP4FIS2IGHN6QZK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Only the copier needs to set the output format in its IPC payload. So
move the code to set the output format inside
sof_ipc4_prepare_copier_module() and modify the signature of
sof_ipc4_init_audio_fmt() to remove the out_format argument.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 38 ++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index c462db95f3b2..baa8f4fa6d20 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -828,7 +828,6 @@ static int sof_ipc4_widget_assign_instance_id(struct snd_sof_dev *sdev,
 static int sof_ipc4_init_audio_fmt(struct snd_sof_dev *sdev,
 				   struct snd_sof_widget *swidget,
 				   struct sof_ipc4_base_module_cfg *base_config,
-				   struct sof_ipc4_audio_format *out_format,
 				   struct snd_pcm_hw_params *params,
 				   struct sof_ipc4_available_audio_format *available_fmt)
 {
@@ -890,7 +889,7 @@ static int sof_ipc4_init_audio_fmt(struct snd_sof_dev *sdev,
 
 	/* copy input format */
 	memcpy(&base_config->audio_fmt, &available_fmt->input_pin_fmts[i].audio_fmt,
-	       sizeof(*out_format));
+	       sizeof(struct sof_ipc4_audio_format));
 
 	/* set base_cfg ibs/obs */
 	base_config->ibs = available_fmt->input_pin_fmts[i].buffer_size;
@@ -899,20 +898,6 @@ static int sof_ipc4_init_audio_fmt(struct snd_sof_dev *sdev,
 	dev_dbg(sdev->dev, "Init input audio formats for %s\n", swidget->widget->name);
 	sof_ipc4_dbg_audio_format(sdev->dev, &available_fmt->input_pin_fmts[i], 1);
 
-	if (out_format) {
-		/*
-		 * Current topology defines pin 0 input and output formats only in pairs.
-		 * This assumes that the pin 0 formats are defined before all other pins.
-		 * So pick the output audio format with the same index as the chosen
-		 * input format. This logic will need to be updated when the format definitions
-		 * in topology change.
-		 */
-		memcpy(out_format, &available_fmt->output_pin_fmts[i].audio_fmt,
-		       sizeof(*out_format));
-		dev_dbg(sdev->dev, "Init output audio formats for %s\n", swidget->widget->name);
-		sof_ipc4_dbg_audio_format(sdev->dev, &available_fmt->output_pin_fmts[i], 1);
-	}
-
 	/* Return the index of the matched format */
 	return i;
 }
@@ -1182,12 +1167,23 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	}
 
 	/* set input and output audio formats */
-	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &copier_data->base_config,
-				      &copier_data->out_format, ref_params,
+	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &copier_data->base_config, ref_params,
 				      available_fmt);
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * Set the output format. Current topology defines pin 0 input and output formats in pairs.
+	 * This assumes that the pin 0 formats are defined before all other pins.
+	 * So pick the output audio format with the same index as the chosen
+	 * input format. This logic will need to be updated when the format definitions
+	 * in topology change.
+	 */
+	memcpy(&copier_data->out_format, &available_fmt->output_pin_fmts[ret].audio_fmt,
+	       sizeof(struct sof_ipc4_audio_format));
+	dev_dbg(sdev->dev, "Output audio format for %s\n", swidget->widget->name);
+	sof_ipc4_dbg_audio_format(sdev->dev, &available_fmt->output_pin_fmts[ret], 1);
+
 	switch (swidget->id) {
 	case snd_soc_dapm_dai_in:
 	case snd_soc_dapm_dai_out:
@@ -1361,7 +1357,7 @@ static int sof_ipc4_prepare_gain_module(struct snd_sof_widget *swidget,
 
 	/* output format is not required to be sent to the FW for gain */
 	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &gain->base_config,
-				      NULL, pipeline_params, available_fmt);
+				      pipeline_params, available_fmt);
 	if (ret < 0)
 		return ret;
 
@@ -1387,7 +1383,7 @@ static int sof_ipc4_prepare_mixer_module(struct snd_sof_widget *swidget,
 
 	/* output format is not required to be sent to the FW for mixer */
 	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &mixer->base_config,
-				      NULL, pipeline_params, available_fmt);
+				      pipeline_params, available_fmt);
 	if (ret < 0)
 		return ret;
 
@@ -1413,7 +1409,7 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 
 	/* output format is not required to be sent to the FW for SRC */
 	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &src->base_config,
-				      NULL, pipeline_params, available_fmt);
+				      pipeline_params, available_fmt);
 	if (ret < 0)
 		return ret;
 
-- 
2.39.2

