Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F06755BCA7B
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 13:15:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C3161666;
	Mon, 19 Sep 2022 13:14:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C3161666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663586103;
	bh=GXfZ9F4Y3kiUeg3qg5qDl6G4ZJfgeSPaCT6Z1d4mGl4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ljLfc0GQn+EUcSYOf9g52IBve2FK1ofNrIR9XEaiSNKDCogUVKVfuxzXSwRbX168F
	 UqLeXbrsaIPuQOH+xGgBRqqKGA5RvG6dgxx3kk6olrmqn1huIbQkvUYIghZoFFoK4k
	 rgiYgosFMUpZJhIiXEho8DnBSeNpHTYT3QP7ej80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B23BAF80542;
	Mon, 19 Sep 2022 13:13:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1D76F8023A; Mon, 19 Sep 2022 13:13:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78A10F8032B
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 13:13:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78A10F8032B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="V9piG1Sd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1663585986;
 x=1695121986; h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ztqf2NwNv1t+35CYf00l5OZcaluiYfDwfmYhtP8ylqc=;
 b=V9piG1SdT+OC2Xw7QqhvuJx1HnzFUnl2AT2zdOtFh1VjJw506aCpRjF8
 T5UhvKZWVTNvHabaJiux9lEBs/npp5Zv626htz4B0uoDc5IiQMGus7JCS
 kEu1K5pE56baXwcsQ98wRZvf4qA4puH3LmxJpqY7Ay/DXg7/kQ5F03+up
 8JgR6EGviSXyBothOckGFHYHrkUfpcJ6GbI71Ke5JlaPD9ClcP8Nti25v
 8bXWfZJD0ZRyUKH9Wa+g2zjMD+Qn8cQWJJKMz+8hi0VVjBeAxNjYM+mVT
 EPDsRL5K/+4W8gYRjaJ/dfau6h18lPr8CyUHn9JJrxJX0+lNcU3z+Pp23 Q==;
From: Astrid Rost <astrid.rost@axis.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Dylan Reid <dgreid@chromium.org>
Subject: [PATCH v3 2/3] dt-bindings: sound: ti,
 s3a227e: add control of debounce
Date: Mon, 19 Sep 2022 13:12:57 +0200
Message-ID: <20220919111258.3774-3-astrid.rost@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220919111258.3774-1-astrid.rost@axis.com>
References: <20220919111258.3774-1-astrid.rost@axis.com>
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
index 327d204cf957..76ce323ce965 100644
--- a/Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml
@@ -41,6 +41,35 @@ properties:
       - 7 # 2.8 V
     default: 1
 
+  ti,debounce-release-ms:
+    description: key release debounce time in ms (datasheet section 9.6.7).
+    enum:
+      - 0  #  0 ms
+      - 20 # 20 ms
+    default: 20
+
+  ti,debounce-press-ms:
+    description: key press debounce time in ms (datasheet section 9.6.7).
+    enum:
+      - 2   #   2 ms
+      - 40  #  40 ms
+      - 80  #  80 ms
+      - 120 # 120 ms
+    default: 80
+
+  ti,debounce-insertion-ms:
+    description: headset insertion debounce time in ms (datasheet section 9.6.5).
+    enum:
+      - 2    #   2 ms
+      - 30   #  30 ms
+      - 60   #  60 ms
+      - 90   #  90 ms
+      - 120  # 120 ms
+      - 150  # 150 ms
+      - 1000 # 1 s
+      - 2000 # 2 s
+    default: 90
+
 required:
   - compatible
   - reg
-- 
2.20.1

