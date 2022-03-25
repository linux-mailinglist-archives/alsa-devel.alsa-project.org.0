Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 039D14E77BF
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Mar 2022 16:35:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BFD5172A;
	Fri, 25 Mar 2022 16:34:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BFD5172A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648222548;
	bh=i9QLZ3B7gJ4qAVHeME/RCl9b9yur4KnXHtV057ilAaI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c30Wdg2d2G6Gw6854yBIkZr/ne6FI4JMDCNtgZYbe3t0vgkk/SL7uJwS4iOZaes2R
	 zEk3KzyrmfC7T98oYkyzvG6KIu5OEjKvlwqzUQZO8HbPY9d0YOi1qFl4t66JN74qpx
	 rLrj0pEvcM+nzK+Jy198OYT5NDd6KkPwOllehq2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F602F8052F;
	Fri, 25 Mar 2022 16:33:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95F0EF80518; Fri, 25 Mar 2022 16:33:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CB3FF80518
 for <alsa-devel@alsa-project.org>; Fri, 25 Mar 2022 16:33:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CB3FF80518
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AUVugSLe"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0831E60A76;
 Fri, 25 Mar 2022 15:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 177FAC340F4;
 Fri, 25 Mar 2022 15:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648222392;
 bh=i9QLZ3B7gJ4qAVHeME/RCl9b9yur4KnXHtV057ilAaI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AUVugSLe0K2q5YDWL97jWR4B+gUBACy64Q/bd+x8TLPPY1Z5ceehci/3w9pa3OtCS
 KfKTBLYmjHKvvF09vTdIEjzsPY0wRsSBP44OiX07uYpkjwYYYBbUORtio7WTFA/W0c
 nkSYfyrmOzi8iV8RO93hPRHc6NkeDrEWBO0BGqXCsSybynlb9xpcdkIspfzj6dMzdD
 Fji6wLnXWfMXsf3xMsvKj30smk6r/l8nhHwiklSNepl+4xdOnTiUjCaV0t5HQ2ZZRQ
 JWo6EYrMWlOapWHQ+6xxO44k60P9TtSCNJXA9qZKsyfcIkuWDRv0NsgA/XWS8ecFXb
 yQADmtSnAsn3Q==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1 5/7] ASoC: wm8731: Factor out the I2C and SPI bus code into
 separate modules
Date: Fri, 25 Mar 2022 15:31:19 +0000
Message-Id: <20220325153121.1598494-6-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220325153121.1598494-1-broonie@kernel.org>
References: <20220325153121.1598494-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=14152; h=from:subject;
 bh=i9QLZ3B7gJ4qAVHeME/RCl9b9yur4KnXHtV057ilAaI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiPeBHjVWrs2MBVuHwq1IRZV8eps5sHKyhwO+Oh3nI
 1S9FuKyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYj3gRwAKCRAk1otyXVSH0IkJB/
 oCDIb6v5PrtPVlgdyJMj6481VD6dNp7iKcC1YCWntlUjzNuOipjINutSFIu20YGWA9oFbXA6c35x9e
 KSDMOGcDVr3vsNvfEa3wy5ZMgpnPWtY7AKo6yeewlhPARLaZwr8DpVVbM4M05ncz5EuPev+7q+0OMK
 vjPmJmPzos/9RXfhj2xLHxOqCC+2wPhnArQTRwOEe/Kj+9urxrY3kE46Hcn7oSYHeNjET0wmdwjdvs
 rHmJa663mwSIuXT9UtsKdf6PFKleYUP8ClnOFGDjb78qHkPWkBi2vrxhIppK02XviuA3es2yyzFTTk
 BQdjVZVIgXMEXz6fRh9VIIyMZww4Ln
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
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

Placing both the I2C and SPI code in the same module causes problems with
mixes of modular and non-modular builds of the buses so it's generally bad
practice. As with other drivers split the bus code out of the WM8731 driver
into separate modules.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/atmel/Kconfig       |   4 +-
 sound/soc/au1x/Kconfig        |   2 +-
 sound/soc/codecs/Kconfig      |  18 ++++-
 sound/soc/codecs/Makefile     |   4 +
 sound/soc/codecs/wm8731-i2c.c |  69 +++++++++++++++++
 sound/soc/codecs/wm8731-spi.c |  59 +++++++++++++++
 sound/soc/codecs/wm8731.c     | 138 +---------------------------------
 sound/soc/codecs/wm8731.h     |  27 +++++++
 sound/soc/pxa/Kconfig         |   4 +-
 9 files changed, 183 insertions(+), 142 deletions(-)
 create mode 100644 sound/soc/codecs/wm8731-i2c.c
 create mode 100644 sound/soc/codecs/wm8731-spi.c

