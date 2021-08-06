Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8267A3E289F
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Aug 2021 12:32:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6397216F8;
	Fri,  6 Aug 2021 12:31:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6397216F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628245942;
	bh=gSFUkqx10sMXCWYEUgE2uBt8dWt/ogyCo/WvnR8G7C0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IqvCEzeuBzTMAhhKspyVBTH5VgAc+pQWpN8FQv3VnS4dppcvdxqBubxU3V+AmBU3Y
	 FFfF4S3L+YHbW98WIlP+GXe86mF3Rf7yIkyHyYyomS6yr6iaqPM3BeOtI/vi9heB1W
	 Hs8RDXvoNck0DzW1WwiMlPz+ozxv0D9b6MWkcSow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23FE2F804E1;
	Fri,  6 Aug 2021 12:30:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF76BF80268; Fri,  6 Aug 2021 12:30:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by alsa1.perex.cz (Postfix) with ESMTP id D47E9F8025F
 for <alsa-devel@alsa-project.org>; Fri,  6 Aug 2021 12:29:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D47E9F8025F
X-IronPort-AV: E=Sophos;i="5.84,300,1620658800"; d="scan'208";a="90032332"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 06 Aug 2021 19:29:46 +0900
Received: from localhost.localdomain (unknown [10.226.92.62])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2F76542208EF;
 Fri,  6 Aug 2021 19:29:43 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 2/3] ASoC: dt-bindings: sound: renesas,
 rz-ssi: Update slave dma channel configuration parameters
Date: Fri,  6 Aug 2021 11:29:29 +0100
Message-Id: <20210806102930.3024-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210806102930.3024-1-biju.das.jz@bp.renesas.com>
References: <20210806102930.3024-1-biju.das.jz@bp.renesas.com>
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

The DMAC driver on RZ/G2L expects the slave channel configuration
to be passed in dmas property.
This patch updates the example node to include the encoded slave
channel configuration.

Fixes: 5df6dfbb6de815ba3a("ASoC: dt-bindings: sound: renesas,rz-ssi: Document DMA support")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Note:-
 This patch is based on [1]
 [1]:- https://patchwork.kernel.org/project/linux-renesas-soc/patch/20210806095322.2326-2-biju.das.jz@bp.renesas.com/

v3->v4:
 * Updated bindings as the DMAC driver on RZ/G2L expects the
   slave channel configuration to be passed in dmas property.
v2->v3:
 * Merged the binding patch with dmas added
 * Updated dt binding example with encoded #dma-cells value.
v1->v2:
 * Rebased on 5.14-rc2.
---
 Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
index 471937cb8d05..9923e7b8264f 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
@@ -93,8 +93,8 @@ examples:
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

