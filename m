Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D1E2716FC
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Sep 2020 20:15:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EF0316B1;
	Sun, 20 Sep 2020 20:15:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EF0316B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600625752;
	bh=rtV8XB2fNUI6dfdgeZzKSJTY/BmpXEr8HlLiHscxOYk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N/k1mjtDpfmITQAzTyYniqdxfDtB+jCgFQN5TRpbbicg4bZWemm7IqjZotziDocZF
	 qL8JINUwDJ4+H0VlagBkN9KNZYn9MUEJoDwkIi2T3HdMbXj52AdTOS2+7HxQog7HRd
	 zuejJHGlrNv8ytpxZq2Hoy4X06X/wSyqiACvGom0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EC33F80331;
	Sun, 20 Sep 2020 20:08:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A903F802E9; Sun, 20 Sep 2020 20:08:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83237F802E3
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 20:08:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83237F802E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="B7PRL6is"
Received: by mail-wm1-x344.google.com with SMTP id l9so10328277wme.3
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 11:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oiQXJmHs44ashMYoTEGA5ScRasCru2GgOD0BocdemjU=;
 b=B7PRL6isHznI4NCkDIHWWhpNHrY+LhmmsTC4Kos7j8Gb5TQrPrEcCqZvMV7SLXLE4B
 VpcLt6z3RDbU8weUSypJ8kf5o0VRni4900NkCwlwmpTSItgrarJ0cb3i1gOFfuhn63qS
 diEX2adifvT5ZGzgC6w2yXvcLxBjW78mRyw8xpTng24a3S8z0/Y3ojZjhekAKClwoz/I
 ikHy7Mnu3orfO1zIbMtrXtlqixC0+4TadB7tfS2WEzORoi4fruV2j8IJT0RVg95szFC9
 dieQRkqzCaaBZDzn5HPwBVkJT/9muyKmTCG1BhNb5eeNONwoEFrvLbKNQ8VHKe5+cqTD
 q6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oiQXJmHs44ashMYoTEGA5ScRasCru2GgOD0BocdemjU=;
 b=V33tpPd79akhms+pBywokIz0tmkw1kyQOk8YD3hHpN43kBonMusecUwsTGBCctL3iM
 ojbIzr73/wRBvOeq9nmi4BW6tDEPgB7hP/n2lkcrwjAeg8cUGmPol6/K+noA7YaOidZz
 0f3VBBQN+auPn8CKZ3q/HHSpkblJCOV5CkmPHA3WwRZOmlWVbv0fuQRgOPzydLmwpam+
 IycmJjQVQgmCsPwJF8K0oZXblooHuYlWthnTJgOuYAwkxPKe1gmVH0ZjOCK6uP5XOpN6
 cc8tGGHvzDkUuYnvTavU+pIrtQ6X9RITS59ZShd+YH2XM7o0/G6IIE9mk+ciCQWwudwp
 i4ig==
X-Gm-Message-State: AOAM533ddubXJOi4/JStnZAmtjEg8KFyvg3j8OZJiwewtWh3XmQcHFfb
 Sx++3v9HPWxeDTeX0TxXKz8=
X-Google-Smtp-Source: ABdhPJyVss1kFFD6NbuSmn+YljfgPALRvl592KUINMT4YTmhgxTqI3H8r+cn+br4pP/gMfIT8A/JOw==
X-Received: by 2002:a7b:c111:: with SMTP id w17mr25168153wmi.109.1600625304915; 
 Sun, 20 Sep 2020 11:08:24 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id 18sm15142782wmj.28.2020.09.20.11.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 11:08:24 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v3 12/19] arm64: dts: allwinner: a64: Add HDMI audio
Date: Sun, 20 Sep 2020 20:07:51 +0200
Message-Id: <20200920180758.592217-13-peron.clem@gmail.com>
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

