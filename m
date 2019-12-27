Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A3F12B184
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Dec 2019 06:47:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D0FF1710;
	Fri, 27 Dec 2019 06:46:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D0FF1710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577425637;
	bh=pB9oeRfBuDYS8QHztDdX7Tv4EhJPafWlqHXqDiZQFWU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ULLcaaN8jmbSF05WpPez+Jiin6R2XfCgy7NNLKkerfPFUnLsegEIvFzcFCSMiWPtT
	 HRiYOV4vo2MuuIEE02XzQxo4unui3yunsKlJOCC3hOIyBGkG4RmxwDv7hS+TsFwYSj
	 VghnWy7jq+rOnFo6Ch2/ek0hYgz92QAogG31BPgg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4B52F800CD;
	Fri, 27 Dec 2019 06:45:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFD5AF80132; Fri, 27 Dec 2019 06:45:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3ACEF800AE
 for <alsa-devel@alsa-project.org>; Fri, 27 Dec 2019 06:45:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3ACEF800AE
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID xBR5jAwR031413,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCASV01.realtek.com.tw[172.21.6.18])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id xBR5jAwR031413
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 27 Dec 2019 13:45:11 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTITCASV01.realtek.com.tw (172.21.6.18) with Microsoft SMTP Server id
 14.3.468.0; Fri, 27 Dec 2019 13:45:09 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Fri, 27 Dec 2019 13:44:45 +0800
Message-ID: <20191227054445.27223-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Originating-IP: [172.22.102.1]
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, bard.liao@intel.com,
 Shuming Fan <shumingf@realtek.com>, flove@realtek.com,
 pierre-louis.bossart@intel.com
Subject: [alsa-devel] [PATCH] ASoC: rt711: add rt711 codec driver
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

From: Shuming Fan <shumingf@realtek.com>

This is the initial codec driver for rt711.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/Kconfig     |   10 +
 sound/soc/codecs/Makefile    |    2 +
 sound/soc/codecs/rt711-sdw.c |  552 +++++++++++++++
 sound/soc/codecs/rt711-sdw.h |  281 ++++++++
 sound/soc/codecs/rt711.c     | 1293 ++++++++++++++++++++++++++++++++++
 sound/soc/codecs/rt711.h     |  227 ++++++
 6 files changed, 2365 insertions(+)
 create mode 100644 sound/soc/codecs/rt711-sdw.c
 create mode 100644 sound/soc/codecs/rt711-sdw.h
 create mode 100644 sound/soc/codecs/rt711.c
 create mode 100644 sound/soc/codecs/rt711.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 146682049007..f58c6d35e47a 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -165,6 +165,7 @@ config SND_SOC_ALL_CODECS
 	select SND_SOC_RT5670 if I2C
 	select SND_SOC_RT5677 if I2C && SPI_MASTER
 	select SND_SOC_RT5682 if I2C
+	select SND_SOC_RT711_SDW if SOUNDWIRE
 	select SND_SOC_SGTL5000 if I2C
 	select SND_SOC_SI476X if MFD_SI476X_CORE
 	select SND_SOC_SIMPLE_AMPLIFIER
@@ -1058,6 +1059,15 @@ config SND_SOC_RT5677_SPI
 config SND_SOC_RT5682
 	tristate
 
+config SND_SOC_RT711
+	tristate
+
+config SND_SOC_RT711_SDW
+	tristate "Realtek RT711 Codec - SDW"
+	depends on SOUNDWIRE
+	select SND_SOC_RT711
+	select REGMAP_SOUNDWIRE
+
 #Freescale sgtl5000 codec
 config SND_SOC_SGTL5000
 	tristate "Freescale SGTL5000 CODEC"
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 0290fb389835..3fb6d0c04f5d 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -173,6 +173,7 @@ snd-soc-rt5670-objs := rt5670.o
 snd-soc-rt5677-objs := rt5677.o
 snd-soc-rt5677-spi-objs := rt5677-spi.o
 snd-soc-rt5682-objs := rt5682.o
+snd-soc-rt711-objs := rt711.o rt711-sdw.o
 snd-soc-sgtl5000-objs := sgtl5000.o
 snd-soc-alc5623-objs := alc5623.o
 snd-soc-alc5632-objs := alc5632.o
@@ -464,6 +465,7 @@ obj-$(CONFIG_SND_SOC_RT5670)	+= snd-soc-rt5670.o
 obj-$(CONFIG_SND_SOC_RT5677)	+= snd-soc-rt5677.o
 obj-$(CONFIG_SND_SOC_RT5677_SPI)	+= snd-soc-rt5677-spi.o
 obj-$(CONFIG_SND_SOC_RT5682)	+= snd-soc-rt5682.o
+obj-$(CONFIG_SND_SOC_RT711)     += snd-soc-rt711.o
 obj-$(CONFIG_SND_SOC_SGTL5000)  += snd-soc-sgtl5000.o
 obj-$(CONFIG_SND_SOC_SIGMADSP)	+= snd-soc-sigmadsp.o
 obj-$(CONFIG_SND_SOC_SIGMADSP_I2C)	+= snd-soc-sigmadsp-i2c.o
diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
new file mode 100644
index 000000000000..e28dc84ede5b
--- /dev/null
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -0,0 +1,552 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// rt711-sdw.c -- rt711 ALSA SoC audio driver
+//
+// Copyright(c) 2019 Realtek Semiconductor Corp.
+//
+//
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+#include "rt711.h"
+#include "rt711-sdw.h"
+
+static bool rt711_readable_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case 0x00e0:
+	case 0x00f0:
+	case 0x2012 ... 0x2016:
+	case 0x201a ... 0x2027:
+	case 0x2029 ... 0x202a:
+	case 0x202d ... 0x2034:
+	case 0x2201 ... 0x2204:
+	case 0x2206 ... 0x2212:
+	case 0x2220 ... 0x2223:
+	case 0x2230 ... 0x2239:
+	case 0x2f01 ... 0x2f0f:
+	case 0x3000 ... 0x3fff:
+	case 0x7000 ... 0x7fff:
+	case 0x8300 ... 0x83ff:
+	case 0x9c00 ... 0x9cff:
+	case 0xb900 ... 0xb9ff:
+	case 0x752009:
+	case 0x752011:
+	case 0x75201a:
+	case 0x752045:
+	case 0x752046:
+	case 0x752048:
+	case 0x75204a:
+	case 0x75206b:
+	case 0x75206f:
+	case 0x752080:
+	case 0x752081:
+	case 0x752091:
+	case 0x755800:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool rt711_volatile_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case 0x2016:
+	case 0x201b:
+	case 0x201c:
+	case 0x201d:
+	case 0x201f:
+	case 0x2021:
+	case 0x2023:
+	case 0x2230:
+	case 0x2012 ... 0x2015: /* HD-A read */
+	case 0x202d ... 0x202f: /* BRA */
+	case 0x2201 ... 0x2212: /* i2c debug */
+	case 0x2220 ... 0x2223: /* decoded HD-A */
+	case 0x9c00 ... 0x9cff:
+	case 0xb900 ... 0xb9ff:
+	case 0xff01:
+	case 0x75201a:
+	case 0x752046:
+	case 0x752080:
+	case 0x752081:
+	case 0x755800:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static int rt711_sdw_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct device *dev = context;
+	struct rt711_priv *rt711 = dev_get_drvdata(dev);
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
+		ret = regmap_write(rt711->sdw_regmap, reg, 0);
+		if (ret < 0)
+			return ret;
+		reg2 = reg + 0x1000;
+		reg2 |= 0x80;
+		ret = regmap_write(rt711->sdw_regmap, reg2, val2);
+		if (ret < 0)
+			return ret;
+
+		reg3 = RT711_PRIV_DATA_R_H | nid;
+		ret = regmap_write(rt711->sdw_regmap,
+			reg3, ((*val >> 8) & 0xff));
+		if (ret < 0)
+			return ret;
+		reg4 = reg3 + 0x1000;
+		reg4 |= 0x80;
+		ret = regmap_write(rt711->sdw_regmap, reg4, (*val & 0xff));
+		if (ret < 0)
+			return ret;
+	} else if (mask   == 0x3000) {
+		reg += 0x8000;
+		ret = regmap_write(rt711->sdw_regmap, reg, *val);
+		if (ret < 0)
+			return ret;
+	} else if (mask == 0x7000) {
+		reg += 0x2000;
+		reg |= 0x800;
+		ret = regmap_write(rt711->sdw_regmap,
+			reg, ((*val >> 8) & 0xff));
+		if (ret < 0)
+			return ret;
+		reg2 = reg + 0x1000;
+		reg2 |= 0x80;
+		ret = regmap_write(rt711->sdw_regmap, reg2, (*val & 0xff));
+		if (ret < 0)
+			return ret;
+	} else if ((reg & 0xff00) == 0x8300) { /* for R channel */
+		reg2 = reg - 0x1000;
+		reg2 &= ~0x80;
+		ret = regmap_write(rt711->sdw_regmap,
+			reg2, ((*val >> 8) & 0xff));
+		if (ret < 0)
+			return ret;
+		ret = regmap_write(rt711->sdw_regmap, reg, (*val & 0xff));
+		if (ret < 0)
+			return ret;
+	} else if (mask == 0x9000) {
+		ret = regmap_write(rt711->sdw_regmap,
+			reg, ((*val >> 8) & 0xff));
+		if (ret < 0)
+			return ret;
+		reg2 = reg + 0x1000;
+		reg2 |= 0x80;
+		ret = regmap_write(rt711->sdw_regmap, reg2, (*val & 0xff));
+		if (ret < 0)
+			return ret;
+	} else if (mask == 0xb000) {
+		ret = regmap_write(rt711->sdw_regmap, reg, *val);
+		if (ret < 0)
+			return ret;
+	} else {
+		ret = regmap_read(rt711->sdw_regmap, reg, val);
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
+		ret = regmap_read(rt711->sdw_regmap,
+			RT711_READ_HDA_3, &sdw_data_3);
+		if (ret < 0)
+			return ret;
+		ret = regmap_read(rt711->sdw_regmap,
+			RT711_READ_HDA_2, &sdw_data_2);
+		if (ret < 0)
+			return ret;
+		ret = regmap_read(rt711->sdw_regmap,
+			RT711_READ_HDA_1, &sdw_data_1);
+		if (ret < 0)
+			return ret;
+		ret = regmap_read(rt711->sdw_regmap,
+			RT711_READ_HDA_0, &sdw_data_0);
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
+		dev_dbg(dev, "[%s] %04x %04x %04x %04x => %08x\n",
+			__func__, reg, reg2, reg3, reg4, *val);
+	else
+		dev_dbg(dev, "[%s] %04x %04x => %08x\n",
+			__func__, reg, reg2, *val);
+
+	return 0;
+}
+
+static int rt711_sdw_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct device *dev = context;
+	struct rt711_priv *rt711 = dev_get_drvdata(dev);
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
+		ret = regmap_write(rt711->sdw_regmap, reg, 0);
+		if (ret < 0)
+			return ret;
+		reg2 = reg + 0x1000;
+		reg2 |= 0x80;
+		ret = regmap_write(rt711->sdw_regmap, reg2, val2);
+		if (ret < 0)
+			return ret;
+
+		reg3 = RT711_PRIV_DATA_W_H | nid;
+		ret = regmap_write(rt711->sdw_regmap,
+			reg3, ((val >> 8) & 0xff));
+		if (ret < 0)
+			return ret;
+		reg4 = reg3 + 0x1000;
+		reg4 |= 0x80;
+		ret = regmap_write(rt711->sdw_regmap, reg4, (val & 0xff));
+		if (ret < 0)
+			return ret;
+		is_index_reg = 1;
+	} else if (reg < 0x4fff) {
+		ret = regmap_write(rt711->sdw_regmap, reg, val);
+		if (ret < 0)
+			return ret;
+	} else if (reg == RT711_FUNC_RESET) {
+		ret = regmap_write(rt711->sdw_regmap, reg, val);
+		if (ret < 0)
+			return ret;
+	} else if (mask == 0x7000) {
+		ret = regmap_write(rt711->sdw_regmap,
+			reg, ((val >> 8) & 0xff));
+		if (ret < 0)
+			return ret;
+		reg2 = reg + 0x1000;
+		reg2 |= 0x80;
+		ret = regmap_write(rt711->sdw_regmap, reg2, (val & 0xff));
+		if (ret < 0)
+			return ret;
+	} else if ((reg & 0xff00) == 0x8300) {  /* for R channel */
+		reg2 = reg - 0x1000;
+		reg2 &= ~0x80;
+		ret = regmap_write(rt711->sdw_regmap,
+			reg2, ((val >> 8) & 0xff));
+		if (ret < 0)
+			return ret;
+		ret = regmap_write(rt711->sdw_regmap, reg, (val & 0xff));
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
+			__func__, reg, reg2, val);
+
+	return 0;
+}
+
+static const struct regmap_config rt711_regmap = {
+	.reg_bits = 24,
+	.val_bits = 32,
+	.readable_reg = rt711_readable_register,
+	.volatile_reg = rt711_volatile_register,
+	.max_register = 0x755800,
+	.reg_defaults = rt711_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(rt711_reg_defaults),
+	.cache_type = REGCACHE_RBTREE,
+	.use_single_read = true,
+	.use_single_write = true,
+	.reg_read = rt711_sdw_read,
+	.reg_write = rt711_sdw_write,
+};
+
+static const struct regmap_config rt711_sdw_regmap = {
+	.name = "sdw",
+	.reg_bits = 32,
+	.val_bits = 8,
+	.readable_reg = rt711_readable_register,
+	.max_register = 0xff01,
+	.cache_type = REGCACHE_NONE,
+	.use_single_read = true,
+	.use_single_write = true,
+};
+
+static int rt711_update_status(struct sdw_slave *slave,
+				enum sdw_slave_status status)
+{
+	struct rt711_priv *rt711 = dev_get_drvdata(&slave->dev);
+
+	/* Update the status */
+	rt711->status = status;
+
+	if (status == SDW_SLAVE_UNATTACHED)
+		rt711->hw_init = false;
+
+	/*
+	 * Perform initialization only if slave status is present and
+	 * hw_init flag is false
+	 */
+	if (rt711->hw_init || rt711->status != SDW_SLAVE_ATTACHED)
+		return 0;
+
+	/* perform I/O transfers required for Slave initialization */
+	return rt711_io_init(&slave->dev, slave);
+}
+
+static int rt711_read_prop(struct sdw_slave *slave)
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
+	prop->source_ports = 0x14; /* BITMAP: 00010100 */
+	prop->sink_ports = 0x8; /* BITMAP:  00001000 */
+
+	nval = hweight32(prop->source_ports);
+	num_of_ports += nval;
+	prop->src_dpn_prop = devm_kcalloc(&slave->dev, nval,
+						sizeof(*prop->src_dpn_prop),
+						GFP_KERNEL);
+	if (!prop->src_dpn_prop)
+		return -ENOMEM;
+
+	i = 0;
+	dpn = prop->src_dpn_prop;
+	addr = prop->source_ports;
+	for_each_set_bit(bit, &addr, 32) {
+		dpn[i].num = bit;
+		dpn[i].type = SDW_DPN_FULL;
+		dpn[i].simple_ch_prep_sm = true;
+		dpn[i].ch_prep_timeout = 10;
+		i++;
+	}
+
+	/* do this again for sink now */
+	nval = hweight32(prop->sink_ports);
+	num_of_ports += nval;
+	prop->sink_dpn_prop = devm_kcalloc(&slave->dev, nval,
+						sizeof(*prop->sink_dpn_prop),
+						GFP_KERNEL);
+	if (!prop->sink_dpn_prop)
+		return -ENOMEM;
+
+	i = 0;
+	dpn = prop->sink_dpn_prop;
+	addr = prop->sink_ports;
+	for_each_set_bit(bit, &addr, 32) {
+		dpn[i].num = bit;
+		dpn[i].type = SDW_DPN_FULL;
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
+static int rt711_bus_config(struct sdw_slave *slave,
+				struct sdw_bus_params *params)
+{
+	struct rt711_priv *rt711 = dev_get_drvdata(&slave->dev);
+	int ret;
+
+	memcpy(&rt711->params, params, sizeof(*params));
+
+	ret = rt711_clock_config(&slave->dev);
+	if (ret < 0)
+		dev_err(&slave->dev, "Invalid clk config");
+
+	return ret;
+}
+
+static int rt711_interrupt_callback(struct sdw_slave *slave,
+					struct sdw_slave_intr_status *status)
+{
+	struct rt711_priv *rt711 = dev_get_drvdata(&slave->dev);
+
+	dev_dbg(&slave->dev,
+		"%s control_port_stat=%x", __func__, status->control_port);
+
+	if (status->control_port & 0x4) {
+		mod_delayed_work(system_power_efficient_wq,
+			&rt711->jack_detect_work, msecs_to_jiffies(250));
+	}
+
+	return 0;
+}
+
+static struct sdw_slave_ops rt711_slave_ops = {
+	.read_prop = rt711_read_prop,
+	.interrupt_callback = rt711_interrupt_callback,
+	.update_status = rt711_update_status,
+	.bus_config = rt711_bus_config,
+};
+
+static int rt711_sdw_probe(struct sdw_slave *slave,
+				const struct sdw_device_id *id)
+{
+	struct regmap *sdw_regmap, *regmap;
+
+	/* Assign ops */
+	slave->ops = &rt711_slave_ops;
+
+	/* Regmap Initialization */
+	sdw_regmap = devm_regmap_init_sdw(slave, &rt711_sdw_regmap);
+	if (!sdw_regmap)
+		return -EINVAL;
+
+	regmap = devm_regmap_init(&slave->dev, NULL,
+		&slave->dev, &rt711_regmap);
+	if (!regmap)
+		return -EINVAL;
+
+	rt711_init(&slave->dev, sdw_regmap, regmap, slave);
+
+	return 0;
+}
+
+static int rt711_sdw_remove(struct sdw_slave *slave)
+{
+	struct rt711_priv *rt711 = dev_get_drvdata(&slave->dev);
+
+	if (rt711 && rt711->hw_init) {
+		cancel_delayed_work(&rt711->jack_detect_work);
+		cancel_delayed_work(&rt711->jack_btn_check_work);
+		cancel_work_sync(&rt711->calibration_work);
+	}
+
+	return 0;
+}
+
+static const struct sdw_device_id rt711_id[] = {
+	SDW_SLAVE_ENTRY(0x025d, 0x711, 0),
+	{},
+};
+MODULE_DEVICE_TABLE(sdw, rt711_id);
+
+static int rt711_dev_suspend(struct device *dev)
+{
+	struct rt711_priv *rt711 = dev_get_drvdata(dev);
+
+	if (!rt711->hw_init)
+		return 0;
+
+	regcache_cache_only(rt711->regmap, true);
+
+	return 0;
+}
+
+#define RT711_PROBE_TIMEOUT 2000
+
+static int rt711_dev_resume(struct device *dev)
+{
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	struct rt711_priv *rt711 = dev_get_drvdata(dev);
+	unsigned long time;
+
+	if (!rt711->hw_init)
+		return 0;
+
+	if (!slave->unattach_request)
+		goto regmap_sync;
+
+	time = wait_for_completion_timeout(&slave->initialization_complete,
+				msecs_to_jiffies(RT711_PROBE_TIMEOUT));
+	if (!time) {
+		dev_err(&slave->dev, "Initialization not complete, timed out\n");
+		return -ETIMEDOUT;
+	}
+
+regmap_sync:
+	slave->unattach_request = 0;
+	regcache_cache_only(rt711->regmap, false);
+	regcache_sync_region(rt711->regmap, 0x3000, 0x8fff);
+	regcache_sync_region(rt711->regmap, 0x752009, 0x752091);
+
+	return 0;
+}
+
+static const struct dev_pm_ops rt711_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(rt711_dev_suspend, rt711_dev_resume)
+	SET_RUNTIME_PM_OPS(rt711_dev_suspend, rt711_dev_resume, NULL)
+};
+
+static struct sdw_driver rt711_sdw_driver = {
+	.driver = {
+		.name = "rt711",
+		.owner = THIS_MODULE,
+		.pm = &rt711_pm,
+	},
+	.probe = rt711_sdw_probe,
+	.remove = rt711_sdw_remove,
+	.ops = &rt711_slave_ops,
+	.id_table = rt711_id,
+};
+module_sdw_driver(rt711_sdw_driver);
+
+MODULE_DESCRIPTION("ASoC RT711 SDW driver");
+MODULE_AUTHOR("Shuming Fan <shumingf@realtek.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/rt711-sdw.h b/sound/soc/codecs/rt711-sdw.h
new file mode 100644
index 000000000000..43b2b984b29c
--- /dev/null
+++ b/sound/soc/codecs/rt711-sdw.h
@@ -0,0 +1,281 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * rt711-sdw.h -- RT711 ALSA SoC audio driver header
+ *
+ * Copyright(c) 2019 Realtek Semiconductor Corp.
+ */
+
+#ifndef __RT711_SDW_H__
+#define __RT711_SDW_H__
+
+static const struct reg_default rt711_reg_defaults[] = {
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
+	{ 0x0046, 0x01 },
+	{ 0x0050, 0x20 },
+	{ 0x0051, 0x02 },
+	{ 0x0052, 0x5d },
+	{ 0x0053, 0x07 },
+	{ 0x0054, 0x11 },
+	{ 0x0055, 0x00 },
+	{ 0x0060, 0x00 },
+	{ 0x0070, 0x00 },
+	{ 0x0080, 0xc0 },
+	{ 0x0088, 0x00 },
+	{ 0x00e0, 0x00 },
+	{ 0x00e1, 0x00 },
+	{ 0x00e2, 0x00 },
+	{ 0x00e3, 0x00 },
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
+	{ 0x0100, 0x00 },
+	{ 0x0101, 0x00 },
+	{ 0x0102, 0x00 },
+	{ 0x0103, 0x00 },
+	{ 0x0104, 0x00 },
+	{ 0x0105, 0x00 },
+	{ 0x0120, 0x00 },
+	{ 0x0122, 0x00 },
+	{ 0x0123, 0x00 },
+	{ 0x0124, 0x00 },
+	{ 0x0125, 0x00 },
+	{ 0x0126, 0x00 },
+	{ 0x0127, 0x00 },
+	{ 0x0130, 0x00 },
+	{ 0x0132, 0x00 },
+	{ 0x0133, 0x00 },
+	{ 0x0134, 0x00 },
+	{ 0x0135, 0x00 },
+	{ 0x0136, 0x00 },
+	{ 0x0137, 0x00 },
+	{ 0x0200, 0x00 },
+	{ 0x0201, 0x00 },
+	{ 0x0202, 0x00 },
+	{ 0x0203, 0x00 },
+	{ 0x0204, 0x00 },
+	{ 0x0205, 0x03 },
+	{ 0x0220, 0x00 },
+	{ 0x0222, 0x00 },
+	{ 0x0223, 0x00 },
+	{ 0x0224, 0x00 },
+	{ 0x0225, 0x00 },
+	{ 0x0226, 0x00 },
+	{ 0x0227, 0x00 },
+	{ 0x0230, 0x00 },
+	{ 0x0232, 0x00 },
+	{ 0x0233, 0x00 },
+	{ 0x0234, 0x00 },
+	{ 0x0235, 0x00 },
+	{ 0x0236, 0x00 },
+	{ 0x0237, 0x00 },
+	{ 0x0300, 0x00 },
+	{ 0x0301, 0x00 },
+	{ 0x0302, 0x20 },
+	{ 0x0303, 0x00 },
+	{ 0x0304, 0x00 },
+	{ 0x0305, 0x03 },
+	{ 0x0320, 0x00 },
+	{ 0x0322, 0x00 },
+	{ 0x0323, 0x00 },
+	{ 0x0324, 0x00 },
+	{ 0x0325, 0x00 },
+	{ 0x0326, 0x00 },
+	{ 0x0327, 0x00 },
+	{ 0x0330, 0x00 },
+	{ 0x0332, 0x00 },
+	{ 0x0333, 0x00 },
+	{ 0x0334, 0x00 },
+	{ 0x0335, 0x00 },
+	{ 0x0336, 0x00 },
+	{ 0x0337, 0x00 },
+	{ 0x0400, 0x00 },
+	{ 0x0401, 0x00 },
+	{ 0x0402, 0x00 },
+	{ 0x0403, 0x00 },
+	{ 0x0404, 0x00 },
+	{ 0x0405, 0x03 },
+	{ 0x0420, 0x00 },
+	{ 0x0422, 0x00 },
+	{ 0x0423, 0x00 },
+	{ 0x0424, 0x00 },
+	{ 0x0425, 0x00 },
+	{ 0x0426, 0x00 },
+	{ 0x0427, 0x00 },
+	{ 0x0430, 0x00 },
+	{ 0x0432, 0x00 },
+	{ 0x0433, 0x00 },
+	{ 0x0434, 0x00 },
+	{ 0x0435, 0x00 },
+	{ 0x0436, 0x00 },
+	{ 0x0437, 0x00 },
+	{ 0x0f00, 0x00 },
+	{ 0x0f01, 0x00 },
+	{ 0x0f02, 0x20 },
+	{ 0x0f03, 0x00 },
+	{ 0x0f04, 0x00 },
+	{ 0x0f05, 0x03 },
+	{ 0x0f06, 0x00 },
+	{ 0x0f07, 0x00 },
+	{ 0x0f08, 0x00 },
+	{ 0x0f09, 0x00 },
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
+	{ 0x0f22, 0x00 },
+	{ 0x0f23, 0x00 },
+	{ 0x0f24, 0x00 },
+	{ 0x0f25, 0x00 },
+	{ 0x0f26, 0x00 },
+	{ 0x0f27, 0x00 },
+	{ 0x0f30, 0x00 },
+	{ 0x0f32, 0x00 },
+	{ 0x0f33, 0x00 },
+	{ 0x0f34, 0x00 },
+	{ 0x0f35, 0x00 },
+	{ 0x0f36, 0x00 },
+	{ 0x0f37, 0x00 },
+	{ 0x2012, 0x00 },
+	{ 0x2013, 0x00 },
+	{ 0x2014, 0x00 },
+	{ 0x2015, 0x00 },
+	{ 0x2016, 0x00 },
+	{ 0x201a, 0x00 },
+	{ 0x201b, 0x00 },
+	{ 0x201c, 0x0c },
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
+	{ 0x2201, 0xc7 },
+	{ 0x2202, 0x0c },
+	{ 0x2203, 0x22 },
+	{ 0x2204, 0x04 },
+	{ 0x2206, 0x00 },
+	{ 0x2207, 0x00 },
+	{ 0x2208, 0x00 },
+	{ 0x2209, 0x00 },
+	{ 0x220a, 0x00 },
+	{ 0x220b, 0x00 },
+	{ 0x220c, 0x00 },
+	{ 0x220d, 0x04 },
+	{ 0x220e, 0x00 },
+	{ 0x220f, 0x00 },
+	{ 0x2211, 0x01 },
+	{ 0x2212, 0x00 },
+	{ 0x2220, 0x00 },
+	{ 0x2221, 0x00 },
+	{ 0x2222, 0x00 },
+	{ 0x2223, 0x00 },
+	{ 0x2230, 0x00 },
+	{ 0x2231, 0x2f },
+	{ 0x2232, 0x80 },
+	{ 0x2233, 0x00 },
+	{ 0x2234, 0x00 },
+	{ 0x2235, 0x00 },
+	{ 0x2236, 0x00 },
+	{ 0x2237, 0x00 },
+	{ 0x2238, 0x00 },
+	{ 0x2239, 0x00 },
+	{ 0x2f01, 0x00 },
+	{ 0x2f02, 0x09 },
+	{ 0x2f03, 0x00 },
+	{ 0x2f04, 0x00 },
+	{ 0x2f05, 0x0b },
+	{ 0x2f06, 0x01 },
+	{ 0x2f07, 0xcf },
+	{ 0x2f08, 0x00 },
+	{ 0x2f09, 0x00 },
+	{ 0x2f0a, 0x00 },
+	{ 0x2f0b, 0x00 },
+	{ 0x2f0c, 0x00 },
+	{ 0x2f0d, 0x00 },
+	{ 0x2f0e, 0x00 },
+	{ 0x2f0f, 0x00 },
+	{ 0x3122, 0x00 },
+	{ 0x3123, 0x00 },
+	{ 0x7303, 0x57 },
+	{ 0x8383, 0x57 },
+	{ 0x7308, 0x97 },
+	{ 0x8388, 0x97 },
+	{ 0x7309, 0x97 },
+	{ 0x8389, 0x97 },
+	{ 0x7312, 0x00 },
+	{ 0x8392, 0x00 },
+	{ 0x7313, 0x00 },
+	{ 0x8393, 0x00 },
+	{ 0x7319, 0x00 },
+	{ 0x8399, 0x00 },
+	{ 0x752009, 0x1029 },
+	{ 0x752011, 0x007a },
+	{ 0x75201a, 0x8003 },
+	{ 0x752045, 0x5289 },
+	{ 0x752048, 0xd049 },
+	{ 0x75204a, 0xa83b },
+	{ 0x75206b, 0x5064 },
+	{ 0x75206f, 0x058b },
+	{ 0x752091, 0x0000 },
+};
+
+#endif /* __RT711_SDW_H__ */
diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
new file mode 100644
index 000000000000..3bebba7a63be
--- /dev/null
+++ b/sound/soc/codecs/rt711.c
@@ -0,0 +1,1293 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// rt711.c -- rt711 ALSA SoC audio driver
+//
+// Copyright(c) 2019 Realtek Semiconductor Corp.
+//
+//
+
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/version.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/delay.h>
+#include <linux/pm_runtime.h>
+#include <linux/pm.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <sound/initval.h>
+#include <sound/tlv.h>
+#include <sound/hda_verbs.h>
+#include <sound/jack.h>
+
+#include "rt711.h"
+
+static int rt711_index_write(struct regmap *regmap,
+		unsigned int nid, unsigned int reg, unsigned int value)
+{
+	int ret;
+	unsigned int addr = ((RT711_PRIV_INDEX_W_H | nid) << 8) | reg;
+
+	ret = regmap_write(regmap, addr, value);
+	if (ret < 0)
+		pr_err("Failed to set private value: %06x <= %04x ret=%d\n",
+			addr, value, ret);
+
+	return ret;
+}
+
+static int rt711_index_read(struct regmap *regmap,
+		unsigned int nid, unsigned int reg, unsigned int *value)
+{
+	int ret;
+	unsigned int addr = ((RT711_PRIV_INDEX_W_H | nid) << 8) | reg;
+
+	*value = 0;
+	ret = regmap_read(regmap, addr, value);
+	if (ret < 0)
+		pr_err("Failed to get private value: %06x => %04x ret=%d\n",
+			addr, *value, ret);
+
+	return ret;
+}
+
+static int rt711_index_update_bits(struct regmap *regmap, unsigned int nid,
+			unsigned int reg, unsigned int mask, unsigned int val)
+{
+	unsigned int tmp, orig;
+	int ret;
+
+	ret = rt711_index_read(regmap, nid, reg, &orig);
+	if (ret < 0)
+		return ret;
+
+	tmp = orig & ~mask;
+	tmp |= val & mask;
+
+	return rt711_index_write(regmap, nid, reg, tmp);
+}
+
+static void rt711_reset(struct regmap *regmap)
+{
+	regmap_write(regmap, RT711_FUNC_RESET, 0);
+	rt711_index_update_bits(regmap, RT711_VENDOR_REG,
+		RT711_PARA_VERB_CTL, RT711_HIDDEN_REG_SW_RESET,
+		RT711_HIDDEN_REG_SW_RESET);
+}
+
+static int rt711_calibration(struct rt711_priv *rt711)
+{
+	unsigned int val, loop = 0;
+	struct device *dev;
+	struct regmap *regmap = rt711->regmap;
+	int ret = 0;
+
+	mutex_lock(&rt711->calibrate_mutex);
+	regmap_write(rt711->regmap,
+		RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
+
+	dev = regmap_get_device(regmap);
+
+	/* Calibration manual mode */
+	rt711_index_update_bits(regmap, RT711_VENDOR_REG, RT711_FSM_CTL,
+		0xf, 0x0);
+
+	/* trigger */
+	rt711_index_update_bits(regmap, RT711_VENDOR_CALI,
+		RT711_DAC_DC_CALI_CTL1, RT711_DAC_DC_CALI_TRIGGER,
+		RT711_DAC_DC_CALI_TRIGGER);
+
+	/* wait for calibration process */
+	rt711_index_read(regmap, RT711_VENDOR_CALI,
+		RT711_DAC_DC_CALI_CTL1, &val);
+
+	while (val & RT711_DAC_DC_CALI_TRIGGER) {
+		if (loop >= 500) {
+			pr_err("%s, calibration time-out!\n",
+							__func__);
+			ret = -ETIMEDOUT;
+			break;
+		}
+		loop++;
+
+		usleep_range(10000, 11000);
+		rt711_index_read(regmap, RT711_VENDOR_CALI,
+			RT711_DAC_DC_CALI_CTL1, &val);
+	}
+
+	/* depop mode */
+	rt711_index_update_bits(regmap, RT711_VENDOR_REG,
+		RT711_FSM_CTL, 0xf, RT711_DEPOP_CTL);
+
+	regmap_write(rt711->regmap,
+		RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
+	mutex_unlock(&rt711->calibrate_mutex);
+
+	dev_dbg(dev, "%s calibration complete, ret=%d\n", __func__, ret);
+	return ret;
+}
+
+static unsigned int rt711_button_detect(struct rt711_priv *rt711)
+{
+	unsigned int btn_type = 0, val80, val81;
+	int ret;
+
+	ret = rt711_index_read(rt711->regmap, RT711_VENDOR_REG,
+				RT711_IRQ_FLAG_TABLE1, &val80);
+	if (ret < 0)
+		goto read_error;
+	ret = rt711_index_read(rt711->regmap, RT711_VENDOR_REG,
+					RT711_IRQ_FLAG_TABLE2, &val81);
+	if (ret < 0)
+		goto read_error;
+
+	val80 &= 0x0381;
+	val81 &= 0xff00;
+
+	switch (val80) {
+	case 0x0200:
+	case 0x0100:
+	case 0x0080:
+		btn_type |= SND_JACK_BTN_0;
+		break;
+	case 0x0001:
+		btn_type |= SND_JACK_BTN_3;
+		break;
+	}
+	switch (val81) {
+	case 0x8000:
+	case 0x4000:
+	case 0x2000:
+		btn_type |= SND_JACK_BTN_1;
+		break;
+	case 0x1000:
+	case 0x0800:
+	case 0x0400:
+		btn_type |= SND_JACK_BTN_2;
+		break;
+	case 0x0200:
+	case 0x0100:
+		btn_type |= SND_JACK_BTN_3;
+		break;
+	}
+read_error:
+	return btn_type;
+}
+
+static int rt711_headset_detect(struct rt711_priv *rt711)
+{
+	unsigned int buf, loop = 0;
+	int ret;
+	unsigned int jack_status = 0, reg;
+
+	ret = rt711_index_read(rt711->regmap, RT711_VENDOR_REG,
+				RT711_COMBO_JACK_AUTO_CTL2, &buf);
+	if (ret < 0)
+		goto io_error;
+
+	while (loop < 500 &&
+		(buf & RT711_COMBOJACK_AUTO_DET_STATUS) == 0) {
+		loop++;
+
+		usleep_range(9000, 10000);
+		ret = rt711_index_read(rt711->regmap, RT711_VENDOR_REG,
+					RT711_COMBO_JACK_AUTO_CTL2, &buf);
+		if (ret < 0)
+			goto io_error;
+
+		reg = RT711_VERB_GET_PIN_SENSE | RT711_HP_OUT;
+		ret = regmap_read(rt711->regmap, reg, &jack_status);
+		if (ret < 0)
+			goto io_error;
+		if ((jack_status & (1 << 31)) == 0)
+			goto remove_error;
+	}
+
+	if (loop >= 500)
+		goto to_error;
+
+	if (buf & RT711_COMBOJACK_AUTO_DET_TRS)
+		rt711->jack_type = SND_JACK_HEADPHONE;
+	else if ((buf & RT711_COMBOJACK_AUTO_DET_CTIA) ||
+		(buf & RT711_COMBOJACK_AUTO_DET_OMTP))
+		rt711->jack_type = SND_JACK_HEADSET;
+
+	return 0;
+
+to_error:
+	ret = -ETIMEDOUT;
+	pr_err_ratelimited("Time-out error in %s\n", __func__);
+	return ret;
+io_error:
+	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
+	return ret;
+remove_error:
+	pr_err_ratelimited("Jack removal in %s\n", __func__);
+	return -ENODEV;
+}
+
+static void rt711_jack_detect_handler(struct work_struct *work)
+{
+	struct rt711_priv *rt711 =
+		container_of(work, struct rt711_priv, jack_detect_work.work);
+	int btn_type = 0, ret;
+	unsigned int jack_status = 0, reg;
+
+	if (!rt711->hs_jack)
+		return;
+
+	if (!rt711->component->card->instantiated)
+		return;
+
+	reg = RT711_VERB_GET_PIN_SENSE | RT711_HP_OUT;
+	ret = regmap_read(rt711->regmap, reg, &jack_status);
+	if (ret < 0)
+		goto io_error;
+
+	/* pin attached */
+	if (jack_status & (1 << 31)) {
+		/* jack in */
+		if (rt711->jack_type == 0) {
+			ret = rt711_headset_detect(rt711);
+			if (ret < 0)
+				return;
+			if (rt711->jack_type == SND_JACK_HEADSET)
+				btn_type = rt711_button_detect(rt711);
+		} else if (rt711->jack_type == SND_JACK_HEADSET) {
+			/* jack is already in, report button event */
+			btn_type = rt711_button_detect(rt711);
+		}
+	} else {
+		/* jack out */
+		rt711->jack_type = 0;
+	}
+
+	dev_dbg(&rt711->slave->dev,
+		"in %s, jack_type=0x%x\n", __func__, rt711->jack_type);
+	dev_dbg(&rt711->slave->dev,
+		"in %s, btn_type=0x%x\n", __func__, btn_type);
+
+	snd_soc_jack_report(rt711->hs_jack, rt711->jack_type | btn_type,
+			SND_JACK_HEADSET |
+			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+			SND_JACK_BTN_2 | SND_JACK_BTN_3);
+
+	if (btn_type) {
+		/* button released */
+		snd_soc_jack_report(rt711->hs_jack, rt711->jack_type,
+			SND_JACK_HEADSET |
+			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+			SND_JACK_BTN_2 | SND_JACK_BTN_3);
+
+		mod_delayed_work(system_power_efficient_wq,
+			&rt711->jack_btn_check_work, msecs_to_jiffies(200));
+	}
+
+	return;
+
+io_error:
+	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
+}
+
+static void rt711_btn_check_handler(struct work_struct *work)
+{
+	struct rt711_priv *rt711 = container_of(work, struct rt711_priv,
+		jack_btn_check_work.work);
+	int btn_type = 0, ret;
+	unsigned int jack_status = 0, reg;
+
+	reg = RT711_VERB_GET_PIN_SENSE | RT711_HP_OUT;
+	ret = regmap_read(rt711->regmap, reg, &jack_status);
+	if (ret < 0)
+		goto io_error;
+
+	/* pin attached */
+	if (jack_status & (1 << 31)) {
+		if (rt711->jack_type == SND_JACK_HEADSET) {
+			/* jack is already in, report button event */
+			btn_type = rt711_button_detect(rt711);
+		}
+	} else {
+		rt711->jack_type = 0;
+	}
+
+	/* cbj comparator */
+	ret = rt711_index_read(rt711->regmap, RT711_VENDOR_REG,
+		RT711_COMBO_JACK_AUTO_CTL2, &reg);
+	if (ret < 0)
+		goto io_error;
+
+	if ((reg & 0xf0) == 0xf0)
+		btn_type = 0;
+
+	dev_dbg(&rt711->slave->dev,
+		"%s, btn_type=0x%x\n",	__func__, btn_type);
+	snd_soc_jack_report(rt711->hs_jack, rt711->jack_type | btn_type,
+			SND_JACK_HEADSET |
+			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+			SND_JACK_BTN_2 | SND_JACK_BTN_3);
+
+	if (btn_type) {
+		/* button released */
+		snd_soc_jack_report(rt711->hs_jack, rt711->jack_type,
+			SND_JACK_HEADSET |
+			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+			SND_JACK_BTN_2 | SND_JACK_BTN_3);
+
+		mod_delayed_work(system_power_efficient_wq,
+			&rt711->jack_btn_check_work, msecs_to_jiffies(200));
+	}
+
+	return;
+
+io_error:
+	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
+}
+
+static void rt711_jack_init(struct rt711_priv *rt711)
+{
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(rt711->component);
+
+	mutex_lock(&rt711->calibrate_mutex);
+	/* power on */
+	if (dapm->bias_level <= SND_SOC_BIAS_STANDBY)
+		regmap_write(rt711->regmap,
+			RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
+
+	if (rt711->hs_jack) {
+		/* unsolicited response & IRQ control */
+		regmap_write(rt711->regmap,
+			RT711_SET_MIC2_UNSOLICITED_ENABLE, 0x82);
+		regmap_write(rt711->regmap,
+			RT711_SET_HP_UNSOLICITED_ENABLE, 0x81);
+		regmap_write(rt711->regmap,
+			RT711_SET_INLINE_UNSOLICITED_ENABLE, 0x83);
+		rt711_index_write(rt711->regmap, RT711_VENDOR_REG,
+			0x10, 0x2420);
+		rt711_index_write(rt711->regmap, RT711_VENDOR_REG,
+			0x19, 0x2e11);
+
+		switch (rt711->jd_src) {
+		case RT711_JD1:
+			/* default settings was already for JD1 */
+			break;
+		case RT711_JD2:
+			rt711_index_update_bits(rt711->regmap, RT711_VENDOR_REG,
+				RT711_JD_CTL2, RT711_JD2_2PORT_200K_DECODE_HP |
+				RT711_HP_JD_SEL_JD2,
+				RT711_JD2_2PORT_200K_DECODE_HP |
+				RT711_HP_JD_SEL_JD2);
+			rt711_index_update_bits(rt711->regmap, RT711_VENDOR_REG,
+				RT711_CC_DET1,
+				RT711_HP_JD_FINAL_RESULT_CTL_JD12,
+				RT711_HP_JD_FINAL_RESULT_CTL_JD12);
+			break;
+		default:
+			dev_warn(rt711->component->dev, "Wrong JD source\n");
+			break;
+		}
+
+		dev_dbg(&rt711->slave->dev, "in %s enable\n", __func__);
+
+		mod_delayed_work(system_power_efficient_wq,
+			&rt711->jack_detect_work, msecs_to_jiffies(250));
+	} else {
+		regmap_write(rt711->regmap,
+			RT711_SET_MIC2_UNSOLICITED_ENABLE, 0x00);
+		regmap_write(rt711->regmap,
+			RT711_SET_HP_UNSOLICITED_ENABLE, 0x00);
+		regmap_write(rt711->regmap,
+			RT711_SET_INLINE_UNSOLICITED_ENABLE, 0x00);
+
+		dev_dbg(&rt711->slave->dev, "in %s disable\n", __func__);
+	}
+
+	/* power off */
+	if (dapm->bias_level <= SND_SOC_BIAS_STANDBY)
+		regmap_write(rt711->regmap,
+			RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
+	mutex_unlock(&rt711->calibrate_mutex);
+}
+
+static int rt711_set_jack_detect(struct snd_soc_component *component,
+	struct snd_soc_jack *hs_jack, void *data)
+{
+	struct rt711_priv *rt711 = snd_soc_component_get_drvdata(component);
+
+	rt711->hs_jack = hs_jack;
+
+	if (!rt711->hw_init) {
+		dev_dbg(&rt711->slave->dev,
+			"%s hw_init not ready yet\n", __func__);
+		return 0;
+	}
+
+	rt711_jack_init(rt711);
+
+	return 0;
+}
+
+static void rt711_get_gain(struct rt711_priv *rt711, unsigned int addr_h,
+				unsigned int addr_l, unsigned int val_h,
+				unsigned int *r_val, unsigned int *l_val)
+{
+	/* R Channel */
+	*r_val = (val_h << 8);
+	regmap_read(rt711->regmap, addr_l, r_val);
+
+	/* L Channel */
+	val_h |= 0x20;
+	*l_val = (val_h << 8);
+	regmap_read(rt711->regmap, addr_h, l_val);
+}
+
+/* For Verb-Set Amplifier Gain (Verb ID = 3h) */
+static int rt711_set_amp_gain_put(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct rt711_priv *rt711 = snd_soc_component_get_drvdata(component);
+	unsigned int addr_h, addr_l, val_h, val_ll, val_lr;
+	unsigned int read_ll, read_rl;
+	int i;
+
+	/* Can't use update bit function, so read the original value first */
+	addr_h = mc->reg;
+	addr_l = mc->rreg;
+	if (mc->shift == RT711_DIR_OUT_SFT) /* output */
+		val_h = 0x80;
+	else /* input */
+		val_h = 0x0;
+
+	rt711_get_gain(rt711, addr_h, addr_l, val_h, &read_rl, &read_ll);
+
+	/* L Channel */
+	if (mc->invert) {
+		/* for mute/unmute */
+		val_ll = (mc->max - ucontrol->value.integer.value[0])
+					<< RT711_MUTE_SFT;
+		/* keep gain */
+		read_ll = read_ll & 0x7f;
+		val_ll |= read_ll;
+	} else {
+		/* for gain */
+		val_ll = ((ucontrol->value.integer.value[0]) & 0x7f);
+		if (val_ll > mc->max)
+			val_ll = mc->max;
+		/* keep mute status */
+		read_ll = read_ll & (1 << RT711_MUTE_SFT);
+		val_ll |= read_ll;
+	}
+
+	if (dapm->bias_level <= SND_SOC_BIAS_STANDBY)
+		regmap_write(rt711->regmap,
+				RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
+
+	/* R Channel */
+	if (mc->invert) {
+		/* for mute/unmute */
+		val_lr = (mc->max - ucontrol->value.integer.value[1])
+					<< RT711_MUTE_SFT;
+		/* keep gain */
+		read_rl = read_rl & 0x7f;
+		val_lr |= read_rl;
+	} else {
+		/* for gain */
+		val_lr = ((ucontrol->value.integer.value[1]) & 0x7f);
+		if (val_lr > mc->max)
+			val_lr = mc->max;
+		/* keep mute status */
+		read_rl = read_rl & (1 << RT711_MUTE_SFT);
+		val_lr |= read_rl;
+	}
+
+	for (i = 0; i < 3; i++) { /* retry 3 times at most */
+
+		if (val_ll == val_lr) {
+			/* Set both L/R channels at the same time */
+			val_h = (1 << mc->shift) | (3 << 4);
+			regmap_write(rt711->regmap,
+				addr_h, (val_h << 8 | val_ll));
+			regmap_write(rt711->regmap,
+				addr_l, (val_h << 8 | val_ll));
+		} else {
+			/* Lch*/
+			val_h = (1 << mc->shift) | (1 << 5);
+			regmap_write(rt711->regmap,
+				addr_h, (val_h << 8 | val_ll));
+
+			/* Rch */
+			val_h = (1 << mc->shift) | (1 << 4);
+			regmap_write(rt711->regmap,
+				addr_l, (val_h << 8 | val_lr));
+		}
+		/* check result */
+		if (mc->shift == RT711_DIR_OUT_SFT) /* output */
+			val_h = 0x80;
+		else /* input */
+			val_h = 0x0;
+
+		rt711_get_gain(rt711, addr_h, addr_l, val_h,
+					&read_rl, &read_ll);
+		if (read_rl == val_lr && read_ll == val_ll)
+			break;
+	}
+
+	if (dapm->bias_level <= SND_SOC_BIAS_STANDBY)
+		regmap_write(rt711->regmap,
+				RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
+	return 0;
+}
+
+static int rt711_set_amp_gain_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt711_priv *rt711 = snd_soc_component_get_drvdata(component);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	unsigned int addr_h, addr_l, val_h;
+	unsigned int read_ll, read_rl;
+
+	/* switch to get command */
+	addr_h = mc->reg;
+	addr_l = mc->rreg;
+	if (mc->shift == RT711_DIR_OUT_SFT) /* output */
+		val_h = 0x80;
+	else /* input */
+		val_h = 0x0;
+
+	rt711_get_gain(rt711, addr_h, addr_l, val_h, &read_rl, &read_ll);
+
+	if (mc->invert) {
+		/* mute/unmute for switch controls */
+		read_ll = !((read_ll & 0x80) >> RT711_MUTE_SFT);
+		read_rl = !((read_rl & 0x80) >> RT711_MUTE_SFT);
+	} else {
+		/* for gain volume controls */
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
+static const struct snd_kcontrol_new rt711_snd_controls[] = {
+	SOC_DOUBLE_R_EXT_TLV("DAC Surr Playback Volume",
+		RT711_SET_GAIN_DAC2_H, RT711_SET_GAIN_DAC2_L,
+		RT711_DIR_OUT_SFT, 0x57, 0,
+		rt711_set_amp_gain_get, rt711_set_amp_gain_put, out_vol_tlv),
+	SOC_DOUBLE_R_EXT("ADC 08 Capture Switch",
+		RT711_SET_GAIN_ADC2_H, RT711_SET_GAIN_ADC2_L,
+		RT711_DIR_IN_SFT, 1, 1,
+		rt711_set_amp_gain_get, rt711_set_amp_gain_put),
+	SOC_DOUBLE_R_EXT("ADC 09 Capture Switch",
+		RT711_SET_GAIN_ADC1_H, RT711_SET_GAIN_ADC1_L,
+		RT711_DIR_IN_SFT, 1, 1,
+		rt711_set_amp_gain_get, rt711_set_amp_gain_put),
+	SOC_DOUBLE_R_EXT_TLV("ADC 08 Capture Volume",
+		RT711_SET_GAIN_ADC2_H, RT711_SET_GAIN_ADC2_L,
+		RT711_DIR_IN_SFT, 0x3f, 0,
+		rt711_set_amp_gain_get, rt711_set_amp_gain_put, in_vol_tlv),
+	SOC_DOUBLE_R_EXT_TLV("ADC 09 Capture Volume",
+		RT711_SET_GAIN_ADC1_H, RT711_SET_GAIN_ADC1_L,
+		RT711_DIR_IN_SFT, 0x3f, 0,
+		rt711_set_amp_gain_get, rt711_set_amp_gain_put, in_vol_tlv),
+	SOC_DOUBLE_R_EXT_TLV("AMIC Volume",
+		RT711_SET_GAIN_AMIC_H, RT711_SET_GAIN_AMIC_L,
+		RT711_DIR_IN_SFT, 3, 0,
+		rt711_set_amp_gain_get, rt711_set_amp_gain_put, mic_vol_tlv),
+	SOC_DOUBLE_R_EXT_TLV("DMIC1 Volume",
+		RT711_SET_GAIN_DMIC1_H, RT711_SET_GAIN_DMIC1_L,
+		RT711_DIR_IN_SFT, 3, 0,
+		rt711_set_amp_gain_get, rt711_set_amp_gain_put, mic_vol_tlv),
+	SOC_DOUBLE_R_EXT_TLV("DMIC2 Volume",
+		RT711_SET_GAIN_DMIC2_H, RT711_SET_GAIN_DMIC2_L,
+		RT711_DIR_IN_SFT, 3, 0,
+		rt711_set_amp_gain_get, rt711_set_amp_gain_put, mic_vol_tlv),
+};
+
+static int rt711_mux_get(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_kcontrol_component(kcontrol);
+	struct rt711_priv *rt711 = snd_soc_component_get_drvdata(component);
+	unsigned int reg, val = 0, nid;
+	int ret;
+
+	if (strstr(ucontrol->id.name, "ADC 22 Mux"))
+		nid = RT711_MIXER_IN1;
+	else if (strstr(ucontrol->id.name, "ADC 23 Mux"))
+		nid = RT711_MIXER_IN2;
+	else
+		return -EINVAL;
+
+	/* vid = 0xf01 */
+	reg = RT711_VERB_SET_CONNECT_SEL | nid;
+	ret = regmap_read(rt711->regmap, reg, &val);
+	if (ret < 0) {
+		dev_err(component->dev, "%s: sdw read failed: %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+	ucontrol->value.enumerated.item[0] = val;
+
+	return 0;
+}
+
+static int rt711_mux_put(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct rt711_priv *rt711 = snd_soc_component_get_drvdata(component);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int *item = ucontrol->value.enumerated.item;
+	unsigned int val, val2 = 0, change, reg, nid;
+	int ret;
+
+	if (item[0] >= e->items)
+		return -EINVAL;
+
+	if (strstr(ucontrol->id.name, "ADC 22 Mux"))
+		nid = RT711_MIXER_IN1;
+	else if (strstr(ucontrol->id.name, "ADC 23 Mux"))
+		nid = RT711_MIXER_IN2;
+	else
+		return -EINVAL;
+
+	/* Verb ID = 0x701h */
+	val = snd_soc_enum_item_to_val(e, item[0]) << e->shift_l;
+
+	reg = RT711_VERB_SET_CONNECT_SEL | nid;
+	ret = regmap_read(rt711->regmap, reg, &val2);
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
+		reg = RT711_VERB_SET_CONNECT_SEL | nid;
+		regmap_write(rt711->regmap, reg, val);
+	}
+
+	snd_soc_dapm_mux_update_power(dapm, kcontrol,
+						item[0], e, NULL);
+
+	return change;
+}
+
+static const char * const adc_mux_text[] = {
+	"MIC2",
+	"LINE1",
+	"LINE2",
+	"DMIC",
+};
+
+static SOC_ENUM_SINGLE_DECL(
+	rt711_adc22_enum, SND_SOC_NOPM, 0, adc_mux_text);
+
+static SOC_ENUM_SINGLE_DECL(
+	rt711_adc23_enum, SND_SOC_NOPM, 0, adc_mux_text);
+
+static const struct snd_kcontrol_new rt711_adc22_mux =
+	SOC_DAPM_ENUM_EXT("ADC 22 Mux", rt711_adc22_enum,
+			rt711_mux_get, rt711_mux_put);
+
+static const struct snd_kcontrol_new rt711_adc23_mux =
+	SOC_DAPM_ENUM_EXT("ADC 23 Mux", rt711_adc23_enum,
+			rt711_mux_get, rt711_mux_put);
+
+static int rt711_dac_surround_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct rt711_priv *rt711 = snd_soc_component_get_drvdata(component);
+	unsigned int val_h = (1 << RT711_DIR_OUT_SFT) | (0x3 << 4);
+	unsigned int val_l;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		regmap_write(rt711->regmap,
+			RT711_SET_STREAMID_DAC2, 0x10);
+
+		val_l = 0x00;
+		regmap_write(rt711->regmap,
+			RT711_SET_GAIN_HP_H, (val_h << 8 | val_l));
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		val_l = (1 << RT711_MUTE_SFT);
+		regmap_write(rt711->regmap,
+			RT711_SET_GAIN_HP_H, (val_h << 8 | val_l));
+		usleep_range(50000, 55000);
+
+		regmap_write(rt711->regmap,
+			RT711_SET_STREAMID_DAC2, 0x00);
+		break;
+	}
+	return 0;
+}
+
+static int rt711_adc_09_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct rt711_priv *rt711 = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		regmap_write(rt711->regmap,
+			RT711_SET_STREAMID_ADC1, 0x10);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		regmap_write(rt711->regmap,
+			RT711_SET_STREAMID_ADC1, 0x00);
+		break;
+	}
+	return 0;
+}
+
+static int rt711_adc_08_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct rt711_priv *rt711 = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		regmap_write(rt711->regmap,
+			RT711_SET_STREAMID_ADC2, 0x10);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		regmap_write(rt711->regmap,
+			RT711_SET_STREAMID_ADC2, 0x00);
+		break;
+	}
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget rt711_dapm_widgets[] = {
+	SND_SOC_DAPM_OUTPUT("HP"),
+	SND_SOC_DAPM_INPUT("MIC2"),
+	SND_SOC_DAPM_INPUT("DMIC1"),
+	SND_SOC_DAPM_INPUT("DMIC2"),
+	SND_SOC_DAPM_INPUT("LINE1"),
+	SND_SOC_DAPM_INPUT("LINE2"),
+
+	SND_SOC_DAPM_DAC_E("DAC Surround", NULL, SND_SOC_NOPM, 0, 0,
+		rt711_dac_surround_event,
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_ADC_E("ADC 09", NULL, SND_SOC_NOPM, 0, 0,
+		rt711_adc_09_event,
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_ADC_E("ADC 08", NULL, SND_SOC_NOPM, 0, 0,
+		rt711_adc_08_event,
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_MUX("ADC 22 Mux", SND_SOC_NOPM, 0, 0,
+		&rt711_adc22_mux),
+	SND_SOC_DAPM_MUX("ADC 23 Mux", SND_SOC_NOPM, 0, 0,
+		&rt711_adc23_mux),
+
+	SND_SOC_DAPM_AIF_IN("DP3RX", "DP3 Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("DP2TX", "DP2 Capture", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("DP4TX", "DP4 Capture", 0, SND_SOC_NOPM, 0, 0),
+};
+
+static const struct snd_soc_dapm_route rt711_audio_map[] = {
+	{"DAC Surround", NULL, "DP3RX"},
+	{"DP2TX", NULL, "ADC 09"},
+	{"DP4TX", NULL, "ADC 08"},
+
+	{"ADC 09", NULL, "ADC 22 Mux"},
+	{"ADC 08", NULL, "ADC 23 Mux"},
+	{"ADC 22 Mux", "DMIC", "DMIC1"},
+	{"ADC 22 Mux", "LINE1", "LINE1"},
+	{"ADC 22 Mux", "LINE2", "LINE2"},
+	{"ADC 22 Mux", "MIC2", "MIC2"},
+	{"ADC 23 Mux", "DMIC", "DMIC2"},
+	{"ADC 23 Mux", "LINE1", "LINE1"},
+	{"ADC 23 Mux", "LINE2", "LINE2"},
+	{"ADC 23 Mux", "MIC2", "MIC2"},
+
+	{"HP", NULL, "DAC Surround"},
+};
+
+static int rt711_set_bias_level(struct snd_soc_component *component,
+				enum snd_soc_bias_level level)
+{
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
+	struct rt711_priv *rt711 = snd_soc_component_get_drvdata(component);
+
+	switch (level) {
+	case SND_SOC_BIAS_PREPARE:
+		if (dapm->bias_level == SND_SOC_BIAS_STANDBY) {
+			regmap_write(rt711->regmap,
+				RT711_SET_AUDIO_POWER_STATE,
+				AC_PWRST_D0);
+		}
+		break;
+
+	case SND_SOC_BIAS_STANDBY:
+		regmap_write(rt711->regmap,
+			RT711_SET_AUDIO_POWER_STATE,
+			AC_PWRST_D3);
+		break;
+
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int rt711_parse_dt(struct rt711_priv *rt711, struct device *dev)
+{
+	device_property_read_u32(dev, "realtek,jd-src",
+		&rt711->jd_src);
+
+	return 0;
+}
+
+static int rt711_probe(struct snd_soc_component *component)
+{
+	struct rt711_priv *rt711 = snd_soc_component_get_drvdata(component);
+
+	rt711_parse_dt(rt711, &rt711->slave->dev);
+	rt711->component = component;
+
+	return 0;
+}
+
+static const struct snd_soc_component_driver soc_codec_dev_rt711 = {
+	.probe = rt711_probe,
+	.set_bias_level = rt711_set_bias_level,
+	.controls = rt711_snd_controls,
+	.num_controls = ARRAY_SIZE(rt711_snd_controls),
+	.dapm_widgets = rt711_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(rt711_dapm_widgets),
+	.dapm_routes = rt711_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(rt711_audio_map),
+	.set_jack = rt711_set_jack_detect,
+};
+
+static int rt711_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
+				int direction)
+{
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
+static void rt711_shutdown(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct sdw_stream_data *stream;
+
+	stream = snd_soc_dai_get_dma_data(dai, substream);
+	snd_soc_dai_set_dma_data(dai, substream, NULL);
+	kfree(stream);
+}
+
+static int rt711_pcm_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct rt711_priv *rt711 = snd_soc_component_get_drvdata(component);
+	struct sdw_stream_config stream_config;
+	struct sdw_port_config port_config;
+	enum sdw_data_direction direction;
+	struct sdw_stream_data *stream;
+	int retval, port, num_channels;
+	unsigned int val = 0;
+
+	dev_dbg(dai->dev, "%s %s", __func__, dai->name);
+	stream = snd_soc_dai_get_dma_data(dai, substream);
+
+	if (!stream)
+		return -EINVAL;
+
+	if (!rt711->slave)
+		return -EINVAL;
+
+	/* SoundWire specific configuration */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		direction = SDW_DATA_DIR_RX;
+		port = 3;
+	} else {
+		direction = SDW_DATA_DIR_TX;
+		if (dai->id == RT711_AIF1)
+			port = 4;
+		else if (dai->id == RT711_AIF2)
+			port = 2;
+		else
+			return -EINVAL;
+	}
+
+	stream_config.frame_rate = params_rate(params);
+	stream_config.ch_count = params_channels(params);
+	stream_config.bps = snd_pcm_format_width(params_format(params));
+	stream_config.direction = direction;
+
+	num_channels = params_channels(params);
+	port_config.ch_mask = (1 << (num_channels)) - 1;
+	port_config.num = port;
+
+	retval = sdw_stream_add_slave(rt711->slave, &stream_config,
+					&port_config, 1, stream->sdw_stream);
+	if (retval) {
+		dev_err(dai->dev, "Unable to configure port\n");
+		return retval;
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
+	/* 48Khz */
+	regmap_write(rt711->regmap, RT711_DAC_FORMAT_H, val);
+	regmap_write(rt711->regmap, RT711_ADC1_FORMAT_H, val);
+	regmap_write(rt711->regmap, RT711_ADC2_FORMAT_H, val);
+
+	return retval;
+}
+
+static int rt711_pcm_hw_free(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct rt711_priv *rt711 = snd_soc_component_get_drvdata(component);
+	struct sdw_stream_data *stream =
+		snd_soc_dai_get_dma_data(dai, substream);
+
+	if (!rt711->slave)
+		return -EINVAL;
+
+	sdw_stream_remove_slave(rt711->slave, stream->sdw_stream);
+	return 0;
+}
+
+#define RT711_STEREO_RATES (SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000)
+#define RT711_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
+			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8)
+
+static struct snd_soc_dai_ops rt711_ops = {
+	.hw_params	= rt711_pcm_hw_params,
+	.hw_free	= rt711_pcm_hw_free,
+	.set_sdw_stream	= rt711_set_sdw_stream,
+	.shutdown	= rt711_shutdown,
+};
+
+static struct snd_soc_dai_driver rt711_dai[] = {
+	{
+		.name = "rt711-aif1",
+		.id = RT711_AIF1,
+		.playback = {
+			.stream_name = "DP3 Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = RT711_STEREO_RATES,
+			.formats = RT711_FORMATS,
+		},
+		.capture = {
+			.stream_name = "DP4 Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = RT711_STEREO_RATES,
+			.formats = RT711_FORMATS,
+		},
+		.ops = &rt711_ops,
+	},
+	{
+		.name = "rt711-aif2",
+		.id = RT711_AIF2,
+		.capture = {
+			.stream_name = "DP2 Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = RT711_STEREO_RATES,
+			.formats = RT711_FORMATS,
+		},
+		.ops = &rt711_ops,
+	}
+};
+
+/* Bus clock frequency */
+#define RT711_CLK_FREQ_9600000HZ 9600000
+#define RT711_CLK_FREQ_12000000HZ 12000000
+#define RT711_CLK_FREQ_6000000HZ 6000000
+#define RT711_CLK_FREQ_4800000HZ 4800000
+#define RT711_CLK_FREQ_2400000HZ 2400000
+#define RT711_CLK_FREQ_12288000HZ 12288000
+
+int rt711_clock_config(struct device *dev)
+{
+	struct rt711_priv *rt711 = dev_get_drvdata(dev);
+	unsigned int clk_freq, value;
+
+	clk_freq = (rt711->params.curr_dr_freq >> 1);
+
+	switch (clk_freq) {
+	case RT711_CLK_FREQ_12000000HZ:
+		value = 0x0;
+		break;
+	case RT711_CLK_FREQ_6000000HZ:
+		value = 0x1;
+		break;
+	case RT711_CLK_FREQ_9600000HZ:
+		value = 0x2;
+		break;
+	case RT711_CLK_FREQ_4800000HZ:
+		value = 0x3;
+		break;
+	case RT711_CLK_FREQ_2400000HZ:
+		value = 0x4;
+		break;
+	case RT711_CLK_FREQ_12288000HZ:
+		value = 0x5;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_write(rt711->regmap, 0xe0, value);
+	regmap_write(rt711->regmap, 0xf0, value);
+
+	dev_dbg(dev, "%s complete, clk_freq=%d\n", __func__, clk_freq);
+
+	return 0;
+}
+
+static void rt711_calibration_work(struct work_struct *work)
+{
+	struct rt711_priv *rt711 =
+		container_of(work, struct rt711_priv, calibration_work);
+
+	rt711_calibration(rt711);
+}
+
+int rt711_init(struct device *dev, struct regmap *sdw_regmap,
+			struct regmap *regmap, struct sdw_slave *slave)
+{
+	struct rt711_priv *rt711;
+	int ret;
+
+	rt711 = devm_kzalloc(dev, sizeof(*rt711), GFP_KERNEL);
+	if (!rt711)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, rt711);
+	rt711->slave = slave;
+	rt711->sdw_regmap = sdw_regmap;
+	rt711->regmap = regmap;
+
+	/*
+	 * Mark hw_init to false
+	 * HW init will be performed when device reports present
+	 */
+	rt711->hw_init = false;
+	rt711->first_hw_init = false;
+
+	/* JD source uses JD2 in default */
+	rt711->jd_src = RT711_JD2;
+
+	ret =  devm_snd_soc_register_component(dev,
+				&soc_codec_dev_rt711,
+				rt711_dai,
+				ARRAY_SIZE(rt711_dai));
+
+	dev_dbg(&slave->dev, "%s\n", __func__);
+
+	return ret;
+}
+
+int rt711_io_init(struct device *dev, struct sdw_slave *slave)
+{
+	struct rt711_priv *rt711 = dev_get_drvdata(dev);
+
+	if (rt711->hw_init)
+		return 0;
+
+	if (rt711->first_hw_init) {
+		regcache_cache_only(rt711->regmap, false);
+		regcache_cache_bypass(rt711->regmap, true);
+	}
+
+	/*
+	 * PM runtime is only enabled when a Slave reports as Attached
+	 */
+	if (!rt711->first_hw_init) {
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
+	rt711_reset(rt711->regmap);
+
+	/* power on */
+	regmap_write(rt711->regmap, RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
+
+	/* Set Pin Widget */
+	regmap_write(rt711->regmap, RT711_SET_PIN_MIC2, 0x25);
+	regmap_write(rt711->regmap, RT711_SET_PIN_HP, 0xc0);
+	regmap_write(rt711->regmap, RT711_SET_PIN_DMIC1, 0x20);
+	regmap_write(rt711->regmap, RT711_SET_PIN_DMIC2, 0x20);
+	regmap_write(rt711->regmap, RT711_SET_PIN_LINE1, 0x20);
+	regmap_write(rt711->regmap, RT711_SET_PIN_LINE2, 0x20);
+
+	/* Mute HP/ADC1/ADC2 */
+	regmap_write(rt711->regmap, RT711_SET_GAIN_HP_H, 0xa080);
+	regmap_write(rt711->regmap, RT711_SET_GAIN_HP_H, 0x9080);
+	regmap_write(rt711->regmap, RT711_SET_GAIN_ADC2_H, 0x6080);
+	regmap_write(rt711->regmap, RT711_SET_GAIN_ADC2_H, 0x5080);
+	regmap_write(rt711->regmap, RT711_SET_GAIN_ADC1_H, 0x6080);
+	regmap_write(rt711->regmap, RT711_SET_GAIN_ADC1_H, 0x5080);
+
+	/* Set Configuration Default */
+	regmap_write(rt711->regmap, 0x4f12, 0x91);
+	regmap_write(rt711->regmap, 0x4e12, 0xd6);
+	regmap_write(rt711->regmap, 0x4d12, 0x11);
+	regmap_write(rt711->regmap, 0x4c12, 0x20);
+	regmap_write(rt711->regmap, 0x4f13, 0x91);
+	regmap_write(rt711->regmap, 0x4e13, 0xd6);
+	regmap_write(rt711->regmap, 0x4d13, 0x11);
+	regmap_write(rt711->regmap, 0x4c13, 0x21);
+	regmap_write(rt711->regmap, 0x4c21, 0xf0);
+	regmap_write(rt711->regmap, 0x4d21, 0x11);
+	regmap_write(rt711->regmap, 0x4e21, 0x11);
+	regmap_write(rt711->regmap, 0x4f21, 0x01);
+
+	/* Data port arrangement */
+	rt711_index_write(rt711->regmap, RT711_VENDOR_REG,
+		RT711_TX_RX_MUX_CTL, 0x0154);
+
+	/* Set index */
+	rt711_index_write(rt711->regmap, RT711_VENDOR_REG,
+		RT711_DIGITAL_MISC_CTRL4, 0x201b);
+	rt711_index_write(rt711->regmap, RT711_VENDOR_REG,
+		RT711_COMBO_JACK_AUTO_CTL1, 0x5089);
+	rt711_index_write(rt711->regmap, RT711_VENDOR_REG,
+		RT711_VREFOUT_CTL, 0x5064);
+	rt711_index_write(rt711->regmap, RT711_VENDOR_REG,
+		RT711_INLINE_CMD_CTL, 0xd249);
+
+	/* Finish Initial Settings, set power to D3 */
+	regmap_write(rt711->regmap, RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
+
+	if (rt711->first_hw_init)
+		rt711_calibration(rt711);
+	else {
+		INIT_DELAYED_WORK(&rt711->jack_detect_work,
+			rt711_jack_detect_handler);
+		INIT_DELAYED_WORK(&rt711->jack_btn_check_work,
+			rt711_btn_check_handler);
+		mutex_init(&rt711->calibrate_mutex);
+		INIT_WORK(&rt711->calibration_work, rt711_calibration_work);
+		schedule_work(&rt711->calibration_work);
+	}
+
+	/*
+	 * if set_jack callback occurred early than io_init,
+	 * we set up the jack detection function now
+	 */
+	if (rt711->hs_jack)
+		rt711_jack_init(rt711);
+
+	if (rt711->first_hw_init) {
+		regcache_cache_bypass(rt711->regmap, false);
+		regcache_mark_dirty(rt711->regmap);
+	} else
+		rt711->first_hw_init = true;
+
+	/* Mark Slave initialization complete */
+	rt711->hw_init = true;
+
+	pm_runtime_mark_last_busy(&slave->dev);
+	pm_runtime_put_autosuspend(&slave->dev);
+
+	dev_dbg(&slave->dev, "%s hw_init complete\n", __func__);
+	return 0;
+}
+
+MODULE_DESCRIPTION("ASoC RT711 SDW driver");
+MODULE_AUTHOR("Shuming Fan <shumingf@realtek.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/rt711.h b/sound/soc/codecs/rt711.h
new file mode 100644
index 000000000000..ca0f581feec7
--- /dev/null
+++ b/sound/soc/codecs/rt711.h
@@ -0,0 +1,227 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * rt711.h -- RT711 ALSA SoC audio driver header
+ *
+ * Copyright(c) 2019 Realtek Semiconductor Corp.
+ */
+
+#ifndef __RT711_H__
+#define __RT711_H__
+
+extern const struct dev_pm_ops rt711_runtime_pm;
+
+struct  rt711_priv {
+	struct regmap *regmap;
+	struct regmap *sdw_regmap;
+	struct snd_soc_component *component;
+	struct sdw_slave *slave;
+	enum sdw_slave_status status;
+	struct sdw_bus_params params;
+	bool hw_init;
+	bool first_hw_init;
+	struct snd_soc_jack *hs_jack;
+	struct delayed_work jack_detect_work;
+	struct delayed_work jack_btn_check_work;
+	struct work_struct calibration_work;
+	struct mutex calibrate_mutex; /* for headset calibration */
+	int jack_type, jd_src;
+};
+
+struct sdw_stream_data {
+	struct sdw_stream_runtime *sdw_stream;
+};
+
+/* NID */
+#define RT711_AUDIO_FUNCTION_GROUP			0x01
+#define RT711_DAC_OUT2					0x03
+#define RT711_ADC_IN1					0x09
+#define RT711_ADC_IN2					0x08
+#define RT711_DMIC1					0x12
+#define RT711_DMIC2					0x13
+#define RT711_MIC2					0x19
+#define RT711_LINE1					0x1a
+#define RT711_LINE2					0x1b
+#define RT711_BEEP					0x1d
+#define RT711_VENDOR_REG				0x20
+#define RT711_HP_OUT					0x21
+#define RT711_MIXER_IN1					0x22
+#define RT711_MIXER_IN2					0x23
+#define RT711_INLINE_CMD				0x55
+#define RT711_VENDOR_CALI				0x58
+#define RT711_VENDOR_IMS_DRE			0x5b
+
+/* Index (NID:20h) */
+#define RT711_DAC_DC_CALI_CTL1				0x00
+#define RT711_JD_CTL2				0x09
+#define RT711_CC_DET1				0x11
+#define RT711_PARA_VERB_CTL				0x1a
+#define RT711_COMBO_JACK_AUTO_CTL1				0x45
+#define RT711_COMBO_JACK_AUTO_CTL2				0x46
+#define RT711_INLINE_CMD_CTL				0x48
+#define RT711_DIGITAL_MISC_CTRL4			0x4a
+#define RT711_VREFOUT_CTL				0x6b
+#define RT711_FSM_CTL				0x6f
+#define RT711_IRQ_FLAG_TABLE1				0x80
+#define RT711_IRQ_FLAG_TABLE2				0x81
+#define RT711_IRQ_FLAG_TABLE3				0x82
+#define RT711_TX_RX_MUX_CTL				0x91
+
+/* Index (NID:5bh) */
+#define RT711_IMS_DIGITAL_CTL1				0x00
+#define RT711_HP_IMS_RESULT_L				0x20
+#define RT711_HP_IMS_RESULT_R				0x21
+
+/* Verb */
+#define RT711_VERB_SET_CONNECT_SEL			0x3100
+#define RT711_VERB_SET_EAPD_BTLENABLE			0x3c00
+#define RT711_VERB_GET_CONNECT_SEL			0xb100
+#define RT711_VERB_SET_POWER_STATE			0x3500
+#define RT711_VERB_SET_CHANNEL_STREAMID			0x3600
+#define RT711_VERB_SET_PIN_WIDGET_CONTROL		0x3700
+#define RT711_VERB_SET_UNSOLICITED_ENABLE		0x3800
+#define RT711_SET_AMP_GAIN_MUTE_H			0x7300
+#define RT711_SET_AMP_GAIN_MUTE_L			0x8380
+#define RT711_VERB_GET_POWER_STATE			0xb500
+#define RT711_VERB_GET_CHANNEL_STREAMID			0xb600
+#define RT711_VERB_GET_PIN_SENSE			0xb900
+#define RT711_FUNC_RESET			0xff01
+
+#define RT711_READ_HDA_3				0x2012
+#define RT711_READ_HDA_2				0x2013
+#define RT711_READ_HDA_1				0x2014
+#define RT711_READ_HDA_0				0x2015
+#define RT711_PRIV_INDEX_W_H				0x7500
+#define RT711_PRIV_INDEX_W_L				0x8580
+#define RT711_PRIV_DATA_W_H				0x7400
+#define RT711_PRIV_DATA_W_L				0x8480
+#define RT711_PRIV_INDEX_R_H				0x9d00
+#define RT711_PRIV_INDEX_R_L				0xad80
+#define RT711_PRIV_DATA_R_H				0x9c00
+#define RT711_PRIV_DATA_R_L				0xac80
+#define RT711_DAC_FORMAT_H				0x7203
+#define RT711_DAC_FORMAT_L				0x8283
+#define RT711_ADC1_FORMAT_H				0x7209
+#define RT711_ADC1_FORMAT_L				0x8289
+#define RT711_ADC2_FORMAT_H				0x7208
+#define RT711_ADC2_FORMAT_L				0x8288
+
+#define RT711_SET_AUDIO_POWER_STATE\
+	(RT711_VERB_SET_POWER_STATE | RT711_AUDIO_FUNCTION_GROUP)
+#define RT711_GET_AUDIO_POWER_STATE\
+		(RT711_VERB_GET_POWER_STATE | RT711_AUDIO_FUNCTION_GROUP)
+#define RT711_SET_PIN_DMIC1\
+	(RT711_VERB_SET_PIN_WIDGET_CONTROL | RT711_DMIC1)
+#define RT711_SET_PIN_DMIC2\
+	(RT711_VERB_SET_PIN_WIDGET_CONTROL | RT711_DMIC2)
+#define RT711_SET_PIN_HP\
+	(RT711_VERB_SET_PIN_WIDGET_CONTROL | RT711_HP_OUT)
+#define RT711_SET_PIN_MIC2\
+	(RT711_VERB_SET_PIN_WIDGET_CONTROL | RT711_MIC2)
+#define RT711_SET_PIN_LINE1\
+	(RT711_VERB_SET_PIN_WIDGET_CONTROL | RT711_LINE1)
+#define RT711_SET_PIN_LINE2\
+	(RT711_VERB_SET_PIN_WIDGET_CONTROL | RT711_LINE2)
+#define RT711_SET_MIC2_UNSOLICITED_ENABLE\
+	(RT711_VERB_SET_UNSOLICITED_ENABLE | RT711_MIC2)
+#define RT711_SET_HP_UNSOLICITED_ENABLE\
+	(RT711_VERB_SET_UNSOLICITED_ENABLE | RT711_HP_OUT)
+#define RT711_SET_INLINE_UNSOLICITED_ENABLE\
+	(RT711_VERB_SET_UNSOLICITED_ENABLE | RT711_INLINE_CMD)
+#define RT711_SET_STREAMID_DAC2\
+	(RT711_VERB_SET_CHANNEL_STREAMID | RT711_DAC_OUT2)
+#define RT711_SET_STREAMID_ADC1\
+	(RT711_VERB_SET_CHANNEL_STREAMID | RT711_ADC_IN1)
+#define RT711_SET_STREAMID_ADC2\
+	(RT711_VERB_SET_CHANNEL_STREAMID | RT711_ADC_IN2)
+#define RT711_GET_STREAMID_DAC2\
+	(RT711_VERB_GET_CHANNEL_STREAMID | RT711_DAC_OUT2)
+#define RT711_GET_STREAMID_ADC1\
+	(RT711_VERB_GET_CHANNEL_STREAMID | RT711_ADC_IN1)
+#define RT711_GET_STREAMID_ADC2\
+	(RT711_VERB_GET_CHANNEL_STREAMID | RT711_ADC_IN2)
+#define RT711_SET_GAIN_DAC2_L\
+	(RT711_SET_AMP_GAIN_MUTE_L | RT711_DAC_OUT2)
+#define RT711_SET_GAIN_DAC2_H\
+	(RT711_SET_AMP_GAIN_MUTE_H | RT711_DAC_OUT2)
+#define RT711_SET_GAIN_ADC1_L\
+	(RT711_SET_AMP_GAIN_MUTE_L | RT711_ADC_IN1)
+#define RT711_SET_GAIN_ADC1_H\
+	(RT711_SET_AMP_GAIN_MUTE_H | RT711_ADC_IN1)
+#define RT711_SET_GAIN_ADC2_L\
+	(RT711_SET_AMP_GAIN_MUTE_L | RT711_ADC_IN2)
+#define RT711_SET_GAIN_ADC2_H\
+	(RT711_SET_AMP_GAIN_MUTE_H | RT711_ADC_IN2)
+#define RT711_SET_GAIN_AMIC_L\
+	(RT711_SET_AMP_GAIN_MUTE_L | RT711_MIC2)
+#define RT711_SET_GAIN_AMIC_H\
+	(RT711_SET_AMP_GAIN_MUTE_H | RT711_MIC2)
+#define RT711_SET_GAIN_DMIC1_L\
+	(RT711_SET_AMP_GAIN_MUTE_L | RT711_DMIC1)
+#define RT711_SET_GAIN_DMIC1_H\
+	(RT711_SET_AMP_GAIN_MUTE_H | RT711_DMIC1)
+#define RT711_SET_GAIN_DMIC2_L\
+	(RT711_SET_AMP_GAIN_MUTE_L | RT711_DMIC2)
+#define RT711_SET_GAIN_DMIC2_H\
+	(RT711_SET_AMP_GAIN_MUTE_H | RT711_DMIC2)
+#define RT711_SET_GAIN_HP_L\
+	(RT711_SET_AMP_GAIN_MUTE_L | RT711_HP_OUT)
+#define RT711_SET_GAIN_HP_H\
+	(RT711_SET_AMP_GAIN_MUTE_H | RT711_HP_OUT)
+
+/* DAC DC offset calibration control-1 (0x00)(NID:20h) */
+#define RT711_DAC_DC_CALI_TRIGGER (0x1 << 15)
+
+/* jack detect control 2 (0x09)(NID:20h) */
+#define RT711_JD2_2PORT_200K_DECODE_HP (0x1 << 13)
+#define RT711_HP_JD_SEL_JD1 (0x0 << 1)
+#define RT711_HP_JD_SEL_JD2 (0x1 << 1)
+
+/* CC DET1 (0x11)(NID:20h) */
+#define RT711_HP_JD_FINAL_RESULT_CTL_JD12 (0x1 << 10)
+#define RT711_HP_JD_FINAL_RESULT_CTL_CCDET (0x0 << 10)
+
+/* Parameter & Verb control (0x1a)(NID:20h) */
+#define RT711_HIDDEN_REG_SW_RESET (0x1 << 14)
+
+/* combo jack auto switch control 2 (0x46)(NID:20h) */
+#define RT711_COMBOJACK_AUTO_DET_STATUS			(0x1 << 11)
+#define RT711_COMBOJACK_AUTO_DET_TRS			(0x1 << 10)
+#define RT711_COMBOJACK_AUTO_DET_CTIA			(0x1 << 9)
+#define RT711_COMBOJACK_AUTO_DET_OMTP			(0x1 << 8)
+
+/* FSM control (0x6f)(NID:20h) */
+#define RT711_CALI_CTL			(0x0 << 0)
+#define RT711_COMBOJACK_CTL			(0x1 << 0)
+#define RT711_IMS_CTL			(0x2 << 0)
+#define RT711_DEPOP_CTL			(0x3 << 0)
+
+/* Impedance Sense Digital Control 1 (0x00)(NID:5bh) */
+#define RT711_TRIGGER_IMS			(0x1 << 15)
+#define RT711_IMS_EN			(0x1 << 6)
+
+#define RT711_EAPD_HIGH					0x2
+#define RT711_EAPD_LOW					0x0
+#define RT711_MUTE_SFT					7
+/* set input/output mapping to payload[14][15] separately */
+#define RT711_DIR_IN_SFT				6
+#define RT711_DIR_OUT_SFT				7
+
+enum {
+	RT711_AIF1,
+	RT711_AIF2,
+	RT711_AIFS,
+};
+
+enum rt711_jd_src {
+	RT711_JD_NULL,
+	RT711_JD1,
+	RT711_JD2
+};
+
+int rt711_io_init(struct device *dev, struct sdw_slave *slave);
+int rt711_init(struct device *dev, struct regmap *sdw_regmap,
+	       struct regmap *regmap, struct sdw_slave *slave);
+
+int rt711_jack_detect(struct rt711_priv *rt711, bool *hp, bool *mic);
+int rt711_clock_config(struct device *dev);
+#endif /* __RT711_H__ */
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
