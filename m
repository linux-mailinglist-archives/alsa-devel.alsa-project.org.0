Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D87F3EB339
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Aug 2021 11:14:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D46B118AD;
	Fri, 13 Aug 2021 11:13:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D46B118AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628846044;
	bh=gRrajjpsBPvz80+LVq2A7+49eF2iJnh3g1GqrqKU1XM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ETjJ+BZodJ189ne5KzeqEUX3MEwJZhsKO8k/G8VOX0EeCT//rkCOyXe+gxytZ8ijG
	 mNNGkrcCKWGMzsPjH2nTeIhdTUOgjab5ps1bGnK516yECwovt6ww2Th6dhi/1JZC8N
	 hWyJuiOzIsNfQnc2hl4UqT+sA+V2qdnhCGlGcK8M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EC6EF804BB;
	Fri, 13 Aug 2021 11:12:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73DB8F804CC; Fri, 13 Aug 2021 11:12:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by alsa1.perex.cz (Postfix) with ESMTP id 77B35F800AF
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 11:12:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77B35F800AF
X-IronPort-AV: E=Sophos;i="5.84,318,1620658800"; d="scan'208";a="90541571"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 13 Aug 2021 18:12:12 +0900
Received: from localhost.localdomain (unknown [10.226.92.30])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 877124228B65;
 Fri, 13 Aug 2021 18:12:09 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 2/3] ASoC: dt-bindings: renesas,
 rz-ssi: Update slave dma channel configuration parameter
Date: Fri, 13 Aug 2021 10:11:55 +0100
Message-Id: <20210813091156.10700-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210813091156.10700-1-biju.das.jz@bp.renesas.com>
References: <20210813091156.10700-1-biju.das.jz@bp.renesas.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Chris Brandt <chris.brandt@renesas.com>
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

The DMAC on RZ/G2L has specific slave channel configuration
parameters for SSI.
This patch updates the dmas description and example node to include
the encoded slave channel configuration.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Note:-
 This patch is based on [1]
 [1]:- https://patchwork.kernel.org/project/linux-renesas-soc/patch/20210806095322.2326-2-biju.das.jz@bp.renesas.com/
v4->v5:
 * Updated dmas description and removed fixes as it is an enhancement
   now.
v3->v4:
 * Updated bindings as the DMAC driver on RZ/G2L expects the
   slave channel configuration to be passed in dmas property.
v2->v3:
 * Merged the binding patch with dmas added
 * Updated dt binding example with encoded #dma-cells value.
v1->v2:
 * Rebased on 5.14-rc2.
---
 .../bindings/sound/renesas,rz-ssi.yaml        | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
index 471937cb8d05..414ff8035a4e 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
@@ -48,6 +48,24 @@ properties:
   dmas:
     minItems: 1
     maxItems: 2
+    description:
+      The first cell represents a phandle to dmac
+      The second cell specifies the encoded MID/RID values of the SSI port
+      connected to the DMA client and the slave channel configuration
+      parameters.
+      bits[0:9]   - Specifies MID/RID value of a SSI channel as below
+                    MID/RID value of SSI rx0 = 0x256
+                    MID/RID value of SSI tx0 = 0x255
+                    MID/RID value of SSI rx1 = 0x25a
+                    MID/RID value of SSI tx1 = 0x259
+                    MID/RID value of SSI rt2 = 0x25f
+                    MID/RID value of SSI rx3 = 0x262
+                    MID/RID value of SSI tx3 = 0x261
+      bit[10]     - HIEN = 1, Detects a request in response to the rising edge
+                    of the signal
+      bit[11]     - LVL = 0, Detects based on the edge
+      bits[12:14] - AM = 2, Bus cycle mode
+      bit[15]     - TM = 0, Single transfer mode
 
   dma-names:
     oneOf:
@@ -93,8 +111,8 @@ examples:
             clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
             power-domains = <&cpg>;
             resets = <&cpg R9A07G044_SSI0_RST_M2_REG>;
-            dmas = <&dmac 0x255>,
-                   <&dmac 0x256>;
+            dmas = <&dmac 0x2655>,
+                   <&dmac 0x2656>;
             dma-names = "tx", "rx";
             #sound-dai-cells = <0>;
     };
-- 
2.17.1

