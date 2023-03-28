Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B68D56CBABB
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 11:30:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E8AD1F9;
	Tue, 28 Mar 2023 11:29:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E8AD1F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679995810;
	bh=yEydEDOYwYmjLJeyAhf1NHnXfnjfCgzznvrx/6V39Gc=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JcTyCkVK+LCDBfaFtM9IMsKDjSJXcJWqMVElZ4zPEvwH3F5PD0y2xrSWpQw1uosz0
	 iGkSnpjUFvdfcUik8S+AYpx03GgJS4DoL6+klq3YsEdjwF26xg0EdG7Gyymh/gvdhG
	 it4vqDo8XBxgJF2hdF33wiK9+zkTctcj8v5SmC/A=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40E3CF80423;
	Tue, 28 Mar 2023 11:29:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B5F1F8032D; Tue, 28 Mar 2023 11:29:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78D7DF8021D
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 11:29:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78D7DF8021D
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 32S9SiCD2021776,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 32S9SiCD2021776
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Tue, 28 Mar 2023 17:28:44 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 28 Mar 2023 17:29:01 +0800
Received: from ubuntu.localdomain (172.22.102.209) by RTEXMBS01.realtek.com.tw
 (172.21.6.94) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Tue, 28 Mar
 2023 17:29:00 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH v2] ASoC: rt712-sdca: Add RT712 SDCA driver for Mic topology
Date: Tue, 28 Mar 2023 17:28:54 +0800
Message-ID: <20230328092854.156478-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.209]
X-ClientProxiedBy: RTEXH36505.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: ZMDUTUV6H44E2X3FM2BPNE3YOHIUU43S
X-Message-ID-Hash: ZMDUTUV6H44E2X3FM2BPNE3YOHIUU43S
X-MailFrom: shumingf@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com,
 pierre-louis.bossart@intel.com, bard.liao@intel.com, Yijun.Shen@dell.com,
 Shuming Fan <shumingf@realtek.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZMDUTUV6H44E2X3FM2BPNE3YOHIUU43S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

This is the initial codec driver for rt712 SDCA (Mic topology).
The host should connect with rt712 SdW2 interface.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/Kconfig           |   7 +
 sound/soc/codecs/Makefile          |   2 +
 sound/soc/codecs/rt712-sdca-dmic.c | 991 +++++++++++++++++++++++++++++
 sound/soc/codecs/rt712-sdca-dmic.h | 106 +++
 4 files changed, 1106 insertions(+)
 create mode 100644 sound/soc/codecs/rt712-sdca-dmic.c
 create mode 100644 sound/soc/codecs/rt712-sdca-dmic.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 03630d13d35f..8d41fc509637 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -203,6 +203,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_RT711_SDW
 	imply SND_SOC_RT711_SDCA_SDW
 	imply SND_SOC_RT712_SDCA_SDW
+	imply SND_SOC_RT712_SDCA_DMIC_SDW
 	imply SND_SOC_RT715_SDW
 	imply SND_SOC_RT715_SDCA_SDW
 	imply SND_SOC_RT1308_SDW
@@ -1521,6 +1522,12 @@ config SND_SOC_RT712_SDCA_SDW
 	select REGMAP_SOUNDWIRE
 	select REGMAP_SOUNDWIRE_MBQ
 
+config SND_SOC_RT712_SDCA_DMIC_SDW
+	tristate "Realtek RT712 SDCA DMIC Codec - SDW"
+	depends on SOUNDWIRE
+	select REGMAP_SOUNDWIRE
+	select REGMAP_SOUNDWIRE_MBQ
+
 config SND_SOC_RT715
 	tristate
 
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 25ebce58a0ba..dac48236db02 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -233,6 +233,7 @@ snd-soc-rt700-objs := rt700.o rt700-sdw.o
 snd-soc-rt711-objs := rt711.o rt711-sdw.o
 snd-soc-rt711-sdca-objs := rt711-sdca.o rt711-sdca-sdw.o
 snd-soc-rt712-sdca-objs := rt712-sdca.o rt712-sdca-sdw.o
+snd-soc-rt712-sdca-dmic-objs := rt712-sdca-dmic.o
 snd-soc-rt715-objs := rt715.o rt715-sdw.o
 snd-soc-rt715-sdca-objs := rt715-sdca.o rt715-sdca-sdw.o
 snd-soc-rt9120-objs := rt9120.o
@@ -601,6 +602,7 @@ obj-$(CONFIG_SND_SOC_RT700)     += snd-soc-rt700.o
 obj-$(CONFIG_SND_SOC_RT711)     += snd-soc-rt711.o
 obj-$(CONFIG_SND_SOC_RT711_SDCA_SDW)     += snd-soc-rt711-sdca.o
 obj-$(CONFIG_SND_SOC_RT712_SDCA_SDW)     += snd-soc-rt712-sdca.o
