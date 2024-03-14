Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB4987CA2D
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Mar 2024 09:44:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 249802231;
	Fri, 15 Mar 2024 09:44:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 249802231
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710492293;
	bh=66wp3jnAGp1xOU7TQZSRM0tSG896/Gz30D1sxNVaS6w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=slX+wxqYXuF3Nz7EgUL6Emywk+zCpVC19BCzfFbeyZXTTKGHDNGOVdps4NFvSv/cD
	 zOVJF2WyyrFexZ6TGK2ZN4cySHGH3tJReN0Ur2yViwqiG5Hrr7bSDkq5R1Qhk3e9sX
	 87XXu4mzUUFaWMZ46wpyxYpTurcW0vLDldYpckrE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBC72F808C2; Fri, 15 Mar 2024 09:41:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31646F80847;
	Fri, 15 Mar 2024 09:41:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A93EF8028D; Fri, 15 Mar 2024 00:23:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57998F8057A
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 00:23:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57998F8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=salutedevices.com header.i=@salutedevices.com
 header.a=rsa-sha256 header.s=mail header.b=M70ru5P3
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id DD85710001D;
	Fri, 15 Mar 2024 02:23:09 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru DD85710001D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710458589;
	bh=oqZUNzb9EejInf+1S98aJFvRrIcXoZ0lddVRALyKqEQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=M70ru5P3wE2cJ4xyX4rcsVFpNGNl9xjoAOfDdS85VUZ3gUrU0Wh3mwd0AbVxFQcrI
	 FnBEmPgnIKlW1ioyCNRFNQY0cXzwV3aPfZWPwHvGZnMUP48fnVlRW0Fcy6JjmzHvpF
	 rYBZAKcQbrqjWyiPidBV9sNRBYaB0RilEvbrRpzeVXDoTe1ub/A2Ve5P13KSShupiJ
	 KcKaVINNQJfibv2cjakdyniyOI7SH07amius0rzDOPNmBxjxKqnLXM6zRw0ndBXDGP
	 hD6we2O5dWnNl4qV6cPJfOP6QhoiPjOktm2x9QSoElIPv46tSKzpAubqGq7bPKQZ7W
	 fYbVbkXB+iLZw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru
 [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 15 Mar 2024 02:23:09 +0300 (MSK)
Received: from CAB-WSD-0003115.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 15 Mar 2024 02:23:09 +0300
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
CC: <kernel@salutedevices.com>
Subject: [PATCH 24/25] arm64: dts: meson: a1: add audio devices
Date: Fri, 15 Mar 2024 02:22:00 +0300
Message-ID: <20240314232201.2102178-25-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183875 [Feb 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7
 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_smtp_not_equal_from},
 FromAlignment: n, {Tracking_smtp_domain_mismatch},
 {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int},
 ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2024/02/29 19:21:00 #23899999
X-KSMG-AntiVirus-Status: Clean, skipped
X-MailFrom: YVDakinevich@sberdevices.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FQOVUEA7DVLSRTULV5RD7YPJA7HBIVHF
X-Message-ID-Hash: FQOVUEA7DVLSRTULV5RD7YPJA7HBIVHF
X-Mailman-Approved-At: Fri, 15 Mar 2024 08:36:51 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FQOVUEA7DVLSRTULV5RD7YPJA7HBIVHF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This commit adds the declarartion of currently supported audio devices
and their pins found Amlog A1 SoC family. SPDIF declaration is missing
here becase there are no publicly available boards with it.

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 471 ++++++++++++++++++++++
 1 file changed, 471 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index c03e207ea6c5..eaedc2d849db 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -5,11 +5,15 @@
 
 #include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
 #include <dt-bindings/clock/amlogic,a1-peripherals-clkc.h>
+#include <dt-bindings/clock/amlogic,a1-audio-clkc.h>
 #include <dt-bindings/gpio/meson-a1-gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/power/meson-a1-power.h>
 #include <dt-bindings/reset/amlogic,meson-a1-reset.h>
+#include <dt-bindings/reset/amlogic,meson-a1-audio-reset.h>
+#include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
+#include <dt-bindings/sound/meson-g12a-toacodec.h>
 
 / {
 	compatible = "amlogic,a1";
@@ -280,6 +284,250 @@ mux {
 						function = "spif";
 					};
 				};
+
+				tdm_a_din0_pins: tdm-a-din0 {
+					mux {
+						groups = "tdm_a_din0";
+						function = "tdm_a";
+						bias-disable;
+					};
+				};
+
+				tdm_a_din1_pins: tdm-a-din1 {
+					mux {
+						groups = "tdm_a_din1";
+						function = "tdm_a";
+						bias-disable;
+					};
+				};
+
+				tdm_a_dout0_pins: tdm-a-dout0 {
+					mux {
+						groups = "tdm_a_dout0";
+						function = "tdm_a";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				tdm_a_dout1_pins: tdm-a-dout1 {
+					mux {
+						groups = "tdm_a_dout1";
+						function = "tdm_a";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				tdm_a_fs_pins: tdm-a-fs {
+					mux {
+						groups = "tdm_a_fs";
+						function = "tdm_a";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				tdm_a_sclk_pins: tdm-a-sclk {
+					mux {
+						groups = "tdm_a_sclk";
+						function = "tdm_a";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				tdm_a_slv_fs_pins: tdm-a-slv-fs {
+					mux {
+						groups = "tdm_a_slv_fs";
+						function = "tdm_a";
+						bias-disable;
+					};
+				};
+
+				tdm_a_slv_sclk_pins: tdm-a-slv-sclk {
+					mux {
+						groups = "tdm_a_slv_sclk";
+						function = "tdm_a";
+						bias-disable;
+					};
+				};
+
+				tdm_b_din0_pins: tdm-b-din0 {
+					mux {
+						groups = "tdm_b_din0";
+						function = "tdm_b";
+						bias-disable;
+					};
+				};
+
+				tdm_b_din1_pins: tdm-b-din1 {
+					mux {
+						groups = "tdm_b_din1";
+						function = "tdm_b";
+						bias-disable;
+					};
+				};
+
+				tdm_b_din2_pins: tdm-b-din2 {
+					mux {
+						groups = "tdm_b_din2";
+						function = "tdm_b";
+						bias-disable;
+					};
+				};
+
+				tdm_b_dout0_pins: tdm-b-dout0 {
+					mux {
+						groups = "tdm_b_dout0";
+						function = "tdm_b";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				tdm_b_dout1_pins: tdm-b-dout1 {
+					mux {
+						groups = "tdm_b_dout1";
+						function = "tdm_b";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				tdm_b_dout2_pins: tdm-b-dout2 {
+					mux {
+						groups = "tdm_b_dout2";
+						function = "tdm_b";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				tdm_b_dout3_pins: tdm-b-dout3 {
+					mux {
+						groups = "tdm_b_dout3";
+						function = "tdm_b";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				tdm_b_dout4_pins: tdm-b-dout4 {
+					mux {
+						groups = "tdm_b_dout4";
+						function = "tdm_b";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				tdm_b_dout5_pins: tdm-b-dout5 {
+					mux {
+						groups = "tdm_b_dout5";
+						function = "tdm_b";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				tdm_b_fs_pins: tdm-b-fs {
+					mux {
+						groups = "tdm_b_fs";
+						function = "tdm_b";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				tdm_b_sclk_pins: tdm-b-sclk {
+					mux {
+						groups = "tdm_b_sclk";
+						function = "tdm_b";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				tdm_b_slv_fs_pins: tdm-b-slv-fs {
+					mux {
+						groups = "tdm_b_slv_fs";
+						function = "tdm_b";
+						bias-disable;
+					};
+				};
+
+				tdm_b_slv_sclk_pins: tdm-b-slv-sclk {
+					mux {
+						groups = "tdm_b_slv_sclk";
+						function = "tdm_b";
+						bias-disable;
+					};
+				};
+
+				pdm_din0_a_pins: pdm-din0-a {
+					mux {
+						groups = "pdm_din0_a";
+						function = "pdm";
+						bias-disable;
+					};
+				};
+
+				pdm_din0_x_pins: pdm-din0-x {
+					mux {
+						groups = "pdm_din0_x";
+						function = "pdm";
+						bias-disable;
+					};
+				};
+
+				pdm_din1_a_pins: pdm-din1-a {
+					mux {
+						groups = "pdm_din1_a";
+						function = "pdm";
+						bias-disable;
+					};
+				};
+
+				pdm_din1_x_pins: pdm-din1-x {
+					mux {
+						groups = "pdm_din1_x";
+						function = "pdm";
+						bias-disable;
+					};
+				};
+
+				pdm_din2_a_pins: pdm-din2-a {
+					mux {
+						groups = "pdm_din2_a";
+						function = "pdm";
+						bias-disable;
+					};
+				};
+
+				pdm_din2_x_pins: pdm-din2-x {
+					mux {
+						groups = "pdm_din2_x";
+						function = "pdm";
+						bias-disable;
+					};
+				};
+
+				pdm_dclk_a_pins: pdm-dclk-a {
+					mux {
+						groups = "pdm_dclk_a";
+						function = "pdm";
+						bias-disable;
+					};
+				};
+
+				pdm_dclk_x_pins: pdm-dclk-x {
+					mux {
+						groups = "pdm_dclk_x";
+						function = "pdm";
+						bias-disable;
+					};
+				};
 			};
 
 			gpio_intc: interrupt-controller@440 {
@@ -435,6 +683,207 @@ sd_emmc: sd@10000 {
 				power-domains = <&pwrc PWRC_SD_EMMC_ID>;
 				status = "disabled";
 			};
+
+			acodec: audio-controller@4800 {
+				compatible = "amlogic,t9015-a1";
+				reg = <0x0 0x4800 0x0 0x14>;
+				#sound-dai-cells = <0>;
+				sound-name-prefix = "ACODEC";
+				clocks = <&clkc_periphs CLKID_AUDIO>;
+				clock-names = "pclk";
+				resets = <&reset RESET_ACODEC>;
+				power-domains = <&pwrc PWRC_ACODEC_ID>;
+			};
+
+			audio: bus@50000 {
+				compatible = "simple-bus";
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges = <0x0 0x0 0x0 0x50000 0 0x4980>;
+				power-domains = <&pwrc PWRC_AUDIO_ID>;
+
+				clkc_audio: audio-clock-controller@0 {
+					compatible = "amlogic,a1-audio-clkc";
+					reg = <0x0 0x0 0x0 0xb0>,
+					      <0x0 0x4800 0x0 0x20>;
+					#clock-cells = <1>;
+					#reset-cells = <1>;
+					clocks = <&clkc_periphs CLKID_AUDIO>,
+						 <&clkc_periphs CLKID_DDS_IN>,
+						 <&clkc_pll CLKID_FCLK_DIV2>,
+						 <&clkc_pll CLKID_FCLK_DIV3>,
+						 <&clkc_pll CLKID_HIFI_PLL>,
+						 <&xtal>;
+					clock-names = "pclk", "dds_in",
+						      "fclk_div2", "fclk_div3",
+						      "hifi_pll", "xtal";
+				};
+
+				toddr_a: audio-controller@100 {
+					compatible = "amlogic,a1-toddr",
+						     "amlogic,sm1-toddr",
+						     "amlogic,axg-toddr";
+					reg = <0x0 0x100 0x0 0x2c>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "TODDR_A";
+					interrupts = <GIC_SPI 37 IRQ_TYPE_EDGE_RISING>;
+					clocks = <&clkc_audio AUD_CLKID_TODDR_A>;
+					resets = <&arb AXG_ARB_TODDR_A>,
+						 <&clkc_audio AUD_RESET_TODDR_A>;
+					reset-names = "arb", "rst";
+					amlogic,fifo-depth = <128>;
+				};
+
+				toddr_b: audio-controller@140 {
+					compatible = "amlogic,a1-toddr",
+						     "amlogic,sm1-toddr",
+						     "amlogic,axg-toddr";
+					reg = <0x0 0x140 0x0 0x2c>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "TODDR_B";
+					interrupts = <GIC_SPI 38 IRQ_TYPE_EDGE_RISING>;
+					clocks = <&clkc_audio AUD_CLKID_TODDR_B>;
+					resets = <&arb AXG_ARB_TODDR_B>,
+						 <&clkc_audio AUD_RESET_TODDR_B>;
+					reset-names = "arb", "rst";
+					amlogic,fifo-depth = <128>;
+				};
+
+				frddr_a: audio-controller@1c0 {
+					compatible = "amlogic,a1-frddr",
+						     "amlogic,sm1-frddr",
+						     "amlogic,axg-frddr";
+					reg = <0x0 0x1c0 0x0 0x2c>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "FRDDR_A";
+					interrupts = <GIC_SPI 40 IRQ_TYPE_EDGE_RISING>;
+					clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
+					resets = <&arb AXG_ARB_FRDDR_A>,
+						 <&clkc_audio AUD_RESET_FRDDR_A>;
+					reset-names = "arb", "rst";
+					amlogic,fifo-depth = <128>;
+				};
+
+				frddr_b: audio-controller@200 {
+					compatible = "amlogic,a1-frddr",
+						     "amlogic,sm1-frddr",
+						     "amlogic,axg-frddr";
+					reg = <0x0 0x200 0x0 0x2c>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "FRDDR_B";
+					interrupts = <GIC_SPI 41 IRQ_TYPE_EDGE_RISING>;
+					clocks = <&clkc_audio AUD_CLKID_FRDDR_B>;
+					resets = <&arb AXG_ARB_FRDDR_B>,
+						 <&clkc_audio AUD_RESET_FRDDR_B>;
+					reset-names = "arb", "rst";
+					amlogic,fifo-depth = <128>;
+				};
+
+				arb: reset-controller@280 {
+					compatible = "amlogic,meson-a1-audio-arb",
+						     "amlogic,meson-sm1-audio-arb";
+					reg = <0x0 0x280 0x0 0x4>;
+					#reset-cells = <1>;
+					clocks = <&clkc_audio AUD_CLKID_DDR_ARB>;
+				};
+
+				tdmin_a: audio-controller@300 {
+					compatible = "amlogic,a1-tdmin",
+						     "amlogic,sm1-tdmin";
+					reg = <0x0 0x300 0x0 0x40>;
+					sound-name-prefix = "TDMIN_A";
+					clocks = <&clkc_audio AUD_CLKID_TDMIN_A>,
+						 <&clkc_audio AUD_CLKID_TDMIN_A_SCLK>,
+						 <&clkc_audio AUD_CLKID_TDMIN_A_SCLK_SEL>,
+						 <&clkc_audio AUD_CLKID_TDMIN_A_LRCLK>,
+						 <&clkc_audio AUD_CLKID_TDMIN_A_LRCLK>;
+					clock-names = "pclk", "sclk", "sclk_sel",
+						      "lrclk", "lrclk_sel";
+					resets = <&clkc_audio AUD_RESET_TDMIN_A>;
+				};
+
+				tdmin_b: audio-controller@340 {
+					compatible = "amlogic,a1-tdmin",
+						     "amlogic,sm1-tdmin";
+					reg = <0x0 0x340 0x0 0x40>;
+					sound-name-prefix = "TDMIN_B";
+					clocks = <&clkc_audio AUD_CLKID_TDMIN_B>,
+						 <&clkc_audio AUD_CLKID_TDMIN_B_SCLK>,
+						 <&clkc_audio AUD_CLKID_TDMIN_B_SCLK_SEL>,
+						 <&clkc_audio AUD_CLKID_TDMIN_B_LRCLK>,
+						 <&clkc_audio AUD_CLKID_TDMIN_B_LRCLK>;
+					clock-names = "pclk", "sclk", "sclk_sel",
+						      "lrclk", "lrclk_sel";
+					resets = <&clkc_audio AUD_RESET_TDMIN_B>;
+				};
+
+				tdmin_lb: audio-controller@3c0 {
+					compatible = "amlogic,a1-tdmin",
+						     "amlogic,sm1-tdmin";
+					reg = <0x0 0x3c0 0x0 0x40>;
+					sound-name-prefix = "TDMIN_LB";
+					clocks = <&clkc_audio AUD_CLKID_TDMIN_LB>,
+						 <&clkc_audio AUD_CLKID_TDMIN_LB_SCLK>,
+						 <&clkc_audio AUD_CLKID_TDMIN_LB_SCLK_SEL>,
+						 <&clkc_audio AUD_CLKID_TDMIN_LB_LRCLK>,
+						 <&clkc_audio AUD_CLKID_TDMIN_LB_LRCLK>;
+					clock-names = "pclk", "sclk", "sclk_sel",
+						      "lrclk", "lrclk_sel";
+					resets = <&clkc_audio AUD_RESET_TDMIN_LB>;
+				};
+
+				tdmout_a: audio-controller@500 {
+					compatible = "amlogic,a1-tdmout",
+						     "amlogic,sm1-tdmout";
+					reg = <0x0 0x500 0x0 0x40>;
+					sound-name-prefix = "TDMOUT_A";
+					clocks = <&clkc_audio AUD_CLKID_TDMOUT_A>,
+						 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK>,
+						 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK_SEL>,
+						 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>,
+						 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>;
+					clock-names = "pclk", "sclk", "sclk_sel",
+						      "lrclk", "lrclk_sel";
+					resets = <&clkc_audio AUD_RESET_TDMOUT_A>;
+				};
+
+				tdmout_b: audio-controller@540 {
+					compatible = "amlogic,a1-tdmout",
+						     "amlogic,sm1-tdmout";
+					reg = <0x0 0x540 0x0 0x40>;
+					sound-name-prefix = "TDMOUT_B";
+					clocks = <&clkc_audio AUD_CLKID_TDMOUT_B>,
+						 <&clkc_audio AUD_CLKID_TDMOUT_B_SCLK>,
+						 <&clkc_audio AUD_CLKID_TDMOUT_B_SCLK_SEL>,
+						 <&clkc_audio AUD_CLKID_TDMOUT_B_LRCLK>,
+						 <&clkc_audio AUD_CLKID_TDMOUT_B_LRCLK>;
+					clock-names = "pclk", "sclk", "sclk_sel",
+						      "lrclk", "lrclk_sel";
+					resets = <&clkc_audio AUD_RESET_TDMOUT_B>;
+				};
+
+				toacodec: audio-controller@740 {
+					compatible = "amlogic,a1-toacodec",
+						     "amlogic,g12a-toacodec";
+					reg = <0x0 0x740 0x0 0x4>;
+					#sound-dai-cells = <1>;
+					sound-name-prefix = "TOACODEC";
+					resets = <&clkc_audio AUD_RESET_TOACODEC>;
+				};
+
+				pdm: audio-controller@1000 {
+					compatible = "amlogic,a1-pdm",
+						     "amlogic,axg-pdm";
+					reg = <0x0 0x1000 0x0 0x34>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "PDM";
+					clocks = <&clkc_audio AUD2_CLKID_PDM>,
+						 <&clkc_audio AUD2_CLKID_PDM_DCLK>,
+						 <&clkc_audio AUD2_CLKID_PDM_SYSCLK>;
+					clock-names = "pclk", "dclk", "sysclk";
+					power-domains = <&pwrc PWRC_PDMIN_ID>;
+				};
+			};
 		};
 
 		usb: usb@fe004400 {
@@ -517,4 +966,26 @@ xtal: xtal-clk {
 		clock-output-names = "xtal";
 		#clock-cells = <0>;
 	};
+
+	tdmif_a: audio-controller-0 {
+		compatible = "amlogic,a1-tdm-iface",
+			     "amlogic,axg-tdm-iface";
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TDM_A";
+		clocks = <&clkc_audio AUD_CLKID_MST_A_SCLK>,
+			 <&clkc_audio AUD_CLKID_MST_A_LRCLK>,
+			 <&clkc_audio AUD_CLKID_MST_A_MCLK>;
+		clock-names = "sclk", "lrclk", "mclk";
+	};
+
+	tdmif_b: audio-controller-1 {
+		compatible = "amlogic,a1-tdm-iface",
+			     "amlogic,axg-tdm-iface";
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TDM_B";
+		clocks = <&clkc_audio AUD_CLKID_MST_B_SCLK>,
+			 <&clkc_audio AUD_CLKID_MST_B_LRCLK>,
+			 <&clkc_audio AUD_CLKID_MST_B_MCLK>;
+		clock-names = "sclk", "lrclk", "mclk";
+	};
 };
-- 
2.34.1

