Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FFF2229DB
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 19:27:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58C4F165E;
	Thu, 16 Jul 2020 19:26:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58C4F165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594920454;
	bh=EcAFvb3yuK2fhuSlEmC8BMDdVY3Iz3Xi/s17109cU9o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DtKR3wp2R12KCmu3uOd/iS1R9zHiWqs106g28IPz5i6Gr6Ex1G6UeMKhhopvUC4Nc
	 tOZ8eYoVYiJ5LTEowX16yTQYWYvQBgy6LuuzNtHnHwdKCJ6n1+T86EdHHByRAgxUnB
	 viHDIHtZskf94KZ4fr2PlGgGPTIUu69Id7qFO+wo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 651CBF80336;
	Thu, 16 Jul 2020 19:19:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05A83F80338; Thu, 16 Jul 2020 19:19:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 476C9F80333
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 19:19:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 476C9F80333
X-IronPort-AV: E=Sophos;i="5.75,360,1589209200"; d="scan'208";a="52107238"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 17 Jul 2020 02:19:46 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id BE72740B55ED;
 Fri, 17 Jul 2020 02:19:41 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Jens Axboe <axboe@kernel.dk>,
 Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Mark Brown <broonie@kernel.org>, Niklas <niklas.soderlund@ragnatech.se>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Subject: [PATCH 12/20] dt-bindings: dma: renesas,
 usb-dmac: Add binding for r8a774e1
Date: Thu, 16 Jul 2020 18:18:27 +0100
Message-Id: <1594919915-5225-13-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: alsa-devel@alsa-project.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, linux-ide@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, linux-i2c@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-media@vger.kernel.org
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

Add binding for R8A774E1 SoC (RZ/G2H).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
---
 Documentation/devicetree/bindings/dma/renesas,usb-dmac.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/renesas,usb-dmac.yaml b/Documentation/devicetree/bindings/dma/renesas,usb-dmac.yaml
index 03aea6ae651f..ab287c652b2c 100644
--- a/Documentation/devicetree/bindings/dma/renesas,usb-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/renesas,usb-dmac.yaml
@@ -24,6 +24,7 @@ properties:
           - renesas,r8a774a1-usb-dmac # RZ/G2M
           - renesas,r8a774b1-usb-dmac # RZ/G2N
           - renesas,r8a774c0-usb-dmac # RZ/G2E
+          - renesas,r8a774e1-usb-dmac # RZ/G2H
           - renesas,r8a7790-usb-dmac  # R-Car H2
           - renesas,r8a7791-usb-dmac  # R-Car M2-W
           - renesas,r8a7793-usb-dmac  # R-Car M2-N
-- 
2.17.1

