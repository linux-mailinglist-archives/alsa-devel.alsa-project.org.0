Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F6C25B095
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 18:02:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9CE9185D;
	Wed,  2 Sep 2020 18:01:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9CE9185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599062549;
	bh=fKssNxEpGlEeBwAJ6aSQrLneqbFsntwOpiEKOEP4OVo=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ADr1HgJzlQKESAqUAVzaneLWbGBtMq59RkPSHR40VRN0YgY1234LBEl00oNqRxL75
	 5rHTG5T6+CGwGkRbiZDb5xbV0tTF7/kBexKj45xNz0hF6JrJ4pNgScjRtDK7QbW3UV
	 0Sc268zaWPJmjZ3VXYELbrMLKiwYpQgvA8+fLYOY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3483AF8024A;
	Wed,  2 Sep 2020 18:00:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08BA5F80212; Wed,  2 Sep 2020 18:00:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECAE4F800F3
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 18:00:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECAE4F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="yU3KFPSh"
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D2042072A;
 Wed,  2 Sep 2020 16:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599062433;
 bh=fKssNxEpGlEeBwAJ6aSQrLneqbFsntwOpiEKOEP4OVo=;
 h=From:To:Subject:Date:From;
 b=yU3KFPShOWBRqkV7u6Ory9Vzxd+pQ0OJ9CDFFBBx2tI2VCw6Ki/c30eGtFaTdZStz
 IEKRjzyatUsz87JCnWfZET2ogEppZE+1VnV5b/BIx4+QlZz68SIBUO/9vjEUVrQeN0
 vgpCsNDQwWg7r8Un7KXMlZ5KWvdR9wNpLFTwLRl0=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jonathan Bakker <xc-racer2@live.ca>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: aries-wm8994: Match compatibles with enum
Date: Wed,  2 Sep 2020 18:00:25 +0200
Message-Id: <20200902160025.20922-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
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

The common pattern for enumerating compatibles is enum, not oneOf.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../bindings/sound/samsung,aries-wm8994.yaml          | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml b/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml
index 902a0b66628e..1c6947294825 100644
--- a/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml
@@ -11,12 +11,11 @@ maintainers:
 
 properties:
   compatible:
-    oneOf:
-      - const: samsung,aries-wm8994
-        description: With FM radio and modem master
-
-      - const: samsung,fascinate4g-wm8994
-        description: Without FM radio and modem slave
+    enum:
+      # With FM radio and modem master
+      - samsung,aries-wm8994
+      # Without FM radio and modem slave
+      - samsung,fascinate4g-wm8994
 
   model:
     $ref: /schemas/types.yaml#/definitions/string
-- 
2.17.1

