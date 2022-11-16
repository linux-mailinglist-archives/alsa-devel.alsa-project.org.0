Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F1362B2DF
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 06:40:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC5541690;
	Wed, 16 Nov 2022 06:39:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC5541690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668577229;
	bh=eEZuANnkil/DzBZgGMvkD9taL7U5fptBZwhesV7REi4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Daz3TIzQjveXdj+xfOxC6gPHE7ePk5E48r0C6DWfx0PssO/O7NW4XnEauK+q+gwTQ
	 uoqMRmS0yyb6erWKDwFlG5UWLEEUnfY1FZbB+ptilLfTlNYjtq7mR30ZMW0Hl2z7xO
	 je5BkeXuphORzsWMgP7YvjNxvNJ+v+xsx1p3pdUE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD1AAF80578;
	Wed, 16 Nov 2022 06:38:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55224F80557; Wed, 16 Nov 2022 06:38:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A469F804A9
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 06:38:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A469F804A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Hdfcb6sJ"
Received: by mail-pj1-x102f.google.com with SMTP id o7so15579234pjj.1
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 21:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r01ypcYo+LtD9fhypz7U4KPnsRobXTNuGoo4vyNF/vc=;
 b=Hdfcb6sJtZK0d4iSfc/c+K5+0PYEPfETP19Nve63ggNiKTbV6nRrj4Vb4GfGLphU77
 JL9fPjFGZN+xuLVLnY9F8MtLwtXD10i7AxQh0kdt+xCvJCzv0IxzCLnwB3CiEO0++qQ8
 cvbX71x5YS4YX4MOl3W89daY6QxvCAdYtGF2kIJTH8YFYBTDBvWd+yEE59Z1oqf5Mgsu
 MswmnkG/O1rW5lzeLp9bQUxKADGJ05ftzgyMVFqGQ75+4mK2VU9l4bxqOZ08fz/LaIAO
 rXeBGl4jU92zG9ChdWwmYbEGZZtcxAdlkg4m7CV+U61qWVVU26rLYvH2PbRXwv+fCFMV
 dacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r01ypcYo+LtD9fhypz7U4KPnsRobXTNuGoo4vyNF/vc=;
 b=eAUPU6yG91IyQHqtvBxNHfUnavimsNSdLh+2fsKNZlW9vIEEtUMVRo2P3qbTZ2rBNL
 06M4/z0Rss855NytFKEkYpuFjumpDgdCsUHgHtBPu2KYfWKvb8WO0kL2+pDWEouUt/rF
 vNZKJ+r8nt1rLl5033Dg60a1hUsxUp6gV/OdCpahWKGo3RJsg+3egZQsEwqI8B31Tjk9
 Wv8lAKm1ncZPJ1NOBA6UO/4IJI99128MS2kbqb0q/QOk3MZSyLTbpWzfOZ4njpRsREqh
 tSOeNN0tt6LOHz5NnZKvvVAIZdpAGVwkEZQ6IGRXvUL7g+QpJ55UG+zrLOCvDJ/LjCjJ
 PTFA==
X-Gm-Message-State: ANoB5pmn6gMNAK3v7hT/icF49hFeU8Om4mqprncKdZxn1tof3yndTIcX
 ixBPZzMnntzeb9h+lPDtQN8=
X-Google-Smtp-Source: AA0mqf6LzBMQD9KXFyMAhXpG5nVIjWO4CGNYGngv2AR+5vF/Q88oiCVvIcdaMKPNZkqy9cGqtNtfAQ==
X-Received: by 2002:a17:903:2789:b0:186:9b19:1dbb with SMTP id
 jw9-20020a170903278900b001869b191dbbmr7643358plb.59.1668577109573; 
 Tue, 15 Nov 2022 21:38:29 -0800 (PST)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:2d36:e9a0:170b:669f])
 by smtp.gmail.com with ESMTPSA id
 ik13-20020a170902ab0d00b0017834a6966csm10881038plb.176.2022.11.15.21.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 21:38:28 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 05/11] ASoC: tpa6130a2: switch to using gpiod API
