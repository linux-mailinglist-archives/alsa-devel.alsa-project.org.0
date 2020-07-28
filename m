Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBFC230770
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jul 2020 12:15:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5F1B169F;
	Tue, 28 Jul 2020 12:14:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5F1B169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595931330;
	bh=gA09eDITk9lz6oD6qpT6jl6wNxnxJFvH9YVWgduWI7U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H1TTblJnI0KsO0BX7Wk1uxsZakM1nohEBOpKmj3JD5IN9DXwDzXp9z6XeDFra3Ypf
	 zRlD0KwCFAkHfVxUsfaRcZGvuI3lGHNgsVLipX6CzPtt4rjQyGTbeqWKXJRA53RPFG
	 tzu0b0VaOqTMgQSsxyJ8PjosuwYbEgJ5hA7u7lwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DA12F80240;
	Tue, 28 Jul 2020 12:13:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88E14F8021E; Tue, 28 Jul 2020 12:13:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa3.microchip.iphmx.com (esa3.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02972F8012F
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 12:12:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02972F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="GcmRaOT/"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1595931175; x=1627467175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gA09eDITk9lz6oD6qpT6jl6wNxnxJFvH9YVWgduWI7U=;
 b=GcmRaOT/29bmEqeOQL/5SmoxWHbWLAJ9LJ7EDXAhFmz8mQYjWAVySDG2
 Kj4sAFeCwYcZoT1elEr04Dcq+ilirAh5x6XM6V/MTNKH4wA9xNkApInpg
 rvXO+X5AxF8C1fr/mWKeAOQNZIQwScFEcImJGq3VJi4jhuWnN91i8nTXE
 CvvirosSyMeugEt+cyA1YmuT+tMi4oU4foxdwlF7Ddx94YsJfj/MndI/B
 PTioEuGSIv6kHA+ES+OVd9xJ9wKlnPyZECmFlzxBlCm6Vf2OnYKDlz/F+
 8aFdELiTPxCu/rVYvuNYJn5lpumsjPD6Py0GcGAXpbPTnB0WGQmrL2NDN w==;
IronPort-SDR: 0F203wyJBtkammrcPBvzmzSquoLA2Le3FuICeVM8y145SvSVzZrdiPyIsDrtq0977GfL+YpwHy
 b3+7jvfhIcd7HPsEVkrmFT3QcFM78CVs2mZca0RzC7Frkl65qt+MxY7rwf31E24CNz/uB7Ljl7
 GR4a0mUz9DSKac8gLqCE+QulZq3vPaQDFP8tgbnGuBDHcqbZkI6Y3jJU3d1IKz8bV/QuU/4Lq5
 hlWmAGUpmb1pscS1Iqr9N/fmX9HanWjPWcKkHwg70BY2I89aSMcWtwk2fVgQsF671adOjnwLdW
 TtU=
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; d="scan'208";a="85607383"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Jul 2020 03:12:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 28 Jul 2020 03:12:46 -0700
Received: from rob-ult-m19940.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Tue, 28 Jul 2020 03:11:58 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] ASoC: mchp-spdiftx: add driver for S/PDIF TX Controller
Date: Tue, 28 Jul 2020 13:07:44 +0300
Message-ID: <20200728100744.2820112-2-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200728100744.2820112-1-codrin.ciubotariu@microchip.com>
References: <20200728100744.2820112-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alexandre.belloni@bootlin.com, lgirdwood@gmail.com,
 nicolas.ferre@microchip.com, robh+dt@kernel.org, tiwai@suse.com,
 ludovic.desroches@microchip.com, broonie@kernel.org, Codrin
 Ciubotariu <codrin.ciubotariu@microchip.com>
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

The new SPDIF TX controller is a serial port compliant with the IEC-
60958 standard. It also supports programmable User Data and Channel
Status fields.

This IP is embedded in Microchip's sama7g5 SoC.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 sound/soc/atmel/Kconfig        |  12 +
 sound/soc/atmel/Makefile       |   2 +
 sound/soc/atmel/mchp-spdiftx.c | 864 +++++++++++++++++++++++++++++++++
 3 files changed, 878 insertions(+)
 create mode 100644 sound/soc/atmel/mchp-spdiftx.c

diff --git a/sound/soc/atmel/Kconfig b/sound/soc/atmel/Kconfig
index 71f2d42188c4..93beb7d670a3 100644
--- a/sound/soc/atmel/Kconfig
+++ b/sound/soc/atmel/Kconfig
@@ -132,4 +132,16 @@ config SND_MCHP_SOC_I2S_MCC
 	  and supports a Time Division Multiplexed (TDM) interface with
 	  external multi-channel audio codecs.
 
