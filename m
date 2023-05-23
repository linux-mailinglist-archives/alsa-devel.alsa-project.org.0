Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 770F970E787
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 23:40:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBEA91EC;
	Tue, 23 May 2023 23:39:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBEA91EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684878048;
	bh=2puH30xJOO1tJsUyo3cQuQUMQn3CzTk3MJRoQB/NH/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lnag9AGacQpncaxuPedg0Fwy0m/L3g4Hh1igoy74SzXj0uRxkSJadl5P0P2UmFAqJ
	 ltnyMvTbEUd298Qi2z7GhY7mvEvNlZYSrSuUusQZW8k6tX+racygPmWxPaW8HiNIqS
	 mKTG1XUSa9oty0sduTlhcrNsXJm3npJ/a8DzHpUs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84EEAF805AC; Tue, 23 May 2023 23:39:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3C2CF80544;
	Tue, 23 May 2023 23:39:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D5D1F8057E; Tue, 23 May 2023 23:39:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78337F8053D
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 23:38:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78337F8053D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=Mm7GlLXn
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-19a16c8d70cso137265fac.2
        for <alsa-devel@alsa-project.org>;
 Tue, 23 May 2023 14:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684877916; x=1687469916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsulVc+fhmv8KkI2QxC5RbfbaiXMsyuWbYn7H0CaH/0=;
        b=Mm7GlLXnQqwKWamVeHu/wTVHqGYBmTu1PNGOFgxwCSSSUsM5gKlGi+4C6VBoSakAMg
         rJzeQOFJXuJgCTT9pfO8FmecWzeYgkoIL5af3mbXvH3r519leSKaI5BvPi7rnBDU7FfR
         zuiATXUS23/qQmboVGD96rG/Dd5RYrNy3BwXujXwU5OxMLB3EOiLE4LDTdD2S8y+jD4A
         BgSeghapxuKciJoBmJTFVpaE/M5Tc1NFMhtSXrhW2g5CXxsOE2z2kUZQ76Xfxmk7cosV
         roGWJ/NDghIhGH68J9ZN1Axs+UU7sev7iHlYV9wizazAdZZPgFfLPFnVcvMrMEmRnxR8
         UEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684877916; x=1687469916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nsulVc+fhmv8KkI2QxC5RbfbaiXMsyuWbYn7H0CaH/0=;
        b=bZroARN7J7gx4MTSepU+fgodHU6X5kNgxd7RhmVTMJtxdIqFGDUGF1Resy2w3nsKx+
         dnacYAAGNr61KI42mlCIElTHjmQ7UqkeO/CPAs8st6+R/lM+S59haH/nSSv8tFX/9sdD
         6xy3yJ77aoyaBoDpyuIwBcqxaZ86iJuCy0LLSeM8WBRBNRimm2AwH6d9F+30EyzmICub
         7txmgBG2oF8zTcMaJIVD+OwLfWZDVuJQelr9aNBDFev4mLn62OitLKtkfYrmNS6FifEs
         5ws573HYu+Z4So5oKilZEAoVABaK2+qGUgTRSmCN86qIuYwM4YiK/8CKK5D31q6KWx95
         VZvQ==
X-Gm-Message-State: AC+VfDxuSWklW2ukpoNI9WWZBksY+Ky2RLm8rXsVcPeJRrad17uzHSCf
	yeoyvY2XhXzY2Po2pvgTFM1eew4/6J0Wfg==
X-Google-Smtp-Source: 
 ACHHUZ7ej+PU2wUAjQdUMjce6wuW1Uf5fk2Lez+JryWKMDU1TcYNVAFYK/TcPCOeAnIH+rk4ilH/Nw==
X-Received: by 2002:a05:6808:3a3:b0:398:1807:84bc with SMTP id
 n3-20020a05680803a300b00398180784bcmr3054610oie.26.1684877916408;
        Tue, 23 May 2023 14:38:36 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id
 y83-20020acae156000000b0037832f60518sm4442359oig.14.2023.05.23.14.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 14:38:36 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	zyw@rock-chips.com,
	sebastian.reichel@collabora.com,
	andyshrk@163.com,
	jagan@amarulasolutions.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 6/6] arm64: dts: rockchip: Add Indiedroid Nova board
Date: Tue, 23 May 2023 16:38:25 -0500
Message-Id: <20230523213825.120077-7-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230523213825.120077-1-macroalpha82@gmail.com>
References: <20230523213825.120077-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TAIPGQO7YQUYIVFF2W4EDFA23ATVND4L
X-Message-ID-Hash: TAIPGQO7YQUYIVFF2W4EDFA23ATVND4L
X-MailFrom: macroalpha82@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TAIPGQO7YQUYIVFF2W4EDFA23ATVND4L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Chris Morgan <macromorgan@hotmail.com>

