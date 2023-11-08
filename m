Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F8B7E5457
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Nov 2023 11:47:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63B2DDEE;
	Wed,  8 Nov 2023 11:46:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63B2DDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699440462;
	bh=tvkXSaRpDx+LQn2Wp8WlC7XjtALFUXsDGz5cTqm/o5w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ec2K7aavFzVNhvbEEldpLFKRzKhf41F0v4EqOwPLKc3CWcW7GPCLry48P0vXC+5LG
	 9ILiYGszGLIgcP1hQe+nFRlpHP8Co73rvBB8e0+QYGM1OH0nUuMlUcWMa+DCIMlwKw
	 QbJJ4OHTmWNHbwf/3K/j9F6Scd3k0CahTwQFH304=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AAC1F805DF; Wed,  8 Nov 2023 11:44:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29990F805D9;
	Wed,  8 Nov 2023 11:44:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BAE6F805CB; Wed,  8 Nov 2023 11:44:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07550F805BE
	for <alsa-devel@alsa-project.org>; Wed,  8 Nov 2023 11:44:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07550F805BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=VYa/ua1l
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c501bd6ff1so94533611fa.3
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Nov 2023 02:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699440262; x=1700045062;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=932+POzuiCpVd1FMO8emES7304xq1CZHsFhbsNym7D8=;
        b=VYa/ua1lwRcS4amdN+U8DK/CjOEG8NGqjSNGbl1CkcuPfS4UW208LHbb6joLR97y2j
         yVLJ0rSpUPnpA9/JZFmDvFGtdJnMVAxId+T4SFOD9ZVLTj6bs75XY+VXzfrSZqUjUAa6
         Gi9OFq0IBNqLSFyxbavUadwidSFtqYbzlRFwn3Awp3uI2Pvu5m8fchFgrPPle8F/AUeT
         6uShsekAGZSKkVm2vPeFtAaxIY6hzNTr4/+PBwc/gfqKVsVhctS3i5eF2c+yZ3QCbomg
         bii73TWlFfLp6Q9OQrhe7mC2OrdYOLglT+KXtjbeWcJAa8KfIN0CsBuAl0xRjhP+LDvY
         oqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440262; x=1700045062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=932+POzuiCpVd1FMO8emES7304xq1CZHsFhbsNym7D8=;
        b=mymqRTF88u5KzwV4jFTOJrOlLpOLwJFco3sAX8tEcWrHDKxvdGnffkc14ksQH5soJF
         ucByB4HXdGIUYzLZCy/eqj3w4zc2uWVCv8lPSs3mxkTQBqWRlN3kZhcHjqbaqklJOzQC
         SbwAuZ39NpdSVUvvH1HExI2bylYlLjgmCy7pskHkcI11zlhepuqFKkK1spV143jk/LEZ
         a/ViSJgVdVwGOqkhwltj97yk+ChZ9W/e2iruSOBujRGc5uZTmYsAIOJfH4w5ATnInmjH
         q+Dj8awURETxcDS+Hf9L84ImkYn4zDFoRgEoHlLiuM1anQwu26Xq23kMYR+7wVQunSD7
         Y+ag==
X-Gm-Message-State: AOJu0YxgEuNF7QJ3bbrCLwJvUi71bmbenbi6kA1rTtpa3PzuMtaD9ieo
	PeJ+Fe2eZB00IUGmSbGMSMdXZA==
X-Google-Smtp-Source: 
 AGHT+IGCpSGI0CR0667rdoPAw+/9BwGIOQ5vf5WLNiqXBsw+h3xPKE36aRvV/bSi7NnLY3zOJHYzOg==
X-Received: by 2002:a05:651c:504:b0:2c5:14e3:f1b8 with SMTP id
 o4-20020a05651c050400b002c514e3f1b8mr1507701ljp.7.1699440261813;
        Wed, 08 Nov 2023 02:44:21 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:44:21 -0800 (PST)
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
Subject: [PATCH 07/17] dt-bindings: serial: samsung: add specific compatibles
 for existing SoC
Date: Wed,  8 Nov 2023 11:43:33 +0100
Message-Id: <20231108104343.24192-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CBGVTZG735FCR33MUBUQF2Y2FF4SNXFD
X-Message-ID-Hash: CBGVTZG735FCR33MUBUQF2Y2FF4SNXFD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CBGVTZG735FCR33MUBUQF2Y2FF4SNXFD/>
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

Re-shuffle also the entries in compatibles, so the one-compatible-enum
is the first.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I propose to take the patch through Samsung SoC (me). See cover letter
for explanation.
---
 .../devicetree/bindings/serial/samsung_uart.yaml   | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index ac60ab1e35e3..0d0215b23ab7 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -18,9 +18,6 @@ description: |+
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: samsung,exynosautov9-uart
-          - const: samsung,exynos850-uart
       - enum:
           - apple,s5l-uart
           - axis,artpec8-uart
@@ -29,6 +26,17 @@ properties:
           - samsung,exynos4210-uart
           - samsung,exynos5433-uart
           - samsung,exynos850-uart
+      - items:
+          - enum:
+              - samsung,exynos7-uart
+          - const: samsung,exynos4210-uart
+      - items:
+          - enum:
+              - samsung,exynos7885-uart
+          - const: samsung,exynos5433-uart
+      - items:
+          - const: samsung,exynosautov9-uart
+          - const: samsung,exynos850-uart
 
   reg:
     maxItems: 1
-- 
2.34.1

