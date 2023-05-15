Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A52B702594
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 08:59:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47214DED;
	Mon, 15 May 2023 08:58:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47214DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684133956;
	bh=4U60uhXW+8bhNATKgCHEaPjuSjZpXk6e08HnK/LQOm0=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=F4qAOKAQNRUV+ewS9a1hy22yRXl2iRb4WfvyAE813gz7gq8QkNIWPibILjTWXhs73
	 /GBqOHUKrn5SjSVRmU+b2LbOK4K9euybBFZP931B+7CKtuWDN2rCzUpmbHUWWPtizI
	 vJZec7of2CooH4xxBBrN8/tUqx8I+su097+8SnqY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12482F805A1; Mon, 15 May 2023 08:56:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 624A8F80431;
	Mon, 15 May 2023 08:56:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A9D5F80431; Mon, 15 May 2023 08:56:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::626])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA6F6F8024E
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 08:56:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA6F6F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=T6ePWt7s
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afp5wTnDZojgQV5D5kawm2zyscGwp6i9s3b5AotjkyZaF5vfAXyKuMpheHLrsbYKpLX7YTjK/eriWkJzC+qclvxah7dvAFw3nT3gpOeaAVNXPY/E3oy/1ys6o9WxX8WJe0B1AUBX3fcTcpcKQXPKTrynYWRbIObSr/2mZCByPiUVXkwdHfEQl2dNO6RkCaaDwXme6Q/6JEcDpZEjOABGv+uAI64DkCm2ycCeCtyl9Fdh3UfbmiNxEtaB6U3TKP4JzfOR/5Wys8IoydTOdn8F4P+6gLtxTPD7hvQd2Y/PFy1I26oXmy6to+XO3mS/fobhqhLH7aj+HRru3s/mf/OSdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/Q9nKJ4v6s3zcOR8J2AQCVgwhPzs+EW/cYda6rmjMA=;
 b=JDO85Ck50ngmzePfLd0Blb0ms1n6eLaLRcUBn4xG6X7ApTPCZt3YFeEWKtNMVsMdtInut1iblGr0u0zzEfnHOSnIZhH5frcZLikCtq3yuP2vWIfQng3Q9vSLO6UUdQnHs8h1wQaJkzf7y8XUA8S178RU/l74FYEB62R91UKcYbImhx6jUngl1ABjkK+66jmmPGl6WkjjR2jc9KsBUsJSTQ58CoSALlztaXgKAGMNn/6L5nal7k2u0zjQdi0097FJxBE8TKo3xP98qHCT2ZoM/lUDP6yF2Nife49azjQ0Dmr/glklcFI0Eh8fOmk5XCmN/CbV2jQwH3C932TCCsqnKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nuvoton.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/Q9nKJ4v6s3zcOR8J2AQCVgwhPzs+EW/cYda6rmjMA=;
 b=T6ePWt7s0fZm8chWHJapKdlYIfnjYiKHTDS0PQYrcbjf7F5NyODh75jXiOfKqxAaW++bpWuGmFDkThKeXdUPmWWobBJaNmDKnj7F6jqrW5w4BjdMFgJZJ738bdUbtiBAhIvSKKUUTRxNW6a8GTGOsGTKXYlOAO5E3kVjUsNMGM0=
