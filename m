Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA7C79A5F9
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 10:25:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDF60A4E;
	Mon, 11 Sep 2023 10:24:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDF60A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694420741;
	bh=vFZEnrTAOAQen32IAhYU+bdqfyBr2cM5J/GXiySPy/U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sPTIDqUaxzJns8xOlILjPFwlvBb98lPQaIvQ2GYp2AnaS6sheU5c0rTiS4MzDNoU8
	 rjSMY64WMYZ4Mhckz+rwyKRFBKYKDMA5M6No7NLsBHrdjE7swqMU0G8jOyv0EO12Za
	 ISwMt+0yhQt64nMkB5fuiTKNPhWGW1Rh7OdFdevw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E382F8056F; Mon, 11 Sep 2023 10:24:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE1DEF80431;
	Mon, 11 Sep 2023 10:24:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB804F80552; Mon, 11 Sep 2023 10:24:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B7B5F801F5
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 10:23:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B7B5F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=quNLntoZ
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-502a7e1bdc7so3024856e87.0
        for <alsa-devel@alsa-project.org>;
 Mon, 11 Sep 2023 01:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694420630; x=1695025430;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+8MTCJJPEn/JGBNuu906jziHv3DlZsxUiatrimUoug=;
        b=quNLntoZk6qr/F7ZGiS/iko/wD56SLQnv0WRdVoAopUjT8dbIhyCFOHf1sbCeScQhR
         6507VcfXwxBrx4UuqqrvmFiVSd5zpZIuOwxK6HW+NIwjLRW3OCZ6XCQFdl2+YGX2TV2v
         gWKjv+v4LcnIZuZyBdIqx/6D1Yl8N4+Ff68Nf/JIhrz6tH1FmldDfWDqkMrlmNFCek4w
         Uh0hZHra4TcKS7vVbppRH00UX0ltPLkWTCOe62iEMqMNVf6NMJg5QzY0OJcADpVOoGXe
         EPFA4zzxHCK+HSar6IXbTMMhYt90zfayzuVLE5VQ/Z6sSmokVCaLLg7GEi/ztu/NNO/S
         jO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694420630; x=1695025430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+8MTCJJPEn/JGBNuu906jziHv3DlZsxUiatrimUoug=;
        b=fjZUOEJHhNpdNtw6aZTwpIOfj1FRgWzkmZbPymWgBBft2cWRiTpC7s2CzgMyJkgSuP
         Y5W2Y8e3zRAw/J6cOydATPYZW0P7tFRoG9x7j5J4a2rwlKxQpREu1TqvoSu/DbH5KR4R
         0Tjb6ZpK1WNcOZWMhog8Bmbwt4Nu8uHFx1CZJRFx3iNDIr+YbyXw6mj3p+G2ahiqgdHh
         N3zZr6nIcWIrl4VkOwEScOp2hMt0r0Mo9qeGzT5vqNcOuZsm5O3hNxaxfg1R0DI2T+9T
         bOFif5yXLfu4wMLROCl/T4yczRnQRLylbFQmy3hmnfHY2wHlj7EbA4w22ZryQ46Ni3LZ
         Z6JA==
X-Gm-Message-State: AOJu0YweyxUZbtHsCCn5J0/OPyOGdXK98s8oaUDXKzv59MA5hQZULnho
	tSIO64VK65X5wulx3eSLYJQ0rA==
X-Google-Smtp-Source: 
 AGHT+IH2r7bEFi9jxVEwNGLaxc6z7Q9adp/d/GtZ3BsKXID0oUG7bLJPmPTXt/XXRsoZ48ICBEYqow==
X-Received: by 2002:a05:6512:1185:b0:4f8:5cde:a44f with SMTP id
 g5-20020a056512118500b004f85cdea44fmr5691530lfr.10.1694420630585;
        Mon, 11 Sep 2023 01:23:50 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 a8-20020a19f808000000b00500968ddca9sm1247712lff.136.2023.09.11.01.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 01:23:50 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Sep 2023 10:23:48 +0200
Subject: [PATCH v2 1/7] ASoC: max9768: Convert to use GPIO descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-descriptors-asoc-max-v2-1-b9d793fb768e@linaro.org>
References: <20230911-descriptors-asoc-max-v2-0-b9d793fb768e@linaro.org>
In-Reply-To: <20230911-descriptors-asoc-max-v2-0-b9d793fb768e@linaro.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: IUIRDZW2AKAUOUMBWXYFO5PBVBPQNWHH
X-Message-ID-Hash: IUIRDZW2AKAUOUMBWXYFO5PBVBPQNWHH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IUIRDZW2AKAUOUMBWXYFO5PBVBPQNWHH/>
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