Date: Tue, 15 Nov 2022 21:38:11 -0800
Message-Id: <20221116053817.2929810-5-dmitry.torokhov@gmail.com>
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
 sound/soc/codecs/tpa6130a2.c | 42 +++++++++++++++---------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/sound/soc/codecs/tpa6130a2.c b/sound/soc/codecs/tpa6130a2.c
index 5f00bfc32917..696a27b472aa 100644
--- a/sound/soc/codecs/tpa6130a2.c
+++ b/sound/soc/codecs/tpa6130a2.c
@@ -9,15 +9,15 @@
 
 #include <linux/module.h>
 #include <linux/errno.h>
+#include <linux/err.h>
 #include <linux/device.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <sound/soc.h>
 #include <sound/tlv.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/regmap.h>
 
 #include "tpa6130a2.h"
@@ -32,7 +32,7 @@ struct tpa6130a2_data {
 	struct device *dev;
 	struct regmap *regmap;
 	struct regulator *supply;
-	int power_gpio;
+	struct gpio_desc *power_gpio;
 	enum tpa_model id;
 };
 
@@ -48,8 +48,8 @@ static int tpa6130a2_power(struct tpa6130a2_data *data, bool enable)
 			return ret;
 		}
 		/* Power on */
-		if (data->power_gpio >= 0)
-			gpio_set_value(data->power_gpio, 1);
+		if (data->power_gpio)
+			gpiod_set_value(data->power_gpio, 1);
 
 		/* Sync registers */
 		regcache_cache_only(data->regmap, false);
@@ -58,8 +58,8 @@ static int tpa6130a2_power(struct tpa6130a2_data *data, bool enable)
 			dev_err(data->dev,
 				"Failed to sync registers: %d\n", ret);
 			regcache_cache_only(data->regmap, true);
-			if (data->power_gpio >= 0)
-				gpio_set_value(data->power_gpio, 0);
+			if (data->power_gpio)
+				gpiod_set_value(data->power_gpio, 0);
 			ret2 = regulator_disable(data->supply);
 			if (ret2 != 0)
 				dev_err(data->dev,
@@ -75,8 +75,8 @@ static int tpa6130a2_power(struct tpa6130a2_data *data, bool enable)
 		regcache_cache_only(data->regmap, true);
 
 		/* Power off */
-		if (data->power_gpio >= 0)
-			gpio_set_value(data->power_gpio, 0);
+		if (data->power_gpio)
+			gpiod_set_value(data->power_gpio, 0);
 
 		ret = regulator_disable(data->supply);
 		if (ret != 0) {
@@ -224,37 +224,29 @@ static int tpa6130a2_probe(struct i2c_client *client)
 	unsigned int version;
 	int ret;
 
-	if (!dev->of_node)
-		return -ENODEV;
-
 	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
+	i2c_set_clientdata(client, data);
 	data->dev = dev;
 
 	data->regmap = devm_regmap_init_i2c(client, &tpa6130a2_regmap_config);
 	if (IS_ERR(data->regmap))
 		return PTR_ERR(data->regmap);
 
-	data->power_gpio = of_get_named_gpio(dev->of_node, "power-gpio", 0);
+	data->power_gpio = devm_gpiod_get_optional(dev, "power", GPIOD_OUT_LOW);
+	ret = PTR_ERR_OR_ZERO(data->power_gpio);
+	if (ret) {
+		dev_err(dev, "Failed to request power GPIO: %d\n", ret);
+		return ret;
+	}
 
-	i2c_set_clientdata(client, data);
+	gpiod_set_consumer_name(data->power_gpio, "tpa6130a2 enable");
 
 	id = i2c_match_id(tpa6130a2_id, client);
 	data->id = id->driver_data;
 
-	if (data->power_gpio >= 0) {
-		ret = devm_gpio_request(dev, data->power_gpio,
-					"tpa6130a2 enable");
-		if (ret < 0) {
-			dev_err(dev, "Failed to request power GPIO (%d)\n",
-				data->power_gpio);
-			return ret;
-		}
-		gpio_direction_output(data->power_gpio, 0);
-	}
-
 	switch (data->id) {
 	default:
 		dev_warn(dev, "Unknown TPA model (%d). Assuming 6130A2\n",
-- 
2.38.1.431.g37b22c650d-goog

