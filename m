Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C82A05B066A
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 16:23:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F56F168C;
	Wed,  7 Sep 2022 16:22:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F56F168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662560624;
	bh=bnhQgRBl3f5glvXBUCZGeUc6uLOekc/CxTl6xs76s6U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lLt8JgaaQWrPH9QA5LhXGGtdIJml2usjgR0hI8IuHSHKJrEdIic0yNvGR8YAIgjpm
	 5ZsFUphloxze3j0hn4e0scalS0hbS6ElwV87EYz1rfyvUyjvJ2qwSY5NskAgDlYgAZ
	 st1vh9jUmmp+1++XS0iT2V6Ku9fAmdz7cvyRZkOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 705E1F8054A;
	Wed,  7 Sep 2022 16:22:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3EF5F80535; Wed,  7 Sep 2022 16:22:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75D6EF804B1
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 16:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75D6EF804B1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.b="ipnFSla9"
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 0F1EC200011;
 Wed,  7 Sep 2022 14:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1662560529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H7rApNsDwnaiu6MG3hhivs2ZkGDwqxF3VZC6R02WDNw=;
 b=ipnFSla9jeMfitB27ywlIo/bpDmP92NiUsF+hn3Fzn3jcCIAs1qozgpLFSWa95z3SOS/G2
 mP0E6XtJBj17nE/m4P1L0EDsBM8QEmuPyFyjkX1hPNFSKO6c9ict3RLuo+kUI5KhZYLirw
 6x/s+ItC9bDldSy5sCKwNsYzMO96ntkli2TXFop4rnjDVkoyWRYbAYeqRLcwFoIUj9KUz9
 rpi9CanlYQnxHhhjV6BB7do9tp7SzgAI4UkikKmyMwoktiCxm2odK78norQc44MbYNOgBV
 tkgdYYMAhg0FWVN904llHJ03j0h73wCdJas/l8CMYvyUNuHjzCUVUbs4fEsTfA==
From: luca.ceresoli@bootlin.com
To: alsa-devel@alsa-project.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 4/8] arm64: dts: rockchip: add the internal audio codec
Date: Wed,  7 Sep 2022 16:21:20 +0200
Message-Id: <20220907142124.2532620-5-luca.ceresoli@bootlin.com>
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

The RK3308 has a built-in audio codec that connects internally to i2s_8ch_2
or i2s_8ch_3.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 arch/arm64/boot/dts/rockchip/rk3308.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3308.dtsi b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
index 093b70563b23..221cde49dc98 100644
--- a/arch/arm64/boot/dts/rockchip/rk3308.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
@@ -808,6 +808,20 @@ cru: clock-controller@ff500000 {
 		assigned-clock-rates = <32768>;
 	};
 
+	acodec: acodec@ff560000 {
+		compatible = "rockchip,rk3308-codec";
+		reg = <0x0 0xff560000 0x0 0x10000>;
+		rockchip,grf = <&grf>;
+		clock-names = "mclk_tx", "mclk_rx", "hclk";
+		clocks = <&cru SCLK_I2S2_8CH_TX_OUT>,
+			 <&cru SCLK_I2S2_8CH_RX_OUT>,
+			 <&cru PCLK_ACODEC>;
+		reset-names = "acodec-reset";
+		resets = <&cru SRST_ACODEC_P>;
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
 	gic: interrupt-controller@ff580000 {
 		compatible = "arm,gic-400";
 		reg = <0x0 0xff581000 0x0 0x1000>,
-- 
2.34.1

