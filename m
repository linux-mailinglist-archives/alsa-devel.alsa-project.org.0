Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A31C743FA60
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Oct 2021 12:00:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32D0716D7;
	Fri, 29 Oct 2021 11:59:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32D0716D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635501646;
	bh=eJngoCk/e51F1Q0mClCI3019SbntNIk5qNM5CpbaJwM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GuxvhefPD9AszScmZ9ED4tFaBN2pP5XpTSGQdIzQkPwBtskqxz+QOYNuxfoGYmsvQ
	 0byESDLYX3/AZ4GKPMHLra6v78ZM0Y99Q2w245cxSImfx8lzaUXx9LXC/mYwi4kqgf
	 /4USNV3D4QdFrL0/HQu3eb7vQXHfLN1qXFUQyUsQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 861B5F800F4;
	Fri, 29 Oct 2021 11:59:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B57A6F8010A; Fri, 29 Oct 2021 11:59:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 964B7F8010A
 for <alsa-devel@alsa-project.org>; Fri, 29 Oct 2021 11:59:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 964B7F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hifiberry-com.20210112.gappssmtp.com
 header.i=@hifiberry-com.20210112.gappssmtp.com header.b="6x/HtMfo"
Received: by mail-wr1-x434.google.com with SMTP id z14so15347419wrg.6
 for <alsa-devel@alsa-project.org>; Fri, 29 Oct 2021 02:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hifiberry-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=TCoZMNa2+KsJ+tmgUkY5omqMZHb7abUiTgxUa63vZMo=;
 b=6x/HtMfoFHm3K3q0fi0+zTqLD+X62gfno3MzlkHXF9ygFPZhAQ7Mj7E5yBL6GCJelg
 IDYw9pg5gSq3nTRCZl7PbipYEI3ZPfQh11R7ZEn8K0GVPdFJZCj8uZKBe4NaDPvvVqum
 iSXEY0AmEyx1KSUl19v/jJLPvV5bCVrlid6zmpwAacpNyfBlaTNgC/TKM1EUQ1GA8qEh
 HAvRUs5FQw7EcfbpczyWqUD16i01ycwmjnd/amTZO8uzkQuidFtvXMKwUgsGov5vVajh
 m4CcNkvDmFBUxWLZBXedSLW41DpvL3bQfpiRmZqOp4D9738LrG9d7XT+O1NXmHt07R+0
 OH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=TCoZMNa2+KsJ+tmgUkY5omqMZHb7abUiTgxUa63vZMo=;
 b=SRo4f9tuVhcK6iGxmlxsQoNKOE90AlPs9fPBscUjjg+0AgWFLu/kE64kbFOmmrcHdN
 uracMS+DfVb1rMpYIhmdebZKGZ0xJyQJYDXE+bdBpC++vgyZV7qGcsrejj7ywMT2Dc9E
 K1BZY07y1kLaYHWv6QsUeQOUttGPiza9uLuYUG+LjB1jDl7YAgIPshTqPPimsX4GYhEN
 hJhtOlTciBWINQiUeyXe4xgNXismsbr+oU98BX3Roqz6IHHIOGkf6deNjKu0ZXLNxa2c
 rLJDPkSNF7IK0UeGPOH8npbUlp1k6Q8OJW500OydYVWPpANxa0vdnx+Se2aXhI40DOlw
 TSow==
X-Gm-Message-State: AOAM5301+YG9m26cZP5PEjetp8NajuHWch4Tat5bQBq+q85xs/Pst+py
 GzHrgw7JHmvgc4/Fi2xk0ONNbRbIDXC/aSaP6Vc=
X-Google-Smtp-Source: ABdhPJzx5SEPlfc1kOerFGW/873ghL+b1Cs+QxCUeZxd2UZQemGlK+Uuib3M1QeF0kvGvLnwAGyckQ==
X-Received: by 2002:a5d:4443:: with SMTP id x3mr4535136wrr.189.1635501549197; 
 Fri, 29 Oct 2021 02:59:09 -0700 (PDT)
Received: from ubuntu.fritz.box ([2a02:810d:1640:10d8:e5e7:1245:917c:c06f])
 by smtp.gmail.com with ESMTPSA id l2sm6403192wrs.90.2021.10.29.02.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:59:08 -0700 (PDT)
From: Joerg Schambacher <joerg@hifiberry.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] sound/soc: adds TAS5754M digital input amplifier component
 driver
Date: Fri, 29 Oct 2021 11:57:30 +0200
Message-Id: <20211029095730.29224-1-joerg@hifiberry.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211029095414.29131-1-joerg@hifiberry.com>
References: <20211029095414.29131-1-joerg@hifiberry.com>
Cc: joerg@hifiberry.com, broonie@kernel.org, kbuild-all@lists.01.org
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

Adds a minimum component driver to run the amplifier in I2S master
mode only from standard audio clocks. Therefore, it only allows
44.1, 88.2, 176.4, 48, 96 and 192ksps with 16, 20, 24 and 32 bits
sample size. Digital volume control and the -6dB switch are supported.

Signed-off-by: Joerg Schambacher <joerg@hifiberry.com>
---
Added of_match_ptr() macro to fix the error when compiling on non CONFIG_OF
systems.

Joerg
 sound/soc/codecs/Kconfig    |   8 +
 sound/soc/codecs/Makefile   |   2 +
 sound/soc/codecs/tas5754m.c | 547 ++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/tas5754m.h | 259 +++++++++++++++++
 4 files changed, 816 insertions(+)
 create mode 100644 sound/soc/codecs/tas5754m.c
 create mode 100644 sound/soc/codecs/tas5754m.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 82ee233a269d..cf0584948fcf 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -210,6 +210,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_TAS5086
 	imply SND_SOC_TAS571X
 	imply SND_SOC_TAS5720
+	imply SND_SOC_TAS5754M
 	imply SND_SOC_TAS6424
 	imply SND_SOC_TDA7419
 	imply SND_SOC_TFA9879
