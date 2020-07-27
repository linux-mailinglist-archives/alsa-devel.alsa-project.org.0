Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F025422F572
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 18:34:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98E5A169D;
	Mon, 27 Jul 2020 18:33:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98E5A169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595867664;
	bh=OLeNtOBMo3+Zai/V5aeo2s3+selVBvWlEtvX3Fb0V8s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iYvp0grMdiRtRLeeahOtils1eprjg83GB35GfjLmsh55j+EQxzbpMaoEv5A8hOaTL
	 VaUdFO53F5XzqwrXsaSasN+Dg5bMJCe9bykCQydBVFzqmJZDYjpi7Xvbm76bjoHvjN
	 ZfIDhu4EMjSH6yR56FzYWt5MjnNSI/lGJAZTHDkE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD5AFF80232;
	Mon, 27 Jul 2020 18:31:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1829F801D9; Mon, 27 Jul 2020 18:31:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 858E7F8013C
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 18:31:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 858E7F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="EadZ/aUF"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200727163148euoutp01720ce62988351c6d9d167fd336e19331~lqQs71X7i3158631586euoutp01a
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 16:31:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200727163148euoutp01720ce62988351c6d9d167fd336e19331~lqQs71X7i3158631586euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1595867508;
 bh=Mben9PLunHG9jZW3N7QEmWBehK4AfT0Cix7HBBE1Apc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EadZ/aUFBoFw4YHwVEPd7j4Cc7O3KTkaxvNxBIrFKoRGoEJdyzs3F9h2AxPN07fth
 QKQ/fdUhosloI3zpDGC1UtajqAil4UfOJiGsfq1Dmcc8YZPTcrAxEjTLe0RtKoGPEc
 wx0HrmOzkJG+ge51WhSg8bkKb/lw/3Md8bkT99kA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200727163148eucas1p12ed903227975dbf7fb8a4ab07f8a4283~lqQssSAC22793627936eucas1p1k;
 Mon, 27 Jul 2020 16:31:48 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 3E.8D.05997.4710F1F5; Mon, 27
 Jul 2020 17:31:48 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200727163148eucas1p1ed653cb71a473aa02c7508b2cc9beccf~lqQsX-CDd1546315463eucas1p1e;
 Mon, 27 Jul 2020 16:31:48 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200727163148eusmtrp16e4df98f6c42fc6bbd1e85a4693d087f~lqQsXc8hb1289612896eusmtrp1j;
 Mon, 27 Jul 2020 16:31:48 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-76-5f1f017482f3
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 7F.92.06314.3710F1F5; Mon, 27
 Jul 2020 17:31:48 +0100 (BST)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200727163147eusmtip2f70fd443e50a44de119c750cea173dc0~lqQr4_jpH0553405534eusmtip2L;
 Mon, 27 Jul 2020 16:31:47 +0000 (GMT)
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: broonie@kernel.org, krzk@kernel.org
Subject: [PATCH v2 3/3] ARM: dts: exynos: Add sound support to Midas
Date: Mon, 27 Jul 2020 18:30:27 +0200
Message-Id: <20200727163027.9242-3-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200727163027.9242-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSbUgTYRzv2d1u5+rqmoYPGlsNQxTSTIkjh1hITSoo/GaYLT3U2qbcqaWS
 qFlLncNMU7NUrNAWS11z+JKZ83VoLskPyhYmWGCZFFMhXS9uZ/Xt9/L//V8eHhwRlfH98DR1
 Js2oFUopJkTNIz9sBzOBJPHQWjGkpqcsPKqjto1PVc8vYFTj0CSfstnaBVSt7RWPMgy9F1A3
 +4YE1OCShk+ZJuxYtFDe7izC5EZ9CSYvbjNicp1JD+ROo/gsP14oS6aVadk0Exp1UZha30Jk
 dEVcc7608ApAR3Ap8MIhGQFdnSW8UiDERWQrgOuDzShHVgA03evgc8QJ4JNyzaaDeyK9Y5c5
 vQXAqqcO3r9Eb6lF4O6LkWGwfFgH3NiHDIRztUWeTgg5C2CdUYe5DW8yBj7WrHoCKHkAFo6N
 8NyYII/CxvFFwC0ogc/aXyNu7EVGQvO3B55pkNQI4Lr1DsoVxcB+s57HYW/4edQk4PBeOH5X
 i3KBGwBqe+0CjlQAODfatDUiEjom1zH3cQgZBNt6Qjn5GDRUajHu5p1w5utut4xswkpzDcLJ
 BLx9S8RVB8ANfc3WCn6wbOH31mpyuOr4jnEvpANQN1OHVgDJ/f/DmgDQA186i1Wl0OxhNX01
 hFWo2Cx1SkhSusoINr/I+K/RlS7Q47pkASQOpDuI1H5xooivyGZzVBYAcUTqQxx/M35BRCQr
 cnJpJj2RyVLSrAX446jUlwhvXkwQkSmKTPoKTWfQzF+Xh3v5FYBipcxgmKjenhB4xCru7KMZ
 yVKy9eEp9tzyUv5qWUvDnvwP0Q7lWxcWfj1wW/fP82zciaD8k1FU/Jdd4Vr7cHrs/k/brMv1
 jH1N9tw6T5hPg6TOmrxcWWvlx4B92e9mY/tolyxUEkcVUrlnHsmJF1WLC3nduilxgz86PbAx
 IEXZVEVYMMKwij86yY6UHgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFLMWRmVeSWpSXmKPExsVy+t/xe7oljPLxBi8uMFpcuXiIyWLjjPWs
 FlMfPmGzmH/kHKvF+fMb2C1mnN/HZLH2yF12i9a9R9gtDr9pZ7XYcuY2mwOXx4bPTWwem1Z1
 snm0rN/E5tG3ZRWjx+dNcgGsUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK
 +nY2Kak5mWWpRfp2CXoZs5fzFuwwqfi85xBTA+NGrS5GDg4JAROJ3Seyuhi5OIQEljJKfDrw
 jQkiLiUxv0Wpi5ETyBSW+HOtiw2i5hOjxJ6nv1hBEmwChhK9R/sYQWwRAU2Jjnm3WUGKmAUe
 MkrsP34fLCEs4CKxpP0rO4jNIqAq0XjiGBOIzStgJTH/9EtGiA3yEqs3HGAGsTkFrCW2fZgD
 ViMEVDP75lmWCYx8CxgZVjGKpJYW56bnFhvqFSfmFpfmpesl5+duYgSG87ZjPzfvYLy0MfgQ
 owAHoxIPb8Z+uXgh1sSy4srcQ4wSHMxKIrxOZ0/HCfGmJFZWpRblxxeV5qQWH2I0BTpqIrOU
 aHI+MNbySuINTQ3NLSwNzY3Njc0slMR5OwQOxggJpCeWpGanphakFsH0MXFwSjUw2rwKX/o3
 a/NO1ZJtfwufnuZOXWQd3btkvevZDY39QdIeh0Qjgs2l404IZducmnaoc7ZncCWjDQeDe/gZ
 l/MFgoeeTngqKy5zZJP0zjlde/R/VC+NXL77IEsKX19NkTxvp9cim+mmoU+/fDtz55GRZqlP
 RtpD9g3tlg/uf1Q5uW/V9JWbG6U1lFiKMxINtZiLihMBt+V1WX0CAAA=
