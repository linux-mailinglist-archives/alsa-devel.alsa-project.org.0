Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 643F2988567
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2024 14:45:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D69BEE72;
	Fri, 27 Sep 2024 14:45:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D69BEE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727441128;
	bh=gFzWTvfAcB8evQtYGWDacqU3trX8Q3qpt11KSqg6udw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rMYCnC0EqLKWayEBnOaLeYeY9XIsUOa7UiMrirkB+DN+74Daafv3t3UqoYwgBjK6y
	 VSsLSex9YIP32wbCoqVUWGdYtFfeueMjpxli3a/BI3T4y9jqrMC4SDr+bVKfW0D4Qj
	 6zqpbtFKVEwNN1CnSJPYMhe6B6iaDlKv0SFpqGv8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42698F806A5; Fri, 27 Sep 2024 14:43:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BB30F805A9;
	Fri, 27 Sep 2024 14:43:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36DEAF802DB; Fri, 27 Sep 2024 14:43:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_PASS,SPF_NONE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A86D1F804FC
	for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2024 14:43:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A86D1F804FC
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b47d:fd74:3975:15b7])
	by andre.telenet-ops.be with cmsmtp
	id HQic2D0053BfLyr01Qicif; Fri, 27 Sep 2024 14:43:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIj-000fQB-JD;
	Fri, 27 Sep 2024 14:42:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIp-008IED-5c;
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
Subject: [PATCH treewide 10/11] ARM: dts: nxp: imx: Switch to
 {hp,mic}-det-gpios
Date: Fri, 27 Sep 2024 14:42:25 +0200
Message-Id: 
 <7ff1bfb73a6d6fc71f3d751dbb7133b045853f64.1727438777.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727438777.git.geert+renesas@glider.be>
References: <cover.1727438777.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HD6B5AOIYL56G6U7QMSLVALCDQIX3J4U
X-Message-ID-Hash: HD6B5AOIYL56G6U7QMSLVALCDQIX3J4U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HD6B5AOIYL56G6U7QMSLVALCDQIX3J4U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace the deprecated "hp-det-gpio" and "mic-det-gpio" properties by
"hp-det-gpios" resp. "mic-det-gpios" in Freescale Generic ASoC Sound
Card device nodes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This has a run-time dependency on "ASoC: fsl-asoc-card: Add missing
handling of {hp,mic}-dt-gpios".
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi  | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts        | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts         | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
index 8f4f5fba68cc5f4f..86a86dc370c4a9fb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
@@ -113,8 +113,8 @@ sound {
 			"DMICDAT", "DMIC";
 		mux-int-port = <2>;
 		mux-ext-port = <3>;
-		hp-det-gpio = <&gpio7 8 GPIO_ACTIVE_LOW>;
-		mic-det-gpio = <&gpio1 9 GPIO_ACTIVE_LOW>;
+		hp-det-gpios = <&gpio7 8 GPIO_ACTIVE_LOW>;
+		mic-det-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
 	};
 
 	backlight_lvds: backlight-lvds {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts b/arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts
index 7c899291ab0dada4..542d633651f24575 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts
@@ -108,7 +108,7 @@ sound {
 			"IN3R", "AMIC";
 		mux-int-port = <2>;
 		mux-ext-port = <3>;
-		hp-det-gpio = <&gpio4 19 GPIO_ACTIVE_LOW>;
+		hp-det-gpios = <&gpio4 19 GPIO_ACTIVE_LOW>;
 	};
 
 	panel {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts b/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts
index febc2dd9967de69e..c5383158e25c959b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts
@@ -157,7 +157,7 @@ sound {
 			"IN3R", "AMIC";
 		mux-int-port = <2>;
 		mux-ext-port = <3>;
-		hp-det-gpio = <&gpio4 24 GPIO_ACTIVE_LOW>;
+		hp-det-gpios = <&gpio4 24 GPIO_ACTIVE_LOW>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
index 277a6e039045b575..ddd01b6dee5a9976 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
@@ -167,7 +167,7 @@ sound {
 			"IN3R", "AMIC";
 		mux-int-port = <2>;
 		mux-ext-port = <6>;
-		hp-det-gpio = <&gpio1 17 GPIO_ACTIVE_LOW>;
+		hp-det-gpios = <&gpio1 17 GPIO_ACTIVE_LOW>;
 	};
 
 	panel {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi
index b74ee8948a781762..0e839bbfea082140 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi
@@ -68,7 +68,7 @@ sound-wm8960 {
 		audio-cpu = <&sai2>;
 		audio-codec = <&codec>;
 		audio-asrc = <&asrc>;
-		hp-det-gpio = <&gpio5 4 0>;
+		hp-det-gpios = <&gpio5 4 0>;
 		audio-routing =
 			"Headphone Jack", "HP_L",
 			"Headphone Jack", "HP_R",
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts b/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
index f712537fca161ab9..6cde84636900bb00 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
@@ -169,7 +169,7 @@ sound {
 		model = "wm8960-audio";
 		audio-cpu = <&sai1>;
 		audio-codec = <&codec>;
-		hp-det-gpio = <&gpio2 28 GPIO_ACTIVE_HIGH>;
+		hp-det-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>;
 		audio-routing =
 			"Headphone Jack", "HP_L",
 			"Headphone Jack", "HP_R",
-- 
2.34.1

