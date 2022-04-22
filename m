Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D28950B8D6
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:42:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2F0C16C6;
	Fri, 22 Apr 2022 15:41:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2F0C16C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650634951;
	bh=vkbNMot1HaZLmF1XKNGCizpp67huD2tFJl0uD4gcruA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PYSPc3B+uocMKuSORIgxgkxMjTwRl2bIehae2YRtE+vJ0FezHyuornMdSbqImhhdY
	 /yYPLsdhpLM9RyQzLYiBSoMy+/jxpHYxBoK1vdjU/YR/qNUlYNcXv4eCwD+/9xNUlz
	 IA+MKr8onua+WYxaxGzWxrWAm86gW1EtB/Cf8CSc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F275BF80611;
	Fri, 22 Apr 2022 15:32:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1246F8025D; Tue, 19 Apr 2022 18:42:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2311EF80121
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 18:42:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2311EF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FSCbZpV1"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 92706B819DE;
 Tue, 19 Apr 2022 16:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A17C385AE;
 Tue, 19 Apr 2022 16:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386520;
 bh=vkbNMot1HaZLmF1XKNGCizpp67huD2tFJl0uD4gcruA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FSCbZpV1Dc9c7lTc/j0AP0FhjBo0afHIiy8rSFm4J/COwse/hlE0MWtRdvFHeiMXM
 4ksw2hp7kEcEo4tbc46HfPt8ZVavi3JNqVWlbeyRH559HmFG+FH+7d9mnWOqfvDYZM
 HN+N3F3N13povD3AscGRy7ycI594O9fAs0HfDIxVJbBSXoHKMaeZruEjL1amcbSbrI
 J9jkxz9AnOTZDgxht0kvzZJsFNe3GuYjqehOo7xje4o0kHt9NgweFyW0d+C0dKADlu
 BgMJln0qIyDqp4gJ2N6G44SYtjHA+7UbS+mSA0MqYyNc/qyiJmB+yOhR9A6R35UYyb
 3Yf66fWoNuKNA==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 24/48] ARM: pxa: mainstone-wm97xx: use gpio lookup table
Date: Tue, 19 Apr 2022 18:37:46 +0200
Message-Id: <20220419163810.2118169-25-arnd@kernel.org>
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

This driver hardcodes gpio numbers without a header file.
Use lookup tables instead.

Cc: Marek Vasut <marek.vasut@gmail.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-input@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/mainstone.c                |  9 +++++
 arch/arm/mach-pxa/palmld.c                   |  9 +++++
 arch/arm/mach-pxa/palmt5.c                   |  9 +++++
 arch/arm/mach-pxa/palmtx.c                   |  9 +++++
 drivers/input/touchscreen/mainstone-wm97xx.c | 35 ++++++++------------
 5 files changed, 50 insertions(+), 21 deletions(-)

diff --git a/arch/arm/mach-pxa/mainstone.c b/arch/arm/mach-pxa/mainstone.c
index f0072e63b456..599736c93163 100644
--- a/arch/arm/mach-pxa/mainstone.c
+++ b/arch/arm/mach-pxa/mainstone.c
@@ -548,6 +548,14 @@ static struct gpiod_lookup_table mainstone_pcmcia_gpio_table = {
 	},
 };
 
+static struct gpiod_lookup_table mainstone_wm97xx_gpio_table = {
+	.dev_id = "wm97xx-touch",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", 4, "touch", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static void __init mainstone_init(void)
 {
 	int SW7 = 0;  /* FIXME: get from SCR (Mst doc section 3.2.1.1) */
@@ -562,6 +570,7 @@ static void __init mainstone_init(void)
 		      "mst-pcmcia1", MST_PCMCIA_INPUTS, 0, NULL,
 		      NULL, mst_pcmcia1_irqs);
 	gpiod_add_lookup_table(&mainstone_pcmcia_gpio_table);
+	gpiod_add_lookup_table(&mainstone_wm97xx_gpio_table);
 
 	pxa_set_ffuart_info(NULL);
 	pxa_set_btuart_info(NULL);
diff --git a/arch/arm/mach-pxa/palmld.c b/arch/arm/mach-pxa/palmld.c
index d821606ce0b5..32308c63884e 100644
--- a/arch/arm/mach-pxa/palmld.c
+++ b/arch/arm/mach-pxa/palmld.c
@@ -347,6 +347,14 @@ static struct gpiod_lookup_table palmld_mci_gpio_table = {
 	},
 };
 
