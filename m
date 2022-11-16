Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A5662B2DD
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 06:39:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 623CC16A2;
	Wed, 16 Nov 2022 06:39:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 623CC16A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668577195;
	bh=HOfoUa8mmyOLcGaSybg/Fd+zXx1Ib4yfW5qxsmd31Js=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k28/iIRNAZqHZlT/SoS3tYX7aKu5x5gH4C1XlGOjld+vSOMwwrO135FZ2uHQk2Chp
	 2+zOyAHzeB+MonBEWLoMyxXq7Zs2WHYkJiT4dkr6TLBWnSXwp9JyIW4BMvBBQDnlgm
	 Mi69GlH8QgO51snDlvlQSpzfRiW0wSgv8wxl05Ac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6A4AF804BC;
	Wed, 16 Nov 2022 06:38:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D5DDF800B8; Wed, 16 Nov 2022 06:38:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBD2DF800B8
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 06:38:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBD2DF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="O9LU0JS8"
Received: by mail-pj1-x1033.google.com with SMTP id gw22so15564702pjb.3
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 21:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Mv8IbBpLkdekGE7AGRon9TYjB5CPxoZZsopxc+3pauE=;
 b=O9LU0JS8vCLzMrJ6zb77qaHvNYgKNqhBG+WIauQj6WG9zYSAm6dnNrs0cHutUfSh9x
 qzRtZnolhIfOD+aFB7tYYIJZzjAkg8T7aYSZSpFTkBuWQG0ftQo7X/u4gN23aJKyjsIk
 Po6VVr4pFEZ722hTx+CNArXH84MNDnnCV9NHuBQpViFkLpX1/ZCvHZ/0krO/pLf9mbBv
 eG6qWg0hFRbrUljZ5nCIsdTCogtWg7nNsdtLQO8bfyvccDmgj4FUb1eRWUnARowRsUZg
 I66K77RF09CTR7/VgRQxIV2EiBtxZY7yNtd1hqSIWWHYi+5vb392Dk95uyVYJLY3kRqs
 8SVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mv8IbBpLkdekGE7AGRon9TYjB5CPxoZZsopxc+3pauE=;
 b=hIRdLfl80G9TI0WpEXx2ni32XmqdyEAoHNZpoUkRlYXwA/A1/KwirG9vKQ6LF/AvNb
 sypGt1eiO1q/S91mda+THoCVuE3CPV+QLJJyAZkkJUbkRlTFhmAxm2zlaLXWJX46Yx27
 JEBYxYCqNC4GOponXlVeBmqCMBLkYT4R/X7yhOwipJl/uixx1cb2UhGZA26pWkqggSRn
 Z21iR+Rp8hb2/vl0nEGgn+geH2b/jEHSW9sRzjLO+0ZKHB9luG5fEHCJkqwlUU/ODSmJ
 DV/8W6pa36FwsmYg+E7UjznNDXc1UUY+W1OxIlgHDkWVwfXScwhuTZNrzOShaYi24+6I
 6Wbw==
X-Gm-Message-State: ANoB5pmbewN6R/54tso7wbX3R4RicTtAnLeY5bNYKTZCeG+sBYI2wvij
 TwGRAUndB16rED53myIk6+M=
X-Google-Smtp-Source: AA0mqf7WoMoXlq9y8GdxWgoMyn/khFjjuSj+m8WTDJSLDonfOrPV3r49GVlLtLExyuhQWHMJ69EHvA==
X-Received: by 2002:a17:90a:7e87:b0:212:f810:a846 with SMTP id
 j7-20020a17090a7e8700b00212f810a846mr2131715pjl.71.1668577101886; 
 Tue, 15 Nov 2022 21:38:21 -0800 (PST)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:2d36:e9a0:170b:669f])
 by smtp.gmail.com with ESMTPSA id
 ik13-20020a170902ab0d00b0017834a6966csm10881038plb.176.2022.11.15.21.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 21:38:21 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 01/11] ASoC: ak5386: switch to using gpiod API
Date: Tue, 15 Nov 2022 21:38:07 -0800
Message-Id: <20221116053817.2929810-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 sound/soc/codecs/ak5386.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/ak5386.c b/sound/soc/codecs/ak5386.c
index 0c5e00679c7d..0562890b5dc7 100644
--- a/sound/soc/codecs/ak5386.c
+++ b/sound/soc/codecs/ak5386.c
@@ -6,11 +6,12 @@
  * (c) 2013 Daniel Mack <zonque@gmail.com>
  */
 
+
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
-#include <linux/of_device.h>
 #include <linux/regulator/consumer.h>
 #include <sound/soc.h>
 #include <sound/pcm.h>
@@ -21,7 +22,7 @@ static const char * const supply_names[] = {
 };
 
 struct ak5386_priv {
-	int reset_gpio;
+	struct gpio_desc *reset_gpio;
 	struct regulator_bulk_data supplies[ARRAY_SIZE(supply_names)];
 };
 
@@ -111,8 +112,8 @@ static int ak5386_hw_params(struct snd_pcm_substream *substream,
 	 * the AK5386 in power-down mode (PDN pin = “L”).
 	 */
 
-	if (gpio_is_valid(priv->reset_gpio))
-		gpio_set_value(priv->reset_gpio, 1);
+	if (priv->reset_gpio)
+		gpiod_set_value(priv->reset_gpio, 0);
 
 	return 0;
 }
@@ -123,8 +124,8 @@ static int ak5386_hw_free(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct ak5386_priv *priv = snd_soc_component_get_drvdata(component);
 
-	if (gpio_is_valid(priv->reset_gpio))
-		gpio_set_value(priv->reset_gpio, 0);
+	if (priv->reset_gpio)
+		gpiod_set_value(priv->reset_gpio, 1);
 
 	return 0;
 }
@@ -168,7 +169,6 @@ static int ak5386_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	priv->reset_gpio = -EINVAL;
 	dev_set_drvdata(dev, priv);
 
 	for (i = 0; i < ARRAY_SIZE(supply_names); i++)
@@ -179,15 +179,13 @@ static int ak5386_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	if (of_match_device(of_match_ptr(ak5386_dt_ids), dev))
-		priv->reset_gpio = of_get_named_gpio(dev->of_node,
-						      "reset-gpio", 0);
+	priv->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						   GPIOD_OUT_HIGH);
+	ret = PTR_ERR_OR_ZERO(priv->reset_gpio);
+	if (ret)
+		return ret;
 
-	if (gpio_is_valid(priv->reset_gpio))
-		if (devm_gpio_request_one(dev, priv->reset_gpio,
-					  GPIOF_OUT_INIT_LOW,
-					  "AK5386 Reset"))
-			priv->reset_gpio = -EINVAL;
+	gpiod_set_consumer_name(priv->reset_gpio, "AK5386 Reset");
 
 	return devm_snd_soc_register_component(dev, &soc_component_ak5386,
 				      &ak5386_dai, 1);
-- 
2.38.1.431.g37b22c650d-goog

