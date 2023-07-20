Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD09A75C0FB
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:13:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1603E201;
	Fri, 21 Jul 2023 10:12:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1603E201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689927204;
	bh=oVNeIVS24ovp4Bk+ISFEomvXaLIJWv1HRJzkQJqBfRQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ngsH+Sz5uCcVCMJLeXZ83fs4QNgvQtctWL9KUlmDL9y4eiILCIX+uYbH+iNAUZZgR
	 tUeP5u2jBXh5HJTV2Sw/7BPWAT6izwwk2QoOIL1R7Uv+cc19ehcXheCUldGtZUvwoY
	 TrsJciGZgRzFXe9Q7tMC4nbjfxRMDq3lTIzHEJoY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAD67F8060C; Fri, 21 Jul 2023 10:09:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B6DEF80607;
	Fri, 21 Jul 2023 10:09:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8919AF80494; Thu, 20 Jul 2023 10:30:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5ED2BF80535
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 10:30:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ED2BF80535
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KCBY6T8j
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A703161AF2;
	Thu, 20 Jul 2023 08:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13A97C4E687;
	Thu, 20 Jul 2023 08:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689841797;
	bh=oVNeIVS24ovp4Bk+ISFEomvXaLIJWv1HRJzkQJqBfRQ=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=KCBY6T8jZoZJxHtceySUtnED/DFBapt8mwpRyoidcLAoN7En07izu678qZgF+7Z27
	 l298VIcjgw6HWMmYeaeoiL8qN9y3mWe3SrOQcBH9AkSGodUo8zlaDZ2zOencSM6yHN
	 qDwFFJ2Rj53K0vohrq9R7vznDbrBEwMwVmazzWkRD0nYMkV5ZY89ZSaWbzKNJCYpf9
	 BB0V3+aWNf/6nB/hUEMVBncSNtbtxAzZSLSrNhHJQKQewLE7SueZZAoGYNnLjAC2Bd
	 DK+gA81+4QX3bLGBxAFCeip/zJODwjwNyvBJk94QYpoBjvVoSp6FuDAckjNvsIkkKG
	 kF6NDoGYNsIGQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A0CC04A6A;
	Thu, 20 Jul 2023 08:29:56 +0000 (UTC)
From: 
 Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Thu, 20 Jul 2023 14:29:09 +0300
Subject: [PATCH v3 09/42] clocksource: ep93xx: Add driver for Cirrus Logic
 EP93xx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230605-ep93xx-v3-9-3d63a5f1103e@maquefel.me>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
In-Reply-To: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
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
 linux-input@vger.kernel.org, alsa-devel@alsa-project.org
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689852590; l=7745;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=91Q5aMzQnMojBq/wb/TN2iHaQ2aIwhcgyrmryexjCyI=; =?utf-8?q?b=3DHp6WdlCpm0lC?=
 =?utf-8?q?cc/mcEspfz8iFJawc6l5cUt94y0Gy1DG3lV2KIP6JxJWk7f1PGp0vyp+MKaNfnu+?=
 XsyKVE8GDkT67OsMAjVMY51W60b8iRTCuQc9hjnYXmJXzEKEfhMU
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
Message-ID-Hash: TRX4GSUNKIWB7O7YMANBMGBE4IMX4RAN
X-Message-ID-Hash: TRX4GSUNKIWB7O7YMANBMGBE4IMX4RAN
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:08:57 +0000
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: nikita.shubin@maquefel.me
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TRX4GSUNKIWB7O7YMANBMGBE4IMX4RAN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Nikita Shubin <nikita.shubin@maquefel.me>

This us a rewrite of EP93xx timer driver in
arch/arm/mach-ep93xx/timer-ep93xx.c trying to do everything
the device tree way:

- Make every IO-access relative to a base address and dynamic
  so we can do a dynamic ioremap and get going.
- Find register range and interrupt from the device tree.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/clocksource/Kconfig        |  11 +++
 drivers/clocksource/Makefile       |   1 +
 drivers/clocksource/timer-ep93xx.c | 190 +++++++++++++++++++++++++++++++++++++
 3 files changed, 202 insertions(+)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index c4d671a5a13d..f1b84b05b281 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -739,4 +739,15 @@ config GOLDFISH_TIMER
 	help
 	  Support for the timer/counter of goldfish-rtc
 
