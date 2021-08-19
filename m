Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1994F3F1725
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Aug 2021 12:14:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 364BD16A5;
	Thu, 19 Aug 2021 12:13:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 364BD16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629368042;
	bh=73lsVS6eA5TSCLQ+KSWUbfZlnbbf/rsN8htS2odRx7A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uQw9fkoIu1xGQFkp6+pLzM1tg2FAK5KAA3Q2lOwjOmH2+ZMca2hrialn8cDoi/SZJ
	 5a4TUDZGgZvSdGw+F31p0cnWMoC10T8unzAUtJqWx4PIznG9ZcKa0KRUUMMC6HLITD
	 pSct9BJRRupsWaXpNWSW9RHnCl2fdAKgqy6MwDWo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13E46F80272;
	Thu, 19 Aug 2021 12:12:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 888CDF80301; Thu, 19 Aug 2021 12:12:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C1DDF800CC
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 12:12:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C1DDF800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="wVPEuqgF"
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 7ACB63F0B9
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 10:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629367926;
 bh=1q/zDNJ6stj36dAWcIJjYp9AynEo5sG0UMyf+ThhM+A=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=wVPEuqgFXcn4EDow6JF/qJHX4brvkeSCUtWVHJw+9W4oVlxVOfX3kgEMo/10WDiEe
 rhCM2ts0IrHo72VbXX5GyTVHlBv7BiCS4NRUT/RPdQ9juAbrx+vlnJ1X+QuFA8x9b2
 1lP6mbE34GsZajUe5hjVEGHU58o4/czkkkraCIxy3X0ZdsWOy5HaWZdsqxQhhtpH1Q
 CiqC617uWgTNVT2m/m6wlBDmbBRzZfakmeR/g9MbkDxpTwMHT7XSOmm2/noFnkHP1+
 91djeTdID9cx/9Pj4/E/gZ+iuH9ZmRgbwVGERJKrCyv8mR2QE2Xs3z11QgGfh2nuBj
 dQb+OZF39vsYA==
Received: by mail-ed1-f70.google.com with SMTP id
 e3-20020a50ec830000b02903be5be2fc73so2555221edr.16
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 03:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1q/zDNJ6stj36dAWcIJjYp9AynEo5sG0UMyf+ThhM+A=;
 b=ie9HiIHKDuTIV6cPDyksBDG/NN+bknOyokLTU0x3IE4RcLv3paBmhWGM9qKM3G9xrf
 gIYYDX/KiOPvvnDenY9EIQbFvO4VPdI64Lh/uJG5OxJavlCVDKDlFkyOA83Wut1YScDL
 7DKIZIgpWWDIP8jBmD5JTkwEXmC3KrJFDOt3VXiy7eFlK0sMfNqio1/muNxPC7s1ExiQ
 hLy9GFC42oQkKyBYeiFj0ftirZD+1cB+CPy4qbfISI9NRl6iwUdAUmnU+UX+Orb4q/zR
 Rn+E0l5s5AUaRkKMYZGc/R565d6xTupcfuStKPCoA6oD1JbpWwd/vpr4gbWTJBbpkmXU
 oKxA==
X-Gm-Message-State: AOAM531/A5iCCwbsl/8TPYWOYpn9f3a2MyifexQY4CoS6CTkPdOgmQ8b
 io/VyhFs0pemq8g7vVHqtI0SvsXu0ltsPKmBGTsi4IR9agDZxMuluDAyAGH/cOMCNNGEYoOfRl+
 2KY/gdcvaTb5bqe3l4CYNiy2G0eiZZEaGbcjntmeN
X-Received: by 2002:aa7:d896:: with SMTP id u22mr15367866edq.290.1629367926295; 
 Thu, 19 Aug 2021 03:12:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxI9zNnopbbqxOQWW/ned2EnZ+8UkkZ3IeaEL4Nm49q++mydI6Q/iekQrW4vzQouXJ2dmMtNg==
X-Received: by 2002:aa7:d896:: with SMTP id u22mr15367839edq.290.1629367926151; 
 Thu, 19 Aug 2021 03:12:06 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id bs13sm1031774ejb.98.2021.08.19.03.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 03:12:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Dillon Min <dillon.minfei@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: [PATCH 2/2] dt-bindings: sound: rt1015p: correct indentation
Date: Thu, 19 Aug 2021 12:10:20 +0200
Message-Id: <20210819101020.26368-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819101020.26368-1-krzysztof.kozlowski@canonical.com>
References: <20210819101020.26368-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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

Use common enum instead of oneOf and correct indentation warning:
  realtek,rt1015p.yaml:18:7: [warning] wrong indentation: expected 4 but found 6 (indentation)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/sound/realtek,rt1015p.yaml          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml b/Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml
index f31d3c4d0192..fdb7f295ef2d 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml
@@ -15,9 +15,9 @@ description: |
 
 properties:
   compatible:
-      oneOf:
-        - const: realtek,rt1015p
-        - const: realtek,rt1019p
+    enum:
+      - realtek,rt1015p
+      - realtek,rt1019p
 
   sdb-gpios:
     description:
-- 
2.30.2

