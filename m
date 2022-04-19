Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BCF50B8DA
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:42:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7D6D167B;
	Fri, 22 Apr 2022 15:41:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7D6D167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650634966;
	bh=pMXP3tiz+pXmptnDBsvlTEJvLY7a6WjIQlAUDseVC7c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AxQpyiAs4djkboFW2xnjCUqNXhsSZ5toPamQ5xq8O+6C1Wkx1fUh5iCCBumpdwN+E
	 7DQeOrtFt3O4/F4S3FcVtDxypgmtPsXBM+zWapQ+aKc1jGcf+45BRF2Xu36ItBtTxD
	 UqYbsLuMeJ4FyCwYavEuKpEuH+bu4X7bgK9q5Esw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D9E7F80618;
	Fri, 22 Apr 2022 15:32:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29039F8025D; Tue, 19 Apr 2022 18:42:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F156FF80116
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 18:42:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F156FF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WNtq6L7k"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8045761868;
 Tue, 19 Apr 2022 16:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61CCC385AC;
 Tue, 19 Apr 2022 16:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386528;
 bh=pMXP3tiz+pXmptnDBsvlTEJvLY7a6WjIQlAUDseVC7c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WNtq6L7kYzLqPo1CgDnRfCSkhbU40rWot44wiH0w7KY5q5PTaeX6yBsSjejpCMIO5
 7YyF6BGgXkj9KCnK6hk1vKyGqJQqYGi0k986h/js2Dhzln1p0JAC3zoc9J0QoVPOEL
 TweRk/7T+kSDIDXkf8Ls1dRyo2LMdJPLhNkThXg9d52y29Ru+lYVKiNP2G3UFkn5vQ
 cGC7cmPNtQJ2U0GFsNug3uLKlp06uWSZX6uTKLJ1lTu+kvNpDykOw9NqOoWZtYj2UY
 ruEFGMjX0RkqbWcX1HOwB0ciYaSwKKyyeA+rysBsucYttmfP/kQc1miV4a16y8Cds+
 GVXQTXNlRlmpA==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 25/48] ARM: pxa: zylonite: use gpio lookup instead mfp header
Date: Tue, 19 Apr 2022 18:37:47 +0200
Message-Id: <20220419163810.2118169-26-arnd@kernel.org>
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

The mach/mfp.h header is only used by this one driver
for hardcoded gpio numbers. Change that to use a lookup
table instead.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/zylonite.c                | 31 +++++++++++++++++++++
 drivers/input/touchscreen/zylonite-wm97xx.c | 20 +++++++------
 2 files changed, 42 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-pxa/zylonite.c b/arch/arm/mach-pxa/zylonite.c
index c48dd6d03df9..ba6dc86da855 100644
--- a/arch/arm/mach-pxa/zylonite.c
+++ b/arch/arm/mach-pxa/zylonite.c
@@ -32,6 +32,7 @@
 #include <linux/platform_data/usb-ohci-pxa27x.h>
 #include <linux/platform_data/keypad-pxa27x.h>
 #include <linux/platform_data/mtd-nand-pxa3xx.h>
+#include <mach/mfp.h>
 
 #include "devices.h"
 #include "generic.h"
@@ -425,6 +426,35 @@ static void __init zylonite_init_ohci(void)
 static inline void zylonite_init_ohci(void) {}
 #endif /* CONFIG_USB_OHCI_HCD || CONFIG_USB_OHCI_HCD_MODULE */
 
+static struct gpiod_lookup_table zylonite_wm97xx_touch_gpio15_table = {
+	.dev_id = "wm97xx-touch.0",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", mfp_to_gpio(MFP_PIN_GPIO15),
+			    "touch", GPIO_ACTIVE_LOW),
+		{ },
+	},
+};
+
+static struct gpiod_lookup_table zylonite_wm97xx_touch_gpio26_table = {
+	.dev_id = "wm97xx-touch.0",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", mfp_to_gpio(MFP_PIN_GPIO26),
+			    "touch", GPIO_ACTIVE_LOW),
+		{ },
+	},
+};
+
+static void __init zylonite_init_wm97xx_touch(void)
+{
+	if (!IS_ENABLED(CONFIG_TOUCHSCREEN_WM97XX_ZYLONITE))
+		return;
+
+	if (cpu_is_pxa320())
+		gpiod_add_lookup_table(&zylonite_wm97xx_touch_gpio15_table);
+	else
+		gpiod_add_lookup_table(&zylonite_wm97xx_touch_gpio26_table);
+}
+
 static void __init zylonite_init(void)
 {
 	pxa_set_ffuart_info(NULL);
@@ -450,6 +480,7 @@ static void __init zylonite_init(void)
 	zylonite_init_nand();
 	zylonite_init_leds();
 	zylonite_init_ohci();
+	zylonite_init_wm97xx_touch();
 }
 
 MACHINE_START(ZYLONITE, "PXA3xx Platform Development Kit (aka Zylonite)")
diff --git a/drivers/input/touchscreen/zylonite-wm97xx.c b/drivers/input/touchscreen/zylonite-wm97xx.c
index f57bdf083188..cabdd6e3c6f8 100644
--- a/drivers/input/touchscreen/zylonite-wm97xx.c
+++ b/drivers/input/touchscreen/zylonite-wm97xx.c
@@ -17,14 +17,13 @@
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/soc/pxa/cpu.h>
 #include <linux/wm97xx.h>
 
-#include <mach/mfp.h>
 #include <mach/regs-ac97.h>
 
 struct continuous {
@@ -181,14 +180,17 @@ static struct wm97xx_mach_ops zylonite_mach_ops = {
 static int zylonite_wm97xx_probe(struct platform_device *pdev)
 {
 	struct wm97xx *wm = platform_get_drvdata(pdev);
-	int gpio_touch_irq;
-
-	if (cpu_is_pxa320())
-		gpio_touch_irq = mfp_to_gpio(MFP_PIN_GPIO15);
-	else
-		gpio_touch_irq = mfp_to_gpio(MFP_PIN_GPIO26);
+	struct gpio_desc *gpio_touch_irq;
+	int err;
+
+	gpio_touch_irq = devm_gpiod_get(&pdev->dev, "touch", GPIOD_IN);
+	err = PTR_ERR_OR_ZERO(gpio_touch_irq);
+	if (err) {
+		dev_err(&pdev->dev, "Cannot get irq gpio: %d\n", err);
+		return err;
+	}
 
-	wm->pen_irq = gpio_to_irq(gpio_touch_irq);
+	wm->pen_irq = gpiod_to_irq(gpio_touch_irq);
 	irq_set_irq_type(wm->pen_irq, IRQ_TYPE_EDGE_BOTH);
 
 	wm97xx_config_gpio(wm, WM97XX_GPIO_13, WM97XX_GPIO_IN,
-- 
2.29.2

