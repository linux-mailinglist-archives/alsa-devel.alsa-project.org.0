Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CCF89AF08
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Apr 2024 09:17:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A592238E;
	Sun,  7 Apr 2024 09:17:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A592238E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712474267;
	bh=Mh2LHM8oJ/CJGsfoIFwaaxA758nlCt7jqRreMW4pp4E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tfeNamTAq411jGCgWBBvDepVZRKpDWHGBgH3o6VJz/Lectp/Htap3WFTbHh6rg0vG
	 F68p66JthV5fxVG6KgLXfJ2ixvOzOY3fOfVYLCZSELu6S4RHRpwryfXEyazQsmQff6
	 RAYOE+Yy2s19mltPSDQFAXBdiNjdcH7wFviHbFqw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CE54F80423; Sun,  7 Apr 2024 09:17:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86D36F8057E;
	Sun,  7 Apr 2024 09:17:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98FAAF80588; Tue,  2 Apr 2024 09:12:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47FA9F80568
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 09:12:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47FA9F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=itUJfzVY
Received: by mail.gandi.net (Postfix) with ESMTPA id 57E66FF803;
	Tue,  2 Apr 2024 07:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712041939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bVsKOWPb4Rd565bWpf2m06Y2VAlQVW0XhgGG23AgwRw=;
	b=itUJfzVYv3klqtnyEMVDg2E7rjmPA6DSQihARuQk91eujLgf+NwVEhY5Bba8ooIpVjc5Hw
	pd1mYqT02lr9JJ2OETE6UJnI6y0bXTWmG0gR3BUU/Oz4xy/ZRaoJuoY/flkrf3mXHHMv6E
	pERRfbxVkjAWAiuKyOdftboq9DruynMe6Pdx2Qh6MwpoUZeRoQ6LkZ3nFpQjbIhkpslhjV
	GOuDD+faS8tKSfQavrPBL6Owt56Bu/ooMgFcjO9YdRo6cgf5D8rDsm4TQhInzChGRy44oK
	d7RES5xaxraH0X/9Dcb8bmrg8rFli9S75f+IAMWPw1LLuv25Vfglq7rzATSS1g==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	herve.codina@bootlin.com,
	christophercordahi@nanometrics.ca
Subject: [PATCH v2 01/13] ASoC: dt-bindings: davinci-mcbsp: convert McBSP
 bindings to yaml schema
Date: Tue,  2 Apr 2024 09:12:01 +0200
Message-ID: <20240402071213.11671-2-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402071213.11671-1-bastien.curutchet@bootlin.com>
References: <20240402071213.11671-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com
X-MailFrom: bastien.curutchet@bootlin.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NAH2UF7MJI4G4PV3BQZ626NZ6U6TEUQA
X-Message-ID-Hash: NAH2UF7MJI4G4PV3BQZ626NZ6U6TEUQA
X-Mailman-Approved-At: Sun, 07 Apr 2024 07:14:00 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NAH2UF7MJI4G4PV3BQZ626NZ6U6TEUQA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the binding for McBSP controllers for TI SoCs from txt
to YAML schema.

Add properties 'clocks', 'clock-names', 'power-domains' and
'#sound-dai-cells' which were missing from the txt file.
Add '#sound-dai-cells' and 'clocks' in the example which were missing
from the txt file.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/sound/davinci-mcbsp.txt          | 50 ----------
 .../bindings/sound/davinci-mcbsp.yaml         | 95 +++++++++++++++++++
 2 files changed, 95 insertions(+), 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/davinci-mcbsp.txt
 create mode 100644 Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml

diff --git a/Documentation/devicetree/bindings/sound/davinci-mcbsp.txt b/Documentation/devicetree/bindings/sound/davinci-mcbsp.txt
deleted file mode 100644
index 3ffc2562fb31..000000000000
--- a/Documentation/devicetree/bindings/sound/davinci-mcbsp.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-Texas Instruments DaVinci McBSP module
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-This binding describes the "Multi-channel Buffered Serial Port" (McBSP)
-audio interface found in some TI DaVinci processors like the OMAP-L138 or AM180x.
-
-
-Required properties:
-~~~~~~~~~~~~~~~~~~~~
-- compatible :
-        "ti,da850-mcbsp" : for DA850, AM180x and OPAM-L138 platforms
-
-- reg : physical base address and length of the controller memory mapped
-        region(s).
-- reg-names : Should contain:
-        * "mpu" for the main registers (required).
-        * "dat" for the data FIFO (optional).
-
-- dmas: three element list of DMA controller phandles, DMA request line and
-	TC channel ordered triplets.
-- dma-names: identifier string for each DMA request line in the dmas property.
-	These strings correspond 1:1 with the ordered pairs in dmas. The dma
-	identifiers must be "rx" and "tx".
-
-Optional properties:
-~~~~~~~~~~~~~~~~~~~~
-- interrupts : Interrupt numbers for McBSP
-- interrupt-names : Known interrupt names are "rx" and "tx"
-
-- pinctrl-0: Should specify pin control group used for this controller.
-- pinctrl-names: Should contain only one value - "default", for more details
-        please refer to pinctrl-bindings.txt
-
-Example (AM1808):
-~~~~~~~~~~~~~~~~~
-
-mcbsp0: mcbsp@1d10000 {
-	compatible = "ti,da850-mcbsp";
-	pinctrl-names = "default";
-	pinctrl-0 = <&mcbsp0_pins>;
-
-	reg = 	<0x00110000 0x1000>,
-		<0x00310000 0x1000>;
-	reg-names = "mpu", "dat";
-	interrupts = <97 98>;
-	interrupt-names = "rx", "tx";
-	dmas = <&edma0 3 1
-		&edma0 2 1>;
-	dma-names = "tx", "rx";
-};
diff --git a/Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml b/Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml
new file mode 100644
index 000000000000..139b594dd192
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/davinci-mcbsp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: McBSP Controller for TI SoCs
+
+maintainers:
+  - Bastien Curutchet <bastien.curutchet@bootlin.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ti,da850-mcbsp
+
+  reg:
+    minItems: 1
+    items:
+      - description: CFG registers
+      - description: data registers
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: mpu
+      - const: dat
+
+  dmas:
+    items:
+      - description: transmission DMA channel
+      - description: reception DMA channel
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+  interrupts:
+    items:
+      - description: RX interrupt
+      - description: TX interrupt
+
+  interrupt-names:
+    items:
+      - const: rx
+      - const: tx
+
+  clocks:
+    items:
+      - description: functional clock
+
+  clock-names:
+    items:
+      - const: fck
+
+  power-domains:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - reg
+  - reg-names
+  - dmas
+  - dma-names
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mcbsp0@1d10000 {
+      #sound-dai-cells = <0>;
+      compatible = "ti,da850-mcbsp";
+      pinctrl-names = "default";
+      pinctrl-0 = <&mcbsp0_pins>;
+
+      reg = <0x111000 0x1000>,
+            <0x311000 0x1000>;
+      reg-names = "mpu", "dat";
+      interrupts = <97>, <98>;
+      interrupt-names = "rx", "tx";
+      dmas = <&edma0 3 1>,
+             <&edma0 2 1>;
+      dma-names = "tx", "rx";
+
+      clocks = <&psc1 14>;
+    };
-- 
2.44.0

