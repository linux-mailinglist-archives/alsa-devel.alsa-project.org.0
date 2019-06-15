Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A342346F2C
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jun 2019 11:07:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 125BD183E;
	Sat, 15 Jun 2019 11:06:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 125BD183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560589622;
	bh=SMm2sDvftPxZ8GA69lgr5Jnkdxys6mYYByPLaJwEKTo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uVpeAXIGgEFwpYCgkCSYkXafQXgQZTMGZpEtemF8xeMxiKLZCvukMzEMPeOqZYZmk
	 S9j90HHuLDUeX1W95Nn7hZZybyd+rERQtr4cl9y91nYeT3r3EmUlZbAsM4tGKlAolu
	 3U+fEU9QSt6b6FKw//gHKedLmYPua0zgTf0AEMIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E324FF8970F;
	Sat, 15 Jun 2019 11:05:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FEC2F89703; Sat, 15 Jun 2019 11:05:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B19B5F8076F
 for <alsa-devel@alsa-project.org>; Sat, 15 Jun 2019 11:05:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B19B5F8076F
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x5F94vPU002622,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtitcasv01.realtek.com.tw[172.21.6.18])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x5F94vPU002622
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Sat, 15 Jun 2019 17:04:57 +0800
Received: from localhost.localdomain (172.22.102.141) by
 RTITCASV01.realtek.com.tw (172.21.6.18) with Microsoft SMTP Server id
 14.3.439.0; Sat, 15 Jun 2019 17:04:56 +0800
From: <derek.fang@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Sat, 15 Jun 2019 17:04:47 +0800
Message-ID: <1560589487-6610-1-git-send-email-derek.fang@realtek.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [172.22.102.141]
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, Derek Fang <derek.fang@realtek.com>,
 bard.liao@intel.com, shumingf@realtek.com, flove@realtek.com
Subject: [alsa-devel] [PATCH v2] ASoC: rt1308: Add RT1308 amplifier driver
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

From: Derek Fang <derek.fang@realtek.com>

This is the initial amplifier driver for rt1308.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
---
 Documentation/devicetree/bindings/sound/rt1308.txt |  17 +
 sound/soc/codecs/Kconfig                           |   6 +
 sound/soc/codecs/Makefile                          |   2 +
 sound/soc/codecs/rt1308.c                          | 913 +++++++++++++++++++++
 sound/soc/codecs/rt1308.h                          | 291 +++++++
 5 files changed, 1229 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/sound/rt1308.txt
 create mode 100755 sound/soc/codecs/rt1308.c
 create mode 100755 sound/soc/codecs/rt1308.h

diff --git a/Documentation/devicetree/bindings/sound/rt1308.txt b/Documentation/devicetree/bindings/sound/rt1308.txt
new file mode 100755
index 0000000..2d46084
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rt1308.txt
@@ -0,0 +1,17 @@
+RT1308 audio Amplifier
+
+This device supports I2C only.
+
+Required properties:
+
+- compatible : "realtek,rt1308".
+
+- reg : The I2C address of the device.
+
+
+Example:
+
+rt1308: rt1308@10 {
+	compatible = "realtek,rt1308";
+	reg = <0x10>;
+};
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 4dfd469..34979cf 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -143,6 +143,7 @@ config SND_SOC_ALL_CODECS
 	select SND_SOC_RT298 if I2C
 	select SND_SOC_RT1011 if I2C
 	select SND_SOC_RT1305 if I2C
+	select SND_SOC_RT1308 if I2C
 	select SND_SOC_RT5514 if I2C
 	select SND_SOC_RT5616 if I2C
 	select SND_SOC_RT5631 if I2C
@@ -881,6 +882,7 @@ config SND_SOC_RL6231
 	default y if SND_SOC_RT5682=y
 	default y if SND_SOC_RT1011=y
 	default y if SND_SOC_RT1305=y
+	default y if SND_SOC_RT1308=y
 	default m if SND_SOC_RT5514=m
 	default m if SND_SOC_RT5616=m
 	default m if SND_SOC_RT5640=m
@@ -896,6 +898,7 @@ config SND_SOC_RL6231
 	default m if SND_SOC_RT5682=m
 	default m if SND_SOC_RT1011=m
 	default m if SND_SOC_RT1305=m
+	default m if SND_SOC_RT1308=m
 
 config SND_SOC_RL6347A
 	tristate
@@ -924,6 +927,9 @@ config SND_SOC_RT1011
 config SND_SOC_RT1305
 	tristate
 
+config SND_SOC_RT1308
+	tristate
+
 config SND_SOC_RT5514
 	tristate
 
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 112701f..e6eb3b9 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -144,6 +144,7 @@ snd-soc-rl6231-objs := rl6231.o
 snd-soc-rl6347a-objs := rl6347a.o
 snd-soc-rt1011-objs := rt1011.o
 snd-soc-rt1305-objs := rt1305.o
+snd-soc-rt1308-objs := rt1308.o
 snd-soc-rt274-objs := rt274.o
 snd-soc-rt286-objs := rt286.o
 snd-soc-rt298-objs := rt298.o
@@ -420,6 +421,7 @@ obj-$(CONFIG_SND_SOC_RL6231)	+= snd-soc-rl6231.o
 obj-$(CONFIG_SND_SOC_RL6347A)	+= snd-soc-rl6347a.o
 obj-$(CONFIG_SND_SOC_RT1011)	+= snd-soc-rt1011.o
 obj-$(CONFIG_SND_SOC_RT1305)	+= snd-soc-rt1305.o
+obj-$(CONFIG_SND_SOC_RT1308)	+= snd-soc-rt1308.o
 obj-$(CONFIG_SND_SOC_RT274)	+= snd-soc-rt274.o
 obj-$(CONFIG_SND_SOC_RT286)	+= snd-soc-rt286.o
 obj-$(CONFIG_SND_SOC_RT298)	+= snd-soc-rt298.o
