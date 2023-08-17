Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 484897827A8
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 13:13:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B28BE851;
	Mon, 21 Aug 2023 13:13:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B28BE851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692616433;
	bh=CbWShNVkq+C1aqryaiPtVu2pxtc5pl+yab6K6SNFcb4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mbuts5HpOzqHsM0MzhhPGOUkpXe77MQr8PqRiGtSY8K4yCq1EvJ+BJhfzfTxPxE6q
	 1ClhukztMb71KsATcGDWSc3KxFJiVyouaHmQOXZ9JlkoQz4QQ2rjt3sGMBKCE5xXB9
	 fvf6WybwvT/9+h1KasikZeqvEE3l5IfL3zftF9pQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97704F805C7; Mon, 21 Aug 2023 13:11:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C96EEF805BF;
	Mon, 21 Aug 2023 13:11:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EB60F8016A; Thu, 17 Aug 2023 12:14:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C89A7F80290
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 12:14:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C89A7F80290
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=WtDe/OYe
X-UUID: ca03036c3ce611eeb20a276fd37b9834-20230817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2CJ/JsGlde5cwlzOw5Tu+oif75NN/96g5IbWro2lrg0=;
	b=WtDe/OYetjt9KZVkaTmzamyQRmEMvanKF42RtmFhTPY28ZfDy+n9xzf591TsWWWOLpv97fFL6DEPAF8VfNPvGdhuKp8L9AIqWV4EmB/COKCksNSk/eZIiEElOaHkJmBvj1pmAfNjNr4u7h3TNF+fQ6g8XuQEeo4b2rEX7quGdcc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:e3f07fcf-5a45-47cf-ba43-edfc063bd0cc,IP:0,U
	RL:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:0736a3ee-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ca03036c3ce611eeb20a276fd37b9834-20230817
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com
	(envelope-from <maso.huang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 931809692; Thu, 17 Aug 2023 18:14:02 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 17 Aug 2023 18:14:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 17 Aug 2023 18:14:01 +0800
From: Maso Huang <maso.huang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>, "Arnd
 Bergmann" <arnd@arndb.de>, Mars Chen
	<chenxiangrui@huaqin.corp-partner.google.com>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Maso Huang <maso.huang@mediatek.com>
Subject: [PATCH v4 6/6] ASoC: dt-bindings: mediatek,mt7986-afe: add audio afe
 document
Date: Thu, 17 Aug 2023 18:13:38 +0800
Message-ID: <20230817101338.18782-7-maso.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230817101338.18782-1-maso.huang@mediatek.com>
References: <20230817101338.18782-1-maso.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MailFrom: maso.huang@mediatek.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HS4HK4JGVJJQLEL2EK2GJENLMOHXAKEC
X-Message-ID-Hash: HS4HK4JGVJJQLEL2EK2GJENLMOHXAKEC
X-Mailman-Approved-At: Mon, 21 Aug 2023 11:11:03 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HS4HK4JGVJJQLEL2EK2GJENLMOHXAKEC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add mt7986 audio afe document.

Signed-off-by: Maso Huang <maso.huang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/sound/mediatek,mt7986-afe.yaml   | 160 ++++++++++++++++++
 1 file changed, 160 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt7986-afe.yaml

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt7986-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt7986-afe.yaml
new file mode 100644
index 000000000000..398efdfe00f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt7986-afe.yaml
@@ -0,0 +1,160 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt7986-afe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek AFE PCM controller for MT7986
+
+maintainers:
+  - Maso Huang <maso.huang@mediatek.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: mediatek,mt7986-afe
+      - items:
+          - enum:
+              - mediatek,mt7981-afe
+              - mediatek,mt7988-afe
+          - const: mediatek,mt7986-afe
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 5
+    items:
+      - description: audio bus clock
+      - description: audio 26M clock
+      - description: audio intbus clock
+      - description: audio hopping clock
+      - description: audio pll clock
+      - description: mux for pcm_mck
+      - description: audio i2s/pcm mck
+
+  clock-names:
+    minItems: 5
+    items:
+      - const: bus_ck
+      - const: 26m_ck
+      - const: l_ck
+      - const: aud_ck
+      - const: eg2_ck
+      - const: sel
+      - const: i2s_m
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt7986-afe
+    then:
+      properties:
+        clocks:
+          items:
+            - description: audio bus clock
+            - description: audio 26M clock
+            - description: audio intbus clock
+            - description: audio hopping clock
+            - description: audio pll clock
+        clock-names:
+          items:
+            - const: bus_ck
+            - const: 26m_ck
+            - const: l_ck
+            - const: aud_ck
+            - const: eg2_ck
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt7981-afe
+    then:
+      properties:
+        clocks:
+          items:
+            - description: audio bus clock
+            - description: audio 26M clock
+            - description: audio intbus clock
+            - description: audio hopping clock
+            - description: audio pll clock
+            - description: mux for pcm_mck
+        clock-names:
+          items:
+            - const: bus_ck
+            - const: 26m_ck
+            - const: l_ck
+            - const: aud_ck
+            - const: eg2_ck
+            - const: sel
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt7988-afe
+    then:
+      properties:
+        clocks:
+          items:
+            - description: audio bus clock
+            - description: audio 26M clock
+            - description: audio intbus clock
+            - description: audio hopping clock
+            - description: audio pll clock
+            - description: mux for pcm_mck
+            - description: audio i2s/pcm mck
+        clock-names:
+          items:
+            - const: bus_ck
+            - const: 26m_ck
+            - const: l_ck
+            - const: aud_ck
+            - const: eg2_ck
+            - const: sel
+            - const: i2s_m
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/mt7986-clk.h>
+
+    afe@11210000 {
+        compatible = "mediatek,mt7986-afe";
+        reg = <0x11210000 0x9000>;
+        interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&infracfg_ao CLK_INFRA_AUD_BUS_CK>,
+                 <&infracfg_ao CLK_INFRA_AUD_26M_CK>,
+                 <&infracfg_ao CLK_INFRA_AUD_L_CK>,
+                 <&infracfg_ao CLK_INFRA_AUD_AUD_CK>,
+                 <&infracfg_ao CLK_INFRA_AUD_EG2_CK>;
+        clock-names = "bus_ck",
+                      "26m_ck",
+                      "l_ck",
+                      "aud_ck",
+                      "eg2_ck";
+        assigned-clocks = <&topckgen CLK_TOP_A1SYS_SEL>,
+                          <&topckgen CLK_TOP_AUD_L_SEL>,
+                          <&topckgen CLK_TOP_A_TUNER_SEL>;
+        assigned-clock-parents = <&topckgen CLK_TOP_APLL2_D4>,
+                                 <&apmixedsys CLK_APMIXED_APLL2>,
+                                 <&topckgen CLK_TOP_APLL2_D4>;
+    };
+
+...
-- 
2.18.0

