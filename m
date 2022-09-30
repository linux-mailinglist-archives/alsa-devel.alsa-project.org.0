Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 285005F0E4C
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 16:59:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8994216C0;
	Fri, 30 Sep 2022 16:58:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8994216C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664549984;
	bh=4G66i3EAukfMvaq9o0cIG1a3xLyCiHf2HNsBKDZnRK0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SoEVKl4lYSjCYFPRD+7xiQmDYut2H+hYzbTFGXluhdAB3cTdJr2BwfXV10KdLIgR5
	 cKbuiKD84YPPvjRwXOGSMrCRfEGZSw2ZtpAgENla9dlG8QRDG9ZEIBVHveFTbeOgHo
	 /DL1SuSW/t/0A0jS5HCT+inWiHnecUfIFeipfB0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0009F80566;
	Fri, 30 Sep 2022 16:57:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EAC0F80549; Fri, 30 Sep 2022 16:57:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB519F801D5
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 16:57:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB519F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="U4gHEuqq"
X-UUID: 285e0f203dfb4a44a787701c2c0de67e-20220930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2MpSAXro199pDAObudqn3138avkHElbHRrkP+Wrt1zc=; 
 b=U4gHEuqqjXDzEOLP9wxGK3j6gtKCol02Jnh7Y9W79nVH5/sOc2dnr6XlmekeL8spe1Pucktbc4cPkF2K1F9fg1bMMixpj2TlIQ9eOXOdDEsQ9MgIL3AfFz2/XXqU7EE6uJW2ZJhKRubSaH9IgHV7trqY2I3weTyBiE3+KjPN4xc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:8e569b46-7020-4640-aa4a-a6b7a43b8f6c, IP:0,
 U
 RL:25,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACT
 ION:release,TS:95
X-CID-INFO: VERSION:1.1.11, REQID:8e569b46-7020-4640-aa4a-a6b7a43b8f6c, IP:0,
 URL
 :25,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACT
 ION:quarantine,TS:95
X-CID-META: VersionHash:39a5ff1, CLOUDID:ef0bcde4-87f9-4bb0-97b6-34957dc0fbbe,
 B
 ulkID:220930225711XUGLF4QO,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48|823|
 824,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:n
 il,COL:0
X-UUID: 285e0f203dfb4a44a787701c2c0de67e-20220930
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 219587636; Fri, 30 Sep 2022 22:57:10 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 30 Sep 2022 22:57:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 30 Sep 2022 22:57:09 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>
Subject: [PATCH 10/12] dt-bindings: mediatek: mt8188: add audio afe document
Date: Fri, 30 Sep 2022 22:56:59 +0800
Message-ID: <20220930145701.18790-11-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220930145701.18790-1-trevor.wu@mediatek.com>
References: <20220930145701.18790-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, linux-arm-kernel@lists.infradead.org
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

Add mt8188 audio afe document.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../bindings/sound/mt8188-afe-pcm.yaml        | 202 ++++++++++++++++++
 1 file changed, 202 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml
