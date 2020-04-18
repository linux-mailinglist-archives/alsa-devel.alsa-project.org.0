Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DA31AEF9D
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 16:45:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB6B51671;
	Sat, 18 Apr 2020 16:44:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB6B51671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587221123;
	bh=HlS2li0BmF+NHj59gcCtOEKsT4uGQMkYlaNEuzM1o+g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MSBNtsD73RG0+gQN9xw/NDwo1jZ7SvQJCanJTY3kPjMQZre7auzArK7Bz6SSSBbOk
	 48A+j65u/DJwVnPFFCEweErxL9TIQ4EuBNeMXzyomK0cFzWHyvA2ut08u5Y8qE2wCu
	 SzzD2Pd7qlTkNjnPQx2d0NrUprSWxhI90/KBJneU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 077A1F802E0;
	Sat, 18 Apr 2020 16:39:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7720F80122; Sat, 18 Apr 2020 16:39:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5FCE9F80122
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 16:39:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FCE9F80122
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FNGWlj7v"
Received: by mail-wr1-x441.google.com with SMTP id j1so938731wrt.1
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 07:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dcU18dKgyioxh46jA7FvWsYL58s8h58864kxaD9p5qo=;
 b=FNGWlj7vcsHWXXSK6xC+raY2VaK8WujFpWxUCLPM7g3A5Kjc1LEx4eHBGUHXW1BQMJ
 n/asEVPQE/32PXIAOhunBM7j/BsT7tgd9woCdhleKcUtVNC3J/sc17p0S+qAv67qVBCq
 LEA6a0LyRTcUWGJ8cXP5LhW/TzMjL3aaijmCXu+VUCfV3pG9WgG9iy+ergc6LNHBXJ8Y
 6UGmJFrd3kzfjqCtdbarrb3I5Pw7XCivgb9n3ONfGh49tH9ulciCiQ7lBGj2mBE0UxH6
 jfSxWkhpUmzxFy2FlXR2LEiLHvXn+t8kZN8+g0BIBG3FF4n4im2qHNhhipUy8PCTJHG5
 nLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dcU18dKgyioxh46jA7FvWsYL58s8h58864kxaD9p5qo=;
 b=lrqbaDWyOZ3toOqTbZMVVhE+XJKIvbv3t+iD+42B2W7DccBBuAagjn4TqZVfg+sapa
 1VI4s780P0nqUjSVLnmzVLzHBrK8NlzHTNLJeCFTT1ZwvpJO5TmJWc/3e6GJEJQE48Q8
 gPA1c7pJw7P+n+BUHSqR6NvjTcJPS7+My96bMWXbL6mNd6iA/ZmvB7YJtjB3DfC+uOf5
 ec+unBqZJPS2ONnYGwBSAV2nWSuP3hbxw5vszS0+PbjHJhAJCCrPV7sDx+UXDyeVI+tH
 bK7km8swJ6hl+omy1f17oMdy6vlHUsgbrJxcNGQANFezr2HIbdE+YmXWX8fitUZYsFhY
 uBQg==
X-Gm-Message-State: AGi0PuZN9i6Xv4nvrxnMoSA/RnGJ99NDZJO+lX+ToSACV37ASNkMOAM4
 jtW5n8OD9QfYOLPaaETn/b4=
X-Google-Smtp-Source: APiQypKJlHwpQpKN7XlW70JN2DZ17rcbc6rk8jOc1krkjdakqmOSks4L/YFTXs9xyLmITSrlVkM7hg==
X-Received: by 2002:a5d:6584:: with SMTP id q4mr10073857wru.403.1587220774636; 
 Sat, 18 Apr 2020 07:39:34 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0:4e7:1fdd:b7c2:b3ab])
 by smtp.gmail.com with ESMTPSA id
 s9sm25375322wrg.27.2020.04.18.07.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 07:39:34 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 7/7] arm64: dts: sun50i-h6: Add HDMI audio to H6 DTSI
Date: Sat, 18 Apr 2020 16:39:23 +0200
Message-Id: <20200418143923.19608-8-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200418143923.19608-1-peron.clem@gmail.com>
References: <20200418143923.19608-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, linux-kernel@vger.kernel.org,
 Marcus Cooper <codekipper@gmail.com>,
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
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 31 ++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index b9ab7d8fa8af..47c657d6237b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -88,6 +88,24 @@
 			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 	};
 
+	sound_hdmi: sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,name = "allwinner-hdmi";
+		simple-audio-card,mclk-fs = <128>;
+		simple-audio-card,frame-inversion;
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
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -571,6 +589,18 @@
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
+		};
+
 		spdif: spdif@5093000 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun50i-h6-spdif";
@@ -701,6 +731,7 @@
 		};
 
 		hdmi: hdmi@6000000 {
+			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun50i-h6-dw-hdmi";
 			reg = <0x06000000 0x10000>;
 			reg-io-width = <1>;
-- 
2.20.1

