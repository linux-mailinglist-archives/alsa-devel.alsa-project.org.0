Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F9E5F0E49
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 16:59:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D84ED16BB;
	Fri, 30 Sep 2022 16:58:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D84ED16BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664549965;
	bh=bGtnBx16GpHvGX77ttNyBY3RzmEkEPcrxTG/CKdGj3o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GjoGGw3QHntKAf43qauvz5O+Zzp125xXKLD8JgvebO8/c2D5V4iQK3AnCKp9PCmCK
	 sneVlBwYTcbV7YtUhyNzOD6+sN4MJBVruUZegPUWm1VWQ0AUZU1dh2/CuvWi3gIW3x
	 Bi5V/BlSPhSLzUu6A9vmLegofdjOTR1vnHZuBO4s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 176F1F8055B;
	Fri, 30 Sep 2022 16:57:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F726F80542; Fri, 30 Sep 2022 16:57:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD40AF80155
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 16:57:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD40AF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="UYP3fTEG"
X-UUID: 925f0b8dfea04343a234308898737c1e-20220930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ETG24WDlQ2uPL5EVj2vGSSok7fEm7bbdqh1C2k70J14=; 
 b=UYP3fTEG3JKwlfggAfRNzA3YKLuT+YCyzFEVA19l5fFSPA4RUn9uBzvmIaVp9NTCaDEvvtBjPfAHk7B7CjoRE+zUoy9xrnEItf6iMIVKhBXIn+AtUe6QEWqnY6U8MhLTVbXfIbAv3q/fm1PAgsxYzWkyHlSJoUIlpdGA1HgI95Y=;
X-CID-P-RULE: Spam_GS6885AD
X-CID-O-INFO: VERSION:1.1.11, REQID:570ec36a-408e-494e-98fe-d42b7fa26336, IP:0,
 U
 RL:25,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS6885AD,ACT
 ION:quarantine,TS:120
X-CID-INFO: VERSION:1.1.11, REQID:570ec36a-408e-494e-98fe-d42b7fa26336, IP:0,
 URL
 :25,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
 N:quarantine,TS:120
X-CID-META: VersionHash:39a5ff1, CLOUDID:f00bcde4-87f9-4bb0-97b6-34957dc0fbbe,
 B
 ulkID:220930225711MCRTV2GL,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48|823|
 824,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:n
 il,COL:0
X-UUID: 925f0b8dfea04343a234308898737c1e-20220930
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1360533605; Fri, 30 Sep 2022 22:57:10 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 30 Sep 2022 22:57:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 30 Sep 2022 22:57:09 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>
Subject: [PATCH 12/12] dt-bindings: mediatek: mt8188: add mt8188-mt6359
 document
Date: Fri, 30 Sep 2022 22:57:01 +0800
Message-ID: <20220930145701.18790-13-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220930145701.18790-1-trevor.wu@mediatek.com>
References: <20220930145701.18790-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
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

Add document for mt8188 board with mt6359.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../bindings/sound/mt8188-mt6359.yaml         | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml
new file mode 100644
index 000000000000..57c7c5ceef8a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mt8188-mt6359.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8188 ASoC sound card driver
+
+maintainers:
+  - Trevor Wu <trevor.wu@mediatek.com>
+
+description:
+  This binding describes the MT8188 sound card.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8188-sound
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: User specified audio sound card name
+
+  audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description:
+      A list of the connections between audio components. Each entry is a
+      sink/source pair of strings. Valid names could be the input or output
+      widgets of audio components, power supplies, MicBias of codec and the
+      software switch.
+
+  mediatek,platform:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of MT8188 ASoC platform.
+
+  mediatek,dptx-codec:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of MT8188 Display Port Tx codec node.
+
+  mediatek,hdmi-codec:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of MT8188 HDMI codec node.
+
+  mediatek,dai-link:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description:
+      A list of the desired dai-links in the sound card. Each entry is a
+      name defined in the machine driver.
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
+    sound: mt8188-sound {
+        compatible = "mediatek,mt8188-sound";
+        mediatek,platform = <&afe>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&aud_pins_default>;
+        audio-routing =
+            "Headphone", "Headphone L",
+            "Headphone", "Headphone R",
+            "AIN1", "Headset Mic";
+    };
+
+...
-- 
2.18.0

