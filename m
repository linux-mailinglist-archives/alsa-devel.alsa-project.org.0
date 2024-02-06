Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E738884B1E2
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Feb 2024 11:03:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 503F9ED1;
	Tue,  6 Feb 2024 11:02:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 503F9ED1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707213784;
	bh=6NTsi8MTHhKSU1zdGgcR2NazjNxpJ4OkB7k2y0vpsVc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vHnY+ovKSB4M60YoEyM0Rq/WRal5cYAmZHj40P1BGDrDn0euinMoE7FhFfp1Ma1cc
	 WeBTXBrlPhrfoT0SUBiFxw0gp5CQYPz9JHiB19SpA0Xwh2dVHL7peWPIjeas5xytMW
	 QSRVIhgucsGnIETX41edPjHz2l31NmFsZmuJE4A0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AA2DF80652; Tue,  6 Feb 2024 11:01:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7534AF80676;
	Tue,  6 Feb 2024 11:01:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0A55F801EB; Tue,  6 Feb 2024 07:45:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97A4DF8016E
	for <alsa-devel@alsa-project.org>; Tue,  6 Feb 2024 07:44:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97A4DF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=eamd+o1n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1707201891; x=1738737891;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6NTsi8MTHhKSU1zdGgcR2NazjNxpJ4OkB7k2y0vpsVc=;
  b=eamd+o1nY+MURCbMhvEWkl/GvrbCmYcy+ikc8m1+iSDvhWVBS2p3L/nU
   iR/gRC6sYaDLAinpaw8yP+uwM9mm6YcReJtMb+LXmRAHoQpRN/kd1krj1
   VJUh55RDnSy5SxKO7W16rZTG4ou+0pZ3dRkmPcwPi5cRLg3n4PZgH5HTi
   xYqLtb6jfT+vW2iF5d8u8GOycbYKYz4u/H4EYhI2gS7fvYjghbYwiIAaR
   tgNLLJPk5DU4Nq6SJZsjWvajO2Nx3dYsUPahvPfcLZYl9PH9cMEqFo1be
   8VWbW2B8fQ2EbdQ/W3CepTmN2IVxYbhAJcf0zPgudw/g7a9hR2StF5sDN
   Q==;
X-CSE-ConnectionGUID: 5cKW/z4QQq6KFQyHa1Y4Bg==
X-CSE-MsgGUID: xRRXybZ8QuS7vPMPAREMRA==
X-IronPort-AV: E=Sophos;i="6.05,246,1701154800";
   d="scan'208";a="15812734"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Feb 2024 23:44:45 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 23:44:29 -0700
Received: from che-lt-i70843lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 5 Feb 2024 23:44:23 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <dharma.b@microchip.com>,
	<alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <hari.prasathge@microchip.com>
Subject: [linux][PATCH] ASoC: dt-bindings: atmel,sam9x5-wm8731: Convert to
 json-schema
Date: Tue, 6 Feb 2024 12:14:18 +0530
Message-ID: <20240206064418.237377-1-dharma.b@microchip.com>
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
Message-ID-Hash: DVMHRTJGFPWUK2AWR2GOQ66I6WXBCEHQ
X-Message-ID-Hash: DVMHRTJGFPWUK2AWR2GOQ66I6WXBCEHQ
X-Mailman-Approved-At: Tue, 06 Feb 2024 10:01:00 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DVMHRTJGFPWUK2AWR2GOQ66I6WXBCEHQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert atmel sam9x5-wm8731-audio devicetree binding to json-schema.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 .../sound/atmel,sam9x5-wm8731-audio.yaml      | 76 +++++++++++++++++++
 .../sound/atmel-sam9x5-wm8731-audio.txt       | 35 ---------
 2 files changed, 76 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/atmel,sam9x5-wm8731-audio.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/atmel-sam9x5-wm8731-audio.txt

diff --git a/Documentation/devicetree/bindings/sound/atmel,sam9x5-wm8731-audio.yaml b/Documentation/devicetree/bindings/sound/atmel,sam9x5-wm8731-audio.yaml
new file mode 100644
index 000000000000..33717b728f63
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/atmel,sam9x5-wm8731-audio.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/atmel,sam9x5-wm8731-audio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atmel at91sam9x5ek wm8731 audio complex
+
+maintainers:
+  - Dharma Balasubiramani <dharma.b@microchip.com>
+
+description:
+  The audio complex configuration for Atmel at91sam9x5ek with WM8731 audio codec.
+
+properties:
+  compatible:
+    const: atmel,sam9x5-wm8731-audio
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
+
+        # CODEC Pins
+        - LOUT
+        - ROUT
+        - LHPOUT
+        - RHPOUT
+        - LLINEIN
+        - RLINEIN
+        - MICIN
+
+required:
+  - compatible
+  - atmel,model
+  - atmel,ssc-controller
+  - atmel,audio-codec
+  - atmel,audio-routing
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "atmel,sam9x5-wm8731-audio";
+
+        atmel,model = "wm8731 @ AT91SAM9X5EK";
+
+        atmel,audio-routing =
+                "Headphone Jack", "RHPOUT",
+                "Headphone Jack", "LHPOUT",
+                "LLINEIN", "Line In Jack",
+                "RLINEIN", "Line In Jack";
+
+        atmel,ssc-controller = <&ssc0>;
+        atmel,audio-codec = <&wm8731>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/atmel-sam9x5-wm8731-audio.txt b/Documentation/devicetree/bindings/sound/atmel-sam9x5-wm8731-audio.txt
deleted file mode 100644
index 8facbce53db8..000000000000
--- a/Documentation/devicetree/bindings/sound/atmel-sam9x5-wm8731-audio.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-* Atmel at91sam9x5ek wm8731 audio complex
-
-Required properties:
-  - compatible: "atmel,sam9x5-wm8731-audio"
-  - atmel,model: The user-visible name of this sound complex.
-  - atmel,ssc-controller: The phandle of the SSC controller
-  - atmel,audio-codec: The phandle of the WM8731 audio codec
-  - atmel,audio-routing: A list of the connections between audio components.
-    Each entry is a pair of strings, the first being the connection's sink,
-    the second being the connection's source.
-
-Available audio endpoints for the audio-routing table:
-
-Board connectors:
- * Headphone Jack
- * Line In Jack
-
-wm8731 pins:
-cf Documentation/devicetree/bindings/sound/wlf,wm8731.yaml
-
-Example:
-sound {
-	compatible = "atmel,sam9x5-wm8731-audio";
-
-	atmel,model = "wm8731 @ AT91SAM9X5EK";
-
-	atmel,audio-routing =
-		"Headphone Jack", "RHPOUT",
-		"Headphone Jack", "LHPOUT",
-		"LLINEIN", "Line In Jack",
-		"RLINEIN", "Line In Jack";
-
-	atmel,ssc-controller = <&ssc0>;
-	atmel,audio-codec = <&wm8731>;
-};
-- 
2.25.1

