Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 686C33B7A73
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Jun 2021 00:32:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E56551670;
	Wed, 30 Jun 2021 00:31:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E56551670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625005947;
	bh=KQ8oEAzhOBdAQTRX0E9k4r/BvNTe7lMaKGMIbTUSM+0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W8Hjd9nCJo2pGvBGqzevGcZyyUVmNmmE/i0w/aCZv5QMNINYzGY0+eNYoptkYDP/m
	 6xA5dI36ziWPWz1w8ELUGzoDnfBb6TXGqWioht++KEZZIttxpVqzaJaBAS1RspGSyA
	 OBOyylwbm+IKQuKGQv6rB3rB/FKA7UYU5ODuNdAE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 945CFF804DF;
	Wed, 30 Jun 2021 00:30:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CF0EF804AE; Wed, 30 Jun 2021 00:30:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28851F800EE
 for <alsa-devel@alsa-project.org>; Wed, 30 Jun 2021 00:30:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28851F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="TXJF2L05"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15TMQblM016059; Tue, 29 Jun 2021 17:30:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=OhJzL4KzpkWQCbup1ogZODviXWyTwyQ07qR6wQaVZFs=;
 b=TXJF2L05KK5Z2OC/FaYJ8TnwmJCF54gusaMidUiQJaNZaLoFvjisQKWs+Vyz2IPDHGX+
 lJCDsNR9QOimV7pWw5AlKVLd6N6SQ0Wr/v2JXZ5I3PlEKyiD1Rd2r316xaWaCZLWQ/Ir
 16oTFA3edtBdQK/wuGbCOHAtqNGbYuFrNcOxffluUE94rQ3h5MZGaLCgM+E6j3FoLZPn
 d/BJPYbyf4D4MvU/9tHN+0kzX5OODrZqoGFyN2t/+SJiBnXz1bDrUJMZO0nLLVj5Oqtl
 dCTDEK4hgh1hVtBOaXB4JtcSiHwsHwIAfgiRIdFNLunk+cYiWzos8i+kzbC5Wlq0Ubq5 rA== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 39fardahnf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 29 Jun 2021 17:30:04 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 29 Jun
 2021 23:30:03 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 29 Jun 2021 23:30:03 +0100
Received: from localhost.localdomain (macC02XQ1DJJG5K.ad.cirrus.com
 [141.131.65.92])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3187646A;
 Tue, 29 Jun 2021 22:30:01 +0000 (UTC)
From: David Rhodes <drhodes@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <ckeepax@opensource.cirrus.com>, 
 <brian.austin@cirrus.com>, <patches@opensource.cirrus.com>,
 <alsa-devel@alsa-project.org>, <david.rhodes@cirrus.com>
Subject: [PATCH v2 1/2] ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
Date: Tue, 29 Jun 2021 17:27:18 -0500
Message-ID: <20210629222719.1391653-2-drhodes@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629222719.1391653-1-drhodes@opensource.cirrus.com>
References: <20210629222719.1391653-1-drhodes@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 3OtdtJk5boeGIV1ypX2uQQSZqhKBpaLw
X-Proofpoint-ORIG-GUID: 3OtdtJk5boeGIV1ypX2uQQSZqhKBpaLw
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 clxscore=1015 mlxscore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106290139
Cc: David Rhodes <drhodes@opensource.cirrus.com>
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

SoC Audio driver for the Cirrus Logic CS35L41 amplifier

Signed-off-by: David Rhodes <drhodes@opensource.cirrus.com>
---
 include/sound/cs35l41.h           |   83 ++
 sound/soc/codecs/Kconfig          |   12 +
 sound/soc/codecs/Makefile         |    4 +
 sound/soc/codecs/cs35l41-i2c.c    |  126 ++
 sound/soc/codecs/cs35l41-spi.c    |  152 +++
 sound/soc/codecs/cs35l41-tables.c |  617 ++++++++++
 sound/soc/codecs/cs35l41.c        | 1770 +++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l41.h        |  755 ++++++++++++
 8 files changed, 3519 insertions(+)
 create mode 100644 include/sound/cs35l41.h
 create mode 100644 sound/soc/codecs/cs35l41-i2c.c
 create mode 100644 sound/soc/codecs/cs35l41-spi.c
 create mode 100644 sound/soc/codecs/cs35l41-tables.c
 create mode 100644 sound/soc/codecs/cs35l41.c
 create mode 100644 sound/soc/codecs/cs35l41.h

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
new file mode 100644
index 000000000000..f386d80fd62b
--- /dev/null
+++ b/include/sound/cs35l41.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * linux/sound/cs35l41.h -- Platform data for CS35L41
+ *
+ * Copyright (c) 2017-2021 Cirrus Logic Inc.
+ *
+ * Author: David Rhodes	<david.rhodes@cirrus.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __CS35L41_H
+#define __CS35L41_H
+
+enum cs35l41_clk_ids {
+	CS35L41_CLKID_SCLK = 0,
+	CS35L41_CLKID_LRCLK = 1,
+	CS35L41_CLKID_MCLK = 4,
+};
+
+struct cs35l41_classh_cfg {
+	bool classh_bst_override;
+	bool classh_algo_enable;
+	int classh_bst_max_limit;
+	int classh_mem_depth;
+	int classh_release_rate;
+	int classh_headroom;
+	int classh_wk_fet_delay;
+	int classh_wk_fet_thld;
+};
+
+struct cs35l41_irq_cfg {
+	bool irq_pol_inv;
+	bool irq_out_en;
+	int irq_src_sel;
+};
+
+struct cs35l41_platform_data {
+	bool sclk_frc;
+	bool lrclk_frc;
+	bool right_channel;
+	bool amp_gain_zc;
+	bool dsp_ng_enable;
+	bool invert_pcm;
+	int bst_ind;
+	int bst_vctrl;
+	int bst_ipk;
+	int bst_cap;
+	int temp_warn_thld;
+	int dsp_ng_pcm_thld;
+	int dsp_ng_delay;
+	unsigned int hw_ng_sel;
+	unsigned int hw_ng_delay;
+	unsigned int hw_ng_thld;
+	int dout_hiz;
+	struct cs35l41_irq_cfg irq_config1;
+	struct cs35l41_irq_cfg irq_config2;
+	struct cs35l41_classh_cfg classh_config;
+};
+
+struct cs35l41_private {
+	struct snd_soc_codec *codec;
+	struct cs35l41_platform_data pdata;
+	struct device *dev;
+	struct regmap *regmap;
+	struct regulator_bulk_data supplies[2];
+	int num_supplies;
+	int irq;
+	bool i2s_mode;
+	/* GPIO for /RST */
+	struct gpio_desc *reset_gpio;
+	void (*otp_setup)(struct cs35l41_private *cs35l41, bool is_pre_setup,
+						unsigned int *freq);
+};
+
+int cs35l41_probe(struct cs35l41_private *cs35l41,
+				struct cs35l41_platform_data *pdata);
+int cs35l41_remove(struct cs35l41_private *cs35l41);
+
+#endif /* __CS35L41_H */
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 2a7b3e363069..bd30de9a1f71 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -61,6 +61,8 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_CS35L34
 	imply SND_SOC_CS35L35
 	imply SND_SOC_CS35L36
+	imply SND_SOC_CS35L41_SPI
+	imply SND_SOC_CS35L41_I2C
 	imply SND_SOC_CS42L42
 	imply SND_SOC_CS42L51_I2C
 	imply SND_SOC_CS42L52
@@ -597,6 +599,16 @@ config SND_SOC_CS35L36
 	tristate "Cirrus Logic CS35L36 CODEC"
 	depends on I2C
 
+config SND_SOC_CS35L41_SPI
+	tristate "Cirrus Logic CS35L41 CODEC (SPI)"
+	depends on SPI_MASTER
+	select REGMAP_SPI
+
+config SND_SOC_CS35L41_I2C
+	tristate "Cirrus Logic CS35L41 CODEC (I2C)"
+	depends on I2C
+	select REGMAP_I2C
+
 config SND_SOC_CS42L42
 	tristate "Cirrus Logic CS42L42 CODEC"
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 0efdba609048..056e1180cd67 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -54,6 +54,8 @@ snd-soc-cs35l33-objs := cs35l33.o
 snd-soc-cs35l34-objs := cs35l34.o
 snd-soc-cs35l35-objs := cs35l35.o
 snd-soc-cs35l36-objs := cs35l36.o
+snd-soc-cs35l41-spi-objs := cs35l41-spi.o cs35l41.o cs35l41-tables.o
+snd-soc-cs35l41-i2c-objs := cs35l41-i2c.o cs35l41.o cs35l41-tables.o
 snd-soc-cs42l42-objs := cs42l42.o
 snd-soc-cs42l51-objs := cs42l51.o
 snd-soc-cs42l51-i2c-objs := cs42l51-i2c.o
@@ -379,6 +381,8 @@ obj-$(CONFIG_SND_SOC_CS35L33)	+= snd-soc-cs35l33.o
 obj-$(CONFIG_SND_SOC_CS35L34)	+= snd-soc-cs35l34.o
 obj-$(CONFIG_SND_SOC_CS35L35)	+= snd-soc-cs35l35.o
 obj-$(CONFIG_SND_SOC_CS35L36)	+= snd-soc-cs35l36.o
+obj-$(CONFIG_SND_SOC_CS35L41_SPI)	+= snd-soc-cs35l41-spi.o
+obj-$(CONFIG_SND_SOC_CS35L41_I2C)	+= snd-soc-cs35l41-i2c.o
 obj-$(CONFIG_SND_SOC_CS42L42)	+= snd-soc-cs42l42.o
 obj-$(CONFIG_SND_SOC_CS42L51)	+= snd-soc-cs42l51.o
 obj-$(CONFIG_SND_SOC_CS42L51_I2C)	+= snd-soc-cs42l51-i2c.o
