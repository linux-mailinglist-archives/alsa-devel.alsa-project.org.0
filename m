Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0965070076C
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 14:03:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49AE21E4;
	Fri, 12 May 2023 14:02:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49AE21E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683893003;
	bh=hj569o0dv1xKkm/Tj87Da7AdFXYQ/kQb8wXgmnk5oUg=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=t6v/rGNAouUJchsWMLqTddjs4Kp3vcF4XtjmpYUjESL/tg8fH01M4a/hmXUVwJfbO
	 L2N6C52QaPrbRLT3BhCRZa/QWnNd7iTXb1rHmKS4jWnOHGfnvBTVEnwAJJLNa2DLgC
	 El+MZBX+aqHzU0nYqQq3wXrFBUH/D+ogOHIheYCQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F05FFF80542; Fri, 12 May 2023 14:02:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77F31F8032D;
	Fri, 12 May 2023 14:02:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A461F80534; Fri, 12 May 2023 14:02:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53EDFF80087
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 14:02:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53EDFF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=dPqfi+aR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F22/7M5vgiDm3IeyMUUEZrV8VOL0LDJgSLB565PeE6ZL5c/IHthyjFnlx8h0aHqTxeOiAJZEs7VPJgEVrvi4DOXkspLlViM41b4bR7hoLu/KA8FwI84Bvi0eojEARrN+d3FhOKYj5OhjuuCxi6gHCJuG3mbQc2DLJu5dcWFDRr2VLp2RKaGMnelWVt/5K5A8l7nkd03lwXaRxOyr68ZoT2fHYvVVe7xBCaC/sk7fOPD9Egk0fG/Pu3oXDNEtDn83m3N/MC/7M2CxCsCxHi/NNtNd/ZwkueHvXw71043aNs2NDBH3dNlagZMM4DE0B6qX1oAgzidDtOnzhHyK5timkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjMPGroWKvHqmi1UEki8fGZODlfoDkD2dw38sCPigBA=;
 b=DVTuOeK7r6mYoat9ywGGMNFI5+JkQqhkG4qwAMP5wq9xr4Ze9dVrOU7Nf9KF+Hqiep8UchZMysf+d4ymDTGpdcYcyW06rhyR7bWzFtZFEij8j/JCghqUnKq276sH5U9WgantqCJpL/zspJyqGHbRQ+haFzUR2qOAhX/doUZ0GdRJIvFUiyzvg0dhiuIADdqsjGlZjRodVEw7nbQVU+0jnps3OY0LVObyYqpAI3TRcLcnOGaYs/haiToLQpLTtH5RMraQSDMBvt5yPggL0sXz3el8FLuK8tw/a4QiNZmbETI4fPQXITYkblkQX124V2gI4yonMpsvQnYFcA3YCi2oPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nuvoton.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjMPGroWKvHqmi1UEki8fGZODlfoDkD2dw38sCPigBA=;
 b=dPqfi+aR1dTBO9dFKp3ta4+/vUPt3vm/rOaQ5RuE8G6RNo6spXbCAG+L13D3BAK4V/2ADyxBZpBF5hyCFcFvQvG/0Osyz/bRwG4MxwQbcxDyoJLxsUIgEnAEdqCGWBSTYE8SAhknzi/8/pDCmPk9Vj40alagrGooqZF0aQUvjmA=
