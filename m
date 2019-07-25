Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D7875A59
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 00:05:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 758AF1F0C;
	Fri, 26 Jul 2019 00:04:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 758AF1F0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564092308;
	bh=32NlzSSRACoLk7nmYEv36R0DkGwMJ7Edg7EmaoqyIYQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SG2aq/No4vN60uyRSGg1swEfjZZNF7JGY9+FjL7h/kGGw0RlUb1LOaLz+OLsjuyU6
	 x46SNey1z3qYcrGk5Lsri7DFA7Q3W1Um7pFHnj479UPn3/IuUGXza0lmrHLx3TzyG5
	 Gm7q5N7lwTWFdNIeb5FL4h2FAm7OmpbdKr7tn/Fg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45791F8045F;
	Fri, 26 Jul 2019 00:02:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 811EDF8044B; Fri, 26 Jul 2019 00:02:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14D3FF80448
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 00:02:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14D3FF80448
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="R7IJK1g9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1564092161; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cgv/Eiyx9lwjgkpl2A6sQ/WtPGxxm4pZLEOSbUVch0U=;
 b=R7IJK1g97S4k1gcbeoey4ogXdrzb3s9X+T39rMxayhmX4cpAGcFsbT9iIkPOYMoh4FUSvm
 iMTR60Ab/vbRsW6z7htwMM1jOfRt7lC4YoKs+PTwPNADPMHZOW6bhu/q7EG9x778CbbYA0
 nyLqmuqyOFIpFW0ZrTMCL8bDdP9LOoM=
From: Paul Cercueil <paul@crapouillou.net>
To: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 James Hogan <jhogan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Vinod Koul <vkoul@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Lee Jones <lee.jones@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Sebastian Reichel <sre@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Date: Thu, 25 Jul 2019 18:02:05 -0400
Message-Id: <20190725220215.460-2-paul@crapouillou.net>
In-Reply-To: <20190725220215.460-1-paul@crapouillou.net>
References: <20190725220215.460-1-paul@crapouillou.net>
MIME-Version: 1.0
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Artur Rojek <contact@artur-rojek.eu>,
 alsa-devel@alsa-project.org, linux-pm@vger.kernel.org,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 linux-mtd@lists.infradead.org, dmaengine@vger.kernel.org
Subject: [alsa-devel] [PATCH 01/11] MIPS: DTS: jz4740: Add missing nodes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add nodes for the MMC, AIC, ADC, CODEC, MUSB, LCD, memory,
and BCH controllers.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
---
 arch/mips/boot/dts/ingenic/jz4740.dtsi | 84 ++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi b/arch/mips/boot/dts/ingenic/jz4740.dtsi
index 3ffaf63f22dd..bceabf494af5 100644
--- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
@@ -132,6 +132,35 @@
 		};
 	};
 
+	aic: audio-controller@10020000 {
+		compatible = "ingenic,jz4740-i2s";
+		reg = <0x10020000 0x38>;
+
+		#sound-dai-cells = <0>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <18>;
+
+		clocks = <&cgu JZ4740_CLK_AIC>,
+			 <&cgu JZ4740_CLK_I2S>,
+			 <&cgu JZ4740_CLK_EXT>,
+			 <&cgu JZ4740_CLK_PLL_HALF>;
+		clock-names = "aic", "i2s", "ext", "pll half";
+
+		dmas = <&dmac 25 0xffffffff>, <&dmac 24 0xffffffff>;
+		dma-names = "rx", "tx";
+	};
+
+	codec: audio-codec@100200a4 {
+		compatible = "ingenic,jz4740-codec";
+		reg = <0x10020080 0x8>;
+
+		#sound-dai-cells = <0>;
+
+		clocks = <&cgu JZ4740_CLK_AIC>;
+		clock-names = "aic";
+	};
+
 	mmc: mmc@10021000 {
 		compatible = "ingenic,jz4740-mmc";
 		reg = <0x10021000 0x1000>;
@@ -172,6 +201,38 @@
 		clock-names = "baud", "module";
 	};
 
+	adc: adc@10070000 {
+		compatible = "ingenic,jz4740-adc";
+		reg = <0x10070000 0x30>;
+		#io-channel-cells = <1>;
+
+		clocks = <&cgu JZ4740_CLK_ADC>;
+		clock-names = "adc";
+
+		interrupt-parent = <&intc>;
+		interrupts = <12>;
+	};
+
+	nemc: memory-controller@13010000 {
+		compatible = "ingenic,jz4740-nemc";
+		reg = <0x13010000 0x54>;
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges = <1 0 0x18000000 0x4000000
+			  2 0 0x14000000 0x4000000
+			  3 0 0x0c000000 0x4000000
+			  4 0 0x08000000 0x4000000>;
+
+		clocks = <&cgu JZ4740_CLK_MCLK>;
+	};
+
+	ecc: ecc-controller@13010100 {
+		compatible = "ingenic,jz4740-ecc";
+		reg = <0x13010100 0x2C>;
+
+		clocks = <&cgu JZ4740_CLK_MCLK>;
+	};
+
 	dmac: dma-controller@13020000 {
 		compatible = "ingenic,jz4740-dma";
 		reg = <0x13020000 0xbc
@@ -197,4 +258,27 @@
 
 		status = "disabled";
 	};
+
+	udc: usb@13040000 {
+		compatible = "ingenic,jz4740-musb";
+		reg = <0x13040000 0x10000>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <24>;
+		interrupt-names = "mc";
+
+		clocks = <&cgu JZ4740_CLK_UDC>;
+		clock-names = "udc";
+	};
+
+	lcd: lcd-controller@13050000 {
+		compatible = "ingenic,jz4740-lcd";
+		reg = <0x13050000 0x1000>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <30>;
+
+		clocks = <&cgu JZ4740_CLK_LCD_PCLK>, <&cgu JZ4740_CLK_LCD>;
+		clock-names = "lcd_pclk", "lcd";
+	};
 };
-- 
2.21.0.593.g511ec345e18

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
