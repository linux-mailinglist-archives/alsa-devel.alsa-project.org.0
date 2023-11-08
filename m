Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA5A7E546B
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Nov 2023 11:48:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6815886;
	Wed,  8 Nov 2023 11:47:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6815886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699440495;
	bh=+pNIw8DSXRl+bA2UhqDcJOALE/m/y+mCrIROK55hEaU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O+758J3HaGCkNBwmXd+d7YyP7HrvvDZB9ulwDZTP+hY1ojVcg1fiOqfq2RlXAFD6J
	 DLA0ueQv+NpLsNrgwRyptVnkkKt9xi+DAN3hup+Odjy28tCfWoWAr6Cv4Tz6YSVwJ7
	 ECBtBlX390Jgis7gvEVmcp5Xhadi6iq4vsRWJenY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D195CF805FA; Wed,  8 Nov 2023 11:44:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1305DF805F0;
	Wed,  8 Nov 2023 11:44:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41BB8F805E6; Wed,  8 Nov 2023 11:44:37 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DFF4F805DA
	for <alsa-devel@alsa-project.org>; Wed,  8 Nov 2023 11:44:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DFF4F805DA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=D2LQJ/tC
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4094301d505so49864505e9.2
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Nov 2023 02:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699440273; x=1700045073;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkEvXWcKUOWY7MDhsApmZqSz9A9BrLzom2ZllyUYJqs=;
        b=D2LQJ/tCcRnhTJh+yBa4uh7tqER3ctRm9GTpxlEF2qQDWt55FMit5ZTpB8mgIGjOJd
         YVnjhMvfG+aMDkvP+y2rONpLFC0QThEaFX849XNIF3qmgAEmQ54P9aviRm9lyKq7aInH
         HjH3M6vcZ4QZxj4n9GLM41KG4eoAeyMe19TrEGdXSkxIaogpLyH8VrIZj8gJX8DaMFTA
         E5fxC7lkoJDMGuUEy9rBmQDgOVop+RDGwsoC6/SXVy/sYYdB+U07U6I9EbPXJpVauatK
         +/zCf/IxsSS91ijWAX5mXXX9I2UWxxaMFy7JK8o1V5H5R9RLYt8P2r7H1EgFRIQy9GQt
         rrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440273; x=1700045073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkEvXWcKUOWY7MDhsApmZqSz9A9BrLzom2ZllyUYJqs=;
        b=bWcykk05OxU9aiCOM+zBOyl0FMPWnbBfioO6r8sxVQ+tsNUFWm7+SmxKp2tds63WbU
         B4bPlwzwi4GUa0wc/KqnGks+JJC8XYkmw8Y6NPh18BDkGOYF9mpZEFu6vyPlcjULCCEO
         chVAX7csgoVY5ptUDqDIvHkrbpHMLg9wsh1ZzXV23TzBO1o5Zd8sIZFBWIwhkPGldcPK
         iy1U0fnL8OzDxrjjeUDnAP5LD3q2FuB+kZivEX7vUfAFUCOE/TtLGxQRb8u+LG21MPXh
         ox7A5YUNSgwr7DKKJOHYvP+juc8IGzgvSiOTvvAl7ZigyVM66p6rp/bsD3FWId/Ks1Y7
         lQRw==
X-Gm-Message-State: AOJu0Ywj4+LkRsLKjEDq49lLraGlbl3l5Ovh3dbjXHvML5D3EQZFLZbX
	6+eG1JCFbnULZRHkluKqYGY2ww==
X-Google-Smtp-Source: 
 AGHT+IGkZ0Z/MGipPYgtciee5bgssBjyKrV3vFjgQq9aKLpthGkLg1gMgK3YX3rqUB7np5d3fs06BQ==
X-Received: by 2002:a05:600c:4fcd:b0:407:8e85:89ad with SMTP id
 o13-20020a05600c4fcd00b004078e8589admr1286513wmq.14.1699440272758;
        Wed, 08 Nov 2023 02:44:32 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:44:32 -0800 (PST)
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
Subject: [PATCH 10/17] dt-bindings: iio: samsung,exynos-adc: add specific
 compatibles for existing SoC
Date: Wed,  8 Nov 2023 11:43:36 +0100
Message-Id: <20231108104343.24192-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3LYIFF7VT6BYHS6PSZPZVSPB6M7F6FCG
X-Message-ID-Hash: 3LYIFF7VT6BYHS6PSZPZVSPB6M7F6FCG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3LYIFF7VT6BYHS6PSZPZVSPB6M7F6FCG/>
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
 .../bindings/iio/adc/samsung,exynos-adc.yaml  | 29 +++++++++++--------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
index 582d0a03b814..4e40f6bed5db 100644
--- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
@@ -11,18 +11,23 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - samsung,exynos-adc-v1                 # Exynos5250
-      - samsung,exynos-adc-v2
-      - samsung,exynos3250-adc
-      - samsung,exynos4212-adc                # Exynos4212 and Exynos4412
-      - samsung,exynos7-adc
-      - samsung,s3c2410-adc
-      - samsung,s3c2416-adc
-      - samsung,s3c2440-adc
-      - samsung,s3c2443-adc
-      - samsung,s3c6410-adc
-      - samsung,s5pv210-adc
+    oneOf:
+      - enum:
+          - samsung,exynos-adc-v1                 # Exynos5250
+          - samsung,exynos-adc-v2
+          - samsung,exynos3250-adc
+          - samsung,exynos4212-adc                # Exynos4212 and Exynos4412
+          - samsung,exynos7-adc
+          - samsung,s3c2410-adc
+          - samsung,s3c2416-adc
+          - samsung,s3c2440-adc
+          - samsung,s3c2443-adc
+          - samsung,s3c6410-adc
+          - samsung,s5pv210-adc
+      - items:
+          - enum:
+              - samsung,exynos5433-adc
+          - const: samsung,exynos7-adc
 
   reg:
     maxItems: 1
-- 
2.34.1

