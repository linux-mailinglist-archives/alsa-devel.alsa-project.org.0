Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F32C63BC337
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jul 2021 21:43:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FC9816EE;
	Mon,  5 Jul 2021 21:42:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FC9816EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625514191;
	bh=+OWXB0SVuxqCZ/DNf5CJA5uZ9uvw25rUj4kUEH6F4xE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EySBXLkPb924Q46J/VcfyxlKrMPYE9b+kKTqglwwIhntTHcQYWSe103VWloQLWVgk
	 DPsAY8xPIJEe9hAse8L054pYOrkMe/wUgd2C79S24dd7AUL3ufWylIO614o2kmV2Ua
	 Qu14LgXxLiJJlChfgwGzCgv6pAOMNfOztB1OZFPI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9289BF804EB;
	Mon,  5 Jul 2021 21:40:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CD24F804DA; Mon,  5 Jul 2021 21:40:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29CCAF804E1
 for <alsa-devel@alsa-project.org>; Mon,  5 Jul 2021 21:40:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29CCAF804E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="b3hjoTkc"
Received: by mail-lj1-x229.google.com with SMTP id w11so26045888ljh.0
 for <alsa-devel@alsa-project.org>; Mon, 05 Jul 2021 12:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rG8Wa9DCPn+LJLpCJ8agJSEaH0afH0syVdCVNBofvlc=;
 b=b3hjoTkcSMEWISYxZGb1O1Aa/UB2B3LQsRa5PM6gPWhWBj8LPCr7I8VEMUhknm/+m8
 7CaIP7JToj0Gt7eyTdaDdlQTf3Jbir439L8qEppdtEsgDhE8kdxNEm5e/pYisTO7bNqr
 Hxa9+o6n4/U3jRfwVMIyEzRqpYC3ss2voat+BSD9ocMwIvsbX+ThoCDRDzVnjCe6aZCG
 hOtCUDwE9E9xzyLLfgTa+u+go3x8J14IQS/gFCkthJlPHqg1Izo7R7TOV/dXr90l2+lJ
 aPR1qZ+1mku21ma+Jp6bklkIernbNiFucl/Tef/Z912/r7hEpxsXg0KSRggc7rXMzfFQ
 pR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rG8Wa9DCPn+LJLpCJ8agJSEaH0afH0syVdCVNBofvlc=;
 b=dyq9OMABDbPUlu0jtJ7rQa0v4BqnVi3KseSTeoYC2yPRjq2GrIfWp52isjSMLTuNeD
 Py3JKBcHkYduftwwmEMD/q4QBym1CIQsAMqhJW59ph9NHzu/9joBc4QWo5QbMLl+sHGj
 oIVR5wfy284R9Z1CW1Bxp08POzMo/yCdhh8E20M3GB7dT9q00weEKTAtZBj37/5yYwHX
 fuVtCp2So3JKdGRmubB9R1oBMa1Zxi6hQQQ4uHposK4UCg3db24fKzEbv8VYmG4IhjSW
 lYvw2IneY/WdGzG3K/BV7BEZcLjbFcmWUra3+x6UA3O++jW5qxIG+4fKD6mhWpfZJyeX
 zmjw==
X-Gm-Message-State: AOAM530HxsN5LW/QS2W9o5nCldIQysB0bmwg6wbHsu2G8U1ZiRrRyA7K
 LT3rtbrXdp1L7mMl1Ai8e5Y=
X-Google-Smtp-Source: ABdhPJw1yNKGrgp5kQaDmChWSn7ijYDvHPiaDSrCzw0RKEZOUT93M1hzbfnqq7E+apwg+KyhsehmBg==
X-Received: by 2002:a2e:2c0d:: with SMTP id s13mr6746476ljs.439.1625514037174; 
 Mon, 05 Jul 2021 12:40:37 -0700 (PDT)
Received: from localhost.localdomain (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id b5sm1167248lfv.3.2021.07.05.12.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 12:40:36 -0700 (PDT)
From: Peter Ujfalusi <peter.ujfalusi@gmail.com>
To: broonie@kernel.org,
	tony@atomide.com
Subject: [PATCH v2 5/5] ARM: dts: omap4-l4-abe: Add McASP configuration
Date: Mon,  5 Jul 2021 22:42:49 +0300
Message-Id: <20210705194249.2385-6-peter.ujfalusi@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
References: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
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

