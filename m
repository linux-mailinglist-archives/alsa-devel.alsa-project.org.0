Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 281387E5477
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Nov 2023 11:49:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 430D6EA2;
	Wed,  8 Nov 2023 11:48:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 430D6EA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699440574;
	bh=Db6EO9VzGmCIfGgOy6ClFrIKCsd7tuPR6lDyOhbnBx8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ndBF3whWBvrj5h11RZlVlZRwTzRl3Gi/+rlYVZIOmcZGs2ez237wGb3Vf7qVE1R5W
	 GrzT7JcfexQsUycKtd2ny+KiNheWp5lFuB3UsrOK9UFtIqfspSW9kfd9oEMxV15N+S
	 8zafOGY1jq6MzGHbdCZCXD76ntuuVoLMVpfNnhIM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18E11F8062E; Wed,  8 Nov 2023 11:45:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1431F804DA;
	Wed,  8 Nov 2023 11:45:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C07DAF80620; Wed,  8 Nov 2023 11:45:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E6DF9F8060D
	for <alsa-devel@alsa-project.org>; Wed,  8 Nov 2023 11:44:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6DF9F8060D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jt05ZBot
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c72e275d96so25341111fa.2
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Nov 2023 02:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699440291; x=1700045091;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIuqvMhs71eYXo16i4dI05JAYajmCjaEEymf+9xK3uE=;
        b=jt05ZBottRZAp/74DQn+1b5S/JVHy5Df5Bxu3blMOICZst0FYjrb5xJe5cpxRFmNq5
         ng7xCTPIl982bp04HryusnmWPuZJk5L20ql8vUccpZ2rrlcF9Nxv/yWrdWI7qqFBREUm
         ptV+vna4X623w7qKQs2BzrpAT570eDnXbfpAbUzDDUCfzmjfeFk1yOeTZVzWuTrBe5pQ
         da5ZmeVe5YS7ABlZdO6+2Q+TCDCLxLtZHP9b3s/4VT5lTn7ETdwN1dFAjhBBPSZZy0Er
         49PI/GwkYUway1fs28bl9HjQMArwWASGcBaEHxhLYujRIVC1ObTlbnwfYPrDgGMHhMiB
         +IwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440291; x=1700045091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lIuqvMhs71eYXo16i4dI05JAYajmCjaEEymf+9xK3uE=;
        b=Uhsn0ZtmKdwhf6kaxZY2RID5NfOT0k8eqHWr++sEpjDR1hhESN2+Mz87yzsT57jgnV
         deKkc84JiYGtfoWp7x5LPCusrxQ74LS6FYc8+a0cMGWlo+IAIKQp+X3MpIRUU5yATMX3
         RgSGaTyXPuvEcbm9qKWaWPUewrTz6RO7HclJf6P7cBTi4CzcIsM//llTCNmeTuJa05Fc
         3z+GPJaE3XBKgth2J+4uJA/VFkSCqyL5h653UildRKog5Mt1xL6UqswIovShGURJ058T
         P1b1k5oWdlkIzJkdc6rtOg3rXqEvD1V5sxNl6te8WaGlaNZxJjt3Pbr5/gxEIarUREac
         lCJQ==
X-Gm-Message-State: AOJu0YzXExqPL3v7hm5/eqCK5LaamAgpEopd6a/dvw9YYVKO9uMrXIFC
	SLfx5muG3/66aDciHMhsmie6YQ==
X-Google-Smtp-Source: 
 AGHT+IEpjzXW4St54OwBArdFNLWFpsjL9lIlOCbh2aFklEgTq0PSNZVUVbpEosKWvcHE/nb/BmMPDA==
X-Received: by 2002:a2e:bb01:0:b0:2b6:a804:4cc with SMTP id
 v1-20020a2ebb01000000b002b6a80404ccmr995286lje.53.1699440291307;
        Wed, 08 Nov 2023 02:44:51 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:44:50 -0800 (PST)
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
Subject: [PATCH 15/17] arm64: dts: exynos7885: add specific compatibles to
 several blocks
