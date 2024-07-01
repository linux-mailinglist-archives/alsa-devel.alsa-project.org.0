Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CC091D88F
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 09:07:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81BBA22A5;
	Mon,  1 Jul 2024 09:06:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81BBA22A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719817622;
	bh=HoYOZ5VZZSoT1oPQmsk8ALI7brrvFdAyk8iW+8VaR4M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uWvJZ+65rXLiF+jj1cfN94ghx9KwQ2wlyqj9s/hVoMkhVscgHWziwqDldAd72GHyk
	 0PgCH02Q5BY1miYcD1nr4edA/J072BfMiHbCQZRU+xFXEX0KHI0bgukmZ6fjBToxOY
	 XfL7wG1FEDf7Nc5oIqWaBuyNttk2U0w6GIowgOqA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49446F805B1; Mon,  1 Jul 2024 09:06:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 040BDF805AB;
	Mon,  1 Jul 2024 09:06:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A391F804D6; Mon,  1 Jul 2024 09:02:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 492E2F800E4
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 09:02:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 492E2F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=pYqVUINS
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-57d06101d76so2839158a12.3
        for <alsa-devel@alsa-project.org>;
 Mon, 01 Jul 2024 00:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719817357; x=1720422157;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G0uxixe8SRdEtYS3hYnA/51z5ZCVTziscEpNL0ARHP8=;
        b=pYqVUINSTqDEZeiJDZyPjHUVmqqwIkOPP4lzj3DdbDiOOrj3g9MB9VAL9XyrhY1xFq
         czdOyFbzbtyfR7uCW17657/hHXsHerqeqRr3gZOeAeCSnqKsgKyGL9AGBrDkMUFcGhgg
         Hw+gU3AcHkd5gb4nZk0UT1eip/Tx6XujXHhBwwgE3lZG35lLM1nYtA0a4dw/df4LlNst
         oku3GlSZoS/JYxYB8GC8/iExZ7U/V+kuzpFA8COk2KKH8tQYdkYKtF/dnC83vZrWLWla
         gQZeNoor5gIQ4HWhej5IBypj3M72JJcLhk0CkvTJiOEGSCfGd8xCHuJtuKrwQTXy+fRX
         l8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719817357; x=1720422157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G0uxixe8SRdEtYS3hYnA/51z5ZCVTziscEpNL0ARHP8=;
        b=k+MsDmxcycaQH2XDnmCpmLSm+6zXoeyTqEhMjkNXLKC49enQJXqScV7pcFPb4ny+0m
         lS2ualt68obB5aHEVhM0t/nAFb3PDrWD3vfw1BDnlj6xNk4CbzqaNmxEfw9YWMa/RHpW
         vfozMmdDPRxfBziQT3ZPGrJx4r4UpdyM7LjUbsxsYP2tGFygdWZ6KL3H44PQ+fe3kEdn
         2SCheTw7+XZ7M4pEeEKFrLyTQXH1llDCVSjKS6z+IS5D3lv85wOHAltLYilaAC2+FgT4
         5t/2g9jdujAWrpLxgJNxoD3wQODAl7p0jO+Ek3hVSPh9NLwxsp+2lz7OBRBCTECdDRY4
         KKtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiyXdzDop2Qyg5vmscElTiKZrgVK44IX6sh03ye3KLM462RAzcQXd11mW8n5tTrAqGm7xMWVC5530RAqthfK1Euc35Jfgqt8q97Vk=
X-Gm-Message-State: AOJu0YzHR1jSUNt7y9B314Q21YhWFEWGXKdfRbuZSOYfRKppxhCcGFaC
	Ox2mGKF7ruhJL1m3HxQHPDKtsYmdxfb8tM3Q/a5lcEWerOngBIfF/S3aIXM0BUQ=
X-Google-Smtp-Source: 
 AGHT+IFpmkqFIW4SYt5Bywcq02sj5OIw8F3oMcyUDj7GJ0VoQuAFnMl+7gJ97FBtnoFNiB+QfU/AHA==
X-Received: by 2002:a05:6402:2547:b0:57d:f9f:133b with SMTP id
 4fb4d7f45d1cf-5879f0c4da6mr3053720a12.2.1719817357206;
        Mon, 01 Jul 2024 00:02:37 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5861324f036sm4034383a12.34.2024.07.01.00.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 00:02:36 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 01 Jul 2024 09:02:12 +0200
