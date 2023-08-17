Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A05D477F7C8
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Aug 2023 15:32:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2472839;
	Thu, 17 Aug 2023 15:31:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2472839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692279144;
	bh=MjQpbcZu4Cskh6gWwCigkrHS7facBA+M8wnbuEZGxP0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FKMW7TAtAn+eMK3FWQzRRYgEIzoouWZy5dFfyjYFYs0mX9JJiKhpXXsdRZqvTq8HZ
	 E6QrqbdYmo8t460bka7m8DAW8cyRojzLIhlHvGOrUz8wF9XGxbMC5z9jbtdCoGym45
	 3z+u373j+4g1jwYN++KHKoHZVT2EPNF05/Z2Rx7I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E7B4F80074; Thu, 17 Aug 2023 15:30:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43E81F80551;
	Thu, 17 Aug 2023 15:30:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AABFBF80272; Thu, 17 Aug 2023 15:30:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51487F8016D
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 15:30:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51487F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=hXyVKPh5
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b962535808so117144741fa.0
        for <alsa-devel@alsa-project.org>;
 Thu, 17 Aug 2023 06:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692279030; x=1692883830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BNOoqMVm698nOhpI3ydE0vYc8DqBOEZTJiAOy8E0PkI=;
        b=hXyVKPh5fjO2uZcHvmnkc8OqWTqj28BFQCpbN+1dKi/RBkKIy985Dv0LpgHLICT0Pi
         NvP2707PROhIfew4VjATauxQnsHMUsMvtPBmqbBRFkA3nAJiyYf1ew21ouZM/krY4/lA
         OFn1aGBwNVOS+9fJkmCc1dSAVFsP/4cowovT3HGtHfbvq2JvqPzPqFUVut+U0nEDR9Ke
         KyGT4f0T2s8Pr5dHxCXnTXh8bvCHSvCUCCz63D79I0+v5nrsyow+Mf3VMtspEyCJeejB
         wFPEFypF8M+0dHrKeSjwCiOBF3KQdMW80droCb5YLMkeNVr2ukwyM4Ik4xwRf3WP8dhb
         jI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692279030; x=1692883830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNOoqMVm698nOhpI3ydE0vYc8DqBOEZTJiAOy8E0PkI=;
        b=kzOCRHnaFbOiugzuwHJHf99IrghU/GvGGqa+SXyFkJ5UHrcbyZoCaECn+RQJK+nkCU
         FUcGuDQg+RJ+zBkdIHojfpZb9B3764pi3iYziLW+bAgGFQ/aW04YO1TgK4HtcF6hcSvO
         SrjQ0Onvh9vWa7IH9fTSPcZRgyh6FCGWKy3I5jKRLitFZV/qYpryKdxX4B1MZ7hN2TO6
         Q5GmVux3kGdxSxOqb/7p8hCUetr0EOzjeUioucckL+/CezzJiUk1T9UVI9x7l7yCDd46
         rTrXR3iJf8lXhWJxgy9/cbBU/6THe7k/H/G1sW1Lte9j0EY/UE3uIEZwVfesANjHv+6L
         qW0g==
X-Gm-Message-State: AOJu0YwO+Gdt6pT1ORNeXusfcSgr6mG0w9O43WYC+eJbNmi8kUu3fHZK
	hA/+YNwsE0CB18FEskD8190izA==
X-Google-Smtp-Source: 
 AGHT+IGO/arhzSWJPDt9FPBED/DvM6kvsgmgPbfbFOHw19Yk69HSz44ihaJnswd3VeLBgmTbjECv4A==
X-Received: by 2002:a05:651c:1031:b0:2b6:df6b:84c0 with SMTP id
 w17-20020a05651c103100b002b6df6b84c0mr3985964ljm.25.1692279029964;
        Thu, 17 Aug 2023 06:30:29 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 z22-20020a05651c023600b002b9de06f119sm3941689ljn.67.2023.08.17.06.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 06:30:29 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Aug 2023 15:30:16 +0200
Subject: [PATCH 2/5] ASoC: rt5665: Convert to use GPIO descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230817-descriptors-asoc-rt-v1-2-434f5f177cee@linaro.org>
References: <20230817-descriptors-asoc-rt-v1-0-434f5f177cee@linaro.org>
In-Reply-To: <20230817-descriptors-asoc-rt-v1-0-434f5f177cee@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: RVVMEGPQDY57NDPFV7LNYY4MAQAA7IS6
X-Message-ID-Hash: RVVMEGPQDY57NDPFV7LNYY4MAQAA7IS6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RVVMEGPQDY57NDPFV7LNYY4MAQAA7IS6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The RT5665 driver has some stub support for GPIO descriptors
going back to the initial driver commit, where there are
two GPIO descriptors for the LDO and headphone detection
defined in the device state. Well, let's make use of the
descriptor properly.

We remove the global GPIO number from the platform data,
but it is still possible to create board files using GPIO
descriptor tables, if desired.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/sound/rt5665.h    |  2 --
 sound/soc/codecs/rt5665.c | 17 ++++++++---------
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/include/sound/rt5665.h b/include/sound/rt5665.h
index 3b3d6a19ca49..e865f041929b 100644
--- a/include/sound/rt5665.h
+++ b/include/sound/rt5665.h
@@ -31,8 +31,6 @@ struct rt5665_platform_data {
 	bool in3_diff;
 	bool in4_diff;
 
-	int ldo1_en; /* GPIO for LDO1_EN */
-
 	enum rt5665_dmic1_data_pin dmic1_data_pin;
 	enum rt5665_dmic2_data_pin dmic2_data_pin;
 	enum rt5665_jd_src jd_src;
diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 83c367af91da..cbc8069ab3a8 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
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
@@ -4657,9 +4656,6 @@ static int rt5665_parse_dt(struct rt5665_priv *rt5665, struct device *dev)
 	of_property_read_u32(dev->of_node, "realtek,jd-src",
 		&rt5665->pdata.jd_src);
 
-	rt5665->pdata.ldo1_en = of_get_named_gpio(dev->of_node,
-		"realtek,ldo1-en-gpios", 0);
-
 	return 0;
 }
 
@@ -4793,10 +4789,13 @@ static int rt5665_i2c_probe(struct i2c_client *i2c)
 		return ret;
 	}
 
-	if (gpio_is_valid(rt5665->pdata.ldo1_en)) {
-		if (devm_gpio_request_one(&i2c->dev, rt5665->pdata.ldo1_en,
-					  GPIOF_OUT_INIT_HIGH, "rt5665"))
-			dev_err(&i2c->dev, "Fail gpio_request gpio_ldo\n");
+
+	rt5665->gpiod_ldo1_en = devm_gpiod_get_optional(&i2c->dev,
+							"realtek,ldo1-en",
+							GPIOD_OUT_HIGH);
+	if (IS_ERR(rt5665->gpiod_ldo1_en)) {
+		dev_err(&i2c->dev, "Failed gpio request ldo1_en\n");
+		return PTR_ERR(rt5665->gpiod_ldo1_en);
 	}
 
 	/* Sleep for 300 ms miniumum */

-- 
2.34.1

