Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AE56FD48D
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 05:46:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0763DEF6;
	Wed, 10 May 2023 05:45:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0763DEF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683690386;
	bh=jOOVgds0C0gUaw8ifWIg3WdTG4dNyOdqDL4DNcKF+SA=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=a4HPvQ6PMWwR1dr2uow7QXQ8arS6/jvtw0OPgt73tF+JyzVkaUcdHRNNxuE4Jkh6q
	 KmQOl8KpGpL9SdUsoYs7JBnS6PdSzE+BEbNS1PpNbBz6otT7puYO3MV6T252E66F/+
	 RFMJqt3aLwcZoRcJOGd0EGedibLt85I6OGfsVHQs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 525D7F802E8;
	Wed, 10 May 2023 05:45:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBA16F8032D; Wed, 10 May 2023 05:45:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DFFC4F8014C
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 05:45:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFFC4F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=cjILHTBW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/wb4pgYeXRIO10bUR89UhL/Q6sdSz+/vMwJY18AvIvwwTth1IKZnxPZirz4Qp1ZJ0gP/7koaGu4pLmG1yMDK8kBk88tN8ZJ3iswOXyUQ3YrfWQJ0xZJM1bb8nmWpUVUwCRI5bz+9YB3z7ojezPYhgJTTHeI/5zOe8y3+J3ThkpRlm319sSIWrxjezT7i+DPv3YpUr6D8FOZX5CwMETE7bH+WogbA82mWfY/gn/77mTA4e7TRxaKUdDtQLlObXEeDdOVG9hpIdkTofxjaqS3fhAFUSETZWs9k+quOIfoZh82K8+2d2PW8UNe+7Rd1osmS/pDI6oV2nvcjCZMz+CzMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHs+j6WXPKVhC28QhrMgjKiltpWgli4u3tRsBl2awXo=;
 b=XfmvCJmFTxrcXmiHw8LmC74t2oS+3mbqGgVkRHBc98M0QlfaRRvSmzTcbt8oAY0H36cSVxmBwShOsR/i3YV+MbKn6UIHy1MS3GCnlja7wY1+yKH9C4Aths6okMYrcWU/YbJmpeO/Cyne13DgfyaQ8CF6CQskJvA6/wEjhl77GDPCUaRAf4oHz5NAep7FAowbtfvgHGZ15xI2D4cHBsWrEUjZ2O9PDgAaYxanTvI6ulv+BnPV9zcesGMLQy2kADxYHwLMF+6kptEZ61hoYqmDFdUqhJ8o8PhNPTReQ18B7XwrsZs5ZXkvnTFFwZ5ktj7tHQqZrqIlU+WDCbz3Osqi4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nuvoton.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHs+j6WXPKVhC28QhrMgjKiltpWgli4u3tRsBl2awXo=;
 b=cjILHTBWom+V4fz1nHqhjNAkxL6/ZpF66mvApgZl+EHFimY3hjNuElPbWBfzVJLPg6XxXyVwgFtsyOM+JLK/kwu4BEs9YHHXTT1lYsqK0uNLfdNXtPXLjXe0rx5XljsmNGFn2T1jGmApH20xAX9J2Cd/SZqUSzEvbfBkv9NQbzc=
