Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE0C78CC2B
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:33:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E425EED7;
	Tue, 29 Aug 2023 20:32:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E425EED7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693334021;
	bh=KnYTnt78eqzwawHSULbXoIXZ+12LrLpdcO0JSsGjv2s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k7H6+49lZ6R3K5PjnEcujXHI0d12rdehZnl2UMFZ0RY9tIF96+WWOUQwJZx+Aaqfl
	 rnhxFVn5u7sDsiOdk6MOMx+wqNCVgFXiCrhK1H76NBQmWSuAJILmdocWgvO5Hpth8d
	 RqHRUCAvsySi9StYjhgIDDQIy+RDtWI/xLOCDigs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 570ABF80549; Tue, 29 Aug 2023 20:28:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C303F80536;
	Tue, 29 Aug 2023 20:28:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A64F1F80236; Tue, 29 Aug 2023 19:18:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5471F800D1
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:17:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5471F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=EShIb7E+
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2bb9a063f26so71448781fa.2
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693329471; x=1693934271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4PHXGicMxBk+MJKalmg1iNAvJdEv1pEopykpBO9nUE=;
        b=EShIb7E+Z3Us6tkTRIUmptYNcn1c25vEpCspbQxGLoL+VKjAo/XzXV/t/I+jrto2Lx
         gVt5UeRIM1WKSIll76L1JN3B79kBVT0lfFGsZnECJ+uNIBuxz1f7TJblkBfZMrSiQIGT
         /0z+a+iJBak/4doNX0w1w3AVduVoXz63YzJV0i4k16xgEWkLoxvOSrJX0wFxYJv9WUY1
         Rjb/7WG9lvaXaAj6RvmuX6qBaDS2uP3leouUnNxofbkxuT0zXGRF2JJDC72nriYF029x
         j27ZDobOtTmUm6vnZjKJWnpQrz5BBImekLEhx/6psHKvowGH9bJ2vhLR1YW4bkq4R6lN
         XaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329471; x=1693934271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4PHXGicMxBk+MJKalmg1iNAvJdEv1pEopykpBO9nUE=;
        b=ahtjIXsOBP4LID2RyjM8j15vbsbB12rNfDdjU4SORkdqqxb/AhdMPUbktOPYoGEp7i
         PhD1jzVOafLo/YW2mgYc2nDX/t5XJi1iAUgGewcLhV6QjVUbPpK5yoPSSN0nwU0SzMT0
         Pv53zPr7UOZBQ08r7cBKpJAu9R4eGV27+Po1qdEqGGy0f5di9X4cC66+/NGUwIazQXRg
         nFgU9zmHDhYrObN9iU669VLxsEbA2L8K+wjPjY+GSfOywuJnXtbrH1xbae9Y8H3FyGJy
         zFsaYqBt/ydBB0e3FxJLwmqP3m/giiwQafrDAc1ICPYD4ED5JH0azSXzw31f0VqAB+rR
         P5cg==
X-Gm-Message-State: AOJu0YyQwEN5k2C1vq/6bmIYW+aCE4pJU3ekdpnnQUOV0xBV8I+e/x6i
	krgk2zoPVxZ6/k6B+A1tig==
X-Google-Smtp-Source: 
 AGHT+IEQB3R89Y565RxZaGfUe+xAj9rNo4DRqqtlbGvy1GBw6QhT8IIxT0/e3EW2cHJ2YckOECQ8ww==
X-Received: by 2002:a2e:9084:0:b0:2b9:f007:9910 with SMTP id
 l4-20020a2e9084000000b002b9f0079910mr20989559ljg.53.1693329471278;
        Tue, 29 Aug 2023 10:17:51 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:17:50 -0700 (PDT)
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
Subject: [PATCH 27/31] ARM: dts: rockchip: Add dwc2 otg fifo siztes for RK312x
Date: Tue, 29 Aug 2023 19:16:43 +0200
Message-ID: <20230829171647.187787-28-knaerzche@gmail.com>
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
Message-ID-Hash: QWI2DOQOO2654A5CJC2RYAG27QZWR3JD
X-Message-ID-Hash: QWI2DOQOO2654A5CJC2RYAG27QZWR3JD
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:28:45 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QWI2DOQOO2654A5CJC2RYAG27QZWR3JD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver currently won't probe correctly if those values are missing.
They have been taken from dowstream kernel and match those of other
Rockchip SoCs.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk312x.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk312x.dtsi b/arch/arm/boot/dts/rockchip/rk312x.dtsi
index ce3f03c3532e..019aa92c0cfa 100644
--- a/arch/arm/boot/dts/rockchip/rk312x.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk312x.dtsi
@@ -280,6 +280,9 @@ usb_otg: usb@10180000 {
 		clocks = <&cru HCLK_OTG>;
 		clock-names = "otg";
 		dr_mode = "otg";
+		g-np-tx-fifo-size = <16>;
+		g-rx-fifo-size = <280>;
+		g-tx-fifo-size = <256 128 128 64 32 16>;
 		phys = <&usb2phy_otg>;
 		phy-names = "usb2-phy";
 		status = "disabled";
-- 
2.42.0

