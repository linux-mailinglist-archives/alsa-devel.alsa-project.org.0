Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B36D78CC09
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:28:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A66D7DF0;
	Tue, 29 Aug 2023 20:27:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A66D7DF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693333704;
	bh=5f+SC8RRRtNEEIePN/yC7F7Xm4qa2T6DxX037VbDsDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lO+EHn9ivCsy1a2+cdUNH7ce2oDHLCQ+IXUiFD4nAFSdEBWireSBM16aK2O8X/vSB
	 Z7yV9n3XmiC7lIXiHZGzdO2NXN1aAw0snO8BsNnSwsAgYgPp1zoFYi1raB9UswWl4A
	 AKGQDkvG7CC4UBPmhb5VxuOk3l6aDXzubmOKdHp4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 718CEF805AA; Tue, 29 Aug 2023 20:26:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2551F805A8;
	Tue, 29 Aug 2023 20:26:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61560F80527; Tue, 29 Aug 2023 19:17:41 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E2D5AF80236
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:17:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2D5AF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=bZLW+p0z
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-99c3d3c3db9so598948966b.3
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693329450; x=1693934250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfzC+/2ZWaml8G5FoMVqEV7cfUPth65LiMOYJOwJeN0=;
        b=bZLW+p0zlfsLlVcBzVygKS55P0IRebfmfiqzvn+vw5Svt3aaCxEmAf/zNj4HxrSb3q
         CHnOvzQ8j2IRQp89lqASBmTMaDuVAlOqF67lYkaX0qkNbvZhD+R3bJntKXa78jgmITAm
         2DrvIUbAK8VifA3j4MPRrKZMMfmGgMhoQhZgwJDu4rLZXqE1lFOhDFB8kOHL3DWwlndP
         pjs//iT2Q/1C+vivTrj4iPoL6TyQVWojgwxQvJQTyBhgSgxY8mn3U4y6sfBl+JArMVty
         RsUGpKZBYW4fV4MlYjswm92/89GXO5MLr57K3JCxIoAiZqRuS/0xNbUN+CXSFTQEoqz+
         IPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329450; x=1693934250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bfzC+/2ZWaml8G5FoMVqEV7cfUPth65LiMOYJOwJeN0=;
        b=i40BNXkWPlXscfEt9Uf+G1s98tUnxz6bMtg66Z4TBXlonWMZyYvfcdB2/yskhN0x3F
         YBhgQfsGf4NMBcPxIOWYIZCU8U6SRtt2y48q+aKQ3I9I4tORN1wzwKh8jkj/UuPCWwGL
         OjK5GR46nyC/uRtIl9Agct39QijVd925UiYZvhGBSY1cjlmYVupfZT6oKuubhbRdh0fa
         w5Pxstex16h7/b1UGxEIVeMVMKnZmkpMNaqXRm8OBmGBlrkURk0FEc/edPjffX5nPiCO
         kXVicSkVk1f6bFoDzp+oymnqqYiGzSKSylRMBcdxYCbjwuZK98hSFgcwbkM7RKDwMXCn
         0MBg==
X-Gm-Message-State: AOJu0Yx9vSZmmXUb0OEnJ81auxHo2Jn6fPOvYmnvue/sJuhr3JQhGFgJ
	XUgOXeGK1DWwypHhTUMYQA==
X-Google-Smtp-Source: 
 AGHT+IHd4qS1gu6W8/rBDv9L8vXPbe681EHcWWDTg19iW5zGN1XHAmvdeOISpan8OWf8b/vW0vdbkg==
X-Received: by 2002:a17:907:2e02:b0:9a1:f81f:d0d5 with SMTP id
 ig2-20020a1709072e0200b009a1f81fd0d5mr12345626ejc.54.1693329450187;
        Tue, 29 Aug 2023 10:17:30 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:17:29 -0700 (PDT)
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
	Finley Xiao <finley.xiao@rock-chips.com>,
	Alex Bee <knaerzche@gmail.com>
Subject: [PATCH 06/31] clk: rockchip: rk3128: Fix hclk_otg gate
Date: Tue, 29 Aug 2023 19:16:22 +0200
Message-ID: <20230829171647.187787-7-knaerzche@gmail.com>
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
Message-ID-Hash: ZXHDCVPDCORDPWRBSPKK7YGO5I6DXGVM
X-Message-ID-Hash: ZXHDCVPDCORDPWRBSPKK7YGO5I6DXGVM
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:26:09 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZXHDCVPDCORDPWRBSPKK7YGO5I6DXGVM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Finley Xiao <finley.xiao@rock-chips.com>

HCLK_OTG gate is located in CRU_CLKGATE5_CON, not in CRU_CLKGATE3_CON.
CRU_CLKGATE3_CON bit 13 is already (correctly) defined for ACLK_GPU.

Fixes: f6022e88faca ("clk: rockchip: add clock controller for rk3128")
Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
[added commit message]
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 drivers/clk/rockchip/clk-rk3128.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3128.c b/drivers/clk/rockchip/clk-rk3128.c
index fcacfe758829..17bacf6dd6e7 100644
--- a/drivers/clk/rockchip/clk-rk3128.c
+++ b/drivers/clk/rockchip/clk-rk3128.c
@@ -484,7 +484,7 @@ static struct rockchip_clk_branch common_clk_branches[] __initdata = {
 	GATE(HCLK_I2S_2CH, "hclk_i2s_2ch", "hclk_peri", 0, RK2928_CLKGATE_CON(7), 2, GFLAGS),
 	GATE(0, "hclk_usb_peri", "hclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(9), 13, GFLAGS),
 	GATE(HCLK_HOST2, "hclk_host2", "hclk_peri", 0, RK2928_CLKGATE_CON(7), 3, GFLAGS),
-	GATE(HCLK_OTG, "hclk_otg", "hclk_peri", 0, RK2928_CLKGATE_CON(3), 13, GFLAGS),
+	GATE(HCLK_OTG, "hclk_otg", "hclk_peri", 0, RK2928_CLKGATE_CON(5), 13, GFLAGS),
 	GATE(0, "hclk_peri_ahb", "hclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(9), 14, GFLAGS),
 	GATE(HCLK_SPDIF, "hclk_spdif", "hclk_peri", 0, RK2928_CLKGATE_CON(10), 9, GFLAGS),
 	GATE(HCLK_TSP, "hclk_tsp", "hclk_peri", 0, RK2928_CLKGATE_CON(10), 12, GFLAGS),
-- 
2.42.0

