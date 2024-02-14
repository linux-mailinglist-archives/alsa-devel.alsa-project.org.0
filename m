Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF8A85B454
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Feb 2024 09:02:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B364384A;
	Tue, 20 Feb 2024 09:02:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B364384A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708416145;
	bh=wsHVfr8hdZBYZbP2L9EO1WVTmS/EVBmRVwV/3aRh+cQ=;
	h=From:Date:Subject:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Kv0+jmCMvL5eWVVCFzDvSG+78oq7CbOGXCrizo+8WqFZnzqcLSTLITRSueWWBTVoe
	 HgXnrI+5LNk1Qx9zYcmYaeq8qXx3D4xSACLVpSsI1+ZGoAVXM/ItREsohNWnFIhEC9
	 5aapsVv8Oci7v1fwWwKcrJvwJcYQwrH1HdAKOeOg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73FB3F8057D; Tue, 20 Feb 2024 09:01:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5415BF8057A;
	Tue, 20 Feb 2024 09:01:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10F14F80238; Wed, 14 Feb 2024 07:40:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D250F800EE
	for <alsa-devel@alsa-project.org>; Wed, 14 Feb 2024 07:40:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D250F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=MB+WA0Zn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1707892818; x=1739428818;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=wsHVfr8hdZBYZbP2L9EO1WVTmS/EVBmRVwV/3aRh+cQ=;
  b=MB+WA0Zn8CYOPYAi+hwN4oy+OrsTRuenN01G6OTGnFZPwpNT5iLA9Dg0
   rcKFkKecZ7pRTjHmsbVKaxXZKYZYKzQGyGNuBuVMCnUG2LZBjXjTQPe9s
   RlfsOuA8pTibXa5YbLXBeI4Vpd1tHU6atiBBS1M5iVHCWHHSCW7WYh3tH
   VFY3LQ3NNqXrDTFo+zapkoZsK2NTaqXcU4I0cz6IoZ6fo3Ginr3+qwxd4
   xnicnCB87JIPV+wN30zx/fFeI91LwdPkdeWioPdBpWfRbgxS1PgUyI2Wz
   Clnh43SbZ9DvH1zHu6FptZV8zpraTRXIvDHzAxwsMJEgIVqU7OrKf2BVz
   Q==;
X-CSE-ConnectionGUID: Ym+jSPJASQmf8byUSlOr0w==
X-CSE-MsgGUID: B+vCBEvPTBmYybQn1ZsH9A==
X-IronPort-AV: E=Sophos;i="6.06,159,1705388400";
   d="scan'208";a="17663685"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Feb 2024 23:40:14 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 23:40:12 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 13 Feb 2024 23:40:07 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Wed, 14 Feb 2024 12:10:06 +0530
Subject: [PATCH] dt-bindings: sound:atmel-at91sam9g20ek: convert bindings
 to json-schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: 
 <20240214-at91sam9g20ek-wm8731-yaml-v1-1-33333e17383b@microchip.com>
X-B4-Tracking: v=1; b=H4sIAEVgzGUC/x2MywqDMBAAf0X23IVsDNj4K8XDqltdaqwk4gPx3
 xs6tznMXJAkqiSoiwuibJr0O2ehRwHdyPMgqH12sMY6Y8khr54SBz9YIx/cw7MqCU8OEzrj+kz
 bemLI/RLlrcf//Wru+wcz//ayawAAAA==
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Balakrishnan Sambath
	<balakrishnan.s@microchip.com>
X-Mailer: b4 0.12.4
X-MailFrom: Balakrishnan.S@microchip.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VI6XYX7WS5FNJIXL7P5EEUGII3DGKN7T
X-Message-ID-Hash: VI6XYX7WS5FNJIXL7P5EEUGII3DGKN7T
X-Mailman-Approved-At: Tue, 20 Feb 2024 07:59:36 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VI6XYX7WS5FNJIXL7P5EEUGII3DGKN7T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert atmel-at91sam9g20ek-wm8731-audio DT binding to yaml
based json-schema.Change file name to match json-scheme naming.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../bindings/sound/atmel,at91sam9g20ek-wm8731.yaml | 60 ++++++++++++++++++++++
 .../sound/atmel-at91sam9g20ek-wm8731-audio.txt     | 26 ----------
 2 files changed, 60 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/atmel,at91sam9g20ek-wm8731.yaml b/Documentation/devicetree/bindings/sound/atmel,at91sam9g20ek-wm8731.yaml
new file mode 100644
index 000000000000..f6330707fe1b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/atmel,at91sam9g20ek-wm8731.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/atmel,at91sam9g20ek-wm8731.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel at91sam9g20ek wm8731 audio complex
+
+maintainers:
+  - Balakrishnan Sambath <balakrishnan.s@microchip.com>
+
+properties:
+  compatible:
+    const: atmel,at91sam9g20ek-wm8731-audio
+
+  atmel,model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: The user-visible name of this sound complex.
+  atmel,audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: A list of the connections between audio components.
+    minItems: 2
+    items:
+      enum:
+        # Board Connectors
+        - "Ext Spk"
+        - "Int MIC"
+
+        # CODEC Pins
+        - LHPOUT
+        - MICIN
+  atmel,ssc-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the SSC controller
+  atmel,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of WM8731 audio codec
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
+        compatible = "atmel,at91sam9g20ek-wm8731-audio";
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_pck0_as_mck>;
+        atmel,model = "wm8731 @ AT91SAMG20EK";
+        atmel,audio-routing =
+            "Ext Spk", "LHPOUT",
+            "Int MIC", "MICIN";
+        atmel,ssc-controller = <&ssc0>;
+        atmel,audio-codec = <&wm8731>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/atmel-at91sam9g20ek-wm8731-audio.txt b/Documentation/devicetree/bindings/sound/atmel-at91sam9g20ek-wm8731-audio.txt
deleted file mode 100644
index 9c5a9947b64d..000000000000
--- a/Documentation/devicetree/bindings/sound/atmel-at91sam9g20ek-wm8731-audio.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-* Atmel at91sam9g20ek wm8731 audio complex
-
-Required properties:
-  - compatible: "atmel,at91sam9g20ek-wm8731-audio"
-  - atmel,model: The user-visible name of this sound complex.
-  - atmel,audio-routing: A list of the connections between audio components.
-  - atmel,ssc-controller: The phandle of the SSC controller
-  - atmel,audio-codec: The phandle of the WM8731 audio codec
-Optional properties:
-  - pinctrl-names, pinctrl-0: Please refer to pinctrl-bindings.txt
-
-Example:
-sound {
-	compatible = "atmel,at91sam9g20ek-wm8731-audio";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_pck0_as_mck>;
-
-	atmel,model = "wm8731 @ AT91SAMG20EK";
-
-	atmel,audio-routing =
-		"Ext Spk", "LHPOUT",
-		"Int MIC", "MICIN";
-
-	atmel,ssc-controller = <&ssc0>;
-	atmel,audio-codec = <&wm8731>;
-};

---
base-commit: 0dd3ee31125508cd67f7e7172247f05b7fd1753a
change-id: 20240214-at91sam9g20ek-wm8731-yaml-404ddddbb91a

Best regards,
-- 
Balakrishnan Sambath <balakrishnan.s@microchip.com>

