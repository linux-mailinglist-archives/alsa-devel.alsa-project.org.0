Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B1F78CC2F
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:34:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B00C6EF3;
	Tue, 29 Aug 2023 20:33:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B00C6EF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693334072;
	bh=fUByFQQkxeV9Q5xd4DR4D93//94pHARsZ7BtD4aw5qM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mxoZGkkK7A9viUNp7NsiMD0zVSy3e/KVgTC7Weba90t6307BTShuk+3kfgse97Ea4
	 lMC1rKYZW0fhLVKgeAmKBDPBgTfA8ljqSzX5QNE49zeyTZQ5eF2SEhT/C3n4s+1uZB
	 H79b0+/jGfbEarVclIZY1BfCEo8kdkeFaQY9cq28=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F160F805B6; Tue, 29 Aug 2023 20:28:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5289F805B0;
	Tue, 29 Aug 2023 20:28:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EADEF80527; Tue, 29 Aug 2023 19:18:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E81FF80537
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:17:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E81FF80537
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=aSD4wG+1
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-99c3d3c3db9so599028366b.3
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693329473; x=1693934273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dS+cPFrn5V/oSL99Q2BbWTKIW7SUu4ItJIJ2pH0oI9I=;
        b=aSD4wG+1ZRnljM4CSIseFFCuF2Tv5IT8Wosx2+GepQr8oGYlYInqGm4jF10OVnDP0L
         BZIXogAsXeoecVaZXYJFSl9ArISaPcBdoOdP4jX1SDAxCtLv80kdnqgfxqejZkeVK8Dr
         1qSbdG5PVML8gIAK2mtsZlsFS3Ege/Q3pT+HLIPFg5AKuk49iKFo/GrUvhJ3w/rJ3vlb
         Tuh6inFRswC+h53iRgRJPjrJBeB7t+T3ZE6ijXz9T3eyepS6VUDenDiDDy0ImCUkwaN0
         8NEopfwb0O7l/QZ5RY84W3ft6aPTskb0Vl5+uIVtchApO7uOjs/JBm8Gs9uexal5+0xq
         TWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329473; x=1693934273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dS+cPFrn5V/oSL99Q2BbWTKIW7SUu4ItJIJ2pH0oI9I=;
        b=HHZQErePi5l/HgNvmFhXQEp+HHoNYUWME8HtKd3GoJs6CWLmUyXB/3lxNpik11fZW4
         uLJmeTSB34CofgR1RcSsVEjU1nfFkC/0Rn9t4A225mmLj2R/hbFrkskMu8kdOi/3VCIo
         mV9r0gtY/SEY/mIigLN35GFX+jJ6BHzt3UbKNP962ChSn1rGAoQql1m7gCniDmIQMLG8
         Icug6SPhwLt27YSlQtGx/s+rOIFwL1RstI0WEpyHj3ov57ACGOkWLs/tEgZJKIWHBKX0
         HWOxhaQPi3eM/nQ5e4qfN8hpqy8fJuzsk4SaKve2n62bhptkFdJ3flAgQYg25cI71qEC
         F3vQ==
X-Gm-Message-State: AOJu0YzfWQZ+59TaTrDNDACtIM1Pw587ScSywRr8Jhq93MAETiSWsc9k
	gxPpjITyCR/8RuqfqEb+9w==
X-Google-Smtp-Source: 
 AGHT+IGcrzem3XmHh2sQJCxUgf3Dq9aCyWk4H3R61SzzGzQKcWYq2aZscEw/gTmdQ+TjCJfx6SK5jg==
X-Received: by 2002:a17:906:3018:b0:99c:ad52:b00 with SMTP id
 24-20020a170906301800b0099cad520b00mr20752169ejz.6.1693329473271;
        Tue, 29 Aug 2023 10:17:53 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:17:52 -0700 (PDT)
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
Subject: [PATCH 29/31] ARM: dts: rockchip: Make usbphy the parent of
 SCLK_USB480M for RK312x
Date: Tue, 29 Aug 2023 19:16:45 +0200
Message-ID: <20230829171647.187787-30-knaerzche@gmail.com>
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
Message-ID-Hash: UYD4DL5HFSQ5AMMVHNNSEMA3JBFN4JYS
X-Message-ID-Hash: UYD4DL5HFSQ5AMMVHNNSEMA3JBFN4JYS
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:28:45 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UYD4DL5HFSQ5AMMVHNNSEMA3JBFN4JYS/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Without setting the parent for SCLK_USB480M the clock will use xin24m as
it's default parent. While this is generally not an issue for the usb
blocks to work, but the clock driver will "think" it runs at 24 MHz.
That becomes an issue for RK312x since SCLK_USB480M can be a parent for
other HW blocks (users of mux_pll_src_5plls_p) but they never will choose
this clock as their parent, because it runs at OSC frequency.

This sets usb480m_phy as SCLK_USB480M's parent, which now runs and outputs
the expected frequency of 480 MHz and the other blocks can choose
SCLK_USB480M as their parent if needed.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk312x.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk312x.dtsi b/arch/arm/boot/dts/rockchip/rk312x.dtsi
index b13957d55500..19bd6448d122 100644
--- a/arch/arm/boot/dts/rockchip/rk312x.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk312x.dtsi
@@ -293,6 +293,8 @@ usb_host_ehci: usb@101c0000 {
 		reg = <0x101c0000 0x20000>;
 		interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru HCLK_HOST2>;
+		assigned-clocks = <&cru SCLK_USB480M>;
+		assigned-clock-parents = <&usb2phy>;
 		phys = <&usb2phy_host>;
 		phy-names = "usb";
 		status = "disabled";
@@ -303,6 +305,8 @@ usb_host_ohci: usb@101e0000 {
 		reg = <0x101e0000 0x20000>;
 		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru HCLK_HOST2>;
+		assigned-clocks = <&cru SCLK_USB480M>;
+		assigned-clock-parents = <&usb2phy>;
 		phys = <&usb2phy_host>;
 		phy-names = "usb";
 		status = "disabled";
-- 
2.42.0