+obj-$(CONFIG_SND_SOC_RT712_SDCA_DMIC_SDW)     += snd-soc-rt712-sdca-dmic.o
 obj-$(CONFIG_SND_SOC_RT715)     += snd-soc-rt715.o
 obj-$(CONFIG_SND_SOC_RT715_SDCA_SDW)     += snd-soc-rt715-sdca.o
 obj-$(CONFIG_SND_SOC_RT9120)	+= snd-soc-rt9120.o
diff --git a/sound/soc/codecs/rt712-sdca-dmic.c b/sound/soc/codecs/rt712-sdca-dmic.c
new file mode 100644
index 000000000000..e5d765d84369
--- /dev/null
+++ b/sound/soc/codecs/rt712-sdca-dmic.c
@@ -0,0 +1,991 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// rt712-sdca-dmic.c -- rt712 SDCA DMIC ALSA SoC audio driver
+//
+// Copyright(c) 2023 Realtek Semiconductor Corp.
+//
+//
+
+#include <linux/bitops.h>
+#include <sound/core.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/init.h>
+#include <sound/initval.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/mod_devicetable.h>
+#include <linux/pm_runtime.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <linux/soundwire/sdw_registers.h>
+#include <linux/slab.h>
+#include <sound/soc-dapm.h>
+#include <sound/tlv.h>
+#include "rt712-sdca.h"
+#include "rt712-sdca-dmic.h"
+
+static bool rt712_sdca_dmic_readable_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case 0x201a ... 0x201f:
+	case 0x2029 ... 0x202a:
+	case 0x202d ... 0x2034:
+	case 0x2230 ... 0x2232:
+	case 0x2f01 ... 0x2f0a:
+	case 0x2f35 ... 0x2f36:
+	case 0x2f52:
+	case 0x2f58 ... 0x2f59:
+	case 0x3201:
+	case 0x320c:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool rt712_sdca_dmic_volatile_register(struct device *dev, unsigned int reg)
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
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool rt712_sdca_dmic_mbq_readable_register(struct device *dev, unsigned int reg)
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
+	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_USER_FU1E, RT712_SDCA_CTL_FU_VOLUME, CH_01):
+	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_USER_FU1E, RT712_SDCA_CTL_FU_VOLUME, CH_02):
+	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_USER_FU1E, RT712_SDCA_CTL_FU_VOLUME, CH_03):
+	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_USER_FU1E, RT712_SDCA_CTL_FU_VOLUME, CH_04):
+	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_PLATFORM_FU15, RT712_SDCA_CTL_FU_CH_GAIN, CH_01):
+	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_PLATFORM_FU15, RT712_SDCA_CTL_FU_CH_GAIN, CH_02):
+	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_PLATFORM_FU15, RT712_SDCA_CTL_FU_CH_GAIN, CH_03):
+	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_PLATFORM_FU15, RT712_SDCA_CTL_FU_CH_GAIN, CH_04):
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool rt712_sdca_dmic_mbq_volatile_register(struct device *dev, unsigned int reg)
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
+static const struct regmap_config rt712_sdca_dmic_regmap = {
+	.reg_bits = 32,
+	.val_bits = 8,
+	.readable_reg = rt712_sdca_dmic_readable_register,
+	.volatile_reg = rt712_sdca_dmic_volatile_register,
+	.max_register = 0x40981300,
+	.reg_defaults = rt712_sdca_dmic_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(rt712_sdca_dmic_reg_defaults),
+	.cache_type = REGCACHE_RBTREE,
+	.use_single_read = true,
+	.use_single_write = true,
+};
+
+static const struct regmap_config rt712_sdca_dmic_mbq_regmap = {
+	.name = "sdw-mbq",
+	.reg_bits = 32,
+	.val_bits = 16,
+	.readable_reg = rt712_sdca_dmic_mbq_readable_register,
+	.volatile_reg = rt712_sdca_dmic_mbq_volatile_register,
+	.max_register = 0x40800f14,
+	.reg_defaults = rt712_sdca_dmic_mbq_defaults,
+	.num_reg_defaults = ARRAY_SIZE(rt712_sdca_dmic_mbq_defaults),
+	.cache_type = REGCACHE_RBTREE,
+	.use_single_read = true,
+	.use_single_write = true,
+};
+
+static int rt712_sdca_dmic_index_write(struct rt712_sdca_dmic_priv *rt712,
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
+static int rt712_sdca_dmic_index_read(struct rt712_sdca_dmic_priv *rt712,
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
+static int rt712_sdca_dmic_index_update_bits(struct rt712_sdca_dmic_priv *rt712,
+	unsigned int nid, unsigned int reg, unsigned int mask, unsigned int val)
+{
+	unsigned int tmp;
+	int ret;
+
+	ret = rt712_sdca_dmic_index_read(rt712, nid, reg, &tmp);
+	if (ret < 0)
+		return ret;
+
+	set_mask_bits(&tmp, mask, val);
+	return rt712_sdca_dmic_index_write(rt712, nid, reg, tmp);
+}
+
+int rt712_sdca_dmic_io_init(struct device *dev, struct sdw_slave *slave)
+{
+	struct rt712_sdca_dmic_priv *rt712 = dev_get_drvdata(dev);
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
+	rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
+		RT712_ADC0A_08_PDE_FLOAT_CTL, 0x1112);
+	rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
+		RT712_ADC0B_11_PDE_FLOAT_CTL, 0x1111);
+	rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
+		RT712_DMIC1_2_PDE_FLOAT_CTL, 0x1111);
+	rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
+		RT712_I2S_IN_OUT_PDE_FLOAT_CTL, 0x1155);
+	rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
+		RT712_DMIC_ENT_FLOAT_CTL, 0x2626);
+	rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
+		RT712_ADC_ENT_FLOAT_CTL, 0x1e19);
+	rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
+		RT712_DMIC_GAIN_ENT_FLOAT_CTL0, 0x1515);
+	rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
+		RT712_ADC_VOL_CH_FLOAT_CTL2, 0x0304);
+	rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
+		RT712_DMIC_GAIN_ENT_FLOAT_CTL2, 0x0304);
+	rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
+		RT712_HDA_LEGACY_CONFIG_CTL0, 0x0050);
+	regmap_write(rt712->regmap,
+		SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_IT26, RT712_SDCA_CTL_VENDOR_DEF, 0), 0x01);
+	rt712_sdca_dmic_index_write(rt712, RT712_ULTRA_SOUND_DET,
+		RT712_ULTRA_SOUND_DETECTOR6, 0x3200);
+	regmap_write(rt712->regmap, RT712_RC_CAL, 0x23);
+	regmap_write(rt712->regmap, 0x2f52, 0x00);
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
+static int rt712_sdca_dmic_set_gain_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt712_sdca_priv *rt712 = snd_soc_component_get_drvdata(component);
+	struct rt712_sdca_dmic_kctrl_priv *p =
+		(struct rt712_sdca_dmic_kctrl_priv *)kcontrol->private_value;
+	unsigned int regvalue, ctl, i;
+	unsigned int adc_vol_flag = 0;
+	const unsigned int interval_offset = 0xc0;
+
+	if (strstr(ucontrol->id.name, "FU1E Capture Volume"))
+		adc_vol_flag = 1;
+
+	/* check all channels */
+	for (i = 0; i < p->count; i++) {
+		regmap_read(rt712->mbq_regmap, p->reg_base + i, &regvalue);
+
+		if (!adc_vol_flag) /* boost gain */
+			ctl = regvalue / 0x0a00;
+		else { /* ADC gain */
+			if (adc_vol_flag)
+				ctl = p->max - (((0x1e00 - regvalue) & 0xffff) / interval_offset);
+			else
+				ctl = p->max - (((0 - regvalue) & 0xffff) / interval_offset);
+		}
+
+		ucontrol->value.integer.value[i] = ctl;
+	}
+
+	return 0;
+}
+
+static int rt712_sdca_dmic_set_gain_put(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt712_sdca_dmic_kctrl_priv *p =
+		(struct rt712_sdca_dmic_kctrl_priv *)kcontrol->private_value;
+	struct rt712_sdca_priv *rt712 = snd_soc_component_get_drvdata(component);
+	unsigned int gain_val[4];
+	unsigned int i, adc_vol_flag = 0, changed = 0;
+	unsigned int regvalue[4];
+	const unsigned int interval_offset = 0xc0;
+	int err;
+
+	if (strstr(ucontrol->id.name, "FU1E Capture Volume"))
+		adc_vol_flag = 1;
+
+	/* check all channels */
+	for (i = 0; i < p->count; i++) {
+		regmap_read(rt712->mbq_regmap, p->reg_base + i, &regvalue[i]);
+
+		gain_val[i] = ucontrol->value.integer.value[i];
+		if (gain_val[i] > p->max)
+			gain_val[i] = p->max;
+
+		if (!adc_vol_flag) /* boost gain */
+			gain_val[i] = gain_val[i] * 0x0a00;
+		else { /* ADC gain */
+			gain_val[i] = 0x1e00 - ((p->max - gain_val[i]) * interval_offset);
+			gain_val[i] &= 0xffff;
+		}
+
+		if (regvalue[i] != gain_val[i])
+			changed = 1;
+	}
+
+	if (!changed)
+		return 0;
+
+	for (i = 0; i < p->count; i++) {
+		err = regmap_write(rt712->mbq_regmap, p->reg_base + i, gain_val[i]);
+		if (err < 0)
+			dev_err(&rt712->slave->dev, "0x%08x can't be set\n", p->reg_base + i);
+	}
+
+	return changed;
+}
+
+static int rt712_sdca_set_fu1e_capture_ctl(struct rt712_sdca_dmic_priv *rt712)
+{
+	int err, i;
+	unsigned int ch_mute;
+
+	for (i = 0; i < ARRAY_SIZE(rt712->fu1e_mixer_mute); i++) {
+		ch_mute = (rt712->fu1e_dapm_mute || rt712->fu1e_mixer_mute[i]) ? 0x01 : 0x00;
+		err = regmap_write(rt712->regmap,
+				SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_USER_FU1E,
+				RT712_SDCA_CTL_FU_MUTE, CH_01) + i, ch_mute);
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
+}
+
+static int rt712_sdca_dmic_fu1e_capture_get(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt712_sdca_dmic_priv *rt712 = snd_soc_component_get_drvdata(component);
+	struct rt712_sdca_dmic_kctrl_priv *p =
+		(struct rt712_sdca_dmic_kctrl_priv *)kcontrol->private_value;
+	unsigned int i;
+
+	for (i = 0; i < p->count; i++)
+		ucontrol->value.integer.value[i] = !rt712->fu1e_mixer_mute[i];
+
+	return 0;
+}
+
+static int rt712_sdca_dmic_fu1e_capture_put(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct rt712_sdca_dmic_priv *rt712 = snd_soc_component_get_drvdata(component);
+	struct rt712_sdca_dmic_kctrl_priv *p =
+		(struct rt712_sdca_dmic_kctrl_priv *)kcontrol->private_value;
+	int err, changed = 0, i;
+
+	for (i = 0; i < p->count; i++) {
+		if (rt712->fu1e_mixer_mute[i] != !ucontrol->value.integer.value[i])
+			changed = 1;
+		rt712->fu1e_mixer_mute[i] = !ucontrol->value.integer.value[i];
+	}
+
+	err = rt712_sdca_set_fu1e_capture_ctl(rt712);
+	if (err < 0)
+		return err;
+
+	return changed;
+}
+
+static int rt712_sdca_fu_info(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_info *uinfo)
+{
+	struct rt712_sdca_dmic_kctrl_priv *p =
+		(struct rt712_sdca_dmic_kctrl_priv *)kcontrol->private_value;
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
+#define RT712_SDCA_PR_VALUE(xreg_base, xcount, xmax, xinvert) \
+	((unsigned long)&(struct rt712_sdca_dmic_kctrl_priv) \
+		{.reg_base = xreg_base, .count = xcount, .max = xmax, \
+		.invert = xinvert})
+
+#define RT712_SDCA_FU_CTRL(xname, reg_base, xmax, xinvert, xcount) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
+	.info = rt712_sdca_fu_info, \
+	.get = rt712_sdca_dmic_fu1e_capture_get, \
+	.put = rt712_sdca_dmic_fu1e_capture_put, \
+	.private_value = RT712_SDCA_PR_VALUE(reg_base, xcount, xmax, xinvert)}
+
+#define RT712_SDCA_EXT_TLV(xname, reg_base, xhandler_get,\
+	 xhandler_put, xcount, xmax, tlv_array) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
+	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
+		 SNDRV_CTL_ELEM_ACCESS_READWRITE, \
+	.tlv.p = (tlv_array), \
+	.info = rt712_sdca_fu_info, \
+	.get = xhandler_get, .put = xhandler_put, \
+	.private_value = RT712_SDCA_PR_VALUE(reg_base, xcount, xmax, 0) }
+
+static const DECLARE_TLV_DB_SCALE(in_vol_tlv, -1725, 75, 0);
+static const DECLARE_TLV_DB_SCALE(mic_vol_tlv, 0, 1000, 0);
+
+static const struct snd_kcontrol_new rt712_sdca_dmic_snd_controls[] = {
+	RT712_SDCA_FU_CTRL("FU1E Capture Switch",
+		SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_USER_FU1E, RT712_SDCA_CTL_FU_MUTE, CH_01),
+		1, 1, 4),
+	RT712_SDCA_EXT_TLV("FU1E Capture Volume",
+		SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_USER_FU1E, RT712_SDCA_CTL_FU_VOLUME, CH_01),
+		rt712_sdca_dmic_set_gain_get, rt712_sdca_dmic_set_gain_put, 4, 0x3f, in_vol_tlv),
+	RT712_SDCA_EXT_TLV("FU15 Boost Volume",
+		SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_PLATFORM_FU15, RT712_SDCA_CTL_FU_CH_GAIN, CH_01),
+		rt712_sdca_dmic_set_gain_get, rt712_sdca_dmic_set_gain_put, 4, 3, mic_vol_tlv),
+};
+
+static int rt712_sdca_dmic_mux_get(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_kcontrol_component(kcontrol);
+	struct rt712_sdca_dmic_priv *rt712 = snd_soc_component_get_drvdata(component);
+	unsigned int val = 0, mask_sft;
+
+	if (strstr(ucontrol->id.name, "ADC 25 Mux"))
+		mask_sft = 8;
+	else if (strstr(ucontrol->id.name, "ADC 26 Mux"))
+		mask_sft = 4;
+	else
+		return -EINVAL;
+
+	rt712_sdca_dmic_index_read(rt712, RT712_VENDOR_HDA_CTL,
+		RT712_HDA_LEGACY_MUX_CTL0, &val);
+
+	ucontrol->value.enumerated.item[0] = (val >> mask_sft) & 0x7;
+
+	return 0;
+}
+
+static int rt712_sdca_dmic_mux_put(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct rt712_sdca_dmic_priv *rt712 = snd_soc_component_get_drvdata(component);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int *item = ucontrol->value.enumerated.item;
+	unsigned int val, val2 = 0, change, mask_sft;
+
+	if (item[0] >= e->items)
+		return -EINVAL;
+
+	if (strstr(ucontrol->id.name, "ADC 25 Mux"))
+		mask_sft = 8;
+	else if (strstr(ucontrol->id.name, "ADC 26 Mux"))
+		mask_sft = 4;
+	else
+		return -EINVAL;
+
+	val = snd_soc_enum_item_to_val(e, item[0]) << e->shift_l;
+
+	rt712_sdca_dmic_index_read(rt712, RT712_VENDOR_HDA_CTL,
+		RT712_HDA_LEGACY_MUX_CTL0, &val2);
+	val2 = (0x7 << mask_sft) & val2;
+
+	if (val == val2)
+		change = 0;
+	else
+		change = 1;
+
+	if (change)
+		rt712_sdca_dmic_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
+			RT712_HDA_LEGACY_MUX_CTL0, 0x7 << mask_sft,
+			val << mask_sft);
+
+	snd_soc_dapm_mux_update_power(dapm, kcontrol,
+		item[0], e, NULL);
+
+	return change;
+}
+
+static const char * const adc_mux_text[] = {
+	"DMIC1",
+	"DMIC2",
+};
+
+static SOC_ENUM_SINGLE_DECL(
+	rt712_adc25_enum, SND_SOC_NOPM, 0, adc_mux_text);
+
+static SOC_ENUM_SINGLE_DECL(
+	rt712_adc26_enum, SND_SOC_NOPM, 0, adc_mux_text);
+
+static const struct snd_kcontrol_new rt712_sdca_dmic_adc25_mux =
+	SOC_DAPM_ENUM_EXT("ADC 25 Mux", rt712_adc25_enum,
+			rt712_sdca_dmic_mux_get, rt712_sdca_dmic_mux_put);
+
+static const struct snd_kcontrol_new rt712_sdca_dmic_adc26_mux =
+	SOC_DAPM_ENUM_EXT("ADC 26 Mux", rt712_adc26_enum,
+			rt712_sdca_dmic_mux_get, rt712_sdca_dmic_mux_put);
+
+static int rt712_sdca_dmic_fu1e_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct rt712_sdca_dmic_priv *rt712 = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		rt712->fu1e_dapm_mute = false;
+		rt712_sdca_set_fu1e_capture_ctl(rt712);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		rt712->fu1e_dapm_mute = true;
+		rt712_sdca_set_fu1e_capture_ctl(rt712);
+		break;
+	}
+	return 0;
+}
+
+static int rt712_sdca_dmic_pde11_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct rt712_sdca_dmic_priv *rt712 = snd_soc_component_get_drvdata(component);
+	unsigned char ps0 = 0x0, ps3 = 0x3;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		regmap_write(rt712->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_PDE11,
+				RT712_SDCA_CTL_REQ_POWER_STATE, 0),
+				ps0);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		regmap_write(rt712->regmap,
+			SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_PDE11,
+				RT712_SDCA_CTL_REQ_POWER_STATE, 0),
+				ps3);
+		break;
+	}
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget rt712_sdca_dmic_dapm_widgets[] = {
+	SND_SOC_DAPM_INPUT("DMIC1"),
+	SND_SOC_DAPM_INPUT("DMIC2"),
+
+	SND_SOC_DAPM_SUPPLY("PDE 11", SND_SOC_NOPM, 0, 0,
+		rt712_sdca_dmic_pde11_event,
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+
+	SND_SOC_DAPM_ADC_E("FU 1E", NULL, SND_SOC_NOPM, 0, 0,
+		rt712_sdca_dmic_fu1e_event,
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_MUX("ADC 25 Mux", SND_SOC_NOPM, 0, 0,
+		&rt712_sdca_dmic_adc25_mux),
+	SND_SOC_DAPM_MUX("ADC 26 Mux", SND_SOC_NOPM, 0, 0,
+		&rt712_sdca_dmic_adc26_mux),
+
+	SND_SOC_DAPM_AIF_OUT("DP2TX", "DP2 Capture", 0, SND_SOC_NOPM, 0, 0),
+};
+
+static const struct snd_soc_dapm_route rt712_sdca_dmic_audio_map[] = {
+	{"DP2TX", NULL, "FU 1E"},
+
+	{"FU 1E", NULL, "PDE 11"},
+	{"FU 1E", NULL, "ADC 25 Mux"},
+	{"FU 1E", NULL, "ADC 26 Mux"},
+	{"ADC 25 Mux", "DMIC1", "DMIC1"},
+	{"ADC 25 Mux", "DMIC2", "DMIC2"},
+	{"ADC 26 Mux", "DMIC1", "DMIC1"},
+	{"ADC 26 Mux", "DMIC2", "DMIC2"},
+};
+
+static int rt712_sdca_dmic_probe(struct snd_soc_component *component)
+{
+	struct rt712_sdca_dmic_priv *rt712 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	rt712->component = component;
+
+	ret = pm_runtime_resume(component->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
+
+	return 0;
+}
+
+static const struct snd_soc_component_driver soc_sdca_dev_rt712_dmic = {
+	.probe = rt712_sdca_dmic_probe,
+	.controls = rt712_sdca_dmic_snd_controls,
+	.num_controls = ARRAY_SIZE(rt712_sdca_dmic_snd_controls),
+	.dapm_widgets = rt712_sdca_dmic_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(rt712_sdca_dmic_dapm_widgets),
+	.dapm_routes = rt712_sdca_dmic_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(rt712_sdca_dmic_audio_map),
+	.endianness = 1,
+};
+
+static int rt712_sdca_dmic_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
+				int direction)
+{
+	snd_soc_dai_dma_data_set(dai, direction, sdw_stream);
+
+	return 0;
+}
+
+static void rt712_sdca_dmic_shutdown(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	snd_soc_dai_set_dma_data(dai, substream, NULL);
+}
+
+static int rt712_sdca_dmic_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct rt712_sdca_dmic_priv *rt712 = snd_soc_component_get_drvdata(component);
+	struct sdw_stream_config stream_config;
+	struct sdw_port_config port_config;
+	struct sdw_stream_runtime *sdw_stream;
+	int retval, num_channels;
+	unsigned int sampling_rate;
+
+	dev_dbg(dai->dev, "%s %s", __func__, dai->name);
+	sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
+
+	if (!sdw_stream)
+		return -EINVAL;
+
+	if (!rt712->slave)
+		return -EINVAL;
+
+	stream_config.frame_rate = params_rate(params);
+	stream_config.ch_count = params_channels(params);
+	stream_config.bps = snd_pcm_format_width(params_format(params));
+	stream_config.direction = SDW_DATA_DIR_TX;
+
+	num_channels = params_channels(params);
+	port_config.ch_mask = GENMASK(num_channels - 1, 0);
+	port_config.num = 2;
+
+	retval = sdw_stream_add_slave(rt712->slave, &stream_config,
+					&port_config, 1, sdw_stream);
+	if (retval) {
+		dev_err(dai->dev, "Unable to configure port\n");
+		return retval;
+	}
+
+	if (params_channels(params) > 4) {
+		dev_err(component->dev, "Unsupported channels %d\n",
+			params_channels(params));
+		return -EINVAL;
+	}
+
+	/* sampling rate configuration */
+	switch (params_rate(params)) {
+	case 16000:
+		sampling_rate = RT712_SDCA_RATE_16000HZ;
+		break;
+	case 32000:
+		sampling_rate = RT712_SDCA_RATE_32000HZ;
+		break;
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
+	regmap_write(rt712->regmap,
+		SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_CS1F, RT712_SDCA_CTL_SAMPLE_FREQ_INDEX, 0),
+		sampling_rate);
+	regmap_write(rt712->regmap,
+		SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_CS1C, RT712_SDCA_CTL_SAMPLE_FREQ_INDEX, 0),
+		sampling_rate);
+
+	return 0;
+}
+
+static int rt712_sdca_dmic_hw_free(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct rt712_sdca_dmic_priv *rt712 = snd_soc_component_get_drvdata(component);
+	struct sdw_stream_runtime *sdw_stream =
+		snd_soc_dai_get_dma_data(dai, substream);
+
+	if (!rt712->slave)
+		return -EINVAL;
+
+	sdw_stream_remove_slave(rt712->slave, sdw_stream);
+	return 0;
+}
+
+#define RT712_STEREO_RATES (SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 | \
+			SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_192000)
+#define RT712_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
+			SNDRV_PCM_FMTBIT_S24_LE)
+
+static const struct snd_soc_dai_ops rt712_sdca_dmic_ops = {
+	.hw_params	= rt712_sdca_dmic_hw_params,
+	.hw_free	= rt712_sdca_dmic_hw_free,
+	.set_stream	= rt712_sdca_dmic_set_sdw_stream,
+	.shutdown	= rt712_sdca_dmic_shutdown,
+};
+
+static struct snd_soc_dai_driver rt712_sdca_dmic_dai[] = {
+	{
+		.name = "rt712-sdca-dmic-aif1",
+		.id = RT712_AIF1,
+		.capture = {
+			.stream_name = "DP2 Capture",
+			.channels_min = 1,
+			.channels_max = 4,
+			.rates = RT712_STEREO_RATES,
+			.formats = RT712_FORMATS,
+		},
+		.ops = &rt712_sdca_dmic_ops,
+	},
+};
+
+int rt712_sdca_dmic_init(struct device *dev, struct regmap *regmap,
+			struct regmap *mbq_regmap, struct sdw_slave *slave)
+{
+	struct rt712_sdca_dmic_priv *rt712;
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
+	/*
+	 * Mark hw_init to false
+	 * HW init will be performed when device reports present
+	 */
+	rt712->hw_init = false;
+	rt712->first_hw_init = false;
+	rt712->fu1e_dapm_mute = true;
+	rt712->fu1e_mixer_mute[0] = rt712->fu1e_mixer_mute[1] =
+		rt712->fu1e_mixer_mute[2] = rt712->fu1e_mixer_mute[3] = true;
+
+	ret =  devm_snd_soc_register_component(dev,
+			&soc_sdca_dev_rt712_dmic,
+			rt712_sdca_dmic_dai,
+			ARRAY_SIZE(rt712_sdca_dmic_dai));
+
+	dev_dbg(&slave->dev, "%s\n", __func__);
+
+	return ret;
+}
+
+
+static int rt712_sdca_dmic_update_status(struct sdw_slave *slave,
+				enum sdw_slave_status status)
+{
+	struct rt712_sdca_dmic_priv *rt712 = dev_get_drvdata(&slave->dev);
+
+	/* Update the status */
+	rt712->status = status;
+
+	if (status == SDW_SLAVE_UNATTACHED)
+		rt712->hw_init = false;
+
+	/*
+	 * Perform initialization only if slave status is present and
+	 * hw_init flag is false
+	 */
+	if (rt712->hw_init || rt712->status != SDW_SLAVE_ATTACHED)
+		return 0;
+
+	/* perform I/O transfers required for Slave initialization */
+	return rt712_sdca_dmic_io_init(&slave->dev, slave);
+}
+
+static int rt712_sdca_dmic_read_prop(struct sdw_slave *slave)
+{
+	struct sdw_slave_prop *prop = &slave->prop;
+	int nval, i;
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
+	prop->source_ports = BIT(2); /* BITMAP: 00000100 */
+	prop->sink_ports = 0;
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
+	/* set the timeout values */
+	prop->clk_stop_timeout = 200;
+
+	/* wake-up event */
+	prop->wake_capable = 1;
+
+	return 0;
+}
+
+static const struct sdw_device_id rt712_sdca_dmic_id[] = {
+	SDW_SLAVE_ENTRY_EXT(0x025d, 0x1712, 0x3, 0x1, 0),
+	SDW_SLAVE_ENTRY_EXT(0x025d, 0x1713, 0x3, 0x1, 0),
+	SDW_SLAVE_ENTRY_EXT(0x025d, 0x1716, 0x3, 0x1, 0),
+	SDW_SLAVE_ENTRY_EXT(0x025d, 0x1717, 0x3, 0x1, 0),
+	{},
+};
+MODULE_DEVICE_TABLE(sdw, rt712_sdca_dmic_id);
+
+static int __maybe_unused rt712_sdca_dmic_dev_suspend(struct device *dev)
+{
+	struct rt712_sdca_dmic_priv *rt712 = dev_get_drvdata(dev);
+
+	if (!rt712->hw_init)
+		return 0;
+
+	regcache_cache_only(rt712->regmap, true);
+	regcache_cache_only(rt712->mbq_regmap, true);
+
+	return 0;
+}
+
+static int __maybe_unused rt712_sdca_dmic_dev_system_suspend(struct device *dev)
+{
+	struct rt712_sdca_dmic_priv *rt712_sdca = dev_get_drvdata(dev);
+
+	if (!rt712_sdca->hw_init)
+		return 0;
+
+	return rt712_sdca_dmic_dev_suspend(dev);
+}
+
+#define RT712_PROBE_TIMEOUT 5000
+
+static int __maybe_unused rt712_sdca_dmic_dev_resume(struct device *dev)
+{
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	struct rt712_sdca_dmic_priv *rt712 = dev_get_drvdata(dev);
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
+static const struct dev_pm_ops rt712_sdca_dmic_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(rt712_sdca_dmic_dev_system_suspend, rt712_sdca_dmic_dev_resume)
+	SET_RUNTIME_PM_OPS(rt712_sdca_dmic_dev_suspend, rt712_sdca_dmic_dev_resume, NULL)
+};
+
+
+static struct sdw_slave_ops rt712_sdca_dmic_slave_ops = {
+	.read_prop = rt712_sdca_dmic_read_prop,
+	.update_status = rt712_sdca_dmic_update_status,
+};
+
+static int rt712_sdca_dmic_sdw_probe(struct sdw_slave *slave,
+				const struct sdw_device_id *id)
+{
+	struct regmap *regmap, *mbq_regmap;
+
+	/* Regmap Initialization */
+	mbq_regmap = devm_regmap_init_sdw_mbq(slave, &rt712_sdca_dmic_mbq_regmap);
+	if (IS_ERR(mbq_regmap))
+		return PTR_ERR(mbq_regmap);
+
+	regmap = devm_regmap_init_sdw(slave, &rt712_sdca_dmic_regmap);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	return rt712_sdca_dmic_init(&slave->dev, regmap, mbq_regmap, slave);
+}
+
+static int rt712_sdca_dmic_sdw_remove(struct sdw_slave *slave)
+{
+	struct rt712_sdca_dmic_priv *rt712 = dev_get_drvdata(&slave->dev);
+
+	if (rt712->first_hw_init)
+		pm_runtime_disable(&slave->dev);
+
+	return 0;
+}
+
+static struct sdw_driver rt712_sdca_dmic_sdw_driver = {
+	.driver = {
+		.name = "rt712-sdca-dmic",
+		.owner = THIS_MODULE,
+		.pm = &rt712_sdca_dmic_pm,
+	},
+	.probe = rt712_sdca_dmic_sdw_probe,
+	.remove = rt712_sdca_dmic_sdw_remove,
+	.ops = &rt712_sdca_dmic_slave_ops,
+	.id_table = rt712_sdca_dmic_id,
+};
+module_sdw_driver(rt712_sdca_dmic_sdw_driver);
+
+MODULE_DESCRIPTION("ASoC RT712 SDCA DMIC SDW driver");
+MODULE_AUTHOR("Shuming Fan <shumingf@realtek.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/rt712-sdca-dmic.h b/sound/soc/codecs/rt712-sdca-dmic.h
new file mode 100644
index 000000000000..b31e57918e3e
--- /dev/null
+++ b/sound/soc/codecs/rt712-sdca-dmic.h
@@ -0,0 +1,106 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * rt712-sdca-dmic.h -- RT712 SDCA DMIC ALSA SoC audio driver header
+ *
+ * Copyright(c) 2023 Realtek Semiconductor Corp.
+ */
+
+#ifndef __RT712_SDW_DMIC_H__
+#define __RT712_SDW_DMIC_H__
+
+#include <linux/regmap.h>
+#include <linux/soundwire/sdw_registers.h>
+
+struct  rt712_sdca_dmic_priv {
+	struct regmap *regmap, *mbq_regmap;
+	struct snd_soc_component *component;
+	struct sdw_slave *slave;
+	enum sdw_slave_status status;
+	struct sdw_bus_params params;
+	bool hw_init;
+	bool first_hw_init;
+	bool fu1e_dapm_mute, fu1e_mixer_mute[4];
+};
+
+struct rt712_sdca_dmic_kctrl_priv {
+	unsigned int reg_base;
+	unsigned int count;
+	unsigned int max;
+	unsigned int invert;
+};
+
+/* SDCA (Channel) */
+#define CH_01	0x01
+#define CH_02	0x02
+#define CH_03	0x03
+#define CH_04	0x04
+
+static const struct reg_default rt712_sdca_dmic_reg_defaults[] = {
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
+	{ 0x2f35, 0x02 },
+	{ 0x2f36, 0xcf },
+	{ 0x2f52, 0x08 },
+	{ 0x2f58, 0x07 },
+	{ 0x2f59, 0x07 },
+	{ 0x3201, 0x01 },
+	{ 0x320c, 0x00 },
+	{ SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_IT26, RT712_SDCA_CTL_VENDOR_DEF, 0), 0x00 },
+	{ SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_USER_FU1E, RT712_SDCA_CTL_FU_MUTE, CH_01), 0x01 },
+	{ SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_USER_FU1E, RT712_SDCA_CTL_FU_MUTE, CH_02), 0x01 },
+	{ SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_USER_FU1E, RT712_SDCA_CTL_FU_MUTE, CH_03), 0x01 },
+	{ SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_USER_FU1E, RT712_SDCA_CTL_FU_MUTE, CH_04), 0x01 },
+	{ SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_CS1F, RT712_SDCA_CTL_SAMPLE_FREQ_INDEX, 0), 0x09 },
+	{ SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_CS1C, RT712_SDCA_CTL_SAMPLE_FREQ_INDEX, 0), 0x09 },
+};
+
+static const struct reg_default rt712_sdca_dmic_mbq_defaults[] = {
+	{ 0x0590001e, 0x0020 },
+	{ 0x06100000, 0x0010 },
+	{ 0x06100006, 0x0055 },
+	{ 0x06100010, 0x2630 },
+	{ 0x06100011, 0x152f },
+	{ 0x06100013, 0x0102 },
+	{ 0x06100015, 0x2219 },
+	{ 0x06100018, 0x0102 },
+	{ 0x06100026, 0x2c29 },
+	{ 0x06100027, 0x2d2b },
+	{ 0x0610002b, 0x2a32 },
+	{ 0x0610002f, 0x3355 },
+	{ SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_PLATFORM_FU15, RT712_SDCA_CTL_FU_CH_GAIN, CH_01), 0x0000 },
+	{ SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_PLATFORM_FU15, RT712_SDCA_CTL_FU_CH_GAIN, CH_02), 0x0000 },
+	{ SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_PLATFORM_FU15, RT712_SDCA_CTL_FU_CH_GAIN, CH_03), 0x0000 },
+	{ SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_PLATFORM_FU15, RT712_SDCA_CTL_FU_CH_GAIN, CH_04), 0x0000 },
+	{ SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_USER_FU1E, RT712_SDCA_CTL_FU_VOLUME, CH_01), 0x0000 },
+	{ SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_USER_FU1E, RT712_SDCA_CTL_FU_VOLUME, CH_02), 0x0000 },
+	{ SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_USER_FU1E, RT712_SDCA_CTL_FU_VOLUME, CH_03), 0x0000 },
+	{ SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_USER_FU1E, RT712_SDCA_CTL_FU_VOLUME, CH_04), 0x0000 },
+};
+
+#endif /* __RT712_SDW_DMIC_H__ */
-- 
2.34.1

