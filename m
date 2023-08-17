Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 004BB77F7C9
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Aug 2023 15:32:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 081DB845;
	Thu, 17 Aug 2023 15:31:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 081DB845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692279150;
	bh=ksRnmBL+eihXVfY61zYRHMnLfTOy+ZTbU+SuDj+RS1k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Vb6iARwLtk4XylPc+Oy0wrxJEp3FbBAVxPTCoQJtqa+36cC5n+5aPZLcBkaH8HjVN
	 s/bGSy+flPp5wVGrR0V+gz1Opx5iyKHZAsuIum3uD5a04NLCTef/1UEXPGnOdfsjhl
	 Et2z2hpSSUx+rn63xrFftIYhADbbcX4IcHoc52yY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5576DF80579; Thu, 17 Aug 2023 15:30:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF236F80564;
	Thu, 17 Aug 2023 15:30:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AEF9F80557; Thu, 17 Aug 2023 15:30:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4765F80074
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 15:30:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4765F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xyiHgLhO
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b962c226ceso119624701fa.3
        for <alsa-devel@alsa-project.org>;
 Thu, 17 Aug 2023 06:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692279028; x=1692883828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8mdsM2oTBK6JwOUfDT8eQud/HNhMQh59h+NrcC2uv04=;
        b=xyiHgLhOGT0eA/twbpDbHpTXZTiRfEq4iQnsqJI6jqPRDlECTn6jEbpxZsiNXaDBP/
         XzG65jAQAsypqzgoX/lfmHvRHZwcJWIdjWQbWlUI8ph1H4/gIW8dgGQWbgMtMwcQVOUN
         emfFcUJQOJccYFeMvtziBgs8MNxhgmE1r8glLRgs77dN5TCBfWXOy2F1k+dFAmr/F1nu
         VhYNWZa82zhSkx4Tc3YE0asHBYpI+U0csizzwp8PhEAiZzsuPACpd32OdrYVWxubGUYX
         iULaMHb1ge+DkG5RSfti1uw3lQ4RucJt4RjZ6lvOuVqTZuXEcwiFUMcOEo/YJHRrTzwb
         cUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692279028; x=1692883828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mdsM2oTBK6JwOUfDT8eQud/HNhMQh59h+NrcC2uv04=;
        b=FGbUzAa4owvs7vgRz8f+GEvxfaP/vxL9mwGhp/LkinDFvQpN7y0lSZDsz9tpI2OFAn
         NRJB/ACiwVsS/y5YnnUnutTaxEguU1ZwYQp+SK2emu6yiHLtBxVke04pox2aqvyPwkpw
         ba+qPqnxOgbbOh/p7IrEqDpny3K0GmbCvRFIapHCPCs63H0xZZKvgb7mKY2I2hfH2ewH
         aw/nGeZuDeM1ZYAn+eoR/go/AdraQ4ifAgfqP8GKawJgHYa702f3vAD1PgxII+NUDlJw
         JI8M/AAK3GRbpcNghJ81odpkQv4B/+J1otlY1jVPWyP4L268z0ueOB6dj51vxllHYI0j
         bY1A==
X-Gm-Message-State: AOJu0Yy+4Vu0c7bZyaZDBo4y6FrVZBcJLSfvDQt4zIUwC/4rqSKd/kb+
	gN1/IzoSnvu2gGd78NvfXRogKQ==
X-Google-Smtp-Source: 
 AGHT+IEYnpQSnBJ1Eq6Rlg/01iPWGoY2TquJN2t/26s2G2NC6QbAzjm0QtygB5LDyBMgkTzmpq9Eag==
X-Received: by 2002:a2e:b04a:0:b0:2b9:f1ad:94f5 with SMTP id
 d10-20020a2eb04a000000b002b9f1ad94f5mr3870619ljl.40.1692279028565;
        Thu, 17 Aug 2023 06:30:28 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 z22-20020a05651c023600b002b9de06f119sm3941689ljn.67.2023.08.17.06.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 06:30:27 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Aug 2023 15:30:15 +0200
Subject: [PATCH 1/5] ASoC: rt5640: Convert to just use GPIO descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230817-descriptors-asoc-rt-v1-1-434f5f177cee@linaro.org>
References: <20230817-descriptors-asoc-rt-v1-0-434f5f177cee@linaro.org>
In-Reply-To: <20230817-descriptors-asoc-rt-v1-0-434f5f177cee@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: 535BZNKVQHQ3AAWI7ZLSDDW5TEIT6F6Q
X-Message-ID-Hash: 535BZNKVQHQ3AAWI7ZLSDDW5TEIT6F6Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/535BZNKVQHQ3AAWI7ZLSDDW5TEIT6F6Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The RT5640 driver is already using GPIO descriptors for some
stuff, all that is needed is to convert the remaining LDO1
control line to also use descriptors.

Simplify the code using gpiod_get_optional() and drop the
special "of" parsing function: these descriptors need not
come from device tree and it's optional so hey.

