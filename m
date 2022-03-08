Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 914D54D1EC9
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 18:21:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41D4B188F;
	Tue,  8 Mar 2022 18:20:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41D4B188F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646760091;
	bh=AkAe5U6+ReiOTDzBqX8jfenrCCKIrSz46piuY8fvuq0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ETInLbIwGnRfkEGbQ04yW4WuAnEjXukcYAIQD6thJTla3iygBsMfz7im5aRtHo86v
	 71xD8aj878kvic7s7ufkb7X5CiCDt6SO/9+dlLnydSWTXFCmJLAbgT8fDX23CUKP7X
	 sRnXKsArcynJQHrzdyLpXtujQqDPTzupeLr95zH0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 984C3F8051F;
	Tue,  8 Mar 2022 18:18:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80771F80536; Tue,  8 Mar 2022 18:17:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67875F8051A
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 18:17:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67875F8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ANLeubul"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 228FxhGW010224;
 Tue, 8 Mar 2022 11:17:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=YZyDuHRuKKqCwQ/hpNqDA4FfPTMPR6/0DkkYmPxwcOA=;
 b=ANLeubulKgixctTdKLv81M1iKzMavNZrC8iAyVE+dID+X/SgbFP6cxcutQyxvXw+EESj
 WS9d1YGu+R4LmKMENzqz2DHu2WNjCIA8j7MCSKMZRgb9fmaf/qJSqPMGeNV1e5AwGUjP
 BiobpZZ0ZF0eWPuiHfXKS1fTgMe1hFlXvzOy7t2/K2kYvxZ7Wr+6oYgVzwEINsVA423l
 C+dVJAwSGcLYsZqn65qrI82rY7qr93mqb+n9dYixZ/RtuDm2qzpQg4M6PNzt/hEgpvTP
 0zvAzTnfm7rgS4QzkSbHCy5cWEKB742H6TjN4mHvG9HLiwkr08VNx4Uu3UetdZUYGlyp SA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3em656mh5v-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 08 Mar 2022 11:17:43 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 8 Mar
 2022 17:17:33 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Tue, 8 Mar 2022 17:17:33 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.38])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6C28CB06;
 Tue,  8 Mar 2022 17:17:33 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 06/16] ALSA: hda: cs35l41: Add Boost type flag
Date: Tue, 8 Mar 2022 17:17:20 +0000
Message-ID: <20220308171730.454587-7-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308171730.454587-1-tanureal@opensource.cirrus.com>
References: <20220308171730.454587-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ZZ7JpIsQAbzm8-WIGMQorkp0Ls0IVClR
X-Proofpoint-GUID: ZZ7JpIsQAbzm8-WIGMQorkp0Ls0IVClR
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
index e3ec0f422fff..fbf38f32e36d 100644
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
@@ -762,8 +768,7 @@ struct cs35l41_hw_cfg {
 	struct cs35l41_gpio_cfg gpio2;
 	unsigned int spk_pos;
 
-	/* Don't put the AMP in reset if VSPK can not be turned off */
-	bool vspk_always_on;
+	enum cs35l41_boost_type bst_type;
 };
 
 struct cs35l41_otp_packed_element_t {
diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 4c99dcac2dd7..17660ce71f93 100644
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

