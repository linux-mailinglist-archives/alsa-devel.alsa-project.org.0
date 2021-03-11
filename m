Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF6B336A4C
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 04:00:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A57F516FA;
	Thu, 11 Mar 2021 03:59:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A57F516FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615431608;
	bh=xsErcwD9w+nuNRf9lC5CtyIUEYZxFRSFPpBwQd2Dh3o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LoUcBXKpfJjjQIcM1gNZlSj+yC9xM/8UHRPFsveBkJMbRZnCvFMVCXngIp9PQaEqN
	 2Jr4S2PM0MTAU9CNO/danQdiLwAklb9LEzGIgPCwbuQSwfPRjeW/c9Bk6mdys/fCwk
	 fUYPtQ1sLghZRRU9uATFISGiQRRgBUvg7MyCJp70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27D0CF80256;
	Thu, 11 Mar 2021 03:58:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD7A9F80227; Thu, 11 Mar 2021 03:58:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C9F5F800BF
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 03:58:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C9F5F800BF
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 12B2wGhcD008310,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs01.realtek.com.tw[172.21.6.94])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 12B2wGhcD008310
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 11 Mar 2021 10:58:16 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 11 Mar 2021 10:58:15 +0800
From: <jack.yu@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH v2] ASoC: rt1019: add rt1019 amplifier driver
Date: Thu, 11 Mar 2021 10:58:09 +0800
Message-ID: <20210311025809.31852-1-jack.yu@realtek.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMBS02.realtek.com.tw (172.21.6.95) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
Cc: oder_chiou@realtek.com, Jack Yu <jack.yu@realtek.com>,
 alsa-devel@alsa-project.org, lars@metafoo.de, kent_chen@realtek.com,
 kenny_chen@realtek.com, derek.fang@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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

From: Jack Yu <jack.yu@realtek.com>

This is initial amplifier driver for rt1019.

Signed-off-by: Jack Yu <jack.yu@realtek.com>
---
 .../devicetree/bindings/sound/rt1019.yaml     |  33 +
 sound/soc/codecs/Kconfig                      |   7 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/rt1019.c                     | 940 ++++++++++++++++++
 sound/soc/codecs/rt1019.h                     | 320 ++++++
 5 files changed, 1302 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/rt1019.yaml
 create mode 100644 sound/soc/codecs/rt1019.c
 create mode 100644 sound/soc/codecs/rt1019.h

diff --git a/Documentation/devicetree/bindings/sound/rt1019.yaml b/Documentation/devicetree/bindings/sound/rt1019.yaml
new file mode 100644
index 000000000000..c24c29eafa54
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rt1019.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/rt1019.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RT1019 Mono Class-D Audio Amplifier
+
+maintainers:
+  - jack.yu@realtek.com
+
+properties:
+  compatible:
+    const: realtek,rt1019
+
+  reg:
+    maxItems: 1
+    description: I2C address of the device.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        rt1019: codec@28 {
+            compatible = "realtek,rt1019";
+            reg = <0x28>;
+        };
+    };
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 6ce74c99a305..4ab34bca71aa 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -161,6 +161,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_RT1011
 	imply SND_SOC_RT1015
 	imply SND_SOC_RT1015P
+	imply SND_SOC_RT1019
 	imply SND_SOC_RT1305
 	imply SND_SOC_RT1308
 	imply SND_SOC_RT5514
@@ -1079,6 +1080,7 @@ config SND_SOC_RL6231
 	default y if SND_SOC_RT1011=y
 	default y if SND_SOC_RT1015=y
 	default y if SND_SOC_RT1015P=y
+	default y if SND_SOC_RT1019=y
 	default y if SND_SOC_RT1305=y
 	default y if SND_SOC_RT1308=y
 	default m if SND_SOC_RT5514=m
@@ -1097,6 +1099,7 @@ config SND_SOC_RL6231
 	default m if SND_SOC_RT1011=m
 	default m if SND_SOC_RT1015=m
 	default m if SND_SOC_RT1015P=m
+	default m if SND_SOC_RT1019=m
 	default m if SND_SOC_RT1305=m
 	default m if SND_SOC_RT1308=m
 
@@ -1133,6 +1136,10 @@ config SND_SOC_RT1015P
 	tristate
 	depends on GPIOLIB
 
+config SND_SOC_RT1019
+	tristate
+	depends on I2C
+
 config SND_SOC_RT1305
 	tristate
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index dcc2f757bb82..edff5c5b92d3 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -170,6 +170,7 @@ snd-soc-rl6347a-objs := rl6347a.o
 snd-soc-rt1011-objs := rt1011.o
 snd-soc-rt1015-objs := rt1015.o
 snd-soc-rt1015p-objs := rt1015p.o
+snd-soc-rt1019-objs := rt1019.o
 snd-soc-rt1305-objs := rt1305.o
 snd-soc-rt1308-objs := rt1308.o
 snd-soc-rt1308-sdw-objs := rt1308-sdw.o
@@ -487,6 +488,7 @@ obj-$(CONFIG_SND_SOC_RL6347A)	+= snd-soc-rl6347a.o
 obj-$(CONFIG_SND_SOC_RT1011)	+= snd-soc-rt1011.o
 obj-$(CONFIG_SND_SOC_RT1015)	+= snd-soc-rt1015.o
 obj-$(CONFIG_SND_SOC_RT1015P)	+= snd-soc-rt1015p.o
+obj-$(CONFIG_SND_SOC_RT1019)	+= snd-soc-rt1019.o
 obj-$(CONFIG_SND_SOC_RT1305)	+= snd-soc-rt1305.o
 obj-$(CONFIG_SND_SOC_RT1308)	+= snd-soc-rt1308.o
 obj-$(CONFIG_SND_SOC_RT1308_SDW)	+= snd-soc-rt1308-sdw.o