X-CMS-MailID: 20200727163148eucas1p1ed653cb71a473aa02c7508b2cc9beccf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200727163148eucas1p1ed653cb71a473aa02c7508b2cc9beccf
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200727163148eucas1p1ed653cb71a473aa02c7508b2cc9beccf
References: <20200727163027.9242-1-s.nawrocki@samsung.com>
 <CGME20200727163148eucas1p1ed653cb71a473aa02c7508b2cc9beccf@eucas1p1.samsung.com>
Cc: simon@lineageos.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, robh+dt@kernel.org, m.szyprowski@samsung.com
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

From: Simon Shields <simon@lineageos.org>

Update the never-mainlined "samsung,trats2-audio" binding and instead
use the new "samsung,midas-audio" binding.

Signed-off-by: Simon Shields <simon@lineageos.org>
[s.nawrocki: fixed DAPM routing entries for MICBIAS1/2, adjusted to
 new cpu/codec binding, corrected the regulator nodes indexing]
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes for v2:
 - reordering to maintain alphabetical order,
 - corrected the fixed voltage regulator nodes indexing,
 - whitespace fixes.
---
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi | 42 +++++++++++++++-
 arch/arm/boot/dts/exynos4412-i9300.dts      |  4 ++
 arch/arm/boot/dts/exynos4412-midas.dtsi     | 78 ++++++++++++++++++++++++-----
 arch/arm/boot/dts/exynos4412-n710x.dts      | 37 +++++++++++++-
 4 files changed, 145 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
