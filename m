Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC4A850384
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Feb 2024 09:34:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E910822;
	Sat, 10 Feb 2024 09:34:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E910822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707554063;
	bh=eaPjoMfznAH4IZPj/39ikg5X854USdvackzLWMpCGwI=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RA/jyqNLeC6sxeqhw/zZtLzQNbOiPKbJlhD3bRK7n3bTkByK+RgRNkBse33tTtSD0
	 pjhgx0u7C3jt00/cbfFY41DBHFUKPH52vITw9E+2t3+InyzfhVcDSFJkRvunp9yv9k
	 44dA6Ou0AFasho8SRWNWSwY1aW+IORNrvLNqvBeQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26188F8057E; Sat, 10 Feb 2024 09:33:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B71CEF8059F;
	Sat, 10 Feb 2024 09:33:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4899F801EB; Wed,  7 Feb 2024 10:43:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68914F800E3
	for <alsa-devel@alsa-project.org>; Wed,  7 Feb 2024 10:42:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68914F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=trvoLBLQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1707298972; x=1738834972;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eaPjoMfznAH4IZPj/39ikg5X854USdvackzLWMpCGwI=;
  b=trvoLBLQWVHFtIP51QAKMiKPenPradtYNFieZ31XuDfSQMgiMvJoJiob
   ucIKzOUu6qrLSWStB9daFIKy+jIdwSnjDh8a/HJo1z7CXTMf8I7RiGNC6
   lnJ5XzyfBwKRSwn9g0ouY2usA7KEJg5lJR5KGn9ABZVGKyDYsld5S0n58
   9bTIXPH/MauqkSbSH56xqfu/5DecGH+Yk0FaPxquM93Y2ukR0ii3XtLKT
   owZ1R6hMhcaFk//LU0RzClxlncgV3Y0GfMEoqe5xkCSgoaVb2SSp1Ghor
   wk3hw/sVv1DdGIG07wAD03CG12nOsHzZaIXDGovS8T0Ja1ywuZuIs5Qxs
   w==;
X-CSE-ConnectionGUID: fRBUDne2SeOxScIZjr2Gpg==
X-CSE-MsgGUID: gMnZzN7ETgKrlsrBwpz63Q==
X-IronPort-AV: E=Sophos;i="6.05,250,1701154800";
   d="scan'208";a="15884586"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Feb 2024 02:42:43 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 02:41:55 -0700
Received: from che-lt-i70843lx.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 7 Feb 2024 02:41:49 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <dharma.b@microchip.com>,
	<alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <hari.prasathge@microchip.com>
Subject: [PATCH] ASoC: dt-bindings: atmel,asoc-wm8904: Convert to json-schema
Date: Wed, 7 Feb 2024 15:11:44 +0530
Message-ID: <20240207094144.195397-1-dharma.b@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MailFrom: Dharma.B@microchip.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: T62O2FHBCUJE3PDAJEM7UZLXOSTTLHT6
X-Message-ID-Hash: T62O2FHBCUJE3PDAJEM7UZLXOSTTLHT6
X-Mailman-Approved-At: Sat, 10 Feb 2024 08:33:43 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T62O2FHBCUJE3PDAJEM7UZLXOSTTLHT6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert atmel,asoc-wm8904 devicetree binding to json-schema.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 .../bindings/sound/atmel,asoc-wm8904.yaml     | 84 +++++++++++++++++++
 .../bindings/sound/atmel-wm8904.txt           | 55 ------------
 2 files changed, 84 insertions(+), 55 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/atmel,asoc-wm8904.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/atmel-wm8904.txt

diff --git a/Documentation/devicetree/bindings/sound/atmel,asoc-wm8904.yaml b/Documentation/devicetree/bindings/sound/atmel,asoc-wm8904.yaml
new file mode 100644
index 000000000000..89a67f8e33b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/atmel,asoc-wm8904.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/atmel,asoc-wm8904.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel wm8904 audio codec complex
+
+maintainers:
+  - Dharma Balasubiramani <dharma.b@microchip.com>
+
+description:
+  The ASoC audio complex configuration for Atmel with WM8904 audio codec.
+
+properties:
+  compatible:
+    const: atmel,asoc-wm8904
+
+  atmel,model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: The user-visible name of this sound complex.
+
+  atmel,ssc-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the SSC controller.
+
+  atmel,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the WM8731 audio codec.
+
+  atmel,audio-routing:
+    description:
+      A list of the connections between audio components. Each entry is a pair
+      of strings, the first being the connection's sink, the second being the
+      connection's source.
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    items:
+      enum:
+        # Board Connectors
+        - Headphone Jack
+        - Line In Jack
+        - Mic
+        # WM8904 CODEC Pins
+        - IN1L
+        - IN1R
+        - IN2L
+        - IN2R
+        - IN3L
+        - IN3R
+        - HPOUTL
+        - HPOUTR
+        - LINEOUTL
+        - LINEOUTR
+        - MICBIAS
+
+required:
+  - compatible
+  - atmel,model
+  - atmel,audio-routing
+  - atmel,ssc-controller
+  - atmel,audio-codec
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "atmel,asoc-wm8904";
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_pck0_as_mck>;
+
+        atmel,model = "wm8904 @ AT91SAM9N12EK";
+
+        atmel,audio-routing =
+                "Headphone Jack", "HPOUTL",
+                "Headphone Jack", "HPOUTR",
+                "IN2L", "Line In Jack",
+                "IN2R", "Line In Jack",
+                "Mic", "MICBIAS",
+                "IN1L", "Mic";
+
+        atmel,ssc-controller = <&ssc0>;
+        atmel,audio-codec = <&wm8904>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/atmel-wm8904.txt b/Documentation/devicetree/bindings/sound/atmel-wm8904.txt
deleted file mode 100644
index 8bbe50c884b6..000000000000
--- a/Documentation/devicetree/bindings/sound/atmel-wm8904.txt
+++ /dev/null
@@ -1,55 +0,0 @@
-Atmel ASoC driver with wm8904 audio codec complex
-
-Required properties:
-  - compatible: "atmel,asoc-wm8904"
-  - atmel,model: The user-visible name of this sound complex.
-  - atmel,audio-routing: A list of the connections between audio components.
-    Each entry is a pair of strings, the first being the connection's sink,
-    the second being the connection's source. Valid names for sources and
-    sinks are the WM8904's pins, and the jacks on the board:
-
-    WM8904 pins:
-
-    * IN1L
-    * IN1R
-    * IN2L
-    * IN2R
-    * IN3L
-    * IN3R
-    * HPOUTL
-    * HPOUTR
-    * LINEOUTL
-    * LINEOUTR
-    * MICBIAS
-
-    Board connectors:
-
-    * Headphone Jack
-    * Line In Jack
-    * Mic
-
-  - atmel,ssc-controller: The phandle of the SSC controller
-  - atmel,audio-codec: The phandle of the WM8904 audio codec
-
-Optional properties:
-  - pinctrl-names, pinctrl-0: Please refer to pinctrl-bindings.txt
-
-Example:
-sound {
-	compatible = "atmel,asoc-wm8904";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_pck0_as_mck>;
-
-	atmel,model = "wm8904 @ AT91SAM9N12EK";
-
-	atmel,audio-routing =
-		"Headphone Jack", "HPOUTL",
-		"Headphone Jack", "HPOUTR",
-		"IN2L", "Line In Jack",
-		"IN2R", "Line In Jack",
-		"Mic", "MICBIAS",
-		"IN1L", "Mic";
-
-	atmel,ssc-controller = <&ssc0>;
-	atmel,audio-codec = <&wm8904>;
-};
-- 
2.25.1

