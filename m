Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4178E605D73
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 12:39:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDD4781C7;
	Thu, 20 Oct 2022 12:38:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDD4781C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666262358;
	bh=xzCE/ict48D7RLDZ+1922a0XNtUN1g7ugQy5IbJ7sSA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NPaHUbPkx8QCIkoMjDEPkJNKxlwyFdiM789bF6m6wDD77EMRJ66cyozXzZZHK/IrM
	 qMlv8cARE2H8WXaIZWlSD8rBhJKTqQPiXLgVc8mszQa8hd46pDA9M8NZYomUgfEGlS
	 WSWl+o0KuuPfPPzEqcrCdRwg0J6SQ+fjknR4RFqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63E78F805CA;
	Thu, 20 Oct 2022 12:33:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0627AF804CC; Wed, 19 Oct 2022 17:30:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71F36F80137
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 17:30:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71F36F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gnwNz9Ti"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C860DB82187;
 Wed, 19 Oct 2022 15:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B23CC433C1;
 Wed, 19 Oct 2022 15:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666193400;
 bh=xzCE/ict48D7RLDZ+1922a0XNtUN1g7ugQy5IbJ7sSA=;
 h=From:To:Cc:Subject:Date:From;
 b=gnwNz9Ti3cWDaYwUr4mi3nyM+RLRpF9tjilb+e4d6UzRvZ8WLlgNx6/I9zgRWQ/6r
 kVEFA3pwPkjfrqCeza7yJFYDABVJc7efEr05AyOke37cxSGUfjU4U19c6m+YxMUeoP
 g02j5dMNDaJYbyqufJtbIi4Wpy4dewNXxiKOXGo+NnzgmgPaVcg1kv8nZP1qFcRcbj
 1/wP/IsJ8PuLOwNzH+SuP7hyQSI0o4gMY747a7aw/BiRMkLkgSRnR2Wqty3k4hmRTT
 TQkCtxv09OgdzgFwFUopzjUTBuSqy9sp6cBClaPY6yr96ehHMpPp6mhsN0xQ2DHhzQ
 IgguWvjF/kBCw==
From: Arnd Bergmann <arnd@kernel.org>
To: Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 00/14] ARM: remove unused davinci board & drivers
Date: Wed, 19 Oct 2022 17:29:26 +0200
Message-Id: <20221019152947.3857217-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Oct 2022 12:33:17 +0200
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-staging@lists.linux.dev, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-ide@vger.kernel.org, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, linux-clk@vger.kernel.org,
 linux-rtc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, Lee Jones <lee@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Yang Yingliang <yangyingliang@huawei.com>, linux-media@vger.kernel.org,
 David Lechner <david@lechnology.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-input@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Bin Liu <b-liu@ti.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
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

From: Arnd Bergmann <arnd@arndb.de>

As part of removing all board files that were previously marked as unused,
I looked through the davinci platform and recursively removed everything
that has now become unused.

In particular, this is for all dm3xx support, in addition to the dm64xx
support removed previously. The remaining support is now for da8xx using
devicetree only, which means a lot of the da8xx specific device support
can also go away.

As with the previous series, I can keep patches together in the
soc tree, or subsystem maintainers can pick them up individually
through their subsystems, whichever they prefer.

Arnd Bergmann (14):
  ARM: davinci: remove unused board support
  ARM: davinci: drop DAVINCI_DMxxx references
  ARM: davinci: clean up platform support
  clk: remove davinci dm3xx drivers
  usb: musb: remove unused davinci support
  mfd: remove dm355evm_msp driver
  input: remove davinci keyboard driver
  rtc: remove davinci rtc driver
  ASoC: remove unused davinci support
  mfd: remove davinci voicecodec driver
  pata: remove palmchip bk3710 driver
  irqchip: remove davinci aintc driver
  staging: media: remove davinci vpfe_capture driver
  media: davinci: remove vpbe support

