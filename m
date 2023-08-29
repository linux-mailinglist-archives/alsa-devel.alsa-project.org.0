Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A010A78CC2E
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:34:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FFC8EED;
	Tue, 29 Aug 2023 20:33:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FFC8EED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693334054;
	bh=aAh7pggrGx+rydU21jItTEyR2u8v2NW6KzkIdm8ThbU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RKtE1HaGgGFj/OsRrhUQC/dke6ItgmGa+7mWCFCGPEQhFDBIIF1rjxX0qAJqeJQP2
	 ITkIzqgGcDWQmIIAZJ/OOs29d/e3XVL+93JIhvdOUwwZ70ag2c0tAskYdCMGk/6Bm/
	 rTK7hRnf/ZyysomrnOVU5jobBmx2GO4jeQ1j+O5I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 717DDF805AC; Tue, 29 Aug 2023 20:28:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE966F805A0;
	Tue, 29 Aug 2023 20:28:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DD6CF80155; Tue, 29 Aug 2023 19:18:26 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id F0179F80564
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:17:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0179F80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=DYqQwQyT
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-99bcc0adab4so614147666b.2
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693329474; x=1693934274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWLxgtqau2yJo36SsneTQsDsVw22iqHp96edYBnf0k4=;
        b=DYqQwQyTYCKikxyb60b1L/cidyYBoJlyYx7DxCxp/DB+czy+oU22765aVqWMq9gChN
         hzGEHV6Ukz3+gA74rYbufEwC2om/X8PtXxXA3N4xznw7V3cK6OUceS64tiUtUh4lQPuZ
         qvxPqnf3hK4BA3whTsYfsEi6LxYF3o5Zmt46/Dv4v/PQEoWAF/mUpr/tVxZ7VVCfDarZ
         mLrYEkTYyOAS4e9Z4fXdLaY72iT9bCF1mJiIdDpUW5Iw6c1lmIe3+MiIWrm9ATp5bMj7
         ZuPqabLS7qMEYqkgArtWxlTFln3aqUH+fMUcDuldrO9akccaSGMeHmH6Nx3uouf7wLBI
         xCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329474; x=1693934274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWLxgtqau2yJo36SsneTQsDsVw22iqHp96edYBnf0k4=;
        b=hsUEYT402PVXXWTFiRlVafN/rinxQkENJtMHjIQwVIs7xLlwqU6gJ6H8qvI+JDV7rK
         3C0WucYvk7z2Qs8dlSAIjetE9uCrmc9/IQSacvP1Qz8vFmzKZynCrbBlLN80MwcVXBQR
         r1MwtiQ0mo4tVVzToPycR3vG3H+0pCOi7iON2WVqnddMGJLOcWLqglP1GXYKPrJTPDzj
         49utr8rw2JUJLluTRq+QdEM2PIourWPQKrRkEOCotQPruXI1HNIzse7QUNcQOj7ig3zj
         PvBtydoPJ7Y703YM0bETp2e7Z6i3Vg1bph2vfeap6EFiiwTu1sjzK31ayV2E6FrfKFGe
         ullA==
X-Gm-Message-State: AOJu0YxbceGFAlut7RR8EEINEATXT2d++AzSYedPWthDK3Os7XOw7kIY
	gYpUvUIZBxExhd05R2eDKQ==
X-Google-Smtp-Source: 
 AGHT+IHXNp8WBS05GZKX2uNVCiNbXcRpufiupVelX14WxEIUnMHV/eQymrQIzu4L1T4F5np5oSoR4g==
X-Received: by 2002:a17:906:13:b0:9a2:19ea:88fc with SMTP id
 19-20020a170906001300b009a219ea88fcmr13209839eja.71.1693329474462;
        Tue, 29 Aug 2023 10:17:54 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:17:53 -0700 (PDT)
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
Subject: [PATCH 30/31] ARM: dts: rockchip: Add sdmmc_det pinctrl for RK312x
Date: Tue, 29 Aug 2023 19:16:46 +0200
Message-ID: <20230829171647.187787-31-knaerzche@gmail.com>
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
Message-ID-Hash: JFRXNRCY3QDRCHJ7FGQY7XQU5JEXHTGW
X-Message-ID-Hash: JFRXNRCY3QDRCHJ7FGQY7XQU5JEXHTGW
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:28:45 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JFRXNRCY3QDRCHJ7FGQY7XQU5JEXHTGW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The pincontrol for sd card detection is currently missing.
Add it.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk312x.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk312x.dtsi b/arch/arm/boot/dts/rockchip/rk312x.dtsi
index 19bd6448d122..5388264b54f6 100644
--- a/arch/arm/boot/dts/rockchip/rk312x.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk312x.dtsi
@@ -969,6 +969,10 @@ sdmmc_cmd: sdmmc-cmd {
 				rockchip,pins = <1 RK_PB7 1 &pcfg_pull_default>;
 			};
 
+			sdmmc_det: sdmmc-det {
+				rockchip,pins = <1 RK_PC1 1 &pcfg_pull_default>;
+			};
+
 			sdmmc_wp: sdmmc-wp {
 				rockchip,pins = <1 RK_PA7 1 &pcfg_pull_default>;
 			};
-- 
2.42.0

