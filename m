Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C6078CC25
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:32:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF349E9B;
	Tue, 29 Aug 2023 20:31:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF349E9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693333953;
	bh=VvBGhpVWlzJKHKzyeHgiBmIKDwl9//awG/S/19h4fF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=luIz5/urOBQCLHf+Kn5pbOzi3mgQEwIz/jZcgyYCs8zVhlZ9q8bvlP5ywNnogxNfZ
	 dsoiXZRMKdBH2jOY1giveyIbvCKjWxdaWQ92WNR0yGL86QBS661I9ScmSACNxXTIx1
	 wSr8AnwL4LXGJmqIvtvaTsoexwS27h1/DoE03wcw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4488DF8065B; Tue, 29 Aug 2023 20:27:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CCFD4F80671;
	Tue, 29 Aug 2023 20:27:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1A3EF80236; Tue, 29 Aug 2023 19:18:20 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 422CBF80155
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:17:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 422CBF80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=b27K62CJ
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9a1de3417acso8796666b.0
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693329465; x=1693934265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zVn9A5G3nnJE19BtxVBvWzOtozFqCP+CXHqAAw8DJNQ=;
        b=b27K62CJiQ+fNyDd0kgfJWF+Ca5wj/0wqhnGz119b5cE+nOb+FyBPPaNzRONJSDjrR
         rXcaWzd5feRR339wfkwB3/8yPB39a9T6o/LPn55vwhhLvUcAuZbo2CfwN3zqDEykQ1N0
         DGeOSoCb9It3jKexuc4G4It/gfPj+uz0wiuC+hWp1KcKKgFD9uTysasqB3QgPYfeSZh7
         D+2ayYgDjIVbn2TKN82W4PVwlwzWdFhJgdnkptvrMMDg+GdJyR3smqzdXi/xbuB/ndB+
         kHsbiAR8Qr7fLZxvz2V1RxKNW+CPI7XJAE7qUHApqXmbMyT6mmLKPKSgQrgngQ0MxuLO
         RD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329465; x=1693934265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zVn9A5G3nnJE19BtxVBvWzOtozFqCP+CXHqAAw8DJNQ=;
        b=lFw7Wc+R3KkwQgpKUNWj8AGato6NFJm/zf1TDWGasvaiQpk0Bf71ckeZv0XFnHczpD
         +iYWfWi120AAtxLL5hmS7Xx7P8w4c8KzXXtRXrhHkPIpP6cGiwaYFmYUilsQyIqJvEIU
         NCfJUWHZXgS1C2Xyq8fEyU3JgUGA/Yx4NYEw3Jk+hsOBVPxJIfcBnlQMWyTvGerpad+r
         ADXJRIizVU3tpDzQG2X9gIUrclGdnE6880ANrOvQkVA5h1ZcxtHDeLdUxVKRNlWLtUBv
         IHYqs69Yyn5xSe+JpmQhbbD4ODviiDCqcM8xFJJ8Dd0zPHpQYNKLvbqPKZehhS/mgzE4
         ajBw==
X-Gm-Message-State: AOJu0YwfEwZowX0uHWrSawelR74dGukW8WcdXEcRxC+hTAuV+1GdOhXq
	ti0CfLPIzov/EoQ79RRMQA==
X-Google-Smtp-Source: 
 AGHT+IGVS1awmweidX6xAv3OC62PyPcHpBoI4b0nE82P4GEfIg0etIKXitlAvzG1CNyrO+3Zg0BtZA==
