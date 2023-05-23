Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C3570D11F
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 04:21:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E69EA839;
	Tue, 23 May 2023 04:21:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E69EA839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684808518;
	bh=ATU0Vh4jFhM2jzFRd1vyw7ANMaOkhaMV4ArnBh5oHgA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CR6gfusi52Pb8VSFusb/mIlHLv8orRjJaQTCYWfPoTLjlRToDIseusKLKLszjreT6
	 WmF7B/0ufKZ6xrC0CWV76jOvlN5RDVpyWwzq0N43sp8Ct72rOIhWuJS/qE0H9WSqsb
	 EFErLEhdVNghjaQUep+3rJFSndr0moFuP5xOzagE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF7F3F8057D; Tue, 23 May 2023 04:20:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38C7BF80570;
	Tue, 23 May 2023 04:20:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F545F80544; Tue, 23 May 2023 04:20:05 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id DF481F80542
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 04:19:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF481F80542
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=Yd+i+f4H
X-UUID: 42f44828f91011edb20a276fd37b9834-20230523
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Sfj8k51ecj9c8HcMdn1rWW9Isz6l/fhmsTFfGJOkg14=;
	b=Yd+i+f4Hgxz/fdLK0sqAjM9lX+BOi3pAyFMqxZb3w289ZW9fhd0sCATu7/qSO/ZHrw5tQklz5u+fyrD21fZZSz1oeWMxOPbLtL40g2gP9yD2InpwKa0aRnFRvlI877+ncj6nrPaNryWN+2vyLgU6qtBk/h46yIG/7/4Oi5qgihk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:e9674a28-d928-45f2-833d-a5b02ef10f71,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:8420b3c1-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 42f44828f91011edb20a276fd37b9834-20230523
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1332634918; Tue, 23 May 2023 10:19:35 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 23 May 2023 10:19:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 23 May 2023 10:19:35 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 7/7] ASoC: dt-bindings: mediatek,mt8188-mt6359: add NAU8825
 support
Date: Tue, 23 May 2023 10:19:32 +0800
Message-ID: <20230523021933.3422-8-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230523021933.3422-1-trevor.wu@mediatek.com>
References: <20230523021933.3422-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: 2YZKBVINZ3HE7CBPBF5MGGIGCT7VEZQ4
X-Message-ID-Hash: 2YZKBVINZ3HE7CBPBF5MGGIGCT7VEZQ4
X-MailFrom: trevor.wu@mediatek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2YZKBVINZ3HE7CBPBF5MGGIGCT7VEZQ4/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add compatible string "mediatek,mt8188-nau8825" to support new board
with nau8825 codec.

Introduce two properties "dai-format" and "mediatek,clk-provider" under
dai-link subnode to configure dai-link parameters via dts.

"codec" property is removed from required property of dai-link subnode.
For co-clock case, it's possible two dai-links should be configured to
the same dai format, but only one cpu dai is bound with codec.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../sound/mediatek,mt8188-mt6359.yaml         | 26 ++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 3d2c01b693be..05e532b5d50a 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: mediatek,mt8188-mt6359-evb
+    enum:
+      - mediatek,mt8188-mt6359-evb
+      - mediatek,mt8188-nau8825
 
   model:
     $ref: /schemas/types.yaml#/definitions/string
@@ -61,11 +63,28 @@ patternProperties:
         required:
           - sound-dai
 
+      dai-format:
+        description: audio format.
+        items:
+          enum:
+            - i2s
+            - right_j
+            - left_j
+            - dsp_a
+            - dsp_b
+
+      mediatek,clk-provider:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: Indicates dai-link clock master.
+        items:
+          enum:
+            - cpu
+            - codec
+
     additionalProperties: false
 
     required:
       - link-name
-      - codec
 
 additionalProperties: false
 
@@ -86,7 +105,8 @@ examples:
             "AIN1", "Headset Mic";
         dai-link-0 {
             link-name = "ETDM3_OUT_BE";
-
+            dai-format = "i2s";
+            mediatek,clk-provider = "cpu";
             codec {
                 sound-dai = <&hdmi0>;
             };
-- 
2.18.0

