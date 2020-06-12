Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7C11F75A0
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 11:01:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 624BA168F;
	Fri, 12 Jun 2020 11:01:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 624BA168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591952519;
	bh=xCyjRdfMPjNVrpmOw5Q3dIVmDF/TyrxX1vtkr4RrJ1k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j/NXd02fofCWbvNlotZ5izJVreAqc/qUTWs1TDS6nsXXZbwnD+kvu4gGncH99SVYT
	 m7ONBk2Cll24V0U5S56PImhmJC/U8bzRwu2VRUdwRdJUeB9odCRQvydgCgFKM1UFBp
	 diXXQ/bcJdEyVvjtv2+OGP7v4nKayMjJoIYtA4HA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47FB8F802DB;
	Fri, 12 Jun 2020 10:58:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5AB0F802A8; Fri, 12 Jun 2020 10:58:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2D61F801F7
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 10:58:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2D61F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PN8Fa7m6"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05C8wTQT028269;
 Fri, 12 Jun 2020 03:58:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1591952309;
 bh=QNmeMQyKl4jFho/kD8thbFnWAIjnHv8u0oyEyvPnF3o=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=PN8Fa7m6Zp40igM/1AlPqCMDXSVz+iH7Hl9ge4rWEOq695SLzdGuSkUHhGzcINLUp
 t6JlNCezJheg0tRYDVZKMmZvYP33f6vO70NV2gl4CYpnqRs2hBhTd0lNG/CzgnvlB8
 VhXpO41tju8u5dpMf+wKWoXDUx0tpwaHtNU5CkBc=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05C8wTxs124774
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 12 Jun 2020 03:58:29 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 12
 Jun 2020 03:58:28 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 12 Jun 2020 03:58:28 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05C8wMML036678;
 Fri, 12 Jun 2020 03:58:27 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>
Subject: [PATCH v3 2/3] ASoC: dt-bindings: Add documentation for TI j721e EVM
 (CPB and IVI)
Date: Fri, 12 Jun 2020 11:59:08 +0300
Message-ID: <20200612085909.15018-3-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612085909.15018-1-peter.ujfalusi@ti.com>
References: <20200612085909.15018-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

The audio support on the Common Processor Board board is using
pcm3168a codec connected to McASP10 serializers in parallel setup.

The Infotainment board plugs into the Common Processor Board, the support
of the extension board is extending the CPB audio support by adding
the two codecs on the expansion board.

The audio support on the Infotainment Expansion Board consists of McASP0
connected to two pcm3168a codecs with dedicated set of serializers to each.
The SCKI for pcm3168a is sourced from j721e AUDIO_REFCLK0 pin.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 .../bindings/sound/ti,j721e-cpb-audio.yaml    |  95 +++++++++++
 .../sound/ti,j721e-cpb-ivi-audio.yaml         | 150 ++++++++++++++++++
 2 files changed, 245 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,j721e-cpb-audio.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/ti,j721e-cpb-ivi-audio.yaml

