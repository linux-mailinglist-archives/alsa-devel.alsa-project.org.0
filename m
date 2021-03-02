Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D48C3329A21
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 11:32:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54DE316FF;
	Tue,  2 Mar 2021 11:31:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54DE316FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614681157;
	bh=18UfqcJ12giqtevrsZJ7Q/fiAK61WkkNdUpuCh2tVvc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FKNpoSoqgSJkeAhhhxL1fZ4PF/brGbq+INz5wotLnRj43Z+60378DoZmntflFBSpQ
	 SH96tv+NItmFcTSOk7hX56BSP5oe62l0dzZmk2rj2CbU4G7GKeZK0Moc55XR6gHd09
	 2OLHVtKqPfoHFuskZhC5EugUhaD26K4jrM0AzAM4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94DCEF80088;
	Tue,  2 Mar 2021 11:31:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA36AF80269; Tue,  2 Mar 2021 11:31:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3287EF80088
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 11:30:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3287EF80088
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 122AUnvG6030118,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs01.realtek.com.tw[172.21.6.94])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 122AUnvG6030118
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 2 Mar 2021 18:30:49 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 2 Mar 2021 18:30:48 +0800
From: <jack.yu@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt715-sdca: Add RT715 sdca vendor-specific driver
Date: Tue, 2 Mar 2021 18:30:42 +0800
Message-ID: <20210302103042.19528-1-jack.yu@realtek.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMBS02.realtek.com.tw (172.21.6.95) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
Cc: oder_chiou@realtek.com, Jack Yu <jack.yu@realtek.com>,
 alsa-devel@alsa-project.org, lars@metafoo.de, derek.fang@realtek.com,
 bard.liao@intel.com, shumingf@realtek.com, flove@realtek.com,
 pierre-louis.bossart@intel.com
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

This is initial sdca version of codec driver for rt715.

Signed-off-by: Jack Yu <jack.yu@realtek.com>
---
 sound/soc/codecs/Kconfig          |    7 +
 sound/soc/codecs/Makefile         |    2 +
 sound/soc/codecs/rt715-sdca-sdw.c |  278 ++++++++
 sound/soc/codecs/rt715-sdca-sdw.h |  170 +++++
 sound/soc/codecs/rt715-sdca.c     | 1076 +++++++++++++++++++++++++++++
 sound/soc/codecs/rt715-sdca.h     |  136 ++++
 6 files changed, 1669 insertions(+)
 create mode 100644 sound/soc/codecs/rt715-sdca-sdw.c
 create mode 100644 sound/soc/codecs/rt715-sdca-sdw.h
 create mode 100644 sound/soc/codecs/rt715-sdca.c
 create mode 100644 sound/soc/codecs/rt715-sdca.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index ae833a54bcb3..d4d3b4e87207 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -181,6 +181,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_RT700_SDW
 	imply SND_SOC_RT711_SDW
 	imply SND_SOC_RT715_SDW
+	imply SND_SOC_RT715_SDCA_SDW
 	imply SND_SOC_RT1308_SDW
 	imply SND_SOC_RT1316_SDW
 	imply SND_SOC_SGTL5000
@@ -1257,6 +1258,12 @@ config SND_SOC_RT715_SDW
 	select SND_SOC_RT715
 	select REGMAP_SOUNDWIRE
 
+config SND_SOC_RT715_SDCA_SDW
+	tristate "Realtek RT715 SDCA Codec - SDW"
+	depends on SOUNDWIRE
+	select REGMAP_SOUNDWIRE
+	select REGMAP_SOUNDWIRE_MBQ
+
 #Freescale sgtl5000 codec
 config SND_SOC_SGTL5000
 	tristate "Freescale SGTL5000 CODEC"
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 1585bc1d9a25..09dd9c168aac 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -198,6 +198,7 @@ snd-soc-rt5682-i2c-objs := rt5682-i2c.o
 snd-soc-rt700-objs := rt700.o rt700-sdw.o
 snd-soc-rt711-objs := rt711.o rt711-sdw.o
 snd-soc-rt715-objs := rt715.o rt715-sdw.o
+snd-soc-rt715-sdca-objs := rt715-sdca.o rt715-sdca-sdw.o
 snd-soc-sgtl5000-objs := sgtl5000.o
 snd-soc-alc5623-objs := alc5623.o
 snd-soc-alc5632-objs := alc5632.o
@@ -514,6 +515,7 @@ obj-$(CONFIG_SND_SOC_RT5682_SDW)	+= snd-soc-rt5682-sdw.o
 obj-$(CONFIG_SND_SOC_RT700)     += snd-soc-rt700.o
 obj-$(CONFIG_SND_SOC_RT711)     += snd-soc-rt711.o
 obj-$(CONFIG_SND_SOC_RT715)     += snd-soc-rt715.o
+obj-$(CONFIG_SND_SOC_RT715_SDCA_SDW)     += snd-soc-rt715-sdca.o
 obj-$(CONFIG_SND_SOC_SGTL5000)  += snd-soc-sgtl5000.o
 obj-$(CONFIG_SND_SOC_SIGMADSP)	+= snd-soc-sigmadsp.o
 obj-$(CONFIG_SND_SOC_SIGMADSP_I2C)	+= snd-soc-sigmadsp-i2c.o
