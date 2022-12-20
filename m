Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E68A1653CAD
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Dec 2022 08:53:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A408345F;
	Thu, 22 Dec 2022 08:52:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A408345F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671695612;
	bh=pzHp531Jl6hVO7G7iriaLv1uYApb7Bu/6Y5MWkklGgs=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=kQ8bTlUH+9AX95IhYbgdf8HrymvyWsjjzS/7OSjrtCSoCFjprnvuOU7GCP4r4fEaJ
	 sShhrKLNZjnBCAqyxmYZumFivZkaNzZOU36Aq2yxkHWqjlTOgfJQpGOWENmhvniMYP
	 z8rAMRMHBpj9rKgoELft+yaHcN5z9otTLJRz7FwM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13697F8028D;
	Thu, 22 Dec 2022 08:52:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5525AF8025E; Tue, 20 Dec 2022 15:41:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=FREEMAIL_FROM,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from n169-112.mail.139.com (n169-112.mail.139.com [120.232.169.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7133FF80027
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 15:41:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7133FF80027
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[61.152.193.32])
 by rmsmtp-lg-appmail-25-12028 (RichMail) with SMTP id 2efc63a1c993073-87152;
 Tue, 20 Dec 2022 22:41:24 +0800 (CST)
X-RM-TRANSID: 2efc63a1c993073-87152
From: Kevin Lu <luminlong@139.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH] New yaml file: tas2781
Date: Tue, 20 Dec 2022 22:41:14 +0800
Message-Id: <20221220144114.2137-1-luminlong@139.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 22 Dec 2022 08:52:08 +0100
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

Add DTS discription for tas2781 driver code

Signed-off-by: Kevin Lu <luminlong@139.com>
---
 .../devicetree/bindings/sound/tas2781.yaml    | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/tas2781.yaml

diff --git a/Documentation/devicetree/bindings/sound/tas2781.yaml b/Documentation/devicetree/bindings/sound/tas2781.yaml
new file mode 100644
index 000000000..96fa45bf6
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tas2781.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2022 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/sound/tas2781.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
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
+      - ti,audev
+    description: |
+        ti,audev will disable the irq of tas2781.
+  reg:
+    maxItems: 1
+    description: |
+       I2C address of the device can be between 0x38 to 0x40.
+
+  reset-gpioN:
+    maxItems: 4
+    description: GPIO used to reset the device.
+
+  ti,topleft-channel:
+    maxItems: 1
+    description: I2C Address for each specific device.
+
+  ti,topright-channel:
+    maxItems: 1
+
+  ti,bottomleft-channel:
+    maxItems: 1
+
+  ti,bottomright-channel:
+    maxItems: 1
+
+  ti,global-address:
+    maxItems: 1
+    description: This item is not mandatory. if the device support gloabel mode, this item should be active.
+
+  ti,irq-gpio:
+    maxItems: 1
+    description: GPIO used to interrupt the device.
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
+     codec: codec@38 {
+       compatible = "ti,tas2781";
+       reg = <0x38>;
+       #sound-dai-cells = <1>;
+       ti,topleft-channel = <0x38>;
+       ti,topright-channel = <0x39>;
+       ti,bottomright-channel = <0x3a>;
+       ti,bottomright-channel = <0x3b>;
+       ti,global-address = <0x40>;
+       ti,reset-gpio0 = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+       ti,reset-gpio1 = <&gpio1 11 GPIO_ACTIVE_HIGH>;
+       ti,reset-gpio2 = <&gpio1 12 GPIO_ACTIVE_HIGH>;
+       ti,reset-gpio3 = <&gpio1 13 GPIO_ACTIVE_HIGH>;
+       ti,irq-gpio = <&gpio1 15 0>;
+     };
+   };
+...
-- 
2.17.1


