Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEE69077F5
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:12:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D95721A1;
	Thu, 13 Jun 2024 18:12:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D95721A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718295177;
	bh=F7t41YxwbZ+JZhzKxPa6GixOWNEMrL9IazFhiBFPrTY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SFmO5L+3L5Xs6jQewevjTldFkP+Rqi5T9cFqv2Tp2aZun9WP7n4S2xaLBSQr9gAh/
	 Rvjeq0tNPcNK2Ib+rIwgBPk4wbXvgxWfYPFVf+Q0tzeGdXjq1NI5Ggl64bVL2P752K
	 lV29lq4E8wGkA5WUzC7xUWhRJ91xmHEft69g69bo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E33AAF80759; Thu, 13 Jun 2024 18:04:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B391F898A8;
	Thu, 13 Jun 2024 18:04:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48D3FF8028D; Mon, 10 Jun 2024 12:25:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22C76F80130
	for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2024 12:24:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22C76F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=XvRT24as
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-57c6011d75dso2775750a12.3
        for <alsa-devel@alsa-project.org>;
 Mon, 10 Jun 2024 03:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718015096;
 x=1718619896; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=txTOXblNJzLxUZIn6OBj8f2EMGK7IiuwmDr4Fh0AF7A=;
        b=XvRT24as/A/uVVYR7trQk0jh3Ewn0Fu0S4oXLCDvLSMCkycwUDZCi4mFq01USwHZji
         gW42o/Gcue4h+e3WtsCFB+o3746J6TM+q0epOMJ38Y+tDPvGSNUgqiTW9mghJoC5HsF5
         hAlrih2GghoVmMTcsGmq3q9vSQuRRcHK1b578wvooGZFgDVB9zA2PsDGd8ZrcrsmEwbw
         dy+wME+gUO1yVY/yfwBrlGrFzFdm0mHyJ7ThFyPmAfQCHTrtNML3YK+b0cESfwT8x3fO
         bMf2ZksVCQnqZAHwiOz8JwqBaYbKatr/ScDzpJ7nurULgjbzV4H8YOTnw+X0ri89UJS6
         k0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718015096; x=1718619896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=txTOXblNJzLxUZIn6OBj8f2EMGK7IiuwmDr4Fh0AF7A=;
        b=huk9bodBmUfphUZD2f3jN5optd/bGtU1TVm2PllNRWf1d7gigJD28saLhjI95yzGQI
         WbiIQmMq79soDzwF/f/o7SLZNTjua3DfuN97lFEmMuyiJmIXt31iRMP8oA2Tf0hiIRIm
         fqxZJClrJ6CLKf+voEicjO2CF0Ew3rOYPgg8Wo74RFdwykLF+CHPMWqT4lER0JELuKjU
         jSW22ph3TxW0EDEqY1k4a9LLJ50sxU6+mwlj0fL23NMinkOSvX8xNVBFffrAAnMfDpuB
         qwpuWPALdUMV43cjbH3h0wwGs2r1AEbrDdMh9kID/r2OukXi6P0YSq6OXQrTLnzcjg90
         N2lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0l652JkpT4myvn3BWzvgAZ14wKQ1NYonpyQx+UX7Z0sGefR6HxyOvqFnA0zTz23UaJ0BdN3o6cKwC7CoI2O73dK3EWk/luR5oKYA=
X-Gm-Message-State: AOJu0YwC/02A4HSgWNnDrT6/alIapKkFlsrTfsBsmvvebKXo37l6igsH
	ngMJy16Ngg0SPnnHiXg/kvp+Bl5navqinhq3KgWTl8lz2c9A8LsNkeWywvSUaDw=
X-Google-Smtp-Source: 
 AGHT+IGth2c6jD3XWQwliIXoP7Ct/Jhe/UQvCZTzJidYvDnFOKh56tUSAaZqhpSgfWWtIGKcsjTwUw==
X-Received: by 2002:a17:906:7109:b0:a6f:266d:adc2 with SMTP id
 a640c23a62f3a-a6f266db1bdmr89055966b.14.1718015095549;
        Mon, 10 Jun 2024 03:24:55 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f1b3b2d7esm166216066b.24.2024.06.10.03.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 03:24:55 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: 
