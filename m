Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF7F3DAA0C
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 19:25:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF76A1F10;
	Thu, 29 Jul 2021 19:24:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF76A1F10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627579511;
	bh=bjs3Jw6qHAd9N6D/Obk6PW4tgQiHtTZpXrl6bsvLrGM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=II+DxLecrD5Rld6VJah1TmQ3BrLKGwD4t6DEIv8g4ivWPuLPy2Dkp4AkayZk3VslQ
	 iNeVNtZdEr0I5B3+jjQEXcTPtKzt8YiJyOzXixxB2KEwwoaN/CeFGVUIY4g12n/UvP
	 zjilVJB3FMVFUxau+oEHApIqt5sqcmdw6LuJw1x8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD3D7F804C1;
	Thu, 29 Jul 2021 19:23:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 213E8F804C1; Thu, 29 Jul 2021 19:23:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by alsa1.perex.cz (Postfix) with ESMTP id 9A70EF80258
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 19:23:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A70EF80258
X-IronPort-AV: E=Sophos;i="5.84,279,1620658800"; d="scan'208";a="89179390"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 30 Jul 2021 02:23:20 +0900
Received: from localhost.localdomain (unknown [10.226.92.2])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id CDE0C4016D49;
 Fri, 30 Jul 2021 02:23:17 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 1/3] ASoC: dt-bindings: Document RZ/G2L bindings
Date: Thu, 29 Jul 2021 18:23:09 +0100
Message-Id: <20210729172311.31111-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210729172311.31111-1-biju.das.jz@bp.renesas.com>
References: <20210729172311.31111-1-biju.das.jz@bp.renesas.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Chris Brandt <chris.brandt@renesas.com>
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

Document RZ/G2L ASoC serial sound interface bindings.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Note:-
 This base series for this patch is Linux 5.14-rc2(or +) otherwise bots would 
 complain about check failure

v2->v3:
 * Merged the binding patch with dmas added
 * Updated dt binding example with encoded #dma-cells value.
v1->v2:
 * Rebased on 5.14-rc2.
---
 .../bindings/sound/renesas,rz-ssi.yaml        | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml

diff --git a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
new file mode 100644
index 000000000000..9923e7b8264f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/renesas,rz-ssi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G2L ASoC Sound Serial Interface (SSIF-2)
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r9a07g044-ssi  # RZ/G2{L,LC}
+      - const: renesas,rz-ssi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 4
+
+  interrupt-names:
+    items:
+      - const: int_req
+      - const: dma_rx
+      - const: dma_tx
+      - const: dma_rt
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: ssi
+      - const: ssi_sfr
+      - const: audio_clk1
+      - const: audio_clk2
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  dmas:
+    minItems: 1
+    maxItems: 2
+
+  dma-names:
+    oneOf:
+      - items:
+          - const: tx
+          - const: rx
+      - items:
+          - const: rt
+
+  '#sound-dai-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - resets
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/r9a07g044-cpg.h>
+
+    ssi0: ssi@10049c00 {
+        compatible = "renesas,r9a07g044-ssi",
+                     "renesas,rz-ssi";
+            reg = <0x10049c00 0x400>;
+            interrupts = <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 327 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 328 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 329 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "int_req", "dma_rx", "dma_tx", "dma_rt";
+            clocks = <&cpg CPG_MOD R9A07G044_SSI0_PCLK2>,
+                     <&cpg CPG_MOD R9A07G044_SSI0_PCLK_SFR>,
+                     <&audio_clk1>,
+                     <&audio_clk2>;
+            clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
+            power-domains = <&cpg>;
+            resets = <&cpg R9A07G044_SSI0_RST_M2_REG>;
+            dmas = <&dmac 0x2655>,
+                   <&dmac 0x2656>;
+            dma-names = "tx", "rx";
+            #sound-dai-cells = <0>;
+    };
-- 
2.17.1

