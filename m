Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F190380D6E8
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 19:36:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81C61E73;
	Mon, 11 Dec 2023 19:35:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81C61E73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702319767;
	bh=WAFyeLruE0pRD9vHK2XgEk6+TSoMKoYicnFKjTpQa0Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G+UdIQ8QHaRixSh0MOsCLt6yLJeIBTcB3BSP9r29h9vl5wKYQQst5trzAVoIQDqrA
	 MPZrwp8ZJYGbZQ18UGg3fSVd/lASWWqB2Od2BlHvz73fg67juZYkGQd34PIN0BeJnP
	 ulAkB0m8WzWc92JgIo5XPqz3w4FbrBQ3Mqgy8Lz8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51662F805C7; Mon, 11 Dec 2023 19:35:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 156AEF805AC;
	Mon, 11 Dec 2023 19:35:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02911F8020D; Mon, 11 Dec 2023 19:35:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8FEADF80124
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 19:35:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FEADF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=yk+ejznZ
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BBC9o9O022629;
	Mon, 11 Dec 2023 19:35:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=pdoLzds6ybOz4DH26I8jBcXVv6K38hVXWpk0gC53suE=; b=yk
	+ejznZQikqDU1PHHkIRxSXgB4JdjA//2Ig49tUzHPVq2hbbRFaz9Ua02we3CsHId
	lBUFHn4zhIzKq6oatEM+VyxnGyI5EZQJBqXManthxPgnpeD3/DPcsz6CtsTxcuoE
	lKl/bEjQQXqNE3QVknQTjW+YM+wBKQxaXyvDCCjt1/Ea+msYyujyLYXwTafDlGbx
	DW37MAH/lTndOskR8m7xsrklnORlvI4k2qFQtHI2PptfjXGESj+YMFOLeGodLZQq
	FZG788o6yKiTjqmNMBQVms+1M08pyG/0S4oko340Lms8wzqxZ3LLDJAuGaVDqRU5
	xdX6gVc/t78I2nal+iiQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uvg0gqvhb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 19:35:09 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 611E4100060;
	Mon, 11 Dec 2023 19:35:08 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5446F26F11B;
	Mon, 11 Dec 2023 19:35:08 +0100 (CET)
Received: from localhost (10.252.9.5) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Dec
 2023 19:35:08 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
To: <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <alexandre.torgue@foss.st.com>,
        <vkoul@kernel.org>, <jic23@kernel.org>, <olivier.moysan@foss.st.com>,
        <arnaud.pouliquen@foss.st.com>, <mchehab@kernel.org>,
        <fabrice.gasnier@foss.st.com>, <andi.shyti@kernel.org>,
        <ulf.hansson@linaro.org>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <hugues.fruchet@foss.st.com>, <lee@kernel.org>,
        <will@kernel.org>, <catalin.marinas@arm.com>, <arnd@kernel.org>,
        <richardcochran@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
        <peng.fan@oss.nxp.com>, <lars@metafoo.de>, <rcsekar@samsung.com>,
        <wg@grandegger.com>, <mkl@pengutronix.de>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-media@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>
Subject: [PATCH v7 13/13] ARM: dts: stm32: put ETZPC as an access controller
 for STM32MP13x boards
Date: Mon, 11 Dec 2023 19:30:44 +0100
Message-ID: <20231211183044.808204-14-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211183044.808204-1-gatien.chevallier@foss.st.com>
References: <20231211183044.808204-1-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.9.5]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-11_08,2023-12-07_01,2023-05-22_02
Message-ID-Hash: RWUV3VVVBP3HNFGEBRHVOBUBPNQYU4WJ
X-Message-ID-Hash: RWUV3VVVBP3HNFGEBRHVOBUBPNQYU4WJ
X-MailFrom: prvs=0709dd40e0=gatien.chevallier@foss.st.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RWUV3VVVBP3HNFGEBRHVOBUBPNQYU4WJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Reference ETZPC as an access-control-provider.

For more information on which peripheral is securable or supports MCU
isolation, please read the STM32MP13 reference manual

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---

