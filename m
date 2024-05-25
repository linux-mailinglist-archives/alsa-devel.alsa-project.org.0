Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C7490778B
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 17:52:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18E4CE85;
	Thu, 13 Jun 2024 17:52:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18E4CE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718293963;
	bh=hH25eTCdZC3BJgBa3AD+9InewcsW9rj0sd8f9BvAVfs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AJ68QkwqAX/2PQ8ma61Vbh01A5okSnVT5RG37vmQPZmYgSvD6y2sIbx37RnKEzQjh
	 7Ec3ph1wjpDw1R4J8OVi93T92D9KllOSEuL0meO7spp6DtScj2gI3O7EiWZ3vpV9eD
	 VUJ/MG1AXPV9MA95434iZ6eu+HmwyOzOIIXlSZDs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 459FEF8067B; Thu, 13 Jun 2024 17:50:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D91CF8067B;
	Thu, 13 Jun 2024 17:50:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35750F8026A; Sat, 25 May 2024 15:31:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DCBDAF8042F
	for <alsa-devel@alsa-project.org>; Sat, 25 May 2024 15:28:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCBDAF8042F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZXCYtYP4
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a626777f74eso203603066b.3
        for <alsa-devel@alsa-project.org>;
 Sat, 25 May 2024 06:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716643696; x=1717248496;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUjZKrfisu2MIRRIzFKLBIKTAToYLPq2V2E0DmuWK3M=;
        b=ZXCYtYP4I6oVjbrK0x7uw7rMfVs1qIx0hGg6KYK21Q0nXNYV+scjVUikjpAimr3YYl
         OOJblpkiXgEN1RhzLWMiwswpUJ4aXC7lZ3NolaK9XHsdCqF7ehzb9PJuAnxr+t/SHTBR
         MXK2iNSDdpIBTGdSNrfVnj1N8//aU/qo8t1u7Zb6uwboCyAxv1uoyw01XnXcRtfF4duv
         xkvgeqid+ic6jBCVu29Are5TMR0l2j8iEJnoJ4oazh/YbmXbHh8ndCjCnw4yfMYccETi
         9AY/cF2Kd0kPqMrMCmLbFZPxiMuiWdHZtAFw8BjsCWCdpfPXdVa7QiiGHJAL0F1zhnnQ
         Q+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716643696; x=1717248496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cUjZKrfisu2MIRRIzFKLBIKTAToYLPq2V2E0DmuWK3M=;
        b=bhuorU+NOn0mXTnzse8frKhJ2p1bn+VC6Ej4zsB5dEi9hnQ698Mvak0K71QDtx9oiF
         V1p7RCyHPnB98Dwz/PjXNGMciBa2d56jmM/hhOoznnGCgs6ataHJ2Bdg2yieYG36RmMf
         YBb6BtlrU+Hifa7Uuu9D8ZqizwBUdiOjT9jBb/fZdV0nRD7xR5veMQ1uE6r+P4uqtEZ8
         B7dnRlpsViDlf/Qpxo64cBtU+k6UKDZSUc49VsoshXeDZWWBzc3Q2uTGufYHoSWLY4l3
         O9DhaSMThWXT8/VwGzN8NWzRFBXR3RJ2LrjuBl5D+yHOvS13aHFeyfWXGGd0lf9TwvwI
         FSYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4kwL6ORq7z2GUBNk/mUcJo8lIyP0GcxHv0EBuTMsPXC0V66yjLVjq8Ht35rfp302ZUFmjpIpy0VyIP3suAagrb6tItJUX5izwjSs=
X-Gm-Message-State: AOJu0YyRba14g1yCbgcVkQqjsl8z3GEQ+nLypUFHLZo8gZmzpNcHaZXF
	wXdcfDRHqyHqWJQi5RQaBt9U+zHYniYhUtkFIF7PU/9/ETz5AnpW
X-Google-Smtp-Source: 
 AGHT+IHecgBLLiR2XNqDGoawDWaRaibToLWBukY8GFmV6rY0WCbDFPgUt5GIcLfdOSKMc8LBeMskbw==
X-Received: by 2002:a17:907:9048:b0:a5a:5bc8:9fcd with SMTP id
 a640c23a62f3a-a62646d573amr341067966b.43.1716643695688;
        Sat, 25 May 2024 06:28:15 -0700 (PDT)
Received: from hex.my.domain (83.8.128.191.ipv4.supernova.orange.pl.
 [83.8.128.191])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cda46e1sm251842566b.196.2024.05.25.06.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 06:28:15 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 25 May 2024 15:28:11 +0200
Subject: [PATCH v4 7/9] ARM: dts: samsung: exynos4212-tab3: Fix headset
 mic, add jack detection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-midas-wm1811-gpio-jack-v4-7-f488e03bd8c7@gmail.com>
References: <20240525-midas-wm1811-gpio-jack-v4-0-f488e03bd8c7@gmail.com>
In-Reply-To: <20240525-midas-wm1811-gpio-jack-v4-0-f488e03bd8c7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716643685; l=1934;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=hH25eTCdZC3BJgBa3AD+9InewcsW9rj0sd8f9BvAVfs=;
 b=8suLwt6PYYGht/gjaVmfd4Bf9bOltHXD8x8FCQuaPn3LrrrQKrPEQ7bht7esAwrg3XIlV6ZH+
 Wr93+pTNpjPBik9iZXR4UwXTlgPWDVB5/SEZCqWitcGOvGz9XZyaAEQ
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 64AU3LGNLTW2QZ4QLFH5XP47UGBVHGQV
X-Message-ID-Hash: 64AU3LGNLTW2QZ4QLFH5XP47UGBVHGQV
X-Mailman-Approved-At: Thu, 13 Jun 2024 15:50:37 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/64AU3LGNLTW2QZ4QLFH5XP47UGBVHGQV/>
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
2.45.1