diff --git a/sound/soc/codecs/cs35l41-i2c.c b/sound/soc/codecs/cs35l41-i2c.c
new file mode 100644
index 000000000000..51ef27a637c1
--- /dev/null
+++ b/sound/soc/codecs/cs35l41-i2c.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * cs35l41-i2c.c -- CS35l41 I2C driver
+ *
+ * Copyright 2017-2021 Cirrus Logic, Inc.
+ *
+ * Author: David Rhodes <david.rhodes@cirrus.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/version.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+#include <linux/gpio/consumer.h>
+#include <linux/regulator/consumer.h>
+#include <linux/acpi.h>
+
+#include "cs35l41.h"
+#include <sound/cs35l41.h>
+
+static struct regmap_config cs35l41_regmap_i2c = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = CS35L41_REGSTRIDE,
+	.reg_format_endian = REGMAP_ENDIAN_BIG,
+	.val_format_endian = REGMAP_ENDIAN_BIG,
+	.max_register = CS35L41_LASTREG,
+	.reg_defaults = cs35l41_reg,
+	.num_reg_defaults = ARRAY_SIZE(cs35l41_reg),
+	.volatile_reg = cs35l41_volatile_reg,
+	.readable_reg = cs35l41_readable_reg,
+	.precious_reg = cs35l41_precious_reg,
+	.cache_type = REGCACHE_RBTREE,
+};
+
+static const struct i2c_device_id cs35l41_id_i2c[] = {
+	{"cs35l40", 0},
+	{"cs35l41", 0},
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, cs35l41_id_i2c);
+
+static int cs35l41_i2c_probe(struct i2c_client *client,
+				const struct i2c_device_id *id)
+{
+	struct cs35l41_private *cs35l41;
+	struct device *dev = &client->dev;
+	struct cs35l41_platform_data *pdata = dev_get_platdata(dev);
+	const struct regmap_config *regmap_config = &cs35l41_regmap_i2c;
+	int ret;
+
+	cs35l41 = devm_kzalloc(dev, sizeof(struct cs35l41_private), GFP_KERNEL);
+
+	if (cs35l41 == NULL)
+		return -ENOMEM;
+
+	cs35l41->dev = dev;
+	cs35l41->irq = client->irq;
+	cs35l41->otp_setup = NULL;
+
+	i2c_set_clientdata(client, cs35l41);
+	cs35l41->regmap = devm_regmap_init_i2c(client, regmap_config);
+	if (IS_ERR(cs35l41->regmap)) {
+		ret = PTR_ERR(cs35l41->regmap);
+		dev_err(cs35l41->dev, "Failed to allocate register map: %d\n",
+			ret);
+		return ret;
+	}
+
+	return cs35l41_probe(cs35l41, pdata);
+}
+
+static int cs35l41_i2c_remove(struct i2c_client *client)
+{
+	struct cs35l41_private *cs35l41 = i2c_get_clientdata(client);
+
+	return cs35l41_remove(cs35l41);
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id cs35l41_of_match[] = {
+	{.compatible = "cirrus,cs35l40"},
+	{.compatible = "cirrus,cs35l41"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, cs35l41_of_match);
+#endif
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id cs35l41_acpi_match[] = {
+	{ "CSC3541", 0 },
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, cs35l41_acpi_match);
+#endif
+
+static struct i2c_driver cs35l41_i2c_driver = {
+	.driver = {
+		.name		= "cs35l41",
+		.of_match_table = of_match_ptr(cs35l41_of_match),
+		.acpi_match_table = ACPI_PTR(cs35l41_acpi_match),
+	},
+	.id_table	= cs35l41_id_i2c,
+	.probe		= cs35l41_i2c_probe,
+	.remove		= cs35l41_i2c_remove,
+};
+
+module_i2c_driver(cs35l41_i2c_driver);
+
+MODULE_DESCRIPTION("I2C CS35L41 driver");
+MODULE_AUTHOR("David Rhodes, Cirrus Logic Inc, <david.rhodes@cirrus.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/cs35l41-spi.c b/sound/soc/codecs/cs35l41-spi.c
new file mode 100644
index 000000000000..582b7b484c21
--- /dev/null
+++ b/sound/soc/codecs/cs35l41-spi.c
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * cs35l41-spi.c -- CS35l41 SPI driver
+ *
+ * Copyright 2017-2021 Cirrus Logic, Inc.
+ *
+ * Author: David Rhodes	<david.rhodes@cirrus.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/version.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/delay.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/gpio/consumer.h>
+#include <linux/spi/spi.h>
+#include <linux/regulator/consumer.h>
+#include <linux/acpi.h>
+
+#include "cs35l41.h"
+#include <sound/cs35l41.h>
+
+static struct regmap_config cs35l41_regmap_spi = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.pad_bits = 16,
+	.reg_stride = CS35L41_REGSTRIDE,
+	.reg_format_endian = REGMAP_ENDIAN_BIG,
+	.val_format_endian = REGMAP_ENDIAN_BIG,
+	.max_register = CS35L41_LASTREG,
+	.reg_defaults = cs35l41_reg,
+	.num_reg_defaults = ARRAY_SIZE(cs35l41_reg),
+	.volatile_reg = cs35l41_volatile_reg,
+	.readable_reg = cs35l41_readable_reg,
+	.precious_reg = cs35l41_precious_reg,
+	.cache_type = REGCACHE_RBTREE,
+};
+
+static const struct spi_device_id cs35l41_id_spi[] = {
+	{"cs35l40", 0},
+	{"cs35l41", 0},
+	{}
+};
+
+MODULE_DEVICE_TABLE(spi, cs35l41_id_spi);
+
+static void cs35l41_spi_otp_setup(struct cs35l41_private *cs35l41,
+					bool is_pre_setup, unsigned int *freq)
+{
+	struct spi_device *spi = NULL;
+	u32 orig_spi_freq;
+
+	spi = to_spi_device(cs35l41->dev);
+
+	if (!spi)
+		return;
+
+	if (is_pre_setup) {
+		orig_spi_freq = spi->max_speed_hz;
+		if (orig_spi_freq > CS35L41_SPI_MAX_FREQ_OTP) {
+			spi->max_speed_hz = CS35L41_SPI_MAX_FREQ_OTP;
+			spi_setup(spi);
+		}
+		*freq = orig_spi_freq;
+	} else {
+		if (spi->max_speed_hz != *freq) {
+			spi->max_speed_hz = *freq;
+			spi_setup(spi);
+		}
+	}
+}
+
+static int cs35l41_spi_probe(struct spi_device *spi)
+{
+	const struct regmap_config *regmap_config = &cs35l41_regmap_spi;
+	struct cs35l41_platform_data *pdata =
+					dev_get_platdata(&spi->dev);
+	struct cs35l41_private *cs35l41;
+	int ret;
+
+	cs35l41 = devm_kzalloc(&spi->dev,
+			       sizeof(struct cs35l41_private),
+			       GFP_KERNEL);
+	if (cs35l41 == NULL)
+		return -ENOMEM;
+
+
+	spi_set_drvdata(spi, cs35l41);
+	cs35l41->regmap = devm_regmap_init_spi(spi, regmap_config);
+	if (IS_ERR(cs35l41->regmap)) {
+		ret = PTR_ERR(cs35l41->regmap);
+		dev_err(&spi->dev, "Failed to allocate register map: %d\n",
+			ret);
+		return ret;
+	}
+
+	cs35l41->dev = &spi->dev;
+	cs35l41->irq = spi->irq;
+	cs35l41->otp_setup = cs35l41_spi_otp_setup;
+
+	return cs35l41_probe(cs35l41, pdata);
+}
+
+static int cs35l41_spi_remove(struct spi_device *spi)
+{
+	struct cs35l41_private *cs35l41 = spi_get_drvdata(spi);
+
+	return cs35l41_remove(cs35l41);
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id cs35l41_of_match[] = {
+	{.compatible = "cirrus,cs35l40"},
+	{.compatible = "cirrus,cs35l41"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, cs35l41_of_match);
+#endif
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id cs35l41_acpi_match[] = {
+	{ "CSC3541", 0 }, /* Cirrus Logic PCI ID + part ID */
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, cs35l41_acpi_match);
+#endif
+
+static struct spi_driver cs35l41_spi_driver = {
+	.driver = {
+		.name		= "cs35l41",
+		.of_match_table = of_match_ptr(cs35l41_of_match),
+		.acpi_match_table = ACPI_PTR(cs35l41_acpi_match),
+	},
+	.id_table	= cs35l41_id_spi,
+	.probe		= cs35l41_spi_probe,
+	.remove		= cs35l41_spi_remove,
+};
+
+module_spi_driver(cs35l41_spi_driver);
+
+MODULE_DESCRIPTION("SPI CS35L41 driver");
+MODULE_AUTHOR("David Rhodes, Cirrus Logic Inc, <david.rhodes@cirrus.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/cs35l41-tables.c b/sound/soc/codecs/cs35l41-tables.c
new file mode 100644
index 000000000000..16fb083e3902
--- /dev/null
+++ b/sound/soc/codecs/cs35l41-tables.c
@@ -0,0 +1,617 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * cs35l41-tables.c -- CS35L41 ALSA SoC audio driver
+ *
+ * Copyright 2017-2021 Cirrus Logic, Inc.
+ *
+ * Author: David Rhodes <david.rhodes@cirrus.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include "cs35l41.h"
+
+const struct reg_default cs35l41_reg[CS35L41_MAX_CACHE_REG] = {
+	{CS35L41_PWR_CTRL1,			0x00000000},
+	{CS35L41_PWR_CTRL3,			0x01000010},
+	{CS35L41_GPIO_PAD_CONTROL,		0x00000000},
+	{CS35L41_SP_ENABLES,			0x00000000},
+	{CS35L41_SP_RATE_CTRL,			0x00000028},
+	{CS35L41_SP_FORMAT,			0x18180200},
+	{CS35L41_SP_HIZ_CTRL,			0x00000002},
+	{CS35L41_SP_FRAME_TX_SLOT,		0x03020100},
+	{CS35L41_SP_FRAME_RX_SLOT,		0x00000100},
+	{CS35L41_SP_TX_WL,			0x00000018},
+	{CS35L41_SP_RX_WL,			0x00000018},
+	{CS35L41_DAC_PCM1_SRC,			0x00000008},
+	{CS35L41_ASP_TX1_SRC,			0x00000018},
+	{CS35L41_ASP_TX2_SRC,			0x00000019},
+	{CS35L41_ASP_TX3_SRC,			0x00000020},
+	{CS35L41_ASP_TX4_SRC,			0x00000021},
+	{CS35L41_DSP1_RX1_SRC,			0x00000008},
+	{CS35L41_DSP1_RX2_SRC,			0x00000009},
+	{CS35L41_DSP1_RX3_SRC,			0x00000018},
+	{CS35L41_DSP1_RX4_SRC,			0x00000019},
+	{CS35L41_DSP1_RX5_SRC,			0x00000020},
+	{CS35L41_DSP1_RX6_SRC,			0x00000021},
+	{CS35L41_DSP1_RX7_SRC,			0x0000003A},
+	{CS35L41_DSP1_RX8_SRC,			0x00000001},
+	{CS35L41_NGATE1_SRC,			0x00000008},
+	{CS35L41_NGATE2_SRC,			0x00000009},
+	{CS35L41_AMP_DIG_VOL_CTRL,		0x00008000},
+	{CS35L41_CLASSH_CFG,			0x000B0405},
+	{CS35L41_WKFET_CFG,			0x00000111},
+	{CS35L41_NG_CFG,			0x00000033},
+	{CS35L41_AMP_GAIN_CTRL,			0x00000273},
+	{CS35L41_GPIO1_CTRL1,			0xE1000001},
+	{CS35L41_GPIO2_CTRL1,			0xE1000001},
+	{CS35L41_MIXER_NGATE_CFG,		0x00000000},
+	{CS35L41_MIXER_NGATE_CH1_CFG,		0x00000303},
+	{CS35L41_MIXER_NGATE_CH2_CFG,		0x00000303},
+};
+
+bool cs35l41_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case CS35L41_DEVID:
+	case CS35L41_REVID:
+	case CS35L41_FABID:
+	case CS35L41_RELID:
+	case CS35L41_OTPID:
+	case CS35L41_TEST_KEY_CTL:
+	case CS35L41_USER_KEY_CTL:
+	case CS35L41_OTP_CTRL0:
+	case CS35L41_OTP_CTRL3:
+	case CS35L41_OTP_CTRL4:
+	case CS35L41_OTP_CTRL5:
+	case CS35L41_OTP_CTRL6:
+	case CS35L41_OTP_CTRL7:
+	case CS35L41_OTP_CTRL8:
+	case CS35L41_PWR_CTRL1:
+	case CS35L41_PWR_CTRL2:
+	case CS35L41_PWR_CTRL3:
+	case CS35L41_CTRL_OVRRIDE:
+	case CS35L41_AMP_OUT_MUTE:
+	case CS35L41_PROTECT_REL_ERR_IGN:
+	case CS35L41_GPIO_PAD_CONTROL:
+	case CS35L41_JTAG_CONTROL:
+	case CS35L41_PLL_CLK_CTRL:
+	case CS35L41_DSP_CLK_CTRL:
+	case CS35L41_GLOBAL_CLK_CTRL:
+	case CS35L41_DATA_FS_SEL:
+	case CS35L41_MDSYNC_EN:
+	case CS35L41_MDSYNC_TX_ID:
+	case CS35L41_MDSYNC_PWR_CTRL:
+	case CS35L41_MDSYNC_DATA_TX:
+	case CS35L41_MDSYNC_TX_STATUS:
+	case CS35L41_MDSYNC_DATA_RX:
+	case CS35L41_MDSYNC_RX_STATUS:
+	case CS35L41_MDSYNC_ERR_STATUS:
+	case CS35L41_MDSYNC_SYNC_PTE2:
+	case CS35L41_MDSYNC_SYNC_PTE3:
+	case CS35L41_MDSYNC_SYNC_MSM_STATUS:
+	case CS35L41_BSTCVRT_VCTRL1:
+	case CS35L41_BSTCVRT_VCTRL2:
+	case CS35L41_BSTCVRT_PEAK_CUR:
+	case CS35L41_BSTCVRT_SFT_RAMP:
+	case CS35L41_BSTCVRT_COEFF:
+	case CS35L41_BSTCVRT_SLOPE_LBST:
+	case CS35L41_BSTCVRT_SW_FREQ:
+	case CS35L41_BSTCVRT_DCM_CTRL:
+	case CS35L41_BSTCVRT_DCM_MODE_FORCE:
+	case CS35L41_BSTCVRT_OVERVOLT_CTRL:
+	case CS35L41_VI_VOL_POL:
+	case CS35L41_DTEMP_WARN_THLD:
+	case CS35L41_DTEMP_CFG:
+	case CS35L41_DTEMP_EN:
+	case CS35L41_VPVBST_FS_SEL:
+	case CS35L41_SP_ENABLES:
+	case CS35L41_SP_RATE_CTRL:
+	case CS35L41_SP_FORMAT:
+	case CS35L41_SP_HIZ_CTRL:
+	case CS35L41_SP_FRAME_TX_SLOT:
+	case CS35L41_SP_FRAME_RX_SLOT:
+	case CS35L41_SP_TX_WL:
+	case CS35L41_SP_RX_WL:
+	case CS35L41_DAC_PCM1_SRC:
+	case CS35L41_ASP_TX1_SRC:
+	case CS35L41_ASP_TX2_SRC:
+	case CS35L41_ASP_TX3_SRC:
+	case CS35L41_ASP_TX4_SRC:
+	case CS35L41_DSP1_RX1_SRC:
+	case CS35L41_DSP1_RX2_SRC:
+	case CS35L41_DSP1_RX3_SRC:
+	case CS35L41_DSP1_RX4_SRC:
+	case CS35L41_DSP1_RX5_SRC:
+	case CS35L41_DSP1_RX6_SRC:
+	case CS35L41_DSP1_RX7_SRC:
+	case CS35L41_DSP1_RX8_SRC:
+	case CS35L41_NGATE1_SRC:
+	case CS35L41_NGATE2_SRC:
+	case CS35L41_AMP_DIG_VOL_CTRL:
+	case CS35L41_VPBR_CFG:
+	case CS35L41_VBBR_CFG:
+	case CS35L41_VPBR_STATUS:
+	case CS35L41_VBBR_STATUS:
+	case CS35L41_OVERTEMP_CFG:
+	case CS35L41_AMP_ERR_VOL:
+	case CS35L41_VOL_STATUS_TO_DSP:
+	case CS35L41_CLASSH_CFG:
+	case CS35L41_WKFET_CFG:
+	case CS35L41_NG_CFG:
+	case CS35L41_AMP_GAIN_CTRL:
+	case CS35L41_DAC_MSM_CFG:
+	case CS35L41_IRQ1_CFG:
+	case CS35L41_IRQ1_STATUS:
+	case CS35L41_IRQ1_STATUS1:
+	case CS35L41_IRQ1_STATUS2:
+	case CS35L41_IRQ1_STATUS3:
+	case CS35L41_IRQ1_STATUS4:
+	case CS35L41_IRQ1_RAW_STATUS1:
+	case CS35L41_IRQ1_RAW_STATUS2:
+	case CS35L41_IRQ1_RAW_STATUS3:
+	case CS35L41_IRQ1_RAW_STATUS4:
+	case CS35L41_IRQ1_MASK1:
+	case CS35L41_IRQ1_MASK2:
+	case CS35L41_IRQ1_MASK3:
+	case CS35L41_IRQ1_MASK4:
+	case CS35L41_IRQ1_FRC1:
+	case CS35L41_IRQ1_FRC2:
+	case CS35L41_IRQ1_FRC3:
+	case CS35L41_IRQ1_FRC4:
+	case CS35L41_IRQ1_EDGE1:
+	case CS35L41_IRQ1_EDGE4:
+	case CS35L41_IRQ1_POL1:
+	case CS35L41_IRQ1_POL2:
+	case CS35L41_IRQ1_POL3:
+	case CS35L41_IRQ1_POL4:
+	case CS35L41_IRQ1_DB3:
+	case CS35L41_IRQ2_CFG:
+	case CS35L41_IRQ2_STATUS:
+	case CS35L41_IRQ2_STATUS1:
+	case CS35L41_IRQ2_STATUS2:
+	case CS35L41_IRQ2_STATUS3:
+	case CS35L41_IRQ2_STATUS4:
+	case CS35L41_IRQ2_RAW_STATUS1:
+	case CS35L41_IRQ2_RAW_STATUS2:
+	case CS35L41_IRQ2_RAW_STATUS3:
+	case CS35L41_IRQ2_RAW_STATUS4:
+	case CS35L41_IRQ2_MASK1:
+	case CS35L41_IRQ2_MASK2:
+	case CS35L41_IRQ2_MASK3:
+	case CS35L41_IRQ2_MASK4:
+	case CS35L41_IRQ2_FRC1:
+	case CS35L41_IRQ2_FRC2:
+	case CS35L41_IRQ2_FRC3:
+	case CS35L41_IRQ2_FRC4:
+	case CS35L41_IRQ2_EDGE1:
+	case CS35L41_IRQ2_EDGE4:
+	case CS35L41_IRQ2_POL1:
+	case CS35L41_IRQ2_POL2:
+	case CS35L41_IRQ2_POL3:
+	case CS35L41_IRQ2_POL4:
+	case CS35L41_IRQ2_DB3:
+	case CS35L41_GPIO_STATUS1:
+	case CS35L41_GPIO1_CTRL1:
+	case CS35L41_GPIO2_CTRL1:
+	case CS35L41_MIXER_NGATE_CFG:
+	case CS35L41_MIXER_NGATE_CH1_CFG:
+	case CS35L41_MIXER_NGATE_CH2_CFG:
+	case CS35L41_DSP_MBOX_1 ... CS35L41_DSP_VIRT2_MBOX_8:
+	case CS35L41_CLOCK_DETECT_1:
+	case CS35L41_TIMER1_CONTROL:
+	case CS35L41_TIMER1_COUNT_PRESET:
+	case CS35L41_TIMER1_STATUS:
+	case CS35L41_TIMER1_COUNT_READBACK:
+	case CS35L41_TIMER1_DSP_CLK_CFG:
+	case CS35L41_TIMER1_DSP_CLK_STATUS:
+	case CS35L41_TIMER2_CONTROL:
+	case CS35L41_TIMER2_COUNT_PRESET:
+	case CS35L41_TIMER2_STATUS:
+	case CS35L41_TIMER2_COUNT_READBACK:
+	case CS35L41_TIMER2_DSP_CLK_CFG:
+	case CS35L41_TIMER2_DSP_CLK_STATUS:
+	case CS35L41_DFT_JTAG_CONTROL:
+	case CS35L41_DIE_STS1:
+	case CS35L41_DIE_STS2:
+	case CS35L41_TEMP_CAL1:
+	case CS35L41_TEMP_CAL2:
+	case CS35L41_OTP_TRIM_1:
+	case CS35L41_OTP_TRIM_2:
+	case CS35L41_OTP_TRIM_3:
+	case CS35L41_OTP_TRIM_4:
+	case CS35L41_OTP_TRIM_5:
+	case CS35L41_OTP_TRIM_6:
+	case CS35L41_OTP_TRIM_7:
+	case CS35L41_OTP_TRIM_8:
+	case CS35L41_OTP_TRIM_9:
+	case CS35L41_OTP_TRIM_10:
+	case CS35L41_OTP_TRIM_11:
+	case CS35L41_OTP_TRIM_12:
+	case CS35L41_OTP_TRIM_13:
+	case CS35L41_OTP_TRIM_14:
+	case CS35L41_OTP_TRIM_15:
+	case CS35L41_OTP_TRIM_16:
+	case CS35L41_OTP_TRIM_17:
+	case CS35L41_OTP_TRIM_18:
+	case CS35L41_OTP_TRIM_19:
+	case CS35L41_OTP_TRIM_20:
+	case CS35L41_OTP_TRIM_21:
+	case CS35L41_OTP_TRIM_22:
+	case CS35L41_OTP_TRIM_23:
+	case CS35L41_OTP_TRIM_24:
+	case CS35L41_OTP_TRIM_25:
+	case CS35L41_OTP_TRIM_26:
+	case CS35L41_OTP_TRIM_27:
+	case CS35L41_OTP_TRIM_28:
+	case CS35L41_OTP_TRIM_29:
+	case CS35L41_OTP_TRIM_30:
+	case CS35L41_OTP_TRIM_31:
+	case CS35L41_OTP_TRIM_32:
+	case CS35L41_OTP_TRIM_33:
+	case CS35L41_OTP_TRIM_34:
+	case CS35L41_OTP_TRIM_35:
+	case CS35L41_OTP_TRIM_36:
+	case CS35L41_OTP_MEM0 ... CS35L41_OTP_MEM31:
+	/*test regs*/
+	case CS35L41_PLL_OVR:
+	case CS35L41_BST_TEST_DUTY:
+	case CS35L41_DIGPWM_IOCTRL:
+		return true;
+	default:
+		return false;
+	}
+}
+
+bool cs35l41_precious_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case CS35L41_OTP_MEM0 ... CS35L41_OTP_MEM31:
+		return true;
+	default:
+		return false;
+	}
+}
+
+bool cs35l41_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case CS35L41_DEVID:
+	case CS35L41_SFT_RESET:
+	case CS35L41_FABID:
+	case CS35L41_REVID:
+	case CS35L41_DTEMP_EN:
+	case CS35L41_IRQ1_STATUS:
+	case CS35L41_IRQ1_STATUS1:
+	case CS35L41_IRQ1_STATUS2:
+	case CS35L41_IRQ1_STATUS3:
+	case CS35L41_IRQ1_STATUS4:
+	case CS35L41_IRQ1_RAW_STATUS1:
+	case CS35L41_IRQ1_RAW_STATUS2:
+	case CS35L41_IRQ1_RAW_STATUS3:
+	case CS35L41_IRQ1_RAW_STATUS4:
+	case CS35L41_IRQ1_FRC1:
+	case CS35L41_IRQ1_FRC2:
+	case CS35L41_IRQ1_FRC3:
+	case CS35L41_IRQ1_FRC4:
+	case CS35L41_IRQ1_EDGE1:
+	case CS35L41_IRQ1_EDGE4:
+	case CS35L41_IRQ1_POL1:
+	case CS35L41_IRQ1_POL2:
+	case CS35L41_IRQ1_POL3:
+	case CS35L41_IRQ1_POL4:
+	case CS35L41_IRQ1_DB3:
+	case CS35L41_IRQ2_STATUS:
+	case CS35L41_IRQ2_STATUS1:
+	case CS35L41_IRQ2_STATUS2:
+	case CS35L41_IRQ2_STATUS3:
+	case CS35L41_IRQ2_STATUS4:
+	case CS35L41_IRQ2_RAW_STATUS1:
+	case CS35L41_IRQ2_RAW_STATUS2:
+	case CS35L41_IRQ2_RAW_STATUS3:
+	case CS35L41_IRQ2_RAW_STATUS4:
+	case CS35L41_IRQ2_FRC1:
+	case CS35L41_IRQ2_FRC2:
+	case CS35L41_IRQ2_FRC3:
+	case CS35L41_IRQ2_FRC4:
+	case CS35L41_IRQ2_EDGE1:
+	case CS35L41_IRQ2_EDGE4:
+	case CS35L41_IRQ2_POL1:
+	case CS35L41_IRQ2_POL2:
+	case CS35L41_IRQ2_POL3:
+	case CS35L41_IRQ2_POL4:
+	case CS35L41_IRQ2_DB3:
+	case CS35L41_GPIO_STATUS1:
+	case CS35L41_OTP_TRIM_1:
+	case CS35L41_OTP_TRIM_2:
+	case CS35L41_OTP_TRIM_3:
+	case CS35L41_OTP_TRIM_4:
+	case CS35L41_OTP_TRIM_5:
+	case CS35L41_OTP_TRIM_6:
+	case CS35L41_OTP_TRIM_7:
+	case CS35L41_OTP_TRIM_8:
+	case CS35L41_OTP_TRIM_9:
+	case CS35L41_OTP_TRIM_10:
+	case CS35L41_OTP_TRIM_11:
+	case CS35L41_OTP_TRIM_12:
+	case CS35L41_OTP_TRIM_13:
+	case CS35L41_OTP_TRIM_14:
+	case CS35L41_OTP_TRIM_15:
+	case CS35L41_OTP_TRIM_16:
+	case CS35L41_OTP_TRIM_17:
+	case CS35L41_OTP_TRIM_18:
+	case CS35L41_OTP_TRIM_19:
+	case CS35L41_OTP_TRIM_20:
+	case CS35L41_OTP_TRIM_21:
+	case CS35L41_OTP_TRIM_22:
+	case CS35L41_OTP_TRIM_23:
+	case CS35L41_OTP_TRIM_24:
+	case CS35L41_OTP_TRIM_25:
+	case CS35L41_OTP_TRIM_26:
+	case CS35L41_OTP_TRIM_27:
+	case CS35L41_OTP_TRIM_28:
+	case CS35L41_OTP_TRIM_29:
+	case CS35L41_OTP_TRIM_30:
+	case CS35L41_OTP_TRIM_31:
+	case CS35L41_OTP_TRIM_32:
+	case CS35L41_OTP_TRIM_33:
+	case CS35L41_OTP_TRIM_34:
+	case CS35L41_OTP_TRIM_35:
+	case CS35L41_OTP_TRIM_36:
+	case CS35L41_OTP_MEM0 ... CS35L41_OTP_MEM31:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct cs35l41_otp_packed_element_t
+					otp_map_1[CS35L41_NUM_OTP_ELEM] = {
+	/* addr         shift   size */
+	{0x00002030,	0,	4}, /*TRIM_OSC_FREQ_TRIM*/
+	{0x00002030,	7,	1}, /*TRIM_OSC_TRIM_DONE*/
+	{0x0000208c,	24,	6}, /*TST_DIGREG_VREF_TRIM*/
+	{0x00002090,	14,	4}, /*TST_REF_TRIM*/
+	{0x00002090,	10,	4}, /*TST_REF_TEMPCO_TRIM*/
+	{0x0000300C,	11,	4}, /*PLL_LDOA_TST_VREF_TRIM*/
+	{0x0000394C,	23,	2}, /*BST_ATEST_CM_VOFF*/
+	{0x00003950,	0,	7}, /*BST_ATRIM_IADC_OFFSET*/
+	{0x00003950,	8,	7}, /*BST_ATRIM_IADC_GAIN1*/
+	{0x00003950,	16,	8}, /*BST_ATRIM_IPKCOMP_OFFSET1*/
+	{0x00003950,	24,	8}, /*BST_ATRIM_IPKCOMP_GAIN1*/
+	{0x00003954,	0,	7}, /*BST_ATRIM_IADC_OFFSET2*/
+	{0x00003954,	8,	7}, /*BST_ATRIM_IADC_GAIN2*/
+	{0x00003954,	16,	8}, /*BST_ATRIM_IPKCOMP_OFFSET2*/
+	{0x00003954,	24,	8}, /*BST_ATRIM_IPKCOMP_GAIN2*/
+	{0x00003958,	0,	7}, /*BST_ATRIM_IADC_OFFSET3*/
+	{0x00003958,	8,	7}, /*BST_ATRIM_IADC_GAIN3*/
+	{0x00003958,	16,	8}, /*BST_ATRIM_IPKCOMP_OFFSET3*/
+	{0x00003958,	24,	8}, /*BST_ATRIM_IPKCOMP_GAIN3*/
+	{0x0000395C,	0,	7}, /*BST_ATRIM_IADC_OFFSET4*/
+	{0x0000395C,	8,	7}, /*BST_ATRIM_IADC_GAIN4*/
+	{0x0000395C,	16,	8}, /*BST_ATRIM_IPKCOMP_OFFSET4*/
+	{0x0000395C,	24,	8}, /*BST_ATRIM_IPKCOMP_GAIN4*/
+	{0x0000416C,	0,	8}, /*VMON_GAIN_OTP_VAL*/
+	{0x00004160,	0,	7}, /*VMON_OFFSET_OTP_VAL*/
+	{0x0000416C,	8,	8}, /*IMON_GAIN_OTP_VAL*/
+	{0x00004160,	16,	10}, /*IMON_OFFSET_OTP_VAL*/
+	{0x0000416C,	16,	12}, /*VMON_CM_GAIN_OTP_VAL*/
+	{0x0000416C,	28,	1}, /*VMON_CM_GAIN_SIGN_OTP_VAL*/
+	{0x00004170,	0,	6}, /*IMON_CAL_TEMPCO_OTP_VAL*/
+	{0x00004170,	6,	1}, /*IMON_CAL_TEMPCO_SIGN_OTP*/
+	{0x00004170,	8,	6}, /*IMON_CAL_TEMPCO2_OTP_VAL*/
+	{0x00004170,	14,	1}, /*IMON_CAL_TEMPCO2_DN_UPB_OTP_VAL*/
+	{0x00004170,	16,	9}, /*IMON_CAL_TEMPCO_TBASE_OTP_VAL*/
+	{0x00004360,	0,	5}, /*TEMP_GAIN_OTP_VAL*/
+	{0x00004360,	6,	9}, /*TEMP_OFFSET_OTP_VAL*/
+	{0x00004448,	0,	8}, /*VP_SARADC_OFFSET*/
+	{0x00004448,	8,	8}, /*VP_GAIN_INDEX*/
+	{0x00004448,	16,	8}, /*VBST_SARADC_OFFSET*/
+	{0x00004448,	24,	8}, /*VBST_GAIN_INDEX*/
+	{0x0000444C,	0,	3}, /*ANA_SELINVREF*/
+	{0x00006E30,	0,	5}, /*GAIN_ERR_COEFF_0*/
+	{0x00006E30,	8,	5}, /*GAIN_ERR_COEFF_1*/
+	{0x00006E30,	16,	5}, /*GAIN_ERR_COEFF_2*/
+	{0x00006E30,	24,	5}, /*GAIN_ERR_COEFF_3*/
+	{0x00006E34,	0,	5}, /*GAIN_ERR_COEFF_4*/
+	{0x00006E34,	8,	5}, /*GAIN_ERR_COEFF_5*/
+	{0x00006E34,	16,	5}, /*GAIN_ERR_COEFF_6*/
+	{0x00006E34,	24,	5}, /*GAIN_ERR_COEFF_7*/
+	{0x00006E38,	0,	5}, /*GAIN_ERR_COEFF_8*/
+	{0x00006E38,	8,	5}, /*GAIN_ERR_COEFF_9*/
+	{0x00006E38,	16,	5}, /*GAIN_ERR_COEFF_10*/
+	{0x00006E38,	24,	5}, /*GAIN_ERR_COEFF_11*/
+	{0x00006E3C,	0,	5}, /*GAIN_ERR_COEFF_12*/
+	{0x00006E3C,	8,	5}, /*GAIN_ERR_COEFF_13*/
+	{0x00006E3C,	16,	5}, /*GAIN_ERR_COEFF_14*/
+	{0x00006E3C,	24,	5}, /*GAIN_ERR_COEFF_15*/
+	{0x00006E40,	0,	5}, /*GAIN_ERR_COEFF_16*/
+	{0x00006E40,	8,	5}, /*GAIN_ERR_COEFF_17*/
+	{0x00006E40,	16,	5}, /*GAIN_ERR_COEFF_18*/
+	{0x00006E40,	24,	5}, /*GAIN_ERR_COEFF_19*/
+	{0x00006E44,	0,	5}, /*GAIN_ERR_COEFF_20*/
+	{0x00006E48,	0,	10}, /*VOFF_GAIN_0*/
+	{0x00006E48,	10,	10}, /*VOFF_GAIN_1*/
+	{0x00006E48,	20,	10}, /*VOFF_GAIN_2*/
+	{0x00006E4C,	0,	10}, /*VOFF_GAIN_3*/
+	{0x00006E4C,	10,	10}, /*VOFF_GAIN_4*/
+	{0x00006E4C,	20,	10}, /*VOFF_GAIN_5*/
+	{0x00006E50,	0,	10}, /*VOFF_GAIN_6*/
+	{0x00006E50,	10,	10}, /*VOFF_GAIN_7*/
+	{0x00006E50,	20,	10}, /*VOFF_GAIN_8*/
+	{0x00006E54,	0,	10}, /*VOFF_GAIN_9*/
+	{0x00006E54,	10,	10}, /*VOFF_GAIN_10*/
+	{0x00006E54,	20,	10}, /*VOFF_GAIN_11*/
+	{0x00006E58,	0,	10}, /*VOFF_GAIN_12*/
+	{0x00006E58,	10,	10}, /*VOFF_GAIN_13*/
+	{0x00006E58,	20,	10}, /*VOFF_GAIN_14*/
+	{0x00006E5C,	0,	10}, /*VOFF_GAIN_15*/
+	{0x00006E5C,	10,	10}, /*VOFF_GAIN_16*/
+	{0x00006E5C,	20,	10}, /*VOFF_GAIN_17*/
+	{0x00006E60,	0,	10}, /*VOFF_GAIN_18*/
+	{0x00006E60,	10,	10}, /*VOFF_GAIN_19*/
+	{0x00006E60,	20,	10}, /*VOFF_GAIN_20*/
+	{0x00006E64,	0,	10}, /*VOFF_INT1*/
+	{0x00007418,	7,	5}, /*DS_SPK_INT1_CAP_TRIM*/
+	{0x0000741C,	0,	5}, /*DS_SPK_INT2_CAP_TRIM*/
+	{0x0000741C,	11,	4}, /*DS_SPK_LPF_CAP_TRIM*/
+	{0x0000741C,	19,	4}, /*DS_SPK_QUAN_CAP_TRIM*/
+	{0x00007434,	17,	1}, /*FORCE_CAL*/
+	{0x00007434,	18,	7}, /*CAL_OVERRIDE*/
+	{0x00007068,	0,	9}, /*MODIX*/
+	{0x0000410C,	7,	1}, /*VIMON_DLY_NOT_COMB*/
+	{0x0000400C,	0,	7}, /*VIMON_DLY*/
+	{0x00000000,	0,	1}, /*extra bit*/
+	{0x00017040,	0,	8}, /*X_COORDINATE*/
+	{0x00017040,	8,	8}, /*Y_COORDINATE*/
+	{0x00017040,	16,	8}, /*WAFER_ID*/
+	{0x00017040,	24,	8}, /*DVS*/
+	{0x00017044,	0,	24}, /*LOT_NUMBER*/
+};
+
+static const struct cs35l41_otp_packed_element_t
+					otp_map_2[CS35L41_NUM_OTP_ELEM] = {
+	/* addr         shift   size */
+	{0x00002030,	0,	4}, /*TRIM_OSC_FREQ_TRIM*/
+	{0x00002030,	7,	1}, /*TRIM_OSC_TRIM_DONE*/
+	{0x0000208c,	24,	6}, /*TST_DIGREG_VREF_TRIM*/
+	{0x00002090,	14,	4}, /*TST_REF_TRIM*/
+	{0x00002090,	10,	4}, /*TST_REF_TEMPCO_TRIM*/
+	{0x0000300C,	11,	4}, /*PLL_LDOA_TST_VREF_TRIM*/
+	{0x0000394C,	23,	2}, /*BST_ATEST_CM_VOFF*/
+	{0x00003950,	0,	7}, /*BST_ATRIM_IADC_OFFSET*/
+	{0x00003950,	8,	7}, /*BST_ATRIM_IADC_GAIN1*/
+	{0x00003950,	16,	8}, /*BST_ATRIM_IPKCOMP_OFFSET1*/
+	{0x00003950,	24,	8}, /*BST_ATRIM_IPKCOMP_GAIN1*/
+	{0x00003954,	0,	7}, /*BST_ATRIM_IADC_OFFSET2*/
+	{0x00003954,	8,	7}, /*BST_ATRIM_IADC_GAIN2*/
+	{0x00003954,	16,	8}, /*BST_ATRIM_IPKCOMP_OFFSET2*/
+	{0x00003954,	24,	8}, /*BST_ATRIM_IPKCOMP_GAIN2*/
+	{0x00003958,	0,	7}, /*BST_ATRIM_IADC_OFFSET3*/
+	{0x00003958,	8,	7}, /*BST_ATRIM_IADC_GAIN3*/
+	{0x00003958,	16,	8}, /*BST_ATRIM_IPKCOMP_OFFSET3*/
+	{0x00003958,	24,	8}, /*BST_ATRIM_IPKCOMP_GAIN3*/
+	{0x0000395C,	0,	7}, /*BST_ATRIM_IADC_OFFSET4*/
+	{0x0000395C,	8,	7}, /*BST_ATRIM_IADC_GAIN4*/
+	{0x0000395C,	16,	8}, /*BST_ATRIM_IPKCOMP_OFFSET4*/
+	{0x0000395C,	24,	8}, /*BST_ATRIM_IPKCOMP_GAIN4*/
+	{0x0000416C,	0,	8}, /*VMON_GAIN_OTP_VAL*/
+	{0x00004160,	0,	7}, /*VMON_OFFSET_OTP_VAL*/
+	{0x0000416C,	8,	8}, /*IMON_GAIN_OTP_VAL*/
+	{0x00004160,	16,	10}, /*IMON_OFFSET_OTP_VAL*/
+	{0x0000416C,	16,	12}, /*VMON_CM_GAIN_OTP_VAL*/
+	{0x0000416C,	28,	1}, /*VMON_CM_GAIN_SIGN_OTP_VAL*/
+	{0x00004170,	0,	6}, /*IMON_CAL_TEMPCO_OTP_VAL*/
+	{0x00004170,	6,	1}, /*IMON_CAL_TEMPCO_SIGN_OTP*/
+	{0x00004170,	8,	6}, /*IMON_CAL_TEMPCO2_OTP_VAL*/
+	{0x00004170,	14,	1}, /*IMON_CAL_TEMPCO2_DN_UPB_OTP_VAL*/
+	{0x00004170,	16,	9}, /*IMON_CAL_TEMPCO_TBASE_OTP_VAL*/
+	{0x00004360,	0,	5}, /*TEMP_GAIN_OTP_VAL*/
+	{0x00004360,	6,	9}, /*TEMP_OFFSET_OTP_VAL*/
+	{0x00004448,	0,	8}, /*VP_SARADC_OFFSET*/
+	{0x00004448,	8,	8}, /*VP_GAIN_INDEX*/
+	{0x00004448,	16,	8}, /*VBST_SARADC_OFFSET*/
+	{0x00004448,	24,	8}, /*VBST_GAIN_INDEX*/
+	{0x0000444C,	0,	3}, /*ANA_SELINVREF*/
+	{0x00006E30,	0,	5}, /*GAIN_ERR_COEFF_0*/
+	{0x00006E30,	8,	5}, /*GAIN_ERR_COEFF_1*/
+	{0x00006E30,	16,	5}, /*GAIN_ERR_COEFF_2*/
+	{0x00006E30,	24,	5}, /*GAIN_ERR_COEFF_3*/
+	{0x00006E34,	0,	5}, /*GAIN_ERR_COEFF_4*/
+	{0x00006E34,	8,	5}, /*GAIN_ERR_COEFF_5*/
+	{0x00006E34,	16,	5}, /*GAIN_ERR_COEFF_6*/
+	{0x00006E34,	24,	5}, /*GAIN_ERR_COEFF_7*/
+	{0x00006E38,	0,	5}, /*GAIN_ERR_COEFF_8*/
+	{0x00006E38,	8,	5}, /*GAIN_ERR_COEFF_9*/
+	{0x00006E38,	16,	5}, /*GAIN_ERR_COEFF_10*/
+	{0x00006E38,	24,	5}, /*GAIN_ERR_COEFF_11*/
+	{0x00006E3C,	0,	5}, /*GAIN_ERR_COEFF_12*/
+	{0x00006E3C,	8,	5}, /*GAIN_ERR_COEFF_13*/
+	{0x00006E3C,	16,	5}, /*GAIN_ERR_COEFF_14*/
+	{0x00006E3C,	24,	5}, /*GAIN_ERR_COEFF_15*/
+	{0x00006E40,	0,	5}, /*GAIN_ERR_COEFF_16*/
+	{0x00006E40,	8,	5}, /*GAIN_ERR_COEFF_17*/
+	{0x00006E40,	16,	5}, /*GAIN_ERR_COEFF_18*/
+	{0x00006E40,	24,	5}, /*GAIN_ERR_COEFF_19*/
+	{0x00006E44,	0,	5}, /*GAIN_ERR_COEFF_20*/
+	{0x00006E48,	0,	10}, /*VOFF_GAIN_0*/
+	{0x00006E48,	10,	10}, /*VOFF_GAIN_1*/
+	{0x00006E48,	20,	10}, /*VOFF_GAIN_2*/
+	{0x00006E4C,	0,	10}, /*VOFF_GAIN_3*/
+	{0x00006E4C,	10,	10}, /*VOFF_GAIN_4*/
+	{0x00006E4C,	20,	10}, /*VOFF_GAIN_5*/
+	{0x00006E50,	0,	10}, /*VOFF_GAIN_6*/
+	{0x00006E50,	10,	10}, /*VOFF_GAIN_7*/
+	{0x00006E50,	20,	10}, /*VOFF_GAIN_8*/
+	{0x00006E54,	0,	10}, /*VOFF_GAIN_9*/
+	{0x00006E54,	10,	10}, /*VOFF_GAIN_10*/
+	{0x00006E54,	20,	10}, /*VOFF_GAIN_11*/
+	{0x00006E58,	0,	10}, /*VOFF_GAIN_12*/
+	{0x00006E58,	10,	10}, /*VOFF_GAIN_13*/
+	{0x00006E58,	20,	10}, /*VOFF_GAIN_14*/
+	{0x00006E5C,	0,	10}, /*VOFF_GAIN_15*/
+	{0x00006E5C,	10,	10}, /*VOFF_GAIN_16*/
+	{0x00006E5C,	20,	10}, /*VOFF_GAIN_17*/
+	{0x00006E60,	0,	10}, /*VOFF_GAIN_18*/
+	{0x00006E60,	10,	10}, /*VOFF_GAIN_19*/
+	{0x00006E60,	20,	10}, /*VOFF_GAIN_20*/
+	{0x00006E64,	0,	10}, /*VOFF_INT1*/
+	{0x00007418,	7,	5}, /*DS_SPK_INT1_CAP_TRIM*/
+	{0x0000741C,	0,	5}, /*DS_SPK_INT2_CAP_TRIM*/
+	{0x0000741C,	11,	4}, /*DS_SPK_LPF_CAP_TRIM*/
+	{0x0000741C,	19,	4}, /*DS_SPK_QUAN_CAP_TRIM*/
+	{0x00007434,	17,	1}, /*FORCE_CAL*/
+	{0x00007434,	18,	7}, /*CAL_OVERRIDE*/
+	{0x00007068,	0,	9}, /*MODIX*/
+	{0x0000410C,	7,	1}, /*VIMON_DLY_NOT_COMB*/
+	{0x0000400C,	0,	7}, /*VIMON_DLY*/
+	{0x00004000,	11,	1}, /*VMON_POL*/
+	{0x00017040,	0,	8}, /*X_COORDINATE*/
+	{0x00017040,	8,	8}, /*Y_COORDINATE*/
+	{0x00017040,	16,	8}, /*WAFER_ID*/
+	{0x00017040,	24,	8}, /*DVS*/
+	{0x00017044,	0,	24}, /*LOT_NUMBER*/
+};
+
+const struct cs35l41_otp_map_element_t
+				cs35l41_otp_map_map[CS35L41_NUM_OTP_MAPS] = {
+	{
+		.id = 0x01,
+		.map = otp_map_1,
+		.num_elements = CS35L41_NUM_OTP_ELEM,
+		.bit_offset = 16,
+		.word_offset = 2,
+	},
+	{
+		.id = 0x02,
+		.map = otp_map_2,
+		.num_elements = CS35L41_NUM_OTP_ELEM,
+		.bit_offset = 16,
+		.word_offset = 2,
+	},
+	{
+		.id = 0x03,
+		.map = otp_map_2,
+		.num_elements = CS35L41_NUM_OTP_ELEM,
+		.bit_offset = 16,
+		.word_offset = 2,
+	},
+	{
+		.id = 0x06,
+		.map = otp_map_2,
+		.num_elements = CS35L41_NUM_OTP_ELEM,
+		.bit_offset = 16,
+		.word_offset = 2,
+	},
+	{
+		.id = 0x08,
+		.map = otp_map_1,
+		.num_elements = CS35L41_NUM_OTP_ELEM,
+		.bit_offset = 16,
+		.word_offset = 2,
+	},
+};
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
new file mode 100644
index 000000000000..1a1ea8a4f165
--- /dev/null
+++ b/sound/soc/codecs/cs35l41.c
@@ -0,0 +1,1770 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * cs35l41.c -- CS35l41 ALSA SoC audio driver
+ *
+ * Copyright 2017-2021 Cirrus Logic, Inc.
+ *
+ * Author: David Rhodes <david.rhodes@cirrus.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/version.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/delay.h>
+#include <linux/slab.h>
+#include <linux/regulator/consumer.h>
+#include <linux/gpio/consumer.h>
+#include <linux/regmap.h>
+#include <linux/property.h>
+#include <linux/of_device.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <sound/initval.h>
+#include <sound/tlv.h>
+#include <linux/err.h>
+
+#include "cs35l41.h"
+#include <sound/cs35l41.h>
+
+static const char * const cs35l41_supplies[] = {
+	"VA",
+	"VP",
+};
+
+struct cs35l41_pll_sysclk_config {
+	int freq;
+	int clk_cfg;
+};
+
+static const struct cs35l41_pll_sysclk_config cs35l41_pll_sysclk[] = {
+	{ 32768,	0x00 },
+	{ 8000,		0x01 },
+	{ 11025,	0x02 },
+	{ 12000,	0x03 },
+	{ 16000,	0x04 },
+	{ 22050,	0x05 },
+	{ 24000,	0x06 },
+	{ 32000,	0x07 },
+	{ 44100,	0x08 },
+	{ 48000,	0x09 },
+	{ 88200,	0x0A },
+	{ 96000,	0x0B },
+	{ 128000,	0x0C },
+	{ 176400,	0x0D },
+	{ 192000,	0x0E },
+	{ 256000,	0x0F },
+	{ 352800,	0x10 },
+	{ 384000,	0x11 },
+	{ 512000,	0x12 },
+	{ 705600,	0x13 },
+	{ 750000,	0x14 },
+	{ 768000,	0x15 },
+	{ 1000000,	0x16 },
+	{ 1024000,	0x17 },
+	{ 1200000,	0x18 },
+	{ 1411200,	0x19 },
+	{ 1500000,	0x1A },
+	{ 1536000,	0x1B },
+	{ 2000000,	0x1C },
+	{ 2048000,	0x1D },
+	{ 2400000,	0x1E },
+	{ 2822400,	0x1F },
+	{ 3000000,	0x20 },
+	{ 3072000,	0x21 },
+	{ 3200000,	0x22 },
+	{ 4000000,	0x23 },
+	{ 4096000,	0x24 },
+	{ 4800000,	0x25 },
+	{ 5644800,	0x26 },
+	{ 6000000,	0x27 },
+	{ 6144000,	0x28 },
+	{ 6250000,	0x29 },
+	{ 6400000,	0x2A },
+	{ 6500000,	0x2B },
+	{ 6750000,	0x2C },
+	{ 7526400,	0x2D },
+	{ 8000000,	0x2E },
+	{ 8192000,	0x2F },
+	{ 9600000,	0x30 },
+	{ 11289600,	0x31 },
+	{ 12000000,	0x32 },
+	{ 12288000,	0x33 },
+	{ 12500000,	0x34 },
+	{ 12800000,	0x35 },
+	{ 13000000,	0x36 },
+	{ 13500000,	0x37 },
+	{ 19200000,	0x38 },
+	{ 22579200,	0x39 },
+	{ 24000000,	0x3A },
+	{ 24576000,	0x3B },
+	{ 25000000,	0x3C },
+	{ 25600000,	0x3D },
+	{ 26000000,	0x3E },
+	{ 27000000,	0x3F },
+};
+
+struct cs35l41_fs_mon_config {
+	int freq;
+	unsigned int fs1;
+	unsigned int fs2;
+};
+
+static const struct cs35l41_fs_mon_config cs35l41_fs_mon[] = {
+	{ 32768,	2254,	3754 },
+	{ 8000,		9220,	15364 },
+	{ 11025,	6148,	10244 },
+	{ 12000,	6148,	10244 },
+	{ 16000,	4612,	7684 },
+	{ 22050,	3076,	5124 },
+	{ 24000,	3076,	5124 },
+	{ 32000,	2308,	3844 },
+	{ 44100,	1540,	2564 },
+	{ 48000,	1540,	2564 },
+	{ 88200,	772,	1284 },
+	{ 96000,	772,	1284 },
+	{ 128000,	580,	964 },
+	{ 176400,	388,	644 },
+	{ 192000,	388,	644 },
+	{ 256000,	292,	484 },
+	{ 352800,	196,	324 },
+	{ 384000,	196,	324 },
+	{ 512000,	148,	244 },
+	{ 705600,	100,	164 },
+	{ 750000,	100,	164 },
+	{ 768000,	100,	164 },
+	{ 1000000,	76,	124 },
+	{ 1024000,	76,	124 },
+	{ 1200000,	64,	104 },
+	{ 1411200,	52,	84 },
+	{ 1500000,	52,	84 },
+	{ 1536000,	52,	84 },
+	{ 2000000,	40,	64 },
+	{ 2048000,	40,	64 },
+	{ 2400000,	34,	54 },
+	{ 2822400,	28,	44 },
+	{ 3000000,	28,	44 },
+	{ 3072000,	28,	44 },
+	{ 3200000,	27,	42 },
+	{ 4000000,	22,	34 },
+	{ 4096000,	22,	34 },
+	{ 4800000,	19,	29 },
+	{ 5644800,	16,	24 },
+	{ 6000000,	16,	24 },
+	{ 6144000,	16,	24 },
+};
+
+static const unsigned char cs35l41_bst_k1_table[4][5] = {
+	{0x24, 0x32, 0x32, 0x4F, 0x57},
+	{0x24, 0x32, 0x32, 0x4F, 0x57},
+	{0x40, 0x32, 0x32, 0x4F, 0x57},
+	{0x40, 0x32, 0x32, 0x4F, 0x57}
+};
+
+static const unsigned char cs35l41_bst_k2_table[4][5] = {
+	{0x24, 0x49, 0x66, 0xA3, 0xEA},
+	{0x24, 0x49, 0x66, 0xA3, 0xEA},
+	{0x48, 0x49, 0x66, 0xA3, 0xEA},
+	{0x48, 0x49, 0x66, 0xA3, 0xEA}
+};
+
+static const unsigned char cs35l41_bst_slope_table[4] = {
+					0x75, 0x6B, 0x3B, 0x28};
+
+static int cs35l41_get_fs_mon_config_index(int freq)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(cs35l41_fs_mon); i++) {
+		if (cs35l41_fs_mon[i].freq == freq)
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+static const DECLARE_TLV_DB_RANGE(dig_vol_tlv,
+		0, 0, TLV_DB_SCALE_ITEM(TLV_DB_GAIN_MUTE, 0, 1),
+		1, 913, TLV_DB_MINMAX_ITEM(-10200, 1200));
+static DECLARE_TLV_DB_SCALE(amp_gain_tlv, 0, 1, 1);
+
+static const struct snd_kcontrol_new dre_ctrl =
+	SOC_DAPM_SINGLE("Switch", CS35L41_PWR_CTRL3, 20, 1, 0);
+
+static const char * const cs35l41_pcm_sftramp_text[] =  {
+	"Off", ".5ms", "1ms", "2ms", "4ms", "8ms", "15ms", "30ms"};
+
+static SOC_ENUM_SINGLE_DECL(pcm_sft_ramp,
+			    CS35L41_AMP_DIG_VOL_CTRL, 0,
+			    cs35l41_pcm_sftramp_text);
+
+static const char * const cs35l41_pcm_source_texts[] = {"ASP", "DSP"};
+static const unsigned int cs35l41_pcm_source_values[] = {0x08, 0x32};
+static SOC_VALUE_ENUM_SINGLE_DECL(cs35l41_pcm_source_enum,
+				CS35L41_DAC_PCM1_SRC,
+				0, CS35L41_ASP_SOURCE_MASK,
+				cs35l41_pcm_source_texts,
+				cs35l41_pcm_source_values);
+
+static const struct snd_kcontrol_new pcm_source_mux =
+	SOC_DAPM_ENUM("PCM Source", cs35l41_pcm_source_enum);
+
+static const char * const cs35l41_tx_input_texts[] = {"Zero", "ASPRX1",
+							"ASPRX2", "VMON",
+							"IMON", "VPMON",
+							"VBSTMON",
+							"DSPTX1", "DSPTX2"};
+static const unsigned int cs35l41_tx_input_values[] = {0x00,
+						CS35L41_INPUT_SRC_ASPRX1,
+						CS35L41_INPUT_SRC_ASPRX2,
+						CS35L41_INPUT_SRC_VMON,
+						CS35L41_INPUT_SRC_IMON,
+						CS35L41_INPUT_SRC_VPMON,
+						CS35L41_INPUT_SRC_VBSTMON,
+						CS35L41_INPUT_DSP_TX1,
+						CS35L41_INPUT_DSP_TX2};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(cs35l41_asptx1_enum,
+				CS35L41_ASP_TX1_SRC,
+				0, CS35L41_ASP_SOURCE_MASK,
+				cs35l41_tx_input_texts,
+				cs35l41_tx_input_values);
+
+static const struct snd_kcontrol_new asp_tx1_mux =
+	SOC_DAPM_ENUM("ASPTX1 SRC", cs35l41_asptx1_enum);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(cs35l41_asptx2_enum,
+				CS35L41_ASP_TX2_SRC,
+				0, CS35L41_ASP_SOURCE_MASK,
+				cs35l41_tx_input_texts,
+				cs35l41_tx_input_values);
+
+static const struct snd_kcontrol_new asp_tx2_mux =
+	SOC_DAPM_ENUM("ASPTX2 SRC", cs35l41_asptx2_enum);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(cs35l41_asptx3_enum,
+				CS35L41_ASP_TX3_SRC,
+				0, CS35L41_ASP_SOURCE_MASK,
+				cs35l41_tx_input_texts,
+				cs35l41_tx_input_values);
+
+static const struct snd_kcontrol_new asp_tx3_mux =
+	SOC_DAPM_ENUM("ASPTX3 SRC", cs35l41_asptx3_enum);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(cs35l41_asptx4_enum,
+				CS35L41_ASP_TX4_SRC,
+				0, CS35L41_ASP_SOURCE_MASK,
+				cs35l41_tx_input_texts,
+				cs35l41_tx_input_values);
+
+static const struct snd_kcontrol_new asp_tx4_mux =
+	SOC_DAPM_ENUM("ASPTX4 SRC", cs35l41_asptx4_enum);
+
+static const struct snd_kcontrol_new cs35l41_aud_controls[] = {
+	SOC_SINGLE_SX_TLV("Digital PCM Volume", CS35L41_AMP_DIG_VOL_CTRL,
+		      3, 0x4CF, 0x391, dig_vol_tlv),
+	SOC_SINGLE_TLV("AMP PCM Gain", CS35L41_AMP_GAIN_CTRL, 5, 0x14, 0,
+			amp_gain_tlv),
+	SOC_ENUM("PCM Soft Ramp", pcm_sft_ramp),
+};
+
+static const struct cs35l41_otp_map_element_t *cs35l41_find_otp_map(u32 otp_id)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(cs35l41_otp_map_map); i++) {
+		if (cs35l41_otp_map_map[i].id == otp_id)
+			return &cs35l41_otp_map_map[i];
+	}
+
+	return NULL;
+}
+
+static int cs35l41_otp_unpack(void *data)
+{
+	struct cs35l41_private *cs35l41 = data;
+	u32 *otp_mem = NULL;
+	int i;
+	int bit_offset, word_offset;
+	unsigned int bit_sum = 8;
+	u32 otp_val, otp_id_reg;
+	const struct cs35l41_otp_map_element_t *otp_map_match = NULL;
+	const struct cs35l41_otp_packed_element_t *otp_map = NULL;
+	unsigned int orig_spi_freq;
+	int ret;
+
+	otp_mem = kmalloc_array(CS35L41_OTP_SIZE_WORDS, sizeof(*otp_mem),
+							GFP_KERNEL);
+	if (!otp_mem)
+		return -ENOMEM;
+
+	ret = regmap_read(cs35l41->regmap, CS35L41_OTPID, &otp_id_reg);
+	if (ret < 0) {
+		dev_err(cs35l41->dev, "Read OTP ID failed\n");
+		ret = -EINVAL;
+		goto err_otp_unpack;
+	}
+
+	otp_map_match = cs35l41_find_otp_map(otp_id_reg);
+
+	if (otp_map_match == NULL) {
+		dev_err(cs35l41->dev, "OTP Map matching ID %d not found\n",
+				otp_id_reg);
+		ret = -EINVAL;
+		goto err_otp_unpack;
+	}
+
+	if (cs35l41->otp_setup)
+		cs35l41->otp_setup(cs35l41, true, &orig_spi_freq);
+
+	ret = regmap_bulk_read(cs35l41->regmap, CS35L41_OTP_MEM0, otp_mem,
+						CS35L41_OTP_SIZE_WORDS);
+	if (ret < 0) {
+		dev_err(cs35l41->dev, "Read OTP Mem failed\n");
+		ret = -EINVAL;
+		goto err_otp_unpack;
+	}
+
+	if (cs35l41->otp_setup)
+		cs35l41->otp_setup(cs35l41, false, &orig_spi_freq);
+
+	otp_map = otp_map_match->map;
+
+	bit_offset = otp_map_match->bit_offset;
+	word_offset = otp_map_match->word_offset;
+
+	ret = regmap_write(cs35l41->regmap, CS35L41_TEST_KEY_CTL, 0x00000055);
+	if (ret < 0) {
+		dev_err(cs35l41->dev, "Write Unlock key failed 1/2\n");
+		ret = -EINVAL;
+		goto err_otp_unpack;
+	}
+	ret = regmap_write(cs35l41->regmap, CS35L41_TEST_KEY_CTL, 0x000000AA);
+	if (ret < 0) {
+		dev_err(cs35l41->dev, "Write Unlock key failed 2/2\n");
+		ret = -EINVAL;
+		goto err_otp_unpack;
+	}
+
+	for (i = 0; i < otp_map_match->num_elements; i++) {
+		dev_dbg(cs35l41->dev,
+			   "bitoffset= %d, word_offset=%d, bit_sum mod 32=%d\n",
+					 bit_offset, word_offset, bit_sum % 32);
+		if (bit_offset + otp_map[i].size - 1 >= 32) {
+			otp_val = (otp_mem[word_offset] &
+					GENMASK(31, bit_offset)) >>
+					bit_offset;
+			otp_val |= (otp_mem[++word_offset] &
+					GENMASK(bit_offset +
+						otp_map[i].size - 33, 0)) <<
+					(32 - bit_offset);
+			bit_offset += otp_map[i].size - 32;
+		} else {
+
+			otp_val = (otp_mem[word_offset] &
+				GENMASK(bit_offset + otp_map[i].size - 1,
+					bit_offset)) >>	bit_offset;
+			bit_offset += otp_map[i].size;
+		}
+		bit_sum += otp_map[i].size;
+
+		if (bit_offset == 32) {
+			bit_offset = 0;
+			word_offset++;
+		}
+
+		if (otp_map[i].reg != 0) {
+			ret = regmap_update_bits(cs35l41->regmap,
+						otp_map[i].reg,
+						GENMASK(otp_map[i].shift +
+							otp_map[i].size - 1,
+						otp_map[i].shift),
+						otp_val << otp_map[i].shift);
+			if (ret < 0) {
+				dev_err(cs35l41->dev, "Write OTP val failed\n");
+				ret = -EINVAL;
+				goto err_otp_unpack;
+			}
+		}
+	}
+
+	ret = regmap_write(cs35l41->regmap, CS35L41_TEST_KEY_CTL, 0x000000CC);
+	if (ret < 0) {
+		dev_err(cs35l41->dev, "Write Lock key failed 1/2\n");
+		ret = -EINVAL;
+		goto err_otp_unpack;
+	}
+	ret = regmap_write(cs35l41->regmap, CS35L41_TEST_KEY_CTL, 0x00000033);
+	if (ret < 0) {
+		dev_err(cs35l41->dev, "Write Lock key failed 2/2\n");
+		ret = -EINVAL;
+		goto err_otp_unpack;
+	}
+	ret = 0;
+
+err_otp_unpack:
+	kfree(otp_mem);
+	return ret;
+}
+
+static irqreturn_t cs35l41_irq(int irq, void *data)
+{
+	struct cs35l41_private *cs35l41 = data;
+	unsigned int status[4] = {0, 0, 0, 0};
+	unsigned int masks[4] = {0, 0, 0, 0};
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(status); i++) {
+		regmap_read(cs35l41->regmap,
+			    CS35L41_IRQ1_STATUS1 + (i * CS35L41_REGSTRIDE),
+			    &status[i]);
+		regmap_read(cs35l41->regmap,
+			    CS35L41_IRQ1_MASK1 + (i * CS35L41_REGSTRIDE),
+			    &masks[i]);
+	}
+
+	/* Check to see if unmasked bits are active */
+	if (!(status[0] & ~masks[0]) && !(status[1] & ~masks[1]) &&
+		!(status[2] & ~masks[2]) && !(status[3] & ~masks[3]))
+		return IRQ_NONE;
+
+	if (status[3] & CS35L41_OTP_BOOT_DONE) {
+		regmap_update_bits(cs35l41->regmap, CS35L41_IRQ1_MASK4,
+				CS35L41_OTP_BOOT_DONE, CS35L41_OTP_BOOT_DONE);
+	}
+
+	/*
+	 * The following interrupts require a
+	 * protection release cycle to get the
+	 * speaker out of Safe-Mode.
+	 */
+	if (status[0] & CS35L41_AMP_SHORT_ERR) {
+		dev_crit(cs35l41->dev, "Amp short error\n");
+		regmap_write(cs35l41->regmap, CS35L41_IRQ1_STATUS1,
+					CS35L41_AMP_SHORT_ERR);
+		regmap_write(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN, 0);
+		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
+					CS35L41_AMP_SHORT_ERR_RLS,
+					CS35L41_AMP_SHORT_ERR_RLS);
+		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
+					CS35L41_AMP_SHORT_ERR_RLS, 0);
+	}
+
+	if (status[0] & CS35L41_TEMP_WARN) {
+		dev_crit(cs35l41->dev, "Over temperature warning\n");
+		regmap_write(cs35l41->regmap, CS35L41_IRQ1_STATUS1,
+					CS35L41_TEMP_WARN);
+		regmap_write(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN, 0);
+		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
+					CS35L41_TEMP_WARN_ERR_RLS,
+					CS35L41_TEMP_WARN_ERR_RLS);
+		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
+					CS35L41_TEMP_WARN_ERR_RLS, 0);
+	}
+
+	if (status[0] & CS35L41_TEMP_ERR) {
+		dev_crit(cs35l41->dev, "Over temperature error\n");
+		regmap_write(cs35l41->regmap, CS35L41_IRQ1_STATUS1,
+					CS35L41_TEMP_ERR);
+		regmap_write(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN, 0);
+		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
+					CS35L41_TEMP_ERR_RLS,
+					CS35L41_TEMP_ERR_RLS);
+		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
+					CS35L41_TEMP_ERR_RLS, 0);
+	}
+
+	if (status[0] & CS35L41_BST_OVP_ERR) {
+		dev_crit(cs35l41->dev, "VBST Over Voltage error\n");
+		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
+					CS35L41_BST_EN_MASK, 0);
+		regmap_write(cs35l41->regmap, CS35L41_IRQ1_STATUS1,
+					CS35L41_BST_OVP_ERR);
+		regmap_write(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN, 0);
+		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
+					CS35L41_BST_OVP_ERR_RLS,
+					CS35L41_BST_OVP_ERR_RLS);
+		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
+					CS35L41_BST_OVP_ERR_RLS, 0);
+		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
+					CS35L41_BST_EN_MASK,
+					CS35L41_BST_EN_DEFAULT <<
+					CS35L41_BST_EN_SHIFT);
+	}
+
+	if (status[0] & CS35L41_BST_DCM_UVP_ERR) {
+		dev_crit(cs35l41->dev, "DCM VBST Under Voltage Error\n");
+		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
+					CS35L41_BST_EN_MASK, 0);
+		regmap_write(cs35l41->regmap, CS35L41_IRQ1_STATUS1,
+					CS35L41_BST_DCM_UVP_ERR);
+		regmap_write(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN, 0);
+		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
+					CS35L41_BST_UVP_ERR_RLS,
+					CS35L41_BST_UVP_ERR_RLS);
+		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
+					CS35L41_BST_UVP_ERR_RLS, 0);
+		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
+					CS35L41_BST_EN_MASK,
+					CS35L41_BST_EN_DEFAULT <<
+					CS35L41_BST_EN_SHIFT);
+	}
+
+	if (status[0] & CS35L41_BST_SHORT_ERR) {
+		dev_crit(cs35l41->dev, "LBST error: powering off!\n");
+		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
+					CS35L41_BST_EN_MASK, 0);
+		regmap_write(cs35l41->regmap, CS35L41_IRQ1_STATUS1,
+					CS35L41_BST_SHORT_ERR);
+		regmap_write(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN, 0);
+		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
+					CS35L41_BST_SHORT_ERR_RLS,
+					CS35L41_BST_SHORT_ERR_RLS);
+		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
+					CS35L41_BST_SHORT_ERR_RLS, 0);
+		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
+					CS35L41_BST_EN_MASK,
+					CS35L41_BST_EN_DEFAULT <<
+					CS35L41_BST_EN_SHIFT);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static const struct reg_sequence cs35l41_pup_patch[] = {
+	{0x00000040, 0x00000055},
+	{0x00000040, 0x000000AA},
+	{0x00002084, 0x002F1AA0},
+	{0x00000040, 0x000000CC},
+	{0x00000040, 0x00000033},
+};
+
+static const struct reg_sequence cs35l41_pdn_patch[] = {
+	{0x00000040, 0x00000055},
+	{0x00000040, 0x000000AA},
+	{0x00002084, 0x002F1AA3},
+	{0x00000040, 0x000000CC},
+	{0x00000040, 0x00000033},
+};
+
+static int cs35l41_main_amp_event(struct snd_soc_dapm_widget *w,
+		struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct cs35l41_private *cs35l41 =
+		snd_soc_component_get_drvdata(component);
+	int ret = 0;
+	int i;
+	bool pdn;
+	unsigned int val;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		regmap_multi_reg_write_bypassed(cs35l41->regmap,
+					cs35l41_pup_patch,
+					ARRAY_SIZE(cs35l41_pup_patch));
+
+		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL1,
+				CS35L41_GLOBAL_EN_MASK,
+				1 << CS35L41_GLOBAL_EN_SHIFT);
+
+		usleep_range(1000, 1100);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		regmap_read(cs35l41->regmap, CS35L41_PWR_CTRL1, &val);
+		if (val & CS35L41_GLOBAL_EN_MASK) {
+			regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL1,
+					CS35L41_GLOBAL_EN_MASK, 0);
+
+			pdn = false;
+			for (i = 0; i < 100; i++) {
+				regmap_read(cs35l41->regmap,
+					CS35L41_IRQ1_STATUS1,
+					&val);
+				if (val & CS35L41_PDN_DONE_MASK) {
+					pdn = true;
+					break;
+				}
+				usleep_range(1000, 1100);
+			}
+
+			if (!pdn)
+				dev_warn(cs35l41->dev, "PDN failed\n");
+
+			regmap_write(cs35l41->regmap, CS35L41_IRQ1_STATUS1,
+					CS35L41_PDN_DONE_MASK);
+		}
+
+		regmap_multi_reg_write_bypassed(cs35l41->regmap,
+					cs35l41_pdn_patch,
+					ARRAY_SIZE(cs35l41_pdn_patch));
+		break;
+	default:
+		dev_err(cs35l41->dev, "Invalid event = 0x%x\n", event);
+		ret = -EINVAL;
+	}
+	return ret;
+}
+
+static const struct snd_soc_dapm_widget cs35l41_dapm_widgets[] = {
+	SND_SOC_DAPM_OUTPUT("SPK"),
+
+	SND_SOC_DAPM_AIF_IN("ASPRX1", NULL, 0, CS35L41_SP_ENABLES, 16, 0),
+	SND_SOC_DAPM_AIF_IN("ASPRX2", NULL, 0, CS35L41_SP_ENABLES, 17, 0),
+	SND_SOC_DAPM_AIF_OUT("ASPTX1", NULL, 0, CS35L41_SP_ENABLES, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("ASPTX2", NULL, 0, CS35L41_SP_ENABLES, 1, 0),
+	SND_SOC_DAPM_AIF_OUT("ASPTX3", NULL, 0, CS35L41_SP_ENABLES, 2, 0),
+	SND_SOC_DAPM_AIF_OUT("ASPTX4", NULL, 0, CS35L41_SP_ENABLES, 3, 0),
+
+	SND_SOC_DAPM_ADC("VMON ADC", NULL, CS35L41_PWR_CTRL2, 12, 0),
+	SND_SOC_DAPM_ADC("IMON ADC", NULL, CS35L41_PWR_CTRL2, 13, 0),
+	SND_SOC_DAPM_ADC("VPMON ADC", NULL, CS35L41_PWR_CTRL2, 8, 0),
+	SND_SOC_DAPM_ADC("VBSTMON ADC", NULL, CS35L41_PWR_CTRL2, 9, 0),
+	SND_SOC_DAPM_ADC("TEMPMON ADC", NULL, CS35L41_PWR_CTRL2, 10, 0),
+	SND_SOC_DAPM_ADC("CLASS H", NULL, CS35L41_PWR_CTRL3, 4, 0),
+
+	SND_SOC_DAPM_OUT_DRV_E("Main AMP", CS35L41_PWR_CTRL2, 0, 0, NULL, 0,
+				cs35l41_main_amp_event,
+				SND_SOC_DAPM_POST_PMD |	SND_SOC_DAPM_POST_PMU),
+
+	SND_SOC_DAPM_INPUT("VP"),
+	SND_SOC_DAPM_INPUT("VBST"),
+	SND_SOC_DAPM_INPUT("ISENSE"),
+	SND_SOC_DAPM_INPUT("VSENSE"),
+	SND_SOC_DAPM_INPUT("TEMP"),
+
+	SND_SOC_DAPM_MUX("ASP TX1 Source", SND_SOC_NOPM, 0, 0, &asp_tx1_mux),
+	SND_SOC_DAPM_MUX("ASP TX2 Source", SND_SOC_NOPM, 0, 0, &asp_tx2_mux),
+	SND_SOC_DAPM_MUX("ASP TX3 Source", SND_SOC_NOPM, 0, 0, &asp_tx3_mux),
+	SND_SOC_DAPM_MUX("ASP TX4 Source", SND_SOC_NOPM, 0, 0, &asp_tx4_mux),
+	SND_SOC_DAPM_MUX("PCM Source", SND_SOC_NOPM, 0, 0, &pcm_source_mux),
+	SND_SOC_DAPM_SWITCH("DRE", SND_SOC_NOPM, 0, 0, &dre_ctrl),
+};
+
+static const struct snd_soc_dapm_route cs35l41_audio_map[] = {
+
+	{"ASP TX1 Source", "VMON", "VMON ADC"},
+	{"ASP TX1 Source", "IMON", "IMON ADC"},
+	{"ASP TX1 Source", "VPMON", "VPMON ADC"},
+	{"ASP TX1 Source", "VBSTMON", "VBSTMON ADC"},
+	{"ASP TX1 Source", "ASPRX1", "ASPRX1" },
+	{"ASP TX1 Source", "ASPRX2", "ASPRX2" },
+	{"ASP TX2 Source", "VMON", "VMON ADC"},
+	{"ASP TX2 Source", "IMON", "IMON ADC"},
+	{"ASP TX2 Source", "VPMON", "VPMON ADC"},
+	{"ASP TX2 Source", "VBSTMON", "VBSTMON ADC"},
+	{"ASP TX2 Source", "ASPRX1", "ASPRX1" },
+	{"ASP TX2 Source", "ASPRX2", "ASPRX2" },
+	{"ASP TX3 Source", "VMON", "VMON ADC"},
+	{"ASP TX3 Source", "IMON", "IMON ADC"},
+	{"ASP TX3 Source", "VPMON", "VPMON ADC"},
+	{"ASP TX3 Source", "VBSTMON", "VBSTMON ADC"},
+	{"ASP TX3 Source", "ASPRX1", "ASPRX1" },
+	{"ASP TX3 Source", "ASPRX2", "ASPRX2" },
+	{"ASP TX4 Source", "VMON", "VMON ADC"},
+	{"ASP TX4 Source", "IMON", "IMON ADC"},
+	{"ASP TX4 Source", "VPMON", "VPMON ADC"},
+	{"ASP TX4 Source", "VBSTMON", "VBSTMON ADC"},
+	{"ASP TX4 Source", "ASPRX1", "ASPRX1" },
+	{"ASP TX4 Source", "ASPRX2", "ASPRX2" },
+	{"ASPTX1", NULL, "ASP TX1 Source"},
+	{"ASPTX2", NULL, "ASP TX2 Source"},
+	{"ASPTX3", NULL, "ASP TX3 Source"},
+	{"ASPTX4", NULL, "ASP TX4 Source"},
+	{"AMP Capture", NULL, "ASPTX1"},
+	{"AMP Capture", NULL, "ASPTX2"},
+	{"AMP Capture", NULL, "ASPTX3"},
+	{"AMP Capture", NULL, "ASPTX4"},
+
+	{"VMON ADC", NULL, "VSENSE"},
+	{"IMON ADC", NULL, "ISENSE"},
+	{"VPMON ADC", NULL, "VP"},
+	{"TEMPMON ADC", NULL, "TEMP"},
+	{"VBSTMON ADC", NULL, "VBST"},
+
+	{"ASPRX1", NULL, "AMP Playback"},
+	{"ASPRX2", NULL, "AMP Playback"},
+	{"DRE", "Switch", "CLASS H"},
+	{"Main AMP", NULL, "CLASS H"},
+	{"Main AMP", NULL, "DRE"},
+	{"SPK", NULL, "Main AMP"},
+
+	{"PCM Source", "ASP", "ASPRX1"},
+	{"CLASS H", NULL, "PCM Source"},
+
+};
+
+static int cs35l41_set_channel_map(struct snd_soc_dai *dai, unsigned int tx_num,
+				unsigned int *tx_slot, unsigned int rx_num,
+				unsigned int *rx_slot)
+{
+	struct cs35l41_private *cs35l41 =
+			snd_soc_component_get_drvdata(dai->component);
+	int i;
+
+	if (tx_num > 4 || rx_num > 2)
+		return -EINVAL;
+
+	for (i = 0; i < rx_num; i++) {
+		dev_dbg(cs35l41->dev, "%s: rx slot %d position = %d\n",
+				__func__, i, rx_slot[i]);
+		regmap_update_bits(cs35l41->regmap, CS35L41_SP_FRAME_RX_SLOT,
+				0x3F << (i * 8), rx_slot[i] << (i * 8));
+	}
+
+	for (i = 0; i < tx_num; i++) {
+		dev_dbg(cs35l41->dev, "%s: tx slot %d position = %d\n",
+				__func__, i, tx_slot[i]);
+		regmap_update_bits(cs35l41->regmap, CS35L41_SP_FRAME_TX_SLOT,
+				0x3F << (i * 8), tx_slot[i] << (i * 8));
+	}
+
+	return 0;
+}
+
+static int cs35l41_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
+{
+	struct cs35l41_private *cs35l41 =
+			snd_soc_component_get_drvdata(codec_dai->component);
+	unsigned int asp_fmt, lrclk_fmt, sclk_fmt, clock_provider;
+
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
+		clock_provider = 1;
+		break;
+	case SND_SOC_DAIFMT_CBC_CFC:
+		clock_provider = 0;
+		break;
+	default:
+		dev_warn(cs35l41->dev,
+			"%s: Mixed provider/consumer mode unsupported\n",
+								__func__);
+		return -EINVAL;
+	}
+
+	regmap_update_bits(cs35l41->regmap, CS35L41_SP_FORMAT,
+				CS35L41_SCLK_MSTR_MASK,
+				clock_provider << CS35L41_SCLK_MSTR_SHIFT);
+	regmap_update_bits(cs35l41->regmap, CS35L41_SP_FORMAT,
+				CS35L41_LRCLK_MSTR_MASK,
+				clock_provider << CS35L41_LRCLK_MSTR_SHIFT);
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_DSP_A:
+		asp_fmt = 0;
+		cs35l41->i2s_mode = false;
+		break;
+	case SND_SOC_DAIFMT_I2S:
+		asp_fmt = 2;
+		cs35l41->i2s_mode = true;
+		break;
+	default:
+		dev_warn(cs35l41->dev,
+			"%s: Invalid or unsupported DAI format\n", __func__);
+		return -EINVAL;
+	}
+
+	regmap_update_bits(cs35l41->regmap, CS35L41_SP_FORMAT,
+					CS35L41_ASP_FMT_MASK,
+					asp_fmt << CS35L41_ASP_FMT_SHIFT);
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_IF:
+		lrclk_fmt = 1;
+		sclk_fmt = 0;
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		lrclk_fmt = 0;
+		sclk_fmt = 1;
+		break;
+	case SND_SOC_DAIFMT_IB_IF:
+		lrclk_fmt = 1;
+		sclk_fmt = 1;
+		break;
+	case SND_SOC_DAIFMT_NB_NF:
+		lrclk_fmt = 0;
+		sclk_fmt = 0;
+		break;
+	default:
+		dev_warn(cs35l41->dev,
+			"%s: Invalid DAI clock INV\n", __func__);
+		return -EINVAL;
+	}
+
+	regmap_update_bits(cs35l41->regmap, CS35L41_SP_FORMAT,
+				CS35L41_LRCLK_INV_MASK,
+				lrclk_fmt << CS35L41_LRCLK_INV_SHIFT);
+	regmap_update_bits(cs35l41->regmap, CS35L41_SP_FORMAT,
+				CS35L41_SCLK_INV_MASK,
+				sclk_fmt << CS35L41_SCLK_INV_SHIFT);
+
+	return 0;
+}
+
+struct cs35l41_global_fs_config {
+	int rate;
+	int fs_cfg;
+};
+
+static const struct cs35l41_global_fs_config cs35l41_fs_rates[] = {
+	{ 12000,	0x01 },
+	{ 24000,	0x02 },
+	{ 48000,	0x03 },
+	{ 96000,	0x04 },
+	{ 192000,	0x05 },
+	{ 11025,	0x09 },
+	{ 22050,	0x0A },
+	{ 44100,	0x0B },
+	{ 88200,	0x0C },
+	{ 176400,	0x0D },
+	{ 8000,		0x11 },
+	{ 16000,	0x12 },
+	{ 32000,	0x13 },
+};
+
+static int cs35l41_pcm_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params,
+				 struct snd_soc_dai *dai)
+{
+	struct cs35l41_private *cs35l41 =
+			snd_soc_component_get_drvdata(dai->component);
+	int i;
+	unsigned int rate = params_rate(params);
+	u8 asp_wl;
+
+	for (i = 0; i < ARRAY_SIZE(cs35l41_fs_rates); i++) {
+		if (rate == cs35l41_fs_rates[i].rate)
+			break;
+	}
+
+	if (i >= ARRAY_SIZE(cs35l41_fs_rates)) {
+		dev_err(cs35l41->dev, "%s: Unsupported rate: %u\n",
+						__func__, rate);
+		return -EINVAL;
+	}
+
+	asp_wl = params_width(params);
+
+	if (i < ARRAY_SIZE(cs35l41_fs_rates))
+		regmap_update_bits(cs35l41->regmap, CS35L41_GLOBAL_CLK_CTRL,
+			CS35L41_GLOBAL_FS_MASK,
+			cs35l41_fs_rates[i].fs_cfg << CS35L41_GLOBAL_FS_SHIFT);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		regmap_update_bits(cs35l41->regmap, CS35L41_SP_FORMAT,
+				CS35L41_ASP_WIDTH_RX_MASK,
+				asp_wl << CS35L41_ASP_WIDTH_RX_SHIFT);
+		regmap_update_bits(cs35l41->regmap, CS35L41_SP_RX_WL,
+				CS35L41_ASP_RX_WL_MASK,
+				asp_wl << CS35L41_ASP_RX_WL_SHIFT);
+		if (cs35l41->i2s_mode) {
+			regmap_update_bits(cs35l41->regmap,
+					CS35L41_SP_FRAME_RX_SLOT,
+					CS35L41_ASP_RX1_SLOT_MASK,
+					((cs35l41->pdata.right_channel) ? 1 : 0)
+					 << CS35L41_ASP_RX1_SLOT_SHIFT);
+			regmap_update_bits(cs35l41->regmap,
+					CS35L41_SP_FRAME_RX_SLOT,
+					CS35L41_ASP_RX2_SLOT_MASK,
+					((cs35l41->pdata.right_channel) ? 0 : 1)
+					 << CS35L41_ASP_RX2_SLOT_SHIFT);
+		}
+	} else {
+		regmap_update_bits(cs35l41->regmap, CS35L41_SP_FORMAT,
+				CS35L41_ASP_WIDTH_TX_MASK,
+				asp_wl << CS35L41_ASP_WIDTH_TX_SHIFT);
+		regmap_update_bits(cs35l41->regmap, CS35L41_SP_TX_WL,
+				CS35L41_ASP_TX_WL_MASK,
+				asp_wl << CS35L41_ASP_TX_WL_SHIFT);
+	}
+
+	return 0;
+}
+
+static int cs35l41_get_clk_config(int freq)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(cs35l41_pll_sysclk); i++) {
+		if (cs35l41_pll_sysclk[i].freq == freq)
+			return cs35l41_pll_sysclk[i].clk_cfg;
+	}
+
+	return -EINVAL;
+}
+
+static const unsigned int cs35l41_src_rates[] = {
+	8000, 12000, 11025, 16000, 22050, 24000, 32000,
+	44100, 48000, 88200, 96000, 176400, 192000
+};
+
+static const struct snd_pcm_hw_constraint_list cs35l41_constraints = {
+	.count = ARRAY_SIZE(cs35l41_src_rates),
+	.list = cs35l41_src_rates,
+};
+
+static int cs35l41_pcm_startup(struct snd_pcm_substream *substream,
+			       struct snd_soc_dai *dai)
+{
+	if (substream->runtime)
+		return snd_pcm_hw_constraint_list(substream->runtime, 0,
+				SNDRV_PCM_HW_PARAM_RATE, &cs35l41_constraints);
+	return 0;
+}
+
+static int cs35l41_component_set_sysclk(struct snd_soc_component *component,
+				int clk_id, int source, unsigned int freq,
+				int dir)
+{
+	struct cs35l41_private *cs35l41 =
+				       snd_soc_component_get_drvdata(component);
+	int extclk_cfg, clksrc;
+
+	switch (clk_id) {
+	case CS35L41_CLKID_SCLK:
+		clksrc = CS35L41_PLLSRC_SCLK;
+		break;
+	case CS35L41_CLKID_LRCLK:
+		clksrc = CS35L41_PLLSRC_LRCLK;
+		break;
+	case CS35L41_CLKID_MCLK:
+		clksrc = CS35L41_PLLSRC_MCLK;
+		break;
+	default:
+		dev_err(cs35l41->dev, "Invalid CLK Config\n");
+		return -EINVAL;
+	}
+
+	extclk_cfg = cs35l41_get_clk_config(freq);
+
+	if (extclk_cfg < 0) {
+		dev_err(cs35l41->dev, "Invalid CLK Config: %d, freq: %u\n",
+			extclk_cfg, freq);
+		return -EINVAL;
+	}
+
+	regmap_update_bits(cs35l41->regmap, CS35L41_PLL_CLK_CTRL,
+			CS35L41_PLL_OPENLOOP_MASK,
+			1 << CS35L41_PLL_OPENLOOP_SHIFT);
+	regmap_update_bits(cs35l41->regmap, CS35L41_PLL_CLK_CTRL,
+			CS35L41_REFCLK_FREQ_MASK,
+			extclk_cfg << CS35L41_REFCLK_FREQ_SHIFT);
+	regmap_update_bits(cs35l41->regmap, CS35L41_PLL_CLK_CTRL,
+			CS35L41_PLL_CLK_EN_MASK,
+			0 << CS35L41_PLL_CLK_EN_SHIFT);
+	regmap_update_bits(cs35l41->regmap, CS35L41_PLL_CLK_CTRL,
+			CS35L41_PLL_CLK_SEL_MASK, clksrc);
+	regmap_update_bits(cs35l41->regmap, CS35L41_PLL_CLK_CTRL,
+			CS35L41_PLL_OPENLOOP_MASK,
+			0 << CS35L41_PLL_OPENLOOP_SHIFT);
+	regmap_update_bits(cs35l41->regmap, CS35L41_PLL_CLK_CTRL,
+			CS35L41_PLL_CLK_EN_MASK,
+			1 << CS35L41_PLL_CLK_EN_SHIFT);
+
+	return 0;
+}
+
+static int cs35l41_dai_set_sysclk(struct snd_soc_dai *dai,
+					int clk_id, unsigned int freq, int dir)
+{
+	struct cs35l41_private *cs35l41 =
+				  snd_soc_component_get_drvdata(dai->component);
+	int fsIndex;
+	unsigned int fs1_val;
+	unsigned int fs2_val;
+	unsigned int val;
+
+	fsIndex = cs35l41_get_fs_mon_config_index(freq);
+	if (fsIndex < 0) {
+		dev_err(cs35l41->dev, "Invalid CLK Config freq: %u\n", freq);
+		return -EINVAL;
+	}
+
+	dev_dbg(cs35l41->dev, "Set DAI sysclk %d\n", freq);
+	if (freq <= 6144000) {
+		/* Use the lookup table */
+		fs1_val = cs35l41_fs_mon[fsIndex].fs1;
+		fs2_val = cs35l41_fs_mon[fsIndex].fs2;
+	} else {
+		/* Use hard-coded values */
+		fs1_val = 0x10;
+		fs2_val = 0x24;
+	}
+
+	val = fs1_val;
+	val |= (fs2_val << CS35L41_FS2_WINDOW_SHIFT) & CS35L41_FS2_WINDOW_MASK;
+	regmap_write(cs35l41->regmap, CS35L41_TST_FS_MON0, val);
+
+	return 0;
+}
+
+static int cs35l41_boost_config(struct cs35l41_private *cs35l41,
+		int boost_ind, int boost_cap, int boost_ipk)
+{
+	int ret;
+	unsigned char bst_lbst_val, bst_cbst_range, bst_ipk_scaled;
+	struct regmap *regmap = cs35l41->regmap;
+	struct device *dev = cs35l41->dev;
+
+	switch (boost_ind) {
+	case 1000:	/* 1.0 uH */
+		bst_lbst_val = 0;
+		break;
+	case 1200:	/* 1.2 uH */
+		bst_lbst_val = 1;
+		break;
+	case 1500:	/* 1.5 uH */
+		bst_lbst_val = 2;
+		break;
+	case 2200:	/* 2.2 uH */
+		bst_lbst_val = 3;
+		break;
+	default:
+		dev_err(dev, "Invalid boost inductor value: %d nH\n",
+				boost_ind);
+		return -EINVAL;
+	}
+
+	switch (boost_cap) {
+	case 0 ... 19:
+		bst_cbst_range = 0;
+		break;
+	case 20 ... 50:
+		bst_cbst_range = 1;
+		break;
+	case 51 ... 100:
+		bst_cbst_range = 2;
+		break;
+	case 101 ... 200:
+		bst_cbst_range = 3;
+		break;
+	default:	/* 201 uF and greater */
+		bst_cbst_range = 4;
+	}
+
+	ret = regmap_update_bits(regmap, CS35L41_BSTCVRT_COEFF,
+			CS35L41_BST_K1_MASK,
+			cs35l41_bst_k1_table[bst_lbst_val][bst_cbst_range]
+				<< CS35L41_BST_K1_SHIFT);
+	if (ret) {
+		dev_err(dev, "Failed to write boost K1 coefficient\n");
+		return ret;
+	}
+
+	ret = regmap_update_bits(regmap, CS35L41_BSTCVRT_COEFF,
+			CS35L41_BST_K2_MASK,
+			cs35l41_bst_k2_table[bst_lbst_val][bst_cbst_range]
+				<< CS35L41_BST_K2_SHIFT);
+	if (ret) {
+		dev_err(dev, "Failed to write boost K2 coefficient\n");
+		return ret;
+	}
+
+	ret = regmap_update_bits(regmap, CS35L41_BSTCVRT_SLOPE_LBST,
+			CS35L41_BST_SLOPE_MASK,
+			cs35l41_bst_slope_table[bst_lbst_val]
+				<< CS35L41_BST_SLOPE_SHIFT);
+	if (ret) {
+		dev_err(dev, "Failed to write boost slope coefficient\n");
+		return ret;
+	}
+
+	ret = regmap_update_bits(regmap, CS35L41_BSTCVRT_SLOPE_LBST,
+			CS35L41_BST_LBST_VAL_MASK,
+			bst_lbst_val << CS35L41_BST_LBST_VAL_SHIFT);
+	if (ret) {
+		dev_err(dev, "Failed to write boost inductor value\n");
+		return ret;
+	}
+
+	if ((boost_ipk < 1600) || (boost_ipk > 4500)) {
+		dev_err(dev, "Invalid boost inductor peak current: %d mA\n",
+				boost_ipk);
+		return -EINVAL;
+	}
+	bst_ipk_scaled = ((boost_ipk - 1600) / 50) + 0x10;
+
+	ret = regmap_update_bits(regmap, CS35L41_BSTCVRT_PEAK_CUR,
+			CS35L41_BST_IPK_MASK,
+			bst_ipk_scaled << CS35L41_BST_IPK_SHIFT);
+	if (ret) {
+		dev_err(dev, "Failed to write boost inductor peak current\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int cs35l41_set_pdata(struct cs35l41_private *cs35l41)
+{
+	struct cs35l41_classh_cfg *classh = &cs35l41->pdata.classh_config;
+	int ret;
+
+	/* Set Platform Data */
+	/* Required */
+	if (cs35l41->pdata.bst_ipk &&
+			cs35l41->pdata.bst_ind && cs35l41->pdata.bst_cap) {
+		ret = cs35l41_boost_config(cs35l41, cs35l41->pdata.bst_ind,
+					cs35l41->pdata.bst_cap,
+					cs35l41->pdata.bst_ipk);
+		if (ret) {
+			dev_err(cs35l41->dev, "Error in Boost DT config\n");
+			return ret;
+		}
+	} else {
+		dev_err(cs35l41->dev, "Incomplete Boost component DT config\n");
+		return -EINVAL;
+	}
+
+	/* Optional */
+	if (cs35l41->pdata.sclk_frc)
+		regmap_update_bits(cs35l41->regmap, CS35L41_SP_FORMAT,
+				CS35L41_SCLK_FRC_MASK,
+				cs35l41->pdata.sclk_frc <<
+				CS35L41_SCLK_FRC_SHIFT);
+
+	if (cs35l41->pdata.lrclk_frc)
+		regmap_update_bits(cs35l41->regmap, CS35L41_SP_FORMAT,
+				CS35L41_LRCLK_FRC_MASK,
+				cs35l41->pdata.lrclk_frc <<
+				CS35L41_LRCLK_FRC_SHIFT);
+
+	if (cs35l41->pdata.amp_gain_zc)
+		regmap_update_bits(cs35l41->regmap, CS35L41_AMP_GAIN_CTRL,
+				CS35L41_AMP_GAIN_ZC_MASK,
+				cs35l41->pdata.amp_gain_zc <<
+				CS35L41_AMP_GAIN_ZC_SHIFT);
+
+	if (cs35l41->pdata.bst_vctrl)
+		regmap_update_bits(cs35l41->regmap, CS35L41_BSTCVRT_VCTRL1,
+				CS35L41_BST_CTL_MASK, cs35l41->pdata.bst_vctrl);
+
+	if (cs35l41->pdata.temp_warn_thld)
+		regmap_update_bits(cs35l41->regmap, CS35L41_DTEMP_WARN_THLD,
+				CS35L41_TEMP_THLD_MASK,
+				cs35l41->pdata.temp_warn_thld);
+
+	if (cs35l41->pdata.dout_hiz <= CS35L41_ASP_DOUT_HIZ_MASK &&
+	    cs35l41->pdata.dout_hiz >= 0)
+		regmap_update_bits(cs35l41->regmap, CS35L41_SP_HIZ_CTRL,
+				CS35L41_ASP_DOUT_HIZ_MASK,
+				cs35l41->pdata.dout_hiz);
+
+	if (cs35l41->pdata.invert_pcm)
+		regmap_update_bits(cs35l41->regmap, CS35L41_AMP_DIG_VOL_CTRL,
+				CS35L41_AMP_INV_PCM_MASK,
+				cs35l41->pdata.invert_pcm <<
+				CS35L41_AMP_INV_PCM_SHIFT);
+
+	if (cs35l41->pdata.dsp_ng_enable) {
+		regmap_update_bits(cs35l41->regmap,
+				CS35L41_MIXER_NGATE_CH1_CFG,
+				CS35L41_DSP_NG_ENABLE_MASK,
+				CS35L41_DSP_NG_ENABLE_MASK);
+		regmap_update_bits(cs35l41->regmap,
+				CS35L41_MIXER_NGATE_CH2_CFG,
+				CS35L41_DSP_NG_ENABLE_MASK,
+				CS35L41_DSP_NG_ENABLE_MASK);
+
+		if (cs35l41->pdata.dsp_ng_pcm_thld) {
+			regmap_update_bits(cs35l41->regmap,
+				CS35L41_MIXER_NGATE_CH1_CFG,
+				CS35L41_DSP_NG_THLD_MASK,
+				cs35l41->pdata.dsp_ng_pcm_thld);
+			regmap_update_bits(cs35l41->regmap,
+				CS35L41_MIXER_NGATE_CH2_CFG,
+				CS35L41_DSP_NG_THLD_MASK,
+				cs35l41->pdata.dsp_ng_pcm_thld);
+		}
+
+		if (cs35l41->pdata.dsp_ng_delay) {
+			regmap_update_bits(cs35l41->regmap,
+				CS35L41_MIXER_NGATE_CH1_CFG,
+				CS35L41_DSP_NG_DELAY_MASK,
+				cs35l41->pdata.dsp_ng_delay <<
+				CS35L41_DSP_NG_DELAY_SHIFT);
+			regmap_update_bits(cs35l41->regmap,
+				CS35L41_MIXER_NGATE_CH2_CFG,
+				CS35L41_DSP_NG_DELAY_MASK,
+				cs35l41->pdata.dsp_ng_delay <<
+				CS35L41_DSP_NG_DELAY_SHIFT);
+		}
+	}
+
+	if (cs35l41->pdata.hw_ng_sel)
+		regmap_update_bits(cs35l41->regmap,
+				CS35L41_NG_CFG,
+				CS35L41_HW_NG_SEL_MASK,
+				cs35l41->pdata.hw_ng_sel <<
+				CS35L41_HW_NG_SEL_SHIFT);
+
+	if (cs35l41->pdata.hw_ng_thld)
+		regmap_update_bits(cs35l41->regmap,
+				CS35L41_NG_CFG,
+				CS35L41_HW_NG_THLD_MASK,
+				cs35l41->pdata.hw_ng_thld <<
+				CS35L41_HW_NG_THLD_SHIFT);
+
+	if (cs35l41->pdata.hw_ng_delay)
+		regmap_update_bits(cs35l41->regmap,
+				CS35L41_NG_CFG,
+				CS35L41_HW_NG_DLY_MASK,
+				cs35l41->pdata.hw_ng_delay <<
+				CS35L41_HW_NG_DLY_SHIFT);
+
+	if (classh->classh_algo_enable) {
+		if (classh->classh_bst_override)
+			regmap_update_bits(cs35l41->regmap,
+					CS35L41_BSTCVRT_VCTRL2,
+					CS35L41_BST_CTL_SEL_MASK,
+					CS35L41_BST_CTL_SEL_REG);
+		if (classh->classh_bst_max_limit)
+			regmap_update_bits(cs35l41->regmap,
+					CS35L41_BSTCVRT_VCTRL2,
+					CS35L41_BST_LIM_MASK,
+					classh->classh_bst_max_limit <<
+					CS35L41_BST_LIM_SHIFT);
+		if (classh->classh_mem_depth)
+			regmap_update_bits(cs35l41->regmap,
+					CS35L41_CLASSH_CFG,
+					CS35L41_CH_MEM_DEPTH_MASK,
+					classh->classh_mem_depth <<
+					CS35L41_CH_MEM_DEPTH_SHIFT);
+		if (classh->classh_headroom)
+			regmap_update_bits(cs35l41->regmap,
+					CS35L41_CLASSH_CFG,
+					CS35L41_CH_HDRM_CTL_MASK,
+					classh->classh_headroom <<
+					CS35L41_CH_HDRM_CTL_SHIFT);
+		if (classh->classh_release_rate)
+			regmap_update_bits(cs35l41->regmap,
+					CS35L41_CLASSH_CFG,
+					CS35L41_CH_REL_RATE_MASK,
+					classh->classh_release_rate <<
+					CS35L41_CH_REL_RATE_SHIFT);
+		if (classh->classh_wk_fet_delay)
+			regmap_update_bits(cs35l41->regmap,
+					CS35L41_WKFET_CFG,
+					CS35L41_CH_WKFET_DLY_MASK,
+					classh->classh_wk_fet_delay <<
+					CS35L41_CH_WKFET_DLY_SHIFT);
+		if (classh->classh_wk_fet_thld)
+			regmap_update_bits(cs35l41->regmap,
+					CS35L41_WKFET_CFG,
+					CS35L41_CH_WKFET_THLD_MASK,
+					classh->classh_wk_fet_thld <<
+					CS35L41_CH_WKFET_THLD_SHIFT);
+	}
+
+	return 0;
+}
+
+static int cs35l41_component_probe(struct snd_soc_component *component)
+{
+	struct cs35l41_private *cs35l41 =
+		snd_soc_component_get_drvdata(component);
+
+	component->regmap = cs35l41->regmap;
+
+	return cs35l41_set_pdata(cs35l41);
+}
+
+static int cs35l41_irq_gpio_config(struct cs35l41_private *cs35l41)
+{
+	struct cs35l41_irq_cfg *irq_gpio_cfg1 = &cs35l41->pdata.irq_config1;
+	struct cs35l41_irq_cfg *irq_gpio_cfg2 = &cs35l41->pdata.irq_config2;
+	int irq_pol = IRQF_TRIGGER_NONE;
+
+	if (irq_gpio_cfg1->irq_pol_inv)
+		regmap_update_bits(cs35l41->regmap,
+					CS35L41_GPIO1_CTRL1,
+					CS35L41_GPIO_POL_MASK,
+					CS35L41_GPIO_POL_MASK);
+	if (irq_gpio_cfg1->irq_out_en)
+		regmap_update_bits(cs35l41->regmap,
+					CS35L41_GPIO1_CTRL1,
+					CS35L41_GPIO_DIR_MASK,
+					0);
+	if (irq_gpio_cfg1->irq_src_sel)
+		regmap_update_bits(cs35l41->regmap,
+					CS35L41_GPIO_PAD_CONTROL,
+					CS35L41_GPIO1_CTRL_MASK,
+					irq_gpio_cfg1->irq_src_sel <<
+					CS35L41_GPIO1_CTRL_SHIFT);
+
+	if (irq_gpio_cfg2->irq_pol_inv)
+		regmap_update_bits(cs35l41->regmap,
+					CS35L41_GPIO2_CTRL1,
+					CS35L41_GPIO_POL_MASK,
+					CS35L41_GPIO_POL_MASK);
+	if (irq_gpio_cfg2->irq_out_en)
+		regmap_update_bits(cs35l41->regmap,
+					CS35L41_GPIO2_CTRL1,
+					CS35L41_GPIO_DIR_MASK,
+					0);
+	if (irq_gpio_cfg2->irq_src_sel)
+		regmap_update_bits(cs35l41->regmap,
+					CS35L41_GPIO_PAD_CONTROL,
+					CS35L41_GPIO2_CTRL_MASK,
+					irq_gpio_cfg2->irq_src_sel <<
+					CS35L41_GPIO2_CTRL_SHIFT);
+
+	if ((irq_gpio_cfg2->irq_src_sel ==
+			(CS35L41_GPIO_CTRL_ACTV_LO | CS35L41_VALID_PDATA)) ||
+		(irq_gpio_cfg2->irq_src_sel ==
+			(CS35L41_GPIO_CTRL_OPEN_INT | CS35L41_VALID_PDATA)))
+		irq_pol = IRQF_TRIGGER_LOW;
+	else if (irq_gpio_cfg2->irq_src_sel ==
+			(CS35L41_GPIO_CTRL_ACTV_HI | CS35L41_VALID_PDATA))
+		irq_pol = IRQF_TRIGGER_HIGH;
+
+	return irq_pol;
+}
+
+static const struct snd_soc_dai_ops cs35l41_ops = {
+	.startup = cs35l41_pcm_startup,
+	.set_fmt = cs35l41_set_dai_fmt,
+	.hw_params = cs35l41_pcm_hw_params,
+	.set_sysclk = cs35l41_dai_set_sysclk,
+	.set_channel_map = cs35l41_set_channel_map,
+};
+
+static struct snd_soc_dai_driver cs35l41_dai[] = {
+	{
+		.name = "cs35l41-pcm",
+		.id = 0,
+		.playback = {
+			.stream_name = "AMP Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_KNOT,
+			.formats = CS35L41_RX_FORMATS,
+		},
+		.capture = {
+			.stream_name = "AMP Capture",
+			.channels_min = 1,
+			.channels_max = 8,
+			.rates = SNDRV_PCM_RATE_KNOT,
+			.formats = CS35L41_TX_FORMATS,
+		},
+		.ops = &cs35l41_ops,
+		.symmetric_rate = 1,
+	},
+};
+
+static const struct snd_soc_component_driver soc_component_dev_cs35l41 = {
+	.name = "cs35l41-codec",
+	.probe = cs35l41_component_probe,
+
+	.dapm_widgets = cs35l41_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(cs35l41_dapm_widgets),
+	.dapm_routes = cs35l41_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(cs35l41_audio_map),
+
+	.controls = cs35l41_aud_controls,
+	.num_controls = ARRAY_SIZE(cs35l41_aud_controls),
+	.set_sysclk = cs35l41_component_set_sysclk,
+};
+
+
+
+static int cs35l41_handle_pdata(struct device *dev,
+				  struct cs35l41_platform_data *pdata,
+				  struct cs35l41_private *cs35l41)
+{
+	unsigned int val;
+	int ret;
+	struct cs35l41_classh_cfg *classh_config = &pdata->classh_config;
+	struct cs35l41_irq_cfg *irq_gpio1_config = &pdata->irq_config1;
+	struct cs35l41_irq_cfg *irq_gpio2_config = &pdata->irq_config2;
+
+	pdata->right_channel = device_property_read_bool(dev,
+					"cirrus,right-channel-amp");
+	pdata->sclk_frc = device_property_read_bool(dev,
+					"cirrus,sclk-force-output");
+	pdata->lrclk_frc = device_property_read_bool(dev,
+					"cirrus,lrclk-force-output");
+	pdata->amp_gain_zc = device_property_read_bool(dev,
+					"cirrus,amp-gain-zc");
+
+	pdata->invert_pcm = device_property_read_bool(dev,
+					"cirrus,invert-pcm");
+
+	if (device_property_read_u32(dev, "cirrus,temp-warn_threshold", &val) >= 0)
+		pdata->temp_warn_thld = val | CS35L41_VALID_PDATA;
+
+	ret = device_property_read_u32(dev, "cirrus,boost-ctl-millivolt", &val);
+	if (ret >= 0) {
+		if (val < 2550 || val > 11000) {
+			dev_err(dev,
+				"Invalid Boost Voltage %u mV\n", val);
+			return -EINVAL;
+		}
+		pdata->bst_vctrl = ((val - 2550) / 100) + 1;
+	}
+
+	ret = device_property_read_u32(dev, "cirrus,boost-peak-milliamp", &val);
+	if (ret >= 0)
+		pdata->bst_ipk = val;
+
+	ret = device_property_read_u32(dev, "cirrus,boost-ind-nanohenry", &val);
+	if (ret >= 0)
+		pdata->bst_ind = val;
+
+	ret = device_property_read_u32(dev, "cirrus,boost-cap-microfarad", &val);
+	if (ret >= 0)
+		pdata->bst_cap = val;
+
+	ret = device_property_read_u32(dev, "cirrus,asp-sdout-hiz", &val);
+	if (ret >= 0)
+		pdata->dout_hiz = val;
+	else
+		pdata->dout_hiz = -1;
+
+	pdata->dsp_ng_enable = device_property_read_bool(dev,
+					"cirrus,dsp-noise-gate-enable");
+	if (device_property_read_u32(dev,
+				"cirrus,dsp-noise-gate-threshold", &val) >= 0)
+		pdata->dsp_ng_pcm_thld = val | CS35L41_VALID_PDATA;
+	if (device_property_read_u32(dev, "cirrus,dsp-noise-gate-delay", &val) >= 0)
+		pdata->dsp_ng_delay = val | CS35L41_VALID_PDATA;
+
+	if (device_property_read_u32(dev, "cirrus,hw-noise-gate-select", &val) >= 0)
+		pdata->hw_ng_sel = val | CS35L41_VALID_PDATA;
+	if (device_property_read_u32(dev,
+				"cirrus,hw-noise-gate-threshold", &val) >= 0)
+		pdata->hw_ng_thld = val | CS35L41_VALID_PDATA;
+	if (device_property_read_u32(dev, "cirrus,hw-noise-gate-delay", &val) >= 0)
+		pdata->hw_ng_delay = val | CS35L41_VALID_PDATA;
+
+	classh_config->classh_algo_enable =
+				device_property_read_bool(dev, "cirrus,classh-internal-algo");
+
+	if (classh_config->classh_algo_enable) {
+		classh_config->classh_bst_override =
+			device_property_read_bool(dev,
+				"cirrus,classh-bst-override");
+
+		ret = device_property_read_u32(dev,
+					   "cirrus,classh-bst-max-limit",
+					   &val);
+		if (ret >= 0) {
+			val |= CS35L41_VALID_PDATA;
+			classh_config->classh_bst_max_limit = val;
+		}
+
+		ret = device_property_read_u32(dev, "cirrus,classh-mem-depth",
+					   &val);
+		if (ret >= 0) {
+			val |= CS35L41_VALID_PDATA;
+			classh_config->classh_mem_depth = val;
+		}
+
+		ret = device_property_read_u32(dev,
+					"cirrus,classh-release-rate", &val);
+		if (ret >= 0)
+			classh_config->classh_release_rate = val;
+
+		ret = device_property_read_u32(dev, "cirrus,classh-headroom",
+					   &val);
+		if (ret >= 0) {
+			val |= CS35L41_VALID_PDATA;
+			classh_config->classh_headroom = val;
+		}
+
+		ret = device_property_read_u32(dev,
+					"cirrus,classh-wk-fet-delay", &val);
+		if (ret >= 0) {
+			val |= CS35L41_VALID_PDATA;
+			classh_config->classh_wk_fet_delay = val;
+		}
+
+		ret = device_property_read_u32(dev,
+					"cirrus,classh-wk-fet-thld", &val);
+		if (ret >= 0)
+			classh_config->classh_wk_fet_thld = val;
+	}
+
+	/* GPIO1 Pin Config */
+	irq_gpio1_config->irq_pol_inv = device_property_read_bool(dev,
+					"cirrus,gpio1-polarity-invert");
+	irq_gpio1_config->irq_out_en = device_property_read_bool(dev,
+					"cirrus,gpio1-output-enable");
+	ret = device_property_read_u32(dev, "cirrus,gpio1-src-select",
+				&val);
+	if (ret >= 0) {
+		val |= CS35L41_VALID_PDATA;
+		irq_gpio1_config->irq_src_sel = val;
+	}
+
+	/* GPIO2 Pin Config */
+	irq_gpio2_config->irq_pol_inv = device_property_read_bool(dev,
+					"cirrus,gpio2-polarity-invert");
+	irq_gpio2_config->irq_out_en = device_property_read_bool(dev,
+					"cirrus,gpio2-output-enable");
+	ret = device_property_read_u32(dev, "cirrus,gpio2-src-select",
+				&val);
+	if (ret >= 0) {
+		val |= CS35L41_VALID_PDATA;
+		irq_gpio2_config->irq_src_sel = val;
+	}
+
+	return 0;
+}
+
+static const struct reg_sequence cs35l41_reva0_errata_patch[] = {
+	{0x00000040,			0x00005555},
+	{0x00000040,			0x0000AAAA},
+	{0x00003854,			0x05180240},
+	{CS35L41_VIMON_SPKMON_RESYNC,	0x00000000},
+	{0x00004310,			0x00000000},
+	{CS35L41_VPVBST_FS_SEL,		0x00000000},
+	{CS35L41_OTP_TRIM_30,		0x9091A1C8},
+	{0x00003014,			0x0200EE0E},
+	{CS35L41_BSTCVRT_DCM_CTRL,	0x00000051},
+	{0x00000054,			0x00000004},
+	{CS35L41_IRQ1_DB3,		0x00000000},
+	{CS35L41_IRQ2_DB3,		0x00000000},
+	{CS35L41_DSP1_YM_ACCEL_PL0_PRI,	0x00000000},
+	{CS35L41_DSP1_XM_ACCEL_PL0_PRI,	0x00000000},
+	{0x00000040,			0x0000CCCC},
+	{0x00000040,			0x00003333},
+};
+
+static const struct reg_sequence cs35l41_revb0_errata_patch[] = {
+	{0x00000040,			0x00005555},
+	{0x00000040,			0x0000AAAA},
+	{CS35L41_VIMON_SPKMON_RESYNC,	0x00000000},
+	{0x00004310,			0x00000000},
+	{CS35L41_VPVBST_FS_SEL,		0x00000000},
+	{CS35L41_BSTCVRT_DCM_CTRL,	0x00000051},
+	{CS35L41_DSP1_YM_ACCEL_PL0_PRI,	0x00000000},
+	{CS35L41_DSP1_XM_ACCEL_PL0_PRI,	0x00000000},
+	{0x00000040,			0x0000CCCC},
+	{0x00000040,			0x00003333},
+};
+
+static const struct reg_sequence cs35l41_revb2_errata_patch[] = {
+	{0x00000040,			0x00005555},
+	{0x00000040,			0x0000AAAA},
+	{CS35L41_VIMON_SPKMON_RESYNC,	0x00000000},
+	{0x00004310,			0x00000000},
+	{CS35L41_VPVBST_FS_SEL,		0x00000000},
+	{CS35L41_BSTCVRT_DCM_CTRL,	0x00000051},
+	{CS35L41_DSP1_YM_ACCEL_PL0_PRI,	0x00000000},
+	{CS35L41_DSP1_XM_ACCEL_PL0_PRI,	0x00000000},
+	{0x00000040,			0x0000CCCC},
+	{0x00000040,			0x00003333},
+};
+
+int cs35l41_probe(struct cs35l41_private *cs35l41,
+				struct cs35l41_platform_data *pdata)
+{
+	int ret;
+	u32 regid, reg_revid, i, mtl_revid, int_status, chipid_match;
+	int timeout = 100;
+	int irq_pol = 0;
+
+
+	for (i = 0; i < ARRAY_SIZE(cs35l41_supplies); i++)
+		cs35l41->supplies[i].supply = cs35l41_supplies[i];
+
+	cs35l41->num_supplies = ARRAY_SIZE(cs35l41_supplies);
+
+	ret = devm_regulator_bulk_get(cs35l41->dev, cs35l41->num_supplies,
+					cs35l41->supplies);
+	if (ret != 0) {
+		dev_err(cs35l41->dev,
+			"Failed to request core supplies: %d\n",
+			ret);
+		return ret;
+	}
+
+	if (pdata) {
+		cs35l41->pdata = *pdata;
+	} else {
+		ret = cs35l41_handle_pdata(cs35l41->dev, &cs35l41->pdata,
+					     cs35l41);
+		if (ret != 0) {
+			ret = -ENODEV;
+			goto err;
+		}
+	}
+
+	ret = regulator_bulk_enable(cs35l41->num_supplies, cs35l41->supplies);
+	if (ret != 0) {
+		dev_err(cs35l41->dev,
+			"Failed to enable core supplies: %d\n", ret);
+		return ret;
+	}
+
+	/* returning NULL can be an option if in stereo mode */
+	cs35l41->reset_gpio = devm_gpiod_get_optional(cs35l41->dev, "reset",
+							GPIOD_OUT_LOW);
+	if (IS_ERR(cs35l41->reset_gpio)) {
+		ret = PTR_ERR(cs35l41->reset_gpio);
+		cs35l41->reset_gpio = NULL;
+		if (ret == -EBUSY) {
+			dev_info(cs35l41->dev,
+				 "Reset line busy, assuming shared reset\n");
+		} else {
+			dev_err(cs35l41->dev,
+				"Failed to get reset GPIO: %d\n", ret);
+			goto err;
+		}
+	}
+	if (cs35l41->reset_gpio) {
+		/* satisfy minimum reset pulse width spec */
+		usleep_range(2000, 2100);
+		gpiod_set_value_cansleep(cs35l41->reset_gpio, 1);
+	}
+
+	usleep_range(2000, 2100);
+
+	do {
+		if (timeout == 0) {
+			dev_err(cs35l41->dev,
+				"Timeout waiting for OTP_BOOT_DONE\n");
+			ret = -EBUSY;
+			goto err;
+		}
+		usleep_range(1000, 1100);
+		regmap_read(cs35l41->regmap, CS35L41_IRQ1_STATUS4, &int_status);
+		timeout--;
+	} while (!(int_status & CS35L41_OTP_BOOT_DONE));
+
+	regmap_read(cs35l41->regmap, CS35L41_IRQ1_STATUS3, &int_status);
+	if (int_status & CS35L41_OTP_BOOT_ERR) {
+		dev_err(cs35l41->dev, "OTP Boot error\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	ret = regmap_read(cs35l41->regmap, CS35L41_DEVID, &regid);
+	if (ret < 0) {
+		dev_err(cs35l41->dev, "Get Device ID failed\n");
+		goto err;
+	}
+
+	ret = regmap_read(cs35l41->regmap, CS35L41_REVID, &reg_revid);
+	if (ret < 0) {
+		dev_err(cs35l41->dev, "Get Revision ID failed\n");
+		goto err;
+	}
+
+	mtl_revid = reg_revid & CS35L41_MTLREVID_MASK;
+
+	/* CS35L41 will have even MTLREVID
+	 * CS35L41R will have odd MTLREVID
+	 */
+	chipid_match = (mtl_revid % 2) ? CS35L41R_CHIP_ID : CS35L41_CHIP_ID;
+	if (regid != chipid_match) {
+		dev_err(cs35l41->dev, "CS35L41 Device ID (%X). Expected ID %X\n",
+			regid, chipid_match);
+		ret = -ENODEV;
+		goto err;
+	}
+
+	irq_pol = cs35l41_irq_gpio_config(cs35l41);
+
+	ret = devm_request_threaded_irq(cs35l41->dev, cs35l41->irq, NULL,
+			cs35l41_irq, IRQF_ONESHOT | IRQF_SHARED | irq_pol,
+			"cs35l41", cs35l41);
+
+	/* CS35L41 needs INT for PDN_DONE */
+	if (ret != 0) {
+		dev_err(cs35l41->dev, "Failed to request IRQ: %d\n", ret);
+		ret = -ENODEV;
+		goto err;
+	}
+
+	/* Set interrupt masks for critical errors */
+	regmap_write(cs35l41->regmap, CS35L41_IRQ1_MASK1,
+			CS35L41_INT1_MASK_DEFAULT);
+
+	switch (reg_revid) {
+	case CS35L41_REVID_A0:
+		ret = regmap_register_patch(cs35l41->regmap,
+				cs35l41_reva0_errata_patch,
+				ARRAY_SIZE(cs35l41_reva0_errata_patch));
+		if (ret < 0) {
+			dev_err(cs35l41->dev,
+				"Failed to apply A0 errata patch %d\n", ret);
+			goto err;
+		}
+		break;
+	case CS35L41_REVID_B0:
+		ret = regmap_register_patch(cs35l41->regmap,
+				cs35l41_revb0_errata_patch,
+				ARRAY_SIZE(cs35l41_revb0_errata_patch));
+		if (ret < 0) {
+			dev_err(cs35l41->dev,
+				"Failed to apply B0 errata patch %d\n", ret);
+			goto err;
+		}
+		break;
+	case CS35L41_REVID_B2:
+		ret = regmap_register_patch(cs35l41->regmap,
+				cs35l41_revb2_errata_patch,
+				ARRAY_SIZE(cs35l41_revb2_errata_patch));
+		if (ret < 0) {
+			dev_err(cs35l41->dev,
+				"Failed to apply B2 errata patch %d\n", ret);
+			goto err;
+		}
+		break;
+	}
+
+	ret = cs35l41_otp_unpack(cs35l41);
+	if (ret < 0) {
+		dev_err(cs35l41->dev, "OTP Unpack failed\n");
+		goto err;
+	}
+
+	ret = regmap_write(cs35l41->regmap, CS35L41_DSP1_CCM_CORE_CTRL, 0);
+	if (ret < 0) {
+		dev_err(cs35l41->dev, "Write CCM_CORE_CTRL failed\n");
+		goto err;
+	}
+
+	ret = devm_snd_soc_register_component(cs35l41->dev,
+					&soc_component_dev_cs35l41,
+					cs35l41_dai, ARRAY_SIZE(cs35l41_dai));
+	if (ret < 0) {
+		dev_err(cs35l41->dev, "%s: Register codec failed\n", __func__);
+		goto err;
+	}
+
+	dev_info(cs35l41->dev, "Cirrus Logic CS35L41 (%x), Revision: %02X\n",
+			regid, reg_revid);
+
+	return 0;
+
+err:
+	regulator_bulk_disable(cs35l41->num_supplies, cs35l41->supplies);
+	gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
+	return ret;
+}
+
+int cs35l41_remove(struct cs35l41_private *cs35l41)
+{
+	regmap_write(cs35l41->regmap, CS35L41_IRQ1_MASK1, 0xFFFFFFFF);
+	regulator_bulk_disable(cs35l41->num_supplies, cs35l41->supplies);
+	gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
+	return 0;
+}
+
+MODULE_DESCRIPTION("ASoC CS35L41 driver");
+MODULE_AUTHOR("David Rhodes, Cirrus Logic Inc, <david.rhodes@cirrus.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/cs35l41.h b/sound/soc/codecs/cs35l41.h
new file mode 100644
index 000000000000..57af9d67ba72
--- /dev/null
+++ b/sound/soc/codecs/cs35l41.h
@@ -0,0 +1,755 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * cs35l41.h -- CS35L41 ALSA SoC audio driver
+ *
+ * Copyright 2017-2021 Cirrus Logic, Inc.
+ *
+ * Author: David Rhodes <david.rhodes@cirrus.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#ifndef __CS35L41_H__
+#define __CS35L41_H__
+
+#include <linux/regmap.h>
+
+#define CS35L41_FIRSTREG		0x00000000
+#define CS35L41_LASTREG			0x03804FE8
+#define CS35L41_DEVID			0x00000000
+#define CS35L41_REVID			0x00000004
+#define CS35L41_FABID			0x00000008
+#define CS35L41_RELID			0x0000000C
+#define CS35L41_OTPID			0x00000010
+#define CS35L41_SFT_RESET		0x00000020
+#define CS35L41_TEST_KEY_CTL		0x00000040
+#define CS35L41_USER_KEY_CTL		0x00000044
+#define CS35L41_OTP_MEM0		0x00000400
+#define CS35L41_OTP_MEM31		0x0000047C
+#define CS35L41_OTP_CTRL0		0x00000500
+#define CS35L41_OTP_CTRL1		0x00000504
+#define CS35L41_OTP_CTRL3		0x00000508
+#define CS35L41_OTP_CTRL4		0x0000050C
+#define CS35L41_OTP_CTRL5		0x00000510
+#define CS35L41_OTP_CTRL6		0x00000514
+#define CS35L41_OTP_CTRL7		0x00000518
+#define CS35L41_OTP_CTRL8		0x0000051C
+#define CS35L41_PWR_CTRL1		0x00002014
+#define CS35L41_PWR_CTRL2		0x00002018
+#define CS35L41_PWR_CTRL3		0x0000201C
+#define CS35L41_CTRL_OVRRIDE		0x00002020
+#define CS35L41_AMP_OUT_MUTE		0x00002024
+#define CS35L41_PROTECT_REL_ERR_IGN	0x00002034
+#define CS35L41_GPIO_PAD_CONTROL	0x0000242C
+#define CS35L41_JTAG_CONTROL		0x00002438
+#define CS35L41_PLL_CLK_CTRL		0x00002C04
+#define CS35L41_DSP_CLK_CTRL		0x00002C08
+#define CS35L41_GLOBAL_CLK_CTRL		0x00002C0C
+#define CS35L41_DATA_FS_SEL		0x00002C10
+#define CS35L41_TST_FS_MON0		0x00002D10
+#define CS35L41_MDSYNC_EN		0x00003400
+#define CS35L41_MDSYNC_TX_ID		0x00003408
+#define CS35L41_MDSYNC_PWR_CTRL		0x0000340C
+#define CS35L41_MDSYNC_DATA_TX		0x00003410
+#define CS35L41_MDSYNC_TX_STATUS	0x00003414
+#define CS35L41_MDSYNC_DATA_RX		0x0000341C
+#define CS35L41_MDSYNC_RX_STATUS	0x00003420
+#define CS35L41_MDSYNC_ERR_STATUS	0x00003424
+#define CS35L41_MDSYNC_SYNC_PTE2	0x00003528
+#define CS35L41_MDSYNC_SYNC_PTE3	0x0000352C
+#define CS35L41_MDSYNC_SYNC_MSM_STATUS	0x0000353C
+#define CS35L41_BSTCVRT_VCTRL1		0x00003800
+#define CS35L41_BSTCVRT_VCTRL2		0x00003804
+#define CS35L41_BSTCVRT_PEAK_CUR	0x00003808
+#define CS35L41_BSTCVRT_SFT_RAMP	0x0000380C
+#define CS35L41_BSTCVRT_COEFF		0x00003810
+#define CS35L41_BSTCVRT_SLOPE_LBST	0x00003814
+#define CS35L41_BSTCVRT_SW_FREQ		0x00003818
+#define CS35L41_BSTCVRT_DCM_CTRL	0x0000381C
+#define CS35L41_BSTCVRT_DCM_MODE_FORCE	0x00003820
+#define CS35L41_BSTCVRT_OVERVOLT_CTRL	0x00003830
+#define CS35L41_VI_VOL_POL		0x00004000
+#define CS35L41_VIMON_SPKMON_RESYNC	0x00004100
+#define CS35L41_DTEMP_WARN_THLD		0x00004220
+#define CS35L41_DTEMP_CFG		0x00004224
+#define CS35L41_DTEMP_EN		0x00004308
+#define CS35L41_VPVBST_FS_SEL		0x00004400
+#define CS35L41_SP_ENABLES		0x00004800
+#define CS35L41_SP_RATE_CTRL		0x00004804
+#define CS35L41_SP_FORMAT		0x00004808
+#define CS35L41_SP_HIZ_CTRL		0x0000480C
+#define CS35L41_SP_FRAME_TX_SLOT	0x00004810
+#define CS35L41_SP_FRAME_RX_SLOT	0x00004820
+#define CS35L41_SP_TX_WL		0x00004830
+#define CS35L41_SP_RX_WL		0x00004840
+#define CS35L41_ASP_CONTROL4		0x00004854
+#define CS35L41_DAC_PCM1_SRC		0x00004C00
+#define CS35L41_ASP_TX1_SRC		0x00004C20
+#define CS35L41_ASP_TX2_SRC		0x00004C24
+#define CS35L41_ASP_TX3_SRC		0x00004C28
+#define CS35L41_ASP_TX4_SRC		0x00004C2C
+#define CS35L41_DSP1_RX1_SRC		0x00004C40
+#define CS35L41_DSP1_RX2_SRC		0x00004C44
+#define CS35L41_DSP1_RX3_SRC		0x00004C48
+#define CS35L41_DSP1_RX4_SRC		0x00004C4C
+#define CS35L41_DSP1_RX5_SRC		0x00004C50
+#define CS35L41_DSP1_RX6_SRC		0x00004C54
+#define CS35L41_DSP1_RX7_SRC		0x00004C58
+#define CS35L41_DSP1_RX8_SRC		0x00004C5C
+#define CS35L41_NGATE1_SRC		0x00004C60
+#define CS35L41_NGATE2_SRC		0x00004C64
+#define CS35L41_AMP_DIG_VOL_CTRL	0x00006000
+#define CS35L41_VPBR_CFG		0x00006404
+#define CS35L41_VBBR_CFG		0x00006408
+#define CS35L41_VPBR_STATUS		0x0000640C
+#define CS35L41_VBBR_STATUS		0x00006410
+#define CS35L41_OVERTEMP_CFG		0x00006414
+#define CS35L41_AMP_ERR_VOL		0x00006418
+#define CS35L41_VOL_STATUS_TO_DSP	0x00006450
+#define CS35L41_CLASSH_CFG		0x00006800
+#define CS35L41_WKFET_CFG		0x00006804
+#define CS35L41_NG_CFG			0x00006808
+#define CS35L41_AMP_GAIN_CTRL		0x00006C04
+#define CS35L41_DAC_MSM_CFG		0x00007400
+#define CS35L41_IRQ1_CFG		0x00010000
+#define CS35L41_IRQ1_STATUS		0x00010004
+#define CS35L41_IRQ1_STATUS1		0x00010010
+#define CS35L41_IRQ1_STATUS2		0x00010014
+#define CS35L41_IRQ1_STATUS3		0x00010018
+#define CS35L41_IRQ1_STATUS4		0x0001001C
+#define CS35L41_IRQ1_RAW_STATUS1	0x00010090
+#define CS35L41_IRQ1_RAW_STATUS2	0x00010094
+#define CS35L41_IRQ1_RAW_STATUS3	0x00010098
+#define CS35L41_IRQ1_RAW_STATUS4	0x0001009C
+#define CS35L41_IRQ1_MASK1		0x00010110
+#define CS35L41_IRQ1_MASK2		0x00010114
+#define CS35L41_IRQ1_MASK3		0x00010118
+#define CS35L41_IRQ1_MASK4		0x0001011C
+#define CS35L41_IRQ1_FRC1		0x00010190
+#define CS35L41_IRQ1_FRC2		0x00010194
+#define CS35L41_IRQ1_FRC3		0x00010198
+#define CS35L41_IRQ1_FRC4		0x0001019C
+#define CS35L41_IRQ1_EDGE1		0x00010210
+#define CS35L41_IRQ1_EDGE4		0x0001021C
+#define CS35L41_IRQ1_POL1		0x00010290
+#define CS35L41_IRQ1_POL2		0x00010294
+#define CS35L41_IRQ1_POL3		0x00010298
+#define CS35L41_IRQ1_POL4		0x0001029C
+#define CS35L41_IRQ1_DB3		0x00010318
+#define CS35L41_IRQ2_CFG		0x00010800
+#define CS35L41_IRQ2_STATUS		0x00010804
+#define CS35L41_IRQ2_STATUS1		0x00010810
+#define CS35L41_IRQ2_STATUS2		0x00010814
+#define CS35L41_IRQ2_STATUS3		0x00010818
+#define CS35L41_IRQ2_STATUS4		0x0001081C
+#define CS35L41_IRQ2_RAW_STATUS1	0x00010890
+#define CS35L41_IRQ2_RAW_STATUS2	0x00010894
+#define CS35L41_IRQ2_RAW_STATUS3	0x00010898
+#define CS35L41_IRQ2_RAW_STATUS4	0x0001089C
+#define CS35L41_IRQ2_MASK1		0x00010910
+#define CS35L41_IRQ2_MASK2		0x00010914
+#define CS35L41_IRQ2_MASK3		0x00010918
+#define CS35L41_IRQ2_MASK4		0x0001091C
+#define CS35L41_IRQ2_FRC1		0x00010990
+#define CS35L41_IRQ2_FRC2		0x00010994
+#define CS35L41_IRQ2_FRC3		0x00010998
+#define CS35L41_IRQ2_FRC4		0x0001099C
+#define CS35L41_IRQ2_EDGE1		0x00010A10
+#define CS35L41_IRQ2_EDGE4		0x00010A1C
+#define CS35L41_IRQ2_POL1		0x00010A90
+#define CS35L41_IRQ2_POL2		0x00010A94
+#define CS35L41_IRQ2_POL3		0x00010A98
+#define CS35L41_IRQ2_POL4		0x00010A9C
+#define CS35L41_IRQ2_DB3		0x00010B18
+#define CS35L41_GPIO_STATUS1		0x00011000
+#define CS35L41_GPIO1_CTRL1		0x00011008
+#define CS35L41_GPIO2_CTRL1		0x0001100C
+#define CS35L41_MIXER_NGATE_CFG		0x00012000
+#define CS35L41_MIXER_NGATE_CH1_CFG	0x00012004
+#define CS35L41_MIXER_NGATE_CH2_CFG	0x00012008
+#define CS35L41_DSP_MBOX_1		0x00013000
+#define CS35L41_DSP_MBOX_2		0x00013004
+#define CS35L41_DSP_MBOX_3		0x00013008
+#define CS35L41_DSP_MBOX_4		0x0001300C
+#define CS35L41_DSP_MBOX_5		0x00013010
+#define CS35L41_DSP_MBOX_6		0x00013014
+#define CS35L41_DSP_MBOX_7		0x00013018
+#define CS35L41_DSP_MBOX_8		0x0001301C
+#define CS35L41_DSP_VIRT1_MBOX_1	0x00013020
+#define CS35L41_DSP_VIRT1_MBOX_2	0x00013024
+#define CS35L41_DSP_VIRT1_MBOX_3	0x00013028
+#define CS35L41_DSP_VIRT1_MBOX_4	0x0001302C
+#define CS35L41_DSP_VIRT1_MBOX_5	0x00013030
+#define CS35L41_DSP_VIRT1_MBOX_6	0x00013034
+#define CS35L41_DSP_VIRT1_MBOX_7	0x00013038
+#define CS35L41_DSP_VIRT1_MBOX_8	0x0001303C
+#define CS35L41_DSP_VIRT2_MBOX_1	0x00013040
+#define CS35L41_DSP_VIRT2_MBOX_2	0x00013044
+#define CS35L41_DSP_VIRT2_MBOX_3	0x00013048
+#define CS35L41_DSP_VIRT2_MBOX_4	0x0001304C
+#define CS35L41_DSP_VIRT2_MBOX_5	0x00013050
+#define CS35L41_DSP_VIRT2_MBOX_6	0x00013054
+#define CS35L41_DSP_VIRT2_MBOX_7	0x00013058
+#define CS35L41_DSP_VIRT2_MBOX_8	0x0001305C
+#define CS35L41_CLOCK_DETECT_1		0x00014000
+#define CS35L41_TIMER1_CONTROL		0x00015000
+#define CS35L41_TIMER1_COUNT_PRESET	0x00015004
+#define CS35L41_TIMER1_START_STOP	0x0001500C
+#define CS35L41_TIMER1_STATUS		0x00015010
+#define CS35L41_TIMER1_COUNT_READBACK	0x00015014
+#define CS35L41_TIMER1_DSP_CLK_CFG	0x00015018
+#define CS35L41_TIMER1_DSP_CLK_STATUS	0x0001501C
+#define CS35L41_TIMER2_CONTROL		0x00015100
+#define CS35L41_TIMER2_COUNT_PRESET	0x00015104
+#define CS35L41_TIMER2_START_STOP	0x0001510C
+#define CS35L41_TIMER2_STATUS		0x00015110
+#define CS35L41_TIMER2_COUNT_READBACK	0x00015114
+#define CS35L41_TIMER2_DSP_CLK_CFG	0x00015118
+#define CS35L41_TIMER2_DSP_CLK_STATUS	0x0001511C
+#define CS35L41_DFT_JTAG_CONTROL	0x00016000
+#define CS35L41_DIE_STS1		0x00017040
+#define CS35L41_DIE_STS2		0x00017044
+#define CS35L41_TEMP_CAL1		0x00017048
+#define CS35L41_TEMP_CAL2		0x0001704C
+#define CS35L41_DSP1_XMEM_PACK_0	0x02000000
+#define CS35L41_DSP1_XMEM_PACK_3068	0x02002FF0
+#define CS35L41_DSP1_XMEM_UNPACK32_0	0x02400000
+#define CS35L41_DSP1_XMEM_UNPACK32_2046	0x02401FF8
+#define CS35L41_DSP1_TIMESTAMP_COUNT	0x025C0800
+#define CS35L41_DSP1_SYS_ID		0x025E0000
+#define CS35L41_DSP1_SYS_VERSION	0x025E0004
+#define CS35L41_DSP1_SYS_CORE_ID	0x025E0008
+#define CS35L41_DSP1_SYS_AHB_ADDR	0x025E000C
+#define CS35L41_DSP1_SYS_XSRAM_SIZE	0x025E0010
+#define CS35L41_DSP1_SYS_YSRAM_SIZE	0x025E0018
+#define CS35L41_DSP1_SYS_PSRAM_SIZE	0x025E0020
+#define CS35L41_DSP1_SYS_PM_BOOT_SIZE	0x025E0028
+#define CS35L41_DSP1_SYS_FEATURES	0x025E002C
+#define CS35L41_DSP1_SYS_FIR_FILTERS	0x025E0030
+#define CS35L41_DSP1_SYS_LMS_FILTERS	0x025E0034
+#define CS35L41_DSP1_SYS_XM_BANK_SIZE	0x025E0038
+#define CS35L41_DSP1_SYS_YM_BANK_SIZE	0x025E003C
+#define CS35L41_DSP1_SYS_PM_BANK_SIZE	0x025E0040
+#define CS35L41_DSP1_AHBM_WIN0_CTRL0	0x025E2000
+#define CS35L41_DSP1_AHBM_WIN0_CTRL1	0x025E2004
+#define CS35L41_DSP1_AHBM_WIN1_CTRL0	0x025E2008
+#define CS35L41_DSP1_AHBM_WIN1_CTRL1	0x025E200C
+#define CS35L41_DSP1_AHBM_WIN2_CTRL0	0x025E2010
+#define CS35L41_DSP1_AHBM_WIN2_CTRL1	0x025E2014
+#define CS35L41_DSP1_AHBM_WIN3_CTRL0	0x025E2018
+#define CS35L41_DSP1_AHBM_WIN3_CTRL1	0x025E201C
+#define CS35L41_DSP1_AHBM_WIN4_CTRL0	0x025E2020
+#define CS35L41_DSP1_AHBM_WIN4_CTRL1	0x025E2024
+#define CS35L41_DSP1_AHBM_WIN5_CTRL0	0x025E2028
+#define CS35L41_DSP1_AHBM_WIN5_CTRL1	0x025E202C
+#define CS35L41_DSP1_AHBM_WIN6_CTRL0	0x025E2030
+#define CS35L41_DSP1_AHBM_WIN6_CTRL1	0x025E2034
+#define CS35L41_DSP1_AHBM_WIN7_CTRL0	0x025E2038
+#define CS35L41_DSP1_AHBM_WIN7_CTRL1	0x025E203C
+#define CS35L41_DSP1_AHBM_WIN_DBG_CTRL0	0x025E2040
+#define CS35L41_DSP1_AHBM_WIN_DBG_CTRL1	0x025E2044
+#define CS35L41_DSP1_XMEM_UNPACK24_0	0x02800000
+#define CS35L41_DSP1_XMEM_UNPACK24_4093	0x02803FF4
+#define CS35L41_DSP1_CTRL_BASE		0x02B80000
+#define CS35L41_DSP1_CORE_SOFT_RESET	0x02B80010
+#define CS35L41_DSP1_DEBUG		0x02B80040
+#define CS35L41_DSP1_TIMER_CTRL		0x02B80048
+#define CS35L41_DSP1_STREAM_ARB_CTRL	0x02B80050
+#define CS35L41_DSP1_RX1_RATE		0x02B80080
+#define CS35L41_DSP1_RX2_RATE		0x02B80088
+#define CS35L41_DSP1_RX3_RATE		0x02B80090
+#define CS35L41_DSP1_RX4_RATE		0x02B80098
+#define CS35L41_DSP1_RX5_RATE		0x02B800A0
+#define CS35L41_DSP1_RX6_RATE		0x02B800A8
+#define CS35L41_DSP1_RX7_RATE		0x02B800B0
+#define CS35L41_DSP1_RX8_RATE		0x02B800B8
+#define CS35L41_DSP1_TX1_RATE		0x02B80280
+#define CS35L41_DSP1_TX2_RATE		0x02B80288
+#define CS35L41_DSP1_TX3_RATE		0x02B80290
+#define CS35L41_DSP1_TX4_RATE		0x02B80298
+#define CS35L41_DSP1_TX5_RATE		0x02B802A0
+#define CS35L41_DSP1_TX6_RATE		0x02B802A8
+#define CS35L41_DSP1_TX7_RATE		0x02B802B0
+#define CS35L41_DSP1_TX8_RATE		0x02B802B8
+#define CS35L41_DSP1_NMI_CTRL1		0x02B80480
+#define CS35L41_DSP1_NMI_CTRL2		0x02B80488
+#define CS35L41_DSP1_NMI_CTRL3		0x02B80490
+#define CS35L41_DSP1_NMI_CTRL4		0x02B80498
+#define CS35L41_DSP1_NMI_CTRL5		0x02B804A0
+#define CS35L41_DSP1_NMI_CTRL6		0x02B804A8
+#define CS35L41_DSP1_NMI_CTRL7		0x02B804B0
+#define CS35L41_DSP1_NMI_CTRL8		0x02B804B8
+#define CS35L41_DSP1_RESUME_CTRL	0x02B80500
+#define CS35L41_DSP1_IRQ1_CTRL		0x02B80508
+#define CS35L41_DSP1_IRQ2_CTRL		0x02B80510
+#define CS35L41_DSP1_IRQ3_CTRL		0x02B80518
+#define CS35L41_DSP1_IRQ4_CTRL		0x02B80520
+#define CS35L41_DSP1_IRQ5_CTRL		0x02B80528
+#define CS35L41_DSP1_IRQ6_CTRL		0x02B80530
+#define CS35L41_DSP1_IRQ7_CTRL		0x02B80538
+#define CS35L41_DSP1_IRQ8_CTRL		0x02B80540
+#define CS35L41_DSP1_IRQ9_CTRL		0x02B80548
+#define CS35L41_DSP1_IRQ10_CTRL		0x02B80550
+#define CS35L41_DSP1_IRQ11_CTRL		0x02B80558
+#define CS35L41_DSP1_IRQ12_CTRL		0x02B80560
+#define CS35L41_DSP1_IRQ13_CTRL		0x02B80568
+#define CS35L41_DSP1_IRQ14_CTRL		0x02B80570
+#define CS35L41_DSP1_IRQ15_CTRL		0x02B80578
+#define CS35L41_DSP1_IRQ16_CTRL		0x02B80580
+#define CS35L41_DSP1_IRQ17_CTRL		0x02B80588
+#define CS35L41_DSP1_IRQ18_CTRL		0x02B80590
+#define CS35L41_DSP1_IRQ19_CTRL		0x02B80598
+#define CS35L41_DSP1_IRQ20_CTRL		0x02B805A0
+#define CS35L41_DSP1_IRQ21_CTRL		0x02B805A8
+#define CS35L41_DSP1_IRQ22_CTRL		0x02B805B0
+#define CS35L41_DSP1_IRQ23_CTRL		0x02B805B8
+#define CS35L41_DSP1_SCRATCH1		0x02B805C0
+#define CS35L41_DSP1_SCRATCH2		0x02B805C8
+#define CS35L41_DSP1_SCRATCH3		0x02B805D0
+#define CS35L41_DSP1_SCRATCH4		0x02B805D8
+#define CS35L41_DSP1_CCM_CORE_CTRL	0x02BC1000
+#define CS35L41_DSP1_CCM_CLK_OVERRIDE	0x02BC1008
+#define CS35L41_DSP1_XM_MSTR_EN		0x02BC2000
+#define CS35L41_DSP1_XM_CORE_PRI	0x02BC2008
+#define CS35L41_DSP1_XM_AHB_PACK_PL_PRI	0x02BC2010
+#define CS35L41_DSP1_XM_AHB_UP_PL_PRI	0x02BC2018
+#define CS35L41_DSP1_XM_ACCEL_PL0_PRI	0x02BC2020
+#define CS35L41_DSP1_XM_NPL0_PRI	0x02BC2078
+#define CS35L41_DSP1_YM_MSTR_EN		0x02BC20C0
+#define CS35L41_DSP1_YM_CORE_PRI	0x02BC20C8
+#define CS35L41_DSP1_YM_AHB_PACK_PL_PRI	0x02BC20D0
+#define CS35L41_DSP1_YM_AHB_UP_PL_PRI	0x02BC20D8
+#define CS35L41_DSP1_YM_ACCEL_PL0_PRI	0x02BC20E0
+#define CS35L41_DSP1_YM_NPL0_PRI	0x02BC2138
+#define CS35L41_DSP1_PM_MSTR_EN		0x02BC2180
+#define CS35L41_DSP1_PM_PATCH0_ADDR	0x02BC2188
+#define CS35L41_DSP1_PM_PATCH0_EN	0x02BC218C
+#define CS35L41_DSP1_PM_PATCH0_DATA_LO	0x02BC2190
+#define CS35L41_DSP1_PM_PATCH0_DATA_HI	0x02BC2194
+#define CS35L41_DSP1_PM_PATCH1_ADDR	0x02BC2198
+#define CS35L41_DSP1_PM_PATCH1_EN	0x02BC219C
+#define CS35L41_DSP1_PM_PATCH1_DATA_LO	0x02BC21A0
+#define CS35L41_DSP1_PM_PATCH1_DATA_HI	0x02BC21A4
+#define CS35L41_DSP1_PM_PATCH2_ADDR	0x02BC21A8
+#define CS35L41_DSP1_PM_PATCH2_EN	0x02BC21AC
+#define CS35L41_DSP1_PM_PATCH2_DATA_LO	0x02BC21B0
+#define CS35L41_DSP1_PM_PATCH2_DATA_HI	0x02BC21B4
+#define CS35L41_DSP1_PM_PATCH3_ADDR	0x02BC21B8
+#define CS35L41_DSP1_PM_PATCH3_EN	0x02BC21BC
+#define CS35L41_DSP1_PM_PATCH3_DATA_LO	0x02BC21C0
+#define CS35L41_DSP1_PM_PATCH3_DATA_HI	0x02BC21C4
+#define CS35L41_DSP1_PM_PATCH4_ADDR	0x02BC21C8
+#define CS35L41_DSP1_PM_PATCH4_EN	0x02BC21CC
+#define CS35L41_DSP1_PM_PATCH4_DATA_LO	0x02BC21D0
+#define CS35L41_DSP1_PM_PATCH4_DATA_HI	0x02BC21D4
+#define CS35L41_DSP1_PM_PATCH5_ADDR	0x02BC21D8
+#define CS35L41_DSP1_PM_PATCH5_EN	0x02BC21DC
+#define CS35L41_DSP1_PM_PATCH5_DATA_LO	0x02BC21E0
+#define CS35L41_DSP1_PM_PATCH5_DATA_HI	0x02BC21E4
+#define CS35L41_DSP1_PM_PATCH6_ADDR	0x02BC21E8
+#define CS35L41_DSP1_PM_PATCH6_EN	0x02BC21EC
+#define CS35L41_DSP1_PM_PATCH6_DATA_LO	0x02BC21F0
+#define CS35L41_DSP1_PM_PATCH6_DATA_HI	0x02BC21F4
+#define CS35L41_DSP1_PM_PATCH7_ADDR	0x02BC21F8
+#define CS35L41_DSP1_PM_PATCH7_EN	0x02BC21FC
+#define CS35L41_DSP1_PM_PATCH7_DATA_LO	0x02BC2200
+#define CS35L41_DSP1_PM_PATCH7_DATA_HI	0x02BC2204
+#define CS35L41_DSP1_MPU_XM_ACCESS0	0x02BC3000
+#define CS35L41_DSP1_MPU_YM_ACCESS0	0x02BC3004
+#define CS35L41_DSP1_MPU_WNDW_ACCESS0	0x02BC3008
+#define CS35L41_DSP1_MPU_XREG_ACCESS0	0x02BC300C
+#define CS35L41_DSP1_MPU_YREG_ACCESS0	0x02BC3014
+#define CS35L41_DSP1_MPU_XM_ACCESS1	0x02BC3018
+#define CS35L41_DSP1_MPU_YM_ACCESS1	0x02BC301C
+#define CS35L41_DSP1_MPU_WNDW_ACCESS1	0x02BC3020
+#define CS35L41_DSP1_MPU_XREG_ACCESS1	0x02BC3024
+#define CS35L41_DSP1_MPU_YREG_ACCESS1	0x02BC302C
+#define CS35L41_DSP1_MPU_XM_ACCESS2	0x02BC3030
+#define CS35L41_DSP1_MPU_YM_ACCESS2	0x02BC3034
+#define CS35L41_DSP1_MPU_WNDW_ACCESS2	0x02BC3038
+#define CS35L41_DSP1_MPU_XREG_ACCESS2	0x02BC303C
+#define CS35L41_DSP1_MPU_YREG_ACCESS2	0x02BC3044
+#define CS35L41_DSP1_MPU_XM_ACCESS3	0x02BC3048
+#define CS35L41_DSP1_MPU_YM_ACCESS3	0x02BC304C
+#define CS35L41_DSP1_MPU_WNDW_ACCESS3	0x02BC3050
+#define CS35L41_DSP1_MPU_XREG_ACCESS3	0x02BC3054
+#define CS35L41_DSP1_MPU_YREG_ACCESS3	0x02BC305C
+#define CS35L41_DSP1_MPU_XM_VIO_ADDR	0x02BC3100
+#define CS35L41_DSP1_MPU_XM_VIO_STATUS	0x02BC3104
+#define CS35L41_DSP1_MPU_YM_VIO_ADDR	0x02BC3108
+#define CS35L41_DSP1_MPU_YM_VIO_STATUS	0x02BC310C
+#define CS35L41_DSP1_MPU_PM_VIO_ADDR	0x02BC3110
+#define CS35L41_DSP1_MPU_PM_VIO_STATUS	0x02BC3114
+#define CS35L41_DSP1_MPU_LOCK_CONFIG	0x02BC3140
+#define CS35L41_DSP1_MPU_WDT_RST_CTRL	0x02BC3180
+#define CS35L41_DSP1_STRMARB_MSTR0_CFG0	0x02BC5000
+#define CS35L41_DSP1_STRMARB_MSTR0_CFG1	0x02BC5004
+#define CS35L41_DSP1_STRMARB_MSTR0_CFG2	0x02BC5008
+#define CS35L41_DSP1_STRMARB_MSTR1_CFG0	0x02BC5010
+#define CS35L41_DSP1_STRMARB_MSTR1_CFG1	0x02BC5014
+#define CS35L41_DSP1_STRMARB_MSTR1_CFG2	0x02BC5018
+#define CS35L41_DSP1_STRMARB_MSTR2_CFG0	0x02BC5020
+#define CS35L41_DSP1_STRMARB_MSTR2_CFG1	0x02BC5024
+#define CS35L41_DSP1_STRMARB_MSTR2_CFG2	0x02BC5028
+#define CS35L41_DSP1_STRMARB_MSTR3_CFG0	0x02BC5030
+#define CS35L41_DSP1_STRMARB_MSTR3_CFG1	0x02BC5034
+#define CS35L41_DSP1_STRMARB_MSTR3_CFG2	0x02BC5038
+#define CS35L41_DSP1_STRMARB_MSTR4_CFG0	0x02BC5040
+#define CS35L41_DSP1_STRMARB_MSTR4_CFG1	0x02BC5044
+#define CS35L41_DSP1_STRMARB_MSTR4_CFG2	0x02BC5048
+#define CS35L41_DSP1_STRMARB_MSTR5_CFG0	0x02BC5050
+#define CS35L41_DSP1_STRMARB_MSTR5_CFG1	0x02BC5054
+#define CS35L41_DSP1_STRMARB_MSTR5_CFG2	0x02BC5058
+#define CS35L41_DSP1_STRMARB_MSTR6_CFG0	0x02BC5060
+#define CS35L41_DSP1_STRMARB_MSTR6_CFG1	0x02BC5064
+#define CS35L41_DSP1_STRMARB_MSTR6_CFG2	0x02BC5068
+#define CS35L41_DSP1_STRMARB_MSTR7_CFG0	0x02BC5070
+#define CS35L41_DSP1_STRMARB_MSTR7_CFG1	0x02BC5074
+#define CS35L41_DSP1_STRMARB_MSTR7_CFG2	0x02BC5078
+#define CS35L41_DSP1_STRMARB_TX0_CFG0	0x02BC5200
+#define CS35L41_DSP1_STRMARB_TX0_CFG1	0x02BC5204
+#define CS35L41_DSP1_STRMARB_TX1_CFG0	0x02BC5208
+#define CS35L41_DSP1_STRMARB_TX1_CFG1	0x02BC520C
+#define CS35L41_DSP1_STRMARB_TX2_CFG0	0x02BC5210
+#define CS35L41_DSP1_STRMARB_TX2_CFG1	0x02BC5214
+#define CS35L41_DSP1_STRMARB_TX3_CFG0	0x02BC5218
+#define CS35L41_DSP1_STRMARB_TX3_CFG1	0x02BC521C
+#define CS35L41_DSP1_STRMARB_TX4_CFG0	0x02BC5220
+#define CS35L41_DSP1_STRMARB_TX4_CFG1	0x02BC5224
+#define CS35L41_DSP1_STRMARB_TX5_CFG0	0x02BC5228
+#define CS35L41_DSP1_STRMARB_TX5_CFG1	0x02BC522C
+#define CS35L41_DSP1_STRMARB_TX6_CFG0	0x02BC5230
+#define CS35L41_DSP1_STRMARB_TX6_CFG1	0x02BC5234
+#define CS35L41_DSP1_STRMARB_TX7_CFG0	0x02BC5238
+#define CS35L41_DSP1_STRMARB_TX7_CFG1	0x02BC523C
+#define CS35L41_DSP1_STRMARB_RX0_CFG0	0x02BC5400
+#define CS35L41_DSP1_STRMARB_RX0_CFG1	0x02BC5404
+#define CS35L41_DSP1_STRMARB_RX1_CFG0	0x02BC5408
+#define CS35L41_DSP1_STRMARB_RX1_CFG1	0x02BC540C
+#define CS35L41_DSP1_STRMARB_RX2_CFG0	0x02BC5410
+#define CS35L41_DSP1_STRMARB_RX2_CFG1	0x02BC5414
+#define CS35L41_DSP1_STRMARB_RX3_CFG0	0x02BC5418
+#define CS35L41_DSP1_STRMARB_RX3_CFG1	0x02BC541C
+#define CS35L41_DSP1_STRMARB_RX4_CFG0	0x02BC5420
+#define CS35L41_DSP1_STRMARB_RX4_CFG1	0x02BC5424
+#define CS35L41_DSP1_STRMARB_RX5_CFG0	0x02BC5428
+#define CS35L41_DSP1_STRMARB_RX5_CFG1	0x02BC542C
+#define CS35L41_DSP1_STRMARB_RX6_CFG0	0x02BC5430
+#define CS35L41_DSP1_STRMARB_RX6_CFG1	0x02BC5434
+#define CS35L41_DSP1_STRMARB_RX7_CFG0	0x02BC5438
+#define CS35L41_DSP1_STRMARB_RX7_CFG1	0x02BC543C
+#define CS35L41_DSP1_STRMARB_IRQ0_CFG0	0x02BC5600
+#define CS35L41_DSP1_STRMARB_IRQ0_CFG1	0x02BC5604
+#define CS35L41_DSP1_STRMARB_IRQ0_CFG2	0x02BC5608
+#define CS35L41_DSP1_STRMARB_IRQ1_CFG0	0x02BC5610
+#define CS35L41_DSP1_STRMARB_IRQ1_CFG1	0x02BC5614
+#define CS35L41_DSP1_STRMARB_IRQ1_CFG2	0x02BC5618
+#define CS35L41_DSP1_STRMARB_IRQ2_CFG0	0x02BC5620
+#define CS35L41_DSP1_STRMARB_IRQ2_CFG1	0x02BC5624
+#define CS35L41_DSP1_STRMARB_IRQ2_CFG2	0x02BC5628
+#define CS35L41_DSP1_STRMARB_IRQ3_CFG0	0x02BC5630
+#define CS35L41_DSP1_STRMARB_IRQ3_CFG1	0x02BC5634
+#define CS35L41_DSP1_STRMARB_IRQ3_CFG2	0x02BC5638
+#define CS35L41_DSP1_STRMARB_IRQ4_CFG0	0x02BC5640
+#define CS35L41_DSP1_STRMARB_IRQ4_CFG1	0x02BC5644
+#define CS35L41_DSP1_STRMARB_IRQ4_CFG2	0x02BC5648
+#define CS35L41_DSP1_STRMARB_IRQ5_CFG0	0x02BC5650
+#define CS35L41_DSP1_STRMARB_IRQ5_CFG1	0x02BC5654
+#define CS35L41_DSP1_STRMARB_IRQ5_CFG2	0x02BC5658
+#define CS35L41_DSP1_STRMARB_IRQ6_CFG0	0x02BC5660
+#define CS35L41_DSP1_STRMARB_IRQ6_CFG1	0x02BC5664
+#define CS35L41_DSP1_STRMARB_IRQ6_CFG2	0x02BC5668
+#define CS35L41_DSP1_STRMARB_IRQ7_CFG0	0x02BC5670
+#define CS35L41_DSP1_STRMARB_IRQ7_CFG1	0x02BC5674
+#define CS35L41_DSP1_STRMARB_IRQ7_CFG2	0x02BC5678
+#define CS35L41_DSP1_STRMARB_RESYNC_MSK	0x02BC5A00
+#define CS35L41_DSP1_STRMARB_ERR_STATUS	0x02BC5A08
+#define CS35L41_DSP1_INTPCTL_RES_STATIC	0x02BC6000
+#define CS35L41_DSP1_INTPCTL_RES_DYN	0x02BC6004
+#define CS35L41_DSP1_INTPCTL_NMI_CTRL	0x02BC6008
+#define CS35L41_DSP1_INTPCTL_IRQ_INV	0x02BC6010
+#define CS35L41_DSP1_INTPCTL_IRQ_MODE	0x02BC6014
+#define CS35L41_DSP1_INTPCTL_IRQ_EN	0x02BC6018
+#define CS35L41_DSP1_INTPCTL_IRQ_MSK	0x02BC601C
+#define CS35L41_DSP1_INTPCTL_IRQ_FLUSH	0x02BC6020
+#define CS35L41_DSP1_INTPCTL_IRQ_MSKCLR	0x02BC6024
+#define CS35L41_DSP1_INTPCTL_IRQ_FRC	0x02BC6028
+#define CS35L41_DSP1_INTPCTL_IRQ_MSKSET	0x02BC602C
+#define CS35L41_DSP1_INTPCTL_IRQ_ERR	0x02BC6030
+#define CS35L41_DSP1_INTPCTL_IRQ_PEND	0x02BC6034
+#define CS35L41_DSP1_INTPCTL_IRQ_GEN	0x02BC6038
+#define CS35L41_DSP1_INTPCTL_TESTBITS	0x02BC6040
+#define CS35L41_DSP1_WDT_CONTROL	0x02BC7000
+#define CS35L41_DSP1_WDT_STATUS		0x02BC7008
+#define CS35L41_DSP1_YMEM_PACK_0	0x02C00000
+#define CS35L41_DSP1_YMEM_PACK_1532	0x02C017F0
+#define CS35L41_DSP1_YMEM_UNPACK32_0	0x03000000
+#define CS35L41_DSP1_YMEM_UNPACK32_1022	0x03000FF8
+#define CS35L41_DSP1_YMEM_UNPACK24_0	0x03400000
+#define CS35L41_DSP1_YMEM_UNPACK24_2045	0x03401FF4
+#define CS35L41_DSP1_PMEM_0		0x03800000
+#define CS35L41_DSP1_PMEM_5114		0x03804FE8
+
+/*test regs for emulation bringup*/
+#define CS35L41_PLL_OVR			0x00003018
+#define CS35L41_BST_TEST_DUTY		0x00003900
+#define CS35L41_DIGPWM_IOCTRL		0x0000706C
+
+/*registers populated by OTP*/
+#define CS35L41_OTP_TRIM_1	0x0000208c
+#define CS35L41_OTP_TRIM_2	0x00002090
+#define CS35L41_OTP_TRIM_3	0x00003010
+#define CS35L41_OTP_TRIM_4	0x0000300C
+#define CS35L41_OTP_TRIM_5	0x0000394C
+#define CS35L41_OTP_TRIM_6	0x00003950
+#define CS35L41_OTP_TRIM_7	0x00003954
+#define CS35L41_OTP_TRIM_8	0x00003958
+#define CS35L41_OTP_TRIM_9	0x0000395C
+#define CS35L41_OTP_TRIM_10	0x0000416C
+#define CS35L41_OTP_TRIM_11	0x00004160
+#define CS35L41_OTP_TRIM_12	0x00004170
+#define CS35L41_OTP_TRIM_13	0x00004360
+#define CS35L41_OTP_TRIM_14	0x00004448
+#define CS35L41_OTP_TRIM_15	0x0000444C
+#define CS35L41_OTP_TRIM_16	0x00006E30
+#define CS35L41_OTP_TRIM_17	0x00006E34
+#define CS35L41_OTP_TRIM_18	0x00006E38
+#define CS35L41_OTP_TRIM_19	0x00006E3C
+#define CS35L41_OTP_TRIM_20	0x00006E40
+#define CS35L41_OTP_TRIM_21	0x00006E44
+#define CS35L41_OTP_TRIM_22	0x00006E48
+#define CS35L41_OTP_TRIM_23	0x00006E4C
+#define CS35L41_OTP_TRIM_24	0x00006E50
+#define CS35L41_OTP_TRIM_25	0x00006E54
+#define CS35L41_OTP_TRIM_26	0x00006E58
+#define CS35L41_OTP_TRIM_27	0x00006E5C
+#define CS35L41_OTP_TRIM_28	0x00006E60
+#define CS35L41_OTP_TRIM_29	0x00006E64
+#define CS35L41_OTP_TRIM_30	0x00007418
+#define CS35L41_OTP_TRIM_31	0x0000741C
+#define CS35L41_OTP_TRIM_32	0x00007434
+#define CS35L41_OTP_TRIM_33	0x00007068
+#define CS35L41_OTP_TRIM_34	0x0000410C
+#define CS35L41_OTP_TRIM_35	0x0000400C
+#define CS35L41_OTP_TRIM_36	0x00002030
+
+#define CS35L41_MAX_CACHE_REG		36
+#define CS35L41_OTP_SIZE_WORDS		32
+#define CS35L41_NUM_OTP_ELEM		100
+#define CS35L41_NUM_OTP_MAPS		5
+
+#define CS35L41_VALID_PDATA		0x80000000
+
+#define CS35L41_SCLK_MSTR_MASK		0x10
+#define CS35L41_SCLK_MSTR_SHIFT		4
+#define CS35L41_LRCLK_MSTR_MASK		0x01
+#define CS35L41_LRCLK_MSTR_SHIFT	0
+#define CS35L41_SCLK_INV_MASK		0x40
+#define CS35L41_SCLK_INV_SHIFT		6
+#define CS35L41_LRCLK_INV_MASK		0x04
+#define CS35L41_LRCLK_INV_SHIFT		2
+#define CS35L41_SCLK_FRC_MASK		0x20
+#define CS35L41_SCLK_FRC_SHIFT		5
+#define CS35L41_LRCLK_FRC_MASK		0x02
+#define CS35L41_LRCLK_FRC_SHIFT		1
+
+#define CS35L41_AMP_GAIN_ZC_MASK	0x0400
+#define CS35L41_AMP_GAIN_ZC_SHIFT	10
+
+#define CS35L41_BST_CTL_MASK		0xFF
+#define CS35L41_BST_CTL_SEL_MASK	0x03
+#define CS35L41_BST_CTL_SEL_REG		0x00
+#define CS35L41_BST_CTL_SEL_CLASSH	0x01
+#define CS35L41_BST_IPK_MASK		0x7F
+#define CS35L41_BST_IPK_SHIFT		0
+#define CS35L41_BST_LIM_MASK		0x4
+#define CS35L41_BST_LIM_SHIFT		2
+#define CS35L41_BST_K1_MASK		0x000000FF
+#define CS35L41_BST_K1_SHIFT		0
+#define CS35L41_BST_K2_MASK		0x0000FF00
+#define CS35L41_BST_K2_SHIFT		8
+#define CS35L41_BST_SLOPE_MASK		0x0000FF00
+#define CS35L41_BST_SLOPE_SHIFT		8
+#define CS35L41_BST_LBST_VAL_MASK	0x00000003
+#define CS35L41_BST_LBST_VAL_SHIFT	0
+
+#define CS35L41_TEMP_THLD_MASK		0x03
+#define CS35L41_VMON_IMON_VOL_MASK	0x07FF07FF
+#define CS35L41_PDM_MODE_MASK		0x01
+#define CS35L41_PDM_MODE_SHIFT		0
+
+#define CS35L41_CH_MEM_DEPTH_MASK	0x07
+#define CS35L41_CH_MEM_DEPTH_SHIFT	0
+#define CS35L41_CH_HDRM_CTL_MASK	0x007F0000
+#define CS35L41_CH_HDRM_CTL_SHIFT	16
+#define CS35L41_CH_REL_RATE_MASK	0xFF00
+#define CS35L41_CH_REL_RATE_SHIFT	8
+#define CS35L41_CH_WKFET_DLY_MASK	0x001C
+#define CS35L41_CH_WKFET_DLY_SHIFT	2
+#define CS35L41_CH_WKFET_THLD_MASK	0x0F00
+#define CS35L41_CH_WKFET_THLD_SHIFT	8
+
+#define CS35L41_HW_NG_SEL_MASK		0x3F00
+#define CS35L41_HW_NG_SEL_SHIFT		8
+#define CS35L41_HW_NG_DLY_MASK		0x0070
+#define CS35L41_HW_NG_DLY_SHIFT		4
+#define CS35L41_HW_NG_THLD_MASK		0x0007
+#define CS35L41_HW_NG_THLD_SHIFT	0
+
+#define CS35L41_DSP_NG_ENABLE_MASK	0x00010000
+#define CS35L41_DSP_NG_ENABLE_SHIFT	16
+#define CS35L41_DSP_NG_THLD_MASK	0x7
+#define CS35L41_DSP_NG_THLD_SHIFT	0
+#define CS35L41_DSP_NG_DELAY_MASK	0x0F00
+#define CS35L41_DSP_NG_DELAY_SHIFT	8
+
+#define CS35L41_ASP_FMT_MASK		0x0700
+#define CS35L41_ASP_FMT_SHIFT		8
+#define CS35L41_ASP_DOUT_HIZ_MASK	0x03
+#define CS35L41_ASP_DOUT_HIZ_SHIFT	0
+#define CS35L41_ASP_WIDTH_16		0x10
+#define CS35L41_ASP_WIDTH_24		0x18
+#define CS35L41_ASP_WIDTH_32		0x20
+#define CS35L41_ASP_WIDTH_TX_MASK	0xFF0000
+#define CS35L41_ASP_WIDTH_TX_SHIFT	16
+#define CS35L41_ASP_WIDTH_RX_MASK	0xFF000000
+#define CS35L41_ASP_WIDTH_RX_SHIFT	24
+#define CS35L41_ASP_RX1_SLOT_MASK	0x3F
+#define CS35L41_ASP_RX1_SLOT_SHIFT	0
+#define CS35L41_ASP_RX2_SLOT_MASK	0x3F00
+#define CS35L41_ASP_RX2_SLOT_SHIFT	8
+#define CS35L41_ASP_RX_WL_MASK		0x3F
+#define CS35L41_ASP_TX_WL_MASK		0x3F
+#define CS35L41_ASP_RX_WL_SHIFT		0
+#define CS35L41_ASP_TX_WL_SHIFT		0
+#define CS35L41_ASP_SOURCE_MASK		0x7F
+
+#define CS35L41_INPUT_SRC_ASPRX1	0x08
+#define CS35L41_INPUT_SRC_ASPRX2	0x09
+#define CS35L41_INPUT_SRC_VMON		0x18
+#define CS35L41_INPUT_SRC_IMON		0x19
+#define CS35L41_INPUT_SRC_CLASSH	0x21
+#define CS35L41_INPUT_SRC_VPMON		0x28
+#define CS35L41_INPUT_SRC_VBSTMON	0x29
+#define CS35L41_INPUT_SRC_TEMPMON	0x3A
+#define CS35L41_INPUT_SRC_RSVD		0x3B
+#define CS35L41_INPUT_DSP_TX1		0x32
+#define CS35L41_INPUT_DSP_TX2		0x33
+
+#define CS35L41_PLL_CLK_SEL_MASK	0x07
+#define CS35L41_PLL_CLK_SEL_SHIFT	0
+#define CS35L41_PLL_CLK_EN_MASK		0x10
+#define CS35L41_PLL_CLK_EN_SHIFT	4
+#define CS35L41_PLL_OPENLOOP_MASK	0x0800
+#define CS35L41_PLL_OPENLOOP_SHIFT	11
+#define CS35L41_PLLSRC_SCLK		0
+#define CS35L41_PLLSRC_LRCLK		1
+#define CS35L41_PLLSRC_SELF		3
+#define CS35L41_PLLSRC_PDMCLK		4
+#define CS35L41_PLLSRC_MCLK		5
+#define CS35L41_PLLSRC_SWIRE		7
+#define CS35L41_REFCLK_FREQ_MASK	0x7E0
+#define CS35L41_REFCLK_FREQ_SHIFT	5
+
+#define CS35L41_GLOBAL_FS_MASK		0x1F
+#define CS35L41_GLOBAL_FS_SHIFT		0
+
+#define CS35L41_GLOBAL_EN_MASK		0x01
+#define CS35L41_GLOBAL_EN_SHIFT		0
+#define CS35L41_BST_EN_MASK		0x0030
+#define CS35L41_BST_EN_SHIFT		4
+#define CS35L41_BST_EN_DEFAULT		0x2
+
+#define CS35L41_PDN_DONE_MASK		0x00800000
+#define CS35L41_PDN_DONE_SHIFT		23
+#define CS35L41_PUP_DONE_MASK		0x01000000
+#define CS35L41_PUP_DONE_SHIFT		24
+
+#define CS35L36_PUP_DONE_IRQ_UNMASK	0x5F
+#define CS35L36_PUP_DONE_IRQ_MASK	0xBF
+
+#define CS35L41_AMP_SHORT_ERR		0x80000000
+#define CS35L41_BST_SHORT_ERR		0x0100
+#define CS35L41_TEMP_WARN		0x8000
+#define CS35L41_TEMP_ERR		0x00020000
+#define CS35L41_BST_OVP_ERR		0x40
+#define CS35L41_BST_DCM_UVP_ERR		0x80
+#define CS35L41_OTP_BOOT_DONE		0x02
+#define CS35L41_PLL_UNLOCK		0x10
+#define CS35L41_OTP_BOOT_ERR		0x80000000
+
+#define CS35L41_AMP_SHORT_ERR_RLS	0x02
+#define CS35L41_BST_SHORT_ERR_RLS	0x04
+#define CS35L41_BST_OVP_ERR_RLS		0x08
+#define CS35L41_BST_UVP_ERR_RLS		0x10
+#define CS35L41_TEMP_WARN_ERR_RLS	0x20
+#define CS35L41_TEMP_ERR_RLS		0x40
+
+#define CS35L41_INT1_MASK_DEFAULT	0x7FFCFE3F
+#define CS35L41_INT1_UNMASK_PUP		0xFEFFFFFF
+#define CS35L41_INT1_UNMASK_PDN		0xFF7FFFFF
+
+#define CS35L41_GPIO_DIR_MASK		0x80000000
+#define CS35L41_GPIO1_CTRL_MASK		0x00030000
+#define CS35L41_GPIO1_CTRL_SHIFT	16
+#define CS35L41_GPIO2_CTRL_MASK		0x07000000
+#define CS35L41_GPIO2_CTRL_SHIFT	24
+#define CS35L41_GPIO_CTRL_OPEN_INT	2
+#define CS35L41_GPIO_CTRL_ACTV_LO	4
+#define CS35L41_GPIO_CTRL_ACTV_HI	5
+#define CS35L41_GPIO_POL_MASK		0x1000
+#define CS35L41_GPIO_POL_SHIFT		12
+
+#define CS35L41_AMP_INV_PCM_SHIFT	14
+#define CS35L41_AMP_INV_PCM_MASK	(1 << CS35L41_AMP_INV_PCM_SHIFT)
+#define CS35L41_AMP_PCM_VOL_SHIFT	3
+#define CS35L41_AMP_PCM_VOL_MASK	(0x7FF << 3)
+#define CS35L41_AMP_PCM_VOL_MUTE	0x4CF
+
+#define CS35L41_CHIP_ID			0x35a40
+#define CS35L41R_CHIP_ID		0x35b40
+#define CS35L41_MTLREVID_MASK		0x0F
+#define CS35L41_REVID_A0		0xA0
+#define CS35L41_REVID_B0		0xB0
+#define CS35L41_REVID_B2		0xB2
+
+#define CS35L41_HALO_CORE_RESET		0x00000200
+
+#define CS35L41_FS1_WINDOW_MASK		0x000007FF
+#define CS35L41_FS2_WINDOW_MASK		0x00FFF800
+#define CS35L41_FS2_WINDOW_SHIFT	12
+
+#define CS35L41_SPI_MAX_FREQ_OTP	4000000
+
+#define CS35L41_RX_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
+#define CS35L41_TX_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
+
+bool cs35l41_readable_reg(struct device *dev, unsigned int reg);
+bool cs35l41_precious_reg(struct device *dev, unsigned int reg);
+bool cs35l41_volatile_reg(struct device *dev, unsigned int reg);
+
+struct cs35l41_otp_packed_element_t {
+	u32 reg;
+	u8 shift;
+	u8 size;
+};
+
+struct cs35l41_otp_map_element_t {
+	u32 id;
+	u32 num_elements;
+	const struct cs35l41_otp_packed_element_t *map;
+	u32 bit_offset;
+	u32 word_offset;
+};
+
+extern const struct reg_default cs35l41_reg[CS35L41_MAX_CACHE_REG];
+extern const struct cs35l41_otp_map_element_t
+				cs35l41_otp_map_map[CS35L41_NUM_OTP_MAPS];
+
+#define CS35L41_REGSTRIDE			4
+
+#endif /*__CS35L41_H__*/
-- 
2.25.1

