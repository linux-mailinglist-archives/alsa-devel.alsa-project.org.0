Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F579ECB4F
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 12:34:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D43222C2C;
	Wed, 11 Dec 2024 12:34:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D43222C2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733916849;
	bh=CcnOmZ4wJdtquX3MvcxFwHJDSz8ukso3gSLgf6pWQno=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Anb7/x9QQ1WiwOa3sw4OqA75uDfNCJBjv53CuaewZifGbPHaVgv539btKsceX4mMD
	 PN+zMd6M0j2s3f7bNN3N9aVK3ZDAhfBfa8aypmIMT4U7So3jTJIGjolEiSRLW/N5x4
	 RYu7HSuVLwdyiP5BJqmM1mMvtTMp3w+Sn48SckqM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0C4DF89768; Wed, 11 Dec 2024 12:28:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF457F8975E;
	Wed, 11 Dec 2024 12:28:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CBE8F80482; Tue, 10 Dec 2024 18:11:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 049F6F800E9
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 18:11:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 049F6F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256
 header.s=google header.b=HBM3dWYT
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5d3ecae02beso3811747a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 10 Dec 2024 09:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850657; x=1734455457;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbHdnNXTXnTR3tThfeMauJ9l0Itp93/txTopWT8Ines=;
        b=HBM3dWYTvknrTAsq7UjItfitZKGww47PbtJyv0VO0WmXpPKXIY/mpaiD7M5QVbAUnD
         L1Lvf40pkfpa2DOx/8Bg66XLVhtcTmfCvZ2HuWZDNLery1xY5DPynJGWF+3d1je9u0jB
         mN0GZ9+GbVI0T/qAGp8a5h3TJl+yhk3I2PX/fHlqwChg0o+ug3vyQ9psV2dJCO5PEhaV
         PpaMAL8cJhcdNFAXtBsIgJKmHo2I6LMBF2Sry60yTgVfGHN7E+5VhbTR/96wrq+NbI7y
         ZeKOrzsywQtpOj1Hleh4gBE8EPmrHC+UsA4aw5glkoZOFgU8fy0RBvaldTWLNZssMuc3
         C0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850657; x=1734455457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbHdnNXTXnTR3tThfeMauJ9l0Itp93/txTopWT8Ines=;
        b=Do3/em5VNAwbyxH2UuRqL3CHxdZ3kPMf/JKvQUtZC2PQdTxNGYi5IJ+FM/4sNBZd8b
         AVv+mMoQEQNe6WueWKnGTOMnTR33vfMW62BY7FcZlh4adxyfCBfCmofz1T8uXWr8DIew
         UweQs6p64b6s134kxTLy+YEDw6bYMOHILF3fN3/BQ6eh83Nc0ty+LvsJXtBX+9NsmTYn
         2ay9hw/0vo7FoYyOF6Fm1408mHFWB+okhhj1BW7vs6mBjszKkmgzqerpPmLUJ3/P7Pol
         61BBdtFpB8XA59bznd9YIJu+rpu45Lek+rmgujWU+unmqT8qUFfIahgE9qsTv8lbfomu
         SWdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8g5baMYczlTFBJN6fG6dmfQepC+lkCoS6P3TtQoaN0dtN4/JVe440j1lpwIG/FKV18CiJmnuuCX6Y@alsa-project.org
X-Gm-Message-State: AOJu0Yz0l+1gm4tzXya3g6437eJ0JDAWq5e6XIeeDcZ92Z/tEwq1FSQf
	ldR3Mr2d8ih4XEQ/AUOXqGrRYc0oohZ+l9DioGtI6MQkte+2j+gRk4AmPhFuOs0=
