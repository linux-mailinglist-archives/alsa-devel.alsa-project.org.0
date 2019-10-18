Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A99D6DCDB7
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 20:15:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3093D1612;
	Fri, 18 Oct 2019 20:15:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3093D1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571422556;
	bh=MrIFv0gNtyf4O1d7kMmXx4fm2UKwxW6KaGdcXK5jyqk=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=nfg3eYJl3LpObKbkUhTA15+2nUoe1rVPyisfii38tsg+ySZT1oj6XppyXhdzrmlrc
	 VWehZOQG/D53qUfc771STggB7nBegrGfviEIZx3rS+DKXQaUxoyh94M4eV2vkREnrM
	 8DwWwjxMx6OI65u8Ga3irWZ3e1B1x02SfzV+ohd8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0980F806E9;
	Fri, 18 Oct 2019 20:07:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CADBFF80639; Fri, 18 Oct 2019 20:07:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS, PRX_BODY_26, RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE, 
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3E10F805F5
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 20:07:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3E10F805F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="GJDnfk9P"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=pRsIWe9U79jN+NdQSnCg3rgMnwSzcyvRozb90fu5/9Q=; b=GJDnfk9PbiMb
 mf3AO247VyCbNgxTCbVAmlHqq6p2QDWOiqjIAMVVqJace+96yCbBUp1nuHbLogAhQU1uGzLQ7EV9i
 o3xt+7LVBm3WyGzMPgc6066dIYv1bepQJNbtSZS/AumPm2wgedNg6XWhyFF7k01YUd4GBPdQGBQaU
 KBdWU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iLWeR-0004F4-Bz; Fri, 18 Oct 2019 18:06:59 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D35652743273; Fri, 18 Oct 2019 19:06:58 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20191016104355.65169-1-mripard@kernel.org>
X-Patchwork-Hint: ignore
Message-Id: <20191018180658.D35652743273@ypsilon.sirena.org.uk>
Date: Fri, 18 Oct 2019 19:06:58 +0100 (BST)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: dt-bindings: Convert Allwinner A10
	codec to a schema" to the asoc tree
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

   ASoC: dt-bindings: Convert Allwinner A10 codec to a schema

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 2ad450593b7dbfcfcfd4e0502ccfcd6af627d430 Mon Sep 17 00:00:00 2001
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 16 Oct 2019 12:43:55 +0200
Subject: [PATCH] ASoC: dt-bindings: Convert Allwinner A10 codec to a schema

The Allwinner SoCs have an embedded audio codec that is supported in Linux,
with a matching Device Tree binding.

