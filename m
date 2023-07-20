Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A34F275C15D
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:21:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 042B21FC;
	Fri, 21 Jul 2023 10:20:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 042B21FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689927681;
	bh=HiPfnfO/RewwKjBQqqiiWhV7ethIzuvzFxhY2M0Rt0Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u23p9OY+YZ89fjKIZ4ihBKL94CyZicIxvrk8RTyWSldaG4rLtzvTeZhWWsfQ8pGze
	 i99G/pz/I6eq/5hzpM1oE0HhGv/k2MYaufcYTWLKmVO5Eowv51DHXXkaU8FmYgBcyW
	 tPLMB8JPF+Z0bcpSTHgYKjHmM3bRlDY+LWj8MB6g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A716F80765; Fri, 21 Jul 2023 10:12:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE268F805F4;
	Fri, 21 Jul 2023 10:12:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50D0BF80494; Thu, 20 Jul 2023 10:31:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07B07F8057B
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 10:30:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07B07F8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=b4w9WYay
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1458361C4B;
	Thu, 20 Jul 2023 08:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD980C00906;
	Thu, 20 Jul 2023 08:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689841798;
	bh=HiPfnfO/RewwKjBQqqiiWhV7ethIzuvzFxhY2M0Rt0Q=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=b4w9WYayMc5R74LxfaJp80EjRe1TDhX5WsYGAcliEFgDI5Tfcj5SPtbNfv0GT0myo
	 hA7MWxCpAKSZZXZWsczJz3nHbP6aclxuHnjvgAo4M36d1c0yC30GI6u4sFljLtOKcB
	 Q1ILcYAm3XHQflZYuhaJxrwrb6GXpaslCloDYDmY8MkEbBokxn+pDuqKiqD5TwATGt
	 xz3MGXVqdtGCDFs1oW9YBexjrpo7p/Zz1k2R2GCnzdBG/TQ0//iF01pYnY1yN2SIuL
	 GYfokKb0cncYghKw9Uncc7s+ApoUGLbZP+NZ8BJrsZCOfJg+6zA+pc7JlvXCC5SEAk
	 zim3Iqt3Nqtbg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AACCC25B5B;
	Thu, 20 Jul 2023 08:29:58 +0000 (UTC)
From: 
 Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Thu, 20 Jul 2023 14:29:34 +0300
Subject: [PATCH v3 34/42] ARM: dts: add Cirrus EP93XX SoC .dtsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230605-ep93xx-v3-34-3d63a5f1103e@maquefel.me>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
In-Reply-To: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
To: Hartley Sweeten <hsweeten@visionengravers.com>,
 Lennert Buytenhek <kernel@wantstofly.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Lukasz Majewski <lukma@denx.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Nikita Shubin <nikita.shubin@maquefel.me>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Sebastian Reichel <sre@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Damien Le Moal <dlemoal@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Andy Shevchenko <andy@kernel.org>,
 Michael Peters <mpeters@embeddedTS.com>, Kris Bahnsen <kris@embeddedTS.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
 linux-input@vger.kernel.org, alsa-devel@alsa-project.org
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689852591; l=12048;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=Sn5JOwx24yMU6hgyJY5M05n0ZFZ7aDCGYd7mf+niq68=; =?utf-8?q?b=3DAP6UAd9LAAoM?=
 =?utf-8?q?F9l6fA0q5krJZ8eTNcEteYaoAx6iai2AueUFOfrHZud6NDRRO/3wHxvmx+0vbqcH?=
 gdyrMwEQBAxn5eVDJ4+1Nk/TUvme67KbLTIakck2mvMAb/n+CaWl
X-Developer-Key: i=nikita.shubin@maquefel.me; a=ed25519;
 pk=vqf5YIUJ7BJv3EJFaNNxWZgGuMgDH6rwufTLflwU9ac=
X-Endpoint-Received: 
 by B4 Relay for nikita.shubin@maquefel.me/20230718 with auth_id=65
