Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 539979ECB4E
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 12:33:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2DE12C0F;
	Wed, 11 Dec 2024 12:33:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2DE12C0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733916833;
	bh=d78/cjRoA1rGuCezGVFS8ZJSQg5DxH7DXWKg06PRmuY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SMsa+PWYEESAcuC5m6VzXGM+mCRpWmbuQVV724+b2E+Ln3sWwbHXqP73iQYgBXoCN
	 u0TvimR85ZSItTe8unupJ0uB1S9kfYefMYmfHek3Gtk65wmCFxy5+20+fNFcsZkZ7d
	 GduqfcB88NmKZ5L+7IPrmPBabTc0Bs16o2GTgwhA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1066F8060B; Wed, 11 Dec 2024 12:28:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91D78F8060B;
	Wed, 11 Dec 2024 12:28:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B00ACF80533; Tue, 10 Dec 2024 18:11:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 09810F800E9
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 18:11:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09810F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256
 header.s=google header.b=Kj09W6lA
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5d3dce16a3dso6043486a12.1
        for <alsa-devel@alsa-project.org>;
 Tue, 10 Dec 2024 09:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850655; x=1734455455;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XG8zYqRJnsZkhZfRr2g1CnvN6FDBTlyfj/tmdbveBiw=;
        b=Kj09W6lAsGIzi45IuIBHJn49HlY+eQ+/Ve7WVLG+dCS9h+n/eonHa2lWk/WmyFkGuO
         0kLHIY69LT7u9/lDlXL6xctZzYXtmf05wMOM1+UmQnkGpNePUvmLrQxDZzvMZjf4FnKb
         HSLHR1eaMiHFMhCxl1zmZVZrOHkWW4Mykj5XYVm7SkJeNaJaBOtTduLkjf6Zt8/nwQUJ
         YnhMVxzS18V+6mMOQFZRxTmXLdZ5zKbKYFgp0f6ncmwBRveabplaqPXfvvrgtAAQpMlZ
         2R87d4S/UIDPV9ZGLX6/sd/7+rXfEgCJX61RY921WbICxn/H6Yxj7SJdhLm7IECvSxh8
         or/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850655; x=1734455455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XG8zYqRJnsZkhZfRr2g1CnvN6FDBTlyfj/tmdbveBiw=;
        b=Be7Ey4lnSqZ4N0wn3VMAiWq3x01LsqwEfjPEi6oBBtFBoXVCDTyB5NPil8scQeX22W
         tO4wNCO51sHcuIzTZ3cglajlied9ZeIev4KmFgobzD9HijNLns/Is9tsTGaJ7JE49dXK
         S8OapYJqySthFEtAZoHhgfeBHGeE6ESwqMg5jUhsEcYEBKiUEgmzOFOxOngnOFRAhp3F
         A0gI0POYnxR1jIdvwWTTy9q54aRqhF2/H1rlVMBX2wtdlU+A5h1TI8gzQjqm75McdYoI
         LY+xLctiHt0zOG9oBUcJwZkBrOY8vByvDxuBQUH1a0bmRoc5flyBnveO1jN0Y1+Td1VB
         8PNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz1GRculivBDJFGhziyNuJTsv9D6KsJ35VLMVloAlcRcyRcQD9MrRb/2HK44XGTa6zZemM2f7yzYrV@alsa-project.org
X-Gm-Message-State: AOJu0YyQfnh3P+KgBM73v5cn4JTqsFHT21DhlwSur6m6BijALcNIKrB/
	9Mc1OrOdT60e3Ltoy1gM/zA+hzUiMDuout6b1NawinQY97bJRzHGz8TXlnjCpTA=
X-Gm-Gg: ASbGnct37v30hMaEgopsTN6/i63yzP3z7aanhdRouQs/qBQb9LOTQjEW1API6w9cccC
	+WW6Q9FOVxPjB72SP27ywGxJbLo2P7JQscEDqSrNDaPG/OwJqp0KYknBCtBwhA764F1EmaWLxUq
	KlavKSwyi6CICRuLLX/6sGAIbs8c1bno2gCYPojUoeQXhdhOeHV30JnK1APadLRPhQnjOZqX1aX
	HpFI0TD0PbGOyvtsZbCKreCts7vYcigmpBei9jEr94LE9jd9r6JsnSoEkolloJNAl6UKnjSaKQd
	YeHnqtpH
X-Google-Smtp-Source: 
 AGHT+IEgKnHNaC3IX1FEtNtvTz24/8StgSao5VAD6Ub2m7Bx+D6TJNFGkozP9JnrbZSvN4zlM3/+Ng==
X-Received: by 2002:a05:6402:510a:b0:5d0:d208:4cad with SMTP id
 4fb4d7f45d1cf-5d41e16362amr4621139a12.2.1733850654831;
        Tue, 10 Dec 2024 09:10:54 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:53 -0800 (PST)
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
Subject: [PATCH v4 21/24] arm64: dts: renesas: rzg3s-smarc-som: Add versa3
 clock generator node
Date: Tue, 10 Dec 2024 19:09:50 +0200
Message-Id: <20241210170953.2936724-22-claudiu.beznea.uj@bp.renesas.com>
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
Message-ID-Hash: DYDSG46G2OBWRDZCUINRR7SC7K3W45WK
X-Message-ID-Hash: DYDSG46G2OBWRDZCUINRR7SC7K3W45WK
X-Mailman-Approved-At: Wed, 11 Dec 2024 11:27:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DYDSG46G2OBWRDZCUINRR7SC7K3W45WK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add versa3 clock generator node. It provides the clocks for the Ethernet
PHY, PCIe, audio devices.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- none

Changes in v2:
- none

 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 2ed01d391554..6e58d47d85b0 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -92,6 +92,12 @@ vcc_sdhi2: regulator2 {
 		gpios = <&pinctrl RZG2L_GPIO(8, 1) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
+
+	x3_clk: x3-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
 };
 
 #if SW_CONFIG3 == SW_ON
@@ -152,6 +158,30 @@ &extal_clk {
 
 &i2c1 {
 	status = "okay";
+
+	versa3: clock-generator@68 {
+		compatible = "renesas,5l35023";
+		reg = <0x68>;
+		clocks = <&x3_clk>;
+		#clock-cells = <1>;
+		assigned-clocks = <&versa3 0>,
+				  <&versa3 1>,
+				  <&versa3 2>,
+				  <&versa3 3>,
+				  <&versa3 4>,
+				  <&versa3 5>;
+		assigned-clock-rates = <24000000>,
+				       <12288000>,
+				       <11289600>,
+				       <25000000>,
+				       <100000000>,
+				       <100000000>;
+		renesas,settings = [
+		  80 00 11 19 4c 42 dc 2f 06 7d 20 1a 5f 1e f2 27
+		  00 40 00 00 00 00 00 00 06 0c 19 02 3f f0 90 86
+		  a0 80 30 30 9c
+		];
+	};
 };
 
 #if SW_CONFIG2 == SW_ON
-- 
2.39.2

