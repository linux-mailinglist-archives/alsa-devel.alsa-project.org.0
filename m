Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C204CC40F
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 18:36:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 099461E7C;
	Thu,  3 Mar 2022 18:35:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 099461E7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646329007;
	bh=CCGbNmZg71vkJLlfKbo/Nl0MxpzovxA9zZRCCK5Cqx4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sDQkhZqH7prj4faNLUwyE9/8pdQ0D4rodYO0xUuzLAiN/5e3xQRloL2evhKMhYq9p
	 vfv/hiI5/ULDei/xez825NnqTX/wV2yQF0ItE3G1425r/foYtU2xhM2LrZeHmPxrL1
	 6r3R9/7aGet3djN86Gxm9sYTIQC2HEh9uoKVO9pk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C463F805A1;
	Thu,  3 Mar 2022 18:31:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9553F80549; Thu,  3 Mar 2022 18:31:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FF02F80518
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 18:31:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FF02F80518
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="CpeU1rgU"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2234AAE0028599;
 Thu, 3 Mar 2022 11:31:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=DONCBa7E5uC4HxbWdXPbDBzKGhc9G7ZBmBL0rPxMxPg=;
 b=CpeU1rgUd83UBBA+ISrCwh7xdXmtkWdnhrdGxFOgrq4QdUmSPgvgh/2K7UDrQgkR6RBL
 p+cU20p91MPOeo0gMdnF9CHemEMPcf4I9MkPC5TZU8t8gqFry1dNAadhGOrE4SGh10ZZ
 T7ZxV7tWLqvqAXcvEoe2KPIzVOFCgizCWGcfpjDikUTzY0gJt20fsRLynavOmyNRMfNI
 rZA65g/O5iqgDxoFLY6JGSGjSruZf6O3Kn4VQKltj2HoeLPss+CzZ94nRxD2mkH+q+kg
 /ChMFRNXd35j8eS0YEga9RXHSscow7EttI39zFSNrKChPAvsl8weamm+13W2ChjduXcF 6w== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ejncq8ybk-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 03 Mar 2022 11:31:10 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Mar
 2022 17:31:09 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 3 Mar 2022 17:31:09 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.198])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B0A6C7C;
 Thu,  3 Mar 2022 17:31:08 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 18/20] hda: cs35l41: Move external boost handling to lib for
 ASoC use
Date: Thu, 3 Mar 2022 17:30:57 +0000
Message-ID: <20220303173059.269657-19-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303173059.269657-1-tanureal@opensource.cirrus.com>
References: <20220303173059.269657-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: cyvzpRI1yVUnnwiHVKEnZNRXbpZYxu6j
X-Proofpoint-GUID: cyvzpRI1yVUnnwiHVKEnZNRXbpZYxu6j
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 devicetree@vger.kernel.org
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

