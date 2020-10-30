Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CF82A0889
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 15:54:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02EB51687;
	Fri, 30 Oct 2020 15:53:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02EB51687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604069675;
	bh=pw5d5FnpqjZkbkA6Eq0B4iPgdRDJ2Ul2OuXptuDJGmU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fmjl96X7DtfJ15PIVByEF/MhicxmO1UWSV6DZapTg8Zz8Kxz6UHnBVcYTJtBoMrNG
	 YAf2bYlIq+TuIH0Gyybk4xKnsFcrM1hppo+QH3lGF56kYLotHre+aHKajIMx8EJB1z
	 vX4nCkTtOAM4f6OqoAdg0hnTBn7AZRZAJXy1wDWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A9DBF80542;
	Fri, 30 Oct 2020 15:47:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68DA2F8053E; Fri, 30 Oct 2020 15:47:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2524DF80535
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 15:47:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2524DF80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="L8NewlTl"
Received: by mail-oi1-x241.google.com with SMTP id d9so890915oib.3
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 07:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q/UCGl1ZdUoHsUHtTTTH+r1dTXLa/BTl7CcT5LFzhtQ=;
 b=L8NewlTl2v389QZz8ht74WOfDH8lbv8sEbUY62YMCIc1MPp0XqhWtIMQqyPK3Pbht7
 ic/aKAjTU+oGl9cnLGAUGJNVbZtCWOrn3T6Yjn9urVLbuARWMhwAKGPdPhP+Qs67XDYh
 mgMnHLLQIIs7XW6W+fPNuP+y1CiKhY4GnokUwNW+llbZj01BG5W5PEOWjk32vSWuuQOl
 EPtw2ISuQhuma8JYz8Oqi7HRk7zkxJaQkSaQzBD/e3DYjcMpL8kr8Q4roHHaYKg89G8C
 qL2tKrkikxgmmTGDX5F4APhCYiPRZVe47aXA3byMHRO3cx2u6JsdOBeVfRwKzv5MZ//1
 +Yaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q/UCGl1ZdUoHsUHtTTTH+r1dTXLa/BTl7CcT5LFzhtQ=;
 b=b+hCa83h6iKQYrm3KUTvYfDtBGIQid9vAi4HApwxn3JEsER7egGS4NKwghvBQf/MHq
 sHBt3AS1OOJvdA1VFz5eqw4YW8uQfPrmJqmwLN8jreBnIUavL1TIlHBPs+mWAf/OnktP
 x4QBjRKtIN75+yZr4qzV1gRJPBtMxH19Zy0jbrB4lRts1PcGSniV8bF3jGRM4E4VH0Rk
 PW86HtSY2WzEJq7ANtQKEiKf3toMqmkfXSRPzGtO+yojZZbDYoEqbtNgvNo5jwA/5VeH
 GcSrYmmhy+ZujM8OhMXg76/q3EF1OQ3rTevuTCpEJpPMfNiu3kbFMgWdWAi6h1RO7EAO
 r/XA==
X-Gm-Message-State: AOAM533Ku8iryn/lD4+SnHqZFIlxszJhYDx5MyEHe8brsEbvN52eDIAY
 +0W8F1d5TKUWaDvP1C3w4Fw=
X-Google-Smtp-Source: ABdhPJwnuy2Hle+FbWPJ+65edNgwFb56SDLKD8JH7gKIYhEi8Q4jZAAu1NPE1Wv/nSiQZuWwCNMFqA==
X-Received: by 2002:aca:4d14:: with SMTP id a20mr1789519oib.46.1604069260878; 
 Fri, 30 Oct 2020 07:47:40 -0700 (PDT)
Received: from localhost.localdomain (213-245-241-245.rev.numericable.fr.
 [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id s20sm1462856oof.39.2020.10.30.07.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 07:47:40 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v10 15/15] arm: dts: sunxi: h3/h5: Add I2S2 node
Date: Fri, 30 Oct 2020 15:46:48 +0100
Message-Id: <20201030144648.397824-16-peron.clem@gmail.com>
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

