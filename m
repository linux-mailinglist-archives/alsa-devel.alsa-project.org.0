Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB792716F5
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Sep 2020 20:13:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B882169E;
	Sun, 20 Sep 2020 20:12:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B882169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600625594;
	bh=pOUDdxF+ORCxoCN1LCBGXRN4UlT3CfIWSSGkMvcrhLc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zn4aNUq3VJjqKjnCnVU8zc4by6ie54DbwWagnVEov2c39RdkDSJfXfA2BwKnqcG+t
	 A1su7x5pyS1kIUIgoLkK+mj6K3frM5Rlkjotkr6qC4HphtbVYkvLDTpVTUbCdMSvhF
	 e20CTEazSziTi1hCSAa9Cucx6nJSpdEDKnSE7DA4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D7D6F80305;
	Sun, 20 Sep 2020 20:08:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E10BDF802E8; Sun, 20 Sep 2020 20:08:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2087F8010F
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 20:08:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2087F8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pSxqCAT0"
Received: by mail-wm1-x343.google.com with SMTP id q9so9973859wmj.2
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 11:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JkdfxrLwBdjddup+rntjfNSMSYQlzu1HAdo40yPe7r0=;
 b=pSxqCAT00PglZWdVW4BHbNa6M9AcP9KmANbWjTrGbvUoH3xSoYpLFaEwbcETSxaMpy
 6lDZJVQYv4TQULCf2yTfDWLCSUghJmAUCDY4J/TIopQKRnMoe+aWpJCpjVTGGWkQMu0i
 nwiJex5SzmKJKf1iBvGphD+V/2+uu27vUmaH6/ggW7P1TcnXxWAs96d2JM5m8yfU2iqr
 iHQ1rxZzE6AFoidsIj4cO736erBK9l3P8KXW+1avg0TS0NzD8XmWSWK6V54yQQJdSF2g
 yfA0mM490INXeX1vFnxnvQT8Ut1QOCJx9niKyUiE8tiyznjmQcRCBRAY22vrTL9F769T
 2rVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JkdfxrLwBdjddup+rntjfNSMSYQlzu1HAdo40yPe7r0=;
 b=FY+48bRByp8VmqIT0on8KCOnc7wmKk+8ItiuVeStvD75qUUcDFCtXjlCFGcz50r4gL
 pWaADu6uyKRdFw9dRGmpk3Xf15qS/2oo/Nk+Quu1ZvFMJ4IFWIguRTXfVhA9CmiVgK0+
 MoTQ4j+ei/ugkTxutuwEb+PLnUQZGx1UMFc8cJ9GClxlEhvNM90/mULELqT+WanWx8lN
 4tnrYHpw382mxpjz5hzj7NYGSH+mQQkAZ6OhVTqitAEzqcDfzrXl8qIee/qRPUkSijPb
 M/gPJbu3es/Jxwv2tVom9pTuUhhpZDTzC2k4PBK1dioA2lh+jAPyUVWux2rzwdQkRoI3
 CZVA==
X-Gm-Message-State: AOAM533lKWt8dkHbE0/TLRfeyOPLnyP/VdJaBbbVnf/Jmcx1O2JjriiM
 RvaKQWaEnQXcSzlVr0HoaVc=
X-Google-Smtp-Source: ABdhPJxiIKUkGTyKv49gyQgZ7o8Gt6ys1xGGR9jjdvD0yTLSiJ04rrIJxV/N7x3rqAx/M1n6vKFLjg==
X-Received: by 2002:a7b:c24b:: with SMTP id b11mr27556913wmj.134.1600625298266; 
 Sun, 20 Sep 2020 11:08:18 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id 18sm15142782wmj.28.2020.09.20.11.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 11:08:17 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v3 07/19] arm64: dts: allwinner: h6: Add HDMI audio node
Date: Sun, 20 Sep 2020 20:07:46 +0200
Message-Id: <20200920180758.592217-8-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200920180758.592217-1-peron.clem@gmail.com>
References: <20200920180758.592217-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

From: Jernej Skrabec <jernej.skrabec@siol.net>

Add a simple-soundcard to link audio between HDMI and I2S.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 33 ++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 28c77d6872f6..a8853ee7885a 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -67,6 +67,25 @@ de: display-engine {
 		status = "disabled";
 	};
 
+	hdmi_sound: hdmi-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,name = "sun50i-h6-hdmi";
+		simple-audio-card,mclk-fs = <128>;
+		simple-audio-card,frame-inversion;
+		status = "disabled";
+
+		simple-audio-card,codec {
+			sound-dai = <&hdmi>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s1>;
+			dai-tdm-slot-num = <2>;
+			dai-tdm-slot-width = <32>;
+		};
+	};
+
 	osc24M: osc24M_clk {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
@@ -609,6 +628,19 @@ mdio: mdio {
 			};
 		};
 
+		i2s1: i2s@5091000 {
+			#sound-dai-cells = <0>;
+			compatible = "allwinner,sun50i-h6-i2s";
+			reg = <0x05091000 0x1000>;
+			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2S1>, <&ccu CLK_I2S1>;
+			clock-names = "apb", "mod";
+			dmas = <&dma 4>, <&dma 4>;
+			resets = <&ccu RST_BUS_I2S1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		spdif: spdif@5093000 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun50i-h6-spdif";
@@ -739,6 +771,7 @@ ohci3: usb@5311400 {
 		};
 
 		hdmi: hdmi@6000000 {
+			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun50i-h6-dw-hdmi";
 			reg = <0x06000000 0x10000>;
 			reg-io-width = <1>;
-- 
2.25.1

