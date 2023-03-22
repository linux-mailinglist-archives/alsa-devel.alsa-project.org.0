Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1746C4C46
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 14:49:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9570DE8C;
	Wed, 22 Mar 2023 14:48:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9570DE8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679492943;
	bh=aODlcrPvj/0BKNj1Oi3rdCv9Ck8k5n/zZ4BIdEa4pHw=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=CHTfy3y+ztefdTvphExNJ/UrrGmsTnMVdjUGUNW2FgqvXggwBuU2nXA1uRdMZAYCA
	 XZqp6L4yHgspruQUfb+9QEhqH8dz8ewDCm6bDietoTgaU0I3x4HYPZLUwX+/Zhc4UC
	 m99EmCEbO6FmhhEs0gt4QDD0TxRBkOQU5kfFhd7g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EDD0F8051B;
	Wed, 22 Mar 2023 14:47:28 +0100 (CET)
To: Herve Codina <herve.codina@bootlin.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 1/6] dt-bindings: mfd: Add the Lantiq  PEF2256 E1/T1/J1
 framer
Date: Wed, 22 Mar 2023 14:46:49 +0100
In-Reply-To: <20230322134654.219957-1-herve.codina@bootlin.com>
References: <20230322134654.219957-1-herve.codina@bootlin.com>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/75YWWWIZHSHG2BFO4OSYXJJ3KLGMROVT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167949284736.26.3690826229362317487@mailman-core.alsa-project.org>
From: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACB60F8052D; Wed, 22 Mar 2023 14:47:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1092EF80093
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 14:47:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1092EF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SesXuSG9
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 02F9F20009;
	Wed, 22 Mar 2023 13:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679492831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GtKW5q9fPSO6pNjQIiZ7Bkeuj4CPrNIE69axokgW5KQ=;
	b=SesXuSG9WBtOZf85vVjIjqXn88PGGfi9eSsJiN5bGw+ipISqjanls6HD9pEDw9aFy661R0
	mG5JQq0g481qJvmXS5EVxXVk/tm3BzgPqgsIpqXflqt7NXMKf832t04hyeNuQ8EjSiayYb
	Ia2BwUJopO2r2eB15wAUvpiMB1BhMcjR/CfRmz/Raol4Uok70WVzuOVfnRKijm9ciZ9x5g
	8wrEeOIN4HwuAwhs5S5SsT8qhOLCbTePbjmBxutuF+hBgZr6HTgabsv7y0/hbvKoVzMhB5
	Kal/f0Pl72fIzo9KpG/WbpIf99lFqMX57zQpp+jnuWkgO1TXUcWuW1Js6f1Hrg==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 1/6] dt-bindings: mfd: Add the Lantiq  PEF2256 E1/T1/J1
 framer
Date: Wed, 22 Mar 2023 14:46:49 +0100
Message-Id: <20230322134654.219957-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322134654.219957-1-herve.codina@bootlin.com>
References: <20230322134654.219957-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 75YWWWIZHSHG2BFO4OSYXJJ3KLGMROVT
X-Message-ID-Hash: 75YWWWIZHSHG2BFO4OSYXJJ3KLGMROVT
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/75YWWWIZHSHG2BFO4OSYXJJ3KLGMROVT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Lantiq PEF2256 is a framer and line interface component designed to
fulfill all required interfacing between an analog E1/T1/J1 line and the
digital PCM system highway/H.100 bus.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../bindings/mfd/lantiq,pef2256.yaml          | 205 ++++++++++++++++++
 1 file changed, 205 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/lantiq,pef2256.yaml

