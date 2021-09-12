Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C244407C34
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Sep 2021 09:31:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9743C166B;
	Sun, 12 Sep 2021 09:31:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9743C166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631431916;
	bh=5AhHeWu0p/+giOeN7V2vyHrhBZvW/1aJVJMD+m5TRJU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aZz6MXYavW5V5lIAM6BL063PLxsv0gKRt1q4hT3iRlW77F24QnnI9VeIdkw06LcH9
	 DE16LcdCTKcuose4iP73x1PgGl0ToaTzhhoJhSVtiRKDfoLzKhicTzSGJAg/ir7wg+
	 KFC2VAQiqvg4ni4cYokucBEHhHo9gS2og4LY9TEs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 741F8F804E3;
	Sun, 12 Sep 2021 09:29:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C4B7F8025E; Sun, 12 Sep 2021 09:29:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC31FF80128
 for <alsa-devel@alsa-project.org>; Sun, 12 Sep 2021 09:29:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC31FF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cKXO0Kuh"
Received: by mail-wr1-x431.google.com with SMTP id t8so4374170wrq.4
 for <alsa-devel@alsa-project.org>; Sun, 12 Sep 2021 00:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p8XhEt4Fmunfa8NpIGRPQuJN1xu6qouTV5IkQcF+ghU=;
 b=cKXO0KuhajEgiGk1+uT4HTy5EyOwfRg/XscYGA04SmmiTfiwVzN5cb8yuTT+w1S/tc
 fHHVCQoE52EXSOh056ofPSHaNg327CEj2v3BkOpPgPl1R7Chrtp2BYKHp9YUrgB5WIWb
 pk1rOUYa0txYlOq9SCialmsGXlsZLqTHzD0vE8u5yh84Dnff4sRu/9b5J5z3igoVcpaR
 MvFo/IMAILvxNbVjxGT5PJApS40MYHBmcCYwEm/BSshsevBBOuMJjf1Py9eRcYaJE1q7
 qMgO97pF+3YnVuj7+wSwObrDEFuPuzoQskz+UmD4Du/e+odHpEFFLGK98DUkaPDhXDBL
 GSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p8XhEt4Fmunfa8NpIGRPQuJN1xu6qouTV5IkQcF+ghU=;
 b=2A8Eik8o6MerDtWU/BQbhRLs3MZp25ydjoPpYEOOM7Hz88y2MbShfuwTEPoTSvjJba
 o33DTs5b1u23tsasS0+YAe8zFAGcTZPg1HWOtJ7vFF1Fsih1Eq3tcAfQvJfFIt9vlveM
 jsI8Kl2k9AOrQnKudFFaf1F9EibRJvS2uiMhbP9Q8nhgpfTnakoGpld+NmE6gX6WUTv2
 g4PmYW0KcZ/uqHoNY/XXR/ctYXPvtbJgwBVJwBRH9qZVehvq+/jOr+aPFifNXcu31Pj5
 X150k9oZw2wHKpN1UaQyV4kScBekY2NEwlTltjoZEr90NMz/TyuweYsuqw6Tvc1g+6Ro
 rBaw==
X-Gm-Message-State: AOAM531BFvj5M9WF1fYH/rAWmvHtLNGBZEgEnJgFnM1NyHKA3XxHjgbj
 n8YOwSxGN8yseYaTcNUj/rI=
X-Google-Smtp-Source: ABdhPJw8j95ed8Tv5MAZwOMVe8G4B4HBMDkVEHQ3XC1PQKwL8HHqVAy8O8rZnTdOeGzxz6l+b1oylA==
X-Received: by 2002:adf:c109:: with SMTP id r9mr6361561wre.184.1631431764810; 
 Sun, 12 Sep 2021 00:29:24 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net.
 [86.58.29.253])
 by smtp.gmail.com with ESMTPSA id t18sm3584889wrp.97.2021.09.12.00.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 00:29:24 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Subject: [PATCH 2/2] ARM: dts: sun8i: r40: Add I2S nodes
Date: Sun, 12 Sep 2021 09:29:14 +0200
Message-Id: <20210912072914.398419-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210912072914.398419-1-jernej.skrabec@gmail.com>
References: <20210912072914.398419-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 broonie@kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

Allwinner R40 has 3 I2S controllers, compatible to those in H3. First
two are routed to pins, while third is used internally for HDMI audio.

Add nodes for all 3 I2S controllers.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/boot/dts/sun8i-r40.dtsi | 39 ++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
index 291f4784e86c..1d87fc0c24ee 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -736,6 +736,45 @@ ir1: ir@1c21c00 {
 			status = "disabled";
 		};
 
+		i2s0: i2s@1c22000 {
+			#sound-dai-cells = <0>;
+			compatible = "allwinner,sun8i-r40-i2s",
+				     "allwinner,sun8i-h3-i2s";
+			reg = <0x01c22000 0x400>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2S0>, <&ccu CLK_I2S0>;
+			clock-names = "apb", "mod";
+			resets = <&ccu RST_BUS_I2S0>;
+			dmas = <&dma 3>, <&dma 3>;
+			dma-names = "rx", "tx";
+		};
+
+		i2s1: i2s@1c22400 {
+			#sound-dai-cells = <0>;
+			compatible = "allwinner,sun8i-r40-i2s",
+				     "allwinner,sun8i-h3-i2s";
+			reg = <0x01c22400 0x400>;
+			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2S1>, <&ccu CLK_I2S1>;
+			clock-names = "apb", "mod";
+			resets = <&ccu RST_BUS_I2S1>;
+			dmas = <&dma 4>, <&dma 4>;
+			dma-names = "rx", "tx";
+		};
+
+		i2s2: i2s@1c22800 {
+			#sound-dai-cells = <0>;
+			compatible = "allwinner,sun8i-r40-i2s",
+				     "allwinner,sun8i-h3-i2s";
+			reg = <0x01c22800 0x400>;
+			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2S2>, <&ccu CLK_I2S2>;
+			clock-names = "apb", "mod";
+			resets = <&ccu RST_BUS_I2S2>;
+			dmas = <&dma 6>, <&dma 6>;
+			dma-names = "rx", "tx";
+		};
+
 		ths: thermal-sensor@1c24c00 {
 			compatible = "allwinner,sun8i-r40-ths";
 			reg = <0x01c24c00 0x100>;
-- 
2.33.0

