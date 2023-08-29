Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1484E78CC15
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:30:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7D89E0F;
	Tue, 29 Aug 2023 20:29:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7D89E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693333819;
	bh=Tbf0gKpykxaVUMSFkLh0DrulITyA4pp4gbSQiOkpNrU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rJMDWNmPyuG0nWAw2Wu2vC7ybm0Ci+c1Df7uGCjuyyqCzyxb2ODPMLtpdUoSCYF1+
	 S2BeAj2U/G4aAP0IvmUUVksDxsAtxA0jooKAp7J5GeAUyAYSqzJdx6YuXVjziDLCqb
	 iopMPdStagXHMQ1Yotg9qC6g5Y5Xb6kIE3APLQx4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DA53F805FA; Tue, 29 Aug 2023 20:26:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88A54F805F5;
	Tue, 29 Aug 2023 20:26:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90947F80549; Tue, 29 Aug 2023 19:17:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61026F8055A
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:17:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61026F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=CojAhc33
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-99cdb0fd093so612662966b.1
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693329461; x=1693934261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilnrPdFJtUf7kFovTN/fYGCIN4J3UZgI+cSnZSR/2yQ=;
        b=CojAhc332OPw8G4b1MSX2JQIfQDCWoVAGTFpYoYl0/vT085fGy4ePtubR/tl/ZlsIA
         l0uDDPewODZRXUPwQabgplzdC4JNc4myOQVV6TKtNZzHR/zTCdmDxbWrYTQ913Ug93dE
         Ljr8rF4aJIPgyle1ezaRXAKcCZkTsru1CJ6/LLnQPkaX9LMtCAx5R9bEMXBX7q51ItgT
         0PKjUs7ecYytckB82/OClp4+JYvRuR7KQWln7xSZiha8hHm+Z6Wsm4jgAPRIziHgSxMb
         QrTk4sU11HDveeQ1zL7bqYeR/6WYcSm4kFKKf6s8v0QQbLee2Jbv0SA/0k8j+1waMlo6
         r0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329461; x=1693934261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ilnrPdFJtUf7kFovTN/fYGCIN4J3UZgI+cSnZSR/2yQ=;
        b=Ih5c+tIsQle4JYFQKglD92jrPKVabBYSMnFQNBDTQpUT2Z4vlcs/yLbdhbRMjt10Fl
         0hJomOElhse5p0wuVISBE7lYyhmAivFplUzIb/X45vVFdXI9h3lYIgUzrjw/ea6Vy8pd
         /BDAicZSdhc9cMIIWtJTZt9HFktZ49fvR4lMBAEuNvY95+vyrHmqI5F+bNqm7cUTSuya
         V4v/UZ/LW2a0kvRcIlFCL85ssykHI3JL1FGayFjXb/peX2efm4dokQrqdzM9KtTkfJJC
         PN2S0vd6cYqcMoBtJOPBoFtvThB2NG5n1yj2mGC2ER7AIuM971sDV8wLIxoHSLDItbrR
         YtYQ==
X-Gm-Message-State: AOJu0YybFNuZPjmgZBEUIaAHO6IuJxPukRJ7hgyI0QZWMRuhgXDmVnOn
	tjBpj+ly0Oocqky8V+mzFg==
X-Google-Smtp-Source: 
 AGHT+IFOS5fuKXmCLh8kzU0y1GLYjtXxy7bOhVtFki5w2Fgr+bDQyC2qYgPIiQH2f3gYvZC+LV/EnQ==
X-Received: by 2002:a17:906:3d29:b0:99d:f29b:f2e4 with SMTP id
 l9-20020a1709063d2900b0099df29bf2e4mr21968075ejf.29.1693329461237;
        Tue, 29 Aug 2023 10:17:41 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:17:40 -0700 (PDT)
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
Subject: [PATCH 17/31] ARM: dts: rockchip: Add CPU resets for RK312x
Date: Tue, 29 Aug 2023 19:16:33 +0200
Message-ID: <20230829171647.187787-18-knaerzche@gmail.com>
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
Message-ID-Hash: JNTK6A22TBGZ27EUDSMJNJGVXGFW4P4S
X-Message-ID-Hash: JNTK6A22TBGZ27EUDSMJNJGVXGFW4P4S
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:26:10 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JNTK6A22TBGZ27EUDSMJNJGVXGFW4P4S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the reset controls for all 4 cpu cores.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk312x.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk312x.dtsi b/arch/arm/boot/dts/rockchip/rk312x.dtsi
index 7aba97b2c990..b195ac525c37 100644
--- a/arch/arm/boot/dts/rockchip/rk312x.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk312x.dtsi
@@ -34,6 +34,7 @@ cpu0: cpu@f00 {
 			reg = <0xf00>;
 			clock-latency = <40000>;
 			clocks = <&cru ARMCLK>;
+			resets = <&cru SRST_CORE0>;
 			operating-points = <
 				/* KHz    uV */
 				 816000 1000000
@@ -45,18 +46,21 @@ cpu1: cpu@f01 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0xf01>;
+			resets = <&cru SRST_CORE1>;
 		};
 
 		cpu2: cpu@f02 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0xf02>;
+			resets = <&cru SRST_CORE2>;
 		};
 
 		cpu3: cpu@f03 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0xf03>;
+			resets = <&cru SRST_CORE3>;
 		};
 	};
 
-- 
2.42.0