Cc: piotr.wojtaszczyk@timesys.com,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Russell King <linux@armlinux.org.uk>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs
Date: Mon, 10 Jun 2024 12:24:07 +0200
Message-Id: <20240610102415.79740-1-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: piotr.wojtaszczyk@timesys.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AP6EICZGXUIJ63FSA6UG2M3U27OU4XV2
X-Message-ID-Hash: AP6EICZGXUIJ63FSA6UG2M3U27OU4XV2
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:04:29 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AP6EICZGXUIJ63FSA6UG2M3U27OU4XV2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver was ported from an old version in linux 2.6.27 and adjusted
for the new ASoC framework and DMA API.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
 .../bindings/sound/nxp,lpc3220-i2s.yaml       |  50 +++
 arch/arm/boot/dts/lpc32xx.dtsi                |   4 +
 arch/arm/mach-lpc32xx/phy3250.c               |  60 +++
 sound/soc/fsl/Kconfig                         |   7 +
 sound/soc/fsl/Makefile                        |   2 +
 sound/soc/fsl/lpc3xxx-i2s.c                   | 411 ++++++++++++++++++
 sound/soc/fsl/lpc3xxx-i2s.h                   |  94 ++++
 sound/soc/fsl/lpc3xxx-pcm.c                   |  75 ++++
 8 files changed, 703 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
 create mode 100644 sound/soc/fsl/lpc3xxx-i2s.c
 create mode 100644 sound/soc/fsl/lpc3xxx-i2s.h
 create mode 100644 sound/soc/fsl/lpc3xxx-pcm.c

