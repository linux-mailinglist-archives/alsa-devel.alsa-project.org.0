Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D62407FE1F5
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 22:30:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 890DF84D;
	Wed, 29 Nov 2023 22:30:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 890DF84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701293418;
	bh=YgD8NCzCa0o2PIx+92uNDqIBOZLqRBx24F1D82cHvZw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jvLnsv0/s+Uy9G3OOf8/jfXHNL2nuYgYyxEmReT5w1methtrrWxsKa6OXGzV6AwyM
	 PpNIUrnrMtTkYvBIk8N0uo0nH4wWJcBVtafcu+d4H3nkKGKj/AY8RKxQnJ/ldWc/q2
	 jvivxz8W0oM6OVbJMPQ0TOHsreu3CtMMDGaYR0iE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72DC0F80611; Wed, 29 Nov 2023 22:29:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6AC7F80601;
	Wed, 29 Nov 2023 22:29:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27EA6F805CA; Wed, 29 Nov 2023 22:29:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 192B8F8007E
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 22:28:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 192B8F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=KMmXn9f2
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c9c18e7990so3645101fa.2
        for <alsa-devel@alsa-project.org>;
 Wed, 29 Nov 2023 13:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701293329; x=1701898129;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rd9nw7xvRPUV3hk495kPLrQSq+AWlSC2p6ACSHGPZ1M=;
        b=KMmXn9f2Qz+v0SbrHqN2zGD+4ZMtPhdLICUv/KQBA/zifP7A9EQwz7cjnWP09+wZyy
         jzIwvIMy7webb6dqc+PyaPHMiHvnlu+DXmeLAboWawWlej8D06dqOAM1AFwN7P4Z2Plm
         wzg6xNnzt6BcagM6Mgc7x0KWlYoD+WQNcexCCxH8Ae7UvRU6PfI18QyaNEhMfous2Azg
         Q+0DvFRCW0XXNrm6tig/27xDAhipoclfY6CZ5dBA/fg1hU//3ux+ybcosGVVwn/RKY5c
         p4rLZh+s9EqOZLrILlWTwU8/Hky4mr5VDstyt2adzIX/broDkZ6AIgPqIvV+3J+YEX3U
         OHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701293329; x=1701898129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rd9nw7xvRPUV3hk495kPLrQSq+AWlSC2p6ACSHGPZ1M=;
        b=F8Fg2ORxJ9MbOJUkiZZnA6k4eRJ/Ip40gd60rxJg3BII9Or5hqXR/Is+niN/AdShG3
         eDEcqvmyArBSAQCfykWrms3LuZqLG6rJuo341jPaXOz/Oz04ESHoQ5b+y9SUR+JxEQ4u
         IBqxQE5VoUoNqk2PhD2bdkza4ZAemNzdjkXCmvO6zMSRpQkF02qoV879tiAPNNp9yZY2
         ltU2u+Tsx32bfxlVqjoRk4Dc09z3rubWOvzJ9GLBBDRXapIIODKBjtxREqtneasqvf04
         PJPuFw2IiuA0/t9VrgYr027EeM3CMPvURYD4AoQR/A5wkOmjoznXzAFQmBYDYpJ29X1c
         /D8w==
X-Gm-Message-State: AOJu0YwXr4hME8OeH2mTEXwFAENghsH2lid4v6L+1sReadIGlcJJThli
	oLEgM44gHJOO49tAg7FO63qksg==
X-Google-Smtp-Source: 
 AGHT+IFYlzgUTSMaBZ8vEEiRv4XxRnEyblyItbYXJ5pRKVGQeaxn6T2fQjE0N0TkwHLyCEnjMtygKw==
X-Received: by 2002:a2e:9e17:0:b0:2c9:c566:ef73 with SMTP id
 e23-20020a2e9e17000000b002c9c566ef73mr812071ljk.15.1701293328854;
        Wed, 29 Nov 2023 13:28:48 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 b5-20020a05651c032500b002bcdbfe36b9sm2106196ljp.111.2023.11.29.13.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 13:28:47 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 22:28:42 +0100
Subject: [PATCH 06/10] ASoC: cs4271: Convert to GPIO descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231129-descriptors-sound-cirrus-v1-6-31aa74425ff8@linaro.org>
References: <20231129-descriptors-sound-cirrus-v1-0-31aa74425ff8@linaro.org>
In-Reply-To: <20231129-descriptors-sound-cirrus-v1-0-31aa74425ff8@linaro.org>
To: Paul Handrigan <Paul.Handrigan@cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4
Message-ID-Hash: NKESBWNOUGC3BWRT7D7ZRTJHSWZCM6SV
X-Message-ID-Hash: NKESBWNOUGC3BWRT7D7ZRTJHSWZCM6SV
X-MailFrom: linus.walleij@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NKESBWNOUGC3BWRT7D7ZRTJHSWZCM6SV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This converts the Cirrus CS4271 ASoC codec driver to use
GPIO descriptors.

