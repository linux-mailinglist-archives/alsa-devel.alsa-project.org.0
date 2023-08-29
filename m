Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3D578CC27
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:33:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC225EC4;
	Tue, 29 Aug 2023 20:32:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC225EC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693333991;
	bh=Lb+blaRpiLsachho9uty7DU1QLt2yv2wDUjhT2x3xro=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BdEsEw7CQ7u0PMwjN2PGAV3V6U0+tFHrFGSB7RBaEvOzu2D6BDCD3beTrEImYGfPn
	 cRVz20uJjRuBXWKGUZEXTczQRNSy0D7jBuXUPSuBAot0U89E0QIdWIEvGKARB7Vdt6
	 oY7JsMh60/tNIDgK9Dtm/MAzidauf+ZwjRnbFTLU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96760F80683; Tue, 29 Aug 2023 20:27:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2828DF80679;
	Tue, 29 Aug 2023 20:27:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41F8EF8032D; Tue, 29 Aug 2023 19:18:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BEE29F80536
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:17:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEE29F80536
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=lGLyFsRE
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-977e0fbd742so599053866b.2
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693329469; x=1693934269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8bC2y7VdPt+gQZ4niYJX9yvKSEdfcPfq9HIkHksvZpA=;
        b=lGLyFsRElGEyypnxgJ4cyR1W3hhI3uGn2LWWryaunAyjg3zzlBD6lYgb2VqOuweM/f
         jlnz5i7MN9x/62/CizSh/qRJ01spkv2EsJ77tFZut26Fo98bA2BZM9KGCIcqTwcI09/C
         uTwZrqD2OQSi5QVBYAvRbYmwNOGPIZklud3uK6FoPPetpDm3970xygUGihojNpbHYfEm
         OmPprpzEjklTYdU2YsMhAoe8/6MBGrKa1SBgJG8bBNWlV5TmuOEQmp60a1Zx1g0ZOTJ2
         YZ59q4K1hQc1QSLkCN+4hVD9sOyL0gePkGu7LUVrYCVxB6Xnm8pkTBXN6sz2O3cNTiCT
         YdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329469; x=1693934269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8bC2y7VdPt+gQZ4niYJX9yvKSEdfcPfq9HIkHksvZpA=;
        b=TioBTsp4vwpVr5BZBRj9lZZyQHzTBNFHg1Ykweffhg+5NFEMokKVrSZ5wRnVOrb5U4
         MAV2+DgL77M8JtvGi7U/lHY4G5XsQmO4mIGNMTWYIaBeB+rv/N+/K+yVrBo7TPlZrorE
         RU6fy4maCmO9652JPYyx8AmkxDaT7VNmgZVzuweghhvjd0v8K+cWJaeqDYeq0HmDOm8p
         PM+3HbhragkH5c9sKx4HKq/9dRM1f1gRMNoDngJXKq7xvm7A0vTVSejOwZutqF/MmM6h
         e9lkf/oT23Zog1yYlMkvbDjIPYKLmFT9BoWuxhp9S6lcYUKTLhxKQxV1iyK36GLPNHv6
         pFZg==
X-Gm-Message-State: AOJu0YxFP00680hMSDIfsJSeV4azFvKxybAb1t8ooZNMzw+0Lb0xdeT7
	d9MUlPx9JNsBhFWt0tgMOA==
X-Google-Smtp-Source: 
 AGHT+IHmXDVIaV6yhzoHdttsh1bCbntYH5kT5qx7a1c+aLWU6X2nsxuyymCHftiQpUNhOc4FPkF4/w==
X-Received: by 2002:a17:907:b11:b0:9a4:88af:b77 with SMTP id
 h17-20020a1709070b1100b009a488af0b77mr9110577ejl.60.1693329469044;
        Tue, 29 Aug 2023 10:17:49 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:17:48 -0700 (PDT)
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
Subject: [PATCH 25/31] ARM: dts: rockchip: Add spdif for RK3128
Date: Tue, 29 Aug 2023 19:16:41 +0200
Message-ID: <20230829171647.187787-26-knaerzche@gmail.com>
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
Message-ID-Hash: CSKLX6BQAZRLRBEOZVHKAOVURLPFYCMV
X-Message-ID-Hash: CSKLX6BQAZRLRBEOZVHKAOVURLPFYCMV
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:26:45 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CSKLX6BQAZRLRBEOZVHKAOVURLPFYCMV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the S/PDIF block for RK3128 SoC.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3128.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/dts/rockchip/rk3128.dtsi
index 2339232ae2d7..874c97297c63 100644
--- a/arch/arm/boot/dts/rockchip/rk3128.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3128.dtsi
@@ -21,6 +21,20 @@ i2s_8ch: i2s@10200000 {
 		status = "disabled";
 	};
 
+	spdif: spdif@10204000 {
+		compatible = "rockchip,rk3128-spdif", "rockchip,rk3066-spdif";
+		reg = <0x10204000 0x1000>;
+		interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_SPDIF>, <&cru HCLK_SPDIF>;
+		clock-names = "mclk", "hclk";
+		dmas = <&pdma 13>;
+		dma-names = "tx";
+		pinctrl-names = "default";
+		pinctrl-0 = <&spdif_tx>;
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
 	i2c3: i2c@2005e000 {
 		compatible = "rockchip,rk3128-i2c", "rockchip,rk3288-i2c";
 		reg = <0x2005e000 0x1000>;
-- 
2.42.0

