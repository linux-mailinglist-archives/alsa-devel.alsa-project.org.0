Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFF78BFD8B
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 14:46:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 126026C0;
	Wed,  8 May 2024 14:46:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 126026C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715172376;
	bh=3kNvXvkN6naoI7GD4sRzPfHePGAYfimaGj1maVSZXX8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KnpxrymE6HyFWobO+gD0wWbar+TlpAJJcxto+08FUBuCXxNOFLVkoJ8+QOpEh9Wtv
	 VO1RkzckjDbIZYzIlcMUit0WHMKOm8oUMj0CXT0m5ZUqQ1uS+sy6pPeF9vefZoirSQ
	 nvqj7wdxggEH1v3cjOOaUMrXjxu1NwkOUxSK32NY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6279F80619; Wed,  8 May 2024 14:45:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0E83F80608;
	Wed,  8 May 2024 14:45:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0AC24F8028D; Fri,  3 May 2024 20:55:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3725CF8023A
	for <alsa-devel@alsa-project.org>; Fri,  3 May 2024 20:55:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3725CF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bAtHKpRY
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a598e03836bso207124766b.3
        for <alsa-devel@alsa-project.org>;
 Fri, 03 May 2024 11:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714762525; x=1715367325;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F4JYeUr0dOQRMVbNboqjhvtximVshCSVg7z47+X+6e4=;
        b=bAtHKpRYv3QUMV2EQEhx2WhsyBuInR9aCuIBrjsFZfKNhO2UU78O+uUgqr2sOk/elr
         ULdeiUenaBQF5xTmCdkj9U/0yuWQzpRh311SY2qLXjSGlGYN1TpjBSJy5+sv2CblPeyf
         nACSY4j0K2tmc+EPK3knDkRCiPe7FpzO/bGMHBPkZJQlpY2kWummol4Bone8KiS+axzq
         G/3Url9G3oga63TnkPpltGEuVJ0L0vD7Z8dGhjijw9nLTCp1qf7+DvHsLaKjpYjGfSDp
         V6gS+YN2dTipRyU/r2mY61/P3K5t75APzTZ2fGAsvDC1gbGOw6Ktk3w4RFnOr5HG0u/t
         5sEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714762525; x=1715367325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4JYeUr0dOQRMVbNboqjhvtximVshCSVg7z47+X+6e4=;
        b=F7QmmxuSWIHg/EXW7rQBDo4oW4CUVhF3gMYSlKb/xmBBZBivyQBZcQAbbJshyCxeGU
         FQZ6oFKNjkJLmll1ti2yZ5ArK8e4iSQK1JGmq+g4Yar+w9dGqmmVFrhwBcj74vXHQ/c2
         a4Wgvt4B/iow4rMr8sV3c7vYqAeL2nOjys3/MeTKNUjpNxje+nxndTBlHFINw1mq500x
         fkwuXmZS7T+E2L3OGQWf4YG0jKgGYtm9FMyZVIe1tnK9/SMjGxCP/jDBN+fZBLRaT+Rl
         8fqfc1EKQO0oKS3sVnLHp1MgvUZ8zv2TJLZtwQz6iRqEZQ7VvJP0Gm7JHsbBApq4tfJa
         cFYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1H/82uoHYKSmhXFKqzzHFSEHHg29ydw8lq5TKEuPH0jl1LGh0VbrzahYAqmh7t0BgDlusbi1bNLjIewSMynv/zpl3itQ2D6v6oA8=
X-Gm-Message-State: AOJu0Yxtj9TB4Cw77Lgbzhy76wzcOjcCPgsLsW1W0OhSVZ2NPfcqKTIc
	OYQIYTH0Xjwo9V6geQfnuhyE3JcF4c3LcHvSGLuQAbDeb81+qrf+
X-Google-Smtp-Source: 
 AGHT+IGl6b9e2HFGYnhoAnaljhI1GQ0PiFI5MbCO2zuMHmb1huwM89XxkBc/QIEubt+jlSDtr2i80w==
X-Received: by 2002:a17:906:fc20:b0:a55:b487:5676 with SMTP id
 ov32-20020a170906fc2000b00a55b4875676mr2228045ejb.72.1714762525087;
        Fri, 03 May 2024 11:55:25 -0700 (PDT)