+config EP93XX_TIMER
+	bool "Cirrus Logic ep93xx timer driver" if COMPILE_TEST
+	depends on ARCH_EP93XX
+	depends on GENERIC_CLOCKEVENTS
+	depends on HAS_IOMEM
+	select CLKSRC_MMIO
+	select TIMER_OF
+	help
+	  Enables support for the Cirrus Logic timer block
+	  EP93XX.
+
 endmenu
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index 5d93c9e3fc55..b6a3cf1f5b9d 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -90,3 +90,4 @@ obj-$(CONFIG_MSC313E_TIMER)		+= timer-msc313e.o
 obj-$(CONFIG_GOLDFISH_TIMER)		+= timer-goldfish.o
 obj-$(CONFIG_GXP_TIMER)			+= timer-gxp.o
 obj-$(CONFIG_CLKSRC_LOONGSON1_PWM)	+= timer-loongson1-pwm.o
+obj-$(CONFIG_EP93XX_TIMER)		+= timer-ep93xx.o
diff --git a/drivers/clocksource/timer-ep93xx.c b/drivers/clocksource/timer-ep93xx.c
new file mode 100644
index 000000000000..bc0ca6e12334
--- /dev/null
+++ b/drivers/clocksource/timer-ep93xx.c
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Cirrus Logic EP93xx timer driver.
+ * Copyright (C) 2021 Nikita Shubin <nikita.shubin@maquefel.me>
+ *
+ * Based on a rewrite of arch/arm/mach-ep93xx/timer.c:
+ */
+
+#include <linux/clockchips.h>
+#include <linux/clocksource.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/irq.h>
+#include <linux/kernel.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/sched_clock.h>
+
+#include <asm/mach/time.h>
+
+/*************************************************************************
+ * Timer handling for EP93xx
+ *************************************************************************
+ * The ep93xx has four internal timers.  Timers 1, 2 (both 16 bit) and
+ * 3 (32 bit) count down at 508 kHz, are self-reloading, and can generate
+ * an interrupt on underflow.  Timer 4 (40 bit) counts down at 983.04 kHz,
+ * is free-running, and can't generate interrupts.
+ *
+ * The 508 kHz timers are ideal for use for the timer interrupt, as the
+ * most common values of HZ divide 508 kHz nicely.  We pick the 32 bit
+ * timer (timer 3) to get as long sleep intervals as possible when using
+ * CONFIG_NO_HZ.
+ *
+ * The higher clock rate of timer 4 makes it a better choice than the
+ * other timers for use as clock source and for sched_clock(), providing
+ * a stable 40 bit time base.
+ *************************************************************************
+ */
+
+#define EP93XX_TIMER1_LOAD		0x00
+#define EP93XX_TIMER1_VALUE		0x04
+#define EP93XX_TIMER1_CONTROL		0x08
+#define EP93XX_TIMER123_CONTROL_ENABLE	BIT(7)
+#define EP93XX_TIMER123_CONTROL_MODE	BIT(6)
+#define EP93XX_TIMER123_CONTROL_CLKSEL	BIT(3)
+#define EP93XX_TIMER1_CLEAR		0x0c
+#define EP93XX_TIMER2_LOAD		0x20
+#define EP93XX_TIMER2_VALUE		0x24
+#define EP93XX_TIMER2_CONTROL		0x28
+#define EP93XX_TIMER2_CLEAR		0x2c
+/*
+ * This read-only register contains the low word of the time stamp debug timer
+ * ( Timer4). When this register is read, the high byte of the Timer4 counter is
+ * saved in the Timer4ValueHigh register.
+ */
+#define EP93XX_TIMER4_VALUE_LOW		0x60
+#define EP93XX_TIMER4_VALUE_HIGH	0x64
+#define EP93XX_TIMER4_VALUE_HIGH_ENABLE	BIT(8)
+#define EP93XX_TIMER3_LOAD		0x80
+#define EP93XX_TIMER3_VALUE		0x84
+#define EP93XX_TIMER3_CONTROL		0x88
+#define EP93XX_TIMER3_CLEAR		0x8c
+
+#define EP93XX_TIMER123_RATE		508469
+#define EP93XX_TIMER4_RATE		983040
+
+struct ep93xx_tcu {
+	void __iomem *base;
+};
+
+static struct ep93xx_tcu *ep93xx_tcu;
+
+static u64 ep93xx_clocksource_read(struct clocksource *c)
+{
+	struct ep93xx_tcu *tcu = ep93xx_tcu;
+
+	return lo_hi_readq(tcu->base + EP93XX_TIMER4_VALUE_LOW) & GENMASK_ULL(39, 0);
+}
+
+static u64 notrace ep93xx_read_sched_clock(void)
+{
+	return ep93xx_clocksource_read(NULL);
+}
+
+static int ep93xx_clkevt_set_next_event(unsigned long next,
+					struct clock_event_device *evt)
+{
+	struct ep93xx_tcu *tcu = ep93xx_tcu;
+	/* Default mode: periodic, off, 508 kHz */
+	u32 tmode = EP93XX_TIMER123_CONTROL_MODE |
+	EP93XX_TIMER123_CONTROL_CLKSEL;
+
+	/* Clear timer */
+	writel(tmode, tcu->base + EP93XX_TIMER3_CONTROL);
+
+	/* Set next event */
+	writel(next, tcu->base + EP93XX_TIMER3_LOAD);
+	writel(tmode | EP93XX_TIMER123_CONTROL_ENABLE,
+	       tcu->base + EP93XX_TIMER3_CONTROL);
+	return 0;
+}
+
+static int ep93xx_clkevt_shutdown(struct clock_event_device *evt)
+{
+	struct ep93xx_tcu *tcu = ep93xx_tcu;
+	/* Disable timer */
+	writel(0, tcu->base + EP93XX_TIMER3_CONTROL);
+
+	return 0;
+}
+
+static struct clock_event_device ep93xx_clockevent = {
+	.name			= "timer1",
+	.features		= CLOCK_EVT_FEAT_ONESHOT,
+	.set_state_shutdown	= ep93xx_clkevt_shutdown,
+	.set_state_oneshot	= ep93xx_clkevt_shutdown,
+	.tick_resume		= ep93xx_clkevt_shutdown,
+	.set_next_event		= ep93xx_clkevt_set_next_event,
+	.rating			= 300,
+};
+
+static irqreturn_t ep93xx_timer_interrupt(int irq, void *dev_id)
+{
+	struct ep93xx_tcu *tcu = ep93xx_tcu;
+	struct clock_event_device *evt = dev_id;
+
+	/* Writing any value clears the timer interrupt */
+	writel(1, tcu->base + EP93XX_TIMER3_CLEAR);
+
+	evt->event_handler(evt);
+
+	return IRQ_HANDLED;
+}
+
+static int __init ep93xx_timer_of_init(struct device_node *np)
+{
+	int irq;
+	unsigned long flags = IRQF_TIMER | IRQF_IRQPOLL;
+	struct ep93xx_tcu *tcu;
+	int ret;
+
+	tcu = kzalloc(sizeof(*tcu), GFP_KERNEL);
+	if (!tcu)
+		return -ENOMEM;
+
+	tcu->base = of_iomap(np, 0);
+	if (!tcu->base) {
+		pr_err("Can't remap registers\n");
+		ret = -ENXIO;
+		goto out_free;
+	}
+
+	ep93xx_tcu = tcu;
+
+	irq = irq_of_parse_and_map(np, 0);
+	if (irq == 0)
+		irq = -EINVAL;
+	if (irq < 0) {
+		pr_err("EP93XX Timer Can't parse IRQ %d", irq);
+		goto out_free;
+	}
+
+	/* Enable and register clocksource and sched_clock on timer 4 */
+	writel(EP93XX_TIMER4_VALUE_HIGH_ENABLE,
+	       tcu->base + EP93XX_TIMER4_VALUE_HIGH);
+	clocksource_mmio_init(NULL, "timer4",
+				EP93XX_TIMER4_RATE, 200, 40,
+				ep93xx_clocksource_read);
+	sched_clock_register(ep93xx_read_sched_clock, 40,
+			     EP93XX_TIMER4_RATE);
+
+	/* Set up clockevent on timer 3 */
+	if (request_irq(irq, ep93xx_timer_interrupt, flags, "ep93xx timer",
+		&ep93xx_clockevent))
+		pr_err("Failed to request irq %d (ep93xx timer)\n", irq);
+
+	clockevents_config_and_register(&ep93xx_clockevent,
+				EP93XX_TIMER123_RATE,
+				1,
+				UINT_MAX);
+
+	return 0;
+
+out_free:
+	kfree(tcu);
+	return ret;
+}
+TIMER_OF_DECLARE(ep93xx_timer, "cirrus,ep9301-timer", ep93xx_timer_of_init);

-- 
2.39.2

