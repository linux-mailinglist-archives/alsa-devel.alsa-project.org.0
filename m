Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE24328176C
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 18:06:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5188D1F3A;
	Fri,  2 Oct 2020 18:05:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5188D1F3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601654764;
	bh=6uIPxE6DZ37X2OrqlewExvsDzZkresLHZ+X+TzLKgBE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VqU1U9oJOlbBk2jEy29Dsp9NstcCu66GfN0KZcgACnZtSqrmJfQUW3RYsFGmXfaBO
	 P31jHpVKq90XBybSNzjWFNOBKi+sCMZzjP4AemQvvqbH76ARYnQAwUrf71+VdYwkVp
	 B4jjPWkT5lF09H6vW3U11og6gL4eSGt5VK3XebFU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A52C3F800AB;
	Fri,  2 Oct 2020 18:03:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AE60F802D2; Fri,  2 Oct 2020 18:03:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa2.microchip.iphmx.com (esa2.microchip.iphmx.com
 [68.232.149.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44FE8F800AB
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 18:03:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44FE8F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="aLhxwOzh"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601654618; x=1633190618;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6uIPxE6DZ37X2OrqlewExvsDzZkresLHZ+X+TzLKgBE=;
 b=aLhxwOzhPCRydwjim+NVb5roCDw107Ww/LCsy7tj0alii9KNRggrGaCh
 0Y0d4JmpRMXbWzZJNqv9CGhE/Bb1Z4/TMXe7OyjY3xXv6XnWLVejR1yPM
 s9H1RWkkVo9p3z/x88Pj+p3TYMsRg3Z1QrJMPfVXLybLP7/olXA9oSx7g
 sji2Of4vii52GcRCHrFIQVQdG6t/dFiZbqnuXJwuurOPP6dHCLoKlEhbU
 05m6/w9ZoJdfEe3jjecLm17cddf+AoC8jtf3ecASawTHAl4Y8BRDg9nfx
 1fluit4zOMJrONzD75SEyDXwBeKVyl9DUxJIsGptzUGU0fV4mHlNDb8BI Q==;
IronPort-SDR: uCB0PA9GzB7hR0Ac4gee3pvbiPlidmJ14m8bwWsSvEicHC5EQtMQPDwDpDeQRnXnerkx583ncd
 AXqaRtvgWl0Zu/BZ8D0wVtt9U+mO3pQ4bO6qfg1OiuDdVwk4pzGjNI9IDGHXn2XZ04wkaTZSXe
 ACbxxJZps+MRfHv/m0qKqceJOdu0w4BKMw2b7YGFB2ZZvE9kk6zCK6YfLeFzx9ksdA/pWl8B90
 BbLpvHVANSW4O43dM2yKjySIDJbtF41brVZUustcdD2mZ51jOPkAry+R86whOJGECraXYniSz/
 e0g=
X-IronPort-AV: E=Sophos;i="5.77,328,1596524400"; d="scan'208";a="91238341"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Oct 2020 09:03:30 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 2 Oct 2020 09:02:55 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 2 Oct 2020 09:02:45 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 2/2] ASoC: mchp-spdifrx: add driver for SPDIF RX
Date: Fri, 2 Oct 2020 19:03:05 +0300
Message-ID: <20201002160305.815523-3-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201002160305.815523-1-codrin.ciubotariu@microchip.com>
References: <20201002160305.815523-1-codrin.ciubotariu@microchip.com>
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

The new SPDIF RX controller is a serial port compliant with the IEC-60958
standard. It also supports programmable User Data and Channel Status
fields.

This IP is embedded in Microchip's sama7g5 SoC.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 sound/soc/atmel/Kconfig        |  13 +
 sound/soc/atmel/Makefile       |   2 +
 sound/soc/atmel/mchp-spdifrx.c | 954 +++++++++++++++++++++++++++++++++
 3 files changed, 969 insertions(+)
 create mode 100644 sound/soc/atmel/mchp-spdifrx.c

diff --git a/sound/soc/atmel/Kconfig b/sound/soc/atmel/Kconfig
index 93beb7d670a3..bd8854bfd2ee 100644
--- a/sound/soc/atmel/Kconfig
+++ b/sound/soc/atmel/Kconfig
@@ -144,4 +144,17 @@ config SND_MCHP_SOC_SPDIFTX
 
 	  This S/PDIF TX driver is compliant with IEC-60958 standard and
 	  includes programable User Data and Channel Status fields.
+
+config SND_MCHP_SOC_SPDIFRX
+	tristate "Microchip ASoC driver for boards using S/PDIF RX"
+	depends on OF && (ARCH_AT91 || COMPILE_TEST)
+	select SND_SOC_GENERIC_DMAENGINE_PCM
+	select REGMAP_MMIO
+	help
+	  Say Y or M if you want to add support for Microchip S/PDIF RX ASoc
+	  driver on the following Microchip platforms:
+	  - sama7g5
+
+	  This S/PDIF RX driver is compliant with IEC-60958 standard and
+	  includes programable User Data and Channel Status fields.
 endif
diff --git a/sound/soc/atmel/Makefile b/sound/soc/atmel/Makefile
index 3fd89a0063df..016188397210 100644
--- a/sound/soc/atmel/Makefile
+++ b/sound/soc/atmel/Makefile
@@ -6,6 +6,7 @@ snd-soc-atmel_ssc_dai-objs := atmel_ssc_dai.o
 snd-soc-atmel-i2s-objs := atmel-i2s.o
 snd-soc-mchp-i2s-mcc-objs := mchp-i2s-mcc.o
 snd-soc-mchp-spdiftx-objs := mchp-spdiftx.o
+snd-soc-mchp-spdifrx-objs := mchp-spdifrx.o
 
 # pdc and dma need to both be built-in if any user of
 # ssc is built-in.
@@ -19,6 +20,7 @@ obj-$(CONFIG_SND_ATMEL_SOC_SSC) += snd-soc-atmel_ssc_dai.o
 obj-$(CONFIG_SND_ATMEL_SOC_I2S) += snd-soc-atmel-i2s.o
 obj-$(CONFIG_SND_MCHP_SOC_I2S_MCC) += snd-soc-mchp-i2s-mcc.o
 obj-$(CONFIG_SND_MCHP_SOC_SPDIFTX) += snd-soc-mchp-spdiftx.o
+obj-$(CONFIG_SND_MCHP_SOC_SPDIFRX) += snd-soc-mchp-spdifrx.o
 
 # AT91 Machine Support
 snd-soc-sam9g20-wm8731-objs := sam9g20_wm8731.o
diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
new file mode 100644
index 000000000000..6776d89d56df
--- /dev/null
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -0,0 +1,954 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Driver for Microchip S/PDIF RX Controller
+//
+// Copyright (C) 2020 Microchip Technology Inc. and its subsidiaries
+//
+// Author: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
+
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/spinlock.h>
+
+#include <sound/dmaengine_pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+
+/*
+ * ---- S/PDIF Receiver Controller Register map ----
+ */
+#define SPDIFRX_CR			0x00	/* Control Register */
+#define SPDIFRX_MR			0x04	/* Mode Register */
+
+#define SPDIFRX_IER			0x10	/* Interrupt Enable Register */
+#define SPDIFRX_IDR			0x14	/* Interrupt Disable Register */
+#define SPDIFRX_IMR			0x18	/* Interrupt Mask Register */
+#define SPDIFRX_ISR			0x1c	/* Interrupt Status Register */
+#define SPDIFRX_RSR			0x20	/* Status Register */
+#define SPDIFRX_RHR			0x24	/* Holding Register */
+
+#define SPDIFRX_CHSR(channel, reg)	\
+	(0x30 + (channel) * 0x30 + (reg) * 4)	/* Channel x Status Registers */
+
+#define SPDIFRX_CHUD(channel, reg)	\
+	(0x48 + (channel) * 0x30 + (reg) * 4)	/* Channel x User Data Registers */
+
+#define SPDIFRX_WPMR			0xE4	/* Write Protection Mode Register */
+#define SPDIFRX_WPSR			0xE8	/* Write Protection Status Register */
+
+#define SPDIFRX_VERSION			0xFC	/* Version Register */
+
+/*
+ * ---- Control Register (Write-only) ----
+ */
+#define SPDIFRX_CR_SWRST		BIT(0)	/* Software Reset */
+
+/*
+ * ---- Mode Register (Read/Write) ----
+ */
+/* Receive Enable */
+#define SPDIFRX_MR_RXEN_MASK		GENMASK(0, 0)
+#define SPDIFRX_MR_RXEN_DISABLE		(0 << 0)	/* SPDIF Receiver Disabled */
+#define SPDIFRX_MR_RXEN_ENABLE		(1 << 0)	/* SPDIF Receiver Enabled */
+
+/* Validity Bit Mode */
+#define SPDIFRX_MR_VBMODE_MASK		GENAMSK(1, 1)
+#define SPDIFRX_MR_VBMODE_ALWAYS_LOAD \
+	(0 << 1)	/* Load sample regardles of validity bit value */
+#define SPDIFRX_MR_VBMODE_DISCARD_IF_VB1 \
+	(1 << 1)	/* Load sample only if validity bit is 0 */
+
+/* Data Word Endian Mode */
+#define SPDIFRX_MR_ENDIAN_MASK		GENMASK(2, 2)
+#define SPDIFRX_MR_ENDIAN_LITTLE	(0 << 2)	/* Little Endian Mode */
+#define SPDIFRX_MR_ENDIAN_BIG		(1 << 2)	/* Big Endian Mode */
+
+/* Parity Bit Mode */
+#define SPDIFRX_MR_PBMODE_MASK		GENMASK(3, 3)
+#define SPDIFRX_MR_PBMODE_PARCHECK	(0 << 3)	/* Parity Check Enabled */
+#define SPDIFRX_MR_PBMODE_NOPARCHECK	(1 << 3)	/* Parity Check Disabled */
+
+/* Sample Data Width */
+#define SPDIFRX_MR_DATAWIDTH_MASK	GENMASK(5, 4)
+#define SPDIFRX_MR_DATAWIDTH(width) \
+	(((6 - (width) / 4) << 4) & SPDIFRX_MR_DATAWIDTH_MASK)
+
+/* Packed Data Mode in Receive Holding Register */
+#define SPDIFRX_MR_PACK_MASK		GENMASK(7, 7)
+#define SPDIFRX_MR_PACK_DISABLED	(0 << 7)
+#define SPDIFRX_MR_PACK_ENABLED		(1 << 7)
+
+/* Start of Block Bit Mode */
+#define SPDIFRX_MR_SBMODE_MASK		GENMASK(8, 8)
+#define SPDIFRX_MR_SBMODE_ALWAYS_LOAD	(0 << 8)
+#define SPDIFRX_MR_SBMODE_DISCARD	(1 << 8)
+
+/* Consecutive Preamble Error Threshold Automatic Restart */
+#define SPDIFRX_MR_AUTORST_MASK			GENMASK(24, 24)
+#define SPDIFRX_MR_AUTORST_NOACTION		(0 << 24)
+#define SPDIFRX_MR_AUTORST_UNLOCK_ON_PRE_ERR	(1 << 24)
+
+/*
+ * ---- Interrupt Enable/Disable/Mask/Status Register (Write/Read-only) ----
+ */
+#define SPDIFRX_IR_RXRDY			BIT(0)
+#define SPDIFRX_IR_LOCKED			BIT(1)
+#define SPDIFRX_IR_LOSS				BIT(2)
+#define SPDIFRX_IR_BLOCKEND			BIT(3)
+#define SPDIFRX_IR_SFE				BIT(4)
+#define SPDIFRX_IR_PAR_ERR			BIT(5)
+#define SPDIFRX_IR_OVERRUN			BIT(6)
+#define SPDIFRX_IR_RXFULL			BIT(7)
+#define SPDIFRX_IR_CSC(ch)			BIT((ch) + 8)
+#define SPDIFRX_IR_SECE				BIT(10)
+#define SPDIFRX_IR_BLOCKST			BIT(11)
+#define SPDIFRX_IR_NRZ_ERR			BIT(12)
+#define SPDIFRX_IR_PRE_ERR			BIT(13)
+#define SPDIFRX_IR_CP_ERR			BIT(14)
+
+/*
+ * ---- Receiver Status Register (Read/Write) ----
+ */
+/* Enable Status */
+#define SPDIFRX_RSR_ULOCK			BIT(0)
+#define SPDIFRX_RSR_BADF			BIT(1)
+#define SPDIFRX_RSR_LOWF			BIT(2)
+#define SPDIFRX_RSR_NOSIGNAL			BIT(3)
+#define SPDIFRX_RSR_IFS_MASK			GENMASK(27, 16)
+#define SPDIFRX_RSR_IFS(reg)			\
+	(((reg) & SPDIFRX_RSR_IFS_MASK) >> 16)
+
+/*
+ *  ---- Version Register (Read-only) ----
+ */
+#define SPDIFRX_VERSION_MASK		GENMASK(11, 0)
+#define SPDIFRX_VERSION_MFN_MASK	GENMASK(18, 16)
+#define SPDIFRX_VERSION_MFN(reg)	(((reg) & SPDIFRX_VERSION_MFN_MASK) >> 16)
+
+static bool mchp_spdifrx_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SPDIFRX_MR:
+	case SPDIFRX_IMR:
+	case SPDIFRX_ISR:
+	case SPDIFRX_RSR:
+	case SPDIFRX_CHSR(0, 0):
+	case SPDIFRX_CHSR(0, 1):
+	case SPDIFRX_CHSR(0, 2):
+	case SPDIFRX_CHSR(0, 3):
+	case SPDIFRX_CHSR(0, 4):
+	case SPDIFRX_CHSR(0, 5):
+	case SPDIFRX_CHUD(0, 0):
+	case SPDIFRX_CHUD(0, 1):
+	case SPDIFRX_CHUD(0, 2):
+	case SPDIFRX_CHUD(0, 3):
+	case SPDIFRX_CHUD(0, 4):
+	case SPDIFRX_CHUD(0, 5):
+	case SPDIFRX_CHSR(1, 0):
+	case SPDIFRX_CHSR(1, 1):
+	case SPDIFRX_CHSR(1, 2):
+	case SPDIFRX_CHSR(1, 3):
+	case SPDIFRX_CHSR(1, 4):
+	case SPDIFRX_CHSR(1, 5):
+	case SPDIFRX_CHUD(1, 0):
+	case SPDIFRX_CHUD(1, 1):
+	case SPDIFRX_CHUD(1, 2):
+	case SPDIFRX_CHUD(1, 3):
+	case SPDIFRX_CHUD(1, 4):
+	case SPDIFRX_CHUD(1, 5):
+	case SPDIFRX_WPMR:
+	case SPDIFRX_WPSR:
+	case SPDIFRX_VERSION:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool mchp_spdifrx_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SPDIFRX_CR:
+	case SPDIFRX_MR:
+	case SPDIFRX_IER:
+	case SPDIFRX_IDR:
+	case SPDIFRX_WPMR:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool mchp_spdifrx_precious_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SPDIFRX_ISR:
+	case SPDIFRX_RHR:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config mchp_spdifrx_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = SPDIFRX_VERSION,
+	.readable_reg = mchp_spdifrx_readable_reg,
+	.writeable_reg = mchp_spdifrx_writeable_reg,
+	.precious_reg = mchp_spdifrx_precious_reg,
+};
+
+#define SPDIFRX_GCLK_RATIO_MIN	(12 * 64)
+
+#define SPDIFRX_CS_BITS		192
+#define SPDIFRX_UD_BITS		192
+
+#define SPDIFRX_CHANNELS	2
+
+struct mchp_spdifrx_ch_stat {
+	unsigned char data[SPDIFRX_CS_BITS / 8];
+	struct completion done;
+};
+
+struct mchp_spdifrx_user_data {
+	unsigned char data[SPDIFRX_UD_BITS / 8];
+	struct completion done;
+	spinlock_t lock;	/* protect access to user data */
+};
+
+struct mchp_spdifrx_mixer_control {
+		struct mchp_spdifrx_ch_stat ch_stat[SPDIFRX_CHANNELS];
+		struct mchp_spdifrx_user_data user_data[SPDIFRX_CHANNELS];
+		bool ulock;
+		bool badf;
+		bool signal;
+};
+
+struct mchp_spdifrx_dev {
+	struct snd_dmaengine_dai_dma_data	capture;
+	struct mchp_spdifrx_mixer_control	control;
+	spinlock_t				blockend_lock;	/* protect access to blockend_refcount */
+	int					blockend_refcount;
+	struct device				*dev;
+	struct regmap				*regmap;
+	struct clk				*pclk;
+	struct clk				*gclk;
+	unsigned int				fmt;
+	unsigned int				gclk_enabled:1;
+};
+
+static void mchp_spdifrx_channel_status_read(struct mchp_spdifrx_dev *dev,
+					     int channel)
+{
+	struct mchp_spdifrx_mixer_control *ctrl = &dev->control;
+	u8 *ch_stat = &ctrl->ch_stat[channel].data[0];
+	u32 val;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ctrl->ch_stat[channel].data) / 4; i++) {
+		regmap_read(dev->regmap, SPDIFRX_CHSR(channel, i), &val);
+		*ch_stat++ = val & 0xFF;
+		*ch_stat++ = (val >> 8) & 0xFF;
+		*ch_stat++ = (val >> 16) & 0xFF;
+		*ch_stat++ = (val >> 24) & 0xFF;
+	}
+}
+
+static void mchp_spdifrx_channel_user_data_read(struct mchp_spdifrx_dev *dev,
+						int channel)
+{
+	struct mchp_spdifrx_mixer_control *ctrl = &dev->control;
+	u8 *user_data = &ctrl->user_data[channel].data[0];
+	u32 val;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ctrl->user_data[channel].data) / 4; i++) {
+		regmap_read(dev->regmap, SPDIFRX_CHUD(channel, i), &val);
+		*user_data++ = val & 0xFF;
+		*user_data++ = (val >> 8) & 0xFF;
+		*user_data++ = (val >> 16) & 0xFF;
+		*user_data++ = (val >> 24) & 0xFF;
+	}
+}
+
+/* called from non-atomic context only */
+static void mchp_spdifrx_isr_blockend_en(struct mchp_spdifrx_dev *dev)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&dev->blockend_lock, flags);
+	dev->blockend_refcount++;
+	/* don't enable BLOCKEND interrupt if it's already enabled */
+	if (dev->blockend_refcount == 1)
+		regmap_write(dev->regmap, SPDIFRX_IER, SPDIFRX_IR_BLOCKEND);
+	spin_unlock_irqrestore(&dev->blockend_lock, flags);
+}
+
+/* called from atomic context only */
+static void mchp_spdifrx_isr_blockend_dis(struct mchp_spdifrx_dev *dev)
+{
+	spin_lock(&dev->blockend_lock);
+	dev->blockend_refcount--;
+	/* don't enable BLOCKEND interrupt if it's already enabled */
+	if (dev->blockend_refcount == 0)
+		regmap_write(dev->regmap, SPDIFRX_IDR, SPDIFRX_IR_BLOCKEND);
+	spin_unlock(&dev->blockend_lock);
+}
+
+static irqreturn_t mchp_spdif_interrupt(int irq, void *dev_id)
+{
+	struct mchp_spdifrx_dev *dev = dev_id;
+	struct mchp_spdifrx_mixer_control *ctrl = &dev->control;
+	u32 sr, imr, pending, idr = 0;
+	irqreturn_t ret = IRQ_NONE;
+	int ch;
+
+	regmap_read(dev->regmap, SPDIFRX_ISR, &sr);
+	regmap_read(dev->regmap, SPDIFRX_IMR, &imr);
+	pending = sr & imr;
+	dev_dbg(dev->dev, "ISR: %#x, IMR: %#x, pending: %#x\n", sr, imr,
+		pending);
+
+	if (!pending)
+		return IRQ_NONE;
+
+	if (pending & SPDIFRX_IR_BLOCKEND) {
+		for (ch = 0; ch < SPDIFRX_CHANNELS; ch++) {
+			spin_lock(&ctrl->user_data[ch].lock);
+			mchp_spdifrx_channel_user_data_read(dev, ch);
+			spin_unlock(&ctrl->user_data[ch].lock);
+
+			complete(&ctrl->user_data[ch].done);
+		}
+		mchp_spdifrx_isr_blockend_dis(dev);
+		ret = IRQ_HANDLED;
+	}
+
+	for (ch = 0; ch < SPDIFRX_CHANNELS; ch++) {
+		if (pending & SPDIFRX_IR_CSC(ch)) {
+			mchp_spdifrx_channel_status_read(dev, ch);
+			complete(&ctrl->ch_stat[ch].done);
+			idr |= SPDIFRX_IR_CSC(ch);
+			ret = IRQ_HANDLED;
+		}
+	}
+
+	if (pending & SPDIFRX_IR_OVERRUN) {
+		dev_warn(dev->dev, "Overrrun detected\n");
+		ret = IRQ_HANDLED;
+	}
+
+	regmap_write(dev->regmap, SPDIFRX_IDR, idr);
+
+	return ret;
+}
+
+static int mchp_spdifrx_trigger(struct snd_pcm_substream *substream, int cmd,
+				struct snd_soc_dai *dai)
+{
+	struct mchp_spdifrx_dev *dev = snd_soc_dai_get_drvdata(dai);
+	u32 mr;
+	int running;
+	int ret;
+
+	regmap_read(dev->regmap, SPDIFRX_MR, &mr);
+	running = !!(mr & SPDIFRX_MR_RXEN_ENABLE);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		if (!running) {
+			mr &= ~SPDIFRX_MR_RXEN_MASK;
+			mr |= SPDIFRX_MR_RXEN_ENABLE;
+			/* enable overrun interrupts */
+			regmap_write(dev->regmap, SPDIFRX_IER,
+				     SPDIFRX_IR_OVERRUN);
+		}
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		if (running) {
+			mr &= ~SPDIFRX_MR_RXEN_MASK;
+			mr |= SPDIFRX_MR_RXEN_DISABLE;
+			/* disable overrun interrupts */
+			regmap_write(dev->regmap, SPDIFRX_IDR,
+				     SPDIFRX_IR_OVERRUN);
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = regmap_write(dev->regmap, SPDIFRX_MR, mr);
+	if (ret) {
+		dev_err(dev->dev, "unable to enable/disable RX: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int mchp_spdifrx_hw_params(struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params,
+				  struct snd_soc_dai *dai)
+{
+	struct mchp_spdifrx_dev *dev = snd_soc_dai_get_drvdata(dai);
+	u32 mr;
+	int ret;
+
+	dev_dbg(dev->dev, "%s() rate=%u format=%#x width=%u channels=%u\n",
+		__func__, params_rate(params), params_format(params),
+		params_width(params), params_channels(params));
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		dev_err(dev->dev, "Playback is not supported\n");
+		return -EINVAL;
+	}
+
+	regmap_read(dev->regmap, SPDIFRX_MR, &mr);
+
+	if (mr & SPDIFRX_MR_RXEN_ENABLE) {
+		dev_err(dev->dev, "PCM already running\n");
+		return -EBUSY;
+	}
+
+	if (params_channels(params) != SPDIFRX_CHANNELS) {
+		dev_err(dev->dev, "unsupported number of channels: %d\n",
+			params_channels(params));
+		return -EINVAL;
+	}
+
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S16_BE:
+	case SNDRV_PCM_FORMAT_S20_3BE:
+	case SNDRV_PCM_FORMAT_S24_3BE:
+	case SNDRV_PCM_FORMAT_S24_BE:
+		mr |= SPDIFRX_MR_ENDIAN_BIG;
+		fallthrough;
+	case SNDRV_PCM_FORMAT_S16_LE:
+	case SNDRV_PCM_FORMAT_S20_3LE:
+	case SNDRV_PCM_FORMAT_S24_3LE:
+	case SNDRV_PCM_FORMAT_S24_LE:
+		mr |= SPDIFRX_MR_DATAWIDTH(params_width(params));
+		break;
+	default:
+		dev_err(dev->dev, "unsupported PCM format: %d\n",
+			params_format(params));
+		return -EINVAL;
+	}
+
+	if (dev->gclk_enabled) {
+		clk_disable_unprepare(dev->gclk);
+		dev->gclk_enabled = 0;
+	}
+	ret = clk_set_min_rate(dev->gclk, params_rate(params) *
+					  SPDIFRX_GCLK_RATIO_MIN + 1);
+	if (ret) {
+		dev_err(dev->dev,
+			"unable to set gclk min rate: rate %u * ratio %u + 1\n",
+			params_rate(params), SPDIFRX_GCLK_RATIO_MIN);
+		return ret;
+	}
+	ret = clk_prepare_enable(dev->gclk);
+	if (ret) {
+		dev_err(dev->dev, "unable to enable gclk: %d\n", ret);
+		return ret;
+	}
+	dev->gclk_enabled = 1;
+
+	dev_dbg(dev->dev, "GCLK range min set to %d\n",
+		params_rate(params) * SPDIFRX_GCLK_RATIO_MIN + 1);
+
+	return regmap_write(dev->regmap, SPDIFRX_MR, mr);
+}
+
+static int mchp_spdifrx_hw_free(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct mchp_spdifrx_dev *dev = snd_soc_dai_get_drvdata(dai);
+
+	if (dev->gclk_enabled) {
+		clk_disable_unprepare(dev->gclk);
+		dev->gclk_enabled = 0;
+	}
+	return 0;
+}
+
+static const struct snd_soc_dai_ops mchp_spdifrx_dai_ops = {
+	.trigger	= mchp_spdifrx_trigger,
+	.hw_params	= mchp_spdifrx_hw_params,
+	.hw_free	= mchp_spdifrx_hw_free,
+};
+
+#define MCHP_SPDIF_RATES	SNDRV_PCM_RATE_8000_192000
+
+#define MCHP_SPDIF_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE |	\
+				 SNDRV_PCM_FMTBIT_U16_BE |	\
+				 SNDRV_PCM_FMTBIT_S20_3LE |	\
+				 SNDRV_PCM_FMTBIT_S20_3BE |	\
+				 SNDRV_PCM_FMTBIT_S24_3LE |	\
+				 SNDRV_PCM_FMTBIT_S24_3BE |	\
+				 SNDRV_PCM_FMTBIT_S24_LE |	\
+				 SNDRV_PCM_FMTBIT_S24_BE	\
+				)
+
+static int mchp_spdifrx_info(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_IEC958;
+	uinfo->count = 1;
+
+	return 0;
+}
+
+static int mchp_spdifrx_cs_get(struct mchp_spdifrx_dev *dev,
+			       int channel,
+			       struct snd_ctl_elem_value *uvalue)
+{
+	struct mchp_spdifrx_mixer_control *ctrl = &dev->control;
+	struct mchp_spdifrx_ch_stat *ch_stat = &ctrl->ch_stat[channel];
+	int ret;
+
+	regmap_write(dev->regmap, SPDIFRX_IER, SPDIFRX_IR_CSC(channel));
+	/* check for new data available */
+	ret = wait_for_completion_interruptible_timeout(&ch_stat->done,
+							msecs_to_jiffies(100));
+	/* IP might not be started or valid stream might not be prezent */
+	if (ret < 0) {
+		dev_dbg(dev->dev, "channel status for channel %d timeout\n",
+			channel);
+	}
+
+	memcpy(uvalue->value.iec958.status, ch_stat->data,
+	       sizeof(ch_stat->data));
+
+	return 0;
+}
+
+static int mchp_spdifrx_cs1_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *uvalue)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct mchp_spdifrx_dev *dev = snd_soc_dai_get_drvdata(dai);
+
+	return mchp_spdifrx_cs_get(dev, 0, uvalue);
+}
+
+static int mchp_spdifrx_cs2_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *uvalue)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct mchp_spdifrx_dev *dev = snd_soc_dai_get_drvdata(dai);
+
+	return mchp_spdifrx_cs_get(dev, 1, uvalue);
+}
+
+static int mchp_spdifrx_cs_mask(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *uvalue)
+{
+	memset(uvalue->value.iec958.status, 0xff,
+	       sizeof(uvalue->value.iec958.status));
+
+	return 0;
+}
+
+static int mchp_spdifrx_subcode_ch_get(struct mchp_spdifrx_dev *dev,
+				       int channel,
+				       struct snd_ctl_elem_value *uvalue)
+{
+	unsigned long flags;
+	struct mchp_spdifrx_mixer_control *ctrl = &dev->control;
+	struct mchp_spdifrx_user_data *user_data = &ctrl->user_data[channel];
+	int ret;
+
+	reinit_completion(&user_data->done);
+	mchp_spdifrx_isr_blockend_en(dev);
+	ret = wait_for_completion_interruptible_timeout(&user_data->done,
+							msecs_to_jiffies(100));
+	/* IP might not be started or valid stream might not be prezent */
+	if (ret <= 0) {
+		dev_dbg(dev->dev, "user data for channel %d timeout\n",
+			channel);
+		return ret;
+	}
+
+	spin_lock_irqsave(&user_data->lock, flags);
+	memcpy(uvalue->value.iec958.subcode, user_data->data,
+	       sizeof(user_data->data));
+	spin_unlock_irqrestore(&user_data->lock, flags);
+
+	return 0;
+}
+
+static int mchp_spdifrx_subcode_ch1_get(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *uvalue)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct mchp_spdifrx_dev *dev = snd_soc_dai_get_drvdata(dai);
+
+	return mchp_spdifrx_subcode_ch_get(dev, 0, uvalue);
+}
+
+static int mchp_spdifrx_subcode_ch2_get(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *uvalue)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct mchp_spdifrx_dev *dev = snd_soc_dai_get_drvdata(dai);
+
+	return mchp_spdifrx_subcode_ch_get(dev, 1, uvalue);
+}
+
+static int mchp_spdifrx_boolean_info(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = 1;
+
+	return 0;
+}
+
+static int mchp_spdifrx_ulock_get(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *uvalue)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct mchp_spdifrx_dev *dev = snd_soc_dai_get_drvdata(dai);
+	struct mchp_spdifrx_mixer_control *ctrl = &dev->control;
+	u32 val;
+	bool ulock_old = ctrl->ulock;
+
+	regmap_read(dev->regmap, SPDIFRX_RSR, &val);
+	ctrl->ulock = !(val & SPDIFRX_RSR_ULOCK);
+	uvalue->value.integer.value[0] = ctrl->ulock;
+
+	return ulock_old != ctrl->ulock;
+}
+
+static int mchp_spdifrx_badf_get(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *uvalue)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct mchp_spdifrx_dev *dev = snd_soc_dai_get_drvdata(dai);
+	struct mchp_spdifrx_mixer_control *ctrl = &dev->control;
+	u32 val;
+	bool badf_old = ctrl->badf;
+
+	regmap_read(dev->regmap, SPDIFRX_RSR, &val);
+	ctrl->badf = !!(val & SPDIFRX_RSR_BADF);
+	uvalue->value.integer.value[0] = ctrl->badf;
+
+	return badf_old != ctrl->badf;
+}
+
+static int mchp_spdifrx_signal_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *uvalue)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct mchp_spdifrx_dev *dev = snd_soc_dai_get_drvdata(dai);
+	struct mchp_spdifrx_mixer_control *ctrl = &dev->control;
+	u32 val;
+	bool signal_old = ctrl->signal;
+
+	regmap_read(dev->regmap, SPDIFRX_RSR, &val);
+	ctrl->signal = !(val & SPDIFRX_RSR_NOSIGNAL);
+	uvalue->value.integer.value[0] = ctrl->signal;
+
+	return signal_old != ctrl->signal;
+}
+
+static int mchp_spdifrx_rate_info(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = 192000;
+
+	return 0;
+}
+
+static int mchp_spdifrx_rate_get(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct mchp_spdifrx_dev *dev = snd_soc_dai_get_drvdata(dai);
+	u32 val;
+	int rate;
+
+	regmap_read(dev->regmap, SPDIFRX_RSR, &val);
+
+	/* if the receiver is not locked, ISF data is invalid */
+	if (val & SPDIFRX_RSR_ULOCK || !(val & SPDIFRX_RSR_IFS_MASK)) {
+		ucontrol->value.integer.value[0] = 0;
+		return 0;
+	}
+
+	rate = clk_get_rate(dev->gclk);
+
+	ucontrol->value.integer.value[0] = rate / (32 * SPDIFRX_RSR_IFS(val));
+
+	return 0;
+}
+
+static struct snd_kcontrol_new mchp_spdifrx_ctrls[] = {
+	/* Channel status controller */
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = SNDRV_CTL_NAME_IEC958("", CAPTURE, DEFAULT)
+			" Channel 1",
+		.access = SNDRV_CTL_ELEM_ACCESS_READ |
+			SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		.info = mchp_spdifrx_info,
+		.get = mchp_spdifrx_cs1_get,
+	},
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = SNDRV_CTL_NAME_IEC958("", CAPTURE, DEFAULT)
+			" Channel 2",
+		.access = SNDRV_CTL_ELEM_ACCESS_READ |
+			SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		.info = mchp_spdifrx_info,
+		.get = mchp_spdifrx_cs2_get,
+	},
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = SNDRV_CTL_NAME_IEC958("", CAPTURE, MASK),
+		.access = SNDRV_CTL_ELEM_ACCESS_READ,
+		.info = mchp_spdifrx_info,
+		.get = mchp_spdifrx_cs_mask,
+	},
+	/* User bits controller */
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = "IEC958 Subcode Capture Default Channel 1",
+		.access = SNDRV_CTL_ELEM_ACCESS_READ |
+			SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		.info = mchp_spdifrx_info,
+		.get = mchp_spdifrx_subcode_ch1_get,
+	},
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = "IEC958 Subcode Capture Default Channel 2",
+		.access = SNDRV_CTL_ELEM_ACCESS_READ |
+			SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		.info = mchp_spdifrx_info,
+		.get = mchp_spdifrx_subcode_ch2_get,
+	},
+	/* Lock status */
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = SNDRV_CTL_NAME_IEC958("", CAPTURE, NONE) "Unlocked",
+		.access = SNDRV_CTL_ELEM_ACCESS_READ |
+			SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		.info = mchp_spdifrx_boolean_info,
+		.get = mchp_spdifrx_ulock_get,
+	},
+	/* Bad format */
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = SNDRV_CTL_NAME_IEC958("", CAPTURE, NONE)"Bad Format",
+		.access = SNDRV_CTL_ELEM_ACCESS_READ |
+			SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		.info = mchp_spdifrx_boolean_info,
+		.get = mchp_spdifrx_badf_get,
+	},
+	/* Signal */
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = SNDRV_CTL_NAME_IEC958("", CAPTURE, NONE) "Signal",
+		.access = SNDRV_CTL_ELEM_ACCESS_READ |
+			SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		.info = mchp_spdifrx_boolean_info,
+		.get = mchp_spdifrx_signal_get,
+	},
+	/* Sampling rate */
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = SNDRV_CTL_NAME_IEC958("", CAPTURE, NONE) "Rate",
+		.access = SNDRV_CTL_ELEM_ACCESS_READ |
+			SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		.info = mchp_spdifrx_rate_info,
+		.get = mchp_spdifrx_rate_get,
+	},
+};
+
+static int mchp_spdifrx_dai_probe(struct snd_soc_dai *dai)
+{
+	struct mchp_spdifrx_dev *dev = snd_soc_dai_get_drvdata(dai);
+	struct mchp_spdifrx_mixer_control *ctrl = &dev->control;
+	int ch;
+	int err;
+
+	err = clk_prepare_enable(dev->pclk);
+	if (err) {
+		dev_err(dev->dev,
+			"failed to enable the peripheral clock: %d\n", err);
+		return err;
+	}
+
+	snd_soc_dai_init_dma_data(dai, NULL, &dev->capture);
+
+	/* Software reset the IP */
+	regmap_write(dev->regmap, SPDIFRX_CR, SPDIFRX_CR_SWRST);
+
+	/* Default configuration */
+	regmap_write(dev->regmap, SPDIFRX_MR,
+		     SPDIFRX_MR_VBMODE_DISCARD_IF_VB1 |
+		     SPDIFRX_MR_SBMODE_DISCARD |
+		     SPDIFRX_MR_AUTORST_NOACTION |
+		     SPDIFRX_MR_PACK_DISABLED);
+
+	dev->blockend_refcount = 0;
+	for (ch = 0; ch < SPDIFRX_CHANNELS; ch++) {
+		init_completion(&ctrl->ch_stat[ch].done);
+		init_completion(&ctrl->user_data[ch].done);
+		spin_lock_init(&ctrl->user_data[ch].lock);
+	}
+
+	/* Add controls */
+	snd_soc_add_dai_controls(dai, mchp_spdifrx_ctrls,
+				 ARRAY_SIZE(mchp_spdifrx_ctrls));
+
+	return 0;
+}
+
+static int mchp_spdifrx_dai_remove(struct snd_soc_dai *dai)
+{
+	struct mchp_spdifrx_dev *dev = snd_soc_dai_get_drvdata(dai);
+
+	/* Disable interrupts */
+	regmap_write(dev->regmap, SPDIFRX_IDR, 0xFF);
+
+	clk_disable_unprepare(dev->pclk);
+
+	return 0;
+}
+
+static struct snd_soc_dai_driver mchp_spdifrx_dai = {
+	.name = "mchp-spdifrx",
+	.probe	= mchp_spdifrx_dai_probe,
+	.remove	= mchp_spdifrx_dai_remove,
+	.capture = {
+		.stream_name = "S/PDIF Capture",
+		.channels_min = SPDIFRX_CHANNELS,
+		.channels_max = SPDIFRX_CHANNELS,
+		.rates = MCHP_SPDIF_RATES,
+		.formats = MCHP_SPDIF_FORMATS,
+	},
+	.ops = &mchp_spdifrx_dai_ops,
+};
+
+static const struct snd_soc_component_driver mchp_spdifrx_component = {
+	.name		= "mchp-spdifrx",
+};
+
+static const struct of_device_id mchp_spdifrx_dt_ids[] = {
+	{
+		.compatible = "microchip,sama7g5-spdifrx",
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mchp_spdifrx_dt_ids);
+
+static int mchp_spdifrx_probe(struct platform_device *pdev)
+{
+	struct mchp_spdifrx_dev *dev;
+	struct resource *mem;
+	struct regmap *regmap;
+	void __iomem *base;
+	int irq;
+	int err;
+	u32 vers;
+
+	/* Get memory for driver data. */
+	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	/* Map I/O registers. */
+	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(&pdev->dev, mem);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	regmap = devm_regmap_init_mmio(&pdev->dev, base,
+				       &mchp_spdifrx_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	/* Request IRQ. */
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	err = devm_request_irq(&pdev->dev, irq, mchp_spdif_interrupt, 0,
+			       dev_name(&pdev->dev), dev);
+	if (err)
+		return err;
+
+	/* Get the peripheral clock */
+	dev->pclk = devm_clk_get(&pdev->dev, "pclk");
+	if (IS_ERR(dev->pclk)) {
+		err = PTR_ERR(dev->pclk);
+		dev_err(&pdev->dev, "failed to get the peripheral clock: %d\n",
+			err);
+		return err;
+	}
+
+	/* Get the generated clock */
+	dev->gclk = devm_clk_get(&pdev->dev, "gclk");
+	if (IS_ERR(dev->gclk)) {
+		err = PTR_ERR(dev->gclk);
+		dev_err(&pdev->dev,
+			"failed to get the PMC generated clock: %d\n", err);
+		return err;
+	}
+	spin_lock_init(&dev->blockend_lock);
+
+	dev->dev = &pdev->dev;
+	dev->regmap = regmap;
+	platform_set_drvdata(pdev, dev);
+
+	dev->capture.addr	= (dma_addr_t)mem->start + SPDIFRX_RHR;
+	dev->capture.maxburst	= 1;
+
+	err = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
+	if (err) {
+		dev_err(&pdev->dev, "failed to register PMC: %d\n", err);
+		return err;
+	}
+
+	err = devm_snd_soc_register_component(&pdev->dev,
+					      &mchp_spdifrx_component,
+					      &mchp_spdifrx_dai, 1);
+	if (err) {
+		dev_err(&pdev->dev, "fail to register dai\n");
+		return err;
+	}
+
+	regmap_read(regmap, SPDIFRX_VERSION, &vers);
+	dev_info(&pdev->dev, "hw version: %#lx\n", vers & SPDIFRX_VERSION_MASK);
+
+	return 0;
+}
+
+static struct platform_driver mchp_spdifrx_driver = {
+	.probe	= mchp_spdifrx_probe,
+	.driver	= {
+		.name	= "mchp_spdifrx",
+		.of_match_table = of_match_ptr(mchp_spdifrx_dt_ids),
+	},
+};
+
+module_platform_driver(mchp_spdifrx_driver);
+
+MODULE_AUTHOR("Codrin Ciubotariu <codrin.ciubotariu@microchip.com>");
+MODULE_DESCRIPTION("Microchip S/PDIF RX Controller Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

