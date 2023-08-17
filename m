Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C64D477F7CD
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Aug 2023 15:33:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3AF882A;
	Thu, 17 Aug 2023 15:32:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3AF882A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692279194;
	bh=6QgTH2VX6miZibcN7DpNPP98RLqAHERJ7G8xczIzQBk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KnW1Edv46o+E0CGBIVqok5AJWV/dVmXQEfIzfYpwz00iYk4UpA+xH9VM4213pm13P
	 AiN22kqzUguOC23A27KpY6MX5Bm0bKjndAaLYjmKgW+jh9xWTYf8rF54TwmQ5OFifP
	 3x045wlPKt7gX5HbONXIWh15KEXqdoVU5k3CUXXw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D774F80557; Thu, 17 Aug 2023 15:32:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96244F80553;
	Thu, 17 Aug 2023 15:32:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D091F8025F; Thu, 17 Aug 2023 15:32:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70BBCF8016A
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 15:30:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70BBCF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yDki6LM9
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2bba6a9b565so8569021fa.2
        for <alsa-devel@alsa-project.org>;
 Thu, 17 Aug 2023 06:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692279031; x=1692883831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8CZiR3Xu/7M/67rXheXq6UmPj0XpjwcOmaMWEgamKE=;
        b=yDki6LM9i+qIBriM0siP4gm0m6lgEoRUE4r0QuVtdYVNCXuY/59crM8xRcx9tYCoIS
         wY+XE7xhsPko65uATsdQKdKuyhOibWuCcpS2n6IdzqehGTA7fdg5vmU/6zVTJrgoqN9J
         +W60qZz/H2kqL9Nc34WtTVIPyMeV8l/2vIyrGIrgkzNPugmytyVlf3eF2iGlVPQoB6WU
         kJeBP2PyxKWMG7YYVtQW4eOLDaSj7psCCoDeSX+HUBtP2ZJBApoiJxBSXc5nceWYOnbt
         565A8KdGvIBMDNLZhVuAyxo5H/Ed3FoQ3WqvgCW8y35jp9I5y+hvurf+xrdusMuoNIpV
         8sSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692279031; x=1692883831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e8CZiR3Xu/7M/67rXheXq6UmPj0XpjwcOmaMWEgamKE=;
        b=Xa0qhMc49Hj8RuQxjijVTScdCY4FPO2o5bQG+/81Xi/udQcgh+bYKGIAoLG/LJU3nY
         d7cE+fXOchr/JP5zbZCn4wwsu0X4THFT5G/z5m2Q08WWXjsp3w/ezU8wcZWdaniO6YLa
         JKJK7EcZLZyiJnAEt5T8pfQ5nz88Ad+KjHioKfO8pOLeU2QyPBd0mJogznRwpjIjW9+X
         oSgK1WLX1P30Iml9fckFxvwpkvCNx+nlftUlwikdG2N4p+0tvDdZhLXKpLvUNVdiDG1l
         EDVU2LQyUAIgNpVxTYs5K89GX4jCCOidOwpfD5zKSHTih0Hhjgavv1qsjQF51CxwBeLm
         VK4w==
X-Gm-Message-State: AOJu0Yyp9w0fGVv0S3fgTa1RQu294Cg31o9cwkMtyvFEHWZvNh1EVzz+
	vM16SVaytCgjt5yn5axmgDR4sQ==
X-Google-Smtp-Source: 
 AGHT+IGeE48HlRTtW96eQmBM/iq4mFm1r01zZ9fkv9Usp47iNIzhkqyXOenaleIaAC/pWfpbMAx+Lg==
X-Received: by 2002:a2e:80c7:0:b0:2b6:cbba:1307 with SMTP id
 r7-20020a2e80c7000000b002b6cbba1307mr4889203ljg.0.1692279031310;
        Thu, 17 Aug 2023 06:30:31 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 z22-20020a05651c023600b002b9de06f119sm3941689ljn.67.2023.08.17.06.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 06:30:30 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Aug 2023 15:30:17 +0200
Subject: [PATCH 3/5] ASoC: rt5668: Convert to use GPIO descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230817-descriptors-asoc-rt-v1-3-434f5f177cee@linaro.org>
References: <20230817-descriptors-asoc-rt-v1-0-434f5f177cee@linaro.org>
In-Reply-To: <20230817-descriptors-asoc-rt-v1-0-434f5f177cee@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: WJBLFFOXEAACZEPBLJ2XVYF4NXGGTALH
X-Message-ID-Hash: WJBLFFOXEAACZEPBLJ2XVYF4NXGGTALH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WJBLFFOXEAACZEPBLJ2XVYF4NXGGTALH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the RT5668 to use GPIO descriptors and drop the
legacy GPIO headers.

We remove the global GPIO number from the platform data,
but it is still possible to create board files using GPIO
descriptor tables, if desired.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/sound/rt5668.h    |  3 ---
 sound/soc/codecs/rt5668.c | 17 ++++++++---------
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/include/sound/rt5668.h b/include/sound/rt5668.h
index 182edfbc9e7a..b682418c6cd6 100644
--- a/include/sound/rt5668.h
+++ b/include/sound/rt5668.h
@@ -25,9 +25,6 @@ enum rt5668_jd_src {
 };
 
 struct rt5668_platform_data {
-
-	int ldo1_en; /* GPIO for LDO1_EN */
-
 	enum rt5668_dmic1_data_pin dmic1_data_pin;
 	enum rt5668_dmic1_clk_pin dmic1_clk_pin;
 	enum rt5668_jd_src jd_src;
diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index f04c810fd710..4623b3e62487 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -15,8 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/spi/spi.h>
 #include <linux/acpi.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/mutex.h>
 #include <sound/core.h>
@@ -43,6 +42,7 @@ static const char *rt5668_supply_names[RT5668_NUM_SUPPLIES] = {
 struct rt5668_priv {
 	struct snd_soc_component *component;
 	struct rt5668_platform_data pdata;
+	struct gpio_desc *ldo1_en;
 	struct regmap *regmap;
 	struct snd_soc_jack *hs_jack;
 	struct regulator_bulk_data supplies[RT5668_NUM_SUPPLIES];
@@ -2393,9 +2393,6 @@ static int rt5668_parse_dt(struct rt5668_priv *rt5668, struct device *dev)
 	of_property_read_u32(dev->of_node, "realtek,jd-src",
 		&rt5668->pdata.jd_src);
 
-	rt5668->pdata.ldo1_en = of_get_named_gpio(dev->of_node,
-		"realtek,ldo1-en-gpios", 0);
-
 	return 0;
 }
 
@@ -2497,10 +2494,12 @@ static int rt5668_i2c_probe(struct i2c_client *i2c)
 		return ret;
 	}
 
-	if (gpio_is_valid(rt5668->pdata.ldo1_en)) {
-		if (devm_gpio_request_one(&i2c->dev, rt5668->pdata.ldo1_en,
-					  GPIOF_OUT_INIT_HIGH, "rt5668"))
-			dev_err(&i2c->dev, "Fail gpio_request gpio_ldo\n");
+	rt5668->ldo1_en = devm_gpiod_get_optional(&i2c->dev,
+						  "realtek,ldo1-en",
+						  GPIOD_OUT_HIGH);
+	if (IS_ERR(rt5668->ldo1_en)) {
+		dev_err(&i2c->dev, "Fail gpio request ldo1_en\n");
+		return PTR_ERR(rt5668->ldo1_en);
 	}
 
 	/* Sleep for 300 ms miniumum */

-- 
2.34.1