@@ -1419,6 +1420,13 @@ config SND_SOC_TAS5720
 	  Enable support for Texas Instruments TAS5720L/M high-efficiency mono
 	  Class-D audio power amplifiers.
 
+config SND_SOC_TAS5754M
+	tristate "Texas Instruments TAS5754M Digital Input Audio amplifier"
+	depends on I2C
+	help
+	  Enable support for Texas Instruments TAS5754M digital input
+	  Class-D audio power amplifiers.
+
 config SND_SOC_TAS6424
 	tristate "Texas Instruments TAS6424 Quad-Channel Audio amplifier"
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 8dcea2c4604a..39984900258a 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -227,6 +227,7 @@ snd-soc-sti-sas-objs := sti-sas.o
 snd-soc-tas5086-objs := tas5086.o
 snd-soc-tas571x-objs := tas571x.o
 snd-soc-tas5720-objs := tas5720.o
+snd-soc-tas5754m-objs := tas5754m.o
 snd-soc-tas6424-objs := tas6424.o
 snd-soc-tda7419-objs := tda7419.o
 snd-soc-tas2770-objs := tas2770.o
@@ -555,6 +556,7 @@ obj-$(CONFIG_SND_SOC_TAS2764)	+= snd-soc-tas2764.o
 obj-$(CONFIG_SND_SOC_TAS5086)	+= snd-soc-tas5086.o
 obj-$(CONFIG_SND_SOC_TAS571X)	+= snd-soc-tas571x.o
 obj-$(CONFIG_SND_SOC_TAS5720)	+= snd-soc-tas5720.o
+obj-$(CONFIG_SND_SOC_TAS5754M)	+= snd-soc-tas5754m.o
 obj-$(CONFIG_SND_SOC_TAS6424)	+= snd-soc-tas6424.o
 obj-$(CONFIG_SND_SOC_TDA7419)	+= snd-soc-tda7419.o
 obj-$(CONFIG_SND_SOC_TAS2770) += snd-soc-tas2770.o
