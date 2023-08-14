Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A6077BBA4
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 16:30:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B015886E;
	Mon, 14 Aug 2023 16:29:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B015886E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692023419;
	bh=vTuadESsj3sGeUyq286MLPWf8qLIn9uUOxG+PitB2us=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FBC605YF8JERnMdabOUZExku41rsO/KMD0358XrA3gMBah3NNOiGhJ0wlGxQvA/AQ
	 DNNJZ1w2JGeaV51hpIGQQY0ZtiSKvL4x/iIdysZxaJuoE9hNHIlYXrh5lyP0YCPVH6
	 OZ0DHhuWyQjXc8IXpmm16uAwoWu9jCoObeb77lfo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 907B0F805E8; Mon, 14 Aug 2023 16:27:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78491F805EA;
	Mon, 14 Aug 2023 16:27:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27712F8025F; Mon, 14 Aug 2023 14:12:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DA559F80074
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 14:12:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA559F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=R/9ohU6m
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37ECCC8l044969;
	Mon, 14 Aug 2023 07:12:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692015132;
	bh=iImvliJebUUOFNfDKTCYx/Fm6NWRbhHRRx+xfrne3Uw=;
	h=From:To:CC:Subject:Date;
	b=R/9ohU6m3fQKF/VduVZljHBrxuT9dIJ/123ej576RfyMQmziU9rkA0avQ3pmsC9Uw
	 u1+EQq7SIk+jI9i9hzQN2ZXc+/lqGF0MeLp2By5MfnN9p1GurCuEq0jyRkjIidT0pO
	 js7IM9EbKf6QlQOxjuO/vn0gEo9mdyOBdplWeRFo=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37ECCCoF100478
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Aug 2023 07:12:12 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Aug 2023 07:12:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 14 Aug 2023 07:12:11 -0500
Received: from ti-Alder-Lake-Client-Platform.dhcp.ti.com
 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37ECC2bY009833;
	Mon, 14 Aug 2023 07:12:03 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>
CC: <shenghao-ding@ti.com>, <kevin-lu@ti.com>,
        <krzysztof.kozlowski@linaro.org>, <rf@opensource.cirrus.com>,
        <shumingf@realtek.com>, <herve.codina@bootlin.com>,
        <povik+lin@cutebit.org>, <ryans.lee@analog.com>,
        <ckeepax@opensource.cirrus.com>, <sebastian.reichel@collabora.com>,
        <fido_max@inbox.ru>, <wangweidong.a@awinic.com>,
        <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <peeyush@ti.com>, <navada@ti.com>, <tiwai@suse.de>,
        <mengdong.lin@intel.com>, <baojun.xu@ti.com>
Subject: [PATCH v2] ASoC: tas2783: Add source files for tas2783 soundwire
 driver
Date: Mon, 14 Aug 2023 20:11:58 +0800
Message-ID: <20230814121158.4668-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RWAQTH6O5LWNSAPLI3KW327AWFRGOWUD
X-Message-ID-Hash: RWAQTH6O5LWNSAPLI3KW327AWFRGOWUD
X-Mailman-Approved-At: Mon, 14 Aug 2023 14:26:37 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RWAQTH6O5LWNSAPLI3KW327AWFRGOWUD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add source file and header file for tas2783 driver.
Update Kconfig and Makefile for tas2783 driver.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>

---
Change in v2:
 - change all registers access to regmap.
 - change header file include order.
 - remove tas2783_sdw_read().
 - remove regmap_bus and relative function.
 - change custom access to regmap.
 - return if get calibration data from EFI failed.
 - remove mutex protect for null function.
 - remove tasdevice_startup() as no actions needed.
 - remove sysclk function as no action needed.
 - remove tasdevice_mute().
 - remove crc8 look up table generate.
 - remove first_hw_init flag.
 - change some define name to TAS2783_XXX.
 - remove SMS_HTONL(), use le_to_cpup().
 - remove enum channel define.
 - change struct and element name for FW.
 - remove global address elements.
 - remove irq and gpio in structure.
 - remove tasdevice structure.
---
 sound/soc/codecs/Kconfig       |  12 +
 sound/soc/codecs/Makefile      |   2 +
 sound/soc/codecs/tas2783-sdw.c | 872 +++++++++++++++++++++++++++++++++
 sound/soc/codecs/tas2783.h     | 113 +++++
 4 files changed, 999 insertions(+)
 create mode 100644 sound/soc/codecs/tas2783-sdw.c
 create mode 100644 sound/soc/codecs/tas2783.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index c2de4ee72183..a4d334faca5e 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -240,6 +240,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_TAS2781_COMLIB
 	imply SND_SOC_TAS2781_FMWLIB
 	imply SND_SOC_TAS2781_I2C
+	imply SND_SOC_TAS2783
 	imply SND_SOC_TAS5086
 	imply SND_SOC_TAS571X
 	imply SND_SOC_TAS5720
@@ -1758,6 +1759,17 @@ config SND_SOC_TAS2781_I2C
 	  algo coefficient setting, for one, two or even multiple TAS2781
 	  chips.
 