diff --git a/sound/soc/codecs/rt715-sdca-sdw.c b/sound/soc/codecs/rt715-sdca-sdw.c
new file mode 100644
index 000000000000..bcced85876b0
--- /dev/null
+++ b/sound/soc/codecs/rt715-sdca-sdw.c
@@ -0,0 +1,278 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// rt715-sdca-sdw.c -- rt715 ALSA SoC audio driver
+//
+// Copyright(c) 2020 Realtek Semiconductor Corp.
+//
+//
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include <linux/soundwire/sdw_registers.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+#include "rt715-sdca.h"
+#include "rt715-sdca-sdw.h"
+
+static bool rt715_sdca_readable_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case 0x201a ... 0x2027:
+	case 0x2029 ... 0x202a:
+	case 0x202d ... 0x2034:
+	case 0x2200 ... 0x2204:
+	case 0x2206 ... 0x2212:
+	case 0x2230 ... 0x2239:
+	case 0x2f5b:
+	case SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_SMPU_TRIG_ST_EN,
+		RT715_SDCA_SMPU_TRIG_ST_CTRL, CH_00):
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool rt715_sdca_volatile_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case 0x201b:
+	case 0x201c:
+	case 0x201d:
+	case 0x201f:
+	case 0x2021:
+	case 0x2023:
+	case 0x2230:
+	case 0x202d ... 0x202f: /* BRA */
+	case 0x2200 ... 0x2212: /* i2c debug */
+	case 0x2f07:
+	case 0x2f1b ... 0x2f1e:
+	case 0x2f30 ... 0x2f34:
+	case 0x2f50 ... 0x2f51:
+	case 0x2f53 ... 0x2f59:
+	case 0x2f5c ... 0x2f5f:
+	case SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_SMPU_TRIG_ST_EN,
+		RT715_SDCA_SMPU_TRIG_ST_CTRL, CH_00): /* VAD Searching status */
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool rt715_sdca_mbq_readable_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case 0x2000000:
+	case 0x200002b:
+	case 0x2000036:
+	case 0x2000037:
+	case 0x2000039:
+	case 0x6100000:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool rt715_sdca_mbq_volatile_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case 0x2000000:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config rt715_sdca_regmap = {
+	.reg_bits = 32,
+	.val_bits = 8,
+	.readable_reg = rt715_sdca_readable_register,
+	.volatile_reg = rt715_sdca_volatile_register,
+	.max_register = 0x43ffffff,
+	.reg_defaults = rt715_reg_defaults_sdca,
+	.num_reg_defaults = ARRAY_SIZE(rt715_reg_defaults_sdca),
+	.cache_type = REGCACHE_RBTREE,
+	.use_single_read = true,
+	.use_single_write = true,
+};
+
+static const struct regmap_config rt715_sdca_mbq_regmap = {
+	.name = "sdw-mbq",
+	.reg_bits = 32,
+	.val_bits = 16,
+	.readable_reg = rt715_sdca_mbq_readable_register,
+	.volatile_reg = rt715_sdca_mbq_volatile_register,
+	.max_register = 0x43ffffff,
+	.reg_defaults = rt715_mbq_reg_defaults_sdca,
+	.num_reg_defaults = ARRAY_SIZE(rt715_mbq_reg_defaults_sdca),
+	.cache_type = REGCACHE_RBTREE,
+	.use_single_read = true,
+	.use_single_write = true,
+};
+
+static int rt715_sdca_update_status(struct sdw_slave *slave,
+				enum sdw_slave_status status)
+{
+	struct rt715_sdca_priv *rt715 = dev_get_drvdata(&slave->dev);
+
+	/* Update the status */
+	rt715->status = status;
+
+	/*
+	 * Perform initialization only if slave status is present and
+	 * hw_init flag is false
+	 */
+	if (rt715->hw_init || rt715->status != SDW_SLAVE_ATTACHED)
+		return 0;
+
+	/* perform I/O transfers required for Slave initialization */
+	return rt715_sdca_io_init(&slave->dev, slave);
+}
+
+static int rt715_sdca_read_prop(struct sdw_slave *slave)
+{
+	struct sdw_slave_prop *prop = &slave->prop;
+	int nval, i;
+	u32 bit;
+	unsigned long addr;
+	struct sdw_dpn_prop *dpn;
+
+	prop->paging_support = true;
+
+	/* first we need to allocate memory for set bits in port lists */
+	prop->source_ports = 0x50;/* BITMAP: 01010000 */
+	prop->sink_ports = 0x0;	/* BITMAP:  00000000 */
+
+	nval = hweight32(prop->source_ports);
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
+	/* set the timeout values */
+	prop->clk_stop_timeout = 20;
+
+	return 0;
+}
+
+static struct sdw_slave_ops rt715_sdca_slave_ops = {
+	.read_prop = rt715_sdca_read_prop,
+	.update_status = rt715_sdca_update_status,
+};
+
+static int rt715_sdca_sdw_probe(struct sdw_slave *slave,
+			   const struct sdw_device_id *id)
+{
+	struct regmap *mbq_regmap, *regmap;
+
+	slave->ops = &rt715_sdca_slave_ops;
+
+	/* Regmap Initialization */
+	mbq_regmap = devm_regmap_init_sdw_mbq(slave, &rt715_sdca_mbq_regmap);
+	if (!mbq_regmap)
+		return -EINVAL;
+
+	regmap = devm_regmap_init_sdw(slave, &rt715_sdca_regmap);
+	if (!regmap)
+		return -EINVAL;
+
+	return rt715_sdca_init(&slave->dev, mbq_regmap, regmap, slave);
+}
+
+static const struct sdw_device_id rt715_sdca_id[] = {
+	SDW_SLAVE_ENTRY_EXT(0x025d, 0x715, 0x3, 0x1, 0),
+	SDW_SLAVE_ENTRY_EXT(0x025d, 0x714, 0x3, 0x1, 0),
+	{},
+};
+MODULE_DEVICE_TABLE(sdw, rt715_sdca_id);
+
+static int __maybe_unused rt715_dev_suspend(struct device *dev)
+{
+	struct rt715_sdca_priv *rt715 = dev_get_drvdata(dev);
+
+	if (!rt715->hw_init)
+		return 0;
+
+	regcache_cache_only(rt715->regmap, true);
+	regcache_mark_dirty(rt715->regmap);
+	regcache_cache_only(rt715->mbq_regmap, true);
+	regcache_mark_dirty(rt715->mbq_regmap);
+
+	return 0;
+}
+
+#define RT715_PROBE_TIMEOUT 5000
+
+static int __maybe_unused rt715_dev_resume(struct device *dev)
+{
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	struct rt715_sdca_priv *rt715 = dev_get_drvdata(dev);
+	unsigned long time;
+
+	if (!rt715->hw_init)
+		return 0;
+
+	if (!slave->unattach_request)
+		goto regmap_sync;
+
+	time = wait_for_completion_timeout(&slave->enumeration_complete,
+					   msecs_to_jiffies(RT715_PROBE_TIMEOUT));
+	if (!time) {
+		dev_err(&slave->dev, "Enumeration not complete, timed out\n");
+		return -ETIMEDOUT;
+	}
+
+regmap_sync:
+	slave->unattach_request = 0;
+	regcache_cache_only(rt715->regmap, false);
+	regcache_sync_region(rt715->regmap,
+		SDW_SDCA_CTL(FUN_JACK_CODEC, RT715_SDCA_ST_EN, RT715_SDCA_ST_CTRL,
+			CH_00),
+		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_SMPU_TRIG_ST_EN,
+			RT715_SDCA_SMPU_TRIG_ST_CTRL, CH_00));
+	regcache_cache_only(rt715->mbq_regmap, false);
+	regcache_sync_region(rt715->mbq_regmap, 0x2000000, 0x61020ff);
+	regcache_sync_region(rt715->mbq_regmap,
+		SDW_SDCA_CTL(FUN_JACK_CODEC, RT715_SDCA_ST_EN, RT715_SDCA_ST_CTRL,
+			CH_00),
+		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_SMPU_TRIG_ST_EN,
+			RT715_SDCA_SMPU_TRIG_ST_CTRL, CH_00));
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
+		.name = "rt715-sdca",
+		.owner = THIS_MODULE,
+		.pm = &rt715_pm,
+	},
+	.probe = rt715_sdca_sdw_probe,
+	.ops = &rt715_sdca_slave_ops,
+	.id_table = rt715_sdca_id,
+};
+module_sdw_driver(rt715_sdw_driver);
+
+MODULE_DESCRIPTION("ASoC RT715 driver SDW SDCA");
+MODULE_AUTHOR("Jack Yu <jack.yu@realtek.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/rt715-sdca-sdw.h b/sound/soc/codecs/rt715-sdca-sdw.h
new file mode 100644
index 000000000000..cd365bb60747
--- /dev/null
+++ b/sound/soc/codecs/rt715-sdca-sdw.h
@@ -0,0 +1,170 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * rt715-sdca-sdw.h -- RT715 ALSA SoC audio driver header
+ *
+ * Copyright(c) 2020 Realtek Semiconductor Corp.
+ */
+
+#ifndef __RT715_SDW_SDCA_H__
+#define __RT715_SDW_SDCA_H__
+
+#include <linux/soundwire/sdw_registers.h>
+
+static const struct reg_default rt715_reg_defaults_sdca[] = {
+	{ 0x201a, 0x00 },
+	{ 0x201e, 0x00 },
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
+	{ 0x2f03, 0x0b },
+	{ 0x2f04, 0x00 },
+	{ 0x2f05, 0x0e },
+	{ 0x2f06, 0x01 },
+	{ 0x2f08, 0x00 },
+	{ 0x2f09, 0x00 },
+	{ 0x2f0a, 0x00 },
+	{ 0x2f0b, 0x00 },
+	{ 0x2f0c, 0x00 },
+	{ 0x2f0d, 0x00 },
+	{ 0x2f0e, 0x12 },
+	{ 0x2f0f, 0x00 },
+	{ 0x2f10, 0x00 },
+	{ 0x2f11, 0x00 },
+	{ 0x2f12, 0x00 },
+	{ 0x2f13, 0x00 },
+	{ 0x2f14, 0x00 },
+	{ 0x2f15, 0x00 },
+	{ 0x2f16, 0x00 },
+	{ 0x2f17, 0x00 },
+	{ 0x2f18, 0x00 },
+	{ 0x2f19, 0x03 },
+	{ 0x2f1a, 0x00 },
+	{ 0x2f1f, 0x10 },
+	{ 0x2f20, 0x00 },
+	{ 0x2f21, 0x00 },
+	{ 0x2f22, 0x00 },
+	{ 0x2f23, 0x00 },
+	{ 0x2f24, 0x00 },
+	{ 0x2f25, 0x00 },
+	{ 0x2f52, 0x01 },
+	{ 0x2f5a, 0x02 },
+	{ 0x2f5b, 0x05 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_CX_CLK_SEL_EN,
+		RT715_SDCA_CX_CLK_SEL_CTRL, CH_00), 0x1 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC8_9_VOL,
+		RT715_SDCA_FU_MUTE_CTRL, CH_01), 0x01 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC8_9_VOL,
+		RT715_SDCA_FU_MUTE_CTRL, CH_02), 0x01 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC8_9_VOL,
+		RT715_SDCA_FU_MUTE_CTRL, CH_03), 0x01 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC8_9_VOL,
+		RT715_SDCA_FU_MUTE_CTRL, CH_04), 0x01 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC10_11_VOL,
+		RT715_SDCA_FU_MUTE_CTRL, CH_01), 0x01 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC10_11_VOL,
+		RT715_SDCA_FU_MUTE_CTRL, CH_02), 0x01 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC10_11_VOL,
+		RT715_SDCA_FU_MUTE_CTRL, CH_03), 0x01 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC10_11_VOL,
+		RT715_SDCA_FU_MUTE_CTRL, CH_04), 0x01 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC7_27_VOL,
+		RT715_SDCA_FU_MUTE_CTRL, CH_01), 0x01 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC7_27_VOL,
+		RT715_SDCA_FU_MUTE_CTRL, CH_02), 0x01 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_SMPU_TRIG_ST_EN,
+		RT715_SDCA_SMPU_TRIG_EN_CTRL, CH_00), 0x02 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_SMPU_TRIG_ST_EN,
+		RT715_SDCA_SMPU_TRIG_ST_CTRL, CH_00), 0x00 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC7_27_VOL,
+		RT715_SDCA_FU_MUTE_CTRL, CH_01), 0x01 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC7_27_VOL,
+		RT715_SDCA_FU_MUTE_CTRL, CH_02), 0x01 },
+};
+
+static const struct reg_default rt715_mbq_reg_defaults_sdca[] = {
+	{ 0x200002b, 0x0420 },
+	{ 0x2000036, 0x0000 },
+	{ 0x2000037, 0x0000 },
+	{ 0x2000039, 0xaa81 },
+	{ 0x6100000, 0x0100 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC8_9_VOL,
+		RT715_SDCA_FU_VOL_CTRL, CH_01), 0x00 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC8_9_VOL,
+		RT715_SDCA_FU_VOL_CTRL, CH_02), 0x00 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC8_9_VOL,
+		RT715_SDCA_FU_VOL_CTRL, CH_03), 0x00 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC8_9_VOL,
+		RT715_SDCA_FU_VOL_CTRL, CH_04), 0x00 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC10_11_VOL,
+		RT715_SDCA_FU_VOL_CTRL, CH_01), 0x00 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC10_11_VOL,
+		RT715_SDCA_FU_VOL_CTRL, CH_02), 0x00 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC10_11_VOL,
+		RT715_SDCA_FU_VOL_CTRL, CH_03), 0x00 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC10_11_VOL,
+		RT715_SDCA_FU_VOL_CTRL, CH_04), 0x00 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC7_27_VOL,
+		RT715_SDCA_FU_VOL_CTRL, CH_01), 0x00 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC7_27_VOL,
+		RT715_SDCA_FU_VOL_CTRL, CH_02), 0x00 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_AMIC_GAIN_EN,
+		RT715_SDCA_FU_DMIC_GAIN_CTRL, CH_01), 0x00 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_AMIC_GAIN_EN,
+		RT715_SDCA_FU_DMIC_GAIN_CTRL, CH_02), 0x00 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_AMIC_GAIN_EN,
+		RT715_SDCA_FU_DMIC_GAIN_CTRL, CH_03), 0x00 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_AMIC_GAIN_EN,
+		RT715_SDCA_FU_DMIC_GAIN_CTRL, CH_04), 0x00 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_AMIC_GAIN_EN,
+		RT715_SDCA_FU_DMIC_GAIN_CTRL, CH_05), 0x00 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_AMIC_GAIN_EN,
+		RT715_SDCA_FU_DMIC_GAIN_CTRL, CH_06), 0x00 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_AMIC_GAIN_EN,
+		RT715_SDCA_FU_DMIC_GAIN_CTRL, CH_07), 0x00 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_AMIC_GAIN_EN,
+		RT715_SDCA_FU_DMIC_GAIN_CTRL, CH_08), 0x00 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_DMIC_GAIN_EN,
+		RT715_SDCA_FU_DMIC_GAIN_CTRL, CH_01), 0x00 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_DMIC_GAIN_EN,
+		RT715_SDCA_FU_DMIC_GAIN_CTRL, CH_02), 0x00 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_DMIC_GAIN_EN,
+		RT715_SDCA_FU_DMIC_GAIN_CTRL, CH_03), 0x00 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_DMIC_GAIN_EN,
+		RT715_SDCA_FU_DMIC_GAIN_CTRL, CH_04), 0x00 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_DMIC_GAIN_EN,
+		RT715_SDCA_FU_DMIC_GAIN_CTRL, CH_05), 0x00 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_DMIC_GAIN_EN,
+		RT715_SDCA_FU_DMIC_GAIN_CTRL, CH_06), 0x00 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_DMIC_GAIN_EN,
+		RT715_SDCA_FU_DMIC_GAIN_CTRL, CH_07), 0x00 },
+	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_DMIC_GAIN_EN,
+		RT715_SDCA_FU_DMIC_GAIN_CTRL, CH_08), 0x00 },
+};
+#endif /* __RT715_SDW_SDCA_H__ */
diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
new file mode 100644
index 000000000000..92ad6fa408ec
--- /dev/null
+++ b/sound/soc/codecs/rt715-sdca.c
@@ -0,0 +1,1076 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// rt715-sdca.c -- rt715 ALSA SoC audio driver
+//
+// Copyright(c) 2020 Realtek Semiconductor Corp.
+//
+//
+//
+
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/version.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/pm_runtime.h>
+#include <linux/pm.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <sound/initval.h>
+#include <sound/tlv.h>
+#include <linux/soundwire/sdw_registers.h>
+
+#include "rt715-sdca.h"
+
+static int rt715_sdca_index_write(struct rt715_sdca_priv *rt715,
+		unsigned int nid, unsigned int reg, unsigned int value)
+{
+	struct regmap *regmap = rt715->mbq_regmap;
+	unsigned int addr;
+	int ret;
+
+	addr = (nid << 20) | reg;
+
+	ret = regmap_write(regmap, addr, value);
+	if (ret < 0)
+		dev_err(&rt715->slave->dev,
+				"Failed to set private value: %08x <= %04x %d\n", ret, addr,
+				value);
+
+	return ret;
+}
+
+static int rt715_sdca_index_read(struct rt715_sdca_priv *rt715,
+		unsigned int nid, unsigned int reg, unsigned int *value)
+{
+	struct regmap *regmap = rt715->mbq_regmap;
+	unsigned int addr;
+	int ret;
+
+	addr = (nid << 20) | reg;
+
+	ret = regmap_read(regmap, addr, value);
+	if (ret < 0)
+		dev_err(&rt715->slave->dev,
+				"Failed to get private value: %06x => %04x ret=%d\n",
+				addr, *value, ret);
+
+	return ret;
+}
+
+static int rt715_sdca_index_update_bits(struct rt715_sdca_priv *rt715,
+	unsigned int nid, unsigned int reg, unsigned int mask, unsigned int val)
+{
+	unsigned int tmp;
+	int ret;
+
+	ret = rt715_sdca_index_read(rt715, nid, reg, &tmp);
+	if (ret < 0)
+		return ret;
+
+	set_mask_bits(&tmp, mask, val);
+
+	return rt715_sdca_index_write(rt715, nid, reg, tmp);
+}
+
+static inline unsigned int rt715_sdca_vol_gain(unsigned int u_ctrl_val,
+		unsigned int vol_max, unsigned int vol_gain_sft)
+{
+	unsigned int val;
+
+	if (u_ctrl_val > vol_max)
+		u_ctrl_val = vol_max;
+	val = u_ctrl_val;
+	u_ctrl_val =
+		((abs(u_ctrl_val - vol_gain_sft) * RT715_SDCA_DB_STEP) << 8) / 1000;
+	if (val <= vol_gain_sft) {
+		u_ctrl_val = ~u_ctrl_val;
+		u_ctrl_val += 1;
+	}
+	u_ctrl_val &= 0xffff;
+
+	return u_ctrl_val;
+}
+
+static inline unsigned int rt715_sdca_boost_gain(unsigned int u_ctrl_val,
+		unsigned int b_max, unsigned int b_gain_sft)
+{
+	if (u_ctrl_val > b_max)
+		u_ctrl_val = b_max;
+
+	return (u_ctrl_val * 10) << b_gain_sft;
+}
+
+static inline unsigned int rt715_sdca_get_gain(unsigned int reg_val,
+		unsigned int gain_sft)
+{
+	unsigned int neg_flag = 0;
+
+	if (reg_val & BIT(15)) {
+		reg_val = ~(reg_val - 1) & 0xffff;
+		neg_flag = 1;
+	}
+	reg_val *= 1000;
+	reg_val >>= 8;
+	if (neg_flag)
+		reg_val = gain_sft - reg_val / RT715_SDCA_DB_STEP;
+	else
+		reg_val = gain_sft + reg_val / RT715_SDCA_DB_STEP;
+
+	return reg_val;
+}
+
+/* SDCA Volume/Boost control */
+static int rt715_sdca_set_amp_gain_put(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct rt715_sdca_priv *rt715 = snd_soc_component_get_drvdata(component);
+	unsigned int gain_val, i, k_changed = 0;
+	int ret;
+
+	for (i = 0; i < 2; i++) {
+		if (ucontrol->value.integer.value[i] != rt715->kctl_2ch_orig[i]) {
+			k_changed = 1;
+			break;
+		}
+	}
+
+	for (i = 0; i < 2; i++) {
+		rt715->kctl_2ch_orig[i] = ucontrol->value.integer.value[i];
+		gain_val =
+			rt715_sdca_vol_gain(ucontrol->value.integer.value[i], mc->max,
+				mc->shift);
+		ret = regmap_write(rt715->mbq_regmap, mc->reg + i, gain_val);
+		if (ret != 0) {
+			dev_err(component->dev, "Failed to write 0x%x=0x%x\n",
+				mc->reg + i, gain_val);
+			return ret;
+		}
+	}
+
+	return k_changed;
+}
+
+static int rt715_sdca_set_amp_gain_4ch_put(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt715_sdca_priv *rt715 = snd_soc_component_get_drvdata(component);
+	struct rt715_sdca_kcontrol_private *p =
+		(struct rt715_sdca_kcontrol_private *)kcontrol->private_value;
+	unsigned int reg_base = p->reg_base, k_changed = 0;
+	const unsigned int gain_sft = 0x2f;
+	unsigned int gain_val, i;
+	int ret;
+
+	for (i = 0; i < 4; i++) {
+		if (ucontrol->value.integer.value[i] != rt715->kctl_4ch_orig[i]) {
+			k_changed = 1;
+			break;
+		}
+	}
+
+	for (i = 0; i < 4; i++) {
+		rt715->kctl_4ch_orig[i] = ucontrol->value.integer.value[i];
+		gain_val =
+			rt715_sdca_vol_gain(ucontrol->value.integer.value[i], p->max,
+				gain_sft);
+		ret = regmap_write(rt715->mbq_regmap, reg_base + i,
+				gain_val);
+		if (ret != 0) {
+			dev_err(component->dev, "Failed to write 0x%x=0x%x\n",
+				reg_base + i, gain_val);
+			return ret;
+		}
+	}
+
+	return k_changed;
+}
+
+static int rt715_sdca_set_amp_gain_8ch_put(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt715_sdca_priv *rt715 = snd_soc_component_get_drvdata(component);
+	struct rt715_sdca_kcontrol_private *p =
+		(struct rt715_sdca_kcontrol_private *)kcontrol->private_value;
+	unsigned int reg_base = p->reg_base, i, k_changed = 0;
+	const unsigned int gain_sft = 8;
+	unsigned int gain_val, reg;
+	int ret;
+
+	for (i = 0; i < 8; i++) {
+		if (ucontrol->value.integer.value[i] != rt715->kctl_8ch_orig[i]) {
+			k_changed = 1;
+			break;
+		}
+	}
+
+	for (i = 0; i < 8; i++) {
+		rt715->kctl_8ch_orig[i] = ucontrol->value.integer.value[i];
+		gain_val =
+			rt715_sdca_boost_gain(ucontrol->value.integer.value[i], p->max,
+				gain_sft);
+		reg = i < 7 ? reg_base + i : (reg_base - 1) | BIT(15);
+		ret = regmap_write(rt715->mbq_regmap, reg, gain_val);
+		if (ret != 0) {
+			dev_err(component->dev, "Failed to write 0x%x=0x%x\n",
+				reg, gain_val);
+			return ret;
+		}
+	}
+
+	return k_changed;
+}
+
+static int rt715_sdca_set_amp_gain_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct rt715_sdca_priv *rt715 = snd_soc_component_get_drvdata(component);
+	unsigned int val, i;
+	int ret;
+
+	for (i = 0; i < 2; i++) {
+		ret = regmap_read(rt715->mbq_regmap, mc->reg + i, &val);
+		if (ret < 0) {
+			dev_err(component->dev, "Failed to read 0x%x, ret=%d\n",
+				mc->reg + i, ret);
+			return ret;
+		}
+		ucontrol->value.integer.value[i] = rt715_sdca_get_gain(val, mc->shift);
+	}
+
+	return 0;
+}
+
+static int rt715_sdca_set_amp_gain_4ch_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt715_sdca_priv *rt715 = snd_soc_component_get_drvdata(component);
+	struct rt715_sdca_kcontrol_private *p =
+		(struct rt715_sdca_kcontrol_private *)kcontrol->private_value;
+	unsigned int reg_base = p->reg_base, i;
+	const unsigned int gain_sft = 0x2f;
+	unsigned int val;
+	int ret;
+
+	for (i = 0; i < 4; i++) {
+		ret = regmap_read(rt715->mbq_regmap, reg_base + i, &val);
+		if (ret < 0) {
+			dev_err(component->dev, "Failed to read 0x%x, ret=%d\n",
+				reg_base + i, ret);
+			return ret;
+		}
+		ucontrol->value.integer.value[i] = rt715_sdca_get_gain(val, gain_sft);
+	}
+
+	return 0;
+}
+
+static int rt715_sdca_set_amp_gain_8ch_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt715_sdca_priv *rt715 = snd_soc_component_get_drvdata(component);
+	struct rt715_sdca_kcontrol_private *p =
+		(struct rt715_sdca_kcontrol_private *)kcontrol->private_value;
+	unsigned int reg_base = p->reg_base;
+	const unsigned int gain_sft = 8;
+	unsigned int val_l, val_r;
+	unsigned int i, reg;
+	int ret;
+
+	for (i = 0; i < 8; i += 2) {
+		ret = regmap_read(rt715->mbq_regmap, reg_base + i, &val_l);
+		if (ret < 0) {
+			dev_err(component->dev, "Failed to read 0x%x, ret=%d\n",
+					reg_base + i, ret);
+			return ret;
+		}
+		ucontrol->value.integer.value[i] = (val_l >> gain_sft) / 10;
+
+		reg = (i == 6) ? (reg_base - 1) | BIT(15) : reg_base + 1 + i;
+		ret = regmap_read(rt715->mbq_regmap, reg, &val_r);
+		if (ret < 0) {
+			dev_err(component->dev, "Failed to read 0x%x, ret=%d\n",
+					reg, ret);
+			return ret;
+		}
+		ucontrol->value.integer.value[i + 1] = (val_r >> gain_sft) / 10;
+	}
+
+	return 0;
+}
+
+static const DECLARE_TLV_DB_SCALE(in_vol_tlv, -17625, 375, 0);
+static const DECLARE_TLV_DB_SCALE(mic_vol_tlv, 0, 1000, 0);
+
+static int rt715_sdca_get_volsw(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt715_sdca_kcontrol_private *p =
+		(struct rt715_sdca_kcontrol_private *)kcontrol->private_value;
+	unsigned int reg_base = p->reg_base;
+	unsigned int invert = p->invert, i;
+	int val;
+
+	for (i = 0; i < p->count; i += 2) {
+		val = snd_soc_component_read(component, reg_base + i);
+		if (val < 0)
+			return -EINVAL;
+		ucontrol->value.integer.value[i] = invert ? p->max - val : val;
+
+		val = snd_soc_component_read(component, reg_base + 1 + i);
+		if (val < 0)
+			return -EINVAL;
+		ucontrol->value.integer.value[i + 1] =
+			invert ? p->max - val : val;
+	}
+
+	return 0;
+}
+
+static int rt715_sdca_put_volsw(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt715_sdca_priv *rt715 = snd_soc_component_get_drvdata(component);
+	struct rt715_sdca_kcontrol_private *p =
+		(struct rt715_sdca_kcontrol_private *)kcontrol->private_value;
+	unsigned int val[4] = {0}, val_mask, i, k_changed = 0;
+	unsigned int reg = p->reg_base;
+	unsigned int shift = p->shift;
+	unsigned int max = p->max;
+	unsigned int mask = (1 << fls(max)) - 1;
+	unsigned int invert = p->invert;
+	int err;
+
+	for (i = 0; i < 4; i++) {
+		if (ucontrol->value.integer.value[i] != rt715->kctl_switch_orig[i]) {
+			k_changed = 1;
+			break;
+		}
+	}
+
+	for (i = 0; i < 2; i++) {
+		rt715->kctl_switch_orig[i * 2] = ucontrol->value.integer.value[i * 2];
+		val[i * 2] = ucontrol->value.integer.value[i * 2] & mask;
+		if (invert)
+			val[i * 2] = max - val[i * 2];
+		val_mask = mask << shift;
+		val[i * 2] <<= shift;
+
+		rt715->kctl_switch_orig[i * 2 + 1] =
+			ucontrol->value.integer.value[i * 2 + 1];
+		val[i * 2 + 1] =
+			ucontrol->value.integer.value[i * 2 + 1] & mask;
+		if (invert)
+			val[i * 2 + 1] = max - val[i * 2 + 1];
+
+		val[i * 2 + 1] <<=  shift;
+
+		err = snd_soc_component_update_bits(component, reg + i * 2, val_mask,
+				val[i * 2]);
+		if (err < 0)
+			return err;
+
+		err = snd_soc_component_update_bits(component, reg + 1 + i * 2,
+			val_mask, val[i * 2 + 1]);
+		if (err < 0)
+			return err;
+	}
+
+	return k_changed;
+}
+
+static int rt715_sdca_fu_info(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_info *uinfo)
+{
+	struct rt715_sdca_kcontrol_private *p =
+		(struct rt715_sdca_kcontrol_private *)kcontrol->private_value;
+
+	if (p->max == 1)
+		uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
+	else
+		uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = p->count;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = p->max;
+	return 0;
+}
+
+#define RT715_SDCA_PR_VALUE(xreg_base, xcount, xmax, xshift, xinvert) \
+	((unsigned long)&(struct rt715_sdca_kcontrol_private) \
+		{.reg_base = xreg_base, .count = xcount, .max = xmax, \
+		.shift = xshift, .invert = xinvert})
+
+#define RT715_SDCA_FU_CTRL(xname, reg_base, xshift, xmax, xinvert, xcount) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
+	.info = rt715_sdca_fu_info, \
+	.get = rt715_sdca_get_volsw, \
+	.put = rt715_sdca_put_volsw, \
+	.private_value = RT715_SDCA_PR_VALUE(reg_base, xcount, xmax, \
+					xshift, xinvert)}
+
+#define SOC_DOUBLE_R_EXT(xname, reg_left, reg_right, xshift, xmax, xinvert,\
+	 xhandler_get, xhandler_put) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
+	.info = snd_soc_info_volsw, \
+	.get = xhandler_get, .put = xhandler_put, \
+	.private_value = SOC_DOUBLE_R_VALUE(reg_left, reg_right, xshift, \
+					    xmax, xinvert) }
+
+#define RT715_SDCA_EXT_TLV(xname, reg_base, xhandler_get,\
+	 xhandler_put, tlv_array, xcount, xmax) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
+	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
+		 SNDRV_CTL_ELEM_ACCESS_READWRITE, \
+	.tlv.p = (tlv_array), \
+	.info = rt715_sdca_fu_info, \
+	.get = xhandler_get, .put = xhandler_put, \
+	.private_value = RT715_SDCA_PR_VALUE(reg_base, xcount, xmax, 0, 0) }
+
+#define RT715_SDCA_BOOST_EXT_TLV(xname, reg_base, xhandler_get,\
+	 xhandler_put, tlv_array, xcount, xmax) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
+	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
+		 SNDRV_CTL_ELEM_ACCESS_READWRITE, \
+	.tlv.p = (tlv_array), \
+	.info = rt715_sdca_fu_info, \
+	.get = xhandler_get, .put = xhandler_put, \
+	.private_value = RT715_SDCA_PR_VALUE(reg_base, xcount, xmax, 0, 0) }
+
+static const struct snd_kcontrol_new rt715_sdca_snd_controls[] = {
+	/* Capture switch */
+	SOC_DOUBLE_R("FU0A Capture Switch",
+		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC7_27_VOL,
+			RT715_SDCA_FU_MUTE_CTRL, CH_01),
+		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC7_27_VOL,
+			RT715_SDCA_FU_MUTE_CTRL, CH_02),
+			0, 1, 1),
+	RT715_SDCA_FU_CTRL("FU02 Capture Switch",
+		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC8_9_VOL,
+			RT715_SDCA_FU_MUTE_CTRL, CH_01),
+			0, 1, 1, 4),
+	RT715_SDCA_FU_CTRL("FU06 Capture Switch",
+		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC10_11_VOL,
+			RT715_SDCA_FU_MUTE_CTRL, CH_01),
+			0, 1, 1, 4),
+	/* Volume Control */
+	SOC_DOUBLE_R_EXT_TLV("FU0A Capture Volume",
+		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC7_27_VOL,
+			RT715_SDCA_FU_VOL_CTRL, CH_01),
+		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC7_27_VOL,
+			RT715_SDCA_FU_VOL_CTRL, CH_02),
+			0x2f, 0x7f, 0,
+		rt715_sdca_set_amp_gain_get, rt715_sdca_set_amp_gain_put,
+		in_vol_tlv),
+	RT715_SDCA_EXT_TLV("FU02 Capture Volume",
+		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC8_9_VOL,
+			RT715_SDCA_FU_VOL_CTRL, CH_01),
+		rt715_sdca_set_amp_gain_4ch_get,
+		rt715_sdca_set_amp_gain_4ch_put,
+		in_vol_tlv, 4, 0x7f),
+	RT715_SDCA_EXT_TLV("FU06 Capture Volume",
+		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC10_11_VOL,
+			RT715_SDCA_FU_VOL_CTRL, CH_01),
+		rt715_sdca_set_amp_gain_4ch_get,
+		rt715_sdca_set_amp_gain_4ch_put,
+		in_vol_tlv, 4, 0x7f),
+	/* MIC Boost Control */
+	RT715_SDCA_BOOST_EXT_TLV("FU0E Boost",
+		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_DMIC_GAIN_EN,
+			RT715_SDCA_FU_DMIC_GAIN_CTRL, CH_01),
+			rt715_sdca_set_amp_gain_8ch_get,
+			rt715_sdca_set_amp_gain_8ch_put,
+			mic_vol_tlv, 8, 3),
+	RT715_SDCA_BOOST_EXT_TLV("FU0C Boost",
+		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_AMIC_GAIN_EN,
+			RT715_SDCA_FU_DMIC_GAIN_CTRL, CH_01),
+			rt715_sdca_set_amp_gain_8ch_get,
+			rt715_sdca_set_amp_gain_8ch_put,
+			mic_vol_tlv, 8, 3),
+};
+
+static int rt715_sdca_mux_get(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_kcontrol_component(kcontrol);
+	struct rt715_sdca_priv *rt715 = snd_soc_component_get_drvdata(component);
+	unsigned int val, mask_sft;
+
+	if (strstr(ucontrol->id.name, "ADC 22 Mux"))
+		mask_sft = 12;
+	else if (strstr(ucontrol->id.name, "ADC 23 Mux"))
+		mask_sft = 8;
+	else if (strstr(ucontrol->id.name, "ADC 24 Mux"))
+		mask_sft = 4;
+	else if (strstr(ucontrol->id.name, "ADC 25 Mux"))
+		mask_sft = 0;
+	else
+		return -EINVAL;
+
+	rt715_sdca_index_read(rt715, RT715_VENDOR_HDA_CTL,
+		RT715_HDA_LEGACY_MUX_CTL1, &val);
+	val = (val >> mask_sft) & 0xf;
+
+	/*
+	 * The first two indices of ADC Mux 24/25 are routed to the same
+	 * hardware source. ie, ADC Mux 24 0/1 will both connect to MIC2.
+	 * To have a unique set of inputs, we skip the index1 of the muxes.
+	 */
+	if ((strstr(ucontrol->id.name, "ADC 24 Mux") ||
+		strstr(ucontrol->id.name, "ADC 25 Mux")) && val > 0)
+		val -= 1;
+	ucontrol->value.enumerated.item[0] = val;
+
+	return 0;
+}
+
+static int rt715_sdca_mux_put(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_dapm_context *dapm =
+				snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct rt715_sdca_priv *rt715 = snd_soc_component_get_drvdata(component);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int *item = ucontrol->value.enumerated.item;
+	unsigned int val, val2 = 0, change, mask_sft;
+
+	if (item[0] >= e->items)
+		return -EINVAL;
+
+	if (strstr(ucontrol->id.name, "ADC 22 Mux"))
+		mask_sft = 12;
+	else if (strstr(ucontrol->id.name, "ADC 23 Mux"))
+		mask_sft = 8;
+	else if (strstr(ucontrol->id.name, "ADC 24 Mux"))
+		mask_sft = 4;
+	else if (strstr(ucontrol->id.name, "ADC 25 Mux"))
+		mask_sft = 0;
+	else
+		return -EINVAL;
+
+	/* Verb ID = 0x701h, nid = e->reg */
+	val = snd_soc_enum_item_to_val(e, item[0]) << e->shift_l;
+
+	rt715_sdca_index_read(rt715, RT715_VENDOR_HDA_CTL,
+		RT715_HDA_LEGACY_MUX_CTL1, &val2);
+	val2 = (val2 >> mask_sft) & 0xf;
+
+	change = val != val2;
+
+	if (change)
+		rt715_sdca_index_update_bits(rt715, RT715_VENDOR_HDA_CTL,
+			RT715_HDA_LEGACY_MUX_CTL1, 0xf << mask_sft, val << mask_sft);
+
+	snd_soc_dapm_mux_update_power(dapm, kcontrol, item[0], e, NULL);
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
+/*
+ * Due to mux design for nid 24 (MUX_IN3)/25 (MUX_IN4), connection index 0 and
+ * 1 will be connected to the same dmic source, therefore we skip index 1 to
+ * avoid misunderstanding on usage of dapm routing.
+ */
+static int rt715_adc_24_25_values[] = {
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
+static SOC_ENUM_SINGLE_DECL(rt715_adc22_enum, SND_SOC_NOPM, 0,
+	adc_22_23_mux_text);
+
+static SOC_ENUM_SINGLE_DECL(rt715_adc23_enum, SND_SOC_NOPM, 0,
+	adc_22_23_mux_text);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(rt715_adc24_enum,
+	SND_SOC_NOPM, 0, 0xf,
+	adc_24_mux_text, rt715_adc_24_25_values);
+static SOC_VALUE_ENUM_SINGLE_DECL(rt715_adc25_enum,
+	SND_SOC_NOPM, 0, 0xf,
+	adc_25_mux_text, rt715_adc_24_25_values);
+
+static const struct snd_kcontrol_new rt715_adc22_mux =
+	SOC_DAPM_ENUM_EXT("ADC 22 Mux", rt715_adc22_enum,
+			rt715_sdca_mux_get, rt715_sdca_mux_put);
+
+static const struct snd_kcontrol_new rt715_adc23_mux =
+	SOC_DAPM_ENUM_EXT("ADC 23 Mux", rt715_adc23_enum,
+			rt715_sdca_mux_get, rt715_sdca_mux_put);
+
+static const struct snd_kcontrol_new rt715_adc24_mux =
+	SOC_DAPM_ENUM_EXT("ADC 24 Mux", rt715_adc24_enum,
+			rt715_sdca_mux_get, rt715_sdca_mux_put);
+
+static const struct snd_kcontrol_new rt715_adc25_mux =
+	SOC_DAPM_ENUM_EXT("ADC 25 Mux", rt715_adc25_enum,
+			rt715_sdca_mux_get, rt715_sdca_mux_put);
+
+static int rt715_sdca_pde23_24_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct rt715_sdca_priv *rt715 = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		regmap_write(rt715->regmap,
+			SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_CREQ_POW_EN,
+				RT715_SDCA_REQ_POW_CTRL,
+				CH_00), 0x00);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		regmap_write(rt715->regmap,
+			SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_CREQ_POW_EN,
+				RT715_SDCA_REQ_POW_CTRL,
+				CH_00), 0x03);
+		break;
+	}
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget rt715_sdca_dapm_widgets[] = {
+	SND_SOC_DAPM_INPUT("DMIC1"),
+	SND_SOC_DAPM_INPUT("DMIC2"),
+	SND_SOC_DAPM_INPUT("DMIC3"),
+	SND_SOC_DAPM_INPUT("DMIC4"),
+	SND_SOC_DAPM_INPUT("MIC1"),
+	SND_SOC_DAPM_INPUT("MIC2"),
+	SND_SOC_DAPM_INPUT("LINE1"),
+	SND_SOC_DAPM_INPUT("LINE2"),
+
+	SND_SOC_DAPM_SUPPLY("PDE23_24", SND_SOC_NOPM, 0, 0,
+		rt715_sdca_pde23_24_event,
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+
+	SND_SOC_DAPM_ADC("ADC 07", NULL, SND_SOC_NOPM, 4, 0),
+	SND_SOC_DAPM_ADC("ADC 08", NULL, SND_SOC_NOPM, 4, 0),
+	SND_SOC_DAPM_ADC("ADC 09", NULL, SND_SOC_NOPM, 4, 0),
+	SND_SOC_DAPM_ADC("ADC 27", NULL, SND_SOC_NOPM, 4, 0),
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
+static const struct snd_soc_dapm_route rt715_sdca_audio_map[] = {
+	{"DP6TX", NULL, "ADC 09"},
+	{"DP6TX", NULL, "ADC 08"},
+	{"DP4TX", NULL, "ADC 07"},
+	{"DP4TX", NULL, "ADC 27"},
+	{"DP4TX", NULL, "ADC 09"},
+	{"DP4TX", NULL, "ADC 08"},
+
+	{"LINE1", NULL, "PDE23_24"},
+	{"LINE2", NULL, "PDE23_24"},
+	{"MIC1", NULL, "PDE23_24"},
+	{"MIC2", NULL, "PDE23_24"},
+	{"DMIC1", NULL, "PDE23_24"},
+	{"DMIC2", NULL, "PDE23_24"},
+	{"DMIC3", NULL, "PDE23_24"},
+	{"DMIC4", NULL, "PDE23_24"},
+
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
+static const struct snd_soc_component_driver soc_codec_dev_rt715_sdca = {
+	.controls = rt715_sdca_snd_controls,
+	.num_controls = ARRAY_SIZE(rt715_sdca_snd_controls),
+	.dapm_widgets = rt715_sdca_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(rt715_sdca_dapm_widgets),
+	.dapm_routes = rt715_sdca_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(rt715_sdca_audio_map),
+};
+
+static int rt715_sdca_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
+				int direction)
+{
+	struct rt715_sdw_stream_data *stream;
+
+	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
+	if (!stream)
+		return -ENOMEM;
+
+	stream->sdw_stream = sdw_stream;
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
+static void rt715_sdca_shutdown(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+
+{
+	struct rt715_sdw_stream_data *stream;
+
+	stream = snd_soc_dai_get_dma_data(dai, substream);
+	if (!stream)
+		return;
+
+	snd_soc_dai_set_dma_data(dai, substream, NULL);
+	kfree(stream);
+}
+
+static int rt715_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct rt715_sdca_priv *rt715 = snd_soc_component_get_drvdata(component);
+	struct sdw_stream_config stream_config;
+	struct sdw_port_config port_config;
+	enum sdw_data_direction direction;
+	struct rt715_sdw_stream_data *stream;
+	int retval, port, num_channels;
+	unsigned int val;
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
+		rt715_sdca_index_write(rt715, RT715_VENDOR_REG, RT715_SDW_INPUT_SEL,
+			0xa500);
+		break;
+	case RT715_AIF2:
+		direction = SDW_DATA_DIR_TX;
+		port = 4;
+		rt715_sdca_index_write(rt715, RT715_VENDOR_REG, RT715_SDW_INPUT_SEL,
+			0xaf00);
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
+	port_config.ch_mask = GENMASK(num_channels - 1, 0);
+	port_config.num = port;
+
+	retval = sdw_stream_add_slave(rt715->slave, &stream_config,
+					&port_config, 1, stream->sdw_stream);
+	if (retval) {
+		dev_err(component->dev, "Unable to configure port, retval:%d\n",
+			retval);
+		return retval;
+	}
+
+	switch (params_rate(params)) {
+	case 8000:
+		val = 0x1;
+		break;
+	case 11025:
+		val = 0x2;
+		break;
+	case 12000:
+		val = 0x3;
+		break;
+	case 16000:
+		val = 0x4;
+		break;
+	case 22050:
+		val = 0x5;
+		break;
+	case 24000:
+		val = 0x6;
+		break;
+	case 32000:
+		val = 0x7;
+		break;
+	case 44100:
+		val = 0x8;
+		break;
+	case 48000:
+		val = 0x9;
+		break;
+	case 88200:
+		val = 0xa;
+		break;
+	case 96000:
+		val = 0xb;
+		break;
+	case 176400:
+		val = 0xc;
+		break;
+	case 192000:
+		val = 0xd;
+		break;
+	case 384000:
+		val = 0xe;
+		break;
+	case 768000:
+		val = 0xf;
+		break;
+	default:
+		dev_err(component->dev, "Unsupported sample rate %d\n",
+			params_rate(params));
+		return -EINVAL;
+	}
+
+	regmap_write(rt715->regmap,
+		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_CS_FREQ_IND_EN,
+			RT715_SDCA_FREQ_IND_CTRL, CH_00), val);
+
+	return 0;
+}
+
+static int rt715_sdca_pcm_hw_free(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct rt715_sdca_priv *rt715 = snd_soc_component_get_drvdata(component);
+	struct rt715_sdw_stream_data *stream =
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
+static struct snd_soc_dai_ops rt715_sdca_ops = {
+	.hw_params	= rt715_sdca_pcm_hw_params,
+	.hw_free	= rt715_sdca_pcm_hw_free,
+	.set_sdw_stream	= rt715_sdca_set_sdw_stream,
+	.shutdown	= rt715_sdca_shutdown,
+};
+
+static struct snd_soc_dai_driver rt715_sdca_dai[] = {
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
+		.ops = &rt715_sdca_ops,
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
+		.ops = &rt715_sdca_ops,
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
+int rt715_sdca_init(struct device *dev, struct regmap *mbq_regmap,
+	struct regmap *regmap, struct sdw_slave *slave)
+{
+	struct rt715_sdca_priv *rt715;
+	int ret;
+
+	rt715 = devm_kzalloc(dev, sizeof(*rt715), GFP_KERNEL);
+	if (!rt715)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, rt715);
+	rt715->slave = slave;
+	rt715->regmap = regmap;
+	rt715->mbq_regmap = mbq_regmap;
+	rt715->hw_sdw_ver = slave->id.sdw_version;
+	/*
+	 * Mark hw_init to false
+	 * HW init will be performed when device reports present
+	 */
+	rt715->hw_init = false;
+	rt715->first_init = false;
+
+	ret = devm_snd_soc_register_component(dev,
+			&soc_codec_dev_rt715_sdca,
+			rt715_sdca_dai,
+			ARRAY_SIZE(rt715_sdca_dai));
+
+	return ret;
+}
+
+int rt715_sdca_io_init(struct device *dev, struct sdw_slave *slave)
+{
+	struct rt715_sdca_priv *rt715 = dev_get_drvdata(dev);
+	unsigned int hw_ver;
+
+	if (rt715->hw_init)
+		return 0;
+
+	/*
+	 * PM runtime is only enabled when a Slave reports as Attached
+	 */
+	if (!rt715->first_init) {
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
+
+		rt715->first_init = true;
+	}
+
+	pm_runtime_get_noresume(&slave->dev);
+
+	rt715_sdca_index_read(rt715, RT715_VENDOR_REG,
+		RT715_PRODUCT_NUM, &hw_ver);
+	hw_ver = hw_ver & 0x000f;
+
+	/* set clock selector = external */
+	regmap_write(rt715->regmap,
+		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_CX_CLK_SEL_EN,
+			RT715_SDCA_CX_CLK_SEL_CTRL, CH_00), 0x1);
+	/* set GPIO_4/5/6 to be 3rd/4th DMIC usage */
+	if (hw_ver == 0x0)
+		rt715_sdca_index_update_bits(rt715, RT715_VENDOR_REG,
+			RT715_AD_FUNC_EN, 0x54, 0x54);
+	else if (hw_ver == 0x1) {
+		rt715_sdca_index_update_bits(rt715, RT715_VENDOR_REG,
+			RT715_AD_FUNC_EN, 0x55, 0x55);
+		rt715_sdca_index_update_bits(rt715, RT715_VENDOR_REG,
+			RT715_REV_1, 0x40, 0x40);
+	}
+	/* trigger mode = VAD enable */
+	regmap_write(rt715->regmap,
+		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_SMPU_TRIG_ST_EN,
+			RT715_SDCA_SMPU_TRIG_EN_CTRL, CH_00), 0x2);
+	/* SMPU-1 interrupt enable mask */
+	regmap_update_bits(rt715->regmap, RT715_INT_MASK, 0x1, 0x1);
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
+MODULE_DESCRIPTION("ASoC rt715 driver SDW SDCA");
+MODULE_AUTHOR("Jack Yu <jack.yu@realtek.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/rt715-sdca.h b/sound/soc/codecs/rt715-sdca.h
new file mode 100644
index 000000000000..85ce4d95e5eb
--- /dev/null
+++ b/sound/soc/codecs/rt715-sdca.h
@@ -0,0 +1,136 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * rt715-sdca.h -- RT715 ALSA SoC audio driver header
+ *
+ * Copyright(c) 2020 Realtek Semiconductor Corp.
+ */
+
+#ifndef __RT715_SDCA_H__
+#define __RT715_SDCA_H__
+
+#include <linux/regmap.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include <sound/soc.h>
+#include <linux/workqueue.h>
+#include <linux/device.h>
+
+struct rt715_sdca_priv {
+	struct regmap *regmap;
+	struct regmap *mbq_regmap;
+	struct snd_soc_codec *codec;
+	struct sdw_slave *slave;
+	struct delayed_work adc_mute_work;
+	int dbg_nid;
+	int dbg_vid;
+	int dbg_payload;
+	enum sdw_slave_status status;
+	struct sdw_bus_params params;
+	bool hw_init;
+	bool first_init;
+	int l_is_unmute;
+	int r_is_unmute;
+	int hw_sdw_ver;
+	int kctl_switch_orig[4];
+	int kctl_2ch_orig[2];
+	int kctl_4ch_orig[4];
+	int kctl_8ch_orig[8];
+};
+
+struct rt715_sdw_stream_data {
+	struct sdw_stream_runtime *sdw_stream;
+};
+
+struct rt715_sdca_kcontrol_private {
+	unsigned int reg_base;
+	unsigned int count;
+	unsigned int max;
+	unsigned int shift;
+	unsigned int invert;
+};
+
+/* MIPI Register */
+#define RT715_INT_CTRL					0x005a
+#define RT715_INT_MASK					0x005e
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
+#define RT715_VENDOR_REG				0x20
+#define RT715_MUX_IN1					0x22
+#define RT715_MUX_IN2					0x23
+#define RT715_MUX_IN3					0x24
+#define RT715_MUX_IN4					0x25
+#define RT715_MIX_ADC2					0x27
+#define RT715_INLINE_CMD				0x55
+#define RT715_VENDOR_HDA_CTL				0x61
+
+/* Index (NID:20h) */
+#define RT715_PRODUCT_NUM				0x0
+#define RT715_IRQ_CTRL					0x2b
+#define RT715_AD_FUNC_EN				0x36
+#define RT715_REV_1					0x37
+#define RT715_SDW_INPUT_SEL				0x39
+#define RT715_EXT_DMIC_CLK_CTRL2			0x54
+
+/* Index (NID:61h) */
+#define RT715_HDA_LEGACY_MUX_CTL1			0x00
+
+/* SDCA (Function) */
+#define FUN_JACK_CODEC				0x01
+#define FUN_MIC_ARRAY				0x02
+#define FUN_HID						0x03
+/* SDCA (Entity) */
+#define RT715_SDCA_ST_EN							0x00
+#define RT715_SDCA_CS_FREQ_IND_EN					0x01
+#define RT715_SDCA_FU_ADC8_9_VOL					0x02
+#define RT715_SDCA_SMPU_TRIG_ST_EN					0x05
+#define RT715_SDCA_FU_ADC10_11_VOL					0x06
+#define RT715_SDCA_FU_ADC7_27_VOL					0x0a
+#define RT715_SDCA_FU_AMIC_GAIN_EN					0x0c
+#define RT715_SDCA_FU_DMIC_GAIN_EN					0x0e
+#define RT715_SDCA_CX_CLK_SEL_EN					0x10
+#define RT715_SDCA_CREQ_POW_EN						0x18
+/* SDCA (Control) */
+#define RT715_SDCA_ST_CTRL							0x00
+#define RT715_SDCA_CX_CLK_SEL_CTRL					0x01
+#define RT715_SDCA_REQ_POW_CTRL					0x01
+#define RT715_SDCA_FU_MUTE_CTRL					0x01
+#define RT715_SDCA_FU_VOL_CTRL						0x02
+#define RT715_SDCA_FU_DMIC_GAIN_CTRL				0x0b
+#define RT715_SDCA_FREQ_IND_CTRL					0x10
+#define RT715_SDCA_SMPU_TRIG_EN_CTRL				0x10
+#define RT715_SDCA_SMPU_TRIG_ST_CTRL				0x11
+/* SDCA (Channel) */
+#define CH_00						0x00
+#define CH_01						0x01
+#define CH_02						0x02
+#define CH_03						0x03
+#define CH_04						0x04
+#define CH_05						0x05
+#define CH_06						0x06
+#define CH_07						0x07
+#define CH_08						0x08
+
+#define RT715_SDCA_DB_STEP			375
+
+enum {
+	RT715_AIF1,
+	RT715_AIF2,
+};
+
+int rt715_sdca_io_init(struct device *dev, struct sdw_slave *slave);
+int rt715_sdca_init(struct device *dev, struct regmap *mbq_regmap,
+	struct regmap *regmap, struct sdw_slave *slave);
+
+#endif /* __RT715_SDCA_H__ */
-- 
2.29.0

