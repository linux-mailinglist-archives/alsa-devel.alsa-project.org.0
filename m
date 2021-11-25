Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C2E45DC72
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 15:36:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8BF918B9;
	Thu, 25 Nov 2021 15:35:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8BF918B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637851000;
	bh=S6v/BfVLINkcRx0jvJX0wFoyiqRUDSC2Lhk9WgL7HGA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rvpXZ6B+covLxlnOj06s14/heDITovj9UogeaW3fHKYFv/6hieA/9zlTq5b9YMYNJ
	 2nNySswHnkCgD9aYNlELiB7BM78KVaa/yweQuN27nAqmm6dhuwwItHCthyHkQYxIlT
	 EgR7PyOX/3odpbGV4U/nPwjqBFBL7cWMRfcpa5lY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16FF8F804AB;
	Thu, 25 Nov 2021 15:35:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDBC4F8049E; Thu, 25 Nov 2021 15:35:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E797F80302
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 15:35:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E797F80302
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="MoMyh5UJ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1APBqCmJ025807;
 Thu, 25 Nov 2021 08:35:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=z3BncN1/AnEiaG2CTk4wXWUCkATXrlhRVwwvy7lY31E=;
 b=MoMyh5UJXwdQ2ih8kq2054d+gyFkxXq0/T2qs3S/bKEeOTVlovCBRUToyrLrbo1YtcLw
 /ug2/F2ZMmarWqQkSCql6sh+a+oxz8SuR1bgs29AX1ZWqn4lKS72e3TbyPjHiOJb81Bq
 LtqCRGXdwNfV2M3YfEAwBQrVM9zgoq7vMf0QRmhuWzJO2H0JnMiTZO22ZmJRJz2GCSHn
 5SCzyFXHzQxfe9bLOGGCW5+dOUdC1eHk9s1BV0A9MKCiqE4ftPoPSb20N9dmsGlWMr2s
 baYaxSkw4z8uQUt3qnr3nC494Lgn6//mVQnbs3h3V9YrCClJMAX5HfWRAqQbd/LCGiNF 8w== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3chb8whx2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 25 Nov 2021 08:35:04 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 25 Nov
 2021 14:35:03 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Thu, 25 Nov 2021 14:35:03 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.11])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7F8DC2A1;
 Thu, 25 Nov 2021 14:35:02 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 David Rhodes <david.rhodes@cirrus.com>
Subject: [PATCH] ASoC: cs35l41: Fix link problem
Date: Thu, 25 Nov 2021 14:35:01 +0000
Message-ID: <20211125143501.7720-1-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: BF1YdR_Uk6Xtr5PExd2__xeBEJq-y0kH
X-Proofpoint-ORIG-GUID: BF1YdR_Uk6Xtr5PExd2__xeBEJq-y0kH
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>
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

Can't link I2C and SPI to the same binary, better
to move CS35L41 to 3 modules approach.
And instead of exposing cs35l41_reg, volatile_reg,
readable_reg and precious_reg arrays, move
cs35l41_regmap_i2c/spi to new module and expose it.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 sound/soc/codecs/Kconfig          |  5 ++++
 sound/soc/codecs/Makefile         |  6 +++--
 sound/soc/codecs/cs35l41-i2c.c    | 15 -----------
 sound/soc/codecs/cs35l41-spi.c    | 16 ------------
 sound/soc/codecs/cs35l41-tables.c | 41 ++++++++++++++++++++++++++++---
 sound/soc/codecs/cs35l41.c        |  2 ++
 sound/soc/codecs/cs35l41.h        |  7 ++----
 7 files changed, 50 insertions(+), 42 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 3fe62df32238..6ca1edf0d066 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -613,14 +613,19 @@ config SND_SOC_CS35L36
 	tristate "Cirrus Logic CS35L36 CODEC"
 	depends on I2C
 
+config SND_SOC_CS35L41
+	tristate
+
 config SND_SOC_CS35L41_SPI
 	tristate "Cirrus Logic CS35L41 CODEC (SPI)"
 	depends on SPI_MASTER
+	select SND_SOC_CS35L41
 	select REGMAP_SPI
 
 config SND_SOC_CS35L41_I2C
 	tristate "Cirrus Logic CS35L41 CODEC (I2C)"
 	depends on I2C
+	select SND_SOC_CS35L41
 	select REGMAP_I2C
 
 config SND_SOC_CS42L42
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 9acfbcbfc46d..485eee75502b 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -54,8 +54,9 @@ snd-soc-cs35l33-objs := cs35l33.o
 snd-soc-cs35l34-objs := cs35l34.o
 snd-soc-cs35l35-objs := cs35l35.o
 snd-soc-cs35l36-objs := cs35l36.o
