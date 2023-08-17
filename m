Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9816D77F84C
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Aug 2023 16:04:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D1CE828;
	Thu, 17 Aug 2023 16:03:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D1CE828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692281089;
	bh=dQtYn75+hngMqyzVlrrrJuUf2UaY3wY5yVgVym+UEVw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kgfx1oSFFJcdCzhiHtwaio3ZZ9B8T1MhPVuSmUzmh720x5eYSnN2eKHzGQ19fb8gJ
	 LhaQVuFalZaRNUoJ4443LjgbjRS8o+wEs+eeXmrKSgEUan1YQM71k4jr9zSqpRDs5Z
	 MAUqG1V9UtWzz3mmOb6GmgR4F60SJSiF6y/ZzqPc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B35F0F80551; Thu, 17 Aug 2023 16:03:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CFDE8F80254;
	Thu, 17 Aug 2023 16:03:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BBEBF80254; Thu, 17 Aug 2023 16:03:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40AF1F8016A
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 16:03:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40AF1F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wRf+w2hV
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b9b904bb04so123719641fa.1
        for <alsa-devel@alsa-project.org>;
 Thu, 17 Aug 2023 07:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692281009; x=1692885809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=088USFovIsdoCEmzlnqhLgFZBLMNvUbAonAQf/mwAxw=;
        b=wRf+w2hVofU/IxEx6VHKnhqF/EYCqFXdyuaJFbKv7U3n8gNC3s046jZuHdCtATWzhp
         7U+8q70z10E91FBbXknUsa7BIRqpjTQ5hPd1GCS2pGrZlLyL6pz1pl+l0rFTBKED5yEf
         qNoaBvGX1VuQAEsKhM1euCnfrtZPVGfaXH0VkOCThH8yZk0p8wRgSyxXILk2cE4F/fBV
         Y0TbdJSMpiRgUQGkZqjNO1mW4Xh94qm3XAFCZ9ivTmkc6a2u74fEHaQmoR7b2S+YklNA
         k0jO1unCHxZqyc3/6nFonNc8eBLICRKLTzZbKav5rgosKv6v5VHO6y/pxuFFa9sEED1D
         xJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692281009; x=1692885809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=088USFovIsdoCEmzlnqhLgFZBLMNvUbAonAQf/mwAxw=;
        b=N8AnEYFfITV6lAgQdmlmKub7kc3lrNOcwj51uomYRrZJvTVxMu8N+85wn/o6iEPuPE
         pKn0rfo8IZ8iibizITW4O9la7d82EfZXCxg0wCgONLhzbbF5zX0b8+xXCPTznkP2hds0
         V2pIf/BFKnRfLNv4yaP3t7A6LQNWZMXVfKCYlm9/QXi6tN796wzD+QnHMdsGaF1gHX7P
         iLbWLXZqSPozqmyd26cqPkf04TQB98h0LWsixP0YBRXO7pHw2p9P2mSnVB4Ol+e/hhiI
         hGtyvni2MNiD41+WDmKtz1vp4/uFqirwGRcgymUVFOXqfavnMRZyG0wj/PQSJpuJ04Jc
         NivQ==
X-Gm-Message-State: AOJu0YzWdGzcHX9LoLQCwJyGl3tQi2zdHn+4Hlp5PuNQkzFnDoq3c7Wp
	2ks7SwJG04bl9vbte+Z0E5OSSCYTZIeQRqXldow=
X-Google-Smtp-Source: 
 AGHT+IG2Pux8VKOdbP86Oj7Mi6rjgF8/0qq8sb4PVwu1oDpFYcRedBksyLzRLMctv2SUuMjfYx1nQw==
X-Received: by 2002:a2e:9c99:0:b0:2b6:e618:b593 with SMTP id
 x25-20020a2e9c99000000b002b6e618b593mr4368277lji.31.1692281009055;
        Thu, 17 Aug 2023 07:03:29 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 g3-20020a2eb0c3000000b002b9c3e18095sm4064645ljl.14.2023.08.17.07.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 07:03:28 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Aug 2023 16:03:17 +0200
Subject: [PATCH v2 1/5] ASoC: rt5640: Convert to just use GPIO descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230817-descriptors-asoc-rt-v2-1-02fa2ca3e5b0@linaro.org>
References: <20230817-descriptors-asoc-rt-v2-0-02fa2ca3e5b0@linaro.org>
In-Reply-To: <20230817-descriptors-asoc-rt-v2-0-02fa2ca3e5b0@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: YASMSPGU5FENHR5UYOXQSIMNKVDUADEL
X-Message-ID-Hash: YASMSPGU5FENHR5UYOXQSIMNKVDUADEL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YASMSPGU5FENHR5UYOXQSIMNKVDUADEL/>
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
index eceed8209787..8920726c38e8 100644
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
@@ -2812,8 +2811,8 @@ static int rt5640_suspend(struct snd_soc_component *component)
 	rt5640_reset(component);
 	regcache_cache_only(rt5640->regmap, true);
 	regcache_mark_dirty(rt5640->regmap);
-	if (gpio_is_valid(rt5640->ldo1_en))
-		gpio_set_value_cansleep(rt5640->ldo1_en, 0);
+	if (rt5640->ldo1_en)
+		gpiod_set_value_cansleep(rt5640->ldo1_en, 0);
 
 	return 0;
 }
@@ -2822,8 +2821,8 @@ static int rt5640_resume(struct snd_soc_component *component)
 {
 	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
 
-	if (gpio_is_valid(rt5640->ldo1_en)) {
-		gpio_set_value_cansleep(rt5640->ldo1_en, 1);
+	if (rt5640->ldo1_en) {
+		gpiod_set_value_cansleep(rt5640->ldo1_en, 1);
 		msleep(400);
 	}
 
@@ -2986,22 +2985,6 @@ static const struct acpi_device_id rt5640_acpi_match[] = {
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
@@ -3015,12 +2998,16 @@ static int rt5640_i2c_probe(struct i2c_client *i2c)
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
@@ -3030,18 +3017,6 @@ static int rt5640_i2c_probe(struct i2c_client *i2c)
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

