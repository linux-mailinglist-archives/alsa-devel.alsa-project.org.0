Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9046532B6
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Dec 2022 15:53:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DEAD16AE;
	Wed, 21 Dec 2022 15:52:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DEAD16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671634402;
	bh=oB6R46eTs8RXr17mwz2LdiHMSYkZGgw5mkkxS/GTbqs=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=i5zQ37KKLbM81Ih9trSGP4oiiLNeFcTDTe321ShD8haCxaS/EDAdlCFlgkcdMnpld
	 lFVbnnXc7K2LObu1gJVWz2tXA0rQTpo1UYxxGmCOM/EJUtdo1dUoUcoKw2JwolRii6
	 kC8G2Ux+W2tHoZTB7PCBYKGtaLfkJvRQOlPtdyrU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E03BBF8047B;
	Wed, 21 Dec 2022 15:52:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E045F8024D; Wed, 21 Dec 2022 15:52:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58CBAF8024D
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 15:52:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58CBAF8024D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=B7hoiLD9
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BLEqPKH004043;
 Wed, 21 Dec 2022 08:52:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1671634345;
 bh=43Jnf7WN1VyPd1OJr719d6STlpdns9sivKKv0a9ffPc=;
 h=From:To:CC:Subject:Date;
 b=B7hoiLD9OxyWfHh93xq5YlQlwL6jgJMRO69k3O0q3NvZR0mAB/49TAzMqB/zb3WJy
 iagPf7e0KNHXhr5t2DNlaad1RoUQlc/tEhm1RToEk7Dd1Xbj1r/7PivyG1fDwf32Gn
 HUIzeklYFoGms7bOZWYijqq/dxmfw3/OWnWNOux8=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BLEqPBE018025
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 21 Dec 2022 08:52:25 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 21
 Dec 2022 08:52:25 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 21 Dec 2022 08:52:25 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BLEqOxM074403;
 Wed, 21 Dec 2022 08:52:24 -0600
From: Jai Luthra <j-luthra@ti.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v4] dt-bindings: sound: tlv320aic3x: Convert to dtschema
Date: Wed, 21 Dec 2022 20:22:16 +0530
Message-ID: <20221221145216.11400-1-j-luthra@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Jai Luthra <j-luthra@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Convert bindings for TI's TLV320AIC3x audio codecs to dtschema.

The following properties are still found in some old dts files, but will
be ignored by the driver:
- adc-settle-ms
- assigned-clock-parents, assigned-clock-rates, assigned-clocks
- port

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---

Changes in v4:
- Use generic node name in the example
- Fix typo in commit message

v3: https://lore.kernel.org/linux-devicetree/20221220123951.29959-1-j-luthra@ti.com/
v2: https://lore.kernel.org/linux-devicetree/20220803151726.31628-1-j-luthra@ti.com/

 .../bindings/sound/ti,tlv320aic3x.yaml        | 158 ++++++++++++++++++
 .../devicetree/bindings/sound/tlv320aic3x.txt |  97 -----------
 2 files changed, 158 insertions(+), 97 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/tlv320aic3x.txt