Received: from SG2PR01CA0186.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::14) by KL1PR0302MB5441.apcprd03.prod.outlook.com
 (2603:1096:820:45::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.23; Fri, 12 May
 2023 12:02:12 +0000
Received: from SG2APC01FT0050.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:189:cafe::82) by SG2PR01CA0186.outlook.office365.com
 (2603:1096:4:189::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.23 via Frontend
 Transport; Fri, 12 May 2023 12:02:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 175.98.123.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS04.nuvoton.com; pr=C
Received: from NTHCCAS04.nuvoton.com (175.98.123.7) by
 SG2APC01FT0050.mail.protection.outlook.com (10.13.36.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.6387.24 via Frontend Transport; Fri, 12 May 2023 12:02:11 +0000
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 12
 May 2023 20:02:10 +0800
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Fri, 12 May
 2023 20:02:10 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server id 15.1.2176.2 via Frontend Transport;
 Fri, 12 May 2023 20:02:09 +0800
From: David Lin <CTLIN0@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <YHCHuang@nuvoton.com>, <KCHSU0@nuvoton.com>,
	<WTLI@nuvoton.com>, <SJLIN0@nuvoton.com>, <ctlin0.linux@gmail.com>, David Lin
	<CTLIN0@nuvoton.com>
Subject: [PATCH] ASoC: dt-bindings: nau8824: Convert to dtschema
Date: Fri, 12 May 2023 20:01:47 +0800
Message-ID: <20230512120146.600128-1-CTLIN0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2APC01FT0050:EE_|KL1PR0302MB5441:EE_
X-MS-Office365-Filtering-Correlation-Id: 61d6baf9-519e-43e2-35f1-08db52e0b836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wIRwbF0AcXij8A8RqEW9EmAL9W187bB0dlPbdmA76FSNvoaRS6mBSDmrOnlks40XF1fv7aJ3mIx3o5sIT+vTy5yolKMWKDVZRtOZHZlMYvPImkYRX85T+xdVHCyWVs4K9YS8bmUMHSGzoQcw79/7ytwiC3rTFSHFQgiBhoxv3ZLr9/7cMaf083Q1YEYSF8p9WEJSLuzwGSbndapTCSJnXih96kO4dfuNkQ1koM+JCZehWkjw2c3nE/DjZzpnFlmtWhZ5LWgbqSLww6ALFyPtwUvd6ke9jr+KK6aYt06JA0pPi1vMf/rPBsag3lP243NKvT7/Pqv3OfHK0ZvBcOnPpqrgrjZUh7//DZfpBAOVJwknOwYg1sODi44wonpd8v9GaGUEcTU0Ktn3CEEnrd2WeZXslZE/0rsrZh/RrBDo8QI3XIYCNnU5AJWQZs9Tpe/upAH6ZAI5bxAk+ntd0v92vBiGO80vxoS8FFX+GYdUhlP1hiIYgHWtPfm/fwT/QsePKeYsoF01+rrfBJEfD4EKJlYo9tX+zmN8FxSyBns1XFAniMToX3qjXFAE2dfipImFZijqTcQ1hN67DmXHZG8jkwe19L68/x7pEWwdUg6vZZd6bA+XgF2SrDphztJHnyW//a4b5CWRbeWpFOkXgNcgE7cq0LlTmbkzvkVObrMIh1R1ny+DMAC4loIVs1DPlzcnnnXLwOmNAp3NpaXL0Ki0k+PyntKxAjOOg6hfEpPKMBc=
X-Forefront-Antispam-Report: 
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS04.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199021)(40470700004)(36840700001)(46966006)(40460700003)(5660300002)(8676002)(8936002)(966005)(83380400001)(47076005)(36860700001)(186003)(33656002)(82740400003)(2906002)(36756003)(356005)(426003)(336012)(81166007)(2616005)(86362001)(82310400005)(40480700001)(107886003)(26005)(1076003)(6916009)(316002)(4326008)(70586007)(70206006)(54906003)(478600001)(41300700001)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 12:02:11.8675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 61d6baf9-519e-43e2-35f1-08db52e0b836
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS04.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SG2APC01FT0050.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0302MB5441
Message-ID-Hash: OYD2E7TTYXQC53ZMCG4TN6JGSMLGR66E
X-Message-ID-Hash: OYD2E7TTYXQC53ZMCG4TN6JGSMLGR66E
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OYD2E7TTYXQC53ZMCG4TN6JGSMLGR66E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the NAU8824 audio CODEC bindings to DT schema.

Signed-off-by: David Lin <CTLIN0@nuvoton.com>
---
 .../devicetree/bindings/sound/nau8824.txt     |  88 ---------
 .../bindings/sound/nuvoton,nau8824.yaml       | 182 ++++++++++++++++++
 2 files changed, 182 insertions(+), 88 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/nau8824.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8824.yaml

diff --git a/Documentation/devicetree/bindings/sound/nau8824.txt b/Documentation/devicetree/bindings/sound/nau8824.txt
deleted file mode 100644
index e0058b97e49a..000000000000
--- a/Documentation/devicetree/bindings/sound/nau8824.txt
+++ /dev/null
@@ -1,88 +0,0 @@
-Nuvoton NAU8824 audio codec
-
-This device supports I2C only.
-
-Required properties:
-  - compatible : Must be "nuvoton,nau8824"
-
-  - reg : the I2C address of the device. This is either 0x1a (CSB=0) or 0x1b (CSB=1).
-
-Optional properties:
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
-
-  - nuvoton,jack-eject-debounce: Jack ejection debounce time.
-      0 - 0 ms
-      1 - 1 ms
-      2 - 10 ms
-
-
-Example:
-
-  headset: nau8824@1a {
-      compatible = "nuvoton,nau8824";
-      reg = <0x1a>;
-      interrupt-parent = <&gpio>;
-      interrupts = <TEGRA_GPIO(E, 6) IRQ_TYPE_LEVEL_LOW>;
-      nuvoton,vref-impedance = <2>;
-      nuvoton,micbias-voltage = <6>;
-      // Setup 4 buttons impedance according to Android specification
-      nuvoton,sar-threshold-num = <4>;
-      nuvoton,sar-threshold = <0xc 0x1e 0x38 0x60>;
-      nuvoton,sar-hysteresis = <0>;
-      nuvoton,sar-voltage = <6>;
-      nuvoton,sar-compare-time = <1>;
-      nuvoton,sar-sampling-time = <1>;
-      nuvoton,short-key-debounce = <0>;
-      nuvoton,jack-eject-debounce = <1>;
-  };
diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8824.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8824.yaml
new file mode 100644
index 000000000000..e03d7e2704b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8824.yaml
@@ -0,0 +1,182 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nuvoton,nau8824.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NAU8824 audio CODEC
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
+      - nuvoton,nau8824
+
+  reg:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 0
+
+  interrupts:
+    maxItems: 1
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
+      - 0 # 500ns
+      - 1 # 1us
+      - 2 # 2us
+      - 3 # 4us
+    default: 1
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
+    default: 0
+
+  nuvoton,jack-eject-debounce:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Jack ejection debounce time.
+    enum:
+      - 0 # 0 ms
+      - 1 # 1 ms
+      - 2 # 10 ms
+    default: 1
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
+            compatible = "nuvoton,nau8824";
+            reg = <0x1a>;
+            interrupt-parent = <&gpio>;
+            interrupts = <38 IRQ_TYPE_LEVEL_LOW>;
+            nuvoton,vref-impedance = <2>;
+            nuvoton,micbias-voltage = <6>;
+            nuvoton,sar-threshold-num = <4>;
+            // Setup 4 buttons impedance according to Android specification
+            nuvoton,sar-threshold = <0xc 0x1e 0x38 0x60>;
+            nuvoton,sar-hysteresis = <0>;
+            nuvoton,sar-voltage = <6>;
+            nuvoton,sar-compare-time = <1>;
+            nuvoton,sar-sampling-time = <1>;
+            nuvoton,short-key-debounce = <0>;
+            nuvoton,jack-eject-debounce = <1>;
+        };
+    };
-- 
2.25.1

