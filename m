Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7585F42C1BF
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Oct 2021 15:51:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E53B71684;
	Wed, 13 Oct 2021 15:50:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E53B71684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634133076;
	bh=nRPDRhezXgbjNUwR2KKDqwjOts6DKygUWLtp48OcxEs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qcLnLK7L1uLhP9SO3mbTgk19KgEiZ7yqqJBhPt/w6j8tRWIn9toGujgsQZgTlMKGW
	 9LrfF3GpyfRw1FQDc4VkRIIZO1k2wzP3H6GrHQZ4NEuKtDidiW0yL/08Vmqc22DabI
	 sfzj1BpBQZhR/AgLkVf+qf2LFUB274pOcQlg3ZbM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F201F800C0;
	Wed, 13 Oct 2021 15:49:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F254F80269; Wed, 13 Oct 2021 15:49:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67EA1F800C0
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 15:49:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67EA1F800C0
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:9c93:91ff:d58:ecfb])
 by baptiste.telenet-ops.be with bizsmtp
 id 5Rpk2600J0KW32a01RpkbH; Wed, 13 Oct 2021 15:49:46 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1maedc-004bZh-7n; Wed, 13 Oct 2021 15:49:44 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1maedb-0035bZ-Nx; Wed, 13 Oct 2021 15:49:43 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH] ASoC: dt-bindings: rockchip: i2s-tdm: Fix rockchip,
 i2s-[rt]x-route
Date: Wed, 13 Oct 2021 15:49:42 +0200
Message-Id: <606809e10db02f92b1e7f90c491cc72dd8e16f79.1634132907.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
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

make dt_binding_check:

    Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml: properties:rockchip,i2s-rx-route: {'required': ['maxItems']} is not allowed for {'$ref': '/schemas/types.yaml#/definitions/uint32-array', 'description': 'Defines the mapping of I2S RX sdis to I2S data bus lines. By default, they are mapped one-to-one. rockchip,i2s-rx-route = <3> would mean sdi3 is receiving from data0.', 'maxItems': 4, 'items': [{'enum': [0, 1, 2, 3]}]}
	    hint: "maxItems" is not needed with an "items" list
	    from schema $id: http://devicetree.org/meta-schemas/items.yaml#
    Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml: properties:rockchip,i2s-tx-route: {'required': ['maxItems']} is not allowed for {'$ref': '/schemas/types.yaml#/definitions/uint32-array', 'description': 'Defines the mapping of I2S TX sdos to I2S data bus lines. By default, they are mapped one-to-one. rockchip,i2s-tx-route = <3> would mean sdo3 is sending to data0.', 'maxItems': 4, 'items': [{'enum': [0, 1, 2, 3]}]}
	    hint: "maxItems" is not needed with an "items" list
	    from schema $id: http://devicetree.org/meta-schemas/items.yaml#

Drop the "-" from the enums to fix this.

Fixes: 510f1c133aedcf69 ("ASoC: dt-bindings: rockchip: add i2s-tdm bindings")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4/v5 differed slightly from what Rob suggested in his review of v3
https://lore.kernel.org/all/YS6kHkeOKCJMOOIf@robh.at.kernel.org/
---
 Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
index dce8b4136ec6db4e..ce3e18b50230dc9b 100644
--- a/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
@@ -112,7 +112,7 @@ properties:
       rockchip,i2s-rx-route = <3> would mean sdi3 is receiving from data0.
     maxItems: 4
     items:
-      - enum: [0, 1, 2, 3]
+      enum: [0, 1, 2, 3]
 
   rockchip,i2s-tx-route:
     $ref: /schemas/types.yaml#/definitions/uint32-array
@@ -122,7 +122,7 @@ properties:
       rockchip,i2s-tx-route = <3> would mean sdo3 is sending to data0.
     maxItems: 4
     items:
-      - enum: [0, 1, 2, 3]
+      enum: [0, 1, 2, 3]
 
   rockchip,io-multiplex:
     description:
-- 
2.25.1

