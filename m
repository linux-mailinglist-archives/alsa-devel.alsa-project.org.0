Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 577FD699621
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 14:44:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38980E83;
	Thu, 16 Feb 2023 14:43:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38980E83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676555067;
	bh=kgSMBrXleb/isA+ukUq78jvxM83oFGYCUi0NY+14T+I=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=csJObuYWGTood6Sg1eKJsH0kgMZ2X6q+awKUZ3LqbolviW29O76yxx7VtOmkHaozD
	 lAnC5YXj1xKtuaKd2qU/bJzl3+ibL+wto0v5Ppec1eCMzMPYEkcTkR1hhVsii+8Eu6
	 HfQtSLk1kPXHkndJI8Ka+yI4cGoxPQalwPFNlHp8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F269F804B0;
	Thu, 16 Feb 2023 14:42:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16314F80171; Thu, 16 Feb 2023 14:42:45 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F5F9F80083
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 14:42:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F5F9F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=X/vxY6gM
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 4A63820004;
	Thu, 16 Feb 2023 13:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676554961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rn8cjJa4FG8e5ZUm02id+hD+mxkq2DEiUPzHRHzDZCM=;
	b=X/vxY6gMeXruas0qcDcaizNOl461w7+w1BajTOlRAFBhoi+u+bfNmw9+o4zaYpWJgICLg3
	Lkm6qJw8SrM0QBtway7MmmpYzYtnzeseTRo8ygX0+qNB9/OT5uhExlvm/C1MsnYPpvuMbJ
	tyWn09eUnCnknHxRazCESB2VqGY9GFeMpLwGDmpLTEe9+P9G8089Zu0g8ZSE70fOQEL+eS
	fJo2AX/jnAzoRI9TNBtCeiqydEeYbXCTXor8vjXfgyfOuhlng3+PiNIyTtysM9TXTwS4ZO
	vLchpSjTA2EpHJvGq786DCM15JyKqkgZAhRSXk5AQ0oNDeJAUmLSvJ02WXN+Ew==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH v5 01/10] dt-bindings: soc: fsl: cpm_qe: Add TSA controller
