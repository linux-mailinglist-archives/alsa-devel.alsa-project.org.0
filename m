Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F074CFE40
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 13:24:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66EB61712;
	Mon,  7 Mar 2022 13:24:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66EB61712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646655892;
	bh=/2gvArZrxpjBHlcifiq/PuCMiVcOPlvOD5ludY/TGtU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R58XAga7/qlABgnXKDcGV+jI8404lVg4NAMX1TpupaiKHJpA62KQm+Uf3x6BVEN2P
	 iFlGQfp//fzxadNP19o4m1sql8E7rbRacW/t4ZVoTY5WIB17cD3ezjd4mohIf/qWB2
	 h5H/pFt7a1Dl9IjCemuk3HIxkcPW2WfKz67fgUtY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F05D4F80520;
	Mon,  7 Mar 2022 13:23:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51A98F80520; Mon,  7 Mar 2022 13:23:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25BC3F80518
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 13:22:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25BC3F80518
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="z9tHnQcU"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646655779; x=1678191779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/2gvArZrxpjBHlcifiq/PuCMiVcOPlvOD5ludY/TGtU=;
 b=z9tHnQcUjQuUpRkWaK1hKv2YkoGnexTYj4mUFgn7YobBymT2V4TBNAC5
 pFTltirHAzGcmT4glWWbwX9UZhQa4wk4gH7DG0HrW6cktljHOPwdUvmM6
 npc1wp1MMfRpGY1H77/KztNC0frFuPDUmtVoFADMWfv5d5NYWqRw/7jW/
 XD7ymUMCw3C+08mHjjzWME4oCSrZdy3i/zKbFMCcKz9THOwNs2QEEd7S/
 bRulXBoIEH8ggFGnLHmRSFnux1BECZtmUa7ajGi8OGHuk9B8ehwz8fNOL
 1QAKUGET68ylpqS+33GFJ4X3mNhnLJJykIJMObcE9b3mg4xiJwocKA5Hv A==;
X-IronPort-AV: E=Sophos;i="5.90,162,1643698800"; d="scan'208";a="151091529"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Mar 2022 05:22:54 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 7 Mar 2022 05:22:54 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 7 Mar 2022 05:22:51 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 4/6] ARM: dts: at91: sama7g5: add nodes for PDMC
Date: Mon, 7 Mar 2022 14:22:00 +0200
Message-ID: <20220307122202.2251639-5-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220307122202.2251639-1-codrin.ciubotariu@microchip.com>
References: <20220307122202.2251639-1-codrin.ciubotariu@microchip.com>
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

Chnages in v3:
 - none

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

