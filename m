Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A285D8E42
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Oct 2019 12:45:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6F9F1615;
	Wed, 16 Oct 2019 12:45:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6F9F1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571222756;
	bh=hAvNeRU8hvfjTwAol3Rr0c9IiYNKSRSzjY7ntQPUS+A=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O5vZKlME1Ls0KGI6XlWYVnKmh39pq8y9HrUcqyYx2Q6Wa5g2Wn0iBoBReo2N3Nwb5
	 PcRlFLSx99de3jK4P8dFkzVaXvHwM1EfnJ5qhIaUXD6dZrzsb7HnpVbPU/ERBQyulg
	 ig8mciAS6E8V+dBa58TB+15V81BChFRBQlZFnPbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03A46F80322;
	Wed, 16 Oct 2019 12:44:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A12D0F80362; Wed, 16 Oct 2019 12:44:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8DF8F80322
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 12:44:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8DF8F80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OoVBpgu5"
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20ABB2168B;
 Wed, 16 Oct 2019 10:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571222641;
 bh=Sg5D34GnHEWc66UOrTDBpqCvV3gIlQjrJcuLuidVbQk=;
 h=From:To:Cc:Subject:Date:From;
 b=OoVBpgu5xWSD6KRAwpxjFGmRsQdb1ZsEZYmSRwhMu6VxTD5JCe/PG4sCz9zWgT8aZ
 D5T6KpfOy8jF20KpsbAaFULilkgW9ud63c03zoyVPFLThXYvFRlaAPYsenVkPsrcdB
 guMIpCXdhYLdzCF1rWbZH07xX6FryErjHgMFk5Os=
From: Maxime Ripard <mripard@kernel.org>
To: lgirdwood@gmail.com, broonie@kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <mripard@kernel.org>
Date: Wed, 16 Oct 2019 12:43:55 +0200
Message-Id: <20191016104355.65169-1-mripard@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v3] ASoC: dt-bindings: Convert Allwinner A10
	codec to a schema
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

The Allwinner SoCs have an embedded audio codec that is supported in Linux,
with a matching Device Tree binding.

Now that we have the DT validation in place, let's convert the device tree
bindings for that controller over to a YAML schemas.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---

Changes from v2:
  - Change the audio-routing values to an enum, and enforce boundaries on
    the size
  - Add restrictions to the possible values of audio-routing

Changes from v1:
  - Fix subject prefix
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
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
