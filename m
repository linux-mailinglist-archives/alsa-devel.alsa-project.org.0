Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C363A6FF09A
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 13:37:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD88E847;
	Thu, 11 May 2023 13:36:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD88E847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683805064;
	bh=xKpDp+Xydq/aFyDy+Nqku5vcF4CrFFabiO47a4WsMEs=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YYZbK93cNOybETebgEBy5I71iMF7DN4zz+qPg/Eel1sCCTGDxUjD1wm4zxrAhazGG
	 LqZrDw/tBRvvF+RgXZpXUhCWe1/iCuKC7t+T2V3cZwGTVveSjdyNY1ALvsWnf9w3wp
	 Kdn3p+zfmFLehtUnAHlAbCVUWmX3KNmQJjypE+JA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E86ADF80310;
	Thu, 11 May 2023 13:36:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCC37F8032D; Thu, 11 May 2023 13:36:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 380FBF802E8
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 13:36:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 380FBF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=InyExgGq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LlENJP2+PEmD0GfKyz1pCK0yDou+9bvXkrGYLuuqFt0D+sfJgTQDWoPVi2pHjC60Va2DS4sqYWCi2KJzSnY1/kiiYzC6QKVUCAxXuWT3XrN+aEIZlziHu2VGK357SQI+KYxR9XGrlGvQ3qlwfqs2NaStdMJnETRsjZL7QvO9wnd9aurNFXV/l/k9loq3VJ/FOLBOBwD/nP5te+5HD7T+sTaG7aejGpeS9cll9b+P/9z4V/spxR2shQiRnoM58c4IFQPnqGy9/m/EpThAfyPQPrtEvWPzUXbU4Xd/5BBAv5M4yMlK888yzTravwoGn9GRbOaz8OZVpvyKtcnWxSKLnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOEwxjBZ9gmP/xLp1eh06X0kE1lAufZ9XRIzx7Or3wg=;
 b=XrEyKgK7XIm/0OxQmx7ggQJyTHEN4ECXOf5ySn1SJFTQ8xmyi5sgDIN4Zx3tIBXtSjfPddbYCyl60U78fUnYdvWGeyWW6V49a57f0HXpiemnXFdWwRpJHRngpmRQqj5iuqPT8VWmLuIlm4jGReqKEE/XbWLPDjzdTS4XwsudNfiEJvF3xySnNB6bEYeK8akQ+j7Rq38mH3NvHfCHJX+1ahoR2zPw/zy/t1yss1CE+VWmq+cDUe2LxpvBHv3P06ATOiTla0BJPF3OOeGe8UuJW91h8lQLDuHyK91KcfR3Jwh4qe2JZs62EVneWs7F8q2McBFT2lzCxIIh9PJd4oOjRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nuvoton.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOEwxjBZ9gmP/xLp1eh06X0kE1lAufZ9XRIzx7Or3wg=;
 b=InyExgGqR+uFGqif8CJ5jObV9PECTE3MgyuXDB3m7jLttX7nNhgLyi2sfXrM/DPfVchxjUSri1sV5NGAzqPheYGcaJhEaQ5ZjwMXsbD+Zg2LasP/4aHtp64qapCU8AYuJTlpFpnMgJfqWMUEueU+omR/IXp1CujYskpuBuSNgBM=