diff --git a/sound/soc/atmel/Kconfig b/sound/soc/atmel/Kconfig
index 8617793ed955..2a3ade9e56ec 100644
--- a/sound/soc/atmel/Kconfig
+++ b/sound/soc/atmel/Kconfig
@@ -42,9 +42,9 @@ config SND_ATMEL_SOC_SSC_DMA
 config SND_AT91_SOC_SAM9G20_WM8731
 	tristate "SoC Audio support for WM8731-based At91sam9g20 evaluation board"
 	depends on ARCH_AT91 || COMPILE_TEST
-	depends on ATMEL_SSC && SND_SOC_I2C_AND_SPI
+	depends on ATMEL_SSC && I2C
 	select SND_ATMEL_SOC_SSC_PDC
-	select SND_SOC_WM8731
+	select SND_SOC_WM8731_I2C
 	help
 	  Say Y if you want to add support for SoC audio on WM8731-based
 	  AT91sam9g20 evaluation board.
diff --git a/sound/soc/au1x/Kconfig b/sound/soc/au1x/Kconfig
index 38de7c0efbc7..8a78809e8754 100644
--- a/sound/soc/au1x/Kconfig
+++ b/sound/soc/au1x/Kconfig
@@ -58,7 +58,7 @@ config SND_SOC_DB1200
 	select SND_SOC_AC97_CODEC
 	select SND_SOC_WM9712
 	select SND_SOC_AU1XPSC_I2S
-	select SND_SOC_WM8731
+	select SND_SOC_WM8731_I2C
 	help
 	  Select this option to enable audio (AC97 and I2S) on the
 	  Alchemy/AMD/RMI/NetLogic Db1200, Db1550 and Db1300 evaluation boards.
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index c2627f7489a4..ab4e5b5e827a 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -263,7 +263,8 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_WM8711
 	imply SND_SOC_WM8727
 	imply SND_SOC_WM8728
-	imply SND_SOC_WM8731
+	imply SND_SOC_WM8731_I2C
+	imply SND_SOC_WM8731_SPI
 	imply SND_SOC_WM8737
 	imply SND_SOC_WM8741
 	imply SND_SOC_WM8750
@@ -1742,8 +1743,19 @@ config SND_SOC_WM8728
 	depends on SND_SOC_I2C_AND_SPI
 
 config SND_SOC_WM8731
-	tristate "Wolfson Microelectronics WM8731 CODEC"
-	depends on SND_SOC_I2C_AND_SPI
+	tristate
+
+config SND_SOC_WM8731_I2C
+	tristate "Wolfson Microelectronics WM8731 CODEC with I2C"
+	depends on I2C
+	select REGMAP
+	select SND_SOC_WM8731
+
+config SND_SOC_WM8731_SPI
+	tristate "Wolfson Microelectronics WM8731 CODEC with SPI"
+	depends on SPI
+	select REGMAP
+	select SND_SOC_WM8731
 
 config SND_SOC_WM8737
 	tristate "Wolfson Microelectronics WM8737 ADC"
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index b4e11c3e4a08..d98a22c54a4e 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -288,6 +288,8 @@ snd-soc-wm8711-objs := wm8711.o
 snd-soc-wm8727-objs := wm8727.o
 snd-soc-wm8728-objs := wm8728.o
 snd-soc-wm8731-objs := wm8731.o
+snd-soc-wm8731-i2c-objs := wm8731-i2c.o
+snd-soc-wm8731-spi-objs := wm8731-spi.o
 snd-soc-wm8737-objs := wm8737.o
 snd-soc-wm8741-objs := wm8741.o
 snd-soc-wm8750-objs := wm8750.o
@@ -629,6 +631,8 @@ obj-$(CONFIG_SND_SOC_WM8711)	+= snd-soc-wm8711.o
 obj-$(CONFIG_SND_SOC_WM8727)	+= snd-soc-wm8727.o
 obj-$(CONFIG_SND_SOC_WM8728)	+= snd-soc-wm8728.o
 obj-$(CONFIG_SND_SOC_WM8731)	+= snd-soc-wm8731.o