new file mode 100644
index 000000000000..50d53c5d59ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml
@@ -0,0 +1,202 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mt8188-afe-pcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek AFE PCM controller for mt8188
+
+maintainers:
+  - Trevor Wu <trevor.wu@mediatek.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8188-audio
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: audiosys
+
+  memory-region:
+    maxItems: 1
+    description: |
+      Shared memory region for AFE memif.  A "shared-dma-pool".
+      See ../reserved-memory/reserved-memory.txt for details.
+
+  mediatek,topckgen:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of the mediatek topckgen controller
+
+  mediatek,infracfg:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of the mediatek infracfg controller
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: 26M clock
+      - description: audio pll1 clock
+      - description: audio pll2 clock
+      - description: clock divider for i2si1_mck
+      - description: clock divider for i2si2_mck
+      - description: clock divider for i2so1_mck
+      - description: clock divider for i2so2_mck
+      - description: clock divider for dptx_mck
+      - description: a1sys hoping clock
+      - description: audio intbus clock
+      - description: audio hires clock
+      - description: audio local bus clock
+      - description: mux for dptx_mck
+      - description: mux for i2so1_mck
+      - description: mux for i2so2_mck
+      - description: mux for i2si1_mck
+      - description: mux for i2si2_mck
+      - description: audio 26m clock
+
+  clock-names:
+    items:
+      - const: clk26m
+      - const: apll1_ck
+      - const: apll2_ck
+      - const: apll12_div0
+      - const: apll12_div1
+      - const: apll12_div2
+      - const: apll12_div3
+      - const: apll12_div9
+      - const: a1sys_hp_sel
+      - const: aud_intbus_sel
+      - const: audio_h_sel
+      - const: audio_local_bus_sel
+      - const: dptx_m_sel
+      - const: i2so1_m_sel
+      - const: i2so2_m_sel
+      - const: i2si1_m_sel
+      - const: i2si2_m_sel
+      - const: adsp_audio26m
+
+  mediatek,etdm-in1-chn-disabled:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    maxItems: 16
+    description: Specify which input channel should be disabled.
+
+  mediatek,etdm-in2-chn-disabled:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    maxItems: 16
+    description: Specify which input channel should be disabled.
+
+patternProperties:
+  "^mediatek,etdm-in[1-2]-mclk-always-on-rate-hz$":
+    description: Specify etdm in mclk output rate for always on case.
+
+  "^mediatek,etdm-out[1-3]-mclk-always-on-rate-hz$":
+    description: Specify etdm out mclk output rate for always on case.
+
+  "^mediatek,etdm-in[1-2]-multi-pin-mode$":
+    type: boolean
+    description: if present, the etdm data mode is I2S.
+
+  "^mediatek,etdm-out[1-3]-multi-pin-mode$":
+    type: boolean
+    description: if present, the etdm data mode is I2S.
+
+  "^mediatek,etdm-in[1-2]-cowork-source$":
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      etdm modules can share the same external clock pin. Specify
+      which etdm clock source is required by this etdm in moudule.
+    enum:
+      - 0 # etdm1_in
+      - 1 # etdm2_in
+      - 2 # etdm1_out
+      - 3 # etdm2_out
+
+  "^mediatek,etdm-out[1-2]-cowork-source$":
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      etdm modules can share the same external clock pin. Specify
+      which etdm clock source is required by this etdm out moudule.
+    enum:
+      - 0 # etdm1_in
+      - 1 # etdm2_in
+      - 2 # etdm1_out
+      - 3 # etdm2_out
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - resets
+  - reset-names
+  - mediatek,topckgen
+  - mediatek,infracfg
+  - power-domains
+  - clocks
+  - clock-names
+  - memory-region
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    afe: afe@10b10000 {
+        compatible = "mediatek,mt8188-audio";
+        reg = <0x10b10000 0x10000>;
+        interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH 0>;
+        resets = <&watchdog 14>;
+        reset-names = "audiosys";
+        mediatek,topckgen = <&topckgen>;
+        mediatek,infracfg = <&infracfg_ao>;
+        power-domains = <&spm 7>; //MT8195_POWER_DOMAIN_AUDIO
+        memory-region = <&snd_dma_mem_reserved>;
+        clocks = <&clk26m>,
+                 <&topckgen 72>, //CLK_TOP_APLL1
+                 <&topckgen 73>, //CLK_TOP_APLL2
+                 <&topckgen 186>, //CLK_TOP_APLL12_CK_DIV0
+                 <&topckgen 187>, //CLK_TOP_APLL12_CK_DIV1
+                 <&topckgen 188>, //CLK_TOP_APLL12_CK_DIV2
+                 <&topckgen 189>, //CLK_TOP_APLL12_CK_DIV3
+                 <&topckgen 191>, //CLK_TOP_APLL12_CK_DIV9
+                 <&topckgen 83>, //CLK_TOP_A1SYS_HP
+                 <&topckgen 31>, //CLK_TOP_AUD_INTBUS
+                 <&topckgen 32>, //CLK_TOP_AUDIO_H
+                 <&topckgen 69>, //CLK_TOP_AUDIO_LOCAL_BUS
+                 <&topckgen 81>, //CLK_TOP_DPTX
+                 <&topckgen 77>, //CLK_TOP_I2SO1
+                 <&topckgen 78>, //CLK_TOP_I2SO2
+                 <&topckgen 79>, //CLK_TOP_I2SI1
+                 <&topckgen 80>, //CLK_TOP_I2SI2
+                 <&adsp_audio26m 0>; //CLK_AUDIODSP_AUDIO26M
+        clock-names = "clk26m",
+                      "apll1_ck",
+                      "apll2_ck",
+                      "apll12_div0",
+                      "apll12_div1",
+                      "apll12_div2",
+                      "apll12_div3",
+                      "apll12_div9",
+                      "a1sys_hp_sel",
+                      "aud_intbus_sel",
+                      "audio_h_sel",
+                      "audio_local_bus_sel",
+                      "dptx_m_sel",
+                      "i2so1_m_sel",
+                      "i2so2_m_sel",
+                      "i2si1_m_sel",
+                      "i2si2_m_sel",
+                      "adsp_audio_26m";
+    };
+
+...
-- 
2.18.0

