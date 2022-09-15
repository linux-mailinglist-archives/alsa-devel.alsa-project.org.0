Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BA45B99E0
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 13:42:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D02151A28;
	Thu, 15 Sep 2022 13:41:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D02151A28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663242123;
	bh=5d4rtyVY1b+OQfdduXscPUQN8jtr+jjh9L3gDOUzvGo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XqtOFLCVqaV9P8efoKLT4dfuuuQMG8qOWH45jyh+lyqlkLsVRErXJArPBShow+oTw
	 RkBlyYNUjSr9S6S63++fq0ZHMUT7vy2idj6Fe6LdHlbLY5/nUAHxLN7Ysr6MhK4/Zx
	 3RoZNFS6hWQ/sYbTxdPmJRadyURznf9XrPwTZLOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DF9FF8053A;
	Thu, 15 Sep 2022 13:40:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2853F80536; Thu, 15 Sep 2022 13:40:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82D19F80238
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 13:40:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82D19F80238
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="OUjhnCQP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1663242003;
 x=1694778003; h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wnFQ1tb35qKbaGfqR/2XMvWyIaJYai8tjzpmbu59XnM=;
 b=OUjhnCQPb9nOjAtciJPwYITINgID3hs2P/zTFV7oqGaSzRLKkOYPDWjN
 oNwsbTOv7crwpkDfSe6MC9cAhjmxSm8SkKD8gCPFPo7zsGQ7bbq8SPTLk
 Vk14zUBSwt62PCDDVcjpQ71XKU7SMg7QAnI1f2lrgxLlxNljv/A3hvdYv
 zWaLsNFqvWXT8/kTWJ2krTHc9ry9h2aWSdIlF2WEbvgmH2iTDY7CAeY9Z
 pXK0f02qRptYlezwXGvfz/TrBqldLFKu4I51vRlo+isKbl41Bz1/srVct
 EWUNSWEJLamPV4QS61gbG4HiKoPIBkrEM/AaBZ4hzqHGdxehte4RZ8bpm w==;
From: Astrid Rost <astrid.rost@axis.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Dylan Reid
 <dgreid@chromium.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: sound: ts3a227e: add control of debounce
 times
Date: Thu, 15 Sep 2022 13:39:54 +0200
Message-ID: <20220915113955.22521-3-astrid.rost@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220915113955.22521-1-astrid.rost@axis.com>
References: <20220915113955.22521-1-astrid.rost@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Astrid Rost <astrid.rost@axis.com>, linux-kernel@vger.kernel.org,
 kernel@axis.c, Astrid Rost <astridr@axis.com>
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
 .../devicetree/bindings/sound/ts3a227e.yaml   | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/ts3a227e.yaml b/Documentation/devicetree/bindings/sound/ts3a227e.yaml
index 3512b1f1e32b..8c27f298733a 100644
--- a/Documentation/devicetree/bindings/sound/ts3a227e.yaml
+++ b/Documentation/devicetree/bindings/sound/ts3a227e.yaml
@@ -44,6 +44,35 @@ properties:
       - 7 # 2.8 V
     default: 2
 
+  ti,debounce-release-ms:
+    description: key release debounce time in ms (datasheet section 9.6.7).
+    enum:
+      - 0  #  0 ms (0)
+      - 20 # 20 ms (1)
+    default: 20
+
+  ti,debounce-press-ms:
+    description: key press debounce time in ms (datasheet section 9.6.7).
+    enum:
+      - 2   #   2 ms (0)
+      - 40  #  40 ms (1)
+      - 80  #  80 ms (2)
+      - 120 # 120 ms (3)
+    default: 80
+
+  ti,debounce-insertion-ms:
+    description: headset insertion debounce time in ms (datasheet section 9.6.5).
+    enum:
+      - 2    #   2 ms (0)
+      - 30   #  30 ms (1)
+      - 60   #  60 ms (2)
+      - 90   #  90 ms (3)
+      - 120  # 120 ms (4)
+      - 150  # 150 ms (5)
+      - 1000 # 1 s    (6)
+      - 2000 # 2 s    (7)
+    default: 90
+
 required:
   - compatible
   - reg
-- 
2.20.1

