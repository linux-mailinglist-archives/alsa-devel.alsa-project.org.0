Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 036CE7E5471
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Nov 2023 11:49:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51F36DF3;
	Wed,  8 Nov 2023 11:48:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51F36DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699440555;
	bh=Xmq8AdqXRz3/FqKsFeUt6D9B883cMQgLyu6/cU4CPrY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I94D9fDak4sBupJc94FXCFb/9d31AyUlP7Cw9x4qKUDMs4N47eoXZ4dZ/dnieodiE
	 VSmwZ4dTVgxH8gI+jf0KAcORoDJuD2DpfU1f1nj5X/+2ZshddLXINKb+DfmmoLmw4k
	 ogl75rYVQEF+MDbKaCFDpubMLtPS90DaoHrzUhHQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D58DF8062D; Wed,  8 Nov 2023 11:45:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79C58F8061F;
	Wed,  8 Nov 2023 11:45:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 644A0F80612; Wed,  8 Nov 2023 11:45:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F2FEF80608
	for <alsa-devel@alsa-project.org>; Wed,  8 Nov 2023 11:44:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F2FEF80608
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=zPMkBmtp
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40907b82ab9so3614295e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Nov 2023 02:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699440287; x=1700045087;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Maq2+L1Y42eLIp6jLOTQKPo6JnaiX6HnytDKQ9hLP3M=;
        b=zPMkBmtpwuS6cpAFsjqn9F/rtctsGyFC3Dn2mmwo8WWjSpRmy2R45kamyvP7fN4hnI
         81J0qcXFyQn/xn4oTgNBUHZs1tZ304XlcR1vmLmUEvZgRICrdGpAmiwgTBRbyUzsZ8bo
         0hCXLfiVFPnXyGC5DBYpzEkWuF45z2tClwB+SY4XIu0eeQKyfoLGA2w+maL9vFdLCsjq
         ZUI0bIaKfEo6ByfzGaiQUQC2XEEyMQm44MPL6PS24Ic4cYAo1vj/0NrPV9KdyZVI8ZUy
         vqN7nTZ9bAuWQnVi+rqxdOzphBpCFovMFtdzXdXT0nlW1P+M65NyKtkFR0vJ+WS0DM5A
         BWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440287; x=1700045087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Maq2+L1Y42eLIp6jLOTQKPo6JnaiX6HnytDKQ9hLP3M=;
        b=MbncL/gTZTwIvzyryHGRMnCVLmvCzjljVv7F8jXlOH7tNv21Q/Hdj5hRdUQYB9rsyT
         VUBqRvLK3tY5ZKhwZHV7OEV0RclzlNIs01M1vj0MrtAxErUMr5WlSsAmuFO8w4rxiaHQ
         Rid4KqpWTKeY6RcTNjxfzqDPnUmSS5Tzu7kIBwg7bCNbBwcOyJMCdLLzsvxaIDXOsHbT
         AW5P/w/4snPPdK78t9T+PPmJma0GdjNdmpYBkfbmWBkEOwCeNup0MnT9Tftqji5zQyxS
         UetqkOZ0RlN/mDSiSmo516YAuqXkHi3kU34PVGROyflpLeSdEiZPgXUlCcbJzW+ERtpL
         W+Fw==
X-Gm-Message-State: AOJu0YwgV9NsntdaLNcVZ8AAI6cp27JAb/2ayYgbj8z4Hn9Nyzc6bLyy
	68OCKin+9fHn3m9kjOU0TQpVew==
X-Google-Smtp-Source: 
 AGHT+IHfnKTLAUfozAkfKQV4GR2Fej9TWilPKyjgZI/joMTpp1hOhiecaU9SQRw9m85EcpIoxEyIjw==
X-Received: by 2002:a05:600c:4512:b0:406:44fc:65c9 with SMTP id
 t18-20020a05600c451200b0040644fc65c9mr1775482wmo.8.1699440287419;
        Wed, 08 Nov 2023 02:44:47 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:44:46 -0800 (PST)
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
Subject: [PATCH 14/17] arm64: dts: exynos7: add specific compatibles to
 several blocks
