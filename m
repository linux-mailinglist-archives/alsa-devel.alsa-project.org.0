Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FDE6ACB24
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 18:47:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9E3F11A4;
	Mon,  6 Mar 2023 18:46:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9E3F11A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678124857;
	bh=PvM2q0fHHU/RLHQ+La+s+FeaYfFEKsTpC8aA+E7Li3g=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Kc6hwi6eRdm0Bck0VX24AXoJuRWg3T8os2IeJP4R1+SpC4GxdjrkdhT8qBpVTFYLS
	 MNq/BuVK4DQRXIWcrLFYWSMFoKV5bzsMP4oNzEg2Y9m5hTcd+faLLzkBxh/fy6m/tZ
	 +DCutbvopISGPU39d4fHFLDKE6yuZ4EmLxI4Ey+U=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C86F0F805EC;
	Mon,  6 Mar 2023 18:42:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4E86F804FE; Fri,  3 Mar 2023 20:22:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F121F800BA
	for <alsa-devel@alsa-project.org>; Fri,  3 Mar 2023 20:22:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F121F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=SlRuLE+d
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3236Ouk3027443;
	Fri, 3 Mar 2023 13:21:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=KTinV/G6Tp7WAearLAGbxpXybqXOTsNpKB60xaJUjoY=;
 b=SlRuLE+d3yBsOfnozQ4LsxVRIOAKY6zT6op5DkTjqMGkYdgS/QBpoXSk8qGNrTjuep1L
 DgfKG8EGmsh5goknhNZNY2AfXGNLoiSb4Ygoog5txDLFiOx9/KP5dR3y63lpJ8k+Vc3q
 6Y9i5PytcfYFtntzK7gde1vOsNz/ZjGJFhGd9HXRfVxHboYmaoVbVy72k/FvT9TwWxs1
 yOi8q9EaFlv78c7pGG47SqIG6IFbxSTD4q+9Piz9gFNTtr19cDRcVEpYTV+UC5BluPYw
 B9hWzfl1XdK/o+xJaNB1nowg9jVw/jLDwRvrSi+CmxR0xrY/QdTQzEy25NUJS18yWr8D Ow==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3nygm7357m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Mar 2023 13:21:57 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Fri, 3 Mar
 2023 13:21:55 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Fri, 3 Mar 2023 13:21:55 -0600
