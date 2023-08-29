Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FB978CC14
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:30:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A77E7E85;
	Tue, 29 Aug 2023 20:29:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A77E7E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693333813;
	bh=9a8K73s41YCgJS6WC2k14rzWY4aq6o2M9PAiV7fXyjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M5nqXUW3M1ExutEnNz/L8cXDODG6cBsVAg97TtMQE/Kvu9zuHqs6f+83Da4DOWnDt
	 qJ39gUmMHE6sPIdrVIZ4C1tMT8GSwiQzyD+aOn6/mazmnK1H91dEDUc1muJ8fCF+al
	 6Bxidl2ISqa+h6iB1vpGzKOKbp6exQZidOCaG0eo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BD40F805F0; Tue, 29 Aug 2023 20:26:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AC5BF805F0;
	Tue, 29 Aug 2023 20:26:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7910CF80551; Tue, 29 Aug 2023 19:17:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F6ADF800F5
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:17:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F6ADF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=qqFL0Fps
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9a2a4a5472dso987237066b.1
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693329457; x=1693934257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xb0bVdz0t+3wIuYIP2F+90OzL0D6aGQzldL875Tj4a8=;
        b=qqFL0FpsPqLqqbrAvN473dW2rm8ml+nlYddNBw/C3fYlnRwrbLI9EIelH7Uqdi+KVz
         l5b5xksUudDc5Wx/U8c406KI5yKQH4MxG9NFEI4uttOYtAF4c1Q0zI1MPnxL6MoaiA7h
         5u8pJ8K5JNQsx8o1PZHKKVYE52tWdbPwf4B9K6ESq62gEvHxPWNwOnwD8tHL0nvtK136
         5WVQk/8Qwn05nm/qNmTcdaQsZdMg8cMk4PgR2J+b068SxJ1UgUxPvkn+v1Y1xL+7NMoV
         +NB7CZT4CulmYIJ91aRaoUj8aiciVhU/CizJU1NZ6IfwsMaffjhK+WWMNfOem8JQUsi5
         Kn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329457; x=1693934257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xb0bVdz0t+3wIuYIP2F+90OzL0D6aGQzldL875Tj4a8=;
        b=VtD+EkICLL8AFWIk9ZSBrNugWSvVrk7EknSOt/jblfAeWVO1XLUVr4nlO7E/73lfXG
         AJy/oIKSFxgdKTDQjKDD6Rf+Mo6B5mALCshxb/vqOhVh2oymJTvUg2N30hNmJxaoeiib
         bJSg9B3e00sgnZfU2BVMed0c72r1TPHmXXuzFZka2DFVeg038Q5PdbgUz/BlllXNtakW
         SLOOIwfxiZbw9tmbUYo1F7oMaAoikGh5HJzzY+f6p8WnmSOKY9cojn3QPz2qTIObe4JA
         THmVXot4Re0Zp6Ca70O6WnXNfLwd6rwtR/U3XIRk0/U2UR9kPX5+cqVuQyjXbJXGKBji
         ufRg==
X-Gm-Message-State: AOJu0Yz6TTnlgSnPGRxaTJkKLyvrn/ZGx1CQEETJ+YAsziyXP+wmCDQ2
	tBj1boScUBPxI6M+6XmVMw==
X-Google-Smtp-Source: 
 AGHT+IHuKu5IeGEJDdo0cjQvWq+Trad55MfK5T4Sc1QWBUznaCFvLImCREY4QADbcwYbKJ0xN/WJFw==
X-Received: by 2002:a17:907:a076:b0:99c:5056:4e31 with SMTP id
 ia22-20020a170907a07600b0099c50564e31mr4078809ejc.15.1693329457126;
        Tue, 29 Aug 2023 10:17:37 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:17:36 -0700 (PDT)
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
Subject: [PATCH 13/31] ARM: dts: rockchip: Fix timer clocks for RK3128
Date: Tue, 29 Aug 2023 19:16:29 +0200
Message-ID: <20230829171647.187787-14-knaerzche@gmail.com>
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
Message-ID-Hash: JAQCH4NFCNQLE5UHVEQL3HGINZN4EITP
X-Message-ID-Hash: JAQCH4NFCNQLE5UHVEQL3HGINZN4EITP
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:26:10 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JAQCH4NFCNQLE5UHVEQL3HGINZN4EITP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently the Rockchip timer source clocks are set to xin24 for no obvious
reason and the "real" timer clocks (SCLK_TIMER*) will get disabled during
boot process as the have no user. That will make the SoC stuck as no timer
source exists.

Fixes: a0201bff6259 ("ARM: dts: rockchip: add rk3128 soc dtsi")
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3128.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/dts/rockchip/rk3128.dtsi
index 9125bf22e971..88a4b0d6d928 100644
--- a/arch/arm/boot/dts/rockchip/rk3128.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3128.dtsi
@@ -234,7 +234,7 @@ timer0: timer@20044000 {
 		compatible = "rockchip,rk3128-timer", "rockchip,rk3288-timer";
 		reg = <0x20044000 0x20>;
 		interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru PCLK_TIMER>, <&xin24m>;
+		clocks = <&cru PCLK_TIMER>, <&cru SCLK_TIMER0>;
 		clock-names = "pclk", "timer";
 	};
 
@@ -242,7 +242,7 @@ timer1: timer@20044020 {
 		compatible = "rockchip,rk3128-timer", "rockchip,rk3288-timer";
 		reg = <0x20044020 0x20>;
 		interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru PCLK_TIMER>, <&xin24m>;
+		clocks = <&cru PCLK_TIMER>, <&cru SCLK_TIMER1>;
 		clock-names = "pclk", "timer";
 	};
 
@@ -250,7 +250,7 @@ timer2: timer@20044040 {
 		compatible = "rockchip,rk3128-timer", "rockchip,rk3288-timer";
 		reg = <0x20044040 0x20>;
 		interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru PCLK_TIMER>, <&xin24m>;
+		clocks = <&cru PCLK_TIMER>, <&cru SCLK_TIMER2>;
 		clock-names = "pclk", "timer";
 	};
 
@@ -258,7 +258,7 @@ timer3: timer@20044060 {
 		compatible = "rockchip,rk3128-timer", "rockchip,rk3288-timer";
 		reg = <0x20044060 0x20>;
 		interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru PCLK_TIMER>, <&xin24m>;
+		clocks = <&cru PCLK_TIMER>, <&cru SCLK_TIMER3>;
 		clock-names = "pclk", "timer";
 	};
 
@@ -266,7 +266,7 @@ timer4: timer@20044080 {
 		compatible = "rockchip,rk3128-timer", "rockchip,rk3288-timer";
 		reg = <0x20044080 0x20>;
 		interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru PCLK_TIMER>, <&xin24m>;
+		clocks = <&cru PCLK_TIMER>, <&cru SCLK_TIMER4>;
 		clock-names = "pclk", "timer";
 	};
 
@@ -274,7 +274,7 @@ timer5: timer@200440a0 {
 		compatible = "rockchip,rk3128-timer", "rockchip,rk3288-timer";
 		reg = <0x200440a0 0x20>;
 		interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru PCLK_TIMER>, <&xin24m>;
+		clocks = <&cru PCLK_TIMER>, <&cru SCLK_TIMER5>;
 		clock-names = "pclk", "timer";
 	};
 
-- 
2.42.0

