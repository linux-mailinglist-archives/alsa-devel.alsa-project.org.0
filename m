Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 662AB734661
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Jun 2023 15:26:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FB4C83B;
	Sun, 18 Jun 2023 15:25:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FB4C83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687094789;
	bh=qzXV89glQXefLtuZ+0tTPXr0+AyhzID7X7wLMBTBTMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ka6a8mFBwjKPd7GkB0vHcmZsoT30qus+W4x/7aZr1vcVQ+ppGZqgD/V40iv19g49w
	 6SX8YrOp/Z8+Sg4NFT+LBwBVFabfblgzNuJAGhP5syiSIIPITLWZlwGxpM+f0aTpTb
	 gLfXX5nOtSp356MMO0fT/12hvKj3whA0Av4kST0E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65025F80551; Sun, 18 Jun 2023 15:24:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5329F80549;
	Sun, 18 Jun 2023 15:24:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 240AAF800E5; Sun, 18 Jun 2023 15:22:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from n169-112.mail.139.com (n169-112.mail.139.com [120.232.169.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84A46F80549
	for <alsa-devel@alsa-project.org>; Sun, 18 Jun 2023 15:22:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84A46F80549
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from  (unknown[183.194.159.148])
	by rmsmtp-lg-appmail-20-12023 (RichMail) with SMTP id 2ef7648f04ec62f-1a757;
	Sun, 18 Jun 2023 21:22:39 +0800 (CST)
X-RM-TRANSID: 2ef7648f04ec62f-1a757
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
	tiwai@suse.de,
	Shenghao Ding <13916275206@139.com>
Subject: [PATCH v6 4/4] ASoC: dt-bindings: Add tas2781 amplifier
Date: Sun, 18 Jun 2023 20:28:19 +0800
Message-Id: <20230618122819.23143-4-13916275206@139.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230618122819.23143-1-13916275206@139.com>
References: <20230618122819.23143-1-13916275206@139.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DYFOOK2G3ZIJKX4N4IN6F4P4X74QGE4F
X-Message-ID-Hash: DYFOOK2G3ZIJKX4N4IN6F4P4X74QGE4F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DYFOOK2G3ZIJKX4N4IN6F4P4X74QGE4F/>
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
Changes in v6:
 - correct the value of #sound-dai-cells
 - Add minItems for reg property
 - correct the description
 - remove ti,broadcast-addr
 - remove address-cells
 - remove size-cells
 - put compatible item first in properties
 - change the maxItems of reg from 4 to 8
 - remove white space around <>
 - correct the reg format to <0x38>, <0x3a> etc
 - remove '\t' in the file
 - correct a comment in the example
---
 .../devicetree/bindings/sound/ti,tas2781.yaml | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2781.yaml

diff --git a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
new file mode 100644
index 000000000000..8d60e4e236d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
@@ -0,0 +1,74 @@
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
+  loudspeakers. An integrated on-chip DSP supports Texas Instruments
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
+    maxItems: 8
+    minItems: 1
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
+   #include <dt-bindings/gpio/gpio.h>
+   i2c {
+     /* example with quad tas2781s, such as tablet or pad device */
+     #address-cells = <1>;
+     #size-cells = <0>;
+     quad_tas2781: tas2781@38 {
+       compatible = "ti,tas2781";
+       reg = <0x38>, /* Audio slot 0 */
+             <0x3a>, /* Audio slot 1 */
+             <0x39>, /* Audio slot 2 */
+             <0x3b>; /* Audio slot 3 */
+
+       #sound-dai-cells = <0>;
+       reset-gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+       interrupt-parent = <&gpio1>;
+       interrupts = <15>;
+     };
+   };
+...
-- 
2.34.1