Received: from TYAPR01CA0105.jpnprd01.prod.outlook.com (2603:1096:404:2a::21)
 by TYZPR03MB5855.apcprd03.prod.outlook.com (2603:1096:400:122::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.29; Thu, 11 May
 2023 11:36:19 +0000
Received: from TYZAPC01FT055.eop-APC01.prod.protection.outlook.com
 (2603:1096:404:2a:cafe::cc) by TYAPR01CA0105.outlook.office365.com
 (2603:1096:404:2a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21 via Frontend
 Transport; Thu, 11 May 2023 11:36:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 175.98.123.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS04.nuvoton.com; pr=C
Received: from NTHCCAS04.nuvoton.com (175.98.123.7) by
 TYZAPC01FT055.mail.protection.outlook.com (10.118.152.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.6387.22 via Frontend Transport; Thu, 11 May 2023 11:36:19 +0000
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 11
 May 2023 19:36:16 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server id 15.1.2176.2 via Frontend Transport;
 Thu, 11 May 2023 19:36:16 +0800
From: David Lin <CTLIN0@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <YHCHuang@nuvoton.com>, <KCHSU0@nuvoton.com>,
	<WTLI@nuvoton.com>, <SJLIN0@nuvoton.com>, <ctlin0.linux@gmail.com>, David Lin
	<CTLIN0@nuvoton.com>
Subject: [PATCH v4] ASoC: dt-bindings: nau8825: Convert to dtschema
Date: Thu, 11 May 2023 19:36:08 +0800
Message-ID: <20230511113607.595184-1-CTLIN0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZAPC01FT055:EE_|TYZPR03MB5855:EE_
X-MS-Office365-Filtering-Correlation-Id: 888bdb4e-3386-40e0-ca06-08db5213f04f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vRGPC6t2YxQAOuNcRZeGScSRyxV5f9Hz1/jW/L/vL/8QCey2gDy0SXfKXGxYSuP+2/KEhSfbltkiExNBMZSce9P8lI6v3QRADs/MvtlZpHOo2nW+mbVRv+IClja0g4NSwlZina0pCVTDqoQZdXm37UNRKIc8gOuPsiKz8qZCqZrDcSKeY/B8Bz2du79dXJfBC63bj1VsrkM4r2idIGEfC6Wsu+z07s5U1SzuHFF+VM6tjGVzpNsPTESEevo0EyqnRdxCm7q9f4/Kt9DSyIY4BWBSpfal+r6GwjK4WzBbWMX3qNiGunWfNdGkgX5Wsf4BBHIlBIZo7xp6Rvi7Dohtals5UJM4r4iDeV2FTd7TJxhhLQJxPpAOgTVPh2TYpD40KGcx4fAKZWgdAHDFGcMEnWCr2WO5QXEGri246dMidBBZnHGt71qPM/MSa5Gii0B2jR7mX808dvkF9IByA2fqaTGql28pdvMzzz7ispCXT9nkflMO6zvfwjssBHgwJZX97IPjVin/rSoBV2aTeZ3R4JFgupN9rwswfrAf3Xbv/CKTkZzTxnoOFKEz2QkMpyH7Vx1pd6zL08ztXWDhEQ4TivN84790mNrLVx6CumkwT8ufUjpBRq6FcBgYpFl2ZUS2HxaP/wQ6OSXcyktgPsR1JyBjJPur00JTs4cMsQkMU7ytWimt4PzxHZK5fZeomSoSIdB3gJ+PbZNaso+WsheQ7bmKQPfHwphbx7SJcypKkyR53pWF7Fm/1dQF9UKPoSx/
X-Forefront-Antispam-Report: 
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS04.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199021)(40470700004)(46966006)(36840700001)(86362001)(81166007)(8676002)(8936002)(966005)(40480700001)(82310400005)(70586007)(5660300002)(82740400003)(356005)(4326008)(40460700003)(36756003)(83380400001)(426003)(2616005)(26005)(336012)(36860700001)(186003)(41300700001)(30864003)(107886003)(2906002)(47076005)(1076003)(6916009)(54906003)(316002)(33656002)(478600001)(70206006)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 11:36:19.1893
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 888bdb4e-3386-40e0-ca06-08db5213f04f
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS04.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	TYZAPC01FT055.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5855
Message-ID-Hash: HVFMETDC3BTFT4K5GP7M6JUUVATPTNRE
X-Message-ID-Hash: HVFMETDC3BTFT4K5GP7M6JUUVATPTNRE
X-MailFrom: CTLIN0@nuvoton.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HVFMETDC3BTFT4K5GP7M6JUUVATPTNRE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the NAU8825 audio CODEC bindings to DT schema.

Signed-off-by: David Lin <CTLIN0@nuvoton.com>

Changes:
V3 -> V4:
  - remove the description from interrupts, clocks and clock-names properites
  - add sound-dai-cells property and update the dts example

V2 -> V3:
  - refine node name from "nau8825" to "codec" for generic purpose

V1 -> V2:
  - add interrupts properties
  - add maximum to nuvoton,jack-insert-debounce and nuvoton,jack-eject-debounce properites
  - add a enum item for nuvoton,short-key-debounce properites
  - add default value for most properites
  - add maxItems to clocks properites and mclk entries to clock-names properites
  - refine wrong indentation from clocks and clock-names
  - refine dts example for interrupts and clocks
  - remove headset label from dts example
---
 .../devicetree/bindings/sound/nau8825.txt     | 111 --------
 .../bindings/sound/nuvoton,nau8825.yaml       | 239 ++++++++++++++++++
 2 files changed, 239 insertions(+), 111 deletions(-)
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
index 000000000000..a54f194a0b49
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8825.yaml
@@ -0,0 +1,239 @@
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
+  interrupts:
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
+    default: 1
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
+    default: 2
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
+    default: 6
+
+  nuvoton,sar-threshold-num:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of buttons supported.
+    minimum: 1
+    maximum: 4
+    default: 4
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
+    default: 0
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
+    default: 6
+
+  nuvoton,sar-compare-time:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      SAR compare time.
+    enum:
+      - 0 # 500 ns
+      - 1 # 1 us
+      - 2 # 2 us
+      - 3 # 4 us
+    default: 1
+
+  nuvoton,sar-sampling-time:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      SAR sampling time.
+    enum:
+      - 0 # 2 us
+      - 1 # 4 us
+      - 2 # 8 us
+      - 3 # 16 us
+    default: 1
+
+  nuvoton,short-key-debounce:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Button short key press debounce time.
+    enum:
+      - 0 # 30 ms
+      - 1 # 50 ms
+      - 2 # 100 ms
+      - 3 # 30 ms
+    default: 3
+
+  nuvoton,jack-insert-debounce:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      number from 0 to 7 that sets debounce time to 2^(n+2) ms.
+    maximum: 7
+    default: 7
+
+  nuvoton,jack-eject-debounce:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      number from 0 to 7 that sets debounce time to 2^(n+2) ms
+    maximum: 7
+    default: 0
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
+    default: 125
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: mclk
+
+  '#sound-dai-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        codec@1a {
+            #sound-dai-cells = <0>;
+            compatible = "nuvoton,nau8825";
+            reg = <0x1a>;
+            interrupt-parent = <&gpio>;
+            interrupts = <38 IRQ_TYPE_LEVEL_LOW>;
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
+            clocks = <&tegra_pmc 1>;
+        };
+    };
-- 
2.25.1

