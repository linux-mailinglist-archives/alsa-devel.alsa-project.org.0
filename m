Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0404459E19
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 09:33:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50C5C16EA;
	Tue, 23 Nov 2021 09:32:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50C5C16EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637656381;
	bh=3qCtJDqxE06BEIya7Ex7qw7hiN17gpL9ZoeabUOJYSM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vRl7OxL+G15YTGkDKmEHWbFGKdM08qsVhtMcdVBaUCFr9YTIGRD3l6YtKlOoB8MHB
	 CfYZr5Zv+2AcW40e3M5mQEk83DGmdhaD/htMoW573wFQsFzAPJl8+Iw1rKHHPXqz0Y
	 I2KXJFKncojaidnIOIa50rg7SamlmEF+f+BkGAxM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D740DF805ED;
	Tue, 23 Nov 2021 09:22:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F93CF80245; Mon, 22 Nov 2021 16:57:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_135, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39C33F800E7
 for <alsa-devel@alsa-project.org>; Mon, 22 Nov 2021 16:56:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39C33F800E7
Received: from ramsan.of.borg ([84.195.186.194])
 by xavier.telenet-ops.be with bizsmtp
 id MTwH260044C55Sk01TwHfq; Mon, 22 Nov 2021 16:56:58 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mpBe5-00EL3K-Py; Mon, 22 Nov 2021 16:54:17 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mpBe5-00HGy1-9n; Mon, 22 Nov 2021 16:54:17 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Rajendra Nayak <rnayak@codeaurora.org>, Paul Walmsley <paul@pwsan.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Tero Kristo <kristo@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Benoit Parrot <bparrot@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Ulf Hansson <ulf.hansson@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@codeaurora.org>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 00/17] Non-const bitfield helper conversions
Date: Mon, 22 Nov 2021 16:53:53 +0100
Message-Id: <cover.1637592133.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 23 Nov 2021 09:20:57 +0100
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-aspeed@lists.ozlabs.org, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-wireless@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, netdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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

	Hi all,

<linux/bitfield.h> contains various helpers for accessing bitfields, as
typically used in hardware registers for memory-mapped I/O blocks. These
helpers ensure type safety, and deduce automatically shift values from
mask values, avoiding mistakes due to inconsistent shifts and masks, and
leading to a reduction in source code size.

I have already submitted a few conversions to the FIELD_{GET,PREP}()
helpers that were fixes for real bugs:
  - [PATCH] mips: cm: Convert to bitfield API to fix out-of-bounds
    access
    https://lore.kernel.org/r/0471c545117c5fa05bd9c73005cda9b74608a61e.1635501373.git.geert+renesas@glider.be
  - [PATCH] drm/armada: Fix off-by-one error in
    armada_overlay_get_property()
    https://lore.kernel.org/r/5818c8b04834e6a9525441bc181580a230354b69.1635501237.git.geert+renesas@glider.be

Plus several patches for normal conversions:
  - [PATCH] ARM: ptrace: Use bitfield helpers
    https://lore.kernel.org/r/a1445d3abb45cfc95cb1b03180fd53caf122035b.1637593297.git.geert+renesas@glider.be
  - [PATCH] MIPS: CPC: Use bitfield helpers
    https://lore.kernel.org/r/35f0f17e3d987afaa9cd09cdcb8131d42a53c3e1.1637593297.git.geert+renesas@glider.be
  - [PATCH] MIPS: CPS: Use bitfield helpers
    https://lore.kernel.org/r/8bd8b1b9a3787e594285addcf2057754540d0a5f.1637593297.git.geert+renesas@glider.be
  - [PATCH] crypto: sa2ul - Use bitfield helpers
    https://lore.kernel.org/r/ca89d204ef2e40193479db2742eadf0d9cf3c0ff.1637593297.git.geert+renesas@glider.be
  - [PATCH] dmaengine: stm32-mdma: Use bitfield helpers
    https://lore.kernel.org/r/36ceab242a594233dc7dc6f1dddb4ac32d1e846f.1637593297.git.geert+renesas@glider.be
  - [PATCH] intel_th: Use bitfield helpers
    https://lore.kernel.org/r/b1e4f027aa88acfbdfaa771b0920bd1d977828ba.1637593297.git.geert+renesas@glider.be
  - [PATCH] Input: palmas-pwrbutton - use bitfield helpers
    https://lore.kernel.org/r/f8831b88346b36fc6e01e0910d0db6c94287d2b4.1637593297.git.geert+renesas@glider.be
  - [PATCH] irqchip/mips-gic: Use bitfield helpers
    https://lore.kernel.org/r/74f9d126961a90d3e311b92a54870eaac5b3ae57.1637593297.git.geert+renesas@glider.be
  - [PATCH] mfd: mc13xxx: Use bitfield helpers
    https://lore.kernel.org/r/afa46868cf8c1666e9cbbbec42767ca2294b024d.1637593297.git.geert+renesas@glider.be
  - [PATCH] regulator: lp873x: Use bitfield helpers
    https://lore.kernel.org/r/44d60384b640c8586b4ca7edbc9287a34ce21c5b.1637593297.git.geert+renesas@glider.be
  - [PATCH] regulator: lp87565: Use bitfield helpers
    https://lore.kernel.org/r/941c2dfd5b5b124b8950bcce42db4c343dfe9821.1637593297.git.geert+renesas@glider.be

