Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BF24DC2E2
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 10:34:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93ECB190B;
	Thu, 17 Mar 2022 10:33:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93ECB190B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647509654;
	bh=4rd2kAkFBF199+T2h/99JxhaD+we5j3urdJbd8EPafs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IG8pkVPnKtlaiUAoNoeCyDyQ0wDMUU9I/7l6Q7twxSAELj4yuby5ow/LNGjrKKdJL
	 new4fBhiPCeNTctI1cxYhJpBH/ap8ZZamMNVLW/27d1A693EgFsZpqqKK6HGTQxeDj
	 3sEg18bH7ukCsN0uubT0TWtG1vvn5Js4CRbm/Fgc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DB7AF80534;
	Thu, 17 Mar 2022 10:31:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A35C5F80529; Thu, 17 Mar 2022 10:31:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A74DF8014C
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 10:31:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A74DF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="OW/GIV97"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22H5Kw4w025823;
 Thu, 17 Mar 2022 04:31:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=+0x79oIRY35Ch40WhjnDVCWyYz7xwNE/6qRLOJjSwpE=;
 b=OW/GIV97rAGNKsolSufPqRJV1CPcGRpJGI0EDWdG0vryX9XdbSrvM+Pkk36WRc796kVG
 oeqTIjebGCFqUvYebQuSL1yAXcyeM4UKW5udfX8TR/Ua/PPSLoQntV5BnbTF7mtfdkBW
 KpYrmN8QQtb6TEv7vfGRctw6TsjwgFmeQuy8JF8Tl1kwEO3lyerDEudYLhn7gE6tv6lt
 I2nBmeOgziCjE4Flo+Bs9zcNDU0xRH61q3jCxEPLpKAhGLBMcueD7yQ+Btrcz8enIdBv
 uUR6fJ4DhQGwpRPj6kOLsCjdA91w6bFsBRzhHNTqyfDAqEVWWNVEVZWAjCZP2ReongUC nA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3et5yp475e-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 17 Mar 2022 04:31:33 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 17 Mar
 2022 09:31:31 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 17 Mar 2022 09:31:31 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.64.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A1A007C;
 Thu, 17 Mar 2022 09:31:31 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v4 06/16] ALSA: hda: cs35l41: Add Boost type flag
Date: Thu, 17 Mar 2022 09:31:10 +0000
Message-ID: <20220317093120.168534-7-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220317093120.168534-1-tanureal@opensource.cirrus.com>
References: <20220317093120.168534-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: x0BaQpggNxyqiGdRWaBrjVgCiyU-Nue-
X-Proofpoint-GUID: x0BaQpggNxyqiGdRWaBrjVgCiyU-Nue-
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

Replace vspk_always_on by a enum that better characterizes the boost
type, as there is 3 types of boost hardware.
And with the new boost type other parts of the driver can better handle
the configuration of the chip.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 include/sound/cs35l41.h     |  9 ++++++--
 sound/pci/hda/cs35l41_hda.c | 43 +++++++++++++++++++++----------------
 2 files changed, 31 insertions(+), 21 deletions(-)

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index e312eb1f6e48..64d98cbd5c0e 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -725,6 +725,12 @@
 #define CS35L41_SPI_MAX_FREQ		4000000
 #define CS35L41_REGSTRIDE		4
 
