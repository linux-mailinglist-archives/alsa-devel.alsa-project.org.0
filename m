Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BABB27881C5
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 10:14:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1699486E;
	Fri, 25 Aug 2023 10:13:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1699486E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692951248;
	bh=vFZEnrTAOAQen32IAhYU+bdqfyBr2cM5J/GXiySPy/U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UNswxSM3BSPX6/xZx4w66rQNfjOzmyn61vYY4BLD7hBf61NhoE8mWRvJiteCAKP7u
	 OFsxAZsaF9csdSUvhoBRVa6dd7xSBxrC0ceUV2kydr8+aTcKFrKcuMVNX6b4M3fsuu
	 JrhDlvtAH/Kh6Xg2EMOTanOmhshtLJt98SbiS/eY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC4A6F80551; Fri, 25 Aug 2023 10:12:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF970F80557;
	Fri, 25 Aug 2023 10:12:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30AB0F800D1; Fri, 25 Aug 2023 10:12:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0E7DF800D1
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 10:12:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0E7DF800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=GS9ZcTGr
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-500a398cda5so974271e87.0
        for <alsa-devel@alsa-project.org>;
 Fri, 25 Aug 2023 01:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692951134; x=1693555934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+8MTCJJPEn/JGBNuu906jziHv3DlZsxUiatrimUoug=;
        b=GS9ZcTGr6eW5+Zq7vkkbvhEcpibZWQ4bE8pmXv4GoGIVZVtumdBnWg3aaSsIlpd8eZ
         OA8Dg6oHck9ZZK5gmQMipqBzNJtD7P6+127+CsUg0/KukeUbnDju+XvY9VTPWNiHfiHr
         3Awf4WQHKw1q7nl4tEfdW2APtKyhMOFJOT3NRGM9FZvZp7pM4oYqPnR5halDlgk0CGy8
         hHuZclux4yLY9+xGCR1fxz3SfSWT1/rTB3uNfjAaXaDX7QRQFPbF4b4va3xpM2k6qB+u
         baIyIWcC9n7gAjFCUrFzW6kHaXOn3lx+bs4EYVZyvU2CU4SRf0esWU+o8/S8qclzL3ID
         Nd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692951134; x=1693555934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+8MTCJJPEn/JGBNuu906jziHv3DlZsxUiatrimUoug=;
        b=Vk2fR95FOeu89vw9tIfPZuaC/TA/oCzikBsZIhmw6nWJLNZR96o24D7vxxvSOK43iY
         z+fnOS8yHILiDEFHpJg67Jnqr8xsZWrxuJFI+6pPQKBpCcXQwMbB3a7IUhYTZaeMhdQn
         2pNqW9GsLRyCYhZl5dwDlsLQnS7FlR4bHW+AceqPrNWdFHXkvHfMisYSEeP7hUdQ3ALG
         Hk8UsI/jihOIqlkcnUgVV7WoAZ6CxscPRfoG8JCu/Q68S5nEwfYRgK0oAZQHbA8vPBcj
         tVjgEndxWhJ/EpwEbn+2xas4bnIvv2VEVnpoPJ5MvJ7ZhiQjYY3LLsoJIoo7JxesXXF/
         SsPw==
X-Gm-Message-State: AOJu0YwgRuuz8l6mxGOG8uxNWvGPQKuDd0BMnrq8MnlocSYglwzAYKZY
	Ihx/17RMTS5KNlbYds0DzMMjnw==
X-Google-Smtp-Source: 
 AGHT+IFmnMm6qB463AlxIIOwocgb6x+Snv48XGIBxuceoO10VWRQRMRDhQd7hZBHJLCafnv2DouLkA==
X-Received: by 2002:a05:6512:33c6:b0:4f8:631b:bf77 with SMTP id
 d6-20020a05651233c600b004f8631bbf77mr14929337lfg.22.1692951134067;
        Fri, 25 Aug 2023 01:12:14 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 q28-20020ac2511c000000b004fe1a35fd15sm195559lfb.140.2023.08.25.01.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 01:12:13 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 25 Aug 2023 10:12:11 +0200
Subject: [PATCH 1/7] ASoC: max9768: Convert to use GPIO descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230825-descriptors-asoc-max-v1-1-b212292b2f08@linaro.org>
References: <20230825-descriptors-asoc-max-v1-0-b212292b2f08@linaro.org>
In-Reply-To: <20230825-descriptors-asoc-max-v1-0-b212292b2f08@linaro.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: Z3FTYSVCY3GCZ7DSAMEPRSLCVWCFANVZ
X-Message-ID-Hash: Z3FTYSVCY3GCZ7DSAMEPRSLCVWCFANVZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z3FTYSVCY3GCZ7DSAMEPRSLCVWCFANVZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The MAX9768 is pretty straight forward to convert to GPIO
descriptors.

To name the GPIO properties, I looke at the bindings in
maxim,max9759.yaml which names these GPIO "mute" and
"shutdown" respectively.