Date: Thu, 16 Feb 2023 14:42:17 +0100
Message-Id: <20230216134226.1692107-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216134226.1692107-1-herve.codina@bootlin.com>
References: <20230216134226.1692107-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TIJ5GFMGLAYONSJ6MPWU2BOFFN6HXA3L
X-Message-ID-Hash: TIJ5GFMGLAYONSJ6MPWU2BOFFN6HXA3L
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TIJ5GFMGLAYONSJ6MPWU2BOFFN6HXA3L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support for the time slot assigner (TSA)
available in some PowerQUICC SoC such as MPC885
or MPC866.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml | 234 ++++++++++++++++++
 include/dt-bindings/soc/fsl,tsa.h             |  13 +
 2 files changed, 247 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml
 create mode 100644 include/dt-bindings/soc/fsl,tsa.h

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml
new file mode 100644
index 000000000000..bcd03f89780e
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml
@@ -0,0 +1,234 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PowerQUICC CPM Time-slot assigner (TSA) controller
+
+maintainers:
+  - Herve Codina <herve.codina@bootlin.com>
+
+description:
+  The TSA is the time-slot assigner that can be found on some PowerQUICC SoC.
+  Its purpose is to route some TDM time-slots to other internal serial
+  controllers.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,mpc885-tsa
+          - fsl,mpc866-tsa
+      - const: fsl,cpm1-tsa
+
+  reg:
+    items:
+      - description: SI (Serial Interface) register base
+      - description: SI RAM base
+
+  reg-names:
+    items:
+      - const: si_regs
+      - const: si_ram
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  '#fsl,serial-cells':
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 1
+    description:
+      TSA consumers that use a phandle to TSA need to pass the serial identifier
+      with this phandle (defined in dt-bindings/soc/fsl,tsa.h).
+      For instance "fsl,tsa-serial = <&tsa FSL_CPM_TSA_SCC4>;".
+
+patternProperties:
+  '^tdm@[0-1]$':
+    description:
+      The TDM managed by this controller
+    type: object
+
+    additionalProperties: false
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 1
+        description:
+          The TDM number for this TDM, 0 for TDMa and 1 for TDMb
+
+      fsl,common-rxtx-pins:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          The hardware can use four dedicated pins for Tx clock, Tx sync, Rx
+          clock and Rx sync or use only two pins, Tx/Rx clock and Tx/Rx sync.
+          Without the 'fsl,common-rxtx-pins' property, the four pins are used.
+          With the 'fsl,common-rxtx-pins' property, two pins are used.
+
+      clocks:
+        minItems: 2
+        items:
+          - description: External clock connected to L1RSYNC pin
+          - description: External clock connected to L1RCLK pin
+          - description: External clock connected to L1TSYNC pin
+          - description: External clock connected to L1TCLK pin
+      clock-names:
+        minItems: 2
+        items:
+          - const: l1rsync
+          - const: l1rclk
+          - const: l1tsync
+          - const: l1tclk
+
+      fsl,diagnostic-mode:
+        $ref: /schemas/types.yaml#/definitions/string
+        enum: [disabled, echo, internal-loopback, control-loopback]
+        default: disabled
+        description: |
+          The diagnostic mode can be used to diagnose some communication issues.
+          It should not be set (or set to 'disabled') when diagnostic is not
+          needed.
+          Diagnostic mode:
+            - disabled:
+                Diagnostic disabled (ie. normal operation)
+            - echo:
+                Automatic echo. Rx data is resent on Tx.
+            - internal-loopback:
+                The TDM transmitter is connected to the receiver. Data appears
+                on Tx pin.
+            - control-loopback:
+                The TDM transmitter is connected to the receiver. The Tx pin is
+                disconnected.
+
+      fsl,rx-frame-sync-delay-bits:
+        enum: [0, 1, 2, 3]
+        default: 0
+        description: |
+          Receive frame sync delay in number of bits.
+          Indicates the delay between the Rx sync and the first bit of the Rx
+          frame. 0 for no bit delay. 1, 2 or 3 for 1, 2 or 3 bits delay.
+
+      fsl,tx-frame-sync-delay-bits:
+        enum: [0, 1, 2, 3]
+        default: 0
+        description: |
+          Transmit frame sync delay in number of bits.
+          Indicates the delay between the Tx sync and the first bit of the Tx
+          frame. 0 for no bit delay. 1, 2 or 3 for 1, 2 or 3 bits delay.
+
+      fsl,clock-falling-edge:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          Data is sent on falling edge of the clock (and received on the rising
+          edge). If 'clock-falling-edge' is not present, data is sent on the
+          rising edge (and received on the falling edge).
+
+      fsl,fsync-rising-edge:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          Frame sync pulses are sampled with the rising edge of the channel
+          clock. If 'fsync-rising-edge' is not present, pulses are sampled with
+          the falling edge.
+
+      fsl,double-speed-clock:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          The channel clock is twice the data rate.
+
+    patternProperties:
+      '^fsl,[rt]x-ts-routes$':
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        description: |
+          A list of tuple that indicates the Tx or Rx time-slots routes.
+        items:
+          items:
+            - description:
+                The number of time-slots
+              minimum: 1
+              maximum: 64
+            - description: |
+                The source (Tx) or destination (Rx) serial interface
+                (dt-bindings/soc/fsl,tsa.h defines these values)
+                 - 0: No destination
+                 - 1: SCC2
+                 - 2: SCC3
+                 - 3: SCC4
+                 - 4: SMC1
+                 - 5: SMC2
+              enum: [0, 1, 2, 3, 4, 5]
+        minItems: 1
+        maxItems: 64
+
+    allOf:
+      # If fsl,common-rxtx-pins is present, only 2 clocks are needed.
+      # Else, the 4 clocks must be present.
+      - if:
+          required:
+            - fsl,common-rxtx-pins
+        then:
+          properties:
+            clocks:
+              maxItems: 2
+            clock-names:
+              maxItems: 2
+        else:
+          properties:
+            clocks:
+              minItems: 4
+            clock-names:
+              minItems: 4
+
+    required:
+      - reg
+      - clocks
+      - clock-names
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - '#address-cells'
+  - '#size-cells'
+  - '#fsl,serial-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/fsl,tsa.h>
+
+    tsa@ae0 {
+        compatible = "fsl,mpc885-tsa", "fsl,cpm1-tsa";
+        reg = <0xae0 0x10>,
+              <0xc00 0x200>;
+        reg-names = "si_regs", "si_ram";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+        #fsl,serial-cells = <1>;
+
+        tdm@0 {
+            /* TDMa */
+            reg = <0>;
+
+            clocks = <&clk_l1rsynca>, <&clk_l1rclka>;
+            clock-names = "l1rsync", "l1rclk";
+
+            fsl,common-rxtx-pins;
+            fsl,fsync-rising-edge;
+
+            fsl,tx-ts-routes = < 2 0 >,             /* TS 0..1 */
+                           < 24 FSL_CPM_TSA_SCC4 >, /* TS 2..25 */
+                           < 1 0 >,                 /* TS 26 */
+                           < 5 FSL_CPM_TSA_SCC3 >;  /* TS 27..31 */
+
+            fsl,rx-ts-routes = < 2 0 >,             /* TS 0..1 */
+                           < 24 FSL_CPM_TSA_SCC4 >, /* 2..25 */
+                           < 1 0 >,                 /* TS 26 */
+                           < 5 FSL_CPM_TSA_SCC3 >;  /* TS 27..31 */
+        };
+    };
diff --git a/include/dt-bindings/soc/fsl,tsa.h b/include/dt-bindings/soc/fsl,tsa.h
new file mode 100644
index 000000000000..2cc44e867dbe
--- /dev/null
+++ b/include/dt-bindings/soc/fsl,tsa.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+
+#ifndef __DT_BINDINGS_SOC_FSL_TSA_H
+#define __DT_BINDINGS_SOC_FSL_TSA_H
+
+#define FSL_CPM_TSA_NU		0	/* Pseuso Cell Id for not used item */
+#define FSL_CPM_TSA_SCC2	1
+#define FSL_CPM_TSA_SCC3	2
+#define FSL_CPM_TSA_SCC4	3
+#define FSL_CPM_TSA_SMC1	4
+#define FSL_CPM_TSA_SMC2	5
+
+#endif
-- 
2.39.1

