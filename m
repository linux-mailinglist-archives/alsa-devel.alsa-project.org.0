Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E505752EE
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 18:37:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4037C187B;
	Thu, 14 Jul 2022 18:36:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4037C187B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657816642;
	bh=1lCKq8upImpho0NoW6K8MyE7g9y8ny2vHADrYtxmYgo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZjqDOY6DvI/aFsKukHzyDYTQnM/ARWufrgAt4e2LYyUrYptGTAPFi0VtT3qm9lKPG
	 JnPg3r9/593R+qJSnHei1qlLGut755pr5N6LfifYeAuUSFHVyvl7RDXUaUW1IGtYo0
	 nxAFk1NCthpB6TvEH2V4zy3+zVXZfPk9v1T9eWBQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E2BAF80566;
	Thu, 14 Jul 2022 18:34:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA9B9F80155; Mon, 11 Jul 2022 20:30:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2032AF80163
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 20:30:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2032AF80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="qlJwghHu"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1657564214; x=1689100214;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1lCKq8upImpho0NoW6K8MyE7g9y8ny2vHADrYtxmYgo=;
 b=qlJwghHuF2ii7rXS16plz6HqZvtcnZyvZT6Yt441FAjdgbEnShczADPx
 Oxwh5PSK0Vk04qEdIHwLxeDthNZabPkl+IUIEyU0NJjMF2aMzJdnRXYbf
 RJ1UdUfy0YbJfp9GU2+YT4QlX7vwd0+Tvg9bM2oUtthYM/K8jJwynfIzt
 DrYygSei3k+HYLLZW9Ktu0ehMGzkRd1yqchEd4HvwrwylM+iS4W6tcaj7
 4TIqTo6+kx7dkjmI5p/W+AHkoKXelOV80gu8fKHUExEK/CHq+LjRUZ08Y
 OGfWK2BPBiT92ucYIZh6oJA0N4orFQyKIOgdzVcsRLhwbspAQoSm8jZry A==;
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; d="scan'208";a="167331482"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Jul 2022 11:30:02 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Jul 2022 11:30:01 -0700
Received: from ryan-Precision-5560.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 11 Jul 2022 11:30:01 -0700
From: <Ryan.Wanner@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>
Subject: [PATCH v2 2/2] dt-binding: sound: atmel, pdmic: Convert to json-schema
Date: Mon, 11 Jul 2022 11:30:10 -0700
Message-ID: <20220711183010.39123-3-Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220711183010.39123-1-Ryan.Wanner@microchip.com>
References: <20220711183010.39123-1-Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Thu, 14 Jul 2022 18:34:36 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Ryan
 Wanner <Ryan.Wanner@microchip.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Convert Atmel PDMIC devicetree binding to json-schema.
Change file naming to match json-schema naming.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
v1 -> v2:
- Fix title.
- Removed trivial descriptions.
- Fix formatting.

 .../bindings/sound/atmel,sama5d2-pdmic.yaml   | 98 +++++++++++++++++++
 .../devicetree/bindings/sound/atmel-pdmic.txt | 55 -----------
 2 files changed, 98 insertions(+), 55 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/atmel,sama5d2-pdmic.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/atmel-pdmic.txt

