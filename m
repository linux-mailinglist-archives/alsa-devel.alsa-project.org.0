Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 872266C1ECB
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 19:00:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C213822;
	Mon, 20 Mar 2023 18:59:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C213822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679335213;
	bh=Uh5IWnq5uDCPLRSwhZf8oGtrJ2hJW2eO8sjmPwB2OZ0=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=jSVV66lmID0XwW3CJC7HR2XD208qTRC4qAw1MDbzt7hxRp22SBpzFNu3Wx/PFGcWK
	 hefJwQx9uzkSnppsfzayj0nm2jkZEtktOmbdLgSU++fnynQXJAMGU9BE7UubXL42mF
	 tdIKgbn6tKN1MefhJZSH7HUBoNC8I3BIgBBCg6Lw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A38AF80578;
	Mon, 20 Mar 2023 18:58:23 +0100 (CET)
To: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring
	<robh+dt@kernel.org>
Subject: [PATCH v3 3/5] ASoC: cs35l45: IRQ support
Date: Wed, 15 Mar 2023 10:47:20 -0500
In-Reply-To: <20230315154722.3911463-1-vkarpovi@opensource.cirrus.com>
References: <20230315154722.3911463-1-vkarpovi@opensource.cirrus.com>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Mon, 20 Mar 2023 17:58:12 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AKQADNA5UIDYU3H2IZCXVSX2XIDFLIQL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167933510218.26.11092784685990338045@mailman-core.alsa-project.org>
From: Vlad Karpovich via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 "Vlad.Karpovich" <vkarpovi@opensource.cirrus.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D673BF8057A; Wed, 15 Mar 2023 16:47:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB0D7F8055A
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:47:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB0D7F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=gjQH7GAV
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32FFMGZY019344;
	Wed, 15 Mar 2023 10:47:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=csvs87dc434uo1vUVoH9qvqDe4aKjXaf+m4+FYjWIdk=;
 b=gjQH7GAVFimdRXNsMQrkBjE6pucnAC5+GRAau6QiNFImHi973CRiuGGtnfRY9nBR0QLf
 gpWYiy92KQysKLeo9pGcLTYkWJyEc//DuKJSlduUDnVviVrJy19wgjCHeK0a5VMY4F5u
 2CtERbk7dwM0gjjmMZSRqiRduHnsh+nqe7Mi8qwuZ1qB2HmrP7CQ2zXbbMFgU512y80I
 k+jyLWTQQHaJ5itVqDgA/QZplrpjHG8pd479tUZEV6FVraXQ+poyhowZNis9O3WNGsRT
 6qjuQfF7Hf/p0iDb3Mr/MqN7Tpyk9JLE/fAYOsdXYAGT9tfSzUv1VqfUXzaPoWyuFt40 uA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3pb7utgrqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Mar 2023 10:47:46 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Wed, 15 Mar
 2023 10:47:45 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 15 Mar 2023 10:47:45 -0500
Received: from vkarpovich-ThinkStation-P620.crystal.cirrus.com
 (vkarpovich-ThinkStation-P620.ad.cirrus.com [141.131.206.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 53E152A1;
	Wed, 15 Mar 2023 15:47:43 +0000 (UTC)
From: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring
	<robh+dt@kernel.org>
Subject: [PATCH v3 3/5] ASoC: cs35l45: IRQ support
Date: Wed, 15 Mar 2023 10:47:20 -0500
Message-ID: <20230315154722.3911463-3-vkarpovi@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230315154722.3911463-1-vkarpovi@opensource.cirrus.com>
References: <20230315154722.3911463-1-vkarpovi@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: XuVlV1bzATQpBrUz0eEtC45BVXiBAniD
X-Proofpoint-GUID: XuVlV1bzATQpBrUz0eEtC45BVXiBAniD
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=843822f42b=vkarpovi@opensource.cirrus.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AKQADNA5UIDYU3H2IZCXVSX2XIDFLIQL
X-Message-ID-Hash: AKQADNA5UIDYU3H2IZCXVSX2XIDFLIQL
X-Mailman-Approved-At: Mon, 20 Mar 2023 17:58:12 +0000
CC: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 "Vlad.Karpovich" <vkarpovi@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AKQADNA5UIDYU3H2IZCXVSX2XIDFLIQL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: "Vlad.Karpovich" <vkarpovi@opensource.cirrus.com>

Adds IRQ handlers

Signed-off-by: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l45-i2c.c    |   1 +
 sound/soc/codecs/cs35l45-spi.c    |   1 +
 sound/soc/codecs/cs35l45-tables.c |  29 +++++++-
 sound/soc/codecs/cs35l45.c        | 111 +++++++++++++++++++++++++++++-
 sound/soc/codecs/cs35l45.h        | 107 ++++++++++++++++++++++++++++
 5 files changed, 245 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs35l45-i2c.c b/sound/soc/codecs/cs35l45-i2c.c
index 39d28641429e..5224aaf584b8 100644
--- a/sound/soc/codecs/cs35l45-i2c.c
+++ b/sound/soc/codecs/cs35l45-i2c.c
@@ -32,6 +32,7 @@ static int cs35l45_i2c_probe(struct i2c_client *client)
 	}
 
 	cs35l45->dev = dev;
+	cs35l45->irq = client->irq;
 
 	return cs35l45_probe(cs35l45);
 }
