Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F147E546F
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Nov 2023 11:49:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD9C6E99;
	Wed,  8 Nov 2023 11:48:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD9C6E99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699440545;
	bh=5BFMK7PH57yTpxKJLjH4p5QOOeAgB+v2Cg4ozazUxgM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KyNdVikYN40NxjMLa6vOcaaINx28uWVCCmt80WccIl21TUrshhWpfWnq8o9RXAN0q
	 0fWf6mzavticfznz5KUOTA1RZz+uzcRmNcPLL8jRimIQn2Ev1wG4QPb+aVEoD8PKzy
	 tjWB9seZoSsDNZxUw+qfiEq31UyA/uva/TuzwXxc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99F61F8060E; Wed,  8 Nov 2023 11:45:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 225E5F80617;
	Wed,  8 Nov 2023 11:44:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4E32F80613; Wed,  8 Nov 2023 11:44:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A155EF805EF
	for <alsa-devel@alsa-project.org>; Wed,  8 Nov 2023 11:44:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A155EF805EF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Bl4Lk5ow
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2c509d5ab43so96584061fa.0
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Nov 2023 02:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699440284; x=1700045084;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XOwiwLlGWwzo1fcvarNrGntQNCjtIurlLTEmeobqNc=;
        b=Bl4Lk5owZjmK6G8v3tmh1twqVDSYzX6ikVmmEYOgYtGk/h0gVSHFxCw82eByWj1pO8
         OGbBISUI9xnoH6s5TkQ6sgZX9e+ydc3YdJh9XODkIFUJKE6xVl2wNEe6J0Ec1Ixtfc9C
         vQYGW2GM/s12qV1n6I4xQ85fteaeeI8gKu/yRf9kvxmI3KNNKLV83TCB2S+hJixpuI1x
         JpD7ieZUTmFkOidhMU18LhJaFAW2F7TZZAacwhMy3/3mNeVnlmKDqv21tOJnZnO2vGUq
         e+VLuXkwpP1UPKzqNwlt0jxXwtzFIkxVqHTfUzSPUIT/UJ+8kWl0yKuAaxzypjzh9eKu
         rqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440284; x=1700045084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7XOwiwLlGWwzo1fcvarNrGntQNCjtIurlLTEmeobqNc=;
        b=q650S3qF1VC2y+APukFSZqujDamb8eBhQLHaatVgUzsiZWXqzsx1jVWduyWykB2osa
         Ex9f4nK62T6JqoZukmgmlkRRZFTVUxgsS2N9FUq1tTeoiBgB/KJG5ccqeb++aVojiAGk
         VGpvWe4ZPfFgV9HIMvgWpRDfNgo3G9nV+DCZL1k9Z8aMaEfcpZjsJZBZ1GcjUz3d5GuV
         tzBLZYXnU5GgJEWWtH4OrN5hmYR0yhimrWEjy+yfpPmCS6QDamk5B5O7cZfc/4Vn3nDg
         14ZyX7Ckyr76lTP7FjUtAOPvC0uMLUAAPdzv1lKcgqE7j1ex6JHIQXDmCBKrSbxWTwFr
         vWKg==
X-Gm-Message-State: AOJu0YyWPSUflCA6ZdIbbH00n2Dxo4WNBruWqZE7ZT3J2oNU1Y2r0O+L
	ZpjeraeeVohVjfDjjJkWJDYFeg==
X-Google-Smtp-Source: 
 AGHT+IESbxPeUCLTeikJQNGFmHnmOFAutizNUwXBUkuj+xWOb/MCfuu55UDgW62Bg1GWmoNi31nsiQ==
X-Received: by 2002:a2e:9545:0:b0:2c5:b583:f167 with SMTP id
 t5-20020a2e9545000000b002c5b583f167mr1212517ljh.34.1699440283774;
        Wed, 08 Nov 2023 02:44:43 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:44:43 -0800 (PST)
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
Subject: [PATCH 13/17] arm64: dts: exynos5433: add specific compatibles to
 several blocks
