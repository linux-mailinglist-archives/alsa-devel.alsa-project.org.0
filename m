Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3160828AAAA
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Oct 2020 23:17:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBF70166E;
	Sun, 11 Oct 2020 23:16:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBF70166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602451055;
	bh=6bE2PpCkTJfnl0HdYjoZAAddNp7flZJz15Xncs3f/0U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eu7PJiWA8akwtgcBMYg2/Ak8US0HZxmdSqV23sAG1mRtH2Z7gDUYL7qwUUGAvs5bh
	 K2SRMcRQK7hjWK1y2jwyju9GO6lVH78Ad/YzusihBcF5qHS/VjAggppFfU0eyWvXS6
	 D5D4hPNQpPyGWewbKS0khVQs/VHw7ZkzO6iydmIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DD62F801D9;
	Sun, 11 Oct 2020 23:15:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 055F2F8016F; Sun, 11 Oct 2020 23:15:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15A05F8013C
 for <alsa-devel@alsa-project.org>; Sun, 11 Oct 2020 23:15:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15A05F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jdC+7BpT"
Received: by mail-qk1-x742.google.com with SMTP id 140so14399727qko.2
 for <alsa-devel@alsa-project.org>; Sun, 11 Oct 2020 14:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BGMwpCPny3RgndL/RIfUXJU62LlywzivkVat0IltLS0=;
 b=jdC+7BpTtu+cTAPkIlP5w1k/ZxUanuqPnx+HTUIFtDadlji8eC41pYfxEtZqOMGNIc
 7iyS8Lyp9M/aFuKXpl3pROF1WVIkl1svN3Gp1p9P+UJhntOvgxhIHvC0ulGpqVgFG4qD
 qj3KaHMRt8HK/vHilc2UUpaeAqpK5dOuHn2Jp6M4nd4DPlq+qF2DyePKxdJI/wGJZjli
 gqhcqOZCLHolUs9LwZI0uBUg3JDv0wou/A8NJTbKn15NI8YaIRVUj+ZfKThTg1MVA+2o
 nGVneKa/qXI1Ppn+eq8Fd0wKFKK3LS33YPwdyQTxQmvSohYXl98KZK0iC17YTN49yDZI
 6b5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BGMwpCPny3RgndL/RIfUXJU62LlywzivkVat0IltLS0=;
 b=dvtzBguRdRV8O3mtbFrYQpGJ7fmjR3yF69LzQ9VyXnhRZahFxfSBgShV50M8GU02hp
 WZeRQgE3n5MouK7o0wWiahS5mFEtWNo7Qucjhn6RDBsiCYAi60CqA9k2hj+T+UAIFKR0
 2COQrDFpt+DDfLiHQi9k4PiSd6MN2FBpMDbDB/OHvdyGzJB/+Hwwb4VZUgFTwBlhFQB2
 L5r002P24v+YMXCxpbP+qHWlvWwynhf6byPpRg//riKsrp87l98KNmRyKbsuxLI9zx5s
 Dz9IT9CcrJ4h7IbRwE8iL+I8i/SkC0+Rg9KIif6hTRZGfwnhIrk3+pKsu7L0q7fFxq02
 fpTw==
X-Gm-Message-State: AOAM530LCxkyjnfNTouu+t+5NIzvD0sUMDIZ1wTveweKQUrU4c6QqVc5
 o7V3B9OdLVKL5q+ZY1BpGFg=
X-Google-Smtp-Source: ABdhPJwF+SsHvmQPe51fldj5gcTyxH6Xvw9hwU6GdQyA5xDUVx06mCaJcjs3HYhYKH1bE3w1tY6wDA==
X-Received: by 2002:a05:620a:1212:: with SMTP id
 u18mr7304858qkj.434.1602450948374; 
 Sun, 11 Oct 2020 14:15:48 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id z69sm11606403qkb.7.2020.10.11.14.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 14:15:47 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH] dt-bindings: sound: sun8i-a33-codec: Add Allwinner A64 codec
 compatible fallback
Date: Sun, 11 Oct 2020 23:15:42 +0200
Message-Id: <20201011211543.155561-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

make dtbs_check report a warning because the documentation
for the A64 codec compatible is missing.

The A64 codec compatible is actually a simple fallback to the A33.

Reflect this in the dt-bindings Documentation.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../bindings/sound/allwinner,sun8i-a33-codec.yaml           | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
index 55d28268d2f4..e78a22496e7c 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
@@ -15,7 +15,11 @@ properties:
     const: 0
 
   compatible:
-    const: allwinner,sun8i-a33-codec
+    oneOf:
+      - const: allwinner,sun8i-a33-codec
+      - items:
+        - const: allwinner,sun50i-a64-codec
+        - const: allwinner,sun8i-a33-codec
 
   reg:
     maxItems: 1
-- 
2.25.1