diff --git a/Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml b/Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml
new file mode 100644
index 000000000000..f0375bbf4c40
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml
@@ -0,0 +1,158 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+# Copyright (C) 2022 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,tlv320aic3x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TLV320AIC3x Codec
+
+description: |
+  TLV320AIC3x are a series of low-power stereo audio codecs with stereo
+  headphone amplifier, as well as multiple inputs and outputs programmable in
+  single-ended or fully differential configurations.
+
+  The serial control bus supports SPI or I2C protocols, while the serial audio
+  data bus is programmable for I2S, left/right-justified, DSP, or TDM modes.
+
+  The following pins can be referred in the sound node's audio routing property:
+
+  CODEC output pins:
+     LLOUT
+     RLOUT
+     MONO_LOUT
+     HPLOUT
+     HPROUT
+     HPLCOM
+     HPRCOM
+
+  CODEC input pins for TLV320AIC3104:
+     MIC2L
+     MIC2R
+     LINE1L
+     LINE1R
+
+  CODEC input pins for other compatible codecs:
+     MIC3L
+     MIC3R
+     LINE1L
+     LINE2L
+     LINE1R
+     LINE2R
+
+maintainers:
+  - Jai Luthra <j-luthra@ti.com>
+
+properties:
+  compatible:
+    enum:
+      - ti,tlv320aic3x
+      - ti,tlv320aic33
+      - ti,tlv320aic3007
+      - ti,tlv320aic3106
+      - ti,tlv320aic3104
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      GPIO specification for the active low RESET input.
+
+  gpio-reset:
+    maxItems: 1
+    description:
+      Deprecated, please use reset-gpios instead.
+    deprecated: true
+
+  ai3x-gpio-func:
+    description: AIC3X_GPIO1 & AIC3X_GPIO2 Functionality
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    maxItems: 2
+
+  ai3x-micbias-vg:
+    description: MicBias required voltage. If node is omitted then MicBias is powered down.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    oneOf:
+      - const: 1
+        description: MICBIAS output is powered to 2.0V.
+      - const: 2
+        description: MICBIAS output is powered to 2.5V.
+      - const: 3
+        description: MICBIAS output is connected to AVDD.
+
+  ai3x-ocmv:
+    description: Output Common-Mode Voltage selection.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    oneOf:
+      - const: 0
+        description: 1.35V
+      - const: 1
+        description: 1.5V
+      - const: 2
+        description: 1.65V
+      - const: 3
+        description: 1.8V
+
+  AVDD-supply:
+    description: Analog DAC voltage.
+
+  IOVDD-supply:
+    description: I/O voltage.
+
+  DRVDD-supply:
+    description: ADC analog and output driver voltage.
+
+  DVDD-supply:
+    description: Digital core voltage.
+
+  '#sound-dai-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      tlv320aic3x_i2c: audio-codec@1b {
+        compatible = "ti,tlv320aic3x";
+        reg = <0x1b>;
+
+        reset-gpios = <&gpio1 17 GPIO_ACTIVE_LOW>;
+
+        AVDD-supply = <&regulator>;
+        IOVDD-supply = <&regulator>;
+        DRVDD-supply = <&regulator>;
+        DVDD-supply = <&regulator>;
+      };
+    };
+
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      tlv320aic3x_spi: audio-codec@0 {
+        compatible = "ti,tlv320aic3x";
+        reg = <0>; /* CS number */
+        #sound-dai-cells = <0>;
+
+        AVDD-supply = <&regulator>;
+        IOVDD-supply = <&regulator>;
+        DRVDD-supply = <&regulator>;
+        DVDD-supply = <&regulator>;
+        ai3x-ocmv = <0>;
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/tlv320aic3x.txt b/Documentation/devicetree/bindings/sound/tlv320aic3x.txt
deleted file mode 100644
index 20931a63fd64..000000000000
--- a/Documentation/devicetree/bindings/sound/tlv320aic3x.txt
+++ /dev/null
@@ -1,97 +0,0 @@
-Texas Instruments - tlv320aic3x Codec module
-
-The tlv320aic3x serial control bus communicates through both I2C and SPI bus protocols
-
-Required properties:
-
-- compatible - "string" - One of:
-    "ti,tlv320aic3x" - Generic TLV320AIC3x device
-    "ti,tlv320aic33" - TLV320AIC33
-    "ti,tlv320aic3007" - TLV320AIC3007
-    "ti,tlv320aic3106" - TLV320AIC3106
-    "ti,tlv320aic3104" - TLV320AIC3104
-
-
-- reg - <int> -  I2C slave address
-
-
-Optional properties:
-
-- reset-gpios - GPIO specification for the active low RESET input.
-- ai3x-gpio-func - <array of 2 int> - AIC3X_GPIO1 & AIC3X_GPIO2 Functionality
-				    - Not supported on tlv320aic3104
-- ai3x-micbias-vg - MicBias Voltage required.
-	1 - MICBIAS output is powered to 2.0V,
-	2 - MICBIAS output is powered to 2.5V,
-	3 - MICBIAS output is connected to AVDD,
-	If this node is not mentioned or if the value is incorrect, then MicBias
-	is powered down.
-- ai3x-ocmv - Output Common-Mode Voltage selection:
-	0 - 1.35V,
-	1 - 1.5V,
-	2 - 1.65V,
-	3 - 1.8V
-- AVDD-supply, IOVDD-supply, DRVDD-supply, DVDD-supply : power supplies for the
-  device as covered in Documentation/devicetree/bindings/regulator/regulator.txt
-
-Deprecated properties:
-
-- gpio-reset - gpio pin number used for codec reset
-
-CODEC output pins:
-  * LLOUT
-  * RLOUT
-  * MONO_LOUT
-  * HPLOUT
-  * HPROUT
-  * HPLCOM
-  * HPRCOM
-
-CODEC input pins for TLV320AIC3104:
-  * MIC2L
-  * MIC2R
-  * LINE1L
-  * LINE1R
-
-CODEC input pins for other compatible codecs:
-  * MIC3L
-  * MIC3R
-  * LINE1L
-  * LINE2L
-  * LINE1R
-  * LINE2R
-
-The pins can be used in referring sound node's audio-routing property.
-
-I2C example:
-
-#include <dt-bindings/gpio/gpio.h>
-
-tlv320aic3x: tlv320aic3x@1b {
-	compatible = "ti,tlv320aic3x";
-	reg = <0x1b>;
-
-	reset-gpios = <&gpio1 17 GPIO_ACTIVE_LOW>;
-
-	AVDD-supply = <&regulator>;
-	IOVDD-supply = <&regulator>;
-	DRVDD-supply = <&regulator>;
-	DVDD-supply = <&regulator>;
-};
-
-SPI example:
-
-spi0: spi@f0000000 {
-	tlv320aic3x: codec@0 {
-		compatible = "ti,tlv320aic3x";
-		reg = <0>; /* CS number */
-		#sound-dai-cells = <0>;
-		spi-max-frequency = <1000000>;
-
-		AVDD-supply = <&regulator>;
-		IOVDD-supply = <&regulator>;
-		DRVDD-supply = <&regulator>;
-		DVDD-supply = <&regulator>;
-		ai3x-ocmv = <0>;
-	};
-};
-- 
2.17.1

