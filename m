Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE654272135
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 12:33:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6050A16F9;
	Mon, 21 Sep 2020 12:32:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6050A16F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600684416;
	bh=rtV8XB2fNUI6dfdgeZzKSJTY/BmpXEr8HlLiHscxOYk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cvZVZZw/hoqYzvf09HfAx8++EYELmtQ6skHK0tGPm4HxaFtIP7nzdMfg/4DAHihSG
	 xG94wEys+01DaWNnx8dJ3NXm3dUn6IxhOT24JZ7czARMEVztAbE4UTnERvUhr/5sAv
	 dgbCegHrlVZtklqiUFyu/OxHoyZ4WH4c/D+YZstc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDD8AF80162;
	Mon, 21 Sep 2020 12:28:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CAF1F80305; Mon, 21 Sep 2020 12:28:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 661BDF802D2
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 12:27:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 661BDF802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WLk0wH/m"
Received: by mail-wr1-x441.google.com with SMTP id s12so12130483wrw.11
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 03:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oiQXJmHs44ashMYoTEGA5ScRasCru2GgOD0BocdemjU=;
 b=WLk0wH/mK4n85uc1VRHFLjUPKgONu5TaQ+ibzedASzLy4lCff679/K22sn8956Qe4Q
 qW3qVKkGajGEoVXdszvfzFW4ECWXL8S8PBIH0dtEgNXM9k+vw74VDHTg7ubOP9F6jt7f
 ioDmaB57m3B7XTIMWDeinzUAlpYjr11OxJykny/trLbrTawrodt5SkvQauMbaemkgkUv
 oiICnrsW3qMf5cJrIslte8VzP+jaUHfx5K7sh+jk9JeFmUdcUznyeq/6hkXDH2ZXf6as
 A7jYlTINa8ZOU5uJbZ/GCsmR2RIeWl1aCZY/jXpej4FYx4eV80+IJdONfGLC9ZO52ypT
 p5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oiQXJmHs44ashMYoTEGA5ScRasCru2GgOD0BocdemjU=;
 b=HErLPqvRO1+enVUHU50HEt3oQsuiIBk+SYsOXimiMhCyk5wvSChe1ZSyVaxA/1fw9M
 QCLewoShNzCpds911WPiCgbHSWsEHY9C5rE3dZpuiw6EBY/yYrJm6ZXMGE8i6ynQ32MV
 YrKyJiyd17mPkm+54a2qKzoLjwzZm8LbW2gJYJTkdkTqr8PcD9jnjvk/12AolLGc1Tpz
 dIXOZ5ymlx/u0ONPJCRlDeGSKyNL5uEVfznGpi9L92aQ6Dldi3rFx6NLMc9M0aVbzENI
 r2ha2hwJk3uWjDBX6+Yzis9rBXLxiBgKdCeum3wT/CQwkNG0uDNnplzqtNNBEoRk1xkS
 hCMw==
X-Gm-Message-State: AOAM533L1AnFySEjoJD6T9k3t2HRDubyI6HX0VwWd9eBnktLFzp1IUVR
 BhC7oMfoYMZNQ/agIebEykg=
X-Google-Smtp-Source: ABdhPJzv+NI5Nm0iOLW49x1D1Pz942Tv8qfyBpUYUxr2rRgNqqKnd7n2Vcsar/Ee1uEXqkAV7fVG+A==
X-Received: by 2002:adf:f4c6:: with SMTP id h6mr51098543wrp.310.1600684072722; 
 Mon, 21 Sep 2020 03:27:52 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id h2sm20713774wrp.69.2020.09.21.03.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 03:27:51 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v4 14/22] arm64: dts: allwinner: a64: Add HDMI audio
Date: Mon, 21 Sep 2020 12:27:23 +0200
Message-Id: <20200921102731.747736-15-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200921102731.747736-1-peron.clem@gmail.com>
References: <20200921102731.747736-1-peron.clem@gmail.com>
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

From: Marcus Cooper <codekipper@gmail.com>

Add a simple-soundcard to link audio between HDMI and I2S.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 51cc30e84e26..ba8a84e6e993 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -102,6 +102,25 @@ de: display-engine {
 		status = "disabled";
 	};
 
+	hdmi_sound: hdmi-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,name = "sun50i-a64-hdmi";
+		simple-audio-card,mclk-fs = <128>;
+		simple-audio-card,frame-inversion;
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
@@ -1157,6 +1176,7 @@ deinterlace: deinterlace@1e00000 {
 		};
 
 		hdmi: hdmi@1ee0000 {
+			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun50i-a64-dw-hdmi",
 				     "allwinner,sun8i-a83t-dw-hdmi";
 			reg = <0x01ee0000 0x10000>;
-- 
2.25.1

