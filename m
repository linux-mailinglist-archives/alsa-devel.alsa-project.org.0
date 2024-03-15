Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B980587DCA9
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 09:59:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5750A23D2;
	Sun, 17 Mar 2024 09:59:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5750A23D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710665955;
	bh=H4RG/XZrAHW/3xUIR1pTsc+DN9COf1TDojyeYAQW0cY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qA1Tthxm6cFtbtkYfq4sewYSOH389E/0TNGshPEbLqzrM3o7WH1d9hYJ2P/c6uETu
	 BQ8RzXEiXbu6bLuDJuQZ2S2eSu3YsCDEAPyIlsHdDsEnhyzlNp9BVTcofko/igc0ZW
	 +BVrx+LSctBb9535ZXN7vbO2XHAEXwNObcx7wZsY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09895F805A1; Sun, 17 Mar 2024 09:58:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC2CBF805A0;
	Sun, 17 Mar 2024 09:58:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEEF5F8057B; Fri, 15 Mar 2024 12:28:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 527DFF8014B
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 12:27:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 527DFF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UpJMKl+T
Received: by mail.gandi.net (Postfix) with ESMTPA id 3D771E0003;
	Fri, 15 Mar 2024 11:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710502076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dUAcXFtPdRzxlgNNFBRR/Bz60z5XFsvCtl6oMmi/Tnk=;
	b=UpJMKl+Tk1kwzSGv27hqthWfNw3H5waB3ZX7b7gxVp9N4uF3iz5yzlx444ZmmD6qbYECIT
	nZBjQavUzL/LwuU4+Zc0WprIbPgQVVrgHbyjhXWSzBpfjLqZDjIHn10ZVSAODEkDMjBnrQ
	dcFqjCJG+32dXyce2ExLOQ7bnjlPeoO/9sFeZso9bjsL98edt3vmEb0gdKXfLTApzXt+52
	xeWKkGVToHRTLT60/8FtRzPC49xtiKEwdPDvWinuOX69KoIY9mNBMKoq6gUp4RSQqL/cK5
	qa8WowHGk63UGwHquYrLK3OMBAsLNJYDymfbVuC6FUULl1aV4BncJsZyXyVnbA==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
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
Subject: [PATCH 01/13] ASoC: dt-bindings: davinci-mcbsp: convert McBSP
 bindings to yaml schema
Date: Fri, 15 Mar 2024 12:27:33 +0100
Message-ID: <20240315112745.63230-2-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
References: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com
X-MailFrom: bastien.curutchet@bootlin.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DPTG6G6QQWWSP72TMPOLREQM3RRPESXQ
X-Message-ID-Hash: DPTG6G6QQWWSP72TMPOLREQM3RRPESXQ
X-Mailman-Approved-At: Sun, 17 Mar 2024 08:55:54 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DPTG6G6QQWWSP72TMPOLREQM3RRPESXQ/>
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
---
 .../bindings/sound/davinci-mcbsp.txt          | 50 ----------
 .../bindings/sound/davinci-mcbsp.yaml         | 96 +++++++++++++++++++
 2 files changed, 96 insertions(+), 50 deletions(-)
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
index 000000000000..8b0e9b5da08f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml
@@ -0,0 +1,96 @@
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
+    description: phandle to the corresponding power-domain
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
+    mcbsp0: mcbsp0@1d10000 {
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
+      dmas = <&edma0 3 1
+              &edma0 2 1>;
+      dma-names = "tx", "rx";
+
+      clocks = <&psc1 14>;
+    };
-- 
2.43.2

