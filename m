Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A21B0355698
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 16:26:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D716166B;
	Tue,  6 Apr 2021 16:25:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D716166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617719197;
	bh=c6dpl8Xl3CxcRqs4iG6dk1h8LOZRzj5SflgZIHTpQiM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W90WKErPwo4x3VY8I2r1Vo7HG+vBV4TqZUt11Jfbgzauadcx51RxyFFgtaPk64K9M
	 c29XuANnG4cwRijw6/8xobS6jsoToHsroxGPuVn8p39fWSFAt7Ihv2g5pA56XB9Rby
	 7+R0WgTgMpdQJlmla+pv6uymIj3aj02I4UfcLulU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1438F8020B;
	Tue,  6 Apr 2021 16:25:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F27A8F80264; Tue,  6 Apr 2021 16:24:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from router.aksignal.cz (router.aksignal.cz [62.44.4.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1D95F80124
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 16:24:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1D95F80124
Received: from localhost (localhost [127.0.0.1])
 by router.aksignal.cz (Postfix) with ESMTP id B93253FA2B;
 Tue,  6 Apr 2021 16:24:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at router.aksignal.cz
Received: from router.aksignal.cz ([127.0.0.1])
 by localhost (router.aksignal.cz [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id ZKq1qdz3LD5y; Tue,  6 Apr 2021 16:24:45 +0200 (CEST)
Received: from pc-gameroom.prchals.tk (unknown [83.240.30.185])
 (Authenticated sender: jiri.prchal@aksignal.cz)
 by router.aksignal.cz (Postfix) with ESMTPSA id B6BBA3FA37;
 Tue,  6 Apr 2021 16:24:43 +0200 (CEST)
From: Jiri Prchal <jiri.prchal@aksignal.cz>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ASoC: codecs: tlv320aic3x: add SPI support
Date: Tue,  6 Apr 2021 16:24:39 +0200
Message-Id: <20210406142439.102396-5-jiri.prchal@aksignal.cz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406142439.102396-1-jiri.prchal@aksignal.cz>
References: <20210406142439.102396-1-jiri.prchal@aksignal.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Jiri Prchal <jiri.prchal@aksignal.cz>, Liam Girdwood <lgirdwood@gmail.com>
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

Added SPI support.

Signed-off-by: Jiri Prchal <jiri.prchal@aksignal.cz>
---
 sound/soc/codecs/Kconfig           |  7 +++
 sound/soc/codecs/Makefile          |  2 +
 sound/soc/codecs/tlv320aic3x-spi.c | 76 ++++++++++++++++++++++++++++++
 3 files changed, 85 insertions(+)
 create mode 100644 sound/soc/codecs/tlv320aic3x-spi.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 7f6a9b22c261..9dc85119bcab 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -215,6 +215,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_TLV320AIC32X4_I2C
 	imply SND_SOC_TLV320AIC32X4_SPI
 	imply SND_SOC_TLV320AIC3X_I2C
+	imply SND_SOC_TLV320AIC3X_SPI
 	imply SND_SOC_TPA6130A2
 	imply SND_SOC_TLV320DAC33
 	imply SND_SOC_TSCS42XX
@@ -1427,6 +1428,12 @@ config SND_SOC_TLV320AIC3X_I2C
 	select SND_SOC_TLV320AIC3X
 	select REGMAP_I2C
 
+config SND_SOC_TLV320AIC3X_SPI
+	tristate "Texas Instruments TLV320AIC3x audio CODECs - SPI"
+	depends on SPI_MASTER
+	select SND_SOC_TLV320AIC3X
+	select REGMAP_SPI
+
 config SND_SOC_TLV320DAC33
 	tristate
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 3710726f740f..022b3801d964 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -234,6 +234,7 @@ snd-soc-tlv320aic32x4-i2c-objs := tlv320aic32x4-i2c.o
 snd-soc-tlv320aic32x4-spi-objs := tlv320aic32x4-spi.o
 snd-soc-tlv320aic3x-objs := tlv320aic3x.o
 snd-soc-tlv320aic3x-i2c-objs := tlv320aic3x-i2c.o
+snd-soc-tlv320aic3x-spi-objs := tlv320aic3x-spi.o
 snd-soc-tlv320dac33-objs := tlv320dac33.o
 snd-soc-tlv320adcx140-objs := tlv320adcx140.o
 snd-soc-tscs42xx-objs := tscs42xx.o
@@ -550,6 +551,7 @@ obj-$(CONFIG_SND_SOC_TLV320AIC32X4_I2C)	+= snd-soc-tlv320aic32x4-i2c.o
 obj-$(CONFIG_SND_SOC_TLV320AIC32X4_SPI)	+= snd-soc-tlv320aic32x4-spi.o
 obj-$(CONFIG_SND_SOC_TLV320AIC3X)	+= snd-soc-tlv320aic3x.o
 obj-$(CONFIG_SND_SOC_TLV320AIC3X_I2C)	+= snd-soc-tlv320aic3x-i2c.o
+obj-$(CONFIG_SND_SOC_TLV320AIC3X_SPI)	+= snd-soc-tlv320aic3x-spi.o
 obj-$(CONFIG_SND_SOC_TLV320DAC33)	+= snd-soc-tlv320dac33.o
 obj-$(CONFIG_SND_SOC_TLV320ADCX140)	+= snd-soc-tlv320adcx140.o
 obj-$(CONFIG_SND_SOC_TSCS42XX)	+= snd-soc-tscs42xx.o
diff --git a/sound/soc/codecs/tlv320aic3x-spi.c b/sound/soc/codecs/tlv320aic3x-spi.c
new file mode 100644
index 000000000000..bd78ab0910da
--- /dev/null
+++ b/sound/soc/codecs/tlv320aic3x-spi.c
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * ALSA SoC TLV320AIC3x codec driver SPI interface
+ *
+ * Author:      Arun KS, <arunks@mistralsolutions.com>
+ * Copyright:   (C) 2008 Mistral Solutions Pvt Ltd.,
+ *
+ * Based on sound/soc/codecs/wm8731.c by Richard Purdie
+ *
+ */
+
+#include <linux/spi/spi.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+
+#include "tlv320aic3x.h"
+
+static int aic3x_spi_probe(struct spi_device *spi)
+{
+	struct regmap *regmap;
+	struct regmap_config config;
+	const struct spi_device_id *id = spi_get_device_id(spi);
+
+	config = aic3x_regmap;
+	config.reg_bits = 7;
+	config.pad_bits = 1;
+	config.val_bits = 8;
+	config.read_flag_mask = 0x01;
+
+	dev_dbg(&spi->dev, "probing tlv320aic3x spi device\n");
+
+	regmap = devm_regmap_init_spi(spi, &config);
+	return aic3x_probe(&spi->dev, regmap, id->driver_data);
+}
+
+static int aic3x_spi_remove(struct spi_device *spi)
+{
+	return aic3x_remove(&spi->dev);
+}
+
+static const struct spi_device_id aic3x_spi_id[] = {
+	{ "tlv320aic3x", AIC3X_MODEL_3X },
+	{ "tlv320aic33", AIC3X_MODEL_33 },
+	{ "tlv320aic3007", AIC3X_MODEL_3007 },
+	{ "tlv320aic3104", AIC3X_MODEL_3104 },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, aic3x_spi_id);
+
+static const struct of_device_id aic3x_of_id[] = {
+	{ .compatible = "ti,tlv320aic3x", },
+	{ .compatible = "ti,tlv320aic33" },
+	{ .compatible = "ti,tlv320aic3007" },
+	{ .compatible = "ti,tlv320aic3104" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, aic3x_of_id);
+
+static struct spi_driver aic3x_spi_driver = {
+	.driver = {
+		.name = "tlv320aic3x",
+		.owner = THIS_MODULE,
+		.of_match_table = aic3x_of_id,
+	},
+	.probe = aic3x_spi_probe,
+	.remove = aic3x_spi_remove,
+	.id_table = aic3x_spi_id,
+};
+
+module_spi_driver(aic3x_spi_driver);
+
+MODULE_DESCRIPTION("ASoC TLV320AIC3x codec driver SPI");
+MODULE_AUTHOR("Arun KS <arunks@mistralsolutions.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