diff --git a/sound/soc/codecs/cs35l45-spi.c b/sound/soc/codecs/cs35l45-spi.c
index baaf6e0f4fb9..b885ad3f3d4e 100644
--- a/sound/soc/codecs/cs35l45-spi.c
+++ b/sound/soc/codecs/cs35l45-spi.c
@@ -32,6 +32,7 @@ static int cs35l45_spi_probe(struct spi_device *spi)
 	}
 
 	cs35l45->dev = dev;
+	cs35l45->irq = spi->irq;
 
 	return cs35l45_probe(cs35l45);
 }
diff --git a/sound/soc/codecs/cs35l45-tables.c b/sound/soc/codecs/cs35l45-tables.c
index bca7e830821f..c39c1e6876a4 100644
--- a/sound/soc/codecs/cs35l45-tables.c
+++ b/sound/soc/codecs/cs35l45-tables.c
@@ -64,6 +64,25 @@ static const struct reg_default cs35l45_defaults[] = {
 	{ CS35L45_ASPTX4_INPUT,			0x00000028 },
 	{ CS35L45_ASPTX5_INPUT,			0x00000048 },
 	{ CS35L45_AMP_PCM_CONTROL,		0x00100000 },
+	{ CS35L45_IRQ1_CFG,			0x00000000 },
+	{ CS35L45_IRQ1_MASK_1,			0xBFEFFFBF },
+	{ CS35L45_IRQ1_MASK_2,			0xFFFFFFFF },
+	{ CS35L45_IRQ1_MASK_3,			0xFFFF87FF },
+	{ CS35L45_IRQ1_MASK_4,			0xF8FFFFFF },
+	{ CS35L45_IRQ1_MASK_5,			0x0EF80000 },
+	{ CS35L45_IRQ1_MASK_6,			0x00000000 },
+	{ CS35L45_IRQ1_MASK_7,			0xFFFFFF78 },
+	{ CS35L45_IRQ1_MASK_8,			0x00003FFF },
+	{ CS35L45_IRQ1_MASK_9,			0x00000000 },
+	{ CS35L45_IRQ1_MASK_10,			0x00000000 },
+	{ CS35L45_IRQ1_MASK_11,			0x00000000 },
+	{ CS35L45_IRQ1_MASK_12,			0x00000000 },
+	{ CS35L45_IRQ1_MASK_13,			0x00000000 },
+	{ CS35L45_IRQ1_MASK_14,			0x00000001 },
+	{ CS35L45_IRQ1_MASK_15,			0x00000000 },
+	{ CS35L45_IRQ1_MASK_16,			0x00000000 },
+	{ CS35L45_IRQ1_MASK_17,			0x00000000 },
+	{ CS35L45_IRQ1_MASK_18,			0x3FE5D0FF },
 	{ CS35L45_GPIO1_CTRL1,			0x81000001 },
 	{ CS35L45_GPIO2_CTRL1,			0x81000001 },
 	{ CS35L45_GPIO3_CTRL1,			0x81000001 },
@@ -100,7 +119,11 @@ static bool cs35l45_readable_reg(struct device *dev, unsigned int reg)
 	case CS35L45_ASPTX5_INPUT:
 	case CS35L45_AMP_PCM_CONTROL:
 	case CS35L45_AMP_PCM_HPF_TST:
-	case CS35L45_IRQ1_EINT_4:
+	case CS35L45_IRQ1_CFG:
+	case CS35L45_IRQ1_STATUS:
+	case CS35L45_IRQ1_EINT_1 ... CS35L45_IRQ1_EINT_18:
+	case CS35L45_IRQ1_STS_1 ... CS35L45_IRQ1_STS_18:
+	case CS35L45_IRQ1_MASK_1 ... CS35L45_IRQ1_MASK_18:
 	case CS35L45_GPIO_STATUS1:
 	case CS35L45_GPIO1_CTRL1:
 	case CS35L45_GPIO2_CTRL1:
@@ -119,7 +142,9 @@ static bool cs35l45_volatile_reg(struct device *dev, unsigned int reg)
 	case CS35L45_GLOBAL_ENABLES:
 	case CS35L45_ERROR_RELEASE:
 	case CS35L45_AMP_PCM_HPF_TST:	/* not cachable */
-	case CS35L45_IRQ1_EINT_4:
+	case CS35L45_IRQ1_STATUS:
+	case CS35L45_IRQ1_EINT_1 ... CS35L45_IRQ1_EINT_18:
+	case CS35L45_IRQ1_STS_1 ... CS35L45_IRQ1_STS_18:
 	case CS35L45_GPIO_STATUS1:
 		return true;
 	default:
diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index 901f3647fbda..0c3d01363c8d 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -586,10 +586,13 @@ static int cs35l45_apply_property_config(struct cs35l45_private *cs35l45)
 					   val << CS35L45_GPIO_CTRL_SHIFT);
 
 		ret = of_property_read_u32(child, "gpio-invert", &val);
