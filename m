Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5895E74FE61
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 06:41:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E112B207;
	Wed, 12 Jul 2023 06:41:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E112B207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689136912;
	bh=0nnusvWpyWLw0heTTTEnUFsDUeTNTFosVkb6gytmWT0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WnnUT9i8m/4/gAbEqiWMs23qbh3Uv/9yoEmdtxoJJ1gL2NI1dHvgmTkyELKhTETyE
	 URkNVJeUR330KdHUFJX/D4it9teGHJ77ysIDRBaNF9su9C44Z9hXzyFqvGqatXxvwJ
	 m63nkdvGVUYXRN4tlCcRWvp+am0tQtRY6ZOuYTvw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10DE5F8047D; Wed, 12 Jul 2023 06:41:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7ED14F80236;
	Wed, 12 Jul 2023 06:41:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C210F80249; Wed, 12 Jul 2023 06:40:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from n169-114.mail.139.com (n169-114.mail.139.com [120.232.169.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C802DF800D2
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 06:40:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C802DF800D2
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from u22.. (unknown[14.26.80.93])
	by rmsmtp-lg-appmail-43-12057 (RichMail) with SMTP id 2f1964ae2ea70d1-e0300;
	Wed, 12 Jul 2023 12:40:11 +0800 (CST)
X-RM-TRANSID: 2f1964ae2ea70d1-e0300
From: Kevin Lu <luminlong@139.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	tiwai@suse.com
Cc: kevin-lu@ti.com,
	shenghao-ding@ti.com,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kevin Lu <luminlong@139.com>
Subject: [PATCH v1] ASoC: dt-bindings: Add tas2505 audio amplifier
Date: Wed, 12 Jul 2023 12:40:06 +0800
Message-Id: <20230712044006.48456-1-luminlong@139.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: B4VPH3JJWM73NMRNQGXFNVCZXXB6PFF4
X-Message-ID-Hash: B4VPH3JJWM73NMRNQGXFNVCZXXB6PFF4
X-MailFrom: luminlong@139.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B4VPH3JJWM73NMRNQGXFNVCZXXB6PFF4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Create tas2505.yaml for tas2505.

Signed-off-by: Kevin Lu <luminlong@139.com>
---
 .../devicetree/bindings/sound/tas2505.yaml    | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/tas2505.yaml

diff --git a/Documentation/devicetree/bindings/sound/tas2505.yaml b/Documentation/devicetree/bindings/sound/tas2505.yaml
new file mode 100644
index 0000000..6cc3fe4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tas2505.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2019 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/sound/tas2505.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Texas Instruments TAS2505 Mono Audio Amplifier
+
+maintainers:
+  - Kevin Lu <kevin-lu@ti.com>
+
+description: |
+  The TAS2505 is a mono Class-D speaker amp that supports both Digital
+  and Analog inputs. The device is ideal for automotive instrument cluster,
+  emergency call (eCall), and telematics applications. Direct I2S input
+  removes the need for an external DAC in the audio signal path.
+  An on-chip PLL provides the high speed clock needed by the DSP.
+  The volume level is register controlled.
+
+  Specifications about the audio amplifier can be found at:
+    https://www.ti.com/lit/gpn/tas2505
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ti,tas2505
+
+  reg:
+    maxItems: 1
+    description: |
+       I2C address of the device can be set to 0x18.
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO used to reset the device.
+
+  clock-source:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Sets TDM clock sourse.
+    enum:
+      - 0 # Select MLCK
+      - 1 # Select BLCK
+
+  '#sound-dai-cells':
+    # The codec has a single DAI, the #sound-dai-cells=<1>; case is left in for backward
+    # compatibility but is deprecated.
+    enum: [0, 1]
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+   #include <dt-bindings/gpio/gpio.h>
+   i2c {
+     #address-cells = <1>;
+     #size-cells = <0>;
+     codec: codec@18 {
+       compatible = "ti,tas2505";
+       reg = <0x18>;
+       #sound-dai-cells = <0>;
+       reset-gpios = <&gpio4 21 GPIO_ACTIVE_LOW>;
+       clock-source = <0>;
+     };
+   };
-- 
2.34.1


