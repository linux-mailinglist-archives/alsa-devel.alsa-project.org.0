Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C437F68D242
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Feb 2023 10:11:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F28820B;
	Tue,  7 Feb 2023 10:10:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F28820B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675761091;
	bh=Zqe4FHU3KWQ7LrxG8JQDPC1poRkqozozDUIRdOZMsis=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=cib5R9BS9u7OqfZM/codNugBl4OMh5CBIBg88F2l+kjxKRlS5NReXCkzxIh5gOFc4
	 suNxYd9uuj6Wt801tzUYRrsXapoX7nnrsi5VvYihUhS5ABdmNpXwGCzZ28uKLq6DYD
	 3x4NYCrRbjSHbB8FBRCOSYS1SWVMQbc5NWaQ8WoU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E910EF804AA;
	Tue,  7 Feb 2023 10:10:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 161DFF8045D; Tue,  7 Feb 2023 10:10:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48BD6F8014C
 for <alsa-devel@alsa-project.org>; Tue,  7 Feb 2023 10:10:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48BD6F8014C
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 31799k7gA021846,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
 by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 31799k7gA021846
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
 Tue, 7 Feb 2023 17:09:46 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.9; Tue, 7 Feb 2023 17:09:53 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 7 Feb 2023 17:09:52 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt712-sdca: Add RT712 SDCA driver for Jack and Amp
 topology
Date: Tue, 7 Feb 2023 17:09:46 +0800
Message-ID: <20230207090946.20659-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXH36505.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, bard.liao@intel.com,
 Shuming Fan <shumingf@realtek.com>, flove@realtek.com,
 pierre-louis.bossart@intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

This is the initial codec driver for rt712 SDCA (Jack+Amp topology).
The host should connect with rt712 SdW1 interface.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/Kconfig          |    7 +
 sound/soc/codecs/Makefile         |    2 +
 sound/soc/codecs/rt712-sdca-sdw.c |  485 +++++++++++
 sound/soc/codecs/rt712-sdca-sdw.h |  108 +++
 sound/soc/codecs/rt712-sdca.c     | 1328 +++++++++++++++++++++++++++++
 sound/soc/codecs/rt712-sdca.h     |  220 +++++
 6 files changed, 2150 insertions(+)
 create mode 100644 sound/soc/codecs/rt712-sdca-sdw.c
 create mode 100644 sound/soc/codecs/rt712-sdca-sdw.h
 create mode 100644 sound/soc/codecs/rt712-sdca.c
 create mode 100644 sound/soc/codecs/rt712-sdca.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 5028d67cfd8e..02141788ad9d 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -198,6 +198,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_RT700_SDW
 	imply SND_SOC_RT711_SDW
 	imply SND_SOC_RT711_SDCA_SDW
+	imply SND_SOC_RT712_SDCA_SDW
 	imply SND_SOC_RT715_SDW
 	imply SND_SOC_RT715_SDCA_SDW
 	imply SND_SOC_RT1308_SDW
@@ -1462,6 +1463,12 @@ config SND_SOC_RT711_SDCA_SDW
 	select REGMAP_SOUNDWIRE
 	select REGMAP_SOUNDWIRE_MBQ
 
+config SND_SOC_RT712_SDCA_SDW
+	tristate "Realtek RT712 SDCA Codec - SDW"
+	depends on SOUNDWIRE
+	select REGMAP_SOUNDWIRE
+	select REGMAP_SOUNDWIRE_MBQ
+
 config SND_SOC_RT715
 	tristate
 
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index e88cb8b5baec..72faf83138eb 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -227,6 +227,7 @@ snd-soc-rt5682s-objs := rt5682s.o
 snd-soc-rt700-objs := rt700.o rt700-sdw.o
 snd-soc-rt711-objs := rt711.o rt711-sdw.o
 snd-soc-rt711-sdca-objs := rt711-sdca.o rt711-sdca-sdw.o
+snd-soc-rt712-sdca-objs := rt712-sdca.o rt712-sdca-sdw.o
 snd-soc-rt715-objs := rt715.o rt715-sdw.o
 snd-soc-rt715-sdca-objs := rt715-sdca.o rt715-sdca-sdw.o
 snd-soc-rt9120-objs := rt9120.o
@@ -589,6 +590,7 @@ obj-$(CONFIG_SND_SOC_RT5682S)	+= snd-soc-rt5682s.o
 obj-$(CONFIG_SND_SOC_RT700)     += snd-soc-rt700.o
 obj-$(CONFIG_SND_SOC_RT711)     += snd-soc-rt711.o
 obj-$(CONFIG_SND_SOC_RT711_SDCA_SDW)     += snd-soc-rt711-sdca.o
+obj-$(CONFIG_SND_SOC_RT712_SDCA_SDW)     += snd-soc-rt712-sdca.o
 obj-$(CONFIG_SND_SOC_RT715)     += snd-soc-rt715.o
 obj-$(CONFIG_SND_SOC_RT715_SDCA_SDW)     += snd-soc-rt715-sdca.o
 obj-$(CONFIG_SND_SOC_RT9120)	+= snd-soc-rt9120.o
diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
new file mode 100644
index 000000000000..3f319459dfec
--- /dev/null
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -0,0 +1,485 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// rt712-sdca-sdw.c -- rt712 SDCA ALSA SoC audio driver
+//
+// Copyright(c) 2023 Realtek Semiconductor Corp.
+//
+//
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/soundwire/sdw_registers.h>
+#include "rt712-sdca.h"
+#include "rt712-sdca-sdw.h"
+
+static bool rt712_sdca_readable_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case 0x201a ... 0x201f:
+	case 0x2029 ... 0x202a:
+	case 0x202d ... 0x2034:
+	case 0x2230 ... 0x2232:
+	case 0x2f01 ... 0x2f0a:
+	case 0x2f35 ... 0x2f36:
+	case 0x2f50:
+	case 0x2f54:
+	case 0x2f58 ... 0x2f5d:
+	case 0x3201:
+	case 0x320c:
+	case 0x3301 ... 0x3303:
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_GE49, RT712_SDCA_CTL_SELECTED_MODE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_GE49, RT712_SDCA_CTL_DETECTED_MODE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_HID, RT712_SDCA_ENT_HID01, RT712_SDCA_CTL_HIDTX_CURRENT_OWNER, 0) ...
+		SDW_SDCA_CTL(FUNC_NUM_HID, RT712_SDCA_ENT_HID01, RT712_SDCA_CTL_HIDTX_MESSAGE_LENGTH, 0):
+	case RT712_BUF_ADDR_HID1 ... RT712_BUF_ADDR_HID2:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool rt712_sdca_volatile_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case 0x201b:
+	case 0x201c:
+	case 0x201d:
+	case 0x201f:
+	case 0x202d ... 0x202f:
+	case 0x2230:
+	case 0x2f01:
+	case 0x2f35:
+	case 0x320c:
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_GE49, RT712_SDCA_CTL_DETECTED_MODE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_HID, RT712_SDCA_ENT_HID01, RT712_SDCA_CTL_HIDTX_CURRENT_OWNER, 0) ...
+		SDW_SDCA_CTL(FUNC_NUM_HID, RT712_SDCA_ENT_HID01, RT712_SDCA_CTL_HIDTX_MESSAGE_LENGTH, 0):
+	case RT712_BUF_ADDR_HID1 ... RT712_BUF_ADDR_HID2:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool rt712_sdca_mbq_readable_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case 0x2000000 ... 0x200008e:
+	case 0x5300000 ... 0x530000e:
+	case 0x5400000 ... 0x540000e:
+	case 0x5600000 ... 0x5600008:
+	case 0x5700000 ... 0x570000d:
+	case 0x5800000 ... 0x5800021:
+	case 0x5900000 ... 0x5900028:
+	case 0x5a00000 ... 0x5a00009:
+	case 0x5b00000 ... 0x5b00051:
+	case 0x5c00000 ... 0x5c0009a:
+	case 0x5d00000 ... 0x5d00009:
+	case 0x5f00000 ... 0x5f00030:
+	case 0x6100000 ... 0x6100068:
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05, RT712_SDCA_CTL_FU_VOLUME, CH_L):
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05, RT712_SDCA_CTL_FU_VOLUME, CH_R):
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU0F, RT712_SDCA_CTL_FU_VOLUME, CH_L):
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU0F, RT712_SDCA_CTL_FU_VOLUME, CH_R):
+	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_VOLUME, CH_L):
+	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_VOLUME, CH_R):
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool rt712_sdca_mbq_volatile_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case 0x2000000:
+	case 0x200001a:
+	case 0x2000024:
+	case 0x2000046:
+	case 0x200008a:
+	case 0x5800000:
+	case 0x5800001:
+	case 0x6100008:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config rt712_sdca_regmap = {
+	.reg_bits = 32,
+	.val_bits = 8,
+	.readable_reg = rt712_sdca_readable_register,
+	.volatile_reg = rt712_sdca_volatile_register,
+	.max_register = 0x44ffffff,
+	.reg_defaults = rt712_sdca_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(rt712_sdca_reg_defaults),
+	.cache_type = REGCACHE_RBTREE,
+	.use_single_read = true,
+	.use_single_write = true,
+};
+
+static const struct regmap_config rt712_sdca_mbq_regmap = {
+	.name = "sdw-mbq",
+	.reg_bits = 32,
+	.val_bits = 16,
+	.readable_reg = rt712_sdca_mbq_readable_register,
+	.volatile_reg = rt712_sdca_mbq_volatile_register,
+	.max_register = 0x41000312,
+	.reg_defaults = rt712_sdca_mbq_defaults,
+	.num_reg_defaults = ARRAY_SIZE(rt712_sdca_mbq_defaults),
+	.cache_type = REGCACHE_RBTREE,
+	.use_single_read = true,
+	.use_single_write = true,
+};
+
+static int rt712_sdca_update_status(struct sdw_slave *slave,
+				enum sdw_slave_status status)
+{
+	struct rt712_sdca_priv *rt712 = dev_get_drvdata(&slave->dev);
+
+	/* Update the status */
+	rt712->status = status;
+
+	if (status == SDW_SLAVE_UNATTACHED)
+		rt712->hw_init = false;
+
+	if (status == SDW_SLAVE_ATTACHED) {
+		if (rt712->hs_jack) {
+			/*
+			 * Due to the SCP_SDCA_INTMASK will be cleared by any reset, and then
+			 * if the device attached again, we will need to set the setting back.
+			 * It could avoid losing the jack detection interrupt.
+			 * This also could sync with the cache value as the rt712_sdca_jack_init set.
+			 */
+			sdw_write_no_pm(rt712->slave, SDW_SCP_SDCA_INTMASK1,
+				SDW_SCP_SDCA_INTMASK_SDCA_0);
+			sdw_write_no_pm(rt712->slave, SDW_SCP_SDCA_INTMASK2,
+				SDW_SCP_SDCA_INTMASK_SDCA_8);
+		}
+	}
+
+	/*
+	 * Perform initialization only if slave status is present and
+	 * hw_init flag is false
+	 */
+	if (rt712->hw_init || rt712->status != SDW_SLAVE_ATTACHED)
+		return 0;
+
+	/* perform I/O transfers required for Slave initialization */
+	return rt712_sdca_io_init(&slave->dev, slave);
+}
+
+static int rt712_sdca_read_prop(struct sdw_slave *slave)
+{
+	struct sdw_slave_prop *prop = &slave->prop;
+	int nval;
+	int i, j;
+	u32 bit;
+	unsigned long addr;
+	struct sdw_dpn_prop *dpn;
+
+	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
+	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
+
+	prop->paging_support = true;
+
+	/* first we need to allocate memory for set bits in port lists */
+	prop->source_ports = BIT(4); /* BITMAP: 00010000 */
+	prop->sink_ports = BIT(3) | BIT(1); /* BITMAP:  00001010 */
+
+	nval = hweight32(prop->source_ports);
+	prop->src_dpn_prop = devm_kcalloc(&slave->dev, nval,
+		sizeof(*prop->src_dpn_prop), GFP_KERNEL);
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
+	prop->sink_dpn_prop = devm_kcalloc(&slave->dev, nval,
+		sizeof(*prop->sink_dpn_prop), GFP_KERNEL);
+	if (!prop->sink_dpn_prop)
+		return -ENOMEM;
+
+	j = 0;
+	dpn = prop->sink_dpn_prop;
+	addr = prop->sink_ports;
+	for_each_set_bit(bit, &addr, 32) {
+		dpn[j].num = bit;
+		dpn[j].type = SDW_DPN_FULL;
+		dpn[j].simple_ch_prep_sm = true;
+		dpn[j].ch_prep_timeout = 10;
+		j++;
+	}
+
+	/* set the timeout values */
+	prop->clk_stop_timeout = 1380;
+
+	/* wake-up event */
+	prop->wake_capable = 1;
+
+	return 0;
+}
+
+static int rt712_sdca_interrupt_callback(struct sdw_slave *slave,
+					struct sdw_slave_intr_status *status)
+{
+	struct rt712_sdca_priv *rt712 = dev_get_drvdata(&slave->dev);
+	int ret, stat;
+	int count = 0, retry = 3;
+	unsigned int sdca_cascade, scp_sdca_stat1, scp_sdca_stat2 = 0;
+
+	dev_dbg(&slave->dev,
+		"%s control_port_stat=%x, sdca_cascade=%x", __func__,
+		status->control_port, status->sdca_cascade);
+
+	if (cancel_delayed_work_sync(&rt712->jack_detect_work)) {
+		dev_warn(&slave->dev, "%s the pending delayed_work was cancelled", __func__);
+		/* avoid the HID owner doesn't change to device */
+		if (rt712->scp_sdca_stat2)
+			scp_sdca_stat2 = rt712->scp_sdca_stat2;
+	}
+
+	/*
+	 * The critical section below intentionally protects a rather large piece of code.
+	 * We don't want to allow the system suspend to disable an interrupt while we are
+	 * processing it, which could be problematic given the quirky SoundWire interrupt
+	 * scheme. We do want however to prevent new workqueues from being scheduled if
+	 * the disable_irq flag was set during system suspend.
+	 */
+	mutex_lock(&rt712->disable_irq_lock);
+
+	ret = sdw_read_no_pm(rt712->slave, SDW_SCP_SDCA_INT1);
+	if (ret < 0)
+		goto io_error;
+	rt712->scp_sdca_stat1 = ret;
+	ret = sdw_read_no_pm(rt712->slave, SDW_SCP_SDCA_INT2);
+	if (ret < 0)
+		goto io_error;
+	rt712->scp_sdca_stat2 = ret;
+	if (scp_sdca_stat2)
+		rt712->scp_sdca_stat2 |= scp_sdca_stat2;
+
+	do {
+		/* clear flag */
+		ret = sdw_read_no_pm(rt712->slave, SDW_SCP_SDCA_INT1);
+		if (ret < 0)
+			goto io_error;
+		if (ret & SDW_SCP_SDCA_INTMASK_SDCA_0) {
+			ret = sdw_write_no_pm(rt712->slave, SDW_SCP_SDCA_INT1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+			if (ret < 0)
+				goto io_error;
+		}
+		ret = sdw_read_no_pm(rt712->slave, SDW_SCP_SDCA_INT2);
+		if (ret < 0)
+			goto io_error;
+		if (ret & SDW_SCP_SDCA_INTMASK_SDCA_8) {
+			ret = sdw_write_no_pm(rt712->slave, SDW_SCP_SDCA_INT2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+			if (ret < 0)
+				goto io_error;
+		}
+
+		/* check if flag clear or not */
+		ret = sdw_read_no_pm(rt712->slave, SDW_DP0_INT);
+		if (ret < 0)
+			goto io_error;
+		sdca_cascade = ret & SDW_DP0_SDCA_CASCADE;
+
+		ret = sdw_read_no_pm(rt712->slave, SDW_SCP_SDCA_INT1);
+		if (ret < 0)
+			goto io_error;
+		scp_sdca_stat1 = ret & SDW_SCP_SDCA_INTMASK_SDCA_0;
+
+		ret = sdw_read_no_pm(rt712->slave, SDW_SCP_SDCA_INT2);
+		if (ret < 0)
+			goto io_error;
+		scp_sdca_stat2 = ret & SDW_SCP_SDCA_INTMASK_SDCA_8;
+
+		stat = scp_sdca_stat1 || scp_sdca_stat2 || sdca_cascade;
+
+		count++;
+	} while (stat != 0 && count < retry);
+
+	if (stat)
+		dev_warn(&slave->dev,
+			"%s scp_sdca_stat1=0x%x, scp_sdca_stat2=0x%x\n", __func__,
+			rt712->scp_sdca_stat1, rt712->scp_sdca_stat2);
+
+	if (status->sdca_cascade && !rt712->disable_irq)
+		mod_delayed_work(system_power_efficient_wq,
+			&rt712->jack_detect_work, msecs_to_jiffies(30));
+
+	mutex_unlock(&rt712->disable_irq_lock);
+
+	return 0;
+
+io_error:
+	mutex_unlock(&rt712->disable_irq_lock);
+	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
+	return ret;
+}
+
+static struct sdw_slave_ops rt712_sdca_slave_ops = {
+	.read_prop = rt712_sdca_read_prop,
+	.interrupt_callback = rt712_sdca_interrupt_callback,
+	.update_status = rt712_sdca_update_status,
+};
+
+static int rt712_sdca_sdw_probe(struct sdw_slave *slave,
+				const struct sdw_device_id *id)
+{
+	struct regmap *regmap, *mbq_regmap;
+
+	/* Regmap Initialization */
+	mbq_regmap = devm_regmap_init_sdw_mbq(slave, &rt712_sdca_mbq_regmap);
+	if (IS_ERR(mbq_regmap))
+		return PTR_ERR(mbq_regmap);
+
+	regmap = devm_regmap_init_sdw(slave, &rt712_sdca_regmap);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	return rt712_sdca_init(&slave->dev, regmap, mbq_regmap, slave);
+}
+
+static int rt712_sdca_sdw_remove(struct sdw_slave *slave)
+{
+	struct rt712_sdca_priv *rt712 = dev_get_drvdata(&slave->dev);
+
+	if (rt712->hw_init) {
+		cancel_delayed_work_sync(&rt712->jack_detect_work);
+		cancel_delayed_work_sync(&rt712->jack_btn_check_work);
+	}
+
+	if (rt712->first_hw_init)
+		pm_runtime_disable(&slave->dev);
+
+	mutex_destroy(&rt712->calibrate_mutex);
+	mutex_destroy(&rt712->disable_irq_lock);
+
+	return 0;
+}
+
+static const struct sdw_device_id rt712_sdca_id[] = {
+	SDW_SLAVE_ENTRY_EXT(0x025d, 0x712, 0x3, 0x1, 0),
+	SDW_SLAVE_ENTRY_EXT(0x025d, 0x713, 0x3, 0x1, 0),
+	SDW_SLAVE_ENTRY_EXT(0x025d, 0x716, 0x3, 0x1, 0),
+	SDW_SLAVE_ENTRY_EXT(0x025d, 0x717, 0x3, 0x1, 0),
+	{},
+};
+MODULE_DEVICE_TABLE(sdw, rt712_sdca_id);
+
+static int __maybe_unused rt712_sdca_dev_suspend(struct device *dev)
+{
+	struct rt712_sdca_priv *rt712 = dev_get_drvdata(dev);
+
+	if (!rt712->hw_init)
+		return 0;
+
+	cancel_delayed_work_sync(&rt712->jack_detect_work);
+	cancel_delayed_work_sync(&rt712->jack_btn_check_work);
+
+	regcache_cache_only(rt712->regmap, true);
+	regcache_cache_only(rt712->mbq_regmap, true);
+
+	return 0;
+}
+
+static int __maybe_unused rt712_sdca_dev_system_suspend(struct device *dev)
+{
+	struct rt712_sdca_priv *rt712_sdca = dev_get_drvdata(dev);
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	int ret1, ret2;
+
+	if (!rt712_sdca->hw_init)
+		return 0;
+
+	/*
+	 * prevent new interrupts from being handled after the
+	 * deferred work completes and before the parent disables
+	 * interrupts on the link
+	 */
+	mutex_lock(&rt712_sdca->disable_irq_lock);
+	rt712_sdca->disable_irq = true;
+	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	mutex_unlock(&rt712_sdca->disable_irq_lock);
+
+	if (ret1 < 0 || ret2 < 0) {
+		/* log but don't prevent suspend from happening */
+		dev_dbg(&slave->dev, "%s: could not disable SDCA interrupts\n:", __func__);
+	}
+
+	return rt712_sdca_dev_suspend(dev);
+}
+
+#define RT712_PROBE_TIMEOUT 5000
+
+static int __maybe_unused rt712_sdca_dev_resume(struct device *dev)
+{
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	struct rt712_sdca_priv *rt712 = dev_get_drvdata(dev);
+	unsigned long time;
+
+	if (!rt712->first_hw_init)
+		return 0;
+
+	if (!slave->unattach_request)
+		goto regmap_sync;
+
+	time = wait_for_completion_timeout(&slave->initialization_complete,
+				msecs_to_jiffies(RT712_PROBE_TIMEOUT));
+	if (!time) {
+		dev_err(&slave->dev, "Initialization not complete, timed out\n");
+		sdw_show_ping_status(slave->bus, true);
+
+		return -ETIMEDOUT;
+	}
+
+regmap_sync:
+	slave->unattach_request = 0;
+	regcache_cache_only(rt712->regmap, false);
+	regcache_sync(rt712->regmap);
+	regcache_cache_only(rt712->mbq_regmap, false);
+	regcache_sync(rt712->mbq_regmap);
+	return 0;
+}
+
+static const struct dev_pm_ops rt712_sdca_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(rt712_sdca_dev_system_suspend, rt712_sdca_dev_resume)
+	SET_RUNTIME_PM_OPS(rt712_sdca_dev_suspend, rt712_sdca_dev_resume, NULL)
+};
+
+static struct sdw_driver rt712_sdca_sdw_driver = {
+	.driver = {
+		.name = "rt712-sdca",
+		.owner = THIS_MODULE,
+		.pm = &rt712_sdca_pm,
+	},
+	.probe = rt712_sdca_sdw_probe,
+	.remove = rt712_sdca_sdw_remove,
+	.ops = &rt712_sdca_slave_ops,
+	.id_table = rt712_sdca_id,
+};
+module_sdw_driver(rt712_sdca_sdw_driver);
+
+MODULE_DESCRIPTION("ASoC RT712 SDCA SDW driver");
+MODULE_AUTHOR("Shuming Fan <shumingf@realtek.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/rt712-sdca-sdw.h b/sound/soc/codecs/rt712-sdca-sdw.h
new file mode 100644
index 000000000000..4be22ccd8561
--- /dev/null
+++ b/sound/soc/codecs/rt712-sdca-sdw.h
@@ -0,0 +1,108 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * rt712-sdca-sdw.h -- RT712 SDCA ALSA SoC audio driver header
+ *
+ * Copyright(c) 2023 Realtek Semiconductor Corp.
+ */
+
+#ifndef __RT712_SDW_H__
+#define __RT712_SDW_H__
+
+#include <linux/regmap.h>
+#include <linux/soundwire/sdw_registers.h>
+
+static const struct reg_default rt712_sdca_reg_defaults[] = {
+	{ 0x201a, 0x00 },
+	{ 0x201b, 0x00 },
+	{ 0x201c, 0x00 },
+	{ 0x201d, 0x00 },
+	{ 0x201e, 0x00 },
+	{ 0x201f, 0x00 },
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
+	{ 0x2f01, 0x00 },
+	{ 0x2f02, 0x09 },
+	{ 0x2f03, 0x00 },
+	{ 0x2f04, 0x00 },
+	{ 0x2f05, 0x0b },
+	{ 0x2f06, 0x01 },
+	{ 0x2f08, 0x00 },
+	{ 0x2f09, 0x00 },
+	{ 0x2f0a, 0x01 },
+	{ 0x2f35, 0x01 },
+	{ 0x2f36, 0xcf },
+	{ 0x2f50, 0x0f },
+	{ 0x2f54, 0x01 },
+	{ 0x2f58, 0x07 },
+	{ 0x2f59, 0x09 },
+	{ 0x2f5a, 0x01 },
+	{ 0x2f5b, 0x07 },
+	{ 0x2f5c, 0x05 },
+	{ 0x2f5d, 0x05 },
+	{ 0x3201, 0x01 },
+	{ 0x320c, 0x00 },
+	{ 0x3301, 0x01 },
+	{ 0x3302, 0x00 },
+	{ 0x3303, 0x1f },
+	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_CS01, RT712_SDCA_CTL_SAMPLE_FREQ_INDEX, 0), 0x09 },
+	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_CS11, RT712_SDCA_CTL_SAMPLE_FREQ_INDEX, 0), 0x09 },
+	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05, RT712_SDCA_CTL_FU_MUTE, CH_L), 0x01 },
+	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05, RT712_SDCA_CTL_FU_MUTE, CH_R), 0x01 },
+	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU0F, RT712_SDCA_CTL_FU_MUTE, CH_L), 0x01 },
+	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU0F, RT712_SDCA_CTL_FU_MUTE, CH_R), 0x01 },
+	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_PDE40, RT712_SDCA_CTL_REQ_POWER_STATE, 0), 0x03 },
+	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_PDE12, RT712_SDCA_CTL_REQ_POWER_STATE, 0), 0x03 },
+	{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_CS31, RT712_SDCA_CTL_SAMPLE_FREQ_INDEX, 0), 0x09 },
+	{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_PDE23, RT712_SDCA_CTL_REQ_POWER_STATE, 0), 0x03 },
+	{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_MUTE, CH_L), 0x01 },
+	{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_MUTE, CH_R), 0x01 },
+	{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_OT23, RT712_SDCA_CTL_VENDOR_DEF, 0), 0x00 },
+};
+
+static const struct reg_default rt712_sdca_mbq_defaults[] = {
+	{ 0x2000004, 0xaa01 },
+	{ 0x200000e, 0x21e0 },
+	{ 0x2000024, 0x01ba },
+	{ 0x200004a, 0x8830 },
+	{ 0x2000067, 0xf100 },
+	{ 0x5800000, 0x1893 },
+	{ 0x5b00000, 0x0407 },
+	{ 0x5b00005, 0x0000 },
+	{ 0x5b00029, 0x3fff },
+	{ 0x5b0002a, 0xf000 },
+	{ 0x5f00008, 0x7000 },
+	{ 0x610000e, 0x0007 },
+	{ 0x6100022, 0x2828 },
+	{ 0x6100023, 0x2929 },
+	{ 0x6100026, 0x2c29 },
+	{ 0x610002c, 0x4150 },
+	{ 0x6100045, 0x0860 },
+	{ 0x6100046, 0x0029 },
+	{ 0x6100053, 0x3fff },
+	{ 0x6100055, 0x0000 },
+	{ 0x6100060, 0x0000 },
+	{ 0x6100064, 0x8000 },
+	{ 0x6100065, 0x0000 },
+	{ 0x6100067, 0xff12 },
+	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05, RT712_SDCA_CTL_FU_VOLUME, CH_L), 0x0000 },
+	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05, RT712_SDCA_CTL_FU_VOLUME, CH_R), 0x0000 },
+	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU0F, RT712_SDCA_CTL_FU_VOLUME, CH_L), 0x0000 },
+	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU0F, RT712_SDCA_CTL_FU_VOLUME, CH_R), 0x0000 },
+	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_PLATFORM_FU44, RT712_SDCA_CTL_FU_CH_GAIN, CH_L), 0x0000 },
+	{ SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_PLATFORM_FU44, RT712_SDCA_CTL_FU_CH_GAIN, CH_R), 0x0000 },
+	{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_VOLUME, CH_L), 0x0000 },
+	{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_VOLUME, CH_R), 0x0000 },
+};
+
+#endif /* __RT712_SDW_H__ */
diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
new file mode 100644
index 000000000000..cc3f6dae1871
--- /dev/null
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -0,0 +1,1328 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// rt712-sdca.c -- rt712 SDCA ALSA SoC audio driver
+//
+// Copyright(c) 2023 Realtek Semiconductor Corp.
+//
+//
+
+#include <linux/bitops.h>
+#include <sound/core.h>
+#include <linux/delay.h>
+#include <linux/init.h>
+#include <sound/initval.h>
+#include <sound/jack.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/pm_runtime.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <linux/soundwire/sdw_registers.h>
+#include <linux/slab.h>
+#include <sound/soc-dapm.h>
+#include <sound/tlv.h>
+#include "rt712-sdca.h"
+
+static int rt712_sdca_index_write(struct rt712_sdca_priv *rt712,
+		unsigned int nid, unsigned int reg, unsigned int value)
+{
+	int ret;
+	struct regmap *regmap = rt712->mbq_regmap;
+	unsigned int addr = (nid << 20) | reg;
+
+	ret = regmap_write(regmap, addr, value);
+	if (ret < 0)
+		dev_err(&rt712->slave->dev,
+			"Failed to set private value: %06x <= %04x ret=%d\n",
+			addr, value, ret);
+
+	return ret;
+}
+
+static int rt712_sdca_index_read(struct rt712_sdca_priv *rt712,
+		unsigned int nid, unsigned int reg, unsigned int *value)
+{
+	int ret;
+	struct regmap *regmap = rt712->mbq_regmap;
+	unsigned int addr = (nid << 20) | reg;
+
+	ret = regmap_read(regmap, addr, value);
+	if (ret < 0)
+		dev_err(&rt712->slave->dev,
+			"Failed to get private value: %06x => %04x ret=%d\n",
+			addr, *value, ret);
+
+	return ret;
+}
+
+static int rt712_sdca_index_update_bits(struct rt712_sdca_priv *rt712,
+	unsigned int nid, unsigned int reg, unsigned int mask, unsigned int val)
+{
+	unsigned int tmp;
+	int ret;
+
+	ret = rt712_sdca_index_read(rt712, nid, reg, &tmp);
+	if (ret < 0)
+		return ret;
+
+	set_mask_bits(&tmp, mask, val);
+	return rt712_sdca_index_write(rt712, nid, reg, tmp);
+}
+
+static int rt712_sdca_calibration(struct rt712_sdca_priv *rt712)
+{
+	unsigned int val, loop_rc = 0, loop_dc = 0;
+	struct device *dev;
+	struct regmap *regmap = rt712->regmap;
+	int chk_cnt = 100;
+	int ret = 0;
+
+	mutex_lock(&rt712->calibrate_mutex);
+	dev = regmap_get_device(regmap);
+
+	/* Set HP-JD source from JD1 */
+	rt712_sdca_index_write(rt712, RT712_VENDOR_REG, RT712_CC_DET1, 0x043a);
+
+	/* FSM switch to calibration manual mode */
+	rt712_sdca_index_write(rt712, RT712_VENDOR_REG, RT712_FSM_CTL, 0x4100);
+
+	/* Calibration setting */
+	rt712_sdca_index_write(rt712, RT712_VENDOR_CALI, RT712_DAC_DC_CALI_CTL1, 0x7883);
+
+	/* W1C Trigger DC calibration (HP & Class-D) */
+	rt712_sdca_index_write(rt712, RT712_VENDOR_CALI, RT712_DAC_DC_CALI_CTL1, 0xf893);
+
+	/* wait for calibration process */
+	rt712_sdca_index_read(rt712, RT712_VENDOR_CALI,
+		RT712_DAC_DC_CALI_CTL1, &val);
+
+	for (loop_dc = 0; loop_dc < chk_cnt &&
+		(val & RT712_DAC_DC_CALI_TRIGGER); loop_dc++) {
+		usleep_range(10000, 11000);
+		ret = rt712_sdca_index_read(rt712, RT712_VENDOR_CALI,
+			RT712_DAC_DC_CALI_CTL1, &val);
+		if (ret < 0)
+			goto _cali_fail_;
+	}
+	if (loop_dc == chk_cnt)
+		dev_err(dev, "%s, calibration time-out!\n", __func__);
+
+	if (loop_dc == chk_cnt || loop_rc == chk_cnt)
+		ret = -ETIMEDOUT;
+
+_cali_fail_:
+	/* Enable Rldet in FSM */
+	rt712_sdca_index_write(rt712, RT712_VENDOR_REG, RT712_FSM_CTL, 0x4500);
+
+	/* Sensing Lch+Rch */
+	rt712_sdca_index_write(rt712, RT712_VENDOR_IMS_DRE, RT712_IMS_DIGITAL_CTL1, 0x040f);
+
+	/* Sine gen path control */
+	rt712_sdca_index_write(rt712, RT712_VENDOR_IMS_DRE, RT712_IMS_DIGITAL_CTL5, 0x0000);
+
+	/* Release HP-JD, EN_CBJ_TIE_GL/R open, en_osw gating auto done bit */
+	rt712_sdca_index_write(rt712, RT712_VENDOR_REG, RT712_DIGITAL_MISC_CTRL4, 0x0010);
+
+	mutex_unlock(&rt712->calibrate_mutex);
+	dev_dbg(dev, "%s calibration complete, ret=%d\n", __func__, ret);
+	return ret;
+}
+
+static unsigned int rt712_sdca_button_detect(struct rt712_sdca_priv *rt712)
+{
+	unsigned int btn_type = 0, offset, idx, val, owner;
+	int ret;
+	unsigned char buf[3];
+
+	/* get current UMP message owner */
+	ret = regmap_read(rt712->regmap,
+		SDW_SDCA_CTL(FUNC_NUM_HID, RT712_SDCA_ENT_HID01, RT712_SDCA_CTL_HIDTX_CURRENT_OWNER, 0),
+		&owner);
+	if (ret < 0)
+		return 0;
+
+	/* if owner is device then there is no button event from device */
+	if (owner == 1)
+		return 0;
+
+	/* read UMP message offset */
+	ret = regmap_read(rt712->regmap,
+		SDW_SDCA_CTL(FUNC_NUM_HID, RT712_SDCA_ENT_HID01, RT712_SDCA_CTL_HIDTX_MESSAGE_OFFSET, 0),
+		&offset);
+	if (ret < 0)
+		goto _end_btn_det_;
+
+	for (idx = 0; idx < sizeof(buf); idx++) {
+		ret = regmap_read(rt712->regmap,
+			RT712_BUF_ADDR_HID1 + offset + idx, &val);
+		if (ret < 0)
+			goto _end_btn_det_;
+		buf[idx] = val & 0xff;
+	}
+
+	if (buf[0] == 0x11) {
+		switch (buf[1] & 0xf0) {
+		case 0x10:
+			btn_type |= SND_JACK_BTN_2;
+			break;
+		case 0x20:
+			btn_type |= SND_JACK_BTN_3;
+			break;
+		case 0x40:
+			btn_type |= SND_JACK_BTN_0;
+			break;
+		case 0x80:
+			btn_type |= SND_JACK_BTN_1;
+			break;
+		}
+		switch (buf[2]) {
+		case 0x01:
+		case 0x10:
+			btn_type |= SND_JACK_BTN_2;
+			break;
+		case 0x02:
+		case 0x20:
+			btn_type |= SND_JACK_BTN_3;
+			break;
+		case 0x04:
+		case 0x40:
+			btn_type |= SND_JACK_BTN_0;
+			break;
+		case 0x08:
+		case 0x80:
+			btn_type |= SND_JACK_BTN_1;
+			break;
+		}
+	}
+
+_end_btn_det_:
+	/* Host is owner, so set back to device */
+	if (owner == 0)
+		/* set owner to device */
+		regmap_write(rt712->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_HID, RT712_SDCA_ENT_HID01,
+				RT712_SDCA_CTL_HIDTX_SET_OWNER_TO_DEVICE, 0), 0x01);
+
+	return btn_type;
+}
+
+static int rt712_sdca_headset_detect(struct rt712_sdca_priv *rt712)
+{
+	unsigned int det_mode;
+	int ret;
+
+	/* get detected_mode */
+	ret = regmap_read(rt712->regmap,
+		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_GE49, RT712_SDCA_CTL_DETECTED_MODE, 0),
+		&det_mode);
+	if (ret < 0)
+		goto io_error;
+
+	switch (det_mode) {
+	case 0x00:
+		rt712->jack_type = 0;
+		break;
+	case 0x03:
+		rt712->jack_type = SND_JACK_HEADPHONE;
+		break;
+	case 0x05:
+		rt712->jack_type = SND_JACK_HEADSET;
+		break;
+	}
+
+	/* write selected_mode */
+	if (det_mode) {
+		ret = regmap_write(rt712->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_GE49, RT712_SDCA_CTL_SELECTED_MODE, 0),
+			det_mode);
+		if (ret < 0)
+			goto io_error;
+	}
+
+	dev_dbg(&rt712->slave->dev,
+		"%s, detected_mode=0x%x\n", __func__, det_mode);
+
+	return 0;
+
+io_error:
+	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
+	return ret;
+}
+
+static void rt712_sdca_jack_detect_handler(struct work_struct *work)
+{
+	struct rt712_sdca_priv *rt712 =
+		container_of(work, struct rt712_sdca_priv, jack_detect_work.work);
+	int btn_type = 0, ret;
+
+	if (!rt712->hs_jack)
+		return;
+
+	if (!rt712->component->card || !rt712->component->card->instantiated)
+		return;
+
+	/* SDW_SCP_SDCA_INT_SDCA_0 is used for jack detection */
+	if (rt712->scp_sdca_stat1 & SDW_SCP_SDCA_INT_SDCA_0) {
+		ret = rt712_sdca_headset_detect(rt712);
+		if (ret < 0)
+			return;
+	}
+
+	/* SDW_SCP_SDCA_INT_SDCA_8 is used for button detection */
+	if (rt712->scp_sdca_stat2 & SDW_SCP_SDCA_INT_SDCA_8)
+		btn_type = rt712_sdca_button_detect(rt712);
+
+	if (rt712->jack_type == 0)
+		btn_type = 0;
+
+	dev_dbg(&rt712->slave->dev,
+		"in %s, jack_type=0x%x\n", __func__, rt712->jack_type);
+	dev_dbg(&rt712->slave->dev,
+		"in %s, btn_type=0x%x\n", __func__, btn_type);
+	dev_dbg(&rt712->slave->dev,
+		"in %s, scp_sdca_stat1=0x%x, scp_sdca_stat2=0x%x\n", __func__,
+		rt712->scp_sdca_stat1, rt712->scp_sdca_stat2);
+
+	snd_soc_jack_report(rt712->hs_jack, rt712->jack_type | btn_type,
+			SND_JACK_HEADSET |
+			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+			SND_JACK_BTN_2 | SND_JACK_BTN_3);
+
+	if (btn_type) {
+		/* button released */
+		snd_soc_jack_report(rt712->hs_jack, rt712->jack_type,
+			SND_JACK_HEADSET |
+			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+			SND_JACK_BTN_2 | SND_JACK_BTN_3);
+
+		mod_delayed_work(system_power_efficient_wq,
+			&rt712->jack_btn_check_work, msecs_to_jiffies(200));
+	}
+}
+
+static void rt712_sdca_btn_check_handler(struct work_struct *work)
+{
+	struct rt712_sdca_priv *rt712 =
+		container_of(work, struct rt712_sdca_priv, jack_btn_check_work.work);
+	int btn_type = 0, ret, idx;
+	unsigned int det_mode, offset, val;
+	unsigned char buf[3];
+
+	ret = regmap_read(rt712->regmap,
+		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_GE49, RT712_SDCA_CTL_DETECTED_MODE, 0),
+		&det_mode);
+	if (ret < 0)
+		goto io_error;
+
+	/* pin attached */
+	if (det_mode) {
+		/* read UMP message offset */
+		ret = regmap_read(rt712->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_HID, RT712_SDCA_ENT_HID01, RT712_SDCA_CTL_HIDTX_MESSAGE_OFFSET, 0),
+			&offset);
+		if (ret < 0)
+			goto io_error;
+
+		for (idx = 0; idx < sizeof(buf); idx++) {
+			ret = regmap_read(rt712->regmap,
+				RT712_BUF_ADDR_HID1 + offset + idx, &val);
+			if (ret < 0)
+				goto io_error;
+			buf[idx] = val & 0xff;
+		}
+
+		if (buf[0] == 0x11) {
+			switch (buf[1] & 0xf0) {
+			case 0x10:
+				btn_type |= SND_JACK_BTN_2;
+				break;
+			case 0x20:
+				btn_type |= SND_JACK_BTN_3;
+				break;
+			case 0x40:
+				btn_type |= SND_JACK_BTN_0;
+				break;
+			case 0x80:
+				btn_type |= SND_JACK_BTN_1;
+				break;
+			}
+			switch (buf[2]) {
+			case 0x01:
+			case 0x10:
+				btn_type |= SND_JACK_BTN_2;
+				break;
+			case 0x02:
+			case 0x20:
+				btn_type |= SND_JACK_BTN_3;
+				break;
+			case 0x04:
+			case 0x40:
+				btn_type |= SND_JACK_BTN_0;
+				break;
+			case 0x08:
+			case 0x80:
+				btn_type |= SND_JACK_BTN_1;
+				break;
+			}
+		}
+	} else
+		rt712->jack_type = 0;
+
+	dev_dbg(&rt712->slave->dev, "%s, btn_type=0x%x\n",	__func__, btn_type);
+	snd_soc_jack_report(rt712->hs_jack, rt712->jack_type | btn_type,
+			SND_JACK_HEADSET |
+			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+			SND_JACK_BTN_2 | SND_JACK_BTN_3);
+
+	if (btn_type) {
+		/* button released */
+		snd_soc_jack_report(rt712->hs_jack, rt712->jack_type,
+			SND_JACK_HEADSET |
+			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+			SND_JACK_BTN_2 | SND_JACK_BTN_3);
+
+		mod_delayed_work(system_power_efficient_wq,
+			&rt712->jack_btn_check_work, msecs_to_jiffies(200));
+	}
+
+	return;
+
+io_error:
+	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
+}
+
+static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
+{
+	mutex_lock(&rt712->calibrate_mutex);
+
+	if (rt712->hs_jack) {
+		/* Enable HID1 event & set button RTC mode */
+		rt712_sdca_index_write(rt712, RT712_VENDOR_HDA_CTL,
+			RT712_UMP_HID_CTL5, 0xfff0);
+		rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
+			RT712_UMP_HID_CTL0, 0x1100, 0x1100);
+		rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
+			RT712_UMP_HID_CTL7, 0xf000, 0x0000);
+
+		/* detected_mode_change_event_en & hid1_push_button_event_en */
+		rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
+			RT712_GE_RELATED_CTL1, 0x0c00, 0x0c00);
+		/* ge_inbox_en */
+		rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
+			RT712_GE_RELATED_CTL2, 0x0020, 0x0000);
+
+		switch (rt712->jd_src) {
+		case RT712_JD1:
+			/* Set HP-JD source from JD1 */
+			rt712_sdca_index_write(rt712, RT712_VENDOR_REG, RT712_CC_DET1, 0x043a);
+			break;
+		default:
+			dev_warn(rt712->component->dev, "Wrong JD source\n");
+			break;
+		}
+
+		/* set SCP_SDCA_IntMask1[0]=1 */
+		sdw_write_no_pm(rt712->slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
+		/* set SCP_SDCA_IntMask2[0]=1 */
+		sdw_write_no_pm(rt712->slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
+		dev_dbg(&rt712->slave->dev, "in %s enable\n", __func__);
+
+		/* trigger GE interrupt */
+		rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
+			RT712_GE_RELATED_CTL1, 0x0080, 0x0080);
+		rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
+			RT712_GE_RELATED_CTL1, 0x0080, 0x0000);
+	} else {
+		/* disable HID1 & detected_mode_change event */
+		rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
+			RT712_GE_RELATED_CTL1, 0x0c00, 0x0000);
+
+		dev_dbg(&rt712->slave->dev, "in %s disable\n", __func__);
+	}
+
+	mutex_unlock(&rt712->calibrate_mutex);
+}
+
+static int rt712_sdca_set_jack_detect(struct snd_soc_component *component,
+	struct snd_soc_jack *hs_jack, void *data)
+{
+	struct rt712_sdca_priv *rt712 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	rt712->hs_jack = hs_jack;
+
+	ret = pm_runtime_resume_and_get(component->dev);
+	if (ret < 0) {
+		if (ret != -EACCES) {
+			dev_err(component->dev, "%s: failed to resume %d\n", __func__, ret);
+			return ret;
+		}
+
+		/* pm_runtime not enabled yet */
+		dev_dbg(component->dev,	"%s: skipping jack init for now\n", __func__);
+		return 0;
+	}
+
+	rt712_sdca_jack_init(rt712);
+
+	pm_runtime_mark_last_busy(component->dev);
+	pm_runtime_put_autosuspend(component->dev);
+
+	return 0;
+}
+
+/* For SDCA control DAC/ADC Gain */
+static int rt712_sdca_set_gain_put(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct rt712_sdca_priv *rt712 = snd_soc_component_get_drvdata(component);
+	unsigned int read_l, read_r, gain_l_val, gain_r_val;
+	unsigned int adc_vol_flag = 0;
+	unsigned int lvalue, rvalue;
+	const unsigned int interval_offset = 0xc0;
+	const unsigned int tendB = 0xa00;
+
+	if (strstr(ucontrol->id.name, "FU0F Capture Volume"))
+		adc_vol_flag = 1;
+
+	regmap_read(rt712->mbq_regmap, mc->reg, &lvalue);
+	regmap_read(rt712->mbq_regmap, mc->rreg, &rvalue);
+
+	/* L Channel */
+	gain_l_val = ucontrol->value.integer.value[0];
+	if (gain_l_val > mc->max)
+		gain_l_val = mc->max;
+
+	if (mc->shift == 8) /* boost gain */
+		gain_l_val = gain_l_val * tendB;
+	else {
+		/* ADC/DAC gain */
+		if (adc_vol_flag)
+			gain_l_val = 0x1e00 - ((mc->max - gain_l_val) * interval_offset);
+		else
+			gain_l_val = 0 - ((mc->max - gain_l_val) * interval_offset);
+		gain_l_val &= 0xffff;
+	}
+
+	/* R Channel */
+	gain_r_val = ucontrol->value.integer.value[1];
+	if (gain_r_val > mc->max)
+		gain_r_val = mc->max;
+
+	if (mc->shift == 8) /* boost gain */
+		gain_r_val = gain_r_val * tendB;
+	else {
+		/* ADC/DAC gain */
+		if (adc_vol_flag)
+			gain_r_val = 0x1e00 - ((mc->max - gain_r_val) * interval_offset);
+		else
+			gain_r_val = 0 - ((mc->max - gain_r_val) * interval_offset);
+		gain_r_val &= 0xffff;
+	}
+
+	if (lvalue == gain_l_val && rvalue == gain_r_val)
+		return 0;
+
+	/* Lch*/
+	regmap_write(rt712->mbq_regmap, mc->reg, gain_l_val);
+	/* Rch */
+	regmap_write(rt712->mbq_regmap, mc->rreg, gain_r_val);
+
+	regmap_read(rt712->mbq_regmap, mc->reg, &read_l);
+	regmap_read(rt712->mbq_regmap, mc->rreg, &read_r);
+	if (read_r == gain_r_val && read_l == gain_l_val)
+		return 1;
+
+	return -EIO;
+}
+
+static int rt712_sdca_set_gain_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt712_sdca_priv *rt712 = snd_soc_component_get_drvdata(component);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	unsigned int read_l, read_r, ctl_l = 0, ctl_r = 0;
+	unsigned int adc_vol_flag = 0;
+	const unsigned int interval_offset = 0xc0;
+	const unsigned int tendB = 0xa00;
+
+	if (strstr(ucontrol->id.name, "FU0F Capture Volume"))
+		adc_vol_flag = 1;
+
+	regmap_read(rt712->mbq_regmap, mc->reg, &read_l);
+	regmap_read(rt712->mbq_regmap, mc->rreg, &read_r);
+
+	if (mc->shift == 8) /* boost gain */
+		ctl_l = read_l / tendB;
+	else {
+		if (adc_vol_flag)
+			ctl_l = mc->max - (((0x1e00 - read_l) & 0xffff) / interval_offset);
+		else
+			ctl_l = mc->max - (((0 - read_l) & 0xffff) / interval_offset);
+	}
+
+	if (read_l != read_r) {
+		if (mc->shift == 8) /* boost gain */
+			ctl_r = read_r / tendB;
+		else { /* ADC/DAC gain */
+			if (adc_vol_flag)
+				ctl_r = mc->max - (((0x1e00 - read_r) & 0xffff) / interval_offset);
+			else
+				ctl_r = mc->max - (((0 - read_r) & 0xffff) / interval_offset);
+		}
+	} else
+		ctl_r = ctl_l;
+
+	ucontrol->value.integer.value[0] = ctl_l;
+	ucontrol->value.integer.value[1] = ctl_r;
+
+	return 0;
+}
+
+static int rt712_sdca_set_fu0f_capture_ctl(struct rt712_sdca_priv *rt712)
+{
+	int err;
+	unsigned int ch_l, ch_r;
+
+	ch_l = (rt712->fu0f_dapm_mute || rt712->fu0f_mixer_l_mute) ? 0x01 : 0x00;
+	ch_r = (rt712->fu0f_dapm_mute || rt712->fu0f_mixer_r_mute) ? 0x01 : 0x00;
+
+	err = regmap_write(rt712->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU0F,
+			RT712_SDCA_CTL_FU_MUTE, CH_L), ch_l);
+	if (err < 0)
+		return err;
+
+	err = regmap_write(rt712->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU0F,
+			RT712_SDCA_CTL_FU_MUTE, CH_R), ch_r);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
+static int rt712_sdca_fu0f_capture_get(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt712_sdca_priv *rt712 = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = !rt712->fu0f_mixer_l_mute;
+	ucontrol->value.integer.value[1] = !rt712->fu0f_mixer_r_mute;
+	return 0;
+}
+
+static int rt712_sdca_fu0f_capture_put(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt712_sdca_priv *rt712 = snd_soc_component_get_drvdata(component);
+	int err;
+
+	if (rt712->fu0f_mixer_l_mute == !ucontrol->value.integer.value[0] &&
+		rt712->fu0f_mixer_r_mute == !ucontrol->value.integer.value[1])
+		return 0;
+
+	rt712->fu0f_mixer_l_mute = !ucontrol->value.integer.value[0];
+	rt712->fu0f_mixer_r_mute = !ucontrol->value.integer.value[1];
+	err = rt712_sdca_set_fu0f_capture_ctl(rt712);
+	if (err < 0)
+		return err;
+
+	return 1;
+}
+
+static const DECLARE_TLV_DB_SCALE(out_vol_tlv, -6525, 75, 0);
+static const DECLARE_TLV_DB_SCALE(mic_vol_tlv, -1725, 75, 0);
+static const DECLARE_TLV_DB_SCALE(boost_vol_tlv, 0, 1000, 0);
+
+static const struct snd_kcontrol_new rt712_sdca_controls[] = {
+	SOC_DOUBLE_R_EXT_TLV("FU05 Playback Volume",
+		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05, RT712_SDCA_CTL_FU_VOLUME, CH_L),
+		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05, RT712_SDCA_CTL_FU_VOLUME, CH_R),
+		0, 0x57, 0,
+		rt712_sdca_set_gain_get, rt712_sdca_set_gain_put, out_vol_tlv),
+	SOC_DOUBLE_EXT("FU0F Capture Switch", SND_SOC_NOPM, 0, 1, 1, 0,
+		rt712_sdca_fu0f_capture_get, rt712_sdca_fu0f_capture_put),
+	SOC_DOUBLE_R_EXT_TLV("FU0F Capture Volume",
+		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU0F, RT712_SDCA_CTL_FU_VOLUME, CH_L),
+		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU0F, RT712_SDCA_CTL_FU_VOLUME, CH_R),
+		0, 0x3f, 0,
+		rt712_sdca_set_gain_get, rt712_sdca_set_gain_put, mic_vol_tlv),
+	SOC_DOUBLE_R_EXT_TLV("FU44 Boost Volume",
+		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_PLATFORM_FU44, RT712_SDCA_CTL_FU_CH_GAIN, CH_L),
+		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_PLATFORM_FU44, RT712_SDCA_CTL_FU_CH_GAIN, CH_R),
+		8, 3, 0,
+		rt712_sdca_set_gain_get, rt712_sdca_set_gain_put, boost_vol_tlv),
+};
+
+static const struct snd_kcontrol_new rt712_sdca_spk_controls[] = {
+	SOC_DOUBLE_R_EXT_TLV("FU06 Playback Volume",
+		SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_VOLUME, CH_L),
+		SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_VOLUME, CH_R),
+		0, 0x57, 0,
+		rt712_sdca_set_gain_get, rt712_sdca_set_gain_put, out_vol_tlv),
+};
+
+static int rt712_sdca_mux_get(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_kcontrol_component(kcontrol);
+	struct rt712_sdca_priv *rt712 = snd_soc_component_get_drvdata(component);
+	unsigned int val = 0, mask = 0x3300;
+
+	rt712_sdca_index_read(rt712, RT712_VENDOR_HDA_CTL, RT712_MIXER_CTL1, &val);
+
+	val = val & mask;
+	switch (val) {
+	case 0x3000:
+		val = 1;
+		break;
+	case 0x0300:
+		val = 0;
+		break;
+	}
+
+	ucontrol->value.enumerated.item[0] = val;
+
+	return 0;
+}
+
+static int rt712_sdca_mux_put(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct rt712_sdca_priv *rt712 = snd_soc_component_get_drvdata(component);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int *item = ucontrol->value.enumerated.item;
+	unsigned int mask_sft;
+
+	if (item[0] >= e->items)
+		return -EINVAL;
+
+	if (ucontrol->value.enumerated.item[0] == 0)
+		mask_sft = 12;
+	else if (ucontrol->value.enumerated.item[0] == 1)
+		mask_sft = 8;
+	else
+		return -EINVAL;
+
+	rt712_sdca_index_write(rt712, RT712_VENDOR_HDA_CTL,
+		RT712_MIXER_CTL1, 0x3fff);
+	rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
+		RT712_MIXER_CTL1, 0x3 << mask_sft, 0);
+
+	snd_soc_dapm_mux_update_power(dapm, kcontrol,
+		item[0], e, NULL);
+
+	return 1;
+}
+
+static const char * const adc_mux_text[] = {
+	"MIC2",
+	"LINE2",
+};
+
+static SOC_ENUM_SINGLE_DECL(
+	rt712_adc23_enum, SND_SOC_NOPM, 0, adc_mux_text);
+
+static const struct snd_kcontrol_new rt712_sdca_adc23_mux =
+	SOC_DAPM_ENUM_EXT("ADC 23 Mux", rt712_adc23_enum,
+			rt712_sdca_mux_get, rt712_sdca_mux_put);
+
+static int rt712_sdca_fu05_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct rt712_sdca_priv *rt712 = snd_soc_component_get_drvdata(component);
+	unsigned char unmute = 0x0, mute = 0x1;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		regmap_write(rt712->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05,
+				RT712_SDCA_CTL_FU_MUTE, CH_L),
+				unmute);
+		regmap_write(rt712->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05,
+				RT712_SDCA_CTL_FU_MUTE, CH_R),
+				unmute);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		regmap_write(rt712->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05,
+				RT712_SDCA_CTL_FU_MUTE, CH_L),
+				mute);
+		regmap_write(rt712->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_USER_FU05,
+				RT712_SDCA_CTL_FU_MUTE, CH_R),
+				mute);
+		break;
+	}
+	return 0;
+}
+
+static int rt712_sdca_fu0f_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct rt712_sdca_priv *rt712 = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		rt712->fu0f_dapm_mute = false;
+		rt712_sdca_set_fu0f_capture_ctl(rt712);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		rt712->fu0f_dapm_mute = true;
+		rt712_sdca_set_fu0f_capture_ctl(rt712);
+		break;
+	}
+	return 0;
+}
+
+static int rt712_sdca_pde40_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct rt712_sdca_priv *rt712 = snd_soc_component_get_drvdata(component);
+	unsigned char ps0 = 0x0, ps3 = 0x3;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		regmap_write(rt712->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_PDE40,
+				RT712_SDCA_CTL_REQ_POWER_STATE, 0),
+				ps0);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		regmap_write(rt712->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_PDE40,
+				RT712_SDCA_CTL_REQ_POWER_STATE, 0),
+				ps3);
+		break;
+	}
+	return 0;
+}
+
+static int rt712_sdca_pde12_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct rt712_sdca_priv *rt712 = snd_soc_component_get_drvdata(component);
+	unsigned char ps0 = 0x0, ps3 = 0x3;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		regmap_write(rt712->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_PDE12,
+				RT712_SDCA_CTL_REQ_POWER_STATE, 0),
+				ps0);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		regmap_write(rt712->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_PDE12,
+				RT712_SDCA_CTL_REQ_POWER_STATE, 0),
+				ps3);
+		break;
+	}
+	return 0;
+}
+
+static int rt712_sdca_classd_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct rt712_sdca_priv *rt712 = snd_soc_component_get_drvdata(component);
+	unsigned char ps0 = 0x0, ps3 = 0x3;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		regmap_write(rt712->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_PDE23,
+				RT712_SDCA_CTL_REQ_POWER_STATE, 0),
+				ps0);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		regmap_write(rt712->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_PDE23,
+				RT712_SDCA_CTL_REQ_POWER_STATE, 0),
+				ps3);
+		break;
+
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new rt712_spk_sto_dac =
+	SOC_DAPM_DOUBLE_R("Switch",
+		SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_MUTE, CH_L),
+		SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_USER_FU06, RT712_SDCA_CTL_FU_MUTE, CH_R),
+		0, 1, 1);
+
+static const struct snd_soc_dapm_widget rt712_sdca_dapm_widgets[] = {
+	SND_SOC_DAPM_OUTPUT("HP"),
+	SND_SOC_DAPM_INPUT("MIC2"),
+	SND_SOC_DAPM_INPUT("LINE2"),
+
+	SND_SOC_DAPM_SUPPLY("PDE 40", SND_SOC_NOPM, 0, 0,
+		rt712_sdca_pde40_event,
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_SUPPLY("PDE 12", SND_SOC_NOPM, 0, 0,
+		rt712_sdca_pde12_event,
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+
+	SND_SOC_DAPM_DAC_E("FU 05", NULL, SND_SOC_NOPM, 0, 0,
+		rt712_sdca_fu05_event,
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_ADC_E("FU 0F", NULL, SND_SOC_NOPM, 0, 0,
+		rt712_sdca_fu0f_event,
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_MUX("ADC 23 Mux", SND_SOC_NOPM, 0, 0,
+		&rt712_sdca_adc23_mux),
+
+	SND_SOC_DAPM_AIF_IN("DP1RX", "DP1 Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("DP4TX", "DP4 Capture", 0, SND_SOC_NOPM, 0, 0),
+};
+
+static const struct snd_soc_dapm_route rt712_sdca_audio_map[] = {
+	{ "FU 05", NULL, "DP1RX" },
+	{ "DP4TX", NULL, "FU 0F" },
+
+	{ "FU 0F", NULL, "PDE 12" },
+	{ "FU 0F", NULL, "ADC 23 Mux" },
+	{ "ADC 23 Mux", "LINE2", "LINE2" },
+	{ "ADC 23 Mux", "MIC2", "MIC2" },
+
+	{ "HP", NULL, "PDE 40" },
+	{ "HP", NULL, "FU 05" },
+};
+
+static const struct snd_soc_dapm_widget rt712_sdca_spk_dapm_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("DP3RX", "DP3 Playback", 0, SND_SOC_NOPM, 0, 0),
+
+	/* Digital Interface */
+	SND_SOC_DAPM_SWITCH("FU06", SND_SOC_NOPM, 0, 0, &rt712_spk_sto_dac),
+
+	/* Output */
+	SND_SOC_DAPM_PGA_E("CLASS D", SND_SOC_NOPM, 0, 0, NULL, 0,
+		rt712_sdca_classd_event, SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMU),
+	SND_SOC_DAPM_OUTPUT("SPOL"),
+	SND_SOC_DAPM_OUTPUT("SPOR"),
+};
+
+static const struct snd_soc_dapm_route rt712_sdca_spk_dapm_routes[] = {
+	{ "FU06", "Switch", "DP3RX" },
+	{ "CLASS D", NULL, "FU06" },
+	{ "SPOL", NULL, "CLASS D" },
+	{ "SPOR", NULL, "CLASS D" },
+};
+
+static int rt712_sdca_parse_dt(struct rt712_sdca_priv *rt712, struct device *dev)
+{
+	device_property_read_u32(dev, "realtek,jd-src", &rt712->jd_src);
+
+	return 0;
+}
+
+static int rt712_sdca_probe(struct snd_soc_component *component)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct rt712_sdca_priv *rt712 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	rt712_sdca_parse_dt(rt712, &rt712->slave->dev);
+	rt712->component = component;
+
+	ret = pm_runtime_resume(component->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
+
+	/* add SPK route */
+	if (rt712->hw_id != RT712_DEV_ID_713) {
+		snd_soc_add_component_controls(component,
+			rt712_sdca_spk_controls, ARRAY_SIZE(rt712_sdca_spk_controls));
+		snd_soc_dapm_new_controls(dapm,
+			rt712_sdca_spk_dapm_widgets, ARRAY_SIZE(rt712_sdca_spk_dapm_widgets));
+		snd_soc_dapm_add_routes(dapm,
+			rt712_sdca_spk_dapm_routes, ARRAY_SIZE(rt712_sdca_spk_dapm_routes));
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_component_driver soc_sdca_dev_rt712 = {
+	.probe = rt712_sdca_probe,
+	.controls = rt712_sdca_controls,
+	.num_controls = ARRAY_SIZE(rt712_sdca_controls),
+	.dapm_widgets = rt712_sdca_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(rt712_sdca_dapm_widgets),
+	.dapm_routes = rt712_sdca_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(rt712_sdca_audio_map),
+	.set_jack = rt712_sdca_set_jack_detect,
+	.endianness = 1,
+};
+
+static int rt712_sdca_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
+				int direction)
+{
+	struct sdw_stream_data *stream;
+
+	if (!sdw_stream)
+		return 0;
+
+	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
+	if (!stream)
+		return -ENOMEM;
+
+	stream->sdw_stream = sdw_stream;
+
+	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
+	snd_soc_dai_dma_data_set(dai, direction, stream);
+
+	return 0;
+}
+
+static void rt712_sdca_shutdown(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct sdw_stream_data *stream;
+
+	stream = snd_soc_dai_get_dma_data(dai, substream);
+	snd_soc_dai_set_dma_data(dai, substream, NULL);
+	kfree(stream);
+}
+
+static int rt712_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct rt712_sdca_priv *rt712 = snd_soc_component_get_drvdata(component);
+	struct sdw_stream_config stream_config;
+	struct sdw_port_config port_config;
+	enum sdw_data_direction direction;
+	struct sdw_stream_data *stream;
+	int retval, port, num_channels;
+	unsigned int sampling_rate;
+
+	dev_dbg(dai->dev, "%s %s", __func__, dai->name);
+	stream = snd_soc_dai_get_dma_data(dai, substream);
+
+	if (!stream)
+		return -EINVAL;
+
+	if (!rt712->slave)
+		return -EINVAL;
+
+	/* SoundWire specific configuration */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		direction = SDW_DATA_DIR_RX;
+		if (dai->id == RT712_AIF1)
+			port = 1;
+		else if (dai->id == RT712_AIF2)
+			port = 3;
+		else
+			return -EINVAL;
+	} else {
+		direction = SDW_DATA_DIR_TX;
+		if (dai->id == RT712_AIF1)
+			port = 4;
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
+	port_config.ch_mask = GENMASK(num_channels - 1, 0);
+	port_config.num = port;
+
+	retval = sdw_stream_add_slave(rt712->slave, &stream_config,
+					&port_config, 1, stream->sdw_stream);
+	if (retval) {
+		dev_err(dai->dev, "Unable to configure port\n");
+		return retval;
+	}
+
+	if (params_channels(params) > 16) {
+		dev_err(component->dev, "Unsupported channels %d\n",
+			params_channels(params));
+		return -EINVAL;
+	}
+
+	/* sampling rate configuration */
+	switch (params_rate(params)) {
+	case 44100:
+		sampling_rate = RT712_SDCA_RATE_44100HZ;
+		break;
+	case 48000:
+		sampling_rate = RT712_SDCA_RATE_48000HZ;
+		break;
+	case 96000:
+		sampling_rate = RT712_SDCA_RATE_96000HZ;
+		break;
+	case 192000:
+		sampling_rate = RT712_SDCA_RATE_192000HZ;
+		break;
+	default:
+		dev_err(component->dev, "Rate %d is not supported\n",
+			params_rate(params));
+		return -EINVAL;
+	}
+
+	/* set sampling frequency */
+	if (dai->id == RT712_AIF1) {
+		regmap_write(rt712->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_CS01, RT712_SDCA_CTL_SAMPLE_FREQ_INDEX, 0),
+			sampling_rate);
+		regmap_write(rt712->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_CS11, RT712_SDCA_CTL_SAMPLE_FREQ_INDEX, 0),
+			sampling_rate);
+	}
+
+	if (dai->id == RT712_AIF2)
+		regmap_write(rt712->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_CS31, RT712_SDCA_CTL_SAMPLE_FREQ_INDEX, 0),
+			sampling_rate);
+
+	return 0;
+}
+
+static int rt712_sdca_pcm_hw_free(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct rt712_sdca_priv *rt712 = snd_soc_component_get_drvdata(component);
+	struct sdw_stream_data *stream =
+		snd_soc_dai_get_dma_data(dai, substream);
+
+	if (!rt712->slave)
+		return -EINVAL;
+
+	sdw_stream_remove_slave(rt712->slave, stream->sdw_stream);
+	return 0;
+}
+
+#define RT712_STEREO_RATES (SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000 | \
+			SNDRV_PCM_RATE_192000)
+#define RT712_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
+			SNDRV_PCM_FMTBIT_S24_LE)
+
+static const struct snd_soc_dai_ops rt712_sdca_ops = {
+	.hw_params	= rt712_sdca_pcm_hw_params,
+	.hw_free	= rt712_sdca_pcm_hw_free,
+	.set_stream	= rt712_sdca_set_sdw_stream,
+	.shutdown	= rt712_sdca_shutdown,
+};
+
+static struct snd_soc_dai_driver rt712_sdca_dai[] = {
+	{
+		.name = "rt712-sdca-aif1",
+		.id = RT712_AIF1,
+		.playback = {
+			.stream_name = "DP1 Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = RT712_STEREO_RATES,
+			.formats = RT712_FORMATS,
+		},
+		.capture = {
+			.stream_name = "DP4 Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = RT712_STEREO_RATES,
+			.formats = RT712_FORMATS,
+		},
+		.ops = &rt712_sdca_ops,
+	},
+	{
+		.name = "rt712-sdca-aif2",
+		.id = RT712_AIF2,
+		.playback = {
+			.stream_name = "DP3 Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = RT712_STEREO_RATES,
+			.formats = RT712_FORMATS,
+		},
+		.ops = &rt712_sdca_ops,
+	}
+};
+
+int rt712_sdca_init(struct device *dev, struct regmap *regmap,
+			struct regmap *mbq_regmap, struct sdw_slave *slave)
+{
+	struct rt712_sdca_priv *rt712;
+	int ret;
+
+	rt712 = devm_kzalloc(dev, sizeof(*rt712), GFP_KERNEL);
+	if (!rt712)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, rt712);
+	rt712->slave = slave;
+	rt712->regmap = regmap;
+	rt712->mbq_regmap = mbq_regmap;
+
+	mutex_init(&rt712->calibrate_mutex);
+	mutex_init(&rt712->disable_irq_lock);
+
+	INIT_DELAYED_WORK(&rt712->jack_detect_work, rt712_sdca_jack_detect_handler);
+	INIT_DELAYED_WORK(&rt712->jack_btn_check_work, rt712_sdca_btn_check_handler);
+
+	/*
+	 * Mark hw_init to false
+	 * HW init will be performed when device reports present
+	 */
+	rt712->hw_init = false;
+	rt712->first_hw_init = false;
+	rt712->fu0f_dapm_mute = true;
+	rt712->fu0f_mixer_l_mute = rt712->fu0f_mixer_r_mute = true;
+
+	/* JD source uses JD1 in default */
+	rt712->jd_src = RT712_JD1;
+
+	if (slave->id.part_id != RT712_PART_ID_713)
+		ret =  devm_snd_soc_register_component(dev,
+				&soc_sdca_dev_rt712, rt712_sdca_dai, ARRAY_SIZE(rt712_sdca_dai));
+	else
+		ret =  devm_snd_soc_register_component(dev,
+				&soc_sdca_dev_rt712, rt712_sdca_dai, 1);
+
+	dev_dbg(&slave->dev, "%s\n", __func__);
+
+	return ret;
+}
+
+int rt712_sdca_io_init(struct device *dev, struct sdw_slave *slave)
+{
+	struct rt712_sdca_priv *rt712 = dev_get_drvdata(dev);
+	int ret = 0;
+	unsigned int val, hibernation_flag;
+
+	rt712->disable_irq = false;
+
+	if (rt712->hw_init)
+		return 0;
+
+	if (rt712->first_hw_init) {
+		regcache_cache_only(rt712->regmap, false);
+		regcache_cache_bypass(rt712->regmap, true);
+		regcache_cache_only(rt712->mbq_regmap, false);
+		regcache_cache_bypass(rt712->mbq_regmap, true);
+	} else {
+		/*
+		 * PM runtime is only enabled when a Slave reports as Attached
+		 */
+
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
+	rt712_sdca_index_read(rt712, RT712_VENDOR_REG, RT712_JD_PRODUCT_NUM, &val);
+	rt712->hw_id = (val & 0xf000) >> 12;
+
+	rt712_sdca_index_write(rt712, RT712_VENDOR_REG, RT712_ANALOG_BIAS_CTL3, 0xaa81);
+	rt712_sdca_index_write(rt712, RT712_VENDOR_REG, RT712_LDO2_3_CTL1, 0xa1e0);
+	rt712_sdca_index_write(rt712, RT712_VENDOR_IMS_DRE, RT712_HP_DETECT_RLDET_CTL1, 0x0000);
+	rt712_sdca_index_write(rt712, RT712_VENDOR_IMS_DRE, RT712_HP_DETECT_RLDET_CTL2, 0x0000);
+	rt712_sdca_index_write(rt712, RT712_VENDOR_ANALOG_CTL, RT712_MISC_POWER_CTL7, 0x0000);
+	regmap_write(rt712->regmap, RT712_RC_CAL, 0x23);
+
+	/* calibration */
+	rt712_sdca_index_read(rt712, RT712_VENDOR_REG, RT712_SW_CONFIG1, &hibernation_flag);
+	if (!hibernation_flag) {
+		ret = rt712_sdca_calibration(rt712);
+		if (ret < 0)
+			dev_err(dev, "%s, calibration failed!\n", __func__);
+	}
+
+	rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
+		RT712_MIXER_CTL1, 0x3000, 0x0000);
+	rt712_sdca_index_write(rt712, RT712_VENDOR_HDA_CTL,
+		RT712_ADC0A_08_PDE_FLOAT_CTL, 0x1112);
+	rt712_sdca_index_write(rt712, RT712_VENDOR_HDA_CTL,
+		RT712_MIC2_LINE2_PDE_FLOAT_CTL, 0x3412);
+	rt712_sdca_index_write(rt712, RT712_VENDOR_HDA_CTL,
+		RT712_DAC03_HP_PDE_FLOAT_CTL, 0x4040);
+
+	rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
+		RT712_HDA_LEGACY_GPIO_WAKE_EN_CTL, 0x0001, 0x0000);
+	regmap_write(rt712->regmap, 0x2f50, 0x00);
+	regmap_write(rt712->regmap, 0x2f54, 0x00);
+	regmap_write(rt712->regmap,
+		SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT712_SDCA_ENT_IT09, RT712_SDCA_CTL_VENDOR_DEF, 0), 0x01);
+
+	/* add SPK settings */
+	if (rt712->hw_id != RT712_DEV_ID_713) {
+		rt712_sdca_index_write(rt712, RT712_VENDOR_HDA_CTL, RT712_AMP_PDE_FLOAT_CTL, 0x2323);
+		rt712_sdca_index_write(rt712, RT712_VENDOR_HDA_CTL, RT712_EAPD_CTL, 0x0002);
+		regmap_write(rt712->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_AMP, RT712_SDCA_ENT_OT23, RT712_SDCA_CTL_VENDOR_DEF, 0), 0x04);
+	}
+
+	/*
+	 * if set_jack callback occurred early than io_init,
+	 * we set up the jack detection function now
+	 */
+	if (rt712->hs_jack)
+		rt712_sdca_jack_init(rt712);
+
+	if (!hibernation_flag)
+		rt712_sdca_index_write(rt712, RT712_VENDOR_REG, RT712_SW_CONFIG1, 0x0001);
+
+	if (rt712->first_hw_init) {
+		regcache_cache_bypass(rt712->regmap, false);
+		regcache_mark_dirty(rt712->regmap);
+		regcache_cache_bypass(rt712->mbq_regmap, false);
+		regcache_mark_dirty(rt712->mbq_regmap);
+	} else
+		rt712->first_hw_init = true;
+
+	/* Mark Slave initialization complete */
+	rt712->hw_init = true;
+
+	pm_runtime_mark_last_busy(&slave->dev);
+	pm_runtime_put_autosuspend(&slave->dev);
+
+	dev_dbg(&slave->dev, "%s hw_init complete\n", __func__);
+	return 0;
+}
+
+MODULE_DESCRIPTION("ASoC RT712 SDCA SDW driver");
+MODULE_AUTHOR("Shuming Fan <shumingf@realtek.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/rt712-sdca.h b/sound/soc/codecs/rt712-sdca.h
new file mode 100644
index 000000000000..cf647162f9da
--- /dev/null
+++ b/sound/soc/codecs/rt712-sdca.h
@@ -0,0 +1,220 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * rt712-sdca.h -- RT712 SDCA ALSA SoC audio driver header
+ *
+ * Copyright(c) 2023 Realtek Semiconductor Corp.
+ */
+
+#ifndef __RT712_H__
+#define __RT712_H__
+
+#include <linux/pm.h>
+#include <linux/regmap.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include <sound/soc.h>
+#include <linux/workqueue.h>
+
+struct  rt712_sdca_priv {
+	struct regmap *regmap;
+	struct regmap *mbq_regmap;
+	struct snd_soc_component *component;
+	struct sdw_slave *slave;
+	enum sdw_slave_status status;
+	struct sdw_bus_params params;
+	bool hw_init;
+	bool first_hw_init;
+	struct snd_soc_jack *hs_jack;
+	struct delayed_work jack_detect_work;
+	struct delayed_work jack_btn_check_work;
+	struct mutex calibrate_mutex; /* for headset calibration */
+	struct mutex disable_irq_lock; /* SDCA irq lock protection */
+	bool disable_irq;
+	int jack_type;
+	int jd_src;
+	unsigned int scp_sdca_stat1;
+	unsigned int scp_sdca_stat2;
+	unsigned int hw_id;
+	bool fu0f_dapm_mute;
+	bool fu0f_mixer_l_mute;
+	bool fu0f_mixer_r_mute;
+};
+
+struct sdw_stream_data {
+	struct sdw_stream_runtime *sdw_stream;
+};
+
+/* NID */
+#define RT712_VENDOR_REG			0x20
+#define RT712_VENDOR_CALI			0x58
+#define RT712_ULTRA_SOUND_DET			0x59
+#define RT712_VENDOR_IMS_DRE			0x5b
+#define RT712_VENDOR_ANALOG_CTL			0x5f
+#define RT712_VENDOR_HDA_CTL			0x61
+
+/* Index (NID:20h) */
+#define RT712_JD_PRODUCT_NUM			0x00
+#define RT712_ANALOG_BIAS_CTL3			0x04
+#define RT712_LDO2_3_CTL1			0x0e
+#define RT712_PARA_VERB_CTL			0x1a
+#define RT712_CC_DET1				0x24
+#define RT712_COMBO_JACK_AUTO_CTL1		0x45
+#define RT712_COMBO_JACK_AUTO_CTL2		0x46
+#define RT712_COMBO_JACK_AUTO_CTL3		0x47
+#define RT712_DIGITAL_MISC_CTRL4		0x4a
+#define RT712_FSM_CTL				0x67
+#define RT712_SW_CONFIG1			0x8a
+#define RT712_SW_CONFIG2			0x8b
+
+/* Index (NID:58h) */
+#define RT712_DAC_DC_CALI_CTL1			0x00
+#define RT712_DAC_DC_CALI_CTL2			0x01
+
+/* Index (NID:59h) */
+#define RT712_ULTRA_SOUND_DETECTOR6		0x1e
+
+/* Index (NID:5bh) */
+#define RT712_IMS_DIGITAL_CTL1			0x00
+#define RT712_IMS_DIGITAL_CTL5			0x05
+#define RT712_HP_DETECT_RLDET_CTL1		0x29
+#define RT712_HP_DETECT_RLDET_CTL2		0x2a
+
+/* Index (NID:5fh) */
+#define RT712_MISC_POWER_CTL0			0x00
+#define RT712_MISC_POWER_CTL7			0x08
+
+/* Index (NID:61h) */
+#define RT712_HDA_LEGACY_MUX_CTL0			0x00
+#define RT712_HDA_LEGACY_CONFIG_CTL0			0x06
+#define RT712_HDA_LEGACY_RESET_CTL			0x08
+#define RT712_HDA_LEGACY_GPIO_WAKE_EN_CTL		0x0e
+#define RT712_DMIC_ENT_FLOAT_CTL			0x10
+#define RT712_DMIC_GAIN_ENT_FLOAT_CTL0			0x11
+#define RT712_DMIC_GAIN_ENT_FLOAT_CTL2			0x13
+#define RT712_ADC_ENT_FLOAT_CTL				0x15
+#define RT712_ADC_VOL_CH_FLOAT_CTL2			0x18
+#define RT712_DAC03_HP_PDE_FLOAT_CTL			0x22
+#define RT712_MIC2_LINE2_PDE_FLOAT_CTL			0x23
+#define RT712_ADC0A_08_PDE_FLOAT_CTL			0x26
+#define RT712_ADC0B_11_PDE_FLOAT_CTL			0x27
+#define RT712_DMIC1_2_PDE_FLOAT_CTL			0x2b
+#define RT712_AMP_PDE_FLOAT_CTL				0x2c
+#define RT712_I2S_IN_OUT_PDE_FLOAT_CTL			0x2f
+#define RT712_GE_RELATED_CTL1				0x45
+#define RT712_GE_RELATED_CTL2				0x46
+#define RT712_MIXER_CTL0				0x52
+#define RT712_MIXER_CTL1				0x53
+#define RT712_EAPD_CTL					0x55
+#define RT712_UMP_HID_CTL0				0x60
+#define RT712_UMP_HID_CTL1				0x61
+#define RT712_UMP_HID_CTL2				0x62
+#define RT712_UMP_HID_CTL3				0x63
+#define RT712_UMP_HID_CTL4				0x64
+#define RT712_UMP_HID_CTL5				0x65
+#define RT712_UMP_HID_CTL6				0x66
+#define RT712_UMP_HID_CTL7				0x67
+#define RT712_UMP_HID_CTL8				0x68
+
+/* Parameter & Verb control 01 (0x1a)(NID:20h) */
+#define RT712_HIDDEN_REG_SW_RESET (0x1 << 14)
+
+/* combo jack auto switch control 2 (0x46)(NID:20h) */
+#define RT712_COMBOJACK_AUTO_DET_STATUS			(0x1 << 11)
+#define RT712_COMBOJACK_AUTO_DET_TRS			(0x1 << 10)
+#define RT712_COMBOJACK_AUTO_DET_CTIA			(0x1 << 9)
+#define RT712_COMBOJACK_AUTO_DET_OMTP			(0x1 << 8)
+
+/* DAC DC offset calibration control-1 (0x00)(NID:58h) */
+#define RT712_DAC_DC_CALI_TRIGGER (0x1 << 15)
+
+#define RT712_EAPD_HIGH				0x2
+#define RT712_EAPD_LOW				0x0
+
+/* RC Calibration register */
+#define RT712_RC_CAL			0x3201
+
+/* Buffer address for HID */
+#define RT712_BUF_ADDR_HID1			0x44030000
+#define RT712_BUF_ADDR_HID2			0x44030020
+
+/* RT712 SDCA Control - function number */
+#define FUNC_NUM_JACK_CODEC 0x01
+#define FUNC_NUM_MIC_ARRAY 0x02
+#define FUNC_NUM_HID 0x03
+#define FUNC_NUM_AMP 0x04
+
+/* RT712 SDCA entity */
+#define RT712_SDCA_ENT_HID01 0x01
+#define RT712_SDCA_ENT_GE49 0x49
+#define RT712_SDCA_ENT_USER_FU05 0x05
+#define RT712_SDCA_ENT_USER_FU06 0x06
+#define RT712_SDCA_ENT_USER_FU0F 0x0f
+#define RT712_SDCA_ENT_USER_FU10 0x19
+#define RT712_SDCA_ENT_USER_FU1E 0x1e
+#define RT712_SDCA_ENT_FU15 0x15
+#define RT712_SDCA_ENT_PDE23 0x23
+#define RT712_SDCA_ENT_PDE40 0x40
+#define RT712_SDCA_ENT_PDE11 0x11
+#define RT712_SDCA_ENT_PDE12 0x12
+#define RT712_SDCA_ENT_CS01 0x01
+#define RT712_SDCA_ENT_CS11 0x11
+#define RT712_SDCA_ENT_CS1F 0x1f
+#define RT712_SDCA_ENT_CS1C 0x1c
+#define RT712_SDCA_ENT_CS31 0x31
+#define RT712_SDCA_ENT_OT23 0x42
+#define RT712_SDCA_ENT_IT26 0x26
+#define RT712_SDCA_ENT_IT09 0x09
+#define RT712_SDCA_ENT_PLATFORM_FU15 0x15
+#define RT712_SDCA_ENT_PLATFORM_FU44 0x44
+
+/* RT712 SDCA control */
+#define RT712_SDCA_CTL_SAMPLE_FREQ_INDEX 0x10
+#define RT712_SDCA_CTL_FU_MUTE 0x01
+#define RT712_SDCA_CTL_FU_VOLUME 0x02
+#define RT712_SDCA_CTL_HIDTX_CURRENT_OWNER 0x10
+#define RT712_SDCA_CTL_HIDTX_SET_OWNER_TO_DEVICE 0x11
+#define RT712_SDCA_CTL_HIDTX_MESSAGE_OFFSET 0x12
+#define RT712_SDCA_CTL_HIDTX_MESSAGE_LENGTH 0x13
+#define RT712_SDCA_CTL_SELECTED_MODE 0x01
+#define RT712_SDCA_CTL_DETECTED_MODE 0x02
+#define RT712_SDCA_CTL_REQ_POWER_STATE 0x01
+#define RT712_SDCA_CTL_VENDOR_DEF 0x30
+#define RT712_SDCA_CTL_FU_CH_GAIN 0x0b
+
+/* RT712 SDCA channel */
+#define CH_L 0x01
+#define CH_R 0x02
+
+/* sample frequency index */
+#define RT712_SDCA_RATE_16000HZ		0x04
+#define RT712_SDCA_RATE_32000HZ		0x07
+#define RT712_SDCA_RATE_44100HZ		0x08
+#define RT712_SDCA_RATE_48000HZ		0x09
+#define RT712_SDCA_RATE_96000HZ		0x0b
+#define RT712_SDCA_RATE_192000HZ	0x0d
+
+enum {
+	RT712_AIF1,
+	RT712_AIF2,
+};
+
+enum rt712_sdca_jd_src {
+	RT712_JD_NULL,
+	RT712_JD1,
+};
+
+enum rt712_sdca_hw_id {
+	RT712_DEV_ID_712 = 0x7,
+	RT712_DEV_ID_713 = 0x6,
+	RT712_DEV_ID_716 = 0x5,
+	RT712_DEV_ID_717 = 0x4,
+};
+
+#define RT712_PART_ID_713 0x713
+
+int rt712_sdca_io_init(struct device *dev, struct sdw_slave *slave);
+int rt712_sdca_init(struct device *dev, struct regmap *regmap,
+			struct regmap *mbq_regmap, struct sdw_slave *slave);
+
+int rt712_sdca_jack_detect(struct rt712_sdca_priv *rt712, bool *hp, bool *mic);
+#endif /* __RT712_H__ */
-- 
2.38.1

