Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 628C3E874B
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2019 12:38:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED96A2268;
	Tue, 29 Oct 2019 12:37:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED96A2268
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572349107;
	bh=U6bYtHYADopphzARCrzX/2UPPaUxNqSREdzSO83RjA4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YLqgM5hXDXedkZcSm7Eb5cg5Vo4c+XJ0HtwTpnYMMgsd9ZrN0UCsNqGEEJztW6ii5
	 OMkOYFI4U04DNXFTJ/Hp5xMua9ZW3PT7XL2zkT+Cb3Z8NKPYKIcy9YzhQnt6o00jTL
	 gOTuPhroYIHMLlRoc9+Q0d7lLtqworyKx5ArYXcA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47371F80726;
	Tue, 29 Oct 2019 12:29:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2010CF8065A; Tue, 29 Oct 2019 12:29:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AC8FF8060F
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 12:29:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AC8FF8060F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="pQZpvRiP"
Received: by mail-wm1-x341.google.com with SMTP id q70so2167554wme.1
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 04:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NFhJ0Ish0UcipllWIdsD8WX5howJ70tuJMN0799CtbQ=;
 b=pQZpvRiPx31EGQqU5buRItdrMagsWsxMcKgktVuP2yOR2OCp/jcksr5P6Kyo0prd1j
 zluZc8Sf0imBfHr7YhRbS+LXfNspcKUDv28AHny/DTwJnRZNiYNPgFJmShpsnRJ33dT8
 SKRseIhZJb4UMzmCQwtam1054lOmYl0VQYpSp4YWoL6aN3h4n78xtbqJTd8ueP6vUVop
 0kmMJBLL8fGJkGWbDaAFHWOcO2+dTEzs4jvMKuRfr0IMm+pCBDCTnmjt+cA6YuWxpxc+
 ppgVj+HFbnBn/uSI7TnfkUCHqnveFg0CBqwqiK8HQrJrg8dHuonIPZnzhOHlQvlnpyqp
 c80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NFhJ0Ish0UcipllWIdsD8WX5howJ70tuJMN0799CtbQ=;
 b=Y8mN6OHeLli6t5CN8TOMw3V9U758Kch816z4NIFmiW5cQSI3IirIph8CwVhzeY2vbD
 KFtab1Kj9jwcxZIX6HX4E6z5B5D5wx9MGlISgqRL7cjMWpIwGs8811hLM3K37ZXzkVyB
 pLfNHyZ9DyY52n1bZNa1nbcCiNP7nZV9Ec6JKWkFxq2tc1wlzHoHza4Z6brCROcZs84H
 XkrkFgnJjJ/xLuh0PFT7/g8Wsq+ExK0V9FEJRPF4YrWzMgsoZmyv/e3bgEdf9SYmqmU0
 Tlhd8D4wjgmwFtvlruehVEoiT0pSkuLgAZUcSmX80s1KCwxaX7/PZI7PPsc0vFIcW3am
 mkEg==
X-Gm-Message-State: APjAAAUgADdjJGqRNQJU7Re9yU4b5fMOEzf2B+OIzeX+WvMVQrE7EwfU
 sfZpZ+yfJZyD0mENBVY2f3+lPw==
X-Google-Smtp-Source: APXvYqxsEhwNjXBJXv9DPbKSWOjtQ/PnNCuTLZ6il+sX4wijiIjo1u00aFWrWFidwjZGOBAOcz+1ag==
X-Received: by 2002:a1c:a78b:: with SMTP id q133mr3600793wme.115.1572348545701; 
 Tue, 29 Oct 2019 04:29:05 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id f20sm2373247wmb.6.2019.10.29.04.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 04:29:04 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: robh@kernel.org, broonie@kernel.org, lee.jones@linaro.org,
 linus.walleij@linaro.org
Date: Tue, 29 Oct 2019 11:26:58 +0000
Message-Id: <20191029112700.14548-10-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
References: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, vinod.koul@linaro.org, spapothi@codeaurora.org,
 linux-kernel@vger.kernel.org,
 Yeleswarapu Nagaradhesh <nagaradh@codeaurora.org>, linux-gpio@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v3 09/11] pinctrl: qcom-wcd934x: Add support to
	wcd934x pinctrl driver.
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

From: Yeleswarapu Nagaradhesh <nagaradh@codeaurora.org>

This patch adds support to wcd934x pinctrl block found in
WCD9340/WC9341 Audio codecs.

