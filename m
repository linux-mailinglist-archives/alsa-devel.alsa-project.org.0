Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA5A25CADE
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 22:36:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F75F1A98;
	Thu,  3 Sep 2020 22:35:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F75F1A98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599165362;
	bh=boSYUpAFaV1HcTVn+7H652mrbdplQWGEROHV+TLKk8U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JrzFOiDYz0P5tAqzOrXvaARTyAKb0jdt239WpL3WsMoEwq1Deaza3kQgx/yChd7de
	 7nsLBAnuKINiVeC64/FgnDBFBOZQydS/LE6uOOnxN5R2Jl4DjL1uqBb8SXR9cAUhyW
	 1rM/KJCs7g13IX8YmdA3i78RGR3OilrZFHCjLrlk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E2DBF8032A;
	Thu,  3 Sep 2020 22:31:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFE75F80331; Thu,  3 Sep 2020 22:31:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB99FF802DB
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 22:30:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB99FF802DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="q65xxxeb"
Received: by mail-wm1-x341.google.com with SMTP id o21so4156060wmc.0
 for <alsa-devel@alsa-project.org>; Thu, 03 Sep 2020 13:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=enpKzUiBmoSBJ4eITLO8PaawwyRhwbwKqDOCyrD6nZM=;
 b=q65xxxebQ5o0CGBL7V0pXVWRuuEQJXqkTJ4fvQTtbbZtdVPp1+1K1jDEF74acvpUba
 AQ5Hx9JAdLnM4rGo9B0DlcNSdUdUk4BaleSAIK190wD+JRW2XEpzGjoSr4VeKBJ/8GLw
 3vDbrFNbL/AVczZaL/iB4NeNmxme+z5ET5q+bakPEvtFAROuvh5NrdwbxTX/0sI8wRSm
 KRxOWPsMz4qfLu8dnCp5oN9MZqqt2/AsJWiS4SKXWfyzqYSDkIbj+h2rcYNJHAzFvSn1
 KurPOpAP+ArNQAlvPJlol6XH6TK7Omo608AD8RXHRcgUC2BzZ1YMJliWNK5BKECnHJuR
 UdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=enpKzUiBmoSBJ4eITLO8PaawwyRhwbwKqDOCyrD6nZM=;
 b=M0nmIjSqDgpS57Lk8QrEH6AW/6FrG9+I5WPFJkDYGuGRkquj+n1arZ6VZCo9We7ZZD
 wGqEVJEZB1sW9kcUlEr3971bJC+hz19IQjwEqWnHWHc+HvmS5l2VZ7iIbwT+Mka0REDn
 BQhQB0X59Yh79r8JFc+5RaoxLVlAVDTemq/Unlj/axWFvVxRiNNpB68gJNl7tz6HkeK1
 WJq2nbD6ZfUnYGZlox6uFKqXMFsTj4lOmc2fefFtt9gP9Yi6qVMePcxqqxr6OUpYBqpR
 ZhKBJHHd3uiBzgjkFGJdoFqBd6nugVSXS+a9grbWCmMaXFOBfjIAPjgLInv0Fo7pp/mI
 CT0A==
X-Gm-Message-State: AOAM532CC8nx7VzGWSaUocHSU+wu9MuChe7/YPExFbcdheg1C39piaSA
 B9fiUm0mtaiv3J0zloBQ28M=
X-Google-Smtp-Source: ABdhPJxkFH2OLYuxAHxFrqCP+1QlNdTrnstdo4sIsV5Hxm1M+fvSoQbG7ckceLE1d4Lijogw88crTw==
X-Received: by 2002:a05:600c:414e:: with SMTP id
 h14mr4115503wmm.2.1599165055122; 
 Thu, 03 Sep 2020 13:30:55 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id q186sm6818274wma.45.2020.09.03.13.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 13:30:54 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 10/20] arm: dts: sunxi: h3/h5: Add DAI node for HDMI
Date: Thu,  3 Sep 2020 22:30:24 +0200
Message-Id: <20200903203034.1057334-11-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200903203034.1057334-1-peron.clem@gmail.com>
References: <20200903203034.1057334-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Marcus Cooper <codekipper@gmail.com>,
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

Add the new DAI block for I2S2 which is used for HDMI audio.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm/boot/dts/sunxi-h3-h5.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index 22d533d18992..3dca6d89cab9 100644
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
+			dmas = <&dma 27>, <&dma 27>;
+			resets = <&ccu RST_BUS_I2S2>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		codec: codec@1c22c00 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun8i-h3-codec";
-- 
2.25.1

