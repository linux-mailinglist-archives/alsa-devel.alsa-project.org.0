Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C813AB642
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 16:43:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3C321743;
	Thu, 17 Jun 2021 16:42:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3C321743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623940989;
	bh=X0FsowmnDCvmLo1x22pyn9SEJbdomZgNBKzyLdnOtCA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DZmF3U5SJ4plzacmCGRCr+72vdtLKyDUJIltOmnWWwqOrgEWiuItR2tTMSY75wlle
	 AGkc3BTWg8gTGuO+zktv5SMB7KmhQhblchrR4bkqLWbBcvps9wADO/alSKILd6V9/n
	 GWHtwKz9P2smYHbZlCV/Scz0S3NIuSLQgL22DJ34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2627FF80579;
	Thu, 17 Jun 2021 16:35:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3205F804CF; Thu, 17 Jun 2021 07:48:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F583F80171
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 07:48:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F583F80171
X-UUID: c20d43854f944a139f867d8bbdd03e3f-20210617
X-UUID: c20d43854f944a139f867d8bbdd03e3f-20210617
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1094154893; Thu, 17 Jun 2021 13:48:37 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 13:48:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Jun 2021 13:48:35 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH 6/8] dt-bindings: mediatek: mt8195: add audio afe document
Date: Thu, 17 Jun 2021 13:47:37 +0800
Message-ID: <20210617054740.8081-7-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210617054740.8081-1-trevor.wu@mediatek.com>
References: <20210617054740.8081-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Thu, 17 Jun 2021 16:34:46 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, bicycle.tsai@mediatek.com, linux-kernel@vger.kernel.org,
 jiaxin.yu@mediatek.com, linux-mediatek@lists.infradead.org,
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

This patch adds mt8195 audio afe document.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../bindings/sound/mt8195-afe-pcm.yaml        | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
new file mode 100644
index 000000000000..9a7f80248bb4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mt8195-afe-pcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek AFE PCM controller for mt8195
+
+maintainers:
+   - Trevor Wu <trevor.wu@mediatek.com>
+
+properties:
+  compatible:
+      const: mediatek,mt8195-audio
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
+      - description: AFE clock
+      - description: audio infra sys clock
+      - description: audio infra 26M clock
+      - description: audio 26M clock
+
+  clock-names:
+    items:
+      - const: aud_afe
+      - const: infra_ao_audio
+      - const: infra_ao_audio_26m_b
+      - const: clk26m
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
+                 <&infracfg_ao CLK_INFRA_AO_AUDIO_26M_B>,
+        clock-names = "clk26m",
+                      "aud_afe",
+                      "infra_ao_audio",
+                      "infra_ao_audio_26m_b";
+    };
+
+...
-- 
2.18.0

