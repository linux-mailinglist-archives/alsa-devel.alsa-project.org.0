Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5936179A5FA
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 10:25:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1B52852;
	Mon, 11 Sep 2023 10:24:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1B52852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694420746;
	bh=ZPOVoWflkn5ze/RL1vfcrWv4KndgatLnq+lpS515m1M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DGzAD8ghIKS/0MdrOSkKQrrzTbFKCzAchHfg0C9rmBjzkFaJBdJ4jCLsw6hCO0Vbr
	 w0Seq12tndodZYyQ9jF5tjiFo6SbdQwKZk75TZ1eg4AsfP5VhsHq9pxQ0O4HXahrzX
	 RxyIhwBD5AO2Soewqdj3D3i5CfLbPgIigsXzrh7k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45672F800AA; Mon, 11 Sep 2023 10:24:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B4DFF800AA;
	Mon, 11 Sep 2023 10:24:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6E7CF80570; Mon, 11 Sep 2023 10:24:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B18CF80431
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 10:23:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B18CF80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=kTse9t7i
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2bce552508fso67712021fa.1
        for <alsa-devel@alsa-project.org>;
 Mon, 11 Sep 2023 01:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694420632; x=1695025432;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NBbRRSYAQA5xmq25ubQ8kHHlKCIWtZeRLr/sb85xuNU=;
        b=kTse9t7iVJc5iq9wptlDVeVt/VUB7GMqnkRked5SlNfMx1+a89C+0qUrHkQOrtEOZf
         MItPfJFNvPDEFeitFiKVHFYJNdjXi0W8a+cMHvhtJ2xv69XQvYakaNnfbM2Wwfg7f7cY
         tWoU0I8AcpNTmyZwngPzg4qWUGB8Fh2dJy88AlXNNbO1X2WCEmpucU2Oj7hhIzjYYgGV
         nbyaKVW0w6Ahb7EFI9LCkkrUAdujKVtqEExbN8IVIlI7x3Jv0t9tEXxhJMGVjcbTR2hR
         2ANltc9C3DiZSlSs/VK59s7NY441kIwJQPpAVHBVc94rb2dWrWjp935idssz7O4MmK1L
         tpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694420632; x=1695025432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NBbRRSYAQA5xmq25ubQ8kHHlKCIWtZeRLr/sb85xuNU=;
        b=RRWQ6wkS7+vo+DaJTTR3n5CZ9+V6JbeXT3bloc0YstY7bUG0m4Sg/KUnb2jd3xF75h
         dhoXE3iCzUfixcPg+a64kvOfsW4vD1gAWN6HwCfcGF2KZ+CRNDZgeDrou4Qk/Ej1JHOK
         Iu7AnFJgDrObWxEVhzsolno41064jOrMpG86jHKA+hskcgKRFEWs706Qv6MMJxAY7P2c
         On6Wy8EL94i+/3Y5vjObwVr9rz4s8c+q1DZz8zb3uoM8VV0sj/Kctg7FwLi0cwSKWvaB
         qHb/Hfyqzp6vz7BWd1xf3gjihlX5+m6yB8GsYYIlCIJliDPkLYSsc0aKa8fanCta0mDm
         aWzA==
X-Gm-Message-State: AOJu0Yxb4eTVsVQrOqk7FZQQ24E9LkfTsf6eS7J6oTTkF4l3NB8SSiBY
	npux9jA6BN+yo+ONZyUy5x8zdg==
X-Google-Smtp-Source: 
 AGHT+IE795z4MeyvcfiIIYPz/bYjnDK/11+Ubx+DKYPxh6E6lvf7/Sxx7I8bOqlaNVa5jarhNcJo9w==
X-Received: by 2002:a05:6512:398a:b0:4fd:d213:dfd4 with SMTP id
 j10-20020a056512398a00b004fdd213dfd4mr8795699lfu.20.1694420632485;
        Mon, 11 Sep 2023 01:23:52 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 a8-20020a19f808000000b00500968ddca9sm1247712lff.136.2023.09.11.01.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 01:23:52 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Sep 2023 10:23:50 +0200