Received: from TYCPR01CA0126.jpnprd01.prod.outlook.com (2603:1096:400:26d::6)
 by TY0PR03MB6726.apcprd03.prod.outlook.com (2603:1096:400:214::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.31; Wed, 10 May
 2023 03:45:02 +0000
Received: from TYZAPC01FT058.eop-APC01.prod.protection.outlook.com
 (2603:1096:400:26d:cafe::53) by TYCPR01CA0126.outlook.office365.com
 (2603:1096:400:26d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33 via Frontend
 Transport; Wed, 10 May 2023 03:45:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 175.98.123.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS04.nuvoton.com; pr=C
Received: from NTHCCAS04.nuvoton.com (175.98.123.7) by
 TYZAPC01FT058.mail.protection.outlook.com (10.118.152.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.6387.20 via Frontend Transport; Wed, 10 May 2023 03:45:02 +0000
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 10
 May 2023 11:44:56 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server id 15.1.2176.2 via Frontend Transport;
 Wed, 10 May 2023 11:44:56 +0800
From: David Lin <CTLIN0@nuvoton.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: dt-bindings: nau8825: Convert to dtschema
Date: Wed, 10 May 2023 11:44:10 +0800
Message-ID: <20230510034409.585800-1-CTLIN0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZAPC01FT058:EE_|TY0PR03MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: e175770a-027c-47b7-c3f6-08db5108ef92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zocqLjXYR/7YsLd3L0JuF6z7JX0XElvPCgJ84mhyqxNcNofJRKQryiuajL/Q8U2Npq89LBr6NgcSHl4yD6uAe32BKnEGr/oNC54ekM0XdrLgTntp+9b90DGkI4Hyboa2fQuGJMbwTxK232mpSGTHtEVNAxDpsmDmjLr3BukEseWFrcJ01VlnFmmuT5fqOL2jR6NMx5LMJZi3gPpAE8PYuUEFXCsaaUOO/i+2OFwglvUUlL1QdgDytz7htbRYmty+d56rZ2UQvcMlNl+JhKeZ5AlrnxBUi+N91RTVWhqztUhNSCvIf3HoEmodufJHzzVy3tu0RpWqqUUT5585sPRB/1VY7MrQI8CogwyYYypyLwqITl3tXzRHeVqCLUuSKdYtqIysF92b52aFm0LbxZWNbgG48GLaHqMUwM8Be9eXjjmyu/yg70DNDqBtROx++P/QwAg+Bi3sFVNk/I5R26qS/xrXAEQJWiDYuFSOiPn52P53SEZD+TiyRIaeunevAABAY9g9jAR5h+1AYRlRKM6BlWZh2uYybshCE3jEnx4YAgq0K8f4NIl/rP4cnuRZa/k2maFtYAYBqTUyFJEwuyMtFYp2lxt7wmHo4t2rtiuBhMhSqfMSqHZY1mnd/xfZoYZ/etPiYBVwS5zY7PV04wNxo/JFqtc5z3QW3yVdixbWPy7TDQl2W5TJiaDPuR/rxHQf
X-Forefront-Antispam-Report: 
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS04.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199021)(40470700004)(36840700001)(46966006)(5660300002)(8676002)(4326008)(8936002)(70586007)(70206006)(966005)(6666004)(426003)(336012)(40480700001)(36860700001)(41300700001)(82740400003)(316002)(6916009)(54906003)(33656002)(478600001)(2906002)(82310400005)(107886003)(26005)(186003)(1076003)(36756003)(81166007)(40460700003)(356005)(47076005)(83380400001)(2616005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 03:45:02.3081
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e175770a-027c-47b7-c3f6-08db5108ef92
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS04.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	TYZAPC01FT058.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6726
Message-ID-Hash: 5EBCITYZ3N5VQI7W3AZH377ESBRDL2QU
X-Message-ID-Hash: 5EBCITYZ3N5VQI7W3AZH377ESBRDL2QU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5EBCITYZ3N5VQI7W3AZH377ESBRDL2QU/>
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
 .../devicetree/bindings/sound/nau8825.txt     | 111 --------
 .../bindings/sound/nuvoton,nau8825.yaml       | 242 ++++++++++++++++++
 2 files changed, 242 insertions(+), 111 deletions(-)
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
index 000000000000..ab352422d48e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8825.yaml
@@ -0,0 +1,242 @@
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
+    description:
+      The CODEC's interrupt output.
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
+    description:
+      list of phandle and clock specifier pairs according to common clock
+      bindings for the clocks described in clock-names.
+    maxItems: 1
+
+  clock-names:
+    description:
+      should include "mclk" for the MCLK master clock.
+    items:
+      - const: mclk
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
+        nau8825@1a {
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