X-Original-From: Nikita Shubin <nikita.shubin@maquefel.me>
X-MailFrom: devnull+nikita.shubin.maquefel.me@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XKHUNIHTSU2OKZAR7IXVQM2NGL76LEGC
X-Message-ID-Hash: XKHUNIHTSU2OKZAR7IXVQM2NGL76LEGC
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:11:52 +0000
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: nikita.shubin@maquefel.me
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XKHUNIHTSU2OKZAR7IXVQM2NGL76LEGC/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Nikita Shubin <nikita.shubin@maquefel.me>

Add support for Cirrus Logic EP93XX SoC's family.

Co-developed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 arch/arm/boot/dts/cirrus/ep93xx.dtsi | 449 +++++++++++++++++++++++++++++++++++
 1 file changed, 449 insertions(+)

diff --git a/arch/arm/boot/dts/cirrus/ep93xx.dtsi b/arch/arm/boot/dts/cirrus/ep93xx.dtsi
new file mode 100644
index 000000000000..1e04f39d7b80
--- /dev/null
+++ b/arch/arm/boot/dts/cirrus/ep93xx.dtsi
@@ -0,0 +1,449 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree file for Cirrus Logic systems EP93XX SoC
+ */
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/clock/cirrus,ep93xx-clock.h>
+/ {
+	soc: soc {
+		compatible = "simple-bus";
+		ranges;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		syscon: syscon@80930000 {
+			compatible = "cirrus,ep9301-syscon",
+						 "syscon", "simple-mfd";
+			reg = <0x80930000 0x1000>;
+
+			eclk: clock-controller {
+				compatible = "cirrus,ep9301-clk";
+				#clock-cells = <1>;
+				clocks = <&xtali>;
+				status = "okay";
+			};
+
+			pinctrl: pinctrl {
+				compatible = "cirrus,ep9301-pinctrl";
+
+				spi_default_pins: pins-spi {
+					function = "spi";
+					groups = "ssp";
+				};
+
+				ac97_default_pins: pins-ac97 {
+					function = "ac97";
+					groups = "ac97";
+				};
+
+				i2s_on_ssp_pins: pins-i2sonssp {
+					function = "i2s";
+					groups = "i2s_on_ssp";
+				};
+
+				i2s_on_ac97_pins: pins-i2sonac97 {
+					function = "i2s";
+					groups = "i2s_on_ac97";
+				};
+
+				gpio1_default_pins: pins-gpio1 {
+					function = "gpio";
+					groups = "gpio1agrp";
+				};
+
+				pwm1_default_pins: pins-pwm1 {
+					function = "pwm";
+					groups = "pwm1";
+				};
+
+				gpio2_default_pins: pins-gpio2 {
+					function = "gpio";
+					groups = "gpio2agrp";
+				};
+
+				gpio3_default_pins: pins-gpio3 {
+					function = "gpio";
+					groups = "gpio3agrp";
+				};
+
+				keypad_default_pins: pins-keypad {
+					function = "keypad";
+					groups = "keypadgrp";
+				};
+
+				gpio4_default_pins: pins-gpio4 {
+					function = "gpio";
+					groups = "gpio4agrp";
+				};
+
+				gpio6_default_pins: pins-gpio6 {
+					function = "gpio";
+					groups = "gpio6agrp";
+				};
+
+				gpio7_default_pins: pins-gpio7 {
+					function = "gpio";
+					groups = "gpio7agrp";
+				};
+
+				ide_default_pins: pins-ide {
+					function = "pata";
+					groups = "idegrp";
+				};
+
+				lcd_on_dram0_pins: pins-rasteronsdram0 {
+					function = "lcd";
+					groups = "rasteronsdram0grp";
+				};
+
+				lcd_on_dram3_pins: pins-rasteronsdram3 {
+					function = "lcd";
+					groups = "rasteronsdram3grp";
+				};
+			};
+
+			reboot {
+				compatible = "cirrus,ep9301-reboot";
+			};
+		};
+
+		adc: adc@80900000 {
+			compatible = "cirrus,ep9301-adc";
+			reg = <0x80900000 0x28>;
+			clocks = <&eclk EP93XX_CLK_ADC>;
+			interrupt-parent = <&vic0>;
+			interrupts = <30>;
+			status = "disabled";
+		};
+
+		dma0: dma-controller@80000000 {
+			compatible = "cirrus,ep9301-dma-m2p";
+			reg = <0x80000000 0x0040>,
+			      <0x80000040 0x0040>,
+			      <0x80000080 0x0040>,
+			      <0x800000c0 0x0040>,
+			      <0x80000240 0x0040>,
+			      <0x80000200 0x0040>,
+			      <0x800002c0 0x0040>,
+			      <0x80000280 0x0040>,
+			      <0x80000340 0x0040>,
+			      <0x80000300 0x0040>;
+			clocks = <&eclk EP93XX_CLK_M2P0>,
+				 <&eclk EP93XX_CLK_M2P1>,
+				 <&eclk EP93XX_CLK_M2P2>,
+				 <&eclk EP93XX_CLK_M2P3>,
+				 <&eclk EP93XX_CLK_M2P4>,
+				 <&eclk EP93XX_CLK_M2P5>,
+				 <&eclk EP93XX_CLK_M2P6>,
+				 <&eclk EP93XX_CLK_M2P7>,
+				 <&eclk EP93XX_CLK_M2P8>,
+				 <&eclk EP93XX_CLK_M2P9>;
+			clock-names = "m2p0", "m2p1",
+				      "m2p2", "m2p3",
+				      "m2p4", "m2p5",
+				      "m2p6", "m2p7",
+				      "m2p8", "m2p9";
+			interrupt-parent = <&vic0>;
+			interrupts = <7>, <8>, <9>, <10>, <11>,
+				<12>, <13>, <14>, <15>, <16>;
+			#dma-cells = <1>;
+		};
+
+		dma1: dma-controller@80000100 {
+			compatible = "cirrus,ep9301-dma-m2m";
+			reg = <0x80000100 0x0040>,
+			      <0x80000140 0x0040>;
+			clocks = <&eclk EP93XX_CLK_M2M0>,
+				 <&eclk EP93XX_CLK_M2M1>;
+			clock-names = "m2m0", "m2m1";
+			interrupt-parent = <&vic0>;
+			interrupts = <17>, <18>;
+			#dma-cells = <1>;
+		};
+
+		eth0: ethernet@80010000 {
+			compatible = "cirrus,ep9301-eth";
+			reg = <0x80010000 0x10000>;
+			interrupt-parent = <&vic1>;
+			interrupts = <7>;
+			mdio0: mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		gpio0: gpio@80840000 {
+			compatible = "cirrus,ep9301-gpio";
+			reg = <0x80840000 0x04>,
+			      <0x80840010 0x04>,
+			      <0x80840090 0x1c>;
+			reg-names = "data", "dir", "intr";
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			interrupt-parent = <&vic1>;
+			interrupts = <27>;
+		};
+
+		gpio1: gpio@80840004 {
+			compatible = "cirrus,ep9301-gpio";
+			reg = <0x80840004 0x04>,
+			      <0x80840014 0x04>,
+			      <0x808400ac 0x1c>;
+			reg-names = "data", "dir", "intr";
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			interrupt-parent = <&vic1>;
+			interrupts = <27>;
+		};
+
+		gpio2: gpio@80840008 {
+			compatible = "cirrus,ep9301-gpio";
+			reg = <0x80840008 0x04>,
+			      <0x80840018 0x04>;
+			reg-names = "data", "dir";
+			gpio-controller;
+			#gpio-cells = <2>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&gpio2_default_pins>;
+			status = "disabled";
+		};
+
+		gpio3: gpio@8084000c {
+			compatible = "cirrus,ep9301-gpio";
+			reg = <0x8084000c 0x04>,
+			      <0x8084001c 0x04>;
+			reg-names = "data", "dir";
+			gpio-controller;
+			#gpio-cells = <2>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&gpio3_default_pins>;
+			status = "disabled";
+		};
+
+		gpio4: gpio@80840020 {
+			compatible = "cirrus,ep9301-gpio";
+			reg = <0x80840020 0x04>,
+			      <0x80840024 0x04>;
+			reg-names = "data", "dir";
+			gpio-controller;
+			#gpio-cells = <2>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&gpio4_default_pins>;
+			status = "disabled";
+		};
+
+		gpio5: gpio@80840030 {
+			compatible = "cirrus,ep9301-gpio";
+			reg = <0x80840030 0x04>,
+			      <0x80840034 0x04>,
+			      <0x8084004c 0x1c>;
+			reg-names = "data", "dir", "intr";
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			interrupts-extended = <&vic0 19>, <&vic0 20>,
+					      <&vic0 21>, <&vic0 22>,
+					      <&vic1 15>, <&vic1 16>,
+					      <&vic1 17>, <&vic1 18>;
+		};
+
+		gpio6: gpio@80840038 {
+			compatible = "cirrus,ep9301-gpio";
+			reg = <0x80840038 0x04>,
+			      <0x8084003c 0x04>;
+			reg-names = "data", "dir";
+			gpio-controller;
+			#gpio-cells = <2>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&gpio6_default_pins>;
+			status = "disabled";
+		};
+
+		gpio7: gpio@80840040 {
+			compatible = "cirrus,ep9301-gpio";
+			reg = <0x80840040 0x04>,
+			      <0x80840044 0x04>;
+			reg-names = "data", "dir";
+			gpio-controller;
+			#gpio-cells = <2>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&gpio7_default_pins>;
+			status = "disabled";
+		};
+
+		i2s: i2s@80820000 {
+			compatible = "cirrus,ep9301-i2s";
+			reg = <0x80820000 0x100>;
+			#sound-dai-cells = <0>;
+			interrupt-parent = <&vic1>;
+			interrupts = <28>;
+			clocks = <&eclk EP93XX_CLK_I2S_MCLK>,
+				 <&eclk EP93XX_CLK_I2S_SCLK>,
+				 <&eclk EP93XX_CLK_I2S_LRCLK>;
+			clock-names = "mclk", "sclk", "lrclk";
+			status = "disabled";
+		};
+
+		ide: ide@800a0000 {
+			compatible = "cirrus,ep9312-pata";
+			reg = <0x800a0000 0x38>;
+			interrupt-parent = <&vic1>;
+			interrupts = <8>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&ide_default_pins>;
+			status = "disabled";
+		};
+
+		vic0: interrupt-controller@800b0000 {
+			compatible = "arm,pl192-vic";
+			reg = <0x800b0000 0x1000>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			valid-mask = <0x7ffffffc>;
+			valid-wakeup-mask = <0x0>;
+		};
+
+		vic1: interrupt-controller@800c0000 {
+			compatible = "arm,pl192-vic";
+			reg = <0x800c0000 0x1000>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			valid-mask = <0x1fffffff>;
+			valid-wakeup-mask = <0x0>;
+		};
+
+		keypad: keypad@800f0000 {
+			compatible = "cirrus,ep9307-keypad";
+			reg = <0x800f0000 0x0c>;
+			interrupt-parent = <&vic0>;
+			interrupts = <29>;
+			clocks = <&eclk EP93XX_CLK_KEYPAD>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&keypad_default_pins>;
+			linux,keymap =
+					<KEY_UP>,
+					<KEY_DOWN>,
+					<KEY_VOLUMEDOWN>,
+					<KEY_HOME>,
+					<KEY_RIGHT>,
+					<KEY_LEFT>,
+					<KEY_ENTER>,
+					<KEY_VOLUMEUP>,
+					<KEY_F6>,
+					<KEY_F8>,
+					<KEY_F9>,
+					<KEY_F10>,
+					<KEY_F1>,
+					<KEY_F2>,
+					<KEY_F3>,
+					<KEY_POWER>;
+		};
+
+		pwm0: pwm@80910000 {
+			compatible = "cirrus,ep9301-pwm";
+			reg = <0x80910000 0x10>;
+			clocks = <&eclk EP93XX_CLK_PWM>;
+			status = "disabled";
+		};
+
+		pwm1: pwm@80910020 {
+			compatible = "cirrus,ep9301-pwm";
+			reg = <0x80910020 0x10>;
+			clocks = <&eclk EP93XX_CLK_PWM>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm1_default_pins>;
+			status = "disabled";
+		};
+
+		rtc0: rtc@80920000 {
+			compatible = "cirrus,ep9301-rtc";
+			reg = <0x80920000 0x100>;
+		};
+
+		spi0: spi@808a0000 {
+			compatible = "cirrus,ep9301-spi";
+			reg = <0x808a0000 0x18>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupt-parent = <&vic1>;
+			interrupts = <21>;
+			clocks = <&eclk EP93XX_CLK_SPI>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi_default_pins>;
+			status = "disabled";
+		};
+
+		timer: timer@80810000 {
+			compatible = "cirrus,ep9301-timer";
+			reg = <0x80810000 0x100>;
+			interrupt-parent = <&vic1>;
+			interrupts = <19>;
+		};
+
+		uart0: uart@808c0000 {
+			compatible = "arm,primecell";
+			reg = <0x808c0000 0x1000>;
+			arm,primecell-periphid = <0x00041010>;
+			clocks = <&eclk EP93XX_CLK_UART1>, <&eclk EP93XX_CLK_UART>;
+			clock-names = "apb:uart1", "apb_pclk";
+			interrupt-parent = <&vic1>;
+			interrupts = <20>;
+			status = "disabled";
+		};
+
+		uart1: uart@808d0000 {
+			compatible = "arm,primecell";
+			reg = <0x808d0000 0x1000>;
+			arm,primecell-periphid = <0x00041010>;
+			clocks = <&eclk EP93XX_CLK_UART2>, <&eclk EP93XX_CLK_UART>;
+			clock-names = "apb:uart2", "apb_pclk";
+			interrupt-parent = <&vic1>;
+			interrupts = <22>;
+			status = "disabled";
+		};
+
+		uart2: uart@808b0000 {
+			compatible = "arm,primecell";
+			reg = <0x808b0000 0x1000>;
+			arm,primecell-periphid = <0x00041010>;
+			clocks = <&eclk EP93XX_CLK_UART3>, <&eclk EP93XX_CLK_UART>;
+			clock-names = "apb:uart3", "apb_pclk";
+			interrupt-parent = <&vic1>;
+			interrupts = <23>;
+			status = "disabled";
+		};
+
+		usb0: usb@80020000 {
+			compatible = "generic-ohci";
+			reg = <0x80020000 0x10000>;
+			interrupt-parent = <&vic1>;
+			interrupts = <24>;
+			clocks = <&eclk EP93XX_CLK_USB>;
+			status = "disabled";
+		};
+
+		watchdog0: watchdog@80940000 {
+			compatible = "cirrus,ep9301-wdt";
+			reg = <0x80940000 0x08>;
+		};
+	};
+
+	xtali: oscillator {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <14745600>;
+		clock-output-names = "xtali";
+	};
+
+	i2c0: i2c {
+		compatible = "i2c-gpio";
+		sda-gpios = <&gpio6 1 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpio6 0 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};

-- 
2.39.2