diff --git a/sound/soc/codecs/tas5754m.c b/sound/soc/codecs/tas5754m.c
new file mode 100644
index 000000000000..aef2c65acc26
--- /dev/null
+++ b/sound/soc/codecs/tas5754m.c
@@ -0,0 +1,547 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for the TAS5754M Audio Amplifier in Master mode (only)
+ * supports only standard audio frequencies 44.1 to 192 ksps
+ *
+ * Author: Joerg Schambacher <joerg@hifiberry.com>
+ * with fragments from Andy Liu <andy-liu@ti.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ */
+
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/clk.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+#include <linux/init.h>
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+#include <linux/delay.h>
+
+#include <sound/tlv.h>
+#include <sound/soc.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/initval.h>
+
+#include "tas5754m.h"
+
+#define TAS5754M_RATES		(SNDRV_PCM_RATE_48000  |	\
+				 SNDRV_PCM_RATE_96000  |	\
+				 SNDRV_PCM_RATE_192000 |	\
+				 SNDRV_PCM_RATE_44100  |	\
+				 SNDRV_PCM_RATE_88200  |	\
+				 SNDRV_PCM_RATE_176400)
+#define TAS5754M_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE  | \
+				 SNDRV_PCM_FMTBIT_S20_LE  | \
+				 SNDRV_PCM_FMTBIT_S24_LE  | \
+				 SNDRV_PCM_FMTBIT_S32_LE)
+
+
+static const struct reg_sequence tas5754m_init_sequence[] = {
+	{ TAS5754M_RESET,		0x00 },
+	{ TAS5754M_MUTE,		0x11 },
+	{ TAS5754M_POWER,		0x00 },
+	{ TAS5754M_PLL_EN,		0x00 },
+	{ TAS5754M_RESET,		0x00 },
+	{ TAS5754M_GPIO_OUTPUT_3,	0x02 },
+	{ TAS5754M_GPIO_OUTPUT_4,	0x02 },
+	{ TAS5754M_GPIO_OUTPUT_6,	0x02 },
+	{ TAS5754M_GPIO_EN,		0x2c },
+	{ TAS5754M_GPIO_CONTROL_1,	0x04 },
+	{ TAS5754M_BCLK_LRCLK_CFG,	0x11 },
+	{ TAS5754M_MASTER_MODE,		0x7c },
+	{ TAS5754M_ERROR_DETECT,	0x77 },
+	{ TAS5754M_PLL_EN,		0x01 },
+	{ TAS5754M_PLL_REF,		0x00 },
+	{ TAS5754M_PLL_COEFF_0,		0x03 },
+	{ TAS5754M_PLL_COEFF_1,		0x0c },
+	{ TAS5754M_PLL_COEFF_2,		0x00 },
+	{ TAS5754M_PLL_COEFF_3,		0x00 },
+	{ TAS5754M_PLL_COEFF_4,		0x00 },
+	{ TAS5754M_DAC_REF,		0x30 },
+	{ TAS5754M_DSP_CLKDIV,		0x01 },
+	{ TAS5754M_DAC_CLKDIV,		0x0f },
+	{ TAS5754M_NCP_CLKDIV,		0x03 },
+	{ TAS5754M_OSR_CLKDIV,		0x00 },
+	{ TAS5754M_FS_SPEED_MODE,	0x00 },
+	{ TAS5754M_MASTER_CLKDIV_1,	0x0f },
+	{ TAS5754M_MASTER_CLKDIV_2,	0x1f },
+	{ TAS5754M_I2S_1,		0x00 },
+	{ TAS5754M_I2S_2,		0x01 },
+	{ TAS5754M_PLL_EN,		0x01 },
+	{ TAS5754M_MASTER_MODE,		0x7f },
+	{ TAS5754M_MUTE,		0x11 },
+};
+
+static const struct reg_default tas5754m_reg_defaults[] = {
+	{ TAS5754M_RESET,             0x00 },
+	{ TAS5754M_POWER,             0x00 },
+	{ TAS5754M_MUTE,              0x00 },
+	{ TAS5754M_DSP,               0x00 },
+	{ TAS5754M_PLL_REF,           0x00 },
+	{ TAS5754M_DAC_REF,           0x00 },
+	{ TAS5754M_DAC_ROUTING,       0x11 },
+	{ TAS5754M_DSP_PROGRAM,       0x01 },
+	{ TAS5754M_CLKDET,            0x00 },
+	{ TAS5754M_AUTO_MUTE,         0x00 },
+	{ TAS5754M_ERROR_DETECT,      0x00 },
+	{ TAS5754M_DIGITAL_VOLUME_1,  0x00 },
+	{ TAS5754M_DIGITAL_VOLUME_2,  0x30 },
+	{ TAS5754M_DIGITAL_VOLUME_3,  0x30 },
+	{ TAS5754M_DIGITAL_MUTE_1,    0x22 },
+	{ TAS5754M_DIGITAL_MUTE_2,    0x00 },
+	{ TAS5754M_DIGITAL_MUTE_3,    0x07 },
+	{ TAS5754M_OUTPUT_AMPLITUDE,  0x00 },
+	{ TAS5754M_ANALOG_GAIN_CTRL,  0x00 },
+	{ TAS5754M_UNDERVOLTAGE_PROT, 0x00 },
+	{ TAS5754M_ANALOG_MUTE_CTRL,  0x00 },
+	{ TAS5754M_ANALOG_GAIN_BOOST, 0x00 },
+	{ TAS5754M_VCOM_CTRL_1,       0x00 },
+	{ TAS5754M_VCOM_CTRL_2,       0x01 },
+	{ TAS5754M_BCLK_LRCLK_CFG,    0x00 },
+	{ TAS5754M_MASTER_MODE,       0x7c },
+	{ TAS5754M_GPIO_DACIN,        0x00 },
+	{ TAS5754M_GPIO_PLLIN,        0x00 },
+	{ TAS5754M_SYNCHRONIZE,       0x10 },
+	{ TAS5754M_PLL_COEFF_0,       0x00 },
+	{ TAS5754M_PLL_COEFF_1,       0x00 },
+	{ TAS5754M_PLL_COEFF_2,       0x00 },
+	{ TAS5754M_PLL_COEFF_3,       0x00 },
+	{ TAS5754M_PLL_COEFF_4,       0x00 },
+	{ TAS5754M_DSP_CLKDIV,        0x00 },
+	{ TAS5754M_DAC_CLKDIV,        0x00 },
+	{ TAS5754M_NCP_CLKDIV,        0x00 },
+	{ TAS5754M_OSR_CLKDIV,        0x00 },
+	{ TAS5754M_MASTER_CLKDIV_1,   0x00 },
+	{ TAS5754M_MASTER_CLKDIV_2,   0x00 },
+	{ TAS5754M_FS_SPEED_MODE,     0x00 },
+	{ TAS5754M_IDAC_1,            0x01 },
+	{ TAS5754M_IDAC_2,            0x00 },
+};
+
+static bool tas5754m_readable(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TAS5754M_RESET:
+	case TAS5754M_POWER:
+	case TAS5754M_MUTE:
+	case TAS5754M_PLL_EN:
+	case TAS5754M_SPI_MISO_FUNCTION:
+	case TAS5754M_DSP:
+	case TAS5754M_GPIO_EN:
+	case TAS5754M_BCLK_LRCLK_CFG:
+	case TAS5754M_DSP_GPIO_INPUT:
+	case TAS5754M_MASTER_MODE:
+	case TAS5754M_PLL_REF:
+	case TAS5754M_DAC_REF:
+	case TAS5754M_GPIO_DACIN:
+	case TAS5754M_GPIO_PLLIN:
+	case TAS5754M_SYNCHRONIZE:
+	case TAS5754M_PLL_COEFF_0:
+	case TAS5754M_PLL_COEFF_1:
+	case TAS5754M_PLL_COEFF_2:
+	case TAS5754M_PLL_COEFF_3:
+	case TAS5754M_PLL_COEFF_4:
+	case TAS5754M_DSP_CLKDIV:
+	case TAS5754M_DAC_CLKDIV:
+	case TAS5754M_NCP_CLKDIV:
+	case TAS5754M_OSR_CLKDIV:
+	case TAS5754M_MASTER_CLKDIV_1:
+	case TAS5754M_MASTER_CLKDIV_2:
+	case TAS5754M_FS_SPEED_MODE:
+	case TAS5754M_IDAC_1:
+	case TAS5754M_IDAC_2:
+	case TAS5754M_ERROR_DETECT:
+	case TAS5754M_I2S_1:
+	case TAS5754M_I2S_2:
+	case TAS5754M_DAC_ROUTING:
+	case TAS5754M_DSP_PROGRAM:
+	case TAS5754M_CLKDET:
+	case TAS5754M_AUTO_MUTE:
+	case TAS5754M_DIGITAL_VOLUME_1:
+	case TAS5754M_DIGITAL_VOLUME_2:
+	case TAS5754M_DIGITAL_VOLUME_3:
+	case TAS5754M_DIGITAL_MUTE_1:
+	case TAS5754M_DIGITAL_MUTE_2:
+	case TAS5754M_DIGITAL_MUTE_3:
+	case TAS5754M_GPIO_OUTPUT_1:
+	case TAS5754M_GPIO_OUTPUT_2:
+	case TAS5754M_GPIO_OUTPUT_3:
+	case TAS5754M_GPIO_OUTPUT_4:
+	case TAS5754M_GPIO_OUTPUT_5:
+	case TAS5754M_GPIO_OUTPUT_6:
+	case TAS5754M_GPIO_CONTROL_1:
+	case TAS5754M_GPIO_CONTROL_2:
+	case TAS5754M_OVERFLOW:
+	case TAS5754M_RATE_DET_1:
+	case TAS5754M_RATE_DET_2:
+	case TAS5754M_RATE_DET_3:
+	case TAS5754M_RATE_DET_4:
+	case TAS5754M_CLOCK_STATUS:
+	case TAS5754M_ANALOG_MUTE_DET:
+	case TAS5754M_GPIN:
+	case TAS5754M_DIGITAL_MUTE_DET:
+	case TAS5754M_OUTPUT_AMPLITUDE:
+	case TAS5754M_ANALOG_GAIN_CTRL:
+	case TAS5754M_UNDERVOLTAGE_PROT:
+	case TAS5754M_ANALOG_MUTE_CTRL:
+	case TAS5754M_ANALOG_GAIN_BOOST:
+	case TAS5754M_VCOM_CTRL_1:
+	case TAS5754M_VCOM_CTRL_2:
+	case TAS5754M_CRAM_CTRL:
+	case TAS5754M_FLEX_A:
+	case TAS5754M_FLEX_B:
+		return true;
+	default:
+		return reg < 0x7f;
+	}
+}
+
+static bool tas5754m_volatile(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TAS5754M_PLL_EN:
+	case TAS5754M_OVERFLOW:
+	case TAS5754M_RATE_DET_1:
+	case TAS5754M_RATE_DET_2:
+	case TAS5754M_RATE_DET_3:
+	case TAS5754M_RATE_DET_4:
+	case TAS5754M_CLOCK_STATUS:
+	case TAS5754M_ANALOG_MUTE_DET:
+	case TAS5754M_GPIN:
+	case TAS5754M_DIGITAL_MUTE_DET:
+	case TAS5754M_CRAM_CTRL:
+		return true;
+	default:
+		return reg < 0x7f;
+	}
+}
+
+struct tas5754m_priv {
+	struct regmap *regmap;
+	struct clk *sclk;
+};
+
+static const struct regmap_range_cfg tas5754m_range = {
+	.name = "Pages",
+	.range_min = TAS5754M_VIRT_BASE,
+	.range_max = TAS5754M_MAX_REGISTER,
+	.selector_reg = TAS5754M_PAGE,
+	.selector_mask = 0x7f,
+	.window_start = 0,
+	.window_len = 128,
+};
+
+const struct regmap_config tas5754m_regmap = {
+	.reg_bits = 8,
+	.val_bits = 8,
+
+	.ranges = &tas5754m_range,
+	.num_ranges = 1,
+	.max_register = TAS5754M_MAX_REGISTER,
+
+	.reg_defaults = tas5754m_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(tas5754m_reg_defaults),
+	.readable_reg = tas5754m_readable,
+	.volatile_reg = tas5754m_volatile,
+
+	.cache_type = REGCACHE_RBTREE,
+};
+EXPORT_SYMBOL_GPL(tas5754m_regmap);
+
+static const DECLARE_TLV_DB_SCALE(digital_tlv, -10350, 50, 1);
+static const DECLARE_TLV_DB_SCALE(analog_tlv, -600, 600, 0);
+
+static const struct snd_kcontrol_new tas5754m_controls[] = {
+SOC_DOUBLE_R_TLV("Digital Playback Volume", TAS5754M_DIGITAL_VOLUME_2,
+		 TAS5754M_DIGITAL_VOLUME_3, 0, 255, 1, digital_tlv),
+SOC_DOUBLE_TLV("Analog Playback Volume", TAS5754M_ANALOG_GAIN_CTRL,
+	     TAS5754M_LAGN_SHIFT, TAS5754M_RAGN_SHIFT, 1, 1, analog_tlv),
+};
+
+static int tas5754m_set_bias_level(struct snd_soc_component *component,
+					enum snd_soc_bias_level level)
+{
+	struct tas5754m_priv *tas5754m =
+				snd_soc_component_get_drvdata(component);
+	int ret;
+
+	switch (level) {
+	case SND_SOC_BIAS_ON:
+	case SND_SOC_BIAS_PREPARE:
+		break;
+
+	case SND_SOC_BIAS_STANDBY:
+		ret = regmap_update_bits(tas5754m->regmap,
+				TAS5754M_POWER, TAS5754M_RQST, 0);
+		if (ret != 0) {
+			dev_err(component->dev,
+				"Failed to remove standby: %d\n", ret);
+			return ret;
+		}
+		break;
+
+	case SND_SOC_BIAS_OFF:
+		ret = regmap_update_bits(tas5754m->regmap,
+				TAS5754M_POWER, TAS5754M_RQST, TAS5754M_RQST);
+		if (ret != 0) {
+			dev_err(component->dev,
+				"Failed to request standby: %d\n", ret);
+			return ret;
+		}
+		break;
+	}
+
+	return 0;
+}
+
+static int tas5754m_hw_params(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params,
+			     struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tas5754m_priv *tas5754m =
+			snd_soc_component_get_drvdata(component);
+	unsigned long bclk;
+	unsigned long mclk;
+	int sample_len;
+	int bclk_div;
+	int lrclk_div;
+	int alen;
+	int ret;
+
+	switch (params_width(params)) {
+	case 16:
+		sample_len = 16;
+		alen = TAS5754M_ALEN_16;
+		break;
+	case 20:
+		sample_len = 32;
+		alen = TAS5754M_ALEN_20;
+		break;
+	case 24:
+		sample_len = 32;
+		alen = TAS5754M_ALEN_24;
+		break;
+	case 32:
+		sample_len = 32;
+		alen = TAS5754M_ALEN_32;
+		break;
+	default:
+		dev_err(component->dev, "Unsupported sample size: %d\n",
+			params_width(params));
+		return -EINVAL;
+	}
+	ret = regmap_update_bits(tas5754m->regmap, TAS5754M_I2S_1, alen, alen);
+	if (ret != 0) {
+		dev_err(component->dev,
+			"Cannot set sample size: %d\n", ret);
+		return ret;
+	}
+
+	switch (params_rate(params)) {
+	case 44100:
+	case 48000:
+		ret = regmap_write(tas5754m->regmap,
+			TAS5754M_FS_SPEED_MODE, TAS5754M_FSSP_48KHZ);
+		break;
+	case 88200:
+	case 96000:
+		ret = regmap_write(tas5754m->regmap,
+			TAS5754M_FS_SPEED_MODE, TAS5754M_FSSP_96KHZ);
+		break;
+	case 176400:
+	case 192000:
+		ret = regmap_write(tas5754m->regmap,
+			TAS5754M_FS_SPEED_MODE, TAS5754M_FSSP_192KHZ);
+		break;
+	default:
+		dev_err(component->dev, "Sample rate not supported: %d\n",
+			params_rate(params));
+		return -EINVAL;
+	}
+	if (ret != 0) {
+		dev_err(component->dev, "Failed to config PLL\n");
+		return ret;
+	}
+
+
+	mclk = clk_get_rate(tas5754m->sclk);
+	bclk = sample_len * 2 * params_rate(params);
+	bclk_div = mclk / bclk;
+	lrclk_div = sample_len * 2;
+
+	// stop LR / SCLK clocks
+	ret = regmap_write(tas5754m->regmap, TAS5754M_MASTER_MODE, 0x7c);
+
+	// set SCLK divider
+	ret |= regmap_write(tas5754m->regmap, TAS5754M_MASTER_CLKDIV_1,
+								bclk_div - 1);
+
+	// set LRCLK divider
+	ret |= regmap_write(tas5754m->regmap, TAS5754M_MASTER_CLKDIV_2,
+								lrclk_div - 1);
+
+	// restart LR / SCLK clocks
+	ret |= regmap_write(tas5754m->regmap, TAS5754M_MASTER_MODE, 0x7f);
+	if (ret != 0) {
+		dev_err(component->dev, "Failed to config PLL\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_component_driver tas5754m_soc_component = {
+	.set_bias_level = tas5754m_set_bias_level,
+	.idle_bias_on = true,
+	.controls = tas5754m_controls,
+	.num_controls = ARRAY_SIZE(tas5754m_controls),
+};
+
+static int tas5754m_mute(struct snd_soc_dai *dai, int mute, int stream)
+{
+	struct snd_soc_component *component = dai->component;
+
+	if (mute) {
+		snd_soc_component_write(component, TAS5754M_MUTE, 0x11);
+	} else {
+		usleep_range(1000, 2000);
+		snd_soc_component_write(component, TAS5754M_MUTE, 0x00);
+	}
+	return 0;
+}
+
+static const struct snd_soc_dai_ops tas5754m_dai_ops = {
+	.mute_stream = tas5754m_mute,
+	.hw_params = tas5754m_hw_params,
+};
+
+static struct snd_soc_dai_driver tas5754m_dai = {
+	.name		= "tas5754m-amplifier",
+	.playback	= {
+		.stream_name	= "Playback",
+		.channels_min	= 2,
+		.channels_max	= 2,
+		.rates		= TAS5754M_RATES,
+		.formats	= TAS5754M_FORMATS,
+	},
+	.ops = &tas5754m_dai_ops,
+};
+
+static int tas5754m_probe(struct device *dev, struct regmap *regmap)
+{
+	struct tas5754m_priv *tas5754m;
+	int ret;
+
+	tas5754m = devm_kzalloc(dev, sizeof(struct tas5754m_priv), GFP_KERNEL);
+	if (!tas5754m)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, tas5754m);
+	tas5754m->regmap = regmap;
+
+	ret = regmap_multi_reg_write(regmap, tas5754m_init_sequence,
+					ARRAY_SIZE(tas5754m_init_sequence));
+
+	if (ret != 0) {
+		dev_err(dev, "Failed to initialize TAS5754M: %d\n", ret);
+		goto err;
+	}
+
+	tas5754m->sclk = devm_clk_get(dev, NULL);
+	if (PTR_ERR(tas5754m->sclk) == -EPROBE_DEFER) {
+		ret = -EPROBE_DEFER;
+		goto err;
+	}
+	if (!IS_ERR(tas5754m->sclk)) {
+		ret = clk_prepare_enable(tas5754m->sclk);
+		if (ret != 0) {
+			dev_err(dev, "Failed to enable SCLK: %d\n", ret);
+			goto err;
+		}
+	}
+
+	ret = snd_soc_register_component(dev,
+			&tas5754m_soc_component, &tas5754m_dai, 1);
+	if (ret != 0) {
+		dev_err(dev, "Failed to register CODEC: %d\n", ret);
+		goto err;
+	}
+
+	return 0;
+
+err:
+	return ret;
+
+}
+
+static int tas5754m_i2c_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
+{
+	struct regmap *regmap;
+	struct regmap_config config = tas5754m_regmap;
+
+	/* enable auto-increment mode */
+	config.read_flag_mask = 0x80;
+	config.write_flag_mask = 0x80;
+
+	regmap = devm_regmap_init_i2c(i2c, &config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	return tas5754m_probe(&i2c->dev, regmap);
+}
+
+static int tas5754m_remove(struct device *dev)
+{
+	snd_soc_unregister_component(dev);
+
+	return 0;
+}
+
+static int tas5754m_i2c_remove(struct i2c_client *i2c)
+{
+	tas5754m_remove(&i2c->dev);
+
+	return 0;
+}
+
+static const struct i2c_device_id tas5754m_i2c_id[] = {
+	{ "tas5754m", },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, tas5754m_i2c_id);
+
+#ifdef CONFIG_OF
+static const struct of_device_id tas5754m_of_match[] = {
+	{ .compatible = "ti,tas5754m", },
+	{ .compatible = "ti,tas5756m", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tas5754m_of_match);
+#endif
+
+static struct i2c_driver tas5754m_i2c_driver = {
+	.probe		= tas5754m_i2c_probe,
+	.remove		= tas5754m_i2c_remove,
+	.id_table	= tas5754m_i2c_id,
+	.driver		= {
+		.name	= "tas5754m",
+		.of_match_table = of_match_ptr(tas5754m_of_match),
+	},
+};
+
+module_i2c_driver(tas5754m_i2c_driver);
+
+MODULE_AUTHOR("Joerg Schambacher <joerg@hifiberry.com>");
+MODULE_DESCRIPTION("TAS5754M Audio Amplifier Driver - Master mode only");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/tas5754m.h b/sound/soc/codecs/tas5754m.h
new file mode 100644
index 000000000000..492b8abede6c
--- /dev/null
+++ b/sound/soc/codecs/tas5754m.h
@@ -0,0 +1,259 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Driver for the TAS5754M DAC+amplifier combo devices
+ *
+ * Author:	(copied from pcm512x.h)
+ *		Mark Brown <broonie@kernel.org>
+ *		Copyright 2014 Linaro Ltd
+ */
+
+#ifndef _SND_SOC_TAS5754M
+#define _SND_SOC_TAS5754M
+
+#include <linux/pm.h>
+#include <linux/regmap.h>
+
+#define TAS5754M_VIRT_BASE 0x000
+#define TAS5754M_PAGE_LEN  0x80
+#define TAS5754M_PAGE_BASE(n)  (TAS5754M_VIRT_BASE + (TAS5754M_PAGE_LEN * n))
+
+#define TAS5754M_PAGE              0
+
+#define TAS5754M_RESET             (TAS5754M_PAGE_BASE(0) +   1)
+#define TAS5754M_POWER             (TAS5754M_PAGE_BASE(0) +   2)
+#define TAS5754M_MUTE              (TAS5754M_PAGE_BASE(0) +   3)
+#define TAS5754M_PLL_EN            (TAS5754M_PAGE_BASE(0) +   4)
+#define TAS5754M_SPI_MISO_FUNCTION (TAS5754M_PAGE_BASE(0) +   6)
+#define TAS5754M_DSP               (TAS5754M_PAGE_BASE(0) +   7)
+#define TAS5754M_GPIO_EN           (TAS5754M_PAGE_BASE(0) +   8)
+#define TAS5754M_BCLK_LRCLK_CFG    (TAS5754M_PAGE_BASE(0) +   9)
+#define TAS5754M_DSP_GPIO_INPUT    (TAS5754M_PAGE_BASE(0) +  10)
+#define TAS5754M_MASTER_MODE       (TAS5754M_PAGE_BASE(0) +  12)
+#define TAS5754M_PLL_REF           (TAS5754M_PAGE_BASE(0) +  13)
+#define TAS5754M_DAC_REF           (TAS5754M_PAGE_BASE(0) +  14)
+#define TAS5754M_GPIO_DACIN        (TAS5754M_PAGE_BASE(0) +  16)
+#define TAS5754M_GPIO_PLLIN        (TAS5754M_PAGE_BASE(0) +  18)
+#define TAS5754M_SYNCHRONIZE       (TAS5754M_PAGE_BASE(0) +  19)
+#define TAS5754M_PLL_COEFF_0       (TAS5754M_PAGE_BASE(0) +  20)
+#define TAS5754M_PLL_COEFF_1       (TAS5754M_PAGE_BASE(0) +  21)
+#define TAS5754M_PLL_COEFF_2       (TAS5754M_PAGE_BASE(0) +  22)
+#define TAS5754M_PLL_COEFF_3       (TAS5754M_PAGE_BASE(0) +  23)
+#define TAS5754M_PLL_COEFF_4       (TAS5754M_PAGE_BASE(0) +  24)
+#define TAS5754M_DSP_CLKDIV        (TAS5754M_PAGE_BASE(0) +  27)
+#define TAS5754M_DAC_CLKDIV        (TAS5754M_PAGE_BASE(0) +  28)
+#define TAS5754M_NCP_CLKDIV        (TAS5754M_PAGE_BASE(0) +  29)
+#define TAS5754M_OSR_CLKDIV        (TAS5754M_PAGE_BASE(0) +  30)
+#define TAS5754M_MASTER_CLKDIV_1   (TAS5754M_PAGE_BASE(0) +  32)
+#define TAS5754M_MASTER_CLKDIV_2   (TAS5754M_PAGE_BASE(0) +  33)
+#define TAS5754M_FS_SPEED_MODE     (TAS5754M_PAGE_BASE(0) +  34)
+#define TAS5754M_IDAC_1            (TAS5754M_PAGE_BASE(0) +  35)
+#define TAS5754M_IDAC_2            (TAS5754M_PAGE_BASE(0) +  36)
+#define TAS5754M_ERROR_DETECT      (TAS5754M_PAGE_BASE(0) +  37)
+#define TAS5754M_I2S_1             (TAS5754M_PAGE_BASE(0) +  40)
+#define TAS5754M_I2S_2             (TAS5754M_PAGE_BASE(0) +  41)
+#define TAS5754M_DAC_ROUTING       (TAS5754M_PAGE_BASE(0) +  42)
+#define TAS5754M_DSP_PROGRAM       (TAS5754M_PAGE_BASE(0) +  43)
+#define TAS5754M_CLKDET            (TAS5754M_PAGE_BASE(0) +  44)
+#define TAS5754M_AUTO_MUTE         (TAS5754M_PAGE_BASE(0) +  59)
+#define TAS5754M_DIGITAL_VOLUME_1  (TAS5754M_PAGE_BASE(0) +  60)
+#define TAS5754M_DIGITAL_VOLUME_2  (TAS5754M_PAGE_BASE(0) +  61)
+#define TAS5754M_DIGITAL_VOLUME_3  (TAS5754M_PAGE_BASE(0) +  62)
+#define TAS5754M_DIGITAL_MUTE_1    (TAS5754M_PAGE_BASE(0) +  63)
+#define TAS5754M_DIGITAL_MUTE_2    (TAS5754M_PAGE_BASE(0) +  64)
+#define TAS5754M_DIGITAL_MUTE_3    (TAS5754M_PAGE_BASE(0) +  65)
+#define TAS5754M_GPIO_OUTPUT_1     (TAS5754M_PAGE_BASE(0) +  80)
+#define TAS5754M_GPIO_OUTPUT_2     (TAS5754M_PAGE_BASE(0) +  81)
+#define TAS5754M_GPIO_OUTPUT_3     (TAS5754M_PAGE_BASE(0) +  82)
+#define TAS5754M_GPIO_OUTPUT_4     (TAS5754M_PAGE_BASE(0) +  83)
+#define TAS5754M_GPIO_OUTPUT_5     (TAS5754M_PAGE_BASE(0) +  84)
+#define TAS5754M_GPIO_OUTPUT_6     (TAS5754M_PAGE_BASE(0) +  85)
+#define TAS5754M_GPIO_CONTROL_1    (TAS5754M_PAGE_BASE(0) +  86)
+#define TAS5754M_GPIO_CONTROL_2    (TAS5754M_PAGE_BASE(0) +  87)
+#define TAS5754M_OVERFLOW          (TAS5754M_PAGE_BASE(0) +  90)
+#define TAS5754M_RATE_DET_1        (TAS5754M_PAGE_BASE(0) +  91)
+#define TAS5754M_RATE_DET_2        (TAS5754M_PAGE_BASE(0) +  92)
+#define TAS5754M_RATE_DET_3        (TAS5754M_PAGE_BASE(0) +  93)
+#define TAS5754M_RATE_DET_4        (TAS5754M_PAGE_BASE(0) +  94)
+#define TAS5754M_CLOCK_STATUS      (TAS5754M_PAGE_BASE(0) +  95)
+#define TAS5754M_ANALOG_MUTE_DET   (TAS5754M_PAGE_BASE(0) + 108)
+#define TAS5754M_GPIN              (TAS5754M_PAGE_BASE(0) + 119)
+#define TAS5754M_DIGITAL_MUTE_DET  (TAS5754M_PAGE_BASE(0) + 120)
+
+#define TAS5754M_OUTPUT_AMPLITUDE  (TAS5754M_PAGE_BASE(1) +   1)
+#define TAS5754M_ANALOG_GAIN_CTRL  (TAS5754M_PAGE_BASE(1) +   2)
+#define TAS5754M_UNDERVOLTAGE_PROT (TAS5754M_PAGE_BASE(1) +   5)
+#define TAS5754M_ANALOG_MUTE_CTRL  (TAS5754M_PAGE_BASE(1) +   6)
+#define TAS5754M_ANALOG_GAIN_BOOST (TAS5754M_PAGE_BASE(1) +   7)
+#define TAS5754M_VCOM_CTRL_1       (TAS5754M_PAGE_BASE(1) +   8)
+#define TAS5754M_VCOM_CTRL_2       (TAS5754M_PAGE_BASE(1) +   9)
+
+#define TAS5754M_CRAM_CTRL         (TAS5754M_PAGE_BASE(44) +  1)
+
+#define TAS5754M_FLEX_A            (TAS5754M_PAGE_BASE(253) + 63)
+#define TAS5754M_FLEX_B            (TAS5754M_PAGE_BASE(253) + 64)
+
+#define TAS5754M_MAX_REGISTER      (TAS5754M_PAGE_BASE(253) + 64)
+
+/* Page 0, Register 1 - reset */
+#define TAS5754M_RSTR (1 << 0)
+#define TAS5754M_RSTM (1 << 4)
+
+/* Page 0, Register 2 - power */
+#define TAS5754M_RQPD       (1 << 0)
+#define TAS5754M_RQPD_SHIFT 0
+#define TAS5754M_RQST       (1 << 4)
+#define TAS5754M_RQST_SHIFT 4
+
+/* Page 0, Register 3 - mute */
+#define TAS5754M_RQMR (1 << 0)
+#define TAS5754M_RQMR_SHIFT 0
+#define TAS5754M_RQML (1 << 4)
+#define TAS5754M_RQML_SHIFT 4
+
+/* Page 0, Register 4 - PLL */
+#define TAS5754M_PLLE       (1 << 0)
+#define TAS5754M_PLLE_SHIFT 0
+#define TAS5754M_PLCK       (1 << 4)
+#define TAS5754M_PLCK_SHIFT 4
+
+/* Page 0, Register 7 - DSP */
+#define TAS5754M_SDSL       (1 << 0)
+#define TAS5754M_SDSL_SHIFT 0
+#define TAS5754M_DEMP       (1 << 4)
+#define TAS5754M_DEMP_SHIFT 4
+
+/* Page 0, Register 8 - GPIO output enable */
+#define TAS5754M_G1OE       (1 << 0)
+#define TAS5754M_G2OE       (1 << 1)
+#define TAS5754M_G3OE       (1 << 2)
+#define TAS5754M_G4OE       (1 << 3)
+#define TAS5754M_G5OE       (1 << 4)
+#define TAS5754M_G6OE       (1 << 5)
+
+/* Page 0, Register 9 - BCK, LRCLK configuration */
+#define TAS5754M_LRKO       (1 << 0)
+#define TAS5754M_LRKO_SHIFT 0
+#define TAS5754M_BCKO       (1 << 4)
+#define TAS5754M_BCKO_SHIFT 4
+#define TAS5754M_BCKP       (1 << 5)
+#define TAS5754M_BCKP_SHIFT 5
+
+/* Page 0, Register 12 - Master mode BCK, LRCLK reset */
+#define TAS5754M_RLRK       (1 << 0)
+#define TAS5754M_RLRK_SHIFT 0
+#define TAS5754M_RBCK       (1 << 1)
+#define TAS5754M_RBCK_SHIFT 1
+
+/* Page 0, Register 13 - PLL reference */
+#define TAS5754M_SREF        (7 << 4)
+#define TAS5754M_SREF_SHIFT  4
+#define TAS5754M_SREF_SCK    (0 << 4)
+#define TAS5754M_SREF_BCK    (1 << 4)
+#define TAS5754M_SREF_GPIO   (3 << 4)
+
+/* Page 0, Register 14 - DAC reference */
+#define TAS5754M_SDAC        (7 << 4)
+#define TAS5754M_SDAC_SHIFT  4
+#define TAS5754M_SDAC_MCK    (0 << 4)
+#define TAS5754M_SDAC_PLL    (1 << 4)
+#define TAS5754M_SDAC_SCK    (3 << 4)
+#define TAS5754M_SDAC_BCK    (4 << 4)
+#define TAS5754M_SDAC_GPIO   (5 << 4)
+
+/* Page 0, Register 16, 18 - GPIO source for DAC, PLL */
+#define TAS5754M_GREF        (7 << 0)
+#define TAS5754M_GREF_SHIFT  0
+#define TAS5754M_GREF_GPIO1  (0 << 0)
+#define TAS5754M_GREF_GPIO2  (1 << 0)
+#define TAS5754M_GREF_GPIO3  (2 << 0)
+#define TAS5754M_GREF_GPIO4  (3 << 0)
+#define TAS5754M_GREF_GPIO5  (4 << 0)
+#define TAS5754M_GREF_GPIO6  (5 << 0)
+
+/* Page 0, Register 19 - synchronize */
+#define TAS5754M_RQSY        (1 << 0)
+#define TAS5754M_RQSY_RESUME (0 << 0)
+#define TAS5754M_RQSY_HALT   (1 << 0)
+
+/* Page 0, Register 34 - fs speed mode */
+#define TAS5754M_FSSP        (3 << 0)
+#define TAS5754M_FSSP_SHIFT  0
+#define TAS5754M_FSSP_48KHZ  (0 << 0)
+#define TAS5754M_FSSP_96KHZ  (1 << 0)
+#define TAS5754M_FSSP_192KHZ (2 << 0)
+#define TAS5754M_FSSP_384KHZ (3 << 0)
+
+/* Page 0, Register 37 - Error detection */
+#define TAS5754M_IPLK (1 << 0)
+#define TAS5754M_DCAS (1 << 1)
+#define TAS5754M_IDCM (1 << 2)
+#define TAS5754M_IDCH (1 << 3)
+#define TAS5754M_IDSK (1 << 4)
+#define TAS5754M_IDBK (1 << 5)
+#define TAS5754M_IDFS (1 << 6)
+
+/* Page 0, Register 40 - I2S configuration */
+#define TAS5754M_ALEN       (3 << 0)
+#define TAS5754M_ALEN_SHIFT 0
+#define TAS5754M_ALEN_16    (0 << 0)
+#define TAS5754M_ALEN_20    (1 << 0)
+#define TAS5754M_ALEN_24    (2 << 0)
+#define TAS5754M_ALEN_32    (3 << 0)
+#define TAS5754M_AFMT       (3 << 4)
+#define TAS5754M_AFMT_SHIFT 4
+#define TAS5754M_AFMT_I2S   (0 << 4)
+#define TAS5754M_AFMT_DSP   (1 << 4)
+#define TAS5754M_AFMT_RTJ   (2 << 4)
+#define TAS5754M_AFMT_LTJ   (3 << 4)
+
+/* Page 0, Register 42 - DAC routing */
+#define TAS5754M_AUPR_SHIFT 0
+#define TAS5754M_AUPL_SHIFT 4
+
+/* Page 0, Register 59 - auto mute */
+#define TAS5754M_ATMR_SHIFT 0
+#define TAS5754M_ATML_SHIFT 4
+
+/* Page 0, Register 63 - ramp rates */
+#define TAS5754M_VNDF_SHIFT 6
+#define TAS5754M_VNDS_SHIFT 4
+#define TAS5754M_VNUF_SHIFT 2
+#define TAS5754M_VNUS_SHIFT 0
+
+/* Page 0, Register 64 - emergency ramp rates */
+#define TAS5754M_VEDF_SHIFT 6
+#define TAS5754M_VEDS_SHIFT 4
+
+/* Page 0, Register 65 - Digital mute enables */
+#define TAS5754M_ACTL_SHIFT 2
+#define TAS5754M_AMLE_SHIFT 1
+#define TAS5754M_AMRE_SHIFT 0
+
+/* Page 0, Register 80-85, GPIO output selection */
+#define TAS5754M_GxSL       (31 << 0)
+#define TAS5754M_GxSL_SHIFT 0
+#define TAS5754M_GxSL_OFF   (0 << 0)
+#define TAS5754M_GxSL_DSP   (1 << 0)
+#define TAS5754M_GxSL_REG   (2 << 0)
+#define TAS5754M_GxSL_AMUTB (3 << 0)
+#define TAS5754M_GxSL_AMUTL (4 << 0)
+#define TAS5754M_GxSL_AMUTR (5 << 0)
+#define TAS5754M_GxSL_CLKI  (6 << 0)
+#define TAS5754M_GxSL_SDOUT (7 << 0)
+#define TAS5754M_GxSL_ANMUL (8 << 0)
+#define TAS5754M_GxSL_ANMUR (9 << 0)
+#define TAS5754M_GxSL_PLLLK (10 << 0)
+#define TAS5754M_GxSL_CPCLK (11 << 0)
+#define TAS5754M_GxSL_UV0_7 (14 << 0)
+#define TAS5754M_GxSL_UV0_3 (15 << 0)
+#define TAS5754M_GxSL_PLLCK (16 << 0)
+
+/* Page 1, Register 2 - analog volume control */
+#define TAS5754M_RAGN_SHIFT 0
+#define TAS5754M_LAGN_SHIFT 4
+
+/* Page 1, Register 7 - analog boost control */
+#define TAS5754M_AGBR_SHIFT 0
+#define TAS5754M_AGBL_SHIFT 4
+
+#endif

base-commit: f6274b06e326d8471cdfb52595f989a90f5e888f
-- 
2.17.1

