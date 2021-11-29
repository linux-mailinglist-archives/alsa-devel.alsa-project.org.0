Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1729B4611AB
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Nov 2021 11:01:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B797C17A8;
	Mon, 29 Nov 2021 11:01:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B797C17A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638180112;
	bh=oyN+usSmdK5+4wEU5OyEmBdHpr2noM/Rz9WrkAAJ+ls=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bmgYDEMjQ5jWUpul3SgqmcVy3Ynh4s0haBay6jEJZObHk6YtK9c/QWNmS82fBybhh
	 1bEUpNrbl3IhaMsOX7nYMPr8bHajtGDGIHuBQi/ySwBZO/1oigUZXhbrvxpf8+8YJ1
	 B2DvWgXMSRQ1cRXZSxPIHztdoj0COXUr/Wa8MskA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48C5CF804FF;
	Mon, 29 Nov 2021 10:59:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9141AF804FE; Mon, 29 Nov 2021 10:59:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5082AF804FA
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 10:59:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5082AF804FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="L8N4A+HJ"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1638179972; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=EAs75xa1XD5IR1dJyUe4eKPY1HHQ8QpcujV8MDixWho=;
 b=L8N4A+HJxXR5Mpn/+A/HkxQnBB1S2R9ipeOmTp93QkdiPUO5ud2/LyLe/vFYZjAlm2+j6Ci6
 FLfoo7sfoStdcPmLPoOH5WeskU4C71OXsJVrVMgMtVL6LCwKG2yd9VamAsfpCjS1hrJQWUT5
 s39E3sXOLk3hchX3palTT8vfsxs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 61a4a4834fca5da46d906202 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 29 Nov 2021 09:59:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B58D0C4360C; Mon, 29 Nov 2021 09:59:31 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6D966C43617;
 Mon, 29 Nov 2021 09:59:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 6D966C43617
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Subject: [PATCH v3 3/5] pinctrl: qcom: Move chip specific functions to right
 files
Date: Mon, 29 Nov 2021 15:28:50 +0530
Message-Id: <1638179932-3353-4-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1638179932-3353-1-git-send-email-srivasam@codeaurora.org>
References: <1638179932-3353-1-git-send-email-srivasam@codeaurora.org>
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
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

Update lpass lpi pin control driver to accommodate new lpass variant
SoC specific drivers.
Move sm8250 SoC specific functions to pinctrl-sm8250-lpass-lpi.c file
and common declarations to pinctrl-lpass-lpi.h header file.

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
---
 drivers/pinctrl/qcom/Makefile                   |   1 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c        | 251 +-----------------------
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h        | 139 +++++++++++++
 drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c | 125 ++++++++++++
 4 files changed, 271 insertions(+), 245 deletions(-)
 create mode 100644 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c

diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index 7a12e8c..74568cf 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -37,3 +37,4 @@ obj-$(CONFIG_PINCTRL_SM8150) += pinctrl-sm8150.o
 obj-$(CONFIG_PINCTRL_SM8250) += pinctrl-sm8250.o
 obj-$(CONFIG_PINCTRL_SM8350) += pinctrl-sm8350.o
 obj-$(CONFIG_PINCTRL_LPASS_LPI) += pinctrl-lpass-lpi.o
+obj-$(CONFIG_PINCTRL_LPASS_LPI) += pinctrl-sm8250-lpass-lpi.o
diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 2f19ab4..2641489 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -4,237 +4,16 @@
  * Copyright (c) 2020 Linaro Ltd.
  */
 
-#include <linux/bitops.h>
-#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/gpio/driver.h>
-#include <linux/io.h>
-#include <linux/module.h>
 #include <linux/of_device.h>
-#include <linux/of.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinmux.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-#include <linux/types.h>
 #include "../core.h"
 #include "../pinctrl-utils.h"
+#include "pinctrl-lpass-lpi.h"
 