Received: from TYCP286CA0325.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3b7::8)
 by PUZPR03MB5990.apcprd03.prod.outlook.com (2603:1096:301:b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 06:56:37 +0000
Received: from TYZAPC01FT058.eop-APC01.prod.protection.outlook.com
 (2603:1096:400:3b7:cafe::66) by TYCP286CA0325.outlook.office365.com
 (2603:1096:400:3b7::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30 via Frontend
 Transport; Mon, 15 May 2023 06:56:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 175.98.123.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS04.nuvoton.com; pr=C
Received: from NTHCCAS04.nuvoton.com (175.98.123.7) by
 TYZAPC01FT058.mail.protection.outlook.com (10.118.152.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.6411.14 via Frontend Transport; Mon, 15 May 2023 06:56:37 +0000
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 15
 May 2023 14:56:35 +0800
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Mon, 15 May
 2023 14:56:35 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server id 15.1.2176.2 via Frontend Transport;
 Mon, 15 May 2023 14:56:35 +0800
From: David Lin <CTLIN0@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <YHCHuang@nuvoton.com>, <KCHSU0@nuvoton.com>,
	<WTLI@nuvoton.com>, <SJLIN0@nuvoton.com>, <ctlin0.linux@gmail.com>, David Lin
	<CTLIN0@nuvoton.com>
Subject: [PATCH v2] ASoC: dt-bindings: nau8824: Convert to dtschema
Date: Mon, 15 May 2023 14:55:58 +0800
Message-ID: <20230515065557.614125-1-CTLIN0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZAPC01FT058:EE_|PUZPR03MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: 86f67724-b70e-4fb8-8297-08db55118764
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6LiKkcQWBaxVP673rUYNDF03xZA1wvJFtZ/MK/NEQC0OIpGaj2FUs6AqDmC8KB8QRSc52HR83U5hK+lpX5FaeugycJgFVLKi73JYo1mvrFXgdQipFNFVZaCCLf+C2LiRG908e2WNKAFMJF5EKAkjifNEapja9cYmO0MV6x2Z83x+ASdN23j5im3ijTsckiHKrEf7Cxz7sSPkcYLcScc9QM9iQWInQNz63282fM0m/vZZN/Ynf9dRoBVg5xzOXL6vgVWKZKFH+W2HE91VMjuwZmQeAzpgPU7eKnTTOHEDA7SQTw9sNN48YXxRFx2oMZf8+0p8L9hK6lr0AKh/p9qg8+He8b3H198QcXft5wgrwTwe7lG7cd99ArOf+FaxVPpsNo+ihfDcYCYbv7LFXiFM8uycE7bgK3SMpKUVglIedOXZHXGAGuXm0tBBgNvq9XDqsTPpjewfJSupoRnXTeAvwddwgkxVDcvxrjEIh8+yzk+ql0miep4D5jFGFMRZPsHgBwUax4rpKCm1o2yaeSNCxsJBnAHwp8QqewC6rBaTyMqS9lCYIQg/enwWjUTcQZzxHVnOVQcYxWMaPBYDqz5zOcOjSg438ymH7JLFxDs8BIOlXco6RUJ2P6TUnjuP8XkNHCXZYwdtoyeyMGJgjQT3k8MDposzYOnj9yOr0O75fiX6r9KYYeqfbk0hNztNX66Z48j8+Is59bagsypjqLWb+KZmrGWdYF/dHjnBv6VxTfo=
X-Forefront-Antispam-Report: 
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS04.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199021)(46966006)(40470700004)(36840700001)(356005)(81166007)(86362001)(82310400005)(82740400003)(36756003)(33656002)(40460700003)(4326008)(316002)(41300700001)(6916009)(5660300002)(8936002)(8676002)(54906003)(26005)(186003)(1076003)(40480700001)(107886003)(426003)(336012)(47076005)(2616005)(2906002)(966005)(70206006)(70586007)(478600001)(83380400001)(36860700001)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 06:56:37.6279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 86f67724-b70e-4fb8-8297-08db55118764
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS04.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	TYZAPC01FT058.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB5990
Message-ID-Hash: 7UDJR7VLQ5WYDP24LZIMLRRDWFKX7O4O
X-Message-ID-Hash: 7UDJR7VLQ5WYDP24LZIMLRRDWFKX7O4O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7UDJR7VLQ5WYDP24LZIMLRRDWFKX7O4O/>
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
Change:
V1 -> V2:
  - Correct the maximun and maxItems from 4 to 8 for sar-threshold-num
    and sar-threshold, respectively. 

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
index 000000000000..3dbf438c3841
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
+    maximum: 8
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
+    maxItems: 8
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

