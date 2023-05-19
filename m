Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F1770914E
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 10:04:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F2B282B;
	Fri, 19 May 2023 10:04:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F2B282B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684483491;
	bh=jXyhiwcxFhyx5093L0r5DditPlNrCrRP5vBZMkAjmG0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CZTqdB1cPPvLtS5uk0AsffyWN9I4BMKn57BxVPdICzEMSSYCoHdr9bF4xjDNqTuHt
	 EOc2AccEbycmZTL/1XIajkVpmRigG5BSXMgPwrr/F2TIGg1DVeSDlK+tqnzsWcmZ/S
	 cjBJo1O1GokVd481P5VRmyatuKF/KJ8zvajvPJvI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEE7CF805B2; Fri, 19 May 2023 10:03:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CDA32F805AB;
	Fri, 19 May 2023 10:03:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04B50F80549; Fri, 19 May 2023 10:03:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from n169-113.mail.139.com (n169-113.mail.139.com [120.232.169.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E6C56F802E8
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 10:02:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6C56F802E8
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[39.144.39.119])
	by rmsmtp-lg-appmail-31-12045 (RichMail) with SMTP id 2f0d64672d2a4a3-40513;
	Fri, 19 May 2023 16:02:53 +0800 (CST)
X-RM-TRANSID: 2f0d64672d2a4a3-40513
From: Shenghao Ding <13916275206@139.com>
To: broonie@kernel.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	pierre-louis.bossart@linux.intel.com
Cc: kevin-lu@ti.com,
	shenghao-ding@ti.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	x1077012@ti.com,
	peeyush@ti.com,
	navada@ti.com,
	gentuser@gmail.com,
	Ryan_Chu@wistron.com,
	Sam_Wu@wistron.com,
	Shenghao Ding <13916275206@139.com>
Subject: [PATCH v3 5/5] ASoC: dt-bindings: Add tas2781 amplifier
Date: Fri, 19 May 2023 16:02:45 +0800
Message-Id: <20230519080245.20243-1-13916275206@139.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VBQVZSGBWYET27OZ6ALWDVAUZRALQ5IE
X-Message-ID-Hash: VBQVZSGBWYET27OZ6ALWDVAUZRALQ5IE
X-MailFrom: 13916275206@139.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VBQVZSGBWYET27OZ6ALWDVAUZRALQ5IE/>
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
Changes in v3:
 - Add allOf with ref to saound-dai-common
 - remove audio-slots, put all the i2c address into <reg>
 - Add more description on broadcast-addr item
 Changes to be committed:
	new file:   Documentation/devicetree/bindings/sound/ti,tas2781.yaml
---
 .../devicetree/bindings/sound/ti,tas2781.yaml | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2781.yaml

diff --git a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
new file mode 100644
index 000000000000..c4928e88f1c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
@@ -0,0 +1,83 @@
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
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ti,tas2781
+
+  reg:
+    description:
+      I2C address, in multiple tas2781s case, all the i2c address
+      aggreate as one Audio Device to support multiple audio slots.
+    maxItems: 4
+    items:
+      minimum: 0x38
+      maximum: 0x3f
+
+  reset-gpios:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  ti,broadcast-addr:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Generic I2C address for all the tas2781 devices in
+      purpose of I2C broadcast during the multi-device
+      writes, useless in mono case or remove this item to
+      disable broadcast mode.
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
+       reg = < 0x38 /* Audio slot 0 */
+		0x3a /* Audio slot 1 */
+		0x39 /* Audio slot 2 */
+		0x3b /* Audio slot 3 */
+		>;
+       #sound-dai-cells = <1>;
+       reset-gpios = < &gpio1 10 GPIO_ACTIVE_HIGH >;
+       interrupt-parent = <&gpio1>;
+       interrupts = <15>;
+       /* Generic I2C addr among all the tas2781s for i2c data broadcast */
+       ti,broadcast-addr = <0x40>;
+     };
+   };
+...
-- 
2.34.1