[Srini: multiple cleanups to the code]
Signed-off-by: Yeleswarapu Nagaradhesh <nagaradh@codeaurora.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/pinctrl/qcom/Kconfig                |   7 +
 drivers/pinctrl/qcom/Makefile               |   1 +
 drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c | 365 ++++++++++++++++++++
 3 files changed, 373 insertions(+)
 create mode 100644 drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 32fc2458b8eb..7406df5fb89a 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -195,4 +195,11 @@ config PINCTRL_SM8150
          Qualcomm Technologies Inc TLMM block found on the Qualcomm
          Technologies Inc SM8150 platform.
 
+config PINCTRL_WCD934X
+	tristate "Qualcomm Technologies Inc WCD9340/WCD9341 pin controller driver"
+	depends on GPIOLIB && OF
+	help
+         This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+         Qualcomm Technologies Inc Pinctrl block found on the Qualcomm
+         Technologies Inc WCD9340/WCD9341 Audio Codec.
 endif
diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index f8bb0c265381..8c42ba1bdd69 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -24,3 +24,4 @@ obj-$(CONFIG_PINCTRL_SC7180)	+= pinctrl-sc7180.o
 obj-$(CONFIG_PINCTRL_SDM660)   += pinctrl-sdm660.o
 obj-$(CONFIG_PINCTRL_SDM845) += pinctrl-sdm845.o
 obj-$(CONFIG_PINCTRL_SM8150) += pinctrl-sm8150.o
