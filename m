Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A61717E542F
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Nov 2023 11:46:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20E4ADE5;
	Wed,  8 Nov 2023 11:45:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20E4ADE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699440391;
	bh=0l5oupv5GSlL5ziWgOf990RPXYeZTsZB+XCuTzwqfIo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gvi8NJIQL2IxcXiZjFpRjlCdVo1rM7p5fqQmM8fL8dNDBQhTZ1n1T7KJf9LQdAzm/
	 FjJq04YK2KhdHvcJtZ9G3AmSMqlGiTzLIbznUsqrFKl7s7eJbLRVdXLAAGuworTYMD
	 JnDFajFYEkmnpGg5bKffwZczkzDu44dObmD5rw5g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC330F805B4; Wed,  8 Nov 2023 11:44:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43D64F805AB;
	Wed,  8 Nov 2023 11:44:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D5B8F80568; Wed,  8 Nov 2023 11:44:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E596F80152
	for <alsa-devel@alsa-project.org>; Wed,  8 Nov 2023 11:44:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E596F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FMMeDMp3
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4083f613272so57233145e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Nov 2023 02:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699440250; x=1700045050;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAqMvg09lZkovg+Zu0r4p30xWSnUqCaJm0pKp8M4YOY=;
        b=FMMeDMp3A8AvtoYVT9XOh29pP4j00xr1Y5S/RFBJMYnPs17i3+zh1Q+tX7kARz4NCb
         DW/QafROXPp1k/xk7nRlJPTn74ykhCAb4CQlR9shENg6qpq059OtJxs+zrp0GSwZmaku
         WFrG5lMspaewDzmMy1RZoeQQZ8esNGl3z6HeyGNi1Tgtd6d51ZVr04ztVWHMpI75gSb2
         Fw84AYCGwor5LrcbdV+A5FPvqI/2F77PgcDKE07n+JRxsDdSBb8A6GTJd6nsqK0uvwq9
         XMZ8zXJHKeFdX/Kx5OeEozgqsm6DgM+HV5JITQcsMQOQYHUXh/y3qD+usxnFccelRflM
         f6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440250; x=1700045050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAqMvg09lZkovg+Zu0r4p30xWSnUqCaJm0pKp8M4YOY=;
        b=JZeyymp6XlQuW8Zn/bAPPCMJ/c+FwY1R8On8xUj8r+JV/ND4JxFPMoS3l4B8E1BZP0
         bDUW8/NoXdCBhyR67DxXBZqHm+0tUU+7SGtX2RPHGeXtntD2MODkJ7utGjslv7qxUjiA
         dM8Jij4wnEps5/AQHweFBDW3gKB00735/AbNmMff1Ci3kueNlClaiMgH3ggyIdueLhvu
         xEXOTkPFBajMB5vM7KU2LC4/61YCA9VzzwUVcbiYxbMf8CNDMOvkqKUOWnOmftFRsIUU
         YJnQYXt3lu6HqPHvcKNZFX7Iz5rYGCMtJolvaVMPw+4PqEDdjT804Qpn1yw0aFucjSg3
         03DA==
X-Gm-Message-State: AOJu0YyCEvVXLV57BATXG55GFxqyhaMI1yZQufTvFk01A/aBFz0+brPD
	cFalN6TW0j5NCHsPjnWyVgYAkQ==
X-Google-Smtp-Source: 
 AGHT+IFviUW0LhnhTYkLsi418du0JsS+pSDR7WBQ3E2YbqFPxwTGmVG55ROJ8WQ2QG79sMX8+5JXdw==
X-Received: by 2002:a05:600c:a49:b0:409:5d7d:b26d with SMTP id
 c9-20020a05600c0a4900b004095d7db26dmr1253167wmq.15.1699440250466;
        Wed, 08 Nov 2023 02:44:10 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:44:09 -0800 (PST)
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
Subject: [PATCH 04/17] dt-bindings: mmc: samsung,exynos-dw-mshc: add specific
 compatibles for existing SoC
Date: Wed,  8 Nov 2023 11:43:30 +0100
Message-Id: <20231108104343.24192-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OXGGMRYLLVJMBBGE2SXPMJJG7ATPIPF2
X-Message-ID-Hash: OXGGMRYLLVJMBBGE2SXPMJJG7ATPIPF2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OXGGMRYLLVJMBBGE2SXPMJJG7ATPIPF2/>
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

While re-indenting the first enum, put also axis,artpec8-dw-mshc in
alphabetical order.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I propose to take the patch through Samsung SoC (me). See cover letter
for explanation.
---
 .../bindings/mmc/samsung,exynos-dw-mshc.yaml  | 25 ++++++++++++-------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
index 6ee78a38bd74..5fe65795f796 100644
--- a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
@@ -14,15 +14,22 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - samsung,exynos4210-dw-mshc
-      - samsung,exynos4412-dw-mshc
-      - samsung,exynos5250-dw-mshc
-      - samsung,exynos5420-dw-mshc
-      - samsung,exynos5420-dw-mshc-smu
-      - samsung,exynos7-dw-mshc
-      - samsung,exynos7-dw-mshc-smu
-      - axis,artpec8-dw-mshc
+    oneOf:
+      - enum:
+          - axis,artpec8-dw-mshc
+          - samsung,exynos4210-dw-mshc
+          - samsung,exynos4412-dw-mshc
+          - samsung,exynos5250-dw-mshc
+          - samsung,exynos5420-dw-mshc
+          - samsung,exynos5420-dw-mshc-smu
+          - samsung,exynos7-dw-mshc
+          - samsung,exynos7-dw-mshc-smu
+      - items:
+          - enum:
+              - samsung,exynos5433-dw-mshc-smu
+              - samsung,exynos7885-dw-mshc-smu
+              - samsung,exynos850-dw-mshc-smu
+          - const: samsung,exynos7-dw-mshc-smu
 
   reg:
     maxItems: 1
-- 
2.34.1