The existing FIELD_{GET,PREP}() macros are limited to compile-time
constants.  However, it is very common to prepare or extract bitfield
elements where the bitfield mask is not a compile-time constant.
To avoid this limitation, the AT91 clock driver already has its own
field_{prep,get}() macros.

This patch series makes them available for general use, and converts
several drivers to the existing FIELD_{GET,PREP}() and the new
field_{get,prep}() helpers.

I can take the first two patches through the reneas-clk tree for v5.17,
but probably it is best for the remaining patches to be postponed to
v5.18.

Thanks for your comments!

Geert Uytterhoeven (17):
  bitfield: Add non-constant field_{prep,get}() helpers
  clk: renesas: Use bitfield helpers
  [RFC] soc: renesas: Use bitfield helpers
  [RFC] ARM: OMAP2+: Use bitfield helpers
  [RFC] bus: omap_l3_noc: Use bitfield helpers
  [RFC] clk: ti: Use bitfield helpers
  [RFC] iio: st_sensors: Use bitfield helpers
  [RFC] iio: humidity: hts221: Use bitfield helpers
  [RFC] iio: imu: st_lsm6dsx: Use bitfield helpers
  [RFC] media: ti-vpe: cal: Use bitfield helpers
  [RFC] mmc: sdhci-of-aspeed: Use bitfield helpers
  [RFC] pinctrl: aspeed: Use bitfield helpers
  [RFC] pinctl: ti: iodelay: Use bitfield helpers
  [RFC] regulator: ti-abb: Use bitfield helpers
  [RFC] thermal/ti-soc-thermal: Use bitfield helpers
  [RFC] ALSA: ice1724: Use bitfield helpers
  [RFC] rtw89: Use bitfield helpers

 arch/arm/mach-omap2/clkt2xxx_dpllcore.c       |  5 +-
 arch/arm/mach-omap2/cm2xxx.c                  | 11 ++-
 arch/arm/mach-omap2/cm2xxx_3xxx.h             |  9 +--
 arch/arm/mach-omap2/cm33xx.c                  |  9 +--
 arch/arm/mach-omap2/cm3xxx.c                  |  7 +-
 arch/arm/mach-omap2/cminst44xx.c              |  9 +--
 arch/arm/mach-omap2/powerdomains3xxx_data.c   |  3 +-
 arch/arm/mach-omap2/prm.h                     |  2 -
 arch/arm/mach-omap2/prm2xxx.c                 |  4 +-
 arch/arm/mach-omap2/prm2xxx_3xxx.c            |  7 +-
 arch/arm/mach-omap2/prm2xxx_3xxx.h            |  9 +--
 arch/arm/mach-omap2/prm33xx.c                 | 53 +++++-------
 arch/arm/mach-omap2/prm3xxx.c                 |  3 +-
 arch/arm/mach-omap2/prm44xx.c                 | 53 ++++--------
 arch/arm/mach-omap2/vc.c                      | 12 +--
 arch/arm/mach-omap2/vp.c                      | 11 +--
 drivers/bus/omap_l3_noc.c                     |  4 +-
 drivers/clk/at91/clk-peripheral.c             |  1 +
 drivers/clk/at91/pmc.h                        |  3 -
 drivers/clk/renesas/clk-div6.c                |  6 +-
 drivers/clk/renesas/r8a779a0-cpg-mssr.c       |  9 +--
 drivers/clk/renesas/rcar-gen3-cpg.c           | 15 ++--
 drivers/clk/ti/apll.c                         | 25 +++---
 drivers/clk/ti/dpll3xxx.c                     | 81 ++++++++-----------
 .../iio/common/st_sensors/st_sensors_core.c   |  5 +-
 drivers/iio/humidity/hts221_core.c            |  8 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h       |  1 -
 .../iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c    |  7 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c  | 45 +++++------
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c  | 11 +--
 drivers/media/platform/ti-vpe/cal.h           |  4 +-
 drivers/mmc/host/sdhci-of-aspeed.c            |  5 +-
 drivers/net/wireless/realtek/rtw89/core.h     | 38 ++-------
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c    |  3 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c    |  3 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c    |  3 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c       |  5 +-
 drivers/pinctrl/aspeed/pinmux-aspeed.c        |  6 +-
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c       | 35 +++-----
 drivers/regulator/ti-abb-regulator.c          |  7 +-
 drivers/soc/renesas/renesas-soc.c             |  4 +-
 drivers/thermal/ti-soc-thermal/ti-bandgap.c   | 11 ++-
 include/linux/bitfield.h                      | 30 +++++++
 sound/pci/ice1712/wm8766.c                    | 14 ++--
 sound/pci/ice1712/wm8776.c                    | 14 ++--
 45 files changed, 263 insertions(+), 347 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
