Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5143477143
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 13:03:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65A7118E3;
	Thu, 16 Dec 2021 13:02:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65A7118E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639656217;
	bh=ZW0JZcuedlQhj8+kMjlsUWdmOz6UPMsfa1S/QNhr3QM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PDcqdtxT5++2uUa2KB9jctuRd2QyQbSln970i91XG4uYceeG8DTGY5uBQPrPce3mI
	 CiLTVPmx95ZfrqqXQIIPJcevCg+4yJp3N0Oyh9LUMvzpVnB4ueoNTy2iY+dCpz22rg
	 ZSZFZyu/cGswCOV54zxTA9xKREipmsAl7fqfmIHY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D262FF80165;
	Thu, 16 Dec 2021 13:02:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82FA0F800B0; Thu, 16 Dec 2021 13:02:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A077F800B0
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 13:02:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A077F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="bYVItV1e"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BG6WwLo019726;
 Thu, 16 Dec 2021 05:43:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=phtIJUYnNg6/fKgTeaUUVdx/g4sHBq3AbZNhZEFGScU=;
 b=bYVItV1eWQNERZ7P87mOiHy9xlF9XTR1dQR9NwVSNn77PucbnLUGVNgxEkfjntFfejn+
 e4wdimyY3tLBINEttlVFXTuJLNo41ZDtgBsf9VLNkWOiJY5IHMKTUXuSaAr3S8bIHV4Q
 cwuPlOX0pOSgyMo0keFws348ADrW2TzvoWAnUeY9F1LPj3pBJAVapEL+cIR1S+yq/lPz
 DzDh89ftS3QAiWB0pR4KdlJwHiAygVunG92RhLc8lRaLkPSXOUPU2s9xUNTYlY/2xLLT
 qwr04hqmBbZSM/ETZoOIvXAMI7XagPY/dhsGKZz/83kW6ZmF6yYFt70U66+sVOxlBhfg /Q== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3cymsc110q-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Dec 2021 05:43:40 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 16 Dec
 2021 11:43:38 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Thu, 16 Dec 2021 11:43:38 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.64.39])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C06C545D;
 Thu, 16 Dec 2021 11:43:37 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v5 06/10] ASoC: cs35l41: Create shared function for boost
 configuration
Date: Thu, 16 Dec 2021 11:43:28 +0000
Message-ID: <20211216114332.153409-7-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211216114332.153409-1-tanureal@opensource.cirrus.com>
References: <20211216114332.153409-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: WjRGmj-yFVQkzD-24FFzmP3GEDJDndJe
X-Proofpoint-ORIG-GUID: WjRGmj-yFVQkzD-24FFzmP3GEDJDndJe
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org
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

