Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F229913AB08
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:28:16 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3D992AAD;
	Tue, 14 Jan 2020 03:57:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3D992AAD
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C45BF8014E;
	Tue, 14 Jan 2020 03:57:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A7D1F8014E; Tue, 14 Jan 2020 03:56:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26C71F800B9
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 03:56:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26C71F800B9
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID 00E2ueLo002093,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCASV01.realtek.com.tw[172.21.6.18])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id 00E2ueLo002093
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 14 Jan 2020 10:56:40 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTITCASV01.realtek.com.tw (172.21.6.18) with Microsoft SMTP Server id
 14.3.468.0; Tue, 14 Jan 2020 10:56:39 +0800
From: <jack.yu@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Tue, 14 Jan 2020 10:56:28 +0800
Message-ID: <20200114025628.4241-1-jack.yu@realtek.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Originating-IP: [172.22.102.1]
Cc: Jack Yu <jack.yu@realtek.com>, alsa-devel@alsa-project.org, lars@metafoo.de,
 kent_chen@realtek.com, kenny_chen@realtek.com, mingjane_hsieh@realtek.com,
 flove@realtek.com
Subject: [alsa-devel] [PATCH] ASoC: rt1015: add rt1015 amplifier driver
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

From: Jack Yu <jack.yu@realtek.com>

This is initial amplifier driver for rt1015.

Signed-off-by: Jack Yu <jack.yu@realtek.com>
---
 .../devicetree/bindings/sound/rt1015.txt      |   17 +
 sound/soc/codecs/Kconfig                      |    6 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/rt1015.c                     | 1016 +++++++++++++++++
 sound/soc/codecs/rt1015.h                     |  368 ++++++
 5 files changed, 1409 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/rt1015.txt
 create mode 100644 sound/soc/codecs/rt1015.c
 create mode 100644 sound/soc/codecs/rt1015.h

diff --git a/Documentation/devicetree/bindings/sound/rt1015.txt b/Documentation/devicetree/bindings/sound/rt1015.txt
new file mode 100644
index 000000000000..fcfd02d8d32f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rt1015.txt
@@ -0,0 +1,17 @@
+RT1015 Mono Class D Audio Amplifier
+
+This device supports I2C only.
+
+Required properties:
+
+- compatible : "realtek,rt1015".
+
+- reg : The I2C address of the device.
+
+
+Example:
+
+rt1015: codec@28 {
+	compatible = "realtek,rt1015";
+	reg = <0x28>;
+};
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index cdfd912d5f8f..d7475e06c3e6 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -149,6 +149,7 @@ config SND_SOC_ALL_CODECS
 	select SND_SOC_RT286 if I2C
 	select SND_SOC_RT298 if I2C
 	select SND_SOC_RT1011 if I2C
+	select SND_SOC_RT1015 if I2C
 	select SND_SOC_RT1305 if I2C
 	select SND_SOC_RT1308 if I2C
 	select SND_SOC_RT5514 if I2C
@@ -956,6 +957,7 @@ config SND_SOC_RL6231
 	default y if SND_SOC_RT5677=y
 	default y if SND_SOC_RT5682=y
 	default y if SND_SOC_RT1011=y
+	default y if SND_SOC_RT1015=y
 	default y if SND_SOC_RT1305=y
 	default y if SND_SOC_RT1308=y
 	default m if SND_SOC_RT5514=m
@@ -972,6 +974,7 @@ config SND_SOC_RL6231
 	default m if SND_SOC_RT5677=m
 	default m if SND_SOC_RT5682=m
 	default m if SND_SOC_RT1011=m
+	default m if SND_SOC_RT1015=m
 	default m if SND_SOC_RT1305=m
 	default m if SND_SOC_RT1308=m
 
@@ -999,6 +1002,9 @@ config SND_SOC_RT298
 config SND_SOC_RT1011
 	tristate
 
+config SND_SOC_RT1015
+	tristate
+
 config SND_SOC_RT1305
 	tristate
 
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index ce285b33a806..3efe6a5797e2 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -152,6 +152,7 @@ snd-soc-rk3328-objs := rk3328_codec.o
 snd-soc-rl6231-objs := rl6231.o
 snd-soc-rl6347a-objs := rl6347a.o
 snd-soc-rt1011-objs := rt1011.o
+snd-soc-rt1015-objs := rt1015.o
 snd-soc-rt1305-objs := rt1305.o
 snd-soc-rt1308-objs := rt1308.o
 snd-soc-rt274-objs := rt274.o
@@ -446,6 +447,7 @@ obj-$(CONFIG_SND_SOC_RK3328)	+= snd-soc-rk3328.o
 obj-$(CONFIG_SND_SOC_RL6231)	+= snd-soc-rl6231.o
 obj-$(CONFIG_SND_SOC_RL6347A)	+= snd-soc-rl6347a.o
 obj-$(CONFIG_SND_SOC_RT1011)	+= snd-soc-rt1011.o
+obj-$(CONFIG_SND_SOC_RT1015)	+= snd-soc-rt1015.o
 obj-$(CONFIG_SND_SOC_RT1305)	+= snd-soc-rt1305.o
 obj-$(CONFIG_SND_SOC_RT1308)	+= snd-soc-rt1308.o
 obj-$(CONFIG_SND_SOC_RT274)	+= snd-soc-rt274.o
diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
new file mode 100644
index 000000000000..317c914cbfc9
--- /dev/null
+++ b/sound/soc/codecs/rt1015.c
@@ -0,0 +1,1016 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * rt1015.c  --  RT1015 ALSA SoC audio amplifier driver
+ *
+ * Copyright 2019 Realtek Semiconductor Corp.
+ * Author: Jack Yu <jack.yu@realtek.com>
+ *
+ */
+
+#include <linux/fs.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/init.h>
+#include <linux/delay.h>
+#include <linux/pm.h>
+#include <linux/regmap.h>
+#include <linux/i2c.h>
+#include <linux/platform_device.h>
+#include <linux/firmware.h>
+#include <linux/gpio.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <sound/initval.h>
+#include <sound/tlv.h>
+
+#include "rl6231.h"
+#include "rt1015.h"
+
+static const struct reg_sequence init_list[] = {
+	{ 0x0000, 0x0000 },
+	{ 0x0104, 0xA213 },
+	{ 0x010E, 0x0058 },
+	{ 0x0111, 0x2000 },
+	{ 0x0322, 0xF7DF },
+	{ 0x1302, 0x12F7 },
+	{ 0x0336, 0x0010 },
+	{ 0x04FC, 0x35CF },
+	{ 0x0102, 0xed02 },
+};
+#define RT1015_INIT_REG_LEN ARRAY_SIZE(init_list)
+
+static const struct reg_default rt1015_reg[] = {
+	{ 0x0000, 0x0000 },
+	{ 0x0004, 0xa000 },
+	{ 0x0006, 0x0003 },
+	{ 0x000a, 0x0802 },
+	{ 0x000c, 0x0020 },
+	{ 0x000e, 0x0000 },
+	{ 0x0010, 0x0000 },
+	{ 0x0012, 0x0000 },
+	{ 0x0020, 0x8000 },
+	{ 0x0022, 0x471b },
+	{ 0x006a, 0x0000 },
+	{ 0x006c, 0x4020 },
+	{ 0x0076, 0x0000 },
+	{ 0x0078, 0x0000 },
+	{ 0x007a, 0x0000 },
+	{ 0x007c, 0x10ec },
+	{ 0x007d, 0x1015 },
+	{ 0x00f0, 0x5000 },
+	{ 0x00f2, 0x0774 },
+	{ 0x00f3, 0x8400 },
+	{ 0x00f4, 0x0000 },
+	{ 0x0100, 0x0028 },
+	{ 0x0102, 0xff02 },
+	{ 0x0104, 0x8232 },
+	{ 0x0106, 0x200c },
+	{ 0x010c, 0x002f },
+	{ 0x010e, 0xc000 },
+	{ 0x0111, 0x0200 },
+	{ 0x0112, 0x0400 },
+	{ 0x0114, 0x0022 },
+	{ 0x0116, 0x0000 },
+	{ 0x0118, 0x0000 },
+	{ 0x011a, 0x0123 },
+	{ 0x011c, 0x4567 },
+	{ 0x0300, 0xdddd },
+	{ 0x0302, 0x0000 },
+	{ 0x0311, 0x9330 },
+	{ 0x0313, 0x0000 },
+	{ 0x0314, 0x0000 },
+	{ 0x031a, 0x00a0 },
+	{ 0x031c, 0x001f },
+	{ 0x031d, 0xffff },
+	{ 0x031e, 0x0000 },
+	{ 0x031f, 0x0000 },
+	{ 0x0321, 0x0000 },
+	{ 0x0322, 0x0000 },
+	{ 0x0328, 0x0000 },
+	{ 0x0329, 0x0000 },
+	{ 0x032a, 0x0000 },
+	{ 0x032b, 0x0000 },
+	{ 0x032c, 0x0000 },
+	{ 0x032d, 0x0000 },
+	{ 0x032e, 0x030e },
+	{ 0x0330, 0x0080 },
+	{ 0x0332, 0x0034 },
+	{ 0x0334, 0x0000 },
+	{ 0x0336, 0x0000 },
+	{ 0x0506, 0x04ff },
+	{ 0x0508, 0x0030 },
+	{ 0x050a, 0x0018 },
+	{ 0x0519, 0x307f },
+	{ 0x051a, 0xffff },
+	{ 0x051b, 0x4000 },
+	{ 0x051d, 0x0000 },
+	{ 0x051f, 0x0000 },
+	{ 0x0536, 0x1000 },
+	{ 0x0538, 0x0000 },
+	{ 0x053a, 0x0000 },
+	{ 0x053c, 0x0000 },
+	{ 0x053d, 0x0000 },
+	{ 0x053e, 0x0000 },
+	{ 0x053f, 0x0000 },
+	{ 0x0540, 0x0000 },
+	{ 0x0541, 0x0000 },
+	{ 0x0542, 0x0000 },
+	{ 0x0543, 0x0000 },
+	{ 0x0544, 0x0000 },
+	{ 0x0568, 0x0000 },
+	{ 0x056a, 0x0000 },
+	{ 0x1000, 0x0000 },
+	{ 0x1002, 0x6505 },
+	{ 0x1006, 0x5515 },
+	{ 0x1007, 0x003f },
+	{ 0x1009, 0x770f },
+	{ 0x100a, 0x01ff },
+	{ 0x100c, 0x0000 },
+	{ 0x100d, 0x0003 },
+	{ 0x1010, 0xa433 },
+	{ 0x1020, 0x0000 },
+	{ 0x1200, 0x3d02 },
+	{ 0x1202, 0x0813 },
+	{ 0x1204, 0x0211 },
+	{ 0x1206, 0x0000 },
+	{ 0x1208, 0x0000 },
+	{ 0x120a, 0x0000 },
+	{ 0x120c, 0x0000 },
+	{ 0x120e, 0x0000 },
+	{ 0x1210, 0x0000 },
+	{ 0x1212, 0x0000 },
+	{ 0x1300, 0x0701 },
+	{ 0x1302, 0x12f9 },
+	{ 0x1304, 0x3405 },
+	{ 0x1305, 0x0844 },
+	{ 0x1306, 0x1611 },
+	{ 0x1308, 0x555e },
+	{ 0x130a, 0x0000 },
+	{ 0x130c, 0x2400},
+	{ 0x130e, 0x7700 },
+	{ 0x130f, 0x0000 },
+	{ 0x1310, 0x0000 },
+	{ 0x1312, 0x0000 },
+	{ 0x1314, 0x0000 },
+	{ 0x1316, 0x0000 },
+	{ 0x1318, 0x0000 },
+	{ 0x131a, 0x0000 },
+	{ 0x1322, 0x0029 },
+	{ 0x1323, 0x4a52 },
+	{ 0x1324, 0x002c },
+	{ 0x1325, 0x0b02 },
+	{ 0x1326, 0x002d },
+	{ 0x1327, 0x6b5a },
+	{ 0x1328, 0x002e },
+	{ 0x1329, 0xcbb2 },
+	{ 0x132a, 0x0030 },
+	{ 0x132b, 0x2c0b },
+	{ 0x1330, 0x0031 },
+	{ 0x1331, 0x8c63 },
+	{ 0x1332, 0x0032 },
+	{ 0x1333, 0xecbb },
+	{ 0x1334, 0x0034 },
+	{ 0x1335, 0x4d13 },
+	{ 0x1336, 0x0037 },
+	{ 0x1337, 0x0dc3 },
+	{ 0x1338, 0x003d },
+	{ 0x1339, 0xef7b },
+	{ 0x133a, 0x0044 },
+	{ 0x133b, 0xd134 },
+	{ 0x133c, 0x0047 },
+	{ 0x133d, 0x91e4 },
+	{ 0x133e, 0x004d },
+	{ 0x133f, 0xc370 },
+	{ 0x1340, 0x0053 },
+	{ 0x1341, 0xf4fd },
+	{ 0x1342, 0x0060 },
+	{ 0x1343, 0x5816 },
+	{ 0x1344, 0x006c },
+	{ 0x1345, 0xbb2e },
+	{ 0x1346, 0x0072 },
+	{ 0x1347, 0xecbb },
+	{ 0x1348, 0x0076 },
+	{ 0x1349, 0x5d97 },
+};
+
+static int rt1015_reg_init(struct snd_soc_component *component)
+{
+	struct rt1015_priv *rt1015 = snd_soc_component_get_drvdata(component);
+
+	regmap_multi_reg_write(rt1015->regmap, init_list, RT1015_INIT_REG_LEN);
+	return 0;
+}
+
+static bool rt1015_volatile_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case RT1015_RESET:
+	case RT1015_CLK_DET:
+	case RT1015_SIL_DET:
+	case RT1015_VER_ID:
+	case RT1015_VENDOR_ID:
+	case RT1015_DEVICE_ID:
+	case RT1015_PRO_ALT:
+	case RT1015_DAC3:
+	case RT1015_VBAT_TEST_OUT1:
+	case RT1015_VBAT_TEST_OUT2:
+	case RT1015_VBAT_PROT_ATT:
+	case RT1015_VBAT_DET_CODE:
+	case RT1015_SMART_BST_CTRL1:
+	case RT1015_SPK_DC_DETECT1:
+	case RT1015_SPK_DC_DETECT4:
+	case RT1015_SPK_DC_DETECT5:
+	case RT1015_DC_CALIB_CLSD1:
+	case RT1015_DC_CALIB_CLSD5:
+	case RT1015_DC_CALIB_CLSD6:
+	case RT1015_DC_CALIB_CLSD7:
+	case RT1015_DC_CALIB_CLSD8:
+	case RT1015_S_BST_TIMING_INTER1:
+		return true;
+
+	default:
+		return false;
+	}
+}
+
+static bool rt1015_readable_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case RT1015_RESET:
+	case RT1015_CLK2:
+	case RT1015_CLK3:
+	case RT1015_PLL1:
+	case RT1015_PLL2:
+	case RT1015_CLK_DET:
+	case RT1015_SIL_DET:
+	case RT1015_CUSTOMER_ID:
+	case RT1015_PCODE_FWVER:
+	case RT1015_VER_ID:
+	case RT1015_VENDOR_ID:
+	case RT1015_DEVICE_ID:
+	case RT1015_PAD_DRV1:
+	case RT1015_PAD_DRV2:
+	case RT1015_GAT_BOOST:
+	case RT1015_PRO_ALT:
+	case RT1015_MAN_I2C:
+	case RT1015_DAC1:
+	case RT1015_DAC2:
+	case RT1015_DAC3:
+	case RT1015_ADC1:
+	case RT1015_ADC2:
+	case RT1015_TDM_MASTER:
+	case RT1015_TDM_TCON:
+	case RT1015_TDM1_1:
+	case RT1015_TDM1_2:
+	case RT1015_TDM1_3:
+	case RT1015_TDM1_4:
+	case RT1015_TDM1_5:
+	case RT1015_MIXER1:
+	case RT1015_MIXER2:
+	case RT1015_ANA_PROTECT1:
+	case RT1015_ANA_CTRL_SEQ1:
+	case RT1015_ANA_CTRL_SEQ2:
+	case RT1015_VBAT_DET_DEB:
+	case RT1015_VBAT_VOLT_DET1:
+	case RT1015_VBAT_VOLT_DET2:
+	case RT1015_VBAT_TEST_OUT1:
+	case RT1015_VBAT_TEST_OUT2:
+	case RT1015_VBAT_PROT_ATT:
+	case RT1015_VBAT_DET_CODE:
+	case RT1015_PWR1:
+	case RT1015_PWR4:
+	case RT1015_PWR5:
+	case RT1015_PWR6:
+	case RT1015_PWR7:
+	case RT1015_PWR8:
+	case RT1015_PWR9:
+	case RT1015_CLASSD_SEQ:
+	case RT1015_SMART_BST_CTRL1:
+	case RT1015_SMART_BST_CTRL2:
+	case RT1015_ANA_CTRL1:
+	case RT1015_ANA_CTRL2:
+	case RT1015_SPK_VOL:
+	case RT1015_SHORT_DETTOP1:
+	case RT1015_SHORT_DETTOP2:
+	case RT1015_SPK_DC_DETECT1:
+	case RT1015_SPK_DC_DETECT2:
+	case RT1015_SPK_DC_DETECT3:
+	case RT1015_SPK_DC_DETECT4:
+	case RT1015_SPK_DC_DETECT5:
+	case RT1015_BAT_RPO_STEP1:
+	case RT1015_BAT_RPO_STEP2:
+	case RT1015_BAT_RPO_STEP3:
+	case RT1015_BAT_RPO_STEP4:
+	case RT1015_BAT_RPO_STEP5:
+	case RT1015_BAT_RPO_STEP6:
+	case RT1015_BAT_RPO_STEP7:
+	case RT1015_BAT_RPO_STEP8:
+	case RT1015_BAT_RPO_STEP9:
+	case RT1015_BAT_RPO_STEP10:
+	case RT1015_BAT_RPO_STEP11:
+	case RT1015_BAT_RPO_STEP12:
+	case RT1015_SPREAD_SPEC1:
+	case RT1015_SPREAD_SPEC2:
+	case RT1015_PAD_STATUS:
+	case RT1015_PADS_PULLING_CTRL1:
+	case RT1015_PADS_DRIVING:
+	case RT1015_SYS_RST1:
+	case RT1015_SYS_RST2:
+	case RT1015_SYS_GATING1:
+	case RT1015_TEST_MODE1:
+	case RT1015_TEST_MODE2:
+	case RT1015_TIMING_CTRL1:
+	case RT1015_PLL_INT:
+	case RT1015_TEST_OUT1:
+	case RT1015_DC_CALIB_CLSD1:
+	case RT1015_DC_CALIB_CLSD2:
+	case RT1015_DC_CALIB_CLSD3:
+	case RT1015_DC_CALIB_CLSD4:
+	case RT1015_DC_CALIB_CLSD5:
+	case RT1015_DC_CALIB_CLSD6:
+	case RT1015_DC_CALIB_CLSD7:
+	case RT1015_DC_CALIB_CLSD8:
+	case RT1015_DC_CALIB_CLSD9:
+	case RT1015_DC_CALIB_CLSD10:
+	case RT1015_CLSD_INTERNAL1:
+	case RT1015_CLSD_INTERNAL2:
+	case RT1015_CLSD_INTERNAL3:
+	case RT1015_CLSD_INTERNAL4:
+	case RT1015_CLSD_INTERNAL5:
+	case RT1015_CLSD_INTERNAL6:
+	case RT1015_CLSD_INTERNAL7:
+	case RT1015_CLSD_INTERNAL8:
+	case RT1015_CLSD_INTERNAL9:
+	case RT1015_CLSD_OCP_CTRL:
+	case RT1015_VREF_LV:
+	case RT1015_MBIAS1:
+	case RT1015_MBIAS2:
+	case RT1015_MBIAS3:
+	case RT1015_MBIAS4:
+	case RT1015_VREF_LV1:
+	case RT1015_S_BST_TIMING_INTER1:
+	case RT1015_S_BST_TIMING_INTER2:
+	case RT1015_S_BST_TIMING_INTER3:
+	case RT1015_S_BST_TIMING_INTER4:
+	case RT1015_S_BST_TIMING_INTER5:
+	case RT1015_S_BST_TIMING_INTER6:
+	case RT1015_S_BST_TIMING_INTER7:
+	case RT1015_S_BST_TIMING_INTER8:
+	case RT1015_S_BST_TIMING_INTER9:
+	case RT1015_S_BST_TIMING_INTER10:
+	case RT1015_S_BST_TIMING_INTER11:
+	case RT1015_S_BST_TIMING_INTER12:
+	case RT1015_S_BST_TIMING_INTER13:
+	case RT1015_S_BST_TIMING_INTER14:
+	case RT1015_S_BST_TIMING_INTER15:
+	case RT1015_S_BST_TIMING_INTER16:
+	case RT1015_S_BST_TIMING_INTER17:
+	case RT1015_S_BST_TIMING_INTER18:
+	case RT1015_S_BST_TIMING_INTER19:
+	case RT1015_S_BST_TIMING_INTER20:
+	case RT1015_S_BST_TIMING_INTER21:
+	case RT1015_S_BST_TIMING_INTER22:
+	case RT1015_S_BST_TIMING_INTER23:
+	case RT1015_S_BST_TIMING_INTER24:
+	case RT1015_S_BST_TIMING_INTER25:
+	case RT1015_S_BST_TIMING_INTER26:
+	case RT1015_S_BST_TIMING_INTER27:
+	case RT1015_S_BST_TIMING_INTER28:
+	case RT1015_S_BST_TIMING_INTER29:
+	case RT1015_S_BST_TIMING_INTER30:
+	case RT1015_S_BST_TIMING_INTER31:
+	case RT1015_S_BST_TIMING_INTER32:
+	case RT1015_S_BST_TIMING_INTER33:
+	case RT1015_S_BST_TIMING_INTER34:
+	case RT1015_S_BST_TIMING_INTER35:
+	case RT1015_S_BST_TIMING_INTER36:
+		return true;
+
+	default:
+		return false;
+	}
+}
+
+static const DECLARE_TLV_DB_SCALE(dac_vol_tlv, -9525, 75, 0);
+
+static const char * const rt1015_din_source_select[] = {
+	"Left",
+	"Right",
+	"Left + Right average",
+};
+
+static SOC_ENUM_SINGLE_DECL(rt1015_mono_lr_sel, RT1015_PAD_DRV2, 4,
+	rt1015_din_source_select);
+
+static const char * const rt1015_boost_mode[] = {
+	"Bypass", "Adaptive", "Fixed Adaptive"
+};
+
+static const SOC_ENUM_SINGLE_DECL(rt1015_boost_mode_enum, 0, 0,
+	rt1015_boost_mode);
+
+static int rt1015_boost_mode_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct rt1015_priv *rt1015 =
+		snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = rt1015->boost_mode;
+
+	return 0;
+}
+
+static int rt1015_boost_mode_put(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct rt1015_priv *rt1015 =
+		snd_soc_component_get_drvdata(component);
+
+	rt1015->boost_mode = ucontrol->value.integer.value[0];
+	if (rt1015->boost_mode == 0) {
+		/* Bypass */
+		snd_soc_component_update_bits(component,
+			RT1015_SMART_BST_CTRL1, RT1015_ABST_AUTO_EN_MASK |
+			RT1015_ABST_FIX_TGT_MASK | RT1015_BYPASS_SWR_REG_MASK,
+			RT1015_ABST_REG_MODE | RT1015_ABST_FIX_TGT_DIS |
+			RT1015_BYPASS_SWRREG_BYPASS);
+	} else if (rt1015->boost_mode == 1) {
+		/* Adaptive */
+		snd_soc_component_update_bits(component,
+			RT1015_SMART_BST_CTRL1, RT1015_ABST_AUTO_EN_MASK |
+			RT1015_ABST_FIX_TGT_MASK | RT1015_BYPASS_SWR_REG_MASK,
+			RT1015_ABST_AUTO_MODE | RT1015_ABST_FIX_TGT_DIS |
+			RT1015_BYPASS_SWRREG_PASS);
+	} else {
+		/* Fixed Adaptive */
+		snd_soc_component_update_bits(component,
+			RT1015_SMART_BST_CTRL1, RT1015_ABST_AUTO_EN_MASK |
+			RT1015_ABST_FIX_TGT_MASK | RT1015_BYPASS_SWR_REG_MASK,
+			RT1015_ABST_AUTO_MODE | RT1015_ABST_FIX_TGT_EN |
+			RT1015_BYPASS_SWRREG_PASS);
+	}
+
+	return 0;
+}
+
+static int rt5518_bypass_boost_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct rt1015_priv *rt1015 =
+		snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = rt1015->bypass_boost;
+
+	return 0;
+}
+
+static int rt5518_bypass_boost_put(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct rt1015_priv *rt1015 =
+		snd_soc_component_get_drvdata(component);
+
+	rt1015->bypass_boost = ucontrol->value.integer.value[0];
+	if (rt1015->bypass_boost == 1) {
+		snd_soc_component_write(component,
+				RT1015_PWR4, 0x00b2);
+		snd_soc_component_write(component,
+				RT1015_CLSD_INTERNAL8, 0x2008);
+		snd_soc_component_write(component,
+				RT1015_CLSD_INTERNAL9, 0x0140);
+		snd_soc_component_write(component,
+				RT1015_GAT_BOOST, 0x00fe);
+		snd_soc_component_write(component,
+				RT1015_PWR_STATE_CTRL, 0x000d);
+		msleep(500);
+		snd_soc_component_write(component,
+			RT1015_PWR_STATE_CTRL, 0x000e);
+	}
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new rt1015_snd_controls[] = {
+	SOC_SINGLE_TLV("DAC Playback Volume", RT1015_DAC1, RT1015_DAC_VOL_SFT,
+		127, 0, dac_vol_tlv),
+	SOC_DOUBLE("DAC Playback Switch", RT1015_DAC3,
+		RT1015_DA_MUTE_SFT, RT1015_DVOL_MUTE_FLAG_SFT, 1, 1),
+	SOC_ENUM_EXT("Boost Mode", rt1015_boost_mode_enum,
+		rt1015_boost_mode_get, rt1015_boost_mode_put),
+	SOC_ENUM("Mono LR Select", rt1015_mono_lr_sel),
+	SOC_SINGLE_EXT("Bypass Boost", SND_SOC_NOPM, 0, 1, 0,
+		rt5518_bypass_boost_get, rt5518_bypass_boost_put),
+};
+
+static int rt1015_is_sys_clk_from_pll(struct snd_soc_dapm_widget *source,
+			 struct snd_soc_dapm_widget *sink)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(source->dapm);
+	struct rt1015_priv *rt1015 = snd_soc_component_get_drvdata(component);
+
+	if (rt1015->sysclk_src == RT1015_SCLK_S_PLL)
+		return 1;
+	else
+		return 0;
+}
+
+static int r1015_dac_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct rt1015_priv *rt1015 = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		if (rt1015->bypass_boost == 0) {
+			snd_soc_component_write(component,
+				RT1015_SYS_RST1, 0x05f7);
+			snd_soc_component_write(component,
+				RT1015_GAT_BOOST, 0xacfe);
+			snd_soc_component_write(component,
+				RT1015_PWR9, 0xaa00);
+			snd_soc_component_write(component,
+				RT1015_GAT_BOOST, 0xecfe);
+		} else {
+			snd_soc_component_write(component,
+				RT1015_SYS_RST1, 0x05f7);
+			snd_soc_component_write(component,
+				RT1015_PWR_STATE_CTRL, 0x026e);
+		}
+		break;
+
+	case SND_SOC_DAPM_POST_PMD:
+		if (rt1015->bypass_boost == 0) {
+			snd_soc_component_write(component,
+				RT1015_PWR9, 0xa800);
+			snd_soc_component_write(component,
+				RT1015_SYS_RST1, 0x05f5);
+		} else {
+			snd_soc_component_write(component,
+				RT1015_PWR_STATE_CTRL, 0x0268);
+			snd_soc_component_write(component,
+				RT1015_SYS_RST1, 0x05f5);
+		}
+		break;
+
+	default:
+		break;
+	}
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget rt1015_dapm_widgets[] = {
+	SND_SOC_DAPM_SUPPLY("LDO2", RT1015_PWR1, RT1015_PWR_LDO2_BIT, 0,
+		NULL, 0),
+	SND_SOC_DAPM_SUPPLY("INT RC CLK", RT1015_PWR1, RT1015_PWR_INTCLK_BIT,
+		0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("ISENSE", RT1015_PWR1, RT1015_PWR_ISENSE_BIT, 0,
+		NULL, 0),
+	SND_SOC_DAPM_SUPPLY("VSENSE", RT1015_PWR1, RT1015_PWR_VSENSE_BIT, 0,
+		NULL, 0),
+	SND_SOC_DAPM_SUPPLY("PLL", RT1015_PWR1, RT1015_PWR_PLL_BIT, 0,
+		NULL, 0),
+	SND_SOC_DAPM_SUPPLY("BG1 BG2", RT1015_PWR1, RT1015_PWR_BG_1_2_BIT, 0,
+		NULL, 0),
+	SND_SOC_DAPM_SUPPLY("MBIAS BG", RT1015_PWR1, RT1015_PWR_MBIAS_BG_BIT, 0,
+		NULL, 0),
+	SND_SOC_DAPM_SUPPLY("VBAT", RT1015_PWR1, RT1015_PWR_VBAT_BIT, 0, NULL,
+		0),
+	SND_SOC_DAPM_SUPPLY("MBIAS", RT1015_PWR1, RT1015_PWR_MBIAS_BIT, 0,
+		NULL, 0),
+	SND_SOC_DAPM_SUPPLY("ADCV", RT1015_PWR1, RT1015_PWR_ADCV_BIT, 0, NULL,
+		0),
+	SND_SOC_DAPM_SUPPLY("MIXERV", RT1015_PWR1, RT1015_PWR_MIXERV_BIT, 0,
+		NULL, 0),
+	SND_SOC_DAPM_SUPPLY("SUMV", RT1015_PWR1, RT1015_PWR_SUMV_BIT, 0, NULL,
+		0),
+	SND_SOC_DAPM_SUPPLY("VREFLV", RT1015_PWR1, RT1015_PWR_VREFLV_BIT, 0,
+		NULL, 0),
+
+	SND_SOC_DAPM_AIF_IN("AIFRX", "AIF Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_DAC_E("DAC", NULL, RT1015_PWR1, RT1015_PWR_DAC_BIT, 0,
+		r1015_dac_event, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_OUTPUT("SPO"),
+};
+
+static const struct snd_soc_dapm_route rt1015_dapm_routes[] = {
+	{ "DAC", NULL, "AIFRX" },
+	{ "DAC", NULL, "LDO2" },
+	{ "DAC", NULL, "PLL", rt1015_is_sys_clk_from_pll},
+	{ "DAC", NULL, "INT RC CLK" },
+	{ "DAC", NULL, "ISENSE" },
+	{ "DAC", NULL, "VSENSE" },
+	{ "DAC", NULL, "BG1 BG2" },
+	{ "DAC", NULL, "MBIAS BG" },
+	{ "DAC", NULL, "VBAT" },
+	{ "DAC", NULL, "MBIAS" },
+	{ "DAC", NULL, "ADCV" },
+	{ "DAC", NULL, "MIXERV" },
+	{ "DAC", NULL, "SUMV" },
+	{ "DAC", NULL, "VREFLV" },
+	{ "SPO", NULL, "DAC" },
+};
+
+static int rt1015_hw_params(struct snd_pcm_substream *substream,
+	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct rt1015_priv *rt1015 = snd_soc_component_get_drvdata(component);
+	int pre_div, bclk_ms, frame_size;
+	unsigned int val_len = 0;
+
+	rt1015->lrck = params_rate(params);
+	pre_div = rl6231_get_clk_info(rt1015->sysclk, rt1015->lrck);
+	if (pre_div < 0) {
+		dev_err(component->dev, "Unsupported clock rate\n");
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
+	rt1015->bclk = rt1015->lrck * (32 << bclk_ms);
+
+	dev_dbg(component->dev, "bclk_ms is %d and pre_div is %d for iis %d\n",
+				bclk_ms, pre_div, dai->id);
+
+	dev_dbg(component->dev, "lrck is %dHz and pre_div is %d for iis %d\n",
+				rt1015->lrck, pre_div, dai->id);
+
+	switch (params_width(params)) {
+	case 16:
+		break;
+	case 20:
+		val_len = RT1015_I2S_DL_20;
+		break;
+	case 24:
+		val_len = RT1015_I2S_DL_24;
+		break;
+	case 8:
+		val_len = RT1015_I2S_DL_8;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	snd_soc_component_update_bits(component, RT1015_TDM_MASTER,
+		RT1015_I2S_DL_MASK, val_len);
+	snd_soc_component_update_bits(component, RT1015_CLK2,
+		RT1015_FS_PD_MASK, pre_div);
+
+	return 0;
+}
+
+static int rt1015_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct snd_soc_component *component = dai->component;
+	unsigned int reg_val = 0, reg_val2 = 0;
+
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBM_CFM:
+		reg_val |= RT1015_TCON_TDM_MS_M;
+		break;
+	case SND_SOC_DAIFMT_CBS_CFS:
+		reg_val |= RT1015_TCON_TDM_MS_S;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		reg_val2 |= RT1015_TDM_INV_BCLK;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		break;
+
+	case SND_SOC_DAIFMT_LEFT_J:
+		reg_val |= RT1015_I2S_M_DF_LEFT;
+		break;
+
+	case SND_SOC_DAIFMT_DSP_A:
+		reg_val |= RT1015_I2S_M_DF_PCM_A;
+		break;
+
+	case SND_SOC_DAIFMT_DSP_B:
+		reg_val |= RT1015_I2S_M_DF_PCM_B;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	snd_soc_component_update_bits(component, RT1015_TDM_MASTER,
+			RT1015_TCON_TDM_MS_MASK | RT1015_I2S_M_DF_MASK,
+			reg_val);
+	snd_soc_component_update_bits(component, RT1015_TDM1_1,
+			RT1015_TDM_INV_BCLK_MASK, reg_val2);
+
+	return 0;
+}
+
+static int rt1015_set_component_sysclk(struct snd_soc_component *component,
+		int clk_id, int source, unsigned int freq, int dir)
+{
+	struct rt1015_priv *rt1015 = snd_soc_component_get_drvdata(component);
+	unsigned int reg_val = 0;
+
+	if (freq == rt1015->sysclk && clk_id == rt1015->sysclk_src)
+		return 0;
+
+	switch (clk_id) {
+	case RT1015_SCLK_S_MCLK:
+		reg_val |= RT1015_CLK_SYS_PRE_SEL_MCLK;
+		break;
+
+	case RT1015_SCLK_S_PLL:
+		reg_val |= RT1015_CLK_SYS_PRE_SEL_PLL;
+		break;
+
+	default:
+		dev_err(component->dev, "Invalid clock id (%d)\n", clk_id);
+		return -EINVAL;
+	}
+
+	rt1015->sysclk = freq;
+	rt1015->sysclk_src = clk_id;
+
+	dev_dbg(component->dev, "Sysclk is %dHz and clock id is %d\n",
+		freq, clk_id);
+
+	snd_soc_component_update_bits(component, RT1015_CLK2,
+			RT1015_CLK_SYS_PRE_SEL_MASK, reg_val);
+
+	return 0;
+}
+
+static int rt1015_set_component_pll(struct snd_soc_component *component,
+		int pll_id, int source, unsigned int freq_in,
+		unsigned int freq_out)
+{
+	struct rt1015_priv *rt1015 = snd_soc_component_get_drvdata(component);
+	struct rl6231_pll_code pll_code;
+	int ret;
+
+	if (!freq_in || !freq_out) {
+		dev_dbg(component->dev, "PLL disabled\n");
+
+		rt1015->pll_in = 0;
+		rt1015->pll_out = 0;
+
+		return 0;
+	}
+
+	if (source == rt1015->pll_src && freq_in == rt1015->pll_in &&
+		freq_out == rt1015->pll_out)
+		return 0;
+
+	switch (source) {
+	case RT1015_PLL_S_MCLK:
+		snd_soc_component_update_bits(component, RT1015_CLK2,
+			RT1015_PLL_SEL_MASK, RT1015_PLL_SEL_PLL_SRC2);
+		break;
+
+	case RT1015_PLL_S_BCLK:
+		snd_soc_component_update_bits(component, RT1015_CLK2,
+			RT1015_PLL_SEL_MASK, RT1015_PLL_SEL_BCLK);
+		break;
+
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
+	snd_soc_component_write(component, RT1015_PLL1,
+		(pll_code.m_bp ? 0 : pll_code.m_code) << RT1015_PLL_M_SFT |
+		pll_code.m_bp << RT1015_PLL_M_BP_SFT | pll_code.n_code);
+	snd_soc_component_write(component, RT1015_PLL2,
+		pll_code.k_code);
+
+	rt1015->pll_in = freq_in;
+	rt1015->pll_out = freq_out;
+	rt1015->pll_src = source;
+
+	return 0;
+}
+
+static int rt1015_probe(struct snd_soc_component *component)
+{
+	struct rt1015_priv *rt1015 =
+		snd_soc_component_get_drvdata(component);
+
+	rt1015->component = component;
+
+	switch (snd_soc_component_read32(component, RT1015_VER_ID)
+		& RT1015_ID_MASK) {
+	case RT1015_ID_VERA:
+		rt1015_reg_init(component);
+		break;
+	case RT1015_ID_VERB:
+		snd_soc_component_write(component, RT1015_BAT_RPO_STEP1,
+			0x061c);
+		break;
+	default:
+		dev_err(component->dev, "Unknown version id!\n");
+	}
+
+	return 0;
+}
+
+static void rt1015_remove(struct snd_soc_component *component)
+{
+	struct rt1015_priv *rt1015 = snd_soc_component_get_drvdata(component);
+
+	regmap_write(rt1015->regmap, RT1015_RESET, 0);
+}
+
+#define RT1015_STEREO_RATES SNDRV_PCM_RATE_8000_192000
+#define RT1015_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
+			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
+
+struct snd_soc_dai_ops rt1015_aif_dai_ops = {
+	.hw_params = rt1015_hw_params,
+	.set_fmt = rt1015_set_dai_fmt,
+};
+
+struct snd_soc_dai_driver rt1015_dai[] = {
+	{
+		.name = "rt1015-aif",
+		.id = 0,
+		.playback = {
+			.stream_name = "AIF Playback",
+			.channels_min = 1,
+			.channels_max = 4,
+			.rates = RT1015_STEREO_RATES,
+			.formats = RT1015_FORMATS,
+		},
+	}
+};
+
+#ifdef CONFIG_PM
+static int rt1015_suspend(struct snd_soc_component *component)
+{
+	struct rt1015_priv *rt1015 = snd_soc_component_get_drvdata(component);
+
+	regcache_cache_only(rt1015->regmap, true);
+	regcache_mark_dirty(rt1015->regmap);
+
+	return 0;
+}
+
+static int rt1015_resume(struct snd_soc_component *component)
+{
+	struct rt1015_priv *rt1015 = snd_soc_component_get_drvdata(component);
+
+	regcache_cache_only(rt1015->regmap, false);
+	regcache_sync(rt1015->regmap);
+	return 0;
+}
+#else
+#define rt1015_suspend NULL
+#define rt1015_resume NULL
+#endif
+
+static const struct snd_soc_component_driver soc_component_dev_rt1015 = {
+	.probe = rt1015_probe,
+	.remove = rt1015_remove,
+	.suspend = rt1015_suspend,
+	.resume = rt1015_resume,
+	.controls = rt1015_snd_controls,
+	.num_controls = ARRAY_SIZE(rt1015_snd_controls),
+	.dapm_widgets = rt1015_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(rt1015_dapm_widgets),
+	.dapm_routes = rt1015_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(rt1015_dapm_routes),
+	.set_sysclk = rt1015_set_component_sysclk,
+	.set_pll = rt1015_set_component_pll,
+	.use_pmdown_time	= 1,
+	.endianness		= 1,
+	.non_legacy_dai_naming	= 1,
+};
+
+static const struct regmap_config rt1015_regmap = {
+	.reg_bits = 16,
+	.val_bits = 16,
+	.max_register = RT1015_S_BST_TIMING_INTER36,
+	.volatile_reg = rt1015_volatile_register,
+	.readable_reg = rt1015_readable_register,
+	.cache_type = REGCACHE_RBTREE,
+	.reg_defaults = rt1015_reg,
+	.num_reg_defaults = ARRAY_SIZE(rt1015_reg),
+};
+
+static const struct i2c_device_id rt1015_i2c_id[] = {
+	{ "rt1015", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, rt1015_i2c_id);
+
+#if defined(CONFIG_OF)
+static const struct of_device_id rt1015_of_match[] = {
+	{ .compatible = "realtek,rt1015", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, rt1015_of_match);
+#endif
+
+#ifdef CONFIG_ACPI
+static struct acpi_device_id rt1015_acpi_match[] = {
+	{"10EC1015", 0,},
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, rt1015_acpi_match);
+#endif
+
+static int rt1015_i2c_probe(struct i2c_client *i2c,
+	const struct i2c_device_id *id)
+{
+	struct rt1015_priv *rt1015;
+	int ret;
+	unsigned int val;
+
+	rt1015 = devm_kzalloc(&i2c->dev, sizeof(struct rt1015_priv),
+				GFP_KERNEL);
+	if (rt1015 == NULL)
+		return -ENOMEM;
+
+	i2c_set_clientdata(i2c, rt1015);
+
+	rt1015->regmap = devm_regmap_init_i2c(i2c, &rt1015_regmap);
+	if (IS_ERR(rt1015->regmap)) {
+		ret = PTR_ERR(rt1015->regmap);
+		dev_err(&i2c->dev, "Failed to allocate register map: %d\n",
+			ret);
+		return ret;
+	}
+
+	regmap_read(rt1015->regmap, RT1015_DEVICE_ID, &val);
+	if ((val != RT1015_DEVICE_ID_VAL) && (val != RT1015_DEVICE_ID_VAL2)) {
+		dev_err(&i2c->dev,
+			"Device with ID register %x is not rt1015\n", val);
+		return -ENODEV;
+	}
+
+	return devm_snd_soc_register_component(&i2c->dev,
+		&soc_component_dev_rt1015,
+		rt1015_dai, ARRAY_SIZE(rt1015_dai));
+}
+
+static void rt1015_i2c_shutdown(struct i2c_client *client)
+{
+	struct rt1015_priv *rt1015 = i2c_get_clientdata(client);
+
+	regmap_write(rt1015->regmap, RT1015_RESET, 0);
+}
+
+static struct i2c_driver rt1015_i2c_driver = {
+	.driver = {
+		.name = "rt1015",
+		.of_match_table = of_match_ptr(rt1015_of_match),
+		.acpi_match_table = ACPI_PTR(rt1015_acpi_match),
+	},
+	.probe = rt1015_i2c_probe,
+	.shutdown = rt1015_i2c_shutdown,
+	.id_table = rt1015_i2c_id,
+};
+module_i2c_driver(rt1015_i2c_driver);
+
+MODULE_DESCRIPTION("ASoC RT1015 driver");
+MODULE_AUTHOR("Jack Yu <jack.yu@realtek.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/rt1015.h b/sound/soc/codecs/rt1015.h
new file mode 100644
index 000000000000..8d75cadaa0d5
--- /dev/null
+++ b/sound/soc/codecs/rt1015.h
@@ -0,0 +1,368 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * rt1015.h  --  RT1015 ALSA SoC audio amplifier driver
+ *
+ * Copyright 2019 Realtek Semiconductor Corp.
+ * Author: Jack Yu <jack.yu@realtek.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __RT1015_H__
+#define __RT1015_H__
+
+#define RT1015_DEVICE_ID_VAL			0x1011
+#define RT1015_DEVICE_ID_VAL2			0x1015
+
+#define RT1015_RESET				0x0000
+#define RT1015_CLK2				0x0004
+#define RT1015_CLK3				0x0006
+#define RT1015_PLL1				0x000a
+#define RT1015_PLL2				0x000c
+#define RT1015_CLK_DET				0x0020
+#define RT1015_SIL_DET				0x0022
+#define RT1015_CUSTOMER_ID			0x0076
+#define RT1015_PCODE_FWVER			0x0078
+#define RT1015_VER_ID				0x007a
+#define RT1015_VENDOR_ID			0x007c
+#define RT1015_DEVICE_ID			0x007d
+#define RT1015_PAD_DRV1				0x00f0
+#define RT1015_PAD_DRV2				0x00f2
+#define RT1015_GAT_BOOST			0x00f3
+#define RT1015_PRO_ALT				0x00f4
+#define RT1015_MAN_I2C				0x0100
+#define RT1015_DAC1				0x0102
+#define RT1015_DAC2				0x0104
+#define RT1015_DAC3				0x0106
+#define RT1015_ADC1				0x010c
+#define RT1015_ADC2				0x010e
+#define RT1015_TDM_MASTER			0x0111
+#define RT1015_TDM_TCON				0x0112
+#define RT1015_TDM1_1				0x0114
+#define RT1015_TDM1_2				0x0116
+#define RT1015_TDM1_3				0x0118
+#define RT1015_TDM1_4				0x011a
+#define RT1015_TDM1_5				0x011c
+#define RT1015_MIXER1				0x0300
+#define RT1015_MIXER2				0x0302
+#define RT1015_ANA_PROTECT1			0x0311
+#define RT1015_ANA_CTRL_SEQ1			0x0313
+#define RT1015_ANA_CTRL_SEQ2			0x0314
+#define RT1015_VBAT_DET_DEB			0x031a
+#define RT1015_VBAT_VOLT_DET1			0x031c
+#define RT1015_VBAT_VOLT_DET2			0x031d
+#define RT1015_VBAT_TEST_OUT1			0x031e
+#define RT1015_VBAT_TEST_OUT2			0x031f
+#define RT1015_VBAT_PROT_ATT			0x0320
+#define RT1015_VBAT_DET_CODE			0x0321
+#define RT1015_PWR1				0x0322
+#define RT1015_PWR4				0x0328
+#define RT1015_PWR5				0x0329
+#define RT1015_PWR6				0x032a
+#define RT1015_PWR7				0x032b
+#define RT1015_PWR8				0x032c
+#define RT1015_PWR9				0x032d
+#define RT1015_CLASSD_SEQ			0x032e
+#define RT1015_SMART_BST_CTRL1			0x0330
+#define RT1015_SMART_BST_CTRL2			0x0332
+#define RT1015_ANA_CTRL1			0x0334
+#define RT1015_ANA_CTRL2			0x0336
+#define RT1015_PWR_STATE_CTRL			0x0338
+#define RT1015_SPK_VOL				0x0506
+#define RT1015_SHORT_DETTOP1			0x0508
+#define RT1015_SHORT_DETTOP2			0x050a
+#define RT1015_SPK_DC_DETECT1			0x0519
+#define RT1015_SPK_DC_DETECT2			0x051a
+#define RT1015_SPK_DC_DETECT3			0x051b
+#define RT1015_SPK_DC_DETECT4			0x051d
+#define RT1015_SPK_DC_DETECT5			0x051f
+#define RT1015_BAT_RPO_STEP1			0x0536
+#define RT1015_BAT_RPO_STEP2			0x0538
+#define RT1015_BAT_RPO_STEP3			0x053a
+#define RT1015_BAT_RPO_STEP4			0x053c
+#define RT1015_BAT_RPO_STEP5			0x053d
+#define RT1015_BAT_RPO_STEP6			0x053e
+#define RT1015_BAT_RPO_STEP7			0x053f
+#define RT1015_BAT_RPO_STEP8			0x0540
+#define RT1015_BAT_RPO_STEP9			0x0541
+#define RT1015_BAT_RPO_STEP10			0x0542
+#define RT1015_BAT_RPO_STEP11			0x0543
+#define RT1015_BAT_RPO_STEP12			0x0544
+#define RT1015_SPREAD_SPEC1			0x0568
+#define RT1015_SPREAD_SPEC2			0x056a
+#define RT1015_PAD_STATUS			0x1000
+#define RT1015_PADS_PULLING_CTRL1		0x1002
+#define RT1015_PADS_DRIVING			0x1006
+#define RT1015_SYS_RST1				0x1007
+#define RT1015_SYS_RST2				0x1009
+#define RT1015_SYS_GATING1			0x100a
+#define RT1015_TEST_MODE1			0x100c
+#define RT1015_TEST_MODE2			0x100d
+#define RT1015_TIMING_CTRL1			0x100e
+#define RT1015_PLL_INT				0x1010
+#define RT1015_TEST_OUT1			0x1020
+#define RT1015_DC_CALIB_CLSD1			0x1200
+#define RT1015_DC_CALIB_CLSD2			0x1202
+#define RT1015_DC_CALIB_CLSD3			0x1204
+#define RT1015_DC_CALIB_CLSD4			0x1206
+#define RT1015_DC_CALIB_CLSD5			0x1208
+#define RT1015_DC_CALIB_CLSD6			0x120a
+#define RT1015_DC_CALIB_CLSD7			0x120c
+#define RT1015_DC_CALIB_CLSD8			0x120e
+#define RT1015_DC_CALIB_CLSD9			0x1210
+#define RT1015_DC_CALIB_CLSD10			0x1212
+#define RT1015_CLSD_INTERNAL1			0x1300
+#define RT1015_CLSD_INTERNAL2			0x1302
+#define RT1015_CLSD_INTERNAL3			0x1304
+#define RT1015_CLSD_INTERNAL4			0x1305
+#define RT1015_CLSD_INTERNAL5			0x1306
+#define RT1015_CLSD_INTERNAL6			0x1308
+#define RT1015_CLSD_INTERNAL7			0x130a
+#define RT1015_CLSD_INTERNAL8			0x130c
+#define RT1015_CLSD_INTERNAL9			0x130e
+#define RT1015_CLSD_OCP_CTRL			0x130f
+#define RT1015_VREF_LV				0x1310
+#define RT1015_MBIAS1				0x1312
+#define RT1015_MBIAS2				0x1314
+#define RT1015_MBIAS3				0x1316
+#define RT1015_MBIAS4				0x1318
+#define RT1015_VREF_LV1				0x131a
+#define RT1015_S_BST_TIMING_INTER1		0x1322
+#define RT1015_S_BST_TIMING_INTER2		0x1323
+#define RT1015_S_BST_TIMING_INTER3		0x1324
+#define RT1015_S_BST_TIMING_INTER4		0x1325
+#define RT1015_S_BST_TIMING_INTER5		0x1326
+#define RT1015_S_BST_TIMING_INTER6		0x1327
+#define RT1015_S_BST_TIMING_INTER7		0x1328
+#define RT1015_S_BST_TIMING_INTER8		0x1329
+#define RT1015_S_BST_TIMING_INTER9		0x132a
+#define RT1015_S_BST_TIMING_INTER10		0x132b
+#define RT1015_S_BST_TIMING_INTER11		0x1330
+#define RT1015_S_BST_TIMING_INTER12		0x1331
+#define RT1015_S_BST_TIMING_INTER13		0x1332
+#define RT1015_S_BST_TIMING_INTER14		0x1333
+#define RT1015_S_BST_TIMING_INTER15		0x1334
+#define RT1015_S_BST_TIMING_INTER16		0x1335
+#define RT1015_S_BST_TIMING_INTER17		0x1336
+#define RT1015_S_BST_TIMING_INTER18		0x1337
+#define RT1015_S_BST_TIMING_INTER19		0x1338
+#define RT1015_S_BST_TIMING_INTER20		0x1339
+#define RT1015_S_BST_TIMING_INTER21		0x133a
+#define RT1015_S_BST_TIMING_INTER22		0x133b
+#define RT1015_S_BST_TIMING_INTER23		0x133c
+#define RT1015_S_BST_TIMING_INTER24		0x133d
+#define RT1015_S_BST_TIMING_INTER25		0x133e
+#define RT1015_S_BST_TIMING_INTER26		0x133f
+#define RT1015_S_BST_TIMING_INTER27		0x1340
+#define RT1015_S_BST_TIMING_INTER28		0x1341
+#define RT1015_S_BST_TIMING_INTER29		0x1342
+#define RT1015_S_BST_TIMING_INTER30		0x1343
+#define RT1015_S_BST_TIMING_INTER31		0x1344
+#define RT1015_S_BST_TIMING_INTER32		0x1345
+#define RT1015_S_BST_TIMING_INTER33		0x1346
+#define RT1015_S_BST_TIMING_INTER34		0x1347
+#define RT1015_S_BST_TIMING_INTER35		0x1348
+#define RT1015_S_BST_TIMING_INTER36		0x1349
+
+/* 0x0004 */
+#define RT1015_CLK_SYS_PRE_SEL_MASK		(0x3 << 14)
+#define RT1015_CLK_SYS_PRE_SEL_SFT		14
+#define RT1015_CLK_SYS_PRE_SEL_MCLK		(0x0 << 14)
+#define RT1015_CLK_SYS_PRE_SEL_PLL		(0x2 << 14)
+#define RT1015_PLL_SEL_MASK			(0x1 << 13)
+#define RT1015_PLL_SEL_SFT			13
+#define RT1015_PLL_SEL_PLL_SRC2			(0x0 << 13)
+#define RT1015_PLL_SEL_BCLK			(0x1 << 13)
+#define RT1015_FS_PD_MASK			(0x7 << 4)
+#define RT1015_FS_PD_SFT			4
+
+/* 0x000a */
+#define RT1015_PLL_M_MAX			0xf
+#define RT1015_PLL_M_MASK			(RT1015_PLL_M_MAX << 12)
+#define RT1015_PLL_M_SFT			12
+#define RT1015_PLL_M_BP				(0x1 << 11)
+#define RT1015_PLL_M_BP_SFT			11
+#define RT1015_PLL_N_MAX			0x1ff
+#define RT1015_PLL_N_MASK			(RT1015_PLL_N_MAX << 0)
+#define RT1015_PLL_N_SFT			0
+
+/* 0x000c */
+#define RT1015_PLL_BPK_MASK			(0x1 << 5)
+#define RT1015_PLL_BPK				(0x0 << 5)
+#define RT1015_PLL_K_MAX			0x1f
+#define RT1015_PLL_K_MASK			(RT1015_PLL_K_MAX)
+#define RT1015_PLL_K_SFT			0
+
+/* 0x007a */
+#define RT1015_ID_MASK				0xff
+#define RT1015_ID_VERA				0x0
+#define RT1015_ID_VERB				0x1
+
+/* 0x0102 */
+#define RT1015_DAC_VOL_MASK			(0x7f << 9)
+#define RT1015_DAC_VOL_SFT			9
+
+/* 0x0104 */
+#define RT1015_DAC_CLK				(0x1 << 13)
+#define RT1015_DAC_CLK_BIT			13
+
+/* 0x0106 */
+#define RT1015_DAC_MUTE_MASK			(0x1 << 15)
+#define RT1015_DA_MUTE_SFT			15
+#define RT1015_DVOL_MUTE_FLAG_SFT		12
+
+/* 0x0111 */
+#define RT1015_TCON_TDM_MS_MASK			(0x1 << 14)
+#define RT1015_TCON_TDM_MS_SFT			14
+#define RT1015_TCON_TDM_MS_S			(0x0 << 14)
+#define RT1015_TCON_TDM_MS_M			(0x1 << 14)
+#define RT1015_I2S_DL_MASK			(0x7 << 8)
+#define RT1015_I2S_DL_SFT			8
+#define RT1015_I2S_DL_16			(0x0 << 8)
+#define RT1015_I2S_DL_20			(0x1 << 8)
+#define RT1015_I2S_DL_24			(0x2 << 8)
+#define RT1015_I2S_DL_8				(0x3 << 8)
+#define RT1015_I2S_M_DF_MASK			(0x7 << 0)
+#define RT1015_I2S_M_DF_SFT			0
+#define RT1015_I2S_M_DF_I2S			(0x0)
+#define RT1015_I2S_M_DF_LEFT			(0x1)
+#define RT1015_I2S_M_DF_PCM_A			(0x2)
+#define RT1015_I2S_M_DF_PCM_B			(0x3)
+#define RT1015_I2S_M_DF_PCM_A_N			(0x6)
+#define RT1015_I2S_M_DF_PCM_B_N			(0x7)
+
+/* TDM_tcon Setting (0x0112) */
+#define RT1015_I2S_TCON_DF_MASK			(0x7 << 13)
+#define RT1015_I2S_TCON_DF_SFT			13
+#define RT1015_I2S_TCON_DF_I2S			(0x0 << 13)
+#define RT1015_I2S_TCON_DF_LEFT			(0x1 << 13)
+#define RT1015_I2S_TCON_DF_PCM_A		(0x2 << 13)
+#define RT1015_I2S_TCON_DF_PCM_B		(0x3 << 13)
+#define RT1015_I2S_TCON_DF_PCM_A_N		(0x6 << 13)
+#define RT1015_I2S_TCON_DF_PCM_B_N		(0x7 << 13)
+#define RT1015_TCON_BCLK_SEL_MASK		(0x3 << 10)
+#define RT1015_TCON_BCLK_SEL_SFT		10
+#define RT1015_TCON_BCLK_SEL_32FS		(0x0 << 10)
+#define RT1015_TCON_BCLK_SEL_64FS		(0x1 << 10)
+#define RT1015_TCON_BCLK_SEL_128FS		(0x2 << 10)
+#define RT1015_TCON_BCLK_SEL_256FS		(0x3 << 10)
+#define RT1015_TCON_CH_LEN_MASK			(0x3 << 5)
+#define RT1015_TCON_CH_LEN_SFT			5
+#define RT1015_TCON_CH_LEN_16B			(0x0 << 5)
+#define RT1015_TCON_CH_LEN_20B			(0x1 << 5)
+#define RT1015_TCON_CH_LEN_24B			(0x2 << 5)
+#define RT1015_TCON_CH_LEN_32B			(0x3 << 5)
+#define RT1015_TCON_BCLK_MST_MASK			(0x1 << 4)
+#define RT1015_TCON_BCLK_MST_SFT			4
+#define RT1015_TCON_BCLK_MST_INV		(0x1 << 4)
+
+/* TDM1 Setting-1 (0x0114) */
+#define RT1015_TDM_INV_BCLK_MASK		(0x1 << 15)
+#define RT1015_TDM_INV_BCLK_SFT			15
+#define RT1015_TDM_INV_BCLK			(0x1 << 15)
+
+/* 0x0330 */
+#define RT1015_ABST_AUTO_EN_MASK		(0x1 << 13)
+#define RT1015_ABST_AUTO_MODE			(0x1 << 13)
+#define RT1015_ABST_REG_MODE			(0x0 << 13)
+#define RT1015_ABST_FIX_TGT_MASK		(0x1 << 12)
+#define RT1015_ABST_FIX_TGT_EN			(0x1 << 12)
+#define RT1015_ABST_FIX_TGT_DIS			(0x0 << 12)
+#define RT1015_BYPASS_SWR_REG_MASK		(0x1 << 7)
+#define RT1015_BYPASS_SWRREG_BYPASS		(0x1 << 7)
+#define RT1015_BYPASS_SWRREG_PASS		(0x0 << 7)
+
+/* 0x0322 */
+#define RT1015_PWR_LDO2				(0x1 << 15)
+#define RT1015_PWR_LDO2_BIT			15
+#define RT1015_PWR_DAC				(0x1 << 14)
+#define RT1015_PWR_DAC_BIT			14
+#define RT1015_PWR_INTCLK			(0x1 << 13)
+#define RT1015_PWR_INTCLK_BIT			13
+#define RT1015_PWR_ISENSE			(0x1 << 12)
+#define RT1015_PWR_ISENSE_BIT			12
+#define RT1015_PWR_VSENSE			(0x1 << 10)
+#define RT1015_PWR_VSENSE_BIT			10
+#define RT1015_PWR_PLL				(0x1 << 9)
+#define RT1015_PWR_PLL_BIT			9
+#define RT1015_PWR_BG_1_2			(0x1 << 8)
+#define RT1015_PWR_BG_1_2_BIT			8
+#define RT1015_PWR_MBIAS_BG			(0x1 << 7)
+#define RT1015_PWR_MBIAS_BG_BIT			7
+#define RT1015_PWR_VBAT				(0x1 << 6)
+#define RT1015_PWR_VBAT_BIT			6
+#define RT1015_PWR_MBIAS			(0x1 << 4)
+#define RT1015_PWR_MBIAS_BIT			4
+#define RT1015_PWR_ADCV				(0x1 << 3)
+#define RT1015_PWR_ADCV_BIT			3
+#define RT1015_PWR_MIXERV			(0x1 << 2)
+#define RT1015_PWR_MIXERV_BIT			2
+#define RT1015_PWR_SUMV				(0x1 << 1)
+#define RT1015_PWR_SUMV_BIT			1
+#define RT1015_PWR_VREFLV			(0x1 << 0)
+#define RT1015_PWR_VREFLV_BIT			0
+
+/* 0x0324 */
+#define RT1015_PWR_BASIC			(0x1 << 15)
+#define RT1015_PWR_BASIC_BIT			15
+#define RT1015_PWR_SD				(0x1 << 14)
+#define RT1015_PWR_SD_BIT			14
+#define RT1015_PWR_IBIAS			(0x1 << 13)
+#define RT1015_PWR_IBIAS_BIT			13
+#define RT1015_PWR_VCM				(0x1 << 11)
+#define RT1015_PWR_VCM_BIT			11
+
+/* 0x0328 */
+#define RT1015_PWR_SWR				(0x1 << 12)
+#define RT1015_PWR_SWR_BIT			12
+
+/* 0x1300 */
+#define RT1015_PWR_CLSD				(0x1 << 12)
+#define RT1015_PWR_CLSD_BIT			12
+
+/* 0x007a */
+#define RT1015_ID_MASK				0xff
+#define RT1015_ID_VERA				0x0
+#define RT1015_ID_VERB				0x1
+
+/* System Clock Source */
+enum {
+	RT1015_SCLK_S_MCLK,
+	RT1015_SCLK_S_PLL,
+};
+
+/* PLL1 Source */
+enum {
+	RT1015_PLL_S_MCLK,
+	RT1015_PLL_S_BCLK,
+};
+
+enum {
+	RT1015_AIF1,
+	RT1015_AIFS,
+};
+
+enum {
+	RT1015_VERA,
+	RT1015_VERB,
+};
+
+struct rt1015_priv {
+	struct snd_soc_component *component;
+	struct regmap *regmap;
+	int sysclk;
+	int sysclk_src;
+	int lrck;
+	int bclk;
+	int id;
+	int pll_src;
+	int pll_in;
+	int pll_out;
+	int boost_mode;
+	int bypass_boost;
+	int amp_ver;
+};
+
+#endif /* __RT1015_H__ */
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