Patch not present in V6

 arch/arm/boot/dts/st/stm32mp131.dtsi  | 26 ++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp133.dtsi  |  1 +
 arch/arm/boot/dts/st/stm32mp13xc.dtsi |  1 +
 arch/arm/boot/dts/st/stm32mp13xf.dtsi |  1 +
 4 files changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index 6ba8e3fd43b0..74ceece168ce 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -883,6 +883,7 @@ etzpc: bus@5c007000 {
 			reg = <0x5c007000 0x400>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			#access-controller-cells = <1>;
 			ranges;
 
 			adc_2: adc@48004000 {
@@ -895,6 +896,7 @@ adc_2: adc@48004000 {
 				#interrupt-cells = <1>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				access-controllers = <&etzpc 33>;
 				status = "disabled";
 
 				adc2: adc@0 {
@@ -942,6 +944,7 @@ usbotg_hs: usb@49000000 {
 				dr_mode = "otg";
 				otg-rev = <0x200>;
 				usb33d-supply = <&scmi_usb33>;
+				access-controllers = <&etzpc 34>;
 				status = "disabled";
 			};
 
@@ -955,6 +958,7 @@ usart1: serial@4c000000 {
 				dmas = <&dmamux1 41 0x400 0x5>,
 				<&dmamux1 42 0x400 0x1>;
 				dma-names = "rx", "tx";
+				access-controllers = <&etzpc 16>;
 				status = "disabled";
 			};
 
@@ -968,6 +972,7 @@ usart2: serial@4c001000 {
 				dmas = <&dmamux1 43 0x400 0x5>,
 				<&dmamux1 44 0x400 0x1>;
 				dma-names = "rx", "tx";
+				access-controllers = <&etzpc 17>;
 				status = "disabled";
 			};
 
@@ -979,6 +984,7 @@ i2s4: audio-controller@4c002000 {
 				dmas = <&dmamux1 83 0x400 0x01>,
 				<&dmamux1 84 0x400 0x01>;
 				dma-names = "rx", "tx";
+				access-controllers = <&etzpc 13>;
 				status = "disabled";
 			};
 
@@ -993,6 +999,7 @@ spi4: spi@4c002000 {
 				dmas = <&dmamux1 83 0x400 0x01>,
 				       <&dmamux1 84 0x400 0x01>;
 				dma-names = "rx", "tx";
+				access-controllers = <&etzpc 18>;
 				status = "disabled";
 			};
 
@@ -1007,6 +1014,7 @@ spi5: spi@4c003000 {
 				dmas = <&dmamux1 85 0x400 0x01>,
 				       <&dmamux1 86 0x400 0x01>;
 				dma-names = "rx", "tx";
+				access-controllers = <&etzpc 19>;
 				status = "disabled";
 			};
 
@@ -1025,6 +1033,7 @@ i2c3: i2c@4c004000 {
 				dma-names = "rx", "tx";
 				st,syscfg-fmp = <&syscfg 0x4 0x4>;
 				i2c-analog-filter;
+				access-controllers = <&etzpc 20>;
 				status = "disabled";
 			};
 
@@ -1043,6 +1052,7 @@ i2c4: i2c@4c005000 {
 				dma-names = "rx", "tx";
 				st,syscfg-fmp = <&syscfg 0x4 0x8>;
 				i2c-analog-filter;
+				access-controllers = <&etzpc 21>;
 				status = "disabled";
 			};
 
@@ -1061,6 +1071,7 @@ i2c5: i2c@4c006000 {
 				dma-names = "rx", "tx";
 				st,syscfg-fmp = <&syscfg 0x4 0x10>;
 				i2c-analog-filter;
+				access-controllers = <&etzpc 22>;
 				status = "disabled";
 			};
 
@@ -1073,6 +1084,7 @@ timers12: timer@4c007000 {
 				interrupt-names = "global";
 				clocks = <&rcc TIM12_K>;
 				clock-names = "int";
+				access-controllers = <&etzpc 23>;
 				status = "disabled";
 
 				pwm {
@@ -1097,6 +1109,7 @@ timers13: timer@4c008000 {
 				interrupt-names = "global";
 				clocks = <&rcc TIM13_K>;
 				clock-names = "int";
+				access-controllers = <&etzpc 24>;
 				status = "disabled";
 
 				pwm {
@@ -1121,6 +1134,7 @@ timers14: timer@4c009000 {
 				interrupt-names = "global";
 				clocks = <&rcc TIM14_K>;
 				clock-names = "int";
+				access-controllers = <&etzpc 25>;
 				status = "disabled";
 
 				pwm {
@@ -1150,6 +1164,7 @@ timers15: timer@4c00a000 {
 				<&dmamux1 107 0x400 0x1>,
 				<&dmamux1 108 0x400 0x1>;
 				dma-names = "ch1", "up", "trig", "com";
+				access-controllers = <&etzpc 26>;
 				status = "disabled";
 
 				pwm {
@@ -1177,6 +1192,7 @@ timers16: timer@4c00b000 {
 				dmas = <&dmamux1 109 0x400 0x1>,
 				<&dmamux1 110 0x400 0x1>;
 				dma-names = "ch1", "up";
+				access-controllers = <&etzpc 27>;
 				status = "disabled";
 
 				pwm {
@@ -1204,6 +1220,7 @@ timers17: timer@4c00c000 {
 				dmas = <&dmamux1 111 0x400 0x1>,
 				       <&dmamux1 112 0x400 0x1>;
 				dma-names = "ch1", "up";
+				access-controllers = <&etzpc 28>;
 				status = "disabled";
 
 				pwm {
@@ -1228,6 +1245,7 @@ lptimer2: timer@50021000 {
 				clocks = <&rcc LPTIM2_K>;
 				clock-names = "mux";
 				wakeup-source;
+				access-controllers = <&etzpc 1>;
 				status = "disabled";
 
 				pwm {
@@ -1262,6 +1280,7 @@ lptimer3: timer@50022000 {
 				clocks = <&rcc LPTIM3_K>;
 				clock-names = "mux";
 				wakeup-source;
+				access-controllers = <&etzpc 2>;
 				status = "disabled";
 
 				pwm {
@@ -1290,6 +1309,7 @@ hash: hash@54003000 {
 				resets = <&rcc HASH1_R>;
 				dmas = <&mdma 30 0x2 0x1000a02 0x0 0x0>;
 				dma-names = "in";
+				access-controllers = <&etzpc 41>;
 			};
 
 			rng: rng@54004000 {
@@ -1297,6 +1317,7 @@ rng: rng@54004000 {
 				reg = <0x54004000 0x400>;
 				clocks = <&rcc RNG1_K>;
 				resets = <&rcc RNG1_R>;
+				access-controllers = <&etzpc 40>;
 			};
 
 			fmc: memory-controller@58002000 {
@@ -1311,6 +1332,7 @@ fmc: memory-controller@58002000 {
 				#size-cells = <1>;
 				clocks = <&rcc FMC_K>;
 				resets = <&rcc FMC_R>;
+				access-controllers = <&etzpc 54>;
 				status = "disabled";
 
 				nand-controller@4,0 {
@@ -1344,6 +1366,7 @@ qspi: spi@58003000 {
 				dma-names = "tx", "rx";
 				clocks = <&rcc QSPI_K>;
 				resets = <&rcc QSPI_R>;
+				access-controllers = <&etzpc 55>;
 				status = "disabled";
 			};
 
@@ -1358,6 +1381,7 @@ sdmmc1: mmc@58005000 {
 				cap-sd-highspeed;
 				cap-mmc-highspeed;
 				max-frequency = <130000000>;
+				access-controllers = <&etzpc 50>;
 				status = "disabled";
 			};
 
@@ -1372,6 +1396,7 @@ sdmmc2: mmc@58007000 {
 				cap-sd-highspeed;
 				cap-mmc-highspeed;
 				max-frequency = <130000000>;
+				access-controllers = <&etzpc 51>;
 				status = "disabled";
 			};
 
@@ -1385,6 +1410,7 @@ usbphyc: usbphyc@5a006000 {
 				resets = <&rcc USBPHY_R>;
 				vdda1v1-supply = <&scmi_reg11>;
 				vdda1v8-supply = <&scmi_reg18>;
+				access-controllers = <&etzpc 5>;
 				status = "disabled";
 
 				usbphyc_port0: usb-phy@0 {
diff --git a/arch/arm/boot/dts/st/stm32mp133.dtsi b/arch/arm/boot/dts/st/stm32mp133.dtsi
index c4d3a520c14b..3e394c8e58b9 100644
--- a/arch/arm/boot/dts/st/stm32mp133.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp133.dtsi
@@ -47,6 +47,7 @@ adc_1: adc@48003000 {
 		#interrupt-cells = <1>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		access-controllers = <&etzpc 32>;
 		status = "disabled";
 
 		adc1: adc@0 {
diff --git a/arch/arm/boot/dts/st/stm32mp13xc.dtsi b/arch/arm/boot/dts/st/stm32mp13xc.dtsi
index b9fb071a1471..a8bd5fe6536c 100644
--- a/arch/arm/boot/dts/st/stm32mp13xc.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp13xc.dtsi
@@ -11,6 +11,7 @@ cryp: crypto@54002000 {
 		interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&rcc CRYP1>;
 		resets = <&rcc CRYP1_R>;
+		access-controllers = <&etzpc 42>;
 		status = "disabled";
 	};
 };
diff --git a/arch/arm/boot/dts/st/stm32mp13xf.dtsi b/arch/arm/boot/dts/st/stm32mp13xf.dtsi
index b9fb071a1471..a8bd5fe6536c 100644
--- a/arch/arm/boot/dts/st/stm32mp13xf.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp13xf.dtsi
@@ -11,6 +11,7 @@ cryp: crypto@54002000 {
 		interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&rcc CRYP1>;
 		resets = <&rcc CRYP1_R>;
+		access-controllers = <&etzpc 42>;
 		status = "disabled";
 	};
 };
-- 
2.35.3

