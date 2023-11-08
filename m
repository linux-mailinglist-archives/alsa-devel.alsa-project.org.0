Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B38777E542D
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Nov 2023 11:46:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2A22AE9;
	Wed,  8 Nov 2023 11:45:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2A22AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699440384;
	bh=x0B47UaSBGnNTj86YXPkLk3xFH/i1vqMGpNv8NpKTsw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AAbJJQHP7gpn7klriTmzResEFolD5PKT5xZa8ngl8qjJiJNCEvxuzV+4MI8yUmDFv
	 IIKjUA2vnWwoMber+DpryVXV84bU6ZJW3KXqCVCXrFYBDGY+V3p+ccFqs1ExHCEYVR
	 HWMewdckLuJ6MlNuIcUxS4lwMBrO0snM01+lnWyI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C768CF80587; Wed,  8 Nov 2023 11:44:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A036F80587;
	Wed,  8 Nov 2023 11:44:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 120ACF800ED; Wed,  8 Nov 2023 11:44:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF88CF800ED
	for <alsa-devel@alsa-project.org>; Wed,  8 Nov 2023 11:44:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF88CF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=iFhjT1f9
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c50fbc218bso83214491fa.3
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Nov 2023 02:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699440246; x=1700045046;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrZs4emLFc9OjGPQr8NhVrDcx8agcy43Q5wHxC/jdF8=;
        b=iFhjT1f9usGQgiMvnUxCmzG4yR7/j1pyXtRt9DHeMSOGXaPdgIQFPyl8ixhR0tT5rO
         e9bVmZAayzTK7jPw8VKYuAMQcFOyEa4JkFhFkiG6TzXFJgmmp/dqH4zGv/l7KUF+Sdz9
         wQWuVIFBwwIPM/ZPuQBFRfUmLFbRPQ8Pz/dMXdC2BDpmGxwOHpN3NLAXXTrrSE5/t5+e
         9n2zMeITChZRAafupEHqH32wkFZdxIj2AHXcKqfqm8zUAyjjIAFAjreLa1Owm/hnvBUJ
         mrsh19ZL168PWShf6WnaZusy5uXmSo4H348tLm/cHYrwK+MoCbM6quRkhghPaywzi1tk
         UcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440246; x=1700045046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rrZs4emLFc9OjGPQr8NhVrDcx8agcy43Q5wHxC/jdF8=;
        b=WSRiLrtOsxFtsi4RNawOpqsVVpxH/estzuG8mK8UhS9Ek5yNkbT4FUNrNv8xiieGew
         FEGUnXfYUVQ55H1AQlm3O95Uv7pS3/SpionY2ebRr53jq6Dz1T38TTVYOAZrUMBINWD4
         NCK3m421u1iRnIyU8Hdtur0J9tKwa8Ln2Ytfe7d+ouMcskVTUYxOVmNKbAzgYAeejE5z
         BD93okJ7quqfdye67Z0p+Vk494KnEVKVMiaWi6aMJeO47MKWQUB5lw33EOEQqaOzwqvo
         y4VEVRy+ZbVMUA4NFjTSGwA/l2FV6e6ZGumwLuiHBOSmnYnTkmmwQWX/l74raLciCrT/
         HeTQ==
X-Gm-Message-State: AOJu0YzvLKFFLRJHFgpCUKH7luLZjTykl2kJp1FQvcdt3qz/pjorUfoY
	fjCidhEzp0QH/Cx5ykMN1bPxZQ==
X-Google-Smtp-Source: 
 AGHT+IGa+2sMFPnXDCg+/Kp94WpmPGqJxAqZSoI9EBPYbrrl77NmQH95hc0MBEym2E6Wk3ngRYzA3Q==
X-Received: by 2002:a05:651c:19ab:b0:2b6:fa3f:9230 with SMTP id
 bx43-20020a05651c19ab00b002b6fa3f9230mr1578553ljb.46.1699440246534;
        Wed, 08 Nov 2023 02:44:06 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:44:06 -0800 (PST)
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
Subject: [PATCH 03/17] dt-bindings: i2c: samsung,s3c2410-i2c: add specific
 compatibles for existing SoC
Date: Wed,  8 Nov 2023 11:43:29 +0100
Message-Id: <20231108104343.24192-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: H5CH4U64S7LVKGEPZUE6GD3T52IGDXEZ
X-Message-ID-Hash: H5CH4U64S7LVKGEPZUE6GD3T52IGDXEZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H5CH4U64S7LVKGEPZUE6GD3T52IGDXEZ/>
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
 .../bindings/i2c/samsung,s3c2410-i2c.yaml     | 22 ++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml b/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
index b204e35e4f8d..1303502cf265 100644
--- a/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
@@ -11,14 +11,20 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - samsung,s3c2410-i2c
-      - samsung,s3c2440-i2c
-        # For s3c2440-like I2C used inside HDMIPHY block found on several SoCs:
-      - samsung,s3c2440-hdmiphy-i2c
-        # For s3c2440-like I2C used as a host to SATA PHY controller on an
-        # internal bus:
-      - samsung,exynos5-sata-phy-i2c
+    oneOf:
+      - enum:
+          - samsung,s3c2410-i2c
+          - samsung,s3c2440-i2c
+            # For s3c2440-like I2C used inside HDMIPHY block found on several SoCs:
+          - samsung,s3c2440-hdmiphy-i2c
+            # For s3c2440-like I2C used as a host to SATA PHY controller on an
+            # internal bus:
+          - samsung,exynos5-sata-phy-i2c
+      - items:
+          - enum:
+              - samsung,exynos7885-i2c
+              - samsung,exynos850-i2c
+          - const: samsung,s3c2440-i2c
 
   '#address-cells':
     const: 1
-- 
2.34.1

