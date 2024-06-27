Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4474C91DF5F
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:34:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81BE32C15;
	Mon,  1 Jul 2024 14:33:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81BE32C15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719837239;
	bh=A5cVVYIXLTtocL+I6NwQej/XBFq/5AxfenJcTvjbKQg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=oCA+7FMytVVH03AmDesaTDpr/JiiOURft8kxb2HnikeKw0gSUNkmVU0JHeXeQNZvN
	 PvVDrUpFVTDOia9HHl02zPNpPwLYXwmBP5R3OIwyYBIM8R2xXpyFDhl0MuHrB6t7ZP
	 Gj1OyG5FaTk7ftbFtzE5+qj3eCAjUpJTnOEWWxgE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81D4AF899B5; Mon,  1 Jul 2024 14:23:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84641F807D0;
	Mon,  1 Jul 2024 14:23:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF0CEF80423; Thu, 27 Jun 2024 17:03:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B72D7F8013D
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 17:03:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B72D7F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=uCi6bRm0
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52cdf2c7454so10358032e87.1
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 08:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719500580;
 x=1720105380; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJvIbWYuYPh2MYk+7zUochFUm6khQh2owZTLDHTohpE=;
        b=uCi6bRm0Xnv3wxfIelke2W/iwV5SCDmxbBB7FOOfw9HhqVfxdZt5u0RY8DZBYp+ony
         cHy+Hqk40Wj4IW42q5cc2f0ds615a9ZM3GUQ/MWODfPQBxe1oIE0KWUuGOql59uSW5OQ
         TGWzfk3RLT4IDE0AXgDJ3OXVPZ6NF6PncvdIH+BFnFvwdyMIdE2WeiMbmzaHdRIKsjur
         JPfH5JQFxpYUbDt7v6vtZa6L/nOvXNPrxdevHqC0FXu8VUlYe/+g2Yfc5/lEU9SD9UP5
         3SMGV65KkbXssk4JOsixSHb/lg4ULd8IjeXp80KWubkiJd0v1dHq1nqt45i1LTdI6SD0
         IiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500580; x=1720105380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJvIbWYuYPh2MYk+7zUochFUm6khQh2owZTLDHTohpE=;
        b=siBwrJHbpuP54OGLMDAozK/AvEGKsCsQoWk64bfQXxml9DZx23NAhkHN+xxqqDPcgE
         7fKn9V9jzLNhoHQPfVRDVe6/sO20AUbY96/HTsRHwTgvrwlOgZrsQ0VRoErPJMEtDxdL
         PsZL/fhbeqpxgTO0lGet8U5St/Tw1OREsaZH1ndeQmmDwGpniXDVzYIjT5buEAJ75Wd/
         G3/vaJzaDNU7G2TIIXpZTera7aW4iKjE2iCxAirzqm8BfIhUDgMSmrsb8KTzxoPIx5gW
         tC5rb+40FySlQ2Xm8T5Gk8IUjkFkOM4tZUGscLG5g647lexqylVI/RxmIxw3EeyCqGFG
         8ZaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNNHH+zd+mj10oBQeznorSdWNYSn1BrYMFEJdBhjnIzMAyz3yC4x8psH02olqw/60kcSPmP1ZJ2HW131Smal5pEJGOb174ffU5gS0=
X-Gm-Message-State: AOJu0YyO+V2UJIkjihH4LoUWprU4YUvNNhLMFEtQayqm2zrxPFjoTIEW
	zz5mmEHc3VDQsV3LuUiGAYvvpdv+8Jk57FWi+tEwjrHqxeYhtvdW5mWtKUPYZVg=
X-Google-Smtp-Source: 
 AGHT+IGZ1++Ks98/Qf/5imxTRRLFDrmwBrTqFEXDtzEcoEhTACvV1BuNeYZAcogKlXox/ewKi1ymKA==
X-Received: by 2002:a19:6455:0:b0:52c:db0e:6c4a with SMTP id
 2adb3069b0e04-52ce182bea2mr10424279e87.2.1719500580105;
        Thu, 27 Jun 2024 08:03:00 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a729d7ca289sm67189066b.222.2024.06.27.08.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:02:59 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangtao Li <frank.li@vivo.com>,
	Li Zetao <lizetao1@huawei.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chancel Liu <chancel.liu@nxp.com>,
	Corentin Labbe <clabbe@baylibre.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [Patch v5 05/12] ARM: dts: lpc32xx: Add missing dma properties
