Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FC9786867
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 09:34:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C20586E;
	Thu, 24 Aug 2023 09:34:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C20586E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692862494;
	bh=ejvn2HZAAY6qIeCkyZnqZtwe6T3sPFT975+7w3Gp8lc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eNcAS3ppktSrvAGPCj3Nb0jSJi/lmrPN/NpxJtrcb6ZcP8W4jm4ElDgCGLNff2MdX
	 yqgSlNpuKl3gpx/eaiRD+EA7O5I/3rbXYUEUiaSSlBfGA61CquIqq8Fb9zbi3hLhp2
	 vFo2g7+K8T1T2fB40pogNfsZgMeW3CfHda9KZK48=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BA7DF805AC; Thu, 24 Aug 2023 09:32:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6978BF805AC;
	Thu, 24 Aug 2023 09:32:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7324F80508; Mon, 21 Aug 2023 16:42:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31490F800F8
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 16:42:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31490F800F8
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id DF0E924E2A8;
	Mon, 21 Aug 2023 22:41:56 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 21 Aug
 2023 22:41:56 +0800
Received: from localhost.localdomain (113.72.145.205) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 21 Aug
 2023 22:41:55 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Maxim Kochetkov
	<fido_max@inbox.ru>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: Jose Abreu <joabreu@synopsys.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Walker Chen <walker.chen@starfivetech.com>, "Xingyu
 Wu" <xingyu.wu@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v2 5/5] riscv: dts: starfive: Add the nodes and pins of
 I2Srx/I2Stx0/I2Stx1
Date: Mon, 21 Aug 2023 22:41:51 +0800
Message-ID: <20230821144151.207339-6-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230821144151.207339-1-xingyu.wu@starfivetech.com>
References: <20230821144151.207339-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [113.72.145.205]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
X-MailFrom: xingyu.wu@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OYJD7DHSYMBHVN5D3QWMV4TTGMM4E7M2
X-Message-ID-Hash: OYJD7DHSYMBHVN5D3QWMV4TTGMM4E7M2
X-Mailman-Approved-At: Thu, 24 Aug 2023 07:30:03 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OYJD7DHSYMBHVN5D3QWMV4TTGMM4E7M2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add I2Srx/I2Stx0/I2Stx1 nodes and pins configuration for the
StarFive JH7110 SoC.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 .../jh7110-starfive-visionfive-2.dtsi         | 58 +++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 65 +++++++++++++++++++
 2 files changed, 123 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dt=
si b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index d79f94432b27..7179f1a31cf2 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -203,6 +203,24 @@ &i2c6 {
 	status =3D "okay";
 };
=20
+&i2srx {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&i2srx_pins>;
+	status =3D "okay";
+};
+
+&i2stx0 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&mclk_ext_pins>;
+	status =3D "okay";
+};
+
+&i2stx1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&i2stx1_pins>;
+	status =3D "okay";
+};
+
 &mmc0 {
 	max-frequency =3D <100000000>;
 	bus-width =3D <8>;
@@ -337,6 +355,46 @@ GPOEN_SYS_I2C6_DATA,
 		};
 	};
