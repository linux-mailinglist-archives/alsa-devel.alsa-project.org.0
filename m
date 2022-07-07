Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4494A56A223
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 14:36:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E91E91693;
	Thu,  7 Jul 2022 14:35:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E91E91693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657197402;
	bh=YGK/T2LoyRY6N+v/ayv7e9EiQ/pWyRZObOgpahfmH+c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sO5Ymqkx7VnIZpoEtqfB7poPKjeF3FwPT+Fv1xYBJkY77eJwWthkz33BPEpc9Jo1y
	 8wM7YqrZ8csWmO6CP9WBlVUQ0yGUG2XvCuATxf/VB0R2UE7bczA3UuS8DxwtsZomdx
	 TwpiFFRS/ZSFUgkKrKDH+eH4cOoSFjV5Fs2v8qhE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5066F80539;
	Thu,  7 Jul 2022 14:34:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04595F80538; Thu,  7 Jul 2022 14:34:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from n169-114.mail.139.com (n169-114.mail.139.com [120.232.169.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E233AF800DF
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 14:34:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E233AF800DF
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from LAPTOP-39QA2GAC.localdomain (unknown[192.163.20.102])
 by rmsmtp-lg-appmail-38-12052 (RichMail) with SMTP id 2f1462c6d2a972e-19759;
 Thu, 07 Jul 2022 20:34:04 +0800 (CST)
X-RM-TRANSID: 2f1462c6d2a972e-19759
From: Raphael-Xu <13691752556@139.com>
To: broonie@kernel.org
Subject: [PATCH v4 2/2] add tas2780
Date: Thu,  7 Jul 2022 20:33:43 +0800
Message-Id: <20220707123343.2403-2-13691752556@139.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220707123343.2403-1-13691752556@139.com>
References: <20220707123343.2403-1-13691752556@139.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, navada@ti.com, asyrus@ti.com,
 raphael-xu@ti.com, shenghao-ding@ti.com, Raphael-Xu <13691752556@139.com>
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

add tas2780.yaml

Signed-off-by: Raphael-Xu <13691752556@139.com>
---
 .../devicetree/bindings/sound/tas2780.yaml    | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/tas2780.yaml

diff --git a/Documentation/devicetree/bindings/sound/tas2780.yaml b/Documentation/devicetree/bindings/sound/tas2780.yaml
new file mode 100644
index 000000000000..5a0de0995066
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tas2780.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2020-2022 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/sound/tas2780.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Texas Instruments TAS2780 Smart PA
+
+maintainers:
+  - Raphael Xu <raphael-xu@ti.com>
+
+description: |
+  The TAS2780 is a mono, digital input Class-D audio amplifier optimized for
+  efficiently driving high peak power into small loudspeakers.
+  Integrated speaker voltage and current sense provides for
+  real time monitoring of loudspeaker behavior.
+
+properties:
+  compatible:
+    enum:
+      - ti,tas2780
+
+  reg:
+    maxItems: 1
+    description: |
+       I2C address of the device can be between 0x38 to 0x45.
+
+  reset-gpios:
+    maxItems: 1
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
+       compatible = "ti,tas2780";
+       reg = <0x38>;
+       #sound-dai-cells = <1>;
+       interrupt-parent = <&gpio1>;
+       interrupts = <14>;
+       reset-gpios = <&gpio1 15 0>;
+       shutdown-gpios = <&gpio1 15 0>;
+       ti,imon-slot-no = <0>;
+       ti,vmon-slot-no = <2>;
+     };
+   };
+
+...
-- 
2.35.1


