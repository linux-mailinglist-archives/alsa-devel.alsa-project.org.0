Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39786443FFC
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Nov 2021 11:28:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C20DC1674;
	Wed,  3 Nov 2021 11:27:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C20DC1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635935325;
	bh=aQjT/5ocBF+9rvi2orNsQGkq8iYAzQMG0gP3IR1JQrE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BkAuvt8vwQ0NwNBQgQo5m8GIjoytpsxDBpplXlvThyRB8oXuDibDOdokPHNYI0l9L
	 exMrwjvBWm2KT38obgMIs0jBIeygty8XTijcKU5DfaM1illd9m/r0XkiyzJnrlmxyw
	 7r8NeUKD1iuaWviyB6jKoJhnGAS1sw6DMw+Kq0PE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28683F800D2;
	Wed,  3 Nov 2021 11:27:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BF63F80269; Wed,  3 Nov 2021 11:27:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FE74F800FA
 for <alsa-devel@alsa-project.org>; Wed,  3 Nov 2021 11:27:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FE74F800FA
X-UUID: 8126625b3e3647bd9a9fa4d596dc9ff1-20211103
X-UUID: 8126625b3e3647bd9a9fa4d596dc9ff1-20211103
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <yc.hung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 782488194; Wed, 03 Nov 2021 18:27:12 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 3 Nov 2021 18:27:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs10n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 3 Nov 2021 18:27:11 +0800
From: YC Hung <yc.hung@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH v5] dt-bindings: dsp: mediatek: Add mt8195 DSP binding support
Date: Wed, 3 Nov 2021 18:26:08 +0800
Message-ID: <20211103102607.12277-1-yc.hung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 allen-kh.cheng@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 yc.hung@mediatek.com, daniel.baluta@nxp.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

From: "yc.hung" <yc.hung@mediatek.com>

This describes the mt8195 DSP device tree node.

Signed-off-by: yc.hung <yc.hung@mediatek.com>
---
Changes since v4:
  - remove patch 1 with clocks as it will be reviewed and merged to SOF tree.
    https://github.com/thesofproject/linux/pull/3237
  - refine DT file binding files with Rob's comments.

 .../bindings/dsp/mtk,mt8195-dsp.yaml          | 142 ++++++++++++++++++
 1 file changed, 142 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml

diff --git a/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml b/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
new file mode 100644
index 000000000000..aeeb7af69625
--- /dev/null
+++ b/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
@@ -0,0 +1,142 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dsp/mtk,mt8195-dsp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek mt8195 DSP core
+
+maintainers:
+  - YC Hung <yc.hung@mediatek.com>
+
+description: |
+  Some boards from mt8195 contain a DSP core used for
+  advanced pre- and post- audio processing.
+properties:
+  compatible:
+    const: mediatek,mt8195-dsp
+
+  reg:
+    items:
+      - description: Address and size of the DSP Cfg registers
+      - description: Address and size of the DSP SRAM
+
+  reg-names:
+    items:
+      - const: cfg
+      - const: sram
+
+  interrupts:
+    items:
+      - description: watchdog interrupt
+
+  interrupt-names:
+    items:
+      - const: wdt
+
+  clocks:
+    items:
+      - description: mux for audio dsp clock
+      - description: 26M clock
+      - description: mux for audio dsp local bus
+      - description: default audio dsp local bus clock source
+      - description: clock gate for audio dsp clock
+      - description: mux for audio dsp access external bus
+
+  clock-names:
+    items:
+      - const: adsp_sel
+      - const: clk26m_ck
+      - const: audio_local_bus
+      - const: mainpll_d7_d2
+      - const: scp_adsp_audiodsp
+      - const: audio_h
+
+  power-domains:
+    maxItems: 1
+
+  mboxes:
+    items:
+      - description: a mailbox is ised for ipc reply between host and audio DSP.
+      - description: a mailbox is ised for ipc reuqest between host and audio DSP.
+
+  mbox-names:
+    items:
+      - const: mbox0
+      - const: mbox1
+
+  memory-region:      
+    items:
+      - description: A phandle to a reserved memory region is used for dma buffer between host and DSP.   
+      - description: A phandle to a reserved memory region is used for DSP system memory.
+
+  sound:
+    description:
+      Sound subnode includes ASoC platform, DPTx codec node, and
+      HDMI codec node.
+
+    type: object
+
+    properties:
+      mediatek,platform:
+        $ref: "/schemas/types.yaml#/definitions/phandle"
+        description: The phandle of MT8195 ASoC platform.
+
+      mediatek,dptx-codec:
+        $ref: "/schemas/types.yaml#/definitions/phandle"
+        description: The phandle of MT8195 Display Port Tx codec node.
+
+      mediatek,hdmi-codec:
+        $ref: "/schemas/types.yaml#/definitions/phandle"
+        description: The phandle of MT8195 HDMI codec node.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - memory-region
+  - power-domains
+  - mbox-names
+  - mboxes
+  - sound
+
+additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    adsp: dsp@10803000 {
+       compatible =  "mediatek,mt8195-dsp";
+       reg = <0x10803000  0x1000>,
+             <0x10840000  0x40000>;
+       reg-names = "cfg", "sram";
+       interrupts = <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH 0>;
+       interrupt-names = "wdt";
+       clocks = <&topckgen 10>, //CLK_TOP_ADSP
+                <&clk26m>,
+                <&topckgen 107>, //CLK_TOP_AUDIO_LOCAL_BUS
+                <&topckgen 136>, //CLK_TOP_MAINPLL_D7_D2
+                <&scp_adsp 0>, //CLK_SCP_ADSP_AUDIODSP
+                <&topckgen 34>; //CLK_TOP_AUDIO_H
+       clock-names = "adsp_sel",
+                     "clk26m_ck",
+                     "audio_local_bus",
+                     "mainpll_d7_d2",
+                     "scp_adsp_audiodsp",
+                     "audio_h";
+       memory-region = <&adsp_dma_mem_reserved>,
+                       <&adsp_mem_reserved>;
+       power-domains = <&spm 6>; //MT8195_POWER_DOMAIN_ADSP
+       mbox-names = "mbox0", "mbox1";
+       mboxes = <&adsp_mailbox 0>, <&adsp_mailbox 1>;
+       sound {
+              mediatek,dptx-codec = <&dp_tx>;
+              mediatek,hdmi-codec = <&hdmi0>;
+              mediatek,platform = <&afe>;
+             };
+       };
-- 
2.18.0

