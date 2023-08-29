Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E90C678CC20
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:31:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BEBDE94;
	Tue, 29 Aug 2023 20:30:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BEBDE94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693333908;
	bh=0vOU1IgcFe8Og6+ZqxV0Y5ato78E34OtVIoeR22YyZw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AWEHZ6LGBYdqQVEj3cbmfHEaUW0HsHerCrnfsS61tVFV9MLF+UzO47i/wacZd8t+1
	 S9LtdAYvVHYeaKC+oEcFMZrKRBpjYflN6gO72RCkBDNjtEdqcFDCCwVG3TW9OSP/w/
	 tVBe9lFcAZyZAUlXTlE2O3KDNxhl/tCQUNe5EM8M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D6F2F80636; Tue, 29 Aug 2023 20:26:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AFE2F80636;
	Tue, 29 Aug 2023 20:26:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3472F80236; Tue, 29 Aug 2023 19:18:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B3D4F8055B
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:17:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B3D4F8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=h4PyqX0x
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2bd0bc8b429so40710671fa.2
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693329462; x=1693934262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feXb8mBBSxHC2Wg38x6bXprPMxa/iS7sxw36h6E5GW8=;
        b=h4PyqX0xtB7S2T6VFiGduqml3wx0qswAzQccLxwPFbM0Qk7fnZ8sK0BmODYagHvSJg
         dN0Gkz34UcQ5dALUAS7qkreaFpaJH1/HqwEkvHL6nhuwbhwsUlvgNhtu0JWR/t+byarI
         jO/zOGwOmY8ILY7Yn5zt8RSPxT4JW03j5Tykw5RFZbIchdbUVag5NZphZtJVw8SKgyXA
         StVAmKygz3dt8cdzSI8lWcVBevQXPpttS6lu7dJtB3bq4a2IVYMqqSDw4EMZGzaYGz8o
         MWk29pok/xzUj/XYqYYzaN6bwBumz3ddYzcgcpDsm6KdIhLN5lyBSD70ZFbaayj7BLKq
         o/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329462; x=1693934262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=feXb8mBBSxHC2Wg38x6bXprPMxa/iS7sxw36h6E5GW8=;
        b=Af6zcRWPNDHwkBbyB4asqRNRuD/RGlDR61gZ/KzlCOKa851VouKs3ROock4F/yx07V
         rklPxHfEWvur26k6+7klrBRWMe9T7NL8OuOCjigUGMRJNZjfoM38nm8Ptex8IH6O6Lpq
         NL12aO54sXu8OgCZKZk0VaqRUdY0LFkKEshuVk3R8DGpzsMEuAZnBuPfeBLdTt25HVka
         S8uVVy2HmpKwqrx/JsyRVyZGhaEqVwbghtqp3wOPP37LVU0GAjFuL/cUXOzmsunDJyhp
         pOOpbrqG6MOqqLfk0XVrhW2Y52b+cDHIt3jBrEAtpLyRLfGUaSiLHBY3cXVBcqLfPox+
         IueA==
X-Gm-Message-State: AOJu0Yx4VKMrSyh6dtwFSCIvjzc2Efy8yLBfCGiVYPbIIzAjbqtgmFtY
	Bf6oMVDxUplD0LOYZ3AgQA==
X-Google-Smtp-Source: 
 AGHT+IGy6ebumFaH6aO1ynQk+aNb6IThAySOcLcWyoeDCRfh26m8xsK1Szz112EbWkaHyFlntA3M6Q==
X-Received: by 2002:a2e:9cd8:0:b0:2bb:bdf0:caf2 with SMTP id
 g24-20020a2e9cd8000000b002bbbdf0caf2mr20698676ljj.25.1693329462298;
        Tue, 29 Aug 2023 10:17:42 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:17:41 -0700 (PDT)
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
Subject: [PATCH 18/31] ARM: dts: rockchip: Enable SMP bringup for RK312x
Date: Tue, 29 Aug 2023 19:16:34 +0200
Message-ID: <20230829171647.187787-19-knaerzche@gmail.com>
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
Message-ID-Hash: SHQ2HIOMOYBHG3NJN73KZZDLQXDMEIPJ
X-Message-ID-Hash: SHQ2HIOMOYBHG3NJN73KZZDLQXDMEIPJ
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:26:44 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SHQ2HIOMOYBHG3NJN73KZZDLQXDMEIPJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For bringup of the non-boot cpu cores the enable-method for RK3036 can be
re-used.

This adds a (small) chunk  of SRAM for execution of the SMP trampoline code
and the respective enable-method property to the cpus.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk312x.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk312x.dtsi b/arch/arm/boot/dts/rockchip/rk312x.dtsi
index b195ac525c37..08b953b005ff 100644
--- a/arch/arm/boot/dts/rockchip/rk312x.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk312x.dtsi
@@ -27,6 +27,7 @@ arm-pmu {
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		enable-method = "rockchip,rk3036-smp";
 
 		cpu0: cpu@f00 {
 			device_type = "cpu";
@@ -87,6 +88,11 @@ imem: sram@10080000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x10080000 0x2000>;
+
+		smp-sram@0 {
+			compatible = "rockchip,rk3066-smp-sram";
+			reg = <0x00 0x10>;
+		};
 	};
 
 	pmu: syscon@100a0000 {
-- 
2.42.0

