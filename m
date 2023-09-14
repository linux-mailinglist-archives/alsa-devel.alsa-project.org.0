Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D38E47A04E9
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 15:05:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7EA79F6;
	Thu, 14 Sep 2023 15:04:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7EA79F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694696714;
	bh=4CPCOX1eu3zYC/MQIb2T7mKRm9wXMckFOEmUzC/1elE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ruvwjRhbgoF2KL6FoRiPbW+xafsohBvqOlejT1Lzm+ctrW2MA7XrBnZG9NaZUHINI
	 s8TF+1pRzrrqCMQPfgWYTTfdt9bxcNLVoitqzPvugPQ+PT/I8yLwlhMrG563itx/XJ
	 ZtKnBTj3CR2XgQ6RU8Ssmcou0GBZDSO+8qnS8zAs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0AE5F80537; Thu, 14 Sep 2023 15:04:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E937F80141;
	Thu, 14 Sep 2023 15:04:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06386F80431; Thu, 14 Sep 2023 15:04:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E6E4F801F5
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 15:04:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E6E4F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=aFPvTbW/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694696651; x=1726232651;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4CPCOX1eu3zYC/MQIb2T7mKRm9wXMckFOEmUzC/1elE=;
  b=aFPvTbW/L+fj8pkjJS9hWFxe+Mt7/OelFbn908g9x+NnDgjBJzsjTANS
   2ws9K14Pdn2CJo0HXO2F3skLc1V8LpC421K6Rnfnvj/rwzuuk6ASmSm2w
   KWjhC9sI6Z8uVMoNYcvRmmhn5hR1Ey6znpelYwODAxz9Q2Vjmb/RDaaRD
   e60EvqNfAilyLHFp99sYpNiCO3FbzpsM3wN/IUDvk8la7l62/EoySRd1A
   Iu49dsbuFu6zuDACvS1u/77O0nT5+sX79sIDRODcAZ2WPjgs4mgDSpHIJ
   SqU6j9T5OA+RcPHIivH9LTfIq3DOboNs5UO05WSC6exXOSabjSwmQ+ZgU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="359201351"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000";
   d="scan'208";a="359201351"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 06:03:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="721256123"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000";
   d="scan'208";a="721256123"
Received: from pakurapo-mobl3.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.37.8])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 06:02:58 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	yong.zhi@intel.com
Subject: [PATCH] ASoC: SOF: ipc4-topology: Add deep buffer size to debug
 prints
Date: Thu, 14 Sep 2023 16:03:03 +0300
Message-ID: <20230914130303.13636-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7OHSAOPDHUDIOV5YATBY3RJ4KYGRD6WR
X-Message-ID-Hash: 7OHSAOPDHUDIOV5YATBY3RJ4KYGRD6WR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7OHSAOPDHUDIOV5YATBY3RJ4KYGRD6WR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Yong Zhi <yong.zhi@intel.com>

Print deep_buffer_dma_ms and dma_buffer_size for debug purpose.

Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 7cb63e6b24dc..8aa07ccfa569 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1726,9 +1726,14 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 			SOF_IPC4_MIN_DMA_BUFFER_SIZE * copier_data->base_config.ibs;
 		break;
 	case snd_soc_dapm_aif_in:
-			copier_data->gtw_cfg.dma_buffer_size =
-				max((u32)SOF_IPC4_MIN_DMA_BUFFER_SIZE, deep_buffer_dma_ms) *
-					copier_data->base_config.ibs;
+		copier_data->gtw_cfg.dma_buffer_size =
+			max((u32)SOF_IPC4_MIN_DMA_BUFFER_SIZE, deep_buffer_dma_ms) *
+				copier_data->base_config.ibs;
+		dev_dbg(sdev->dev, "copier %s, dma buffer%s: %u ms (%u bytes)",
+			swidget->widget->name,
+			deep_buffer_dma_ms ? " (using Deep Buffer)" : "",
+			max((u32)SOF_IPC4_MIN_DMA_BUFFER_SIZE, deep_buffer_dma_ms),
+			copier_data->gtw_cfg.dma_buffer_size);
 		break;
 	case snd_soc_dapm_dai_out:
 	case snd_soc_dapm_aif_out:
-- 
2.42.0

