Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CC9552158
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:40:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41AB9294E;
	Mon, 20 Jun 2022 17:39:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41AB9294E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655739621;
	bh=4RQhycoKExY2jyKeqia36uWYJwLaxZXyRQKSXMgeSS0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L23jriIBHlQxk4av35A2QB/0QUpvDMFM8KmxMNnfWNPPhCCApCelrFFUMkWFt6keT
	 7UERRt+E9hYiNQXvWsDAlSJImqQikDotx046cuijJfFAAVFoSSE9M4Z5T+uA+y5Dy7
	 VVGiV12PAO6+4Y6w1oqS8CpmuebMNf6oUK7/5NKc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA891F8053B;
	Mon, 20 Jun 2022 17:08:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E0C8F8026A; Sat, 18 Jun 2022 14:32:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3D19F804A9
 for <alsa-devel@alsa-project.org>; Sat, 18 Jun 2022 14:32:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3D19F804A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=conchuod.ie header.i=@conchuod.ie
 header.b="Pu1M106x"
Received: by mail-wm1-x32c.google.com with SMTP id
 c130-20020a1c3588000000b0039c6fd897b4so5556621wma.4
 for <alsa-devel@alsa-project.org>; Sat, 18 Jun 2022 05:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pg5EtL0V3UHrid7YbhvB+3zhrduzQGisX4A0SVhhM0E=;
 b=Pu1M106xN55HI9pfnOZNoRrDpjX1i4VH9bR0a4BhQ0DJdKnxN33JrDSsp8oMDBO6jp
 LVQ1VI+4atrButRPKUPNqCrIEigfT0IM8RSE/TM7b+yFCd8/4+xiDRZ3O7NsK9REtRLv
 84xM29eeccO+uGrixFZq0EZFXZEdycBvA0ECOB3ZQETpwQOJCmoI57SPRa91RH4Ybiwn
 DHwH4ld25Q7R0o4T9qzfzLsKmjYB53l8b9saZnSz3GnJD24tqYxXVFcv/kp23HP9PpCH
 I+j/f4rZISdty/aA/Vg0TKDsifyuWEt2DZv8kvr86VvPeWNfHBmzINiITLTKs1DLpX1a
 cUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pg5EtL0V3UHrid7YbhvB+3zhrduzQGisX4A0SVhhM0E=;
 b=UhgtJNbR39ILomrNaDSTTimn2Qa2mjwDG7XB8iUyOL7I0gWnpbdTJpEJvK4nsSHrwg
 PmNRDMsK3cUmdmPSnX+8i/XDALKf3yD+9c9rVXnTKTo7Wy9v++dcVahfye4mH7XG9OLf
 n4mzGWve4Pm87SD5Qrq/lncG80cZQyssbD/JZMkbxN1gyoh1e1P55hwCwtnobfR17XFp
 Oa7ld9Hwowk3pIPkEH9+VZVgPTXQ0L9nSaC8Wqdp4M6UQBLh7+fdqO2GhvjyVr2HCSSD
 sL4kzDgIIaPjB5amrFjBv0f97RYJWoZDwODFdeNY5630n6ong3ipvEcUdgiuaKpR2BKY
 7UpQ==
X-Gm-Message-State: AJIora9LDCJN11HblQT3ZyPiViAajaeLpiyZGAZ/2zRRSZXRRkKo5pbg
 xa1QasuJ6VQB23zRTIfOfzS42w==
X-Google-Smtp-Source: AGRyM1t+D1hSYvVv2lyhJXTM8fnBYLleL1Z3z4M3dP8UVmVZwbcohvWxMo8SxFiBx5Zo6H6ulo6zQw==
X-Received: by 2002:a05:600c:3553:b0:39c:63a3:f54a with SMTP id
 i19-20020a05600c355300b0039c63a3f54amr15447271wmq.61.1655555543356; 
 Sat, 18 Jun 2022 05:32:23 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 05:32:22 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH 13/14] riscv: dts: canaan: remove spi-max-frequency from
 controllers
Date: Sat, 18 Jun 2022 13:30:35 +0100
Message-Id: <20220618123035.563070-14-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618123035.563070-1-mail@conchuod.ie>
References: <20220618123035.563070-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 20 Jun 2022 17:06:47 +0200
Cc: linux-riscv@lists.infradead.org, Niklas Cassel <niklas.cassel@wdc.com>,
 alsa-devel@alsa-project.org, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-kernel@vger.kernel.org, Heng Sia <jee.heng.sia@intel.com>,
 linux-spi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Jose Abreu <joabreu@synopsys.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 dmaengine@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Dillon Min <dillon.minfei@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Conor Dooley <conor.dooley@microchip.com>

spi-max-frequency is a device, not a controller  property and should be
removed.

Link: https://lore.kernel.org/lkml/20220526014141.2872567-1-robh@kernel.org/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index 5eb6b69c1170..ec290db4705c 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -413,7 +413,6 @@ spi0: spi@52000000 {
 				clock-names = "ssi_clk", "pclk";
 				resets = <&sysrst K210_RST_SPI0>;
 				reset-names = "spi";
-				spi-max-frequency = <25000000>;
 				num-cs = <4>;
 				reg-io-width = <4>;
 			};
@@ -429,7 +428,6 @@ spi1: spi@53000000 {
 				clock-names = "ssi_clk", "pclk";
 				resets = <&sysrst K210_RST_SPI1>;
 				reset-names = "spi";
-				spi-max-frequency = <25000000>;
 				num-cs = <4>;
 				reg-io-width = <4>;
 			};
@@ -445,8 +443,7 @@ spi3: spi@54000000 {
 				clock-names = "ssi_clk", "pclk";
 				resets = <&sysrst K210_RST_SPI3>;
 				reset-names = "spi";
-				/* Could possibly go up to 200 MHz */
-				spi-max-frequency = <100000000>;
+
 				num-cs = <4>;
 				reg-io-width = <4>;
 			};
-- 
2.36.1

