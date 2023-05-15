Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 289D1702AA5
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 12:35:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D02B850;
	Mon, 15 May 2023 12:34:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D02B850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684146937;
	bh=VYcaws3ritP5WIG420SCofF5VGZO7Xm+08eWH8eQoHc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JNBgp45x5LrbaLvxceG4jvtaNyb5cA5TjUfWzVZg8Jd+4IFJiVki/d2Nt/wcGISCO
	 a1xOb3vRinJ5/keEXoGC0BUIEWpycaE5eK7V6782VqtoLqWHUzIbUBYiVzWM19fuJH
	 FBJPXbc+cImup5H5ecvVdG9qQE8tRxs6ARBV2SXw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71C8DF805B3; Mon, 15 May 2023 12:33:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D061F805B3;
	Mon, 15 May 2023 12:33:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B5C2F8057C; Mon, 15 May 2023 12:33:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C284BF8024E
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 12:32:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C284BF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=oHmS5GSF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684146775; x=1715682775;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VYcaws3ritP5WIG420SCofF5VGZO7Xm+08eWH8eQoHc=;
  b=oHmS5GSFOl0ZYExofYDG8/v1zfdxIe2zHcg9jnmv4DVtYpHCbdJfZyVJ
   qMRm5KiQhKABP0MZgQIftPVLQEOgAetJ27BqaJKkxMgPcCEUYsZUXnu7C
   u7JE2nWAaF2j+C16kroXnqaoCBr1jMyi5ogz0pUQhlok2RrIPnPR+WRJn
   gIJVsMe/OXbHkS0LecYFntT9U4ofFdVA7RZ1A3nAvE1dkwuQ3gnWgtmqd
   0LShkVcVu5yj/Y+g6UsBtJKJZHXOveNvpXTBEkQ3EJxdi8AzsSInn4BWL
   2+LhMrTajCw2B3FOUMLX1Zyts63AQILAgsNkzkud1B4gKogg10Q+MVPvR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="351200370"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200";
   d="scan'208";a="351200370"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 03:32:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694967668"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200";
   d="scan'208";a="694967668"
Received: from lpilolli-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.48.230])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 03:32:50 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 4/9] ASoC: SOF: ipc4-topology: Rename
 sof_ipc4_init_audio_fmt()
Date: Mon, 15 May 2023 13:33:31 +0300
Message-Id: <20230515103336.16132-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515103336.16132-1-peter.ujfalusi@linux.intel.com>
References: <20230515103336.16132-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YKLTAY6ZZCDYRGGGTESFM4N5NFK3WR4N
X-Message-ID-Hash: YKLTAY6ZZCDYRGGGTESFM4N5NFK3WR4N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YKLTAY6ZZCDYRGGGTESFM4N5NFK3WR4N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Rename it to sof_ipc4_init_input_audio_fmt() as it only does input
format selection now.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 51 ++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 87ab415b27da..a079dd8eb7e1 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1048,12 +1048,12 @@ static int sof_ipc4_init_output_audio_fmt(struct snd_sof_dev *sdev,
 	return i;
 }
 
-static int sof_ipc4_init_audio_fmt(struct snd_sof_dev *sdev,
-				   struct snd_sof_widget *swidget,
-				   struct sof_ipc4_base_module_cfg *base_config,
-				   struct snd_pcm_hw_params *params,
-				   struct sof_ipc4_available_audio_format *available_fmt,
-				   struct sof_ipc4_pin_format *pin_fmts, u32 pin_fmts_size)
+static int sof_ipc4_init_input_audio_fmt(struct snd_sof_dev *sdev,
+					 struct snd_sof_widget *swidget,
+					 struct sof_ipc4_base_module_cfg *base_config,
+					 struct snd_pcm_hw_params *params,
+					 struct sof_ipc4_available_audio_format *available_fmt,
+					 struct sof_ipc4_pin_format *pin_fmts, u32 pin_fmts_size)
 {
 	u32 valid_bits;
 	u32 channels;
@@ -1514,8 +1514,9 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	}
 
 	/* set input and output audio formats */
-	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &copier_data->base_config, ref_params,
-				      available_fmt, format_list_to_search, format_list_count);
+	ret = sof_ipc4_init_input_audio_fmt(sdev, swidget, &copier_data->base_config, ref_params,
+					    available_fmt, format_list_to_search,
+					    format_list_count);
 	if (ret < 0)
 		return ret;
 
@@ -1541,7 +1542,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	{
 		/*
 		 * Only SOF_DAI_INTEL_ALH needs copier_data to set blob.
-		 * That's why only ALH dai's blob is set after sof_ipc4_init_audio_fmt
+		 * That's why only ALH dai's blob is set after sof_ipc4_init_input_audio_fmt
 		 */
 		if (ipc4_copier->dai_type == SOF_DAI_INTEL_ALH) {
 			struct sof_ipc4_alh_configuration_blob *blob;
@@ -1692,10 +1693,10 @@ static int sof_ipc4_prepare_gain_module(struct snd_sof_widget *swidget,
 	struct sof_ipc4_available_audio_format *available_fmt = &gain->available_fmt;
 	int ret;
 
-	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &gain->base_config,
-				      pipeline_params, available_fmt,
-				      available_fmt->input_pin_fmts,
-				      available_fmt->num_input_formats);
+	ret = sof_ipc4_init_input_audio_fmt(sdev, swidget, &gain->base_config,
+					    pipeline_params, available_fmt,
+					    available_fmt->input_pin_fmts,
+					    available_fmt->num_input_formats);
 	if (ret < 0)
 		return ret;
 
@@ -1718,10 +1719,10 @@ static int sof_ipc4_prepare_mixer_module(struct snd_sof_widget *swidget,
 	struct sof_ipc4_available_audio_format *available_fmt = &mixer->available_fmt;
 	int ret;
 
-	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &mixer->base_config,
-				      pipeline_params, available_fmt,
-				      available_fmt->input_pin_fmts,
-				      available_fmt->num_input_formats);
+	ret = sof_ipc4_init_input_audio_fmt(sdev, swidget, &mixer->base_config,
+					    pipeline_params, available_fmt,
+					    available_fmt->input_pin_fmts,
+					    available_fmt->num_input_formats);
 	if (ret < 0)
 		return ret;
 
@@ -1745,10 +1746,10 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	struct snd_interval *rate;
 	int ret;
 
-	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &src->base_config,
-				      pipeline_params, available_fmt,
-				      available_fmt->input_pin_fmts,
-				      available_fmt->num_input_formats);
+	ret = sof_ipc4_init_input_audio_fmt(sdev, swidget, &src->base_config,
+					    pipeline_params, available_fmt,
+					    available_fmt->input_pin_fmts,
+					    available_fmt->num_input_formats);
 	if (ret < 0)
 		return ret;
 
@@ -1856,10 +1857,10 @@ static int sof_ipc4_prepare_process_module(struct snd_sof_widget *swidget,
 	int output_fmt_index;
 	int ret;
 
-	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &process->base_config,
-				      pipeline_params, available_fmt,
-				      available_fmt->input_pin_fmts,
-				      available_fmt->num_input_formats);
+	ret = sof_ipc4_init_input_audio_fmt(sdev, swidget, &process->base_config,
+					    pipeline_params, available_fmt,
+					    available_fmt->input_pin_fmts,
+					    available_fmt->num_input_formats);
 	if (ret < 0)
 		return ret;
 
-- 
2.40.1

