Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D9262B2DC
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 06:39:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BC25168F;
	Wed, 16 Nov 2022 06:38:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BC25168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668577169;
	bh=tWE87n2V9hDE8IrWLgCLl7RIjkMlfnkXWTRKaqBgy1M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vlQuvAbAzczokEpulJvHxXKV+WZLzCiOkjYPKk5Xe9aJRYwoTR8KhZAoMxAsIOgXb
	 n565sfyuP5lSEJhQU4SVsMrqmaiJV5CAlE0r2A5Ly95xw5Keqz7wZwv7F+SmkkFXgV
	 SrUl27sPf2qjHgklQhL4Vi2oIj4BagQhBjhwpTPU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D30ADF80169;
	Wed, 16 Nov 2022 06:38:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC1F2F80240; Wed, 16 Nov 2022 06:38:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66E40F800B5
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 06:38:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66E40F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="b5/F1lcF"
Received: by mail-pj1-x102e.google.com with SMTP id
 c15-20020a17090a1d0f00b0021365864446so1341781pjd.4
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 21:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yEUFbdVypOtyoH064OjwzyJ2ZvEG5EnyjXzOQihafjo=;
 b=b5/F1lcFrypyG5b3jZd+tIci2jDxqkerWT178BAUcRicXkw95dBFxRknwrsZMS5Qud
 MlaVJs2wquHY4clWTApR5ZADFFvP/rBfGGjMXoynix7py8419JTe18a4QU3ldzp2e42Q
 snQtuSlystcc2T7vWhP4LZ5Id/pkAsturPEbM21KtqDB66Q5yrGIVhQE5h0/XF9atu2b
 /viTKRsIgxeAFGKq2MKvzP3a5zDdh5uIv8BnGJlIt66+NkLlvfgaDCbbJZ3LBxTIGUrx
 Q4M4eXC+8RU/oLEVmQgsyKM6/CmwkPOoVFpU+cxPL+MfceYAsUS/byeTNadVgiOQVpr9
 1OWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yEUFbdVypOtyoH064OjwzyJ2ZvEG5EnyjXzOQihafjo=;
 b=CQs8f3TE7m7Dr5N//4RbzP5Rd3UNd7HfvPdpqDxy91bgwtLg5eXolK/C7xCeRPru4o
 Y9sRk4VBQENBu2eE+hwwjI6ierEayyw5b46Aq629BFiRgVo+JkTim0MG1inJihqPRJq5
 UFFWOfj+C/kq0wZbE8VMCI8tPBfR6uF9Ixs848rpMziZKtTZ/mftYwvddzsnazZodyt5
 +c8drzQ11XvVcCdi3WHIgQ9dn2qJSOFUPAUkUlsSddj8sgZ1bavQe7crdkwki447NPmN
 5wddNREQSRb5nOKC+198lqKuhixCKk9g+NECGbLllnsTgAQ7C1/A/xfCKKLcyLFH55ZJ
 ZzZw==
X-Gm-Message-State: ANoB5pm3h9KuWzplaMaKseIrG1s92MUa5JWdAHW/rZI8KQ11tzcAdn7N
 mbu/INxm8lKNMLFzCvxYNzA=
X-Google-Smtp-Source: AA0mqf5z79P1swqzv8dzeNZZJOFB+xE8MMujTBBZYIu2jV3tvbzH4zWATe4F3ROm4HqVKvHQzeUozw==
X-Received: by 2002:a17:902:e846:b0:186:94b8:5980 with SMTP id
 t6-20020a170902e84600b0018694b85980mr7764409plg.113.1668577103864; 
 Tue, 15 Nov 2022 21:38:23 -0800 (PST)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:2d36:e9a0:170b:669f])
 by smtp.gmail.com with ESMTPSA id
 ik13-20020a170902ab0d00b0017834a6966csm10881038plb.176.2022.11.15.21.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 21:38:23 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 02/11] ASoC: max98373: switch to using gpiod API
