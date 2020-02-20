Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6350166A44
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 23:20:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE2ED16B5;
	Thu, 20 Feb 2020 23:19:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE2ED16B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582237224;
	bh=ZxnLrIH3Oak4Dv+6GvzN2y85P2Do9qU5pK2hUo1oJr0=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=HbFW42Iz2l9SqbWc9Uh8zstkmrTbOmzVQa7WnX9t+M5YwaosENJR6+wZqvV6zDUig
	 qB+Srhwm6aiN5i5hhBdGwiXqmCtsAwmt0v82Xh++H3P1A83Y5F8Kx+e1VLgWO32zqQ
	 9IYLtP5k0Vy1mepw/HzfkoNj045wHmwVNX15ghX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E898F80114;
	Thu, 20 Feb 2020 23:18:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45680F80148; Thu, 20 Feb 2020 23:18:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id F2AD5F80101
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 23:18:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2AD5F80101
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07E4230E;
 Thu, 20 Feb 2020 14:18:32 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F9E53F6CF;
 Thu, 20 Feb 2020 14:18:30 -0800 (PST)
Date: Thu, 20 Feb 2020 22:18:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Applied "ASoC: tlv320adcx140: Add the tlv320adcx140 codec driver
 family" to the asoc tree
In-Reply-To: <20200220210759.31466-3-dmurphy@ti.com>
Message-Id: <applied-20200220210759.31466-3-dmurphy@ti.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, Mark Brown <broonie@kernel.org>
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

The patch

   ASoC: tlv320adcx140: Add the tlv320adcx140 codec driver family

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 689c7655b50c5de2b6f0f42fecfb37bde5acf040 Mon Sep 17 00:00:00 2001
From: Dan Murphy <dmurphy@ti.com>
Date: Thu, 20 Feb 2020 15:07:59 -0600
Subject: [PATCH] ASoC: tlv320adcx140: Add the tlv320adcx140 codec driver
 family
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the tlv320adcx140 codec driver family.

The TLV320ADCx140 is a Burr-Brown™ highperformance, audio analog-to-digital
converter (ADC) that supports simultaneous sampling of up to four analog
channels or eight digital channels for the pulse density modulation (PDM)
microphone input. The device supports line and microphone inputs, and
allows for both single-ended and differential input configurations.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
Link: https://lore.kernel.org/r/20200220210759.31466-3-dmurphy@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/Kconfig         |   9 +
 sound/soc/codecs/Makefile        |   2 +
 sound/soc/codecs/tlv320adcx140.c | 849 +++++++++++++++++++++++++++++++
 sound/soc/codecs/tlv320adcx140.h | 130 +++++
 4 files changed, 990 insertions(+)
 create mode 100644 sound/soc/codecs/tlv320adcx140.c
 create mode 100644 sound/soc/codecs/tlv320adcx140.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index d957fd6980b1..9e9d54e4576c 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -196,6 +196,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_TAS6424
 	imply SND_SOC_TDA7419
 	imply SND_SOC_TFA9879
+	imply SND_SOC_TLV320ADCX140
 	imply SND_SOC_TLV320AIC23_I2C
 	imply SND_SOC_TLV320AIC23_SPI
 	imply SND_SOC_TLV320AIC26
@@ -1334,6 +1335,14 @@ config SND_SOC_TLV320DAC33
 	tristate
 	depends on I2C
 
+config SND_SOC_TLV320ADCX140
+	tristate "Texas Instruments TLV320ADCX140 CODEC family"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  Add support for Texas Instruments tlv320adc3140, tlv320adc5140 and
+	  tlv320adc6140 quad channel ADCs.
+
 config SND_SOC_TS3A227E
 	tristate "TI Headset/Mic detect and keypress chip"
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index ba1b4b3fa2da..943ebc93fbc1 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -218,6 +218,7 @@ snd-soc-tlv320aic32x4-i2c-objs := tlv320aic32x4-i2c.o
 snd-soc-tlv320aic32x4-spi-objs := tlv320aic32x4-spi.o
 snd-soc-tlv320aic3x-objs := tlv320aic3x.o
 snd-soc-tlv320dac33-objs := tlv320dac33.o
+snd-soc-tlv320adcx140-objs := tlv320adcx140.o
 snd-soc-tscs42xx-objs := tscs42xx.o
 snd-soc-tscs454-objs := tscs454.o
 snd-soc-ts3a227e-objs := ts3a227e.o
@@ -516,6 +517,7 @@ obj-$(CONFIG_SND_SOC_TLV320AIC32X4_I2C)	+= snd-soc-tlv320aic32x4-i2c.o
 obj-$(CONFIG_SND_SOC_TLV320AIC32X4_SPI)	+= snd-soc-tlv320aic32x4-spi.o
 obj-$(CONFIG_SND_SOC_TLV320AIC3X)	+= snd-soc-tlv320aic3x.o
 obj-$(CONFIG_SND_SOC_TLV320DAC33)	+= snd-soc-tlv320dac33.o
+obj-$(CONFIG_SND_SOC_TLV320ADCX140)	+= snd-soc-tlv320adcx140.o
 obj-$(CONFIG_SND_SOC_TSCS42XX)	+= snd-soc-tscs42xx.o
 obj-$(CONFIG_SND_SOC_TSCS454)	+= snd-soc-tscs454.o
 obj-$(CONFIG_SND_SOC_TS3A227E)	+= snd-soc-ts3a227e.o
diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
new file mode 100644
index 000000000000..8182c584de9c
--- /dev/null
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -0,0 +1,849 @@
+// SPDX-License-Identifier: GPL-2.0
+// TLV320ADCX140 Sound driver
+// Copyright (C) 2020 Texas Instruments Incorporated - http://www.ti.com/
+
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/init.h>
+#include <linux/delay.h>
+#include <linux/pm.h>
+#include <linux/i2c.h>
+#include <linux/gpio/consumer.h>
+#include <linux/regulator/consumer.h>
+#include <linux/acpi.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
+#include <linux/slab.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/initval.h>
+#include <sound/tlv.h>
+
+#include "tlv320adcx140.h"
+
+struct adcx140_priv {
+	struct snd_soc_component *component;
+	struct regulator *supply_areg;
+	struct gpio_desc *gpio_reset;
+	struct regmap *regmap;
+	struct device *dev;
+
+	int micbias_vg;
+
+	unsigned int dai_fmt;
+	unsigned int tdm_delay;
+	unsigned int slot_width;
+};
+
+static const struct reg_default adcx140_reg_defaults[] = {
+	{ ADCX140_PAGE_SELECT, 0x00 },
+	{ ADCX140_SW_RESET, 0x00 },
+	{ ADCX140_SLEEP_CFG, 0x00 },
+	{ ADCX140_SHDN_CFG, 0x05 },
+	{ ADCX140_ASI_CFG0, 0x30 },
+	{ ADCX140_ASI_CFG1, 0x00 },
+	{ ADCX140_ASI_CFG2, 0x00 },
+	{ ADCX140_ASI_CH1, 0x00 },
+	{ ADCX140_ASI_CH2, 0x01 },
+	{ ADCX140_ASI_CH3, 0x02 },
+	{ ADCX140_ASI_CH4, 0x03 },
+	{ ADCX140_ASI_CH5, 0x04 },
+	{ ADCX140_ASI_CH6, 0x05 },
+	{ ADCX140_ASI_CH7, 0x06 },
+	{ ADCX140_ASI_CH8, 0x07 },
+	{ ADCX140_MST_CFG0, 0x02 },
+	{ ADCX140_MST_CFG1, 0x48 },
+	{ ADCX140_ASI_STS, 0xff },
+	{ ADCX140_CLK_SRC, 0x10 },
+	{ ADCX140_PDMCLK_CFG, 0x40 },
+	{ ADCX140_PDM_CFG, 0x00 },
+	{ ADCX140_GPIO_CFG0, 0x22 },
+	{ ADCX140_GPO_CFG1, 0x00 },
+	{ ADCX140_GPO_CFG2, 0x00 },
+	{ ADCX140_GPO_CFG3, 0x00 },
+	{ ADCX140_GPO_CFG4, 0x00 },
+	{ ADCX140_GPO_VAL, 0x00 },
+	{ ADCX140_GPIO_MON, 0x00 },
+	{ ADCX140_GPI_CFG0, 0x00 },
+	{ ADCX140_GPI_CFG1, 0x00 },
+	{ ADCX140_GPI_MON, 0x00 },
+	{ ADCX140_INT_CFG, 0x00 },
+	{ ADCX140_INT_MASK0, 0xff },
+	{ ADCX140_INT_LTCH0, 0x00 },
+	{ ADCX140_BIAS_CFG, 0x00 },
+	{ ADCX140_CH1_CFG0, 0x00 },
+	{ ADCX140_CH1_CFG1, 0x00 },
+	{ ADCX140_CH1_CFG2, 0xc9 },
+	{ ADCX140_CH1_CFG3, 0x80 },
+	{ ADCX140_CH1_CFG4, 0x00 },
+	{ ADCX140_CH2_CFG0, 0x00 },
+	{ ADCX140_CH2_CFG1, 0x00 },
+	{ ADCX140_CH2_CFG2, 0xc9 },
+	{ ADCX140_CH2_CFG3, 0x80 },
+	{ ADCX140_CH2_CFG4, 0x00 },
+	{ ADCX140_CH3_CFG0, 0x00 },
+	{ ADCX140_CH3_CFG1, 0x00 },
+	{ ADCX140_CH3_CFG2, 0xc9 },
+	{ ADCX140_CH3_CFG3, 0x80 },
+	{ ADCX140_CH3_CFG4, 0x00 },
+	{ ADCX140_CH4_CFG0, 0x00 },
+	{ ADCX140_CH4_CFG1, 0x00 },
+	{ ADCX140_CH4_CFG2, 0xc9 },
+	{ ADCX140_CH4_CFG3, 0x80 },
+	{ ADCX140_CH4_CFG4, 0x00 },
+	{ ADCX140_CH5_CFG2, 0xc9 },
+	{ ADCX140_CH5_CFG3, 0x80 },
+	{ ADCX140_CH5_CFG4, 0x00 },
+	{ ADCX140_CH6_CFG2, 0xc9 },
+	{ ADCX140_CH6_CFG3, 0x80 },
+	{ ADCX140_CH6_CFG4, 0x00 },
+	{ ADCX140_CH7_CFG2, 0xc9 },
+	{ ADCX140_CH7_CFG3, 0x80 },
+	{ ADCX140_CH7_CFG4, 0x00 },
+	{ ADCX140_CH8_CFG2, 0xc9 },
+	{ ADCX140_CH8_CFG3, 0x80 },
+	{ ADCX140_CH8_CFG4, 0x00 },
+	{ ADCX140_DSP_CFG0, 0x01 },
+	{ ADCX140_DSP_CFG1, 0x40 },
+	{ ADCX140_DRE_CFG0, 0x7b },
+	{ ADCX140_IN_CH_EN, 0xf0 },
+	{ ADCX140_ASI_OUT_CH_EN, 0x00 },
+	{ ADCX140_PWR_CFG, 0x00 },
+	{ ADCX140_DEV_STS0, 0x00 },
+	{ ADCX140_DEV_STS1, 0x80 },
+};
+
+static const struct regmap_range_cfg adcx140_ranges[] = {
+	{
+		.range_min = 0,
+		.range_max = 12 * 128,
+		.selector_reg = ADCX140_PAGE_SELECT,
+		.selector_mask = 0xff,
+		.selector_shift = 0,
+		.window_start = 0,
+		.window_len = 128,
+	},
+};
+
+static bool adcx140_volatile(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case ADCX140_SW_RESET:
+	case ADCX140_DEV_STS0:
+	case ADCX140_DEV_STS1:
+	case ADCX140_ASI_STS:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config adcx140_i2c_regmap = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.reg_defaults = adcx140_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(adcx140_reg_defaults),
+	.cache_type = REGCACHE_FLAT,
+	.ranges = adcx140_ranges,
+	.num_ranges = ARRAY_SIZE(adcx140_ranges),
+	.max_register = 12 * 128,
+	.volatile_reg = adcx140_volatile,
+};
+
+/* Digital Volume control. From -100 to 27 dB in 0.5 dB steps */
+static DECLARE_TLV_DB_SCALE(dig_vol_tlv, -10000, 50, 0);
+
+/* ADC gain. From 0 to 42 dB in 1 dB steps */
+static DECLARE_TLV_DB_SCALE(adc_tlv, 0, 100, 0);
+
+static const char * const resistor_text[] = {
+	"2.5 kOhm", "10 kOhm", "20 kOhm"
+};
+
+static SOC_ENUM_SINGLE_DECL(in1_resistor_enum, ADCX140_CH1_CFG0, 2,
+			    resistor_text);
+static SOC_ENUM_SINGLE_DECL(in2_resistor_enum, ADCX140_CH2_CFG0, 2,
+			    resistor_text);
+static SOC_ENUM_SINGLE_DECL(in3_resistor_enum, ADCX140_CH3_CFG0, 2,
+			    resistor_text);
+static SOC_ENUM_SINGLE_DECL(in4_resistor_enum, ADCX140_CH4_CFG0, 2,
+			    resistor_text);
+
+static const struct snd_kcontrol_new in1_resistor_controls[] = {
+	SOC_DAPM_ENUM("CH1 Resistor Select", in1_resistor_enum),
+};
+static const struct snd_kcontrol_new in2_resistor_controls[] = {
+	SOC_DAPM_ENUM("CH2 Resistor Select", in2_resistor_enum),
+};
+static const struct snd_kcontrol_new in3_resistor_controls[] = {
+	SOC_DAPM_ENUM("CH3 Resistor Select", in3_resistor_enum),
+};
+static const struct snd_kcontrol_new in4_resistor_controls[] = {
+	SOC_DAPM_ENUM("CH4 Resistor Select", in4_resistor_enum),
+};
+
+/* Analog/Digital Selection */
+static const char *adcx140_mic_sel_text[] = {"Analog", "Line In", "Digital"};
+static const char *adcx140_analog_sel_text[] = {"Analog", "Line In"};
+
+static SOC_ENUM_SINGLE_DECL(adcx140_mic1p_enum,
+			    ADCX140_CH1_CFG0, 5,
+			    adcx140_mic_sel_text);
+
+static const struct snd_kcontrol_new adcx140_dapm_mic1p_control =
+SOC_DAPM_ENUM("MIC1P MUX", adcx140_mic1p_enum);
+
+static SOC_ENUM_SINGLE_DECL(adcx140_mic1_analog_enum,
+			    ADCX140_CH1_CFG0, 7,
+			    adcx140_analog_sel_text);
+
+static const struct snd_kcontrol_new adcx140_dapm_mic1_analog_control =
+SOC_DAPM_ENUM("MIC1 Analog MUX", adcx140_mic1_analog_enum);
+
+static SOC_ENUM_SINGLE_DECL(adcx140_mic1m_enum,
+			    ADCX140_CH1_CFG0, 5,
+			    adcx140_mic_sel_text);
+
+static const struct snd_kcontrol_new adcx140_dapm_mic1m_control =
+SOC_DAPM_ENUM("MIC1M MUX", adcx140_mic1m_enum);
+
+static SOC_ENUM_SINGLE_DECL(adcx140_mic2p_enum,
+			    ADCX140_CH2_CFG0, 5,
+			    adcx140_mic_sel_text);
+
+static const struct snd_kcontrol_new adcx140_dapm_mic2p_control =
+SOC_DAPM_ENUM("MIC2P MUX", adcx140_mic2p_enum);
+
+static SOC_ENUM_SINGLE_DECL(adcx140_mic2_analog_enum,
+			    ADCX140_CH2_CFG0, 7,
+			    adcx140_analog_sel_text);
+
+static const struct snd_kcontrol_new adcx140_dapm_mic2_analog_control =
+SOC_DAPM_ENUM("MIC2 Analog MUX", adcx140_mic2_analog_enum);
+
+static SOC_ENUM_SINGLE_DECL(adcx140_mic2m_enum,
+			    ADCX140_CH2_CFG0, 5,
+			    adcx140_mic_sel_text);
+
+static const struct snd_kcontrol_new adcx140_dapm_mic2m_control =
+SOC_DAPM_ENUM("MIC2M MUX", adcx140_mic2m_enum);
+
+static SOC_ENUM_SINGLE_DECL(adcx140_mic3p_enum,
+			    ADCX140_CH3_CFG0, 5,
+			    adcx140_mic_sel_text);
+
+static const struct snd_kcontrol_new adcx140_dapm_mic3p_control =
+SOC_DAPM_ENUM("MIC3P MUX", adcx140_mic3p_enum);
+
+static SOC_ENUM_SINGLE_DECL(adcx140_mic3_analog_enum,
+			    ADCX140_CH3_CFG0, 7,
+			    adcx140_analog_sel_text);
+
+static const struct snd_kcontrol_new adcx140_dapm_mic3_analog_control =
+SOC_DAPM_ENUM("MIC3 Analog MUX", adcx140_mic3_analog_enum);
+
+static SOC_ENUM_SINGLE_DECL(adcx140_mic3m_enum,
+			    ADCX140_CH3_CFG0, 5,
+			    adcx140_mic_sel_text);
+
+static const struct snd_kcontrol_new adcx140_dapm_mic3m_control =
+SOC_DAPM_ENUM("MIC3M MUX", adcx140_mic3m_enum);
+
+static SOC_ENUM_SINGLE_DECL(adcx140_mic4p_enum,
+			    ADCX140_CH4_CFG0, 5,
+			    adcx140_mic_sel_text);
+
+static const struct snd_kcontrol_new adcx140_dapm_mic4p_control =
+SOC_DAPM_ENUM("MIC4P MUX", adcx140_mic4p_enum);
+
+static SOC_ENUM_SINGLE_DECL(adcx140_mic4_analog_enum,
+			    ADCX140_CH4_CFG0, 7,
+			    adcx140_analog_sel_text);
+
+static const struct snd_kcontrol_new adcx140_dapm_mic4_analog_control =
+SOC_DAPM_ENUM("MIC4 Analog MUX", adcx140_mic4_analog_enum);
+
+static SOC_ENUM_SINGLE_DECL(adcx140_mic4m_enum,
+			    ADCX140_CH4_CFG0, 5,
+			    adcx140_mic_sel_text);
+
+static const struct snd_kcontrol_new adcx140_dapm_mic4m_control =
+SOC_DAPM_ENUM("MIC4M MUX", adcx140_mic4m_enum);
+
+static const struct snd_kcontrol_new adcx140_dapm_ch1_en_switch =
+	SOC_DAPM_SINGLE("Switch", ADCX140_ASI_OUT_CH_EN, 7, 1, 0);
+static const struct snd_kcontrol_new adcx140_dapm_ch2_en_switch =
+	SOC_DAPM_SINGLE("Switch", ADCX140_ASI_OUT_CH_EN, 6, 1, 0);
+static const struct snd_kcontrol_new adcx140_dapm_ch3_en_switch =
+	SOC_DAPM_SINGLE("Switch", ADCX140_ASI_OUT_CH_EN, 5, 1, 0);
+static const struct snd_kcontrol_new adcx140_dapm_ch4_en_switch =
+	SOC_DAPM_SINGLE("Switch", ADCX140_ASI_OUT_CH_EN, 4, 1, 0);
+
+/* Output Mixer */
+static const struct snd_kcontrol_new adcx140_output_mixer_controls[] = {
+	SOC_DAPM_SINGLE("Digital CH1 Switch", 0, 0, 0, 0),
+	SOC_DAPM_SINGLE("Digital CH2 Switch", 0, 0, 0, 0),
+	SOC_DAPM_SINGLE("Digital CH3 Switch", 0, 0, 0, 0),
+	SOC_DAPM_SINGLE("Digital CH4 Switch", 0, 0, 0, 0),
+};
+
+static const struct snd_soc_dapm_widget adcx140_dapm_widgets[] = {
+	/* Analog Differential Inputs */
+	SND_SOC_DAPM_INPUT("MIC1P"),
+	SND_SOC_DAPM_INPUT("MIC1M"),
+	SND_SOC_DAPM_INPUT("MIC2P"),
+	SND_SOC_DAPM_INPUT("MIC2M"),
+	SND_SOC_DAPM_INPUT("MIC3P"),
+	SND_SOC_DAPM_INPUT("MIC3M"),
+	SND_SOC_DAPM_INPUT("MIC4P"),
+	SND_SOC_DAPM_INPUT("MIC4M"),
+
+	SND_SOC_DAPM_OUTPUT("CH1_OUT"),
+	SND_SOC_DAPM_OUTPUT("CH2_OUT"),
+	SND_SOC_DAPM_OUTPUT("CH3_OUT"),
+	SND_SOC_DAPM_OUTPUT("CH4_OUT"),
+	SND_SOC_DAPM_OUTPUT("CH5_OUT"),
+	SND_SOC_DAPM_OUTPUT("CH6_OUT"),
+	SND_SOC_DAPM_OUTPUT("CH7_OUT"),
+	SND_SOC_DAPM_OUTPUT("CH8_OUT"),
+
+	SND_SOC_DAPM_MIXER("Output Mixer", SND_SOC_NOPM, 0, 0,
+		&adcx140_output_mixer_controls[0],
+		ARRAY_SIZE(adcx140_output_mixer_controls)),
+
+	/* Input Selection to MIC_PGA */
+	SND_SOC_DAPM_MUX("MIC1P Input Mux", SND_SOC_NOPM, 0, 0,
+			 &adcx140_dapm_mic1p_control),
+	SND_SOC_DAPM_MUX("MIC2P Input Mux", SND_SOC_NOPM, 0, 0,
+			 &adcx140_dapm_mic2p_control),
+	SND_SOC_DAPM_MUX("MIC3P Input Mux", SND_SOC_NOPM, 0, 0,
+			 &adcx140_dapm_mic3p_control),
+	SND_SOC_DAPM_MUX("MIC4P Input Mux", SND_SOC_NOPM, 0, 0,
+			 &adcx140_dapm_mic4p_control),
+
+	/* Input Selection to MIC_PGA */
+	SND_SOC_DAPM_MUX("MIC1 Analog Mux", SND_SOC_NOPM, 0, 0,
+			 &adcx140_dapm_mic1_analog_control),
+	SND_SOC_DAPM_MUX("MIC2 Analog Mux", SND_SOC_NOPM, 0, 0,
+			 &adcx140_dapm_mic2_analog_control),
+	SND_SOC_DAPM_MUX("MIC3 Analog Mux", SND_SOC_NOPM, 0, 0,
+			 &adcx140_dapm_mic3_analog_control),
+	SND_SOC_DAPM_MUX("MIC4 Analog Mux", SND_SOC_NOPM, 0, 0,
+			 &adcx140_dapm_mic4_analog_control),
+
+	SND_SOC_DAPM_MUX("MIC1M Input Mux", SND_SOC_NOPM, 0, 0,
+			 &adcx140_dapm_mic1m_control),
+	SND_SOC_DAPM_MUX("MIC2M Input Mux", SND_SOC_NOPM, 0, 0,
+			 &adcx140_dapm_mic2m_control),
+	SND_SOC_DAPM_MUX("MIC3M Input Mux", SND_SOC_NOPM, 0, 0,
+			 &adcx140_dapm_mic3m_control),
+	SND_SOC_DAPM_MUX("MIC4M Input Mux", SND_SOC_NOPM, 0, 0,
+			 &adcx140_dapm_mic4m_control),
+
+	SND_SOC_DAPM_PGA("MIC_GAIN_CTL_CH1", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("MIC_GAIN_CTL_CH2", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("MIC_GAIN_CTL_CH3", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("MIC_GAIN_CTL_CH4", SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	SND_SOC_DAPM_ADC("CH1_ADC", "CH1 Capture", ADCX140_IN_CH_EN, 7, 0),
+	SND_SOC_DAPM_ADC("CH2_ADC", "CH2 Capture", ADCX140_IN_CH_EN, 6, 0),
+	SND_SOC_DAPM_ADC("CH3_ADC", "CH3 Capture", ADCX140_IN_CH_EN, 5, 0),
+	SND_SOC_DAPM_ADC("CH4_ADC", "CH4 Capture", ADCX140_IN_CH_EN, 4, 0),
+
+	SND_SOC_DAPM_SWITCH("CH1_ASI_EN", SND_SOC_NOPM, 0, 0,
+			    &adcx140_dapm_ch1_en_switch),
+	SND_SOC_DAPM_SWITCH("CH2_ASI_EN", SND_SOC_NOPM, 0, 0,
+			    &adcx140_dapm_ch2_en_switch),
+	SND_SOC_DAPM_SWITCH("CH3_ASI_EN", SND_SOC_NOPM, 0, 0,
+			    &adcx140_dapm_ch3_en_switch),
+	SND_SOC_DAPM_SWITCH("CH4_ASI_EN", SND_SOC_NOPM, 0, 0,
+			    &adcx140_dapm_ch4_en_switch),
+
+	SND_SOC_DAPM_MUX("IN1 Analog Mic Resistor", SND_SOC_NOPM, 0, 0,
+			in1_resistor_controls),
+	SND_SOC_DAPM_MUX("IN2 Analog Mic Resistor", SND_SOC_NOPM, 0, 0,
+			in2_resistor_controls),
+	SND_SOC_DAPM_MUX("IN3 Analog Mic Resistor", SND_SOC_NOPM, 0, 0,
+			in3_resistor_controls),
+	SND_SOC_DAPM_MUX("IN4 Analog Mic Resistor", SND_SOC_NOPM, 0, 0,
+			in4_resistor_controls),
+};
+
+static const struct snd_soc_dapm_route adcx140_audio_map[] = {
+	/* Outputs */
+	{"CH1_OUT", NULL, "Output Mixer"},
+	{"CH2_OUT", NULL, "Output Mixer"},
+	{"CH3_OUT", NULL, "Output Mixer"},
+	{"CH4_OUT", NULL, "Output Mixer"},
+
+	{"CH1_ASI_EN", "Switch", "CH1_ADC"},
+	{"CH2_ASI_EN", "Switch", "CH2_ADC"},
+	{"CH3_ASI_EN", "Switch", "CH3_ADC"},
+	{"CH4_ASI_EN", "Switch", "CH4_ADC"},
+
+	/* Mic input */
+	{"CH1_ADC", NULL, "MIC_GAIN_CTL_CH1"},
+	{"CH2_ADC", NULL, "MIC_GAIN_CTL_CH2"},
+	{"CH3_ADC", NULL, "MIC_GAIN_CTL_CH3"},
+	{"CH4_ADC", NULL, "MIC_GAIN_CTL_CH4"},
+
+	{"MIC_GAIN_CTL_CH1", NULL, "IN1 Analog Mic Resistor"},
+	{"MIC_GAIN_CTL_CH1", NULL, "IN1 Analog Mic Resistor"},
+	{"MIC_GAIN_CTL_CH2", NULL, "IN2 Analog Mic Resistor"},
+	{"MIC_GAIN_CTL_CH2", NULL, "IN2 Analog Mic Resistor"},
+	{"MIC_GAIN_CTL_CH3", NULL, "IN3 Analog Mic Resistor"},
+	{"MIC_GAIN_CTL_CH3", NULL, "IN3 Analog Mic Resistor"},
+	{"MIC_GAIN_CTL_CH4", NULL, "IN4 Analog Mic Resistor"},
+	{"MIC_GAIN_CTL_CH4", NULL, "IN4 Analog Mic Resistor"},
+
+	{"IN1 Analog Mic Resistor", "2.5 kOhm", "MIC1P Input Mux"},
+	{"IN1 Analog Mic Resistor", "10 kOhm", "MIC1P Input Mux"},
+	{"IN1 Analog Mic Resistor", "20 kOhm", "MIC1P Input Mux"},
+
+	{"IN1 Analog Mic Resistor", "2.5 kOhm", "MIC1M Input Mux"},
+	{"IN1 Analog Mic Resistor", "10 kOhm", "MIC1M Input Mux"},
+	{"IN1 Analog Mic Resistor", "20 kOhm", "MIC1M Input Mux"},
+
+	{"IN2 Analog Mic Resistor", "2.5 kOhm", "MIC2P Input Mux"},
+	{"IN2 Analog Mic Resistor", "10 kOhm", "MIC2P Input Mux"},
+	{"IN2 Analog Mic Resistor", "20 kOhm", "MIC2P Input Mux"},
+
+	{"IN2 Analog Mic Resistor", "2.5 kOhm", "MIC2M Input Mux"},
+	{"IN2 Analog Mic Resistor", "10 kOhm", "MIC2M Input Mux"},
+	{"IN2 Analog Mic Resistor", "20 kOhm", "MIC2M Input Mux"},
+
+	{"IN3 Analog Mic Resistor", "2.5 kOhm", "MIC3P Input Mux"},
+	{"IN3 Analog Mic Resistor", "10 kOhm", "MIC3P Input Mux"},
+	{"IN3 Analog Mic Resistor", "20 kOhm", "MIC3P Input Mux"},
+
+	{"IN3 Analog Mic Resistor", "2.5 kOhm", "MIC3M Input Mux"},
+	{"IN3 Analog Mic Resistor", "10 kOhm", "MIC3M Input Mux"},
+	{"IN3 Analog Mic Resistor", "20 kOhm", "MIC3M Input Mux"},
+
+	{"IN4 Analog Mic Resistor", "2.5 kOhm", "MIC4P Input Mux"},
+	{"IN4 Analog Mic Resistor", "10 kOhm", "MIC4P Input Mux"},
+	{"IN4 Analog Mic Resistor", "20 kOhm", "MIC4P Input Mux"},
+
+	{"IN4 Analog Mic Resistor", "2.5 kOhm", "MIC4M Input Mux"},
+	{"IN4 Analog Mic Resistor", "10 kOhm", "MIC4M Input Mux"},
+	{"IN4 Analog Mic Resistor", "20 kOhm", "MIC4M Input Mux"},
+
+	{"MIC1 Analog Mux", "Line In", "MIC1P"},
+	{"MIC2 Analog Mux", "Line In", "MIC2P"},
+	{"MIC3 Analog Mux", "Line In", "MIC3P"},
+	{"MIC4 Analog Mux", "Line In", "MIC4P"},
+
+	{"MIC1P Input Mux", "Analog", "MIC1P"},
+	{"MIC1M Input Mux", "Analog", "MIC1M"},
+	{"MIC2P Input Mux", "Analog", "MIC2P"},
+	{"MIC2M Input Mux", "Analog", "MIC2M"},
+	{"MIC3P Input Mux", "Analog", "MIC3P"},
+	{"MIC3M Input Mux", "Analog", "MIC3M"},
+	{"MIC4P Input Mux", "Analog", "MIC4P"},
+	{"MIC4M Input Mux", "Analog", "MIC4M"},
+};
+
+static const struct snd_kcontrol_new adcx140_snd_controls[] = {
+	SOC_SINGLE_TLV("Analog CH1 Mic Gain Volume", ADCX140_CH1_CFG1, 2, 42, 0,
+			adc_tlv),
+	SOC_SINGLE_TLV("Analog CH2 Mic Gain Volume", ADCX140_CH1_CFG2, 2, 42, 0,
+			adc_tlv),
+	SOC_SINGLE_TLV("Analog CH3 Mic Gain Volume", ADCX140_CH1_CFG3, 2, 42, 0,
+			adc_tlv),
+	SOC_SINGLE_TLV("Analog CH4 Mic Gain Volume", ADCX140_CH1_CFG4, 2, 42, 0,
+			adc_tlv),
+
+	SOC_SINGLE_TLV("Digital CH1 Out Volume", ADCX140_CH1_CFG2,
+			0, 0xff, 0, dig_vol_tlv),
+	SOC_SINGLE_TLV("Digital CH2 Out Volume", ADCX140_CH2_CFG2,
+			0, 0xff, 0, dig_vol_tlv),
+	SOC_SINGLE_TLV("Digital CH3 Out Volume", ADCX140_CH3_CFG2,
+			0, 0xff, 0, dig_vol_tlv),
+	SOC_SINGLE_TLV("Digital CH4 Out Volume", ADCX140_CH4_CFG2,
+			0, 0xff, 0, dig_vol_tlv),
+	SOC_SINGLE_TLV("Digital CH5 Out Volume", ADCX140_CH5_CFG2,
+			0, 0xff, 0, dig_vol_tlv),
+	SOC_SINGLE_TLV("Digital CH6 Out Volume", ADCX140_CH6_CFG2,
+			0, 0xff, 0, dig_vol_tlv),
+	SOC_SINGLE_TLV("Digital CH7 Out Volume", ADCX140_CH7_CFG2,
+			0, 0xff, 0, dig_vol_tlv),
+	SOC_SINGLE_TLV("Digital CH8 Out Volume", ADCX140_CH8_CFG2,
+			0, 0xff, 0, dig_vol_tlv),
+};
+
+static int adcx140_reset(struct adcx140_priv *adcx140)
+{
+	int ret = 0;
+
+	if (adcx140->gpio_reset) {
+		gpiod_direction_output(adcx140->gpio_reset, 0);
+		/* 8.4.1: wait for hw shutdown (25ms) + >= 1ms */
+		usleep_range(30000, 100000);
+		gpiod_direction_output(adcx140->gpio_reset, 1);
+	} else {
+		ret = regmap_write(adcx140->regmap, ADCX140_SW_RESET,
+		          ADCX140_RESET);
+	}
+
+	/* 8.4.2: wait >= 10 ms after entering sleep mode. */
+	usleep_range(10000, 100000);
+
+	return 0;
+}
+
+static int adcx140_hw_params(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params,
+			     struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	u8 data = 0;
+
+	switch (params_width(params)) {
+	case 16:
+		data = ADCX140_16_BIT_WORD;
+		break;
+	case 20:
+		data = ADCX140_20_BIT_WORD;
+		break;
+	case 24:
+		data = ADCX140_24_BIT_WORD;
+		break;
+	case 32:
+		data = ADCX140_32_BIT_WORD;
+		break;
+	default:
+		dev_err(component->dev, "%s: Unsupported width %d\n",
+			__func__, params_width(params));
+		return -EINVAL;
+	}
+
+	snd_soc_component_update_bits(component, ADCX140_ASI_CFG0,
+			    ADCX140_WORD_LEN_MSK, data);
+
+	return 0;
+}
+
+static int adcx140_set_dai_fmt(struct snd_soc_dai *codec_dai,
+			       unsigned int fmt)
+{
+	struct snd_soc_component *component = codec_dai->component;
+	struct adcx140_priv *adcx140 = snd_soc_component_get_drvdata(component);
+	u8 iface_reg1 = 0;
+	u8 iface_reg2 = 0;
+
+	/* set master/slave audio interface */
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBM_CFM:
+		iface_reg2 |= ADCX140_BCLK_FSYNC_MASTER;
+		break;
+	case SND_SOC_DAIFMT_CBS_CFS:
+		break;
+	case SND_SOC_DAIFMT_CBS_CFM:
+	case SND_SOC_DAIFMT_CBM_CFS:
+	default:
+		dev_err(component->dev, "Invalid DAI master/slave interface\n");
+		return -EINVAL;
+	}
+
+	/* signal polarity */
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_IF:
+		iface_reg1 |= ADCX140_FSYNCINV_BIT;
+		break;
+	case SND_SOC_DAIFMT_IB_IF:
+		iface_reg1 |= ADCX140_BCLKINV_BIT | ADCX140_FSYNCINV_BIT;
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		iface_reg1 |= ADCX140_BCLKINV_BIT;
+		break;
+	case SND_SOC_DAIFMT_NB_NF:
+		break;
+	default:
+		dev_err(component->dev, "Invalid DAI clock signal polarity\n");
+		return -EINVAL;
+	}
+
+	/* interface format */
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		iface_reg1 |= ADCX140_I2S_MODE_BIT;
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		iface_reg1 |= ADCX140_LEFT_JUST_BIT;
+		break;
+	case SND_SOC_DAIFMT_DSP_A:
+	case SND_SOC_DAIFMT_DSP_B:
+		break;
+	default:
+		dev_err(component->dev, "Invalid DAI interface format\n");
+		return -EINVAL;
+	}
+
+	adcx140->dai_fmt = fmt & SND_SOC_DAIFMT_FORMAT_MASK;
+
+	snd_soc_component_update_bits(component, ADCX140_ASI_CFG0,
+				      ADCX140_FSYNCINV_BIT |
+				      ADCX140_BCLKINV_BIT |
+				      ADCX140_ASI_FORMAT_MSK,
+				      iface_reg1);
+	snd_soc_component_update_bits(component, ADCX140_MST_CFG0,
+				      ADCX140_BCLK_FSYNC_MASTER, iface_reg2);
+
+	return 0;
+}
+
+static int adcx140_set_dai_tdm_slot(struct snd_soc_dai *codec_dai,
+				  unsigned int tx_mask, unsigned int rx_mask,
+				  int slots, int slot_width)
+{
+	struct snd_soc_component *component = codec_dai->component;
+	struct adcx140_priv *adcx140 = snd_soc_component_get_drvdata(component);
+	unsigned int lsb;
+
+	if (tx_mask != rx_mask) {
+		dev_err(component->dev, "tx and rx masks must be symmetric\n");
+		return -EINVAL;
+	}
+
+	/* TDM based on DSP mode requires slots to be adjacent */
+	lsb = __ffs(tx_mask);
+	if ((lsb + 1) != __fls(tx_mask)) {
+		dev_err(component->dev, "Invalid mask, slots must be adjacent\n");
+		return -EINVAL;
+	}
+
+	switch (slot_width) {
+	case 16:
+	case 20:
+	case 24:
+	case 32:
+		break;
+	default:
+		dev_err(component->dev, "Unsupported slot width %d\n", slot_width);
+		return -EINVAL;
+	}
+
+	adcx140->tdm_delay = lsb;
+	adcx140->slot_width = slot_width;
+
+	return 0;
+}
+
+static int adcx140_prepare(struct snd_pcm_substream *substream,
+			 struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct adcx140_priv *adcx140 = snd_soc_component_get_drvdata(component);
+	int offset = 0;
+	int width = adcx140->slot_width;
+
+	if (!width)
+		width = substream->runtime->sample_bits;
+
+	/* TDM slot selection only valid in DSP_A/_B mode */
+	if (adcx140->dai_fmt == SND_SOC_DAIFMT_DSP_A)
+		offset += (adcx140->tdm_delay * width + 1);
+	else if (adcx140->dai_fmt == SND_SOC_DAIFMT_DSP_B)
+		offset += adcx140->tdm_delay * width;
+
+	/* Configure data offset */
+	snd_soc_component_update_bits(component, ADCX140_ASI_CFG1,
+				      ADCX140_TX_OFFSET_MASK, offset);
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops adcx140_dai_ops = {
+	.hw_params	= adcx140_hw_params,
+	.set_fmt	= adcx140_set_dai_fmt,
+	.prepare	= adcx140_prepare,
+	.set_tdm_slot	= adcx140_set_dai_tdm_slot,
+};
+
+static int adcx140_codec_probe(struct snd_soc_component *component)
+{
+	struct adcx140_priv *adcx140 = snd_soc_component_get_drvdata(component);
+	int sleep_cfg_val = ADCX140_WAKE_DEV;
+	u8 bias_source;
+	u8 vref_source;
+	int ret;
+
+	ret = device_property_read_u8(adcx140->dev, "ti,mic-bias-source",
+				      &bias_source);
+	if (ret)
+		bias_source = ADCX140_MIC_BIAS_VAL_VREF;
+
+	if (bias_source != ADCX140_MIC_BIAS_VAL_VREF &&
+	    bias_source != ADCX140_MIC_BIAS_VAL_VREF_1096 &&
+	    bias_source != ADCX140_MIC_BIAS_VAL_AVDD) {
+		dev_err(adcx140->dev, "Mic Bias source value is invalid\n");
+		return -EINVAL;
+	}
+
+	ret = device_property_read_u8(adcx140->dev, "ti,vref-source",
+				      &vref_source);
+	if (ret)
+		vref_source = ADCX140_MIC_BIAS_VREF_275V;
+
+	if (vref_source != ADCX140_MIC_BIAS_VREF_275V &&
+	    vref_source != ADCX140_MIC_BIAS_VREF_25V &&
+	    vref_source != ADCX140_MIC_BIAS_VREF_1375V) {
+		dev_err(adcx140->dev, "Mic Bias source value is invalid\n");
+		return -EINVAL;
+	}
+
+	bias_source |= vref_source;
+
+	ret = adcx140_reset(adcx140);
+	if (ret)
+		goto out;
+
+	if(adcx140->supply_areg == NULL)
+		sleep_cfg_val |= ADCX140_AREG_INTERNAL;
+
+	ret = regmap_write(adcx140->regmap, ADCX140_SLEEP_CFG, sleep_cfg_val);
+	if (ret) {
+		dev_err(adcx140->dev, "setting sleep config failed %d\n", ret);
+		goto out;
+	}
+
+	/* 8.4.3: Wait >= 1ms after entering active mode. */
+	usleep_range(1000, 100000);
+
+	ret = regmap_update_bits(adcx140->regmap, ADCX140_BIAS_CFG,
+				ADCX140_MIC_BIAS_VAL_MSK |
+				ADCX140_MIC_BIAS_VREF_MSK, bias_source);
+	if (ret)
+		dev_err(adcx140->dev, "setting MIC bias failed %d\n", ret);
+out:
+	return ret;
+}
+
+static int adcx140_set_bias_level(struct snd_soc_component *component,
+				  enum snd_soc_bias_level level)
+{
+	struct adcx140_priv *adcx140 = snd_soc_component_get_drvdata(component);
+	int pwr_cfg = 0;
+
+	switch (level) {
+	case SND_SOC_BIAS_ON:
+	case SND_SOC_BIAS_PREPARE:
+	case SND_SOC_BIAS_STANDBY:
+		pwr_cfg = ADCX140_PWR_CFG_BIAS_PDZ | ADCX140_PWR_CFG_PLL_PDZ |
+			  ADCX140_PWR_CFG_ADC_PDZ;
+		break;
+	case SND_SOC_BIAS_OFF:
+		pwr_cfg = 0x0;
+		break;
+	}
+
+	return regmap_write(adcx140->regmap, ADCX140_PWR_CFG, pwr_cfg);
+}
+
+static const struct snd_soc_component_driver soc_codec_driver_adcx140 = {
+	.probe			= adcx140_codec_probe,
+	.set_bias_level		= adcx140_set_bias_level,
+	.controls		= adcx140_snd_controls,
+	.num_controls		= ARRAY_SIZE(adcx140_snd_controls),
+	.dapm_widgets		= adcx140_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(adcx140_dapm_widgets),
+	.dapm_routes		= adcx140_audio_map,
+	.num_dapm_routes	= ARRAY_SIZE(adcx140_audio_map),
+	.suspend_bias_off	= 1,
+	.idle_bias_on		= 0,
+	.use_pmdown_time	= 1,
+	.endianness		= 1,
+	.non_legacy_dai_naming	= 1,
+};
+
+static struct snd_soc_dai_driver adcx140_dai_driver[] = {
+	{
+		.name = "tlv320adcx140-codec",
+		.capture = {
+			.stream_name	 = "Capture",
+			.channels_min	 = 2,
+			.channels_max	 = ADCX140_MAX_CHANNELS,
+			.rates		 = ADCX140_RATES,
+			.formats	 = ADCX140_FORMATS,
+		},
+		.ops = &adcx140_dai_ops,
+		.symmetric_rates = 1,
+	}
+};
+
+static const struct of_device_id tlv320adcx140_of_match[] = {
+	{ .compatible = "ti,tlv320adc3140" },
+	{ .compatible = "ti,tlv320adc5140" },
+	{ .compatible = "ti,tlv320adc6140" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, tlv320adcx140_of_match);
+
+static int adcx140_i2c_probe(struct i2c_client *i2c,
+			     const struct i2c_device_id *id)
+{
+	struct adcx140_priv *adcx140;
+	int ret;
+
+	adcx140 = devm_kzalloc(&i2c->dev, sizeof(*adcx140), GFP_KERNEL);
+	if (!adcx140)
+		return -ENOMEM;
+
+	adcx140->gpio_reset = devm_gpiod_get_optional(adcx140->dev,
+						      "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(adcx140->gpio_reset))
+		dev_info(&i2c->dev, "Reset GPIO not defined\n");
+
+	adcx140->supply_areg = devm_regulator_get_optional(adcx140->dev,
+							   "areg");
+	if (IS_ERR(adcx140->supply_areg)) {
+		if (PTR_ERR(adcx140->supply_areg) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		else
+			adcx140->supply_areg = NULL;
+	} else {
+		ret = regulator_enable(adcx140->supply_areg);
+		if (ret) {
+			dev_err(adcx140->dev, "Failed to enable areg\n");
+			return ret;
+		}
+	}
+
+	adcx140->regmap = devm_regmap_init_i2c(i2c, &adcx140_i2c_regmap);
+	if (IS_ERR(adcx140->regmap)) {
+		ret = PTR_ERR(adcx140->regmap);
+		dev_err(&i2c->dev, "Failed to allocate register map: %d\n",
+			ret);
+		return ret;
+	}
+	adcx140->dev = &i2c->dev;
+	i2c_set_clientdata(i2c, adcx140);
+
+	return devm_snd_soc_register_component(&i2c->dev,
+					       &soc_codec_driver_adcx140,
+					       adcx140_dai_driver, 1);
+}
+
+static const struct i2c_device_id adcx140_i2c_id[] = {
+	{ "tlv320adc3140", 0 },
+	{ "tlv320adc5140", 1 },
+	{ "tlv320adc6140", 2 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, adcx140_i2c_id);
+
+static struct i2c_driver adcx140_i2c_driver = {
+	.driver = {
+		.name	= "tlv320adcx140-codec",
+		.of_match_table = of_match_ptr(tlv320adcx140_of_match),
+	},
+	.probe		= adcx140_i2c_probe,
+	.id_table	= adcx140_i2c_id,
+};
+module_i2c_driver(adcx140_i2c_driver);
+
+MODULE_AUTHOR("Dan Murphy <dmurphy@ti.com>");
+MODULE_DESCRIPTION("ASoC TLV320ADCX140 CODEC Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/tlv320adcx140.h b/sound/soc/codecs/tlv320adcx140.h
new file mode 100644
index 000000000000..66b1c3b33f1e
--- /dev/null
+++ b/sound/soc/codecs/tlv320adcx140.h
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0
+// TLV320ADCX104 Sound driver
+// Copyright (C) 2020 Texas Instruments Incorporated - http://www.ti.com/
+
+#ifndef _TLV320ADCX140_H
+#define _TLV320ADCX140_H
+
+#define ADCX140_RATES	(SNDRV_PCM_RATE_44100 | \
+			 SNDRV_PCM_RATE_48000)
+
+#define ADCX140_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
+			 SNDRV_PCM_FMTBIT_S20_3LE | \
+			 SNDRV_PCM_FMTBIT_S24_3LE | \
+			 SNDRV_PCM_FMTBIT_S24_LE | \
+			 SNDRV_PCM_FMTBIT_S32_LE)
+
+#define ADCX140_PAGE_SELECT	0x00
+#define ADCX140_SW_RESET	0x01
+#define ADCX140_SLEEP_CFG 	0x02
+#define ADCX140_SHDN_CFG	0x05
+#define ADCX140_ASI_CFG0	0x07
+#define ADCX140_ASI_CFG1	0x08
+#define ADCX140_ASI_CFG2	0x09
+#define ADCX140_ASI_CH1		0x0b
+#define ADCX140_ASI_CH2		0x0c
+#define ADCX140_ASI_CH3		0x0d
+#define ADCX140_ASI_CH4		0x0e
+#define ADCX140_ASI_CH5		0x0f
+#define ADCX140_ASI_CH6		0x10
+#define ADCX140_ASI_CH7		0x11
+#define ADCX140_ASI_CH8		0x12
+#define ADCX140_MST_CFG0	0x13
+#define ADCX140_MST_CFG1	0x14
+#define ADCX140_ASI_STS		0x15
+#define ADCX140_CLK_SRC		0x16
+#define ADCX140_PDMCLK_CFG	0x1f
+#define ADCX140_PDM_CFG		0x20
+#define ADCX140_GPIO_CFG0	0x21
+#define ADCX140_GPO_CFG1	0x22
+#define ADCX140_GPO_CFG2	0x23
+#define ADCX140_GPO_CFG3	0x24
+#define ADCX140_GPO_CFG4	0x25
+#define ADCX140_GPO_VAL		0x29
+#define ADCX140_GPIO_MON	0x2a
+#define ADCX140_GPI_CFG0	0x2b
+#define ADCX140_GPI_CFG1	0x2c
+#define ADCX140_GPI_MON		0x2f
+#define ADCX140_INT_CFG		0x32
+#define ADCX140_INT_MASK0	0x33
+#define ADCX140_INT_LTCH0	0x36
+#define ADCX140_BIAS_CFG	0x3b
+#define ADCX140_CH1_CFG0	0x3c
+#define ADCX140_CH1_CFG1	0x3d
+#define ADCX140_CH1_CFG2	0x3e
+#define ADCX140_CH1_CFG3	0x3f
+#define ADCX140_CH1_CFG4	0x40
+#define ADCX140_CH2_CFG0	0x41
+#define ADCX140_CH2_CFG1	0x42
+#define ADCX140_CH2_CFG2	0x43
+#define ADCX140_CH2_CFG3	0x44
+#define ADCX140_CH2_CFG4	0x45
+#define ADCX140_CH3_CFG0	0x46
+#define ADCX140_CH3_CFG1	0x47
+#define ADCX140_CH3_CFG2	0x48
+#define ADCX140_CH3_CFG3	0x49
+#define ADCX140_CH3_CFG4 	0x4a
+#define ADCX140_CH4_CFG0	0x4b
+#define ADCX140_CH4_CFG1	0x4c
+#define ADCX140_CH4_CFG2	0x4d
+#define ADCX140_CH4_CFG3	0x4e
+#define ADCX140_CH4_CFG4	0x4f
+#define ADCX140_CH5_CFG2	0x52
+#define ADCX140_CH5_CFG3	0x53
+#define ADCX140_CH5_CFG4	0x54
+#define ADCX140_CH6_CFG2	0x57
+#define ADCX140_CH6_CFG3	0x58
+#define ADCX140_CH6_CFG4	0x59
+#define ADCX140_CH7_CFG2	0x5c
+#define ADCX140_CH7_CFG3	0x5d
+#define ADCX140_CH7_CFG4	0x5e
+#define ADCX140_CH8_CFG2	0x61
+#define ADCX140_CH8_CFG3	0x62
+#define ADCX140_CH8_CFG4	0x63
+#define ADCX140_DSP_CFG0	0x6b
+#define ADCX140_DSP_CFG1	0x6c
+#define ADCX140_DRE_CFG0	0x6d
+#define ADCX140_IN_CH_EN	0x73
+#define ADCX140_ASI_OUT_CH_EN	0x74
+#define ADCX140_PWR_CFG		0x75
+#define ADCX140_DEV_STS0	0x76
+#define ADCX140_DEV_STS1	0x77
+
+#define ADCX140_RESET	BIT(0)
+
+#define ADCX140_WAKE_DEV	BIT(0)
+#define ADCX140_AREG_INTERNAL	BIT(7)
+
+#define ADCX140_BCLKINV_BIT	BIT(2)
+#define ADCX140_FSYNCINV_BIT	BIT(3)
+#define ADCX140_INV_MSK		(ADCX140_BCLKINV_BIT | ADCX140_FSYNCINV_BIT)
+#define ADCX140_BCLK_FSYNC_MASTER	BIT(7)
+#define ADCX140_I2S_MODE_BIT	BIT(6)
+#define ADCX140_LEFT_JUST_BIT	BIT(7)
+#define ADCX140_ASI_FORMAT_MSK	(ADCX140_I2S_MODE_BIT | ADCX140_LEFT_JUST_BIT)
+
+#define ADCX140_16_BIT_WORD	0x0
+#define ADCX140_20_BIT_WORD	BIT(4)
+#define ADCX140_24_BIT_WORD	BIT(5)
+#define ADCX140_32_BIT_WORD	(BIT(4) | BIT(5))
+#define ADCX140_WORD_LEN_MSK	0x30
+
+#define ADCX140_MAX_CHANNELS	8
+
+#define ADCX140_MIC_BIAS_VAL_VREF	0
+#define ADCX140_MIC_BIAS_VAL_VREF_1096	1
+#define ADCX140_MIC_BIAS_VAL_AVDD	6
+#define ADCX140_MIC_BIAS_VAL_MSK GENMASK(6, 4)
+
+#define ADCX140_MIC_BIAS_VREF_275V	0
+#define ADCX140_MIC_BIAS_VREF_25V	1
+#define ADCX140_MIC_BIAS_VREF_1375V	2
+#define ADCX140_MIC_BIAS_VREF_MSK GENMASK(1, 0)
+
+#define ADCX140_PWR_CFG_BIAS_PDZ	BIT(7)
+#define ADCX140_PWR_CFG_ADC_PDZ		BIT(6)
+#define ADCX140_PWR_CFG_PLL_PDZ		BIT(5)
+
+#define ADCX140_TX_OFFSET_MASK		GENMASK(4, 0)
+
+#endif /* _TLV320ADCX140_ */
-- 
2.20.1

