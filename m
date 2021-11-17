Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 469AD4560BD
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 17:41:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCFB418C0;
	Thu, 18 Nov 2021 17:40:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCFB418C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637253674;
	bh=FnYpV8tPOoFXnNhuIiKI1PHZjjRiNPJXN04orjMGJb0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z9QKAWa+z+GJdAazUSrRz/ig/k2uu1AvXGy4yCIsSZxXCsdwzGGsv1adPqYIJZJ89
	 TikgiSAAR5ypCmMMBRXkqOT8hiovaYb341/dpMvov56f6FkcDvoEiAOl9MUo3WPHMy
	 51Hy2++igYNnsXWFQPYblRJbQqNjhC4ID3eR6YBI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A835FF8057B;
	Thu, 18 Nov 2021 17:33:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10CB1F8028B; Wed, 17 Nov 2021 14:12:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EDB5F80134;
 Wed, 17 Nov 2021 14:12:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EDB5F80134
X-UUID: e757559f830c4865af42718243ef5400-20211117
X-UUID: e757559f830c4865af42718243ef5400-20211117
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <allen-kh.cheng@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 806223329; Wed, 17 Nov 2021 21:12:29 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Nov 2021 21:12:28 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 17 Nov 2021 21:12:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 17 Nov 2021 21:12:27 +0800
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Linux-ALSA
 <alsa-devel@alsa-project.org>
Subject: [PATCH 1/3] dt-bindings: mediatek: add adsp-mbox document
Date: Wed, 17 Nov 2021 21:12:20 +0800
Message-ID: <20211117131222.30541-2-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211117131222.30541-1-allen-kh.cheng@mediatek.com>
References: <20211117131222.30541-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Thu, 18 Nov 2021 17:33:03 +0100
Cc: devicetree@vger.kernel.org, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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
 .../bindings/mailbox/mtk,adsp-mbox.yaml       | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
new file mode 100644
index 000000000000..f365182fa598
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
@@ -0,0 +1,53 @@
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
+      Physical address base for dsp mbox base registers.
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
+    adsp_mailbox0:adsp_mailbox0@10816000 {
+        compatible = "mediatek,mt8195-adsp-mbox";
+        #mbox-cells = <0>;
+        reg = <0x10816000 0x1000>;
+        interrupts = <GIC_SPI 702 IRQ_TYPE_LEVEL_HIGH 0>;
+    };
+
-- 
2.18.0

