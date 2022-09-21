Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A09FD5BF8EA
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 10:20:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 255EBAE9;
	Wed, 21 Sep 2022 10:19:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 255EBAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663748428;
	bh=0aYNSb7sCJDJuC/ULWHjHRCaBy2BpzPo0V6Ow3iEPt4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JuIETtUk1ktnspC2F7y/60j/h+VWQQsZs3XjBa/B4mNtSYs6Hl5JcglZOXRcLm55G
	 QpL0wTZ/MLKakf4jVpZtxIyaMcKgDJQxvn5AkGl4R81LAHHIkpGSQYIh4fUYkd3F5C
	 anbX3XIHSBKVRdIaa94NVF2dQNYBTgMtdpEAax+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 237A3F8053A;
	Wed, 21 Sep 2022 10:18:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DA67F80256; Wed, 21 Sep 2022 10:18:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 257B8F80256
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 10:18:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 257B8F80256
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="EARkU5VK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1663748320;
 x=1695284320; h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tGA4GqW7YQiOiFab+QJ8IuR8a0LUSCorsjEVc9ac2Vo=;
 b=EARkU5VKU8dIaElJHylMHlQiq4mEH9iXAhX2Tw9AKSa13+8LsO/PdAiM
 egunNOadD8ewEzzZ895O58g+BkHcPAo/OGXwpbJFmdvATFKd8FQlpCpxz
 s/6j4hVHi2UvVr6N44e5iI9brlpBwwv4wwUt/NomrwHTFdGkCEe0L9Bkb
 kTyyk7HizPuTrW8NquitdURV4BON6341lmjpa4T6p7vP2yFjW7FQHeT56
 48bt33sB8Y1HY7D3cS56Tq6AWluyVL94EBYUCX5vivZMH8jpW0wOM5uIl
 HwR+dE2n+w/AmX/2NDi20/jORLONsCDwLX6iOYmM7emGtltNwYRZy42eS g==;
From: Astrid Rost <astrid.rost@axis.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Dylan Reid <dgreid@chromium.org>
Subject: [PATCH v4 2/3] dt-bindings: sound: ti,
 ts3a227e: add control of debounce
Date: Wed, 21 Sep 2022 10:18:33 +0200
Message-ID: <20220921081834.22009-3-astrid.rost@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220921081834.22009-1-astrid.rost@axis.com>
References: <20220921081834.22009-1-astrid.rost@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Astrid Rost <astrid.rost@axis.com>, linux-kernel@vger.kernel.org,
 kernel@axis.com, Astrid Rost <astridr@axis.com>
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

Add devicetree parameters to control the insertion, release and press
debounce times.

Signed-off-by: Astrid Rost <astrid.rost@axis.com>
---
 .../bindings/sound/ti,ts3a227e.yaml           | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml b/Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml
index 327d204cf957..785930658029 100644
--- a/Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml
@@ -41,6 +41,35 @@ properties:
       - 7 # 2.8 V
     default: 1
 
+  ti,debounce-release-ms:
+    description: key release debounce time in ms (datasheet section 9.6.7).
+    enum:
+      - 0
+      - 20
+    default: 20
+
+  ti,debounce-press-ms:
+    description: key press debounce time in ms (datasheet section 9.6.7).
+    enum:
+      - 2
+      - 40
+      - 80
+      - 120
+    default: 80
+
+  ti,debounce-insertion-ms:
+    description: headset insertion debounce time in ms (datasheet section 9.6.5).
+    enum:
+      - 2
+      - 30
+      - 60
+      - 90
+      - 120
+      - 150
+      - 1000
+      - 2000
+    default: 90
+
 required:
   - compatible
   - reg
-- 
2.20.1