-snd-soc-cs35l41-spi-objs := cs35l41-spi.o cs35l41.o cs35l41-tables.o
-snd-soc-cs35l41-i2c-objs := cs35l41-i2c.o cs35l41.o cs35l41-tables.o
+snd-soc-cs35l41-objs := cs35l41.o cs35l41-tables.o
+snd-soc-cs35l41-spi-objs := cs35l41-spi.o
+snd-soc-cs35l41-i2c-objs := cs35l41-i2c.o
 snd-soc-cs42l42-objs := cs42l42.o
 snd-soc-cs42l51-objs := cs42l51.o
 snd-soc-cs42l51-i2c-objs := cs42l51-i2c.o
@@ -391,6 +392,7 @@ obj-$(CONFIG_SND_SOC_CS35L33)	+= snd-soc-cs35l33.o
 obj-$(CONFIG_SND_SOC_CS35L34)	+= snd-soc-cs35l34.o
 obj-$(CONFIG_SND_SOC_CS35L35)	+= snd-soc-cs35l35.o
 obj-$(CONFIG_SND_SOC_CS35L36)	+= snd-soc-cs35l36.o
+obj-$(CONFIG_SND_SOC_CS35L41)	+= snd-soc-cs35l41.o
 obj-$(CONFIG_SND_SOC_CS35L41_SPI)	+= snd-soc-cs35l41-spi.o
 obj-$(CONFIG_SND_SOC_CS35L41_I2C)	+= snd-soc-cs35l41-i2c.o
 obj-$(CONFIG_SND_SOC_CS42L42)	+= snd-soc-cs42l42.o
diff --git a/sound/soc/codecs/cs35l41-i2c.c b/sound/soc/codecs/cs35l41-i2c.c
index d5fa8d2c4a70..c9b604af6b71 100644
--- a/sound/soc/codecs/cs35l41-i2c.c
+++ b/sound/soc/codecs/cs35l41-i2c.c
@@ -20,21 +20,6 @@
 #include <sound/cs35l41.h>
 #include "cs35l41.h"
 
-static struct regmap_config cs35l41_regmap_i2c = {
-	.reg_bits = 32,
-	.val_bits = 32,
-	.reg_stride = CS35L41_REGSTRIDE,
-	.reg_format_endian = REGMAP_ENDIAN_BIG,
-	.val_format_endian = REGMAP_ENDIAN_BIG,
-	.max_register = CS35L41_LASTREG,
-	.reg_defaults = cs35l41_reg,
-	.num_reg_defaults = ARRAY_SIZE(cs35l41_reg),
-	.volatile_reg = cs35l41_volatile_reg,
-	.readable_reg = cs35l41_readable_reg,
-	.precious_reg = cs35l41_precious_reg,
-	.cache_type = REGCACHE_RBTREE,
-};
-
 static const struct i2c_device_id cs35l41_id_i2c[] = {
 	{ "cs35l40", 0 },
 	{ "cs35l41", 0 },
diff --git a/sound/soc/codecs/cs35l41-spi.c b/sound/soc/codecs/cs35l41-spi.c
index 3fa99741779a..c202d9df70ee 100644
--- a/sound/soc/codecs/cs35l41-spi.c
+++ b/sound/soc/codecs/cs35l41-spi.c
@@ -18,22 +18,6 @@
 #include <sound/cs35l41.h>
 #include "cs35l41.h"
 
-static struct regmap_config cs35l41_regmap_spi = {
-	.reg_bits = 32,
-	.val_bits = 32,
-	.pad_bits = 16,
-	.reg_stride = CS35L41_REGSTRIDE,
-	.reg_format_endian = REGMAP_ENDIAN_BIG,
-	.val_format_endian = REGMAP_ENDIAN_BIG,
-	.max_register = CS35L41_LASTREG,
-	.reg_defaults = cs35l41_reg,
-	.num_reg_defaults = ARRAY_SIZE(cs35l41_reg),
-	.volatile_reg = cs35l41_volatile_reg,
-	.readable_reg = cs35l41_readable_reg,
-	.precious_reg = cs35l41_precious_reg,
-	.cache_type = REGCACHE_RBTREE,
-};
-
 static const struct spi_device_id cs35l41_id_spi[] = {
 	{ "cs35l40", 0 },
 	{ "cs35l41", 0 },
diff --git a/sound/soc/codecs/cs35l41-tables.c b/sound/soc/codecs/cs35l41-tables.c
index 9d1a7d7dd24d..3eb18b17a7b0 100644
--- a/sound/soc/codecs/cs35l41-tables.c
+++ b/sound/soc/codecs/cs35l41-tables.c
@@ -8,7 +8,7 @@
 
 #include "cs35l41.h"
 
-const struct reg_default cs35l41_reg[CS35L41_MAX_CACHE_REG] = {
+static const struct reg_default cs35l41_reg[] = {
 	{ CS35L41_PWR_CTRL1,			0x00000000 },
 	{ CS35L41_PWR_CTRL3,			0x01000010 },
 	{ CS35L41_GPIO_PAD_CONTROL,		0x00000000 },
@@ -47,7 +47,7 @@ const struct reg_default cs35l41_reg[CS35L41_MAX_CACHE_REG] = {
 	{ CS35L41_MIXER_NGATE_CH2_CFG,		0x00000303 },
 };
 
-bool cs35l41_readable_reg(struct device *dev, unsigned int reg)
+static bool cs35l41_readable_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
 	case CS35L41_DEVID:
@@ -331,7 +331,7 @@ bool cs35l41_readable_reg(struct device *dev, unsigned int reg)
 	}
 }
 
-bool cs35l41_precious_reg(struct device *dev, unsigned int reg)
+static bool cs35l41_precious_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
 	case CS35L41_OTP_MEM0 ... CS35L41_OTP_MEM31:
@@ -344,7 +344,7 @@ bool cs35l41_precious_reg(struct device *dev, unsigned int reg)
 	}
 }
 
