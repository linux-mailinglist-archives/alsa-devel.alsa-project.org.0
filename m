Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 319E07E547E
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Nov 2023 11:49:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52BDFEAD;
	Wed,  8 Nov 2023 11:49:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52BDFEAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699440596;
	bh=4S77OPRs3PzHTzLtUQzXxkftBhaihdLVQzLKOVXEIlc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P/sVC6cazq6q+X1S+eAOb+8nGNfG4QsBFU0MfLtLHyM/QhkiZiDqBb6CLATgzfB/G
	 Z5K8pVg/HbdtWOiE0qKPjOueGTtQ85DGrfkjrjbHGFz1A+y5vFDtj8EE8HjqkaCzWh
	 MVnzrJHfkdhKzBfSCNQRYOfDtvzwImG/YnWjTqj8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08062F80587; Wed,  8 Nov 2023 11:47:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD53DF80579;
	Wed,  8 Nov 2023 11:47:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 544CCF804DA; Wed,  8 Nov 2023 11:47:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 991E6F80611
	for <alsa-devel@alsa-project.org>; Wed,  8 Nov 2023 11:44:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 991E6F80611
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=MrwR/Igb
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-408425c7c10so49330025e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Nov 2023 02:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699440295; x=1700045095;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OiAO0adnMyNF0SV0wXdB73+0Srf6bBOK8Pyx7Wvcg2U=;
        b=MrwR/Igbb3jQYCEko+KEebjlTlwMk5ofxlTeJ1p1hhxPC72+05YaAq3p/YugFd2X/1
         qQaBr/chj8E/ckSbzo2wS2zExMegKVcZk5lhB2xKHJn85Q3775gCOJ32no4KbQjHorB+
         CMqOxVF3/IVOsrxR+gRNMO7fwo5H4Ru8xht25B+WejdgJkSoCNsjG1QODpucZasv4MhV
         Uf6xZiGWsbUzAxPN9mzlCfmStklLI/X7U/VoWq5+PQXLASiXqkIxgXw/GHVDDdDnPTWU
         aemYx+BNqXO9GC8ZlAALBUTd0g8R8gcVneYmrzuTSURVeEklkMwFvbpPi0uC1dxXr/Fc
         sEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440295; x=1700045095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OiAO0adnMyNF0SV0wXdB73+0Srf6bBOK8Pyx7Wvcg2U=;
        b=K8P2NWDCdBx1Eiq8koJ+dHq49cLLcc5+kPw2J6njMpmueIQ0Ce+dQyUGCRUES/Iqgd
         6B8OvlDKE9I6tuw1NB7iuIRD6+wW1En6eUNAwyenK0HFh7wIbevhuHAMf/qK7BxOUCU0
         YYNyLLYhFNPnDGKhFzd6j+wC3SY6UzUpwyWldxLyh++fkcz3acIlwASyEn0gdmWv3t+Y
         AxBmrn+Le/VTkAWhFsVLvcGVAbAmZ3CV8hGu/z+e6aw2A6ttFOrTYzB1RxxjbCzhBigi
         Koe1z99HiOGfyTWNVsNmUxWND6tQv0oivlR/x+aIwhT9aJaAjPXKOn0CmygcZ/HeZ3aN
         0ESA==
X-Gm-Message-State: AOJu0YxcM3R9DBn5tgbE1aCHccoJRtcCXDYww57LeQ3SvqOed5UbD5xy
	OuOxwSK6sLXn4O35k0+XhVczYA==
X-Google-Smtp-Source: 
 AGHT+IFMjHNlMfI+x+SLTi21K9VV//VF9yXBQvAS9XyT4BRmKii2VKYmn0LzJzdq1styizIpZ4+txQ==
X-Received: by 2002:a05:600c:46d1:b0:405:49aa:d578 with SMTP id
 q17-20020a05600c46d100b0040549aad578mr1455335wmo.37.1699440295256;
        Wed, 08 Nov 2023 02:44:55 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:44:54 -0800 (PST)
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
Subject: [PATCH 16/17] arm64: dts: exynos850: add specific compatibles to
 several blocks
