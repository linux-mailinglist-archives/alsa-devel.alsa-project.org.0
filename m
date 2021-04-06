Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9025135569B
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 16:27:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22E1F1616;
	Tue,  6 Apr 2021 16:26:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22E1F1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617719246;
	bh=5oN4zteY599kOa/JVPKPiTuNaKyrAsnz8sTzu2b1OOU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iWYj8dkPQx2SNXa7jpBxTq8T/5/0TUF8Umnj23E9fIkJfbNZ2x24P5iivch+gKVEC
	 aF5AzYjpQ615J+SkHKtg1WlPW7w1Iw5Kulc0rKAmKbtc86xWJuy6tqd+5h/Jmq9e2L
	 5QjewSagyLFe64O/poaI0gj8IOe+H32x7awP/Gvo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7CE6F80430;
	Tue,  6 Apr 2021 16:25:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADC45F80169; Tue,  6 Apr 2021 16:25:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from router.aksignal.cz (router.aksignal.cz [62.44.4.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98B30F80249
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 16:24:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98B30F80249
Received: from localhost (localhost [127.0.0.1])
 by router.aksignal.cz (Postfix) with ESMTP id 7B78A3FA37;
 Tue,  6 Apr 2021 16:24:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at router.aksignal.cz
Received: from router.aksignal.cz ([127.0.0.1])
 by localhost (router.aksignal.cz [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id cRKgoIiqcwsP; Tue,  6 Apr 2021 16:24:44 +0200 (CEST)
Received: from pc-gameroom.prchals.tk (unknown [83.240.30.185])
 (Authenticated sender: jiri.prchal@aksignal.cz)
 by router.aksignal.cz (Postfix) with ESMTPSA id 91F193FA31;
 Tue,  6 Apr 2021 16:24:43 +0200 (CEST)
From: Jiri Prchal <jiri.prchal@aksignal.cz>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/4] ASoC: codecs: tlv320aic3x: move I2C to separated file
Date: Tue,  6 Apr 2021 16:24:38 +0200
Message-Id: <20210406142439.102396-4-jiri.prchal@aksignal.cz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406142439.102396-1-jiri.prchal@aksignal.cz>
References: <20210406142439.102396-1-jiri.prchal@aksignal.cz>
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

Moved I2C related staff to separated source file.

Signed-off-by: Jiri Prchal <jiri.prchal@aksignal.cz>
---
 sound/soc/codecs/Kconfig           |   9 ++-
 sound/soc/codecs/Makefile          |   2 +
 sound/soc/codecs/tlv320aic3x-i2c.c |  70 ++++++++++++++++++++
 sound/soc/codecs/tlv320aic3x.c     | 100 ++++++++---------------------
 sound/soc/codecs/tlv320aic3x.h     |   7 ++
 5 files changed, 112 insertions(+), 76 deletions(-)
 create mode 100644 sound/soc/codecs/tlv320aic3x-i2c.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 1c87b42606c9..7f6a9b22c261 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -214,7 +214,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_TLV320AIC31XX
 	imply SND_SOC_TLV320AIC32X4_I2C
 	imply SND_SOC_TLV320AIC32X4_SPI
-	imply SND_SOC_TLV320AIC3X
+	imply SND_SOC_TLV320AIC3X_I2C
 	imply SND_SOC_TPA6130A2
 	imply SND_SOC_TLV320DAC33
 	imply SND_SOC_TSCS42XX
@@ -1419,8 +1419,13 @@ config SND_SOC_TLV320AIC32X4_SPI
 	select SND_SOC_TLV320AIC32X4
 
 config SND_SOC_TLV320AIC3X
-	tristate "Texas Instruments TLV320AIC3x CODECs"
+	tristate
+
+config SND_SOC_TLV320AIC3X_I2C
+	tristate "Texas Instruments TLV320AIC3x audio CODECs - I2C"
 	depends on I2C
+	select SND_SOC_TLV320AIC3X
+	select REGMAP_I2C
 
 config SND_SOC_TLV320DAC33
 	tristate
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 81357dc62ea0..3710726f740f 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -233,6 +233,7 @@ snd-soc-tlv320aic32x4-objs := tlv320aic32x4.o tlv320aic32x4-clk.o
 snd-soc-tlv320aic32x4-i2c-objs := tlv320aic32x4-i2c.o
 snd-soc-tlv320aic32x4-spi-objs := tlv320aic32x4-spi.o
 snd-soc-tlv320aic3x-objs := tlv320aic3x.o
+snd-soc-tlv320aic3x-i2c-objs := tlv320aic3x-i2c.o
 snd-soc-tlv320dac33-objs := tlv320dac33.o
 snd-soc-tlv320adcx140-objs := tlv320adcx140.o
 snd-soc-tscs42xx-objs := tscs42xx.o
@@ -548,6 +549,7 @@ obj-$(CONFIG_SND_SOC_TLV320AIC32X4)     += snd-soc-tlv320aic32x4.o
 obj-$(CONFIG_SND_SOC_TLV320AIC32X4_I2C)	+= snd-soc-tlv320aic32x4-i2c.o
 obj-$(CONFIG_SND_SOC_TLV320AIC32X4_SPI)	+= snd-soc-tlv320aic32x4-spi.o
 obj-$(CONFIG_SND_SOC_TLV320AIC3X)	+= snd-soc-tlv320aic3x.o
+obj-$(CONFIG_SND_SOC_TLV320AIC3X_I2C)	+= snd-soc-tlv320aic3x-i2c.o
 obj-$(CONFIG_SND_SOC_TLV320DAC33)	+= snd-soc-tlv320dac33.o
 obj-$(CONFIG_SND_SOC_TLV320ADCX140)	+= snd-soc-tlv320adcx140.o
 obj-$(CONFIG_SND_SOC_TSCS42XX)	+= snd-soc-tscs42xx.o
diff --git a/sound/soc/codecs/tlv320aic3x-i2c.c b/sound/soc/codecs/tlv320aic3x-i2c.c
new file mode 100644
index 000000000000..4535bb8dbadc
--- /dev/null
+++ b/sound/soc/codecs/tlv320aic3x-i2c.c
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * ALSA SoC TLV320AIC3x codec driver I2C interface
+ *
+ * Author:      Arun KS, <arunks@mistralsolutions.com>
+ * Copyright:   (C) 2008 Mistral Solutions Pvt Ltd.,
+ *
+ * Based on sound/soc/codecs/wm8731.c by Richard Purdie
+ *
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+
+#include "tlv320aic3x.h"
+
+static int aic3x_i2c_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
+{
+	struct regmap *regmap;
+	struct regmap_config config;
+
+	config = aic3x_regmap;
+	config.reg_bits = 8;
+	config.val_bits = 8;
+
+	regmap = devm_regmap_init_i2c(i2c, &config);
+	return aic3x_probe(&i2c->dev, regmap, id->driver_data);
+}
+
+static int aic3x_i2c_remove(struct i2c_client *i2c)
+{
+	return aic3x_remove(&i2c->dev);
+}
+
+static const struct i2c_device_id aic3x_i2c_id[] = {
+	{ "tlv320aic3x", AIC3X_MODEL_3X },
+	{ "tlv320aic33", AIC3X_MODEL_33 },
+	{ "tlv320aic3007", AIC3X_MODEL_3007 },
+	{ "tlv320aic3104", AIC3X_MODEL_3104 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, aic3x_i2c_id);
+
+static const struct of_device_id aic3x_of_id[] = {
+	{ .compatible = "ti,tlv320aic3x", },
+	{ .compatible = "ti,tlv320aic33" },
+	{ .compatible = "ti,tlv320aic3007" },
+	{ .compatible = "ti,tlv320aic3104" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, aic3x_of_id);
+
+static struct i2c_driver aic3x_i2c_driver = {
+	.driver = {
+		.name = "tlv320aic3x",
+		.of_match_table = aic3x_of_id,
+	},
+	.probe = aic3x_i2c_probe,
+	.remove = aic3x_i2c_remove,
+	.id_table = aic3x_i2c_id,
+};
+
+module_i2c_driver(aic3x_i2c_driver);
+
+MODULE_DESCRIPTION("ASoC TLV320AIC3x codec driver I2C");
+MODULE_AUTHOR("Arun KS <arunks@mistralsolutions.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/tlv320aic3x.c b/sound/soc/codecs/tlv320aic3x.c
index 6549ad9296ce..2f351747b714 100644
--- a/sound/soc/codecs/tlv320aic3x.c
+++ b/sound/soc/codecs/tlv320aic3x.c
@@ -1,6 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/*
- * ALSA SoC TLV320AIC3X codec driver
+/* ALSA SoC TLV320AIC3X codec driver
  *
  * Author:      Vladimir Barinov, <vbarinov@embeddedalley.com>
  * Copyright:   (C) 2007 MontaVista Software, Inc., <source@mvista.com>
@@ -131,10 +130,7 @@ static bool aic3x_volatile_reg(struct device *dev, unsigned int reg)
 	}
 }
 
-static const struct regmap_config aic3x_regmap = {
-	.reg_bits = 8,
-	.val_bits = 8,
-
+const struct regmap_config aic3x_regmap = {
 	.max_register = DAC_ICC_ADJ,
 	.reg_defaults = aic3x_reg,
 	.num_reg_defaults = ARRAY_SIZE(aic3x_reg),
@@ -143,6 +139,7 @@ static const struct regmap_config aic3x_regmap = {
 
 	.cache_type = REGCACHE_RBTREE,
 };
+EXPORT_SYMBOL_GPL(aic3x_regmap);
 
 #define SOC_DAPM_SINGLE_AIC3X(xname, reg, shift, mask, invert) \
 	SOC_SINGLE_EXT(xname, reg, shift, mask, invert, \
@@ -1701,10 +1698,9 @@ static const struct snd_soc_component_driver soc_component_dev_aic3x = {
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
 
@@ -1720,7 +1716,7 @@ static void aic3x_configure_ocmv(struct i2c_client *client)
 	avdd = regulator_get_voltage(aic3x->supplies[2].consumer);
 
 	if (avdd > 3600000 || dvdd > 1950000) {
-		dev_warn(&client->dev,
+		dev_warn(dev,
 			 "Too high supply voltage(s) AVDD: %d, DVDD: %d\n",
 			 avdd, dvdd);
 	} else if (avdd == 3600000 && dvdd == 1950000) {
@@ -1732,26 +1728,12 @@ static void aic3x_configure_ocmv(struct i2c_client *client)
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
@@ -1763,25 +1745,20 @@ static const struct reg_sequence aic3007_class_d[] = {
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
@@ -1789,14 +1766,13 @@ static int aic3x_i2c_probe(struct i2c_client *i2c,
 
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
 
@@ -1806,7 +1782,7 @@ static int aic3x_i2c_probe(struct i2c_client *i2c,
 		} else {
 			ret = of_get_named_gpio(np, "gpio-reset", 0);
 			if (ret > 0) {
-				dev_warn(&i2c->dev, "Using deprecated property \"gpio-reset\", please update your DT");
+				dev_warn(dev, "Using deprecated property \"gpio-reset\", please update your DT");
 				aic3x->gpio_reset = ret;
 			} else {
 				aic3x->gpio_reset = -1;
@@ -1831,7 +1807,7 @@ static int aic3x_i2c_probe(struct i2c_client *i2c,
 				break;
 			default :
 				aic3x->micbias_vg = AIC3X_MICBIAS_OFF;
-				dev_err(&i2c->dev, "Unsuitable MicBias voltage "
+				dev_err(dev, "Unsuitable MicBias voltage "
 							"found in DT\n");
 			}
 		} else {
@@ -1842,7 +1818,7 @@ static int aic3x_i2c_probe(struct i2c_client *i2c,
 		aic3x->gpio_reset = -1;
 	}
 
-	aic3x->model = id->driver_data;
+	aic3x->model = driver_data;
 
 	if (gpio_is_valid(aic3x->gpio_reset) &&
 	    !aic3x_is_shared_reset(aic3x)) {
@@ -1855,25 +1831,24 @@ static int aic3x_i2c_probe(struct i2c_client *i2c,
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
@@ -1890,10 +1865,11 @@ static int aic3x_i2c_probe(struct i2c_client *i2c,
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
 
@@ -1904,31 +1880,7 @@ static int aic3x_i2c_remove(struct i2c_client *client)
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
diff --git a/sound/soc/codecs/tlv320aic3x.h b/sound/soc/codecs/tlv320aic3x.h
index 21dd6edf1059..00908f1734a7 100644
--- a/sound/soc/codecs/tlv320aic3x.h
+++ b/sound/soc/codecs/tlv320aic3x.h
@@ -9,6 +9,13 @@
 #ifndef _AIC3X_H
 #define _AIC3X_H
 
+struct device;
+struct regmap_config;
+
+extern const struct regmap_config aic3x_regmap;
+int aic3x_probe(struct device *dev, struct regmap *regmap, kernel_ulong_t driver_data);
+int aic3x_remove(struct device *dev);
+
 #define AIC3X_MODEL_3X 0
 #define AIC3X_MODEL_33 1
 #define AIC3X_MODEL_3007 2
-- 
2.25.1

