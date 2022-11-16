Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4450A62B2DE
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 06:40:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE92B1697;
	Wed, 16 Nov 2022 06:39:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE92B1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668577217;
	bh=t8sTlUzRwSX06bk+TSm22kOXJg5XYXa0m8zCkNZAW98=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y6IFuoW90ZhCpw8HiPWqFJJLdTxZm/slLFebsgSAtt1teWVo4n35jMA37fT3Gd514
	 aKX9rk7fT6G91/1cIJ8j/jNeR0hyUgjpFa5NhyCuzAVzJ0QDYoykW7lmuoEM+n0wvn
	 WGxMKEcQWa6nRC6ua+W17VK5wP/Co6VegguT5Lg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 032C5F80559;
	Wed, 16 Nov 2022 06:38:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 176EAF804BC; Wed, 16 Nov 2022 06:38:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0539F80163
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 06:38:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0539F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SGFwQZrp"
Received: by mail-pj1-x102c.google.com with SMTP id
 w3-20020a17090a460300b00218524e8877so1875474pjg.1
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 21:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2R6sweEIHhhYpgiaCutH/nTdz9vJpXVC7DNsSKyfy1o=;
 b=SGFwQZrpZadseImNE1dV7f7/n+GBWyuP1D3KdEwcSYytRYc/wU6ISg2+8huxQTCYpQ
 +1nw2DD75F461/POGGsS8UpOsQmzz6vdtUGLbgIYDB20G1GEZ7BrqGKq57XtDCoVVvOX
 9+TBX7/WD4kbRmZUCPbs6BMMr2f/B7CD+eSsTqWWRrBAAspwygWwOw3jfPMSNNvHj6VQ
 9znQgiT8KPVzcMwy7xoTdvAbQydBM15dwl6UdxGq6udjNangnuPM6xAI/vMJBYZPZTBS
 yj3EnfXjxf4pVRO7HLqlNGkhyjTtHOwiusaCTaqpcbUjSiTLDRNCYImFcBBAAxTLis1D
 SiZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2R6sweEIHhhYpgiaCutH/nTdz9vJpXVC7DNsSKyfy1o=;
 b=brWJBAkARbr/UxwRD7Jdlctdf0vLt7F46ivoDAzkoG0BYj9krMRyWHbCrsFNRa9jSq
 J7gXyw+nFJLzsHfirXhXMksiRfpRiw5+iVVl5qHzMty5YrJxz4wCSoxcWijCiO9vi53D
 AZMfmJHCwppoVCFHFknVtEJwxa/crnvOqQxxkADbEvZWjhoWZ4HPy+5GAPX0uX8Dazrh
 lTxoZGh0HBFi9YeasUZyqoAQEA9+lW+3tNTeu0At1J1Eu/9BXpgl2y7VotETqbla63xf
 dl1kAKtLBzz5Ltjy4D//7A+2b99FFOqoI5q8BXRDzoXXlHr+KFpO9Zr0gea3jg1xD6b3
 gm5w==
X-Gm-Message-State: ANoB5pnJ/0wJGpxGCeVj52cYjPZZhUUexGrqZ/S65Jkx7ViD99FtUX5t
 DFTA/4QXQh+iq0reB2rWdVs=
X-Google-Smtp-Source: AA0mqf69nPVB/e/jNzSi6LyOuxv4aaC/+oypv7ZD7k/OeK9pMQrXeF6o1DIcht7/Hh1QXIGXKcWPEQ==
X-Received: by 2002:a17:902:b204:b0:186:a2e3:7035 with SMTP id
 t4-20020a170902b20400b00186a2e37035mr7435171plr.74.1668577105864; 
 Tue, 15 Nov 2022 21:38:25 -0800 (PST)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:2d36:e9a0:170b:669f])
 by smtp.gmail.com with ESMTPSA id
 ik13-20020a170902ab0d00b0017834a6966csm10881038plb.176.2022.11.15.21.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 21:38:24 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 03/11] ASoC: tas5086: switch to using gpiod API
Date: Tue, 15 Nov 2022 21:38:09 -0800
Message-Id: <20221116053817.2929810-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
In-Reply-To: <20221116053817.2929810-1-dmitry.torokhov@gmail.com>
References: <20221116053817.2929810-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Switch the driver from legacy gpio API that is deprecated to the newer
gpiod API that respects line polarities described in ACPI/DT.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 sound/soc/codecs/tas5086.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/tas5086.c b/sound/soc/codecs/tas5086.c
index 22143cc5afa7..66b22b800e01 100644
--- a/sound/soc/codecs/tas5086.c
+++ b/sound/soc/codecs/tas5086.c
@@ -24,14 +24,14 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/err.h>
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
@@ -246,7 +246,7 @@ struct tas5086_private {
 	/* Current sample rate for de-emphasis control */
 	int		rate;
 	/* GPIO driving Reset pin, if any */
-	int		gpio_nreset;
+	struct gpio_desc *reset_gpio;
 	struct		regulator_bulk_data supplies[ARRAY_SIZE(supply_names)];
 };
 
@@ -462,11 +462,11 @@ static int tas5086_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 
 static void tas5086_reset(struct tas5086_private *priv)
 {
-	if (gpio_is_valid(priv->gpio_nreset)) {
+	if (priv->reset_gpio) {
 		/* Reset codec - minimum assertion time is 400ns */
-		gpio_direction_output(priv->gpio_nreset, 0);
+		gpiod_set_value_cansleep(priv->reset_gpio, 1);
 		udelay(1);
-		gpio_set_value(priv->gpio_nreset, 1);
+		gpiod_set_value_cansleep(priv->reset_gpio, 0);
 
 		/* Codec needs ~15ms to wake up */
 		msleep(15);
@@ -867,9 +867,10 @@ static void tas5086_remove(struct snd_soc_component *component)
 {
 	struct tas5086_private *priv = snd_soc_component_get_drvdata(component);
 
-	if (gpio_is_valid(priv->gpio_nreset))
+	if (priv->reset_gpio) {
 		/* Set codec to the reset state */
-		gpio_set_value(priv->gpio_nreset, 0);
+		gpiod_set_value_cansleep(priv->reset_gpio, 1);
+	}
 
 	regulator_bulk_disable(ARRAY_SIZE(priv->supplies), priv->supplies);
 };
@@ -914,7 +915,6 @@ static int tas5086_i2c_probe(struct i2c_client *i2c)
 {
 	struct tas5086_private *priv;
 	struct device *dev = &i2c->dev;
-	int gpio_nreset = -EINVAL;
 	int i, ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -940,16 +940,12 @@ static int tas5086_i2c_probe(struct i2c_client *i2c)
 
 	i2c_set_clientdata(i2c, priv);
 
-	if (of_match_device(of_match_ptr(tas5086_dt_ids), dev)) {
-		struct device_node *of_node = dev->of_node;
-		gpio_nreset = of_get_named_gpio(of_node, "reset-gpio", 0);
-	}
-
-	if (gpio_is_valid(gpio_nreset))
-		if (devm_gpio_request(dev, gpio_nreset, "TAS5086 Reset"))
-			gpio_nreset = -EINVAL;
+	priv->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	ret = PTR_ERR_OR_ZERO(priv->reset_gpio);
+	if (ret)
+		return ret;
 
-	priv->gpio_nreset = gpio_nreset;
+	gpiod_set_consumer_name(priv->reset_gpio, "TAS5086 Reset");
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(priv->supplies), priv->supplies);
 	if (ret < 0) {
-- 
2.38.1.431.g37b22c650d-goog