+obj-$(CONFIG_SND_SOC_WM8731_I2C)	+= snd-soc-wm8731-i2c.o
+obj-$(CONFIG_SND_SOC_WM8731_SPI)	+= snd-soc-wm8731-spi.o
 obj-$(CONFIG_SND_SOC_WM8737)	+= snd-soc-wm8737.o
 obj-$(CONFIG_SND_SOC_WM8741)	+= snd-soc-wm8741.o
 obj-$(CONFIG_SND_SOC_WM8750)	+= snd-soc-wm8750.o
diff --git a/sound/soc/codecs/wm8731-i2c.c b/sound/soc/codecs/wm8731-i2c.c
new file mode 100644
index 000000000000..c70f5db891e7
--- /dev/null
+++ b/sound/soc/codecs/wm8731-i2c.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * wm8731-i2c.c  --  WM8731 ALSA SoC Audio driver I2C code
+ *
+ * Copyright 2005 Openedhand Ltd.
+ * Copyright 2006-12 Wolfson Microelectronics, plc
+ *
+ * Author: Richard Purdie <richard@openedhand.com>
+ *
+ * Based on wm8753.c by Liam Girdwood
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+
+#include "wm8731.h"
+
+
+static const struct of_device_id wm8731_of_match[] = {
+	{ .compatible = "wlf,wm8731", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, wm8731_of_match);
+
+static int wm8731_i2c_probe(struct i2c_client *i2c,
+			    const struct i2c_device_id *id)
+{
+	struct wm8731_priv *wm8731;
+	int ret;
+
+	wm8731 = devm_kzalloc(&i2c->dev, sizeof(struct wm8731_priv),
+			      GFP_KERNEL);
+	if (wm8731 == NULL)
+		return -ENOMEM;
+
+	i2c_set_clientdata(i2c, wm8731);
+
+	wm8731->regmap = devm_regmap_init_i2c(i2c, &wm8731_regmap);
+	if (IS_ERR(wm8731->regmap)) {
+		ret = PTR_ERR(wm8731->regmap);
+		dev_err(&i2c->dev, "Failed to allocate register map: %d\n",
+			ret);
+		return ret;
+	}
+
+	return wm8731_init(&i2c->dev, wm8731);
+}
+
+static const struct i2c_device_id wm8731_i2c_id[] = {
+	{ "wm8731", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, wm8731_i2c_id);
+
+static struct i2c_driver wm8731_i2c_driver = {
+	.driver = {
+		.name = "wm8731",
+		.of_match_table = wm8731_of_match,
+	},
+	.probe =    wm8731_i2c_probe,
+	.id_table = wm8731_i2c_id,
+};
+
+module_i2c_driver(wm8731_i2c_driver);
+
+MODULE_DESCRIPTION("ASoC WM8731 driver - I2C");
+MODULE_AUTHOR("Richard Purdie");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/wm8731-spi.c b/sound/soc/codecs/wm8731-spi.c
new file mode 100644
index 000000000000..542ed097d89a
--- /dev/null
+++ b/sound/soc/codecs/wm8731-spi.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * wm8731.c  --  WM8731 ALSA SoC Audio driver
+ *
+ * Copyright 2005 Openedhand Ltd.
+ * Copyright 2006-12 Wolfson Microelectronics, plc
+ *
+ * Author: Richard Purdie <richard@openedhand.com>
+ *
+ * Based on wm8753.c by Liam Girdwood
+ */
+
+#include <linux/spi/spi.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+
+#include "wm8731.h"
+
+static const struct of_device_id wm8731_of_match[] = {
+	{ .compatible = "wlf,wm8731", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, wm8731_of_match);
+
+static int wm8731_spi_probe(struct spi_device *spi)
+{
+	struct wm8731_priv *wm8731;
+	int ret;
+
+	wm8731 = devm_kzalloc(&spi->dev, sizeof(*wm8731), GFP_KERNEL);
+	if (wm8731 == NULL)
+		return -ENOMEM;
+
+	spi_set_drvdata(spi, wm8731);
+
+	wm8731->regmap = devm_regmap_init_spi(spi, &wm8731_regmap);
+	if (IS_ERR(wm8731->regmap)) {
+		ret = PTR_ERR(wm8731->regmap);
+		dev_err(&spi->dev, "Failed to allocate register map: %d\n",
+			ret);
+		return ret;
+	}
+
+	return wm8731_init(&spi->dev, wm8731);
+}
+
+static struct spi_driver wm8731_spi_driver = {
+	.driver = {
+		.name	= "wm8731",
+		.of_match_table = wm8731_of_match,
+	},
+	.probe		= wm8731_spi_probe,
+};
+
+module_spi_driver(wm8731_spi_driver);
+
+MODULE_DESCRIPTION("ASoC WM8731 driver - SPI");
+MODULE_AUTHOR("Richard Purdie");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index 43730aba11fe..2408c4a591d5 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -15,13 +15,9 @@
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
-#include <linux/i2c.h>
 #include <linux/slab.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
-#include <linux/spi/spi.h>
-#include <linux/of_device.h>
-#include <linux/mutex.h>
 #include <linux/clk.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -32,7 +28,6 @@
 
 #include "wm8731.h"
 
-#define WM8731_NUM_SUPPLIES 4
 static const char *wm8731_supply_names[WM8731_NUM_SUPPLIES] = {
 	"AVDD",
 	"HPVDD",
@@ -40,21 +35,6 @@ static const char *wm8731_supply_names[WM8731_NUM_SUPPLIES] = {
 	"DBVDD",
 };
 
-/* codec private data */
-struct wm8731_priv {
-	struct regmap *regmap;
-	struct clk *mclk;
-	struct regulator_bulk_data supplies[WM8731_NUM_SUPPLIES];
-	const struct snd_pcm_hw_constraint_list *constraints;
-	unsigned int sysclk;
-	int sysclk_type;
-	int playback_fs;
-	bool deemph;
-
-	struct mutex lock;
-};
-
-
 /*
  * wm8731 register cache
  */
@@ -584,7 +564,7 @@ static const struct snd_soc_component_driver soc_component_dev_wm8731 = {
 	.non_legacy_dai_naming	= 1,
 };
 
-static int wm8731_init(struct device *dev, struct wm8731_priv *wm8731)
+int wm8731_init(struct device *dev, struct wm8731_priv *wm8731)
 {
 	int ret = 0, i;
 
@@ -654,15 +634,9 @@ static int wm8731_init(struct device *dev, struct wm8731_priv *wm8731)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(wm8731_init);
 
-static const struct of_device_id wm8731_of_match[] = {
-	{ .compatible = "wlf,wm8731", },
-	{ }
-};
-
-MODULE_DEVICE_TABLE(of, wm8731_of_match);
-
-static const struct regmap_config wm8731_regmap = {
+const struct regmap_config wm8731_regmap = {
 	.reg_bits = 7,
 	.val_bits = 9,
 
@@ -673,111 +647,7 @@ static const struct regmap_config wm8731_regmap = {
 	.reg_defaults = wm8731_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8731_reg_defaults),
 };
-
-#if defined(CONFIG_SPI_MASTER)
-static int wm8731_spi_probe(struct spi_device *spi)
-{
-	struct wm8731_priv *wm8731;
-	int ret;
-
-	wm8731 = devm_kzalloc(&spi->dev, sizeof(*wm8731), GFP_KERNEL);
-	if (wm8731 == NULL)
-		return -ENOMEM;
-
-	spi_set_drvdata(spi, wm8731);
-
-	wm8731->regmap = devm_regmap_init_spi(spi, &wm8731_regmap);
-	if (IS_ERR(wm8731->regmap)) {
-		ret = PTR_ERR(wm8731->regmap);
-		dev_err(&spi->dev, "Failed to allocate register map: %d\n",
-			ret);
-		return ret;
-	}
-
-	return wm8731_init(&spi->dev, wm8731);
-}
-
-static struct spi_driver wm8731_spi_driver = {
-	.driver = {
-		.name	= "wm8731",
-		.of_match_table = wm8731_of_match,
-	},
-	.probe		= wm8731_spi_probe,
-};
-#endif /* CONFIG_SPI_MASTER */
-
-#if IS_ENABLED(CONFIG_I2C)
-static int wm8731_i2c_probe(struct i2c_client *i2c,
-			    const struct i2c_device_id *id)
-{
-	struct wm8731_priv *wm8731;
-	int ret;
-
-	wm8731 = devm_kzalloc(&i2c->dev, sizeof(struct wm8731_priv),
-			      GFP_KERNEL);
-	if (wm8731 == NULL)
-		return -ENOMEM;
-
-	i2c_set_clientdata(i2c, wm8731);
-
-	wm8731->regmap = devm_regmap_init_i2c(i2c, &wm8731_regmap);
-	if (IS_ERR(wm8731->regmap)) {
-		ret = PTR_ERR(wm8731->regmap);
-		dev_err(&i2c->dev, "Failed to allocate register map: %d\n",
-			ret);
-		return ret;
-	}
-
-	return wm8731_init(&i2c->dev, wm8731);
-}
-
-static const struct i2c_device_id wm8731_i2c_id[] = {
-	{ "wm8731", 0 },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, wm8731_i2c_id);
-
-static struct i2c_driver wm8731_i2c_driver = {
-	.driver = {
-		.name = "wm8731",
-		.of_match_table = wm8731_of_match,
-	},
-	.probe =    wm8731_i2c_probe,
-	.id_table = wm8731_i2c_id,
-};
-#endif
-
-static int __init wm8731_modinit(void)
-{
-	int ret = 0;
-#if IS_ENABLED(CONFIG_I2C)
-	ret = i2c_add_driver(&wm8731_i2c_driver);
-	if (ret != 0) {
-		printk(KERN_ERR "Failed to register WM8731 I2C driver: %d\n",
-		       ret);
-	}
-#endif
-#if defined(CONFIG_SPI_MASTER)
-	ret = spi_register_driver(&wm8731_spi_driver);
-	if (ret != 0) {
-		printk(KERN_ERR "Failed to register WM8731 SPI driver: %d\n",
-		       ret);
-	}
-#endif
-	return ret;
-}
-module_init(wm8731_modinit);
-
-static void __exit wm8731_exit(void)
-{
-#if IS_ENABLED(CONFIG_I2C)
-	i2c_del_driver(&wm8731_i2c_driver);
-#endif
-#if defined(CONFIG_SPI_MASTER)
-	spi_unregister_driver(&wm8731_spi_driver);
-#endif
-}
-module_exit(wm8731_exit);
+EXPORT_SYMBOL_GPL(wm8731_regmap);
 
 MODULE_DESCRIPTION("ASoC WM8731 driver");
 MODULE_AUTHOR("Richard Purdie");
diff --git a/sound/soc/codecs/wm8731.h b/sound/soc/codecs/wm8731.h
index 4fcf1226d7c2..8d5a7a9ca6b2 100644
--- a/sound/soc/codecs/wm8731.h
+++ b/sound/soc/codecs/wm8731.h
@@ -12,6 +12,13 @@
 #ifndef _WM8731_H
 #define _WM8731_H
 
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+
+struct clk;
+struct snd_pcm_hw_constraint_list;
+
 /* WM8731 register space */
 
 #define WM8731_LINVOL   0x00
@@ -33,4 +40,24 @@
 
 #define WM8731_DAI		0
 
+#define WM8731_NUM_SUPPLIES 4
+
+/* codec private data */
+struct wm8731_priv {
+	struct regmap *regmap;
+	struct clk *mclk;
+	struct regulator_bulk_data supplies[WM8731_NUM_SUPPLIES];
+	const struct snd_pcm_hw_constraint_list *constraints;
+	unsigned int sysclk;
+	int sysclk_type;
+	int playback_fs;
+	bool deemph;
+
+	struct mutex lock;
+};
+
+extern const struct regmap_config wm8731_regmap;
+
+int wm8731_init(struct device *dev, struct wm8731_priv *wm8731);
+
 #endif
diff --git a/sound/soc/pxa/Kconfig b/sound/soc/pxa/Kconfig
index 9d40e8a206d1..c51e1961ca20 100644
--- a/sound/soc/pxa/Kconfig
+++ b/sound/soc/pxa/Kconfig
@@ -45,7 +45,7 @@ config SND_PXA2XX_SOC_CORGI
 	tristate "SoC Audio support for Sharp Zaurus SL-C7x0"
 	depends on SND_PXA2XX_SOC && PXA_SHARP_C7xx && I2C
 	select SND_PXA2XX_SOC_I2S
-	select SND_SOC_WM8731
+	select SND_SOC_WM8731_I2C
 	help
 	  Say Y if you want to add support for SoC audio on Sharp
 	  Zaurus SL-C7x0 models (Corgi, Shepherd, Husky).
@@ -71,7 +71,7 @@ config SND_PXA2XX_SOC_POODLE
 	tristate "SoC Audio support for Poodle"
 	depends on SND_PXA2XX_SOC && MACH_POODLE && I2C
 	select SND_PXA2XX_SOC_I2S
-	select SND_SOC_WM8731
+	select SND_SOC_WM8731_I2C
 	help
 	  Say Y if you want to add support for SoC audio on Sharp
 	  Zaurus SL-5600 model (Poodle).
-- 
2.30.2

