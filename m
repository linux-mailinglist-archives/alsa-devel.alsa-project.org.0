Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2564878CC1F
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:31:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63763EA4;
	Tue, 29 Aug 2023 20:30:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63763EA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693333893;
	bh=hV7R2a/iDhu8URzf1xC7kJk/1JmJDREPVWvPfaXh36M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MyY29mve9jxSrnfKG7e/PCxS+Xlk9uhDBnHzfoN/4PB/pQ3pb8lil0zmD10ImTfuO
	 EPFUQPMw146O6VhsiwnVbrI4ERDo4SbemEs8eP9Y+R/3NqsevP44oFQIMgUiRJTUdw
	 6mx7OHoG2lWUzOKtJjfJmPye8jXPLdyKWj+BxRLI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 114EBF80624; Tue, 29 Aug 2023 20:26:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78389F80624;
	Tue, 29 Aug 2023 20:26:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89A5BF8055A; Tue, 29 Aug 2023 19:18:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 95ADAF804F3
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:17:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95ADAF804F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=N9JLdrwZ
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9936b3d0286so630054666b.0
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693329463; x=1693934263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WnJL5vGCg9h0fxl4SkoWxbvYNcnaANXMeYm5CGs278M=;
        b=N9JLdrwZAq0dUeDJhdp81+fN8VeIO0Za4lbwtH42uBm92k/4rin/At5jq6C6VCFzuO
         dSXTW+vgTl5x177w8ttFILgFZAlILfiKVvRuzS1z4asELiVuC3DYYCdK56ecFfhXCsyd
         TMJJToU0FtApXWJ3U0YLNQv0ynvlUo4zpADs/WWOOxk6gE8E4Ipu6I1bGLe9pTccOEUj
         7XvS8UctPQLlA9g1x7G9W6WX7ZNqYH0Job9qpR5AvtpWnNx8PSFeNHGKSHBmjf6Pg6YW
         IjeAQnYojYVaaKJ9Xb0TJ7NfKlBUu04Z1nTRU6SdpJirzWnObMR9dxl77hx3BRuTkVoP
         C/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329463; x=1693934263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WnJL5vGCg9h0fxl4SkoWxbvYNcnaANXMeYm5CGs278M=;
        b=dGbULfAG3j4eP4el3+xcfWlnPDwP0dc8dSML35YzgnxnIvsaDo0dtiaKttSQFj/MHL
         QveWAgzvctw93vqndmrQQBtnohZ717RrBydCuB3KBuKdsE3XIDZmS4dNataGrrchzObo
         IXqahe0IXpXU59z6GGrtV/JrXfNR04RHJp2GpHcnCUeiZLhkJ2twNFCA3BLWt8tSpeCN
         ovREe9j3TGmu73QstqiMOU0KdGcjA3QEFYpM7K0ySGzqPvgcHedv4BLtEU1qxUYenqFA
         lZj2Fv2XjNLmhRuh0/YCbHuaTqWr68OE0W6KHCfgnPjv+3CpOQwkAdKwzn2GEw5Hgrzi
         W9wQ==
X-Gm-Message-State: AOJu0YwSoo60Q8NNMK4uSP5LTw3KGEANqDBsjgcLbK09GfhXDJVCcQ3c
	uvIScN+VYfw+qNa8oG+jlQ==
X-Google-Smtp-Source: 
 AGHT+IGUtSI+zxI+roO3fQg73Zix5xTmq8cVmyCvEK/LrKo7dzyudGQqYSeW+LtBceKZGkvV/0HzBg==
X-Received: by 2002:a17:906:8a50:b0:9a1:fab3:ee3f with SMTP id
 gx16-20020a1709068a5000b009a1fab3ee3fmr13114131ejc.40.1693329463292;
        Tue, 29 Aug 2023 10:17:43 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:17:42 -0700 (PDT)
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
Subject: [PATCH 19/31] ARM: dts: rockchip: Switch to operating-points-v2 for
 RK312x's CPU
Date: Tue, 29 Aug 2023 19:16:35 +0200
Message-ID: <20230829171647.187787-20-knaerzche@gmail.com>
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
Message-ID-Hash: XRPHR2QQRFACUW2SA6OZTFOOJ6BFOZEZ
X-Message-ID-Hash: XRPHR2QQRFACUW2SA6OZTFOOJ6BFOZEZ
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:26:44 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XRPHR2QQRFACUW2SA6OZTFOOJ6BFOZEZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This will allow frequency-scaling for the cpu cores.
Operating frequencies and voltages have been taken from Rockchip's
downstream kernel.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk312x.dtsi | 43 +++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rk312x.dtsi b/arch/arm/boot/dts/rockchip/rk312x.dtsi
index 08b953b005ff..93560c4cd16a 100644
--- a/arch/arm/boot/dts/rockchip/rk312x.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk312x.dtsi
@@ -36,10 +36,7 @@ cpu0: cpu@f00 {
 			clock-latency = <40000>;
 			clocks = <&cru ARMCLK>;
 			resets = <&cru SRST_CORE0>;
-			operating-points = <
-				/* KHz    uV */
-				 816000 1000000
-			>;
+			operating-points-v2 = <&cpu_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
 		};
 
@@ -48,6 +45,7 @@ cpu1: cpu@f01 {
 			compatible = "arm,cortex-a7";
 			reg = <0xf01>;
 			resets = <&cru SRST_CORE1>;
+			operating-points-v2 = <&cpu_opp_table>;
 		};
 
 		cpu2: cpu@f02 {
@@ -55,6 +53,7 @@ cpu2: cpu@f02 {
 			compatible = "arm,cortex-a7";
 			reg = <0xf02>;
 			resets = <&cru SRST_CORE2>;
+			operating-points-v2 = <&cpu_opp_table>;
 		};
 
 		cpu3: cpu@f03 {
@@ -62,6 +61,42 @@ cpu3: cpu@f03 {
 			compatible = "arm,cortex-a7";
 			reg = <0xf03>;
 			resets = <&cru SRST_CORE3>;
+			operating-points-v2 = <&cpu_opp_table>;
+		};
+	};
+
+	cpu_opp_table: opp-table-0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-216000000 {
+			opp-hz = /bits/ 64 <216000000>;
+			opp-microvolt = <950000 950000 1325000>;
+		};
+		opp-408000000 {
+			opp-hz = /bits/ 64 <408000000>;
+			opp-microvolt = <950000 950000 1325000>;
+		};
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <950000 950000 1325000>;
+		};
+		opp-696000000 {
+			opp-hz = /bits/ 64 <696000000>;
+			opp-microvolt = <975000 975000 1325000>;
+		};
+		opp-816000000 {
+			opp-hz = /bits/ 64 <816000000>;
+			opp-microvolt = <1075000 1075000 1325000>;
+			opp-suspend;
+		};
+		opp-1008000000 {
+			opp-hz = /bits/ 64 <1008000000>;
+			opp-microvolt = <1200000 1200000 1325000>;
+		};
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <1325000 1325000 1325000>;
 		};
 	};
 
-- 
2.42.0

