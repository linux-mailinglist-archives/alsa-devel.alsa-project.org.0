Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F5F4E42D5
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 16:21:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C17A16BB;
	Tue, 22 Mar 2022 16:20:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C17A16BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647962500;
	bh=EVNChppCpcT3CJC4mZGzb7R1RLo5LDKsscNpQPhPMYM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EzM0yqha/iZJ2Iu0sJAvhvFBuLCpVTb+EI1Gzrs+yLDpLWt9xM3J8G+woBwUZQ1at
	 tAYnNyI4booXqepkkO1qPzhN433gTjq6+W9VFiXWCjUFOMlftSLC0gCGorlonjPv/8
	 MGSFPW5aea9lnUlVr7DySMSZnFhYrv5qbHFl1buI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84498F80525;
	Tue, 22 Mar 2022 16:19:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EBD9F80533; Tue, 22 Mar 2022 16:18:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16D68F8047D
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 16:18:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16D68F8047D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="OcQfsmR2"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22MCnUf8013136;
 Tue, 22 Mar 2022 10:18:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=hYWJtZQGfPacQLp8QDCAqSZPipffLbhKEWbotjqieuc=;
 b=OcQfsmR2/I5gSm+eieVDJRKnMa5tR/ly/KidDFgyxZhv6+3ke7Tu2mcECgZFAwziiRwE
 QsWdU7vZxOjEZZ1rBakp/V1TaXnSCY2Aou+CvBGQq0z7c+TKYt5YQPFP4Paee8nDor89
 wj2f1qtD5z08E8K4dvrjzjtQJOboxMjfdGzEXrn4CZNgcUKG2sSHisyiZwEHKYr6RD6I
 TJi20043AF/TSEs+me/iwErpdPUbpJw4FrbP58ExKcTJHWGUFunKSGd+DFkYEIHFIK1T
 v5j3SN+MytRbLry9aS128AJk2oWbIQ/QQBGEC+kfS1SfMX2pqP+O3WIyGc7CMFq9SZJi Jw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ewbknc0jc-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 22 Mar 2022 10:18:35 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 22 Mar
 2022 15:18:31 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Tue, 22 Mar 2022 15:18:31 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.125])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6B11DB1A;
 Tue, 22 Mar 2022 15:18:31 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v5 02/16] ALSA: cs35l41: Check hw_config before using it
Date: Tue, 22 Mar 2022 15:18:05 +0000
Message-ID: <20220322151819.4299-3-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220322151819.4299-1-tanureal@opensource.cirrus.com>
References: <20220322151819.4299-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Sgjk6g7whtwPvQh55WGDmaLtOfJInzeN
X-Proofpoint-GUID: Sgjk6g7whtwPvQh55WGDmaLtOfJInzeN
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
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

The driver can receive an empty hw_config, so mark as valid if
successfully read from device tree/ACPI or set by the driver itself.
Platforms not marked with a valid hw config will not be supported.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/cs35l41.h        |  3 +-
 sound/pci/hda/cs35l41_hda.c    | 70 +++++++++++++++++++------------
 sound/soc/codecs/cs35l41-lib.c | 16 ++++---
 sound/soc/codecs/cs35l41.c     | 76 +++++++++++++++++++++-------------
 4 files changed, 104 insertions(+), 61 deletions(-)

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index abcf850f7110..4200379e0c26 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -538,7 +538,6 @@
 #define CS35L41_OTP_SIZE_WORDS		32
 #define CS35L41_NUM_OTP_ELEM		100
 
-#define CS35L41_VALID_PDATA		0x80000000
 #define CS35L41_NUM_SUPPLIES            2
 
 #define CS35L41_SCLK_MSTR_MASK		0x10
