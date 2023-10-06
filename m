Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5EB7BB9BC
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 15:48:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA155828;
	Fri,  6 Oct 2023 15:47:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA155828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696600102;
	bh=/GsmH7kzfcZF2ucmFjRSn36eSIfc//rHDAM6A6m6M0o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TCg/vDwpQQClwzyoVkxMDbWS2gVdqmFyJGgelIJuiMwnlUiw50e6slUriZMvbvwmu
	 aIu08NMK9wd6KRRqDILHNCh1I6wwRckgkhuJ7eetxUtRlg55Rtg9srXXkXapUwVKiF
	 +gqpik2fkIW3CP8uL7/RnQLsPyl1VR55fFlsCBPY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39D45F80557; Fri,  6 Oct 2023 15:46:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B382EF80557;
	Fri,  6 Oct 2023 15:46:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83582F8055A; Fri,  6 Oct 2023 15:46:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9AC3F8047D
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 15:46:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9AC3F8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=tH5Kf923
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5041d6d8b10so2782685e87.2
        for <alsa-devel@alsa-project.org>;
 Fri, 06 Oct 2023 06:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696599989; x=1697204789;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gs9kODHBf7pe1hvttMIGP4XQeIHebOI3TikCUwTzhsU=;
        b=tH5Kf923e4z5evzxnggkdigKSS7U74yYB8Rs9B+uahtMhkxC0VU3tcKWjsma7vCHuk
         ZTeX3wLpNQ+UZE+H0XhY8UFrz8zRdv+eAmoQ5asayHiYVZ7+HbmN8AI8MF3Bu3ivFQYv
         NvoSc7HYzOEdbd5ta216jV3Pyq7s1VVQGDE6/negWvQkkVSFHTM1FbTQjos3mUO6GTtQ
         gchfzudqZBna7YpGrANS0gZP9hbjoCJzWGrePZdbfm2gJbFtkan5q8VVQgry2vQtp8j4
         3hVn/pdoP9hfYE8ZC+VunUWpuJ8b1KPHzp6hiA/+/jrJ1c2L6vsLPAquIYqyo80/g6XQ
         kihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696599989; x=1697204789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gs9kODHBf7pe1hvttMIGP4XQeIHebOI3TikCUwTzhsU=;
        b=O+XIBMS1hRx1fDMnKuu8Arq/Y8drngMm8eE30Eo5KrV2PzAtCn8WeMFla7O7TiS7C/
         3d4HMm7bggiR6+PP5pSEiUKefvP2RQTCme+u16NirD3jY7MGCvs/G0qQLyFCCrQDZPKW
         Ig+r3GC+iKHMN1YAEX5lwaYwENE0Pi+2Ps3LRagaNddbuLMGrT50TWlDTHDTE2EwAxLX
         9gNEtcIquVYc6GQjFDppmtm1gPnaAXawTti1jvBBGZSXSpLaVs37CekVvoDsSuSRX+XH
         ZsVmp9prmMqDzUw0X/lyQNgxrJbq3Nqb654e5NuDejDiPWV8KZv0T8GZERgHVRsguv2B
         Jd1Q==
X-Gm-Message-State: AOJu0YxMuN8f5ldEQ1AkDJ+kcwTqvn0jsLrNCrahoi8JYTTZkH0ij07u
	6hV9N96lXgOwSlFTUv4mJMdhtl1an0WXNpb6x9M=
X-Google-Smtp-Source: 
 AGHT+IGilaqLsNAkpUFN8HUXTZkEVfQxXSILLUJqpOsm7o4gtJ9UIFBnw+6Mj0Tl221lqSmXK7G3yQ==
X-Received: by 2002:a05:6512:238a:b0:502:a588:6609 with SMTP id
 c10-20020a056512238a00b00502a5886609mr9257631lfv.3.1696599989015;
        Fri, 06 Oct 2023 06:46:29 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 v25-20020a197419000000b004fe37199b87sm308733lfe.156.2023.10.06.06.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:46:28 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 06 Oct 2023 15:46:25 +0200
Subject: [PATCH 2/8] ASoC: mediatek: mt2701-cs42448: Convert to GPIO
 descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231006-descriptors-asoc-mediatek-v1-2-07fe79f337f5@linaro.org>
References: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
In-Reply-To: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 alsa-devel@alsa-project.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: JPBKRP4P37LAXNB25FJMWEMPWXCXNIBU
X-Message-ID-Hash: JPBKRP4P37LAXNB25FJMWEMPWXCXNIBU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JPBKRP4P37LAXNB25FJMWEMPWXCXNIBU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver is pretty straight-forward to convert to use GPIO
descriptors, however a separate patch is needed to accept
the DT GPIO resources ending with "-gpio1" and "-gpio2"
instead of the standard "-gpio" or "-gpios" name convention.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/mediatek/mt2701/mt2701-cs42448.c | 54 ++++++++++++------------------
 1 file changed, 22 insertions(+), 32 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-cs42448.c b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
