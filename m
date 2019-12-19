Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C58C125F54
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2019 11:39:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8542165D;
	Thu, 19 Dec 2019 11:38:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8542165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576751982;
	bh=85o+DohtbazuOk4mMutQv9/vD+2Ty93xBl7Jfqqa/5c=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dw0IcrwyoRSscRIpvmK1s5WKfJRGkkBfw9RKzNsAHGB0aO69Y3wLkenm6XnXSmzP7
	 bwXXaPOc37gn7xBj5prUbBVc9l0XEd+E+EUDFY2+VZ4cz5XXBMl8A9YAUH6k2RfyOS
	 A+3D9jAna9+gq8uHhcujpWwBfUPMv1c2XOH6D+ls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C4E5F802DD;
	Thu, 19 Dec 2019 11:33:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E951DF80292; Thu, 19 Dec 2019 11:33:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09339F80274
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 11:33:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09339F80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ktZZjyoT"
Received: by mail-wr1-x444.google.com with SMTP id d16so5402853wre.10
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 02:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DVqcfTgjqDIP2wy7JDCyl9+vrKLd49ALRMx75DX6+Wc=;
 b=ktZZjyoTyUtEdNALf1SUzrS1RPulAqz9Se89Q4db1cThkkBsCMs7gsG3rDtjq0yNsi
 1sjtnRgiV78PeN17xTD2FWam85YUufWlTpQnBXMbIi06RLpnGboxtv+lh2I7L6ZZ6H1O
 3tfMyfeWxJUph3D1z8GuVXxKMcMCGa80N4qGnVTJc+0jwa5vjgerOi5ecxVgWHzOpM34
 snKbXZbSzJyTQh3V20VFLiT7UOnM4/BX84Iflpnejm/qpOw8ITHqpwm/y8Bg0ZPVgyV1
 7unaqHWFOSXFtKm9uVU4Ca4EHzCkmntnjAK9Nd8DGIAR2LrbCdoidB5OEZ8WN0+E3dMr
 WZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DVqcfTgjqDIP2wy7JDCyl9+vrKLd49ALRMx75DX6+Wc=;
 b=ebTh7iTs1gyDhr0T16ICdgMgjuVuEKijq94cZf9efuDHlqxiZ+ivI5LhKVaO0DRK9/
 Y2jaPjPv8m0DIX6Atyxx+zCal+SX3Ps6oeOg0+HnKk5c8/HdIWpFUZ9yMpvEZC9aMpt6
 07OGC6dL6OfDItzU3G8yM3U1jhUrEIz//QKYj0HqR3yWlIOhKXPAyrq+cjyhVWBdYgTL
 ySCelFH+62am+yGSlTPuA7qn5KIHl3g6Pyis+2NYJiQp/WBuy88qhYN/E1zKj2D7Yc5X
 DBT78GqenD7T0Uytnezg9xCjQpC72fFP7b9OViSGWtDKk8NAgcknWIN6iX43SD7YO8Yd
 FY3g==
X-Gm-Message-State: APjAAAXGUvI+rDoKN9K6lBkiSiZmQF9pB/BUoCmy2gBCjt5XxOume7pu
 yfCv/9k/QZW2EjPXLj3vOMFMRA==
X-Google-Smtp-Source: APXvYqywH6nF4apRKFQBfuslkaG/uLnfHUFGV9WQbZz83s/5IJ6BvRgIs+spPH6XgHIa6218fyOCfA==
X-Received: by 2002:adf:de84:: with SMTP id w4mr8217555wrl.97.1576751593796;
 Thu, 19 Dec 2019 02:33:13 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id i11sm5962942wrs.10.2019.12.19.02.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 02:33:13 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	lee.jones@linaro.org,
	linus.walleij@linaro.org
Date: Thu, 19 Dec 2019 10:31:51 +0000
Message-Id: <20191219103153.14875-10-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
References: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 vinod.koul@linaro.org, devicetree@vger.kernel.org, spapothi@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v6 09/11] gpio: wcd934x: Add support to wcd934x
	gpio controller
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch adds support to wcd934x gpio block found in
WCD9340/WC9341 Audio codecs.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/gpio/Kconfig        |   8 +++
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-wcd934x.c | 104 ++++++++++++++++++++++++++++++++++++
 3 files changed, 113 insertions(+)
 create mode 100644 drivers/gpio/gpio-wcd934x.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8adffd42f8cb..3da3e228c221 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -613,6 +613,14 @@ config GPIO_VX855
 	  additional drivers must be enabled in order to use the
 	  functionality of the device.
 
