Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7667E737F14
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 11:40:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 313796C1;
	Wed, 21 Jun 2023 11:39:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 313796C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687340425;
	bh=IbKCW2fF++n7beX2SoKxLEo/wdwicftB9M19P0hITxM=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OsptcktazSOKesP/IYpQCGvV6StVL1ZGD6EeMQhc2x85QaCb31NzWlsG02mmdh+Uf
	 grimf6SZ84omceEJdG24AVAYgYyBkfuGxKLQRE3CjArXYjDCIcNfIyAefY67MkHULR
	 EcAAZ82zxH8aEZDGEJqyZw4J8DBhzTsOOq4YJ524=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAB6BF80163; Wed, 21 Jun 2023 11:39:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37F12F80132;
	Wed, 21 Jun 2023 11:39:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21225F80141; Wed, 21 Jun 2023 11:39:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01hn20302.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::302])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E179FF80124
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 11:39:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E179FF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=Bk8xA2v9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KEzHgFsc/6vbluwAbcWQj/AcJwq1WH1jQ5Ve7kzv6SjnUSj6v8CsKNUgficE4L3wfkD/vSXYAUV7tIIzCTLf7RFZppW4iBR9O/AtnjN6JgxNviYLsoiRAu2noHcXBDwoxeP1sKHnF6wt2BSrLHdYsBzSrQ+gnwSLd8wCx+WwQKoA6n4+3bLI/JEXdtu5FqsQxcJvuUaO4uIuiJa4tIpR1Eaf1dz1iJ/OKI8tcbfoy6C/y+lwTfLFaQYOSkSamqoJPq1JHjXa2FIiT5ihdZm8Si+CUIkW4muyGxGzd0CXGyrt8RaQIKmwlJNfsaWjn8PhaxeG43Y+Mb/ylOUL5TY79g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5ej0lptjdV2CRtZEzkXS+Gb9EZSadzOdB/EyIUWQ6U=;
 b=J7IMjFZhzmLmkHCT7FZFDRfzcZJ9AoFBCNKQtWyC7IDCpZ8mPJjkH6sHoKHk6k4d3e6Neu1P3aViW11YVtD7rcH7O+55AmQUVJLSqcbNjRfBnANgkeCLqCG9D9fz5iz1OVz3ZTnDgClMM2OmYaP+lK2R3j9DvERY568zae2GuTLA96wULx/AvQq+sPgYzfZyRGXKKQ7IgqHOCeHex+cpX80JRonW4IPrq+X6jTPMk8HCDFh+H/SSoVKtv8wjb7Bm8J8BocD5FvZ1vyIVhGviHwNGK/Hx9wjGOrE11gE8lWgLr/Ius6yuxZcOp+j5AU2Z2CSFZP7XYUQ7q1YvyCwgWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nuvoton.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5ej0lptjdV2CRtZEzkXS+Gb9EZSadzOdB/EyIUWQ6U=;
 b=Bk8xA2v9G5/Btmky+y7/+Z3D9Ylmrwl3/S4nWnjIVK2DE515m2ZKqRfGD955xAVvXEogpew4N5VaGrCK9XbbSyoPZPWzAPafJw8+TdUidknnzZTSqohldrfOuwDc9tAwOBj+eu1URB7E7mYT7ne9y2iUNQo8ECCanqlB08Spyoc=