Received: from vkarpovich-ThinkStation-P620.crystal.cirrus.com
 (vkarpovich-ThinkStation-P620.ad.cirrus.com [141.131.206.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C67C211AC;
	Fri,  3 Mar 2023 19:21:53 +0000 (UTC)
From: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 1/5] ASoC: cs35l45: Support for GPIO pins configuration.
Date: Fri, 3 Mar 2023 13:21:47 -0600
Message-ID: <20230303192151.2437221-1-vkarpovi@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Ubr1aJpNwnZ2vr-geeE9Z9XleU1ZMNAJ
X-Proofpoint-GUID: Ubr1aJpNwnZ2vr-geeE9Z9XleU1ZMNAJ
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=8426d1fb79=vkarpovi@opensource.cirrus.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 325UYNEBCPSEA6FM4TRMUADBGEHZL4HR
X-Message-ID-Hash: 325UYNEBCPSEA6FM4TRMUADBGEHZL4HR
X-Mailman-Approved-At: Mon, 06 Mar 2023 17:41:49 +0000
CC: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org,
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
 "Vlad.Karpovich" <vkarpovi@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/325UYNEBCPSEA6FM4TRMUADBGEHZL4HR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: "Vlad.Karpovich" <vkarpovi@opensource.cirrus.com>

Adds device tree configuration for cs35l45 GPIOs

Signed-off-by: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
---
 include/dt-bindings/sound/cs35l45.h | 57 +++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l45-tables.c   | 14 +++++++
 sound/soc/codecs/cs35l45.c          | 56 ++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l45.h          | 27 +++++++++++++-
 4 files changed, 152 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/sound/cs35l45.h b/include/dt-bindings/sound/cs35l45.h
index 076da4b2c28d..25386af18445 100644
--- a/include/dt-bindings/sound/cs35l45.h
+++ b/include/dt-bindings/sound/cs35l45.h
@@ -17,4 +17,61 @@
 #define CS35L45_ASP_TX_HIZ_UNUSED	0x1
 #define CS35L45_ASP_TX_HIZ_DISABLED	0x2
 
+/*
+ * Optional GPIOX Sub-nodes:
+ *  The cs35l45 node can have up to three "cirrus,gpio-ctrlX" ('X' = [1,2,3])
+ *  sub-nodes for configuring the GPIO pins.
+ *
+ * - gpio-dir : GPIO pin direction. Valid only when 'gpio-ctrl'
+ *   is 1.
+ *    0 = Output
+ *    1 = Input (Default)
+ *
+ * - gpio-lvl : GPIO level. Valid only when 'gpio-ctrl' is 1 and 'gpio-dir' is 0.
+ *
+ *    0 = Low (Default)
+ *    1 = High
+ *
+ * - gpio-op-cfg : GPIO output configuration. Valid only when 'gpio-ctrl' is 1
+ *   and 'gpio-dir' is 0.
+ *
+ *    0 = CMOS (Default)
+ *    1 = Open Drain
+ *
+ * - gpio-pol : GPIO output polarity select. Valid only when 'gpio-ctrl' is 1
+ *   and 'gpio-dir' is 0.
+ *
+ *    0 = Non-inverted, Active High (Default)
+ *    1 = Inverted, Active Low
+ *
+ * - gpio-invert : Defines the polarity of the GPIO pin if configured
+ *   as input.
+ *
+ *    0 = Not inverted (Default)
+ *    1 = Inverted
+ *
+ * - gpio-ctrl : Defines the function of the GPIO pin.
+ *
+ * GPIO1:
+ *   0 = High impedance input (Default)
+ *   1 = Pin acts as a GPIO, direction controlled by 'gpio-dir'
+ *   2 = Pin acts as MDSYNC, direction controlled by MDSYNC
+ *   3-7 = Reserved
+ *
+ * GPIO2:
+ *   0 = High impedance input (Default)
+ *   1 = Pin acts as a GPIO, direction controlled by 'gpio-dir'
+ *   2 = Pin acts as open drain INT
+ *   3 = Reserved
+ *   4 = Pin acts as push-pull output INT. Active low.
+ *   5 = Pin acts as push-pull output INT. Active high.
+ *   6,7 = Reserved
+ *
+ * GPIO3:
+ *   0 = High impedance input (Default)
+ *   1 = Pin acts as a GPIO, direction controlled by 'gpio-dir'
+ *   2-7 = Reserved
+ */
+#define CS35L45_NUM_GPIOS	0x3
+
 #endif /* DT_CS35L45_H */
diff --git a/sound/soc/codecs/cs35l45-tables.c b/sound/soc/codecs/cs35l45-tables.c
index 5a2c2e684ef9..bca7e830821f 100644
--- a/sound/soc/codecs/cs35l45-tables.c
+++ b/sound/soc/codecs/cs35l45-tables.c
@@ -43,6 +43,9 @@ EXPORT_SYMBOL_NS_GPL(cs35l45_apply_patch, SND_SOC_CS35L45_TABLES);
 static const struct reg_default cs35l45_defaults[] = {
 	{ CS35L45_BLOCK_ENABLES,		0x00003323 },
 	{ CS35L45_BLOCK_ENABLES2,		0x00000010 },
+	{ CS35L45_SYNC_GPIO1,			0x00000007 },
+	{ CS35L45_INTB_GPIO2_MCLK_REF,		0x00000005 },
+	{ CS35L45_GPIO3,			0x00000005 },
 	{ CS35L45_REFCLK_INPUT,			0x00000510 },
 	{ CS35L45_GLOBAL_SAMPLE_RATE,		0x00000003 },
 	{ CS35L45_ASP_ENABLES1,			0x00000000 },
@@ -61,6 +64,9 @@ static const struct reg_default cs35l45_defaults[] = {
 	{ CS35L45_ASPTX4_INPUT,			0x00000028 },
 	{ CS35L45_ASPTX5_INPUT,			0x00000048 },
 	{ CS35L45_AMP_PCM_CONTROL,		0x00100000 },
+	{ CS35L45_GPIO1_CTRL1,			0x81000001 },
+	{ CS35L45_GPIO2_CTRL1,			0x81000001 },
+	{ CS35L45_GPIO3_CTRL1,			0x81000001 },
 };
 
 static bool cs35l45_readable_reg(struct device *dev, unsigned int reg)
@@ -72,6 +78,9 @@ static bool cs35l45_readable_reg(struct device *dev, unsigned int reg)
 	case CS35L45_BLOCK_ENABLES:
 	case CS35L45_BLOCK_ENABLES2:
 	case CS35L45_ERROR_RELEASE:
+	case CS35L45_SYNC_GPIO1:
+	case CS35L45_INTB_GPIO2_MCLK_REF:
+	case CS35L45_GPIO3:
 	case CS35L45_REFCLK_INPUT:
 	case CS35L45_GLOBAL_SAMPLE_RATE:
 	case CS35L45_ASP_ENABLES1:
@@ -92,6 +101,10 @@ static bool cs35l45_readable_reg(struct device *dev, unsigned int reg)
 	case CS35L45_AMP_PCM_CONTROL:
 	case CS35L45_AMP_PCM_HPF_TST:
 	case CS35L45_IRQ1_EINT_4:
+	case CS35L45_GPIO_STATUS1:
+	case CS35L45_GPIO1_CTRL1:
+	case CS35L45_GPIO2_CTRL1:
+	case CS35L45_GPIO3_CTRL1:
 		return true;
 	default:
 		return false;
@@ -107,6 +120,7 @@ static bool cs35l45_volatile_reg(struct device *dev, unsigned int reg)
 	case CS35L45_ERROR_RELEASE:
 	case CS35L45_AMP_PCM_HPF_TST:	/* not cachable */
 	case CS35L45_IRQ1_EINT_4:
+	case CS35L45_GPIO_STATUS1:
 		return true;
 	default:
 		return false;
diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index d15b3b77c7eb..901f3647fbda 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -536,7 +536,63 @@ static int __maybe_unused cs35l45_runtime_resume(struct device *dev)
 
 static int cs35l45_apply_property_config(struct cs35l45_private *cs35l45)
 {
+	struct device_node *node = cs35l45->dev->of_node;
+	unsigned int gpio_regs[] = {CS35L45_GPIO1_CTRL1, CS35L45_GPIO2_CTRL1,
+				    CS35L45_GPIO3_CTRL1};
+	unsigned int pad_regs[] = {CS35L45_SYNC_GPIO1,
+				   CS35L45_INTB_GPIO2_MCLK_REF, CS35L45_GPIO3};
+	struct device_node *child;
 	unsigned int val;
+	char of_name[32];
+	int ret, i;
+
+	if (!node)
+		return 0;
+
+	for (i = 0; i < CS35L45_NUM_GPIOS; i++) {
+		sprintf(of_name, "cirrus,gpio-ctrl%d", i + 1);
+		child = of_get_child_by_name(node, of_name);
+		if (!child)
+			continue;
+
+		ret = of_property_read_u32(child, "gpio-dir", &val);
+		if (!ret)
+			regmap_update_bits(cs35l45->regmap, gpio_regs[i],
+					   CS35L45_GPIO_DIR_MASK,
+					   val << CS35L45_GPIO_DIR_SHIFT);
+
+		ret = of_property_read_u32(child, "gpio-lvl", &val);
+		if (!ret)
+			regmap_update_bits(cs35l45->regmap, gpio_regs[i],
+					   CS35L45_GPIO_LVL_MASK,
+					   val << CS35L45_GPIO_LVL_SHIFT);
+
+		ret = of_property_read_u32(child, "gpio-op-cfg", &val);
+		if (!ret)
+			regmap_update_bits(cs35l45->regmap, gpio_regs[i],
+					   CS35L45_GPIO_OP_CFG_MASK,
+					   val << CS35L45_GPIO_OP_CFG_SHIFT);
+
+		ret = of_property_read_u32(child, "gpio-pol", &val);
+		if (!ret)
+			regmap_update_bits(cs35l45->regmap, gpio_regs[i],
+					   CS35L45_GPIO_POL_MASK,
+					   val << CS35L45_GPIO_POL_SHIFT);
+
+		ret = of_property_read_u32(child, "gpio-ctrl", &val);
+		if (!ret)
+			regmap_update_bits(cs35l45->regmap, pad_regs[i],
+					   CS35L45_GPIO_CTRL_MASK,
+					   val << CS35L45_GPIO_CTRL_SHIFT);
+
+		ret = of_property_read_u32(child, "gpio-invert", &val);
+		if (!ret)
+			regmap_update_bits(cs35l45->regmap, pad_regs[i],
+					   CS35L45_GPIO_INVERT_MASK,
+					   val << CS35L45_GPIO_INVERT_SHIFT);
+
+		of_node_put(child);
+	}
 
 	if (device_property_read_u32(cs35l45->dev,
 				     "cirrus,asp-sdout-hiz-ctrl", &val) == 0) {
diff --git a/sound/soc/codecs/cs35l45.h b/sound/soc/codecs/cs35l45.h
index 53fe9d2b7b15..f3a54fc57d53 100644
--- a/sound/soc/codecs/cs35l45.h
+++ b/sound/soc/codecs/cs35l45.h
@@ -14,6 +14,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <dt-bindings/sound/cs35l45.h>
 
 #define CS35L45_DEVID				0x00000000
 #define CS35L45_REVID				0x00000004
@@ -24,6 +25,9 @@
 #define CS35L45_BLOCK_ENABLES			0x00002018
 #define CS35L45_BLOCK_ENABLES2			0x0000201C
 #define CS35L45_ERROR_RELEASE			0x00002034
+#define CS35L45_SYNC_GPIO1			0x00002430
+#define CS35L45_INTB_GPIO2_MCLK_REF		0x00002434
+#define CS35L45_GPIO3				0x00002438
 #define CS35L45_REFCLK_INPUT			0x00002C04
 #define CS35L45_GLOBAL_SAMPLE_RATE		0x00002C0C
 #define CS35L45_BOOST_CCM_CFG			0x00003808
@@ -48,8 +52,11 @@
 #define CS35L45_AMP_PCM_CONTROL			0x00007000
 #define CS35L45_AMP_PCM_HPF_TST			0x00007004
 #define CS35L45_IRQ1_EINT_4			0x0000E01C
-#define CS35L45_LASTREG				0x0000E01C
-
+#define CS35L45_GPIO_STATUS1			0x0000F000
+#define CS35L45_GPIO1_CTRL1			0x0000F008
+#define CS35L45_GPIO2_CTRL1			0x0000F00C
+#define CS35L45_GPIO3_CTRL1			0x0000F010
+#define CS35L45_LASTREG			0x0000F010
 /* SFT_RESET */
 #define CS35L45_SOFT_RESET_TRIGGER		0x5A000000
 
@@ -165,6 +172,22 @@
 #define CS35L45_OTP_BOOT_DONE_STS_MASK		BIT(1)
 #define CS35L45_OTP_BUSY_MASK			BIT(0)
 
+/* GPIOX_CTRL1 */
+#define CS35L45_GPIO_DIR_SHIFT			31
+#define CS35L45_GPIO_DIR_MASK			BIT(31)
+#define CS35L45_GPIO_LVL_SHIFT			15
+#define CS35L45_GPIO_LVL_MASK			BIT(15)
+#define CS35L45_GPIO_OP_CFG_SHIFT		14
+#define CS35L45_GPIO_OP_CFG_MASK		BIT(14)
+#define CS35L45_GPIO_POL_SHIFT			12
+#define CS35L45_GPIO_POL_MASK			BIT(12)
+
+/* SYNC_GPIO1, INTB_GPIO2_MCLK_REF, GPIO3 */
+#define CS35L45_GPIO_CTRL_SHIFT		20
+#define CS35L45_GPIO_CTRL_MASK			GENMASK(22, 20)
+#define CS35L45_GPIO_INVERT_SHIFT		19
+#define CS35L45_GPIO_INVERT_MASK		BIT(19)
+
 /* Mixer sources */
 #define CS35L45_PCM_SRC_MASK			0x7F
 #define CS35L45_PCM_SRC_ZERO			0x00
-- 
2.25.1