Date: Tue, 15 Nov 2022 21:38:08 -0800
Message-Id: <20221116053817.2929810-2-dmitry.torokhov@gmail.com>
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
 sound/soc/codecs/max98373-i2c.c | 39 +++++++++++++++++++--------------
 sound/soc/codecs/max98373.c     | 18 ---------------
 sound/soc/codecs/max98373.h     |  1 -
 3 files changed, 22 insertions(+), 36 deletions(-)

diff --git a/sound/soc/codecs/max98373-i2c.c b/sound/soc/codecs/max98373-i2c.c
index 3e04c7f0cce4..969cdca83bc1 100644
--- a/sound/soc/codecs/max98373-i2c.c
+++ b/sound/soc/codecs/max98373-i2c.c
@@ -3,12 +3,12 @@
 
 #include <linux/acpi.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -520,14 +520,13 @@ static int max98373_i2c_probe(struct i2c_client *i2c)
 	int ret = 0;
 	int reg = 0;
 	int i;
-	struct max98373_priv *max98373 = NULL;
+	struct max98373_priv *max98373;
+	struct gpio_desc *reset_gpio;
 
 	max98373 = devm_kzalloc(&i2c->dev, sizeof(*max98373), GFP_KERNEL);
+	if (!max98373)
+		return -ENOMEM;
 
-	if (!max98373) {
-		ret = -ENOMEM;
-		return ret;
-	}
 	i2c_set_clientdata(i2c, max98373);
 
 	/* update interleave mode info */
@@ -557,17 +556,23 @@ static int max98373_i2c_probe(struct i2c_client *i2c)
 	max98373_slot_config(&i2c->dev, max98373);
 
 	/* Power on device */
-	if (gpio_is_valid(max98373->reset_gpio)) {
-		ret = devm_gpio_request(&i2c->dev, max98373->reset_gpio,
-					"MAX98373_RESET");
-		if (ret) {
-			dev_err(&i2c->dev, "%s: Failed to request gpio %d\n",
-				__func__, max98373->reset_gpio);
-			return -EINVAL;
-		}
-		gpio_direction_output(max98373->reset_gpio, 0);
+	/* Acquire and assert reset line */
+	reset_gpio = devm_gpiod_get_optional(&i2c->dev, "maxim,reset",
+					     GPIOD_OUT_HIGH);
+	ret = PTR_ERR_OR_ZERO(reset_gpio);
+	if (ret) {
+		dev_err(&i2c->dev, "%s: Failed to request reset gpio: %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+	gpiod_set_consumer_name(reset_gpio, "MAX98373_RESET");
+
+	if (reset_gpio) {
+		/* Keep line asserted to reset device */
 		msleep(50);
-		gpio_direction_output(max98373->reset_gpio, 1);
+		/* Deassert reset line */
+		gpiod_set_value_cansleep(reset_gpio, 0);
 		msleep(20);
 	}
 
diff --git a/sound/soc/codecs/max98373.c b/sound/soc/codecs/max98373.c
index f90a6a7ba83b..401546c1084e 100644
--- a/sound/soc/codecs/max98373.c
+++ b/sound/soc/codecs/max98373.c
@@ -12,9 +12,6 @@
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
-#include <linux/gpio.h>
-#include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <sound/tlv.h>
 #include "max98373.h"
 
@@ -478,21 +475,6 @@ void max98373_slot_config(struct device *dev,
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
-	}
 
 	if (!device_property_read_u32(dev, "maxim,spkfb-slot-no", &value))
 		max98373->spkfb_slot = value & 0xF;
diff --git a/sound/soc/codecs/max98373.h b/sound/soc/codecs/max98373.h
index e1810b3b1620..7b259789e1be 100644
--- a/sound/soc/codecs/max98373.h
+++ b/sound/soc/codecs/max98373.h
@@ -213,7 +213,6 @@ struct max98373_cache {
 
 struct max98373_priv {
 	struct regmap *regmap;
-	int reset_gpio;
 	unsigned int v_slot;
 	unsigned int i_slot;
 	unsigned int spkfb_slot;
-- 
2.38.1.431.g37b22c650d-goog

