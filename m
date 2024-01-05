Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B04E825767
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jan 2024 17:00:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA27FE94;
	Fri,  5 Jan 2024 17:00:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA27FE94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704470434;
	bh=vxDO7NWsyYOxdk8MH6oAWFQBB4uYXhaj5d9IsPnW244=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RhwgrVrOV+FtK7lsentNh5LnF0YDRMJn0atqAoZYd2ypmcqMOiKPqSiZBtf60lrGt
	 A+DO5T0JdEXbRg/ZPkSTfhign1tmCqOEXthb0JxH3zyCWBrVKBubgxzk6YGWmRkVEF
	 SrR/6gQtjCqJotcTWOkAEbpxZ7zXgd/8XgiptLWg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81116F805C9; Fri,  5 Jan 2024 16:59:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9899BF805BF;
	Fri,  5 Jan 2024 16:59:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1961F805AC; Fri,  5 Jan 2024 16:59:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 060D0F80086
	for <alsa-devel@alsa-project.org>; Fri,  5 Jan 2024 16:59:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 060D0F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=T+m7E62h
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a26f73732c5so184709066b.3
        for <alsa-devel@alsa-project.org>;
 Fri, 05 Jan 2024 07:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704470365; x=1705075165;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDuMrijv2n4yWr4gr0fXQfwtgxk4DAsUrjH6HhYvL7U=;
        b=T+m7E62ha0NS/bhWVhhb2NiIF3eExylGpEZo99WsByu1EQefESksDhhmRTDUHGBUBb
         yb3sP3XuFtloszB12zc0wdB9jXAyp53xbuqcr8NZ39+JCWUP8YvvYRl8hY3zvQxJXDoB
         OnYpW/j/uKSYzeVjlHh09kn0uVI940zXa78R6ES2jtJck66oYiOlpdKO9Y5dNRBcX3LQ
         EO/cWXjulq6UegDeBEVKtIi8+9KEJsJ2gQ1Voriqhq+FZalcS+GlJeUt37NaB412kQgu
         X80Fax1HifHLl0pJzJ/eXgFwhxL3p3GJif7AxhwUfgTbXr+jDvEMLZICL2GrObApYcnb
         fFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704470365; x=1705075165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TDuMrijv2n4yWr4gr0fXQfwtgxk4DAsUrjH6HhYvL7U=;
        b=IuGdLOtl22cZ5/IgpzJA76SAGfPlvVlj5p7RD/gGsEbSG/ipaxhZq2lmLGZnAip+4Y
         uEmmJiAIMUMnHcEKANyq7u2B6cx7gJJi7KVa+mrYH160/RTzJtvJnzbsbxgHPHBVAePG
         tCrCdoybOH+UB2MWu5uGalVIp6x5y/LYeG6b5Gy3Vn4yBrm329WAxD4IkJtBSKT9DgS6
         rBLMfnw58f41HMt84YBOTJrMnZYV1oODhqAgT9vdRjC19XHjHXmHjY4/KD88aQXfTB2W
         iT75Db0glIgI1H2LsYRnMr83kdlrQEXlEKK6FvzZ2RpXPdJivDJ2OFFJBfy44fjbTxhP
         wBIg==
X-Gm-Message-State: AOJu0YyH2L5cdHNw2L+3PeeJtLvVxdixAXK4IutddUjL0FmWra3O2l78
	F5QLy7o5jegWaX3ZEr8h4IFHqzruUACoZQ==
X-Google-Smtp-Source: 
 AGHT+IGHO2j43GzLRzecHQARtf8C7nxj4MOciN8ZW/ZXj6BM8h9fz4oBqoa3deDOqDTdz6Ido16D6g==
X-Received: by 2002:a17:906:4a09:b0:a28:ad3e:7071 with SMTP id
 w9-20020a1709064a0900b00a28ad3e7071mr1327840eju.118.1704470365032;
        Fri, 05 Jan 2024 07:59:25 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id
 su8-20020a17090703c800b00a29910a9366sm326024ejb.8.2024.01.05.07.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 07:59:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH v2 1/4] reset: gpio: Add GPIO-based reset controller
Date: Fri,  5 Jan 2024 16:59:15 +0100
Message-Id: <20240105155918.279657-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240105155918.279657-1-krzysztof.kozlowski@linaro.org>
References: <20240105155918.279657-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CZXTYDCU32RW4I7ZPXM5SOW5ITXKMVTR
X-Message-ID-Hash: CZXTYDCU32RW4I7ZPXM5SOW5ITXKMVTR
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CZXTYDCU32RW4I7ZPXM5SOW5ITXKMVTR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a simple driver to control GPIO-based resets using the reset
controller API for the cases when the GPIOs are shared and reset should
be coordinated.  The driver is expected to be used by reset core
framework for ad-hoc reset controllers.

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sean Anderson <sean.anderson@seco.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS                |   5 ++
 drivers/reset/Kconfig      |   9 +++
 drivers/reset/Makefile     |   1 +
 drivers/reset/reset-gpio.c | 121 +++++++++++++++++++++++++++++++++++++
 4 files changed, 136 insertions(+)
 create mode 100644 drivers/reset/reset-gpio.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 7fe27cd60e1b..a0fbd4814bc7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8866,6 +8866,11 @@ F:	Documentation/i2c/muxes/i2c-mux-gpio.rst
 F:	drivers/i2c/muxes/i2c-mux-gpio.c
 F:	include/linux/platform_data/i2c-mux-gpio.h
 
