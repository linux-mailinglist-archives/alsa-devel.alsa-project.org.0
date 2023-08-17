Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAD477F850
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Aug 2023 16:05:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ACDD839;
	Thu, 17 Aug 2023 16:04:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ACDD839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692281120;
	bh=ExejP8upjmkoti3vwoPjI3X3ePNai2/qpEyeHxxipOk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GTuhp2OYnLmcHeWRkc4oB+ogejGvPVB1D9j777VJSR6CiLp9qJmkYiMG3MJg5LOxC
	 ldh0WjF3U5f6G2bfUzz46Cr27enfgg07zagR+XC8FQgnwFAAbwqSUgLb23XH45iOxv
	 yHbAYS0sOvNSDha/z36h5EiPnNzZ2NzhQKVEdKMw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4C92F8055C; Thu, 17 Aug 2023 16:03:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA26DF80254;
	Thu, 17 Aug 2023 16:03:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDBCDF801EB; Thu, 17 Aug 2023 16:03:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 619FAF8016D
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 16:03:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 619FAF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=WE5RtX3/
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b9aa1d3029so120073291fa.2
        for <alsa-devel@alsa-project.org>;
 Thu, 17 Aug 2023 07:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692281010; x=1692885810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LIqqw/pMNM0WFKKC3NTiQx16fR5msgynp0J7IYgi66w=;
        b=WE5RtX3/0+0Xk6bnPsgBDBpqvXpMfBzdYTsh3Bjwjj6YyvPHQn9hJjjsmYj9jOE0qF
         83dUbq/m4f+LQ8lBdDSPoSS7q/2npkuEtBFwewViWCnZqya7+PBQXmfKmORq9eG2vMYA
         XWHJmWc1u3KH4/rhE0KIB0lTF0igbfpxY8WtdeWqk0EOUXUqq9iRGDNdLhmTa85+01yY
         1ToIHq5D38PhIk+yB0cZRUZyuIX47QqBn0N6LN+Zc1iKn18NQKk24UXHPt5IV1CzAAkS
         J+FIurca9rOd1aAfOU/0Hm0NvtinD+sSSoiWrtv+lQIFywTFYxzXGzZoVG3oIyJxjk7Q
         hepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692281010; x=1692885810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIqqw/pMNM0WFKKC3NTiQx16fR5msgynp0J7IYgi66w=;
        b=DscRTs5aR3leE5AiwVDFj36y00majLhEJ0UpBbqET/Pf9HDPBYELISSvnQxniH2NdY
         hkU93N7XSn63q/OlK8szLK4JOt/F4UxqnpCMnd+7Ln2qLB/GVid2GA//Vb7ANxuTaPhI
         +UTCJTOdHcpc/yDczdb7hbsA0fkY4+TLUKRQu7Ok/JRHEXZpkR91VWKpZLGYLWrvrrxu
         viiYwCcfBz8WZkAI9AxvRl5hSk2mBGqEqpgBk/bTLnlYDvlYPiKL1zuTJ7Ggc4easTvq
         BmXQBPManxg3jiRmbpy8H3QEeAqt5nhjPFiOcn9fdruwxNYTC8HTG6NDUUsDPjqKU0XF
         nRyw==
X-Gm-Message-State: AOJu0YwYi7mR+93yRtPDAUKo0iyXMhfafYpjkyeYWmIvHXUbsuCdvfRQ
	961MbivRJ26JvtR/2OyX30OT3qkVCEOi7xivD5k=
X-Google-Smtp-Source: 
 AGHT+IFZD78S4HIGKyf6Rs6uW1DQcdJj3K6+vF1CKagH2d7CwoX5ilTAehbT7IjXL7l2L4AU5JpJFg==
X-Received: by 2002:a2e:9b0d:0:b0:2b9:ba02:436c with SMTP id
 u13-20020a2e9b0d000000b002b9ba02436cmr4407547lji.28.1692281010067;
        Thu, 17 Aug 2023 07:03:30 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 g3-20020a2eb0c3000000b002b9c3e18095sm4064645ljl.14.2023.08.17.07.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 07:03:29 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Aug 2023 16:03:18 +0200
Subject: [PATCH v2 2/5] ASoC: rt5665: Convert to use GPIO descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230817-descriptors-asoc-rt-v2-2-02fa2ca3e5b0@linaro.org>
References: <20230817-descriptors-asoc-rt-v2-0-02fa2ca3e5b0@linaro.org>
In-Reply-To: <20230817-descriptors-asoc-rt-v2-0-02fa2ca3e5b0@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: 23R65A5DDU7TKL2WKSFFSHXRC6EGEQZR
X-Message-ID-Hash: 23R65A5DDU7TKL2WKSFFSHXRC6EGEQZR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/23R65A5DDU7TKL2WKSFFSHXRC6EGEQZR/>
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
index 525713c33d71..a39de4a7df00 100644
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
@@ -4659,9 +4658,6 @@ static int rt5665_parse_dt(struct rt5665_priv *rt5665, struct device *dev)
 	of_property_read_u32(dev->of_node, "realtek,jd-src",
 		&rt5665->pdata.jd_src);
 
-	rt5665->pdata.ldo1_en = of_get_named_gpio(dev->of_node,
-		"realtek,ldo1-en-gpios", 0);
-
 	return 0;
 }
 
@@ -4795,10 +4791,13 @@ static int rt5665_i2c_probe(struct i2c_client *i2c)
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

