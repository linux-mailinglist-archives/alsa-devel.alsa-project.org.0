Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA9E2145A0
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Jul 2020 13:47:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5702D16A8;
	Sat,  4 Jul 2020 13:46:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5702D16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593863240;
	bh=VNFAJqEyVyy0XlnR0W+J5IGO8xzOMW1TS3N4PEBvea8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UPQ4ItgyW4CSk8cTx1XjY8QEQbWK0GVxebQJAZbgkFQyxC8O8JraHSH2SEhVLZIoe
	 +4W6Nj8seuXGg+GhOfTAXGZ9U0d8TLMVjW1PaZt9WiChz3/7MUEHGtybDMm0eDHq+w
	 2Do7JwESz117/IwdtQEz871eY6B0v/p8hV2WD62w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34CABF80336;
	Sat,  4 Jul 2020 13:39:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20161F802EC; Sat,  4 Jul 2020 13:39:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69AD0F802E0
 for <alsa-devel@alsa-project.org>; Sat,  4 Jul 2020 13:39:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69AD0F802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CXEFrhsc"
Received: by mail-wr1-x441.google.com with SMTP id f18so27368203wrs.0
 for <alsa-devel@alsa-project.org>; Sat, 04 Jul 2020 04:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fTGEWk45ndJLT2NY/8Es0iz5Nm0crZjCJORIXqLrPak=;
 b=CXEFrhscCk+j5TdunLyNHrZJrFTXYvNBQ5sAs4RwVo03mfiM+PtGWDpxafKr37ac0U
 w3EJeeD7fJHyI7NtFCa7hADR+v4sUNvZ8nVPHGJtiXAViVyRJ1oW7eTqlj1J8jyS6XCN
 mPfkZXS/SPAUWuo8crj9VojAf7Jq0apgMdlqZMAopvh2jH4reQIzeqgDR4FGEqrBp7SW
 bSokSJgr9mjXdsuhpWD+BWB0sb9sCtDcveDqNWTVbeXn+AGxd64K4jDMwQ6zRDdqJ85d
 1SKKSrScwedcGXGymdH5NehlKUFxb9PvGFfKOx8rdhkbHi8gneO9o/AC4I/6rsjWZYCO
 HMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fTGEWk45ndJLT2NY/8Es0iz5Nm0crZjCJORIXqLrPak=;
 b=AIyTqZoVqbx+h/z4aENTkb+jDenUHCCxSSSdW8UEnF9jHChIlcoSSfRBWOt2qZz/nG
 f5kmcFjEklG/J6RYNtxGrf1tw6eX7u7y76xlId6lh+a64y5iQLLwsCRj2KMHbsYAnJnU
 WNrgoOeaQpI+CQS6AsoBCqQp88qL7yBLKXT8y6GkwA2P7V3mPmbwnsDuP5wXD5ZV7waE
 9IjTwnGo61+sPUcoEoHhRcwpdFNxB5IOjmzf8uTI0C35OBxTvyhpu8h/yaowIyfpFxRq
 zgnEYHHm6h21JEWZKYrD1XxmTvO4cEWd4hWWkZlBCjlq5UUun6HBaeEU20pBcqdZEyIV
 SUYQ==
X-Gm-Message-State: AOAM533+tl/PlYiKmqVgzHBLsDyKKkK8W30o9b5Hj2F3Jlyimz01uota
 IK8w83kfyoJ4y2y3K28jX+0=
X-Google-Smtp-Source: ABdhPJzjNETgLRXE5zmLJIHF5Od05otTh5j/Sb/JD3W7Unyc0STwxcF2Y/1iz8u6zDLiGCgzVeKx3w==
X-Received: by 2002:adf:e4cc:: with SMTP id v12mr42411528wrm.92.1593862758810; 
 Sat, 04 Jul 2020 04:39:18 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id j24sm18657373wrd.43.2020.07.04.04.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 04:39:18 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 11/16] arm: dts: sunxi: h3/h5: Add HDMI audio
Date: Sat,  4 Jul 2020 13:38:57 +0200
Message-Id: <20200704113902.336911-12-peron.clem@gmail.com>
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
 arch/arm/boot/dts/sunxi-h3-h5.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index 9be13378d4df..91d8c2690feb 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -105,6 +105,25 @@ de: display-engine {
 		status = "disabled";
 	};
 
+	hdmi_sound: hdmi-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,name = "sun8i-h3-hdmi";
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
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -806,6 +825,7 @@ csi: camera@1cb0000 {
 		};
 
 		hdmi: hdmi@1ee0000 {
+			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun8i-h3-dw-hdmi",
 				     "allwinner,sun8i-a83t-dw-hdmi";
 			reg = <0x01ee0000 0x10000>;
-- 
2.25.1