Date: Wed,  8 Nov 2023 11:43:40 +0100
Message-Id: <20231108104343.24192-15-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IOQAKRLXPOX6235JMEONT4VF5C6W7C2C
X-Message-ID-Hash: IOQAKRLXPOX6235JMEONT4VF5C6W7C2C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IOQAKRLXPOX6235JMEONT4VF5C6W7C2C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Exynos7 reuses several devices from older designs, thus historically
we kept the old (block's) compatible only.  This works fine and there is
no bug here, however guidelines expressed in
Documentation/devicetree/bindings/writing-bindings.rst state that:
1. Compatibles should be specific.
2. We should add new compatibles in case of bugs or features.

Add compatibles specific to Exynos7 in front of all old-SoC-like
compatibles.  This will also help reviews of new code using existing
DTS as template.  No functional impact on Linux drivers behavior.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos7.dtsi | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index 6ed80ddf3369..9cb6bd61262e 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -128,7 +128,8 @@ soc: soc@0 {
 		ranges = <0 0 0 0x18000000>;
 
 		chipid@10000000 {
-			compatible = "samsung,exynos4210-chipid";
+			compatible = "samsung,exynos7-chipid",
+				     "samsung,exynos4210-chipid";
 			reg = <0x10000000 0x100>;
 		};
 
@@ -279,7 +280,7 @@ clock_fsys1: clock-controller@156e0000 {
 		};
 
 		serial_0: serial@13630000 {
-			compatible = "samsung,exynos4210-uart";
+			compatible = "samsung,exynos7-uart", "samsung,exynos4210-uart";
 			reg = <0x13630000 0x100>;
 			interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock_peric0 PCLK_UART0>,
@@ -289,7 +290,7 @@ serial_0: serial@13630000 {
 		};
 
 		serial_1: serial@14c20000 {
-			compatible = "samsung,exynos4210-uart";
+			compatible = "samsung,exynos7-uart", "samsung,exynos4210-uart";
 			reg = <0x14c20000 0x100>;
 			interrupts = <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock_peric1 PCLK_UART1>,
@@ -299,7 +300,7 @@ serial_1: serial@14c20000 {
 		};
 
 		serial_2: serial@14c30000 {
-			compatible = "samsung,exynos4210-uart";
+			compatible = "samsung,exynos7-uart", "samsung,exynos4210-uart";
 			reg = <0x14c30000 0x100>;
 			interrupts = <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock_peric1 PCLK_UART2>,
@@ -309,7 +310,7 @@ serial_2: serial@14c30000 {
 		};
 
 		serial_3: serial@14c40000 {
-			compatible = "samsung,exynos4210-uart";
+			compatible = "samsung,exynos7-uart", "samsung,exynos4210-uart";
 			reg = <0x14c40000 0x100>;
 			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock_peric1 PCLK_UART3>,
@@ -539,7 +540,7 @@ pmu_system_controller: system-controller@105c0000 {
 		};
 
 		rtc: rtc@10590000 {
-			compatible = "samsung,s3c6410-rtc";
+			compatible = "samsung,exynos7-rtc", "samsung,s3c6410-rtc";
 			reg = <0x10590000 0x100>;
 			interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
@@ -559,7 +560,8 @@ watchdog: watchdog@101d0000 {
 		};
 
 		gpu: gpu@14ac0000 {
-			compatible = "samsung,exynos5433-mali", "arm,mali-t760";
+			compatible = "samsung,exynos7-mali",
+				     "samsung,exynos5433-mali", "arm,mali-t760";
 			reg = <0x14ac0000 0x5000>;
 			interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>,
@@ -619,7 +621,7 @@ adc: adc@13620000 {
 		};
 
 		pwm: pwm@136c0000 {
-			compatible = "samsung,exynos4210-pwm";
+			compatible = "samsung,exynos7-pwm", "samsung,exynos4210-pwm";
 			reg = <0x136c0000 0x100>;
 			interrupts = <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.34.1