X-Received: by 2002:a17:907:b609:b0:9a1:b144:30f4 with SMTP id
 vl9-20020a170907b60900b009a1b14430f4mr3760583ejc.14.1693329465170;
        Tue, 29 Aug 2023 10:17:45 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:17:44 -0700 (PDT)
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
Subject: [PATCH 21/31] ARM: dts: rockchip: add power controller for RK312x
Date: Tue, 29 Aug 2023 19:16:37 +0200
Message-ID: <20230829171647.187787-22-knaerzche@gmail.com>
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
Message-ID-Hash: QWHVZIUCC6KON3YUR4NWIGGBQVQ4PXL3
X-Message-ID-Hash: QWHVZIUCC6KON3YUR4NWIGGBQVQ4PXL3
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:26:45 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QWHVZIUCC6KON3YUR4NWIGGBQVQ4PXL3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the power controller node and the correspondending qos nodes for
RK312x.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk312x.dtsi | 82 ++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk312x.dtsi b/arch/arm/boot/dts/rockchip/rk312x.dtsi
index 93560c4cd16a..617306a9edf7 100644
--- a/arch/arm/boot/dts/rockchip/rk312x.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk312x.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/power/rk3128-power.h>
 
 / {
 	compatible = "rockchip,rk3128";
@@ -133,6 +134,87 @@ smp-sram@0 {
 	pmu: syscon@100a0000 {
 		compatible = "rockchip,rk3128-pmu", "syscon", "simple-mfd";
 		reg = <0x100a0000 0x1000>;
+
+		power: power-controller {
+			compatible = "rockchip,rk3128-power-controller";
+			#power-domain-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			power-domain@RK3128_PD_VIO {
+				reg = <RK3128_PD_VIO>;
+				clocks = <&cru ACLK_RGA>,
+					 <&cru ACLK_LCDC0>,
+					 <&cru ACLK_IEP>,
+					 <&cru ACLK_CIF>,
+					 <&cru ACLK_VIO0>,
+					 <&cru ACLK_VIO1>,
+					 <&cru DCLK_VOP>,
+					 <&cru DCLK_EBC>,
+					 <&cru HCLK_RGA>,
+					 <&cru HCLK_VIO>,
+					 <&cru HCLK_EBC>,
+					 <&cru HCLK_LCDC0>,
+					 <&cru HCLK_IEP>,
+					 <&cru HCLK_CIF>,
+					 <&cru HCLK_VIO_H2P>,
+					 <&cru PCLK_MIPI>,
+					 <&cru SCLK_VOP>;
+				pm_qos = <&qos_rga>,
+					 <&qos_iep>,
+					 <&qos_lcdc>,
+					 <&qos_vip>;
+				#power-domain-cells = <0>;
+			};
+
+			power-domain@RK3128_PD_VIDEO {
+				reg = <RK3128_PD_VIDEO>;
+				clocks = <&cru ACLK_VEPU>,
+					 <&cru ACLK_VDPU>,
+					 <&cru HCLK_VEPU>,
+					 <&cru HCLK_VDPU>,
+					 <&cru SCLK_HEVC_CORE>;
+				pm_qos = <&qos_vpu>;
+				#power-domain-cells = <0>;
+			};
+
+			power-domain@RK3128_PD_GPU {
+				reg = <RK3128_PD_GPU>;
+				clocks = <&cru ACLK_GPU>;
+				pm_qos = <&qos_gpu>;
+				#power-domain-cells = <0>;
+			};
+		};
+	};
+
+	qos_gpu: qos@1012d000 {
+		compatible = "rockchip,rk3128-qos", "syscon";
+		reg = <0x1012d000 0x20>;
+	};
+
+	qos_vpu: qos@1012e000 {
+		compatible = "rockchip,rk3128-qos", "syscon";
+		reg = <0x1012e000 0x20>;
+	};
+
+	qos_rga: qos@1012f000 {
+		compatible = "rockchip,rk3128-qos", "syscon";
+		reg = <0x1012f000 0x20>;
+	};
+
+	qos_iep: qos@1012f100 {
+		compatible = "rockchip,rk3128-qos", "syscon";
+		reg = <0x1012f100 0x20>;
+	};
+
+	qos_lcdc: qos@1012f180 {
+		compatible = "rockchip,rk3128-qos", "syscon";
+		reg = <0x1012f180 0x20>;
+	};
+
+	qos_vip: qos@1012f200 {
+		compatible = "rockchip,rk3128-qos", "syscon";
+		reg = <0x1012f200 0x20>;
 	};
 
 	gic: interrupt-controller@10139000 {
-- 
2.42.0

