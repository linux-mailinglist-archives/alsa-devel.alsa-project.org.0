Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8CC5BF8E8
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 10:20:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7B3F85D;
	Wed, 21 Sep 2022 10:19:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7B3F85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663748412;
	bh=g8BvxP5XY+ERiIwo6cS/Tvlfw/qayFPLZvltSy+tULU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fNnSn+ff8vyX6wJD9/fQANCZtgP4NMr69PqhGfrZuRfereSSQOtQShWCDnVuDNXnF
	 dFjKLslTsnYSArDS6jXNsAqR/nUzna33mpW8vUCUdltS3gQjfmmwqvWwPJUELlfmBd
	 YkoqgVl1t1AxnWQJR29LT8FHQoqLQ7iNuBDMd528=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A998F80539;
	Wed, 21 Sep 2022 10:18:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85751F8047C; Wed, 21 Sep 2022 10:18:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0A97F80107
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 10:18:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0A97F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="VhvAd0iQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1663748319;
 x=1695284319; h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w8KzUewuszzBRNR3DKM4RdYTDxQmFGm6YO23DI5b+0I=;
 b=VhvAd0iQ0k9meYOd0nOV2nS4IsRzKvqGJEDfN+FrtAJy+hsU7wS1l4FH
 vV2aONp+hkhhF9VEJMcRupyD4RfL47VepVNY+O3rPS61wpQaIzlXoh2hF
 7eVGy2ojneOt0AR/SQmz52yiC5Oq2gAoXd0dloQSLKYQE705b/44H9YTa
 QinJ3NN2/2LJOq4T4GvIJkXrzW5zo4bVFQcPugnwvo4F72xizOh0SoJbU
 LvOHsgNvKyD/+5GrvHs13vnoVeBq38rh4iGPVYsZo7/HzYHats3kklDhK
 nd03bbwdG72oTpI2FnjdFaB9AvcCTXlCYYjUHPlMVEmPrvHQ4p0jw5v+V Q==;
From: Astrid Rost <astrid.rost@axis.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Dylan Reid <dgreid@chromium.org>
Subject: [PATCH v4 1/3] dt-bindings: sound: ti,ts3a227e: convert to yaml
Date: Wed, 21 Sep 2022 10:18:32 +0200
Message-ID: <20220921081834.22009-2-astrid.rost@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220921081834.22009-1-astrid.rost@axis.com>
References: <20220921081834.22009-1-astrid.rost@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Astrid Rost <astrid.rost@axis.com>, linux-kernel@vger.kernel.org,
 kernel@axis.com, Astrid Rost <astridr@axis.com>
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
 .../bindings/sound/ti,ts3a227e.yaml           | 65 +++++++++++++++++++
 .../devicetree/bindings/sound/ts3a227e.txt    | 30 ---------
 2 files changed, 65 insertions(+), 30 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/ts3a227e.txt

diff --git a/Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml b/Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml
new file mode 100644
index 000000000000..327d204cf957
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,ts3a227e.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
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
+    const: 0x3b
+
+  interrupts:
+    maxItems: 1
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
+    default: 1
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
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        codec: audio-controller@3b {
+            compatible = "ti,ts3a227e";
+            reg = <0x3b>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+        };
+    };
+
+...
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
-- 
2.20.1

