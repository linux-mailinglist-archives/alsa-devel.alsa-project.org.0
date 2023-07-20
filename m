Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E52A75C117
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:16:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90641E7F;
	Fri, 21 Jul 2023 10:15:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90641E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689927368;
	bh=ct/EpuMvdUCuMjjViIZ5tkc4m9rWwQV30W6wJGWQmXQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j5t1PRtKaGPGPWZXVr+vF/n5V15oDrrvqZDcZ36EPNydL1PUtIdeqtZSaowstZfy+
	 /tc8t56NFJYOV4yWI1JEZwq1HKJt0wnGL8S0jbZe6VmsRb1LFWleEI+1bDpY/h+JEm
	 81qDdf15/VgHPoEyZ5Kee4w2LNkRAvyJ6w22DoS8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7438BF80683; Fri, 21 Jul 2023 10:10:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FFCEF80551;
	Fri, 21 Jul 2023 10:10:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EE6EF804DA; Thu, 20 Jul 2023 10:30:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0379AF80552
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 10:30:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0379AF80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=f7VetNXk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 91E7A61927;
	Thu, 20 Jul 2023 08:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6940AC00445;
	Thu, 20 Jul 2023 08:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689841797;
	bh=ct/EpuMvdUCuMjjViIZ5tkc4m9rWwQV30W6wJGWQmXQ=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=f7VetNXkHGEwNxsJGXYEsLDGzhyKv0QX6gOJXr+7h/Yqy7G7z87TpnlfcArekXxHL
	 3a9rGKxCB5FLOtbN6/oOgs116+rebxMeLRMvMU0leLI8gseRJ5tjxDonh4owOR3aI9
	 KEOG78YjnY0n/yKXVuWbivQ9Ihi2+T/fBaKJ/GMePD9QHza8pFOuGfaLQSQP+95Q1H
	 Ji6G3rvf84lvtaTTGNlPSe5xFz8VqBxQ8LyMveMTf5q134+AIDKqzGFKUh02spxKJz
	 TwXRTrPzXdufRD8iHjZdk5RZ90vhr5EjrZ6LwqyoYgcp2NUJamRXE2kFIS9y8r9MK/
	 RZmUtCXEJDZ8g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 547D9C05051;
	Thu, 20 Jul 2023 08:29:57 +0000 (UTC)
From: 
 Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Thu, 20 Jul 2023 14:29:14 +0300
Subject: [PATCH v3 14/42] power: reset: Add a driver for the ep93xx reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230605-ep93xx-v3-14-3d63a5f1103e@maquefel.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689852590; l=4404;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=jarF+KELK7mZorvLAgBXky3sB5pXOZlhQ5qnPmmBEEc=; =?utf-8?q?b=3DsU2/xrwREaEF?=
 =?utf-8?q?hfdVfzNIHKHyeuUxFdGxGcpzUMuQQY86vWK69t09xviiikO7SiDRkSFcdJG9PuZV?=
 hHMf4YqYDw3cUCWElglNk3PsyWdNstIDwmSDzYvqa1AWe2iFMrtc
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
Message-ID-Hash: WMNJRA6GOZS6RSWR43WTYMTLZSHAHEE2
X-Message-ID-Hash: WMNJRA6GOZS6RSWR43WTYMTLZSHAHEE2
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:10:07 +0000
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: nikita.shubin@maquefel.me
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WMNJRA6GOZS6RSWR43WTYMTLZSHAHEE2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Nikita Shubin <nikita.shubin@maquefel.me>

Implement the reset behaviour of the various EP93xx SoCS in drivers/power/reset.

It used to be located in arch/arm/mach-ep93xx.

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
Acked-by: Sebastian Reichel <sre@kernel.org>
---
 drivers/power/reset/Kconfig          | 10 +++++
 drivers/power/reset/Makefile         |  1 +
 drivers/power/reset/ep93xx-restart.c | 86 ++++++++++++++++++++++++++++++++++++
 3 files changed, 97 insertions(+)

diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index fff07b2bd77b..9c2aa9218841 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -75,6 +75,16 @@ config POWER_RESET_BRCMSTB
 	  Say Y here if you have a Broadcom STB board and you wish
 	  to have restart support.
 