+obj-$(CONFIG_PINCTRL_WCD934X) += pinctrl-wcd934x-gpio.o
diff --git a/drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c b/drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c
new file mode 100644
index 000000000000..1aff88d0bcb3
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c
@@ -0,0 +1,365 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2016-2017, The Linux Foundation. All rights reserved.
+// Copyright (c) 2019, Linaro Limited
+
+#include <linux/module.h>
+#include <linux/gpio.h>
+#include <linux/interrupt.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_gpio.h>
+
+#include "../core.h"
+#include "../pinctrl-utils.h"
+
+#define WCD_REG_DIR_CTL_OFFSET 0x42
+#define WCD_REG_VAL_CTL_OFFSET 0x43
+#define WCD_GPIO_PULL_UP       1
+#define WCD_GPIO_PULL_DOWN     2
+#define WCD_GPIO_BIAS_DISABLE  3
+#define WCD_GPIO_STRING_LEN    20
+#define WCD934X_NPINS		5
+
+/**
+ * struct wcd_gpio_pad - keep current GPIO settings
+ * @offset: offset of gpio.
+ * @is_valid: Set to false, when GPIO in high Z state.
+ * @value: value of a pin
+ * @output_enabled: Set to true if GPIO is output and false if it is input
+ * @pullup: Constant current which flow through GPIO output buffer.
+ * @strength: Drive strength of a pin
+ */
+struct wcd_gpio_pad {
+	u16  offset;
+	bool is_valid;
+	bool value;
+	bool output_enabled;
+	unsigned int pullup;
+	unsigned int strength;
+};
+
+struct wcd_gpio_priv {
+	struct device *dev;
+	struct regmap *map;
+	struct pinctrl_dev *ctrl;
+	struct gpio_chip chip;
+};
+
+static int wcd_gpio_read(struct wcd_gpio_priv *priv_data,
+			 struct wcd_gpio_pad *pad, unsigned int addr)
+{
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(priv_data->map, addr, &val);
+	if (ret < 0)
+		dev_err(priv_data->dev, "%s: read 0x%x failed\n",
+			__func__, addr);
+	else
+		ret = (val >> pad->offset);
+
+	return ret;
+}
+
+static int wcd_gpio_write(struct wcd_gpio_priv *priv_data,
+			  struct wcd_gpio_pad *pad, unsigned int addr,
+			  unsigned int val)
+{
+	int ret;
+
+	ret = regmap_update_bits(priv_data->map, addr, (1 << pad->offset),
+				 val << pad->offset);
+	if (ret < 0)
+		dev_err(priv_data->dev, "write 0x%x failed\n", addr);
+
+	return ret;
+}
+
+static int wcd_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	return pctldev->desc->npins;
+}
+
+static const char *wcd_get_group_name(struct pinctrl_dev *pctldev,
+				      unsigned int pin)
+{
+	return pctldev->desc->pins[pin].name;
+}
+
+static int wcd_get_group_pins(struct pinctrl_dev *pctldev, unsigned int pin,
+			      const unsigned int **pins, unsigned int *num_pins)
+{
+	*pins = &pctldev->desc->pins[pin].number;
+	*num_pins = 1;
+
+	return 0;
+}
+
+static const struct pinctrl_ops wcd_pinctrl_ops = {
+	.get_groups_count       = wcd_get_groups_count,
+	.get_group_name         = wcd_get_group_name,
+	.get_group_pins         = wcd_get_group_pins,
+	.dt_node_to_map         = pinconf_generic_dt_node_to_map_group,
+	.dt_free_map            = pinctrl_utils_free_map,
+};
+
+static int wcd_config_get(struct pinctrl_dev *pctldev,
+			  unsigned int pin, unsigned long *config)
+{
+	unsigned int param = pinconf_to_config_param(*config);
+	struct wcd_gpio_pad *pad;
+	unsigned int arg;
+
+	pad = pctldev->desc->pins[pin].drv_data;
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		arg = pad->pullup == WCD_GPIO_PULL_DOWN;
+		break;
+	case PIN_CONFIG_BIAS_DISABLE:
+		arg = pad->pullup = WCD_GPIO_BIAS_DISABLE;
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		arg = pad->pullup == WCD_GPIO_PULL_UP;
+		break;
+	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+		arg = !pad->is_valid;
+		break;
+	case PIN_CONFIG_INPUT_ENABLE:
+		arg = pad->output_enabled;
+		break;
+	case PIN_CONFIG_OUTPUT:
+		arg = pad->value;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	*config = pinconf_to_config_packed(param, arg);
+	return 0;
+}
+
+static int wcd_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
+			  unsigned long *configs, unsigned int nconfs)
+{
+	struct wcd_gpio_priv *priv_data = pinctrl_dev_get_drvdata(pctldev);
+	struct wcd_gpio_pad *pad;
+	unsigned int param, arg;
+	int i, ret;
+
+	pad = pctldev->desc->pins[pin].drv_data;
+
+	for (i = 0; i < nconfs; i++) {
+		param = pinconf_to_config_param(configs[i]);
+		arg = pinconf_to_config_argument(configs[i]);
+
+		switch (param) {
+		case PIN_CONFIG_BIAS_DISABLE:
+			pad->pullup = WCD_GPIO_BIAS_DISABLE;
+			break;
+		case PIN_CONFIG_BIAS_PULL_UP:
+			pad->pullup = WCD_GPIO_PULL_UP;
+			break;
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			pad->pullup = WCD_GPIO_PULL_DOWN;
+			break;
+		case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+			pad->is_valid = false;
+			break;
+		case PIN_CONFIG_INPUT_ENABLE:
+			pad->output_enabled = false;
+			break;
+		case PIN_CONFIG_OUTPUT:
+			pad->output_enabled = true;
+			pad->value = arg;
+			break;
+		case PIN_CONFIG_DRIVE_STRENGTH:
+			pad->strength = arg;
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	ret = wcd_gpio_write(priv_data, pad, WCD_REG_DIR_CTL_OFFSET,
+			     pad->output_enabled);
+	if (ret < 0)
+		return ret;
+
+	if (pad->output_enabled)
+		ret = wcd_gpio_write(priv_data, pad, WCD_REG_VAL_CTL_OFFSET,
+				     pad->value);
+
+	return ret;
+}
+
+static const struct pinconf_ops wcd_pinconf_ops = {
+	.is_generic  = true,
+	.pin_config_group_get = wcd_config_get,
+	.pin_config_group_set = wcd_config_set,
+};
+
+static int wcd_gpio_direction_input(struct gpio_chip *chip, unsigned int pin)
+{
+	struct wcd_gpio_priv *priv_data = gpiochip_get_data(chip);
+	unsigned long config;
+
+	config = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 1);
+
+	return wcd_config_set(priv_data->ctrl, pin, &config, 1);
+}
+
+static int wcd_gpio_direction_output(struct gpio_chip *chip,
+				      unsigned int pin, int val)
+{
+	struct wcd_gpio_priv *priv_data = gpiochip_get_data(chip);
+	unsigned long config;
+
+	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT, val);
+
+	return wcd_config_set(priv_data->ctrl, pin, &config, 1);
+}
+
+static int wcd_gpio_get(struct gpio_chip *chip, unsigned int pin)
+{
+	struct wcd_gpio_priv *priv_data = gpiochip_get_data(chip);
+	struct wcd_gpio_pad *pad;
+	int value;
+
+	pad = priv_data->ctrl->desc->pins[pin].drv_data;
+
+	if (!pad->is_valid)
+		return -EINVAL;
+
+	value = wcd_gpio_read(priv_data, pad, WCD_REG_VAL_CTL_OFFSET);
+
+	return value;
+}
+
+static void wcd_gpio_set(struct gpio_chip *chip, unsigned int pin, int value)
+{
+	struct wcd_gpio_priv *priv_data = gpiochip_get_data(chip);
+	unsigned long config;
+
+	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT, value);
+
+	wcd_config_set(priv_data->ctrl, pin, &config, 1);
+}
+
+static const struct gpio_chip wcd_gpio_chip = {
+	.direction_input  = wcd_gpio_direction_input,
+	.direction_output = wcd_gpio_direction_output,
+	.get = wcd_gpio_get,
+	.set = wcd_gpio_set,
+};
+
+static int wcd_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct pinctrl_pin_desc *pindesc;
+	struct pinctrl_desc *pctrldesc;
+	struct wcd_gpio_pad *pad, *pads;
+	struct wcd_gpio_priv *priv_data;
+	u32 npins = WCD934X_NPINS;
+	char **name;
+	int i;
+
+	priv_data = devm_kzalloc(dev, sizeof(*priv_data), GFP_KERNEL);
+	if (!priv_data)
+		return -ENOMEM;
+
+	priv_data->dev = dev;
+	priv_data->map = dev_get_regmap(dev->parent, NULL);
+	if (!priv_data->map) {
+		dev_err(dev, "%s: failed to get regmap\n", __func__);
+		return  -EINVAL;
+	}
+
+	pindesc = devm_kcalloc(dev, npins, sizeof(*pindesc), GFP_KERNEL);
+	if (!pindesc)
+		return -ENOMEM;
+
+	pads = devm_kcalloc(dev, npins, sizeof(*pads), GFP_KERNEL);
+	if (!pads)
+		return -ENOMEM;
+
+	pctrldesc = devm_kzalloc(dev, sizeof(*pctrldesc), GFP_KERNEL);
+	if (!pctrldesc)
+		return -ENOMEM;
+
+	pctrldesc->pctlops = &wcd_pinctrl_ops;
+	pctrldesc->confops = &wcd_pinconf_ops;
+	pctrldesc->owner = THIS_MODULE;
+	pctrldesc->name = dev_name(dev);
+	pctrldesc->pins = pindesc;
+	pctrldesc->npins = npins;
+
+	name = devm_kcalloc(dev, npins, sizeof(char *), GFP_KERNEL);
+	if (!name)
+		return -ENOMEM;
+
+	for (i = 0; i < npins; i++, pindesc++) {
+		name[i] = devm_kzalloc(dev, sizeof(char) * WCD_GPIO_STRING_LEN,
+				       GFP_KERNEL);
+		if (!name[i])
+			return -ENOMEM;
+
+		pad = &pads[i];
+		pindesc->drv_data = pad;
+		pindesc->number = i;
+		snprintf(name[i], (WCD_GPIO_STRING_LEN - 1), "gpio%d", (i+1));
+		pindesc->name = name[i];
+		pad->offset = i;
+		pad->is_valid  = true;
+	}
+
+	priv_data->chip = wcd_gpio_chip;
+	priv_data->chip.parent = dev;
+	priv_data->chip.base = -1;
+	priv_data->chip.ngpio = npins;
+	priv_data->chip.label = dev_name(dev);
+	priv_data->chip.of_gpio_n_cells = 2;
+	priv_data->chip.can_sleep = false;
+	platform_set_drvdata(pdev, priv_data);
+
+	priv_data->ctrl = devm_pinctrl_register(dev, pctrldesc, priv_data);
+	if (IS_ERR(priv_data->ctrl)) {
+		dev_err(dev, "%s: failed to register to pinctrl\n", __func__);
+		return PTR_ERR(priv_data->ctrl);
+	}
+
+	return gpiochip_add_data(&priv_data->chip, priv_data);
+}
+
+static int wcd_pinctrl_remove(struct platform_device *pdev)
+{
+	struct wcd_gpio_priv *priv_data = platform_get_drvdata(pdev);
+
+	gpiochip_remove(&priv_data->chip);
+
+	return 0;
+}
+
+static const struct of_device_id wcd_pinctrl_of_match[] = {
+	{ .compatible = "qcom,wcd9340-pinctrl" },
+	{ .compatible = "qcom,wcd9341-pinctrl" },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(of, wcd_pinctrl_of_match);
+
+static struct platform_driver wcd_pinctrl_driver = {
+	.driver = {
+		   .name = "wcd934x-pinctrl",
+		   .of_match_table = wcd_pinctrl_of_match,
+	},
+	.probe = wcd_pinctrl_probe,
+	.remove = wcd_pinctrl_remove,
+};
+
+module_platform_driver(wcd_pinctrl_driver);
+
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc WCD GPIO pin control driver");
+MODULE_LICENSE("GPL v2");
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
