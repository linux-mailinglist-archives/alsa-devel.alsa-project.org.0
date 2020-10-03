Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 241DF2824CC
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Oct 2020 16:29:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B74CA1AEB;
	Sat,  3 Oct 2020 16:28:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B74CA1AEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601735351;
	bh=pw5d5FnpqjZkbkA6Eq0B4iPgdRDJ2Ul2OuXptuDJGmU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gxYoQdbewVGQcG5Gtq7agJJ03q3WK4eaKYyssfktDLgH+l3NToui23UX1Kke4Y9RZ
	 UHjqqZysIi+ad8+hDbc9IW546OM7M9Hii7fW+IElowfGjbh1jE8hxckvcbNnMjpYHi
	 hhGxqfg6+SZ8Wf7TtNIUAvhVqMMK/n8CW7uNPWbw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D381F8034B;
	Sat,  3 Oct 2020 16:20:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08C2DF80339; Sat,  3 Oct 2020 16:20:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAB65F80331
 for <alsa-devel@alsa-project.org>; Sat,  3 Oct 2020 16:20:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAB65F80331
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="u8GC3+J+"
Received: by mail-wr1-x441.google.com with SMTP id k10so4853692wru.6
 for <alsa-devel@alsa-project.org>; Sat, 03 Oct 2020 07:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q/UCGl1ZdUoHsUHtTTTH+r1dTXLa/BTl7CcT5LFzhtQ=;
 b=u8GC3+J+LJHL0bHYqdtwcb3saMTpTg/ICMHyMfYfjlApBBb4bwA+VHYb//eiAZZMwV
 3xmfzwIbOsqMMYb9IaDEZEW/OGpDmXSg/+Vn+/x00zBkbN6N4mlp6nhEB6G9jsGMVLTO
 lVH7H2i4jWa+FZvUauEfJBPYJFK5dilmhU/Yxs2XI2ElpomZq0rsrYySZ9CwgjE9EnFv
 vpSurOm8cd03JBQvYfTW07dTigWjso/hQQUchefNbaVLHHI80Ozb+pyG0pJ+619nW3QT
 fJli5utqMvduQ5cmsuZCSOlz+l9xlRe9BoTULGcX/DaCpmfuMhHbJqq6+ZyX0RmLlCfj
 S4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q/UCGl1ZdUoHsUHtTTTH+r1dTXLa/BTl7CcT5LFzhtQ=;
 b=GsSikyLZUczS5qGTDpGsUrsI0qa8byGoKXWiv09SMqU2yF61gPATYlnLjZH56r5Wki
 keHi7bnta2o4bmmz3axSL4x/bQTD6fyyWST3yxWt/SynEN+0HOP5AgX7QMuDfiE07iO9
 TZhH5gqzfog33/SqCo5lKAvN1bPfvqBgEBI/tc8e6UC3kzY/gQKQzPtRnlv7Q6rPMzhL
 WvvuLVKEZbHzc1njglvwg8OJ3uwhVhL+IAWPynujKr0V6y4l8iWcpTeR1ZjPwPsdVLci
 F5V4jYm6IlHzGqulvhNxTOUoAZh5I0umR/4JP1Bdz0iK94a6M42H5MalIOd7A4cDi82x
 c+cQ==
X-Gm-Message-State: AOAM532S4XKkCqUulqztgvZ+SyWRQo6nRHj7Mor6YeREHyToCRpdxlfD
 IGv/5zYQSN3TxMjiH9pUATg=
X-Google-Smtp-Source: ABdhPJxHfyuLH8+eJsmhPM4gM03KPgUvXhOFVldQ+mJwiPnHNBL32S2zcjp6aubvOgLXigkLM11n9A==
X-Received: by 2002:a5d:4486:: with SMTP id j6mr2306431wrq.278.1601734824252; 
 Sat, 03 Oct 2020 07:20:24 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id d18sm5417473wrm.10.2020.10.03.07.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2020 07:20:23 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v6 14/14] arm: dts: sunxi: h3/h5: Add I2S2 node
Date: Sat,  3 Oct 2020 16:19:50 +0200
Message-Id: <20201003141950.455829-15-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201003141950.455829-1-peron.clem@gmail.com>
References: <20201003141950.455829-1-peron.clem@gmail.com>
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

