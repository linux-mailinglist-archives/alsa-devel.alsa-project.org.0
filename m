Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D9A8A1723
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Apr 2024 16:28:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F18E8240C;
	Thu, 11 Apr 2024 16:27:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F18E8240C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712845684;
	bh=ExoEEktZ0Q694B1jGfibfgqap3Fns8pq0px5FRmYhys=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bWdZSKnE0QSMdyjjL/n53PG8+ffYs6RlQfKUtQsyKEKYkhBrmiQoM78sSIPo3A/Lq
	 nh6qJp68kxDbz9+G9oSeovXRVhJj1T5TRb0bWjPHfZ2sFWTghHFfWUpEszynNk4ges
	 T59cjv8A7Nza3rhnpZo6Vu1ci1rGDgFRoZR6+ig4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B27B0F8056F; Thu, 11 Apr 2024 16:27:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C96CF8059F;
	Thu, 11 Apr 2024 16:27:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB2C4F8026D; Thu, 11 Apr 2024 16:27:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3278F80236
	for <alsa-devel@alsa-project.org>; Thu, 11 Apr 2024 16:27:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3278F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Y6xQRd3M
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43BAfAIA006316;
	Thu, 11 Apr 2024 09:27:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=Z
	Y+B99ld798igcjetqgoBpCqki2RZTaHQvRZhUJbx5E=; b=Y6xQRd3MOd0LGr/0m
	o1vCjLrFX0XrR9ppDQHQm358RyeRnyuUkgJoIQPnHCY5QeywNyvKuiwWZaaSd9yS
	bhxUQ4tlySv+vHY6bbaPu9+242KKOBW0M9kPsDlfA829kYfqy6pHrQXUgRiorf10
	BLACJv16EKRESlievpRFIh5hipoxtpToSiujavQ7lXgJG5b7sh82Lf9X2xIgzAOd
	FXZONU6m+sQ7ZWijrMogWMX2bG9yBM3PczodmWguL5BfzbKPaN84V/YgdSfhvbzA
	hszr4zshDtjLwPG1u6BGZg094lR0eEcTBA2TDSVP9mwNFb73TnKTHvlmnh1eDY6T
	IoWng==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3xb3sxq55r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 09:27:17 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Apr
 2024 15:27:15 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9
 via Frontend Transport; Thu, 11 Apr 2024 15:27:15 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.61.64.140])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 35AFB820242;
	Thu, 11 Apr 2024 14:27:15 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v1] ASoC: cs35l41: Update DSP1RX5/6 Sources for DSP config
Date: Thu, 11 Apr 2024 15:26:48 +0100
Message-ID: <20240411142648.650921-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 12Rhjm7ZXsn-PGLzIqvG5rshIIjAkxj5
X-Proofpoint-GUID: 12Rhjm7ZXsn-PGLzIqvG5rshIIjAkxj5
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 3WPT77KJ3A254TZEXPDAI744IU6PDK5W
X-Message-ID-Hash: 3WPT77KJ3A254TZEXPDAI744IU6PDK5W
X-MailFrom: prvs=1831d0461d=sbinding@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3WPT77KJ3A254TZEXPDAI744IU6PDK5W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently, all ASoC systems are set to use VPMON for DSP1RX5_SRC,
however, this is required only for internal boost systems.
External boost systems require VBSTMON instead of VPMON to be the
input to DSP1RX5_SRC.
Shared Boost Active acts like Internal boost (requires VPMON).
Shared Boost Passive acts like External boost (requires VBSTMON)
All systems require DSP1RX6_SRC to be set to VBSTMON.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index dfb4ce53491b..f8e57a2fc3e3 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1094,6 +1094,7 @@ static int cs35l41_handle_pdata(struct device *dev, struct cs35l41_hw_cfg *hw_cf
 static int cs35l41_dsp_init(struct cs35l41_private *cs35l41)
 {
 	struct wm_adsp *dsp;
+	uint32_t dsp1rx5_src;
 	int ret;
 
 	dsp = &cs35l41->dsp;
@@ -1113,16 +1114,29 @@ static int cs35l41_dsp_init(struct cs35l41_private *cs35l41)
 		return ret;
 	}
 
-	ret = regmap_write(cs35l41->regmap, CS35L41_DSP1_RX5_SRC,
-			   CS35L41_INPUT_SRC_VPMON);
+	switch (cs35l41->hw_cfg.bst_type) {
+	case CS35L41_INT_BOOST:
+	case CS35L41_SHD_BOOST_ACTV:
+		dsp1rx5_src = CS35L41_INPUT_SRC_VPMON;
+		break;
+	case CS35L41_EXT_BOOST:
+	case CS35L41_SHD_BOOST_PASS:
+		dsp1rx5_src = CS35L41_INPUT_SRC_VBSTMON;
+		break;
+	default:
+		dev_err(cs35l41->dev, "wm_halo_init failed - Invalid Boost Type: %d\n",
+			cs35l41->hw_cfg.bst_type);
+		goto err_dsp;
+	}
+
+	ret = regmap_write(cs35l41->regmap, CS35L41_DSP1_RX5_SRC, dsp1rx5_src);
 	if (ret < 0) {
-		dev_err(cs35l41->dev, "Write INPUT_SRC_VPMON failed: %d\n", ret);
+		dev_err(cs35l41->dev, "Write DSP1RX5_SRC: %d failed: %d\n", dsp1rx5_src, ret);
 		goto err_dsp;
 	}
-	ret = regmap_write(cs35l41->regmap, CS35L41_DSP1_RX6_SRC,
-			   CS35L41_INPUT_SRC_CLASSH);
+	ret = regmap_write(cs35l41->regmap, CS35L41_DSP1_RX6_SRC, CS35L41_INPUT_SRC_VBSTMON);
 	if (ret < 0) {
-		dev_err(cs35l41->dev, "Write INPUT_SRC_CLASSH failed: %d\n", ret);
+		dev_err(cs35l41->dev, "Write CS35L41_INPUT_SRC_VBSTMON failed: %d\n", ret);
 		goto err_dsp;
 	}
 	ret = regmap_write(cs35l41->regmap, CS35L41_DSP1_RX7_SRC,
-- 
2.34.1

