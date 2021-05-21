Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0D238CA89
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 18:03:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FCCF16C3;
	Fri, 21 May 2021 18:02:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FCCF16C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621613004;
	bh=uPr4t8BTIAG0Cxk+ER6BIjSABqBvHG4M6YVWtkhoFGY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o2BrjIQP1J31HTJkhtAaDyGbAxm8TxO33mibIYHqEEAuj4FnzieBf10Wc9iendbV1
	 bc37eUu7T5+mP6J4QiXLDhd8UGiTND3Ths2oIlCuBOj06CvxGjgWG7VCVBO+Tiq2wv
	 2zn0+PytKoO+FOsUyHI3zDTsqr8328GqLW+Borsw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9B80F80246;
	Fri, 21 May 2021 18:01:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16BB4F801DB; Fri, 21 May 2021 18:01:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4771F800C1
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 18:01:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4771F800C1
IronPort-SDR: lgE2tLFBJesF5eTBdGncnNbnG9HwTbTTjJrmlPQkq8Gl+HLzxcgmKXGGtQ5W2mf/Aadp5sOwOR
 PxNlNA7eUAEg==
X-IronPort-AV: E=McAfee;i="6200,9189,9990"; a="265421339"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="265421339"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2021 09:01:37 -0700
IronPort-SDR: L5tRtrVpija+easmnX7N8Z/SkEpGjypWJ48bgnBZIT6Hj818/jBOKWMTLFLInRvM7MjcXEqOFM
 r2hCvzp8gQow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="468543254"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by FMSMGA003.fm.intel.com with ESMTP; 21 May 2021 09:01:33 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 2/2] ASoC: Intel: sof_sdw: add quirk support for Brya and
 BT-offload
Date: Fri, 21 May 2021 18:56:32 +0300
Message-Id: <20210521155632.3736393-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210521155632.3736393-1-kai.vehmanen@linux.intel.com>
References: <20210521155632.3736393-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: cezary.rojewski@intel.com, kai.vehmanen@linux.intel.com,
 Jie Yang <yang.jie@linux.intel.com>, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, Bard Liao <bard.liao@intel.com>,
 yung-chuan.liao@linux.intel.com,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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

From: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>

Brya is another ADL-P product.

AlderLake has support for Bluetooth audio offload capability.
Enable the BT-offload quirk for ADL-P Brya and the Intel RVP.

Signed-off-by: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 0f1ad9e0a53b..dd5d8e6af626 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -199,7 +199,21 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		.driver_data = (void *)(SOF_RT711_JD_SRC_JD1 |
 					SOF_SDW_TGL_HDMI |
 					SOF_RT715_DAI_ID_FIX |
-					SOF_SDW_PCH_DMIC),
+					SOF_SDW_PCH_DMIC |
+					SOF_BT_OFFLOAD_SSP(2) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Brya"),
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					SOF_SDW_PCH_DMIC |
+					SOF_SDW_FOUR_SPK |
+					SOF_BT_OFFLOAD_SSP(2) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
 	{}
 };
-- 
2.31.0

