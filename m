Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA064D1E98
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 18:20:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3A8A186C;
	Tue,  8 Mar 2022 18:19:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3A8A186C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646760021;
	bh=yk/A65bP6XMjaioYYioeOpQLYRdVNTVFW3xdQDEwR8g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PosvQpuL36yxR7v7naAAmEQPrDd3sk9ATG1KKfdaCWPpXsAmZPJxM7mZSpZs5qwRU
	 qYqE8JOgIHlomsn/V6r+G+MIGG0RSCOioH9ZIEBogGPQjBvJSSIUJrh887m+326fFE
	 yl4XhSl1uPiqRjz3nMyPzr1MzETI7tHUJ01xK/0M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 873EAF8052F;
	Tue,  8 Mar 2022 18:17:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB9EEF80533; Tue,  8 Mar 2022 18:17:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CA27F80515
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 18:17:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CA27F80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="A5yAWoZ9"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 228FxhGS010224;
 Tue, 8 Mar 2022 11:17:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=QqbmQrSJrJ7Z27n59M8THR7QGWhs0ZI4bzlAymBj39k=;
 b=A5yAWoZ9912pzBtT/aLrB9Xdpchm29XQyv9J3P0UhiBsdeYzI0kSWEz006LGLGvSOq0m
 flP3ds4CrCt8XTNlu3ELaEAwLDVnNImAPyxM49D3wHQHJlLfhgDbCGHXiVv2jIvTDOK/
 TNrYYliynLyGxFMyiYX6fYTmi+jEDXv8d33QVFmENADIgvoG564Frz489PkQwnBA6n27
 JM2qgoNG6XLV57uhNOs0v3oHfgyvxZSsvhJLDSkq7RG0tIQshcfRTvsHm+V5Oz221NQ+
 JHUbXe/nWwKdCi0TvTZdGZPSt0TopWRxGltUCONknM7HeCUdTk0Nd/c16pRWdtxO7mw2 zA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3em656mh5v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 08 Mar 2022 11:17:40 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 8 Mar
 2022 17:17:31 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Tue, 8 Mar 2022 17:17:31 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.38])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9062A2A1;
 Tue,  8 Mar 2022 17:17:31 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 01/16] sound: cs35l41: Unify hardware configuration
Date: Tue, 8 Mar 2022 17:17:15 +0000
Message-ID: <20220308171730.454587-2-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308171730.454587-1-tanureal@opensource.cirrus.com>
References: <20220308171730.454587-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: w0yTM4yXg9CC7_dpiXY5EFRUt8CeE1Wm
X-Proofpoint-GUID: w0yTM4yXg9CC7_dpiXY5EFRUt8CeE1Wm
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

Both ASoC and HDA require to configure the GPIOs and Boost, so
create a single shared struct for hardware configuration.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/cs35l41.h        | 35 +++++++++----
 sound/pci/hda/cs35l41_hda.c    | 69 +++++++++++--------------
 sound/pci/hda/cs35l41_hda.h    | 13 +----
 sound/soc/codecs/cs35l41-i2c.c |  4 +-
 sound/soc/codecs/cs35l41-spi.c |  4 +-
 sound/soc/codecs/cs35l41.c     | 93 +++++++++++++++-------------------
 sound/soc/codecs/cs35l41.h     |  5 +-
 7 files changed, 102 insertions(+), 121 deletions(-)

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index bf7f9a9aeba0..262c75109c9e 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -701,9 +701,6 @@
 #define CS35L41_GPIO1_CTRL_SHIFT	16
 #define CS35L41_GPIO2_CTRL_MASK		0x07000000
 #define CS35L41_GPIO2_CTRL_SHIFT	24
-#define CS35L41_GPIO_CTRL_OPEN_INT	2
-#define CS35L41_GPIO_CTRL_ACTV_LO	4
-#define CS35L41_GPIO_CTRL_ACTV_HI	5
 #define CS35L41_GPIO_POL_MASK		0x1000
 #define CS35L41_GPIO_POL_SHIFT		12
 
@@ -735,19 +732,37 @@ enum cs35l41_clk_ids {
 	CS35L41_CLKID_MCLK = 4,
 };
 