+GENERIC GPIO RESET DRIVER
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+S:	Maintained
+F:	drivers/reset/reset-gpio.c
+
 GENERIC HDLC (WAN) DRIVERS
 M:	Krzysztof Halasa <khc@pm.waw.pl>
 S:	Maintained
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index ccd59ddd7610..bb1b5a326eb7 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -66,6 +66,15 @@ config RESET_BRCMSTB_RESCAL
 	  This enables the RESCAL reset controller for SATA, PCIe0, or PCIe1 on
 	  BCM7216.
 
+config RESET_GPIO
+	tristate "GPIO reset controller"
+	help
+	  This enables a generic reset controller for resets attached via
+	  GPIOs.  Typically for OF platforms this driver expects "reset-gpios"
+	  property.
+
+	  If compiled as module, it will be called reset-gpio.
+
 config RESET_HSDK
 	bool "Synopsys HSDK Reset Driver"
 	depends on HAS_IOMEM
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 8270da8a4baa..fd8b49fa46fc 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_RESET_BCM6345) += reset-bcm6345.o
 obj-$(CONFIG_RESET_BERLIN) += reset-berlin.o
 obj-$(CONFIG_RESET_BRCMSTB) += reset-brcmstb.o
 obj-$(CONFIG_RESET_BRCMSTB_RESCAL) += reset-brcmstb-rescal.o
+obj-$(CONFIG_RESET_GPIO) += reset-gpio.o
 obj-$(CONFIG_RESET_HSDK) += reset-hsdk.o
 obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
 obj-$(CONFIG_RESET_INTEL_GW) += reset-intel-gw.o
diff --git a/drivers/reset/reset-gpio.c b/drivers/reset/reset-gpio.c
new file mode 100644
index 000000000000..cf0a867cbc5f
--- /dev/null
+++ b/drivers/reset/reset-gpio.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+
+struct reset_gpio_priv {
+	struct reset_controller_dev rc;
+	struct gpio_desc *reset;
+};
+
+static inline struct reset_gpio_priv
+*rc_to_reset_gpio(struct reset_controller_dev *rc)
+{
+	return container_of(rc, struct reset_gpio_priv, rc);
+}
+
+static int reset_gpio_assert(struct reset_controller_dev *rc, unsigned long id)
+{
+	struct reset_gpio_priv *priv = rc_to_reset_gpio(rc);
+
+	gpiod_set_value_cansleep(priv->reset, 1);
+
+	return 0;
+}
+
+static int reset_gpio_deassert(struct reset_controller_dev *rc,
+			       unsigned long id)
+{
+	struct reset_gpio_priv *priv = rc_to_reset_gpio(rc);
+
+	gpiod_set_value_cansleep(priv->reset, 0);
+
+	return 0;
+}
+
+static int reset_gpio_status(struct reset_controller_dev *rc, unsigned long id)
+{
+	struct reset_gpio_priv *priv = rc_to_reset_gpio(rc);
+
+	return gpiod_get_value_cansleep(priv->reset);
+}
+
+static const struct reset_control_ops reset_gpio_ops = {
+	.assert = reset_gpio_assert,
+	.deassert = reset_gpio_deassert,
+	.status = reset_gpio_status,
+};
+
+static void reset_gpio_of_args_put(void *data)
+{
+	of_node_put(data);
+}
+
+static int reset_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node **platdata = dev_get_platdata(dev);
+	struct of_phandle_args gpio_args;
+	struct reset_gpio_priv *priv;
+	int ret;
+
+	if (!platdata || !*platdata)
+		return -EINVAL;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, &priv->rc);
+	device_set_node(dev, of_fwnode_handle(*platdata));
+
+	priv->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->reset))
+		return dev_err_probe(dev, PTR_ERR(priv->reset),
+				     "Could not get reset gpios\n");
+
+	ret = of_parse_phandle_with_args(*platdata, "reset-gpios",
+					 "#gpio-cells", 0, &gpio_args);
+	if (ret)
+		return ret;
+
+	priv->rc.ops = &reset_gpio_ops;
+	priv->rc.owner = THIS_MODULE;
+	priv->rc.dev = dev;
+	priv->rc.nr_resets = 1;
+	priv->rc.of_node = gpio_args.np;
+	ret = devm_add_action_or_reset(dev, reset_gpio_of_args_put,
+				       priv->rc.of_node);
+	if (ret)
+		return ret;
+
+	priv->rc.of_args = devm_kmemdup(dev, &gpio_args, sizeof(gpio_args),
+					GFP_KERNEL);
+	if (!priv->rc.of_args)
+		return -ENOMEM;
+
+	return devm_reset_controller_register(dev, &priv->rc);
+}
+
+static const struct platform_device_id reset_gpio_ids[] = {
+	{ .name = "reset-gpio", },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, reset_gpio_ids);
+
+static struct platform_driver reset_gpio_driver = {
+	.probe		= reset_gpio_probe,
+	.id_table	= reset_gpio_ids,
+	.driver	= {
+		.name = "reset-gpio",
+	},
+};
+module_platform_driver(reset_gpio_driver);
+
+MODULE_AUTHOR("Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>");
+MODULE_DESCRIPTION("Generic GPIO reset driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

