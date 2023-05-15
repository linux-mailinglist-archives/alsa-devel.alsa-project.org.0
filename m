Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E073F702AA4
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 12:35:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3534B11C;
	Mon, 15 May 2023 12:34:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3534B11C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684146926;
	bh=yaCcwoAiAqPtJLz5H09GLpfhdEAobXkof+RSn4AUDuU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ebysuCuFTR6XpqSYFOLzPkoHK0K7lRwyhLW/KhGfsaxTWytewxSU1GsMcr6sgtMm/
	 2MRF+cREzbGjnKggctMENln8LUKX8huCrAN2nelaTjNbZyycB/ceOJ0wBzFw4UcM53
	 sFHGHymoADCXfZQfYCj4JALzwIlYpuqIMo/YlsXc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93AAEF805A1; Mon, 15 May 2023 12:33:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F66BF805A1;
	Mon, 15 May 2023 12:33:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D254FF80549; Mon, 15 May 2023 12:33:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 00655F80431
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 12:32:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00655F80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hQfRHKAq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684146779; x=1715682779;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yaCcwoAiAqPtJLz5H09GLpfhdEAobXkof+RSn4AUDuU=;
  b=hQfRHKAqwqr71xXSslsGHvOc8C0GK+NUmnEAY3f781wzzAngduJllRbv
   T+p8DRmy9ogiKgoccyaMrDwBEFzb1D+kTNthknQXY0ab4XL/e+UIvRj3i
   MZ4fE+DsnkPv9pLRu/vNW7avTw4pyqIw4FFAOa3oxDzpG9GGhrbYuI2ew
   tXjANSPKnAWbqm8PgDnyA+7ZEKw3qZ9LGM21OZV7vq8xfIsrcLpIqAkG1
   x5YkbYfS7qe/qopee1bbM5d1xx7lAi6GTG+DHT4SqeBjXMB7v6sKSe0dr
   2Nw4mPssdY8gxTJo3mUB6yhiQhzPun2YrIk2XLRwhgvAnD6OablOhKMnj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="351200401"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200";
   d="scan'208";a="351200401"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 03:32:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694967684"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200";
   d="scan'208";a="694967684"
Received: from lpilolli-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.48.230])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 03:32:55 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 6/9] ASoC: SOF: ipc4-topology: Add a new helper function to
 get the valid bits
Date: Mon, 15 May 2023 13:33:33 +0300
Message-Id: <20230515103336.16132-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515103336.16132-1-peter.ujfalusi@linux.intel.com>
References: <20230515103336.16132-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: U6YAGECUIQYEGSHJTCJMBAFG4NK4S4DB
X-Message-ID-Hash: U6YAGECUIQYEGSHJTCJMBAFG4NK4S4DB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U6YAGECUIQYEGSHJTCJMBAFG4NK4S4DB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Add a new helper function sof_ipc4_get_valid_bits() to get the valid
bits in the PCM params.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index f3a6e739e800..2903e784a5dd 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1075,6 +1075,21 @@ static int sof_ipc4_init_output_audio_fmt(struct snd_sof_dev *sdev,
 	return i;
 }
 
+static int sof_ipc4_get_valid_bits(struct snd_sof_dev *sdev, struct snd_pcm_hw_params *params)
+{
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S16_LE:
+		return 16;
+	case SNDRV_PCM_FORMAT_S24_LE:
+		return 24;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		return 32;
+	default:
+		dev_err(sdev->dev, "invalid pcm frame format %d\n", params_format(params));
+		return -EINVAL;
+	}
+}
+
 static int sof_ipc4_init_input_audio_fmt(struct snd_sof_dev *sdev,
 					 struct snd_sof_widget *swidget,
 					 struct sof_ipc4_base_module_cfg *base_config,
@@ -1093,20 +1108,9 @@ static int sof_ipc4_init_input_audio_fmt(struct snd_sof_dev *sdev,
 		return -EINVAL;
 	}
 
-	switch (params_format(params)) {
-	case SNDRV_PCM_FORMAT_S16_LE:
-		sample_valid_bits = 16;
-		break;
-	case SNDRV_PCM_FORMAT_S24_LE:
-		sample_valid_bits = 24;
-		break;
-	case SNDRV_PCM_FORMAT_S32_LE:
-		sample_valid_bits = 32;
-		break;
-	default:
-		dev_err(sdev->dev, "invalid pcm frame format %d\n", params_format(params));
-		return -EINVAL;
-	}
+	sample_valid_bits = sof_ipc4_get_valid_bits(sdev, params);
+	if (sample_valid_bits < 0)
+		return sample_valid_bits;
 
 	if (!pin_fmts_size) {
 		dev_err(sdev->dev, "no formats available for %s\n", swidget->widget->name);
-- 
2.40.1

