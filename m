Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FC7263007
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 16:56:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75B6F16EF;
	Wed,  9 Sep 2020 16:55:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75B6F16EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599663371;
	bh=lgjF0qlCa2/wQXads/woBQepb5ar/T8sZ1QP8YDHF0E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZJxVaFV5SC70TxdKffa/FF2clupGx4UXOE3OXR2+9gzd33lUDcZHrljJbRLSwtxtk
	 77NLZCdIyFytsPrNyMWki/4zCN0xsgrqN4Z9E7418+URH+wRGNZk88ovRspw6LbjW0
	 LVJbAd4Mgd3fKcdlSc3JdsENIiuflJRs1X+2GhyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8064BF8015F;
	Wed,  9 Sep 2020 16:54:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 971EEF80227; Wed,  9 Sep 2020 16:54:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from esa3.microchip.iphmx.com (esa3.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA0DCF800E9
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 16:54:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA0DCF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="xVmi5/zp"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1599663261; x=1631199261;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lgjF0qlCa2/wQXads/woBQepb5ar/T8sZ1QP8YDHF0E=;
 b=xVmi5/zptVzWSanfG4YjV4nL+p1YwHmlnqLwKDYygOyox2zcYDj71gXY
 RzEsnzHJbZKG9dyfSgKZ3EBdz0e3dWP2w2iN2P+k12awV3G3sjrIkEv2t
 VWGc3IiAC536P2P2Eprlcczf9qT+vyObw5Z+TvzBO++V+xxgYXqn8r1Hw
 VDqgKtMugngqa+C+Bhe5wTquvRcpXbR/u5ko8/H1AAkLDZtc9uqrLL7Ue
 yJwXjn2fw2Og6e+xy2jDkQtZTwmEx9jnYe9vZroWI+BMdsAIGjmUKLSNO
 9+EB+WBZyqWKZ2BUUCbppz5n01cEh+DoUUq5pc9hKlzxNW4vJMnzwM1iD w==;
IronPort-SDR: ANPmC6FDYG/kTHlVsDWN0lqWHvAqGCWqG9lwf/OkcUkyqKM6RMN9VY6JHreb91mVz/Mwm3AIxw
 WkwQk+wQRvQIdsHpX7nWukEhUodpOj+wnaZPE3ECiZftveqFWwjjIBpytDtjbfvc5BAOCRVHYo
 0fkHNPSi+n1SP8+fBvdWEtpjHLNLV6Ghrj61GcgXZan7uEUW0Knq+BPYIuPxVmZ29ifRn3Zwde
 BA2929HzE3A0CV1bS0erfF+QmwLWY7OE8chIwpZJuvIEVbIybU/leljCCUec4xpegxXHPBcIxh
 jIQ=
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; d="scan'208";a="91160126"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Sep 2020 07:54:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 9 Sep 2020 07:54:13 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 9 Sep 2020 07:53:37 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/2] dt-bindings: sound: add DT bindings for Microchip
 S/PDIF TX Controller
Date: Wed, 9 Sep 2020 17:53:47 +0300
Message-ID: <20200909145348.367033-1-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: Rob Herring <robh@kernel.org>, alexandre.belloni@bootlin.com,
 lgirdwood@gmail.com, nicolas.ferre@microchip.com, robh+dt@kernel.org,
 tiwai@suse.com, ludovic.desroches@microchip.com, broonie@kernel.org, Codrin
 Ciubotariu <codrin.ciubotariu@microchip.com>
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

This patch adds DT bindings for the new Microchip S/PDIF TX Controller
embedded inside sama7g5 SoCs.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Changes in v4:
 - added 'Reviewed-by' tag from Rob

Changes in v3:
 - removed 'oneOf' from 'compatible' property;
 - added 'maxItems: 1' to 'dmas' property;
 - removed pinctrl related properties;

Changes in v2:
 - replaced https with http;
 - reworked example, included bindings;

 .../bindings/sound/mchp,spdiftx.yaml          | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mchp,spdiftx.yaml

diff --git a/Documentation/devicetree/bindings/sound/mchp,spdiftx.yaml b/Documentation/devicetree/bindings/sound/mchp,spdiftx.yaml
new file mode 100644
index 000000000000..a03b0b871fc9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mchp,spdiftx.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mchp,spdiftx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip S/PDIF Tx Controller Device Tree Bindings
+
+maintainers:
+  - Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
+
+description:
+        The Microchip Sony/Philips Digital Interface Transmitter is a
+        serial port compliant with the IEC-60958 standard.
+
+properties:
+  "#sound-dai-cells":
+    const: 0
+
+  compatible:
+    const: microchip,sama7g5-spdiftx
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Peripheral Bus Clock
+      - description: Generic Clock
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: gclk
+
+  dmas:
+    description: TX DMA Channel
+    maxItems: 1
+
+  dma-names:
+    const: tx
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - dmas
+  - dma-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/dma/at91.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    spdiftx@e1618000 {
+        #sound-dai-cells = <0>;
+        compatible = "microchip,sama7g5-spdiftx";
+        reg = <0xe1618000 0x4000>;
+        interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+        dmas = <&dma0 AT91_XDMAC_DT_PERID(50)>;
+        dma-names = "tx";
+        clocks = <&pmc PMC_TYPE_PERIPHERAL 85>, <&pmc PMC_TYPE_GCK 85>;
+        clock-names = "pclk", "gclk";
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_spdiftx_default>;
+    };
-- 
2.25.1