+static struct gpiod_lookup_table palmld_wm97xx_touch_gpio_table = {
+	.dev_id = "wm97xx-touch",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", 27, "touch", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static void __init palmld_init(void)
 {
 	pxa2xx_mfp_config(ARRAY_AND_SIZE(palmld_pin_config));
@@ -355,6 +363,7 @@ static void __init palmld_init(void)
 	pxa_set_stuart_info(NULL);
 
 	palm27x_mmc_init(&palmld_mci_gpio_table);
+	gpiod_add_lookup_table(&palmld_wm97xx_touch_gpio_table);
 	palm27x_pm_init(PALMLD_STR_BASE);
 	palm27x_lcd_init(-1, &palm_320x480_lcd_mode);
 	palm27x_irda_init(GPIO_NR_PALMLD_IR_DISABLE);
diff --git a/arch/arm/mach-pxa/palmt5.c b/arch/arm/mach-pxa/palmt5.c
index 460a8b1043a5..463b62ec1b01 100644
--- a/arch/arm/mach-pxa/palmt5.c
+++ b/arch/arm/mach-pxa/palmt5.c
@@ -190,6 +190,14 @@ static struct gpiod_lookup_table palmt5_mci_gpio_table = {
 	},
 };
 
+static struct gpiod_lookup_table palmt5_wm97xx_touch_gpio_table = {
+	.dev_id = "wm97xx-touch",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", 27, "touch", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static void __init palmt5_init(void)
 {
 	pxa2xx_mfp_config(ARRAY_AND_SIZE(palmt5_pin_config));
@@ -198,6 +206,7 @@ static void __init palmt5_init(void)
 	pxa_set_stuart_info(NULL);
 
 	palm27x_mmc_init(&palmt5_mci_gpio_table);
+	gpiod_add_lookup_table(&palmt5_wm97xx_touch_gpio_table);
 	palm27x_pm_init(PALMT5_STR_BASE);
 	palm27x_lcd_init(-1, &palm_320x480_lcd_mode);
 	palm27x_udc_init(GPIO_NR_PALMT5_USB_DETECT_N,
diff --git a/arch/arm/mach-pxa/palmtx.c b/arch/arm/mach-pxa/palmtx.c
index 86460d6ea721..c0d0762540ab 100644
--- a/arch/arm/mach-pxa/palmtx.c
+++ b/arch/arm/mach-pxa/palmtx.c
@@ -345,6 +345,14 @@ static struct gpiod_lookup_table palmtx_mci_gpio_table = {
 	},
 };
 
+static struct gpiod_lookup_table palmtx_wm97xx_touch_gpio_table = {
+	.dev_id = "wm97xx-touch",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", 27, "touch", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static void __init palmtx_init(void)
 {
 	pxa2xx_mfp_config(ARRAY_AND_SIZE(palmtx_pin_config));
@@ -353,6 +361,7 @@ static void __init palmtx_init(void)
 	pxa_set_stuart_info(NULL);
 
 	palm27x_mmc_init(&palmtx_mci_gpio_table);
+	gpiod_add_lookup_table(&palmtx_wm97xx_touch_gpio_table);
 	palm27x_pm_init(PALMTX_STR_BASE);
 	palm27x_lcd_init(-1, &palm_320x480_lcd_mode);
 	palm27x_udc_init(GPIO_NR_PALMTX_USB_DETECT_N,
diff --git a/drivers/input/touchscreen/mainstone-wm97xx.c b/drivers/input/touchscreen/mainstone-wm97xx.c
index f8564b398eb3..87655105ef3a 100644
--- a/drivers/input/touchscreen/mainstone-wm97xx.c
+++ b/drivers/input/touchscreen/mainstone-wm97xx.c
@@ -21,6 +21,7 @@
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
 #include <linux/wm97xx.h>
@@ -58,7 +59,7 @@ static const struct continuous cinfo[] = {
 /* continuous speed index */
 static int sp_idx;
 static u16 last, tries;
-static int irq;
+static struct gpio_desc *gpiod_irq;
 
 /*
  * Pen sampling frequency (Hz) in continuous mode.
@@ -194,28 +195,21 @@ static int wm97xx_acc_startup(struct wm97xx *wm)
 	/* IRQ driven touchscreen is used on Palm hardware */
 	if (machine_is_palmt5() || machine_is_palmtx() || machine_is_palmld()) {
 		pen_int = 1;
-		irq = 27;
 		/* There is some obscure mutant of WM9712 interbred with WM9713
 		 * used on Palm HW */
 		wm->variant = WM97xx_WM1613;
-	} else if (machine_is_mainstone() && pen_int)
-		irq = 4;
-
-	if (irq) {
-		ret = gpio_request(irq, "Touchscreen IRQ");
-		if (ret)
-			goto out;
-
-		ret = gpio_direction_input(irq);
-		if (ret) {
-			gpio_free(irq);
-			goto out;
-		}
+	}
+
+	if (pen_int) {
+		gpiod_irq = gpiod_get(wm->dev, "touch", GPIOD_IN);
+		if (IS_ERR(gpiod_irq))
+			pen_int = 0;
+	}
 
-		wm->pen_irq = gpio_to_irq(irq);
+	if (pen_int) {
+		wm->pen_irq = gpiod_to_irq(gpiod_irq);
 		irq_set_irq_type(wm->pen_irq, IRQ_TYPE_EDGE_BOTH);
-	} else /* pen irq not supported */
-		pen_int = 0;
+	}
 
 	/* codec specific irq config */
 	if (pen_int) {
@@ -242,7 +236,6 @@ static int wm97xx_acc_startup(struct wm97xx *wm)
 		}
 	}
 
-out:
 	return ret;
 }
 
@@ -250,8 +243,8 @@ static void wm97xx_acc_shutdown(struct wm97xx *wm)
 {
 	/* codec specific deconfig */
 	if (pen_int) {
-		if (irq)
-			gpio_free(irq);
+		if (gpiod_irq)
+			gpiod_put(gpiod_irq);
 		wm->pen_irq = 0;
 	}
 }
-- 
2.29.2

