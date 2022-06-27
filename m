Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EE355B51A
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 04:05:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE1FBAE8;
	Mon, 27 Jun 2022 04:05:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE1FBAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656295550;
	bh=A/hKScSumPCt6aF1kyzNqr0N7Juq8gjLLFsNVCw+TSg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I3tBEUb2Ogzq+tK4KxUOPXjDovla6EKuz7bTBcmysmJs1/ZS+1QGrOmsvBa0mIB3o
	 p9chJ3fZFoYsF3N9jNWcPKcKpKAqaN6thtLlXn6BrIbrfEbHbE1IKbD3/QTSgvw8vl
	 r7P/xkNAaeNiHW7Q8v0DTAkEqL36UQcyPWN/re30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63324F800E9;
	Mon, 27 Jun 2022 04:04:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55A40F800E9; Mon, 27 Jun 2022 04:04:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DF28F80107
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 04:04:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DF28F80107
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 60CE81A1A6F;
 Mon, 27 Jun 2022 04:04:42 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D44631A1A73;
 Mon, 27 Jun 2022 04:04:41 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id AEDEF1802205;
 Mon, 27 Jun 2022 10:04:39 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: dt-bindings: fsl,
 micfil: Convert format to json-schema
Date: Mon, 27 Jun 2022 09:50:13 +0800
Message-Id: <1656294613-27867-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: shengjiu.wang@gmail.com
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

Convert the NXP MICFIL binding to DT schema format using json-schema.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v2
- add decription of interrupts.

 .../devicetree/bindings/sound/fsl,micfil.txt  | 33 --------
 .../devicetree/bindings/sound/fsl,micfil.yaml | 77 +++++++++++++++++++
 2 files changed, 77 insertions(+), 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/fsl,micfil.txt
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,micfil.yaml

diff --git a/Documentation/devicetree/bindings/sound/fsl,micfil.txt b/Documentation/devicetree/bindings/sound/fsl,micfil.txt
deleted file mode 100644
index 1ea05d4996c7..000000000000
--- a/Documentation/devicetree/bindings/sound/fsl,micfil.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-NXP MICFIL Digital Audio Interface (MICFIL).
-
-The MICFIL digital interface provides a 16-bit audio signal from a PDM
-microphone bitstream in a configurable output sampling rate.
-
-Required properties:
-
-  - compatible		: Compatible list, contains "fsl,imx8mm-micfil"
-			  or "fsl,imx8mp-micfil"
-
-  - reg			: Offset and length of the register set for the device.
-
-  - interrupts		: Contains the micfil interrupts.
-
-  - clocks		: Must contain an entry for each entry in clock-names.
-
-  - clock-names		: Must include the "ipg_clk" for register access and
-			  "ipg_clk_app" for internal micfil clock.
-
-  - dmas		: Generic dma devicetree binding as described in
-			  Documentation/devicetree/bindings/dma/dma.txt.
-
-Example:
-micfil: micfil@30080000 {
-	compatible = "fsl,imx8mm-micfil";
-	reg = <0x0 0x30080000 0x0 0x10000>;
-	interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
-	clocks = <&clk IMX8MM_CLK_PDM_IPG>,
-		 <&clk IMX8MM_CLK_PDM_ROOT>;
-	clock-names = "ipg_clk", "ipg_clk_app";
-	dmas = <&sdma2 24 26 0x80000000>;
-};
diff --git a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml b/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
new file mode 100644
index 000000000000..bf24faed7a4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/fsl,micfil.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP MICFIL Digital Audio Interface (MICFIL)
+
+maintainers:
+  - Shengjiu Wang <shengjiu.wang@nxp.com>
+
+description: |
+  The MICFIL digital interface provides a 16-bit or 24-bit audio signal
+  from a PDM microphone bitstream in a configurable output sampling rate.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8mm-micfil
+      - fsl,imx8mp-micfil
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Digital Microphone interface interrupt
+      - description: Digital Microphone interface error interrupt
+      - description: voice activity detector event interrupt
+      - description: voice activity detector error interrupt
+
+  dmas:
+    items:
+      - description: DMA controller phandle and request line for RX
+
+  dma-names:
+    items:
+      - const: rx
+
+  clocks:
+    items:
+      - description: The ipg clock for register access
+      - description: internal micfil clock
+
+  clock-names:
+    items:
+      - const: ipg_clk
+      - const: ipg_clk_app
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
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/imx8mm-clock.h>
+    micfil: audio-controller@30080000 {
+        compatible = "fsl,imx8mm-micfil";
+        reg = <0x30080000 0x10000>;
+        interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk IMX8MM_CLK_PDM_IPG>,
+                 <&clk IMX8MM_CLK_PDM_ROOT>;
+        clock-names = "ipg_clk", "ipg_clk_app";
+        dmas = <&sdma2 24 25 0>;
+        dma-names = "rx";
+    };
-- 
2.17.1

