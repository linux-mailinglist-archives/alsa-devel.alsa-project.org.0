Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA91478571
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 08:11:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E297E1FA;
	Fri, 17 Dec 2021 08:10:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E297E1FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639725094;
	bh=7GacaDjTr1zV7Hh9tHhnvxZ7itoNRjLETOu8/F0+Pas=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MtxCI/9xtOogvGTi/MPyHrekCnkdMDP0Vfh27v4i9hniQRnN/fWbt0k87Q1b3VdZM
	 HDcEijxX6hGZ1/yflyYYNW8KKHWCvRR4hPM0HTl445aAXLbuYub63lirAVAZAExHu2
	 3P4iefr0K1ACIlEN9IYhq3QN2lDafqYb/gIgydy8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28F16F80161;
	Fri, 17 Dec 2021 08:10:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C734F80148; Fri, 17 Dec 2021 08:10:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 568B6F800F4
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 08:10:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 568B6F800F4
X-UUID: 4f987f8f002e4082a72095499efcb516-20211217
X-UUID: 4f987f8f002e4082a72095499efcb516-20211217
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <yc.hung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2043702097; Fri, 17 Dec 2021 15:10:04 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Dec 2021 15:10:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 17 Dec 2021 15:10:02 +0800
From: YC Hung <yc.hung@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH v2] dt-bindings: dsp: mediatek: add mt8195 dsp document
Date: Fri, 17 Dec 2021 15:08:36 +0800
Message-ID: <20211217070835.31709-1-yc.hung@mediatek.com>
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
Changes since v1:
  Rename yaml file name as mediatek,mt8195-dsp.yaml
  Refine descriptions for mailbox, memory-region and drop unused labels
  in examples.
---
 .../bindings/dsp/mediatek,mt8195-dsp.yaml     | 117 ++++++++++++++++++
 1 file changed, 117 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml

diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
new file mode 100644
index 000000000000..bde763191d86
--- /dev/null
+++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dsp/mediatek,mt8195-dsp.yaml#
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
+
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
+      - description: ipc reply between host and audio DSP.
+      - description: ipc reuqest between host and audio DSP.
+
+  mbox-names:
+    items:
+      - const: mbox0
+      - const: mbox1
+
+  memory-region:      
+    items:
+      - description: dma buffer between host and DSP.   
+      - description: DSP system memory.
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
+    dsp@10803000 {
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
+    };
-- 
2.18.0

