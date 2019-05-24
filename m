Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C7E29868
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 14:59:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7B6316DD;
	Fri, 24 May 2019 14:59:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7B6316DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558702795;
	bh=sQJDUH2Tvb7aiDxyEoBxzvpRSKGWQOePzWJuO4LfcE0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fSFEkTmSo3wpkhSjCnjW65WC/h39A0Q13SpZ2gyxFPV7I7E2oCyJaIhWwdplsVJ53
	 Cy5NqHORB/I9go5tZ+BOGO92VYKPUyITrCFi7+eiDlaDDAyXt+Qwu+onlV6Teqs3wV
	 9UPJsRvg/l1VY3PeZ6BNnKBw8VJShlZUuH1u/8j4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B220F89630;
	Fri, 24 May 2019 14:58:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF456F89630; Fri, 24 May 2019 14:58:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_26,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32448F89625
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 14:58:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32448F89625
X-Originating-IP: 90.88.147.134
Received: from localhost (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr
 [90.88.147.134]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 88DC340012;
 Fri, 24 May 2019 12:58:00 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Date: Fri, 24 May 2019 14:57:58 +0200
Message-Id: <5f8095fbd5c2c34478792b9715059675251a30e6.1558702660.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH 1/2] dt-bindings: sound: Convert Allwinner I2S
	binding to YAML
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The Allwinner SoCs feature an I2S controller across multiple SoC
generations.

However, earlier generations were a bit simpler than the subsequent ones,
and for example would always have RX and TX capabilities, and no reset
lines.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml | 100 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 Documentation/devicetree/bindings/sound/sun4i-i2s.txt                |  45 +--------------------------------
 2 files changed, 100 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/sun4i-i2s.txt

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
new file mode 100644
index 000000000000..85b2d6d84055
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/allwinner,sun4i-a10-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A10 I2S Controller Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <maxime.ripard@bootlin.com>
+
+properties:
+  "#sound-dai-cells":
+    const: 0
+
+  compatible:
+    oneOf:
+      - const: allwinner,sun4i-a10-i2s
+      - const: allwinner,sun6i-a31-i2s
+      - const: allwinner,sun8i-a83t-i2s
+      - const: allwinner,sun8i-h3-i2s
+      - const: allwinner,sun50i-a64-codec-i2s
+      - items:
+          - const: allwinner,sun50i-a64-i2s
+          - const: allwinner,sun8i-h3-i2s
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Bus Clock
+      - description: Module Clock
+
+  clock-names:
+    items:
+      - const: apb
+      - const: mod
+
+  dmas:
+    items:
+      - description: RX DMA Channel
+      - description: TX DMA Channel
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+  # Even though it only applies to subschemas under the conditionals,
+  # not listing them here will trigger a warning because of the
+  # additionalsProperties set to false.
+  resets:
+    maxItems: 1
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun6i-a31-i2s
+              - allwinner,sun8i-a83t-i2s
+              - allwinner,sun8i-h3-i2s
+              - allwinner,sun50i-a64-codec-i2s
+
+    then:
+      required:
+        - resets
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - dmas
+  - dma-names
+
+additionalProperties: false
+
+examples:
+  - |
+    i2s0: i2s@1c22400 {
+        #sound-dai-cells = <0>;
+        compatible = "allwinner,sun4i-a10-i2s";
+        reg = <0x01c22400 0x400>;
+        interrupts = <0 16 4>;
+        clocks = <&apb0_gates 3>, <&i2s0_clk>;
+        clock-names = "apb", "mod";
+        dmas = <&dma 0 3>, <&dma 0 3>;
+        dma-names = "rx", "tx";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/sun4i-i2s.txt b/Documentation/devicetree/bindings/sound/sun4i-i2s.txt
deleted file mode 100644
index 61e71c1729e0..000000000000
--- a/Documentation/devicetree/bindings/sound/sun4i-i2s.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-* Allwinner A10 I2S controller
-
-The I2S bus (Inter-IC sound bus) is a serial link for digital
-audio data transfer between devices in the system.
-
-Required properties:
-
-- compatible: should be one of the following:
-   - "allwinner,sun4i-a10-i2s"
-   - "allwinner,sun6i-a31-i2s"
-   - "allwinner,sun8i-a83t-i2s"
-   - "allwinner,sun8i-h3-i2s"
-   - "allwinner,sun50i-a64-codec-i2s"
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- interrupts: should contain the I2S interrupt.
-- dmas: DMA specifiers for tx and rx dma. See the DMA client binding,
-	Documentation/devicetree/bindings/dma/dma.txt
-- dma-names: should include "tx" and "rx".
-- clocks: a list of phandle + clock-specifer pairs, one for each entry in clock-names.
-- clock-names: should contain the following:
-   - "apb" : clock for the I2S bus interface
-   - "mod" : module clock for the I2S controller
-- #sound-dai-cells : Must be equal to 0
-
-Required properties for the following compatibles:
-	- "allwinner,sun6i-a31-i2s"
-	- "allwinner,sun8i-a83t-i2s"
-	- "allwinner,sun8i-h3-i2s"
-	- "allwinner,sun50i-a64-codec-i2s"
-- resets: phandle to the reset line for this codec
-
-Example:
-
-i2s0: i2s@1c22400 {
-	#sound-dai-cells = <0>;
-	compatible = "allwinner,sun4i-a10-i2s";
-	reg = <0x01c22400 0x400>;
-	interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
-	clocks = <&apb0_gates 3>, <&i2s0_clk>;
-	clock-names = "apb", "mod";
-	dmas = <&dma SUN4I_DMA_NORMAL 3>,
-	       <&dma SUN4I_DMA_NORMAL 3>;
-	dma-names = "rx", "tx";
-};

base-commit: 86c9acd4fdf5b2e1648a6cf3d6e99a7f0d35cb4f
-- 
git-series 0.9.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
