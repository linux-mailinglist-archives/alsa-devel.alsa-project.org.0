Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D812A25CB73
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 22:45:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84EDE1ACB;
	Thu,  3 Sep 2020 22:44:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84EDE1ACB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599165946;
	bh=jQf1YvOOi6qqOrdkJa0hlJPeE/VEjcP4wOVbLqeX3js=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=indypVLJgTNyQbzRg0KLqNy14RCgW+yzO4/EHuHVxYb7Wi3fvR4fawGQ1g0QZkpGd
	 EB8Vmf8i2aJt4CVcQrtG4kjEViv50CB4ll3QGAxpXwopy//OPNngUVvUONoYOT66cm
	 xaPqkKrd7f9uFJ6vcV3izkxaVZ8sXcPeUa4ioYxM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD32FF80392;
	Thu,  3 Sep 2020 22:33:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4909CF802E1; Thu,  3 Sep 2020 22:33:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03055F802D2
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 22:33:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03055F802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="unymFlAv"
Received: from localhost.localdomain (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 845F120684;
 Thu,  3 Sep 2020 20:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599165189;
 bh=jQf1YvOOi6qqOrdkJa0hlJPeE/VEjcP4wOVbLqeX3js=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=unymFlAvsxJBHZVuoj7ah2m390fM5UKAcnYHWW0rts3GWScaOIKpbm2URLteZPJUJ
 WRns507l8M+gsoxxfUDPPoUvtH2rv/h8ExKajWoGGjthpBUZ8FzcXz68IZs86uDZs+
 z1Cbyp/c1zl3H9L9ySoci4NKJTxtpnBjlWigdCGE=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Subject: [PATCH 2/4] ASoC: samsung-i2s: Add missing properties
Date: Thu,  3 Sep 2020 22:32:48 +0200
Message-Id: <20200903203250.19830-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200903203250.19830-1-krzk@kernel.org>
References: <20200903203250.19830-1-krzk@kernel.org>
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

Usage of "unevaluatedProperties: false" is not correct as it suppresses
warnings about all undocumented properties.  Instead, add all missing
properties.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Fixup for:
https://lore.kernel.org/linux-samsung-soc/20200829142501.31478-6-krzk@kernel.org/T/#m7476a34a33a443d05d2f05988e43d6a34c6fb227
---
 .../devicetree/bindings/sound/samsung-i2s.yaml  | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.yaml b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
index 16dc81288115..2e3628ef48df 100644
--- a/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
@@ -41,6 +41,12 @@ properties:
       - samsung,exynos7-i2s
       - samsung,exynos7-i2s1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
   reg:
     maxItems: 1
 
@@ -58,6 +64,9 @@ properties:
           - const: rx
           - const: tx-sec
 
+  assigned-clock-parents: true
+  assigned-clocks: true
+
   clocks:
     minItems: 1
     maxItems: 3
@@ -92,6 +101,9 @@ properties:
           - const: i2s_cdclk2
     description: Names of the CDCLK I2S output clocks.
 
+  interrupts:
+    maxItems: 1
+
   samsung,idma-addr:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: |
@@ -104,6 +116,9 @@ properties:
   pinctrl-names:
     const: default
 
+  power-domains:
+    maxItems: 1
+
   "#sound-dai-cells":
     const: 1
 
@@ -115,7 +130,7 @@ required:
   - clocks
   - clock-names
 
-unevaluatedProperties: false
+additionalProperties: false
 
 examples:
   - |
-- 
2.17.1

