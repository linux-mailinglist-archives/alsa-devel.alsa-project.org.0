Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F038C9E74
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 15:57:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B808CDF9;
	Mon, 20 May 2024 15:57:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B808CDF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716213432;
	bh=7ghoUuP1F66lo5lQILjtg4IgiT6Z0TAcd0jCIemjWlQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AdPIJKLxvIvbzapnoaHqbyFw413nCVn0wfLSnsOf39iq6fmpoIhzXOmWsowKfdh/5
	 +WbitzL5xMHsakMtbIRTB92qqd7gps9OsKrXex6R/utH1QpqEeymt+6eY/uwsEmYW/
	 mBYgt50dchQrx+4wPPSxOQeqha2Q3vykgTT6nsYM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53542F80617; Mon, 20 May 2024 15:56:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B199FF80610;
	Mon, 20 May 2024 15:56:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C0E0F80589; Mon, 20 May 2024 14:37:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C9C3F8020D
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 14:37:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C9C3F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=R6FajXro
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4202ca70270so27078335e9.3
        for <alsa-devel@alsa-project.org>;
 Mon, 20 May 2024 05:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716208642; x=1716813442;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JckYzcWe8w+0grZPS9NysF8GgHh7PfoFNUhYz6cHvfw=;
        b=R6FajXrotevG/39bT65Bvz+OvQAnvHxk0zxS8S2Wbh7tsgH8wmC/+mGyPD8MlYaSZn
         SaziHsxYtWYggA7nJqY2b61i+z/4O/5YA3o85Vwhh5ABDEN38wZKoRW0LJ6eggXYdZDs
         w1HpcNKYS5D4hk7YJAg2lwPQheNpNMMQ+FKpyhZUXrgkYJH77zAQvE0Yh+kiHuvmT8QV
         RkttINqD6ZqWqTUf6qANQmupezKHdH9qlOcodzMN6r//iGQMHFyY9A1iCop028fzKLLB
         IywQJibAbRZBN6J8T16712yxzZ58alL4KWV1wtAU4OuwsuiB0SHGAZs2+xWNiE5L11OZ
         bxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716208642; x=1716813442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JckYzcWe8w+0grZPS9NysF8GgHh7PfoFNUhYz6cHvfw=;
        b=rVuboAo+sydr/3cWzJlKqFJHrpqq8n04nH8NXqxu5GlOdNai1rZoRdkSaRedEKznZl
         NwnOaEVHsCsKb56TG/ZQgfw/xsLUx9acTidbz+X4O62aKtDpB97IjvJ8QXfPkc8vxckk
         Vrz7w2rxWCmEmVeqhO71GF7XPilFFXfSIBVsnbacNKoSCyaTphUJXbwMYtkl4RsP5BKz
         MqMeUWdudrL9MlZ4V7x6Qy6l7mo0TBP4H/MbAmXdHAhHM8olNT3s6vpvc8pmjORSboE3
         RhOtsJ5gnE9SqwTJAZVW/HGJkOZeKiSoAJQEsRCC2JMrgtZWaLNFqwhfrFoI/WmBSvRb
         2pAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhfqYIanMTAbWMTf8Clm2bObR3Z1GRzP6kT50NsAqolrBZgqwUO+B+K6bh627qUn+PcIHLp3BOE7zwHrZcWDm+uak2Ps38Z4dSA0U=
X-Gm-Message-State: AOJu0YyLfK+c5YPhBVStCv9cw8Gjp5On54x9682qFdxRX57urOYsI0tE
	6MVhXGHMCT6CqAGbgbCp6Ltu9Dc6yu14Gc/Di3bX4PpKtzC5rF8p1aZfGw==
X-Google-Smtp-Source: 
 AGHT+IG3SMaDBws1fzIkcPLAJz7n7Ag6C6la0lbxW02ImT03Ca69NZo4TJd0EVoTiNb4ZOsqOYvl9w==
X-Received: by 2002:a50:d6c3:0:b0:575:a0c:4b8c with SMTP id
 4fb4d7f45d1cf-5750a0c4c71mr7898781a12.38.1716106696840;
        Sun, 19 May 2024 01:18:16 -0700 (PDT)
Received: from hex.my.domain (83.8.125.62.ipv4.supernova.orange.pl.
 [83.8.125.62])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733c34e5ccsm13698518a12.95.2024.05.19.01.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 01:18:16 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sun, 19 May 2024 10:17:52 +0200
Subject: [PATCH v3 6/8] ARM: dts: samsung: exynos4212-tab3: Fix headset
 mic, add jack detection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240519-midas-wm1811-gpio-jack-v3-6-0c1736144c0e@gmail.com>
References: <20240519-midas-wm1811-gpio-jack-v3-0-0c1736144c0e@gmail.com>
In-Reply-To: <20240519-midas-wm1811-gpio-jack-v3-0-0c1736144c0e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716106686; l=1934;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=7ghoUuP1F66lo5lQILjtg4IgiT6Z0TAcd0jCIemjWlQ=;
 b=7uG1N3oCFSVcHBgOu630Zb3pi3zaKhxy6TMe+0DPNU1zBvvLFKsgdfN4Ck4LNGhnW0CpYcgRE
 mdzyO/Ha9ITAAd84jXijoFHaM9QleQPYATtna13/I/VA3AuPupxCnTk
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IEMOWRFHM2JVN5PF2BBZZZMGOJKUJ4RF
X-Message-ID-Hash: IEMOWRFHM2JVN5PF2BBZZZMGOJKUJ4RF
X-Mailman-Approved-At: Mon, 20 May 2024 13:56:00 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IEMOWRFHM2JVN5PF2BBZZZMGOJKUJ4RF/>
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

