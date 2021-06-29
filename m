Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 000EA3B6C46
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Jun 2021 03:50:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EC87169B;
	Tue, 29 Jun 2021 03:49:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EC87169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624931438;
	bh=+bHZR8XGylzwqkGtSrvskWx5bIIv8VBzXW7BVOzrhKE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YI3XIHBqxwSs0zLLJR1esJ9BCViPPM/0GQCvbdvnDKeTzf4ABGmLFvuEC2iz/0TKD
	 +t0/xlUn9PeI9wS/BtB388oc+Dn1Mmloy/5d6Vp9oyo2+1PVdMPPTfa+EdCnZ7zkzI
	 fv3FyyhcNYXJps8o4vfZN3vzFSKdVmVaAlp0Xdhg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 019A5F804E3;
	Tue, 29 Jun 2021 03:48:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CACEBF804D6; Tue, 29 Jun 2021 03:48:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7BB6F80259
 for <alsa-devel@alsa-project.org>; Tue, 29 Jun 2021 03:48:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7BB6F80259
X-UUID: e01f0acc8f564f299e194a32c7026b01-20210629
X-UUID: e01f0acc8f564f299e194a32c7026b01-20210629
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 566307297; Tue, 29 Jun 2021 09:47:53 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Jun 2021 09:47:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 29 Jun 2021 09:47:52 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH v2 6/8] dt-bindings: mediatek: mt8195: add audio afe document
Date: Tue, 29 Jun 2021 09:47:34 +0800
Message-ID: <20210629014736.31153-7-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210629014736.31153-1-trevor.wu@mediatek.com>
References: <20210629014736.31153-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, bicycle.tsai@mediatek.com, linux-kernel@vger.kernel.org,
 jiaxin.yu@mediatek.com, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, aaronyu@google.com,
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
 .../bindings/sound/mt8195-afe-pcm.yaml        | 136 ++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
new file mode 100644
index 000000000000..a4fb5c7dd022
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
@@ -0,0 +1,136 @@
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
+      - description: audio 26M clock
+      - description: AFE clock
+      - description: audio infra sys clock
+      - description: audio infra 26M clock
+
+  clock-names:
+    items:
+      - const: clk26m
+      - const: aud_afe
+      - const: infra_ao_audio
+      - const: infra_ao_audio_26m_b
+
+  etdm-in1-chn-disabled:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    maxItems: 24
+    description: Specify which input channel should be disabled.
+
+  etdm-in2-chn-disabled:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    maxItems: 16
+    description: Specify which input channel should be disabled.
+
+patternProperties:
+  "^etdm-in[1-2]-mclk-source$":
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Specify etdm in mclk source clock.
+    enum:
+      - 0 # xtal_26m_ck
+      - 1 # apll1_ck
+      - 2 # apll2_ck
+      - 3 # apll3_ck
+      - 4 # apll4_ck
+      - 5 # apll5_ck
+      - 6 # hdmirx_apll_ck
+
+  "^etdm-out[1-3]-mclk-source$":
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Specify etdm out mclk source clock.
+
+  "^etdm-in[1-2]-mclk-alwasys-on-rate$":
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Specify etdm in mclk output rate for always on case.
+
+  "^etdm-out[1-3]-mclk-alwasys-on-rate$":
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Specify etdm out mclk output rate for always on case.
+
+  "^etdm-in[1-2]-data-mode$":
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Specify etdm in data mode.
+    enum:
+      - 0 # one pin (TDM)
+      - 1 # multi pin (I2S)
+
+  "^etdm-out[1-3]-data-mode$":
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Specify etdm out data mode.
+
+  "^etdm-in[1-2]-cowork-source$":
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      etdm modules can share the same external clock pin. Specify
+      which etdm clock source is required by this etdm in moudule.
+    enum:
+      - 0 # etdm1_in
+      - 1 # etdm2_in
+      - 2 # etdm1_out
+      - 3 # etdm2_out
+      - 4 # etdm3_out
+
+  "^etdm-out[1-3]-cowork-source$":
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      etdm modules can share the same external clock pin. Specify
+      which etdm clock source is required by this etdm out moudule.
+
+required:
+  - compatible
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
+    afe: mt8195-afe-pcm {
+        compatible = "mediatek,mt8195-audio";
+        interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH 0>;
+        mediatek,topckgen = <&topckgen>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_AUDIO>;
+        clocks = <&clk26m>,
+                 <&audsys CLK_AUD_AFE>,
+                 <&infracfg_ao CLK_INFRA_AO_AUDIO>,
+                 <&infracfg_ao CLK_INFRA_AO_AUDIO_26M_B>;
+        clock-names = "clk26m",
+                      "aud_afe",
+                      "infra_ao_audio",
+                      "infra_ao_audio_26m_b";
+    };
+
+...
-- 
2.18.0

