Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E218CB006
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2024 16:07:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01C851E7;
	Tue, 21 May 2024 16:07:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01C851E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716300435;
	bh=/QyKeHFcTD2xub55oeUkv2MeNFIR4VYheZEY658FtbY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OdiK0hdrgIgzn1Df9RuZJtmSRht7qtxPD31nsEXg2u8ZEEQ3Evl7CWpevz8+0e+B/
	 WZVV2PvpvzxnGPXRjvqBkiagjRfYQKu1GAFlaBujEluVxfX2uaPzshXE75x4S5bI6+
	 jOyYHGTPpFp9e6c7YHFQF6BeqBX0yRoqeFhTwz5k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A65C2F8026A; Tue, 21 May 2024 16:06:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5525DF8057A;
	Tue, 21 May 2024 16:06:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 252C5F8026A; Mon, 20 May 2024 16:29:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 95AAAF8016B
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 16:28:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95AAAF8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Q2JuZsxC
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-34dc129accaso2055066f8f.0
        for <alsa-devel@alsa-project.org>;
 Mon, 20 May 2024 07:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716215338; x=1716820138;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aoYlKJuAVKS/043JOXevm+O+WyF+DYPGbRh4c0zs6G4=;
        b=Q2JuZsxC/Fqs6RAUYuOJhbIjPMR6hXMHsTUzQ0lxvaTnq3tMtqcKS3ciOi4z/aaGq5
         fRCIk27MvMetXR95nPcAiDVKBHDGIjN3C28zOUGTvNKX1nnNC07ZVPd85zMxUja/rCV9
         1g/ZkhaSQxWscdvYoB6Se2F6a7stnFh4YIYy1m8iJ7Hkxr+DvkmMc96RIpWJZpiM7DuK
         FFgk4196LEdIKCyNjdABZneBCj+uYSRECEDENl9iPsuR9UoFknhvojZ/unNj5v2L+dmj
         JQ2ZrsfdX5DquC6FgsJ7UPpQ0JmA/A1U+UmzH8B9gyizc4GYpcVR80tLKQm/OJRWa5T9
         jh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716215338; x=1716820138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aoYlKJuAVKS/043JOXevm+O+WyF+DYPGbRh4c0zs6G4=;
        b=TJUYjh6DLevUGhAYBOxNwvoPQSj6NJASudFC+gC9Z/IHhC419ZXU0XGykoElHzTweQ
         ic6Td6ZzK0HhU+4nfXrDAnCLy2fmR4jJL/tHpHvRsgSYKi0Fc7tcpM8+P3XrsrQb2zaW
         OFWt9daZy+64GjW97H04kGXnkDK1KJ0w09Zwd2tmuJly1+XALQZRiy8eTBoJ/zCNO7At
         M4BYPpGjBafBZKXP+Q/Zh8xTe00eAFhbCDcLU9hQ8jp94eLjr6vINEXgJX8+47ogmJE/
         MVUQ12/JspurRAZ9+4KtoP/2XfPoR4Yt5A3b2CyqoCoqbgIbIuM0FxF8GB4E8GfZxBbT
         w3bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXW2l89yYaKYY43OAW1l+sfaus1/1IRtQFhfnFl5C0vPdPVs/3N3MW/L9e8n5pIXtVmXyQvU5S0YH39yqGNAUstfnLgWuO9CKpNgjA=
X-Gm-Message-State: AOJu0YyOSF7Z2Dg35mK4V4RIn/xTkh+oIFyveY5h0w4FF7BcMpEYzst3
	T8/nKkSh1oBmjvH+eSh7tZ5SF7u4+QeJ4CFGxVtdxyirEVvIJ0IPu1f2+A==
X-Google-Smtp-Source: 
 AGHT+IF4aVK2RHhsoD2L1FcF//bl60wrCCva82WMUuzqnmun+LZB4T1hbo8EUe/nwWs1BL/H6eqGiA==
X-Received: by 2002:aa7:d1d3:0:b0:574:eb26:74a with SMTP id
 4fb4d7f45d1cf-574eb260839mr10123048a12.21.1716106698259;
        Sun, 19 May 2024 01:18:18 -0700 (PDT)
Received: from hex.my.domain (83.8.125.62.ipv4.supernova.orange.pl.
 [83.8.125.62])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733c34e5ccsm13698518a12.95.2024.05.19.01.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 01:18:17 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sun, 19 May 2024 10:17:53 +0200
Subject: [PATCH v3 7/8] ARM: dts: samsung: exynos4212-tab3: Add MCLK2 clock
 to WM1811 codec config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240519-midas-wm1811-gpio-jack-v3-7-0c1736144c0e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716106686; l=1280;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=/QyKeHFcTD2xub55oeUkv2MeNFIR4VYheZEY658FtbY=;
 b=uIhQX5gQujMd8bBF2k9b1KLhHd9WhMaSqaCMxb8Np8cIQECgR/UjvobYYub101csayG1sTsUl
 wFY8L+MWe0dA9Ypafuhq1UhoaBTHpdAku9evW3iE3kLkozY5QxnDDuZ
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: D2YZU5GAAA5EGSVUYWFPQS6ZVNM2VV3F
X-Message-ID-Hash: D2YZU5GAAA5EGSVUYWFPQS6ZVNM2VV3F
X-Mailman-Approved-At: Tue, 21 May 2024 14:06:37 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D2YZU5GAAA5EGSVUYWFPQS6ZVNM2VV3F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In the schematics, the MCLK2 pin is shown as connected to CODEC_CLK32K,
which is derived from the same 32KHZ_PMIC clock as Bluetooth/WiFi and
GPS clocks. 32KHZ_PMIC is connected to the BTCLK pin, represented in
mainline as S2MPS11_CLK_BT.

Add the MCLK2 clock to the WM1811 codec clock property to properly
describe the hardware.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v3:
- Split out from "[PATCH v2 7/7] ARM: dts: samsung: exynos4212-tab3:
  Fix up wm1811 codec config"
---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
index 8dc81112172c..47e9a230f2e8 100644
--- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
@@ -529,8 +529,9 @@ &i2c_4 {
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
 		interrupt-parent = <&gpx3>;

-- 
2.45.0

