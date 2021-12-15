Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1811D475350
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 08:00:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75DCE1F51;
	Wed, 15 Dec 2021 07:59:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75DCE1F51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639551613;
	bh=palj+U346hsM8IhNat0ATas4afkl6MaAEsquRN4TFO8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OSIW/9H++R5fU37ZlY3jEynwMlNTWER9BNqPbq60kYP/9cd31Aq/6U1NUWdtNJ8dZ
	 4SJ0wML3Fm94546r1T+fiuCHgRJigSuj8NlyQEsyPA4H0qDZijH+mB+PnHd9C3L8sz
	 2QbuVJ1MUo5CiCcaONUhQextUcwFQz7bUNgAGwyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9B8DF8025F;
	Wed, 15 Dec 2021 07:59:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01E7EF8025D; Wed, 15 Dec 2021 07:58:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28DE6F800E0
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 07:58:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28DE6F800E0
X-UUID: 7e7503e2abb84bf0b980c2bf75e85d88-20211215
X-UUID: 7e7503e2abb84bf0b980c2bf75e85d88-20211215
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 704864354; Wed, 15 Dec 2021 14:58:38 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 15 Dec 2021 14:58:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 15 Dec 2021 14:58:37 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH 2/2] dt-bindings: mediatek: mt8195: add clock property to
 sound node
Date: Wed, 15 Dec 2021 14:58:35 +0800
Message-ID: <20211215065835.3074-2-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211215065835.3074-1-trevor.wu@mediatek.com>
References: <20211215065835.3074-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, jiaxin.yu@mediatek.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 shumingf@realtek.com, linux-arm-kernel@lists.infradead.org
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

clocks and clock-names are added to provide MCLK phandle for sound card.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml  | 12 ++++++++++++
 .../bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml  | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml
index cf6ad7933e23..b57c856d0cf3 100644
--- a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1011-rt5682.yaml
@@ -32,11 +32,21 @@ properties:
     $ref: "/schemas/types.yaml#/definitions/phandle"
     description: The phandle of MT8195 HDMI codec node.
 
+  clocks:
+    items:
+      - description: phandle and clock specifier for codec MCLK.
+
+  clock-names:
+    items:
+      - const: i2so1_mclk
+
 additionalProperties: false
 
 required:
   - compatible
   - mediatek,platform
+  - clocks
+  - clock-names
 
 examples:
   - |
@@ -44,6 +54,8 @@ examples:
     sound: mt8195-sound {
         compatible = "mediatek,mt8195_mt6359_rt1011_rt5682";
         mediatek,platform = <&afe>;
+        clocks = <&topckgen 235>; //CLK_TOP_APLL12_DIV2
+        clock-names = "i2so1_mclk";
         pinctrl-names = "default";
         pinctrl-0 = <&aud_pins_default>;
     };
diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
index 8f177e02ad35..e4720f76f66b 100644
--- a/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
@@ -42,11 +42,21 @@ properties:
       A list of the desired dai-links in the sound card. Each entry is a
       name defined in the machine driver.
 
+  clocks:
+    items:
+      - description: phandle and clock specifier for codec MCLK.
+
+  clock-names:
+    items:
+      - const: i2so1_mclk
+
 additionalProperties: false
 
 required:
   - compatible
   - mediatek,platform
+  - clocks
+  - clock-names
 
 examples:
   - |
@@ -54,6 +64,8 @@ examples:
     sound: mt8195-sound {
         compatible = "mediatek,mt8195_mt6359_rt1019_rt5682";
         mediatek,platform = <&afe>;
+        clocks = <&topckgen 235>; //CLK_TOP_APLL12_DIV2
+        clock-names = "i2so1_mclk";
         pinctrl-names = "default";
         pinctrl-0 = <&aud_pins_default>;
     };
-- 
2.18.0

