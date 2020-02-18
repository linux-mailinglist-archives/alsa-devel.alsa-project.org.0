Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A92162CD3
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 18:30:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 062A816A2;
	Tue, 18 Feb 2020 18:29:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 062A816A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582047023;
	bh=KP2XXVvhYTUaZ2UaYt/dAzBZQFzktSUKtI2g7I04v44=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LRLEKvJoCZ3eBxS3JcRoAVfl08oc0Nb84HBV/Qetjf9GUx+KedfKRAGfbEnlkbUL6
	 pyWleOLFwj6r60bWpgQM6Jfy6trW+9nEXIsz9mFvGVUiL/L44ppA1KNJnzXSaKt3Q5
	 Ojxl7StDSO9/ZTaLisLl4lqXswuXT9BIfX0CQAcY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1AD5F802A1;
	Tue, 18 Feb 2020 18:26:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C3E2F8028C; Tue, 18 Feb 2020 18:26:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8E3DF80145
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 18:26:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8E3DF80145
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="x01A5Br+"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01IHQQG0111245;
 Tue, 18 Feb 2020 11:26:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582046786;
 bh=gJynQt6rZV7Wj/PMmszf0/Bne7WCcMJSNYok4DWno0w=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=x01A5Br+UXO0Gu/38QaRXOeHfR2LLc8uan1OuyjEcwEJc2grgHDwwIAwo97oFQCrw
 5ZkTAR9sAlakpbb5gHVQSetNwq0LtA7V3WvaxuAG2/xFPjHpXSr8tszUp5QF4xuLs3
 s8Lbmg+Tc3s2u/5/5eMIC4OyZ9rduzRqqo9XBqKY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01IHQQKu123965
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 18 Feb 2020 11:26:26 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 18
 Feb 2020 11:26:25 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 18 Feb 2020 11:26:26 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01IHQPKS046743;
 Tue, 18 Feb 2020 11:26:25 -0600
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v2 1/2] dt-bindings: sound: Add TLV320ADCx140 dt bindings
Date: Tue, 18 Feb 2020 11:21:39 -0600
Message-ID: <20200218172140.23740-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200218172140.23740-1-dmurphy@ti.com>
References: <20200218172140.23740-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>
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

Add dt bindings for the TLV320ADCx140 Burr-Brown ADC.
The initial support is for the following:

TLV320ADC3140 - http://www.ti.com/lit/gpn/tlv320adc3140
TLV320ADC5140 - http://www.ti.com/lit/gpn/tlv320adc5140
TLV320ADC6140 - http://www.ti.com/lit/gpn/tlv320adc6140

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
v2 - added areg-supply to determine to use internal or external regulator.

 .../bindings/sound/tlv320adcx140.yaml         | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/tlv320adcx140.yaml

diff --git a/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml b/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
new file mode 100644
index 000000000000..1433ff62b14f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
+# Copyright (C) 2019 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/tlv320adcx140.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TLV320ADCX140 Quad Channel Analog-to-Digital Converter
+
+maintainers:
+  - Dan Murphy <dmurphy@ti.com>
+
+description: |
+  The TLV320ADCX140 are multichannel (4-ch analog recording or 8-ch digital
+  PDM microphones recording), high-performance audio, analog-to-digital
+  converter (ADC) with analog inputs supporting up to 2V RMS. The TLV320ADCX140
+  family supports line and  microphone Inputs, and offers a programmable
+  microphone bias or supply voltage generation.
+
+  Specifications can be found at:
+    http://www.ti.com/lit/ds/symlink/tlv320adc3140.pdf
+    http://www.ti.com/lit/ds/symlink/tlv320adc5140.pdf
+    http://www.ti.com/lit/ds/symlink/tlv320adc6140.pdf
+
+properties:
+  compatible:
+    oneOf:
+      - const: ti,tlv320adc3140
+      - const: ti,tlv320adc5140
+      - const: ti,tlv320adc6140
+
+  reg:
+    maxItems: 1
+    description: |
+       I2C addresss of the device can be one of these 0x4c, 0x4d, 0x4e or 0x4f
+
+  reset-gpios:
+    description: |
+       GPIO used for hardware reset.
+
+  areg-supply:
+      description: |
+       Regulator with AVDD at 3.3V.  If not defined then the internal regulator
+       is enabled.
+
+  ti,mic-bias-source:
+    description: |
+       Indicates the source for MIC Bias.
+       0 - Mic bias is set to VREF
+       1 - Mic bias is set to VREF × 1.096
+       6 - Mic bias is set to AVDD
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [0, 1, 6]
+
+  ti,vref-source:
+    description: |
+       Indicates the source for MIC Bias.
+       0 - Set VREF to 2.75V
+       1 - Set VREF to 2.5V
+       2 - Set VREF to 1.375V
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [0, 1, 2]
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c0 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      codec: codec@4c {
+        compatible = "ti,tlv320adc5140";
+        reg = <0x4c>;
+        ti,use-internal-areg;
+        ti,mic-bias-source = <6>;
+        reset-gpios = <&gpio0 14 GPIO_ACTIVE_HIGH>;
+      };
+    };
-- 
2.25.0

