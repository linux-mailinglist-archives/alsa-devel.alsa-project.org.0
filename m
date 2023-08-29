Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5C178CC31
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:34:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7599AED6;
	Tue, 29 Aug 2023 20:33:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7599AED6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693334085;
	bh=AeOBIOMhGbmXCXKOzaLdcIGriaAcAZtqIOVzqOjNPQc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lrx3QjsJ6Mkl/avasjVJmk9QTYsAL2y9W6B08RqM88MpURw8jl5EgEo9jOAm+7oBY
	 p0Xsvp56R3XgQoI58XerHJ/smSv0Uqx315yg0uvdBIToi8ZQd0CWZeg0CYOpNGc0xJ
	 oCgfcFTpz3QctpiritZ+6jMU5aj6ZzxI2j8JG9h0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59264F805C9; Tue, 29 Aug 2023 20:29:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50339F8059F;
	Tue, 29 Aug 2023 20:29:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66EF7F80155; Tue, 29 Aug 2023 19:18:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08340F8055C
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:17:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08340F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=BwZxCj4t
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-99bc9e3cbf1so2621666b.0
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693329470; x=1693934270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCJom29YNAbeZrXkmUSy8bqZVMtySFQVpTmPU7p9fpw=;
        b=BwZxCj4tycBA0cAASNX2rKlNNQ4F85+7OzyOYRgBDcR/r1Rxn3+MRs1cYfJAT1Zw8s
         qzWAc5yCqfuc0FTy+vR8EoxzaVsKwcdFu1OVG8l0nfbEo5kI8FY9U/Yuay5+reM0eeID
         AW9tlmAaDtkLRRcZ+ES8GvOMi5e9uryVYwybOK20XtSY1pFWthL4sX9RAosS4UFFtvRi
         vcSn6VZlfeLJC137N6nXbPmyzbnaRfN2F4CT5bn9HnubxuG3JSvNVW5zEK4VZhV+QNrD
         urnjeTvh5oCBWV8gIrgJ8Ad4xqk5gFbUI+NxC92NqJda/xBtAHf5rIg4y55fDg/WwoTo
         Pb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329470; x=1693934270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PCJom29YNAbeZrXkmUSy8bqZVMtySFQVpTmPU7p9fpw=;
        b=P9NJ5jaz14TVt0BNJAu6DIS9j6U8LciRl4co6WRzL41HPpJnmwnZ9eF84l8Jf3lZbq
         PhtlF8+JECj7+XT0NCQm9IvXylWiL/7PwozagMdPATa1JBq9zcC8aGrElU4XpB2JNIw9
         Vfr6AOITp94EMauOdOHmYhnwNzm2WLPd+i2TY9b2P+bDASb7NtXRKBE/Zfdi6ld9eAec
         CwgcbmUhIXD6RCvDFYkpbpVCm1wiB0qGQH4OoG7d4gUvKG0+qqla0IC5xI1H/RviEpi5
         MASpe9/LVykK05wFDQYa0aLvjxlR/r3LWMSa/rbKjOlVFHxkI6QroR3y6To7DHB42uEP
         GYBA==
X-Gm-Message-State: AOJu0YwCCVVbAyGOiHDVB+ZeOLFdKi+KnoZt0boiNifb9i0PD4+f4uyH
	XsYWGfQ3xcX9Oq0G/9AAWA==
X-Google-Smtp-Source: 
 AGHT+IE5VAqTYu0TpR/gEgBTX4rVF0ZLvuyk9o8kotWD9Y3byxkS/tgqtwzcFS28p1DgLC1+EPXD9Q==
X-Received: by 2002:a17:906:11e:b0:9a5:a543:2744 with SMTP id
 30-20020a170906011e00b009a5a5432744mr4088667eje.33.1693329469971;
        Tue, 29 Aug 2023 10:17:49 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:17:49 -0700 (PDT)
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
Subject: [PATCH 26/31] ARM: dts: rockchip: Add gmac for RK3128
Date: Tue, 29 Aug 2023 19:16:42 +0200
Message-ID: <20230829171647.187787-27-knaerzche@gmail.com>
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
Message-ID-Hash: PM2OLAMUVGWZFRLQF7F6Q6WUV5UGI2XP
X-Message-ID-Hash: PM2OLAMUVGWZFRLQF7F6Q6WUV5UGI2XP
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:28:45 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PM2OLAMUVGWZFRLQF7F6Q6WUV5UGI2XP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the gmac node for RK3128 SoC.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3128.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/dts/rockchip/rk3128.dtsi
index 874c97297c63..54a2768153c0 100644
--- a/arch/arm/boot/dts/rockchip/rk3128.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3128.dtsi
@@ -63,6 +63,32 @@ uart0: serial@20060000 {
 		reg-shift = <2>;
 		status = "disabled";
 	};
+
+	gmac: ethernet@2008c000 {
+		compatible = "rockchip,rk3128-gmac";
+		reg = <0x2008c000 0x4000>;
+		interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "macirq", "eth_wake_irq";
+		clocks = <&cru SCLK_MAC>,
+			 <&cru SCLK_MAC_RX>, <&cru SCLK_MAC_TX>,
+			 <&cru SCLK_MAC_REF>, <&cru SCLK_MAC_REFOUT>,
+			 <&cru ACLK_GMAC>, <&cru PCLK_GMAC>;
+		clock-names = "stmmaceth",
+			      "mac_clk_rx", "mac_clk_tx",
+			      "clk_mac_ref", "clk_mac_refout",
+			      "aclk_mac", "pclk_mac";
+		resets = <&cru SRST_GMAC>;
+		reset-names = "stmmaceth";
+		rockchip,grf = <&grf>;
+		status = "disabled";
+
+		mdio: mdio {
+			compatible = "snps,dwmac-mdio";
+			#address-cells = <0x1>;
+			#size-cells = <0x0>;
+		};
+	};
 };
 
 &cru {
-- 
2.42.0

