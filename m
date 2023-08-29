Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7DE78CC23
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:32:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53C83EB1;
	Tue, 29 Aug 2023 20:31:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53C83EB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693333924;
	bh=rmY+oeCMqBnCbZI1rfD91GosKThSTZkL4pXXEbtMFyc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ClfEkXuUAOXegmaHK5UAuO7shPQnq+LBq0pJ3+NveotLlDzdQCgbcwf1t9ZU6G8ph
	 ql853ftKJK7tceTOdJnPs7qfWbSTTLtJxhnPDH9e3O9WuvqSQg0Q/7x2wiDgoPgYRP
	 82dtXJJJK2RiESdKavYBBvMYJLVu0Xy+70rEy9Xk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3D59F80652; Tue, 29 Aug 2023 20:26:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51A8BF8063D;
	Tue, 29 Aug 2023 20:26:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20C69F80158; Tue, 29 Aug 2023 19:18:17 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 90516F80527
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:17:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90516F80527
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=W/Ba6mCA
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-977e0fbd742so599051466b.2
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693329468; x=1693934268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxQ4tL3N96YVekC9Q3F0L/yW2/LZMHRKh1BzDPVBfDY=;
        b=W/Ba6mCAi3EsvONs3oStI9qe3lO+rjKO8eqd6OeC8WOC74KB45sAbS9gwOsR0+B1ZB
         PwL13BHOhzqel1D0V2oej1RVUSQf5DoDYJYciJbLHJvwSoNC+cFkvwhDSfHRmcPMZII1
         neyUEn6Ja2qOg4YUvTVZ7Qm5OnlDoGd4gaQoZ9OeHUAkmF3iXPTA0HVdbNjvlrlGBGtR
         5eNVr3wvN+laOQRMTLthwwYCoQMvNZkMJW65SUwC9uk1SqiX2ZbtwK00+7SLfSJmr8hY
         cUiUL63YWqF2ZNiaqWzuoT8C5DWWgLL5LEenq3unErWmHO6zR0MxN11SwAIWSEILorFr
         OfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329468; x=1693934268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxQ4tL3N96YVekC9Q3F0L/yW2/LZMHRKh1BzDPVBfDY=;
        b=K3h4hROXidAc0YtphtMdkz6e6Sz2TxQpDJ8bHBp4O45UDmf3cxvLNFkXzNhr+YP/rR
         /+HVeZUED7R4bwSjRStVbrtP3Yt/eU7w50AGQjvb3pLJ+4Z9M2bUg/wHhJJ5jRqf5tKp
         Gf3DaUsGUEsv7WTuN/a/736av/XV7VUmAOq6ekUhozVyPkyu6x21Wa50V+Dz4idfd2et
         1xNlm+WPn0scBmGWb5iVKSZHAgVnmYrm+zXpC+E2Te6gU28J/SO1y/HGA1SnyJP6w3PJ
         kxi5u6K+H44eb7rsGIOjxhTsiVLmAll/jVHaxigWjeNpVN6vQqJP5C5s0Ub513e8HLsq
         81mw==
X-Gm-Message-State: AOJu0Yz9mCjtBTKlCIfM/w9CvgKp6Fh3/wKBmmQw2OaEq12K7xxfKrPe
	VDKpE5S0niwcX6RtoJ3SXA==
X-Google-Smtp-Source: 
 AGHT+IEP+Kiln5uLUvH0vUDxEPIVhi+RtKwR8SCN3T7Y1jAiZqj1OOnREaOOEVkkHwHkpcNqHLAI6A==
X-Received: by 2002:a17:906:18c:b0:9a2:1e03:1571 with SMTP id
 12-20020a170906018c00b009a21e031571mr12264491ejb.15.1693329468081;
        Tue, 29 Aug 2023 10:17:48 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:17:47 -0700 (PDT)
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
Subject: [PATCH 24/31] ARM: dts: rockchip: Add 8-channel I2S for RK3128
Date: Tue, 29 Aug 2023 19:16:40 +0200
Message-ID: <20230829171647.187787-25-knaerzche@gmail.com>
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
Message-ID-Hash: JLHIA3OUBDXXQH5UYNSIWWSLTGJNASVU
X-Message-ID-Hash: JLHIA3OUBDXXQH5UYNSIWWSLTGJNASVU
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:26:45 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JLHIA3OUBDXXQH5UYNSIWWSLTGJNASVU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

RK3128 has a second I2S block with 8 playback channels.
It's internally hard-wired to the HDMI-TX, thus only usable with it.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3128.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/dts/rockchip/rk3128.dtsi
index 4c5c9728179e..2339232ae2d7 100644
--- a/arch/arm/boot/dts/rockchip/rk3128.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3128.dtsi
@@ -7,6 +7,20 @@
 / {
 	compatible = "rockchip,rk3128";
 
+	i2s_8ch: i2s@10200000 {
+		compatible = "rockchip,rk3128-i2s", "rockchip,rk3066-i2s";
+		reg = <0x10200000 0x1000>;
+		interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_I2S0>, <&cru HCLK_I2S_8CH>;
+		clock-names = "i2s_clk", "i2s_hclk";
+		dmas = <&pdma 14>, <&pdma 15>;
+		dma-names = "tx", "rx";
+		rockchip,playback-channels = <8>;
+		rockchip,capture-channels = <2>;
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
 	i2c3: i2c@2005e000 {
 		compatible = "rockchip,rk3128-i2c", "rockchip,rk3288-i2c";
 		reg = <0x2005e000 0x1000>;
-- 
2.42.0