Date: Wed,  8 Nov 2023 11:43:41 +0100
Message-Id: <20231108104343.24192-16-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RHZIB5MWO4RWNDKJ2OYLRQXPZNY5NFJG
X-Message-ID-Hash: RHZIB5MWO4RWNDKJ2OYLRQXPZNY5NFJG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RHZIB5MWO4RWNDKJ2OYLRQXPZNY5NFJG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Exynos7885 reuses several devices from older designs, thus historically
we kept the old (block's) compatible only.  This works fine and there is
no bug here, however guidelines expressed in
Documentation/devicetree/bindings/writing-bindings.rst state that:
1. Compatibles should be specific.
2. We should add new compatibles in case of bugs or features.

Add compatibles specific to Exynos7885 in front of all old-SoC-like
compatibles.  This will also help reviews of new code using existing
DTS as template.  No functional impact on Linux drivers behavior.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos7885.dtsi | 45 ++++++++++++++--------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885.dtsi b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
index d69fc2392bd0..008228fb319a 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
@@ -172,7 +172,8 @@ soc: soc@0 {
 		ranges = <0x0 0x0 0x0 0x20000000>;
 
 		chipid@10000000 {
-			compatible = "samsung,exynos850-chipid";
+			compatible = "samsung,exynos7885-chipid",
+				     "samsung,exynos850-chipid";
 			reg = <0x10000000 0x24>;
 		};
 
@@ -264,7 +265,8 @@ pinctrl_alive: pinctrl@11cb0000 {
 			reg = <0x11cb0000 0x1000>;
 
 			wakeup-interrupt-controller {
-				compatible = "samsung,exynos7-wakeup-eint";
+				compatible = "samsung,exynos7885-wakeup-eint",
+					     "samsung,exynos7-wakeup-eint";
 				interrupt-parent = <&gic>;
 				interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
 			};
@@ -289,12 +291,14 @@ pinctrl_dispaud: pinctrl@148f0000 {
 		};
 
 		pmu_system_controller: system-controller@11c80000 {
-			compatible = "samsung,exynos7-pmu", "syscon";
+			compatible = "samsung,exynos7885-pmu",
+				     "samsung,exynos7-pmu", "syscon";
 			reg = <0x11c80000 0x10000>;
 		};
 
 		mmc_0: mmc@13500000 {
-			compatible = "samsung,exynos7-dw-mshc-smu";
+			compatible = "samsung,exynos7885-dw-mshc-smu",
+				     "samsung,exynos7-dw-mshc-smu";
 			reg = <0x13500000 0x2000>;
 			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -307,7 +311,8 @@ mmc_0: mmc@13500000 {
 		};
 
 		serial_0: serial@13800000 {
-			compatible = "samsung,exynos5433-uart";
+			compatible = "samsung,exynos7885-uart",
+				     "samsung,exynos5433-uart";
 			reg = <0x13800000 0x100>;
 			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-names = "default";
@@ -320,7 +325,8 @@ serial_0: serial@13800000 {
 		};
 
 		serial_1: serial@13810000 {
-			compatible = "samsung,exynos5433-uart";
+			compatible = "samsung,exynos7885-uart",
+				     "samsung,exynos5433-uart";
 			reg = <0x13810000 0x100>;
 			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-names = "default";
@@ -333,7 +339,8 @@ serial_1: serial@13810000 {
 		};
 
 		serial_2: serial@13820000 {
-			compatible = "samsung,exynos5433-uart";
+			compatible = "samsung,exynos7885-uart",
+				     "samsung,exynos5433-uart";
 			reg = <0x13820000 0x100>;
 			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-names = "default";
@@ -346,7 +353,8 @@ serial_2: serial@13820000 {
 		};
 
 		i2c_0: i2c@13830000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos7885-i2c",
+				     "samsung,s3c2440-i2c";
 			reg = <0x13830000 0x100>;
 			interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -359,7 +367,8 @@ i2c_0: i2c@13830000 {
 		};
 
 		i2c_1: i2c@13840000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos7885-i2c",
+				     "samsung,s3c2440-i2c";
 			reg = <0x13840000 0x100>;
 			interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -372,7 +381,8 @@ i2c_1: i2c@13840000 {
 		};
 
 		i2c_2: i2c@13850000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos7885-i2c",
+				     "samsung,s3c2440-i2c";
 			reg = <0x13850000 0x100>;
 			interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -385,7 +395,8 @@ i2c_2: i2c@13850000 {
 		};
 
 		i2c_3: i2c@13860000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos7885-i2c",
+				     "samsung,s3c2440-i2c";
 			reg = <0x13860000 0x100>;
 			interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -398,7 +409,8 @@ i2c_3: i2c@13860000 {
 		};
 
 		i2c_4: i2c@13870000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos7885-i2c",
+				     "samsung,s3c2440-i2c";
 			reg = <0x13870000 0x100>;
 			interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -411,7 +423,8 @@ i2c_4: i2c@13870000 {
 		};
 
 		i2c_5: i2c@13880000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos7885-i2c",
+				     "samsung,s3c2440-i2c";
 			reg = <0x13880000 0x100>;
 			interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -424,7 +437,8 @@ i2c_5: i2c@13880000 {
 		};
 
 		i2c_6: i2c@13890000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos7885-i2c",
+				     "samsung,s3c2440-i2c";
 			reg = <0x13890000 0x100>;
 			interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -437,7 +451,8 @@ i2c_6: i2c@13890000 {
 		};
 
 		i2c_7: i2c@11cd0000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos7885-i2c",
+				     "samsung,s3c2440-i2c";
 			reg = <0x11cd0000 0x100>;
 			interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
-- 
2.34.1

