Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 511FC462C48
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 06:40:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1C611EEB;
	Tue, 30 Nov 2021 06:39:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1C611EEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638250843;
	bh=g9OrTnmkUYFEpxrSMyNcX6tQIHokUKowaRfyncE21ww=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=adYrdV+QOgmLR/k1XK/sz/3zpUySCuLp1pUn0Gy2+hsIWGvDbdoGs5cPX02d9Hu7P
	 5DyJyGOsctI5GXa30qe8hQdVBx+rU4tjEQnWIi1gQv32f160c/LowtfBHF+ya6XM8E
	 mSAcdixD7uWGwL4VT6eCjeGP0joHrqhpbxzMPBV4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ABCBF802C4;
	Tue, 30 Nov 2021 06:39:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 991F7F802C4; Tue, 30 Nov 2021 06:39:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C97EF800EE
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 06:39:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C97EF800EE
X-UUID: 76bce234140b4bf4bc153a7cae776ed7-20211130
X-UUID: 76bce234140b4bf4bc153a7cae776ed7-20211130
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1269906672; Tue, 30 Nov 2021 13:39:09 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 30 Nov 2021 13:39:08 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 30 Nov 2021 13:39:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 30 Nov 2021 13:39:08 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH 2/2] dt-bindings: mediatek: mt8195: add memory-region property
Date: Tue, 30 Nov 2021 13:39:05 +0800
Message-ID: <20211130053905.28470-3-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211130053905.28470-1-trevor.wu@mediatek.com>
References: <20211130053905.28470-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, yc.hung@mediatek.com,
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

Add a required property "memory-region", which is used to specify memory
for DMA usage.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../devicetree/bindings/sound/mt8195-afe-pcm.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
index dcf790b053d2..6d0975b33d15 100644
--- a/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
@@ -19,6 +19,12 @@ properties:
   interrupts:
     maxItems: 1
 
+  memory-region:
+    maxItems: 1
+    description: |
+      Shared memory region for AFE memif.  A "shared-dma-pool".
+      See ../reserved-memory/reserved-memory.txt for details.
+
   mediatek,topckgen:
     $ref: "/schemas/types.yaml#/definitions/phandle"
     description: The phandle of the mediatek topckgen controller
@@ -125,6 +131,7 @@ required:
   - power-domains
   - clocks
   - clock-names
+  - memory-region
 
 additionalProperties: false
 
@@ -139,6 +146,7 @@ examples:
         interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH 0>;
         mediatek,topckgen = <&topckgen>;
         power-domains = <&spm 7>; //MT8195_POWER_DOMAIN_AUDIO
+        memory-region = <&snd_dma_mem_reserved>;
         clocks = <&clk26m>,
                  <&topckgen 163>, //CLK_TOP_APLL1
                  <&topckgen 166>, //CLK_TOP_APLL2
-- 
2.18.0

