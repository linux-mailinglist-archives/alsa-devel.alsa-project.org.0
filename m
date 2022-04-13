Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5775F4FF21F
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Apr 2022 10:39:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00E9917AD;
	Wed, 13 Apr 2022 10:38:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00E9917AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649839164;
	bh=BeKjD2IoMW6q391kIbHtxJyLxNScj4ZhEcCQQ6E3RvU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lia5OGPT25JP0Ez0Tsw37IBgnyX7MrVreoIXASZw8OjLEWCzEvDcjX27whVIRLtv6
	 DVAKqrMnAdQUmGb01M65LccleGmVEE1wuRNCdMLSQUPbBalcz6KHy2KHeYAjsfwKgS
	 oZ2Y3TyyddQ66E+H6z/LISGNKHrUIgXZkXpf9OBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E468F80529;
	Wed, 13 Apr 2022 10:37:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B079F8050F; Wed, 13 Apr 2022 10:37:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04E5AF80302
 for <alsa-devel@alsa-project.org>; Wed, 13 Apr 2022 10:37:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04E5AF80302
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ntb0mRvS"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23D8Z6Rh011523;
 Wed, 13 Apr 2022 03:37:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=srXmiV9b9qZTnjWLLNAMJEcSQ0ntJsDx33IV0IcR+cY=;
 b=ntb0mRvS1xN1iTU0mkTBaz4C2oEZ7a53rhYlrRKtrDFHtqe0BbThrjlnaI98FND9RRq9
 cuHEEhoQ5G+1UhO+CWXpzpDS2gYyFhuCD8f/mtK/D/5qm5SapDnVvq1ziaEJsEpehmGH
 wYBDReAHczmG6uGqVj8VbTgN19WcQ/5F5SsySXSkPP5I6DhBuOowijTB+E1zIPPtyJcH
 dHwrERvbRvSkU9G7F4w9/UvyRDtYPrFJJvBs9bTejQ4TQxiXmfdIkHgpTMmZnc8cevKV
 dF2Tr6oDy9rdXay9SsKK0X1c231FtuNDnTNKhhsyU5XB8q2/v4l2hcHkm9Umo3dM/3Vz cg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fb6pycvcv-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 13 Apr 2022 03:37:33 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 13 Apr
 2022 09:37:30 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 13 Apr 2022 09:37:30 +0100
Received: from aryzen.ad.cirrus.com (unknown [198.61.64.152])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6E023475;
 Wed, 13 Apr 2022 08:37:30 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v7 03/16] ALSA: cs35l41: Move cs35l41_gpio_config to shared lib
Date: Wed, 13 Apr 2022 09:37:15 +0100
Message-ID: <20220413083728.10730-4-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220413083728.10730-1-tanureal@opensource.cirrus.com>
References: <20220413083728.10730-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 1yNcbAW7PvUPf5I0FELRW0b5xYyGovpU
X-Proofpoint-GUID: 1yNcbAW7PvUPf5I0FELRW0b5xYyGovpU
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

ASoC and HDA can use a single function to configure the chip gpios.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/cs35l41.h        |  1 +
 sound/pci/hda/cs35l41_hda.c    | 11 ++++-----
 sound/soc/codecs/cs35l41-lib.c | 41 +++++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l41.c     | 44 +---------------------------------
 4 files changed, 48 insertions(+), 49 deletions(-)

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index 4200379e0c26..e312eb1f6e48 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -798,5 +798,6 @@ int cs35l41_set_channels(struct device *dev, struct regmap *reg,
 			 unsigned int rx_num, unsigned int *rx_slot);
 int cs35l41_boost_config(struct device *dev, struct regmap *regmap, int boost_ind, int boost_cap,
 			 int boost_ipk);
+int cs35l41_gpio_config(struct regmap *regmap, struct cs35l41_hw_cfg *hw_cfg);
 
 #endif /* __CS35L41_H */
diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index a14ad3b0d516..e00ceaca79c0 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -235,12 +235,11 @@ static int cs35l41_hda_apply_properties(struct cs35l41_hda *cs35l41)
 		case CS35L41_NOT_USED:
 			break;
 		case CS35l41_VSPK_SWITCH:
-			regmap_update_bits(cs35l41->regmap, CS35L41_GPIO_PAD_CONTROL,
-					   CS35L41_GPIO1_CTRL_MASK, 1 << CS35L41_GPIO1_CTRL_SHIFT);
+			hw_cfg->gpio1.func = CS35L41_GPIO1_GPIO;
+			hw_cfg->gpio1.out_en = true;
 			break;
 		case CS35l41_SYNC:
-			regmap_update_bits(cs35l41->regmap, CS35L41_GPIO_PAD_CONTROL,
-					   CS35L41_GPIO1_CTRL_MASK, 2 << CS35L41_GPIO1_CTRL_SHIFT);
+			hw_cfg->gpio1.func = CS35L41_GPIO1_MDSYNC;
 			break;
 		default:
 			dev_err(cs35l41->dev, "Invalid function %d for GPIO1\n",
@@ -254,8 +253,6 @@ static int cs35l41_hda_apply_properties(struct cs35l41_hda *cs35l41)
 		case CS35L41_NOT_USED:
 			break;
 		case CS35L41_INTERRUPT:
-			regmap_update_bits(cs35l41->regmap, CS35L41_GPIO_PAD_CONTROL,
-					   CS35L41_GPIO2_CTRL_MASK, 2 << CS35L41_GPIO2_CTRL_SHIFT);
 			break;
 		default:
 			dev_err(cs35l41->dev, "Invalid GPIO2 function %d\n", hw_cfg->gpio2.func);
@@ -263,6 +260,8 @@ static int cs35l41_hda_apply_properties(struct cs35l41_hda *cs35l41)
 		}
 	}
 
