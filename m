Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E11F782816
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 13:38:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8967E82C;
	Mon, 21 Aug 2023 13:37:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8967E82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692617928;
	bh=GwspptU7v3jkhOI1TBgayiJgg5uWkVWFc3GnpMtuNQs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IOWlFLGXJLu36dz0qPuHupviPChkV9i0mFA5TRAeq/X5iUVA062YtVBKvZIN6N/cc
	 ziZEuUr6bkGnqAlmLF5EVMCGpdDLif+yQGZuOtmyMSv3wMt/13VE59C23oje9nyBIE
	 fWIXwQLSJ+RY5syTJ3YnLeB6VUbj0jkeDc+97m0c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8A12F8025E; Mon, 21 Aug 2023 13:37:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19064F8056F;
	Mon, 21 Aug 2023 13:37:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE12AF80564; Mon, 21 Aug 2023 13:37:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02C96F80557
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 13:37:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02C96F80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fPZuWPna
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692617832; x=1724153832;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GwspptU7v3jkhOI1TBgayiJgg5uWkVWFc3GnpMtuNQs=;
  b=fPZuWPnaQS5zHEh6J3wkHlZ/K6vQNUDwG/XTxxDnFp0zRcHufFvqn4DD
   8a8MlGOJrHmAZ7JrhzMDY8uAKlgu1Vw+qMmBZ3FuOQHsi5U6IvDLNCUao
   Uj4cmjfM3wy8jmhBIXprJyqskyoySUCrX/wU02CGRA3TnpRxQlgmYKWsF
   sVLXw0M/Z9oOtqWDfxLwKziyPEGoQmPcFaQ+Z82VjcoByMi02fqGfC2kJ
   syexkFoKp5aCLazVWuKUgSjQa0nySTfzRFRAPxCXJm/NnV1TjAsGjWmRO
   bghfRuMPJdWAC2BdeIkrkmz36S6lQ3DSMvmMi4KjsgjSRD9PHmjqCf70i
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="459933128"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200";
   d="scan'208";a="459933128"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 04:36:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="770911419"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200";
   d="scan'208";a="770911419"
Received: from yabolano-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.44.22])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 04:36:40 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH 3/4] ASoC: SOF: ipc4-topology: Fix pipeline params at the
 output of copier
Date: Mon, 21 Aug 2023 14:36:28 +0300
Message-ID: <20230821113629.5017-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821113629.5017-1-peter.ujfalusi@linux.intel.com>
References: <20230821113629.5017-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VHZRO4AIFVXQEPNZJ5D6L6GFC5JCW343
X-Message-ID-Hash: VHZRO4AIFVXQEPNZJ5D6L6GFC5JCW343
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VHZRO4AIFVXQEPNZJ5D6L6GFC5JCW343/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

When we walk the list of connected widgets from the source to the sink
to prepare all widgets, the pipeline_params must be modified to reflect
the output audio format at each widget. But, the copier only modifies
the sample format in the pipeline_params. So, fix it to also modify the
rate and channels.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 27 +--------------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 39649fddf16a..310aadd97d28 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1349,25 +1349,6 @@ static int snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_s
 }
 #endif
 
-static int ipc4_set_fmt_mask(struct snd_mask *fmt, unsigned int bit_depth)
-{
-	switch (bit_depth) {
-	case 16:
-		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
-		break;
-	case 24:
-		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
-		break;
-	case 32:
-		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 static int
 sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 			       struct snd_pcm_hw_params *fe_params,
@@ -1381,8 +1362,6 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	struct snd_pcm_hw_params *ref_params;
 	struct sof_ipc4_copier *ipc4_copier;
 	struct snd_sof_dai *dai;
-	struct snd_mask *fmt;
-	int out_sample_valid_bits;
 	u32 gtw_cfg_config_length;
 	u32 dma_config_tlv_size = 0;
 	void **ipc_config_data;
@@ -1664,11 +1643,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	}
 
 	/* modify the input params for the next widget */
-	fmt = hw_param_mask(pipeline_params, SNDRV_PCM_HW_PARAM_FORMAT);
-	out_sample_valid_bits =
-		SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(copier_data->out_format.fmt_cfg);
-	snd_mask_none(fmt);
-	ret = ipc4_set_fmt_mask(fmt, out_sample_valid_bits);
+	ret = sof_ipc4_update_hw_params(sdev, pipeline_params, &copier_data->out_format);
 	if (ret)
 		return ret;
 
-- 
2.41.0

