Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 861DE7881C7
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 10:14:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E416AAEA;
	Fri, 25 Aug 2023 10:13:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E416AAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692951273;
	bh=ZPOVoWflkn5ze/RL1vfcrWv4KndgatLnq+lpS515m1M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XryY2ylro9SzmJ3o6w2byUyZjhynsB4GEpuwdXTmnrX1Y+1TGlNJzhoVQ8yyFgsWe
	 tQy+Cnr2H6oGU+PclrKVbpvss5aQqTUOR44TKPUFlSciB5s4xc+JEVbAuShwGYmzov
	 JKdJJvO7lw6IJD8XRwpulAZmy/0V+jg3C8i+wL5c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1C6BF8057F; Fri, 25 Aug 2023 10:12:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09AC6F8056F;
	Fri, 25 Aug 2023 10:12:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A61DF8055C; Fri, 25 Aug 2023 10:12:30 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id AC363F800F5
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 10:12:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC363F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZXicqbRu
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5007abb15e9so963760e87.0
        for <alsa-devel@alsa-project.org>;
 Fri, 25 Aug 2023 01:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692951135; x=1693555935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NBbRRSYAQA5xmq25ubQ8kHHlKCIWtZeRLr/sb85xuNU=;
        b=ZXicqbRubMjwCeZSDp32zGvSe2Cg8/FKjVonc3OsBRO2krXO9cvadTN+LEo+huL3zn
         OIhuzcmuZ3+DNGfyUWUCnuHFZT6ri6Nm07495TVslpIaSQ+NwKVr6zekLYT0PZSblQrs
         wagBfLfbz5NQpkh7nX06Io3lM54ZJt2f6MhCztCKdKx86JpxnpZlXLGy1+BQ1Im+EdaN
         AGZG/AsNNs0dYj56gsC/jkl6aRqlgLHWJ1hpp1h+Mfw6U8oU3wtq7mCeGrhqhOULtwHX
         1BxTwnLpJ71GxdGgkFs12MOHXaxOu6FTOzDbnJZI20sPRMcQu5+jN9t8fL8hzsj5adyJ
         pXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692951135; x=1693555935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NBbRRSYAQA5xmq25ubQ8kHHlKCIWtZeRLr/sb85xuNU=;
        b=T47fWjilBVdH/VNdKUI9O85Q923sdN1q9e4mUXNoIBFx5usx3PqCB2kL7S1z/keWgd
         rOLhw6DdI/DjqNGTwDRCJ//6X12oKFcxedM22lGxFVMkJZ/0QuGSfz0cfq0/72Ljl1TZ
         IxScAwzjCp+JZyeW3XadpKeDX/we0luCKVCASZxk9+bfOFFMAh3Qlz8CHyqJ7jmcIReL
         iAbGJ111H+gLeIwerGt7y4oIsNgJslLR5WoFrHwuRWE1gZIv91fYeFNMz4+pps0nl3r3
         og7yxqxfYu4+Wh24zta+MoHmLZ6EZMtbY/n7+captunA4rz66X3LQTBwQfAiWqKyJC4r
         Gccg==
X-Gm-Message-State: AOJu0YwBiYLT+4YYcenGsnFQcYPB+psNvKc/CVc/9x/+JbekfG80XkPu
	4+EZ0IEtq8+eNAlMDbcAr/oGNA==
X-Google-Smtp-Source: 
 AGHT+IEPLIDpD1w1RF98YcjynCIXKHZQox8F22rws/cF0RMIh/cKJbjBBRiwjVgcU5sTSiS7K0f0rA==
X-Received: by 2002:a05:6512:615:b0:4fd:c923:db59 with SMTP id
 b21-20020a056512061500b004fdc923db59mr11392637lfe.15.1692951135669;
        Fri, 25 Aug 2023 01:12:15 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 q28-20020ac2511c000000b004fe1a35fd15sm195559lfb.140.2023.08.25.01.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 01:12:15 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 25 Aug 2023 10:12:13 +0200
Subject: [PATCH 3/7] ASoC: max98373: Convert to use GPIO descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230825-descriptors-asoc-max-v1-3-b212292b2f08@linaro.org>
References: <20230825-descriptors-asoc-max-v1-0-b212292b2f08@linaro.org>
In-Reply-To: <20230825-descriptors-asoc-max-v1-0-b212292b2f08@linaro.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: RTWVNJ5GMUDYOJPMKVV3NEPTTKJTKNY4
X-Message-ID-Hash: RTWVNJ5GMUDYOJPMKVV3NEPTTKJTKNY4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RTWVNJ5GMUDYOJPMKVV3NEPTTKJTKNY4/>
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

