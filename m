Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD294491E99
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jan 2022 05:45:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68F9A185F;
	Tue, 18 Jan 2022 05:44:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68F9A185F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642481144;
	bh=HPKmfZTEqi7g/4O8fYdF0/J3SkXKL2Z64mL4+WS80l0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rCzRfzb+kuwdRPO8BE5VPDXC4GVyGmYIXOalBxiNeVXo7qRIIcCxGfuiFDfEZL/Qa
	 GPJXGAt7ZMZxOWI07ttxCOIevc6OIui4MetYQgyvDR1URwwmsYIxgDHoz4wcDc5k5g
	 W3KxsdqizlcDeRDwTIF8C0Eb10cjPSjE87XbNWlk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC4CFF8024C;
	Tue, 18 Jan 2022 05:44:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DD89F80246; Tue, 18 Jan 2022 05:44:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B201F800D8;
 Tue, 18 Jan 2022 05:44:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B201F800D8
X-UUID: 56693929c3154e2f8e2acf0fcbc184a8-20220118
X-UUID: 56693929c3154e2f8e2acf0fcbc184a8-20220118
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <allen-kh.cheng@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1493936821; Tue, 18 Jan 2022 12:44:24 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Jan 2022 12:44:22 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 18 Jan 2022 12:44:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 18 Jan 2022 12:44:22 +0800
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v16 1/2] dt-bindings: mediatek: add adsp-mbox document
Date: Tue, 18 Jan 2022 12:44:18 +0800
Message-ID: <20220118044419.944-2-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220118044419.944-1-allen-kh.cheng@mediatek.com>
References: <20220118044419.944-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, cujomalainey@google.com,
 Kevin Hilman <khilman@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
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

From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

This patch adds document for mediatek adsp mbox

Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
---
 .../bindings/mailbox/mtk,adsp-mbox.yaml       | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
new file mode 100644
index 000000000000..25756837797f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek ADSP mailbox
+
+maintainers:
+  - Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
+
+description: |
+  The MTK ADSP mailbox Inter-Processor Communication (IPC) enables the SoC
+  to ommunicate with ADSP by passing messages through two mailbox channels.
+  The MTK ADSP mailbox IPC also provides the ability for one processor to
+  signal the other processor using interrupts.
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt8195-adsp-mbox
+
+  "#mbox-cells":
+    const: 0
+
+  reg:
+    description:
+      Physical address base for dsp mbox registers.
+
+  interrupts:
+    description:
+      adsp mbox interrupt
+
+required:
+  - compatible
+  - "#mbox-cells"
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    adsp_mailbox0:mailbox@10816000 {
+        compatible = "mediatek,mt8195-adsp-mbox";
+        #mbox-cells = <0>;
+        reg = <0x10816000 0x1000>;
+        interrupts = <GIC_SPI 702 IRQ_TYPE_LEVEL_HIGH 0>;
+    };
-- 
2.18.0

