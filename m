Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D35ACA4FA50
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Mar 2025 10:38:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BBD46034F;
	Wed,  5 Mar 2025 10:38:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BBD46034F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741167496;
	bh=EbEGekxAf+6p5j5c0d9uD01QEWG8wXghSCW8IizV7vU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Wz7HdJZh+LX3CqTJU9kl1E+OpFvJkAgtp1PxbxKott9Lc1AJcHjAvwQn3DK87yZPc
	 LMV8c0sNoQglXufjXgPxu4KYLj/MqeBQBZ00GE/jKDSoKOb8Vu1itgl+8P8Iz55Hlm
	 0BHh0WE+aNJvjl33KtJ7RsgNicm8an6HlsAkDpL8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADE35F806B8; Wed,  5 Mar 2025 10:36:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54737F805C3;
	Wed,  5 Mar 2025 10:36:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31A25F8047D; Fri, 28 Feb 2025 11:03:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail78-50.sinamail.sina.com.cn (mail78-50.sinamail.sina.com.cn
 [219.142.78.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7931BF800BD
	for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2025 11:02:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7931BF800BD
Received: from unknown (HELO
 zy-virtual-machine.localdomain)([180.159.108.137])
	by sina.net (10.185.250.30) with ESMTP
	id 67C189C6000068CE; Fri, 28 Feb 2025 18:02:49 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: CA9632582C364580AD8C9354A367AA2B
X-SMAIL-UIID: CA9632582C364580AD8C9354A367AA2B-20250228-180249
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v1 1/2] ASoC: codecs: add support for ES8389
Date: Fri, 28 Feb 2025 18:02:44 +0800
Message-Id: <20250228100245.127413-2-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250228100245.127413-1-zhangyi@everest-semi.com>
References: <20250228100245.127413-1-zhangyi@everest-semi.com>
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QZT2OLZYTG343THXGXHOTQZRZCKJQOQE
X-Message-ID-Hash: QZT2OLZYTG343THXGXHOTQZRZCKJQOQE
X-Mailman-Approved-At: Wed, 05 Mar 2025 09:36:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QZT2OLZYTG343THXGXHOTQZRZCKJQOQE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver is for codec es8389 of everest

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/Kconfig  |   6 +-
 sound/soc/codecs/Makefile |   2 +
 sound/soc/codecs/es8389.c | 985 ++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/es8389.h | 139 ++++++
 4 files changed, 1131 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/codecs/es8389.c
 create mode 100644 sound/soc/codecs/es8389.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 5446e284a196..d5968a8bcb4a 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -116,6 +116,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_ES8316
 	imply SND_SOC_ES8323
 	imply SND_SOC_ES8326
+	imply SND_SOC_ES8389
 	imply SND_SOC_ES8328_SPI
 	imply SND_SOC_ES8328_I2C
 	imply SND_SOC_ES7134
@@ -1174,6 +1175,10 @@ config SND_SOC_ES8326
 	tristate "Everest Semi ES8326 CODEC"
 	depends on I2C
 
+config SND_SOC_ES8389
+	tristate "Everest Semi ES8389 CODEC"
+	depends on I2C
+
 config SND_SOC_ES8328
 	tristate
 
@@ -2665,4 +2670,3 @@ config SND_SOC_LPASS_TX_MACRO
 	tristate "Qualcomm TX Macro in LPASS(Low Power Audio SubSystem)"
 
 endmenu
-
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 405391b6bf9c..9bb099e8fbf8 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -129,6 +129,7 @@ snd-soc-es8311-y := es8311.o
 snd-soc-es8316-y := es8316.o
 snd-soc-es8323-y := es8323.o
 snd-soc-es8326-y := es8326.o
+snd-soc-es8389-y := es8389.o
 snd-soc-es8328-y := es8328.o
 snd-soc-es8328-i2c-y := es8328-i2c.o
 snd-soc-es8328-spi-y := es8328-spi.o
@@ -546,6 +547,7 @@ obj-$(CONFIG_SND_SOC_ES8311)    += snd-soc-es8311.o
 obj-$(CONFIG_SND_SOC_ES8316)    += snd-soc-es8316.o
 obj-$(CONFIG_SND_SOC_ES8323)	+= snd-soc-es8323.o
 obj-$(CONFIG_SND_SOC_ES8326)    += snd-soc-es8326.o
+obj-$(CONFIG_SND_SOC_ES8389)    += snd-soc-es8389.o
 obj-$(CONFIG_SND_SOC_ES8328)	+= snd-soc-es8328.o
 obj-$(CONFIG_SND_SOC_ES8328_I2C)+= snd-soc-es8328-i2c.o
 obj-$(CONFIG_SND_SOC_ES8328_SPI)+= snd-soc-es8328-spi.o
diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
new file mode 100644
index 000000000000..bc0ccada118c
--- /dev/null
+++ b/sound/soc/codecs/es8389.c
@@ -0,0 +1,985 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * es8389.c  --  ES8389/ES8390 ALSA SoC Audio Codec
+ *
+ * Copyright (C) 2025 Everest Semiconductor Co., Ltd
+ *
+ * Authors:  Michael Zhang (zhangyi@everest-semi.com)
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/tlv.h>
+#include <sound/soc.h>
+
+#include "es8389.h"
+
+
+/* codec private data */
+
+struct	es8389_private {
+	struct snd_soc_component *component;
+	struct regmap *regmap;
+	struct clk *mclk;
+	unsigned int sysclk;
+	int mastermode;
+
+	u8 adc_slot;
+	u8 dac_slot;
+	int dmic;
+	u8 mclk_src;
+	enum snd_soc_bias_level bias_level;
+};
+
+static bool es8389_volatile_register(struct device *dev,
+			unsigned int reg)
+{
+	if ((reg  <= 0xff))
+		return true;
+	else
+		return false;
+}
+
+static const DECLARE_TLV_DB_SCALE(dac_vol_tlv, -9550, 50, 0);
+static const DECLARE_TLV_DB_SCALE(adc_vol_tlv, -9550, 50, 0);
+static const DECLARE_TLV_DB_SCALE(pga_vol_tlv, 0, 300, 0);
+static const DECLARE_TLV_DB_SCALE(mix_vol_tlv, -9500, 100, 0);
+static const DECLARE_TLV_DB_SCALE(alc_target_tlv, -3200, 200, 0);
+static const DECLARE_TLV_DB_SCALE(alc_max_level, -3200, 200, 0);
+
+static const char *const alc[] = {
+	"ALC OFF",
+	"ADCR ALC ON",
+	"ADCL ALC ON",
+	"ADCL & ADCL ALC ON",
+};
+
+static const char *const ramprate[] = {
+	"0.125db/1  LRCK",
+	"0.125db/4  LRCK",
+	"0.125db/8  LRCK",
+	"0.125db/16  LRCK",
+	"0.125db/32  LRCK",
+	"0.125db/64  LRCK",
+	"0.125db/128  LRCK",
+	"0.125db/256  LRCK",
+	"0.125db/512  LRCK",
+	"0.125db/1024  LRCK",
+	"0.125db/2048  LRCK",
+	"0.125db/4096  LRCK",
+	"0.125db/8192  LRCK",
+	"0.125db/16384  LRCK",
+	"0.125db/32768  LRCK",
+	"0.125db/65536  LRCK",
+};
+
+static const char *const winsize[] = {
+	"2 LRCK",
+	"4  LRCK",
+	"8  LRCK",
+	"16  LRCK",
+	"32  LRCK",
+	"64  LRCK",
+	"128  LRCK",
+	"256  LRCK",
+	"512  LRCK",
+	"1024  LRCK",
+	"2048  LRCK",
+	"4096  LRCK",
+	"8192  LRCK",
+	"16384  LRCK",
+	"32768  LRCK",
+	"65536  LRCK",
+};
+
+static const struct soc_enum alc_enable =
+	SOC_ENUM_SINGLE(ES8389_ALC_ON, 5, 4, alc);
+static const struct soc_enum alc_ramprate =
+	SOC_ENUM_SINGLE(ES8389_ALC_CTL, 4, 16, ramprate);
+static const struct soc_enum alc_winsize =
+	SOC_ENUM_SINGLE(ES8389_ALC_CTL, 0, 16, winsize);
+
+static const char *const es8389_outl_mux_txt[] = {
+	"Normal",
+	"DAC2 channel to DAC1 channel",
+};
+
+static const char *const es8389_outr_mux_txt[] = {
+	"Normal",
+	"DAC1 channel to DAC2 channel",
+};
+
+static const char *const es8389_dmic_mux_txt[] = {
+	"AMIC",
+	"DMIC",
+};
+
+static const char *const es8389_pga1_texts[] = {
+	"DifferentialL",  "Line 1P", "Line 2P"
+};
+
+static const char *const es8389_pga2_texts[] = {
+	"DifferentialR",  "Line 2N", "Line 1N"
+};
+
+static const unsigned int es8389_dmic_mux_values[] = {
+	0, 3
+};
+
+static const unsigned int es8389_pga_values[] = {
+	1, 5, 6
+};
+
+static const struct soc_enum es8389_outl_mux_enum =
+	SOC_ENUM_SINGLE(ES8389_DAC_MIX, 5,
+			ARRAY_SIZE(es8389_outl_mux_txt), es8389_outl_mux_txt);
+
+static const struct snd_kcontrol_new es8389_outl_mux_controls =
+	SOC_DAPM_ENUM("OUTL MUX", es8389_outl_mux_enum);
+
+static const struct soc_enum es8389_outr_mux_enum =
+	SOC_ENUM_SINGLE(ES8389_DAC_MIX, 4,
+			ARRAY_SIZE(es8389_outr_mux_txt), es8389_outr_mux_txt);
+
+static const struct snd_kcontrol_new es8389_outr_mux_controls =
+	SOC_DAPM_ENUM("OUTR MUX", es8389_outr_mux_enum);
+
+static const struct soc_enum es8389_dmic_mux_enum =
+	SOC_VALUE_ENUM_SINGLE(ES8389_DMIC_EN, 6, 3,
+			ARRAY_SIZE(es8389_dmic_mux_txt), es8389_dmic_mux_txt,
+			es8389_dmic_mux_values);
+
+static const struct soc_enum es8389_pgal_enum =
+	SOC_VALUE_ENUM_SINGLE(ES8389_MIC1_GAIN, 4, 7,
+			ARRAY_SIZE(es8389_pga1_texts), es8389_pga1_texts,
+			es8389_pga_values);
+
+static const struct soc_enum es8389_pgar_enum =
+	SOC_VALUE_ENUM_SINGLE(ES8389_MIC2_GAIN, 4, 7,
+			ARRAY_SIZE(es8389_pga2_texts), es8389_pga2_texts,
+			es8389_pga_values);
+
+static const struct snd_kcontrol_new es8389_dmic_mux_controls =
+	SOC_DAPM_ENUM("ADC MUX", es8389_dmic_mux_enum);
+
+static const struct snd_kcontrol_new es8389_left_mixer_controls[] = {
+	SOC_DAPM_SINGLE("DACR DACL Mixer", ES8389_DAC_MIX, 3, 1, 0),
+};
+
+static const struct snd_kcontrol_new es8389_right_mixer_controls[] = {
+	SOC_DAPM_SINGLE("DACL DACR Mixer", ES8389_DAC_MIX, 2, 1, 0),
+};
+
+static const struct snd_kcontrol_new es8389_leftadc_mixer_controls[] = {
+	SOC_DAPM_SINGLE("ADCL DACL Mixer", ES8389_DAC_MIX, 1, 1, 0),
+};
+
+static const struct snd_kcontrol_new es8389_rightadc_mixer_controls[] = {
+	SOC_DAPM_SINGLE("ADCR DACR Mixer", ES8389_DAC_MIX, 0, 1, 0),
+};
+
+static const struct snd_kcontrol_new es8389_adc_mixer_controls[] = {
+	SOC_DAPM_SINGLE("DACL ADCL Mixer", ES8389_ADC_RESET, 7, 1, 0),
+	SOC_DAPM_SINGLE("DACR ADCR Mixer", ES8389_ADC_RESET, 6, 1, 0),
+};
+
+static const struct snd_kcontrol_new es8389_snd_controls[] = {
+	SOC_SINGLE_TLV("ADCL Capture Volume", ES8389_ADCL_VOL, 0, 0xFF, 0, adc_vol_tlv),
+	SOC_SINGLE_TLV("ADCR Capture Volume", ES8389_ADCR_VOL, 0, 0xFF, 0, adc_vol_tlv),
+	SOC_SINGLE_TLV("ADCL PGA Volume", ES8389_MIC1_GAIN, 0, 0x0E, 0, pga_vol_tlv),
+	SOC_SINGLE_TLV("ADCR PGA Volume", ES8389_MIC2_GAIN, 0, 0x0E, 0, pga_vol_tlv),
+
+	SOC_ENUM("PGAL Select", es8389_pgal_enum),
+	SOC_ENUM("PGAR Select", es8389_pgar_enum),
+	SOC_ENUM("ALC Capture Switch", alc_enable),
+	SOC_SINGLE_TLV("ALC Capture Target Level", ES8389_ALC_TARGET,
+			0, 0x0f, 0, alc_target_tlv),
+	SOC_SINGLE_TLV("ALC Capture Max Gain", ES8389_ALC_GAIN,
+			0, 0x0f, 0, alc_max_level),
+	SOC_ENUM("ADC Ramp Rate", alc_ramprate),
+	SOC_ENUM("ALC Capture Winsize", alc_winsize),
+	SOC_DOUBLE("ADC OSR Volume ON Switch", ES8389_ADC_MUTE, 6, 7, 1, 0),
+	SOC_SINGLE_TLV("ADC OSR Volume", ES8389_OSR_VOL, 0, 0xFF, 0, adc_vol_tlv),
+	SOC_DOUBLE("ADC OUTPUT Invert Switch", ES8389_ADC_HPF2, 5, 6, 1, 0),
+
+	SOC_SINGLE_TLV("DACL Playback Volume", ES8389_DACL_VOL, 0, 0xFF, 0, dac_vol_tlv),
+	SOC_SINGLE_TLV("DACR Playback Volume", ES8389_DACR_VOL, 0, 0xFF, 0, dac_vol_tlv),
+	SOC_DOUBLE("DAC OUTPUT Invert Switch", ES8389_DAC_INV, 5, 6, 1, 0),
+	SOC_SINGLE_TLV("ADC2DAC Mixer Volume", ES8389_MIX_VOL, 0, 0x7F, 0, mix_vol_tlv),
+};
+
+static const struct snd_soc_dapm_widget es8389_dapm_widgets[] = {
+	/*Input Side*/
+	SND_SOC_DAPM_INPUT("INPUT1"),
+	SND_SOC_DAPM_INPUT("INPUT2"),
+	SND_SOC_DAPM_INPUT("DMIC"),
+	SND_SOC_DAPM_PGA("PGAL", SND_SOC_NOPM, 4, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("PGAR", SND_SOC_NOPM, 4, 0, NULL, 0),
+
+	/*ADCs*/
+	SND_SOC_DAPM_ADC("ADCL", NULL, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_ADC("ADCR", NULL, SND_SOC_NOPM, 0, 0),
+
+	/* Audio Interface */
+	SND_SOC_DAPM_AIF_OUT("I2S OUT", "I2S Capture", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("I2S IN", "I2S Playback", 0, SND_SOC_NOPM, 0, 0),
+
+	/*DACs*/
+	SND_SOC_DAPM_DAC("DACL", NULL, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_DAC("DACR", NULL, SND_SOC_NOPM, 0, 0),
+
+	/*Output Side*/
+	SND_SOC_DAPM_OUTPUT("HPOL"),
+	SND_SOC_DAPM_OUTPUT("HPOR"),
+
+	/* Digital Interface */
+	SND_SOC_DAPM_PGA("IF DAC", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("IF DACL1", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("IF DACR1", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("IF DACL2", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("IF DACR2", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("IF DACL3", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("IF DACR3", SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	/* Digital Interface Select */
+	SND_SOC_DAPM_MIXER("IF DACL Mixer", SND_SOC_NOPM, 0, 0,
+			   &es8389_left_mixer_controls[0],
+			   ARRAY_SIZE(es8389_left_mixer_controls)),
+	SND_SOC_DAPM_MIXER("IF DACR Mixer", SND_SOC_NOPM, 0, 0,
+			   &es8389_right_mixer_controls[0],
+			   ARRAY_SIZE(es8389_right_mixer_controls)),
+	SND_SOC_DAPM_MIXER("IF ADCDACL Mixer", SND_SOC_NOPM, 0, 0,
+			   &es8389_leftadc_mixer_controls[0],
+			   ARRAY_SIZE(es8389_leftadc_mixer_controls)),
+	SND_SOC_DAPM_MIXER("IF ADCDACR Mixer", SND_SOC_NOPM, 0, 0,
+			   &es8389_rightadc_mixer_controls[0],
+			   ARRAY_SIZE(es8389_rightadc_mixer_controls)),
+
+	SND_SOC_DAPM_MIXER("ADC Mixer", SND_SOC_NOPM, 0, 0,
+			   &es8389_adc_mixer_controls[0],
+			   ARRAY_SIZE(es8389_adc_mixer_controls)),
+	SND_SOC_DAPM_MUX("ADC MUX", SND_SOC_NOPM, 0, 0, &es8389_dmic_mux_controls),
+
+	SND_SOC_DAPM_MUX("OUTL MUX", SND_SOC_NOPM, 0, 0, &es8389_outl_mux_controls),
+	SND_SOC_DAPM_MUX("OUTR MUX", SND_SOC_NOPM, 0, 0, &es8389_outr_mux_controls),
+};
+
+
+static const struct snd_soc_dapm_route es8389_dapm_routes[] = {
+	{"PGAL", NULL, "INPUT1"},
+	{"PGAR", NULL, "INPUT2"},
+
+	{"ADCL", NULL, "PGAL"},
+	{"ADCR", NULL, "PGAR"},
+
+	{"ADC Mixer", "DACL ADCL Mixer", "DACL"},
+	{"ADC Mixer", "DACR ADCR Mixer", "DACR"},
+	{"ADC Mixer", NULL, "ADCL"},
+	{"ADC Mixer", NULL, "ADCR"},
+
+	{"ADC MUX", "AMIC", "ADC Mixer"},
+	{"ADC MUX", "DMIC", "DMIC"},
+
+	{"I2S OUT", NULL, "ADC MUX"},
+
+	{"DACL", NULL, "I2S IN"},
+	{"DACR", NULL, "I2S IN"},
+
+	{"IF DACL1", NULL, "DACL"},
+	{"IF DACR1", NULL, "DACR"},
+	{"IF DACL2", NULL, "DACL"},
+	{"IF DACR2", NULL, "DACR"},
+	{"IF DACL3", NULL, "DACL"},
+	{"IF DACR3", NULL, "DACR"},
+
+	{"IF DACL Mixer", NULL, "IF DACL2"},
+	{"IF DACL Mixer", "DACR DACL Mixer", "IF DACR1"},
+	{"IF DACR Mixer", NULL, "IF DACR2"},
+	{"IF DACR Mixer", "DACL DACR Mixer", "IF DACL1"},
+
+	{"IF ADCDACL Mixer", NULL, "IF DACL Mixer"},
+	{"IF ADCDACL Mixer", "ADCL DACL Mixer", "IF DACL3"},
+	{"IF ADCDACR Mixer", NULL, "IF DACR Mixer"},
+	{"IF ADCDACR Mixer", "ADCR DACR Mixer", "IF DACR3"},
+
+	{"OUTL MUX", "Normal", "IF ADCDACL Mixer"},
+	{"OUTL MUX", "DAC2 channel to DAC1 channel", "IF ADCDACR Mixer"},
+	{"OUTR MUX", "Normal", "IF ADCDACR Mixer"},
+	{"OUTR MUX", "DAC1 channel to DAC2 channel", "IF ADCDACL Mixer"},
+
+	{"HPOL", NULL, "OUTL MUX"},
+	{"HPOR", NULL, "OUTR MUX"},
+
+};
+
+struct _coeff_div {
+	u16 fs;
+	u32 mclk;
+	u32 rate;
+	u8 Reg0x04;
+	u8 Reg0x05;
+	u8 Reg0x06;
+	u8 Reg0x07;
+	u8 Reg0x08;
+	u8 Reg0x09;
+	u8 Reg0x0A;
+	u8 Reg0x0F;
+	u8 Reg0x11;
+	u8 Reg0x21;
+	u8 Reg0x22;
+	u8 Reg0x26;
+	u8 Reg0x30;
+	u8 Reg0x41;
+	u8 Reg0x42;
+	u8 Reg0x43;
+	u8 Reg0xF0;
+	u8 Reg0xF1;
+	u8 Reg0x16;
+	u8 Reg0x18;
+	u8 Reg0x19;
+};
+
+
+/* codec hifi mclk clock divider coefficients */
+static const struct _coeff_div  coeff_div[] = {
+	{32, 256000, 8000, 0x00, 0x57, 0x84, 0xD0, 0x03, 0xC1, 0xB0, 0x00, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0xFF, 0x7F, 0x01, 0x12, 0x00, 0x09, 0x19, 0x07},
+	{36, 288000, 8000, 0x00, 0x55, 0x84, 0xD0, 0x01, 0xC1, 0x90, 0x00, 0x00, 0x23, 0x8F, 0xB7, 0xC0, 0x1F, 0x8F, 0x01, 0x12, 0x00, 0x09, 0x19, 0x07},
+	{48, 384000, 8000, 0x02, 0x5F, 0x04, 0xC0, 0x03, 0xC1, 0xB0, 0x00, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0xFF, 0x7F, 0x01, 0x12, 0x00, 0x09, 0x19, 0x07},
+	{64, 512000, 8000, 0x00, 0x4D, 0x24, 0xC0, 0x03, 0xD1, 0xB0, 0x00, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0xFF, 0x7F, 0x01, 0x12, 0x00, 0x09, 0x19, 0x07},
+	{72, 576000, 8000, 0x00, 0x45, 0x24, 0xC0, 0x01, 0xD1, 0x90, 0x00, 0x00, 0x23, 0x8F, 0xB7, 0xC0, 0x1F, 0x8F, 0x01, 0x12, 0x00, 0x09, 0x19, 0x07},
+	{96, 768000, 8000, 0x02, 0x57, 0x84, 0xD0, 0x03, 0xC1, 0xB0, 0x00, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0xFF, 0x7F, 0x01, 0x12, 0x00, 0x09, 0x19, 0x07},
+	{128, 1024000, 8000, 0x00, 0x45, 0x04, 0xD0, 0x03, 0xC1, 0xB0, 0x00, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0xFF, 0x7F, 0x01, 0x12, 0x00, 0x09, 0x19, 0x07},
+	{192, 1536000, 8000, 0x02, 0x4D, 0x24, 0xC0, 0x03, 0xD1, 0xB0, 0x00, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0xFF, 0x7F, 0x01, 0x12, 0x00, 0x09, 0x19, 0x07},
+	{256, 2048000, 8000, 0x01, 0x45, 0x04, 0xD0, 0x03, 0xC1, 0xB0, 0x00, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0xFF, 0x7F, 0x01, 0x12, 0x00, 0x09, 0x19, 0x07},
+	{288, 2304000, 8000, 0x01, 0x51, 0x00, 0xC0, 0x01, 0xC1, 0x90, 0x00, 0x00, 0x23, 0x8F, 0xB7, 0xC0, 0x1F, 0x8F, 0x01, 0x12, 0x00, 0x09, 0x19, 0x07},
+	{384, 3072000, 8000, 0x02, 0x45, 0x04, 0xD0, 0x03, 0xC1, 0xB0, 0x00, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0xFF, 0x7F, 0x01, 0x12, 0x00, 0x09, 0x19, 0x07},
+	{512, 4096000, 8000, 0x00, 0x41, 0x04, 0xE0, 0x00, 0xD1, 0xB0, 0x00, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0xFF, 0x7F, 0x01, 0x12, 0x00, 0x09, 0x19, 0x07},
+	{768, 6144000, 8000, 0x05, 0x45, 0x04, 0xD0, 0x03, 0xC1, 0xB0, 0x00, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0xFF, 0x7F, 0x01, 0x12, 0x00, 0x09, 0x19, 0x07},
+	{1024, 8192000, 8000, 0x01, 0x41, 0x06, 0xE0, 0x00, 0xD1, 0xB0, 0x00, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0xFF, 0x7F, 0x01, 0x12, 0x00, 0x09, 0x19, 0x07},
+	{1536, 12288000, 8000, 0x02, 0x41, 0x04, 0xE0, 0x00, 0xD1, 0xB0, 0x40, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0xFF, 0x7F, 0x01, 0x12, 0x00, 0x09, 0x19, 0x07},
+	{1625, 13000000, 8000, 0x40, 0x6E, 0x05, 0xC8, 0x01, 0xC2, 0x90, 0x40, 0x00, 0x18, 0x95, 0xD0, 0xC0, 0x63, 0x95, 0x00, 0x12, 0x00, 0x09, 0x19, 0x07},
+	{2048, 16384000, 8000, 0x03, 0x44, 0x01, 0xC0, 0x00, 0xD2, 0x80, 0x40, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0xFF, 0x7F, 0x01, 0x12, 0x00, 0x09, 0x19, 0x07},
+	{2304, 18432000, 8000, 0x11, 0x45, 0x25, 0xF0, 0x00, 0xD1, 0xB0, 0x40, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0xFF, 0x7F, 0x01, 0x12, 0x00, 0x09, 0x19, 0x07},
+	{3072, 24576000, 8000, 0x05, 0x44, 0x01, 0xC0, 0x00, 0xD2, 0x80, 0x40, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0xFF, 0x7F, 0x01, 0x12, 0x00, 0x09, 0x19, 0x07},
+	{32, 512000, 16000, 0x00, 0x55, 0x84, 0xD0, 0x01, 0xC1, 0x90, 0x00, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0xFF, 0x7F, 0x00, 0x12, 0x00, 0x12, 0x31, 0x0E},
+	{36, 576000, 16000, 0x00, 0x55, 0x84, 0xD0, 0x01, 0xC1, 0x90, 0x00, 0x00, 0x23, 0x8F, 0xB7, 0xC0, 0x1F, 0x8F, 0x01, 0x12, 0x00, 0x12, 0x31, 0x0E},
+	{48, 768000, 16000, 0x02, 0x57, 0x04, 0xC0, 0x01, 0xC1, 0x90, 0x00, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0xFF, 0x7F, 0x00, 0x12, 0x00, 0x12, 0x31, 0x0E},
+	{50, 800000, 16000, 0x00, 0x7E, 0x01, 0xD9, 0x00, 0xC2, 0x80, 0x00, 0x00, 0x18, 0x95, 0xD0, 0xC0, 0xC7, 0x95, 0x00, 0x12, 0x00, 0x12, 0x31, 0x0E},
+	{64, 1024000, 16000, 0x00, 0x45, 0x24, 0xC0, 0x01, 0xD1, 0x90, 0x00, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0xFF, 0x7F, 0x00, 0x12, 0x00, 0x12, 0x31, 0x0E},
+	{72, 1152000, 16000, 0x00, 0x45, 0x24, 0xC0, 0x01, 0xD1, 0x90, 0x00, 0x00, 0x23, 0x8F, 0xB7, 0xC0, 0x1F, 0x8F, 0x01, 0x12, 0x00, 0x12, 0x31, 0x0E},
+	{96, 1536000, 16000, 0x02, 0x55, 0x84, 0xD0, 0x01, 0xC1, 0x90, 0x00, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0xFF, 0x7F, 0x00, 0x12, 0x00, 0x12, 0x31, 0x0E},
+	{128, 2048000, 16000, 0x00, 0x51, 0x04, 0xD0, 0x01, 0xC1, 0x90, 0x00, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0xFF, 0x7F, 0x00, 0x12, 0x00, 0x12, 0x31, 0x0E},
+	{144, 2304000, 16000, 0x00, 0x51, 0x00, 0xC0, 0x01, 0xC1, 0x90, 0x00, 0x00, 0x23, 0x8F, 0xB7, 0xC0, 0x1F, 0x8F, 0x01, 0x12, 0x00, 0x12, 0x31, 0x0E},
+	{192, 3072000, 16000, 0x02, 0x65, 0x25, 0xE0, 0x00, 0xE1, 0x90, 0x00, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0xFF, 0x7F, 0x00, 0x12, 0x00, 0x12, 0x31, 0x0E},
+	{256, 4096000, 16000, 0x00, 0x41, 0x04, 0xC0, 0x01, 0xD1, 0x90, 0x00, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0xFF, 0x7F, 0x00, 0x12, 0x00, 0x12, 0x31, 0x0E},
+	{300, 4800000, 16000, 0x02, 0x66, 0x01, 0xD9, 0x00, 0xC2, 0x80, 0x00, 0x00, 0x18, 0x95, 0xD0, 0xC0, 0xC7, 0x95, 0x00, 0x12, 0x00, 0x12, 0x31, 0x0E},
+	{384, 6144000, 16000, 0x02, 0x51, 0x04, 0xD0, 0x01, 0xC1, 0x90, 0x00, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0xFF, 0x7F, 0x00, 0x12, 0x00, 0x12, 0x31, 0x0E},
+	{512, 8192000, 16000, 0x01, 0x41, 0x04, 0xC0, 0x01, 0xD1, 0x90, 0x00, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0xFF, 0x7F, 0x00, 0x12, 0x00, 0x12, 0x31, 0x0E},
+	{750, 12000000, 16000, 0x0E, 0x7E, 0x01, 0xC9, 0x00, 0xC2, 0x80, 0x40, 0x00, 0x18, 0x95, 0xD0, 0xC0, 0xC7, 0x95, 0x00, 0x12, 0x00, 0x12, 0x31, 0x0E},
+	{768, 12288000, 16000, 0x02, 0x41, 0x04, 0xC0, 0x01, 0xD1, 0x90, 0x40, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0xFF, 0x7F, 0x00, 0x12, 0x00, 0x12, 0x31, 0x0E},
+	{1024, 16384000, 16000, 0x03, 0x41, 0x04, 0xC0, 0x01, 0xD1, 0x90, 0x40, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0xFF, 0x7F, 0x00, 0x12, 0x00, 0x12, 0x31, 0x0E},
+	{1152, 18432000, 16000, 0x08, 0x51, 0x04, 0xD0, 0x01, 0xC1, 0x90, 0x40, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0xFF, 0x7F, 0x00, 0x12, 0x00, 0x12, 0x31, 0x0E},
+	{1200, 19200000, 16000, 0x0B, 0x66, 0x01, 0xD9, 0x00, 0xC2, 0x80, 0x40, 0x00, 0x18, 0x95, 0xD0, 0xC0, 0xC7, 0x95, 0x00, 0x12, 0x00, 0x12, 0x31, 0x0E},
+	{1500, 24000000, 16000, 0x0E, 0x26, 0x01, 0xD9, 0x00, 0xC2, 0x80, 0xC0, 0x00, 0x18, 0x95, 0xD0, 0xC0, 0xC7, 0x95, 0x00, 0x12, 0x00, 0x12, 0x31, 0x0E},
+	{1536, 24576000, 16000, 0x05, 0x41, 0x04, 0xC0, 0x01, 0xD1, 0x90, 0xC0, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0xFF, 0x7F, 0x00, 0x12, 0x00, 0x12, 0x31, 0x0E},
+	{1625, 26000000, 16000, 0x40, 0x6E, 0x05, 0xC8, 0x01, 0xC2, 0x90, 0xC0, 0x00, 0x18, 0x95, 0xD0, 0xC0, 0x63, 0x95, 0x00, 0x12, 0x00, 0x12, 0x31, 0x0E},
+	{800, 19200000, 24000, 0x07, 0x66, 0x01, 0xD9, 0x00, 0xC2, 0x80, 0x40, 0x00, 0x18, 0x95, 0xD0, 0xC0, 0xC7, 0x95, 0x00, 0x12, 0x00, 0x1A, 0x49, 0x14},
+	{600, 19200000, 32000, 0x05, 0x46, 0x01, 0xD8, 0x10, 0xD2, 0x80, 0x40, 0x00, 0x18, 0x95, 0xD0, 0xC0, 0x63, 0x95, 0x00, 0x12, 0x00, 0x23, 0x61, 0x1B},
+	{32, 1411200, 44100, 0x00, 0x45, 0xA4, 0xD0, 0x10, 0xD1, 0x80, 0x00, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0x7F, 0x7F, 0x00, 0x12, 0x00, 0x35, 0x91, 0x28},
+	{64, 2822400, 44100, 0x00, 0x51, 0x00, 0xC0, 0x10, 0xC1, 0x80, 0x00, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0x7F, 0x7F, 0x00, 0x12, 0x00, 0x35, 0x91, 0x28},
+	{128, 5644800, 44100, 0x00, 0x41, 0x04, 0xD0, 0x10, 0xD1, 0x80, 0x00, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0x7F, 0x7F, 0x00, 0x12, 0x00, 0x35, 0x91, 0x28},
+	{256, 11289600, 44100, 0x01, 0x41, 0x04, 0xD0, 0x10, 0xD1, 0x80, 0x40, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0x7F, 0x7F, 0x00, 0x12, 0x00, 0x35, 0x91, 0x28},
+	{512, 22579200, 44100, 0x03, 0x41, 0x04, 0xD0, 0x10, 0xD1, 0x80, 0xC0, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0x7F, 0x7F, 0x00, 0x12, 0x00, 0x35, 0x91, 0x28},
+	{32, 1536000, 48000, 0x00, 0x45, 0xA4, 0xD0, 0x10, 0xD1, 0x80, 0x00, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0x7F, 0x7F, 0x00, 0x12, 0x00, 0x35, 0x91, 0x28},
+	{48, 2304000, 48000, 0x02, 0x55, 0x04, 0xC0, 0x10, 0xC1, 0x80, 0x00, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0x7F, 0x7F, 0x00, 0x12, 0x00, 0x35, 0x91, 0x28},
+	{50, 2400000, 48000, 0x00, 0x76, 0x01, 0xC8, 0x10, 0xC2, 0x80, 0x00, 0x00, 0x18, 0x95, 0xD0, 0xC0, 0x63, 0x95, 0x00, 0x12, 0x00, 0x35, 0x91, 0x28},
+	{64, 3072000, 48000, 0x00, 0x51, 0x04, 0xC0, 0x10, 0xC1, 0x80, 0x00, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0x7F, 0x7F, 0x00, 0x12, 0x00, 0x35, 0x91, 0x28},
+	{100, 4800000, 48000, 0x00, 0x46, 0x01, 0xD8, 0x10, 0xD2, 0x80, 0x00, 0x00, 0x18, 0x95, 0xD0, 0xC0, 0x63, 0x95, 0x00, 0x12, 0x00, 0x35, 0x91, 0x28},
+	{125, 6000000, 48000, 0x04, 0x6E, 0x05, 0xC8, 0x10, 0xC2, 0x80, 0x00, 0x01, 0x18, 0x95, 0xD0, 0xC0, 0x63, 0x95, 0x00, 0x12, 0x00, 0x35, 0x91, 0x28},
+	{128, 6144000, 48000, 0x00, 0x41, 0x04, 0xD0, 0x10, 0xD1, 0x80, 0x00, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0x7F, 0x7F, 0x00, 0x12, 0x00, 0x35, 0x91, 0x28},
+	{200, 9600000, 48000, 0x01, 0x46, 0x01, 0xD8, 0x10, 0xD2, 0x80, 0x00, 0x00, 0x18, 0x95, 0xD0, 0xC0, 0x63, 0x95, 0x00, 0x12, 0x00, 0x35, 0x91, 0x28},
+	{250, 12000000, 48000, 0x04, 0x76, 0x01, 0xC8, 0x10, 0xC2, 0x80, 0x40, 0x00, 0x18, 0x95, 0xD0, 0xC0, 0x63, 0x95, 0x00, 0x12, 0x00, 0x35, 0x91, 0x28},
+	{256, 12288000, 48000, 0x01, 0x41, 0x04, 0xD0, 0x10, 0xD1, 0x80, 0x40, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0x7F, 0x7F, 0x00, 0x12, 0x00, 0x35, 0x91, 0x28},
+	{384, 18432000, 48000, 0x02, 0x41, 0x04, 0xD0, 0x10, 0xD1, 0x80, 0x40, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0x7F, 0x7F, 0x00, 0x12, 0x00, 0x35, 0x91, 0x28},
+	{400, 19200000, 48000, 0x03, 0x46, 0x01, 0xD8, 0x10, 0xD2, 0x80, 0x40, 0x00, 0x18, 0x95, 0xD0, 0xC0, 0x63, 0x95, 0x00, 0x12, 0x00, 0x35, 0x91, 0x28},
+	{500, 24000000, 48000, 0x04, 0x46, 0x01, 0xD8, 0x10, 0xD2, 0x80, 0xC0, 0x00, 0x18, 0x95, 0xD0, 0xC0, 0x63, 0x95, 0x00, 0x12, 0x00, 0x35, 0x91, 0x28},
+	{512, 24576000, 48000, 0x03, 0x41, 0x04, 0xD0, 0x10, 0xD1, 0x80, 0xC0, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0x7F, 0x7F, 0x00, 0x12, 0x00, 0x35, 0x91, 0x28},
+	{800, 38400000, 48000, 0x18, 0x45, 0x04, 0xC0, 0x10, 0xC1, 0x80, 0xC0, 0x00, 0x1F, 0x7F, 0xBF, 0xC0, 0x7F, 0x7F, 0x00, 0x12, 0x00, 0x35, 0x91, 0x28},
+	{128, 11289600, 88200, 0x00, 0x50, 0x00, 0xC0, 0x10, 0xC1, 0x80, 0x40, 0x00, 0x9F, 0x7F, 0xBF, 0xC0, 0x7F, 0x7F, 0x80, 0x12, 0xC0, 0x32, 0x89, 0x25},
+	{64, 6144000, 96000, 0x00, 0x41, 0x00, 0xD0, 0x10, 0xD1, 0x80, 0x00, 0x00, 0x9F, 0x7F, 0xBF, 0xC0, 0x7F, 0x7F, 0x80, 0x12, 0xC0, 0x35, 0x91, 0x28},
+	{128, 12288000, 96000, 0x00, 0x50, 0x00, 0xC0, 0x10, 0xC1, 0x80, 0xC0, 0x00, 0x9F, 0x7F, 0xBF, 0xC0, 0x7F, 0x7F, 0x80, 0x12, 0xC0, 0x35, 0x91, 0x28},
+	{256, 24576000, 96000, 0x00, 0x40, 0x00, 0xC0, 0x10, 0xC1, 0x80, 0xC0, 0x00, 0x9F, 0x7F, 0xBF, 0xC0, 0x7F, 0x7F, 0x80, 0x12, 0xC0, 0x35, 0x91, 0x28},
+	{128, 24576000, 192000, 0x00, 0x50, 0x00, 0xC0, 0x18, 0xC1, 0x81, 0xC0, 0x00, 0x8F, 0x7F, 0xEF, 0xC0, 0x3F, 0x7F, 0x80, 0x12, 0xC0, 0x3F, 0xF9, 0x3F},
+
+	{50, 400000, 8000, 0x00, 0x75, 0x05, 0xC8, 0x01, 0xC1, 0x90, 0x10, 0x00, 0x18, 0xC7, 0xD0, 0xC0, 0x8F, 0xC7, 0x01, 0x12, 0x00, 0x09, 0x19, 0x07},
+	{600, 4800000, 8000, 0x05, 0x65, 0x25, 0xF9, 0x00, 0xD1, 0x90, 0x10, 0x00, 0x18, 0xC7, 0xD0, 0xC0, 0x8F, 0xC7, 0x01, 0x12, 0x00, 0x09, 0x19, 0x07},
+	{1500, 12000000, 8000, 0x0E, 0x25, 0x25, 0xE8, 0x00, 0xD1, 0x90, 0x40, 0x00, 0x31, 0xC7, 0xC5, 0x00, 0x8F, 0xC7, 0x01, 0x12, 0x00, 0x09, 0x19, 0x07},
+	{2400, 19200000, 8000, 0x0B, 0x01, 0x00, 0xD0, 0x00, 0xD1, 0x80, 0x90, 0x00, 0x31, 0xC7, 0xC5, 0x00, 0xC7, 0xC7, 0x00, 0x12, 0x00, 0x09, 0x19, 0x07},
+	{3000, 24000000, 8000, 0x0E, 0x24, 0x05, 0xD0, 0x00, 0xC2, 0x80, 0xC0, 0x00, 0x31, 0xC7, 0xC5, 0x00, 0x8F, 0xC7, 0x01, 0x12, 0x00, 0x09, 0x19, 0x07},
+	{3250, 26000000, 8000, 0x40, 0x05, 0xA4, 0xC0, 0x00, 0xD1, 0x80, 0xD0, 0x00, 0x31, 0xC7, 0xC5, 0x00, 0xC7, 0xC7, 0x00, 0x12, 0x00, 0x09, 0x19, 0x07},
+
+};
+static inline int get_coeff(int mclk, int rate)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(coeff_div); i++) {
+		if (coeff_div[i].rate == rate &&  coeff_div[i].mclk == mclk)
+			return i;
+	}
+	return -EINVAL;
+}
+
+/*
+ * if PLL not be used, use internal clk1 for mclk,otherwise, use internal clk2 for PLL source.
+ */
+static int es8389_set_dai_sysclk(struct snd_soc_dai *dai,
+			int clk_id, unsigned int freq, int dir)
+{
+	struct snd_soc_component *codec = dai->component;
+	struct es8389_private *es8389 = snd_soc_component_get_drvdata(codec);
+
+	es8389->sysclk = freq;
+
+	return 0;
+}
+
+static int es8389_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
+{
+	struct snd_soc_component *codec = codec_dai->component;
+	struct es8389_private *es8389 = snd_soc_component_get_drvdata(codec);
+	u8 state = 0;
+
+	dev_dbg(codec->dev, "Enter into %s()\n", __func__);
+
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFP:
+		regmap_update_bits(es8389->regmap, ES8389_MASTER_MODE,
+				ES8389_MASTER_MODE_EN, ES8389_MASTER_MODE_EN);
+		es8389->mastermode = 1;
+		break;
+	case SND_SOC_DAIFMT_CBC_CFC:
+		es8389->mastermode = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		state |= ES8389_DAIFMT_I2S;
+		break;
+	case SND_SOC_DAIFMT_RIGHT_J:
+		dev_err(codec->dev, "Codec driver does not support right justified\n");
+		return -EINVAL;
+	case SND_SOC_DAIFMT_LEFT_J:
+		state |= ES8389_DAIFMT_LEFT_J;
+		break;
+	case SND_SOC_DAIFMT_DSP_A:
+		state |= ES8389_DAIFMT_DSP_A;
+		break;
+	case SND_SOC_DAIFMT_DSP_B:
+		state |= ES8389_DAIFMT_DSP_B;
+		break;
+	default:
+		break;
+	}
+	regmap_update_bits(es8389->regmap, ES8389_ADC_FORMAT_MUTE, ES8389_DAIFMT_MASK, state);
+	regmap_update_bits(es8389->regmap, ES8389_DAC_FORMAT_MUTE, ES8389_DAIFMT_MASK, state);
+
+	/* clock inversion */
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		break;
+	case SND_SOC_DAIFMT_IB_IF:
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		break;
+	case SND_SOC_DAIFMT_NB_IF:
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int es8389_pcm_hw_params(struct snd_pcm_substream *substream,
+			struct snd_pcm_hw_params *params,
+			struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *codec = dai->component;
+	struct es8389_private *es8389 = snd_soc_component_get_drvdata(codec);
+	int coeff;
+	u8 state = 0;
+
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S16_LE:
+		state |= ES8389_S16_LE;
+		break;
+	case SNDRV_PCM_FORMAT_S20_3LE:
+		state |= ES8389_S20_3_LE;
+		break;
+	case SNDRV_PCM_FORMAT_S18_3LE:
+		state |= ES8389_S18_LE;
+		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+		state |= ES8389_S24_LE;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		state |= ES8389_S32_LE;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_update_bits(es8389->regmap, ES8389_ADC_FORMAT_MUTE, ES8389_DATA_LEN_MASK, state);
+	regmap_update_bits(es8389->regmap, ES8389_DAC_FORMAT_MUTE, ES8389_DATA_LEN_MASK, state);
+
+	if (es8389->mclk_src == ES8389_SCLK_PIN) {
+		regmap_update_bits(es8389->regmap, ES8389_MASTER_CLK,
+					ES8389_MCLK_SOURCE, es8389->mclk_src);
+		es8389->sysclk = params_channels(params) * params_width(params) * params_rate(params);
+	}
+
+	coeff = get_coeff(es8389->sysclk, params_rate(params));
+	if (coeff >= 0) {
+		regmap_write(es8389->regmap, ES8389_CLK_DIV1, coeff_div[coeff].Reg0x04);
+		regmap_write(es8389->regmap, ES8389_CLK_MUL, coeff_div[coeff].Reg0x05);
+		regmap_write(es8389->regmap, ES8389_CLK_MUX1, coeff_div[coeff].Reg0x06);
+		regmap_write(es8389->regmap, ES8389_CLK_MUX2, coeff_div[coeff].Reg0x07);
+		regmap_write(es8389->regmap, ES8389_CLK_CTL1, coeff_div[coeff].Reg0x08);
+		regmap_write(es8389->regmap, ES8389_CLK_CTL2, coeff_div[coeff].Reg0x09);
+		regmap_write(es8389->regmap, ES8389_CLK_CTL3, coeff_div[coeff].Reg0x0A);
+		regmap_update_bits(es8389->regmap, ES8389_OSC_CLK,
+						0xC0, coeff_div[coeff].Reg0x0F);
+		regmap_write(es8389->regmap, ES8389_CLK_DIV2, coeff_div[coeff].Reg0x11);
+		regmap_write(es8389->regmap, ES8389_ADC_OSR, coeff_div[coeff].Reg0x21);
+		regmap_write(es8389->regmap, ES8389_ADC_DSP, coeff_div[coeff].Reg0x22);
+		regmap_write(es8389->regmap, ES8389_OSR_VOL, coeff_div[coeff].Reg0x26);
+		regmap_update_bits(es8389->regmap, ES8389_SYSTEM30,
+						0xC0, coeff_div[coeff].Reg0x30);
+		regmap_write(es8389->regmap, ES8389_DAC_DSM_OSR, coeff_div[coeff].Reg0x41);
+		regmap_write(es8389->regmap, ES8389_DAC_DSP_OSR, coeff_div[coeff].Reg0x42);
+		regmap_update_bits(es8389->regmap, ES8389_DAC_MISC,
+						0x81, coeff_div[coeff].Reg0x43);
+		regmap_update_bits(es8389->regmap, ES8389_CHIP_MISC,
+						0x72, coeff_div[coeff].Reg0xF0);
+		regmap_write(es8389->regmap, ES8389_CSM_STATE1, coeff_div[coeff].Reg0xF1);
+		regmap_write(es8389->regmap, ES8389_SYSTEM16, coeff_div[coeff].Reg0x16);
+		regmap_write(es8389->regmap, ES8389_SYSTEM18, coeff_div[coeff].Reg0x18);
+		regmap_write(es8389->regmap, ES8389_SYSTEM19, coeff_div[coeff].Reg0x19);
+	} else {
+		dev_warn(codec->dev, "Clock coefficients do not match");
+	}
+
+	return 0;
+}
+
+static int es8389_set_bias_level(struct snd_soc_component *codec,
+			enum snd_soc_bias_level level)
+{
+	int ret;
+	struct es8389_private *es8389 = snd_soc_component_get_drvdata(codec);
+	switch (level) {
+	case SND_SOC_BIAS_ON:
+		if (!es8389->adc_slot) {
+			ret = clk_prepare_enable(es8389->mclk);
+			if (ret)
+				return ret;
+		}
+		regmap_update_bits(es8389->regmap, ES8389_HPSW, 0x20, 0x20);
+		regmap_write(es8389->regmap, ES8389_ANA_CTL1, 0xD9);
+		regmap_write(es8389->regmap, ES8389_ADC_EN, 0x8F);
+		regmap_write(es8389->regmap, ES8389_CSM_JUMP, 0xE4);
+		regmap_write(es8389->regmap, ES8389_RESET, 0x01);
+		regmap_write(es8389->regmap, ES8389_CLK_OFF1, 0xC3);
+		regmap_update_bits(es8389->regmap, ES8389_ADC_HPF1, 0x0f, 0x0a);
+		regmap_update_bits(es8389->regmap, ES8389_ADC_HPF2, 0x0f, 0x0a);
+		usleep_range(70000, 72000);
+		regmap_write(es8389->regmap, ES8389_DAC_RESET, 0X00);
+		break;
+	case SND_SOC_BIAS_PREPARE:
+		break;
+	case SND_SOC_BIAS_STANDBY:
+		regmap_update_bits(es8389->regmap, ES8389_ADC_HPF1, 0x0f, 0x04);
+		regmap_update_bits(es8389->regmap, ES8389_ADC_HPF2, 0x0f, 0x04);
+		regmap_write(es8389->regmap, ES8389_CSM_JUMP, 0xD4);
+		usleep_range(70000, 72000);
+		regmap_write(es8389->regmap, ES8389_ANA_CTL1, 0x59);
+		regmap_write(es8389->regmap, ES8389_ADC_EN, 0x00);
+		regmap_write(es8389->regmap, ES8389_CLK_OFF1, 0x00);
+		regmap_write(es8389->regmap, ES8389_RESET, 0x7E);
+		regmap_update_bits(es8389->regmap, ES8389_DAC_INV, 0x80, 0x80);
+		usleep_range(8000, 8500);
+		regmap_update_bits(es8389->regmap, ES8389_DAC_INV, 0x80, 0x00);
+		if (!es8389->adc_slot)
+			clk_disable_unprepare(es8389->mclk);
+		break;
+	case SND_SOC_BIAS_OFF:
+		break;
+	}
+	return 0;
+}
+
+
+
+static int es8389_mute(struct snd_soc_dai *dai, int mute, int direction)
+{
+	struct snd_soc_component *codec = dai->component;
+	struct es8389_private *es8389 = snd_soc_component_get_drvdata(codec);
+
+	if (mute) {
+		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+			regmap_update_bits(es8389->regmap, ES8389_DAC_FORMAT_MUTE,
+						0x03, 0x03);
+		} else {
+			regmap_update_bits(es8389->regmap, ES8389_ADC_FORMAT_MUTE,
+						0x03, 0x03);
+		}
+	} else {
+		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+			regmap_update_bits(es8389->regmap, ES8389_DAC_FORMAT_MUTE,
+						0x03, 0x00);
+		} else {
+			regmap_update_bits(es8389->regmap, ES8389_ADC_FORMAT_MUTE,
+						0x03, 0x00);
+		}
+	}
+
+	return 0;
+}
+
+#define es8389_RATES SNDRV_PCM_RATE_8000_96000
+
+#define es8389_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
+		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S32_LE)
+
+static const struct snd_soc_dai_ops es8389_ops = {
+	.hw_params = es8389_pcm_hw_params,
+	.set_fmt = es8389_set_dai_fmt,
+	.set_sysclk = es8389_set_dai_sysclk,
+	.mute_stream = es8389_mute,
+};
+
+static struct snd_soc_dai_driver es8389_dai = {
+	.name = "ES8389 HiFi",
+	.playback = {
+		.stream_name = "Playback",
+		.channels_min = 1,
+		.channels_max = 2,
+		.rates = es8389_RATES,
+		.formats = es8389_FORMATS,
+	},
+	.capture = {
+		.stream_name = "Capture",
+		.channels_min = 1,
+		.channels_max = 2,
+		.rates = es8389_RATES,
+		.formats = es8389_FORMATS,
+	},
+	.ops = &es8389_ops,
+	.symmetric_rate = 1,
+};
+
+static void es8389_init(struct snd_soc_component *codec)
+{
+	struct es8389_private *es8389 = snd_soc_component_get_drvdata(codec);
+
+	regmap_write(es8389->regmap, ES8389_ISO_CTL, 0x00);
+	regmap_write(es8389->regmap, ES8389_RESET, 0x7E);
+	regmap_write(es8389->regmap, ES8389_ISO_CTL, 0x38);
+	regmap_write(es8389->regmap, ES8389_ADC_HPF1, 0x64);
+	regmap_write(es8389->regmap, ES8389_ADC_HPF2, 0x04);
+	regmap_write(es8389->regmap, ES8389_DAC_INV, 0x03);
+
+	regmap_write(es8389->regmap, ES8389_VMID, 0x2A);
+	regmap_write(es8389->regmap, ES8389_ANA_CTL1, 0xC9);
+	regmap_write(es8389->regmap, ES8389_ANA_VSEL, 0x4F);
+	regmap_write(es8389->regmap, ES8389_ANA_CTL2, 0x06);
+	regmap_write(es8389->regmap, ES8389_LOW_POWER1, 0x00);
+	regmap_write(es8389->regmap, ES8389_DMIC_EN, 0x16);
+
+	regmap_write(es8389->regmap, ES8389_PGA_SW, 0xAA);
+	regmap_write(es8389->regmap, ES8389_MOD_SW1, 0x66);
+	regmap_write(es8389->regmap, ES8389_MOD_SW2, 0x99);
+	regmap_write(es8389->regmap, ES8389_ADC_MODE, (0x00 | ES8389_TDM_MODE));
+
+	if (es8389->dmic == true) {
+		regmap_update_bits(es8389->regmap, ES8389_DMIC_EN, 0xC0, 0xC0);
+		regmap_update_bits(es8389->regmap, ES8389_ADC_MODE, 0x03, 0x03);
+	} else {
+		regmap_update_bits(es8389->regmap, ES8389_DMIC_EN, 0xC0, 0x00);
+		regmap_update_bits(es8389->regmap, ES8389_ADC_MODE, 0x03, 0x00);
+	}
+
+	regmap_update_bits(es8389->regmap, ES8389_MIC1_GAIN,
+					ES8389_MIC_SEL_MASK, ES8389_MIC_DEFAULT);
+	regmap_update_bits(es8389->regmap, ES8389_MIC2_GAIN,
+					ES8389_MIC_SEL_MASK, ES8389_MIC_DEFAULT);
+	regmap_write(es8389->regmap, ES8389_CSM_JUMP, 0xC4);
+	regmap_write(es8389->regmap, ES8389_MASTER_MODE, 0x08);
+	regmap_write(es8389->regmap, ES8389_CSM_STATE1, 0x00);
+	regmap_write(es8389->regmap, ES8389_SYSTEM12, 0x01);
+	regmap_write(es8389->regmap, ES8389_SYSTEM13, 0x01);
+	regmap_write(es8389->regmap, ES8389_SYSTEM14, 0x01);
+	regmap_write(es8389->regmap, ES8389_SYSTEM15, 0x01);
+	regmap_write(es8389->regmap, ES8389_SYSTEM16, 0x35);
+	regmap_write(es8389->regmap, ES8389_SYSTEM17, 0x09);
+	regmap_write(es8389->regmap, ES8389_SYSTEM18, 0x91);
+	regmap_write(es8389->regmap, ES8389_SYSTEM19, 0x28);
+	regmap_write(es8389->regmap, ES8389_SYSTEM1A, 0x01);
+	regmap_write(es8389->regmap, ES8389_SYSTEM1B, 0x01);
+	regmap_write(es8389->regmap, ES8389_SYSTEM1C, 0x11);
+
+	regmap_write(es8389->regmap, ES8389_CHIP_MISC, 0x13);
+	regmap_write(es8389->regmap, ES8389_MASTER_CLK, 0x00);
+	regmap_write(es8389->regmap, ES8389_CLK_DIV1, 0x00);
+	regmap_write(es8389->regmap, ES8389_CLK_MUL, 0x10);
+	regmap_write(es8389->regmap, ES8389_CLK_MUX1, 0x00);
+	regmap_write(es8389->regmap, ES8389_CLK_MUX2, 0xC0);
+	regmap_write(es8389->regmap, ES8389_CLK_CTL1, 0x00);
+	regmap_write(es8389->regmap, ES8389_CLK_CTL2, 0xC0);
+	regmap_write(es8389->regmap, ES8389_CLK_CTL3, 0x80);
+	regmap_write(es8389->regmap, ES8389_SCLK_DIV, 0x04);
+	regmap_write(es8389->regmap, ES8389_LRCK_DIV1, 0x01);
+	regmap_write(es8389->regmap, ES8389_LRCK_DIV2, 0x00);
+	regmap_write(es8389->regmap, ES8389_OSC_CLK, 0x00);
+	regmap_write(es8389->regmap, ES8389_ADC_OSR, 0x1F);
+	regmap_write(es8389->regmap, ES8389_ADC_DSP, 0x7F);
+	regmap_write(es8389->regmap, ES8389_ADC_MUTE, 0xC0);
+	regmap_write(es8389->regmap, ES8389_SYSTEM30, 0xF4);
+	regmap_write(es8389->regmap, ES8389_DAC_DSM_OSR, 0x7F);
+	regmap_write(es8389->regmap, ES8389_DAC_DSP_OSR, 0x7F);
+	regmap_write(es8389->regmap, ES8389_DAC_MISC, 0x10);
+	regmap_write(es8389->regmap, ES8389_DAC_RAMP, 0x0F);
+	regmap_write(es8389->regmap, ES8389_SYSTEM4C, 0xC0);
+	regmap_write(es8389->regmap, ES8389_RESET, 0x00);
+	regmap_write(es8389->regmap, ES8389_CLK_OFF1, 0xC1);
+	regmap_write(es8389->regmap, ES8389_RESET, 0x01);
+	regmap_write(es8389->regmap, ES8389_DAC_RESET, 0x02);
+
+	regmap_update_bits(es8389->regmap, ES8389_PTDM_SLOT,
+					ES8389_TDM_SLOT, (es8389->adc_slot << 4));
+	regmap_update_bits(es8389->regmap, ES8389_DAC_RAMP,
+					ES8389_TDM_SLOT, (es8389->dac_slot << 4));
+
+	regmap_update_bits(es8389->regmap, ES8389_ADC_FORMAT_MUTE, 0x03, 0x03);
+	regmap_update_bits(es8389->regmap, ES8389_DAC_FORMAT_MUTE, 0x03, 0x03);
+}
+
+static int es8389_suspend(struct snd_soc_component *codec)
+{
+	struct es8389_private *es8389 = snd_soc_component_get_drvdata(codec);
+
+	es8389_set_bias_level(codec, SND_SOC_BIAS_STANDBY);
+	regcache_cache_only(es8389->regmap, true);
+	regcache_mark_dirty(es8389->regmap);
+
+	return 0;
+}
+
+static int es8389_resume(struct snd_soc_component *codec)
+{
+	struct es8389_private *es8389 = snd_soc_component_get_drvdata(codec);
+	unsigned int regv;
+
+	regcache_cache_only(es8389->regmap, false);
+	regcache_cache_bypass(es8389->regmap, true);
+	regmap_read(es8389->regmap, ES8389_RESET, &regv);
+	regcache_cache_bypass(es8389->regmap, false);
+
+	if (regv == 0xff)
+		es8389_init(codec);
+	else
+		es8389_set_bias_level(codec, SND_SOC_BIAS_ON);
+
+	regcache_sync(es8389->regmap);
+
+	return 0;
+}
+
+static int es8389_probe(struct snd_soc_component *codec)
+{
+	int ret = 0;
+	struct es8389_private *es8389 = snd_soc_component_get_drvdata(codec);
+
+	ret = device_property_read_u8(codec->dev, "everest,mclk-src", &es8389->mclk_src);
+	if (ret != 0) {
+		dev_dbg(codec->dev, "mclk-src return %d", ret);
+		es8389->mclk_src = ES8389_MCLK_SOURCE;
+	}
+
+	ret = device_property_read_u8(codec->dev, "everest,adc-slot", &es8389->adc_slot);
+	if (ret != 0) {
+		dev_dbg(codec->dev, "adc-slot return %d", ret);
+		es8389->adc_slot = 0x00;
+	}
+
+	ret = device_property_read_u8(codec->dev, "everest,dac-slot", &es8389->dac_slot);
+	if (ret != 0) {
+		dev_dbg(codec->dev, "dac-slot return %d", ret);
+		es8389->dac_slot = 0x00;
+	}
+
+	es8389->dmic = device_property_read_bool(codec->dev,
+			"everest,dmic-enabled");
+	dev_dbg(codec->dev, "dmic-enabled %x", es8389->dmic);
+
+	if (!es8389->adc_slot) {
+		es8389->mclk = devm_clk_get(codec->dev, "mclk");
+		if (IS_ERR(es8389->mclk)) {
+			dev_err(codec->dev, "%s,unable to get mclk\n", __func__);
+			return PTR_ERR(es8389->mclk);
+		}
+		if (!es8389->mclk)
+			dev_err(codec->dev, "%s, assuming static mclk\n", __func__);
+
+		ret = clk_prepare_enable(es8389->mclk);
+		if (ret) {
+			dev_err(codec->dev, "%s, unable to enable mclk\n", __func__);
+			return ret;
+		}
+	}
+
+	es8389_init(codec);
+	es8389_set_bias_level(codec, SND_SOC_BIAS_STANDBY);
+
+	return 0;
+}
+
+static void es8389_remove(struct snd_soc_component *codec)
+{
+	struct es8389_private *es8389 = snd_soc_component_get_drvdata(codec);
+
+	regmap_write(es8389->regmap, ES8389_MASTER_MODE, 0x28);
+	regmap_write(es8389->regmap, ES8389_HPSW, 0x00);
+	regmap_write(es8389->regmap, ES8389_VMID, 0x00);
+	regmap_write(es8389->regmap, ES8389_RESET, 0x00);
+	regmap_write(es8389->regmap, ES8389_CSM_JUMP, 0xCC);
+	usleep_range(500000, 550000);//500MS
+	regmap_write(es8389->regmap, ES8389_CSM_JUMP, 0x00);
+	regmap_write(es8389->regmap, ES8389_ANA_CTL1, 0x08);
+	regmap_write(es8389->regmap, ES8389_ISO_CTL, 0xC1);
+	regmap_write(es8389->regmap, ES8389_PULL_DOWN, 0x00);
+
+}
+
+static struct snd_soc_component_driver soc_codec_dev_es8389 = {
+	.probe = es8389_probe,
+	.remove = es8389_remove,
+	.suspend = es8389_suspend,
+	.resume = es8389_resume,
+	.set_bias_level = es8389_set_bias_level,
+
+	.controls = es8389_snd_controls,
+	.num_controls = ARRAY_SIZE(es8389_snd_controls),
+	.dapm_widgets = es8389_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(es8389_dapm_widgets),
+	.dapm_routes = es8389_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(es8389_dapm_routes),
+	.idle_bias_on = 1,
+	.use_pmdown_time = 1,
+};
+
+static struct regmap_config es8389_regmap = {
+	.reg_bits = 8,
+	.val_bits = 8,
+
+	.max_register = ES8389_MAX_REGISTER,
+
+	.volatile_reg = es8389_volatile_register,
+	.cache_type = REGCACHE_MAPLE,
+};
+
+#ifdef CONFIG_OF
+static struct of_device_id es8389_if_dt_ids[] = {
+	{ .compatible = "everest,es8389", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, es8389_if_dt_ids);
+#endif
+
+static void es8389_i2c_shutdown(struct i2c_client *i2c)
+{
+	struct snd_soc_component *component;
+	struct es8389_private *es8389;
+
+	es8389 = i2c_get_clientdata(i2c);
+	component = es8389->component;
+	dev_dbg(component->dev, "Enter into %s\n", __func__);
+
+	regmap_write(es8389->regmap, ES8389_MASTER_MODE, 0x28);
+	regmap_write(es8389->regmap, ES8389_HPSW, 0x00);
+	regmap_write(es8389->regmap, ES8389_VMID, 0x00);
+	regmap_write(es8389->regmap, ES8389_RESET, 0x00);
+	regmap_write(es8389->regmap, ES8389_CSM_JUMP, 0xCC);
+	usleep_range(500000, 550000);//500MS
+	regmap_write(es8389->regmap, ES8389_CSM_JUMP, 0x00);
+	regmap_write(es8389->regmap, ES8389_ANA_CTL1, 0x08);
+	regmap_write(es8389->regmap, ES8389_ISO_CTL, 0xC1);
+	regmap_write(es8389->regmap, ES8389_PULL_DOWN, 0x00);
+}
+
+static int es8389_i2c_probe(struct i2c_client *i2c_client)
+{
+	struct es8389_private *es8389;
+	int ret = -1;
+
+	es8389 = devm_kzalloc(&i2c_client->dev,
+			sizeof(*es8389), GFP_KERNEL);
+	if (es8389 == NULL)
+		return -ENOMEM;
+
+	i2c_set_clientdata(i2c_client, es8389);
+	es8389->regmap = devm_regmap_init_i2c(i2c_client, &es8389_regmap);
+	if (IS_ERR(es8389->regmap))
+		return dev_err_probe(&i2c_client->dev, PTR_ERR(es8389->regmap),
+			"regmap_init() failed\n");
+
+	ret =  devm_snd_soc_register_component(&i2c_client->dev,
+			&soc_codec_dev_es8389,
+			&es8389_dai,
+			1);
+	if (ret < 0) {
+		kfree(es8389);
+		return ret;
+	}
+
+	return ret;
+}
+
+static const struct i2c_device_id es8389_i2c_id[] = {
+	{"es8389"},
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, es8389_i2c_id);
+
+static struct i2c_driver es8389_i2c_driver = {
+	.driver = {
+		.name	= "es8389",
+		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(es8389_if_dt_ids),
+	},
+	.shutdown = es8389_i2c_shutdown,
+	.probe = es8389_i2c_probe,
+	.id_table = es8389_i2c_id,
+};
+module_i2c_driver(es8389_i2c_driver);
+
+MODULE_DESCRIPTION("ASoC es8389 driver");
+MODULE_AUTHOR("Michael Zhang <zhangyi@everest-semi.com>");
+MODULE_LICENSE("GPL");
+
+
diff --git a/sound/soc/codecs/es8389.h b/sound/soc/codecs/es8389.h
new file mode 100644
index 000000000000..ea12ad9d4fc3
--- /dev/null
+++ b/sound/soc/codecs/es8389.h
@@ -0,0 +1,139 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+* ES8389.h  --  ES8389 ALSA SoC Audio Codec
+*
+* Authors:
+*
+* Based on ES8374.h by Michael Zhang
+*/
+
+#ifndef _ES8389_H
+#define _ES8389_H
+
+/*
+*     ES8389_REGISTER NAME_REG_REGISTER ADDRESS
+*/
+#define ES8389_RESET                  0x00  /*reset digital,csm,clock manager etc.*/
+
+/*
+* Clock Scheme Register definition
+*/
+#define ES8389_MASTER_MODE            0x01
+#define ES8389_MASTER_CLK             0x02
+#define ES8389_CLK_OFF1               0x03
+#define ES8389_CLK_DIV1               0x04
+#define ES8389_CLK_MUL                0x05
+#define ES8389_CLK_MUX1               0x06
+#define ES8389_CLK_MUX2               0x07
+#define ES8389_CLK_CTL1               0x08
+#define ES8389_CLK_CTL2               0x09
+#define ES8389_CLK_CTL3               0x0A
+#define ES8389_SCLK_DIV               0x0B
+#define ES8389_LRCK_DIV1              0x0C
+#define ES8389_LRCK_DIV2              0x0D
+#define ES8389_CLK_OFF2               0x0E
+#define ES8389_OSC_CLK                0x0F
+#define ES8389_CSM_JUMP               0x10
+#define ES8389_CLK_DIV2               0x11
+#define ES8389_SYSTEM12               0x12
+#define ES8389_SYSTEM13               0x13
+#define ES8389_SYSTEM14               0x14
+#define ES8389_SYSTEM15               0x15
+#define ES8389_SYSTEM16               0x16
+#define ES8389_SYSTEM17               0x17
+#define ES8389_SYSTEM18               0x18
+#define ES8389_SYSTEM19               0x19
+#define ES8389_SYSTEM1A               0x1A
+#define ES8389_SYSTEM1B               0x1B
+#define ES8389_SYSTEM1C               0x1C
+#define ES8389_ADC_FORMAT_MUTE        0x20
+#define ES8389_ADC_OSR                0x21
+#define ES8389_ADC_DSP                0x22
+#define ES8389_ADC_MODE               0x23
+#define ES8389_ADC_HPF1               0x24
+#define ES8389_ADC_HPF2               0x25
+#define ES8389_OSR_VOL                0x26
+#define ES8389_ADCL_VOL               0x27
+#define ES8389_ADCR_VOL               0x28
+#define ES8389_ALC_CTL                0x29
+#define ES8389_PTDM_SLOT              0x2A
+#define ES8389_ALC_ON                 0x2B
+#define ES8389_ALC_TARGET             0x2C
+#define ES8389_ALC_GAIN               0x2D
+#define ES8389_SYSTEM2E               0x2E
+#define ES8389_ADC_MUTE               0x2F
+#define ES8389_SYSTEM30               0x30
+#define ES8389_ADC_RESET              0x31
+#define ES8389_DAC_FORMAT_MUTE        0x40
+#define ES8389_DAC_DSM_OSR            0x41
+#define ES8389_DAC_DSP_OSR            0x42
+#define ES8389_DAC_MISC               0x43
+#define ES8389_DAC_MIX                0x44
+#define ES8389_DAC_INV                0x45
+#define ES8389_DACL_VOL               0x46
+#define ES8389_DACR_VOL               0x47
+#define ES8389_MIX_VOL                0x48
+#define ES8389_DAC_RAMP               0x49
+#define ES8389_SYSTEM4C               0x4C
+#define ES8389_DAC_RESET              0x4D
+#define ES8389_VMID                   0x60
+#define ES8389_ANA_CTL1               0x61
+#define ES8389_ANA_VSEL               0x62
+#define ES8389_ANA_CTL2               0x63
+#define ES8389_ADC_EN                 0x64
+#define ES8389_HPSW                   0x69
+#define ES8389_LOW_POWER1             0x6B
+#define ES8389_LOW_POWER2             0x6C
+#define ES8389_DMIC_EN                0x6D
+#define ES8389_PGA_SW                 0x6E
+#define ES8389_MOD_SW1                0x6F
+#define ES8389_MOD_SW2                0x70
+#define ES8389_MOD_SW3                0x71
+#define ES8389_MIC1_GAIN              0x72
+#define ES8389_MIC2_GAIN              0x73
+
+#define ES8389_CHIP_MISC              0xF0
+#define ES8389_CSM_STATE1             0xF1
+#define ES8389_PULL_DOWN              0xF2
+#define ES8389_ISO_CTL                0xF3
+#define ES8389_CSM_STATE2             0xF4
+
+#define ES8389_CHIP_ID0               0xFD
+#define ES8389_CHIP_ID1               0xFE
+
+#define ES8389_MAX_REGISTER           0xFF
+
+#define ES8389_MIC_SEL_MASK           (7 << 4)
+#define ES8389_MIC_DEFAULT            (1 << 4)
+
+#define ES8389_MASTER_MODE_EN         (1 << 0)
+
+#define ES8389_TDM_OFF                (0 << 0)
+#define ES8389_STDM_ON                (1 << 7)
+#define ES8389_PTDM_ON                (1 << 6)
+
+#define ES8389_TDM_MODE               ES8389_TDM_OFF
+#define ES8389_TDM_SLOT               (0x70 << 0)
+
+#define ES8389_MCLK_SOURCE            (1 << 6)
+#define ES8389_MCLK_PIN               (1 << 6)
+#define ES8389_SCLK_PIN               (0 << 6)
+
+/* ES8389_FMT */
+#define ES8389_S24_LE                 (0 << 5)
+#define ES8389_S20_3_LE               (1 << 5)
+#define ES8389_S18_LE                 (2 << 5)
+#define ES8389_S16_LE                 (3 << 5)
+#define ES8389_S32_LE                 (4 << 5)
+#define ES8389_DATA_LEN_MASK          (7 << 5)
+
+#define ES8389_DAIFMT_MASK            (7 << 2)
+#define ES8389_DAIFMT_I2S             0
+#define ES8389_DAIFMT_LEFT_J          (1 << 2)
+#define ES8389_DAIFMT_DSP_A           (1 << 3)
+#define ES8389_DAIFMT_DSP_B           (3 << 3)
+
+#define ES8389_STATE_ON               (13 << 0)
+#define ES8389_STATE_STANDBY          (7 << 0)
+
+#endif
-- 
2.17.1

