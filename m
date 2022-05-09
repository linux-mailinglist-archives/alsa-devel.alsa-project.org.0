Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 192CA5206EE
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 23:49:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98A7616FA;
	Mon,  9 May 2022 23:48:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98A7616FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652132956;
	bh=dq5wS7nP7/6CwnUKRbi/P2qN17/F4gd+e2J8vEfQU5U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kWslUVKP8LWcO3E+TKAUu+rVvtGF7nm4MJ2n3HQEM66xJTgHUDWcGtWaTkleFJDoR
	 +ONK7reBm8lOQN90WgjEv8YbvTa1sevZyLhUN0QEO4uDBm3pl0zmfwFxg4sSiNi8Xe
	 HgwIV4PF5wo6HrFS1LY3lcUCyTSba1vLPFJXZQdI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1B0EF8053A;
	Mon,  9 May 2022 23:47:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDEACF8053B; Mon,  9 May 2022 23:47:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D30DF8025D
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 23:47:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D30DF8025D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ZboWGjFp"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 249BF6xY021606;
 Mon, 9 May 2022 16:47:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=8Bz8HKhSI3W2y/7MGRRJ2tUSju+6jG+W67AGgMrqMYk=;
 b=ZboWGjFpSaxQAtH2Gxfnk3WcPx0LltyEW22KV/UkZ1mfy6vodSRaND9j4X6hjd4FFAkZ
 W+ZBuh9GYy8qdgWq3QuQL+kSNQo39oyHdSNyi1QzHBciZDy5cldpv6mJA5Hs08iUfe0E
 C3wro+/IVNHs+0NWU/B++Jlwbd7YG/35WWt+v115aHlgRAWByaX2qmokhKKeq96GwvRI
 EUe02Mc9iVQdyC7QMgV1V9RQuS0zoe2tQrstz2RgtmJYjcUL/tWRtingKp3mPJL+1y4t
 IIMBMC7KYHYhd/onwb9i9/fE5Gr8So7I247WX+1GmGCL90N8bOoPXrUJDQgCpE7H7Vza Mw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fwp613jer-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 09 May 2022 16:47:07 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 9 May
 2022 22:47:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Mon, 9 May 2022 22:47:06 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.55])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A7ADA475;
 Mon,  9 May 2022 21:47:05 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH v2 04/26] ALSA: hda: cs35l41: Add Support for Interrupts
Date: Mon, 9 May 2022 22:46:41 +0100
Message-ID: <20220509214703.4482-5-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220509214703.4482-1-vitalyr@opensource.cirrus.com>
References: <20220509214703.4482-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: KtmN-hnPl-M36L6uJAuTE-HZAOeVRoEG
X-Proofpoint-ORIG-GUID: KtmN-hnPl-M36L6uJAuTE-HZAOeVRoEG
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
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

From: Stefan Binding <sbinding@opensource.cirrus.com>

The CS35L41 can produce interrupts on error.

When the interrupts occur, the driver will report
the error, but errors will only be fixed after playback
finishes.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 include/sound/cs35l41.h     |  54 +++++++++++++++
 sound/pci/hda/Kconfig       |   2 +
 sound/pci/hda/cs35l41_hda.c | 134 +++++++++++++++++++++++++++++++++++-
 sound/pci/hda/cs35l41_hda.h |   2 +
 4 files changed, 191 insertions(+), 1 deletion(-)

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index 48ea76e9a7a5..5bd2a5d370ce 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -690,6 +690,13 @@
 #define CS35L41_TEMP_WARN_ERR_RLS	0x20
 #define CS35L41_TEMP_ERR_RLS		0x40
 
+#define CS35L41_AMP_SHORT_ERR_RLS_SHIFT	1
+#define CS35L41_BST_SHORT_ERR_RLS_SHIFT	2
+#define CS35L41_BST_OVP_ERR_RLS_SHIFT	3
+#define CS35L41_BST_UVP_ERR_RLS_SHIFT	4
+#define CS35L41_TEMP_WARN_ERR_RLS_SHIFT	5
+#define CS35L41_TEMP_ERR_RLS_SHIFT	6
+
 #define CS35L41_INT1_MASK_DEFAULT	0x7FFCFE3F
 #define CS35L41_INT1_UNMASK_PUP		0xFEFFFFFF
 #define CS35L41_INT1_UNMASK_PDN		0xFF7FFFFF
