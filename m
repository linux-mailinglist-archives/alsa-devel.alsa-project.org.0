Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FECB78CC28
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:33:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA048E12;
	Tue, 29 Aug 2023 20:32:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA048E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693334002;
	bh=kjC734WsSBlCGosnHWmKIM2ItZl0w4Aq/kKFi5e5tqQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=baVI7WOLGiDqAcjpnmCik6VjIgf+7skh6Je8de2MOF0tOu7Hx0MPkTyNWF3vjHE3W
	 bT3xKO6qwSarrXqamtbyjzGuoOLG2uOOImnsAdi+zewmh1nR8QEpdPFBvimlFPfkad
	 GOswwRPYmXcE8LlyxN0G9Ec/TNAHg2ndYuJcOw1w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B47F0F80690; Tue, 29 Aug 2023 20:27:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80B74F80689;
	Tue, 29 Aug 2023 20:27:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C38FFF80236; Tue, 29 Aug 2023 19:18:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61972F80558
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:17:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61972F80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=GYmvvj1s
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-52a39a1c4d5so6050668a12.3
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693329466; x=1693934266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdMp6yGV0P8L7/q8hhpBp7fZJs0P4HxP+xmd/dBUTF0=;
        b=GYmvvj1sFbTTtXbgXqrMaNH/aVAjfAntStRnN8asGz3V+cm1HEbxj7u/duVBcmdQ7Z
         GNd7XfGs74mOUm0PhC/djA+EPK+tWkvMkKamr+St+za05bKr8bU0eS8swyvP+xes04mz
         ODLNqhrP16gRGQynCESNaYqSdtnbj9UtlI3F9WdnhnJ6kX5vRPnFZ6LCvlHVP4zZ24qo
         jfwQv0P8xQJc/f4YjkAeZ21XnUlwK2+r1Kdm5FJbZvHJ4Kw92VSP4SYL09kbYoJDJHvA
         +4vQ0JzfKeGtMTsrHcFKKviELI0MjPux56ean5Tw6J8K1AiRzuDuLKJ870CbIm0TbhMi
         wjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329466; x=1693934266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cdMp6yGV0P8L7/q8hhpBp7fZJs0P4HxP+xmd/dBUTF0=;
        b=VHRgFxbGNJS4DgeTsCFXMU0vbsb/QXyd5R55FOFNGSuvdWy9GElQcu11PgGHdM2JJY
         5qZ90xEwcVqbkrysOcUi/D/muKjXbrtJ8P8b3CllJvapCIShi9GfWEm/lWZB1D4u5Ig1
         794wIWnwYWgacgz+RWZwcpfk6DSSx6TIpNMmJgLUeA/9iUAFA268lypk0MA9S+lyoepV
         aryDOgxnUX2b5mEknhK4BDpkILOvtTNGFuC75CyyrmMwEdnewbcpSoAddwwV2GHWp5Hv
         znQPN364MbXODZRpESrfROdkBzBQtqk6Y0pcGVmb09tPmYd/ocSfqHjrfISdvFdGvSLb
         bthg==
X-Gm-Message-State: AOJu0YwdAacR+VCLMwLA4KATasSezuDQ6aIaNtjDIn/GFXuXpkVxXpf2
	h3WWXxP8af/TSmyP4tkqYg==
X-Google-Smtp-Source: 
 AGHT+IEIEIVr9GVv8wcpcAh/4P6h2oRMoRbIhTVOy6XqNU2N3y4y6OKPBaGl1PKVnou0mSNTBc9qkA==
X-Received: by 2002:a17:906:cc50:b0:9a2:143e:a062 with SMTP id
 mm16-20020a170906cc5000b009a2143ea062mr11375776ejb.49.1693329466159;
        Tue, 29 Aug 2023 10:17:46 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:17:45 -0700 (PDT)
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
Subject: [PATCH 22/31] ARM: dts: rockchip: Add GPU node for RK312x
Date: Tue, 29 Aug 2023 19:16:38 +0200
Message-ID: <20230829171647.187787-23-knaerzche@gmail.com>
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
Message-ID-Hash: 454RHN7MQBRNVWM6KNDLNSABGX6K5S6C
X-Message-ID-Hash: 454RHN7MQBRNVWM6KNDLNSABGX6K5S6C
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:26:45 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/454RHN7MQBRNVWM6KNDLNSABGX6K5S6C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

RK312x SoCs have Mali400 MP2 GPU.
Add the respective device tree node and the correspondending opp-table.

The frequencies and voltages have been taken from downstream kernel and
work fine for both RK3126 and RK3128.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk312x.dtsi | 44 ++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk312x.dtsi b/arch/arm/boot/dts/rockchip/rk312x.dtsi
index 617306a9edf7..024d801a9792 100644
--- a/arch/arm/boot/dts/rockchip/rk312x.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk312x.dtsi
@@ -101,6 +101,27 @@ opp-1200000000 {
 		};
 	};
 
+	gpu_opp_table: opp-table-1 {
+		compatible = "operating-points-v2";
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <975000 975000 1250000>;
+		};
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <1050000 1050000 1250000>;
+		};
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <1150000 1150000 1250000>;
+		};
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			opp-microvolt = <1250000 1250000 1250000>;
+		};
+	};
+
 	timer {
 		compatible = "arm,armv7-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
@@ -131,6 +152,29 @@ smp-sram@0 {
 		};
 	};
 
+	gpu: gpu@10090000 {
+		compatible = "rockchip,rk3128-mali", "arm,mali-400";
+		reg = <0x10090000 0x10000>;
+		interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "gp",
+				  "gpmmu",
+				  "pp0",
+				  "ppmmu0",
+				  "pp1",
+				  "ppmmu1";
+		clocks = <&cru ACLK_GPU>, <&cru ACLK_GPU>;
+		clock-names = "bus", "core";
+		power-domains = <&power RK3128_PD_GPU>;
+		resets = <&cru SRST_GPU>;
+		operating-points-v2 = <&gpu_opp_table>;
+		status = "disabled";
+	};
+
 	pmu: syscon@100a0000 {
 		compatible = "rockchip,rk3128-pmu", "syscon", "simple-mfd";
 		reg = <0x100a0000 0x1000>;
-- 
2.42.0

