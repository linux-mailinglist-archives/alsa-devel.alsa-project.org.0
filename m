Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6747B955E16
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Aug 2024 19:31:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C08FF20C5;
	Sun, 18 Aug 2024 19:31:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C08FF20C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724002283;
	bh=eZxyfFWiOMWgxzgfMrHHDe1GsJVaWTRUphozkk0Nczs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DFbeFrROIShhaTt2gwsuBQhULV3YgHiZxuURXhCacW3CcKoa93J/TiOhX/xDgIKFt
	 BqF9axwCCrlZtiAt7b7t034DVpWz1xCASxsVWODgrthxFhQ6igrRzOmjNDHDbNUmzE
	 NG2Gb43GG/wesGPfqOscSlkz8IwGaJZIqDLDoeTU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23F8EF805BA; Sun, 18 Aug 2024 19:30:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3075F805B0;
	Sun, 18 Aug 2024 19:30:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7247DF80494; Sun, 18 Aug 2024 19:30:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 442D6F800F0
	for <alsa-devel@alsa-project.org>; Sun, 18 Aug 2024 19:30:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 442D6F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Jb7vlZHL
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-428ec6c190eso29576645e9.1
        for <alsa-devel@alsa-project.org>;
 Sun, 18 Aug 2024 10:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724002240; x=1724607040;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hze/nH6p6tvHNE8D/sjNOf2elLJDjNOnQCuybaofysA=;
        b=Jb7vlZHLT3YlR+n7arpqrmyvTU0F5WJ4nrBR0TipfuH47WIKc88k7Sz75N7KpUQTPi
         PW5KJIeb72rPwQbcscTAD8bjraWXPwxeQmb7I30cpMI8tR/heXb1wqJJFR0T+l0RVwtE
         +FP14iHZM8/bFswNtFJVjc8Lp9DRB7dNmY5fECuJWmoNGdG5M4MzLwCRQYT9B5GWoaWm
         KYCR6aBr58dnSS0lIXQJPV+YCFCplz4axf/8RLaUVpC/3wejP9hOA/m1FuRAmi2x8+4u
         vK2cTGB/FVUBQQiLm1elRqQKBqlfmWZqysUWpC+lqxETkmjkjiELJfnuVIYtLE6FGRiv
         1mgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724002240; x=1724607040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hze/nH6p6tvHNE8D/sjNOf2elLJDjNOnQCuybaofysA=;
        b=FHR5vDbhzTtE/r2ggOw7Mr34Q+X4SYvejWbku5c5A53+gvIaiJciYPVsapVQMQhf1h
         r1Rqp0Ix9WCcjtkTozu2RER6ZKNC7E1Iz57BzpnF0+f/egfmUxUprwGA3PTXIIOWpfAv
         uoGXxFQ4plMKO9PaN1PZhV1TlAUWlBbdqnKBqtk5vDZjbZREyf8Hkl3dw654R8GYZUgD
         jCNncJcEefvTek8HBdJRcUSKFXyq+1XC7AUpQoYIf79j4KpGkccjfUMrkNHEDdv2GJ63
         D031AIr8XE6hCHD/X8Wa2Y49SmXy46lwOlxNHDW4nNlA8yinyUKcUJ9dgZvIiwf+Hxor
         qMLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNgTDtjSHf001Wdm5wGTgEmrIa0km28FnBApdiMNROeRxawWOVZ25vRZm5lD+c/GT6iayKZ6tCtBOXh3N92vH/X8BvHmSqEf3vXcQ=
X-Gm-Message-State: AOJu0Yw3V6eM1fwj5tZbXfVVxEeWN7kgVSxaAWHvDM+ukaIOd8mMAh0/
	DrKxRiROxeJUHQ+F+FiTzAwkwtmF7RK6mAUADzdZSDQLh2IoO7yyJHEnPO/T770=
X-Google-Smtp-Source: 
 AGHT+IEHHk1AWmAyr7jcxzOjPyrSWQ9wN+5ntefeNwrp3Cysr3LtJPZ7XWcf0YS+yO+S+WhnHLleiA==
X-Received: by 2002:a05:600c:4683:b0:428:1694:bd8c with SMTP id
 5b1f17b1804b1-42aa8276727mr29780845e9.37.1724002240500;
        Sun, 18 Aug 2024 10:30:40 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded1813dsm139020545e9.7.2024.08.18.10.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 10:30:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: dt-bindings: samsung,odroid: drop stale clocks
Date: Sun, 18 Aug 2024 19:30:37 +0200
Message-ID: <20240818173037.122152-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MGWOWU2LVHK7YMCG7L6FSP7S6MT2MO3N
X-Message-ID-Hash: MGWOWU2LVHK7YMCG7L6FSP7S6MT2MO3N
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MGWOWU2LVHK7YMCG7L6FSP7S6MT2MO3N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Clocks property was present only to allow usage of assigned-clocks in
the sound card node, however in upstream DTS the assigned-clocks were
moved in commit 4afb06afd768 ("ARM: dts: exynos: move assigned-clock*
properties to i2s0 node in Odroid XU4") to respective I2S nodes.  Linux
drivers never parsed "clocks" so it can be safely dropped.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/samsung,odroid.yaml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung,odroid.yaml b/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
index b77284e3e26a..c3dea852cc8d 100644
--- a/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
@@ -27,11 +27,6 @@ properties:
       - const: samsung,odroid-xu4-audio
         deprecated: true
 
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-  assigned-clocks: true
-  clocks: true
-
   cpu:
     type: object
     additionalProperties: false
-- 
2.43.0

