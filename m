Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1DA50B8AB
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:37:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B082829;
	Fri, 22 Apr 2022 15:36:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B082829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650634664;
	bh=7xEnZ0JSPWZhTH940v/NcGNAbOyRIyfBWQe+0s0khHM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qfU9w8aiH4vsaVhGgDMXCC8XNh47N/6HpjKSIiKNZK+VF/JVPRPjc4dI7CZmGLEyt
	 ui8gv5jowKqf/ahgIcCCZsHKVrJqwoFqxixItWAKtmPxoGQS7S/QTIEk5GmSUA/6Ab
	 +3Lw/ByDjng9Ff3vyoCA/IOm41TdOux/7uX56Oww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB47BF805BB;
	Fri, 22 Apr 2022 15:31:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78CB3F80237; Tue, 19 Apr 2022 18:39:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E5AEF80116
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 18:39:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E5AEF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="U2+iU6c8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 58B956182F;
 Tue, 19 Apr 2022 16:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50CD1C385AF;
 Tue, 19 Apr 2022 16:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386378;
 bh=7xEnZ0JSPWZhTH940v/NcGNAbOyRIyfBWQe+0s0khHM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U2+iU6c8bjeJ3b4/hWR8738LXyw2qX/PeoFQkQee06q/vC7ddu3A5paCnfw9cViZ0
 1fBHsL7duftcUL7G4nuM2IRlQk2KY6lsgVtQuDj/pHPyjLxqHD/8dTXiqD3xm3lzOw
 3zqMMyS3sa9kuU55H0WPkrepH99Qln75vsXp46325cju4AxH9JOASF64ejSwaYDiQW
 XK4cjQPK/vvSqzAbE/RPMy1oHrXG/vxp89TInVKBQwrtCc6W5mnrs/h8bNfSFxEhEX
 cWCDK6zl1DWuudpeHuSJIn2jTIsuGmr5kz5m3ceIgi2uQGIuHn5uclCDYzNllRUsoG
 VX9+70vTRthWw==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 06/48] ARM: pxa: stop using mach/bitfield.h
Date: Tue, 19 Apr 2022 18:37:28 +0200
Message-Id: <20220419163810.2118169-7-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:41 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 Philipp Zabel <philipp.zabel@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Sergey Lapin <slapin@ossfans.org>,
 linux-fbdev@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, Tomas Cech <sleep_walker@suse.com>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
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

There are two identical copies of mach/bitfield.h, one for
mach-sa1100 and one for mach-pxa. The pxafb driver only
makes use of two macros, which can be trivially open-coded
in the header.

Cc: dri-devel@lists.freedesktop.org
Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/idp.c                   | 1 -
 arch/arm/mach-pxa/include/mach/regs-lcd.h | 5 +++--
 arch/arm/mach-pxa/regs-u2d.h              | 2 --
 drivers/video/fbdev/pxafb.c               | 1 -
 4 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-pxa/idp.c b/arch/arm/mach-pxa/idp.c
index 57c0511472bc..525d01ddfbbb 100644
--- a/arch/arm/mach-pxa/idp.c
+++ b/arch/arm/mach-pxa/idp.c
@@ -30,7 +30,6 @@
 #include "pxa25x.h"
 #include "idp.h"
 #include <linux/platform_data/video-pxafb.h>
-#include <mach/bitfield.h>
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/smc91x.h>
 
diff --git a/arch/arm/mach-pxa/include/mach/regs-lcd.h b/arch/arm/mach-pxa/include/mach/regs-lcd.h
index e2b6e3d1f625..6a434675f84a 100644
--- a/arch/arm/mach-pxa/include/mach/regs-lcd.h
+++ b/arch/arm/mach-pxa/include/mach/regs-lcd.h
@@ -2,8 +2,6 @@
 #ifndef __ASM_ARCH_REGS_LCD_H
 #define __ASM_ARCH_REGS_LCD_H
 
-#include <mach/bitfield.h>
-
 /*
  * LCD Controller Registers and Bits Definitions
  */
@@ -86,6 +84,9 @@
 #define LCCR0_OUC	(1 << 25)	/* Overlay Underlay control bit */
 #define LCCR0_LDDALT	(1 << 26)	/* LDD alternate mapping control */
 
+#define Fld(Size, Shft)	(((Size) << 16) + (Shft))
+#define FShft(Field)	((Field) & 0x0000FFFF)
+
 #define LCCR1_PPL	Fld (10, 0)	/* Pixels Per Line - 1 */
 #define LCCR1_DisWdth(Pixel)	(((Pixel) - 1) << FShft (LCCR1_PPL))
 
diff --git a/arch/arm/mach-pxa/regs-u2d.h b/arch/arm/mach-pxa/regs-u2d.h
index fe4c80ad87ec..ab517ba62c9a 100644
--- a/arch/arm/mach-pxa/regs-u2d.h
+++ b/arch/arm/mach-pxa/regs-u2d.h
@@ -2,8 +2,6 @@
 #ifndef __ASM_ARCH_PXA3xx_U2D_H
 #define __ASM_ARCH_PXA3xx_U2D_H
 
-#include <mach/bitfield.h>
-
 /*
  * USB2 device controller registers and bits definitions
  */
diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index e3d1a184d2be..edf080f64a8c 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -64,7 +64,6 @@
 #include <asm/io.h>
 #include <asm/irq.h>
 #include <asm/div64.h>
-#include <mach/bitfield.h>
 #include <linux/platform_data/video-pxafb.h>
 
 /*
-- 
2.29.2

