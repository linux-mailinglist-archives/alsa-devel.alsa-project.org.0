Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C39BC9EAF3
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 16:27:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5106415E2;
	Tue, 27 Aug 2019 16:26:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5106415E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566916065;
	bh=xKn9bjG2xgAoqUkJeMZGPy/xPYmqLDj+/fq6AMbnkL8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sdckEC5c5mxy1UM1xrEmzQ/gV6jczoZuLkZcHd/aZlSBnWQ37xefFC5E9O3GAyy7a
	 3TJNNFqPz5KVGaq+IDCHLwkTlwSE60DSZcYckcVc0d06rdu2Tyy3p418f/hn4l6CDb
	 ffYYsY4WySmd5EqHvhH8GUVmHOH9dlFoncCLf0LY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05C0BF802BE;
	Tue, 27 Aug 2019 16:26:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C290EF801ED; Tue, 27 Aug 2019 16:25:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43FF3F801ED
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 16:25:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43FF3F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mDK55b30"
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8828420828;
 Tue, 27 Aug 2019 14:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566915950;
 bh=KPrw+88StpQqBdqXYCLjfxmDIU+ZK0KlJvUmwYmZcl8=;
 h=From:To:Cc:Subject:Date:From;
 b=mDK55b30eEDgGIoDrh2j8AGHXubsHe/1jVg3Z0pQBNzRxlP/posS7sF2RvdC/sQgA
 0arc7USrKVHqvUejYIMJVBWd5Ma7cJSNkSGVy4xT7MwwkY3z6KeRK6xFEAu2s66ZiC
 JRFbhauToPXiwLhXehWLbKpl/XSkfFyVdDxtviWU=
From: Maxime Ripard <mripard@kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Date: Tue, 27 Aug 2019 16:25:43 +0200
Message-Id: <20190827142547.14577-1-mripard@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <mripard@kernel.org>
Subject: [alsa-devel] [PATCH 1/5] dt-bindings: sound: sun4i-spdif: Fix
	dma-names warning
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

From: Maxime Ripard <maxime.ripard@bootlin.com>

Even though the H6 compatible has been properly added, the exeption for the
number of DMA channels hasn't been updated, leading in a validation
warning.

Fix this.

Fixes: b20453031472 ("dt-bindings: sound: sun4i-spdif: Add Allwinner H6 compatible")
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 .../devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml
index e0284d8c3b63..38d4cede0860 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-spdif.yaml
@@ -70,7 +70,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: allwinner,sun8i-h3-spdif
+            enum:
+              - allwinner,sun8i-h3-spdif
+              - allwinner,sun50i-h6-spdif
 
     then:
       properties:
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
