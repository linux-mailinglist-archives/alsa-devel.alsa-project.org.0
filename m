Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED13350B8C4
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:39:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 999C51725;
	Fri, 22 Apr 2022 15:39:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 999C51725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650634791;
	bh=rF4AqAeeG3pFiw8ba+j1AjJKI0o8rpvYnUVlfmsd5CQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hswLyDKsINZZThlGF3UxFqNSHKqOf0rfl80npGze9cGb/VW50WWD9v+S5HDJFs6YY
	 E+h3F1l9rbWkk6dIJOR1mcmI6+COFtg7gX7qQG+/H4gzX+Kn2yJ0tC5p6Q/9X5i3eO
	 VxPdjv0EIoiBJzakpsaO1DN2AB/a75mLEJdlSLGI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1C25F805EA;
	Fri, 22 Apr 2022 15:32:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC013F8025D; Tue, 19 Apr 2022 18:40:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF8B0F80121
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 18:40:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF8B0F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rZcwYWiP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 84427B81A22;
 Tue, 19 Apr 2022 16:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F6BC385A5;
 Tue, 19 Apr 2022 16:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386442;
 bh=rF4AqAeeG3pFiw8ba+j1AjJKI0o8rpvYnUVlfmsd5CQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rZcwYWiPc2XajjwXFY6Hgb0z8xaKQouR3mgetcNfOG0jAxjf+wc+NkAqTEieKNj2K
 hTb4pSkBn4p6/vPrbGHHFSjrFJKYhOj58gtETWj5zjgxOpUV+N5TFkzWHrEi+oCpGA
 Z7qHH3Z4/Qz1lfbHK13P/9eVzrzGxLoE72yig5fdPb2W9JmcSPG6EbgjwxoLszNbC8
 JtYVwf2JvVtYboOyzewKz6pEaGgLg3OpWUMntuI+0iqBattNddhmtXKm3DuOkqoKaX
 6oeCBZj9AZy/bFRn3L+Ral/WFjNSaI6bmC11HJKF0hZPiK+pyR2FGR0p1wVrtmDFDN
 RN3P/E7CISDfQ==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 14/48] ARM: pxa: maybe fix gpio lookup tables
Date: Tue, 19 Apr 2022 18:37:36 +0200
Message-Id: <20220419163810.2118169-15-arnd@kernel.org>
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
 Marek Vasut <marek.vasut@gmail.com>, Paul Parsons <lost.distance@yahoo.com>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, stable@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, alsa-devel@alsa-project.org,
 Daniel Mack <daniel@zonque.org>
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

From inspection I found a couple of GPIO lookups that are
listed with device "gpio-pxa", but actually have a number
from a different gpio controller.

Try to rectify that here, with a guess of what the actual
device name is.

Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Cc: stable@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/cm-x300.c  | 8 ++++----
 arch/arm/mach-pxa/magician.c | 2 +-
 arch/arm/mach-pxa/tosa.c     | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-pxa/cm-x300.c b/arch/arm/mach-pxa/cm-x300.c
index 09a5264a27c8..01f364a66446 100644
--- a/arch/arm/mach-pxa/cm-x300.c
+++ b/arch/arm/mach-pxa/cm-x300.c
@@ -356,13 +356,13 @@ static struct platform_device cm_x300_spi_gpio = {
 static struct gpiod_lookup_table cm_x300_spi_gpiod_table = {
 	.dev_id         = "spi_gpio",
 	.table          = {
-		GPIO_LOOKUP("gpio-pxa", GPIO_LCD_SCL,
+		GPIO_LOOKUP("pca9555.1", GPIO_LCD_SCL - GPIO_LCD_BASE,
 			    "sck", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("gpio-pxa", GPIO_LCD_DIN,
+		GPIO_LOOKUP("pca9555.1", GPIO_LCD_DIN - GPIO_LCD_BASE,
 			    "mosi", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("gpio-pxa", GPIO_LCD_DOUT,
+		GPIO_LOOKUP("pca9555.1", GPIO_LCD_DOUT - GPIO_LCD_BASE,
 			    "miso", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("gpio-pxa", GPIO_LCD_CS,
+		GPIO_LOOKUP("pca9555.1", GPIO_LCD_CS - GPIO_LCD_BASE,
 			    "cs", GPIO_ACTIVE_HIGH),
 		{ },
 	},
diff --git a/arch/arm/mach-pxa/magician.c b/arch/arm/mach-pxa/magician.c
index 20ca3e28c7fb..d105deb1e098 100644
--- a/arch/arm/mach-pxa/magician.c
+++ b/arch/arm/mach-pxa/magician.c
@@ -681,7 +681,7 @@ static struct platform_device bq24022 = {
 static struct gpiod_lookup_table bq24022_gpiod_table = {
 	.dev_id = "gpio-regulator",
 	.table = {
-		GPIO_LOOKUP("gpio-pxa", EGPIO_MAGICIAN_BQ24022_ISET2,
+		GPIO_LOOKUP("htc-egpio-0", EGPIO_MAGICIAN_BQ24022_ISET2 - MAGICIAN_EGPIO_BASE,
 			    NULL, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP("gpio-pxa", GPIO30_MAGICIAN_BQ24022_nCHARGE_EN,
 			    "enable", GPIO_ACTIVE_LOW),
diff --git a/arch/arm/mach-pxa/tosa.c b/arch/arm/mach-pxa/tosa.c
index 5af980d77d39..9476ed0f55e9 100644
--- a/arch/arm/mach-pxa/tosa.c
+++ b/arch/arm/mach-pxa/tosa.c
@@ -296,9 +296,9 @@ static struct gpiod_lookup_table tosa_mci_gpio_table = {
 	.table = {
 		GPIO_LOOKUP("gpio-pxa", TOSA_GPIO_nSD_DETECT,
 			    "cd", GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP("gpio-pxa", TOSA_GPIO_SD_WP,
+		GPIO_LOOKUP("sharp-scoop.0", TOSA_GPIO_SD_WP - TOSA_SCOOP_GPIO_BASE,
 			    "wp", GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP("gpio-pxa", TOSA_GPIO_PWR_ON,
+		GPIO_LOOKUP("sharp-scoop.0", TOSA_GPIO_PWR_ON - TOSA_SCOOP_GPIO_BASE,
 			    "power", GPIO_ACTIVE_HIGH),
 		{ },
 	},
-- 
2.29.2

