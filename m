Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 333AA4FA653
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Apr 2022 11:17:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5E18189D;
	Sat,  9 Apr 2022 11:16:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5E18189D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649495838;
	bh=UesmK7L81l9rgJDTaUADsbgms5hnwZh4Bhgz4I3y+L4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=osjT01QfPMM0XaHLd+Hr4sBhfLlxX0CBiiP2Ck8wNNNNWOjeTnGlXdoeRFyzD8kBM
	 U6unQakHLvQKHAozqsElGptAxTmoG0Da9JbUs4DLUQI9KFsWBQMzzaahM6R8oFQf/t
	 Qybzah+KFCeNns8SKbBOYQTXU/ynk4pXgxBN5gHg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22A94F80570;
	Sat,  9 Apr 2022 11:13:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4735F8056F; Sat,  9 Apr 2022 11:13:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13C04F8051A
 for <alsa-devel@alsa-project.org>; Sat,  9 Apr 2022 11:13:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13C04F8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="BU7jCLKB"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.16.1.2) with ESMTP id 2399CL52024715;
 Sat, 9 Apr 2022 04:13:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=of9QB3tmkL0oOWKdhTGtzmf3Ml8UuecLfoNp3KwvfIM=;
 b=BU7jCLKBZIKnbFLNXEQOsSrt8w8HB7nnd7NbYeqPoEWvKMv92CwYmg5w+voQIV6vRZuh
 YXl9/sUws2GqloRDIOV+D27bkMN2119xyk6B6FUqqxjodP8FRXpIogP5vlkyt/0nCHms
 6E+lYVduJt/cA4QMNsFbez/DhWQxs74XozL8TgBOAn9cImX9QuuTFdsEN8akZ5PoYbID
 rM12nEMXjqECFnMTgaf0vP1QjRp/oIuxiK4h8lKTiiumGHe4gGjyG3bKmZkJ8SWGRSuD
 u2Ia/IYXY4HfC2FfI+BMukBwfLl/BvMgN5HIkZIG0EQGDpmf3whIW+DgUVVSovPp2OuI Rw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fb6py80ws-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sat, 09 Apr 2022 04:13:24 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sat, 9 Apr
 2022 10:13:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Sat, 9 Apr 2022 10:13:21 +0100
Received: from aryzen.ad.cirrus.com (unknown [198.61.64.156])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 52FA6B1A;
 Sat,  9 Apr 2022 09:13:21 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v6 13/16] ALSA: hda: cs35l41: Handle all external boost setups
 the same way
Date: Sat, 9 Apr 2022 10:13:12 +0100
Message-ID: <20220409091315.1663410-14-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220409091315.1663410-1-tanureal@opensource.cirrus.com>
References: <20220409091315.1663410-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Aqcf29RizYE2BqsmoTmDsiL_ZfymTXvu
X-Proofpoint-GUID: Aqcf29RizYE2BqsmoTmDsiL_ZfymTXvu
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

External boost enables sequences for devices with or without GPIO1 as
VSPK switch are the same if devices are put in safe mode from reset.
As a previous patch put all external boost devices into safe mode
from reset, all external boost devices can be handled in the same way
for stream open and close.

The only difference is that devices without an VSPK switch can not be
put in reset and devices with it can be put into reset if a
configuration is applied.
The function cs35l41_hda_safe_reset is created to handle the safe reset
of the chip, and as systems without VSPK switch are not supported
anymore, only the CS35L41 HDA driver should check its return.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 60 +++++++++++++++----------------------
 1 file changed, 24 insertions(+), 36 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 3294837ff606..e54b5fbb6fb5 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -32,33 +32,9 @@ static const struct reg_sequence cs35l41_hda_mute[] = {
 	{ CS35L41_AMP_DIG_VOL_CTRL,	0x0000A678 }, // AMP_VOL_PCM Mute
 };
 
