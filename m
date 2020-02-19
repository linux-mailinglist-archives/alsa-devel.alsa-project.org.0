Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E23164227
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 11:31:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CD541697;
	Wed, 19 Feb 2020 11:30:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CD541697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582108259;
	bh=sJBosATgOIfDdgo8fxyzhgzMKWsKQRnAhDB/18FGgDE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g41wiuYEtXFvnuwETlde/yTmoGW/bzCEJhArzdB9+kaEyjaoVRWbyUBowvt6e+obK
	 cS7Q8Mw0sIsDPQErq89uewU3OB/b6xfi1HZxJM6aiwS34Xiv55XsjJ/aa8L905Lnes
	 dHp/Macj6ExFs7v7UZXY0Ipk3woD0qgUEAtYWw4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79825F80114;
	Wed, 19 Feb 2020 11:29:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F1DCF80172; Wed, 19 Feb 2020 11:29:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F225F8015E
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 11:29:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F225F8015E
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID 01JAT2VW014489,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTEXMB06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id 01JAT2VW014489
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Feb 2020 18:29:02 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 19 Feb 2020 18:29:02 +0800
Received: from localhost.localdomain (172.22.102.1) by RTEXMB01.realtek.com.tw
 (172.21.6.94) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Wed, 19 Feb
 2020 18:29:02 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 1/2] ASoC: rt5682: Add the soundwire support
Date: Wed, 19 Feb 2020 18:28:57 +0800
Message-ID: <20200219102858.20166-1-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMB06.realtek.com.tw (172.21.6.99) To
 RTEXMB01.realtek.com.tw (172.21.6.94)
Cc: Oder Chiou <oder_chiou@realtek.com>, jack.yu@realtek.com,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 derek.fang@realtek.com, shumingf@realtek.com, yung-chuan.liao@linux.intel.com,
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

This patch adds the soundwire support for ALC5682.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
---
 sound/soc/codecs/Kconfig      |   7 +
 sound/soc/codecs/Makefile     |   2 +
 sound/soc/codecs/rt5682-sdw.c | 333 +++++++++++++++++++++
 sound/soc/codecs/rt5682-sdw.h |  20 ++
 sound/soc/codecs/rt5682.c     | 526 +++++++++++++++++++++++++++++++---
 sound/soc/codecs/rt5682.h     |  49 ++++
 6 files changed, 897 insertions(+), 40 deletions(-)
 create mode 100644 sound/soc/codecs/rt5682-sdw.c
 create mode 100644 sound/soc/codecs/rt5682-sdw.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index d957fd6980b1..2e9afe12fc8f 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -168,6 +168,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_RT5670
 	imply SND_SOC_RT5677
 	imply SND_SOC_RT5682
+	imply SND_SOC_RT5682_SDW
 	imply SND_SOC_RT700_SDW
 	imply SND_SOC_RT711_SDW
 	imply SND_SOC_RT715_SDW
@@ -1135,6 +1136,12 @@ config SND_SOC_RT5682
 	tristate
 	depends on I2C
 
+config SND_SOC_RT5682_SDW
+	tristate "Realtek RT5682 Codec - SDW"
+	depends on SOUNDWIRE
+	select SND_SOC_RT5682
+	select REGMAP_SOUNDWIRE
+
 config SND_SOC_RT700
 	tristate
 
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index ba1b4b3fa2da..c0561f584f5b 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -177,6 +177,7 @@ snd-soc-rt5670-objs := rt5670.o
 snd-soc-rt5677-objs := rt5677.o
 snd-soc-rt5677-spi-objs := rt5677-spi.o
 snd-soc-rt5682-objs := rt5682.o
+snd-soc-rt5682-sdw-objs := rt5682-sdw.o
 snd-soc-rt700-objs := rt700.o rt700-sdw.o
 snd-soc-rt711-objs := rt711.o rt711-sdw.o
 snd-soc-rt715-objs := rt715.o rt715-sdw.o
@@ -476,6 +477,7 @@ obj-$(CONFIG_SND_SOC_RT5670)	+= snd-soc-rt5670.o
 obj-$(CONFIG_SND_SOC_RT5677)	+= snd-soc-rt5677.o
 obj-$(CONFIG_SND_SOC_RT5677_SPI)	+= snd-soc-rt5677-spi.o
 obj-$(CONFIG_SND_SOC_RT5682)	+= snd-soc-rt5682.o
+obj-$(CONFIG_SND_SOC_RT5682_SDW)	+= snd-soc-rt5682-sdw.o
 obj-$(CONFIG_SND_SOC_RT700)     += snd-soc-rt700.o
 obj-$(CONFIG_SND_SOC_RT711)     += snd-soc-rt711.o
 obj-$(CONFIG_SND_SOC_RT715)     += snd-soc-rt715.o
diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
new file mode 100644
index 000000000000..fc31d04b5203
--- /dev/null
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -0,0 +1,333 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// rt5682-sdw.c  --  RT5682 ALSA SoC audio component driver
+//
+// Copyright 2019 Realtek Semiconductor Corp.
+// Author: Oder Chiou <oder_chiou@realtek.com>
+//
+
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/init.h>
+#include <linux/delay.h>
+#include <linux/pm.h>
+#include <linux/acpi.h>
+#include <linux/gpio.h>
+#include <linux/of_gpio.h>
+#include <linux/regulator/consumer.h>
+#include <linux/mutex.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/jack.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <sound/initval.h>
+#include <sound/tlv.h>
+
+#include "rt5682.h"
+#include "rt5682-sdw.h"
+
+static bool rt5682_sdw_readable_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case 0x00e0:
+	case 0x00f0:
+	case 0x3000:
+	case 0x3001:
+	case 0x3004:
+	case 0x3005:
+	case 0x3008:
+		return true;
+	default:
+		return false;
+	}
+}
+
+const struct regmap_config rt5682_sdw_regmap = {
+	.name = "sdw",
+	.reg_bits = 32,
+	.val_bits = 8,
+	.max_register = RT5682_I2C_MODE,
+	.readable_reg = rt5682_sdw_readable_register,
+	.cache_type = REGCACHE_NONE,
+	.use_single_read = true,
+	.use_single_write = true,
+};
+
+static int rt5682_update_status(struct sdw_slave *slave,
+					enum sdw_slave_status status)
+{
+	struct rt5682_priv *rt5682 = dev_get_drvdata(&slave->dev);
+
+	/* Update the status */
+	rt5682->status = status;
+
+	if (status == SDW_SLAVE_UNATTACHED)
+		rt5682->hw_init = false;
+
+	/*
+	 * Perform initialization only if slave status is present and
+	 * hw_init flag is false
+	 */
+	if (rt5682->hw_init || rt5682->status != SDW_SLAVE_ATTACHED)
+		return 0;
+
+	/* perform I/O transfers required for Slave initialization */
+	return rt5682_io_init(&slave->dev, slave);
+}
+
+static int rt5682_read_prop(struct sdw_slave *slave)
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
+	prop->source_ports = 0x4;	/* BITMAP: 00000100 */
+	prop->sink_ports = 0x2;		/* BITMAP: 00000010 */
+
+	nval = hweight32(prop->source_ports);
+	num_of_ports += nval;
+	prop->src_dpn_prop = devm_kcalloc(&slave->dev, nval,
+					  sizeof(*prop->src_dpn_prop),
+					  GFP_KERNEL);
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
+					   sizeof(*prop->sink_dpn_prop),
+					   GFP_KERNEL);
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
+					 sizeof(*slave->port_ready),
+					 GFP_KERNEL);
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
+/* Bus clock frequency */
+#define RT5682_CLK_FREQ_9600000HZ 9600000
+#define RT5682_CLK_FREQ_12000000HZ 12000000
+#define RT5682_CLK_FREQ_6000000HZ 6000000
+#define RT5682_CLK_FREQ_4800000HZ 4800000
+#define RT5682_CLK_FREQ_2400000HZ 2400000
+#define RT5682_CLK_FREQ_12288000HZ 12288000
+
+int rt5682_clock_config(struct device *dev)
+{
+	struct rt5682_priv *rt5682 = dev_get_drvdata(dev);
+	unsigned int clk_freq, value;
+
+	clk_freq = (rt5682->params.curr_dr_freq >> 1);
+
+	switch (clk_freq) {
+	case RT5682_CLK_FREQ_12000000HZ:
+		value = 0x0;
+		break;
+	case RT5682_CLK_FREQ_6000000HZ:
+		value = 0x1;
+		break;
+	case RT5682_CLK_FREQ_9600000HZ:
+		value = 0x2;
+		break;
+	case RT5682_CLK_FREQ_4800000HZ:
+		value = 0x3;
+		break;
+	case RT5682_CLK_FREQ_2400000HZ:
+		value = 0x4;
+		break;
+	case RT5682_CLK_FREQ_12288000HZ:
+		value = 0x5;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_write(rt5682->sdw_regmap, 0xe0, value);
+	regmap_write(rt5682->sdw_regmap, 0xf0, value);
+
+	dev_dbg(dev, "%s complete, clk_freq=%d\n", __func__, clk_freq);
+
+	return 0;
+}
+
+static int rt5682_bus_config(struct sdw_slave *slave,
+					struct sdw_bus_params *params)
+{
+	struct rt5682_priv *rt5682 = dev_get_drvdata(&slave->dev);
+	int ret;
+
+	memcpy(&rt5682->params, params, sizeof(*params));
+
+	ret = rt5682_clock_config(&slave->dev);
+	if (ret < 0)
+		dev_err(&slave->dev, "Invalid clk config");
+
+	return ret;
+}
+
+static int rt5682_interrupt_callback(struct sdw_slave *slave,
+					struct sdw_slave_intr_status *status)
+{
+	struct rt5682_priv *rt5682 = dev_get_drvdata(&slave->dev);
+
+	dev_dbg(&slave->dev,
+		"%s control_port_stat=%x", __func__, status->control_port);
+
+	if (status->control_port & 0x4) {
+		mod_delayed_work(system_power_efficient_wq,
+			&rt5682->jack_detect_work, msecs_to_jiffies(250));
+	}
+
+	return 0;
+}
+
+static struct sdw_slave_ops rt5682_slave_ops = {
+	.read_prop = rt5682_read_prop,
+	.interrupt_callback = rt5682_interrupt_callback,
+	.update_status = rt5682_update_status,
+	.bus_config = rt5682_bus_config,
+};
+
+static int rt5682_sdw_probe(struct sdw_slave *slave,
+			   const struct sdw_device_id *id)
+{
+	struct regmap *regmap;
+
+	/* Assign ops */
+	slave->ops = &rt5682_slave_ops;
+
+	/* Regmap Initialization */
+	regmap = devm_regmap_init_sdw(slave, &rt5682_sdw_regmap);
+	if (IS_ERR(regmap))
+		return -EINVAL;
+
+	rt5682_sdw_init(&slave->dev, regmap, slave);
+
+	return 0;
+}
+
+static int rt5682_sdw_remove(struct sdw_slave *slave)
+{
+	struct rt5682_priv *rt5682 = dev_get_drvdata(&slave->dev);
+
+	if (rt5682 && rt5682->hw_init)
+		cancel_delayed_work(&rt5682->jack_detect_work);
+
+	return 0;
+}
+
+static const struct sdw_device_id rt5682_id[] = {
+	SDW_SLAVE_ENTRY(0x025d, 0x5682, 0),
+	{},
+};
+MODULE_DEVICE_TABLE(sdw, rt5682_id);
+
+static int rt5682_dev_suspend(struct device *dev)
+{
+	struct rt5682_priv *rt5682 = dev_get_drvdata(dev);
+
+	if (!rt5682->hw_init)
+		return 0;
+
+	regcache_cache_only(rt5682->regmap, true);
+	regcache_mark_dirty(rt5682->regmap);
+
+	return 0;
+}
+
+static int rt5682_dev_resume(struct device *dev)
+{
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	struct rt5682_priv *rt5682 = dev_get_drvdata(dev);
+	unsigned long time;
+
+	if (!rt5682->hw_init)
+		return 0;
+
+	if (!slave->unattach_request)
+		goto regmap_sync;
+
+	time = wait_for_completion_timeout(&slave->initialization_complete,
+				msecs_to_jiffies(RT5682_PROBE_TIMEOUT));
+	if (!time) {
+		dev_err(&slave->dev, "Initialization not complete, timed out\n");
+		return -ETIMEDOUT;
+	}
+
+regmap_sync:
+	slave->unattach_request = 0;
+	regcache_cache_only(rt5682->regmap, false);
+	regcache_sync(rt5682->regmap);
+
+	return 0;
+}
+
+static const struct dev_pm_ops rt5682_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(rt5682_dev_suspend, rt5682_dev_resume)
+	SET_RUNTIME_PM_OPS(rt5682_dev_suspend, rt5682_dev_resume, NULL)
+};
+
+static struct sdw_driver rt5682_sdw_driver = {
+	.driver = {
+		.name = "rt5682",
+		.owner = THIS_MODULE,
+		.pm = &rt5682_pm,
+	},
+	.probe = rt5682_sdw_probe,
+	.remove = rt5682_sdw_remove,
+	.ops = &rt5682_slave_ops,
+	.id_table = rt5682_id,
+};
+module_sdw_driver(rt5682_sdw_driver);
+
+MODULE_DESCRIPTION("ASoC RT5682 driver SDW");
+MODULE_AUTHOR("Oder Chiou <oder_chiou@realtek.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/rt5682-sdw.h b/sound/soc/codecs/rt5682-sdw.h
new file mode 100644
index 000000000000..76e6f607066e
--- /dev/null
+++ b/sound/soc/codecs/rt5682-sdw.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * rt5682-sdw.h  --  RT5682 SDW ALSA SoC audio driver
+ *
+ * Copyright 2019 Realtek Semiconductor Corp.
+ * Author: Oder Chiou <oder_chiou@realtek.com>
+ */
+
+#ifndef __RT5682_SDW_H__
+#define __RT5682_SDW_H__
+
+#define RT5682_SDW_ADDR_L			0x3000
+#define RT5682_SDW_ADDR_H			0x3001
+#define RT5682_SDW_DATA_L			0x3004
+#define RT5682_SDW_DATA_H			0x3005
+#define RT5682_SDW_CMD				0x3008
+
+#define RT5682_PROBE_TIMEOUT			2000
+
+#endif /* __RT5682_SDW_H__ */
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 6774813e0eea..1795a8bbea1a 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -11,13 +11,13 @@
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
+#include <linux/pm_runtime.h>
 #include <linux/i2c.h>
 #include <linux/platform_device.h>
 #include <linux/spi/spi.h>
 #include <linux/acpi.h>
 #include <linux/gpio.h>
 #include <linux/of_gpio.h>
-#include <linux/regulator/consumer.h>
 #include <linux/mutex.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -27,15 +27,11 @@
 #include <sound/soc-dapm.h>
 #include <sound/initval.h>
 #include <sound/tlv.h>
-#include <linux/clk.h>
-#include <linux/clkdev.h>
-#include <linux/clk-provider.h>
 #include <sound/rt5682.h>
 
 #include "rl6231.h"
 #include "rt5682.h"
-
-#define RT5682_NUM_SUPPLIES 3
+#include "rt5682-sdw.h"
 
 static const char *rt5682_supply_names[RT5682_NUM_SUPPLIES] = {
 	"AVDD",
@@ -52,37 +48,6 @@ static const struct rt5682_platform_data i2s_default_platform_data = {
 	.dai_clk_names[RT5682_DAI_BCLK_IDX] = "rt5682-dai-bclk",
 };
 
-struct rt5682_priv {
-	struct snd_soc_component *component;
-	struct rt5682_platform_data pdata;
-	struct regmap *regmap;
-	struct snd_soc_jack *hs_jack;
-	struct regulator_bulk_data supplies[RT5682_NUM_SUPPLIES];
-	struct delayed_work jack_detect_work;
-	struct delayed_work jd_check_work;
-	struct mutex calibrate_mutex;
-	bool is_sdw;
-
-#ifdef CONFIG_COMMON_CLK
-	struct clk_hw dai_clks_hw[RT5682_DAI_NUM_CLKS];
-	struct clk_lookup *dai_clks_lookup[RT5682_DAI_NUM_CLKS];
-	struct clk *dai_clks[RT5682_DAI_NUM_CLKS];
-	struct clk *mclk;
-#endif
-
-	int sysclk;
-	int sysclk_src;
-	int lrck[RT5682_AIFS];
-	int bclk[RT5682_AIFS];
-	int master[RT5682_AIFS];
-
-	int pll_src[RT5682_PLLS];
-	int pll_in[RT5682_PLLS];
-	int pll_out[RT5682_PLLS];
-
-	int jack_type;
-};
-
 static const struct reg_sequence patch_list[] = {
 	{RT5682_HP_IMP_SENS_CTRL_19, 0x1000},
 	{RT5682_DAC_ADC_DIG_VOL1, 0xa020},
@@ -819,6 +784,22 @@ static const struct snd_kcontrol_new rt5682_if1_45_adc_swap_mux =
 static const struct snd_kcontrol_new rt5682_if1_67_adc_swap_mux =
 	SOC_DAPM_ENUM("IF1 67 ADC Swap Mux", rt5682_if1_67_adc_enum);
 
+static const char * const rt5682_dac_select[] = {
+	"IF1", "SOUND"
+};
+
+static SOC_ENUM_SINGLE_DECL(rt5682_dacl_enum,
+	RT5682_AD_DA_MIXER, RT5682_DAC1_L_SEL_SFT, rt5682_dac_select);
+
+static const struct snd_kcontrol_new rt5682_dac_l_mux =
+	SOC_DAPM_ENUM("DAC L Mux", rt5682_dacl_enum);
+
+static SOC_ENUM_SINGLE_DECL(rt5682_dacr_enum,
+	RT5682_AD_DA_MIXER, RT5682_DAC1_R_SEL_SFT, rt5682_dac_select);
+
+static const struct snd_kcontrol_new rt5682_dac_r_mux =
+	SOC_DAPM_ENUM("DAC R Mux", rt5682_dacr_enum);
+
 static void rt5682_reset(struct rt5682_priv *rt5682)
 {
 	regmap_write(rt5682->regmap, RT5682_RESET, 0);
@@ -1271,6 +1252,9 @@ static int set_filter_clk(struct snd_soc_dapm_widget *w,
 	static const int div_f[] = {1, 2, 3, 4, 6, 8, 12, 16, 24, 32, 48};
 	static const int div_o[] = {1, 2, 4, 6, 8, 12, 16, 24, 32, 48};
 
+	if (rt5682->is_sdw)
+		return 0;
+
 	val = snd_soc_component_read32(component, RT5682_GPIO_CTRL_1) &
 		RT5682_GP4_PIN_MASK;
 	if (w->shift == RT5682_PWR_ADC_S1F_BIT &&
@@ -1743,6 +1727,8 @@ static const struct snd_soc_dapm_widget rt5682_dapm_widgets[] = {
 	SND_SOC_DAPM_PGA("IF1 DAC1", SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_PGA("IF1 DAC1 L", SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_PGA("IF1 DAC1 R", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("SOUND DAC L", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("SOUND DAC R", SND_SOC_NOPM, 0, 0, NULL, 0),
 
 	/* Digital Interface Select */
 	SND_SOC_DAPM_MUX("IF1 01 ADC Swap Mux", SND_SOC_NOPM, 0, 0,
@@ -1759,12 +1745,19 @@ static const struct snd_soc_dapm_widget rt5682_dapm_widgets[] = {
 	SND_SOC_DAPM_MUX("ADCDAT Mux", SND_SOC_NOPM, 0, 0,
 			&rt5682_adcdat_pin_ctrl),
 
+	SND_SOC_DAPM_MUX("DAC L Mux", SND_SOC_NOPM, 0, 0,
+			&rt5682_dac_l_mux),
+	SND_SOC_DAPM_MUX("DAC R Mux", SND_SOC_NOPM, 0, 0,
+			&rt5682_dac_r_mux),
+
 	/* Audio Interface */
 	SND_SOC_DAPM_AIF_OUT("AIF1TX", "AIF1 Capture", 0,
 		RT5682_I2S1_SDP, RT5682_SEL_ADCDAT_SFT, 1),
 	SND_SOC_DAPM_AIF_OUT("AIF2TX", "AIF2 Capture", 0,
 		RT5682_I2S2_SDP, RT5682_I2S2_PIN_CFG_SFT, 1),
 	SND_SOC_DAPM_AIF_IN("AIF1RX", "AIF1 Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("SDWRX", "SDW Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("SDWTX", "SDW Capture", 0, SND_SOC_NOPM, 0, 0),
 
 	/* Output Side */
 	/* DAC mixer before sound effect  */
@@ -1921,8 +1914,8 @@ static const struct snd_soc_dapm_route rt5682_dapm_routes[] = {
 	{"IF1_ADC Mux", "Slot 2", "IF1 23 ADC Swap Mux"},
 	{"IF1_ADC Mux", "Slot 4", "IF1 45 ADC Swap Mux"},
 	{"IF1_ADC Mux", "Slot 6", "IF1 67 ADC Swap Mux"},
-	{"IF1_ADC Mux", NULL, "I2S1"},
 	{"ADCDAT Mux", "ADCDAT1", "IF1_ADC Mux"},
+	{"AIF1TX", NULL, "I2S1"},
 	{"AIF1TX", NULL, "ADCDAT Mux"},
 	{"IF2 ADC Swap Mux", "L/R", "Stereo1 ADC MIX"},
 	{"IF2 ADC Swap Mux", "R/L", "Stereo1 ADC MIX"},
@@ -1931,6 +1924,10 @@ static const struct snd_soc_dapm_route rt5682_dapm_routes[] = {
 	{"ADCDAT Mux", "ADCDAT2", "IF2 ADC Swap Mux"},
 	{"AIF2TX", NULL, "ADCDAT Mux"},
 
+	{"SDWTX", NULL, "PLL2B"},
+	{"SDWTX", NULL, "PLL2F"},
+	{"SDWTX", NULL, "ADCDAT Mux"},
+
 	{"IF1 DAC1 L", NULL, "AIF1RX"},
 	{"IF1 DAC1 L", NULL, "I2S1"},
 	{"IF1 DAC1 L", NULL, "DAC Stereo1 Filter"},
@@ -1938,10 +1935,24 @@ static const struct snd_soc_dapm_route rt5682_dapm_routes[] = {
 	{"IF1 DAC1 R", NULL, "I2S1"},
 	{"IF1 DAC1 R", NULL, "DAC Stereo1 Filter"},
 
+	{"SOUND DAC L", NULL, "SDWRX"},
+	{"SOUND DAC L", NULL, "DAC Stereo1 Filter"},
+	{"SOUND DAC L", NULL, "PLL2B"},
+	{"SOUND DAC L", NULL, "PLL2F"},
+	{"SOUND DAC R", NULL, "SDWRX"},
+	{"SOUND DAC R", NULL, "DAC Stereo1 Filter"},
+	{"SOUND DAC R", NULL, "PLL2B"},
+	{"SOUND DAC R", NULL, "PLL2F"},
+
+	{"DAC L Mux", "IF1", "IF1 DAC1 L"},
+	{"DAC L Mux", "SOUND", "SOUND DAC L"},
+	{"DAC R Mux", "IF1", "IF1 DAC1 R"},
+	{"DAC R Mux", "SOUND", "SOUND DAC R"},
+
 	{"DAC1 MIXL", "Stereo ADC Switch", "Stereo1 ADC MIXL"},
-	{"DAC1 MIXL", "DAC1 Switch", "IF1 DAC1 L"},
+	{"DAC1 MIXL", "DAC1 Switch", "DAC L Mux"},
 	{"DAC1 MIXR", "Stereo ADC Switch", "Stereo1 ADC MIXR"},
-	{"DAC1 MIXR", "DAC1 Switch", "IF1 DAC1 R"},
+	{"DAC1 MIXR", "DAC1 Switch", "DAC R Mux"},
 
 	{"Stereo1 DAC MIXL", "DAC L1 Switch", "DAC1 MIXL"},
 	{"Stereo1 DAC MIXL", "DAC R1 Switch", "DAC1 MIXR"},
@@ -2826,6 +2837,8 @@ static int rt5682_register_dai_clks(struct snd_soc_component *component)
 static int rt5682_probe(struct snd_soc_component *component)
 {
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
+	struct sdw_slave *slave;
+	unsigned long time;
 
 #ifdef CONFIG_COMMON_CLK
 	int ret;
@@ -2852,6 +2865,17 @@ static int rt5682_probe(struct snd_soc_component *component)
 	rt5682->lrck[RT5682_AIF1] = CLK_48;
 #endif
 
+	if (rt5682->is_sdw) {
+		slave = rt5682->slave;
+		time = wait_for_completion_timeout(
+			&slave->initialization_complete,
+			msecs_to_jiffies(RT5682_PROBE_TIMEOUT));
+		if (!time) {
+			dev_err(&slave->dev, "Initialization not complete, timed out\n");
+			return -ETIMEDOUT;
+		}
+	}
+
 	return 0;
 }
 
@@ -2914,6 +2938,194 @@ static const struct snd_soc_dai_ops rt5682_aif2_dai_ops = {
 	.set_bclk_ratio = rt5682_set_bclk2_ratio,
 };
 
+#if IS_ENABLED(CONFIG_SND_SOC_RT5682_SDW)
+struct sdw_stream_data {
+	struct sdw_stream_runtime *sdw_stream;
+};
+
+static int rt5682_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
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
+static void rt5682_sdw_shutdown(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct sdw_stream_data *stream;
+
+	stream = snd_soc_dai_get_dma_data(dai, substream);
+	snd_soc_dai_set_dma_data(dai, substream, NULL);
+	kfree(stream);
+}
+
+static int rt5682_sdw_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
+	struct sdw_stream_config stream_config;
+	struct sdw_port_config port_config;
+	enum sdw_data_direction direction;
+	struct sdw_stream_data *stream;
+	int retval, port, num_channels;
+	unsigned int val_p = 0, val_c = 0, osr_p = 0, osr_c = 0;
+
+	dev_dbg(dai->dev, "%s %s", __func__, dai->name);
+	stream = snd_soc_dai_get_dma_data(dai, substream);
+
+	if (!stream)
+		return -ENOMEM;
+
+	if (!rt5682->slave)
+		return -EINVAL;
+
+	/* SoundWire specific configuration */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		direction = SDW_DATA_DIR_RX;
+		port = 1;
+	} else {
+		direction = SDW_DATA_DIR_TX;
+		port = 2;
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
+	retval = sdw_stream_add_slave(rt5682->slave, &stream_config,
+				      &port_config, 1, stream->sdw_stream);
+	if (retval) {
+		dev_err(dai->dev, "Unable to configure port\n");
+		return retval;
+	}
+
+	switch (params_rate(params)) {
+	case 48000:
+		val_p = RT5682_SDW_REF_1_48K;
+		val_c = RT5682_SDW_REF_2_48K;
+		break;
+	case 96000:
+		val_p = RT5682_SDW_REF_1_96K;
+		val_c = RT5682_SDW_REF_2_96K;
+		break;
+	case 192000:
+		val_p = RT5682_SDW_REF_1_192K;
+		val_c = RT5682_SDW_REF_2_192K;
+		break;
+	case 32000:
+		val_p = RT5682_SDW_REF_1_32K;
+		val_c = RT5682_SDW_REF_2_32K;
+		break;
+	case 24000:
+		val_p = RT5682_SDW_REF_1_24K;
+		val_c = RT5682_SDW_REF_2_24K;
+		break;
+	case 16000:
+		val_p = RT5682_SDW_REF_1_16K;
+		val_c = RT5682_SDW_REF_2_16K;
+		break;
+	case 12000:
+		val_p = RT5682_SDW_REF_1_12K;
+		val_c = RT5682_SDW_REF_2_12K;
+		break;
+	case 8000:
+		val_p = RT5682_SDW_REF_1_8K;
+		val_c = RT5682_SDW_REF_2_8K;
+		break;
+	case 44100:
+		val_p = RT5682_SDW_REF_1_44K;
+		val_c = RT5682_SDW_REF_2_44K;
+		break;
+	case 88200:
+		val_p = RT5682_SDW_REF_1_88K;
+		val_c = RT5682_SDW_REF_2_88K;
+		break;
+	case 176400:
+		val_p = RT5682_SDW_REF_1_176K;
+		val_c = RT5682_SDW_REF_2_176K;
+		break;
+	case 22050:
+		val_p = RT5682_SDW_REF_1_22K;
+		val_c = RT5682_SDW_REF_2_22K;
+		break;
+	case 11025:
+		val_p = RT5682_SDW_REF_1_11K;
+		val_c = RT5682_SDW_REF_2_11K;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (params_rate(params) <= 48000) {
+		osr_p = RT5682_DAC_OSR_D_8;
+		osr_c = RT5682_ADC_OSR_D_8;
+	} else if (params_rate(params) <= 96000) {
+		osr_p = RT5682_DAC_OSR_D_4;
+		osr_c = RT5682_ADC_OSR_D_4;
+	} else {
+		osr_p = RT5682_DAC_OSR_D_2;
+		osr_c = RT5682_ADC_OSR_D_2;
+	}
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		regmap_update_bits(rt5682->regmap, RT5682_SDW_REF_CLK,
+			RT5682_SDW_REF_1_MASK, val_p);
+		regmap_update_bits(rt5682->regmap, RT5682_ADDA_CLK_1,
+			RT5682_DAC_OSR_MASK, osr_p);
+	} else {
+		regmap_update_bits(rt5682->regmap, RT5682_SDW_REF_CLK,
+			RT5682_SDW_REF_2_MASK, val_c);
+		regmap_update_bits(rt5682->regmap, RT5682_ADDA_CLK_1,
+			RT5682_ADC_OSR_MASK, osr_c);
+	}
+
+	return retval;
+}
+
+static int rt5682_sdw_hw_free(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
+	struct sdw_stream_data *stream =
+		snd_soc_dai_get_dma_data(dai, substream);
+
+	if (!rt5682->slave)
+		return -EINVAL;
+
+	sdw_stream_remove_slave(rt5682->slave, stream->sdw_stream);
+	return 0;
+}
+
+static struct snd_soc_dai_ops rt5682_sdw_ops = {
+	.hw_params	= rt5682_sdw_hw_params,
+	.hw_free	= rt5682_sdw_hw_free,
+	.set_sdw_stream	= rt5682_set_sdw_stream,
+	.shutdown	= rt5682_sdw_shutdown,
+};
+#endif
+
 static struct snd_soc_dai_driver rt5682_dai[] = {
 	{
 		.name = "rt5682-aif1",
@@ -2946,6 +3158,27 @@ static struct snd_soc_dai_driver rt5682_dai[] = {
 		},
 		.ops = &rt5682_aif2_dai_ops,
 	},
+#if IS_ENABLED(CONFIG_SND_SOC_RT5682_SDW)
+	{
+		.name = "rt5682-sdw",
+		.id = RT5682_SDW,
+		.playback = {
+			.stream_name = "SDW Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = RT5682_STEREO_RATES,
+			.formats = RT5682_FORMATS,
+		},
+		.capture = {
+			.stream_name = "SDW Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = RT5682_STEREO_RATES,
+			.formats = RT5682_FORMATS,
+		},
+		.ops = &rt5682_sdw_ops,
+	},
+#endif
 };
 
 static const struct snd_soc_component_driver soc_component_dev_rt5682 = {
@@ -3064,6 +3297,219 @@ static void rt5682_calibrate(struct rt5682_priv *rt5682)
 
 }
 
+#if IS_ENABLED(CONFIG_SND_SOC_RT5682_SDW)
+static int rt5682_sdw_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct device *dev = context;
+	struct rt5682_priv *rt5682 = dev_get_drvdata(dev);
+	unsigned int data_l, data_h;
+
+	regmap_write(rt5682->sdw_regmap, RT5682_SDW_CMD, 0);
+	regmap_write(rt5682->sdw_regmap, RT5682_SDW_ADDR_H, (reg >> 8) & 0xff);
+	regmap_write(rt5682->sdw_regmap, RT5682_SDW_ADDR_L, (reg & 0xff));
+	regmap_read(rt5682->sdw_regmap, RT5682_SDW_DATA_H, &data_h);
+	regmap_read(rt5682->sdw_regmap, RT5682_SDW_DATA_L, &data_l);
+
+	*val = (data_h << 8) | data_l;
+
+	dev_vdbg(dev, "[%s] %04x => %04x\n", __func__, reg, *val);
+
+	return 0;
+}
+
+static int rt5682_sdw_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct device *dev = context;
+	struct rt5682_priv *rt5682 = dev_get_drvdata(dev);
+
+	regmap_write(rt5682->sdw_regmap, RT5682_SDW_CMD, 1);
+	regmap_write(rt5682->sdw_regmap, RT5682_SDW_ADDR_H, (reg >> 8) & 0xff);
+	regmap_write(rt5682->sdw_regmap, RT5682_SDW_ADDR_L, (reg & 0xff));
+	regmap_write(rt5682->sdw_regmap, RT5682_SDW_DATA_H, (val >> 8) & 0xff);
+	regmap_write(rt5682->sdw_regmap, RT5682_SDW_DATA_L, (val & 0xff));
+
+	dev_vdbg(dev, "[%s] %04x <= %04x\n", __func__, reg, val);
+
+	return 0;
+}
+
+static const struct regmap_config rt5682_sdw_regmap = {
+	.reg_bits = 16,
+	.val_bits = 16,
+	.max_register = RT5682_I2C_MODE,
+	.volatile_reg = rt5682_volatile_register,
+	.readable_reg = rt5682_readable_register,
+	.cache_type = REGCACHE_RBTREE,
+	.reg_defaults = rt5682_reg,
+	.num_reg_defaults = ARRAY_SIZE(rt5682_reg),
+	.use_single_read = true,
+	.use_single_write = true,
+	.reg_read = rt5682_sdw_read,
+	.reg_write = rt5682_sdw_write,
+};
+
+int rt5682_sdw_init(struct device *dev, struct regmap *regmap,
+	struct sdw_slave *slave)
+{
+	struct rt5682_priv *rt5682;
+	int ret;
+
+	rt5682 = devm_kzalloc(dev, sizeof(*rt5682), GFP_KERNEL);
+	if (!rt5682)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, rt5682);
+	rt5682->slave = slave;
+	rt5682->sdw_regmap = regmap;
+	rt5682->is_sdw = true;
+
+	rt5682->regmap = devm_regmap_init(dev, NULL, dev, &rt5682_sdw_regmap);
+	if (IS_ERR(rt5682->regmap)) {
+		ret = PTR_ERR(rt5682->regmap);
+		dev_err(dev, "Failed to allocate register map: %d\n",
+			ret);
+		return ret;
+	}
+
+	/*
+	 * Mark hw_init to false
+	 * HW init will be performed when device reports present
+	 */
+	rt5682->hw_init = false;
+	rt5682->first_hw_init = false;
+
+	mutex_init(&rt5682->calibrate_mutex);
+	INIT_DELAYED_WORK(&rt5682->jack_detect_work,
+		rt5682_jack_detect_handler);
+
+	ret = devm_snd_soc_register_component(dev, &soc_component_dev_rt5682,
+		rt5682_dai, ARRAY_SIZE(rt5682_dai));
+
+	dev_dbg(&slave->dev, "%s\n", __func__);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(rt5682_sdw_init);
+
+int rt5682_io_init(struct device *dev, struct sdw_slave *slave)
+{
+	struct rt5682_priv *rt5682 = dev_get_drvdata(dev);
+	int ret = 0;
+	unsigned int val;
+
+	if (rt5682->hw_init)
+		return 0;
+
+	regmap_read(rt5682->regmap, RT5682_DEVICE_ID, &val);
+	if (val != DEVICE_ID) {
+		pr_err("Device with ID register %x is not rt5682\n", val);
+		return -ENODEV;
+	}
+
+	/*
+	 * PM runtime is only enabled when a Slave reports as Attached
+	 */
+	if (!rt5682->first_hw_init) {
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
+	rt5682_reset(rt5682);
+
+	if (rt5682->first_hw_init) {
+		regcache_cache_only(rt5682->regmap, false);
+		regcache_cache_bypass(rt5682->regmap, true);
+	}
+
+	rt5682_calibrate(rt5682);
+
+	if (rt5682->first_hw_init) {
+		regcache_cache_bypass(rt5682->regmap, false);
+		regcache_mark_dirty(rt5682->regmap);
+		regcache_sync(rt5682->regmap);
+
+		/* volatile registers */
+		regmap_update_bits(rt5682->regmap, RT5682_CBJ_CTRL_2,
+			RT5682_EXT_JD_SRC, RT5682_EXT_JD_SRC_MANUAL);
+
+		goto reinit;
+	}
+
+	ret = regmap_multi_reg_write(rt5682->regmap, patch_list,
+				    ARRAY_SIZE(patch_list));
+	if (ret != 0)
+		dev_warn(dev, "Failed to apply regmap patch: %d\n", ret);
+
+	regmap_write(rt5682->regmap, RT5682_DEPOP_1, 0x0000);
+
+	regmap_update_bits(rt5682->regmap, RT5682_PWR_ANLG_1,
+			RT5682_LDO1_DVO_MASK | RT5682_HP_DRIVER_MASK,
+			RT5682_LDO1_DVO_12 | RT5682_HP_DRIVER_5X);
+	regmap_write(rt5682->regmap, RT5682_MICBIAS_2, 0x0380);
+	regmap_write(rt5682->regmap, RT5682_TEST_MODE_CTRL_1, 0x0000);
+	regmap_update_bits(rt5682->regmap, RT5682_BIAS_CUR_CTRL_8,
+			RT5682_HPA_CP_BIAS_CTRL_MASK, RT5682_HPA_CP_BIAS_3UA);
+	regmap_update_bits(rt5682->regmap, RT5682_CHARGE_PUMP_1,
+			RT5682_CP_CLK_HP_MASK, RT5682_CP_CLK_HP_300KHZ);
+
+	/* Soundwire */
+	regmap_write(rt5682->regmap, RT5682_PLL2_INTERNAL, 0xa266);
+	regmap_write(rt5682->regmap, RT5682_PLL2_CTRL_1, 0x1700);
+	regmap_write(rt5682->regmap, RT5682_PLL2_CTRL_2, 0x0006);
+	regmap_write(rt5682->regmap, RT5682_PLL2_CTRL_3, 0x2600);
+	regmap_write(rt5682->regmap, RT5682_PLL2_CTRL_4, 0x0c8f);
+	regmap_write(rt5682->regmap, RT5682_PLL_TRACK_2, 0x3000);
+	regmap_write(rt5682->regmap, RT5682_PLL_TRACK_3, 0x4000);
+	regmap_update_bits(rt5682->regmap, RT5682_GLB_CLK,
+		RT5682_SCLK_SRC_MASK | RT5682_PLL2_SRC_MASK,
+		RT5682_SCLK_SRC_PLL2 | RT5682_PLL2_SRC_SDW);
+
+	regmap_update_bits(rt5682->regmap, RT5682_CBJ_CTRL_2,
+		RT5682_EXT_JD_SRC, RT5682_EXT_JD_SRC_MANUAL);
+	regmap_write(rt5682->regmap, RT5682_CBJ_CTRL_1, 0xd042);
+	regmap_update_bits(rt5682->regmap, RT5682_CBJ_CTRL_3,
+		RT5682_CBJ_IN_BUF_EN, RT5682_CBJ_IN_BUF_EN);
+	regmap_update_bits(rt5682->regmap, RT5682_SAR_IL_CMD_1,
+		RT5682_SAR_POW_MASK, RT5682_SAR_POW_EN);
+	regmap_update_bits(rt5682->regmap, RT5682_RC_CLK_CTRL,
+			RT5682_POW_IRQ | RT5682_POW_JDH |
+			RT5682_POW_ANA, RT5682_POW_IRQ |
+			RT5682_POW_JDH | RT5682_POW_ANA);
+	regmap_update_bits(rt5682->regmap, RT5682_PWR_ANLG_2,
+		RT5682_PWR_JDH, RT5682_PWR_JDH);
+	regmap_update_bits(rt5682->regmap, RT5682_IRQ_CTRL_2,
+		RT5682_JD1_EN_MASK | RT5682_JD1_IRQ_MASK,
+		RT5682_JD1_EN | RT5682_JD1_IRQ_PUL);
+
+reinit:
+	mod_delayed_work(system_power_efficient_wq,
+		   &rt5682->jack_detect_work, msecs_to_jiffies(250));
+
+	/* Mark Slave initialization complete */
+	rt5682->hw_init = true;
+	rt5682->first_hw_init = true;
+
+	pm_runtime_mark_last_busy(&slave->dev);
+	pm_runtime_put_autosuspend(&slave->dev);
+
+	dev_dbg(&slave->dev, "%s hw_init complete\n", __func__);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(rt5682_io_init);
+#endif
+
 static int rt5682_i2c_probe(struct i2c_client *i2c,
 		    const struct i2c_device_id *id)
 {
diff --git a/sound/soc/codecs/rt5682.h b/sound/soc/codecs/rt5682.h
index f82126a6f211..43de6e802309 100644
--- a/sound/soc/codecs/rt5682.h
+++ b/sound/soc/codecs/rt5682.h
@@ -10,6 +10,12 @@
 #define __RT5682_H__
 
 #include <sound/rt5682.h>
+#include <linux/regulator/consumer.h>
+#include <linux/clk.h>
+#include <linux/clkdev.h>
+#include <linux/clk-provider.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
 
 #define DEVICE_ID 0x6530
 
@@ -1355,6 +1361,7 @@ enum {
 enum {
 	RT5682_AIF1,
 	RT5682_AIF2,
+	RT5682_SDW,
 	RT5682_AIFS
 };
 
@@ -1370,7 +1377,49 @@ enum {
 	RT5682_CLK_SEL_I2S2_ASRC,
 };
 
+#define RT5682_NUM_SUPPLIES 3
+
+struct rt5682_priv {
+	struct snd_soc_component *component;
+	struct rt5682_platform_data pdata;
+	struct regmap *regmap;
+	struct regmap *sdw_regmap;
+	struct snd_soc_jack *hs_jack;
+	struct regulator_bulk_data supplies[RT5682_NUM_SUPPLIES];
+	struct delayed_work jack_detect_work;
+	struct delayed_work jd_check_work;
+	struct mutex calibrate_mutex;
+	struct sdw_slave *slave;
+	enum sdw_slave_status status;
+	struct sdw_bus_params params;
+	bool hw_init;
+	bool first_hw_init;
+	bool is_sdw;
+
+#ifdef CONFIG_COMMON_CLK
+	struct clk_hw dai_clks_hw[RT5682_DAI_NUM_CLKS];
+	struct clk_lookup *dai_clks_lookup[RT5682_DAI_NUM_CLKS];
+	struct clk *dai_clks[RT5682_DAI_NUM_CLKS];
+	struct clk *mclk;
+#endif
+
+	int sysclk;
+	int sysclk_src;
+	int lrck[RT5682_AIFS];
+	int bclk[RT5682_AIFS];
+	int master[RT5682_AIFS];
+
+	int pll_src[RT5682_PLLS];
+	int pll_in[RT5682_PLLS];
+	int pll_out[RT5682_PLLS];
+
+	int jack_type;
+};
+
 int rt5682_sel_asrc_clk_src(struct snd_soc_component *component,
 		unsigned int filter_mask, unsigned int clk_src);
+int rt5682_sdw_init(struct device *dev, struct regmap *regmap,
+	       struct sdw_slave *slave);
+int rt5682_io_init(struct device *dev, struct sdw_slave *slave);
 
 #endif /* __RT5682_H__ */
-- 
2.25.0

