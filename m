Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6E352C9B0
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 04:15:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B18F1621;
	Thu, 19 May 2022 04:14:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B18F1621
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652926540;
	bh=ybk25WGdBM6dpL+VILu/rrGmuwlvmVZYAsjPgtcFRgw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FBbp8+kvqrmSn+dJ7xz+L6QwGd8Sd1WTrmQcfwujmnTtFCnsiT8HJ/FKWx8LnliIs
	 rKHsgjWbliwLufudo5FcFdKXpMOS1Y47Pl9aW3M5XIw3/9VBmUsbryFPWK/7ClXqth
	 Qz7Qn1slsyGZQzqQ9envV+U+9oTizWCbFAJOOPj0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFF6BF8051C;
	Thu, 19 May 2022 04:14:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92216F804A9; Thu, 19 May 2022 04:14:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41A24F80269
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 04:13:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41A24F80269
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TuSEjTsg"
Received: by mail-pg1-x535.google.com with SMTP id q76so3749155pgq.10
 for <alsa-devel@alsa-project.org>; Wed, 18 May 2022 19:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wyq2Los7z2YQuHxhySTXRtJAk+YnndZRPaJjpNvCr8w=;
 b=TuSEjTsgu8bKEUlEZySSXPqZJGxx9GeOlFB46KJun0qNXIigT6+gPEJytAlE1OHo2M
 W9IDT/qkArhUDBp8R5Zpm1qhWdFBaEkxdge9VuHMgmkMmztr+MxKnmIzAAgDneGp+iuy
 nvc0wvvp+FjoTm+CROi5sRElaQ+xPqyrAom47a4Lgna5CzuSswFLcWZh4L6Q25H1pAmc
 ZDD0drYe0vUxbB+ufugyCnz5HuYuDqx1AZqDi0uQ2j8g+OIl125UqGx+YWK7IhUtj73K
 g7fdCgigLGx4NwErdAz8GiL9pAwsCphuDNIn0JCWSPIJ+u5sZ5Udw7KI+Fwe3jcwHyXC
 g3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wyq2Los7z2YQuHxhySTXRtJAk+YnndZRPaJjpNvCr8w=;
 b=X8kba5Hajb9LY/eS3m+EorGDSfFf1vtA/TwCnIDC8No1dm9wzJzgd9bkOl7MvAL4yo
 WO4pCzoXhLLu0KhoZPDtPhG7vvSfIBwM8YziNQleSxsarOz39jfpBMVvtWGQVgsaqwF6
 DnqKFLov9EHtyciFS0qanfGqQbKujMtddMUzZ3nj2IWedmU8205evTW30Qfy6+4O/Uec
 R67RlqyZVxCdDKi0goqCiL0UaEDWkp9p+ObnlIJA1OuEtWomrRFmZYy9U8W0TiwC2oXa
 PzZRSaO8HhlQyarIy4o4BK/18Mm5rArlV/VL3qbm0BTnGvKgoDLoZd7CV8A1UZi5XF/G
 W09g==
X-Gm-Message-State: AOAM533sFAU0eZ/+sX/ofXIVsZl1uPC/LGyWR1Rb76PErZAs1AVhadB7
 o5+bnGxHkUOZEtMcKxCBrXI=
X-Google-Smtp-Source: ABdhPJwGOU545bZP0+XM7ca6pZFSklswcp3GoMluQyeKnLw0Q6vv6iMHjVJ7EUNsyjg6yaSoor1f2w==
X-Received: by 2002:a63:d813:0:b0:3f5:f9d8:7cce with SMTP id
 b19-20020a63d813000000b003f5f9d87ccemr2001690pgh.585.1652926435270; 
 Wed, 18 May 2022 19:13:55 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:568:8697:c74:ab15:730:f5f3])
 by smtp.gmail.com with ESMTPSA id
 je4-20020a170903264400b0015ebb3bf277sm2366603plb.238.2022.05.18.19.13.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 May 2022 19:13:54 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH 2/2] ASoC: rt9120: Use pm_runtime and regcache to optimize
 'pwdnn' logic
Date: Thu, 19 May 2022 10:13:38 +0800
Message-Id: <1652926418-8519-3-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1652926418-8519-1-git-send-email-u0084500@gmail.com>
References: <1652926418-8519-1-git-send-email-u0084500@gmail.com>
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org,
 ritchie_hsieh@richtek.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 ChiYuan Huang <cy_huang@richtek.com>, allen_lin@richtek.com
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

