Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6BC6BCF7C
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 13:29:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1034F112C;
	Thu, 16 Mar 2023 13:29:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1034F112C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678969790;
	bh=Tg1Hl8UrXO9LNdl0nCxZ4XgBJCKFX0YurzLspOcTfiE=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=EFtCzss3fbbn47erw7o67vdOzFAJL1vt+Z58XXy0M07Vg+9kH1wWvzVAOzUpuaLnx
	 ndoJx2oTtA0lpUpdHe79xTBl8Kh08SgzG9lo4FaFfKVo6ShFfBYkIxru7fMvutv6AI
	 G0RYHl4DKzMpzvE9zC2eHO12YCtKx7N+mmqL9nkQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84926F8051B;
	Thu, 16 Mar 2023 13:28:12 +0100 (CET)
To: Herve Codina <herve.codina@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Derek Kiernan <derek.kiernan@xilinx.com>,
	Dragan Cvetic <dragan.cvetic@xilinx.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 1/7] dt-bindings: misc: Add the Lantiq  PEF2466 E1/T1/J1
 framer
Date: Thu, 16 Mar 2023 13:27:35 +0100
In-Reply-To: <20230316122741.577663-1-herve.codina@bootlin.com>
References: <20230316122741.577663-1-herve.codina@bootlin.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TPILZIXJN2UCBQRDA5M33PGWYJYVXX24/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167896969169.26.9422286621716629636@mailman-core.alsa-project.org>
From: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F189F8052E; Thu, 16 Mar 2023 13:28:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 702E8F800C9
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 13:27:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 702E8F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C5txoQS1
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 25FA71BF206;
	Thu, 16 Mar 2023 12:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678969677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FFGOza8KtxdlZJDJFifVkkqFS15G5C9LfrRj7KzUGtM=;
	b=C5txoQS1lBEDCg2adGNo2b7o+2FjHF3XmjzdKdHctY9eYDWMtxBORmWeiUMyBDdvK8Vphi
	jCPUuQsHF+uLg2SUJFCkSmUoBcRUlzITAFIEioS8chF51oISW2iyMX8f+v3Ihyyy1JmOi8
	tcLw6UNp/CODTIA2RuiwzJXB/oy5yNcre2k1uAsrxfrBcJXOnrm1BASyccVa+KTAGHq51B
	GIN72I3w+lVZ1GVpgu5XXfxJZ9liXiUcNuindq3pEhv4d6AQVWFLqbVim1I3jXiUeaXBS7
	WSIrS0hWdtyS0KfGN2XJME4UhN4OzUXPL9yYvukUdJNKC3BjO6WiS1j3TW3i1Q==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Derek Kiernan <derek.kiernan@xilinx.com>,
	Dragan Cvetic <dragan.cvetic@xilinx.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 1/7] dt-bindings: misc: Add the Lantiq  PEF2466 E1/T1/J1
 framer
Date: Thu, 16 Mar 2023 13:27:35 +0100
Message-Id: <20230316122741.577663-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316122741.577663-1-herve.codina@bootlin.com>
References: <20230316122741.577663-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TPILZIXJN2UCBQRDA5M33PGWYJYVXX24
X-Message-ID-Hash: TPILZIXJN2UCBQRDA5M33PGWYJYVXX24
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TPILZIXJN2UCBQRDA5M33PGWYJYVXX24/>
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
 .../bindings/misc/lantiq,pef2256.yaml         | 190 ++++++++++++++++++
 1 file changed, 190 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/lantiq,pef2256.yaml

diff --git a/Documentation/devicetree/bindings/misc/lantiq,pef2256.yaml b/Documentation/devicetree/bindings/misc/lantiq,pef2256.yaml
new file mode 100644
index 000000000000..1ba788d06a14
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/lantiq,pef2256.yaml
@@ -0,0 +1,190 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/lantiq,pef2256.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lantiq PEF2256
+
+maintainers:
+  - Herve Codina <herve.codina@bootlin.com>
+
+description:
+  The Lantiq PEF2256, also known as Infineon PEF2256 or FALC256, is a framer and
+  line interface component designed to fulfill all required interfacing between
+  an analog E1/T1/J1 line and the digital PCM system highway/H.100 bus.
+
+properties:
+  compatible:
+    const: lantiq,pef2256
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Master clock
+
+  clock-names:
+    items:
+      - const: mclk
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
+    allOf:
+      - $ref: "/schemas/pinctrl/pinctrl.yaml#"
+
+    patternProperties:
+      '-pins$':
+        type: object
+        allOf:
+          - $ref: "/schemas/pinctrl/pincfg-node.yaml#"
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
+        required:
+          - pins
+          - function
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
+  lantiq,sysclk-rate-hz:
+    enum: [2048000, 4096000, 8192000, 16384000]
+    default: 2048000
+    description:
+      Clock rate (Hz) on the system highway.
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
+allOf:
+  - if:
+      properties:
+        lantiq,line-interface:
+          contains:
+            const: e1
+    then:
+      properties:
+        lantiq,frame-format:
+          $ref: /schemas/types.yaml#/definitions/string
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
+          $ref: /schemas/types.yaml#/definitions/string
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
+    pef2256@2000000 {
+      compatible = "lantiq,pef2256";
+      reg = <0x2000000 0xFF>;
+      interrupts = <8 1>;
+      interrupt-parent = <&PIC>;
+      clocks = <&clk_mclk>;
+      clock-names = "mclk";
+      reset-gpios = <&gpio 11 GPIO_ACTIVE_LOW>;
+      lantiq,sysclk-rate-hz = <8192000>;
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
+    };
-- 
2.39.2

