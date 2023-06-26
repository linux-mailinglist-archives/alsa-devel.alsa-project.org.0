Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5DE73DE1B
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:50:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 464CFEE4;
	Mon, 26 Jun 2023 13:49:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 464CFEE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687780207;
	bh=aMZpeUdo3WuFn6fyQxHqP6M/I29SUGMYfbqZL7a3Ngg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iyIEzKMjpbZ7urwK5Y+SiZq21pmQBPOsr4okULFZ0r1BQOpsNSvlHWef6qb3su781
	 iLhiHPiY0W23vIhT2XQW+Aw25xKJIltV2/A3vcz65Nfc1yJ6BXWB/s4EVPOwZ/39Zn
	 14hRDB7HSX/QcQnZsEPUGKNPYZJJEnHC0UrL22zs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30D54F80691; Mon, 26 Jun 2023 13:43:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F81BF80689;
	Mon, 26 Jun 2023 13:43:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4530F80169; Mon, 26 Jun 2023 04:36:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06228F80246
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 04:35:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06228F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=ihMKutjG
X-UUID: 264fafee13ca11ee9cb5633481061a41-20230626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=To/hkL+XsHV+7bzfuPa862srWIZ++zvnkd6g5DhdBek=;
	b=ihMKutjG9CfJJvKPG3KWJTX55sPZlCyPFfbXheR85Ugk/B+VrFrxncOXpyP4QFOzsrZlEREdzMEARjbiNQ+XTJ7SL0MwADD76AU76d3XbLM4QP9PWdiThjyHspoqac5tYs9OLx+fquyfSCD6wfKKE9ohQyYnlD8kgiXRT48YqUA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:5716ea10-fdf7-4bf1-bcee-552509a8c80a,IP:0,U
	RL:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:01c9525,CLOUDID:4d00703f-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 264fafee13ca11ee9cb5633481061a41-20230626
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com
	(envelope-from <maso.huang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1405323478; Mon, 26 Jun 2023 10:35:44 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 26 Jun 2023 10:35:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 26 Jun 2023 10:35:42 +0800
From: Maso Huang <maso.huang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>, Jiaxin Yu
	<jiaxin.yu@mediatek.com>, Ren Zhijie <renzhijie2@huawei.com>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Maso Huang <maso.huang@mediatek.com>
Subject: [PATCH v2 7/7] ASoC: dt-bindings: mediatek,mt7986-afe: add audio afe
 document
Date: Mon, 26 Jun 2023 10:35:01 +0800
Message-ID: <20230626023501.11120-8-maso.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230626023501.11120-1-maso.huang@mediatek.com>
References: <20230626023501.11120-1-maso.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MailFrom: maso.huang@mediatek.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: O2RG7TZA7ESJGZPNOZITLVPYGWNAAQB3
X-Message-ID-Hash: O2RG7TZA7ESJGZPNOZITLVPYGWNAAQB3
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:41:56 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O2RG7TZA7ESJGZPNOZITLVPYGWNAAQB3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add mt7986 audio afe document.

Signed-off-by: Maso Huang <maso.huang@mediatek.com>
---
 .../bindings/sound/mediatek,mt7986-afe.yaml   | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt7986-afe.yaml

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt7986-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt7986-afe.yaml
new file mode 100644
index 000000000000..257327a33ea1
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt7986-afe.yaml
@@ -0,0 +1,89 @@
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
+      - const: aud_bus_ck
+      - const: aud_26m_ck
+      - const: aud_l_ck
+      - const: aud_aud_ck
+      - const: aud_eg2_ck
+      - const: aud_sel
+      - const: aud_i2s_m
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
+        clock-names = "aud_bus_ck",
+                      "aud_26m_ck",
+                      "aud_l_ck",
+                      "aud_aud_ck",
+                      "aud_eg2_ck";
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

