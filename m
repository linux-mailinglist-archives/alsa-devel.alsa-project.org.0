Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5F57767AD
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 20:53:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9810A950;
	Wed,  9 Aug 2023 20:52:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9810A950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691607195;
	bh=nZ0H7JYuPxKuBvxwoaRUePQvCPcx/h7vc6+IGY03kjk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=cI27R2USzzziSp8V4vfsaHAWczImWn98RN4XuA104HnDkABj4o6Y924Ys3oKrIy5Z
	 JpwM9LXkaPwhP7vMe7VHoPB8F7ANgL+JSdgdZJgNg1fn1AX7nsjh0BTLaqiyhn/5jo
	 Rzb+4YQwX78md/8Tx5OQ2VoFcCSo4QZk+Bcv4nOI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4E2FF805B2; Wed,  9 Aug 2023 20:50:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39510F805A1;
	Wed,  9 Aug 2023 20:50:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D608F80578; Wed,  9 Aug 2023 20:50:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6508CF80553
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 20:50:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6508CF80553
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id C151FFB05;
	Wed,  9 Aug 2023 20:50:41 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
	by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mAFFqLzQD3xy; Wed,  9 Aug 2023 20:50:35 +0200 (CEST)
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
	David Heidelberg <david@ixit.cz>
Subject: [PATCH v1 4/5] arm64: dts: imx8mq-librem5-devkit: Drop power-supply
Date: Wed,  9 Aug 2023 20:50:13 +0200
Message-Id: 
 <be0267a53cdf31c7a32f9ab43813dccf08b32477.1691606520.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1691606520.git.agx@sigxcpu.org>
References: <cover.1691606520.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2K5WSSE2R4HLWYQ5EDQ5DX64NVWUNGN5
X-Message-ID-Hash: 2K5WSSE2R4HLWYQ5EDQ5DX64NVWUNGN5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2K5WSSE2R4HLWYQ5EDQ5DX64NVWUNGN5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use a power sequence instead. As this handles the wifi disable line
rename the pincontrol accordingly. This also makes it similar to the
Librem 5.

Resolves following warning:

arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dtb: mmc@30b50000: Unevaluated properties are not allowed ('power-supply' was unexpected)
        from schema $id: http://devicetree.org/schemas/mmc/fsl-imx-esdhc.yaml#

Reported-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 .../boot/dts/freescale/imx8mq-librem5-devkit.dts    | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
index be9ef5c271df..244075e2a599 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
@@ -231,16 +231,11 @@ vibrator {
 		vcc-supply = <&reg_3v3_p>;
 	};
 
-	wifi_pwr_en: regulator-wifi-en {
-		compatible = "regulator-fixed";
+	wifi_pwrseq: pwrseq {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_wifi_pwr_en>;
-		regulator-name = "WIFI_EN";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio3 5 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		regulator-always-on;
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio3 5 GPIO_ACTIVE_LOW>;
 	};
 };
 
@@ -1032,7 +1027,7 @@ &usdhc2 {
 	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
 	bus-width = <4>;
 	vmmc-supply = <&reg_usdhc2_vmmc>;
-	power-supply = <&wifi_pwr_en>;
+	mmc-pwrseq = <&wifi_pwrseq>;
 	broken-cd;
 	disable-wp;
 	cap-sdio-irq;
-- 
2.40.1