index 53b3ca3..89ed81f 100644
--- a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
+++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
@@ -33,7 +33,7 @@
 		};
 	};
 
-	lcd_vdd3_reg: voltage-regulator-7 {
+	lcd_vdd3_reg: voltage-regulator-10 {
 		compatible = "regulator-fixed";
 		regulator-name = "LCD_VDD_2.2V";
 		regulator-min-microvolt = <2200000>;
@@ -42,7 +42,7 @@
 		enable-active-high;
 	};
 
-	ps_als_reg: voltage-regulator-8 {
+	ps_als_reg: voltage-regulator-11 {
 		compatible = "regulator-fixed";
 		regulator-name = "LED_A_3.0V";
 		regulator-min-microvolt = <3000000>;
@@ -171,6 +171,44 @@
 	status = "okay";
 };
 
+&sound {
+	samsung,audio-routing =
+		"HP", "HPOUT1L",
+		"HP", "HPOUT1R",
+
+		"SPK", "SPKOUTLN",
+		"SPK", "SPKOUTLP",
+		"SPK", "SPKOUTRN",
+		"SPK", "SPKOUTRP",
+
+		"RCV", "HPOUT2N",
+		"RCV", "HPOUT2P",
+
+		"HDMI", "LINEOUT1N",
+		"HDMI", "LINEOUT1P",
+
+		"LINE", "LINEOUT2N",
+		"LINE", "LINEOUT2P",
+
+		"IN1LP", "MICBIAS1",
+		"IN1LN", "MICBIAS1",
+		"Main Mic", "MICBIAS1",
+
+		"IN1RP", "Sub Mic",
+		"IN1RN", "Sub Mic",
+
+		"IN2LP:VXRN", "MICBIAS2",
+		"Headset Mic", "MICBIAS2",
+
+		"IN2RN", "FM In",
+		"IN2RP:VXRP", "FM In";
+};
+
+&submic_bias_reg {
+	gpio = <&gpf2 0 GPIO_ACTIVE_HIGH>;
+	enable-active-high;
+};
+
 &touchkey_reg {
 	gpio = <&gpm0 0 GPIO_ACTIVE_HIGH>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/exynos4412-i9300.dts b/arch/arm/boot/dts/exynos4412-i9300.dts
index f8125a9..3691802 100644
--- a/arch/arm/boot/dts/exynos4412-i9300.dts
+++ b/arch/arm/boot/dts/exynos4412-i9300.dts
@@ -20,3 +20,7 @@
 		reg =  <0x40000000 0x40000000>;
 	};
 };
+
+&sound {
+	fm-sel-gpios = <&gpl0 3 GPIO_ACTIVE_HIGH>;
+};
diff --git a/arch/arm/boot/dts/exynos4412-midas.dtsi b/arch/arm/boot/dts/exynos4412-midas.dtsi
index 2c8111c..8e7a032 100644
--- a/arch/arm/boot/dts/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
@@ -102,6 +102,30 @@
 		status = "disabled";
 	};
 
