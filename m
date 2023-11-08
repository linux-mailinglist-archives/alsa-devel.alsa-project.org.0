Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BC27E5439
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Nov 2023 11:46:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62B43DF1;
	Wed,  8 Nov 2023 11:46:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62B43DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699440411;
	bh=sBG02Ml1VxEgqOVWRYaPv+8EH+xCyqneJLJJUy3Ywwk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZgbNrj6usTgXaYShhfzJ3lQMpTpwOlWq90YsJv34aS3yHmcea+y2xuphm2irQXneC
	 k/gQ8bUhvYfJpSEd3/aICvUx2q637DkeGbrx5T12l7Ce0ynS0FhEJXqgttApK6fCHI
	 PvM9nAJF1YKevTYJQUCCZnKfNFl0IWqZVxKr/8i8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 915B1F805AE; Wed,  8 Nov 2023 11:44:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DC07F805B1;
	Wed,  8 Nov 2023 11:44:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B5DCF80580; Wed,  8 Nov 2023 11:44:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3E57F8055B
	for <alsa-devel@alsa-project.org>; Wed,  8 Nov 2023 11:44:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3E57F8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jsCkBTSB
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4083dbc43cfso42168435e9.3
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Nov 2023 02:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699440254; x=1700045054;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaIBx0Az35AgmK0hmQ6KD07E3PCcuw+SeUDmsLqHS7Q=;
        b=jsCkBTSBtmx34gUYbdi4RDfd4xEttHRpgROkUMR71ALurpY3BM3OQWPOOeusOpcrV7
         CDysMU/CZGXktOmpo+IXmPBmSdxcsyzdrI3bta4OghBtCWoIzgX9TB81qnC9za6aEC7Z
         QDBLvVDcrebHbLr97Tzcq9yoV0kR/fMBYb3frCQVHUtpuI0eOy/2/Mv6na9PG66eojU7
         KRlQJPSd2RThtsnc+gqbVoXEo4aj/eGabJRGOsRsqktumgRTZLSp09h1h1Pw0/Q6kITt
         pQH6GQYqcCuiIarY15FytMjgvEGQSz8mfL2+XUbsGWPds3WO/lTjj9Npy0hsK9ANMhVe
         m82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440254; x=1700045054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jaIBx0Az35AgmK0hmQ6KD07E3PCcuw+SeUDmsLqHS7Q=;
        b=v5B/RJsy+7F7EQfGMlhMlHM7vu0IrElIEBTsRawbstVPBS5jqbl28JW1D242DsPD6F
         TPzJb4Ph4eI8UKx3E+QyKWUgF66zqFkMkr6bI8KSgW1fBpgAZmZ0tbkN3Go7p+2WTZ7w
         y1Dlr/W+9DkUzumik/XS2DOKfZY2nw8flWJtxbZUVKCLZxOd7bgBKr8ECF4sB9f1KchK
         IZ8UEKkcBzD+lKY2cxaXVoe/zUw/Kl6nxAZ8qcds+NmqLGndSmhkfH7MvB9Vnrp2xRLr
         z7vxKS4zN3xVZpmw4r97AJ8g8+aXbI8DhyKS5M0X4V+ukXq6OQVfaEo2p4r6R0cNIrfX
         AC5A==
X-Gm-Message-State: AOJu0Yx6xgjsr6FUXY5xRI3KwA7r3U3+keCJgsePzPpZFaI21U4ZWnDp
	Lk6aGGzoZuushAQYcpvbep/oCg==
X-Google-Smtp-Source: 
 AGHT+IGJlG/0ZP5DkScPVOMejPSATBvkrEgkimXiOn6arKw3sdBhLlR3KhZAKEWBPjharUEFMBueGw==
X-Received: by 2002:a05:600c:4f11:b0:406:5344:4212 with SMTP id
 l17-20020a05600c4f1100b0040653444212mr1447121wmq.41.1699440254278;
        Wed, 08 Nov 2023 02:44:14 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:44:13 -0800 (PST)
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
Subject: [PATCH 05/17] dt-bindings: pinctrl: samsung: add specific compatibles
 for existing SoC
Date: Wed,  8 Nov 2023 11:43:31 +0100
Message-Id: <20231108104343.24192-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ATYMS67LBVLSLPNUPDWN2FJ72BSUMNVF
X-Message-ID-Hash: ATYMS67LBVLSLPNUPDWN2FJ72BSUMNVF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ATYMS67LBVLSLPNUPDWN2FJ72BSUMNVF/>
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
 .../samsung,pinctrl-wakeup-interrupt.yaml     | 24 ++++++++++++-------
 .../bindings/pinctrl/samsung,pinctrl.yaml     |  3 ++-
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 1de91a51234d..1c07af24d6cf 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -28,15 +28,21 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - samsung,s3c2410-wakeup-eint
-      - samsung,s3c2412-wakeup-eint
-      - samsung,s3c64xx-wakeup-eint
-      - samsung,s5pv210-wakeup-eint
-      - samsung,exynos4210-wakeup-eint
-      - samsung,exynos7-wakeup-eint
-      - samsung,exynos850-wakeup-eint
-      - samsung,exynosautov9-wakeup-eint
+    oneOf:
+      - enum:
+          - samsung,s3c2410-wakeup-eint
+          - samsung,s3c2412-wakeup-eint
+          - samsung,s3c64xx-wakeup-eint
+          - samsung,s5pv210-wakeup-eint
+          - samsung,exynos4210-wakeup-eint
+          - samsung,exynos7-wakeup-eint
+          - samsung,exynos850-wakeup-eint
+          - samsung,exynosautov9-wakeup-eint
+      - items:
+          - enum:
+              - samsung,exynos5433-wakeup-eint
+              - samsung,exynos7885-wakeup-eint
+          - const: samsung,exynos7-wakeup-eint
 
   interrupts:
     description:
diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 26614621774a..7509dc36af93 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -313,7 +313,8 @@ examples:
         pinctrl-0 = <&initial_alive>;
 
         wakeup-interrupt-controller {
-            compatible = "samsung,exynos7-wakeup-eint";
+            compatible = "samsung,exynos5433-wakeup-eint",
+                         "samsung,exynos7-wakeup-eint";
             interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
         };
 
-- 
2.34.1

