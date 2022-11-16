Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E850962B2E9
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 06:41:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23C2816BD;
	Wed, 16 Nov 2022 06:40:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23C2816BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668577275;
	bh=zsVkFNjGPofi3QgzxxaffFfxPw2sD6i15hzRnkkW3xQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cs55i1tibKHHIV2qbDEEQcEHYoI4w/EeIlZDU2EQJx1+ikmMKt2BQp6pjEhJkx+1N
	 rkxIGPbEFKMlGHlLQeBOy8kuX5i3QFpm0RTNLzaaX81cx4gEi1nJZDbLZaxSfu6zcp
	 2/58K9f0XRTqMMIccqLOeumzqaNhXF7B+szybReI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37E57F80588;
	Wed, 16 Nov 2022 06:38:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDD33F8057E; Wed, 16 Nov 2022 06:38:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3F82F80163
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 06:38:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3F82F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="isKr2CHW"
Received: by mail-pj1-x1029.google.com with SMTP id
 d59-20020a17090a6f4100b00213202d77e1so1293728pjk.2
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 21:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hTyuvgruJxkGjK2lPmWOPAqXK8rk+Mma5cjclFSB/P4=;
 b=isKr2CHWgMPKfi62JRy35GEXHE5fa0vHOmDyfUegLY1FC8fuXQTi14lkZ/Gr1JWyqp
 apNloEjjEmXw7M4yebsCw0DkxcZtGuUQvYT2z6GJNsEQbKbPJSGLTrWt0gZgauQ5RSyS
 pZS/0BrY0+rd8pRdk2lxCxsOUIUm53iOeRTpgulfwpPvgT9xrh6s6AJpOyc2K8e47dod
 jkAzUlTVwKflYnao+eZWJ0bxf7nxTWI9ACCIsO7G4YT/6sC7K9P4byJCz+nePkePvYB+
 Izq9DLBzzVD55oEnvQjvHDMuvtMVfDHAjHk3yJmrvjBuXtw/X4dqqN2ORECgAbfL5xYE
 Nj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hTyuvgruJxkGjK2lPmWOPAqXK8rk+Mma5cjclFSB/P4=;
 b=M6nvg16Vr4YNcTrMXV4T1mfBjwsNQr4xXyPW/TbX3LfnCchroDdiO9gNWyTE1qHyMW
 irj9lXN2idVlbFrZM3ukpMq3C41Ur2dZJUpPjc5iBhjnVOUwEd4GGr3LzL0nVIwFL6Hn
 TRdN3yXTiUlX0tcB8Wytji+D0sxqW9DRZrf3lTK5+y5LIN9kL1Bv90Z0gkXPh4Vd2msP
 dIE2kquvCHemBbD/kbR8+GDXWpBXHz0TvtMTQveRZZvgxEmyMy4duNb+/ukTwyK2kayY
 4Q0cket8Dyo2GtJj0VX4x/UnlGcnirlXKpD2nUuzzvck/dlShJY22cB6Y9NudWLk6w3Z
 f5nw==
X-Gm-Message-State: ANoB5pl934ndjH5cMbu3mcYqkvl1MDSZcoldLwdlPEnTjlbAqQDL4+5F
 ursohyAhdWioYmRaVCtvEKU=
X-Google-Smtp-Source: AA0mqf7T9R9bl1VF3b67lvjkzgbb0ZPUNJ3DTdNrfya/g9dsluA4pZrfvDVx2bshz7znLR5EfemOyg==
X-Received: by 2002:a17:902:b781:b0:186:8a1e:5055 with SMTP id
 e1-20020a170902b78100b001868a1e5055mr7368084pls.116.1668577117200; 
 Tue, 15 Nov 2022 21:38:37 -0800 (PST)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:2d36:e9a0:170b:669f])
 by smtp.gmail.com with ESMTPSA id
 ik13-20020a170902ab0d00b0017834a6966csm10881038plb.176.2022.11.15.21.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 21:38:36 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 09/11] ASoC: wcd9335: switch to using gpiod API
Date: Tue, 15 Nov 2022 21:38:15 -0800
Message-Id: <20221116053817.2929810-9-dmitry.torokhov@gmail.com>
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

Also the old code did not actually request the reset line, but was
toggling it directly; this has been fixed.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 sound/soc/codecs/wcd9335.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index d2548fdf9ae5..27cbec3e6763 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -11,12 +11,13 @@
 #include <linux/regulator/consumer.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/slimbus.h>
 #include <sound/soc.h>
 #include <sound/pcm_params.h>
 #include <sound/soc-dapm.h>
-#include <linux/of_gpio.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <sound/tlv.h>
@@ -329,7 +330,7 @@ struct wcd9335_codec {
 	int comp_enabled[COMPANDER_MAX];
 
 	int intr1;
-	int reset_gpio;
+	struct gpio_desc *reset_gpio;
 	struct regulator_bulk_data supplies[WCD9335_MAX_SUPPLY];
 
 	unsigned int rx_port_value[WCD9335_RX_MAX];
@@ -5032,25 +5033,27 @@ static const struct regmap_irq_chip wcd9335_regmap_irq1_chip = {
 static int wcd9335_parse_dt(struct wcd9335_codec *wcd)
 {
 	struct device *dev = wcd->dev;
-	struct device_node *np = dev->of_node;
 	int ret;
 
-	wcd->reset_gpio = of_get_named_gpio(np,	"reset-gpios", 0);
-	if (wcd->reset_gpio < 0) {
-		dev_err(dev, "Reset GPIO missing from DT\n");
-		return wcd->reset_gpio;
+	wcd->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	ret = PTR_ERR_OR_ZERO(wcd->reset_gpio);
+	if (ret) {
+		dev_err(dev, "failed to request reset GPIO: %d\n", ret);
+		return ret;
 	}
 
 	wcd->mclk = devm_clk_get(dev, "mclk");
-	if (IS_ERR(wcd->mclk)) {
-		dev_err(dev, "mclk not found\n");
-		return PTR_ERR(wcd->mclk);
+	ret = PTR_ERR_OR_ZERO(wcd->mclk);
+	if (ret) {
+		dev_err(dev, "mclk not found: %d\n", ret);
+		return ret;
 	}
 
 	wcd->native_clk = devm_clk_get(dev, "slimbus");
-	if (IS_ERR(wcd->native_clk)) {
-		dev_err(dev, "slimbus clock not found\n");
-		return PTR_ERR(wcd->native_clk);
+	ret = PTR_ERR_OR_ZERO(wcd->native_clk);
+	if (ret) {
+		dev_err(dev, "slimbus clock not found: %d\n", ret);
+		return ret;
 	}
 
 	wcd->supplies[0].supply = "vdd-buck";
@@ -5088,9 +5091,9 @@ static int wcd9335_power_on_reset(struct wcd9335_codec *wcd)
 	 */
 	usleep_range(600, 650);
 
-	gpio_direction_output(wcd->reset_gpio, 0);
+	gpiod_set_value_cansleep(wcd->reset_gpio, 1);
 	msleep(20);
-	gpio_set_value(wcd->reset_gpio, 1);
+	gpiod_set_value_cansleep(wcd->reset_gpio, 0);
 	msleep(20);
 
 	return 0;
-- 
2.38.1.431.g37b22c650d-goog

