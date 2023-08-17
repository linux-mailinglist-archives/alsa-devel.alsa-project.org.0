Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FDA77F855
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Aug 2023 16:06:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC82EAE9;
	Thu, 17 Aug 2023 16:05:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC82EAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692281177;
	bh=VclR2Ui/l0qdH/5ar0Z66+iyvxtEuM2+V9yzCgllXgs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pENX496A3MuPMO1RIcn/WXDOZTdnVE/tmVigMIvBVN3g4D+am1jo42UmFQX9EPVBc
	 kEb8kShCkjZiurS6VGv8JFMmt8KyPXKATluWZVw0gyfhmOmYCWva6cfq3pwWfmt3LE
	 X0+Tkbmzo93oGMEjYX1iY8XgAmeeOReTtqGdS/bI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2ED31F805B2; Thu, 17 Aug 2023 16:03:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A406F805AF;
	Thu, 17 Aug 2023 16:03:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E106EF80567; Thu, 17 Aug 2023 16:03:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6BB26F8016A
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 16:03:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BB26F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TV6FCMvT
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b95d5ee18dso117342081fa.1
        for <alsa-devel@alsa-project.org>;
 Thu, 17 Aug 2023 07:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692281012; x=1692885812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8QnfXt14InmPur1jaC24sUVlinocDE8jpHSEWJ37+o=;
        b=TV6FCMvT/LoEqFsobincahfEyqStn0Fuyfn5b5hYbFZazgJ1W6IM9va0mjfgxXgRNM
         KFxVwj1TawdUco9eenFuTdc2QsFvm8H8JJjb8LAsrNemqAoRN/LTz/ArVsDkBPQouV5V
         dAjD1U6CLmgytPQuCwo11QMnTcdMgL6wke6WtIJf98Zw1iFq8MsdiwVLVX87SjChjsyl
         oURNiZrNDyXKkU2oeYC5S+RLAr/IexciJQah2Wib9DJyoqsrlxjWyy3SjIWQrJTptdQf
         jSNJe8GZ94Mmcm2lzrWmnyxkpKFclCsKozrp7v6ngM5I/GK6ySpZyupxAz3iTGCe7ub9
         fMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692281012; x=1692885812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8QnfXt14InmPur1jaC24sUVlinocDE8jpHSEWJ37+o=;
        b=NQL870uECTT2udlhuaJ7IFquBakQ8lytV487Z/2BQOrUHRugvU1vHkhPYHt2Msm7el
         pZI2a5yjccWxqT3LAJ9RHBtjq6s+FVS6xHGHw1ulkexyya6dCDACdjE8ola31CG8hCJ+
         +931OANNiR3pCO2frkB1lJg+0TUgVkaka5svuApk5DyFkg4VQ629EZa1mae3wXrn2Ui9
         uknCVLYBgoAkn0SBSthUbTwp3ad/vcQHoJvjuub+luLkpV9upsfFrzh0195Y5GrnF3v1
         fOQDIhWL7oN2Cmimi9TgdYkKwumA5YK3AndvgTGTi4Qg7d5j041PPES8/LtggO6TWmKK
         N1DA==
X-Gm-Message-State: AOJu0YwStvIuRJ5op31uxi1AQsjOTK27w+SNHyTLZPKJNNM9+cMss4Gc
	RhvzLXCTzMc0Is7eOzsG0/1K+gLQWumcV3q/HPs=
X-Google-Smtp-Source: 
 AGHT+IF5riaWQT2nv6OvAWzXDDhE1Yh2ZeIyZUsJE/SAjXNz/hCQGKh0HlxKGTYoYC1yTHp2FVoyGg==
X-Received: by 2002:a2e:8012:0:b0:2b9:df49:b818 with SMTP id
 j18-20020a2e8012000000b002b9df49b818mr4043578ljg.53.1692281012072;
        Thu, 17 Aug 2023 07:03:32 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 g3-20020a2eb0c3000000b002b9c3e18095sm4064645ljl.14.2023.08.17.07.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 07:03:31 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Aug 2023 16:03:20 +0200
Subject: [PATCH v2 4/5] ASoC: rt5682: Convert to use GPIO descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230817-descriptors-asoc-rt-v2-4-02fa2ca3e5b0@linaro.org>
References: <20230817-descriptors-asoc-rt-v2-0-02fa2ca3e5b0@linaro.org>
In-Reply-To: <20230817-descriptors-asoc-rt-v2-0-02fa2ca3e5b0@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: 4SKJESOBU6256DYKFIYOX7ZIRXTOV4TK
X-Message-ID-Hash: 4SKJESOBU6256DYKFIYOX7ZIRXTOV4TK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4SKJESOBU6256DYKFIYOX7ZIRXTOV4TK/>
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
 sound/soc/codecs/rt5682-sdw.c |  5 +++++
 sound/soc/codecs/rt5682.c     | 20 +++++++++++++++-----
 sound/soc/codecs/rt5682.h     |  3 +++
 5 files changed, 27 insertions(+), 15 deletions(-)

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
index 65e9c6dc1a54..e67c2e19cb1a 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -320,6 +320,11 @@ static int rt5682_sdw_init(struct device *dev, struct regmap *regmap,
 		return ret;
 	}
 
+
+	ret = rt5682_get_ldo1(rt5682, dev);
+	if (ret)
+		return ret;
+
 	regcache_cache_only(rt5682->sdw_regmap, true);
 	regcache_cache_only(rt5682->regmap, true);
 
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 694c581070d9..e3aca9c785a0 100644
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
@@ -3094,9 +3093,6 @@ int rt5682_parse_dt(struct rt5682_priv *rt5682, struct device *dev)
 	device_property_read_u32(dev, "realtek,dmic-delay-ms",
 		&rt5682->pdata.dmic_delay);
 
-	rt5682->pdata.ldo1_en = of_get_named_gpio(dev->of_node,
-		"realtek,ldo1-en-gpios", 0);
-
 	if (device_property_read_string_array(dev, "clock-output-names",
 					      rt5682->pdata.dai_clk_names,
 					      RT5682_DAI_NUM_CLKS) < 0)
@@ -3111,6 +3107,20 @@ int rt5682_parse_dt(struct rt5682_priv *rt5682, struct device *dev)
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

