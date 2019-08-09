Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4814A8840F
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 22:30:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD804165E;
	Fri,  9 Aug 2019 22:29:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD804165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565382610;
	bh=xX05LUN7jW/ZkUGnZkXnLsbbx6s8jS0uEs22fNZ+TZ4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MsdWJRX+0olLrOXTvRnj66jcIcUPzCcsWlQTuGwHUSx1JTn/xE5NLMPiD6SdgJMzc
	 dms3Bv1QqwkiLoOxb1NjO6kzLCJiugSITxBoq9bMBnTTUXXiRXTUqe5+vp3UtHKHSG
	 5AJ9eHQRhB/wljbpxHSfS253CHV5jmpSICdaRQmU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D355EF803F3;
	Fri,  9 Aug 2019 22:28:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73161F803F3; Fri,  9 Aug 2019 22:28:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13, RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FB50F800E4
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 22:28:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FB50F800E4
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.129]) with ESMTPA (Nemesis) id
 1M7JvQ-1hxGt81mMG-007hOC; Fri, 09 Aug 2019 22:27:58 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: soc@kernel.org
Date: Fri,  9 Aug 2019 22:27:28 +0200
Message-Id: <20190809202749.742267-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:e79DZkgFNZp9dvGTGpRIzDbp1U9xKtmOwS7NFPvWoCd6W8DgsD8
 jFUaOsADnQ6HFt2f8JSvwKT8EjJLooql7wgw8IHL92/OCsO8hIy6Llwq9pC9ITibTzSW0Zi
 WnvPGjly+Jz6QZvY0sMmV3ekLUbB3HHPOjhXkeR+1bHaYxthIA0XyrnigzaPJoW2SE4PbNJ
 ZX50iQEG1VqSY3M3Abx7A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rQFXwhsBnbk=:vcvGYL5gwOuGJrKu5EyJdE
 pXygFIdcThx5H7XMGCHmk35kpFvAy/2y+Wkb4oZXuz1GjFsbLNqvdkVSjkUsesOEG+8YHB+Wv
 SXL4XjEZulOtG1QTXPnly6foF3gfGzwf5EXRucbGcOPLfHyfiV19XiOztVmavCg2PTcPt0cLU
 TeX23Y+MSGxSVegJjUIkfYkzIM5wwLUl2pUVYycLOyYhJS9rZiIx5dbyX3WMBZxxfVlNGu6HN
 LdnzKzi/L2t2OKa4LfwZd937QYk4rqsZymU+PUfEKiQwe+J+X4Hzkr7t0EhHS+lLSUh85jknc
 Rxs2+jz/0IlHIN5Xg6EHnSgzSEsFrUwS6KNspyEfffxN+vNESdlB4K71f70/b05uKwwxJTFBu
 L3u+ZZrQq2QpmF1XgxagBsCc2DI5j0OlW72Kx/6IU1BIwMILJRC9z9ouU1ibHJ28+fzfQLZ0K
 3XJb0cSZGsI8sxflpYzLQunxdv8mUeZNBZCmpsWWSDFLxqOmFnxBCbDX7p+4CSB5AVnccWbJb
 43frVwPcAXU8YrjXMqUXYTXmE/MWCrx3j17tK7op3/zRwi2QXApGezne/G03i0gnHAgS8QE4a
 6CWVbu6M6/6wJN24YtbQP91ovCVnK+1qQO0vqei4lgMzNBE1d82Ti91AO8cZyF7LGJwLv+kQu
 2HEAtywxk7QwdTDYMR8yI67QGy3UzJg/rjjBxJ3LA1Dh7cjxE0LAdmBIj8iNlZ4wXUwi+x7B2
 C1devbxpoi3Vyy6OBbE6SWUn/lPO76kTgiU/gw==
Cc: linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-fbdev@vger.kernel.org,
 "Wanzongshun \(Vincent\)" <wanzongshun@huawei.com>, linux-spi@vger.kernel.org,
 linux-gpio@vger.kernel.org, Greg Ungerer <gerg@kernel.org>,
 linux-mtd@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Guenter Roeck <linux@roeck-us.net>
Subject: [alsa-devel] [PATCH 00/16] ARM: remove ks8695 and w90x900 platforms
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

As discussed previously, these two ARM platforms have no
known remaining users, let's remove them completely.

Subsystem maintainers: feel free to take the driver removals
through your respective trees, they are all independent of
one another. We can merge any remaining patches through the
soc tree.

      Arnd