diff --git a/sound/soc/codecs/rt1019.c b/sound/soc/codecs/rt1019.c
new file mode 100644
index 000000000000..fb275686a00f
--- /dev/null
+++ b/sound/soc/codecs/rt1019.c
@@ -0,0 +1,940 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// rt1019.c  --  RT1019 ALSA SoC audio amplifier driver
+// Author: Jack Yu <jack.yu@realtek.com>
+//
+// Copyright(c) 2021 Realtek Semiconductor Corp.
+//
+//
+
+#include <linux/acpi.h>
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
+#include "rt1019.h"
+
+static const struct reg_default rt1019_reg[] = {
+	{ 0x0000, 0x00 },
+	{ 0x0002, 0x55 },
+	{ 0x0003, 0x55 },
+	{ 0x0005, 0x54 },
+	{ 0x0006, 0x05 },
+	{ 0x0007, 0x01 },
+	{ 0x0008, 0x70 },
+	{ 0x0009, 0x28 },
+	{ 0x000a, 0x7f },
+	{ 0x0011, 0x04 },
+	{ 0x0013, 0x00 },
+	{ 0x0015, 0x00 },
+	{ 0x0017, 0x00 },
+	{ 0x0019, 0x30 },
+	{ 0x001b, 0x01 },
+	{ 0x001d, 0x18 },
+	{ 0x001f, 0x29 },
+	{ 0x0021, 0x09 },
+	{ 0x0023, 0x02 },
+	{ 0x0025, 0x00 },
+	{ 0x0026, 0x00 },
+	{ 0x0028, 0x03 },
+	{ 0x0053, 0x00 },
+	{ 0x0055, 0x00 },
+	{ 0x0056, 0x00 },
+	{ 0x0057, 0x00 },
+	{ 0x0058, 0x00 },
+	{ 0x005a, 0x00 },
+	{ 0x005c, 0x00 },
+	{ 0x005d, 0x00 },
+	{ 0x005e, 0x10 },
+	{ 0x005f, 0xec },
+	{ 0x0061, 0x10 },
+	{ 0x0062, 0x19 },
+	{ 0x0064, 0x00 },
+	{ 0x0066, 0x08 },
+	{ 0x0068, 0x00 },
+	{ 0x006a, 0x00 },
+	{ 0x006c, 0x00 },
+	{ 0x006e, 0x00 },
+	{ 0x0100, 0x80 },
+	{ 0x0100, 0x51 },
+	{ 0x0102, 0x23 },
+	{ 0x0102, 0x0f },
+	{ 0x0104, 0x6c },
+	{ 0x0105, 0xec },
+	{ 0x0106, 0x00 },
+	{ 0x0107, 0x00 },
+	{ 0x0108, 0x00 },
+	{ 0x0200, 0x40 },
+	{ 0x0201, 0x00 },
+	{ 0x0202, 0x00 },
+	{ 0x0203, 0x00 },
+	{ 0x0301, 0x02 },
+	{ 0x0302, 0xaa },
+	{ 0x0303, 0x2a },
+	{ 0x0304, 0x6a },
+	{ 0x0306, 0xb0 },
+	{ 0x0308, 0x48 },
+	{ 0x030a, 0x0a },
+	{ 0x030b, 0x4b },
+	{ 0x030d, 0x7d },
+	{ 0x030e, 0xef },
+	{ 0x030f, 0x5a },
+	{ 0x0311, 0x00 },
+	{ 0x0312, 0x3e },
+	{ 0x0313, 0x86 },
+	{ 0x0315, 0xa8 },
+	{ 0x0318, 0x1b },
+	{ 0x031a, 0x3d },
+	{ 0x031c, 0x40 },
+	{ 0x031d, 0x40 },
+	{ 0x031e, 0x30 },
+	{ 0x031f, 0xbb },
+	{ 0x0320, 0xa5 },
+	{ 0x0321, 0xa5 },
+	{ 0x0323, 0x5a },
+	{ 0x0324, 0xaa },
+	{ 0x0325, 0x80 },
+	{ 0x0326, 0xaa },
+	{ 0x0327, 0x66 },
+	{ 0x0328, 0x94 },
+	{ 0x0329, 0x00 },
+	{ 0x0330, 0x00 },
+	{ 0x0331, 0x30 },
+	{ 0x0332, 0x05 },
+	{ 0x0400, 0x03 },
+	{ 0x0401, 0x02 },
+	{ 0x0402, 0x01 },
+	{ 0x0403, 0x23 },
+	{ 0x0404, 0x45 },
+	{ 0x0405, 0x67 },
+	{ 0x0500, 0x80 },
+	{ 0x0501, 0x00 },
+	{ 0x0502, 0x00 },
+	{ 0x0503, 0x00 },
+	{ 0x0504, 0xff },
+	{ 0x0505, 0x24 },
+	{ 0x0600, 0x75 },
+	{ 0x0601, 0x41 },
+	{ 0x0602, 0x60 },
+	{ 0x0603, 0x7f },
+	{ 0x0604, 0x65 },
+	{ 0x0605, 0x43 },
+	{ 0x0606, 0x00 },
+	{ 0x0607, 0x00 },
+	{ 0x0608, 0x00 },
+	{ 0x0609, 0x00 },
+	{ 0x060a, 0x00 },
+	{ 0x060b, 0x00 },
+	{ 0x060c, 0x00 },
+	{ 0x060d, 0x00 },
+	{ 0x060e, 0x00 },
+	{ 0x060f, 0x00 },
+	{ 0x0700, 0x15 },
+	{ 0x0701, 0xc8 },
+	{ 0x0704, 0x02 },
+	{ 0x0705, 0x00 },
+	{ 0x0706, 0x00 },
+	{ 0x0707, 0x80 },
+	{ 0x0708, 0x08 },
+	{ 0x0709, 0x00 },
+	{ 0x0800, 0x00 },
+	{ 0x0801, 0x00 },
+	{ 0x0802, 0x09 },
+	{ 0x0803, 0x00 },
+	{ 0x0900, 0x87 },
+	{ 0x0a01, 0x99 },
+	{ 0x0a02, 0x40 },
+	{ 0x0a03, 0x10 },
+	{ 0x0b00, 0x50 },
+	{ 0x0b01, 0xc3 },
+	{ 0x0c00, 0x84 },
+	{ 0x0c01, 0x00 },
+	{ 0x0c02, 0xbb },
+	{ 0x0c03, 0x80 },
+	{ 0x0c04, 0x10 },
+	{ 0x0c05, 0x30 },
+	{ 0x0c06, 0x00 },
+	{ 0x0d00, 0x80 },
+	{ 0x0d01, 0xbb },
+	{ 0x0d02, 0x80 },
+	{ 0x0d03, 0x00 },
+	{ 0x0d04, 0x00 },
+	{ 0x0d05, 0x00 },
+	{ 0x0e00, 0x80 },
+	{ 0x0e01, 0xbb },
+	{ 0x0e02, 0x80 },
+	{ 0x0e03, 0x00 },
+	{ 0x0e04, 0x10 },
+	{ 0x0e05, 0x30 },
+	{ 0x0f00, 0x80 },
+	{ 0x0f01, 0xbb },
+	{ 0x0f02, 0x80 },
+	{ 0x0f03, 0x00 },
+	{ 0x0f04, 0x10 },
+	{ 0x0f05, 0x30 },
+	{ 0x0f06, 0x88 },
+	{ 0x0f07, 0x88 },
+	{ 0x0f08, 0x00 },
+	{ 0x0f09, 0x00 },
+};
+
+static bool rt1019_volatile_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case RT1019_PWR_STRP_1:
+	case RT1019_PWR_STRP_2:
+	case RT1019_SIL_DET_GAT:
+	case RT1019_PHASE_SYNC:
+	case RT1019_STAT_MACH_2:
+	case RT1019_FS_DET_1:
+	case RT1019_FS_DET_2:
+	case RT1019_FS_DET_3:
+	case RT1019_FS_DET_4:
+	case RT1019_FS_DET_5:
+	case RT1019_FS_DET_6:
+	case RT1019_FS_DET_7:
+	case RT1019_ANA_READ:
+	case RT1019_VER_ID:
+	case RT1019_CUSTOM_ID:
+	case RT1019_VEND_ID_1:
+	case RT1019_VEND_ID_2:
+	case RT1019_DEV_ID_1:
+	case RT1019_DEV_ID_2:
+	case RT1019_CAL_TOP_3:
+	case RT1019_CAL_TOP_7:
+	case RT1019_CAL_TOP_17:
+	case RT1019_CAL_TOP_18:
+	case RT1019_CAL_TOP_19:
+	case RT1019_CAL_TOP_20:
+	case RT1019_CAL_TOP_21:
+	case RT1019_CAL_TOP_22:
+	case RT1019_MDRE_CTRL_2:
+	case RT1019_MDRE_CTRL_3:
+	case RT1019_MDRE_CTRL_4:
+	case RT1019_SIL_DET_2:
+	case RT1019_PWM_DC_DET_1:
+	case RT1019_PMC_8:
+	case RT1019_PMC_9:
+	case RT1019_SPKDRC_7:
+	case RT1019_HALF_FREQ_7:
+	case RT1019_CUR_CTRL_11:
+	case RT1019_CUR_CTRL_12:
+	case RT1019_CUR_CTRL_13:
+		return true;
+
+	default:
+		return false;
+	}
+}
+
+static bool rt1019_readable_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case RT1019_RESET:
+	case RT1019_PAD_DRV_1:
+	case RT1019_PAD_DRV_2:
+	case RT1019_PAD_PULL_1:
+	case RT1019_PAD_PULL_2:
+	case RT1019_PAD_PULL_3:
+	case RT1019_I2C_CTRL_1:
+	case RT1019_I2C_CTRL_2:
+	case RT1019_I2C_CTRL_3:
+	case RT1019_IDS_CTRL:
+	case RT1019_ASEL_CTRL:
+	case RT1019_PLL_RESET:
+	case RT1019_PWR_STRP_1:
+	case RT1019_PWR_STRP_2:
+	case RT1019_BEEP_TONE:
+	case RT1019_SIL_DET_GAT:
+	case RT1019_CLASSD_TIME:
+	case RT1019_CLASSD_OCP:
+	case RT1019_PHASE_SYNC:
+	case RT1019_STAT_MACH_1:
+	case RT1019_STAT_MACH_2:
+	case RT1019_EFF_CTRL:
+	case RT1019_FS_DET_1:
+	case RT1019_FS_DET_2:
+	case RT1019_FS_DET_3:
+	case RT1019_FS_DET_4:
+	case RT1019_FS_DET_5:
+	case RT1019_FS_DET_6:
+	case RT1019_FS_DET_7:
+	case RT1019_ANA_CTRL:
+	case RT1019_DUMMY_A:
+	case RT1019_DUMMY_B:
+	case RT1019_DUMMY_C:
+	case RT1019_DUMMY_D:
+	case RT1019_ANA_READ:
+	case RT1019_VER_ID:
+	case RT1019_CUSTOM_ID:
+	case RT1019_VEND_ID_1:
+	case RT1019_VEND_ID_2:
+	case RT1019_DEV_ID_1:
+	case RT1019_DEV_ID_2:
+	case RT1019_TEST_PAD:
+	case RT1019_SDB_CTRL:
+	case RT1019_TEST_CTRL_1:
+	case RT1019_TEST_CTRL_2:
+	case RT1019_TEST_CTRL_3:
+	case RT1019_SCAN_MODE:
+	case RT1019_CLK_TREE_1:
+	case RT1019_CLK_TREE_2:
+	case RT1019_CLK_TREE_3:
+	case RT1019_CLK_TREE_4:
+	case RT1019_CLK_TREE_5:
+	case RT1019_CLK_TREE_6:
+	case RT1019_CLK_TREE_7:
+	case RT1019_CLK_TREE_8:
+	case RT1019_CLK_TREE_9:
+	case RT1019_ASRC_1:
+	case RT1019_ASRC_2:
+	case RT1019_ASRC_3:
+	case RT1019_ASRC_4:
+	case RT1019_SYS_CLK:
+	case RT1019_BIAS_CUR_1:
+	case RT1019_BIAS_CUR_2:
+	case RT1019_BIAS_CUR_3:
+	case RT1019_BIAS_CUR_4:
+	case RT1019_CHOP_CLK_DAC:
+	case RT1019_CHOP_CLK_ADC:
+	case RT1019_LDO_CTRL_1:
+	case RT1019_LDO_CTRL_2:
+	case RT1019_PM_ANA_1:
+	case RT1019_PM_ANA_2:
+	case RT1019_PM_ANA_3:
+	case RT1019_PLL_1:
+	case RT1019_PLL_2:
+	case RT1019_PLL_3:
+	case RT1019_PLL_INT_1:
+	case RT1019_PLL_INT_3:
+	case RT1019_MIXER:
+	case RT1019_CLD_OUT_1:
+	case RT1019_CLD_OUT_2:
+	case RT1019_CLD_OUT_3:
+	case RT1019_CLD_OUT_4:
+	case RT1019_CLD_OUT_5:
+	case RT1019_CLD_OUT_6:
+	case RT1019_CLS_INT_REG_1:
+	case RT1019_CLS_INT_REG_2:
+	case RT1019_CLS_INT_REG_3:
+	case RT1019_CLS_INT_REG_4:
+	case RT1019_CLS_INT_REG_5:
+	case RT1019_CLS_INT_REG_6:
+	case RT1019_CLS_INT_REG_7:
+	case RT1019_CLS_INT_REG_8:
+	case RT1019_CLS_INT_REG_9:
+	case RT1019_CLS_INT_REG_10:
+	case RT1019_TDM_1:
+	case RT1019_TDM_2:
+	case RT1019_TDM_3:
+	case RT1019_TDM_4:
+	case RT1019_TDM_5:
+	case RT1019_TDM_6:
+	case RT1019_DVOL_1:
+	case RT1019_DVOL_2:
+	case RT1019_DVOL_3:
+	case RT1019_DVOL_4:
+	case RT1019_DMIX_MONO_1:
+	case RT1019_DMIX_MONO_2:
+	case RT1019_CAL_TOP_1:
+	case RT1019_CAL_TOP_2:
+	case RT1019_CAL_TOP_3:
+	case RT1019_CAL_TOP_4:
+	case RT1019_CAL_TOP_5:
+	case RT1019_CAL_TOP_6:
+	case RT1019_CAL_TOP_7:
+	case RT1019_CAL_TOP_8:
+	case RT1019_CAL_TOP_9:
+	case RT1019_CAL_TOP_10:
+	case RT1019_CAL_TOP_11:
+	case RT1019_CAL_TOP_12:
+	case RT1019_CAL_TOP_13:
+	case RT1019_CAL_TOP_14:
+	case RT1019_CAL_TOP_15:
+	case RT1019_CAL_TOP_16:
+	case RT1019_CAL_TOP_17:
+	case RT1019_CAL_TOP_18:
+	case RT1019_CAL_TOP_19:
+	case RT1019_CAL_TOP_20:
+	case RT1019_CAL_TOP_21:
+	case RT1019_CAL_TOP_22:
+	case RT1019_MDRE_CTRL_1:
+	case RT1019_MDRE_CTRL_2:
+	case RT1019_MDRE_CTRL_3:
+	case RT1019_MDRE_CTRL_4:
+	case RT1019_MDRE_CTRL_5:
+	case RT1019_MDRE_CTRL_6:
+	case RT1019_MDRE_CTRL_7:
+	case RT1019_MDRE_CTRL_8:
+	case RT1019_MDRE_CTRL_9:
+	case RT1019_MDRE_CTRL_10:
+	case RT1019_SCC_CTRL_1:
+	case RT1019_SCC_CTRL_2:
+	case RT1019_SCC_CTRL_3:
+	case RT1019_SCC_DUMMY:
+	case RT1019_SIL_DET_1:
+	case RT1019_SIL_DET_2:
+	case RT1019_PWM_DC_DET_1:
+	case RT1019_PWM_DC_DET_2:
+	case RT1019_PWM_DC_DET_3:
+	case RT1019_PWM_DC_DET_4:
+	case RT1019_BEEP_1:
+	case RT1019_BEEP_2:
+	case RT1019_PMC_1:
+	case RT1019_PMC_2:
+	case RT1019_PMC_3:
+	case RT1019_PMC_4:
+	case RT1019_PMC_5:
+	case RT1019_PMC_6:
+	case RT1019_PMC_7:
+	case RT1019_PMC_8:
+	case RT1019_PMC_9:
+	case RT1019_SPKDRC_1:
+	case RT1019_SPKDRC_2:
+	case RT1019_SPKDRC_3:
+	case RT1019_SPKDRC_4:
+	case RT1019_SPKDRC_5:
+	case RT1019_SPKDRC_6:
+	case RT1019_SPKDRC_7:
+	case RT1019_HALF_FREQ_1:
+	case RT1019_HALF_FREQ_2:
+	case RT1019_HALF_FREQ_3:
+	case RT1019_HALF_FREQ_4:
+	case RT1019_HALF_FREQ_5:
+	case RT1019_HALF_FREQ_6:
+	case RT1019_HALF_FREQ_7:
+	case RT1019_CUR_CTRL_1:
+	case RT1019_CUR_CTRL_2:
+	case RT1019_CUR_CTRL_3:
+	case RT1019_CUR_CTRL_4:
+	case RT1019_CUR_CTRL_5:
+	case RT1019_CUR_CTRL_6:
+	case RT1019_CUR_CTRL_7:
+	case RT1019_CUR_CTRL_8:
+	case RT1019_CUR_CTRL_9:
+	case RT1019_CUR_CTRL_10:
+	case RT1019_CUR_CTRL_11:
+	case RT1019_CUR_CTRL_12:
+	case RT1019_CUR_CTRL_13:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const DECLARE_TLV_DB_SCALE(dac_vol_tlv, -9525, 75, 0);
+
+static const char * const rt1019_din_source_select[] = {
+	"Left",
+	"Right",
+	"Left + Right average",
+};
+
+static SOC_ENUM_SINGLE_DECL(rt1019_mono_lr_sel, RT1019_IDS_CTRL, 0,
+	rt1019_din_source_select);
+
+static const struct snd_kcontrol_new rt1019_snd_controls[] = {
+	SOC_SINGLE_TLV("DAC Playback Volume", RT1019_DMIX_MONO_1, 0,
+		127, 0, dac_vol_tlv),
+	SOC_ENUM("Mono LR Select", rt1019_mono_lr_sel),
+};
+
+static int r1019_dac_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_write(component, RT1019_SDB_CTRL, 0xb);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_write(component, RT1019_SDB_CTRL, 0xa);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget rt1019_dapm_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("AIFRX", "AIF Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_DAC_E("DAC", NULL, SND_SOC_NOPM, 0, 0,
+		r1019_dac_event, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_OUTPUT("SPO"),
+};
+
+static const struct snd_soc_dapm_route rt1019_dapm_routes[] = {
+	{ "DAC", NULL, "AIFRX" },
+	{ "SPO", NULL, "DAC" },
+};
+
+static int rt1019_hw_params(struct snd_pcm_substream *substream,
+	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct rt1019_priv *rt1019 = snd_soc_component_get_drvdata(component);
+	int pre_div, bclk_ms, frame_size;
+	unsigned int val_len = 0, sys_div_da_filter = 0;
+	unsigned int sys_dac_osr = 0, sys_fifo_clk = 0;
+	unsigned int sys_clk_cal = 0, sys_asrc_in = 0;
+
+	rt1019->lrck = params_rate(params);
+	pre_div = rl6231_get_clk_info(rt1019->sysclk, rt1019->lrck);
+	if (pre_div < 0) {
+		dev_err(component->dev, "Unsupported clock setting\n");
+		return -EINVAL;
+	}
+
+	frame_size = snd_soc_params_to_frame_size(params);
+	if (frame_size < 0) {
+		dev_err(component->dev, "Unsupported frame size: %d\n", frame_size);
+		return -EINVAL;
+	}
+
+	bclk_ms = frame_size > 32;
+	rt1019->bclk = rt1019->lrck * (32 << bclk_ms);
+
+	dev_dbg(dai->dev, "bclk is %dHz and lrck is %dHz\n",
+		rt1019->bclk, rt1019->lrck);
+	dev_dbg(dai->dev, "bclk_ms is %d and pre_div is %d for iis %d\n",
+				bclk_ms, pre_div, dai->id);
+
+	switch (pre_div) {
+	case 0:
+		sys_div_da_filter = RT1019_SYS_DIV_DA_FIL_DIV1;
+		sys_dac_osr = RT1019_SYS_DA_OSR_DIV1;
+		sys_asrc_in = RT1019_ASRC_256FS_DIV1;
+		sys_fifo_clk = RT1019_SEL_FIFO_DIV1;
+		sys_clk_cal = RT1019_SEL_CLK_CAL_DIV1;
+		break;
+	case 1:
+		sys_div_da_filter = RT1019_SYS_DIV_DA_FIL_DIV2;
+		sys_dac_osr = RT1019_SYS_DA_OSR_DIV2;
+		sys_asrc_in = RT1019_ASRC_256FS_DIV2;
+		sys_fifo_clk = RT1019_SEL_FIFO_DIV2;
+		sys_clk_cal = RT1019_SEL_CLK_CAL_DIV2;
+		break;
+	case 3:
+		sys_div_da_filter = RT1019_SYS_DIV_DA_FIL_DIV4;
+		sys_dac_osr = RT1019_SYS_DA_OSR_DIV4;
+		sys_asrc_in = RT1019_ASRC_256FS_DIV4;
+		sys_fifo_clk = RT1019_SEL_FIFO_DIV4;
+		sys_clk_cal = RT1019_SEL_CLK_CAL_DIV4;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (params_width(params)) {
+	case 16:
+		break;
+	case 20:
+		val_len = RT1019_I2S_DL_20;
+		break;
+	case 24:
+		val_len = RT1019_I2S_DL_24;
+		break;
+	case 32:
+		val_len = RT1019_I2S_DL_32;
+		break;
+	case 8:
+		val_len = RT1019_I2S_DL_8;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	snd_soc_component_update_bits(component, RT1019_TDM_2, RT1019_I2S_DL_MASK,
+			val_len);
+	snd_soc_component_update_bits(component, RT1019_CLK_TREE_1,
+			RT1019_SEL_FIFO_MASK, sys_fifo_clk);
+	snd_soc_component_update_bits(component, RT1019_CLK_TREE_2,
+			RT1019_SYS_DIV_DA_FIL_MASK | RT1019_SYS_DA_OSR_MASK |
+			RT1019_ASRC_256FS_MASK, sys_div_da_filter | sys_dac_osr |
+			sys_asrc_in);
+	snd_soc_component_update_bits(component, RT1019_CLK_TREE_3,
+			RT1019_SEL_CLK_CAL_MASK, sys_clk_cal);
+
+	return 0;
+}
+
+static int rt1019_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct snd_soc_component *component = dai->component;
+	unsigned int reg_val = 0, reg_val2 = 0;
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		reg_val2 |= RT1019_TDM_BCLK_INV;
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
+		reg_val |= RT1019_I2S_DF_LEFT;
+		break;
+
+	case SND_SOC_DAIFMT_DSP_A:
+		reg_val |= RT1019_I2S_DF_PCM_A_R;
+		break;
+
+	case SND_SOC_DAIFMT_DSP_B:
+		reg_val |= RT1019_I2S_DF_PCM_B_R;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	snd_soc_component_update_bits(component, RT1019_TDM_2,
+		RT1019_I2S_DF_MASK, reg_val);
+	snd_soc_component_update_bits(component, RT1019_TDM_1,
+		RT1019_TDM_BCLK_MASK, reg_val2);
+
+	return 0;
+}
+
+static int rt1019_set_dai_sysclk(struct snd_soc_dai *dai,
+		int clk_id, unsigned int freq, int dir)
+{
+	struct snd_soc_component *component = dai->component;
+	struct rt1019_priv *rt1019 = snd_soc_component_get_drvdata(component);
+	unsigned int reg_val = 0;
+
+	if (freq == rt1019->sysclk && clk_id == rt1019->sysclk_src)
+		return 0;
+
+	switch (clk_id) {
+	case RT1019_SCLK_S_BCLK:
+		reg_val |= RT1019_CLK_SYS_PRE_SEL_BCLK;
+		break;
+
+	case RT1019_SCLK_S_PLL:
+		reg_val |= RT1019_CLK_SYS_PRE_SEL_PLL;
+		break;
+
+	default:
+		dev_err(component->dev, "Invalid clock id (%d)\n", clk_id);
+		return -EINVAL;
+	}
+
+	rt1019->sysclk = freq;
+	rt1019->sysclk_src = clk_id;
+
+	dev_dbg(dai->dev, "Sysclk is %dHz and clock id is %d\n", freq, clk_id);
+
+	snd_soc_component_update_bits(component, RT1019_CLK_TREE_1,
+		RT1019_CLK_SYS_PRE_SEL_MASK, reg_val);
+
+	return 0;
+}
+
+static int rt1019_set_dai_pll(struct snd_soc_dai *dai, int pll_id, int source,
+			unsigned int freq_in, unsigned int freq_out)
+{
+	struct snd_soc_component *component = dai->component;
+	struct rt1019_priv *rt1019 = snd_soc_component_get_drvdata(component);
+	struct rl6231_pll_code pll_code;
+	int ret;
+
+	if (!freq_in || !freq_out) {
+		dev_dbg(component->dev, "PLL disabled\n");
+		rt1019->pll_in = 0;
+		rt1019->pll_out = 0;
+		return 0;
+	}
+
+	if (source == rt1019->pll_src && freq_in == rt1019->pll_in &&
+		freq_out == rt1019->pll_out)
+		return 0;
+
+	switch (source) {
+	case RT1019_PLL_S_BCLK:
+		snd_soc_component_update_bits(component, RT1019_CLK_TREE_1,
+			RT1019_PLL_SRC_MASK, RT1019_PLL_SRC_SEL_BCLK);
+		break;
+
+	case RT1019_PLL_S_RC25M:
+		snd_soc_component_update_bits(component, RT1019_CLK_TREE_1,
+			RT1019_PLL_SRC_MASK, RT1019_PLL_SRC_SEL_RC);
+		break;
+
+	default:
+		dev_err(component->dev, "Unknown PLL source %d\n", source);
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
+	snd_soc_component_update_bits(component, RT1019_PWR_STRP_2,
+		RT1019_AUTO_BITS_SEL_MASK | RT1019_AUTO_CLK_SEL_MASK,
+		RT1019_AUTO_BITS_SEL_MANU | RT1019_AUTO_CLK_SEL_MANU);
+	snd_soc_component_update_bits(component, RT1019_PLL_1,
+		RT1019_PLL_M_MASK | RT1019_PLL_M_BP_MASK | RT1019_PLL_Q_8_8_MASK,
+		(pll_code.m_bp ? 0 : pll_code.m_code) << RT1019_PLL_M_SFT |
+		pll_code.m_bp << RT1019_PLL_M_BP_SFT |
+		((pll_code.n_code >> 8) & RT1019_PLL_Q_8_8_MASK));
+	snd_soc_component_update_bits(component, RT1019_PLL_2,
+		RT1019_PLL_Q_7_0_MASK, pll_code.n_code & RT1019_PLL_Q_7_0_MASK);
+	snd_soc_component_update_bits(component, RT1019_PLL_3,
+		RT1019_PLL_K_MASK, pll_code.k_code);
+
+	rt1019->pll_in = freq_in;
+	rt1019->pll_out = freq_out;
+	rt1019->pll_src = source;
+
+	return 0;
+}
+
+static int rt1019_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
+			unsigned int rx_mask, int slots, int slot_width)
+{
+	struct snd_soc_component *component = dai->component;
+	unsigned int val = 0, rx_slotnum;
+	int ret = 0, first_bit;
+
+	switch (slots) {
+	case 4:
+		val |= RT1019_I2S_TX_4CH;
+		break;
+	case 6:
+		val |= RT1019_I2S_TX_6CH;
+		break;
+	case 8:
+		val |= RT1019_I2S_TX_8CH;
+		break;
+	case 2:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (slot_width) {
+	case 20:
+		val |= RT1019_I2S_DL_20;
+		break;
+	case 24:
+		val |= RT1019_I2S_DL_24;
+		break;
+	case 32:
+		val |= RT1019_I2S_DL_32;
+		break;
+	case 8:
+		val |= RT1019_I2S_DL_8;
+		break;
+	case 16:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* Rx slot configuration */
+	rx_slotnum = hweight_long(rx_mask);
+	if (rx_slotnum != 1) {
+		ret = -EINVAL;
+		dev_err(component->dev, "too many rx slots or zero slot\n");
+		goto _set_tdm_err_;
+	}
+	/* This is an assumption that the system sends stereo audio to the
+	 * amplifier typically. And the stereo audio is placed in slot 0/2/4/6
+	 * as the starting slot. The users could select the channel from
+	 * L/R/L+R by "Mono LR Select" control.
+	 */
+	first_bit = __ffs(rx_mask);
+	switch (first_bit) {
+	case 0:
+	case 2:
+	case 4:
+	case 6:
+		snd_soc_component_update_bits(component,
+			RT1019_TDM_3,
+			RT1019_TDM_I2S_TX_L_DAC1_1_MASK |
+			RT1019_TDM_I2S_TX_R_DAC1_1_MASK,
+			(first_bit << RT1019_TDM_I2S_TX_L_DAC1_1_SFT) |
+			((first_bit + 1) << RT1019_TDM_I2S_TX_R_DAC1_1_SFT));
+		break;
+	case 1:
+	case 3:
+	case 5:
+	case 7:
+		snd_soc_component_update_bits(component,
+			RT1019_TDM_3,
+			RT1019_TDM_I2S_TX_L_DAC1_1_MASK |
+			RT1019_TDM_I2S_TX_R_DAC1_1_MASK,
+			((first_bit - 1) << RT1019_TDM_I2S_TX_L_DAC1_1_SFT) |
+			(first_bit << RT1019_TDM_I2S_TX_R_DAC1_1_SFT));
+		break;
+	default:
+		ret = -EINVAL;
+		goto _set_tdm_err_;
+	}
+
+	snd_soc_component_update_bits(component, RT1019_TDM_2,
+		RT1019_I2S_CH_TX_MASK | RT1019_I2S_DF_MASK, val);
+
+_set_tdm_err_:
+	return ret;
+}
+
+static int rt1019_probe(struct snd_soc_component *component)
+{
+	struct rt1019_priv *rt1019 = snd_soc_component_get_drvdata(component);
+
+	rt1019->component = component;
+	snd_soc_component_write(component, RT1019_SDB_CTRL, 0xa);
+
+	return 0;
+}
+
+#define RT1019_STEREO_RATES SNDRV_PCM_RATE_8000_192000
+#define RT1019_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
+			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
+
+static struct snd_soc_dai_ops rt1019_aif_dai_ops = {
+	.hw_params = rt1019_hw_params,
+	.set_fmt = rt1019_set_dai_fmt,
+	.set_sysclk = rt1019_set_dai_sysclk,
+	.set_pll = rt1019_set_dai_pll,
+	.set_tdm_slot = rt1019_set_tdm_slot,
+};
+
+static struct snd_soc_dai_driver rt1019_dai[] = {
+	{
+		.name = "rt1019-aif",
+		.id = 0,
+		.playback = {
+			.stream_name = "AIF Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = RT1019_STEREO_RATES,
+			.formats = RT1019_FORMATS,
+		},
+		.ops = &rt1019_aif_dai_ops,
+	}
+};
+
+static const struct snd_soc_component_driver soc_component_dev_rt1019 = {
+	.probe = rt1019_probe,
+	.controls		= rt1019_snd_controls,
+	.num_controls		= ARRAY_SIZE(rt1019_snd_controls),
+	.dapm_widgets		= rt1019_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(rt1019_dapm_widgets),
+	.dapm_routes		= rt1019_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(rt1019_dapm_routes),
+};
+
+static const struct regmap_config rt1019_regmap = {
+	.reg_bits = 16,
+	.val_bits = 8,
+	.use_single_read = true,
+	.use_single_write = true,
+	.max_register = RT1019_CUR_CTRL_13,
+	.volatile_reg = rt1019_volatile_register,
+	.readable_reg = rt1019_readable_register,
+	.cache_type = REGCACHE_RBTREE,
+	.reg_defaults = rt1019_reg,
+	.num_reg_defaults = ARRAY_SIZE(rt1019_reg),
+};
+
+static const struct i2c_device_id rt1019_i2c_id[] = {
+	{ "rt1019", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, rt1019_i2c_id);
+
+static const struct of_device_id rt1019_of_match[] = {
+	{ .compatible = "realtek,rt1019", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, rt1019_of_match);
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id rt1019_acpi_match[] = {
+	{ "10EC1019", 0},
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, rt1019_acpi_match);
+#endif
+
+static int rt1019_i2c_probe(struct i2c_client *i2c,
+	const struct i2c_device_id *id)
+{
+	struct rt1019_priv *rt1019;
+	int ret;
+	unsigned int val, val2, dev_id;
+
+	rt1019 = devm_kzalloc(&i2c->dev, sizeof(struct rt1019_priv),
+				GFP_KERNEL);
+	if (!rt1019)
+		return -ENOMEM;
+
+	i2c_set_clientdata(i2c, rt1019);
+
+	rt1019->regmap = devm_regmap_init_i2c(i2c, &rt1019_regmap);
+	if (IS_ERR(rt1019->regmap)) {
+		ret = PTR_ERR(rt1019->regmap);
+		dev_err(&i2c->dev, "Failed to allocate register map: %d\n",
+			ret);
+		return ret;
+	}
+
+	regmap_read(rt1019->regmap, RT1019_DEV_ID_1, &val);
+	regmap_read(rt1019->regmap, RT1019_DEV_ID_2, &val2);
+	dev_id = val << 8 | val2;
+	if (dev_id != RT1019_DEVICE_ID_VAL && dev_id != RT1019_DEVICE_ID_VAL2) {
+		dev_err(&i2c->dev,
+			"Device with ID register 0x%x is not rt1019\n", dev_id);
+		return -ENODEV;
+	}
+
+	return devm_snd_soc_register_component(&i2c->dev,
+		&soc_component_dev_rt1019, rt1019_dai, ARRAY_SIZE(rt1019_dai));
+}
+
+struct i2c_driver rt1019_i2c_driver = {
+	.driver = {
+		.name = "rt1019",
+		.of_match_table = of_match_ptr(rt1019_of_match),
+		.acpi_match_table = ACPI_PTR(rt1019_acpi_match),
+	},
+	.probe = rt1019_i2c_probe,
+	.id_table = rt1019_i2c_id,
+};
+module_i2c_driver(rt1019_i2c_driver);
+
+MODULE_DESCRIPTION("ASoC RT1019 driver");
+MODULE_AUTHOR("Jack Yu <jack.yu@realtek.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/rt1019.h b/sound/soc/codecs/rt1019.h
new file mode 100644
index 000000000000..46973e71c963
--- /dev/null
+++ b/sound/soc/codecs/rt1019.h
@@ -0,0 +1,320 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * rt1019.h  --  RT1019 ALSA SoC audio amplifier driver
+ *
+ * Copyright(c) 2021 Realtek Semiconductor Corp.
+ */
+
+#ifndef __RT1019_H__
+#define __RT1019_H__
+
+#define RT1019_DEVICE_ID_VAL			0x1019
+#define RT1019_DEVICE_ID_VAL2			0x6731
+
+#define RT1019_RESET				0x0000
+#define RT1019_PAD_DRV_1			0x0002
+#define RT1019_PAD_DRV_2			0x0003
+#define RT1019_PAD_PULL_1			0x0005
+#define RT1019_PAD_PULL_2			0x0006
+#define RT1019_PAD_PULL_3			0x0007
+#define RT1019_I2C_CTRL_1			0x0008
+#define RT1019_I2C_CTRL_2			0x0009
+#define RT1019_I2C_CTRL_3			0x000a
+#define RT1019_IDS_CTRL				0x0011
+#define RT1019_ASEL_CTRL			0x0013
+#define RT1019_PLL_RESET			0x0015
+#define RT1019_PWR_STRP_1			0x0017
+#define RT1019_PWR_STRP_2			0x0019
+#define RT1019_BEEP_TONE			0x001b
+#define RT1019_SIL_DET_GAT			0x001d
+#define RT1019_CLASSD_TIME			0x001f
+#define RT1019_CLASSD_OCP			0x0021
+#define RT1019_PHASE_SYNC			0x0023
+#define RT1019_STAT_MACH_1			0x0025
+#define RT1019_STAT_MACH_2			0x0026
+#define RT1019_EFF_CTRL				0x0028
+#define RT1019_FS_DET_1				0x002a
+#define RT1019_FS_DET_2				0x002b
+#define RT1019_FS_DET_3				0x002c
+#define RT1019_FS_DET_4				0x002d
+#define RT1019_FS_DET_5				0x002e
+#define RT1019_FS_DET_6				0x002f
+#define RT1019_FS_DET_7				0x0030
+#define RT1019_ANA_CTRL				0x0053
+#define RT1019_DUMMY_A				0x0055
+#define RT1019_DUMMY_B				0x0056
+#define RT1019_DUMMY_C				0x0057
+#define RT1019_DUMMY_D				0x0058
+#define RT1019_ANA_READ				0x005a
+#define RT1019_VER_ID				0x005c
+#define RT1019_CUSTOM_ID			0x005d
+#define RT1019_VEND_ID_1			0x005e
+#define RT1019_VEND_ID_2			0x005f
+#define RT1019_DEV_ID_1				0x0061
+#define RT1019_DEV_ID_2				0x0062
+#define RT1019_TEST_PAD				0x0064
+#define RT1019_SDB_CTRL				0x0066
+#define RT1019_TEST_CTRL_1			0x0068
+#define RT1019_TEST_CTRL_2			0x006a
+#define RT1019_TEST_CTRL_3			0x006c
+#define RT1019_SCAN_MODE			0x006e
+#define RT1019_CLK_TREE_1			0x0100
+#define RT1019_CLK_TREE_2			0x0101
+#define RT1019_CLK_TREE_3			0x0102
+#define RT1019_CLK_TREE_4			0x0103
+#define RT1019_CLK_TREE_5			0x0104
+#define RT1019_CLK_TREE_6			0x0105
+#define RT1019_CLK_TREE_7			0x0106
+#define RT1019_CLK_TREE_8			0x0107
+#define RT1019_CLK_TREE_9			0x0108
+#define RT1019_ASRC_1				0x0200
+#define RT1019_ASRC_2				0x0201
+#define RT1019_ASRC_3				0x0202
+#define RT1019_ASRC_4				0x0203
+#define RT1019_SYS_CLK				0x0300
+#define RT1019_BIAS_CUR_1			0x0301
+#define RT1019_BIAS_CUR_2			0x0302
+#define RT1019_BIAS_CUR_3			0x0303
+#define RT1019_BIAS_CUR_4			0x0304
+#define RT1019_CHOP_CLK_DAC			0x0306
+#define RT1019_CHOP_CLK_ADC			0x0308
+#define RT1019_LDO_CTRL_1			0x030a
+#define RT1019_LDO_CTRL_2			0x030b
+#define RT1019_PM_ANA_1				0x030d
+#define RT1019_PM_ANA_2				0x030e
+#define RT1019_PM_ANA_3				0x030f
+#define RT1019_PLL_1				0x0311
+#define RT1019_PLL_2				0x0312
+#define RT1019_PLL_3				0x0313
+#define RT1019_PLL_INT_1			0x0315
+#define RT1019_PLL_INT_3			0x0318
+#define RT1019_MIXER				0x031a
+#define RT1019_CLD_OUT_1			0x031c
+#define RT1019_CLD_OUT_2			0x031d
+#define RT1019_CLD_OUT_3			0x031e
+#define RT1019_CLD_OUT_4			0x031f
+#define RT1019_CLD_OUT_5			0x0320
+#define RT1019_CLD_OUT_6			0x0321
+#define RT1019_CLS_INT_REG_1		0x0323
+#define RT1019_CLS_INT_REG_2		0x0324
+#define RT1019_CLS_INT_REG_3		0x0325
+#define RT1019_CLS_INT_REG_4		0x0326
+#define RT1019_CLS_INT_REG_5		0x0327
+#define RT1019_CLS_INT_REG_6		0x0328
+#define RT1019_CLS_INT_REG_7		0x0329
+#define RT1019_CLS_INT_REG_8		0x0330
+#define RT1019_CLS_INT_REG_9		0x0331
+#define RT1019_CLS_INT_REG_10		0x0332
+#define RT1019_TDM_1				0x0400
+#define RT1019_TDM_2				0x0401
+#define RT1019_TDM_3				0x0402
+#define RT1019_TDM_4				0x0403
+#define RT1019_TDM_5				0x0404
+#define RT1019_TDM_6				0x0405
+#define RT1019_DVOL_1				0x0500
+#define RT1019_DVOL_2				0x0501
+#define RT1019_DVOL_3				0x0502
+#define RT1019_DVOL_4				0x0503
+#define RT1019_DMIX_MONO_1			0x0504
+#define RT1019_DMIX_MONO_2			0x0505
+#define RT1019_CAL_TOP_1			0x0600
+#define RT1019_CAL_TOP_2			0x0601
+#define RT1019_CAL_TOP_3			0x0602
+#define RT1019_CAL_TOP_4			0x0603
+#define RT1019_CAL_TOP_5			0x0604
+#define RT1019_CAL_TOP_6			0x0605
+#define RT1019_CAL_TOP_7			0x0606
+#define RT1019_CAL_TOP_8			0x0607
+#define RT1019_CAL_TOP_9			0x0608
+#define RT1019_CAL_TOP_10			0x0609
+#define RT1019_CAL_TOP_11			0x060a
+#define RT1019_CAL_TOP_12			0x060b
+#define RT1019_CAL_TOP_13			0x060c
+#define RT1019_CAL_TOP_14			0x060d
+#define RT1019_CAL_TOP_15			0x060e
+#define RT1019_CAL_TOP_16			0x060f
+#define RT1019_CAL_TOP_17			0x0610
+#define RT1019_CAL_TOP_18			0x0611
+#define RT1019_CAL_TOP_19			0x0612
+#define RT1019_CAL_TOP_20			0x0613
+#define RT1019_CAL_TOP_21			0x0614
+#define RT1019_CAL_TOP_22			0x0615
+#define RT1019_MDRE_CTRL_1			0x0700
+#define RT1019_MDRE_CTRL_2			0x0701
+#define RT1019_MDRE_CTRL_3			0x0702
+#define RT1019_MDRE_CTRL_4			0x0703
+#define RT1019_MDRE_CTRL_5			0x0704
+#define RT1019_MDRE_CTRL_6			0x0705
+#define RT1019_MDRE_CTRL_7			0x0706
+#define RT1019_MDRE_CTRL_8			0x0707
+#define RT1019_MDRE_CTRL_9			0x0708
+#define RT1019_MDRE_CTRL_10			0x0709
+#define RT1019_SCC_CTRL_1			0x0800
+#define RT1019_SCC_CTRL_2			0x0801
+#define RT1019_SCC_CTRL_3			0x0802
+#define RT1019_SCC_DUMMY			0x0803
+#define RT1019_SIL_DET_1			0x0900
+#define RT1019_SIL_DET_2			0x0901
+#define RT1019_PWM_DC_DET_1			0x0a00
+#define RT1019_PWM_DC_DET_2			0x0a01
+#define RT1019_PWM_DC_DET_3			0x0a02
+#define RT1019_PWM_DC_DET_4			0x0a03
+#define RT1019_BEEP_1				0x0b00
+#define RT1019_BEEP_2				0x0b01
+#define RT1019_PMC_1				0x0c00
+#define RT1019_PMC_2				0x0c01
+#define RT1019_PMC_3				0x0c02
+#define RT1019_PMC_4				0x0c03
+#define RT1019_PMC_5				0x0c04
+#define RT1019_PMC_6				0x0c05
+#define RT1019_PMC_7				0x0c06
+#define RT1019_PMC_8				0x0c07
+#define RT1019_PMC_9				0x0c08
+#define RT1019_SPKDRC_1				0x0d00
+#define RT1019_SPKDRC_2				0x0d01
+#define RT1019_SPKDRC_3				0x0d02
+#define RT1019_SPKDRC_4				0x0d03
+#define RT1019_SPKDRC_5				0x0d04
+#define RT1019_SPKDRC_6				0x0d05
+#define RT1019_SPKDRC_7				0x0d06
+#define RT1019_HALF_FREQ_1			0x0e00
+#define RT1019_HALF_FREQ_2			0x0e01
+#define RT1019_HALF_FREQ_3			0x0e02
+#define RT1019_HALF_FREQ_4			0x0e03
+#define RT1019_HALF_FREQ_5			0x0e04
+#define RT1019_HALF_FREQ_6			0x0e05
+#define RT1019_HALF_FREQ_7			0x0e06
+#define RT1019_CUR_CTRL_1			0x0f00
+#define RT1019_CUR_CTRL_2			0x0f01
+#define RT1019_CUR_CTRL_3			0x0f02
+#define RT1019_CUR_CTRL_4			0x0f03
+#define RT1019_CUR_CTRL_5			0x0f04
+#define RT1019_CUR_CTRL_6			0x0f05
+#define RT1019_CUR_CTRL_7			0x0f06
+#define RT1019_CUR_CTRL_8			0x0f07
+#define RT1019_CUR_CTRL_9			0x0f08
+#define RT1019_CUR_CTRL_10			0x0f09
+#define RT1019_CUR_CTRL_11			0x0f0a
+#define RT1019_CUR_CTRL_12			0x0f0b
+#define RT1019_CUR_CTRL_13			0x0f0c
+
+/* 0x0019 Power On Strap Control-2 */
+#define RT1019_AUTO_BITS_SEL_MASK		(0x1 << 5)
+#define RT1019_AUTO_BITS_SEL_AUTO		(0x1 << 5)
+#define RT1019_AUTO_BITS_SEL_MANU		(0x0 << 5)
+#define RT1019_AUTO_CLK_SEL_MASK		(0x1 << 4)
+#define RT1019_AUTO_CLK_SEL_AUTO		(0x1 << 4)
+#define RT1019_AUTO_CLK_SEL_MANU		(0x0 << 4)
+
+/* 0x0100 Clock Tree Control-1 */
+#define RT1019_CLK_SYS_PRE_SEL_MASK		(0x1 << 7)
+#define RT1019_CLK_SYS_PRE_SEL_SFT		7
+#define RT1019_CLK_SYS_PRE_SEL_BCLK		(0x0 << 7)
+#define RT1019_CLK_SYS_PRE_SEL_PLL		(0x1 << 7)
+#define RT1019_PLL_SRC_MASK				(0x1 << 4)
+#define RT1019_PLL_SRC_SFT				4
+#define RT1019_PLL_SRC_SEL_BCLK			(0x0 << 4)
+#define RT1019_PLL_SRC_SEL_RC			(0x1 << 4)
+#define RT1019_SEL_FIFO_MASK			(0x3 << 2)
+#define RT1019_SEL_FIFO_DIV1			(0x0 << 2)
+#define RT1019_SEL_FIFO_DIV2			(0x1 << 2)
+#define RT1019_SEL_FIFO_DIV4			(0x2 << 2)
+
+/* 0x0101 clock tree control-2 */
+#define RT1019_SYS_DIV_DA_FIL_MASK		(0x7 << 5)
+#define RT1019_SYS_DIV_DA_FIL_DIV1		(0x2 << 5)
+#define RT1019_SYS_DIV_DA_FIL_DIV2		(0x3 << 5)
+#define RT1019_SYS_DIV_DA_FIL_DIV4		(0x4 << 5)
+#define RT1019_SYS_DA_OSR_MASK			(0x3 << 2)
+#define RT1019_SYS_DA_OSR_DIV1			(0x0 << 2)
+#define RT1019_SYS_DA_OSR_DIV2			(0x1 << 2)
+#define RT1019_SYS_DA_OSR_DIV4			(0x2 << 2)
+#define RT1019_ASRC_256FS_MASK			0x3
+#define RT1019_ASRC_256FS_DIV1			0x0
+#define RT1019_ASRC_256FS_DIV2			0x1
+#define RT1019_ASRC_256FS_DIV4			0x2
+
+/* 0x0102 clock tree control-3 */
+#define RT1019_SEL_CLK_CAL_MASK			(0x3 << 6)
+#define RT1019_SEL_CLK_CAL_DIV1			(0x0 << 6)
+#define RT1019_SEL_CLK_CAL_DIV2			(0x1 << 6)
+#define RT1019_SEL_CLK_CAL_DIV4			(0x2 << 6)
+
+/* 0x0311 PLL-1 */
+#define RT1019_PLL_M_MASK			(0xf << 4)
+#define RT1019_PLL_M_SFT			4
+#define RT1019_PLL_M_BP_MASK		(0x1 << 1)
+#define RT1019_PLL_M_BP_SFT			1
+#define RT1019_PLL_Q_8_8_MASK		(0x1)
+
+/* 0x0312 PLL-2 */
+#define RT1019_PLL_Q_7_0_MASK		0xff
+
+/* 0x0313 PLL-3 */
+#define RT1019_PLL_K_MASK		0x1f
+
+/* 0x0400 TDM Control-1 */
+#define RT1019_TDM_BCLK_MASK		(0x1 << 6)
+#define RT1019_TDM_BCLK_NORM		(0x0 << 6)
+#define RT1019_TDM_BCLK_INV			(0x1 << 6)
+
+/* 0x0401 TDM Control-2 */
+#define RT1019_I2S_CH_TX_MASK		(0x3 << 6)
+#define RT1019_I2S_CH_TX_SFT		6
+#define RT1019_I2S_TX_2CH			(0x0 << 6)
+#define RT1019_I2S_TX_4CH			(0x1 << 6)
+#define RT1019_I2S_TX_6CH			(0x2 << 6)
+#define RT1019_I2S_TX_8CH			(0x3 << 6)
+#define RT1019_I2S_DF_MASK			(0x7 << 3)
+#define RT1019_I2S_DF_SFT			3
+#define RT1019_I2S_DF_I2S			(0x0 << 3)
+#define RT1019_I2S_DF_LEFT			(0x1 << 3)
+#define RT1019_I2S_DF_PCM_A_R		(0x2 << 3)
+#define RT1019_I2S_DF_PCM_B_R		(0x3 << 3)
+#define RT1019_I2S_DF_PCM_A_F		(0x6 << 3)
+#define RT1019_I2S_DF_PCM_B_F		(0x7 << 3)
+#define RT1019_I2S_DL_MASK			0x7
+#define RT1019_I2S_DL_SFT			0
+#define RT1019_I2S_DL_16			0x0
+#define RT1019_I2S_DL_20			0x1
+#define RT1019_I2S_DL_24			0x2
+#define RT1019_I2S_DL_32			0x3
+#define RT1019_I2S_DL_8				0x4
+
+/* TDM1 Control-3 (0x0402) */
+#define RT1019_TDM_I2S_TX_L_DAC1_1_MASK		(0x7 << 4)
+#define RT1019_TDM_I2S_TX_R_DAC1_1_MASK		0x7
+#define RT1019_TDM_I2S_TX_L_DAC1_1_SFT		4
+#define RT1019_TDM_I2S_TX_R_DAC1_1_SFT		0
+
+/* System Clock Source */
+enum {
+	RT1019_SCLK_S_BCLK,
+	RT1019_SCLK_S_PLL,
+};
+
+/* PLL1 Source */
+enum {
+	RT1019_PLL_S_BCLK,
+	RT1019_PLL_S_RC25M,
+};
+
+enum {
+	RT1019_AIF1,
+	RT1019_AIFS
+};
+
+struct rt1019_priv {
+	struct snd_soc_component *component;
+	struct regmap *regmap;
+	int sysclk;
+	int sysclk_src;
+	int lrck;
+	int bclk;
+	int pll_src;
+	int pll_in;
+	int pll_out;
+	unsigned int bclk_ratio;
+};
+
+#endif /* __RT1019_H__ */
-- 
2.29.0

