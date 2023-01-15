Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F09166B0EB
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Jan 2023 13:17:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BE689F3A;
	Sun, 15 Jan 2023 13:16:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BE689F3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673785067;
	bh=Rr4wFE8+o2Dr30WQsw7WljTzTPYoi/KgCKkLDQSLcWY=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=PWtvkpMtKYHWUQlmZ+cxC5xyCRaz2T9/E5y56dW8oEqUiFZeW/UYW/97jDSEjn3bX
	 5yi4tVaAhu6XM9Jl+GAvoxUJKc1ovUPRRALW6YLybdu98G5T0DOnUehZG5R/c6Dayo
	 cqeNaVWkILR/Y7x/AY0UEUax2A5ceT/25jVfaVw0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97AF4F801EB;
	Sun, 15 Jan 2023 13:16:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C2D0F804DE; Sun, 15 Jan 2023 13:16:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=FREEMAIL_FROM,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from n169-111.mail.139.com (n169-111.mail.139.com [120.232.169.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CA76F804A9
 for <alsa-devel@alsa-project.org>; Sun, 15 Jan 2023 13:16:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CA76F804A9
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000005
Received: from lml-VirtualBox.. (unknown[183.14.134.10])
 by rmsmtp-lg-appmail-13-12002 (RichMail) with SMTP id 2ee263c3ee9ef57-7c0a4;
 Sun, 15 Jan 2023 20:16:31 +0800 (CST)
X-RM-TRANSID: 2ee263c3ee9ef57-7c0a4
From: Kevin Lu <luminlong@139.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v1] Asoc: dt_bindings: Add tas2781 yaml
Date: Sun, 15 Jan 2023 20:16:29 +0800
Message-Id: <20230115121629.2420-1-luminlong@139.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 Kevin Lu <luminlong@139.com>, linux-kernel@vger.kernel.org, navada@ti.com,
 kevin-lu@ti.com, shenghao-ding@ti.com, peeyush@ti.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Complete the DTS for tas2781

Signed-off-by: Kevin Lu <luminlong@139.com>
---
 .../devicetree/bindings/sound/ti,tas2781.yaml | 122 ++++++++++++++++++
 1 file changed, 122 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2781.yaml

diff --git a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
new file mode 100644
index 0000000..7d73f46
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2022 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TAS2781 Smart PA
+
+maintainers:
+  - Shenghao Ding <shenghao-ding@ti.com>
+  - Kevin Lu <kevin-lu@ti.com>
+
+description: |
+  The TAS2781 is a mono, digital input Class-D audio amplifier
+  optimized for efficiently driving high peak power into small
+  loudspeakers. Integrated an on-chip DSP supports Texas Instruments
+  Smart Amp speaker protection algorithm. The integrated speaker
+  voltage and current sense provides for real time
+  monitoring of loudspeaker behavior.
+
+properties:
+  compatible:
+    enum:
+      - ti,tas2781
+
+  reg:
+    maxItems: 1
+    description: |
+      I2C address of the device can be in range from 0x38 to 0x40.
+
+  ti,audio-slots:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 4
+    description: |
+      This item is used to store the i2c address of the device
+      for deifferent audio slots. It is not required for Mono case.
+
+  ti,global-addr:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      This item is used to store the generic i2c address of
+      all the tas2781 devices for I2C broadcast during the multi-device
+      writes, useless in mono case.
+
+  ti,reset-gpios:
+    minItems: 1
+    maxItems: 4
+    description: GPIO specifier for the reset pin.
+
+  ti,irq-gpio:
+    maxItems: 1
+    description: GPIO used to interrupts the device.
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
+   i2c {
+     /* example with mono support */
+     #address-cells = <1>;
+     #size-cells = <0>;
+     mono: codec@38 {
+       compatible = "ti,tas2781";
+       reg = <0x38>;
+       #sound-dai-cells = <1>;
+       ti,reset-gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+       ti,irq-gpio = <&gpio1 15 0>;
+     };
+   };
+  - |
+   #include <dt-bindings/gpio/gpio.h>
+   i2c {
+     /* Stereo without irq-gpio and global-addr */
+     #address-cells = <1>;
+     #size-cells = <0>;
+     stereo: codec@38 {
+       compatible = "ti,tas2781";
+       reg = <0x38>;
+       #sound-dai-cells = <1>;
+       ti,audio-slots = < 0x38 /* left-channel */
+                          0x39 /* right-channel */
+                        >;
+       ti,reset-gpios = < &gpio1 10 GPIO_ACTIVE_HIGH
+                          &gpio1 11 GPIO_ACTIVE_HIGH
+                        >;
+     };
+   };
+  - |
+   #include <dt-bindings/gpio/gpio.h>
+   i2c {
+     /* example with quad support, such as tablet or pad device */
+     #address-cells = <1>;
+     #size-cells = <0>;
+     quad: codec@38 {
+       compatible = "ti,tas2781";
+       reg = <0x38>;
+       #sound-dai-cells = <1>;
+       ti,audio-slots = < 0x38 /* topleft-channel */
+                          0x39 /* topright-channel */
+                          0x3a /* bottomleft-channel */
+                          0x3b /* bottomright-channel */
+                        >;
+       ti,global-addr = <0x40>;
+       ti,reset-gpios = < &gpio1 10 GPIO_ACTIVE_HIGH
+                          &gpio1 11 GPIO_ACTIVE_HIGH
+                          &gpio1 12 GPIO_ACTIVE_HIGH
+                          &gpio1 13 GPIO_ACTIVE_HIGH
+                        >;
+       ti,irq-gpio = <&gpio1 15 0>;
+     };
+   };
+...
-- 
2.34.1


