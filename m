Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EC65752EA
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 18:37:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E404F1841;
	Thu, 14 Jul 2022 18:36:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E404F1841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657816632;
	bh=8tAwHskEXN5iMTgIIlVW8hEMkkC75EH1yxYnzi6q0HU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d9Jee0a5M9x3hkGQpY2TeA4DwZPNxydInIWG7cgEYfCh8NVsDUdBYDKTwvjumhEI7
	 mLOFYaEDnDD/5NM0AxRVVJpX+q7Jmb3UXHgxmL+kD3hXewzeElnY7ihs+WhK3mPVyn
	 O20i7puk0jkTGat9mne3CXtHseO4rRja1jGEOsTo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADE7EF80558;
	Thu, 14 Jul 2022 18:34:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65DA1F800E8; Mon, 11 Jul 2022 20:30:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04E14F800E8
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 20:30:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04E14F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="kt1p+AXu"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1657564211; x=1689100211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8tAwHskEXN5iMTgIIlVW8hEMkkC75EH1yxYnzi6q0HU=;
 b=kt1p+AXuwq7P3OGkReAHRyOdHRD7eUdjb+8zaDTqzC1eZ6Z1CRI7PIO+
 wxhR2FvMSYV09e5dGxh4E/qCGzPHQulgd9OYRoVvLZY0ZkYeOsbZWM/h6
 s35DzSiNwPB0YH3wLoWPqdXYjTRcMced2iYNeH1o9Azd28Y0R99FzLSse
 nphHtGwOc10NxUQQ6m12pG7dw038xxiZe3U0wycE7tfQLiLP3YgxtDSI+
 i1V+jQ9zedoMCvhP7ooX9XMOrN4mDpp4h2tBhYjTXZ9LjPPqKGVeN7BBf
 5pazE8LWmY2iBfTOAn6MAP85gVXWJKC3w6UzeEhxvd+mVzLz63BG+FAg4 w==;
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; d="scan'208";a="103970028"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Jul 2022 11:30:01 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Jul 2022 11:30:01 -0700
Received: from ryan-Precision-5560.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 11 Jul 2022 11:30:01 -0700
From: <Ryan.Wanner@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: sound: atmel,
 classd: Convert to json-schema
Date: Mon, 11 Jul 2022 11:30:09 -0700
Message-ID: <20220711183010.39123-2-Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220711183010.39123-1-Ryan.Wanner@microchip.com>
References: <20220711183010.39123-1-Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Thu, 14 Jul 2022 18:34:36 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Ryan
 Wanner <Ryan.Wanner@microchip.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Convert atmel CLASSD devicetree binding to json-schema.
Change file name to match json-schema naming.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
v1 -> v2:
- Fix title.
- Fix formatting.
- Removed trivial descriptions.
- Fix filename.

 .../bindings/sound/atmel,sama5d2-classd.yaml  | 104 ++++++++++++++++++
 .../bindings/sound/atmel-classd.txt           |  55 ---------
 2 files changed, 104 insertions(+), 55 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/atmel-classd.txt

diff --git a/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml b/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml
new file mode 100644
index 000000000000..9ef8c6dde8a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (C) 2022 Microchip Technology, Inc. and its subsidiaries
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/atmel,sama5d2-classd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel ClassD Amplifier
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+  - Claudiu Beznea <claudiu.beznea@microchip.com>
+
+description:
+  The Audio Class D Amplifier (CLASSD) is a digital input, Pulse Width Modulated (PWM)
+  output stereo Class D amplifier.
+
+properties:
+  compatible:
+    const: atmel,sama5d2-classd
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    const: tx
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: gclk
+
+  assigned-clocks:
+    maxItems: 1
+    description: classd_gclk
+
+  atmel,model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: The user-visible name of this sound complex.
+    default: CLASSD
+
+  atmel,pwm-type:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - single
+      - diff
+    default: single
+    description: PWM modulation type, "single" or "diff".
+
+  atmel,non-overlap-time:
+    description:
+      Set non-overlapping time, the unit is nanosecond(ns).
+      Non-overlapping will be disabled if not specified.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 5
+      - 10
+      - 15
+      - 20
+    default: 10
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - dmas
+  - dma-names
+  - clock-names
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/dma/at91.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    classd: sound@fc048000 {
+    	compatible = "atmel,sama5d2-classd";
+    	reg = <0xfc048000 0x100>;
+        interrupts = <59 IRQ_TYPE_LEVEL_HIGH 7>;
+        dmas = <&dma0
+            (AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
+            | AT91_XDMAC_DT_PERID(47))>;
+        dma-names = "tx";
+        clocks = <&classd_clk>, <&classd_gclk>;
+        clock-names = "pclk", "gclk";
+        assigned-clocks = <&classd_gclk>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_classd_default>;
+        atmel,model = "classd @ SAMA5D2-Xplained";
+        atmel,pwm-type = "diff";
+        atmel,non-overlap-time = <10>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/atmel-classd.txt b/Documentation/devicetree/bindings/sound/atmel-classd.txt
deleted file mode 100644
index 898551076382..000000000000
--- a/Documentation/devicetree/bindings/sound/atmel-classd.txt
+++ /dev/null
@@ -1,55 +0,0 @@
-* Atmel ClassD driver under ALSA SoC architecture
-
-Required properties:
-- compatible
-	Should be "atmel,sama5d2-classd".
-- reg
-	Should contain ClassD registers location and length.
-- interrupts
-	Should contain the IRQ line for the ClassD.
-- dmas
-	One DMA specifiers as described in atmel-dma.txt and dma.txt files.
-- dma-names
-	Must be "tx".
-- clock-names
-	Tuple listing input clock names.
-	Required elements: "pclk" and "gclk".
-- clocks
-	Please refer to clock-bindings.txt.
-- assigned-clocks
-	Should be <&classd_gclk>.
-
-Optional properties:
-- pinctrl-names, pinctrl-0
-	Please refer to pinctrl-bindings.txt.
-- atmel,model
-	The user-visible name of this sound complex.
-	The default value is "CLASSD".
-- atmel,pwm-type
-	PWM modulation type, "single" or "diff".
-	The default value is "single".
-- atmel,non-overlap-time
-	Set non-overlapping time, the unit is nanosecond(ns).
-	There are four values,
-	<5>, <10>, <15>, <20>, the default value is <10>.
-	Non-overlapping will be disabled if not specified.
-
-Example:
-classd: classd@fc048000 {
-		compatible = "atmel,sama5d2-classd";
-		reg = <0xfc048000 0x100>;
-		interrupts = <59 IRQ_TYPE_LEVEL_HIGH 7>;
-		dmas = <&dma0
-			(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
-			| AT91_XDMAC_DT_PERID(47))>;
-		dma-names = "tx";
-		clocks = <&classd_clk>, <&classd_gclk>;
-		clock-names = "pclk", "gclk";
-		assigned-clocks = <&classd_gclk>;
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_classd_default>;
-		atmel,model = "classd @ SAMA5D2-Xplained";
-		atmel,pwm-type = "diff";
-		atmel,non-overlap-time = <10>;
-};
-- 
2.34.1