diff --git a/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml b/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
new file mode 100644
index 000000000000..e41330b6775c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nxp,lpc3220-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC32XX I2S Controller
+
+description:
+  The block adds I2S and PCM drivers for LPC32XX
+
+properties:
+  compatible:
+    enum:
+      - nxp,lpc3220-i2s
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: input clock of the peripheral.
+
+  clock-names:
+    items:
+      - const: i2s_clk
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/lpc32xx-clock.h>
+
+    i2s0: i2s@20094000 {
+      compatible = "nxp,lpc3220-i2s";
+      reg = <0x20094000 0x1000>;
+      clocks = <&clk LPC32XX_CLK_I2S0>;
+      clock-names = "i2s_clk";
+    };
+
+...
diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
index c87066d6c995..dc5738f2b42d 100644
--- a/arch/arm/boot/dts/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/lpc32xx.dtsi
@@ -221,6 +221,8 @@ spi2: spi@20090000 {
 			i2s0: i2s@20094000 {
 				compatible = "nxp,lpc3220-i2s";
 				reg = <0x20094000 0x1000>;
+				clocks = <&clk LPC32XX_CLK_I2S0>;
+				clock-names = "i2s_clk";
 				status = "disabled";
 			};
 
@@ -237,6 +239,8 @@ sd: sd@20098000 {
 			i2s1: i2s@2009c000 {
 				compatible = "nxp,lpc3220-i2s";
 				reg = <0x2009c000 0x1000>;
+				clocks = <&clk LPC32XX_CLK_I2S1>;
+				clock-names = "i2s_clk";
 				status = "disabled";
 			};
 
diff --git a/arch/arm/mach-lpc32xx/phy3250.c b/arch/arm/mach-lpc32xx/phy3250.c
index 66701bf43248..b866b9a75558 100644
--- a/arch/arm/mach-lpc32xx/phy3250.c
+++ b/arch/arm/mach-lpc32xx/phy3250.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/amba/pl08x.h>
+#include <linux/amba/pl022.h>
 #include <linux/mtd/lpc32xx_mlc.h>
 #include <linux/mtd/lpc32xx_slc.h>
 #include <linux/of_platform.h>
@@ -29,6 +30,46 @@ static struct pl08x_channel_data pl08x_slave_channels[] = {
 		.max_signal = 12,
 		.periph_buses = PL08X_AHB1,
 	},
+	{
+		.bus_id = "i2s-tx",
+		.min_signal = 13,
+		.max_signal = 13,
+		.periph_buses = PL08X_AHB1,
+	},
+	{
+		.bus_id = "i2s-rx",
+		.min_signal = 0,
+		.max_signal = 0,
+		.periph_buses = PL08X_AHB1,
+	},
+	{
+		.bus_id = "ssp0-tx",
+		.min_signal = 15,
+		.max_signal = 15,
+		.muxval = 1,
+		.periph_buses = PL08X_AHB1,
+	},
+	{
+		.bus_id = "ssp0-rx",
+		.min_signal = 14,
+		.max_signal = 14,
+		.muxval = 1,
+		.periph_buses = PL08X_AHB1,
+	},
+	{
+		.bus_id = "ssp1-tx",
+		.min_signal = 11,
+		.max_signal = 11,
+		.muxval = 1,
+		.periph_buses = PL08X_AHB1,
+	},
+	{
+		.bus_id = "ssp1-rx",
+		.min_signal = 3,
+		.max_signal = 3,
+		.muxval = 1,
+		.periph_buses = PL08X_AHB1,
+	},
 };
 
 static int pl08x_get_signal(const struct pl08x_channel_data *cd)
@@ -60,12 +101,31 @@ static struct lpc32xx_mlc_platform_data lpc32xx_mlc_data = {
 	.dma_filter = pl08x_filter_id,
 };
 
+static struct pl022_ssp_controller lpc32xx_ssp_data[] = {
+	{
+		.bus_id = 0,
+		.enable_dma = 0,
+		.dma_filter = pl08x_filter_id,
+		.dma_tx_param = "ssp0-tx",
+		.dma_rx_param = "ssp0-rx",
+	},
+	{
+		.bus_id = 1,
+		.enable_dma = 0,
+		.dma_filter = pl08x_filter_id,
+		.dma_tx_param = "ssp1-tx",
+		.dma_rx_param = "ssp1-rx",
+	}
+};
+
 static const struct of_dev_auxdata lpc32xx_auxdata_lookup[] __initconst = {
 	OF_DEV_AUXDATA("arm,pl080", 0x31000000, "pl08xdmac", &pl08x_pd),
 	OF_DEV_AUXDATA("nxp,lpc3220-slc", 0x20020000, "20020000.flash",
 		       &lpc32xx_slc_data),
 	OF_DEV_AUXDATA("nxp,lpc3220-mlc", 0x200a8000, "200a8000.flash",
 		       &lpc32xx_mlc_data),
+	OF_DEV_AUXDATA("arm,pl022", 0x20084000, NULL, &lpc32xx_ssp_data[0]),
+	OF_DEV_AUXDATA("arm,pl022", 0x2008c000, NULL, &lpc32xx_ssp_data[1]),
 	{ }
 };
 
diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 258306d8ce51..5f25aa7d632c 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -132,6 +132,13 @@ config SND_SOC_FSL_RPMSG
 	  This option is only useful for out-of-tree drivers since
 	  in-tree drivers select it automatically.
 
+config SND_SOC_FSL_LPC3XXX
+	tristate "SoC Audio for NXP LPC32XX CPUs"
+	depends on ARCH_LPC32XX && SND_SOC
+	select SND_SOC_GENERIC_DMAENGINE_PCM
+	help
+	  Say Y or M if you want to add support for the LPC3XXX I2S interface.
+
 config SND_SOC_IMX_PCM_DMA
 	tristate
 	select SND_SOC_GENERIC_DMAENGINE_PCM
diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile
index 9f743fcc0e02..988dc98cdfc6 100644
--- a/sound/soc/fsl/Makefile
+++ b/sound/soc/fsl/Makefile
@@ -29,6 +29,7 @@ snd-soc-fsl-easrc-objs := fsl_easrc.o
 snd-soc-fsl-xcvr-objs := fsl_xcvr.o
 snd-soc-fsl-aud2htx-objs := fsl_aud2htx.o
 snd-soc-fsl-rpmsg-objs := fsl_rpmsg.o
+snd-soc-fsl-lpc3xxx-objs := lpc3xxx-pcm.o lpc3xxx-i2s.o
 
 obj-$(CONFIG_SND_SOC_FSL_AUDMIX) += snd-soc-fsl-audmix.o
 obj-$(CONFIG_SND_SOC_FSL_ASOC_CARD) += snd-soc-fsl-asoc-card.o
@@ -45,6 +46,7 @@ obj-$(CONFIG_SND_SOC_POWERPC_DMA) += snd-soc-fsl-dma.o
 obj-$(CONFIG_SND_SOC_FSL_XCVR) += snd-soc-fsl-xcvr.o
 obj-$(CONFIG_SND_SOC_FSL_AUD2HTX) += snd-soc-fsl-aud2htx.o
 obj-$(CONFIG_SND_SOC_FSL_RPMSG) += snd-soc-fsl-rpmsg.o
+obj-$(CONFIG_SND_SOC_FSL_LPC3XXX) += snd-soc-fsl-lpc3xxx.o
 
 # MPC5200 Platform Support
 obj-$(CONFIG_SND_MPC52xx_DMA) += mpc5200_dma.o
diff --git a/sound/soc/fsl/lpc3xxx-i2s.c b/sound/soc/fsl/lpc3xxx-i2s.c
new file mode 100644
index 000000000000..853284eb14f1
--- /dev/null
+++ b/sound/soc/fsl/lpc3xxx-i2s.c
@@ -0,0 +1,411 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Author: Kevin Wells <kevin.wells@nxp.com>
+ *
+ * Copyright (C) 2008 NXP Semiconductors
+ * Copyright 2023 Timesys Corporation <piotr.wojtaszczyk@timesys.com>
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/interrupt.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/initval.h>
+#include <sound/soc.h>
+
+#include "lpc3xxx-i2s.h"
+
+#define I2S_PLAYBACK_FLAG 0x1
+#define I2S_CAPTURE_FLAG 0x2
+
+#define LPC3XXX_I2S_RATES ( \
+	SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_22050 | \
+	SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 | \
+	SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000)
+
+#define LPC3XXX_I2S_FORMATS ( \
+	SNDRV_PCM_FMTBIT_S8 | \
+	SNDRV_PCM_FMTBIT_S16_LE | \
+	SNDRV_PCM_FMTBIT_S32_LE)
+
+static u32 absd32(u32 v1, u32 v2)
+{
+	if (v1 > v2) {
+		return v1 - v2;
+	}
+	return v2 - v1;
+}
+
+static void __lpc3xxx_find_clkdiv(u32 *clkx, u32 *clky, int freq,
+				  int xbytes, u32 clkrate)
+{
+	u32 i2srate;
+	u32 idxx, idyy;
+	u32 savedbitclkrate, diff, trate, baseclk;
+
+	/* Adjust rate for sample size (bits) and 2 channels and offset for
+	 * divider in clock output
+	 */
+	i2srate = (freq / 100) * 2 * (8 * xbytes);
+	i2srate = i2srate << 1;
+	clkrate = clkrate / 100;
+	baseclk = clkrate;
+	*clkx = 1;
+	*clky = 1;
+
+	/* Find the best divider */
+	*clkx = *clky = 0;
+	savedbitclkrate = 0;
+	diff = ~0;
+	for (idxx = 1; idxx < 0xFF; idxx++) {
+		for (idyy = 1; idyy < 0xFF; idyy++) {
+			trate = (baseclk * idxx) / idyy;
+			if (absd32(trate, i2srate) < diff) {
+				diff = absd32(trate, i2srate);
+				savedbitclkrate = trate;
+				*clkx = idxx;
+				*clky = idyy;
+			}
+		}
+	}
+}
+
+static int lpc3xxx_i2s_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai)
+{
+	struct lpc3xxx_i2s_info *i2s_info_p = snd_soc_dai_get_drvdata(cpu_dai);
+	struct device *dev = i2s_info_p->dev;
+	u32 flag;
+	int ret = 0;
+
+	mutex_lock(&i2s_info_p->lock);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		flag = I2S_PLAYBACK_FLAG;
+	} else {
+		flag = I2S_CAPTURE_FLAG;
+	}
+
+	if (flag & i2s_info_p->streams_in_use) {
+		dev_warn(dev, "I2S channel is busy\n");
+		ret = -EBUSY;
+		goto lpc32xx_unlock;
+	}
+
+	if (i2s_info_p->streams_in_use == 0) {
+		ret = clk_prepare_enable(i2s_info_p->clk);
+		if (ret) {
+			dev_err(dev, "Can't enable clock, err=%d\n", ret);
+			goto lpc32xx_unlock;
+		}
+	}
+
+	i2s_info_p->streams_in_use |= flag;
+
+lpc32xx_unlock:
+	mutex_unlock(&i2s_info_p->lock);
+	return ret;
+}
+
+static void lpc3xxx_i2s_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai)
+{
+	struct lpc3xxx_i2s_info *i2s_info_p = snd_soc_dai_get_drvdata(cpu_dai);
+	struct regmap *regs = i2s_info_p->regs;
+	const u32 stop_bits = (I2S_RESET | I2S_STOP);
+	u32 flag;
+
+	mutex_lock(&i2s_info_p->lock);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		flag = I2S_PLAYBACK_FLAG;
+		regmap_write(regs, I2S_TX_RATE, 0);
+		regmap_update_bits(regs, I2S_DAO, stop_bits, stop_bits);
+	} else {
+		flag = I2S_CAPTURE_FLAG;
+		regmap_write(regs, I2S_RX_RATE, 0);
+		regmap_update_bits(regs, I2S_DAI, stop_bits, stop_bits);
+	}
+	i2s_info_p->streams_in_use &= ~flag;
+
+	if (i2s_info_p->streams_in_use == 0) {
+		clk_disable_unprepare(i2s_info_p->clk);
+	}
+
+	mutex_unlock(&i2s_info_p->lock);
+}
+
+static int lpc3xxx_i2s_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
+				      int clk_id, unsigned int freq, int dir)
+{
+	struct lpc3xxx_i2s_info *i2s_info_p = snd_soc_dai_get_drvdata(cpu_dai);
+
+	/* Will use in HW params later */
+	i2s_info_p->freq = freq;
+
+	return 0;
+}
+
+static int lpc3xxx_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai,
+				   unsigned int fmt)
+{
+	struct lpc3xxx_i2s_info *i2s_info_p = snd_soc_dai_get_drvdata(cpu_dai);
+	struct device *dev = i2s_info_p->dev;
+
+	if ((fmt & SND_SOC_DAIFMT_FORMAT_MASK) != SND_SOC_DAIFMT_I2S) {
+		dev_warn(dev, "unsupported bus format %d\n", fmt);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int lpc3xxx_i2s_hw_params(struct snd_pcm_substream *substream,
+			struct snd_pcm_hw_params *params, struct snd_soc_dai *cpu_dai)
+{
+	struct lpc3xxx_i2s_info *i2s_info_p = snd_soc_dai_get_drvdata(cpu_dai);
+	struct device *dev = i2s_info_p->dev;
+	struct regmap *regs = i2s_info_p->regs;
+	int xfersize;
+	u32 tmp, clkx, clky;
+
+	tmp = I2S_RESET | I2S_STOP;
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S8:
+		tmp |= I2S_WW8 | I2S_WS_HP(I2S_WW8_HP);
+		xfersize = 1;
+		break;
+
+	case SNDRV_PCM_FORMAT_S16_LE:
+		tmp |= I2S_WW16 | I2S_WS_HP(I2S_WW16_HP);
+		xfersize = 2;
+		break;
+
+	case SNDRV_PCM_FORMAT_S32_LE:
+		tmp |= I2S_WW32 | I2S_WS_HP(I2S_WW32_HP);
+		xfersize = 4;
+		break;
+
+	default:
+		dev_warn(dev, "Unsupported audio data format %d\n",
+				params_format(params));
+		return -EINVAL;
+	}
+
+	if (params_channels(params) == 1) {
+		tmp |= I2S_MONO;
+	}
+
+	__lpc3xxx_find_clkdiv(&clkx, &clky, i2s_info_p->freq, xfersize, i2s_info_p->clkrate);
+
+	dev_dbg(dev, "Stream                : %s\n",
+		substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? "playback" : "capture");
+	dev_dbg(dev, "Desired clock rate    : %d\n", i2s_info_p->freq);
+	dev_dbg(dev, "Base clock rate       : %d\n", i2s_info_p->clkrate);
+	dev_dbg(dev, "Transfer size (bytes) : %d\n", xfersize);
+	dev_dbg(dev, "Clock divider (x)     : %d\n", clkx);
+	dev_dbg(dev, "Clock divider (y)     : %d\n", clky);
+	dev_dbg(dev, "Channels              : %d\n", params_channels(params));
+	dev_dbg(dev, "Data format           : %s\n", "I2S");
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		regmap_write(regs, I2S_DMA1, I2S_DMA1_TX_EN | I2S_DMA0_TX_DEPTH(4));
+		regmap_write(regs, I2S_TX_RATE, (clkx << 8) | clky);
+		regmap_write(regs, I2S_DAO, tmp);
+	} else {
+		regmap_write(regs, I2S_DMA0, I2S_DMA0_RX_EN | I2S_DMA1_RX_DEPTH(4));
+		regmap_write(regs, I2S_RX_RATE, (clkx << 8) | clky);
+		regmap_write(regs, I2S_DAI, tmp);
+	}
+
+	return 0;
+}
+
+static int lpc3xxx_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai)
+{
+	return 0;
+}
+
+static int lpc3xxx_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
+								struct snd_soc_dai *cpu_dai)
+{
+	struct lpc3xxx_i2s_info *i2s_info_p = snd_soc_dai_get_drvdata(cpu_dai);
+	struct regmap *regs = i2s_info_p->regs;
+	int ret = 0;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			regmap_update_bits(regs, I2S_DAO, I2S_STOP, I2S_STOP);
+		} else {
+			regmap_update_bits(regs, I2S_DAI, I2S_STOP, I2S_STOP);
+		}
+		break;
+
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+	case SNDRV_PCM_TRIGGER_RESUME:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			regmap_update_bits(regs, I2S_DAO, (I2S_RESET | I2S_STOP), 0);
+		} else {
+			regmap_update_bits(regs, I2S_DAI, (I2S_RESET | I2S_STOP), 0);
+		}
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+const struct snd_soc_dai_ops lpc3xxx_i2s_dai_ops = {
+	.startup = lpc3xxx_i2s_startup,
+	.shutdown = lpc3xxx_i2s_shutdown,
+	.prepare = lpc3xxx_i2s_prepare,
+	.trigger = lpc3xxx_i2s_trigger,
+	.hw_params = lpc3xxx_i2s_hw_params,
+	.set_sysclk = lpc3xxx_i2s_set_dai_sysclk,
+	.set_fmt = lpc3xxx_i2s_set_dai_fmt,
+};
+
+static int lpc3xxx_i2s_dai_probe(struct snd_soc_dai *dai)
+{
+	struct lpc3xxx_i2s_info *i2s_info_p = snd_soc_dai_get_drvdata(dai);
+
+	snd_soc_dai_init_dma_data(dai, &i2s_info_p->playback_dma_config,
+							&i2s_info_p->capture_dma_config);
+	return 0;
+}
+
+struct snd_soc_dai_driver lpc3xxx_i2s_dai_driver = {
+	 .probe	= lpc3xxx_i2s_dai_probe,
+	 .playback = {
+		      .channels_min = 1,
+		      .channels_max = 2,
+		      .rates = LPC3XXX_I2S_RATES,
+		      .formats = LPC3XXX_I2S_FORMATS,
+		      },
+	 .capture = {
+		     .channels_min = 1,
+		     .channels_max = 2,
+		     .rates = LPC3XXX_I2S_RATES,
+		     .formats = LPC3XXX_I2S_FORMATS,
+		     },
+	 .ops = &lpc3xxx_i2s_dai_ops,
+	 .symmetric_rate = 1,
+	 .symmetric_channels = 1,
+	 .symmetric_sample_bits = 1,
+};
+
+static const struct snd_soc_component_driver lpc32xx_i2s_component = {
+	.name = "lpc32xx-i2s",
+};
+
+static const struct regmap_config lpc32xx_i2s_regconfig = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = I2S_RX_RATE,
+};
+
+static int lpc32xx_i2s_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct lpc3xxx_i2s_info *i2s_info_p;
+	struct resource *res;
+	void __iomem *iomem;
+	int ret;
+
+	i2s_info_p = devm_kzalloc(dev, sizeof(*i2s_info_p), GFP_KERNEL);
+	if (!i2s_info_p)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, i2s_info_p);
+	i2s_info_p->dev = dev;
+
+	iomem = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(iomem)) {
+		dev_err(dev, "Can't map registers\n");
+		return PTR_ERR(iomem);
+	}
+
+	i2s_info_p->regs = devm_regmap_init_mmio(dev, iomem, &lpc32xx_i2s_regconfig);
+	if (IS_ERR(i2s_info_p->regs)) {
+		ret = PTR_ERR(i2s_info_p->regs);
+		dev_err(dev, "failed to init register map: %d\n", ret);
+		return ret;
+	}
+
+	i2s_info_p->clk = devm_clk_get(dev, "i2s_clk");
+	if (IS_ERR(i2s_info_p->clk)) {
+		dev_err(dev, "Can't get clock\n");
+		return PTR_ERR(i2s_info_p->clk);
+	}
+
+	i2s_info_p->clkrate = clk_get_rate(i2s_info_p->clk);
+	if (i2s_info_p->clkrate == 0) {
+		dev_err(dev, "Invalid returned clock rate\n");
+		goto err_clk_disable;
+	}
+
+	mutex_init(&i2s_info_p->lock);
+
+	ret = devm_snd_soc_register_component(dev, &lpc32xx_i2s_component,
+					 &lpc3xxx_i2s_dai_driver, 1);
+	if (ret) {
+		dev_err(dev, "Can't register cpu_dai component\n");
+		goto err_clk_disable;
+	}
+
+	i2s_info_p->playback_dma_config.addr = (dma_addr_t)(res->start + I2S_TX_FIFO);
+	i2s_info_p->playback_dma_config.maxburst = 4;
+	i2s_info_p->playback_dma_config.filter_data = "i2s-tx";
+	i2s_info_p->capture_dma_config.addr = (dma_addr_t)(res->start + I2S_RX_FIFO);
+	i2s_info_p->capture_dma_config.maxburst = 4;
+	i2s_info_p->capture_dma_config.filter_data = "i2s-rx";
+
+	ret = lpc3xxx_pcm_register(pdev);
+	if (ret) {
+		dev_err(dev, "Can't register pcm component\n");
+		goto err_clk_disable;
+	}
+
+	return 0;
+
+err_clk_disable:
+	return ret;
+}
+
+static int lpc32xx_i2s_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static const struct of_device_id lpc32xx_i2s_match[] = {
+	{ .compatible = "nxp,lpc3220-i2s" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, lpc32xx_i2s_match);
+
+static struct platform_driver lpc32xx_i2s_driver = {
+	.probe = lpc32xx_i2s_probe,
+	.remove = lpc32xx_i2s_remove,
+	.driver		= {
+		.name	= "lpc3xxx-i2s",
+		.of_match_table = of_match_ptr(lpc32xx_i2s_match),
+	},
+};
+
+module_platform_driver(lpc32xx_i2s_driver);
+
+MODULE_AUTHOR("Kevin Wells <kevin.wells@nxp.com>");
+MODULE_AUTHOR("Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>");
+MODULE_DESCRIPTION("ASoC LPC3XXX I2S interface");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/fsl/lpc3xxx-i2s.h b/sound/soc/fsl/lpc3xxx-i2s.h
new file mode 100644
index 000000000000..f88ab74cfe41
--- /dev/null
+++ b/sound/soc/fsl/lpc3xxx-i2s.h
@@ -0,0 +1,94 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Author: Kevin Wells <kevin.wells@nxp.com>
+ *
+ * Copyright (C) 2008 NXP Semiconductors
+ * Copyright 2023 Timesys Corporation <piotr.wojtaszczyk@timesys.com>
+ */
+
+#ifndef __SOUND_SOC_LPC3XXX_I2S_H
+#define __SOUND_SOC_LPC3XXX_I2S_H
+
+#include <linux/types.h>
+#include <linux/regmap.h>
+
+struct lpc3xxx_i2s_info {
+	struct device *dev;
+	struct clk *clk;
+	struct mutex lock;
+	struct regmap *regs;
+	u32 streams_in_use;
+	u32 clkrate;
+	int freq;
+	struct snd_dmaengine_dai_dma_data playback_dma_config;
+	struct snd_dmaengine_dai_dma_data capture_dma_config;
+};
+
+int lpc3xxx_pcm_register(struct platform_device *pdev);
+
+#define _SBF(f, v) ((v) << (f))
+#define _BIT(n) _SBF(n, 1)
+
+/* I2S controller register offsets */
+#define I2S_DAO		0x00
+#define I2S_DAI		0x04
+#define I2S_TX_FIFO	0x08
+#define I2S_RX_FIFO	0x0C
+#define I2S_STAT	0x10
+#define I2S_DMA0	0x14
+#define I2S_DMA1	0x18
+#define I2S_IRQ		0x1C
+#define I2S_TX_RATE	0x20
+#define I2S_RX_RATE	0x24
+
+/* i2s_daO i2s_dai register definitions */
+#define I2S_WW8      _SBF(0, 0) /* Word width is 8bit*/
+#define I2S_WW16     _SBF(0, 1) /* Word width is 16bit*/
+#define I2S_WW32     _SBF(0, 3) /* Word width is 32bit*/
+#define I2S_MONO     _BIT(2)   /* Mono */
+#define I2S_STOP     _BIT(3)   /* Stop, diables the access to FIFO, mutes the channel */
+#define I2S_RESET    _BIT(4)   /* Reset the channel */
+#define I2S_WS_SEL   _BIT(5)   /* Channel Master(0) or slave(1) mode select*/
+#define I2S_WS_HP(s) _SBF(6, s) /* Word select half period - 1 */
+
+#define I2S_MUTE     _BIT(15)  /* Mute the channel, Transmit channel only */
+
+#define I2S_WW32_HP  0x1f /* Word select half period for 32bit word width */
+#define I2S_WW16_HP  0x0f /* Word select half period for 16bit word width */
+#define I2S_WW8_HP   0x7  /* Word select half period for 8bit word width */
+
+#define WSMASK_HP	  0X7FC /* Mask for WS half period bits */
+
+/* i2s_tx_fifo register definitions */
+#define I2S_FIFO_TX_WRITE(d)              (d)
+
+/* i2s_rx_fifo register definitions */
+#define I2S_FIFO_RX_WRITE(d)              (d)
+
+/* i2s_stat register definitions */
+#define I2S_IRQ_STAT     _BIT(0)
+#define I2S_DMA0_REQ     _BIT(1)
+#define I2S_DMA1_REQ     _BIT(2)
+
+#define I2S_RX_STATE_MASK	0x0000ff00
+#define I2S_TX_STATE_MASK	0x00ff0000
+
+/* i2s_dma0 Configuration register definitions */
+#define I2S_DMA0_RX_EN     _BIT(0)       /* Enable RX DMA1*/
+#define I2S_DMA0_TX_EN     _BIT(1)       /* Enable TX DMA1*/
+#define I2S_DMA0_RX_DEPTH(s)  _SBF(8, s)  /* Set the level for DMA1 RX Request */
+#define I2S_DMA0_TX_DEPTH(s)  _SBF(16, s) /* Set the level for DMA1 TX Request */
+
+/* i2s_dma1 Configuration register definitions */
+#define I2S_DMA1_RX_EN     _BIT(0)       /* Enable RX DMA1*/
+#define I2S_DMA1_TX_EN     _BIT(1)       /* Enable TX DMA1*/
+#define I2S_DMA1_RX_DEPTH(s)  _SBF(8, s) /* Set the level for DMA1 RX Request */
+#define I2S_DMA1_TX_DEPTH(s)  _SBF(16, s) /* Set the level for DMA1 TX Request */
+
+/* i2s_irq register definitions */
+#define I2S_RX_IRQ_EN     _BIT(0)       /* Enable RX IRQ*/
+#define I2S_TX_IRQ_EN     _BIT(1)       /* Enable TX IRQ*/
+#define I2S_IRQ_RX_DEPTH(s)  _SBF(8, s)  /* valid values ar 0 to 7 */
+#define I2S_IRQ_TX_DEPTH(s)  _SBF(16, s) /* valid values ar 0 to 7 */
+
+#endif
diff --git a/sound/soc/fsl/lpc3xxx-pcm.c b/sound/soc/fsl/lpc3xxx-pcm.c
new file mode 100644
index 000000000000..2dbc60d06452
--- /dev/null
+++ b/sound/soc/fsl/lpc3xxx-pcm.c
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Author: Kevin Wells <kevin.wells@nxp.com>
+ *
+ * Copyright (C) 2008 NXP Semiconductors
+ * Copyright 2023 Timesys Corporation <piotr.wojtaszczyk@timesys.com>
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/dma-mapping.h>
+#include <linux/amba/pl08x.h>
+
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/soc.h>
+
+#include "lpc3xxx-i2s.h"
+
+#define STUB_FORMATS	(SNDRV_PCM_FMTBIT_S8 | \
+			SNDRV_PCM_FMTBIT_U8 | \
+			SNDRV_PCM_FMTBIT_S16_LE | \
+			SNDRV_PCM_FMTBIT_U16_LE | \
+			SNDRV_PCM_FMTBIT_S24_LE | \
+			SNDRV_PCM_FMTBIT_U24_LE | \
+			SNDRV_PCM_FMTBIT_S32_LE | \
+			SNDRV_PCM_FMTBIT_U32_LE | \
+			SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE)
+
+
+static const struct snd_pcm_hardware lpc3xxx_pcm_hardware = {
+	.info = (SNDRV_PCM_INFO_MMAP |
+		 SNDRV_PCM_INFO_MMAP_VALID |
+		 SNDRV_PCM_INFO_INTERLEAVED |
+		 SNDRV_PCM_INFO_BLOCK_TRANSFER |
+		 SNDRV_PCM_INFO_PAUSE |
+		 SNDRV_PCM_INFO_RESUME),
+	.formats = STUB_FORMATS,
+	.period_bytes_min = 128,
+	.period_bytes_max = 2048,
+	.periods_min = 2,
+	.periods_max = 1024,
+	.buffer_bytes_max = 128 * 1024
+};
+
+static const struct snd_dmaengine_pcm_config lpc3xxx_dmaengine_pcm_config = {
+	.pcm_hardware = &lpc3xxx_pcm_hardware,
+	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
+	.compat_filter_fn = pl08x_filter_id,
+	.prealloc_buffer_size = 128 * 1024,
+};
+
+const struct snd_soc_component_driver lpc3xxx_soc_platform_driver = {
+	.name = "lpc32xx-pcm",
+};
+
+int lpc3xxx_pcm_register(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, &lpc3xxx_dmaengine_pcm_config,
+			SND_DMAENGINE_PCM_FLAG_NO_DT | SND_DMAENGINE_PCM_FLAG_COMPAT);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register dmaengine: %d\n", ret);
+		return ret;
+	}
+
+	return devm_snd_soc_register_component(&pdev->dev, &lpc3xxx_soc_platform_driver,
+					       NULL, 0);
+}
+EXPORT_SYMBOL(lpc3xxx_pcm_register);
-- 
2.25.1

