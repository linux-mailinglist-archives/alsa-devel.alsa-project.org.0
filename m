Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE0E129C10
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Dec 2019 01:29:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7B9E169F;
	Tue, 24 Dec 2019 01:28:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7B9E169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577147344;
	bh=4eHHu9VOipG5/ts3Dhb50UbIU+FRnPSo3Hk+n2WKv54=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k1rkQ/0AdkXGjMZkyjpYtAFXcgEYrLc1jJsqEPZYF0QGf0N4cjPNT69zrPT+lrBMD
	 1MdPP9gmYneAHAHicapyg84SiozL0LzwY/5m0mSZJ+7731TMvU45gUX+eLni2huRSn
	 0VNdoLL1Tn4GVSvGBE/yUQ5h0KgIicf4R94dPcRQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8302CF80132;
	Tue, 24 Dec 2019 01:27:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C6C5F80130; Tue, 24 Dec 2019 01:27:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7854FF800E8
 for <alsa-devel@alsa-project.org>; Tue, 24 Dec 2019 01:27:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7854FF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="iBUc0x4v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1577147234; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=fNIZfTznwRicv1L3tfCg8DVacLlI9bpQ8BJN1yvLWCU=;
 b=iBUc0x4vbq+4lSji13z2d+saT7tVMXDrBcYb1Mj1lT1mD7lBmiXT5dbD4coZWZLN/2PWdb
 w5xk54yGkUIvZyEz/v/FeI0qcWGwXmgBT5EVS6R8tMR+lEPmUpxPPuUtUDIuuotgfLHta2
 ZVYMPE6m2L9hpT4daVCC9TWV7Wgj9Cw=
From: Paul Cercueil <paul@crapouillou.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Tue, 24 Dec 2019 01:27:07 +0100
Message-Id: <20191224002708.1207884-1-paul@crapouillou.net>
MIME-Version: 1.0
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, od@zcrc.me, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH 1/2] dt-bindings: sound: Convert jz47*-codec
	doc to YAML
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Convert ingenic,jz4740-codec.txt and ingenic,jz4725b-codec.txt to one
single ingenic,codec.yaml file, since they share the same binding.

Add the ingenic,jz4770-codec compatible string in the process.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../bindings/sound/ingenic,codec.yaml         | 55 +++++++++++++++++++
 .../bindings/sound/ingenic,jz4725b-codec.txt  | 20 -------
 .../bindings/sound/ingenic,jz4740-codec.txt   | 20 -------
 3 files changed, 55 insertions(+), 40 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/ingenic,codec.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/ingenic,jz4725b-codec.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/ingenic,jz4740-codec.txt

diff --git a/Documentation/devicetree/bindings/sound/ingenic,codec.yaml b/Documentation/devicetree/bindings/sound/ingenic,codec.yaml
new file mode 100644
index 000000000000..eb4be86464bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ingenic,codec.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ingenic,codec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic JZ47xx internal codec DT bindings
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+properties:
+  $nodename:
+    pattern: '^audio-codec@.*'
+
+  compatible:
+    oneOf:
+      - const: ingenic,jz4770-codec
+      - const: ingenic,jz4725b-codec
+      - const: ingenic,jz4740-codec
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: aic
+
+  '#sound-dai-cells':
+    const: 0
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#sound-dai-cells'
+
+examples:
+  - |
+    #include <dt-bindings/clock/jz4740-cgu.h>
+    codec: audio-codec@10020080 {
+      compatible = "ingenic,jz4740-codec";
+      reg = <0x10020080 0x8>;
+      #sound-dai-cells = <0>;
+      clocks = <&cgu JZ4740_CLK_AIC>;
+      clock-names = "aic";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/ingenic,jz4725b-codec.txt b/Documentation/devicetree/bindings/sound/ingenic,jz4725b-codec.txt
deleted file mode 100644
index 05adc0d47b13..000000000000
--- a/Documentation/devicetree/bindings/sound/ingenic,jz4725b-codec.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-Ingenic JZ4725B codec controller
-
-Required properties:
-- compatible : "ingenic,jz4725b-codec"
-- reg : codec registers location and length
-- clocks : phandle to the AIC clock.
-- clock-names: must be set to "aic".
-- #sound-dai-cells: Must be set to 0.
-
-Example:
-
-codec: audio-codec@100200a4 {
-	compatible = "ingenic,jz4725b-codec";
-	reg = <0x100200a4 0x8>;
-
-	#sound-dai-cells = <0>;
-
-	clocks = <&cgu JZ4725B_CLK_AIC>;
-	clock-names = "aic";
-};
diff --git a/Documentation/devicetree/bindings/sound/ingenic,jz4740-codec.txt b/Documentation/devicetree/bindings/sound/ingenic,jz4740-codec.txt
deleted file mode 100644
index 1ffcade87e7b..000000000000
--- a/Documentation/devicetree/bindings/sound/ingenic,jz4740-codec.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-Ingenic JZ4740 codec controller
-
-Required properties:
-- compatible : "ingenic,jz4740-codec"
-- reg : codec registers location and length
-- clocks : phandle to the AIC clock.
-- clock-names: must be set to "aic".
-- #sound-dai-cells: Must be set to 0.
-
-Example:
-
-codec: audio-codec@10020080 {
-	compatible = "ingenic,jz4740-codec";
-	reg = <0x10020080 0x8>;
-
-	#sound-dai-cells = <0>;
-
-	clocks = <&cgu JZ4740_CLK_AIC>;
-	clock-names = "aic";
-};
-- 
2.24.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