+config GPIO_WCD934X
+	tristate "Qualcomm Technologies Inc WCD9340/WCD9341 gpio controller driver"
+	depends on MFD_WCD934X && OF_GPIO
+	select GPIO_GENERIC
+	help
+         This driver is to supprot GPIO block found on the Qualcomm Technologies
+	 Inc WCD9340/WCD9341 Audio Codec.
+
 config GPIO_XGENE
 	bool "APM X-Gene GPIO controller support"
 	depends on ARM64 && OF_GPIO
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 34eb8b2b12dd..116133f905e7 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -157,6 +157,7 @@ obj-$(CONFIG_GPIO_VF610)		+= gpio-vf610.o
 obj-$(CONFIG_GPIO_VIPERBOARD)		+= gpio-viperboard.o
 obj-$(CONFIG_GPIO_VR41XX)		+= gpio-vr41xx.o
 obj-$(CONFIG_GPIO_VX855)		+= gpio-vx855.o
+obj-$(CONFIG_GPIO_WCD934X)		+= gpio-wcd934x.o
 obj-$(CONFIG_GPIO_WHISKEY_COVE)		+= gpio-wcove.o
 obj-$(CONFIG_GPIO_WINBOND)		+= gpio-winbond.o
 obj-$(CONFIG_GPIO_WM831X)		+= gpio-wm831x.o
diff --git a/drivers/gpio/gpio-wcd934x.c b/drivers/gpio/gpio-wcd934x.c
new file mode 100644
index 000000000000..0aac33235c5f
--- /dev/null
+++ b/drivers/gpio/gpio-wcd934x.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2019, Linaro Limited
+
+#include <linux/module.h>
+#include <linux/gpio.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/of_device.h>
+
+#define WCD_PIN_MASK(p) BIT(p - 1)
+#define WCD_REG_DIR_CTL_OFFSET 0x42
+#define WCD_REG_VAL_CTL_OFFSET 0x43
+#define WCD934X_NPINS		5
+
+struct wcd_gpio_data {
+	struct regmap *map;
+	struct gpio_chip chip;
+};
+
+static int wcd_gpio_direction_input(struct gpio_chip *chip, unsigned int pin)
+{
+	struct wcd_gpio_data *data = gpiochip_get_data(chip);
+
+	return regmap_update_bits(data->map, WCD_REG_DIR_CTL_OFFSET,
+				  WCD_PIN_MASK(pin), 0);
+}
+
+static int wcd_gpio_direction_output(struct gpio_chip *chip, unsigned int pin,
+				     int val)
+{
+	struct wcd_gpio_data *data = gpiochip_get_data(chip);
+
+	regmap_update_bits(data->map, WCD_REG_DIR_CTL_OFFSET,
+			   WCD_PIN_MASK(pin), WCD_PIN_MASK(pin));
+
+	return regmap_update_bits(data->map, WCD_REG_VAL_CTL_OFFSET,
+				  WCD_PIN_MASK(pin),
+				  val ? WCD_PIN_MASK(pin) : 0);
+}
+
+static int wcd_gpio_get(struct gpio_chip *chip, unsigned int pin)
+{
+	struct wcd_gpio_data *data = gpiochip_get_data(chip);
+	int value;
+
+	regmap_read(data->map, WCD_REG_VAL_CTL_OFFSET, &value);
+
+	return !!(value && WCD_PIN_MASK(pin));
+}
+
+static void wcd_gpio_set(struct gpio_chip *chip, unsigned int pin, int val)
+{
+	wcd_gpio_direction_output(chip, pin, val);
+}
+
+static int wcd_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct wcd_gpio_data *data;
+	struct gpio_chip *chip;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->map = dev_get_regmap(dev->parent, NULL);
+	if (!data->map) {
+		dev_err(dev, "%s: failed to get regmap\n", __func__);
+		return  -EINVAL;
+	}
+
+	chip = &data->chip;
+	chip->direction_input  = wcd_gpio_direction_input;
+	chip->direction_output = wcd_gpio_direction_output;
+	chip->get = wcd_gpio_get;
+	chip->set = wcd_gpio_set;
+	chip->parent = dev;
+	chip->base = -1;
+	chip->ngpio = WCD934X_NPINS;
+	chip->label = dev_name(dev);
+	chip->of_gpio_n_cells = 2;
+	chip->can_sleep = false;
+
+	return devm_gpiochip_add_data(dev, chip, data);
+}
+
+static const struct of_device_id wcd_gpio_of_match[] = {
+	{ .compatible = "qcom,wcd9340-gpio" },
+	{ .compatible = "qcom,wcd9341-gpio" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, wcd_gpio_of_match);
+
+static struct platform_driver wcd_gpio_driver = {
+	.driver = {
+		   .name = "wcd934x-gpio",
+		   .of_match_table = wcd_gpio_of_match,
+	},
+	.probe = wcd_gpio_probe,
+};
+
+module_platform_driver(wcd_gpio_driver);
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc WCD GPIO control driver");
+MODULE_LICENSE("GPL v2");
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
