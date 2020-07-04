Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E771021459D
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Jul 2020 13:46:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95C3816AB;
	Sat,  4 Jul 2020 13:45:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95C3816AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593863168;
	bh=3FAxLZmgKZUBRoI0nV9bsNABMPpW1k5fhYQvi5s5D9c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p6+2yyEyv1kMhYuIwClkdIAQ+G427HBFsMkUiubWrws0GQYmV561AwYVCsuQ1kr20
	 hk7BNhhH3y/Ju1AA+gwR/4y4imKn75UnDb5KIW+hXIatmqy65t72bpBHpqTTKC72Xv
	 xfhTcyWLZJaFolte24e2lrJnDy8mLr3nGx7yhaiM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10EDEF80321;
	Sat,  4 Jul 2020 13:39:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B9DFF802E1; Sat,  4 Jul 2020 13:39:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB6C8F802BD
 for <alsa-devel@alsa-project.org>; Sat,  4 Jul 2020 13:39:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB6C8F802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MrHuEd2Q"
Received: by mail-wr1-x443.google.com with SMTP id f2so7458900wrp.7
 for <alsa-devel@alsa-project.org>; Sat, 04 Jul 2020 04:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ezO7lsAoD6+JpVBUKtvDQJMPID6Dt/CBroo5aFvxW2c=;
 b=MrHuEd2QT2ZG+PWI9dVl4RQZaS0AAbRl7EJLQByo8JfTtqrsz8cRyRhZz95E9Bfdp7
 4hteyPq1A5GG5i0YXjdG4qVSnW5GK+W6Evvgyiw01ojSZ0JX5mHq/IL1d7ztzMzLJItL
 z3WGpoaWoO/17jXsjdzV2ln0DyBENhFlFx3xyRH4pu9bYbIH6KyCDfQ3IBVsljgH6WbA
 ic1kR4226T52XjPmy4TujajrMGgGVyNtKr3g+oJUCTQeVHezP/U/7ZzD3n4VGstGE3AU
 uY2Ko8gjm2ew2Fz43HFWV6Gizk+Zm5uMcnUYiPZIN1LFZ/URzsqFILAKDP8EszHmAyMR
 uygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ezO7lsAoD6+JpVBUKtvDQJMPID6Dt/CBroo5aFvxW2c=;
 b=XcTspu1UfinpTxxdd0qnA/6DCG28QC5DwSeW69+G8v9+5ae5lYjFMf0gIphG4AgHwJ
 ah1I9uVsPRL+g6tBB6mvl28I1on3gwaVRmPOf7b7YsfbwV6HTJ/tnH+CaI4fpIruz2Ef
 WYpIXzkpDo6fqtAm2sdMYE9XpIAH/denx3ku4NCu3ZzaKg3GD5pD3DnpKkHzMs80yfn+
 v7S9PIx/SwpxEp+QnRNaF+k7XO26GBoDx1UkqMNS1WpV0yxtwCd2lBdn2oGK8thlk32E
 /lbnu0TOzR7oqAIaiVSAeiktDmUy3lSebI1gbo6dVfZIMzmrqYfPYXCbZe8MEDGBytfu
 VIFA==
X-Gm-Message-State: AOAM531UNEQr/QCOWKi0g5nEZEAHHiJ/uFHsW9IBEA2eZeJD3GWNcSbL
 /TRVrDNtVqiK4uEpmyjxxOk=
X-Google-Smtp-Source: ABdhPJyiYQcCMIVNP2K3kv3FGvdS4uvqVsD55hFFNUkDO5/5HgW8wLxq7kKI6/UKcROBuhJPZUQlUA==
X-Received: by 2002:a5d:4991:: with SMTP id r17mr13013702wrq.1.1593862755239; 
 Sat, 04 Jul 2020 04:39:15 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id j24sm18657373wrd.43.2020.07.04.04.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 04:39:14 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 08/16] arm64: dts: allwinner: h6: Add HDMI audio node
Date: Sat,  4 Jul 2020 13:38:54 +0200
Message-Id: <20200704113902.336911-9-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200704113902.336911-1-peron.clem@gmail.com>
References: <20200704113902.336911-1-peron.clem@gmail.com>
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
index 78b1361dfbb9..ae169d07b939 100644
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
@@ -607,6 +626,19 @@ mdio: mdio {
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
@@ -737,6 +769,7 @@ ohci3: usb@5311400 {
 		};
 
 		hdmi: hdmi@6000000 {
+			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun50i-h6-dw-hdmi";
 			reg = <0x06000000 0x10000>;
 			reg-io-width = <1>;
-- 
2.25.1