X-Gm-Gg: ASbGncsVZJ10UwbkOZCdCcCZBH8wCRcQQtuw3eNQUinrcJZqqiPbaIH7KKOkWrhJwdG
	ONlQ6UZLuKkH3GpauqqVIJp9G9lEhmoIu8IF9I6+TseWztWAlaOmUI/bAP1k4fmdSn9uVVns1BF
	KnaYJ1x6qyp73kEvGk9YnXxPrRZ7fXBMw7ghtWNS0dtPHcxhgUcmFrGkyuApSd2TzeAh7Xv0HBH
	VQKoNMmb71mZlcM4/pI2OoeLRaNwtdylEJWUNntk2yIAFJjX5kBWvkQWB98iliIqp+/qrrGld9F
	fhlqalM5qos=
X-Google-Smtp-Source: 
 AGHT+IFoRF8BSZrpYteUQ6a7MVI24wh97GfyVKWhabGoatai7X1+0ZapR3mbMn4ogZwncEoqa1pzEQ==
X-Received: by 2002:a05:6402:3705:b0:5d0:d183:cc05 with SMTP id
 4fb4d7f45d1cf-5d3be66d0b6mr16199052a12.5.1733850657163;
        Tue, 10 Dec 2024 09:10:57 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:56 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 22/24] arm64: dts: renesas: Add da7212 audio codec node
Date: Tue, 10 Dec 2024 19:09:51 +0200
Message-Id: <20241210170953.2936724-23-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: claudiu.beznea@tuxon.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UOMN5XEINKYHEJO5APDZJVEECW4SHQJX
X-Message-ID-Hash: UOMN5XEINKYHEJO5APDZJVEECW4SHQJX
X-Mailman-Approved-At: Wed, 11 Dec 2024 11:27:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UOMN5XEINKYHEJO5APDZJVEECW4SHQJX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add the da7212 audio codec node. Along with it regulators nodes were
reworked to be able to re-use them on da7212.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags
- dropped #address-cells, #size-cells
- moved #sound-dai-cells after clock names to align with the
  documentation example

Changes in v3:
- none

Changes in v2:
- none


 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     | 17 ++++++++++-----
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi  | 21 +++++++++++++++++++
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 6e58d47d85b0..5ee9dac4aebb 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -63,7 +63,6 @@ vcc_sdhi0: regulator0 {
 		enable-active-high;
 	};
 
-#if SW_CONFIG2 == SW_ON
 	vccq_sdhi0: regulator1 {
 		compatible = "regulator-gpio";
 		regulator-name = "SDHI0 VccQ";
@@ -73,8 +72,8 @@ vccq_sdhi0: regulator1 {
 		gpios-states = <1>;
 		states = <3300000 1>, <1800000 0>;
 	};
-#else
-	reg_1p8v: regulator1 {
+
+	reg_1p8v: regulator2 {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
 		regulator-min-microvolt = <1800000>;
@@ -82,9 +81,17 @@ reg_1p8v: regulator1 {
 		regulator-boot-on;
 		regulator-always-on;
 	};
-#endif
 
-	vcc_sdhi2: regulator2 {
+	reg_3p3v: regulator3 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vcc_sdhi2: regulator4 {
 		compatible = "regulator-fixed";
 		regulator-name = "SDHI2 Vcc";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index ee19c4155750..899d88467d79 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -68,6 +68,27 @@ &i2c0 {
 	status = "okay";
 
 	clock-frequency = <1000000>;
+
+	da7212: codec@1a {
+		compatible = "dlg,da7212";
+		reg = <0x1a>;
+
+		clocks = <&versa3 1>;
+		clock-names = "mclk";
+
+		#sound-dai-cells = <0>;
+
+		dlg,micbias1-lvl = <2500>;
+		dlg,micbias2-lvl = <2500>;
+		dlg,dmic-data-sel = "lrise_rfall";
+		dlg,dmic-samplephase = "between_clkedge";
+		dlg,dmic-clkrate = <3000000>;
+
+		VDDA-supply = <&reg_1p8v>;
+		VDDSP-supply = <&reg_3p3v>;
+		VDDMIC-supply = <&reg_3p3v>;
+		VDDIO-supply = <&reg_1p8v>;
+	};
 };
 
 &i2c1 {
-- 
2.39.2

