Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8267AEDFA
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 15:31:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 630C1A4D;
	Tue, 26 Sep 2023 15:30:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 630C1A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695735060;
	bh=79FC3srKKG3spQOst3tPiHPgsoH5SA3xDY6dbVQFc64=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cm3VxzEg4kH0+vGGIze51sW3rZsBJAFmiRsEn3Uvi04M8p3cH+MfCGfVlMYqI9+1I
	 LZL0jxYGvLTypzfh8laMnpiovFz9eCNe1ZB3L9siXLWawnjOL7H24ckwjreBKJuuAe
	 Uz9PbFi2ArPaOYj7ImbYvHLgFhBr5By64K2VJw60=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F2A2F805AF; Tue, 26 Sep 2023 15:28:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5210F805A9;
	Tue, 26 Sep 2023 15:28:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C750F8016A; Tue, 26 Sep 2023 15:26:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0EF0FF801D5
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 15:25:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EF0FF801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=zw74uiVq
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5041bb9ce51so14036144e87.1
        for <alsa-devel@alsa-project.org>;
 Tue, 26 Sep 2023 06:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695734737; x=1696339537;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQREjlFdBBHyFFcqZ7B0gSxB7/oIU5kFAtRf/hN0PRg=;
        b=zw74uiVqzwDg0IsNwoYcCoDROkENs2FK+rAEjNw2F2DhewuSTb0iY7nonp9LECIKPc
         xuXzTT+5gAh+J3Ubd2LECtzbeNF6LTEUd8VSoWVntM890oLvxnHA3A3cW+I27ru40Dge
         3wBPI2DnDvKYWDWlEO2dKVVk87gEowo/hGmdM+66fiPyb9CiiLEYAqbL/Ky1n7ddKAzH
         KMbXQKotIRZr49rXe6k4VMXZ9TO3ydwvn1WNvj+DN5V+8VcRoh2PVs0FV3uy5fAlNsFe
         HYxBsiPxD+Ui5JXrL9l6Xgj86Wu83pyUYVexKizffQ1WAHRp+u2H38DM6AwQn55nX+GB
         xtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695734737; x=1696339537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQREjlFdBBHyFFcqZ7B0gSxB7/oIU5kFAtRf/hN0PRg=;
        b=miHeuOUcg9wLmwaobaoMtUokKMO5Y0+zJ+zHNH3g1lTHVuEowYxVTBWQwEQou0BfAe
         wklunxMehQIRNLCx0AU/zZeo6taK+YgW97FLIeUfcgA3wvKKtm51JNqnd3kDUHuFa+5R
         WJcoJQ5K8U2d8fiCT7fSYaF8suYfNthc7WxL7R/o4EZa7+FKE1EuK5bkd5zsAq28U8Na
         dPmNhECJUIm1quVqFT0Rg+d/ltYpLxYH4PAclddjh1aTakjIdl7rSgI7G4E5YRLEOeuL
         eR78kl3atkL51AZzOQfhRx1nV7k4cY8Xh/YAvUMyVYrZ+iyy4qlkwupLYzMkUMldATZl
         aF0A==
X-Gm-Message-State: AOJu0YxWItxxPVlB9KLRzxnvbNO+nbY1LaJ14hazLznACLuc9MHdgK0N
	AZCVtN6BYc4RmVC7Z72Dy4frnQ==
X-Google-Smtp-Source: 
 AGHT+IHMuys/v1z41Pq9CuIIy/ftelPDGx7bWyJ6wtsGQexyv6AD5OHzXbCy8nEIXF0Y020uO07SZQ==
X-Received: by 2002:a05:6512:104f:b0:500:b7dc:6c90 with SMTP id
 c15-20020a056512104f00b00500b7dc6c90mr9505051lfb.36.1695734736594;
        Tue, 26 Sep 2023 06:25:36 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 eq25-20020a056512489900b0050307bf2bcdsm2221540lfb.247.2023.09.26.06.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 06:25:36 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 26 Sep 2023 15:25:30 +0200