Cc: Sekhar Nori <nsekhar@ti.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: David Lechner <david@lechnology.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Lee Jones <lee@kernel.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bin Liu <b-liu@ti.com>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-ide@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: linux-rtc@vger.kernel.org
Cc: linux-staging@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Cc: alsa-devel@alsa-project.org

 .../admin-guide/media/davinci-vpbe.rst        |   65 -
 .../admin-guide/media/platform-cardlist.rst   |    1 -
 .../admin-guide/media/v4l-drivers.rst         |    1 -
 .../media/drivers/davinci-vpbe-devel.rst      |   39 -
 .../driver-api/media/drivers/index.rst        |    1 -
 MAINTAINERS                                   |    1 -
 arch/arm/Kconfig.debug                        |   16 +-
 arch/arm/mach-davinci/Kconfig                 |  142 --
 arch/arm/mach-davinci/Makefile                |   18 +-
 arch/arm/mach-davinci/board-da830-evm.c       |  690 ------
 arch/arm/mach-davinci/board-da850-evm.c       | 1550 --------------
 arch/arm/mach-davinci/board-dm355-evm.c       |  444 ----
 arch/arm/mach-davinci/board-dm355-leopard.c   |  278 ---
 arch/arm/mach-davinci/board-dm365-evm.c       |  855 --------
 arch/arm/mach-davinci/board-mityomapl138.c    |  638 ------
 arch/arm/mach-davinci/board-omapl138-hawk.c   |  451 ----
 arch/arm/mach-davinci/common.h                |    7 +-
 arch/arm/mach-davinci/cputype.h               |   53 -
 arch/arm/mach-davinci/da830.c                 |  274 ---
 arch/arm/mach-davinci/da850.c                 |  400 +---
 arch/arm/mach-davinci/da8xx.h                 |   95 +-
 arch/arm/mach-davinci/davinci.h               |  136 --
 arch/arm/mach-davinci/devices-da8xx.c         | 1094 ----------
 arch/arm/mach-davinci/devices.c               |  303 ---
 arch/arm/mach-davinci/dm355.c                 |  832 -------
 arch/arm/mach-davinci/dm365.c                 | 1094 ----------
 arch/arm/mach-davinci/mux.c                   |   15 -
 arch/arm/mach-davinci/serial.c                |   92 -
 arch/arm/mach-davinci/serial.h                |   15 -
 arch/arm/mach-davinci/usb-da8xx.c             |  146 --
 arch/arm/mach-davinci/usb.c                   |   87 -
 drivers/ata/Kconfig                           |   10 -
 drivers/ata/Makefile                          |    1 -
 drivers/ata/pata_bk3710.c                     |  380 ----
 drivers/clk/davinci/Makefile                  |    4 -
 drivers/clk/davinci/pll-dm355.c               |   77 -
 drivers/clk/davinci/pll-dm365.c               |  146 --
 drivers/clk/davinci/pll.c                     |    8 -
 drivers/clk/davinci/pll.h                     |    5 -
 drivers/clk/davinci/psc-dm355.c               |   89 -
 drivers/clk/davinci/psc-dm365.c               |  111 -
 drivers/clk/davinci/psc.c                     |    6 -
 drivers/clk/davinci/psc.h                     |    7 -
 drivers/input/keyboard/Kconfig                |   10 -
 drivers/input/keyboard/Makefile               |    1 -
 drivers/input/keyboard/davinci_keyscan.c      |  315 ---
 drivers/input/misc/Kconfig                    |   11 -
 drivers/input/misc/Makefile                   |    1 -
 drivers/input/misc/dm355evm_keys.c            |  238 ---
 drivers/irqchip/Kconfig                       |    5 -
 drivers/irqchip/Makefile                      |    1 -
 drivers/irqchip/irq-davinci-aintc.c           |  163 --
 drivers/media/platform/ti/davinci/Kconfig     |   16 -
 drivers/media/platform/ti/davinci/Makefile    |    3 -
 drivers/media/platform/ti/davinci/vpbe.c      |  840 --------
 .../media/platform/ti/davinci/vpbe_display.c  | 1510 -------------
 drivers/media/platform/ti/davinci/vpbe_osd.c  | 1582 --------------
 .../media/platform/ti/davinci/vpbe_osd_regs.h |  352 ---
 drivers/media/platform/ti/davinci/vpbe_venc.c |  676 ------
 .../platform/ti/davinci/vpbe_venc_regs.h      |  165 --
 drivers/media/platform/ti/davinci/vpss.c      |  529 -----
 drivers/mfd/Kconfig                           |   13 -
 drivers/mfd/Makefile                          |    3 -
 drivers/mfd/davinci_voicecodec.c              |  136 --
 drivers/mfd/dm355evm_msp.c                    |  454 ----
 drivers/rtc/Kconfig                           |   16 -
 drivers/rtc/Makefile                          |    2 -
 drivers/rtc/rtc-davinci.c                     |  512 -----
 drivers/rtc/rtc-dm355evm.c                    |  151 --
 drivers/staging/media/Kconfig                 |    1 -
 drivers/staging/media/Makefile                |    1 -
 .../media/deprecated/vpfe_capture/Kconfig     |   58 -
 .../media/deprecated/vpfe_capture/Makefile    |    4 -
 .../media/deprecated/vpfe_capture/TODO        |    7 -
 .../deprecated/vpfe_capture/ccdc_hw_device.h  |   80 -
 .../deprecated/vpfe_capture/dm355_ccdc.c      |  934 --------
 .../deprecated/vpfe_capture/dm355_ccdc.h      |  308 ---
 .../deprecated/vpfe_capture/dm355_ccdc_regs.h |  297 ---
 .../deprecated/vpfe_capture/dm644x_ccdc.c     |  879 --------
 .../deprecated/vpfe_capture/dm644x_ccdc.h     |  171 --
 .../vpfe_capture/dm644x_ccdc_regs.h           |  140 --
 .../media/deprecated/vpfe_capture/isif.c      | 1127 ----------
 .../media/deprecated/vpfe_capture/isif.h      |  518 -----
 .../media/deprecated/vpfe_capture/isif_regs.h |  256 ---
 .../deprecated/vpfe_capture/vpfe_capture.c    | 1902 -----------------
 drivers/usb/musb/Kconfig                      |   12 -
 drivers/usb/musb/Makefile                     |    2 -
 drivers/usb/musb/cppi_dma.c                   | 1547 --------------
 drivers/usb/musb/davinci.c                    |  606 ------
 drivers/usb/musb/davinci.h                    |  103 -
 include/linux/clk/davinci.h                   |    9 -
 include/linux/mfd/dm355evm_msp.h              |   79 -
 include/media/davinci/vpbe.h                  |  184 --
 include/media/davinci/vpbe_display.h          |  122 --
 include/media/davinci/vpbe_osd.h              |  382 ----
 include/media/davinci/vpbe_types.h            |   74 -
 include/media/davinci/vpbe_venc.h             |   37 -
 include/media/davinci/vpfe_capture.h          |  177 --
 include/media/davinci/vpss.h                  |  111 -
 sound/soc/ti/Kconfig                          |   40 -
 sound/soc/ti/Makefile                         |    2 -
 sound/soc/ti/davinci-evm.c                    |  267 +--
 sound/soc/ti/davinci-vcif.c                   |  247 ---
 103 files changed, 17 insertions(+), 29049 deletions(-)
 delete mode 100644 Documentation/admin-guide/media/davinci-vpbe.rst
 delete mode 100644 Documentation/driver-api/media/drivers/davinci-vpbe-devel.rst
 delete mode 100644 arch/arm/mach-davinci/board-da830-evm.c
 delete mode 100644 arch/arm/mach-davinci/board-da850-evm.c
 delete mode 100644 arch/arm/mach-davinci/board-dm355-evm.c
 delete mode 100644 arch/arm/mach-davinci/board-dm355-leopard.c
 delete mode 100644 arch/arm/mach-davinci/board-dm365-evm.c
 delete mode 100644 arch/arm/mach-davinci/board-mityomapl138.c
 delete mode 100644 arch/arm/mach-davinci/board-omapl138-hawk.c
 delete mode 100644 arch/arm/mach-davinci/davinci.h
 delete mode 100644 arch/arm/mach-davinci/devices.c
 delete mode 100644 arch/arm/mach-davinci/dm355.c
 delete mode 100644 arch/arm/mach-davinci/dm365.c
 delete mode 100644 arch/arm/mach-davinci/serial.c
 delete mode 100644 arch/arm/mach-davinci/usb-da8xx.c
 delete mode 100644 arch/arm/mach-davinci/usb.c
 delete mode 100644 drivers/ata/pata_bk3710.c
 delete mode 100644 drivers/clk/davinci/pll-dm355.c
 delete mode 100644 drivers/clk/davinci/pll-dm365.c
 delete mode 100644 drivers/clk/davinci/psc-dm355.c
 delete mode 100644 drivers/clk/davinci/psc-dm365.c
 delete mode 100644 drivers/input/keyboard/davinci_keyscan.c
 delete mode 100644 drivers/input/misc/dm355evm_keys.c
 delete mode 100644 drivers/irqchip/irq-davinci-aintc.c
 delete mode 100644 drivers/media/platform/ti/davinci/vpbe.c
 delete mode 100644 drivers/media/platform/ti/davinci/vpbe_display.c
 delete mode 100644 drivers/media/platform/ti/davinci/vpbe_osd.c
 delete mode 100644 drivers/media/platform/ti/davinci/vpbe_osd_regs.h
 delete mode 100644 drivers/media/platform/ti/davinci/vpbe_venc.c
 delete mode 100644 drivers/media/platform/ti/davinci/vpbe_venc_regs.h
 delete mode 100644 drivers/media/platform/ti/davinci/vpss.c
 delete mode 100644 drivers/mfd/davinci_voicecodec.c
 delete mode 100644 drivers/mfd/dm355evm_msp.c
 delete mode 100644 drivers/rtc/rtc-davinci.c
 delete mode 100644 drivers/rtc/rtc-dm355evm.c
 delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/Kconfig
 delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/Makefile
 delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/TODO
 delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/ccdc_hw_device.h
 delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.c
 delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.h
 delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc_regs.h
 delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.c
 delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.h
 delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc_regs.h
 delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/isif.c
 delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/isif.h
 delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/isif_regs.h
 delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/vpfe_capture.c
 delete mode 100644 drivers/usb/musb/cppi_dma.c
 delete mode 100644 drivers/usb/musb/davinci.c
 delete mode 100644 drivers/usb/musb/davinci.h
 delete mode 100644 include/linux/mfd/dm355evm_msp.h
 delete mode 100644 include/media/davinci/vpbe.h
 delete mode 100644 include/media/davinci/vpbe_display.h
 delete mode 100644 include/media/davinci/vpbe_osd.h
 delete mode 100644 include/media/davinci/vpbe_types.h
 delete mode 100644 include/media/davinci/vpbe_venc.h
 delete mode 100644 include/media/davinci/vpfe_capture.h
 delete mode 100644 include/media/davinci/vpss.h
 delete mode 100644 sound/soc/ti/davinci-vcif.c

-- 
2.29.2

