Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EABB86FBE89
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 07:12:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE4A0113D;
	Tue,  9 May 2023 07:11:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE4A0113D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683609162;
	bh=xGb4ixEIC2wdmz+lDHXeF4R+4a9T7gPVOno8jNPqE9o=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WqwQPiDKsOZpU+12PxQojjJmkBYP+w77PNKZxeUYHf37ji2e/PCr9qsAUeTjMr8e/
	 nUU4mLJN7bTIA5R8U+VAxO1cfbIDPpQJPwsodk+aALMgd7/AQw/cNTUQwfLkU3PoFf
	 LgKs3/KEH7NN6sLnfnafO0QqlKwNimXu1HblhGkE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E325DF80310;
	Tue,  9 May 2023 07:11:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4117DF8032D; Tue,  9 May 2023 07:11:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A1FFF80217
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 07:11:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A1FFF80217
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=TB8cgSPA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kf7NNFx5UvwdjoR+N6q1ECUqFlphzBkR3U6w2w24pf+suiSuuMawGFkbMf5v6erKjKajXKsEhO1mReDIC9nyrpzvECJIGVjxULDpWaxgb6fm/G5mLKkrihQb4VSyKmhjeKbAoQjkoUnVwTSW9PzwL+ORj57xNsXUXB6HqFGwWNUyHPpoWIOZaMLfw/u/w/CFV8ZEWvW176LQESi/hC8BhRr9dOesZQlnhkPT3e+M1lTUlHuuT845gaJ71p8UO87Jpm7CZ1A4Qlm4Q6xJo7Uf4zUIqzJ3FNFjRycRvmjubUZSsNfjWd9uJf3ipxHKbgkWzKHFCbHvZoJUynlzDMB/qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vw42HSEghWLJEp3UA1886dTMS+02sU4T9IFuk2zRZG4=;
 b=jsZsgSqpp8ShWVQUBF4X1RbyjjA35cDocHgPPCMMv3TRC3PvOmbrY3N7SItc8w5yeA/ZUCw2Bwo1deuZhc6ZcS2sFgIm+tQqeLJ0Ms1BSR5kqfcuD/FiixtrYCdOS0/uWZobbs80e4X/aF7eI+rBCLqywOW/ZXEbibAzqDmS7HSioCq1dVYjY6uijJcINdfLTDTP3iUipNUf85n7xDJqsbhy4J82khWji/yIZ9wAxlH0AyGFFmfMQsTUSIZPOViC012r513kcmSmHoEY2FJRVG1i20ICmaneXU2McP49jR3nZA+BcuRnX+L5e0tCn5U10PFLzvQXkS4KnvzqbS3SRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 211.75.126.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nuvoton.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vw42HSEghWLJEp3UA1886dTMS+02sU4T9IFuk2zRZG4=;
 b=TB8cgSPAziNAPXW2KKkmMO2OU43cXz2NIkAQzUeuNgGHUBBd+0xOhbsUq8lB9/5IFg7iPUOaHogEEFG7cutFPftM7GUSvOusVogfqtYjgxR3OVUv4/+uVgP4F+QvckVieWomy4EQs3hgwQ7DO80mNkvz5xcAiGFzBe83YjVYT9c=
