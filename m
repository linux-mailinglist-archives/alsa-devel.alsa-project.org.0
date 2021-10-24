Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC73443AC33
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 08:18:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B40A16F0;
	Tue, 26 Oct 2021 08:17:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B40A16F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635229114;
	bh=fGj2tGtR3dTDrL6Gv+LlGTuTXA6NGPuYcHWuv+W9/A0=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CvbdWCxIMwRepN5HIG+/n1b0eBuisIf8SmEzZUuFuSlue2Ugb6NmjBvQNCTOnst66
	 A01dpnGc7NEKBJVA7Rt/YAbe1LU8XF9fvKzinYwkiHQkR4IUONPeLpq8SPTv/hDzNu
	 KJRABgiDVsDtLuJS6W9aMMMZ4zCvnWzNVtsX/yHQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE004F80518;
	Tue, 26 Oct 2021 08:14:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B9E5F802C8; Sun, 24 Oct 2021 20:42:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [IPv6:2607:f8b0:4864:20::931])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE913F80086
 for <alsa-devel@alsa-project.org>; Sun, 24 Oct 2021 20:42:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE913F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="niSvMwWv"
Received: by mail-ua1-x931.google.com with SMTP id o26so3877956uab.5
 for <alsa-devel@alsa-project.org>; Sun, 24 Oct 2021 11:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding;
 bh=2zKExMX3MB1TxKtRKrdaVloxMHrKPcGLWTrSGkdV5z4=;
 b=niSvMwWvvs2enhC0ExbLTXLq6XgNUihAaxTbNtxiJ3M+Sw30/3NKfJz/1vwba+g43W
 9d2lOoTgAzy7SIFEwVs9/MvX3shcdepdsZrWrBdcmkp0dPI+uxVLa+F0lUzqizF6OtkG
 DlhB3bhOEF7QmBjJc6Fv2hCTR7CksYXGcbp1yy4MXBd91vLq+kojW+LvJ+8HHiD3m2lt
 9581AEEZ0r79vIVkcL5cNbntmX7lyWO6vcSN/0fMsIkh9+wuu3jwedGfVbrzYDnqN1ZY
 RYw5z0xVl/yUwWw76BFkcGwI6MDCxHAJMxZt/tbUOhmGQVj8pv9ViVuUyleVmmsp8Jjn
 W5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=2zKExMX3MB1TxKtRKrdaVloxMHrKPcGLWTrSGkdV5z4=;
 b=4Bl1q4O8ZU5rNUCK/w/6bWtklm0ywI/c22CwXAc/bTcZ3BSwxQislQXtONd8y/K6Yu
 VFtvzJyxFfXxB3Z5gmaWPeORV1vDI+O7nITrJxvgA/Ay8Zwoij5iNFRp0al4t2tevoA5
 RFqLOmv+8m9wHXVY08RmBVAkjLNu/WHpKm8kHaurBRVMWF15SlrsxXz6/+N+kI0ATeht
 bp4njPRfn1hszQlLWzfdnKHC42U3EKqcFY72vrk7B57XXhHgI/YQXzUJgFfLKn/edf6A
 /foHLfb4NzMULwsrlnVuizzU4rvvL9yr9LS9raiOIIhHkMp6OrcGGlB6LBXpGoKlz9VB
 05ZQ==
X-Gm-Message-State: AOAM532m2/WGj/2WvhUQlufHxBQkc34W2EeB9RVJrn9NVOkcD6nw7Ljh
 6URd5JVZv4U9p1yxsdXHuSf0DA==
X-Google-Smtp-Source: ABdhPJwxoKS8t69phmvBWkAPmJH+/yvrTxEgimXVcO09ZX2WO/qV1KanLTZK44hqMEscS6TuH2cCdA==
X-Received: by 2002:a67:e1d2:: with SMTP id p18mr11692032vsl.30.1635100932702; 
 Sun, 24 Oct 2021 11:42:12 -0700 (PDT)
Received: from fedora ([187.64.134.142])
 by smtp.gmail.com with ESMTPSA id o18sm8578301vkb.21.2021.10.24.11.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 11:42:12 -0700 (PDT)
Date: Sun, 24 Oct 2021 15:42:07 -0300
From: =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>
To: lars@metafoo.de, nuno.sa@analog.com, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ASoC: adau1701: Replace legacy gpio interface for gpiod
Message-ID: <YXWo/9o7ye9a11aR@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 Oct 2021 08:14:36 +0200
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

