Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2306AC7A5
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 17:20:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DD3A114E;
	Mon,  6 Mar 2023 17:20:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DD3A114E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678119657;
	bh=o1q5JE8AIj7mzLBDwH+p6PKewHYvOVsfNVomTeurdzc=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uKlAciCl+IZyHCfBQ3kffIwWmH/NrXOvYf9GJgyolZ7dwni1TP6OXpYP7Da6XmmTJ
	 vJWb42sXgSSGAgpjPRGJGuKK0af0dffv3MBFbvTSlArJUWZVS4tmaJDo9xKt401ekq
	 xPRn4/S9ztAk1l/LJ6nJ/nZZOuMXVTy6l/cZeVuI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75398F8056F;
	Mon,  6 Mar 2023 17:18:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F00AF8052D; Mon,  6 Mar 2023 17:18:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11737F8053D
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 17:18:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11737F8053D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G6hBBgYH
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 76FE5240014;
	Mon,  6 Mar 2023 16:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678119502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/nlprenBg5iqK2v9en/Tyjgk9ugk7HcEW+YZA+BTTYg=;
	b=G6hBBgYHQA8YT9J9tu6JtTEhegy5byDUMa2gAleEZyINPCNa+9uatw5zowELIfw4P5RVxI
	1SqQNW8z0S44BvdZ66cuXpjwpR6Y+CBnlSFpfygamqqgZL8hVidTMZ06ajxlovc/Qsv6DO
	G5CK3e8BT8+2GQsAZwbPIeSoJ8Zj7+q6lsmhbXiviTZu/BeyyY2oynxgtC5vtcu0Sd0iD0
	oD1N9AZ4Oay+qIgGa64Br96aKDN+sJe3cdepLR9duPvRcyfZHin2J5e7SSZEJx7XGiXou2
	uv8RzOOD1GhRvqqSe7KcP76TaFlN4Ml7q8vUA/CQZtXu57kELJwAV05wa7VFrw==
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
Subject: [PATCH v7 05/10] dt-bindings: soc: fsl: cpm_qe: Add QMC controller
Date: Mon,  6 Mar 2023 17:17:49 +0100
Message-Id: <20230306161754.89146-6-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306161754.89146-1-herve.codina@bootlin.com>
References: <20230306161754.89146-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QYTBGXSF4E2E4HVBK5M4ABVRR6RPUYTZ
X-Message-ID-Hash: QYTBGXSF4E2E4HVBK5M4ABVRR6RPUYTZ
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QYTBGXSF4E2E4HVBK5M4ABVRR6RPUYTZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support for the QMC (QUICC Multichannel Controller) available in
some PowerQUICC SoC such as MPC885 or MPC866.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 .../soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml      | 162 ++++++++++++++++++
 1 file changed, 162 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
new file mode 100644
index 000000000000..ec888f48cac8
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
@@ -0,0 +1,162 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PowerQUICC CPM QUICC Multichannel Controller (QMC)
+
+maintainers:
+  - Herve Codina <herve.codina@bootlin.com>
+
+description:
+  The QMC (QUICC Multichannel Controller) emulates up to 64 channels within one
+  serial controller using the same TDM physical interface routed from TSA.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,mpc885-scc-qmc
+          - fsl,mpc866-scc-qmc
+      - const: fsl,cpm1-scc-qmc
+
+  reg:
+    items:
+      - description: SCC (Serial communication controller) register base
+      - description: SCC parameter ram base
+      - description: Dual port ram base
+
+  reg-names:
+    items:
+      - const: scc_regs
+      - const: scc_pram
+      - const: dpram
+
+  interrupts:
+    maxItems: 1
+    description: SCC interrupt line in the CPM interrupt controller
+
+  fsl,tsa-serial:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to TSA node
+          - enum: [1, 2, 3]
+            description: |
+              TSA serial interface (dt-bindings/soc/cpm1-fsl,tsa.h defines these
+              values)
+               - 1: SCC2
+               - 2: SCC3
+               - 3: SCC4
+    description:
+      Should be a phandle/number pair. The phandle to TSA node and the TSA
+      serial interface to use.
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^channel@([0-9]|[1-5][0-9]|6[0-3])$':
+    description:
+      A channel managed by this controller
+    type: object
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 63
+        description:
+          The channel number
+
+      fsl,operational-mode:
+        $ref: /schemas/types.yaml#/definitions/string
+        enum: [transparent, hdlc]
+        default: transparent
+        description: |
+          The channel operational mode
+            - hdlc: The channel handles HDLC frames
+            - transparent: The channel handles raw data without any processing
+
+      fsl,reverse-data:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          The bit order as seen on the channels is reversed,
+          transmitting/receiving the MSB of each octet first.
+          This flag is used only in 'transparent' mode.
+
+      fsl,tx-ts-mask:
+        $ref: /schemas/types.yaml#/definitions/uint64
+        description:
+          Channel assigned Tx time-slots within the Tx time-slots routed by the
+          TSA to this cell.
+
+      fsl,rx-ts-mask:
+        $ref: /schemas/types.yaml#/definitions/uint64
+        description:
+          Channel assigned Rx time-slots within the Rx time-slots routed by the
+          TSA to this cell.
+
+    required:
+      - reg
+      - fsl,tx-ts-mask
+      - fsl,rx-ts-mask
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - fsl,tsa-serial
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/cpm1-fsl,tsa.h>
+
+    qmc@a60 {
+        compatible = "fsl,mpc885-scc-qmc", "fsl,cpm1-scc-qmc";
+        reg = <0xa60 0x20>,
+              <0x3f00 0xc0>,
+              <0x2000 0x1000>;
+        reg-names = "scc_regs", "scc_pram", "dpram";
+        interrupts = <27>;
+        interrupt-parent = <&CPM_PIC>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        fsl,tsa-serial = <&tsa FSL_CPM_TSA_SCC4>;
+
+        channel@16 {
+            /* Ch16 : First 4 even TS from all routed from TSA */
+            reg = <16>;
+            fsl,mode = "transparent";
+            fsl,reverse-data;
+            fsl,tx-ts-mask = <0x00000000 0x000000aa>;
+            fsl,rx-ts-mask = <0x00000000 0x000000aa>;
+        };
+
+        channel@17 {
+            /* Ch17 : First 4 odd TS from all routed from TSA */
+            reg = <17>;
+            fsl,mode = "transparent";
+            fsl,reverse-data;
+            fsl,tx-ts-mask = <0x00000000 0x00000055>;
+            fsl,rx-ts-mask = <0x00000000 0x00000055>;
+        };
+
+        channel@19 {
+            /* Ch19 : 8 TS (TS 8..15) from all routed from TSA */
+            reg = <19>;
+            fsl,mode = "hdlc";
+            fsl,tx-ts-mask = <0x00000000 0x0000ff00>;
+            fsl,rx-ts-mask = <0x00000000 0x0000ff00>;
+        };
+    };
-- 
2.39.2