@@ -793,6 +800,53 @@ struct cs35l41_otp_map_element_t {
 	u32 word_offset;
 };
 
+/*
+ * IRQs
+ */
+#define CS35L41_IRQ(_irq, _name, _hand)		\
+	{					\
+		.irq = CS35L41_ ## _irq ## _IRQ,\
+		.name = _name,			\
+		.handler = _hand,		\
+	}
+
+struct cs35l41_irq {
+	int irq;
+	const char *name;
+	irqreturn_t (*handler)(int irq, void *data);
+};
+
+#define CS35L41_REG_IRQ(_reg, _irq)					\
+	[CS35L41_ ## _irq ## _IRQ] = {					\
+		.reg_offset = (CS35L41_ ## _reg) - CS35L41_IRQ1_STATUS1,\
+		.mask = CS35L41_ ## _irq ## _MASK			\
+	}
+
+/* (0x0000E010) CS35L41_IRQ1_STATUS1 */
+#define CS35L41_BST_OVP_ERR_SHIFT		6
+#define CS35L41_BST_OVP_ERR_MASK		BIT(CS35L41_BST_OVP_ERR_SHIFT)
+#define CS35L41_BST_DCM_UVP_ERR_SHIFT		7
+#define CS35L41_BST_DCM_UVP_ERR_MASK		BIT(CS35L41_BST_DCM_UVP_ERR_SHIFT)
+#define CS35L41_BST_SHORT_ERR_SHIFT		8
+#define CS35L41_BST_SHORT_ERR_MASK		BIT(CS35L41_BST_SHORT_ERR_SHIFT)
+#define CS35L41_TEMP_WARN_SHIFT			15
+#define CS35L41_TEMP_WARN_MASK			BIT(CS35L41_TEMP_WARN_SHIFT)
+#define CS35L41_TEMP_ERR_SHIFT			17
+#define CS35L41_TEMP_ERR_MASK			BIT(CS35L41_TEMP_ERR_SHIFT)
+#define CS35L41_AMP_SHORT_ERR_SHIFT		31
+#define CS35L41_AMP_SHORT_ERR_MASK		BIT(CS35L41_AMP_SHORT_ERR_SHIFT)
+
+enum cs35l41_irq_list {
+	CS35L41_BST_OVP_ERR_IRQ,
+	CS35L41_BST_DCM_UVP_ERR_IRQ,
+	CS35L41_BST_SHORT_ERR_IRQ,
+	CS35L41_TEMP_WARN_IRQ,
+	CS35L41_TEMP_ERR_IRQ,
+	CS35L41_AMP_SHORT_ERR_IRQ,
+
+	CS35L41_NUM_IRQ
+};
+
 extern struct regmap_config cs35l41_regmap_i2c;
 extern struct regmap_config cs35l41_regmap_spi;
 
diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index 9f6c99c1d87b..79ade4787d95 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -102,6 +102,7 @@ config SND_HDA_SCODEC_CS35L41_I2C
 	select SND_HDA_GENERIC
 	select SND_SOC_CS35L41_LIB
 	select SND_HDA_SCODEC_CS35L41
+	select REGMAP_IRQ
 	help
 	  Say Y or M here to include CS35L41 I2C HD-audio side codec support
 	  in snd-hda-intel driver, such as ALC287.
@@ -117,6 +118,7 @@ config SND_HDA_SCODEC_CS35L41_SPI
 	select SND_HDA_GENERIC
 	select SND_SOC_CS35L41_LIB
 	select SND_HDA_SCODEC_CS35L41
+	select REGMAP_IRQ
 	help
 	  Say Y or M here to include CS35L41 SPI HD-audio side codec support
 	  in snd-hda-intel driver, such as ALC287.
diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 96c3e541696d..bd52e0c2c772 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -32,6 +32,21 @@ static const struct reg_sequence cs35l41_hda_mute[] = {
 	{ CS35L41_AMP_DIG_VOL_CTRL,	0x0000A678 }, // AMP_VOL_PCM Mute
 };
 
+/* Protection release cycle to get the speaker out of Safe-Mode */
+static void cs35l41_error_release(struct device *dev, struct regmap *regmap, unsigned int mask)
+{
+	regmap_write(regmap, CS35L41_PROTECT_REL_ERR_IGN, 0);
+	regmap_set_bits(regmap, CS35L41_PROTECT_REL_ERR_IGN, mask);
+	regmap_clear_bits(regmap, CS35L41_PROTECT_REL_ERR_IGN, mask);
+}
+
+/* Clear all errors to release safe mode. Global Enable must be cleared first. */
+static void cs35l41_irq_release(struct cs35l41_hda *cs35l41)
+{
+	cs35l41_error_release(cs35l41->dev, cs35l41->regmap, cs35l41->irq_errors);
+	cs35l41->irq_errors = 0;
+}
+
 static void cs35l41_hda_playback_hook(struct device *dev, int action)
 {
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
@@ -58,6 +73,7 @@ static void cs35l41_hda_playback_hook(struct device *dev, int action)
 					 CS35L41_AMP_EN_MASK, 0 << CS35L41_AMP_EN_SHIFT);
 		if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST)
 			regmap_write(reg, CS35L41_GPIO1_CTRL1, 0x00000001);