+	cs35l41_gpio_config(cs35l41->regmap, hw_cfg);
+
 	if (internal_boost) {
 		cs35l41->reg_seq = &cs35l41_hda_reg_seq_int_bst;
 		ret = cs35l41_boost_config(cs35l41->dev, cs35l41->regmap,
diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index 905c648a8f49..eeeaeaa0db82 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -1040,6 +1040,47 @@ int cs35l41_boost_config(struct device *dev, struct regmap *regmap, int boost_in
 }
 EXPORT_SYMBOL_GPL(cs35l41_boost_config);
 
+int cs35l41_gpio_config(struct regmap *regmap, struct cs35l41_hw_cfg *hw_cfg)
+{
+	struct cs35l41_gpio_cfg *gpio1 = &hw_cfg->gpio1;
+	struct cs35l41_gpio_cfg *gpio2 = &hw_cfg->gpio2;
+	int irq_pol = IRQF_TRIGGER_NONE;
+
+	regmap_update_bits(regmap, CS35L41_GPIO1_CTRL1,
+			   CS35L41_GPIO_POL_MASK | CS35L41_GPIO_DIR_MASK,
+			   gpio1->pol_inv << CS35L41_GPIO_POL_SHIFT |
+			   !gpio1->out_en << CS35L41_GPIO_DIR_SHIFT);
+
+	regmap_update_bits(regmap, CS35L41_GPIO2_CTRL1,
+			   CS35L41_GPIO_POL_MASK | CS35L41_GPIO_DIR_MASK,
+			   gpio2->pol_inv << CS35L41_GPIO_POL_SHIFT |
+			   !gpio2->out_en << CS35L41_GPIO_DIR_SHIFT);
+
+	if (gpio1->valid)
+		regmap_update_bits(regmap, CS35L41_GPIO_PAD_CONTROL, CS35L41_GPIO1_CTRL_MASK,
+				   gpio1->func << CS35L41_GPIO1_CTRL_SHIFT);
+
+	if (gpio2->valid) {
+		regmap_update_bits(regmap, CS35L41_GPIO_PAD_CONTROL, CS35L41_GPIO2_CTRL_MASK,
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
+
+	return irq_pol;
+}
+EXPORT_SYMBOL_GPL(cs35l41_gpio_config);
+
 MODULE_DESCRIPTION("CS35L41 library");
 MODULE_AUTHOR("David Rhodes, Cirrus Logic Inc, <david.rhodes@cirrus.com>");
 MODULE_AUTHOR("Lucas Tanure, Cirrus Logic Inc, <tanureal@opensource.cirrus.com>");
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 90dec80707ea..d25689fe0c60 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1017,48 +1017,6 @@ static int cs35l41_set_pdata(struct cs35l41_private *cs35l41)
 	return 0;
 }
 
-static int cs35l41_gpio_config(struct cs35l41_private *cs35l41)
-{
-	struct cs35l41_gpio_cfg *gpio1 = &cs35l41->hw_cfg.gpio1;
-	struct cs35l41_gpio_cfg *gpio2 = &cs35l41->hw_cfg.gpio2;
-	int irq_pol = IRQF_TRIGGER_NONE;
-
-	regmap_update_bits(cs35l41->regmap, CS35L41_GPIO1_CTRL1,
-			   CS35L41_GPIO_POL_MASK | CS35L41_GPIO_DIR_MASK,
-			   gpio1->pol_inv << CS35L41_GPIO_POL_SHIFT |
-			   !gpio1->out_en << CS35L41_GPIO_DIR_SHIFT);
-
-	regmap_update_bits(cs35l41->regmap, CS35L41_GPIO2_CTRL1,
-			   CS35L41_GPIO_POL_MASK | CS35L41_GPIO_DIR_MASK,
-			   gpio2->pol_inv << CS35L41_GPIO_POL_SHIFT |
-			   !gpio2->out_en << CS35L41_GPIO_DIR_SHIFT);
-
-	if (gpio1->valid)
-		regmap_update_bits(cs35l41->regmap, CS35L41_GPIO_PAD_CONTROL,
-				   CS35L41_GPIO1_CTRL_MASK,
-				   gpio1->func << CS35L41_GPIO1_CTRL_SHIFT);
-
-	if (gpio2->valid) {
-		regmap_update_bits(cs35l41->regmap, CS35L41_GPIO_PAD_CONTROL,
-				   CS35L41_GPIO2_CTRL_MASK,
-				   gpio2->func << CS35L41_GPIO2_CTRL_SHIFT);
-
-		switch (gpio2->func) {
-		case CS35L41_GPIO2_INT_PUSH_PULL_LOW:
-		case CS35L41_GPIO2_INT_OPEN_DRAIN:
-			irq_pol = IRQF_TRIGGER_LOW;
-			break;
-		case CS35L41_GPIO2_INT_PUSH_PULL_HIGH:
-			irq_pol = IRQF_TRIGGER_HIGH;
-			break;
-		default:
-			break;
-		}
-	}
-
-	return irq_pol;
-}
-
 static int cs35l41_component_probe(struct snd_soc_component *component)
 {
 	struct cs35l41_private *cs35l41 = snd_soc_component_get_drvdata(component);
@@ -1366,7 +1324,7 @@ int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *
 
 	cs35l41_test_key_lock(cs35l41->dev, cs35l41->regmap);
 
-	irq_pol = cs35l41_gpio_config(cs35l41);
+	irq_pol = cs35l41_gpio_config(cs35l41->regmap, &cs35l41->hw_cfg);
 
 	/* Set interrupt masks for critical errors */
 	regmap_write(cs35l41->regmap, CS35L41_IRQ1_MASK1,
-- 
2.35.2

