Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4B025CB05
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 22:37:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 041161940;
	Thu,  3 Sep 2020 22:36:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 041161940
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599165462;
	bh=bIfAyfAcZcUVTXQ4FfhLsy9dzL8NoeVWz6/UjK/5A+w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uOZFISarMTLvj23CiPN0P/DwlSN6nDC1vSZMnbsCgao2JblqYtqZL6l0QbiAYEouv
	 lGWMQCVji/bVV50x70e6B0+wDkc1BD3REIlFbq+VsicxN0qZv4eLjlKfOKm6kRHHlk
	 CM68YJ/EQlVZuum0Dz/wb3E+CAYh5tz0HpAOMp1g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 129A0F802F7;
	Thu,  3 Sep 2020 22:31:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C06F9F8033F; Thu,  3 Sep 2020 22:31:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAE25F802E9
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 22:30:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAE25F802E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PUUWA/3D"
Received: by mail-wm1-x341.google.com with SMTP id a65so4094745wme.5
 for <alsa-devel@alsa-project.org>; Thu, 03 Sep 2020 13:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Kzc7c8z/8BLZLzO00zFvlw0RIRscqiIQLsTxrgpdlY=;
 b=PUUWA/3DwOR0XZKrhD7f6l68tbk5P/o5FOQQmpRTCPHsPuDmBxR1cfmiCkIh4pRRkG
 ApgMa0YPGTXrqN27iHak3drv+otCQfhpzAKkRZCYFBMd53wBJf7hxZq1Llwj8GclQeVq
 jF7vB53l1KsMwSapXwKhrUa3rUAvhoH/j76DtlI3dWZnBKSCQGjzQ/oqM9rgQ8ouOtku
 rc31+b1AEwnwbvC5rQOvfV6CmsW+QT65UPHdOG6pOiIePlIyvHyVpJTZP0vq70aH85SE
 tXj7tUgKAcpnYhadrY5cppTrTw55hIZBpjLMcdyozMryAYrZFDFiEUrnEz3IQd+C1Pbu
 ao2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Kzc7c8z/8BLZLzO00zFvlw0RIRscqiIQLsTxrgpdlY=;
 b=dihQaubASYXBIof2dlRXMnr3Mp7KF2IERqdeZy0USwmewGVnSQjePnE9mfnLmjrs9Q
 2FoiLNGORw15TV1yzjlGEgX0KqTsmsbRzIunIDjsltvQhF944WH9G4CCZuFgVU4ZPlQH
 2n0O0WzOGGg7fTQY54VuXk99eTsOQJApznPC5p+BEDJlL3kfhsH3PS/rKP8GguzA0B3k
 mHgqnut1d23slKNxHCiSJavTB8USFlcjJ4Mwl58cZHns+PqwNOHw12AmsOiAG9zOLvfe
 yCLcpcslTiCIS/OgcmRJTTXfhbcLuKvDScaiRt5CFyCxUKgmK80T+5xbPeLcAYK2i0yL
 zXwQ==
X-Gm-Message-State: AOAM532FUHtyZlGUv+PeWulhUW7Ktn9n24FFMsBkvVVOvze14PQBpY9Q
 kgs3puTb6trXXQDNbRlBZJ0=
X-Google-Smtp-Source: ABdhPJw+tb3+WnIk1ktQolOHCtjM7VlSRebZKfzrpihaMF2DlFCRTa3VjYI21Dgt/yP0CFcatKXo0g==
X-Received: by 2002:a1c:7405:: with SMTP id p5mr4198374wmc.35.1599165058374;
 Thu, 03 Sep 2020 13:30:58 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id q186sm6818274wma.45.2020.09.03.13.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 13:30:57 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 13/20] arm64: dts: allwinner: a64: Add HDMI audio
Date: Thu,  3 Sep 2020 22:30:27 +0200
Message-Id: <20200903203034.1057334-14-peron.clem@gmail.com>
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

From: Marcus Cooper <codekipper@gmail.com>

Add a simple-soundcard to link audio between HDMI and I2S.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index bcf808459edf..8c540f4f64b9 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -102,6 +102,24 @@ de: display-engine {
 		status = "disabled";
 	};
 
+	hdmi_sound: hdmi-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,name = "sun50i-a64-hdmi";
+		simple-audio-card,mclk-fs = <128>;
+		status = "disabled";
+
+		simple-audio-card,codec {
+			sound-dai = <&hdmi>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s2>;
+			dai-tdm-slot-num = <2>;
+			dai-tdm-slot-width = <32>;
+		};
+	};
+
 	osc24M: osc24M_clk {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
@@ -1155,6 +1173,7 @@ deinterlace: deinterlace@1e00000 {
 		};
 
 		hdmi: hdmi@1ee0000 {
+			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun50i-a64-dw-hdmi",
 				     "allwinner,sun8i-a83t-dw-hdmi";
 			reg = <0x01ee0000 0x10000>;
-- 
2.25.1