+config SND_SOC_TAS2783
+       tristate "Texas Instruments TAS2783 speaker amplifier (sdw)"
+       depends on SOUNDWIRE
+       select REGMAP
+       select CRC32_SARWATE
+       help
+         Enable support for Texas Instruments TAS2783 Smart Amplifier
+         Digital input mono Class-D and DSP-inside audio power amplifiers.
+         Note the TAS2783 driver implements a flexible and configurable
+         algo coff setting, for one, two, even multiple TAS2783 chips.
+
 config SND_SOC_TAS5086
 	tristate "Texas Instruments TAS5086 speaker amplifier"
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index b48a9a323b84..3298dfa3b9d5 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -276,6 +276,7 @@ snd-soc-tas2770-objs := tas2770.o
 snd-soc-tas2781-comlib-objs := tas2781-comlib.o
 snd-soc-tas2781-fmwlib-objs := tas2781-fmwlib.o
 snd-soc-tas2781-i2c-objs := tas2781-i2c.o
+snd-soc-tas2783-objs := tas2783-sdw.o
 snd-soc-tfa9879-objs := tfa9879.o
 snd-soc-tfa989x-objs := tfa989x.o
 snd-soc-tlv320adc3xxx-objs := tlv320adc3xxx.o
@@ -648,6 +649,7 @@ obj-$(CONFIG_SND_SOC_TAS2780)	+= snd-soc-tas2780.o
 obj-$(CONFIG_SND_SOC_TAS2781_COMLIB)	+= snd-soc-tas2781-comlib.o
 obj-$(CONFIG_SND_SOC_TAS2781_FMWLIB)	+= snd-soc-tas2781-fmwlib.o
 obj-$(CONFIG_SND_SOC_TAS2781_I2C)	+= snd-soc-tas2781-i2c.o
+obj-$(CONFIG_SND_SOC_TAS2783)	+= snd-soc-tas2783.o
 obj-$(CONFIG_SND_SOC_TAS5086)	+= snd-soc-tas5086.o
 obj-$(CONFIG_SND_SOC_TAS571X)	+= snd-soc-tas571x.o
 obj-$(CONFIG_SND_SOC_TAS5720)	+= snd-soc-tas5720.o
diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
new file mode 100644
index 000000000000..f916ac9c5520
--- /dev/null
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -0,0 +1,871 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// ALSA SoC Texas Instruments TAS2783 Audio Smart Amplifier.
+//
+// Copyright (C) 2023 Texas Instruments Incorporated
+// https://www.ti.com
+//
+// The TAS2783 driver implements a flexible and configurable
+// algo coefficient setting for single TAS2783 chips.
+//
+// Author: Baojun Xu <baojun.xu@ti.com>
+// Author: Kevin Lu <kevin-lu@ti.com>
+//
+
+#include <linux/crc32.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/efi.h>
+#include <linux/err.h>
+#include <linux/firmware.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_registers.h>
+#include <linux/soundwire/sdw_type.h>
+#include <sound/pcm_params.h>
+#include <sound/sdw.h>
+#include <sound/soc.h>
+#include <sound/tlv.h>
+#include <sound/tas2781-tlv.h>
+
+#include "tas2783.h"
+
+static const unsigned int tas2783_calibration_reg[] = {
+	TAS2783_CALIBRATION_RE,
+	TAS2783_CALIBRATION_RE_LOW,
+	TAS2783_CALIBRATION_INV_RE,
+	TAS2783_CALIBRATION_POW,
+	TAS2783_CALIBRATION_TLIMIT,
+	0,
+};
+
+static const struct reg_default tas2783_reg_defaults[] = {
+	// Default values for ROM mode. Activated.
+	{ 0x8002, 0x1a},	// Put AMP in power down mode, B0P0R02.
+	{ 0x800e, 0x44},	// VSense from slot 4, B0P0R0E.
+	{ 0x800f, 0x40},	// ISense from slot 0, B0P0R0E.
+	{ 0x8097, 0xc8},	// SARBurstMask = 0, B0P1R17.
+	{ 0x80b5, 0x74},
+	{ 0x8099, 0x20},
+	{ 0xfe8d, 0x0d},
+	{ 0xfebe, 0x4a},
+	{ 0x8230, 0x00},
+	{ 0x8231, 0x00},
+	{ 0x8232, 0x00},
+	{ 0x8233, 0x01},	// YMEM[70] = 1. B0P4R30.
+	{ 0x8418, 0x00},	// 0 dB in B0P8R18.
+	{ 0x8419, 0x00},
+	{ 0x841a, 0x00},
+	{ 0x841b, 0x00},
+	{ 0x8428, 0x40},	// Unmute channel, B0P8R28.
+	{ 0x8429, 0x00},
+	{ 0x842a, 0x00},
+	{ 0x842b, 0x00},
+	{ 0x8548, 0x00},	// 0dB in B0PAR48.
+	{ 0x8549, 0x00},
+	{ 0x854a, 0x00},
+	{ 0x854b, 0x00},
+	{ 0x8558, 0x40},	// unmute channel, B0PAR58.
+	{ 0x8559, 0x00},
+	{ 0x855a, 0x00},
+	{ 0x855b, 0x00},
+	{ 0x800a, 0x3a},	// Enable both channel in B0P0RA.
+	{ 0x805c, 0xd9},	// Enable clock detected in B0P0R5C.
+	{ 0x8002, 0x00},	// Put AMP in active mode, B0P0R02.
+	/* Below register was used to select function, entity, CS, CN. */
+	{ SDW_SDCA_CTL(1, 1, 2, 0), 0},	// 0x40400088.
+	{ SDW_SDCA_CTL(1, 1, 1, 0), 0},	// 0x40400090.
+	{ SDW_SDCA_CTL(1, 2, 1, 0), 0},	// 0x40400108.
+};
+
+static bool tas2783_readable_register(struct device *dev,
+	unsigned int reg)
+{
+	switch (reg) {
+	case 0x8000 ... 0xc000:	// Page 0 ~ 127.
+	case 0xfe80 ... 0xfeff:	// Page 253.
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_UDMPU21,
+		TAS2783_SDCA_CTL_UDMPU_CLUSTER, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_FU21,
+		TAS2783_SDCA_CTL_FU_MUTE, TAS2783_DEVICE_CHANNEL_LEFT):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_FU21,
+		TAS2783_SDCA_CTL_FU_MUTE, TAS2783_DEVICE_CHANNEL_RIGHT):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_PDE23,
+		TAS2783_SDCA_CTL_REQ_POWER_STATE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_SMART_AMP, TAS2783_SDCA_ENT_PDE22,
+		TAS2783_SDCA_CTL_REQ_POWER_STATE, 0):
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool tas2783_volatile_register(struct device *dev,
+	unsigned int reg)
+{
+	switch (reg) {
+	case 0x8001:
+		// Only reset register was volatiled.
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config tasdevice_regmap = {
+	.reg_bits = 32,
+	.val_bits = 8,
+	.readable_reg = tas2783_readable_register,
+	.volatile_reg = tas2783_volatile_register,
+	.max_register = 0x41008000 + TASDEVICE_REG(0xa1, 0x60, 0x7f),
+	.reg_defaults = tas2783_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(tas2783_reg_defaults),
+	.cache_type = REGCACHE_RBTREE,
+	.use_single_read = true,
+	.use_single_write = true,
+};
+
+static int tasdevice_clamp(int val, int max, unsigned int invert)
+{
+	/* Keep in valid area, out of range value don't care. */
+	if (val > max)
+		val = max;
+	if (invert)
+		val = max - val;
+	if (val < 0)
+		val = 0;
+	return val;
+}
+
+static int tas2783_digital_getvol(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec
+		= snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_dev =
+		snd_soc_component_get_drvdata(codec);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct regmap *map = tas_dev->regmap;
+	int val = 0, ret;
+
+	if (!map) {
+		ret = -EINVAL;
+		dev_err(tas_dev->dev, "%s, regmap doesn't exist.\n",
+			__func__);
+		goto out;
+	}
+	/* Read the primary device as the whole */
+	ret = regmap_read(map, mc->reg, &val);
+	dev_dbg(tas_dev->dev, "%s, get digital vol %d from %x with %d\n",
+		__func__, val, mc->reg, ret);
+	if (ret) {
+		dev_err(tas_dev->dev, "%s, get digital vol error %x.\n",
+			__func__, ret);
+		goto out;
+	}
+	ucontrol->value.integer.value[0] =
+		tasdevice_clamp(val, mc->max, mc->invert);
+
+out:
+	return ret;
+}
+
+static int tas2783_digital_putvol(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec
+		= snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_dev =
+		snd_soc_component_get_drvdata(codec);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct regmap *map = tas_dev->regmap;
+	int val, ret;
+
+	if (!map) {
+		dev_err(tas_dev->dev, "%s, regmap doesn't exist.\n",
+			__func__);
+		return -EINVAL;
+	}
+	val = tasdevice_clamp(ucontrol->value.integer.value[0],
+		mc->max, mc->invert);
+
+	ret = regmap_write(map, mc->reg, val);
+	if (ret != 0) {
+		dev_err(tas_dev->dev, "Write @%#x..%#x:%d\n",
+			mc->reg, val, ret);
+		return ret;
+	}
+	dev_dbg(tas_dev->dev, "%s, Put digital vol %d into %x.\n",
+		__func__, val, mc->reg);
+
+	return 1;
+}
+
+static int tas2783_amp_getvol(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec
+		= snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_dev =
+		snd_soc_component_get_drvdata(codec);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct regmap *map = tas_dev->regmap;
+	unsigned char mask;
+	int ret, val;
+
+	if (!map) {
+		dev_err(tas_dev->dev, "%s, regmap doesn't exist.\n",
+			__func__);
+		return -EINVAL;
+	}
+	/* Read the primary device */
+	ret = regmap_read(map, mc->reg, &val);
+	dev_dbg(tas_dev->dev, "%s, get AMP vol %d from %x with %d\n",
+		__func__, val, mc->reg, ret);
+
+	mask = (1 << fls(mc->max)) - 1;
+	mask <<= mc->shift;
+	val = (val & mask) >> mc->shift;
+	ucontrol->value.integer.value[0] = tasdevice_clamp(val,	mc->max,
+		mc->invert);
+
+	return ret;
+}
+
+static int tas2783_amp_putvol(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec
+		= snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_dev =
+		snd_soc_component_get_drvdata(codec);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct regmap *map = tas_dev->regmap;
+	unsigned char mask;
+	int val, ret;
+
+	if (!map) {
+		dev_err(tas_dev->dev, "%s, regmap doesn't exist.\n",
+			__func__);
+		return -EINVAL;
+	}
+	mask = (1 << fls(mc->max)) - 1;
+	mask <<= mc->shift;
+	val = tasdevice_clamp(ucontrol->value.integer.value[0], mc->max,
+		mc->invert);
+	ret = regmap_update_bits(map, mc->reg, mask, val << mc->shift);
+	if (ret != 0) {
+		dev_err(tas_dev->dev, "Write @%#x..%#x:%d\n",
+			mc->reg, val, ret);
+		return ret;
+	}
+
+	dev_dbg(tas_dev->dev, "wr amp %x into 0x%08x by %x shift %d.\n",
+		val, mc->reg, mask, mc->shift);
+
+	return ret;
+}
+
+static const struct snd_kcontrol_new tas2783_snd_controls[] = {
+	SOC_SINGLE_RANGE_EXT_TLV("Amp Gain Volume", TAS2783_AMP_LEVEL,
+		1, 0, 20, 0, tas2783_amp_getvol,
+		tas2783_amp_putvol, amp_vol_tlv),
+	SOC_SINGLE_RANGE_EXT_TLV("Digital Volume", TAS2783_DVC_LVL,
+		0, 0, 200, 1, tas2783_digital_getvol,
+		tas2783_digital_putvol, dvc_tlv),
+};
+
+static void tas2783_apply_calib(
+	struct tasdevice_priv *tas_priv, unsigned int *cali_data)
+{
+	struct regmap *map = tas_priv->regmap;
+	int i = 0, ret;
+	u8 *reg_start;
+
+	if (!map) {
+		dev_err(tas_priv->dev, "%s, regmap doesn't exist.\n",
+			__func__);
+		return;
+	}
+	if (!tas_priv->sdw_peripheral) {
+		dev_err(tas_priv->dev, "%s, slaver doesn't exist.\n",
+			__func__);
+		return;
+	}
+	if ((tas_priv->sdw_peripheral->id.unique_id <
+		TAS2783_DEVICE_ID_START) ||
+		(tas_priv->sdw_peripheral->id.unique_id >
+		TAS2783_DEVICE_ID_END)) {
+		dev_err(tas_priv->dev, "%s, wrong unique id: %x.\n",
+			__func__, tas_priv->sdw_peripheral->id.unique_id);
+		return;
+	}
+	reg_start =
+		(u8 *)(cali_data+(tas_priv->sdw_peripheral->id.unique_id -
+		TAS2783_DEVICE_ID_START)*TAS2783_CALIBRATION_SIZE);
+	while (tas2783_calibration_reg[i] != 0) {
+		ret = regmap_bulk_write(map, tas2783_calibration_reg[i],
+			reg_start + i, 4);
+		if (ret != 0) {
+			dev_err(tas_priv->dev, "Cali failed %x:%d\n",
+			tas2783_calibration_reg[i], ret);
+			break;
+		}
+		i++;
+	}
+}
+
+static int tas2783_calibration(struct tasdevice_priv *tas_priv)
+{
+	efi_guid_t efi_guid = EFI_GUID(0x1f52d2a1, 0xbb3a, 0x457d, 0xbc,
+		0x09, 0x43, 0xa3, 0xf4, 0x31, 0x0a, 0x92);
+	static efi_char16_t efi_name[] = TAS2783_CALIDATA_NAME;
+	struct tm *tm = &tas_priv->tm;
+	unsigned int attr, crc;
+	unsigned int *tmp_val;
+	efi_status_t status;
+
+	tas_priv->cali_data.total_sz = TAS2783_MAX_CALIDATA_SIZE;
+	/* Get real size of UEFI variable */
+	status = efi.get_variable(efi_name, &efi_guid, &attr,
+		&tas_priv->cali_data.total_sz, tas_priv->cali_data.data);
+	dev_dbg(tas_priv->dev, "cali get %lx bytes with result : %ld\n",
+			tas_priv->cali_data.total_sz, status);
+	if (status == EFI_BUFFER_TOO_SMALL) {
+		status = efi.get_variable(efi_name, &efi_guid, &attr,
+			&tas_priv->cali_data.total_sz,
+			tas_priv->cali_data.data);
+		dev_dbg(tas_priv->dev, "cali get %lx bytes result:%ld\n",
+			tas_priv->cali_data.total_sz, status);
+	}
+	/* Failed got calibration data from EFI. */
+	if (status != 0) {
+		dev_dbg(tas_priv->dev, "cali get %lx error with:%ld\n",
+			tas_priv->cali_data.total_sz, status);
+		return 0;
+	}
+	/* Print all content of calibration data for debug. */
+	for (int i = 0; i < tas_priv->cali_data.total_sz; i += 4) {
+		dev_dbg(tas_priv->dev, "cali get %02x %02x %02x %02x",
+			tas_priv->cali_data.data[i],
+			tas_priv->cali_data.data[i+1],
+			tas_priv->cali_data.data[i+2],
+			tas_priv->cali_data.data[i+3]);
+	}
+
+	tmp_val = (unsigned int *)tas_priv->cali_data.data;
+
+	crc = crc32(~0, tas_priv->cali_data.data, 84) ^ ~0;
+	dev_dbg(tas_priv->dev, "cali crc 0x%08x PK tmp_val 0x%08x\n",
+		crc, tmp_val[21]);
+
+	if (crc == tmp_val[21]) {
+		time64_to_tm(tmp_val[20], 0, tm);
+		dev_dbg(tas_priv->dev, "%4ld-%2d-%2d, %2d:%2d:%2d\n",
+			tm->tm_year, tm->tm_mon, tm->tm_mday,
+			tm->tm_hour, tm->tm_min, tm->tm_sec);
+		tas2783_apply_calib(tas_priv, tmp_val);
+	} else {
+		dev_dbg(tas_priv->dev, "CRC error!\n");
+		tas_priv->cali_data.total_sz = 0;
+	}
+
+	return 0;
+}
+
+static void tasdevice_rca_ready(const struct firmware *fmw, void *context)
+{
+	struct tasdevice_priv *tas_dev =
+		(struct tasdevice_priv *) context;
+	struct regmap *map = tas_dev->regmap;
+	struct tas2783_firmware_node *p;
+	int offset = 0, num_nodes = 0, img_sz, ret;
+	unsigned char *buf;
+
+	mutex_lock(&tas_dev->codec_lock);
+
+	if (!fmw || !fmw->data) {
+		dev_err(tas_dev->dev,
+		"Failed to read %s, no side - effect on driver running\n",
+		tas_dev->rca_binaryname);
+		ret = -EINVAL;
+		goto out;
+	}
+	if (!map) {
+		dev_err(tas_dev->dev, "Failed to load regmap.\n");
+		ret = -EINVAL;
+		goto out;
+	}
+	buf = (unsigned char *)fmw->data;
+
+	img_sz = le32_to_cpup((__le32 *)&buf[offset]);
+	dev_dbg(tas_dev->dev,  "Got %x:%lx.\n",	img_sz, fmw->size);
+	offset  += sizeof(img_sz);
+	if (img_sz != fmw->size) {
+		dev_err(tas_dev->dev,
+			"Size not match, %d %u", (int)fmw->size, img_sz);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	while ((offset < img_sz) && (num_nodes < TAS2783_MAX_NODES)) {
+		/* Store firmware into context of driver. */
+		p = (struct tas2783_firmware_node *)(buf + offset);
+		tas_dev->firmware_node[num_nodes].vendor_id =
+			p->vendor_id;
+		tas_dev->firmware_node[num_nodes].file_id = p->file_id;
+		tas_dev->firmware_node[num_nodes].version_id =
+			p->version_id;
+		tas_dev->firmware_node[num_nodes].length = p->length;
+		tas_dev->firmware_node[num_nodes].download_addr =
+			p->download_addr;
+		tas_dev->firmware_node[num_nodes].start_addr =
+			((char *)p) + sizeof(unsigned int)*5;
+
+		ret = regmap_bulk_write(map, p->download_addr,
+			p->start_addr, p->length);
+		dev_dbg(tas_dev->dev, "Wr %d :%x:%x:%x:%x:%x:%x %d.\n",
+			num_nodes, p->vendor_id, p->file_id,
+			p->version_id, p->length, p->download_addr,
+			p->start_addr[0], ret);
+
+		offset += sizeof(unsigned int)*5 + p->length;
+		num_nodes++;
+	}
+
+	tas2783_calibration(tas_dev);
+
+out:
+	mutex_unlock(&tas_dev->codec_lock);
+	if (fmw)
+		release_firmware(fmw);
+}
+
+static const struct snd_soc_dapm_widget tasdevice_dapm_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("ASI", "ASI Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("ASI OUT", "ASI Capture", 0, SND_SOC_NOPM,
+		0, 0),
+	SND_SOC_DAPM_OUTPUT("OUT"),
+	SND_SOC_DAPM_INPUT("DMIC")
+};
+
+static const struct snd_soc_dapm_route tasdevice_audio_map[] = {
+	{"OUT", NULL, "ASI"},
+	{"ASI OUT", NULL, "DMIC"}
+};
+
+static int tasdevice_set_sdw_stream(
+	struct snd_soc_dai *dai, void *sdw_stream, int direction)
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
+	/* Use tx_mask or rx_mask to set dma_data */
+	snd_soc_dai_dma_data_set(dai, direction, stream);
+
+	return 0;
+}
+
+static void tasdevice_sdw_shutdown(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct sdw_stream_data *stream;
+
+	stream = snd_soc_dai_get_dma_data(dai, substream);
+	snd_soc_dai_set_dma_data(dai, substream, NULL);
+	kfree(stream);
+}
+
+static int tasdevice_sdw_hw_params(struct snd_pcm_substream *substream,
+	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tasdevice_priv *tasdevice =
+		snd_soc_component_get_drvdata(component);
+	struct sdw_stream_config stream_config = {0};
+	struct sdw_port_config port_config = {0};
+	struct sdw_stream_data *stream;
+	int retval;
+
+	dev_dbg(dai->dev, "%s %s", __func__, dai->name);
+	stream = snd_soc_dai_get_dma_data(dai, substream);
+
+	if (!stream)
+		return -EINVAL;
+
+	if (!tasdevice->sdw_peripheral)
+		return -EINVAL;
+
+	/* SoundWire specific configuration */
+	snd_sdw_params_to_config(substream, params,
+		&stream_config, &port_config);
+
+	/* port 1 for playback */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		port_config.num = 1;
+	else
+		port_config.num = 2;
+
+	retval = sdw_stream_add_slave(tasdevice->sdw_peripheral,
+		&stream_config,	&port_config, 1, stream->sdw_stream);
+	if (retval) {
+		dev_err(dai->dev, "Unable to configure port\n");
+		return retval;
+	}
+
+	return 0;
+}
+
+static int tasdevice_sdw_pcm_hw_free(struct snd_pcm_substream *substream,
+	struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tasdevice_priv *tasdevice =
+		snd_soc_component_get_drvdata(component);
+	struct sdw_stream_data *stream =
+		snd_soc_dai_get_dma_data(dai, substream);
+
+	if (!tasdevice->sdw_peripheral)
+		return -EINVAL;
+
+	sdw_stream_remove_slave(tasdevice->sdw_peripheral, stream->sdw_stream);
+	return 0;
+}
+
+static const struct snd_soc_dai_ops tasdevice_dai_ops = {
+	.hw_params	= tasdevice_sdw_hw_params,
+	.hw_free	= tasdevice_sdw_pcm_hw_free,
+	.set_stream	= tasdevice_set_sdw_stream,
+	.shutdown	= tasdevice_sdw_shutdown,
+};
+
+static struct snd_soc_dai_driver tasdevice_dai_driver[] = {
+	{
+		.name = "tas2783-codec",
+		.id = 0,
+		.playback = {
+			.stream_name	= "Playback",
+			.channels_min	= 1,
+			.channels_max	= 4,
+			.rates		= TAS2783_DEVICE_RATES,
+			.formats	= TAS2783_DEVICE_FORMATS,
+		},
+		.capture = {
+			.stream_name	= "Capture",
+			.channels_min	= 1,
+			.channels_max	= 4,
+			.rates		= TAS2783_DEVICE_RATES,
+			.formats	= TAS2783_DEVICE_FORMATS,
+		},
+		.ops = &tasdevice_dai_ops,
+		.symmetric_rate = 1,
+	},
+};
+
+static void tas2783_reset(struct tasdevice_priv *tas_dev)
+{
+	struct regmap *map = tas_dev->regmap;
+	unsigned char value_sdw;
+	int ret;
+
+	if (!map) {
+		dev_err(tas_dev->dev, "Failed to load regmap.\n");
+		return;
+	}
+	value_sdw = TAS2873_REG_SWRESET_RESET;
+	ret = regmap_write(map, TAS2873_REG_SWRESET, value_sdw);
+	dev_dbg(tas_dev->dev, "%s TAS2783 was reseted %d.\n",
+		__func__, ret);
+	usleep_range(1000, 1050);
+}
+
+static int tasdevice_codec_probe(struct snd_soc_component *codec)
+{
+	struct tasdevice_priv *tas_dev =
+		snd_soc_component_get_drvdata(codec);
+	int ret;
+
+	dev_dbg(tas_dev->dev, "%s called for TAS2783 start.\n",
+		__func__);
+	/* Codec Lock Hold */
+	mutex_lock(&tas_dev->codec_lock);
+
+	tas2783_reset(tas_dev);
+
+	tas_dev->codec = codec;
+
+	scnprintf(tas_dev->rca_binaryname, 64, "MY_SWFT_x%01x.bin",
+		tas_dev->sdw_peripheral->id.unique_id);
+
+	ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
+		tas_dev->rca_binaryname, tas_dev->dev, GFP_KERNEL,
+		tas_dev, tasdevice_rca_ready);
+	dev_dbg(tas_dev->dev,
+		"%s: request_firmware %x open status: 0x%08x\n",
+		__func__, tas_dev->sdw_peripheral->id.unique_id, ret);
+
+	/* Codec Lock Release*/
+	mutex_unlock(&tas_dev->codec_lock);
+
+	dev_dbg(tas_dev->dev, "%s was called end.\n",  __func__);
+	return ret;
+}
+
+static const struct snd_soc_component_driver
+	soc_codec_driver_tasdevice = {
+	.probe		= tasdevice_codec_probe,
+	.controls	= tas2783_snd_controls,
+	.num_controls	= ARRAY_SIZE(tas2783_snd_controls),
+	.dapm_widgets	= tasdevice_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(tasdevice_dapm_widgets),
+	.dapm_routes		= tasdevice_audio_map,
+	.num_dapm_routes	= ARRAY_SIZE(tasdevice_audio_map),
+	.idle_bias_on	= 1,
+	.endianness	= 1,
+};
+
+static int tasdevice_init(struct tasdevice_priv *tas_dev)
+{
+	int ret;
+
+	mutex_init(&tas_dev->dev_lock);
+
+	dev_set_drvdata(tas_dev->dev, tas_dev);
+
+	mutex_init(&tas_dev->codec_lock);
+	ret = devm_snd_soc_register_component(tas_dev->dev,
+		&soc_codec_driver_tasdevice,
+		tasdevice_dai_driver, ARRAY_SIZE(tasdevice_dai_driver));
+	if (ret) {
+		dev_err(tas_dev->dev, "%s: codec register error:0x%x\n",
+			__func__, ret);
+	}
+	dev_dbg(tas_dev->dev, "%s was called for TAS2783.\n",  __func__);
+
+	return ret;
+}
+
+static int tasdevice_read_prop(struct sdw_slave *slave)
+{
+	struct sdw_slave_prop *prop = &slave->prop;
+	struct sdw_dpn_prop *dpn;
+	unsigned long addr;
+	int nval, i, j;
+	u32 bit;
+
+	prop->scp_int1_mask =
+		SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
+	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
+
+	prop->paging_support = true;
+
+	/* first we need to allocate memory for set bits in port lists */
+	prop->source_ports = 0x04; /* BITMAP: 00000100 */
+	prop->sink_ports = 0x2; /* BITMAP:  00000010 */
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
+	prop->clk_stop_timeout = 20;
+
+	dev_dbg(&slave->dev, "%s was performed.\n", __func__);
+
+	return 0;
+}
+
+static int tasdevice_io_init(struct device *dev, struct sdw_slave *slave)
+{
+	struct tasdevice_priv *tasdevice = dev_get_drvdata(dev);
+
+	if (tasdevice->hw_init)
+		return 0;
+
+	/* PM runtime is only enabled when
+	 * a Slave reports as Attached
+	 * set autosuspend parameters
+	 */
+	pm_runtime_set_autosuspend_delay(&slave->dev, 3000);
+	pm_runtime_use_autosuspend(&slave->dev);
+
+	/* update count of parent 'active' children */
+	pm_runtime_set_active(&slave->dev);
+
+	/* make sure the device does not suspend immediately */
+	pm_runtime_mark_last_busy(&slave->dev);
+
+	pm_runtime_enable(&slave->dev);
+
+	pm_runtime_get_noresume(&slave->dev);
+
+	/* Mark Slave initialization complete */
+	tasdevice->hw_init = true;
+
+	pm_runtime_mark_last_busy(&slave->dev);
+	pm_runtime_put_autosuspend(&slave->dev);
+
+	dev_dbg(&slave->dev, "%s hw_init complete\n", __func__);
+	return 0;
+}
+
+static int tasdevice_update_status(struct sdw_slave *slave,
+	enum sdw_slave_status status)
+{
+	struct  tasdevice_priv *tasdevice = dev_get_drvdata(&slave->dev);
+
+	/* Update the status */
+	tasdevice->status = status;
+
+	if (status == SDW_SLAVE_UNATTACHED)
+		tasdevice->hw_init = false;
+
+	/* Perform initialization only if slave status
+	 * is present and hw_init flag is false
+	 */
+	if (tasdevice->hw_init || tasdevice->status != SDW_SLAVE_ATTACHED)
+		return 0;
+
+	/* perform I/O transfers required for Slave initialization */
+	return tasdevice_io_init(&slave->dev, slave);
+}
+
+/*
+ * slave_ops: callbacks for get_clock_stop_mode, clock_stop and
+ * port_prep are not defined for now
+ */
+static const struct sdw_slave_ops tasdevice_sdw_ops = {
+	.read_prop	= tasdevice_read_prop,
+	.update_status	= tasdevice_update_status,
+};
+
+static void tasdevice_remove(struct tasdevice_priv *tas_dev)
+{
+	snd_soc_unregister_component(tas_dev->dev);
+
+	mutex_destroy(&tas_dev->dev_lock);
+	mutex_destroy(&tas_dev->codec_lock);
+}
+
+static int tasdevice_sdw_probe(struct sdw_slave *peripheral,
+	const struct sdw_device_id *id)
+{
+	struct device *dev = &peripheral->dev;
+	struct tasdevice_priv *tas_dev;
+	int ret;
+
+	dev_dbg(dev, "%s was called.\n",  __func__);
+
+	tas_dev = devm_kzalloc(dev, sizeof(*tas_dev), GFP_KERNEL);
+	if (!tas_dev) {
+		ret = -ENOMEM;
+		goto out;
+	}
+	tas_dev->dev = &peripheral->dev;
+	tas_dev->chip_id = id->driver_data;
+	tas_dev->sdw_peripheral = peripheral;
+	tas_dev->hw_init = false;
+
+	dev_dbg(dev, "%d chip id %x for TAS2783.\n",
+	peripheral->id.unique_id, tas_dev->chip_id);
+
+	dev_set_drvdata(dev, tas_dev);
+
+	tas_dev->regmap = devm_regmap_init_sdw(peripheral,
+		&tasdevice_regmap);
+	if (IS_ERR(tas_dev->regmap)) {
+		ret = PTR_ERR(tas_dev->regmap);
+		dev_err(dev, "Failed devm_regmap_init: %d\n", ret);
+		goto out;
+	}
+	ret = tasdevice_init(tas_dev);
+
+out:
+	if (ret < 0 && tas_dev != NULL)
+		tasdevice_remove(tas_dev);
+
+	return ret;
+
+}
+
+static int tasdevice_sdw_remove(struct sdw_slave *peripheral)
+{
+	struct tasdevice_priv *tas_dev =
+		dev_get_drvdata(&peripheral->dev);
+
+	if (tas_dev)
+		tasdevice_remove(tas_dev);
+
+	return 0;
+}
+
+static const struct sdw_device_id tasdevice_sdw_id[] = {
+	SDW_SLAVE_ENTRY(0x0102, 0x0, 0),
+	{},
+};
+MODULE_DEVICE_TABLE(sdw, tasdevice_sdw_id);
+
+static struct sdw_driver tasdevice_sdw_driver = {
+	.driver = {
+		.name = "slave-tas2783",
+	},
+	.probe = tasdevice_sdw_probe,
+	.remove = tasdevice_sdw_remove,
+	.ops = &tasdevice_sdw_ops,
+	.id_table = tasdevice_sdw_id,
+};
+
+module_sdw_driver(tasdevice_sdw_driver);
+
+MODULE_AUTHOR("Baojun Xu <baojun.xu@ti.com>");
+MODULE_DESCRIPTION("ASoC TAS2783 SoundWire Driver");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/tas2783.h b/sound/soc/codecs/tas2783.h
new file mode 100644
index 000000000000..09575e741400
--- /dev/null
+++ b/sound/soc/codecs/tas2783.h
@@ -0,0 +1,113 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * ALSA SoC Texas Instruments TAS2783 Audio Smart Amplifier.
+ *
+ * Copyright (C) 2023 Texas Instruments Incorporated
+ * https://www.ti.com
+ *
+ * The TAS2783 driver implements a flexible and configurable
+ * algo coff setting for single TAS2783 chips.
+ *
+ * Author: Baojun Xu <baojun.xu@ti.com>
+ */
+
+#ifndef __TAS2783_H__
+#define __TAS2783_H__
+
+#define TAS2783_DEVICE_RATES		(SNDRV_PCM_RATE_44100 | \
+					SNDRV_PCM_RATE_48000 | \
+					SNDRV_PCM_RATE_96000 | \
+					SNDRV_PCM_RATE_88200)
+
+#define TAS2783_DEVICE_FORMATS		(SNDRV_PCM_FMTBIT_S16_LE | \
+					SNDRV_PCM_FMTBIT_S24_LE | \
+					SNDRV_PCM_FMTBIT_S32_LE)
+
+/* BOOK, PAGE Control Register */
+#define TASDEVICE_REG(book, page, reg)	((book * 256 * 256) + 0x8000 +\
+					(page * 128) + reg)
+
+/*Software Reset */
+#define TAS2873_REG_SWRESET		TASDEVICE_REG(0x0, 0X0, 0x01)
+#define TAS2873_REG_SWRESET_RESET	BIT(0)
+
+/* Volume control */
+#define TAS2783_DVC_LVL			TASDEVICE_REG(0x0, 0x00, 0x1A)
+#define TAS2783_AMP_LEVEL		TASDEVICE_REG(0x0, 0x00, 0x03)
+#define TAS2783_AMP_LEVEL_MASK		GENMASK(5, 1)
+
+/* Calibration data */
+#define TAS2783_CALIBRATION_RE		TASDEVICE_REG(0x0, 0x17, 0x74)
+#define TAS2783_CALIBRATION_RE_LOW	TASDEVICE_REG(0x0, 0x18, 0x14)
+#define TAS2783_CALIBRATION_INV_RE	TASDEVICE_REG(0x0, 0x18, 0x0c)
+#define TAS2783_CALIBRATION_POW		TASDEVICE_REG(0x0, 0x0d, 0x3c)
+#define TAS2783_CALIBRATION_TLIMIT	TASDEVICE_REG(0x0, 0x18, 0x7c)
+
+#define TAS2783_CALIBRATION_SIZE	5	// int data number.
+
+#define TAS2783_DEVICE_ID_START		0x08	// Unique id start
+#define TAS2783_DEVICE_ID_END		0x0F	// Unique id end
+
+/* TAS2783 SDCA Control - function number */
+#define FUNC_NUM_SMART_AMP		0x01
+
+/* TAS2783 SDCA entity */
+#define TAS2783_SDCA_ENT_PDE23		0x0C
+#define TAS2783_SDCA_ENT_PDE22		0x0B
+#define TAS2783_SDCA_ENT_FU21		0x01
+#define TAS2783_SDCA_ENT_UDMPU21	0x10
+
+/* TAS2783 SDCA control */
+#define TAS2783_SDCA_CTL_REQ_POWER_STATE	0x01
+#define TAS2783_SDCA_CTL_FU_MUTE		0x01
+#define TAS2783_SDCA_CTL_UDMPU_CLUSTER		0x10
+
+#define TAS2783_DEVICE_CHANNEL_LEFT	1
+#define TAS2783_DEVICE_CHANNEL_RIGHT	2
+
+#define TAS2783_MAX_NODES		100
+#define TAS2783_MAX_CALIDATA_SIZE	252
+#define TAS2783_CALIDATA_NAME		L"CALI_DATA"
+
+struct tas2783_firmware_node {
+	unsigned int vendor_id;
+	unsigned int file_id;
+	unsigned int version_id;
+	unsigned int length;
+	unsigned int download_addr;
+	unsigned char *start_addr;
+};
+
+struct calibration_data {
+	unsigned long total_sz;
+	unsigned char data[TAS2783_MAX_CALIDATA_SIZE];
+};
+
+struct tasdevice_priv {
+	struct tas2783_firmware_node firmware_node[TAS2783_MAX_NODES];
+	struct snd_soc_component *component;
+	struct calibration_data cali_data;
+	struct sdw_slave *sdw_peripheral;
+	struct sdw_bus_params params;
+	struct mutex codec_lock;
+	struct regmap *regmap;
+	struct mutex dev_lock;
+	struct device *dev;
+	struct tm tm;
+
+	enum sdw_slave_status status;
+
+	bool hw_init;
+
+	unsigned int chip_id;
+	unsigned char rca_binaryname[64];
+	unsigned char dev_name[32];
+
+	void *codec;
+};
+
+struct sdw_stream_data {
+	struct sdw_stream_runtime *sdw_stream;
+};
+
+#endif /*__TAS2783_H__ */
-- 
2.34.1