-#define LPI_SLEW_RATE_CTL_REG		0xa000
-#define LPI_TLMM_REG_OFFSET		0x1000
-#define LPI_SLEW_RATE_MAX		0x03
-#define LPI_SLEW_BITS_SIZE		0x02
-#define LPI_SLEW_RATE_MASK		GENMASK(1, 0)
-#define LPI_GPIO_CFG_REG		0x00
-#define LPI_GPIO_PULL_MASK		GENMASK(1, 0)
-#define LPI_GPIO_FUNCTION_MASK		GENMASK(5, 2)
-#define LPI_GPIO_OUT_STRENGTH_MASK	GENMASK(8, 6)
-#define LPI_GPIO_OE_MASK		BIT(9)
-#define LPI_GPIO_VALUE_REG		0x04
-#define LPI_GPIO_VALUE_IN_MASK		BIT(0)
-#define LPI_GPIO_VALUE_OUT_MASK		BIT(1)
-
-#define LPI_GPIO_BIAS_DISABLE		0x0
-#define LPI_GPIO_PULL_DOWN		0x1
-#define LPI_GPIO_KEEPER			0x2
-#define LPI_GPIO_PULL_UP		0x3
-#define LPI_GPIO_DS_TO_VAL(v)		(v / 2 - 1)
-#define NO_SLEW				-1
-
-#define LPI_FUNCTION(fname)			                \
-	[LPI_MUX_##fname] = {		                \
-		.name = #fname,				\
-		.groups = fname##_groups,               \
-		.ngroups = ARRAY_SIZE(fname##_groups),	\
-	}
-
-#define LPI_PINGROUP(id, soff, f1, f2, f3, f4)		\
-	{						\
-		.name = "gpio" #id,			\
-		.pins = gpio##id##_pins,		\
-		.pin = id,				\
-		.slew_offset = soff,			\
-		.npins = ARRAY_SIZE(gpio##id##_pins),	\
-		.funcs = (int[]){			\
-			LPI_MUX_gpio,			\
-			LPI_MUX_##f1,			\
-			LPI_MUX_##f2,			\
-			LPI_MUX_##f3,			\
-			LPI_MUX_##f4,			\
-		},					\
-		.nfuncs = 5,				\
-	}
-
-struct lpi_pingroup {
-	const char *name;
-	const unsigned int *pins;
-	unsigned int npins;
-	unsigned int pin;
-	/* Bit offset in slew register for SoundWire pins only */
-	int slew_offset;
-	unsigned int *funcs;
-	unsigned int nfuncs;
-};
-
-struct lpi_function {
-	const char *name;
-	const char * const *groups;
-	unsigned int ngroups;
-};
-
-struct lpi_pinctrl_variant_data {
-	const struct pinctrl_pin_desc *pins;
-	int npins;
-	const struct lpi_pingroup *groups;
-	int ngroups;
-	const struct lpi_function *functions;
-	int nfunctions;
-};
-
-#define MAX_LPI_NUM_CLKS	2
-
-struct lpi_pinctrl {
-	struct device *dev;
-	struct pinctrl_dev *ctrl;
-	struct gpio_chip chip;
-	struct pinctrl_desc desc;
-	char __iomem *tlmm_base;
-	char __iomem *slew_base;
-	struct clk_bulk_data clks[MAX_LPI_NUM_CLKS];
-	struct mutex slew_access_lock;
-	const struct lpi_pinctrl_variant_data *data;
-};
-
-/* sm8250 variant specific data */
-static const struct pinctrl_pin_desc sm8250_lpi_pins[] = {
-	PINCTRL_PIN(0, "gpio0"),
-	PINCTRL_PIN(1, "gpio1"),
-	PINCTRL_PIN(2, "gpio2"),
-	PINCTRL_PIN(3, "gpio3"),
-	PINCTRL_PIN(4, "gpio4"),
-	PINCTRL_PIN(5, "gpio5"),
-	PINCTRL_PIN(6, "gpio6"),
-	PINCTRL_PIN(7, "gpio7"),
-	PINCTRL_PIN(8, "gpio8"),
-	PINCTRL_PIN(9, "gpio9"),
-	PINCTRL_PIN(10, "gpio10"),
-	PINCTRL_PIN(11, "gpio11"),
-	PINCTRL_PIN(12, "gpio12"),
-	PINCTRL_PIN(13, "gpio13"),
-};
-
-enum sm8250_lpi_functions {
-	LPI_MUX_dmic1_clk,
-	LPI_MUX_dmic1_data,
-	LPI_MUX_dmic2_clk,
-	LPI_MUX_dmic2_data,
-	LPI_MUX_dmic3_clk,
-	LPI_MUX_dmic3_data,
-	LPI_MUX_i2s1_clk,
-	LPI_MUX_i2s1_data,
-	LPI_MUX_i2s1_ws,
-	LPI_MUX_i2s2_clk,
-	LPI_MUX_i2s2_data,
-	LPI_MUX_i2s2_ws,
-	LPI_MUX_qua_mi2s_data,
-	LPI_MUX_qua_mi2s_sclk,
-	LPI_MUX_qua_mi2s_ws,
-	LPI_MUX_swr_rx_clk,
-	LPI_MUX_swr_rx_data,
-	LPI_MUX_swr_tx_clk,
-	LPI_MUX_swr_tx_data,
-	LPI_MUX_wsa_swr_clk,
-	LPI_MUX_wsa_swr_data,
-	LPI_MUX_gpio,
-	LPI_MUX__,
-};
-
-static const unsigned int gpio0_pins[] = { 0 };
-static const unsigned int gpio1_pins[] = { 1 };
-static const unsigned int gpio2_pins[] = { 2 };
-static const unsigned int gpio3_pins[] = { 3 };
-static const unsigned int gpio4_pins[] = { 4 };
-static const unsigned int gpio5_pins[] = { 5 };
-static const unsigned int gpio6_pins[] = { 6 };
-static const unsigned int gpio7_pins[] = { 7 };
-static const unsigned int gpio8_pins[] = { 8 };
-static const unsigned int gpio9_pins[] = { 9 };
-static const unsigned int gpio10_pins[] = { 10 };
-static const unsigned int gpio11_pins[] = { 11 };
-static const unsigned int gpio12_pins[] = { 12 };
-static const unsigned int gpio13_pins[] = { 13 };
-static const char * const swr_tx_clk_groups[] = { "gpio0" };
-static const char * const swr_tx_data_groups[] = { "gpio1", "gpio2", "gpio5" };
-static const char * const swr_rx_clk_groups[] = { "gpio3" };
-static const char * const swr_rx_data_groups[] = { "gpio4", "gpio5" };
-static const char * const dmic1_clk_groups[] = { "gpio6" };
-static const char * const dmic1_data_groups[] = { "gpio7" };
-static const char * const dmic2_clk_groups[] = { "gpio8" };
-static const char * const dmic2_data_groups[] = { "gpio9" };
-static const char * const i2s2_clk_groups[] = { "gpio10" };
-static const char * const i2s2_ws_groups[] = { "gpio11" };
-static const char * const dmic3_clk_groups[] = { "gpio12" };
-static const char * const dmic3_data_groups[] = { "gpio13" };
-static const char * const qua_mi2s_sclk_groups[] = { "gpio0" };
-static const char * const qua_mi2s_ws_groups[] = { "gpio1" };
-static const char * const qua_mi2s_data_groups[] = { "gpio2", "gpio3", "gpio4" };
-static const char * const i2s1_clk_groups[] = { "gpio6" };
-static const char * const i2s1_ws_groups[] = { "gpio7" };
-static const char * const i2s1_data_groups[] = { "gpio8", "gpio9" };
-static const char * const wsa_swr_clk_groups[] = { "gpio10" };
-static const char * const wsa_swr_data_groups[] = { "gpio11" };
-static const char * const i2s2_data_groups[] = { "gpio12", "gpio12" };
-
-static const struct lpi_pingroup sm8250_groups[] = {
-	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
-	LPI_PINGROUP(1, 2, swr_tx_data, qua_mi2s_ws, _, _),
-	LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
-	LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
-	LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
-	LPI_PINGROUP(5, 12, swr_tx_data, swr_rx_data, _, _),
-	LPI_PINGROUP(6, NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
-	LPI_PINGROUP(7, NO_SLEW, dmic1_data, i2s1_ws, _, _),
-	LPI_PINGROUP(8, NO_SLEW, dmic2_clk, i2s1_data, _, _),
-	LPI_PINGROUP(9, NO_SLEW, dmic2_data, i2s1_data, _, _),
-	LPI_PINGROUP(10, 16, i2s2_clk, wsa_swr_clk, _, _),
-	LPI_PINGROUP(11, 18, i2s2_ws, wsa_swr_data, _, _),
-	LPI_PINGROUP(12, NO_SLEW, dmic3_clk, i2s2_data, _, _),
-	LPI_PINGROUP(13, NO_SLEW, dmic3_data, i2s2_data, _, _),
-};
-
-static const struct lpi_function sm8250_functions[] = {
-	LPI_FUNCTION(dmic1_clk),
-	LPI_FUNCTION(dmic1_data),
-	LPI_FUNCTION(dmic2_clk),
-	LPI_FUNCTION(dmic2_data),
-	LPI_FUNCTION(dmic3_clk),
-	LPI_FUNCTION(dmic3_data),
-	LPI_FUNCTION(i2s1_clk),
-	LPI_FUNCTION(i2s1_data),
-	LPI_FUNCTION(i2s1_ws),
-	LPI_FUNCTION(i2s2_clk),
-	LPI_FUNCTION(i2s2_data),
-	LPI_FUNCTION(i2s2_ws),
-	LPI_FUNCTION(qua_mi2s_data),
-	LPI_FUNCTION(qua_mi2s_sclk),
-	LPI_FUNCTION(qua_mi2s_ws),
-	LPI_FUNCTION(swr_rx_clk),
-	LPI_FUNCTION(swr_rx_data),
-	LPI_FUNCTION(swr_tx_clk),
-	LPI_FUNCTION(swr_tx_data),
-	LPI_FUNCTION(wsa_swr_clk),
-	LPI_FUNCTION(wsa_swr_data),
-};
-
-static struct lpi_pinctrl_variant_data sm8250_lpi_data = {
-	.pins = sm8250_lpi_pins,
-	.npins = ARRAY_SIZE(sm8250_lpi_pins),
-	.groups = sm8250_groups,
-	.ngroups = ARRAY_SIZE(sm8250_groups),
-	.functions = sm8250_functions,
-	.nfunctions = ARRAY_SIZE(sm8250_functions),
-};
 
 static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
 			 unsigned int addr)
@@ -582,7 +361,7 @@ static const struct gpio_chip lpi_gpio_template = {
 	.dbg_show		= lpi_gpio_dbg_show,
 };
 
-static int lpi_pinctrl_probe(struct platform_device *pdev)
+int lpi_pinctrl_probe(struct platform_device *pdev)
 {
 	const struct lpi_pinctrl_variant_data *data;
 	struct device *dev = &pdev->dev;
@@ -661,8 +440,10 @@ static int lpi_pinctrl_probe(struct platform_device *pdev)
 
 	return ret;
 }
+EXPORT_SYMBOL(lpi_pinctrl_probe);
+
 
-static int lpi_pinctrl_remove(struct platform_device *pdev)
+int lpi_pinctrl_remove(struct platform_device *pdev)
 {
 	struct lpi_pinctrl *pctrl = platform_get_drvdata(pdev);
 
@@ -671,25 +452,5 @@ static int lpi_pinctrl_remove(struct platform_device *pdev)
 
 	return 0;
 }
+EXPORT_SYMBOL(lpi_pinctrl_remove);
 
-static const struct of_device_id lpi_pinctrl_of_match[] = {
-	{
-	       .compatible = "qcom,sm8250-lpass-lpi-pinctrl",
-	       .data = &sm8250_lpi_data,
-	},
-	{ }
-};
-MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
-
-static struct platform_driver lpi_pinctrl_driver = {
-	.driver = {
-		   .name = "qcom-lpass-lpi-pinctrl",
-		   .of_match_table = lpi_pinctrl_of_match,
-	},
-	.probe = lpi_pinctrl_probe,
-	.remove = lpi_pinctrl_remove,
-};
-
-module_platform_driver(lpi_pinctrl_driver);
-MODULE_DESCRIPTION("QTI LPI GPIO pin control driver");
-MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
new file mode 100644
index 0000000..b0afb40
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
@@ -0,0 +1,139 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2016-2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2020 Linaro Ltd.
+ */
+#ifndef __PINCTRL_LPASS_LPI_H__
+#define __PINCTRL_LPASS_LPI_H__
+
+#define LPI_SLEW_RATE_CTL_REG	0xa000
+#define LPI_TLMM_REG_OFFSET		0x1000
+#define LPI_SLEW_RATE_MAX		0x03
+#define LPI_SLEW_BITS_SIZE		0x02
+#define LPI_SLEW_RATE_MASK		GENMASK(1, 0)
+#define LPI_GPIO_CFG_REG		0x00
+#define LPI_GPIO_PULL_MASK		GENMASK(1, 0)
+#define LPI_GPIO_FUNCTION_MASK		GENMASK(5, 2)
+#define LPI_GPIO_OUT_STRENGTH_MASK	GENMASK(8, 6)
+#define LPI_GPIO_OE_MASK		BIT(9)
+#define LPI_GPIO_VALUE_REG		0x04
+#define LPI_GPIO_VALUE_IN_MASK		BIT(0)
+#define LPI_GPIO_VALUE_OUT_MASK		BIT(1)
+
+#define LPI_GPIO_BIAS_DISABLE		0x0
+#define LPI_GPIO_PULL_DOWN		0x1
+#define LPI_GPIO_KEEPER			0x2
+#define LPI_GPIO_PULL_UP		0x3
+#define LPI_GPIO_DS_TO_VAL(v)		(v / 2 - 1)
+#define NO_SLEW				-1
+
+#define LPI_FUNCTION(fname)			                \
+	[LPI_MUX_##fname] = {		                \
+		.name = #fname,				\
+		.groups = fname##_groups,               \
+		.ngroups = ARRAY_SIZE(fname##_groups),	\
+	}
+
+#define LPI_PINGROUP(id, soff, f1, f2, f3, f4)		\
+	{						\
+		.name = "gpio" #id,			\
+		.pins = gpio##id##_pins,		\
+		.pin = id,				\
+		.slew_offset = soff,			\
+		.npins = ARRAY_SIZE(gpio##id##_pins),	\
+		.funcs = (int[]){			\
+			LPI_MUX_gpio,			\
+			LPI_MUX_##f1,			\
+			LPI_MUX_##f2,			\
+			LPI_MUX_##f3,			\
+			LPI_MUX_##f4,			\
+		},					\
+		.nfuncs = 5,				\
+	}
+
+struct lpi_pingroup {
+	const char *name;
+	const unsigned int *pins;
+	unsigned int npins;
+	unsigned int pin;
+	/* Bit offset in slew register for SoundWire pins only */
+	int slew_offset;
+	unsigned int *funcs;
+	unsigned int nfuncs;
+};
+
+struct lpi_function {
+	const char *name;
+	const char * const *groups;
+	unsigned int ngroups;
+};
+
+struct lpi_pinctrl_variant_data {
+	const struct pinctrl_pin_desc *pins;
+	int npins;
+	const struct lpi_pingroup *groups;
+	int ngroups;
+	const struct lpi_function *functions;
+	int nfunctions;
+};
+
+#define MAX_LPI_NUM_CLKS	2
+
+struct lpi_pinctrl {
+	struct device *dev;
+	struct pinctrl_dev *ctrl;
+	struct gpio_chip chip;
+	struct pinctrl_desc desc;
+	char __iomem *tlmm_base;
+	char __iomem *slew_base;
+	struct clk_bulk_data clks[MAX_LPI_NUM_CLKS];
+	struct mutex slew_access_lock;
+	const struct lpi_pinctrl_variant_data *data;
+};
+
+enum lpass_lpi_functions {
+	LPI_MUX_dmic1_clk,
+	LPI_MUX_dmic1_data,
+	LPI_MUX_dmic2_clk,
+	LPI_MUX_dmic2_data,
+	LPI_MUX_dmic3_clk,
+	LPI_MUX_dmic3_data,
+	LPI_MUX_i2s1_clk,
+	LPI_MUX_i2s1_data,
+	LPI_MUX_i2s1_ws,
+	LPI_MUX_i2s2_clk,
+	LPI_MUX_i2s2_data,
+	LPI_MUX_i2s2_ws,
+	LPI_MUX_qua_mi2s_data,
+	LPI_MUX_qua_mi2s_sclk,
+	LPI_MUX_qua_mi2s_ws,
+	LPI_MUX_swr_rx_clk,
+	LPI_MUX_swr_rx_data,
+	LPI_MUX_swr_tx_clk,
+	LPI_MUX_swr_tx_data,
+	LPI_MUX_wsa_swr_clk,
+	LPI_MUX_wsa_swr_data,
+	LPI_MUX_gpio,
+	LPI_MUX__,
+};
+
+static const unsigned int gpio0_pins[] = { 0 };
+static const unsigned int gpio1_pins[] = { 1 };
+static const unsigned int gpio2_pins[] = { 2 };
+static const unsigned int gpio3_pins[] = { 3 };
+static const unsigned int gpio4_pins[] = { 4 };
+static const unsigned int gpio5_pins[] = { 5 };
+static const unsigned int gpio6_pins[] = { 6 };
+static const unsigned int gpio7_pins[] = { 7 };
+static const unsigned int gpio8_pins[] = { 8 };
+static const unsigned int gpio9_pins[] = { 9 };
+static const unsigned int gpio10_pins[] = { 10 };
+static const unsigned int gpio11_pins[] = { 11 };
+static const unsigned int gpio12_pins[] = { 12 };
+static const unsigned int gpio13_pins[] = { 13 };
+
+int lpi_pinctrl_probe(struct platform_device *pdev);
+int lpi_pinctrl_remove(struct platform_device *pdev);
+
+#endif /*__PINCTRL_LPASS_LPI_H__*/
+
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
new file mode 100644
index 0000000..3eba8b3
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2016-2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2020 Linaro Ltd.
+ */
+
+#include <linux/clk.h>
+#include <linux/gpio/driver.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "pinctrl-lpass-lpi.h"
+
+/* sm8250 variant specific data */
+static const struct pinctrl_pin_desc sm8250_lpi_pins[] = {
+	PINCTRL_PIN(0, "gpio0"),
+	PINCTRL_PIN(1, "gpio1"),
+	PINCTRL_PIN(2, "gpio2"),
+	PINCTRL_PIN(3, "gpio3"),
+	PINCTRL_PIN(4, "gpio4"),
+	PINCTRL_PIN(5, "gpio5"),
+	PINCTRL_PIN(6, "gpio6"),
+	PINCTRL_PIN(7, "gpio7"),
+	PINCTRL_PIN(8, "gpio8"),
+	PINCTRL_PIN(9, "gpio9"),
+	PINCTRL_PIN(10, "gpio10"),
+	PINCTRL_PIN(11, "gpio11"),
+	PINCTRL_PIN(12, "gpio12"),
+	PINCTRL_PIN(13, "gpio13"),
+};
+
+static const char * const swr_tx_clk_groups[] = { "gpio0" };
+static const char * const swr_tx_data_groups[] = { "gpio1", "gpio2", "gpio5" };
+static const char * const swr_rx_clk_groups[] = { "gpio3" };
+static const char * const swr_rx_data_groups[] = { "gpio4", "gpio5" };
+static const char * const dmic1_clk_groups[] = { "gpio6" };
+static const char * const dmic1_data_groups[] = { "gpio7" };
+static const char * const dmic2_clk_groups[] = { "gpio8" };
+static const char * const dmic2_data_groups[] = { "gpio9" };
+static const char * const i2s2_clk_groups[] = { "gpio10" };
+static const char * const i2s2_ws_groups[] = { "gpio11" };
+static const char * const dmic3_clk_groups[] = { "gpio12" };
+static const char * const dmic3_data_groups[] = { "gpio13" };
+static const char * const qua_mi2s_sclk_groups[] = { "gpio0" };
+static const char * const qua_mi2s_ws_groups[] = { "gpio1" };
+static const char * const qua_mi2s_data_groups[] = { "gpio2", "gpio3", "gpio4" };
+static const char * const i2s1_clk_groups[] = { "gpio6" };
+static const char * const i2s1_ws_groups[] = { "gpio7" };
+static const char * const i2s1_data_groups[] = { "gpio8", "gpio9" };
+static const char * const wsa_swr_clk_groups[] = { "gpio10" };
+static const char * const wsa_swr_data_groups[] = { "gpio11" };
+static const char * const i2s2_data_groups[] = { "gpio12", "gpio12" };
+
+static const struct lpi_pingroup sm8250_groups[] = {
+	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
+	LPI_PINGROUP(1, 2, swr_tx_data, qua_mi2s_ws, _, _),
+	LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
+	LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
+	LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
+	LPI_PINGROUP(5, 12, swr_tx_data, swr_rx_data, _, _),
+	LPI_PINGROUP(6, NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
+	LPI_PINGROUP(7, NO_SLEW, dmic1_data, i2s1_ws, _, _),
+	LPI_PINGROUP(8, NO_SLEW, dmic2_clk, i2s1_data, _, _),
+	LPI_PINGROUP(9, NO_SLEW, dmic2_data, i2s1_data, _, _),
+	LPI_PINGROUP(10, 16, i2s2_clk, wsa_swr_clk, _, _),
+	LPI_PINGROUP(11, 18, i2s2_ws, wsa_swr_data, _, _),
+	LPI_PINGROUP(12, NO_SLEW, dmic3_clk, i2s2_data, _, _),
+	LPI_PINGROUP(13, NO_SLEW, dmic3_data, i2s2_data, _, _),
+};
+
+static const struct lpi_function sm8250_functions[] = {
+	LPI_FUNCTION(dmic1_clk),
+	LPI_FUNCTION(dmic1_data),
+	LPI_FUNCTION(dmic2_clk),
+	LPI_FUNCTION(dmic2_data),
+	LPI_FUNCTION(dmic3_clk),
+	LPI_FUNCTION(dmic3_data),
+	LPI_FUNCTION(i2s1_clk),
+	LPI_FUNCTION(i2s1_data),
+	LPI_FUNCTION(i2s1_ws),
+	LPI_FUNCTION(i2s2_clk),
+	LPI_FUNCTION(i2s2_data),
+	LPI_FUNCTION(i2s2_ws),
+	LPI_FUNCTION(qua_mi2s_data),
+	LPI_FUNCTION(qua_mi2s_sclk),
+	LPI_FUNCTION(qua_mi2s_ws),
+	LPI_FUNCTION(swr_rx_clk),
+	LPI_FUNCTION(swr_rx_data),
+	LPI_FUNCTION(swr_tx_clk),
+	LPI_FUNCTION(swr_tx_data),
+	LPI_FUNCTION(wsa_swr_clk),
+	LPI_FUNCTION(wsa_swr_data),
+};
+
+static struct lpi_pinctrl_variant_data sm8250_lpi_data = {
+	.pins = sm8250_lpi_pins,
+	.npins = ARRAY_SIZE(sm8250_lpi_pins),
+	.groups = sm8250_groups,
+	.ngroups = ARRAY_SIZE(sm8250_groups),
+	.functions = sm8250_functions,
+	.nfunctions = ARRAY_SIZE(sm8250_functions),
+};
+
+static const struct of_device_id lpi_pinctrl_of_match[] = {
+	{
+	       .compatible = "qcom,sm8250-lpass-lpi-pinctrl",
+	       .data = &sm8250_lpi_data,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
+
+static struct platform_driver lpi_pinctrl_driver = {
+	.driver = {
+		   .name = "qcom-sm8250-lpass-lpi-pinctrl",
+		   .of_match_table = lpi_pinctrl_of_match,
+	},
+	.probe = lpi_pinctrl_probe,
+	.remove = lpi_pinctrl_remove,
+};
+
+module_platform_driver(lpi_pinctrl_driver);
+MODULE_DESCRIPTION("QTI LPI GPIO pin control driver");
+MODULE_LICENSE("GPL");
+
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

