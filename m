Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3039420825
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 11:21:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4055E168C;
	Mon,  4 Oct 2021 11:20:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4055E168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633339260;
	bh=GbaKkNYVYz/6bC3JgzxO7+9Qu+8zFlQkYmIM1EpjwnI=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RqzYozpU9siNg86qfPa8i8gPRYtWbLsaAhMIMgua4sGJgMQJ/eKpYvc/3qYxpIiQ5
	 neCDnooVJDSIzw8Bdb0Q3rHrz580ftqA8rCb0ftQWsHvzROLA2t0Q0YqVvX824I9mA
	 LEkAi7pq+iJfs2loxuwPzg1diyf7EHyQWBz3OXnA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93F12F80249;
	Mon,  4 Oct 2021 11:19:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BE16F8010B; Mon,  4 Oct 2021 11:19:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0C7DF8010B
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 11:19:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0C7DF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="RqRAeo9X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1633339175;
 x=1664875175;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=5+bFSm3Q3fR2XSX8YUd9kMZ+nSqqd3ueYsMHQuVQFko=;
 b=RqRAeo9XMGf2EXnjWndb3VnDzLfJsgeIgQf/2yOqZXiD0+sRl7Q4GepR
 xhFFZwanhLwTImHRVjdsEx88pZ6eO71nkbNtIoCqp2PfHYREa79WUD0oq
 m9CgJJfepTSO9E6K2KTyNZ6EZpLJ0tEdRP4dZ3PxOlD6A8cMqgHMEVrlU
 0OxXIItxNwihhpv5OyH1J/yLWPzcmfcY41F+AxsCGm/RGFW6XLwlZcGaA
 glUMI0IxjnoGq6Y4yfVfutZekpcjZhZg1NxgvN3uKZd9sEEh8vuSU3pc4
 r0ZOQ2XL5lm62YNbbF4LXknA3TCfQjIhBy7+4SMfQvNIHaKe9ly9Hx+HA A==;
Date: Mon, 4 Oct 2021 11:19:21 +0200
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: codec: tlv320adc3xxx: New codec driver
Message-ID: <alpine.DEB.2.21.2110041117540.14472@lnxricardw1.se.axis.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail04w.axis.com (10.20.40.10) To se-mail07w.axis.com
 (10.20.40.13)
Cc: alsa-devel <alsa-devel@alsa-project.org>
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


New codec driver for Texas Instruments TLV320ADC3001 and
TLV320ADC3101 audio ADCs.

Signed-off-by: Ricard Wanderlof <ricardw@axis.com>
---
 sound/soc/codecs/Kconfig         |    7 +
 sound/soc/codecs/Makefile        |    2 +
 sound/soc/codecs/tlv320adc3xxx.c | 1239 ++++++++++++++++++++++++++++++
 sound/soc/codecs/tlv320adc3xxx.h |  381 +++++++++
 4 files changed, 1629 insertions(+)
 create mode 100644 sound/soc/codecs/tlv320adc3xxx.c
 create mode 100644 sound/soc/codecs/tlv320adc3xxx.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index deda5ee02ebb..6385142826db 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -217,6 +217,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_TDA7419
 	imply SND_SOC_TFA9879
 	imply SND_SOC_TFA989X
+	imply SND_SOC_TLV320ADC3XXX
 	imply SND_SOC_TLV320ADCX140
 	imply SND_SOC_TLV320AIC23_I2C
 	imply SND_SOC_TLV320AIC23_SPI
@@ -1463,6 +1464,12 @@ config SND_SOC_TFA989X
 	  Note that the driver currently bypasses the built-in "CoolFlux DSP"
 	  and does not support (hardware) volume control.
 
+config SND_SOC_TLV320ADC3XXX
+	tristate "Texas Instruments TLV320ADC3001/3101 audio ADC"
+        help
+	 Enable support for Texas Instruments TLV320ADC3001 and TLV320ADC3101
+	 ADCs.
+
 config SND_SOC_TLV320AIC23
 	tristate
 
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 4cf939d0d3fb..227d597fd662 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -235,6 +235,7 @@ snd-soc-tda7419-objs := tda7419.o
 snd-soc-tas2770-objs := tas2770.o
 snd-soc-tfa9879-objs := tfa9879.o
 snd-soc-tfa989x-objs := tfa989x.o
+snd-soc-tlv320adc3xxx-objs := tlv320adc3xxx.o
 snd-soc-tlv320aic23-objs := tlv320aic23.o
 snd-soc-tlv320aic23-i2c-objs := tlv320aic23-i2c.o
 snd-soc-tlv320aic23-spi-objs := tlv320aic23-spi.o
@@ -566,6 +567,7 @@ obj-$(CONFIG_SND_SOC_TDA7419)	+= snd-soc-tda7419.o
 obj-$(CONFIG_SND_SOC_TAS2770) += snd-soc-tas2770.o
 obj-$(CONFIG_SND_SOC_TFA9879)	+= snd-soc-tfa9879.o
 obj-$(CONFIG_SND_SOC_TFA989X)	+= snd-soc-tfa989x.o
+obj-$(CONFIG_SND_SOC_TLV320ADC3XXX)	+= snd-soc-tlv320adc3xxx.o
 obj-$(CONFIG_SND_SOC_TLV320AIC23)	+= snd-soc-tlv320aic23.o
 obj-$(CONFIG_SND_SOC_TLV320AIC23_I2C)	+= snd-soc-tlv320aic23-i2c.o
 obj-$(CONFIG_SND_SOC_TLV320AIC23_SPI)	+= snd-soc-tlv320aic23-spi.o
