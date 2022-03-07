Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2C04CF9A2
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 11:09:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AA5516FD;
	Mon,  7 Mar 2022 11:08:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AA5516FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646647752;
	bh=oWpZa4wDpTxbtFVVuDNR8V2wNQBxnGeOspbBo3QQn9E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qfoNNetZWIoFgLmr/+3D3HekBkjIfW/CI4XRmw6Ks8OWQWKZrHHsmzgWLPoaJfpgv
	 xYsDZNGx73qIF3QSckD08RnUXNJvADCG22xPKXCiz6tb/QovCEWcl8WYY8b7e1pyF/
	 6w0BIbVRJk4W1hRKgwIfiAU3jzjr19+AQTZIKjqA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63333F80539;
	Mon,  7 Mar 2022 11:06:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1383BF80527; Mon,  7 Mar 2022 11:06:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4683F80508
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 11:06:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4683F80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="StMkgMf3"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646647577; x=1678183577;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oWpZa4wDpTxbtFVVuDNR8V2wNQBxnGeOspbBo3QQn9E=;
 b=StMkgMf31M63BpXpYnfjclY3Jpf61jGRtkdEttPAfJkeDCq3mCb6S+EZ
 EuktW9lUe/WfA9WsuYrLf/gjOhGx7bY1JEcmqJmTfycMlwYV/XcMl4Bur
 7+ahgdTBBJT4WLLF7vilb3dBs8BC54sGFU9nu8oKpXtH6p7oyrdMCWZ4m
 P+qeXBeTXblQf4Z237RgSZ6DLPV2Dtgb4re/RQfb9dFHeB/C8xkG1NmR8
 lJrOPULoEaP3DS+dFjiCfZN6xY8ej0OR/bRdBkqXf8SIIUl1M79B0e0+x
 AEqSLRuItNDch7umviv6LCKMAXo/FH5vRtw4NltYZ31tgU1b6WOMRvCHK A==;
X-IronPort-AV: E=Sophos;i="5.90,161,1643698800"; d="scan'208";a="88045579"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Mar 2022 03:06:15 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 7 Mar 2022 03:06:12 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 7 Mar 2022 03:06:09 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 5/6] ARM: dts: at91: sama7g5ek: add node for PDMC0
Date: Mon, 7 Mar 2022 12:04:27 +0200
Message-ID: <20220307100428.2227511-6-codrin.ciubotariu@microchip.com>
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

SAMA7G5-EK has 4 PDM microphones connected to PDMC0. PDMC0 pinmux is in
conflict with gmac1, gmac1 being enabled by default.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---

Changes in v2:
 - replaced included file dt-bindings/sound/mchp,pdmc.h wih
   dt-bindings/sound/microchip,pdmc.h

 arch/arm/boot/dts/at91-sama7g5ek.dts | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/at91-sama7g5ek.dts b/arch/arm/boot/dts/at91-sama7g5ek.dts
index ccf9e224da78..a1fb980d3fc1 100644
--- a/arch/arm/boot/dts/at91-sama7g5ek.dts
+++ b/arch/arm/boot/dts/at91-sama7g5ek.dts
@@ -14,6 +14,7 @@
 #include <dt-bindings/mfd/atmel-flexcom.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/at91.h>
+#include <dt-bindings/sound/microchip,pdmc.h>
 
 / {
 	model = "Microchip SAMA7G5-EK";
@@ -439,7 +440,7 @@ &gmac1 {
 		     &pinctrl_gmac1_mdio_default
 		     &pinctrl_gmac1_phy_irq>;
 	phy-mode = "rmii";
-	status = "okay";
+	status = "okay"; /* Conflict with pdmc0. */
 
 	ethernet-phy@0 {
 		reg = <0x0>;
@@ -453,6 +454,17 @@ &i2s0 {
 	pinctrl-0 = <&pinctrl_i2s0_default>;
 };
 
+&pdmc0 {
+	#sound-dai-cells = <0>;
+	microchip,mic-pos = <MCHP_PDMC_DS0 MCHP_PDMC_CLK_NEGATIVE>, /* MIC 1 */
+			    <MCHP_PDMC_DS1 MCHP_PDMC_CLK_NEGATIVE>, /* MIC 2 */
+			    <MCHP_PDMC_DS0 MCHP_PDMC_CLK_POSITIVE>, /* MIC 3 */
+			    <MCHP_PDMC_DS1 MCHP_PDMC_CLK_POSITIVE>; /* MIC 4 */
+	status = "disabled"; /* Conflict with gmac1. */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pdmc0_default>;
+};
+
 &pioA {
 	pinctrl_flx0_default: flx0_default {
 		pinmux = <PIN_PE3__FLEXCOM0_IO0>,
@@ -609,6 +621,13 @@ pinctrl_mikrobus1_spi: mikrobus1_spi {
 		bias-disable;
 	};
 
+	pinctrl_pdmc0_default: pdmc0_default {
+		pinmux = <PIN_PD23__PDMC0_DS0>,
+			 <PIN_PD24__PDMC0_DS1>,
+			 <PIN_PD22__PDMC0_CLK>;
+		bias_disable;
+	};
+
 	pinctrl_qspi: qspi {
 		pinmux = <PIN_PB12__QSPI0_IO0>,
 			 <PIN_PB11__QSPI0_IO1>,
-- 
2.32.0

