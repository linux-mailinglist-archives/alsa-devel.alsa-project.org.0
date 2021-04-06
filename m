Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE2635513D
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 12:52:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49D51166F;
	Tue,  6 Apr 2021 12:51:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49D51166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617706332;
	bh=OlXryZuK20oPuR83BjGzPiukcMBU3bV3dLTrxo0XB0A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kg9A5H7fptuMlf4NKC6CTGdNtY988isnEtlQSxzBgBduoqDYYjiK3F+0ev8I5C+HQ
	 gR8p7IIqVK6TXQ1SVBRhYdZ6ZDF3F+nfsOlm0w0Fyv/lHnvPziuAslzzYbOMHnimS6
	 JxAXv3L3XIH/e1KKZ5wv3KQV1rLzPYqldPxaSt1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B955CF8032C;
	Tue,  6 Apr 2021 12:50:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47ADCF8032D; Tue,  6 Apr 2021 12:50:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from router.aksignal.cz (router.aksignal.cz [62.44.4.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44A07F80124
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 12:50:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44A07F80124
Received: from localhost (localhost [127.0.0.1])
 by router.aksignal.cz (Postfix) with ESMTP id AD5503FA39;
 Tue,  6 Apr 2021 12:50:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at router.aksignal.cz
Received: from router.aksignal.cz ([127.0.0.1])
 by localhost (router.aksignal.cz [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id uZZpSHXDFUS7; Tue,  6 Apr 2021 12:50:23 +0200 (CEST)
Received: from pc-gameroom.prchals.tk (unknown [83.240.30.185])
 (Authenticated sender: jiri.prchal@aksignal.cz)
 by router.aksignal.cz (Postfix) with ESMTPSA id D405E3FA2D;
 Tue,  6 Apr 2021 12:50:22 +0200 (CEST)
From: Jiri Prchal <jiri.prchal@aksignal.cz>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/5] SOC Codecs: TLV320AIC3X add SPI: main source code for I2C
 and SPI
Date: Tue,  6 Apr 2021 12:50:15 +0200
Message-Id: <20210406105018.59463-3-jiri.prchal@aksignal.cz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406105018.59463-1-jiri.prchal@aksignal.cz>
References: <20210406105018.59463-1-jiri.prchal@aksignal.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Jiri Prchal <jiri.prchal@aksignal.cz>, Liam Girdwood <lgirdwood@gmail.com>
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

Removed things which are in header file.
Renamed functions and removed their I2C related code.
Moved I2C code to separate file.

Signed-off-by: Jiri Prchal <jiri.prchal@aksignal.cz>
---
 sound/soc/codecs/tlv320aic3x.c | 105 +++++++++------------------------
 1 file changed, 27 insertions(+), 78 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic3x.c b/sound/soc/codecs/tlv320aic3x.c
index db1444127444..727e3cc78d88 100644
--- a/sound/soc/codecs/tlv320aic3x.c
+++ b/sound/soc/codecs/tlv320aic3x.c
@@ -82,10 +82,6 @@ struct aic3x_priv {
 	int master;
 	int gpio_reset;
 	int power;
-#define AIC3X_MODEL_3X 0
-#define AIC3X_MODEL_33 1
-#define AIC3X_MODEL_3007 2
-#define AIC3X_MODEL_3104 3
 	u16 model;
 
 	/* Selects the micbias voltage */
@@ -135,10 +131,7 @@ static bool aic3x_volatile_reg(struct device *dev, unsigned int reg)
 	}
 }
 
-static const struct regmap_config aic3x_regmap = {
-	.reg_bits = 8,
-	.val_bits = 8,
-
+const struct regmap_config aic3x_regmap_config = {
 	.max_register = DAC_ICC_ADJ,
 	.reg_defaults = aic3x_reg,
 	.num_reg_defaults = ARRAY_SIZE(aic3x_reg),
@@ -147,6 +140,7 @@ static const struct regmap_config aic3x_regmap = {
 
 	.cache_type = REGCACHE_RBTREE,
 };
+EXPORT_SYMBOL(aic3x_regmap_config);
 
 #define SOC_DAPM_SINGLE_AIC3X(xname, reg, shift, mask, invert) \
 	SOC_SINGLE_EXT(xname, reg, shift, mask, invert, \
@@ -1614,7 +1608,7 @@ static bool aic3x_is_shared_reset(struct aic3x_priv *aic3x)
 	return false;
 }
 
-static int aic3x_probe(struct snd_soc_component *component)
+static int aic3x_component_probe(struct snd_soc_component *component)
 {
 	struct aic3x_priv *aic3x = snd_soc_component_get_drvdata(component);
 	int ret, i;
@@ -1693,7 +1687,7 @@ static int aic3x_probe(struct snd_soc_component *component)
 
 static const struct snd_soc_component_driver soc_component_dev_aic3x = {
 	.set_bias_level		= aic3x_set_bias_level,
-	.probe			= aic3x_probe,
+	.probe			= aic3x_component_probe,
 	.controls		= aic3x_snd_controls,
 	.num_controls		= ARRAY_SIZE(aic3x_snd_controls),
 	.dapm_widgets		= aic3x_dapm_widgets,
@@ -1705,10 +1699,9 @@ static const struct snd_soc_component_driver soc_component_dev_aic3x = {
 	.non_legacy_dai_naming	= 1,
 };
 
-static void aic3x_configure_ocmv(struct i2c_client *client)
+static void aic3x_configure_ocmv(struct device *dev, struct aic3x_priv *aic3x)
 {
-	struct device_node *np = client->dev.of_node;
-	struct aic3x_priv *aic3x = i2c_get_clientdata(client);
+	struct device_node *np = dev->of_node;
 	u32 value;
 	int dvdd, avdd;
 
@@ -1724,7 +1717,7 @@ static void aic3x_configure_ocmv(struct i2c_client *client)
 	avdd = regulator_get_voltage(aic3x->supplies[2].consumer);
 
 	if (avdd > 3600000 || dvdd > 1950000) {
-		dev_warn(&client->dev,
+		dev_warn(dev,
 			 "Too high supply voltage(s) AVDD: %d, DVDD: %d\n",
 			 avdd, dvdd);
 	} else if (avdd == 3600000 && dvdd == 1950000) {
@@ -1736,26 +1729,12 @@ static void aic3x_configure_ocmv(struct i2c_client *client)
 	} else if (avdd >= 2700000 && dvdd >= 1525000) {
 		aic3x->ocmv = HPOUT_SC_OCMV_1_35V;
 	} else {
-		dev_warn(&client->dev,
+		dev_warn(dev,
 			 "Invalid supply voltage(s) AVDD: %d, DVDD: %d\n",
 			 avdd, dvdd);
 	}
 }
 
-/*
- * AIC3X 2 wire address can be up to 4 devices with device addresses
- * 0x18, 0x19, 0x1A, 0x1B
- */
-
-static const struct i2c_device_id aic3x_i2c_id[] = {
-	{ "tlv320aic3x", AIC3X_MODEL_3X },
-	{ "tlv320aic33", AIC3X_MODEL_33 },
-	{ "tlv320aic3007", AIC3X_MODEL_3007 },
-	{ "tlv320aic3106", AIC3X_MODEL_3X },
-	{ "tlv320aic3104", AIC3X_MODEL_3104 },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, aic3x_i2c_id);
 
 static const struct reg_sequence aic3007_class_d[] = {
 	/* Class-D speaker driver init; datasheet p. 46 */
@@ -1767,25 +1746,20 @@ static const struct reg_sequence aic3007_class_d[] = {
 	{ AIC3X_PAGE_SELECT, 0x00 },
 };
 
-/*
- * If the i2c layer weren't so broken, we could pass this kind of data
- * around
- */
-static int aic3x_i2c_probe(struct i2c_client *i2c,
-			   const struct i2c_device_id *id)
+int aic3x_probe(struct device *dev, struct regmap *regmap, kernel_ulong_t driver_data)
 {
-	struct aic3x_pdata *pdata = i2c->dev.platform_data;
+	struct aic3x_pdata *pdata = dev->platform_data;
 	struct aic3x_priv *aic3x;
 	struct aic3x_setup_data *ai3x_setup;
-	struct device_node *np = i2c->dev.of_node;
+	struct device_node *np = dev->of_node;
 	int ret, i;
 	u32 value;
 
-	aic3x = devm_kzalloc(&i2c->dev, sizeof(struct aic3x_priv), GFP_KERNEL);
+	aic3x = devm_kzalloc(dev, sizeof(struct aic3x_priv), GFP_KERNEL);
 	if (!aic3x)
 		return -ENOMEM;
 
-	aic3x->regmap = devm_regmap_init_i2c(i2c, &aic3x_regmap);
+	aic3x->regmap = regmap;
 	if (IS_ERR(aic3x->regmap)) {
 		ret = PTR_ERR(aic3x->regmap);
 		return ret;
@@ -1793,14 +1767,13 @@ static int aic3x_i2c_probe(struct i2c_client *i2c,
 
 	regcache_cache_only(aic3x->regmap, true);
 
-	i2c_set_clientdata(i2c, aic3x);
+	dev_set_drvdata(dev, aic3x);
 	if (pdata) {
 		aic3x->gpio_reset = pdata->gpio_reset;
 		aic3x->setup = pdata->setup;
 		aic3x->micbias_vg = pdata->micbias_vg;
 	} else if (np) {
-		ai3x_setup = devm_kzalloc(&i2c->dev, sizeof(*ai3x_setup),
-								GFP_KERNEL);
+		ai3x_setup = devm_kzalloc(dev, sizeof(*ai3x_setup), GFP_KERNEL);
 		if (!ai3x_setup)
 			return -ENOMEM;
 
@@ -1810,7 +1783,7 @@ static int aic3x_i2c_probe(struct i2c_client *i2c,
 		} else {
 			ret = of_get_named_gpio(np, "gpio-reset", 0);
 			if (ret > 0) {
-				dev_warn(&i2c->dev, "Using deprecated property \"gpio-reset\", please update your DT");
+				dev_warn(dev, "Using deprecated property \"gpio-reset\", please update your DT");
 				aic3x->gpio_reset = ret;
 			} else {
 				aic3x->gpio_reset = -1;
@@ -1835,7 +1808,7 @@ static int aic3x_i2c_probe(struct i2c_client *i2c,
 				break;
 			default :
 				aic3x->micbias_vg = AIC3X_MICBIAS_OFF;
-				dev_err(&i2c->dev, "Unsuitable MicBias voltage "
+				dev_err(dev, "Unsuitable MicBias voltage "
 							"found in DT\n");
 			}
 		} else {
@@ -1846,7 +1819,7 @@ static int aic3x_i2c_probe(struct i2c_client *i2c,
 		aic3x->gpio_reset = -1;
 	}
 
-	aic3x->model = id->driver_data;
+	aic3x->model = driver_data;
 
 	if (gpio_is_valid(aic3x->gpio_reset) &&
 	    !aic3x_is_shared_reset(aic3x)) {
@@ -1859,25 +1832,24 @@ static int aic3x_i2c_probe(struct i2c_client *i2c,
 	for (i = 0; i < ARRAY_SIZE(aic3x->supplies); i++)
 		aic3x->supplies[i].supply = aic3x_supply_names[i];
 
-	ret = devm_regulator_bulk_get(&i2c->dev, ARRAY_SIZE(aic3x->supplies),
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(aic3x->supplies),
 				      aic3x->supplies);
 	if (ret != 0) {
-		dev_err(&i2c->dev, "Failed to request supplies: %d\n", ret);
+		dev_err(dev, "Failed to request supplies: %d\n", ret);
 		goto err_gpio;
 	}
 
-	aic3x_configure_ocmv(i2c);
+	aic3x_configure_ocmv(dev, aic3x);
 
 	if (aic3x->model == AIC3X_MODEL_3007) {
 		ret = regmap_register_patch(aic3x->regmap, aic3007_class_d,
 					    ARRAY_SIZE(aic3007_class_d));
 		if (ret != 0)
-			dev_err(&i2c->dev, "Failed to init class D: %d\n",
+			dev_err(dev, "Failed to init class D: %d\n",
 				ret);
 	}
 
-	ret = devm_snd_soc_register_component(&i2c->dev,
-			&soc_component_dev_aic3x, &aic3x_dai, 1);
+	ret = devm_snd_soc_register_component(dev, &soc_component_dev_aic3x, &aic3x_dai, 1);
 
 	if (ret != 0)
 		goto err_gpio;
@@ -1894,10 +1866,11 @@ static int aic3x_i2c_probe(struct i2c_client *i2c,
 err:
 	return ret;
 }
+EXPORT_SYMBOL(aic3x_probe);
 
-static int aic3x_i2c_remove(struct i2c_client *client)
+int aic3x_remove(struct device *dev)
 {
-	struct aic3x_priv *aic3x = i2c_get_clientdata(client);
+	struct aic3x_priv *aic3x = dev_get_drvdata(dev);
 
 	list_del(&aic3x->list);
 
@@ -1908,31 +1881,7 @@ static int aic3x_i2c_remove(struct i2c_client *client)
 	}
 	return 0;
 }
-
-#if defined(CONFIG_OF)
-static const struct of_device_id tlv320aic3x_of_match[] = {
-	{ .compatible = "ti,tlv320aic3x", },
-	{ .compatible = "ti,tlv320aic33" },
-	{ .compatible = "ti,tlv320aic3007" },
-	{ .compatible = "ti,tlv320aic3106" },
-	{ .compatible = "ti,tlv320aic3104" },
-	{},
-};
-MODULE_DEVICE_TABLE(of, tlv320aic3x_of_match);
-#endif
-
-/* machine i2c codec control layer */
-static struct i2c_driver aic3x_i2c_driver = {
-	.driver = {
-		.name = "tlv320aic3x-codec",
-		.of_match_table = of_match_ptr(tlv320aic3x_of_match),
-	},
-	.probe	= aic3x_i2c_probe,
-	.remove = aic3x_i2c_remove,
-	.id_table = aic3x_i2c_id,
-};
-
-module_i2c_driver(aic3x_i2c_driver);
+EXPORT_SYMBOL(aic3x_remove);
 
 MODULE_DESCRIPTION("ASoC TLV320AIC3X codec driver");
 MODULE_AUTHOR("Vladimir Barinov");
-- 
2.25.1

