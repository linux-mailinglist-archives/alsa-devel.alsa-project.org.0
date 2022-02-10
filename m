Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A674B0EFA
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 14:43:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2F7E1921;
	Thu, 10 Feb 2022 14:42:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2F7E1921
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644500618;
	bh=dN4RI96k5x54D4aPNxtFeCeJ0I8/zWUKbrs8hDrqgKE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WGIgmjaanuoAMjrw2cCuimzPmLcJqqjfkCFdpJrLbaO8mcuZRHSdIxQ86R6d+plDS
	 YW/FxpM7qmF3r1vMK7IoHUFK6I8xZmt5od478piYF4N4zFzqAb/rfH2I63PfxpIzrh
	 1xQrKjPHdgDbmJypfFKFUCcAqQzHAyBvAj0RVuO0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CD70F804AC;
	Thu, 10 Feb 2022 14:42:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 377E8F804AB; Thu, 10 Feb 2022 14:41:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C5CCF800A7
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 14:41:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C5CCF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="aYGE4BxT"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id 8C4BB1F46488
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644500511;
 bh=dN4RI96k5x54D4aPNxtFeCeJ0I8/zWUKbrs8hDrqgKE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aYGE4BxT1bNCKimY5aVwl3YsPodASenmQ5XtAqONBy+JIKaLLwui0iG3V4ZIFH6Xm
 51dFHMK9gNlAjpQPBjwa3Q/uAH1SWkGffeeC1AQEg0Tngwuw1Kblet8CoXmu04+YqC
 dfAQLKVzBIvUxj1LRMSpGn4tAJS27U/RsfqHVfrqRc55KBgLmLqu13jkgkUW4SZmwl
 ZXUZEqFxy4JTBEDFEQx6FqkizGDq94CHUsSLmfVE1j6uMS24hhB1USwhnLO4NNVMjC
 Fal4a+ep08A82+cZ5b9vrWstDt2e0PmInIDnmLP3Nn8SiizT8o6prE5bnDqByYFO+W
 rX5NkA5T60R9Q==
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-imx@nxp.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: imx8mn-bsh-smm-s2pro: Add tlv320aic31xx
 audio card node
Date: Thu, 10 Feb 2022 10:40:49 -0300
Message-Id: <20220210134049.32576-2-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210134049.32576-1-ariel.dalessandro@collabora.com>
References: <20220210134049.32576-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: ariel.dalessandro@collabora.com, krzysztof.kozlowski@canonical.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, lgirdwood@gmail.com,
 robh+dt@kernel.org, broonie@kernel.org, michael@amarulasolutions.com,
 festevam@gmail.com
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

BSH SystemMaster (SMM) S2 PRO board comes with an audio card based on
tlv320aic31xx family codec.

The audio card exposes two playback devices, one of them using the EASRC
(Enhanced Asynchronous Sample Rate Converter) module. Note that this
would require SDMA and EASRC firmware in order to work.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 .../dts/freescale/imx8mn-bsh-smm-s2pro.dts    | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
index c6a8ed6745c1..3621354b4a92 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "imx8mn-bsh-smm-s2-common.dtsi"
+#include <dt-bindings/sound/tlv320aic31xx.h>
 
 / {
 	model = "BSH SMM S2 PRO";
@@ -16,6 +17,69 @@ memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0x0 0x20000000>;
 	};
+
+	sound-tlv320aic31xx {
+		compatible = "fsl,imx-audio-tlv320aic31xx";
+		model = "tlv320aic31xx-hifi";
+		audio-cpu = <&sai3>;
+		audio-codec = <&codec>;
+		audio-asrc = <&easrc>;
+		audio-routing =
+			"Ext Spk", "SPL",
+			"Ext Spk", "SPR";
+		mclk-id = <PLL_CLKIN_BCLK>;
+	};
+
+	vdd_input: vdd_input {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_input";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+};
+
+&easrc {
+	fsl,asrc-rate  = <48000>;
+	fsl,asrc-format = <10>;
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	status = "okay";
+
+	codec: tlv320dac3101@18 {
+		#sound-dai-cells = <0>;
+		compatible = "ti,tlv320dac3101";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_dac_rst>;
+		reg = <0x18>;
+
+		ai31xx-micbias-vg = <MICBIAS_AVDDV>;
+
+		HPVDD-supply = <&buck4_reg>;
+		SPRVDD-supply = <&vdd_input>;
+		SPLVDD-supply = <&vdd_input>;
+		AVDD-supply = <&buck4_reg>;
+		IOVDD-supply = <&buck4_reg>;
+		DVDD-supply = <&buck5_reg>;
+		reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
+
+		clocks = <&clk IMX8MN_CLK_SAI3_ROOT>;
+		clock-names = "mclk";
+	};
+};
+
+&sai3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai3>;
+	assigned-clocks = <&clk IMX8MN_CLK_SAI3>;
+	assigned-clock-parents = <&clk IMX8MN_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <24576000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
 };
 
 /* eMMC */
@@ -30,6 +94,36 @@ &usdhc1 {
 };
 
 &iomuxc {
+	pinctrl_dac_rst: dac_rst {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO06_GPIO1_IO6		0x19 /* DAC_RST */
+		>;
+	};
+
+	pinctrl_espi2: espi2grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_ECSPI2_SCLK_ECSPI2_SCLK            0x082
+			MX8MN_IOMUXC_ECSPI2_MOSI_ECSPI2_MOSI            0x082
+			MX8MN_IOMUXC_ECSPI2_MISO_ECSPI2_MISO            0x082
+			MX8MN_IOMUXC_ECSPI2_SS0_ECSPI2_SS0		0x040
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C2_SCL_I2C2_SCL			0x400000c3
+			MX8MN_IOMUXC_I2C2_SDA_I2C2_SDA			0x400000c3
+		>;
+	};
+
+	pinctrl_sai3: sai3grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SAI3_TXFS_SAI3_TX_SYNC		0xd6
+			MX8MN_IOMUXC_SAI3_TXC_SAI3_TX_BCLK		0xd6
+			MX8MN_IOMUXC_SAI3_TXD_SAI3_TX_DATA0		0xd6
+		>;
+	};
+
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK			0x40000090
-- 
2.34.1