+enum cs35l41_boost_type {
+	CS35L41_INT_BOOST,
+	CS35L41_EXT_BOOST,
+	CS35L41_EXT_BOOST_NO_VSPK_SWITCH,
+};
+
 enum cs35l41_clk_ids {
 	CS35L41_CLKID_SCLK = 0,
 	CS35L41_CLKID_LRCLK = 1,
@@ -768,8 +774,7 @@ struct cs35l41_hw_cfg {
 	struct cs35l41_gpio_cfg gpio2;
 	unsigned int spk_pos;
 
-	/* Don't put the AMP in reset if VSPK can not be turned off */
-	bool vspk_always_on;
+	enum cs35l41_boost_type bst_type;
 };
 
 struct cs35l41_otp_packed_element_t {
diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index f853530eb385..0dac622805c4 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -210,20 +210,30 @@ static const struct component_ops cs35l41_hda_comp_ops = {
 static int cs35l41_hda_apply_properties(struct cs35l41_hda *cs35l41)
 {
 	struct cs35l41_hw_cfg *hw_cfg = &cs35l41->hw_cfg;
-	bool internal_boost = false;
 	int ret;
 
 	if (!cs35l41->hw_cfg.valid)
 		return -EINVAL;
 
-	if (hw_cfg->vspk_always_on) {
+	switch (hw_cfg->bst_type) {
+	case CS35L41_INT_BOOST:
+		cs35l41->reg_seq = &cs35l41_hda_reg_seq_int_bst;
+		ret = cs35l41_boost_config(cs35l41->dev, cs35l41->regmap,
+					   hw_cfg->bst_ind, hw_cfg->bst_cap, hw_cfg->bst_ipk);
+		if (ret)
+			return ret;
+		break;
+	case CS35L41_EXT_BOOST:
+		cs35l41->reg_seq = &cs35l41_hda_reg_seq_ext_bst;
+		break;
+	case CS35L41_EXT_BOOST_NO_VSPK_SWITCH:
 		cs35l41->reg_seq = &cs35l41_hda_reg_seq_no_bst;
-		return 0;
+		break;
+	default:
+		dev_err(cs35l41->dev, "Boost type %d not supported\n", hw_cfg->bst_type);
+		return -EINVAL;
 	}
 
-	if (hw_cfg->bst_ind > 0 || hw_cfg->bst_cap > 0 || hw_cfg->bst_ipk > 0)
-		internal_boost = true;
-
 	if (hw_cfg->gpio1.valid) {
 		switch (hw_cfg->gpio1.func) {
 		case CS35L41_NOT_USED:
@@ -256,16 +266,6 @@ static int cs35l41_hda_apply_properties(struct cs35l41_hda *cs35l41)
 
 	cs35l41_gpio_config(cs35l41->regmap, hw_cfg);
 
-	if (internal_boost) {
-		cs35l41->reg_seq = &cs35l41_hda_reg_seq_int_bst;
-		ret = cs35l41_boost_config(cs35l41->dev, cs35l41->regmap,
-					   hw_cfg->bst_ind, hw_cfg->bst_cap, hw_cfg->bst_ipk);
-		if (ret)
-			return ret;
-	} else {
-		cs35l41->reg_seq = &cs35l41_hda_reg_seq_ext_bst;
-	}
-
 	return cs35l41_hda_channel_map(cs35l41->dev, 0, NULL, 1, &hw_cfg->spk_pos);
 }
 
@@ -363,6 +363,11 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
 	else
 		hw_cfg->bst_cap = -1;
 
+	if (hw_cfg->bst_ind > 0 || hw_cfg->bst_cap > 0 || hw_cfg->bst_ipk > 0)
+		hw_cfg->bst_type = CS35L41_INT_BOOST;
+	else
+		hw_cfg->bst_type = CS35L41_EXT_BOOST;
+
 	hw_cfg->valid = true;
 	put_device(physdev);
 
@@ -388,7 +393,7 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
 	/* check I2C address to assign the index */
 	cs35l41->index = id == 0x40 ? 0 : 1;
 	cs35l41->reset_gpio = gpiod_get_index(physdev, NULL, 0, GPIOD_OUT_HIGH);
-	cs35l41->hw_cfg.vspk_always_on = true;
+	cs35l41->hw_cfg.bst_type = CS35L41_EXT_BOOST_NO_VSPK_SWITCH;
 	cs35l41->hw_cfg.valid = true;
 	put_device(physdev);
 
@@ -515,7 +520,7 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 	return 0;
 
 err:
-	if (!cs35l41->hw_cfg.vspk_always_on)
+	if (cs35l41->hw_cfg.bst_type != CS35L41_EXT_BOOST_NO_VSPK_SWITCH)
 		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
 	gpiod_put(cs35l41->reset_gpio);
 
@@ -529,7 +534,7 @@ void cs35l41_hda_remove(struct device *dev)
 
 	component_del(cs35l41->dev, &cs35l41_hda_comp_ops);
 
-	if (!cs35l41->hw_cfg.vspk_always_on)
+	if (cs35l41->hw_cfg.bst_type != CS35L41_EXT_BOOST_NO_VSPK_SWITCH)
 		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
 	gpiod_put(cs35l41->reset_gpio);
 }
-- 
2.35.1

