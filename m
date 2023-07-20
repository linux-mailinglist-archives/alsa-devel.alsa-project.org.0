Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DADE75C0FA
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:13:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDF703E7;
	Fri, 21 Jul 2023 10:12:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDF703E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689927194;
	bh=YgFBegmvSUmFjVfm+5I+iUawrfnzLKsNsr9Fe2lpEiw=;
	h=From:Subject:Date:To:Cc:Reply-To:List-Id:List-Archive:List-Help:
	 List-Owner:List-Post:List-Subscribe:List-Unsubscribe:From;
	b=r7GZAIPOewCfRAGm/YzuUyLH/o00+S/MK10Lm6I+jBM5MiOf0odoCk4CnHc8yV9dM
	 hihFfPp7IphE1398Yoz0lxCTsydVn88u3HTcB+bdTx0t68cR8PZGtxY1XNUGPTsiK6
	 gZdd3HKFE/owL2YZMn4mjNLCl3mKiTFBQuoRG2cM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4DCFF80605; Fri, 21 Jul 2023 10:09:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C77AAF80600;
	Fri, 21 Jul 2023 10:09:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85299F804DA; Thu, 20 Jul 2023 10:30:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08059F80153
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 10:29:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08059F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Klt0cAn5
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A8B6961926;
	Thu, 20 Jul 2023 08:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD2EEC433C7;
	Thu, 20 Jul 2023 08:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689841795;
	bh=YgFBegmvSUmFjVfm+5I+iUawrfnzLKsNsr9Fe2lpEiw=;
	h=From:Subject:Date:List-Id:To:Cc:Reply-To:From;
	b=Klt0cAn5b3XGPrqg0QG/JTemda4KjAfETmXTU70RW15pHi22/pAr1t8l862i+yBMx
	 PXIOTP1BU3pmuotxZsRVUpiBbir90pQOxHJ3s1osWG6QAzNJCX/WyM9866yiiP/cwr
	 Wzg51BSm9kwCSF97i1gTH55cfRbj0O01KN+O2uF4sDH406T2q3Hpm5UxmLI4NvUzc5
	 fJDxHGEWIOUFHxolhT1NHf/Sx6i5sUe+rRKKdO0XcAjJnxbs0+Gs0GhNKYI9VmbCay
	 GoKS4WervuRFyNLEGtxW8YAqM8gWB/qrOMqtcjTHew9QyDSWjIKPRn4vBqBjYaXN1d
	 s90K/mq2tEHNw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8734FEB64DA;
	Thu, 20 Jul 2023 08:29:55 +0000 (UTC)
From: 
 Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Subject: [PATCH v3 00/42] ep93xx device tree conversion
Date: Thu, 20 Jul 2023 14:29:00 +0300
Message-Id: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHwauWQC/0WNyw6CMBBFf4V07ZB2ykNZ+R/GRYHBTrQFWzAkh
 H+3uHF5ck/O3USkwBRFk20i0Icjjz6BPmWis8Y/CLhPLFCilpUsgaaLXleQqqsrrWrCHkWSWxM
 J2mB8Zw/dmThTOIYp0MDr7+F2TzyE0cFsA5l/t8BCoS4Rc3XWEkGB5yfPJo92adlfnXkvNNArd
 yT2/QvAana2tAAAAA==
To: Hartley Sweeten <hsweeten@visionengravers.com>,
 Lennert Buytenhek <kernel@wantstofly.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Lukasz Majewski <lukma@denx.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Nikita Shubin <nikita.shubin@maquefel.me>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Sebastian Reichel <sre@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Damien Le Moal <dlemoal@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Andy Shevchenko <andy@kernel.org>,
 Michael Peters <mpeters@embeddedTS.com>, Kris Bahnsen <kris@embeddedTS.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
 linux-input@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689852590; l=14761;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=YgFBegmvSUmFjVfm+5I+iUawrfnzLKsNsr9Fe2lpEiw=; =?utf-8?q?b=3DCWHsTroPIciE?=
 =?utf-8?q?fRVVR884L11fNlH/wFjIrU6hDIQ2bcCt5LC0EPoDZEde9uaqUjK27sngAvPrJNX8?=
 bwG/5jErAWRyT/ug1+iKsAwe1yBP5tghPYNXGuNdMXBA2HzDkinz
X-Developer-Key: i=nikita.shubin@maquefel.me; a=ed25519;
 pk=vqf5YIUJ7BJv3EJFaNNxWZgGuMgDH6rwufTLflwU9ac=