-		if (!ret)
+		if (!ret) {
 			regmap_update_bits(cs35l45->regmap, pad_regs[i],
 					   CS35L45_GPIO_INVERT_MASK,
 					   val << CS35L45_GPIO_INVERT_SHIFT);
+			if (i == 1)
+				cs35l45->irq_invert = val;
+		}
 
 		of_node_put(child);
 	}
@@ -604,6 +607,78 @@ static int cs35l45_apply_property_config(struct cs35l45_private *cs35l45)
 	return 0;
 }
 
+static irqreturn_t cs35l45_pll_unlock(int irq, void *data)
+{
+	struct cs35l45_private *cs35l45 = data;
+
+	dev_dbg(cs35l45->dev, "PLL unlock detected!");
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t cs35l45_pll_lock(int irq, void *data)
+{
+	struct cs35l45_private *cs35l45 = data;
+
+	dev_dbg(cs35l45->dev, "PLL lock detected!");
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t cs35l45_spk_safe_err(int irq, void *data);
+
+static const struct cs35l45_irq cs35l45_irqs[] = {
+	CS35L45_IRQ(AMP_SHORT_ERR, "Amplifier short error", cs35l45_spk_safe_err),
+	CS35L45_IRQ(UVLO_VDDBATT_ERR, "VDDBATT undervoltage error", cs35l45_spk_safe_err),
+	CS35L45_IRQ(BST_SHORT_ERR, "Boost inductor error", cs35l45_spk_safe_err),
+	CS35L45_IRQ(BST_UVP_ERR, "Boost undervoltage error", cs35l45_spk_safe_err),
+	CS35L45_IRQ(TEMP_ERR, "Overtemperature error", cs35l45_spk_safe_err),
+	CS35L45_IRQ(AMP_CAL_ERR, "Amplifier calibration error", cs35l45_spk_safe_err),
+	CS35L45_IRQ(UVLO_VDDLV_ERR, "LV threshold detector error", cs35l45_spk_safe_err),
+	CS35L45_IRQ(GLOBAL_ERROR, "Global error", cs35l45_spk_safe_err),
+	CS35L45_IRQ(DSP_WDT_EXPIRE, "DSP Watchdog Timer", cs35l45_spk_safe_err),
+	CS35L45_IRQ(PLL_UNLOCK_FLAG_RISE, "PLL unlock", cs35l45_pll_unlock),
+	CS35L45_IRQ(PLL_LOCK_FLAG, "PLL lock", cs35l45_pll_lock),
+};
+
+static irqreturn_t cs35l45_spk_safe_err(int irq, void *data)
+{
+	struct cs35l45_private *cs35l45 = data;
+	int i;
+
+	i = irq - regmap_irq_get_virq(cs35l45->irq_data, 0);
+
+	dev_err(cs35l45->dev, "%s condition detected!\n", cs35l45_irqs[i].name);
+
+	return IRQ_HANDLED;
+}
+
+static const struct regmap_irq cs35l45_reg_irqs[] = {
+	CS35L45_REG_IRQ(IRQ1_EINT_1, AMP_SHORT_ERR),
+	CS35L45_REG_IRQ(IRQ1_EINT_1, UVLO_VDDBATT_ERR),
+	CS35L45_REG_IRQ(IRQ1_EINT_1, BST_SHORT_ERR),
+	CS35L45_REG_IRQ(IRQ1_EINT_1, BST_UVP_ERR),
+	CS35L45_REG_IRQ(IRQ1_EINT_1, TEMP_ERR),
+	CS35L45_REG_IRQ(IRQ1_EINT_3, AMP_CAL_ERR),
+	CS35L45_REG_IRQ(IRQ1_EINT_18, UVLO_VDDLV_ERR),
+	CS35L45_REG_IRQ(IRQ1_EINT_18, GLOBAL_ERROR),
+	CS35L45_REG_IRQ(IRQ1_EINT_2, DSP_WDT_EXPIRE),
+	CS35L45_REG_IRQ(IRQ1_EINT_3, PLL_UNLOCK_FLAG_RISE),
+	CS35L45_REG_IRQ(IRQ1_EINT_3, PLL_LOCK_FLAG),
+};
+
+static const struct regmap_irq_chip cs35l45_regmap_irq_chip = {
+	.name = "cs35l45 IRQ1 Controller",
+	.main_status = CS35L45_IRQ1_STATUS,
+	.status_base = CS35L45_IRQ1_EINT_1,
+	.mask_base = CS35L45_IRQ1_MASK_1,
+	.ack_base = CS35L45_IRQ1_EINT_1,
+	.num_regs = 18,
+	.irqs = cs35l45_reg_irqs,
+	.num_irqs = ARRAY_SIZE(cs35l45_reg_irqs),
+	.runtime_pm = true,
+};
+
 static int cs35l45_initialize(struct cs35l45_private *cs35l45)
 {
 	struct device *dev = cs35l45->dev;
@@ -660,7 +735,8 @@ static int cs35l45_initialize(struct cs35l45_private *cs35l45)
 int cs35l45_probe(struct cs35l45_private *cs35l45)
 {
 	struct device *dev = cs35l45->dev;
-	int ret;
+	unsigned long irq_pol = IRQF_ONESHOT | IRQF_SHARED;
+	int ret, i, irq;
 
 	cs35l45->vdd_batt = devm_regulator_get(dev, "vdd-batt");
 	if (IS_ERR(cs35l45->vdd_batt))
@@ -705,6 +781,37 @@ int cs35l45_probe(struct cs35l45_private *cs35l45)
 	if (ret < 0)
 		goto err_reset;
 
+	if (cs35l45->irq) {
+		if (cs35l45->irq_invert)
+			irq_pol |= IRQF_TRIGGER_HIGH;
+		else
+			irq_pol |= IRQF_TRIGGER_LOW;
+
+		ret = devm_regmap_add_irq_chip(dev, cs35l45->regmap, cs35l45->irq, irq_pol, 0,
+					       &cs35l45_regmap_irq_chip, &cs35l45->irq_data);
+		if (ret) {
+			dev_err(dev, "Failed to register IRQ chip: %d\n", ret);
+			goto err_reset;
+		}
+
+		for (i = 0; i < ARRAY_SIZE(cs35l45_irqs); i++) {
+			irq = regmap_irq_get_virq(cs35l45->irq_data, cs35l45_irqs[i].irq);
+			if (irq < 0) {
+				dev_err(dev, "Failed to get %s\n", cs35l45_irqs[i].name);
+				ret = irq;
+				goto err_reset;
+			}
+
+			ret = devm_request_threaded_irq(dev, irq, NULL, cs35l45_irqs[i].handler,
+							irq_pol, cs35l45_irqs[i].name, cs35l45);
+			if (ret) {
+				dev_err(dev, "Failed to request IRQ %s: %d\n",
+					cs35l45_irqs[i].name, ret);
+				goto err_reset;
+			}
+		}
+	}
+
 	ret = devm_snd_soc_register_component(dev, &cs35l45_component,
 					      cs35l45_dai,
 					      ARRAY_SIZE(cs35l45_dai));
diff --git a/sound/soc/codecs/cs35l45.h b/sound/soc/codecs/cs35l45.h
index f3a54fc57d53..ce92f5068ac5 100644
--- a/sound/soc/codecs/cs35l45.h
+++ b/sound/soc/codecs/cs35l45.h
@@ -51,7 +51,42 @@
 #define CS35L45_LDPM_CONFIG			0x00006404
 #define CS35L45_AMP_PCM_CONTROL			0x00007000
 #define CS35L45_AMP_PCM_HPF_TST			0x00007004
+#define CS35L45_IRQ1_CFG			0x0000E000
+#define CS35L45_IRQ1_STATUS			0x0000E004
+#define CS35L45_IRQ1_EINT_1			0x0000E010
+#define CS35L45_IRQ1_EINT_2			0x0000E014
+#define CS35L45_IRQ1_EINT_3			0x0000E018
 #define CS35L45_IRQ1_EINT_4			0x0000E01C
+#define CS35L45_IRQ1_EINT_5			0x0000E020
+#define CS35L45_IRQ1_EINT_7			0x0000E028
+#define CS35L45_IRQ1_EINT_8			0x0000E02C
+#define CS35L45_IRQ1_EINT_18			0x0000E054
+#define CS35L45_IRQ1_STS_1			0x0000E090
+#define CS35L45_IRQ1_STS_2			0x0000E094
+#define CS35L45_IRQ1_STS_3			0x0000E098
+#define CS35L45_IRQ1_STS_4			0x0000E09C
+#define CS35L45_IRQ1_STS_5			0x0000E0A0
+#define CS35L45_IRQ1_STS_7			0x0000E0A8
+#define CS35L45_IRQ1_STS_8			0x0000E0AC
+#define CS35L45_IRQ1_STS_18			0x0000E0D4
+#define CS35L45_IRQ1_MASK_1			0x0000E110
+#define CS35L45_IRQ1_MASK_2			0x0000E114
+#define CS35L45_IRQ1_MASK_3			0x0000E118
+#define CS35L45_IRQ1_MASK_4			0x0000E11C
+#define CS35L45_IRQ1_MASK_5			0x0000E120
+#define CS35L45_IRQ1_MASK_6			0x0000E124
+#define CS35L45_IRQ1_MASK_7			0x0000E128
+#define CS35L45_IRQ1_MASK_8			0x0000E12C
+#define CS35L45_IRQ1_MASK_9			0x0000E130
+#define CS35L45_IRQ1_MASK_10			0x0000E134
+#define CS35L45_IRQ1_MASK_11			0x0000E138
+#define CS35L45_IRQ1_MASK_12			0x0000E13C
+#define CS35L45_IRQ1_MASK_13			0x0000E140
+#define CS35L45_IRQ1_MASK_14			0x0000E144
+#define CS35L45_IRQ1_MASK_15			0x0000E148
+#define CS35L45_IRQ1_MASK_16			0x0000E14C
+#define CS35L45_IRQ1_MASK_17			0x0000E150
+#define CS35L45_IRQ1_MASK_18			0x0000E154
 #define CS35L45_GPIO_STATUS1			0x0000F000
 #define CS35L45_GPIO1_CTRL1			0x0000F008
 #define CS35L45_GPIO2_CTRL1			0x0000F00C
@@ -188,6 +223,38 @@
 #define CS35L45_GPIO_INVERT_SHIFT		19
 #define CS35L45_GPIO_INVERT_MASK		BIT(19)
 
+/* CS35L45_IRQ1_EINT_1 */
+#define CS35L45_BST_UVP_ERR_SHIFT		7
+#define CS35L45_BST_UVP_ERR_MASK		BIT(7)
+#define CS35L45_BST_SHORT_ERR_SHIFT		8
+#define CS35L45_BST_SHORT_ERR_MASK		BIT(8)
+#define CS35L45_TEMP_ERR_SHIFT			17
+#define CS35L45_TEMP_ERR_MASK			BIT(17)
+#define CS35L45_MSM_GLOBAL_EN_ASSERT_SHIFT	22
+#define CS35L45_MSM_GLOBAL_EN_ASSERT_MASK	BIT(22)
+#define CS35L45_UVLO_VDDBATT_ERR_SHIFT	29
+#define CS35L45_UVLO_VDDBATT_ERR_MASK		BIT(29)
+#define CS35L45_AMP_SHORT_ERR_SHIFT		31
+#define CS35L45_AMP_SHORT_ERR_MASK		BIT(31)
+
+/* CS35L45_IRQ1_EINT_2 */
+#define CS35L45_DSP_WDT_EXPIRE_SHIFT		4
+#define CS35L45_DSP_WDT_EXPIRE_MASK		BIT(4)
+
+/* CS35L45_IRQ1_EINT_3 */
+#define CS35L45_PLL_LOCK_FLAG_SHIFT		1
+#define CS35L45_PLL_LOCK_FLAG_MASK		BIT(1)
+#define CS35L45_PLL_UNLOCK_FLAG_RISE_SHIFT	4
+#define CS35L45_PLL_UNLOCK_FLAG_RISE_MASK	BIT(4)
+#define CS35L45_AMP_CAL_ERR_SHIFT		25
+#define CS35L45_AMP_CAL_ERR_MASK		BIT(25)
+
+/* CS35L45_IRQ1_EINT_18 */
+#define CS35L45_GLOBAL_ERROR_SHIFT		15
+#define CS35L45_GLOBAL_ERROR_MASK		BIT(15)
+#define CS35L45_UVLO_VDDLV_ERR_SHIFT		16
+#define CS35L45_UVLO_VDDLV_ERR_MASK		BIT(16)
+
 /* Mixer sources */
 #define CS35L45_PCM_SRC_MASK			0x7F
 #define CS35L45_PCM_SRC_ZERO			0x00
@@ -217,6 +284,43 @@
 		       SNDRV_PCM_RATE_88200 | \
 		       SNDRV_PCM_RATE_96000)
 
+/*
+ * IRQs
+ */
+#define CS35L45_IRQ(_irq, _name, _hand)		\
+	{					\
+		.irq = CS35L45_ ## _irq ## _IRQ,\
+		.name = _name,			\
+		.handler = _hand,		\
+	}
+
+struct cs35l45_irq {
+	int irq;
+	const char *name;
+	irqreturn_t (*handler)(int irq, void *data);
+};
+
+#define CS35L45_REG_IRQ(_reg, _irq)					\
+	[CS35L45_ ## _irq ## _IRQ] = {					\
+		.reg_offset = (CS35L45_ ## _reg) - CS35L45_IRQ1_EINT_1,	\
+		.mask = CS35L45_ ## _irq ## _MASK			\
+	}
+
+enum cs35l45_irq_list {
+	CS35L45_AMP_SHORT_ERR_IRQ,
+	CS35L45_UVLO_VDDBATT_ERR_IRQ,
+	CS35L45_BST_SHORT_ERR_IRQ,
+	CS35L45_BST_UVP_ERR_IRQ,
+	CS35L45_TEMP_ERR_IRQ,
+	CS35L45_AMP_CAL_ERR_IRQ,
+	CS35L45_UVLO_VDDLV_ERR_IRQ,
+	CS35L45_GLOBAL_ERROR_IRQ,
+	CS35L45_DSP_WDT_EXPIRE_IRQ,
+	CS35L45_PLL_UNLOCK_FLAG_RISE_IRQ,
+	CS35L45_PLL_LOCK_FLAG_IRQ,
+	CS35L45_NUM_IRQ
+};
+
 struct cs35l45_private {
 	struct device *dev;
 	struct regmap *regmap;
@@ -227,6 +331,9 @@ struct cs35l45_private {
 	bool sysclk_set;
 	u8 slot_width;
 	u8 slot_count;
+	int irq_invert;
+	int irq;
+	struct regmap_irq_chip_data *irq_data;
 };
 
 extern const struct dev_pm_ops cs35l45_pm_ops;
-- 
2.25.1

