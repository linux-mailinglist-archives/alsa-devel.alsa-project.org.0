Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C370138E59
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jan 2020 10:58:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4A95165D;
	Mon, 13 Jan 2020 10:57:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4A95165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578909485;
	bh=5YVO0Sb9QVgfBxPuvLTOpscGP1SU5iNaALiCVeUfT18=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HiDfyJG023/inGnXE1Dd2y57cjmj6pvLa2PVtNOE4hMynXw3xWt3UDhiHHQfs4Exs
	 we34u3qWrgvfxPba+8AI741uD6k2S6Llcu3yIf5vSXaGhhSRcGyXw8jxYWkRwmrI0o
	 80fHlSnz3achCbUd/hKuxFXs67SiRqFgBj0k4BS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B97DDF80149;
	Mon, 13 Jan 2020 10:54:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D46BF8015B; Fri, 10 Jan 2020 03:18:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14D75F80116
 for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2020 03:18:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14D75F80116
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID 00A2ISpi024075,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCASV01.realtek.com.tw[172.21.6.18])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id 00A2ISpi024075
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 Jan 2020 10:18:29 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTITCASV01.realtek.com.tw (172.21.6.18) with Microsoft SMTP Server id
 14.3.468.0; Fri, 10 Jan 2020 10:18:27 +0800
From: <jack.yu@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Fri, 10 Jan 2020 10:18:21 +0800
Message-ID: <20200110021821.17843-1-jack.yu@realtek.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Originating-IP: [172.22.102.1]
X-Mailman-Approved-At: Mon, 13 Jan 2020 10:54:48 +0100
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, flove@realtek.com,
 bard.liao@intel.com, pierre-louis.bossart@intel.com
Subject: [alsa-devel] [PATCH] ASoC: rt715: add RT715 codec driver
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

Signed-off-by: Jack Yu <jack.yu@realtek.com>
---
 sound/soc/codecs/Kconfig     |  10 +
 sound/soc/codecs/Makefile    |   2 +
 sound/soc/codecs/rt715-sdw.c | 613 ++++++++++++++++++++++++
 sound/soc/codecs/rt715-sdw.h | 337 ++++++++++++++
 sound/soc/codecs/rt715.c     | 873 +++++++++++++++++++++++++++++++++++
 sound/soc/codecs/rt715.h     | 221 +++++++++
 6 files changed, 2056 insertions(+)
 create mode 100644 sound/soc/codecs/rt715-sdw.c
 create mode 100644 sound/soc/codecs/rt715-sdw.h
 create mode 100644 sound/soc/codecs/rt715.c
 create mode 100644 sound/soc/codecs/rt715.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 65b81888ca3d..cb27ab37a8db 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -166,6 +166,7 @@ config SND_SOC_ALL_CODECS
 	select SND_SOC_RT5677 if I2C && SPI_MASTER
 	select SND_SOC_RT5682 if I2C
 	select SND_SOC_RT711_SDW if SOUNDWIRE
+	select SND_SOC_RT715_SDW if SOUNDWIRE
 	select SND_SOC_SGTL5000 if I2C
 	select SND_SOC_SI476X if MFD_SI476X_CORE
 	select SND_SOC_SIMPLE_AMPLIFIER
@@ -1069,6 +1070,15 @@ config SND_SOC_RT711_SDW
 	select SND_SOC_RT711
 	select REGMAP_SOUNDWIRE
 
+config SND_SOC_RT715
+	tristate
+
+config SND_SOC_RT715_SDW
+	tristate "Realtek RT715 Codec - SDW"
+	depends on SOUNDWIRE
+	select SND_SOC_RT715
+	select REGMAP_SOUNDWIRE
+
 #Freescale sgtl5000 codec
 config SND_SOC_SGTL5000
 	tristate "Freescale SGTL5000 CODEC"
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index f4dfe033d120..b1ac7461d7a0 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -174,6 +174,7 @@ snd-soc-rt5677-objs := rt5677.o
 snd-soc-rt5677-spi-objs := rt5677-spi.o
 snd-soc-rt5682-objs := rt5682.o
 snd-soc-rt711-objs := rt711.o rt711-sdw.o
+snd-soc-rt715-objs := rt715.o rt715-sdw.o
 snd-soc-sgtl5000-objs := sgtl5000.o
 snd-soc-alc5623-objs := alc5623.o
 snd-soc-alc5632-objs := alc5632.o
@@ -467,6 +468,7 @@ obj-$(CONFIG_SND_SOC_RT5677)	+= snd-soc-rt5677.o
 obj-$(CONFIG_SND_SOC_RT5677_SPI)	+= snd-soc-rt5677-spi.o
 obj-$(CONFIG_SND_SOC_RT5682)	+= snd-soc-rt5682.o
 obj-$(CONFIG_SND_SOC_RT711)     += snd-soc-rt711.o
+obj-$(CONFIG_SND_SOC_RT715)     += snd-soc-rt715.o
 obj-$(CONFIG_SND_SOC_SGTL5000)  += snd-soc-sgtl5000.o
 obj-$(CONFIG_SND_SOC_SIGMADSP)	+= snd-soc-sigmadsp.o
 obj-$(CONFIG_SND_SOC_SIGMADSP_I2C)	+= snd-soc-sigmadsp-i2c.o
diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
new file mode 100644
index 000000000000..c35591fd281b
--- /dev/null
+++ b/sound/soc/codecs/rt715-sdw.c
@@ -0,0 +1,613 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * rt715-sdw.c -- rt715 ALSA SoC audio driver
+ *
+ * Copyright(c) 2019 Realtek Semiconductor Corp.
+ *
+ * ALC715 ASoC Codec Driver based Intel Dummy SdW codec driver
+ *
+ */
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+#include "rt715.h"
+#include "rt715-sdw.h"
+
+static bool rt715_readable_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case 0x00e0 ... 0x00e5:
+	case 0x00ee ... 0x00ef:
+	case 0x00f0 ... 0x00f5:
+	case 0x00fe ... 0x00ff:
+	case 0x02e0:
+	case 0x02f0:
+	case 0x04e0:
+	case 0x04f0:
+	case 0x06e0:
+	case 0x06f0:
+	case 0x2000 ... 0x2016:
+	case 0x201a ... 0x2027:
+	case 0x2029 ... 0x202a:
+	case 0x202d ... 0x2034:
+	case 0x2200 ... 0x2204:
+	case 0x2206 ... 0x2212:
+	case 0x2220 ... 0x2223:
+	case 0x2230 ... 0x2239:
+	case 0x22f0 ... 0x22f3:
+	case 0x3122:
+	case 0x3123:
+	case 0x3124:
+	case 0x3125:
+	case 0x3607:
+	case 0x3608:
+	case 0x3609:
+	case 0x3610:
+	case 0x3611:
+	case 0x3627:
+	case 0x3712:
+	case 0x3713:
+	case 0x3718:
+	case 0x3719:
+	case 0x371a:
+	case 0x371b:
+	case 0x371d:
+	case 0x3729:
+	case 0x385e:
+	case 0x3859:
+	case 0x4c12:
+	case 0x4c13:
+	case 0x4c1d:
+	case 0x4c29:
+	case 0x4d12:
+	case 0x4d13:
+	case 0x4d1d:
+	case 0x4d29:
+	case 0x4e12:
+	case 0x4e13:
+	case 0x4e1d:
+	case 0x4e29:
+	case 0x4f12:
+	case 0x4f13:
+	case 0x4f1d:
+	case 0x4f29:
+	case 0x7207:
+	case 0x7208:
+	case 0x7209:
+	case 0x7227:
+	case 0x7307:
+	case 0x7308:
+	case 0x7309:
+	case 0x7312:
+	case 0x7313:
+	case 0x7318:
+	case 0x7319:
+	case 0x731a:
+	case 0x731b:
+	case 0x731d:
+	case 0x7327:
+	case 0x7329:
+	case 0x8287:
+	case 0x8288:
+	case 0x8289:
+	case 0x82a7:
+	case 0x8387:
+	case 0x8388:
+	case 0x8389:
+	case 0x8392:
+	case 0x8393:
+	case 0x8398:
+	case 0x8399:
+	case 0x839a:
+	case 0x839b:
+	case 0x839d:
+	case 0x83a7:
+	case 0x83a9:
+	case 0x752039:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool rt715_volatile_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case 0x00e5:
+	case 0x00f0:
+	case 0x00f3:
+	case 0x00f5:
+	case 0x2009:
+	case 0x2016:
+	case 0x201b:
+	case 0x201c:
+	case 0x201d:
+	case 0x201f:
+	case 0x2023:
+	case 0x2230:
+	case 0x200b ... 0x200e: /* i2c read */
+	case 0x2012 ... 0x2015: /* HD-A read */
+	case 0x202d ... 0x202f: /* BRA */
+	case 0x2201 ... 0x2212: /* i2c debug */
+	case 0x2220 ... 0x2223: /* decoded HD-A */
+		return true;
+	default:
+		return false;
+	}
+}
+
+static int rt715_sdw_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct device *dev = context;
+	struct rt715_priv *rt715 = dev_get_drvdata(dev);
+	unsigned int sdw_data_3, sdw_data_2, sdw_data_1, sdw_data_0;
+	unsigned int reg2 = 0, reg3 = 0, reg4 = 0, mask, nid, val2;
+	unsigned int is_hda_reg = 1, is_index_reg = 0;
+	int ret;
+
+	if (reg > 0xffff)
+		is_index_reg = 1;
+
+	mask = reg & 0xf000;
+
+	if (is_index_reg) { /* index registers */
+		val2 = reg & 0xff;
+		reg = reg >> 8;
+		nid = reg & 0xff;
+		ret = regmap_write(rt715->sdw_regmap, reg, 0);
+		if (ret < 0)
+			return ret;
+		reg2 = reg + 0x1000;
+		reg2 |= 0x80;
+		ret = regmap_write(rt715->sdw_regmap, reg2, val2);
+		if (ret < 0)
+			return ret;
+
+		reg3 = RT715_PRIV_DATA_R_H | nid;
+		ret = regmap_write(rt715->sdw_regmap, reg3,
+			((*val >> 8) & 0xff));
+		if (ret < 0)
+			return ret;
+		reg4 = reg3 + 0x1000;
+		reg4 |= 0x80;
+		ret = regmap_write(rt715->sdw_regmap, reg4, (*val & 0xff));
+		if (ret < 0)
+			return ret;
+	} else if (mask   == 0x3000) {
+		reg += 0x8000;
+		ret = regmap_write(rt715->sdw_regmap, reg, *val);
+		if (ret < 0)
+			return ret;
+	} else if (mask == 0x7000) {
+		reg += 0x2000;
+		reg |= 0x800;
+		ret = regmap_write(rt715->sdw_regmap, reg,
+			((*val >> 8) & 0xff));
+		if (ret < 0)
+			return ret;
+		reg2 = reg + 0x1000;
+		reg2 |= 0x80;
+		ret = regmap_write(rt715->sdw_regmap, reg2, (*val & 0xff));
+		if (ret < 0)
+			return ret;
+	} else if ((reg & 0xff00) == 0x8300) { /* for R channel */
+		reg2 = reg - 0x1000;
+		reg2 &= ~0x80;
+		ret = regmap_write(rt715->sdw_regmap, reg2,
+			((*val >> 8) & 0xff));
+		if (ret < 0)
+			return ret;
+		ret = regmap_write(rt715->sdw_regmap, reg, (*val & 0xff));
+		if (ret < 0)
+			return ret;
+	} else if (mask == 0x9000) {
+		ret = regmap_write(rt715->sdw_regmap, reg,
+			((*val >> 8) & 0xff));
+		if (ret < 0)
+			return ret;
+		reg2 = reg + 0x1000;
+		reg2 |= 0x80;
+		ret = regmap_write(rt715->sdw_regmap, reg2, (*val & 0xff));
+		if (ret < 0)
+			return ret;
+	} else if (mask == 0xb000) {
+		ret = regmap_write(rt715->sdw_regmap, reg, *val);
+		if (ret < 0)
+			return ret;
+	} else {
+		ret = regmap_read(rt715->sdw_regmap, reg, val);
+		if (ret < 0)
+			return ret;
+		is_hda_reg = 0;
+	}
+
+	if (is_hda_reg || is_index_reg) {
+		sdw_data_3 = 0;
+		sdw_data_2 = 0;
+		sdw_data_1 = 0;
+		sdw_data_0 = 0;
+		ret = regmap_read(rt715->sdw_regmap, RT715_READ_HDA_3,
+			&sdw_data_3);
+		if (ret < 0)
+			return ret;
+		ret = regmap_read(rt715->sdw_regmap, RT715_READ_HDA_2,
+			&sdw_data_2);
+		if (ret < 0)
+			return ret;
+		ret = regmap_read(rt715->sdw_regmap, RT715_READ_HDA_1,
+			&sdw_data_1);
+		if (ret < 0)
+			return ret;
+		ret = regmap_read(rt715->sdw_regmap, RT715_READ_HDA_0,
+			&sdw_data_0);
+		if (ret < 0)
+			return ret;
+		*val = ((sdw_data_3 & 0xff) << 24) |
+			((sdw_data_2 & 0xff) << 16) |
+			((sdw_data_1 & 0xff) << 8) | (sdw_data_0 & 0xff);
+	}
+
+	if (is_hda_reg == 0)
+		dev_dbg(dev, "[%s] %04x => %08x\n", __func__, reg, *val);
+	else if (is_index_reg)
+		dev_dbg(dev, "[%s] %04x %04x %04x %04x => %08x\n", __func__,
+			reg, reg2, reg3, reg4, *val);
+	else
+		dev_dbg(dev, "[%s] %04x %04x => %08x\n",
+		__func__, reg, reg2, *val);
+
+	return 0;
+}
+
+static int rt715_sdw_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct device *dev = context;
+	struct rt715_priv *rt715 = dev_get_drvdata(dev);
+	unsigned int reg2 = 0, reg3, reg4, nid, mask, val2;
+	unsigned int is_index_reg = 0;
+	int ret;
+
+	if (reg > 0xffff)
+		is_index_reg = 1;
+
+	mask = reg & 0xf000;
+
+	if (is_index_reg) { /* index registers */
+		val2 = reg & 0xff;
+		reg = reg >> 8;
+		nid = reg & 0xff;
+		ret = regmap_write(rt715->sdw_regmap, reg, 0);
+		if (ret < 0)
+			return ret;
+		reg2 = reg + 0x1000;
+		reg2 |= 0x80;
+		ret = regmap_write(rt715->sdw_regmap, reg2, val2);
+		if (ret < 0)
+			return ret;
+
+		reg3 = RT715_PRIV_DATA_W_H | nid;
+		ret = regmap_write(rt715->sdw_regmap, reg3,
+			((val >> 8) & 0xff));
+		if (ret < 0)
+			return ret;
+		reg4 = reg3 + 0x1000;
+		reg4 |= 0x80;
+		ret = regmap_write(rt715->sdw_regmap, reg4, (val & 0xff));
+		if (ret < 0)
+			return ret;
+		is_index_reg = 1;
+	} else if (reg < 0x4fff) {
+		ret = regmap_write(rt715->sdw_regmap, reg, val);
+		if (ret < 0)
+			return ret;
+	} else if (reg == RT715_FUNC_RESET) {
+		ret = regmap_write(rt715->sdw_regmap, reg, val);
+		if (ret < 0)
+			return ret;
+	} else if (mask == 0x7000) {
+		ret = regmap_write(rt715->sdw_regmap, reg,
+			((val >> 8) & 0xff));
+		if (ret < 0)
+			return ret;
+		reg2 = reg + 0x1000;
+		reg2 |= 0x80;
+		ret = regmap_write(rt715->sdw_regmap, reg2, (val & 0xff));
+		if (ret < 0)
+			return ret;
+	} else if ((reg & 0xff00) == 0x8300) {  /* for R channel */
+		reg2 = reg - 0x1000;
+		reg2 &= ~0x80;
+		ret = regmap_write(rt715->sdw_regmap, reg2,
+			((val >> 8) & 0xff));
+		if (ret < 0)
+			return ret;
+		ret = regmap_write(rt715->sdw_regmap, reg, (val & 0xff));
+		if (ret < 0)
+			return ret;
+	}
+
+	if (reg2 == 0)
+		dev_dbg(dev, "[%s] %04x <= %04x\n", __func__, reg, val);
+	else if (is_index_reg)
+		dev_dbg(dev, "[%s] %04x %04x %04x %04x <= %04x %04x\n",
+			__func__, reg, reg2, reg3, reg4, val2, val);
+	else
+		dev_dbg(dev, "[%s] %04x %04x <= %04x\n",
+		__func__, reg, reg2, val);
+
+	return 0;
+}
+
+static const struct regmap_config rt715_regmap = {
+	.reg_bits = 24,
+	.val_bits = 32,
+	.readable_reg = rt715_readable_register, /* Readable registers */
+	.volatile_reg = rt715_volatile_register, /* volatile register */
+	.max_register = 0x752039, /* Maximum number of register */
+	.reg_defaults = rt715_reg_defaults, /* Defaults */
+	.num_reg_defaults = ARRAY_SIZE(rt715_reg_defaults),
+	.cache_type = REGCACHE_RBTREE,
+	.use_single_read = true,
+	.use_single_write = true,
+	.reg_read = rt715_sdw_read,
+	.reg_write = rt715_sdw_write,
+};
+
+static const struct regmap_config rt715_sdw_regmap = {
+	.name = "sdw",
+	.reg_bits = 32, /* Total register space for SDW */
+	.val_bits = 8, /* Total number of bits in register */
+	.max_register = 0xff01, /* Maximum number of register */
+	.cache_type = REGCACHE_NONE,
+	.use_single_read = true,
+	.use_single_write = true,
+};
+
+int hda_to_sdw(unsigned int nid, unsigned int verb, unsigned int payload,
+	       unsigned int *sdw_addr_h, unsigned int *sdw_data_h,
+	       unsigned int *sdw_addr_l, unsigned int *sdw_data_l)
+{
+	unsigned int offset_h, offset_l, e_verb;
+
+	if (((verb & 0xff) != 0) || verb == 0xf00) { /* 12 bits command */
+		if (verb == 0x7ff) /* special case */
+			offset_h = 0;
+		else
+			offset_h = 0x3000;
+
+		if (verb & 0x800) /* get command */
+			e_verb = (verb - 0xf00) | 0x80;
+		else /* set command */
+			e_verb = (verb - 0x700);
+
+		*sdw_data_h = payload; /* 7 bits payload */
+		*sdw_addr_l = *sdw_data_l = 0;
+	} else { /* 4 bits command */
+		if ((verb & 0x800) == 0x800) { /* read */
+			offset_h = 0x9000;
+			offset_l = 0xa000;
+		} else { /* write */
+			offset_h = 0x7000;
+			offset_l = 0x8000;
+		}
+		e_verb = verb >> 8;
+		*sdw_data_h = (payload >> 8); /* 16 bits payload [15:8] */
+		*sdw_addr_l = (e_verb << 8) | nid | 0x80; /* 0x80: valid bit */
+		*sdw_addr_l += offset_l;
+		*sdw_data_l = payload & 0xff;
+	}
+
+	*sdw_addr_h = (e_verb << 8) | nid;
+	*sdw_addr_h += offset_h;
+
+	return 0;
+}
+EXPORT_SYMBOL(hda_to_sdw);
+
+static int rt715_update_status(struct sdw_slave *slave,
+				enum sdw_slave_status status)
+{
+	struct rt715_priv *rt715 = dev_get_drvdata(&slave->dev);
+
+	/* Update the status */
+	rt715->status = status;
+	/*
+	 * Perform initialization only if slave status is present and
+	 * hw_init flag is false
+	 */
+	if (rt715->hw_init || rt715->status != SDW_SLAVE_ATTACHED)
+		return 0;
+
+	/* perform I/O transfers required for Slave initialization */
+	return rt715_io_init(&slave->dev, slave);
+}
+
+static int rt715_read_prop(struct sdw_slave *slave)
+{
+	struct sdw_slave_prop *prop = &slave->prop;
+	int nval, i, num_of_ports = 1;
+	u32 bit;
+	unsigned long addr;
+	struct sdw_dpn_prop *dpn;
+
+	prop->paging_support = false;
+
+	/* first we need to allocate memory for set bits in port lists */
+	prop->source_ports = 0x50;/* BITMAP: 01010000 */
+	prop->sink_ports = 0x0;	/* BITMAP:  00000000 */
+
+	nval = hweight32(prop->source_ports);
+	num_of_ports += nval;
+	prop->src_dpn_prop = devm_kcalloc(&slave->dev, nval,
+					sizeof(*prop->src_dpn_prop),
+					GFP_KERNEL);
+	if (!prop->src_dpn_prop)
+		return -ENOMEM;
+
+	dpn = prop->src_dpn_prop;
+	i = 0;
+	addr = prop->source_ports;
+	for_each_set_bit(bit, &addr, 32) {
+		dpn[i].num = bit;
+		dpn[i].simple_ch_prep_sm = true;
+		dpn[i].ch_prep_timeout = 10;
+		i++;
+	}
+
+	/* do this again for sink now */
+	nval = hweight32(prop->sink_ports);
+	num_of_ports += nval;
+	prop->sink_dpn_prop = devm_kcalloc(&slave->dev, nval,
+					sizeof(*prop->sink_dpn_prop),
+					GFP_KERNEL);
+	if (!prop->sink_dpn_prop)
+		return -ENOMEM;
+
+	dpn = prop->sink_dpn_prop;
+	i = 0;
+	addr = prop->sink_ports;
+	for_each_set_bit(bit, &addr, 32) {
+		dpn[i].num = bit;
+		dpn[i].simple_ch_prep_sm = true;
+		dpn[i].ch_prep_timeout = 10;
+		i++;
+	}
+
+	/* Allocate port_ready based on num_of_ports */
+	slave->port_ready = devm_kcalloc(&slave->dev, num_of_ports,
+					sizeof(*slave->port_ready),
+					GFP_KERNEL);
+	if (!slave->port_ready)
+		return -ENOMEM;
+
+	/* Initialize completion */
+	for (i = 0; i < num_of_ports; i++)
+		init_completion(&slave->port_ready[i]);
+
+	/* set the timeout values */
+	prop->clk_stop_timeout = 20;
+
+	/* wake-up event */
+	prop->wake_capable = 1;
+
+	return 0;
+}
+
+static int rt715_bus_config(struct sdw_slave *slave,
+				struct sdw_bus_params *params)
+{
+	struct rt715_priv *rt715 = dev_get_drvdata(&slave->dev);
+	int ret;
+
+	memcpy(&rt715->params, params, sizeof(*params));
+
+	ret = rt715_clock_config(&slave->dev);
+	if (ret < 0)
+		dev_err(&slave->dev, "Invalid clk config");
+
+	return 0;
+}
+
+static struct sdw_slave_ops rt715_slave_ops = {
+	.read_prop = rt715_read_prop,
+	.update_status = rt715_update_status,
+	.bus_config = rt715_bus_config,
+};
+
+static int rt715_sdw_probe(struct sdw_slave *slave,
+			   const struct sdw_device_id *id)
+{
+	struct regmap *sdw_regmap, *regmap;
+
+	/* Assign ops */
+	slave->ops = &rt715_slave_ops;
+
+	/* Regmap Initialization */
+	sdw_regmap = devm_regmap_init_sdw(slave, &rt715_sdw_regmap);
+	if (!sdw_regmap)
+		return -EINVAL;
+
+	regmap = devm_regmap_init(&slave->dev, NULL, &slave->dev,
+		&rt715_regmap);
+	if (!regmap)
+		return -EINVAL;
+
+	rt715_init(&slave->dev, sdw_regmap, regmap, slave);
+
+	return 0;
+}
+
+static const struct sdw_device_id rt715_id[] = {
+	SDW_SLAVE_ENTRY(0x025d, 0x715, 0),
+	{},
+};
+MODULE_DEVICE_TABLE(sdw, rt715_id);
+
+static int rt715_dev_suspend(struct device *dev)
+{
+	struct rt715_priv *rt715 = dev_get_drvdata(dev);
+
+	if (!rt715->hw_init)
+		return 0;
+
+	regcache_cache_only(rt715->regmap, true);
+
+	return 0;
+}
+
+#define RT715_PROBE_TIMEOUT 2000
+
+static int rt715_dev_resume(struct device *dev)
+{
+	struct sdw_slave *slave = to_sdw_slave_device(dev);
+	struct rt715_priv *rt715 = dev_get_drvdata(dev);
+	unsigned long time;
+
+	if (!rt715->hw_init)
+		return 0;
+
+	if (!slave->unattach_request)
+		goto regmap_sync;
+
+	time = wait_for_completion_timeout(&slave->initialization_complete,
+					   msecs_to_jiffies(RT715_PROBE_TIMEOUT));
+	if (!time) {
+		dev_err(&slave->dev, "Initialization not complete, timed out\n");
+		return -ETIMEDOUT;
+	}
+
+regmap_sync:
+	slave->unattach_request = 0;
+	regcache_cache_only(rt715->regmap, false);
+	regcache_sync_region(rt715->regmap, 0x3000, 0x8fff);
+	regcache_sync_region(rt715->regmap, 0x752039, 0x752039);
+
+	return 0;
+}
+
+static const struct dev_pm_ops rt715_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(rt715_dev_suspend, rt715_dev_resume)
+	SET_RUNTIME_PM_OPS(rt715_dev_suspend, rt715_dev_resume, NULL)
+};
+
+static struct sdw_driver rt715_sdw_driver = {
+	.driver = {
+		   .name = "rt715",
+		   .owner = THIS_MODULE,
+		   .pm = &rt715_pm,
+		   },
+	.probe = rt715_sdw_probe,
+	.ops = &rt715_slave_ops,
+	.id_table = rt715_id,
+};
+module_sdw_driver(rt715_sdw_driver);
+
+MODULE_DESCRIPTION("ASoC RT715 driver SDW");
+MODULE_AUTHOR("Jack Yu <jack.yu@realtek.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/rt715-sdw.h b/sound/soc/codecs/rt715-sdw.h
new file mode 100644
index 000000000000..5d7661e335ae
--- /dev/null
+++ b/sound/soc/codecs/rt715-sdw.h
@@ -0,0 +1,337 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * rt715-sdw.h -- RT715 ALSA SoC audio driver header
+ *
+ * Copyright(c) 2019 Realtek Semiconductor Corp.
+ */
+
+#ifndef __RT715_SDW_H__
+#define __RT715_SDW_H__
+
+static const struct reg_default rt715_reg_defaults[] = {
+	{ 0x0000, 0x00 },
+	{ 0x0001, 0x00 },
+	{ 0x0002, 0x00 },
+	{ 0x0003, 0x00 },
+	{ 0x0004, 0x00 },
+	{ 0x0005, 0x01 },
+	{ 0x0020, 0x00 },
+	{ 0x0022, 0x00 },
+	{ 0x0023, 0x00 },
+	{ 0x0024, 0x00 },
+	{ 0x0025, 0x00 },
+	{ 0x0026, 0x00 },
+	{ 0x0030, 0x00 },
+	{ 0x0032, 0x00 },
+	{ 0x0033, 0x00 },
+	{ 0x0034, 0x00 },
+	{ 0x0035, 0x00 },
+	{ 0x0036, 0x00 },
+	{ 0x0040, 0x00 },
+	{ 0x0041, 0x00 },
+	{ 0x0042, 0x00 },
+	{ 0x0043, 0x00 },
+	{ 0x0044, 0x20 },
+	{ 0x0045, 0x01 },
+	{ 0x0046, 0x00 },
+	{ 0x0050, 0x20 },
+	{ 0x0051, 0x02 },
+	{ 0x0052, 0x5d },
+	{ 0x0053, 0x07 },
+	{ 0x0054, 0x15 },
+	{ 0x0055, 0x00 },
+	{ 0x0060, 0x00 },
+	{ 0x0070, 0x00 },
+	{ 0x0080, 0x00 },
+	{ 0x0088, 0x10 },
+	{ 0x00e0, 0x00 },
+	{ 0x00e1, 0x00 },
+	{ 0x00e2, 0x00 },
+	{ 0x00e3, 0x00 },
+	{ 0x00e4, 0x00 },
+	{ 0x00e5, 0x00 },
+	{ 0x00ee, 0x00 },
+	{ 0x00ef, 0x00 },
+	{ 0x00f0, 0x00 },
+	{ 0x00f1, 0x00 },
+	{ 0x00f2, 0x00 },
+	{ 0x00f3, 0x00 },
+	{ 0x00f4, 0x00 },
+	{ 0x00f5, 0x00 },
+	{ 0x00fe, 0x00 },
+	{ 0x00ff, 0x00 },
+	{ 0x0200, 0x00 },
+	{ 0x0201, 0x00 },
+	{ 0x0202, 0x20 },
+	{ 0x0203, 0x00 },
+	{ 0x0204, 0x00 },
+	{ 0x0205, 0x03 },
+	{ 0x0220, 0x00 },
+	{ 0x0221, 0x00 },
+	{ 0x0222, 0x00 },
+	{ 0x0223, 0x00 },
+	{ 0x0224, 0x00 },
+	{ 0x0225, 0x00 },
+	{ 0x0226, 0x00 },
+	{ 0x0227, 0x00 },
+	{ 0x0230, 0x00 },
+	{ 0x0231, 0x00 },
+	{ 0x0232, 0x00 },
+	{ 0x0233, 0x00 },
+	{ 0x0234, 0x00 },
+	{ 0x0235, 0x00 },
+	{ 0x0236, 0x00 },
+	{ 0x0237, 0x00 },
+	{ 0x02e0, 0x00 },
+	{ 0x02f0, 0x00 },
+	{ 0x0400, 0x00 },
+	{ 0x0401, 0x00 },
+	{ 0x0402, 0x20 },
+	{ 0x0403, 0x00 },
+	{ 0x0404, 0x00 },
+	{ 0x0405, 0x0f },
+	{ 0x0420, 0x00 },
+	{ 0x0421, 0x00 },
+	{ 0x0422, 0x00 },
+	{ 0x0423, 0x00 },
+	{ 0x0424, 0x00 },
+	{ 0x0425, 0x00 },
+	{ 0x0426, 0x00 },
+	{ 0x0427, 0x00 },
+	{ 0x0430, 0x00 },
+	{ 0x0431, 0x00 },
+	{ 0x0432, 0x00 },
+	{ 0x0433, 0x00 },
+	{ 0x0434, 0x00 },
+	{ 0x0435, 0x00 },
+	{ 0x0436, 0x00 },
+	{ 0x0437, 0x00 },
+	{ 0x04e0, 0x00 },
+	{ 0x04f0, 0x00 },
+	{ 0x0600, 0x00 },
+	{ 0x0601, 0x00 },
+	{ 0x0602, 0x20 },
+	{ 0x0603, 0x00 },
+	{ 0x0604, 0x00 },
+	{ 0x0605, 0xff },
+	{ 0x0620, 0x00 },
+	{ 0x0621, 0x00 },
+	{ 0x0622, 0x00 },
+	{ 0x0623, 0x00 },
+	{ 0x0624, 0x00 },
+	{ 0x0625, 0x00 },
+	{ 0x0626, 0x00 },
+	{ 0x0627, 0x00 },
+	{ 0x0630, 0x00 },
+	{ 0x0631, 0x00 },
+	{ 0x0632, 0x00 },
+	{ 0x0633, 0x00 },
+	{ 0x0634, 0x00 },
+	{ 0x0635, 0x00 },
+	{ 0x0636, 0x00 },
+	{ 0x0637, 0x00 },
+	{ 0x06e0, 0x00 },
+	{ 0x06f0, 0x00 },
+	{ 0x0f00, 0x00 },
+	{ 0x0f01, 0x00 },
+	{ 0x0f02, 0x00 },
+	{ 0x0f03, 0x00 },
+	{ 0x0f04, 0x00 },
+	{ 0x0f05, 0xff },
+	{ 0x0f06, 0x00 },
+	{ 0x0f07, 0x00 },
+	{ 0x0f08, 0x00 },
+	{ 0x0f09, 0x00 },
+	{ 0x0f0a, 0x00 },
+	{ 0x0f0b, 0x00 },
+	{ 0x0f0c, 0x00 },
+	{ 0x0f0d, 0x00 },
+	{ 0x0f0e, 0x00 },
+	{ 0x0f0f, 0x00 },
+	{ 0x0f10, 0x00 },
+	{ 0x0f11, 0x00 },
+	{ 0x0f12, 0x00 },
+	{ 0x0f13, 0x00 },
+	{ 0x0f14, 0x00 },
+	{ 0x0f15, 0x00 },
+	{ 0x0f16, 0x00 },
+	{ 0x0f17, 0x00 },
+	{ 0x0f18, 0x00 },
+	{ 0x0f19, 0x00 },
+	{ 0x0f1a, 0x00 },
+	{ 0x0f1b, 0x00 },
+	{ 0x0f1c, 0x00 },
+	{ 0x0f1d, 0x00 },
+	{ 0x0f1e, 0x00 },
+	{ 0x0f1f, 0x00 },
+	{ 0x0f20, 0x00 },
+	{ 0x0f21, 0x00 },
+	{ 0x0f22, 0x00 },
+	{ 0x0f23, 0x00 },
+	{ 0x0f24, 0x00 },
+	{ 0x0f25, 0x00 },
+	{ 0x0f26, 0x00 },
+	{ 0x0f27, 0x00 },
+	{ 0x0f30, 0x00 },
+	{ 0x0f31, 0x00 },
+	{ 0x0f32, 0x00 },
+	{ 0x0f33, 0x00 },
+	{ 0x0f34, 0x00 },
+	{ 0x0f35, 0x00 },
+	{ 0x0f36, 0x00 },
+	{ 0x0f37, 0x00 },
+	{ 0x2000, 0x00 },
+	{ 0x2001, 0x00 },
+	{ 0x2002, 0x00 },
+	{ 0x2003, 0x00 },
+	{ 0x2004, 0x00 },
+	{ 0x2005, 0x00 },
+	{ 0x2006, 0x00 },
+	{ 0x2007, 0x00 },
+	{ 0x2008, 0x00 },
+	{ 0x2009, 0x03 },
+	{ 0x200a, 0x00 },
+	{ 0x200b, 0x00 },
+	{ 0x200c, 0x00 },
+	{ 0x200d, 0x00 },
+	{ 0x200e, 0x00 },
+	{ 0x200f, 0x10 },
+	{ 0x2010, 0x00 },
+	{ 0x2011, 0x00 },
+	{ 0x2012, 0x00 },
+	{ 0x2013, 0x00 },
+	{ 0x2014, 0x00 },
+	{ 0x2015, 0x00 },
+	{ 0x2016, 0x00 },
+	{ 0x201a, 0x00 },
+	{ 0x201b, 0x00 },
+	{ 0x201c, 0x00 },
+	{ 0x201d, 0x00 },
+	{ 0x201e, 0x00 },
+	{ 0x201f, 0x00 },
+	{ 0x2020, 0x00 },
+	{ 0x2021, 0x00 },
+	{ 0x2022, 0x00 },
+	{ 0x2023, 0x00 },
+	{ 0x2024, 0x00 },
+	{ 0x2025, 0x01 },
+	{ 0x2026, 0x00 },
+	{ 0x2027, 0x00 },
+	{ 0x2029, 0x00 },
+	{ 0x202a, 0x00 },
+	{ 0x202d, 0x00 },
+	{ 0x202e, 0x00 },
+	{ 0x202f, 0x00 },
+	{ 0x2030, 0x00 },
+	{ 0x2031, 0x00 },
+	{ 0x2032, 0x00 },
+	{ 0x2033, 0x00 },
+	{ 0x2034, 0x00 },
+	{ 0x2200, 0x00 },
+	{ 0x2201, 0x00 },
+	{ 0x2202, 0x00 },
+	{ 0x2203, 0x00 },
+	{ 0x2204, 0x00 },
+	{ 0x2206, 0x00 },
+	{ 0x2207, 0x00 },
+	{ 0x2208, 0x00 },
+	{ 0x2209, 0x00 },
+	{ 0x220a, 0x00 },
+	{ 0x220b, 0x00 },
+	{ 0x220c, 0x00 },
+	{ 0x220d, 0x00 },
+	{ 0x220e, 0x00 },
+	{ 0x220f, 0x00 },
+	{ 0x2210, 0x00 },
+	{ 0x2211, 0x00 },
+	{ 0x2212, 0x00 },
+	{ 0x2220, 0x00 },
+	{ 0x2221, 0x00 },
+	{ 0x2222, 0x00 },
+	{ 0x2223, 0x00 },
+	{ 0x2230, 0x00 },
+	{ 0x2231, 0x0f },
+	{ 0x2232, 0x00 },
+	{ 0x2233, 0x00 },
+	{ 0x2234, 0x00 },
+	{ 0x2235, 0x00 },
+	{ 0x2236, 0x00 },
+	{ 0x2237, 0x00 },
+	{ 0x2238, 0x00 },
+	{ 0x2239, 0x00 },
+	{ 0x22f0, 0x00 },
+	{ 0x22f1, 0x00 },
+	{ 0x22f2, 0x00 },
+	{ 0x22f3, 0x00 },
+	{ 0x3122, 0x02 },
+	{ 0x3123, 0x03 },
+	{ 0x3124, 0x00 },
+	{ 0x3125, 0x01 },
+	{ 0x3607, 0x00 },
+	{ 0x3608, 0x00 },
+	{ 0x3609, 0x00 },
+	{ 0x3610, 0x00 },
+	{ 0x3611, 0x00 },
+	{ 0x3627, 0x00 },
+	{ 0x3712, 0x00 },
+	{ 0x3713, 0x00 },
+	{ 0x3718, 0x00 },
+	{ 0x3719, 0x00 },
+	{ 0x371a, 0x00 },
+	{ 0x371b, 0x00 },
+	{ 0x371d, 0x00 },
+	{ 0x3729, 0x00 },
+	{ 0x385e, 0x00 },
+	{ 0x3859, 0x00 },
+	{ 0x4c12, 0x411111f0 },
+	{ 0x4c13, 0x411111f0 },
+	{ 0x4c1d, 0x411111f0 },
+	{ 0x4c29, 0x411111f0 },
+	{ 0x4d12, 0x411111f0 },
+	{ 0x4d13, 0x411111f0 },
+	{ 0x4d1d, 0x411111f0 },
+	{ 0x4d29, 0x411111f0 },
+	{ 0x4e12, 0x411111f0 },
+	{ 0x4e13, 0x411111f0 },
+	{ 0x4e1d, 0x411111f0 },
+	{ 0x4e29, 0x411111f0 },
+	{ 0x4f12, 0x411111f0 },
+	{ 0x4f13, 0x411111f0 },
+	{ 0x4f1d, 0x411111f0 },
+	{ 0x4f29, 0x411111f0 },
+	{ 0x7207, 0x00 },
+	{ 0x8287, 0x00 },
+	{ 0x7208, 0x00 },
+	{ 0x8288, 0x00 },
+	{ 0x7209, 0x00 },
+	{ 0x8289, 0x00 },
+	{ 0x7227, 0x00 },
+	{ 0x82a7, 0x00 },
+	{ 0x7307, 0x97 },
+	{ 0x8387, 0x97 },
+	{ 0x7308, 0x97 },
+	{ 0x8388, 0x97 },
+	{ 0x7309, 0x97 },
+	{ 0x8389, 0x97 },
+	{ 0x7312, 0x00 },
+	{ 0x8392, 0x00 },
+	{ 0x7313, 0x00 },
+	{ 0x8393, 0x00 },
+	{ 0x7318, 0x00 },
+	{ 0x8398, 0x00 },
+	{ 0x7319, 0x00 },
+	{ 0x8399, 0x00 },
+	{ 0x731a, 0x00 },
+	{ 0x839a, 0x00 },
+	{ 0x731b, 0x00 },
+	{ 0x839b, 0x00 },
+	{ 0x731d, 0x00 },
+	{ 0x839d, 0x00 },
+	{ 0x7327, 0x97 },
+	{ 0x83a7, 0x97 },
+	{ 0x7329, 0x00 },
+	{ 0x83a9, 0x00 },
+	{ 0x752039, 0xa500 },
+};
+
+#endif /* __RT715_H__ */
diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
new file mode 100644
index 000000000000..5c6f05b8d8ab
--- /dev/null
+++ b/sound/soc/codecs/rt715.c
@@ -0,0 +1,873 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * rt715.c -- rt715 ALSA SoC audio driver
+ *
+ * Copyright(c) 2019 Realtek Semiconductor Corp.
+ *
+ * ALC715 ASoC Codec Driver based Intel Dummy SdW codec driver
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
+#include <linux/pm_runtime.h>
+#include <linux/pm.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/gpio.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/gpio/consumer.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
+#include <linux/of_device.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <sound/initval.h>
+#include <sound/tlv.h>
+#include <sound/hda_verbs.h>
+
+#include "rt715.h"
+
+static int rt715_index_write(struct regmap *regmap, unsigned int reg,
+		unsigned int value)
+{
+	int ret;
+	unsigned int addr = ((RT715_PRIV_INDEX_W_H) << 8) | reg;
+
+	ret = regmap_write(regmap, addr, value);
+	if (ret < 0) {
+		pr_err("Failed to set private value: %08x <= %04x %d\n", ret,
+			addr, value);
+	}
+
+	return ret;
+}
+
+static void rt715_get_gain(struct rt715_priv *rt715, unsigned int addr_h,
+				unsigned int addr_l, unsigned int val_h,
+				unsigned int *r_val, unsigned int *l_val)
+{
+	int ret;
+	/* R Channel */
+	*r_val = (val_h << 8);
+	ret = regmap_read(rt715->regmap, addr_l, r_val);
+	if (ret < 0)
+		pr_err("Failed to get R channel gain.\n");
+
+	/* L Channel */
+	val_h |= 0x20;
+	*l_val = (val_h << 8);
+	ret = regmap_read(rt715->regmap, addr_h, l_val);
+	if (ret < 0)
+		pr_err("Failed to get L channel gain.\n");
+}
+
+/* For Verb-Set Amplifier Gain (Verb ID = 3h) */
+static int rt715_set_amp_gain_put(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct rt715_priv *rt715 = snd_soc_component_get_drvdata(component);
+	unsigned int addr_h, addr_l, val_h, val_ll, val_lr;
+	unsigned int read_ll, read_rl;
+	int i;
+
+	/* Can't use update bit function, so read the original value first */
+	addr_h = mc->reg;
+	addr_l = mc->rreg;
+	if (mc->shift == RT715_DIR_OUT_SFT) /* output */
+		val_h = 0x80;
+	else /* input */
+		val_h = 0x0;
+
+	rt715_get_gain(rt715, addr_h, addr_l, val_h, &read_rl, &read_ll);
+
+	/* L Channel */
+	if (mc->invert) {
+		/* for mute */
+		val_ll = (mc->max - ucontrol->value.integer.value[0]) << 7;
+		/* keep gain */
+		read_ll = read_ll & 0x7f;
+		val_ll |= read_ll;
+	} else {
+		/* for gain */
+		val_ll = ((ucontrol->value.integer.value[0]) & 0x7f);
+		if (val_ll > mc->max)
+			val_ll = mc->max;
+		/* keep mute status */
+		read_ll = read_ll & 0x80;
+		val_ll |= read_ll;
+	}
+
+	/* R Channel */
+	if (mc->invert) {
+		regmap_write(rt715->regmap,
+			     RT715_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
+		/* for mute */
+		val_lr = (mc->max - ucontrol->value.integer.value[1]) << 7;
+		/* keep gain */
+		read_rl = read_rl & 0x7f;
+		val_lr |= read_rl;
+	} else {
+		/* for gain */
+		val_lr = ((ucontrol->value.integer.value[1]) & 0x7f);
+		if (val_lr > mc->max)
+			val_lr = mc->max;
+		/* keep mute status */
+		read_rl = read_rl & 0x80;
+		val_lr |= read_rl;
+	}
+
+	for (i = 0; i < 3; i++) { /* retry 3 times at most */
+
+		if (val_ll == val_lr) {
+			/* Set both L/R channels at the same time */
+			val_h = (1 << mc->shift) | (3 << 4);
+			regmap_write(rt715->regmap, addr_h,
+				(val_h << 8 | val_ll));
+			regmap_write(rt715->regmap, addr_l,
+				(val_h << 8 | val_ll));
+		} else {
+			/* Lch*/
+			val_h = (1 << mc->shift) | (1 << 5);
+			regmap_write(rt715->regmap, addr_h,
+				(val_h << 8 | val_ll));
+			/* Rch */
+			val_h = (1 << mc->shift) | (1 << 4);
+			regmap_write(rt715->regmap, addr_l,
+				(val_h << 8 | val_lr));
+		}
+		/* check result */
+		if (mc->shift == RT715_DIR_OUT_SFT) /* output */
+			val_h = 0x80;
+		else /* input */
+			val_h = 0x0;
+
+		rt715_get_gain(rt715, addr_h, addr_l, val_h,
+			       &read_rl, &read_ll);
+		if (read_rl == val_lr && read_ll == val_ll)
+			break;
+	}
+	/* D0:power on state, D3: power saving mode */
+	if (dapm->bias_level <= SND_SOC_BIAS_STANDBY)
+		regmap_write(rt715->regmap,
+				RT715_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
+	return 0;
+}
+
+static int rt715_set_amp_gain_get(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt715_priv *rt715 = snd_soc_component_get_drvdata(component);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	unsigned int addr_h, addr_l, val_h;
+	unsigned int read_ll, read_rl;
+
+	addr_h = mc->reg;
+	addr_l = mc->rreg;
+	if (mc->shift == RT715_DIR_OUT_SFT) /* output */
+		val_h = 0x80;
+	else /* input */
+		val_h = 0x0;
+
+	rt715_get_gain(rt715, addr_h, addr_l, val_h, &read_rl, &read_ll);
+
+	if (mc->invert) {
+		/* for mute status */
+		read_ll = !((read_ll & 0x80) >> RT715_MUTE_SFT);
+		read_rl = !((read_rl & 0x80) >> RT715_MUTE_SFT);
+	} else {
+		/* for gain */
+		read_ll = read_ll & 0x7f;
+		read_rl = read_rl & 0x7f;
+	}
+	ucontrol->value.integer.value[0] = read_ll;
+	ucontrol->value.integer.value[1] = read_rl;
+
+	return 0;
+}
+
+static const DECLARE_TLV_DB_SCALE(out_vol_tlv, -6525, 75, 0);
+static const DECLARE_TLV_DB_SCALE(in_vol_tlv, -1725, 75, 0);
+static const DECLARE_TLV_DB_SCALE(mic_vol_tlv, 0, 1000, 0);
+
+#define SOC_DOUBLE_R_EXT(xname, reg_left, reg_right, xshift, xmax, xinvert,\
+	 xhandler_get, xhandler_put) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
+	.info = snd_soc_info_volsw, \
+	.get = xhandler_get, .put = xhandler_put, \
+	.private_value = SOC_DOUBLE_R_VALUE(reg_left, reg_right, xshift, \
+					    xmax, xinvert) }
+
+static const struct snd_kcontrol_new rt715_snd_controls[] = {
+	/* Capture switch */
+	SOC_DOUBLE_R_EXT("ADC 07 Capture Switch", RT715_SET_GAIN_MIC_ADC_H,
+			RT715_SET_GAIN_MIC_ADC_L, RT715_DIR_IN_SFT, 1, 1,
+			rt715_set_amp_gain_get, rt715_set_amp_gain_put),
+	SOC_DOUBLE_R_EXT("ADC 08 Capture Switch", RT715_SET_GAIN_LINE_ADC_H,
+			RT715_SET_GAIN_LINE_ADC_L, RT715_DIR_IN_SFT, 1, 1,
+			rt715_set_amp_gain_get, rt715_set_amp_gain_put),
+	SOC_DOUBLE_R_EXT("ADC 09 Capture Switch", RT715_SET_GAIN_MIX_ADC_H,
+			RT715_SET_GAIN_MIX_ADC_L, RT715_DIR_IN_SFT, 1, 1,
+			rt715_set_amp_gain_get, rt715_set_amp_gain_put),
+	SOC_DOUBLE_R_EXT("ADC 27 Capture Switch", RT715_SET_GAIN_MIX_ADC2_H,
+			RT715_SET_GAIN_MIX_ADC2_L, RT715_DIR_IN_SFT, 1, 1,
+			rt715_set_amp_gain_get, rt715_set_amp_gain_put),
+	/* Volume Control */
+	SOC_DOUBLE_R_EXT_TLV("ADC 07 Capture Volume", RT715_SET_GAIN_MIC_ADC_H,
+			RT715_SET_GAIN_MIC_ADC_L, RT715_DIR_IN_SFT, 0x3f, 0,
+			rt715_set_amp_gain_get, rt715_set_amp_gain_put,
+			in_vol_tlv),
+	SOC_DOUBLE_R_EXT_TLV("ADC 08 Capture Volume", RT715_SET_GAIN_LINE_ADC_H,
+			RT715_SET_GAIN_LINE_ADC_L, RT715_DIR_IN_SFT, 0x3f, 0,
+			rt715_set_amp_gain_get, rt715_set_amp_gain_put,
+			in_vol_tlv),
+	SOC_DOUBLE_R_EXT_TLV("ADC 09 Capture Volume", RT715_SET_GAIN_MIX_ADC_H,
+			RT715_SET_GAIN_MIX_ADC_L, RT715_DIR_IN_SFT, 0x3f, 0,
+			rt715_set_amp_gain_get, rt715_set_amp_gain_put,
+			in_vol_tlv),
+	SOC_DOUBLE_R_EXT_TLV("ADC 27 Capture Volume", RT715_SET_GAIN_MIX_ADC2_H,
+			RT715_SET_GAIN_MIX_ADC2_L, RT715_DIR_IN_SFT, 0x3f, 0,
+			rt715_set_amp_gain_get, rt715_set_amp_gain_put,
+			in_vol_tlv),
+	/* MIC Boost Control */
+	SOC_DOUBLE_R_EXT_TLV("DMIC1 Boost", RT715_SET_GAIN_DMIC1_H,
+			RT715_SET_GAIN_DMIC1_L, RT715_DIR_IN_SFT, 3, 0,
+			rt715_set_amp_gain_get, rt715_set_amp_gain_put,
+			mic_vol_tlv),
+	SOC_DOUBLE_R_EXT_TLV("DMIC2 Boost", RT715_SET_GAIN_DMIC2_H,
+			RT715_SET_GAIN_DMIC2_L, RT715_DIR_IN_SFT, 3, 0,
+			rt715_set_amp_gain_get, rt715_set_amp_gain_put,
+			mic_vol_tlv),
+	SOC_DOUBLE_R_EXT_TLV("DMIC3 Boost", RT715_SET_GAIN_DMIC3_H,
+			RT715_SET_GAIN_DMIC3_L, RT715_DIR_IN_SFT, 3, 0,
+			rt715_set_amp_gain_get, rt715_set_amp_gain_put,
+			mic_vol_tlv),
+	SOC_DOUBLE_R_EXT_TLV("DMIC4 Boost", RT715_SET_GAIN_DMIC4_H,
+			RT715_SET_GAIN_DMIC4_L, RT715_DIR_IN_SFT, 3, 0,
+			rt715_set_amp_gain_get, rt715_set_amp_gain_put,
+			mic_vol_tlv),
+	SOC_DOUBLE_R_EXT_TLV("MIC1 Boost", RT715_SET_GAIN_MIC1_H,
+			RT715_SET_GAIN_MIC1_L, RT715_DIR_IN_SFT, 3, 0,
+			rt715_set_amp_gain_get, rt715_set_amp_gain_put,
+			mic_vol_tlv),
+	SOC_DOUBLE_R_EXT_TLV("MIC2 Boost", RT715_SET_GAIN_MIC2_H,
+			RT715_SET_GAIN_MIC2_L, RT715_DIR_IN_SFT, 3, 0,
+			rt715_set_amp_gain_get, rt715_set_amp_gain_put,
+			mic_vol_tlv),
+	SOC_DOUBLE_R_EXT_TLV("LINE1 Boost", RT715_SET_GAIN_LINE1_H,
+			RT715_SET_GAIN_LINE1_L, RT715_DIR_IN_SFT, 3, 0,
+			rt715_set_amp_gain_get, rt715_set_amp_gain_put,
+			mic_vol_tlv),
+	SOC_DOUBLE_R_EXT_TLV("LINE2 Boost", RT715_SET_GAIN_LINE2_H,
+			RT715_SET_GAIN_LINE2_L, RT715_DIR_IN_SFT, 3, 0,
+			rt715_set_amp_gain_get, rt715_set_amp_gain_put,
+			mic_vol_tlv),
+};
+
+static int rt715_mux_get(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_kcontrol_component(kcontrol);
+	struct rt715_priv *rt715 = snd_soc_component_get_drvdata(component);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int reg, val;
+	int ret;
+
+	/* nid = e->reg, vid = 0xf01 */
+	reg = RT715_VERB_SET_CONNECT_SEL | e->reg;
+	ret = regmap_read(rt715->regmap, reg, &val);
+	if (ret < 0) {
+		dev_err(component->dev, "%s: sdw read failed: %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+	/*
+	 * The first two indices of ADC Mux 24/25 are routed to the same
+	 * hardware source. ie, ADC Mux 24 0/1 will both connect to MIC2.
+	 * To have a unique set of inputs, we skip the index1 of the muxes.
+	 */
+	if ((e->reg == RT715_MUX_IN3 || e->reg == RT715_MUX_IN4) && (val > 0))
+		val -= 1;
+	ucontrol->value.enumerated.item[0] = val;
+
+	return 0;
+}
+
+static int rt715_mux_put(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_dapm_context *dapm =
+				snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct rt715_priv *rt715 = snd_soc_component_get_drvdata(component);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int *item = ucontrol->value.enumerated.item;
+	unsigned int val, val2 = 0, change, reg;
+	int ret;
+
+	if (item[0] >= e->items)
+		return -EINVAL;
+
+	/* Verb ID = 0x701h, nid = e->reg */
+	val = snd_soc_enum_item_to_val(e, item[0]) << e->shift_l;
+
+	reg = RT715_VERB_SET_CONNECT_SEL | e->reg;
+	ret = regmap_read(rt715->regmap, reg, &val2);
+	if (ret < 0) {
+		dev_err(component->dev, "%s: sdw read failed: %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+	if (val == val2)
+		change = 0;
+	else
+		change = 1;
+
+	if (change) {
+		reg = RT715_VERB_SET_CONNECT_SEL | e->reg;
+		regmap_write(rt715->regmap, reg, val);
+	}
+
+	snd_soc_dapm_mux_update_power(dapm, kcontrol,
+						item[0], e, NULL);
+
+	return change;
+}
+
+static const char * const adc_22_23_mux_text[] = {
+	"MIC1",
+	"MIC2",
+	"LINE1",
+	"LINE2",
+	"DMIC1",
+	"DMIC2",
+	"DMIC3",
+	"DMIC4",
+};
+
+/**
+ * Due to mux design for nid 24 (MUX_IN3)/25 (MUX_IN4), connection index 0 and
+ * 1 will be connected to the same dmic source, therefore we skip index 1 to
+ * avoid misunderstanding on usage of dapm routing.
+ */
+static const unsigned int rt715_adc_24_25_values[] = {
+	0,
+	2,
+	3,
+	4,
+	5,
+};
+
+static const char * const adc_24_mux_text[] = {
+	"MIC2",
+	"DMIC1",
+	"DMIC2",
+	"DMIC3",
+	"DMIC4",
+};
+
+static const char * const adc_25_mux_text[] = {
+	"MIC1",
+	"DMIC1",
+	"DMIC2",
+	"DMIC3",
+	"DMIC4",
+};
+
+static SOC_ENUM_SINGLE_DECL(
+	rt715_adc22_enum, RT715_MUX_IN1, 0, adc_22_23_mux_text);
+
+static SOC_ENUM_SINGLE_DECL(
+	rt715_adc23_enum, RT715_MUX_IN2, 0, adc_22_23_mux_text);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(rt715_adc24_enum,
+	RT715_MUX_IN3, 0, 0xf,
+	adc_24_mux_text, rt715_adc_24_25_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(rt715_adc25_enum,
+	RT715_MUX_IN4, 0, 0xf,
+	adc_25_mux_text, rt715_adc_24_25_values);
+
+static const struct snd_kcontrol_new rt715_adc22_mux =
+	SOC_DAPM_ENUM_EXT("ADC 22 Mux", rt715_adc22_enum,
+			rt715_mux_get, rt715_mux_put);
+
+static const struct snd_kcontrol_new rt715_adc23_mux =
+	SOC_DAPM_ENUM_EXT("ADC 23 Mux", rt715_adc23_enum,
+			rt715_mux_get, rt715_mux_put);
+
+static const struct snd_kcontrol_new rt715_adc24_mux =
+	SOC_DAPM_ENUM_EXT("ADC 24 Mux", rt715_adc24_enum,
+			rt715_mux_get, rt715_mux_put);
+
+static const struct snd_kcontrol_new rt715_adc25_mux =
+	SOC_DAPM_ENUM_EXT("ADC 25 Mux", rt715_adc25_enum,
+			rt715_mux_get, rt715_mux_put);
+
+static const struct snd_soc_dapm_widget rt715_dapm_widgets[] = {
+	SND_SOC_DAPM_INPUT("DMIC1"),
+	SND_SOC_DAPM_INPUT("DMIC2"),
+	SND_SOC_DAPM_INPUT("DMIC3"),
+	SND_SOC_DAPM_INPUT("DMIC4"),
+	SND_SOC_DAPM_INPUT("MIC1"),
+	SND_SOC_DAPM_INPUT("MIC2"),
+	SND_SOC_DAPM_INPUT("LINE1"),
+	SND_SOC_DAPM_INPUT("LINE2"),
+	SND_SOC_DAPM_ADC("ADC 07", NULL, RT715_SET_STREAMID_MIC_ADC, 4, 0),
+	SND_SOC_DAPM_ADC("ADC 08", NULL, RT715_SET_STREAMID_LINE_ADC, 4, 0),
+	SND_SOC_DAPM_ADC("ADC 09", NULL, RT715_SET_STREAMID_MIX_ADC, 4, 0),
+	SND_SOC_DAPM_ADC("ADC 27", NULL, RT715_SET_STREAMID_MIX_ADC2, 4, 0),
+	SND_SOC_DAPM_MUX("ADC 22 Mux", SND_SOC_NOPM, 0, 0,
+		&rt715_adc22_mux),
+	SND_SOC_DAPM_MUX("ADC 23 Mux", SND_SOC_NOPM, 0, 0,
+		&rt715_adc23_mux),
+	SND_SOC_DAPM_MUX("ADC 24 Mux", SND_SOC_NOPM, 0, 0,
+		&rt715_adc24_mux),
+	SND_SOC_DAPM_MUX("ADC 25 Mux", SND_SOC_NOPM, 0, 0,
+		&rt715_adc25_mux),
+	SND_SOC_DAPM_AIF_OUT("DP4TX", "DP4 Capture", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("DP6TX", "DP6 Capture", 0, SND_SOC_NOPM, 0, 0),
+};
+
+static const struct snd_soc_dapm_route rt715_audio_map[] = {
+	{"DP6TX", NULL, "ADC 09"},
+	{"DP6TX", NULL, "ADC 08"},
+	{"DP4TX", NULL, "ADC 07"},
+	{"DP4TX", NULL, "ADC 27"},
+	{"ADC 09", NULL, "ADC 22 Mux"},
+	{"ADC 08", NULL, "ADC 23 Mux"},
+	{"ADC 07", NULL, "ADC 24 Mux"},
+	{"ADC 27", NULL, "ADC 25 Mux"},
+	{"ADC 22 Mux", "MIC1", "MIC1"},
+	{"ADC 22 Mux", "MIC2", "MIC2"},
+	{"ADC 22 Mux", "LINE1", "LINE1"},
+	{"ADC 22 Mux", "LINE2", "LINE2"},
+	{"ADC 22 Mux", "DMIC1", "DMIC1"},
+	{"ADC 22 Mux", "DMIC2", "DMIC2"},
+	{"ADC 22 Mux", "DMIC3", "DMIC3"},
+	{"ADC 22 Mux", "DMIC4", "DMIC4"},
+	{"ADC 23 Mux", "MIC1", "MIC1"},
+	{"ADC 23 Mux", "MIC2", "MIC2"},
+	{"ADC 23 Mux", "LINE1", "LINE1"},
+	{"ADC 23 Mux", "LINE2", "LINE2"},
+	{"ADC 23 Mux", "DMIC1", "DMIC1"},
+	{"ADC 23 Mux", "DMIC2", "DMIC2"},
+	{"ADC 23 Mux", "DMIC3", "DMIC3"},
+	{"ADC 23 Mux", "DMIC4", "DMIC4"},
+	{"ADC 24 Mux", "MIC2", "MIC2"},
+	{"ADC 24 Mux", "DMIC1", "DMIC1"},
+	{"ADC 24 Mux", "DMIC2", "DMIC2"},
+	{"ADC 24 Mux", "DMIC3", "DMIC3"},
+	{"ADC 24 Mux", "DMIC4", "DMIC4"},
+	{"ADC 25 Mux", "MIC1", "MIC1"},
+	{"ADC 25 Mux", "DMIC1", "DMIC1"},
+	{"ADC 25 Mux", "DMIC2", "DMIC2"},
+	{"ADC 25 Mux", "DMIC3", "DMIC3"},
+	{"ADC 25 Mux", "DMIC4", "DMIC4"},
+};
+
+static int rt715_set_bias_level(struct snd_soc_component *component,
+				enum snd_soc_bias_level level)
+{
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
+	struct rt715_priv *rt715 = snd_soc_component_get_drvdata(component);
+
+	switch (level) {
+	case SND_SOC_BIAS_PREPARE:
+		if (dapm->bias_level == SND_SOC_BIAS_STANDBY) {
+			regmap_write(rt715->regmap,
+						RT715_SET_AUDIO_POWER_STATE,
+						AC_PWRST_D0);
+		}
+		break;
+
+	case SND_SOC_BIAS_STANDBY:
+		regmap_write(rt715->regmap,
+					RT715_SET_AUDIO_POWER_STATE,
+					AC_PWRST_D3);
+		break;
+
+	default:
+		break;
+	}
+	dapm->bias_level = level;
+	return 0;
+}
+
+static const struct snd_soc_component_driver soc_codec_dev_rt715 = {
+	.set_bias_level = rt715_set_bias_level,
+	.controls = rt715_snd_controls,
+	.num_controls = ARRAY_SIZE(rt715_snd_controls),
+	.dapm_widgets = rt715_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(rt715_dapm_widgets),
+	.dapm_routes = rt715_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(rt715_audio_map),
+};
+
+static int rt715_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
+				int direction)
+{
+
+	struct sdw_stream_data *stream;
+
+	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
+	if (!stream)
+		return -ENOMEM;
+
+	stream->sdw_stream = (struct sdw_stream_runtime *)sdw_stream;
+
+	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
+	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
+		dai->playback_dma_data = stream;
+	else
+		dai->capture_dma_data = stream;
+
+	return 0;
+}
+
+static void rt715_shutdown(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+
+{
+	struct sdw_stream_data *stream;
+
+	stream = snd_soc_dai_get_dma_data(dai, substream);
+	snd_soc_dai_set_dma_data(dai, substream, NULL);
+	kfree(stream);
+}
+
+static int rt715_pcm_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct rt715_priv *rt715 = snd_soc_component_get_drvdata(component);
+	struct sdw_stream_config stream_config;
+	struct sdw_port_config port_config;
+	enum sdw_data_direction direction;
+	struct sdw_stream_data *stream;
+	int retval, port, num_channels;
+	unsigned int val = 0;
+
+	stream = snd_soc_dai_get_dma_data(dai, substream);
+
+	if (!stream)
+		return -EINVAL;
+
+	if (!rt715->slave)
+		return -EINVAL;
+
+	switch (dai->id) {
+	case RT715_AIF1:
+		direction = SDW_DATA_DIR_TX;
+		port = 6;
+		rt715_index_write(rt715->regmap, RT715_SDW_INPUT_SEL, 0xa500);
+		break;
+	case RT715_AIF2:
+		direction = SDW_DATA_DIR_TX;
+		port = 4;
+		rt715_index_write(rt715->regmap, RT715_SDW_INPUT_SEL, 0xa000);
+		break;
+	default:
+		dev_err(component->dev, "Invalid DAI id %d\n", dai->id);
+		return -EINVAL;
+	}
+
+	stream_config.frame_rate =  params_rate(params);
+	stream_config.ch_count = params_channels(params);
+	stream_config.bps = snd_pcm_format_width(params_format(params));
+	stream_config.direction = direction;
+
+	num_channels = params_channels(params);
+	port_config.ch_mask = (1 << (num_channels)) - 1;
+	port_config.num = port;
+
+	retval = sdw_stream_add_slave(rt715->slave, &stream_config,
+					&port_config, 1, stream->sdw_stream);
+	if (retval) {
+		dev_err(dai->dev, "Unable to configure port\n");
+		return retval;
+	}
+
+	switch (params_rate(params)) {
+	/* bit 14 0:48K 1:44.1K */
+	/* bit 15 Stream Type 0:PCM 1:Non-PCM, should always be PCM */
+	case 44100:
+		val |= 0x40 << 8;
+		break;
+	case 48000:
+		val |= 0x0 << 8;
+		break;
+	default:
+		dev_err(component->dev, "Unsupported sample rate %d\n",
+			params_rate(params));
+		return -EINVAL;
+	}
+
+	if (params_channels(params) <= 16) {
+		/* bit 3:0 Number of Channel */
+		val |= (params_channels(params) - 1);
+	} else {
+		dev_err(component->dev, "Unsupported channels %d\n",
+			params_channels(params));
+		return -EINVAL;
+	}
+
+	switch (params_width(params)) {
+	/* bit 6:4 Bits per Sample */
+	case 8:
+		break;
+	case 16:
+		val |= (0x1 << 4);
+		break;
+	case 20:
+		val |= (0x2 << 4);
+		break;
+	case 24:
+		val |= (0x3 << 4);
+		break;
+	case 32:
+		val |= (0x4 << 4);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_write(rt715->regmap, RT715_MIC_ADC_FORMAT_H, val);
+	regmap_write(rt715->regmap, RT715_MIC_LINE_FORMAT_H, val);
+	regmap_write(rt715->regmap, RT715_MIX_ADC_FORMAT_H, val);
+	regmap_write(rt715->regmap, RT715_MIX_ADC2_FORMAT_H, val);
+
+	return retval;
+}
+
+static int rt715_pcm_hw_free(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct rt715_priv *rt715 = snd_soc_component_get_drvdata(component);
+	struct sdw_stream_data *stream =
+		snd_soc_dai_get_dma_data(dai, substream);
+
+	if (!rt715->slave)
+		return -EINVAL;
+
+	sdw_stream_remove_slave(rt715->slave, stream->sdw_stream);
+	return 0;
+}
+
+#define RT715_STEREO_RATES (SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000)
+#define RT715_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
+			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
+
+static struct snd_soc_dai_ops rt715_ops = {
+	.hw_params	= rt715_pcm_hw_params,
+	.hw_free	= rt715_pcm_hw_free,
+	.set_sdw_stream	= rt715_set_sdw_stream,
+	.shutdown	= rt715_shutdown,
+};
+
+static struct snd_soc_dai_driver rt715_dai[] = {
+	{
+		.name = "rt715-aif1",
+		.id = RT715_AIF1,
+		.capture = {
+			.stream_name = "DP6 Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = RT715_STEREO_RATES,
+			.formats = RT715_FORMATS,
+		},
+		.ops = &rt715_ops,
+	},
+	{
+		.name = "rt715-aif2",
+		.id = RT715_AIF2,
+		.capture = {
+			.stream_name = "DP4 Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = RT715_STEREO_RATES,
+			.formats = RT715_FORMATS,
+		},
+		.ops = &rt715_ops,
+	},
+};
+
+/* Bus clock frequency */
+#define RT715_CLK_FREQ_9600000HZ 9600000
+#define RT715_CLK_FREQ_12000000HZ 12000000
+#define RT715_CLK_FREQ_6000000HZ 6000000
+#define RT715_CLK_FREQ_4800000HZ 4800000
+#define RT715_CLK_FREQ_2400000HZ 2400000
+#define RT715_CLK_FREQ_12288000HZ 12288000
+
+int rt715_clock_config(struct device *dev)
+{
+	struct rt715_priv *rt715 = dev_get_drvdata(dev);
+	unsigned int clk_freq, value;
+
+	clk_freq = (rt715->params.curr_dr_freq >> 1);
+
+	switch (clk_freq) {
+	case RT715_CLK_FREQ_12000000HZ:
+		value = 0x0;
+		break;
+	case RT715_CLK_FREQ_6000000HZ:
+		value = 0x1;
+		break;
+	case RT715_CLK_FREQ_9600000HZ:
+		value = 0x2;
+		break;
+	case RT715_CLK_FREQ_4800000HZ:
+		value = 0x3;
+		break;
+	case RT715_CLK_FREQ_2400000HZ:
+		value = 0x4;
+		break;
+	case RT715_CLK_FREQ_12288000HZ:
+		value = 0x5;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_write(rt715->regmap, 0xe0, value);
+	regmap_write(rt715->regmap, 0xf0, value);
+
+	return 0;
+}
+
+int rt715_init(struct device *dev, struct regmap *sdw_regmap,
+	struct regmap *regmap, struct sdw_slave *slave)
+{
+	struct rt715_priv *rt715;
+	int ret;
+
+	rt715 = devm_kzalloc(dev, sizeof(*rt715), GFP_KERNEL);
+	if (!rt715)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, rt715);
+	rt715->slave = slave;
+	rt715->regmap = regmap;
+	rt715->sdw_regmap = sdw_regmap;
+
+	/*
+	 * Mark hw_init to false
+	 * HW init will be performed when device reports present
+	 */
+	rt715->hw_init = false;
+	rt715->first_hw_init = false;
+
+	ret = devm_snd_soc_register_component(dev,
+						&soc_codec_dev_rt715,
+						rt715_dai,
+						ARRAY_SIZE(rt715_dai));
+
+	return ret;
+}
+
+int rt715_io_init(struct device *dev, struct sdw_slave *slave)
+{
+	struct rt715_priv *rt715 = dev_get_drvdata(dev);
+
+	if (rt715->hw_init)
+		return 0;
+
+	/*
+	 * PM runtime is only enabled when a Slave reports as Attached
+	 */
+	if (!rt715->first_hw_init) {
+		/* set autosuspend parameters */
+		pm_runtime_set_autosuspend_delay(&slave->dev, 3000);
+		pm_runtime_use_autosuspend(&slave->dev);
+
+		/* update count of parent 'active' children */
+		pm_runtime_set_active(&slave->dev);
+
+		/* make sure the device does not suspend immediately */
+		pm_runtime_mark_last_busy(&slave->dev);
+
+		pm_runtime_enable(&slave->dev);
+	}
+
+	pm_runtime_get_noresume(&slave->dev);
+
+	/* Mute nid=08h/09h */
+	regmap_write(rt715->regmap, RT715_SET_GAIN_LINE_ADC_H, 0xb080);
+	regmap_write(rt715->regmap, RT715_SET_GAIN_MIX_ADC_H, 0xb080);
+	/* Mute nid=07h/27h */
+	regmap_write(rt715->regmap, RT715_SET_GAIN_MIC_ADC_H, 0xb080);
+	regmap_write(rt715->regmap, RT715_SET_GAIN_MIX_ADC2_H, 0xb080);
+
+	/* Set Pin Widget */
+	regmap_write(rt715->regmap, RT715_SET_PIN_DMIC1, 0x20);
+	regmap_write(rt715->regmap, RT715_SET_PIN_DMIC2, 0x20);
+	regmap_write(rt715->regmap, RT715_SET_PIN_DMIC3, 0x20);
+	regmap_write(rt715->regmap, RT715_SET_PIN_DMIC4, 0x20);
+	/* Set Converter Stream */
+	regmap_write(rt715->regmap, RT715_SET_STREAMID_LINE_ADC, 0x10);
+	regmap_write(rt715->regmap, RT715_SET_STREAMID_MIX_ADC, 0x10);
+	regmap_write(rt715->regmap, RT715_SET_STREAMID_MIC_ADC, 0x10);
+	regmap_write(rt715->regmap, RT715_SET_STREAMID_MIX_ADC2, 0x10);
+	/* Set Configuration Default */
+	regmap_write(rt715->regmap, RT715_SET_DMIC1_CONFIG_DEFAULT1, 0xd0);
+	regmap_write(rt715->regmap, RT715_SET_DMIC1_CONFIG_DEFAULT2, 0x11);
+	regmap_write(rt715->regmap, RT715_SET_DMIC1_CONFIG_DEFAULT3, 0xa1);
+	regmap_write(rt715->regmap, RT715_SET_DMIC1_CONFIG_DEFAULT4, 0x81);
+	regmap_write(rt715->regmap, RT715_SET_DMIC2_CONFIG_DEFAULT1, 0xd1);
+	regmap_write(rt715->regmap, RT715_SET_DMIC2_CONFIG_DEFAULT2, 0x11);
+	regmap_write(rt715->regmap, RT715_SET_DMIC2_CONFIG_DEFAULT3, 0xa1);
+	regmap_write(rt715->regmap, RT715_SET_DMIC2_CONFIG_DEFAULT4, 0x81);
+	regmap_write(rt715->regmap, RT715_SET_DMIC3_CONFIG_DEFAULT1, 0xd0);
+	regmap_write(rt715->regmap, RT715_SET_DMIC3_CONFIG_DEFAULT2, 0x11);
+	regmap_write(rt715->regmap, RT715_SET_DMIC3_CONFIG_DEFAULT3, 0xa1);
+	regmap_write(rt715->regmap, RT715_SET_DMIC3_CONFIG_DEFAULT4, 0x81);
+	regmap_write(rt715->regmap, RT715_SET_DMIC4_CONFIG_DEFAULT1, 0xd1);
+	regmap_write(rt715->regmap, RT715_SET_DMIC4_CONFIG_DEFAULT2, 0x11);
+	regmap_write(rt715->regmap, RT715_SET_DMIC4_CONFIG_DEFAULT3, 0xa1);
+	regmap_write(rt715->regmap, RT715_SET_DMIC4_CONFIG_DEFAULT4, 0x81);
+
+	/* Finish Initial Settings, set power to D3 */
+	regmap_write(rt715->regmap, RT715_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
+
+	if (rt715->first_hw_init)
+		regcache_mark_dirty(rt715->regmap);
+	else
+		rt715->first_hw_init = true;
+
+	/* Mark Slave initialization complete */
+	rt715->hw_init = true;
+
+	pm_runtime_mark_last_busy(&slave->dev);
+	pm_runtime_put_autosuspend(&slave->dev);
+
+	return 0;
+}
+
+MODULE_DESCRIPTION("ASoC rt715 driver");
+MODULE_DESCRIPTION("ASoC rt715 driver SDW");
+MODULE_AUTHOR("Jack Yu <jack.yu@realtek.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/rt715.h b/sound/soc/codecs/rt715.h
new file mode 100644
index 000000000000..df0f24f9bc0c
--- /dev/null
+++ b/sound/soc/codecs/rt715.h
@@ -0,0 +1,221 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * rt715.h -- RT715 ALSA SoC audio driver header
+ *
+ * Copyright(c) 2019 Realtek Semiconductor Corp.
+ */
+
+#ifndef __RT715_H__
+#define __RT715_H__
+
+#include <linux/regulator/consumer.h>
+
+struct rt715_priv {
+	struct regmap *regmap;
+	struct regmap *sdw_regmap;
+	struct snd_soc_codec *codec;
+	struct sdw_slave *slave;
+	int dbg_nid;
+	int dbg_vid;
+	int dbg_payload;
+	enum sdw_slave_status status;
+	struct sdw_bus_params params;
+	bool hw_init;
+	bool first_hw_init;
+};
+
+struct sdw_stream_data {
+	struct sdw_stream_runtime *sdw_stream;
+};
+
+/* NID */
+#define RT715_AUDIO_FUNCTION_GROUP			0x01
+#define RT715_MIC_ADC					0x07
+#define RT715_LINE_ADC					0x08
+#define RT715_MIX_ADC					0x09
+#define RT715_DMIC1					0x12
+#define RT715_DMIC2					0x13
+#define RT715_MIC1					0x18
+#define RT715_MIC2					0x19
+#define RT715_LINE1					0x1a
+#define RT715_LINE2					0x1b
+#define RT715_DMIC3					0x1d
+#define RT715_DMIC4					0x29
+#define RT715_VENDOR_REGISTERS				0x20
+#define RT715_MUX_IN1					0x22
+#define RT715_MUX_IN2					0x23
+#define RT715_MUX_IN3					0x24
+#define RT715_MUX_IN4					0x25
+#define RT715_MIX_ADC2					0x27
+#define RT715_INLINE_CMD				0x55
+
+/* Index (NID:20h) */
+#define RT715_SDW_INPUT_SEL				0x39
+#define RT715_EXT_DMIC_CLK_CTRL2			0x54
+
+/* Verb */
+#define RT715_VERB_SET_CONNECT_SEL			0x3100
+#define RT715_VERB_GET_CONNECT_SEL			0xb100
+#define RT715_VERB_SET_EAPD_BTLENABLE			0x3c00
+#define RT715_VERB_SET_POWER_STATE			0x3500
+#define RT715_VERB_SET_CHANNEL_STREAMID			0x3600
+#define RT715_VERB_SET_PIN_WIDGET_CONTROL		0x3700
+#define RT715_VERB_SET_CONFIG_DEFAULT1			0x4c00
+#define RT715_VERB_SET_CONFIG_DEFAULT2			0x4d00
+#define RT715_VERB_SET_CONFIG_DEFAULT3			0x4e00
+#define RT715_VERB_SET_CONFIG_DEFAULT4			0x4f00
+#define RT715_VERB_SET_UNSOLICITED_ENABLE		0x3800
+#define RT715_SET_AMP_GAIN_MUTE_H			0x7300
+#define RT715_SET_AMP_GAIN_MUTE_L			0x8380
+#define RT715_READ_HDA_3				0x2012
+#define RT715_READ_HDA_2				0x2013
+#define RT715_READ_HDA_1				0x2014
+#define RT715_READ_HDA_0				0x2015
+#define RT715_PRIV_INDEX_W_H				0x7520
+#define RT715_PRIV_INDEX_W_L				0x85a0
+#define RT715_PRIV_DATA_W_H				0x7420
+#define RT715_PRIV_DATA_W_L				0x84a0
+#define RT715_PRIV_INDEX_R_H				0x9d20
+#define RT715_PRIV_INDEX_R_L				0xada0
+#define RT715_PRIV_DATA_R_H				0x9c20
+#define RT715_PRIV_DATA_R_L				0xaca0
+#define RT715_MIC_ADC_FORMAT_H				0x7207
+#define RT715_MIC_ADC_FORMAT_L				0x8287
+#define RT715_MIC_LINE_FORMAT_H				0x7208
+#define RT715_MIC_LINE_FORMAT_L				0x8288
+#define RT715_MIX_ADC_FORMAT_H				0x7209
+#define RT715_MIX_ADC_FORMAT_L				0x8289
+#define RT715_MIX_ADC2_FORMAT_H				0x7227
+#define RT715_MIX_ADC2_FORMAT_L				0x82a7
+#define RT715_FUNC_RESET				0xff01
+
+#define RT715_SET_AUDIO_POWER_STATE\
+	(RT715_VERB_SET_POWER_STATE | RT715_AUDIO_FUNCTION_GROUP)
+#define RT715_SET_PIN_DMIC1\
+	(RT715_VERB_SET_PIN_WIDGET_CONTROL | RT715_DMIC1)
+#define RT715_SET_PIN_DMIC2\
+	(RT715_VERB_SET_PIN_WIDGET_CONTROL | RT715_DMIC2)
+#define RT715_SET_PIN_DMIC3\
+	(RT715_VERB_SET_PIN_WIDGET_CONTROL | RT715_DMIC3)
+#define RT715_SET_PIN_DMIC4\
+	(RT715_VERB_SET_PIN_WIDGET_CONTROL | RT715_DMIC4)
+#define RT715_SET_PIN_MIC1\
+	(RT715_VERB_SET_PIN_WIDGET_CONTROL | RT715_MIC1)
+#define RT715_SET_PIN_MIC2\
+	(RT715_VERB_SET_PIN_WIDGET_CONTROL | RT715_MIC2)
+#define RT715_SET_PIN_LINE1\
+	(RT715_VERB_SET_PIN_WIDGET_CONTROL | RT715_LINE1)
+#define RT715_SET_PIN_LINE2\
+	(RT715_VERB_SET_PIN_WIDGET_CONTROL | RT715_LINE2)
+#define RT715_SET_MIC1_UNSOLICITED_ENABLE\
+	(RT715_VERB_SET_UNSOLICITED_ENABLE | RT715_MIC1)
+#define RT715_SET_MIC2_UNSOLICITED_ENABLE\
+	(RT715_VERB_SET_UNSOLICITED_ENABLE | RT715_MIC2)
+#define RT715_SET_STREAMID_MIC_ADC\
+	(RT715_VERB_SET_CHANNEL_STREAMID | RT715_MIC_ADC)
+#define RT715_SET_STREAMID_LINE_ADC\
+	(RT715_VERB_SET_CHANNEL_STREAMID | RT715_LINE_ADC)
+#define RT715_SET_STREAMID_MIX_ADC\
+	(RT715_VERB_SET_CHANNEL_STREAMID | RT715_MIX_ADC)
+#define RT715_SET_STREAMID_MIX_ADC2\
+	(RT715_VERB_SET_CHANNEL_STREAMID | RT715_MIX_ADC2)
+#define RT715_SET_GAIN_MIC_ADC_L\
+	(RT715_SET_AMP_GAIN_MUTE_L | RT715_MIC_ADC)
+#define RT715_SET_GAIN_MIC_ADC_H\
+	(RT715_SET_AMP_GAIN_MUTE_H | RT715_MIC_ADC)
+#define RT715_SET_GAIN_LINE_ADC_L\
+	(RT715_SET_AMP_GAIN_MUTE_L | RT715_LINE_ADC)
+#define RT715_SET_GAIN_LINE_ADC_H\
+	(RT715_SET_AMP_GAIN_MUTE_H | RT715_LINE_ADC)
+#define RT715_SET_GAIN_MIX_ADC_L\
+	(RT715_SET_AMP_GAIN_MUTE_L | RT715_MIX_ADC)
+#define RT715_SET_GAIN_MIX_ADC_H\
+	(RT715_SET_AMP_GAIN_MUTE_H | RT715_MIX_ADC)
+#define RT715_SET_GAIN_MIX_ADC2_L\
+	(RT715_SET_AMP_GAIN_MUTE_L | RT715_MIX_ADC2)
+#define RT715_SET_GAIN_MIX_ADC2_H\
+	(RT715_SET_AMP_GAIN_MUTE_H | RT715_MIX_ADC2)
+#define RT715_SET_GAIN_DMIC1_L\
+	(RT715_SET_AMP_GAIN_MUTE_L | RT715_DMIC1)
+#define RT715_SET_GAIN_DMIC1_H\
+	(RT715_SET_AMP_GAIN_MUTE_H | RT715_DMIC1)
+#define RT715_SET_GAIN_DMIC2_L\
+	(RT715_SET_AMP_GAIN_MUTE_L | RT715_DMIC2)
+#define RT715_SET_GAIN_DMIC2_H\
+	(RT715_SET_AMP_GAIN_MUTE_H | RT715_DMIC2)
+#define RT715_SET_GAIN_DMIC3_L\
+	(RT715_SET_AMP_GAIN_MUTE_L | RT715_DMIC3)
+#define RT715_SET_GAIN_DMIC3_H\
+	(RT715_SET_AMP_GAIN_MUTE_H | RT715_DMIC3)
+#define RT715_SET_GAIN_DMIC4_L\
+	(RT715_SET_AMP_GAIN_MUTE_L | RT715_DMIC4)
+#define RT715_SET_GAIN_DMIC4_H\
+	(RT715_SET_AMP_GAIN_MUTE_H | RT715_DMIC4)
+#define RT715_SET_GAIN_MIC1_L\
+	(RT715_SET_AMP_GAIN_MUTE_L | RT715_MIC1)
+#define RT715_SET_GAIN_MIC1_H\
+	(RT715_SET_AMP_GAIN_MUTE_H | RT715_MIC1)
+#define RT715_SET_GAIN_MIC2_L\
+	(RT715_SET_AMP_GAIN_MUTE_L | RT715_MIC2)
+#define RT715_SET_GAIN_MIC2_H\
+	(RT715_SET_AMP_GAIN_MUTE_H | RT715_MIC2)
+#define RT715_SET_GAIN_LINE1_L\
+	(RT715_SET_AMP_GAIN_MUTE_L | RT715_LINE1)
+#define RT715_SET_GAIN_LINE1_H\
+	(RT715_SET_AMP_GAIN_MUTE_H | RT715_LINE1)
+#define RT715_SET_GAIN_LINE2_L\
+	(RT715_SET_AMP_GAIN_MUTE_L | RT715_LINE2)
+#define RT715_SET_GAIN_LINE2_H\
+	(RT715_SET_AMP_GAIN_MUTE_H | RT715_LINE2)
+#define RT715_SET_DMIC1_CONFIG_DEFAULT1\
+	(RT715_VERB_SET_CONFIG_DEFAULT1 | RT715_DMIC1)
+#define RT715_SET_DMIC2_CONFIG_DEFAULT1\
+	(RT715_VERB_SET_CONFIG_DEFAULT1 | RT715_DMIC2)
+#define RT715_SET_DMIC1_CONFIG_DEFAULT2\
+	(RT715_VERB_SET_CONFIG_DEFAULT2 | RT715_DMIC1)
+#define RT715_SET_DMIC2_CONFIG_DEFAULT2\
+	(RT715_VERB_SET_CONFIG_DEFAULT2 | RT715_DMIC2)
+#define RT715_SET_DMIC1_CONFIG_DEFAULT3\
+	(RT715_VERB_SET_CONFIG_DEFAULT3 | RT715_DMIC1)
+#define RT715_SET_DMIC2_CONFIG_DEFAULT3\
+	(RT715_VERB_SET_CONFIG_DEFAULT3 | RT715_DMIC2)
+#define RT715_SET_DMIC1_CONFIG_DEFAULT4\
+	(RT715_VERB_SET_CONFIG_DEFAULT4 | RT715_DMIC1)
+#define RT715_SET_DMIC2_CONFIG_DEFAULT4\
+	(RT715_VERB_SET_CONFIG_DEFAULT4 | RT715_DMIC2)
+#define RT715_SET_DMIC3_CONFIG_DEFAULT1\
+	(RT715_VERB_SET_CONFIG_DEFAULT1 | RT715_DMIC3)
+#define RT715_SET_DMIC4_CONFIG_DEFAULT1\
+	(RT715_VERB_SET_CONFIG_DEFAULT1 | RT715_DMIC4)
+#define RT715_SET_DMIC3_CONFIG_DEFAULT2\
+	(RT715_VERB_SET_CONFIG_DEFAULT2 | RT715_DMIC3)
+#define RT715_SET_DMIC4_CONFIG_DEFAULT2\
+	(RT715_VERB_SET_CONFIG_DEFAULT2 | RT715_DMIC4)
+#define RT715_SET_DMIC3_CONFIG_DEFAULT3\
+	(RT715_VERB_SET_CONFIG_DEFAULT3 | RT715_DMIC3)
+#define RT715_SET_DMIC4_CONFIG_DEFAULT3\
+	(RT715_VERB_SET_CONFIG_DEFAULT3 | RT715_DMIC4)
+#define RT715_SET_DMIC3_CONFIG_DEFAULT4\
+	(RT715_VERB_SET_CONFIG_DEFAULT4 | RT715_DMIC3)
+#define RT715_SET_DMIC4_CONFIG_DEFAULT4\
+	(RT715_VERB_SET_CONFIG_DEFAULT4 | RT715_DMIC4)
+
+#define RT715_MUTE_SFT					7
+#define RT715_DIR_IN_SFT				6
+#define RT715_DIR_OUT_SFT				7
+
+enum {
+	RT715_AIF1,
+	RT715_AIF2,
+	RT715_AIFS,
+};
+
+int rt715_io_init(struct device *dev, struct sdw_slave *slave);
+int rt715_init(struct device *dev, struct regmap *sdw_regmap,
+	struct regmap *regmap, struct sdw_slave *slave);
+
+int hda_to_sdw(unsigned int nid, unsigned int verb, unsigned int payload,
+	       unsigned int *sdw_addr_h, unsigned int *sdw_data_h,
+	       unsigned int *sdw_addr_l, unsigned int *sdw_data_l);
+int rt715_clock_config(struct device *dev);
+#endif /* __RT715_H__ */
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
