Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B646150B8FC
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:47:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5839815E2;
	Fri, 22 Apr 2022 15:46:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5839815E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650635239;
	bh=/6iIOutIe2dthl0F9tUwRrWmTz1Y+vHGyZSNFuNK4W0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sEFH3WTCjs54Qlww0VZOKvGTvkb69Cy4NiHB4T6znUj9GLmOo2ktKKvFdtLobke9W
	 sxJZmrlqdNf7hJ0hBz6FnGArp5G1Wchx/iwfV1EJwhrw8xd8h7UyvBAkoFaCTAY6JX
	 Vu8Bul03PwB7yhtcjOyQVT4EFM+bJPOIb55uXRDY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54872F8068A;
	Fri, 22 Apr 2022 15:32:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E485DF8025D; Tue, 19 Apr 2022 18:44:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C1B3F80116
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 18:44:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C1B3F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="r9TzRbN2"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A0723B81BFC;
 Tue, 19 Apr 2022 16:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21D49C385B6;
 Tue, 19 Apr 2022 16:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386660;
 bh=/6iIOutIe2dthl0F9tUwRrWmTz1Y+vHGyZSNFuNK4W0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r9TzRbN2wJ9anV7WP0E3rP1S1Cki++xSivN4dBdyNHhyWwMh/MI+BtyAeqgYlBYXV
 ItPRfCU6w7MqI+MFhEsR5oorVEigDVDTfLVzE3yCgnLfKVyWW3gfUdTAbpfQ+0xMlv
 4h+YVQk5XgEEoQXPsOwj0Fou41j1UM7Ct/jvU8LRL/8ndMFQ+B79JydmegZ2DAQ0SW
 JwbK17hawoV1JcDkXQOweIbtoMS6G5Dy/AtPICtIdIqThqKAcNwIk2Z+V0Gk8YY1UC
 qolXwRGVZyysQKzmwpm1PVfh5Wsw43vmB7v0Jz+vdy/0bIr6cZp8M8u+LOSFSklyM5
 I5AkVeQlQC3Hw==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 42/48] ARM: mmp: remove tavorevb board support
Date: Tue, 19 Apr 2022 18:38:04 +0200
Message-Id: <20220419163810.2118169-43-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:42 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 Philipp Zabel <philipp.zabel@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Sergey Lapin <slapin@ossfans.org>,
 linux-fbdev@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, Tomas Cech <sleep_walker@suse.com>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Parsons <lost.distance@yahoo.com>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>
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

There are two tavorevb boards in the kernel, one using a PXA930 chip in
mach-pxa, and one using the later PXA910 chip in mach-mmp.  They use the
same board number, which is generally a bad idea, and in a multiplatform
kernel, we can end up with funny link errors like this one resulting
from two boards gettting controlled by the same Kconfig symbol:

