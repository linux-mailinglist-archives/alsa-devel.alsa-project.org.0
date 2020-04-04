Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D78CA19E4CA
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Apr 2020 13:54:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D0B8166F;
	Sat,  4 Apr 2020 13:53:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D0B8166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586001266;
	bh=Wxxcle3Czx0yK4uTtWA6VEa/+0e6YbDsd9Ftg4Y8sIo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Eler2rE29pve1FXf3ySUPdT+MhvTAOOgGqGTgA5pACwLpNPL35DqAYJ8YKhBpFxl6
	 O9Kw9M5TAZyuvyfM4Uw5X38zxeuP+EgxFBjTFuU7mOvNwAid0flJQ9RrHGPZtGJjRT
	 mF+7TJSBieNdYkO2vpaXVjRgMkXtCvyLc1TVlQdc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EF4AF800E4;
	Sat,  4 Apr 2020 13:52:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1617CF8014B; Sat,  4 Apr 2020 13:52:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54E49F80058
 for <alsa-devel@alsa-project.org>; Sat,  4 Apr 2020 13:52:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54E49F80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KMcn9it0"
Received: by mail-wm1-x342.google.com with SMTP id t128so9876249wma.0
 for <alsa-devel@alsa-project.org>; Sat, 04 Apr 2020 04:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=J7JWQaNHlZkGey2CYstynUU1J9hNrgdTpL9zcYilbqk=;
 b=KMcn9it08ctna9tgMEQrsjpXRPY/0IlCndUov70cazbmUWifl1XfERwQwaWbxb8fnc
 CLSlKcbbvKF41FGA533Eo8T6KEFilYbQfMX6N8aj2xG5UyjGjz1EHWEzRMlxi47pQ6l/
 JbVRLrHt/o1cYKG4K+Cbl8/dAuKYYNau7sL18LJTBtmT5ZB7yvb5lxVrEYqrw+VOQPLg
 tHdn3DP5eElLfpIwficpxfYtQwSeKfIcHOzvNeTewtwjILWrUU9eROXl2mfMeT+3XpiG
 D2wB2Z5h4oRkvkYHL/5jX95ZgLH6PaAb1G/9UpiUXrBwceXrAL3QjS4G40EoPA50iojj
 fLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=J7JWQaNHlZkGey2CYstynUU1J9hNrgdTpL9zcYilbqk=;
 b=hFevr1SIyzbDCwyYXqdWTVUaUvvaXbYHEUtaBLQUaECcnSgyR23wzTsGp5QhSGgEgO
 rqnFjUMxgAQLZ4M3kpGiot7WhrmxzFcEtvDszAEAOh5gErisIJgtlwVo7BxnlhBvYGhe
 NKbl/ZK8FYM5Ji8oTXgWO2at5Lv/7J9SY0f2aa1LEvhy0g9/8L1YioeB9kmsPO03wWET
 li7STxwSvT1DFbZOHDpaacUPcdVOnUadFGHANQg+XRSUxABUQR28f4M61/ngJbk35jCn
 thdSdWMOHEMfcggOmgULdv6iOOFRLckzBOqzuP/GCqcKLsw/eOFK2xMNcrZlxDnXhYVB
 12Kw==
X-Gm-Message-State: AGi0Pubek97Y2o5ybkl9PmdMGXQzHOvWLmWGV8t5ne30dU63GsX328LR
 UHz9PbuS9NXmDI3cgpcj120=
X-Google-Smtp-Source: APiQypJOBCdxMEJ3ncc/Kkyn7t6jJ/t0d4nR31OFtbx1bKw5Uw1QEC7QFaR1ybRs/cSapZBPKEkpqg==
X-Received: by 2002:a7b:cbd6:: with SMTP id n22mr12504001wmi.29.1586001154733; 
 Sat, 04 Apr 2020 04:52:34 -0700 (PDT)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id g186sm16183276wmg.36.2020.04.04.04.52.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 04 Apr 2020 04:52:34 -0700 (PDT)
From: Johan Jonker <jbx6244@gmail.com>
To: lgirdwood@gmail.com
Subject: [PATCH v3 3/3] dt-bindings: sound: rockchip-spdif: add power-domains
 property
Date: Sat,  4 Apr 2020 13:52:25 +0200
Message-Id: <20200404115225.4314-3-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200404115225.4314-1-jbx6244@gmail.com>
References: <20200404115225.4314-1-jbx6244@gmail.com>
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
so add it to 'rockchip-spdif.yaml'.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes v3:
  Add reviewed by
---
 Documentation/devicetree/bindings/sound/rockchip-spdif.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
index f381dbbf5..c46715265 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
@@ -51,6 +51,9 @@ properties:
   dma-names:
     const: tx
 
+  power-domains:
+    maxItems: 1
+
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
-- 
2.11.0

