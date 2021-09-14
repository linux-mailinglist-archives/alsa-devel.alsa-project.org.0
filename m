Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1C640B058
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Sep 2021 16:15:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35E391796;
	Tue, 14 Sep 2021 16:14:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35E391796
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631628944;
	bh=SYXAK9jrQoKB8zaFCJ3jQ/OJ345XoE+zwsDcRRxmAYs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JTfGt+/Q8UwBe2c7nG/7wnZ+g2gh2KsMQ+GeE4pwBZO9BAShyz8QxA3sbsWJO2kYn
	 DewH/SF9H5SHW91KKYObknYHS8lC1SEnTTtkY5aYWprW2ArbJY9RIWlYcFFO2Q2jMp
	 Fif7op7xBIGBLux9pZeZKfhGFRjl+8sBHB6vmSQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B8C2F8025A;
	Tue, 14 Sep 2021 16:14:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB63DF804AE; Tue, 14 Sep 2021 16:14:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 528F3F8025E
 for <alsa-devel@alsa-project.org>; Tue, 14 Sep 2021 16:13:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 528F3F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="R1xGSlp6"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18E5NPuL016714; 
 Tue, 14 Sep 2021 09:13:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=a1ubcKIL979ETMfpZLnAnAWfF4Fir9K+s9dAAvTUCNU=;
 b=R1xGSlp6t1ClU1kdY+Ffmu5WVqRwwMSt+3XRq3H5Q74Vi4nXgLfHxtoZoCtSISr2SS0I
 BsiRCLYynNwVNAAR9O38yoU4upGXl3aQ0RsDfojWmo/C5lQl6GujAR+DA5Ep+vZABADI
 Fg7Bo9sHkg/4pKz37T4a0m1hnPQ9sLa/UK/JPcORkpZL4yjFFL+WscBYAyq1qme9l0O5
 CcFIJXWcOA7aJKkAyFhzuDWZXzjhGL0C0g8Hdf+5cgSsz6/i9HjdY/OZjmL2mmQ3a6G+
 kgTwQ0R5YGq9tFvAaf9S15PgOHNBIwH4x1B+ODuythX37LzWpZ6GsmSKEYlStGW/TZPa BA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3b2gkx8qtw-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 14 Sep 2021 09:13:52 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 14 Sep
 2021 15:13:49 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Tue, 14 Sep 2021 15:13:49 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A5067B2F;
 Tue, 14 Sep 2021 14:13:49 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 3/6] ASoC: cs35l41: Combine adjacent register writes
Date: Tue, 14 Sep 2021 15:13:46 +0100
Message-ID: <20210914141349.30218-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210914141349.30218-1-ckeepax@opensource.cirrus.com>
References: <20210914141349.30218-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: NP4jlybVq2GN2brpPNmfoVzVNe5r4X61
X-Proofpoint-GUID: NP4jlybVq2GN2brpPNmfoVzVNe5r4X61
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 james.schulman@cirrus.com, lgirdwood@gmail.com, david.rhodes@cirrus.com
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