Received: from SL2PR04CA0003.apcprd04.prod.outlook.com (2603:1096:100:2d::15)
 by JH0PR03MB7446.apcprd03.prod.outlook.com (2603:1096:990:1b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 09:39:09 +0000
Received: from PSAAPC01FT022.eop-APC01.prod.protection.outlook.com
 (2603:1096:100:2d:cafe::de) by SL2PR04CA0003.outlook.office365.com
 (2603:1096:100:2d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23 via Frontend
 Transport; Wed, 21 Jun 2023 09:39:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 175.98.123.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS04.nuvoton.com; pr=C
Received: from NTHCCAS04.nuvoton.com (175.98.123.7) by
 PSAAPC01FT022.mail.protection.outlook.com (10.13.39.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.6521.23 via Frontend Transport; Wed, 21 Jun 2023 09:39:08 +0000
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 21
 Jun 2023 17:39:05 +0800
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Wed, 21 Jun
 2023 17:39:05 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server id 15.1.2176.2 via Frontend Transport;
 Wed, 21 Jun 2023 17:39:05 +0800
From: Seven Lee <wtli@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
	<YHCHuang@nuvoton.com>, <KCHSU0@nuvoton.com>, <CTLIN0@nuvoton.com>,
	<WTLI@nuvoton.com>, <SJLIN0@nuvoton.com>, <scott6986@gmail.com>,
	<supercraig0719@gmail.com>, <dardar923@gmail.com>, Seven Lee
	<wtli@nuvoton.com>
Subject: [PATCH] ASoC: dt-bindings: nau8821: Convert to dtschema
Date: Wed, 21 Jun 2023 17:39:03 +0800
Message-ID: <20230621093903.1077050-1-wtli@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAAPC01FT022:EE_|JH0PR03MB7446:EE_
X-MS-Office365-Filtering-Correlation-Id: 25d4b3f6-b571-4647-c7ac-08db723b5c79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	h17plpooQ65NbYEhbnpZAng9/TRi7e+J8t7SrbjJ3SovtSZKG9zNRfgLDyDDD4sEKiGpaOb0kKiNBhd91b4qI4pGL756ZLpMFaxSR8YiUu96+rftOwcu2ZUq8leJPmJDfh1RC5jePFFrHpHj4wquGfiCBGwv23i6uWsh8x/RvdIvdZR69dgqn5/7ARt50z27qoLMg7vAZEDY0vAdFZNK69A/zor+/OjM94lVSsx92xxElpx1eqOgG/9MSsc5AE3osfrqKNpcrC9x0mMSGJ8lgizM5HR7CWjRShRjr9CJnmuGfut6Un4s9ymehJAYa2m0AL89SEbV1eKUEYqVjdBfM85101IaysCmKHLQSE3NKvb703IF39rd5eEBwym7uEgLxMMwKxVjmiE7k/yy9o+075uX7ub7FnHdIsP0CNYIM/ttpDLqSDgDuGauuhqZ6mnxY5t6Y1M84U8kqOuy22Wx7ISrl3YR6xjRwc9mEz/hniTbH1A2mb5bHwePAxRhPtqIn1rixKny17veytSqF2zrnBQh797MfMu3QgvpOtZ5IC3a/j/cXg8ZSnsB1vFQzRsCemcCxHDCZvGHVIMsxdaM+Q40iIs4YjmnuUxnH9OuvgQh7okGKf5ejVNpcRJw3zvonX/6+cD9RWL24yTwiby5s1W7OnN2+vyx4gcYP746j9iJE5o5nQN8LonIfxAl8PRPbVQ8dwI5QeajdZNwrv5ZaG4Yh4n/HBT50M8P2huFqmJfbLqLSQyiyHV0jMaqiEO3BnwzrL+SzEoP3e6isoNQGakeYNl8AuiUgOcUxRD9ask0J17Yr5h0TlJegl3WWo0T1N5EfwelXd/dq8WNoazWTA==
X-Forefront-Antispam-Report: 
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS04.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199021)(5400799015)(46966006)(36840700001)(40470700004)(5660300002)(70586007)(4326008)(70206006)(6916009)(1076003)(316002)(36756003)(2906002)(8676002)(8936002)(40460700003)(41300700001)(54906003)(47076005)(86362001)(40480700001)(82310400005)(478600001)(34020700004)(186003)(26005)(966005)(36860700001)(107886003)(81166007)(356005)(82740400003)(336012)(2616005)(83380400001)(426003)(12100799033);DIR:OUT;SFP:1501;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 09:39:08.1772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 25d4b3f6-b571-4647-c7ac-08db723b5c79
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS04.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	PSAAPC01FT022.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7446
Message-ID-Hash: J5NT6RJUCJ7UZOW4QTVYARZE6F33BISM
X-Message-ID-Hash: J5NT6RJUCJ7UZOW4QTVYARZE6F33BISM
X-MailFrom: WTLI@nuvoton.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J5NT6RJUCJ7UZOW4QTVYARZE6F33BISM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the NAU8821 audio CODEC bindings to DT schema.

Signed-off-by: Seven Lee <wtli@nuvoton.com>
---
 .../devicetree/bindings/sound/nau8821.txt     |  55 --------
 .../bindings/sound/nuvoton,nau8821.yaml       | 120 ++++++++++++++++++
 2 files changed, 120 insertions(+), 55 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/nau8821.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml

diff --git a/Documentation/devicetree/bindings/sound/nau8821.txt b/Documentation/devicetree/bindings/sound/nau8821.txt
deleted file mode 100644
index 7c84e7c7327a..000000000000
--- a/Documentation/devicetree/bindings/sound/nau8821.txt
+++ /dev/null
@@ -1,55 +0,0 @@
-Nuvoton NAU88L21 audio codec
-
-This device supports I2C only.
-
-Required properties:
-  - compatible : Must be "nuvoton,nau8821"
-
-  - reg : the I2C address of the device. This is either 0x1B (CSB=0) or 0x54 (CSB=1).
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
-  - nuvoton,jack-insert-debounce: number from 0 to 7 that sets debounce time to 2^(n+2) ms
-  - nuvoton,jack-eject-debounce: number from 0 to 7 that sets debounce time to 2^(n+2) ms
-
-  - nuvoton,dmic-clk-threshold: the ADC threshold of DMIC clock.
-  - nuvoton,key_enable: Headset button detection switch.
-
-Example:
-
-  headset: nau8821@1b {
-      compatible = "nuvoton,nau8821";
-      reg = <0x1b>;
-      interrupt-parent = <&gpio>;
-      interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
-      nuvoton,jkdet-enable;
-      nuvoton,jkdet-pull-enable;
-      nuvoton,jkdet-pull-up;
-      nuvoton,jkdet-polarity = <GPIO_ACTIVE_LOW>;
-      nuvoton,vref-impedance = <2>;
-      nuvoton,micbias-voltage = <6>;
-      nuvoton,jack-insert-debounce = <7>;
-      nuvoton,jack-eject-debounce = <7>;
-      nuvoton,dmic-clk-threshold = 3072000;
-  };
diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
new file mode 100644
index 000000000000..728223d20876
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nuvoton,nau8821.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NAU88L21 audio codec
+
+maintainers:
+  - Seven Lee <wtli@nuvoton.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,nau8821
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  nuvoton,jkdet-enable:
+    description: Enable jack detection via JKDET pin.
+    type: boolean
+
+  nuvoton,jkdet-pull-enable:
+    description: Enable JKDET pin pull. If set - pin pull enabled,
+      otherwise pin in high impedance state.
+    type: boolean
+
+  nuvoton,jkdet-pull-up:
+    description: Pull-up JKDET pin. If set then JKDET pin is pull up,
+      otherwise pull down.
+    type: boolean
+
+  nuvoton,jkdet-polarity:
+    description: JKDET pin polarity.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 # active high
+      - 1 # active low
+    default: 1
+
+  nuvoton,micbias-voltage:
+    description: MICBIAS output level select.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 # VDDA
+      - 1 # VDDA * 1
+      - 2 # VDDA * 1.1
+      - 3 # VDDA * 1.2
+      - 4 # VDDA * 1.3
+      - 5 # VDDA * 1.4
+      - 6 # VDDA * 1.53
+      - 7 # VDDA * 1.53
+    default: 6
+
+  nuvoton,vref-impedance:
+    description: VMID Tie-off impedance select.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 # open(default)
+      - 1 # 25KOhms
+      - 2 # 125KOhms
+      - 3 # 2.5KOhms
+    default: 2
+
+  nuvoton,jack-insert-debounce:
+    description: number from 0 to 7 that sets debounce time to 2^(n+2)ms.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 7
+    default: 7
+
+  nuvoton,jack-eject-debounce:
+    description: number from 0 to 7 that sets debounce time to 2^(n+2)ms.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 7
+    default: 0
+
+  nuvoton,dmic-clk-threshold:
+    description: DMIC clock speed expected value. Unit is Hz.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 3072000
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
+        codec@1b {
+            #sound-dai-cells = <0>;
+            compatible = "nuvoton,nau8821";
+            reg = <0x1b>;
+            interrupt-parent = <&gpio>;
+            interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
+            nuvoton,jkdet-enable;
+            nuvoton,jkdet-pull-enable;
+            nuvoton,jkdet-pull-up;
+            nuvoton,jkdet-polarity = <GPIO_ACTIVE_LOW>;
+            nuvoton,micbias-voltage = <6>;
+            nuvoton,vref-impedance = <2>;
+            nuvoton,jack-insert-debounce = <7>;
+            nuvoton,jack-eject-debounce = <0>;
+            nuvoton,dmic-clk-threshold = <3072000>;
+        };
+    };
-- 
2.25.1