It turns out that there are two in-kernel users of the platform
data passing mechanism so these are switched over as well.

One locally defined GPIO "gpio_disabled" is declared in the
state struct but completely unused in the driver, so we delete
it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
NB: the affected platform EP93xx is being converted to device tree
I don't know if that is happening in this merge window, but the
colission should be manageable.
---
 arch/arm/mach-ep93xx/edb93xx.c       | 32 +++++++++++++++++++++++++----
 arch/arm/mach-ep93xx/vision_ep9307.c | 12 ++++++++++-
 include/sound/cs4271.h               |  1 -
 sound/soc/codecs/cs4271.c            | 39 ++++++++++++------------------------
 4 files changed, 52 insertions(+), 32 deletions(-)

diff --git a/arch/arm/mach-ep93xx/edb93xx.c b/arch/arm/mach-ep93xx/edb93xx.c
index 4b90899a66e9..dbdb822a0100 100644
--- a/arch/arm/mach-ep93xx/edb93xx.c
+++ b/arch/arm/mach-ep93xx/edb93xx.c
@@ -88,7 +88,7 @@ static void __init edb93xx_register_i2c(void)
  * EDB93xx SPI peripheral handling
  *************************************************************************/
 static struct cs4271_platform_data edb93xx_cs4271_data = {
-	.gpio_nreset	= -EINVAL,	/* filled in later */
+	/* Intentionally left blank */
 };
 
 static struct spi_board_info edb93xx_spi_board_info[] __initdata = {
@@ -114,14 +114,38 @@ static struct ep93xx_spi_info edb93xx_spi_info __initdata = {
 	/* Intentionally left blank */
 };
 
+static struct gpiod_lookup_table edb93xx_cs4272_edb9301_gpio_table = {
+	.dev_id = "spi0.0", /* CS0 on SPI0 */
+	.table = {
+		GPIO_LOOKUP("A", 1, "reset", GPIO_ACTIVE_LOW),
+		{ },
+	},
+};
+
+static struct gpiod_lookup_table edb93xx_cs4272_edb9302_gpio_table = {
+	.dev_id = "spi0.0", /* CS0 on SPI0 */
+	.table = {
+		GPIO_LOOKUP("H", 2, "reset", GPIO_ACTIVE_LOW),
+		{ },
+	},
+};
+
+static struct gpiod_lookup_table edb93xx_cs4272_edb9315_gpio_table = {
+	.dev_id = "spi0.0", /* CS0 on SPI0 */
+	.table = {
+		GPIO_LOOKUP("B", 6, "reset", GPIO_ACTIVE_LOW),
+		{ },
+	},
+};
+
 static void __init edb93xx_register_spi(void)
 {
 	if (machine_is_edb9301() || machine_is_edb9302())
-		edb93xx_cs4271_data.gpio_nreset = EP93XX_GPIO_LINE_EGPIO1;
+		gpiod_add_lookup_table(&edb93xx_cs4272_edb9301_gpio_table);
 	else if (machine_is_edb9302a() || machine_is_edb9307a())
-		edb93xx_cs4271_data.gpio_nreset = EP93XX_GPIO_LINE_H(2);
+		gpiod_add_lookup_table(&edb93xx_cs4272_edb9302_gpio_table);
 	else if (machine_is_edb9315a())
-		edb93xx_cs4271_data.gpio_nreset = EP93XX_GPIO_LINE_EGPIO14;
+		gpiod_add_lookup_table(&edb93xx_cs4272_edb9315_gpio_table);
 
 	gpiod_add_lookup_table(&edb93xx_spi_cs_gpio_table);
 	ep93xx_register_spi(&edb93xx_spi_info, edb93xx_spi_board_info,
diff --git a/arch/arm/mach-ep93xx/vision_ep9307.c b/arch/arm/mach-ep93xx/vision_ep9307.c
index 30d9cf3791eb..9471938df64c 100644
--- a/arch/arm/mach-ep93xx/vision_ep9307.c
+++ b/arch/arm/mach-ep93xx/vision_ep9307.c
@@ -164,7 +164,7 @@ static struct i2c_board_info vision_i2c_info[] __initdata = {
  * SPI CS4271 Audio Codec
  *************************************************************************/
 static struct cs4271_platform_data vision_cs4271_data = {
-	.gpio_nreset	= EP93XX_GPIO_LINE_H(2),
+	/* Intentionally left blank */
 };
 
 /*************************************************************************
@@ -241,6 +241,15 @@ static struct spi_board_info vision_spi_board_info[] __initdata = {
 	},
 };
 
+static struct gpiod_lookup_table vision_spi_cs4271_gpio_table = {
+	.dev_id = "spi0.0", /* cs4271 @ CS0 */
+	.table = {
+		/* RESET */
+		GPIO_LOOKUP_IDX("H", 2, NULL, 0, GPIO_ACTIVE_LOW),
+		{ },
+	},
+};
+
 static struct gpiod_lookup_table vision_spi_cs_gpio_table = {
 	.dev_id = "spi0",
 	.table = {
@@ -292,6 +301,7 @@ static void __init vision_init_machine(void)
 
 	ep93xx_register_i2c(vision_i2c_info,
 				ARRAY_SIZE(vision_i2c_info));
+	gpiod_add_lookup_table(&vision_spi_cs4271_gpio_table);
 	gpiod_add_lookup_table(&vision_spi_mmc_gpio_table);
 	gpiod_add_lookup_table(&vision_spi_cs_gpio_table);
 	ep93xx_register_spi(&vision_spi_master, vision_spi_board_info,
diff --git a/include/sound/cs4271.h b/include/sound/cs4271.h
index 6ff23ab48894..5a55d135bdea 100644
--- a/include/sound/cs4271.h
+++ b/include/sound/cs4271.h
@@ -9,7 +9,6 @@
 #define __CS4271_H
 
 struct cs4271_platform_data {
-	int gpio_nreset;	/* GPIO driving Reset pin, if any */
 	bool amutec_eq_bmutec;	/* flag to enable AMUTEC=BMUTEC */
 
 	/*
diff --git a/sound/soc/codecs/cs4271.c b/sound/soc/codecs/cs4271.c
index 9e6f8a048dd5..74a84832d958 100644
--- a/sound/soc/codecs/cs4271.c
+++ b/sound/soc/codecs/cs4271.c
@@ -13,9 +13,8 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/regulator/consumer.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
@@ -160,9 +159,7 @@ struct cs4271_private {
 	/* Current sample rate for de-emphasis control */
 	int				rate;
 	/* GPIO driving Reset pin, if any */
-	int				gpio_nreset;
-	/* GPIO that disable serial bus, if any */
-	int				gpio_disable;
+	struct gpio_desc		*reset;
 	/* enable soft reset workaround */
 	bool				enable_soft_reset;
 	struct regulator_bulk_data      supplies[ARRAY_SIZE(supply_names)];
@@ -487,12 +484,10 @@ static int cs4271_reset(struct snd_soc_component *component)
 {
 	struct cs4271_private *cs4271 = snd_soc_component_get_drvdata(component);
 
-	if (gpio_is_valid(cs4271->gpio_nreset)) {
-		gpio_direction_output(cs4271->gpio_nreset, 0);
-		mdelay(1);
-		gpio_set_value(cs4271->gpio_nreset, 1);
-		mdelay(1);
-	}
+	gpiod_direction_output(cs4271->reset, 1);
+	mdelay(1);
+	gpiod_set_value(cs4271->reset, 0);
+	mdelay(1);
 
 	return 0;
 }
@@ -612,9 +607,8 @@ static void cs4271_component_remove(struct snd_soc_component *component)
 {
 	struct cs4271_private *cs4271 = snd_soc_component_get_drvdata(component);
 
-	if (gpio_is_valid(cs4271->gpio_nreset))
-		/* Set codec to the reset state */
-		gpio_set_value(cs4271->gpio_nreset, 0);
+	/* Set codec to the reset state */
+	gpiod_set_value(cs4271->reset, 1);
 
 	regcache_mark_dirty(cs4271->regmap);
 	regulator_bulk_disable(ARRAY_SIZE(cs4271->supplies), cs4271->supplies);
@@ -639,7 +633,6 @@ static const struct snd_soc_component_driver soc_component_dev_cs4271 = {
 static int cs4271_common_probe(struct device *dev,
 			       struct cs4271_private **c)
 {
-	struct cs4271_platform_data *cs4271plat = dev->platform_data;
 	struct cs4271_private *cs4271;
 	int i, ret;
 
@@ -647,17 +640,11 @@ static int cs4271_common_probe(struct device *dev,
 	if (!cs4271)
 		return -ENOMEM;
 
-	cs4271->gpio_nreset = of_get_named_gpio(dev->of_node, "reset-gpio", 0);
-
-	if (cs4271plat)
-		cs4271->gpio_nreset = cs4271plat->gpio_nreset;
-
-	if (gpio_is_valid(cs4271->gpio_nreset)) {
-		ret = devm_gpio_request(dev, cs4271->gpio_nreset,
-					"CS4271 Reset");
-		if (ret < 0)
-			return ret;
-	}
+	cs4271->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_ASIS);
+	if (IS_ERR(cs4271->reset))
+		return dev_err_probe(dev, PTR_ERR(cs4271->reset),
+				     "error retrieveing RESET GPIO\n");
+	gpiod_set_consumer_name(cs4271->reset, "CS4271 Reset");
 
 	for (i = 0; i < ARRAY_SIZE(supply_names); i++)
 		cs4271->supplies[i].supply = supply_names[i];

-- 
2.34.1

