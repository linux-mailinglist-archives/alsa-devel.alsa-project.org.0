Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2776769186
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 11:21:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ABEF845;
	Mon, 31 Jul 2023 11:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ABEF845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690795259;
	bh=b/8rCtKTsPMdR8vfXKLyvqSx5yYDLPF1qMJXM9bPWYs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qADAVo8KfpEspyUtM+Ej9xfIVKI0X/pdG/FkouDacprzVp1hhNGQwu2cYAsF6vWx8
	 MqOYNR87+ollCC55gRAGe/Y1M9y1bIl/bMMUJqrovEy5E1JFGUoJnHbH4bdOe+CpSo
	 PulxFm2sqcAs2PxjlRtSIzgm+pj2+kknHO7fPutc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0A31F805E5; Mon, 31 Jul 2023 11:17:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BC53F805DA;
	Mon, 31 Jul 2023 11:17:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC071F801F5; Fri, 28 Jul 2023 11:10:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D6EEF802E8
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 11:09:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D6EEF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=tSnG0mEn
X-UUID: 624ea3fe2d2611ee9cb5633481061a41-20230728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=bbjmhOdykU83KPH/M1QU2kpF8BWkVdXUxY/Ht/Ui5AU=;
	b=tSnG0mEnekHzsFk17sSgTIP4t+PRhtlfhANIyvqkVvfZ4B0WqbmByf85A6TpHU6HYjQJAyCNBB9tSuyOjio5FBTmC5OanaHQN+wKQPBZ5vFwYDT1qMI+sJpu1Vuv4zlpOZcPQ+MlvoI94NF04sJTItP7All/B5+LrLpMCFb7k+M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:ff804065-7364-424e-afc2-8894d3728ea9,IP:0,U
	RL:25,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:95
X-CID-INFO: VERSION:1.1.30,REQID:ff804065-7364-424e-afc2-8894d3728ea9,IP:0,URL
	:25,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACT
	ION:quarantine,TS:95
X-CID-META: VersionHash:1fcc6f8,CLOUDID:fc39a2a0-0933-4333-8d4f-6c3c53ebd55b,B
	ulkID:230728170858FLODCKLR,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,
	TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 624ea3fe2d2611ee9cb5633481061a41-20230728
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com
	(envelope-from <maso.huang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2124003612; Fri, 28 Jul 2023 17:08:57 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 28 Jul 2023 17:08:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 28 Jul 2023 17:08:56 +0800
From: Maso Huang <maso.huang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>, Arnd
 Bergmann <arnd@arndb.de>, Mars Chen
	<chenxiangrui@huaqin.corp-partner.google.com>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Maso Huang <maso.huang@mediatek.com>
Subject: [PATCH v3 6/6] ASoC: dt-bindings: mediatek,mt7986-afe: add audio afe
 document
Date: Fri, 28 Jul 2023 17:08:19 +0800
Message-ID: <20230728090819.18038-7-maso.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230728090819.18038-1-maso.huang@mediatek.com>
References: <20230728090819.18038-1-maso.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MailFrom: maso.huang@mediatek.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RXS6BLPDBHFLS5Q4HIWXCVI42QN6OCVR
X-Message-ID-Hash: RXS6BLPDBHFLS5Q4HIWXCVI42QN6OCVR
X-Mailman-Approved-At: Mon, 31 Jul 2023 09:17:25 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RXS6BLPDBHFLS5Q4HIWXCVI42QN6OCVR/>
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
index 000000000000..ebb151c6400f
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