No board files using platform data exist in the kernel, new
users can use GPIO descriptor tables if desired.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/sound/max9768.h    |  4 ----
 sound/soc/codecs/max9768.c | 45 +++++++++++++++++++++++----------------------
 2 files changed, 23 insertions(+), 26 deletions(-)

diff --git a/include/sound/max9768.h b/include/sound/max9768.h
index 0f78b41d030e..8509ba0079b0 100644
--- a/include/sound/max9768.h
+++ b/include/sound/max9768.h
@@ -9,14 +9,10 @@
 
 /**
  * struct max9768_pdata - optional platform specific MAX9768 configuration
- * @shdn_gpio:	GPIO to SHDN pin. If not valid, pin must be hardwired HIGH
- * @mute_gpio:	GPIO to MUTE pin. If not valid, control for mute won't be added
  * @flags: configuration flags, e.g. set classic PWM mode (check datasheet
  *         regarding "filterless modulation" which is default).
  */
 struct max9768_pdata {
-	int shdn_gpio;
-	int mute_gpio;
 	unsigned flags;
 #define MAX9768_FLAG_CLASSIC_PWM	(1 << 0)
 };
diff --git a/sound/soc/codecs/max9768.c b/sound/soc/codecs/max9768.c
index d22b4ba51ed8..8d0ca1be99c0 100644
--- a/sound/soc/codecs/max9768.c
+++ b/sound/soc/codecs/max9768.c
@@ -9,7 +9,7 @@
 #include <linux/module.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/regmap.h>
 
 #include <sound/core.h>
@@ -27,8 +27,8 @@
 
 struct max9768 {
 	struct regmap *regmap;
-	int mute_gpio;
-	int shdn_gpio;
+	struct gpio_desc *mute;
+	struct gpio_desc *shdn;
 	u32 flags;
 };
 
@@ -42,7 +42,7 @@ static int max9768_get_gpio(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *c = snd_soc_kcontrol_component(kcontrol);
 	struct max9768 *max9768 = snd_soc_component_get_drvdata(c);
-	int val = gpio_get_value_cansleep(max9768->mute_gpio);
+	int val = gpiod_get_value_cansleep(max9768->mute);
 
 	ucontrol->value.integer.value[0] = !val;
 
@@ -55,7 +55,7 @@ static int max9768_set_gpio(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *c = snd_soc_kcontrol_component(kcontrol);
 	struct max9768 *max9768 = snd_soc_component_get_drvdata(c);
 
-	gpio_set_value_cansleep(max9768->mute_gpio, !ucontrol->value.integer.value[0]);
+	gpiod_set_value_cansleep(max9768->mute, !ucontrol->value.integer.value[0]);
 
 	return 0;
 }
@@ -138,7 +138,7 @@ static int max9768_probe(struct snd_soc_component *component)
 			return ret;
 	}
 
-	if (gpio_is_valid(max9768->mute_gpio)) {
+	if (max9768->mute) {
 		ret = snd_soc_add_component_controls(component, max9768_mute,
 				ARRAY_SIZE(max9768_mute));
 		if (ret)
@@ -171,28 +171,29 @@ static int max9768_i2c_probe(struct i2c_client *client)
 {
 	struct max9768 *max9768;
 	struct max9768_pdata *pdata = client->dev.platform_data;
-	int err;
 
 	max9768 = devm_kzalloc(&client->dev, sizeof(*max9768), GFP_KERNEL);
 	if (!max9768)
 		return -ENOMEM;
 
-	if (pdata) {
-		/* Mute on powerup to avoid clicks */
-		err = devm_gpio_request_one(&client->dev, pdata->mute_gpio,
-				GPIOF_INIT_HIGH, "MAX9768 Mute");
-		max9768->mute_gpio = err ?: pdata->mute_gpio;
-
-		/* Activate chip by releasing shutdown, enables I2C */
-		err = devm_gpio_request_one(&client->dev, pdata->shdn_gpio,
-				GPIOF_INIT_HIGH, "MAX9768 Shutdown");
-		max9768->shdn_gpio = err ?: pdata->shdn_gpio;
-
+	/* Mute on powerup to avoid clicks */
+	max9768->mute = devm_gpiod_get_optional(&client->dev,
+						"mute",
+						GPIOD_OUT_HIGH);
+	if (IS_ERR(max9768->mute))
+		return PTR_ERR(max9768->mute);
+	gpiod_set_consumer_name(max9768->mute, "MAX9768 Mute");
+
+	/* Activate chip by releasing shutdown, enables I2C */
+	max9768->shdn = devm_gpiod_get_optional(&client->dev,
+						"shutdown",
+						GPIOD_OUT_HIGH);
+	if (IS_ERR(max9768->shdn))
+		return PTR_ERR(max9768->shdn);
+	gpiod_set_consumer_name(max9768->shdn, "MAX9768 Shutdown");
+
+	if (pdata)
 		max9768->flags = pdata->flags;
-	} else {
-		max9768->shdn_gpio = -EINVAL;
-		max9768->mute_gpio = -EINVAL;
-	}
 
 	i2c_set_clientdata(client, max9768);
 

-- 
2.34.1