The Indiedroid Nova is an SBC from a sub-brand of Ameridroid that
includes the following hardware:

 - A 40-pin GPIO header
 - 2 USB-A 3.0 ports
 - 2 USB-A 2.0 ports
 - A USB-C 2.0 OTG port (used for USB power delivery)
 - A USB-C 3.0 port that can do display port output.
 - A Micro HDMI 2.1 port.
 - A 1GB ethernet port.
 - An RT8821CS based WiFi/Bluetooth module.
 - A user replaceable eMMC module.
 - An SDMMC card slot.
 - A MIPI DSI connector.
 - A MIPI CSI connector.
 - A 3.5mm TRRS audio jack with microphone input.
 - An 2 pin socket for an RTC battery.
 - A 4 pin socket for a debug port.
 - A power button (connected to PMIC), a reset button (connected to SoC
   reset), a boot button, and a recovery button (both connected to the
   ADC).
 - 4GB, 8GB, or 16GB of system RAM.

This initial devicetree includes support for the WiFi, bluetooth,
analog audio out/in, SDMMC, eMMC, RTC, UART debugging, and has
the regulator values from the schematics. ADC, graphics output, GPU,
USB, and wired ethernet are still pending additional upstream changes.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588s-indiedroid-nova.dts  | 761 ++++++++++++++++++
 2 files changed, 762 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 2d585bbb8f3a..99f11db8158d 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -94,5 +94,6 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-rock-3a.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-io.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-evb1-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-indiedroid-nova.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-khadas-edge2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5a.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
