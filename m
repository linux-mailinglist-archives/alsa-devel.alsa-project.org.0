Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E73F1B8F00
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Apr 2020 12:44:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C1BC166D;
	Sun, 26 Apr 2020 12:43:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C1BC166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587897847;
	bh=Jvy3ne5DgM8OayHGMO9Ywg9q85cO1bdmYPOMsFS877Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pM3LsVkIQrFHO4/XqlEkR9S4QAFJxRW1e/iklXE3DiMQdbN1L03WrLQ5/i9mpaa4V
	 fDlh3Stwh6cPxYDm5Zh2YiFZqg4Br+tk9EM8i/9lbadX4SpxWRN3GunQEycvz7MEzf
	 P3I+4mt2Gsp6l/CZuHnolexC7RlAbfe26HfRsrCQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 116DEF80290;
	Sun, 26 Apr 2020 12:41:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 921E0F80291; Sun, 26 Apr 2020 12:41:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 361C7F80105
 for <alsa-devel@alsa-project.org>; Sun, 26 Apr 2020 12:41:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 361C7F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pEb5M+j3"
Received: by mail-wr1-x444.google.com with SMTP id k13so16981553wrw.7
 for <alsa-devel@alsa-project.org>; Sun, 26 Apr 2020 03:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0RLyOmcQjC6vn1XEI3ccjJ++FkYMXRfGQ9jNbYoBA2Y=;
 b=pEb5M+j33W1xdCZzu21ZGMF+y2nvgxguxmT+udwzHEM0LMxryFmKJ67rCuQP00C/u3
 A84XG/yMmH6KqcO1Rod12V7w7z0IX0KrPCjEi64ihqn5kCl8VDGl3eRovoBaJccpVE5e
 STzoypdReKUshsrOPPueZegajrpg9FuuzMGQqpq0X9VAvIq0DTHGeKOZhTb63TN7xuUo
 oTyXrW2bosLUdfpZpicvAYyDeJBQl9eb/dbk85F4wMVmTDnC+6bS8bJZ2HeMo5RApxXR
 fYou2YCU7/OMTscpr01z2q9MJpjb07ew1nDMxYQNMu19nLcROy1f9GGDjt07oVWWxCes
 98Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0RLyOmcQjC6vn1XEI3ccjJ++FkYMXRfGQ9jNbYoBA2Y=;
 b=YssnumjtfzlnB7RkemD2ByJ8pIDtLd6WceOKgJf0GwIYUF0OoHkFXaYMlLgAySHuBO
 t2Z7qgDvBHXYSdk+y4sDZA3OMvXQjGEotE632DXAdXkBWAg4xYnGhwO0XrwbaDCnPDgw
 Vz8wXJ7RBGodxGeN1a4Gzq6HyhyQddjKIOnIR9qvO9oJ5yKNQl19NBw6jolY/Masayp/
 WzndUUAEW/40bUHxx5fXedvvXPIqJmoG/5x5ZK7q8IxKZhe1TGFVOL4drG0I4T4hsdJX
 aiUat6prx/IGDJwjCrP6+GdztWPbguarC5SdItSGtYXFQBK8HbsnOn6bZMj6pCovddU9
 zNiQ==
X-Gm-Message-State: AGi0PuYubvr6xpsZ72K01FZKx7ILLantiQCuYneqoTYPy3hCwHPElfdM
 lveSTUT2vue8Mt9mb27COyI=
X-Google-Smtp-Source: APiQypIhe1kOoZzu4/c9rSC9Ti+Iwj5P6aeWjhvnEk5fJtGoRvCnoPEUiUPZECcqv9GEFT1eQS0ZiQ==
X-Received: by 2002:a5d:6847:: with SMTP id o7mr21795688wrw.83.1587897681018; 
 Sun, 26 Apr 2020 03:41:21 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0:59f6:22c5:d1f3:662d])
 by smtp.gmail.com with ESMTPSA id
 y10sm10491793wma.5.2020.04.26.03.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2020 03:41:20 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 2/7] dt-bindings: ASoC: sun4i-i2s: Add H6 compatible
Date: Sun, 26 Apr 2020 12:41:10 +0200
Message-Id: <20200426104115.22630-3-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200426104115.22630-1-peron.clem@gmail.com>
References: <20200426104115.22630-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, linux-kernel@vger.kernel.org,
 Marcus Cooper <codekipper@gmail.com>,
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

From: Jernej Skrabec <jernej.skrabec@siol.net>

H6 I2S is very similar to H3, except that it supports up to 16 channels
and thus few registers have fields on different position.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
index 112ae00d63c1..606ad2d884a8 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
@@ -24,6 +24,7 @@ properties:
       - items:
           - const: allwinner,sun50i-a64-i2s
           - const: allwinner,sun8i-h3-i2s
+      - const: allwinner,sun50i-h6-i2s
 
   reg:
     maxItems: 1
@@ -59,6 +60,7 @@ allOf:
               - allwinner,sun8i-a83t-i2s
               - allwinner,sun8i-h3-i2s
               - allwinner,sun50i-a64-codec-i2s
+              - allwinner,sun50i-h6-i2s
 
     then:
       required:
-- 
2.20.1

