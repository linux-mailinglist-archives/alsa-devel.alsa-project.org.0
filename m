Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 206B724CFE2
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:48:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A64AB1675;
	Fri, 21 Aug 2020 09:48:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A64AB1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597996134;
	bh=MbBDkxosu6wTA21802AMDVk2qskNBvFelBlwMbVdqmE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VLeYOS5hup0qC/LRVktJRIgx5WPCRLgHbLOqZi1lfnkd9ucmn5Zdt3tSQXqbYsUA5
	 io0KqVuN0LkPmKrz5Zt9oNOXRMJhSuAI9lyMYkGKGumaO03o3V0vzCpM8THA6EtY5V
	 XM1FFM9a3pqbChD7joAPzc7aLghN3Q487vKXHIFI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31586F8025A;
	Fri, 21 Aug 2020 09:36:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 500F2F80218; Tue, 18 Aug 2020 03:11:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6160CF800EF
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 03:11:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6160CF800EF
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B09DD1A0F74;
 Tue, 18 Aug 2020 03:11:27 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 22E201A0F2A;
 Tue, 18 Aug 2020 03:11:24 +0200 (CEST)
Received: from 10.192.242.69 (shlinux2.ap.freescale.net [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 9C4DD402BE;
 Tue, 18 Aug 2020 03:11:19 +0200 (CEST)
From: Anson Huang <Anson.Huang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 shengjiu.wang@nxp.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2] dt-bindings: sound: Convert NXP spdif to json-schema
Date: Tue, 18 Aug 2020 09:06:11 +0800
Message-Id: <1597712771-32433-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Fri, 21 Aug 2020 09:36:14 +0200
Cc: Linux-imx@nxp.com
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

Convert the NXP SPDIF binding to DT schema format using json-schema.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
changes since V1:
	- add "additionalProperties: false".
---
 .../devicetree/bindings/sound/fsl,spdif.txt        |  68 -------------
 .../devicetree/bindings/sound/fsl,spdif.yaml       | 110 +++++++++++++++++++++
 2 files changed, 110 insertions(+), 68 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/fsl,spdif.txt
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,spdif.yaml

diff --git a/Documentation/devicetree/bindings/sound/fsl,spdif.txt b/Documentation/devicetree/bindings/sound/fsl,spdif.txt
deleted file mode 100644
index e1365b0..0000000
--- a/Documentation/devicetree/bindings/sound/fsl,spdif.txt
+++ /dev/null
@@ -1,68 +0,0 @@
-Freescale Sony/Philips Digital Interface Format (S/PDIF) Controller
-
-The Freescale S/PDIF audio block is a stereo transceiver that allows the
-processor to receive and transmit digital audio via an coaxial cable or
-a fibre cable.
-
-Required properties:
-
-  - compatible		: Compatible list, should contain one of the following
-			  compatibles:
-			  "fsl,imx35-spdif",
-			  "fsl,vf610-spdif",
-			  "fsl,imx6sx-spdif",
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
-	"core"		  The core clock of spdif controller.
-	"rxtx<0-7>"	  Clock source list for tx and rx clock.
-			  This clock list should be identical to the source
-			  list connecting to the spdif clock mux in "SPDIF
-			  Transceiver Clock Diagram" of SoC reference manual.
-			  It can also be referred to TxClk_Source bit of
-			  register SPDIF_STC.
-	"spba"		  The spba clock is required when SPDIF is placed as a
-			  bus slave of the Shared Peripheral Bus and when two
-			  or more bus masters (CPU, DMA or DSP) try to access
-			  it. This property is optional depending on the SoC
-			  design.
-
-Optional properties:
-
-   - big-endian		: If this property is absent, the native endian mode
-			  will be in use as default, or the big endian mode
-			  will be in use for all the device registers.
-
-Example:
-
-spdif: spdif@2004000 {
-	compatible = "fsl,imx35-spdif";
-	reg = <0x02004000 0x4000>;
-	interrupts = <0 52 0x04>;
-	dmas = <&sdma 14 18 0>,
-	       <&sdma 15 18 0>;
-	dma-names = "rx", "tx";
-
-	clocks = <&clks 197>, <&clks 3>,
-	       <&clks 197>, <&clks 107>,
-	       <&clks 0>, <&clks 118>,
-	       <&clks 62>, <&clks 139>,
-	       <&clks 0>;
-	clock-names = "core", "rxtx0",
-		"rxtx1", "rxtx2",
-		"rxtx3", "rxtx4",
-		"rxtx5", "rxtx6",
-		"rxtx7";
-
-	big-endian;
-};
diff --git a/Documentation/devicetree/bindings/sound/fsl,spdif.yaml b/Documentation/devicetree/bindings/sound/fsl,spdif.yaml
new file mode 100644
index 0000000..2ac671f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,spdif.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/fsl,spdif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale Sony/Philips Digital Interface Format (S/PDIF) Controller
+
+maintainers:
+  - Shengjiu Wang <shengjiu.wang@nxp.com>
+
+description: |
+  The Freescale S/PDIF audio block is a stereo transceiver that allows the
+  processor to receive and transmit digital audio via an coaxial cable or
+  a fibre cable.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx35-spdif
+      - fsl,vf610-spdif
+      - fsl,imx6sx-spdif
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  dmas:
+    items:
+      - description: DMA controller phandle and request line for RX
+      - description: DMA controller phandle and request line for TX
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+  clocks:
+    items:
+      - description: The core clock of spdif controller.
+      - description: Clock for tx0 and rx0.
+      - description: Clock for tx1 and rx1.
+      - description: Clock for tx2 and rx2.
+      - description: Clock for tx3 and rx3.
+      - description: Clock for tx4 and rx4.
+      - description: Clock for tx5 and rx5.
+      - description: Clock for tx6 and rx6.
+      - description: Clock for tx7 and rx7.
+      - description: The spba clock is required when SPDIF is placed as a bus
+          slave of the Shared Peripheral Bus and when two or more bus masters
+          (CPU, DMA or DSP) try to access it. This property is optional depending
+          on the SoC design.
+    minItems: 9
+
+  clock-names:
+    items:
+      - const: core
+      - const: rxtx0
+      - const: rxtx1
+      - const: rxtx2
+      - const: rxtx3
+      - const: rxtx4
+      - const: rxtx5
+      - const: rxtx6
+      - const: rxtx7
+      - const: spba
+    minItems: 9
+
+  big-endian:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      If this property is absent, the native endian mode will be in use
+      as default, or the big endian mode will be in use for all the device
+      registers. Set this flag for HCDs with big endian descriptors and big
+      endian registers.
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
+    spdif@2004000 {
+        compatible = "fsl,imx35-spdif";
+        reg = <0x02004000 0x4000>;
+        interrupts = <0 52 0x04>;
+        dmas = <&sdma 14 18 0>,
+               <&sdma 15 18 0>;
+        dma-names = "rx", "tx";
+        clocks = <&clks 197>, <&clks 3>,
+                 <&clks 197>, <&clks 107>,
+                 <&clks 0>, <&clks 118>,
+                 <&clks 62>, <&clks 139>,
+                 <&clks 0>;
+        clock-names = "core", "rxtx0",
+                      "rxtx1", "rxtx2",
+                      "rxtx3", "rxtx4",
+                      "rxtx5", "rxtx6",
+                      "rxtx7";
+        big-endian;
+    };
-- 
2.7.4