@@ -753,12 +752,14 @@ enum cs35l41_gpio2_func {
 };
 
 struct cs35l41_gpio_cfg {
+	bool valid;
 	bool pol_inv;
 	bool out_en;
 	unsigned int func;
 };
 
 struct cs35l41_hw_cfg {
+	bool valid;
 	int bst_ind;
 	int bst_ipk;
 	int bst_cap;
diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index b79d6ad4b4f5..a14ad3b0d516 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -219,46 +219,52 @@ static int cs35l41_hda_apply_properties(struct cs35l41_hda *cs35l41)
 	bool internal_boost = false;
 	int ret;
 
+	if (!cs35l41->hw_cfg.valid)
+		return -EINVAL;
+
 	if (hw_cfg->vspk_always_on) {
 		cs35l41->reg_seq = &cs35l41_hda_reg_seq_no_bst;
 		return 0;
 	}
 
-	if (hw_cfg->bst_ind || hw_cfg->bst_cap || hw_cfg->bst_ipk)
+	if (hw_cfg->bst_ind > 0 || hw_cfg->bst_cap > 0 || hw_cfg->bst_ipk > 0)
 		internal_boost = true;
 
-	switch (hw_cfg->gpio1.func) {
-	case CS35L41_NOT_USED:
-		break;
-	case CS35l41_VSPK_SWITCH:
-		regmap_update_bits(cs35l41->regmap, CS35L41_GPIO_PAD_CONTROL,
-				   CS35L41_GPIO1_CTRL_MASK, 1 << CS35L41_GPIO1_CTRL_SHIFT);
-		break;
-	case CS35l41_SYNC:
-		regmap_update_bits(cs35l41->regmap, CS35L41_GPIO_PAD_CONTROL,
-				   CS35L41_GPIO1_CTRL_MASK, 2 << CS35L41_GPIO1_CTRL_SHIFT);
-		break;
-	default:
-		dev_err(cs35l41->dev, "Invalid function %d for GPIO1\n", hw_cfg->gpio1.func);
-		return -EINVAL;
+	if (hw_cfg->gpio1.valid) {
+		switch (hw_cfg->gpio1.func) {
+		case CS35L41_NOT_USED:
+			break;
+		case CS35l41_VSPK_SWITCH:
+			regmap_update_bits(cs35l41->regmap, CS35L41_GPIO_PAD_CONTROL,
+					   CS35L41_GPIO1_CTRL_MASK, 1 << CS35L41_GPIO1_CTRL_SHIFT);
+			break;
+		case CS35l41_SYNC:
+			regmap_update_bits(cs35l41->regmap, CS35L41_GPIO_PAD_CONTROL,
+					   CS35L41_GPIO1_CTRL_MASK, 2 << CS35L41_GPIO1_CTRL_SHIFT);
+			break;
+		default:
+			dev_err(cs35l41->dev, "Invalid function %d for GPIO1\n",
+				hw_cfg->gpio1.func);
+			return -EINVAL;
+		}
 	}
 
-	switch (hw_cfg->gpio2.func) {
-	case CS35L41_NOT_USED:
-		break;
-	case CS35L41_INTERRUPT:
-		regmap_update_bits(cs35l41->regmap, CS35L41_GPIO_PAD_CONTROL,
-				   CS35L41_GPIO2_CTRL_MASK, 2 << CS35L41_GPIO2_CTRL_SHIFT);
-		break;
-	default:
-		dev_err(cs35l41->dev, "Invalid function %d for GPIO2\n", hw_cfg->gpio2.func);
-		return -EINVAL;
+	if (hw_cfg->gpio2.valid) {
+		switch (hw_cfg->gpio2.func) {
+		case CS35L41_NOT_USED:
+			break;
+		case CS35L41_INTERRUPT:
+			regmap_update_bits(cs35l41->regmap, CS35L41_GPIO_PAD_CONTROL,
+					   CS35L41_GPIO2_CTRL_MASK, 2 << CS35L41_GPIO2_CTRL_SHIFT);
+			break;
+		default:
+			dev_err(cs35l41->dev, "Invalid GPIO2 function %d\n", hw_cfg->gpio2.func);
+			return -EINVAL;
+		}
 	}
 
 	if (internal_boost) {
 		cs35l41->reg_seq = &cs35l41_hda_reg_seq_int_bst;
-		if (!(hw_cfg->bst_ind && hw_cfg->bst_cap && hw_cfg->bst_ipk))
-			return -EINVAL;
 		ret = cs35l41_boost_config(cs35l41->dev, cs35l41->regmap,
 					   hw_cfg->bst_ind, hw_cfg->bst_cap, hw_cfg->bst_ipk);
 		if (ret)
@@ -334,28 +340,37 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
 	if (ret)
 		goto err;
 	hw_cfg->gpio1.func = values[cs35l41->index];
+	hw_cfg->gpio1.valid = true;
 
 	property = "cirrus,gpio2-func";
 	ret = device_property_read_u32_array(physdev, property, values, nval);
 	if (ret)
 		goto err;
 	hw_cfg->gpio2.func = values[cs35l41->index];
+	hw_cfg->gpio2.valid = true;
 
 	property = "cirrus,boost-peak-milliamp";
 	ret = device_property_read_u32_array(physdev, property, values, nval);
 	if (ret == 0)
 		hw_cfg->bst_ipk = values[cs35l41->index];
+	else
+		hw_cfg->bst_ipk = -1;
 
 	property = "cirrus,boost-ind-nanohenry";
 	ret = device_property_read_u32_array(physdev, property, values, nval);
 	if (ret == 0)
 		hw_cfg->bst_ind = values[cs35l41->index];
+	else
+		hw_cfg->bst_ind = -1;
 
 	property = "cirrus,boost-cap-microfarad";
 	ret = device_property_read_u32_array(physdev, property, values, nval);
 	if (ret == 0)
 		hw_cfg->bst_cap = values[cs35l41->index];
+	else
+		hw_cfg->bst_cap = -1;
 
+	hw_cfg->valid = true;
 	put_device(physdev);
 
 	return 0;
@@ -381,6 +396,7 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
 	cs35l41->index = id == 0x40 ? 0 : 1;
 	cs35l41->reset_gpio = gpiod_get_index(physdev, NULL, 0, GPIOD_OUT_HIGH);
 	cs35l41->hw_cfg.vspk_always_on = true;
+	cs35l41->hw_cfg.valid = true;
 	put_device(physdev);
 
 	return 0;
diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index e5a56bcbb223..905c648a8f49 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -992,10 +992,20 @@ int cs35l41_boost_config(struct device *dev, struct regmap *regmap, int boost_in
 	case 101 ... 200:
 		bst_cbst_range = 3;
 		break;
-	default:	/* 201 uF and greater */
+	default:
+		if (boost_cap < 0) {
+			dev_err(dev, "Invalid boost capacitor value: %d nH\n", boost_cap);
+			return -EINVAL;
+		}
+		/* 201 uF and greater */
 		bst_cbst_range = 4;
 	}
 
+	if (boost_ipk < 1600 || boost_ipk > 4500) {
+		dev_err(dev, "Invalid boost inductor peak current: %d mA\n", boost_ipk);
+		return -EINVAL;
+	}
+
 	ret = regmap_update_bits(regmap, CS35L41_BSTCVRT_COEFF,
 				 CS35L41_BST_K1_MASK | CS35L41_BST_K2_MASK,
 				 cs35l41_bst_k1_table[bst_lbst_val][bst_cbst_range]
@@ -1017,10 +1027,6 @@ int cs35l41_boost_config(struct device *dev, struct regmap *regmap, int boost_in
 		return ret;
 	}
 
-	if (boost_ipk < 1600 || boost_ipk > 4500) {
-		dev_err(dev, "Invalid boost inductor peak current: %d mA\n", boost_ipk);
-		return -EINVAL;
-	}
 	bst_ipk_scaled = ((boost_ipk - 1600) / 50) + 0x10;
 
 	ret = regmap_update_bits(regmap, CS35L41_BSTCVRT_PEAK_CUR, CS35L41_BST_IPK_MASK,
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index e76b93c15106..90dec80707ea 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -995,28 +995,24 @@ static int cs35l41_dai_set_sysclk(struct snd_soc_dai *dai,
 
 static int cs35l41_set_pdata(struct cs35l41_private *cs35l41)
 {
+	struct cs35l41_hw_cfg *hw_cfg = &cs35l41->hw_cfg;
 	int ret;
 
-	/* Set Platform Data */
-	/* Required */
-	if (cs35l41->hw_cfg.bst_ipk &&
-	    cs35l41->hw_cfg.bst_ind && cs35l41->hw_cfg.bst_cap) {
-		ret = cs35l41_boost_config(cs35l41->dev, cs35l41->regmap, cs35l41->hw_cfg.bst_ind,
-					   cs35l41->hw_cfg.bst_cap, cs35l41->hw_cfg.bst_ipk);
-		if (ret) {
-			dev_err(cs35l41->dev, "Error in Boost DT config: %d\n", ret);
-			return ret;
-		}
-	} else {
-		dev_err(cs35l41->dev, "Incomplete Boost component DT config\n");
+	if (!hw_cfg->valid)
 		return -EINVAL;
+
+	/* Required */
+	ret = cs35l41_boost_config(cs35l41->dev, cs35l41->regmap,
+				   hw_cfg->bst_ind, hw_cfg->bst_cap, hw_cfg->bst_ipk);
+	if (ret) {
+		dev_err(cs35l41->dev, "Error in Boost DT config: %d\n", ret);
+		return ret;
 	}
 
 	/* Optional */
-	if (cs35l41->hw_cfg.dout_hiz <= CS35L41_ASP_DOUT_HIZ_MASK &&
-	    cs35l41->hw_cfg.dout_hiz >= 0)
+	if (hw_cfg->dout_hiz <= CS35L41_ASP_DOUT_HIZ_MASK && hw_cfg->dout_hiz >= 0)
 		regmap_update_bits(cs35l41->regmap, CS35L41_SP_HIZ_CTRL, CS35L41_ASP_DOUT_HIZ_MASK,
-				   cs35l41->hw_cfg.dout_hiz);
+				   hw_cfg->dout_hiz);
 
 	return 0;
 }
@@ -1037,16 +1033,28 @@ static int cs35l41_gpio_config(struct cs35l41_private *cs35l41)
 			   gpio2->pol_inv << CS35L41_GPIO_POL_SHIFT |
 			   !gpio2->out_en << CS35L41_GPIO_DIR_SHIFT);
 
-	regmap_update_bits(cs35l41->regmap, CS35L41_GPIO_PAD_CONTROL,
-			   CS35L41_GPIO1_CTRL_MASK | CS35L41_GPIO2_CTRL_MASK,
-			   gpio1->func << CS35L41_GPIO1_CTRL_SHIFT |
-			   gpio2->func << CS35L41_GPIO2_CTRL_SHIFT);
+	if (gpio1->valid)
+		regmap_update_bits(cs35l41->regmap, CS35L41_GPIO_PAD_CONTROL,
+				   CS35L41_GPIO1_CTRL_MASK,
+				   gpio1->func << CS35L41_GPIO1_CTRL_SHIFT);
 
-	if ((gpio2->func == (CS35L41_GPIO2_INT_PUSH_PULL_LOW | CS35L41_VALID_PDATA)) ||
-		(gpio2->func == (CS35L41_GPIO2_INT_OPEN_DRAIN | CS35L41_VALID_PDATA)))
-		irq_pol = IRQF_TRIGGER_LOW;
-	else if (gpio2->func == (CS35L41_GPIO2_INT_PUSH_PULL_HIGH | CS35L41_VALID_PDATA))
-		irq_pol = IRQF_TRIGGER_HIGH;
+	if (gpio2->valid) {
+		regmap_update_bits(cs35l41->regmap, CS35L41_GPIO_PAD_CONTROL,
+				   CS35L41_GPIO2_CTRL_MASK,
+				   gpio2->func << CS35L41_GPIO2_CTRL_SHIFT);
+
+		switch (gpio2->func) {
+		case CS35L41_GPIO2_INT_PUSH_PULL_LOW:
+		case CS35L41_GPIO2_INT_OPEN_DRAIN:
+			irq_pol = IRQF_TRIGGER_LOW;
+			break;
+		case CS35L41_GPIO2_INT_PUSH_PULL_HIGH:
+			irq_pol = IRQF_TRIGGER_HIGH;
+			break;
+		default:
+			break;
+		}
+	}
 
 	return irq_pol;
 }
@@ -1121,14 +1129,20 @@ static int cs35l41_handle_pdata(struct device *dev, struct cs35l41_hw_cfg *hw_cf
 	ret = device_property_read_u32(dev, "cirrus,boost-peak-milliamp", &val);
 	if (ret >= 0)
 		hw_cfg->bst_ipk = val;
+	else
+		hw_cfg->bst_ipk = -1;
 
 	ret = device_property_read_u32(dev, "cirrus,boost-ind-nanohenry", &val);
 	if (ret >= 0)
 		hw_cfg->bst_ind = val;
+	else
+		hw_cfg->bst_ind = -1;
 
 	ret = device_property_read_u32(dev, "cirrus,boost-cap-microfarad", &val);
 	if (ret >= 0)
 		hw_cfg->bst_cap = val;
+	else
+		hw_cfg->bst_cap = -1;
 
 	ret = device_property_read_u32(dev, "cirrus,asp-sdout-hiz", &val);
 	if (ret >= 0)
@@ -1140,15 +1154,21 @@ static int cs35l41_handle_pdata(struct device *dev, struct cs35l41_hw_cfg *hw_cf
 	gpio1->pol_inv = device_property_read_bool(dev, "cirrus,gpio1-polarity-invert");
 	gpio1->out_en = device_property_read_bool(dev, "cirrus,gpio1-output-enable");
 	ret = device_property_read_u32(dev, "cirrus,gpio1-src-select", &val);
-	if (ret >= 0)
-		gpio1->func = val | CS35L41_VALID_PDATA;
+	if (ret >= 0) {
+		gpio1->func = val;
+		gpio1->valid = true;
+	}
 
 	/* GPIO2 Pin Config */
 	gpio2->pol_inv = device_property_read_bool(dev, "cirrus,gpio2-polarity-invert");
 	gpio2->out_en = device_property_read_bool(dev, "cirrus,gpio2-output-enable");
 	ret = device_property_read_u32(dev, "cirrus,gpio2-src-select", &val);
-	if (ret >= 0)
-		gpio2->func = val | CS35L41_VALID_PDATA;
+	if (ret >= 0) {
+		gpio2->func = val;
+		gpio2->valid = true;
+	}
+
+	hw_cfg->valid = true;
 
 	return 0;
 }
-- 
2.35.1

