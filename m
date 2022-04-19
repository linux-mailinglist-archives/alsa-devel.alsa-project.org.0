Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AE7506EDA
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 15:46:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFB33194A;
	Tue, 19 Apr 2022 15:45:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFB33194A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650375998;
	bh=RR8FHUt8/oVOHCndemgdv0yQ+gJWVi08oSUPSCA8r+A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tj5MnO6O/n0SGf5nh/hELyYEaaNpm+nXFmMUcaEk/N2ztRhPTgdv6KT+ndJvtwcm0
	 45qfe+Ov0I3Vk00bpel9TsYjLaAtjIFN/YuTGRc39nkLMBIBhE+EzpDUv6CvfefZe9
	 PZf3ga1wLMTsRtbYORjy2dW7yJtqOsoEX0do2jy0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA37EF8053A;
	Tue, 19 Apr 2022 15:43:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F8CAF80121; Tue, 19 Apr 2022 15:38:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A41E2F80121
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 15:38:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A41E2F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FjyAQX1V"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0E099B8197D;
 Tue, 19 Apr 2022 13:38:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE78C385A5;
 Tue, 19 Apr 2022 13:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375526;
 bh=RR8FHUt8/oVOHCndemgdv0yQ+gJWVi08oSUPSCA8r+A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FjyAQX1V1Mtq5rmgyreMTZhE3/aJBxgkMqWfV0riRO23vuyzYq/zn4LgLEsRpPY/l
 DQmmsn9xT0+qY3/PXuyKKsFDGMgZhu8Ddawg3jVOO+PbTKZTwvJLooQWJOrl+HaB/O
 AN85kED9oV3T2m4YPSPzkaicNd85/MKhtRTpzOZrR1O1IwS5AGlDoe22qvgRvyYVmp
 0q0Z8oey3GPFsFg0mzWOUndrW5ruI9D+QP02L6mUJV+H5efX4UhX5GpUaq3ZRQjLzt
 xg9dQpFAlmTyoWXkYs+Cvc8YFJt1I6n7of27SYxlG1Q2NZgRo7lBZYbAsDvPq2cz0n
 ZD+j1qthwTwyg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 09/41] ARM: omap1: move perseus spi pinconf to board file
Date: Tue, 19 Apr 2022 15:36:51 +0200
Message-Id: <20220419133723.1394715-10-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419133723.1394715-1-arnd@kernel.org>
References: <20220419133723.1394715-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 19 Apr 2022 15:43:16 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 alsa-devel@alsa-project.org
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

The driver has always had a FIXME about this, and it seems
like this trivial code move avoids a mach header inclusion,
so just do it.

With that out of the way, and the header file inclusions
changed to global files, the driver can also be compile-tested
on other platforms.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/board-perseus2.c |  6 ++++++
 drivers/spi/Kconfig                  |  2 +-
 drivers/spi/spi-omap-uwire.c         | 15 +++------------
 3 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/arch/arm/mach-omap1/board-perseus2.c b/arch/arm/mach-omap1/board-perseus2.c
index 1aeeb7337d29..da0155107d85 100644
--- a/arch/arm/mach-omap1/board-perseus2.c
+++ b/arch/arm/mach-omap1/board-perseus2.c
@@ -289,6 +289,12 @@ static void __init omap_perseus2_init(void)
 	omap_cfg_reg(F4_7XX_KBC3);
 	omap_cfg_reg(E3_7XX_KBC4);
 
+	if (IS_ENABLED(CONFIG_SPI_OMAP_UWIRE)) {
+		/* configure pins: MPU_UW_nSCS1, MPU_UW_SDO, MPU_UW_SCLK */
+		int val = omap_readl(OMAP7XX_IO_CONF_9) & ~0x00EEE000;
+		omap_writel(val | 0x00AAA000, OMAP7XX_IO_CONF_9);
+	}
+
 	platform_add_devices(devices, ARRAY_SIZE(devices));
 
 	omap_serial_init();
diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index d2815eb361c0..6c28ca232444 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -631,7 +631,7 @@ config SPI_OCTEON
 
 config SPI_OMAP_UWIRE
 	tristate "OMAP1 MicroWire"
-	depends on ARCH_OMAP1
+	depends on ARCH_OMAP1 || (ARM && COMPILE_TEST)
 	select SPI_BITBANG
 	help
 	  This hooks up to the MicroWire controller on OMAP1 chips.
diff --git a/drivers/spi/spi-omap-uwire.c b/drivers/spi/spi-omap-uwire.c
index 087172a193fa..29198e6815b2 100644
--- a/drivers/spi/spi-omap-uwire.c
+++ b/drivers/spi/spi-omap-uwire.c
@@ -44,13 +44,10 @@
 #include <linux/module.h>
 #include <linux/io.h>
 
-#include <mach/hardware.h>
 #include <asm/mach-types.h>
-
-#include <mach/mux.h>
-
-#include <mach/omap7xx.h>	/* OMAP7XX_IO_CONF registers */
-
+#include <linux/soc/ti/omap1-io.h>
+#include <linux/soc/ti/omap1-soc.h>
+#include <linux/soc/ti/omap1-mux.h>
 
 /* FIXME address is now a platform device resource,
  * and irqs should show there too...
@@ -548,12 +545,6 @@ static int __init omap_uwire_init(void)
 		omap_cfg_reg(N14_1610_UWIRE_CS0);
 		omap_cfg_reg(N15_1610_UWIRE_CS1);
 	}
-	if (machine_is_omap_perseus2()) {
-		/* configure pins: MPU_UW_nSCS1, MPU_UW_SDO, MPU_UW_SCLK */
-		int val = omap_readl(OMAP7XX_IO_CONF_9) & ~0x00EEE000;
-		omap_writel(val | 0x00AAA000, OMAP7XX_IO_CONF_9);
-	}
-
 	return platform_driver_register(&uwire_driver);
 }
 
-- 
2.29.2

