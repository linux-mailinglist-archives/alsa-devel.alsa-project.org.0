Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 619687E546D
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Nov 2023 11:48:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB4DDE84;
	Wed,  8 Nov 2023 11:47:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB4DDE84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699440517;
	bh=wem3j6IamiU+gWalD2ogeTs6GZr54NDXKP8Cz9kcvvU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cH4onoD/KxIxRKpRYJAdI71UM21PT5EyrmkWACC44+1tPY8FkYta184h6oiq21EbK
	 oZw22i/dZVgwA/KvKhsTbNtHd3UzxoM9Bdj7pC5AapWbAaWj+OPtNTN3C6Rm3fiRmB
	 eB9q6HXuJw3djbz0zhc6k6xnCw41Urau3vMKlMVc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25842F80606; Wed,  8 Nov 2023 11:44:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 743B8F80601;
	Wed,  8 Nov 2023 11:44:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 568C5F805F0; Wed,  8 Nov 2023 11:44:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E03FF805ED
	for <alsa-devel@alsa-project.org>; Wed,  8 Nov 2023 11:44:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E03FF805ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=UjkG2Yn1
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c509f2c46cso92560241fa.1
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Nov 2023 02:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699440279; x=1700045079;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLncO1ADQq/KYbPV1LBS+813XGTk7ajEpj3gEwbCXmE=;
        b=UjkG2Yn1xyWpSB4+5zIgfM+KEQsnl+8oYzn589w8qxMDYCcIV2jOSjD/IHed4MTKqZ
         FcH1IBdNMfgWVkno/7JyCSwgaGGAYtPeDGXeHqbKZOjHLDJeIW2D6PxRAMenJSvWyAOk
         crKdCzV0zzR1ZAeaOPPrAHVLeSNeFyL7oIEQGTYl0fIfGj1kgZ55EecxeiQ085t4vO/b
         swbQ0B+x+rMjX6f1YxP5Sc8fBmrmHlaccKZDln8rm+Nfm9rz17hAP75qRCcGD826knA0
         oJrvDtnJRYNMmQF5T15v3tRFEIL5ximT+zIQbnQUjrfgMvznnvQ/7n+iKSbQchmYSpMF
         RIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440279; x=1700045079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLncO1ADQq/KYbPV1LBS+813XGTk7ajEpj3gEwbCXmE=;
        b=oCcRpH46c2ML14a7etyv0S4waBuVIz/xtFmEP5VlCz1xIeuUpDHFvSjmp2ZClFyZ5s
         dIDtIFTCeNO+tiDsDxlLaGVcIi+EyXiUoLSeD7rCl5bgMxLPKGA1oq+1T5FzP0lyUyjO
         8b2umhlNecIrtzJ/zpIFXr1g4Ao1BQLyVXE/HlCZ4B2rgcrqX3xkFydbtFNiAvZi5HcN
         LLQxIsnX/vJK+gjiUhJqvrkJNMRktHSc9AA2c3C3X1VaN29CLKibOkLzQBB9ZdZJ0riG
         OCLpQxpNwjcSYOAC63SAMJqgGF1Epl1OzotSy+MgjdHla0U42P5JWdr1jWytts0NTM64
         YoYw==
X-Gm-Message-State: AOJu0YwKcICeplrFMBf52m+gyEAGcLMgyNFA7Xo2TZM0RON1o7RMIvXh
	d+SFeJIBqEDJ7OWECDzq0Ocj2A==
X-Google-Smtp-Source: 
 AGHT+IE9e7WdZJcWzB5Gf22P43YL/3qsWhZ9UWDtVmtmQ2zCC7QEZqOnQRFgEbbvc33FYHTz/Q1w1g==
X-Received: by 2002:a2e:81a:0:b0:2c5:7afd:75a1 with SMTP id
 26-20020a2e081a000000b002c57afd75a1mr1229802lji.44.1699440279685;
        Wed, 08 Nov 2023 02:44:39 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:44:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Lee Jones <lee@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 12/17] dt-bindings: pwm: samsung: add specific compatibles for
 existing SoC
Date: Wed,  8 Nov 2023 11:43:38 +0100
Message-Id: <20231108104343.24192-13-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RCOZ74VI4OCNYFI2K5P53RXINMT4LH3K
X-Message-ID-Hash: RCOZ74VI4OCNYFI2K5P53RXINMT4LH3K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RCOZ74VI4OCNYFI2K5P53RXINMT4LH3K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Samsung Exynos SoC reuses several devices from older designs, thus
historically we kept the old (block's) compatible only.  This works fine
and there is no bug here, however guidelines expressed in
Documentation/devicetree/bindings/writing-bindings.rst state that:
1. Compatibles should be specific.
2. We should add new compatibles in case of bugs or features.

Add compatibles specific to each SoC in front of all old-SoC-like
compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I propose to take the patch through Samsung SoC (me). See cover letter
for explanation.
---
 Documentation/devicetree/bindings/pwm/pwm-samsung.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml b/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
index 2162f661ed5a..89a3875cb50a 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
@@ -29,6 +29,8 @@ properties:
           - samsung,exynos4210-pwm          # 32-bit, Exynos
       - items:
           - enum:
+              - samsung,exynos5433-pwm
+              - samsung,exynos7-pwm
               - samsung,exynosautov9-pwm
           - const: samsung,exynos4210-pwm
 
-- 
2.34.1