+		cs35l41_irq_release(cs35l41);
 		break;
 	default:
 		dev_warn(cs35l41->dev, "Playback action not supported: %d\n", action);
@@ -110,10 +126,101 @@ static const struct component_ops cs35l41_hda_comp_ops = {
 	.unbind = cs35l41_hda_unbind,
 };
 
+static irqreturn_t cs35l41_bst_short_err(int irq, void *data)
+{
+	struct cs35l41_hda *cs35l41 = data;
+
+	dev_crit_ratelimited(cs35l41->dev, "LBST Error\n");
+	set_bit(CS35L41_BST_SHORT_ERR_RLS_SHIFT, &cs35l41->irq_errors);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t cs35l41_bst_dcm_uvp_err(int irq, void *data)
+{
+	struct cs35l41_hda *cs35l41 = data;
+
+	dev_crit_ratelimited(cs35l41->dev, "DCM VBST Under Voltage Error\n");
+	set_bit(CS35L41_BST_UVP_ERR_RLS_SHIFT, &cs35l41->irq_errors);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t cs35l41_bst_ovp_err(int irq, void *data)
+{
+	struct cs35l41_hda *cs35l41 = data;
+
+	dev_crit_ratelimited(cs35l41->dev, "VBST Over Voltage error\n");
+	set_bit(CS35L41_BST_OVP_ERR_RLS_SHIFT, &cs35l41->irq_errors);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t cs35l41_temp_err(int irq, void *data)
+{
+	struct cs35l41_hda *cs35l41 = data;
+
+	dev_crit_ratelimited(cs35l41->dev, "Over temperature error\n");
+	set_bit(CS35L41_TEMP_ERR_RLS_SHIFT, &cs35l41->irq_errors);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t cs35l41_temp_warn(int irq, void *data)
+{
+	struct cs35l41_hda *cs35l41 = data;
+
+	dev_crit_ratelimited(cs35l41->dev, "Over temperature warning\n");
+	set_bit(CS35L41_TEMP_WARN_ERR_RLS_SHIFT, &cs35l41->irq_errors);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t cs35l41_amp_short(int irq, void *data)
+{
+	struct cs35l41_hda *cs35l41 = data;
+
+	dev_crit_ratelimited(cs35l41->dev, "Amp short error\n");
+	set_bit(CS35L41_AMP_SHORT_ERR_RLS_SHIFT, &cs35l41->irq_errors);
+
+	return IRQ_HANDLED;
+}
+
+static const struct cs35l41_irq cs35l41_irqs[] = {
+	CS35L41_IRQ(BST_OVP_ERR, "Boost Overvoltage Error", cs35l41_bst_ovp_err),
+	CS35L41_IRQ(BST_DCM_UVP_ERR, "Boost Undervoltage Error", cs35l41_bst_dcm_uvp_err),
+	CS35L41_IRQ(BST_SHORT_ERR, "Boost Inductor Short Error", cs35l41_bst_short_err),
+	CS35L41_IRQ(TEMP_WARN, "Temperature Warning", cs35l41_temp_warn),
+	CS35L41_IRQ(TEMP_ERR, "Temperature Error", cs35l41_temp_err),
+	CS35L41_IRQ(AMP_SHORT_ERR, "Amp Short", cs35l41_amp_short),
+};
+
+static const struct regmap_irq cs35l41_reg_irqs[] = {
+	CS35L41_REG_IRQ(IRQ1_STATUS1, BST_OVP_ERR),
+	CS35L41_REG_IRQ(IRQ1_STATUS1, BST_DCM_UVP_ERR),
+	CS35L41_REG_IRQ(IRQ1_STATUS1, BST_SHORT_ERR),
+	CS35L41_REG_IRQ(IRQ1_STATUS1, TEMP_WARN),
+	CS35L41_REG_IRQ(IRQ1_STATUS1, TEMP_ERR),
+	CS35L41_REG_IRQ(IRQ1_STATUS1, AMP_SHORT_ERR),
+};
+
+static const struct regmap_irq_chip cs35l41_regmap_irq_chip = {
+	.name = "cs35l41 IRQ1 Controller",
+	.status_base = CS35L41_IRQ1_STATUS1,
+	.mask_base = CS35L41_IRQ1_MASK1,
+	.ack_base = CS35L41_IRQ1_STATUS1,
+	.num_regs = 4,
+	.irqs = cs35l41_reg_irqs,
+	.num_irqs = ARRAY_SIZE(cs35l41_reg_irqs),
+};
+
 static int cs35l41_hda_apply_properties(struct cs35l41_hda *cs35l41)
 {
 	struct cs35l41_hw_cfg *hw_cfg = &cs35l41->hw_cfg;
+	bool using_irq = false;
+	int irq, irq_pol;
 	int ret;
+	int i;
 
 	if (!cs35l41->hw_cfg.valid)
 		return -EINVAL;
@@ -145,6 +252,7 @@ static int cs35l41_hda_apply_properties(struct cs35l41_hda *cs35l41)
 		case CS35L41_NOT_USED:
 			break;
 		case CS35L41_INTERRUPT:
+			using_irq = true;
 			break;
 		default:
 			dev_err(cs35l41->dev, "Invalid GPIO2 function %d\n", hw_cfg->gpio2.func);
@@ -152,7 +260,28 @@ static int cs35l41_hda_apply_properties(struct cs35l41_hda *cs35l41)
 		}
 	}
 
-	cs35l41_gpio_config(cs35l41->regmap, hw_cfg);
+	irq_pol = cs35l41_gpio_config(cs35l41->regmap, hw_cfg);
+
+	if (cs35l41->irq && using_irq) {
+		ret = devm_regmap_add_irq_chip(cs35l41->dev, cs35l41->regmap, cs35l41->irq,
+					       IRQF_ONESHOT | IRQF_SHARED | irq_pol,
+					       0, &cs35l41_regmap_irq_chip, &cs35l41->irq_data);
+		if (ret)
+			return ret;
+
+		for (i = 0; i < ARRAY_SIZE(cs35l41_irqs); i++) {
+			irq = regmap_irq_get_virq(cs35l41->irq_data, cs35l41_irqs[i].irq);
+			if (irq < 0)
+				return irq;
+
+			ret = devm_request_threaded_irq(cs35l41->dev, irq, NULL,
+							cs35l41_irqs[i].handler,
+							IRQF_ONESHOT | IRQF_SHARED | irq_pol,
+							cs35l41_irqs[i].name, cs35l41);
+			if (ret)
+				return ret;
+		}
+	}
 
 	return cs35l41_hda_channel_map(cs35l41->dev, 0, NULL, 1, &hw_cfg->spk_pos);
 }
@@ -296,6 +425,9 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 	struct cs35l41_hda *cs35l41;
 	int ret;
 
+	BUILD_BUG_ON(ARRAY_SIZE(cs35l41_irqs) != ARRAY_SIZE(cs35l41_reg_irqs));
+	BUILD_BUG_ON(ARRAY_SIZE(cs35l41_irqs) != CS35L41_NUM_IRQ);
+
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
diff --git a/sound/pci/hda/cs35l41_hda.h b/sound/pci/hda/cs35l41_hda.h
index 44d9204ffdf1..c486e4a5bb24 100644
--- a/sound/pci/hda/cs35l41_hda.h
+++ b/sound/pci/hda/cs35l41_hda.h
@@ -35,6 +35,8 @@ struct cs35l41_hda {
 
 	int irq;
 	int index;
+	unsigned volatile long irq_errors;
+	struct regmap_irq_chip_data *irq_data;
 };
 
 int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int irq,
-- 
2.34.1

