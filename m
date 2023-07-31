Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCBE769199
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 11:23:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62DF7820;
	Mon, 31 Jul 2023 11:22:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62DF7820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690795426;
	bh=nYqThRhr8B5NlMyzvFXiVmUF5UxucDHgao1xZMYZlDU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RAps2DKI7WkQ0vhtKWDDZf20HL2TsH8XKxS3h7fIOvVZjfP9kICtlsc6nE/xEQn6X
	 hAnD/Fr4SvGx6X8nl5J5NofWt6VXfTyGYlJ17pKIPC9iVWNkdxMqb44j34WsmGnCd3
	 Qbb+R1dx3L7nwvz+HGLtwoKK+/V+A6GN/+3UM8PA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70BC5F80656; Mon, 31 Jul 2023 11:18:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5571F80641;
	Mon, 31 Jul 2023 11:18:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1AE20F80425; Mon, 31 Jul 2023 05:28:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0CFB9F80153
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 05:28:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CFB9F80153
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 9888524E225;
	Mon, 31 Jul 2023 11:28:34 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 31 Jul
 2023 11:28:34 +0800
Received: from ubuntu.localdomain (113.72.147.196) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 31 Jul
 2023 11:28:33 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Claudiu
 Beznea" <claudiu.beznea@microchip.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Walker Chen <walker.chen@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/3] riscv: dts: starfive: Add JH7110 PWM-DAC support
Date: Mon, 31 Jul 2023 11:28:29 +0800
Message-ID: <20230731032829.127864-4-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230731032829.127864-1-hal.feng@starfivetech.com>
References: <20230731032829.127864-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [113.72.147.196]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
X-MailFrom: hal.feng@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: K7BL4PQK4ZVTR3XOEGEVPHPQT3OO7P7Q
X-Message-ID-Hash: K7BL4PQK4ZVTR3XOEGEVPHPQT3OO7P7Q
X-Mailman-Approved-At: Mon, 31 Jul 2023 09:18:36 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K7BL4PQK4ZVTR3XOEGEVPHPQT3OO7P7Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add PWM-DAC support for StarFive JH7110 SoC.

Reviewed-by: Walker Chen <walker.chen@starfivetech.com>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 .../jh7110-starfive-visionfive-2.dtsi         | 49 +++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 13 +++++
 2 files changed, 62 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dt=
si b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index f874d31006a6..98373b743019 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -38,6 +38,33 @@ gpio-restart {
 		gpios =3D <&sysgpio 35 GPIO_ACTIVE_HIGH>;
 		priority =3D <224>;
 	};
+
+	pwmdac_codec: pwmdac-codec {
+		compatible =3D "linux,spdif-dit";
+		#sound-dai-cells =3D <0>;
+	};
+
+	sound-pwmdac {
+		compatible =3D "simple-audio-card";
+		simple-audio-card,name =3D "StarFive-PWMDAC-Sound-Card";
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		simple-audio-card,dai-link@0 {
+			reg =3D <0>;
+			format =3D "left_j";
+			bitclock-master =3D <&sndcpu0>;
+			frame-master =3D <&sndcpu0>;
+
+			sndcpu0: cpu {
+				sound-dai =3D <&pwmdac>;
+			};
+
+			codec {
+				sound-dai =3D <&pwmdac_codec>;
+			};
+		};
+	};
 };
=20
 &dvp_clk {
@@ -185,6 +212,12 @@ &i2c6 {
 	status =3D "okay";
 };
=20
+&pwmdac {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pwmdac_pins>;
+	status =3D "okay";
+};
+
 &spi0 {
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D <&spi0_pins>;
@@ -254,6 +287,22 @@ GPOEN_SYS_I2C6_DATA,
 		};
 	};
=20
+	pwmdac_pins: pwmdac-0 {
+		pwmdac-pins {
+			pinmux =3D <GPIOMUX(33, GPOUT_SYS_PWMDAC_LEFT,
+					      GPOEN_ENABLE,
+					      GPI_NONE)>,
+				 <GPIOMUX(34, GPOUT_SYS_PWMDAC_RIGHT,
+					      GPOEN_ENABLE,
+					      GPI_NONE)>;
+			bias-disable;
+			drive-strength =3D <2>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate =3D <0>;
+		};
+	};
+
 	spi0_pins: spi0-0 {
 		mosi-pins {
 			pinmux =3D <GPIOMUX(52, GPOUT_SYS_SPI0_TXD,
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/d=
ts/starfive/jh7110.dtsi
index 05f843b8ca03..7f508b4475e0 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -512,6 +512,19 @@ tdm: tdm@10090000 {
 			status =3D "disabled";
 		};
=20
+		pwmdac: pwmdac@100b0000 {
+			compatible =3D "starfive,jh7110-pwmdac";
+			reg =3D <0x0 0x100b0000 0x0 0x1000>;
+			clocks =3D <&syscrg JH7110_SYSCLK_PWMDAC_APB>,
+				 <&syscrg JH7110_SYSCLK_PWMDAC_CORE>;
+			clock-names =3D "apb", "core";
+			resets =3D <&syscrg JH7110_SYSRST_PWMDAC_APB>;
+			dmas =3D <&dma 22>;
+			dma-names =3D "tx";
+			#sound-dai-cells =3D <0>;
+			status =3D "disabled";
+		};
+
 		usb0: usb@10100000 {
 			compatible =3D "starfive,jh7110-usb";
 			ranges =3D <0x0 0x0 0x10100000 0x100000>;
--=20
2.38.1

