Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E481677F7CE
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Aug 2023 15:33:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F16AAE9;
	Thu, 17 Aug 2023 15:32:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F16AAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692279201;
	bh=i0DiRQn9wHy4wQu49wh2lE3vvijeKXaPbrrfbpHa83c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eoKM2xu4et1DELyzJj0OZfE2qrrrh6dE5ehjTiaC0YtG/CUeZjTfepVYA1uWJltOg
	 IzUIRVuGmsIdfyfBN7RRZKL2rlXXh5xzR/9nIDUjTbHviBM3LTy+rPuF0x/st6p87m
	 6EfzwvjrwE7jQ1d9SBATmiJ792xSAF/API019t8c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7831F8057E; Thu, 17 Aug 2023 15:32:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62D96F80571;
	Thu, 17 Aug 2023 15:32:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD594F80558; Thu, 17 Aug 2023 15:32:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E56FCF800D1
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 15:30:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E56FCF800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=l3iRKNCH
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2bb734a9081so10789051fa.1
        for <alsa-devel@alsa-project.org>;
 Thu, 17 Aug 2023 06:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692279032; x=1692883832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d+h0kp+qECVIOMn9Oo5xgS+pDCE42HhSV126thTQIzU=;
        b=l3iRKNCHo/fyL5y1z0db0vfiYid5rb+joqYm4lOtvNZ3lti1/3tPHp2WiXD9pLg4pt
         8cmZweJo57amPfe1MlggPhUnmD0lX/mL0v+cr7p0eg7GzikWtAlJhHN6amlS8yR2nE1z
         Ljuv/JNz7Lz8OY9jsPSzrBSKfPPTkLGnvplta9uHMtwwnG5X9hUmpCYRdrA+5No4MauE
         fpDSNc1YbploKHfZdvg7pv2IglGKMvmfgx/QVVsy9A1dYF8bTKtUjUTYI2dyy0Gj2c4J
         c6uGfCS/TWGGYKIm2bBs8FKz3mti531RcMVwvmFeDS6ALloQ8fMuKp0+c0xVtTKJBEPB
         5SaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692279032; x=1692883832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+h0kp+qECVIOMn9Oo5xgS+pDCE42HhSV126thTQIzU=;
        b=Wbn7MiyS0bNamZpnAyGGWhFod73zPgY+TurkHj8Xo81+VZsuLE4xFhMTzXqLNs2oar
         BElIKJklzgFqTGdAZEvQgBGHwVIh+RfVF5/28sPJp+Cw6Wug8emOLAlGOeBjU1kGK4dq
         KuaAbwUqqzYP9jrHFaUx2dXg5X7hlokABn63zqY/Qfa3ST4r+z1ldHI+EhtIOc1PdDOe
         VUTteF10Kukvo7yKgx0n8pucLs1eahan4uj62+xCjnmDzzyab9deBNQYGcy5GIyl6kk9
         ie463bnVBKosEYDEMINvtnghBbMrccYRhbCBoTgbMl4dxtqmjIrWLmM2vXOXa2GDF3jf
         HoFw==
X-Gm-Message-State: AOJu0Ywo7PZNx0CA5wwmGYF/AU3wbZqvmlQYp8uAcYR0d64mdCXHpcg0
	YanI8YZ8dENIet+AFYarqU64fQ==
X-Google-Smtp-Source: 
 AGHT+IEICClpddwtMaBX0Xc4WRIyeh1kbiYwKR7liLC6K4B+ot8zozmNMIN4MsWmxle0NpFaoCf6cQ==
X-Received: by 2002:a05:651c:c91:b0:2bb:7710:f08 with SMTP id
 bz17-20020a05651c0c9100b002bb77100f08mr1329719ljb.3.1692279032590;
        Thu, 17 Aug 2023 06:30:32 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 z22-20020a05651c023600b002b9de06f119sm3941689ljn.67.2023.08.17.06.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 06:30:31 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Aug 2023 15:30:18 +0200
Subject: [PATCH 4/5] ASoC: rt5682: Convert to use GPIO descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230817-descriptors-asoc-rt-v1-4-434f5f177cee@linaro.org>
References: <20230817-descriptors-asoc-rt-v1-0-434f5f177cee@linaro.org>
In-Reply-To: <20230817-descriptors-asoc-rt-v1-0-434f5f177cee@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: 24OJMU6HKNWSD7AWWKQ7QGJGGOLXBQVI
X-Message-ID-Hash: 24OJMU6HKNWSD7AWWKQ7QGJGGOLXBQVI
X-MailFrom: linus.walleij@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/24OJMU6HKNWSD7AWWKQ7QGJGGOLXBQVI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the RT5682 to use GPIO descriptors and drop the
legacy GPIO headers.

We remove the global GPIO number from the platform data,
but it is still possible to create board files using GPIO
descriptor tables, if desired.

Make sure to make sure SDW devices can associate with
an LDO1 EN descriptor too, if they so desire by putting
the lookup into the common code.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/sound/rt5682.h        |  3 ---
 sound/soc/codecs/rt5682-i2c.c | 11 ++++-------
 sound/soc/codecs/rt5682-sdw.c |  4 ++++
 sound/soc/codecs/rt5682.c     | 20 +++++++++++++++-----
 sound/soc/codecs/rt5682.h     |  3 +++
 5 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/include/sound/rt5682.h b/include/sound/rt5682.h