diff --git a/sound/soc/codecs/rt1308.c b/sound/soc/codecs/rt1308.c
new file mode 100755
index 0000000..a3cbea9
--- /dev/null
+++ b/sound/soc/codecs/rt1308.c
@@ -0,0 +1,913 @@
+/*
+ * rt1308.c  --  RT1308 ALSA SoC amplifier component driver
+ *
+ * Copyright 2019 Realtek Semiconductor Corp.
+ * Author: Derek Fang <derek.fang@realtek.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/init.h>
+#include <linux/delay.h>
+#include <linux/pm.h>
+#include <linux/gpio.h>
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+#include <linux/of_gpio.h>
+#include <linux/platform_device.h>
+#include <linux/firmware.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <sound/initval.h>
+#include <sound/tlv.h>
+
+#include "rl6231.h"
+#include "rt1308.h"
+
+static const struct reg_sequence init_list[] = {
+
+	{ RT1308_I2C_I2S_SDW_SET,	0x01014005 },
+	{ RT1308_CLASS_D_SET_2,		0x227f5501 },
+	{ RT1308_PADS_1,		0x50150505 },
+	{ RT1308_VREF,			0x18100000 },
+	{ RT1308_IV_SENSE,		0x87010000 },
+	{ RT1308_DUMMY_REG,		0x00000200 },
+	{ RT1308_SIL_DET,		0x61c30000 },
+	{ RT1308_DC_CAL_2,		0x00ffff00 },
+	{ RT1308_CLK_DET,		0x01000000 },
+	{ RT1308_POWER_STATUS,		0x00800000 },
+	{ RT1308_DAC_SET,		0xafaf0700 },
+
+};
+#define RT1308_INIT_REG_LEN ARRAY_SIZE(init_list)
+
+struct rt1308_priv {
+	struct snd_soc_component *component;
+	struct regmap *regmap;
+
+	int sysclk;
+	int sysclk_src;
+	int lrck;
+	int bclk;
+	int master;
+
+	int pll_src;
+	int pll_in;
+	int pll_out;
+};
+
+static const struct reg_default rt1308_reg[] = {
+
+	{ 0x01, 0x1f3f5f00 },
+	{ 0x02, 0x07000000 },
+	{ 0x03, 0x80003e00 },
+	{ 0x04, 0x80800600 },
+	{ 0x05, 0x0aaa1a0a },
+	{ 0x06, 0x52000000 },
+	{ 0x07, 0x00000000 },
+	{ 0x08, 0x00600000 },
+	{ 0x09, 0xe1030000 },
+	{ 0x0a, 0x00000000 },
+	{ 0x0b, 0x30000000 },
+	{ 0x0c, 0x7fff7000 },
+	{ 0x10, 0xffff0700 },
+	{ 0x11, 0x0a000000 },
+	{ 0x12, 0x60040000 },
+	{ 0x13, 0x00000000 },
+	{ 0x14, 0x0f300000 },
+	{ 0x15, 0x00000022 },
+	{ 0x16, 0x02000000 },
+	{ 0x17, 0x01004045 },
+	{ 0x18, 0x00000000 },
+	{ 0x19, 0x00000000 },
+	{ 0x1a, 0x80000000 },
+	{ 0x1b, 0x10325476 },
+	{ 0x1c, 0x1d1d0000 },
+	{ 0x20, 0xd2101300 },
+	{ 0x21, 0xf3ffff00 },
+	{ 0x22, 0x00000000 },
+	{ 0x23, 0x00000000 },
+	{ 0x24, 0x00000000 },
+	{ 0x25, 0x00000000 },
+	{ 0x26, 0x00000000 },
+	{ 0x27, 0x00000000 },
+	{ 0x28, 0x00000000 },
+	{ 0x29, 0x00000000 },
+	{ 0x2a, 0x00000000 },
+	{ 0x2b, 0x00000000 },
+	{ 0x2c, 0x00000000 },
+	{ 0x2d, 0x00000000 },
+	{ 0x2e, 0x00000000 },
+	{ 0x2f, 0x00000000 },
+	{ 0x30, 0x01000000 },
+	{ 0x31, 0x20025501 },
+	{ 0x32, 0x00000000 },
+	{ 0x33, 0x105a0000 },
+	{ 0x34, 0x10100000 },
+	{ 0x35, 0x2aaa52aa },
+	{ 0x36, 0x00c00000 },
+	{ 0x37, 0x20046100 },
+	{ 0x50, 0x10022f00 },
+	{ 0x51, 0x003c0000 },
+	{ 0x54, 0x04000000 },
+	{ 0x55, 0x01000000 },
+	{ 0x56, 0x02000000 },
+	{ 0x57, 0x02000000 },
+	{ 0x58, 0x02000000 },
+	{ 0x59, 0x02000000 },
+	{ 0x5b, 0x02000000 },
+	{ 0x5c, 0x00000000 },
+	{ 0x5d, 0x00000000 },
+	{ 0x5e, 0x00000000 },
+	{ 0x5f, 0x00000000 },
+	{ 0x60, 0x02000000 },
+	{ 0x61, 0x00000000 },
+	{ 0x62, 0x00000000 },
+	{ 0x63, 0x00000000 },
+	{ 0x64, 0x00000000 },
+	{ 0x65, 0x02000000 },
+	{ 0x66, 0x00000000 },
+	{ 0x67, 0x00000000 },
+	{ 0x68, 0x00000000 },
+	{ 0x69, 0x00000000 },
+	{ 0x6a, 0x02000000 },
+	{ 0x6c, 0x00000000 },
+	{ 0x6d, 0x00000000 },
+	{ 0x6e, 0x00000000 },
+	{ 0x70, 0x10EC1308 },
+	{ 0x71, 0x00000000 },
+	{ 0x72, 0x00000000 },
+	{ 0x73, 0x00000000 },
+	{ 0x74, 0x00000000 },
+	{ 0x75, 0x00000000 },
+	{ 0x76, 0x00000000 },
+	{ 0x77, 0x00000000 },
+	{ 0x78, 0x00000000 },
+	{ 0x79, 0x00000000 },
+	{ 0x7a, 0x00000000 },
+	{ 0x7b, 0x00000000 },
+	{ 0x7c, 0x00000000 },
+	{ 0x7d, 0x00000000 },
+	{ 0x7e, 0x00000000 },
+	{ 0x7f, 0x00020f00 },
+	{ 0x80, 0x00000000 },
+	{ 0x81, 0x00000000 },
+	{ 0x82, 0x00000000 },
+	{ 0x83, 0x00000000 },
+	{ 0x84, 0x00000000 },
+	{ 0x85, 0x00000000 },
+	{ 0x86, 0x00000000 },
+	{ 0x87, 0x00000000 },
+	{ 0x88, 0x00000000 },
+	{ 0x89, 0x00000000 },
+	{ 0x8a, 0x00000000 },
+	{ 0x8b, 0x00000000 },
+	{ 0x8c, 0x00000000 },
+	{ 0x8d, 0x00000000 },
+	{ 0x8e, 0x00000000 },
+	{ 0x90, 0x50250905 },
+	{ 0x91, 0x15050000 },
+	{ 0xa0, 0x00000000 },
+	{ 0xa1, 0x00000000 },
+	{ 0xa2, 0x00000000 },
+	{ 0xa3, 0x00000000 },
+	{ 0xa4, 0x00000000 },
+	{ 0xb0, 0x00000000 },
+	{ 0xb1, 0x00000000 },
+	{ 0xb2, 0x00000000 },
+	{ 0xb3, 0x00000000 },
+	{ 0xb4, 0x00000000 },
+	{ 0xb5, 0x00000000 },
+	{ 0xb6, 0x00000000 },
+	{ 0xb7, 0x00000000 },
+	{ 0xb8, 0x00000000 },
+	{ 0xb9, 0x00000000 },
+	{ 0xba, 0x00000000 },
+	{ 0xbb, 0x00000000 },
+	{ 0xc0, 0x01000000 },
+	{ 0xc1, 0x00000000 },
+	{ 0xf0, 0x00000000 },
+};
+
+static int rt1308_reg_init(struct snd_soc_component *component)
+{
+	struct rt1308_priv *rt1308 = snd_soc_component_get_drvdata(component);
+
+	regmap_multi_reg_write(rt1308->regmap, init_list, RT1308_INIT_REG_LEN);
+	return 0;
+}
+
+static bool rt1308_volatile_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case RT1308_RESET:
+	case RT1308_RESET_N:
+	case RT1308_CLK_2:
+	case RT1308_SIL_DET:
+	case RT1308_CLK_DET:
+	case RT1308_DC_DET:
+	case RT1308_DAC_SET:
+	case RT1308_DAC_BUF:
+	case RT1308_SDW_REG_RDATA:
+	case RT1308_DC_CAL_1:
+	case RT1308_PVDD_OFFSET_CTL:
+	case RT1308_CAL_OFFSET_DAC_PBTL:
+	case RT1308_CAL_OFFSET_DAC_L:
+	case RT1308_CAL_OFFSET_DAC_R:
+	case RT1308_CAL_OFFSET_PWM_L:
+	case RT1308_CAL_OFFSET_PWM_R:
+	case RT1308_CAL_PWM_VOS_ADC_L:
+	case RT1308_CAL_PWM_VOS_ADC_R:
+	case RT1308_MBIAS:
+	case RT1308_POWER_STATUS:
+	case RT1308_POWER_INT:
+	case RT1308_SINE_TONE_GEN_2:
+	case RT1308_BQ_SET:
+	case RT1308_BQ_PARA_UPDATE:
+	case RT1308_VEN_DEV_ID:
+	case RT1308_VERSION_ID:
+	case RT1308_EFUSE_1:
+	case RT1308_EFUSE_READ_PVDD_L:
+	case RT1308_EFUSE_READ_PVDD_R:
+	case RT1308_EFUSE_READ_PVDD_PTBL:
+	case RT1308_EFUSE_READ_DEV:
+	case RT1308_EFUSE_READ_R0:
+	case RT1308_EFUSE_READ_ADC_L:
+	case RT1308_EFUSE_READ_ADC_R:
+	case RT1308_EFUSE_READ_ADC_PBTL:
+	case RT1308_EFUSE_RESERVE:
+	case RT1308_EFUSE_DATA_0_MSB:
+	case RT1308_EFUSE_DATA_0_LSB:
+	case RT1308_EFUSE_DATA_1_MSB:
+	case RT1308_EFUSE_DATA_1_LSB:
+	case RT1308_EFUSE_DATA_2_MSB:
+	case RT1308_EFUSE_DATA_2_LSB:
+	case RT1308_EFUSE_DATA_3_MSB:
+	case RT1308_EFUSE_DATA_3_LSB:
+	case RT1308_EFUSE_STATUS_1:
+	case RT1308_EFUSE_STATUS_2:
+	case RT1308_DUMMY_REG:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool rt1308_readable_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case RT1308_RESET:
+	case RT1308_RESET_N:
+	case RT1308_CLK_GATING ... RT1308_DC_DET_THRES:
+	case RT1308_DAC_SET ... RT1308_AD_FILTER_SET:
+	case RT1308_DC_CAL_1 ... RT1308_POWER_INT:
+	case RT1308_SINE_TONE_GEN_1:
+	case RT1308_SINE_TONE_GEN_2:
+	case RT1308_BQ_SET:
+	case RT1308_BQ_PARA_UPDATE:
+	case RT1308_BQ_PRE_VOL_L ... RT1308_BQ_POST_VOL_R:
+	case RT1308_BQ1_L_H0 ... RT1308_BQ2_R_A2:
+	case RT1308_VEN_DEV_ID:
+	case RT1308_VERSION_ID:
+	case RT1308_SPK_BOUND:
+	case RT1308_BQ1_EQ_L_1 ... RT1308_BQ2_EQ_R_3:
+	case RT1308_EFUSE_1 ... RT1308_EFUSE_RESERVE:
+	case RT1308_PADS_1:
+	case RT1308_PADS_2:
+	case RT1308_TEST_MODE:
+	case RT1308_TEST_1:
+	case RT1308_TEST_2:
+	case RT1308_TEST_3:
+	case RT1308_TEST_4:
+	case RT1308_EFUSE_DATA_0_MSB ... RT1308_EFUSE_STATUS_2:
+	case RT1308_TCON_1:
+	case RT1308_TCON_2:
+	case RT1308_DUMMY_REG:
+	case RT1308_MAX_REG:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static int rt1308_classd_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		msleep(30);
+		snd_soc_component_update_bits(component, RT1308_POWER_STATUS,
+			RT1308_POW_PDB_REG_BIT, RT1308_POW_PDB_REG_BIT);
+		msleep(40);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		snd_soc_component_update_bits(component, RT1308_POWER_STATUS,
+			RT1308_POW_PDB_REG_BIT, 0);
+		usleep_range(150000, 200000);
+		break;
+
+	default:
+		return 0;
+	}
+
+	return 0;
+}
+
+static const char * const rt1308_rx_data_ch_select[] = {
+	"LR",
+	"LL",
+	"RL",
+	"RR",
+};
+
+static SOC_ENUM_SINGLE_DECL(rt1308_rx_data_ch_enum, RT1308_DATA_PATH, 24,
+	rt1308_rx_data_ch_select);
+
+static const struct snd_kcontrol_new rt1308_snd_controls[] = {
+
+	/* I2S Data Channel Selection */
+	SOC_ENUM("RX Channel Select", rt1308_rx_data_ch_enum),
+};
+
+static const struct snd_kcontrol_new rt1308_sto_dac_l =
+	SOC_DAPM_SINGLE("Switch", RT1308_DAC_SET,
+		RT1308_DVOL_MUTE_L_EN_SFT, 1, 1);
+
+static const struct snd_kcontrol_new rt1308_sto_dac_r =
+	SOC_DAPM_SINGLE("Switch", RT1308_DAC_SET,
+		RT1308_DVOL_MUTE_R_EN_SFT, 1, 1);
+
+static const struct snd_soc_dapm_widget rt1308_dapm_widgets[] = {
+	/* Audio Interface */
+	SND_SOC_DAPM_AIF_IN("AIF1RX", "AIF1 Playback", 0, SND_SOC_NOPM, 0, 0),
+
+	/* Supply Widgets */
+	SND_SOC_DAPM_SUPPLY("MBIAS20U", RT1308_POWER,
+		RT1308_POW_MBIAS20U_BIT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("ALDO", RT1308_POWER,
+		RT1308_POW_ALDO_BIT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("DBG", RT1308_POWER,
+		RT1308_POW_DBG_BIT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("DACL", RT1308_POWER,
+		RT1308_POW_DACL_BIT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("CLK25M", RT1308_POWER,
+		RT1308_POW_CLK25M_BIT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("ADC_R", RT1308_POWER,
+		RT1308_POW_ADC_R_BIT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("ADC_L", RT1308_POWER,
+		RT1308_POW_ADC_L_BIT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("DLDO", RT1308_POWER,
+		RT1308_POW_DLDO_BIT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("VREF", RT1308_POWER,
+		RT1308_POW_VREF_BIT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("MIXER_R", RT1308_POWER,
+		RT1308_POW_MIXER_R_BIT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("MIXER_L", RT1308_POWER,
+		RT1308_POW_MIXER_L_BIT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("MBIAS4U", RT1308_POWER,
+		RT1308_POW_MBIAS4U_BIT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("PLL2_LDO", RT1308_POWER,
+		RT1308_POW_PLL2_LDO_EN_BIT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("PLL2B", RT1308_POWER,
+		RT1308_POW_PLL2B_EN_BIT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("PLL2F", RT1308_POWER,
+		RT1308_POW_PLL2F_EN_BIT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("PLL2F2", RT1308_POWER,
+		RT1308_POW_PLL2F2_EN_BIT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("PLL2B2", RT1308_POWER,
+		RT1308_POW_PLL2B2_EN_BIT, 0, NULL, 0),
+
+	/* Digital Interface */
+	SND_SOC_DAPM_SUPPLY("DAC Power", RT1308_POWER,
+		RT1308_POW_DAC1_BIT, 0, NULL, 0),
+	SND_SOC_DAPM_DAC("DAC", NULL, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_SWITCH("DAC L", SND_SOC_NOPM, 0, 0, &rt1308_sto_dac_l),
+	SND_SOC_DAPM_SWITCH("DAC R", SND_SOC_NOPM, 0, 0, &rt1308_sto_dac_r),
+
+	/* Output Lines */
+	SND_SOC_DAPM_PGA_E("CLASS D", SND_SOC_NOPM, 0, 0, NULL, 0,
+		rt1308_classd_event,
+		SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMU),
+	SND_SOC_DAPM_OUTPUT("SPOL"),
+	SND_SOC_DAPM_OUTPUT("SPOR"),
+};
+
+static const struct snd_soc_dapm_route rt1308_dapm_routes[] = {
+
+	{ "DAC", NULL, "AIF1RX" },
+
+	{ "DAC", NULL, "MBIAS20U" },
+	{ "DAC", NULL, "ALDO" },
+	{ "DAC", NULL, "DBG" },
+	{ "DAC", NULL, "DACL" },
+	{ "DAC", NULL, "CLK25M" },
+	{ "DAC", NULL, "ADC_R" },
+	{ "DAC", NULL, "ADC_L" },
+	{ "DAC", NULL, "DLDO" },
+	{ "DAC", NULL, "VREF" },
+	{ "DAC", NULL, "MIXER_R" },
+	{ "DAC", NULL, "MIXER_L" },
+	{ "DAC", NULL, "MBIAS4U" },
+	{ "DAC", NULL, "PLL2_LDO" },
+	{ "DAC", NULL, "PLL2B" },
+	{ "DAC", NULL, "PLL2F" },
+	{ "DAC", NULL, "PLL2F2" },
+	{ "DAC", NULL, "PLL2B2" },
+
+	{ "DAC L", "Switch", "DAC" },
+	{ "DAC R", "Switch", "DAC" },
+	{ "DAC L", NULL, "DAC Power" },
+	{ "DAC R", NULL, "DAC Power" },
+
+	{ "CLASS D", NULL, "DAC L" },
+	{ "CLASS D", NULL, "DAC R" },
+	{ "SPOL", NULL, "CLASS D" },
+	{ "SPOR", NULL, "CLASS D" },
+};
+
+static int rt1308_get_clk_info(int sclk, int rate)
+{
+	int i, pd[] = {1, 2, 3, 4, 6, 8, 12, 16};
+
+	if (sclk <= 0 || rate <= 0)
+		return -EINVAL;
+
+	rate = rate << 8;
+	for (i = 0; i < ARRAY_SIZE(pd); i++)
+		if (sclk == rate * pd[i])
+			return i;
+
+	return -EINVAL;
+}
+
+static int rt1308_hw_params(struct snd_pcm_substream *substream,
+	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct rt1308_priv *rt1308 = snd_soc_component_get_drvdata(component);
+	unsigned int val_len = 0, val_clk, mask_clk;
+	int pre_div, bclk_ms, frame_size;
+
+	rt1308->lrck = params_rate(params);
+	pre_div = rt1308_get_clk_info(rt1308->sysclk, rt1308->lrck);
+	if (pre_div < 0) {
+		dev_err(component->dev,
+			"Unsupported clock setting %d\n", rt1308->lrck);
+		return -EINVAL;
+	}
+
+	frame_size = snd_soc_params_to_frame_size(params);
+	if (frame_size < 0) {
+		dev_err(component->dev, "Unsupported frame size: %d\n",
+			frame_size);
+		return -EINVAL;
+	}
+
+	bclk_ms = frame_size > 32;
+	rt1308->bclk = rt1308->lrck * (32 << bclk_ms);
+
+	dev_dbg(component->dev, "bclk_ms is %d and pre_div is %d for iis %d\n",
+				bclk_ms, pre_div, dai->id);
+
+	dev_dbg(component->dev, "lrck is %dHz and pre_div is %d for iis %d\n",
+				rt1308->lrck, pre_div, dai->id);
+
+	switch (params_width(params)) {
+	case 16:
+		val_len |= RT1308_I2S_DL_SEL_16B;
+		break;
+	case 20:
+		val_len |= RT1308_I2S_DL_SEL_20B;
+		break;
+	case 24:
+		val_len |= RT1308_I2S_DL_SEL_24B;
+		break;
+	case 8:
+		val_len |= RT1308_I2S_DL_SEL_8B;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (dai->id) {
+	case RT1308_AIF1:
+		mask_clk = RT1308_DIV_FS_SYS_MASK;
+		val_clk = pre_div << RT1308_DIV_FS_SYS_SFT;
+		snd_soc_component_update_bits(component,
+			RT1308_I2S_SET_2, RT1308_I2S_DL_SEL_MASK,
+			val_len);
+		break;
+	default:
+		dev_err(component->dev, "Invalid dai->id: %d\n", dai->id);
+		return -EINVAL;
+	}
+
+	snd_soc_component_update_bits(component, RT1308_CLK_1,
+		mask_clk, val_clk);
+
+	return 0;
+}
+
+static int rt1308_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct snd_soc_component *component = dai->component;
+	struct rt1308_priv *rt1308 = snd_soc_component_get_drvdata(component);
+	unsigned int reg_val = 0, reg1_val = 0;
+
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBS_CFS:
+		rt1308->master = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		reg_val |= RT1308_I2S_DF_SEL_LEFT;
+		break;
+	case SND_SOC_DAIFMT_DSP_A:
+		reg_val |= RT1308_I2S_DF_SEL_PCM_A;
+		break;
+	case SND_SOC_DAIFMT_DSP_B:
+		reg_val |= RT1308_I2S_DF_SEL_PCM_B;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		reg1_val |= RT1308_I2S_BCLK_INV;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (dai->id) {
+	case RT1308_AIF1:
+		snd_soc_component_update_bits(component,
+			RT1308_I2S_SET_1, RT1308_I2S_DF_SEL_MASK,
+			reg_val);
+		snd_soc_component_update_bits(component,
+			RT1308_I2S_SET_2, RT1308_I2S_BCLK_MASK,
+			reg1_val);
+		break;
+	default:
+		dev_err(component->dev, "Invalid dai->id: %d\n", dai->id);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int rt1308_set_component_sysclk(struct snd_soc_component *component,
+		int clk_id, int source, unsigned int freq, int dir)
+{
+	struct rt1308_priv *rt1308 = snd_soc_component_get_drvdata(component);
+	unsigned int reg_val = 0;
+
+	if (freq == rt1308->sysclk && clk_id == rt1308->sysclk_src)
+		return 0;
+
+	switch (clk_id) {
+	case RT1308_FS_SYS_S_MCLK:
+		reg_val |= RT1308_SEL_FS_SYS_SRC_MCLK;
+		snd_soc_component_update_bits(component,
+			RT1308_CLK_DET, RT1308_MCLK_DET_EN_MASK,
+			RT1308_MCLK_DET_EN);
+		break;
+	case RT1308_FS_SYS_S_BCLK:
+		reg_val |= RT1308_SEL_FS_SYS_SRC_BCLK;
+		break;
+	case RT1308_FS_SYS_S_PLL:
+		reg_val |= RT1308_SEL_FS_SYS_SRC_PLL;
+		break;
+	case RT1308_FS_SYS_S_RCCLK:
+		reg_val |= RT1308_SEL_FS_SYS_SRC_RCCLK;
+		break;
+	default:
+		dev_err(component->dev, "Invalid clock id (%d)\n", clk_id);
+		return -EINVAL;
+	}
+	snd_soc_component_update_bits(component, RT1308_CLK_1,
+		RT1308_SEL_FS_SYS_MASK, reg_val);
+	rt1308->sysclk = freq;
+	rt1308->sysclk_src = clk_id;
+
+	dev_dbg(component->dev, "Sysclk is %dHz and clock id is %d\n",
+		freq, clk_id);
+
+	return 0;
+}
+
+static int rt1308_set_component_pll(struct snd_soc_component *component,
+		int pll_id, int source, unsigned int freq_in,
+		unsigned int freq_out)
+{
+	struct rt1308_priv *rt1308 = snd_soc_component_get_drvdata(component);
+	struct rl6231_pll_code pll_code;
+	int ret;
+
+	if (source == rt1308->pll_src && freq_in == rt1308->pll_in &&
+	    freq_out == rt1308->pll_out)
+		return 0;
+
+	if (!freq_in || !freq_out) {
+		dev_dbg(component->dev, "PLL disabled\n");
+
+		rt1308->pll_in = 0;
+		rt1308->pll_out = 0;
+		snd_soc_component_update_bits(component,
+			RT1308_CLK_1, RT1308_SEL_FS_SYS_MASK,
+			RT1308_SEL_FS_SYS_SRC_MCLK);
+		return 0;
+	}
+
+	switch (source) {
+	case RT1308_PLL_S_MCLK:
+		snd_soc_component_update_bits(component,
+			RT1308_CLK_2, RT1308_SEL_PLL_SRC_MASK,
+			RT1308_SEL_PLL_SRC_MCLK);
+		snd_soc_component_update_bits(component,
+			RT1308_CLK_DET, RT1308_MCLK_DET_EN_MASK,
+			RT1308_MCLK_DET_EN);
+		break;
+	case RT1308_PLL_S_BCLK:
+		snd_soc_component_update_bits(component,
+			RT1308_CLK_2, RT1308_SEL_PLL_SRC_MASK,
+			RT1308_SEL_PLL_SRC_BCLK);
+		break;
+	case RT1308_PLL_S_RCCLK:
+		snd_soc_component_update_bits(component,
+			RT1308_CLK_2, RT1308_SEL_PLL_SRC_MASK,
+			RT1308_SEL_PLL_SRC_RCCLK);
+		freq_in = 25000000;
+		break;
+	default:
+		dev_err(component->dev, "Unknown PLL Source %d\n", source);
+		return -EINVAL;
+	}
+
+	ret = rl6231_pll_calc(freq_in, freq_out, &pll_code);
+	if (ret < 0) {
+		dev_err(component->dev, "Unsupport input clock %d\n", freq_in);
+		return ret;
+	}
+
+	dev_dbg(component->dev, "bypass=%d m=%d n=%d k=%d\n",
+		pll_code.m_bp, (pll_code.m_bp ? 0 : pll_code.m_code),
+		pll_code.n_code, pll_code.k_code);
+
+	snd_soc_component_write(component, RT1308_PLL_1,
+		pll_code.k_code << RT1308_PLL1_K_SFT |
+		pll_code.m_bp << RT1308_PLL1_M_BYPASS_SFT |
+		(pll_code.m_bp ? 0 : pll_code.m_code) << RT1308_PLL1_M_SFT |
+		pll_code.n_code << RT1308_PLL1_N_SFT);
+
+	rt1308->pll_in = freq_in;
+	rt1308->pll_out = freq_out;
+	rt1308->pll_src = source;
+
+	return 0;
+}
+
+static int rt1308_probe(struct snd_soc_component *component)
+{
+	struct rt1308_priv *rt1308 = snd_soc_component_get_drvdata(component);
+
+	rt1308->component = component;
+
+	rt1308_reg_init(component);
+
+	return 0;
+}
+
+static void rt1308_remove(struct snd_soc_component *component)
+{
+	struct rt1308_priv *rt1308 = snd_soc_component_get_drvdata(component);
+
+	regmap_write(rt1308->regmap, RT1308_RESET, 0);
+}
+
+#ifdef CONFIG_PM
+static int rt1308_suspend(struct snd_soc_component *component)
+{
+	struct rt1308_priv *rt1308 = snd_soc_component_get_drvdata(component);
+
+	regcache_cache_only(rt1308->regmap, true);
+	regcache_mark_dirty(rt1308->regmap);
+
+	return 0;
+}
+
+static int rt1308_resume(struct snd_soc_component *component)
+{
+	struct rt1308_priv *rt1308 = snd_soc_component_get_drvdata(component);
+
+	regcache_cache_only(rt1308->regmap, false);
+	regcache_sync(rt1308->regmap);
+
+	return 0;
+}
+#else
+#define rt1308_suspend NULL
+#define rt1308_resume NULL
+#endif
+
+#define RT1308_STEREO_RATES SNDRV_PCM_RATE_48000
+#define RT1308_FORMATS (SNDRV_PCM_FMTBIT_S8 | \
+			SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S16_LE | \
+			SNDRV_PCM_FMTBIT_S24_LE)
+
+static const struct snd_soc_dai_ops rt1308_aif_dai_ops = {
+	.hw_params = rt1308_hw_params,
+	.set_fmt = rt1308_set_dai_fmt,
+};
+
+static struct snd_soc_dai_driver rt1308_dai[] = {
+	{
+		.name = "rt1308-aif",
+		.playback = {
+			.stream_name = "AIF1 Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = RT1308_STEREO_RATES,
+			.formats = RT1308_FORMATS,
+		},
+		.ops = &rt1308_aif_dai_ops,
+	},
+};
+
+static const struct snd_soc_component_driver soc_component_dev_rt1308 = {
+	.probe = rt1308_probe,
+	.remove = rt1308_remove,
+	.suspend = rt1308_suspend,
+	.resume = rt1308_resume,
+	.controls = rt1308_snd_controls,
+	.num_controls = ARRAY_SIZE(rt1308_snd_controls),
+	.dapm_widgets = rt1308_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(rt1308_dapm_widgets),
+	.dapm_routes = rt1308_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(rt1308_dapm_routes),
+	.set_sysclk = rt1308_set_component_sysclk,
+	.set_pll = rt1308_set_component_pll,
+	.use_pmdown_time	= 1,
+	.endianness		= 1,
+	.non_legacy_dai_naming	= 1,
+};
+
+static const struct regmap_config rt1308_regmap = {
+	.reg_bits = 8,
+	.val_bits = 32,
+	.max_register = RT1308_MAX_REG,
+	.volatile_reg = rt1308_volatile_register,
+	.readable_reg = rt1308_readable_register,
+	.cache_type = REGCACHE_RBTREE,
+	.reg_defaults = rt1308_reg,
+	.num_reg_defaults = ARRAY_SIZE(rt1308_reg),
+	.use_single_read = true,
+	.use_single_write = true,
+};
+
+#if defined(CONFIG_OF)
+static const struct of_device_id rt1308_of_match[] = {
+	{ .compatible = "realtek,rt1308", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, rt1308_of_match);
+#endif
+
+#ifdef CONFIG_ACPI
+static struct acpi_device_id rt1308_acpi_match[] = {
+	{"10EC1308", 0,},
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, rt1308_acpi_match);
+#endif
+
+static const struct i2c_device_id rt1308_i2c_id[] = {
+	{ "rt1308", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, rt1308_i2c_id);
+
+static void rt1308_efuse(struct rt1308_priv *rt1308)
+{
+	regmap_write(rt1308->regmap, RT1308_RESET, 0);
+
+	regmap_write(rt1308->regmap, RT1308_POWER, 0xff371600);
+	regmap_write(rt1308->regmap, RT1308_CLK_1, 0x52100000);
+	regmap_write(rt1308->regmap, RT1308_I2C_I2S_SDW_SET, 0x01014005);
+	regmap_write(rt1308->regmap, RT1308_CLASS_D_SET_2, 0x227f5501);
+	regmap_write(rt1308->regmap, RT1308_PADS_1, 0x50150505);
+	regmap_write(rt1308->regmap, RT1308_VREF, 0x18100000);
+	regmap_write(rt1308->regmap, RT1308_IV_SENSE, 0x87010000);
+	regmap_write(rt1308->regmap, RT1308_DUMMY_REG, 0x00000200);
+	regmap_write(rt1308->regmap, RT1308_SIL_DET, 0x61c30000);
+	regmap_write(rt1308->regmap, RT1308_CLK_DET, 0x03700000);
+	regmap_write(rt1308->regmap, RT1308_SINE_TONE_GEN_1, 0x50022f00);
+	regmap_write(rt1308->regmap, RT1308_POWER_STATUS, 0x01800000);
+	regmap_write(rt1308->regmap, RT1308_DC_CAL_2, 0x00ffff00);
+	regmap_write(rt1308->regmap, RT1308_CLASS_D_SET_2, 0x607e5501);
+
+	regmap_write(rt1308->regmap, RT1308_CLK_2, 0x0060e000);
+	regmap_write(rt1308->regmap, RT1308_EFUSE_1, 0x04fe0f00);
+	msleep(100);
+	regmap_write(rt1308->regmap, RT1308_EFUSE_1, 0x44fe0f00);
+	msleep(20);
+	regmap_write(rt1308->regmap, RT1308_PVDD_OFFSET_CTL, 0x10000000);
+
+	regmap_write(rt1308->regmap, RT1308_POWER_STATUS, 0x00800000);
+	regmap_write(rt1308->regmap, RT1308_POWER, 0x0);
+	regmap_write(rt1308->regmap, RT1308_CLK_1, 0x52000000);
+	regmap_write(rt1308->regmap, RT1308_CLASS_D_SET_2, 0x227f5501);
+	regmap_write(rt1308->regmap, RT1308_SINE_TONE_GEN_1, 0x10022f00);
+}
+
+static int rt1308_i2c_probe(struct i2c_client *i2c,
+		    const struct i2c_device_id *id)
+{
+	struct rt1308_priv *rt1308;
+	int ret;
+	unsigned int val;
+
+	rt1308 = devm_kzalloc(&i2c->dev, sizeof(struct rt1308_priv),
+				GFP_KERNEL);
+	if (rt1308 == NULL)
+		return -ENOMEM;
+
+	i2c_set_clientdata(i2c, rt1308);
+
+	rt1308->regmap = devm_regmap_init_i2c(i2c, &rt1308_regmap);
+	if (IS_ERR(rt1308->regmap)) {
+		ret = PTR_ERR(rt1308->regmap);
+		dev_err(&i2c->dev, "Failed to allocate register map: %d\n",
+			ret);
+		return ret;
+	}
+
+	regmap_read(rt1308->regmap, RT1308_VEN_DEV_ID, &val);
+	/* ignore last byte difference */
+	if ((val & 0xFFFFFF00) != RT1308_DEVICE_ID_NUM) {
+		dev_err(&i2c->dev,
+			"Device with ID register %x is not rt1308\n", val);
+		return -ENODEV;
+	}
+
+	rt1308_efuse(rt1308);
+
+	return devm_snd_soc_register_component(&i2c->dev,
+			&soc_component_dev_rt1308,
+			rt1308_dai, ARRAY_SIZE(rt1308_dai));
+}
+
+static int rt1308_i2c_remove(struct i2c_client *i2c)
+{
+	snd_soc_unregister_component(&i2c->dev);
+
+	return 0;
+}
+
+static void rt1308_i2c_shutdown(struct i2c_client *client)
+{
+	struct rt1308_priv *rt1308 = i2c_get_clientdata(client);
+
+	regmap_write(rt1308->regmap, RT1308_RESET, 0);
+}
+
+
+static struct i2c_driver rt1308_i2c_driver = {
+	.driver = {
+		.name = "rt1308",
+		.owner = THIS_MODULE,
+#if defined(CONFIG_OF)
+		.of_match_table = rt1308_of_match,
+#endif
+#if defined(CONFIG_ACPI)
+		.acpi_match_table = ACPI_PTR(rt1308_acpi_match)
+#endif
+	},
+	.probe = rt1308_i2c_probe,
+	.remove   = rt1308_i2c_remove,
+	.shutdown = rt1308_i2c_shutdown,
+	.id_table = rt1308_i2c_id,
+};
+module_i2c_driver(rt1308_i2c_driver);
+
+MODULE_DESCRIPTION("ASoC RT1308 amplifier driver");
+MODULE_AUTHOR("Derek Fang <derek.fang@realtek.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/rt1308.h b/sound/soc/codecs/rt1308.h
new file mode 100755
index 0000000..c330aae
--- /dev/null
+++ b/sound/soc/codecs/rt1308.h
@@ -0,0 +1,291 @@
+/*
+ * RT1308.h  --  RT1308 ALSA SoC amplifier component driver
+ *
+ * Copyright 2019 Realtek Semiconductor Corp.
+ * Author: Derek Fang <derek.fang@realtek.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef _RT1308_H_
+#define _RT1308_H_
+
+#define RT1308_DEVICE_ID_NUM			0x10ec1300
+
+#define RT1308_RESET				0x00
+#define RT1308_RESET_N				0x01
+#define RT1308_CLK_GATING			0x02
+#define RT1308_PLL_1				0x03
+#define RT1308_PLL_2				0x04
+#define RT1308_PLL_INT				0x05
+#define RT1308_CLK_1				0x06
+#define RT1308_DATA_PATH			0x07
+#define RT1308_CLK_2				0x08
+#define RT1308_SIL_DET				0x09
+#define RT1308_CLK_DET				0x0a
+#define RT1308_DC_DET				0x0b
+#define RT1308_DC_DET_THRES			0x0c
+#define RT1308_DAC_SET				0x10
+#define RT1308_SRC_SET				0x11
+#define RT1308_DAC_BUF				0x12
+#define RT1308_ADC_SET				0x13
+#define RT1308_ADC_SET_INT			0x14
+#define RT1308_I2S_SET_1			0x15
+#define RT1308_I2S_SET_2			0x16
+#define RT1308_I2C_I2S_SDW_SET			0x17
+#define RT1308_SDW_REG_RW			0x18
+#define RT1308_SDW_REG_RDATA			0x19
+#define RT1308_IV_SENSE				0x1a
+#define RT1308_I2S_TX_DAC_SET			0x1b
+#define RT1308_AD_FILTER_SET			0x1c
+#define RT1308_DC_CAL_1				0x20
+#define RT1308_DC_CAL_2				0x21
+#define RT1308_DC_CAL_L_OFFSET			0x22
+#define RT1308_DC_CAL_R_OFFSET			0x23
+#define RT1308_PVDD_OFFSET_CTL			0x24
+#define RT1308_PVDD_OFFSET_L			0x25
+#define RT1308_PVDD_OFFSET_R			0x26
+#define RT1308_PVDD_OFFSET_PBTL			0x27
+#define RT1308_PVDD_OFFSET_PVDD			0x28
+#define RT1308_CAL_OFFSET_DAC_PBTL		0x29
+#define RT1308_CAL_OFFSET_DAC_L			0x2a
+#define RT1308_CAL_OFFSET_DAC_R			0x2b
+#define RT1308_CAL_OFFSET_PWM_L			0x2c
+#define RT1308_CAL_OFFSET_PWM_R			0x2d
+#define RT1308_CAL_PWM_VOS_ADC_L		0x2e
+#define RT1308_CAL_PWM_VOS_ADC_R		0x2f
+#define RT1308_CLASS_D_SET_1			0x30
+#define RT1308_CLASS_D_SET_2			0x31
+#define RT1308_POWER				0x32
+#define RT1308_LDO				0x33
+#define RT1308_VREF				0x34
+#define RT1308_MBIAS				0x35
+#define RT1308_POWER_STATUS			0x36
+#define RT1308_POWER_INT			0x37
+#define RT1308_SINE_TONE_GEN_1			0x50
+#define RT1308_SINE_TONE_GEN_2			0x51
+#define RT1308_BQ_SET				0x54
+#define RT1308_BQ_PARA_UPDATE			0x55
+#define RT1308_BQ_PRE_VOL_L			0x56
+#define RT1308_BQ_PRE_VOL_R			0x57
+#define RT1308_BQ_POST_VOL_L			0x58
+#define RT1308_BQ_POST_VOL_R			0x59
+#define RT1308_BQ1_L_H0				0x5b
+#define RT1308_BQ1_L_B1				0x5c
+#define RT1308_BQ1_L_B2				0x5d
+#define RT1308_BQ1_L_A1				0x5e
+#define RT1308_BQ1_L_A2				0x5f
+#define RT1308_BQ1_R_H0				0x60
+#define RT1308_BQ1_R_B1				0x61
+#define RT1308_BQ1_R_B2				0x62
+#define RT1308_BQ1_R_A1				0x63
+#define RT1308_BQ1_R_A2				0x64
+#define RT1308_BQ2_L_H0				0x65
+#define RT1308_BQ2_L_B1				0x66
+#define RT1308_BQ2_L_B2				0x67
+#define RT1308_BQ2_L_A1				0x68
+#define RT1308_BQ2_L_A2				0x69
+#define RT1308_BQ2_R_H0				0x6a
+#define RT1308_BQ2_R_B1				0x6b
+#define RT1308_BQ2_R_B2				0x6c
+#define RT1308_BQ2_R_A1				0x6d
+#define RT1308_BQ2_R_A2				0x6e
+#define RT1308_VEN_DEV_ID			0x70
+#define RT1308_VERSION_ID			0x71
+#define RT1308_SPK_BOUND			0x72
+#define RT1308_BQ1_EQ_L_1			0x73
+#define RT1308_BQ1_EQ_L_2			0x74
+#define RT1308_BQ1_EQ_L_3			0x75
+#define RT1308_BQ1_EQ_R_1			0x76
+#define RT1308_BQ1_EQ_R_2			0x77
+#define RT1308_BQ1_EQ_R_3			0x78
+#define RT1308_BQ2_EQ_L_1			0x79
+#define RT1308_BQ2_EQ_L_2			0x7a
+#define RT1308_BQ2_EQ_L_3			0x7b
+#define RT1308_BQ2_EQ_R_1			0x7c
+#define RT1308_BQ2_EQ_R_2			0x7d
+#define RT1308_BQ2_EQ_R_3			0x7e
+#define RT1308_EFUSE_1				0x7f
+#define RT1308_EFUSE_2				0x80
+#define RT1308_EFUSE_PROG_PVDD_L		0x81
+#define RT1308_EFUSE_PROG_PVDD_R		0x82
+#define RT1308_EFUSE_PROG_R0_L			0x83
+#define RT1308_EFUSE_PROG_R0_R			0x84
+#define RT1308_EFUSE_PROG_DEV			0x85
+#define RT1308_EFUSE_READ_PVDD_L		0x86
+#define RT1308_EFUSE_READ_PVDD_R		0x87
+#define RT1308_EFUSE_READ_PVDD_PTBL		0x88
+#define RT1308_EFUSE_READ_DEV			0x89
+#define RT1308_EFUSE_READ_R0			0x8a
+#define RT1308_EFUSE_READ_ADC_L			0x8b
+#define RT1308_EFUSE_READ_ADC_R			0x8c
+#define RT1308_EFUSE_READ_ADC_PBTL		0x8d
+#define RT1308_EFUSE_RESERVE			0x8e
+#define RT1308_PADS_1				0x90
+#define RT1308_PADS_2				0x91
+#define RT1308_TEST_MODE			0xa0
+#define RT1308_TEST_1				0xa1
+#define RT1308_TEST_2				0xa2
+#define RT1308_TEST_3				0xa3
+#define RT1308_TEST_4				0xa4
+#define RT1308_EFUSE_DATA_0_MSB			0xb0
+#define RT1308_EFUSE_DATA_0_LSB			0xb1
+#define RT1308_EFUSE_DATA_1_MSB			0xb2
+#define RT1308_EFUSE_DATA_1_LSB			0xb3
+#define RT1308_EFUSE_DATA_2_MSB			0xb4
+#define RT1308_EFUSE_DATA_2_LSB			0xb5
+#define RT1308_EFUSE_DATA_3_MSB			0xb6
+#define RT1308_EFUSE_DATA_3_LSB			0xb7
+#define RT1308_EFUSE_DATA_TEST_MSB		0xb8
+#define RT1308_EFUSE_DATA_TEST_LSB		0xb9
+#define RT1308_EFUSE_STATUS_1			0xba
+#define RT1308_EFUSE_STATUS_2			0xbb
+#define RT1308_TCON_1				0xc0
+#define RT1308_TCON_2				0xc1
+#define RT1308_DUMMY_REG			0xf0
+#define RT1308_MAX_REG				0xff
+
+/* PLL1 M/N/K Code-1 (0x03) */
+#define RT1308_PLL1_K_SFT			24
+#define RT1308_PLL1_K_MASK			(0x1f << 24)
+#define RT1308_PLL1_M_BYPASS_MASK		(0x1 << 23)
+#define RT1308_PLL1_M_BYPASS_SFT		23
+#define RT1308_PLL1_M_BYPASS			(0x1 << 23)
+#define RT1308_PLL1_M_MASK			(0x3f << 16)
+#define RT1308_PLL1_M_SFT			16
+#define RT1308_PLL1_N_MASK			(0x7f << 8)
+#define RT1308_PLL1_N_SFT			8
+
+/* CLOCK-1 (0x06) */
+#define RT1308_DIV_FS_SYS_MASK			(0xf << 28)
+#define RT1308_DIV_FS_SYS_SFT			28
+#define RT1308_SEL_FS_SYS_MASK			(0x7 << 24)
+#define RT1308_SEL_FS_SYS_SFT			24
+#define RT1308_SEL_FS_SYS_SRC_MCLK		(0x0 << 24)
+#define RT1308_SEL_FS_SYS_SRC_BCLK		(0x1 << 24)
+#define RT1308_SEL_FS_SYS_SRC_PLL		(0x2 << 24)
+#define RT1308_SEL_FS_SYS_SRC_RCCLK		(0x4 << 24)
+
+/* CLOCK-2 (0x08) */
+#define RT1308_DIV_PRE_PLL_MASK			(0xf << 28)
+#define RT1308_DIV_PRE_PLL_SFT			28
+#define RT1308_SEL_PLL_SRC_MASK			(0x7 << 24)
+#define RT1308_SEL_PLL_SRC_SFT			24
+#define RT1308_SEL_PLL_SRC_MCLK			(0x0 << 24)
+#define RT1308_SEL_PLL_SRC_BCLK			(0x1 << 24)
+#define RT1308_SEL_PLL_SRC_RCCLK		(0x4 << 24)
+
+/* Clock Detect (0x0a) */
+#define RT1308_MCLK_DET_EN_MASK			(0x1 << 25)
+#define RT1308_MCLK_DET_EN_SFT			25
+#define RT1308_MCLK_DET_EN			(0x1 << 25)
+#define RT1308_BCLK_DET_EN_MASK			(0x1 << 24)
+#define RT1308_BCLK_DET_EN_SFT			24
+#define RT1308_BCLK_DET_EN			(0x1 << 24)
+
+/* DAC Setting (0x10) */
+#define RT1308_DVOL_MUTE_R_EN_SFT		7
+#define RT1308_DVOL_MUTE_L_EN_SFT		6
+
+/* I2S Setting-1 (0x15) */
+#define RT1308_I2S_DF_SEL_MASK			(0x3 << 12)
+#define RT1308_I2S_DF_SEL_SFT			12
+#define RT1308_I2S_DF_SEL_I2S			(0x0 << 12)
+#define RT1308_I2S_DF_SEL_LEFT			(0x1 << 12)
+#define RT1308_I2S_DF_SEL_PCM_A			(0x2 << 12)
+#define RT1308_I2S_DF_SEL_PCM_B			(0x3 << 12)
+#define RT1308_I2S_DL_RX_SEL_MASK		(0x7 << 4)
+#define RT1308_I2S_DL_RX_SEL_SFT		4
+#define RT1308_I2S_DL_RX_SEL_16B		(0x0 << 4)
+#define RT1308_I2S_DL_RX_SEL_20B		(0x1 << 4)
+#define RT1308_I2S_DL_RX_SEL_24B		(0x2 << 4)
+#define RT1308_I2S_DL_RX_SEL_32B		(0x3 << 4)
+#define RT1308_I2S_DL_RX_SEL_8B			(0x4 << 4)
+#define RT1308_I2S_DL_TX_SEL_MASK		(0x7 << 0)
+#define RT1308_I2S_DL_TX_SEL_SFT		0
+#define RT1308_I2S_DL_TX_SEL_16B		(0x0 << 0)
+#define RT1308_I2S_DL_TX_SEL_20B		(0x1 << 0)
+#define RT1308_I2S_DL_TX_SEL_24B		(0x2 << 0)
+#define RT1308_I2S_DL_TX_SEL_32B		(0x3 << 0)
+#define RT1308_I2S_DL_TX_SEL_8B			(0x4 << 0)
+
+/* I2S Setting-2 (0x16) */
+#define RT1308_I2S_DL_SEL_MASK			(0x7 << 24)
+#define RT1308_I2S_DL_SEL_SFT			24
+#define RT1308_I2S_DL_SEL_16B			(0x0 << 24)
+#define RT1308_I2S_DL_SEL_20B			(0x1 << 24)
+#define RT1308_I2S_DL_SEL_24B			(0x2 << 24)
+#define RT1308_I2S_DL_SEL_32B			(0x3 << 24)
+#define RT1308_I2S_DL_SEL_8B			(0x4 << 24)
+#define RT1308_I2S_BCLK_MASK			(0x1 << 14)
+#define RT1308_I2S_BCLK_SFT			14
+#define RT1308_I2S_BCLK_NORMAL			(0x0 << 14)
+#define RT1308_I2S_BCLK_INV			(0x1 << 14)
+
+/* Power Control-1 (0x32) */
+#define RT1308_POW_MBIAS20U			(0x1 << 31)
+#define RT1308_POW_MBIAS20U_BIT			31
+#define RT1308_POW_ALDO				(0x1 << 30)
+#define RT1308_POW_ALDO_BIT			30
+#define RT1308_POW_DBG				(0x1 << 29)
+#define RT1308_POW_DBG_BIT			29
+#define RT1308_POW_DACL				(0x1 << 28)
+#define RT1308_POW_DACL_BIT			28
+#define RT1308_POW_DAC1				(0x1 << 27)
+#define RT1308_POW_DAC1_BIT			27
+#define RT1308_POW_CLK25M			(0x1 << 26)
+#define RT1308_POW_CLK25M_BIT			26
+#define RT1308_POW_ADC_R			(0x1 << 25)
+#define RT1308_POW_ADC_R_BIT			25
+#define RT1308_POW_ADC_L			(0x1 << 24)
+#define RT1308_POW_ADC_L_BIT			24
+#define RT1308_POW_DLDO				(0x1 << 21)
+#define RT1308_POW_DLDO_BIT			21
+#define RT1308_POW_VREF				(0x1 << 20)
+#define RT1308_POW_VREF_BIT			20
+#define RT1308_POW_MIXER_R			(0x1 << 18)
+#define RT1308_POW_MIXER_R_BIT			18
+#define RT1308_POW_MIXER_L			(0x1 << 17)
+#define RT1308_POW_MIXER_L_BIT			17
+#define RT1308_POW_MBIAS4U			(0x1 << 16)
+#define RT1308_POW_MBIAS4U_BIT			16
+#define RT1308_POW_PLL2_LDO_EN			(0x1 << 12)
+#define RT1308_POW_PLL2_LDO_EN_BIT		12
+#define RT1308_POW_PLL2B_EN			(0x1 << 11)
+#define RT1308_POW_PLL2B_EN_BIT			11
+#define RT1308_POW_PLL2F_EN			(0x1 << 10)
+#define RT1308_POW_PLL2F_EN_BIT			10
+#define RT1308_POW_PLL2F2_EN			(0x1 << 9)
+#define RT1308_POW_PLL2F2_EN_BIT		9
+#define RT1308_POW_PLL2B2_EN			(0x1 << 8)
+#define RT1308_POW_PLL2B2_EN_BIT		8
+
+/* Power Control-2 (0x36) */
+#define RT1308_POW_PDB_SRC_BIT			(0x1 << 27)
+#define RT1308_POW_PDB_MN_BIT			(0x1 << 25)
+#define RT1308_POW_PDB_REG_BIT			(0x1 << 24)
+
+
+/* System Clock Source */
+enum {
+	RT1308_FS_SYS_S_MCLK,
+	RT1308_FS_SYS_S_BCLK,
+	RT1308_FS_SYS_S_PLL,
+	RT1308_FS_SYS_S_RCCLK,	/* 25.0 MHz */
+};
+
+/* PLL Source */
+enum {
+	RT1308_PLL_S_MCLK,
+	RT1308_PLL_S_BCLK,
+	RT1308_PLL_S_RCCLK,
+};
+
+enum {
+	RT1308_AIF1,
+	RT1308_AIFS
+};
+
+#endif		/* end of _RT1308_H_ */
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
