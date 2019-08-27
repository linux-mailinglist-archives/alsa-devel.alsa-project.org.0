Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 220509EB00
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 16:29:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7331822;
	Tue, 27 Aug 2019 16:28:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7331822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566916157;
	bh=DSo2IbykQb6wNeMHRzHbMPuPFtZNUazhKcA183pebEI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a0+B8O8oc1jdM4mYCSrcSwJjgtjSOZgZI5dlaZ1hlT2BhDW1YkV4FC2QNbz19enXD
	 cUgeZ6e2wqpDJhDCn9ImbtSZPsrXRREZLNviw7AdI6obeKrcHshuDUF8evh0FpgdXj
	 Rz/29ZOCNB1hW+J9ANVwB6a0XtttrxM5XtCO4AbU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3450F805FB;
	Tue, 27 Aug 2019 16:26:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8024F805F7; Tue, 27 Aug 2019 16:26:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD809F801ED
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 16:25:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD809F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="C5Z8jLNy"
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 735AB20828;
 Tue, 27 Aug 2019 14:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566915956;
 bh=YoisSZN2CT2C0575Pt/EXXlF+MGscyp9DpACOKWzxHs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C5Z8jLNy8gyU4uLv5FI681/gRgY12+EeZqK9GyGOF6R+BX1pQr3gV4S9gyfJb0yzT
 T10qSyVWiz9j4Wu6WDrt5ZDPh+SzsCYyZosOK9kGF7Wkhwo67lRohf6ylBA5kCwLT1
 8aXRUbi0XOlPtcQd8og73vhCReHSmrBfKdka0pac=
From: Maxime Ripard <mripard@kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Date: Tue, 27 Aug 2019 16:25:45 +0200
Message-Id: <20190827142547.14577-3-mripard@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190827142547.14577-1-mripard@kernel.org>
References: <20190827142547.14577-1-mripard@kernel.org>
MIME-Version: 1.0
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <mripard@kernel.org>
Subject: [alsa-devel] [PATCH 3/5] dt-bindings: sound: Convert Allwinner A33
	codec to a schema
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

From: Maxime Ripard <maxime.ripard@bootlin.com>

The Allwinner A33 SoC have an embedded audio codec that is supported in Linux,
with a matching Device Tree binding.

Now that we have the DT validation in place, let's convert the device tree
bindings for that controller over to a YAML schemas.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 .../sound/allwinner,sun8i-a33-codec.yaml      | 57 +++++++++++++++++
 .../bindings/sound/sun8i-a33-codec.txt        | 63 -------------------
 2 files changed, 57 insertions(+), 63 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
new file mode 100644
index 000000000000..5e7cc05bbff1
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/allwinner,sun8i-a33-codec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A33 Codec Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <maxime.ripard@bootlin.com>
+
+properties:
+  "#sound-dai-cells":
+    const: 0
+
+  compatible:
+    const: allwinner,sun8i-a33-codec
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Bus Clock
+      - description: Module Clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: mod
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    audio-codec@1c22e00 {
+      #sound-dai-cells = <0>;
+      compatible = "allwinner,sun8i-a33-codec";
+      reg = <0x01c22e00 0x400>;
+      interrupts = <0 29 4>;
+      clocks = <&ccu 47>, <&ccu 92>;
+      clock-names = "bus", "mod";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt b/Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt
deleted file mode 100644
index 7ecf6bd60d27..000000000000
--- a/Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt
+++ /dev/null
@@ -1,63 +0,0 @@
-Allwinner SUN8I audio codec
-------------------------------------
-
-On Sun8i-A33 SoCs, the audio is separated in different parts:
-	  - A DAI driver. It uses the "sun4i-i2s" driver which is
-	  documented here:
-	  Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
-	  - An analog part of the codec which is handled as PRCM registers.
-	  See Documentation/devicetree/bindings/sound/sun8i-codec-analog.txt
-	  - An digital part of the codec which is documented in this current
-	  binding documentation.
-	  - And finally, an audio card which links all the above components.
-	  The simple-audio card will be used.
-	  See Documentation/devicetree/bindings/sound/simple-card.txt
-
-This bindings documentation exposes Sun8i codec (digital part).
-
-Required properties:
-- compatible: must be "allwinner,sun8i-a33-codec"
-- reg: must contain the registers location and length
-- interrupts: must contain the codec interrupt
-- clocks: a list of phandle + clock-specifer pairs, one for each entry
-  in clock-names.
-- clock-names: should contain followings:
-   - "bus": the parent APB clock for this controller
-   - "mod": the parent module clock
-
-Here is an example to add a sound card and the codec binding on sun8i SoCs that
-are similar to A33 using simple-card:
-
-	sound {
-		compatible = "simple-audio-card";
-		simple-audio-card,name = "sun8i-a33-audio";
-		simple-audio-card,format = "i2s";
-		simple-audio-card,frame-master = <&link_codec>;
-		simple-audio-card,bitclock-master = <&link_codec>;
-		simple-audio-card,mclk-fs = <512>;
-		simple-audio-card,aux-devs = <&codec_analog>;
-		simple-audio-card,routing =
-				"Left DAC", "Digital Left DAC",
-				"Right DAC", "Digital Right DAC";
-
-		simple-audio-card,cpu {
-			sound-dai = <&dai>;
-		};
-
-		link_codec: simple-audio-card,codec {
-			sound-dai = <&codec>;
-		};
-
-	soc@1c00000 {
-		[...]
-
-		audio-codec@1c22e00 {
-			#sound-dai-cells = <0>;
-			compatible = "allwinner,sun8i-a33-codec";
-			reg = <0x01c22e00 0x400>;
-			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ccu CLK_BUS_CODEC>, <&ccu CLK_AC_DIG>;
-			clock-names = "bus", "mod";
-		};
-	};
-
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
