Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7371F98855C
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2024 14:44:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF65E851;
	Fri, 27 Sep 2024 14:44:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF65E851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727441076;
	bh=2QXljp1dC/8iHwUW7hKb7vZR7RspRKinKvyyOkLSgtI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=pXk70F+QVToKE1PZw+pA6WoAlrSLs0ds5Jx65j6o3oETyIQlNx6arSOHsNa5MyiP1
	 qzrEbMYDM7x3iRkE6J8I1sk9CRI2Cjo1mUqMpW+qQ5kzSOLQVZ6WSAyjVEAu515Ch8
	 TWOBSFylJDFIZPELdRghfmZJvkvTCrLJiLpjLimU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E0ABF8060B; Fri, 27 Sep 2024 14:43:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99C7AF8061B;
	Fri, 27 Sep 2024 14:43:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB7E4F80518; Fri, 27 Sep 2024 14:43:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_PASS,SPF_NONE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3D74F8047C
	for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2024 14:43:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3D74F8047C
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b47d:fd74:3975:15b7])
	by baptiste.telenet-ops.be with cmsmtp
	id HQic2D00C3BfLyr01Qicjs; Fri, 27 Sep 2024 14:43:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIj-000fPq-HD;
	Fri, 27 Sep 2024 14:42:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIo-008IDa-TV;
	Fri, 27 Sep 2024 14:42:30 +0200
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
Subject: [PATCH treewide 00/11] ASoC: Clean up {hp,mic}-det-gpio handling
Date: Fri, 27 Sep 2024 14:42:15 +0200
Message-Id: <cover.1727438777.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UJOFCZQD4FQ3XQOZDJGF5JZDBBRRZ5KU
X-Message-ID-Hash: UJOFCZQD4FQ3XQOZDJGF5JZDBBRRZ5KU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UJOFCZQD4FQ3XQOZDJGF5JZDBBRRZ5KU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

	Hi all,

The "gpio" suffix for GPIO consumers was deprecated a while ago, in
favor of the "gpios" suffix.  However, there are still several users of
the "hp-det-gpio" and "mic-det-gpio" properties, in DT bindings,
drivers, and DT source files.

Drivers that use gpiolib handle both the deprecated and new properties
transparently, but that is not the case when using of_property_*() calls
directly.

  - The first patch fixes a bug, as the Freescale Generic ASoC Sound
    driver handles only the deprecated properties, while there is
    already a user of the new variants,
  - The second patch updates the Audio Graph and Simple Audio Card DT
    bindings,
  - Patches 3-9 converts various DTS files to use the new properties,
  - The last 2 patches convert Freescale sound device nodes to use the
    new properties.

All patches can be applied independently, except for the last two, which
depend on the first patch to avoid regressions.
This series was compile-tested only.

Thanks for your comments!

Geert Uytterhoeven (11):
  ASoC: fsl-asoc-card: Add missing handling of {hp,mic}-dt-gpios
  ASoC: dt-bindings: Deprecate {hp,mic}-det-gpio
  ARM: dts: marvell: mmp2-olpc-xo-1-75: Switch to {hp,mic}-det-gpios
  arm64: dts: freescale: imx: Switch to simple-audio-card,hp-det-gpios
  arm64: dts: renesas: beacon-renesom: Switch to mic-det-gpios
  arm64: dts: rockchip: Switch to simple-audio-card,hp-det-gpios
  arm64: dts: rockchip: Switch to hp-det-gpios
  arm64: dts: uniphier: Switch to hp-det-gpios
  mips: dts: ingenic: Switch to simple-audio-card,hp-det-gpios
  ARM: dts: nxp: imx: Switch to {hp,mic}-det-gpios
  arm64: dts: freescale: imx: Switch to hp-det-gpios

 .../devicetree/bindings/sound/audio-graph.yaml       |  6 ++++++
 .../devicetree/bindings/sound/simple-card.yaml       | 12 ++++++++++++
 arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dts      |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi       |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts             |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts            |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi            |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi      |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts              |  2 +-
 .../boot/dts/freescale/imx8mq-librem5-devkit.dts     |  2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi    |  2 +-
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts         |  2 +-
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts        |  2 +-
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts    |  2 +-
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi   |  2 +-
 .../boot/dts/rockchip/rk3326-anbernic-rg351m.dtsi    |  2 +-
 .../arm64/boot/dts/rockchip/rk3326-gameforce-chi.dts |  2 +-
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go.dtsi   |  2 +-
 arch/arm64/boot/dts/rockchip/rk3368-lba3368.dts      |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts    |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts  |  2 +-
 .../boot/dts/rockchip/rk3399-rock-pi-4a-plus.dts     |  2 +-
 .../boot/dts/rockchip/rk3399-rock-pi-4b-plus.dts     |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dts   |  2 +-
 .../boot/dts/rockchip/rk3399-sapphire-excavator.dts  |  2 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg-arc.dtsi    |  2 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg353p.dts     |  2 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg353ps.dts    |  2 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg353v.dts     |  2 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg353vs.dts    |  2 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg503.dts      |  2 +-
 arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi    |  2 +-
 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dts |  2 +-
 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts    |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts     |  2 +-
 .../dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts  |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi   |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dts     |  2 +-
 .../boot/dts/rockchip/rk3588-orangepi-5-plus.dts     |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts  |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts   |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts      |  2 +-
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts      |  2 +-
 .../boot/dts/socionext/uniphier-ld11-global.dts      |  2 +-
 .../boot/dts/socionext/uniphier-ld20-global.dts      |  2 +-
 arch/mips/boot/dts/ingenic/gcw0.dts                  |  2 +-
 arch/mips/boot/dts/ingenic/rs90.dts                  |  2 +-
 sound/soc/fsl/fsl-asoc-card.c                        |  8 +++++---
 50 files changed, 72 insertions(+), 52 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
