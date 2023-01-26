Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6850067C808
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 11:08:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3CB3E7E;
	Thu, 26 Jan 2023 11:07:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3CB3E7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674727718;
	bh=LPtKBgBPGW2XCs/sGvAns4+JZzY1exrCf8GIGF3YziM=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=sg/jLTD8aFKu8lXxkeLmx5jVPBN05aGgNGrJtO8CAS15OaCEPHIyC/WPEeNyXkHlZ
	 y3QYItoPnA9Swk3327I6BzOmVEl7MZ3C9rJPvzVeOHruOAsBiMRpROUE401gWWtRbE
	 m/gz9MJZNRkn/v4CAHm+Whe55nFGNEUU0oAKKhZ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FA82F802DF;
	Thu, 26 Jan 2023 11:07:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D55FF80224; Thu, 26 Jan 2023 11:07:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33EBEF80224
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 11:07:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33EBEF80224
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=V8GT72ww
Received: by mail-wm1-x32f.google.com with SMTP id j17so792585wms.0
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 02:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0/C64VDfxrfMZ/1uEiB9zDHpUFLh7m1+xnmbS1pFOyk=;
 b=V8GT72wwmpsgfPbJCh3bZau3EqF2A4BmUXRINxha+xoOrYdxcwh7sGQJkDcYSMVt7d
 OEWhNIynscbTDMOde6Scdc3iOpLWjwbl0fDFquAtRZ2lvtpmDtFi4FGJLQLpx9+mmbAz
 WMCA5HMP7sCJQbCqtw1DXcsWpiwaSU6vwzCpxsdHeutZ1zotQeDyf/i7FbDxsmwAjcBf
 SC0ksg3nz1JTQ+jWQ4yGHPgt4wQlbaLLxcrcFydXqIEbTGqFeSGS/ubVFCT/vW4Kw65L
 2EFVzCsmXCMCB0wxJQTzW+Yn36mK8A50GcTo4kFXIEF4+CRyPfw8obfnqRd6wdCOVCs5
 ThRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0/C64VDfxrfMZ/1uEiB9zDHpUFLh7m1+xnmbS1pFOyk=;
 b=wQmI+d1BJ9lpdUgvIt/9JMgnQnxCTidFIMZtGHgz4SWCl9t3DBiTamdml1aH8FwlR4
 8vY8Jx9dNkF1DGqm69Vx9RuVRoNO9D/ULH9W08ZndOlKmDSubxc58wKywnkLxctvHrBb
 /NKhSVf/tJ3seVTNUX1FsDDag5shdqXuqqb7BWs9uLmAVo1xYnTsXWlqAIkgXrjlGh7k
 TrAuIf6/PeNLnv0Oz9NnoW2XI+nwcpI07Mi68H7QtKz8I3CH2SGULEqHHmYZZNiQn02v
 sRcYqWyEwWWSPYpTWtQ65fHMgf3JewCzBwt3P+E/K5qSwy1ndqSgi1hkckfLRncbeDr6
 YoFQ==
X-Gm-Message-State: AFqh2koxToMeT21YfA2G41Zq9Tho33Sxp8BhQMDLXENqcqk2B0OKYON+
 iZ9ffe1KjlBoCJT5L3MQ7NQBjA==
X-Google-Smtp-Source: AMrXdXuJjP3gif07dsS93YMwa0ud5oEd8szdXezHlD3wXohWvaPMrwT/AMVBSYVQSnEovOilt2svNQ==
X-Received: by 2002:a05:600c:3d16:b0:3d0:6a57:66a5 with SMTP id
 bh22-20020a05600c3d1600b003d06a5766a5mr35013737wmb.0.1674727648285; 
 Thu, 26 Jan 2023 02:07:28 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 l16-20020a7bc350000000b003d9aa76dc6asm5198839wmj.0.2023.01.26.02.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 02:07:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: renesas, rsnd: simplify list of compatibles
Date: Thu, 26 Jan 2023 11:07:22 +0100
Message-Id: <20230126100722.9473-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The fallback compatible in a list (the last one) cannot be enum, because
it is always fixed.  Also if such fallback is used alone ("Generic"
case), it's not a list anymore.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../bindings/sound/renesas,rsnd.yaml           | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index cb90463c7297..b1f08d6af38d 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -18,8 +18,7 @@ properties:
           - enum:
               - renesas,rcar_sound-r8a7778   # R-Car M1A
               - renesas,rcar_sound-r8a7779   # R-Car H1
-          - enum:
-              - renesas,rcar_sound-gen1
+          - const: renesas,rcar_sound-gen1
       # for Gen2 SoC
       - items:
           - enum:
@@ -32,8 +31,7 @@ properties:
               - renesas,rcar_sound-r8a7791   # R-Car M2-W
               - renesas,rcar_sound-r8a7793   # R-Car M2-N
               - renesas,rcar_sound-r8a7794   # R-Car E2
-          - enum:
-              - renesas,rcar_sound-gen2
+          - const: renesas,rcar_sound-gen2
       # for Gen3 SoC
       - items:
           - enum:
@@ -47,14 +45,12 @@ properties:
               - renesas,rcar_sound-r8a77965  # R-Car M3-N
               - renesas,rcar_sound-r8a77990  # R-Car E3
               - renesas,rcar_sound-r8a77995  # R-Car D3
-          - enum:
-              - renesas,rcar_sound-gen3
+          - const: renesas,rcar_sound-gen3
       # for Generic
-      - items:
-          - enum:
-              - renesas,rcar_sound-gen1
-              - renesas,rcar_sound-gen2
-              - renesas,rcar_sound-gen3
+      - enum:
+          - renesas,rcar_sound-gen1
+          - renesas,rcar_sound-gen2
+          - renesas,rcar_sound-gen3
 
   reg:
     minItems: 1
-- 
2.34.1