+config SND_MCHP_SOC_SPDIFTX
+	tristate "Microchip ASoC driver for boards using S/PDIF TX"
+	depends on OF && (ARCH_AT91 || COMPILE_TEST)
+	select SND_SOC_GENERIC_DMAENGINE_PCM
+	select REGMAP_MMIO
+	help
+	  Say Y or M if you want to add support for Microchip S/PDIF TX ASoc
+	  driver on the following Microchip platforms:
+	  - sama7g5
+
+	  This S/PDIF TX driver is compliant with IEC-60958 standard and
+	  includes programable User Data and Channel Status fields.
 endif
diff --git a/sound/soc/atmel/Makefile b/sound/soc/atmel/Makefile
index c7d2989791be..3fd89a0063df 100644
--- a/sound/soc/atmel/Makefile
+++ b/sound/soc/atmel/Makefile
@@ -5,6 +5,7 @@ snd-soc-atmel-pcm-dma-objs := atmel-pcm-dma.o
 snd-soc-atmel_ssc_dai-objs := atmel_ssc_dai.o
 snd-soc-atmel-i2s-objs := atmel-i2s.o
 snd-soc-mchp-i2s-mcc-objs := mchp-i2s-mcc.o
+snd-soc-mchp-spdiftx-objs := mchp-spdiftx.o
 
 # pdc and dma need to both be built-in if any user of
 # ssc is built-in.
@@ -17,6 +18,7 @@ endif
 obj-$(CONFIG_SND_ATMEL_SOC_SSC) += snd-soc-atmel_ssc_dai.o
 obj-$(CONFIG_SND_ATMEL_SOC_I2S) += snd-soc-atmel-i2s.o
 obj-$(CONFIG_SND_MCHP_SOC_I2S_MCC) += snd-soc-mchp-i2s-mcc.o
+obj-$(CONFIG_SND_MCHP_SOC_SPDIFTX) += snd-soc-mchp-spdiftx.o
 
 # AT91 Machine Support
 snd-soc-sam9g20-wm8731-objs := sam9g20_wm8731.o
diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
new file mode 100644
index 000000000000..738f6788212e
--- /dev/null
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -0,0 +1,864 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Driver for Microchip S/PDIF TX Controller
+//
+// Copyright (C) 2020 Microchip Technology Inc. and its subsidiaries
+//
+// Author: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
+
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/spinlock.h>
+
+#include <sound/asoundef.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+
+/*
+ * ---- S/PDIF Transmitter Controller Register map ----
+ */
+#define SPDIFTX_CR			0x00	/* Control Register */
+#define SPDIFTX_MR			0x04	/* Mode Register */
+#define SPDIFTX_CDR			0x0C	/* Common Data Register */
+
+#define SPDIFTX_IER			0x14	/* Interrupt Enable Register */
+#define SPDIFTX_IDR			0x18	/* Interrupt Disable Register */
+#define SPDIFTX_IMR			0x1C	/* Interrupt Mask Register */
+#define SPDIFTX_ISR			0x20	/* Interrupt Status Register */
+
+#define SPDIFTX_CH1UD(reg)	(0x50 + (reg) * 4)	/* User Data 1 Register x */
+#define SPDIFTX_CH1S(reg)	(0x80 + (reg) * 4)	/* Channel Status 1 Register x */
+
+#define SPDIFTX_VERSION			0xF0
+
+/*
+ * ---- Control Register (Write-only) ----
+ */
+#define SPDIFTX_CR_SWRST		BIT(0)	/* Software Reset */
+#define SPDIFTX_CR_FCLR			BIT(1)	/* FIFO clear */
+
+/*
+ * ---- Mode Register (Read/Write) ----
+ */
+/* Transmit Enable */
+#define SPDIFTX_MR_TXEN_MASK		GENMASK(0, 0)
+#define SPDIFTX_MR_TXEN_DISABLE		(0 << 0)
+#define SPDIFTX_MR_TXEN_ENABLE		(1 << 0)
+
+/* Multichannel Transfer */
+#define SPDIFTX_MR_MULTICH_MASK		GENAMSK(1, 1)
+#define SPDIFTX_MR_MULTICH_MONO		(0 << 1)
+#define SPDIFTX_MR_MULTICH_DUAL		(1 << 1)
+
+/* Data Word Endian Mode */
+#define SPDIFTX_MR_ENDIAN_MASK		GENMASK(2, 2)
+#define SPDIFTX_MR_ENDIAN_LITTLE	(0 << 2)
+#define SPDIFTX_MR_ENDIAN_BIG		(1 << 2)
+
+/* Data Justification */
+#define SPDIFTX_MR_JUSTIFY_MASK		GENMASK(3, 3)
+#define SPDIFTX_MR_JUSTIFY_LSB		(0 << 3)
+#define SPDIFTX_MR_JUSTIFY_MSB		(1 << 3)
+
+/* Common Audio Register Transfer Mode */
+#define SPDIFTX_MR_CMODE_MASK			GENMASK(5, 4)
+#define SPDIFTX_MR_CMODE_INDEX_ACCESS		(0 << 4)
+#define SPDIFTX_MR_CMODE_TOGGLE_ACCESS		(1 << 4)
+#define SPDIFTX_MR_CMODE_INTERLVD_ACCESS	(2 << 4)
+
+/* Valid Bits per Sample */
+#define SPDIFTX_MR_VBPS_MASK		GENMASK(13, 8)
+#define SPDIFTX_MR_VBPS(bps)		(((bps) << 8) & SPDIFTX_MR_VBPS_MASK)
+
+/* Chunk Size */
+#define SPDIFTX_MR_CHUNK_MASK		GENMASK(19, 16)
+#define SPDIFTX_MR_CHUNK(size)		(((size) << 16) & SPDIFTX_MR_CHUNK_MASK)
+
+/* Validity Bits for Channels 1 and 2 */
+#define SPDIFTX_MR_VALID1			BIT(24)
+#define SPDIFTX_MR_VALID2			BIT(25)
+
+/* Disable Null Frame on underrrun */
+#define SPDIFTX_MR_DNFR_MASK		GENMASK(27, 27)
+#define SPDIFTX_MR_DNFR_INVALID		(0 << 27)
+#define SPDIFTX_MR_DNFR_VALID		(1 << 27)
+
+/* Bytes per Sample */
+#define SPDIFTX_MR_BPS_MASK		GENMASK(29, 28)
+#define SPDIFTX_MR_BPS(bytes) \
+	((((bytes) - 1) << 28) & SPDIFTX_MR_BPS_MASK)
+
+/*
+ * ---- Interrupt Enable/Disable/Mask/Status Register (Write/Read-only) ----
+ */
+#define SPDIFTX_IR_TXRDY		BIT(0)
+#define SPDIFTX_IR_TXEMPTY		BIT(1)
+#define SPDIFTX_IR_TXFULL		BIT(2)
+#define SPDIFTX_IR_TXCHUNK		BIT(3)
+#define SPDIFTX_IR_TXUDR		BIT(4)
+#define SPDIFTX_IR_TXOVR		BIT(5)
+#define SPDIFTX_IR_CSRDY		BIT(6)
+#define SPDIFTX_IR_UDRDY		BIT(7)
+#define SPDIFTX_IR_TXRDYCH(ch)		BIT((ch) + 8)
+#define SPDIFTX_IR_SECE			BIT(10)
+#define SPDIFTX_IR_TXUDRCH(ch)		BIT((ch) + 11)
+#define SPDIFTX_IR_BEND			BIT(13)
+
+static bool mchp_spdiftx_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SPDIFTX_MR:
+	case SPDIFTX_IMR:
+	case SPDIFTX_ISR:
+	case SPDIFTX_CH1UD(0):
+	case SPDIFTX_CH1UD(1):
+	case SPDIFTX_CH1UD(2):
+	case SPDIFTX_CH1UD(3):
+	case SPDIFTX_CH1UD(4):
+	case SPDIFTX_CH1UD(5):
+	case SPDIFTX_CH1S(0):
+	case SPDIFTX_CH1S(1):
+	case SPDIFTX_CH1S(2):
+	case SPDIFTX_CH1S(3):
+	case SPDIFTX_CH1S(4):
+	case SPDIFTX_CH1S(5):
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool mchp_spdiftx_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SPDIFTX_CR:
+	case SPDIFTX_MR:
+	case SPDIFTX_CDR:
+	case SPDIFTX_IER:
+	case SPDIFTX_IDR:
+	case SPDIFTX_CH1UD(0):
+	case SPDIFTX_CH1UD(1):
+	case SPDIFTX_CH1UD(2):
+	case SPDIFTX_CH1UD(3):
+	case SPDIFTX_CH1UD(4):
+	case SPDIFTX_CH1UD(5):
+	case SPDIFTX_CH1S(0):
+	case SPDIFTX_CH1S(1):
+	case SPDIFTX_CH1S(2):
+	case SPDIFTX_CH1S(3):
+	case SPDIFTX_CH1S(4):
+	case SPDIFTX_CH1S(5):
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool mchp_spdiftx_precious_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SPDIFTX_CDR:
+	case SPDIFTX_ISR:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config mchp_spdiftx_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = SPDIFTX_VERSION,
+	.readable_reg = mchp_spdiftx_readable_reg,
+	.writeable_reg = mchp_spdiftx_writeable_reg,
+	.precious_reg = mchp_spdiftx_precious_reg,
+};
+
+#define SPDIFTX_GCLK_RATIO	128
+
+#define SPDIFTX_CS_BITS		192
+#define SPDIFTX_UD_BITS		192
+
+struct mchp_spdiftx_mixer_control {
+	unsigned char				ch_stat[SPDIFTX_CS_BITS / 8];
+	unsigned char				user_data[SPDIFTX_UD_BITS / 8];
+	spinlock_t				lock;
+};
+
+struct mchp_spdiftx_dev {
+	struct mchp_spdiftx_mixer_control	control;
+	struct snd_dmaengine_dai_dma_data	playback;
+	struct device				*dev;
+	struct regmap				*regmap;
+	struct clk				*pclk;
+	struct clk				*gclk;
+	unsigned int				fmt;
+	const struct mchp_i2s_caps		*caps;
+	int					gclk_enabled:1;
+};
+
+static inline int mchp_spdiftx_is_running(struct mchp_spdiftx_dev *dev)
+{
+	u32 mr;
+
+	regmap_read(dev->regmap, SPDIFTX_MR, &mr);
+	return !!(mr & SPDIFTX_MR_TXEN_ENABLE);
+}
+
+static void mchp_spdiftx_channel_status_write(struct mchp_spdiftx_dev *dev)
+{
+	struct mchp_spdiftx_mixer_control *ctrl = &dev->control;
+	u32 val;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ctrl->ch_stat) / 4; i++) {
+		val = (ctrl->ch_stat[(i * 4) + 0] << 0) |
+		      (ctrl->ch_stat[(i * 4) + 1] << 8) |
+		      (ctrl->ch_stat[(i * 4) + 2] << 16) |
+		      (ctrl->ch_stat[(i * 4) + 3] << 24);
+
+		regmap_write(dev->regmap, SPDIFTX_CH1S(i), val);
+	}
+}
+
+static void mchp_spdiftx_user_data_write(struct mchp_spdiftx_dev *dev)
+{
+	struct mchp_spdiftx_mixer_control *ctrl = &dev->control;
+	u32 val;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ctrl->user_data) / 4; i++) {
+		val = (ctrl->user_data[(i * 4) + 0] << 0) |
+		      (ctrl->user_data[(i * 4) + 1] << 8) |
+		      (ctrl->user_data[(i * 4) + 2] << 16) |
+		      (ctrl->user_data[(i * 4) + 3] << 24);
+
+		regmap_write(dev->regmap, SPDIFTX_CH1UD(i), val);
+	}
+}
+
+static irqreturn_t mchp_spdiftx_interrupt(int irq, void *dev_id)
+{
+	struct mchp_spdiftx_dev *dev = dev_id;
+	struct mchp_spdiftx_mixer_control *ctrl = &dev->control;
+	u32 sr, imr, pending, idr = 0;
+
+	regmap_read(dev->regmap, SPDIFTX_ISR, &sr);
+	regmap_read(dev->regmap, SPDIFTX_IMR, &imr);
+	pending = sr & imr;
+
+	if (!pending)
+		return IRQ_NONE;
+
+	if (pending & SPDIFTX_IR_TXUDR) {
+		dev_warn(dev->dev, "underflow detected\n");
+		idr |= SPDIFTX_IR_TXUDR;
+	}
+
+	if (pending & SPDIFTX_IR_TXOVR) {
+		dev_warn(dev->dev, "overflow detected\n");
+		idr |= SPDIFTX_IR_TXOVR;
+	}
+
+	if (pending & SPDIFTX_IR_UDRDY) {
+		spin_lock(&ctrl->lock);
+		mchp_spdiftx_user_data_write(dev);
+		spin_unlock(&ctrl->lock);
+		idr |= SPDIFTX_IR_UDRDY;
+	}
+
+	if (pending & SPDIFTX_IR_CSRDY) {
+		spin_lock(&ctrl->lock);
+		mchp_spdiftx_channel_status_write(dev);
+		spin_unlock(&ctrl->lock);
+		idr |= SPDIFTX_IR_CSRDY;
+	}
+
+	regmap_write(dev->regmap, SPDIFTX_IDR, idr);
+
+	return IRQ_HANDLED;
+}
+
+static int mchp_spdiftx_dai_startup(struct snd_pcm_substream *substream,
+				    struct snd_soc_dai *dai)
+{
+	struct mchp_spdiftx_dev *dev = snd_soc_dai_get_drvdata(dai);
+	int err;
+
+	err = clk_prepare_enable(dev->pclk);
+	if (err) {
+		dev_err(dev->dev,
+			"failed to enable the peripheral clock: %d\n", err);
+		return err;
+	}
+
+	/* Software reset the IP */
+	regmap_write(dev->regmap, SPDIFTX_CR,
+		     SPDIFTX_CR_SWRST | SPDIFTX_CR_FCLR);
+
+	return 0;
+}
+
+static void mchp_spdiftx_dai_shutdown(struct snd_pcm_substream *substream,
+				      struct snd_soc_dai *dai)
+{
+	struct mchp_spdiftx_dev *dev = snd_soc_dai_get_drvdata(dai);
+
+	/* Disable interrupts */
+	regmap_write(dev->regmap, SPDIFTX_IDR, 0xffffffff);
+
+	clk_disable_unprepare(dev->pclk);
+}
+
+static int mchp_spdiftx_trigger(struct snd_pcm_substream *substream, int cmd,
+				struct snd_soc_dai *dai)
+{
+	struct mchp_spdiftx_dev *dev = snd_soc_dai_get_drvdata(dai);
+	struct mchp_spdiftx_mixer_control *ctrl = &dev->control;
+	u32 mr;
+	int running;
+	int ret;
+
+	/* do not start/stop while channel status or user data is updated */
+	spin_lock(&ctrl->lock);
+	regmap_read(dev->regmap, SPDIFTX_MR, &mr);
+	running = !!(mr & SPDIFTX_MR_TXEN_ENABLE);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		if (!running) {
+			mr &= ~SPDIFTX_MR_TXEN_MASK;
+			mr |= SPDIFTX_MR_TXEN_ENABLE;
+		}
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		if (running) {
+			mr &= ~SPDIFTX_MR_TXEN_MASK;
+			mr |= SPDIFTX_MR_TXEN_DISABLE;
+		}
+		break;
+	default:
+		spin_unlock(&ctrl->lock);
+		return -EINVAL;
+	}
+
+	ret = regmap_write(dev->regmap, SPDIFTX_MR, mr);
+	spin_unlock(&ctrl->lock);
+	if (ret) {
+		dev_err(dev->dev, "unable to disable TX: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int mchp_spdiftx_hw_params(struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params,
+				  struct snd_soc_dai *dai)
+{
+	unsigned long flags;
+	struct mchp_spdiftx_dev *dev = snd_soc_dai_get_drvdata(dai);
+	struct mchp_spdiftx_mixer_control *ctrl = &dev->control;
+	u32 mr;
+	unsigned int bps = params_physical_width(params) / 8;
+	int ret;
+
+	dev_dbg(dev->dev, "%s() rate=%u format=%#x width=%u channels=%u\n",
+		__func__, params_rate(params), params_format(params),
+		params_width(params), params_channels(params));
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+		dev_err(dev->dev, "Capture is not supported\n");
+		return -EINVAL;
+	}
+
+	regmap_read(dev->regmap, SPDIFTX_MR, &mr);
+
+	if (mr & SPDIFTX_MR_TXEN_ENABLE) {
+		dev_err(dev->dev, "PCM already running\n");
+		return -EBUSY;
+	}
+
+	/* Defaults: Toggle mode, justify to LSB, chunksize 1 */
+	mr = SPDIFTX_MR_CMODE_TOGGLE_ACCESS | SPDIFTX_MR_JUSTIFY_LSB;
+	dev->playback.maxburst = 1;
+	switch (params_channels(params)) {
+	case 1:
+		mr |= SPDIFTX_MR_MULTICH_MONO;
+		break;
+	case 2:
+		mr |= SPDIFTX_MR_MULTICH_DUAL;
+		if (bps > 2)
+			dev->playback.maxburst = 2;
+		break;
+	default:
+		dev_err(dev->dev, "unsupported number of channels: %d\n",
+			params_channels(params));
+		return -EINVAL;
+	}
+	mr |= SPDIFTX_MR_CHUNK(dev->playback.maxburst);
+
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S8:
+		mr |= SPDIFTX_MR_VBPS(8);
+		break;
+	case SNDRV_PCM_FORMAT_S16_BE:
+		mr |= SPDIFTX_MR_ENDIAN_BIG;
+		fallthrough;
+	case SNDRV_PCM_FORMAT_S16_LE:
+		mr |= SPDIFTX_MR_VBPS(16);
+		break;
+	case SNDRV_PCM_FORMAT_S18_3BE:
+		mr |= SPDIFTX_MR_ENDIAN_BIG;
+		fallthrough;
+	case SNDRV_PCM_FORMAT_S18_3LE:
+		mr |= SPDIFTX_MR_VBPS(18);
+		break;
+	case SNDRV_PCM_FORMAT_S20_3BE:
+		mr |= SPDIFTX_MR_ENDIAN_BIG;
+		fallthrough;
+	case SNDRV_PCM_FORMAT_S20_3LE:
+		mr |= SPDIFTX_MR_VBPS(20);
+		break;
+	case SNDRV_PCM_FORMAT_S24_3BE:
+		mr |= SPDIFTX_MR_ENDIAN_BIG;
+		fallthrough;
+	case SNDRV_PCM_FORMAT_S24_3LE:
+		mr |= SPDIFTX_MR_VBPS(24);
+		break;
+	case SNDRV_PCM_FORMAT_S24_BE:
+		mr |= SPDIFTX_MR_ENDIAN_BIG;
+		fallthrough;
+	case SNDRV_PCM_FORMAT_S24_LE:
+		mr |= SPDIFTX_MR_VBPS(24);
+		break;
+	case SNDRV_PCM_FORMAT_S32_BE:
+		mr |= SPDIFTX_MR_ENDIAN_BIG;
+		fallthrough;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		mr |= SPDIFTX_MR_VBPS(32);
+		break;
+	default:
+		dev_err(dev->dev, "unsupported PCM format: %d\n",
+			params_format(params));
+		return -EINVAL;
+	}
+
+	mr |= SPDIFTX_MR_BPS(bps);
+
+	spin_lock_irqsave(&ctrl->lock, flags);
+	ctrl->ch_stat[3] &= ~IEC958_AES3_CON_FS;
+	switch (params_rate(params)) {
+	case 22050:
+		ctrl->ch_stat[3] |= IEC958_AES3_CON_FS_22050;
+		break;
+	case 24000:
+		ctrl->ch_stat[3] |= IEC958_AES3_CON_FS_24000;
+		break;
+	case 32000:
+		ctrl->ch_stat[3] |= IEC958_AES3_CON_FS_32000;
+		break;
+	case 44100:
+		ctrl->ch_stat[3] |= IEC958_AES3_CON_FS_44100;
+		break;
+	case 48000:
+		ctrl->ch_stat[3] |= IEC958_AES3_CON_FS_48000;
+		break;
+	case 88200:
+		ctrl->ch_stat[3] |= IEC958_AES3_CON_FS_88200;
+		break;
+	case 96000:
+		ctrl->ch_stat[3] |= IEC958_AES3_CON_FS_96000;
+		break;
+	case 176400:
+		ctrl->ch_stat[3] |= IEC958_AES3_CON_FS_176400;
+		break;
+	case 192000:
+		ctrl->ch_stat[3] |= IEC958_AES3_CON_FS_192000;
+		break;
+	case 8000:
+	case 11025:
+	case 16000:
+	case 64000:
+		ctrl->ch_stat[3] |= IEC958_AES3_CON_FS_NOTID;
+		break;
+	default:
+		dev_err(dev->dev, "unsupported sample frequency: %u\n",
+			params_rate(params));
+		spin_unlock_irqrestore(&ctrl->lock, flags);
+		return -EINVAL;
+	}
+	mchp_spdiftx_channel_status_write(dev);
+	spin_unlock_irqrestore(&ctrl->lock, flags);
+	mr |= SPDIFTX_MR_VALID1 | SPDIFTX_MR_VALID2;
+
+	if (dev->gclk_enabled) {
+		clk_disable_unprepare(dev->gclk);
+		dev->gclk_enabled = 0;
+	}
+	ret = clk_set_rate(dev->gclk, params_rate(params) *
+				      SPDIFTX_GCLK_RATIO);
+	if (ret) {
+		dev_err(dev->dev,
+			"unable to change gclk rate to: rate %u * ratio %u\n",
+			params_rate(params), SPDIFTX_GCLK_RATIO);
+		return ret;
+	}
+	ret = clk_prepare_enable(dev->gclk);
+	if (ret) {
+		dev_err(dev->dev, "unable to enable gclk: %d\n", ret);
+		return ret;
+	}
+	dev->gclk_enabled = 1;
+	dev_dbg(dev->dev, "%s(): GCLK set to %d\n", __func__,
+		params_rate(params) * SPDIFTX_GCLK_RATIO);
+
+	/* Enable interrupts */
+	regmap_write(dev->regmap, SPDIFTX_IER,
+		     SPDIFTX_IR_TXUDR | SPDIFTX_IR_TXOVR);
+
+	regmap_write(dev->regmap, SPDIFTX_MR, mr);
+
+	return 0;
+}
+
+static int mchp_spdiftx_hw_free(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct mchp_spdiftx_dev *dev = snd_soc_dai_get_drvdata(dai);
+
+	regmap_write(dev->regmap, SPDIFTX_IDR,
+		     SPDIFTX_IR_TXUDR | SPDIFTX_IR_TXOVR);
+	if (dev->gclk_enabled) {
+		clk_disable_unprepare(dev->gclk);
+		dev->gclk_enabled = 0;
+	}
+
+	return regmap_write(dev->regmap, SPDIFTX_CR,
+			    SPDIFTX_CR_SWRST | SPDIFTX_CR_FCLR);
+}
+
+
+static const struct snd_soc_dai_ops mchp_spdiftx_dai_ops = {
+	.startup	= mchp_spdiftx_dai_startup,
+	.shutdown	= mchp_spdiftx_dai_shutdown,
+	.trigger	= mchp_spdiftx_trigger,
+	.hw_params	= mchp_spdiftx_hw_params,
+	.hw_free	= mchp_spdiftx_hw_free,
+};
+
+#define MCHP_SPDIFTX_RATES	SNDRV_PCM_RATE_8000_192000
+
+#define MCHP_SPDIFTX_FORMATS	(SNDRV_PCM_FMTBIT_S8 |		\
+				 SNDRV_PCM_FMTBIT_S16_LE |	\
+				 SNDRV_PCM_FMTBIT_U16_BE |	\
+				 SNDRV_PCM_FMTBIT_S18_3LE |	\
+				 SNDRV_PCM_FMTBIT_S18_3BE |	\
+				 SNDRV_PCM_FMTBIT_S20_3LE |	\
+				 SNDRV_PCM_FMTBIT_S20_3BE |	\
+				 SNDRV_PCM_FMTBIT_S24_3LE |	\
+				 SNDRV_PCM_FMTBIT_S24_3BE |	\
+				 SNDRV_PCM_FMTBIT_S24_LE |	\
+				 SNDRV_PCM_FMTBIT_S24_BE |	\
+				 SNDRV_PCM_FMTBIT_S32_LE |	\
+				 SNDRV_PCM_FMTBIT_S32_BE	\
+				 )
+
+static int mchp_spdiftx_info(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_IEC958;
+	uinfo->count = 1;
+
+	return 0;
+}
+
+static int mchp_spdiftx_cs_get(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *uvalue)
+{
+	unsigned long flags;
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct mchp_spdiftx_dev *dev = snd_soc_dai_get_drvdata(dai);
+	struct mchp_spdiftx_mixer_control *ctrl = &dev->control;
+
+	spin_lock_irqsave(&ctrl->lock, flags);
+	memcpy(uvalue->value.iec958.status, ctrl->ch_stat,
+	       sizeof(ctrl->ch_stat));
+	spin_unlock_irqrestore(&ctrl->lock, flags);
+
+	return 0;
+}
+
+static int mchp_spdiftx_cs_put(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *uvalue)
+{
+	unsigned long flags;
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct mchp_spdiftx_dev *dev = snd_soc_dai_get_drvdata(dai);
+	struct mchp_spdiftx_mixer_control *ctrl = &dev->control;
+	int changed = 0;
+	int i;
+
+	spin_lock_irqsave(&ctrl->lock, flags);
+	for (i = 0; i < ARRAY_SIZE(ctrl->ch_stat); i++) {
+		if (ctrl->ch_stat[i] != uvalue->value.iec958.status[i])
+			changed = 1;
+		ctrl->ch_stat[i] = uvalue->value.iec958.status[i];
+	}
+
+	if (changed) {
+		/* don't enable IP while we copy the channel status */
+		if (mchp_spdiftx_is_running(dev)) {
+			/*
+			 * if SPDIF is running, wait for interrupt to write
+			 * channel status
+			 */
+			regmap_write(dev->regmap, SPDIFTX_IER,
+				     SPDIFTX_IR_CSRDY);
+		} else {
+			mchp_spdiftx_channel_status_write(dev);
+		}
+	}
+	spin_unlock_irqrestore(&ctrl->lock, flags);
+
+	return changed;
+}
+
+static int mchp_spdiftx_cs_mask(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *uvalue)
+{
+	memset(uvalue->value.iec958.status, 0xff,
+	       sizeof(uvalue->value.iec958.status));
+
+	return 0;
+}
+
+static int mchp_spdiftx_subcode_get(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *uvalue)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct mchp_spdiftx_dev *dev = snd_soc_dai_get_drvdata(dai);
+	struct mchp_spdiftx_mixer_control *ctrl = &dev->control;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ctrl->lock, flags);
+	memcpy(uvalue->value.iec958.subcode, ctrl->user_data,
+	       sizeof(ctrl->user_data));
+	spin_unlock_irqrestore(&ctrl->lock, flags);
+
+	return 0;
+}
+
+static int mchp_spdiftx_subcode_put(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *uvalue)
+{
+	unsigned long flags;
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct mchp_spdiftx_dev *dev = snd_soc_dai_get_drvdata(dai);
+	struct mchp_spdiftx_mixer_control *ctrl = &dev->control;
+	int changed = 0;
+	int i;
+
+	spin_lock_irqsave(&ctrl->lock, flags);
+	for (i = 0; i < ARRAY_SIZE(ctrl->user_data); i++) {
+		if (ctrl->user_data[i] != uvalue->value.iec958.subcode[i])
+			changed = 1;
+
+		ctrl->user_data[i] = uvalue->value.iec958.subcode[i];
+	}
+	if (changed) {
+		if (mchp_spdiftx_is_running(dev)) {
+			/*
+			 * if SPDIF is running, wait for interrupt to write
+			 * user data
+			 */
+			regmap_write(dev->regmap, SPDIFTX_IER,
+				     SPDIFTX_IR_UDRDY);
+		} else {
+			mchp_spdiftx_user_data_write(dev);
+		}
+	}
+	spin_unlock_irqrestore(&ctrl->lock, flags);
+
+	return changed;
+}
+
+static struct snd_kcontrol_new mchp_spdiftx_ctrls[] = {
+	/* Channel status controller */
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = SNDRV_CTL_NAME_IEC958("", PLAYBACK, DEFAULT),
+		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE |
+			SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		.info = mchp_spdiftx_info,
+		.get = mchp_spdiftx_cs_get,
+		.put = mchp_spdiftx_cs_put,
+	},
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = SNDRV_CTL_NAME_IEC958("", PLAYBACK, MASK),
+		.access = SNDRV_CTL_ELEM_ACCESS_READ,
+			SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		.info = mchp_spdiftx_info,
+		.get = mchp_spdiftx_cs_mask,
+	},
+	/* User bits controller */
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = "IEC958 Subcode Playback Default",
+		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+		.info = mchp_spdiftx_info,
+		.get = mchp_spdiftx_subcode_get,
+		.put = mchp_spdiftx_subcode_put,
+	},
+};
+
+static int mchp_spdiftx_dai_probe(struct snd_soc_dai *dai)
+{
+	struct mchp_spdiftx_dev *dev = snd_soc_dai_get_drvdata(dai);
+
+	snd_soc_dai_init_dma_data(dai, &dev->playback, NULL);
+
+	/* Add controls */
+	snd_soc_add_dai_controls(dai, mchp_spdiftx_ctrls,
+				 ARRAY_SIZE(mchp_spdiftx_ctrls));
+
+	return 0;
+}
+
+static struct snd_soc_dai_driver mchp_spdiftx_dai = {
+	.name = "mchp-spdiftx",
+	.probe	= mchp_spdiftx_dai_probe,
+	.playback = {
+		.stream_name = "S/PDIF TX Playback",
+		.channels_min = 1,
+		.channels_max = 2,
+		.rates = MCHP_SPDIFTX_RATES,
+		.formats = MCHP_SPDIFTX_FORMATS,
+	},
+	.ops = &mchp_spdiftx_dai_ops,
+};
+
+static const struct snd_soc_component_driver mchp_spdiftx_component = {
+	.name		= "mchp-spdiftx",
+};
+
+static const struct of_device_id mchp_spdiftx_dt_ids[] = {
+	{
+		.compatible = "microchip,sama7g5-spdiftx",
+	},
+	{ /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(of, mchp_spdiftx_dt_ids);
+static int mchp_spdiftx_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	const struct of_device_id *match;
+	struct mchp_spdiftx_dev *dev;
+	struct resource *mem;
+	struct regmap *regmap;
+	void __iomem *base;
+	struct mchp_spdiftx_mixer_control *ctrl;
+	int irq;
+	int err;
+
+	/* Get memory for driver data. */
+	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	/* Get hardware capabilities. */
+	match = of_match_node(mchp_spdiftx_dt_ids, np);
+	if (match)
+		dev->caps = match->data;
+
+	/* Map I/O registers. */
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &mem);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	regmap = devm_regmap_init_mmio(&pdev->dev, base,
+				       &mchp_spdiftx_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	/* Request IRQ */
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	err = devm_request_irq(&pdev->dev, irq, mchp_spdiftx_interrupt, 0,
+			       dev_name(&pdev->dev), dev);
+	if (err)
+		return err;
+
+	/* Get the peripheral clock */
+	dev->pclk = devm_clk_get(&pdev->dev, "pclk");
+	if (IS_ERR(dev->pclk)) {
+		err = PTR_ERR(dev->pclk);
+		dev_err(&pdev->dev,
+			"failed to get the peripheral clock: %d\n", err);
+		return err;
+	}
+
+	/* Get the generic clock */
+	dev->gclk = devm_clk_get(&pdev->dev, "gclk");
+	if (IS_ERR(dev->gclk)) {
+		err = PTR_ERR(dev->gclk);
+		dev_err(&pdev->dev,
+			"failed to get the PMC generic clock: %d\n", err);
+		return err;
+	}
+
+	ctrl = &dev->control;
+	spin_lock_init(&ctrl->lock);
+
+	/* Init channel status */
+	ctrl->ch_stat[0] = IEC958_AES0_CON_NOT_COPYRIGHT |
+			   IEC958_AES0_CON_EMPHASIS_NONE;
+
+	dev->dev = &pdev->dev;
+	dev->regmap = regmap;
+	platform_set_drvdata(pdev, dev);
+
+	dev->playback.addr = (dma_addr_t)mem->start + SPDIFTX_CDR;
+	dev->playback.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+
+	err = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
+	if (err) {
+		dev_err(&pdev->dev, "failed to register PMC: %d\n", err);
+		return err;
+	}
+
+	err = devm_snd_soc_register_component(&pdev->dev,
+					      &mchp_spdiftx_component,
+					      &mchp_spdiftx_dai, 1);
+	if (err) {
+		dev_err(&pdev->dev, "failed to register component: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static struct platform_driver mchp_spdiftx_driver = {
+	.probe	= mchp_spdiftx_probe,
+	.driver	= {
+		.name	= "mchp_spdiftx",
+		.of_match_table = of_match_ptr(mchp_spdiftx_dt_ids),
+	},
+};
+
+module_platform_driver(mchp_spdiftx_driver);
+
+MODULE_AUTHOR("Codrin Ciubotariu <codrin.ciubotariu@microchip.com>");
+MODULE_DESCRIPTION("Microchip S/PDIF TX Controller Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

