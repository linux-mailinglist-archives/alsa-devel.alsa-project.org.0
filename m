Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2164F6CEEFC
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:14:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65A0FAE8;
	Wed, 29 Mar 2023 18:13:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65A0FAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106484;
	bh=QURBN1zQ199hnqzxfeE/5zPgE/X8fr4/gmXvsz3/fuc=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uuH2j8MCLN7bu8QvnCY9I2SR981GBE7ER7AFUl7yXe9yWCV4LgYWNdby/XcmdoP4v
	 pNT09t8g92An2r4980qubr4WluzhyhoB2yymI3UvmzzltO89ACwwWB9rmxqzvbI4Op
	 2iSWQxitw2r9CidXtOWqrnYD6A+KsXddk425/AdA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1993EF8032D;
	Wed, 29 Mar 2023 18:13:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98F08F80272; Wed, 29 Mar 2023 17:36:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 929ADF80527
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 17:34:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 929ADF80527
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id CCC9824E194;
	Wed, 29 Mar 2023 23:33:34 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 29 Mar
 2023 23:33:34 +0800
Received: from localhost.localdomain (113.72.144.76) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 29 Mar
 2023 23:33:33 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Walker Chen
	<walker.chen@starfivetech.com>
Subject: [PATCH v1 3/3] riscv: dts: starfive: add tdm node and sound card
Date: Wed, 29 Mar 2023 23:33:20 +0800
Message-ID: <20230329153320.31390-4-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230329153320.31390-1-walker.chen@starfivetech.com>
References: <20230329153320.31390-1-walker.chen@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [113.72.144.76]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: walker.chen@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: EXNUEF23S3WABCZ2XE46IZLEBL2VSICV
X-Message-ID-Hash: EXNUEF23S3WABCZ2XE46IZLEBL2VSICV
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:13:32 +0000
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EXNUEF23S3WABCZ2XE46IZLEBL2VSICV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the tdm controller node and sound card for the StarFive JH7110 SoC.

Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
---
 .../jh7110-starfive-visionfive-2.dtsi         | 87 +++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 34 ++++++++
 2 files changed, 121 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index 1155b97b593d..35137c2edf5d 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -62,6 +62,10 @@
 	clock-frequency = <297000000>;
 };
 
+&wm8960_mclk {
+	clock-frequency = <24576000>;
+};
+
 &i2srx_bclk_ext {
 	clock-frequency = <12288000>;
 };
@@ -102,6 +106,14 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0_pins>;
 	status = "okay";
+
+	wm8960: codec@1a {
+		compatible = "wlf,wm8960";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+
+		wlf,shared-lrclk;
+	};
 };
 
 &i2c2 {
@@ -214,6 +226,40 @@
 			slew-rate = <0>;
 		};
 	};
+
+	tdm0_pins: tdm0-pins {
+		tdm0-pins-tx {
+			pinmux = <GPIOMUX(44, GPOUT_SYS_TDM_TXD,
+					      GPOEN_ENABLE,
+					      GPI_NONE)>;
+			bias-pull-up;
+			drive-strength = <2>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		tdm0-pins-rx {
+			pinmux = <GPIOMUX(61, GPOUT_HIGH,
+					      GPOEN_DISABLE,
+					      GPI_SYS_TDM_RXD)>;
+			input-enable;
+		};
+
+		tdm0-pins-sync {
+			pinmux = <GPIOMUX(63, GPOUT_HIGH,
+					      GPOEN_DISABLE,
+					      GPI_SYS_TDM_SYNC)>;
+			input-enable;
+		};
+
+		tdm0-pins-pcmclk {
+			pinmux = <GPIOMUX(38, GPOUT_HIGH,
+					      GPOEN_DISABLE,
+					      GPI_SYS_TDM_CLK)>;
+			input-enable;
+		};
+	};
 };
 
 &uart0 {
@@ -221,3 +267,44 @@
 	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
+
+&tdm {
+	pinctrl-names = "default";
+	pinctrl-0 = <&tdm0_pins>;
+	status = "okay";
+};
+
+&sound0 {
+	simple-audio-card,dai-link@0 {
+		reg = <0>;
+		status = "okay";
+		format = "dsp_a";
+		bitclock-master = <&dailink_master>;
+		frame-master = <&dailink_master>;
+
+		widgets =
+				"Microphone", "Mic Jack",
+				"Line", "Line In",
+				"Line", "Line Out",
+				"Speaker", "Speaker",
+				"Headphone", "Headphone Jack";
+		routing =
+				"Headphone Jack", "HP_L",
+				"Headphone Jack", "HP_R",
+				"Speaker", "SPK_LP",
+				"Speaker", "SPK_LN",
+				"LINPUT1", "Mic Jack",
+				"LINPUT3", "Mic Jack",
+				"RINPUT1", "Mic Jack",
+				"RINPUT2", "Mic Jack";
+		cpu {
+			sound-dai = <&tdm>;
+		};
+
+		dailink_master:codec {
+			sound-dai = <&wm8960>;
+			clocks = <&wm8960_mclk>;
+			clock-names = "mclk";
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index b503b6137743..a89158d1d7a6 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -210,6 +210,12 @@
 		#clock-cells = <0>;
 	};
 
+	wm8960_mclk: wm8960_mclk {
+		compatible = "fixed-clock";
+		clock-output-names = "wm8960_mclk";
+		#clock-cells = <0>;
+	};
+
 	i2srx_bclk_ext: i2srx-bclk-ext-clock {
 		compatible = "fixed-clock";
 		clock-output-names = "i2srx_bclk_ext";
@@ -375,6 +381,27 @@
 			status = "disabled";
 		};
 
+		tdm: tdm@10090000 {
+			compatible = "starfive,jh7110-tdm";
+			reg = <0x0 0x10090000 0x0 0x1000>;
+			clocks = <&syscrg JH7110_SYSCLK_TDM_AHB>,
+				 <&syscrg JH7110_SYSCLK_TDM_APB>,
+				 <&syscrg JH7110_SYSCLK_TDM_INTERNAL>,
+				 <&syscrg JH7110_SYSCLK_TDM_TDM>,
+				 <&syscrg JH7110_SYSCLK_MCLK_INNER>,
+				 <&tdm_ext>;
+			clock-names = "tdm_ahb", "tdm_apb",
+				      "tdm_internal", "tdm",
+				      "mclk_inner", "tdm_ext";
+			resets = <&syscrg JH7110_SYSRST_TDM_AHB>,
+				 <&syscrg JH7110_SYSRST_TDM_APB>,
+				 <&syscrg JH7110_SYSRST_TDM_CORE>;
+			dmas = <&dma 20>, <&dma 21>;
+			dma-names = "rx","tx";
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
 		stgcrg: clock-controller@10230000 {
 			compatible = "starfive,jh7110-stgcrg";
 			reg = <0x0 0x10230000 0x0 0x10000>;
@@ -601,5 +628,12 @@
 			#reset-cells = <1>;
 			power-domains = <&pwrc JH7110_PD_VOUT>;
 		};
+
+		sound0: snd-card0 {
+			compatible = "simple-audio-card";
+			simple-audio-card,name = "Starfive-TDM-Sound-Card";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
 	};
 };
-- 
2.17.1