index 08ef109744c7..81b695a19dc7 100644
--- a/sound/soc/mediatek/mt2701/mt2701-cs42448.c
+++ b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
@@ -10,16 +10,15 @@
 #include <linux/module.h>
 #include <sound/soc.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/pinctrl/consumer.h>
-#include <linux/of_gpio.h>
 
 #include "mt2701-afe-common.h"
 
 struct mt2701_cs42448_private {
 	int i2s1_in_mux;
-	int i2s1_in_mux_gpio_sel_1;
-	int i2s1_in_mux_gpio_sel_2;
+	struct gpio_desc *i2s1_in_mux_sel_1;
+	struct gpio_desc *i2s1_in_mux_sel_2;
 };
 
 static const char * const i2sin_mux_switch_text[] = {
@@ -53,20 +52,20 @@ static int mt2701_cs42448_i2sin1_mux_set(struct snd_kcontrol *kcontrol,
 
 	switch (ucontrol->value.integer.value[0]) {
 	case 0:
-		gpio_set_value(priv->i2s1_in_mux_gpio_sel_1, 0);
-		gpio_set_value(priv->i2s1_in_mux_gpio_sel_2, 0);
+		gpiod_set_value(priv->i2s1_in_mux_sel_1, 0);
+		gpiod_set_value(priv->i2s1_in_mux_sel_2, 0);
 		break;
 	case 1:
-		gpio_set_value(priv->i2s1_in_mux_gpio_sel_1, 1);
-		gpio_set_value(priv->i2s1_in_mux_gpio_sel_2, 0);
+		gpiod_set_value(priv->i2s1_in_mux_sel_1, 1);
+		gpiod_set_value(priv->i2s1_in_mux_sel_2, 0);
 		break;
 	case 2:
-		gpio_set_value(priv->i2s1_in_mux_gpio_sel_1, 0);
-		gpio_set_value(priv->i2s1_in_mux_gpio_sel_2, 1);
+		gpiod_set_value(priv->i2s1_in_mux_sel_1, 0);
+		gpiod_set_value(priv->i2s1_in_mux_sel_2, 1);
 		break;
 	case 3:
-		gpio_set_value(priv->i2s1_in_mux_gpio_sel_1, 1);
-		gpio_set_value(priv->i2s1_in_mux_gpio_sel_2, 1);
+		gpiod_set_value(priv->i2s1_in_mux_sel_1, 1);
+		gpiod_set_value(priv->i2s1_in_mux_sel_2, 1);
 		break;
 	default:
 		dev_warn(card->dev, "%s invalid setting\n", __func__);
@@ -382,27 +381,18 @@ static int mt2701_cs42448_machine_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	priv->i2s1_in_mux_gpio_sel_1 =
-		of_get_named_gpio(dev->of_node, "i2s1-in-sel-gpio1", 0);
-	if (gpio_is_valid(priv->i2s1_in_mux_gpio_sel_1)) {
-		ret = devm_gpio_request(dev, priv->i2s1_in_mux_gpio_sel_1,
-					"i2s1_in_mux_gpio_sel_1");
-		if (ret)
-			dev_warn(&pdev->dev, "%s devm_gpio_request fail %d\n",
-				 __func__, ret);
-		gpio_direction_output(priv->i2s1_in_mux_gpio_sel_1, 0);
-	}
+	priv->i2s1_in_mux_sel_1 = devm_gpiod_get_optional(dev, "i2s1-in-sel-gpio1",
+							  GPIOD_OUT_LOW);
+	if (IS_ERR(priv->i2s1_in_mux_sel_1))
+		return dev_err_probe(dev, PTR_ERR(priv->i2s1_in_mux_sel_1),
+				     "error getting mux 1 selector\n");
+
+	priv->i2s1_in_mux_sel_2 = devm_gpiod_get_optional(dev, "i2s1-in-sel-gpio2",
+							  GPIOD_OUT_LOW);
+	if (IS_ERR(priv->i2s1_in_mux_sel_2))
+		return dev_err_probe(dev, PTR_ERR(priv->i2s1_in_mux_sel_2),
+				     "error getting mux 2 selector\n");
 
-	priv->i2s1_in_mux_gpio_sel_2 =
-		of_get_named_gpio(dev->of_node, "i2s1-in-sel-gpio2", 0);
-	if (gpio_is_valid(priv->i2s1_in_mux_gpio_sel_2)) {
-		ret = devm_gpio_request(dev, priv->i2s1_in_mux_gpio_sel_2,
-					"i2s1_in_mux_gpio_sel_2");
-		if (ret)
-			dev_warn(&pdev->dev, "%s devm_gpio_request fail2 %d\n",
-				 __func__, ret);
-		gpio_direction_output(priv->i2s1_in_mux_gpio_sel_2, 0);
-	}
 	snd_soc_card_set_drvdata(card, priv);
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);

-- 
2.34.1

