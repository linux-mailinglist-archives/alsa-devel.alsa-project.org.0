Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5878578CC13
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:30:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7393DDF8;
	Tue, 29 Aug 2023 20:29:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7393DDF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693333799;
	bh=qBegq1yIuFH+yCyTCL58WFydkD8zZdK8/mXsu67XqqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HqnP5Ynu/Yy+710bNLttfAfAAtkdn8uBURspynM1/6nf9NHAoWiiSAYHrrTeqgUO8
	 NxSfQ1cYS5gNxLPhki8X7lLWGl3RQbilP3oKMBPMVeF3wqo736sCMm2gk9vpbHZwjU
	 lHPrczvY45+Q4Ouh4/eW7YAJz3pgdiVcUpvNxq5Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EB9AF805EA; Tue, 29 Aug 2023 20:26:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 989C4F805E8;
	Tue, 29 Aug 2023 20:26:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FD36F80551; Tue, 29 Aug 2023 19:17:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5FBE6F800D1
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:17:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FBE6F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=s6TtVUA4
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-99bcfe28909so599817166b.3
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693329456; x=1693934256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0OQ0uMxvObgSXiZXc7XOlyouI6S5o18+qbYKi7xXiJU=;
        b=s6TtVUA4v+M9p7voV9EqzvUO+K5WnHhoucMfikXrOctuv0npQViR9s2C9ZYl8QZg3C
         ha9NhlM5TlfZrKtOKhpdHZuZsg6tAfKrWJUjSQ0TzuuO9FJQK++7NdyOLroBXGGnWFI1
         r3HCGu0t7PYsICfeek6yu93Oic3IKLo3RLzu0aEoV/jip2b+Q/gs2wdc5nvo1NIY/WTq
         5M1n6EdqA3HneC+0V4wldGuWurwlrST09o5836u/s61IX3BEGDbeZj9iMssE8vLrN8tF
         nc1i8u/7WNu8cTuShuhNVGz7xRw3j8scGML0r67kSDE2DNOGjY4nUEdUcuisLn+oEiyv
         v/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329456; x=1693934256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0OQ0uMxvObgSXiZXc7XOlyouI6S5o18+qbYKi7xXiJU=;
        b=Ftv2eygXuPyG+LIbzVCm0QhmA0dsmsWvO+dJ0W6YC6hbT95BYxvN3Et61EfQVykvkg
         suXRU+F97DFo60XKiWDEUxr8bd3YmZNTmp9CkMRWDy+LAAijD8vgU1leBp930MJo2nrb
         qOYyQlDWGsS1KVZyXNTdGgubCosCI4tUKB2MsWKJ1yKeYXnS51ljeW5ObsqqTvjKOEK8
         ppiQpGHDdqcoU+hL+zCsZcq/XGTd/6ViCM1aj5qFO2LL//qHunS2LnbWhcj4n79cM9bM
         ot5nSL7UHIbUuA9qBfiKvues5OqsxDiI9dC8UZ03f/vBLHWJ1334Q3xnAFd6wWYNjfDd
         c6RA==
X-Gm-Message-State: AOJu0YwXiFBOI95RoR4ecXZTEqZ/IeOT7g3+X1EbtVvs7NX1LbxPDE1J
	zlJ7GTumEIWWfu2CTGcuZw==
X-Google-Smtp-Source: 
 AGHT+IH0+bHTepjEA8hR54kf7EM9Nb5uT+O5JhoqwdO0nyAn5FMjZRDBmEfIMY/Ri8mcEWEggh+wbA==
X-Received: by 2002:a17:906:76d2:b0:9a1:7919:d3d5 with SMTP id
 q18-20020a17090676d200b009a17919d3d5mr21742168ejn.43.1693329456174;
        Tue, 29 Aug 2023 10:17:36 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:17:35 -0700 (PDT)
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
Subject: [PATCH 12/31] ARM: dts: rockchip: Add missing quirk for RK3128's dma
 engine
Date: Tue, 29 Aug 2023 19:16:28 +0200
Message-ID: <20230829171647.187787-13-knaerzche@gmail.com>
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
Message-ID-Hash: UF2UNXCXL4AROZPE552BUUQXFR2KQIPK
X-Message-ID-Hash: UF2UNXCXL4AROZPE552BUUQXFR2KQIPK
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:26:10 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UF2UNXCXL4AROZPE552BUUQXFR2KQIPK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Like most other Rockchip ARM SoCs, the PL330 needs the
arm,pl330-periph-burst quirk in order to work as expected.
Add it.

Fixes: a0201bff6259 ("ARM: dts: rockchip: add rk3128 soc dtsi")
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3128.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/dts/rockchip/rk3128.dtsi
index bf55d4575311..9125bf22e971 100644
--- a/arch/arm/boot/dts/rockchip/rk3128.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3128.dtsi
@@ -459,6 +459,7 @@ pdma: dma-controller@20078000 {
 		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
 		arm,pl330-broken-no-flushp;
+		arm,pl330-periph-burst;
 		clocks = <&cru ACLK_DMAC>;
 		clock-names = "apb_pclk";
 		#dma-cells = <1>;
-- 
2.42.0

