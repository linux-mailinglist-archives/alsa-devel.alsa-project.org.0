Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A986D87CA0E
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Mar 2024 09:40:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D436B1931;
	Fri, 15 Mar 2024 09:40:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D436B1931
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710492016;
	bh=I4I3rixjwMJeA/842jOqRrN3f/SVy1MHdGDJDq85lnw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NHy0wwjI2U3Bdfe3Bz06dKI+jbzr8dtebJCqAKMCUMY7yicTcWdtIPKmVTEAmdeob
	 5HsmqI8VZkzL44Kb6AqteorFGhFDSX+EhCDTOwBjHp1hixk0o0dnKPqVY31FpX24z4
	 LNeqAixongCWqR0VgBls4dwztnEQa+g2kviwf20U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A98C0F805A1; Fri, 15 Mar 2024 09:39:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FA22F8061A;
	Fri, 15 Mar 2024 09:39:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB5E3F80563; Fri, 15 Mar 2024 00:23:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 669CAF800E4
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 00:23:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 669CAF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=salutedevices.com header.i=@salutedevices.com
 header.a=rsa-sha256 header.s=mail header.b=hQ5pRDVs
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 84D5B12000A;
	Fri, 15 Mar 2024 02:23:01 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 84D5B12000A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710458581;
	bh=dXX2ljZlOjCb/UBesDdkIeLUfuEEcHbQL62Lmr1WJIA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=hQ5pRDVsYZ0gRSXupSa0JMLr/jK2r96lKQr2SwNtxNO/UzcxdESrIW13vIc6h3R+R
	 4if/HWQwRE96/c0qsbz6cugwzJWGfFq4a6Euf2HNDbuu7xi2FgG5n7/tfuW+nwLwU5
	 Guru83Ubzjs4eaIf4Eve8dD5ePQbf7e5Ydxf1HxFcOla00BoKG2zkHyu5n62gu4kF9
	 M2XpWY49xUtnkirwm1Eh3j9F9CtzgSGQBLn94n+6XgJp2mWNZKDDTV6jkbrogYbKnJ
	 SXPYwQ1k9INqr4xuuWEZ855yjELQnVPxTQ0nnI0jR0YT3w3pmfidls/JfUot87W/rl
	 Av/kYDNSh1Bgw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru
 [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 15 Mar 2024 02:23:01 +0300 (MSK)
Received: from CAB-WSD-0003115.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 15 Mar 2024 02:23:00 +0300
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
Subject: [PATCH 03/25] dt-bindings: clock: meson: add A1 audio clock and reset
 controller bindings
Date: Fri, 15 Mar 2024 02:21:39 +0300
Message-ID: <20240314232201.2102178-4-jan.dakinevich@salutedevices.com>
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
 {Tracking_uf_ne_domains}, FromAlignment: n, {Tracking_smtp_domain_mismatch},
 {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int},
 ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/02/29 16:52:00
X-KSMG-LinksScanning: Clean, bases: 2024/02/29 16:52:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2024/02/29 19:21:00 #23899999
X-KSMG-AntiVirus-Status: Clean, skipped
X-MailFrom: YVDakinevich@sberdevices.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XIGQFRAQSQIEBFGDREJ5MVY2FUEX3AQG
X-Message-ID-Hash: XIGQFRAQSQIEBFGDREJ5MVY2FUEX3AQG
X-Mailman-Approved-At: Fri, 15 Mar 2024 08:36:32 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XIGQFRAQSQIEBFGDREJ5MVY2FUEX3AQG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 .../bindings/clock/amlogic,a1-audio-clkc.yaml |  83 ++++++++++++
 .../dt-bindings/clock/amlogic,a1-audio-clkc.h | 122 ++++++++++++++++++
 .../reset/amlogic,meson-a1-audio-reset.h      |  29 +++++
 3 files changed, 234 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml
 create mode 100644 include/dt-bindings/clock/amlogic,a1-audio-clkc.h
 create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h

diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml
new file mode 100644
index 000000000000..c76cad4da493
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,a1-audio-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic A1 Audio Clock Control Unit and Reset Controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Jerome Brunet <jbrunet@baylibre.com>
+  - Jan Dakinevich <jan.dakinevich@salutedevices.com>
+
+properties:
+  compatible:
+    const: amlogic,a1-audio-clkc
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  reg:
+    minItems: 2
+    maxItems: 2
+
+  clocks:
+    items:
+      - description: input main peripheral bus clock
+      - description: input dds_in
+      - description: input fixed pll div2
+      - description: input fixed pll div3
+      - description: input hifi_pll
+      - description: input oscillator (usually at 24MHz)
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: dds_in
+      - const: fclk_div2
+      - const: fclk_div3
+      - const: hifi_pll
+      - const: xtal
+
+required:
+  - compatible
+  - '#clock-cells'
+  - '#reset-cells'
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
+    #include <dt-bindings/clock/amlogic,a1-peripherals-clkc.h>
+    audio {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clkc_audio: audio-clock-controller@0 {
+                compatible = "amlogic,a1-audio-clkc";
+                reg = <0x0 0xfe050000 0x0 0xb0>,
+                      <0x0 0xfe054800 0x0 0x20>;
+                #clock-cells = <1>;
+                #reset-cells = <1>;
+                clocks = <&clkc_periphs CLKID_AUDIO>,
+                         <&clkc_periphs CLKID_DDS_IN>,
+                         <&clkc_pll CLKID_FCLK_DIV2>,
+                         <&clkc_pll CLKID_FCLK_DIV3>,
+                         <&clkc_pll CLKID_HIFI_PLL>,
+                         <&xtal>;
+                clock-names = "pclk",
+                              "dds_in",
+                              "fclk_div2",
+                              "fclk_div3",
+                              "hifi_pll",
+                              "xtal";
+        };
+    };
diff --git a/include/dt-bindings/clock/amlogic,a1-audio-clkc.h b/include/dt-bindings/clock/amlogic,a1-audio-clkc.h
new file mode 100644
index 000000000000..3392974784e7
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,a1-audio-clkc.h
@@ -0,0 +1,122 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2024, SaluteDevices. All Rights Reserved.
+ *
+ * Author: Jan Dakinevich <jan.dakinevich@salutedevices.com>
+ */
+
+#ifndef __A1_AUDIO_CLKC_BINDINGS_H
+#define __A1_AUDIO_CLKC_BINDINGS_H
+
+#define AUD_CLKID_DDR_ARB		1
+#define AUD_CLKID_TDMIN_A		2
+#define AUD_CLKID_TDMIN_B		3
+#define AUD_CLKID_TDMIN_LB		4
+#define AUD_CLKID_LOOPBACK		5
+#define AUD_CLKID_TDMOUT_A		6
+#define AUD_CLKID_TDMOUT_B		7
+#define AUD_CLKID_FRDDR_A		8
+#define AUD_CLKID_FRDDR_B		9
+#define AUD_CLKID_TODDR_A		10
+#define AUD_CLKID_TODDR_B		11
+#define AUD_CLKID_SPDIFIN		12
+#define AUD_CLKID_RESAMPLE		13
+#define AUD_CLKID_EQDRC			14
+#define AUD_CLKID_LOCKER		15
+#define AUD_CLKID_MST_A_MCLK_SEL	16
+#define AUD_CLKID_MST_A_MCLK_DIV	17
+#define AUD_CLKID_MST_A_MCLK		18
+#define AUD_CLKID_MST_B_MCLK_SEL	19
+#define AUD_CLKID_MST_B_MCLK_DIV	20
+#define AUD_CLKID_MST_B_MCLK		21
+#define AUD_CLKID_MST_C_MCLK_SEL	22
+#define AUD_CLKID_MST_C_MCLK_DIV	23
+#define AUD_CLKID_MST_C_MCLK		24
+#define AUD_CLKID_MST_D_MCLK_SEL	25
+#define AUD_CLKID_MST_D_MCLK_DIV	26
+#define AUD_CLKID_MST_D_MCLK		27
+#define AUD_CLKID_SPDIFIN_CLK_SEL	28
+#define AUD_CLKID_SPDIFIN_CLK_DIV	29
+#define AUD_CLKID_SPDIFIN_CLK		30
+#define AUD_CLKID_RESAMPLE_CLK_SEL	31
+#define AUD_CLKID_RESAMPLE_CLK_DIV	32
+#define AUD_CLKID_RESAMPLE_CLK		33
+#define AUD_CLKID_LOCKER_IN_CLK_SEL	34
+#define AUD_CLKID_LOCKER_IN_CLK_DIV	35
+#define AUD_CLKID_LOCKER_IN_CLK		36
+#define AUD_CLKID_LOCKER_OUT_CLK_SEL	37
+#define AUD_CLKID_LOCKER_OUT_CLK_DIV	38
+#define AUD_CLKID_LOCKER_OUT_CLK	39
+#define AUD_CLKID_EQDRC_CLK_SEL		40
+#define AUD_CLKID_EQDRC_CLK_DIV		41
+#define AUD_CLKID_EQDRC_CLK		42
+#define AUD_CLKID_MST_A_SCLK_PRE_EN	43
+#define AUD_CLKID_MST_A_SCLK_DIV	44
+#define AUD_CLKID_MST_A_SCLK_POST_EN	45
+#define AUD_CLKID_MST_A_SCLK		46
+#define AUD_CLKID_MST_B_SCLK_PRE_EN	47
+#define AUD_CLKID_MST_B_SCLK_DIV	48
+#define AUD_CLKID_MST_B_SCLK_POST_EN	49
+#define AUD_CLKID_MST_B_SCLK		50
+#define AUD_CLKID_MST_C_SCLK_PRE_EN	51
+#define AUD_CLKID_MST_C_SCLK_DIV	52
+#define AUD_CLKID_MST_C_SCLK_POST_EN	53
+#define AUD_CLKID_MST_C_SCLK		54
+#define AUD_CLKID_MST_D_SCLK_PRE_EN	55
+#define AUD_CLKID_MST_D_SCLK_DIV	56
+#define AUD_CLKID_MST_D_SCLK_POST_EN	57
+#define AUD_CLKID_MST_D_SCLK		58
+#define AUD_CLKID_MST_A_LRCLK_DIV	59
+#define AUD_CLKID_MST_A_LRCLK		60
+#define AUD_CLKID_MST_B_LRCLK_DIV	61
+#define AUD_CLKID_MST_B_LRCLK		62
+#define AUD_CLKID_MST_C_LRCLK_DIV	63
+#define AUD_CLKID_MST_C_LRCLK		64
+#define AUD_CLKID_MST_D_LRCLK_DIV	65
+#define AUD_CLKID_MST_D_LRCLK		66
+#define AUD_CLKID_TDMIN_A_SCLK_SEL	67
+#define AUD_CLKID_TDMIN_A_SCLK_PRE_EN	68
+#define AUD_CLKID_TDMIN_A_SCLK_POST_EN	69
+#define AUD_CLKID_TDMIN_A_SCLK		70
+#define AUD_CLKID_TDMIN_A_LRCLK		71
+#define AUD_CLKID_TDMIN_B_SCLK_SEL	72
+#define AUD_CLKID_TDMIN_B_SCLK_PRE_EN	73
+#define AUD_CLKID_TDMIN_B_SCLK_POST_EN	74
+#define AUD_CLKID_TDMIN_B_SCLK		75
+#define AUD_CLKID_TDMIN_B_LRCLK		76
+#define AUD_CLKID_TDMIN_LB_SCLK_SEL	77
+#define AUD_CLKID_TDMIN_LB_SCLK_PRE_EN	78
+#define AUD_CLKID_TDMIN_LB_SCLK_POST_EN	79
+#define AUD_CLKID_TDMIN_LB_SCLK		80
+#define AUD_CLKID_TDMIN_LB_LRCLK	81
+#define AUD_CLKID_TDMOUT_A_SCLK_SEL	82
+#define AUD_CLKID_TDMOUT_A_SCLK_PRE_EN	83
+#define AUD_CLKID_TDMOUT_A_SCLK_POST_EN	84
+#define AUD_CLKID_TDMOUT_A_SCLK		85
+#define AUD_CLKID_TDMOUT_A_LRCLK	86
+#define AUD_CLKID_TDMOUT_B_SCLK_SEL	87
+#define AUD_CLKID_TDMOUT_B_SCLK_PRE_EN	88
+#define AUD_CLKID_TDMOUT_B_SCLK_POST_EN	89
+#define AUD_CLKID_TDMOUT_B_SCLK		90
+#define AUD_CLKID_TDMOUT_B_LRCLK	91
+
+#define AUD2_CLKID_DDR_ARB		100
+#define AUD2_CLKID_PDM			101
+#define AUD2_CLKID_TDMIN_VAD		102
+#define AUD2_CLKID_TODDR_VAD		103
+#define AUD2_CLKID_VAD			104
+#define AUD2_CLKID_AUDIOTOP		105
+#define AUD2_CLKID_VAD_MCLK_SEL		106
+#define AUD2_CLKID_VAD_MCLK_DIV		107
+#define AUD2_CLKID_VAD_MCLK		108
+#define AUD2_CLKID_VAD_CLK_SEL		109
+#define AUD2_CLKID_VAD_CLK_DIV		110
+#define AUD2_CLKID_VAD_CLK		111
+#define AUD2_CLKID_PDM_DCLK_SEL		112
+#define AUD2_CLKID_PDM_DCLK_DIV		113
+#define AUD2_CLKID_PDM_DCLK		114
+#define AUD2_CLKID_PDM_SYSCLK_SEL	115
+#define AUD2_CLKID_PDM_SYSCLK_DIV	116
+#define AUD2_CLKID_PDM_SYSCLK		117
+
+#endif /* __A1_AUDIO_CLKC_BINDINGS_H */
diff --git a/include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h b/include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h
new file mode 100644
index 000000000000..6b7ad8ea3da2
--- /dev/null
+++ b/include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2024, SaluteDevices. All Rights Reserved.
+ *
+ * Author: Jan Dakinevich <jan.dakinevich@salutedevices.com>
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_MESON_A1_AUDIO_RESET_H
+#define _DT_BINDINGS_AMLOGIC_MESON_A1_AUDIO_RESET_H
+
+#define AUD_RESET_DDRARB	0
+#define AUD_RESET_TDMIN_A	1
+#define AUD_RESET_TDMIN_B	2
+#define AUD_RESET_TDMIN_LB	3
+#define AUD_RESET_LOOPBACK	4
+#define AUD_RESET_TDMOUT_A	5
+#define AUD_RESET_TDMOUT_B	6
+#define AUD_RESET_FRDDR_A	7
+#define AUD_RESET_FRDDR_B	8
+#define AUD_RESET_TODDR_A	9
+#define AUD_RESET_TODDR_B	10
+#define AUD_RESET_SPDIFIN	11
+#define AUD_RESET_RESAMPLE	12
+#define AUD_RESET_EQDRC		13
+#define AUD_RESET_LOCKER	14
+#define AUD_RESET_TOACODEC	30
+#define AUD_RESET_CLKTREE	31
+
+#endif
-- 
2.34.1

