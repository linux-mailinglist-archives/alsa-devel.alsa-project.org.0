Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D84C02145A3
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Jul 2020 13:48:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C39116B5;
	Sat,  4 Jul 2020 13:47:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C39116B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593863303;
	bh=zNYrDPE7TMA04OGbu1SKE9/dvQ6G9N3BQ1ew+mdo+oI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DsRIvtjy7SckutOLaHQEpDf+LVMSxAWkEdA6Hq8RxsFhIm3GK5aPJzvKtN5ScHSog
	 Greq/fJm2xrmiBKUyr8bdrx4RpGMd6UpziUmyH0ZXzipoBqgJrcMKeA7RRLJtjoF6R
	 0jp+1EXBB6Te3S36UcMyTro8CovWznxQYWlr8AtM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB084F80341;
	Sat,  4 Jul 2020 13:39:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D2F0F802FE; Sat,  4 Jul 2020 13:39:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1286F802E1
 for <alsa-devel@alsa-project.org>; Sat,  4 Jul 2020 13:39:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1286F802E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KCEglnpy"
Received: by mail-wm1-x342.google.com with SMTP id o8so34352717wmh.4
 for <alsa-devel@alsa-project.org>; Sat, 04 Jul 2020 04:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GZa7juvxCNraX7yvPBOLr2zonCmAlaBXMRvkitzcE1A=;
 b=KCEglnpyhNmWqNqkJ/+JquXUQEMFiqvGsTWMUc+p4Dxgp4TE1emyB3jY012MFGoj0d
 L+aLNL2/GkMTeFM/7qX6AQScuaQShpdM3wOy1NUYQKPxaASltMFZfVP+v02PTpXPqTyy
 dsNRT1nVSAbwQ7jPLS3X2Z0n+oxRQAMQM9hmM1pFaXRlyuTDYLY0woO6j8WEUQwqCpXP
 qIdBVbUbyOJtjfvyth01DnHE6oobgdVuu38o6MtaOQDPSvqcPNQvdXTUyfHC0nC9eVSY
 P7+ojJIqNe9KxAEIqbG3Ck3UGr4+XOhewTkczhTOWaWG39ECeAk23r1PCOVFc7QRx4Rp
 qVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GZa7juvxCNraX7yvPBOLr2zonCmAlaBXMRvkitzcE1A=;
 b=ea78aa8v4m1DxTU+n3h8e7GgfbsFUP6dWIhaET7KdN2ekapMMbheB5SHi5cnQhLo0y
 K0Q5TCo62YPtee8v1QTOpm3X/1JJvExL9aUqDrYBGmu+/zxfiBJtofNCaOKqiX07aWeQ
 FXstUQNguyN2hKorXYiMr/qVL9Ta92gARfSJPBZ1XZ/MFSaMvPUI+6Fa3W9yzhBql3YD
 dA9jSgy7rG4wmXAwvG1Vxj7adMVZU6mTz+vD1Czy5q6lH3D+gsEd5c+dLHD9ERMUGv+P
 Z/M+C0JumeEsypjS32m9cUJP7bQCGatsL1ZUksqQQ17id4ovXXBSZJzCNlFQdHenOQ9e
 4BOQ==
X-Gm-Message-State: AOAM5324vx9oWgqs9j47Fzsi7sO/0u/nYxHoMPVE5FrxsHOcgg/NRRGp
 njq/ovXK1wrbzSdiak53J5c=
X-Google-Smtp-Source: ABdhPJxfcQdS+Umj/CHeClbECFuBf+fW1U4N3FItKLlj7UmAWRunzK5YIbAPJzh+k2FYo5STu5fXKg==
X-Received: by 2002:a1c:9d0c:: with SMTP id g12mr34791236wme.107.1593862761215; 
 Sat, 04 Jul 2020 04:39:21 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id j24sm18657373wrd.43.2020.07.04.04.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 04:39:20 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 13/16] arm64: dts: allwinner: a64: Add HDMI audio
Date: Sat,  4 Jul 2020 13:38:59 +0200
Message-Id: <20200704113902.336911-14-peron.clem@gmail.com>
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

From: Marcus Cooper <codekipper@gmail.com>

Add a simple-soundcard to link audio between HDMI and I2S.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index c662f6a170ce..6a321fdc8e90 100644
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
@@ -856,6 +875,7 @@ i2s2: i2s@1c22800 {
 			resets = <&ccu RST_BUS_I2S2>;
 			dma-names = "tx";
 			dmas = <&dma 27>;
+			allwinner,playback-channels = <8>;
 			status = "disabled";
 		};
 
@@ -1155,6 +1175,7 @@ deinterlace: deinterlace@1e00000 {
 		};
 
 		hdmi: hdmi@1ee0000 {
+			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun50i-a64-dw-hdmi",
 				     "allwinner,sun8i-a83t-dw-hdmi";
 			reg = <0x01ee0000 0x10000>;
-- 
2.25.1