Considering the current transition of the GPIO subsystem, remove all
dependencies of the legacy GPIO interface (linux/gpio.h and linux
/of_gpio.h) and replace it with the descriptor-based GPIO approach.

Signed-off-by: Maíra Canal <maira.canal@usp.br>
---
 sound/soc/codecs/adau1701.c | 94 ++++++++++++-------------------------
 1 file changed, 31 insertions(+), 63 deletions(-)

diff --git a/sound/soc/codecs/adau1701.c b/sound/soc/codecs/adau1701.c
index 5ce74697564a..1ef071533b06 100644
--- a/sound/soc/codecs/adau1701.c
+++ b/sound/soc/codecs/adau1701.c
@@ -13,8 +13,8 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/of_device.h>
+#include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regmap.h>
 #include <sound/core.h>
@@ -106,8 +106,8 @@ static const char * const supply_names[] = {
 };
 
 struct adau1701 {
-	int gpio_nreset;
-	int gpio_pll_mode[2];
+	struct gpio_desc  *gpio_nreset;
+	struct gpio_descs *gpio_pll_mode;
 	unsigned int dai_fmt;
 	unsigned int pll_clkdiv;
 	unsigned int sysclk;
@@ -303,39 +303,41 @@ static int adau1701_reset(struct snd_soc_component *component, unsigned int clkd
 	struct adau1701 *adau1701 = snd_soc_component_get_drvdata(component);
 	int ret;
 
+	DECLARE_BITMAP(values, 2);
 	sigmadsp_reset(adau1701->sigmadsp);
 
-	if (clkdiv != ADAU1707_CLKDIV_UNSET &&
-	    gpio_is_valid(adau1701->gpio_pll_mode[0]) &&
-	    gpio_is_valid(adau1701->gpio_pll_mode[1])) {
+	if (clkdiv != ADAU1707_CLKDIV_UNSET && adau1701->gpio_pll_mode) {
 		switch (clkdiv) {
 		case 64:
-			gpio_set_value_cansleep(adau1701->gpio_pll_mode[0], 0);
-			gpio_set_value_cansleep(adau1701->gpio_pll_mode[1], 0);
+			__assign_bit(0, values, 0);
+			__assign_bit(1, values, 0);
 			break;
 		case 256:
-			gpio_set_value_cansleep(adau1701->gpio_pll_mode[0], 0);
-			gpio_set_value_cansleep(adau1701->gpio_pll_mode[1], 1);
+			__assign_bit(0, values, 0);
+			__assign_bit(1, values, 1);
 			break;
 		case 384:
-			gpio_set_value_cansleep(adau1701->gpio_pll_mode[0], 1);
-			gpio_set_value_cansleep(adau1701->gpio_pll_mode[1], 0);
+			__assign_bit(0, values, 1);
+			__assign_bit(1, values, 0);
 			break;
-		case 0:	/* fallback */
+		case 0: /* fallback */
 		case 512:
-			gpio_set_value_cansleep(adau1701->gpio_pll_mode[0], 1);
-			gpio_set_value_cansleep(adau1701->gpio_pll_mode[1], 1);
+			__assign_bit(0, values, 1);
+			__assign_bit(1, values, 1);
 			break;
 		}
+		gpiod_set_array_value_cansleep(adau1701->gpio_pll_mode->ndescs,
+				adau1701->gpio_pll_mode->desc, adau1701->gpio_pll_mode->info,
+				values);
 	}
 
 	adau1701->pll_clkdiv = clkdiv;
 
-	if (gpio_is_valid(adau1701->gpio_nreset)) {
-		gpio_set_value_cansleep(adau1701->gpio_nreset, 0);
+	if (adau1701->gpio_nreset) {
+		gpiod_set_value_cansleep(adau1701->gpio_nreset, 0);
 		/* minimum reset time is 20ns */
 		udelay(1);
-		gpio_set_value_cansleep(adau1701->gpio_nreset, 1);
+		gpiod_set_value_cansleep(adau1701->gpio_nreset, 1);
 		/* power-up time may be as long as 85ms */
 		mdelay(85);
 	}
@@ -719,8 +721,8 @@ static void adau1701_remove(struct snd_soc_component *component)
 {
 	struct adau1701 *adau1701 = snd_soc_component_get_drvdata(component);
 
-	if (gpio_is_valid(adau1701->gpio_nreset))
-		gpio_set_value_cansleep(adau1701->gpio_nreset, 0);
+	if (adau1701->gpio_nreset)
+		gpiod_set_value_cansleep(adau1701->gpio_nreset, 0);
 
 	regulator_bulk_disable(ARRAY_SIZE(adau1701->supplies), adau1701->supplies);
 }
@@ -788,8 +790,6 @@ static int adau1701_i2c_probe(struct i2c_client *client,
 {
 	struct adau1701 *adau1701;
 	struct device *dev = &client->dev;
-	int gpio_nreset = -EINVAL;
-	int gpio_pll_mode[2] = { -EINVAL, -EINVAL };
 	int ret, i;
 
 	adau1701 = devm_kzalloc(dev, sizeof(*adau1701), GFP_KERNEL);
@@ -823,26 +823,6 @@ static int adau1701_i2c_probe(struct i2c_client *client,
 
 
 	if (dev->of_node) {
-		gpio_nreset = of_get_named_gpio(dev->of_node, "reset-gpio", 0);
-		if (gpio_nreset < 0 && gpio_nreset != -ENOENT) {
-			ret = gpio_nreset;
-			goto exit_regulators_disable;
-		}
-
-		gpio_pll_mode[0] = of_get_named_gpio(dev->of_node,
-						   "adi,pll-mode-gpios", 0);
-		if (gpio_pll_mode[0] < 0 && gpio_pll_mode[0] != -ENOENT) {
-			ret = gpio_pll_mode[0];
-			goto exit_regulators_disable;
-		}
-
-		gpio_pll_mode[1] = of_get_named_gpio(dev->of_node,
-						   "adi,pll-mode-gpios", 1);
-		if (gpio_pll_mode[1] < 0 && gpio_pll_mode[1] != -ENOENT) {
-			ret = gpio_pll_mode[1];
-			goto exit_regulators_disable;
-		}
-
 		of_property_read_u32(dev->of_node, "adi,pll-clkdiv",
 				     &adau1701->pll_clkdiv);
 
@@ -851,32 +831,20 @@ static int adau1701_i2c_probe(struct i2c_client *client,
 					  ARRAY_SIZE(adau1701->pin_config));
 	}
 
-	if (gpio_is_valid(gpio_nreset)) {
-		ret = devm_gpio_request_one(dev, gpio_nreset, GPIOF_OUT_INIT_LOW,
-					    "ADAU1701 Reset");
-		if (ret < 0)
-			goto exit_regulators_disable;
+	adau1701->gpio_nreset = devm_gpiod_get_optional(dev, "reset", GPIOD_IN);
+
+	if (IS_ERR(adau1701->gpio_nreset)) {
+		ret = PTR_ERR(adau1701->gpio_nreset);
+		goto exit_regulators_disable;
 	}
 
-	if (gpio_is_valid(gpio_pll_mode[0]) &&
-	    gpio_is_valid(gpio_pll_mode[1])) {
-		ret = devm_gpio_request_one(dev, gpio_pll_mode[0],
-					    GPIOF_OUT_INIT_LOW,
-					    "ADAU1701 PLL mode 0");
-		if (ret < 0)
-			goto exit_regulators_disable;
+	adau1701->gpio_pll_mode = devm_gpiod_get_array_optional(dev, "adi,pll-mode", GPIOD_OUT_LOW);
 
-		ret = devm_gpio_request_one(dev, gpio_pll_mode[1],
-					    GPIOF_OUT_INIT_LOW,
-					    "ADAU1701 PLL mode 1");
-		if (ret < 0)
-			goto exit_regulators_disable;
+	if (IS_ERR(adau1701->gpio_pll_mode)) {
+		ret = PTR_ERR(adau1701->gpio_pll_mode);
+		goto exit_regulators_disable;
 	}
 
-	adau1701->gpio_nreset = gpio_nreset;
-	adau1701->gpio_pll_mode[0] = gpio_pll_mode[0];
-	adau1701->gpio_pll_mode[1] = gpio_pll_mode[1];
-
 	i2c_set_clientdata(client, adau1701);
 
 	adau1701->sigmadsp = devm_sigmadsp_init_i2c(client,
-- 
2.31.1

