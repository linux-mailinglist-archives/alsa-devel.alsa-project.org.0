Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 454D359FF1F
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Aug 2022 18:09:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1E8A86E;
	Wed, 24 Aug 2022 18:08:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1E8A86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661357347;
	bh=s+DXhKcSfNyxCpGqnzz0ULV7wVUEXrortfckd7OdP4o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UW4kerPiprbcbdr6xa4MmuwTphHswhWFkqVgSlgaILPgUTV2vKZmbky8Tq6Bk+u0E
	 meZkVU8OieI2p1oc0AlOc6a4R4DG+XZ03316NK+MTu7nTAjG76NRwrp8Hg28jwowUg
	 sUeTXzMf/kzZpMTcCt6tKDRVHzm9AR9Y9h1Wm0lI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5950F8052F;
	Wed, 24 Aug 2022 18:07:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9A35F80529; Wed, 24 Aug 2022 18:07:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D4F3F8014B
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 18:07:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D4F3F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="foe2+KKS"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1661357239; bh=sHeYLuJA67nZaY4WSbgSXG+UWU/shWLU+cSuvcmzqjs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=foe2+KKSacdQ25yG02zYe7gywYei0k3dU4PRovXO3MlbFp4L2wntKjPSC5ZVNV6Hb
 p2x47z5PRHQQHlKb5CRsdTc/CIDkno4FMiPIc7XiMkYapCES2gdYgPugnDoyMU5TuU
 BKx3A+MZpjiv/4OMQOKd+1FqV5o9w/KOOm9NGcmU=
To: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v3 2/4] arm64: dts: apple: t8103: Add MCA and its support
Date: Wed, 24 Aug 2022 18:07:13 +0200
Message-Id: <20220824160715.95779-3-povik+lin@cutebit.org>
In-Reply-To: <20220824160715.95779-1-povik+lin@cutebit.org>
References: <20220824160715.95779-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 asahi@lists.linux.dev, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-kernel@vger.kernel.org
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

Add the MCA I2S transceiver node and its supporting NCO, ADMAC nodes.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi |  4 ++
 arch/arm64/boot/dts/apple/t8103.dtsi      | 73 +++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
index fe2ae40fa9dd..503a1b243efa 100644
--- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
@@ -76,3 +76,7 @@ wifi0: network@0,0 {
 		local-mac-address = [00 00 00 00 00 00];
 	};
 };
+
+&nco_clkref {
+	clock-frequency = <900000000>;
+};
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 51a63b29d404..5c01d5318386 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -532,6 +532,79 @@ port02: pci@2,0 {
 						<0 0 0 4 &port02 0 0 0 3>;
 			};
 		};
+
+		dart_sio: iommu@235004000 {
+			compatible = "apple,t8103-dart", "apple,dart";
+			reg = <0x2 0x35004000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 635 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_sio_cpu>;
+		};
+
+		/*
+		 * This is a fabulated representation of the input clock
+		 * to NCO since we don't know the true clock tree.
+		 */
+		nco_clkref: clock-ref {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-output-names = "nco_ref";
+		};
+
+		nco: clock-controller@23b044000 {
+			compatible = "apple,t8103-nco", "apple,nco";
+			reg = <0x2 0x3b044000 0x0 0x14000>;
+			clocks = <&nco_clkref>;
+			#clock-cells = <1>;
+		};
+
+		admac: dma-controller@238200000 {
+			compatible = "apple,t8103-admac", "apple,admac";
+			reg = <0x2 0x38200000 0x0 0x34000>;
+			dma-channels = <24>;
+			interrupts-extended = <0>,
+					      <&aic AIC_IRQ 626 IRQ_TYPE_LEVEL_HIGH>,
+					      <0>,
+					      <0>;
+			#dma-cells = <1>;
+			iommus = <&dart_sio 2>;
+			power-domains = <&ps_sio_adma>;
+		};
+
+		mca: i2s@38400000 {
+			compatible = "apple,t8103-mca", "apple,mca";
+			reg = <0x2 0x38400000 0x0 0x18000>,
+			      <0x2 0x38300000 0x0 0x30000>;
+
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 619 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 620 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 621 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 622 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 623 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 624 IRQ_TYPE_LEVEL_HIGH>;
+
+			resets = <&ps_audio_p>;
+			clocks = <&nco 0>, <&nco 1>, <&nco 2>,
+				 <&nco 3>, <&nco 4>, <&nco 4>;
+			power-domains = <&ps_audio_p>, <&ps_mca0>, <&ps_mca1>,
+					<&ps_mca2>, <&ps_mca3>, <&ps_mca4>, <&ps_mca5>;
+			dmas = <&admac 0>, <&admac 1>, <&admac 2>, <&admac 3>,
+			       <&admac 4>, <&admac 5>, <&admac 6>, <&admac 7>,
+			       <&admac 8>, <&admac 9>, <&admac 10>, <&admac 11>,
+			       <&admac 12>, <&admac 13>, <&admac 14>, <&admac 15>,
+			       <&admac 16>, <&admac 17>, <&admac 18>, <&admac 19>,
+			       <&admac 20>, <&admac 21>, <&admac 22>, <&admac 23>;
+			dma-names = "tx0a", "rx0a", "tx0b", "rx0b",
+				"tx1a", "rx1a", "tx1b", "rx1b",
+				"tx2a", "rx2a", "tx2b", "rx2b",
+				"tx3a", "rx3a", "tx3b", "rx3b",
+				"tx4a", "rx4a", "tx4b", "rx4b",
+				"tx5a", "rx5a", "tx5b", "rx5b";
+
+			#sound-dai-cells = <1>;
+		};
 	};
 };
 
-- 
2.33.0