-bool cs35l41_volatile_reg(struct device *dev, unsigned int reg)
+static bool cs35l41_volatile_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
 	case CS35L41_DEVID:
@@ -688,3 +688,36 @@ const struct cs35l41_otp_map_element_t cs35l41_otp_map_map[CS35L41_NUM_OTP_MAPS]
 		.word_offset = 2,
 	},
 };
+
+struct regmap_config cs35l41_regmap_i2c = {
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
+EXPORT_SYMBOL_GPL(cs35l41_regmap_i2c);
+
+struct regmap_config cs35l41_regmap_spi = {
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
+EXPORT_SYMBOL_GPL(cs35l41_regmap_spi);
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index e8e997efaa8b..60332eae1162 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1724,6 +1724,7 @@ int cs35l41_probe(struct cs35l41_private *cs35l41,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(cs35l41_probe);
 
 void cs35l41_remove(struct cs35l41_private *cs35l41)
 {
@@ -1732,6 +1733,7 @@ void cs35l41_remove(struct cs35l41_private *cs35l41)
 	regulator_bulk_disable(CS35L41_NUM_SUPPLIES, cs35l41->supplies);
 	gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
 }
+EXPORT_SYMBOL_GPL(cs35l41_remove);
 
 MODULE_DESCRIPTION("ASoC CS35L41 driver");
 MODULE_AUTHOR("David Rhodes, Cirrus Logic Inc, <david.rhodes@cirrus.com>");
diff --git a/sound/soc/codecs/cs35l41.h b/sound/soc/codecs/cs35l41.h
index a23eabff074f..c7c45f19754b 100644
--- a/sound/soc/codecs/cs35l41.h
+++ b/sound/soc/codecs/cs35l41.h
@@ -538,7 +538,6 @@
 #define CS35L41_OTP_TRIM_35		0x0000400C
 #define CS35L41_OTP_TRIM_36		0x00002030
 
-#define CS35L41_MAX_CACHE_REG		36
 #define CS35L41_OTP_SIZE_WORDS		32
 #define CS35L41_NUM_OTP_ELEM		100
 #define CS35L41_NUM_OTP_MAPS		5
@@ -734,9 +733,8 @@
 #define CS35L41_RX_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
 #define CS35L41_TX_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
 
-bool cs35l41_readable_reg(struct device *dev, unsigned int reg);
-bool cs35l41_precious_reg(struct device *dev, unsigned int reg);
-bool cs35l41_volatile_reg(struct device *dev, unsigned int reg);
+extern struct regmap_config cs35l41_regmap_i2c;
+extern struct regmap_config cs35l41_regmap_spi;
 
 struct cs35l41_otp_packed_element_t {
 	u32 reg;
@@ -752,7 +750,6 @@ struct cs35l41_otp_map_element_t {
 	u32 word_offset;
 };
 
-extern const struct reg_default cs35l41_reg[CS35L41_MAX_CACHE_REG];
 extern const struct cs35l41_otp_map_element_t
 				cs35l41_otp_map_map[CS35L41_NUM_OTP_MAPS];
 
-- 
2.34.0

