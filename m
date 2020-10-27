Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6261C29C793
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 19:38:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F366D16BA;
	Tue, 27 Oct 2020 19:38:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F366D16BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603823934;
	bh=pw5d5FnpqjZkbkA6Eq0B4iPgdRDJ2Ul2OuXptuDJGmU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nz402VDM2mtz5gMHvRbFHJidX1OucRj8x7U6/Yz5kVPlzyLmNkNivTZ/adMdB9+DC
	 dnEGaWkqUWkj7iDnm6bViSmD0R6tgWETNxnsEDL7K36Q/uuXxz3GNJ8AMjomKuhwcx
	 8VQ2yRksyz3EmBelOsUGjs8y4A4VvaOLB8WsjMlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9620AF80535;
	Tue, 27 Oct 2020 19:32:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EABB5F80510; Tue, 27 Oct 2020 19:32:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0BA1F80240
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 19:32:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0BA1F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Pfr8LfXe"
Received: by mail-wr1-x444.google.com with SMTP id t9so3006131wrq.11
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 11:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q/UCGl1ZdUoHsUHtTTTH+r1dTXLa/BTl7CcT5LFzhtQ=;
 b=Pfr8LfXekgJDgiB00izNoFPMw/I37mM/7+6wMKbtWF1lt/1KKV/RroYMm5GZl4r2Jp
 fV8azX7bw3Qd0ijdnIbPmJutyYqCsY4VGXk7dT08gqDH+/k8OOPbf2/uyrXKj0QQkXOM
 plF3GQeY5fYu8wz6/EFme3X5sNC4pCbeX8AWeTcXC8Hlem2N96ZzmFbDNR1GZStQTMrF
 1fIk8lLPs3M9GPEg2AanaQG7pPVqH1YaZI/Z8F9h/n4wHdSnTxHOYO4vVIViU8HX5rVX
 np5DttlcfXurv59lB5/ePCSB8Xk/a+0F6s4e05EGKVdY2810VXH/q7Y12ShWtzlBlc/n
 jz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q/UCGl1ZdUoHsUHtTTTH+r1dTXLa/BTl7CcT5LFzhtQ=;
 b=qVjzWeTNIChE4/oa5EWkEn6zoXWwKLo3pp1OxO+RpXgS0pm/kP4Oo5mzdBzakQLrQX
 +Amge3p4AIBH/DUzOGQnvq7Ujyg7dIWj5Fy9ZzM0D8RRA/nJqJd39HpLgaO4OSRzTOtA
 h+OoNTMPiKEBYroqh5TE/VeZcOxJeq6evl0xp7zTy7mvp6aJASiakNpV9HlNiGGku399
 cisMmLuwBjLL9hIzNSgvU4tWuTU4WwLEWy/htBWPN3YorstA/XlHjAAkpJ5M16Phu1SN
 lGbTeIPMD+Wkd5OOUtfPE/p06of36KiAaGiUtteVzbrHeSc23NWJcPEuDJZCtlrlxBKz
 RrIg==
X-Gm-Message-State: AOAM531mB6BXTlQNMGxm9v7RbX3MUxS2a/68gj3Xv5b3C/VrRHj0YSMV
 2T33XLactKc1rW6hJ9AdH2g=
X-Google-Smtp-Source: ABdhPJwhFW4p11PRPRjqU1y0w+YYxj2DBunoDsyybko3hOVhBLWs3c5PW32LwGnLVtKSKt15uxCGYg==
X-Received: by 2002:adf:c101:: with SMTP id r1mr1339948wre.87.1603823527910;
 Tue, 27 Oct 2020 11:32:07 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id m9sm2864148wmc.31.2020.10.27.11.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 11:32:07 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v9 14/14] arm: dts: sunxi: h3/h5: Add I2S2 node
Date: Tue, 27 Oct 2020 19:31:49 +0100
Message-Id: <20201027183149.145165-15-peron.clem@gmail.com>
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