X-Endpoint-Received: 
 by B4 Relay for nikita.shubin@maquefel.me/20230718 with auth_id=65
X-Original-From: Nikita Shubin <nikita.shubin@maquefel.me>
X-MailFrom: devnull+nikita.shubin.maquefel.me@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SYPAWSEADKELRL56BZQIGDBC3BWFL7HB
X-Message-ID-Hash: SYPAWSEADKELRL56BZQIGDBC3BWFL7HB
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:08:56 +0000
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: nikita.shubin@maquefel.me
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series aims to convert ep93xx from platform to full device tree support.

The main goal is to receive ACK's to take it via Arnd's arm-soc branch.

I've moved to b4, tricking it to consider v0 as v1, so it consider's
this version to be v3, this exactly the third version.

Link to previous versions:
https://lore.kernel.org/all/20230424123522.18302-1-nikita.shubin@maquefel.me/

Major changes with clocks:
- split all ep93xx clk into two groups:
  - those who are special to ep93xx (i.e. can't be implemented via standard clk's)
  and use special swlocked registers
  - those who can be implemented via devm_clk_hw_register_gate, etc...
- moved all clk's that are not used via device tree to SoC driver
- dropped init and globals
- devm_* everywhere

Other notable changes:
- added a global spinlock for SoC driver to protect swlocked register's.
- moved dts file into cirrus 
- dropped "dt-bindings: gpio: Add Cirrus EP93xx" as it was taken by
  Bartosz via gpio subsystem

on master v6.5-rc2-89-g3acbd4602b05:
make dtbs_check
```
make -j34 -C build-linux ARCH=arm CROSS_COMPILE=armv4t-softfloat-linux-gnueabi- dtbs_check  -s
arch/arm/boot/dts/cirrus/ep93xx-edb9302.dtb:0:0: /soc/spi@808a0000/codec@0: failed to match any schema with compatible: ['cirrus,cs4271']
/home/maquefel/workshop/ts7250-boot-build/build-linux/arch/arm/boot/dts/cirrus/ep93xx-edb9302.dtb: sound: 'simple-audio-card,convert-sample-format' does not match any of the regexes: '^simple-audio-card,codec(@[0-9a-f]+)?$', '^simple-audio-card,cpu(@[0-9a-f]+)?$', '^simple-audio-card,dai-link(@[0-9a-f]+)?$', '^simple-audio-card,plat(@[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/maquefel/workshop/ts7250-boot-build/linux/Documentation/devicetree/bindings/sound/simple-card.yaml
```

cirrus,cs4271 is defined in linux/Documentation/devicetree/bindings/sound/cs4271.txt

`make dt_binding_check` shows no issues.

[PATCH v1 01/43] gpio: ep93xx: split device in multiple
- core.c:
	- fixed tab used instead of space
	- unsigned i in ep93xx_init_devices
- gpio-ep93xx.c:
	- single line for EP93XX_INT_DEBOUNCE_OFFSET
	- drop assignment from definition
	- s/devm_kcalloc/devm_kzalloc/
	- value check for platform_get_irq
	- used dev_err_probe
	- s/if (irq <= 0)/if (irq < 0)/

[PATCH v1 02/43] dt-bindings: soc: Add Cirrus EP93xx
- fixed title
- dropped "+|"
- dropped example, syscon, timer, required
- dropped clock header from this patch and moved to clk patch
- don't shadow irq_of_parse_and_map error

NOTES:
There is no possiblity to use fwnode_irq_get for TIMER_OF_DECLARE.

