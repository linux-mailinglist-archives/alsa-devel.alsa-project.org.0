Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE41D62B2E5
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 06:41:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C5BB16B6;
	Wed, 16 Nov 2022 06:40:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C5BB16B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668577266;
	bh=+Q9Xzr8d+Q5o7WfWBABntNrAm1nr1P+gl5vcsD8Cobc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NUBD3dM+dzTx2twXLCFZtL9aGK91nP6HmtkwBFxQ8CPL5SEB1H+JSGZv3YQtqx5vN
	 n6HwmSSnb1SaB0TuBnsahI6KABE0KV1toRMBw0v8mPM5YVnmxA8Lu3Ou/0Ft2ODLN4
	 KtfZG6lVI9Tndr81zoc+3EptuZwd11iuZetElnM4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9B6BF8057C;
	Wed, 16 Nov 2022 06:38:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AAFCF800B5; Wed, 16 Nov 2022 06:38:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7507AF80163
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 06:38:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7507AF80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WKM+2PzQ"
Received: by mail-pj1-x1034.google.com with SMTP id
 d13-20020a17090a3b0d00b00213519dfe4aso1354386pjc.2
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 21:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ULkwCXln6lxM8XLag0GHNaSgcab1VgWTlrPLPEn1RmQ=;
 b=WKM+2PzQbhMeOBeGQywY/g11Pnn37fKCeJCt+lwYnk221uHqyJTf2HoAQyuSvu64nO
 brBFlwq5l+XR8hlqRvjKYtb9hsQtQmyeupF7wTqWtL6ovpyDzxx/CR0TmRmccJ2ENp74
 CaRfmDhGkLcsG47C1XDf0+LG1i7+nUTJ7M0IGG6NHTDmvdZkDR6nOuvsxyWw3wQRixzZ
 RTozclXB95iYqCQaPK/PRoE/OFUcDNDDjP2hsVbYgO6qd2lNNa9sn8F+2m/qnwnUqk5v
 cVcH1Cd7m/3QTkeUpRFRxDU9njOzlNy9rJr5La6m0Ai2k5T9OlZ29M5h1k8XhfV0GMUi
 Em+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ULkwCXln6lxM8XLag0GHNaSgcab1VgWTlrPLPEn1RmQ=;
 b=Z/aoqh0SGlgi8Ew+103+iTQSTZfKeHagK+x4D/XXnNgUguv02Ulhg6hGOVjSNAYT1v
 6vQR2GBXIxzpD7RXip6HCc5l0fzD0Khllnf6c3YY/Gtp0CWylv20G5sTowGaHjcOPDcR
 C36B8ZVHv7mSVQ8QkT6BEVtwkp5prRlhdvd7BVocbS+egX2NVXetm8avV8wmQ7lVs1Kg
 qjPQunzkDV3RHFnynwypejAa6GEVB9TmSWkWlYwo4ulN71wp4X6sIX/PUhJ0F15tGRez
 hyQdFWrnY2iyr0HU1mlh+6xyAuVEnQmj8tyPVpmD4c0TmjjlK9FmQN4aThJy3G9nl+Em
 bOyg==
X-Gm-Message-State: ANoB5plqxqc/f3734ks6YXuqIZOlM8HMSrIeHJAAW2F+xlZETIfo5TDw
 y2j4yziWmbsYpRP1RnYvJU5f7dRjQWM=
X-Google-Smtp-Source: AA0mqf5uVWst6sre4JVfG7hacQt648w/wagbo1T0Ve8WMKn0tELymV4vaRkGXceh0dDwV+YXo9CPkg==
X-Received: by 2002:a17:903:3311:b0:188:4ea8:a687 with SMTP id
 jk17-20020a170903331100b001884ea8a687mr7401524plb.120.1668577113192; 
 Tue, 15 Nov 2022 21:38:33 -0800 (PST)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:2d36:e9a0:170b:669f])
 by smtp.gmail.com with ESMTPSA id
 ik13-20020a170902ab0d00b0017834a6966csm10881038plb.176.2022.11.15.21.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 21:38:32 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 07/11] ASoC: tlv320aic32x4: switch to using gpiod API
Date: Tue, 15 Nov 2022 21:38:13 -0800
Message-Id: <20221116053817.2929810-7-dmitry.torokhov@gmail.com>
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
 sound/soc/codecs/tlv320aic32x4.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 2dd0fe255ee6..36a3b3eb4d56 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -13,9 +13,9 @@
 #include <linux/moduleparam.h>
 #include <linux/init.h>
 #include <linux/delay.h>
+#include <linux/err.h>
 #include <linux/pm.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/cdev.h>
 #include <linux/slab.h>
 #include <linux/clk.h>
@@ -41,7 +41,7 @@ struct aic32x4_priv {
 	u32 power_cfg;
 	u32 micpga_routing;
 	bool swapdacs;
-	int rstn_gpio;
+	struct gpio_desc *reset_gpio;
 	const char *mclk_name;
 
 	struct regulator *supply_ldo;
@@ -1230,7 +1230,6 @@ static int aic32x4_parse_dt(struct aic32x4_priv *aic32x4,
 
 	aic32x4->swapdacs = false;
 	aic32x4->micpga_routing = 0;
-	aic32x4->rstn_gpio = of_get_named_gpio(np, "reset-gpios", 0);
 
 	if (of_property_read_u32_array(np, "aic32x4-gpio-func",
 				aic32x4_setup->gpio_func, 5) >= 0)
@@ -1365,16 +1364,16 @@ int aic32x4_probe(struct device *dev, struct regmap *regmap)
 		aic32x4->power_cfg = 0;
 		aic32x4->swapdacs = false;
 		aic32x4->micpga_routing = 0;
-		aic32x4->rstn_gpio = -1;
 		aic32x4->mclk_name = "mclk";
 	}
 
-	if (gpio_is_valid(aic32x4->rstn_gpio)) {
-		ret = devm_gpio_request_one(dev, aic32x4->rstn_gpio,
-				GPIOF_OUT_INIT_LOW, "tlv320aic32x4 rstn");
-		if (ret != 0)
-			return ret;
-	}
+	aic32x4->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						      GPIOD_OUT_HIGH);
+	ret = PTR_ERR_OR_ZERO(aic32x4->reset_gpio);
+	if (ret)
+		return ret;
+
+	gpiod_set_consumer_name(aic32x4->reset_gpio, "tlv320aic32x4 rstn");
 
 	ret = aic32x4_setup_regulators(dev, aic32x4);
 	if (ret) {
@@ -1382,9 +1381,9 @@ int aic32x4_probe(struct device *dev, struct regmap *regmap)
 		return ret;
 	}
 
-	if (gpio_is_valid(aic32x4->rstn_gpio)) {
+	if (aic32x4->reset_gpio) {
 		ndelay(10);
-		gpio_set_value_cansleep(aic32x4->rstn_gpio, 1);
+		gpiod_set_value_cansleep(aic32x4->reset_gpio, 0);
 		mdelay(1);
 	}
 
-- 
2.38.1.431.g37b22c650d-goog

