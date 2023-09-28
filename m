Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F9C7B2843
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 00:14:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9866DE5;
	Fri, 29 Sep 2023 00:13:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9866DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695939286;
	bh=e5uMytFORBtEIHAjSylc3qhIWcry5i4MxZvbLyhQDeM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lfDr7xAlvBJPkuDXhUXDe7qMW3ZKRHTY9Tib40oII/+RcE3Tcm24UIs7d8RBmmDTa
	 AnGYST8mdBoL/bCIZWFXziNx8N7DObcbEeU6NZ0wlvpydBC2bL5scmdmCg0Nz9cCY1
	 QXJpP8CM/2agQ2fzFduzbX8oaH5yggUFsOty/ac0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 071C4F80571; Fri, 29 Sep 2023 00:13:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A692BF8055C;
	Fri, 29 Sep 2023 00:13:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8693F80563; Fri, 29 Sep 2023 00:13:04 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D5AC6F801D5
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 00:13:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5AC6F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=N0RrBlq2
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5041d6d8b10so22069669e87.2
        for <alsa-devel@alsa-project.org>;
 Thu, 28 Sep 2023 15:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695939178; x=1696543978;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gEziQa3WMTxBubEiTduzNr8x972su8Z0Wh8gtotlZpA=;
        b=N0RrBlq2LALGRAJWEuUV618XnjYIiytLJK0ZzD4IIHE8fFCXd/JxOTAyHqovdRgObV
         CZzcf5AzqFbeCvlAEfTbFUTB4F49Lmaq3eWGKHXg2t0vNn6tWs/1YYTxSe98ndiqq0zM
         UQO8N40FVPqzzi911oy80qA7I9+yBpAFHhVQTnuXn4OGxdDEaUO+w/nQ/fJ1dTKloWli
         i74kOIVsYJpB2/i5SDLIKpP3HE6sCnVFdVYccGGImNZBeIhvlQqzlew0N9hwB/LwAWtX
         MWBF3Xrjh4S0oIxp7Rf1qE3srIVuirdk6bsksPGCUDU5ANfZc3m7TstDKfaX/MY/gT5W
         seEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695939178; x=1696543978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gEziQa3WMTxBubEiTduzNr8x972su8Z0Wh8gtotlZpA=;
        b=Ua8GtTYjodO9Ordj0OQ9GgmlAMf+0aQp8GLiwZGvyWu51bzZWrf73mppWVJZnNuZM7
         WqqbUKyVmE5igTFJZSPeLSKoma/HFvb3awUQuDFl4uEEwltSoPibbL0eFOdPhAvvlZc1
         ZFb/gPdbUaZOGMLorIIHlvwsl9nwaf1wHeFnJG0qRlg8v1V660iCclzWfXD6dOF0brxb
         1nCYmusFT9OWLCGV6+nBImOtwmnrnkjDx1mU/a/7OWKxqJ1LU5pVqcrS1ndjSEvySK5T
         YO7hLa5pGcAcgWcuywB7i80qB0JxHgE/r46VvVCLNZD/gRWK6CHW/l73J7bRAR6daY5P
         +gWg==
X-Gm-Message-State: AOJu0YwjJ1PbrrL+zKSHyjAmeKl6Vb+muaZ3yJO7y1UmVh8Nz0HxcwRI
	dbayG3Hw9523rmEAY2Knzi1GYTj121Gui0I326A=
X-Google-Smtp-Source: 
 AGHT+IGzel1RkPZ4JzmTAzm8NUoePCdFt5ZlaT/NGsNucaV0V6gsJlM+udU+/kODIJyvFU9Ivj83aA==
X-Received: by 2002:a05:6512:448:b0:4e0:a426:6ddc with SMTP id
 y8-20020a056512044800b004e0a4266ddcmr2091697lfk.0.1695939177623;
        Thu, 28 Sep 2023 15:12:57 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 r27-20020ac25a5b000000b005030cef433esm3271964lfn.94.2023.09.28.15.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 15:12:56 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Sep 2023 00:12:54 +0200
Subject: [PATCH v2 1/4] ASoC: rockchip: Convert RK3288 HDMI to GPIO
 descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-descriptors-asoc-rockchip-v2-1-2d2c0e043aab@linaro.org>
References: <20230929-descriptors-asoc-rockchip-v2-0-2d2c0e043aab@linaro.org>
In-Reply-To: <20230929-descriptors-asoc-rockchip-v2-0-2d2c0e043aab@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: FOOIMJWP2SWEGJVTG5PBVKPKH5ZOWRND
X-Message-ID-Hash: FOOIMJWP2SWEGJVTG5PBVKPKH5ZOWRND
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FOOIMJWP2SWEGJVTG5PBVKPKH5ZOWRND/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This converts the Rockchip RK3288 HDMI driver to use GPIO
descriptors:

- Look up the HP EN GPIO as an optional descriptor and handle
  it directly, the gpiod API is NULL-tolerant so no special
  guards are needed.

- Let the Jack detection core obtain and handle the HP detection
  GPIO, just pass the right name and gpiod_dev and it will
  do the job. Make sure to check that the GPIO property
  is there first, so it becomes optional.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/rockchip/rk3288_hdmi_analog.c | 46 ++++++++++-----------------------
 1 file changed, 14 insertions(+), 32 deletions(-)

diff --git a/sound/soc/rockchip/rk3288_hdmi_analog.c b/sound/soc/rockchip/rk3288_hdmi_analog.c
index 0c6bd9a019db..cdb5dfd0d1d4 100644
--- a/sound/soc/rockchip/rk3288_hdmi_analog.c
+++ b/sound/soc/rockchip/rk3288_hdmi_analog.c
@@ -12,8 +12,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 #include <sound/core.h>
 #include <sound/jack.h>
 #include <sound/pcm.h>
@@ -26,8 +25,7 @@
 #define DRV_NAME "rk3288-snd-hdmi-analog"
 
 struct rk_drvdata {
-	int gpio_hp_en;
-	int gpio_hp_det;
+	struct gpio_desc *gpio_hp_en;
 };
 
 static int rk_hp_power(struct snd_soc_dapm_widget *w,
@@ -35,11 +33,8 @@ static int rk_hp_power(struct snd_soc_dapm_widget *w,
 {
 	struct rk_drvdata *machine = snd_soc_card_get_drvdata(w->dapm->card);
 
-	if (!gpio_is_valid(machine->gpio_hp_en))
-		return 0;
-
-	gpio_set_value_cansleep(machine->gpio_hp_en,
-				SND_SOC_DAPM_EVENT_ON(event));
+	gpiod_set_value_cansleep(machine->gpio_hp_en,
+				 SND_SOC_DAPM_EVENT_ON(event));
 
 	return 0;
 }
@@ -113,22 +108,23 @@ static int rk_hw_params(struct snd_pcm_substream *substream,
 }
 
 static struct snd_soc_jack_gpio rk_hp_jack_gpio = {
-	.name = "Headphone detection",
+	.name = "rockchip,hp-det",
 	.report = SND_JACK_HEADPHONE,
 	.debounce_time = 150
 };
 
 static int rk_init(struct snd_soc_pcm_runtime *runtime)
 {
-	struct rk_drvdata *machine = snd_soc_card_get_drvdata(runtime->card);
+	struct snd_soc_card *card = runtime->card;
+	struct device *dev = card->dev;
 
-	/* Enable Headset Jack detection */
-	if (gpio_is_valid(machine->gpio_hp_det)) {
+	/* Enable optional Headset Jack detection */
+	if (of_property_present(dev->of_node, "rockchip,hp-det-gpios")) {
+		rk_hp_jack_gpio.gpiod_dev = dev;
 		snd_soc_card_jack_new_pins(runtime->card, "Headphone Jack",
 					   SND_JACK_HEADPHONE, &headphone_jack,
 					   headphone_jack_pins,
 					   ARRAY_SIZE(headphone_jack_pins));
-		rk_hp_jack_gpio.gpio = machine->gpio_hp_det;
 		snd_soc_jack_add_gpios(&headphone_jack, 1, &rk_hp_jack_gpio);
 	}
 
@@ -182,24 +178,10 @@ static int snd_rk_mc_probe(struct platform_device *pdev)
 
 	card->dev = &pdev->dev;
 
-	machine->gpio_hp_det = of_get_named_gpio(np,
-		"rockchip,hp-det-gpios", 0);
-	if (!gpio_is_valid(machine->gpio_hp_det) && machine->gpio_hp_det != -ENODEV)
-		return machine->gpio_hp_det;
-
-	machine->gpio_hp_en = of_get_named_gpio(np,
-		"rockchip,hp-en-gpios", 0);
-	if (!gpio_is_valid(machine->gpio_hp_en) && machine->gpio_hp_en != -ENODEV)
-		return machine->gpio_hp_en;
-
-	if (gpio_is_valid(machine->gpio_hp_en)) {
-		ret = devm_gpio_request_one(&pdev->dev, machine->gpio_hp_en,
-					    GPIOF_OUT_INIT_LOW, "hp_en");
-		if (ret) {
-			dev_err(card->dev, "cannot get hp_en gpio\n");
-			return ret;
-		}
-	}
+	machine->gpio_hp_en = devm_gpiod_get_optional(&pdev->dev, "rockchip,hp-en", GPIOD_OUT_LOW);
+	if (IS_ERR(machine->gpio_hp_en))
+		return PTR_ERR(machine->gpio_hp_en);
+	gpiod_set_consumer_name(machine->gpio_hp_en, "hp_en");
 
 	ret = snd_soc_of_parse_card_name(card, "rockchip,model");
 	if (ret) {

-- 
2.34.1