From: ChiYuan Huang <cy_huang@richtek.com>

From the datasheet, the only way to meet the lowest power consumption is
to pull low the 'pwdnn' gpio. But if it is low, IC will keep in
reset state, all registers reset to default.

And the power consumption is listed below
1. amp off and 'pwdnn' high => idle state, PVDD = 1mA, DVDD = 7mA
2. amp off and 'pwdnn' low  => shutdown state, PVDD < 20uA, DVDD < 15uA

It's the large difference for the consumption current

This fix is to use pm_runtime and regcache to handle 'pwdnn' gpio
control.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 sound/soc/codecs/rt9120.c | 111 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 105 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt9120.c b/sound/soc/codecs/rt9120.c
index 94d42be..da495bd 100644
--- a/sound/soc/codecs/rt9120.c
+++ b/sound/soc/codecs/rt9120.c
@@ -7,6 +7,7 @@
 #include <linux/i2c.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <sound/pcm.h>
@@ -75,6 +76,7 @@ enum {
 struct rt9120_data {
 	struct device *dev;
 	struct regmap *regmap;
+	struct gpio_desc *pwdnn_gpio;
 	int chip_idx;
 };
 
@@ -160,6 +162,8 @@ static int rt9120_codec_probe(struct snd_soc_component *comp)
 
 	snd_soc_component_init_regmap(comp, data->regmap);
 
+	pm_runtime_get_sync(comp->dev);
+
 	/* Internal setting */
 	if (data->chip_idx == CHIP_IDX_RT9120S) {
 		snd_soc_component_write(comp, RT9120_REG_INTERCFG, 0xde);
@@ -167,6 +171,9 @@ static int rt9120_codec_probe(struct snd_soc_component *comp)
 	} else
 		snd_soc_component_write(comp, RT9120_REG_INTERNAL0, 0x04);
 
+	pm_runtime_mark_last_busy(comp->dev);
+	pm_runtime_put(comp->dev);
+
 	return 0;
 }
 
@@ -338,6 +345,18 @@ static const struct regmap_access_table rt9120_wr_table = {
 	.n_yes_ranges = ARRAY_SIZE(rt9120_wr_yes_ranges),
 };
 
+static bool rt9120_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case 0x00 ... 0x01:
+	case 0x10:
+	case 0x30 ... 0x40:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static int rt9120_get_reg_size(unsigned int reg)
 {
 	switch (reg) {
@@ -397,14 +416,49 @@ static int rt9120_reg_write(void *context, unsigned int reg, unsigned int val)
 	return i2c_smbus_write_i2c_block_data(i2c, reg, size, rawp + offs);
 }
 
+static const struct reg_default rt9120_reg_defaults[] = {
+	{ .reg = 0x02, .def = 0x02 },
+	{ .reg = 0x03, .def = 0xf2 },
+	{ .reg = 0x04, .def = 0x01 },
+	{ .reg = 0x05, .def = 0xc0 },
+	{ .reg = 0x06, .def = 0x28 },
+	{ .reg = 0x07, .def = 0x04 },
+	{ .reg = 0x08, .def = 0xff },
+	{ .reg = 0x09, .def = 0x01 },
+	{ .reg = 0x0a, .def = 0x01 },
+	{ .reg = 0x0b, .def = 0x00 },
+	{ .reg = 0x0c, .def = 0x04 },
+	{ .reg = 0x11, .def = 0x30 },
+	{ .reg = 0x12, .def = 0x08 },
+	{ .reg = 0x13, .def = 0x12 },
+	{ .reg = 0x14, .def = 0x09 },
+	{ .reg = 0x15, .def = 0x00 },
+	{ .reg = 0x20, .def = 0x7ff },
+	{ .reg = 0x21, .def = 0x180 },
+	{ .reg = 0x22, .def = 0x180 },
+	{ .reg = 0x23, .def = 0x00 },
+	{ .reg = 0x24, .def = 0x80 },
+	{ .reg = 0x25, .def = 0x180 },
+	{ .reg = 0x26, .def = 0x640 },
+	{ .reg = 0x27, .def = 0x180 },
+	{ .reg = 0x63, .def = 0x5e },
+	{ .reg = 0x65, .def = 0x66 },
+	{ .reg = 0x6c, .def = 0xe0 },
+	{ .reg = 0xf8, .def = 0x44 },
+};
+
 static const struct regmap_config rt9120_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 32,
 	.max_register = RT9120_REG_DIGCFG,
+	.reg_defaults = rt9120_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(rt9120_reg_defaults),
+	.cache_type = REGCACHE_RBTREE,
 
 	.reg_read = rt9120_reg_read,
 	.reg_write = rt9120_reg_write,
 
+	.volatile_reg = rt9120_volatile_reg,
 	.wr_table = &rt9120_wr_table,
 	.rd_table = &rt9120_rd_table,
 };
