Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D3025CAEF
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 22:36:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2143919FE;
	Thu,  3 Sep 2020 22:35:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2143919FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599165404;
	bh=pEw9TMPIxWNYuFGaVE/2Re0BYQzNb8hZQD6kH3BRIe8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CXvKVylxZ111MsL0l+gHyzgmybN8r85NP1j0iUXnbd9BNwhfQu+2CpuLQKQ1ni7Kz
	 /cwQONMuE8/7FYLcRRq/Vaf1yIA4Tq6A6/x+Ul4TLCi7/Le+9DqcEgSJLZ1dyEp5lq
	 QrcOcycjp7Fis1mlrCI31iENHBla9bCwFJ+Zx45E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EE69F802F8;
	Thu,  3 Sep 2020 22:31:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96825F8032A; Thu,  3 Sep 2020 22:31:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 345FDF802A1
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 22:30:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 345FDF802A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZrcUCU2r"
Received: by mail-wr1-x42d.google.com with SMTP id j2so4564301wrx.7
 for <alsa-devel@alsa-project.org>; Thu, 03 Sep 2020 13:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=61amrDy5MhVE+L2rXjmfQqPe1Fgk9roDotW+tBGquxU=;
 b=ZrcUCU2rzfGPrkL3bbQNF8DE7OpIgaYNnar8j2g9wWhP4VdZntrKae6ZQ0ZPazUjRM
 eFKhK66OIFB0nuIv4ASSdj5MzMNz3W0ULtFiLyIJU9J3/q277LYB4JgN8B2vsKwQQrFd
 mYoSScXD6VEwvIo3oHEqlHeDJ8QzMtKvTQu/XVd6/K+uFbJ40L5ylAuoXUVazQsrJlZ5
 2KgSu9557Xiq5rDvPrtGAlRn2xQGjuwPxEEa7zG/xNBtInUASSPTzrgYHoeVXIzmVWxj
 JTC07EtAPJCbNkUMp5aoMXDbK5uS1lJlVTpL1t5kRkuB1DmqVabf/VcfFGTXYbWOYeKA
 zqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=61amrDy5MhVE+L2rXjmfQqPe1Fgk9roDotW+tBGquxU=;
 b=TGMvaUZ5NduRc4SWh3Kt6gvu8/1zje5lM/oZcf3CYlnE7zeIynByL+JfBV8oWP5uhd
 X70e1CGuVILsErR/vepgt1Hi0NZSqLR+D7+evqRFwGekbWrUK7aKGAuiy7jitc88YSVk
 NfrilQi95gREcoqL0sRsbiVu/nL7fHdD9eZpQ+IRuIi+byyZDU5X4xm+7ejKZSSUGhEV
 LkLdo7VQj0PyD0f/OJEnZkKOlJ2tm+x1aXfPHkSddFP5DNT5hbTjeCG8tklf38N/qjJm
 zu7sye/a0zjQq3MTxfvDoxgeU53koTjLc5Z2T7j8EG4GAfGuoO8ZU0yYBJlvef25K4+Y
 rSTg==
X-Gm-Message-State: AOAM5331SK5ZCf7UpHt9zpC00Dzkv0f8MR2LG/B5SvqoUEZXZSIn9NAO
 Hn5twVKeQ+sqh0VK//Bbgig=
X-Google-Smtp-Source: ABdhPJyTLPXx1dlhvyfiiXcGUGwjig79KiFo40tbRDlZq1pHE3VShxvp2x4u4kvSkE/SLK6496JQwg==
X-Received: by 2002:a5d:6111:: with SMTP id v17mr4249734wrt.265.1599165052954; 
 Thu, 03 Sep 2020 13:30:52 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id q186sm6818274wma.45.2020.09.03.13.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 13:30:52 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 08/20] arm64: dts: allwinner: h6: Add HDMI audio node
Date: Thu,  3 Sep 2020 22:30:22 +0200
Message-Id: <20200903203034.1057334-9-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200903203034.1057334-1-peron.clem@gmail.com>
References: <20200903203034.1057334-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Marcus Cooper <codekipper@gmail.com>,
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
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 32 ++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 9ce78a7b117d..9597f40b25a9 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -67,6 +67,24 @@ de: display-engine {
 		status = "disabled";
 	};
 
+	hdmi_sound: hdmi-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,name = "sun50i-h6-hdmi";
+		simple-audio-card,mclk-fs = <128>;
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
@@ -608,6 +626,19 @@ mdio: mdio {
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
@@ -738,6 +769,7 @@ ohci3: usb@5311400 {
 		};
 
 		hdmi: hdmi@6000000 {
+			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun50i-h6-dw-hdmi";
 			reg = <0x06000000 0x10000>;
 			reg-io-width = <1>;
-- 
2.25.1

