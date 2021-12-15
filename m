Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 873A147514F
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 04:21:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16F141F9C;
	Wed, 15 Dec 2021 04:20:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16F141F9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639538493;
	bh=7Lp4emORW98Q/0qO4EBo2wTbYE3eCAnFiNSLPqwfi30=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=u8Tz79W0nzwF5nmO3kCGbLh3y5CEMmKfPKDw3VHcpH43sHy3lpLL4YmwvaXuUMJ2j
	 pz//EeO0UE9zUbYqWoj4TmTrmgepa+wATnBZDW4a8SN8xmMiydOq5w4kcOpzK9L1iR
	 DoMYiCKLxYPyCaJ5gZM0wqCATvDCFhbelwq6+jbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92973F8025F;
	Wed, 15 Dec 2021 04:20:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7102DF8025D; Wed, 15 Dec 2021 04:20:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FA04F800FE
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 04:20:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FA04F800FE
X-UUID: 6bf2cf4628284c88992b4cd6e01176af-20211215
X-UUID: 6bf2cf4628284c88992b4cd6e01176af-20211215
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <yc.hung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 82201096; Wed, 15 Dec 2021 11:20:06 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Dec 2021 11:20:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 15 Dec 2021 11:20:05 +0800
From: YC Hung <yc.hung@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH] dt-bindings: dsp: mediatek: add mt8195 dsp document
Date: Wed, 15 Dec 2021 11:19:55 +0800
Message-ID: <20211215031955.28244-1-yc.hung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 allen-kh.cheng@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 yc.hung@mediatek.com, daniel.baluta@nxp.com,
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

From: "yc.hung" <yc.hung@mediatek.com>

This patch adds mt8195 dsp document.

Signed-off-by: yc.hung <yc.hung@mediatek.com>
---
 .../bindings/dsp/mtk,mt8195-dsp.yaml          | 116 ++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml

diff --git a/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml b/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
new file mode 100644
index 000000000000..33db11ee2336
--- /dev/null
+++ b/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
@@ -0,0 +1,116 @@
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
+
+additionalProperties: false
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
+       mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
+       };
-- 
2.18.0

