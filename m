Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B5D475E37
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 18:09:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE6DB1A41;
	Wed, 15 Dec 2021 18:08:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE6DB1A41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639588145;
	bh=dxevgy5vy6Cl5vkPcI2PgcDi2RF2XSbrXpORtTYdNds=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nhB8/Q4T9ldPl+HGXtOjMpYRh4K0cKWzgdINH3eGYrdZTEjJk7A4o5S/PpuwZxb7I
	 Z0AvI672VfinTNuSQQImG/qAae1zMPqUmicMZBkUupvKiWNxs9O97mMQm7juQbEObX
	 yKEzD61GwA6dCAdfK2yi1Vx1l61Irr3z1rcmG3Wg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65250F800EE;
	Wed, 15 Dec 2021 18:07:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75243F80236; Wed, 15 Dec 2021 18:07:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86CE9F8019D
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 18:07:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86CE9F8019D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="UEbZt99S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1639588070;
 x=1671124070;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=E5x5Fh3kAPl1d8ha//eW/GWflI0/Y717alolefM8qg0=;
 b=UEbZt99S1RQEivfRlrvixC3DU1ieWkK2u9VAGUQZlILC0GntsnALZaX9
 x1sRIBqvC7Rxfu5XHvN31w+hhSLkajdhb5Lm5RctvEGUcxDc+2ah0xHVv
 9IzDue2eGIQtPoi6UEW1SwPVNFioj58/56YOHWepBvPB74QUTt5EJ0LyU
 mh8Wix9CkegICowlNs3O7OwGp1zSBdG9C/tepXaOd6dTDnoAc0qLrRuyl
 AGFIOaPMvqC7XEz1cnCa/hy+ymEJ7f2TJTcSnqQW/OBvo/gHTo0WDUGTb
 ttCX2OYLxAz+xd0gQ+rIlJu8S1nE4FT7SmfEXxlSormEPt2c6hhbOB/J7 Q==;
Date: Wed, 15 Dec 2021 18:07:37 +0100
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lap5cg0092dnk.se.axis.com
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob
 Herring <robh+dt@kernel.org>
Subject: [RESEND, PATCH v7 1/2] dt-bindings: sound: tlv320adc3xxx: New codec
 driver
Message-ID: <alpine.DEB.2.21.2112151806100.27889@lap5cg0092dnk.se.axis.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail03w.axis.com (10.20.40.9) To se-mail07w.axis.com
 (10.20.40.13)
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 alsa-devel <alsa-devel@alsa-project.org>
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


DT bindings for Texas Instruments TLV320ADC3001 and TLV320ADC3101
audio ADCs.

Signed-off-by: Ricard Wanderlof <ricardw@axis.com>
---
 .../bindings/sound/ti,tlv320adc3xxx.yaml      | 137 ++++++++++++++++++
 include/dt-bindings/sound/tlv320adc3xxx.h     |  28 ++++
 2 files changed, 165 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tlv320adc3xxx.yaml
 create mode 100644 include/dt-bindings/sound/tlv320adc3xxx.h

