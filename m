Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9363F157A
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Aug 2021 10:45:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 498E81695;
	Thu, 19 Aug 2021 10:44:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 498E81695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629362749;
	bh=WE5kr48GkY1d8NyvUtM0FMlxVFjdI1fwcHOr94ioOds=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zrlx1rf8d0KjzLRkDrhZTdML9wkT6UIWCU/SO+OhJjHFTGzusUP7ZfMfSE3+e+8d0
	 kFs52gJN+crhNsPZfc8PeCLx2hmDRtbX7+gwW54NhE5kGXpm2acX61NIin5zKykpXe
	 +a6qaT9/brCbOVtuF19oGnG3Z8tl0X0rlRhHTeco=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77767F80272;
	Thu, 19 Aug 2021 10:43:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC15CF804E7; Thu, 19 Aug 2021 10:43:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1E96F8026D
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 10:43:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1E96F8026D
X-UUID: 9692af835df5425c8fa686c94e8177ad-20210819
X-UUID: 9692af835df5425c8fa686c94e8177ad-20210819
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 221413215; Thu, 19 Aug 2021 16:43:11 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Aug 2021 16:43:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 19 Aug 2021 16:43:09 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
 <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [PATCH v5 07/11] dt-bindings: mediatek: mt8195: add audio afe document
Date: Thu, 19 Aug 2021 16:41:40 +0800
Message-ID: <20210819084144.18483-8-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210819084144.18483-1-trevor.wu@mediatek.com>
References: <20210819084144.18483-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, bicycle.tsai@mediatek.com, linux-kernel@vger.kernel.org,
 jiaxin.yu@mediatek.com, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, wenst@chromium.org, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org
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

This patch adds mt8195 audio afe document.

In order to support dynamic clock reparenting for ADDA and ETDM, PLL
and MUX clocks are requested even though they are not consumed by afe
directly.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
This patch depends on the following series that have not been accepted.

[1] Mediatek MT8195 clock support
https://patchwork.kernel.org/project/linux-mediatek/list/?series=501923
(dt-bindings/clock/mt8195-clk.h is included)

[2] Mediatek MT8195 power domain support
https://patchwork.kernel.org/project/linux-mediatek/list/?series=500709
(dt-bindings/power/mt8195-power.h is included)
---
---
 .../bindings/sound/mt8195-afe-pcm.yaml        | 184 ++++++++++++++++++
 1 file changed, 184 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
new file mode 100644
index 000000000000..53e9434a6d9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
@@ -0,0 +1,184 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mt8195-afe-pcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek AFE PCM controller for mt8195
+
+maintainers:
+  - Trevor Wu <trevor.wu@mediatek.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8195-audio
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  mediatek,topckgen:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of the mediatek topckgen controller
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
+      - description: audio infra 26M clock
+      - description: infra bus clock
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
+      - const: infra_ao_audio_26m_b
+      - const: scp_adsp_audiodsp
+
+  mediatek,etdm-in1-chn-disabled:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    maxItems: 24
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
+  - mediatek,topckgen
+  - power-domains
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mt8195-power.h>
+
+    afe: mt8195-afe-pcm@10890000 {
+        compatible = "mediatek,mt8195-audio";
+        reg = <0x10890000 0x10000>;
+        interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH 0>;
+        mediatek,topckgen = <&topckgen>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_AUDIO>;
+        clocks = <&clk26m>,
+                 <&topckgen CLK_TOP_APLL1>,
+                 <&topckgen CLK_TOP_APLL2>,
+                 <&topckgen CLK_TOP_APLL12_DIV0>,
+                 <&topckgen CLK_TOP_APLL12_DIV1>,
+                 <&topckgen CLK_TOP_APLL12_DIV2>,
+                 <&topckgen CLK_TOP_APLL12_DIV3>,
+                 <&topckgen CLK_TOP_APLL12_DIV9>,
+                 <&topckgen CLK_TOP_A1SYS_HP_SEL>,
+                 <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
+                 <&topckgen CLK_TOP_AUDIO_H_SEL>,
+                 <&topckgen CLK_TOP_AUDIO_LOCAL_BUS_SEL>,
+                 <&topckgen CLK_TOP_DPTX_M_SEL>,
+                 <&topckgen CLK_TOP_I2SO1_M_SEL>,
+                 <&topckgen CLK_TOP_I2SO2_M_SEL>,
+                 <&topckgen CLK_TOP_I2SI1_M_SEL>,
+                 <&topckgen CLK_TOP_I2SI2_M_SEL>,
+                 <&infracfg_ao CLK_INFRA_AO_AUDIO_26M_B>,
+                 <&scp_adsp CLK_SCP_ADSP_AUDIODSP>;
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
+                      "infra_ao_audio_26m_b",
+                      "scp_adsp_audiodsp";
+    };
+
+...
-- 
2.18.0

