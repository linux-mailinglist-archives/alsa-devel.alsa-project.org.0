Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7960A610E9E
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 12:36:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C0CD85D;
	Fri, 28 Oct 2022 12:35:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C0CD85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666953372;
	bh=xL6cdunFQPhqQdDdPq1G/OCy9glMMs5It+ki9qEi2u8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WMju0XA2Ad8e4WfgYnAgr+LHoyiUGLJJwzN6UvrPfmmC+KSIiBSOlriiudGQAMpxF
	 yQMpjX9xq3lCXII/y3CvxILmPp8QOoaBC1mDyu4udL0RWUcdOHiwQyo+Bmt6bBnkT6
	 eFwrTDkW0X98QlauyBaQeIAQeaww+yKwded1h5jk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6169CF80557;
	Fri, 28 Oct 2022 12:34:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF848F80551; Fri, 28 Oct 2022 12:34:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06837F8016A
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 12:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06837F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NNTAM0gN"
Received: by mail-wr1-x433.google.com with SMTP id j15so6050458wrq.3
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 03:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Ea1wwle1wP6aS8WKh/9HKEpPf2vMavxdmBWSIJ+2x8=;
 b=NNTAM0gN1azqcsIQcpxHh/vJKSdMlq2PNJCAVA94ROn0+UeZjBze0YQCH9cB+18hwo
 VgvcWgMIuAhlhk6w1cDK+uHp/sJfOcXvz1PgIFgyNMkXrYcTuqXmtW3kKaHsScmKCSiz
 sYYnwEiUoppjrmHhIbcmmWEfAiF+pRLfpYqWVQr4Kj786YQIc3KPec35hb1OZvGm9g1x
 JwGIMbyNm8lFyDjDskUL5VmSGSRNOH0ZQrf7gkhaWXdFYtrMX8hy1/+sl2gTtIlt35Bb
 ica46gWkMK7HiViHe73k0g5Jq/bPJQhaK8DGo4zI3Oo49JDMxPlzUMoDuIejti5yWx3Y
 oFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Ea1wwle1wP6aS8WKh/9HKEpPf2vMavxdmBWSIJ+2x8=;
 b=pvqO7VUNmyby4lOfnxQrcUiwnmXCBb2iDExA6oUfSKtemV8AGelGqWkX5w6ixIkhMt
 l7SlrJCSqv2F3qKpDgzBnSQSQKcjyOiK/c2YPUl+xxkI8TkFG6Ml/I7DT7IlIdSz1B3G
 anTQXGtsBzda9NhpOMBUASx9o0riGQq2TH15InzPPlFWl6p6tJR0lb/I58k3cxNaOhhs
 1AE1sKRwnjSyP2FDSz/cIM9UM8py1xS84GlVim2HfAkuSkL9eeeWgqEE8V2PfVrTW0C0
 znEUFwLnoe0pABc2ZV8vLzxRBMziGwdnM/GkKykB6Gp4gYFW1N09e0cfuMkRcUmx/qTW
 93oA==
X-Gm-Message-State: ACrzQf1DBJRHDj3VFcIsbK6aXxb0s48C0RoYS9fU4KKrvxYch886E+B9
 xQVZErRj+kNvhtXVIWBXKdGMWYeZtQQisAj4
X-Google-Smtp-Source: AMsMyM4QIDPnl/FJuOUa3z7Y8zZHoMcOpnJ+EsbVC9SdL2Uoer1FNZxCWJbIqQnW+zje1w/fVlULVA==
X-Received: by 2002:a05:6000:15ce:b0:230:a14d:997b with SMTP id
 y14-20020a05600015ce00b00230a14d997bmr35708359wry.370.1666953267858; 
 Fri, 28 Oct 2022 03:34:27 -0700 (PDT)
Received: from localhost (94.197.40.204.threembb.co.uk. [94.197.40.204])
 by smtp.gmail.com with ESMTPSA id
 ay31-20020a05600c1e1f00b003cf537ec2efsm4116465wmb.36.2022.10.28.03.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 03:34:27 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 tsbogend@alpha.franken.de, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v1 2/3] mips: dts: ingenic: Remove unnecessary AIC clocks
Date: Fri, 28 Oct 2022 11:34:17 +0100
Message-Id: <20221028103418.17578-3-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20221028103418.17578-1-aidanmacdonald.0x0@gmail.com>
References: <20221028103418.17578-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
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

These clocks arguably don't belong in the DT because there isn't
much the AIC can do with them in principle. It's safe to remove
them because the jz4740-i2s Linux driver has never depended on
them in the DT, despite superficial appearances to the contrary.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 arch/mips/boot/dts/ingenic/jz4725b.dtsi | 7 ++-----
 arch/mips/boot/dts/ingenic/jz4740.dtsi  | 7 ++-----
 arch/mips/boot/dts/ingenic/jz4770.dtsi  | 5 ++---
 3 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/jz4725b.dtsi b/arch/mips/boot/dts/ingenic/jz4725b.dtsi
index e9e48022f631..acbbe8c4664c 100644
--- a/arch/mips/boot/dts/ingenic/jz4725b.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4725b.dtsi
@@ -198,11 +198,8 @@ aic: audio-controller@10020000 {
 
 		#sound-dai-cells = <0>;
 
-		clocks = <&cgu JZ4725B_CLK_AIC>,
-			 <&cgu JZ4725B_CLK_I2S>,
-			 <&cgu JZ4725B_CLK_EXT>,
-			 <&cgu JZ4725B_CLK_PLL_HALF>;
-		clock-names = "aic", "i2s", "ext", "pll half";
+		clocks = <&cgu JZ4725B_CLK_AIC>, <&cgu JZ4725B_CLK_I2S>;
+		clock-names = "aic", "i2s";
 
 		interrupt-parent = <&intc>;
 		interrupts = <10>;
diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi b/arch/mips/boot/dts/ingenic/jz4740.dtsi
index 7f76cba03a08..bdd6f4d82ec9 100644
--- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
@@ -192,11 +192,8 @@ aic: audio-controller@10020000 {
 		interrupt-parent = <&intc>;
 		interrupts = <18>;
 
-		clocks = <&cgu JZ4740_CLK_AIC>,
-			 <&cgu JZ4740_CLK_I2S>,
-			 <&cgu JZ4740_CLK_EXT>,
-			 <&cgu JZ4740_CLK_PLL_HALF>;
-		clock-names = "aic", "i2s", "ext", "pll half";
+		clocks = <&cgu JZ4740_CLK_AIC>, <&cgu JZ4740_CLK_I2S>;
+		clock-names = "aic", "i2s";
 
 		dmas = <&dmac 25 0xffffffff>, <&dmac 24 0xffffffff>;
 		dma-names = "rx", "tx";
diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi b/arch/mips/boot/dts/ingenic/jz4770.dtsi
index bda0a3a86ed5..9c0099919db7 100644
--- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
@@ -238,9 +238,8 @@ aic: audio-controller@10020000 {
 
 		#sound-dai-cells = <0>;
 
-		clocks = <&cgu JZ4770_CLK_AIC>, <&cgu JZ4770_CLK_I2S>,
-			 <&cgu JZ4770_CLK_EXT>, <&cgu JZ4770_CLK_PLL0>;
-		clock-names = "aic", "i2s", "ext", "pll half";
+		clocks = <&cgu JZ4770_CLK_AIC>, <&cgu JZ4770_CLK_I2S>;
+		clock-names = "aic", "i2s";
 
 		interrupt-parent = <&intc>;
 		interrupts = <34>;
-- 
2.38.1