Received: from hex.my.domain (83.25.185.84.ipv4.supernova.orange.pl.
 [83.25.185.84])
        by smtp.gmail.com with ESMTPSA id
 l8-20020a170906078800b00a598d3ddf8dsm1104618ejc.28.2024.05.03.11.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:55:24 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 03 May 2024 20:55:13 +0200
Subject: [PATCH 3/3] ARM: dts: samsung: exynos4212-tab3: Fix headset mic,
 add jack detection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-midas-wm1811-gpio-jack-v1-3-e8cddbd67cbf@gmail.com>
References: <20240503-midas-wm1811-gpio-jack-v1-0-e8cddbd67cbf@gmail.com>
In-Reply-To: <20240503-midas-wm1811-gpio-jack-v1-0-e8cddbd67cbf@gmail.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714762519; l=2229;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=3kNvXvkN6naoI7GD4sRzPfHePGAYfimaGj1maVSZXX8=;
 b=agat+hgkRN9DNTowBNeEtXOd2WrfzFQ9JevjJtvYwfVfxYh/0eH8GkWG0msG//Zw21Hq4/csU
 Qr4xAZ+ecQdCWUpolpGSUoMlA8eRC4nR1P0KeIVHHJ6gqm3OzlAOxIG
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: V37BL22ZGTRRFI6WGM7ERC6OE4EZLQH3
X-Message-ID-Hash: V37BL22ZGTRRFI6WGM7ERC6OE4EZLQH3
X-Mailman-Approved-At: Wed, 08 May 2024 12:44:50 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V37BL22ZGTRRFI6WGM7ERC6OE4EZLQH3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the necessary properties to the samsung,midas-audio node to allow
for headset jack detection, set up the mic bias regulator GPIO and fix
some other small issues with the sound setup.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
index e5254e32aa8f..a059857e3054 100644
--- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
@@ -285,6 +285,8 @@ mic_bias_reg: voltage-regulator-4 {
 		regulator-name = "MICBIAS_LDO_2.8V";
 		regulator-min-microvolt = <2800000>;
 		regulator-max-microvolt = <2800000>;
+		gpio = <&gpm0 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
 	};
 
 	submic_bias_reg: voltage-regulator-5 {
@@ -297,8 +299,17 @@ submic_bias_reg: voltage-regulator-5 {
 	sound: sound {
 		compatible = "samsung,midas-audio";
 		model = "TAB3";
+
 		mic-bias-supply = <&mic_bias_reg>;
 		submic-bias-supply = <&submic_bias_reg>;
+		lineout-sel-gpios = <&gpj1 2 GPIO_ACTIVE_HIGH>;
+
+		headset-detect-gpios = <&gpx0 4 GPIO_ACTIVE_LOW>;
+		headset-key-gpios = <&gpx3 6 GPIO_ACTIVE_LOW>;
+		headset-4pole-threshold-microvolt = <710 2000>;
+		headset-button-threshold-microvolt = <0 130 260>;
+		io-channel-names = "headset-detect";
+		io-channels = <&adc 0>;
 
 		audio-routing = "HP", "HPOUT1L",
 				"HP", "HPOUT1R",
@@ -345,6 +356,11 @@ wlan_pwrseq: sdhci3-pwrseq {
 	};
 };
 
+&adc {
+	vdd-supply = <&ldo3_reg>;
+	status = "okay";
+};
+
 &bus_acp {
 	devfreq = <&bus_dmc>;
 	status = "okay";
@@ -505,12 +521,11 @@ &i2c_4 {
 	wm1811: audio-codec@1a {
 		compatible = "wlf,wm1811";
 		reg = <0x1a>;
-		clocks = <&pmu_system_controller 0>;
-		clock-names = "MCLK1";
+		clocks = <&pmu_system_controller 0>,
+			 <&s5m8767_osc S2MPS11_CLK_BT>;
+		clock-names = "MCLK1", "MCLK2";
 		interrupt-controller;
 		#interrupt-cells = <2>;
-		interrupt-parent = <&gpx3>;
-		interrupts = <6 IRQ_TYPE_LEVEL_HIGH>;
 
 		gpio-controller;
 		#gpio-cells = <2>;

-- 
2.45.0

