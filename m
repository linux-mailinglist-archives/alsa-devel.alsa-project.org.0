Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C59272CA56
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 17:36:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EEF684A;
	Mon, 12 Jun 2023 17:35:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EEF684A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686584196;
	bh=clFjhVMdmQ4pDyrpaXNhj65YePcTW7T5QDsewtVx30Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ayOcnI+hW80xeaSNdJDWpBg5ErCfVAixFJA/0Cw8TZvrimn0BqupKsGznVpqmvy1E
	 8CrUp6knizD7zukpQRm5eEW9wAkIo1OlY4G5CrWJXz5Fr0Mbasbot93PleFjQoilIq
	 t41MaU01lPC5PQmZFqpCxRQUrD79XRqoVEwRnA3g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C1C2F8061D; Mon, 12 Jun 2023 17:32:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C55EF8061D;
	Mon, 12 Jun 2023 17:32:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3385F80149; Mon, 12 Jun 2023 12:54:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 72740F800BA
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 12:53:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72740F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=mmtuW9R8
X-UUID: 6b4006b4090f11eeb20a276fd37b9834-20230612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=WuLcXYdyZj0kxuMtUpOW4fppbN422IheP8ldjLAPRmc=;
	b=mmtuW9R8K5gj8wY0diQQbYfj+Krghoi5mo/VrSxhTrXJ3fJoE70Lub6qM76idURRV6gCZgF7qlO4lU0R3QTnpXUM0osKhWIPyQaIEvOGrF3AE0T+nw/8i8Z9Hw63+j9fE/wq2nJTOH9CIsOvcFvIMUnaev56tXoBzJ9JKYiOxn0=;
X-CID-CACHE: Type:Local,Time:202306121845+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.26,REQID:57d5be1d-1f9c-4c9d-ac4c-aedbc6c90523,IP:0,U
	RL:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:cb9a4e1,CLOUDID:194d5a3e-7aa7-41f3-a6bd-0433bee822f3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 6b4006b4090f11eeb20a276fd37b9834-20230612
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com
	(envelope-from <maso.huang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1374289385; Mon, 12 Jun 2023 18:53:52 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 12 Jun 2023 18:53:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 12 Jun 2023 18:53:51 +0800
From: Maso Hunag <maso.huang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Trevor Wu
	<trevor.wu@mediatek.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, Ren Zhijie
	<renzhijie2@huawei.com>, Arnd Bergmann <arnd@arndb.de>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Maso Huang <maso.huang@mediatek.com>
Subject: [PATCH 7/7] ASoC: dt-bindings: mediatek,mt79xx-afe: add audio afe
 document
Date: Mon, 12 Jun 2023 18:52:50 +0800
Message-ID: <20230612105250.15441-8-maso.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230612105250.15441-1-maso.huang@mediatek.com>
References: <20230612105250.15441-1-maso.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MailFrom: maso.huang@mediatek.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5XJGM377S37QPITNWBUGNRIHFTQ7MCIY
X-Message-ID-Hash: 5XJGM377S37QPITNWBUGNRIHFTQ7MCIY
X-Mailman-Approved-At: Mon, 12 Jun 2023 15:32:08 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5XJGM377S37QPITNWBUGNRIHFTQ7MCIY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Maso Huang <maso.huang@mediatek.com>

Add mt79xx audio afe document.

Signed-off-by: Maso Huang <maso.huang@mediatek.com>
---
 .../bindings/sound/mediatek,mt79xx-afe.yaml   | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt79xx-afe.yaml

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt79xx-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt79xx-afe.yaml
new file mode 100644
index 000000000000..11ef1cfdf49b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt79xx-afe.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt79xx-afe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek AFE PCM controller for MT79xx
+
+maintainers:
+  - Maso Huang <maso.huang@mediatek.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: mediatek,mt79xx-afe
+      - items:
+          - enum:
+              - mediatek,mt7981-afe
+              - mediatek,mt7986-afe
+              - mediatek,mt7988-afe
+          - const: mediatek,mt79xx-afe
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
+      - const: aud_bus_ck
+      - const: aud_26m_ck
+      - const: aud_l_ck
+      - const: aud_aud_ck
+      - const: aud_eg2_ck
+      - const: aud_sel
+      - const: aud_i2s_m
+
+  assigned-clocks:
+    minItems: 3
+    maxItems: 4
+
+  assigned-clock-parents:
+    minItems: 3
+    maxItems: 4
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - assigned-clocks
+  - assigned-clock-parents
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/mediatek,mt7981-clk.h>
+
+    afe@11210000 {
+        compatible = "mediatek,mt7981-afe","mediatek,mt79xx-afe";
+        reg = <0x11210000 0x9000>;
+        interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&infracfg_ao CLK_INFRA_AUD_BUS_CK>,
+                 <&infracfg_ao CLK_INFRA_AUD_26M_CK>,
+                 <&infracfg_ao CLK_INFRA_AUD_L_CK>,
+                 <&infracfg_ao CLK_INFRA_AUD_AUD_CK>,
+                 <&infracfg_ao CLK_INFRA_AUD_EG2_CK>,
+                 <&topckgen CLK_TOP_AUD_SEL>;
+        clock-names = "aud_bus_ck",
+                      "aud_26m_ck",
+                      "aud_l_ck",
+                      "aud_aud_ck",
+                      "aud_eg2_ck",
+                      "aud_sel";
+        assigned-clocks = <&topckgen CLK_TOP_AUD_SEL>,
+                          <&topckgen CLK_TOP_A1SYS_SEL>,
+                          <&topckgen CLK_TOP_AUD_L_SEL>,
+                          <&topckgen CLK_TOP_A_TUNER_SEL>;
+        assigned-clock-parents = <&topckgen CLK_TOP_CB_APLL2_196M>,
+                                 <&topckgen CLK_TOP_APLL2_D4>,
+                                 <&topckgen CLK_TOP_CB_APLL2_196M>,
+                                 <&topckgen CLK_TOP_APLL2_D4>;
+    };
+
+...
-- 
2.18.0

