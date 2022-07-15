Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AC85763E6
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 16:55:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE91B1930;
	Fri, 15 Jul 2022 16:54:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE91B1930
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657896938;
	bh=sZ54xulv0edJ+YOzbrzxq/4OMsGlUM2TXXrHB9xyb9w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O1jKIX+e1heeMhB2iB9PHtn5YvEQ+DquRuPnISkWwMXepdHJaEbq/yAe1J8T1a7Xr
	 eMZY1GLdsn/u8ClnMvcUG87NDaefdLu1C54Qja3YsNquu7v30nCz7s9F4iN4JJkLDG
	 JT65TdOT3gM7IZPOW45dHf7HTqZpixg7YoqfSKgU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26308F80568;
	Fri, 15 Jul 2022 16:53:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA459F8053C; Fri, 15 Jul 2022 16:53:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0103DF8053C
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 16:52:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0103DF8053C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="JCZ0zB0K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657896775; x=1689432775;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sZ54xulv0edJ+YOzbrzxq/4OMsGlUM2TXXrHB9xyb9w=;
 b=JCZ0zB0KKrTrGQiNnpDz3XpMcDog1NXhmEs6cPh6Cg+5DNMeID3IceeA
 /pcQqPHXM4DmsGv28aq8SdwltN4iHzJCwUpdKeCvhvL+4Gao2pneqb8Sv
 0KdHGvy+cSStE+QcSJelrXf0kbgMdfcCg633yMYNohSiFBQBrqkAPX8Sx
 i35zmsV8gJ9S3aTqiNub4+Flw1IzYvI9ODg2J0Xj8vigVibNnpjw6GDIs
 CfxsYu6qgi66J+qrBwMh+zAEAGRMwzso5mpXs6Zxc44V3Yx9pM7coRvXj
 g3b3b1FWde/kWz3r28gAohz4UH6B67C9WMs18yQaPPF3AL9d7X/yRCC42 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="311476922"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="311476922"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 07:52:36 -0700
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="923533133"
Received: from jmurope-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.14.184])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 07:52:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/11] ASoC: SOF: Intel: hda-stream: test DMA buffer first in
 hw_params
Date: Fri, 15 Jul 2022 09:52:16 -0500
Message-Id: <20220715145216.277003-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220715145216.277003-1-pierre-louis.bossart@linux.intel.com>
References: <20220715145216.277003-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

We should be consistent and always test that the DMA buffer is
allocated before continuing with the hw_params setup.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 4531e1ee5ed0..b58662faa4aa 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -411,6 +411,11 @@ int hda_dsp_iccmax_stream_hw_params(struct snd_sof_dev *sdev, struct hdac_ext_st
 		return -ENODEV;
 	}
 
+	if (!dmab) {
+		dev_err(sdev->dev, "error: no dma buffer allocated!\n");
+		return -ENODEV;
+	}
+
 	if (hstream->posbuf)
 		*hstream->posbuf = 0;
 
@@ -485,16 +490,16 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 		return -ENODEV;
 	}
 
-	/* decouple host and link DMA */
-	mask = 0x1 << hstream->index;
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
-				mask, mask);
-
 	if (!dmab) {
 		dev_err(sdev->dev, "error: no dma buffer allocated!\n");
 		return -ENODEV;
 	}
 
+	/* decouple host and link DMA */
+	mask = 0x1 << hstream->index;
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
+				mask, mask);
+
 	/* clear stream status */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, sd_offset,
 				SOF_HDA_CL_DMA_SD_INT_MASK |
-- 
2.34.1