-// only on amps where GPIO1 is used to control ext. VSPK switch
-static const struct reg_sequence cs35l41_start_ext_vspk[] = {
+static const struct reg_sequence cs35l41_safe_to_reset[] = {
 	{ 0x00000040,			0x00000055 },
 	{ 0x00000040,			0x000000AA },
-	{ 0x00007438,			0x00585941 },
-	{ 0x00007414,			0x08C82222 },
-	{ 0x0000742C,			0x00000009 },
-	{ 0x00011008,			0x00008001 },
-	{ 0x0000742C,			0x0000000F },
-	{ 0x0000742C,			0x00000079 },
-	{ 0x00007438,			0x00585941 },
-	{ CS35L41_PWR_CTRL1,		0x00000001, 3000}, // set GLOBAL_EN = 1
-	{ 0x0000742C,			0x000000F9 },
-	{ 0x00007438,			0x00580941 },
-	{ 0x00000040,			0x000000CC },
-	{ 0x00000040,			0x00000033 },
-};
-
-//only on amps where GPIO1 is used to control ext. VSPK switch
-static const struct reg_sequence cs35l41_stop_ext_vspk[] = {
-	{ 0x00000040,			0x00000055 },
-	{ 0x00000040,			0x000000AA },
-	{ 0x00007438,			0x00585941 },
-	{ 0x00002014,			0x00000000, 3000}, // set GLOBAL_EN = 0
-	{ 0x0000742C,			0x00000009 },
-	{ 0x00007438,			0x00580941 },
-	{ 0x00011008,			0x00000001 },
 	{ 0x0000393C,			0x000000C0, 6000},
 	{ 0x0000393C,			0x00000000 },
 	{ 0x00007414,			0x00C82222 },
@@ -73,7 +49,7 @@ static const struct reg_sequence cs35l41_safe_to_active[] = {
 	{ 0x0000742C,			0x0000000F },
 	{ 0x0000742C,			0x00000079 },
 	{ 0x00007438,			0x00585941 },
-	{ CS35L41_PWR_CTRL1,		0x00000001, 2000 }, // GLOBAL_EN = 1
+	{ CS35L41_PWR_CTRL1,		0x00000001, 3000 }, // GLOBAL_EN = 1
 	{ 0x0000742C,			0x000000F9 },
 	{ 0x00007438,			0x00580941 },
 	{ 0x00000040,			0x000000CC },
@@ -85,7 +61,7 @@ static const struct reg_sequence cs35l41_active_to_safe[] = {
 	{ 0x00000040,			0x000000AA },
 	{ 0x00007438,			0x00585941 },
 	{ CS35L41_PWR_CTRL1,		0x00000000 },
-	{ 0x0000742C,			0x00000009, 2000 },
+	{ 0x0000742C,			0x00000009, 3000 },
 	{ 0x00007438,			0x00580941 },
 	{ 0x00000040,			0x000000CC },
 	{ 0x00000040,			0x00000033 },
@@ -101,6 +77,21 @@ static const struct reg_sequence cs35l41_reset_to_safe[] = {
 	{ 0x00000040,			0x00000033 },
 };
 
+static bool cs35l41_hda_safe_reset(struct cs35l41_hda *cs35l41)
+{
+	switch (cs35l41->hw_cfg.bst_type) {
+	case CS35L41_EXT_BOOST:
+		regmap_write(cs35l41->regmap, CS35L41_GPIO1_CTRL1, 0x00000001);
+		regmap_multi_reg_write(cs35l41->regmap, cs35l41_safe_to_reset,
+				       ARRAY_SIZE(cs35l41_safe_to_reset));
+		return true;
+	case CS35L41_EXT_BOOST_NO_VSPK_SWITCH:
+		return false;
+	default:
+		return true;
+	}
+};
+
 static int cs35l41_hda_global_enable(struct cs35l41_hda *cs35l41, int enable)
 {
 	int ret;
@@ -113,13 +104,6 @@ static int cs35l41_hda_global_enable(struct cs35l41_hda *cs35l41, int enable)
 		usleep_range(3000, 3100);
 		break;
 	case CS35L41_EXT_BOOST:
-		if (enable)
-			ret = regmap_multi_reg_write(cs35l41->regmap, cs35l41_start_ext_vspk,
-						     ARRAY_SIZE(cs35l41_start_ext_vspk));
-		else
-			ret = regmap_multi_reg_write(cs35l41->regmap, cs35l41_stop_ext_vspk,
-						     ARRAY_SIZE(cs35l41_stop_ext_vspk));
-		break;
 	case CS35L41_EXT_BOOST_NO_VSPK_SWITCH:
 		if (enable)
 			ret = regmap_multi_reg_write(cs35l41->regmap, cs35l41_safe_to_active,
@@ -147,6 +131,8 @@ static void cs35l41_hda_playback_hook(struct device *dev, int action)
 		regmap_multi_reg_write(reg, cs35l41_hda_config, ARRAY_SIZE(cs35l41_hda_config));
 		ret = regmap_update_bits(reg, CS35L41_PWR_CTRL2,
 					 CS35L41_AMP_EN_MASK, 1 << CS35L41_AMP_EN_SHIFT);
+		if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST)
+			regmap_write(reg, CS35L41_GPIO1_CTRL1, 0x00008001);
 		break;
 	case HDA_GEN_PCM_ACT_PREPARE:
 		ret = cs35l41_hda_global_enable(cs35l41, 1);
@@ -158,6 +144,8 @@ static void cs35l41_hda_playback_hook(struct device *dev, int action)
 	case HDA_GEN_PCM_ACT_CLOSE:
 		ret = regmap_update_bits(reg, CS35L41_PWR_CTRL2,
 					 CS35L41_AMP_EN_MASK, 0 << CS35L41_AMP_EN_SHIFT);
+		if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST)
+			regmap_write(reg, CS35L41_GPIO1_CTRL1, 0x00000001);
 		break;
 	default:
 		dev_warn(cs35l41->dev, "Playback action not supported: %d\n", action);
@@ -517,7 +505,7 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 	return 0;
 
 err:
-	if (cs35l41->hw_cfg.bst_type != CS35L41_EXT_BOOST_NO_VSPK_SWITCH)
+	if (cs35l41_hda_safe_reset(cs35l41))
 		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
 	gpiod_put(cs35l41->reset_gpio);
 
@@ -531,7 +519,7 @@ void cs35l41_hda_remove(struct device *dev)
 
 	component_del(cs35l41->dev, &cs35l41_hda_comp_ops);
 
-	if (cs35l41->hw_cfg.bst_type != CS35L41_EXT_BOOST_NO_VSPK_SWITCH)
+	if (cs35l41_hda_safe_reset(cs35l41))
 		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
 	gpiod_put(cs35l41->reset_gpio);
 }
-- 
2.35.1

