Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA85077F851
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Aug 2023 16:05:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07D31847;
	Thu, 17 Aug 2023 16:04:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07D31847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692281134;
	bh=6QgTH2VX6miZibcN7DpNPP98RLqAHERJ7G8xczIzQBk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WpUxJwvpEd//Zhy3nAb14hjvDcSgNNiOfvUiQurctdiAL7lQi7RkFRtOWmhdHY6Bi
	 WbANc4+MAibhNViGEQVQNSBSd65kZL1vXahXUkioeJ8vDEJfTTUuIqD9WCRKEEcx0Q
	 oc0QiczqmySyUu4E2pMdMcQjwdPakWz0SfoDHKlQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3C37F80579; Thu, 17 Aug 2023 16:03:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6D2DF80564;
	Thu, 17 Aug 2023 16:03:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34D22F80254; Thu, 17 Aug 2023 16:03:36 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 23997F80027
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 16:03:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23997F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EAXiuKU/
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b9b904bb04so123720301fa.1
        for <alsa-devel@alsa-project.org>;
 Thu, 17 Aug 2023 07:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692281011; x=1692885811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8CZiR3Xu/7M/67rXheXq6UmPj0XpjwcOmaMWEgamKE=;
        b=EAXiuKU/5jqRfsfD8D636xmi7FYERS+6fk1Az+reX11zn/mygBydlX7V08cOLeGLJ8
         KQrTdrmNrVk/dSjblX9mAcIVxYtM8/pARJnzo4bK/ftUgLMUQWxA5pn6Le806J1V9k5O
         2xORBl2Ap5Z80wAKyEq+09suIGM5x/1knxYsUKmQAiTodnsGUqScoUHc4QWuvlfERPhw
         1h3LC7GG5wyW/c0ZvUE/HuB+s2VvSEDPGLQSL7wUfcjCErvKIybqYI6TqKIrRxcBdIkr
         79KKetuUbh/Aom3rbXE05v7jvmB780m4opR/BVMXk8Av/97i5szMWdfxUqFjQVGjqXEN
         TWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692281011; x=1692885811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e8CZiR3Xu/7M/67rXheXq6UmPj0XpjwcOmaMWEgamKE=;
        b=kjXlKEZJXbkCrP9WWtBq9LICRjshIsO84TZ6pjZTzJ7wRYrCnRABLtzMfI4lo2p0b1
         8Q7ChiR9dlugm6++cKMm9llNpMbrT/ltq/OpdVYQ4AYpt8VKqVYueP2QW+5TN+It2w+9
         O0+ziPQ5Ly5NrmsnGz5AgR93yG5UMJM8rllS0I9LDpw/P02LOthZ5OJNZyDkc8nSP9B0
         L7Z7zf47h/IgOgMJ2lcjDvE1ojn9exi1dw9fhPimi01Xbcf+YEnSZSj9tlQGgy4jgcB7
         mP7jxR3PVdxs5EL1c2p73M+hhPRTjPJla75eE8vOZTNsoYRzbqTraahMZIYMsDUINJwB
         WdHg==
X-Gm-Message-State: AOJu0Yxsv4gXVX+AWbNaGLwZ6ccUxRpjG8x0z2GwD+6jDeN6pRXByk7N
	OcQwWuPLEODsz3o1S2lOjy7SSWtPGtFoEpcTgB4=
X-Google-Smtp-Source: 
 AGHT+IH4gg/vR6q4py/1tlJcmjg2VOr2qGwSY69we4f+NfmGIjQ5OxOfgwbAria/spCBKz9bUzEXPA==
X-Received: by 2002:a2e:800c:0:b0:2bb:997a:493e with SMTP id
 j12-20020a2e800c000000b002bb997a493emr3549301ljg.35.1692281010969;
        Thu, 17 Aug 2023 07:03:30 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 g3-20020a2eb0c3000000b002b9c3e18095sm4064645ljl.14.2023.08.17.07.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 07:03:30 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Aug 2023 16:03:19 +0200
Subject: [PATCH v2 3/5] ASoC: rt5668: Convert to use GPIO descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230817-descriptors-asoc-rt-v2-3-02fa2ca3e5b0@linaro.org>
References: <20230817-descriptors-asoc-rt-v2-0-02fa2ca3e5b0@linaro.org>
In-Reply-To: <20230817-descriptors-asoc-rt-v2-0-02fa2ca3e5b0@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: HWK22VRSZ7K77QUGZH5WCJBIJ7DM2Q6H
X-Message-ID-Hash: HWK22VRSZ7K77QUGZH5WCJBIJ7DM2Q6H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HWK22VRSZ7K77QUGZH5WCJBIJ7DM2Q6H/>
List-Archive: <>
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

