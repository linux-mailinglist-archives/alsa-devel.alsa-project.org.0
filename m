Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B0D7E5479
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Nov 2023 11:49:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B16CFEA6;
	Wed,  8 Nov 2023 11:49:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B16CFEA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699440590;
	bh=EDnv1pz253DGTkjkFK5sH2PghffWSuz7JVwCD5PyaBA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G1osjsiDUfOVZUE45RnMyw17TYhloMS34AmvixSzSLoS/2gDR367CGq+1sboISwD6
	 HS+pSQtenepHsE+JBF61im30VQYBzfS/Dg5cze9MoVlxgQ6cMR3AHfZ+K9FvfVGgoR
	 7lqAxwJALNS7ZenRitIRpmRudna5ejDqhm8SQRA4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63153F80568; Wed,  8 Nov 2023 11:47:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4BB9F804DA;
	Wed,  8 Nov 2023 11:47:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1063DF8055C; Wed,  8 Nov 2023 11:47:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0FB7F8061D
	for <alsa-devel@alsa-project.org>; Wed,  8 Nov 2023 11:45:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0FB7F8061D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=I9xaZCnP
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4079ed65471so49560465e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Nov 2023 02:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699440299; x=1700045099;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQ+G5s8RPHyPJsrBFGNZYZXOAO3f3klrHmjNTSjaK6I=;
        b=I9xaZCnPyeee6Uoze63jU6VcUkzbUhFf6cUv8TqLCgfEYhbvXSN1P+pbIpHVdTQFgl
         dek0VYqTnZqOTidJr4roegaaFLwmttK9Qbl2ilQkNp+sPx7qlrzSZzV7vzBC8ldxyknj
         svGa/jFYFDU6geuncXcpItwlpBDoGbTiQmLwAh5wNoHUxgHjc4Nau8cvd8QSmmE9yQFL
         JFfUllBKplv60362gelHC8Na3/8+9v0ZsGLm49QDcaGHkjRNdRhaGRIh8lnB457N5Yv+
         oFzDcDl6P+qi3ceNRdahgBK4E6AlMWrNeZ6qi6M032D/YuLbZ7cYrjavwnc6DBuca9Sw
         XTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440299; x=1700045099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQ+G5s8RPHyPJsrBFGNZYZXOAO3f3klrHmjNTSjaK6I=;
        b=VqVxVkBnAutlrX6zm30Ev78PtJqU5G2ovBepk4Q4XtTbkdpPiHNH083TqFN06LbtIU
         vEKJdCvP7Hq+2o6fB0VEv3JU+idNDGX4hSh0w278u58UwJZF8aIos1g7WtL8IKbPJQbc
         gI9OFSHB1mR25cXtDtBjbcpB3jjDQhFFELrwpl5YVi9Do9VWbQl1pmqPEyzIXNOf7SUd
         XuGa/GqrSnCTehmeAzZNYXRJtKXUwMnG28tTD/t4752Ta/dplUJalBuU3gb4YADiMqpx
         PQP8BqOUmuRxcanDsj9/a7CfTfjb1BjYifRNRk17IvQ0jfeRd4hETUTnc/alsKn3KwNP
         kxAg==
X-Gm-Message-State: AOJu0YxBphLvkSv6NehS8HbLWnz9pIuMhXFwHYfSHOLND9MSduXc9Nx2
	C7D8LtxuIc4DhigXEv6eG1emvg==
X-Google-Smtp-Source: 
 AGHT+IFp84xxfo5QRAF0wCrKdORFx4iJmSqJoRpd/lOk7txHM8S/A55ohRCToPiG6pukjYjCgaIN3w==
X-Received: by 2002:a05:600c:3b15:b0:405:95ae:4a94 with SMTP id
 m21-20020a05600c3b1500b0040595ae4a94mr1341542wms.5.1699440298865;
        Wed, 08 Nov 2023 02:44:58 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:44:58 -0800 (PST)
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
Subject: [PATCH 17/17] arm64: dts: exynosautov9: add specific compatibles to
 several blocks
Date: Wed,  8 Nov 2023 11:43:43 +0100
Message-Id: <20231108104343.24192-18-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: R2E2AAVZ6OR7BX66TC7NKVYVER4CZ3CE
X-Message-ID-Hash: R2E2AAVZ6OR7BX66TC7NKVYVER4CZ3CE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R2E2AAVZ6OR7BX66TC7NKVYVER4CZ3CE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ExynosAutov9 reuses several devices from older designs, thus historically
we kept the old (block's) compatible only.  This works fine and there is
no bug here, however guidelines expressed in
Documentation/devicetree/bindings/writing-bindings.rst state that:
1. Compatibles should be specific.
2. We should add new compatibles in case of bugs or features.

Add compatibles specific to ExynosAutov9 in front of all old-SoC-like
compatibles.  This will also help reviews of new code using existing
DTS as template.  No functional impact on Linux drivers behavior.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index b228cd7e351e..417aa56a81f6 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -166,7 +166,8 @@ soc: soc@0 {
 		ranges = <0x0 0x0 0x0 0x20000000>;
 
 		chipid@10000000 {
-			compatible = "samsung,exynos850-chipid";
+			compatible = "samsung,exynosautov9-chipid",
+				     "samsung,exynos850-chipid";
 			reg = <0x10000000 0x24>;
 		};
 
@@ -349,7 +350,8 @@ pinctrl_peric1: pinctrl@10830000 {
 		};
 
 		pmu_system_controller: system-controller@10460000 {
-			compatible = "samsung,exynos7-pmu", "syscon";
+			compatible = "samsung,exynosautov9-pmu",
+				     "samsung,exynos7-pmu", "syscon";
 			reg = <0x10460000 0x10000>;
 
 			reboot: syscon-reboot {
-- 
2.34.1

