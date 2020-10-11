Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1F428AA60
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Oct 2020 22:29:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 547E61696;
	Sun, 11 Oct 2020 22:28:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 547E61696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602448141;
	bh=jByL7wceUKemAIpsigGbzjkZTh11zuZWY1O+VcfPAy4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U9ue4eNAWA4Y5AVNIhbYTKQRhmMv/w6PHOf2mFM+POhJZjoXkBMixHuka8Rb8WJPD
	 6hc3b4Q9g0HtYsdc+1DvhiPMp7qYDQcLrmSFhbi0mEhg8FFoocQ2xfwQYp2ps4k1PV
	 9y0xN/UVDNeBHtQqAd+unSIxNcrCSbYTaQ/L05VQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DE13F802F7;
	Sun, 11 Oct 2020 22:23:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E810F802FD; Sun, 11 Oct 2020 22:23:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72C93F802E9
 for <alsa-devel@alsa-project.org>; Sun, 11 Oct 2020 22:23:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72C93F802E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ju9mLKlx"
Received: by mail-qt1-x844.google.com with SMTP id o21so12251335qtp.2
 for <alsa-devel@alsa-project.org>; Sun, 11 Oct 2020 13:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QarSYS8sybXOFMHVXdp4I9fWDCgninS8jZ0IjR0OesA=;
 b=ju9mLKlxw3juAmmBojbjHkfWaM40AnQp8UPcKR9h96fhqKzOMqWwGnEZDID6DR3PD6
 3gBk2vYF5hAInG8yvPmtrvzRw8MuT0lrDz2FL2DR6SZEgwEP9iCafq4D4qvEbu9ldojS
 DnA4PLUF4rSo2VWOz0oYvZTA3zDqlBH2kTKiWoJeiZE/lVuyJl3AUDGcGWAd2zQHdFnU
 RJkKwEHgxhqfgIelq7/a5fbtsxW26zxGBKcq2Tf6gr195EEZ8pcjuPKN+2QRdVfvpjuP
 K19DhIDCCKBs7ovkKovNi44F1XMdot+Cod7tZcKXx50zZ7oftOgeMQl+TxAsEeoJVEO6
 xzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QarSYS8sybXOFMHVXdp4I9fWDCgninS8jZ0IjR0OesA=;
 b=NYyOUXvV3CcsBH/XbaotH0/ezQYcfqmevURj26Pt1KBP1Fz7uPgHxqMGyipf+eLh47
 O0DMqgL3k/a01SBaa0dWmqlmWuf+YbDUT3RL5Si+nQY6ykiMvT6iAFExjXNhcBpqCn2S
 mK+XD29vLpSIsjX0IMjZf43BxfDZFMnIL6in0aOtpdbaYp7nL0sfAPFEc2n5b8c7JsTb
 cdMmgybCUupn6a0A3yUHGx36JBiTnDIqmomna42F8X+v/4ZzVWXFGdLcMIPsSr3Em2Pl
 5phbXQN45e0GiRFexvTqDvq/8kKHwXLc1egPRXc+PvS5q34O8nVzwgfD8ARlpT9kDIfW
 Y94w==
X-Gm-Message-State: AOAM531w7k+2yNC+sb5+NtUoDPY8wYdce+wYf5EGrKvx48c5hIRtf8xy
 E9+yIEB9/zRt8R9LPE7Cbpk=
X-Google-Smtp-Source: ABdhPJzAzixTgaSYROUXiXsGI/6tpDiPOrHpKW9piKnWZsPwlY75HYWNTT8pImJzm8bNjZpPZSTOqw==
X-Received: by 2002:ac8:3857:: with SMTP id r23mr7488303qtb.236.1602447781194; 
 Sun, 11 Oct 2020 13:23:01 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id c72sm2987778qkg.56.2020.10.11.13.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 13:23:00 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v7 10/14] arm64: dts: allwinner: h6: Add I2S1 node
Date: Sun, 11 Oct 2020 22:22:20 +0200
Message-Id: <20201011202224.47544-11-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201011202224.47544-1-peron.clem@gmail.com>
References: <20201011202224.47544-1-peron.clem@gmail.com>
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

