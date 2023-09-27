Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C1A7B0F1B
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 00:50:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07096A4E;
	Thu, 28 Sep 2023 00:49:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07096A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695855044;
	bh=x9DHAjfWYKzpD+y8/Ojv7ps7RkYyGcukujSxSKy9540=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dO4Dn+m6zAGgPYsqrweA26a8AnNjJSXqYyj8Tthd2Fjj1ikKEK7aSwK/XQg1zirmd
	 ni3atq4XpYy+PsWDIXBjq2azl/PK2/jaVdsDOgeY0eFh1yzp6W757Id98J+ecsSsCt
	 PjGMw3Nyk3JDU9Db8OlASIri/d/zasET5TwozXoA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3291EF80558; Thu, 28 Sep 2023 00:49:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67BB5F800AE;
	Thu, 28 Sep 2023 00:49:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5C8DF80549; Thu, 28 Sep 2023 00:49:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94D55F8007C
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 00:47:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94D55F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yNTPeCC8
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5044dd5b561so14470069e87.1
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Sep 2023 15:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695854836; x=1696459636;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OpV1FPJ6dyO8NC9vUuzjI6C6mCi6OEhOeoX88LtgNes=;
        b=yNTPeCC8wY7Vp64ycD5Mqt7iNABakn10GzUL1PtZS9zt0hoxctxVGwSU5gccIe/SlG
         ohhMproEbUj0aHHlgwgGmMkDIx+cXJvGt80gqSUBNsojQhTECsSh//41UigZaqYmytTl
         d532dEpxbXv5DGTy9OgDAmzkMgHHyMtMqgZjhmMBFGC36Q203ny+5iQlbpU8qAKyCDaQ
         ZICstfnru1rIJY/LcOeTDCLnO7BXRUWsRU3pbGNARiu4wmJ9KxSSkdMF4JJiApIAjQbE
         ORFipdx8U+hHqOits2Lvg4+8aL/oGMNME6o50jSRhStyvEjfFw34yUZ9gr8qqL2353ng
         b7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695854836; x=1696459636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OpV1FPJ6dyO8NC9vUuzjI6C6mCi6OEhOeoX88LtgNes=;
        b=uG8yx87826vVhcaczl1lh/LIdx5jDBYwfLKjkMMtBCvsCWdSRLVc6r6YnHrVzYIchq
         HUQLX4plFpPrZMkepCygO5iS6k1s0hk6dxmgdIB9AVSyQKwDsEzQqc/dDpYy82THfSyZ
         EwLv6NrZtrONDWahWSFVygokCqDCR3KRZQsu/SKU8W7MEwzRQvFbbI++02FwdO/GOit+
         XRIBzuqUjI2UWcq+mglcKrgEY9p25WlsvOY3fT8jf/3uwv2I7R+m/twNlOuYaQkpV2hm
         VVrX1Y5iw4j3jXeiUnkooZS0uw49OAPvAyWL24B5GlZX+b0oNFEILq7JjyT2RyZHUdQV
         PpZA==
X-Gm-Message-State: AOJu0Yx2j9Tr5hnyPE/Z4UNkhmovvK24Xbb1K+l2RbGIxA1QxUUfkzU5
	2j5QJyNMi/7l7yjSIwmKUvgKUw==
X-Google-Smtp-Source: 
 AGHT+IFnmsvK1nxU2ZWigAtiHCfvQZQxWBNESo/oxRorRUK1l2swAncu+UDIFedYPQJbRbubcGQzmA==
X-Received: by 2002:a05:6512:159c:b0:500:8fc1:8aba with SMTP id
 bp28-20020a056512159c00b005008fc18abamr3338721lfb.26.1695854835883;
        Wed, 27 Sep 2023 15:47:15 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 ep14-20020a056512484e00b0050296068a12sm2801746lfb.30.2023.09.27.15.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 15:47:15 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Sep 2023 00:47:14 +0200
Subject: [PATCH 1/4] ASoC: rockchip: Convert RK3288 HDMI to GPIO
 descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230928-descriptors-asoc-rockchip-v1-1-a142a42d4787@linaro.org>
References: <20230928-descriptors-asoc-rockchip-v1-0-a142a42d4787@linaro.org>
In-Reply-To: <20230928-descriptors-asoc-rockchip-v1-0-a142a42d4787@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: AZUVZ453NXIBTGNAFJR3NYOKRZNKABTI
X-Message-ID-Hash: AZUVZ453NXIBTGNAFJR3NYOKRZNKABTI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AZUVZ453NXIBTGNAFJR3NYOKRZNKABTI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This converts the Rockchip RK3288 HDMI driver to use GPIO
descriptors:

- Look up the HP EN GPIO as a descriptor and handle it directly.

- Let the Jack detection core obtain and handle the HP detection
  GPIO, just pass the right name and gpiod_dev and it will
  do the job.

- As the probe() code is very insistent on getting valid
  GPIOs out of the device before it will continue, there
  is no point to carry all the code handling the GPIOs as
  optional, drop all these checks.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/rockchip/rk3288_hdmi_analog.c | 54 +++++++++++----------------------
 1 file changed, 17 insertions(+), 37 deletions(-)

diff --git a/sound/soc/rockchip/rk3288_hdmi_analog.c b/sound/soc/rockchip/rk3288_hdmi_analog.c
index 0c6bd9a019db..7199f991ec26 100644
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
@@ -113,24 +108,23 @@ static int rk_hw_params(struct snd_pcm_substream *substream,
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
 
 	/* Enable Headset Jack detection */
-	if (gpio_is_valid(machine->gpio_hp_det)) {
-		snd_soc_card_jack_new_pins(runtime->card, "Headphone Jack",
-					   SND_JACK_HEADPHONE, &headphone_jack,
-					   headphone_jack_pins,
-					   ARRAY_SIZE(headphone_jack_pins));
-		rk_hp_jack_gpio.gpio = machine->gpio_hp_det;
-		snd_soc_jack_add_gpios(&headphone_jack, 1, &rk_hp_jack_gpio);
-	}
+	rk_hp_jack_gpio.gpiod_dev = dev;
+	snd_soc_card_jack_new_pins(runtime->card, "Headphone Jack",
+				   SND_JACK_HEADPHONE, &headphone_jack,
+				   headphone_jack_pins,
+				   ARRAY_SIZE(headphone_jack_pins));
+	snd_soc_jack_add_gpios(&headphone_jack, 1, &rk_hp_jack_gpio);
 
 	return 0;
 }
@@ -182,24 +176,10 @@ static int snd_rk_mc_probe(struct platform_device *pdev)
 
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
+	machine->gpio_hp_en = devm_gpiod_get(&pdev->dev, "rockchip,hp-en", GPIOD_OUT_LOW);
+	if (IS_ERR(machine->gpio_hp_en))
+		return PTR_ERR(machine->gpio_hp_en);
+	gpiod_set_consumer_name(machine->gpio_hp_en, "hp_en");
 
 	ret = snd_soc_of_parse_card_name(card, "rockchip,model");
 	if (ret) {

-- 
2.34.1

