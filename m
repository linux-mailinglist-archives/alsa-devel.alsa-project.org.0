Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 414B4290AE7
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Oct 2020 19:39:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FDCE17E1;
	Fri, 16 Oct 2020 19:39:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FDCE17E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602869993;
	bh=aIev1KJohHy5493wvHcWrjkf1CFBdpT/spHjoFC3aCU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=frV/vezclyjUXUy0RzE97MednwPxw1q80WTDg4IuBr6JXioxiNjbEXhiSXvJI3+RU
	 3GGrpU3AtcbeIEXNHOy3qQgzMa1E4MRltMm5heN5ALx/kUHOIkSDY2x3eSst/RdZVP
	 k1PbUZrMlRgvLWpmnfqKunxMK2aAPOoSjBIYmw1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED0C2F802B1;
	Fri, 16 Oct 2020 19:36:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45ACAF8027D; Fri, 16 Oct 2020 19:36:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7B4BF80225
 for <alsa-devel@alsa-project.org>; Fri, 16 Oct 2020 19:35:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7B4BF80225
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="PQevufRF"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 09GHQLpe024369; Fri, 16 Oct 2020 12:35:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=RS/1mAtGDajLAFDWU7I3OTYSEckqCTCQI72kJ6DpYvM=;
 b=PQevufRF+Xixx1VHaLsFP3YiwAfwcjZDsh1YIUbVMsJlknBrXsKmDVshIPBwGMcad04n
 Ldl0na+ZMc/txwQNoLkSvNtZcZdobmyRmKWlAN2dPnGcZS2H/VhMgC3CTUtOEl4RavOx
 PuxEt76Y/X+jDOZBoGRXNyG905Vx0md48uzPddG7wWY54hiGQLJKemZzOZ1Op5zFMC6D
 dT2hML7Yj0rF6Ri3fyxHXPuXmR7NUKyuPKw5MOh3gK47HS0NGaH5sZi86iVHgaCIHEl0
 0o0EMcOSXGZxN51tGwuWrrkVWmriaZ7OHn/JBfdIgnBpNh1fU8t5SamyVJhm5EpaWwHC aQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 343ac20jk8-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 16 Oct 2020 12:35:49 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 16 Oct
 2020 18:35:47 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 16 Oct 2020 18:35:47 +0100
Received: from AUSNPC0LSNW1-debian.ad.cirrus.com (ausnpc0lsnw1.ad.cirrus.com
 [198.61.64.143])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E361F2A1;
 Fri, 16 Oct 2020 17:35:46 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <nsaenzjulienne@suse.de>
Subject: [PATCH v2 6/7] ARM: dts: Add dts for RPi4b + Cirrus Logic Lochnagar2
 + CS47L15
Date: Fri, 16 Oct 2020 18:35:40 +0100
Message-ID: <20201016173541.21180-7-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201016173541.21180-1-rf@opensource.cirrus.com>
References: <20201016173541.21180-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010160130
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

This adds a devicetree configuration for Raspberry Pi 4b connected to
Cirrus Logic Lochnagar 2 audio development board and CS47L15 codec.

The common (codec-independent) Lochnagar 2 configuration is separated
into a dtsi to simplify re-using it for other codecs.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 arch/arm/boot/dts/Makefile                    |   1 +
 ...bcm2711-rpi4b-cirrus-lochnagar-cs47l15.dts | 166 +++++++++++++++
 .../dts/bcm2711-rpi4b-cirrus-lochnagar.dtsi   | 201 ++++++++++++++++++
 3 files changed, 368 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi4b-cirrus-lochnagar-cs47l15.dts
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi4b-cirrus-lochnagar.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 4572db3fa5ae..7c4f1e2a7005 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -92,6 +92,7 @@ dtb-$(CONFIG_ARCH_BCM2835) += \
 	bcm2837-rpi-3-b-plus.dtb \
 	bcm2837-rpi-cm3-io3.dtb \
 	bcm2711-rpi-4-b.dtb \