index 3900a07e3935..4256df721e3a 100644
--- a/include/sound/rt5682.h
+++ b/include/sound/rt5682.h
@@ -31,9 +31,6 @@ enum rt5682_dai_clks {
 };
 
 struct rt5682_platform_data {
-
-	int ldo1_en; /* GPIO for LDO1_EN */
-
 	enum rt5682_dmic1_data_pin dmic1_data_pin;
 	enum rt5682_dmic1_clk_pin dmic1_clk_pin;
 	enum rt5682_jd_src jd_src;
diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.c
index fb8ffb5b2ff6..b05b4f73d8aa 100644
--- a/sound/soc/codecs/rt5682-i2c.c
+++ b/sound/soc/codecs/rt5682-i2c.c
@@ -15,8 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/spi/spi.h>
 #include <linux/acpi.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/mutex.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -170,11 +169,9 @@ static int rt5682_i2c_probe(struct i2c_client *i2c)
 		return ret;
 	}
 
-	if (gpio_is_valid(rt5682->pdata.ldo1_en)) {
-		if (devm_gpio_request_one(&i2c->dev, rt5682->pdata.ldo1_en,
-					  GPIOF_OUT_INIT_HIGH, "rt5682"))
-			dev_err(&i2c->dev, "Fail gpio_request gpio_ldo\n");
-	}
+	ret = rt5682_get_ldo1(rt5682, &i2c->dev);
+	if (ret)
+		return ret;
 
 	/* Sleep for 300 ms miniumum */
 	usleep_range(300000, 350000);
diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 3d13ea74b074..0f604ed0ba1a 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -320,6 +320,10 @@ static int rt5682_sdw_init(struct device *dev, struct regmap *regmap,
 		return ret;
 	}
 
+	ret = rt5682_get_ldo1(rt5682, dev);
+	if (ret)
+		return ret;
+
 	/*
 	 * Mark hw_init to false
 	 * HW init will be performed when device reports present
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 5d992543b791..62b4d353e865 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -15,8 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/spi/spi.h>
 #include <linux/acpi.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/mutex.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -3091,9 +3090,6 @@ int rt5682_parse_dt(struct rt5682_priv *rt5682, struct device *dev)
 	device_property_read_u32(dev, "realtek,dmic-delay-ms",
 		&rt5682->pdata.dmic_delay);
 
-	rt5682->pdata.ldo1_en = of_get_named_gpio(dev->of_node,
-		"realtek,ldo1-en-gpios", 0);
-
 	if (device_property_read_string_array(dev, "clock-output-names",
 					      rt5682->pdata.dai_clk_names,
 					      RT5682_DAI_NUM_CLKS) < 0)
@@ -3108,6 +3104,20 @@ int rt5682_parse_dt(struct rt5682_priv *rt5682, struct device *dev)
 }
 EXPORT_SYMBOL_GPL(rt5682_parse_dt);
 
+int rt5682_get_ldo1(struct rt5682_priv *rt5682, struct device *dev)
+{
+	rt5682->ldo1_en = devm_gpiod_get_optional(dev,
+						  "realtek,ldo1-en",
+						  GPIOD_OUT_HIGH);
+	if (IS_ERR(rt5682->ldo1_en)) {
+		dev_err(dev, "Fail gpio request ldo1_en\n");
+		return PTR_ERR(rt5682->ldo1_en);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(rt5682_get_ldo1);
+
 void rt5682_calibrate(struct rt5682_priv *rt5682)
 {
 	int value, count;
diff --git a/sound/soc/codecs/rt5682.h b/sound/soc/codecs/rt5682.h
index 1a43d595f341..b2d9e87af259 100644
--- a/sound/soc/codecs/rt5682.h
+++ b/sound/soc/codecs/rt5682.h
@@ -11,6 +11,7 @@
 
 #include <sound/rt5682.h>
 #include <linux/regulator/consumer.h>
+#include <linux/gpio/consumer.h>
 #include <linux/clk.h>
 #include <linux/clkdev.h>
 #include <linux/clk-provider.h>
@@ -1430,6 +1431,7 @@ struct rt5682_priv {
 	struct snd_soc_component *component;
 	struct device *i2c_dev;
 	struct rt5682_platform_data pdata;
+	struct gpio_desc *ldo1_en;
 	struct regmap *regmap;
 	struct regmap *sdw_regmap;
 	struct snd_soc_jack *hs_jack;
@@ -1481,6 +1483,7 @@ int rt5682_register_component(struct device *dev);
 void rt5682_calibrate(struct rt5682_priv *rt5682);
 void rt5682_reset(struct rt5682_priv *rt5682);
 int rt5682_parse_dt(struct rt5682_priv *rt5682, struct device *dev);
+int rt5682_get_ldo1(struct rt5682_priv *rt5682, struct device *dev);
 
 int rt5682_register_dai_clks(struct rt5682_priv *rt5682);
 

-- 
2.34.1

