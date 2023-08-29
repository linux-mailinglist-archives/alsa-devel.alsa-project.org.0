Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE11778CC37
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:35:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3C5DFC2;
	Tue, 29 Aug 2023 20:35:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3C5DFC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693334154;
	bh=aQlwZJ2yBiK5LkqtZCyYhlZxI58psL+yKfI221J8Uaw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rTpAZnfeEyqThfgsJzGCroHN2NVZ9xz4D2cLtGQ6OsZ/NoKMSVgJt2knTndcVdR7Y
	 xwIEhD/nt2njXfhmfkurCejZawq+NOPADxXhy7ucklSL4jcCWts8vRVg9f2dKREY5B
	 Wg01FnwmX7TA4jmm2CYVzfCuio1yVsEu/o3U+jHk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82B0CF805EB; Tue, 29 Aug 2023 20:29:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6278BF805D6;
	Tue, 29 Aug 2023 20:29:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92B47F80155; Tue, 29 Aug 2023 19:18:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E0CAF80249
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:17:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E0CAF80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=rd4R0yJ5
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-99bc9e3cbf1so2533266b.0
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693329451; x=1693934251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFpS6puAfr1Vvk5xVzMQk3TJscyGtiLTY36CCDlYgn4=;
        b=rd4R0yJ5NUtAr7vhhugqHokzMG56l1owqCa+6Uo9jX4+N93yF6mL+9b3ty5yWW1gb8
         45j8dPKZO5qBshEI153JhNmUeVkwS/HYRK/7Ig4EPjMahNhGO8glOHHCmG9M5QsEcjN+
         PZaZpsQ8MjKL4ZNaaYSP5RYuSNPzEVXRRrEQmVppf2asd7xYBwREmY6QDap/IoLNQJhP
         oMwmwhWExypc3amwKJTcTufbASYFqr+zAPb5KG5+Q2fU8+lktFnAMC903v4IiIq4gXK7
         IQK0Qnwn/VY6Xgl3lnbGpqlQKDL6bXiN5avdEyQXwSnICg3ZCR2QLy2/RQ7qAWvLaOxc
         WxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329451; x=1693934251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFpS6puAfr1Vvk5xVzMQk3TJscyGtiLTY36CCDlYgn4=;
        b=IrG+WV+vAsZO2eqxGyTG1GNleA/XRaZEBk7m0LQ0rOCvLK969iDDW4wt2BO118ImmY
         fDZuQhL6xMxm4sZqfduX9qUPuprOJcAMWGASFOJHU8JIhjdzGtjJl6teLevxp7BGJEfN
         R6aAkTD7vCsCQW+cZl+xYUulnA9IOFQ6EWO5zPtptzSFUqTByL6UK2exPzgO9z8d2owN
         OZ9wT+Mcoox5zCrTfZ4TlNgVrNRmy6TvNfo2/J3Cwu0TDBG0Y5QgjtmnPW7B5GMmtdJV
         5t/hO6udEw0zSboVzvrE5d3p7T9NKh81LD8o8d+mM42STCIFF5NGwqlwPVd8ozaGUxhK
         h/Ww==
X-Gm-Message-State: AOJu0YwHwtJrjAig7fvAjYSPgmssO1t5kQBAUYDAbj9ADe/Vp0O8M6Zg
	PlsVe7zN54vaGwtbDOJbBg==
X-Google-Smtp-Source: 
 AGHT+IEybP8U8H/6OMY/edFtzGMriI16g5JEKpV7+P1CM2OUvZ0MmOIK8JNoZk0RoYw/W+BVoa1UJQ==
X-Received: by 2002:a17:906:cc47:b0:9a5:bceb:1cf8 with SMTP id
 mm7-20020a170906cc4700b009a5bceb1cf8mr3568824ejb.3.1693329451153;
        Tue, 29 Aug 2023 10:17:31 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:17:30 -0700 (PDT)
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
Subject: [PATCH 07/31] clk: rockchip: rk3128: Fix SCLK_SDMMC's clock name
Date: Tue, 29 Aug 2023 19:16:23 +0200
Message-ID: <20230829171647.187787-8-knaerzche@gmail.com>
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
Message-ID-Hash: WI52PE2XC4YBONXJJ2K3KZ3ZAO3MEWKO
X-Message-ID-Hash: WI52PE2XC4YBONXJJ2K3KZ3ZAO3MEWKO
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:28:46 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WI52PE2XC4YBONXJJ2K3KZ3ZAO3MEWKO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SCLK_SDMMC is the parent for SCLK_SDMMC_DRV and SCLK_SDMMC_SAMPLE, but
used with the (more) correct name sclk_sdmmc. SD card tuning does currently
fail as the parent can't be found under that name
There is no need to suffix the name with '0' since RK312x SoCs do have a
single sdmmc controller - so rename it to the name which is already used
by it's children.

Fixes: f6022e88faca ("clk: rockchip: add clock controller for rk3128")
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 drivers/clk/rockchip/clk-rk3128.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3128.c b/drivers/clk/rockchip/clk-rk3128.c
index 17bacf6dd6e7..75071e0cd321 100644
--- a/drivers/clk/rockchip/clk-rk3128.c
+++ b/drivers/clk/rockchip/clk-rk3128.c
@@ -310,7 +310,7 @@ static struct rockchip_clk_branch common_clk_branches[] __initdata = {
 	GATE(SCLK_MIPI_24M, "clk_mipi_24m", "xin24m", CLK_IGNORE_UNUSED,
 			RK2928_CLKGATE_CON(2), 15, GFLAGS),
 
-	COMPOSITE(SCLK_SDMMC, "sclk_sdmmc0", mux_mmc_src_p, 0,
+	COMPOSITE(SCLK_SDMMC, "sclk_sdmmc", mux_mmc_src_p, 0,
 			RK2928_CLKSEL_CON(11), 6, 2, MFLAGS, 0, 6, DFLAGS,
 			RK2928_CLKGATE_CON(2), 11, GFLAGS),
 
-- 
2.42.0

