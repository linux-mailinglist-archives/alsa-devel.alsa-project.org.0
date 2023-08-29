Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB33378CC2D
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:33:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73D50EE0;
	Tue, 29 Aug 2023 20:33:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73D50EE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693334038;
	bh=duoGDGk6A5kn6sBZFNSUYn6XdEXlKsgAxyDBlthI/p8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FCGp04kQBfOUG8+JH11ysk1IGCX18IdVgTEAP5yHYzYNt75ROfX3mVQL0vs+BGp1I
	 XoKQr2u0QuF1QSpb8aoqW7ithXPXYdPQCteR1PFVdTwmjEUYdDibKA92HMEnRN4+UK
	 QfcHwDAT0AOImyqrZMqa22jRN9tTzNoQcbJyQL18=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 564EFF80580; Tue, 29 Aug 2023 20:28:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E28EF80579;
	Tue, 29 Aug 2023 20:28:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C6EBF80158; Tue, 29 Aug 2023 19:18:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56C37F80551
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:17:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56C37F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=mh8CjGx2
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-977e0fbd742so599061766b.2
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693329472; x=1693934272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkvURmq2cbKlpQEevUHV3n2DL6VzUfl6w6/QUHqY58A=;
        b=mh8CjGx2AHkgqd0uSoIKqeT9Tx6k2Ul0GOWg1kjbkiddzhSqVBM1nD4aYXZydED6H+
         kWK+uS1baw/rCdfglAdVxz+J7v7YlDKV0ueFoYNvYQZ/07I8e34HSGQRfE5Pn4X9nzZp
         IG/sINaLFwKvTfuxWfyfmNaQNcQ/tiVUFJdycaBVaRRyoOlUB0nbZpFAkDUwkmUAprwH
         kdBDs78wbMXS2p6rqK+rwKDETklEowDB0LPP6XtEtCx5sTvze9IlfS2B9HFExdu2ZDQz
         aE2Wba9Fb0V5phmR9SwmII3cBtdclPmYCGSX+M0CWij4M4ICfmFqNvoGeH+pWTWKGM5P
         kyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329472; x=1693934272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xkvURmq2cbKlpQEevUHV3n2DL6VzUfl6w6/QUHqY58A=;
        b=AHGK31LKFHfhoNidJyYfvPNv3Xo3snRo/ViS2mHyRzENp5jftuHvBhagGYxEo/WTiu
         zCV7MdqdCq2LaookfSVxeuTgGo+9JmeYqaU/7cPRQo/16KLJQFPizzscT8jZJKxFonxm
         ZaXaadnJSYpeudS8AlZJCFfMe6EuSWh/Z8xIeXJTg1q1HM6JwFnLzR2O8z6arr/gotgQ
         gAV23lZ6rw4fiHuiNtdQ5rdeM7/j90ZLANdFdH/v96OG3RETDZGHgIo2ec54H1nRclOj
         /xNw2ip7KsJDHtJWWFl3e1QHSyNfcO1XLykxVWIBvURfRALZWiO4n9T65LLLiXWC9bcX
         EWpQ==
X-Gm-Message-State: AOJu0YxOnNRZxQsk6jEbdC7cUA1KSQnqWVCNdpdecAU+K7FxaD8J67UR
	a2veKAPnGMvxglTfZ0kuMQ==
X-Google-Smtp-Source: 
 AGHT+IF8xlfihuxSv7bVK1cLtxo53LQXa5+OykLNbJpUofa4RUl/ax3u6GyAuJkTQpRKAMBEGM1X+Q==
X-Received: by 2002:a17:906:220f:b0:9a5:aece:13b0 with SMTP id
 s15-20020a170906220f00b009a5aece13b0mr5390216ejs.36.1693329472292;
        Tue, 29 Aug 2023 10:17:52 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:17:51 -0700 (PDT)
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
Subject: [PATCH 28/31] ARM: dts: rockchip: Add USB host clocks for RK312x
Date: Tue, 29 Aug 2023 19:16:44 +0200
Message-ID: <20230829171647.187787-29-knaerzche@gmail.com>
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
Message-ID-Hash: 6NNIG5D22HQHENPMO3QHSZOQZONEQFI5
X-Message-ID-Hash: 6NNIG5D22HQHENPMO3QHSZOQZONEQFI5
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:28:45 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6NNIG5D22HQHENPMO3QHSZOQZONEQFI5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the AHB clocks for both the ehci and ohci controller.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk312x.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk312x.dtsi b/arch/arm/boot/dts/rockchip/rk312x.dtsi
index 019aa92c0cfa..b13957d55500 100644
--- a/arch/arm/boot/dts/rockchip/rk312x.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk312x.dtsi
@@ -292,6 +292,7 @@ usb_host_ehci: usb@101c0000 {
 		compatible = "generic-ehci";
 		reg = <0x101c0000 0x20000>;
 		interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_HOST2>;
 		phys = <&usb2phy_host>;
 		phy-names = "usb";
 		status = "disabled";
@@ -301,6 +302,7 @@ usb_host_ohci: usb@101e0000 {
 		compatible = "generic-ohci";
 		reg = <0x101e0000 0x20000>;
 		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_HOST2>;
 		phys = <&usb2phy_host>;
 		phy-names = "usb";
 		status = "disabled";
-- 
2.42.0