new file mode 100644
index 000000000000..b7070dd970e6
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
@@ -0,0 +1,761 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/usb/pd.h>
+#include "rk3588s.dtsi"
+
+/ {
+	model = "Indiedroid Nova";
+	compatible = "indiedroid,nova", "rockchip,rk3588s";
+
+	aliases {
+		mmc0 = &sdhci;
+		mmc1 = &sdmmc;
+		mmc2 = &sdio;
+		serial2 = &uart2;
+	};
+
+	chosen {
+		stdout-path = "serial2:1500000n8";
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clock-names = "ext_clock";
+		clocks = <&rtc_hym8563>;
+		pinctrl-0 = <&wifi_enable_h>;
+		pinctrl-names = "default";
+		post-power-on-delay-ms = <200>;
+		reset-gpios = <&gpio0 RK_PC7 GPIO_ACTIVE_LOW>;
+	};
+
+	sound {
+		compatible = "audio-graph-card";
+		label = "rockchip,es8388-codec";
+		widgets = "Microphone", "Mic Jack",
+			  "Headphone", "Headphones";
+		routing = "LINPUT2", "Mic Jack",
+			  "Headphones", "LOUT1",
+			  "Headphones", "ROUT1";
+		dais = <&i2s0_8ch_p0>;
+	};
+
+	vbus5v0_typec: vbus5v0-typec {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&typec5v_pwren>;
+		pinctrl-names = "default";
+		regulator-name = "vbus5v0_typec";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_usb>;
+	};
+
+	vcc_1v1_nldo_s3: vcc-1v1-nldo-s3 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1100000>;
+		regulator-min-microvolt = <1100000>;
+		regulator-name = "vcc_1v1_nldo_s3";
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	/* Regulator is enabled whenever vcc_1v8_s0 is above 1.6v */
+	vcc_3v3_s0: vcc-3v3-s0 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "vcc_3v3_s0";
+		vin-supply = <&vcc_3v3_s3>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	vcc5v0_sys: vcc5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vcc5v0_sys";
+	};
+
+	vcc5v0_usb: vcc5v0-usb {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vcc5v0_usb";
+		vin-supply = <&vcc5v0_usbdcin>;
+	};
+
+	vcc5v0_usbdcin: vcc5v0-usbdcin {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vcc5v0_usbdcin";
+	};
+};
+
+&cpu_l0 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l1 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l2 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l3 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_b0{
+	cpu-supply = <&vdd_cpu_big0_s0>;
+};
+
+&cpu_b1{
+	cpu-supply = <&vdd_cpu_big0_s0>;
+};
+
+&cpu_b2{
+	cpu-supply = <&vdd_cpu_big1_s0>;
+};
+
+&cpu_b3{
+	cpu-supply = <&vdd_cpu_big1_s0>;
+};
+
+/*
+ * Add labels for each GPIO pin exposed on the 40 pin header. Note that
+ * voltage of each GPIO pin could be either 3.3v or 1.8v (as noted by
+ * label).
+ */
+&gpio0 {
+	gpio-line-names = /* GPIO0 A0-A7 */
+			  "", "", "", "",
+			  "", "", "", "",
+			  /* GPIO0 B0-B7 */
+			  "", "", "", "",
+			  "", "", "", "",
+			  /* GPIO0 C0-C7 */
+			  "", "", "", "",
+			  "", "", "", "",
+			  /* GPIO0 D0-D7 */
+			  "HEADER_12_1v8", "", "", "HEADER_24_1v8",
+			  "", "", "", "";
+};
+
+&gpio1 {
+	gpio-line-names = /* GPIO1 A0-A7 */
+			  "HEADER_27_3v3", "HEADER_28_3v3", "", "",
+			  "HEADER_29_1v8", "", "HEADER_7_1v8", "",
+			  /* GPIO1 B0-B7 */
+			  "", "HEADER_31_1v8", "HEADER_33_1v8", "",
+			  "HEADER_11_1v8", "HEADER_13_1v8", "", "",
+			  /* GPIO1 C0-C7 */
+			  "", "", "", "",
+			  "", "", "", "",
+			  /* GPIO1 D0-D7 */
+			  "", "", "", "",
+			  "", "", "HEADER_5_3v3", "HEADER_3_3v3";
+};
+
+&gpio3 {
+	gpio-line-names = /* GPIO3 A0-A7 */
+			  "", "", "", "",
+			  "", "", "", "",
+			  /* GPIO3 B0-B7 */
+			  "HEADER_16_1v8", "HEADER_18_1v8", "", "",
+			  "", "", "", "HEADER_19_1v8",
+			  /* GPIO3 C0-C7 */
+			  "HEADER_21_1v8", "HEADER_23_1v8", "", "HEADER_26_1v8",
+			  "HEADER_15_1v8", "HEADER_22_1v8", "", "",
+			  /* GPIO3 D0-D7 */
+			  "", "", "", "",
+			  "", "", "", "";
+};
+
+&gpio4 {
+	gpio-line-names = /* GPIO4 A0-A7 */
+			  "", "", "HEADER_37_3v3", "HEADER_32_3v3",
+			  "HEADER_36_3v3", "", "HEADER_35_3v3", "HEADER_38_3v3",
+			  /* GPIO4 B0-B7 */
+			  "", "", "", "HEADER_40_3v3",
+			  "HEADER_8_3v3", "HEADER_10_3v3", "", "",
+			  /* GPIO4 C0-C7 */
+			  "", "", "", "",
+			  "", "", "", "",
+			  /* GPIO4 D0-D7 */
+			  "", "", "", "",
+			  "", "", "", "";
+};
+
+&i2c0 {
+	pinctrl-0 = <&i2c0m2_xfer>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	vdd_cpu_big0_s0: regulator@42 {
+		compatible = "rockchip,rk8602";
+		reg = <0x42>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1050000>;
+		regulator-min-microvolt = <550000>;
+		regulator-name = "vdd_cpu_big0_s0";
+		regulator-ramp-delay = <2300>;
+		fcs,suspend-voltage-selector = <1>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	vdd_cpu_big1_s0: regulator@43 {
+		compatible = "rockchip,rk8603", "rockchip,rk8602";
+		reg = <0x43>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1050000>;
+		regulator-min-microvolt = <550000>;
+		regulator-name = "vdd_cpu_big1_s0";
+		regulator-ramp-delay = <2300>;
+		fcs,suspend-voltage-selector = <1>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	vdd_npu_s0: regulator@42 {
+		compatible = "rockchip,rk8602";
+		reg = <0x42>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <950000>;
+		regulator-min-microvolt = <550000>;
+		regulator-name = "vdd_npu_s0";
+		regulator-ramp-delay = <2300>;
+		fcs,suspend-voltage-selector = <1>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
+&i2c6 {
+	pinctrl-0 = <&i2c6m3_xfer>;
+	status = "okay";
+
+	fusb302: typec-portc@22 {
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PC4 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usbc0_int>;
+		pinctrl-names = "default";
+		vbus-supply = <&vbus5v0_typec>;
+
+		connector {
+			compatible = "usb-c-connector";
+			data-role = "dual";
+			label = "USB-C";
+			power-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 1000, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <1000000>;
+		};
+	};
+
+	rtc_hym8563: rtc@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		#clock-cells = <0>;
+		clock-output-names = "hym8563";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&hym8563_int>;
+		pinctrl-names = "default";
+		wakeup-source;
+	};
+};
+
+&i2c7 {
+	pinctrl-0 = <&i2c7m0_xfer>;
+	status = "okay";
+
+	es8388: audio-codec@11 {
+		compatible = "everest,es8388";
+		reg = <0x11>;
+		AVDD-supply = <&vcc_3v3_s3>;
+		clock-names = "mclk";
+		clocks = <&cru I2S0_8CH_MCLKOUT>;
+		DVDD-supply = <&vcc_1v8_s3>;
+		HPVDD-supply = <&vcc_3v3_s3>;
+		PVDD-supply = <&vcc_1v8_s3>;
+		#sound-dai-cells = <0>;
+
+		port {
+			es8388_p0_0: endpoint {
+				remote-endpoint = <&i2s0_8ch_p0_0>;
+			};
+		};
+	};
+};
+
+&i2s0_8ch {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2s0_lrck
+		     &i2s0_mclk
+		     &i2s0_sclk
+		     &i2s0_sdi0
+		     &i2s0_sdo0>;
+	status = "okay";
+
+	i2s0_8ch_p0: port {
+		i2s0_8ch_p0_0: endpoint {
+			dai-format = "i2s";
+			mclk-fs = <256>;
+			remote-endpoint = <&es8388_p0_0>;
+		};
+	};
+};
+
+
+&pinctrl {
+	bluetooth-pins {
+		bt_reset: bt-reset {
+			rockchip,pins =
+				<0 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		bt_wake_dev: bt-wake-dev {
+			rockchip,pins =
+				<0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		bt_wake_host: bt-wake-host {
+			rockchip,pins =
+				<0 RK_PC5 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+
+	hym8563 {
+
+		hym8563_int: hym8563-int {
+			rockchip,pins =
+				<0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	sdio-pwrseq {
+		wifi_enable_h: wifi-enable-h {
+			rockchip,pins =
+				<0 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	usb-typec {
+		usbc0_int: usbc0-int {
+			rockchip,pins =
+				<0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		typec5v_pwren: typec5v-pwren {
+			rockchip,pins =
+				<4 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+/* HS400 modes seemed to cause io errors. */
+&sdhci {
+	bus-width = <8>;
+	no-mmc-hs400;
+	no-sd;
+	no-sdio;
+	non-removable;
+	max-frequency = <200000000>;
+	vmmc-supply = <&vcc_3v3_s0>;
+	vqmmc-supply = <&vcc_1v8_s3>;
+	status = "okay";
+};
+
+&sdio {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	disable-wp;
+	keep-power-in-suspend;
+	max-frequency = <100000000>;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	no-mmc;
+	no-sd;
+	non-removable;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_3v3_s3>;
+	vqmmc-supply = <&vcc_1v8_s3>;
+	status = "okay";
+};
+
+&sdmmc {
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	disable-wp;
+	max-frequency = <200000000>;
+	no-sdio;
+	no-mmc;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_3v3_s3>;
+	vqmmc-supply = <&vccio_sd_s0>;
+	status = "okay";
+};
+
+&spi2 {
+	#address-cells = <1>;
+	assigned-clocks = <&cru CLK_SPI2>;
+	assigned-clock-rates = <200000000>;
+	pinctrl-0 = <&spi2m2_pins>, <&spi2m2_cs0>;
+	pinctrl-names = "default";
+	#size-cells = <0>;
+	status = "okay";
+
+	pmic@0 {
+		compatible = "rockchip,rk806";
+		reg = <0x0>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA7 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&pmic_pins>, <&rk806_dvs1_null>,
+			    <&rk806_dvs2_null>, <&rk806_dvs3_null>;
+		pinctrl-names = "default";
+		spi-max-frequency = <1000000>;
+
+		vcc1-supply = <&vcc5v0_sys>;
+		vcc2-supply = <&vcc5v0_sys>;
+		vcc3-supply = <&vcc5v0_sys>;
+		vcc4-supply = <&vcc5v0_sys>;
+		vcc5-supply = <&vcc5v0_sys>;
+		vcc6-supply = <&vcc5v0_sys>;
+		vcc7-supply = <&vcc5v0_sys>;
+		vcc8-supply = <&vcc5v0_sys>;
+		vcc9-supply = <&vcc5v0_sys>;
+		vcc10-supply = <&vcc5v0_sys>;
+		vcc11-supply = <&vcc_2v0_pldo_s3>;
+		vcc12-supply = <&vcc5v0_sys>;
+		vcc13-supply = <&vcc_1v1_nldo_s3>;
+		vcc14-supply = <&vcc_1v1_nldo_s3>;
+		vcca-supply = <&vcc5v0_sys>;
+
+		rk806_dvs1_null: dvs1-null-pins {
+			pins = "gpio_pwrctrl2";
+			function = "pin_fun0";
+		};
+
+		rk806_dvs2_null: dvs2-null-pins {
+			pins = "gpio_pwrctrl2";
+			function = "pin_fun0";
+		};
+
+		rk806_dvs3_null: dvs3-null-pins {
+			pins = "gpio_pwrctrl3";
+			function = "pin_fun0";
+		};
+
+		regulators {
+			vdd_gpu_s0: dcdc-reg1 {
+				regulator-boot-on;
+				regulator-enable-ramp-delay = <400>;
+				regulator-max-microvolt = <950000>;
+				regulator-min-microvolt = <550000>;
+				regulator-name = "vdd_gpu_s0";
+				regulator-ramp-delay = <12500>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_cpu_lit_s0: dcdc-reg2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <950000>;
+				regulator-min-microvolt = <550000>;
+				regulator-ramp-delay = <12500>;
+				regulator-name = "vdd_cpu_lit_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_logic_s0: dcdc-reg3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <750000>;
+				regulator-min-microvolt = <675000>;
+				regulator-name = "vdd_logic_s0";
+				regulator-ramp-delay = <12500>;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <750000>;
+				};
+			};
+
+			vdd_vdenc_s0: dcdc-reg4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <950000>;
+				regulator-min-microvolt = <550000>;
+				regulator-name = "vdd_vdenc_s0";
+				regulator-ramp-delay = <12500>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_ddr_s0: dcdc-reg5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <850000>;
+				regulator-ramp-delay = <12500>;
+				regulator-name = "vdd_ddr_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <850000>;
+				};
+			};
+
+			vdd2_ddr_s3: dcdc-reg6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1100000>;
+				regulator-min-microvolt = <1100000>;
+				regulator-name = "vdd2_ddr_s3";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vcc_2v0_pldo_s3: dcdc-reg7 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <2000000>;
+				regulator-min-microvolt = <2000000>;
+				regulator-name = "vdd_2v0_pldo_s3";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <2000000>;
+				};
+			};
+
+			vcc_3v3_s3: dcdc-reg8 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <3300000>;
+				regulator-name = "vcc_3v3_s3";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vddq_ddr_s0: dcdc-reg9 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <600000>;
+				regulator-min-microvolt = <600000>;
+				regulator-name = "vddq_ddr_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_1v8_s3: dcdc-reg10 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "vcc_1v8_s3";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vcc_1v8_s0: pldo-reg1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "vcc_1v8_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcca_1v8_s0: pldo-reg2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "vcca_1v8_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vdda_1v2_s0: pldo-reg3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1200000>;
+				regulator-min-microvolt = <1200000>;
+				regulator-name = "vdda_1v2_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcca_3v3_s0: pldo-reg4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <3300000>;
+				regulator-name = "vcca_3v3_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vccio_sd_s0: pldo-reg5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "vccio_sd_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_1v8_s3_pldo6: pldo-reg6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1800000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "vcc_1v8_s3_pldo6";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vdd_0v75_s3: nldo-reg1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <750000>;
+				regulator-min-microvolt = <750000>;
+				regulator-name = "vdd_0v75_s3";
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <750000>;
+				};
+			};
+
+			vdda_ddr_pll_s0: nldo-reg2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <850000>;
+				regulator-min-microvolt = <850000>;
+				regulator-name = "vdda_ddr_pll_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <850000>;
+				};
+			};
+
+			avdd_0v75_s0: nldo-reg3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <750000>;
+				regulator-min-microvolt = <750000>;
+				regulator-name = "avdd_0v75_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda_0v85_s0: nldo-reg4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
+				regulator-name = "vdda_0v85_s0";
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			/* Schematics show not in use */
+			nldo-reg5 {
+			};
+		};
+	};
+};
+
+&tsadc {
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-0 = <&uart2m0_xfer>;
+	status = "okay";
+};
+
+/* DMA seems to interfere with bluetooth device normal operation. */
+&uart9 {
+	pinctrl-0 = <&uart9m2_xfer>, <&uart9m2_ctsn>, <&uart9m2_rtsn>;
+	pinctrl-names = "default";
+	/delete-property/ dma-names;
+	/delete-property/ dmas;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "realtek,rtl8821cs-bt",
+			     "realtek,rtl8723bs-bt";
+		device-wake-gpios = <&gpio0 RK_PC6 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio0 RK_PD4 GPIO_ACTIVE_HIGH>;
+		host-wake-gpios = <&gpio0 RK_PC5 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&bt_reset>, <&bt_wake_dev>, <&bt_wake_host>;
+		pinctrl-names = "default";
+	};
+};
-- 
2.34.1

