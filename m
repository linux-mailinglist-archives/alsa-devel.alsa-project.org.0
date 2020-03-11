Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFC218204A
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 19:01:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F62D1672;
	Wed, 11 Mar 2020 19:01:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F62D1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583949713;
	bh=13eyCeRbfnL23xSG0aEnKEidDw3DEzplrT4cMv4eihQ=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=h2yHK+AvmjTiu3ETztY1s2UgQel6ILpjMnwBpUt1NDK2xm3F/Tuq4MgfqdjN5ns3V
	 o/k2219N+EucPYDUUgQBLlRj8XaK6KazINTxHKV91wZ+Xd0R3sP/e1/hp+uCIvtMZn
	 3jrXFGOf2id5KNpS7HvCa/UPdL9j7ZyICwBS1H7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95B73F801EB;
	Wed, 11 Mar 2020 19:00:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F3FBF801EB; Wed, 11 Mar 2020 19:00:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 9A4E0F800BE
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 19:00:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A4E0F800BE
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DC541FB;
 Wed, 11 Mar 2020 11:00:01 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C495F3F6CF;
 Wed, 11 Mar 2020 11:00:00 -0700 (PDT)
Date: Wed, 11 Mar 2020 17:59:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Subject: Applied "ASoC: dt-bindings: stm32: convert spdfirx to json-schema" to
 the asoc tree
In-Reply-To: <20200117170352.16040-1-olivier.moysan@st.com>
Message-Id: <applied-20200117170352.16040-1-olivier.moysan@st.com>
X-Patchwork-Hint: ignore
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, olivier.moysan@st.com, alexandre.torgue@st.com,
 robh@kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
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

The patch

   ASoC: dt-bindings: stm32: convert spdfirx to json-schema

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 9032cdd96a2d4b0ef2f43499328f8a68050be2ec Mon Sep 17 00:00:00 2001
From: Olivier Moysan <olivier.moysan@st.com>
Date: Fri, 17 Jan 2020 18:03:52 +0100
Subject: [PATCH] ASoC: dt-bindings: stm32: convert spdfirx to json-schema

Convert the STM32 SPDIFRX bindings to DT schema format using json-schema.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/r/20200117170352.16040-1-olivier.moysan@st.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/sound/st,stm32-spdifrx.txt       | 56 -------------
 .../bindings/sound/st,stm32-spdifrx.yaml      | 80 +++++++++++++++++++
 2 files changed, 80 insertions(+), 56 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/st,stm32-spdifrx.txt
 create mode 100644 Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml

diff --git a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.txt b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.txt
deleted file mode 100644
index 33826f2459fa..000000000000
--- a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.txt
+++ /dev/null
@@ -1,56 +0,0 @@
-STMicroelectronics STM32 S/PDIF receiver (SPDIFRX).
-
-The SPDIFRX peripheral, is designed to receive an S/PDIF flow compliant with
-IEC-60958 and IEC-61937.
-
-Required properties:
-  - compatible: should be "st,stm32h7-spdifrx"
-  - reg: cpu DAI IP base address and size
-  - clocks: must contain an entry for kclk (used as S/PDIF signal reference)
-  - clock-names: must contain "kclk"
-  - interrupts: cpu DAI interrupt line
-  - dmas: DMA specifiers for audio data DMA and iec control flow DMA
-    See STM32 DMA bindings, Documentation/devicetree/bindings/dma/stm32-dma.txt
-  - dma-names: two dmas have to be defined, "rx" and "rx-ctrl"
-
-Optional properties:
-  - resets: Reference to a reset controller asserting the SPDIFRX
-
-The device node should contain one 'port' child node with one child 'endpoint'
-node, according to the bindings defined in Documentation/devicetree/bindings/
-graph.txt.
-
-Example:
-spdifrx: spdifrx@40004000 {
-	compatible = "st,stm32h7-spdifrx";
-	reg = <0x40004000 0x400>;
-	clocks = <&rcc SPDIFRX_CK>;
-	clock-names = "kclk";
-	interrupts = <97>;
-	dmas = <&dmamux1 2 93 0x400 0x0>,
-	       <&dmamux1 3 94 0x400 0x0>;
-	dma-names = "rx", "rx-ctrl";
-	pinctrl-0 = <&spdifrx_pins>;
-	pinctrl-names = "default";
-
-	spdifrx_port: port {
-		cpu_endpoint: endpoint {
-			remote-endpoint = <&codec_endpoint>;
-		};
-	};
-};
-
-spdif_in: spdif-in {
-	compatible = "linux,spdif-dir";
-
-	codec_port: port {
-		codec_endpoint: endpoint {
-			remote-endpoint = <&cpu_endpoint>;
-		};
-	};
-};
-
-soundcard {
-	compatible = "audio-graph-card";
-	dais = <&spdifrx_port>;
-};
diff --git a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
new file mode 100644
index 000000000000..b7f7dc452231
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/st,stm32-spdifrx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 S/PDIF receiver (SPDIFRX)
+
+maintainers:
+  - Olivier Moysan <olivier.moysan@st.com>
+
+description: |
+  The SPDIFRX peripheral, is designed to receive an S/PDIF flow compliant with
+  IEC-60958 and IEC-61937.
+
+properties:
+  compatible:
+    enum:
+      - st,stm32h7-spdifrx
+
+  "#sound-dai-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: kclk
+
+  interrupts:
+    maxItems: 1
+
+  dmas:
+    items:
+      - description: audio data capture DMA
+      - description: IEC status bits capture DMA
+
+  dma-names:
+    items:
+      - const: rx
+      - const: rx-ctrl
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#sound-dai-cells"
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - dmas
+  - dma-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    spdifrx: spdifrx@40004000 {
+        compatible = "st,stm32h7-spdifrx";
+        #sound-dai-cells = <0>;
+        reg = <0x40004000 0x400>;
+        clocks = <&rcc SPDIF_K>;
+        clock-names = "kclk";
+        interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+        dmas = <&dmamux1 2 93 0x400 0x0>,
+               <&dmamux1 3 94 0x400 0x0>;
+        dma-names = "rx", "rx-ctrl";
+        pinctrl-0 = <&spdifrx_pins>;
+        pinctrl-names = "default";
+    };
+
+...
-- 
2.20.1

