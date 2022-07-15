Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 526D0576551
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 18:31:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 796FD193B;
	Fri, 15 Jul 2022 18:30:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 796FD193B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657902671;
	bh=Yd5dATdWcgi5iFQh7VwJ69l17xqkQ/Eaq6hTAVdJgSI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yg4X2l1AQpBIV11y2ZqTWheys7/QQ5wkgzJkupY5/BJ/pk9M1tkpOcywvlE/DYRIa
	 SqhQLi2IdZ0/DAXcy0+MmFpyhJprcbKxjkkMoFisTnxXFBxyTTUvpbr2Ak0etWCo2F
	 I9rE1I6nWowCTYCtwGt3p3nME4rDIlLdXC4p6wLY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB576F80543;
	Fri, 15 Jul 2022 18:29:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1195BF80542; Fri, 15 Jul 2022 18:29:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E358F804B2
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 18:29:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E358F804B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="Of43UMys"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1657902573; x=1689438573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yd5dATdWcgi5iFQh7VwJ69l17xqkQ/Eaq6hTAVdJgSI=;
 b=Of43UMyss7q0E43qjuW/rdjPV4HP475dg+MUwEdrVqkLi4YWiaqGiNe3
 kXWKIOQ3BehVPIHh93OGzlP5b9fkieGKruLUTubnF8U9NBNpbLW/1UFuZ
 S8WykIZFhSG2BUDvPFtqS5XvLU9tiPQBz8xxfpoE65ImMcMQNu59FSlHD
 D5/XZz6Hf+i5ojHPRZAqXE6Ms7y6lR8GVai7X+ECmNcuM7yJoIbAdJH4A
 OPHtKhZ1fOWLfTrHR/QHDgyRmHmNQJRGUc8Oryj+h+nSfeAuTgsq5RsHe
 poB8gg1CJeg4X1BV6Vs/BwNgwCaBRgXzTFpl0OljUYGXkOM8vdvgMJh9f Q==;
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="168040855"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Jul 2022 09:29:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 15 Jul 2022 09:29:14 -0700
Received: from ryan-Precision-5560.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 15 Jul 2022 09:29:14 -0700
From: <Ryan.Wanner@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>
Subject: [PATCH v3 2/2] ASoC: dt-bindings: atmel-classd: PDMIC convert to
 json-schema
Date: Fri, 15 Jul 2022 09:29:22 -0700
Message-ID: <20220715162922.660859-3-Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220715162922.660859-1-Ryan.Wanner@microchip.com>
References: <20220715162922.660859-1-Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

Convert Atmel PDMIC devicetree binding to json-schema.
Change file naming to match json-schema naming.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
v1 -> v2:
- Fix title.
- Removed trivial descriptions.
- Fix formatting.
v2 -> v3:
- Correct location for description.
- Correct dts example indentation.

 .../bindings/sound/atmel,sama5d2-pdmic.yaml   | 98 +++++++++++++++++++
 .../devicetree/bindings/sound/atmel-pdmic.txt | 55 -----------
 2 files changed, 98 insertions(+), 55 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/atmel,sama5d2-pdmic.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/atmel-pdmic.txt

diff --git a/Documentation/devicetree/bindings/sound/atmel,sama5d2-pdmic.yaml b/Documentation/devicetree/bindings/sound/atmel,sama5d2-pdmic.yaml
new file mode 100644
index 000000000000..f320b561f24c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/atmel,sama5d2-pdmic.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (C) 2022 Microchip Technology, Inc. and its subsidiaries
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/atmel,sama5d2-pdmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel PDMIC decoder
+
+maintainers:
+  - Claudiu Beznea <claudiu.beznea@microchip.com>
+
+description:
+  Atmel Pulse Density Modulation Interface Controller
+  (PDMIC) peripheral is a mono PDM decoder module
+  that decodes an incoming PDM sample stream.
+
+properties:
+  compatible:
+    const: atmel,sama5d2-pdmic
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: peripheral clock
+      - description: generated clock
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: gclk
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    const: rx
+
+  atmel,mic-min-freq:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The minimal frequency that the microphone supports.
+
+  atmel,mic-max-freq:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The maximal frequency that the microphone supports.
+
+  atmel,model:
+    $ref: /schemas/types.yaml#/definitions/string
+    default: PDMIC
+    description: The user-visible name of this sound card.
+
+  atmel,mic-offset:
+    $ref: /schemas/types.yaml#/definitions/int32
+    default: 0
+    description: The offset that should be added.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - dmas
+  - dma-names
+  - clock-names
+  - clocks
+  - atmel,mic-min-freq
+  - atmel,mic-max-freq
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/dma/at91.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pdmic: sound@f8018000 {
+        compatible = "atmel,sama5d2-pdmic";
+        reg = <0xf8018000 0x124>;
+        interrupts = <48 IRQ_TYPE_LEVEL_HIGH 7>;
+        dmas = <&dma0
+                (AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
+                | AT91_XDMAC_DT_PERID(50))>;
+        dma-names = "rx";
+        clocks = <&pdmic_clk>, <&pdmic_gclk>;
+        clock-names = "pclk", "gclk";
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_pdmic_default>;
+        atmel,model = "PDMIC@sama5d2_xplained";
+        atmel,mic-min-freq = <1000000>;
+        atmel,mic-max-freq = <3246000>;
+        atmel,mic-offset = <0x0>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/atmel-pdmic.txt b/Documentation/devicetree/bindings/sound/atmel-pdmic.txt
deleted file mode 100644
index e0875f17c229..000000000000
--- a/Documentation/devicetree/bindings/sound/atmel-pdmic.txt
+++ /dev/null
@@ -1,55 +0,0 @@
-* Atmel PDMIC driver under ALSA SoC architecture
-
-Required properties:
-- compatible
-	Should be "atmel,sama5d2-pdmic".
-- reg
-	Should contain PDMIC registers location and length.
-- interrupts
-	Should contain the IRQ line for the PDMIC.
-- dmas
-	One DMA specifiers as described in atmel-dma.txt and dma.txt files.
-- dma-names
-	Must be "rx".
-- clock-names
-	Required elements:
-	- "pclk"	peripheral clock
-	- "gclk"	generated clock
-- clocks
-	Must contain an entry for each required entry in clock-names.
-	Please refer to clock-bindings.txt.
-- atmel,mic-min-freq
-	The minimal frequency that the micphone supports.
-- atmel,mic-max-freq
-	The maximal frequency that the micphone supports.
-
-Optional properties:
-- pinctrl-names, pinctrl-0
-	Please refer to pinctrl-bindings.txt.
-- atmel,model
-	The user-visible name of this sound card.
-	The default value is "PDMIC".
-- atmel,mic-offset
-	The offset that should be added.
-	The range is from -32768 to 32767.
-	The default value is 0.
-
-Example:
-	pdmic@f8018000 {
-				compatible = "atmel,sama5d2-pdmic";
-				reg = <0xf8018000 0x124>;
-				interrupts = <48 IRQ_TYPE_LEVEL_HIGH 7>;
-				dmas = <&dma0
-					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
-					| AT91_XDMAC_DT_PERID(50))>;
-				dma-names = "rx";
-				clocks = <&pdmic_clk>, <&pdmic_gclk>;
-				clock-names = "pclk", "gclk";
-
-				pinctrl-names = "default";
-				pinctrl-0 = <&pinctrl_pdmic_default>;
-				atmel,model = "PDMIC @ sama5d2_xplained";
-				atmel,mic-min-freq = <1000000>;
-				atmel,mic-max-freq = <3246000>;
-				atmel,mic-offset = <0x0>;
-	};
-- 
2.34.1