Now that we have the DT validation in place, let's convert the device tree
bindings for that controller over to a YAML schemas.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/r/20191016104355.65169-1-mripard@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../sound/allwinner,sun4i-a10-codec.yaml      | 267 ++++++++++++++++++
 .../devicetree/bindings/sound/sun4i-codec.txt |  94 ------
 2 files changed, 267 insertions(+), 94 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/sun4i-codec.txt

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
new file mode 100644
index 000000000000..b8f89c7258eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
@@ -0,0 +1,267 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/allwinner,sun4i-a10-codec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A10 Codec Device Tree Bindings
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
+    enum:
+      - allwinner,sun4i-a10-codec
+      - allwinner,sun6i-a31-codec
+      - allwinner,sun7i-a20-codec
+      - allwinner,sun8i-a23-codec
+      - allwinner,sun8i-h3-codec
+      - allwinner,sun8i-v3s-codec
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
+      - const: codec
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
+  resets:
+    maxItems: 1
+
+  allwinner,audio-routing:
+    description: |-
+      A list of the connections between audio components.  Each entry
+      is a pair of strings, the first being the connection's sink, the
+      second being the connection's source.
+    allOf:
+      - $ref: /schemas/types.yaml#definitions/non-unique-string-array
+      - minItems: 2
+        maxItems: 18
+        items:
+          enum:
+            # Audio Pins on the SoC
+            - HP
+            - HPCOM
+            - LINEIN
+            - LINEOUT
+            - MIC1
+            - MIC2
+            - MIC3
+
+            # Microphone Biases from the SoC
+            - HBIAS
+            - MBIAS
+
+            # Board Connectors
+            - Headphone
+            - Headset Mic
+            - Line In
+            - Line Out
+            - Mic
+            - Speaker
+
+  allwinner,codec-analog-controls:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the codec analog controls in the PRCM
+
+  allwinner,pa-gpios:
+    description: GPIO to enable the external amplifier
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
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun6i-a31-codec
+            - allwinner,sun8i-a23-codec
+            - allwinner,sun8i-h3-codec
+            - allwinner,sun8i-v3s-codec
+
+    then:
+      if:
+        properties:
+          compatible:
+            const: allwinner,sun6i-a31-codec
+
+      then:
+        required:
+          - resets
+          - allwinner,audio-routing
+
+      else:
+        required:
+          - resets
+          - allwinner,audio-routing
+          - allwinner,codec-analog-controls
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun6i-a31-codec
+
+    then:
+      properties:
+        allwinner,audio-routing:
+          items:
+            enum:
+              - HP
+              - HPCOM
+              - LINEIN
+              - LINEOUT
+              - MIC1
+              - MIC2
+              - MIC3
+              - HBIAS
+              - MBIAS
+              - Headphone
+              - Headset Mic
+              - Line In
+              - Line Out
+              - Mic
+              - Speaker
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun8i-a23-codec
+
+    then:
+      properties:
+        allwinner,audio-routing:
+          items:
+            enum:
+              - HP
+              - HPCOM
+              - LINEIN
+              - MIC1
+              - MIC2
+              - HBIAS
+              - MBIAS
+              - Headphone
+              - Headset Mic
+              - Line In
+              - Line Out
+              - Mic
+              - Speaker
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun8i-h3-codec
+
+    then:
+      properties:
+        allwinner,audio-routing:
+          items:
+            enum:
+              - HP
+              - HPCOM
+              - LINEIN
+              - LINEOUT
+              - MIC1
+              - MIC2
+              - HBIAS
+              - MBIAS
+              - Headphone
+              - Headset Mic
+              - Line In
+              - Line Out
+              - Mic
+              - Speaker
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun8i-v3s-codec
+
+    then:
+      properties:
+        allwinner,audio-routing:
+          items:
+            enum:
+              - HP
+              - HPCOM
+              - MIC1
+              - HBIAS
+              - Headphone
+              - Headset Mic
+              - Line In
+              - Line Out
+              - Mic
+              - Speaker
+
+additionalProperties: false
+
+examples:
+  - |
+    codec@1c22c00 {
+        #sound-dai-cells = <0>;
+        compatible = "allwinner,sun7i-a20-codec";
+        reg = <0x01c22c00 0x40>;
+        interrupts = <0 30 4>;
+        clocks = <&apb0_gates 0>, <&codec_clk>;
+        clock-names = "apb", "codec";
+        dmas = <&dma 0 19>, <&dma 0 19>;
+        dma-names = "rx", "tx";
+    };
+
+  - |
+    codec@1c22c00 {
+        #sound-dai-cells = <0>;
+        compatible = "allwinner,sun6i-a31-codec";
+        reg = <0x01c22c00 0x98>;
+        interrupts = <0 29 4>;
+        clocks = <&ccu 61>, <&ccu 135>;
+        clock-names = "apb", "codec";
+        resets = <&ccu 42>;
+        dmas = <&dma 15>, <&dma 15>;
+        dma-names = "rx", "tx";
+        allwinner,audio-routing =
+            "Headphone", "HP",
+            "Speaker", "LINEOUT",
+            "LINEIN", "Line In",
+            "MIC1", "MBIAS",
+            "MIC1", "Mic",
+            "MIC2", "HBIAS",
+            "MIC2", "Headset Mic";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/sun4i-codec.txt b/Documentation/devicetree/bindings/sound/sun4i-codec.txt
deleted file mode 100644
index 66579bbd3294..000000000000
--- a/Documentation/devicetree/bindings/sound/sun4i-codec.txt
+++ /dev/null
@@ -1,94 +0,0 @@
-* Allwinner A10 Codec
-
-Required properties:
-- compatible: must be one of the following compatibles:
-		- "allwinner,sun4i-a10-codec"
-		- "allwinner,sun6i-a31-codec"
-		- "allwinner,sun7i-a20-codec"
-		- "allwinner,sun8i-a23-codec"
-		- "allwinner,sun8i-h3-codec"
-		- "allwinner,sun8i-v3s-codec"
-- reg: must contain the registers location and length
-- interrupts: must contain the codec interrupt
-- dmas: DMA channels for tx and rx dma. See the DMA client binding,
-	Documentation/devicetree/bindings/dma/dma.txt
-- dma-names: should include "tx" and "rx".
-- clocks: a list of phandle + clock-specifer pairs, one for each entry
-  in clock-names.
-- clock-names: should contain the following:
-   - "apb": the parent APB clock for this controller
-   - "codec": the parent module clock
-
-Optional properties:
-- allwinner,pa-gpios: gpio to enable external amplifier
-
-Required properties for the following compatibles:
-		- "allwinner,sun6i-a31-codec"
-		- "allwinner,sun8i-a23-codec"
-		- "allwinner,sun8i-h3-codec"
-		- "allwinner,sun8i-v3s-codec"
-- resets: phandle to the reset control for this device
-- allwinner,audio-routing: A list of the connections between audio components.
-			   Each entry is a pair of strings, the first being the
-			   connection's sink, the second being the connection's
-			   source. Valid names include:
-
-			   Audio pins on the SoC:
-			   "HP"
-			   "HPCOM"
-			   "LINEIN"	(not on sun8i-v3s)
-			   "LINEOUT"	(not on sun8i-a23 or sun8i-v3s)
-			   "MIC1"
-			   "MIC2"	(not on sun8i-v3s)
-			   "MIC3"	(sun6i-a31 only)
-
-			   Microphone biases from the SoC:
-			   "HBIAS"
-			   "MBIAS"	(not on sun8i-v3s)
-
-			   Board connectors:
-			   "Headphone"
-			   "Headset Mic"
-			   "Line In"
-			   "Line Out"
-			   "Mic"
-			   "Speaker"
-
-Required properties for the following compatibles:
-		- "allwinner,sun8i-a23-codec"
-		- "allwinner,sun8i-h3-codec"
-		- "allwinner,sun8i-v3s-codec"
-- allwinner,codec-analog-controls: A phandle to the codec analog controls
-				   block in the PRCM.
-
-Example:
-codec: codec@1c22c00 {
-	#sound-dai-cells = <0>;
-	compatible = "allwinner,sun7i-a20-codec";
-	reg = <0x01c22c00 0x40>;
-	interrupts = <0 30 4>;
-	clocks = <&apb0_gates 0>, <&codec_clk>;
-	clock-names = "apb", "codec";
-	dmas = <&dma 0 19>, <&dma 0 19>;
-	dma-names = "rx", "tx";
-};
-
-codec: codec@1c22c00 {
-	#sound-dai-cells = <0>;
-	compatible = "allwinner,sun6i-a31-codec";
-	reg = <0x01c22c00 0x98>;
-	interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
-	clocks = <&ccu CLK_APB1_CODEC>, <&ccu CLK_CODEC>;
-	clock-names = "apb", "codec";
-	resets = <&ccu RST_APB1_CODEC>;
-	dmas = <&dma 15>, <&dma 15>;
-	dma-names = "rx", "tx";
-	allwinner,audio-routing =
-		"Headphone", "HP",
-		"Speaker", "LINEOUT",
-		"LINEIN", "Line In",
-		"MIC1",	"MBIAS",
-		"MIC1", "Mic",
-		"MIC2", "HBIAS",
-		"MIC2", "Headset Mic";
-};
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