Date: Wed,  8 Nov 2023 11:43:42 +0100
Message-Id: <20231108104343.24192-17-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NYXCEBLSI5TLHLZNO7WUCE344JJ2ZMEP
X-Message-ID-Hash: NYXCEBLSI5TLHLZNO7WUCE344JJ2ZMEP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NYXCEBLSI5TLHLZNO7WUCE344JJ2ZMEP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Exynos850 reuses several devices from older designs, thus historically
we kept the old (block's) compatible only.  This works fine and there is
no bug here, however guidelines expressed in
Documentation/devicetree/bindings/writing-bindings.rst state that:
1. Compatibles should be specific.
2. We should add new compatibles in case of bugs or features.

Add compatibles specific to Exynos850 in front of all old-SoC-like
compatibles.  This will also help reviews of new code using existing
DTS as template.  No functional impact on Linux drivers behavior.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 34 +++++++++++++----------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 53104e65b9c6..df5ea43ebcad 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -396,7 +396,7 @@ pinctrl_aud: pinctrl@14a60000 {
 		};
 
 		rtc: rtc@11a30000 {
-			compatible = "samsung,s3c6410-rtc";
+			compatible = "samsung,exynos850-rtc", "samsung,s3c6410-rtc";
 			reg = <0x11a30000 0x100>;
 			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
@@ -406,7 +406,8 @@ rtc: rtc@11a30000 {
 		};
 
 		mmc_0: mmc@12100000 {
-			compatible = "samsung,exynos7-dw-mshc-smu";
+			compatible = "samsung,exynos850-dw-mshc-smu",
+				     "samsung,exynos7-dw-mshc-smu";
 			reg = <0x12100000 0x2000>;
 			interrupts = <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -419,7 +420,7 @@ mmc_0: mmc@12100000 {
 		};
 
 		i2c_0: i2c@13830000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos850-i2c", "samsung,s3c2440-i2c";
 			reg = <0x13830000 0x100>;
 			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -432,7 +433,7 @@ i2c_0: i2c@13830000 {
 		};
 
 		i2c_1: i2c@13840000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos850-i2c", "samsung,s3c2440-i2c";
 			reg = <0x13840000 0x100>;
 			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -445,7 +446,7 @@ i2c_1: i2c@13840000 {
 		};
 
 		i2c_2: i2c@13850000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos850-i2c", "samsung,s3c2440-i2c";
 			reg = <0x13850000 0x100>;
 			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -458,7 +459,7 @@ i2c_2: i2c@13850000 {
 		};
 
 		i2c_3: i2c@13860000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos850-i2c", "samsung,s3c2440-i2c";
 			reg = <0x13860000 0x100>;
 			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -471,7 +472,7 @@ i2c_3: i2c@13860000 {
 		};
 
 		i2c_4: i2c@13870000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos850-i2c", "samsung,s3c2440-i2c";
 			reg = <0x13870000 0x100>;
 			interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -485,7 +486,7 @@ i2c_4: i2c@13870000 {
 
 		/* I2C_5 (also called CAM_PMIC_I2C in TRM) */
 		i2c_5: i2c@13880000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos850-i2c", "samsung,s3c2440-i2c";
 			reg = <0x13880000 0x100>;
 			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -499,7 +500,7 @@ i2c_5: i2c@13880000 {
 
 		/* I2C_6 (also called MOTOR_I2C in TRM) */
 		i2c_6: i2c@13890000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos850-i2c", "samsung,s3c2440-i2c";
 			reg = <0x13890000 0x100>;
 			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -640,7 +641,8 @@ usi_hsi2c_0: usi@138a00c0 {
 			status = "disabled";
 
 			hsi2c_0: i2c@138a0000 {
-				compatible = "samsung,exynosautov9-hsi2c";
+				compatible = "samsung,exynos850-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
 				reg = <0x138a0000 0xc0>;
 				interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
@@ -668,7 +670,8 @@ usi_hsi2c_1: usi@138b00c0 {
 			status = "disabled";
 
 			hsi2c_1: i2c@138b0000 {
-				compatible = "samsung,exynosautov9-hsi2c";
+				compatible = "samsung,exynos850-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
 				reg = <0x138b0000 0xc0>;
 				interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
@@ -696,7 +699,8 @@ usi_hsi2c_2: usi@138c00c0 {
 			status = "disabled";
 
 			hsi2c_2: i2c@138c0000 {
-				compatible = "samsung,exynosautov9-hsi2c";
+				compatible = "samsung,exynos850-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
 				reg = <0x138c0000 0xc0>;
 				interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
@@ -738,7 +742,8 @@ usi_cmgp0: usi@11d000c0 {
 			status = "disabled";
 
 			hsi2c_3: i2c@11d00000 {
-				compatible = "samsung,exynosautov9-hsi2c";
+				compatible = "samsung,exynos850-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
 				reg = <0x11d00000 0xc0>;
 				interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
@@ -778,7 +783,8 @@ usi_cmgp1: usi@11d200c0 {
 			status = "disabled";
 
 			hsi2c_4: i2c@11d20000 {
-				compatible = "samsung,exynosautov9-hsi2c";
+				compatible = "samsung,exynos850-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
 				reg = <0x11d20000 0xc0>;
 				interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
-- 
2.34.1