Date: Wed,  8 Nov 2023 11:43:39 +0100
Message-Id: <20231108104343.24192-14-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6CTLCL2G6QIAM53SIEN2FKVD232RZY4J
X-Message-ID-Hash: 6CTLCL2G6QIAM53SIEN2FKVD232RZY4J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6CTLCL2G6QIAM53SIEN2FKVD232RZY4J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Exynos5433 reuses several devices from older designs, thus historically
we kept the old (block's) compatible only.  This works fine and there is
no bug here, however guidelines expressed in
Documentation/devicetree/bindings/writing-bindings.rst state that:
1. Compatibles should be specific.
2. We should add new compatibles in case of bugs or features.

Add compatibles specific to Exynos5433 in front of all old-SoC-like
compatibles.  This will also help reviews of new code using existing
DTS as template.  No functional impact on Linux drivers behavior.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 60 ++++++++++++++--------
 1 file changed, 39 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 91ae0462a706..7fbbec04bff0 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -361,7 +361,8 @@ soc: soc@0 {
 		ranges = <0x0 0x0 0x0 0x18000000>;
 
 		chipid@10000000 {
-			compatible = "samsung,exynos4210-chipid";
+			compatible = "samsung,exynos5433-chipid",
+				     "samsung,exynos4210-chipid";
 			reg = <0x10000000 0x100>;
 		};
 
@@ -850,7 +851,8 @@ pinctrl_alive: pinctrl@10580000 {
 			reg = <0x10580000 0x1a20>, <0x11090000 0x100>;
 
 			wakeup-interrupt-controller {
-				compatible = "samsung,exynos7-wakeup-eint";
+				compatible = "samsung,exynos5433-wakeup-eint",
+					     "samsung,exynos7-wakeup-eint";
 				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
@@ -1546,7 +1548,7 @@ spi_4: spi@14d00000 {
 		};
 
 		adc: adc@14d10000 {
-			compatible = "samsung,exynos7-adc";
+			compatible = "samsung,exynos5433-adc", "samsung,exynos7-adc";
 			reg = <0x14d10000 0x100>;
 			interrupts = <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "adc";
@@ -1556,7 +1558,7 @@ adc: adc@14d10000 {
 		};
 
 		i2s1: i2s@14d60000 {
-			compatible = "samsung,exynos7-i2s";
+			compatible = "samsung,exynos5433-i2s", "samsung,exynos7-i2s";
 			reg = <0x14d60000 0x100>;
 			dmas = <&pdma0 31>, <&pdma0 30>;
 			dma-names = "tx", "rx";
@@ -1571,7 +1573,7 @@ i2s1: i2s@14d60000 {
 		};
 
 		pwm: pwm@14dd0000 {
-			compatible = "samsung,exynos4210-pwm";
+			compatible = "samsung,exynos5433-pwm", "samsung,exynos4210-pwm";
 			reg = <0x14dd0000 0x100>;
 			interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
@@ -1586,7 +1588,8 @@ pwm: pwm@14dd0000 {
 		};
 
 		hsi2c_0: i2c@14e40000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "samsung,exynos5433-hsi2c",
+				     "samsung,exynos7-hsi2c";
 			reg = <0x14e40000 0x1000>;
 			interrupts = <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -1599,7 +1602,8 @@ hsi2c_0: i2c@14e40000 {
 		};
 
 		hsi2c_1: i2c@14e50000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "samsung,exynos5433-hsi2c",
+				     "samsung,exynos7-hsi2c";
 			reg = <0x14e50000 0x1000>;
 			interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -1612,7 +1616,8 @@ hsi2c_1: i2c@14e50000 {
 		};
 
 		hsi2c_2: i2c@14e60000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "samsung,exynos5433-hsi2c",
+				     "samsung,exynos7-hsi2c";
 			reg = <0x14e60000 0x1000>;
 			interrupts = <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -1625,7 +1630,8 @@ hsi2c_2: i2c@14e60000 {
 		};
 
 		hsi2c_3: i2c@14e70000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "samsung,exynos5433-hsi2c",
+				     "samsung,exynos7-hsi2c";
 			reg = <0x14e70000 0x1000>;
 			interrupts = <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -1638,7 +1644,8 @@ hsi2c_3: i2c@14e70000 {
 		};
 
 		hsi2c_4: i2c@14ec0000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "samsung,exynos5433-hsi2c",
+				     "samsung,exynos7-hsi2c";
 			reg = <0x14ec0000 0x1000>;
 			interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -1651,7 +1658,8 @@ hsi2c_4: i2c@14ec0000 {
 		};
 
 		hsi2c_5: i2c@14ed0000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "samsung,exynos5433-hsi2c",
+				     "samsung,exynos7-hsi2c";
 			reg = <0x14ed0000 0x1000>;
 			interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -1664,7 +1672,8 @@ hsi2c_5: i2c@14ed0000 {
 		};
 
 		hsi2c_6: i2c@14ee0000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "samsung,exynos5433-hsi2c",
+				     "samsung,exynos7-hsi2c";
 			reg = <0x14ee0000 0x1000>;
 			interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -1677,7 +1686,8 @@ hsi2c_6: i2c@14ee0000 {
 		};
 
 		hsi2c_7: i2c@14ef0000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "samsung,exynos5433-hsi2c",
+				     "samsung,exynos7-hsi2c";
 			reg = <0x14ef0000 0x1000>;
 			interrupts = <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -1690,7 +1700,8 @@ hsi2c_7: i2c@14ef0000 {
 		};
 
 		hsi2c_8: i2c@14d90000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "samsung,exynos5433-hsi2c",
+				     "samsung,exynos7-hsi2c";
 			reg = <0x14d90000 0x1000>;
 			interrupts = <GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -1703,7 +1714,8 @@ hsi2c_8: i2c@14d90000 {
 		};
 
 		hsi2c_9: i2c@14da0000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "samsung,exynos5433-hsi2c",
+				     "samsung,exynos7-hsi2c";
 			reg = <0x14da0000 0x1000>;
 			interrupts = <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -1716,7 +1728,8 @@ hsi2c_9: i2c@14da0000 {
 		};
 
 		hsi2c_10: i2c@14de0000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "samsung,exynos5433-hsi2c",
+				     "samsung,exynos7-hsi2c";
 			reg = <0x14de0000 0x1000>;
 			interrupts = <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -1729,7 +1742,8 @@ hsi2c_10: i2c@14de0000 {
 		};
 
 		hsi2c_11: i2c@14df0000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "samsung,exynos5433-hsi2c",
+				     "samsung,exynos7-hsi2c";
 			reg = <0x14df0000 0x1000>;
 			interrupts = <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -1820,7 +1834,8 @@ usbhost_dwc3: usb@0 {
 		};
 
 		mshc_0: mmc@15540000 {
-			compatible = "samsung,exynos7-dw-mshc-smu";
+			compatible = "samsung,exynos5433-dw-mshc-smu",
+				     "samsung,exynos7-dw-mshc-smu";
 			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -1833,7 +1848,8 @@ mshc_0: mmc@15540000 {
 		};
 
 		mshc_1: mmc@15550000 {
-			compatible = "samsung,exynos7-dw-mshc-smu";
+			compatible = "samsung,exynos5433-dw-mshc-smu",
+				     "samsung,exynos7-dw-mshc-smu";
 			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -1846,7 +1862,8 @@ mshc_1: mmc@15550000 {
 		};
 
 		mshc_2: mmc@15560000 {
-			compatible = "samsung,exynos7-dw-mshc-smu";
+			compatible = "samsung,exynos5433-dw-mshc-smu",
+				     "samsung,exynos7-dw-mshc-smu";
 			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -1897,7 +1914,8 @@ adma: dma-controller@11420000 {
 			};
 
 			i2s0: i2s@11440000 {
-				compatible = "samsung,exynos7-i2s";
+				compatible = "samsung,exynos5433-i2s",
+					     "samsung,exynos7-i2s";
 				reg = <0x11440000 0x100>;
 				dmas = <&adma 0>, <&adma 2>;
 				dma-names = "tx", "rx";
-- 
2.34.1