diff --git a/Documentation/devicetree/bindings/sound/ti,j721e-cpb-audio.yaml b/Documentation/devicetree/bindings/sound/ti,j721e-cpb-audio.yaml
new file mode 100644
index 000000000000..6f2be6503401
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,j721e-cpb-audio.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,j721e-cpb-audio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments J721e Common Processor Board Audio Support
+
+maintainers:
+  - Peter Ujfalusi <peter.ujfalusi@ti.com>
+
+description: |
+  The audio support on the board is using pcm3168a codec connected to McASP10
+  serializers in parallel setup.
+  The pcm3168a SCKI clock is sourced from j721e AUDIO_REFCLK2 pin.
+  In order to support 48KHz and 44.1KHz family of sampling rates the parent
+  clock for AUDIO_REFCLK2 needs to be changed between PLL4 (for 48KHz) and
+  PLL15 (for 44.1KHz). The same PLLs are used for McASP10's AUXCLK clock via
+  different HSDIVIDER.
+
+  Clocking setup for 48KHz family:
+  PLL4 ---> PLL4_HSDIV0 ---> MCASP10_AUXCLK ---> McASP10.auxclk
+        |-> PLL4_HSDIV2 ---> AUDIO_REFCLK2  ---> pcm3168a.SCKI
+
+  Clocking setup for 44.1KHz family:
+  PLL15 ---> PLL15_HSDIV0 ---> MCASP10_AUXCLK ---> McASP10.auxclk
+         |-> PLL15_HSDIV2 ---> AUDIO_REFCLK2  ---> pcm3168a.SCKI
+
+properties:
+  compatible:
+    items:
+      - const: ti,j721e-cpb-audio
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: User specified audio sound card name
+
+  ti,cpb-mcasp:
+    description: phandle to McASP used on CPB
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/phandle
+
+  ti,cpb-codec:
+    description: phandle to the pcm3168a codec used on the CPB
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/phandle
+
+  clocks:
+    items:
+      - description: AUXCLK clock for McASP used by CPB audio
+      - description: Parent for CPB_McASP auxclk (for 48KHz)
+      - description: Parent for CPB_McASP auxclk (for 44.1KHz)
+      - description: SCKI clock for the pcm3168a codec on CPB
+      - description: Parent for CPB_SCKI clock (for 48KHz)
+      - description: Parent for CPB_SCKI clock (for 44.1KHz)
+
+  clock-names:
+    items:
+      - const: cpb-mcasp-auxclk
+      - const: cpb-mcasp-auxclk-48000
+      - const: cpb-mcasp-auxclk-44100
+      - const: cpb-codec-scki
+      - const: cpb-codec-scki-48000
+      - const: cpb-codec-scki-44100
+
+required:
+  - compatible
+  - model
+  - ti,cpb-mcasp
+  - ti,cpb-codec
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |+
+    sound {
+        compatible = "ti,j721e-cpb-audio";
+        model = "j721e-cpb";
+
+        status = "okay";
+
+        ti,cpb-mcasp = <&mcasp10>;
+        ti,cpb-codec = <&pcm3168a_1>;
+
+        clocks = <&k3_clks 184 1>,
+                 <&k3_clks 184 2>, <&k3_clks 184 4>,
+                 <&k3_clks 157 371>,
+                 <&k3_clks 157 400>, <&k3_clks 157 401>;
+        clock-names = "cpb-mcasp-auxclk",
+                      "cpb-mcasp-auxclk-48000", "cpb-mcasp-auxclk-44100",
+                      "cpb-codec-scki",
+                      "cpb-codec-scki-48000", "cpb-codec-scki-44100";
+    };
diff --git a/Documentation/devicetree/bindings/sound/ti,j721e-cpb-ivi-audio.yaml b/Documentation/devicetree/bindings/sound/ti,j721e-cpb-ivi-audio.yaml
new file mode 100644
index 000000000000..e0b88470a502
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,j721e-cpb-ivi-audio.yaml
@@ -0,0 +1,150 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,j721e-cpb-ivi-audio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments J721e Common Processor Board Audio Support
+
+maintainers:
+  - Peter Ujfalusi <peter.ujfalusi@ti.com>
+
+description: |
+  The Infotainment board plugs into the Common Processor Board, the support of the
+  extension board is extending the CPB audio support, decribed in:
+  sound/ti,j721e-cpb-audio.txt
+
+  The audio support on the Infotainment Expansion Board consists of McASP0
+  connected to two pcm3168a codecs with dedicated set of serializers to each.
+  The SCKI for pcm3168a is sourced from j721e AUDIO_REFCLK0 pin.
+
+  In order to support 48KHz and 44.1KHz family of sampling rates the parent clock
+  for AUDIO_REFCLK0 needs to be changed between PLL4 (for 48KHz) and PLL15 (for
+  44.1KHz). The same PLLs are used for McASP0's AUXCLK clock via different
+  HSDIVIDER.
+
+  Note: the same PLL4 and PLL15 is used by the audio support on the CPB!
+
+  Clocking setup for 48KHz family:
+  PLL4 ---> PLL4_HSDIV0 ---> MCASP10_AUXCLK ---> McASP10.auxclk
+        |                |-> MCASP0_AUXCLK  ---> McASP0.auxclk
+        |
+        |-> PLL4_HSDIV2 ---> AUDIO_REFCLK2  ---> pcm3168a.SCKI
+                         |-> AUDIO_REFCLK0  ---> pcm3168a_a/b.SCKI
+
+  Clocking setup for 44.1KHz family:
+  PLL15 ---> PLL15_HSDIV0 ---> MCASP10_AUXCLK ---> McASP10.auxclk
+        |                  |-> MCASP0_AUXCLK  ---> McASP0.auxclk
+        |
+        |-> PLL15_HSDIV2 ---> AUDIO_REFCLK2   ---> pcm3168a.SCKI
+                          |-> AUDIO_REFCLK0   ---> pcm3168a_a/b.SCKI
+
+properties:
+  compatible:
+    items:
+      - const: ti,j721e-cpb-ivi-audio
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: User specified audio sound card name
+
+  ti,cpb-mcasp:
+    description: phandle to McASP used on CPB
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/phandle
+
+  ti,cpb-codec:
+    description: phandle to the pcm3168a codec used on the CPB
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/phandle
+
+  ti,ivi-mcasp:
+    description: phandle to McASP used on IVI
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/phandle
+
+  ti,ivi-codec-a:
+    description: phandle to the pcm3168a-A codec on the expansion board
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/phandle
+
+  ti,ivi-codec-b:
+    description: phandle to the pcm3168a-B codec on the expansion board
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/phandle
+
+  clocks:
+    items:
+      - description: AUXCLK clock for McASP used by CPB audio
+      - description: Parent for CPB_McASP auxclk (for 48KHz)
+      - description: Parent for CPB_McASP auxclk (for 44.1KHz)
+      - description: SCKI clock for the pcm3168a codec on CPB
+      - description: Parent for CPB_SCKI clock (for 48KHz)
+      - description: Parent for CPB_SCKI clock (for 44.1KHz)
+      - description: AUXCLK clock for McASP used by IVI audio
+      - description: Parent for IVI_McASP auxclk (for 48KHz)
+      - description: Parent for IVI_McASP auxclk (for 44.1KHz)
+      - description: SCKI clock for the pcm3168a codec on IVI
+      - description: Parent for IVI_SCKI clock (for 48KHz)
+      - description: Parent for IVI_SCKI clock (for 44.1KHz)
+
+  clock-names:
+    items:
+      - const: cpb-mcasp-auxclk
+      - const: cpb-mcasp-auxclk-48000
+      - const: cpb-mcasp-auxclk-44100
+      - const: cpb-codec-scki
+      - const: cpb-codec-scki-48000
+      - const: cpb-codec-scki-44100
+      - const: ivi-mcasp-auxclk
+      - const: ivi-mcasp-auxclk-48000
+      - const: ivi-mcasp-auxclk-44100
+      - const: ivi-codec-scki
+      - const: ivi-codec-scki-48000
+      - const: ivi-codec-scki-44100
+
+required:
+  - compatible
+  - model
+  - ti,cpb-mcasp
+  - ti,cpb-codec
+  - ti,ivi-mcasp
+  - ti,ivi-codec-a
+  - ti,ivi-codec-b
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |+
+    sound {
+        compatible = "ti,j721e-cpb-ivi-audio";
+        model = "j721e-cpb-ivi";
+
+        status = "okay";
+
+        ti,cpb-mcasp = <&mcasp10>;
+        ti,cpb-codec = <&pcm3168a_1>;
+
+        ti,ivi-mcasp = <&mcasp0>;
+        ti,ivi-codec-a = <&pcm3168a_a>;
+        ti,ivi-codec-b = <&pcm3168a_b>;
+
+        clocks = <&k3_clks 184 1>,
+                 <&k3_clks 184 2>, <&k3_clks 184 4>,
+                 <&k3_clks 157 371>,
+                 <&k3_clks 157 400>, <&k3_clks 157 401>,
+                 <&k3_clks 174 1>,
+                 <&k3_clks 174 2>, <&k3_clks 174 4>,
+                 <&k3_clks 157 301>,
+                 <&k3_clks 157 330>, <&k3_clks 157 331>;
+        clock-names = "cpb-mcasp-auxclk",
+                      "cpb-mcasp-auxclk-48000", "cpb-mcasp-auxclk-44100",
+                      "cpb-codec-scki",
+                      "cpb-codec-scki-48000", "cpb-codec-scki-44100",
+                      "ivi-mcasp-auxclk",
+                      "ivi-mcasp-auxclk-48000", "ivi-mcasp-auxclk-44100",
+                      "ivi-codec-scki",
+                      "ivi-codec-scki-48000", "ivi-codec-scki-44100";
+    };
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

