Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E461578CC1A
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:30:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91F56E8C;
	Tue, 29 Aug 2023 20:29:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91F56E8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693333841;
	bh=cupJ1Qur35iobD001sNytKnrFT2h7LMT0yBScM4TTUA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d3Inr36mQK6vPBt2GnOKhbxhj5Wir1ZcSTAg2gSGs+c8AlDMoIShszha7JcuP54ZN
	 1j/c2o2KLf4K14lqL6vMl++MJAG02XhBTGKRi4uPXa5q7mbPtwKdBvyye5i1YKpGMI
	 y3NzIgFGp8qV5E2HOx7mfWvas7otXVsjH24/f0gA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45AACF80607; Tue, 29 Aug 2023 20:26:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF508F80604;
	Tue, 29 Aug 2023 20:26:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FEC4F80563; Tue, 29 Aug 2023 19:18:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30C8DF80236
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:17:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30C8DF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=Wd1uGdGn
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9a2a4a5472dso987243066b.1
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693329458; x=1693934258;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPphieGb8xL4eR5mTMzLTUQW79Ts5+jV8h+GajjCpv8=;
        b=Wd1uGdGnGgDnFNIXRL4vVmXVqfeEjScf9jRRsCHcE4yOUvPhZ1ptJpYRHjT+bxoaMb
         Or0zD71qx0JCduu3eGrz2/kG9gf6nx18j6LetiM78TV0MpntxNdHYDGSpkAbPdaYm1zq
         3dJfP11UWaSlCx2Y3PfKLRCRanTHqXxfBq4jlAdTNbrojGP7HDBy5KcyjUuZKggwDexG
         iVnHWyBppWojU5McZL8fDyjSGQWid9VdRp7VM9e81W7SqhgwvKBgg1O3q5Jb8pphx6u6
         9uuGk+itgLB7K0RLiaRMZNQf8co5C3v0Zc4W8/JBq0VXqildNRmKe8KGjniKhQ3tWzJo
         Z6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329458; x=1693934258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPphieGb8xL4eR5mTMzLTUQW79Ts5+jV8h+GajjCpv8=;
        b=Y8XKN6cdXzMHOLf8JJPqm+Mv5UkhMAON4wUgsfN0xbS6G9g6R08zpFli53FzRkdFCv
         zwk2N172r1ynRlg8HpMOPL1YoR0YHSjLq/eSLEPHUAp7L+0VXn+96dyKvcDmuEZ4/SEz
         UpB/s1e36z8f8XGtfkjm4Rj7wOW9NeI+V58vuFUuChAyYB0ToMYyGX0W8iuIHIPZyuZE
         jl70oE0kiI5E5rsQKhps5vZPTqucEA3UE7iWAfW8GBUOZzVEI5Br6gBVu/O0tDQJbeKg
         UiEM34QAGrprOClCAGOxIjMBPdsRztF59n+3jb+OqzihJTYtQdSeiSkF1/IFA6QqhEW5
         dR6A==
X-Gm-Message-State: AOJu0Yz6OgOFAd+XNo+MK/919CQhoKh1dg9SUeJT8yXxTt1m95XA0UDL
	6a0ri3Z3/N/SkDw2Nd7vJQ==
X-Google-Smtp-Source: 
 AGHT+IGSTrK9d7vStZC0bzy2T16uTrrd34R83QYESq2KKcyDTtiuTq+EZyCdPP7zwxTKL8JMYzopcA==
X-Received: by 2002:a17:907:d1e:b0:9a5:b247:3ab with SMTP id
 gn30-20020a1709070d1e00b009a5b24703abmr3596972ejc.19.1693329458114;
        Tue, 29 Aug 2023 10:17:38 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:17:37 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Elaine Zhang <zhangqing@rock-chips.com>,
	Johan Jonker <jbx6244@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	alsa-devel@alsa-project.org,
	linux-clk@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Alex Bee <knaerzche@gmail.com>
Subject: [PATCH 14/31] ARM: dts: rockchip: Disable non-required timers for
 RK3128
Date: Tue, 29 Aug 2023 19:16:30 +0200
Message-ID: <20230829171647.187787-15-knaerzche@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829171647.187787-1-knaerzche@gmail.com>
References: <20230829171647.187787-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: knaerzche@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: LBRAH37B4WCG5BO5233SKYRLAMYKF7VV
X-Message-ID-Hash: LBRAH37B4WCG5BO5233SKYRLAMYKF7VV
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:26:11 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LBRAH37B4WCG5BO5233SKYRLAMYKF7VV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Rockchip timer linux driver can handle a maximum of 2 timers and will
get confused if more of them exist.
RK3128 only needs timer0, timer1 and timer5. The latter is the source
for the arm-timer and its clock is prevented from being disabled in the
clock driver so it can get disabled in the device tree, too.

Fixes: a0201bff6259 ("ARM: dts: rockchip: add rk3128 soc dtsi")
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3128.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/dts/rockchip/rk3128.dtsi
index 88a4b0d6d928..f3f0788195d2 100644
--- a/arch/arm/boot/dts/rockchip/rk3128.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3128.dtsi
@@ -252,6 +252,7 @@ timer2: timer@20044040 {
 		interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru PCLK_TIMER>, <&cru SCLK_TIMER2>;
 		clock-names = "pclk", "timer";
+		status = "disabled";
 	};
 
 	timer3: timer@20044060 {
@@ -260,6 +261,7 @@ timer3: timer@20044060 {
 		interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru PCLK_TIMER>, <&cru SCLK_TIMER3>;
 		clock-names = "pclk", "timer";
+		status = "disabled";
 	};
 
 	timer4: timer@20044080 {
@@ -268,6 +270,7 @@ timer4: timer@20044080 {
 		interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru PCLK_TIMER>, <&cru SCLK_TIMER4>;
 		clock-names = "pclk", "timer";
+		status = "disabled";
 	};
 
 	timer5: timer@200440a0 {
@@ -276,6 +279,7 @@ timer5: timer@200440a0 {
 		interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru PCLK_TIMER>, <&cru SCLK_TIMER5>;
 		clock-names = "pclk", "timer";
+		status = "disabled";
 	};
 
 	watchdog: watchdog@2004c000 {
-- 
2.42.0