Received: from TYCPR01CA0103.jpnprd01.prod.outlook.com (2603:1096:405:4::19)
 by SEZPR03MB6492.apcprd03.prod.outlook.com (2603:1096:101:3b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 05:11:09 +0000
Received: from TYZAPC01FT044.eop-APC01.prod.protection.outlook.com
 (2603:1096:405:4:cafe::84) by TYCPR01CA0103.outlook.office365.com
 (2603:1096:405:4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33 via Frontend
 Transport; Tue, 9 May 2023 05:11:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 211.75.126.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 211.75.126.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.75.126.7; helo=NTHCCAS01.nuvoton.com; pr=C
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 TYZAPC01FT044.mail.protection.outlook.com (10.118.152.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.18 via Frontend Transport; Tue, 9 May 2023 05:11:09 +0000
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Tue, 9 May 2023
 13:11:06 +0800
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Tue, 9 May 2023
 13:11:05 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server id 15.1.2176.2 via Frontend Transport;
 Tue, 9 May 2023 13:11:05 +0800
From: David Lin <CTLIN0@nuvoton.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: dt-bindings: nau8825: Convert to dtschema
Date: Tue, 9 May 2023 13:10:55 +0800
Message-ID: <20230509051054.480412-1-CTLIN0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZAPC01FT044:EE_|SEZPR03MB6492:EE_
X-MS-Office365-Filtering-Correlation-Id: cc153753-4280-4830-161d-08db504bcd00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7rLL+f5k5GKidMh1OKp/+ZO+tSLkmWEVv9X9Z8fdKl7Rf/oyw7jdlm5v025BZbdhRZ+MChsX5YqQZyqLVRLRjxfd57Ud892JmBd0qJ42A2D9YQCeMnhIsBQ3zaUWrKZxNK2CwYk6QleGH7jg9Yi7komNOsYzHxbkl4cZodZCn1jyz2E+L7Yy/N3wJ1PEzl+IXw7Gg6MOFxtshwgpAgS2tCETYeFpHlRX1qa9/QDTEXRwCKiZoq7GDkwQXuhwLl99Qkvt/dqJhhAU2CDadAPkfK2MX+UEtRKBZooR/c6zSFAEhev+xND6eWQPE4V8Skso1T87nlsGo5MeJAEvuEqP/6rQkIiRcNeIMsZ0yPwAi591pOt5b3SnlF/x+RcACp6rfMDy5M+5QI9uRJBtJRdb0qcIJx7pCLO2X4M4tJ1mXLGkQyVGskw47/l6jZeb8NGDysDpZkX8rtOLO9dSvA3Iu2WE8tX480XuxqflyaFC+ncdCDbbBUSbFf+kyuPwLwmOdV06d/Hc4Zao6srgnMmQPud2pCa0egcmDrY639zO4cak+DrUYTOHHFLveA4NcqRU5I1rxaJOtwW2db/Qs/vM2WMaD4bUxT4bj2ILg+Xg78SpjNZN/BOImlM1RZaK/o5V6QEsN3BHE9WiD6IkV2+4WysACt2uAmqac7z5zzK5UqcbWdIDUAo+/HO+jYQXrG3WhN3+uq8eCc5dDetY7yTKtTz/WK1beFyXELov/FnNpuftvbQUwoJoxAkMuDbgTZDk
X-Forefront-Antispam-Report: 
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199021)(40470700004)(46966006)(36840700001)(82740400003)(356005)(2616005)(336012)(36860700001)(40480700001)(107886003)(47076005)(1076003)(426003)(26005)(186003)(33656002)(83380400001)(2906002)(8676002)(5660300002)(8936002)(81166007)(316002)(36756003)(6916009)(478600001)(966005)(54906003)(40460700003)(6666004)(70586007)(41300700001)(70206006)(86362001)(82310400005)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 05:11:09.4067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cc153753-4280-4830-161d-08db504bcd00
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	TYZAPC01FT044.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6492
Message-ID-Hash: SSD2P4EMCK7AS273EWOOHFBM52FUSWAT
X-Message-ID-Hash: SSD2P4EMCK7AS273EWOOHFBM52FUSWAT
X-MailFrom: CTLIN0@nuvoton.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 WTLI@nuvoton.com, SJLIN0@nuvoton.com, ctlin0.linux@gmail.com,
 David Lin <CTLIN0@nuvoton.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SSD2P4EMCK7AS273EWOOHFBM52FUSWAT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the NAU8825 audio CODEC bindings to DT schema.

Signed-off-by: David Lin <CTLIN0@nuvoton.com>
---
 .../devicetree/bindings/sound/nau8825.txt     | 111 ---------
 .../bindings/sound/nuvoton,nau8825.yaml       | 220 ++++++++++++++++++
 2 files changed, 220 insertions(+), 111 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/nau8825.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8825.yaml

diff --git a/Documentation/devicetree/bindings/sound/nau8825.txt b/Documentation/devicetree/bindings/sound/nau8825.txt
deleted file mode 100644
index a9c34526f4cb..000000000000
--- a/Documentation/devicetree/bindings/sound/nau8825.txt
+++ /dev/null
@@ -1,111 +0,0 @@
-Nuvoton NAU8825 audio codec
-
-This device supports I2C only.
-
-Required properties:
-  - compatible : Must be "nuvoton,nau8825"
-
-  - reg : the I2C address of the device. This is either 0x1a (CSB=0) or 0x1b (CSB=1).
-
-Optional properties:
-  - nuvoton,jkdet-enable: Enable jack detection via JKDET pin.
-  - nuvoton,jkdet-pull-enable: Enable JKDET pin pull. If set - pin pull enabled,
-      otherwise pin in high impedance state.
-  - nuvoton,jkdet-pull-up: Pull-up JKDET pin. If set then JKDET pin is pull up, otherwise pull down.
-  - nuvoton,jkdet-polarity: JKDET pin polarity. 0 - active high, 1 - active low.
-
-  - nuvoton,vref-impedance: VREF Impedance selection
-      0 - Open
-      1 - 25 kOhm
-      2 - 125 kOhm
-      3 - 2.5 kOhm
-
-  - nuvoton,micbias-voltage: Micbias voltage level.
-      0 - VDDA
-      1 - VDDA
-      2 - VDDA * 1.1
-      3 - VDDA * 1.2
-      4 - VDDA * 1.3
-      5 - VDDA * 1.4
-      6 - VDDA * 1.53
-      7 - VDDA * 1.53
-
-  - nuvoton,sar-threshold-num: Number of buttons supported
-  - nuvoton,sar-threshold: Impedance threshold for each button. Array that contains up to 8 buttons configuration. SAR value is calculated as
-    SAR = 255 * MICBIAS / SAR_VOLTAGE * R / (2000 + R)
-    where MICBIAS is configured by 'nuvoton,micbias-voltage', SAR_VOLTAGE is configured by 'nuvoton,sar-voltage', R - button impedance.
-    Refer datasheet section 10.2 for more information about threshold calculation.
-
-  - nuvoton,sar-hysteresis: Button impedance measurement hysteresis.
-
-  - nuvoton,sar-voltage: Reference voltage for button impedance measurement.
-      0 - VDDA
-      1 - VDDA
-      2 - VDDA * 1.1
-      3 - VDDA * 1.2
-      4 - VDDA * 1.3
-      5 - VDDA * 1.4
-      6 - VDDA * 1.53
-      7 - VDDA * 1.53
-
-  - nuvoton,sar-compare-time: SAR compare time
-      0 - 500 ns
-      1 - 1 us
-      2 - 2 us
-      3 - 4 us
-
-  - nuvoton,sar-sampling-time: SAR sampling time
-      0 - 2 us
-      1 - 4 us
-      2 - 8 us
-      3 - 16 us
-
-  - nuvoton,short-key-debounce: Button short key press debounce time.
-      0 - 30 ms
-      1 - 50 ms
-      2 - 100 ms
-      3 - 30 ms
-
-  - nuvoton,jack-insert-debounce: number from 0 to 7 that sets debounce time to 2^(n+2) ms
-  - nuvoton,jack-eject-debounce: number from 0 to 7 that sets debounce time to 2^(n+2) ms
-
-  - nuvoton,crosstalk-enable: make crosstalk function enable if set.
-
-  - nuvoton,adcout-drive-strong: make the drive strength of ADCOUT IO PIN strong if set.
-      Otherwise, the drive keeps normal strength.
-
-  - nuvoton,adc-delay-ms: Delay (in ms) to make input path stable and avoid pop noise. The
-      default value is 125 and range between 125 to 500 ms.
-
-  - clocks: list of phandle and clock specifier pairs according to common clock bindings for the
-      clocks described in clock-names
-  - clock-names: should include "mclk" for the MCLK master clock
-
-Example:
-
-  headset: nau8825@1a {
-      compatible = "nuvoton,nau8825";
-      reg = <0x1a>;
-      interrupt-parent = <&gpio>;
-      interrupts = <TEGRA_GPIO(E, 6) IRQ_TYPE_LEVEL_LOW>;
-      nuvoton,jkdet-enable;
-      nuvoton,jkdet-pull-enable;
-      nuvoton,jkdet-pull-up;
-      nuvoton,jkdet-polarity = <GPIO_ACTIVE_LOW>;
-      nuvoton,vref-impedance = <2>;
-      nuvoton,micbias-voltage = <6>;
-      // Setup 4 buttons impedance according to Android specification
-      nuvoton,sar-threshold-num = <4>;
-      nuvoton,sar-threshold = <0xc 0x1e 0x38 0x60>;
-      nuvoton,sar-hysteresis = <1>;
-      nuvoton,sar-voltage = <0>;
-      nuvoton,sar-compare-time = <0>;
-      nuvoton,sar-sampling-time = <0>;
-      nuvoton,short-key-debounce = <2>;
-      nuvoton,jack-insert-debounce = <7>;
-      nuvoton,jack-eject-debounce = <7>;
-      nuvoton,crosstalk-enable;
-
-      clock-names = "mclk";
-      clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_2>;
-  };
diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8825.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8825.yaml
new file mode 100644
index 000000000000..7938bf6d9190
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8825.yaml
@@ -0,0 +1,220 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nuvoton,nau8825.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NAU8825 audio CODEC
+
+maintainers:
+  - John Hsu <KCHSU0@nuvoton.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,nau8825
+
+  reg:
+    maxItems: 1
+
+  nuvoton,jkdet-enable:
+    description:
+      Enable jack detection via JKDET pin.
+    type: boolean
+
+  nuvoton,jkdet-pull-enable:
+    description:
+      Enable JKDET pin pull.
+      If set - pin pull enabled, otherwise pin in high impedance state.
+    type: boolean
+
+  nuvoton,jkdet-pull-up:
+    description:
+      Pull-up JKDET pin.
+      If set then JKDET pin is pull up, otherwise pull down.
+    type: boolean
+
+  nuvoton,jkdet-polarity:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      JKDET pin polarity.
+    enum:
+      - 0 # active high
+      - 1 # active low
+
+  nuvoton,vref-impedance:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      VREF Impedance selection.
+    enum:
+      - 0 # Open
+      - 1 # 25 kOhm
+      - 2 # 125 kOhm
+      - 3 # 2.5 kOhm
+
+  nuvoton,micbias-voltage:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Micbias voltage level.
+    enum:
+      - 0 # VDDA
+      - 1 # VDDA
+      - 2 # VDDA * 1.1
+      - 3 # VDDA * 1.2
+      - 4 # VDDA * 1.3
+      - 5 # VDDA * 1.4
+      - 6 # VDDA * 1.53
+      - 7 # VDDA * 1.53
+
+  nuvoton,sar-threshold-num:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of buttons supported.
+    minimum: 1
+    maximum: 4
+
+  nuvoton,sar-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Impedance threshold for each button. Array that contains up to 8 buttons
+      configuration. SAR value is calculated as
+      SAR = 255 * MICBIAS / SAR_VOLTAGE * R / (2000 + R) where MICBIAS is
+      configured by 'nuvoton,micbias-voltage', SAR_VOLTAGE is configured by
+      'nuvoton,sar-voltage', R - button impedance.
+      Refer datasheet section 10.2 for more information about threshold
+      calculation.
+    minItems: 1
+    maxItems: 4
+    items:
+      minimum: 0
+      maximum: 255
+
+  nuvoton,sar-hysteresis:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Button impedance measurement hysteresis.
+
+  nuvoton,sar-voltage:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Reference voltage for button impedance measurement.
+    enum:
+      - 0 # VDDA
+      - 1 # VDDA
+      - 2 # VDDA * 1.1
+      - 3 # VDDA * 1.2
+      - 4 # VDDA * 1.3
+      - 5 # VDDA * 1.4
+      - 6 # VDDA * 1.53
+      - 7 # VDDA * 1.53
+
+  nuvoton,sar-compare-time:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      SAR compare time.
+    enum:
+      - 0 # 500ns
+      - 1 # 1us
+      - 2 # 2us
+      - 3 # 4us
+
+  nuvoton,sar-sampling-time:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      SAR sampling time.
+    enum:
+      - 0 # 2us
+      - 1 # 4us
+      - 2 # 8us
+      - 3 # 16us
+
+  nuvoton,short-key-debounce:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Button short key press debounce time.
+    enum:
+      - 0 # 30 ms
+      - 1 # 50 ms
+      - 2 # 100 ms
+
+  nuvoton,jack-insert-debounce:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      number from 0 to 7 that sets debounce time to 2^(n+2) ms.
+
+  nuvoton,jack-eject-debounce:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      number from 0 to 7 that sets debounce time to 2^(n+2) ms
+
+  nuvoton,crosstalk-enable:
+    description:
+      make crosstalk function enable if set.
+    type: boolean
+
+  nuvoton,adcout-drive-strong:
+    description:
+      make the drive strength of ADCOUT IO PIN strong if set.
+      Otherwise, the drive keeps normal strength.
+    type: boolean
+
+  nuvoton,adc-delay-ms:
+    description:
+      Delay (in ms) to make input path stable and avoid pop noise.
+      The default value is 125 and range between 125 to 500 ms.
+    minimum: 125
+    maximum: 500
+
+  clocks:
+   description:
+     list of phandle and clock specifier pairs according to common clock
+     bindings for the clocks described in clock-names.
+
+  clock-names:
+   description:
+     should include "mclk" for the MCLK master clock.
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/tegra-gpio.h>
+    #include <dt-bindings/soc/tegra-pmc.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        headset: nau8825@1a {
+            compatible = "nuvoton,nau8825";
+            reg = <0x1a>;
+            interrupt-parent = <&gpio>;
+            interrupts = <TEGRA_GPIO(E, 6) IRQ_TYPE_LEVEL_LOW>;
+            nuvoton,jkdet-enable;
+            nuvoton,jkdet-pull-enable;
+            nuvoton,jkdet-pull-up;
+            nuvoton,jkdet-polarity = <GPIO_ACTIVE_LOW>;
+            nuvoton,vref-impedance = <2>;
+            nuvoton,micbias-voltage = <6>;
+            // Setup 4 buttons impedance according to Android specification
+            nuvoton,sar-threshold-num = <4>;
+            nuvoton,sar-threshold = <0xc 0x1e 0x38 0x60>;
+            nuvoton,sar-hysteresis = <1>;
+            nuvoton,sar-voltage = <0>;
+            nuvoton,sar-compare-time = <0>;
+            nuvoton,sar-sampling-time = <0>;
+            nuvoton,short-key-debounce = <2>;
+            nuvoton,jack-insert-debounce = <7>;
+            nuvoton,jack-eject-debounce = <7>;
+            nuvoton,crosstalk-enable;
+
+            clock-names = "mclk";
+            clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_2>;
+        };
+    };
-- 
2.25.1