+	bcm2711-rpi4b-cirrus-lochnagar-cs47l15.dtb \
 	bcm2835-rpi-zero.dtb \
 	bcm2835-rpi-zero-w.dtb
 dtb-$(CONFIG_ARCH_BCM_5301X) += \
diff --git a/arch/arm/boot/dts/bcm2711-rpi4b-cirrus-lochnagar-cs47l15.dts b/arch/arm/boot/dts/bcm2711-rpi4b-cirrus-lochnagar-cs47l15.dts
new file mode 100644
index 000000000000..f23d0ace5467
--- /dev/null
+++ b/arch/arm/boot/dts/bcm2711-rpi4b-cirrus-lochnagar-cs47l15.dts
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+#include "bcm2711-rpi4b-cirrus-lochnagar.dtsi"
+#include <dt-bindings/sound/madera.h>
+
+/ {
+	sound {
+		status = "okay";
+
+		compatible = "audio-graph-card";
+		label = "sound-card-cs47l15";
+
+		sysclks = <
+			&cs47l15 1 4 98304000 0
+			&cs47l15 8 4 147456000 0
+		>;
+		plls = <
+			&cs47l15 1 0 24576000 98304000
+		>;
+
+		widgets = "Microphone", "Microphone Jack",
+			  "Headphone", "Headphone Jack";
+
+		routing = "Microphone Jack", "MICBIAS1A",
+			  "IN1BRN", "Microphone Jack",
+			  "IN1BRP", "Microphone Jack",
+			  "Headphone Jack", "HPOUTL",
+			  "Headphone Jack", "HPOUTR";
+
+		dais = <&cpu_i2s_port &cs47l15_trace_port>;
+	};
+};
+
+&i2s {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		cpu_i2s_port: port@0 {
+			reg = <0>;
+			cpu_i2s_ep: endpoint {
+				remote-endpoint = <&cs47l15_aif1>;
+				dai-format = "i2s";
+			};
+		};
+	};
+};
+
+&spi {
+	status = "okay";
+
+	cs47l15: cs47l15@1 {
+		status = "okay";
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
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			cs47l15_aif1_port: port@0 {
+				reg = <0>;
+				cs47l15_aif1: endpoint {
+					remote-endpoint = <&cpu_i2s_ep>;
+					bitclock-master;
+					frame-master;
+					system-clock-frequency = <0>;
+					mclk-fs = <0>;
+				};
+			};
+			/* Debug trace compressed stream */
+			cs47l15_trace_port: port@3 {
+				reg = <3>;
+				cs47l15_trace_cpu: endpoint {
+					remote-endpoint = <&cs47l15_trace_codec>;
+					system-clock-frequency = <0>;
+					mclk-fs = <0>;
+				};
+			};
+			port@4 {
+				reg = <4>;
+				cs47l15_trace_codec: endpoint {
+					remote-endpoint = <&cs47l15_trace_cpu>;
+					system-clock-frequency = <0>;
+					mclk-fs = <0>;
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/bcm2711-rpi4b-cirrus-lochnagar.dtsi b/arch/arm/boot/dts/bcm2711-rpi4b-cirrus-lochnagar.dtsi
new file mode 100644
index 000000000000..af498d7ad18a
--- /dev/null
+++ b/arch/arm/boot/dts/bcm2711-rpi4b-cirrus-lochnagar.dtsi
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+#include "bcm2711-rpi-4-b.dts"
+#include <dt-bindings/clk/lochnagar.h>
+#include <dt-bindings/pinctrl/bcm2835.h>
+#include <dt-bindings/pinctrl/lochnagar.h>
+
+/ {
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
+};
+
+&gpio {
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
+};
+
+&spi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi_pins &spi_cs>;
+	cs-gpios = <&gpio 8 1>, <&gpio 7 1>;
+};
-- 
2.20.1

