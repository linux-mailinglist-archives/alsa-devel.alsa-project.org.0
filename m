Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB053015AF
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Jan 2021 15:11:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF5281AA6;
	Sat, 23 Jan 2021 15:11:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF5281AA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611411110;
	bh=aiXJK3MQhgXW9KnVJArCfnKesQwTLl5o1+rLqwzt0c8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z4oDI91PethHS3bkIfPWL6Ku3eu/HaxFcDmVPpm9+0swaE6k7InA89QLgbH53fEQ3
	 Ycc96iK8CxbzaqeuiMyP2Ao5r7wnwhnSTfWReEOTqt7OHEvCZecUIaf0QPgjNpL1ev
	 yiCQgqSD07y5YXK/QIsz9GVTUQXK6xH5tw3ON0TU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F125FF8026A;
	Sat, 23 Jan 2021 15:10:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFC54F80257; Sat, 23 Jan 2021 15:10:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F4C1F80083
 for <alsa-devel@alsa-project.org>; Sat, 23 Jan 2021 15:10:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F4C1F80083
From: Paul Cercueil <paul@crapouillou.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/3] dt-bindings: sound/ingenic: Add compatible strings for
 JZ4760(B) SoC
Date: Sat, 23 Jan 2021 14:09:56 +0000
Message-Id: <20210123140958.12895-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 Christophe Branchereau <cbranchereau@gmail.com>
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

Add the ingenic,jz4760b-codec and ingenic,jz4760-codec compatible
strings.

In the process, convert the previous compatible strings to use an enum
instead.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../devicetree/bindings/sound/ingenic,codec.yaml      | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/ingenic,codec.yaml b/Documentation/devicetree/bindings/sound/ingenic,codec.yaml
index eb4be86464bb..97d5f3819b27 100644
--- a/Documentation/devicetree/bindings/sound/ingenic,codec.yaml
+++ b/Documentation/devicetree/bindings/sound/ingenic,codec.yaml
@@ -15,9 +15,14 @@ properties:
 
   compatible:
     oneOf:
-      - const: ingenic,jz4770-codec
-      - const: ingenic,jz4725b-codec
-      - const: ingenic,jz4740-codec
+      - enum:
+          - ingenic,jz4770-codec
+          - ingenic,jz4760-codec
+          - ingenic,jz4725b-codec
+          - ingenic,jz4740-codec
+      - items:
+          - const: ingenic,jz4760b-codec
+          - const: ingenic,jz4760-codec
 
   reg:
     maxItems: 1
-- 
2.29.2

