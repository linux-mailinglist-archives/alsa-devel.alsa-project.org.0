Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FDE1C885F
	for <lists+alsa-devel@lfdr.de>; Thu,  7 May 2020 13:34:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 456841814;
	Thu,  7 May 2020 13:33:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 456841814
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588851272;
	bh=LkCRN2RVTW6bV8u2IxPJzAzzlOrbqz4YbHN97fAEQ/4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LrdvOrYUJNEQhSSOgAzukLalAuBuTYopbV/p/ZUjdgOTA6RFeI/ejaSDiYHdJM6Wn
	 HZZLm4NMmX1ybMdaTMhdfEtvn9vqQyprAd9vwlc3vBQU0k3bdYNC+6+14rnQH2Qm9q
	 5XJmVVJyAQ7GOBubnHKoc2q81YAsAcuLu1sNt0Rk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61A92F8015B;
	Thu,  7 May 2020 13:32:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80EC9F8015F; Thu,  7 May 2020 13:32:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D06EF8011C
 for <alsa-devel@alsa-project.org>; Thu,  7 May 2020 13:32:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D06EF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ezklgun3"
Received: by mail-wr1-x442.google.com with SMTP id i15so5512126wrx.10
 for <alsa-devel@alsa-project.org>; Thu, 07 May 2020 04:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=miVjUF+kU459Gr4P0bFX33XFzImTaFGt5nwVSljspPk=;
 b=ezklgun3NG8L1ZLbd0I/M8AZkRmb1NVMMIzZtOYA91JKlr7sDY4h8dRsT8fHiZr5sc
 2sKrYYkfWy7mm6Dop7KFiE7THZONbRDESBN5SaxRJyxxPlV75OGFN5EwIeHYNMfcUs+7
 WHfoMElCdA+YwRMYWk7eDqMnoBRVoOdWHVwFqlgVvXodrb/6OyPVetautl0IkOlR0lSd
 bhoqGy1Uwk+sx7DQBfov++lxLzCGHj2VbAqkaGnjQyqRWtZU9QeEENpE13pjwZsSlp0c
 prbBP2cwXGsLBVjkN2TnjXD2QppwjO/pDiBiyJtvIxq1e2LCMS0YGWJdTZe2otTlprTs
 k33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=miVjUF+kU459Gr4P0bFX33XFzImTaFGt5nwVSljspPk=;
 b=d1YX3So/OB/slEzk2csySGiO9jt/T/UpMD1XW0x3qZXbJi6BLd4BUnuD1XLDbPTbdg
 ou9hUyBAFQUaVwbUwHTIc1abjGbyjaajDDo+xMe1JsYNGz3hGNgA0nvMSr+yvS5K6AdR
 outRdR2jl3NH5Il36czSrVMcA8mrky/miC4yw+mwLzaNka37sxBPESziVpQaZtjs7TjF
 sJlOalQJrVJR4oUzsZJfnHQYpjWco1kP6PXO4PkRHFr6x72fCFRCvLBedkN76ykvbLNb
 ydu+o/0jKrwL+bHfx6PtjyFnUttK+ikyiRyZ3dd0xOkZG06Imh+f9xPNiIYiq30S+vlq
 jv/A==
X-Gm-Message-State: AGi0PuYO9a9YyNOXk6FrFZ0F1pOAdQRQLhfhJzrgFcMO/K7v6Mi+MJMn
 p5iDyDkZq7ZwUT/5RN5OA5A=
X-Google-Smtp-Source: APiQypKZOjvXEiIprA5Ny63FeE9kMmGQs4HOWplnvTx4gD1ekq4zG5NManY4iny4mcyhjAje3EfW1Q==
X-Received: by 2002:a5d:6712:: with SMTP id o18mr16171936wru.115.1588851165984; 
 Thu, 07 May 2020 04:32:45 -0700 (PDT)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id e21sm7745787wrc.1.2020.05.07.04.32.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 04:32:45 -0700 (PDT)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v1] ASoC: rockchip-i2s: add description for rk3308
Date: Thu,  7 May 2020 13:32:38 +0200
Message-Id: <20200507113238.7904-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, broonie@kernel.org,
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

The description below is already in use for rk3308.dtsi,
but was somehow never added to a document, so add
"rockchip,rk3308-i2s", "rockchip,rk3066-i2s"
for i2s nodes on a rk3308 platform to rockchip-i2s.yaml.
One of the rk3308 i2s nodes also has a different dma layout,
so change that as well.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
The rk3308 i2s nodes also contain the properties
"reset-names" and "resets". Code in the manufacturer tree is
not yet applied in the mainline kernel, so skip them for now.
---
 Documentation/devicetree/bindings/sound/rockchip-i2s.yaml | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml b/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
index a3ba2186d..10f9d3ad0 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
@@ -24,6 +24,7 @@ properties:
             - rockchip,rk3188-i2s
             - rockchip,rk3228-i2s
             - rockchip,rk3288-i2s
+            - rockchip,rk3308-i2s
             - rockchip,rk3328-i2s
             - rockchip,rk3366-i2s
             - rockchip,rk3368-i2s
@@ -47,14 +48,15 @@ properties:
       - const: i2s_hclk
 
   dmas:
-    items:
-      - description: TX DMA Channel
-      - description: RX DMA Channel
+    minItems: 1
+    maxItems: 2
 
   dma-names:
-    items:
-      - const: tx
+    oneOf:
       - const: rx
+      - items:
+        - const: tx
+        - const: rx
 
   power-domains:
     maxItems: 1
-- 
2.11.0

