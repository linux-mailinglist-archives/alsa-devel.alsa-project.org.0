Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7625883CB
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Aug 2022 23:49:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D3FF85D;
	Tue,  2 Aug 2022 23:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D3FF85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659476964;
	bh=i7fJOHKPzGqVjkxwqA2zCuPZX2m5STbs+ptK62J7WII=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Lofx8kfz++snlbg3YiEmY0W0mPKhva9eDXez8XrU530cvOt50uyhz67NGnq7oVJgV
	 KrMQT6qEhIETbDLAk+QRSsYqLrSTYK/KEnJTPikShbPp6SQOCBrT2H06/Aw3wTD9H0
	 wsPaovRyC0a0tVm7zcfsy8S/D/rNInojaWm/0m7M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF0FCF8026D;
	Tue,  2 Aug 2022 23:48:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71C0CF8026A; Tue,  2 Aug 2022 23:48:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDC67F80115
 for <alsa-devel@alsa-project.org>; Tue,  2 Aug 2022 23:48:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDC67F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="e7cRbefB"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 272LmDij112802;
 Tue, 2 Aug 2022 16:48:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1659476893;
 bh=0085f2YE6P7wZvScCEtOgRlXyb7a4tEOVEdnbAXBFS8=;
 h=From:To:CC:Subject:Date;
 b=e7cRbefBu/WONF98CcgLnAnXJ1iGxuuyTsTK0ZCoXK6VYsekRMY88cTOkg3Vycgb3
 tzZoRL8/LNvBxbqKniztMfm9lquNkrJ1+c0gBuKXbNsGVIH7Mf8zLBiPprFRJSwCL/
 lf7fiubQYgmaA437MsSU0uNkfqVlE53VrvPuafSs=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 272LmC4I014820
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 2 Aug 2022 16:48:12 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 2
 Aug 2022 16:48:12 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 2 Aug 2022 16:48:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 272LmBwx085355;
 Tue, 2 Aug 2022 16:48:11 -0500
From: Jai Luthra <j-luthra@ti.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH] dt-bindings: sound: tlv320aic3x: Convert to dtschema
Date: Tue, 2 Aug 2022 16:48:11 -0500
Message-ID: <20220802214811.29033-1-j-luthra@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org
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

Convert bindings for TI's TLV320AIC3x audio codecs to dtschema.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 .../devicetree/bindings/sound/tlv320aic3x.txt |  97 ------------
 .../bindings/sound/tlv320aic3x.yaml           | 145 ++++++++++++++++++
 2 files changed, 145 insertions(+), 97 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/tlv320aic3x.txt
 create mode 100644 Documentation/devicetree/bindings/sound/tlv320aic3x.yaml

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
diff --git a/Documentation/devicetree/bindings/sound/tlv320aic3x.yaml b/Documentation/devicetree/bindings/sound/tlv320aic3x.yaml
new file mode 100644
index 000000000000..6efb1d459543
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tlv320aic3x.yaml
@@ -0,0 +1,145 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/tlv320aic3x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TLV320AIC3x Codec Device Tree Bindings
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
+    description: i2c slave address
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      GPIO specification for the active low RESET input.
+
+  ai3x-gpio-func:
+    description: AIC3X_GPIO1 & AIC3X_GPIO2 Functionality
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minItems: 3
+    maxItems: 3
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
+#The pins can be used in referring sound node's audio-routing property.
+
+#CODEC output pins:
+  # LLOUT
+  # RLOUT
+  # MONO_LOUT
+  # HPLOUT
+  # HPROUT
+  # HPLCOM
+  # HPRCOM
+
+#CODEC input pins for TLV320AIC3104:
+  # MIC2L
+  # MIC2R
+  # LINE1L
+  # LINE1R
+
+#CODEC input pins for other compatible codecs:
+  # MIC3L
+  # MIC3R
+  # LINE1L
+  # LINE2L
+  # LINE1R
+  # LINE2R
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
+      tlv320aic3x_i2c: tlv320aic3x@1b {
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
+      tlv320aic3x_spi: codec@0 {
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
-- 
2.17.1

