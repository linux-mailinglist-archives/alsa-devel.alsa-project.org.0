Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0C94C5FA1
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Feb 2022 23:58:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B403916F4;
	Sun, 27 Feb 2022 23:57:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B403916F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646002680;
	bh=RdW1ONC9GoJ1wEB3TVULjMeYwwsQQATKZLG43RvL6PA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qs9y+/0Mz3Il3MNAB2fbH91MbXbRJwgoB1PtsSdw7qKm+BYBSkL4aRp75QEl0EaGL
	 wI5OSXsUoEtClr8L/lsHTk4W396A8VJ7JHVgnnz7X0TcHzj1ipV/jZonlSnIaeFll1
	 qCcjW9OLD/0YMLZt4XiI4Pqzlml52zTFJs4+guWQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1408AF800B6;
	Sun, 27 Feb 2022 23:56:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA963F800B6; Sun, 27 Feb 2022 23:56:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by alsa1.perex.cz (Postfix) with ESMTP id D574DF800B6
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 23:56:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D574DF800B6
X-IronPort-AV: E=Sophos;i="5.90,142,1643641200"; d="scan'208";a="111726256"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 28 Feb 2022 07:56:41 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1E1B940062C3;
 Mon, 28 Feb 2022 07:56:38 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH] ASoC: dt-bindings: renesas,rz-ssi: Document RZ/V2L SoC
Date: Sun, 27 Feb 2022 22:56:32 +0000
Message-Id: <20220227225633.28829-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Document RZ/V2L SSI bindings. RZ/V2L SSI is identical to one found
on the RZ/G2L SoC. No driver changes are required as generic compatible
string "renesas,rz-ssi" will be used as a fallback.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
DTSI changes have been posted as part of series [0].

[0] https://patchwork.kernel.org/project/linux-renesas-soc/
patch/20220227203744.18355-10-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
index 414ff8035a4e..7e8d252f7bca 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/sound/renesas,rz-ssi.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Renesas RZ/G2L ASoC Sound Serial Interface (SSIF-2)
+title: Renesas RZ/{G2L,V2L} ASoC Sound Serial Interface (SSIF-2)
 
 maintainers:
   - Biju Das <biju.das.jz@bp.renesas.com>
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - renesas,r9a07g044-ssi  # RZ/G2{L,LC}
+          - renesas,r9a07g054-ssi  # RZ/V2L
       - const: renesas,rz-ssi
 
   reg:
-- 
2.17.1

