Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EFB2CA37
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 17:19:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 879AA1844;
	Tue, 28 May 2019 17:18:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 879AA1844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559056788;
	bh=8Oyw6iGetQ8LbxwWLu7Hm3o/x7UAI3URyIhC/B14y3Q=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Yt54C7f+o0mL2ZMFw1jz4IMvC5bLYBuDFkAagpWsPqf5M7YJ1lb3IzO05ctvrNNTz
	 soqc7BLOAFjIIZTTyLcI1g5PaV6xFuJq4Pad7i6Hs+HxICas9d1FGVXjLKDxZqYqTw
	 R1lyvldi1koK9TXr0toSvx8EcL88suYhUrosFxjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D89B3F89786;
	Tue, 28 May 2019 17:07:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41B6DF89764; Tue, 28 May 2019 17:07:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8729F896B8
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 17:07:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8729F896B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="P+hrYHLL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=50UF5NrIgTV94h2lmtoHlHIleHK4ai5jgUswsShESRU=; b=P+hrYHLLCJn/
 Y7ptg4w+HgOPPs3EAFacc8mjpi4YJ6DDhgq7owPzTnVxYaNfZFonJGP+xSvV22gDP6lHsLgoCPjJY
 gBm28iBepZgjmZ6u6VCuS9aMXGZ0/ihKCNYqcFk/tAHNsIdWwt4fz/iSGEcW2Qn+BC5ALKZGo9Ts7
 hdG1s=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hVdgn-0002nl-2u; Tue, 28 May 2019 15:06:57 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 5B5C3440049; Tue, 28 May 2019 16:06:56 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>
In-Reply-To: <5f8095fbd5c2c34478792b9715059675251a30e6.1558702660.git-series.maxime.ripard@bootlin.com>
X-Patchwork-Hint: ignore
Message-Id: <20190528150656.5B5C3440049@finisterre.sirena.org.uk>
Date: Tue, 28 May 2019 16:06:56 +0100 (BST)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "dt-bindings: sound: Convert Allwinner I2S
	binding to YAML" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   dt-bindings: sound: Convert Allwinner I2S binding to YAML

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 0a0ca8e94ca36d2153c2fbea69a31f792bfc5831 Mon Sep 17 00:00:00 2001
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Fri, 24 May 2019 14:57:58 +0200
Subject: [PATCH] dt-bindings: sound: Convert Allwinner I2S binding to YAML

The Allwinner SoCs feature an I2S controller across multiple SoC
generations.

However, earlier generations were a bit simpler than the subsequent ones,
and for example would always have RX and TX capabilities, and no reset
lines.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../sound/allwinner,sun4i-a10-i2s.yaml        | 100 ++++++++++++++++++
 .../devicetree/bindings/sound/sun4i-i2s.txt   |  45 --------
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
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
