Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5361584C482
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Feb 2024 06:54:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 584AC83B;
	Wed,  7 Feb 2024 06:54:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 584AC83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707285277;
	bh=b1NiaH4ac66wkMR5uTB2uK32ulhx9nBLbrt4EtSBOns=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BZK780ZOfoVeNdR8VGGYGCmESSEChCQGfj3yMjCTfKozKKYhfu/MUM3Fpf0VWm/Al
	 4K1lGpkrkG+VCpfVycQI7XGyNcdgKnsia4kVynhk1iw6UbmlEnGcKjlhbDSwUSGOP9
	 e/yEFaB2B9Jqr8QU8RVNd3rICLb5gUEVswkkuATU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8D51F80579; Wed,  7 Feb 2024 06:54:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BF12F8057D;
	Wed,  7 Feb 2024 06:54:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F643F801EB; Wed,  7 Feb 2024 06:48:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7BD6AF8016E
	for <alsa-devel@alsa-project.org>; Wed,  7 Feb 2024 06:48:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BD6AF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=XBLJXD5L
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4175lsgo071734;
	Tue, 6 Feb 2024 23:47:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707284874;
	bh=H3MdrWriwm3rZPeDrv4Dbd8xIc4Ug74YGB5fGXkeXrM=;
	h=From:To:CC:Subject:Date;
	b=XBLJXD5LnBL4AjA45HClyF5g5Z8eftFBfNMJ+78T0EBvI8oAdJgJVGrItGJJvT3fZ
	 ccn5RZx1gCXrNzK5eC5y5J6+KLLDyx5VfHCjDdFTRIANxcMtyL+L4HapgMfl46ar8R
	 JftCQbjgqaDpIDsfdSOjkvQ4CxqxN3UtcfcIF18Q=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4175lsAi025488
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Feb 2024 23:47:54 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Feb 2024 23:47:54 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Feb 2024 23:47:54 -0600
Received: from LT5CG31242FY.dhcp.ti.com (lt5cg31242fy.dhcp.ti.com
 [10.85.14.163])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4175llXX090882;
	Tue, 6 Feb 2024 23:47:48 -0600
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <pierre-louis.bossart@linux.intel.com>,
        <13916275206@139.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <liam.r.girdwood@intel.com>,
        <bard.liao@intel.com>, <mengdong.lin@intel.com>,
        <yung-chuan.liao@linux.intel.com>, <baojun.xu@ti.com>,
        <kevin-lu@ti.com>, <navada@ti.com>, <tiwai@suse.de>, <soyer@irl.hu>,
        Shenghao Ding
	<shenghao-ding@ti.com>
Subject: [PATCH v7] ASoc: tas2783: Add tas2783 codec driver
Date: Wed, 7 Feb 2024 13:47:42 +0800
Message-ID: <20240207054743.1504-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: PBJCZNWKPGWGQWMMSVZWFRHU2J2YDJY7
X-Message-ID-Hash: PBJCZNWKPGWGQWMMSVZWFRHU2J2YDJY7
X-MailFrom: shenghao-ding@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PBJCZNWKPGWGQWMMSVZWFRHU2J2YDJY7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The tas2783 is a smart audio amplifier with integrated MIPI SoundWire
interface (Version 1.2.1 compliant), I2C, and I2S/TDM interfaces designed
for portable applications. An on-chip DSP supports Texas Instruments
SmartAmp speaker protection algorithm. The integrated speaker voltage and
current sense provides for real-time monitoring of lodspeakers.

The ASoC component provides the majority of the functionality of the
device, all the audio functions.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
Change in v7:
 - simplify tasdevice_set_sdw_stream
 - fixed some Linux coding style
 - fixed the spelling mistakes
 - Select left/right channel based on unique id
 - a longer description has been added
 - remove unused crc8 in KCONFIG
 - Invert of RE here means reciprocal of RE
 - correct indentation
 - correct the wrong pow calibrated register
 - correct comment on RESET register
 - fixed usually lines don't end with an open parenthesis
 - fixed tasdevice_sdw_shutdown
 - use defines for function, entity, etc. for readable
 - remove unnecessary codec_lock in component_probe()
 - remove struct sdw_stream_data
 - remove unused macro definitions
 - use BIT(2) and BIT(1) instead of 0x2 and 0x1
 - implement pm_runtime
 - reg_start is u8, reg_start + i only adds i byte, it should be
   reg_start + i * 4, because the calibration values
 - fixed total_sz in tas2783_calibration
 - add a define for TASDEVICE_REG(0, 0, 0x0a)
 - rework macro style in header file
 - Add select CRC32
 - rewrite the mute and the return value handling
 - Add comments on bin file
 - Add link_id into the fw name to distinguish the same sdw id on different
   sdw id.
 - remove unnecessary mutex_lock
 - use set_active() in tasdevice_io_init and move all other parts in the
   probe.
 - move pm_runtime_get_noresume to the probe
 - fix the return value of putvol function
 - add put_noidle in tasdevice_sdw_remove
