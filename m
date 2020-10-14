Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4090528E2B2
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 16:58:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68F201750;
	Wed, 14 Oct 2020 16:57:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68F201750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602687529;
	bh=Rord+He/z1lh82d9exeMAavaxSJ6FMYh6Iks54S3Rbk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OAHy7QZif7E4rRpfCj88C89rnifK422MJWka1NvOSb0QZmpFsKZrmjR13qQX+4WRX
	 nKWwkouWEgFVBh0giEw9XayGcF8/jqzYpbO7rBO7OIBWlD4VpcKtEOXV2C6KQZVlJq
	 YHX/+auTYu8BXFa8h2mJCbjqL6jG/AM/N+LiAIp0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14A8AF8029A;
	Wed, 14 Oct 2020 16:54:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7624F80226; Wed, 14 Oct 2020 16:54:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBF09F80226
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 16:54:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBF09F80226
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="FwuakYIu"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 09EEpi85023902; Wed, 14 Oct 2020 09:54:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=6q42qWMD+D2lwT7KzTwshNAxwHn6MNlVYveR8WVXLAg=;
 b=FwuakYIuTK2dq/uIj3cjOMtUZPxP7seXwxqFPYF/wQ9+p9DLTaF5VA+2rDaQaH5QCtSU
 GR5yaBWRi9BVP5SCYhK/lyNMtRa3rth5u2lxLoha6owZFI+zJSNcTlpzSpfh0/kT069J
 B0CIiAyJYKrumKb/S2PzwLbSa98mwwjzlG0WKqZDTdDb0qNGSS1R7RM6FYb4A4Y8E+us
 W64dcZ18SLLLsqFRp6JMQ8WPdx46bn8cPEyfKuBntyIyEYPllpyiEeZAcx4xACLZrc+X
 ZfIpL25F7dh+z1JgZYuc5rzNxgg5Dl8EEgRhg5tdMEFAA8+fgeOoguigFm3MgI/NAKuu Ow== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 343ac1wbwc-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 14 Oct 2020 09:54:38 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Wed, 14 Oct
 2020 15:54:35 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Wed, 14 Oct 2020 15:54:35 +0100
Received: from AUSNPC0LSNW1-debian.ad.cirrus.com (ausnpc0lsnw1.ad.cirrus.com
 [198.61.64.143])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1DC2345;
 Wed, 14 Oct 2020 14:54:35 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <nsaenzjulienne@suse.de>
Subject: [PATCH 6/7] ARM: dts: Add dts for Raspberry Pi 4 + Cirrus Logic
 Lochnagar2
Date: Wed, 14 Oct 2020 15:54:17 +0100
Message-ID: <20201014145418.31838-7-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201014145418.31838-1-rf@opensource.cirrus.com>
References: <20201014145418.31838-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010140108
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

This is based on the default bcm2711-rpi-4-b.dts.

Configurations are provided for Cirrus Logic codecs CS42L92, CS47L15,
CS47L24, CS47L35, CS47L90 and WM8998.

For each codec there is a sound node and a codec device node and both
default to disabled. Enable the pair for the codec in use.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 arch/arm/boot/dts/Makefile                    |    1 +
 .../dts/bcm2711-rpi4b-cirrus-lochnagar.dts    | 1296 +++++++++++++++++
 2 files changed, 1297 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi4b-cirrus-lochnagar.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 4572db3fa5ae..53db1be9552d 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -92,6 +92,7 @@ dtb-$(CONFIG_ARCH_BCM2835) += \
 	bcm2837-rpi-3-b-plus.dtb \
 	bcm2837-rpi-cm3-io3.dtb \
 	bcm2711-rpi-4-b.dtb \
+	bcm2711-rpi4b-cirrus-lochnagar.dtb \
 	bcm2835-rpi-zero.dtb \
 	bcm2835-rpi-zero-w.dtb
 dtb-$(CONFIG_ARCH_BCM_5301X) += \