=20
+	i2srx_pins: i2srx-0 {
+		clk-sd-pins {
+			pinmux =3D <GPIOMUX(38, GPOUT_LOW,
+					      GPOEN_DISABLE,
+					      GPI_SYS_I2SRX_BCLK)>,
+				 <GPIOMUX(63, GPOUT_LOW,
+					      GPOEN_DISABLE,
+					      GPI_SYS_I2SRX_LRCK)>,
+				 <GPIOMUX(38, GPOUT_LOW,
+					      GPOEN_DISABLE,
+					      GPI_SYS_I2STX1_BCLK)>,
+				 <GPIOMUX(63, GPOUT_LOW,
+					      GPOEN_DISABLE,
+					      GPI_SYS_I2STX1_LRCK)>,
+				 <GPIOMUX(61, GPOUT_LOW,
+					      GPOEN_DISABLE,
+					      GPI_SYS_I2SRX_SDIN0)>;
+			input-enable;
+		};
+	};
+
+	i2stx1_pins: i2stx1-0 {
+		sd-pins {
+			pinmux =3D <GPIOMUX(44, GPOUT_SYS_I2STX1_SDO0,
+					      GPOEN_ENABLE,
+					      GPI_NONE)>;
+			bias-disable;
+			input-disable;
+		};
+	};
+
+	mclk_ext_pins: mclk-ext-0 {
+		mclk-ext-pins {
+			pinmux =3D <GPIOMUX(4, GPOUT_LOW,
+					     GPOEN_DISABLE,
+					     GPI_SYS_MCLK_EXT)>;
+			input-enable;
+		};
+	};
+
 	mmc0_pins: mmc0-0 {
 		 rst-pins {
 			pinmux =3D <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/d=
ts/starfive/jh7110.dtsi
index e85464c328d0..621b68c02ea8 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -512,6 +512,30 @@ tdm: tdm@10090000 {
 			status =3D "disabled";
 		};
=20
+		i2srx: i2s@100e0000 {
+			compatible =3D "starfive,jh7110-i2srx";
+			reg =3D <0x0 0x100e0000 0x0 0x1000>;
+			clocks =3D <&syscrg JH7110_SYSCLK_I2SRX_BCLK_MST>,
+				 <&syscrg JH7110_SYSCLK_I2SRX_APB>,
+				 <&syscrg JH7110_SYSCLK_MCLK>,
+				 <&syscrg JH7110_SYSCLK_MCLK_INNER>,
+				 <&mclk_ext>,
+				 <&syscrg JH7110_SYSCLK_I2SRX_BCLK>,
+				 <&syscrg JH7110_SYSCLK_I2SRX_LRCK>,
+				 <&i2srx_bclk_ext>,
+				 <&i2srx_lrck_ext>;
+			clock-names =3D "i2sclk", "apb", "mclk",
+				      "mclk_inner", "mclk_ext", "bclk",
+				      "lrck", "bclk_ext", "lrck_ext";
+			resets =3D <&syscrg JH7110_SYSRST_I2SRX_APB>,
+				 <&syscrg JH7110_SYSRST_I2SRX_BCLK>;
+			dmas =3D <0>, <&dma 24>;
+			dma-names =3D "tx", "rx";
+			starfive,syscon =3D <&sys_syscon 0x18 0x2>;
+			#sound-dai-cells =3D <0>;
+			status =3D "disabled";
+		};
+
 		usb0: usb@10100000 {
 			compatible =3D "starfive,jh7110-usb";
 			ranges =3D <0x0 0x0 0x10100000 0x100000>;
@@ -736,6 +760,47 @@ spi6: spi@120a0000 {
 			status =3D "disabled";
 		};
=20
+		i2stx0: i2s@120b0000 {
+			compatible =3D "starfive,jh7110-i2stx0";
+			reg =3D <0x0 0x120b0000 0x0 0x1000>;
+			clocks =3D <&syscrg JH7110_SYSCLK_I2STX0_BCLK_MST>,
+				 <&syscrg JH7110_SYSCLK_I2STX0_APB>,
+				 <&syscrg JH7110_SYSCLK_MCLK>,
+				 <&syscrg JH7110_SYSCLK_MCLK_INNER>,
+				 <&mclk_ext>;
+			clock-names =3D "i2sclk", "apb", "mclk",
+				      "mclk_inner","mclk_ext";
+			resets =3D <&syscrg JH7110_SYSRST_I2STX0_APB>,
+				 <&syscrg JH7110_SYSRST_I2STX0_BCLK>;
+			dmas =3D <&dma 47>;
+			dma-names =3D "tx";
+			#sound-dai-cells =3D <0>;
+			status =3D "disabled";
+		};
+
+		i2stx1: i2s@120c0000 {
+			compatible =3D "starfive,jh7110-i2stx1";
+			reg =3D <0x0 0x120c0000 0x0 0x1000>;
+			clocks =3D <&syscrg JH7110_SYSCLK_I2STX1_BCLK_MST>,
+				 <&syscrg JH7110_SYSCLK_I2STX1_APB>,
+				 <&syscrg JH7110_SYSCLK_MCLK>,
+				 <&syscrg JH7110_SYSCLK_MCLK_INNER>,
+				 <&mclk_ext>,
+				 <&syscrg JH7110_SYSCLK_I2STX1_BCLK>,
+				 <&syscrg JH7110_SYSCLK_I2STX1_LRCK>,
+				 <&i2stx_bclk_ext>,
+				 <&i2stx_lrck_ext>;
+			clock-names =3D "i2sclk", "apb", "mclk",
+				      "mclk_inner", "mclk_ext", "bclk",
+				      "lrck", "bclk_ext", "lrck_ext";
+			resets =3D <&syscrg JH7110_SYSRST_I2STX1_APB>,
+				 <&syscrg JH7110_SYSRST_I2STX1_BCLK>;
+			dmas =3D <&dma 48>;
+			dma-names =3D "tx";
+			#sound-dai-cells =3D <0>;
+			status =3D "disabled";
+		};
+
 		sfctemp: temperature-sensor@120e0000 {
 			compatible =3D "starfive,jh7110-temp";
 			reg =3D <0x0 0x120e0000 0x0 0x10000>;
--=20
2.25.1

