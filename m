Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F7C17C85A
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 23:31:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 056F71668;
	Fri,  6 Mar 2020 23:30:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 056F71668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583533890;
	bh=0Q6z5/agfTyeoXC/virv1gCvayx5H0HbyKkriYv19w8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gKV8UipKQaHMl26XRzIzs3ag7cz0t84mFELKKIbORMdWOXIpFFvoMrGn/CaSmIXCc
	 oqa0NGm31kwmCloDbqJIjqVrCjaIK5uzg9bNSPkHiT1sIGyqawwEpJnWyZWvhMgHKG
	 KTibNx7rEYnaKp0DjXskJoFgya2rhixirkhqAj2w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E759CF80126;
	Fri,  6 Mar 2020 23:29:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACB51F801ED; Fri,  6 Mar 2020 23:29:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1752CF80126
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 23:29:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1752CF80126
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="RDe8VCo4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1583533776; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=PT8uQQYAH9Vv0YxKJ/O7JQHklj40PoE+07mqPq5SYKc=;
 b=RDe8VCo4xT2xqbQ98ApgiBGDS5cys8epCCCFPALNLlGTQQoy5agzhAGZJwBgL56w1QQDU/
 DAu1d3st8bbFkIGC8vAYliIHdQvzG4JoGY2rlLv5Amu00BBMgSKHQK02gTV03BWi7YLTpJ
 yr8FBpszZekRncJf2SCqtn2xHSDWUbs=
From: Paul Cercueil <paul@crapouillou.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/6] dt-bindings: sound: Convert jz4740-i2s doc to YAML
Date: Fri,  6 Mar 2020 23:29:26 +0100
Message-Id: <20200306222931.39664-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Zhou Yanjie <zhouyanjie@wanyeetech.com>,
 Paul Cercueil <paul@crapouillou.net>, od@zcrc.me
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

Convert the textual binding documentation for the AIC (AC97/I2S
Controller) of Ingenic SoCs to a YAML schema, and add the new compatible
strings in the process.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../bindings/sound/ingenic,aic.yaml           | 92 +++++++++++++++++++
 .../bindings/sound/ingenic,jz4740-i2s.txt     | 23 -----
 2 files changed, 92 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/ingenic,aic.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/ingenic,jz4740-i2s.txt

diff --git a/Documentation/devicetree/bindings/sound/ingenic,aic.yaml b/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
new file mode 100644
index 000000000000..44f49bebb267
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ingenic,aic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic SoCs AC97 / I2S Controller (AIC) DT bindings
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+properties:
+  $nodename:
+    pattern: '^audio-controller@'
+
+  compatible:
+    oneOf:
+      - enum:
+        - ingenic,jz4740-i2s
+        - ingenic,jz4760-i2s
+        - ingenic,jz4770-i2s
+        - ingenic,jz4780-i2s
+      - items:
+        - const: ingenic,jz4725b-i2s
+        - const: ingenic,jz4740-i2s
+
+  '#sound-dai-cells':
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AIC clock
+      - description: I2S clock
+      - description: EXT clock
+      - description: PLL/2 clock
+
+  clock-names:
+    items:
+      - const: aic
+      - const: i2s
+      - const: ext
+      - const: pll half
+
+  dmas:
+    items:
+      - description: DMA controller phandle and request line for I2S RX
+      - description: DMA controller phandle and request line for I2S TX
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - dmas
+  - dma-names
+  - '#sound-dai-cells'
+
+examples:
+  - |
+    #include <dt-bindings/clock/jz4740-cgu.h>
+    aic: audio-controller@10020000 {
+      compatible = "ingenic,jz4740-i2s";
+      reg = <0x10020000 0x38>;
+
+      #sound-dai-cells = <0>;
+
+      interrupt-parent = <&intc>;
+      interrupts = <18>;
+
+      clocks = <&cgu JZ4740_CLK_AIC>,
+               <&cgu JZ4740_CLK_I2S>,
+               <&cgu JZ4740_CLK_EXT>,
+               <&cgu JZ4740_CLK_PLL_HALF>;
+      clock-names = "aic", "i2s", "ext", "pll half";
+
+      dmas = <&dmac 25 0xffffffff>, <&dmac 24 0xffffffff>;
+      dma-names = "rx", "tx";
+    };
diff --git a/Documentation/devicetree/bindings/sound/ingenic,jz4740-i2s.txt b/Documentation/devicetree/bindings/sound/ingenic,jz4740-i2s.txt
deleted file mode 100644
index b623d50004fb..000000000000
--- a/Documentation/devicetree/bindings/sound/ingenic,jz4740-i2s.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-Ingenic JZ4740 I2S controller
-
-Required properties:
-- compatible : "ingenic,jz4740-i2s" or "ingenic,jz4780-i2s"
-- reg : I2S registers location and length
-- clocks : AIC and I2S PLL clock specifiers.
-- clock-names: "aic" and "i2s"
-- dmas: DMA controller phandle and DMA request line for I2S Tx and Rx channels
-- dma-names: Must be "tx" and "rx"
-
-Example:
-
-i2s: i2s@10020000 {
-	compatible = "ingenic,jz4740-i2s";
-	reg = <0x10020000 0x94>;
-
-	clocks = <&cgu JZ4740_CLK_AIC>, <&cgu JZ4740_CLK_I2SPLL>;
-	clock-names = "aic", "i2s";
-
-	dmas = <&dma 2>, <&dma 3>;
-	dma-names = "tx", "rx";
-
-};
-- 
2.25.1

