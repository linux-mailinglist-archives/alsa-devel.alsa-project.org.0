Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 275BD7E5460
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Nov 2023 11:47:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74425DF8;
	Wed,  8 Nov 2023 11:47:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74425DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699440478;
	bh=fgKzasrAiRceEVpAlnIdT0NL+CQuKMPFjmwATzISNDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZZ8X6wdb9c2BWRHZ68r0/WvFHDEdJmMkIbbquWNxf+ZsRpw25VN80r0BIrxxxLj+k
	 dKumBDTFLqr9V1Uc6djSsi8uIpHUPk8KQkBBzMIOHbk9mlZ0FblVNtnhkRXlWZFSgH
	 gQFzJrV/pw8p2R4ZzURF9IGFOsG3elnN2JIUDwYM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 179C8F805DA; Wed,  8 Nov 2023 11:44:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AB9BF805E4;
	Wed,  8 Nov 2023 11:44:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFBACF805C8; Wed,  8 Nov 2023 11:44:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 572B0F805C4
	for <alsa-devel@alsa-project.org>; Wed,  8 Nov 2023 11:44:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 572B0F805C4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=tUg65+8G
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4079ed65582so49889625e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Nov 2023 02:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699440269; x=1700045069;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KctpUSdWE/54mxPRyNTPmujVIdTxIZHiWXcrFdF3THY=;
        b=tUg65+8GxC/oc35N0BVHMqlf3e4mBZKpMOiKUb7fHHNS+MybDU7sJwnFsXzgoEQaNX
         uiP3SVkglxhrehEOysLlnAUsghVfol6cnGXHsyamgegx9sXBOUz2NB/gppzuZXMc2TuY
         xDm+osLnAhHkmJuI9Bsl9BvA6YIGjVPjgvV94js70nAtDu3cv6HiHyLqqfDj2cYvhTra
         WMY+IGKdwv9LTtmqeDPpMWkwUWzbH/Teu/WE6fEGtawWDtgeHV0kmVE61raDQ6xnijrg
         7Uz5PHO1FZFo+e8I5/5HppRcCSAvjlKyEqpP3AR2JJ+YutEZvOmmqE8NCNLJSMbRZ7Ve
         sOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440269; x=1700045069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KctpUSdWE/54mxPRyNTPmujVIdTxIZHiWXcrFdF3THY=;
        b=CrHfQiPXE2m1aQgFTK/VO6md7xBOmtQ2y0mPDCn8W2bfpHC6mn74fM0l9UE1RX0goS
         8PUcq7MvSbBlHPr4kSdmWZaUFBbBPKg03pAzKzXLZZdpLt4eXp8/TqvzLxp9Da3f0niZ
         BgoTW5en897neX3b1f+3iJMgA+C+cHHRLDNcDGarg/+BeoMhl6e7+12KfunqhKyTpD6U
         JAwJYLVKEUliZUQ3e4Rx6Q/PhQoMNGuKwchlIATQuCZJ2HM0C74bMmNTB3ppbWxRl09Y
         qqpqs86/T/Yp2bjG4mDVCmMbRzPXygca8gqw2+PGlXeCOnUu+wuY3+3vv2M5LUwkun+/
         nF8g==
X-Gm-Message-State: AOJu0YwsYdIY6cSJWsIwaNFxylf+Tr9fCl5qVtCZscPVPZYHirusgBKk
	hH7B4qm/YL1etf+bPoUuDA0CmQ==
X-Google-Smtp-Source: 
 AGHT+IHzwZ3ZbfxwsqY/KR9bhuCoW2rtwV2Pv+17xFR8bqeY33bUZ7438zeD8MQhwfV4phLl2aoutg==
X-Received: by 2002:a05:600c:1c82:b0:406:53aa:7a5f with SMTP id
 k2-20020a05600c1c8200b0040653aa7a5fmr1423336wms.10.1699440269098;
        Wed, 08 Nov 2023 02:44:29 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:44:28 -0800 (PST)
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
Subject: [PATCH 09/17] dt-bindings: gpu: arm,mali-midgard: add specific
 compatibles for existing Exynos SoC
Date: Wed,  8 Nov 2023 11:43:35 +0100
Message-Id: <20231108104343.24192-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QT7V3JRAB7SMAE6VIMXK3VDWPHI3XPR5
X-Message-ID-Hash: QT7V3JRAB7SMAE6VIMXK3VDWPHI3XPR5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QT7V3JRAB7SMAE6VIMXK3VDWPHI3XPR5/>
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
 Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
index ca02baba5526..0801da33a385 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
@@ -40,6 +40,11 @@ properties:
               - rockchip,rk3288-mali
               - samsung,exynos5433-mali
           - const: arm,mali-t760
+      - items:
+          - enum:
+              - samsung,exynos7-mali
+          - const: samsung,exynos5433-mali
+          - const: arm,mali-t760
       - items:
           - enum:
               - rockchip,rk3399-mali
-- 
2.34.1

