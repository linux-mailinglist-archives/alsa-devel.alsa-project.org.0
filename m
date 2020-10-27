Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A3329C74F
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 19:36:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CFD816BB;
	Tue, 27 Oct 2020 19:35:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CFD816BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603823799;
	bh=TlaKVXdkaBmec4tXS1T9gPnftMPH3PL+xEeJCkQRjjE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FTBwy7z3gfiY+/9V+4Us1f4q9WFadSI22fd8jOfCLmg3+uqRAzJbXp+GR9sqs14VW
	 9uciqG1fLiGryifBFi2fDyyzWDKTU0xigSJefR196GkBTyVNaVkejNdi75Usr175JN
	 FMUdEVy1y+VWl/o4xhK9aNXBdz7VtoKxohMB4U8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EACCF804F3;
	Tue, 27 Oct 2020 19:32:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54222F804EB; Tue, 27 Oct 2020 19:32:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B18BF804B3
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 19:32:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B18BF804B3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VTOeIPc2"
Received: by mail-wr1-x443.google.com with SMTP id n6so2997155wrm.13
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 11:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Id6RP1VS5hXJUMhUzwY34yVBORZ0nCdjPMNOwgBnW8=;
 b=VTOeIPc21SPDfrYYYmM4tXIGoNyCzGTE5YvPQ1ZxpCZrtRHKzyp7qaHleRwvHCQZBN
 OUMoABB8d66NAw4xhyJUDC1JR9d539NmmbQpncNXa7/8o8HRjGlfjMAE56Fh7GgH3it4
 ac5TamvvQT05upVyw7s4kaQlWMzWNFqwQ1rTbX2E4OY0/pGITpCYCsauMFgQ+FvZcXlp
 ZMeWyYu4pn1ivcmU7kBj2fhPr1+OxB1l8YxiE87/lz960eue7IxKntRCb0EjFV3zCfxh
 TvvjglS9aMRx7ai6Vn7o4u55OU/EjMu6gvWDC5OL0zhoIbjo1Y/ZKWVLJ15PITC1QU6v
 3u5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Id6RP1VS5hXJUMhUzwY34yVBORZ0nCdjPMNOwgBnW8=;
 b=I53HZIQE6H8L6jAFTekmRN2KbZhPqJ05oGhNzEa5adHG4Tz61ztd6QUzW99xolJ6YV
 aYk4jPEyAKUam33IaxSnzlRXjdumPHvDFq6tlXblBhjlHeQXQ3r8S7cIyPk8iSFqz+uP
 WB97g5fbvLeNLR9Nfy+nY4tuOeyWQCvEK2xmljB0/kh9aPD4XWMPbEBlq9ZTGzj2FQse
 FMuBw3atj0kwUd40UTR2xKPRLpVueRX7H610imEXIex0snHX7xt5LToVWubttGXJDNiu
 EE03zdEibDCKf3pXqzpfbhkL8X5oFPkJceiX+fYyaeGFAPed2rvzSDEe4XuhNnwXyBx4
 KEbQ==
X-Gm-Message-State: AOAM533GKb7u5EEiWxKVc/hT42OH5TefByeSFAHgvNsqZz8E3KU2xAyP
 qt0G/+CrYEw+zyzylma1SUQ=
X-Google-Smtp-Source: ABdhPJw8Wn6ERQSJ1vafvTcwkql50kuQIxHbMuKXVvBOYEtVy4RF0vMwn0Tq6O32lBxiusXzyxdh7Q==
X-Received: by 2002:a05:6000:1051:: with SMTP id
 c17mr4196893wrx.290.1603823524580; 
 Tue, 27 Oct 2020 11:32:04 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id m9sm2864148wmc.31.2020.10.27.11.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 11:32:03 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v9 11/14] arm64: dts: allwinner: a64: Add I2S2 node
Date: Tue, 27 Oct 2020 19:31:46 +0100
Message-Id: <20201027183149.145165-12-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027183149.145165-1-peron.clem@gmail.com>
References: <20201027183149.145165-1-peron.clem@gmail.com>
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