+	vbatt_reg: voltage-regulator-7 {
+		compatible = "regulator-fixed";
+		regulator-name = "VBATT";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	mic_bias_reg: voltage-regulator-8 {
+		compatible = "regulator-fixed";
+		regulator-name = "MICBIAS_LDO_2.8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&gpf1 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	submic_bias_reg: voltage-regulator-9 {
+		compatible = "regulator-fixed";
+		regulator-name = "SUB_MICBIAS_LDO_2.8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
@@ -266,16 +290,18 @@
 		clock-names = "ext_clock";
 	};
 
-	sound {
-		compatible = "samsung,trats2-audio";
-		samsung,i2s-controller = <&i2s0>;
-		samsung,model = "Trats2";
-		samsung,audio-codec = <&wm1811>;
-		samsung,audio-routing =
-			"SPK", "SPKOUTLN",
-			"SPK", "SPKOUTLP",
-			"SPK", "SPKOUTRN",
-			"SPK", "SPKOUTRP";
+	sound: sound {
+		compatible = "samsung,midas-audio";
+		model = "Midas";
+		mic-bias-supply = <&mic_bias_reg>;
+		submic-bias-supply = <&submic_bias_reg>;
+
+		cpu {
+			sound-dai = <&i2s0 0>;
+		};
+		codec {
+			sound-dai = <&wm1811>;
+		};
 	};
 
 	thermistor-ap {
@@ -597,11 +623,37 @@
 	wm1811: wm1811@1a {
 		compatible = "wlf,wm1811";
 		reg = <0x1a>;
-		clocks = <&pmu_system_controller 0>;
-		clock-names = "MCLK1";
-		DCVDD-supply = <&ldo3_reg>;
+		clocks = <&pmu_system_controller 0>,
+			<&max77686 MAX77686_CLK_PMIC>;
+		clock-names = "MCLK1", "MCLK2";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpx3>;
+		interrupts = <6 IRQ_TYPE_LEVEL_HIGH>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+		#sound-dai-cells = <0>;
+
+		wlf,gpio-cfg = <0x3 0x0 0x0 0x0 0x0 0x0
+			0x0 0x8000 0x0 0x0 0x0>;
+		wlf,micbias-cfg = <0x2f 0x2b>;
+
+		wlf,lineout1-feedback;
+		wlf,lineout1-se;
+		wlf,lineout2-se;
+		wlf,ldoena-always-driven;
+
+		AVDD2-supply = <&vbatt_reg>;
 		DBVDD1-supply = <&ldo3_reg>;
+		DBVDD2-supply = <&vbatt_reg>;
+		DBVDD3-supply = <&vbatt_reg>;
+		DCVDD-supply = <&ldo3_reg>;
+		CPVDD-supply = <&vbatt_reg>;
+		SPKVDD1-supply = <&vbatt_reg>;
+		SPKVDD2-supply = <&vbatt_reg>;
 		wlf,ldo1ena = <&gpj0 4 0>;
+		wlf,ldo2ena = <&gpj0 4 0>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/exynos4412-n710x.dts b/arch/arm/boot/dts/exynos4412-n710x.dts
index 4189e1f..2361d89 100644
--- a/arch/arm/boot/dts/exynos4412-n710x.dts
+++ b/arch/arm/boot/dts/exynos4412-n710x.dts
@@ -13,7 +13,7 @@
 
 	/* bootargs are passed in by bootloader */
 
-	cam_vdda_reg: voltage-regulator-7 {
+	cam_vdda_reg: voltage-regulator-10 {
 		compatible = "regulator-fixed";
 		regulator-name = "CAM_SENSOR_CORE_1.2V";
 		regulator-min-microvolt = <1200000>;
@@ -74,6 +74,41 @@
 	status = "okay";
 };
 
+&sound {
+	samsung,audio-routing =
+		"HP", "HPOUT1L",
+		"HP", "HPOUT1R",
+
+		"SPK", "SPKOUTLN",
+		"SPK", "SPKOUTLP",
+
+		"RCV", "HPOUT2N",
+		"RCV", "HPOUT2P",
+
+		"HDMI", "LINEOUT1N",
+		"HDMI", "LINEOUT1P",
+
+		"LINE", "LINEOUT2N",
+		"LINE", "LINEOUT2P",
+
+		"IN1LP", "MICBIAS2",
+		"IN1LN", "MICBIAS2",
+		"Headset Mic", "MICBIAS2",
+
+		"IN1RP", "Sub Mic",
+		"IN1RN", "Sub Mic",
+
+		"IN2LP:VXRN", "Main Mic",
+		"IN2LN", "Main Mic",
+
+		"IN2RN", "FM In",
+		"IN2RP:VXRP", "FM In";
+};
+
+&submic_bias_reg {
+	regulator-always-on;
+};
+
 &touchkey_reg {
 	gpio = <&gpm0 5 GPIO_ACTIVE_HIGH>;
 	status = "okay";
-- 
2.7.4

