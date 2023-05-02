Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A656F3D0A
	for <lists+alsa-devel@lfdr.de>; Tue,  2 May 2023 07:38:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA31818D3;
	Tue,  2 May 2023 07:37:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA31818D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683005896;
	bh=KbPjybPKfNR8cHbNE1yXeo8gNKseyAFYuMaiZe4n/xI=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=quxP26VkkTdsUpEJUBixzRgGcBfXsN7OiIsKc9Nr0FmfigKewDbhWlTLJe4iBuYQ1
	 jUpkWHDAzvNBaewo7dnuOqCxC11St+wCR8rIScs5Jyuds3vEqQ/PeY4oETzH/jKagE
	 Ri7r5hKR8rVdiRcuv7nmXVcFu34Q1lyJI0JUNgZ4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D704EF8032B;
	Tue,  2 May 2023 07:37:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B48CF80520; Tue,  2 May 2023 07:33:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from n169-114.mail.139.com (n169-114.mail.139.com [120.232.169.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD18EF80137
	for <alsa-devel@alsa-project.org>; Tue,  2 May 2023 07:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD18EF80137
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[183.194.159.16])
	by rmsmtp-lg-appmail-38-12052 (RichMail) with SMTP id 2f146450a03fece-e31a3;
	Tue, 02 May 2023 13:31:45 +0800 (CST)
X-RM-TRANSID: 2f146450a03fece-e31a3
From: Shenghao Ding <13916275206@139.com>
To: devicetree@vger.kernel.org
Subject: [PATCH v1 2/5] ASoC: dt-bindings: Add tas2781 amplifier
Date: Tue,  2 May 2023 13:31:35 +0800
Message-Id: <20230502053135.27019-1-13916275206@139.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OOGB7OOIIDNYWXI4DUPII6ITKZ5B2MDB
X-Message-ID-Hash: OOGB7OOIIDNYWXI4DUPII6ITKZ5B2MDB
X-MailFrom: 13916275206@139.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: krzysztof.kozlowski+dt@linaro.org, broonie@kernel.org,
 lgirdwood@gmail.com, kevin-lu@ti.com, shenghao-ding@ti.com,
 alsa-devel@alsa-project.org, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, x1077012@ti.com, peeyush@ti.com, navada@ti.com,
 gentuser@gmail.com, Shenghao Ding <13916275206@139.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OOGB7OOIIDNYWXI4DUPII6ITKZ5B2MDB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Create tas2781.yaml for tas2781 driver.

Signed-off-by: Shenghao Ding <13916275206@139.com>

---
Changes in v1:
 - Submit together with tas2781 codec driver code
 Changes to be committed:
	new file:   Documentation/devicetree/bindings/sound/ti,tas2781.yaml
---
 .../devicetree/bindings/sound/ti,tas2781.yaml | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2781.yaml

diff --git a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
new file mode 100644
index 000000000000..028151c388bf
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2022 - 2023 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TAS2781 SmartAMP
+
+maintainers:
+  - Shenghao Ding <shenghao-ding@ti.com>
+
+description:
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
+    description: I2C address of the primary device.
+    items:
+      minimum: 0x38
+      maximum: 0x40
+
+  reset-gpios:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  ti,audio-slots:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 4
+    description:
+      I2C address of the device for different audio slots,
+      useless in mono case.
+
+  ti,broadcast-addr:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Generic I2C address for all the tas2781 devices in
+      purpose of I2C broadcast during the multi-device
+      writes, useless in mono case.
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
+     /* example with quad support, such as tablet or pad device */
+     #address-cells = <1>;
+     #size-cells = <0>;
+     quad: codec@38 {
+       compatible = "ti,tas2781";
+       reg = <0x38>;
+       #sound-dai-cells = <1>;
+       reset-gpios = < &gpio1 10 GPIO_ACTIVE_HIGH >;
+       interrupt-parent = <&gpio1>;
+       interrupts = <15>;
+       ti,audio-slots = < 0x38 /* topleft-channel */
+                          0x39 /* topright-channel */
+                          0x3a /* bottomleft-channel */
+                          0x3b /* bottomright-channel */
+                        >;
+       ti,broadcast-addr = <0x40>;
+     };
+   };
+...
-- 
2.34.1


