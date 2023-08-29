Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F4878CC12
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:29:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E664893A;
	Tue, 29 Aug 2023 20:28:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E664893A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693333779;
	bh=+e2QP3lCh5bvfFmBZhe7HVPpQbYDCvVJS8ebEmObw20=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AI8Q5PT8VkIQBxvoqTS3s52PIxWn9PEd3UTQmdnaTPy5tHi1uzbKIaC0ETxE9+WXi
	 nZ7NLlExwSaIPTgotg24qx9ALNUcDZmVrBMoMETMmEsrXoeDv0Gr6tGnZ7hpqtoxtt
	 HP3Q8BxKXnHiviKdec9OxCWQ3Wl5w0CAriXqU70g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E563F805E4; Tue, 29 Aug 2023 20:26:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B534BF805D8;
	Tue, 29 Aug 2023 20:26:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDBAAF80551; Tue, 29 Aug 2023 19:17:49 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B426F8032D
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:17:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B426F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=px2WocHw
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-99bfcf4c814so607585666b.0
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693329454; x=1693934254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9DunujICwW+FdyG9ifMFQMXRh/n/3eNMexEB6m+XBc=;
        b=px2WocHwCMwjM675wD1bA1eXGHHv/R0rc7/GX6NGiX/OBlTqMyRnCDGc1uHsgku1sr
         G9rYQKPxprXZVpBGprwZm/C1f5qoDFg7KX5I/JxK4fvDG/kHaDBkBRxeheaI3QKeuZWE
         b50Gkg1HsF/3mn9w/IkH+vaEzdeSdwvdItZaDUy7tTxaZ866AleSX46/6MxQjT3LQ2cV
         UjX9eF48i0xUFo7p0kA7WbqSxQWbgvpfuTM5l8VNPmlDvMkdduEnZHvz3nbv9HkQuSG+
         oVeE+UuxPm3zGhNAUqbsJx77wJbbtm5NJgbuIgPWEmDiRNhO2V29qqX6GcIpTJKMkWbk
         0XkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329454; x=1693934254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R9DunujICwW+FdyG9ifMFQMXRh/n/3eNMexEB6m+XBc=;
        b=IPZZaiy8ZusiNakCFoSTaS+In1T73yHYAa52NMXJLq9VBZXNrGwak/FhWUsgpg+DA4
         En0X5V0aLTUyQ/V+qiUY/3uewQ55I7aSKZNXZ73kbqNsbiVwX79/s7ne8A0ZM5m7MTPq
         aGevotYSkQNWAZkxx9mVDEVOp2azQzNnv68TB7uFTULT59odZXygxE/Jfbpr70q8oeyl
         qjbPLpUqMBeiAQB9vV4pbGtgz3YnBM+/h+8gise87T/EZSJVgG3jbwjfvDan6SpxcvgS
         15Ff3o97up8obt0c/uw9+bnELRup3+MBTIXbI//s+cpCl+HcYxXXLkH4TW2SBYirpP6p
         +Ilw==
X-Gm-Message-State: AOJu0Yz6BuNRFc9/7AHcOZRWKZHJzHJFvopcehDwcVWKpco9ObmgVIej
	BHqmqKx+0IE9sq6hQqvgBA==
X-Google-Smtp-Source: 
 AGHT+IHrpTiL0i8g4E5q2Q0OjRcmwKFC2fgt4+QDBkipBm6SYXUm13m4URpgLyUReqBKRY8pMjjrIg==
X-Received: by 2002:a17:907:2bee:b0:9a1:b950:abab with SMTP id
 gv46-20020a1709072bee00b009a1b950ababmr16022437ejc.32.1693329454190;
        Tue, 29 Aug 2023 10:17:34 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:17:33 -0700 (PDT)
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
Subject: [PATCH 10/31] ARM: dts: rockchip: Fix i2c0 register address for
 RK3128
Date: Tue, 29 Aug 2023 19:16:26 +0200
Message-ID: <20230829171647.187787-11-knaerzche@gmail.com>
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
Message-ID-Hash: KVSECUAUU3UQR3PV7D5XWQDFUYY3C5LE
X-Message-ID-Hash: KVSECUAUU3UQR3PV7D5XWQDFUYY3C5LE
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:26:10 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KVSECUAUU3UQR3PV7D5XWQDFUYY3C5LE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The register address for i2c0 is missing a 0x to mark it as hex.

Fixes: a0201bff6259 ("ARM: dts: rockchip: add rk3128 soc dtsi")
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3128.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/dts/rockchip/rk3128.dtsi
index b63bd4ad3143..2e345097b9bd 100644
--- a/arch/arm/boot/dts/rockchip/rk3128.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3128.dtsi
@@ -426,7 +426,7 @@ saradc: saradc@2006c000 {
 
 	i2c0: i2c@20072000 {
 		compatible = "rockchip,rk3128-i2c", "rockchip,rk3288-i2c";
-		reg = <20072000 0x1000>;
+		reg = <0x20072000 0x1000>;
 		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 		clock-names = "i2c";
 		clocks = <&cru PCLK_I2C0>;
-- 
2.42.0

