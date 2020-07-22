Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29663229EF9
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 20:09:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 852FC1661;
	Wed, 22 Jul 2020 20:08:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 852FC1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595441381;
	bh=sgmFJO9Okfb3oqB2Fvnmn89/slOTXjmBQE+hbYhj1aU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ddw9qT3qTAiVVyLCDO+EawBlwrkq2JWW+K2SuskGZoCOp8q11VyUOQlSrmOODOwal
	 w/uFmkAl1KX40ApAXeI1tQFtRjaungFOvGLl+2d2B169rBLAZ27PiqyJo5uRS0pCkw
	 OAWC8WWfIZyzg5nB/uk32px6+7zrVM6bqpPQ/p2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA2C2F80150;
	Wed, 22 Jul 2020 20:08:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2028F80150; Wed, 22 Jul 2020 20:07:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from www1102.sakura.ne.jp (www1102.sakura.ne.jp [219.94.129.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EA49F80087
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 20:07:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EA49F80087
Received: from fsav402.sakura.ne.jp (fsav402.sakura.ne.jp [133.242.250.101])
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 06MI7ePS038841;
 Thu, 23 Jul 2020 03:07:40 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
Received: from www1102.sakura.ne.jp (219.94.129.142)
 by fsav402.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav402.sakura.ne.jp);
 Thu, 23 Jul 2020 03:07:40 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav402.sakura.ne.jp)
Received: from localhost.localdomain (121.252.232.153.ap.dti.ne.jp
 [153.232.252.121]) (authenticated bits=0)
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 06MI7bJZ038819
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Thu, 23 Jul 2020 03:07:40 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
From: Katsuhiro Suzuki <katsuhiro@katsuster.net>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] dt-bindings: sound: convert Everest ES8316 binding to yaml
Date: Thu, 23 Jul 2020 03:07:28 +0900
Message-Id: <20200722180728.993812-1-katsuhiro@katsuster.net>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Katsuhiro Suzuki <katsuhiro@katsuster.net>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

This patch converts Everest Semiconductor ES8316 low power audio
CODEC binding to DT schema.

Signed-off-by: Katsuhiro Suzuki <katsuhiro@katsuster.net>
---
 .../bindings/sound/everest,es8316.txt         | 23 ---------
 .../bindings/sound/everest,es8316.yaml        | 49 +++++++++++++++++++
 2 files changed, 49 insertions(+), 23 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/everest,es8316.txt
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es8316.yaml

diff --git a/Documentation/devicetree/bindings/sound/everest,es8316.txt b/Documentation/devicetree/bindings/sound/everest,es8316.txt
deleted file mode 100644
index 1bf03c5f2af4..000000000000
--- a/Documentation/devicetree/bindings/sound/everest,es8316.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-Everest ES8316 audio CODEC
-
-This device supports both I2C and SPI.
-
-Required properties:
-
-  - compatible  : should be "everest,es8316"
-  - reg : the I2C address of the device for I2C
-
-Optional properties:
-
-  - clocks : a list of phandle, should contain entries for clock-names
-  - clock-names : should include as follows:
-         "mclk" : master clock (MCLK) of the device
-
-Example:
-
-es8316: codec@11 {
-	compatible = "everest,es8316";
-	reg = <0x11>;
-	clocks = <&clks 10>;
-	clock-names = "mclk";
-};
diff --git a/Documentation/devicetree/bindings/sound/everest,es8316.yaml b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
new file mode 100644
index 000000000000..b713404dac4f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/everest,es8316.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Everest ES8316 audio CODEC
+
+maintainers:
+  - Mark Brown <broonie@kernel.org>
+
+properties:
+  compatible:
+    const: everest,es8316
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: clock for master clock (MCLK)
+
+  clock-names:
+    items:
+      - const: mclk
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c0 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      es8316: codec@11 {
+        compatible = "everest,es8316";
+        reg = <0x11>;
+        clocks = <&clks 10>;
+        clock-names = "mclk";
+        #sound-dai-cells = <0>;
+      };
+    };
-- 
2.27.0