Arnd Bergmann (16):
  ARM: remove ks8695 platform
  serial: remove ks8695 driver
  gpio: remove ks8695 driver
  watchdog: remove ks8695 driver
  net: remove ks8695 driver
  watchdog: remove w90x900 driver
  spi: remove w90x900 driver
  ASoC: remove w90x900/nuc900 platform drivers
  fbdev: remove w90x900/nuc900 platform drivers
  Input: remove w90x900 keyboard driver
  Input: remove w90x900 touchscreen driver
  mtd: rawnand: remove w90x900 driver
  net: remove w90p910-ether driver
  rtc: remove w90x900/nuc900 driver
  usb: remove ehci-w90x900 driver
  ARM: remove w90x900 platform

Cc: "Wanzongshun (Vincent)" <wanzongshun@huawei.com>
Cc: Greg Ungerer <gerg@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-serial@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
Cc: linux-spi@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: linux-fbdev@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

 .../watchdog/watchdog-parameters.rst          |   19 -
 MAINTAINERS                                   |   22 -
 arch/arm/Kconfig                              |   34 +-
 arch/arm/Kconfig.debug                        |    8 -
 arch/arm/Makefile                             |    2 -
 arch/arm/configs/acs5k_defconfig              |   77 -
 arch/arm/configs/acs5k_tiny_defconfig         |   69 -
 arch/arm/configs/ks8695_defconfig             |   67 -
 arch/arm/configs/nuc910_defconfig             |   51 -
 arch/arm/configs/nuc950_defconfig             |   67 -
 arch/arm/configs/nuc960_defconfig             |   57 -
 arch/arm/include/debug/ks8695.S               |   37 -
 arch/arm/mach-ks8695/Kconfig                  |   88 -
 arch/arm/mach-ks8695/Makefile                 |   23 -
 arch/arm/mach-ks8695/Makefile.boot            |    9 -
 arch/arm/mach-ks8695/board-acs5k.c            |  238 ---
 arch/arm/mach-ks8695/board-dsm320.c           |  127 --
 arch/arm/mach-ks8695/board-micrel.c           |   59 -
 arch/arm/mach-ks8695/board-og.c               |  197 --
 arch/arm/mach-ks8695/board-sg.c               |  118 --
 arch/arm/mach-ks8695/cpu.c                    |   60 -
 arch/arm/mach-ks8695/devices.c                |  197 --
 arch/arm/mach-ks8695/devices.h                |   29 -
 arch/arm/mach-ks8695/generic.h                |   12 -
 .../mach-ks8695/include/mach/entry-macro.S    |   47 -
 .../mach-ks8695/include/mach/gpio-ks8695.h    |   36 -
 arch/arm/mach-ks8695/include/mach/hardware.h  |   42 -
 arch/arm/mach-ks8695/include/mach/irqs.h      |   51 -
 arch/arm/mach-ks8695/include/mach/memory.h    |   51 -
 arch/arm/mach-ks8695/include/mach/regs-gpio.h |   55 -
 arch/arm/mach-ks8695/include/mach/regs-irq.h  |   41 -
 arch/arm/mach-ks8695/include/mach/regs-misc.h |   97 -
 .../mach-ks8695/include/mach/regs-switch.h    |   66 -
 arch/arm/mach-ks8695/include/mach/regs-uart.h |   89 -
 .../arm/mach-ks8695/include/mach/uncompress.h |   33 -
 arch/arm/mach-ks8695/irq.c                    |  164 --
 arch/arm/mach-ks8695/pci.c                    |  247 ---
 arch/arm/mach-ks8695/regs-hpna.h              |   25 -
 arch/arm/mach-ks8695/regs-lan.h               |   65 -
 arch/arm/mach-ks8695/regs-mem.h               |   89 -
 arch/arm/mach-ks8695/regs-pci.h               |   53 -
 arch/arm/mach-ks8695/regs-sys.h               |   34 -
 arch/arm/mach-ks8695/regs-wan.h               |   65 -
 arch/arm/mach-ks8695/time.c                   |  159 --
 arch/arm/mach-w90x900/Kconfig                 |   50 -
 arch/arm/mach-w90x900/Makefile                |   20 -
 arch/arm/mach-w90x900/Makefile.boot           |    4 -
 arch/arm/mach-w90x900/clksel.c                |   88 -
 arch/arm/mach-w90x900/clock.c                 |  121 --
 arch/arm/mach-w90x900/clock.h                 |   40 -
 arch/arm/mach-w90x900/cpu.c                   |  238 ---
 arch/arm/mach-w90x900/cpu.h                   |   56 -
 arch/arm/mach-w90x900/dev.c                   |  537 ------
 arch/arm/mach-w90x900/gpio.c                  |  150 --
 .../mach-w90x900/include/mach/entry-macro.S   |   26 -
 arch/arm/mach-w90x900/include/mach/hardware.h |   19 -
 arch/arm/mach-w90x900/include/mach/irqs.h     |   82 -
 arch/arm/mach-w90x900/include/mach/map.h      |  153 --
 arch/arm/mach-w90x900/include/mach/mfp.h      |   21 -
 .../mach-w90x900/include/mach/regs-clock.h    |   49 -
 arch/arm/mach-w90x900/include/mach/regs-irq.h |   46 -
 arch/arm/mach-w90x900/include/mach/regs-ldm.h |  248 ---
 .../mach-w90x900/include/mach/regs-serial.h   |   54 -
 .../mach-w90x900/include/mach/uncompress.h    |   43 -
 arch/arm/mach-w90x900/irq.c                   |  212 ---
 arch/arm/mach-w90x900/mach-nuc910evb.c        |   38 -
 arch/arm/mach-w90x900/mach-nuc950evb.c        |   42 -
 arch/arm/mach-w90x900/mach-nuc960evb.c        |   38 -
 arch/arm/mach-w90x900/mfp.c                   |  197 --
 arch/arm/mach-w90x900/nuc910.c                |   58 -
 arch/arm/mach-w90x900/nuc910.h                |   17 -
 arch/arm/mach-w90x900/nuc950.c                |   52 -
 arch/arm/mach-w90x900/nuc950.h                |   17 -
 arch/arm/mach-w90x900/nuc960.c                |   50 -
 arch/arm/mach-w90x900/nuc960.h                |   17 -
 arch/arm/mach-w90x900/nuc9xx.h                |   22 -
 arch/arm/mach-w90x900/regs-ebi.h              |   29 -
 arch/arm/mach-w90x900/regs-gcr.h              |   34 -
 arch/arm/mach-w90x900/regs-timer.h            |   37 -
 arch/arm/mach-w90x900/regs-usb.h              |   31 -
 arch/arm/mach-w90x900/time.c                  |  168 --
 arch/arm/mm/Kconfig                           |    2 +-
 drivers/gpio/Makefile                         |    1 -
 drivers/gpio/gpio-ks8695.c                    |  284 ---
 drivers/input/keyboard/Kconfig                |   11 -
 drivers/input/keyboard/Makefile               |    1 -
 drivers/input/keyboard/w90p910_keypad.c       |  264 ---
 drivers/input/touchscreen/Kconfig             |    9 -
 drivers/input/touchscreen/Makefile            |    1 -
 drivers/input/touchscreen/w90p910_ts.c        |  331 ----
 drivers/mtd/nand/raw/Kconfig                  |    8 -
 drivers/mtd/nand/raw/Makefile                 |    1 -
 drivers/mtd/nand/raw/nuc900_nand.c            |  304 ---
 drivers/net/ethernet/Kconfig                  |    1 -
 drivers/net/ethernet/Makefile                 |    1 -
 drivers/net/ethernet/micrel/Kconfig           |   11 +-
 drivers/net/ethernet/micrel/Makefile          |    1 -
 drivers/net/ethernet/micrel/ks8695net.c       | 1632 -----------------
 drivers/net/ethernet/micrel/ks8695net.h       |  108 --
 drivers/net/ethernet/nuvoton/Kconfig          |   29 -
 drivers/net/ethernet/nuvoton/Makefile         |    6 -
 drivers/net/ethernet/nuvoton/w90p910_ether.c  | 1082 -----------
 drivers/rtc/Kconfig                           |    7 -
 drivers/rtc/Makefile                          |    1 -
 drivers/rtc/rtc-nuc900.c                      |  271 ---
 drivers/spi/Kconfig                           |    7 -
 drivers/spi/Makefile                          |    1 -
 drivers/spi/spi-nuc900.c                      |  429 -----
 drivers/tty/serial/Kconfig                    |   17 -
 drivers/tty/serial/Makefile                   |    1 -
 drivers/tty/serial/serial_ks8695.c            |  698 -------
 drivers/usb/host/Kconfig                      |    6 -
 drivers/usb/host/Makefile                     |    1 -
 drivers/usb/host/ehci-w90x900.c               |  130 --
 drivers/video/fbdev/Kconfig                   |   14 -
 drivers/video/fbdev/Makefile                  |    1 -
 drivers/video/fbdev/nuc900fb.c                |  760 --------
 drivers/video/fbdev/nuc900fb.h                |   51 -
 drivers/watchdog/Kconfig                      |   16 -
 drivers/watchdog/Makefile                     |    2 -
 drivers/watchdog/ks8695_wdt.c                 |  319 ----
 drivers/watchdog/nuc900_wdt.c                 |  302 ---
 include/Kbuild                                |    2 -
 include/linux/platform_data/keypad-w90p910.h  |   16 -
 include/linux/platform_data/spi-nuc900.h      |   29 -
 include/linux/platform_data/video-nuc900fb.h  |   79 -
 include/uapi/linux/serial_core.h              |    3 -
 sound/soc/Kconfig                             |    1 -
 sound/soc/Makefile                            |    1 -
 sound/soc/nuc900/Kconfig                      |   29 -
 sound/soc/nuc900/Makefile                     |   12 -
 sound/soc/nuc900/nuc900-ac97.c                |  391 ----
 sound/soc/nuc900/nuc900-audio.c               |   73 -
 sound/soc/nuc900/nuc900-audio.h               |  108 --
 sound/soc/nuc900/nuc900-pcm.c                 |  321 ----
 135 files changed, 6 insertions(+), 14461 deletions(-)
 delete mode 100644 arch/arm/configs/acs5k_defconfig
 delete mode 100644 arch/arm/configs/acs5k_tiny_defconfig
 delete mode 100644 arch/arm/configs/ks8695_defconfig
 delete mode 100644 arch/arm/configs/nuc910_defconfig
 delete mode 100644 arch/arm/configs/nuc950_defconfig
 delete mode 100644 arch/arm/configs/nuc960_defconfig
 delete mode 100644 arch/arm/include/debug/ks8695.S
 delete mode 100644 arch/arm/mach-ks8695/Kconfig
 delete mode 100644 arch/arm/mach-ks8695/Makefile
 delete mode 100644 arch/arm/mach-ks8695/Makefile.boot
 delete mode 100644 arch/arm/mach-ks8695/board-acs5k.c
 delete mode 100644 arch/arm/mach-ks8695/board-dsm320.c
 delete mode 100644 arch/arm/mach-ks8695/board-micrel.c
 delete mode 100644 arch/arm/mach-ks8695/board-og.c
 delete mode 100644 arch/arm/mach-ks8695/board-sg.c
 delete mode 100644 arch/arm/mach-ks8695/cpu.c
 delete mode 100644 arch/arm/mach-ks8695/devices.c
 delete mode 100644 arch/arm/mach-ks8695/devices.h
 delete mode 100644 arch/arm/mach-ks8695/generic.h
 delete mode 100644 arch/arm/mach-ks8695/include/mach/entry-macro.S
 delete mode 100644 arch/arm/mach-ks8695/include/mach/gpio-ks8695.h
 delete mode 100644 arch/arm/mach-ks8695/include/mach/hardware.h
 delete mode 100644 arch/arm/mach-ks8695/include/mach/irqs.h
 delete mode 100644 arch/arm/mach-ks8695/include/mach/memory.h
 delete mode 100644 arch/arm/mach-ks8695/include/mach/regs-gpio.h
 delete mode 100644 arch/arm/mach-ks8695/include/mach/regs-irq.h
 delete mode 100644 arch/arm/mach-ks8695/include/mach/regs-misc.h
 delete mode 100644 arch/arm/mach-ks8695/include/mach/regs-switch.h
 delete mode 100644 arch/arm/mach-ks8695/include/mach/regs-uart.h
 delete mode 100644 arch/arm/mach-ks8695/include/mach/uncompress.h
 delete mode 100644 arch/arm/mach-ks8695/irq.c
 delete mode 100644 arch/arm/mach-ks8695/pci.c
 delete mode 100644 arch/arm/mach-ks8695/regs-hpna.h
 delete mode 100644 arch/arm/mach-ks8695/regs-lan.h
 delete mode 100644 arch/arm/mach-ks8695/regs-mem.h
 delete mode 100644 arch/arm/mach-ks8695/regs-pci.h
 delete mode 100644 arch/arm/mach-ks8695/regs-sys.h
 delete mode 100644 arch/arm/mach-ks8695/regs-wan.h
 delete mode 100644 arch/arm/mach-ks8695/time.c
 delete mode 100644 arch/arm/mach-w90x900/Kconfig
 delete mode 100644 arch/arm/mach-w90x900/Makefile
 delete mode 100644 arch/arm/mach-w90x900/Makefile.boot
 delete mode 100644 arch/arm/mach-w90x900/clksel.c
 delete mode 100644 arch/arm/mach-w90x900/clock.c
 delete mode 100644 arch/arm/mach-w90x900/clock.h
 delete mode 100644 arch/arm/mach-w90x900/cpu.c
 delete mode 100644 arch/arm/mach-w90x900/cpu.h
 delete mode 100644 arch/arm/mach-w90x900/dev.c
 delete mode 100644 arch/arm/mach-w90x900/gpio.c
 delete mode 100644 arch/arm/mach-w90x900/include/mach/entry-macro.S
 delete mode 100644 arch/arm/mach-w90x900/include/mach/hardware.h
 delete mode 100644 arch/arm/mach-w90x900/include/mach/irqs.h
 delete mode 100644 arch/arm/mach-w90x900/include/mach/map.h
 delete mode 100644 arch/arm/mach-w90x900/include/mach/mfp.h
 delete mode 100644 arch/arm/mach-w90x900/include/mach/regs-clock.h
 delete mode 100644 arch/arm/mach-w90x900/include/mach/regs-irq.h
 delete mode 100644 arch/arm/mach-w90x900/include/mach/regs-ldm.h
 delete mode 100644 arch/arm/mach-w90x900/include/mach/regs-serial.h
 delete mode 100644 arch/arm/mach-w90x900/include/mach/uncompress.h
 delete mode 100644 arch/arm/mach-w90x900/irq.c
 delete mode 100644 arch/arm/mach-w90x900/mach-nuc910evb.c
 delete mode 100644 arch/arm/mach-w90x900/mach-nuc950evb.c
 delete mode 100644 arch/arm/mach-w90x900/mach-nuc960evb.c
 delete mode 100644 arch/arm/mach-w90x900/mfp.c
 delete mode 100644 arch/arm/mach-w90x900/nuc910.c
 delete mode 100644 arch/arm/mach-w90x900/nuc910.h
 delete mode 100644 arch/arm/mach-w90x900/nuc950.c
 delete mode 100644 arch/arm/mach-w90x900/nuc950.h
 delete mode 100644 arch/arm/mach-w90x900/nuc960.c
 delete mode 100644 arch/arm/mach-w90x900/nuc960.h
 delete mode 100644 arch/arm/mach-w90x900/nuc9xx.h
 delete mode 100644 arch/arm/mach-w90x900/regs-ebi.h
 delete mode 100644 arch/arm/mach-w90x900/regs-gcr.h
 delete mode 100644 arch/arm/mach-w90x900/regs-timer.h
 delete mode 100644 arch/arm/mach-w90x900/regs-usb.h
 delete mode 100644 arch/arm/mach-w90x900/time.c
 delete mode 100644 drivers/gpio/gpio-ks8695.c
 delete mode 100644 drivers/input/keyboard/w90p910_keypad.c
 delete mode 100644 drivers/input/touchscreen/w90p910_ts.c
 delete mode 100644 drivers/mtd/nand/raw/nuc900_nand.c
 delete mode 100644 drivers/net/ethernet/micrel/ks8695net.c
 delete mode 100644 drivers/net/ethernet/micrel/ks8695net.h
 delete mode 100644 drivers/net/ethernet/nuvoton/Kconfig
 delete mode 100644 drivers/net/ethernet/nuvoton/Makefile
 delete mode 100644 drivers/net/ethernet/nuvoton/w90p910_ether.c
 delete mode 100644 drivers/rtc/rtc-nuc900.c
 delete mode 100644 drivers/spi/spi-nuc900.c
 delete mode 100644 drivers/tty/serial/serial_ks8695.c
 delete mode 100644 drivers/usb/host/ehci-w90x900.c
 delete mode 100644 drivers/video/fbdev/nuc900fb.c
 delete mode 100644 drivers/video/fbdev/nuc900fb.h
 delete mode 100644 drivers/watchdog/ks8695_wdt.c
 delete mode 100644 drivers/watchdog/nuc900_wdt.c
 delete mode 100644 include/linux/platform_data/keypad-w90p910.h
 delete mode 100644 include/linux/platform_data/spi-nuc900.h
 delete mode 100644 include/linux/platform_data/video-nuc900fb.h
 delete mode 100644 sound/soc/nuc900/Kconfig
 delete mode 100644 sound/soc/nuc900/Makefile
 delete mode 100644 sound/soc/nuc900/nuc900-ac97.c
 delete mode 100644 sound/soc/nuc900/nuc900-audio.c
 delete mode 100644 sound/soc/nuc900/nuc900-audio.h
 delete mode 100644 sound/soc/nuc900/nuc900-pcm.c

-- 
2.20.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
