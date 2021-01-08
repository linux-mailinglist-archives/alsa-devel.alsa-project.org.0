Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A62842EF584
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jan 2021 17:07:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEFD716DA;
	Fri,  8 Jan 2021 17:07:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEFD716DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610122074;
	bh=GM+ZxYWvGVethBld5QrDkTe2e6EZ/H8hdU29NRiSXVU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bNQkKQfgLAE2TexZzcMSnthxsqPKn/COzStQSmlAapHmDlH8yEBt0U4ctdjywhKHX
	 x875HPXyq1dYX0XNrZRxm1JuLjAK2QigF5l5gKNT+HIzqWLF4vC3AtcuyiMXOHPHdp
	 E0lc2mE3/621Vdl8il+KOYaBiqq4MIyaJSOyccz0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B26FF804D2;
	Fri,  8 Jan 2021 17:05:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18DFFF804CA; Fri,  8 Jan 2021 17:05:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7685F8016A
 for <alsa-devel@alsa-project.org>; Fri,  8 Jan 2021 17:05:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7685F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="kQ/6c7+0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 108G2Eoa011561; Fri, 8 Jan 2021 10:05:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=+w5xx7LGiLqSPWaeC7AZtzqPzv7SbUjzZgWbyHwArP8=;
 b=kQ/6c7+0pZURMvtquXoe8K5kZCtbdb6+5lzgd4DfKDKugnqjZ1GqDruktZcTwV85Wc8L
 TGqCG06pM2Te84ZRGvV2rQfyhqs4wlNLjbQlWEu7yvRFBqn6ag5MA/gXOqejY9k/QC+8
 aiakNg1s5YqM2r1muS3XHqbi2KF8Z1CesZHacNoU++nT9rAuy5ISIffg/ptJT3g+J8LA
 uITDhuW1we8N4cyfRdOyBI86OEOzzQXD2z0GS7yB6rvnyhWMQkm8FrlyEbp1ilasPh7r
 J8Z4qlALiV8jeW8Tiiu80b2hdaDTAisFEuP6+p7sZJPp3WwNpgkjKTqd0ERIvaHclW/Y yg== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 35wqjka90t-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 08 Jan 2021 10:05:10 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 8 Jan 2021
 16:05:09 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 8 Jan 2021 16:05:09 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.64.226])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 470ED45;
 Fri,  8 Jan 2021 16:05:09 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <kuninori.morimoto.gx@renesas.com>, <nsaenzjulienne@suse.de>,
 <f.fainelli@gmail.com>
Subject: [PATCH v4 6/6] ARM: dts: Add dts for RPi4b + Cirrus Logic Lochnagar2
 + CS47L15
Date: Fri, 8 Jan 2021 16:05:01 +0000
Message-ID: <20210108160501.7638-7-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108160501.7638-1-rf@opensource.cirrus.com>
References: <20210108160501.7638-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101080091
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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
 MAINTAINERS                                   |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../dts/bcm2711-rpi-4-b-lochnagar-cs47l15.dts | 186 ++++++++++++++++
 .../boot/dts/bcm2711-rpi-4-b-lochnagar.dtsi   | 201 ++++++++++++++++++
 4 files changed, 389 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi-4-b-lochnagar-cs47l15.dts
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi-4-b-lochnagar.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index 9407dd55673b..c61d522838ee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4233,6 +4233,7 @@ M:	Charles Keepax <ckeepax@opensource.cirrus.com>
 M:	Richard Fitzgerald <rf@opensource.cirrus.com>
 L:	patches@opensource.cirrus.com
 S:	Supported
+F:	arch/arm/boot/dts/bcm2711-rpi-4-b-lochnagar*
 F:	Documentation/devicetree/bindings/clock/cirrus,lochnagar.yaml
 F:	Documentation/devicetree/bindings/hwmon/cirrus,lochnagar.yaml
 F:	Documentation/devicetree/bindings/mfd/cirrus,lochnagar.yaml
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 3d1ea0b25168..87230f81aa7a 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -93,6 +93,7 @@ dtb-$(CONFIG_ARCH_BCM2835) += \
 	bcm2837-rpi-3-b-plus.dtb \
 	bcm2837-rpi-cm3-io3.dtb \
 	bcm2711-rpi-4-b.dtb \
+	bcm2711-rpi-4-b-lochnagar-cs47l15.dtb \
 	bcm2835-rpi-zero.dtb \
 	bcm2835-rpi-zero-w.dtb
 dtb-$(CONFIG_ARCH_BCM_5301X) += \
diff --git a/arch/arm/boot/dts/bcm2711-rpi-4-b-lochnagar-cs47l15.dts b/arch/arm/boot/dts/bcm2711-rpi-4-b-lochnagar-cs47l15.dts
new file mode 100644
index 000000000000..7b516b3d7af1
--- /dev/null
+++ b/arch/arm/boot/dts/bcm2711-rpi-4-b-lochnagar-cs47l15.dts
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+#include "bcm2711-rpi-4-b-lochnagar.dtsi"
+#include <dt-bindings/sound/madera.h>
+
+/ {
+	sound {
+		status = "okay";
+
+		compatible = "audio-graph-card";
+		label = "sound-card-cs47l15";
+
+		clocks = <&clk_24m>, <&fll1_out>, <&fll1_dsp>;
+		clock-names = "ln-clk-24m", "fll1-out", "fll1-dsp";
+
+		plls = <
+			&cs47l15 MADERA_FLL1_REFCLK MADERA_FLL_SRC_MCLK1 98304000
+		>;
+		plls-clocks = "ln-clk-24m";
+
+		sysclks = <
+			&cs47l15 MADERA_CLK_SYSCLK_1 MADERA_CLK_SRC_FLL1 0
+			&cs47l15 MADERA_CLK_DSPCLK   MADERA_CLK_SRC_FLL1 0
+		>;
+		sysclks-clocks = "fll1-out", "fll1-dsp";
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
+
+		/* Main output from FLL1 */
+		fll1_out: fll1_out {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <98304000>;
+		};
+
+		/* x1.5 DSP output from FLL1 */
+		fll1_dsp: fll1_dsp {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <147456000>;
+		};
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
diff --git a/arch/arm/boot/dts/bcm2711-rpi-4-b-lochnagar.dtsi b/arch/arm/boot/dts/bcm2711-rpi-4-b-lochnagar.dtsi
new file mode 100644
index 000000000000..af498d7ad18a
--- /dev/null
+++ b/arch/arm/boot/dts/bcm2711-rpi-4-b-lochnagar.dtsi
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

