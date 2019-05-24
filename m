Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9E62986A
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 15:00:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8645016CC;
	Fri, 24 May 2019 14:59:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8645016CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558702834;
	bh=fiBN2WFBCqYaSAZQ++tWVBxsuF4SiFMiGCeKaLwvBe4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gQ1fSSQyhjowMHQU/msG9AmjiL2vORDYOBirqG58axqR/1LO+H9FgjYV2ZYhD8D6F
	 otcQsHbgjwYVnMUOj9TygykCD3xCrgyigjiggTWLQqiv+Mr1QpLlMNgHZ0Azfsp820
	 MQs4b5e0RzkTb8hEW4YgglbSIU4FIBGO64Y3EQ8I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8D03F89720;
	Fri, 24 May 2019 14:58:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3CA5F89718; Fri, 24 May 2019 14:58:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_26,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BA62F89636
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 14:58:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BA62F89636
X-Originating-IP: 90.88.147.134
Received: from localhost (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr
 [90.88.147.134]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 2BB20E0007;
 Fri, 24 May 2019 12:58:05 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Date: Fri, 24 May 2019 14:57:59 +0200
Message-Id: <9b280f9ce894e4e2ea7259db505cbe1a3e00120e.1558702660.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <5f8095fbd5c2c34478792b9715059675251a30e6.1558702660.git-series.maxime.ripard@bootlin.com>
References: <5f8095fbd5c2c34478792b9715059675251a30e6.1558702660.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH 2/2] dt-bindings: sound: sun4i-i2s: Document
	that the RX channel can be missing
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The A83t and compatibles controllers don't have any reception capabilities
on some instances of the controllers, even though it was never documented
as such in the binding before.

Therefore, on those controllers, we don't have the option to set an RX DMA
channel.

This was already done in the DTSI, but the binding itself was never
updated. Let's add a special case in the schemas.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml | 52 ++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 42 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
index 85b2d6d84055..eb3992138eec 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
@@ -41,19 +41,11 @@ properties:
       - const: apb
       - const: mod
 
-  dmas:
-    items:
-      - description: RX DMA Channel
-      - description: TX DMA Channel
-
-  dma-names:
-    items:
-      - const: rx
-      - const: tx
-
   # Even though it only applies to subschemas under the conditionals,
   # not listing them here will trigger a warning because of the
   # additionalsProperties set to false.
+  dmas: true
+  dma-names: true
   resets:
     maxItems: 1
 
@@ -72,6 +64,46 @@ allOf:
       required:
         - resets
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun8i-a83t-i2s
+
+    then:
+      properties:
+        dmas:
+          minItems: 1
+          maxItems: 2
+          items:
+            - description: RX DMA Channel
+            - description: TX DMA Channel
+          description:
+            Some controllers cannot receive but can only transmit
+            data. In such a case, the RX DMA channel is to be omitted.
+
+        dma-names:
+          oneOf:
+            - items:
+                - const: rx
+                - const: tx
+            - const: tx
+          description:
+            Some controllers cannot receive but can only transmit
+            data. In such a case, the RX name is to be omitted.
+
+    else:
+      properties:
+        dmas:
+          items:
+            - description: RX DMA Channel
+            - description: TX DMA Channel
+
+        dma-names:
+          items:
+            - const: rx
+            - const: tx
+
 required:
   - "#sound-dai-cells"
   - compatible
-- 
git-series 0.9.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