@@ -450,7 +504,6 @@ static int rt9120_do_register_reset(struct rt9120_data *data)
 static int rt9120_probe(struct i2c_client *i2c)
 {
 	struct rt9120_data *data;
-	struct gpio_desc *pwdnn_gpio;
 	struct regulator *dvdd_supply;
 	int dvdd_supply_volt, ret;
 
@@ -461,12 +514,12 @@ static int rt9120_probe(struct i2c_client *i2c)
 	data->dev = &i2c->dev;
 	i2c_set_clientdata(i2c, data);
 
-	pwdnn_gpio = devm_gpiod_get_optional(&i2c->dev, "pwdnn",
-					     GPIOD_OUT_HIGH);
-	if (IS_ERR(pwdnn_gpio)) {
+	data->pwdnn_gpio = devm_gpiod_get_optional(&i2c->dev, "pwdnn",
+						   GPIOD_OUT_HIGH);
+	if (IS_ERR(data->pwdnn_gpio)) {
 		dev_err(&i2c->dev, "Failed to initialize 'pwdnn' gpio\n");
-		return PTR_ERR(pwdnn_gpio);
-	} else if (pwdnn_gpio) {
+		return PTR_ERR(data->pwdnn_gpio);
+	} else if (data->pwdnn_gpio) {
 		dev_dbg(&i2c->dev, "'pwdnn' from low to high, wait chip on\n");
 		msleep(RT9120_CHIPON_WAITMS);
 	}
@@ -508,11 +561,55 @@ static int rt9120_probe(struct i2c_client *i2c)
 		}
 	}
 
+	pm_runtime_set_autosuspend_delay(&i2c->dev, 1000);
+	pm_runtime_use_autosuspend(&i2c->dev);
+	pm_runtime_set_active(&i2c->dev);
+	pm_runtime_mark_last_busy(&i2c->dev);
+	pm_runtime_enable(&i2c->dev);
+
 	return devm_snd_soc_register_component(&i2c->dev,
 					       &rt9120_component_driver,
 					       &rt9120_dai, 1);
 }
 
+static int rt9120_remove(struct i2c_client *i2c)
+{
+	pm_runtime_disable(&i2c->dev);
+	pm_runtime_set_suspended(&i2c->dev);
+	return 0;
+}
+
+static int __maybe_unused rt9120_runtime_suspend(struct device *dev)
+{
+	struct rt9120_data *data = dev_get_drvdata(dev);
+
+	if (data->pwdnn_gpio) {
+		regcache_cache_only(data->regmap, true);
+		regcache_mark_dirty(data->regmap);
+		gpiod_set_value(data->pwdnn_gpio, 0);
+	}
+
+	return 0;
+}
+
+static int __maybe_unused rt9120_runtime_resume(struct device *dev)
+{
+	struct rt9120_data *data = dev_get_drvdata(dev);
+
+	if (data->pwdnn_gpio) {
+		gpiod_set_value(data->pwdnn_gpio, 1);
+		msleep(RT9120_CHIPON_WAITMS);
+		regcache_cache_only(data->regmap, false);
+		regcache_sync(data->regmap);
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops rt9120_pm_ops = {
+	SET_RUNTIME_PM_OPS(rt9120_runtime_suspend, rt9120_runtime_resume, NULL)
+};
+
 static const struct of_device_id __maybe_unused rt9120_device_table[] = {
 	{ .compatible = "richtek,rt9120", },
 	{ }
@@ -523,8 +620,10 @@ static struct i2c_driver rt9120_driver = {
 	.driver = {
 		.name = "rt9120",
 		.of_match_table = rt9120_device_table,
+		.pm = &rt9120_pm_ops,
 	},
 	.probe_new = rt9120_probe,
+	.remove = rt9120_remove,
 };
 module_i2c_driver(rt9120_driver);
 
-- 
2.7.4

