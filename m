Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFFA50A0C1
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 15:24:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0E8A194A;
	Thu, 21 Apr 2022 15:23:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0E8A194A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650547490;
	bh=BW7WQ3W6kZ+RnII/bQERl5LFHCGBzr3iLVESL+3zjVg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FpvrCUCjp4TaMmZnrcsUOyWie19DJg2s5X9A53WzznpxhRBrkzh6Gnb6yRxx4Z4ce
	 /gaXx4dJciO+79Arsa+e/9Bs0mnKija/ap7EoXdo9h4CDt9XRVH814BPokGnA2Fi4o
	 h9uxMrf9e0mPAF2dwnxVpgDHWB0PT3SQ3fXsDeI0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56267F8050F;
	Thu, 21 Apr 2022 15:23:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13C88F804DA; Thu, 21 Apr 2022 15:22:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB28FF80279
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 15:22:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB28FF80279
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sbzljvZw"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23LDMpVf122741;
 Thu, 21 Apr 2022 08:22:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1650547371;
 bh=7LiiS3uaYXi0Ozob531oWVwMnODCebHW1HUAZlAglKY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=sbzljvZw9zOHZ4XAmqz9/p+56bmyu+sXFwU/w+yTESTa0N+meUwguKDvBzt0VxHxj
 UiIbp8Q6jtxVvZY8kPOS5TPuC0dVY0//e5gCO9UL0yFGvGPu1BESgfbdh8cM0wnXR6
 8m87UU8dROv9ctp0/5S/yefUJa/KFbxwM55Koxco=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23LDMp9I072158
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 21 Apr 2022 08:22:51 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 21
 Apr 2022 08:22:51 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 21 Apr 2022 08:22:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23LDMoH6017305;
 Thu, 21 Apr 2022 08:22:50 -0500
From: Jai Luthra <j-luthra@ti.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jayesh Choudhary
 <j-choudhary@ti.com>
Subject: [PATCH 3/3] arm64: dts: ti: am625-sk: Add audio output support
Date: Thu, 21 Apr 2022 18:52:24 +0530
Message-ID: <20220421132224.8601-4-j-luthra@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220421132224.8601-1-j-luthra@ti.com>
References: <20220421132224.8601-1-j-luthra@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Jai Luthra <j-luthra@ti.com>, linux-kernel@vger.kernel.org,
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

Add nodes for audio codec and sound card, enable the audio serializer
(McASP1) under use and update pinmux. Disable all other McASP nodes.

Audio input is currently not working properly, so the RX port on McASP1
is disabled for now, until the issue is debugged.

The serializer is shared between HDMI and codec. By default codec is
used for output, but it can be toggled to HDMI using a FET switch
connected to the MCASP1_FET_SEL (J24) header on the board.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am625-sk.dts | 89 ++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-sk.dts b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
index a0ea2cc66b31..414f27d4a9dd 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
@@ -119,6 +119,46 @@
 			 <3300000 0x1>;
 	};
 
+	vcc_1v8: fixedregulator-vcc-1v8 {
+		/* output of TPS6282518DMQ */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3_sys>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	tlv320_mclk: tlv320-mclk {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <12288000>;
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "AM62x-SKEVM";
+		simple-audio-card,widgets =
+			"Headphone", "Headphone Jack";
+		simple-audio-card,routing =
+			"Headphone Jack",	"HPLOUT",
+			"Headphone Jack",	"HPROUT";
+		simple-audio-card,format = "dsp_b";
+		simple-audio-card,bitclock-master = <&sound_master>;
+		simple-audio-card,frame-master = <&sound_master>;
+		simple-audio-card,bitclock-inversion;
+
+		simple-audio-card,cpu {
+			sound-dai = <&mcasp1>;
+		};
+
+		sound_master: simple-audio-card,codec {
+			sound-dai = <&tlv320aic3106>;
+			clocks = <&tlv320_mclk>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -264,6 +304,15 @@
 			AM62X_IOPAD(0x01d4, PIN_INPUT, 7) /* (B15) UART0_RTSn.GPIO1_23 */
 		>;
 	};
+
+	main_mcasp1_pins_default: main-mcasp1-pins-default {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0090, PIN_INPUT, 2) /* (M24) GPMC0_BE0N_CLE.MCASP1_ACLKX */
+			AM62X_IOPAD(0x0098, PIN_INPUT, 2) /* (U23) GPMC0_WAIT0.MCASP1_AFSX */
+			AM62X_IOPAD(0x008c, PIN_OUTPUT, 2) /* (L25) GPMC0_WEN.MCASP1_AXR0 */
+			AM62X_IOPAD(0x0084, PIN_INPUT, 2) /* (L23) GPMC0_ADVN_ALE.MCASP1_AXR2 */
+		>;
+	};
 };
 
 &wkup_uart0 {
@@ -350,6 +399,18 @@
 		pinctrl-names = "default";
 		pinctrl-0 = <&main_gpio1_ioexp_intr_pins_default>;
 	};
+
+	tlv320aic3106: tlv320aic3106@1b {
+		#sound-dai-cells = <0>;
+		compatible = "ti,tlv320aic3106";
+		reg = <0x1b>;
+
+		/* Regulators */
+		AVDD-supply = <&vcc_3v3_sys>;
+		IOVDD-supply = <&vcc_3v3_sys>;
+		DRVDD-supply = <&vcc_3v3_sys>;
+		DVDD-supply = <&vcc_1v8>;
+	};
 };
 
 &main_i2c2 {
@@ -410,6 +471,34 @@
 	};
 };
 
+&mcasp0 {
+	status = "disabled";
+};
+
+&mcasp1 {
+	status = "okay";
+	#sound-dai-cells = <0>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_mcasp1_pins_default>;
+
+	op-mode = <0>;          /* MCASP_IIS_MODE */
+	tdm-slots = <2>;
+
+	serial-dir = <  /* 0: INACTIVE, 1: TX, 2: RX */
+	       1 0 0 0
+	       0 0 0 0
+	       0 0 0 0
+	       0 0 0 0
+	>;
+	tx-num-evt = <32>;
+	rx-num-evt = <32>;
+};
+
+&mcasp2 {
+	status = "disabled";
+};
+
 &mailbox0_cluster0 {
 	mbox_m4_0: mbox-m4-0 {
 		ti,mbox-rx = <0 0 0>;
-- 
2.17.1

