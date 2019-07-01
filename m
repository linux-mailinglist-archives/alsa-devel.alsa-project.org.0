Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F74B57F
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Apr 2019 09:29:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 163259F7;
	Sun, 28 Apr 2019 09:28:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 163259F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556436546;
	bh=FLrG6JXXZ30fqFUlyuYRShiqcKSQaMaJezsikOYZYao=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oiOcww+Oum4ZyyRwpsyjHj0RPA03jVySdRrqnXVpI/21d2SCl+5LVvnbb6Wdrlg55
	 jddCufCeySR+E0HNyZ7Tig4b3yRZmMtxzAHVgNriMIi/hGmwtwcqcLL8N5uZePxEfT
	 XF7kpUAsy+iBE0VF+OD6K79hiV+Z1JeaRNqCUh1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32A28F89720;
	Sun, 28 Apr 2019 09:26:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F262F89721; Sun, 28 Apr 2019 09:26:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE1C7F80CAB
 for <alsa-devel@alsa-project.org>; Sun, 28 Apr 2019 09:25:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE1C7F80CAB
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4B64DAD63;
 Sun, 28 Apr 2019 07:25:53 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun, 28 Apr 2019 09:25:49 +0200
Message-Id: <20190428072550.31087-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190428072550.31087-1-tiwai@suse.de>
References: <20190428072550.31087-1-tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 1/2] ASoC: Add support for Conexant CX2072X
	CODEC
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Simon Ho <simon.ho@conexant.com>

Initial commit of the Conexant CX2072X CODEC driver. Some features are
not present.

The CX2072X is a ultra low power stereo audio codec supports I2S/TDM
host interface with EQ, DRC features in playback mode.

Featues of CX2072X codec:

 * Two 24 bits DACs and DACs.
 * Stereo Headphone AMP.
 * 2.8W per channel class-D output.
 * Integrated seven bands per channel EQ and DRC.
 * Fully integrated headset support with detect/switch.
 * Stereo digital microphone for array applications.
 * S/PDIF output.
 * Bi-directional GPIOs.
 * Support analog and digital PC Beeep.
 * One headset button support.
 * Supports a wide variety of host interfaces.
   -wide variety of I2S and similar bit-stream formats
    with word lengths of up to 24 bits.
   -TDM stream supports up to 4 channels.
 * AEC loopback support.

Further fixes by tiwai:
 * Rebase to 5.1+
 * Missing declarations of jack detection helpers
 * Missing DAPM entry definitions
 * Missing power hooks
 * Workaround for the jack detection during cache-only
 * Fix uninitialized variable warning
 * Fix doubly clk disablement at cx2072x_set_bias_level()
 * Plumbing jack detection code for Intel ASoC
 * Code cleanups and minor refactoring

The OF code was dropped due to the lack of testability.
It should be easy to re-add once if someone can test it.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=115531
Signed-off-by: Simon Ho <simon.ho@conexant.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/Kconfig   |    7 +
 sound/soc/codecs/Makefile  |    2 +
 sound/soc/codecs/cx2072x.c | 2197 ++++++++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/cx2072x.h |  317 +++++++
 4 files changed, 2523 insertions(+)
 create mode 100644 sound/soc/codecs/cx2072x.c
 create mode 100644 sound/soc/codecs/cx2072x.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 8f577258080b..472bde124ebe 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -72,6 +72,7 @@ config SND_SOC_ALL_CODECS
 	select SND_SOC_CS47L24 if MFD_CS47L24
 	select SND_SOC_CS53L30 if I2C
 	select SND_SOC_CX20442 if TTY
+	select SND_SOC_CX2072X if I2C
 	select SND_SOC_DA7210 if SND_SOC_I2C_AND_SPI
 	select SND_SOC_DA7213 if I2C
 	select SND_SOC_DA7218 if I2C
@@ -584,6 +585,12 @@ config SND_SOC_CX20442
 	tristate
 	depends on TTY
 
+config SND_SOC_CX2072X
+	tristate "Conexant CX2072X CODEC"
+	depends on I2C
+	help
+	  Enable support for Conexant CX20721 and CX20723 codec chips.
+
 config SND_SOC_JZ4740_CODEC
 	depends on MIPS || COMPILE_TEST
 	select REGMAP_MMIO
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index aa7720a7a0aa..454b8087a5bd 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -67,6 +67,7 @@ snd-soc-cs4349-objs := cs4349.o
 snd-soc-cs47l24-objs := cs47l24.o
 snd-soc-cs53l30-objs := cs53l30.o
 snd-soc-cx20442-objs := cx20442.o
+snd-soc-cx2072x-objs := cx2072x.o
 snd-soc-da7210-objs := da7210.o
 snd-soc-da7213-objs := da7213.o
 snd-soc-da7218-objs := da7218.o
@@ -341,6 +342,7 @@ obj-$(CONFIG_SND_SOC_CS4349)	+= snd-soc-cs4349.o
 obj-$(CONFIG_SND_SOC_CS47L24)	+= snd-soc-cs47l24.o
 obj-$(CONFIG_SND_SOC_CS53L30)	+= snd-soc-cs53l30.o
 obj-$(CONFIG_SND_SOC_CX20442)	+= snd-soc-cx20442.o
+obj-$(CONFIG_SND_SOC_CX2072X)	+= snd-soc-cx2072x.o
 obj-$(CONFIG_SND_SOC_DA7210)	+= snd-soc-da7210.o
 obj-$(CONFIG_SND_SOC_DA7213)	+= snd-soc-da7213.o
 obj-$(CONFIG_SND_SOC_DA7218)	+= snd-soc-da7218.o
diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
new file mode 100644
index 000000000000..f77d587efe2e
--- /dev/null
+++ b/sound/soc/codecs/cx2072x.c
@@ -0,0 +1,2197 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// ALSA SoC CX20721/CX20723 codec driver
+//
+// Copyright:	(C) 2017 Conexant Systems, Inc.
+// Author:	Simon Ho, <Simon.ho@conexant.com>
+//
+// TODO: add support for TDM mode.
+//
+
+#include <linux/acpi.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio.h>
+#include <linux/init.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <sound/core.h>
+#include <sound/initval.h>
+#include <sound/jack.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/tlv.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include "cx2072x.h"
+
+#define PLL_OUT_HZ_48	(1024 * 3 * 48000)
+#define BITS_PER_SLOT	8
+
+#define CX2072X_PLBK_EQ_BAND_NUM	7
+#define CX2072X_PLBK_EQ_COEF_LEN	11
+#define CX2072X_PLBK_DRC_PARM_LEN	9
+#define CX2072X_CLASSD_AMP_LEN		6
+
+/* codec private data */
+struct cx2072x_priv {
+	struct regmap *regmap;
+	struct clk *mclk;
+	unsigned int mclk_rate;
+	struct device *dev;
+	struct snd_soc_component *codec;
+	struct snd_soc_jack *jack;
+	unsigned int jack_state;
+	unsigned int bclk_ratio;
+	bool plbk_eq_en;
+	bool plbk_eq_en_changed;
+	bool plbk_eq_changed;
+	u8 plbk_eq[2][CX2072X_PLBK_EQ_BAND_NUM][CX2072X_PLBK_EQ_COEF_LEN];
+	int plbk_eq_channel;
+	bool plbk_drc_en;
+	bool plbk_drc_en_changed;
+	bool plbk_drc_changed;
+	bool pll_changed;
+	bool i2spcm_changed;
+	int sample_size;
+	int frame_size;
+	int sample_rate;
+	unsigned int dai_fmt;
+	u32 rev_id;
+	bool en_aec_ref;
+	u8 plbk_drc[CX2072X_PLBK_DRC_PARM_LEN];
+	u8 classd_amp[CX2072X_CLASSD_AMP_LEN];
+	struct mutex eq_coeff_lock; /* EQ DSP lock */
+};
+
+/*
+ * DAC/ADC Volume
+ *
+ * max : 74 : 0 dB
+ *	 ( in 1 dB  step )
+ * min : 0 : -74 dB
+ */
+static const DECLARE_TLV_DB_SCALE(adc_tlv, -7400, 100, 0);
+static const DECLARE_TLV_DB_SCALE(dac_tlv, -7400, 100, 0);
+static const DECLARE_TLV_DB_SCALE(boost_tlv, 0, 1200, 0);
+
+struct cx2072x_eq_ctrl {
+	u8 ch;
+	u8 band;
+};
+
+static const DECLARE_TLV_DB_RANGE(hpf_tlv,
+	0, 0, TLV_DB_SCALE_ITEM(120, 0, 0),
+	1, 63, TLV_DB_SCALE_ITEM(30, 30, 0)
+);
+
+/* Lookup table for PRE_DIV */
+static const struct {
+	unsigned int mclk;
+	unsigned int div;
+} mclk_pre_div[] = {
+	{ 6144000, 1 },
+	{ 12288000, 2 },
+	{ 19200000, 3 },
+	{ 26000000, 4 },
+	{ 28224000, 5 },
+	{ 36864000, 6 },
+	{ 36864000, 7 },
+	{ 48000000, 8 },
+	{ 49152000, 8 },
+};
+
+/*
+ * cx2072x register cache.
+ */
+static const struct reg_default cx2072x_reg_defaults[] = {
+	{ CX2072X_AFG_POWER_STATE, 0x00000003 },
+	{ CX2072X_UM_RESPONSE, 0x00000000 },
+	{ CX2072X_GPIO_DATA, 0x00000000 },
+	{ CX2072X_GPIO_ENABLE, 0x00000000 },
+	{ CX2072X_GPIO_DIRECTION, 0x00000000 },
+	{ CX2072X_GPIO_WAKE, 0x00000000 },
+	{ CX2072X_GPIO_UM_ENABLE, 0x00000000 },
+	{ CX2072X_GPIO_STICKY_MASK, 0x00000000 },
+	{ CX2072X_DAC1_CONVERTER_FORMAT, 0x00000031 },
+	{ CX2072X_DAC1_AMP_GAIN_RIGHT, 0x0000004a },
+	{ CX2072X_DAC1_AMP_GAIN_LEFT, 0x0000004a },
+	{ CX2072X_DAC1_POWER_STATE, 0x00000433 },
+	{ CX2072X_DAC1_CONVERTER_STREAM_CHANNEL, 0x00000000 },
+	{ CX2072X_DAC1_EAPD_ENABLE, 0x00000000 },
+	{ CX2072X_DAC2_CONVERTER_FORMAT, 0x00000031 },
+	{ CX2072X_DAC2_AMP_GAIN_RIGHT, 0x0000004a },
+	{ CX2072X_DAC2_AMP_GAIN_LEFT, 0x0000004a },
+	{ CX2072X_DAC2_POWER_STATE, 0x00000433 },
+	{ CX2072X_DAC2_CONVERTER_STREAM_CHANNEL, 0x00000000 },
+	{ CX2072X_ADC1_CONVERTER_FORMAT, 0x00000031 },
+	{ CX2072X_ADC1_AMP_GAIN_RIGHT_0, 0x0000004a },
+	{ CX2072X_ADC1_AMP_GAIN_LEFT_0, 0x0000004a },
+	{ CX2072X_ADC1_AMP_GAIN_RIGHT_1, 0x0000004a },
+	{ CX2072X_ADC1_AMP_GAIN_LEFT_1, 0x0000004a },
+	{ CX2072X_ADC1_AMP_GAIN_RIGHT_2, 0x0000004a },
+	{ CX2072X_ADC1_AMP_GAIN_LEFT_2, 0x0000004a },
+	{ CX2072X_ADC1_AMP_GAIN_RIGHT_3, 0x0000004a },
+	{ CX2072X_ADC1_AMP_GAIN_LEFT_3, 0x0000004a },
+	{ CX2072X_ADC1_AMP_GAIN_RIGHT_4, 0x0000004a },
+	{ CX2072X_ADC1_AMP_GAIN_LEFT_4, 0x0000004a },
+	{ CX2072X_ADC1_AMP_GAIN_RIGHT_5, 0x0000004a },
+	{ CX2072X_ADC1_AMP_GAIN_LEFT_5, 0x0000004a },
+	{ CX2072X_ADC1_AMP_GAIN_RIGHT_6, 0x0000004a },
+	{ CX2072X_ADC1_AMP_GAIN_LEFT_6, 0x0000004a },
+	{ CX2072X_ADC1_CONNECTION_SELECT_CONTROL, 0x00000000 },
+	{ CX2072X_ADC1_POWER_STATE, 0x00000433 },
+	{ CX2072X_ADC1_CONVERTER_STREAM_CHANNEL, 0x00000000 },
+	{ CX2072X_ADC2_CONVERTER_FORMAT, 0x00000031 },
+	{ CX2072X_ADC2_AMP_GAIN_RIGHT_0, 0x0000004a },
+	{ CX2072X_ADC2_AMP_GAIN_LEFT_0, 0x0000004a },
+	{ CX2072X_ADC2_AMP_GAIN_RIGHT_1, 0x0000004a },
+	{ CX2072X_ADC2_AMP_GAIN_LEFT_1, 0x0000004a },
+	{ CX2072X_ADC2_AMP_GAIN_RIGHT_2, 0x0000004a },
+	{ CX2072X_ADC2_AMP_GAIN_LEFT_2, 0x0000004a },
+	{ CX2072X_ADC2_CONNECTION_SELECT_CONTROL, 0x00000000 },
+	{ CX2072X_ADC2_POWER_STATE, 0x00000433 },
+	{ CX2072X_ADC2_CONVERTER_STREAM_CHANNEL, 0x00000000 },
+	{ CX2072X_PORTA_CONNECTION_SELECT_CTRL, 0x00000000 },
+	{ CX2072X_PORTA_POWER_STATE, 0x00000433 },
+	{ CX2072X_PORTA_PIN_CTRL, 0x000000c0 },
+	{ CX2072X_PORTA_UNSOLICITED_RESPONSE, 0x00000000 },
+	{ CX2072X_PORTA_PIN_SENSE, 0x00000000 },
+	{ CX2072X_PORTA_EAPD_BTL, 0x00000002 },
+	{ CX2072X_PORTB_POWER_STATE, 0x00000433 },
+	{ CX2072X_PORTB_PIN_CTRL, 0x00000000 },
+	{ CX2072X_PORTB_UNSOLICITED_RESPONSE, 0x00000000 },
+	{ CX2072X_PORTB_PIN_SENSE, 0x00000000 },
+	{ CX2072X_PORTB_EAPD_BTL, 0x00000002 },
+	{ CX2072X_PORTB_GAIN_RIGHT, 0x00000000 },
+	{ CX2072X_PORTB_GAIN_LEFT, 0x00000000 },
+	{ CX2072X_PORTC_POWER_STATE, 0x00000433 },
+	{ CX2072X_PORTC_PIN_CTRL, 0x00000000 },
+	{ CX2072X_PORTC_GAIN_RIGHT, 0x00000000 },
+	{ CX2072X_PORTC_GAIN_LEFT, 0x00000000 },
+	{ CX2072X_PORTD_POWER_STATE, 0x00000433 },
+	{ CX2072X_PORTD_PIN_CTRL, 0x00000020 },
+	{ CX2072X_PORTD_UNSOLICITED_RESPONSE, 0x00000000 },
+	{ CX2072X_PORTD_PIN_SENSE, 0x00000000 },
+	{ CX2072X_PORTD_GAIN_RIGHT, 0x00000000 },
+	{ CX2072X_PORTD_GAIN_LEFT, 0x00000000 },
+	{ CX2072X_PORTE_CONNECTION_SELECT_CTRL, 0x00000000 },
+	{ CX2072X_PORTE_POWER_STATE, 0x00000433 },
+	{ CX2072X_PORTE_PIN_CTRL, 0x00000040 },
+	{ CX2072X_PORTE_UNSOLICITED_RESPONSE, 0x00000000 },
+	{ CX2072X_PORTE_PIN_SENSE, 0x00000000 },
+	{ CX2072X_PORTE_EAPD_BTL, 0x00000002 },
+	{ CX2072X_PORTE_GAIN_RIGHT, 0x00000000 },
+	{ CX2072X_PORTE_GAIN_LEFT, 0x00000000 },
+	{ CX2072X_PORTF_POWER_STATE, 0x00000433 },
+	{ CX2072X_PORTF_PIN_CTRL, 0x00000000 },
+	{ CX2072X_PORTF_UNSOLICITED_RESPONSE, 0x00000000 },
+	{ CX2072X_PORTF_PIN_SENSE, 0x00000000 },
+	{ CX2072X_PORTF_GAIN_RIGHT, 0x00000000 },
+	{ CX2072X_PORTF_GAIN_LEFT, 0x00000000 },
+	{ CX2072X_PORTG_POWER_STATE, 0x00000433 },
+	{ CX2072X_PORTG_PIN_CTRL, 0x00000040 },
+	{ CX2072X_PORTG_CONNECTION_SELECT_CTRL, 0x00000000 },
+	{ CX2072X_PORTG_EAPD_BTL, 0x00000002 },
+	{ CX2072X_PORTM_POWER_STATE, 0x00000433 },
+	{ CX2072X_PORTM_PIN_CTRL, 0x00000000 },
+	{ CX2072X_PORTM_CONNECTION_SELECT_CTRL, 0x00000000 },
+	{ CX2072X_PORTM_EAPD_BTL, 0x00000002 },
+	{ CX2072X_MIXER_POWER_STATE, 0x00000433 },
+	{ CX2072X_MIXER_GAIN_RIGHT_0, 0x0000004a },
+	{ CX2072X_MIXER_GAIN_LEFT_0, 0x0000004a },
+	{ CX2072X_MIXER_GAIN_RIGHT_1, 0x0000004a },
+	{ CX2072X_MIXER_GAIN_LEFT_1, 0x0000004a },
+	{ CX2072X_SPKR_DRC_ENABLE_STEP, 0x040065a4 },
+	{ CX2072X_SPKR_DRC_CONTROL, 0x007b0024 },
+	{ CX2072X_SPKR_DRC_TEST, 0x00000000 },
+	{ CX2072X_DIGITAL_BIOS_TEST0, 0x001f008a },
+	{ CX2072X_DIGITAL_BIOS_TEST2, 0x00990026 },
+	{ CX2072X_I2SPCM_CONTROL1, 0x00010001 },
+	{ CX2072X_I2SPCM_CONTROL2, 0x00000000 },
+	{ CX2072X_I2SPCM_CONTROL3, 0x00000000 },
+	{ CX2072X_I2SPCM_CONTROL4, 0x00000000 },
+	{ CX2072X_I2SPCM_CONTROL5, 0x00000000 },
+	{ CX2072X_I2SPCM_CONTROL6, 0x00000000 },
+	{ CX2072X_UM_INTERRUPT_CRTL_E, 0x00000000 },
+	{ CX2072X_CODEC_TEST2, 0x00000000 },
+	{ CX2072X_CODEC_TEST9, 0x00000004 },
+	{ CX2072X_CODEC_TEST20, 0x00000600 },
+	{ CX2072X_CODEC_TEST26, 0x00000208 },
+	{ CX2072X_ANALOG_TEST4, 0x00000000 },
+	{ CX2072X_ANALOG_TEST5, 0x00000000 },
+	{ CX2072X_ANALOG_TEST6, 0x0000059a },
+	{ CX2072X_ANALOG_TEST7, 0x000000a7 },
+	{ CX2072X_ANALOG_TEST8, 0x00000017 },
+	{ CX2072X_ANALOG_TEST9, 0x00000000 },
+	{ CX2072X_ANALOG_TEST10, 0x00000285 },
+	{ CX2072X_ANALOG_TEST11, 0x00000000 },
+	{ CX2072X_ANALOG_TEST12, 0x00000000 },
+	{ CX2072X_ANALOG_TEST13, 0x00000000 },
+	{ CX2072X_DIGITAL_TEST1, 0x00000242 },
+	{ CX2072X_DIGITAL_TEST11, 0x00000000 },
+	{ CX2072X_DIGITAL_TEST12, 0x00000084 },
+	{ CX2072X_DIGITAL_TEST15, 0x00000077 },
+	{ CX2072X_DIGITAL_TEST16, 0x00000021 },
+	{ CX2072X_DIGITAL_TEST17, 0x00000018 },
+	{ CX2072X_DIGITAL_TEST18, 0x00000024 },
+	{ CX2072X_DIGITAL_TEST19, 0x00000001 },
+	{ CX2072X_DIGITAL_TEST20, 0x00000002 },
+};
+
+/*
+ * register patch.
+ */
+static const struct reg_sequence cx2072x_patch[] = {
+	{ 0x71A4, 0x080 }, /* DC offset Calibration		*/
+	{ 0x7328, 0x65f }, /* disable the PA			*/
+	{ 0x71a8, 0x289 }, /* Set the spkeaer output gain	*/
+	{ 0x7310, 0xf05 },
+	{ 0x7290, 0x380 },
+	{ 0x7328, 0xb90 },
+	{ 0x7124, 0x001 }, /* Enable 30 Hz High pass filter	*/
+	{ 0x718c, 0x300 }, /* Disable PCBEEP pad		*/
+	{ 0x731c, 0x100 }, /* Disable SnM mode			*/
+	{ 0x641c, 0x020 }, /* Enable PortD input		*/
+	{ 0x0458, 0x040 }, /* Enable GPIO7 pin for button	*/
+	{ 0x0464, 0x040 }, /* Enable UM for GPIO7		*/
+	{ 0x0420, 0x080 }, /* Enable button response		*/
+	{ 0x7230, 0x0c4 }, /* Enable headset button		*/
+	{ 0x7200, 0x415 }, /* Power down class-D during idle	*/
+	{ 0x6e04, 0x00f }, /* Enable I2S TX			*/
+	{ 0x6e08, 0x00f }, /* Enable I2S RX			*/
+};
+
+/* return register size */
+static unsigned int cx2072x_register_size(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case CX2072X_VENDOR_ID:
+	case CX2072X_REVISION_ID:
+	case CX2072X_PORTA_PIN_SENSE:
+	case CX2072X_PORTB_PIN_SENSE:
+	case CX2072X_PORTD_PIN_SENSE:
+	case CX2072X_PORTE_PIN_SENSE:
+	case CX2072X_PORTF_PIN_SENSE:
+	case CX2072X_I2SPCM_CONTROL1:
+	case CX2072X_I2SPCM_CONTROL2:
+	case CX2072X_I2SPCM_CONTROL3:
+	case CX2072X_I2SPCM_CONTROL4:
+	case CX2072X_I2SPCM_CONTROL5:
+	case CX2072X_I2SPCM_CONTROL6:
+	case CX2072X_UM_INTERRUPT_CRTL_E:
+	case CX2072X_EQ_G_COEFF:
+	case CX2072X_SPKR_DRC_CONTROL:
+	case CX2072X_SPKR_DRC_TEST:
+	case CX2072X_DIGITAL_BIOS_TEST0:
+	case CX2072X_DIGITAL_BIOS_TEST2:
+		return 4;
+	case CX2072X_EQ_ENABLE_BYPASS:
+	case CX2072X_EQ_B0_COEFF:
+	case CX2072X_EQ_B1_COEFF:
+	case CX2072X_EQ_B2_COEFF:
+	case CX2072X_EQ_A1_COEFF:
+	case CX2072X_EQ_A2_COEFF:
+	case CX2072X_DAC1_CONVERTER_FORMAT:
+	case CX2072X_DAC2_CONVERTER_FORMAT:
+	case CX2072X_ADC1_CONVERTER_FORMAT:
+	case CX2072X_ADC2_CONVERTER_FORMAT:
+	case CX2072X_CODEC_TEST2:
+	case CX2072X_CODEC_TEST9:
+	case CX2072X_CODEC_TEST20:
+	case CX2072X_CODEC_TEST26:
+	case CX2072X_ANALOG_TEST3:
+	case CX2072X_ANALOG_TEST4:
+	case CX2072X_ANALOG_TEST5:
+	case CX2072X_ANALOG_TEST6:
+	case CX2072X_ANALOG_TEST7:
+	case CX2072X_ANALOG_TEST8:
+	case CX2072X_ANALOG_TEST9:
+	case CX2072X_ANALOG_TEST10:
+	case CX2072X_ANALOG_TEST11:
+	case CX2072X_ANALOG_TEST12:
+	case CX2072X_ANALOG_TEST13:
+	case CX2072X_DIGITAL_TEST0:
+	case CX2072X_DIGITAL_TEST1:
+	case CX2072X_DIGITAL_TEST11:
+	case CX2072X_DIGITAL_TEST12:
+	case CX2072X_DIGITAL_TEST15:
+	case CX2072X_DIGITAL_TEST16:
+	case CX2072X_DIGITAL_TEST17:
+	case CX2072X_DIGITAL_TEST18:
+	case CX2072X_DIGITAL_TEST19:
+	case CX2072X_DIGITAL_TEST20:
+		return 2;
+	default:
+		return 1;
+	}
+}
+
+static int cx2072x_reg_write(void *context, unsigned int reg,
+			     unsigned int value)
+{
+	struct i2c_client *client = context;
+	struct device *dev = &client->dev;
+	unsigned int i;
+	unsigned int size;
+	u8 buf[6];
+	int ret;
+
+	size = cx2072x_register_size(dev, reg);
+	if (!size)
+		return -EINVAL;
+
+	if (reg == CX2072X_UM_INTERRUPT_CRTL_E) {
+		/* Update the MSB byte only */
+		reg += 3;
+		size = 1;
+		value >>= 24;
+	}
+
+	buf[0] = reg >> 8;
+	buf[1] = reg & 0xff;
+
+	for (i = 2; i < (size + 2); ++i) {
+		buf[i] = value;
+		value >>= 8;
+	}
+
+	ret = i2c_master_send(client, buf, size + 2);
+	if (ret != size + 2) {
+		dev_err(dev, "I2C write failed, ret = %d\n", ret);
+		return ret < 0 ? ret : -EIO;
+	}
+	return 0;
+}
+
+static int cx2072x_reg_bulk_write(struct snd_soc_component *codec,
+				  unsigned int reg,
+				  const void *val, size_t val_count)
+{
+	struct i2c_client *client = to_i2c_client(codec->dev);
+	struct device *dev = &client->dev;
+	u8 buf[2 + CX2072X_MAX_EQ_COEFF];
+	int ret;
+
+	if (val_count > CX2072X_MAX_EQ_COEFF) {
+		dev_err(dev,
+			"cx2072x_reg_bulk_write failed, writing count = %d\n",
+			(int)val_count);
+		return -EINVAL;
+	}
+
+	buf[0] = reg >> 8;
+	buf[1] = reg & 0xff;
+
+	memcpy(&buf[2], val, val_count);
+
+	ret = i2c_master_send(client, buf, val_count + 2);
+	if (ret != val_count + 2) {
+		dev_err(dev, "I2C bulk write failed, ret = %d\n", ret);
+		return ret < 0 ? ret : -EIO;
+	}
+	return 0;
+}
+
+static int cx2072x_reg_read(void *context, unsigned int reg,
+			    unsigned int *value)
+{
+	struct i2c_client *client = context;
+	struct device *dev = &client->dev;
+	unsigned int recv_buf = 0;
+	struct i2c_msg msgs[2];
+	unsigned int size;
+	u8 send_buf[2];
+	int ret;
+
+	size = cx2072x_register_size(dev, reg);
+	if (!size)
+		return -EINVAL;
+
+	send_buf[0] = reg >> 8;
+	send_buf[1] = reg & 0xff;
+
+	msgs[0].addr = client->addr;
+	msgs[0].len = sizeof(send_buf);
+	msgs[0].buf = send_buf;
+	msgs[0].flags = 0;
+
+	msgs[1].addr = client->addr;
+	msgs[1].len = size;
+	msgs[1].buf = (u8 *)&recv_buf;
+	msgs[1].flags = I2C_M_RD;
+
+	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+	if (ret != ARRAY_SIZE(msgs)) {
+		dev_err(dev, "Failed to read register, ret = %d\n", ret);
+		return ret < 0 ? ret : -EIO;
+	}
+
+	*value = recv_buf;
+	return 0;
+}
+
+/* get suggested pre_div valuce from mclk frequency */
+static unsigned int get_div_from_mclk(unsigned int mclk)
+{
+	unsigned int div = 8;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mclk_pre_div); i++) {
+		if (mclk <= mclk_pre_div[i].mclk) {
+			div = mclk_pre_div[i].div;
+			break;
+		}
+	}
+	return div;
+}
+
+static int cx2072x_config_pll(struct cx2072x_priv *cx2072x)
+{
+	struct device *dev = cx2072x->dev;
+	unsigned int pre_div;
+	unsigned int pre_div_val;
+	unsigned int pll_input;
+	unsigned int pll_output;
+	unsigned int int_div;
+	unsigned int frac_div;
+	u64 frac_num;
+	unsigned int frac;
+	unsigned int sample_rate = cx2072x->sample_rate;
+	int pt_sample_per_sync = 2;
+	int pt_clock_per_sample = 96;
+
+	switch (sample_rate) {
+	case 48000:
+	case 32000:
+	case 24000:
+	case 16000:
+		break;
+
+	case 96000:
+		pt_sample_per_sync = 1;
+		pt_clock_per_sample = 48;
+		break;
+
+	case 192000:
+		pt_sample_per_sync = 0;
+		pt_clock_per_sample = 24;
+		break;
+
+	default:
+		dev_err(dev, "Unsupported sample rate %d\n", sample_rate);
+		return -EINVAL;
+	}
+
+	/* Configure PLL settings */
+	pre_div = get_div_from_mclk(cx2072x->mclk_rate);
+	pll_input = cx2072x->mclk_rate / pre_div;
+	pll_output = sample_rate * 3072;
+	int_div = pll_output / pll_input;
+	frac_div = pll_output - (int_div * pll_input);
+
+	if (frac_div) {
+		frac_div *= 1000;
+		frac_div /= pll_input;
+		frac_num = ((4000 + frac_div) * ((1 << 20) - 4));
+		do_div(frac_num, 7);
+		frac = ((u32)frac_num + 499) / 1000;
+	}
+	pre_div_val = (pre_div - 1) * 2;
+
+	regmap_write(cx2072x->regmap, CX2072X_ANALOG_TEST4,
+		     0X40 | (pre_div_val << 8));
+	if (frac_div == 0) {
+		/* Int mode */
+		regmap_write(cx2072x->regmap, CX2072X_ANALOG_TEST7, 0x100);
+	} else {
+		/* frac mode */
+		regmap_write(cx2072x->regmap, CX2072X_ANALOG_TEST6,
+			     frac & 0xfff);
+		regmap_write(cx2072x->regmap, CX2072X_ANALOG_TEST7,
+			     (u8)(frac >> 12));
+	}
+
+	int_div--;
+	regmap_write(cx2072x->regmap, CX2072X_ANALOG_TEST8, int_div);
+
+	/* configure PLL tracking */
+	if (frac_div == 0) {
+		/* disable PLL tracking */
+		regmap_write(cx2072x->regmap, CX2072X_DIGITAL_TEST16, 0x00);
+	} else {
+		/* configure and enable PLL tracking */
+		regmap_write(cx2072x->regmap, CX2072X_DIGITAL_TEST16,
+			     (pt_sample_per_sync << 4) & 0xf0);
+		regmap_write(cx2072x->regmap, CX2072X_DIGITAL_TEST17,
+			     pt_clock_per_sample);
+		regmap_write(cx2072x->regmap, CX2072X_DIGITAL_TEST18,
+			     pt_clock_per_sample * 3 / 2);
+		regmap_write(cx2072x->regmap, CX2072X_DIGITAL_TEST19, 0x01);
+		regmap_write(cx2072x->regmap, CX2072X_DIGITAL_TEST20, 0x02);
+		regmap_update_bits(cx2072x->regmap, CX2072X_DIGITAL_TEST16,
+				   0X01, 0X01);
+	}
+
+	return 0;
+}
+
+static int cx2072x_config_i2spcm(struct cx2072x_priv *cx2072x)
+{
+	struct device *dev = cx2072x->dev;
+	unsigned int bclk_rate = 0;
+	int is_i2s = 0;
+	int has_one_bit_delay = 0;
+	int is_right_j = 0;
+	int is_frame_inv = 0;
+	int is_bclk_inv = 0;
+	int pulse_len = 1;
+	int frame_len = cx2072x->frame_size;
+	int sample_size = cx2072x->sample_size;
+	int i2s_right_slot;
+	int i2s_right_pause_interval = 0;
+	int i2s_right_pause_pos;
+	int is_big_endian = 1;
+	u64 div;
+	unsigned int mod;
+	union cx2072x_reg_i2spcm_ctrl_reg1 reg1;
+	union cx2072x_reg_i2spcm_ctrl_reg2 reg2;
+	union cx2072x_reg_i2spcm_ctrl_reg3 reg3;
+	union cx2072x_reg_i2spcm_ctrl_reg4 reg4;
+	union cx2072x_reg_i2spcm_ctrl_reg5 reg5;
+	union cx2072x_reg_i2spcm_ctrl_reg6 reg6;
+	union cx2072x_reg_digital_bios_test2 regdbt2;
+	const unsigned int fmt = cx2072x->dai_fmt;
+
+	if (frame_len <= 0) {
+		dev_err(dev, "Incorrect frame len %d\n", frame_len);
+		return -EINVAL;
+	}
+
+	if (sample_size <= 0) {
+		dev_err(dev, "Incorrect sample size %d\n", sample_size);
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "config_i2spcm set_dai_fmt- %08x\n", fmt);
+
+	regdbt2.ulval = 0xac;
+
+	/* set master/slave */
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBM_CFM:
+		reg2.r.tx_master = 1;
+		reg3.r.rx_master = 1;
+		dev_dbg(dev, "Sets Master mode\n");
+		break;
+
+	case SND_SOC_DAIFMT_CBS_CFS:
+		reg2.r.tx_master = 0;
+		reg3.r.rx_master = 0;
+		dev_dbg(dev, "Sets Slave mode\n");
+		break;
+
+	default:
+		dev_err(dev, "Unsupported DAI master mode\n");
+		return -EINVAL;
+	}
+
+	/* set format */
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		is_i2s = 1;
+		has_one_bit_delay = 1;
+		pulse_len = frame_len / 2;
+		break;
+
+	case SND_SOC_DAIFMT_RIGHT_J:
+		is_i2s = 1;
+		is_right_j = 1;
+		pulse_len = frame_len / 2;
+		break;
+
+	case SND_SOC_DAIFMT_LEFT_J:
+		is_i2s = 1;
+		pulse_len = frame_len / 2;
+		break;
+
+	default:
+		dev_err(dev, "Unsupported DAI format\n");
+		return -EINVAL;
+	}
+
+	/* clock inversion */
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		is_frame_inv = is_i2s;
+		is_bclk_inv = is_i2s;
+		break;
+
+	case SND_SOC_DAIFMT_IB_IF:
+		is_frame_inv = !is_i2s;
+		is_bclk_inv = !is_i2s;
+		break;
+
+	case SND_SOC_DAIFMT_IB_NF:
+		is_frame_inv = is_i2s;
+		is_bclk_inv = !is_i2s;
+		break;
+
+	case SND_SOC_DAIFMT_NB_IF:
+		is_frame_inv = !is_i2s;
+		is_bclk_inv = is_i2s;
+		break;
+
+	default:
+		dev_err(dev, "Unsupported DAI clock inversion\n");
+		return -EINVAL;
+	}
+
+	reg1.r.rx_data_one_line = 1;
+	reg1.r.tx_data_one_line = 1;
+
+	if (is_i2s) {
+		i2s_right_slot = (frame_len / 2) / BITS_PER_SLOT;
+		i2s_right_pause_interval = (frame_len / 2) % BITS_PER_SLOT;
+		i2s_right_pause_pos = i2s_right_slot * BITS_PER_SLOT;
+	}
+
+	reg1.r.rx_ws_pol = is_frame_inv;
+	reg1.r.rx_ws_wid = pulse_len - 1;
+
+	reg1.r.rx_frm_len = frame_len / BITS_PER_SLOT - 1;
+	reg1.r.rx_sa_size = (sample_size / BITS_PER_SLOT) - 1;
+
+	reg1.r.tx_ws_pol = reg1.r.rx_ws_pol;
+	reg1.r.tx_ws_wid = pulse_len - 1;
+	reg1.r.tx_frm_len = reg1.r.rx_frm_len;
+	reg1.r.tx_sa_size = reg1.r.rx_sa_size;
+
+	reg2.r.tx_endian_sel = !is_big_endian;
+	reg2.r.tx_dstart_dly = has_one_bit_delay;
+	if (cx2072x->en_aec_ref)
+		reg2.r.tx_dstart_dly = 0;
+
+	reg3.r.rx_endian_sel = !is_big_endian;
+	reg3.r.rx_dstart_dly = has_one_bit_delay;
+
+	reg4.ulval = 0;
+
+	if (is_i2s) {
+		reg2.r.tx_slot_1 = 0;
+		reg2.r.tx_slot_2 = i2s_right_slot;
+		reg3.r.rx_slot_1 = 0;
+		if (cx2072x->en_aec_ref)
+			reg3.r.rx_slot_2 = 0;
+		else
+			reg3.r.rx_slot_2 = i2s_right_slot;
+		reg6.r.rx_pause_start_pos = i2s_right_pause_pos;
+		reg6.r.rx_pause_cycles = i2s_right_pause_interval;
+		reg6.r.tx_pause_start_pos = i2s_right_pause_pos;
+		reg6.r.tx_pause_cycles = i2s_right_pause_interval;
+	} else {
+		dev_err(dev, "TDM mode is not implemented yet\n");
+		return -EINVAL;
+	}
+	regdbt2.r.i2s_bclk_invert = is_bclk_inv;
+
+	reg1.r.rx_data_one_line = 1;
+	reg1.r.tx_data_one_line = 1;
+
+	/* Configures the BCLK output */
+	bclk_rate = cx2072x->sample_rate * frame_len;
+	reg5.r.i2s_pcm_clk_div_chan_en = 0;
+
+	/* Disables bclk output before setting new value */
+	regmap_write(cx2072x->regmap, CX2072X_I2SPCM_CONTROL5, 0);
+
+	if (reg2.r.tx_master) {
+		/* Configures BCLK rate */
+		div = PLL_OUT_HZ_48;
+		mod = do_div(div, bclk_rate);
+		if (mod) {
+			dev_err(dev, "Unsupported BCLK %dHz\n", bclk_rate);
+			return -EINVAL;
+		}
+		dev_dbg(dev, "enables BCLK %dHz output\n", bclk_rate);
+		reg5.r.i2s_pcm_clk_div = (u32)div - 1;
+		reg5.r.i2s_pcm_clk_div_chan_en = 1;
+	}
+
+	regmap_write(cx2072x->regmap, CX2072X_I2SPCM_CONTROL1, reg1.ulval);
+	regmap_update_bits(cx2072x->regmap, CX2072X_I2SPCM_CONTROL2, 0xffffffc0,
+			   reg2.ulval);
+	regmap_update_bits(cx2072x->regmap, CX2072X_I2SPCM_CONTROL3, 0xffffffc0,
+			   reg3.ulval);
+	regmap_write(cx2072x->regmap, CX2072X_I2SPCM_CONTROL4, reg4.ulval);
+	regmap_write(cx2072x->regmap, CX2072X_I2SPCM_CONTROL6, reg6.ulval);
+	regmap_write(cx2072x->regmap, CX2072X_I2SPCM_CONTROL5, reg5.ulval);
+
+	regmap_write(cx2072x->regmap, CX2072X_DIGITAL_BIOS_TEST2,
+		     regdbt2.ulval);
+
+	return 0;
+}
+
+static void cx2072x_update_eq_coeff(struct snd_soc_component *codec)
+{
+	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
+	int band, ch, value;
+
+	if (!cx2072x->plbk_eq_changed)
+		return;
+	if (!cx2072x->plbk_eq_en)
+		return;
+
+	/* set EQ to bypass mode before configuring the EQ settings */
+	regmap_write(cx2072x->regmap, CX2072X_EQ_ENABLE_BYPASS, 0x620f);
+
+	for (ch = 0; ch < 2; ch++) {
+		for (band = 0; band < CX2072X_PLBK_EQ_BAND_NUM; band++) {
+			cx2072x_reg_bulk_write(codec, CX2072X_EQ_B0_COEFF,
+					       &cx2072x->plbk_eq[ch][band][0],
+					       CX2072X_MAX_EQ_COEFF);
+			value = band + (ch << 3) + (1 << 6);
+			regmap_write(cx2072x->regmap, CX2072X_EQ_BAND, value);
+			mdelay(5);
+		}
+	}
+
+	cx2072x->plbk_eq_changed = false;
+	cx2072x->plbk_eq_en_changed = true;
+}
+
+static void cx2072x_update_eq_en(struct snd_soc_component *codec)
+{
+	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
+
+	if (cx2072x->plbk_eq_en_changed) {
+		if (cx2072x->plbk_eq_en)
+			regmap_write(cx2072x->regmap, CX2072X_EQ_ENABLE_BYPASS,
+				     0x6203);
+		else
+			regmap_write(cx2072x->regmap, CX2072X_EQ_ENABLE_BYPASS,
+				     0x620c);
+
+		cx2072x->plbk_eq_en_changed = false;
+	}
+}
+
+static void cx2072x_update_drc(struct snd_soc_component *codec)
+{
+	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
+
+	if (cx2072x->plbk_drc_changed && cx2072x->plbk_drc_en) {
+		cx2072x_reg_bulk_write(codec, CX2072X_SPKR_DRC_ENABLE_STEP,
+				       cx2072x->plbk_drc,
+				       CX2072X_MAX_DRC_REGS);
+		cx2072x->plbk_drc_changed = false;
+		cx2072x->plbk_drc_en_changed = true;
+	}
+}
+
+static void cx2072x_update_drc_en(struct snd_soc_component *codec)
+{
+	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
+	u8 drc_status = cx2072x->plbk_drc[0];
+
+	if (!cx2072x->plbk_drc_en_changed)
+		return;
+
+	if (cx2072x->plbk_drc_en) {
+		drc_status |= 0x1;
+		regmap_write(cx2072x->regmap, CX2072X_SPKR_DRC_ENABLE_STEP,
+			     drc_status);
+		cx2072x->plbk_drc[0] = drc_status;
+	} else {
+		drc_status &= 0xfe;
+		regmap_write(cx2072x->regmap, CX2072X_SPKR_DRC_ENABLE_STEP,
+			     drc_status);
+		cx2072x->plbk_drc[0] = drc_status;
+	}
+
+	cx2072x->plbk_drc_en_changed = false;
+}
+
+static void cx2072x_update_dsp(struct snd_soc_component *codec)
+{
+	unsigned int afg_reg;
+	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
+
+	regmap_read(cx2072x->regmap, CX2072X_AFG_POWER_STATE, &afg_reg);
+
+	/* skip since device is on D3 mode */
+	if ((afg_reg & 0xf) != 0)
+		return;
+
+	regmap_read(cx2072x->regmap, CX2072X_PORTG_POWER_STATE, &afg_reg);
+
+	/* skip since device is on D3 mode */
+	if ((afg_reg & 0xf) != 0) {
+		dev_dbg(codec->dev, "failed to update dsp dueo portg is off\n");
+		return;
+	}
+
+	cx2072x_update_eq_coeff(codec);
+	cx2072x_update_eq_en(codec);
+	cx2072x_update_drc(codec);
+	cx2072x_update_drc_en(codec);
+}
+
+static int afg_power_ev(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *codec = snd_soc_dapm_to_component(w->dapm);
+	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		regmap_update_bits(cx2072x->regmap, CX2072X_DIGITAL_BIOS_TEST0,
+				   0x00, 0x10);
+		break;
+
+	case SND_SOC_DAPM_PRE_PMD:
+		regmap_update_bits(cx2072x->regmap, CX2072X_DIGITAL_BIOS_TEST0,
+				   0x10, 0x10);
+		break;
+	}
+
+	return 0;
+}
+
+static int portg_power_ev(struct snd_soc_dapm_widget *w,
+			  struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *codec = snd_soc_dapm_to_component(w->dapm);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		dev_dbg(codec->dev, "portg_power_event\n");
+		cx2072x_update_dsp(codec);
+		break;
+
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+#define cx2072x_plbk_eq_en_info		snd_ctl_boolean_mono_info
+
+static int cx2072x_plbk_eq_en_get(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
+
+	ucontrol->value.integer.value[0] = cx2072x->plbk_eq_en;
+	return 0;
+}
+
+static int cx2072x_plbk_eq_en_put(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
+	const bool enable = ucontrol->value.integer.value[0];
+	int changed = 0;
+
+	if (ucontrol->value.integer.value[0] > 1)
+		return -EINVAL;
+
+	if (cx2072x->plbk_eq_en != enable) {
+		cx2072x->plbk_eq_en = enable;
+		cx2072x->plbk_eq_en_changed = true;
+		cx2072x_update_dsp(codec);
+		changed = 1;
+	}
+
+	return changed;
+}
+
+#define cx2072x_plbk_drc_en_info	snd_ctl_boolean_mono_info
+
+static int cx2072x_plbk_drc_en_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
+
+	ucontrol->value.integer.value[0] = cx2072x->plbk_drc_en;
+	return 0;
+}
+
+static int cx2072x_plbk_drc_en_put(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
+	const bool enable = ucontrol->value.integer.value[0];
+	int changed = 0;
+
+	if (ucontrol->value.integer.value[0] > 1)
+		return -EINVAL;
+
+	if (cx2072x->plbk_drc_en != enable) {
+		cx2072x->plbk_drc_en = enable;
+		cx2072x->plbk_drc_en_changed = true;
+		cx2072x_update_dsp(codec);
+		changed = 1;
+	}
+
+	return changed;
+}
+
+static int cx2072x_plbk_eq_info(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_BYTES;
+	uinfo->count = CX2072X_PLBK_EQ_COEF_LEN;
+	return 0;
+}
+
+static int cx2072x_plbk_eq_get(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
+	struct cx2072x_eq_ctrl *eq =
+		(struct cx2072x_eq_ctrl *)kcontrol->private_value;
+	u8 *param = ucontrol->value.bytes.data;
+	u8 *cache = cx2072x->plbk_eq[eq->ch][eq->band];
+
+	memcpy(param, cache, CX2072X_PLBK_EQ_COEF_LEN);
+	return 0;
+}
+
+static int cx2072x_plbk_eq_put(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
+	struct cx2072x_eq_ctrl *eq =
+		(struct cx2072x_eq_ctrl *)kcontrol->private_value;
+	u8 *param = ucontrol->value.bytes.data;
+	u8 *cache = cx2072x->plbk_eq[eq->ch][eq->band];
+	int changed = 0;
+
+	mutex_lock(&cx2072x->eq_coeff_lock);
+
+	/* do nothing if the value is the same */
+	if (memcmp(cache, param, CX2072X_PLBK_EQ_COEF_LEN))
+		goto unlock;
+
+	memcpy(cache, param, CX2072X_PLBK_EQ_COEF_LEN);
+
+	cx2072x->plbk_eq_changed = true;
+	cx2072x->plbk_eq_channel = eq->ch;
+	cx2072x_update_dsp(codec);
+	changed = 1;
+ unlock:
+	mutex_unlock(&cx2072x->eq_coeff_lock);
+	return changed;
+}
+
+static int cx2072x_classd_level_info(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_BYTES;
+	uinfo->count = CX2072X_CLASSD_AMP_LEN;
+	return 0;
+}
+
+static int cx2072x_classd_level_get(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
+	u8 *param = ucontrol->value.bytes.data;
+	u8 *cache = cx2072x->classd_amp;
+
+	memcpy(param, cache, CX2072X_CLASSD_AMP_LEN);
+	return 0;
+}
+
+static int cx2072x_classd_level_put(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
+	u8 *param = ucontrol->value.bytes.data;
+	u8 *cache = cx2072x->classd_amp;
+
+	memcpy(cache, param, CX2072X_CLASSD_AMP_LEN);
+
+	/* Config Power Averaging */
+	cx2072x_reg_bulk_write(codec, CX2072X_ANALOG_TEST10,
+			       &cx2072x->classd_amp[0], 2);
+	cx2072x_reg_bulk_write(codec, CX2072X_CODEC_TEST20,
+			       &cx2072x->classd_amp[2], 2);
+	cx2072x_reg_bulk_write(codec, CX2072X_CODEC_TEST26,
+			       &cx2072x->classd_amp[4], 2);
+	return 0;
+}
+
+static int cx2072x_plbk_drc_info(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_BYTES;
+	uinfo->count = CX2072X_PLBK_DRC_PARM_LEN;
+	return 0;
+}
+
+static int cx2072x_plbk_drc_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
+	u8 *param = ucontrol->value.bytes.data;
+	u8 *cache = cx2072x->plbk_drc;
+
+	memcpy(param, cache, CX2072X_PLBK_DRC_PARM_LEN);
+	return 0;
+}
+
+static int cx2072x_plbk_drc_put(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
+	u8 *param = ucontrol->value.bytes.data;
+	u8 *cache = cx2072x->plbk_drc;
+
+	memcpy(cache, param, CX2072X_PLBK_DRC_PARM_LEN);
+
+	cx2072x->plbk_drc_changed = true;
+	cx2072x_update_dsp(codec);
+	return 0;
+}
+
+#define CX2072X_PLBK_DRC_COEF(xname)			\
+	{						\
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,	\
+		.name = xname,				\
+		.info = cx2072x_plbk_drc_info,		\
+		.get = cx2072x_plbk_drc_get,		\
+		.put = cx2072x_plbk_drc_put		\
+	}
+
+#define CX2072X_PLBK_EQ_COEF(xname, xch, xband)				\
+	{								\
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,			\
+		.name = xname,						\
+		.info = cx2072x_plbk_eq_info,				\
+		.get = cx2072x_plbk_eq_get,				\
+		.put = cx2072x_plbk_eq_put,				\
+		.private_value =					\
+			(unsigned long)&(struct cx2072x_eq_ctrl)	\
+			{.ch = xch, .band = xband }			\
+	}
+
+#define CX2072X_PLBK_DSP_EQ_SWITCH(xname)		\
+	{						\
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,	\
+		.name = (xname),			\
+		.info = cx2072x_plbk_eq_en_info,	\
+		.get = cx2072x_plbk_eq_en_get,		\
+		.put = cx2072x_plbk_eq_en_put		\
+	}
+
+#define CX2072X_PLBK_DSP_DRC_SWITCH(xname)		\
+	{						\
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,	\
+		.name = (xname),			\
+		.info = cx2072x_plbk_drc_en_info,	\
+		.get = cx2072x_plbk_drc_en_get,		\
+		.put = cx2072x_plbk_drc_en_put		\
+	}
+
+#define CX2072X_CLASSD_LEVEL(xname)			\
+	{						\
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,	\
+		.name = (xname),			\
+		.info = cx2072x_classd_level_info,	\
+		.get = cx2072x_classd_level_get,	\
+		.put = cx2072x_classd_level_put		\
+	}
+
+static const struct snd_kcontrol_new cx2072x_snd_controls[] = {
+	SOC_DOUBLE_R_TLV("PortD Boost Volume", CX2072X_PORTD_GAIN_LEFT,
+			 CX2072X_PORTD_GAIN_RIGHT, 0, 3, 0, boost_tlv),
+	SOC_DOUBLE_R_TLV("PortC Boost Volume", CX2072X_PORTC_GAIN_LEFT,
+			 CX2072X_PORTC_GAIN_RIGHT, 0, 3, 0, boost_tlv),
+	SOC_DOUBLE_R_TLV("PortB Boost Volume", CX2072X_PORTB_GAIN_LEFT,
+			 CX2072X_PORTB_GAIN_RIGHT, 0, 3, 0, boost_tlv),
+	SOC_DOUBLE_R_TLV("PortD ADC1 Volume", CX2072X_ADC1_AMP_GAIN_LEFT_1,
+			 CX2072X_ADC1_AMP_GAIN_RIGHT_1, 0, 0x4a, 0, adc_tlv),
+	SOC_DOUBLE_R_TLV("PortC ADC1 Volume", CX2072X_ADC1_AMP_GAIN_LEFT_2,
+			 CX2072X_ADC1_AMP_GAIN_RIGHT_2, 0, 0x4a, 0, adc_tlv),
+	SOC_DOUBLE_R_TLV("PortB ADC1 Volume", CX2072X_ADC1_AMP_GAIN_LEFT_0,
+			 CX2072X_ADC1_AMP_GAIN_RIGHT_0, 0, 0x4a, 0, adc_tlv),
+	SOC_DOUBLE_R_TLV("DAC1 Volume", CX2072X_DAC1_AMP_GAIN_LEFT,
+			 CX2072X_DAC1_AMP_GAIN_RIGHT, 0, 0x4a, 0, dac_tlv),
+	SOC_DOUBLE_R("DAC1 Mute Switch", CX2072X_DAC1_AMP_GAIN_LEFT,
+		     CX2072X_DAC1_AMP_GAIN_RIGHT, 7,  1, 0),
+	SOC_DOUBLE_R_TLV("DAC2 Volume", CX2072X_DAC2_AMP_GAIN_LEFT,
+			 CX2072X_DAC2_AMP_GAIN_RIGHT, 0, 0x4a, 0, dac_tlv),
+	CX2072X_PLBK_DSP_EQ_SWITCH("EQ Switch"),
+	CX2072X_PLBK_DSP_DRC_SWITCH("DRC Switch"),
+
+	CX2072X_PLBK_EQ_COEF("DACL EQ 0", 0, 0),
+	CX2072X_PLBK_EQ_COEF("DACL EQ 1", 0, 1),
+	CX2072X_PLBK_EQ_COEF("DACL EQ 2", 0, 2),
+	CX2072X_PLBK_EQ_COEF("DACL EQ 3", 0, 3),
+	CX2072X_PLBK_EQ_COEF("DACL EQ 4", 0, 4),
+	CX2072X_PLBK_EQ_COEF("DACL EQ 5", 0, 5),
+	CX2072X_PLBK_EQ_COEF("DACL EQ 6", 0, 6),
+	CX2072X_PLBK_EQ_COEF("DACR EQ 0", 1, 0),
+	CX2072X_PLBK_EQ_COEF("DACR EQ 1", 1, 1),
+	CX2072X_PLBK_EQ_COEF("DACR EQ 2", 1, 2),
+	CX2072X_PLBK_EQ_COEF("DACR EQ 3", 1, 3),
+	CX2072X_PLBK_EQ_COEF("DACR EQ 4", 1, 4),
+	CX2072X_PLBK_EQ_COEF("DACR EQ 5", 1, 5),
+	CX2072X_PLBK_EQ_COEF("DACR EQ 6", 1, 6),
+	CX2072X_PLBK_DRC_COEF("DRC"),
+	SOC_SINGLE_TLV("HPF Freq", CX2072X_CODEC_TEST9, 0, 0x3f, 0, hpf_tlv),
+	SOC_DOUBLE("HPF Switch", CX2072X_CODEC_TEST9, 8, 9, 1, 1),
+	CX2072X_CLASSD_LEVEL("Class-D Output Level"),
+	SOC_SINGLE("PortA HP Amp Switch", CX2072X_PORTA_PIN_CTRL, 7, 1, 0),
+};
+
+/**
+ * snd_soc_cx2072x_enable_jack_detect - Enable CX2072X jack detection
+ * @codec: codec object
+ */
+int snd_soc_cx2072x_enable_jack_detect(struct snd_soc_component *codec)
+{
+	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(codec);
+
+	/* No-sticky input type */
+	regmap_write(cx2072x->regmap, CX2072X_GPIO_STICKY_MASK, 0x1f);
+
+	/* Use GPOI0 as interrupt pin */
+	regmap_write(cx2072x->regmap, CX2072X_UM_INTERRUPT_CRTL_E, 0x12 << 24);
+
+	/* Enables unsolitited message on PortA */
+	regmap_write(cx2072x->regmap, CX2072X_PORTA_UNSOLICITED_RESPONSE, 0x80);
+
+	/* support both nokia and apple headset set. Monitor time = 275 ms */
+	regmap_write(cx2072x->regmap, CX2072X_DIGITAL_TEST15, 0x73);
+
+	/* Disable TIP detection */
+	regmap_write(cx2072x->regmap, CX2072X_ANALOG_TEST12, 0x300);
+
+	/* Switch MusicD3Live pin to GPIO */
+	regmap_write(cx2072x->regmap, CX2072X_DIGITAL_TEST1, 0);
+
+	snd_soc_dapm_mutex_lock(dapm);
+
+	snd_soc_dapm_force_enable_pin_unlocked(dapm, "PORTD");
+	snd_soc_dapm_force_enable_pin_unlocked(dapm, "Headset Bias");
+	snd_soc_dapm_force_enable_pin_unlocked(dapm, "PortD Mic Bias");
+
+	snd_soc_dapm_mutex_unlock(dapm);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_cx2072x_enable_jack_detect);
+
+/**
+ * snd_soc_cx2072x_get_jack_state: Return current jack state.
+ * @codec: codec object
+ */
+int snd_soc_cx2072x_get_jack_state(struct snd_soc_component *codec)
+{
+	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
+	unsigned int jack;
+	unsigned int type = 0;
+	int state = 0;
+	bool need_cache_bypass =
+		snd_soc_component_get_bias_level(codec) == SND_SOC_BIAS_OFF;
+
+	if (need_cache_bypass)
+		regcache_cache_only(cx2072x->regmap, false);
+
+	cx2072x->jack_state = CX2072X_JACK_NONE;
+	regmap_read(cx2072x->regmap, CX2072X_PORTA_PIN_SENSE, &jack);
+	jack = jack >> 24;
+	regmap_read(cx2072x->regmap, CX2072X_DIGITAL_TEST11, &type);
+
+	if (need_cache_bypass)
+		regcache_cache_only(cx2072x->regmap, true);
+
+	if (jack == 0x80) {
+		type = type >> 8;
+
+		if (type & 0x8) {
+			state |= SND_JACK_HEADSET;
+			cx2072x->jack_state = CX2072X_JACK_APPLE_HEADSET;
+			if (type & 0x2)
+				state |= SND_JACK_BTN_0;
+		} else if (type & 0x4) {
+			state |= SND_JACK_HEADPHONE;
+			cx2072x->jack_state = CX2072X_JACK_NOKIE_HEADSET;
+		} else {
+			state |= SND_JACK_HEADPHONE;
+			cx2072x->jack_state = CX2072X_JACK_HEADPHONE;
+		}
+	}
+
+	/* clear interrupt */
+	regmap_write(cx2072x->regmap, CX2072X_UM_INTERRUPT_CRTL_E, 0x12 << 24);
+
+	dev_dbg(codec->dev, "CX2072X_HSDETECT type=0x%X,Jack state = %x\n",
+		type, state);
+	return state;
+}
+EXPORT_SYMBOL_GPL(snd_soc_cx2072x_get_jack_state);
+
+static int cx2072x_hw_params(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params,
+			     struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *codec = dai->component;
+	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
+	struct device *dev = codec->dev;
+	const unsigned int sample_rate = params_rate(params);
+	int sample_size, frame_size;
+
+	/* Data sizes if not using TDM */
+	sample_size = params_width(params);
+
+	if (sample_size < 0)
+		return sample_size;
+
+	frame_size = snd_soc_params_to_frame_size(params);
+	if (frame_size < 0)
+		return frame_size;
+
+	if (cx2072x->mclk_rate == 0) {
+		dev_err(dev, "Master clock rate is not configued\n");
+		return -EINVAL;
+	}
+
+	if (cx2072x->bclk_ratio)
+		frame_size = cx2072x->bclk_ratio;
+
+	switch (sample_rate) {
+	case 48000:
+	case 32000:
+	case 24000:
+	case 16000:
+	case 96000:
+	case 192000:
+		break;
+
+	default:
+		dev_err(dev, "Unsupported sample rate %d\n", sample_rate);
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "Sample size %d bits, frame = %d bits, rate = %d Hz\n",
+		sample_size, frame_size, sample_rate);
+
+	cx2072x->frame_size = frame_size;
+	cx2072x->sample_size = sample_size;
+	cx2072x->sample_rate = sample_rate;
+
+	if (dai->id == CX2072X_DAI_DSP) {
+		cx2072x->en_aec_ref = true;
+		dev_dbg(cx2072x->dev, "enables aec reference\n");
+		regmap_write(cx2072x->regmap,
+			     CX2072X_ADC1_CONNECTION_SELECT_CONTROL, 3);
+	}
+
+	if (cx2072x->pll_changed) {
+		cx2072x_config_pll(cx2072x);
+		cx2072x->pll_changed = false;
+	}
+
+	if (cx2072x->i2spcm_changed) {
+		cx2072x_config_i2spcm(cx2072x);
+		cx2072x->i2spcm_changed = false;
+	}
+
+	return 0;
+}
+
+static void cx2072x_shutdown(struct snd_pcm_substream *substream,
+			     struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *codec = dai->component;
+	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
+
+	/* shutdown codec */
+	regcache_cache_only(cx2072x->regmap, false);
+	regmap_write(cx2072x->regmap, CX2072X_PORTA_POWER_STATE, 3);
+	regmap_write(cx2072x->regmap, CX2072X_PORTB_POWER_STATE, 3);
+	regmap_write(cx2072x->regmap, CX2072X_PORTC_POWER_STATE, 3);
+	regmap_write(cx2072x->regmap, CX2072X_PORTD_POWER_STATE, 3);
+	regmap_write(cx2072x->regmap, CX2072X_PORTE_POWER_STATE, 3);
+	regmap_write(cx2072x->regmap, CX2072X_PORTG_POWER_STATE, 3);
+	regmap_write(cx2072x->regmap, CX2072X_MIXER_POWER_STATE, 3);
+	regmap_write(cx2072x->regmap, CX2072X_ADC1_POWER_STATE, 3);
+	regmap_write(cx2072x->regmap, CX2072X_ADC2_POWER_STATE, 3);
+	regmap_write(cx2072x->regmap, CX2072X_DAC1_POWER_STATE, 3);
+	regmap_write(cx2072x->regmap, CX2072X_DAC2_POWER_STATE, 3);
+
+	snd_soc_component_force_bias_level(codec, SND_SOC_BIAS_OFF);
+}
+
+static int cx2072x_set_dai_bclk_ratio(struct snd_soc_dai *dai,
+				      unsigned int ratio)
+{
+	struct snd_soc_component *codec = dai->component;
+	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
+
+	cx2072x->bclk_ratio = ratio;
+	return 0;
+}
+
+static int cx2072x_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
+				  unsigned int freq, int dir)
+{
+	struct snd_soc_component *codec = dai->component;
+	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
+
+	if (cx2072x->mclk && clk_set_rate(cx2072x->mclk, freq)) {
+		dev_err(codec->dev, "set clk rate failed\n");
+		return -EINVAL;
+	}
+
+	cx2072x->mclk_rate = freq;
+	return 0;
+}
+
+static int cx2072x_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct snd_soc_component *codec = dai->component;
+	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
+	struct device *dev = codec->dev;
+
+	dev_dbg(dev, "set_dai_fmt- %08x\n", fmt);
+	/* set master/slave */
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBS_CFS:
+		break;
+
+	default:
+		dev_err(dev, "Unsupported DAI master mode\n");
+		return -EINVAL;
+	}
+
+	/* set format */
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+	case SND_SOC_DAIFMT_RIGHT_J:
+	case SND_SOC_DAIFMT_LEFT_J:
+		break;
+
+	default:
+		dev_err(dev, "Unsupported DAI format\n");
+		return -EINVAL;
+	}
+
+	/* clock inversion */
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+	case SND_SOC_DAIFMT_IB_IF:
+	case SND_SOC_DAIFMT_IB_NF:
+	case SND_SOC_DAIFMT_NB_IF:
+		break;
+
+	default:
+		dev_err(dev, "Unsupported DAI clock inversion\n");
+		return -EINVAL;
+	}
+
+	cx2072x->dai_fmt = fmt;
+	return 0;
+}
+
+static const struct snd_kcontrol_new portaouten_ctl =
+	SOC_DAPM_SINGLE("Switch", CX2072X_PORTA_PIN_CTRL, 6, 1, 0);
+
+static const struct snd_kcontrol_new porteouten_ctl =
+	SOC_DAPM_SINGLE("Switch", CX2072X_PORTE_PIN_CTRL, 6, 1, 0);
+
+static const struct snd_kcontrol_new portgouten_ctl =
+	SOC_DAPM_SINGLE("Switch", CX2072X_PORTG_PIN_CTRL, 6, 1, 0);
+
+static const struct snd_kcontrol_new portmouten_ctl =
+	SOC_DAPM_SINGLE("Switch", CX2072X_PORTM_PIN_CTRL, 6, 1, 0);
+
+static const struct snd_kcontrol_new portbinen_ctl =
+	SOC_DAPM_SINGLE("Switch", CX2072X_PORTB_PIN_CTRL, 5, 1, 0);
+
+static const struct snd_kcontrol_new portcinen_ctl =
+	SOC_DAPM_SINGLE("Switch", CX2072X_PORTC_PIN_CTRL, 5, 1, 0);
+
+static const struct snd_kcontrol_new portdinen_ctl =
+	SOC_DAPM_SINGLE("Switch", CX2072X_PORTD_PIN_CTRL, 5, 1, 0);
+
+static const struct snd_kcontrol_new porteinen_ctl =
+	SOC_DAPM_SINGLE("Switch", CX2072X_PORTE_PIN_CTRL, 5, 1, 0);
+
+static const struct snd_kcontrol_new i2sadc1l_ctl =
+	SOC_DAPM_SINGLE("Switch", CX2072X_I2SPCM_CONTROL2, 0, 1, 0);
+
+static const struct snd_kcontrol_new i2sadc1r_ctl =
+	SOC_DAPM_SINGLE("Switch", CX2072X_I2SPCM_CONTROL2, 1, 1, 0);
+
+static const struct snd_kcontrol_new i2sadc2l_ctl =
+	SOC_DAPM_SINGLE("Switch", CX2072X_I2SPCM_CONTROL2, 2, 1, 0);
+
+static const struct snd_kcontrol_new i2sadc2r_ctl =
+	SOC_DAPM_SINGLE("Switch", CX2072X_I2SPCM_CONTROL2, 3, 1, 0);
+
+static const struct snd_kcontrol_new i2sdac1l_ctl =
+	SOC_DAPM_SINGLE("Switch", CX2072X_I2SPCM_CONTROL3, 0, 1, 0);
+
+static const struct snd_kcontrol_new i2sdac1r_ctl =
+	SOC_DAPM_SINGLE("Switch", CX2072X_I2SPCM_CONTROL3, 1, 1, 0);
+
+static const struct snd_kcontrol_new i2sdac2l_ctl =
+	SOC_DAPM_SINGLE("Switch", CX2072X_I2SPCM_CONTROL3, 2, 1, 0);
+
+static const struct snd_kcontrol_new i2sdac2r_ctl =
+	SOC_DAPM_SINGLE("Switch", CX2072X_I2SPCM_CONTROL3, 3, 1, 0);
+
+static const char * const dac_enum_text[] = {
+	"DAC1 Switch", "DAC2 Switch",
+};
+
+static const struct soc_enum porta_dac_enum =
+SOC_ENUM_SINGLE(CX2072X_PORTA_CONNECTION_SELECT_CTRL, 0, 2, dac_enum_text);
+
+static const struct snd_kcontrol_new porta_mux =
+SOC_DAPM_ENUM("PortA Mux", porta_dac_enum);
+
+static const struct soc_enum portg_dac_enum =
+SOC_ENUM_SINGLE(CX2072X_PORTG_CONNECTION_SELECT_CTRL, 0, 2, dac_enum_text);
+
+static const struct snd_kcontrol_new portg_mux =
+SOC_DAPM_ENUM("PortG Mux", portg_dac_enum);
+
+static const struct soc_enum porte_dac_enum =
+SOC_ENUM_SINGLE(CX2072X_PORTE_CONNECTION_SELECT_CTRL, 0, 2, dac_enum_text);
+
+static const struct snd_kcontrol_new porte_mux =
+SOC_DAPM_ENUM("PortE Mux", porte_dac_enum);
+
+static const struct soc_enum portm_dac_enum =
+SOC_ENUM_SINGLE(CX2072X_PORTM_CONNECTION_SELECT_CTRL, 0, 2, dac_enum_text);
+
+static const struct snd_kcontrol_new portm_mux =
+SOC_DAPM_ENUM("PortM Mux", portm_dac_enum);
+
+static const char * const adc1in_sel_text[] = {
+	"PortB Switch", "PortD Switch", "PortC Switch", "Widget15 Switch",
+	"PortE Switch", "PortF Switch", "PortH Switch"
+};
+
+static const struct soc_enum adc1in_sel_enum =
+SOC_ENUM_SINGLE(CX2072X_ADC1_CONNECTION_SELECT_CONTROL, 0, 7, adc1in_sel_text);
+
+static const struct snd_kcontrol_new adc1_mux =
+SOC_DAPM_ENUM("ADC1 Mux", adc1in_sel_enum);
+
+static const char * const adc2in_sel_text[] = {
+	"PortC Switch", "Widget15 Switch", "PortH Switch"
+};
+
+static const struct soc_enum adc2in_sel_enum =
+SOC_ENUM_SINGLE(CX2072X_ADC2_CONNECTION_SELECT_CONTROL, 0, 3, adc2in_sel_text);
+
+static const struct snd_kcontrol_new adc2_mux =
+SOC_DAPM_ENUM("ADC2 Mux", adc2in_sel_enum);
+
+static const struct snd_kcontrol_new wid15_mix[] = {
+	SOC_DAPM_SINGLE("DAC1L Switch", CX2072X_MIXER_GAIN_LEFT_0, 7, 1, 1),
+	SOC_DAPM_SINGLE("DAC1R Switch", CX2072X_MIXER_GAIN_RIGHT_0, 7, 1, 1),
+	SOC_DAPM_SINGLE("DAC2L Switch", CX2072X_MIXER_GAIN_LEFT_1, 7, 1, 1),
+	SOC_DAPM_SINGLE("DAC2R Switch", CX2072X_MIXER_GAIN_RIGHT_1, 7, 1, 1),
+};
+
+#define CX2072X_DAPM_SUPPLY_S(wname, wsubseq, wreg, wshift, wmask,  won_val, \
+	woff_val, wevent, wflags) \
+	{.id = snd_soc_dapm_supply, .name = wname, .kcontrol_news = NULL, \
+	.num_kcontrols = 0, .reg = wreg, .shift = wshift, .mask = wmask, \
+	.on_val = won_val, .off_val = woff_val, \
+	.subseq = wsubseq, .event = wevent, .event_flags = wflags}
+
+#define CX2072X_DAPM_SWITCH(wname,  wreg, wshift, wmask,  won_val, woff_val, \
+	wevent, wflags) \
+	{.id = snd_soc_dapm_switch, .name = wname, .kcontrol_news = NULL, \
+	.num_kcontrols = 0, .reg = wreg, .shift = wshift, .mask = wmask, \
+	.on_val = won_val, .off_val = woff_val, \
+	.event = wevent, .event_flags = wflags}
+
+#define CX2072X_DAPM_SWITCH(wname,  wreg, wshift, wmask,  won_val, woff_val, \
+	wevent, wflags) \
+	{.id = snd_soc_dapm_switch, .name = wname, .kcontrol_news = NULL, \
+	.num_kcontrols = 0, .reg = wreg, .shift = wshift, .mask = wmask, \
+	.on_val = won_val, .off_val = woff_val, \
+	.event = wevent, .event_flags = wflags}
+
+#define CX2072X_DAPM_REG_E(wid, wname, wreg, wshift, wmask, won_val, woff_val, \
+				wevent, wflags) \
+	{.id = wid, .name = wname, .kcontrol_news = NULL, .num_kcontrols = 0, \
+	.reg = wreg, .shift = wshift, .mask = wmask, \
+	.on_val = won_val, .off_val = woff_val, \
+	.event = wevent, .event_flags = wflags}
+
+static const struct snd_soc_dapm_widget cx2072x_dapm_widgets[] = {
+	/*Playback*/
+	SND_SOC_DAPM_AIF_IN("In AIF", "Playback", 0, SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_SWITCH("I2S DAC1L", SND_SOC_NOPM, 0, 0, &i2sdac1l_ctl),
+	SND_SOC_DAPM_SWITCH("I2S DAC1R", SND_SOC_NOPM, 0, 0, &i2sdac1r_ctl),
+	SND_SOC_DAPM_SWITCH("I2S DAC2L", SND_SOC_NOPM, 0, 0, &i2sdac2l_ctl),
+	SND_SOC_DAPM_SWITCH("I2S DAC2R", SND_SOC_NOPM, 0, 0, &i2sdac2r_ctl),
+
+	SND_SOC_DAPM_REG(snd_soc_dapm_dac, "DAC1", CX2072X_DAC1_POWER_STATE,
+			 0, 0xFFF, 0x00, 0x03),
+
+	SND_SOC_DAPM_REG(snd_soc_dapm_dac, "DAC2", CX2072X_DAC2_POWER_STATE,
+			 0, 0xFFF, 0x00, 0x03),
+
+	SND_SOC_DAPM_MUX("PortA Mux", SND_SOC_NOPM, 0, 0, &porta_mux),
+	SND_SOC_DAPM_MUX("PortG Mux", SND_SOC_NOPM, 0, 0, &portg_mux),
+	SND_SOC_DAPM_MUX("PortE Mux", SND_SOC_NOPM, 0, 0, &porte_mux),
+	SND_SOC_DAPM_MUX("PortM Mux", SND_SOC_NOPM, 0, 0, &portm_mux),
+
+	SND_SOC_DAPM_REG(snd_soc_dapm_supply, "PortA Power",
+			 CX2072X_PORTA_POWER_STATE, 0, 0XFFF, 0X00, 0X03),
+
+	SND_SOC_DAPM_REG(snd_soc_dapm_supply, "PortM Power",
+			 CX2072X_PORTM_POWER_STATE, 0, 0XFFF, 0X00, 0X03),
+
+	CX2072X_DAPM_SUPPLY_S("PortG Power", 1, CX2072X_PORTG_POWER_STATE, 0,
+			      0xFF, 0x00, 0x03, portg_power_ev,
+			      SND_SOC_DAPM_POST_PMU),
+
+	CX2072X_DAPM_SUPPLY_S("AFG Power", 0, CX2072X_AFG_POWER_STATE,
+			      0, 0xFFF, 0x00, 0x03, afg_power_ev,
+			      SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+
+	SND_SOC_DAPM_SWITCH("PortA Out En", SND_SOC_NOPM, 0, 0,
+			    &portaouten_ctl),
+	SND_SOC_DAPM_SWITCH("PortE Out En", SND_SOC_NOPM, 0, 0,
+			    &porteouten_ctl),
+	SND_SOC_DAPM_SWITCH("PortG Out En", SND_SOC_NOPM, 0, 0,
+			    &portgouten_ctl),
+	SND_SOC_DAPM_SWITCH("PortM Out En", SND_SOC_NOPM, 0, 0,
+			    &portmouten_ctl),
+
+	SND_SOC_DAPM_OUTPUT("PORTA"),
+	SND_SOC_DAPM_OUTPUT("PORTG"),
+	SND_SOC_DAPM_OUTPUT("PORTE"),
+	SND_SOC_DAPM_OUTPUT("PORTM"),
+	SND_SOC_DAPM_OUTPUT("AEC REF"),
+
+	/*Capture*/
+	SND_SOC_DAPM_AIF_OUT("Out AIF", "Capture", 0, SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_SWITCH("I2S ADC1L", SND_SOC_NOPM, 0, 0, &i2sadc1l_ctl),
+	SND_SOC_DAPM_SWITCH("I2S ADC1R", SND_SOC_NOPM, 0, 0, &i2sadc1r_ctl),
+	SND_SOC_DAPM_SWITCH("I2S ADC2L", SND_SOC_NOPM, 0, 0, &i2sadc2l_ctl),
+	SND_SOC_DAPM_SWITCH("I2S ADC2R", SND_SOC_NOPM, 0, 0, &i2sadc2r_ctl),
+
+	SND_SOC_DAPM_REG(snd_soc_dapm_adc, "ADC1", CX2072X_ADC1_POWER_STATE,
+			 0, 0xFF, 0x00, 0x03),
+	SND_SOC_DAPM_REG(snd_soc_dapm_adc, "ADC2", CX2072X_ADC2_POWER_STATE,
+			 0, 0xFF, 0x00, 0x03),
+
+	SND_SOC_DAPM_MUX("ADC1 Mux", SND_SOC_NOPM, 0, 0, &adc1_mux),
+	SND_SOC_DAPM_MUX("ADC2 Mux", SND_SOC_NOPM, 0, 0, &adc2_mux),
+
+	SND_SOC_DAPM_REG(snd_soc_dapm_supply, "PortB Power",
+			 CX2072X_PORTB_POWER_STATE, 0, 0xFFF, 0x00, 0x03),
+	SND_SOC_DAPM_REG(snd_soc_dapm_supply, "PortC Power",
+			 CX2072X_PORTC_POWER_STATE, 0, 0xFFF, 0x00, 0x03),
+	SND_SOC_DAPM_REG(snd_soc_dapm_supply, "PortD Power",
+			 CX2072X_PORTD_POWER_STATE, 0, 0xFFF, 0x00, 0x03),
+	SND_SOC_DAPM_REG(snd_soc_dapm_supply, "PortE Power",
+			 CX2072X_PORTE_POWER_STATE, 0, 0xFFF, 0x00, 0x03),
+	SND_SOC_DAPM_REG(snd_soc_dapm_supply, "Widget15 Power",
+			 CX2072X_MIXER_POWER_STATE, 0, 0xFFF, 0x00, 0x03),
+
+	SND_SOC_DAPM_MIXER("Widget15 Mixer", SND_SOC_NOPM, 0, 0,
+			   wid15_mix, ARRAY_SIZE(wid15_mix)),
+	SND_SOC_DAPM_SWITCH("PortB In En", SND_SOC_NOPM, 0, 0, &portbinen_ctl),
+	SND_SOC_DAPM_SWITCH("PortC In En", SND_SOC_NOPM, 0, 0, &portcinen_ctl),
+	SND_SOC_DAPM_SWITCH("PortD In En", SND_SOC_NOPM, 0, 0, &portdinen_ctl),
+	SND_SOC_DAPM_SWITCH("PortE In En", SND_SOC_NOPM, 0, 0, &porteinen_ctl),
+
+	SND_SOC_DAPM_MICBIAS("Headset Bias", CX2072X_ANALOG_TEST11, 1, 0),
+	SND_SOC_DAPM_MICBIAS("PortB Mic Bias", CX2072X_PORTB_PIN_CTRL, 2, 0),
+	SND_SOC_DAPM_MICBIAS("PortD Mic Bias", CX2072X_PORTD_PIN_CTRL, 2, 0),
+	SND_SOC_DAPM_MICBIAS("PortE Mic Bias", CX2072X_PORTE_PIN_CTRL, 2, 0),
+	SND_SOC_DAPM_INPUT("PORTB"),
+	SND_SOC_DAPM_INPUT("PORTC"),
+	SND_SOC_DAPM_INPUT("PORTD"),
+	SND_SOC_DAPM_INPUT("PORTEIN"),
+
+};
+
+static const struct snd_soc_dapm_route cx2072x_intercon[] = {
+	/* Playback */
+	{"In AIF", NULL, "AFG Power"},
+	{"I2S DAC1L", "Switch", "In AIF"},
+	{"I2S DAC1R", "Switch", "In AIF"},
+	{"I2S DAC2L", "Switch", "In AIF"},
+	{"I2S DAC2R", "Switch", "In AIF"},
+	{"DAC1", NULL, "I2S DAC1L"},
+	{"DAC1", NULL, "I2S DAC1R"},
+	{"DAC2", NULL, "I2S DAC2L"},
+	{"DAC2", NULL, "I2S DAC2R"},
+	{"PortA Mux", "DAC1 Switch", "DAC1"},
+	{"PortA Mux", "DAC2 Switch", "DAC2"},
+	{"PortG Mux", "DAC1 Switch", "DAC1"},
+	{"PortG Mux", "DAC2 Switch", "DAC2"},
+	{"PortE Mux", "DAC1 Switch", "DAC1"},
+	{"PortE Mux", "DAC2 Switch", "DAC2"},
+	{"PortM Mux", "DAC1 Switch", "DAC1"},
+	{"PortM Mux", "DAC2 Switch", "DAC2"},
+	{"Widget15 Mixer", "DAC1L Switch", "DAC1"},
+	{"Widget15 Mixer", "DAC1R Switch", "DAC2"},
+	{"Widget15 Mixer", "DAC2L Switch", "DAC1"},
+	{"Widget15 Mixer", "DAC2R Switch", "DAC2"},
+	{"Widget15 Mixer", NULL, "Widget15 Power"},
+	{"PortA Out En", "Switch", "PortA Mux"},
+	{"PortG Out En", "Switch", "PortG Mux"},
+	{"PortE Out En", "Switch", "PortE Mux"},
+	{"PortM Out En", "Switch", "PortM Mux"},
+	{"PortA Mux", NULL, "PortA Power"},
+	{"PortG Mux", NULL, "PortG Power"},
+	{"PortE Mux", NULL, "PortE Power"},
+	{"PortM Mux", NULL, "PortM Power"},
+	{"PortA Out En", NULL, "PortA Power"},
+	{"PortG Out En", NULL, "PortG Power"},
+	{"PortE Out En", NULL, "PortE Power"},
+	{"PortM Out En", NULL, "PortM Power"},
+	{"PORTA", NULL, "PortA Out En"},
+	{"PORTG", NULL, "PortG Out En"},
+	{"PORTE", NULL, "PortE Out En"},
+	{"PORTM", NULL, "PortM Out En"},
+
+	/* Capture */
+	{"PORTD", NULL, "Headset Bias"},
+	{"PortB In En", "Switch", "PORTB"},
+	{"PortC In En", "Switch", "PORTC"},
+	{"PortD In En", "Switch", "PORTD"},
+	{"PortE In En", "Switch", "PORTEIN"},
+	{"ADC1 Mux", "PortB Switch", "PortB In En"},
+	{"ADC1 Mux", "PortC Switch", "PortC In En"},
+	{"ADC1 Mux", "PortD Switch", "PortD In En"},
+	{"ADC1 Mux", "PortE Switch", "PortE In En"},
+	{"ADC1 Mux", "Widget15 Switch", "Widget15 Mixer"},
+	{"ADC2 Mux", "PortC Switch", "PortC In En"},
+	{"ADC2 Mux", "Widget15 Switch", "Widget15 Mixer"},
+	{"ADC1", NULL, "ADC1 Mux"},
+	{"ADC2", NULL, "ADC2 Mux"},
+	{"I2S ADC1L", "Switch", "ADC1"},
+	{"I2S ADC1R", "Switch", "ADC1"},
+	{"I2S ADC2L", "Switch", "ADC2"},
+	{"I2S ADC2R", "Switch", "ADC2"},
+	{"Out AIF", NULL, "I2S ADC1L"},
+	{"Out AIF", NULL, "I2S ADC1R"},
+	{"Out AIF", NULL, "I2S ADC2L"},
+	{"Out AIF", NULL, "I2S ADC2R"},
+	{"Out AIF", NULL, "AFG Power"},
+	{"AEC REF", NULL, "Out AIF"},
+	{"PortB In En", NULL, "PortB Power"},
+	{"PortC In En", NULL, "PortC Power"},
+	{"PortD In En", NULL, "PortD Power"},
+	{"PortE In En", NULL, "PortE Power"},
+};
+
+static void cx2072x_sw_reset(struct cx2072x_priv *cx2072x)
+{
+	regmap_write(cx2072x->regmap, CX2072X_AFG_FUNCTION_RESET, 0x01);
+	regmap_write(cx2072x->regmap, CX2072X_AFG_FUNCTION_RESET, 0x01);
+}
+
+static int cx2072x_init(struct snd_soc_component *codec)
+{
+	int ch, band;
+	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
+
+	regmap_write(cx2072x->regmap, CX2072X_AFG_POWER_STATE, 0);
+
+	/* configre PortC as input device */
+	regmap_update_bits(cx2072x->regmap, CX2072X_PORTC_PIN_CTRL,
+			   0x20, 0x20);
+
+	cx2072x->plbk_eq_changed = true;
+	cx2072x->plbk_drc_changed = true;
+
+	/* use flat eq by default */
+	for (ch = 0 ; ch < 2 ; ch++) {
+		for (band = 0; band < CX2072X_PLBK_EQ_BAND_NUM; band++) {
+			cx2072x->plbk_eq[ch][band][1] = 64;
+			cx2072x->plbk_eq[ch][band][10] = 3;
+		}
+	}
+
+	regmap_update_bits(cx2072x->regmap, CX2072X_DIGITAL_BIOS_TEST2,
+			   0x84, 0xFF);
+
+	return 0;
+}
+
+static int cx2072x_set_bias_level(struct snd_soc_component *codec,
+				  enum snd_soc_bias_level level)
+{
+	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
+	const enum snd_soc_bias_level old_level =
+		 snd_soc_component_get_bias_level(codec);
+	int ret;
+
+	switch (level) {
+	case SND_SOC_BIAS_ON:
+		break;
+
+	case SND_SOC_BIAS_PREPARE:
+		break;
+
+	case SND_SOC_BIAS_STANDBY:
+		if (old_level == SND_SOC_BIAS_OFF) {
+			if (cx2072x->mclk) {
+				dev_dbg(cx2072x->dev,
+					"Turn on MCLK with rate %d\n",
+					cx2072x->mclk_rate);
+				ret = clk_prepare_enable(cx2072x->mclk);
+				if (ret)
+					return ret;
+			}
+			regcache_cache_only(cx2072x->regmap, false);
+			regmap_write(cx2072x->regmap,
+				     CX2072X_AFG_POWER_STATE, 0);
+			regcache_sync(cx2072x->regmap);
+		}
+		break;
+
+	case SND_SOC_BIAS_OFF:
+		if (old_level != SND_SOC_BIAS_OFF) {
+			/* Shutdown codec completely */
+			cx2072x_sw_reset(cx2072x);
+			regmap_write(cx2072x->regmap, CX2072X_AFG_POWER_STATE, 3);
+			regcache_mark_dirty(cx2072x->regmap);
+			regcache_cache_only(cx2072x->regmap, true);
+			cx2072x->plbk_eq_changed = true;
+			cx2072x->plbk_drc_changed = true;
+			if (cx2072x->mclk) {
+				/* delayed mclk shutdown for 200ms */
+				mdelay(200);
+				clk_disable_unprepare(cx2072x->mclk);
+			}
+		}
+		break;
+	}
+
+	return 0;
+}
+
+static int cx2072x_probe(struct snd_soc_component *codec)
+{
+	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
+	int ret;
+	unsigned int ven_id;
+
+	cx2072x->codec = codec;
+
+	regmap_read(cx2072x->regmap, CX2072X_VENDOR_ID, &ven_id);
+	regmap_read(cx2072x->regmap, CX2072X_REVISION_ID, &cx2072x->rev_id);
+
+	dev_info(codec->dev, "codec version: %08x,%08x\n",
+		 ven_id, cx2072x->rev_id);
+
+	/*
+	 * Check if MCLK is specified, if not the clock is control by machine
+	 * driver
+	 */
+	cx2072x->mclk = devm_clk_get(codec->dev, "mclk");
+	if (IS_ERR(cx2072x->mclk)) {
+		ret = PTR_ERR(cx2072x->mclk);
+		if (ret == -ENOENT) {
+			if (IS_ERR(cx2072x->mclk)) {
+				dev_warn(codec->dev, "Assuming static MCLK\n");
+				cx2072x->mclk = NULL;
+				ret = 0;
+			}
+		} else {
+			dev_err(codec->dev, "Failed to get MCLK: %d\n", ret);
+			return ret;
+		}
+	}
+
+	dev_dbg(codec->dev, "Initialize codec\n");
+
+	/* enable clock for codec access */
+	if (cx2072x->mclk)
+		ret = clk_prepare_enable(cx2072x->mclk);
+
+	cx2072x_init(codec);
+
+	ret = regmap_register_patch(cx2072x->regmap, cx2072x_patch,
+				    ARRAY_SIZE(cx2072x_patch));
+	if (ret)
+		return ret;
+	regmap_write(cx2072x->regmap, CX2072X_AFG_POWER_STATE, 3);
+	regcache_cache_only(cx2072x->regmap, true);
+
+	/* disable clock */
+	if (cx2072x->mclk)
+		clk_disable_unprepare(cx2072x->mclk);
+
+	return ret;
+}
+
+static void cx2072x_remove(struct snd_soc_component *codec)
+{
+	/* power off device */
+	snd_soc_component_force_bias_level(codec, SND_SOC_BIAS_OFF);
+}
+
+static bool cx2072x_readable_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case CX2072X_VENDOR_ID:
+	case CX2072X_REVISION_ID:
+	case CX2072X_CURRENT_BCLK_FREQUENCY:
+	case CX2072X_AFG_POWER_STATE:
+	case CX2072X_UM_RESPONSE:
+	case CX2072X_GPIO_DATA:
+	case CX2072X_GPIO_ENABLE:
+	case CX2072X_GPIO_DIRECTION:
+	case CX2072X_GPIO_WAKE:
+	case CX2072X_GPIO_UM_ENABLE:
+	case CX2072X_GPIO_STICKY_MASK:
+	case CX2072X_DAC1_CONVERTER_FORMAT:
+	case CX2072X_DAC1_AMP_GAIN_RIGHT:
+	case CX2072X_DAC1_AMP_GAIN_LEFT:
+	case CX2072X_DAC1_POWER_STATE:
+	case CX2072X_DAC1_CONVERTER_STREAM_CHANNEL:
+	case CX2072X_DAC1_EAPD_ENABLE:
+	case CX2072X_DAC2_CONVERTER_FORMAT:
+	case CX2072X_DAC2_AMP_GAIN_RIGHT:
+	case CX2072X_DAC2_AMP_GAIN_LEFT:
+	case CX2072X_DAC2_POWER_STATE:
+	case CX2072X_DAC2_CONVERTER_STREAM_CHANNEL:
+	case CX2072X_ADC1_CONVERTER_FORMAT:
+	case CX2072X_ADC1_AMP_GAIN_RIGHT_0:
+	case CX2072X_ADC1_AMP_GAIN_LEFT_0:
+	case CX2072X_ADC1_AMP_GAIN_RIGHT_1:
+	case CX2072X_ADC1_AMP_GAIN_LEFT_1:
+	case CX2072X_ADC1_AMP_GAIN_RIGHT_2:
+	case CX2072X_ADC1_AMP_GAIN_LEFT_2:
+	case CX2072X_ADC1_AMP_GAIN_RIGHT_3:
+	case CX2072X_ADC1_AMP_GAIN_LEFT_3:
+	case CX2072X_ADC1_AMP_GAIN_RIGHT_4:
+	case CX2072X_ADC1_AMP_GAIN_LEFT_4:
+	case CX2072X_ADC1_AMP_GAIN_RIGHT_5:
+	case CX2072X_ADC1_AMP_GAIN_LEFT_5:
+	case CX2072X_ADC1_AMP_GAIN_RIGHT_6:
+	case CX2072X_ADC1_AMP_GAIN_LEFT_6:
+	case CX2072X_ADC1_CONNECTION_SELECT_CONTROL:
+	case CX2072X_ADC1_POWER_STATE:
+	case CX2072X_ADC1_CONVERTER_STREAM_CHANNEL:
+	case CX2072X_ADC2_CONVERTER_FORMAT:
+	case CX2072X_ADC2_AMP_GAIN_RIGHT_0:
+	case CX2072X_ADC2_AMP_GAIN_LEFT_0:
+	case CX2072X_ADC2_AMP_GAIN_RIGHT_1:
+	case CX2072X_ADC2_AMP_GAIN_LEFT_1:
+	case CX2072X_ADC2_AMP_GAIN_RIGHT_2:
+	case CX2072X_ADC2_AMP_GAIN_LEFT_2:
+	case CX2072X_ADC2_CONNECTION_SELECT_CONTROL:
+	case CX2072X_ADC2_POWER_STATE:
+	case CX2072X_ADC2_CONVERTER_STREAM_CHANNEL:
+	case CX2072X_PORTA_CONNECTION_SELECT_CTRL:
+	case CX2072X_PORTA_POWER_STATE:
+	case CX2072X_PORTA_PIN_CTRL:
+	case CX2072X_PORTA_UNSOLICITED_RESPONSE:
+	case CX2072X_PORTA_PIN_SENSE:
+	case CX2072X_PORTA_EAPD_BTL:
+	case CX2072X_PORTB_POWER_STATE:
+	case CX2072X_PORTB_PIN_CTRL:
+	case CX2072X_PORTB_UNSOLICITED_RESPONSE:
+	case CX2072X_PORTB_PIN_SENSE:
+	case CX2072X_PORTB_EAPD_BTL:
+	case CX2072X_PORTB_GAIN_RIGHT:
+	case CX2072X_PORTB_GAIN_LEFT:
+	case CX2072X_PORTC_POWER_STATE:
+	case CX2072X_PORTC_PIN_CTRL:
+	case CX2072X_PORTC_GAIN_RIGHT:
+	case CX2072X_PORTC_GAIN_LEFT:
+	case CX2072X_PORTD_POWER_STATE:
+	case CX2072X_PORTD_PIN_CTRL:
+	case CX2072X_PORTD_UNSOLICITED_RESPONSE:
+	case CX2072X_PORTD_PIN_SENSE:
+	case CX2072X_PORTD_GAIN_RIGHT:
+	case CX2072X_PORTD_GAIN_LEFT:
+	case CX2072X_PORTE_CONNECTION_SELECT_CTRL:
+	case CX2072X_PORTE_POWER_STATE:
+	case CX2072X_PORTE_PIN_CTRL:
+	case CX2072X_PORTE_UNSOLICITED_RESPONSE:
+	case CX2072X_PORTE_PIN_SENSE:
+	case CX2072X_PORTE_EAPD_BTL:
+	case CX2072X_PORTE_GAIN_RIGHT:
+	case CX2072X_PORTE_GAIN_LEFT:
+	case CX2072X_PORTF_POWER_STATE:
+	case CX2072X_PORTF_PIN_CTRL:
+	case CX2072X_PORTF_UNSOLICITED_RESPONSE:
+	case CX2072X_PORTF_PIN_SENSE:
+	case CX2072X_PORTF_GAIN_RIGHT:
+	case CX2072X_PORTF_GAIN_LEFT:
+	case CX2072X_PORTG_POWER_STATE:
+	case CX2072X_PORTG_PIN_CTRL:
+	case CX2072X_PORTG_CONNECTION_SELECT_CTRL:
+	case CX2072X_PORTG_EAPD_BTL:
+	case CX2072X_PORTM_POWER_STATE:
+	case CX2072X_PORTM_PIN_CTRL:
+	case CX2072X_PORTM_CONNECTION_SELECT_CTRL:
+	case CX2072X_PORTM_EAPD_BTL:
+	case CX2072X_MIXER_POWER_STATE:
+	case CX2072X_MIXER_GAIN_RIGHT_0:
+	case CX2072X_MIXER_GAIN_LEFT_0:
+	case CX2072X_MIXER_GAIN_RIGHT_1:
+	case CX2072X_MIXER_GAIN_LEFT_1:
+	case CX2072X_EQ_ENABLE_BYPASS:
+	case CX2072X_EQ_B0_COEFF:
+	case CX2072X_EQ_B1_COEFF:
+	case CX2072X_EQ_B2_COEFF:
+	case CX2072X_EQ_A1_COEFF:
+	case CX2072X_EQ_A2_COEFF:
+	case CX2072X_EQ_G_COEFF:
+	case CX2072X_SPKR_DRC_ENABLE_STEP:
+	case CX2072X_SPKR_DRC_CONTROL:
+	case CX2072X_SPKR_DRC_TEST:
+	case CX2072X_DIGITAL_BIOS_TEST0:
+	case CX2072X_DIGITAL_BIOS_TEST2:
+	case CX2072X_I2SPCM_CONTROL1:
+	case CX2072X_I2SPCM_CONTROL2:
+	case CX2072X_I2SPCM_CONTROL3:
+	case CX2072X_I2SPCM_CONTROL4:
+	case CX2072X_I2SPCM_CONTROL5:
+	case CX2072X_I2SPCM_CONTROL6:
+	case CX2072X_UM_INTERRUPT_CRTL_E:
+	case CX2072X_CODEC_TEST2:
+	case CX2072X_CODEC_TEST9:
+	case CX2072X_CODEC_TEST20:
+	case CX2072X_CODEC_TEST26:
+	case CX2072X_ANALOG_TEST4:
+	case CX2072X_ANALOG_TEST5:
+	case CX2072X_ANALOG_TEST6:
+	case CX2072X_ANALOG_TEST7:
+	case CX2072X_ANALOG_TEST8:
+	case CX2072X_ANALOG_TEST9:
+	case CX2072X_ANALOG_TEST10:
+	case CX2072X_ANALOG_TEST11:
+	case CX2072X_ANALOG_TEST12:
+	case CX2072X_ANALOG_TEST13:
+	case CX2072X_DIGITAL_TEST0:
+	case CX2072X_DIGITAL_TEST1:
+	case CX2072X_DIGITAL_TEST11:
+	case CX2072X_DIGITAL_TEST12:
+	case CX2072X_DIGITAL_TEST15:
+	case CX2072X_DIGITAL_TEST16:
+	case CX2072X_DIGITAL_TEST17:
+	case CX2072X_DIGITAL_TEST18:
+	case CX2072X_DIGITAL_TEST19:
+	case CX2072X_DIGITAL_TEST20:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool cx2072x_volatile_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case CX2072X_VENDOR_ID:
+	case CX2072X_REVISION_ID:
+	case CX2072X_UM_INTERRUPT_CRTL_E:
+	case CX2072X_DIGITAL_TEST11:
+	case CX2072X_PORTA_PIN_SENSE:
+	case CX2072X_PORTB_PIN_SENSE:
+	case CX2072X_PORTD_PIN_SENSE:
+	case CX2072X_PORTE_PIN_SENSE:
+	case CX2072X_PORTF_PIN_SENSE:
+	case CX2072X_EQ_G_COEFF:
+	case CX2072X_EQ_BAND:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct snd_soc_component_driver soc_codec_driver_cx2072x = {
+	.probe = cx2072x_probe,
+	.remove = cx2072x_remove,
+	.set_bias_level = cx2072x_set_bias_level,
+	.controls = cx2072x_snd_controls,
+	.num_controls = ARRAY_SIZE(cx2072x_snd_controls),
+	.dapm_widgets = cx2072x_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(cx2072x_dapm_widgets),
+	.dapm_routes = cx2072x_intercon,
+	.num_dapm_routes = ARRAY_SIZE(cx2072x_intercon),
+};
+
+/*
+ * DAI ops
+ */
+static struct snd_soc_dai_ops cx2072x_dai_ops = {
+	.set_sysclk = cx2072x_set_dai_sysclk,
+	.set_fmt = cx2072x_set_dai_fmt,
+	.hw_params = cx2072x_hw_params,
+	.shutdown = cx2072x_shutdown,
+	.set_bclk_ratio = cx2072x_set_dai_bclk_ratio,
+};
+
+static int cx2072x_dsp_dai_probe(struct snd_soc_dai *dai)
+{
+	struct cx2072x_priv *cx2072x =
+		snd_soc_component_get_drvdata(dai->component);
+
+	cx2072x->en_aec_ref = true;
+	return 0;
+}
+
+#define CX2072X_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
+
+static struct snd_soc_dai_driver soc_codec_cx2072x_dai[] = {
+	{ /* playback and capture */
+		.name = "cx2072x-hifi",
+		.id	= CX2072X_DAI_HIFI,
+		.playback = {
+			.stream_name = "Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = CX2072X_RATES_DSP,
+			.formats = CX2072X_FORMATS,
+		},
+		.capture = {
+			.stream_name = "Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = CX2072X_RATES_DSP,
+			.formats = CX2072X_FORMATS,
+		},
+		.ops = &cx2072x_dai_ops,
+		.symmetric_rates = 1,
+	},
+	{ /* plabayck only, return echo reference to Conexant DSP chip */
+		.name = "cx2072x-dsp",
+		.id	= CX2072X_DAI_DSP,
+		.probe = cx2072x_dsp_dai_probe,
+		.playback = {
+			.stream_name = "Playback",
+			.channels_min = 2,
+			.channels_max = 2,
+			.rates = CX2072X_RATES_DSP,
+			.formats = CX2072X_FORMATS,
+		},
+		.ops = &cx2072x_dai_ops,
+	},
+	{ /* plabayck only, return echo reference through I2S TX */
+		.name = "cx2072x-aec",
+		.id	= 3,
+		.capture = {
+			.stream_name = "Capture",
+			.channels_min = 2,
+			.channels_max = 2,
+			.rates = CX2072X_RATES_DSP,
+			.formats = CX2072X_FORMATS,
+		},
+	},
+};
+EXPORT_SYMBOL_GPL(soc_codec_cx2072x_dai);
+
+static const struct regmap_config cx2072x_regmap = {
+	.reg_bits = 16,
+	.val_bits = 32,
+	.max_register = CX2072X_REG_MAX,
+	.reg_defaults = cx2072x_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(cx2072x_reg_defaults),
+	.cache_type = REGCACHE_RBTREE,
+	.readable_reg = cx2072x_readable_register,
+	.volatile_reg = cx2072x_volatile_register,
+	/* Needs custom READ/WRITE functions for various register lengths */
+	.reg_read = cx2072x_reg_read,
+	.reg_write = cx2072x_reg_write,
+};
+
+static int cx2072x_i2c_probe(struct i2c_client *i2c,
+			     const struct i2c_device_id *id)
+{
+	struct cx2072x_priv *cx2072x;
+
+	cx2072x = devm_kzalloc(&i2c->dev, sizeof(struct cx2072x_priv),
+			       GFP_KERNEL);
+	if (!cx2072x)
+		return -ENOMEM;
+
+	cx2072x->regmap = devm_regmap_init(&i2c->dev, NULL, i2c,
+					   &cx2072x_regmap);
+	if (IS_ERR(cx2072x->regmap))
+		return PTR_ERR(cx2072x->regmap);
+
+	mutex_init(&cx2072x->eq_coeff_lock);
+
+	i2c_set_clientdata(i2c, cx2072x);
+
+	cx2072x->dev = &i2c->dev;
+	cx2072x->pll_changed = true;
+	cx2072x->i2spcm_changed = true;
+	cx2072x->bclk_ratio = 0;
+
+	return snd_soc_register_component(cx2072x->dev,
+					  &soc_codec_driver_cx2072x,
+					  soc_codec_cx2072x_dai,
+					  ARRAY_SIZE(soc_codec_cx2072x_dai));
+}
+
+static int cx2072x_i2c_remove(struct i2c_client *client)
+{
+	snd_soc_unregister_component(&client->dev);
+	return 0;
+}
+
+static const struct i2c_device_id cx2072x_i2c_id[] = {
+	{ "cx20721", 0 },
+	{ "cx20723", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, cx2072x_i2c_id);
+
+#ifdef CONFIG_ACPI
+static struct acpi_device_id cx2072x_acpi_match[] = {
+	{ "14F10720", 0 },
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, cx2072x_acpi_match);
+#endif
+
+static struct i2c_driver cx2072x_i2c_driver = {
+	.probe = cx2072x_i2c_probe,
+	.remove = cx2072x_i2c_remove,
+	.id_table = cx2072x_i2c_id,
+	.driver = {
+		.name = "cx2072x",
+		.acpi_match_table = ACPI_PTR(cx2072x_acpi_match),
+	},
+};
+
+module_i2c_driver(cx2072x_i2c_driver);
+
+MODULE_DESCRIPTION("ASoC cx2072x Codec Driver");
+MODULE_AUTHOR("Simon Ho <simon.ho@conexant.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/cx2072x.h b/sound/soc/codecs/cx2072x.h
new file mode 100644
index 000000000000..3f9ba1681383
--- /dev/null
+++ b/sound/soc/codecs/cx2072x.h
@@ -0,0 +1,317 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// ALSA SoC CX20721/CX20723 codec driver
+//
+// Copyright:	(C) 2017 Conexant Systems, Inc.
+// Author:	Simon Ho, <Simon.ho@conexant.com>
+//
+
+#ifndef __CX2072X_H__
+#define __CX2072X_H__
+
+#define CX2072X_MCLK_PLL		1
+#define CX2072X_MCLK_EXTERNAL_PLL	1
+#define CX2072X_MCLK_INTERNAL_OSC	2
+
+/*#define CX2072X_RATES		SNDRV_PCM_RATE_8000_192000*/
+#define CX2072X_RATES_DSP	SNDRV_PCM_RATE_48000
+
+#define CX2072X_REG_MAX					0x8a3c
+
+#define CX2072X_VENDOR_ID				0x0200
+#define CX2072X_REVISION_ID				0x0208
+#define CX2072X_CURRENT_BCLK_FREQUENCY			0x00dc
+#define CX2072X_AFG_POWER_STATE				0x0414
+#define CX2072X_UM_RESPONSE				0x0420
+#define CX2072X_GPIO_DATA				0x0454
+#define CX2072X_GPIO_ENABLE				0x0458
+#define CX2072X_GPIO_DIRECTION				0x045c
+#define CX2072X_GPIO_WAKE				0x0460
+#define CX2072X_GPIO_UM_ENABLE				0x0464
+#define CX2072X_GPIO_STICKY_MASK			0x0468
+#define CX2072X_AFG_FUNCTION_RESET			0x07fc
+#define CX2072X_DAC1_CONVERTER_FORMAT			0x43c8
+#define CX2072X_DAC1_AMP_GAIN_RIGHT			0x41c0
+#define CX2072X_DAC1_AMP_GAIN_LEFT			0x41e0
+#define CX2072X_DAC1_POWER_STATE			0x4014
+#define CX2072X_DAC1_CONVERTER_STREAM_CHANNEL		0x4018
+#define CX2072X_DAC1_EAPD_ENABLE			0x4030
+#define CX2072X_DAC2_CONVERTER_FORMAT			0x47c8
+#define CX2072X_DAC2_AMP_GAIN_RIGHT			0x45c0
+#define CX2072X_DAC2_AMP_GAIN_LEFT			0x45e0
+#define CX2072X_DAC2_POWER_STATE			0x4414
+#define CX2072X_DAC2_CONVERTER_STREAM_CHANNEL		0x4418
+#define CX2072X_ADC1_CONVERTER_FORMAT			0x4fc8
+#define CX2072X_ADC1_AMP_GAIN_RIGHT_0			0x4d80
+#define CX2072X_ADC1_AMP_GAIN_LEFT_0			0x4da0
+#define CX2072X_ADC1_AMP_GAIN_RIGHT_1			0x4d84
+#define CX2072X_ADC1_AMP_GAIN_LEFT_1			0x4da4
+#define CX2072X_ADC1_AMP_GAIN_RIGHT_2			0x4d88
+#define CX2072X_ADC1_AMP_GAIN_LEFT_2			0x4da8
+#define CX2072X_ADC1_AMP_GAIN_RIGHT_3			0x4d8c
+#define CX2072X_ADC1_AMP_GAIN_LEFT_3			0x4dac
+#define CX2072X_ADC1_AMP_GAIN_RIGHT_4			0x4d90
+#define CX2072X_ADC1_AMP_GAIN_LEFT_4			0x4db0
+#define CX2072X_ADC1_AMP_GAIN_RIGHT_5			0x4d94
+#define CX2072X_ADC1_AMP_GAIN_LEFT_5			0x4db4
+#define CX2072X_ADC1_AMP_GAIN_RIGHT_6			0x4d98
+#define CX2072X_ADC1_AMP_GAIN_LEFT_6			0x4db8
+#define CX2072X_ADC1_CONNECTION_SELECT_CONTROL		0x4c04
+#define CX2072X_ADC1_POWER_STATE			0x4c14
+#define CX2072X_ADC1_CONVERTER_STREAM_CHANNEL		0x4c18
+#define CX2072X_ADC2_CONVERTER_FORMAT			0x53c8
+#define CX2072X_ADC2_AMP_GAIN_RIGHT_0			0x5180
+#define CX2072X_ADC2_AMP_GAIN_LEFT_0			0x51a0
+#define CX2072X_ADC2_AMP_GAIN_RIGHT_1			0x5184
+#define CX2072X_ADC2_AMP_GAIN_LEFT_1			0x51a4
+#define CX2072X_ADC2_AMP_GAIN_RIGHT_2			0x5188
+#define CX2072X_ADC2_AMP_GAIN_LEFT_2			0x51a8
+#define CX2072X_ADC2_CONNECTION_SELECT_CONTROL		0x5004
+#define CX2072X_ADC2_POWER_STATE			0x5014
+#define CX2072X_ADC2_CONVERTER_STREAM_CHANNEL		0x5018
+#define CX2072X_PORTA_CONNECTION_SELECT_CTRL		0x5804
+#define CX2072X_PORTA_POWER_STATE			0x5814
+#define CX2072X_PORTA_PIN_CTRL				0x581c
+#define CX2072X_PORTA_UNSOLICITED_RESPONSE		0x5820
+#define CX2072X_PORTA_PIN_SENSE				0x5824
+#define CX2072X_PORTA_EAPD_BTL				0x5830
+#define CX2072X_PORTB_POWER_STATE			0x6014
+#define CX2072X_PORTB_PIN_CTRL				0x601c
+#define CX2072X_PORTB_UNSOLICITED_RESPONSE		0x6020
+#define CX2072X_PORTB_PIN_SENSE				0x6024
+#define CX2072X_PORTB_EAPD_BTL				0x6030
+#define CX2072X_PORTB_GAIN_RIGHT			0x6180
+#define CX2072X_PORTB_GAIN_LEFT				0x61a0
+#define CX2072X_PORTC_POWER_STATE			0x6814
+#define CX2072X_PORTC_PIN_CTRL				0x681c
+#define CX2072X_PORTC_GAIN_RIGHT			0x6980
+#define CX2072X_PORTC_GAIN_LEFT				0x69a0
+#define CX2072X_PORTD_POWER_STATE			0x6414
+#define CX2072X_PORTD_PIN_CTRL				0x641c
+#define CX2072X_PORTD_UNSOLICITED_RESPONSE		0x6420
+#define CX2072X_PORTD_PIN_SENSE				0x6424
+#define CX2072X_PORTD_GAIN_RIGHT			0x6580
+#define CX2072X_PORTD_GAIN_LEFT				0x65a0
+#define CX2072X_PORTE_CONNECTION_SELECT_CTRL		0x7404
+#define CX2072X_PORTE_POWER_STATE			0x7414
+#define CX2072X_PORTE_PIN_CTRL				0x741c
+#define CX2072X_PORTE_UNSOLICITED_RESPONSE		0x7420
+#define CX2072X_PORTE_PIN_SENSE				0x7424
+#define CX2072X_PORTE_EAPD_BTL				0x7430
+#define CX2072X_PORTE_GAIN_RIGHT			0x7580
+#define CX2072X_PORTE_GAIN_LEFT				0x75a0
+#define CX2072X_PORTF_POWER_STATE			0x7814
+#define CX2072X_PORTF_PIN_CTRL				0x781c
+#define CX2072X_PORTF_UNSOLICITED_RESPONSE		0x7820
+#define CX2072X_PORTF_PIN_SENSE				0x7824
+#define CX2072X_PORTF_GAIN_RIGHT			0x7980
+#define CX2072X_PORTF_GAIN_LEFT				0x79a0
+#define CX2072X_PORTG_POWER_STATE			0x5c14
+#define CX2072X_PORTG_PIN_CTRL				0x5c1c
+#define CX2072X_PORTG_CONNECTION_SELECT_CTRL		0x5c04
+#define CX2072X_PORTG_EAPD_BTL				0x5c30
+#define CX2072X_PORTM_POWER_STATE			0x8814
+#define CX2072X_PORTM_PIN_CTRL				0x881c
+#define CX2072X_PORTM_CONNECTION_SELECT_CTRL		0x8804
+#define CX2072X_PORTM_EAPD_BTL				0x8830
+#define CX2072X_MIXER_POWER_STATE			0x5414
+#define CX2072X_MIXER_GAIN_RIGHT_0			0x5580
+#define CX2072X_MIXER_GAIN_LEFT_0			0x55a0
+#define CX2072X_MIXER_GAIN_RIGHT_1			0x5584
+#define CX2072X_MIXER_GAIN_LEFT_1			0x55a4
+#define CX2072X_EQ_ENABLE_BYPASS			0x6d00
+#define CX2072X_EQ_B0_COEFF				0x6d02
+#define CX2072X_EQ_B1_COEFF				0x6d04
+#define CX2072X_EQ_B2_COEFF				0x6d06
+#define CX2072X_EQ_A1_COEFF				0x6d08
+#define CX2072X_EQ_A2_COEFF				0x6d0a
+#define CX2072X_EQ_G_COEFF				0x6d0c
+#define CX2072X_EQ_BAND					0x6d0d
+#define CX2072X_SPKR_DRC_ENABLE_STEP			0x6d10
+#define CX2072X_SPKR_DRC_CONTROL			0x6d14
+#define CX2072X_SPKR_DRC_TEST				0x6d18
+#define CX2072X_DIGITAL_BIOS_TEST0			0x6d80
+#define CX2072X_DIGITAL_BIOS_TEST2			0x6d84
+#define CX2072X_I2SPCM_CONTROL1				0x6e00
+#define CX2072X_I2SPCM_CONTROL2				0x6e04
+#define CX2072X_I2SPCM_CONTROL3				0x6e08
+#define CX2072X_I2SPCM_CONTROL4				0x6e0c
+#define CX2072X_I2SPCM_CONTROL5				0x6e10
+#define CX2072X_I2SPCM_CONTROL6				0x6e18
+#define CX2072X_UM_INTERRUPT_CRTL_E			0x6e14
+#define CX2072X_CODEC_TEST2				0x7108
+#define CX2072X_CODEC_TEST9				0x7124
+#define CX2072X_CODEC_TEST20				0x7310
+#define CX2072X_CODEC_TEST26				0x7328
+#define CX2072X_ANALOG_TEST3				0x718c
+#define CX2072X_ANALOG_TEST4				0x7190
+#define CX2072X_ANALOG_TEST5				0x7194
+#define CX2072X_ANALOG_TEST6				0x7198
+#define CX2072X_ANALOG_TEST7				0x719c
+#define CX2072X_ANALOG_TEST8				0x71a0
+#define CX2072X_ANALOG_TEST9				0x71a4
+#define CX2072X_ANALOG_TEST10				0x71a8
+#define CX2072X_ANALOG_TEST11				0x71ac
+#define CX2072X_ANALOG_TEST12				0x71b0
+#define CX2072X_ANALOG_TEST13				0x71b4
+#define CX2072X_DIGITAL_TEST0				0x7200
+#define CX2072X_DIGITAL_TEST1				0x7204
+#define CX2072X_DIGITAL_TEST11				0x722c
+#define CX2072X_DIGITAL_TEST12				0x7230
+#define CX2072X_DIGITAL_TEST15				0x723c
+#define CX2072X_DIGITAL_TEST16				0x7080
+#define CX2072X_DIGITAL_TEST17				0x7084
+#define CX2072X_DIGITAL_TEST18				0x7088
+#define CX2072X_DIGITAL_TEST19				0x708c
+#define CX2072X_DIGITAL_TEST20				0x7090
+
+#define CX2072X_MAX_EQ_BAND	7
+#define CX2072X_MAX_EQ_COEFF	11
+#define CX2072X_MAX_DRC_REGS	9
+#define CX2072X_MIC_EQ_COEFF	10
+
+/* DAI interfae type */
+#define CX2072X_DAI_HIFI	1
+#define CX2072X_DAI_DSP		2
+#define CX2072X_DAI_DSP_PWM	3 /* 4 ch, including mic and AEC */
+
+enum cx2072x_jack_types {
+	CX2072X_JACK_NONE = 0x0000,
+	CX2072X_JACK_HEADPHONE = 0x0001,
+	CX2072X_JACK_APPLE_HEADSET = 0x0002,
+	CX2072X_JACK_NOKIE_HEADSET = 0x0003,
+};
+
+int snd_soc_cx2072x_enable_jack_detect(struct snd_soc_component *codec);
+int snd_soc_cx2072x_get_jack_state(struct snd_soc_component *codec);
+
+enum cx2072x_reg_sample_size {
+	CX2072X_SAMPLE_SIZE_8_BITS = 0,
+	CX2072X_SAMPLE_SIZE_16_BITS = 1,
+	CX2072X_SAMPLE_SIZE_24_BITS = 2,
+	CX2072X_SAMPLE_SIZE_RESERVED = 3,
+};
+
+union cx2072x_reg_i2spcm_ctrl_reg1 {
+	struct {
+		u32 rx_data_one_line:1;
+		u32 rx_ws_pol:1;
+		u32 rx_ws_wid:7;
+		u32 rx_frm_len:5;
+		u32 rx_sa_size:2;
+		u32 tx_data_one_line:1;
+		u32 tx_ws_pol:1;
+		u32 tx_ws_wid:7;
+		u32 tx_frm_len:5;
+		u32 tx_sa_size:2;
+	} r;
+	u32 ulval;
+};
+
+union cx2072x_reg_i2spcm_ctrl_reg2 {
+	struct {
+		u32 tx_en_ch1:1;
+		u32 tx_en_ch2:1;
+		u32 tx_en_ch3:1;
+		u32 tx_en_ch4:1;
+		u32 tx_en_ch5:1;
+		u32 tx_en_ch6:1;
+		u32 tx_slot_1:5;
+		u32 tx_slot_2:5;
+		u32 tx_slot_3:5;
+		u32 tx_slot_4:5;
+		u32 res:1;
+		u32 tx_data_neg_bclk:1;
+		u32 tx_master:1;
+		u32 tx_tri_n:1;
+		u32 tx_endian_sel:1;
+		u32 tx_dstart_dly:1;
+	} r;
+	u32 ulval;
+};
+
+union cx2072x_reg_i2spcm_ctrl_reg3 {
+	struct {
+		u32 rx_en_ch1:1;
+		u32 rx_en_ch2:1;
+		u32 rx_en_ch3:1;
+		u32 rx_en_ch4:1;
+		u32 rx_en_ch5:1;
+		u32 rx_en_ch6:1;
+		u32 rx_slot_1:5;
+		u32 rx_slot_2:5;
+		u32 rx_slot_3:5;
+		u32 rx_slot_4:5;
+		u32 res:1;
+		u32 rx_data_neg_bclk:1;
+		u32 rx_master:1;
+		u32 rx_tri_n:1;
+		u32 rx_endian_sel:1;
+		u32 rx_dstart_dly:1;
+	} r;
+	u32 ulval;
+};
+
+union cx2072x_reg_i2spcm_ctrl_reg4 {
+	struct {
+		u32 rx_mute:1;
+		u32 tx_mute:1;
+		u32 reserved:1;
+		u32 dac_34_independent:1;
+		u32 dac_bclk_lrck_share:1;
+		u32 bclk_lrck_share_en:1;
+		u32 reserved2:2;
+		u32 rx_last_dac_ch_en:1;
+		u32 rx_last_dac_ch:3;
+		u32 tx_last_adc_ch_en:1;
+		u32 tx_last_adc_ch:3;
+		u32 rx_slot_5:5;
+		u32 rx_slot_6:5;
+		u32 reserved3:6;
+	} r;
+	u32 ulval;
+};
+
+union cx2072x_reg_i2spcm_ctrl_reg5 {
+	struct {
+		u32 tx_slot_5:5;
+		u32 reserved:3;
+		u32 tx_slot_6:5;
+		u32 reserved2:3;
+		u32 reserved3:8;
+		u32 i2s_pcm_clk_div:7;
+		u32 i2s_pcm_clk_div_chan_en:1;
+	} r;
+	u32 ulval;
+};
+
+union cx2072x_reg_i2spcm_ctrl_reg6 {
+	struct {
+		u32 reserved:5;
+		u32 rx_pause_cycles:3;
+		u32 rx_pause_start_pos:8;
+		u32 reserved2:5;
+		u32 tx_pause_cycles:3;
+		u32 tx_pause_start_pos:8;
+	} r;
+	u32 ulval;
+};
+
+union cx2072x_reg_digital_bios_test2 {
+	struct {
+		u32 pull_down_eapd:2;
+		u32 input_en_eapd_pad:1;
+		u32 push_pull_mode:1;
+		u32 eapd_pad_output_driver:2;
+		u32 pll_source:1;
+		u32 i2s_bclk_en:1;
+		u32 i2s_bclk_invert:1;
+		u32 pll_ref_clock:1;
+		u32 class_d_shield_clk:1;
+		u32 audio_pll_bypass_mode:1;
+		u32 reserved:4;
+	} r;
+	u32 ulval;
+};
+
+#endif /* __CX2072X_H__ */
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
