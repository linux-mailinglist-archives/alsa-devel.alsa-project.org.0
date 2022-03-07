Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2534CF99E
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 11:08:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C9141706;
	Mon,  7 Mar 2022 11:07:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C9141706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646647679;
	bh=9sVz8A6/3pKzsSyKWMfc35MVS+ww7R2A8G94llrGlNU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o8RieJB1RSK9gUkMWRPltY1FSouUuKboEY1R0EmlgLmzliE2EntKp6n7f5gZTn6fZ
	 GlAm2I27SneOZPV53BWS9t9BYyONLEXeVNpz0autpMLFviHL5u/3kCZM/bMcEEEhRG
	 egVEA947TP+9+P8fcrT2F6s4Tcs8R9Agg+MO55eM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1727CF80526;
	Mon,  7 Mar 2022 11:06:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED073F80526; Mon,  7 Mar 2022 11:06:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 390AEF8013F
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 11:06:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 390AEF8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="LV0zb8Vk"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646647575; x=1678183575;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9sVz8A6/3pKzsSyKWMfc35MVS+ww7R2A8G94llrGlNU=;
 b=LV0zb8Vkfw/76gn6znPNoOJC10+p/z+dw5hHTmMYv65rTyLHsSv9Ett1
 ZeIRjksERiW7F69kgnTjvFNAWYnI83lmGoSxRIkVqSroPIAlIn3nzgH5d
 dwUNYp5gh0uiDM+DMSwybJ0dchKw4or/AoQ9gchSaPfJN0FS5/7FuGbKr
 uzSJ0bP+2sTlEQMYghgw0M27cGZaDUDy7J9QxUSXeR6T3chBJzSghcQmc
 PWtFcnqoHz5gNR8uzqwCu9cuRey1SX2vAFeLo9wrWbS7BTa6zbQ6Vh795
 n/k/zbS1K9kwVruxpv2f4vS5aswWqwJdW3is8n0ugs/edtiTfrPk7HNNU Q==;
X-IronPort-AV: E=Sophos;i="5.90,161,1643698800"; d="scan'208";a="88045533"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Mar 2022 03:06:11 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 7 Mar 2022 03:06:02 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 7 Mar 2022 03:05:59 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 2/6] ASoC: dt-bindings: Document Microchip's PDMC
Date: Mon, 7 Mar 2022 12:04:24 +0200
Message-ID: <20220307100428.2227511-3-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220307100428.2227511-1-codrin.ciubotariu@microchip.com>
References: <20220307100428.2227511-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: lars@metafoo.de, nicolas.ferre@microchip.com, robh+dt@kernel.org,
 tiwai@suse.com, broonie@kernel.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
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

Add DT bindings for the new Microchip PDMC embedded in sama7g5 SoCs.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---

Changes in v2:
 - renamed patch from 'ASoC: add DT bindings for Microchip PDMC' to
   'ASoC: dt-bindings: Document Microchip's PDMC';
 - renamed yaml file from 'mchp,pdmc.yaml' to 'microchip,pdmc.yaml';
 - used imperative mode in commit description;
 - renamed mchp,pdmc.h to microchip,pdmc.h;
 - fixed 'title' to represent HW;
 - made 'compatible' first property;
 - s/microhpone/microphone;
 - none name in example set to 'sound';

 .../bindings/sound/microchip,pdmc.yaml        | 99 +++++++++++++++++++
 include/dt-bindings/sound/microchip,pdmc.h    | 13 +++
 2 files changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/microchip,pdmc.yaml
 create mode 100644 include/dt-bindings/sound/microchip,pdmc.h

diff --git a/Documentation/devicetree/bindings/sound/microchip,pdmc.yaml b/Documentation/devicetree/bindings/sound/microchip,pdmc.yaml
new file mode 100644
index 000000000000..edfa3cbd318e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/microchip,pdmc.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/microchip,pdmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip Pulse Density Microphone Controller
+
+maintainers:
+  - Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
+
+description:
+  The Microchip Pulse Density Microphone Controller (PDMC) interfaces up to 4 digital microphones
+  having Pulse Density Modulated (PDM) outputs.
+
+properties:
+  compatible:
+    const: microchip,sama7g5-pdmc
+
+  "#sound-dai-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Peripheral Bus Clock
+      - description: Generic Clock
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: gclk
+
+  dmas:
+    description: RX DMA Channel
+    maxItems: 1
+
+  dma-names:
+    const: rx
+
+  microchip,mic-pos:
+    description: |
+      Position of PDM microphones on the DS line and the sampling edge (rising or falling) of the
+      CLK line. A microphone is represented as a pair of DS line and the sampling edge. The first
+      microphone is mapped to channel 0, the second to channel 1, etc.
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      items:
+        - description: value for DS line
+        - description: value for sampling edge
+      anyOf:
+        - enum:
+            - [0, 0]
+            - [0, 1]
+            - [1, 0]
+            - [1, 1]
+    minItems: 1
+    maxItems: 4
+    uniqueItems: true
+
+required:
+  - compatible
+  - "#sound-dai-cells"
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - dmas
+  - dma-names
+  - microchip,mic-pos
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/dma/at91.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/sound/microchip,pdmc.h>
+
+    pdmc: sound@e1608000 {
+        compatible = "microchip,sama7g5-pdmc";
+        #sound-dai-cells = <0>;
+        reg = <0xe1608000 0x4000>;
+        interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+        dmas = <&dma0 AT91_XDMAC_DT_PERID(37)>;
+        dma-names = "rx";
+        clocks = <&pmc PMC_TYPE_PERIPHERAL 68>, <&pmc PMC_TYPE_GCK 68>;
+        clock-names = "pclk", "gclk";
+        microchip,mic-pos = <MCHP_PDMC_DS0 MCHP_PDMC_CLK_POSITIVE>,
+                            <MCHP_PDMC_DS0 MCHP_PDMC_CLK_NEGATIVE>,
+                            <MCHP_PDMC_DS1 MCHP_PDMC_CLK_POSITIVE>,
+                            <MCHP_PDMC_DS1 MCHP_PDMC_CLK_NEGATIVE>;
+    };
diff --git a/include/dt-bindings/sound/microchip,pdmc.h b/include/dt-bindings/sound/microchip,pdmc.h
new file mode 100644
index 000000000000..96cde94ce74f
--- /dev/null
+++ b/include/dt-bindings/sound/microchip,pdmc.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __DT_BINDINGS_MICROCHIP_PDMC_H__
+#define __DT_BINDINGS_MICROCHIP_PDMC_H__
+
+/* PDM microphone's pin placement */
+#define MCHP_PDMC_DS0 0
+#define MCHP_PDMC_DS1 1
+
+/* PDM microphone clock edge sampling */
+#define MCHP_PDMC_CLK_POSITIVE 0
+#define MCHP_PDMC_CLK_NEGATIVE 1
+
+#endif /* __DT_BINDINGS_MICROCHIP_PDMC_H__ */
-- 
2.32.0

