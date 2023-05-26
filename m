Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9E771A398
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 18:03:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A332C836;
	Thu,  1 Jun 2023 18:03:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A332C836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685635430;
	bh=EQt3s/YOkz8I8jiEwz6bD7X8Mh1epgP84tCXhPG9f+M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B5RLcUp6h19ybGEEDiCLCrkYW8auPs9QNrpB38WpUsDCKP0cxUGzo66kznBSqkdOh
	 TQEs1mvBkr+qUTW/M78oRIeaxUCdm4PAa0QgJtP+TsGEeXMdXSTwbOZE3YZi2YA252
	 cBWCpsBUgSHGwRHCG2g9ENyqhbq2WlmFizuh811o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A32B7F800ED; Thu,  1 Jun 2023 18:02:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24E2AF800ED;
	Thu,  1 Jun 2023 18:02:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FAAAF8016A; Fri, 26 May 2023 16:54:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34198F80249
	for <alsa-devel@alsa-project.org>; Fri, 26 May 2023 16:54:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34198F80249
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id A8FD924E203;
	Fri, 26 May 2023 22:54:06 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 26 May
 2023 22:54:06 +0800
Received: from SD-Server.starfivetech.com (183.27.98.143) by
 EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 26 May 2023 22:54:05 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>,
	Walker Chen <walker.chen@starfivetech.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v5 3/3] riscv: dts: starfive: add the node and pins
 configuration for tdm
Date: Fri, 26 May 2023 22:54:02 +0800
Message-ID: <20230526145402.450-4-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230526145402.450-1-walker.chen@starfivetech.com>
References: <20230526145402.450-1-walker.chen@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [183.27.98.143]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: walker.chen@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GBAT6E3SR5SLPSRHBPD2FW3E2LHHSXMU
X-Message-ID-Hash: GBAT6E3SR5SLPSRHBPD2FW3E2LHHSXMU
X-Mailman-Approved-At: Thu, 01 Jun 2023 16:02:25 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GBAT6E3SR5SLPSRHBPD2FW3E2LHHSXMU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the tdm controller node and pins configuration of tdm for the
StarFive JH7110 SoC.

Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
---
 .../jh7110-starfive-visionfive-2.dtsi         | 40 +++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 21 ++++++++++
 2 files changed, 61 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index 1155b97b593d..19b5954ee72d 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -214,6 +214,40 @@
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
@@ -221,3 +255,9 @@
 	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
+
+&tdm {
+	pinctrl-names = "default";
+	pinctrl-0 = <&tdm0_pins>;
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 866313570a7e..cfda6fb0d91b 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -366,6 +366,27 @@
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
-- 
2.17.1

