Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E045B0668
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 16:23:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FDE0167D;
	Wed,  7 Sep 2022 16:22:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FDE0167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662560605;
	bh=v/zedDVQfoYzaHd+XKFJHxPu4a2sZ7QvxLsPpxc2y2A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lEzNPhlf8mQ9w4olKIRVmQ78ZCWDYxoG+q8S+xfjSrZSO8oUCIP+UG0MLEZtM8Fc7
	 Rh+twV1k8thJ4Z//SehudUPP1VnPQf3UOHFq9SVf0N7rP5DD6iwmFps8aB/QRDfum+
	 tsbtKxBfnDXHxiche5Vm1wErfqMe5zbWm4j9hOOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2066F80537;
	Wed,  7 Sep 2022 16:22:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D5C2F80536; Wed,  7 Sep 2022 16:22:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5915F804B2
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 16:22:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5915F804B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.b="LSdOFgZf"
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 4695B20000D;
 Wed,  7 Sep 2022 14:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1662560527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d12YAjeraqwxRD2IqjgZc6aJaYWV3WXQkVFDeRXfBTA=;
 b=LSdOFgZfPTa/D1VumgCk6xEvKgX/7vfoT/oRTJ6fjbcCp0KIlM2iMoFtlZqgfNcVGW33/9
 oR1WVXzp6lZl78tIxjrey5/180SsjzMs0j95C83GbnU2XQvOB2vUWNVeH+M6UqZO0K+AIZ
 u4rVWAXY3rp6Ubn1hoUwRapgyWPvbFMRymdPeC7ITbsw+K75+rfcwtNHcz3x2IuRu/uRF0
 g443E9DIOjYXDKBbRmhaOSDl8vq+CESYUjQhL3pSMlJn/cHZw30ttO3vRN8i67WjOvUSUI
 dDEsxGXCg8IrZTOBezF6EnEvqs9kUouoZfeVnGcOqZWP5iw9371KlePqH2pgtg==
From: luca.ceresoli@bootlin.com
To: alsa-devel@alsa-project.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 3/8] arm64: dts: rockchip: add i2s_8ch_2 and i2s_8ch_3
Date: Wed,  7 Sep 2022 16:21:19 +0200
Message-Id: <20220907142124.2532620-4-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220907142124.2532620-1-luca.ceresoli@bootlin.com>
References: <20220907142124.2532620-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 Takashi Iwai <tiwai@suse.com>, Chris Morgan <macromorgan@hotmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Johan Jonker <jbx6244@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
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

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

These are I2S engines internally connected to the built-in audio codec.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 arch/arm64/boot/dts/rockchip/rk3308.dtsi | 54 ++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3308.dtsi b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
index 2dfa67f1cd67..093b70563b23 100644
--- a/arch/arm64/boot/dts/rockchip/rk3308.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
@@ -571,6 +571,60 @@ dmac1: dma-controller@ff2d0000 {
 		#dma-cells = <1>;
 	};
 
+	/*
+	 * - can be clock producer or consumer
+	 * - up to 8 capture channels and 2 playback channels
+	 * - connected internally to audio codec
+	 */
+	i2s_8ch_2: i2s@ff320000 {
+		compatible = "rockchip,rk3308-i2s-tdm";
+		reg = <0x0 0xff320000 0x0 0x1000>;
+		interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+		clock-names = "mclk_tx", "mclk_rx", "hclk",
+			      "mclk_tx_src", "mclk_rx_src",
+			      "mclk_root0", "mclk_root1";
+		clocks = <&cru SCLK_I2S2_8CH_TX>,
+			 <&cru SCLK_I2S2_8CH_RX>,
+			 <&cru HCLK_I2S2_8CH>,
+			 <&cru SCLK_I2S2_8CH_TX_SRC>,
+			 <&cru SCLK_I2S2_8CH_RX_SRC>,
+			 <&cru PLL_VPLL0>,
+			 <&cru PLL_VPLL1>;
+		dmas = <&dmac1 5>, <&dmac1 4>;
+		dma-names = "rx", "tx";
+		resets = <&cru SRST_I2S2_8CH_TX_M>, <&cru SRST_I2S2_8CH_RX_M>;
+		reset-names = "tx-m", "rx-m";
+		rockchip,grf = <&grf>;
+		status = "disabled";
+	};
+
+	/*
+	 * - can be clock consumer only
+	 * - up to 4 capture channels, no playback
+	 * - connected internally to audio codec
+	 */
+	i2s_8ch_3: i2s@ff330000 {
+		compatible = "rockchip,rk3308-i2s-tdm";
+		reg = <0x0 0xff330000 0x0 0x1000>;
+		interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+		clock-names = "mclk_tx", "mclk_rx", "hclk",
+			      "mclk_tx_src", "mclk_rx_src",
+			      "mclk_root0", "mclk_root1";
+		clocks = <&cru SCLK_I2S3_8CH_TX>,
+			 <&cru SCLK_I2S3_8CH_RX>,
+			 <&cru HCLK_I2S3_8CH>,
+			 <&cru SCLK_I2S3_8CH_TX_SRC>,
+			 <&cru SCLK_I2S3_8CH_RX_SRC>,
+			 <&cru PLL_VPLL0>,
+			 <&cru PLL_VPLL1>;
+		dmas = <&dmac1 7>;
+		dma-names = "rx";
+		resets = <&cru SRST_I2S3_8CH_TX_M>, <&cru SRST_I2S3_8CH_RX_M>;
+		reset-names = "tx-m", "rx-m";
+		rockchip,grf = <&grf>;
+		status = "disabled";
+	};
+
 	i2s_2ch_0: i2s@ff350000 {
 		compatible = "rockchip,rk3308-i2s", "rockchip,rk3066-i2s";
 		reg = <0x0 0xff350000 0x0 0x1000>;
-- 
2.34.1

