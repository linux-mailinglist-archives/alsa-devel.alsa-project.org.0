Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D5E1AF5A6
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Apr 2020 00:50:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E6EF1676;
	Sun, 19 Apr 2020 00:49:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E6EF1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587250237;
	bh=D3zfkSFHHUFk9S1FNvHW/sJthb65OrT4O37WhkMkz8g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qolbkx0DoqqEItXdQtF5Dsf6ifQMmjY/OFEVEcV5mEa2WlegpDjv+fjxARD4gr2Vs
	 FELkcl+HO3abFFYnnLwyAQ1+fjRZ//CYVtIdunjqLI4zUQLaDZBVcFd9vsPwznLUIL
	 oaE31kH9edDdvBgdoLl/k3/QkFBID/DIJEml9iu8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3182F802E8;
	Sun, 19 Apr 2020 00:45:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7174FF802C3; Sun, 19 Apr 2020 00:44:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58703F80291
 for <alsa-devel@alsa-project.org>; Sun, 19 Apr 2020 00:44:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58703F80291
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cazk43It"
Received: by mail-wm1-x342.google.com with SMTP id x25so6740778wmc.0
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 15:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=71OS66q5+Ejt0CVM9F9Xc2Ppa++y7UNFVHd3OthRIGY=;
 b=cazk43It3j2VdzZjFL3s/sYFp7HDN8tiCVlcUbB2/Mcdn4gLPLX0Th07O6It2OyJNL
 wvYcmUrpj68HUl7zlkTFUCO8RrYoT6YPtkgTy5VLmhNIQNAR7Yl7ZTFRWyvNc73q2pTP
 YBdzrGKG/wvFBmCdObfAV47RhsUflbPCXCVT5lRe8LSNWjyusUO5slrrTWkV9VVMFK/F
 ivpF4lDwN9U+i+eM/i0NShQX7YOjFRgP8GcNPvSiQbF6PEt6Juw1cSv5roEJYsZgS6Mk
 3jOzcZqCgZN51zTPWnlaZ4AbBJszYNJHqEK/xHa/sTPpCY0iSkZOMQufceMz93YgkEBU
 xy7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=71OS66q5+Ejt0CVM9F9Xc2Ppa++y7UNFVHd3OthRIGY=;
 b=NZmRTiB09q2VuYbeCZF25chO2zISffHKZLaSphOeadkSlyyW+ZiV300mZrjGKSIfKM
 hH6l+ZXVGxA19LIqukO+mpApXsnN8Ujb+Gpi3iOS/oaRykZuAUBHUgbtpU0PKkTs55jH
 g6dfiKYeLYymYaY6iff9rRMaKBu9bybwLtFu+6IWpSSwTtUq1O6b+19RFObOtasaYUiI
 /nCbshhDU5wZOK4faED8JMuOP1higwN2hXVgR83E3yLgwjE3uYpE6d9XTHnyB5AMaw+D
 ZwxXjYy30ZKcxw0VAYL/xzifPytl8azqJYdPp72QlpLUicMGpu+au4CA4kj2fVmjnXv0
 7Caw==
X-Gm-Message-State: AGi0PuY8ZOGxoBP3h4958t2mLvUJfwf2sqAk0xeQOV5pDcMIIuxFDAvc
 xqpf+BIVPDxPcHynvdoCcYE=
X-Google-Smtp-Source: APiQypKPyTgIPou2Ic2zKdJoZZ5OAlZ2VKspz5p2AZgsdlNKecb9pgI1aFJzAkUSz8IpYtJTgIpMJQ==
X-Received: by 2002:a1c:384:: with SMTP id 126mr10040767wmd.58.1587249889094; 
 Sat, 18 Apr 2020 15:44:49 -0700 (PDT)
Received: from localhost.localdomain (91-167-199-67.subs.proxad.net.
 [91.167.199.67])
 by smtp.gmail.com with ESMTPSA id t16sm13371559wmi.27.2020.04.18.15.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 15:44:48 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 7/7] arm64: dts: sun50i-h6: Add HDMI audio to H6 DTSI
Date: Sun, 19 Apr 2020 00:44:35 +0200
Message-Id: <20200418224435.23672-8-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200418224435.23672-1-peron.clem@gmail.com>
References: <20200418224435.23672-1-peron.clem@gmail.com>
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
index a5ee68388bd3..558fe63739cb 100644
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
@@ -581,6 +599,18 @@
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
@@ -711,6 +741,7 @@
 		};
 
 		hdmi: hdmi@6000000 {
+			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun50i-h6-dw-hdmi";
 			reg = <0x06000000 0x10000>;
 			reg-io-width = <1>;
-- 
2.20.1