Subject: [PATCH 1/4] ASoC: tas5086: Convert to GPIO descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240701-asoc-tas-gpios-v1-1-d69ec5d79939@linaro.org>
References: <20240701-asoc-tas-gpios-v1-0-d69ec5d79939@linaro.org>
In-Reply-To: <20240701-asoc-tas-gpios-v1-0-d69ec5d79939@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shenghao Ding <13916275206@139.com>, alsa-devel@alsa-project.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0
Message-ID-Hash: FW3DAKNX2GEZR6OBSWFX3OEGX3FCVSWV
X-Message-ID-Hash: FW3DAKNX2GEZR6OBSWFX3OEGX3FCVSWV
X-MailFrom: linus.walleij@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FW3DAKNX2GEZR6OBSWFX3OEGX3FCVSWV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Switch the driver to use GPIO descriptors.

Notice that we let the gpiolib handle line inversion for the
active low reset line (nreset !reset).

There are no upstream device trees using the tas5086 compatible
string, if there were, we would need to ascertain that they all
set the GPIO_ACTIVE_LOW flag on their GPIO lines.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/tas5086.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/tas5086.c b/sound/soc/codecs/tas5086.c
index 6d45df3b9ba4..4bc1fdd232bb 100644
--- a/sound/soc/codecs/tas5086.c
+++ b/sound/soc/codecs/tas5086.c
@@ -24,14 +24,13 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/spi/spi.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
-#include <linux/of_gpio.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -246,7 +245,7 @@ struct tas5086_private {
 	/* Current sample rate for de-emphasis control */
 	int		rate;
 	/* GPIO driving Reset pin, if any */
-	int		gpio_nreset;
+	struct gpio_desc *reset;
 	struct		regulator_bulk_data supplies[ARRAY_SIZE(supply_names)];
 };
 
@@ -462,11 +461,11 @@ static int tas5086_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 
 static void tas5086_reset(struct tas5086_private *priv)
 {
-	if (gpio_is_valid(priv->gpio_nreset)) {
+	if (priv->reset) {
 		/* Reset codec - minimum assertion time is 400ns */
-		gpio_direction_output(priv->gpio_nreset, 0);
+		gpiod_direction_output(priv->reset, 1);
 		udelay(1);
-		gpio_set_value(priv->gpio_nreset, 1);
+		gpiod_set_value(priv->reset, 0);
 
 		/* Codec needs ~15ms to wake up */
 		msleep(15);
@@ -867,9 +866,9 @@ static void tas5086_remove(struct snd_soc_component *component)
 {
 	struct tas5086_private *priv = snd_soc_component_get_drvdata(component);
 
-	if (gpio_is_valid(priv->gpio_nreset))
+	if (priv->reset)
 		/* Set codec to the reset state */
-		gpio_set_value(priv->gpio_nreset, 0);
+		gpiod_set_value(priv->reset, 1);
 
 	regulator_bulk_disable(ARRAY_SIZE(priv->supplies), priv->supplies);
 };
@@ -914,7 +913,6 @@ static int tas5086_i2c_probe(struct i2c_client *i2c)
 {
 	struct tas5086_private *priv;
 	struct device *dev = &i2c->dev;
-	int gpio_nreset = -EINVAL;
 	int i, ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -940,12 +938,11 @@ static int tas5086_i2c_probe(struct i2c_client *i2c)
 
 	i2c_set_clientdata(i2c, priv);
 
-	gpio_nreset = of_get_named_gpio(dev->of_node, "reset-gpio", 0);
-	if (gpio_is_valid(gpio_nreset))
-		if (devm_gpio_request(dev, gpio_nreset, "TAS5086 Reset"))
-			gpio_nreset = -EINVAL;
-
-	priv->gpio_nreset = gpio_nreset;
+	/* Request line asserted */
+	priv->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->reset))
+		return PTR_ERR(priv->reset);
+	gpiod_set_consumer_name(priv->reset, "TAS5086 Reset");
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(priv->supplies), priv->supplies);
 	if (ret < 0) {

-- 
2.45.2

