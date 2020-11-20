Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F942BA0CD
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 04:09:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6E0F16FE;
	Fri, 20 Nov 2020 04:08:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6E0F16FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605841740;
	bh=hPYaefO9Wf8VpVTKwK269PZdgGNZuZE+Zh7CUo+wF3Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dQWXKk/CZQVZ7JoyjLmRX2uUnOgumDvmxQ0GNxaQJh9TLePO1GakW1v0DI4RrRT5J
	 YLyxZN+W+X4Rx9UTSybSN64P6PnDnfnph0ZIr8sPrAu5Wq6w+rMAFLihbvbQP64F2L
	 k9/oSNVJo9RDzA7yFVwTfIAKWegAG4GJHQXk1Fe0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65BFCF804BC;
	Fri, 20 Nov 2020 04:06:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73CC7F80166; Fri, 20 Nov 2020 04:06:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id 1D082F8016C
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 04:06:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D082F8016C
X-UUID: 2a29a68fdc314804a1f67d0599b59c43-20201120
X-UUID: 2a29a68fdc314804a1f67d0599b59c43-20201120
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 130192700; Fri, 20 Nov 2020 11:06:18 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Nov 2020 11:06:17 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Nov 2020 11:06:16 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <tzungbi@google.com>, <alsa-devel@alsa-project.org>, <robh+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] dt-bindings: mediatek: mt6359: remove unused property for
 mt6359
Date: Fri, 20 Nov 2020 11:06:13 +0800
Message-ID: <1605841573-1442-3-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1605841573-1442-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1605841573-1442-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: DDC9A826DC1B14BDD756F49287CC87C9B10F08EA4E9D16A937B0F009B1940D902000:8
X-MTK: N
Cc: shane.chien@mediatek.com, Trevor.Wu@mediatek.com,
 Jiaxin Yu <jiaxin.yu@mediatek.com>
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

This reverts commit 08651373808e16b01d3b12207f52504c17b6774c.
("dt-bindings: mediatek: mt6359: Add new property for mt6359")

Remove unused property "LDO_VAUD18-supply" in mt6359codec.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 Documentation/devicetree/bindings/sound/mt6359.yaml | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mt6359.yaml b/Documentation/devicetree/bindings/sound/mt6359.yaml
index ef027c79032f..a54f466f769d 100644
--- a/Documentation/devicetree/bindings/sound/mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mt6359.yaml
@@ -17,11 +17,6 @@ description: |
   Must be a child node of PMIC wrapper.
 
 properties:
-  LDO_VAUD18-supply:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description: |
-      Regulator of LDO VAUD18 at 1.8V.
-
   mediatek,dmic-mode:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: |
@@ -54,15 +49,11 @@ properties:
     description: |
       Specifies the type of mic type connected to adc2
 
-required:
-  - LDO_VAUD18-supply
-
 additionalProperties: false
 
 examples:
   - |
     mt6359codec: mt6359codec {
-      LDO_VAUD18-supply = <&mt6359p_vaud18_reg>;
       mediatek,dmic-mode = <0>;
       mediatek,mic-type-0 = <2>;
     };
-- 
2.18.0

