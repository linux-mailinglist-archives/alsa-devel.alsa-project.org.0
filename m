Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD867907794
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 17:54:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C9A2E9D;
	Thu, 13 Jun 2024 17:53:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C9A2E9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718294047;
	bh=JqmBRm5p/y60vQho/QixG5OijJiMY4yvo8+3qIYS2Eg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LklxyY1N5jRJ7PjchEAaNnQicZemxl8dPEwOFycdH+N0IQk4RboNCts9ILcXUc0dI
	 rb3PvkjDFuZP90et1+eMHgvpmaSFUFkkrZxjG6kOQFyd2zuk2++SV4+l8njGJou7Qc
	 26G0PkfLkyOpfRZZGDQ0Uh/koZNuFvxcddZ5thPo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAA58F8076A; Thu, 13 Jun 2024 17:51:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C6A7F805BA;
	Thu, 13 Jun 2024 17:51:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8445F801F5; Sat, 25 May 2024 15:32:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47417F8051D
	for <alsa-devel@alsa-project.org>; Sat, 25 May 2024 15:28:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47417F8051D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iRHOfnKT
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a6265d3ccbdso163885266b.0
        for <alsa-devel@alsa-project.org>;
 Sat, 25 May 2024 06:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716643698; x=1717248498;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xAevoRwyHB/hjeggss8BgF1gg74yCzQU/uk4mIsOlV8=;
        b=iRHOfnKTaLwQI6I3k5vhxamruamIjWhgVPa/nglKDcn/KNhn4n12MJgl/W6qeFi39s
         cEiivc6lBGt+4tsfeQBBVadnOPuPdph4vTEVKW7V7D8Qu8qJtHikd+Uw5f8SU7Rpox4D
         //A3FYG/T2p0vt4ZIZ4qCt9TFg3iWUOWmp4Y7a/isMICWiyR/VWY2Nqa/hNY6o4uNaFm
         YjfTXB1k91xqPP8SLYLhbmKIMEA7kS9T4bPyFiNIpm3S+MZoYlFUANj6OuG1GsAuha7d
         faen8f5euqOhrqtvXqgKW/P6LchvLNtSZdd7Q970GixZERMs+HLtM8As6UEulT7y/WKh
         GwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716643698; x=1717248498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xAevoRwyHB/hjeggss8BgF1gg74yCzQU/uk4mIsOlV8=;
        b=DmnL6zFc4ILwCdL05x41Z6ZVC6IvGJwVQ1v3CobbMbj/G8p9vHjZLnimrba8q+v3T/
         qBSIQf0C7AeEhV6us5JZAMllzGDwyFMVjdxXiXj0AmrMBwuf6NqrHC86nj4ANy+/kkM3
         sS4tY0YuPArHO308Byua9kh8vn4fWBZ2sdN24avj7wwMXd4GT9ZIMZiVp7zTHhDvdcBU
         mp9rIl3gVb+ZL34hF27kdxe4G7v9CSPXI3kaWSF+tGTTr9H8jbEkRtaz03jZsD4puOTt
         qyehrgW0oYsEMMgmDZLUBKqPby/V8myeB9AbRIz3sutUcii6STcx/8UHyJ2m77fziQER
         h7dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEQ9Kdaar/WHn+Hn0DCbQvLgz+Co4L5OBqs6WpUmuq59eOF8Q+RqUukR9LpPZBGG8qPJ19PUnV/JxFVBUofed20H8fzeg7VTvmtFE=
X-Gm-Message-State: AOJu0YwXukEOJ70rALEUFF4Gu3LlHCdd40+OhIDS+P8fVKa+gk3qsp37
	2A/ZzT7sWZ2lkxgA2NVYSPxB9929nBtvyfyS/nfaRSSzaGu4191L
X-Google-Smtp-Source: 
 AGHT+IHjDWw31Jpb0flKPT54OLT41uuXKaoyPQviyN3N7/UlfI6Rk1BZIMko/WbbCb3qjGua2q1M2w==
X-Received: by 2002:a17:906:68c7:b0:a59:ab57:7413 with SMTP id
 a640c23a62f3a-a62651341ffmr304999866b.73.1716643698275;
        Sat, 25 May 2024 06:28:18 -0700 (PDT)
Received: from hex.my.domain (83.8.128.191.ipv4.supernova.orange.pl.
 [83.8.128.191])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cda46e1sm251842566b.196.2024.05.25.06.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 06:28:17 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 25 May 2024 15:28:13 +0200
Subject: [PATCH v4 9/9] ARM: dts: samsung: exynos4212-tab3: Drop interrupt
 from WM1811 codec
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-midas-wm1811-gpio-jack-v4-9-f488e03bd8c7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716643685; l=1130;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=JqmBRm5p/y60vQho/QixG5OijJiMY4yvo8+3qIYS2Eg=;
 b=att6PI+S7xL/90ESu59NSz4LR4vIES/yJXLYib2LgY8EMPIGeok1wNdGajg7ym3EcfPb7CnFU
 Pwld1M2ToFDAxruK69JapsFnNIrDHO+vaCy7Kw72doBiWQPqda/rdnC
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WKYRNB7N3A3QJALVD2VZPPVADKJLAK5B
X-Message-ID-Hash: WKYRNB7N3A3QJALVD2VZPPVADKJLAK5B
X-Mailman-Approved-At: Thu, 13 Jun 2024 15:51:03 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WKYRNB7N3A3QJALVD2VZPPVADKJLAK5B/>
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
2.45.1