diff --git a/Documentation/devicetree/bindings/sound/atmel,sama5d2-pdmic.yaml b/Documentation/devicetree/bindings/sound/atmel,sama5d2-pdmic.yaml
new file mode 100644
index 000000000000..88fa92a30147
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/atmel,sama5d2-pdmic.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (C) 2022 Microchip Technology, Inc. and its subsidiaries
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/atmel,sama5d2-pdmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel PDMIC decoder
+
+maintainers:
+  - Claudiu Beznea <claudiu.beznea@microchip.com>
+
+description:
+  Atmel Pulse Density Modulation Interface Controller
+  (PDMIC) peripheral is a mono PDM decoder module
+  that decodes an incoming PDM sample stream.
+
+properties:
+  compatible:
+    const: atmel,sama5d2-pdmic
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: peripheral clock
+      - description: generated clock
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: gclk
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    const: rx
+
+  atmel,mic-min-freq:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The minimal frequency that the microphone supports.
+
+  atmel,mic-max-freq:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The maximal frequency that the microphone supports.
+
+  atmel,model:
+    description: The user-visible name of this sound card.
+    $ref: /schemas/types.yaml#/definitions/string
+    default: PDMIC
+
+  atmel,mic-offset:
+    $ref: /schemas/types.yaml#/definitions/int32
+    description: The offset that should be added.
+    default: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - dmas
+  - dma-names
+  - clock-names
+  - clocks
+  - atmel,mic-min-freq
+  - atmel,mic-max-freq
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/dma/at91.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pdmic: sound@f8018000 {
+    	compatible = "atmel,sama5d2-pdmic";
+    	reg = <0xf8018000 0x124>;
+    	interrupts = <48 IRQ_TYPE_LEVEL_HIGH 7>;
+    	dmas = <&dma0
+    		(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
+    		| AT91_XDMAC_DT_PERID(50))>;
+    	dma-names = "rx";
+    	clocks = <&pdmic_clk>, <&pdmic_gclk>;
+    	clock-names = "pclk", "gclk";
+    	pinctrl-names = "default";
+    	pinctrl-0 = <&pinctrl_pdmic_default>;
+    	atmel,model = "PDMIC@sama5d2_xplained";
+    	atmel,mic-min-freq = <1000000>;
+    	atmel,mic-max-freq = <3246000>;
+    	atmel,mic-offset = <0x0>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/atmel-pdmic.txt b/Documentation/devicetree/bindings/sound/atmel-pdmic.txt
deleted file mode 100644
index e0875f17c229..000000000000
--- a/Documentation/devicetree/bindings/sound/atmel-pdmic.txt
+++ /dev/null
@@ -1,55 +0,0 @@
-* Atmel PDMIC driver under ALSA SoC architecture
-
-Required properties:
-- compatible
-	Should be "atmel,sama5d2-pdmic".
-- reg
-	Should contain PDMIC registers location and length.
-- interrupts
-	Should contain the IRQ line for the PDMIC.
-- dmas
-	One DMA specifiers as described in atmel-dma.txt and dma.txt files.
-- dma-names
-	Must be "rx".
-- clock-names
-	Required elements:
-	- "pclk"	peripheral clock
-	- "gclk"	generated clock
-- clocks
-	Must contain an entry for each required entry in clock-names.
-	Please refer to clock-bindings.txt.
-- atmel,mic-min-freq
-	The minimal frequency that the micphone supports.
-- atmel,mic-max-freq
-	The maximal frequency that the micphone supports.
-
-Optional properties:
-- pinctrl-names, pinctrl-0
-	Please refer to pinctrl-bindings.txt.
-- atmel,model
-	The user-visible name of this sound card.
-	The default value is "PDMIC".
-- atmel,mic-offset
-	The offset that should be added.
-	The range is from -32768 to 32767.
-	The default value is 0.
-
-Example:
-	pdmic@f8018000 {
-				compatible = "atmel,sama5d2-pdmic";
-				reg = <0xf8018000 0x124>;
-				interrupts = <48 IRQ_TYPE_LEVEL_HIGH 7>;
-				dmas = <&dma0
-					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
-					| AT91_XDMAC_DT_PERID(50))>;
-				dma-names = "rx";
-				clocks = <&pdmic_clk>, <&pdmic_gclk>;
-				clock-names = "pclk", "gclk";
-
-				pinctrl-names = "default";
-				pinctrl-0 = <&pinctrl_pdmic_default>;
-				atmel,model = "PDMIC @ sama5d2_xplained";
-				atmel,mic-min-freq = <1000000>;
-				atmel,mic-max-freq = <3246000>;
-				atmel,mic-offset = <0x0>;
-	};
-- 
2.34.1

