Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B484345C3
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 09:16:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82D5816AC;
	Wed, 20 Oct 2021 09:15:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82D5816AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634714194;
	bh=N5CeZ4Gd0PA1P8m75VifvwMxzcF46Haj3Dv4k8l3csM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RgYVSwm1u5X5hM883k5w9PrUNG0mE2i3pvvql4fPFB2HZ4442rgYmKnR1UE0RnmvH
	 aCkvozAKu3klTN6pA2zq6U22chTwXW+sXAtDNKDCdvRe0MzI2v3ET1QdAMwf56O6nT
	 f3AQYVaZGTnON8lTDUIBLMFXeLQbvfPBDdMdy7yc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A226AF804E5;
	Wed, 20 Oct 2021 09:14:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62218F804CA; Wed, 20 Oct 2021 09:14:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15B3EF80155
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 09:14:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15B3EF80155
X-UUID: fe353559b3734de9adfd1aa6414db846-20211020
X-UUID: fe353559b3734de9adfd1aa6414db846-20211020
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1060229274; Wed, 20 Oct 2021 15:14:35 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Oct 2021 15:14:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 20 Oct 2021 15:14:33 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [RESEND, v2 2/2] dt-bindings: mediatek: mt8195: add
 mt8195-mt6359-rt1011-rt5682 document
Date: Wed, 20 Oct 2021 15:14:28 +0800
Message-ID: <20211020071428.14297-3-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211020071428.14297-1-trevor.wu@mediatek.com>
References: <20211020071428.14297-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com, aaronyu@google.com,
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

This patch adds document for mt8195 board with mt6359, rt1011 and rt5682

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../sound/mt8195-mt6359-rt1011-rt5682.yaml    | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml
new file mode 100644
index 000000000000..d354c30d3377
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mt8195-mt6359-rt1011-rt5682.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT8195 with MT6359, RT1011 and RT5682 ASoC sound card driver
+
+maintainers:
+  - Trevor Wu <trevor.wu@mediatek.com>
+
+description:
+  This binding describes the MT8195 sound card with RT1011 and RT5682.
+
+properties:
+  compatible:
+    const: mediatek,mt8195_mt6359_rt1011_rt5682
+
+  mediatek,platform:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of MT8195 ASoC platform.
+
+  mediatek,dptx-codec:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of MT8195 Display Port Tx codec node.
+
+  mediatek,hdmi-codec:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of MT8195 HDMI codec node.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - mediatek,platform
+
+examples:
+  - |
+
+    sound: mt8195-sound {
+        compatible = "mediatek,mt8195_mt6359_rt1011_rt5682";
+        mediatek,platform = <&afe>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&aud_pins_default>;
+    };
+
+...
-- 
2.18.0

