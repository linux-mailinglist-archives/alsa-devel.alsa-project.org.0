Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B87A2299654
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 19:59:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 550F916EE;
	Mon, 26 Oct 2020 19:58:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 550F916EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603738779;
	bh=pw5d5FnpqjZkbkA6Eq0B4iPgdRDJ2Ul2OuXptuDJGmU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kmkae90Ua/BKlTy4WFUoDFRD1yprMa/B4tbWZ7+Y1rcV5qXIqlYBG2QJk4MRgoIEu
	 RLMW3jjJXuJpdyVBBbUJuRPVIXVoIW4ZPmXQh5MOsZUqnSgxUxwWbTHjgCn3Wc5n1S
	 5fqdQ3C2V3kdDybC5Qlytcd6+jJBIV6Tg1y0mScE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5CECF80533;
	Mon, 26 Oct 2020 19:53:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30B2DF804F2; Mon, 26 Oct 2020 19:53:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B871F804D8
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 19:53:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B871F804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DIqiIhUh"
Received: by mail-wr1-x444.google.com with SMTP id x7so13935864wrl.3
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 11:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q/UCGl1ZdUoHsUHtTTTH+r1dTXLa/BTl7CcT5LFzhtQ=;
 b=DIqiIhUhonx804JA3IaeN4hYc06KnnU2EF1HKTwHNUhQNo9r3vUj0GlTOnUeYYaOfp
 OwS1wS7/1Nc7Tj+8oDShX9ZS+alIoPCpa092o7cB6hNb46HA8Woik4JR2hmwEoHtyFAH
 ubCydzwQZbyED/0Q/+ZIN6a+9CWlOfyDJP+bODHkx7B2Kdk4LBro1mm4taAYttUWjBlO
 T1GFKt0B1Zzh5ENqkUeVQW6nbSJnFuvkXXPwJjfKG5qViRhNc6jpYrkCYj80JNWk9wQb
 z1Iv2Hqz7m4AGNEICuni8oOXh59dlODCdTnGTWZSuOPtWqfV1JgINpGqiL25tmrW1Eih
 ltIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q/UCGl1ZdUoHsUHtTTTH+r1dTXLa/BTl7CcT5LFzhtQ=;
 b=CgVWBw/J+zHEw+UooR8OjgwadVOmLpI6Qf/6+TnV6uLw2e53x95EEXUqvFMPzb/kIj
 hQd5IUGWk7/7a1EGs3AV9cCW5aikjGwc6OXTI+eYMsGE3UAH+kPYrHd1lSp+FRBGSrZT
 VOeALign4wGm4EMyw8YKjkRDEHWYF/oiUxke82fzspUEF2Vh/+L4Ugjk/A+WvVc98XiO
 WjlQ8nYyb9/FF0FOvmDQfTmQkoYdEZG0WSMkHTNUxYOFNY5Ydx8pJR1UhKKruCNPR4ZK
 ejwngHI8TW7fHUWwUlinip4Ybuo6UYxXOBv886aCUg//6z6EJVqThThvxhXCHNv6bZC+
 q/6Q==
X-Gm-Message-State: AOAM532clFk3bX6O67m2yCsIuy6lKVQ/eSUlfuvQC4XEyDslqXYVW6Jr
 H0PA8RXEkyQ9USrYnBDMB/o=
X-Google-Smtp-Source: ABdhPJzt15q0t0XPBPjQPAJ/s6VmWe12hX+3q3e0QEM0Az41sDuRv5NLGwZwVlcatelVl1YVh6kC9w==
X-Received: by 2002:adf:b787:: with SMTP id s7mr20510174wre.390.1603738379048; 
 Mon, 26 Oct 2020 11:52:59 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id f7sm24885193wrx.64.2020.10.26.11.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 11:52:58 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v8 14/14] arm: dts: sunxi: h3/h5: Add I2S2 node
Date: Mon, 26 Oct 2020 19:52:39 +0100
Message-Id: <20201026185239.379417-15-peron.clem@gmail.com>
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

Add H3/H5 I2S2 node connected to the HDMI interface.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Acked-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm/boot/dts/sunxi-h3-h5.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index 22d533d18992..9be13378d4df 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -662,6 +662,19 @@ i2s1: i2s@1c22400 {
 			status = "disabled";
 		};
 
+		i2s2: i2s@1c22800 {
+			#sound-dai-cells = <0>;
+			compatible = "allwinner,sun8i-h3-i2s";
+			reg = <0x01c22800 0x400>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2S2>, <&ccu CLK_I2S2>;
+			clock-names = "apb", "mod";
+			dmas = <&dma 27>;
+			resets = <&ccu RST_BUS_I2S2>;
+			dma-names = "tx";
+			status = "disabled";
+		};
+
 		codec: codec@1c22c00 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun8i-h3-codec";
-- 
2.25.1

