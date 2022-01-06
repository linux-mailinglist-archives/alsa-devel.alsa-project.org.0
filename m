Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BB14860B8
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jan 2022 07:50:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7967C17EB;
	Thu,  6 Jan 2022 07:50:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7967C17EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641451859;
	bh=fHLrUD11B0b4ZcKMECt8MZJ62ooiQtguvgprdtC4SOI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PmY7E6OoR1LNdhmNi62NOS2D+CdiFN+C+fnLlXaSNbTTWe/8+Tr1q0vHZnMDyzX2N
	 ZGxDUEhkSw6ip7O634t/nlW4T+D3QciAbjZURgfyGKILlcGVnsUiuzoUZfvyDJywbC
	 bTA2CzCWbToqFsrsHPbecMY/4bAz6wStP3MWCmTw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFBE9F8007E;
	Thu,  6 Jan 2022 07:49:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94DE0F80155; Thu,  6 Jan 2022 07:49:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FD8EF800AE
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 07:49:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FD8EF800AE
X-UUID: 6bf99546a445448486b9331e310f4567-20220106
X-UUID: 6bf99546a445448486b9331e310f4567-20220106
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <yc.hung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 144266909; Thu, 06 Jan 2022 14:49:34 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Jan 2022 14:49:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 6 Jan 2022 14:49:32 +0800
From: YC Hung <yc.hung@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH v4] dt-bindings: dsp: mediatek: add mt8195 dsp document
Date: Thu, 6 Jan 2022 14:48:48 +0800
Message-ID: <20220106064847.15588-1-yc.hung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 allen-kh.cheng@mediatek.com, cezary.rojewski@intel.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, yc.hung@mediatek.com, daniel.baluta@nxp.com,
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

From: "YC Hung" <yc.hung@mediatek.com>

This patch adds mt8195 dsp document. The dsp is used for Sound Open
Firmware driver node. It includes registers,  clocks, memory regions,
and mailbox for dsp.

Signed-off-by: yc.hung <yc.hung@mediatek.com>
---
Changes since v3:
  Fix patch v3 error : v3 only provide difference between v3 and v2.

Changes since v2:
  Remove useless watchdog interrupt.
  Add commit message more detail description.

Changes since v1:
  Rename yaml file name as mediatek,mt8195-dsp.yaml
  Refine descriptions for mailbox, memory-region and drop unused labels
  in examples.
---
 .../bindings/dsp/mediatek,mt8195-dsp.yaml     | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml

diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
new file mode 100644
index 000000000000..b7e68b0dfa13
--- /dev/null
+++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
@@ -0,0 +1,105 @@
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
+      - description: ipc request between host and audio DSP.
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

