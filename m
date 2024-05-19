Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8434B8C9E73
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 15:56:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA0787F1;
	Mon, 20 May 2024 15:56:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA0787F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716213417;
	bh=EKY+Hy6LBgA2NYrAxNKes2DxchRh15GEYQsulR1Ud3E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hxOoUNLC4Kv6+qWRovROzwBuLWq15UgS4KyztsFypSKgVFg5DdHDa1tENvhgquyGi
	 MVoLhpEwB9FP9V/gFaY1PJDbuFec7JQ8dKdCJ9rY3jZ2e3zxUjcpTiLTXEYMg5uTDy
	 FC6hEa/ffbybDQYIs7W1YNhUJOjCuAjyhic3TAdg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CA41F805E7; Mon, 20 May 2024 15:56:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1FCAF805F0;
	Mon, 20 May 2024 15:56:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EA83F805B3; Mon, 20 May 2024 15:34:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18268F80588
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 15:34:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18268F80588
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=imw+8wtW
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-420298ff5b1so27946545e9.1
        for <alsa-devel@alsa-project.org>;
 Mon, 20 May 2024 06:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716212058; x=1716816858;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZHcFtW9++T8RHFOp1RN6v1q8xOqk7qAzG9FoGfpxU8=;
        b=imw+8wtW7SZI6nHkpUY+pukMdTvXE0JxLRpSAdqUXwY16cPEESo7G4SAHqy6vSb0GU
         Cqdu1X14clPKAB2lH6wIgnarB/whjw0fMBO0Ojf+d394tg8NVg9pwOjDqqsAJGhjpwGE
         cwg38GJtflepcsa473zveQYpX+KxaFiR9Amlw2RhWyfkL34lUM8Pw5IB/91BsxHXjAHL
         fl9dZEVDl4OsaUiNvLAYpGG5rLM7ef4u/AfaEucp1/BlUSXZIYP8SsP8x5bUMaGevprI
         ElvaYZ+tFkOlFRn4fknkPOEarp8oqvUcx+sTVdu25RKoTczT4WB/wameKjm3H4/0uzjU
         7eoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716212058; x=1716816858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZHcFtW9++T8RHFOp1RN6v1q8xOqk7qAzG9FoGfpxU8=;
        b=IycIoX8UQSed2VYUWHEH47NGKYE7590GUsO1z9lBipAURDTJo8Po3Tph6t0T4CPIhm
         0B8PQLEHPzbOzjWBekw3sj3pMu1LQWzu57bIJJXlR4pzDqvA/JjHqzzrSqr2Y0VyzK2f
         kfE4WdG2DlPEDgGyIwuMgfAt6Uw0PqAMCj64EpIFj6J/BkQeSV8De6HQ4f03UGKowiOH
         DswyE2Xifz0Mq8smdQ2qhSqooGJ8pwkPfJqg3kC1AAIWgtS3vQAgtXyM/CiZ5cGoZCAX
         uubIl4TI2aZGW9DrNEJdX8WE6NZJWoo6kMCyuY6xf3oPKW2UG5dpa2qjuq69yE9iQ+cC
         eRgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWizBQPNRJx16Po+JL0HfoN9m7nK98x5l8xhHKf7xXUaosZlnXunyH4PzVmxLY1FjWLW44fwFYf44bDgGVVI7WoJgZojnL0g8F6uuI=
X-Gm-Message-State: AOJu0YxRkOM0cBqcJcFmZw5wC0mYW/xntX68xhutKtM3pbPW91o85rcA
	gfDZgrdLT3f8CmVK0xtB6cFenO+Dyv94lwHrcJub8kQZTT0Soxmsj+h3XA==
X-Google-Smtp-Source: 
 AGHT+IHzAvK+rhsJq8Fp46ZI7QRqXTxhpYy+yG/cCF9GqQapzPdzcVtci17vQVRRgkNlN/TxSgrMKA==
X-Received: by 2002:a50:d518:0:b0:575:2ccc:13c1 with SMTP id
 4fb4d7f45d1cf-5752ccc14damr2537043a12.9.1716106699861;
        Sun, 19 May 2024 01:18:19 -0700 (PDT)
Received: from hex.my.domain (83.8.125.62.ipv4.supernova.orange.pl.
 [83.8.125.62])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733c34e5ccsm13698518a12.95.2024.05.19.01.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 01:18:19 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sun, 19 May 2024 10:17:54 +0200
Subject: [PATCH v3 8/8] ARM: dts: samsung: exynos4212-tab3: Drop interrupt
 from WM1811 codec
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240519-midas-wm1811-gpio-jack-v3-8-0c1736144c0e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716106686; l=1130;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=EKY+Hy6LBgA2NYrAxNKes2DxchRh15GEYQsulR1Ud3E=;
 b=Nu8HOGw+ABK8etkGN/FIHwRrDIIaop4fIm35cS8IufNRyVktSGw+ltxRgukhX9pKr+Bmh5B/R
 wxogZ+n7q5vB3cE8+MeF9gE6ftpRyW72QbVAuVZlr+VUAeM/A16FXYw
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: Y3FF5FOYCKSIWTG24O6LAS66PQNBFOBH
X-Message-ID-Hash: Y3FF5FOYCKSIWTG24O6LAS66PQNBFOBH
X-Mailman-Approved-At: Mon, 20 May 2024 13:56:00 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y3FF5FOYCKSIWTG24O6LAS66PQNBFOBH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This was initially copied from the Midas DTSI, but there is no
proof that the same interrupt is also used on the Tab 3. The pin
listed as the interrupt here is GPIO_HDMI_CEC on the Midas,
but for the Tab 3 it is the headset button GPIO - GPIO_EAR_SEND_END.

Drop the interrupt, since there is no proof that it is used.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v3:
- Split out from "[PATCH v2 7/7] ARM: dts: samsung: exynos4212-tab3:
  Fix up wm1811 codec config"
---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
index 47e9a230f2e8..20e5e7ba6b92 100644
--- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
@@ -534,8 +534,6 @@ wm1811: audio-codec@1a {
 		clock-names = "MCLK1", "MCLK2";
 		interrupt-controller;
 		#interrupt-cells = <2>;
-		interrupt-parent = <&gpx3>;
-		interrupts = <6 IRQ_TYPE_LEVEL_HIGH>;
 
 		gpio-controller;
 		#gpio-cells = <2>;

-- 
2.45.0

