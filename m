Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9146BAFAB
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 12:52:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B5D312DB;
	Wed, 15 Mar 2023 12:51:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B5D312DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678881126;
	bh=JPxbCxRRz6H45MZSjKN5mSWqksRhLfDouLdmfTGt9VA=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=YGtYfm1xS21hyIkW+sLVWZUTzVsOaWq0lDqG+3+3d4FXPI2EEFzHdnf0sG9lXnc1n
	 LJWngOABuhhA0peavG5412G8IT4qS+0I6EHmn27IyhNXr+GmjJ3OeQOiy/KOwmJyrt
	 3GVqzdXFvZmd/nkix8MwpS6m137dO8UDYmWVC8MQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5215F8057E;
	Wed, 15 Mar 2023 12:48:55 +0100 (CET)
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Drake <drake@endlessm.com>,
	Katsuhiro Suzuki <katsuhiro@katsuster.net>
Subject: [PATCH 09/11] arm64: dts: rockchip: rk3588s: Add I2S nodes
Date: Wed, 15 Mar 2023 13:48:04 +0200
In-Reply-To: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TDSVNBSHIO742BUQUD4SXBBXRVNZXI53/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167888093435.26.10083004961530558442@mailman-core.alsa-project.org>
From: Cristian Ciocaltea via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, kernel@collabora.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB4C6F80578; Wed, 15 Mar 2023 12:48:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7004DF80563
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 12:48:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7004DF80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=P3rF+enR
Received: from localhost (unknown [188.24.156.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C982766030A0;
	Wed, 15 Mar 2023 11:48:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678880918;
	bh=k/FRJRGvTyGdarAsogRNZp731ApvQsx6xU0AYFlr704=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P3rF+enRW7f+4WvC+3VmjfJWpniQPsGoxe46O7GoXu3M+DddaKAmXjNopZf+ss43d
	 1p+wT7bv66tZdCuaTx92PRnIVIklHSOIwN9dwv2lek92Mcjtzw6ONi/cb5WAb//rpD
	 BtFpyKQMlxpXIkcfQsn8rjykq9w5WSQhyevFqcgpcHcLgH/7rlaKYMcRga1syEfSEr
	 cson7+7rMw5ufAXiS7ExOiL8bmM0jmhGkVBgCY4Cyauz7+03qyaTKM1CV1ewf4/Lk+
	 4tAGNA/FbcSHxU/o3eMPcMvCcFeZGxrfyMCKTIFIPIiZcYQPtiulPyCBjxX3EZFlG7
	 ixm93qrKoD00Q==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Drake <drake@endlessm.com>,
	Katsuhiro Suzuki <katsuhiro@katsuster.net>
Subject: [PATCH 09/11] arm64: dts: rockchip: rk3588s: Add I2S nodes
Date: Wed, 15 Mar 2023 13:48:04 +0200
Message-Id: <20230315114806.3819515-10-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TDSVNBSHIO742BUQUD4SXBBXRVNZXI53
X-Message-ID-Hash: TDSVNBSHIO742BUQUD4SXBBXRVNZXI53
X-MailFrom: cristian.ciocaltea@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TDSVNBSHIO742BUQUD4SXBBXRVNZXI53/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There are five I2S/PCM/TDM controllers and two I2S/PCM controllers
embedded in the RK3588 and RK3588S SoCs.

Add the DT nodes corresponding to the above mentioned Rockchip
controllers.

Also note RK3588 SoC contains four additional I2S/PCM/TDM controllers,
which are handled via a separate patch.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi | 148 ++++++++++++++++++++++
 1 file changed, 148 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
index 005cde61b4b2..a137e3450bd6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
@@ -810,6 +810,57 @@ power-domain@RK3588_PD_SDMMC {
 		};
 	};
 
+	i2s4_8ch: i2s@fddc0000 {
+		compatible = "rockchip,rk3588-i2s-tdm";
+		reg = <0x0 0xfddc0000 0x0 0x1000>;
+		interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru MCLK_I2S4_8CH_TX>, <&cru MCLK_I2S4_8CH_TX>, <&cru HCLK_I2S4_8CH>;
+		clock-names = "mclk_tx", "mclk_rx", "hclk";
+		assigned-clocks = <&cru CLK_I2S4_8CH_TX_SRC>;
+		assigned-clock-parents = <&cru PLL_AUPLL>;
+		dmas = <&dmac2 0>;
+		dma-names = "tx";
+		power-domains = <&power RK3588_PD_VO0>;
+		resets = <&cru SRST_M_I2S4_8CH_TX>;
+		reset-names = "tx-m";
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
+	i2s5_8ch: i2s@fddf0000 {
+		compatible = "rockchip,rk3588-i2s-tdm";
+		reg = <0x0 0xfddf0000 0x0 0x1000>;
+		interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru MCLK_I2S5_8CH_TX>, <&cru MCLK_I2S5_8CH_TX>, <&cru HCLK_I2S5_8CH>;
+		clock-names = "mclk_tx", "mclk_rx", "hclk";
+		assigned-clocks = <&cru CLK_I2S5_8CH_TX_SRC>;
+		assigned-clock-parents = <&cru PLL_AUPLL>;
+		dmas = <&dmac2 2>;
+		dma-names = "tx";
+		power-domains = <&power RK3588_PD_VO1>;
+		resets = <&cru SRST_M_I2S5_8CH_TX>;
+		reset-names = "tx-m";
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
+	i2s9_8ch: i2s@fddfc000 {
+		compatible = "rockchip,rk3588-i2s-tdm";
+		reg = <0x0 0xfddfc000 0x0 0x1000>;
+		interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru MCLK_I2S9_8CH_RX>, <&cru MCLK_I2S9_8CH_RX>, <&cru HCLK_I2S9_8CH>;
+		clock-names = "mclk_tx", "mclk_rx", "hclk";
+		assigned-clocks = <&cru CLK_I2S9_8CH_RX_SRC>;
+		assigned-clock-parents = <&cru PLL_AUPLL>;
+		dmas = <&dmac2 23>;
+		dma-names = "rx";
+		power-domains = <&power RK3588_PD_VO1>;
+		resets = <&cru SRST_M_I2S9_8CH_RX>;
+		reset-names = "rx-m";
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
 	qos_gpu_m0: qos@fdf35000 {
 		compatible = "rockchip,rk3588-qos", "syscon";
 		reg = <0x0 0xfdf35000 0x0 0x20>;
@@ -1117,6 +1168,103 @@ sdhci: mmc@fe2e0000 {
 		status = "disabled";
 	};
 
+	i2s0_8ch: i2s@fe470000 {
+		compatible = "rockchip,rk3588-i2s-tdm";
+		reg = <0x0 0xfe470000 0x0 0x1000>;
+		interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru MCLK_I2S0_8CH_TX>, <&cru MCLK_I2S0_8CH_RX>, <&cru HCLK_I2S0_8CH>;
+		clock-names = "mclk_tx", "mclk_rx", "hclk";
+		assigned-clocks = <&cru CLK_I2S0_8CH_TX_SRC>, <&cru CLK_I2S0_8CH_RX_SRC>;
+		assigned-clock-parents = <&cru PLL_AUPLL>, <&cru PLL_AUPLL>;
+		dmas = <&dmac0 0>, <&dmac0 1>;
+		dma-names = "tx", "rx";
+		power-domains = <&power RK3588_PD_AUDIO>;
+		resets = <&cru SRST_M_I2S0_8CH_TX>, <&cru SRST_M_I2S0_8CH_RX>;
+		reset-names = "tx-m", "rx-m";
+		rockchip,trcm-sync-tx-only;
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2s0_lrck
+			     &i2s0_sclk
+			     &i2s0_sdi0
+			     &i2s0_sdi1
+			     &i2s0_sdi2
+			     &i2s0_sdi3
+			     &i2s0_sdo0
+			     &i2s0_sdo1
+			     &i2s0_sdo2
+			     &i2s0_sdo3>;
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
+	i2s1_8ch: i2s@fe480000 {
+		compatible = "rockchip,rk3588-i2s-tdm";
+		reg = <0x0 0xfe480000 0x0 0x1000>;
+		interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru MCLK_I2S1_8CH_TX>, <&cru MCLK_I2S1_8CH_RX>, <&cru HCLK_I2S1_8CH>;
+		clock-names = "mclk_tx", "mclk_rx", "hclk";
+		dmas = <&dmac0 2>, <&dmac0 3>;
+		dma-names = "tx", "rx";
+		resets = <&cru SRST_M_I2S1_8CH_TX>, <&cru SRST_M_I2S1_8CH_RX>;
+		reset-names = "tx-m", "rx-m";
+		rockchip,trcm-sync-tx-only;
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2s1m0_lrck
+			     &i2s1m0_sclk
+			     &i2s1m0_sdi0
+			     &i2s1m0_sdi1
+			     &i2s1m0_sdi2
+			     &i2s1m0_sdi3
+			     &i2s1m0_sdo0
+			     &i2s1m0_sdo1
+			     &i2s1m0_sdo2
+			     &i2s1m0_sdo3>;
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
+	i2s2_2ch: i2s@fe490000 {
+		compatible = "rockchip,rk3588-i2s", "rockchip,rk3066-i2s";
+		reg = <0x0 0xfe490000 0x0 0x1000>;
+		interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru MCLK_I2S2_2CH>, <&cru HCLK_I2S2_2CH>;
+		clock-names = "i2s_clk", "i2s_hclk";
+		assigned-clocks = <&cru CLK_I2S2_2CH_SRC>;
+		assigned-clock-parents = <&cru PLL_AUPLL>;
+		dmas = <&dmac1 0>, <&dmac1 1>;
+		dma-names = "tx", "rx";
+		power-domains = <&power RK3588_PD_AUDIO>;
+		rockchip,trcm-sync-tx-only;
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2s2m1_lrck
+			     &i2s2m1_sclk
+			     &i2s2m1_sdi
+			     &i2s2m1_sdo>;
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
+	i2s3_2ch: i2s@fe4a0000 {
+		compatible = "rockchip,rk3588-i2s", "rockchip,rk3066-i2s";
+		reg = <0x0 0xfe4a0000 0x0 0x1000>;
+		interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru MCLK_I2S3_2CH>, <&cru HCLK_I2S3_2CH>;
+		clock-names = "i2s_clk", "i2s_hclk";
+		assigned-clocks = <&cru CLK_I2S3_2CH_SRC>;
+		assigned-clock-parents = <&cru PLL_AUPLL>;
+		dmas = <&dmac1 2>, <&dmac1 3>;
+		dma-names = "tx", "rx";
+		power-domains = <&power RK3588_PD_AUDIO>;
+		rockchip,trcm-sync-tx-only;
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2s3_lrck
+			     &i2s3_sclk
+			     &i2s3_sdi
+			     &i2s3_sdo>;
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
 	gic: interrupt-controller@fe600000 {
 		compatible = "arm,gic-v3";
 		reg = <0x0 0xfe600000 0 0x10000>, /* GICD */
-- 
2.39.1

