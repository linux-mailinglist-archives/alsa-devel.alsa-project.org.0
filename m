Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD23F78CC26
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:32:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02181EC6;
	Tue, 29 Aug 2023 20:32:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02181EC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693333971;
	bh=jKbKqDCOZM4vYswsi2aFS1H/ecauvesBITvy2Ml40O0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HRm8jRz3QQevduqtAPhRKxSeQg5tyHlrgiVIggOda509Hv3hq8g5MrqoouE9d08dP
	 kp6PDJtbBhXoPGUYKbEQzPWP1sZ90Co1BUda4IANmTA8984Z8DXt1dK/HOaJPbHb8+
	 xNPdIEtmPS0XreihDoZtWkvyzF5orQXa+Zd9Xyvk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1D36F8056F; Tue, 29 Aug 2023 20:27:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55221F80679;
	Tue, 29 Aug 2023 20:27:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91FFBF804F3; Tue, 29 Aug 2023 19:18:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 17066F8032D
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:17:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17066F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=XP1yHF+4
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-99357737980so603872666b.2
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693329467; x=1693934267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBecglGDcBm3dfaewAdojWnpNSqkK3k2Gii0sDddaoQ=;
        b=XP1yHF+4eAQ1aY3Irua4+dW2toI3nREqhZP00I5y08G3PeXlSneut2EIbz1iiUyWwX
         oqwl0IrVqJlXw8D0vWuGDTyrdoLSF6KHTXDXSs31wyV9VuGK6z67UVY/eFMScIvbDQhk
         AWxkHAD+loWSGgfx1VWlfktCTr45eNKchRHG+KW3rJqfn2ABiuXlixsNlfqJH4K8907B
         2EKNWSQDvdUzlI8QOIrwc6gk5do/f2EOzTJFotT0gsVS0O39epzp1vuRXvDvXKa1YeTT
         AMG/Z1T/jQeGfabrDe574rkIXRPRYAaILQZRsmYVFod1hp4cHLYzNWJinQ2hS/f29LhS
         XOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329467; x=1693934267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBecglGDcBm3dfaewAdojWnpNSqkK3k2Gii0sDddaoQ=;
        b=hm0Zvq0z5OOZogcplJ/liAaFSf21iXuxU+ydSz4M8hOSyV7nN90hUz1yXW7S/DN1TA
         dl+hUwqbtGzUUwF0t70y+0MEp2Y1bgSj5H583SV0eB3GjBl5bgZYukTpykZ25uNylmsG
         ZqmGnHbznngHhdk6Dqc8BywbgdJt0Tzlj5ee0qh8IQzPuMKMvCQdD8m3/icKFt4MEP06
         /9CsduDwPqqz9dRWd53uL3E2dyurO32drGan9x5aAXd9vXfvuVLitD0lC3qe3Z3RCAdl
         1RGWiO2eJikS2n8eu8cXx+yqlYIlvVKRuQ/HWeajBt5pBOGXn7zRe5ABuXTMNEJc57+5
         PFuA==
X-Gm-Message-State: AOJu0Yyai4A/IzqsBDqmqsDs5RFjcPwRDqA/6sCbnmY8Y/DqwY0pNV4v
	DYNii0t4bYjgq0ccpkLSJQ==
X-Google-Smtp-Source: 
 AGHT+IGQSIHfyxWScSSaGtZgRmVAcjAeSYpIMFw2Pk7BPF5NMwiuJMreccIL2u+G9vwApRBvVAVtXw==
X-Received: by 2002:a17:906:31d8:b0:9a5:da6c:6518 with SMTP id
 f24-20020a17090631d800b009a5da6c6518mr497191ejf.37.1693329467128;
        Tue, 29 Aug 2023 10:17:47 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:17:46 -0700 (PDT)
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
Subject: [PATCH 23/31] ARM: dts: rockchip: Add 2-channel I2S for RK312x
Date: Tue, 29 Aug 2023 19:16:39 +0200
Message-ID: <20230829171647.187787-24-knaerzche@gmail.com>
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
Message-ID-Hash: BI5YEAERAEKPEEQSVPFT6M2PPAU7A6GF
X-Message-ID-Hash: BI5YEAERAEKPEEQSVPFT6M2PPAU7A6GF
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:26:45 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BI5YEAERAEKPEEQSVPFT6M2PPAU7A6GF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Both RK3126 and RK3128 have a 2-channel I2S IP block.
Add the respective node for it.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk312x.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk312x.dtsi b/arch/arm/boot/dts/rockchip/rk312x.dtsi
index 024d801a9792..ce3f03c3532e 100644
--- a/arch/arm/boot/dts/rockchip/rk312x.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk312x.dtsi
@@ -351,6 +351,22 @@ emmc: mmc@1021c000 {
 		status = "disabled";
 	};
 
+	i2s_2ch: i2s@10220000 {
+		compatible = "rockchip,rk3128-i2s", "rockchip,rk3066-i2s";
+		reg = <0x10220000 0x1000>;
+		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_I2S1>, <&cru HCLK_I2S_2CH>;
+		clock-names = "i2s_clk", "i2s_hclk";
+		dmas = <&pdma 0>, <&pdma 1>;
+		dma-names = "tx", "rx";
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2s_bus>;
+		rockchip,playback-channels = <2>;
+		rockchip,capture-channels = <2>;
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
 	nfc: nand-controller@10500000 {
 		compatible = "rockchip,rk3128-nfc", "rockchip,rk2928-nfc";
 		reg = <0x10500000 0x4000>;
-- 
2.42.0

