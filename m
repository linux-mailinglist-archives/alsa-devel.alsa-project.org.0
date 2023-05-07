Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A406F9AB8
	for <lists+alsa-devel@lfdr.de>; Sun,  7 May 2023 19:46:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4169148A;
	Sun,  7 May 2023 19:45:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4169148A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683481609;
	bh=2NcZ2WvBlbyYxYwrf4ZK6YP55xG6Dag4aq1wFJkeDiM=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QmOfCGPG1IDvcPdRDj7vzxfhG7wdNwZG4ZRqGdpx5qpqj8HF19ci9C2tfnmy3m/eb
	 mEXxivI3IbhaNTGkKsSCrrQp64ycgzN9jYG2IwBAbWG7wat7/nXe8AQNcqWgf3CL7S
	 OdeX1Npy02xj4NTi4QDrsEJe2El0heyz6AT65WR0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D0C5F80310;
	Sun,  7 May 2023 19:45:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 853C0F8032D; Sun,  7 May 2023 19:45:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D92FBF80087
	for <alsa-devel@alsa-project.org>; Sun,  7 May 2023 19:45:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D92FBF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RpDW5Vi3
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-96622bca286so233094466b.1
        for <alsa-devel@alsa-project.org>;
 Sun, 07 May 2023 10:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683481546; x=1686073546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dBqbH1+Z/yG5/u58VKF5l00D91rsZqi2F+V+kyJbRdc=;
        b=RpDW5Vi3uTdoyCjyi53VzpkqVQaNrS40tYTDxbxN9kUakAZNq4qVOJTSuh3RHz/ggm
         KU3J2EdpqTqZD+IOwwMKe2M6gpQKXQKMBnJ1Y47q/bVip9GCzTMtKAaaGyyuvF7MQOT3
         YjK/D+sSTPW/vNKoSlrbrCxS7ZQ4WVmki1Xheqok/VhjyNk4hmdRYYUogfHOU8vKzh8f
         MV/ULu7RRUnxrspXFf/YirAreJJVzhUpmOZnyAaxVr+4JxUxYJPDsbqSEnKxk7J2nWA/
         yAwu2DhwRn0XC+XNC+a1kx5nHBJIen7vznQiujaiFyhqq54uJMDmDyRbKLduUk+KWjgI
         e4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683481546; x=1686073546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dBqbH1+Z/yG5/u58VKF5l00D91rsZqi2F+V+kyJbRdc=;
        b=YGoZ1SnY4Ia5I1TdMLvkZaSxZ+dhRlaHPnoIuwsL/oTZexDKdRLRBEVDeQJpJ2cJqb
         ie1pJTHMWakVJofN/soqo+sJxVTCu3/NW+lfjBxSAmIFqOvKPDZqk+0pBTZnxM8LFQ3m
         4qIgDCXTMqoVPHACR8dZwpBGYySFElqaHwlrLi1zJ5x1Yze7M8+UrGNlPSQbbeA5DjnU
         n6JgKUlCmu2e1wOwnQhddVLQeMopmn7jcKr9Hv9ON3FN3QmmHyCSC5D9aNilXGvHC9rS
         QpFV1Me7bAKkRMfmMtVQhUvpgTcVfRBzZCccWoDoH0JdEPNxEdz+qrE+Kh4xJ/FeTK/l
         YihQ==
X-Gm-Message-State: AC+VfDz6RNtkPXSZOtCA/sSN9/rfhSGcmA0QassT7qBKv352oQE3v1cg
	pfLenHDvkyKpOp1zb5rw8zob7w==
X-Google-Smtp-Source: 
 ACHHUZ5nFUVIAjPvidnpQiyRlIFWqFXgGzJU+QS95ur+bwGnLQ0VHfJA9T3y/aUGsZ06MePHXwR8gg==
X-Received: by 2002:a17:907:2d0b:b0:94a:6953:602d with SMTP id
 gs11-20020a1709072d0b00b0094a6953602dmr8408613ejc.37.1683481545978;
        Sun, 07 May 2023 10:45:45 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:1757:b51a:9965:e81])
        by smtp.gmail.com with ESMTPSA id
 d7-20020a1709067a0700b009662d0e637esm1828849ejo.155.2023.05.07.10.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 10:45:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rohit kumar <rohitkr@codeaurora.org>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: google,sc7180-trogdor: allow up to four
 codec DAIs
Date: Sun,  7 May 2023 19:45:43 +0200
Message-Id: <20230507174543.264987-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DGRBMBXJSOR4Q56PENC3LDTV5SU3ZXXM
X-Message-ID-Hash: DGRBMBXJSOR4Q56PENC3LDTV5SU3ZXXM
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DGRBMBXJSOR4Q56PENC3LDTV5SU3ZXXM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SC7180 Trogdor sound cards come with multiple audio amplifiers, so allow
up to four of them to fix dtbs_check warnings like:

  sc7180-trogdor-homestar-r3.dtb: sound: dai-link@1:codec:sound-dai: [[275], [276], [277], [278]] is too long

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/google,sc7180-trogdor.yaml       | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
index 67ccddd44489..666a95ac22c8 100644
--- a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
+++ b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
@@ -74,7 +74,8 @@ patternProperties:
 
         properties:
           sound-dai:
-            maxItems: 1
+            minItems: 1
+            maxItems: 4
 
     required:
       - link-name
-- 
2.34.1

