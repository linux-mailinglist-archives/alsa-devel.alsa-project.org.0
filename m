Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFA11F7C5F
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 19:16:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 690471688;
	Fri, 12 Jun 2020 19:15:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 690471688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591982187;
	bh=Fwzbosei0HByDVYgERuku3rwNX10KgUsbqZnlh7ANz8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gCtm7RDykCMoswP48dX6OW4xbMmKHlh5J77HGSDPdRczNpASPqxuzBZMLW7V/BTro
	 l1rRvVp02VONbEP0hYVZ44TSYCFZJUAzgdZPkf9gjGgbXyVEM3G9pntcHZ2akjtJ2i
	 Y5QLQ7n4h+2ZV4yqqNZP0vVk3C45bwsIEYGpiJpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BED6CF80259;
	Fri, 12 Jun 2020 19:14:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC495F8021C; Fri, 12 Jun 2020 19:13:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8BB2F800C7
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 19:13:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8BB2F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hJLaWsgF"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05CHDnO8017540;
 Fri, 12 Jun 2020 12:13:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1591982029;
 bh=Eh9UAOjUzWioaZG3am18FwLSncclY2ToXxZVUuvMnBA=;
 h=From:To:CC:Subject:Date;
 b=hJLaWsgFf6I92X2hrkEQ03u/3R4RuAl7yB+WHRRIjObdUIpCngLXlxk0248vtM4bz
 rCeBSRwFzNM0KihxUZbe8mFyn/XzzXCLoeGfmshk/AzdtNx5/MLfs+2gdPopBqteve
 fMqVJHo3lLkd3ALQu8gegdfsO5YM3mna11XiWVMg=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05CHDn0t093355;
 Fri, 12 Jun 2020 12:13:49 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 12
 Jun 2020 12:13:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 12 Jun 2020 12:13:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05CHDm7X123904;
 Fri, 12 Jun 2020 12:13:48 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <robh@kernel.org>, <shifu0704@thundersoft.com>
Subject: [PATCH 1/2] dt-bindings: tas2770: Convert tas2770 binding to yaml
Date: Fri, 12 Jun 2020 12:13:41 -0500
Message-ID: <20200612171342.25364-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
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

Convert the tas2770 binding to yaml format.
Add in the reset-gpio to the binding as it is in the code but not
documented in the binding.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 .../devicetree/bindings/sound/tas2770.txt     | 37 ---------
 .../devicetree/bindings/sound/tas2770.yaml    | 76 +++++++++++++++++++
 2 files changed, 76 insertions(+), 37 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/tas2770.txt
 create mode 100644 Documentation/devicetree/bindings/sound/tas2770.yaml

diff --git a/Documentation/devicetree/bindings/sound/tas2770.txt b/Documentation/devicetree/bindings/sound/tas2770.txt
deleted file mode 100644
index ede6bb3d9637..000000000000
--- a/Documentation/devicetree/bindings/sound/tas2770.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-Texas Instruments TAS2770 Smart PA
-
-The TAS2770 is a mono, digital input Class-D audio amplifier optimized for
-efficiently driving high peak power into small loudspeakers.
-Integrated speaker voltage and current sense provides for
-real time monitoring of loudspeaker behavior.
-
-Required properties:
-
- - compatible:	   - Should contain "ti,tas2770".
- - reg:		       - The i2c address. Should contain <0x4c>, <0x4d>,<0x4e>, or <0x4f>.
- - #address-cells  - Should be <1>.
- - #size-cells     - Should be <0>.
- - ti,asi-format:  - Sets TDM RX capture edge. 0->Rising; 1->Falling.
- - ti,imon-slot-no:- TDM TX current sense time slot.
- - ti,vmon-slot-no:- TDM TX voltage sense time slot.
-
-Optional properties:
-
-- interrupt-parent: the phandle to the interrupt controller which provides
-                     the interrupt.
-- interrupts: interrupt specification for data-ready.
-
-Examples:
-
-    tas2770@4c {
-                compatible = "ti,tas2770";
-                reg = <0x4c>;
-                #address-cells = <1>;
-                #size-cells = <0>;
-                interrupt-parent = <&msm_gpio>;
-                interrupts = <97 0>;
-                ti,asi-format = <0>;
-                ti,imon-slot-no = <0>;
-                ti,vmon-slot-no = <2>;
-        };
-
diff --git a/Documentation/devicetree/bindings/sound/tas2770.yaml b/Documentation/devicetree/bindings/sound/tas2770.yaml
new file mode 100644
index 000000000000..8c667fd37a57
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tas2770.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
+# Copyright (C) 2019-20 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/sound/tas2770.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Texas Instruments TAS2770 Smart PA
+
+maintainers:
+  - Shi Fu <shifu0704@thundersoft.com>
+
+description: |
+  The TAS2770 is a mono, digital input Class-D audio amplifier optimized for
+  efficiently driving high peak power into small loudspeakers.
+  Integrated speaker voltage and current sense provides for
+  real time monitoring of loudspeaker behavior.
+
+properties:
+  compatible:
+    enum:
+      - ti,tas2770
+
+  reg:
+    maxItems: 1
+    description: |
+       I2C address of the device can be one of these 0x4c, 0x4d, 0x4e or 0x4f
+
+  reset-gpio:
+    description: GPIO used to reset the device.
+
+  interrupts:
+    maxItems: 1
+
+  ti,imon-slot-no:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: TDM TX current sense time slot.
+
+  ti,vmon-slot-no:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: TDM TX voltage sense time slot.
+
+  ti,asi-format:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Sets TDM RX capture edge.
+    enum:
+          - 0 # Rising edge
+          - 1 # Falling edge
+
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+   #include <dt-bindings/gpio/gpio.h>
+   i2c0 {
+     #address-cells = <1>;
+     #size-cells = <0>;
+     codec: codec@4c {
+       compatible = "ti,tas2770";
+       reg = <0x4c>;
+       #sound-dai-cells = <1>;
+       interrupt-parent = <&gpio1>;
+       interrupts = <14>;
+       reset-gpio = <&gpio1 15 0>;
+       ti,imon-slot-no = <0>;
+       ti,vmon-slot-no = <2>;
+     };
+   };
+
-- 
2.26.2

