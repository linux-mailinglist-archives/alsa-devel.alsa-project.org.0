Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4036F57E3CA
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jul 2022 17:30:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80BB518DA;
	Fri, 22 Jul 2022 17:29:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80BB518DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658503849;
	bh=JJMg/JItXY2a7h4X5arrjc+qdPJvmFrq4BolHcVj9J4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dw1uke0G+7oENz3QTA9xsTbP7SmuuQtGWo58OzYIwxlEXqETKDSOxh6gU4qvmpSIt
	 NaolM29XPzVu+7swQTziBdBAzv2xn2I4HoXyE6j71C1herf+z3Ql51A/BW3aw4xaR8
	 gBJmQehhygmdrBCTSQhz0iXqW335rKF8pSwn0G6I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE965F80246;
	Fri, 22 Jul 2022 17:29:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A90AF80246; Fri, 22 Jul 2022 17:29:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 636D2F8016D
 for <alsa-devel@alsa-project.org>; Fri, 22 Jul 2022 17:29:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 636D2F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="y+9/CkBm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1658503780; x=1690039780;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JJMg/JItXY2a7h4X5arrjc+qdPJvmFrq4BolHcVj9J4=;
 b=y+9/CkBm370y0mDmco2c49QSh///e8tFgOCccLxl/z/T78vxfhNSZuJO
 frs1F4Wx8/+xhLV1FBaxXPqCSmyWdAGgiNIGxXkn7x5+5lFHQin7RzXOi
 Lkpdu4/murxJhXq9PBi7hhp4I5ShFP6uPldx7OZcMmIB4DXtoBUOMPYfK
 NuPt3SQqs3dRdWIrNSMysl1zC1afnydoPv2tpUMmuOf+LZveObRncjwi3
 vPj9/YEEZwHXUOHVZQ6gEpxACHl4aQ7+MgOAJkXQ6TBC1AeNAY6oLuI16
 i5e6gwDWg8dcArf9w8WjqgU2i5EUBi89OVkkWEEeUdxlHbQoUerx+NVeT g==;
X-IronPort-AV: E=Sophos;i="5.93,186,1654585200"; d="scan'208";a="169088011"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Jul 2022 08:29:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 22 Jul 2022 08:29:27 -0700
Received: from ryan-Precision-5560.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 22 Jul 2022 08:29:27 -0700
From: <Ryan.Wanner@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>
Subject: [PATCH v2] ASoC: dt-bindings: atmel-i2s: Convert to json-schema
Date: Fri, 22 Jul 2022 08:29:45 -0700
Message-ID: <20220722152945.2950807-1-Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.34.1
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

Convert atmel i2s devicetree binding to json-schema.
Change file name to match json-schema naming.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
Note: running dtbs_check will fail unless updated with this patch,
https://lore.kernel.org/linux-arm-kernel/20220707215812.193008-1-Ryan.Wanner@microchip.com/

v1 -> v2:
- Fix formatting for clock description.
- Fix formatting for dma description.

 .../bindings/sound/atmel,sama5d2-i2s.yaml     | 85 +++++++++++++++++++
 .../devicetree/bindings/sound/atmel-i2s.txt   | 46 ----------
 2 files changed, 85 insertions(+), 46 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/atmel,sama5d2-i2s.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/atmel-i2s.txt

diff --git a/Documentation/devicetree/bindings/sound/atmel,sama5d2-i2s.yaml b/Documentation/devicetree/bindings/sound/atmel,sama5d2-i2s.yaml
new file mode 100644
index 000000000000..0cd1ff89baed
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/atmel,sama5d2-i2s.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (C) 2022 Microchip Technology, Inc. and its subsidiaries
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/atmel,sama5d2-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel I2S controller
+
+maintainers:
+  - Nicolas Ferre <nicolas.ferre@microchip.com>
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+  - Claudiu Beznea <claudiu.beznea@microchip.com>
+
+description:
+  Atmel I2S (Inter-IC Sound Controller) bus is the standard
+  interface for connecting audio devices, such as audio codecs.
+
+properties:
+  compatible:
+    const: atmel,sama5d2-i2s
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Peripheral clock
+      - description: Generated clock (Optional)
+      - description: I2S mux clock (Optional). Set
+          with gclk when Master Mode is required.
+    minItems: 1
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: gclk
+      - const: muxclk
+    minItems: 1
+
+  dmas:
+    items:
+      - description: TX DMA Channel
+      - description: RX DMA Channel
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - dmas
+  - dma-names
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/dma/at91.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i2s@f8050000 {
+        compatible = "atmel,sama5d2-i2s";
+        reg = <0xf8050000 0x300>;
+        interrupts = <54 IRQ_TYPE_LEVEL_HIGH 7>;
+        dmas = <&dma0
+                (AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
+                AT91_XDMAC_DT_PERID(31))>,
+               <&dma0
+                (AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
+                AT91_XDMAC_DT_PERID(32))>;
+        dma-names = "tx", "rx";
+        clocks = <&i2s0_clk>, <&i2s0_gclk>, <&i2s0muxck>;
+        clock-names = "pclk", "gclk", "muxclk";
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_i2s0_default>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/atmel-i2s.txt b/Documentation/devicetree/bindings/sound/atmel-i2s.txt
deleted file mode 100644
index 40549f496a81..000000000000
--- a/Documentation/devicetree/bindings/sound/atmel-i2s.txt
+++ /dev/null
@@ -1,46 +0,0 @@
-* Atmel I2S controller
-
-Required properties:
-- compatible:     Should be "atmel,sama5d2-i2s".
-- reg:            Should be the physical base address of the controller and the
-                  length of memory mapped region.
-- interrupts:     Should contain the interrupt for the controller.
-- dmas:           Should be one per channel name listed in the dma-names property,
-                  as described in atmel-dma.txt and dma.txt files.
-- dma-names:      Two dmas have to be defined, "tx" and "rx".
-                  This IP also supports one shared channel for both rx and tx;
-                  if this mode is used, one "rx-tx" name must be used.
-- clocks:         Must contain an entry for each entry in clock-names.
-                  Please refer to clock-bindings.txt.
-- clock-names:    Should be one of each entry matching the clocks phandles list:
-                  - "pclk" (peripheral clock) Required.
-                  - "gclk" (generated clock) Optional (1).
-                  - "muxclk" (I2S mux clock) Optional (1).
-
-Optional properties:
-- pinctrl-0:      Should specify pin control groups used for this controller.
-- princtrl-names: Should contain only one value - "default".
-
-
-(1) : Only the peripheral clock is required. The generated clock and the I2S
-      mux clock are optional and should only be set together, when Master Mode
-      is required.
-
-Example:
-
-	i2s@f8050000 {
-		compatible = "atmel,sama5d2-i2s";
-		reg = <0xf8050000 0x300>;
-		interrupts = <54 IRQ_TYPE_LEVEL_HIGH 7>;
-		dmas = <&dma0
-			(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
-			 AT91_XDMAC_DT_PERID(31))>,
-		       <&dma0
-			(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
-			 AT91_XDMAC_DT_PERID(32))>;
-		dma-names = "tx", "rx";
-		clocks = <&i2s0_clk>, <&i2s0_gclk>, <&i2s0muxck>;
-		clock-names = "pclk", "gclk", "muxclk";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_i2s0_default>;
-	};
-- 
2.34.1