[PATCH v1 03/43] soc: Add SoC driver for Cirrus ep93xx
- s/Soc/SoC/
- sorted Kconfig, Makefile
- s/linux/Linux/
- headers sorted
- drop parentness
- drop comment entirely (it's obvious)
- drop global map
- add SoC Bus stuff to get rid of exporting ep93xx_chip_revision

Only PATA and CLK currently rely on revision, they can take it from soc_device_match.

[PATCH v1 04/43] dt-bindings: clock: Add Cirrus EP93xx
- filename now matches compatible
- dropped description
- dropped clock description
- dropped fixed-clock from example
- compatible first in example

[PATCH v1 06/43] dt-bindings: pinctrl: Add Cirrus EP93xx
- blank line after function
- dropped minItems, maxItems for groups
- fixed weird wrapping

[PATCH v1 07/43] pinctrl: add a Cirrus ep93xx SoC pin controller Nikita Shubin
- dropped 0 assigment in enum ep93xx_pinctrl_model
- convert to pingroup
- convert to pinfunction
- str_enabled_disabled
- s/of_match_node/of_device_get_match_data/
- numerous defaults for cases
- convert to dev_err_probe
- dropped dev_info noise
- add "gpio2agrp" to ep9301/ep9302 as they have 0 pin of Port C exposed

[PATCH v1 09/43] clocksource: ep93xx: Add driver for Cirrus Logic EP93xx
- headers sorted
- fixed comment
- use lo_hi_readq and UINT_MAX

[PATCH 12/43] clk: ep93xx: add DT support for Cirrus EP93xx
- move out all clocks that aren't used in device tree to SoC driver (pll1, pll2, usb)
- drop all static variables (regmap, clock data)
- DMA and USB clocks as standart gates to avoid additional checks (all other require swlocked_write)
- rearranged ep93xx_clk members to avoid holes
- numerous fixes from Andy
- don't get revision, use soc_device_match instead
- added own clk_get function to distinguish fixed and own clocks

[PATCH v1 14/43] power: reset: Add a driver for the ep93xx reset
- added private data with regmap, as we dropped global regmap in SoC dirver
- use dev_err_probe
- + bits.h header

[PATCH v1 17/43] dt-bindings: spi: Add Cirrus EP93xx
- fixed filename to cirrus,ep9301-spi.yaml
- dropped address and size cells
- dropped cs-gpio
- dropped cirrus,ep9301-use-dma - we are looking into "dmas" property now
- added proper gpio defines

[PATCH v1 18/43] spi: ep93xx: add DT support for Cirrus EP93xx
- use device_set_node + dev_fwnode
- s/of_property_present/device_property_present/

[PATCH v1 20/43] net: cirrus: add DT support for Cirrus EP93xx
- +dev_err_probe

[PATCH v1 22/43] dma: cirrus: add DT support for Cirrus EP93xx
- dropped subsys_initcall probe
- use of_device_get_match_data
- use struct_size for allocating memory with channel array
- rearranged data to take it out of CONFIG_OF
- + dev_err_probe

[PATCH v1 23/43] dt-bindings: mtd: Add ts7250 nand-controller
- unevaluatedProperties: false
- dropped address and size cells
- added nand node

[PATCH v1 24/43] mtd: nand: add support for ts72xx
- return -EINVAL on engine_type == ON_HOST
- added err_nand_cleanup goto
- s/derived/Derived from/
- BIT and GENMASK 
- s/sizeof(struct ts72xx_nand_data)/sizeof(*data)/ and one line
- fixed wierd mtd_device_parse_register error handling
- added child node parsing to conform device tree bindings (i.e. partitions contained in 'nand@0' child node)

[PATCH v1 26/43] pata: cirrus: add DT support for Cirrus EP93xx
- headers reordering
- s/-ENXIO/-ENOMEM/
- drop ep93xx_chip_revision, get data from soc_device_match
- changed title to "ata: pata_ep93xx: add device tree support"

[PATCH v1 27/43] dt-bindings: input: Add Cirrus EP93xx keypad
- s/cirrus,debounce-delay-ms/debounce-delay-ms/
- cirrus,prescale -> uint16 and constraints
- added "autorepeat"
- fixed compatible in example

[PATCH v1 28/43] input: keypad: ep93xx: add DT support for Cirrus EP93xx
- added autorepeat 
- dropped module param flags entirely
- s/of_property_read/device_property_read/

[PATCH v1 29/43] dt-bindings: rtc: Add ST M48T86
- renamed file to st,m48t86.yaml
- fixed typo
- reordered props

[PATCH v1 33/43] dt-bindings: gpio: Add Cirrus EP93xx
- renamed file to cirrus,ep9301-gpio.yaml
- dropped explicit examples (but left port F with uses 8 interrupts)

[PATCH v1 34/43] gpio: ep93xx: add DT support for gpio-ep93xx
- s/Add match table./Add OF ID match table./

[PATCH v1 35/43] ARM: dts: add device tree for ep93xx Soc
- splitted dtsi and dts
- made nand-controller, leds, etc... part of the board and not SoC
- dropped empty spi bus
- labels sorted
- dropped "delete-property" everywhere
- compatible first, reg is second, ranges, if present, third
- fixed wrapping 
- status last
- moved cs gpios to board files
- led0 -> led-0, led1 -> led-1

[PATCH v1 38/43] pata: cirrus: drop legacy pinctrl
- changed title to "ata: pata_ep93xx: remove legacy pinctrl use"
- removed ep93xx_ide_acquire_gpio and ep93xx_ide_release_gpio along with this patch

--
2.39.2

---
Alexander Sverdlin (2):
      ARM: dts: ep93xx: Add EDB9302 DT
      ASoC: cirrus: edb93xx: Delete driver

Nikita Shubin (40):
      gpio: ep93xx: split device in multiple
      dt-bindings: clock: Add Cirrus EP93xx
      clk: ep93xx: add DT support for Cirrus EP93xx
      dt-bindings: pinctrl: Add Cirrus EP93xx
      pinctrl: add a Cirrus ep93xx SoC pin controller
      dt-bindings: soc: Add Cirrus EP93xx
      soc: Add SoC driver for Cirrus ep93xx
      dt-bindings: timers: Add Cirrus EP93xx
      clocksource: ep93xx: Add driver for Cirrus Logic EP93xx
      dt-bindings: rtc: Add Cirrus EP93xx
      rtc: ep93xx: add DT support for Cirrus EP93xx
      dt-bindings: watchdog: Add Cirrus EP93x
      watchdog: ep93xx: add DT support for Cirrus EP93xx
      power: reset: Add a driver for the ep93xx reset
      dt-bindings: pwm: Add Cirrus EP93xx
      pwm: ep93xx: add DT support for Cirrus EP93xx
      dt-bindings: spi: Add Cirrus EP93xx
      spi: ep93xx: add DT support for Cirrus EP93xx
      dt-bindings: net: Add Cirrus EP93xx
      net: cirrus: add DT support for Cirrus EP93xx
      dt-bindings: dma: Add Cirrus EP93xx
      dma: cirrus: add DT support for Cirrus EP93xx
      dt-bindings: mtd: Add ts7200 nand-controller
      mtd: nand: add support for ts72xx
      dt-bindings: ata: Add Cirrus EP93xx
      ata: pata_ep93xx: add device tree support
      dt-bindings: input: Add Cirrus EP93xx keypad
      input: keypad: ep93xx: add DT support for Cirrus EP93xx
      dt-bindings: rtc: Add ST M48T86
      rtc: m48t86: add DT support for m48t86
      dt-bindings: wdt: Add ts72xx
      wdt: ts72xx: add DT support for ts72xx
      gpio: ep93xx: add DT support for gpio-ep93xx
      ARM: dts: add Cirrus EP93XX SoC .dtsi
      ARM: dts: ep93xx: add ts7250 board
      ARM: ep93xx: DT for the Cirrus ep93xx SoC platforms
      pwm: ep93xx: drop legacy pinctrl
      ata: pata_ep93xx: remove legacy pinctrl use
      ARM: ep93xx: delete all boardfiles
      ARM: ep93xx: soc: drop defines

 .../bindings/arm/cirrus/ep9301-syscon.yaml         |   59 +
 .../devicetree/bindings/arm/cirrus/ep9301.yaml     |   39 +
 .../bindings/ata/cirrus,ep9312-pata.yaml           |   44 +
 .../bindings/clock/cirrus,ep9301-clk.yaml          |   46 +
 .../bindings/dma/cirrus,ep9301-dma-m2m.yaml        |   72 +
 .../bindings/dma/cirrus,ep9301-dma-m2p.yaml        |  124 ++
 .../bindings/input/cirrus,ep9307-keypad.yaml       |   87 ++
 .../devicetree/bindings/mtd/technologic,nand.yaml  |   47 +
 .../devicetree/bindings/net/cirrus,ep9301-eth.yaml |   61 +
 .../bindings/pinctrl/cirrus,ep9301-pinctrl.yaml    |   58 +
 .../devicetree/bindings/pwm/cirrus,ep9301-pwm.yaml |   48 +
 .../devicetree/bindings/rtc/cirrus,ep9301-rtc.yaml |   40 +
 .../devicetree/bindings/rtc/st,m48t86.yaml         |   38 +
 .../devicetree/bindings/spi/cirrus,ep9301-spi.yaml |   63 +
 .../bindings/timer/cirrus,ep9301-timer.yaml        |   49 +
 .../bindings/watchdog/cirrus,ep9301-wdt.yaml       |   46 +
 .../bindings/watchdog/technologic,ts7200-wdt.yaml  |   46 +
 arch/arm/Makefile                                  |    1 -
 arch/arm/boot/dts/cirrus/Makefile                  |    4 +
 arch/arm/boot/dts/cirrus/ep93xx-bk3.dts            |  126 ++
 arch/arm/boot/dts/cirrus/ep93xx-edb9302.dts        |  178 +++
 arch/arm/boot/dts/cirrus/ep93xx-ts7250.dts         |  145 ++
 arch/arm/boot/dts/cirrus/ep93xx.dtsi               |  449 ++++++
 arch/arm/mach-ep93xx/Kconfig                       |   20 +-
 arch/arm/mach-ep93xx/Makefile                      |   11 -
 arch/arm/mach-ep93xx/clock.c                       |  733 ----------
 arch/arm/mach-ep93xx/core.c                        | 1017 --------------
 arch/arm/mach-ep93xx/dma.c                         |  114 --
 arch/arm/mach-ep93xx/edb93xx.c                     |  344 -----
 arch/arm/mach-ep93xx/ep93xx-regs.h                 |   38 -
 arch/arm/mach-ep93xx/gpio-ep93xx.h                 |  111 --
 arch/arm/mach-ep93xx/hardware.h                    |   25 -
 arch/arm/mach-ep93xx/irqs.h                        |   76 -
 arch/arm/mach-ep93xx/platform.h                    |   42 -
 arch/arm/mach-ep93xx/soc.h                         |  212 ---
 arch/arm/mach-ep93xx/ts72xx.c                      |  422 ------
 arch/arm/mach-ep93xx/ts72xx.h                      |   94 --
 arch/arm/mach-ep93xx/vision_ep9307.c               |  311 -----
 drivers/ata/pata_ep93xx.c                          |   49 +-
 drivers/clk/Kconfig                                |    8 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/clk-ep93xx.c                           |  764 +++++++++++
 drivers/clocksource/Kconfig                        |   11 +
 drivers/clocksource/Makefile                       |    1 +
 .../clocksource}/timer-ep93xx.c                    |  155 ++-
 drivers/dma/ep93xx_dma.c                           |  131 +-
 drivers/gpio/gpio-ep93xx.c                         |  332 ++---
 drivers/input/keyboard/ep93xx_keypad.c             |   74 +-
 drivers/mtd/nand/raw/Kconfig                       |    7 +
 drivers/mtd/nand/raw/Makefile                      |    1 +
 drivers/mtd/nand/raw/technologic-nand-controller.c |  162 +++
 drivers/net/ethernet/cirrus/ep93xx_eth.c           |   61 +-
 drivers/pinctrl/Kconfig                            |    7 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-ep93xx.c                   | 1447 ++++++++++++++++++++
 drivers/power/reset/Kconfig                        |   10 +
 drivers/power/reset/Makefile                       |    1 +
 drivers/power/reset/ep93xx-restart.c               |   86 ++
 drivers/pwm/pwm-ep93xx.c                           |   26 +-
 drivers/rtc/rtc-ep93xx.c                           |    8 +
 drivers/rtc/rtc-m48t86.c                           |    8 +
 drivers/soc/Kconfig                                |    1 +
 drivers/soc/Makefile                               |    1 +
 drivers/soc/cirrus/Kconfig                         |   12 +
 drivers/soc/cirrus/Makefile                        |    2 +
 drivers/soc/cirrus/soc-ep93xx.c                    |  231 ++++
 drivers/spi/spi-ep93xx.c                           |   28 +-
 drivers/watchdog/ep93xx_wdt.c                      |    8 +
 drivers/watchdog/ts72xx_wdt.c                      |    8 +
 include/dt-bindings/clock/cirrus,ep93xx-clock.h    |   41 +
 include/dt-bindings/dma/cirrus,ep93xx-dma.h        |   26 +
 include/linux/platform_data/dma-ep93xx.h           |   25 +-
 include/linux/platform_data/eth-ep93xx.h           |   10 -
 include/linux/platform_data/keypad-ep93xx.h        |   32 -
 include/linux/soc/cirrus/ep93xx.h                  |   33 +-
 sound/soc/cirrus/Kconfig                           |    9 -
 sound/soc/cirrus/Makefile                          |    4 -
 sound/soc/cirrus/edb93xx.c                         |  117 --
 78 files changed, 5205 insertions(+), 4174 deletions(-)
---
base-commit: ccff6d117d8dc8d8d86e8695a75e5f8b01e573bf
change-id: 20230605-ep93xx-01c76317e2d2

Best regards,
-- 
Nikita Shubin <nikita.shubin@maquefel.me>