cs35l41 is often connected over I2C which is a very slow bus, as such
timings can be greatly improved combining writes where acceptable.
Update several points where the driver does multiple register writes
when a single one would suffice.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41.c | 146 +++++++++++++++------------------------------
 sound/soc/codecs/cs35l41.h |   1 +
 2 files changed, 49 insertions(+), 98 deletions(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 8c2c695813cd7..ce652a454dfc8 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -712,24 +712,29 @@ static int cs35l41_set_channel_map(struct snd_soc_dai *dai, unsigned int tx_num,
 {
 	struct cs35l41_private *cs35l41 =
 			snd_soc_component_get_drvdata(dai->component);
+	unsigned int val, mask;
 	int i;
 
 	if (tx_num > 4 || rx_num > 2)
 		return -EINVAL;
 
+	val = 0;
+	mask = 0;
 	for (i = 0; i < rx_num; i++) {
-		dev_dbg(cs35l41->dev, "%s: rx slot %d position = %d\n",
-				__func__, i, rx_slot[i]);
-		regmap_update_bits(cs35l41->regmap, CS35L41_SP_FRAME_RX_SLOT,
-				0x3F << (i * 8), rx_slot[i] << (i * 8));
+		dev_dbg(cs35l41->dev, "rx slot %d position = %d\n", i, rx_slot[i]);
+		val |= rx_slot[i] << (i * 8);
+		mask |= 0x3F << (i * 8);
 	}
+	regmap_update_bits(cs35l41->regmap, CS35L41_SP_FRAME_RX_SLOT, mask, val);
 
+	val = 0;
+	mask = 0;
 	for (i = 0; i < tx_num; i++) {
-		dev_dbg(cs35l41->dev, "%s: tx slot %d position = %d\n",
-				__func__, i, tx_slot[i]);
-		regmap_update_bits(cs35l41->regmap, CS35L41_SP_FRAME_TX_SLOT,
-				0x3F << (i * 8), tx_slot[i] << (i * 8));
+		dev_dbg(cs35l41->dev, "tx slot %d position = %d\n", i, tx_slot[i]);
+		val |= tx_slot[i] << (i * 8);
+		mask |= 0x3F << (i * 8);
 	}
+	regmap_update_bits(cs35l41->regmap, CS35L41_SP_FRAME_TX_SLOT, mask, val);
 
 	return 0;
 }
@@ -738,14 +743,13 @@ static int cs35l41_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 {
 	struct cs35l41_private *cs35l41 =
 			snd_soc_component_get_drvdata(codec_dai->component);
-	unsigned int asp_fmt, lrclk_fmt, sclk_fmt, clock_provider;
+	unsigned int daifmt = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
 	case SND_SOC_DAIFMT_CBP_CFP:
-		clock_provider = 1;
+		daifmt |= CS35L41_SCLK_MSTR_MASK | CS35L41_LRCLK_MSTR_MASK;
 		break;
 	case SND_SOC_DAIFMT_CBC_CFC:
-		clock_provider = 0;
 		break;
 	default:
 		dev_warn(cs35l41->dev,
@@ -754,19 +758,11 @@ static int cs35l41_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	regmap_update_bits(cs35l41->regmap, CS35L41_SP_FORMAT,
-				CS35L41_SCLK_MSTR_MASK,
-				clock_provider << CS35L41_SCLK_MSTR_SHIFT);
-	regmap_update_bits(cs35l41->regmap, CS35L41_SP_FORMAT,
-				CS35L41_LRCLK_MSTR_MASK,
-				clock_provider << CS35L41_LRCLK_MSTR_SHIFT);
-
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_DSP_A:
-		asp_fmt = 0;
 		break;
 	case SND_SOC_DAIFMT_I2S:
-		asp_fmt = 2;
+		daifmt |= 2 << CS35L41_ASP_FMT_SHIFT;
 		break;
 	default:
 		dev_warn(cs35l41->dev,
@@ -774,26 +770,17 @@ static int cs35l41_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	regmap_update_bits(cs35l41->regmap, CS35L41_SP_FORMAT,
-					CS35L41_ASP_FMT_MASK,
-					asp_fmt << CS35L41_ASP_FMT_SHIFT);
-
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
 	case SND_SOC_DAIFMT_NB_IF:
-		lrclk_fmt = 1;
-		sclk_fmt = 0;
+		daifmt |= CS35L41_LRCLK_INV_MASK;
 		break;
 	case SND_SOC_DAIFMT_IB_NF:
-		lrclk_fmt = 0;
-		sclk_fmt = 1;
+		daifmt |= CS35L41_SCLK_INV_MASK;
 		break;
 	case SND_SOC_DAIFMT_IB_IF:
-		lrclk_fmt = 1;
-		sclk_fmt = 1;
+		daifmt |= CS35L41_LRCLK_INV_MASK | CS35L41_SCLK_INV_MASK;
 		break;
 	case SND_SOC_DAIFMT_NB_NF:
-		lrclk_fmt = 0;
-		sclk_fmt = 0;
 		break;
 	default:
 		dev_warn(cs35l41->dev,
@@ -801,14 +788,10 @@ static int cs35l41_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	regmap_update_bits(cs35l41->regmap, CS35L41_SP_FORMAT,
-				CS35L41_LRCLK_INV_MASK,
-				lrclk_fmt << CS35L41_LRCLK_INV_SHIFT);
-	regmap_update_bits(cs35l41->regmap, CS35L41_SP_FORMAT,
-				CS35L41_SCLK_INV_MASK,
-				sclk_fmt << CS35L41_SCLK_INV_SHIFT);
-
-	return 0;
+	return regmap_update_bits(cs35l41->regmap, CS35L41_SP_FORMAT,
+				  CS35L41_SCLK_MSTR_MASK | CS35L41_LRCLK_MSTR_MASK |
+				  CS35L41_ASP_FMT_MASK | CS35L41_LRCLK_INV_MASK |
+				  CS35L41_SCLK_INV_MASK, daifmt);
 }
 
 struct cs35l41_global_fs_config {
@@ -1041,37 +1024,23 @@ static int cs35l41_boost_config(struct cs35l41_private *cs35l41,
 	}
 
 	ret = regmap_update_bits(regmap, CS35L41_BSTCVRT_COEFF,
-			CS35L41_BST_K1_MASK,
-			cs35l41_bst_k1_table[bst_lbst_val][bst_cbst_range]
-				<< CS35L41_BST_K1_SHIFT);
-	if (ret) {
-		dev_err(dev, "Failed to write boost K1 coefficient\n");
-		return ret;
-	}
-
-	ret = regmap_update_bits(regmap, CS35L41_BSTCVRT_COEFF,
-			CS35L41_BST_K2_MASK,
-			cs35l41_bst_k2_table[bst_lbst_val][bst_cbst_range]
-				<< CS35L41_BST_K2_SHIFT);
-	if (ret) {
-		dev_err(dev, "Failed to write boost K2 coefficient\n");
-		return ret;
-	}
-
-	ret = regmap_update_bits(regmap, CS35L41_BSTCVRT_SLOPE_LBST,
-			CS35L41_BST_SLOPE_MASK,
-			cs35l41_bst_slope_table[bst_lbst_val]
-				<< CS35L41_BST_SLOPE_SHIFT);
+				 CS35L41_BST_K1_MASK | CS35L41_BST_K2_MASK,
+				 cs35l41_bst_k1_table[bst_lbst_val][bst_cbst_range]
+					<< CS35L41_BST_K1_SHIFT |
+				 cs35l41_bst_k2_table[bst_lbst_val][bst_cbst_range]
+					<< CS35L41_BST_K2_SHIFT);
 	if (ret) {
-		dev_err(dev, "Failed to write boost slope coefficient\n");
+		dev_err(dev, "Failed to write boost coefficients: %d\n", ret);
 		return ret;
 	}
 
 	ret = regmap_update_bits(regmap, CS35L41_BSTCVRT_SLOPE_LBST,
-			CS35L41_BST_LBST_VAL_MASK,
-			bst_lbst_val << CS35L41_BST_LBST_VAL_SHIFT);
+				 CS35L41_BST_SLOPE_MASK | CS35L41_BST_LBST_VAL_MASK,
+				 cs35l41_bst_slope_table[bst_lbst_val]
+					<< CS35L41_BST_SLOPE_SHIFT |
+				 bst_lbst_val << CS35L41_BST_LBST_VAL_SHIFT);
 	if (ret) {
-		dev_err(dev, "Failed to write boost inductor value\n");
+		dev_err(dev, "Failed to write boost slope/inductor value: %d\n", ret);
 		return ret;
 	}
 
@@ -1129,39 +1098,20 @@ static int cs35l41_irq_gpio_config(struct cs35l41_private *cs35l41)
 	struct cs35l41_irq_cfg *irq_gpio_cfg2 = &cs35l41->pdata.irq_config2;
 	int irq_pol = IRQF_TRIGGER_NONE;
 
-	if (irq_gpio_cfg1->irq_pol_inv)
-		regmap_update_bits(cs35l41->regmap,
-					CS35L41_GPIO1_CTRL1,
-					CS35L41_GPIO_POL_MASK,
-					CS35L41_GPIO_POL_MASK);
-	if (irq_gpio_cfg1->irq_out_en)
-		regmap_update_bits(cs35l41->regmap,
-					CS35L41_GPIO1_CTRL1,
-					CS35L41_GPIO_DIR_MASK,
-					0);
-	if (irq_gpio_cfg1->irq_src_sel)
-		regmap_update_bits(cs35l41->regmap,
-					CS35L41_GPIO_PAD_CONTROL,
-					CS35L41_GPIO1_CTRL_MASK,
-					irq_gpio_cfg1->irq_src_sel <<
-					CS35L41_GPIO1_CTRL_SHIFT);
-
-	if (irq_gpio_cfg2->irq_pol_inv)
-		regmap_update_bits(cs35l41->regmap,
-					CS35L41_GPIO2_CTRL1,
-					CS35L41_GPIO_POL_MASK,
-					CS35L41_GPIO_POL_MASK);
-	if (irq_gpio_cfg2->irq_out_en)
-		regmap_update_bits(cs35l41->regmap,
-					CS35L41_GPIO2_CTRL1,
-					CS35L41_GPIO_DIR_MASK,
-					0);
-	if (irq_gpio_cfg2->irq_src_sel)
-		regmap_update_bits(cs35l41->regmap,
-					CS35L41_GPIO_PAD_CONTROL,
-					CS35L41_GPIO2_CTRL_MASK,
-					irq_gpio_cfg2->irq_src_sel <<
-					CS35L41_GPIO2_CTRL_SHIFT);
+	regmap_update_bits(cs35l41->regmap, CS35L41_GPIO1_CTRL1,
+			   CS35L41_GPIO_POL_MASK | CS35L41_GPIO_DIR_MASK,
+			   irq_gpio_cfg1->irq_pol_inv << CS35L41_GPIO_POL_SHIFT |
+			   !irq_gpio_cfg1->irq_out_en << CS35L41_GPIO_DIR_SHIFT);
+
+	regmap_update_bits(cs35l41->regmap, CS35L41_GPIO2_CTRL1,
+			   CS35L41_GPIO_POL_MASK | CS35L41_GPIO_DIR_MASK,
+			   irq_gpio_cfg1->irq_pol_inv << CS35L41_GPIO_POL_SHIFT |
+			   !irq_gpio_cfg1->irq_out_en << CS35L41_GPIO_DIR_SHIFT);
+
+	regmap_update_bits(cs35l41->regmap, CS35L41_GPIO_PAD_CONTROL,
+			   CS35L41_GPIO1_CTRL_MASK | CS35L41_GPIO2_CTRL_MASK,
+			   irq_gpio_cfg1->irq_src_sel << CS35L41_GPIO1_CTRL_SHIFT |
+			   irq_gpio_cfg2->irq_src_sel << CS35L41_GPIO2_CTRL_SHIFT);
 
 	if ((irq_gpio_cfg2->irq_src_sel ==
 			(CS35L41_GPIO_CTRL_ACTV_LO | CS35L41_VALID_PDATA)) ||
diff --git a/sound/soc/codecs/cs35l41.h b/sound/soc/codecs/cs35l41.h
index 7a25430182f84..ec1b00b47d5dd 100644
--- a/sound/soc/codecs/cs35l41.h
+++ b/sound/soc/codecs/cs35l41.h
@@ -697,6 +697,7 @@
 #define CS35L41_INT1_UNMASK_PDN		0xFF7FFFFF
 
 #define CS35L41_GPIO_DIR_MASK		0x80000000
+#define CS35L41_GPIO_DIR_SHIFT		31
 #define CS35L41_GPIO1_CTRL_MASK		0x00030000
 #define CS35L41_GPIO1_CTRL_SHIFT	16
 #define CS35L41_GPIO2_CTRL_MASK		0x07000000
-- 
2.11.0

