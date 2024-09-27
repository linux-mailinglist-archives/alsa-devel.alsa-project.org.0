Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F46498855A
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2024 14:44:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9CC0E80;
	Fri, 27 Sep 2024 14:44:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9CC0E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727441058;
	bh=CIM20nnnU7Jhf6dFh8JPiIIE/fCG4cgWx70W9ajo49Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rm/VCh7j7JYCzpYEa7GSuKimSouFxU8utqPavyqDw6QJyFo2I6iP/rqolYa3vzSfz
	 I2Y5KdN7JBwGfYK4UNMfRiiT8dN0SUphHtk0eUJO3ByASuht1dUfXBWsnV3G3i2qdF
	 QBE5MiT7NCqwAomQrktMEpkYVcSPPQOEYtuqppX8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0426F805FB; Fri, 27 Sep 2024 14:43:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6455BF805F9;
	Fri, 27 Sep 2024 14:43:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33654F8059F; Fri, 27 Sep 2024 14:43:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_PASS,SPF_NONE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC007F80518
	for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2024 14:43:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC007F80518
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b47d:fd74:3975:15b7])
	by xavier.telenet-ops.be with cmsmtp
	id HQic2D0093BfLyr01QicD3; Fri, 27 Sep 2024 14:43:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIj-000fPw-HG;
	Fri, 27 Sep 2024 14:42:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIp-008IDv-2h;
	Fri, 27 Sep 2024 14:42:31 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Adrien Grassein <adrien.grassein@gmail.com>,
	Adam Ford <aford173@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-mips@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH treewide 07/11] arm64: dts: rockchip: Switch to hp-det-gpios
Date: Fri, 27 Sep 2024 14:42:22 +0200
Message-Id: 
 <717e7c9527139c3a3e5246dd367a3ad98c5c81b6.1727438777.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727438777.git.geert+renesas@glider.be>
References: <cover.1727438777.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6B4CKVNBVFCQI6AQHG25KOJHLSG3SQKQ
X-Message-ID-Hash: 6B4CKVNBVFCQI6AQHG25KOJHLSG3SQKQ
X-MailFrom: geert@linux-m68k.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6B4CKVNBVFCQI6AQHG25KOJHLSG3SQKQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace the deprecated "hp-det-gpio" property by "hp-det-gpios" in Audio
Graph Card and Realtek RT5651 Audio Codec device nodes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/rockchip/rk3368-lba3368.dts            | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts          | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dts    | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dts    | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dts         | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts       | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts         | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts            | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368-lba3368.dts b/arch/arm64/boot/dts/rockchip/rk3368-lba3368.dts
index e0cc4da7f392daf9..c08687df326ddc21 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-lba3368.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3368-lba3368.dts
@@ -47,7 +47,7 @@ button-recovery {
 	analog-sound {
 		compatible = "audio-graph-card";
 		dais = <&i2s_8ch_p0>;
-		hp-det-gpio = <&gpio0 RK_PC7 GPIO_ACTIVE_HIGH>;
+		hp-det-gpios = <&gpio0 RK_PC7 GPIO_ACTIVE_HIGH>;
 		label = "alc5640";
 		routing = "Mic Jack", "MICBIAS1",
 			  "IN1P", "Mic Jack",
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts b/arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts
index 4feb78797982baa5..8c46bee077f3cfc2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts
@@ -545,7 +545,7 @@ rt5651: audio-codec@1a {
 		reg = <0x1a>;
 		clocks = <&cru SCLK_I2S_8CH_OUT>;
 		clock-names = "mclk";
-		hp-det-gpio = <&gpio4 RK_PD4 GPIO_ACTIVE_LOW>;
+		hp-det-gpios = <&gpio4 RK_PD4 GPIO_ACTIVE_LOW>;
 		spk-con-gpio = <&gpio0 RK_PB3 GPIO_ACTIVE_HIGH>;
 		#sound-dai-cells = <0>;
 	};
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dts b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dts
index 725ac3c1f6f6501d..4fc9c13dbec12390 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dts
@@ -21,5 +21,5 @@ &es8316 {
 };
 
 &sound {
-	hp-det-gpio = <&gpio1 RK_PA0 GPIO_ACTIVE_HIGH>;
+	hp-det-gpios = <&gpio1 RK_PA0 GPIO_ACTIVE_HIGH>;
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dts b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dts
index 682e8b7297c180b6..9c741d1a3047e758 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dts
@@ -39,7 +39,7 @@ brcmf: wifi@1 {
 };
 
 &sound {
-	hp-det-gpio = <&gpio1 RK_PA0 GPIO_ACTIVE_HIGH>;
+	hp-det-gpios = <&gpio1 RK_PA0 GPIO_ACTIVE_HIGH>;
 };
 
 &uart0 {
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dts b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dts
index 82ad2ca6b5c2fc92..5dc5505b58e2ee10 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dts
@@ -40,7 +40,7 @@ brcmf: wifi@1 {
 };
 
 &sound {
-	hp-det-gpio = <&gpio1 RK_PA0 GPIO_ACTIVE_HIGH>;
+	hp-det-gpios = <&gpio1 RK_PA0 GPIO_ACTIVE_HIGH>;
 };
 
 &spi1 {
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts b/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
index 31ea3d0182c062ef..fdaa8472b7a72075 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
@@ -167,7 +167,7 @@ rt5651: rt5651@1a {
 		reg = <0x1a>;
 		clocks = <&cru SCLK_I2S_8CH_OUT>;
 		clock-names = "mclk";
-		hp-det-gpio = <&gpio4 RK_PC4 GPIO_ACTIVE_LOW>;
+		hp-det-gpios = <&gpio4 RK_PC4 GPIO_ACTIVE_LOW>;
 		spk-con-gpio = <&gpio0 RK_PB3 GPIO_ACTIVE_HIGH>;
 		#sound-dai-cells = <0>;
 	};
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts b/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
index c667704ba985e463..aefa0d376dd8af20 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
@@ -23,7 +23,7 @@ analog-sound {
 		compatible = "audio-graph-card";
 		dais = <&i2s0_8ch_p0>;
 		label = "rk3588-es8316";
-		hp-det-gpio = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
+		hp-det-gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&hp_detect>;
 		routing = "MIC2", "Mic Jack",
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
index d0b922b8d67e85a0..e4e6c23c66845066 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
@@ -46,7 +46,7 @@ analog-sound {
 		compatible = "audio-graph-card";
 		label = "rk3588-es8316";
 		dais = <&i2s0_8ch_p0>;
-		hp-det-gpio = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
+		hp-det-gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&hp_detect>;
 		routing = "MIC2", "Mic Jack",
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
index 966bbc582d89b89c..8d3bbfd996560289 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
@@ -32,7 +32,7 @@ analog-sound {
 			  "Headphones", "HPOR";
 
 		dais = <&i2s0_8ch_p0>;
-		hp-det-gpio = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
+		hp-det-gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&hp_detect>;
 	};
-- 
2.34.1

