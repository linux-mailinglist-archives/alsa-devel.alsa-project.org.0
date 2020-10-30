Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 827F12A087C
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 15:52:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24DA01663;
	Fri, 30 Oct 2020 15:52:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24DA01663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604069579;
	bh=jByL7wceUKemAIpsigGbzjkZTh11zuZWY1O+VcfPAy4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FiGJ3ckRk92R9Zz1ImaCue3XnX+TRmcKosqGnN8IMvH49jptT1/a4j7pMsdFY482A
	 L6tbjHJVCt4O1yX9Fm31TddXx2/xXlAMA3pR7gID+ZTFaBNRSiIXaaX7hoxyOaIaj5
	 3AdIvTzhwA4Ar8SyEJZEIYFpiIo2K3lNhUJjZGjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99252F80524;
	Fri, 30 Oct 2020 15:47:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4754EF80525; Fri, 30 Oct 2020 15:47:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0036F80508
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 15:47:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0036F80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NgX1FlX5"
Received: by mail-ot1-x343.google.com with SMTP id z16so576688otq.6
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 07:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QarSYS8sybXOFMHVXdp4I9fWDCgninS8jZ0IjR0OesA=;
 b=NgX1FlX5YkyHohpOSQ2l9OML3jroD7MZvSCFKsqgsoG7fO5zdOLRWBbP++Pmt27xis
 ugOsJObZ4nCGDZ5ef+lgJJka6u0Y3baTlLSNlx8UnOQCfOznmJnEkZOJxMi9xImoy2li
 wHXErFRIA4kpRLraXBUbPIVT8OnNLJZZTMihLaPW9QcbYRNA6YFOEuhUSftV0N52l1ht
 W6nNcbhf+AQjCdDWOxNmxYH4ltln9u4ssE9RP9kYr/B8pBx8KmYmbx+P73go6KFo4WGd
 0sldLajjud0wG1MMsqLiyhWkevIlThuoX+eImNK3l/DxMwsYb7PzyUNf4sTFkWvWEV/O
 X+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QarSYS8sybXOFMHVXdp4I9fWDCgninS8jZ0IjR0OesA=;
 b=Rj+ngC6NfYQbFmHXCCn7S01lY/sanvlm8Z3kNALlY1+w8x55jlUNyFRANVNzTYWOi4
 q347dgjhcOHgEjDLh+/eH7fVnVU9nKECE4b8JYIPl4yTWFubUHN78RVL/s3stet/qp3b
 Hpc9qyps9u40QVVpd+d6Ghyiq9pDs/eJGACh6miurDNm3LgAMSY30If/ayL4FVOWDAaY
 HsIhZKzBAhvL8s/1871NpiDB4+7JzLkw6WEwigYD1ZL5DQRMX/d9Ep0sbiY5W9qPXUjv
 shFxCSSz4YB6Qr2egzxyQr9Rg9yZaXq4I/pmi6H70vqAr96dGjzPI4o+dgKUEcrrZ3ZT
 mriQ==
X-Gm-Message-State: AOAM533q74avfK1G0HxGCEUL8+QAmJi0vByzX9InuCJa7ZIlz4M7dJ+1
 CmK9M2i3QYhfytcyXL93st4=
X-Google-Smtp-Source: ABdhPJx3MWI3HyQs3AtAuz2YanJIJ4mGqrfUrBvH2doCOj6pGUPRyX84UJrWnFLA58Nis8V1qpR9OQ==
X-Received: by 2002:a9d:5d2:: with SMTP id 76mr1786858otd.99.1604069249008;
 Fri, 30 Oct 2020 07:47:29 -0700 (PDT)
Received: from localhost.localdomain (213-245-241-245.rev.numericable.fr.
 [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id s20sm1462856oof.39.2020.10.30.07.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 07:47:28 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v10 11/15] arm64: dts: allwinner: h6: Add I2S1 node
Date: Fri, 30 Oct 2020 15:46:44 +0100
Message-Id: <20201030144648.397824-12-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030144648.397824-1-peron.clem@gmail.com>
References: <20201030144648.397824-1-peron.clem@gmail.com>
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

Add Allwinner H6 I2S1 node connected to HDMI interface.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Acked-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 28c77d6872f6..d915aeb13297 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -609,6 +609,19 @@ mdio: mdio {
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
-- 
2.25.1

