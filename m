Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B57C4CF9A0
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 11:08:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CE9616A4;
	Mon,  7 Mar 2022 11:07:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CE9616A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646647721;
	bh=3VKXO9vL9OlCgl5v6BC6SLD+HFFz5DTpmHGxTxgva/Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S5s2hFaf6E1Pyi3lZ5jXMGpvhPX7yxa5GAOJHpPfqacC6ZhO/ehUN7Izcb72qfI0z
	 PTIRByBvK2fxGoar+FgNixED6B4Hd5czBxeSTNK8Z69W93PPLcrs69WHt7PZZVWPYU
	 BhcvILxN1N6i2OB4WTl02p+S1NIpGGq+BIT5KA6k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55655F8052E;
	Mon,  7 Mar 2022 11:06:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8601FF8020D; Mon,  7 Mar 2022 11:06:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FC5BF8020D
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 11:06:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FC5BF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="Xu5LN5lT"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646647576; x=1678183576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3VKXO9vL9OlCgl5v6BC6SLD+HFFz5DTpmHGxTxgva/Q=;
 b=Xu5LN5lTibsIeYm8nF7vEJpppzus0yCAWxv07DMX1efAicsaoZDQuhlW
 iRDHFDKk8Em4MVYvZ5gIJCPsWkCg7cu29QKIk4RXw+hwAHB9gHjFuXImK
 D5bxKOhHr2zsotvqGziECa1xKbmNuA659FK5Kp7Lu5A91dpMn3aYfoTah
 J85tmzJUwFleGJssG3ojOCPFikroV8jXrTAowTS6hgvQ72l8QYoeeFPOE
 HvF/vwz1oj6lAWVx9p1LIWTw1QbNNyJlSdBola0/svZTzXQ11zeLBd7tJ
 RfsXncVDLKYjVZPPB5OcztlorkpNsA9ZDUTnqzmM6oRAifYKZ6bw9clge w==;
X-IronPort-AV: E=Sophos;i="5.90,161,1643698800"; d="scan'208";a="88045549"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Mar 2022 03:06:12 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 7 Mar 2022 03:06:09 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 7 Mar 2022 03:06:06 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 4/6] ARM: dts: at91: sama7g5: add nodes for PDMC
Date: Mon, 7 Mar 2022 12:04:26 +0200
Message-ID: <20220307100428.2227511-5-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220307100428.2227511-1-codrin.ciubotariu@microchip.com>
References: <20220307100428.2227511-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: lars@metafoo.de, nicolas.ferre@microchip.com, robh+dt@kernel.org,
 tiwai@suse.com, broonie@kernel.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
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

Microchip's SAMA7G5 embeds two PDMCs. The PDMCs can be used to connect 2x4
PDM microphones.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---

Changes in v2:
 - set 'sound' as nodes' name

 arch/arm/boot/dts/sama7g5.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/sama7g5.dtsi b/arch/arm/boot/dts/sama7g5.dtsi
index eddcfbf4d223..70e86444194f 100644
--- a/arch/arm/boot/dts/sama7g5.dtsi
+++ b/arch/arm/boot/dts/sama7g5.dtsi
@@ -275,6 +275,30 @@ pwm: pwm@e1604000 {
 			status = "disabled";
 		};
 
+		pdmc0: sound@e1608000 {
+			compatible = "microchip,sama7g5-pdmc";
+			reg = <0xe1608000 0x1000>;
+			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+			#sound-dai-cells = <0>;
+			dmas = <&dma0 AT91_XDMAC_DT_PERID(37)>;
+			dma-names = "rx";
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 68>, <&pmc PMC_TYPE_GCK 68>;
+			clock-names = "pclk", "gclk";
+			status = "disabled";
+		};
+
+		pdmc1: sound@e160c000 {
+			compatible = "microchip,sama7g5-pdmc";
+			reg = <0xe160c000 0x1000>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			#sound-dai-cells = <0>;
+			dmas = <&dma0 AT91_XDMAC_DT_PERID(38)>;
+			dma-names = "rx";
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 69>, <&pmc PMC_TYPE_GCK 69>;
+			clock-names = "pclk", "gclk";
+			status = "disabled";
+		};
+
 		spdifrx: spdifrx@e1614000 {
 			#sound-dai-cells = <0>;
 			compatible = "microchip,sama7g5-spdifrx";
-- 
2.32.0

