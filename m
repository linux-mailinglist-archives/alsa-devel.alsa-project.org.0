Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B734772CA58
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 17:36:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B519883B;
	Mon, 12 Jun 2023 17:35:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B519883B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686584203;
	bh=kANiShRbw8ZMtxhcsAhOY2IhWDUCpxSwd+IWcpVYv0M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j0UxFmO/VyKLyfX51AZ3C7nFvXG1QvrJqxutuDy+3Nj58JCVqcNDB9ASk37CnKvWO
	 mJfdWtp2lalFl++PDCkjuiIX4YRRXVt4iaj7Z+bffCDhvk/o2VUnPTvK69sTANVN33
	 AAahlEiauL0w3qzgLl84zmVBuTBIGT+C3Nfz/wu8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC9FEF80580; Mon, 12 Jun 2023 17:32:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C36C2F80631;
	Mon, 12 Jun 2023 17:32:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4C01F800ED; Mon, 12 Jun 2023 12:54:19 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C3B0F80155
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 12:53:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C3B0F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=NkWUN9Tj
X-UUID: 68dfd50c090f11ee9cb5633481061a41-20230612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Dvi1PlHn3OIi9tRbQRhyfGDeuJwoTGNULd7VXBd16OQ=;
	b=NkWUN9TjAX421Lh/2HsBGWOxDWB+Ksl4LAfGPeXRRUoj+oU0wp0Vs8e4Fzpju53g0eWtGotU5gZvlrh8mOn/AZd8DoHJIqLMRXHJ098H0dZ6ocmLHVxfKT5g2fORu8YUrCjWh3z2Wcsbd7Yc2wTQjhOmz8PkowTBkyEfdfMoyVo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.26,REQID:a94c04a8-fd9a-4b65-8b52-59af83553a31,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:cb9a4e1,CLOUDID:d2c7293e-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 68dfd50c090f11ee9cb5633481061a41-20230612
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com
	(envelope-from <maso.huang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1671494933; Mon, 12 Jun 2023 18:53:48 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 12 Jun 2023 18:53:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 12 Jun 2023 18:53:47 +0800
From: Maso Hunag <maso.huang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Trevor Wu
	<trevor.wu@mediatek.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, Ren Zhijie
	<renzhijie2@huawei.com>, Arnd Bergmann <arnd@arndb.de>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Maso Huang <maso.huang@mediatek.com>
Subject: [PATCH 6/7] ASoC: dt-bindings: mediatek,mt79xx-wm8960: add
 mt79xx-wm8960 document
Date: Mon, 12 Jun 2023 18:52:49 +0800
Message-ID: <20230612105250.15441-7-maso.huang@mediatek.com>
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
Message-ID-Hash: Q5PYBH3ROKNLPL6JFG5ZBJPO4CO7PKYI
X-Message-ID-Hash: Q5PYBH3ROKNLPL6JFG5ZBJPO4CO7PKYI
X-Mailman-Approved-At: Mon, 12 Jun 2023 15:32:09 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q5PYBH3ROKNLPL6JFG5ZBJPO4CO7PKYI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Maso Huang <maso.huang@mediatek.com>

Add document for mt79xx board with wm8960.

Signed-off-by: Maso Huang <maso.huang@mediatek.com>
---
 .../sound/mediatek,mt79xx-wm8960.yaml         | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt79xx-wm8960.yaml

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt79xx-wm8960.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt79xx-wm8960.yaml
new file mode 100644
index 000000000000..26b38bb629da
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt79xx-wm8960.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt79xx-wm8960.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT79xx ASOC sound card with WM8960 codec
+
+maintainers:
+  - Maso Huang <maso.huang@mediatek.com>
+
+properties:
+  compatible:
+    const: mediatek,mt79xx-wm8960-machine
+
+  mediatek,platform:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of MT79xx ASoC platform.
+
+  audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description:
+      A list of the connections between audio components. Each entry is a
+      sink/source pair of strings. Valid names could be the input or output
+      widgets of audio components, power supplies, MicBias of codec and the
+      software switch.
+
+  mediatek,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of wm8960 codec.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - mediatek,platform
+  - audio-routing
+  - mediatek,audio-codec
+
+examples:
+  - |
+    sound {
+        compatible = "mediatek,mt79xx-wm8960-machine";
+        mediatek,platform = <&afe>;
+        audio-routing =
+            "Headphone", "HP_L",
+            "Headphone", "HP_R",
+            "LINPUT1", "AMIC",
+            "RINPUT1", "AMIC";
+        mediatek,audio-codec = <&wm8960>;
+    };
+
+...
-- 
2.18.0