Keep some NULL checks around the GPIO operations even though
gpiolib is essentially NULL-tolerant, because by checking
for whether we have a valid GPIO descriptor or not we can
avoid a 400 ms delay which is great.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/rt5640.c | 55 +++++++++++++----------------------------------
 sound/soc/codecs/rt5640.h |  2 +-
 2 files changed, 16 insertions(+), 41 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 0ed4fa261abf..33a6d545a9db 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -12,11 +12,10 @@
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 #include <linux/spi/spi.h>
 #include <linux/acpi.h>
@@ -2811,8 +2810,8 @@ static int rt5640_suspend(struct snd_soc_component *component)
 	rt5640_reset(component);
 	regcache_cache_only(rt5640->regmap, true);
 	regcache_mark_dirty(rt5640->regmap);
-	if (gpio_is_valid(rt5640->ldo1_en))
-		gpio_set_value_cansleep(rt5640->ldo1_en, 0);
+	if (rt5640->ldo1_en)
+		gpiod_set_value_cansleep(rt5640->ldo1_en, 0);
 
 	return 0;
 }
@@ -2821,8 +2820,8 @@ static int rt5640_resume(struct snd_soc_component *component)
 {
 	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
 
-	if (gpio_is_valid(rt5640->ldo1_en)) {
-		gpio_set_value_cansleep(rt5640->ldo1_en, 1);
+	if (rt5640->ldo1_en) {
+		gpiod_set_value_cansleep(rt5640->ldo1_en, 1);
 		msleep(400);
 	}
 
@@ -2985,22 +2984,6 @@ static const struct acpi_device_id rt5640_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, rt5640_acpi_match);
 #endif
 
-static int rt5640_parse_dt(struct rt5640_priv *rt5640, struct device_node *np)
-{
-	rt5640->ldo1_en = of_get_named_gpio(np, "realtek,ldo1-en-gpios", 0);
-	/*
-	 * LDO1_EN is optional (it may be statically tied on the board).
-	 * -ENOENT means that the property doesn't exist, i.e. there is no
-	 * GPIO, so is not an error. Any other error code means the property
-	 * exists, but could not be parsed.
-	 */
-	if (!gpio_is_valid(rt5640->ldo1_en) &&
-			(rt5640->ldo1_en != -ENOENT))
-		return rt5640->ldo1_en;
-
-	return 0;
-}
-
 static int rt5640_i2c_probe(struct i2c_client *i2c)
 {
 	struct rt5640_priv *rt5640;
@@ -3014,12 +2997,16 @@ static int rt5640_i2c_probe(struct i2c_client *i2c)
 		return -ENOMEM;
 	i2c_set_clientdata(i2c, rt5640);
 
-	if (i2c->dev.of_node) {
-		ret = rt5640_parse_dt(rt5640, i2c->dev.of_node);
-		if (ret)
-			return ret;
-	} else
-		rt5640->ldo1_en = -EINVAL;
+	rt5640->ldo1_en = devm_gpiod_get_optional(&i2c->dev,
+						  "realtek,ldo1-en",
+						  GPIOD_OUT_HIGH);
+	if (IS_ERR(rt5640->ldo1_en))
+		return PTR_ERR(rt5640->ldo1_en);
+
+	if (rt5640->ldo1_en) {
+		gpiod_set_consumer_name(rt5640->ldo1_en, "RT5640 LDO1_EN");
+		msleep(400);
+	}
 
 	rt5640->regmap = devm_regmap_init_i2c(i2c, &rt5640_regmap);
 	if (IS_ERR(rt5640->regmap)) {
@@ -3029,18 +3016,6 @@ static int rt5640_i2c_probe(struct i2c_client *i2c)
 		return ret;
 	}
 
-	if (gpio_is_valid(rt5640->ldo1_en)) {
-		ret = devm_gpio_request_one(&i2c->dev, rt5640->ldo1_en,
-					    GPIOF_OUT_INIT_HIGH,
-					    "RT5640 LDO1_EN");
-		if (ret < 0) {
-			dev_err(&i2c->dev, "Failed to request LDO1_EN %d: %d\n",
-				rt5640->ldo1_en, ret);
-			return ret;
-		}
-		msleep(400);
-	}
-
 	regmap_read(rt5640->regmap, RT5640_VENDOR_ID2, &val);
 	if (val != RT5640_DEVICE_ID) {
 		dev_err(&i2c->dev,
diff --git a/sound/soc/codecs/rt5640.h b/sound/soc/codecs/rt5640.h
index 9847a1ae01f4..94b9a502f7f9 100644
--- a/sound/soc/codecs/rt5640.h
+++ b/sound/soc/codecs/rt5640.h
@@ -2138,7 +2138,7 @@ struct rt5640_priv {
 	struct regmap *regmap;
 	struct clk *mclk;
 
-	int ldo1_en; /* GPIO for LDO1_EN */
+	struct gpio_desc *ldo1_en; /* GPIO for LDO1_EN */
 	int irq;
 	int jd_gpio_irq;
 	int sysclk;

-- 
2.34.1