---
 sound/soc/codecs/Kconfig       |  14 +
 sound/soc/codecs/Makefile      |   2 +
 sound/soc/codecs/tas2783-sdw.c | 937 +++++++++++++++++++++++++++++++++
 sound/soc/codecs/tas2783.h     | 108 ++++
 4 files changed, 1061 insertions(+)
 create mode 100644 sound/soc/codecs/tas2783-sdw.c
 create mode 100644 sound/soc/codecs/tas2783.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 59f9742e9ff4..f7b35e614801 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -247,6 +247,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_TAS2781_COMLIB
 	imply SND_SOC_TAS2781_FMWLIB
 	imply SND_SOC_TAS2781_I2C
+	imply SND_SOC_TAS2783
 	imply SND_SOC_TAS5086
 	imply SND_SOC_TAS571X
 	imply SND_SOC_TAS5720
@@ -1847,6 +1848,19 @@ config SND_SOC_TAS2781_I2C
 	  algo coefficient setting, for one, two or even multiple TAS2781
 	  chips.
 
+config SND_SOC_TAS2783
+	tristate "Texas Instruments TAS2783 speaker amplifier (sdw)"
+	depends on SOUNDWIRE
+	depends on EFI
+	select REGMAP
+	select REGMAP_SOUNDWIRE
+	select CRC32_SARWATE
+	help
+	  Enable support for Texas Instruments TAS2783 Smart Amplifier
+	  Digital input mono Class-D and DSP-inside audio power amplifiers.
+	  TAS2783 supports the MIPI SoundWire v1.2 compatible interface
+	  for audio and control data.
+
 config SND_SOC_TAS5086
 	tristate "Texas Instruments TAS5086 speaker amplifier"
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index f53baa2b9565..6afceb126ae3 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -284,6 +284,7 @@ snd-soc-tas2770-objs := tas2770.o
 snd-soc-tas2781-comlib-objs := tas2781-comlib.o
 snd-soc-tas2781-fmwlib-objs := tas2781-fmwlib.o
 snd-soc-tas2781-i2c-objs := tas2781-i2c.o
+snd-soc-tas2783-objs := tas2783-sdw.o
 snd-soc-tfa9879-objs := tfa9879.o
 snd-soc-tfa989x-objs := tfa989x.o
 snd-soc-tlv320adc3xxx-objs := tlv320adc3xxx.o
@@ -664,6 +665,7 @@ obj-$(CONFIG_SND_SOC_TAS2780)	+= snd-soc-tas2780.o
 obj-$(CONFIG_SND_SOC_TAS2781_COMLIB)	+= snd-soc-tas2781-comlib.o
 obj-$(CONFIG_SND_SOC_TAS2781_FMWLIB)	+= snd-soc-tas2781-fmwlib.o
 obj-$(CONFIG_SND_SOC_TAS2781_I2C)	+= snd-soc-tas2781-i2c.o
+obj-$(CONFIG_SND_SOC_TAS2783)	+= snd-soc-tas2783.o
 obj-$(CONFIG_SND_SOC_TAS5086)	+= snd-soc-tas5086.o
 obj-$(CONFIG_SND_SOC_TAS571X)	+= snd-soc-tas571x.o
 obj-$(CONFIG_SND_SOC_TAS5720)	+= snd-soc-tas5720.o
diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
new file mode 100644
index 000000000000..69e1f5cbfa0f
--- /dev/null
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -0,0 +1,937 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// ALSA SoC Texas Instruments TAS2783 Audio Smart Amplifier
+//
+// Copyright (C) 2023 - 2024 Texas Instruments Incorporated
+// https://www.ti.com
+//
+// Author: Baojun Xu <baojun.xu@ti.com>
+//	Kevin Lu <kevin-lu@ti.com>
+//	Shenghao Ding <shenghao-ding@ti.com>
+//
+
+#include <linux/crc32.h>
+#include <linux/efi.h>
+#include <linux/err.h>
+#include <linux/firmware.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
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
+static const unsigned int tas2783_cali_reg[] = {
+	TAS2783_CALIBRATION_RE,		/* Resistance */
+	TAS2783_CALIBRATION_RE_LOW,	/* Low limitation of RE */
+	TAS2783_CALIBRATION_INV_RE,	/* Reciprocal of RE */
+	TAS2783_CALIBRATION_POW,	/* RMS Power */
+	TAS2783_CALIBRATION_TLIMIT	/* Temperature limitation */
+};
+
+static const struct reg_default tas2783_reg_defaults[] = {
+	/* Default values for ROM mode. Activated. */
+	{ 0x8002, 0x1a },	/* AMP inactive. */
+	{ 0x8097, 0xc8 },
+	{ 0x80b5, 0x74 },
+	{ 0x8099, 0x20 },
+	{ 0xfe8d, 0x0d },
+	{ 0xfebe, 0x4a },
+	{ 0x8230, 0x00 },
+	{ 0x8231, 0x00 },
+	{ 0x8232, 0x00 },
+	{ 0x8233, 0x01 },
+	{ 0x8418, 0x00 },	/* Set volume to 0 dB. */
+	{ 0x8419, 0x00 },
+	{ 0x841a, 0x00 },
+	{ 0x841b, 0x00 },
+	{ 0x8428, 0x40 },	/* Unmute channel */
+	{ 0x8429, 0x00 },
+	{ 0x842a, 0x00 },
+	{ 0x842b, 0x00 },
+	{ 0x8548, 0x00 },	/* Set volume to 0 dB. */
+	{ 0x8549, 0x00 },
+	{ 0x854a, 0x00 },
+	{ 0x854b, 0x00 },
+	{ 0x8558, 0x40 },	/* Unmute channel */
+	{ 0x8559, 0x00 },
+	{ 0x855a, 0x00 },
+	{ 0x855b, 0x00 },
+	{ 0x800a, 0x3a },	/* Enable both channel */
+	{ 0x800e, 0x44 },
+	{ 0x800f, 0x40 },
+	{ 0x805c, 0x99 },
+	{ SDW_SDCA_CTL(TAS2783_FUNC_TYPE_SMART_AMP, TAS2783_SDCA_ENT_FU21,
+		TAS2783_SDCA_CTL_FU_MUTE, 0), 0 },
+	{ SDW_SDCA_CTL(TAS2783_FUNC_TYPE_SMART_AMP, TAS2783_SDCA_ENT_FU21,
+		TAS2783_SDCA_CTL_FU_VOLUME, 0), 0 },
+	{ SDW_SDCA_CTL(TAS2783_FUNC_TYPE_SMART_AMP, TAS2783_SDCA_ENT_FU23,
+		TAS2783_SDCA_CTL_FU_MUTE, 0), 0 },
+};
+
+static bool tas2783_readable_register(struct device *dev,
+	unsigned int reg)
+{
+	switch (reg) {
+	case 0x8000 ... 0xc000:	/* Page 0 ~ 127. */
+	case 0xfe80 ... 0xfeff:	/* Page 253. */
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
+		/* Only reset register was volatiled.
+		 * Software reset. Bit is self clearing.
+		 * 0b = Don't reset
+		 * 1b = reset
+		 */
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
+	.max_register = 0x44ffffff,
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
+	struct snd_soc_component *component
+		= snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_dev =
+		snd_soc_component_get_drvdata(component);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct regmap *map = tas_dev->regmap;
+	int val = 0, ret;
+
+	if (!ucontrol) {
+		dev_err(tas_dev->dev, "%s, wrong parameter.\n", __func__);
+		return -EINVAL;
+	}
+	/* Read current volume from the device. */
+	ret = regmap_read(map, mc->reg, &val);
+	if (ret < 0) {
+		dev_err(tas_dev->dev, "%s, get digital vol error %x.\n",
+			__func__, ret);
+		return ret;
+	}
+	ucontrol->value.integer.value[0] =
+		tasdevice_clamp(val, mc->max, mc->invert);
+
+	return ret;
+}
+
+static int tas2783_digital_putvol(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component
+		= snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_dev =
+		snd_soc_component_get_drvdata(component);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct regmap *map = tas_dev->regmap;
+	int val, ret;
+
+	if (!ucontrol) {
+		dev_err(tas_dev->dev, "%s, wrong parameter.\n", __func__);
+		return 0;
+	}
+	val = tasdevice_clamp(ucontrol->value.integer.value[0],
+		mc->max, mc->invert);
+
+	ret = regmap_write(map, mc->reg, val);
+	if (ret < 0) {
+		dev_err(tas_dev->dev, "%s, Put vol %d into %x %x.\n",
+			__func__, val, mc->reg, ret);
+		return 0;
+	}
+
+	return 1;
+}
+
+static int tas2783_amp_getvol(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component
+		= snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_dev =
+		snd_soc_component_get_drvdata(component);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct regmap *map = tas_dev->regmap;
+	unsigned char mask = 0;
+	int ret, val = 0;
+
+	if (!ucontrol) {
+		dev_err(tas_dev->dev, "%s, wrong parameter.\n", __func__);
+		return -EINVAL;
+	}
+	/* Read current volume from the device. */
+	ret = regmap_read(map, mc->reg, &val);
+	if (ret < 0) {
+		dev_err(tas_dev->dev, "%s get AMP vol from %x with %d.\n",
+			__func__, mc->reg, ret);
+		return ret;
+	}
+
+	mask = (1 << fls(mc->max)) - 1;
+	mask <<= mc->shift;
+	val = (val & mask) >> mc->shift;
+	ucontrol->value.integer.value[0] = tasdevice_clamp(val, mc->max,
+		mc->invert);
+
+	return ret;
+}
+
+static int tas2783_amp_putvol(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component
+		= snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *tas_dev =
+		snd_soc_component_get_drvdata(component);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct regmap *map = tas_dev->regmap;
+	unsigned char mask;
+	int val, ret;
+
+	if (!ucontrol) {
+		dev_err(tas_dev->dev, "%s, wrong parameter.\n", __func__);
+		return 0;
+	}
+	mask = (1 << fls(mc->max)) - 1;
+	mask <<= mc->shift;
+	val = tasdevice_clamp(ucontrol->value.integer.value[0], mc->max,
+		mc->invert);
+	ret = regmap_update_bits(map, mc->reg, mask, val << mc->shift);
+	if (ret < 0) {
+		dev_err(tas_dev->dev, "Write @%#x..%#x:%d\n",
+			mc->reg, val, ret);
+		return 0;
+	}
+
+	return 1;
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
+static void tas2783_apply_calib(struct tasdevice_priv *tas_dev,
+	unsigned int *cali_data)
+{
+	struct regmap *map = tas_dev->regmap;
+	u8 *reg_start;
+	int ret;
+
+	if (!tas_dev->sdw_peripheral) {
+		dev_err(tas_dev->dev, "%s, slaver doesn't exist.\n",
+			__func__);
+		return;
+	}
+	if ((tas_dev->sdw_peripheral->id.unique_id < TAS2783_ID_MIN) ||
+		(tas_dev->sdw_peripheral->id.unique_id > TAS2783_ID_MAX)) {
+		dev_err(tas_dev->dev, "%s, error unique_id.\n",
+			__func__);
+		return;
+	}
+
+	reg_start = (u8 *)(cali_data + (tas_dev->sdw_peripheral->id.unique_id
+		- TAS2783_ID_MIN) * sizeof(tas2783_cali_reg));
+	for (int i = 0; i < ARRAY_SIZE(tas2783_cali_reg); i++) {
+		ret = regmap_bulk_write(map, tas2783_cali_reg[i],
+			&reg_start[4 * i], 4);
+		if (ret) {
+			dev_err(tas_dev->dev, "Cali failed %x:%d\n",
+				tas2783_cali_reg[i], ret);
+			break;
+		}
+	}
+}
+
+/* Load the calibration data, including speaker impedance, f0, etc.
+ * Calibration is done by the manufacturer in the factory. The calibration
+ * data are used by the algorithm  for calculating the speaker temperature,
+ * speaker membrane excursion and f0 in real time during playback.
+ * The DSP will work with default data values if calibrated data are
+ * missing or are invalid.
+ */
+static int tas2783_calibration(struct tasdevice_priv *tas_dev)
+{
+	efi_guid_t efi_guid = EFI_GUID(0x1f52d2a1, 0xbb3a, 0x457d, 0xbc,
+			0x09, 0x43, 0xa3, 0xf4, 0x31, 0x0a, 0x92);
+	static efi_char16_t efi_name[] = L"CALI_DATA";
+	struct tm *tm = &tas_dev->tm;
+	unsigned int attr = 0, crc;
+	unsigned int *tmp_val;
+	efi_status_t status;
+
+	tas_dev->cali_data.total_sz = 0;
+
+	status = efi.get_variable(efi_name, &efi_guid, &attr,
+		&tas_dev->cali_data.total_sz, tas_dev->cali_data.data);
+	if (status == EFI_BUFFER_TOO_SMALL) {
+		status = efi.get_variable(efi_name, &efi_guid, &attr,
+			&tas_dev->cali_data.total_sz,
+			tas_dev->cali_data.data);
+		dev_dbg(tas_dev->dev, "cali get %lx bytes result:%ld\n",
+			tas_dev->cali_data.total_sz, status);
+	}
+	if (status != 0) {
+		/* Failed got calibration data from EFI. */
+		dev_dbg(tas_dev->dev, "No calibration data in UEFI.");
+		return 0;
+	}
+
+	tmp_val = (unsigned int *)tas_dev->cali_data.data;
+
+	crc = crc32(~0, tas_dev->cali_data.data, 84) ^ ~0;
+
+	if (crc == tmp_val[21]) {
+		/* Date and time of calibration was done. */
+		time64_to_tm(tmp_val[20], 0, tm);
+		dev_dbg(tas_dev->dev, "%4ld-%2d-%2d, %2d:%2d:%2d\n",
+			tm->tm_year, tm->tm_mon, tm->tm_mday,
+			tm->tm_hour, tm->tm_min, tm->tm_sec);
+		tas2783_apply_calib(tas_dev, tmp_val);
+	} else {
+		dev_dbg(tas_dev->dev, "CRC 0x%08x not match 0x%08x\n",
+			crc, tmp_val[21]);
+		tas_dev->cali_data.total_sz = 0;
+	}
+
+	return 0;
+}
+
+static void tasdevice_rca_ready(const struct firmware *fmw,
+	void *context)
+{
+	struct tasdevice_priv *tas_dev =
+		(struct tasdevice_priv *) context;
+	struct tas2783_firmware_node *p;
+	struct regmap *map = tas_dev->regmap;
+	unsigned char *buf = NULL;
+	int offset = 0, img_sz;
+	int ret, value_sdw;
+
+	if (!fmw || !fmw->data) {
+		/* No firmware binary, devices will work in ROM mode. */
+		dev_err(tas_dev->dev,
+			"Failed to read %s, no side-effect on driver\n",
+			tas_dev->rca_binaryname);
+		ret = -EINVAL;
+		goto out;
+	}
+	buf = (unsigned char *)fmw->data;
+
+	img_sz = le32_to_cpup((__le32 *)&buf[offset]);
+	offset  += sizeof(img_sz);
+	if (img_sz != fmw->size) {
+		dev_err(tas_dev->dev, "Size not matching, %d %u",
+			(int)fmw->size, img_sz);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	while (offset < img_sz) {
+		p = (struct tas2783_firmware_node *)(buf + offset);
+		if (p->length > 1) {
+			ret = regmap_bulk_write(map, p->download_addr,
+			buf + offset + sizeof(unsigned int)*5, p->length);
+		} else
+			ret = regmap_write(map, p->download_addr,
+				*(buf + offset + sizeof(unsigned int) * 5));
+
+		if (ret != 0) {
+			dev_dbg(tas_dev->dev, "Load FW fail: %d.\n", ret);
+			goto out;
+		}
+		offset += sizeof(unsigned int)*5 + p->length;
+	}
+	/* Select left/right channel based on unique id. */
+	value_sdw = 0x1a;
+	value_sdw |= ((tas_dev->sdw_peripheral->dev_num & 1) << 4);
+	dev_dbg(tas_dev->dev, "%s dev_num = %u", __func__,
+		tas_dev->sdw_peripheral->dev_num);
+	regmap_write(map, TAS2783_REG_TDM_RX_CFG, value_sdw);
+
+	tas2783_calibration(tas_dev);
+
+out:
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
+static int tasdevice_set_sdw_stream(struct snd_soc_dai *dai,
+	void *sdw_stream, int direction)
+{
+	snd_soc_dai_dma_data_set(dai, direction, sdw_stream);
+
+	return 0;
+}
+
+static void tasdevice_sdw_shutdown(struct snd_pcm_substream *substream,
+	struct snd_soc_dai *dai)
+{
+	snd_soc_dai_set_dma_data(dai, substream, NULL);
+}
+
+static int tasdevice_sdw_hw_params(struct snd_pcm_substream *substream,
+	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tasdevice_priv *tas_priv =
+		snd_soc_component_get_drvdata(component);
+	struct sdw_stream_config stream_config = {0};
+	struct sdw_port_config port_config = {0};
+	struct sdw_stream_runtime *sdw_stream;
+	int ret;
+
+	dev_dbg(dai->dev, "%s %s", __func__, dai->name);
+	sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
+
+	if (!sdw_stream)
+		return -EINVAL;
+
+	if (!tas_priv->sdw_peripheral)
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
+	ret = sdw_stream_add_slave(tas_priv->sdw_peripheral,
+		&stream_config, &port_config, 1, sdw_stream);
+	if (ret) {
+		dev_err(dai->dev, "Unable to configure port\n");
+		return ret;
+	}
+
+	dev_dbg(dai->dev, "%s format: %i rate: %i\n", __func__,
+		params_format(params), params_rate(params));
+
+	return 0;
+}
+
+static int tasdevice_sdw_pcm_hw_free(struct snd_pcm_substream *substream,
+	struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tasdevice_priv *tas_priv =
+		snd_soc_component_get_drvdata(component);
+	struct sdw_stream_runtime *sdw_stream =
+		snd_soc_dai_get_dma_data(dai, substream);
+
+	if (!tas_priv->sdw_peripheral)
+		return -EINVAL;
+
+	sdw_stream_remove_slave(tas_priv->sdw_peripheral, sdw_stream);
+
+	return 0;
+}
+
+static int tasdevice_mute(struct snd_soc_dai *dai, int mute,
+	int direction)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tasdevice_priv *tas_dev =
+		snd_soc_component_get_drvdata(component);
+	struct regmap *map = tas_dev->regmap;
+	int ret;
+
+	dev_dbg(tas_dev->dev, "Mute or unmute %d.\n", mute);
+
+	if (mute) {
+		if (direction == SNDRV_PCM_STREAM_CAPTURE) {
+			ret = regmap_update_bits(map,
+				TAS2873_REG_PWR_CTRL,
+				TAS2783_REG_AEF_MASK,
+				TAS2783_REG_AEF_INACTIVE);
+			if (ret)
+				dev_err(tas_dev->dev, "Disable AEF failed.\n");
+		} else {
+			/* FU23 mute (0x40400108) */
+			ret = regmap_write(map,
+				SDW_SDCA_CTL(TAS2783_FUNC_TYPE_SMART_AMP,
+				TAS2783_SDCA_ENT_FU23,
+				TAS2783_SDCA_CTL_FU_MUTE, 0), 1);
+			if (ret) {
+				dev_err(tas_dev->dev, "FU23 mute failed.\n");
+				goto out;
+			}
+			/* Both playback and echo data will be shutdown in
+			 * playback stream.
+			 */
+			ret = regmap_update_bits(map, TAS2873_REG_PWR_CTRL,
+				TAS2783_REG_PWR_MODE_MASK |
+				TAS2783_REG_AEF_MASK,
+				TAS2783_REG_PWR_MODE_ACTIVE |
+				TAS2783_REG_PWR_MODE_SW_PWD);
+			if (ret) {
+				dev_err(tas_dev->dev,
+					"PWR&AEF shutdown failed.\n");
+				goto out;
+			}
+			tas_dev->pstream = false;
+		}
+	} else {
+		/* FU23 Unmute, 0x40400108. */
+		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+			ret = regmap_write(map,
+				SDW_SDCA_CTL(TAS2783_FUNC_TYPE_SMART_AMP,
+				TAS2783_SDCA_ENT_FU23,
+				TAS2783_SDCA_CTL_FU_MUTE, 0), 0);
+			if (ret) {
+				dev_err(tas_dev->dev, "FU23 Unmute failed.\n");
+				goto out;
+			}
+			ret = regmap_update_bits(map, TAS2873_REG_PWR_CTRL,
+				TAS2783_REG_PWR_MODE_MASK,
+				TAS2783_REG_PWR_MODE_ACTIVE);
+			if (ret) {
+				dev_err(tas_dev->dev, "PWR Unmute failed.\n");
+				goto out;
+			}
+			tas_dev->pstream = true;
+		} else {
+			/* Capture stream is the echo ref data for voice.
+			 * Without playback, it can't be active.
+			 */
+			if (tas_dev->pstream == true) {
+				ret = regmap_update_bits(map,
+					TAS2873_REG_PWR_CTRL,
+					TAS2783_REG_AEF_MASK,
+					TAS2783_REG_AEF_ACTIVE);
+				if (ret) {
+					dev_err(tas_dev->dev, "AEF failed.\n");
+					goto out;
+				}
+			} else {
+				dev_err(tas_dev->dev,
+					"No playback, no AEF!");
+				ret = -EINVAL;
+			}
+		}
+	}
+out:
+	if (ret)
+		dev_err(tas_dev->dev, "Mute or unmute %d failed %d.\n",
+			mute, ret);
+
+	return ret;
+}
+
+static const struct snd_soc_dai_ops tasdevice_dai_ops = {
+	.mute_stream	= tasdevice_mute,
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
+static int tasdevice_component_probe(struct snd_soc_component *component)
+{
+	struct tasdevice_priv *tas_dev =
+		snd_soc_component_get_drvdata(component);
+
+	tas_dev->component = component;
+
+	dev_dbg(tas_dev->dev, "%s was called.\n", __func__);
+
+	return 0;
+}
+
+static const struct snd_soc_component_driver
+	soc_codec_driver_tasdevice = {
+	.probe		= tasdevice_component_probe,
+	.controls	= tas2783_snd_controls,
+	.num_controls	= ARRAY_SIZE(tas2783_snd_controls),
+	.dapm_widgets	= tasdevice_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(tasdevice_dapm_widgets),
+	.dapm_routes	= tasdevice_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(tasdevice_audio_map),
+	.idle_bias_on	= 1,
+	.endianness	= 1,
+};
+
+static int tasdevice_init(struct tasdevice_priv *tas_dev)
+{
+	int ret;
+
+	dev_set_drvdata(tas_dev->dev, tas_dev);
+
+	ret = devm_snd_soc_register_component(tas_dev->dev,
+		&soc_codec_driver_tasdevice,
+		tasdevice_dai_driver, ARRAY_SIZE(tasdevice_dai_driver));
+	if (ret) {
+		dev_err(tas_dev->dev, "%s: codec register error:%d.\n",
+			__func__, ret);
+		goto out;
+	}
+
+	/* tas2783-link_id[0,1,...,N]-unique_id[8,9,...,f].bin stores the dsp
+	 * firmware including speaker protection algorithm, audio acoustic
+	 * algorithm, speaker characters and algorithm params, it must be
+	 * copied into firmware folder. Each tas2783 has its own bin file.
+	 */
+	scnprintf(tas_dev->rca_binaryname, 64, "tas2783-%d-%x.bin",
+		tas_dev->sdw_peripheral->bus->link_id,
+		tas_dev->sdw_peripheral->id.unique_id);
+
+	ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
+		tas_dev->rca_binaryname, tas_dev->dev, GFP_KERNEL,
+		tas_dev, tasdevice_rca_ready);
+	if (ret) {
+		dev_err(tas_dev->dev,
+			"%s: request_firmware %x open status: %d.\n",
+			__func__, tas_dev->sdw_peripheral->id.unique_id, ret);
+		goto out;
+	}
+
+	/* set autosuspend parameters */
+	pm_runtime_set_autosuspend_delay(tas_dev->dev, 3000);
+	pm_runtime_use_autosuspend(tas_dev->dev);
+
+	/* make sure the device does not suspend immediately */
+	pm_runtime_mark_last_busy(tas_dev->dev);
+	pm_runtime_get_noresume(tas_dev->dev);
+	pm_runtime_enable(tas_dev->dev);
+
+out:
+	return ret;
+}
+
+static int tasdevice_read_prop(struct sdw_slave *slave)
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
+	prop->source_ports = BIT(2); /* BITMAP: 00000100 */
+	prop->sink_ports = BIT(1); /* BITMAP:  00000010 */
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
+	return 0;
+}
+
+static int tasdevice_io_init(struct device *dev, struct sdw_slave *slave)
+{
+	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
+	int ret;
+
+	regcache_cache_only(tas_priv->regmap, false);
+
+	if (tas_priv->first_hw_init)
+		regcache_cache_bypass(tas_priv->regmap, true);
+	else
+		/*
+		 * PM runtime is only enabled when a Slave reports as Attached
+		 */
+
+		/* update count of parent 'active' children */
+		pm_runtime_set_active(&slave->dev);
+
+	/* sw reset */
+	ret = regmap_write(tas_priv->regmap, TAS2873_REG_SWRESET,
+		TAS2873_REG_SWRESET_RESET);
+	if (ret) {
+		dev_err(tas_priv->dev, "Reset failed.\n");
+		goto out;
+	}
+
+	if (tas_priv->first_hw_init) {
+		regcache_cache_bypass(tas_priv->regmap, false);
+		regcache_mark_dirty(tas_priv->regmap);
+	}
+
+	tas_priv->first_hw_init = true;
+	tas_priv->hw_init = true;
+
+out:
+	return ret;
+}
+
+static int tasdevice_update_status(struct sdw_slave *slave,
+	enum sdw_slave_status status)
+{
+	struct  tasdevice_priv *tas_priv = dev_get_drvdata(&slave->dev);
+
+	/* Update the status */
+	tas_priv->status = status;
+
+	if (status == SDW_SLAVE_UNATTACHED)
+		tas_priv->hw_init = false;
+
+	/* Perform initialization only if slave status
+	 * is present and hw_init flag is false
+	 */
+	if (tas_priv->hw_init || tas_priv->status != SDW_SLAVE_ATTACHED)
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
+static int tasdevice_sdw_probe(struct sdw_slave *peripheral,
+	const struct sdw_device_id *id)
+{
+	struct device *dev = &peripheral->dev;
+	struct tasdevice_priv *tas_dev;
+	int ret;
+
+	tas_dev = devm_kzalloc(dev, sizeof(*tas_dev), GFP_KERNEL);
+	if (!tas_dev)
+		return -ENOMEM;
+
+	tas_dev->dev = dev;
+	tas_dev->chip_id = id->driver_data;
+	tas_dev->sdw_peripheral = peripheral;
+	/*
+	 * Mark hw_init to false
+	 * HW init will be performed when device reports present
+	 */
+	tas_dev->hw_init = false;
+	tas_dev->first_hw_init = false;
+
+	dev_set_drvdata(dev, tas_dev);
+
+	tas_dev->regmap = devm_regmap_init_sdw(peripheral,
+		&tasdevice_regmap);
+	if (IS_ERR(tas_dev->regmap)) {
+		ret = PTR_ERR(tas_dev->regmap);
+		dev_err(dev, "Failed %d of devm_regmap_init_sdw.", ret);
+	} else
+		ret = tasdevice_init(tas_dev);
+
+	return ret;
+}
+
+static int tasdevice_sdw_remove(struct sdw_slave *peripheral)
+{
+	struct tasdevice_priv *tas_dev = dev_get_drvdata(&peripheral->dev);
+
+	if (tas_dev->first_hw_init)
+		pm_runtime_disable(tas_dev->dev);
+
+	pm_runtime_put_noidle(tas_dev->dev);
+	return 0;
+}
+
+static const struct sdw_device_id tasdevice_sdw_id[] = {
+	SDW_SLAVE_ENTRY(0x0102, 0x0000, 0),
+	{},
+};
+
+MODULE_DEVICE_TABLE(sdw, tasdevice_sdw_id);
+
+static int __maybe_unused tas2783_sdca_dev_suspend(struct device *dev)
+{
+	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
+
+	if (!tas_priv->hw_init)
+		return 0;
+
+	regcache_cache_only(tas_priv->regmap, true);
+
+	return 0;
+}
+
+#define TAS2783_PROBE_TIMEOUT 5000
+
+static int __maybe_unused tas2783_sdca_dev_resume(struct device *dev)
+{
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
+	unsigned long time;
+
+	if (!tas_priv->first_hw_init)
+		return 0;
+
+	if (!slave->unattach_request)
+		goto regmap_sync;
+
+	time = wait_for_completion_timeout(&slave->initialization_complete,
+		msecs_to_jiffies(TAS2783_PROBE_TIMEOUT));
+	if (!time) {
+		dev_err(&slave->dev, "Init not complete, timed out\n");
+		sdw_show_ping_status(slave->bus, true);
+
+		return -ETIMEDOUT;
+	}
+
+regmap_sync:
+	slave->unattach_request = 0;
+	regcache_cache_only(tas_priv->regmap, false);
+	regcache_sync(tas_priv->regmap);
+
+	return 0;
+}
+
+static const struct dev_pm_ops tas2783_sdca_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(tas2783_sdca_dev_suspend,
+		tas2783_sdca_dev_resume)
+	SET_RUNTIME_PM_OPS(tas2783_sdca_dev_suspend,
+		tas2783_sdca_dev_resume, NULL)
+};
+
+static struct sdw_driver tasdevice_sdw_driver = {
+	.driver = {
+		.name = "slave-tas2783",
+		.pm = &tas2783_sdca_pm,
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
+MODULE_AUTHOR("Shenghao Ding <shenghao-ding@ti.com>");
+MODULE_DESCRIPTION("ASoC TAS2783 SoundWire Driver");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/tas2783.h b/sound/soc/codecs/tas2783.h
new file mode 100644
index 000000000000..55b0cb09d65a
--- /dev/null
+++ b/sound/soc/codecs/tas2783.h
@@ -0,0 +1,108 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * ALSA SoC Texas Instruments TAS2783 Audio Smart Amplifier
+ *
+ * Copyright (C) 2023 - 2024 Texas Instruments Incorporated
+ * https://www.ti.com
+ *
+ * Author: Baojun Xu <baojun.xu@ti.com>
+ *	Shenghao Ding <shenghao-ding@ti.com>
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
+#define TASDEVICE_REG(book, page, reg)	((book * 256 * 256) + 0x8000 + \
+					(page * 128) + reg)
+
+/*Software Reset */
+#define TAS2873_REG_SWRESET		TASDEVICE_REG(0x0, 0x00, 0x01)
+#define TAS2873_REG_SWRESET_MASK	BIT(0)
+#define TAS2873_REG_SWRESET_RESET	BIT(0)
+
+#define TAS2873_REG_PWR_CTRL		TASDEVICE_REG(0x0, 0x00, 0x02)
+#define TAS2783_REG_AEF_MASK		GENMASK(4, 3)
+#define TAS2783_REG_AEF_ACTIVE		0
+#define TAS2783_REG_AEF_INACTIVE	GENMASK(4, 3)
+#define TAS2783_REG_PWR_MODE_MASK	GENMASK(2, 0)
+#define TAS2783_REG_PWR_MODE_ACTIVE	0
+#define TAS2783_REG_PWR_MODE_SW_PWD	BIT(1)
+
+#define TAS2783_REG_TDM_RX_CFG		TASDEVICE_REG(0x0, 0x00, 0x0a)
+
+/* Volume control */
+#define TAS2783_DVC_LVL			TASDEVICE_REG(0x0, 0x00, 0x1a)
+#define TAS2783_AMP_LEVEL		TASDEVICE_REG(0x0, 0x00, 0x03)
+#define TAS2783_AMP_LEVEL_MASK		GENMASK(5, 1)
+
+/* Calibration data */
+#define TAS2783_CALIBRATION_RE		TASDEVICE_REG(0x0, 0x17, 0x74)
+#define TAS2783_CALIBRATION_RE_LOW	TASDEVICE_REG(0x0, 0x18, 0x14)
+#define TAS2783_CALIBRATION_INV_RE	TASDEVICE_REG(0x0, 0x18, 0x0c)
+#define TAS2783_CALIBRATION_POW		TASDEVICE_REG(0x0, 0x13, 0x70)
+#define TAS2783_CALIBRATION_TLIMIT	TASDEVICE_REG(0x0, 0x18, 0x7c)
+
+/* Unique id start */
+#define TAS2783_ID_MIN			0x08
+/* Unique id end */
+#define TAS2783_ID_MAX			0x0f
+
+/* TAS2783 SDCA Control - function number */
+#define TAS2783_FUNC_TYPE_SMART_AMP	0x01
+
+/* TAS2783 SDCA entity */
+#define TAS2783_SDCA_ENT_FU21		0x01
+#define TAS2783_SDCA_ENT_FU23		0x02
+
+/* TAS2783 SDCA control */
+#define TAS2783_SDCA_CTL_REQ_POWER_STATE	0x01
+#define TAS2783_SDCA_CTL_FU_MUTE	0x01
+#define TAS2783_SDCA_CTL_FU_VOLUME	0x02
+#define TAS2783_SDCA_CTL_UDMPU_CLUSTER	0x10
+
+#define TAS2783_DEVICE_CHANNEL_LEFT	1
+#define TAS2783_DEVICE_CHANNEL_RIGHT	2
+
+#define TAS2783_MAX_CALIDATA_SIZE	252
+
+struct tas2783_firmware_node {
+	unsigned int vendor_id;
+	unsigned int file_id;
+	unsigned int version_id;
+	unsigned int length;
+	unsigned int download_addr;
+};
+
+struct calibration_data {
+	unsigned long total_sz;
+	unsigned char data[TAS2783_MAX_CALIDATA_SIZE];
+};
+
+struct tasdevice_priv {
+	struct snd_soc_component *component;
+	struct calibration_data cali_data;
+	struct sdw_slave *sdw_peripheral;
+	enum sdw_slave_status status;
+	struct sdw_bus_params params;
+	struct regmap *regmap;
+	struct device *dev;
+	struct tm tm;
+	unsigned char rca_binaryname[64];
+	unsigned char dev_name[32];
+	unsigned int chip_id;
+	bool pstream;
+	bool hw_init;
+	bool first_hw_init;
+};
+
+#endif /*__TAS2783_H__ */
-- 
2.34.1