diff --git a/arch/arm/boot/dts/bcm2711-rpi4b-cirrus-lochnagar.dts b/arch/arm/boot/dts/bcm2711-rpi4b-cirrus-lochnagar.dts
new file mode 100644
index 000000000000..80e31ea39af5
--- /dev/null
+++ b/arch/arm/boot/dts/bcm2711-rpi4b-cirrus-lochnagar.dts
@@ -0,0 +1,1296 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+#include "bcm2711.dtsi"
+#include "bcm2835-rpi.dtsi"
+#include "bcm283x-rpi-usb-peripheral.dtsi"
+#include <dt-bindings/clk/lochnagar.h>
+#include <dt-bindings/mfd/arizona.h>
+#include <dt-bindings/pinctrl/bcm2835.h>
+#include <dt-bindings/pinctrl/lochnagar.h>
+#include <dt-bindings/sound/madera.h>
+
+/ {
+	compatible = "raspberrypi,4-model-b", "brcm,bcm2711";
+	model = "Raspberry Pi 4 Model B";
+
+	chosen {
+		/* 8250 auxiliary UART instead of pl011 */
+		stdout-path = "serial1:115200n8";
+	};
+
+	/* Will be filled by the bootloader */
+	memory@0 {
+		device_type = "memory";
+		reg = <0 0 0>;
+	};
+
+	aliases {
+		emmc2bus = &emmc2bus;
+		ethernet0 = &genet;
+		pcie0 = &pcie0;
+	};
+
+	leds {
+		act {
+			gpios = <&gpio 42 GPIO_ACTIVE_HIGH>;
+		};
+
+		pwr {
+			label = "PWR";
+			gpios = <&expgpio 2 GPIO_ACTIVE_LOW>;
+			default-state = "keep";
+			linux,default-trigger = "default-on";
+		};
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&expgpio 1 GPIO_ACTIVE_LOW>;
+	};
+
+	sd_io_1v8_reg: sd_io_1v8_reg {
+		compatible = "regulator-gpio";
+		regulator-name = "vdd-sd-io";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-settling-time-us = <5000>;
+		gpios = <&expgpio 4 GPIO_ACTIVE_HIGH>;
+		states = <1800000 0x1
+			  3300000 0x0>;
+		status = "okay";
+	};
+
+	sd_vcc_reg: sd_vcc_reg {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-sd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		enable-active-high;
+		gpio = <&expgpio 6 GPIO_ACTIVE_HIGH>;
+	};
+
+	wallvdd: wallvdd@0 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "WALL_VDD_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	sound-cs47l15 {
+		status = "disabled";
+
+		compatible = "simple-audio-card";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		simple-audio-card,name = "Cirrus Logic CS47L15";
+
+		simple-audio-card,sysclks = <
+			&cs47l15 1 4 98304000 0
+			&cs47l15 8 4 147456000 0
+		>;
+		simple-audio-card,plls = <
+			&cs47l15 1 0 24576000 98304000
+		>;
+
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack";
+
+		simple-audio-card,routing =
+				"Microphone Jack", "MICBIAS1A",
+				"Microphone Jack", "MICBIAS1B",
+				"IN1BRN", "Microphone Jack",
+				"IN1BRP", "Microphone Jack",
+				"Headphone Jack", "HPOUTL",
+				"Headphone Jack", "HPOUTR";
+
+		/* Host->Codec I2S */
+		simple-audio-card,dai-link@0 {
+			reg = <0>;
+			format = "i2s";
+			bitclock-master = <&cs47l15_codec_dai>;
+			frame-master = <&cs47l15_codec_dai>;
+
+			cpu {
+				sound-dai = <&i2s 0>;
+			};
+
+			cs47l15_codec_dai: codec {
+				sound-dai = <&cs47l15 0>;
+
+				/* Prevent calls to dai_set_sysclk() */
+				system-clock-frequency = <0>;
+				mclk-fs = <0>;
+			};
+		};
+
+		/* Debug trace compressed stream */
+		simple-audio-card,dai-link@1 {
+			reg = <1>;
+
+			cpu {
+				sound-dai = <&cs47l15 3>;
+				system-clock-frequency = <0>;
+				mclk-fs = <0>;
+			};
+
+			codec {
+				sound-dai = <&cs47l15 4>;
+				system-clock-frequency = <0>;
+				mclk-fs = <0>;
+			};
+		};
+	};
+
+	sound-cs47l24 {
+		status = "disabled";
+
+		compatible = "simple-audio-card";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		simple-audio-card,name = "Cirrus Logic CS47L24";
+
+		simple-audio-card,sysclks = <
+			&cs47l24 1 4 147456000 0
+		>;
+		simple-audio-card,plls = <
+			&cs47l24 1 0 24576000 147456000	/* fll1 */
+			&cs47l24 3 1 32768 0		/* fll1 refclk */
+		>;
+
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack";
+
+		simple-audio-card,routing =
+				"Microphone Jack", "MICBIAS1",
+				"Microphone Jack", "MICBIAS2",
+				"IN1L", "Microphone Jack",
+				"IN1R", "Microphone Jack",
+				"Headphone Jack", "HPOUT1L",
+				"Headphone Jack", "HPOUT1R";
+
+		/* Host->Codec I2S */
+		simple-audio-card,dai-link@0 {
+			reg = <0>;
+			format = "i2s";
+			bitclock-master = <&cs47l24_codec_dai>;
+			frame-master = <&cs47l24_codec_dai>;
+
+			cpu {
+				sound-dai = <&i2s 0>;
+			};
+
+			cs47l24_codec_dai: codec {
+				sound-dai = <&cs47l24 0>;
+
+				/* Prevent calls to dai_set_sysclk() */
+				system-clock-frequency = <0>;
+				mclk-fs = <0>;
+			};
+		};
+
+		/* Debug trace compressed stream */
+		simple-audio-card,dai-link@1 {
+			reg = <1>;
+
+			cpu {
+				sound-dai = <&cs47l24 5>;
+				system-clock-frequency = <0>;
+				mclk-fs = <0>;
+			};
+
+			codec {
+				sound-dai = <&cs47l24 6>;
+				system-clock-frequency = <0>;
+				mclk-fs = <0>;
+			};
+		};
+
+		/* Voice control compressed stream */
+		simple-audio-card,dai-link@2 {
+			reg = <2>;
+
+			cpu {
+				sound-dai = <&cs47l24 3>;
+				system-clock-frequency = <0>;
+				mclk-fs = <0>;
+			};
+
+			codec {
+				sound-dai = <&cs47l24 4>;
+				system-clock-frequency = <0>;
+				mclk-fs = <0>;
+			};
+		};
+	};
+
+	sound-cs47l35 {
+		status = "disabled";
+
+		compatible = "simple-audio-card";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		simple-audio-card,name = "Cirrus Logic CS47L35";
+
+		simple-audio-card,sysclks = <
+			&cs47l35 1 4 98304000 0
+			&cs47l35 8 4 147456000 0
+		>;
+		simple-audio-card,plls = <
+			&cs47l35 1 0 24576000 98304000
+		>;
+
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack";
+
+		simple-audio-card,routing =
+				"Microphone Jack", "MICBIAS1A",
+				"Microphone Jack", "MICBIAS2A",
+				"IN1BLN", "Microphone Jack",
+				"IN1BLP", "Microphone Jack",
+				"Headphone Jack", "HPOUTL",
+				"Headphone Jack", "HPOUTR";
+
+		/* Host->Codec I2S */
+		simple-audio-card,dai-link@0 {
+			reg = <0>;
+			format = "i2s";
+			bitclock-master = <&cs47l35_codec_dai>;
+			frame-master = <&cs47l35_codec_dai>;
+
+			cpu {
+				sound-dai = <&i2s 0>;
+			};
+
+			cs47l35_codec_dai: codec {
+				sound-dai = <&cs47l35 0>;
+
+				/* Prevent calls to dai_set_sysclk() */
+				system-clock-frequency = <0>;
+				mclk-fs = <0>;
+			};
+		};
+
+		/* Debug trace compressed stream */
+		simple-audio-card,dai-link@1 {
+			reg = <1>;
+
+			cpu {
+				sound-dai = <&cs47l35 7>;
+				system-clock-frequency = <0>;
+				mclk-fs = <0>;
+			};
+
+			codec {
+				sound-dai = <&cs47l35 8>;
+				system-clock-frequency = <0>;
+				mclk-fs = <0>;
+			};
+		};
+
+		/* Voice control compressed stream */
+		simple-audio-card,dai-link@2 {
+			reg = <2>;
+
+			cpu {
+				sound-dai = <&cs47l35 5>;
+				system-clock-frequency = <0>;
+				mclk-fs = <0>;
+			};
+
+			codec {
+				sound-dai = <&cs47l35 6>;
+				system-clock-frequency = <0>;
+				mclk-fs = <0>;
+			};
+		};
+	};
+
+	sound-cs47l90 {
+		status = "disabled";
+
+		compatible = "simple-audio-card";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		simple-audio-card,name = "Cirrus Logic CS47L90";
+
+		simple-audio-card,sysclks = <
+			&cs47l90 1 4 98304000 0
+			&cs47l90 8 4 147456000 0
+		>;
+		simple-audio-card,plls = <
+			&cs47l90 1 0 24576000 98304000
+		>;
+
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack";
+
+		simple-audio-card,routing =
+				"Microphone Jack", "MICBIAS1A",
+				"Microphone Jack", "MICBIAS2A",
+				"IN1BRN", "Microphone Jack",
+				"IN1BRP", "Microphone Jack",
+				"Headphone Jack", "HPOUT1L",
+				"Headphone Jack", "HPOUT1R";
+
+		/* Host->Codec I2S */
+		simple-audio-card,dai-link@0 {
+			reg = <0>;
+			format = "i2s";
+			bitclock-master = <&cs47l90_codec_dai>;
+			frame-master = <&cs47l90_codec_dai>;
+
+			cpu {
+				sound-dai = <&i2s 0>;
+			};
+
+			cs47l90_codec_dai: codec {
+				sound-dai = <&cs47l90 0>;
+
+				/* Prevent calls to dai_set_sysclk() */
+				system-clock-frequency = <0>;
+				mclk-fs = <0>;
+			};
+		};
+
+		/* Debug trace compressed stream */
+		simple-audio-card,dai-link@1 {
+			reg = <1>;
+
+			cpu {
+				sound-dai = <&cs47l90 9>;
+				system-clock-frequency = <0>;
+				mclk-fs = <0>;
+			};
+
+			codec {
+				sound-dai = <&cs47l90 10>;
+				system-clock-frequency = <0>;
+				mclk-fs = <0>;
+			};
+		};
+
+		/* Voice control compressed stream */
+		simple-audio-card,dai-link@2 {
+			reg = <2>;
+
+			cpu {
+				sound-dai = <&cs47l90 7>;
+				system-clock-frequency = <0>;
+				mclk-fs = <0>;
+			};
+
+			codec {
+				sound-dai = <&cs47l90 8>;
+				system-clock-frequency = <0>;
+				mclk-fs = <0>;
+			};
+		};
+	};
+
+	sound-cs42l92 {
+		status = "disabled";
+
+		compatible = "simple-audio-card";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		simple-audio-card,name = "Cirrus Logic CS42L92";
+
+		simple-audio-card,sysclks = <
+			&cs42l92 1 4 98304000 0
+		>;
+		simple-audio-card,plls = <
+			&cs42l92 1 0 24576000 98304000
+		>;
+
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack";
+
+		simple-audio-card,routing =
+				"Microphone Jack", "MICBIAS1A",
+				"Microphone Jack", "MICBIAS1B",
+				"IN1BLN", "Microphone Jack",
+				"IN1BLP", "Microphone Jack",
+				"Headphone Jack", "HPOUT1L",
+				"Headphone Jack", "HPOUT1R";
+
+		/* Host->Codec I2S */
+		simple-audio-card,dai-link@0 {
+			reg = <0>;
+			format = "i2s";
+			bitclock-master = <&cs42l92_codec_dai>;
+			frame-master = <&cs42l92_codec_dai>;
+
+			cpu {
+				sound-dai = <&i2s 0>;
+			};
+
+			cs42l92_codec_dai: codec {
+				sound-dai = <&cs42l92 0>;
+
+				/* Prevent calls to dai_set_sysclk() */
+				system-clock-frequency = <0>;
+				mclk-fs = <0>;
+			};
+		};
+	};
+
+	sound-wm8998 {
+		status = "disabled";
+
+		compatible = "simple-audio-card";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		simple-audio-card,name = "Cirrus Logic WM8998";
+
+		simple-audio-card,sysclks = <
+			&wm8998 1 4 49152000 0
+		>;
+		simple-audio-card,plls = <
+			&wm8998 1 0 24576000 49152000
+			&wm8998 3 1 32768 0
+		>;
+
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack";
+
+		simple-audio-card,routing =
+				"Microphone Jack", "MICBIAS1",
+				"Microphone Jack", "MICBIAS1",
+				"IN2B", "Microphone Jack",
+				"Headphone Jack", "HPOUTL",
+				"Headphone Jack", "HPOUTR";
+
+		/* Host->Codec I2S */
+		simple-audio-card,dai-link@0 {
+			reg = <0>;
+			format = "i2s";
+			bitclock-master = <&wm8998_codec_dai>;
+			frame-master = <&wm8998_codec_dai>;
+
+			cpu {
+				sound-dai = <&i2s 0>;
+			};
+
+			wm8998_codec_dai: codec {
+				sound-dai = <&wm8998 0>;
+
+				/* Prevent calls to dai_set_sysclk() */
+				system-clock-frequency = <0>;
+				mclk-fs = <0>;
+			};
+		};
+	};
+};
+
+&firmware {
+	firmware_clocks: clocks {
+		compatible = "raspberrypi,firmware-clocks";
+		#clock-cells = <1>;
+	};
+
+	expgpio: gpio {
+		compatible = "raspberrypi,firmware-gpio";
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "BT_ON",
+				  "WL_ON",
+				  "PWR_LED_OFF",
+				  "GLOBAL_RESET",
+				  "VDD_SD_IO_SEL",
+				  "CAM_GPIO",
+				  "SD_PWR_ON",
+				  "";
+		status = "okay";
+	};
+};
+
+&gpio {
+	/*
+	 * Parts taken from rpi_SCH_4b_4p0_reduced.pdf and
+	 * the official GPU firmware DT blob.
+	 *
+	 * Legend:
+	 * "FOO" = GPIO line named "FOO" on the schematic
+	 * "FOO_N" = GPIO line named "FOO" on schematic, active low
+	 */
+	gpio-line-names = "ID_SDA",
+			  "ID_SCL",
+			  "SDA1",
+			  "SCL1",
+			  "GPIO_GCLK",
+			  "GPIO5",
+			  "GPIO6",
+			  "SPI_CE1_N",
+			  "SPI_CE0_N",
+			  "SPI_MISO",
+			  "SPI_MOSI",
+			  "SPI_SCLK",
+			  "GPIO12",
+			  "GPIO13",
+			  /* Serial port */
+			  "TXD1",
+			  "RXD1",
+			  "GPIO16",
+			  "GPIO17",
+			  "GPIO18",
+			  "GPIO19",
+			  "GPIO20",
+			  "GPIO21",
+			  "GPIO22",
+			  "GPIO23",
+			  "GPIO24",
+			  "GPIO25",
+			  "GPIO26",
+			  "GPIO27",
+			  "RGMII_MDIO",
+			  "RGMIO_MDC",
+			  /* Used by BT module */
+			  "CTS0",
+			  "RTS0",
+			  "TXD0",
+			  "RXD0",
+			  /* Used by Wifi */
+			  "SD1_CLK",
+			  "SD1_CMD",
+			  "SD1_DATA0",
+			  "SD1_DATA1",
+			  "SD1_DATA2",
+			  "SD1_DATA3",
+			  /* Shared with SPI flash */
+			  "PWM0_MISO",
+			  "PWM1_MOSI",
+			  "STATUS_LED_G_CLK",
+			  "SPIFLASH_CE_N",
+			  "SDA0",
+			  "SCL0",
+			  "RGMII_RXCLK",
+			  "RGMII_RXCTL",
+			  "RGMII_RXD0",
+			  "RGMII_RXD1",
+			  "RGMII_RXD2",
+			  "RGMII_RXD3",
+			  "RGMII_TXCLK",
+			  "RGMII_TXCTL",
+			  "RGMII_TXD0",
+			  "RGMII_TXD1",
+			  "RGMII_TXD2",
+			  "RGMII_TXD3";
+
+	lochnagar_present: lochnagar_present {
+		brcm,pins = <22>;
+		brcm,function = <BCM2835_FSEL_GPIO_OUT>;
+	};
+
+	lochnagar_reset: lochnagar_reset {
+		brcm,pins = <24>;
+		brcm,function = <BCM2835_FSEL_GPIO_OUT>;
+	};
+
+	cdc_irq: cdc_irq {
+		brcm,pins = <27>;
+		brcm,function = <BCM2835_FSEL_GPIO_IN>;
+	};
+
+	spi_pins: spi_pins {
+		brcm,pins = <9 10 11>;
+		brcm,function = <BCM2835_FSEL_ALT0>;
+	};
+
+	spi_cs: spi_cs {
+		brcm,pins = <7 8>;
+		brcm,function = <BCM2835_FSEL_GPIO_OUT>;
+	};
+
+	i2s_pins: i2s_pins {
+		brcm,pins = <18 19 20 21>;
+		brcm,function = <BCM2835_FSEL_ALT0>;
+	};
+};
+
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm1_0_gpio40 &pwm1_1_gpio41>;
+	status = "okay";
+};
+
+/* SDHCI is used to control the SDIO for wireless */
+&sdhci {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&emmc_gpio34>;
+	bus-width = <4>;
+	non-removable;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	status = "disabled";
+
+	brcmf: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
+
+/* EMMC2 is used to drive the SD card */
+&emmc2 {
+	vqmmc-supply = <&sd_io_1v8_reg>;
+	vmmc-supply = <&sd_vcc_reg>;
+	broken-cd;
+	status = "okay";
+};
+
+&genet {
+	phy-handle = <&phy1>;
+	phy-mode = "rgmii-rxid";
+	status = "okay";
+};
+
+&genet_mdio {
+	phy1: ethernet-phy@1 {
+		/* No PHY interrupt */
+		reg = <0x1>;
+	};
+};
+
+/* uart0 communicates with the BT module */
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_ctsrts_gpio30 &uart0_gpio32>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		max-speed = <2000000>;
+		shutdown-gpios = <&expgpio 0 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+/* uart1 is mapped to the pin header */
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_gpio14>;
+	status = "okay";
+};
+
+&vchiq {
+	interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&i2s {
+	status = "okay";
+	#sound-dai-cells = <1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2s_pins>;
+	dmas = <&dma 2>, <&dma 3>;
+	dma-names = "tx", "rx";
+};
+
+&i2c1 {
+	status = "okay";
+
+	lochnagar: lochnagar@22 {
+		status = "okay";
+
+		compatible = "cirrus,lochnagar2";
+		reg = <0x22>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&lochnagar_present &lochnagar_reset>;
+
+		reset-gpio = <&gpio 24 0>;
+		present-gpio = <&gpio 22 0>;
+
+		lochnagar_vdd1v8: VDD1V8 {
+			compatible = "regulator-fixed";
+
+			regulator-name = "VDD1V8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-boot-on;
+			regulator-always-on;
+
+			vin-supply = <&wallvdd>;
+		};
+
+		clk_pmic: clk_pmic {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+		};
+		clk_24m: clk_24m {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <24576000>;
+		};
+
+		lochnagar_clk: clk {
+			compatible = "cirrus,lochnagar2-clk";
+
+			#clock-cells = <1>;
+
+			clocks = <&clk_pmic>, <&clk_24m>;
+			clock-names = "ln-pmic-32k", "ln-clk-24m";
+
+			assigned-clocks = <&lochnagar_clk LOCHNAGAR_CDC_MCLK1>,
+					  <&lochnagar_clk LOCHNAGAR_CDC_MCLK2>,
+					  <&lochnagar_clk LOCHNAGAR_SOUNDCARD_MCLK>;
+			assigned-clock-parents = <&clk_24m>,
+						 <&clk_pmic>,
+						 <&clk_24m>;
+		};
+
+		lochnagar_pin: pin {
+			compatible = "cirrus,lochnagar-pinctrl";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lochnagar_pin 0 0 LOCHNAGAR2_PIN_NUM_GPIOS>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&pin_settings>;
+
+			pin_settings: pin_settings {
+				rpi_aif {
+					input-enable;
+					groups = "gf-aif1";
+					function = "codec-aif1";
+				};
+				codec_aif1 {
+					output-master;
+					groups = "codec-aif1";
+					function = "gf-aif1";
+				};
+				sc_codec_aif {
+					output-enable;
+					groups = "codec-aif2";
+					function = "soundcard-aif";
+				};
+				sc_lochnagar_aif {
+					input-enable;
+					groups = "soundcard-aif";
+					function = "codec-aif2";
+				};
+			};
+		};
+
+		lochnagar_hwmon: hwmon {
+			compatible = "cirrus,lochnagar2-hwmon";
+		};
+
+		lochnagar_micvdd: MICVDD {
+			compatible = "cirrus,lochnagar2-micvdd";
+
+			SYSVDD-supply = <&wallvdd>;
+
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+		};
+
+		MIC1VDD {
+			compatible = "cirrus,lochnagar2-mic1vdd";
+
+			regulator-always-on;
+			cirrus,micbias-input = <2>;
+		};
+
+		MIC2VDD {
+			compatible = "cirrus,lochnagar2-mic2vdd";
+
+			regulator-always-on;
+			cirrus,micbias-input = <3>;
+		};
+
+		lochnagar_vddcore: VDDCORE {
+			compatible = "cirrus,lochnagar2-vddcore";
+
+			SYSVDD-supply = <&wallvdd>;
+
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		lochnagar_sc: soundcard {
+			compatible = "cirrus,lochnagar2-soundcard";
+
+			#sound-dai-cells = <1>;
+
+			clocks = <&lochnagar_clk LOCHNAGAR_SOUNDCARD_MCLK>;
+			clock-names = "mclk";
+		};
+	};
+
+	cs42l92: cs42l92@1a {
+		status = "disabled";
+
+		compatible = "cirrus,cs47l92";
+		reg = <0x1a>;
+
+		interrupts = <27 8>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#sound-dai-cells = <1>;
+
+		AVDD-supply = <&lochnagar_vdd1v8>;
+		DBVDD1-supply = <&lochnagar_vdd1v8>;
+		CPVDD1-supply = <&lochnagar_vdd1v8>;
+		CPVDD2-supply = <&lochnagar_vddcore>;
+		DCVDD-supply = <&lochnagar_vddcore>;
+		SPKVDDL-supply = <&wallvdd>;
+		SPKVDDR-supply = <&wallvdd>;
+
+		reset-gpios = <&lochnagar_pin 0 0>;
+
+		cirrus,out-mono = <0 0 1 1 0 0>;
+		cirrus,dmic-ref = <
+			MADERA_DMIC_REF_MICBIAS1
+			MADERA_DMIC_REF_MICBIAS1
+			MADERA_DMIC_REF_MICBIAS1
+			MADERA_DMIC_REF_MICBIAS1
+		>;
+		cirrus,inmode = <
+			MADERA_INMODE_DIFF MADERA_INMODE_DIFF /* IN1A */
+			MADERA_INMODE_DIFF MADERA_INMODE_DIFF /* IN1B */
+			MADERA_INMODE_SE   MADERA_INMODE_SE   /* IN2A */
+			MADERA_INMODE_DIFF MADERA_INMODE_DIFF /* IN2B */
+		>;
+
+		clocks = <&lochnagar_clk LOCHNAGAR_CDC_MCLK1>,
+			 <&lochnagar_clk LOCHNAGAR_CDC_MCLK2>;
+		clock-names = "mclk1", "mclk2";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&cdc_irq &cs42l92_defaults>;
+
+		cs42l92_defaults: cs42l92-gpio-defaults {
+			aif1 {
+				groups = "aif1";
+				function = "aif1";
+				bias-bus-hold;
+			};
+
+			aif2 {
+				groups = "aif2";
+				function = "aif2";
+				bias-bus-hold;
+			};
+
+			aif3 {
+				groups = "aif3";
+				function = "aif3";
+				bias-bus-hold;
+			};
+		};
+
+		micvdd {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+		};
+
+		MICBIAS1 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+		};
+		MICBIAS1A {
+			regulator-active-discharge = <1>;
+		};
+		MICBIAS1B {
+			regulator-active-discharge = <1>;
+		};
+	};
+
+	wm8998: wm8998@1a {
+		status = "disabled";
+
+		compatible = "wlf,wm8998";
+		reg = <0x1a>;
+
+		interrupts = <27 0>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#sound-dai-cells = <1>;
+
+		LDOVDD-supply = <&lochnagar_vdd1v8>;
+		AVDD-supply = <&lochnagar_vdd1v8>;
+		DBVDD1-supply = <&lochnagar_vdd1v8>;
+		DBVDD2-supply = <&lochnagar_vdd1v8>;
+		DBVDD3-supply = <&lochnagar_vdd1v8>;
+		CPVDD-supply = <&lochnagar_vdd1v8>;
+		SPKVDDL-supply = <&wallvdd>;
+		SPKVDDR-supply = <&wallvdd>;
+
+		wlf,gpio-defaults = <
+			ARIZONA_GP_DEFAULT
+			ARIZONA_GP_DEFAULT
+			ARIZONA_GP_DEFAULT
+			ARIZONA_GP_DEFAULT
+			ARIZONA_GP_DEFAULT
+		>;
+
+		wlf,reset = <&lochnagar_pin 0 0>;
+		wlf,ldoena = <&lochnagar_pin 3 0>;
+
+		wlf,micd-configs = <
+			0x0 ARIZONA_DMIC_MICBIAS1 0
+			0x2000 ARIZONA_DMIC_MICBIAS2 1
+		>;
+		wlf,jd-invert;
+		wlf,micd-force-micbias;
+		wlf,gpsw = <ARIZONA_GPSW_CLOSED>;
+		wlf,micd-pol-gpio = <&wm8998 4 GPIO_TRANSITORY>;
+		wlf,micd-rate = <ARIZONA_MICD_TIME_8MS>;
+		wlf,micd-detect-debounce = <500>;
+		wlf,dmic-ref = <ARIZONA_DMIC_MICBIAS2>;
+		wlf,inmode = <ARIZONA_INMODE_DMIC ARIZONA_INMODE_DMIC
+			      ARIZONA_INMODE_DIFF ARIZONA_INMODE_DIFF>;
+
+		clocks = <&lochnagar_clk LOCHNAGAR_CDC_MCLK1>,
+			 <&lochnagar_clk LOCHNAGAR_CDC_MCLK2>;
+		clock-names = "mclk1", "mclk2";
+	};
+};
+
+&spi {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi_pins &spi_cs>;
+
+	cs-gpios = <&gpio 8 1>, <&gpio 7 1>;
+
+	spidev1: spidev@1{
+		compatible = "spidev";
+		reg = <1>;
+		status = "disabled";
+	};
+
+	cs47l15: cs47l15@1 {
+		status = "disabled";
+
+		compatible = "cirrus,cs47l15";
+		reg = <0x1>;
+
+		spi-max-frequency = <11000000>;
+
+		interrupts = <27 8>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#sound-dai-cells = <1>;
+
+		AVDD-supply = <&lochnagar_vdd1v8>;
+		DCVDD-supply = <&lochnagar_vddcore>;
+		DBVDD1-supply = <&lochnagar_vdd1v8>;
+		CPVDD1-supply = <&lochnagar_vdd1v8>;
+		SPKVDD-supply = <&wallvdd>;
+		MICVDD-supply = <&lochnagar_micvdd>;
+
+		reset-gpios = <&lochnagar_pin 0 0>;
+
+		cirrus,dmic-ref = <
+			MADERA_DMIC_REF_MICBIAS1
+			MADERA_DMIC_REF_MICBIAS2
+		>;
+		cirrus,inmode = <
+			MADERA_INMODE_SE   MADERA_INMODE_SE   /* IN1A */
+			MADERA_INMODE_DIFF MADERA_INMODE_DIFF /* IN1B */
+			MADERA_INMODE_SE   MADERA_INMODE_SE   /* IN2A */
+			MADERA_INMODE_DIFF MADERA_INMODE_DIFF /* IN2B */
+		>;
+
+		clocks = <&lochnagar_clk LOCHNAGAR_CDC_MCLK1>,
+			 <&lochnagar_clk LOCHNAGAR_CDC_MCLK2>;
+		clock-names = "mclk1", "mclk2";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&cdc_irq &cs47l15_defaults>;
+
+		cs47l15_defaults: cs47l15-gpio-defaults {
+			aif1 {
+				groups = "aif1";
+				function = "aif1";
+				bias-bus-hold;
+			};
+			aif2 {
+				groups = "aif2";
+				function = "aif2";
+				bias-bus-hold;
+			};
+			aif3 {
+				groups = "aif3";
+				function = "aif3";
+				bias-bus-hold;
+			};
+			pdmspk1 {
+				groups = "pdmspk1";
+				function = "pdmspk1";
+			};
+		};
+
+		micvdd {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+		};
+
+		MICBIAS1 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+		};
+		MICBIAS1A {
+			regulator-active-discharge = <1>;
+		};
+		MICBIAS1B {
+			regulator-active-discharge = <1>;
+		};
+		MICBIAS1C {
+			regulator-active-discharge = <1>;
+		};
+	};
+
+	cs47l24: cs47l24@1 {
+		status = "disabled";
+
+		compatible = "cirrus,cs47l24";
+		reg = <0x1>;
+
+		spi-max-frequency = <11000000>;
+
+		interrupts = <27 0>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#sound-dai-cells = <1>;
+
+		AVDD-supply = <&lochnagar_vdd1v8>;
+		DBVDD1-supply = <&lochnagar_vdd1v8>;
+		DBVDD2-supply = <&lochnagar_vdd1v8>;
+		DBVDD3-supply = <&lochnagar_vdd1v8>;
+		CPVDD-supply = <&lochnagar_vdd1v8>;
+		MICVDD-supply = <&lochnagar_micvdd>;
+		SPKVDD-supply = <&wallvdd>;
+		DCVDD-supply = <&lochnagar_vddcore>;
+
+		wlf,gpio-defaults = <
+			ARIZONA_GP_DEFAULT
+			ARIZONA_GP_DEFAULT
+			ARIZONA_GP_DEFAULT
+			ARIZONA_GP_DEFAULT
+			ARIZONA_GP_DEFAULT
+		>;
+
+		wlf,reset = <&lochnagar_pin 0 0>;
+
+		wlf,dmic-ref = <ARIZONA_DMIC_MICBIAS2 ARIZONA_DMIC_MICBIAS3>;
+		wlf,inmode = <ARIZONA_INMODE_DMIC ARIZONA_INMODE_DMIC>;
+
+		clocks = <&lochnagar_clk LOCHNAGAR_CDC_MCLK1>,
+			 <&lochnagar_clk LOCHNAGAR_CDC_MCLK2>;
+		clock-names = "mclk1", "mclk2";
+	};
+
+	cs47l35: cs47l35@1 {
+		status = "disabled";
+
+		compatible = "cirrus,cs47l35";
+		reg = <0x1>;
+
+		spi-max-frequency = <11000000>;
+
+		interrupts = <27 8>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#sound-dai-cells = <1>;
+
+		AVDD-supply = <&lochnagar_vdd1v8>;
+		DBVDD1-supply = <&lochnagar_vdd1v8>;
+		DBVDD2-supply = <&lochnagar_vdd1v8>;
+		CPVDD1-supply = <&lochnagar_vdd1v8>;
+		CPVDD2-supply = <&lochnagar_vddcore>;
+		DCVDD-supply = <&lochnagar_vddcore>;
+		SPKVDD-supply = <&wallvdd>;
+
+		reset-gpios = <&lochnagar_pin 0 0>;
+
+		cirrus,dmic-ref = <
+			MADERA_DMIC_REF_MICVDD
+			CS47L35_DMIC_REF_MICBIAS2A
+			MADERA_DMIC_REF_MICVDD
+		>;
+		cirrus,inmode = <
+			MADERA_INMODE_SE   MADERA_INMODE_SE   /* IN1A */
+			MADERA_INMODE_DIFF MADERA_INMODE_DIFF /* IN1B */
+			MADERA_INMODE_SE   MADERA_INMODE_SE   /* IN2A */
+			MADERA_INMODE_DIFF MADERA_INMODE_DIFF /* IN2B */
+		>;
+
+		clocks = <&lochnagar_clk LOCHNAGAR_CDC_MCLK1>,
+			 <&lochnagar_clk LOCHNAGAR_CDC_MCLK2>;
+		clock-names = "mclk1", "mclk2";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&cdc_irq &cs47l35_defaults>;
+
+		cs47l35_defaults: cs47l35-gpio-defaults {
+			aif1 {
+				groups = "aif1";
+				function = "aif1";
+				bias-bus-hold;
+			};
+
+			aif2 {
+				groups = "aif2";
+				function = "aif2";
+				bias-bus-hold;
+			};
+
+			aif3 {
+				groups = "aif3";
+				function = "aif3";
+				bias-bus-hold;
+			};
+		};
+
+		micvdd {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+		};
+
+		MICBIAS1 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+		};
+		MICBIAS1A {
+			regulator-active-discharge = <1>;
+		};
+
+		MICBIAS2 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+		};
+		MICBIAS2A {
+			regulator-active-discharge = <1>;
+		};
+	};
+
+	cs47l90: cs47l90@1 {
+		status = "disabled";
+
+		compatible = "cirrus,cs47l90";
+		reg = <0x1>;
+
+		spi-max-frequency = <11000000>;
+
+		interrupts = <27 8>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#sound-dai-cells = <1>;
+
+		AVDD-supply = <&lochnagar_vdd1v8>;
+		DBVDD1-supply = <&lochnagar_vdd1v8>;
+		DBVDD2-supply = <&lochnagar_vdd1v8>;
+		DBVDD3-supply = <&lochnagar_vdd1v8>;
+		DBVDD4-supply = <&lochnagar_vdd1v8>;
+		CPVDD1-supply = <&lochnagar_vdd1v8>;
+		CPVDD2-supply = <&lochnagar_vddcore>;
+		DCVDD-supply = <&lochnagar_vddcore>;
+		SPKVDDL-supply = <&wallvdd>;
+		SPKVDDR-supply = <&wallvdd>;
+
+		reset-gpios = <&lochnagar_pin 0 0>;
+
+		cirrus,dmic-ref = <
+			MADERA_DMIC_REF_MICBIAS1
+			MADERA_DMIC_REF_MICBIAS2
+		>;
+		cirrus,inmode = <
+			MADERA_INMODE_DIFF MADERA_INMODE_DIFF /* IN1A */
+			MADERA_INMODE_DIFF MADERA_INMODE_DIFF /* IN1B */
+			MADERA_INMODE_SE   MADERA_INMODE_SE   /* IN2A */
+			MADERA_INMODE_DIFF MADERA_INMODE_DIFF /* IN2B */
+		>;
+
+		clocks = <&lochnagar_clk LOCHNAGAR_CDC_MCLK1>,
+			 <&lochnagar_clk LOCHNAGAR_CDC_MCLK2>;
+		clock-names = "mclk1", "mclk2";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&cdc_irq &cs47l90_defaults>;
+
+		cs47l90_defaults: cs47l90-gpio-defaults {
+			aif1 {
+				groups = "aif1";
+				function = "aif1";
+				bias-bus-hold;
+			};
+
+			aif2 {
+				groups = "aif2";
+				function = "aif2";
+				bias-bus-hold;
+			};
+
+			aif3 {
+				groups = "aif3";
+				function = "aif3";
+				bias-bus-hold;
+			};
+		};
+
+		micvdd {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+		};
+
+		MICBIAS1 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+		};
+		MICBIAS1A {
+			regulator-active-discharge = <1>;
+		};
+		MICBIAS1B {
+			regulator-active-discharge = <1>;
+		};
+
+		MICBIAS2 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+		};
+		MICBIAS2C {
+			regulator-active-discharge = <1>;
+		};
+	};
+};
-- 
2.20.1

