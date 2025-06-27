Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE617AEB8D6
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jun 2025 15:26:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0843602B4;
	Fri, 27 Jun 2025 15:26:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0843602B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751030788;
	bh=i2R2dNKqw4PuezJTlsVI345WAFSmmmgZN4+zDZxZRgs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cD/FJoqniO1qfG0HudIijhwF1TMowlaZE3wWk4rDpEYW8WAJhnN/rElFQOBlAYZfS
	 8qohMm5XUJmKtrheVoAazHhyKYyYl2G4E9i+vdk2ueMSnYudUsnFYfJw6wdV36Umjc
	 ooyAR3q9dTCBkRo59lNrLkXpDXoChD+zOqBOtuts=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3294FF80717; Fri, 27 Jun 2025 15:23:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FEBBF80716;
	Fri, 27 Jun 2025 15:23:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26627F804E5; Tue, 24 Jun 2025 17:38:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3D87F80087
	for <alsa-devel@alsa-project.org>; Tue, 24 Jun 2025 17:38:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3D87F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=gj9x5pK5
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55OFbw2e1595890;
	Tue, 24 Jun 2025 10:37:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750779478;
	bh=R1Q9o3tzr+f3oFSkfS3f6i6rxH84T4hOqsr7/i7QARo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gj9x5pK52kY8qWW3K73LjEHHe7AkULsRMT0ECpswoVbuDVfE9O3hiTsRksSfQMxMF
	 Au5iOT1WNBy9tJsKRR2s6m/hskoZd715C5cod/q9uvWLV6ScS0r6xVmNSPxc658enm
	 XscYLNDFmqZa2lz4CJ1gqACHAqkUtIorx++yDUUg=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55OFbwpr398545
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 10:37:58 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 10:37:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 10:37:57 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14]
 (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55OFboxl1744431;
	Tue, 24 Jun 2025 10:37:54 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <tiwai@suse.de>,
        <alsa-devel@alsa-project.org>, <baojun.xu@ti.com>,
        <shenghao-ding@ti.com>, <liam.r.girdwood@intel.com>, <navada@ti.com>,
        <v-hampiholi@ti.com>, <niranjan.hy@ti.com>
Subject: [PATCH v2 1/4] ASoc: tac5x1x: add codec driver tac5x1x family
Date: Tue, 24 Jun 2025 21:07:39 +0530
Message-ID: <20250624153742.1507-2-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20250624153742.1507-1-niranjan.hy@ti.com>
References: <20250624153742.1507-1-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MXSZXWWWFPOYUXTWSQENROZXF5SUVJAW
X-Message-ID-Hash: MXSZXWWWFPOYUXTWSQENROZXF5SUVJAW
X-Mailman-Approved-At: Fri, 27 Jun 2025 13:23:47 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MXSZXWWWFPOYUXTWSQENROZXF5SUVJAW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tac5x1x family are series of low-power and high performance
mono/stereo audio codecs consists of ADC and DAC combinations.
The patch adds supports for Codecs(DAC & ADC), ADC only and
DAC only configurations available in the tac5x1x family.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>

---
v2:
- Merge tac5x1x and tac5x1x-i2c into one tac5x1x-i2c
- Kconfig changes for
  * merge to removed SND_SOC_TAC5X1X
  * select REGMAP_I2C for SND_SOC_TAC5X1X_I2C
- Makefile changes for
  * merging tac5x1x and tac5x1x-i2c
  * sorted entry added for tac5x1x-i2c
- Removed a unwanted log during probe
- Removed "Reserved" keyword for bitmask
- Removed retry with sleep logic for regmap read/write
- Refactored interrupt handling code to have only thread
  function. Removed work function for interrupt handling.
  Also removed disabling/enabling interrupts in thread function.
- Replace EXPORT_SYMBOL to EXPORT_SYMBOL_GPL for tac5x1x_regmap
- Moved impedance related settings to DTS
- Used plain control for on/off switch for DAC related channel
  controls.
- Removed TDM slot selection mixer control. Configured the slot
  for the I2S mode during the .hw_params call
- Moved some ADC related settings to device tree as they are
  one time configurations.
- Replaced regulator APIs with regulator bulk APIs
- Moved cache sync after regulator enable during _resume
- Removed unwanted member variables
- Fixed "mixer control" error with certain dts configurations
- Fixed number of chars more than 80 for many lines
---
 sound/soc/codecs/Kconfig       |   12 +
 sound/soc/codecs/Makefile      |    2 +
 sound/soc/codecs/tac5x1x-i2c.c | 2225 ++++++++++++++++++++++++++++++++
 sound/soc/codecs/tac5x1x.h     |  300 +++++
 4 files changed, 2539 insertions(+)
 create mode 100644 sound/soc/codecs/tac5x1x-i2c.c
 create mode 100644 sound/soc/codecs/tac5x1x.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 6d7e4725d89c..32f8109add89 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -259,6 +259,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_STA529
 	imply SND_SOC_STAC9766
 	imply SND_SOC_STI_SAS
+	imply SND_SOC_TAC5X1X_I2C
 	imply SND_SOC_TAS2552
 	imply SND_SOC_TAS2562
 	imply SND_SOC_TAS2764
@@ -2008,6 +2009,17 @@ config SND_SOC_STAC9766
 config SND_SOC_STI_SAS
 	tristate "codec Audio support for STI SAS codec"
 
+config SND_SOC_TAC5X1X_I2C
+	tristate "Texas Instruments TAC5X1X family driver based on I2C"
+	depends on I2C && REGMAP_I2C
+	select REGMAP_I2C
+	help
+	  Enable support for Texas Instruments TAC5X1X family Audio chips.
+	  The family consists mono/stereo audio codecs, DACs and ADCs.
+	  Includes support for TAC5311-Q1, TAC5411-Q1, TAC5111, TAC5211,
+	  TAA5212, TAA5412-Q1, TAD5112, TAD5212, TAC5312, TAC5412-Q1,
+	  TAC5112, TAC5212
+
 config SND_SOC_TAS2552
 	tristate "Texas Instruments TAS2552 Mono Audio amplifier"
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index a68c3d192a1b..ba8d3504d561 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -303,6 +303,7 @@ snd-soc-sta350-y := sta350.o
 snd-soc-sta529-y := sta529.o
 snd-soc-stac9766-y := stac9766.o
 snd-soc-sti-sas-y := sti-sas.o
+snd-soc-tac5x1x-i2c-y := tac5x1x-i2c.o
 snd-soc-tas5086-y := tas5086.o
 snd-soc-tas571x-y := tas571x.o
 snd-soc-tas5720-y := tas5720.o
@@ -721,6 +722,7 @@ obj-$(CONFIG_SND_SOC_STA350)   += snd-soc-sta350.o
 obj-$(CONFIG_SND_SOC_STA529)   += snd-soc-sta529.o
 obj-$(CONFIG_SND_SOC_STAC9766)	+= snd-soc-stac9766.o
 obj-$(CONFIG_SND_SOC_STI_SAS)	+= snd-soc-sti-sas.o
+obj-$(CONFIG_SND_SOC_TAC5X1X_I2C)	+= snd-soc-tac5x1x-i2c.o
 obj-$(CONFIG_SND_SOC_TAS2552)	+= snd-soc-tas2552.o
 obj-$(CONFIG_SND_SOC_TAS2562)	+= snd-soc-tas2562.o
 obj-$(CONFIG_SND_SOC_TAS2764)	+= snd-soc-tas2764.o
diff --git a/sound/soc/codecs/tac5x1x-i2c.c b/sound/soc/codecs/tac5x1x-i2c.c
new file mode 100644
index 000000000000..c41e54ddffd6
--- /dev/null
+++ b/sound/soc/codecs/tac5x1x-i2c.c
@@ -0,0 +1,2225 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// tac5x1x.c
+//
+// Copyright (C) 2022 - 2025 Texas Instruments Incorporated
+//
+// Author: Kevin Lu <kevin-lu@ti.com>
+// Author: Kokila Karuppusamy <kokila.karuppusamy@ti.com>
+// Author: Niranjan H Y <niranjan.hy@ti.com>
+//
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
+#include <linux/of_irq.h>
+#include <linux/regulator/consumer.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <linux/regmap.h>
+#include <linux/device.h>
+#include <sound/tlv.h>
+#include <linux/i2c.h>
+#include <linux/bitops.h>
+
+#include "tac5x1x.h"
+
+struct tac5x1x_setup_gpio {
+	s32 gpio_func[3];
+	s32 gpio_drive[3];
+	s32 gpi1_func;
+	s32 gpa_gpio;
+};
+
+struct tac5x1x_input_diag_config {
+	s32 in_ch_en;
+	s32 out_ch_en;
+	s32 incl_se_inm;
+	s32 incl_ac_coup;
+};
+
+struct tac5x1x_irqinfo {
+	s32 irq_gpio;
+	s32 irq;
+	bool irq_enable;
+	u32 *latch_regs;
+	u8 *latch_data;
+};
+
+struct tac5x1x_priv {
+	struct snd_soc_component *component;
+	struct regmap *regmap;
+	struct device *dev;
+	enum tac5x1x_type codec_type;
+	s32 vref_vg;
+	s32 micbias_en;
+	s32 micbias_vg;
+	s32 uad_en;
+	s32 vad_en;
+	s32 uag_en;
+	s32 micbias_threshold[2];
+	s32 gpa_threshold[2];
+	s32 adc_impedance[2];
+	s32 out2x_vcom_cfg;
+	struct tac5x1x_setup_gpio *gpio_setup;
+	struct tac5x1x_irqinfo irqinfo;
+	struct tac5x1x_input_diag_config input_diag_config;
+};
+
+static int tac5x1x_num_regulators = 2;
+static struct regulator_bulk_data tac5x1x_regulators[] = {
+	{.supply = "iovdd"},
+	{.supply = "avdd"},
+};
+
+struct mask_to_txt {
+	u8 mask;
+	const char *const name;
+};
+
+struct interrupt_info {
+	u32 reg;
+	u32 count;
+	const struct mask_to_txt *mask_str_map;
+};
+
+#define TAC5X1X_EVENT(bit, evt_txt) (\
+	(struct mask_to_txt) { \
+		.mask = BIT((bit)), \
+		.name = evt_txt \
+	})
+
+static const struct mask_to_txt int_chx_latch[] = {
+	TAC5X1X_EVENT(7, "Input Channel1 fault"),
+	TAC5X1X_EVENT(6, "Input Channel2 fault"),
+	TAC5X1X_EVENT(5, "Output Channel1 fault"),
+	TAC5X1X_EVENT(4, "Output Channel2 fault"),
+	TAC5X1X_EVENT(3, "Short to VBAT_IN"),
+};
+
+static const struct mask_to_txt in_ch1_latch[] = {
+	TAC5X1X_EVENT(7, "IN_CH1 open Input"),
+	TAC5X1X_EVENT(6, "IN_CH1 Input shorted"),
+	TAC5X1X_EVENT(5, "IN_CH1 INP shorted to GND"),
+	TAC5X1X_EVENT(4, "IN_CH1 INM shorted to GND"),
+	TAC5X1X_EVENT(3, "IN_CH1 INP shorted to MICBIAS"),
+	TAC5X1X_EVENT(2, "IN_CH1 INM shorted to MICBIAS"),
+	TAC5X1X_EVENT(1, "IN_CH1 INP shorted to VBAT_IN"),
+	TAC5X1X_EVENT(0, "IN_CH1 INM shorted to VBAT_IN"),
+};
+
+static const struct mask_to_txt in_ch2_latch[] = {
+	TAC5X1X_EVENT(7, "IN_CH2 open Input"),
+	TAC5X1X_EVENT(6, "IN_CH2 Input shorted"),
+	TAC5X1X_EVENT(5, "IN_CH2 INP shorted to GND"),
+	TAC5X1X_EVENT(4, "IN_CH2 INM shorted to GND"),
+	TAC5X1X_EVENT(3, "IN_CH2 INP shorted to MICBIAS"),
+	TAC5X1X_EVENT(2, "IN_CH2 INM shorted to MICBIAS"),
+	TAC5X1X_EVENT(1, "IN_CH2 INP shorted to VBAT_IN"),
+	TAC5X1X_EVENT(0, "IN_CH2 INM shorted to VBAT_IN"),
+};
+
+static const struct mask_to_txt out_ch1_latch[] = {
+	TAC5X1X_EVENT(7, "OUT_CH1 OUT1P Short circuit Fault"),
+	TAC5X1X_EVENT(6, "OUT_CH1 OUT1M Short circuit Fault"),
+	TAC5X1X_EVENT(5, "OUT_CH1 DRVRP Virtual Ground Fault"),
+	TAC5X1X_EVENT(4, "OUT_CH1 DRVRM Virtual ground Fault"),
+	/* masks */
+	TAC5X1X_EVENT(3, "OUT_CH1 ADC CH1 Mask"),
+	TAC5X1X_EVENT(2, "OUT_CH1 ADC CH2 MASK"),
+};
+
+static const struct mask_to_txt out_ch2_latch[] = {
+	TAC5X1X_EVENT(7, "OUT_CH2 OUT2P Short circuit Fault"),
+	TAC5X1X_EVENT(6, "OUT_CH2 OUT2M Short circuit Fault"),
+	TAC5X1X_EVENT(5, "OUT_CH2 DRVRP Virtual Ground Fault"),
+	TAC5X1X_EVENT(4, "OUT_CH2 DRVRM Virtual ground Fault"),
+	/* mask */
+	TAC5X1X_EVENT(1, "AREG SC Fault Mask"),
+	TAC5X1X_EVENT(0, "AREG SC Fault"),
+};
+
+static const struct mask_to_txt int_latch1[] = {
+	TAC5X1X_EVENT(7, "CH1 INP Over Voltage"),
+	TAC5X1X_EVENT(6, "CH1 INM Over Voltage"),
+	TAC5X1X_EVENT(5, "CH2 INP over Voltage"),
+	TAC5X1X_EVENT(4, "CH2 INM Over Voltage"),
+	TAC5X1X_EVENT(3, "Headset Insert Detection"),
+	TAC5X1X_EVENT(2, "Headset Remove Detection"),
+	TAC5X1X_EVENT(1, "Headset Hook"),
+	TAC5X1X_EVENT(0, "MIPS Overload"),
+};
+
+static const struct mask_to_txt int_latch2[] = {
+	TAC5X1X_EVENT(7, "GPA Up threashold Fault"),
+	TAC5X1X_EVENT(6, "GPA low threashold Fault"),
+	TAC5X1X_EVENT(5, "VAD Power up detect"),
+	TAC5X1X_EVENT(4, "VAD power down detect"),
+	TAC5X1X_EVENT(3, "Micbias short circuit"),
+	TAC5X1X_EVENT(2, "Micbias high current fault"),
+	TAC5X1X_EVENT(1, "Micbias low current fault"),
+	TAC5X1X_EVENT(0, "Micbias Over voltage fault"),
+};
+
+static const struct mask_to_txt int_latch_0[] = {
+	TAC5X1X_EVENT(7, "Clock Error"),
+	TAC5X1X_EVENT(6, "PLL Lock"),
+	TAC5X1X_EVENT(5, "Boost Over Temperature"),
+	TAC5X1X_EVENT(4, "Boost Over Current"),
+	TAC5X1X_EVENT(3, "Boost MO"),
+};
+
+#define LTCH_TO_MASK_STR_MAP(latch_reg, str_map, map_size) (\
+	(struct interrupt_info){ \
+		.reg = (latch_reg), \
+		.count = (map_size), \
+		.mask_str_map = (str_map), \
+	})
+
+static const struct interrupt_info intr_info_list[] = {
+	LTCH_TO_MASK_STR_MAP(TAC5X1X_REG_CHX_LTCH, int_chx_latch,
+			     ARRAY_SIZE(int_chx_latch)),
+	LTCH_TO_MASK_STR_MAP(TAC5X1X_REG_IN_CH1_LTCH, in_ch1_latch,
+			     ARRAY_SIZE(in_ch1_latch)),
+	LTCH_TO_MASK_STR_MAP(TAC5X1X_REG_IN_CH2_LTCH, in_ch2_latch,
+			     ARRAY_SIZE(in_ch2_latch)),
+	LTCH_TO_MASK_STR_MAP(TAC5X1X_REG_OUT_CH1_LTCH, out_ch1_latch,
+			     ARRAY_SIZE(out_ch1_latch)),
+	LTCH_TO_MASK_STR_MAP(TAC5X1X_REG_OUT_CH2_LTCH, out_ch2_latch,
+			     ARRAY_SIZE(out_ch2_latch)),
+	LTCH_TO_MASK_STR_MAP(TAC5X1X_REG_INT_LTCH1, int_latch1,
+			     ARRAY_SIZE(int_latch1)),
+	LTCH_TO_MASK_STR_MAP(TAC5X1X_REG_INT_LTCH2, int_latch2,
+			     ARRAY_SIZE(int_latch2)),
+	/* This should be the last entry */
+	LTCH_TO_MASK_STR_MAP(TAC5X1X_REG_INT_LTCH0, int_latch_0,
+			     ARRAY_SIZE(int_latch_0)),
+};
+
+static const struct regmap_range_cfg tac5x1x_ranges[] = {
+	{
+		.range_min = 0,
+		.range_max = 12 * 128,
+		.selector_reg = TAC_PAGE_SELECT,
+		.selector_mask = GENMASK(7, 0),
+		.selector_shift = 0,
+		.window_start = 0,
+		.window_len = 128,
+	},
+};
+
+static bool tac5x1x_volatile_regs(struct device *dev, unsigned int reg)
+{
+	bool is_volatile;
+
+	switch (reg) {
+	case TAC5X1X_RESET:
+	case TAC5X1X_REG_INT_LTCH0 ... TAC5X1X_REG_INT_LTCH2:
+		is_volatile = true;
+		break;
+
+	default:
+		is_volatile = false;
+		break;
+	}
+
+	return is_volatile;
+}
+
+static const struct regmap_config tac5x1x_regmap = {
+	.max_register = 12 * 128,
+	.reg_bits = 8,
+	.val_bits = 8,
+	.cache_type = REGCACHE_MAPLE,
+	.ranges = tac5x1x_ranges,
+	.volatile_reg = tac5x1x_volatile_regs,
+	.num_ranges = ARRAY_SIZE(tac5x1x_ranges),
+};
+
+static void process_one_interrupt(struct tac5x1x_priv *tac5x1x, s32 index,
+				  s32 value)
+{
+	u32 map_count, i;
+	const struct mask_to_txt *map_items;
+
+	map_count = intr_info_list[index].count;
+	map_items = intr_info_list[index].mask_str_map;
+
+	for (i = 0; i < map_count; i++) {
+		if (value & map_items[i].mask)
+			dev_err(tac5x1x->dev, "Interrupt %s detected\n",
+				map_items[i].name);
+	}
+}
+
+static irqreturn_t irq_thread_func(s32 irq, void *dev_id)
+{
+	u8 latch_set = 0;
+	u32 latch_count;
+	s32 i, ret;
+	struct tac5x1x_priv *tac5x1x = (struct tac5x1x_priv *)dev_id;
+
+	latch_count = ARRAY_SIZE(intr_info_list);
+
+	ret = regmap_multi_reg_read(tac5x1x->regmap,
+				    tac5x1x->irqinfo.latch_regs,
+				    tac5x1x->irqinfo.latch_data, latch_count);
+	if (ret) {
+		dev_err(tac5x1x->dev,
+			"interrupt: latch register read failed");
+		return IRQ_HANDLED;
+	}
+
+	for (i = 0; i < latch_count; i++) {
+		dev_dbg(tac5x1x->dev, "reg=0x%0x, val=0x%02x",
+			tac5x1x->irqinfo.latch_regs[i],
+			tac5x1x->irqinfo.latch_data[i]);
+		latch_set |= tac5x1x->irqinfo.latch_data[i] & 0xff;
+	}
+
+	if (!latch_set)
+		return IRQ_NONE;
+
+	for (i = 0; i < latch_count; i++) {
+		if (!tac5x1x->irqinfo.latch_data[i])
+			continue;
+		process_one_interrupt(tac5x1x, i,
+				      tac5x1x->irqinfo.latch_data[i]);
+		tac5x1x->irqinfo.latch_data[i] = 0;
+	}
+
+	return IRQ_HANDLED;
+}
+
+static s32 tac5x1x_register_interrupt(struct tac5x1x_priv *tac5x1x)
+{
+	struct device_node *np = tac5x1x->dev->of_node;
+	s32 ret, latch_count, i;
+	u32 *latch_regs;
+	u8 *latch_data;
+
+	latch_count = ARRAY_SIZE(intr_info_list);
+	tac5x1x->irqinfo.irq = of_irq_get(np, 0);
+	if (tac5x1x->irqinfo.irq < 0)
+		return tac5x1x->irqinfo.irq;
+
+	latch_regs = devm_kzalloc(tac5x1x->dev, latch_count * sizeof(u32),
+				  GFP_KERNEL);
+	latch_data = devm_kzalloc(tac5x1x->dev, latch_count * sizeof(u8),
+				  GFP_KERNEL);
+	if (!latch_data || !latch_regs)
+		return -ENOMEM;
+
+	for (i = 0; i < latch_count; i++)
+		latch_regs[i] = intr_info_list[i].reg;
+
+	tac5x1x->irqinfo.latch_regs = latch_regs;
+	tac5x1x->irqinfo.latch_data = latch_data;
+
+	ret = devm_request_threaded_irq(tac5x1x->dev, tac5x1x->irqinfo.irq,
+					NULL, irq_thread_func,
+					IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+					"TAC-IRQ", tac5x1x);
+	if (ret)
+		dev_err(tac5x1x->dev, "request irq failed, irq=%d ret %d\n",
+			tac5x1x->irqinfo.irq, ret);
+
+	return ret;
+}
+
+static s32 tac5x1x_get_GPIO1_gpio(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	s32 val;
+
+	val = snd_soc_component_read(component, TAC5X1X_GPIOVAL);
+	ucontrol->value.integer.value[0] = !!(val & TAC5X1X_GPIO1_MON);
+
+	return 0;
+};
+
+static s32 tac5x1x_get_GPIO2_gpio(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	s32 val;
+
+	val = snd_soc_component_read(component, TAC5X1X_GPIOVAL);
+	ucontrol->value.integer.value[0] = !!(val & TAC5X1X_GPIO2_MON);
+
+	return 0;
+};
+
+static s32 tac5x1x_get_GPI1_gpio(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	s32 val;
+
+	val = snd_soc_component_read(component, TAC5X1X_GPIOVAL);
+	ucontrol->value.integer.value[0] = !!(val & TAC5X1X_GPI1_MON);
+
+	return 0;
+};
+
+static const struct snd_kcontrol_new GPIO1_I[] = {
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "GPIO1 GPI",
+		.access = SNDRV_CTL_ELEM_ACCESS_READ,
+		.get = tac5x1x_get_GPIO1_gpio,
+		.info = snd_soc_info_bool_ext,
+	}
+};
+
+static const struct snd_kcontrol_new GPIO2_I[] = {
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "GPIO2 GPI",
+		.access = SNDRV_CTL_ELEM_ACCESS_READ,
+		.get = tac5x1x_get_GPIO2_gpio,
+		.info = snd_soc_info_bool_ext,
+	}
+};
+
+static const struct snd_kcontrol_new tac5x1x_GPI1[] = {
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "GPI1 GPI",
+		.access = SNDRV_CTL_ELEM_ACCESS_READ,
+		.get = tac5x1x_get_GPI1_gpio,
+		.info = snd_soc_info_bool_ext,
+	}
+};
+
+/* Record */
+/* ADC Analog/PDM Selection */
+static const char *const tac5x1x_input_source_text[] = {"Analog", "PDM"};
+
+static SOC_ENUM_SINGLE_DECL(tac5x1x_in1_source_enum, TAC5X1X_INTF4, 7,
+		tac5x1x_input_source_text);
+static SOC_ENUM_SINGLE_DECL(tac5x1x_in2_source_enum, TAC5X1X_INTF4, 6,
+		tac5x1x_input_source_text);
+
+static const struct snd_kcontrol_new tac5x1x_dapm_in1_source_control[] = {
+	SOC_DAPM_ENUM("CH1 Source MUX", tac5x1x_in1_source_enum),
+};
+
+static const struct snd_kcontrol_new tac5x1x_dapm_in2_source_control[] = {
+	SOC_DAPM_ENUM("CH2 Source MUX", tac5x1x_in2_source_enum),
+};
+
+static const char *const tad5x1x_input_source_text[] = {"Disable", "PDM"};
+static SOC_ENUM_SINGLE_DECL(tad5x1x_in1_source_enum, TAC5X1X_INTF4, 7,
+		tad5x1x_input_source_text);
+static SOC_ENUM_SINGLE_DECL(tad5x1x_in2_source_enum, TAC5X1X_INTF4, 6,
+		tad5x1x_input_source_text);
+
+static const struct snd_kcontrol_new tad5x1x_dapm_in1_source_control[] = {
+	SOC_DAPM_ENUM("CH1 Source MUX", tad5x1x_in1_source_enum),
+};
+
+static const struct snd_kcontrol_new tad5x1x_dapm_in2_source_control[] = {
+	SOC_DAPM_ENUM("CH2 Source MUX", tad5x1x_in2_source_enum),
+};
+
+/* ADC Analog source Selection */
+static const char *const tac5x1x_input_analog_sel_text[] = {
+	"Differential",
+	"Single-ended",
+	"Single-ended mux INxP",
+	"Single-ended mux INxM",
+};
+
+static const char *const tac5x1x_input_analog2_sel_text[] = {
+	"Differential",
+	"Single-ended",
+};
+
+static SOC_ENUM_SINGLE_DECL(tac5x1x_adc1_config_enum, TAC5X1X_ADCCH1C0, 6,
+		tac5x1x_input_analog_sel_text);
+static SOC_ENUM_SINGLE_DECL(tac5x1x_adc2_config_enum, TAC5X1X_ADCCH2C0, 6,
+		tac5x1x_input_analog2_sel_text);
+
+static const struct snd_kcontrol_new tac5x1x_dapm_adc1_config_control[] = {
+	SOC_DAPM_ENUM("ADC1 Analog MUX", tac5x1x_adc1_config_enum),
+};
+
+static const struct snd_kcontrol_new tac5x1x_dapm_adc2_config_control[] = {
+	SOC_DAPM_ENUM("ADC2 Analog MUX", tac5x1x_adc2_config_enum),
+};
+
+/*
+ * ADC full-scale selection
+ * 2/10-VRMS is for TAX52xx/TAX51xx devices
+ * 4/5-VRMS is for TAX54xx/TAX53xx devices
+ */
+static const char *const tac5x1x_adc_fscale_text[] = {"2/10-VRMS",
+	"4/5-VRMS"};
+
+static SOC_ENUM_SINGLE_DECL(tac5x1x_adc1_fscale_enum, TAC5X1X_ADCCH1C0, 1,
+		tac5x1x_adc_fscale_text);
+static SOC_ENUM_SINGLE_DECL(tac5x1x_adc2_fscale_enum, TAC5X1X_ADCCH2C0, 1,
+		tac5x1x_adc_fscale_text);
+
+static const struct snd_kcontrol_new tac5x1x_dapm_adc1_fscale_control[] = {
+	SOC_DAPM_ENUM("ADC1 FSCALE MUX", tac5x1x_adc1_fscale_enum),
+};
+
+static const struct snd_kcontrol_new tac5x1x_dapm_adc2_fscale_control[] = {
+	SOC_DAPM_ENUM("ADC2 FSCALE MUX", tac5x1x_adc2_fscale_enum),
+};
+
+/* PDM Data input pin Selection */
+static const char *const pdm_pin_text[] = {
+	"Disable",
+	"GPIO1",
+	"GPIO2",
+	"GPI1",
+};
+
+static SOC_ENUM_SINGLE_DECL(pdm_12_pin_enum, TAC5X1X_INTF4, 2, pdm_pin_text);
+static SOC_ENUM_SINGLE_DECL(pdm_34_pin_enum, TAC5X1X_INTF4, 0, pdm_pin_text);
+static const struct snd_kcontrol_new pdm_12_pin_controls[] = {
+	SOC_DAPM_ENUM("PDM chn12 Datain Select", pdm_12_pin_enum),
+};
+
+static const struct snd_kcontrol_new pdm_34_pin_controls[] = {
+	SOC_DAPM_ENUM("PDM chn34 Datain Select", pdm_34_pin_enum),
+};
+
+static const char *const pdmclk_text[] = {
+	"2.8224 MHz or 3.072 MHz", "1.4112 MHz or 1.536 MHz",
+	"705.6 kHz or 768 kHz", "5.6448 MHz or 6.144 MHz"};
+
+static SOC_ENUM_SINGLE_DECL(pdmclk_select_enum, TAC5X1X_CNTCLK0, 6,
+		pdmclk_text);
+
+/* Digital Volume control. From -80 to 47 dB in 0.5 dB steps */
+static DECLARE_TLV_DB_SCALE(record_dig_vol_tlv, -8000, 50, 0);
+
+/* Gain Calibration control. From -0.8db to 0.7db dB in 0.1 dB steps */
+static DECLARE_TLV_DB_MINMAX(record_gain_cali_tlv, -80, 70);
+
+/* Analog Level control. From -12 to 24 dB in 6 dB steps */
+static DECLARE_TLV_DB_SCALE(playback_analog_level_tlv, -1200, 600, 0);
+
+/* Digital Volume control. From -100 to 27 dB in 0.5 dB steps */
+static DECLARE_TLV_DB_SCALE(dac_dig_vol_tlv, -10000, 50, 0); // mute ?
+
+/* Gain Calibration control. From -0.8db to 0.7db dB in 0.1 dB steps */
+static DECLARE_TLV_DB_MINMAX(playback_gain_cali_tlv, -80, 70);
+
+/* Output Source Selection */
+static const char *const tac5x1x_output_source_text[] = {
+	"Disabled",
+	"DAC Input",
+	"Analog Bypass",
+	"DAC + Analog Bypass Mix",
+	"DAC -> OUTxP, INxP -> OUTxM",
+	"INxM -> OUTxP, DAC -> OUTxM",
+};
+
+static SOC_ENUM_SINGLE_DECL(tac5x1x_out1_source_enum, TAC5X1X_OUT1CFG0, 5,
+		tac5x1x_output_source_text);
+static SOC_ENUM_SINGLE_DECL(tac5x1x_out2_source_enum, TAC5X1X_OUT2CFG0, 5,
+		tac5x1x_output_source_text);
+
+static const struct snd_kcontrol_new tac5x1x_dapm_out1_source_control[] = {
+	SOC_DAPM_ENUM("OUT1X MUX", tac5x1x_out1_source_enum),
+};
+
+static const struct snd_kcontrol_new tac5x1x_dapm_out2_source_control[] = {
+	SOC_DAPM_ENUM("OUT2X MUX", tac5x1x_out2_source_enum),
+};
+
+/* Output Config Selection */
+static const char *const tac5x1x_output_config_text[] = {
+	"Differential",
+	"Stereo Single-ended",
+	"Mono Single-ended at OUTxP only",
+	"Mono Single-ended at OUTxM only",
+	"Pseudo differential with OUTxM as VCOM",
+	"Pseudo differential with OUTxM as external sensing",
+	"Pseudo differential with OUTxP as VCOM",
+};
+
+static const char *const tac5x1x_output2_config_text[] = {
+	"Differential",
+	"Stereo Single-ended",
+	"Mono Single-ended at OUTxP only",
+	"Mono Single-ended at OUTxM only",
+	"Pseudo differential with OUTxM as VCOM",
+	"Pseudo differential with OUTxP as VCOM",
+};
+
+static const s32 tac5x1x_output2_config_values[] = {
+	0, 1, 2, 3, 4, 6
+};
+
+static SOC_ENUM_SINGLE_DECL(tac5x1x_out1_config_enum, TAC5X1X_OUT1CFG0, 2,
+			tac5x1x_output_config_text);
+static SOC_VALUE_ENUM_SINGLE_DECL(tac5x1x_out2_config_enum,
+				  TAC5X1X_OUT2CFG0, 2, 0x7,
+				  tac5x1x_output2_config_text,
+				  tac5x1x_output2_config_values);
+
+static const struct snd_kcontrol_new tac5x1x_dapm_out1_config_control[] = {
+	SOC_DAPM_ENUM("OUT1X Config MUX", tac5x1x_out1_config_enum),
+};
+
+static const struct snd_kcontrol_new tac5x1x_dapm_out2_config_control[] = {
+	SOC_DAPM_ENUM("OUT2X Config MUX", tac5x1x_out2_config_enum),
+};
+
+static const char *const tac5x1x_wideband_text[] = {
+	"Audio BW 24-kHz",
+	"Wide BW 96-kHz",
+};
+
+static SOC_ENUM_SINGLE_DECL(tac5x1x_adc1_wideband_enum, TAC5X1X_ADCCH1C0, 0,
+		tac5x1x_wideband_text);
+static SOC_ENUM_SINGLE_DECL(tac5x1x_adc2_wideband_enum, TAC5X1X_ADCCH2C0, 0,
+		tac5x1x_wideband_text);
+static SOC_ENUM_SINGLE_DECL(tac5x1x_dac1_wideband_enum, TAC5X1X_OUT1CFG1, 0,
+		tac5x1x_wideband_text);
+static SOC_ENUM_SINGLE_DECL(tac5x1x_dac2_wideband_enum, TAC5X1X_OUT2CFG1, 0,
+		tac5x1x_wideband_text);
+
+static const char *const tac5x1x_tolerance_text[] = {
+	"AC Coupled with 100mVpp",
+	"AC/DC Coupled with 1Vpp",
+	"AC/DC Coupled with Rail-to-rail",
+};
+
+static SOC_ENUM_SINGLE_DECL(tac5x1x_adc1_tolerance_enum, TAC5X1X_ADCCH1C0, 2,
+		tac5x1x_tolerance_text);
+static SOC_ENUM_SINGLE_DECL(tac5x1x_adc2_tolerance_enum, TAC5X1X_ADCCH2C0, 2,
+		tac5x1x_tolerance_text);
+
+/* Output Drive Selection */
+static const char *const tac5x1x_output_driver_text[] = {
+	"Line-out",
+	"Headphone",
+	"4 ohm",
+	"FD Receiver/Debug",
+};
+
+static SOC_ENUM_SINGLE_DECL(out1p_driver_enum, TAC5X1X_OUT1CFG1, 6,
+		tac5x1x_output_driver_text);
+
+static SOC_ENUM_SINGLE_DECL(out2p_driver_enum, TAC5X1X_OUT2CFG1, 6,
+		tac5x1x_output_driver_text);
+
+static const struct snd_kcontrol_new tac5x1x_dapm_out1_driver_control[] = {
+	SOC_DAPM_ENUM("OUT1 driver MUX", out1p_driver_enum),
+};
+
+static const struct snd_kcontrol_new tac5x1x_dapm_out2_driver_control[] = {
+	SOC_DAPM_ENUM("OUT2 driver MUX", out2p_driver_enum),
+};
+
+/* Decimation Filter Selection */
+static const char *const decimation_filter_text[] = {
+	"Linear Phase", "Low Latency", "Ultra-low Latency"};
+
+static SOC_ENUM_SINGLE_DECL(decimation_filter_record_enum, TAC5X1X_DSP0, 6,
+			decimation_filter_text);
+static SOC_ENUM_SINGLE_DECL(decimation_filter_playback_enum, TAC5X1X_DSP1, 6,
+			    decimation_filter_text);
+
+static const struct snd_kcontrol_new tx_ch1_asi_switch =
+	SOC_DAPM_SINGLE("Capture Switch", TAC5X1X_PASITXCH1, 5, 1, 0);
+static const struct snd_kcontrol_new tx_ch2_asi_switch =
+	SOC_DAPM_SINGLE("Capture Switch", TAC5X1X_PASITXCH2, 5, 1, 0);
+static const struct snd_kcontrol_new tx_ch3_asi_switch =
+	SOC_DAPM_SINGLE("Capture Switch", TAC5X1X_PASITXCH3, 5, 1, 0);
+static const struct snd_kcontrol_new tx_ch4_asi_switch =
+	SOC_DAPM_SINGLE("Capture Switch", TAC5X1X_PASITXCH4, 5, 1, 0);
+
+static const struct snd_kcontrol_new rx_ch1_asi_switch =
+	SOC_DAPM_SINGLE("Switch", TAC5X1X_PASIRXCH1, 5, 1, 0);
+static const struct snd_kcontrol_new rx_ch2_asi_switch =
+	SOC_DAPM_SINGLE("Switch", TAC5X1X_PASIRXCH2, 5, 1, 0);
+
+static const char *const rx_ch5_asi_cfg_text[] = {
+		"Disable",
+		"DAC channel data",
+		"ADC channel output loopback",
+};
+
+static const char *const rx_ch6_asi_cfg_text[] = {
+		"Disable",
+		"DAC channel data",
+		"ADC channel output loopback",
+		"Channel Input to ICLA device",
+};
+
+static const char *const tx_ch5_asi_cfg_text[] = {
+		"Tristate",
+		"Input Channel Loopback data",
+		"Echo reference Channel data",
+};
+
+static const char *const tx_ch7_asi_cfg_text[] = {
+		"Tristate",
+		"Vbat_Wlby2,Temp_Wlby2",
+		"echo_ref_ch1,echo_ref_ch2",
+};
+
+static const char *const tx_ch8_asi_cfg_text[] = {
+		"Tristate",
+		"ICLA data",
+};
+
+static const char *const diag_cfg_text[] = {
+	"0mv", "30mv", "60mv", "90mv",
+	"120mv", "150mv", "180mv", "210mv",
+	"240mv", "270mv", "300mv", "330mv",
+	"360mv", "390mv", "420mv", "450mv",
+};
+
+static const char *const diag_cfg_gnd_text[] = {
+	"0mv", "60mv", "120mv", "180mv",
+	"240mv", "300mv", "360mv", "420mv",
+	"480mv", "540mv", "600mv", "660mv",
+	"720mv", "780mv", "840mv", "900mv",
+};
+
+static SOC_ENUM_SINGLE_DECL(tx_ch5_asi_cfg_enum, TAC5X1X_PASITXCH5, 5,
+		tx_ch5_asi_cfg_text);
+static SOC_ENUM_SINGLE_DECL(tx_ch6_asi_cfg_enum, TAC5X1X_PASITXCH6, 5,
+		tx_ch5_asi_cfg_text);
+static SOC_ENUM_SINGLE_DECL(tx_ch7_asi_cfg_enum, TAC5X1X_PASITXCH7, 5,
+		tx_ch7_asi_cfg_text);
+static SOC_ENUM_SINGLE_DECL(tx_ch8_asi_cfg_enum, TAC5X1X_PASITXCH8, 5,
+		tx_ch8_asi_cfg_text);
+static SOC_ENUM_SINGLE_DECL(rx_ch5_asi_cfg_enum, TAC5X1X_PASIRXCH5, 5,
+		rx_ch5_asi_cfg_text);
+static SOC_ENUM_SINGLE_DECL(rx_ch6_asi_cfg_enum, TAC5X1X_PASIRXCH6, 5,
+		rx_ch6_asi_cfg_text);
+static SOC_ENUM_SINGLE_DECL(rx_ch7_asi_cfg_enum, TAC5X1X_PASIRXCH7, 5,
+		rx_ch6_asi_cfg_text);
+static SOC_ENUM_SINGLE_DECL(rx_ch8_asi_cfg_enum, TAC5X1X_PASIRXCH8, 5,
+		rx_ch6_asi_cfg_text);
+static SOC_ENUM_SINGLE_DECL(diag_cfg1_sht_term_enum, TAC5X1X_DIAG_CFG1, 4,
+		diag_cfg_text);
+static SOC_ENUM_SINGLE_DECL(diag_cfg1_vbat_in_enum, TAC5X1X_DIAG_CFG1, 0,
+		diag_cfg_text);
+static SOC_ENUM_SINGLE_DECL(diag_cfg2_sht_gnd_enum, TAC5X1X_DIAG_CFG2, 4,
+		diag_cfg_gnd_text);
+static SOC_ENUM_SINGLE_DECL(diag_cfg2_micbias, TAC5X1X_DIAG_CFG2, 0,
+		diag_cfg_text);
+
+static const struct snd_kcontrol_new taa5x1x_controls[] = {
+	SOC_ENUM("Record Decimation Filter",
+		 decimation_filter_record_enum),
+	SOC_ENUM("ADC1 Audio BW", tac5x1x_adc1_wideband_enum),
+
+	SOC_SINGLE_TLV("ADC1 Digital Capture Volume", TAC5X1X_ADCCH1C2,
+		       0, 0xff, 0, record_dig_vol_tlv),
+
+	SOC_SINGLE_TLV("ADC1 Fine Capture Volume", TAC5X1X_ADCCH1C3,
+		       0, 0xff, 0, record_gain_cali_tlv),
+
+	SOC_SINGLE_RANGE("ADC1 Phase Capture Volume", TAC5X1X_ADCCH1C4,
+			 2, 0, 63, 0),
+
+	SOC_ENUM("ASI_TX_CH5_CFG", tx_ch5_asi_cfg_enum),
+	SOC_ENUM("ASI_TX_CH6_CFG", tx_ch6_asi_cfg_enum),
+	SOC_ENUM("ASI_TX_CH7_CFG", tx_ch7_asi_cfg_enum),
+	SOC_ENUM("ASI_TX_CH8_CFG", tx_ch8_asi_cfg_enum),
+	SOC_SINGLE("IN_CH1_EN Capture Switch", TAC5X1X_CH_EN, 7, 1, 0),
+	SOC_SINGLE("IN_CH2_EN Capture Switch", TAC5X1X_CH_EN, 6, 1, 0),
+	SOC_SINGLE("IN_CH3_EN Capture Switch", TAC5X1X_CH_EN, 5, 1, 0),
+	SOC_SINGLE("IN_CH4_EN Capture Switch", TAC5X1X_CH_EN, 4, 1, 0),
+};
+
+static const struct snd_kcontrol_new tad5x1x_controls[] = {
+	SOC_ENUM("Playback Decimation Filter",
+		 decimation_filter_playback_enum),
+	SOC_ENUM("DAC1 Audio BW", tac5x1x_dac1_wideband_enum),
+	SOC_SINGLE_TLV("OUT1P Analog Level Playback Volume", TAC5X1X_OUT1CFG1,
+		       3, 6, 1, playback_analog_level_tlv),
+	SOC_SINGLE_TLV("OUT1M Analog Level Playback Volume", TAC5X1X_OUT1CFG2,
+		       3, 6, 1, playback_analog_level_tlv),
+	SOC_SINGLE_TLV("DAC1 CHA Digital Playback Volume", TAC5X1X_DACCH1A0,
+		       0, 0xff, 0, dac_dig_vol_tlv),
+	SOC_SINGLE_TLV("DAC1 CHB Digital Playback Volume", TAC5X1X_DACCH1B0,
+		       0, 0xff, 0, dac_dig_vol_tlv),
+	SOC_SINGLE_TLV("DAC1 CHA Gain Calibration Playback Volume",
+		       TAC5X1X_DACCH1A1, 4, 0xf, 0,
+		       playback_gain_cali_tlv),
+	SOC_SINGLE_TLV("DAC1 CHB Gain Calibration Playback Volume",
+		       TAC5X1X_DACCH1B1, 4, 0xf, 0,
+		       playback_gain_cali_tlv),
+
+	SOC_SINGLE("ASI_RX_CH3_EN Playback Switch",
+		   TAC5X1X_PASIRXCH3, 5, 1, 0),
+	SOC_SINGLE("ASI_RX_CH4_EN Playback Switch",
+		   TAC5X1X_PASIRXCH4, 5, 1, 0),
+	SOC_ENUM("ASI_RX_CH5_EN Playback", rx_ch5_asi_cfg_enum),
+	SOC_ENUM("ASI_RX_CH6_EN Playback", rx_ch6_asi_cfg_enum),
+	SOC_ENUM("ASI_RX_CH7_EN Playback", rx_ch7_asi_cfg_enum),
+	SOC_ENUM("ASI_RX_CH8_EN Playback", rx_ch8_asi_cfg_enum),
+	SOC_SINGLE("OUT_CH1_EN Playback Switch", TAC5X1X_CH_EN, 3, 1, 0),
+	SOC_SINGLE("OUT_CH2_EN Playback Switch", TAC5X1X_CH_EN, 2, 1, 0),
+	SOC_SINGLE("OUT_CH3_EN Playback Switch", TAC5X1X_CH_EN, 1, 1, 0),
+	SOC_SINGLE("OUT_CH4_EN Playback Switch", TAC5X1X_CH_EN, 0, 1, 0),
+};
+
+static const struct snd_kcontrol_new tac5x11_controls[] = {
+	SOC_ENUM("ADC1 Common-mode Tolerance", tac5x1x_adc1_tolerance_enum),
+};
+
+static const struct snd_kcontrol_new tad5x12_controls[] = {
+	SOC_SINGLE_TLV("OUT2P Analog Level Playback Volume", TAC5X1X_OUT2CFG1,
+		       3, 6, 1, playback_analog_level_tlv),
+	SOC_SINGLE_TLV("OUT2M Analog Level Playback Volume", TAC5X1X_OUT2CFG2,
+		       3, 6, 1, playback_analog_level_tlv),
+	SOC_SINGLE_TLV("DAC2 CHA Digital Playback Volume", TAC5X1X_DACCH2A0,
+		       0, 0xff, 0, dac_dig_vol_tlv),
+	SOC_SINGLE_TLV("DAC2 CHB Digital Playback Volume", TAC5X1X_DACCH2B0,
+		       0, 0xff, 0, dac_dig_vol_tlv),
+	SOC_SINGLE_TLV("DAC2 CHA Gain Calibration Playback Volume",
+		       TAC5X1X_DACCH2A1, 4, 0xf, 0,
+			playback_gain_cali_tlv),
+	SOC_SINGLE_TLV("DAC2 CHB Gain Calibration Playback Volume",
+		       TAC5X1X_DACCH2B1, 4, 0xf, 0,
+			playback_gain_cali_tlv),
+	SOC_ENUM("DAC2 Audio BW", tac5x1x_dac2_wideband_enum),
+};
+
+static const struct snd_kcontrol_new taa5x12_controls[] = {
+	SOC_ENUM("ADC2 Audio BW", tac5x1x_adc2_wideband_enum),
+
+	SOC_SINGLE_TLV("ADC2 Digital Capture Volume", TAC5X1X_ADCCH2C2,
+		       0, 0xff, 0, record_dig_vol_tlv),
+
+	SOC_SINGLE_TLV("ADC2 Fine Capture Volume", TAC5X1X_ADCCH2C3,
+		       0, 0xff, 0, record_gain_cali_tlv),
+
+	SOC_SINGLE_RANGE("ADC2 Phase Capture Volume", TAC5X1X_ADCCH2C4,
+			 2, 0, 63, 0),
+};
+
+static const struct snd_kcontrol_new tolerance_ctrls[] = {
+	SOC_ENUM("ADC1 Common-mode Tolerance", tac5x1x_adc1_tolerance_enum),
+	SOC_ENUM("ADC2 Common-mode Tolerance", tac5x1x_adc2_tolerance_enum),
+};
+
+static const struct snd_kcontrol_new tac5x1x_pdm_controls[] = {
+	SOC_ENUM("PDM Clk Divider", pdmclk_select_enum),
+
+	SOC_SINGLE_TLV("PDM1 Digital Capture Volume", TAC5X1X_ADCCH1C2,
+		       0, 0xff, 0, record_dig_vol_tlv),
+	SOC_SINGLE_TLV("PDM2 Digital Capture Volume", TAC5X1X_ADCCH2C2,
+		       0, 0xff, 0, record_dig_vol_tlv),
+	SOC_SINGLE_TLV("PDM1 Fine Capture Volume", TAC5X1X_ADCCH1C3,
+		       0, 0xff, 0, record_gain_cali_tlv),
+	SOC_SINGLE_TLV("PDM2 Fine Capture Volume", TAC5X1X_ADCCH2C3,
+		       0, 0xff, 0, record_gain_cali_tlv),
+	SOC_SINGLE_RANGE("PDM1 Phase Capture Volume", TAC5X1X_ADCCH1C4,
+			 2, 0, 63, 0),
+	SOC_SINGLE_RANGE("PDM2 Phase Capture Volume", TAC5X1X_ADCCH2C4,
+			 2, 0, 63, 0),
+	SOC_SINGLE_TLV("PDM3 Digital Capture Volume", TAC5X1X_ADCCH3C2,
+		       0, 0xff, 0, record_dig_vol_tlv),
+	SOC_SINGLE_TLV("PDM4 Digital Capture Volume", TAC5X1X_ADCCH4C2,
+		       0, 0xff, 0, record_dig_vol_tlv),
+	SOC_SINGLE_TLV("PDM3 Fine Capture Volume", TAC5X1X_ADCCH3C3,
+		       0, 0xff, 0, record_gain_cali_tlv),
+	SOC_SINGLE_TLV("PDM4 Fine Capture Volume", TAC5X1X_ADCCH4C3,
+		       0, 0xff, 0, record_gain_cali_tlv),
+	SOC_SINGLE_RANGE("PDM3 Phase Capture Volume", TAC5X1X_ADCCH3C4,
+			 2, 0, 63, 0),
+	SOC_SINGLE_RANGE("PDM4 Phase Capture Volume", TAC5X1X_ADCCH4C4,
+			 2, 0, 63, 0),
+};
+
+static const struct snd_kcontrol_new taa_ip_controls[] = {
+	SOC_ENUM("DIAG_SHT_TERM", diag_cfg1_sht_term_enum),
+	SOC_ENUM("DIAG_SHT_VBAT_IN", diag_cfg1_vbat_in_enum),
+	SOC_ENUM("DIAG_SHT_GND", diag_cfg2_sht_gnd_enum),
+	SOC_ENUM("DIAG_SHT_MICBIAS", diag_cfg2_micbias),
+};
+
+static const struct snd_soc_dapm_widget taa5x1x_dapm_widgets[] = {
+	/* ADC1 */
+	SND_SOC_DAPM_INPUT("AIN1"),
+	SND_SOC_DAPM_MUX("ADC1 Full-Scale", SND_SOC_NOPM, 0, 0,
+			 tac5x1x_dapm_adc1_fscale_control),
+	SND_SOC_DAPM_MUX("ADC1 Config", SND_SOC_NOPM, 0, 0,
+			 tac5x1x_dapm_adc1_config_control),
+	SND_SOC_DAPM_ADC("CH1_ADC_EN", "CH1 Capture", TAC5X1X_CH_EN, 7, 0),
+	SND_SOC_DAPM_SWITCH("ASI_TX_CH1_EN", SND_SOC_NOPM, 0, 0,
+			    &tx_ch1_asi_switch),
+	SND_SOC_DAPM_MICBIAS("Mic Bias", TAC5X1X_PWR_CFG, 5, 0),
+	SND_SOC_DAPM_SWITCH("ASI_TX_CH2_EN", SND_SOC_NOPM, 0, 0,
+			    &tx_ch2_asi_switch),
+};
+
+static const struct snd_soc_dapm_widget tad5xx_dapm_widgets[] = {
+	/* pdm capture */
+	SND_SOC_DAPM_SWITCH("ASI_TX_CH1_EN", SND_SOC_NOPM, 0, 0,
+			    &tx_ch1_asi_switch),
+	SND_SOC_DAPM_SWITCH("ASI_TX_CH2_EN", SND_SOC_NOPM, 0, 0,
+			    &tx_ch2_asi_switch),
+};
+
+static const struct snd_soc_dapm_widget tad5x1x_dapm_widgets[] = {
+	/* DAC1 */
+	SND_SOC_DAPM_AIF_IN("ASI IN1", "ASI Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_OUTPUT("OUT1"),
+	SND_SOC_DAPM_MUX("OUT1x Source", SND_SOC_NOPM, 0, 0,
+			 tac5x1x_dapm_out1_source_control),
+	SND_SOC_DAPM_MUX("OUT1x Config", SND_SOC_NOPM, 0, 0,
+			 tac5x1x_dapm_out1_config_control),
+	SND_SOC_DAPM_MUX("OUT1x Driver", SND_SOC_NOPM, 0, 0,
+			 tac5x1x_dapm_out1_driver_control),
+	SND_SOC_DAPM_DAC("Left DAC Enable", "Left Playback", TAC5X1X_CH_EN, 3,
+			 0),
+	SND_SOC_DAPM_PGA("Left DAC Power", TAC5X1X_PWR_CFG, 6, 0, NULL, 0),
+	SND_SOC_DAPM_SWITCH("ASI_RX_CH1_EN", SND_SOC_NOPM, 0, 0,
+			    &rx_ch1_asi_switch),
+};
+
+static const struct snd_soc_dapm_widget taa5x12_dapm_widgets[] = {
+	/* ADC2 */
+	SND_SOC_DAPM_INPUT("AIN2"),
+	SND_SOC_DAPM_MUX("ADC2 Full-Scale", SND_SOC_NOPM, 0, 0,
+			 tac5x1x_dapm_adc2_fscale_control),
+	SND_SOC_DAPM_MUX("ADC2 Config", SND_SOC_NOPM, 0, 0,
+			 tac5x1x_dapm_adc2_config_control),
+	SND_SOC_DAPM_ADC("CH2_ADC_EN", "CH2 Capture", TAC5X1X_CH_EN, 6, 0),
+
+};
+
+static const struct snd_soc_dapm_widget tad5x12_dapm_widgets[] = {
+	/* DAC2 */
+	SND_SOC_DAPM_OUTPUT("OUT2"),
+
+	SND_SOC_DAPM_AIF_IN("ASI IN2", "ASI Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_MUX("OUT2x Source", SND_SOC_NOPM, 0, 0,
+			 tac5x1x_dapm_out2_source_control),
+	SND_SOC_DAPM_MUX("OUT2x Config", SND_SOC_NOPM, 0, 0,
+			 tac5x1x_dapm_out2_config_control),
+	SND_SOC_DAPM_MUX("OUT2x Driver", SND_SOC_NOPM, 0, 0,
+			 tac5x1x_dapm_out2_driver_control),
+	SND_SOC_DAPM_DAC("Right DAC Enable",
+			 "Right Playback", TAC5X1X_CH_EN, 2, 0),
+	SND_SOC_DAPM_PGA("Right DAC Power", TAC5X1X_PWR_CFG, 6, 0, NULL, 0),
+	SND_SOC_DAPM_SWITCH("ASI_RX_CH2_EN", SND_SOC_NOPM, 0, 0,
+			    &rx_ch2_asi_switch),
+};
+
+static const struct snd_soc_dapm_widget tac5x1x_pdm_widgets[] = {
+	/* PDM */
+	SND_SOC_DAPM_INPUT("DIN1"),
+	SND_SOC_DAPM_INPUT("DIN2"),
+	SND_SOC_DAPM_INPUT("DIN3"),
+	SND_SOC_DAPM_INPUT("DIN4"),
+
+	SND_SOC_DAPM_MUX("PDM ch1 & ch2 Datain Select",
+			 SND_SOC_NOPM, 0, 0, pdm_12_pin_controls),
+	SND_SOC_DAPM_MUX("PDM ch3 & ch4 Datain Select",
+			 SND_SOC_NOPM, 0, 0, pdm_34_pin_controls),
+
+	SND_SOC_DAPM_ADC("CH1_PDM_EN", "PDM CH1 Capture", TAC5X1X_CH_EN, 7, 0),
+	SND_SOC_DAPM_ADC("CH2_PDM_EN", "PDM CH2 Capture", TAC5X1X_CH_EN, 6, 0),
+	SND_SOC_DAPM_ADC("CH3_PDM_EN", "PDM CH3 Capture", TAC5X1X_CH_EN, 5, 0),
+	SND_SOC_DAPM_ADC("CH4_PDM_EN", "PDM CH4 Capture", TAC5X1X_CH_EN, 4, 0),
+
+	SND_SOC_DAPM_SWITCH("ASI_TX_CH3_EN", SND_SOC_NOPM, 0, 0,
+			    &tx_ch3_asi_switch),
+	SND_SOC_DAPM_SWITCH("ASI_TX_CH4_EN", SND_SOC_NOPM, 0, 0,
+			    &tx_ch4_asi_switch),
+};
+
+static const struct snd_soc_dapm_widget tac5x1x_common_widgets[] = {
+	SND_SOC_DAPM_MUX("IN1 Source Mux", SND_SOC_NOPM, 0, 0,
+			 tac5x1x_dapm_in1_source_control),
+	SND_SOC_DAPM_MUX("IN2 Source Mux", SND_SOC_NOPM, 0, 0,
+			 tac5x1x_dapm_in2_source_control),
+	SND_SOC_DAPM_PGA("ADC Power", TAC5X1X_PWR_CFG, 7, 0, NULL, 0),
+	SND_SOC_DAPM_AIF_OUT("AIF OUT", "ASI Capture", 0, SND_SOC_NOPM, 0, 0),
+};
+
+static const struct snd_soc_dapm_widget tad_common_widgets[] = {
+	SND_SOC_DAPM_MUX("IN1 Source Mux", SND_SOC_NOPM, 0, 0,
+			 tad5x1x_dapm_in1_source_control),
+	SND_SOC_DAPM_MUX("IN2 Source Mux", SND_SOC_NOPM, 0, 0,
+			 tad5x1x_dapm_in2_source_control),
+	SND_SOC_DAPM_PGA("ADC Power", TAC5X1X_PWR_CFG, 7, 0, NULL, 0),
+	SND_SOC_DAPM_AIF_OUT("AIF OUT", "ASI Capture", 0, SND_SOC_NOPM, 0, 0),
+};
+
+static const struct snd_soc_dapm_route taa5x1x_dapm_routes[] = {
+	/* ADC channel1 */
+	{"IN1 Source Mux", "Analog", "AIN1"},
+	{"IN2 Source Mux", "Analog", "IN1 Source Mux"},
+	{"CH1_ADC_EN", NULL, "IN2 Source Mux"},
+	{"ASI_TX_CH1_EN", "Capture Switch", "CH1_ADC_EN"},
+	{"ADC1 Config", "Differential", "ASI_TX_CH1_EN"},
+	{"ADC1 Config", "Single-ended", "ASI_TX_CH1_EN"},
+	{"ADC1 Config", "Single-ended mux INxP",
+		"ASI_TX_CH1_EN"},
+	{"ADC1 Config", "Single-ended mux INxM",
+		"ASI_TX_CH1_EN"},
+
+	{"ADC1 Full-Scale", "2/10-VRMS", "ADC1 Config"},
+	{"ADC1 Full-Scale", "4/5-VRMS", "ADC1 Config"},
+	{"Mic Bias", NULL, "ADC1 Full-Scale"},
+
+};
+
+static const struct snd_soc_dapm_route tad5x1x_dapm_routes[] = {
+	/* Left Output */
+	{"ASI_RX_CH1_EN", "Switch", "ASI IN1"},
+
+	{"OUT1x Source", "DAC + Analog Bypass Mix", "ASI_RX_CH1_EN"},
+	{"OUT1x Source", "DAC -> OUTxP, INxP -> OUTxM", "ASI_RX_CH1_EN"},
+	{"OUT1x Source", "INxM -> OUTxP, DAC -> OUTxM", "ASI_RX_CH1_EN"},
+
+	{"OUT1x Config", "Differential", "OUT1x Source"},
+	// {"OUT1x Config", "Stereo Single-ended", "OUT1x Source"},
+	{"OUT1x Config", "Mono Single-ended at OUTxP only", "OUT1x Source"},
+	{"OUT1x Config", "Mono Single-ended at OUTxM only", "OUT1x Source"},
+	{"OUT1x Config", "Pseudo differential with OUTxM as VCOM",
+		"OUT1x Source"},
+	{"OUT1x Config", "Pseudo differential with OUTxM as external sensing",
+		"OUT1x Source"},
+	{"OUT1x Config", "Pseudo differential with OUTxP as VCOM",
+		"OUT1x Source"},
+
+	{"OUT1x Driver", "Line-out", "OUT1x Config"},
+	{"OUT1x Driver", "Headphone", "OUT1x Config"},
+
+	{"Left DAC Enable", NULL, "OUT1x Driver"},
+	{"Left DAC Power", NULL, "Left DAC Enable"},
+
+	{"OUT1", NULL, "Left DAC Power"},
+};
+
+static const struct snd_soc_dapm_route taa5x12_dapm_routes[] = {
+	/* ADC channel2 */
+	{"CH2_ADC_EN", NULL, "AIN2"},
+	{"ASI_TX_CH2_EN", "Capture Switch", "CH2_ADC_EN"},
+	{"ADC2 Config", "Differential", "ASI_TX_CH2_EN"},
+	{"ADC2 Config", "Single-ended", "ASI_TX_CH2_EN"},
+	{"ADC2 Full-Scale", "2/10-VRMS",
+		"ADC2 Config"},
+	{"ADC2 Full-Scale", "4/5-VRMS",
+		"ADC2 Config"},
+
+	{"Mic Bias", NULL, "ADC2 Full-Scale"},
+};
+
+static const struct snd_soc_dapm_route tad5x12_dapm_routes[] = {
+	/* Right Output */
+	{"ASI_RX_CH2_EN", "Switch", "ASI IN2"},
+
+	{"OUT2x Source", "DAC + Analog Bypass Mix", "ASI_RX_CH1_EN"},
+	{"OUT2x Source", "DAC -> OUTxP, INxP -> OUTxM", "ASI_RX_CH1_EN"},
+	{"OUT2x Source", "INxM -> OUTxP, DAC -> OUTxM", "ASI_RX_CH1_EN"},
+
+	{"OUT2x Config", "Differential", "OUT2x Source"},
+	// {"OUT2x Config", "Stereo Single-ended", "OUT2x Source"},
+	{"OUT2x Config", "Mono Single-ended at OUTxP only", "OUT2x Source"},
+	{"OUT2x Config", "Mono Single-ended at OUTxM only", "OUT2x Source"},
+	{"OUT2x Config", "Pseudo differential with OUTxM as VCOM",
+		"OUT2x Source"},
+	{"OUT2x Config", "Pseudo differential with OUTxP as VCOM",
+		"OUT2x Source"},
+	{"OUT2x Driver", "Line-out", "OUT2x Config"},
+	{"OUT2x Driver", "Headphone", "OUT2x Config"},
+	{"Right DAC Enable", NULL, "OUT2x Driver"},
+	{"Right DAC Power", NULL, "Right DAC Enable"},
+	{"OUT2", NULL, "Right DAC Power"},
+};
+
+static const struct snd_soc_dapm_route tac5x1x_pdm_routes[] = {
+	/* PDM channel1 & Channel2 */
+	{"IN1 Source Mux", "PDM", "DIN1"},
+	{"IN2 Source Mux", "PDM", "DIN2"},
+
+	{"ASI_TX_CH1_EN", "Capture Switch",
+		"IN1 Source Mux"},
+	{"ASI_TX_CH2_EN", "Capture Switch",
+		"IN2 Source Mux"},
+
+	{"CH1_PDM_EN", NULL, "ASI_TX_CH1_EN"},
+	{"CH2_PDM_EN", NULL, "ASI_TX_CH2_EN"},
+
+	{"PDM ch1 & ch2 Datain Select", "GPIO1", "CH1_PDM_EN"},
+	{"PDM ch1 & ch2 Datain Select", "GPIO2", "CH1_PDM_EN"},
+	{"PDM ch1 & ch2 Datain Select", "GPI1", "CH1_PDM_EN"},
+
+	{"ADC Power", NULL, "PDM ch1 & ch2 Datain Select"},
+
+	/* PDM channel3 & Channel4 */
+	{"ASI_TX_CH3_EN", "Capture Switch", "DIN3"},
+	{"ASI_TX_CH4_EN", "Capture Switch", "DIN4"},
+
+	{"CH3_PDM_EN", NULL, "ASI_TX_CH3_EN"},
+	{"CH4_PDM_EN", NULL, "ASI_TX_CH4_EN"},
+
+	{"PDM ch3 & ch4 Datain Select", "GPIO1", "CH3_PDM_EN"},
+	{"PDM ch3 & ch4 Datain Select", "GPIO2", "CH3_PDM_EN"},
+	{"PDM ch3 & ch4 Datain Select", "GPI1", "CH3_PDM_EN"},
+
+	{"ADC Power", NULL, "PDM ch3 & ch4 Datain Select"},
+	{"AIF OUT", NULL, "ADC Power"},
+};
+
+static const struct snd_soc_dapm_route tac_common_routes[] = {
+	{"ADC Power", NULL, "Mic Bias"},
+	{"AIF OUT", NULL, "ADC Power"},
+};
+
+static const struct reg_default tac5x1x_reg_defaults[] = {
+	{TAC5X1X_PGSEL, 0x00},
+	{TAC5X1X_INT, 0x11},
+	{TAC5X1X_ADCCH1C0, 0x04},
+	{TAC5X1X_ADCCH2C0, 0x04},
+	{TAC5X1X_OUT1CFG0, 0x20},
+	{TAC5X1X_OUT2CFG0, 0x20},
+	{TAC5X1X_CH_EN, 0x00},
+	{TAC5X1X_PASITXCH1, 0x00},
+	{TAC5X1X_PASITXCH2, 0x01},
+	{TAC5X1X_PASIRXCH1, 0x00},
+	{TAC5X1X_PASIRXCH2, 0x01},
+	{},
+};
+
+static s32 tac5x1x_pwr_ctrl(struct snd_soc_component *component,
+			    bool power_state)
+{
+	struct tac5x1x_priv *tac5x1x =
+		snd_soc_component_get_drvdata(component);
+	s32 active_ctrl, ret;
+	s32 pwr_ctrl = 0;
+
+	if (power_state) {
+		active_ctrl = TAC5X1X_VREF_SLEEP_ACTIVE_MASK;
+		snd_soc_component_update_bits(component, TAC5X1X_VREFCFG,
+					      TAC5X1X_VREFCFG_MICBIAS_VAL_MASK,
+					      tac5x1x->micbias_vg << 2);
+		snd_soc_component_update_bits(component, TAC5X1X_VREFCFG,
+					      TAC5X1X_VREFCFG_VREF_FSCALE_MASK,
+					      tac5x1x->vref_vg);
+
+		if (tac5x1x->uad_en)
+			pwr_ctrl |= TAC5X1X_PWR_CFG_UAD_EN;
+		if (tac5x1x->vad_en)
+			pwr_ctrl |= TAC5X1X_PWR_CFG_VAD_EN;
+		if (tac5x1x->uag_en)
+			pwr_ctrl |= TAC5X1X_PWR_CFG_UAG_EN;
+	} else {
+		active_ctrl = 0x0;
+	}
+
+	ret = snd_soc_component_update_bits(component, TAC5X1X_VREF,
+					    TAC5X1X_VREF_SLEEP_EXIT_VREF_EN |
+					    TAC5X1X_VREF_SLEEP_ACTIVE_MASK,
+					    active_ctrl);
+	if (ret < 0) {
+		dev_err(tac5x1x->dev,
+			"%s, device active or sleep failed!, ret %d/n",
+			__func__, ret);
+		return ret;
+	}
+
+	ret = snd_soc_component_update_bits(component, TAC5X1X_PWR_CFG,
+					    TAC5X1X_PWR_CFG_UAD_EN |
+					    TAC5X1X_PWR_CFG_UAG_EN |
+					    TAC5X1X_PWR_CFG_VAD_EN, pwr_ctrl);
+	if (ret < 0)
+		dev_err(tac5x1x->dev,
+			"%s, Power control set failed!, ret %d/n",
+			__func__, ret);
+	return ret;
+}
+
+static s32 tac5x1x_set_dai_fmt(struct snd_soc_dai *codec_dai, u32 fmt)
+{
+	struct snd_soc_component *component = codec_dai->component;
+	s32 iface_reg_1 = 0;
+	s32 iface_reg_2 = 0;
+	s32 iface_reg_3 = 0;
+
+	int right_slot = 1;
+
+	dev_info(component->dev, "[tac5x1x] %s(), fmt=%d\n", __func__, fmt);
+
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
+		iface_reg_1 |= TAC5X1X_PASI_MODE_MASK;
+		break;
+	case SND_SOC_DAIFMT_CBC_CFC:
+		break;
+	default:
+		dev_err(component->dev,
+			"%s: invalid DAI master/slave interface\n",
+			__func__);
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		iface_reg_2 |= TAC5X1X_PASI_FMT_I2S;
+		right_slot = 16;
+		break;
+	case SND_SOC_DAIFMT_DSP_A:
+		iface_reg_2 |= TAC5X1X_PASI_FMT_TDM;
+		iface_reg_3 |= BIT(0); /* add offset 1 */
+		break;
+	case SND_SOC_DAIFMT_DSP_B:
+		iface_reg_2 |= TAC5X1X_PASI_FMT_TDM;
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		iface_reg_2 |= TAC5X1X_PASI_FMT_LJ;
+		right_slot = 16;
+		break;
+	default:
+		dev_err(component->dev,
+			"%s: invalid DAI interface format\n", __func__);
+		return -EINVAL;
+	}
+
+	snd_soc_component_update_bits(component, TAC5X1X_CNTCLK2,
+				      TAC5X1X_PASI_MODE_MASK, iface_reg_1);
+	snd_soc_component_update_bits(component, TAC5X1X_PASI0,
+				      TAC5X1X_PASI_FMT_MASK, iface_reg_2);
+	snd_soc_component_update_bits(component, TAC5X1X_PASITX1,
+				      TAC5X1X_PASITX_OFFSET_MASK, iface_reg_3);
+	snd_soc_component_update_bits(component, TAC5X1X_PASIRX0,
+				      TAC5X1X_PASIRX_OFFSET_MASK, iface_reg_3);
+	snd_soc_component_update_bits(component, TAC5X1X_PASIRXCH2,
+				      TAC5X1X_PASIRX_OFFSET_MASK, right_slot);
+	snd_soc_component_update_bits(component, TAC5X1X_PASITXCH2,
+				      TAC5X1X_PASITX_OFFSET_MASK, right_slot);
+
+	return 0;
+}
+
+static s32 tac5x1x_hw_params(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params,
+			     struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tac5x1x_priv *tac5x1x =
+		snd_soc_component_get_drvdata(component);
+	s32 sample_rate, word_length = 0;
+
+	switch (params_rate(params)) {
+	case 24000:
+		sample_rate = 25;
+		break;
+	case 32000:
+		sample_rate = 23;
+		break;
+	case 44100:
+	case 48000:
+		sample_rate = 20;
+		break;
+	case 64000:
+		sample_rate = 18;
+		break;
+	case 96000:
+		sample_rate = 15;
+		break;
+	case 192000:
+		sample_rate = 10;
+		break;
+	default:
+		/* Auto detect sample rate */
+		sample_rate = 0;
+		break;
+	}
+
+	switch (params_physical_width(params)) {
+	case 16:
+		word_length |= TAC5X1X_WORD_LEN_16BITS;
+		break;
+	case 20:
+		word_length |= TAC5X1X_WORD_LEN_20BITS;
+		break;
+	case 24:
+		word_length |= TAC5X1X_WORD_LEN_24BITS;
+		break;
+	case 32:
+		word_length |= TAC5X1X_WORD_LEN_32BITS;
+		break;
+	default:
+		dev_err(tac5x1x->dev, "%s, set word length failed\n",
+			__func__);
+		return -EINVAL;
+	}
+
+	snd_soc_component_update_bits(component, TAC5X1X_CLK0,
+				      TAC5X1X_PASI_SAMP_RATE_MASK,
+				      sample_rate << 2);
+	snd_soc_component_update_bits(component, TAC5X1X_PASI0,
+				      TAC5X1X_PASI_DATALEN_MASK, word_length);
+
+	tac5x1x_pwr_ctrl(component, true);
+	return 0;
+}
+
+static s32 tac5x1x_set_bias_level(struct snd_soc_component *component,
+				  enum snd_soc_bias_level level)
+{
+	s32 ret;
+	struct tac5x1x_priv *tac5x1x =
+			snd_soc_component_get_drvdata(component);
+
+	switch (level) {
+	case SND_SOC_BIAS_ON:
+		ret = tac5x1x_pwr_ctrl(component, true);
+		if (ret < 0)
+			dev_err(tac5x1x->dev,
+				"%s, power up failed!/n", __func__);
+		break;
+	case SND_SOC_BIAS_PREPARE:
+		break;
+	case SND_SOC_BIAS_STANDBY:
+		break;
+	case SND_SOC_BIAS_OFF:
+		ret = tac5x1x_pwr_ctrl(component, false);
+		if (ret < 0)
+			dev_err(tac5x1x->dev,
+				"%s, power down failed!/n", __func__);
+		break;
+	}
+
+	return ret;
+}
+
+static const struct snd_soc_dai_ops tac5x1x_ops = {
+	.hw_params = tac5x1x_hw_params,
+	.set_fmt = tac5x1x_set_dai_fmt,
+	.no_capture_mute = 1,
+};
+
+static struct snd_soc_dai_driver tac5x1x_dai = {
+	.name = "tac5x1x-hifi",
+	.playback = {
+			.stream_name = "Playback",
+			.channels_min = 1,
+			.channels_max = 4,
+			.rates = TAC5X1X_RATES,
+			.formats = TAC5X1X_FORMATS,},
+	.capture = {
+			.stream_name = "Capture",
+			.channels_min = 1,
+			.channels_max = 4,
+			.rates = TAC5X1X_RATES,
+			.formats = TAC5X1X_FORMATS,
+			},
+	.ops = &tac5x1x_ops,
+	.symmetric_rate = 1,
+};
+
+static struct snd_soc_dai_driver taa5x1x_dai = {
+	.name = "taa5x1x-hifi",
+	.capture = {
+			.stream_name = "Capture",
+			.channels_min = 1,
+			.channels_max = 4,
+			.rates = TAC5X1X_RATES,
+			.formats = TAC5X1X_FORMATS,
+			},
+	.ops = &tac5x1x_ops,
+	.symmetric_rate = 1,
+};
+
+static struct snd_soc_dai_driver tad5x1x_dai = {
+	.name = "tad5x1x-hifi",
+	.playback = {
+			.stream_name = "Playback",
+			.channels_min = 1,
+			.channels_max = 4,
+			.rates = TAC5X1X_RATES,
+			.formats = TAC5X1X_FORMATS,
+			},
+	.capture = {
+			.stream_name = "Capture",
+			.channels_min = 1,
+			.channels_max = 4,
+			.rates = TAC5X1X_RATES,
+			.formats = TAC5X1X_FORMATS,
+			},
+	.ops = &tac5x1x_ops,
+	.symmetric_rate = 1,
+};
+
+static void tac5x1x_setup_gpios(struct snd_soc_component *component)
+{
+	struct tac5x1x_priv *tac5x1x =
+		snd_soc_component_get_drvdata(component);
+	s32 *gpio_drive = tac5x1x->gpio_setup->gpio_drive;
+	s32 *gpio_func = tac5x1x->gpio_setup->gpio_func;
+
+	/* setup GPIO functions */
+	/* GPIO1 */
+	if (gpio_func[0] <= TAC5X1X_GPIO_DAISY_OUT) {
+		snd_soc_component_update_bits(component, TAC5X1X_GPIO1,
+					      TAC5X1X_GPIOX_CFG_MASK,
+					      gpio_func[0] << 4);
+		snd_soc_component_update_bits(component, TAC5X1X_GPIO1,
+					      TAC5X1X_GPIOX_DRV_MASK,
+					      gpio_drive[0]);
+
+		if (gpio_func[0] == TAC5X1X_GPIO_GPI)
+			snd_soc_add_component_controls(component, GPIO1_I,
+						       ARRAY_SIZE(GPIO1_I));
+	}
+	/* GPIO2 */
+	if (gpio_func[1] <= TAC5X1X_GPIO_DAISY_OUT) {
+		snd_soc_component_update_bits(component, TAC5X1X_GPIO2,
+					      TAC5X1X_GPIOX_CFG_MASK,
+					      gpio_func[1] << 4);
+		snd_soc_component_update_bits(component, TAC5X1X_GPIO2,
+					      TAC5X1X_GPIOX_DRV_MASK,
+					      gpio_drive[1]);
+
+		if (gpio_func[1] == TAC5X1X_GPIO_GPI)
+			snd_soc_add_component_controls(component, GPIO2_I,
+						       ARRAY_SIZE(GPIO2_I));
+	}
+	/* GPO1 */
+	if (gpio_func[2] <= TAC5X1X_GPIO_DAISY_OUT) {
+		snd_soc_component_update_bits(component, TAC5X1X_GPO1,
+					      TAC5X1X_GPIOX_CFG_MASK,
+					      gpio_func[2] << 4);
+		snd_soc_component_update_bits(component, TAC5X1X_GPO1,
+					      TAC5X1X_GPIOX_DRV_MASK,
+					      gpio_drive[2]);
+	}
+
+	/* GPI1 */
+	if (tac5x1x->gpio_setup->gpi1_func) {
+		snd_soc_component_update_bits(component, TAC5X1X_GPI1,
+					      TAC5X1X_GPI1_CFG_MASK,
+					      TAC5X1X_GPI1_CFG_MASK);
+		snd_soc_add_component_controls(component, tac5x1x_GPI1,
+					       ARRAY_SIZE(tac5x1x_GPI1));
+	}
+	/*GPA GPIO*/
+	if (tac5x1x->gpio_setup->gpa_gpio)
+		snd_soc_component_update_bits(component, TAC5X1X_INTF5,
+					      TAC5X1X_GPA_CFG_MASK,
+					      TAC5X1X_GPA_CFG_MASK);
+}
+
+static s32 tac5x1x_reset(struct snd_soc_component *component)
+{
+	s32 ret, index;
+
+	ret = snd_soc_component_write(component, TAC5X1X_RESET, 1);
+	if (ret < 0)
+		return ret;
+	/* Wait >= 10 ms after entering sleep mode. */
+	usleep_range(10000, 100000);
+
+	for (index = 0; index < ARRAY_SIZE(tac5x1x_reg_defaults); index++) {
+		ret = snd_soc_component_write(component,
+					      tac5x1x_reg_defaults[index].reg,
+					      tac5x1x_reg_defaults[index].def);
+		if (ret < 0)
+			return ret;
+	}
+	return ret;
+}
+
+static s32 tac5x1x_add_controls(struct snd_soc_component *component)
+{
+	struct tac5x1x_priv *tac5x1x =
+		snd_soc_component_get_drvdata(component);
+	s32 *gpio_func = tac5x1x->gpio_setup->gpio_func;
+	s32 ret;
+
+	switch (tac5x1x->codec_type) {
+	case TAA5212:
+		fallthrough;
+	case TAA5412:
+		ret =
+		 snd_soc_add_component_controls(component, tolerance_ctrls,
+						ARRAY_SIZE(tolerance_ctrls));
+		if (ret)
+			return ret;
+		ret =
+		 snd_soc_add_component_controls(component,
+						taa_ip_controls,
+						ARRAY_SIZE(taa_ip_controls));
+		if (ret)
+			return ret;
+		break;
+	/* For Mono */
+	case TAC5111:
+	case TAC5211:
+		ret =
+		 snd_soc_add_component_controls(component,
+						tac5x11_controls,
+						ARRAY_SIZE(tac5x11_controls));
+		if (ret)
+			return ret;
+	fallthrough;
+	case TAC5311:
+	case TAC5411:
+		ret =
+		 snd_soc_add_component_controls(component, tad5x1x_controls,
+						ARRAY_SIZE(tad5x1x_controls));
+		if (ret)
+			return ret;
+		break;
+	/* For Stereo */
+	case TAC5112:
+	case TAC5212:
+		fallthrough;
+	case TAC5312:
+	case TAC5412:
+		ret =
+		 snd_soc_add_component_controls(component, tolerance_ctrls,
+						ARRAY_SIZE(tolerance_ctrls));
+		if (ret)
+			return ret;
+		ret =
+		 snd_soc_add_component_controls(component, tad5x1x_controls,
+						ARRAY_SIZE(tad5x1x_controls));
+		if (ret)
+			return ret;
+
+		ret =
+		 snd_soc_add_component_controls(component, taa5x12_controls,
+						ARRAY_SIZE(taa5x12_controls));
+		if (ret)
+			return ret;
+
+		ret =
+		 snd_soc_add_component_controls(component, tad5x12_controls,
+						ARRAY_SIZE(tad5x12_controls));
+		if (ret)
+			return ret;
+		break;
+	case TAD5212:
+	case TAD5112:
+		ret = snd_soc_add_component_controls(component, tad5x12_controls,
+						     ARRAY_SIZE(tad5x12_controls));
+		if (ret)
+			return ret;
+		break;
+	default:
+		break;
+	}
+
+	/* If enabled PDM GPIO*/
+	if (memchr(gpio_func, TAC5X1X_GPIO_PDMCLK,
+		   sizeof(*gpio_func) / sizeof(gpio_func[0]))) {
+		ret = snd_soc_add_component_controls(component, tac5x1x_pdm_controls,
+						     ARRAY_SIZE(tac5x1x_pdm_controls));
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static s32 tac5x1x_add_ip_diag_controls(struct snd_soc_component *component)
+{
+	struct tac5x1x_priv *tac5x1x =
+		snd_soc_component_get_drvdata(component);
+	s32 ret;
+
+	switch (tac5x1x->codec_type) {
+	case TAA5212:
+		break;
+	case TAA5412:
+	case TAC5311:
+	case TAC5312:
+	case TAC5411:
+	case TAC5412:
+		if (tac5x1x->input_diag_config.in_ch_en) {
+			ret =
+			 snd_soc_add_component_controls(component,
+							taa_ip_controls,
+							ARRAY_SIZE(taa_ip_controls));
+			if (ret)
+				return ret;
+			snd_soc_component_update_bits(component,
+						      TAC5X1X_DIAG_CFG0,
+						      TAC5X1X_IN_CH_DIAG_EN_MASK,
+						      TAC5X1X_IN_CH_DIAG_EN_MASK);
+		}
+		if (tac5x1x->input_diag_config.out_ch_en) {
+			snd_soc_component_update_bits(component, TAC5X1X_DIAG_CFG0,
+						      TAC5X1X_OUT1P_DIAG_EN_MASK,
+						      TAC5X1X_OUT1P_DIAG_EN_MASK);
+		}
+		if (tac5x1x->input_diag_config.incl_se_inm) {
+			snd_soc_component_update_bits(component, TAC5X1X_DIAG_CFG0,
+						      TAC5X1X_INCL_SE_INM_MASK,
+						      TAC5X1X_INCL_SE_INM_MASK);
+		}
+		if (tac5x1x->input_diag_config.incl_ac_coup) {
+			snd_soc_component_update_bits(component, TAC5X1X_DIAG_CFG0,
+						      TAC5X1X_INCL_AC_COUP_MASK,
+						      TAC5X1X_INCL_AC_COUP_MASK);
+		}
+		snd_soc_component_update_bits(component, TAC5X1X_DIAG_CFG7,
+					      0xff,
+					      tac5x1x->micbias_threshold[0]);
+		snd_soc_component_update_bits(component, TAC5X1X_DIAG_CFG6,
+					      0xff,
+					      tac5x1x->micbias_threshold[1]);
+		tac5x1x_register_interrupt(tac5x1x);
+		fallthrough;
+	case TAC5111:
+	case TAC5112:
+	case TAC5211:
+	case TAC5212:
+	case TAD5112:
+	case TAD5212:
+		snd_soc_component_update_bits(component, TAC5X1X_DIAG_CFG9,
+					      0xff, tac5x1x->gpa_threshold[0]);
+		snd_soc_component_update_bits(component, TAC5X1X_DIAG_CFG8,
+					      0xff, tac5x1x->gpa_threshold[1]);
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+};
+
+static s32 tac5x1x_add_widgets(struct snd_soc_component *component)
+{
+	struct tac5x1x_priv *tac5x1x =
+		snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
+	s32 *gpio_func = tac5x1x->gpio_setup->gpio_func;
+	s32 ret;
+
+	switch (tac5x1x->codec_type) {
+	case TAC5111:
+	case TAC5211:
+	case TAC5311:
+	case TAC5411:
+		ret =
+		 snd_soc_dapm_new_controls(dapm, tad5x1x_dapm_widgets,
+					   ARRAY_SIZE(tad5x1x_dapm_widgets));
+		if (ret)
+			return ret;
+		ret = snd_soc_dapm_add_routes(dapm, tad5x1x_dapm_routes,
+					      ARRAY_SIZE(tad5x1x_dapm_routes));
+		if (ret)
+			return ret;
+		break;
+	case TAC5112:
+	case TAC5212:
+	case TAC5312:
+	case TAC5412:
+		ret =
+		 snd_soc_dapm_new_controls(dapm, tad5x1x_dapm_widgets,
+					   ARRAY_SIZE(tad5x1x_dapm_widgets));
+		if (ret)
+			return ret;
+		ret = snd_soc_dapm_add_routes(dapm, tad5x1x_dapm_routes,
+					      ARRAY_SIZE(tad5x1x_dapm_routes));
+		if (ret)
+			return ret;
+		ret =
+		 snd_soc_dapm_new_controls(dapm, tad5x12_dapm_widgets,
+					   ARRAY_SIZE(tad5x12_dapm_widgets));
+		if (ret)
+			return ret;
+		ret = snd_soc_dapm_add_routes(dapm, tad5x12_dapm_routes,
+					      ARRAY_SIZE(tad5x12_dapm_routes));
+		if (ret)
+			return ret;
+		fallthrough;
+	case TAA5212:
+	case TAA5412:
+		ret =
+		 snd_soc_dapm_new_controls(dapm, taa5x12_dapm_widgets,
+					   ARRAY_SIZE(taa5x12_dapm_widgets));
+		if (ret)
+			return ret;
+		ret = snd_soc_dapm_add_routes(dapm, taa5x12_dapm_routes,
+					      ARRAY_SIZE(taa5x12_dapm_routes));
+		if (ret)
+			return ret;
+		break;
+	case TAD5212:
+	case TAD5112:
+		ret =
+		 snd_soc_dapm_new_controls(dapm, tad5xx_dapm_widgets,
+					   ARRAY_SIZE(tad5xx_dapm_widgets));
+		if (ret)
+			return ret;
+
+		ret =
+		 snd_soc_dapm_new_controls(dapm, tad5x12_dapm_widgets,
+					   ARRAY_SIZE(tad5x12_dapm_widgets));
+		if (ret)
+			return ret;
+		ret = snd_soc_dapm_add_routes(dapm, tad5x12_dapm_routes,
+					      ARRAY_SIZE(tad5x12_dapm_routes));
+		if (ret)
+			return ret;
+
+		break;
+	default:
+		break;
+	}
+
+	if (!(tac5x1x->codec_type == TAD5212 ||
+	      tac5x1x->codec_type == TAD5112)) {
+		ret =
+		 snd_soc_dapm_new_controls(dapm, tac5x1x_common_widgets,
+					   ARRAY_SIZE(tac5x1x_common_widgets));
+		if (ret)
+			return ret;
+
+		ret = snd_soc_dapm_add_routes(dapm, tac_common_routes,
+					      ARRAY_SIZE(tac_common_routes));
+		if (ret)
+			return ret;
+	} else {
+		ret =
+		 snd_soc_dapm_new_controls(dapm, tad_common_widgets,
+					   ARRAY_SIZE(tad_common_widgets));
+		if (ret)
+			return ret;
+	}
+	/* If enabled PDM GPIO*/
+	if (memchr(gpio_func, TAC5X1X_GPIO_PDMCLK,
+		   sizeof(*gpio_func) / sizeof(gpio_func[0]))) {
+		ret =
+		 snd_soc_dapm_new_controls(dapm, tac5x1x_pdm_widgets,
+					   ARRAY_SIZE(tac5x1x_pdm_widgets));
+		if (ret)
+			return ret;
+		ret = snd_soc_dapm_add_routes(dapm, tac5x1x_pdm_routes,
+					      ARRAY_SIZE(tac5x1x_pdm_routes));
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+static int tac5x1x_setup_adc_impedance(struct device *dev,
+				       struct tac5x1x_priv *tac5x1x)
+{
+	if (tac5x1x->adc_impedance[0] != -1)
+		snd_soc_component_update_bits(tac5x1x->component,
+					      TAC5X1X_ADCCH1C0,
+					      TAC5X1X_ADCCH1C0_IMPEDANCE_MASK,
+					      tac5x1x->adc_impedance[0] << 4);
+
+	if (tac5x1x->adc_impedance[1] != -1)
+		snd_soc_component_update_bits(tac5x1x->component,
+					      TAC5X1X_ADCCH2C0,
+					      TAC5X1X_ADCCH2C0_IMPEDANCE_MASK,
+					      tac5x1x->adc_impedance[1] << 4);
+
+	return 0;
+}
+
+static s32 tac5x1x_component_probe(struct snd_soc_component *component)
+{
+	s32 ret;
+	struct tac5x1x_priv *tac5x1x =
+				snd_soc_component_get_drvdata(component);
+
+	tac5x1x->component = component;
+	ret = tac5x1x_add_controls(component);
+	if (ret < 0) {
+		dev_err(tac5x1x->dev,
+			"%s, add control failed\n", __func__);
+		return ret;
+	}
+
+	ret = tac5x1x_add_widgets(component);
+	if (ret < 0) {
+		dev_err(tac5x1x->dev,
+			"%s, device widget addition failed\n", __func__);
+		return ret;
+	}
+
+	ret = tac5x1x_reset(component);
+	if (ret < 0) {
+		dev_err(tac5x1x->dev, "%s, device reset failed\n", __func__);
+		return ret;
+	}
+
+	tac5x1x_setup_adc_impedance(tac5x1x->dev, tac5x1x);
+
+	if (tac5x1x->gpio_setup)
+		tac5x1x_setup_gpios(component);
+
+	ret = tac5x1x_add_ip_diag_controls(component);
+	if (ret < 0) {
+		dev_err(tac5x1x->dev,
+			"%s add diag control failed\n", __func__);
+		return ret;
+	}
+	return ret;
+}
+
+static void tac5x1x_disable_regulators(struct tac5x1x_priv *tac5x1x)
+{
+	regulator_bulk_disable(tac5x1x_num_regulators, tac5x1x_regulators);
+}
+
+#ifdef CONFIG_PM
+static s32 tac5x1x_soc_suspend(struct snd_soc_component *component)
+{
+	struct tac5x1x_priv *tac5x1x =
+		snd_soc_component_get_drvdata(component);
+
+	regcache_cache_only(tac5x1x->regmap, true);
+	regcache_mark_dirty(tac5x1x->regmap);
+
+	tac5x1x_disable_regulators(tac5x1x);
+
+	return 0;
+}
+
+static s32 tac5x1x_soc_resume(struct snd_soc_component *component)
+{
+	struct tac5x1x_priv *tac5x1x =
+		snd_soc_component_get_drvdata(component);
+	s32 ret;
+
+	ret = regulator_bulk_enable(tac5x1x_num_regulators,
+				    tac5x1x_regulators);
+	if (ret) {
+		dev_err(tac5x1x->dev, "Failed to enable regulators\n");
+		return ret;
+	}
+
+	regcache_cache_only(tac5x1x->regmap, false);
+	snd_soc_component_cache_sync(component);
+
+	return ret;
+}
+#else
+#define tac5x1x_soc_suspend	NULL
+#define tac5x1x_soc_resume	NULL
+#endif /* CONFIG_PM */
+
+static const struct snd_soc_component_driver component_tac5x1x = {
+	.probe			= tac5x1x_component_probe,
+	.set_bias_level		= tac5x1x_set_bias_level,
+	.suspend		= tac5x1x_soc_suspend,
+	.resume			= tac5x1x_soc_resume,
+	.controls		= taa5x1x_controls,
+	.num_controls		= ARRAY_SIZE(taa5x1x_controls),
+	.dapm_widgets		= taa5x1x_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(taa5x1x_dapm_widgets),
+	.dapm_routes		= taa5x1x_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(taa5x1x_dapm_routes),
+	.suspend_bias_off	= 1,
+	.idle_bias_on		= 1,
+	.use_pmdown_time	= 1,
+	.endianness		= 1,
+};
+
+static const struct snd_soc_component_driver component_taa5x1x = {
+	.probe			= tac5x1x_component_probe,
+	.set_bias_level		= tac5x1x_set_bias_level,
+	.suspend		= tac5x1x_soc_suspend,
+	.resume			= tac5x1x_soc_resume,
+	.controls		= taa5x1x_controls,
+	.num_controls		= ARRAY_SIZE(taa5x1x_controls),
+	.dapm_widgets		= taa5x1x_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(taa5x1x_dapm_widgets),
+	.dapm_routes		= taa5x1x_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(taa5x1x_dapm_routes),
+	.suspend_bias_off	= 1,
+	.idle_bias_on		= 1,
+	.use_pmdown_time	= 1,
+	.endianness		= 1,
+};
+
+static const struct snd_soc_component_driver component_tad5x1x = {
+	.probe			= tac5x1x_component_probe,
+	.set_bias_level		= tac5x1x_set_bias_level,
+	.suspend		= tac5x1x_soc_suspend,
+	.resume			= tac5x1x_soc_resume,
+	.controls		= tad5x1x_controls,
+	.num_controls		= ARRAY_SIZE(tad5x1x_controls),
+	.dapm_widgets		= tad5x1x_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(tad5x1x_dapm_widgets),
+	.dapm_routes		= tad5x1x_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(tad5x1x_dapm_routes),
+	.suspend_bias_off	= 1,
+	.idle_bias_on		= 1,
+	.use_pmdown_time	= 1,
+	.endianness		= 1,
+};
+
+static s32 tac5x1x_parse_dt(struct tac5x1x_priv *tac5x1x,
+			    struct device_node *np)
+{
+	struct tac5x1x_input_diag_config input_config;
+	struct tac5x1x_setup_gpio *tac5x1x_setup;
+	s32 micbias_value = TAC5X1X_MICBIAS_VREF;
+	s32 vref_value = TAC5X1X_VERF_2_5V;
+	s32 ret;
+
+	tac5x1x_setup = devm_kzalloc(tac5x1x->dev, sizeof(*tac5x1x_setup),
+				     GFP_KERNEL);
+	if (!tac5x1x_setup)
+		return -ENOMEM;
+
+	ret = fwnode_property_read_u32(tac5x1x->dev->fwnode, "ti,vref",
+				       &vref_value);
+	if (ret) {
+		dev_err(tac5x1x->dev, "Fail to get verf E:%d\n", ret);
+		goto out;
+	}
+	ret = fwnode_property_read_u32(tac5x1x->dev->fwnode,
+				       "ti,micbias-vg", &micbias_value);
+	if (ret) {
+		dev_err(tac5x1x->dev, "Fail to get micbias-vg E:%d\n", ret);
+		goto out;
+	}
+
+	if (micbias_value == TAC5X1X_MICBIAS_AVDD) {
+		tac5x1x->micbias_vg = micbias_value;
+		tac5x1x->vref_vg = TAC5X1X_VERF_2_75V;
+		tac5x1x->micbias_en = true;
+	} else {
+		switch (vref_value) {
+		case TAC5X1X_VERF_2_75V:
+		case TAC5X1X_VERF_2_5V:
+			switch (micbias_value) {
+			case TAC5X1X_MICBIAS_VREF:
+			case TAC5X1X_MICBIAS_0_5VREF:
+				tac5x1x->micbias_vg = micbias_value;
+				break;
+			default:
+				dev_err(tac5x1x->dev,
+					"Bad tac5x1x-micbias-vg value %d\n",
+					micbias_value);
+				tac5x1x->micbias_vg = TAC5X1X_MICBIAS_AVDD;
+				break;
+			}
+			tac5x1x->vref_vg = vref_value;
+			tac5x1x->micbias_en = true;
+			break;
+		case TAC5X1X_VERF_1_375V:
+			if (micbias_value == TAC5X1X_MICBIAS_VREF) {
+				tac5x1x->micbias_vg = micbias_value;
+			} else {
+				dev_err(tac5x1x->dev,
+					"Bad tac5x1x-micbias-vg value %d\n",
+					micbias_value);
+				tac5x1x->micbias_vg = TAC5X1X_MICBIAS_AVDD;
+			}
+			tac5x1x->micbias_en = true;
+			tac5x1x->vref_vg = vref_value;
+			break;
+		default:
+			dev_err(tac5x1x->dev,
+				"Bad tac5x1x-vref-vg value %d\n", vref_value);
+			tac5x1x->vref_vg = TAC5X1X_VERF_2_5V;
+			tac5x1x->micbias_vg = TAC5X1X_MICBIAS_AVDD;
+			tac5x1x->micbias_en = true;
+			break;
+		}
+	}
+
+	if (fwnode_property_read_u32(tac5x1x->dev->fwnode, "ti,gpi1-func",
+				     &tac5x1x_setup->gpi1_func))
+		dev_err(tac5x1x->dev, "Fail to get gpi1-func value\n");
+
+	if (fwnode_property_read_u32(tac5x1x->dev->fwnode, "ti,gpa-gpio",
+				     &tac5x1x_setup->gpa_gpio))
+		dev_err(tac5x1x->dev, "Fail to get gpa-gpio value\n");
+
+	if (fwnode_property_read_u32_array(tac5x1x->dev->fwnode,
+					   "ti,gpios-func",
+					   tac5x1x_setup->gpio_func, 3))
+		dev_err(tac5x1x->dev, "Fail to get gpios-func value\n");
+	if (fwnode_property_read_u32_array(tac5x1x->dev->fwnode,
+					   "ti,gpios-drive",
+					   tac5x1x_setup->gpio_drive, 3))
+		dev_err(tac5x1x->dev, "Fail to get gpios-drive value\n");
+
+	tac5x1x->gpa_threshold[0] = TAC5X1X_GPA_LOW_THRESHOLD;
+	tac5x1x->gpa_threshold[1] = TAC5X1X_GPA_HIGH_THRESHOLD;
+	if (fwnode_property_read_u32_array(tac5x1x->dev->fwnode,
+					   "ti,gpa-threshold",
+					   tac5x1x->gpa_threshold, 2))
+		dev_err(tac5x1x->dev, "Fail to get ti,gpa-threshold value\n");
+
+	tac5x1x->gpio_setup = tac5x1x_setup;
+	tac5x1x->adc_impedance[0] = -1;
+	tac5x1x->adc_impedance[1] = -1;
+	tac5x1x->out2x_vcom_cfg = -1;
+
+	fwnode_property_read_u32(tac5x1x->dev->fwnode, "ti,out2x-vcom-cfg",
+				 &tac5x1x->out2x_vcom_cfg);
+
+	switch (tac5x1x->codec_type) {
+	case TAA5212:
+	case TAC5212:
+		if (fwnode_property_read_u32(tac5x1x->dev->fwnode,
+					     "ti,adc2-impedance",
+					     &tac5x1x->adc_impedance[1]))
+			dev_warn(tac5x1x->dev,
+				 "Fail to get ti,adc2-impedance value\n");
+		fallthrough;
+	case TAC5211:
+	case TAC5111:
+		if (fwnode_property_read_u32(tac5x1x->dev->fwnode,
+					     "ti,adc1-impedance",
+					     &tac5x1x->adc_impedance[0]))
+			dev_warn(tac5x1x->dev,
+				 "Fail to get ti,adc1-impedance value\n");
+
+		fallthrough;
+	case TAC5112:
+	case TAD5112:
+	case TAD5212:
+		break;
+	case TAA5412:
+	case TAC5411:
+	case TAC5412:
+	case TAC5311:
+	case TAC5312:
+		tac5x1x->input_diag_config.in_ch_en = 0;
+		if (fwnode_property_read_u32(tac5x1x->dev->fwnode,
+					     "ti,in-ch-en",
+					     &input_config.in_ch_en))
+			dev_err(tac5x1x->dev,
+				"Fail to get ti,in-ch-en value\n");
+		tac5x1x->input_diag_config.out_ch_en = 0;
+		if (fwnode_property_read_u32(tac5x1x->dev->fwnode,
+					     "ti,out-ch-en",
+					     &input_config.in_ch_en))
+			dev_err(tac5x1x->dev,
+				"Fail to get ti,out-ch-en value\n");
+		tac5x1x->input_diag_config.incl_se_inm = 0;
+		if (fwnode_property_read_u32(tac5x1x->dev->fwnode,
+					     "ti,incl-se-inm",
+					     &input_config.incl_se_inm))
+			dev_err(tac5x1x->dev,
+				"Fail to get ti,incl-se-inm value\n");
+		tac5x1x->input_diag_config.incl_ac_coup = 0;
+		if (fwnode_property_read_u32(tac5x1x->dev->fwnode,
+					     "ti,incl-ac-coup",
+					     &input_config.incl_ac_coup))
+			dev_err(tac5x1x->dev,
+				"Fail to get ti,incl-ac-coup value\n");
+		tac5x1x->input_diag_config = input_config;
+
+		tac5x1x->micbias_threshold[0] = TAC5X1X_MICBIAS_LOW_THRESHOLD;
+		tac5x1x->micbias_threshold[1] = TAC5X1X_MICBIAS_HIGH_THRESHOLD;
+		if (fwnode_property_read_u32_array(tac5x1x->dev->fwnode,
+						   "ti,micbias-threshold",
+						   tac5x1x->micbias_threshold,
+						   2))
+			dev_err(tac5x1x->dev,
+				"Fail to get ti,micbias-threshold value\n");
+		break;
+	}
+out:
+	return ret;
+}
+
+static s32 tac5x1x_setup_regulators(struct device *dev,
+				    struct tac5x1x_priv *tac5x1x)
+{
+	int ret;
+
+	ret = devm_regulator_bulk_get(dev, tac5x1x_num_regulators,
+				      tac5x1x_regulators);
+	if (ret) {
+		dev_err(dev, "Failed to get regulators\n");
+		return ret;
+	}
+
+	ret = regulator_bulk_enable(tac5x1x_num_regulators,
+				    tac5x1x_regulators);
+	if (ret) {
+		dev_err(dev, "Failed to enable regulators\n");
+		regulator_bulk_disable(tac5x1x_num_regulators,
+				       tac5x1x_regulators);
+		return ret;
+	}
+
+	return 0;
+}
+
+static s32 tac5x1x_probe(struct device *dev, struct regmap *regmap,
+			 enum tac5x1x_type type)
+{
+	struct device_node *np = dev->of_node;
+	struct tac5x1x_priv *tac5x1x;
+	s32 ret;
+
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	tac5x1x = devm_kzalloc(dev, sizeof(struct tac5x1x_priv),
+			       GFP_KERNEL);
+	if (!tac5x1x)
+		return -ENOMEM;
+
+	tac5x1x->dev = dev;
+	tac5x1x->codec_type = type;
+	tac5x1x->regmap = regmap;
+
+	dev_set_drvdata(dev, tac5x1x);
+	if (np) {
+		ret = tac5x1x_parse_dt(tac5x1x, np);
+		if (ret) {
+			dev_err(dev, "Failed to parse DT node\n");
+			return ret;
+		}
+	} else {
+		dev_err(dev, "%s: Fail to get device node\n", __func__);
+	}
+
+	ret = tac5x1x_setup_regulators(dev, tac5x1x);
+	if (ret) {
+		dev_err(dev, "Failed to setup regulators\n");
+		return ret;
+	}
+
+	/* update if vcom property is found */
+	if (tac5x1x->out2x_vcom_cfg != -1) {
+		snd_soc_component_update_bits(tac5x1x->component,
+					      TAC5X1X_OUT2CFG0,
+					      TAC5X1X_OUT2CFG0_VCOM_MASK,
+					      tac5x1x->out2x_vcom_cfg);
+	}
+
+	switch (tac5x1x->codec_type) {
+	case TAA5212:
+	case TAA5412:
+		ret = devm_snd_soc_register_component(dev, &component_taa5x1x,
+						      &taa5x1x_dai, 1);
+		if (ret) {
+			dev_err(dev, "Failed to register component\n");
+			goto err_disable_regulators;
+		}
+		break;
+	case TAC5111:
+	case TAC5112:
+	case TAC5211:
+	case TAC5212:
+	case TAC5311:
+	case TAC5312:
+	case TAC5411:
+	case TAC5412:
+		ret = devm_snd_soc_register_component(dev, &component_tac5x1x,
+						      &tac5x1x_dai, 1);
+		if (ret) {
+			dev_err(dev, "Failed to register component\n");
+			goto err_disable_regulators;
+		}
+		break;
+	case TAD5112:
+	case TAD5212:
+		ret = devm_snd_soc_register_component(dev, &component_tad5x1x,
+						      &tad5x1x_dai, 1);
+		if (ret) {
+			dev_err(dev, "Failed to register component\n");
+			goto err_disable_regulators;
+		}
+		break;
+	}
+	return 0;
+
+err_disable_regulators:
+	tac5x1x_disable_regulators(tac5x1x);
+
+	return ret;
+}
+
+static s32 tac5x1x_remove(struct device *dev)
+{
+	struct tac5x1x_priv *tac5x1x = dev_get_drvdata(dev);
+
+	tac5x1x_disable_regulators(tac5x1x);
+	return 0;
+}
+
+const struct of_device_id tac5x1x_of_match[] = {
+	{ .compatible = "ti,taa5212", .data = (void *)TAA5212 },
+	{ .compatible = "ti,taa5412", .data = (void *)TAA5412 },
+	{ .compatible = "ti,tac5111", .data = (void *)TAC5111 },
+	{ .compatible = "ti,tac5112", .data = (void *)TAC5112 },
+	{ .compatible = "ti,tac5211", .data = (void *)TAC5211 },
+	{ .compatible = "ti,tac5212", .data = (void *)TAC5212 },
+	{ .compatible = "ti,tac5311", .data = (void *)TAC5311 },
+	{ .compatible = "ti,tac5312", .data = (void *)TAC5312 },
+	{ .compatible = "ti,tac5411", .data = (void *)TAC5411 },
+	{ .compatible = "ti,tac5412", .data = (void *)TAC5412 },
+	{ .compatible = "ti,tad5112", .data = (void *)TAD5112 },
+	{ .compatible = "ti,tad5212", .data = (void *)TAD5212 },
+	{}
+};
+MODULE_DEVICE_TABLE(of, tac5x1x_of_match);
+
+static const struct i2c_device_id tac5x1x_id[] = {
+	{"taa5212", TAA5212},
+	{"taa5412", TAA5412},
+	{"tac5111", TAC5111},
+	{"tac5112", TAC5112},
+	{"tac5211", TAC5211},
+	{"tac5212", TAC5212},
+	{"tac5311", TAC5311},
+	{"tac5312", TAC5312},
+	{"tac5411", TAC5411},
+	{"tac5412", TAC5412},
+	{"tad5112", TAD5112},
+	{"tad5212", TAD5212},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, tac5x1x_id);
+
+static int tac5x1x_i2c_probe(struct i2c_client *i2c)
+{
+	int ret;
+	enum tac5x1x_type type;
+	struct regmap *regmap;
+	const struct regmap_config *config = &tac5x1x_regmap;
+
+	regmap = devm_regmap_init_i2c(i2c, config);
+	type = (uintptr_t)i2c_get_match_data(i2c);
+
+	ret = tac5x1x_probe(&i2c->dev, regmap, type);
+	if (ret)
+		dev_err(&i2c->dev, "probe failed");
+
+	return ret;
+}
+
+static void tac5x1x_i2c_remove(struct i2c_client *client)
+{
+	tac5x1x_remove(&client->dev);
+}
+
+static struct i2c_driver tac5x1x_i2c_driver = {
+	.driver = {
+		.name = "tac5x1x-codec",
+		.of_match_table = of_match_ptr(tac5x1x_of_match),
+	},
+	.probe = tac5x1x_i2c_probe,
+	.remove = tac5x1x_i2c_remove,
+	.id_table = tac5x1x_id,
+};
+module_i2c_driver(tac5x1x_i2c_driver);
+
+MODULE_DESCRIPTION("ASoC tac5x1x codec driver");
+MODULE_AUTHOR("Texas Instruments");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/tac5x1x.h b/sound/soc/codecs/tac5x1x.h
new file mode 100644
index 000000000000..f315d1dfb627
--- /dev/null
+++ b/sound/soc/codecs/tac5x1x.h
@@ -0,0 +1,300 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Audio Codec Driver Supporting Devices
+ * TAA5X1X, TAC5X1X, TAD5X1X
+ *
+ * Copyright (C) 2024-2025 Texas Instruments Incorporated - https://www.ti.com
+ *
+ * Author: Kevin Lu <kevin-lu@ti.com>
+ * Author: Kokila Karuppusamy <kokila.karuppusamy@ti.com>
+ * Author: Niranjan H Y <niranjan.hy@ti.com>
+ */
+
+#ifndef _TAC5X1X_H
+#define _TAC5X1X_H
+
+#define	TAC5X1X_RATES	SNDRV_PCM_RATE_8000_192000
+#define	TAC5X1X_FORMATS (SNDRV_PCM_FMTBIT_S16_LE \
+			 | SNDRV_PCM_FMTBIT_S20_3LE \
+			 | SNDRV_PCM_FMTBIT_S24_LE \
+			 | SNDRV_PCM_FMTBIT_S24_3LE \
+			 | SNDRV_PCM_FMTBIT_S32_LE)
+
+/*PAGE Control Register (available in page0 of each book) */
+#define	TAC_PAGE_SELECT		0x00
+#define	TAC_PAGE_ID(reg)	((reg) / 128)
+#define	TAC_PAGE_REG(reg)	((reg) % 128)
+#define	TAC5X1X_REG(page, reg)	(((page) * 128) + (reg))
+
+#define	TAC_PAGE1_SELECT	0x01
+#define	TAC5X1X_PGSEL		TAC5X1X_REG(0, 0x0)
+
+#define	TAC5X1X_RESET		TAC5X1X_REG(0, 0x1)
+#define	TAC5X1X_VREF		TAC5X1X_REG(0, 0x2)
+#define	TAC5X1X_VDDSTS		TAC5X1X_REG(0, 0x3)
+#define	TAC5X1X_MISC		TAC5X1X_REG(0, 0x4)
+#define	TAC5X1X_MISC1		TAC5X1X_REG(0, 0x5)
+#define	TAC5X1X_DACA0		TAC5X1X_REG(0, 0x6)
+#define	TAC5X1X_MISC0		TAC5X1X_REG(0, 0x7)
+#define	TAC5X1X_GPIO1		TAC5X1X_REG(0, 0xa)
+#define	TAC5X1X_GPIO2		TAC5X1X_REG(0, 0xb)
+#define	TAC5X1X_GPO1		TAC5X1X_REG(0, 0xc)
+#define	TAC5X1X_GPI1		TAC5X1X_REG(0, 0xd)
+#define	TAC5X1X_GPIOVAL		TAC5X1X_REG(0, 0xe)
+#define	TAC5X1X_INTF0		TAC5X1X_REG(0, 0xf)
+#define	TAC5X1X_INTF1		TAC5X1X_REG(0, 0x10)
+#define	TAC5X1X_INTF2		TAC5X1X_REG(0, 0x11)
+#define	TAC5X1X_INTF3		TAC5X1X_REG(0, 0x12)
+#define	TAC5X1X_INTF4		TAC5X1X_REG(0, 0x13)
+#define	TAC5X1X_INTF5		TAC5X1X_REG(0, 0x14)
+#define	TAC5X1X_INTF6		TAC5X1X_REG(0, 0x15)
+#define	TAC5X1X_ASI0		TAC5X1X_REG(0, 0x18)
+#define	TAC5X1X_ASI1		TAC5X1X_REG(0, 0x19)
+#define	TAC5X1X_PASI0		TAC5X1X_REG(0, 0x1a)
+#define	TAC5X1X_PASITX0		TAC5X1X_REG(0, 0x1b)
+#define	TAC5X1X_PASITX1		TAC5X1X_REG(0, 0x1c)
+#define	TAC5X1X_PASITX2		TAC5X1X_REG(0, 0x1d)
+#define	TAC5X1X_PASITXCH1	TAC5X1X_REG(0, 0x1e)
+#define	TAC5X1X_PASITXCH2	TAC5X1X_REG(0, 0x1f)
+#define	TAC5X1X_PASITXCH3	TAC5X1X_REG(0, 0x20)
+#define	TAC5X1X_PASITXCH4	TAC5X1X_REG(0, 0x21)
+#define	TAC5X1X_PASITXCH5	TAC5X1X_REG(0, 0x22)
+#define	TAC5X1X_PASITXCH6	TAC5X1X_REG(0, 0x23)
+#define	TAC5X1X_PASITXCH7	TAC5X1X_REG(0, 0x24)
+#define	TAC5X1X_PASITXCH8	TAC5X1X_REG(0, 0x25)
+#define	TAC5X1X_PASIRX0		TAC5X1X_REG(0, 0x26)
+#define	TAC5X1X_PASIRX1		TAC5X1X_REG(0, 0x27)
+#define	TAC5X1X_PASIRXCH1	TAC5X1X_REG(0, 0x28)
+#define	TAC5X1X_PASIRXCH2	TAC5X1X_REG(0, 0x29)
+#define	TAC5X1X_PASIRXCH3	TAC5X1X_REG(0, 0x2a)
+#define	TAC5X1X_PASIRXCH4	TAC5X1X_REG(0, 0x2b)
+#define	TAC5X1X_PASIRXCH5	TAC5X1X_REG(0, 0x2c)
+#define	TAC5X1X_PASIRXCH6	TAC5X1X_REG(0, 0x2d)
+#define	TAC5X1X_PASIRXCH7	TAC5X1X_REG(0, 0x2e)
+#define	TAC5X1X_PASIRXCH8	TAC5X1X_REG(0, 0x2f)
+#define	TAC5X1X_CLK0		TAC5X1X_REG(0, 0x32)
+#define	TAC5X1X_CLK1		TAC5X1X_REG(0, 0x33)
+#define	TAC5X1X_CLK2		TAC5X1X_REG(0, 0x34)
+#define	TAC5X1X_CNTCLK0		TAC5X1X_REG(0, 0x35)
+#define	TAC5X1X_CNTCLK1		TAC5X1X_REG(0, 0x36)
+#define	TAC5X1X_CNTCLK2		TAC5X1X_REG(0, 0x37)
+#define	TAC5X1X_CNTCLK3		TAC5X1X_REG(0, 0x38)
+#define	TAC5X1X_CNTCLK4		TAC5X1X_REG(0, 0x39)
+#define	TAC5X1X_CNTCLK5		TAC5X1X_REG(0, 0x3a)
+#define	TAC5X1X_CNTCLK6		TAC5X1X_REG(0, 0x3b)
+#define	TAC5X1X_CLKERRSTS0	TAC5X1X_REG(0, 0x3c)
+#define	TAC5X1X_CLKERRSTS1	TAC5X1X_REG(0, 0x3d)
+#define	TAC5X1X_CLKDETSTS0	TAC5X1X_REG(0, 0x3e)
+#define	TAC5X1X_CLKDETSTS1	TAC5X1X_REG(0, 0x3f)
+#define	TAC5X1X_CLKDETSTS2	TAC5X1X_REG(0, 0x40)
+#define	TAC5X1X_CLKDETSTS3	TAC5X1X_REG(0, 0x41)
+#define	TAC5X1X_INT		TAC5X1X_REG(0, 0x42)
+#define	TAC5X1X_DAC_FLT		TAC5X1X_REG(0, 0x43)
+#define	TAC5X1X_ADCDACMISC	TAC5X1X_REG(0, 0x4b)
+#define	TAC5X1X_IADC		TAC5X1X_REG(0, 0x4c)
+#define	TAC5X1X_VREFCFG		TAC5X1X_REG(0, 0x4d)
+#define	TAC5X1X_PWRTUNE0	TAC5X1X_REG(0, 0x4e)
+#define	TAC5X1X_PWRTUNE1	TAC5X1X_REG(0, 0x4f)
+#define	TAC5X1X_ADCCH1C0	TAC5X1X_REG(0, 0x50)
+#define	TAC5X1X_ADCCH		TAC5X1X_REG(0, 0x51)
+#define	TAC5X1X_ADCCH1C2	TAC5X1X_REG(0, 0x52)
+#define	TAC5X1X_ADCCH1C3	TAC5X1X_REG(0, 0x53)
+#define	TAC5X1X_ADCCH1C4	TAC5X1X_REG(0, 0x54)
+#define	TAC5X1X_ADCCH2C0	TAC5X1X_REG(0, 0x55)
+#define	TAC5X1X_ADCCH2C2	TAC5X1X_REG(0, 0x57)
+#define	TAC5X1X_ADCCH2C3	TAC5X1X_REG(0, 0x58)
+#define	TAC5X1X_ADCCH2C4	TAC5X1X_REG(0, 0x59)
+#define	TAC5X1X_ADCCH3C0	TAC5X1X_REG(0, 0x5a)
+#define	TAC5X1X_ADCCH3C2	TAC5X1X_REG(0, 0x5b)
+#define	TAC5X1X_ADCCH3C3	TAC5X1X_REG(0, 0x5c)
+#define	TAC5X1X_ADCCH3C4	TAC5X1X_REG(0, 0x5d)
+#define	TAC5X1X_ADCCH4C0	TAC5X1X_REG(0, 0x5e)
+#define	TAC5X1X_ADCCH4C2	TAC5X1X_REG(0, 0x5f)
+#define	TAC5X1X_ADCCH4C3	TAC5X1X_REG(0, 0x60)
+#define	TAC5X1X_ADCCH4C4	TAC5X1X_REG(0, 0x61)
+#define	TAC5X1X_ADCCFG1		TAC5X1X_REG(0, 0x62)
+#define	TAC5X1X_OUT1CFG0	TAC5X1X_REG(0, 0x64)
+#define	TAC5X1X_OUT1CFG1	TAC5X1X_REG(0, 0x65)
+#define	TAC5X1X_OUT1CFG2	TAC5X1X_REG(0, 0x66)
+#define	TAC5X1X_DACCH1A0	TAC5X1X_REG(0, 0x67)
+#define	TAC5X1X_DACCH1A1	TAC5X1X_REG(0, 0x68)
+#define	TAC5X1X_DACCH1B0	TAC5X1X_REG(0, 0x69)
+#define	TAC5X1X_DACCH1B1	TAC5X1X_REG(0, 0x6a)
+#define	TAC5X1X_OUT2CFG0	TAC5X1X_REG(0, 0x6b)
+#define	TAC5X1X_OUT2CFG1	TAC5X1X_REG(0, 0x6c)
+#define	TAC5X1X_OUT2CFG2	TAC5X1X_REG(0, 0x6d)
+#define	TAC5X1X_DACCH2A0	TAC5X1X_REG(0, 0x6e)
+#define	TAC5X1X_DACCH2A1	TAC5X1X_REG(0, 0x6f)
+#define	TAC5X1X_DACCH2B0	TAC5X1X_REG(0, 0x70)
+#define	TAC5X1X_DACCH2B1	TAC5X1X_REG(0, 0x71)
+#define	TAC5X1X_DSP0		TAC5X1X_REG(0, 0x72)
+#define	TAC5X1X_DSP1		TAC5X1X_REG(0, 0x73)
+#define	TAC5X1X_CH_EN		TAC5X1X_REG(0, 0x76)
+#define	TAC5X1X_DYN_PUPD	TAC5X1X_REG(0, 0x77)
+#define	TAC5X1X_PWR_CFG		TAC5X1X_REG(0, 0x78)
+#define	TAC5X1X_DEVSTS0		TAC5X1X_REG(0, 0x79)
+#define	TAC5X1X_DEVSTS1		TAC5X1X_REG(0, 0x7a)
+
+#define	TAC5X1X_CLKCFG0		TAC5X1X_REG(1, 0xd)
+#define	TAC5X1X_MICBIAS1	TAC5X1X_REG(1, 0x16)
+#define	TAC5X1X_AGC_DRC		TAC5X1X_REG(1, 0x24)
+#define	TAC5X1X_PLIM		TAC5X1X_REG(1, 0x2b)
+#define	TAC5X1X_MIXER		TAC5X1X_REG(1, 0x2c)
+
+#define	TAC5X1X_DIAG_CFG0	TAC5X1X_REG(1, 0x46)
+#define	TAC5X1X_DIAG_CFG1	TAC5X1X_REG(1, 0x47)
+#define	TAC5X1X_DIAG_CFG2	TAC5X1X_REG(1, 0x48)
+#define	TAC5X1X_DIAG_CFG8	TAC5X1X_REG(1, 0x4e)
+#define	TAC5X1X_DIAG_CFG9	TAC5X1X_REG(1, 0x4b)
+#define	 TAC5X1X_DIAG_CFG6	TAC5X1X_REG(1, 0x4c)
+#define	TAC5X1X_DIAG_CFG7	TAC5X1X_REG(1, 0x4d)
+
+/* interrupt latches */
+#define	TAC5X1X_REG_INT_LTCH0	TAC5X1X_REG(0x1, 0x34)
+#define	TAC5X1X_REG_CHX_LTCH	TAC5X1X_REG(0x1, 0x35)
+#define	TAC5X1X_REG_IN_CH1_LTCH		TAC5X1X_REG(0x1, 0x36)
+#define	TAC5X1X_REG_IN_CH2_LTCH		TAC5X1X_REG(0x1, 0x37)
+#define	TAC5X1X_REG_OUT_CH1_LTCH	TAC5X1X_REG(0x1, 0x38)
+#define	TAC5X1X_REG_OUT_CH2_LTCH	TAC5X1X_REG(0x1, 0x39)
+#define	TAC5X1X_REG_INT_LTCH1	TAC5X1X_REG(0x1, 0x3A)
+#define	TAC5X1X_REG_INT_LTCH2	TAC5X1X_REG(0x1, 0x3B)
+
+/* Bits, masks, and shifts */
+/* TAC5X1X_CH_EN */
+#define	TAC5X1X_CH_EN_ADC_MASK	GENMASK(7, 4)
+#define	TAC5X1X_CH_EN_ADC_CH1	BIT(7)
+#define	TAC5X1X_CH_EN_ADC_CH2	BIT(6)
+#define	TAC5X1X_CH_EN_ADC_CH3	BIT(5)
+#define	TAC5X1X_CH_EN_ADC_CH4	BIT(4)
+
+#define	TAC5X1X_CH_EN_DAC_MASK	GENMASK(3, 0)
+#define	TAC5X1X_CH_EN_DAC_CH1	BIT(3)
+#define	TAC5X1X_CH_EN_DAC_CH2	BIT(2)
+#define	TAC5X1X_CH_EN_DAC_CH3	BIT(1)
+#define	TAC5X1X_CH_EN_DAC_CH4	BIT(0)
+
+/* TAC5X1X_GPIOVAL */
+#define	TAC5X1X_GPIO1_VAL	BIT(7)
+#define	TAC5X1X_GPIO2_VAL	BIT(6)
+#define	TAC5X1X_GPO1_VAL	BIT(5)
+#define	TAC5X1X_GPIO1_MON	BIT(3)
+#define	TAC5X1X_GPIO2_MON	BIT(2)
+#define	TAC5X1X_GPI1_MON	BIT(1)
+
+/* TAC5X1X_DIAG_CFG0 */
+#define	TAC5X1X_IN_CH_DIAG_EN_MASK	0xc0
+#define	TAC5X1X_INCL_SE_INM_MASK	0x20
+#define	TAC5X1X_INCL_AC_COUP_MASK	0x10
+#define	TAC5X1X_OUT1P_DIAG_EN_MASK	0x0f
+#define	TAC5X1X_MICBIAS_LOW_THRESHOLD	0x48
+#define	TAC5X1X_MICBIAS_HIGH_THRESHOLD	0xa2
+#define	TAC5X1X_GPA_LOW_THRESHOLD	0x4b
+#define	TAC5X1X_GPA_HIGH_THRESHOLD	0xba
+
+/* TAC5X1X_PASI */
+#define	TAC5X1X_PASI_SAMP_RATE_MASK	GENMASK(7, 2)
+#define	TAC5X1X_PASI_FMT_MASK		GENMASK(7, 6)
+#define	TAC5X1X_PASI_FMT_TDM		0x00
+#define	TAC5X1X_PASI_FMT_I2S		0x40
+#define	TAC5X1X_PASI_FMT_LJ		0x80
+
+#define	TAC5X1X_PASI_DATALEN_MASK	GENMASK(5, 4)
+#define	TAC5X1X_WORD_LEN_16BITS		0x00
+#define	TAC5X1X_WORD_LEN_20BITS		0x10
+#define	TAC5X1X_WORD_LEN_24BITS		0x20
+#define	TAC5X1X_WORD_LEN_32BITS		0x30
+
+/* TAC5X1X_CNTCLK2 */
+#define	TAC5X1X_PASI_MODE_MASK		0x10
+#define	TAC5X1X_SASI_MODE_MASK		0x08
+#define	TAC5X1X_ASI_RATE_MASK		0x01
+
+#define	TAC5X1X_PASI_RATE_48000		0x00
+#define	TAC5X1X_PASI_RATE_44100		0x01
+
+/* TAC5X1X_PASITX0 */
+#define	TAC5X1X_PASITX_OFFSET_MASK	0x1f
+
+/* TAC5X1X_PASIRX0 */
+#define	TAC5X1X_PASIRX_OFFSET_MASK	0x1f
+
+/* TAC5X1X_VREF */
+#define	TAC5X1X_VREF_SLEEP_EXIT_VREF_EN		0x80
+#define	TAC5X1X_VREF_SLEEP_ACTIVE_MASK		0x01
+
+/* TAC5X1X_PWRCFG */
+#define	TAC5X1X_PWR_CFG_ADC_PDZ	BIT(7)
+#define	TAC5X1X_PWR_CFG_DAC_PDZ	BIT(6)
+#define	TAC5X1X_PWR_CFG_MICBIAS	BIT(5)
+#define	TAC5X1X_PWR_CFG_UAD_EN	BIT(3)
+#define	TAC5X1X_PWR_CFG_VAD_EN	BIT(2)
+#define	TAC5X1X_PWR_CFG_UAG_EN	BIT(1)
+
+/* TAC5X1X_GPIOx */
+#define	TAC5X1X_GPIO1_DEFAULT_VAL	0x32
+#define	TAC5X1X_GPIO2_DEFAULT_VAL	0x00
+#define	TAC5X1X_GPI1_DEFAULT_VAL	0x00
+#define	TAC5X1X_GPO1_DEFAULT_VAL	0x00
+
+#define	TAC5X1X_GPIOX_CFG_MASK	0xf0
+#define	TAC5X1X_GPIOX_DRV_MASK	0x07
+
+#define	TAC5X1X_GPIO_DISABLE	0
+#define	TAC5X1X_GPIO_GPI	1
+#define	TAC5X1X_GPIO_GPO	2
+#define	TAC5X1X_GPIO_IRQ	3
+#define	TAC5X1X_GPIO_PDMCLK	4
+#define	TAC5X1X_GPIO_P_DOUT	5
+#define	TAC5X1X_GPIO_P_DOUT2	6
+#define	TAC5X1X_GPIO_S_DOUT	7
+#define	TAC5X1X_GPIO_S_DOUT2	8
+#define	TAC5X1X_GPIO_S_BCLK	9
+#define	TAC5X1X_GPIO_S_FSYNC	10
+#define	TAC5X1X_GPIO_CLKOUT	11
+#define	TAC5X1X_GPIO_DOUT_MUX	12
+#define	TAC5X1X_GPIO_DAISY_OUT	13
+
+#define	TAC5X1X_GPIO_DRV_HIZ	0
+#define	TAC5X1X_GPIO_DRV_ALAH	1
+#define	TAC5X1X_GPIO_DRV_ALWH	2
+#define	TAC5X1X_GPIO_DRV_ALHIZ	3
+#define	TAC5X1X_GPIO_DRV_WLAH	4
+#define	TAC5X1X_GPIO_DRV_HIZAH	5
+
+/* TAC5X1X_GPI1 */
+#define	TAC5X1X_GPI1_CFG_MASK	BIT(1)
+#define	TAC5X1X_GPA_CFG_MASK	BIT(0)
+
+/* TAC5X1X_VREFCFG */
+#define	TAC5X1X_VREFCFG_MICBIAS_VAL_MASK	GENMASK(3, 2)
+#define	TAC5X1X_VREFCFG_VREF_FSCALE_MASK	GENMASK(1, 0)
+
+#define TAC5X1X_ADCCH1C0_IMPEDANCE_MASK		GENMASK(5, 4)
+#define TAC5X1X_ADCCH2C0_IMPEDANCE_MASK	GENMASK(5, 4)
+
+#define TAC5X1X_OUT2CFG0_VCOM_MASK	BIT(1)
+
+#define	TAC5X1X_MICBIAS_VREF	0
+#define	TAC5X1X_MICBIAS_0_5VREF	1
+#define	TAC5X1X_MICBIAS_AVDD	3
+
+#define	TAC5X1X_VERF_2_75V	0
+#define	TAC5X1X_VERF_2_5V	1
+#define	TAC5X1X_VERF_1_375V	2
+
+enum tac5x1x_type {
+	TAA5212 = 0,
+	TAA5412,
+	TAC5111,
+	TAC5112,
+	TAC5211,
+	TAC5212,
+	TAC5311,
+	TAC5312,
+	TAC5411,
+	TAC5412,
+	TAD5112,
+	TAD5212,
+};
+
+#endif	/* _TAC5X1X_H */
-- 
2.45.2

