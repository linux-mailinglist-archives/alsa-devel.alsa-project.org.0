Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D66256BD228
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 15:16:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52DEA10E9;
	Thu, 16 Mar 2023 15:15:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52DEA10E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678976209;
	bh=YzAQGsawF1U++dxnvCulLwcz2xCB8DbrhhQBBRQKNlQ=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EYyoBvzGJNZejx6PwABRn2+vRvWKV06bg0MufqCxXoJ9fBOy2n29eIs3vRQbNKRBX
	 nwfB5nX6GMX7VfcD84NExu3rfXIy3Hr9sp4ravejE1WoNma6bBXo9jiLCPuWLMSfBd
	 VUfHR7JF+zrhj3Z0e9cUNY04hI8qpQbDYQc8hdXo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF176F800C9;
	Thu, 16 Mar 2023 15:15:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0D81F80425; Thu, 16 Mar 2023 15:15:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 030EFF80423
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 15:15:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 030EFF80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lejsX3IH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678976104; x=1710512104;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YzAQGsawF1U++dxnvCulLwcz2xCB8DbrhhQBBRQKNlQ=;
  b=lejsX3IHlpRtBe5F0IO9PbmVxC8ocGpbeG72i9tLqPPcXWzHtJX5jLLD
   B7/8jXesayKyHm6W5SYFXrauXWGpo6UE93/HfnNLRcBfPptqklrVn//xG
   1NmUQhigQq4JHGeh1NqfK8PEKGzI8iOc5FZD5GtudsHiyS9l1QykX3hIy
   sUmSOE5Z559k3M+SPBvuGofzQ2oBjaQXof1QFeLLWalXkWdyq+V+8O5JJ
   1k9Ek3wkwT/qcmJyuTFNtfjUX0LPmtwBwAGO5Frk32fFuVvGBMHw8+wR2
   26Ze2fULgaodo+dPLS1LDd5VuN1J+OlZyU2AxVCwZjsliQtlIdR37eVkX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="365690643"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400";
   d="scan'208";a="365690643"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 07:14:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="1009238103"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400";
   d="scan'208";a="1009238103"
Received: from raberjix-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.62.186])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 07:14:35 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 2/2] ASoC: SOF: ipc4-topology: use common helper function in
 copier prepare
Date: Thu, 16 Mar 2023 16:14:58 +0200
Message-Id: <20230316141458.13940-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316141458.13940-1-peter.ujfalusi@linux.intel.com>
References: <20230316141458.13940-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FHCG2YD3API7M3BTYSL3NVR27IL7MWMU
X-Message-ID-Hash: FHCG2YD3API7M3BTYSL3NVR27IL7MWMU
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.com, kai.vehmanen@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FHCG2YD3API7M3BTYSL3NVR27IL7MWMU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Use the ipc4_set_fmt_mask() helper function instead of open-coding
the logic in multiple places.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index cf438f32b4ed..4fba8ada9a06 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1363,21 +1363,9 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	out_sample_valid_bits =
 		SOF_IPC4_AUDIO_FORMAT_CFG_V_BIT_DEPTH(copier_data->out_format.fmt_cfg);
 	snd_mask_none(fmt);
-	switch (out_sample_valid_bits) {
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
-		dev_err(sdev->dev, "invalid sample frame format %d\n",
-			params_format(pipeline_params));
-		return -EINVAL;
-	}
+	ret = ipc4_set_fmt_mask(fmt, out_sample_valid_bits);
+	if (ret)
+		return ret;
 
 	/*
 	 * Set the gateway dma_buffer_size to 2ms buffer size to meet the FW expectation. In the
-- 
2.39.2

