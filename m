Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BEA200E6
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 10:02:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADDFC16A2;
	Thu, 16 May 2019 10:01:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADDFC16A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557993728;
	bh=j5GqSMFIM4J/mDlDaXIJtENq9K0eao/Dwmqwg8040x0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hQOXpH4QZTN6fR2KJ0cY2uW9f7f/hqqFhBxKyXmZacBZOesQh9KOLCO6dYT13Zjbi
	 8CyiiI4z45OVqHpemh+uqPR71BLhSrqo8fCP2vswiYynJUtLjcbbGiQswVXPyV+dpL
	 +6ZzJiHyh32lVh8QPv3hrJUUr4shBhkoIOyUstT4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F24BEF89721;
	Thu, 16 May 2019 09:59:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95B18F896E0; Thu, 16 May 2019 09:59:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_26,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12336F806E7
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 09:59:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12336F806E7
X-Originating-IP: 80.215.246.107
Received: from localhost (unknown [80.215.246.107])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 5B0CC1C000D;
 Thu, 16 May 2019 07:59:28 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Date: Thu, 16 May 2019 09:59:25 +0200
Message-Id: <706cb97ae45cc9edc49c8709b2189ed786d2c7db.1557993523.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v3 1/2] dt-bindings: sound: Convert Allwinner
	SPDIF binding to YAML
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

The Allwinner SoCs feature an SPDIF controller across multiple SoC
generations.

However, earlier generations were a bit simpler than the subsequent ones,
and for example would always have RX and TX capabilities, and no reset
lines.

In order to express this, let's create two YAML schemas instead of the free
form text we had before.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

---

Changes from v2:
  - Add comments

Changes from v1:
  - Merged the two schemas together and used the draft-7 conditionals
---
 Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml | 101 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 Documentation/devicetree/bindings/sound/sunxi,sun4i-spdif.txt          |  42 +------------------------------
 2 files changed, 101 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/sunxi,sun4i-spdif.txt

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml
new file mode 100644
index 000000000000..5d72d48e923e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/allwinner,sun4i-a10-spdif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A10 S/PDIF Controller Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Liam Girdwood <lgirdwood@gmail.com>
+  - Mark Brown <broonie@kernel.org>
+  - Maxime Ripard <maxime.ripard@bootlin.com>
+
+properties:
+  "#sound-dai-cells":
+    const: 0
+
+  compatible:
+    oneOf:
+      - const: allwinner,sun4i-a10-spdif
+      - const: allwinner,sun6i-a31-spdif
+      - const: allwinner,sun8i-h3-spdif
+      - items:
+          - const: allwinner,sun8i-a83t-spdif
+          - const: allwinner,sun8i-h3-spdif
+      - items:
+          - const: allwinner,sun50i-a64-spdif
+          - const: allwinner,sun8i-h3-spdif
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
+      - const: spdif
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
+              - allwinner,sun6i-a31-spdif
+              - allwinner,sun8i-h3-spdif
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
+    spdif: spdif@1c21000 {
+        #sound-dai-cells = <0>;
+        compatible = "allwinner,sun4i-a10-spdif";
+        reg = <0x01c21000 0x40>;
+        interrupts = <13>;
+        clocks = <&apb0_gates 1>, <&spdif_clk>;
+        clock-names = "apb", "spdif";
+        dmas = <&dma 0 2>, <&dma 0 2>;
+        dma-names = "rx", "tx";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/sunxi,sun4i-spdif.txt b/Documentation/devicetree/bindings/sound/sunxi,sun4i-spdif.txt
deleted file mode 100644
index 0c64a209c2e9..000000000000
--- a/Documentation/devicetree/bindings/sound/sunxi,sun4i-spdif.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-Allwinner Sony/Philips Digital Interface Format (S/PDIF) Controller
-
-The Allwinner S/PDIF audio block is a transceiver that allows the
-processor to receive and transmit digital audio via an coaxial cable or
-a fibre cable.
-For now only playback is supported.
-
-Required properties:
-
-  - compatible		: should be one of the following:
-    - "allwinner,sun4i-a10-spdif": for the Allwinner A10 SoC
-    - "allwinner,sun6i-a31-spdif": for the Allwinner A31 SoC
-    - "allwinner,sun8i-h3-spdif": for the Allwinner H3 SoC
-
-  - reg			: Offset and length of the register set for the device.
-
-  - interrupts		: Contains the spdif interrupt.
-
-  - dmas		: Generic dma devicetree binding as described in
-			  Documentation/devicetree/bindings/dma/dma.txt.
-
-  - dma-names		: Two dmas have to be defined, "tx" and "rx".
-
-  - clocks		: Contains an entry for each entry in clock-names.
-
-  - clock-names		: Includes the following entries:
-	"apb"		  clock for the spdif bus.
-	"spdif"		  clock for spdif controller.
-
-  - resets		: reset specifier for the ahb reset (A31 and newer only)
-
-Example:
-
-spdif: spdif@1c21000 {
-	compatible = "allwinner,sun4i-a10-spdif";
-	reg = <0x01c21000 0x40>;
-	interrupts = <13>;
-	clocks = <&apb0_gates 1>, <&spdif_clk>;
-	clock-names = "apb", "spdif";
-	dmas = <&dma 0 2>, <&dma 0 2>;
-	dma-names = "rx", "tx";
-};

base-commit: 00c3bc00f0cadbb48f2414370733892676511e79
-- 
git-series 0.9.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
