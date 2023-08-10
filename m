Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E85777FDE
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 20:02:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0459885D;
	Thu, 10 Aug 2023 20:01:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0459885D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691690546;
	bh=I687DJYxwdWmLeqk2ADbt5c9WdMhKmwPMdezV6hOkDU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=oXHItt6Iu4TW9WXyKt+bTduIjMYO3xo1y4HEnPYStzibGqU7s010OxOrzM70OTl5l
	 UM2mrVaFKCjoQQtQM3QO2DPCofv05cJHN/rqPWgW+y0ff2vWsnVDD6Y9w6PTiCMfJk
	 vocRzX5ajpPhQIMhjJ8PmOPyLVRhulWqxUN0DB8s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2A41F805A9; Thu, 10 Aug 2023 20:01:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13737F80558;
	Thu, 10 Aug 2023 20:01:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FA44F80588; Thu, 10 Aug 2023 20:01:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0C9DF8016E
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 20:00:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0C9DF8016E
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id A1FFFFB04;
	Thu, 10 Aug 2023 20:00:01 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
	by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ga5_QdtRO3Fa; Thu, 10 Aug 2023 19:59:59 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	=?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
	Peng Fan <peng.fan@nxp.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	kernel@puri.sm,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	David Heidelberg <david@ixit.cz>,
	Sherry Sun <sherry.sun@nxp.com>
Subject: [PATCH v2 3/4] arm64: dts: imx8mq-librem5-devkit: Drop power-supply
Date: Thu, 10 Aug 2023 19:59:51 +0200
Message-Id: 
 <c1ed057f5cf27dd8ea649ddf5c67e4f73efd4120.1691684726.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1691684726.git.agx@sigxcpu.org>
References: <cover.1691684726.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TVHCYCDG6Q5FMBRKEAPG5OG4A2TC7YDL
X-Message-ID-Hash: TVHCYCDG6Q5FMBRKEAPG5OG4A2TC7YDL
X-MailFrom: agx@sigxcpu.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TVHCYCDG6Q5FMBRKEAPG5OG4A2TC7YDL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It's not a valid binding. Instead move the sdio_rst line to the power
sequence and use w_disable1 as the vmmc-supply bringing it more in line
with other SDIO M2 cards.

Resolves following warning:

arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dtb: mmc@30b50000: Unevaluated properties are not allowed ('power-supply' was unexpected)
        from schema $id: http://devicetree.org/schemas/mmc/fsl-imx-esdhc.yaml#

Reported-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 .../dts/freescale/imx8mq-librem5-devkit.dts   | 25 ++++++++-----------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
index be9ef5c271df..8055a2c23035 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
@@ -139,18 +139,6 @@ reg_pwr_en: regulator-pwr-en {
 		regulator-always-on;
 	};
 
-	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
-		compatible = "regulator-fixed";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_usdhc2_pwr>;
-		regulator-name = "VSD_3V3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		regulator-always-on;
-	};
-
 	wwan_codec: sound-wwan-codec {
 		compatible = "option,gtm601";
 		#sound-dai-cells = <0>;
@@ -242,6 +230,13 @@ wifi_pwr_en: regulator-wifi-en {
 		enable-active-high;
 		regulator-always-on;
 	};
+
+	wifi_pwr_seq: pwrseq {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usdhc2_rst>;
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio2 19 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &A53_0 {
@@ -808,7 +803,7 @@ MX8MQ_IOMUXC_SD1_RESET_B_USDHC1_RESET_B		0xc1
 		>;
 	};
 
-	pinctrl_usdhc2_pwr: usdhc2pwrgrp {
+	pinctrl_usdhc2_rst: usdhc2rstgrp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
 		>;
@@ -1031,8 +1026,8 @@ &usdhc2 {
 	pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
 	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
 	bus-width = <4>;
-	vmmc-supply = <&reg_usdhc2_vmmc>;
-	power-supply = <&wifi_pwr_en>;
+	vmmc-supply = <&wifi_pwr_en>;
+	mmc-pwrseq = <&wifi_pwr_seq>;
 	broken-cd;
 	disable-wp;
 	cap-sdio-irq;
-- 
2.40.1

