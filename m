Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BD3640745
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 13:57:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5757E183A;
	Fri,  2 Dec 2022 13:56:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5757E183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669985839;
	bh=T1eu04ya87h40r84mEndD0sICo5t741XiRKryQ6VpBU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=br2gw2Eej+KTTZVRxYnO7RrQq3IYkXqa+v6vD5K1DG95FHbBSlcdmdODmg7CT3PTS
	 9eO7/WEg+8wCJ9eDGFheD1yuh6KxWEhymS14juA40OIb7Kg2ZnqieREC6FkaCoSdj8
	 t9auqRQSM1LpzMyxLDsRVZD9v+m8XIFHETzHbnLI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33B7CF804E2;
	Fri,  2 Dec 2022 13:56:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C0F8F80310; Fri,  2 Dec 2022 13:55:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90214F8026A
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 13:55:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90214F8026A
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2d07:19c5:4d8b:89d9])
 by laurent.telenet-ops.be with bizsmtp
 id rQvn2800H0ys3B701QvnFu; Fri, 02 Dec 2022 13:55:48 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1p15Zz-002Isn-0K; Fri, 02 Dec 2022 13:55:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1p15Zy-005gPC-Ip; Fri, 02 Dec 2022 13:55:46 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Damien Horsley <Damien.Horsley@imgtec.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/2] dt-bindings: sound: ti,pcm3168a: Convert to json-schema
Date: Fri,  2 Dec 2022 13:55:43 +0100
Message-Id: <9f2a2474ec71dcc2a76e868295202a8c425a5d41.1669980383.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669980383.git.geert+renesas@glider.be>
References: <cover.1669980383.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>
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

Convert the Texas Instruments PCM3168A Audio Codec Device Tree binding
documentation to json-schema.

Add missing properties.
Drop unneeded pinctrl properties from example.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/sound/ti,pcm3168a.txt |  56 ----------
 .../bindings/sound/ti,pcm3168a.yaml           | 105 ++++++++++++++++++
 2 files changed, 105 insertions(+), 56 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/ti,pcm3168a.txt
 create mode 100644 Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml

diff --git a/Documentation/devicetree/bindings/sound/ti,pcm3168a.txt b/Documentation/devicetree/bindings/sound/ti,pcm3168a.txt
deleted file mode 100644
index a02ecaab518327d5..0000000000000000
--- a/Documentation/devicetree/bindings/sound/ti,pcm3168a.txt
+++ /dev/null
@@ -1,56 +0,0 @@
-Texas Instruments pcm3168a DT bindings
-
-This driver supports both SPI and I2C bus access for this codec
-
-Required properties:
-
-  - compatible: "ti,pcm3168a"
-
-  - clocks : Contains an entry for each entry in clock-names
-
-  - clock-names : Includes the following entries:
-	"scki"	The system clock
-
-  - VDD1-supply : Digital power supply regulator 1 (+3.3V)
-
-  - VDD2-supply : Digital power supply regulator 2 (+3.3V)
-
-  - VCCAD1-supply : ADC power supply regulator 1 (+5V)
-
-  - VCCAD2-supply : ADC power supply regulator 2 (+5V)
-
-  - VCCDA1-supply : DAC power supply regulator 1 (+5V)
-
-  - VCCDA2-supply : DAC power supply regulator 2 (+5V)
-
-For required properties on SPI/I2C, consult SPI/I2C device tree documentation
-
-Optional properties:
-
-  - reset-gpios : Optional reset gpio line connected to RST pin of the codec.
-		  The RST line is low active:
-		  RST = low: device power-down
-		  RST = high: device is enabled
-
-Examples:
-
-i2c0: i2c0@0 {
-
-	...
-
-	pcm3168a: audio-codec@44 {
-		compatible = "ti,pcm3168a";
-		reg = <0x44>;
-		reset-gpios = <&gpio0 4 GPIO_ACTIVE_LOW>;
-		clocks = <&clk_core CLK_AUDIO>;
-		clock-names = "scki";
-		VDD1-supply = <&supply3v3>;
-		VDD2-supply = <&supply3v3>;
-		VCCAD1-supply = <&supply5v0>;
-		VCCAD2-supply = <&supply5v0>;
-		VCCDA1-supply = <&supply5v0>;
-		VCCDA2-supply = <&supply5v0>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&dac_clk_pin>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml b/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
new file mode 100644
index 0000000000000000..a977507c52b05aed
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,pcm3168a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments PCM3168A Audio Codec
+
+maintainers:
+  - Damien Horsley <Damien.Horsley@imgtec.com>
+
+description:
+  The Texas Instruments PCM3168A is a 24-bit Multi-channel Audio CODEC with
+  96/192kHz sampling rate, supporting both SPI and I2C bus access.
+
+properties:
+  compatible:
+    const: ti,pcm3168a
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: System clock input
+
+  clock-names:
+    items:
+      - const: scki
+
+  reset-gpios:
+    items:
+      - description: |
+          GPIO line connected to the active-low RST pin of the codec.
+            RST = low: device power-down
+            RST = high: device is enabled
+
+  "#sound-dai-cells":
+    enum: [0, 1]
+
+  VDD1-supply:
+    description: Digital power supply regulator 1 (+3.3V)
+
+  VDD2-supply:
+    description: Digital power supply regulator 2 (+3.3V)
+
+  VCCAD1-supply:
+    description: ADC power supply regulator 1 (+5V)
+
+  VCCAD2-supply:
+    description: ADC power supply regulator 2 (+5V)
+
+  VCCDA1-supply:
+    description: DAC power supply regulator 1 (+5V)
+
+  VCCDA2-supply:
+    description: DAC power supply regulator 2 (+5V)
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: audio-graph-port.yaml#
+        description: Audio input port.
+
+      port@1:
+        $ref: audio-graph-port.yaml#
+        description: Audio output port.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - VDD1-supply
+  - VDD2-supply
+  - VCCAD1-supply
+  - VCCAD2-supply
+  - VCCDA1-supply
+  - VCCDA2-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pcm3168a: audio-codec@44 {
+            compatible = "ti,pcm3168a";
+            reg = <0x44>;
+            reset-gpios = <&gpio0 4 GPIO_ACTIVE_LOW>;
+            clocks = <&clk_core 42>;
+            clock-names = "scki";
+            VDD1-supply = <&supply3v3>;
+            VDD2-supply = <&supply3v3>;
+            VCCAD1-supply = <&supply5v0>;
+            VCCAD2-supply = <&supply5v0>;
+            VCCDA1-supply = <&supply5v0>;
+            VCCDA2-supply = <&supply5v0>;
+        };
+    };
-- 
2.25.1

