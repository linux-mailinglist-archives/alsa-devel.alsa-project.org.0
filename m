Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5AB73DE33
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:51:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A56B153C;
	Mon, 26 Jun 2023 13:51:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A56B153C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687780314;
	bh=bOJ2pr18imZWx8Ns1p3EcuzXo2U/vFivG6sElu7dcDU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UYnZyomusk/Ky+4GHWpTzBQPVaMz4lGDe6/Ox8Hi01vGcnYeLScClJ6C5nuJMdb2a
	 /mLS8JthNOP4iSEEadxoiltbHArtEROprV/TjDqscJNJlMTFpgER3ikKotyhMMPk7H
	 GNDreE5als0aJIIX3ugqLe4ILgipySA7jSkJBcUc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E041DF806D7; Mon, 26 Jun 2023 13:43:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86562F806C1;
	Mon, 26 Jun 2023 13:43:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E881FF80557; Mon, 26 Jun 2023 13:09:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C5D3F80549
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 13:09:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C5D3F80549
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 20B5724DED7;
	Mon, 26 Jun 2023 19:09:15 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 26 Jun
 2023 19:09:15 +0800
Received: from ubuntu.localdomain (113.72.146.167) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 26 Jun
 2023 19:09:14 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Walker
 Chen" <walker.chen@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Hal Feng
	<hal.feng@starfivetech.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 5/5] riscv: dts: starfive: Add JH7110 PWM-DAC support
Date: Mon, 26 Jun 2023 19:09:09 +0800
Message-ID: <20230626110909.38718-6-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230626110909.38718-1-hal.feng@starfivetech.com>
References: <20230626110909.38718-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [113.72.146.167]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
X-MailFrom: hal.feng@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VCSQ5TQV7M25HGVBYK56RFYJVQXRFK3G
X-Message-ID-Hash: VCSQ5TQV7M25HGVBYK56RFYJVQXRFK3G
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:42:25 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VCSQ5TQV7M25HGVBYK56RFYJVQXRFK3G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add PWM-DAC support for StarFive JH7110 SoC.

Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 .../jh7110-starfive-visionfive-2.dtsi         | 50 +++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 13 +++++
 2 files changed, 63 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dt=
si b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index 19b5954ee72d..5ca66a65e722 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -36,6 +36,34 @@ gpio-restart {
 		gpios =3D <&sysgpio 35 GPIO_ACTIVE_HIGH>;
 		priority =3D <224>;
 	};
+
+	pwmdac_dit: pwmdac-dit {
+		compatible =3D "starfive,jh7110-pwmdac-dit";
+		#sound-dai-cells =3D <0>;
+	};
+
+	sound {
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
+			status =3D "okay";
+
+			sndcpu0: cpu {
+				sound-dai =3D <&pwmdac>;
+			};
+
+			codec {
+				sound-dai =3D <&pwmdac_dit>;
+			};
+		};
+	};
 };
=20
 &dvp_clk {
@@ -191,6 +219,22 @@ GPOEN_SYS_I2C6_DATA,
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
 	uart0_pins: uart0-0 {
 		tx-pins {
 			pinmux =3D <GPIOMUX(5, GPOUT_SYS_UART0_TX,
@@ -250,6 +294,12 @@ GPOEN_DISABLE,
 	};
 };
=20
+&pwmdac {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pwmdac_pins>;
+	status =3D "okay";
+};
+
 &uart0 {
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D <&uart0_pins>;
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/d=
ts/starfive/jh7110.dtsi
index cfda6fb0d91b..bbb3f65e6f80 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -387,6 +387,19 @@ tdm: tdm@10090000 {
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
 		stgcrg: clock-controller@10230000 {
 			compatible =3D "starfive,jh7110-stgcrg";
 			reg =3D <0x0 0x10230000 0x0 0x10000>;
--=20
2.38.1