Subject: [PATCH v2 3/7] ASoC: max98373: Convert to use GPIO descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-descriptors-asoc-max-v2-3-b9d793fb768e@linaro.org>
References: <20230911-descriptors-asoc-max-v2-0-b9d793fb768e@linaro.org>
In-Reply-To: <20230911-descriptors-asoc-max-v2-0-b9d793fb768e@linaro.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: XNGZT6GCMVAIXZB657E2IR4E2DZ75RZN
X-Message-ID-Hash: XNGZT6GCMVAIXZB657E2IR4E2DZ75RZN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XNGZT6GCMVAIXZB657E2IR4E2DZ75RZN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of relying on legacy interfaces, convert the driver to
use GPIO descriptors. This is a straight-forward conversion,
we support also sdw devices providing GPIO descriptor tables
if they so desire.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/max98373-i2c.c | 17 -----------------
 sound/soc/codecs/max98373.c     | 35 +++++++++++++++++++----------------
 sound/soc/codecs/max98373.h     |  2 +-
 3 files changed, 20 insertions(+), 34 deletions(-)

diff --git a/sound/soc/codecs/max98373-i2c.c b/sound/soc/codecs/max98373-i2c.c
index 0fa5ceca62a2..e7ec7875c4a9 100644
--- a/sound/soc/codecs/max98373-i2c.c
+++ b/sound/soc/codecs/max98373-i2c.c
@@ -3,12 +3,10 @@
 
 #include <linux/acpi.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/pm.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -560,21 +558,6 @@ static int max98373_i2c_probe(struct i2c_client *i2c)
 	/* voltage/current slot & gpio configuration */
 	max98373_slot_config(&i2c->dev, max98373);
 
-	/* Power on device */
-	if (gpio_is_valid(max98373->reset_gpio)) {
-		ret = devm_gpio_request(&i2c->dev, max98373->reset_gpio,
-					"MAX98373_RESET");
-		if (ret) {
-			dev_err(&i2c->dev, "%s: Failed to request gpio %d\n",
-				__func__, max98373->reset_gpio);
-			return -EINVAL;
-		}
-		gpio_direction_output(max98373->reset_gpio, 0);
-		msleep(50);
-		gpio_direction_output(max98373->reset_gpio, 1);
-		msleep(20);
-	}
-
 	/* Check Revision ID */
 	ret = regmap_read(max98373->regmap,
 			  MAX98373_R21FF_REV_ID, &reg);
diff --git a/sound/soc/codecs/max98373.c b/sound/soc/codecs/max98373.c
index fde055c6c894..33eb4576da23 100644
--- a/sound/soc/codecs/max98373.c
+++ b/sound/soc/codecs/max98373.c
@@ -12,9 +12,8 @@
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <sound/tlv.h>
 #include "max98373.h"
 
@@ -478,20 +477,24 @@ void max98373_slot_config(struct device *dev,
 		max98373->i_slot = value & 0xF;
 	else
 		max98373->i_slot = 1;
-	if (dev->of_node) {
-		max98373->reset_gpio = of_get_named_gpio(dev->of_node,
-						"maxim,reset-gpio", 0);
-		if (!gpio_is_valid(max98373->reset_gpio)) {
-			dev_err(dev, "Looking up %s property in node %s failed %d\n",
-				"maxim,reset-gpio", dev->of_node->full_name,
-				max98373->reset_gpio);
-		} else {
-			dev_dbg(dev, "maxim,reset-gpio=%d",
-				max98373->reset_gpio);
-		}
-	} else {
-		/* this makes reset_gpio as invalid */
-		max98373->reset_gpio = -1;
+
+	/* This will assert RESET */
+	max98373->reset = devm_gpiod_get_optional(dev,
+						  "maxim,reset",
+						  GPIOD_OUT_HIGH);
+	if (IS_ERR(max98373->reset)) {
+		dev_err(dev, "error %ld looking up RESET GPIO line\n",
+			PTR_ERR(max98373->reset));
+		return;
+	}
+
+	/* Cycle reset */
+	if (max98373->reset) {
+		gpiod_set_consumer_name(max98373->reset ,"MAX98373_RESET");
+		gpiod_direction_output(max98373->reset, 1);
+		msleep(50);
+		gpiod_direction_output(max98373->reset, 0);
+		msleep(20);
 	}
 
 	if (!device_property_read_u32(dev, "maxim,spkfb-slot-no", &value))
diff --git a/sound/soc/codecs/max98373.h b/sound/soc/codecs/max98373.h
index e1810b3b1620..af3b62217497 100644
--- a/sound/soc/codecs/max98373.h
+++ b/sound/soc/codecs/max98373.h
@@ -213,7 +213,7 @@ struct max98373_cache {
 
 struct max98373_priv {
 	struct regmap *regmap;
-	int reset_gpio;
+	struct gpio_desc *reset;
 	unsigned int v_slot;
 	unsigned int i_slot;
 	unsigned int spkfb_slot;

-- 
2.34.1

