Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E708BFDC9
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 14:55:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED196950;
	Wed,  8 May 2024 14:55:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED196950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715172917;
	bh=7ghoUuP1F66lo5lQILjtg4IgiT6Z0TAcd0jCIemjWlQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=htd1myruDbiWQHyoRXgoqIBOVCeB1rAGS2x2J4i4xalNbiyW3l+IKTKQJJ21uqA5f
	 LHUDsRsvUiYE7q2IDTf8mF2XdXj+nxneNMqNibGgSRQDWsnDKpwfVCdvlXzzj7Wtjg
	 pYLLDniiHm5uxWJ0+/ZuuOjCmBLiYu8xJIFqx8U0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94089F807CA; Wed,  8 May 2024 14:52:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AAA5F807B5;
	Wed,  8 May 2024 14:52:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C7AAF80423; Wed,  8 May 2024 13:03:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 95243F804FB
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 13:01:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95243F804FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eJqprRwl
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-51fc01b6fe7so3849323e87.0
        for <alsa-devel@alsa-project.org>;
 Wed, 08 May 2024 04:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715166086; x=1715770886;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JckYzcWe8w+0grZPS9NysF8GgHh7PfoFNUhYz6cHvfw=;
        b=eJqprRwlFx0vvQ8ryXhIDXJuAOgiMfyBGxAkAyIaCMRRN3/m8ejZ/TwugPjlDN1eMH
         2fYIoBojMY3SC7XY5NLtEBQ3vdrLRvMXJc+AL+jgKn+AVK1HOmNy/VfV/wa2n5tboXUX
         gmv1sR20pH0X2cCtEpr/b+9tao+alQ8hokT0RYnXwmzzBrvZLFRcvucKuB2l0V/VAlOJ
         Qhs3nFTMBH+vHFVtK2kcGGDSrGs+QN0qaHndfhjr2fV0ZkbGojs7hcjRQBDkZ/bEYEYf
         BIx0oyVJGKWk3Dv6nlTLw2bnMo2Ggye/1uVSqyjO89Iot8dsHh35KsmruuMy5tUBU5jP
         Btow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715166086; x=1715770886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JckYzcWe8w+0grZPS9NysF8GgHh7PfoFNUhYz6cHvfw=;
        b=UPNups3jorCMSbVn7diSaO8X6q257VZydSVkmnG0pXt+7X46jRNE2eqt7y49Rx84pK
         Teiu+F83k+MpvUHrfbprS7yU2bNWFkfHChrCHiPsFnIUZlsoIwd1LDNBRCK0PL+jvA/U
         /qApzeVwNDFJOXzlBSMWUxdFm7l5SxT4dtTlCj5m/MAaYOkO7kJGhRReslvYf0xJzoT/
         MhXm2aW9yon3dr28xXJKyMpRi9HJt3ywDCYoci4V5+FOlUu08X7WUWzB1Tm1+z49sZvj
         ZDZ5IwUa5pKKsInqIxq312KIeMNc9cSaZUss9sulirGhDEP15hKb3pq34H/RNSrh/0xC
         /w+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgK3X61ipribOudF4SXaac8Q4VF0Ho02/DjKligDLxAjkkVNyj70sQWy7osYpw8Ye04JWNm5JVtpf6Ybng9D/ay9BfSNFo5POVcKI=
X-Gm-Message-State: AOJu0YzycsB3Xaa8lXqg3TAHFfY+kfKItnawcwuPG1cfyz/wF05At6iM
	6KdnZVV3WfJ70av/Y6xIVymyEAl0bjEiWJjD+wsBCv0067eLUlAk
X-Google-Smtp-Source: 
 AGHT+IGeO76uQCED1J00VN9QCAey1wfpGDo3fQs8/bwbKEbtAP/7na2lzT5MZkH/YfwFEC18bO8Zag==
X-Received: by 2002:a05:6512:40e:b0:518:9362:f63 with SMTP id
 2adb3069b0e04-5217b5a6837mr1384384e87.0.1715166085711;
        Wed, 08 May 2024 04:01:25 -0700 (PDT)
Received: from hex.my.domain (83.8.126.253.ipv4.supernova.orange.pl.
 [83.8.126.253])
        by smtp.gmail.com with ESMTPSA id
 m6-20020a056402510600b005726b58a436sm7455793edd.30.2024.05.08.04.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 04:01:25 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 08 May 2024 12:58:54 +0200
Subject: [PATCH v2 6/7] ARM: dts: samsung: exynos4212-tab3: Fix headset
 mic, add jack detection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240508-midas-wm1811-gpio-jack-v2-6-b4d36cd02c6e@gmail.com>
References: <20240508-midas-wm1811-gpio-jack-v2-0-b4d36cd02c6e@gmail.com>
In-Reply-To: <20240508-midas-wm1811-gpio-jack-v2-0-b4d36cd02c6e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715166076; l=1934;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=7ghoUuP1F66lo5lQILjtg4IgiT6Z0TAcd0jCIemjWlQ=;
 b=l0DFXbMoynUW/3tl/JJn+d4FFNg8IhQpMsG9UJeOU2kGTDNLpMYNTOAalpniOTbooBzyKlSiZ
 P9EqRrOaA4YA0I/fq2SM0f9GJDPc5NwRz+qYyqlEMUZfFI//F0HjlH5
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 753OCVVCKNV4V3CESJVB4IJSLOQPKJMV
X-Message-ID-Hash: 753OCVVCKNV4V3CESJVB4IJSLOQPKJMV
X-Mailman-Approved-At: Wed, 08 May 2024 12:51:39 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/753OCVVCKNV4V3CESJVB4IJSLOQPKJMV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Set up headset mic bias regulator and add the necessary properties to
the samsung,midas-audio node to allow for headset jack detection.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v2:
- Added headset mic bias regulator
- Added samsung prefix to threshold properties
- Dropped wm1811 config changes
---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
index e5254e32aa8f..8dc81112172c 100644
--- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
@@ -294,11 +294,30 @@ submic_bias_reg: voltage-regulator-5 {
 		regulator-max-microvolt = <2800000>;
 	};
 
+	earmic_bias_reg: voltage-regulator-6 {
+		compatible = "regulator-fixed";
+		regulator-name = "EAR_MICBIAS_LDO_2.8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&gpm0 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	sound: sound {
 		compatible = "samsung,midas-audio";
 		model = "TAB3";
 		mic-bias-supply = <&mic_bias_reg>;
 		submic-bias-supply = <&submic_bias_reg>;
+		headset-mic-bias-supply = <&earmic_bias_reg>;
+
+		lineout-sel-gpios = <&gpj1 2 GPIO_ACTIVE_HIGH>;
+
+		headset-detect-gpios = <&gpx0 4 GPIO_ACTIVE_LOW>;
+		headset-key-gpios = <&gpx3 6 GPIO_ACTIVE_LOW>;
+		samsung,headset-4pole-threshold-microvolt = <710 2000>;
+		samsung,headset-button-threshold-microvolt = <0 130 260>;
+		io-channel-names = "headset-detect";
+		io-channels = <&adc 0>;
 
 		audio-routing = "HP", "HPOUT1L",
 				"HP", "HPOUT1R",
@@ -345,6 +364,11 @@ wlan_pwrseq: sdhci3-pwrseq {
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

-- 
2.45.0