To add support for external boost for ASoC move the HDA external
boost implementation to the shared lib.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 include/sound/cs35l41.h        |   4 ++
 sound/pci/hda/cs35l41_hda.c    | 111 ++---------------------------
 sound/soc/codecs/cs35l41-lib.c | 124 ++++++++++++++++++++++++++++++++-
 3 files changed, 132 insertions(+), 107 deletions(-)

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index a8537bccedcf..bb008c6954d4 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -799,5 +799,9 @@ int cs35l41_set_channels(struct device *dev, struct regmap *reg,
 int cs35l41_boost_config(struct device *dev, struct regmap *regmap, int boost_ind, int boost_cap,
 			 int boost_ipk);
 int cs35l41_gpio_config(struct regmap *regmap, struct cs35l41_hw_cfg *hw_cfg);
+int cs35l41_init_boost(struct device *dev, struct regmap *regmap,
+		       struct cs35l41_hw_cfg *hw_cfg);
+bool cs35l41_safe_reset(struct regmap *regmap, enum cs35l41_boost_type b_type);
+void cs35l41_global_enable(struct regmap *regmap, enum cs35l41_boost_type b_type, int enable);
 
 #endif /* __CS35L41_H */
diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 155510616566..8f9320670506 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -32,88 +32,6 @@ static const struct reg_sequence cs35l41_hda_mute[] = {
 	{ CS35L41_AMP_DIG_VOL_CTRL,	0x0000A678 }, // AMP_VOL_PCM Mute
 };
 
-static const struct reg_sequence cs35l41_safe_to_reset[] = {
-	{ 0x00000040,			0x00000055 },
-	{ 0x00000040,			0x000000AA },
-	{ 0x0000393C,			0x000000C0, 6000},
-	{ 0x0000393C,			0x00000000 },
-	{ 0x00007414,			0x00C82222 },
-	{ 0x0000742C,			0x00000000 },
-	{ 0x00000040,			0x000000CC },
-	{ 0x00000040,			0x00000033 },
-};
-
-static const struct reg_sequence cs35l41_safe_to_active[] = {
-	{ 0x00000040,			0x00000055 },
-	{ 0x00000040,			0x000000AA },
-	{ 0x0000742C,			0x0000000F },
-	{ 0x0000742C,			0x00000079 },
-	{ 0x00007438,			0x00585941 },
-	{ CS35L41_PWR_CTRL1,		0x00000001, 3000 }, // GLOBAL_EN = 1
-	{ 0x0000742C,			0x000000F9 },
-	{ 0x00007438,			0x00580941 },
-	{ 0x00000040,			0x000000CC },
-	{ 0x00000040,			0x00000033 },
-};
-
-static const struct reg_sequence cs35l41_active_to_safe[] = {
-	{ 0x00000040,			0x00000055 },
-	{ 0x00000040,			0x000000AA },
-	{ 0x00007438,			0x00585941 },
-	{ CS35L41_PWR_CTRL1,		0x00000000 },
-	{ 0x0000742C,			0x00000009, 3000 },
-	{ 0x00007438,			0x00580941 },
-	{ 0x00000040,			0x000000CC },
-	{ 0x00000040,			0x00000033 },
-};
-
-static const struct reg_sequence cs35l41_reset_to_safe[] = {
-	{ 0x00000040,			0x00000055 },
-	{ 0x00000040,			0x000000AA },
-	{ 0x00007438,			0x00585941 },
-	{ 0x00007414,			0x08C82222 },
-	{ 0x0000742C,			0x00000009 },
-	{ 0x00000040,			0x000000CC },
-	{ 0x00000040,			0x00000033 },
-};
-
-static bool cs35l41_hda_safe_reset(struct cs35l41_hda *cs35l41)
-{
-	switch (cs35l41->hw_cfg.bst_type) {
-	case CS35L41_EXT_BOOST:
-		regmap_write(cs35l41->regmap, CS35L41_GPIO1_CTRL1, 0x00000001);
-		regmap_multi_reg_write(cs35l41->regmap, cs35l41_safe_to_reset,
-				       ARRAY_SIZE(cs35l41_safe_to_reset));
-		return true;
-	case CS35L41_EXT_BOOST_NO_VSPK_SWITCH:
-		return false;
-	default:
-		return true;
-	}
-};
-
-static void cs35l41_hda_global_enable(struct cs35l41_hda *cs35l41, int enable)
-{
-	switch (cs35l41->hw_cfg.bst_type) {
-	case CS35L41_INT_BOOST:
-		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL1, CS35L41_GLOBAL_EN_MASK,
-					 enable << CS35L41_GLOBAL_EN_SHIFT);
-		usleep_range(3000, 3100);
-		break;
-	case CS35L41_EXT_BOOST:
-	case CS35L41_EXT_BOOST_NO_VSPK_SWITCH:
-		if (enable)
-			regmap_multi_reg_write(cs35l41->regmap, cs35l41_safe_to_active,
-					       ARRAY_SIZE(cs35l41_safe_to_active));
-		else
-			regmap_multi_reg_write(cs35l41->regmap, cs35l41_active_to_safe,
-					       ARRAY_SIZE(cs35l41_active_to_safe));
-		break;
-	default:
-		break;
-	}
-};
-
 static void cs35l41_hda_playback_hook(struct device *dev, int action)
 {
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
@@ -128,11 +46,11 @@ static void cs35l41_hda_playback_hook(struct device *dev, int action)
 			regmap_write(reg, CS35L41_GPIO1_CTRL1, 0x00008001);
 		break;
 	case HDA_GEN_PCM_ACT_PREPARE:
-		cs35l41_hda_global_enable(cs35l41, 1);
+		cs35l41_global_enable(reg, cs35l41->hw_cfg.bst_type, 1);
 		break;
 	case HDA_GEN_PCM_ACT_CLEANUP:
 		regmap_multi_reg_write(reg, cs35l41_hda_mute, ARRAY_SIZE(cs35l41_hda_mute));
-		cs35l41_hda_global_enable(cs35l41, 0);
+		cs35l41_global_enable(reg, cs35l41->hw_cfg.bst_type, 0);
 		break;
 	case HDA_GEN_PCM_ACT_CLOSE:
 		regmap_update_bits(reg, CS35L41_PWR_CTRL2,
@@ -196,24 +114,9 @@ static int cs35l41_hda_apply_properties(struct cs35l41_hda *cs35l41)
 	if (!cs35l41->hw_cfg.valid)
 		return -EINVAL;
 
-	switch (hw_cfg->bst_type) {
-	case CS35L41_INT_BOOST:
-		ret = cs35l41_boost_config(cs35l41->dev, cs35l41->regmap,
-					   hw_cfg->bst_ind, hw_cfg->bst_cap, hw_cfg->bst_ipk);
-		if (ret)
-			return ret;
-		break;
-	case CS35L41_EXT_BOOST:
-	case CS35L41_EXT_BOOST_NO_VSPK_SWITCH:
-		regmap_multi_reg_write(cs35l41->regmap, cs35l41_reset_to_safe,
-				       ARRAY_SIZE(cs35l41_reset_to_safe));
-		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2, CS35L41_BST_EN_MASK,
-				   CS35L41_BST_DIS_FET_OFF << CS35L41_BST_EN_SHIFT);
-		break;
-	default:
-		dev_err(cs35l41->dev, "Boost type %d not supported\n", hw_cfg->bst_type);
-		return -EINVAL;
-	}
+	ret = cs35l41_init_boost(cs35l41->dev, cs35l41->regmap, hw_cfg);
+	if (ret)
+		return ret;
 
 	if (hw_cfg->gpio1.valid) {
 		switch (hw_cfg->gpio1.func) {
@@ -492,7 +395,7 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 	return 0;
 
 err:
-	if (cs35l41_hda_safe_reset(cs35l41))
+	if (cs35l41_safe_reset(cs35l41->regmap, cs35l41->hw_cfg.bst_type))
 		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
 	gpiod_put(cs35l41->reset_gpio);
 
@@ -506,7 +409,7 @@ void cs35l41_hda_remove(struct device *dev)
 
 	component_del(cs35l41->dev, &cs35l41_hda_comp_ops);
 
-	if (cs35l41_hda_safe_reset(cs35l41))
+	if (cs35l41_safe_reset(cs35l41->regmap, cs35l41->hw_cfg.bst_type))
 		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
 	gpiod_put(cs35l41->reset_gpio);
 }
diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index 34ba163874a6..7e9577af73b4 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -954,9 +954,8 @@ static const unsigned char cs35l41_bst_slope_table[4] = {
 	0x75, 0x6B, 0x3B, 0x28
 };
 
-
-int cs35l41_boost_config(struct device *dev, struct regmap *regmap, int boost_ind, int boost_cap,
-			 int boost_ipk)
+int cs35l41_boost_config(struct device *dev, struct regmap *regmap, int boost_ind,
+			 int boost_cap, int boost_ipk)
 {
 	unsigned char bst_lbst_val, bst_cbst_range, bst_ipk_scaled;
 	int ret;
@@ -1043,6 +1042,125 @@ int cs35l41_boost_config(struct device *dev, struct regmap *regmap, int boost_in
 }
 EXPORT_SYMBOL_GPL(cs35l41_boost_config);
 
+static const struct reg_sequence cs35l41_safe_to_reset[] = {
+	{ 0x00000040,			0x00000055 },
+	{ 0x00000040,			0x000000AA },
+	{ 0x0000393C,			0x000000C0, 6000},
+	{ 0x0000393C,			0x00000000 },
+	{ 0x00007414,			0x00C82222 },
+	{ 0x0000742C,			0x00000000 },
+	{ 0x00000040,			0x000000CC },
+	{ 0x00000040,			0x00000033 },
+};
+
+static const struct reg_sequence cs35l41_active_to_safe[] = {
+	{ 0x00000040,			0x00000055 },
+	{ 0x00000040,			0x000000AA },
+	{ 0x00007438,			0x00585941 },
+	{ CS35L41_PWR_CTRL1,		0x00000000 },
+	{ 0x0000742C,			0x00000009, 3000 },
+	{ 0x00007438,			0x00580941 },
+	{ 0x00000040,			0x000000CC },
+	{ 0x00000040,			0x00000033 },
+};
+
+static const struct reg_sequence cs35l41_safe_to_active[] = {
+	{ 0x00000040,			0x00000055 },
+	{ 0x00000040,			0x000000AA },
+	{ 0x0000742C,			0x0000000F },
+	{ 0x0000742C,			0x00000079 },
+	{ 0x00007438,			0x00585941 },
+	{ CS35L41_PWR_CTRL1,		0x00000001, 3000 }, // GLOBAL_EN = 1
+	{ 0x0000742C,			0x000000F9 },
+	{ 0x00007438,			0x00580941 },
+	{ 0x00000040,			0x000000CC },
+	{ 0x00000040,			0x00000033 },
+};
+
+static const struct reg_sequence cs35l41_reset_to_safe[] = {
+	{ 0x00000040,			0x00000055 },
+	{ 0x00000040,			0x000000AA },
+	{ 0x00007438,			0x00585941 },
+	{ 0x00007414,			0x08C82222 },
+	{ 0x0000742C,			0x00000009 },
+	{ 0x00000040,			0x000000CC },
+	{ 0x00000040,			0x00000033 },
+};
+
+int cs35l41_init_boost(struct device *dev, struct regmap *regmap,
+		       struct cs35l41_hw_cfg *hw_cfg)
+{
+	int ret;
+
+	switch (hw_cfg->bst_type) {
+	case CS35L41_INT_BOOST:
+		ret = cs35l41_boost_config(dev, regmap, hw_cfg->bst_ind,
+					   hw_cfg->bst_cap, hw_cfg->bst_ipk);
+		if (ret)
+			dev_err(dev, "Error in Boost DT config: %d\n", ret);
+		break;
+	case CS35L41_EXT_BOOST:
+	case CS35L41_EXT_BOOST_NO_VSPK_SWITCH:
+		/* Only CLSA0100 doesn't use GPIO as VSPK switch, but even on that laptop we can
+		 * toggle GPIO1 as is not connected to anything.
+		 * There will be no other device without VSPK switch.
+		 */
+		regmap_write(regmap, CS35L41_GPIO1_CTRL1, 0x00000001);
+		regmap_multi_reg_write(regmap, cs35l41_reset_to_safe,
+				       ARRAY_SIZE(cs35l41_reset_to_safe));
+		regmap_update_bits(regmap, CS35L41_PWR_CTRL2, CS35L41_BST_EN_MASK,
+				   CS35L41_BST_DIS_FET_OFF << CS35L41_BST_EN_SHIFT);
+		break;
+	default:
+		dev_err(dev, "Boost type %d not supported\n", hw_cfg->bst_type);
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cs35l41_init_boost);
+
+bool cs35l41_safe_reset(struct regmap *regmap, enum cs35l41_boost_type b_type)
+{
+	switch (b_type) {
+	/* There is only one laptop that doesn't have VSPK switch. */
+	case CS35L41_EXT_BOOST_NO_VSPK_SWITCH:
+		return false;
+	case CS35L41_EXT_BOOST:
+		regmap_write(regmap, CS35L41_GPIO1_CTRL1, 0x00000001);
+		regmap_multi_reg_write(regmap, cs35l41_safe_to_reset,
+				       ARRAY_SIZE(cs35l41_safe_to_reset));
+		return true;
+	default:
+		return true;
+	}
+}
+EXPORT_SYMBOL_GPL(cs35l41_safe_reset);
+
+void cs35l41_global_enable(struct regmap *regmap, enum cs35l41_boost_type b_type, int enable)
+{
+	switch (b_type) {
+	case CS35L41_INT_BOOST:
+		regmap_update_bits(regmap, CS35L41_PWR_CTRL1, CS35L41_GLOBAL_EN_MASK,
+				   enable << CS35L41_GLOBAL_EN_SHIFT);
+		usleep_range(3000, 3100);
+		break;
+	case CS35L41_EXT_BOOST:
+	case CS35L41_EXT_BOOST_NO_VSPK_SWITCH:
+		if (enable)
+			regmap_multi_reg_write(regmap, cs35l41_safe_to_active,
+					       ARRAY_SIZE(cs35l41_safe_to_active));
+		else
+			regmap_multi_reg_write(regmap, cs35l41_active_to_safe,
+					       ARRAY_SIZE(cs35l41_active_to_safe));
+		break;
+	default:
+		break;
+	}
+}
+EXPORT_SYMBOL_GPL(cs35l41_global_enable);
+
 int cs35l41_gpio_config(struct regmap *regmap, struct cs35l41_hw_cfg *hw_cfg)
 {
 	struct cs35l41_gpio_cfg *gpio1 = &hw_cfg->gpio1;
-- 
2.35.1