-struct cs35l41_irq_cfg {
-	bool irq_pol_inv;
-	bool irq_out_en;
-	int irq_src_sel;
+enum cs35l41_gpio_func {
+	CS35L41_HIZ,
+	CS35L41_GPIO,
+	CS35L41_INT_OPEN_DRAIN_GPIO2,
+	CS35L41_MCLK,
+	CS35L41_INT_PUSH_PULL_LOW_GPIO2,
+	CS35L41_INT_PUSH_PULL_HIGH_GPIO2,
+	CS35L41_PDM_CLK_GPIO2,
+	CS35L41_PDM_DATA_GPIO2,
+	CS35L41_MDSYNC_GPIO1 = 2,
+	CS35L41_PDM_CLK_GPIO1 = 4,
+	CS35L41_PDM_DATA_GPIO1 = 5,
 };
 
-struct cs35l41_platform_data {
+struct cs35l41_gpio_cfg {
+	bool pol_inv;
+	bool out_en;
+	enum cs35l41_gpio_func func;
+};
+
+struct cs35l41_hw_cfg {
 	int bst_ind;
 	int bst_ipk;
 	int bst_cap;
 	int dout_hiz;
-	struct cs35l41_irq_cfg irq_config1;
-	struct cs35l41_irq_cfg irq_config2;
+	struct cs35l41_gpio_cfg gpio1;
+	struct cs35l41_gpio_cfg gpio2;
+	unsigned int spk_pos;
+
+	/* Don't put the AMP in reset if VSPK can not be turned off */
+	bool vspk_always_on;
 };
 
 struct cs35l41_otp_packed_element_t {
diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 718595380868..b79d6ad4b4f5 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -213,13 +213,13 @@ static const struct component_ops cs35l41_hda_comp_ops = {
 	.unbind = cs35l41_hda_unbind,
 };
 
-static int cs35l41_hda_apply_properties(struct cs35l41_hda *cs35l41,
-					const struct cs35l41_hda_hw_config *hw_cfg)
+static int cs35l41_hda_apply_properties(struct cs35l41_hda *cs35l41)
 {
+	struct cs35l41_hw_cfg *hw_cfg = &cs35l41->hw_cfg;
 	bool internal_boost = false;
 	int ret;
 
-	if (!hw_cfg) {
+	if (hw_cfg->vspk_always_on) {
 		cs35l41->reg_seq = &cs35l41_hda_reg_seq_no_bst;
 		return 0;
 	}
@@ -227,7 +227,7 @@ static int cs35l41_hda_apply_properties(struct cs35l41_hda *cs35l41,
 	if (hw_cfg->bst_ind || hw_cfg->bst_cap || hw_cfg->bst_ipk)
 		internal_boost = true;
 
-	switch (hw_cfg->gpio1_func) {
+	switch (hw_cfg->gpio1.func) {
 	case CS35L41_NOT_USED:
 		break;
 	case CS35l41_VSPK_SWITCH:
@@ -239,11 +239,11 @@ static int cs35l41_hda_apply_properties(struct cs35l41_hda *cs35l41,
 				   CS35L41_GPIO1_CTRL_MASK, 2 << CS35L41_GPIO1_CTRL_SHIFT);
 		break;
 	default:
-		dev_err(cs35l41->dev, "Invalid function %d for GPIO1\n", hw_cfg->gpio1_func);
+		dev_err(cs35l41->dev, "Invalid function %d for GPIO1\n", hw_cfg->gpio1.func);
 		return -EINVAL;
 	}
 
-	switch (hw_cfg->gpio2_func) {
+	switch (hw_cfg->gpio2.func) {
 	case CS35L41_NOT_USED:
 		break;
 	case CS35L41_INTERRUPT:
@@ -251,7 +251,7 @@ static int cs35l41_hda_apply_properties(struct cs35l41_hda *cs35l41,
 				   CS35L41_GPIO2_CTRL_MASK, 2 << CS35L41_GPIO2_CTRL_SHIFT);
 		break;
 	default:
-		dev_err(cs35l41->dev, "Invalid function %d for GPIO2\n", hw_cfg->gpio2_func);
+		dev_err(cs35l41->dev, "Invalid function %d for GPIO2\n", hw_cfg->gpio2.func);
 		return -EINVAL;
 	}
 
@@ -267,13 +267,12 @@ static int cs35l41_hda_apply_properties(struct cs35l41_hda *cs35l41,
 		cs35l41->reg_seq = &cs35l41_hda_reg_seq_ext_bst;
 	}
 
-	return cs35l41_hda_channel_map(cs35l41->dev, 0, NULL, 1, (unsigned int *)&hw_cfg->spk_pos);
+	return cs35l41_hda_channel_map(cs35l41->dev, 0, NULL, 1, &hw_cfg->spk_pos);
 }
 
-static struct cs35l41_hda_hw_config *cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41,
-							   const char *hid, int id)
+static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, int id)
 {
-	struct cs35l41_hda_hw_config *hw_cfg;
+	struct cs35l41_hw_cfg *hw_cfg = &cs35l41->hw_cfg;
 	u32 values[HDA_MAX_COMPONENTS];
 	struct acpi_device *adev;
 	struct device *physdev;
@@ -284,7 +283,7 @@ static struct cs35l41_hda_hw_config *cs35l41_hda_read_acpi(struct cs35l41_hda *c
 	adev = acpi_dev_get_first_match_dev(hid, NULL, -1);
 	if (!adev) {
 		dev_err(cs35l41->dev, "Failed to find an ACPI device for %s\n", hid);
-		return ERR_PTR(-ENODEV);
+		return -ENODEV;
 	}
 
 	physdev = get_device(acpi_get_first_physical_node(adev));
@@ -324,29 +323,23 @@ static struct cs35l41_hda_hw_config *cs35l41_hda_read_acpi(struct cs35l41_hda *c
 	cs35l41->reset_gpio = fwnode_gpiod_get_index(&adev->fwnode, "reset", cs35l41->index,
 						     GPIOD_OUT_LOW, "cs35l41-reset");
 
-	hw_cfg = kzalloc(sizeof(*hw_cfg), GFP_KERNEL);
-	if (!hw_cfg) {
-		ret = -ENOMEM;
-		goto err;
-	}
-
 	property = "cirrus,speaker-position";
 	ret = device_property_read_u32_array(physdev, property, values, nval);
 	if (ret)
-		goto err_free;
+		goto err;
 	hw_cfg->spk_pos = values[cs35l41->index];
 
 	property = "cirrus,gpio1-func";
 	ret = device_property_read_u32_array(physdev, property, values, nval);
 	if (ret)
-		goto err_free;
-	hw_cfg->gpio1_func = values[cs35l41->index];
+		goto err;
+	hw_cfg->gpio1.func = values[cs35l41->index];
 
 	property = "cirrus,gpio2-func";
 	ret = device_property_read_u32_array(physdev, property, values, nval);
 	if (ret)
-		goto err_free;
-	hw_cfg->gpio2_func = values[cs35l41->index];
+		goto err;
+	hw_cfg->gpio2.func = values[cs35l41->index];
 
 	property = "cirrus,boost-peak-milliamp";
 	ret = device_property_read_u32_array(physdev, property, values, nval);
@@ -365,15 +358,13 @@ static struct cs35l41_hda_hw_config *cs35l41_hda_read_acpi(struct cs35l41_hda *c
 
 	put_device(physdev);
 
-	return hw_cfg;
+	return 0;
 
-err_free:
-	kfree(hw_cfg);
 err:
 	put_device(physdev);
 	dev_err(cs35l41->dev, "Failed property %s: %d\n", property, ret);
 
-	return ERR_PTR(ret);
+	return ret;
 
 no_acpi_dsd:
 	/*
@@ -384,22 +375,21 @@ static struct cs35l41_hda_hw_config *cs35l41_hda_read_acpi(struct cs35l41_hda *c
 	 * fwnode.
 	 */
 	if (strncmp(hid, "CLSA0100", 8) != 0)
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 
 	/* check I2C address to assign the index */
 	cs35l41->index = id == 0x40 ? 0 : 1;
 	cs35l41->reset_gpio = gpiod_get_index(physdev, NULL, 0, GPIOD_OUT_HIGH);
-	cs35l41->vspk_always_on = true;
+	cs35l41->hw_cfg.vspk_always_on = true;
 	put_device(physdev);
 
-	return NULL;
+	return 0;
 }
 
 int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int irq,
 		      struct regmap *regmap)
 {
 	unsigned int int_sts, regid, reg_revid, mtl_revid, chipid, int_status;
-	struct cs35l41_hda_hw_config *acpi_hw_cfg;
 	struct cs35l41_hda *cs35l41;
 	int ret;
 
@@ -415,9 +405,11 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 	cs35l41->regmap = regmap;
 	dev_set_drvdata(dev, cs35l41);
 
-	acpi_hw_cfg = cs35l41_hda_read_acpi(cs35l41, device_name, id);
-	if (IS_ERR(acpi_hw_cfg))
-		return PTR_ERR(acpi_hw_cfg);
+	ret = cs35l41_hda_read_acpi(cs35l41, device_name, id);
+	if (ret) {
+		dev_err_probe(cs35l41->dev, ret, "Platform not supported %d\n", ret);
+		return ret;
+	}
 
 	if (IS_ERR(cs35l41->reset_gpio)) {
 		ret = PTR_ERR(cs35l41->reset_gpio);
@@ -490,11 +482,9 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 	if (ret)
 		goto err;
 
-	ret = cs35l41_hda_apply_properties(cs35l41, acpi_hw_cfg);
+	ret = cs35l41_hda_apply_properties(cs35l41);
 	if (ret)
 		goto err;
-	kfree(acpi_hw_cfg);
-	acpi_hw_cfg = NULL;
 
 	if (cs35l41->reg_seq->probe) {
 		ret = regmap_multi_reg_write(cs35l41->regmap, cs35l41->reg_seq->probe,
@@ -516,8 +506,7 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 	return 0;
 
 err:
-	kfree(acpi_hw_cfg);
-	if (!cs35l41->vspk_always_on)
+	if (!cs35l41->hw_cfg.vspk_always_on)
 		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
 	gpiod_put(cs35l41->reset_gpio);
 
@@ -531,7 +520,7 @@ void cs35l41_hda_remove(struct device *dev)
 
 	component_del(cs35l41->dev, &cs35l41_hda_comp_ops);
 
-	if (!cs35l41->vspk_always_on)
+	if (!cs35l41->hw_cfg.vspk_always_on)
 		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
 	gpiod_put(cs35l41->reset_gpio);
 }
diff --git a/sound/pci/hda/cs35l41_hda.h b/sound/pci/hda/cs35l41_hda.h
index 74951001501c..17f10764f174 100644
--- a/sound/pci/hda/cs35l41_hda.h
+++ b/sound/pci/hda/cs35l41_hda.h
@@ -40,26 +40,15 @@ struct cs35l41_hda_reg_sequence {
 	unsigned int num_close;
 };
 
-struct cs35l41_hda_hw_config {
-	unsigned int spk_pos;
-	unsigned int gpio1_func;
-	unsigned int gpio2_func;
-	int bst_ind;
-	int bst_ipk;
-	int bst_cap;
-};
-
 struct cs35l41_hda {
 	struct device *dev;
 	struct regmap *regmap;
 	struct gpio_desc *reset_gpio;
 	const struct cs35l41_hda_reg_sequence *reg_seq;
+	struct cs35l41_hw_cfg hw_cfg;
 
 	int irq;
 	int index;
-
-	/* Don't put the AMP in reset of VSPK can not be turned off */
-	bool vspk_always_on;
 };
 
 int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int irq,
diff --git a/sound/soc/codecs/cs35l41-i2c.c b/sound/soc/codecs/cs35l41-i2c.c
index faad5c638cb8..5ff0f00a2de4 100644
--- a/sound/soc/codecs/cs35l41-i2c.c
+++ b/sound/soc/codecs/cs35l41-i2c.c
@@ -34,7 +34,7 @@ static int cs35l41_i2c_probe(struct i2c_client *client,
 {
 	struct cs35l41_private *cs35l41;
 	struct device *dev = &client->dev;
-	struct cs35l41_platform_data *pdata = dev_get_platdata(dev);
+	struct cs35l41_hw_cfg *hw_cfg = dev_get_platdata(dev);
 	const struct regmap_config *regmap_config = &cs35l41_regmap_i2c;
 	int ret;
 
@@ -54,7 +54,7 @@ static int cs35l41_i2c_probe(struct i2c_client *client,
 		return ret;
 	}
 
-	return cs35l41_probe(cs35l41, pdata);
+	return cs35l41_probe(cs35l41, hw_cfg);
 }
 
 static int cs35l41_i2c_remove(struct i2c_client *client)
diff --git a/sound/soc/codecs/cs35l41-spi.c b/sound/soc/codecs/cs35l41-spi.c
index 169221a5b09f..9e19c946a66b 100644
--- a/sound/soc/codecs/cs35l41-spi.c
+++ b/sound/soc/codecs/cs35l41-spi.c
@@ -30,7 +30,7 @@ MODULE_DEVICE_TABLE(spi, cs35l41_id_spi);
 static int cs35l41_spi_probe(struct spi_device *spi)
 {
 	const struct regmap_config *regmap_config = &cs35l41_regmap_spi;
-	struct cs35l41_platform_data *pdata = dev_get_platdata(&spi->dev);
+	struct cs35l41_hw_cfg *hw_cfg = dev_get_platdata(&spi->dev);
 	struct cs35l41_private *cs35l41;
 	int ret;
 
@@ -52,7 +52,7 @@ static int cs35l41_spi_probe(struct spi_device *spi)
 	cs35l41->dev = &spi->dev;
 	cs35l41->irq = spi->irq;
 
-	return cs35l41_probe(cs35l41, pdata);
+	return cs35l41_probe(cs35l41, hw_cfg);
 }
 
 static void cs35l41_spi_remove(struct spi_device *spi)
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 6b784a62df0c..67b33c5c3d44 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -999,10 +999,10 @@ static int cs35l41_set_pdata(struct cs35l41_private *cs35l41)
 
 	/* Set Platform Data */
 	/* Required */
-	if (cs35l41->pdata.bst_ipk &&
-	    cs35l41->pdata.bst_ind && cs35l41->pdata.bst_cap) {
-		ret = cs35l41_boost_config(cs35l41->dev, cs35l41->regmap, cs35l41->pdata.bst_ind,
-					   cs35l41->pdata.bst_cap, cs35l41->pdata.bst_ipk);
+	if (cs35l41->hw_cfg.bst_ipk &&
+	    cs35l41->hw_cfg.bst_ind && cs35l41->hw_cfg.bst_cap) {
+		ret = cs35l41_boost_config(cs35l41->dev, cs35l41->regmap, cs35l41->hw_cfg.bst_ind,
+					   cs35l41->hw_cfg.bst_cap, cs35l41->hw_cfg.bst_ipk);
 		if (ret) {
 			dev_err(cs35l41->dev, "Error in Boost DT config: %d\n", ret);
 			return ret;
@@ -1013,43 +1013,39 @@ static int cs35l41_set_pdata(struct cs35l41_private *cs35l41)
 	}
 
 	/* Optional */
-	if (cs35l41->pdata.dout_hiz <= CS35L41_ASP_DOUT_HIZ_MASK &&
-	    cs35l41->pdata.dout_hiz >= 0)
-		regmap_update_bits(cs35l41->regmap, CS35L41_SP_HIZ_CTRL,
-				   CS35L41_ASP_DOUT_HIZ_MASK,
-				   cs35l41->pdata.dout_hiz);
+	if (cs35l41->hw_cfg.dout_hiz <= CS35L41_ASP_DOUT_HIZ_MASK &&
+	    cs35l41->hw_cfg.dout_hiz >= 0)
+		regmap_update_bits(cs35l41->regmap, CS35L41_SP_HIZ_CTRL, CS35L41_ASP_DOUT_HIZ_MASK,
+				   cs35l41->hw_cfg.dout_hiz);
 
 	return 0;
 }
 
-static int cs35l41_irq_gpio_config(struct cs35l41_private *cs35l41)
+static int cs35l41_gpio_config(struct cs35l41_private *cs35l41)
 {
-	struct cs35l41_irq_cfg *irq_gpio_cfg1 = &cs35l41->pdata.irq_config1;
-	struct cs35l41_irq_cfg *irq_gpio_cfg2 = &cs35l41->pdata.irq_config2;
+	struct cs35l41_gpio_cfg *gpio1 = &cs35l41->hw_cfg.gpio1;
+	struct cs35l41_gpio_cfg *gpio2 = &cs35l41->hw_cfg.gpio2;
 	int irq_pol = IRQF_TRIGGER_NONE;
 
 	regmap_update_bits(cs35l41->regmap, CS35L41_GPIO1_CTRL1,
 			   CS35L41_GPIO_POL_MASK | CS35L41_GPIO_DIR_MASK,
-			   irq_gpio_cfg1->irq_pol_inv << CS35L41_GPIO_POL_SHIFT |
-			   !irq_gpio_cfg1->irq_out_en << CS35L41_GPIO_DIR_SHIFT);
+			   gpio1->pol_inv << CS35L41_GPIO_POL_SHIFT |
+			   !gpio1->out_en << CS35L41_GPIO_DIR_SHIFT);
 
 	regmap_update_bits(cs35l41->regmap, CS35L41_GPIO2_CTRL1,
 			   CS35L41_GPIO_POL_MASK | CS35L41_GPIO_DIR_MASK,
-			   irq_gpio_cfg2->irq_pol_inv << CS35L41_GPIO_POL_SHIFT |
-			   !irq_gpio_cfg2->irq_out_en << CS35L41_GPIO_DIR_SHIFT);
+			   gpio2->pol_inv << CS35L41_GPIO_POL_SHIFT |
+			   !gpio2->out_en << CS35L41_GPIO_DIR_SHIFT);
 
 	regmap_update_bits(cs35l41->regmap, CS35L41_GPIO_PAD_CONTROL,
 			   CS35L41_GPIO1_CTRL_MASK | CS35L41_GPIO2_CTRL_MASK,
-			   irq_gpio_cfg1->irq_src_sel << CS35L41_GPIO1_CTRL_SHIFT |
-			   irq_gpio_cfg2->irq_src_sel << CS35L41_GPIO2_CTRL_SHIFT);
+			   gpio1->func << CS35L41_GPIO1_CTRL_SHIFT |
+			   gpio2->func << CS35L41_GPIO2_CTRL_SHIFT);
 
-	if ((irq_gpio_cfg2->irq_src_sel ==
-			(CS35L41_GPIO_CTRL_ACTV_LO | CS35L41_VALID_PDATA)) ||
-		(irq_gpio_cfg2->irq_src_sel ==
-			(CS35L41_GPIO_CTRL_OPEN_INT | CS35L41_VALID_PDATA)))
+	if ((gpio2->func == (CS35L41_INT_PUSH_PULL_LOW_GPIO2 | CS35L41_VALID_PDATA)) ||
+		(gpio2->func == (CS35L41_INT_OPEN_DRAIN_GPIO2 | CS35L41_VALID_PDATA)))
 		irq_pol = IRQF_TRIGGER_LOW;
-	else if (irq_gpio_cfg2->irq_src_sel ==
-			(CS35L41_GPIO_CTRL_ACTV_HI | CS35L41_VALID_PDATA))
+	else if (gpio2->func == (CS35L41_INT_PUSH_PULL_HIGH_GPIO2 | CS35L41_VALID_PDATA))
 		irq_pol = IRQF_TRIGGER_HIGH;
 
 	return irq_pol;
@@ -1115,50 +1111,44 @@ static const struct snd_soc_component_driver soc_component_dev_cs35l41 = {
 	.set_sysclk = cs35l41_component_set_sysclk,
 };
 
-static int cs35l41_handle_pdata(struct device *dev, struct cs35l41_platform_data *pdata)
+static int cs35l41_handle_pdata(struct device *dev, struct cs35l41_hw_cfg *hw_cfg)
 {
-	struct cs35l41_irq_cfg *irq_gpio1_config = &pdata->irq_config1;
-	struct cs35l41_irq_cfg *irq_gpio2_config = &pdata->irq_config2;
+	struct cs35l41_gpio_cfg *gpio1 = &hw_cfg->gpio1;
+	struct cs35l41_gpio_cfg *gpio2 = &hw_cfg->gpio2;
 	unsigned int val;
 	int ret;
 
 	ret = device_property_read_u32(dev, "cirrus,boost-peak-milliamp", &val);
 	if (ret >= 0)
-		pdata->bst_ipk = val;
+		hw_cfg->bst_ipk = val;
 
 	ret = device_property_read_u32(dev, "cirrus,boost-ind-nanohenry", &val);
 	if (ret >= 0)
-		pdata->bst_ind = val;
+		hw_cfg->bst_ind = val;
 
 	ret = device_property_read_u32(dev, "cirrus,boost-cap-microfarad", &val);
 	if (ret >= 0)
-		pdata->bst_cap = val;
+		hw_cfg->bst_cap = val;
 
 	ret = device_property_read_u32(dev, "cirrus,asp-sdout-hiz", &val);
 	if (ret >= 0)
-		pdata->dout_hiz = val;
+		hw_cfg->dout_hiz = val;
 	else
-		pdata->dout_hiz = -1;
+		hw_cfg->dout_hiz = -1;
 
 	/* GPIO1 Pin Config */
-	irq_gpio1_config->irq_pol_inv = device_property_read_bool(dev,
-					"cirrus,gpio1-polarity-invert");
-	irq_gpio1_config->irq_out_en = device_property_read_bool(dev,
-					"cirrus,gpio1-output-enable");
-	ret = device_property_read_u32(dev, "cirrus,gpio1-src-select",
-				       &val);
+	gpio1->pol_inv = device_property_read_bool(dev, "cirrus,gpio1-polarity-invert");
+	gpio1->out_en = device_property_read_bool(dev, "cirrus,gpio1-output-enable");
+	ret = device_property_read_u32(dev, "cirrus,gpio1-src-select", &val);
 	if (ret >= 0)
-		irq_gpio1_config->irq_src_sel = val | CS35L41_VALID_PDATA;
+		gpio1->func = val | CS35L41_VALID_PDATA;
 
 	/* GPIO2 Pin Config */
-	irq_gpio2_config->irq_pol_inv = device_property_read_bool(dev,
-					"cirrus,gpio2-polarity-invert");
-	irq_gpio2_config->irq_out_en = device_property_read_bool(dev,
-					"cirrus,gpio2-output-enable");
-	ret = device_property_read_u32(dev, "cirrus,gpio2-src-select",
-				       &val);
+	gpio2->pol_inv = device_property_read_bool(dev, "cirrus,gpio2-polarity-invert");
+	gpio2->out_en = device_property_read_bool(dev, "cirrus,gpio2-output-enable");
+	ret = device_property_read_u32(dev, "cirrus,gpio2-src-select", &val);
 	if (ret >= 0)
-		irq_gpio2_config->irq_src_sel = val | CS35L41_VALID_PDATA;
+		gpio2->func = val | CS35L41_VALID_PDATA;
 
 	return 0;
 }
@@ -1248,17 +1238,16 @@ static int cs35l41_dsp_init(struct cs35l41_private *cs35l41)
 	return ret;
 }
 
-int cs35l41_probe(struct cs35l41_private *cs35l41,
-		  struct cs35l41_platform_data *pdata)
+int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *hw_cfg)
 {
 	u32 regid, reg_revid, i, mtl_revid, int_status, chipid_match;
 	int irq_pol = 0;
 	int ret;
 
-	if (pdata) {
-		cs35l41->pdata = *pdata;
+	if (hw_cfg) {
+		cs35l41->hw_cfg = *hw_cfg;
 	} else {
-		ret = cs35l41_handle_pdata(cs35l41->dev, &cs35l41->pdata);
+		ret = cs35l41_handle_pdata(cs35l41->dev, &cs35l41->hw_cfg);
 		if (ret != 0)
 			return ret;
 	}
@@ -1357,7 +1346,7 @@ int cs35l41_probe(struct cs35l41_private *cs35l41,
 
 	cs35l41_test_key_lock(cs35l41->dev, cs35l41->regmap);
 
-	irq_pol = cs35l41_irq_gpio_config(cs35l41);
+	irq_pol = cs35l41_gpio_config(cs35l41);
 
 	/* Set interrupt masks for critical errors */
 	regmap_write(cs35l41->regmap, CS35L41_IRQ1_MASK1,
diff --git a/sound/soc/codecs/cs35l41.h b/sound/soc/codecs/cs35l41.h
index 88a3d6e3434f..e3369e0aa89f 100644
--- a/sound/soc/codecs/cs35l41.h
+++ b/sound/soc/codecs/cs35l41.h
@@ -44,7 +44,7 @@ enum cs35l41_cspl_mbox_cmd {
 struct cs35l41_private {
 	struct wm_adsp dsp; /* needs to be first member */
 	struct snd_soc_codec *codec;
-	struct cs35l41_platform_data pdata;
+	struct cs35l41_hw_cfg hw_cfg;
 	struct device *dev;
 	struct regmap *regmap;
 	struct regulator_bulk_data supplies[CS35L41_NUM_SUPPLIES];
@@ -53,8 +53,7 @@ struct cs35l41_private {
 	struct gpio_desc *reset_gpio;
 };
 
-int cs35l41_probe(struct cs35l41_private *cs35l41,
-		  struct cs35l41_platform_data *pdata);
+int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *hw_cfg);
 void cs35l41_remove(struct cs35l41_private *cs35l41);
 
 #endif /*__CS35L41_H__*/
-- 
2.35.1

