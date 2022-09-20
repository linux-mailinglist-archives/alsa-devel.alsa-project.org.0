Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0B45BDA86
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 04:59:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7F1974C;
	Tue, 20 Sep 2022 04:58:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7F1974C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663642758;
	bh=ZRqgNhu2JyBmkhTCev38DAeNXUqUkV1+ExFUE3RUt24=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IB6GciH12ziDyXFRNZnbotfDZkset2b67Vdi4lv4FOUbtvLOAlcCMSo6a3PAJOPaz
	 J2cJ+SEU7JZ+kbhzYde9aZo8A3iz1w4JaAn6iZ9jJQJi+8PEwF9eA0600Co8fEhb3z
	 D580cwEZHvFv007I9FApnYftzvlpZum9cbqO6VPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBE87F80171;
	Tue, 20 Sep 2022 04:58:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39403F80171; Tue, 20 Sep 2022 04:58:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8354FF8012B
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 04:58:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8354FF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FcJF96wn"
Received: by mail-pg1-x533.google.com with SMTP id t190so1180701pgd.9
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 19:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=1D5qXLe1WAPRApCvIfGpFNULKJL8uLPqslDt4MGWmKc=;
 b=FcJF96wnARQw/7Ye9X492BhO7+gmuFBafL0CjcuOsHdoPko1wwJo13OkjuzHZrE/mR
 0dqISXYA0qd6NLuu+4FKvr2z13C0sZZVnjWSIqTROr2suTnKnmbmues+kiOZ4E6hIHiO
 dGIHeC6fhW+DRgDwQLhB/CA1L2Wo9B5bG+tPNj9/UebzRk8GVCSYvL3DlKas9MeDpSiV
 jbySi2kmsxU97swYKsbdMXjweWew11EtMO94UAJ4eVr/6ahQtwhS13FD5PmjSrrKWoxm
 5iYjc5iitvkfKQFf8FmrbOEs7URP0qPX2NOc2haEOOE7vgB7MIPoyNwVhQpIg5cZxEgl
 0+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=1D5qXLe1WAPRApCvIfGpFNULKJL8uLPqslDt4MGWmKc=;
 b=BBoL+FPHU4XsPW5BXPAP2cLgWfdoEdHecbbWwtr+2XKlwWez1Wlv1W4+pjRNozUabv
 w/ECZQu807RvMmsNXeFjlwkkI+CZTzm4nCgzXANnbBLOODGO2WAVLWKkOaQ7EfXTovLc
 DTtFY4FwACs4UURaCd6XHT/Zb+Z4gDLtxUZU6KzOqV4rCB66r17VY1r0myaH9tqiWJc+
 3CBrqA1rwi4jYzHl2WTVxw3nO/0t8Pcd6Y3DfY85FFHuc2r5Rwi+8WVLdgAGBT3xXBlD
 JS+uMb9CMo8gTS1AzXGWQBuXZCD208M++BTpBGirDy6V5qnqNFDFh/PNni7nC7yv4hJi
 8gUw==
X-Gm-Message-State: ACrzQf223a/c4+kBy+PZYL4ZoRtk1qts7fqf8O/rz0ECI1PYHIb/FMUa
 BgwoTpDxT6jz6PY2voV/O/8=
X-Google-Smtp-Source: AMsMyM5EZVdp2ZNER6mMbd7+fkvIe2UprHoJr3m3o7ZL+ib7ei/HkzjmwDyNVjMlgPGXBRs7+MXzsQ==
X-Received: by 2002:a05:6a00:99c:b0:54c:27c4:3acb with SMTP id
 u28-20020a056a00099c00b0054c27c43acbmr15230522pfg.22.1663642689973; 
 Mon, 19 Sep 2022 19:58:09 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:202:201:b095:5d5d:4c28:8088])
 by smtp.gmail.com with ESMTPSA id
 z128-20020a626586000000b00542e190f6bcsm147499pfb.102.2022.09.19.19.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 19:58:09 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: ssm2518: switch to using gpiod API
Date: Mon, 19 Sep 2022 19:58:04 -0700
Message-Id: <20220920025804.1788667-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
In-Reply-To: <20220920025804.1788667-1-dmitry.torokhov@gmail.com>
References: <20220920025804.1788667-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
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

This patch converts the driver to newer gpiod API, so that we can stop
exporting OF-specific legacy gpio API.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 sound/soc/codecs/ssm2518.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/ssm2518.c b/sound/soc/codecs/ssm2518.c
index feee28207e5d..22cb3b7c8283 100644
--- a/sound/soc/codecs/ssm2518.c
+++ b/sound/soc/codecs/ssm2518.c
@@ -6,13 +6,13 @@
  *  Author: Lars-Peter Clausen <lars@metafoo.de>
  */
 
+#include <linux/err.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/i2c.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -113,7 +113,7 @@ struct ssm2518 {
 	unsigned int sysclk;
 	const struct snd_pcm_hw_constraint_list *constraints;
 
-	int enable_gpio;
+	struct gpio_desc *enable_gpio;
 };
 
 static const struct reg_default ssm2518_reg_defaults[] = {
@@ -482,8 +482,8 @@ static int ssm2518_set_power(struct ssm2518 *ssm2518, bool enable)
 		regcache_mark_dirty(ssm2518->regmap);
 	}
 
-	if (gpio_is_valid(ssm2518->enable_gpio))
-		gpio_set_value(ssm2518->enable_gpio, enable);
+	if (ssm2518->enable_gpio)
+		gpiod_set_value_cansleep(ssm2518->enable_gpio, enable);
 
 	regcache_cache_only(ssm2518->regmap, !enable);
 
@@ -742,20 +742,14 @@ static int ssm2518_i2c_probe(struct i2c_client *i2c)
 	if (ssm2518 == NULL)
 		return -ENOMEM;
 
-	if (i2c->dev.of_node) {
-		ssm2518->enable_gpio = of_get_gpio(i2c->dev.of_node, 0);
-		if (ssm2518->enable_gpio < 0 && ssm2518->enable_gpio != -ENOENT)
-			return ssm2518->enable_gpio;
-	} else {
-		ssm2518->enable_gpio = -1;
-	}
+	/* Start with enabling the chip */
+	ssm2518->enable_gpio = devm_gpiod_get_optional(&i2c->dev, NULL,
+						       GPIOD_OUT_HIGH);
+	ret = PTR_ERR_OR_ZERO(ssm2518->enable_gpio);
+	if (ret)
+		return ret;
 
-	if (gpio_is_valid(ssm2518->enable_gpio)) {
-		ret = devm_gpio_request_one(&i2c->dev, ssm2518->enable_gpio,
-				GPIOF_OUT_INIT_HIGH, "SSM2518 nSD");
-		if (ret)
-			return ret;
-	}
+	gpiod_set_consumer_name(ssm2518->enable_gpio, "SSM2518 nSD");
 
 	i2c_set_clientdata(i2c, ssm2518);
 
-- 
2.37.3.968.ga6b4b080e4-goog

