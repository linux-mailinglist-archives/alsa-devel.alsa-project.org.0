Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D091909D3
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Mar 2020 10:44:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38421852;
	Tue, 24 Mar 2020 10:43:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38421852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585043086;
	bh=Usfuh97BYlDix/E3LCky2dSejZxOI77Sp4PGNYX16GE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cWG744PsuTQotePq5YVz85uJnP92JMhSnrXGlLf83KFab4VGgTafi3K0eJFQraX6X
	 8Epp7bVLIvufI2ZBBqifWztwPp3LsJFpsZAER6PdJ2HbH7nDZOPEkN2quWfPlumJrE
	 4r5gdhZqAtlVNElvOh3bU9uMNPFsa3isLEwZj9ps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 522D7F80273;
	Tue, 24 Mar 2020 10:42:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A8C2F80249; Tue, 24 Mar 2020 10:42:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B48E9F801F9
 for <alsa-devel@alsa-project.org>; Tue, 24 Mar 2020 10:41:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B48E9F801F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="t3N5twz1"
Received: by mail-wr1-x441.google.com with SMTP id j17so17133821wru.13
 for <alsa-devel@alsa-project.org>; Tue, 24 Mar 2020 02:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dfxSm/ZXM3N66X722SNsL52L/LGFXqsTtz+9P19Vsaw=;
 b=t3N5twz1dwcUQlv/08FOM9GloZJW4uZFPOoAGwANFxm+gRTe7xCqofDI6qPDLyif0I
 EKQz1253Y/rNmPOh+fUE4y4OiDiLPLkrhoI+TKhmK5sjXDtCL1D/LuEtCUxjkMZaId07
 o8mmzuIja7j7REE1UdenUBxgPbbhXKBA4dwFA35SfT6ap1e8zFHy1RkAomULznQlAi+0
 As9q2Ey7X3TXiHSzybimrHuKLKdRiuRPnt49y9lb9QB86QNEIv8xMi1pn2RW97lwZ1E5
 KagS2B/fuqU5oVwOCble67kAx9WmHsXkcznJRjUbSoe/wtRfhnhF7FZoQbaImvc6yha/
 2JJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dfxSm/ZXM3N66X722SNsL52L/LGFXqsTtz+9P19Vsaw=;
 b=RAsjxlhhYL/FppR7qF2XsliuVpZQc+CLr4VleJQCGBEiD5Z3iMzReOjJgOGaPQC7FO
 5RIb4TanmceIisD7sTET6tsa3gVbNy2igNn2NtWBSpw3QdSqiY8H4E5oxiCnKxy1FvjD
 UeeT/BgaCEN7kJD9u38JH+QfR76PssmSt5PJLI8CY0eegpXBc8D3ryoyWF13cCzXqmsL
 1xHnpP3I2MMLJf7FdUrHr0GUrRhqrrf7sQCs3pIErHvPdibB1KFpuee5zBvJpwXRyjtU
 V/+YOwgqwxijcHdEYFvPbUgOe25QscY8dWx+8tkzc8SDqTmM3r4rIDw4oSAVeimkxVx1
 GnLw==
X-Gm-Message-State: ANhLgQ2pyrCUd469ZbTCeeq6FqMuGAsE2tqHH+rZa3+oU2MDJvGUCQzO
 wD+h3gj8HySbAcBz6yu5FpU=
X-Google-Smtp-Source: ADFU+vvzCwo910TMGcnGtFYdDqZ3y/Vb2IoyGQ7eCMIcLg9baIfRO2Gk1omipjrbpyK3LZsE5oNM2A==
X-Received: by 2002:adf:d0cb:: with SMTP id z11mr13022001wrh.1.1585042919263; 
 Tue, 24 Mar 2020 02:41:59 -0700 (PDT)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id r15sm22489916wra.19.2020.03.24.02.41.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 24 Mar 2020 02:41:58 -0700 (PDT)
From: Johan Jonker <jbx6244@gmail.com>
To: lgirdwood@gmail.com
Subject: [PATCH v2 3/3] dt-bindings: sound: rockchip-i2s: add power-domains
 property
Date: Tue, 24 Mar 2020 10:41:49 +0100
Message-Id: <20200324094149.6904-3-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200324094149.6904-1-jbx6244@gmail.com>
References: <20200324094149.6904-1-jbx6244@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, heiko@sntech.de,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
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

In the old txt situation we add/describe only properties that are used
by the driver/hardware itself. With yaml it also filters things in a
node that are used by other drivers like 'power-domains' for rk3399,
so add it to 'rockchip-i2s.yaml'.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/sound/rockchip-i2s.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml b/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
index 7cd0e278e..a3ba2186d 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
@@ -56,6 +56,9 @@ properties:
       - const: tx
       - const: rx
 
+  power-domains:
+    maxItems: 1
+
   rockchip,capture-channels:
     allOf:
       - $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.11.0