diff --git a/sound/soc/codecs/tlv320adc3xxx.c b/sound/soc/codecs/tlv320adc3xxx.c
new file mode 100644
index 000000000000..894c07efaaf7
--- /dev/null
+++ b/sound/soc/codecs/tlv320adc3xxx.c
@@ -0,0 +1,1239 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Based on sound/soc/codecs/tlv320aic3x.c by  Vladimir Barinov
+ *
+ * History:
+ *
+ * Author:  "Shahina Shaik" < shahina.s@mistralsolutions.com >
+ * Copyright:   (C) 2010 Mistral Solutions Pvt Ltd.
+ *
+ * Author: Dongge wu <dgwu@ambarella.com>
+ *	2015/10/28 - [Dongge wu] Created file
+ * Copyright (C) 2014-2018, Ambarella, Inc.
+ *
+ * Author: Ricard Wanderlof <ricardw@axis.com>
+ * 2020/11/05: Fixing driver for Linux 4.14: more clocking modes, etc.
+ * 2021/09/03: Porting driver to Linux 5.4.
+ *	       Add simple card and DT settable PLL mode, GPIO pin control.
+ * Copyright (C) 2021 Axis Communications AB
+ *
+ */
+
+/***************************** INCLUDES ************************************/
+
+#include <dt-bindings/sound/tlv320adc3xxx.h>
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/io.h>
+#include <linux/init.h>
+#include <linux/delay.h>
+#include <linux/pm.h>
+#include <linux/i2c.h>
+#include <linux/platform_device.h>
+#include <linux/cdev.h>
+#include <linux/of_gpio.h>
+#include <linux/slab.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <sound/tlv.h>
+#include <sound/initval.h>
+
+#include "tlv320adc3xxx.h"
+
+/*
+ * ****************************************************************************
+ *  Macros
+ * ****************************************************************************
+ *
+ */
+
+#define PLL_MODE_TEXT(mode) (mode == ADC3XXX_PLL_ENABLE ? "PLL enable" : \
+			     (mode == ADC3XXX_PLL_BYPASS ? "PLL bypass" : \
+							   "PLL auto"))
+
+enum adc3xxx_type {
+	ADC3001 = 0,
+	ADC3101
+};
+
+/* codec private data */
+struct adc3xxx_priv {
+	struct device *dev;
+	enum adc3xxx_type type;
+	struct clk *mclk;
+	struct regmap *regmap;
+	unsigned int pll_mode;
+	unsigned int rst_pin;
+	unsigned int rst_active;
+	unsigned int sysclk;
+	unsigned int gpio1_cfg; /* GPIO1_CTRL value + 1 (0 => not set)  */
+	unsigned int gpio2_cfg; /* GPIO2_CTRL value + 1 (0 => not set)  */
+	int master;
+	u8 page_no;
+	int use_pll;
+};
+
+static int adc3xxx_set_bias_level(struct snd_soc_component *,
+				  enum snd_soc_bias_level);
+
+static const struct reg_default adc3xxx_defaults[] = {
+	/* Page 0 */
+	{ 0, 0x00 },    { 1, 0x00 },    { 2, 0x00 },    { 3, 0x00 },
+	{ 4, 0x00 },    { 5, 0x11 },    { 6, 0x04 },    { 7, 0x00 },
+	{ 8, 0x00 },    { 9, 0x00 },    { 10, 0x00 },   { 11, 0x00 },
+	{ 12, 0x00 },   { 13, 0x00 },   { 14, 0x00 },   { 15, 0x00 },
+	{ 16, 0x00 },   { 17, 0x00 },   { 18, 0x01 },   { 19, 0x01 },
+	{ 20, 0x80 },   { 21, 0x80 },   { 22, 0x04 },   { 23, 0x00 },
+	{ 24, 0x00 },   { 25, 0x00 },   { 26, 0x01 },   { 27, 0x00 },
+	{ 28, 0x00 },   { 29, 0x02 },   { 30, 0x01 },   { 31, 0x00 },
+	{ 32, 0x00 },   { 33, 0x10 },   { 34, 0x00 },   { 35, 0x00 },
+	{ 36, 0x00 },   { 37, 0x00 },   { 38, 0x02 },   { 39, 0x00 },
+	{ 40, 0x00 },   { 41, 0x00 },   { 42, 0x00 },   { 43, 0x00 },
+	{ 44, 0x00 },   { 45, 0x00 },   { 46, 0x00 },   { 47, 0x00 },
+	{ 48, 0x00 },   { 49, 0x00 },   { 50, 0x00 },   { 51, 0x00 },
+	{ 52, 0x00 },   { 53, 0x12 },   { 54, 0x00 },   { 55, 0x00 },
+	{ 56, 0x00 },   { 57, 0x00 },   { 58, 0x00 },   { 59, 0x44 },
+	{ 60, 0x00 },   { 61, 0x01 },   { 62, 0x00 },   { 63, 0x00 },
+	{ 64, 0x00 },   { 65, 0x00 },   { 66, 0x00 },   { 67, 0x00 },
+	{ 68, 0x00 },   { 69, 0x00 },   { 70, 0x00 },   { 71, 0x00 },
+	{ 72, 0x00 },   { 73, 0x00 },   { 74, 0x00 },   { 75, 0x00 },
+	{ 76, 0x00 },   { 77, 0x00 },   { 78, 0x00 },   { 79, 0x00 },
+	{ 80, 0x00 },   { 81, 0x00 },   { 82, 0x88 },   { 83, 0x00 },
+	{ 84, 0x00 },   { 85, 0x00 },   { 86, 0x00 },   { 87, 0x00 },
+	{ 88, 0x7F },   { 89, 0x00 },   { 90, 0x00 },   { 91, 0x00 },
+	{ 92, 0x00 },   { 93, 0x00 },   { 94, 0x00 },   { 95, 0x00 },
+	{ 96, 0x7F },   { 97, 0x00 },   { 98, 0x00 },   { 99, 0x00 },
+	{ 100, 0x00 },  { 101, 0x00 },  { 102, 0x00 },  { 103, 0x00 },
+	{ 104, 0x00 },  { 105, 0x00 },  { 106, 0x00 },  { 107, 0x00 },
+	{ 108, 0x00 },  { 109, 0x00 },  { 110, 0x00 },  { 111, 0x00 },
+	{ 112, 0x00 },  { 113, 0x00 },  { 114, 0x00 },  { 115, 0x00 },
+	{ 116, 0x00 },  { 117, 0x00 },  { 118, 0x00 },  { 119, 0x00 },
+	{ 120, 0x00 },  { 121, 0x00 },  { 122, 0x00 },  { 123, 0x00 },
+	{ 124, 0x00 },  { 125, 0x00 },  { 126, 0x00 },  { 127, 0x00 },
+
+	/* Page 1 */
+	{ 128, 0x00 },  { 129, 0x00 },  { 130, 0x00 },  { 131, 0x00 },
+	{ 132, 0x00 },  { 133, 0x00 },  { 134, 0x00 },  { 135, 0x00 },
+	{ 136, 0x00 },  { 137, 0x00 },  { 138, 0x00 },  { 139, 0x00 },
+	{ 140, 0x00 },  { 141, 0x00 },  { 142, 0x00 },  { 143, 0x00 },
+	{ 144, 0x00 },  { 145, 0x00 },  { 146, 0x00 },  { 147, 0x00 },
+	{ 148, 0x00 },  { 149, 0x00 },  { 150, 0x00 },  { 151, 0x00 },
+	{ 152, 0x00 },  { 153, 0x00 },  { 154, 0x00 },  { 155, 0x00 },
+	{ 156, 0x00 },  { 157, 0x00 },  { 158, 0x00 },  { 159, 0x00 },
+	{ 160, 0x00 },  { 161, 0x00 },  { 162, 0x00 },  { 163, 0x00 },
+	{ 164, 0x00 },  { 165, 0x00 },  { 166, 0x00 },  { 167, 0x00 },
+	{ 168, 0x00 },  { 169, 0x00 },  { 170, 0x00 },  { 171, 0x00 },
+	{ 172, 0x00 },  { 173, 0x00 },  { 174, 0x00 },  { 175, 0x00 },
+	{ 176, 0x00 },  { 177, 0x00 },  { 178, 0x00 },  { 179, 0x00 },
+	{ 180, 0xFF },  { 181, 0x00 },  { 182, 0x3F },  { 183, 0xFF },
+	{ 184, 0x00 },  { 185, 0x3F },  { 186, 0x00 },  { 187, 0x80 },
+	{ 188, 0x80 },  { 189, 0x00 },  { 190, 0x00 },  { 191, 0x00 },
+};
+
+static bool adc3xxx_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case PAGE_SELECT: /* required by regmap implementation */
+	case RESET:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_range_cfg adc3xxx_ranges[] = {
+	{
+		.range_min = 0,
+		.range_max = 2 * ADC3xxx_PAGE_SIZE,
+		.selector_reg = PAGE_SELECT,
+		.selector_mask = 0xff,
+		.selector_shift = 0,
+		.window_start = 0,
+		.window_len = ADC3xxx_PAGE_SIZE,
+	}
+};
+
+static const struct regmap_config adc3xxx_regmap = {
+	.reg_bits = 8,
+	.val_bits = 8,
+
+	.reg_defaults = adc3xxx_defaults,
+	.num_reg_defaults = ARRAY_SIZE(adc3xxx_defaults),
+
+	.volatile_reg = adc3xxx_volatile_reg,
+
+	.cache_type = REGCACHE_RBTREE,
+
+	.ranges = adc3xxx_ranges,
+	.num_ranges = ARRAY_SIZE(adc3xxx_ranges),
+	.max_register = 2 * ADC3xxx_PAGE_SIZE,
+};
+
+/*
+ * adc3xxx initialization data
+ * This structure initialization contains the initialization required for
+ * ADC3xxx.
+ * These registers values (reg_val) are written into the respective ADC3xxx
+ * register offset (reg_offset) to  initialize ADC3xxx.
+ * These values are used in adc3xxx_init() function only.
+ */
+struct adc3xxx_configs {
+	u8 reg_offset;
+	u8 reg_val;
+};
+
+/* The global Register Initialization sequence Array. During the Audio Driver
+ * Initialization, this array will be utilized to perform the default
+ * initialization of the audio Driver.
+ */
+static const struct adc3xxx_configs adc3xxx_reg_init[] = {
+	/* The default (out-of-reset) values in the x_PGA_SEL_x registers
+	 * disable the inputs by default, but also set the input attenuation
+	 * to -6 dB by default, so we leave the inputs disabled but set
+	 * the attenuation to a more natural 0 dB.
+	 */
+	{ LEFT_PGA_SEL_1, 0xaa },
+	{ LEFT_PGA_SEL_2, 0x2a },
+	{ RIGHT_PGA_SEL_1, 0xaa },
+	{ RIGHT_PGA_SEL_2, 0x2a },
+	/* mute Left PGA + default gain 0 dB (same as reset value) */
+	{ LEFT_APGA_CTRL, 0x80 },
+	/* mute Right PGA + default gain 0 dB (same as reset value) */
+	{ RIGHT_APGA_CTRL, 0x80 },
+	/* Disable AGC (same as reset value) */
+	{ LEFT_CHN_AGC_1, 0x00 },
+	{ RIGHT_CHN_AGC_1, 0x00 },
+	/* Maximum AGC gain 40 dB */
+	/* (Oddly enough, the data sheet says the register field default
+	 * value for the maximum gain is 0b111111 = 127 (verified empirically)
+	 * which is specified as 'Reserved. Do not use.' in the accompanying
+	 * table).
+	 */
+	{ LEFT_CHN_AGC_3, 0x50 },
+	{ RIGHT_CHN_AGC_3, 0x50 },
+	/* Leave MICBIAS1 and MICBIAS2 powered down (same as reset value) */
+	{ MICBIAS_CTRL, 0x00 },
+	/* Fine Gain 0dB, Left/Right ADC Unmute */
+	{ ADC_FGA, 0x00 },
+};
+
+/* Additional initialization for TLV320ADC3101
+ */
+static const struct adc3xxx_configs adc3101_reg_init[] = {
+	/* Use Primary BCLK and WCLK (same as reset value) */
+	{ INTERFACE_CTRL_4, 0x00 },
+	/* DMCLK output = ADC_MOD_CLK */
+	{ GPIO2_CTRL, 0x28 },
+	/* DMDIN is in input (used for Dig_Mic_In) mode */
+	{ GPIO1_CTRL, 0x04 },
+};
+
+/*
+ * PLL and Clock settings.
+ * If p member is 0, PLL is not used.
+ * The order of the entries in this table have the PLL entries before
+ * the non-PLL entries, so that the PLL modes are preferred unless
+ * the PLL mode setting says otherwise.
+ */
+static const struct adc3xxx_rate_divs adc3xxx_divs[] = {
+	/* mclk, rate, p, r, j, d, nadc, madc, aosr */
+	/* 8k rate */
+	{12000000, 8000, 1, 1, 7, 1680, 42, 2, 128},
+	{12288000, 8000, 1, 1, 7, 0000, 42, 2, 128},
+	/* 11.025k rate */
+	{12000000, 11025, 1, 1, 6, 8208, 29, 2, 128},
+	/* 16k rate */
+	{12000000, 16000, 1, 1, 7, 1680, 21, 2, 128},
+	{12288000, 16000, 1, 1, 7, 0000, 21, 2, 128},
+	/* 22.05k rate */
+	{12000000, 22050, 1, 1, 7, 560, 15, 2, 128},
+	/* 32k rate */
+	{12000000, 32000, 1, 1, 8, 1920, 12, 2, 128},
+	{12288000, 32000, 1, 1, 8, 0000, 12, 2, 128},
+	/* 44.1k rate */
+	{12000000, 44100, 1, 1, 7, 5264, 8, 2, 128},
+	/* 48k rate */
+	{12000000, 48000, 1, 1, 7, 1680, 7, 2, 128},
+	{12288000, 48000, 1, 1, 7, 0000, 7, 2, 128},
+	{24576000, 48000, 1, 1, 3, 5000, 7, 2, 128}, /* With PLL */
+	{24576000, 48000, 0, 0, 0, 0000, 2, 2, 128}, /* Without PLL */
+	/* 88.2k rate */
+	{12000000, 88200, 1, 1, 7, 5264, 4, 4, 64},
+	/* 96k rate */
+	{12000000, 96000, 1, 1, 8, 1920, 4, 4, 64},
+};
+
+/*
+ *----------------------------------------------------------------------------
+ * Function : adc3xxx_get_divs
+ * Purpose  : This function is to get required divisor from the "adc3xxx_divs"
+ *            table.
+ *
+ *----------------------------------------------------------------------------
+ */
+static int adc3xxx_get_divs(struct device *dev, int mclk, int rate, int pll_mode)
+{
+	int i;
+
+	dev_info(dev, "mclk = %d, rate = %d, clock mode %u\n",
+		 mclk, rate, pll_mode);
+	for (i = 0; i < ARRAY_SIZE(adc3xxx_divs); i++) {
+		const struct adc3xxx_rate_divs *mode = &adc3xxx_divs[i];
+
+		/* Skip this entry if it doesn't fulfill the intended clock
+		 * mode requirement. We consider anything besides the two
+		 * modes below to be the same as ADC3XXX_PLL_AUTO.
+		 */
+		if ((pll_mode == ADC3XXX_PLL_BYPASS && mode->pll_p) ||
+		    (pll_mode == ADC3XXX_PLL_ENABLE && !mode->pll_p))
+			continue;
+
+		if (mode->rate == rate && mode->mclk == mclk)
+			return i;
+	}
+
+	dev_info(dev, "Master clock rate %d and sample rate %d is not supported\n",
+		 mclk, rate);
+	return -EINVAL;
+}
+
+static const char * const micbias_voltage[] = { "off", "2V", "2.5V", "AVDD" };
+static const char * const linein_attenuation[] = { "0db", "-6dB" };
+static const char * const adc_softstepping[] = { "1 step", "2 step", "off" };
+static const char * const multiplier[] = { "1", "2", "4", "8", "16", "32", "64", "128" };
+static const char * const dither_dc_offset[] = {
+	"0mV", "15mV", "30mV", "45mV", "60mV", "75mV", "90mV", "105mV",
+	 "reserved", "-15mV", "-30mV", "-45mV", "-60mV", "-75mV", "-90mV", "-105mV"
+};
+
+static const DECLARE_TLV_DB_SCALE(pga_tlv, 0, 50, 0);
+static const DECLARE_TLV_DB_SCALE(adc_tlv, -1200, 50, 0);
+static const DECLARE_TLV_DB_SCALE(adc_fine_tlv, -40, 10, 0);
+/* agc_target_tlv: 8 values: -5.5, -8, -10, -12, -14, -17, -20, -24 dB */
+/* It would be nice to declare these in the order above, but empirically
+ * TLV_DB_SCALE_ITEM doesn't take lightly to the increment (second) parameter
+ * being negative, despite there being examples to the contrary in other
+ * drivers. So declare these in the order from lowest to highest, and
+ * set the invert flag in the SOC_DOUBLE_R_TLV declaration instead.
+ */
+static const DECLARE_TLV_DB_RANGE(agc_target_tlv,
+	0, 0, TLV_DB_SCALE_ITEM(-2400, 0, 0),
+	1, 3, TLV_DB_SCALE_ITEM(-2000, 300, 0),
+	4, 6, TLV_DB_SCALE_ITEM(-1200, 200, 0),
+	7, 7, TLV_DB_SCALE_ITEM(-550, 0, 0));
+/* Since the 'disabled' value (mute) is at the highest value in the dB
+ * range (i.e. just before -32 dB) rather than the lowest, we need to resort
+ * to using a TLV_DB_RANGE in order to get the mute value in the right place.
+ */
+static const DECLARE_TLV_DB_RANGE(agc_thresh_tlv,
+	0, 30, TLV_DB_SCALE_ITEM(-9000, 200, 0),
+	31, 31, TLV_DB_SCALE_ITEM(0, 0, 1)); /* disabled = mute */
+/* agc_hysteresis: 4 values: 1, 2, 4 dB, disabled (= mute) */
+static const DECLARE_TLV_DB_RANGE(agc_hysteresis_tlv,
+	0, 1, TLV_DB_SCALE_ITEM(100, 100, 0),
+	2, 2, TLV_DB_SCALE_ITEM(400, 0, 0),
+	3, 3, TLV_DB_SCALE_ITEM(0, 0, 1)); /* disabled = mute */
+static const DECLARE_TLV_DB_SCALE(agc_max_tlv, 0, 50, 0);
+
+#define MICBIAS1_ENUM			0
+#define MICBIAS2_ENUM			1
+#define ADCSOFTSTEP_ENUM		2
+#define ATT_LEFT_IN_1L_ENUM		3
+#define ATT_LEFT_IN_2L_ENUM		4
+#define ATT_LEFT_IN_3L_ENUM		5
+#define ATT_LEFT_IN_1R_ENUM		6
+#define ATT_LEFT_DIF_2L_3L_ENUM		7
+#define ATT_LEFT_DIF_1L_1R_ENUM		8
+#define ATT_LEFT_DIF_2R_3R_ENUM		9
+#define ATT_RIGHT_IN_1R_ENUM		10
+#define ATT_RIGHT_IN_2R_ENUM		11
+#define ATT_RIGHT_IN_3R_ENUM		12
+#define ATT_RIGHT_IN_1L_ENUM		13
+#define ATT_RIGHT_DIF_2R_3R_ENUM	14
+#define ATT_RIGHT_DIF_1L_1R_ENUM	15
+#define ATT_RIGHT_DIF_2L_3L_ENUM	16
+#define AGCATKMULTL_ENUM		17
+#define AGCATKMULTR_ENUM		18
+#define AGCDECMULTL_ENUM		19
+#define AGCDECMULTR_ENUM		20
+#define DITHER_DC_OFFSET_ENUM		21
+
+/* Creates an array of the Single Ended Widgets*/
+static const struct soc_enum adc3xxx_enum[] = {
+	SOC_ENUM_SINGLE(MICBIAS_CTRL, 5, 4, micbias_voltage),
+	SOC_ENUM_SINGLE(MICBIAS_CTRL, 3, 4, micbias_voltage),
+	SOC_ENUM_SINGLE(ADC_DIGITAL, 0, 3, adc_softstepping),
+	SOC_ENUM_SINGLE(LEFT_PGA_SEL_1, 0, 2, linein_attenuation),
+	SOC_ENUM_SINGLE(LEFT_PGA_SEL_1, 2, 2, linein_attenuation),
+	SOC_ENUM_SINGLE(LEFT_PGA_SEL_1, 4, 2, linein_attenuation),
+	SOC_ENUM_SINGLE(LEFT_PGA_SEL_2, 0, 2, linein_attenuation),
+	SOC_ENUM_SINGLE(LEFT_PGA_SEL_1, 6, 2, linein_attenuation),
+	SOC_ENUM_SINGLE(LEFT_PGA_SEL_2, 4, 2, linein_attenuation),
+	SOC_ENUM_SINGLE(LEFT_PGA_SEL_2, 2, 2, linein_attenuation),
+	SOC_ENUM_SINGLE(RIGHT_PGA_SEL_1, 0, 2, linein_attenuation),
+	SOC_ENUM_SINGLE(RIGHT_PGA_SEL_1, 2, 2, linein_attenuation),
+	SOC_ENUM_SINGLE(RIGHT_PGA_SEL_1, 4, 2, linein_attenuation),
+	SOC_ENUM_SINGLE(RIGHT_PGA_SEL_2, 0, 2, linein_attenuation),
+	SOC_ENUM_SINGLE(RIGHT_PGA_SEL_1, 6, 2, linein_attenuation),
+	SOC_ENUM_SINGLE(RIGHT_PGA_SEL_2, 4, 2, linein_attenuation),
+	SOC_ENUM_SINGLE(RIGHT_PGA_SEL_2, 2, 2, linein_attenuation),
+	SOC_ENUM_SINGLE(LEFT_CHN_AGC_4, 0, 8, multiplier),
+	SOC_ENUM_SINGLE(RIGHT_CHN_AGC_4, 0, 8, multiplier),
+	SOC_ENUM_SINGLE(LEFT_CHN_AGC_5, 0, 8, multiplier),
+	SOC_ENUM_SINGLE(RIGHT_CHN_AGC_5, 0, 8, multiplier),
+	SOC_ENUM_DOUBLE(DITHER_CTRL, 4, 0, 16, dither_dc_offset),
+};
+
+/* Various Controls For adc3xxx */
+static const struct snd_kcontrol_new adc3xxx_snd_controls[] = {
+	SOC_DOUBLE_R_TLV("PGA Gain Volume", LEFT_APGA_CTRL, RIGHT_APGA_CTRL,
+			 0, 80, 0, pga_tlv),
+	SOC_DOUBLE_R("AGC Enable", LEFT_CHN_AGC_1,
+		     RIGHT_CHN_AGC_1, 7, 1, 0),
+	SOC_DOUBLE_R_TLV("AGC Target Level Volume", LEFT_CHN_AGC_1,
+		     RIGHT_CHN_AGC_2, 4, 0x07, 1, agc_target_tlv),
+	SOC_DOUBLE_R_TLV("AGC Noise Threshold Volume", LEFT_CHN_AGC_2,
+		     RIGHT_CHN_AGC_2, 1, 0x1f, 1, agc_thresh_tlv),
+	SOC_DOUBLE_R_TLV("AGC Hysteresis Volume", LEFT_CHN_AGC_2,
+		     RIGHT_CHN_AGC_2, 6, 3, 0, agc_hysteresis_tlv),
+	SOC_DOUBLE_R("AGC Clip Stepping Enable", LEFT_CHN_AGC_2,
+		     RIGHT_CHN_AGC_2, 0, 1, 0),
+	SOC_DOUBLE_R_TLV("AGC Maximum Gain Volume", LEFT_CHN_AGC_3,
+		     RIGHT_CHN_AGC_3, 0, 0x50, 0, agc_max_tlv),
+	SOC_DOUBLE_R("AGC Attack Time", LEFT_CHN_AGC_4,
+		     RIGHT_CHN_AGC_4, 3, 0x1F, 0),
+	/* Would like to have the multipliers as LR pairs, but there is
+	 * no SOC_ENUM_foo which accepts two values in separate registers.
+	 */
+	SOC_ENUM("AGC Left Attack Time Multiplier",
+		 adc3xxx_enum[AGCATKMULTL_ENUM]),
+	SOC_ENUM("AGC Right Attack Time Multiplier",
+		 adc3xxx_enum[AGCATKMULTR_ENUM]),
+	SOC_DOUBLE_R("AGC Decay Time", LEFT_CHN_AGC_5,
+		     RIGHT_CHN_AGC_5, 3, 0x1F, 0),
+	SOC_ENUM("AGC Left Decay Time Multiplier",
+		 adc3xxx_enum[AGCDECMULTL_ENUM]),
+	SOC_ENUM("AGC Right Decay Time Multiplier",
+		 adc3xxx_enum[AGCDECMULTR_ENUM]),
+	SOC_DOUBLE_R("AGC Noise Debounce", LEFT_CHN_AGC_6,
+		     RIGHT_CHN_AGC_6, 0, 0x1F, 0),
+	SOC_DOUBLE_R("AGC Signal Debounce", LEFT_CHN_AGC_7,
+		     RIGHT_CHN_AGC_7, 0, 0x0F, 0),
+	/* Read only register */
+	SOC_DOUBLE_R_S_TLV("AGC Applied Gain Volume", LEFT_AGC_GAIN,
+			   RIGHT_AGC_GAIN, 0, -24, 40, 6, 0, adc_tlv),
+	/* Mic Bias voltage */
+	SOC_ENUM("Mic Bias 1 Voltage", adc3xxx_enum[MICBIAS1_ENUM]),
+	SOC_ENUM("Mic Bias 2 Voltage", adc3xxx_enum[MICBIAS2_ENUM]),
+	/* ADC soft stepping */
+	SOC_ENUM("ADC soft stepping", adc3xxx_enum[ADCSOFTSTEP_ENUM]),
+	/* Left/Right Input attenuation */
+	SOC_ENUM("Left IN_1L input attenuation",
+		 adc3xxx_enum[ATT_LEFT_IN_1L_ENUM]),
+	SOC_ENUM("Left IN_2L input attenuation",
+		 adc3xxx_enum[ATT_LEFT_IN_1L_ENUM]),
+	SOC_ENUM("Left IN_3L input attenuation",
+		 adc3xxx_enum[ATT_LEFT_IN_1L_ENUM]),
+	SOC_ENUM("Left IN_1R input attenuation",
+		 adc3xxx_enum[ATT_LEFT_IN_1R_ENUM]),
+	SOC_ENUM("Left DIF_2L_3L input attenuation",
+		 adc3xxx_enum[ATT_LEFT_DIF_2L_3L_ENUM]),
+	SOC_ENUM("Left DIF_1L_1R input attenuation",
+		 adc3xxx_enum[ATT_LEFT_DIF_1L_1R_ENUM]),
+	SOC_ENUM("Left DIF_2R_3R input attenuation",
+		 adc3xxx_enum[ATT_LEFT_DIF_2R_3R_ENUM]),
+	SOC_ENUM("Right IN_1R input attenuation",
+		 adc3xxx_enum[ATT_RIGHT_IN_1R_ENUM]),
+	SOC_ENUM("Right IN_2R input attenuation",
+		 adc3xxx_enum[ATT_RIGHT_IN_2R_ENUM]),
+	SOC_ENUM("Right IN_3R input attenuation",
+		 adc3xxx_enum[ATT_RIGHT_IN_3R_ENUM]),
+	SOC_ENUM("Right IN_1L input attenuation",
+		 adc3xxx_enum[ATT_RIGHT_IN_1L_ENUM]),
+	SOC_ENUM("Right DIF_2R_3R input attenuation",
+		 adc3xxx_enum[ATT_RIGHT_DIF_2R_3R_ENUM]),
+	SOC_ENUM("Right DIF_1L_1R input attenuation",
+		 adc3xxx_enum[ATT_RIGHT_DIF_1L_1R_ENUM]),
+	SOC_ENUM("Right DIF_2L_3L input attenuation",
+		 adc3xxx_enum[ATT_RIGHT_DIF_2L_3L_ENUM]),
+	SOC_DOUBLE_R_S_TLV("ADC Volume Control Volume", LADC_VOL, RADC_VOL,
+			   0, -24, 40, 6, 0, adc_tlv),
+	/* Empirically, the following doesn't work the way it's supposed
+	 * to. Values 0, -0.1, -0.2 and -0.3 dB result in the same level, and
+	 * -0.4 dB drops about 0.12 dB on a specific chip.
+	 */
+	SOC_DOUBLE_TLV("ADC Fine Volume Control Volume", ADC_FGA, 4, 0, 4, 1,
+		       adc_fine_tlv),
+	SOC_SINGLE("Left ADC unselected CM bias", LEFT_PGA_SEL_2, 6, 1, 0),
+	SOC_SINGLE("Right ADC unselected CM bias", RIGHT_PGA_SEL_2, 6, 1, 0),
+	SOC_ENUM("Dither Control DC Offset", adc3xxx_enum[DITHER_DC_OFFSET_ENUM]),
+};
+
+/* Left input selection, Single Ended inputs and Differential inputs */
+static const struct snd_kcontrol_new left_input_mixer_controls[] = {
+	SOC_DAPM_SINGLE("IN_1L switch", LEFT_PGA_SEL_1, 1, 0x1, 1),
+	SOC_DAPM_SINGLE("IN_2L switch", LEFT_PGA_SEL_1, 3, 0x1, 1),
+	SOC_DAPM_SINGLE("IN_3L switch", LEFT_PGA_SEL_1, 5, 0x1, 1),
+	SOC_DAPM_SINGLE("DIF_2L_3L switch", LEFT_PGA_SEL_1, 7, 0x1, 1),
+	SOC_DAPM_SINGLE("DIF_1L_1R switch", LEFT_PGA_SEL_2, 5, 0x1, 1),
+	SOC_DAPM_SINGLE("DIF_2R_3R switch", LEFT_PGA_SEL_2, 3, 0x1, 1),
+	SOC_DAPM_SINGLE("IN_1R switch", LEFT_PGA_SEL_2, 1, 0x1, 1),
+};
+
+/* Right input selection, Single Ended inputs and Differential inputs */
+static const struct snd_kcontrol_new right_input_mixer_controls[] = {
+	SOC_DAPM_SINGLE("IN_1R switch", RIGHT_PGA_SEL_1, 1, 0x1, 1),
+	SOC_DAPM_SINGLE("IN_2R switch", RIGHT_PGA_SEL_1, 3, 0x1, 1),
+	SOC_DAPM_SINGLE("IN_3R switch", RIGHT_PGA_SEL_1, 5, 0x1, 1),
+	SOC_DAPM_SINGLE("DIF_2R_3R switch", RIGHT_PGA_SEL_1, 7, 0x1, 1),
+	SOC_DAPM_SINGLE("DIF_1L_1R switch", RIGHT_PGA_SEL_2, 5, 0x1, 1),
+	SOC_DAPM_SINGLE("DIF_2L_3L switch", RIGHT_PGA_SEL_2, 3, 0x1, 1),
+	SOC_DAPM_SINGLE("IN_1L switch", RIGHT_PGA_SEL_2, 1, 0x1, 1),
+};
+
+/* Left Digital Mic input for left ADC */
+static const struct snd_kcontrol_new left_input_dmic_controls[] = {
+	SOC_DAPM_SINGLE("Left ADC switch", ADC_DIGITAL, 3, 0x1, 0),
+};
+
+/* Right Digital Mic input for Right ADC */
+static const struct snd_kcontrol_new right_input_dmic_controls[] = {
+	SOC_DAPM_SINGLE("Right ADC switch", ADC_DIGITAL, 2, 0x1, 0),
+};
+
+/* adc3xxx Widget structure */
+static const struct snd_soc_dapm_widget adc3xxx_dapm_widgets[] = {
+
+	/* Left Input Selection */
+	SND_SOC_DAPM_MIXER("Left Input Selection", SND_SOC_NOPM, 0, 0,
+			   &left_input_mixer_controls[0],
+			   ARRAY_SIZE(left_input_mixer_controls)),
+	/* Right Input Selection */
+	SND_SOC_DAPM_MIXER("Right Input Selection", SND_SOC_NOPM, 0, 0,
+			   &right_input_mixer_controls[0],
+			   ARRAY_SIZE(right_input_mixer_controls)),
+	/* PGA selection */
+	SND_SOC_DAPM_PGA("Left PGA", LEFT_APGA_CTRL, 7, 1, NULL, 0),
+	SND_SOC_DAPM_PGA("Right PGA", RIGHT_APGA_CTRL, 7, 1, NULL, 0),
+
+	/* Digital Microphone Input Control for Left/Right ADC */
+	SND_SOC_DAPM_MIXER("Left DMic Input", SND_SOC_NOPM, 0, 0,
+			&left_input_dmic_controls[0],
+			ARRAY_SIZE(left_input_dmic_controls)),
+	SND_SOC_DAPM_MIXER("Right DMic Input", SND_SOC_NOPM, 0, 0,
+			&right_input_dmic_controls[0],
+			ARRAY_SIZE(right_input_dmic_controls)),
+
+	/* Left/Right ADC */
+	SND_SOC_DAPM_ADC("Left ADC", "Left Capture", ADC_DIGITAL, 7, 0),
+	SND_SOC_DAPM_ADC("Right ADC", "Right Capture", ADC_DIGITAL, 6, 0),
+
+	/* Inputs */
+	SND_SOC_DAPM_INPUT("IN_1L"),
+	SND_SOC_DAPM_INPUT("IN_1R"),
+	SND_SOC_DAPM_INPUT("IN_2L"),
+	SND_SOC_DAPM_INPUT("IN_2R"),
+	SND_SOC_DAPM_INPUT("IN_3L"),
+	SND_SOC_DAPM_INPUT("IN_3R"),
+	SND_SOC_DAPM_INPUT("DIFL_1L_1R"),
+	SND_SOC_DAPM_INPUT("DIFL_2L_3L"),
+	SND_SOC_DAPM_INPUT("DIFL_2R_3R"),
+	SND_SOC_DAPM_INPUT("DIFR_1L_1R"),
+	SND_SOC_DAPM_INPUT("DIFR_2L_3L"),
+	SND_SOC_DAPM_INPUT("DIFR_2R_3R"),
+	SND_SOC_DAPM_INPUT("DMic_L"),
+	SND_SOC_DAPM_INPUT("DMic_R"),
+};
+
+/* DAPM Routing related array declaration */
+static const struct snd_soc_dapm_route intercon[] = {
+/* Left input selection from switches */
+	{"Left Input Selection", "IN_1L switch", "IN_1L"},
+	{"Left Input Selection", "IN_2L switch", "IN_2L"},
+	{"Left Input Selection", "IN_3L switch", "IN_3L"},
+	{"Left Input Selection", "DIF_2L_3L switch", "DIFL_2L_3L"},
+	{"Left Input Selection", "DIF_1L_1R switch", "DIFL_1L_1R"},
+	{"Left Input Selection", "DIF_2R_3R switch", "DIFL_2R_3R"},
+	{"Left Input Selection", "IN_1R switch", "IN_1R"},
+
+/* Left input selection to left PGA */
+	{"Left PGA", NULL, "Left Input Selection"},
+
+/* Left PGA to left ADC */
+	{"Left ADC", NULL, "Left PGA"},
+
+/* Right input selection from switches */
+	{"Right Input Selection", "IN_1R switch", "IN_1R"},
+	{"Right Input Selection", "IN_2R switch", "IN_2R"},
+	{"Right Input Selection", "IN_3R switch", "IN_3R"},
+	{"Right Input Selection", "DIF_2R_3R switch", "DIFR_2R_3R"},
+	{"Right Input Selection", "DIF_1L_1R switch", "DIFR_1L_1R"},
+	{"Right Input Selection", "DIF_2L_3L switch", "DIFR_2L_3L"},
+	{"Right Input Selection", "IN_1L switch", "IN_1L"},
+
+/* Right input selection to right PGA */
+	{"Right PGA", NULL, "Right Input Selection"},
+
+/* Right PGA to right ADC */
+	{"Right ADC", NULL, "Right PGA"},
+
+/* Left DMic Input selection from switch */
+	{"Left DMic Input", "Left ADC switch", "DMic_L"},
+
+/* Left DMic to left ADC */
+	{"Left ADC", NULL, "Left DMic Input"},
+
+/* Right DMic Input selection from switch */
+	{"Right DMic Input", "Right ADC switch", "DMic_R"},
+
+/* Right DMic to right ADC */
+	{"Right ADC", NULL, "Right DMic Input"},
+};
+
+/* GPIO control. These are only used when the corresponding GPIO pin is
+ * configured accordingly.
+ */
+static const struct snd_kcontrol_new adc3xxx_gpio1_out_control[] = {
+	SOC_SINGLE("GPIO1 Output", GPIO1_CTRL, GPIO_CTRL_OUTPUT_CTRL_SHIFT, 1, 0)
+};
+
+static const struct snd_kcontrol_new adc3xxx_gpio2_out_control[] = {
+	SOC_SINGLE("GPIO2 Output", GPIO2_CTRL, GPIO_CTRL_OUTPUT_CTRL_SHIFT, 1, 0)
+};
+
+/*
+ *----------------------------------------------------------------------------
+ * Function : adc3xxx_parse_gpio_mode
+ * Purpose  : Parse a gpio mode property as found in devicetree, and write
+ *	      the resulting gpio mode to cfg, if available.
+ *----------------------------------------------------------------------------
+ */
+static int adc3xxx_parse_gpio_mode(struct adc3xxx_priv *adc3xxx,
+				   const char *propname, unsigned int *cfg)
+{
+	struct device *dev = adc3xxx->dev;
+	struct device_node *np = dev->of_node;
+	unsigned int val;
+
+	if (!of_property_read_u32(np, propname, &val)) {
+		if (val & ~15 || val == 7 || val >= 11) {
+			dev_err(dev, "Invalid property value for '%s'\n", propname);
+			return -EINVAL;
+		}
+		if (val == ADC3XXX_GPIO_GPI)
+			dev_warn(dev, "GPIO Input read not yet implemented\n");
+		*cfg = val + 1; /* 0 => not set up, all others shifted +1 */
+	}
+	return 0;
+}
+
+/*
+ *----------------------------------------------------------------------------
+ * Function : adc3xxx_parse_pll_mode
+ * Purpose  : Parse the clock-mode property as received from devicetree
+ *	      or via set_sysclk callback in the clk_id parameter.
+ *----------------------------------------------------------------------------
+ */
+static int adc3xxx_parse_pll_mode(uint32_t val, unsigned int *pll_mode)
+{
+	if (val == ADC3XXX_PLL_ENABLE || val == ADC3XXX_PLL_BYPASS ||
+	    val == ADC3XXX_PLL_AUTO) {
+		*pll_mode = val;
+		return 0;
+	} else if (val == ADC3XXX_PLL_DONT_SET)
+		return 0;
+
+	return -EINVAL;
+}
+
+/*
+ *----------------------------------------------------------------------------
+ * Function : adc3xxx_setup_pll
+ * Purpose  : This function is to set up the adc3xxx PLL.
+ *
+ *----------------------------------------------------------------------------
+ */
+static void adc3xxx_setup_pll(struct snd_soc_component *component,
+			      int div_entry)
+{
+	int i = div_entry;
+
+	/* P & R values */
+	snd_soc_component_write(component, PLL_PROG_PR,
+				(adc3xxx_divs[i].pll_p << PLLP_SHIFT) |
+				(adc3xxx_divs[i].pll_r << PLLR_SHIFT));
+	/* J value */
+	snd_soc_component_write(component, PLL_PROG_J,
+				adc3xxx_divs[i].pll_j & PLLJ_MASK);
+	/* D value */
+	snd_soc_component_write(component, PLL_PROG_D_LSB,
+				adc3xxx_divs[i].pll_d & PLLD_LSB_MASK);
+	snd_soc_component_write(component, PLL_PROG_D_MSB,
+				(adc3xxx_divs[i].pll_d >> 8) & PLLD_MSB_MASK);
+}
+
+/*
+ *----------------------------------------------------------------------------
+ * Function : adc3xxx_hw_params
+ * Purpose  : This function sets the sample rate and audio data word length.
+ *
+ *----------------------------------------------------------------------------
+ */
+static int adc3xxx_hw_params(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params,
+			     struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct adc3xxx_priv *adc3xxx = snd_soc_component_get_drvdata(component);
+	int i, width = 16;
+	u8 iface_len, bdiv;
+
+	i = adc3xxx_get_divs(component->dev, adc3xxx->sysclk,
+			     params_rate(params), adc3xxx->pll_mode);
+
+	if (i < 0)
+		return i;
+
+	/* select data word length */
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S16_LE:
+		iface_len = IFACE_16BITS;
+		width = 16;
+		break;
+	case SNDRV_PCM_FORMAT_S20_3LE:
+		iface_len = IFACE_20BITS;
+		width = 20;
+		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+		iface_len = IFACE_24BITS;
+		width = 24;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		iface_len = IFACE_32BITS;
+		width = 32;
+		break;
+	default:
+		dev_err(component->dev, "Unsupported serial data format\n");
+		return -EINVAL;
+	}
+	snd_soc_component_update_bits(component, INTERFACE_CTRL_1, WLENGTH_MASK, iface_len);
+
+	if (adc3xxx_divs[i].pll_p) { /* If PLL used for this mode */
+		adc3xxx_setup_pll(component, i);
+		snd_soc_component_write(component, CLKGEN_MUX, USE_PLL);
+		adc3xxx->use_pll = 1;
+	} else {
+		snd_soc_component_write(component, CLKGEN_MUX, NO_PLL);
+		adc3xxx->use_pll = 0;
+	}
+
+	/* Write divisor values; masks => bit 7 = 0 => divisor powered down */
+	/* NADC */
+	snd_soc_component_write(component, ADC_NADC,
+				adc3xxx_divs[i].nadc & NADC_MASK);
+	/* MADC */
+	snd_soc_component_write(component, ADC_MADC,
+				adc3xxx_divs[i].madc & MADC_MASK);
+	/* AOSR */
+	snd_soc_component_write(component, ADC_AOSR,
+				adc3xxx_divs[i].aosr & AOSR_MASK);
+	/* BDIV N Value */
+	/* BCLK is set up to be derived from ADC_CLK */
+	bdiv = (adc3xxx_divs[i].aosr * adc3xxx_divs[i].madc) / (2 * width);
+	/* BCLK enabled (when needed) in adc3xxx_set_bias_level() */
+	snd_soc_component_write(component, BCLK_N_DIV, bdiv & BDIV_MASK);
+
+	return 0;
+}
+
+/*
+ *----------------------------------------------------------------------------
+ * Function : adc3xxx_set_dai_sysclk
+ * Purpose  : This function is to set the DAI system clock
+ *
+ *----------------------------------------------------------------------------
+ */
+static int adc3xxx_set_dai_sysclk(struct snd_soc_dai *codec_dai,
+				  int clk_id, unsigned int freq, int dir)
+{
+	struct snd_soc_component *component = codec_dai->component;
+	struct adc3xxx_priv *adc3xxx = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	ret = adc3xxx_parse_pll_mode(clk_id, &adc3xxx->pll_mode);
+	if (ret < 0)
+		return ret;
+
+	adc3xxx->sysclk = freq;
+	dev_info(component->dev, "Set sysclk to %u Hz, %s\n",
+		 freq, PLL_MODE_TEXT(adc3xxx->pll_mode));
+	return 0;
+}
+
+/*
+ *----------------------------------------------------------------------------
+ * Function : adc3xxx_set_dai_fmt
+ * Purpose  : This function is to set the DAI format
+ *
+ *----------------------------------------------------------------------------
+ */
+static int adc3xxx_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
+{
+	struct snd_soc_component *component = codec_dai->component;
+	struct adc3xxx_priv *adc3xxx = snd_soc_component_get_drvdata(component);
+	u8 clkdir = 0, format = 0;
+
+	/* set master/slave audio interface */
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBM_CFM:
+		adc3xxx->master = 1;
+		clkdir = BCLK_MASTER | WCLK_MASTER;
+		break;
+	case SND_SOC_DAIFMT_CBS_CFS:
+		adc3xxx->master = 0;
+		break;
+	default:
+		dev_err(component->dev, "Invalid DAI master/slave interface\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * match both interface format and signal polarities since they
+	 * are fixed
+	 */
+	switch (fmt & (SND_SOC_DAIFMT_FORMAT_MASK | SND_SOC_DAIFMT_INV_MASK)) {
+	case SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF:
+		format = FORMAT_I2S;
+		break;
+	case SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_IB_NF:
+		format = FORMAT_DSP;
+		break;
+	case SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_IB_NF:
+		format = FORMAT_DSP;
+		break;
+	case SND_SOC_DAIFMT_RIGHT_J | SND_SOC_DAIFMT_NB_NF:
+		format = FORMAT_RJF;
+		break;
+	case SND_SOC_DAIFMT_LEFT_J | SND_SOC_DAIFMT_NB_NF:
+		format = FORMAT_LJF;
+		break;
+	default:
+		dev_err(component->dev, "Invalid DAI format\n");
+		return -EINVAL;
+	}
+
+	/* set clock direction and format */
+	return snd_soc_component_update_bits(component, INTERFACE_CTRL_1,
+					     clkdir | format,
+					     CLKDIR_MASK | FORMAT_MASK);
+}
+
+/*
+ *----------------------------------------------------------------------------
+ * Function : adc3xxx_set_bias_level
+ * Purpose  : This function is to get triggered when dapm events occurs.
+ *
+ *----------------------------------------------------------------------------
+ */
+static int adc3xxx_set_bias_level(struct snd_soc_component *component,
+				  enum snd_soc_bias_level level)
+{
+	struct adc3xxx_priv *adc3xxx = snd_soc_component_get_drvdata(component);
+
+	if (snd_soc_component_get_bias_level(component) == level)
+		return 0;
+
+	/* all power is driven by DAPM system */
+	switch (level) {
+	case SND_SOC_BIAS_ON:
+		/* Enable pll when needed */
+		if (adc3xxx->use_pll)
+			snd_soc_component_update_bits(component, PLL_PROG_PR,
+						      ENABLE_PLL, ENABLE_PLL);
+
+		/* Switch on NADC Divider */
+		snd_soc_component_update_bits(component, ADC_NADC,
+					      ENABLE_NADC, ENABLE_NADC);
+
+		/* Switch on MADC Divider */
+		snd_soc_component_update_bits(component, ADC_MADC,
+					      ENABLE_MADC, ENABLE_MADC);
+
+		if (adc3xxx->master)
+			/* Switch on BCLK_N Divider */
+			snd_soc_component_update_bits(component, BCLK_N_DIV,
+						      ENABLE_BCLK, ENABLE_BCLK);
+		else
+			/* Switch off BCLK_N Divider */
+			snd_soc_component_update_bits(component, BCLK_N_DIV,
+						      ENABLE_BCLK, 0);
+
+		if (adc3xxx->use_pll)
+			/* 10msec delay needed after PLL power-up to allow
+			 * PLL and dividers to stabilize (datasheet p13).
+			 */
+			usleep_range(10000, 20000);
+
+		break;
+
+		/* partial On */
+	case SND_SOC_BIAS_PREPARE:
+		break;
+
+		/* Off, with power */
+	case SND_SOC_BIAS_STANDBY:
+		/* Disable pll if used */
+		if (adc3xxx->use_pll)
+			snd_soc_component_update_bits(component, PLL_PROG_PR,
+						      ENABLE_PLL, 0);
+
+		/* Switch off NADC Divider */
+		snd_soc_component_update_bits(component, ADC_NADC,
+					      ENABLE_NADC, 0);
+
+		/* Switch off MADC Divider */
+		snd_soc_component_update_bits(component, ADC_MADC,
+					      ENABLE_MADC, 0);
+
+		/* Switch off BCLK_N Divider */
+		if (adc3xxx->master)
+			snd_soc_component_update_bits(component, BCLK_N_DIV,
+						      ENABLE_BCLK, 0);
+		break;
+
+		/* Off without power */
+	case SND_SOC_BIAS_OFF:
+
+		/* power off Left/Right ADC channels */
+		snd_soc_component_update_bits(component, ADC_DIGITAL,
+					      LADC_PWR_ON | RADC_PWR_ON, 0);
+		/* Turn off PLLs if used */
+		if (adc3xxx->use_pll)
+			snd_soc_component_update_bits(component, PLL_PROG_PR,
+						      ENABLE_PLL, 0);
+
+		/* Switch off NADC Divider */
+		snd_soc_component_update_bits(component, ADC_NADC,
+					      ENABLE_NADC, 0);
+
+		/* Switch off MADC Divider */
+		snd_soc_component_update_bits(component, ADC_MADC,
+					      ENABLE_MADC, 0);
+
+		/* Switch off BCLK_N Divider */
+		if (adc3xxx->master)
+			snd_soc_component_update_bits(component, BCLK_N_DIV,
+						      ENABLE_BCLK, 0);
+		break;
+	}
+
+	return 0;
+}
+
+static struct snd_soc_dai_ops adc3xxx_dai_ops = {
+	.hw_params	= adc3xxx_hw_params,
+	.set_sysclk	= adc3xxx_set_dai_sysclk,
+	.set_fmt	= adc3xxx_set_dai_fmt,
+};
+
+struct snd_soc_dai_driver adc3xxx_dai = {
+	.name = "tlv320adc3xxx-hifi",
+	.capture = {
+		    .stream_name = "Capture",
+		    .channels_min = 1,
+		    .channels_max = 2,
+		    .rates = ADC3xxx_RATES,
+		    .formats = ADC3xxx_FORMATS,
+		    },
+	.ops = &adc3xxx_dai_ops,
+};
+EXPORT_SYMBOL_GPL(adc3xxx_dai);
+
+#define REGISTER_INIT(CODEC, MAP) \
+	do { \
+		int i; \
+		for (i = 0; i < ARRAY_SIZE(MAP); i++) \
+			snd_soc_component_write(CODEC, MAP[i].reg_offset, \
+				      MAP[i].reg_val); \
+	} while (0)
+
+/*
+ *----------------------------------------------------------------------------
+ * Function : adc3xxx_init
+ * Purpose  : This function is to initialize the adc3xxx driver
+ *            register the mixer and dsp interfaces with the kernel.
+ *
+ *----------------------------------------------------------------------------
+ */
+static int adc3xxx_init(struct snd_soc_component *component)
+{
+	struct adc3xxx_priv *adc3xxx = snd_soc_component_get_drvdata(component);
+
+	/* Issue software reset to adc3xxx */
+	snd_soc_component_write(component, RESET, SOFT_RESET);
+
+	adc3xxx_set_bias_level(component, SND_SOC_BIAS_STANDBY);
+
+	REGISTER_INIT(component, adc3xxx_reg_init);
+	if (adc3xxx->type == ADC3101)
+		REGISTER_INIT(component, adc3101_reg_init);
+
+	if (adc3xxx->gpio1_cfg) {
+		unsigned int cfg = adc3xxx->gpio1_cfg - 1;
+
+		snd_soc_component_update_bits(component,
+					      GPIO1_CTRL, GPIO_CTRL_CFG_MASK,
+					      cfg << GPIO_CTRL_CFG_SHIFT);
+		if (cfg == ADC3XXX_GPIO_GPO) {
+			snd_soc_add_component_controls(component,
+						       adc3xxx_gpio1_out_control,
+						       ARRAY_SIZE(adc3xxx_gpio1_out_control));
+		}
+	}
+
+	if (adc3xxx->gpio2_cfg) {
+		unsigned int cfg = adc3xxx->gpio2_cfg - 1;
+
+		snd_soc_component_update_bits(component,
+					      GPIO2_CTRL, GPIO_CTRL_CFG_MASK,
+					      cfg << GPIO_CTRL_CFG_SHIFT);
+		if (cfg == ADC3XXX_GPIO_GPO) {
+			snd_soc_add_component_controls(component,
+						       adc3xxx_gpio2_out_control,
+						       ARRAY_SIZE(adc3xxx_gpio2_out_control));
+		}
+	}
+
+	//adc3xxx_set_bias_level(component, SND_SOC_BIAS_STANDBY);
+
+	return 0;
+}
+
+/*
+ *----------------------------------------------------------------------------
+ * Function : adc3xxx_probe
+ * Purpose  : This is first driver function called by the SoC core driver.
+ *
+ *----------------------------------------------------------------------------
+ */
+static int adc3xxx_probe(struct snd_soc_component *component)
+{
+	struct adc3xxx_priv *adc3xxx = snd_soc_component_get_drvdata(component);
+	int ret = 0;
+
+	ret = devm_gpio_request(component->dev, adc3xxx->rst_pin, "adc3xxx reset");
+	if (ret < 0) {
+		dev_err(component->dev, "Failed to request rst_pin: %d\n", ret);
+		return ret;
+	}
+
+	/* Reset adc3xxx codec */
+	gpio_direction_output(adc3xxx->rst_pin, adc3xxx->rst_active);
+	usleep_range(2000, 100000); /* Requirement: > 10 ns (datasheet p13) */
+	gpio_direction_output(adc3xxx->rst_pin, !adc3xxx->rst_active);
+
+	ret = adc3xxx_init(component);
+
+	if (ret < 0) {
+		dev_err(component->dev, "Failed to initialize ADC3xxx\n");
+		devm_gpio_free(component->dev, adc3xxx->rst_pin);
+	}
+
+	return ret;
+}
+
+/*
+ *----------------------------------------------------------------------------
+ * Function : adc3xxx_remove
+ * Purpose  : to remove adc3xxx soc device
+ *
+ *----------------------------------------------------------------------------
+ */
+static void adc3xxx_remove(struct snd_soc_component *component)
+{
+	adc3xxx_set_bias_level(component, SND_SOC_BIAS_OFF);
+}
+
+/*
+ *----------------------------------------------------------------------------
+ * Function : adc3xxx_suspend
+ * Purpose  : This function is to suspend the adc3xxx driver.
+ *
+ *----------------------------------------------------------------------------
+ */
+static int adc3xxx_suspend(struct snd_soc_component *component)
+{
+	adc3xxx_set_bias_level(component, SND_SOC_BIAS_OFF);
+
+	return 0;
+}
+
+/*
+ *----------------------------------------------------------------------------
+ * Function : adc3xxx_resume
+ * Purpose  : This function is to resume the ADC3xxx driver
+ *
+ *----------------------------------------------------------------------------
+ */
+static int adc3xxx_resume(struct snd_soc_component *component)
+{
+	snd_soc_component_cache_sync(component);
+	adc3xxx_set_bias_level(component, SND_SOC_BIAS_STANDBY);
+
+	return 0;
+}
+
+static const struct snd_soc_component_driver soc_component_dev_adc3xxx = {
+	.probe			= adc3xxx_probe,
+	.remove			= adc3xxx_remove,
+	.suspend		= adc3xxx_suspend,
+	.resume			= adc3xxx_resume,
+	.set_bias_level		= adc3xxx_set_bias_level,
+
+	.controls		= adc3xxx_snd_controls,
+	.num_controls		= ARRAY_SIZE(adc3xxx_snd_controls),
+	.dapm_widgets		= adc3xxx_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(adc3xxx_dapm_widgets),
+	.dapm_routes		= intercon,
+	.num_dapm_routes	= ARRAY_SIZE(intercon),
+};
+
+
+#if defined(CONFIG_I2C) || defined(CONFIG_I2C_MODULE)
+/*
+ *----------------------------------------------------------------------------
+ * Function : adc3xxx_i2c_probe
+ * Purpose  : This function attaches the i2c client and initializes
+ *				adc3xxx CODEC.
+ *
+ *----------------------------------------------------------------------------
+ */
+static int adc3xxx_i2c_probe(struct i2c_client *i2c,
+			     const struct i2c_device_id *id)
+{
+	struct device *dev = &i2c->dev;
+	struct device_node *np = dev->of_node;
+	struct adc3xxx_priv *adc3xxx = NULL;
+	enum of_gpio_flags flags;
+	int rst_pin;
+	uint32_t val;
+	int ret;
+
+	adc3xxx = devm_kzalloc(dev, sizeof(struct adc3xxx_priv), GFP_KERNEL);
+	if (!adc3xxx)
+		return -ENOMEM;
+	adc3xxx->dev = dev;
+
+	adc3xxx->mclk = devm_clk_get(dev, NULL);
+	if (IS_ERR(adc3xxx->mclk)) {
+		if (PTR_ERR(adc3xxx->mclk) != -ENOENT)
+			return PTR_ERR(adc3xxx->mclk);
+		/* Make a note that there is no mclk specified. */
+		adc3xxx->mclk = NULL;
+	} else if (adc3xxx->mclk) {
+		ret = clk_prepare_enable(adc3xxx->mclk);
+		if (ret < 0)
+			return ret;
+		dev_info(dev, "Enabled MCLK, freq %lu Hz\n", clk_get_rate(adc3xxx->mclk));
+	}
+
+	if (!of_property_read_u32(np, "ti,pll-mode", &val)) {
+		ret = adc3xxx_parse_pll_mode(val, &adc3xxx->pll_mode);
+		if (ret < 0)
+			return ret;
+		dev_info(dev, "PLL mode set in devicetree: %s\n",
+			 PLL_MODE_TEXT(adc3xxx->pll_mode));
+	}
+
+	adc3xxx_parse_gpio_mode(adc3xxx, "ti,dmdin-gpio1", &adc3xxx->gpio1_cfg);
+	adc3xxx_parse_gpio_mode(adc3xxx, "ti,dmclk-gpio2", &adc3xxx->gpio2_cfg);
+
+	adc3xxx->regmap = devm_regmap_init_i2c(i2c, &adc3xxx_regmap);
+	if (IS_ERR(adc3xxx->regmap)) {
+		ret = PTR_ERR(adc3xxx->regmap);
+		return ret;
+	}
+
+	rst_pin = of_get_gpio_flags(np, 0, &flags);
+	if (rst_pin < 0 || !gpio_is_valid(rst_pin))
+		return -ENXIO;
+
+	adc3xxx->rst_pin = rst_pin;
+	adc3xxx->rst_active = !(flags & OF_GPIO_ACTIVE_LOW);
+	adc3xxx->type = id->driver_data;
+
+	i2c_set_clientdata(i2c, adc3xxx);
+	ret = snd_soc_register_component(dev,
+			&soc_component_dev_adc3xxx, &adc3xxx_dai, 1);
+	if (ret < 0)
+		dev_err(dev, "Failed to register codec\n");
+
+	return ret;
+}
+
+/*
+ *----------------------------------------------------------------------------
+ * Function : adc3xxx_i2c_remove
+ * Purpose  : This function removes the i2c client and unregisters
+ *                              adc3xxx CODEC.
+ *
+ *----------------------------------------------------------------------------
+ */
+static int __exit adc3xxx_i2c_remove(struct i2c_client *client)
+{
+	struct adc3xxx_priv *adc3xxx = i2c_get_clientdata(client);
+
+	if (adc3xxx->mclk)
+		clk_disable_unprepare(adc3xxx->mclk);
+	snd_soc_unregister_component(&client->dev);
+	return 0;
+}
+
+static const struct of_device_id tlv320adc3xxx_of_match[] = {
+	{ .compatible = "ti,tlv320adc3001",},
+	{ .compatible = "ti,tlv320adc3101",},
+	{},
+};
+MODULE_DEVICE_TABLE(of, tlv320adc3xxx_of_match);
+
+
+static const struct i2c_device_id adc3xxx_i2c_id[] = {
+	{"tlv320adc3001", ADC3001},
+	{"tlv320adc3101", ADC3101},
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, adc3xxx_i2c_id);
+
+/* machine i2c codec control layer */
+static struct i2c_driver adc3xxx_i2c_driver = {
+	.driver = {
+		   .name = "tlv320adc3xxx-codec",
+		   .of_match_table = tlv320adc3xxx_of_match,
+		   },
+	.probe = adc3xxx_i2c_probe,
+	.remove = adc3xxx_i2c_remove,
+	.id_table = adc3xxx_i2c_id,
+};
+#endif
+
+static int __init tlv320adc3xxx_init(void)
+{
+	return i2c_add_driver(&adc3xxx_i2c_driver);
+}
+
+static void __exit tlv320adc3xxx_exit(void)
+{
+	i2c_del_driver(&adc3xxx_i2c_driver);
+}
+
+module_init(tlv320adc3xxx_init);
+module_exit(tlv320adc3xxx_exit);
+
+MODULE_DESCRIPTION("ASoC TLV320ADC3xxx codec driver");
+MODULE_AUTHOR(" shahina.s@mistralsolutions.com ");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/tlv320adc3xxx.h b/sound/soc/codecs/tlv320adc3xxx.h
new file mode 100644
index 000000000000..21276ad71876
--- /dev/null
+++ b/sound/soc/codecs/tlv320adc3xxx.h
@@ -0,0 +1,381 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Based on sound/soc/codecs/tlv320aic3x.c by  Vladimir Barinov
+ *
+ * History:
+ *
+ * Author:  "Shahina Shaik" < shahina.s@mistralsolutions.com >
+ * Copyright:   (C) 2010 Mistral Solutions Pvt Ltd.
+ *
+ * Author: Dongge wu <dgwu@ambarella.com>
+ *      2015/10/28 - [Dongge wu] Created file
+ * Copyright (C) 2014-2018, Ambarella, Inc.
+ *
+ * Author: Ricard Wanderlof <ricardw@axis.com>
+ * 2020/11/05: Fixing driver for Linux 4.14: more clocking modes, etc.
+ * 2021/09/03: Porting to Linux 5.4, with enhancements (see tlv320adc3xxx.c).
+ * Copyright (C) 2021 Axis Communications AB
+ *
+ */
+
+#ifndef _ADC3xxx_H
+#define _ADC3xxx_H
+
+/* 8 bit mask value */
+#define ADC3xxx_8BITS_MASK           0xFF
+
+/* Enable slave / master mode for codec */
+#define ADC3xxx_MCBSP_SLAVE //codec master
+//#undef ADC3xxx_MCBSP_SLAVE
+
+#define ADC3xxx_PAGE_SIZE		128
+#define ADC3xxx_REG(page, reg)		((page * ADC3xxx_PAGE_SIZE) + reg)
+
+
+/****************************************************************************/
+/*			Page 0 Registers				    */
+/****************************************************************************/
+
+/* Page select register */
+#define PAGE_SELECT			ADC3xxx_REG(0, 0)
+/* Software reset register */
+#define RESET				ADC3xxx_REG(0, 1)
+
+/* 2-3 Reserved */
+
+/* PLL programming register B */
+#define CLKGEN_MUX			ADC3xxx_REG(0, 4)
+/* PLL P and R-Val */
+#define PLL_PROG_PR			ADC3xxx_REG(0, 5)
+/* PLL J-Val */
+#define PLL_PROG_J			ADC3xxx_REG(0, 6)
+/* PLL D-Val MSB */
+#define PLL_PROG_D_MSB			ADC3xxx_REG(0, 7)
+/* PLL D-Val LSB */
+#define PLL_PROG_D_LSB			ADC3xxx_REG(0, 8)
+
+/* 9-17 Reserved */
+
+/* ADC NADC */
+#define ADC_NADC			ADC3xxx_REG(0, 18)
+/* ADC MADC */
+#define ADC_MADC			ADC3xxx_REG(0, 19)
+/* ADC AOSR */
+#define ADC_AOSR			ADC3xxx_REG(0, 20)
+/* ADC IADC */
+#define ADC_IADC			ADC3xxx_REG(0, 21)
+
+/* 23-24 Reserved */
+
+/* CLKOUT MUX */
+#define CLKOUT_MUX			ADC3xxx_REG(0, 25)
+/* CLOCKOUT M divider value */
+#define CLKOUT_M_DIV			ADC3xxx_REG(0, 26)
+/*Audio Interface Setting Register 1*/
+#define INTERFACE_CTRL_1		ADC3xxx_REG(0, 27)
+/* Data Slot Offset (Ch_Offset_1) */
+#define CH_OFFSET_1			ADC3xxx_REG(0, 28)
+/* ADC interface control 2 */
+#define INTERFACE_CTRL_2		ADC3xxx_REG(0, 29)
+/* BCLK N Divider */
+#define BCLK_N_DIV			ADC3xxx_REG(0, 30)
+/* Secondary audio interface control 1 */
+#define INTERFACE_CTRL_3		ADC3xxx_REG(0, 31)
+/* Secondary audio interface control 2 */
+#define INTERFACE_CTRL_4		ADC3xxx_REG(0, 32)
+/* Secondary audio interface control 3 */
+#define INTERFACE_CTRL_5		ADC3xxx_REG(0, 33)
+/* I2S sync */
+#define I2S_SYNC			ADC3xxx_REG(0, 34)
+
+/* 35 Reserved */
+
+/* ADC flag register */
+#define ADC_FLAG			ADC3xxx_REG(0, 36)
+/* Data slot offset 2 (Ch_Offset_2) */
+#define CH_OFFSET_2			ADC3xxx_REG(0, 37)
+/* I2S TDM control register */
+#define I2S_TDM_CTRL			ADC3xxx_REG(0, 38)
+
+/* 39-41 Reserved */
+
+/* Interrupt flags (overflow) */
+#define INTR_FLAG_1			ADC3xxx_REG(0, 42)
+/* Interrupt flags (overflow) */
+#define INTR_FLAG_2			ADC3xxx_REG(0, 43)
+
+/* 44 Reserved */
+
+/* Interrupt flags ADC */
+#define INTR_FLAG_ADC1			ADC3xxx_REG(0, 45)
+
+/* 46 Reserved */
+
+/* Interrupt flags ADC */
+#define INTR_FLAG_ADC2			ADC3xxx_REG(0, 47)
+/* INT1 interrupt control */
+#define INT1_CTRL			ADC3xxx_REG(0, 48)
+/* INT2 interrupt control */
+#define INT2_CTRL			ADC3xxx_REG(0, 49)
+
+/* 50 Reserved */
+
+/* DMCLK/GPIO2 control */
+#define GPIO2_CTRL			ADC3xxx_REG(0, 51)
+/* DMDIN/GPIO1 control */
+#define GPIO1_CTRL			ADC3xxx_REG(0, 52)
+/* DOUT Control */
+#define DOUT_CTRL			ADC3xxx_REG(0, 53)
+
+/* 54-56 Reserved */
+
+/* ADC sync control 1 */
+#define SYNC_CTRL_1			ADC3xxx_REG(0, 57)
+/* ADC sync control 2 */
+#define SYNC_CTRL_2			ADC3xxx_REG(0, 58)
+/* ADC CIC filter gain control */
+#define CIC_GAIN_CTRL			ADC3xxx_REG(0, 59)
+
+/* 60 Reserved */
+
+/* ADC processing block selection  */
+#define PRB_SELECT			ADC3xxx_REG(0, 61)
+/* Programmable instruction mode control bits */
+#define INST_MODE_CTRL			ADC3xxx_REG(0, 62)
+
+/* 63-79 Reserved */
+
+/* Digital microphone polarity control */
+#define MIC_POLARITY_CTRL		ADC3xxx_REG(0, 80)
+/* ADC Digital */
+#define ADC_DIGITAL			ADC3xxx_REG(0, 81)
+/* ADC Fine Gain Adjust */
+#define	ADC_FGA				ADC3xxx_REG(0, 82)
+/* Left ADC Channel Volume Control */
+#define LADC_VOL			ADC3xxx_REG(0, 83)
+/* Right ADC Channel Volume Control */
+#define RADC_VOL			ADC3xxx_REG(0, 84)
+/* ADC phase compensation */
+#define ADC_PHASE_COMP			ADC3xxx_REG(0, 85)
+/* Left Channel AGC Control Register 1 */
+#define LEFT_CHN_AGC_1			ADC3xxx_REG(0, 86)
+/* Left Channel AGC Control Register 2 */
+#define LEFT_CHN_AGC_2			ADC3xxx_REG(0, 87)
+/* Left Channel AGC Control Register 3 */
+#define LEFT_CHN_AGC_3			ADC3xxx_REG(0, 88)
+/* Left Channel AGC Control Register 4 */
+#define LEFT_CHN_AGC_4			ADC3xxx_REG(0, 89)
+/* Left Channel AGC Control Register 5 */
+#define LEFT_CHN_AGC_5			ADC3xxx_REG(0, 90)
+/* Left Channel AGC Control Register 6 */
+#define LEFT_CHN_AGC_6			ADC3xxx_REG(0, 91)
+/* Left Channel AGC Control Register 7 */
+#define LEFT_CHN_AGC_7			ADC3xxx_REG(0, 92)
+/* Left AGC gain */
+#define LEFT_AGC_GAIN			ADC3xxx_REG(0, 93)
+/* Right Channel AGC Control Register 1 */
+#define RIGHT_CHN_AGC_1			ADC3xxx_REG(0, 94)
+/* Right Channel AGC Control Register 2 */
+#define RIGHT_CHN_AGC_2			ADC3xxx_REG(0, 95)
+/* Right Channel AGC Control Register 3 */
+#define RIGHT_CHN_AGC_3			ADC3xxx_REG(0, 96)
+/* Right Channel AGC Control Register 4 */
+#define RIGHT_CHN_AGC_4			ADC3xxx_REG(0, 97)
+/* Right Channel AGC Control Register 5 */
+#define RIGHT_CHN_AGC_5			ADC3xxx_REG(0, 98)
+/* Right Channel AGC Control Register 6 */
+#define RIGHT_CHN_AGC_6			ADC3xxx_REG(0, 99)
+/* Right Channel AGC Control Register 7 */
+#define RIGHT_CHN_AGC_7			ADC3xxx_REG(0, 100)
+/* Right AGC gain */
+#define RIGHT_AGC_GAIN			ADC3xxx_REG(0, 101)
+
+/* 102-127 Reserved */
+
+/****************************************************************************/
+/*			Page 1 Registers				    */
+/****************************************************************************/
+/* 1-25 Reserved */
+
+/* Dither control */
+#define DITHER_CTRL			ADC3xxx_REG(1, 26)
+
+/* 27-50 Reserved */
+
+/* MICBIAS Configuration Register */
+#define MICBIAS_CTRL			ADC3xxx_REG(1, 51)
+/* Left ADC input selection for Left PGA */
+#define LEFT_PGA_SEL_1			ADC3xxx_REG(1, 52)
+
+/* 53 Reserved */
+
+/* Right ADC input selection for Left PGA */
+#define LEFT_PGA_SEL_2			ADC3xxx_REG(1, 54)
+/* Right ADC input selection for right PGA */
+#define RIGHT_PGA_SEL_1			ADC3xxx_REG(1, 55)
+
+/* 56 Reserved */
+
+/* Right ADC input selection for right PGA */
+#define RIGHT_PGA_SEL_2			ADC3xxx_REG(1, 57)
+
+/* 58 Reserved */
+
+/* Left analog PGA settings */
+#define LEFT_APGA_CTRL			ADC3xxx_REG(1, 59)
+/* Right analog PGA settings */
+#define RIGHT_APGA_CTRL			ADC3xxx_REG(1, 60)
+/* ADC Low current Modes */
+#define LOW_CURRENT_MODES		ADC3xxx_REG(1, 61)
+/* ADC analog PGA flags */
+#define ANALOG_PGA_FLAGS		ADC3xxx_REG(1, 62)
+
+/* 63-127 Reserved */
+
+/****************************************************************************/
+/*			Macros and definitions				    */
+/****************************************************************************/
+
+#define ADC3xxx_RATES	SNDRV_PCM_RATE_8000_96000
+#define ADC3xxx_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
+			 SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S32_LE)
+
+/* bits defined for easy usage */
+#define D7			(0x01 << 7)
+#define D6			(0x01 << 6)
+#define D5			(0x01 << 5)
+#define D4			(0x01 << 4)
+#define D3			(0x01 << 3)
+#define D2			(0x01 << 2)
+#define D1			(0x01 << 1)
+#define D0			(0x01 << 0)
+
+/****************************************************************************/
+/*			ADC3xxx Register bits				    */
+/****************************************************************************/
+/* PLL Enable bits */
+#define ENABLE_PLL              D7
+#define ENABLE_NADC             D7
+#define ENABLE_MADC             D7
+#define ENABLE_BCLK             D7
+
+/* Power bits */
+#define LADC_PWR_ON		D7
+#define RADC_PWR_ON		D6
+
+#define SOFT_RESET              D0
+#define BCLK_MASTER		D3
+#define WCLK_MASTER		D2
+
+/* Interface register masks */
+#define FORMAT_MASK		(D7|D6)
+#define FORMAT_SHIFT		6
+#define WLENGTH_MASK		(D5|D4)
+#define WLENGTH_SHIFT		4
+#define CLKDIR_MASK		(D3|D2)
+#define CLKDIR_SHIFT		2
+
+/* Interface register bit patterns */
+#define FORMAT_I2S		(0 << FORMAT_SHIFT)
+#define FORMAT_DSP		(1 << FORMAT_SHIFT)
+#define FORMAT_RJF		(2 << FORMAT_SHIFT)
+#define FORMAT_LJF		(3 << FORMAT_SHIFT)
+
+#define IFACE_16BITS		(0 << WLENGTH_SHIFT)
+#define IFACE_20BITS		(1 << WLENGTH_SHIFT)
+#define IFACE_24BITS		(2 << WLENGTH_SHIFT)
+#define IFACE_32BITS		(3 << WLENGTH_SHIFT)
+
+/* PLL P/R bit offsets */
+#define PLLP_SHIFT		4
+#define PLLR_SHIFT		0
+#define PLL_PR_MASK		0x7F
+#define PLLJ_MASK		0x3F
+#define PLLD_MSB_MASK		0x3F
+#define PLLD_LSB_MASK		0xFF
+#define NADC_MASK		0x7F
+#define MADC_MASK		0x7F
+#define AOSR_MASK		0xFF
+#define IADC_MASK		0xFF
+#define BDIV_MASK		0x7F
+
+/* PLL_CLKIN bits */
+#define PLL_CLKIN_SHIFT		2
+#define PLL_CLKIN_MCLK		0x0
+#define PLL_CLKIN_BCLK		0x1
+#define PLL_CLKIN_ZERO		0x3
+
+/* CODEC_CLKIN bits */
+#define CODEC_CLKIN_SHIFT	0
+#define CODEC_CLKIN_MCLK	0x0
+#define CODEC_CLKIN_BCLK	0x1
+#define CODEC_CLKIN_PLL_CLK	0x3
+
+#define USE_PLL		((PLL_CLKIN_MCLK << PLL_CLKIN_SHIFT) | \
+			 (CODEC_CLKIN_PLL_CLK << CODEC_CLKIN_SHIFT))
+#define NO_PLL		((PLL_CLKIN_ZERO << PLL_CLKIN_SHIFT) | \
+			 (CODEC_CLKIN_MCLK << CODEC_CLKIN_SHIFT))
+
+/*  Analog PGA control bits */
+#define LPGA_MUTE		D7
+#define RPGA_MUTE		D7
+
+#define LPGA_GAIN_MASK		0x7F
+#define RPGA_GAIN_MASK		0x7F
+
+/* ADC current modes */
+#define ADC_LOW_CURR_MODE	D0
+
+/* Left ADC Input selection bits */
+#define LCH_SEL1_SHIFT		0
+#define LCH_SEL2_SHIFT		2
+#define LCH_SEL3_SHIFT		4
+#define LCH_SEL4_SHIFT		6
+
+#define LCH_SEL1X_SHIFT		0
+#define LCH_SEL2X_SHIFT		2
+#define LCH_SEL3X_SHIFT		4
+#define LCH_COMMON_MODE		D6
+#define BYPASS_LPGA		D7
+
+/* Right ADC Input selection bits */
+#define RCH_SEL1_SHIFT		0
+#define RCH_SEL2_SHIFT		2
+#define RCH_SEL3_SHIFT		4
+#define RCH_SEL4_SHIFT		6
+
+#define RCH_SEL1X_SHIFT		0
+#define RCH_SEL2X_SHIFT		2
+#define RCH_SEL3X_SHIFT		4
+#define RCH_COMMON_MODE		D6
+#define BYPASS_RPGA		D7
+
+/* MICBIAS control bits */
+#define MICBIAS1_SHIFT		5
+#define MICBIAS2_SHIFT		3
+
+#define ADC_MAX_VOLUME		64
+#define ADC_POS_VOL		24
+
+/* GPIO control bits (GPIO1_CTRL and GPIO2_CTRL) */
+#define GPIO_CTRL_CFG_MASK		(D2 | D3 | D4 | D5)
+#define GPIO_CTRL_CFG_SHIFT		2
+#define GPIO_CTRL_OUTPUT_CTRL		D0
+#define GPIO_CTRL_OUTPUT_CTRL_SHIFT	0
+#define GPIO_CTRL_INPUT_VALUE		D1
+#define GPIO_CTRL_INPUT_VALUE_SHIFT	1
+
+/****************** RATES TABLE FOR ADC3xxx ************************/
+struct adc3xxx_rate_divs {
+	u32 mclk;
+	u32 rate;
+	u8 pll_p;
+	u8 pll_r;
+	u8 pll_j;
+	u16 pll_d;
+	u8 nadc;
+	u8 madc;
+	u8 aosr;
+};
+
+#endif /* _ADC3xxx_H */
-- 
2.20.1

-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
