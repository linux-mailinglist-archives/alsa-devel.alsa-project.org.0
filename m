Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E14E91EC2E4
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jun 2020 21:38:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C24C166F;
	Tue,  2 Jun 2020 21:37:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C24C166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591126699;
	bh=OHxz+OqTNemoaLVsV6fi5NRxe6ze1kKRnGIFz855GtM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sP9c58dZYMHdo/5St7JpdrXuSolSt/5KiTB9I2mvcVwJPYkU0llrL1W5TfehTSZR3
	 f5TMuqeS4ljgOunyIB3QZS294lDnngFolZ6oLmS35oN5ptXhk5YILYlbgTKhsYltC8
	 EnOB8+yUN6ltA05Iw83jiUwdPfEhcyNGzVgKLD4Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6345F80279;
	Tue,  2 Jun 2020 21:35:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0107BF80273; Tue,  2 Jun 2020 21:35:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68155F80260
 for <alsa-devel@alsa-project.org>; Tue,  2 Jun 2020 21:35:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68155F80260
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OlSX02OP"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 052JZaw2110528;
 Tue, 2 Jun 2020 14:35:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1591126536;
 bh=/GqgLpU1uPJ1Wy+HenNmK2cNmc59eJZQiS6sZEF0GYw=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=OlSX02OP6CNAVor5r6F8fugshagcZ2Sv+MkYt0Vgd9rdYWr9VELYiNwoKT+vmhj5z
 NSXN/grf5ygZuwP5d/vY3wTP7Uk7+X8YFYPW6q98N3aSSrT68UozruYNGquOjEOX62
 OJC8vTkpm7ieXB0KHalnv9yX1DMpP03q5vhIeLZU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 052JZZAB091823
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 2 Jun 2020 14:35:35 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 2 Jun
 2020 14:35:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 2 Jun 2020 14:35:35 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 052JZZeS006873;
 Tue, 2 Jun 2020 14:35:35 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH 2/2] dt-bindings: tas2562: Convert the tas2562 binding to yaml
Date: Tue, 2 Jun 2020 14:35:24 -0500
Message-ID: <20200602193524.30309-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200602193524.30309-1-dmurphy@ti.com>
References: <20200602193524.30309-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: robh@kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>, devicetree@vger.kernel.org
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

Convert the TAS2562 text file to yaml format.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 .../devicetree/bindings/sound/tas2562.txt     | 34 ----------
 .../devicetree/bindings/sound/tas2562.yaml    | 65 +++++++++++++++++++
 2 files changed, 65 insertions(+), 34 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/tas2562.txt
 create mode 100644 Documentation/devicetree/bindings/sound/tas2562.yaml

diff --git a/Documentation/devicetree/bindings/sound/tas2562.txt b/Documentation/devicetree/bindings/sound/tas2562.txt
deleted file mode 100644
index 94796b547184..000000000000
--- a/Documentation/devicetree/bindings/sound/tas2562.txt
+++ /dev/null
@@ -1,34 +0,0 @@
-Texas Instruments TAS2562 Smart PA
-
-The TAS2562 is a mono, digital input Class-D audio amplifier optimized for
-efficiently driving high peak power into small loudspeakers.
-Integrated speaker voltage and current sense provides for
-real time monitoring of loudspeaker behavior.
-
-Required properties:
- - #address-cells  - Should be <1>.
- - #size-cells     - Should be <0>.
- - compatible:	   - Should contain "ti,tas2562", "ti,tas2563".
- - reg:		   - The i2c address. Should be 0x4c, 0x4d, 0x4e or 0x4f.
- - ti,imon-slot-no:- TDM TX current sense time slot.
-
-Optional properties:
-- interrupt-parent: phandle to the interrupt controller which provides
-                    the interrupt.
-- interrupts: (GPIO) interrupt to which the chip is connected.
-- shut-down: GPIO used to control the state of the device.
-
-Examples:
-tas2562@4c {
-        #address-cells = <1>;
-        #size-cells = <0>;
-        compatible = "ti,tas2562";
-        reg = <0x4c>;
-
-        interrupt-parent = <&gpio1>;
-        interrupts = <14>;
-
-	shut-down = <&gpio1 15 0>;
-        ti,imon-slot-no = <0>;
-};
-
diff --git a/Documentation/devicetree/bindings/sound/tas2562.yaml b/Documentation/devicetree/bindings/sound/tas2562.yaml
new file mode 100644
index 000000000000..11e0269d03b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tas2562.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
+# Copyright (C) 2019 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/sound/tas2562.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Texas Instruments TAS2562 Smart PA
+
+maintainers:
+  - Dan Murphy <dmurphy@ti.com>
+
+description: |
+  The TAS2562 is a mono, digital input Class-D audio amplifier optimized for
+  efficiently driving high peak power into small loudspeakers.
+  Integrated speaker voltage and current sense provides for
+  real time monitoring of loudspeaker behavior.
+
+properties:
+  compatible:
+    enum:
+      - ti,tas2562
+      - ti,tas2563
+
+  reg:
+    maxItems: 1
+    description: |
+       I2C addresss of the device can be one of these 0x4c, 0x4d, 0x4e or 0x4f
+
+  shut-down:
+    description: GPIO used to control the state of the device.
+
+  interrupts:
+    maxItems: 1
+
+  ti,imon-slot-no:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: TDM TX current sense time slot.
+
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+additionalProperties: false
+
+examples:
+  - |
+   #include <dt-bindings/gpio/gpio.h>
+   i2c0 {
+     #address-cells = <1>;
+     #size-cells = <0>;
+     codec: codec@4c {
+       compatible = "ti,tas2562";
+       reg = <0x4c>;
+       #sound-dai-cells = <1>;
+       interrupt-parent = <&gpio1>;
+       interrupts = <14>;
+
+       shut-down = <&gpio1 15 0>;
+       ti,imon-slot-no = <0>;
+     };
+   };
+
-- 
2.26.2