diff --git a/Documentation/devicetree/bindings/sound/ti,tlv320adc3xxx.yaml b/Documentation/devicetree/bindings/sound/ti,tlv320adc3xxx.yaml
new file mode 100644
index 000000000000..83936f594d1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,tlv320adc3xxx.yaml
@@ -0,0 +1,137 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,tlv320adc3xxx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TLV320ADC3001/TLV320ADC3101 Stereo ADC
+
+maintainers:
+  - Ricard Wanderlof <ricardw@axis.com>
+
+description: |
+  Texas Instruments TLV320ADC3001 and TLV320ADC3101 Stereo ADC
+  https://www.ti.com/product/TLV320ADC3001
+  https://www.ti.com/product/TLV320ADC3101
+
+properties:
+  compatible:
+    enum:
+      - ti,tlv320adc3001
+      - ti,tlv320adc3101
+
+  reg:
+    maxItems: 1
+    description: I2C address
+
+  '#sound-dai-cells':
+    const: 0
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-controller: true
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO pin used for codec reset (RESET pin)
+
+  clocks:
+    maxItems: 1
+    description: Master clock (MCLK)
+
+  ti,dmdin-gpio1:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 # ADC3XXX_GPIO_DISABLED       - I/O buffers powered down and not used
+      - 1 # ADC3XXX_GPIO_INPUT          - Various non-GPIO input functions
+      - 2 # ADC3XXX_GPIO_GPI            - General purpose input
+      - 3 # ADC3XXX_GPIO_GPO            - General purpose output
+      - 4 # ADC3XXX_GPIO_CLKOUT         - Clock source set in CLKOUT_MUX reg
+      - 5 # ADC3XXX_GPIO_INT1           - INT1 output
+      - 6 # ADC3XXX_GPIO_SECONDARY_BCLK - Codec interface secondary BCLK
+      - 7 # ADC3XXX_GPIO_SECONDARY_WCLK - Codec interface secondary WCLK
+    default: 0
+    description: |
+      Configuration for DMDIN/GPIO1 pin.
+
+      When ADC3XXX_GPIO_GPO is configured, this causes corresponding the
+      ALSA control "GPIOx Output" to appear, as a switch control.
+
+  ti,dmclk-gpio2:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 # ADC3XXX_GPIO_DISABLED       - I/O buffers powered down and not used
+      - 1 # ADC3XXX_GPIO_INPUT          - Various non-GPIO input functions
+      - 2 # ADC3XXX_GPIO_GPI            - General purpose input
+      - 3 # ADC3XXX_GPIO_GPO            - General purpose output
+      - 4 # ADC3XXX_GPIO_CLKOUT         - Clock source set in CLKOUT_MUX reg
+      - 5 # ADC3XXX_GPIO_INT1           - INT1 output
+      - 6 # ADC3XXX_GPIO_SECONDARY_BCLK - Codec interface secondary BCLK
+      - 7 # ADC3XXX_GPIO_SECONDARY_WCLK - Codec interface secondary WCLK
+    default: 0
+    description: |
+      Configuration for DMCLK/GPIO2 pin.
+
+      When ADC3XXX_GPIO_GPO is configured, this causes corresponding the
+      ALSA control "GPIOx Output" to appear, as a switch control.
+
+      Note that there is currently no support for reading the GPIO pins as
+      inputs.
+
+  ti,micbias1-vg:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 # ADC3XXX_MICBIAS_OFF		- Mic bias is powered down
+      - 1 # ADC3XXX_MICBIAS_2_0V	- Mic bias is set to 2.0V
+      - 2 # ADC3XXX_MICBIAS_2_5V	- Mic bias is set to 2.5V
+      - 3 # ADC3XXX_MICBIAS_AVDD	- Mic bias is same as AVDD supply
+    default: 0
+    description: |
+      Mic bias voltage output on MICBIAS1 pin
+
+  ti,micbias2-vg:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 # ADC3XXX_MICBIAS_OFF		- Mic bias is powered down
+      - 1 # ADC3XXX_MICBIAS_2_0V	- Mic bias is set to 2.0V
+      - 2 # ADC3XXX_MICBIAS_2_5V	- Mic bias is set to 2.5V
+      - 3 # ADC3XXX_MICBIAS_AVDD	- Mic bias is same as AVDD supply
+    default: 0
+    description: |
+      Mic bias voltage output on MICBIAS2 pin
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/sound/tlv320adc3xxx.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        tlv320adc3101: audio-codec@18 {
+            compatible = "ti,tlv320adc3101";
+            reg = <0x18>;
+            reset-gpios = <&gpio_pc 3 GPIO_ACTIVE_LOW>;
+            clocks = <&audio_mclk>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            ti,dmdin-gpio1 = <ADC3XXX_GPIO_GPO>;
+            ti,micbias1-vg = <ADC3XXX_MICBIAS_AVDD>;
+        };
+    };
+
+    audio_mclk: clock {
+        compatible = "fixed-clock";
+        #clock-cells = <0>;
+        clock-frequency = <24576000>;
+    };
+...
diff --git a/include/dt-bindings/sound/tlv320adc3xxx.h b/include/dt-bindings/sound/tlv320adc3xxx.h
new file mode 100644
index 000000000000..ec988439da20
--- /dev/null
+++ b/include/dt-bindings/sound/tlv320adc3xxx.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Devicetree bindings definitions for tlv320adc3xxx driver.
+ *
+ * Copyright (C) 2021 Axis Communications AB
+ */
+#ifndef __DT_TLV320ADC3XXX_H
+#define __DT_TLV320ADC3XXX_H
+
+#define ADC3XXX_GPIO_DISABLED		0 /* I/O buffers powered down */
+#define ADC3XXX_GPIO_INPUT		1 /* Various non-GPIO inputs */
+#define ADC3XXX_GPIO_GPI		2 /* General purpose input */
+#define ADC3XXX_GPIO_GPO		3 /* General purpose output */
+#define ADC3XXX_GPIO_CLKOUT		4 /* Source set in reg. CLKOUT_MUX */
+#define ADC3XXX_GPIO_INT1		5 /* INT1 output */
+#define ADC3XXX_GPIO_INT2		6 /* INT2 output */
+/* value 7 is reserved */
+#define ADC3XXX_GPIO_SECONDARY_BCLK	8 /* Codec interface secondary BCLK */
+#define ADC3XXX_GPIO_SECONDARY_WCLK	9 /* Codec interface secondary WCLK */
+#define ADC3XXX_GPIO_ADC_MOD_CLK	10 /* Clock output for digital mics */
+/* values 11-15 reserved */
+
+#define ADC3XXX_MICBIAS_OFF		0 /* Micbias pin powered off */
+#define ADC3XXX_MICBIAS_2_0V		1 /* Micbias pin set to 2.0V */
+#define ADC3XXX_MICBIAS_2_5V		2 /* Micbias pin set to 2.5V */
+#define ADC3XXX_MICBIAS_AVDD		3 /* Use AVDD voltage for micbias pin */
+
+#endif /* __DT_TLV320ADC3XXX_H */
-- 
2.20.1


-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
