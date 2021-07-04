Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 499A33BAD9B
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Jul 2021 17:05:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8B9316A5;
	Sun,  4 Jul 2021 17:04:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8B9316A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625411137;
	bh=+OWXB0SVuxqCZ/DNf5CJA5uZ9uvw25rUj4kUEH6F4xE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q6qK4TDHCgXvrUZYkEVJ1PS0I5mYAe7+I/vZv+/7FRV3G8qvbLwR6s1yHYQ6VIwYy
	 +Q8CmPb5NJL2c/1Ryz8T65Et5Ub3TkrnU6JyGm5n82zo3YGkpIAgsR7eCo2u/f8s0d
	 12hI1Qng2ySzN/6FSgXhnGXBs93WwCS84fDc0elI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1347F804E7;
	Sun,  4 Jul 2021 17:02:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B489BF804E6; Sun,  4 Jul 2021 17:02:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15235F80425
 for <alsa-devel@alsa-project.org>; Sun,  4 Jul 2021 17:02:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15235F80425
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YocJjm6n"
Received: by mail-lj1-x234.google.com with SMTP id r20so6336854ljd.10
 for <alsa-devel@alsa-project.org>; Sun, 04 Jul 2021 08:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rG8Wa9DCPn+LJLpCJ8agJSEaH0afH0syVdCVNBofvlc=;
 b=YocJjm6n9bM4Z2Y+D1N1nCcOZKsPF8y7tfeprCgumybmWRfVWqIS75Bq/NmZbdjIyh
 8HskQqleK77e03XhE+Rv0Hoh/05IWd4i+l6zioD56vE+iom+XA5gZn27hpSoHda8s6vi
 VCgTrpVumPjXTxLvnaWYD1CdzPmVHi/LDmAtohu4f32L7KX1Zx8J/0eFl+DzjfaiwHaD
 fZW026LXabirhhW+pmK8M2BvQ6OubZeHmtUVgZXaRJWYNs7FVQsYoVfF0EAIsuiozk+d
 SYBCoT5482YWbt291Bx8FSrwO3HtSLzLqPGK3a2u9is1P83VqGErm7Qqmb7t6vdznDHl
 swcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rG8Wa9DCPn+LJLpCJ8agJSEaH0afH0syVdCVNBofvlc=;
 b=fTQ4ElFeMaCVyFOrQxZbzcPq132JdVNa6YYix52EQHiJ9O6UPp4d0xOf9FzTjZeWJB
 uZsopH/Q4aCM/khnYQrlXWH6qdFNdi/axM5DGaelftqQ7QX8u3H1SWqnCuff5QFqnAkk
 vmxEW8ih48Nmb6EGr7FnpwIGqBqzjDUjHcj3tBkAR/yrEKgflb0G0Msty8gA8jyBnHVQ
 mBcMT9G4wpjLZSyodd+nprArj5ou408kmimI4JVzacLhb35ez6HKmqT2yZ7QUN+WgWq2
 kAVeWmOp3CR3cEu6Vn0w3qsk3RLrbwzOvFHe7VjO/K1MXngDN7CZwf8sNVbxoseTNeE/
 QxrQ==
X-Gm-Message-State: AOAM533RzQygXTrJHjPWcE/M4jHtlSdZidjVY1cPmZUitat7whGBvmL9
 ECXSP9pYdbJDCPi64t7PmXY=
X-Google-Smtp-Source: ABdhPJxGdC/Z3S2H8slU0FlpXoe5lliGF7ERtRDubU533St6/KeGCY1zYnihEdV4TTnw5GlrBcXocg==
X-Received: by 2002:a2e:2a85:: with SMTP id q127mr7396552ljq.77.1625410961018; 
 Sun, 04 Jul 2021 08:02:41 -0700 (PDT)
Received: from localhost.localdomain (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id k11sm268826lfc.272.2021.07.04.08.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 08:02:40 -0700 (PDT)
From: Peter Ujfalusi <peter.ujfalusi@gmail.com>
To: broonie@kernel.org,
	tony@atomide.com
Subject: [PATCH 5/5] ARM: dts: omap4-l4-abe: Add McASP configuration
Date: Sun,  4 Jul 2021 18:04:50 +0300
Message-Id: <20210704150450.20106-6-peter.ujfalusi@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210704150450.20106-1-peter.ujfalusi@gmail.com>
References: <20210704150450.20106-1-peter.ujfalusi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: hns@goldelico.com, alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 lgirdwood@gmail.com
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

OMAP4 has a single McASP instance with single serializer and locked for DIT
mode.
To be able to enable the support the following fixes needed:
- Add the DAT port ranges to the target module's ranges
- SIDLE mode must be disabled as it is not working with McASP
 most likely module integration issue with McASP

We can already fill in the op-mode and serial-dir  for McASP as it only
supports this configuration, but keep the module disabled as there is no
known device available where it is used.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
---
 arch/arm/boot/dts/omap4-l4-abe.dtsi | 38 +++++++++++++++--------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4-abe.dtsi b/arch/arm/boot/dts/omap4-l4-abe.dtsi
index 8287fdaa526e..a8d66240d17d 100644
--- a/arch/arm/boot/dts/omap4-l4-abe.dtsi
+++ b/arch/arm/boot/dts/omap4-l4-abe.dtsi
@@ -186,36 +186,38 @@ mcbsp3: mcbsp@0 {
 		};
 
 		target-module@28000 {			/* 0x40128000, ap 8 08.0 */
+							/* 0x4012a000, ap 10 0a.0 */
 			compatible = "ti,sysc-mcasp", "ti,sysc";
 			reg = <0x28000 0x4>,
 			      <0x28004 0x4>;
 			reg-names = "rev", "sysc";
 			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
-					<SYSC_IDLE_NO>,
-					<SYSC_IDLE_SMART>;
+					<SYSC_IDLE_NO>;
 			/* Domains (V, P, C): iva, abe_pwrdm, abe_clkdm */
 			clocks = <&abe_clkctrl OMAP4_MCASP_CLKCTRL 0>;
 			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x28000 0x1000>,
-				 <0x49028000 0x49028000 0x1000>;
-
-			/*
-			 * Child device unsupported by davinci-mcasp. At least
-			 * RX path is disabled for omap4, and only DIT mode
-			 * works with no I2S. See also old Android kernel
-			 * omap-mcasp driver for more information.
-			 */
-		};
-
-		target-module@2a000 {			/* 0x4012a000, ap 10 0a.0 */
-			compatible = "ti,sysc";
-			status = "disabled";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0x0 0x2a000 0x1000>,
+				 <0x49028000 0x49028000 0x1000>,
+				 <0x2000 0x2a000 0x1000>,
 				 <0x4902a000 0x4902a000 0x1000>;
+
+			mcasp0: mcasp@0 {
+				compatible = "ti,omap4-mcasp-audio";
+				reg = <0x0 0x2000>,
+				      <0x4902a000 0x1000>;	/* L3 data port */
+				reg-names = "mpu","dat";
+				interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "tx";
+				dmas = <&sdma 8>;
+				dma-names = "tx";
+				clocks = <&abe_clkctrl OMAP4_MCASP_CLKCTRL 0>;
+				clock-names = "fck";
+				op-mode = <1>;	/* MCASP_DIT_MODE */
+				serial-dir = < 1 >; /* 1 TX serializers */
+				status = "disabled";
+			};
 		};
 
 		target-module@2e000 {			/* 0x4012e000, ap 12 0c.0 */
-- 
2.32.0

