Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA433C6508
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jul 2021 22:36:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2386E16D0;
	Mon, 12 Jul 2021 22:35:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2386E16D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626122161;
	bh=18xSSuCy6YJ+XM9PVzrM8s1nqHi5Vqvx0fJSDmdbDoI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NcuYZODy8X8m5ypB3PwT3+VoY4tI2WeRAo1ELDxuNFpKgDlCreyEpCOw96tSvHvUg
	 AbnRR9ka7eJN/0LZtEC+mGE1LDQcVoTOU1x5GVKnOVdFrUwqizuQGZC5nkd/Gx+QP5
	 ttsb61Qd1yb2YJxLVp4ehgjsGJB4d0TTjKSqYHTA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83BECF804E7;
	Mon, 12 Jul 2021 22:33:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFF81F804E2; Mon, 12 Jul 2021 22:33:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0FECF80254
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 22:33:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0FECF80254
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="190431650"
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="190431650"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 13:32:56 -0700
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="561880777"
Received: from yangbosh-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.95.167])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 13:32:56 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/7] ASoC: Intel: sof_sdw: extends SOF_RT711_JDSRC to 4 bits
Date: Mon, 12 Jul 2021 15:32:38 -0500
Message-Id: <20210712203240.46960-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712203240.46960-1-pierre-louis.bossart@linux.intel.com>
References: <20210712203240.46960-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

commit 683b0df26c33 ("ASoC: rt711: add two jack detection modes")
added two jack detection modes. Rt711 has 4 JD modes now.
Reserve 4 bits in case rt711 adds more JD modes in the future.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_common.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index ec5740486b75..8baea9583007 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -41,21 +41,21 @@ enum {
 	SOF_I2S_SSP5 = BIT(5),
 };
 
-#define SOF_RT711_JDSRC(quirk)		((quirk) & GENMASK(1, 0))
-#define SOF_SDW_FOUR_SPK		BIT(2)
-#define SOF_SDW_TGL_HDMI		BIT(3)
-#define SOF_SDW_PCH_DMIC		BIT(4)
-#define SOF_SSP_PORT(x)		(((x) & GENMASK(5, 0)) << 5)
-#define SOF_SSP_GET_PORT(quirk)	(((quirk) >> 5) & GENMASK(5, 0))
-#define SOF_RT715_DAI_ID_FIX		BIT(11)
-#define SOF_SDW_NO_AGGREGATION		BIT(12)
+#define SOF_RT711_JDSRC(quirk)		((quirk) & GENMASK(3, 0))
+#define SOF_SDW_FOUR_SPK		BIT(4)
+#define SOF_SDW_TGL_HDMI		BIT(5)
+#define SOF_SDW_PCH_DMIC		BIT(6)
+#define SOF_SSP_PORT(x)		(((x) & GENMASK(5, 0)) << 7)
+#define SOF_SSP_GET_PORT(quirk)	(((quirk) >> 7) & GENMASK(5, 0))
+#define SOF_RT715_DAI_ID_FIX		BIT(13)
+#define SOF_SDW_NO_AGGREGATION		BIT(14)
 
 /* BT audio offload: reserve 3 bits for future */
-#define SOF_BT_OFFLOAD_SSP_SHIFT	13
-#define SOF_BT_OFFLOAD_SSP_MASK	(GENMASK(15, 13))
+#define SOF_BT_OFFLOAD_SSP_SHIFT	15
+#define SOF_BT_OFFLOAD_SSP_MASK	(GENMASK(17, 15))
 #define SOF_BT_OFFLOAD_SSP(quirk)	\
 	(((quirk) << SOF_BT_OFFLOAD_SSP_SHIFT) & SOF_BT_OFFLOAD_SSP_MASK)
-#define SOF_SSP_BT_OFFLOAD_PRESENT	BIT(16)
+#define SOF_SSP_BT_OFFLOAD_PRESENT	BIT(18)
 
 struct sof_sdw_codec_info {
 	const int part_id;
-- 
2.25.1