ASoC and HDA will use the same registers to configure
internal boost for the device

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 include/sound/cs35l41.h        |   2 +
 sound/soc/codecs/cs35l41-lib.c |  98 ++++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l41.c     | 105 +--------------------------------
 3 files changed, 102 insertions(+), 103 deletions(-)

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index 39d150f61382..29a527457b48 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -767,5 +767,7 @@ int cs35l41_register_errata_patch(struct device *dev, struct regmap *reg, unsign
 int cs35l41_set_channels(struct device *dev, struct regmap *reg,
 			 unsigned int tx_num, unsigned int *tx_slot,
 			 unsigned int rx_num, unsigned int *rx_slot);
+int cs35l41_boost_config(struct device *dev, struct regmap *regmap, int boost_ind, int boost_cap,
+			 int boost_ipk);
 
 #endif /* __CS35L41_H */
diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index afcec715374d..d026c5e3a378 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -966,6 +966,104 @@ int cs35l41_set_channels(struct device *dev, struct regmap *reg,
 }
 EXPORT_SYMBOL_GPL(cs35l41_set_channels);
 
+static const unsigned char cs35l41_bst_k1_table[4][5] = {
+	{ 0x24, 0x32, 0x32, 0x4F, 0x57 },
+	{ 0x24, 0x32, 0x32, 0x4F, 0x57 },
+	{ 0x40, 0x32, 0x32, 0x4F, 0x57 },
+	{ 0x40, 0x32, 0x32, 0x4F, 0x57 }
+};
+
+static const unsigned char cs35l41_bst_k2_table[4][5] = {
+	{ 0x24, 0x49, 0x66, 0xA3, 0xEA },
+	{ 0x24, 0x49, 0x66, 0xA3, 0xEA },
+	{ 0x48, 0x49, 0x66, 0xA3, 0xEA },
+	{ 0x48, 0x49, 0x66, 0xA3, 0xEA }
+};
+
+static const unsigned char cs35l41_bst_slope_table[4] = {
+	0x75, 0x6B, 0x3B, 0x28
+};
+
+
+int cs35l41_boost_config(struct device *dev, struct regmap *regmap, int boost_ind, int boost_cap,
+			 int boost_ipk)
+{
+	unsigned char bst_lbst_val, bst_cbst_range, bst_ipk_scaled;
+	int ret;
+
+	switch (boost_ind) {
+	case 1000:	/* 1.0 uH */
+		bst_lbst_val = 0;
+		break;
+	case 1200:	/* 1.2 uH */
+		bst_lbst_val = 1;
+		break;
+	case 1500:	/* 1.5 uH */
+		bst_lbst_val = 2;
+		break;
+	case 2200:	/* 2.2 uH */
+		bst_lbst_val = 3;
+		break;
+	default:
+		dev_err(dev, "Invalid boost inductor value: %d nH\n", boost_ind);
+		return -EINVAL;
+	}
+
+	switch (boost_cap) {
+	case 0 ... 19:
+		bst_cbst_range = 0;
+		break;
+	case 20 ... 50:
+		bst_cbst_range = 1;
+		break;
+	case 51 ... 100:
+		bst_cbst_range = 2;
+		break;
+	case 101 ... 200:
+		bst_cbst_range = 3;
+		break;
+	default:	/* 201 uF and greater */
+		bst_cbst_range = 4;
+	}
+
+	ret = regmap_update_bits(regmap, CS35L41_BSTCVRT_COEFF,
+				 CS35L41_BST_K1_MASK | CS35L41_BST_K2_MASK,
+				 cs35l41_bst_k1_table[bst_lbst_val][bst_cbst_range]
+					<< CS35L41_BST_K1_SHIFT |
+				 cs35l41_bst_k2_table[bst_lbst_val][bst_cbst_range]
+					<< CS35L41_BST_K2_SHIFT);
+	if (ret) {
+		dev_err(dev, "Failed to write boost coefficients: %d\n", ret);
+		return ret;
+	}
+
+	ret = regmap_update_bits(regmap, CS35L41_BSTCVRT_SLOPE_LBST,
+				 CS35L41_BST_SLOPE_MASK | CS35L41_BST_LBST_VAL_MASK,
+				 cs35l41_bst_slope_table[bst_lbst_val]
+					<< CS35L41_BST_SLOPE_SHIFT |
+				 bst_lbst_val << CS35L41_BST_LBST_VAL_SHIFT);
+	if (ret) {
+		dev_err(dev, "Failed to write boost slope/inductor value: %d\n", ret);
+		return ret;
+	}
+
+	if (boost_ipk < 1600 || boost_ipk > 4500) {
+		dev_err(dev, "Invalid boost inductor peak current: %d mA\n", boost_ipk);
+		return -EINVAL;
+	}
+	bst_ipk_scaled = ((boost_ipk - 1600) / 50) + 0x10;
+
+	ret = regmap_update_bits(regmap, CS35L41_BSTCVRT_PEAK_CUR, CS35L41_BST_IPK_MASK,
+				 bst_ipk_scaled << CS35L41_BST_IPK_SHIFT);
+	if (ret) {
+		dev_err(dev, "Failed to write boost inductor peak current: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cs35l41_boost_config);
+
 MODULE_DESCRIPTION("CS35L41 library");
 MODULE_AUTHOR("David Rhodes, Cirrus Logic Inc, <david.rhodes@cirrus.com>");
 MODULE_AUTHOR("Lucas Tanure, Cirrus Logic Inc, <tanureal@opensource.cirrus.com>");
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 88d6e77fdb50..d9e6e84e64d0 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -150,24 +150,6 @@ static const struct cs35l41_fs_mon_config cs35l41_fs_mon[] = {
 	{ 6144000,	16,	24 },
 };
 
-static const unsigned char cs35l41_bst_k1_table[4][5] = {
-	{ 0x24, 0x32, 0x32, 0x4F, 0x57 },
-	{ 0x24, 0x32, 0x32, 0x4F, 0x57 },
-	{ 0x40, 0x32, 0x32, 0x4F, 0x57 },
-	{ 0x40, 0x32, 0x32, 0x4F, 0x57 }
-};
-
-static const unsigned char cs35l41_bst_k2_table[4][5] = {
-	{ 0x24, 0x49, 0x66, 0xA3, 0xEA },
-	{ 0x24, 0x49, 0x66, 0xA3, 0xEA },
-	{ 0x48, 0x49, 0x66, 0xA3, 0xEA },
-	{ 0x48, 0x49, 0x66, 0xA3, 0xEA }
-};
-
-static const unsigned char cs35l41_bst_slope_table[4] = {
-	0x75, 0x6B, 0x3B, 0x28
-};
-
 static int cs35l41_get_fs_mon_config_index(int freq)
 {
 	int i;
@@ -992,88 +974,6 @@ static int cs35l41_dai_set_sysclk(struct snd_soc_dai *dai,
 	return 0;
 }
 
-static int cs35l41_boost_config(struct cs35l41_private *cs35l41,
-				int boost_ind, int boost_cap, int boost_ipk)
-{
-	unsigned char bst_lbst_val, bst_cbst_range, bst_ipk_scaled;
-	struct regmap *regmap = cs35l41->regmap;
-	struct device *dev = cs35l41->dev;
-	int ret;
-
-	switch (boost_ind) {
-	case 1000:	/* 1.0 uH */
-		bst_lbst_val = 0;
-		break;
-	case 1200:	/* 1.2 uH */
-		bst_lbst_val = 1;
-		break;
-	case 1500:	/* 1.5 uH */
-		bst_lbst_val = 2;
-		break;
-	case 2200:	/* 2.2 uH */
-		bst_lbst_val = 3;
-		break;
-	default:
-		dev_err(dev, "Invalid boost inductor value: %d nH\n", boost_ind);
-		return -EINVAL;
-	}
-
-	switch (boost_cap) {
-	case 0 ... 19:
-		bst_cbst_range = 0;
-		break;
-	case 20 ... 50:
-		bst_cbst_range = 1;
-		break;
-	case 51 ... 100:
-		bst_cbst_range = 2;
-		break;
-	case 101 ... 200:
-		bst_cbst_range = 3;
-		break;
-	default:	/* 201 uF and greater */
-		bst_cbst_range = 4;
-	}
-
-	ret = regmap_update_bits(regmap, CS35L41_BSTCVRT_COEFF,
-				 CS35L41_BST_K1_MASK | CS35L41_BST_K2_MASK,
-				 cs35l41_bst_k1_table[bst_lbst_val][bst_cbst_range]
-					<< CS35L41_BST_K1_SHIFT |
-				 cs35l41_bst_k2_table[bst_lbst_val][bst_cbst_range]
-					<< CS35L41_BST_K2_SHIFT);
-	if (ret) {
-		dev_err(dev, "Failed to write boost coefficients: %d\n", ret);
-		return ret;
-	}
-
-	ret = regmap_update_bits(regmap, CS35L41_BSTCVRT_SLOPE_LBST,
-				 CS35L41_BST_SLOPE_MASK | CS35L41_BST_LBST_VAL_MASK,
-				 cs35l41_bst_slope_table[bst_lbst_val]
-					<< CS35L41_BST_SLOPE_SHIFT |
-				 bst_lbst_val << CS35L41_BST_LBST_VAL_SHIFT);
-	if (ret) {
-		dev_err(dev, "Failed to write boost slope/inductor value: %d\n", ret);
-		return ret;
-	}
-
-	if (boost_ipk < 1600 || boost_ipk > 4500) {
-		dev_err(dev, "Invalid boost inductor peak current: %d mA\n",
-			boost_ipk);
-		return -EINVAL;
-	}
-	bst_ipk_scaled = ((boost_ipk - 1600) / 50) + 0x10;
-
-	ret = regmap_update_bits(regmap, CS35L41_BSTCVRT_PEAK_CUR,
-				 CS35L41_BST_IPK_MASK,
-				 bst_ipk_scaled << CS35L41_BST_IPK_SHIFT);
-	if (ret) {
-		dev_err(dev, "Failed to write boost inductor peak current: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
-}
-
 static int cs35l41_set_pdata(struct cs35l41_private *cs35l41)
 {
 	int ret;
@@ -1082,9 +982,8 @@ static int cs35l41_set_pdata(struct cs35l41_private *cs35l41)
 	/* Required */
 	if (cs35l41->pdata.bst_ipk &&
 	    cs35l41->pdata.bst_ind && cs35l41->pdata.bst_cap) {
-		ret = cs35l41_boost_config(cs35l41, cs35l41->pdata.bst_ind,
-					   cs35l41->pdata.bst_cap,
-					   cs35l41->pdata.bst_ipk);
+		ret = cs35l41_boost_config(cs35l41->dev, cs35l41->regmap, cs35l41->pdata.bst_ind,
+					   cs35l41->pdata.bst_cap, cs35l41->pdata.bst_ipk);
 		if (ret) {
 			dev_err(cs35l41->dev, "Error in Boost DT config: %d\n", ret);
 			return ret;
-- 
2.34.1