arch/arm/mach-mmp/tavorevb.o: In function `tavorevb_init':
tavorevb.c:(.init.text+0x4c): undefined reference to `pxa910_device_uart1'
tavorevb.c:(.init.text+0x50): undefined reference to `pxa910_device_gpio'
tavorevb.o:(.arch.info.init+0x54): undefined reference to `pxa910_init_irq'
tavorevb.o:(.arch.info.init+0x58): undefined reference to `pxa910_timer_init'

The mach-pxa TavorEVB seems much more complete than the mach-mmp one
that supports only uart, gpio and ethernet. Further, I could find no
information about the board on the internet aside from references to
the Linux kernel, so I assume this was never available outside of Marvell
and can be removed entirely.

There is a third board named TavorEVB in the Kconfig description,
but this refers to the "TTC_DKB" machine. The two are clearly
related, so I change the Kconfig description to just list both
names.

Cc: Lubomir Rintel <lkundrak@v3.sk>
Reviewed-by: Lubomir Rintel <lkundrak@v3.sk>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-mmp/Kconfig    |  10 +---
 arch/arm/mach-mmp/Makefile   |   1 -
 arch/arm/mach-mmp/tavorevb.c | 113 -----------------------------------
 3 files changed, 1 insertion(+), 123 deletions(-)
 delete mode 100644 arch/arm/mach-mmp/tavorevb.c

diff --git a/arch/arm/mach-mmp/Kconfig b/arch/arm/mach-mmp/Kconfig
index 0dd999212944..92a730a573b9 100644
--- a/arch/arm/mach-mmp/Kconfig
+++ b/arch/arm/mach-mmp/Kconfig
@@ -39,16 +39,8 @@ config MACH_AVENGERS_LITE
 	  Say 'Y' here if you want to support the Marvell PXA168-based
 	  Avengers Lite Development Board.
 
-config MACH_TAVOREVB
-	bool "Marvell's PXA910 TavorEVB Development Board"
-	depends on ARCH_MULTI_V5
-	select CPU_PXA910
-	help
-	  Say 'Y' here if you want to support the Marvell PXA910-based
-	  TavorEVB Development Board.
-
 config MACH_TTC_DKB
-	bool "Marvell's PXA910 TavorEVB Development Board"
+	bool "Marvell's PXA910 TavorEVB/TTC_DKB Development Board"
 	depends on ARCH_MULTI_V5
 	select CPU_PXA910
 	help
diff --git a/arch/arm/mach-mmp/Makefile b/arch/arm/mach-mmp/Makefile
index e3758f7e1fe7..81338db77ec7 100644
--- a/arch/arm/mach-mmp/Makefile
+++ b/arch/arm/mach-mmp/Makefile
@@ -24,7 +24,6 @@ endif
 obj-$(CONFIG_MACH_ASPENITE)	+= aspenite.o
 obj-$(CONFIG_MACH_ZYLONITE2)	+= aspenite.o
 obj-$(CONFIG_MACH_AVENGERS_LITE)+= avengers_lite.o
-obj-$(CONFIG_MACH_TAVOREVB)	+= tavorevb.o
 obj-$(CONFIG_MACH_TTC_DKB)	+= ttc_dkb.o
 obj-$(CONFIG_MACH_BROWNSTONE)	+= brownstone.o
 obj-$(CONFIG_MACH_FLINT)	+= flint.o
diff --git a/arch/arm/mach-mmp/tavorevb.c b/arch/arm/mach-mmp/tavorevb.c
deleted file mode 100644
index 3261d2322198..000000000000
--- a/arch/arm/mach-mmp/tavorevb.c
+++ /dev/null
@@ -1,113 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *  linux/arch/arm/mach-mmp/tavorevb.c
- *
- *  Support for the Marvell PXA910-based TavorEVB Development Platform.
- */
-#include <linux/gpio.h>
-#include <linux/gpio-pxa.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/platform_device.h>
-#include <linux/smc91x.h>
-
-#include <asm/mach-types.h>
-#include <asm/mach/arch.h>
-#include "addr-map.h"
-#include "mfp-pxa910.h"
-#include "pxa910.h"
-#include "irqs.h"
-
-#include "common.h"
-
-static unsigned long tavorevb_pin_config[] __initdata = {
-	/* UART2 */
-	GPIO47_UART2_RXD,
-	GPIO48_UART2_TXD,
-
-	/* SMC */
-	SM_nCS0_nCS0,
-	SM_ADV_SM_ADV,
-	SM_SCLK_SM_SCLK,
-	SM_SCLK_SM_SCLK,
-	SM_BE0_SM_BE0,
-	SM_BE1_SM_BE1,
-
-	/* DFI */
-	DF_IO0_ND_IO0,
-	DF_IO1_ND_IO1,
-	DF_IO2_ND_IO2,
-	DF_IO3_ND_IO3,
-	DF_IO4_ND_IO4,
-	DF_IO5_ND_IO5,
-	DF_IO6_ND_IO6,
-	DF_IO7_ND_IO7,
-	DF_IO8_ND_IO8,
-	DF_IO9_ND_IO9,
-	DF_IO10_ND_IO10,
-	DF_IO11_ND_IO11,
-	DF_IO12_ND_IO12,
-	DF_IO13_ND_IO13,
-	DF_IO14_ND_IO14,
-	DF_IO15_ND_IO15,
-	DF_nCS0_SM_nCS2_nCS0,
-	DF_ALE_SM_WEn_ND_ALE,
-	DF_CLE_SM_OEn_ND_CLE,
-	DF_WEn_DF_WEn,
-	DF_REn_DF_REn,
-	DF_RDY0_DF_RDY0,
-};
-
-static struct pxa_gpio_platform_data pxa910_gpio_pdata = {
-	.irq_base	= MMP_GPIO_TO_IRQ(0),
-};
-
-static struct smc91x_platdata tavorevb_smc91x_info = {
-	.flags	= SMC91X_USE_16BIT | SMC91X_NOWAIT,
-};
-
-static struct resource smc91x_resources[] = {
-	[0] = {
-		.start	= SMC_CS1_PHYS_BASE + 0x300,
-		.end	= SMC_CS1_PHYS_BASE + 0xfffff,
-		.flags	= IORESOURCE_MEM,
-	},
-	[1] = {
-		.start	= MMP_GPIO_TO_IRQ(80),
-		.end	= MMP_GPIO_TO_IRQ(80),
-		.flags	= IORESOURCE_IRQ | IORESOURCE_IRQ_HIGHEDGE,
-	}
-};
-
-static struct platform_device smc91x_device = {
-	.name		= "smc91x",
-	.id		= 0,
-	.dev		= {
-		.platform_data = &tavorevb_smc91x_info,
-	},
-	.num_resources	= ARRAY_SIZE(smc91x_resources),
-	.resource	= smc91x_resources,
-};
-
-static void __init tavorevb_init(void)
-{
-	mfp_config(ARRAY_AND_SIZE(tavorevb_pin_config));
-
-	/* on-chip devices */
-	pxa910_add_uart(1);
-	platform_device_add_data(&pxa910_device_gpio, &pxa910_gpio_pdata,
-				 sizeof(struct pxa_gpio_platform_data));
-	platform_device_register(&pxa910_device_gpio);
-
-	/* off-chip devices */
-	platform_device_register(&smc91x_device);
-}
-
-MACHINE_START(TAVOREVB, "PXA910 Evaluation Board (aka TavorEVB)")
-	.map_io		= mmp_map_io,
-	.nr_irqs	= MMP_NR_IRQS,
-	.init_irq       = pxa910_init_irq,
-	.init_time	= pxa910_timer_init,
-	.init_machine   = tavorevb_init,
-	.restart	= mmp_restart,
-MACHINE_END
-- 
2.29.2