Date: Thu, 27 Jun 2024 17:00:23 +0200
Message-Id: <20240627150046.258795-6-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
References: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: piotr.wojtaszczyk@timesys.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SC3KHN2VRKLFU3MGGXUMC7QFB6TUC2TE
X-Message-ID-Hash: SC3KHN2VRKLFU3MGGXUMC7QFB6TUC2TE
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:23:05 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SC3KHN2VRKLFU3MGGXUMC7QFB6TUC2TE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Adds properties declared in the new DT binding nxp,lpc3220-dmamux.yaml
and corresponding phandles.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v5:
- This patch is new in v5
- Split previous patch for lpc32xx.dtsi in to 3 patches

 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 38 ++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 8bf88d141e5b..6135ce4dde61 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -67,6 +67,8 @@ slc: flash@20020000 {
 			reg = <0x20020000 0x1000>;
 			clocks = <&clk LPC32XX_CLK_SLC>;
 			status = "disabled";
+			dmas = <&dma 1 1>;
+			dma-names = "rx-tx";
 		};
 
 		mlc: flash@200a8000 {
@@ -75,6 +77,8 @@ mlc: flash@200a8000 {
 			interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk LPC32XX_CLK_MLC>;
 			status = "disabled";
+			dmas = <&dma 12 1>;
+			dma-names = "rx-tx";
 		};
 
 		dma: dma@31000000 {
@@ -83,6 +87,13 @@ dma: dma@31000000 {
 			interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk LPC32XX_CLK_DMA>;
 			clock-names = "apb_pclk";
+			#dma-cells = <2>;
+			dma-channels = <8>;
+			dma-requests = <16>;
+			lli-bus-interface-ahb1;
+			mem-bus-interface-ahb1;
+			memcpy-burst-size = <256>;
+			memcpy-bus-width = <32>;
 		};
 
 		usb {
@@ -182,6 +193,8 @@ ssp0: spi@20084000 {
 				clock-names = "apb_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+				dmas = <&dmamux 14 1 1>, <&dmamux 15 1 1>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -191,6 +204,8 @@ spi1: spi@20088000 {
 				clocks = <&clk LPC32XX_CLK_SPI1>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				dmas = <&dmamux 11 1 0>;
+				dma-names = "rx-tx";
 				status = "disabled";
 			};
 
@@ -206,6 +221,8 @@ ssp1: spi@2008c000 {
 				clock-names = "apb_pclk";
 				#address-cells = <1>;
 				#size-cells = <0>;
+				dmas = <&dmamux 3 1 1>, <&dmamux 11 1 1>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -215,12 +232,16 @@ spi2: spi@20090000 {
 				clocks = <&clk LPC32XX_CLK_SPI2>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				dmas = <&dmamux 3 1 0>;
+				dma-names = "rx-tx";
 				status = "disabled";
 			};
 
 			i2s0: i2s@20094000 {
 				compatible = "nxp,lpc3220-i2s";
 				reg = <0x20094000 0x1000>;
+				dmas = <&dma 0 1>, <&dma 13 1>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -231,12 +252,16 @@ sd: sd@20098000 {
 					     <13 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk LPC32XX_CLK_SD>;
 				clock-names = "apb_pclk";
+				dmas = <&dma 4 1>;
+				dma-names = "rx";
 				status = "disabled";
 			};
 
 			i2s1: i2s@2009c000 {
 				compatible = "nxp,lpc3220-i2s";
 				reg = <0x2009c000 0x1000>;
+				dmas = <&dma 2 1>, <&dmamux 10 1 1>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -326,6 +351,13 @@ clk: clock-controller@0 {
 					clocks = <&xtal_32k>, <&xtal>;
 					clock-names = "xtal_32k", "xtal";
 				};
+
+				dmamux: dma-router@7c {
+					compatible = "nxp,lpc3220-dmamux";
+					reg = <0x7c 0x8>;
+					#dma-cells = <3>;
+					dma-masters = <&dma>;
+				};
 			};
 
 			mic: interrupt-controller@40008000 {
@@ -361,6 +393,8 @@ uart1: serial@40014000 {
 				compatible = "nxp,lpc3220-hsuart";
 				reg = <0x40014000 0x1000>;
 				interrupts = <26 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma 6 1>, <&dma 5 1>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -368,6 +402,8 @@ uart2: serial@40018000 {
 				compatible = "nxp,lpc3220-hsuart";
 				reg = <0x40018000 0x1000>;
 				interrupts = <25 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma 8 1>, <&dma 7 1>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -375,6 +411,8 @@ uart7: serial@4001c000 {
 				compatible = "nxp,lpc3220-hsuart";
 				reg = <0x4001c000 0x1000>;
 				interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dmamux 10 1 0>, <&dma 9 1>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
-- 
2.25.1