diff --git a/Documentation/devicetree/bindings/mfd/lantiq,pef2256.yaml b/Documentation/devicetree/bindings/mfd/lantiq,pef2256.yaml
new file mode 100644
index 000000000000..affbf20df0a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/lantiq,pef2256.yaml
@@ -0,0 +1,205 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/lantiq,pef2256.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lantiq PEF2256
+
+maintainers:
+  - Herve Codina <herve.codina@bootlin.com>
+
+description:
+  The Lantiq PEF2256, also known as Infineon PEF2256 or FALC56, is a framer and
+  line interface component designed to fulfill all required interfacing between
+  an analog E1/T1/J1 line and the digital PCM system highway/H.100 bus.
+
+properties:
+  compatible:
+    items:
+      - const: lantiq,pef2256
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Master clock
+      - description: Receive System Clock
+      - description: Transmit System Clock
+
+  clock-names:
+    items:
+      - const: mclk
+      - const: sclkr
+      - const: sclkx
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    description:
+      GPIO used to reset the device.
+    maxItems: 1
+
+  pinctrl:
+    $ref: /schemas/pinctrl/pinctrl.yaml#
+
+    patternProperties:
+      '-pins$':
+        type: object
+        $ref: /schemas/pinctrl/pincfg-node.yaml#
+
+        properties:
+          pins:
+            enum: [ RPA, RPB, RPC, RPD, XPA, XPB, XPC, XPD ]
+
+          function:
+            enum: [ SYPR, RFM, RFMB, RSIGM, RSIG, DLR, FREEZE, RFSP, LOS,
+                    SYPX, XFMS, XSIG, TCLK, XMFB, XSIGM, DLX, XCLK, XLT,
+                    GPI, GPOH, GPOL ]
+
+        additionalProperties: false
+
+        required:
+          - pins
+          - function
+
+    additionalProperties: false
+
+  lantiq,line-interface:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [e1, t1j1]
+    default: e1
+    description: |
+      The line interface type
+        - e1: E1 line
+        - t1j1: T1/J1 line
+
+  lantiq,frame-format:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      The line interface frame format.
+
+  lantiq,data-rate-bps:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [2048000, 4096000, 8192000, 16384000]
+    default: 2048000
+    description:
+      Data rate (bit per seconds) on the system highway.
+
+  lantiq,clock-falling-edge:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Data is sent on falling edge of the clock (and received on the rising
+      edge). If 'clock-falling-edge' is not present, data is sent on the
+      rising edge (and received on the falling edge).
+
+  lantiq,channel-phase:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3, 4, 5, 6, 7]
+    default: 0
+    description:
+      The pef2256 delivers a full frame (32 8bit time-slots in E1 and 24 8bit
+      time-slots 8 8bit signaling in E1/J1) every 125us. This lead to a data
+      rate of 2048000 bit/s. When lantiq,data-rate-bps is more than 2048000
+      bit/s, the data (all 32 8bit) present in the frame are interleave with
+      unused time-slots. The lantiq,channel-phase property allows to set the
+      correct alignment of the interleave mechanism.
+      For instance, suppose lantiq,data-rate-bps = 8192000 (ie 4*2048000), and
+      lantiq,channel-phase = 2, the interleave schema with unused time-slots
+      (nu) and used time-slots (XX) for TSi is
+        nu nu XX nu nu nu XX nu nu nu XX nu
+        <-- TSi --> <- TSi+1 -> <- TSi+2 ->
+      With lantiq,data-rate-bps = 8192000, and lantiq,channel-phase = 1, the
+      interleave schema is
+        nu XX nu nu nu XX nu nu nu XX nu nu
+        <-- TSi --> <- TSi+1 -> <- TSi+2 ->
+      With lantiq,data-rate-bps = 4096000 (ie 2*2048000), and
+      lantiq,channel-phase = 1, the interleave schema is
+        nu    XX    nu    XX    nu    XX
+        <-- TSi --> <- TSi+1 -> <- TSi+2 ->
+
+  lantiq,subordinate:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      If present, the pef2256 works in subordinate mode. In this mode it
+      synchronizes on line interface clock signals. Otherwise, it synchronizes
+      on internal clocks.
+
+patternProperties:
+  '^codec([0-9]|[1-2][0-9]|3[0-1])?$':
+    $ref: /schemas/sound/lantiq,pef2256-codec.yaml
+
+allOf:
+  - if:
+      properties:
+        lantiq,line-interface:
+          contains:
+            const: e1
+    then:
+      properties:
+        lantiq,frame-format:
+          enum: [doubleframe, crc4-multiframe, auto-multiframe]
+          default: doubleframe
+          description: |
+            The E1 line interface frame format
+              - doubleframe: Doubleframe format
+              - crc4-multiframe: CRC4 multiframe format
+              - auto-multiframe: CRC4 multiframe format with interworking
+                                 capabilities (ITU-T G.706 Annex B)
+
+    else:
+      # T1/J1 line
+      properties:
+        lantiq,frame-format:
+          enum: [4frame, 12frame, 24frame, 72frame]
+          default: 12frame
+          description: |
+            The T1/J1 line interface frame format
+              - 4frame: 4-frame multiframe format (F4)
+              - 12frame: 12-frame multiframe format (F12, D3/4)
+              - 24frame: 24-frame multiframe format (ESF)
+              - 72frame: 72-frame multiframe format (F72, remote switch mode)
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    framer@2000000 {
+      compatible = "lantiq,pef2256", "simple-mfd";
+      reg = <0x2000000 0x100>;
+      interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+      interrupt-parent = <&intc>;
+      clocks = <&clk_mclk>, <&clk_sclkr>, <&clk_sclkx>;
+      clock-names = "mclk", "sclkr", "sclkx";
+      reset-gpios = <&gpio 11 GPIO_ACTIVE_LOW>;
+      lantiq,data-rate-bps = <4096000>;
+
+      pinctrl {
+        pef2256_rpa_sypr: rpa-pins {
+          pins = "RPA";
+          function = "SYPR";
+        };
+        pef2256_xpa_sypx: xpa-pins {
+          pins = "XPA";
+          function = "SYPX";
+        };
+      };
+
+      codec {
+        compatible = "lantiq,pef2256-codec";
+        #sound-dai-cells = <0>;
+      };
+    };
-- 
2.39.2

