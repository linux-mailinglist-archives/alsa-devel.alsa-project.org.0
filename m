Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4775C29964F
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 19:58:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD91616DC;
	Mon, 26 Oct 2020 19:57:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD91616DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603738722;
	bh=TlaKVXdkaBmec4tXS1T9gPnftMPH3PL+xEeJCkQRjjE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K5T14tb1fcV6UA8NCj8e559Q+5z64eYEcad/awV2OxAPhtUL4eOSw1b9W/Tow4wqB
	 RQbf+4i+RghBG2rmnLalE0D5MrCQjmsWhuo7vGfV0lM4WOh9sEd+uHo6Jmi9EPmP5V
	 jZkXkPHLSE8BMKy/FVWejeZttl8Aa02+EdInC0lI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76CC4F80519;
	Mon, 26 Oct 2020 19:53:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 658EAF804E6; Mon, 26 Oct 2020 19:53:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B311F804CA
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 19:52:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B311F804CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WlXgi3ym"
Received: by mail-wm1-x344.google.com with SMTP id v5so12730387wmh.1
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 11:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Id6RP1VS5hXJUMhUzwY34yVBORZ0nCdjPMNOwgBnW8=;
 b=WlXgi3ymiC/Ubo/PzKwduzc4BIThfTVXjlRLU4CHZSknn92zErmgO84jYxWUTyYyCL
 YpSvJ1XB2cYCyWzRrpdXYjdiMMprVs9FCJEXzR+p43kkMa8G16C2Pvu+OXyxdMwoqRLL
 EX4+mlJqVx92boQCiTBE+aSCk3k0k/eoyEh7kRn00cVnvdgGhZC/cb8uUYdLcmDjJ3wA
 54kjh2qL863imX1xYwi/ZFXB4+kLiufojw1o8LdLKOD0/+MKmIfHyqJ7ZcdV0rbKtVNh
 f9dRRMwYxBJXg8yaIXWjJwIJpnbAUQlCnpm5qXwRaV4trcvTcDHUHXE5oBUy8Jf3XXp/
 qZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Id6RP1VS5hXJUMhUzwY34yVBORZ0nCdjPMNOwgBnW8=;
 b=uHBEUi70uvEjEfoj8Ha4lOgcZcFAJEoa/GB5cVa2+xGmOfEQPMJJXQPyVi1sDfTMhJ
 o5tnbRqGVuy6qruCHmuCrlPaFyqzyxlq3GhYoMlZEq46YPzNxGgT/OUmC6vToSwAL28B
 Yw7fBd1KDuyRYHxfxhm7DuRbkruMZ16kOCdwpKMatuiPbhbPFDdAXwt0SARcKaVaxp4C
 mLK96/q/k1Fq0VCkBSyOIt2fPrLoJikAxu/1qxCU1Z9TbV1aFswdyVrQbwoonJ0wOVW6
 9fnVv65RY0Me0hh/N3F7jTSwu9YsCDc9tUKJIOIWs6Ju2x8q6K4P5sA2iKB4w6nkQ1Ha
 M0jw==
X-Gm-Message-State: AOAM532+5CwtKBK7Rr/W+PCGnN72IXN5ZddleWHLWIrEEfOcpb6aJ1IX
 BwvCQLN4wpgKExC/H2OCTI0=
X-Google-Smtp-Source: ABdhPJyN4CjTNG4J5Ml9NRNFEcWr332Wcn8VdYW4a5pi8ZXoEXVceEdrWEj8A0jVkbJ6B+hg437e6Q==
X-Received: by 2002:a1c:48c3:: with SMTP id v186mr18754491wma.16.1603738375499; 
 Mon, 26 Oct 2020 11:52:55 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id f7sm24885193wrx.64.2020.10.26.11.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 11:52:54 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v8 11/14] arm64: dts: allwinner: a64: Add I2S2 node
Date: Mon, 26 Oct 2020 19:52:36 +0100
Message-Id: <20201026185239.379417-12-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026185239.379417-1-peron.clem@gmail.com>
References: <20201026185239.379417-1-peron.clem@gmail.com>
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

Add the I2S2 node connected to the HDMI interface.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Acked-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index dc238814013c..51cc30e84e26 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -846,6 +846,20 @@ i2s1: i2s@1c22400 {
 			status = "disabled";
 		};
 
+		i2s2: i2s@1c22800 {
+			#sound-dai-cells = <0>;
+			compatible = "allwinner,sun50i-a64-i2s",
+				     "allwinner,sun8i-h3-i2s";
+			reg = <0x01c22800 0x400>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2S2>, <&ccu CLK_I2S2>;
+			clock-names = "apb", "mod";
+			resets = <&ccu RST_BUS_I2S2>;
+			dma-names = "rx", "tx";
+			dmas = <&dma 27>, <&dma 27>;
+			status = "disabled";
+		};
+
 		dai: dai@1c22c00 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun50i-a64-codec-i2s";
-- 
2.25.1

