Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CDA729C4E
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 16:08:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF80F204;
	Fri,  9 Jun 2023 16:07:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF80F204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686319696;
	bh=ghzM0f+3e3bi1a2M2jnIxlnndv8bDKtwasIbfqg8p5M=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LRxj7SF+hE9ohB7Uo48PBoxvAQ+kyp/Tqibuwc3FOOVIkodzBpv9Nxn9L6aIBJxay
	 NCKxahtvftuzlJkA9yTC1fzexiyO4pwn4agpgWRwu8VINKjTbz5ypUJa53fJPlKjuJ
	 j2Rh+jIWpklhz+FRbnTIZvGn0h2ySrbAhvPLGzsk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D89BF80290; Fri,  9 Jun 2023 16:07:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09ABDF8016C;
	Fri,  9 Jun 2023 16:07:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74D5EF80199; Fri,  9 Jun 2023 16:07:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 143C7F80130
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 16:07:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 143C7F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wnzZoyqu
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5162d2373cdso3200878a12.3
        for <alsa-devel@alsa-project.org>;
 Fri, 09 Jun 2023 07:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686319622; x=1688911622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E9uMQ0sfqZ2sQ8GreRUpH89gA6dhVg8HRnZ9nNzOC5U=;
        b=wnzZoyqu+R5uWVV5c2SmCaaKcEtjCYLxh7x7XZdJRpl1l3mWEPqGa0s9zBwqqJYi2f
         p1fgEf5EUa1on/lQLgGyhH2F2v+jUguBBBcFns7QGE2G/yVo89TKQZ+jh+7aJsRQsU+x
         zg8x2XPvO/8RXDzVjkg/ETZ5d+0JFvgMBHZk9A3bmG74ceRu/lBeZxuao5KSRoCs1tVK
         LeaTPlEMQ7aVF8CSCNsJ+n+Re6pTqxnFP7TaFUYhuWudZA+dUTmwuPC2v6chH892QlKq
         SlsAZTGIlNyAqWV45BsQIngMiI1B0/EU/l0bJrJREMBjs0qKp84jeA2rkNGQmgfJg66C
         Cj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686319622; x=1688911622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E9uMQ0sfqZ2sQ8GreRUpH89gA6dhVg8HRnZ9nNzOC5U=;
        b=gdNOKNcAWae+QkuBr6Bu1XOH9ucU+UOuBt9K/iqFp2UyIgVn9cxn7qQg4IZEBFL7Vy
         W/h06WnCyFp2zK4OqGVvJ3lObGr0v+snEpPBt8J+M/Ia40LDQXw1fkm8FVaa0SJCHzHs
         e09ORAhu5HTqsp2JkPO+gDQ8LNgmYi7rCjymM4h9j/ZjtOhz3uWn0LKYMt6gnig/VcYF
         WhJWlBkWAzKRgp3BziJS6i4uUH4Y8/1ofkvVpW5nCpEkXogvZNsb1TOmHaqZ20TZHPdd
         uVTJ+CJAALnGOAh0bieT6mcPZuoXvrYnXjeDioYX8kU6PTpu8aFV1UwAQSkEu0lnHopQ
         k6Bg==
X-Gm-Message-State: AC+VfDx/EMaEjweMDK1Cdu8E2nCugRe8Gqc9r6cMCVvAuoPP2EmSlTQU
	uUyTF7b0S1pk8FaD32f2k97vGg==
X-Google-Smtp-Source: 
 ACHHUZ5DkXFiMm5CGgSQmITXmQLTvumkIiZtW5dSbMjJW9/TR74LmfVF2cvMFqNWQc10JQoD0Ezg9A==
X-Received: by 2002:aa7:c910:0:b0:514:960e:6 with SMTP id
 b16-20020aa7c910000000b00514960e0006mr1388561edt.10.1686319622321;
        Fri, 09 Jun 2023 07:07:02 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 f8-20020a05640214c800b00516a29dfa68sm1818429edx.90.2023.06.09.07.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 07:07:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: dt-bindings: cirrus,cs35l45: drop unneeded quotes
Date: Fri,  9 Jun 2023 16:06:58 +0200
Message-Id: <20230609140658.64557-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AE4PHWH6YFIAM7WKO6ZCMYEDECCDCIYV
X-Message-ID-Hash: AE4PHWH6YFIAM7WKO6ZCMYEDECCDCIYV
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AE4PHWH6YFIAM7WKO6ZCMYEDECCDCIYV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Cleanup bindings dropping unneeded quotes. Once all these are fixed,
checking for this can be enabled in yamllint.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/cirrus,cs35l45.yaml      | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
index 2ab74f995685..4c9acb8d4c4c 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
@@ -62,7 +62,7 @@ patternProperties:
           GPIO pin direction. Valid only when 'gpio-ctrl' is 1
             0 = Output
             1 = Input
-        $ref: "/schemas/types.yaml#/definitions/uint32"
+        $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
         maximum: 1
         default: 1
@@ -71,7 +71,7 @@ patternProperties:
           GPIO level. Valid only when 'gpio-ctrl' is 1 and 'gpio-dir' is 0
             0 = Low
             1 = High
-        $ref: "/schemas/types.yaml#/definitions/uint32"
+        $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
         maximum: 1
         default: 0
@@ -80,7 +80,7 @@ patternProperties:
           GPIO level. Valid only when 'gpio-ctrl' is 1 and 'gpio-dir' is 0
             0 = CMOS
             1 = Open Drain
-        $ref: "/schemas/types.yaml#/definitions/uint32"
+        $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
         maximum: 1
         default: 0
@@ -90,7 +90,7 @@ patternProperties:
           and 'gpio-dir' is 0
             0 = Non-inverted, Active High
             1 = Inverted, Active Low
-        $ref: "/schemas/types.yaml#/definitions/uint32"
+        $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
         maximum: 1
         default: 0
@@ -114,7 +114,7 @@ patternProperties:
             0 = High impedance input
             1 = Pin acts as a GPIO, direction controlled by 'gpio-dir'
             2-7 = Reserved
-        $ref: "/schemas/types.yaml#/definitions/uint32"
+        $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
         maximum: 7
         default: 0
-- 
2.34.1