+config POWER_RESET_EP93XX
+	bool "Cirrus EP93XX reset driver" if COMPILE_TEST
+	depends on MFD_SYSCON
+	default ARCH_EP93XX
+	help
+	  This driver provides restart support for Cirrus EP93XX SoC.
+
+	  Say Y here if you have a Cirrus EP93XX SoC and you wish
+	  to have restart support.
+
 config POWER_RESET_GEMINI_POWEROFF
 	bool "Cortina Gemini power-off driver"
 	depends on ARCH_GEMINI || COMPILE_TEST
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index d763e6735ee3..61f4e11619b2 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_POWER_RESET_ATC260X) += atc260x-poweroff.o
 obj-$(CONFIG_POWER_RESET_AXXIA) += axxia-reset.o
 obj-$(CONFIG_POWER_RESET_BRCMKONA) += brcm-kona-reset.o
 obj-$(CONFIG_POWER_RESET_BRCMSTB) += brcmstb-reboot.o
+obj-$(CONFIG_POWER_RESET_EP93XX) += ep93xx-restart.o
 obj-$(CONFIG_POWER_RESET_GEMINI_POWEROFF) += gemini-poweroff.o
 obj-$(CONFIG_POWER_RESET_GPIO) += gpio-poweroff.o
 obj-$(CONFIG_POWER_RESET_GPIO_RESTART) += gpio-restart.o
diff --git a/drivers/power/reset/ep93xx-restart.c b/drivers/power/reset/ep93xx-restart.c
new file mode 100644
index 000000000000..1f5be7de8719
--- /dev/null
+++ b/drivers/power/reset/ep93xx-restart.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: (GPL-2.0)
+/*
+ * Cirrus EP93xx SoC reset driver
+ *
+ * Copyright (C) 2021 Nikita Shubin <nikita.shubin@maquefel.me>
+ */
+
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/mfd/syscon.h>
+#include <linux/notifier.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/reboot.h>
+
+#include <linux/soc/cirrus/ep93xx.h>
+
+#define EP93XX_SYSCON_DEVCFG_SWRST	BIT(31)
+
+struct ep93xx_restart {
+	struct regmap *map;
+	struct notifier_block restart_handler;
+};
+
+static int ep93xx_restart_handle(struct notifier_block *this,
+				 unsigned long mode, void *cmd)
+{
+	struct ep93xx_restart *priv =
+		container_of(this, struct ep93xx_restart, restart_handler);
+
+	/* Issue the reboot */
+	ep93xx_devcfg_set_clear(priv->map, EP93XX_SYSCON_DEVCFG_SWRST, 0x00);
+	ep93xx_devcfg_set_clear(priv->map, 0x00, EP93XX_SYSCON_DEVCFG_SWRST);
+
+	mdelay(1000);
+
+	pr_emerg("Unable to restart system\n");
+	return NOTIFY_DONE;
+}
+
+static int ep93xx_reboot_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct ep93xx_restart *priv;
+	struct device_node *parent;
+	int err;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	parent = of_get_parent(dev->of_node);
+	if (!parent)
+		return dev_err_probe(dev, -EINVAL, "no syscon parent for reboot node\n");
+
+	priv->map = syscon_node_to_regmap(parent);
+	of_node_put(parent);
+	if (IS_ERR(priv->map))
+		return dev_err_probe(dev, -EINVAL, "no syscon regmap\n");
+
+	priv->restart_handler.notifier_call = ep93xx_restart_handle;
+	priv->restart_handler.priority = 128;
+
+	err = register_restart_handler(&priv->restart_handler);
+	if (err)
+		return dev_err_probe(dev, err, "can't register restart notifier\n");
+
+	return err;
+}
+
+static const struct of_device_id ep93xx_reboot_of_match[] = {
+	{
+		.compatible = "cirrus,ep9301-reboot",
+	},
+	{ /* sentinel */ }
+};
+
+static struct platform_driver ep93xx_reboot_driver = {
+	.probe = ep93xx_reboot_probe,
+	.driver = {
+		.name = "ep9301-reboot",
+		.of_match_table = ep93xx_reboot_of_match,
+	},
+};
+builtin_platform_driver(ep93xx_reboot_driver);
+MODULE_IMPORT_NS(EP93XX_SOC);

-- 
2.39.2

