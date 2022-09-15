Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B68255B99D2
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 13:41:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E71D193E;
	Thu, 15 Sep 2022 13:40:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E71D193E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663242067;
	bh=+tiwKSI8wJPhwpcL8eMs7X0lCz075KLEzmhzNRFB6Uw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RalPEXqy5Q3/N6wDzEv9ia0elgV4gs/AQBzfZPD6XSZJEaA1Trz75FAByUDYjxUbv
	 tH5ZYR7Yg3AxCd1fMLkagz6pfXoC+16XwR0PDLVolWX49/QX3V3BVun7AfB36R23sc
	 v5GP2CCoeY1iW2acL5F9qyKiQ2PdtillpKCsrQ1U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FF74F80424;
	Thu, 15 Sep 2022 13:40:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68697F80482; Thu, 15 Sep 2022 13:40:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 285F4F8013D
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 13:39:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 285F4F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="Qry1vXnc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1663242002;
 x=1694778002; h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q7H5ypMruUoIfTG08+A5et2lb9798ejAy9cXwmsde80=;
 b=Qry1vXncCz/eEyoZ3NzxA+xmb4K9IbIlK5yCJ3ZQWxdryskdvBaBd7tM
 EdAOLo3cwVz0sBUEkhyUmMK0jrIsAlU0juo3yvw+UxCg2JrQQuM8DP21X
 8xug3AogMxJ5CCc7TrdkM9H6btfHuIR6A9aqra0z/eb0FXJJ1jQeNQGrd
 i0ZqrTHHqB6wZfDILzvgylaYMcGzrnA9VSbjVzU+uwstZmEr3+Q9a8BBN
 bm3IlDIYMnPcVUDT7QU9LaDbDFNbBySCxYmgBhPUVD9yt1rsGjM1EcPF5
 6lrDLKG14TKntmiZlZXzbbFJn9ULXAaJJAj6xrH6g5wYwyJZn2nOoKFCO g==;
From: Astrid Rost <astrid.rost@axis.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Dylan Reid
 <dgreid@chromium.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: sound: ts3a227e: convert to yaml
Date: Thu, 15 Sep 2022 13:39:53 +0200
Message-ID: <20220915113955.22521-2-astrid.rost@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220915113955.22521-1-astrid.rost@axis.com>
References: <20220915113955.22521-1-astrid.rost@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Astrid Rost <astrid.rost@axis.com>, linux-kernel@vger.kernel.org,
 kernel@axis.c, Astrid Rost <astridr@axis.com>
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

Convert from ts3a227e.txt to yaml.

Signed-off-by: Astrid Rost <astrid.rost@axis.com>
---
 .../devicetree/bindings/sound/ts3a227e.txt    | 30 --------
 .../devicetree/bindings/sound/ts3a227e.yaml   | 69 +++++++++++++++++++
 2 files changed, 69 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/ts3a227e.txt
 create mode 100644 Documentation/devicetree/bindings/sound/ts3a227e.yaml

diff --git a/Documentation/devicetree/bindings/sound/ts3a227e.txt b/Documentation/devicetree/bindings/sound/ts3a227e.txt
deleted file mode 100644
index 21ab45bc7e8f..000000000000
--- a/Documentation/devicetree/bindings/sound/ts3a227e.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-Texas Instruments TS3A227E
-Autonomous Audio Accessory Detection and Configuration Switch
-
-The TS3A227E detect headsets of 3-ring and 4-ring standards and
-switches automatically to route the microphone correctly.  It also
-handles key press detection in accordance with the Android audio
-headset specification v1.0.
-
-Required properties:
-
- - compatible:		Should contain "ti,ts3a227e".
- - reg:			The i2c address. Should contain <0x3b>.
- - interrupts:		Interrupt number for /INT pin from the 227e
-
-Optional properies:
- - ti,micbias:   Intended MICBIAS voltage (datasheet section 9.6.7).
-      Select 0/1/2/3/4/5/6/7 to specify MICBIAS voltage
-      2.1V/2.2V/2.3V/2.4V/2.5V/2.6V/2.7V/2.8V
-      Default value is "1" (2.2V).
-
-Examples:
-
-	i2c {
-		ts3a227e@3b {
-			compatible = "ti,ts3a227e";
-			reg = <0x3b>;
-			interrupt-parent = <&gpio>;
-			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/sound/ts3a227e.yaml b/Documentation/devicetree/bindings/sound/ts3a227e.yaml
new file mode 100644
index 000000000000..3512b1f1e32b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ts3a227e.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/sound/ts3a227e.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Texas Instruments TS3A227E
+  Autonomous Audio Accessory Detection and Configuration Switch
+
+maintainers:
+  - Dylan Reid <dgreid@chromium.org>
+
+description: |
+  The TS3A227E detect headsets of 3-ring and 4-ring standards and
+  switches automatically to route the microphone correctly. It also
+  handles key press detection in accordance with the Android audio
+  headset specification v1.0.
+
+properties:
+  compatible:
+    enum:
+      - ti,ts3a227e
+
+  reg:
+    description: I2C address of the device.
+    const: 0x3b
+
+  interrupts:
+    maxItems: 1
+    description: |
+      Interrupt number for /INT pin from the ts3a227e.
+
+  ti,micbias:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Intended MICBIAS voltage (datasheet section 9.6.7).
+    enum:
+      - 0 # 2.1 V
+      - 1 # 2.2 V
+      - 2 # 2.3 V
+      - 3 # 2.4 V
+      - 4 # 2.5 V
+      - 5 # 2.6 V
+      - 6 # 2.7 V
+      - 7 # 2.8 V
+    default: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        codec: ts3a227e@3b {
+            compatible = "ti,ts3a227e";
+            reg = <0x3b>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+        };
+    };
+
+...
-- 
2.20.1