Subject: [PATCH 2/5] ASoC: ti: Convert RX51 to use exclusively GPIO
 descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-descriptors-asoc-ti-v1-2-60cf4f8adbc5@linaro.org>
References: <20230926-descriptors-asoc-ti-v1-0-60cf4f8adbc5@linaro.org>
In-Reply-To: <20230926-descriptors-asoc-ti-v1-0-60cf4f8adbc5@linaro.org>
To: Tony Lindgren <tony@atomide.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: MHNZDWNMBR3X47H7YWM4EC67V2XEDOZ3
X-Message-ID-Hash: MHNZDWNMBR3X47H7YWM4EC67V2XEDOZ3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MHNZDWNMBR3X47H7YWM4EC67V2XEDOZ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The RX51/Nokia n900 uses the legacy GPIO header to convert a GPIO
back to the global GPIO numberspace and then the jack using it
in the snd_soc_jack_add_gpios() call immediately looks up the
corresponding descriptor again.

The snd_soc_jack_add_gpios() handles GPIOs passed with devices
just fine: pass in the device instead, and rename the GPIO
to match the property in the device tree, and it should work
all the same but without all the trouble.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/ti/rx51.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/sound/soc/ti/rx51.c b/sound/soc/ti/rx51.c
index 322c398d209b..047f852c79a9 100644
--- a/sound/soc/ti/rx51.c
+++ b/sound/soc/ti/rx51.c
@@ -10,7 +10,6 @@
  */
 
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/platform_device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -33,7 +32,6 @@ enum {
 
 struct rx51_audio_pdata {
 	struct gpio_desc *tvout_selection_gpio;
-	struct gpio_desc *jack_detection_gpio;
 	struct gpio_desc *eci_sw_gpio;
 	struct gpio_desc *speaker_amp_gpio;
 };
@@ -198,7 +196,7 @@ static struct snd_soc_jack rx51_av_jack;
 
 static struct snd_soc_jack_gpio rx51_av_jack_gpios[] = {
 	{
-		.name = "avdet-gpio",
+		.name = "jack-detection",
 		.report = SND_JACK_HEADSET,
 		.invert = 1,
 		.debounce_time = 200,
@@ -263,7 +261,6 @@ static const struct snd_kcontrol_new aic34_rx51_controls[] = {
 static int rx51_aic34_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
-	struct rx51_audio_pdata *pdata = snd_soc_card_get_drvdata(card);
 	int err;
 
 	snd_soc_limit_volume(card, "TPA6130A2 Headphone Playback Volume", 42);
@@ -283,9 +280,9 @@ static int rx51_aic34_init(struct snd_soc_pcm_runtime *rtd)
 		return err;
 	}
 
-	/* prepare gpio for snd_soc_jack_add_gpios */
-	rx51_av_jack_gpios[0].gpio = desc_to_gpio(pdata->jack_detection_gpio);
-	devm_gpiod_put(card->dev, pdata->jack_detection_gpio);
+	rx51_av_jack_gpios[0].gpiod_dev = card->dev;
+	/* Name is assigned in the struct */
+	rx51_av_jack_gpios[0].idx = 0;
 
 	err = snd_soc_jack_add_gpios(&rx51_av_jack,
 				     ARRAY_SIZE(rx51_av_jack_gpios),
@@ -425,14 +422,6 @@ static int rx51_soc_probe(struct platform_device *pdev)
 		return PTR_ERR(pdata->tvout_selection_gpio);
 	}
 
-	pdata->jack_detection_gpio = devm_gpiod_get(card->dev,
-						    "jack-detection",
-						    GPIOD_ASIS);
-	if (IS_ERR(pdata->jack_detection_gpio)) {
-		dev_err(card->dev, "could not get jack detection gpio\n");
-		return PTR_ERR(pdata->jack_detection_gpio);
-	}
-
 	pdata->eci_sw_gpio = devm_gpiod_get(card->dev, "eci-switch",
 					    GPIOD_OUT_HIGH);
 	if (IS_ERR(pdata->eci_sw_gpio)) {

-- 
2.34.1

