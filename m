Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A8C75C0F5
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:12:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 516BDE79;
	Fri, 21 Jul 2023 10:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 516BDE79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689927143;
	bh=ATONI3oQ7w6W5U/QjS7XG3yFALNIbOuzI6jSyOFIQvI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dlJcUXR5VaKaQwsgWoXBCPXlRx4OLPEO2YirHynjBIiAbzz1YRjMe1dOG08XGXZdJ
	 D+WIEn3QTyV40s8sDvhN1oL6jqDlsleiAVqteQr29afDdFcYCIJ7ji062qMNxiUhID
	 RL86+wLLVLo/GJRPKeaf/fR36iG5xdomXVaYQKkY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E13C9F805EA; Fri, 21 Jul 2023 10:09:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24D97F805E5;
	Fri, 21 Jul 2023 10:09:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9F85F805A1; Thu, 20 Jul 2023 10:30:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7DC8AF80494
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 10:30:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DC8AF80494
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UeCGNmr6
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1A6B6619F6;
	Thu, 20 Jul 2023 08:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33231C433B7;
	Thu, 20 Jul 2023 08:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689841796;
	bh=ATONI3oQ7w6W5U/QjS7XG3yFALNIbOuzI6jSyOFIQvI=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=UeCGNmr60CbBfDosh3Ehoiipb6mSwjH/B82+ZYA6z1dy6g/l3j1vzXkNVVyniugMQ
	 hgKoxBpHVKn30+e4cRRevaBxDAsnqjQ66GyBL7rmMWm1V0Wtnt+mFF7DTAhf9ipxZG
	 /ZyRQBf1fyMU3+Px5X+rbYnH4R+oPGkn9n8H1aAA8sCOTBN82xH7aukQP1eO712fEm
	 9/bFjwFShD4eeppzUW7I62YokUyflsvbA57n3sOi5a9NjKuKr3vGCbuVMtOxyHPYRo
	 v4ZvQq4zO2lYb+n5eNKK2ZOk/MJ6qg4yVUO5zdjbJAlzCk4cj7LFGrQXnx56Iad151
	 /ynV62OblWPQQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A74DEB64DD;
	Thu, 20 Jul 2023 08:29:56 +0000 (UTC)
From: 
 Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Thu, 20 Jul 2023 14:29:03 +0300
Subject: [PATCH v3 03/42] clk: ep93xx: add DT support for Cirrus EP93xx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230605-ep93xx-v3-3-3d63a5f1103e@maquefel.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689852590; l=24223;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=7NL5TB4x4kyDhU79IcMjfwtxEf1O3P/f48+pcwo8xRM=; =?utf-8?q?b=3DLBf+AE08NRHW?=
 =?utf-8?q?YXadjiK4Cl1jeLVc/rikXtKY8hpVZm06yUc9qGWZGj0sES5WvyM2dujUwRhxdRLj?=
 6LDvrYWqD25//+k9v5IipvX0Zr6+8FGLNYpcNDb5m4fSbT8KU0G9
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
Message-ID-Hash: E7GV72I3GRGAFQLXWA2DC72TXS5HEPKJ
X-Message-ID-Hash: E7GV72I3GRGAFQLXWA2DC72TXS5HEPKJ
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:08:46 +0000
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: nikita.shubin@maquefel.me
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E7GV72I3GRGAFQLXWA2DC72TXS5HEPKJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Nikita Shubin <nikita.shubin@maquefel.me>

This is a rewrite of EP93xx clock driver in arch/arm/mach-ep93xx/clock.c
trying to do everything the device tree way:

- provide clock acces via of
- drop clk_hw_register_clkdev
- drop init code and use builtin_platform_driver_probe

Also moved all clocks not accessed via device tree to syscon.

Co-developed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/clk/Kconfig      |   8 +
 drivers/clk/Makefile     |   1 +
 drivers/clk/clk-ep93xx.c | 764 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 773 insertions(+)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 93f38a8178ba..0c13ea504820 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -218,6 +218,14 @@ config COMMON_CLK_EN7523
 	  This driver provides the fixed clocks and gates present on Airoha
 	  ARM silicon.
 
+config COMMON_CLK_EP93XX
+	bool "Clock driver for Cirrus Logic ep93xx SoC"
+	depends on ARCH_EP93XX || COMPILE_TEST
+	select MFD_SYSCON
+	select REGMAP
+	help
+	  This driver supports the SoC clocks on the Cirrus Logic ep93xx.
+
 config COMMON_CLK_FSL_FLEXSPI
 	tristate "Clock driver for FlexSPI on Layerscape SoCs"
 	depends on ARCH_LAYERSCAPE || COMPILE_TEST
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 7cb000549b61..6049a2073a25 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_COMMON_CLK_CDCE706)	+= clk-cdce706.o
 obj-$(CONFIG_COMMON_CLK_CDCE925)	+= clk-cdce925.o
 obj-$(CONFIG_ARCH_CLPS711X)		+= clk-clps711x.o
 obj-$(CONFIG_COMMON_CLK_CS2000_CP)	+= clk-cs2000-cp.o
+obj-$(CONFIG_COMMON_CLK_EP93XX)		+= clk-ep93xx.o
 obj-$(CONFIG_ARCH_SPARX5)		+= clk-sparx5.o
 obj-$(CONFIG_COMMON_CLK_EN7523)		+= clk-en7523.o
 obj-$(CONFIG_COMMON_CLK_FIXED_MMIO)	+= clk-fixed-mmio.o
diff --git a/drivers/clk/clk-ep93xx.c b/drivers/clk/clk-ep93xx.c
new file mode 100644
index 000000000000..7b9b3a0894ab
--- /dev/null
+++ b/drivers/clk/clk-ep93xx.c
@@ -0,0 +1,764 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Clock control for Cirrus EP93xx chips.
+ * Copyright (C) 2021 Nikita Shubin <nikita.shubin@maquefel.me>
+ *
+ * Based on a rewrite of arch/arm/mach-ep93xx/clock.c:
+ * Copyright (C) 2006 Lennert Buytenhek <buytenh@wantstofly.org>
+ */
+#define pr_fmt(fmt) "ep93xx " KBUILD_MODNAME ": " fmt
+
+#include <linux/bits.h>
+#include <linux/clk-provider.h>
+#include <linux/clk.h>
+#include <linux/clkdev.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
+#include <linux/sys_soc.h>
+
+#include <linux/soc/cirrus/ep93xx.h>
+#include <dt-bindings/clock/cirrus,ep93xx-clock.h>
+
+#include <asm/div64.h>
+
+#define EP93XX_EXT_RTC_RATE		32768
+
+#define EP93XX_SYSCON_POWER_STATE	0x00
+#define EP93XX_SYSCON_PWRCNT		0x04
+#define EP93XX_SYSCON_PWRCNT_UARTBAUD	BIT(29)
+#define EP93XX_SYSCON_PWRCNT_USH_EN	28
+#define EP93XX_SYSCON_PWRCNT_DMA_M2M1	27
+#define EP93XX_SYSCON_PWRCNT_DMA_M2M0	26
+#define EP93XX_SYSCON_PWRCNT_DMA_M2P8	25
+#define EP93XX_SYSCON_PWRCNT_DMA_M2P9	24
+#define EP93XX_SYSCON_PWRCNT_DMA_M2P6	23
+#define EP93XX_SYSCON_PWRCNT_DMA_M2P7	22
+#define EP93XX_SYSCON_PWRCNT_DMA_M2P4	21
+#define EP93XX_SYSCON_PWRCNT_DMA_M2P5	20
+#define EP93XX_SYSCON_PWRCNT_DMA_M2P2	19
+#define EP93XX_SYSCON_PWRCNT_DMA_M2P3	18
+#define EP93XX_SYSCON_PWRCNT_DMA_M2P0	17
+#define EP93XX_SYSCON_PWRCNT_DMA_M2P1	16
+#define EP93XX_SYSCON_DEVCFG		0x80
+#define EP93XX_SYSCON_DEVCFG_U3EN	24
+#define EP93XX_SYSCON_DEVCFG_U2EN	20
+#define EP93XX_SYSCON_DEVCFG_U1EN	18
+#define EP93XX_SYSCON_VIDCLKDIV		0x84
+#define EP93XX_SYSCON_CLKDIV_ENABLE	15
+#define EP93XX_SYSCON_CLKDIV_ESEL	BIT(14)
+#define EP93XX_SYSCON_CLKDIV_PSEL	BIT(13)
+#define EP93XX_SYSCON_CLKDIV_MASK	GENMASK(14, 13)
+#define EP93XX_SYSCON_CLKDIV_PDIV_SHIFT	8
+#define EP93XX_SYSCON_I2SCLKDIV		0x8c
+#define EP93XX_SYSCON_I2SCLKDIV_SENA	31
+#define EP93XX_SYSCON_I2SCLKDIV_ORIDE	BIT(29)
+#define EP93XX_SYSCON_I2SCLKDIV_SPOL	BIT(19)
+#define EP93XX_I2SCLKDIV_SDIV		(1 << 16)
+#define EP93XX_I2SCLKDIV_LRDIV32	(0 << 17)
+#define EP93XX_I2SCLKDIV_LRDIV64	(1 << 17)
+#define EP93XX_I2SCLKDIV_LRDIV128	(2 << 17)
+#define EP93XX_I2SCLKDIV_LRDIV_MASK	(3 << 17)
+#define EP93XX_SYSCON_KEYTCHCLKDIV	0x90
+#define EP93XX_SYSCON_KEYTCHCLKDIV_TSEN	31
+#define EP93XX_SYSCON_KEYTCHCLKDIV_ADIV	16
+#define EP93XX_SYSCON_KEYTCHCLKDIV_KEN	15
+#define EP93XX_SYSCON_KEYTCHCLKDIV_KDIV	0
+#define EP93XX_SYSCON_CHIPID		0x94
+#define EP93XX_SYSCON_CHIPID_ID		0x9213
+
+/* Keeps track of all clocks */
+static const char adc_divisors[] = { 16, 4 };
+static const char sclk_divisors[] = { 2, 4 };
+static const char lrclk_divisors[] = { 32, 64, 128 };
+
+#define EP_PARENT(NAME) { .name = NAME, .fw_name = NAME }
+
+static const struct clk_parent_data ep93xx_clk_parents[] = {
+	EP_PARENT("xtali"),
+	EP_PARENT("pll1"),
+	EP_PARENT("pll2"),
+};
+
+struct ep93xx_clk {
+	struct clk_hw hw;
+	u16 idx;
+	u16 reg;
+	u32 mask;
+	u8 bit_idx;
+	u8 shift;
+	u8 width;
+	u8 num_div;
+	const char *div;
+};
+
+struct ep93xx_clk_priv {
+	spinlock_t lock;
+	struct device *dev;
+	void __iomem *base;
+	struct regmap *map;
+	struct clk_hw *fixed[16];
+	struct ep93xx_clk reg[];
+};
+
+static struct ep93xx_clk *ep93xx_clk_from(struct clk_hw *hw)
+{
+	return container_of(hw, struct ep93xx_clk, hw);
+}
+
+static struct ep93xx_clk_priv *ep93xx_priv_from(struct ep93xx_clk *clk)
+{
+	return container_of(clk, struct ep93xx_clk_priv, reg[clk->idx]);
+}
+
+static int ep93xx_clk_is_enabled(struct clk_hw *hw)
+{
+	struct ep93xx_clk *clk = ep93xx_clk_from(hw);
+	struct ep93xx_clk_priv *priv = ep93xx_priv_from(clk);
+	u32 val;
+
+	regmap_read(priv->map, clk->reg, &val);
+
+	return !!(val & BIT(clk->bit_idx));
+}
+
+static int ep93xx_clk_enable(struct clk_hw *hw)
+{
+	struct ep93xx_clk *clk = ep93xx_clk_from(hw);
+	struct ep93xx_clk_priv *priv = ep93xx_priv_from(clk);
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&priv->lock, flags);
+
+	regmap_read(priv->map, clk->reg, &val);
+	val |= BIT(clk->bit_idx);
+
+	ep93xx_syscon_swlocked_write(priv->map, clk->reg, val);
+
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
+}
+
+static void ep93xx_clk_disable(struct clk_hw *hw)
+{
+	struct ep93xx_clk *clk = ep93xx_clk_from(hw);
+	struct ep93xx_clk_priv *priv = ep93xx_priv_from(clk);
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&priv->lock, flags);
+
+	regmap_read(priv->map, clk->reg, &val);
+	val &= ~BIT(clk->bit_idx);
+
+	ep93xx_syscon_swlocked_write(priv->map, clk->reg, val);
+
+	spin_unlock_irqrestore(&priv->lock, flags);
+}
+
+static const struct clk_ops clk_ep93xx_gate_ops = {
+	.enable = ep93xx_clk_enable,
+	.disable = ep93xx_clk_disable,
+	.is_enabled = ep93xx_clk_is_enabled,
+};
+
+static int ep93xx_clk_register_gate(struct ep93xx_clk *clk,
+					const char *name,
+					const char *parent_name,
+					unsigned long flags,
+					unsigned int reg,
+					u8 bit_idx)
+{
+	struct ep93xx_clk_priv *priv = ep93xx_priv_from(clk);
+	struct clk_parent_data parent_data = { };
+	struct clk_init_data init = { };
+
+	init.name = name;
+	init.ops = &clk_ep93xx_gate_ops;
+	init.flags = flags;
+
+	parent_data.fw_name = parent_name;
+	parent_data.name = parent_name;
+	init.parent_data = &parent_data;
+	init.num_parents = 1;
+
+	clk->reg = reg;
+	clk->bit_idx = bit_idx;
+	clk->hw.init = &init;
+
+	return devm_clk_hw_register(priv->dev, &clk->hw);
+}
+
+static u8 ep93xx_mux_get_parent(struct clk_hw *hw)
+{
+	struct ep93xx_clk *clk = ep93xx_clk_from(hw);
+	struct ep93xx_clk_priv *priv = ep93xx_priv_from(clk);
+	u32 val;
+
+	regmap_read(priv->map, clk->reg, &val);
+
+	val &= EP93XX_SYSCON_CLKDIV_MASK;
+
+	switch (val) {
+	case EP93XX_SYSCON_CLKDIV_ESEL:
+		return 1; // PLL1
+	case EP93XX_SYSCON_CLKDIV_MASK:
+		return 2; // PLL2
+	default:
+		break;
+	};
+
+	return 0; // XTALI
+}
+
+static int ep93xx_mux_set_parent_lock(struct clk_hw *hw, u8 index)
+{
+	struct ep93xx_clk *clk = ep93xx_clk_from(hw);
+	struct ep93xx_clk_priv *priv = ep93xx_priv_from(clk);
+	unsigned long flags;
+	u32 val;
+
+	if (index >= ARRAY_SIZE(ep93xx_clk_parents))
+		return -EINVAL;
+
+	spin_lock_irqsave(&priv->lock, flags);
+
+	regmap_read(priv->map, clk->reg, &val);
+	val &= ~(EP93XX_SYSCON_CLKDIV_MASK);
+	if (index) {
+		val |= EP93XX_SYSCON_CLKDIV_ESEL;
+		val |= (index - 1) ? EP93XX_SYSCON_CLKDIV_PSEL : 0;
+	}
+
+	ep93xx_syscon_swlocked_write(priv->map, clk->reg, val);
+
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
+}
+
+static bool is_best(unsigned long rate, unsigned long now,
+		     unsigned long best)
+{
+	return abs(rate - now) < abs(rate - best);
+}
+
+static int ep93xx_mux_determine_rate(struct clk_hw *hw,
+				struct clk_rate_request *req)
+{
+	unsigned long best_rate = 0, actual_rate, mclk_rate;
+	unsigned long rate = req->rate;
+	struct clk_hw *parent_best = NULL;
+	unsigned long parent_rate_best;
+	unsigned long parent_rate;
+	int div, pdiv;
+	unsigned int i;
+
+	/*
+	 * Try the two pll's and the external clock
+	 * Because the valid predividers are 2, 2.5 and 3, we multiply
+	 * all the clocks by 2 to avoid floating point math.
+	 *
+	 * This is based on the algorithm in the ep93xx raster guide:
+	 * http://be-a-maverick.com/en/pubs/appNote/AN269REV1.pdf
+	 *
+	 */
+	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
+		struct clk_hw *parent = clk_hw_get_parent_by_index(hw, i);
+
+		parent_rate = clk_hw_get_rate(parent);
+		mclk_rate = parent_rate * 2;
+
+		/* Try each predivider value */
+		for (pdiv = 4; pdiv <= 6; pdiv++) {
+			div = DIV_ROUND_CLOSEST(mclk_rate, rate * pdiv);
+			if (div < 1 || div > 127)
+				continue;
+
+			actual_rate = DIV_ROUND_CLOSEST(mclk_rate, pdiv * div);
+			if (is_best(rate, actual_rate, best_rate)) {
+				best_rate = actual_rate;
+				parent_rate_best = parent_rate;
+				parent_best = parent;
+			}
+		}
+	}
+
+	if (!parent_best)
+		return -EINVAL;
+
+	req->best_parent_rate = parent_rate_best;
+	req->best_parent_hw = parent_best;
+	req->rate = best_rate;
+
+	return 0;
+}
+
+static unsigned long ep93xx_ddiv_recalc_rate(struct clk_hw *hw,
+						unsigned long parent_rate)
+{
+	struct ep93xx_clk *clk = ep93xx_clk_from(hw);
+	struct ep93xx_clk_priv *priv = ep93xx_priv_from(clk);
+	unsigned int pdiv, div;
+	u32 val;
+
+	regmap_read(priv->map, clk->reg, &val);
+	pdiv = ((val >> EP93XX_SYSCON_CLKDIV_PDIV_SHIFT) & 0x03);
+	div = val & GENMASK(6, 0);
+	if (!div)
+		return 0;
+
+	return DIV_ROUND_CLOSEST(parent_rate * 2, (pdiv + 3) * div);
+}
+
+static int ep93xx_ddiv_set_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long parent_rate)
+{
+	struct ep93xx_clk *clk = ep93xx_clk_from(hw);
+	struct ep93xx_clk_priv *priv = ep93xx_priv_from(clk);
+	int pdiv, div, npdiv, ndiv;
+	unsigned long actual_rate, mclk_rate, rate_err = ULONG_MAX;
+	u32 val;
+
+	regmap_read(priv->map, clk->reg, &val);
+	mclk_rate = parent_rate * 2;
+
+	for (pdiv = 4; pdiv <= 6; pdiv++) {
+		div = DIV_ROUND_CLOSEST(mclk_rate, rate * pdiv);
+		if (div < 1 || div > 127)
+			continue;
+
+		actual_rate = DIV_ROUND_CLOSEST(mclk_rate, pdiv * div);
+		if (abs(actual_rate - rate) < rate_err) {
+			npdiv = pdiv - 3;
+			ndiv = div;
+			rate_err = abs(actual_rate - rate);
+		}
+	}
+
+	if (rate_err == ULONG_MAX)
+		return -EINVAL;
+
+	/* Clear old dividers */
+	val &= ~(GENMASK(9, 0) & ~BIT(7));
+
+	/* Set the new pdiv and div bits for the new clock rate */
+	val |= (npdiv << EP93XX_SYSCON_CLKDIV_PDIV_SHIFT) | ndiv;
+
+	ep93xx_syscon_swlocked_write(priv->map, clk->reg, val);
+
+	return 0;
+}
+
+static const struct clk_ops clk_ddiv_ops = {
+	.enable = ep93xx_clk_enable,
+	.disable = ep93xx_clk_disable,
+	.is_enabled = ep93xx_clk_is_enabled,
+	.get_parent = ep93xx_mux_get_parent,
+	.set_parent = ep93xx_mux_set_parent_lock,
+	.determine_rate = ep93xx_mux_determine_rate,
+	.recalc_rate = ep93xx_ddiv_recalc_rate,
+	.set_rate = ep93xx_ddiv_set_rate,
+};
+
+static int clk_hw_register_ddiv(struct ep93xx_clk *clk,
+						const char *name,
+						unsigned int reg,
+						u8 bit_idx)
+{
+	struct ep93xx_clk_priv *priv = ep93xx_priv_from(clk);
+	struct clk_init_data init = { };
+
+	init.name = name;
+	init.ops = &clk_ddiv_ops;
+	init.flags = 0;
+	init.parent_data = ep93xx_clk_parents;
+	init.num_parents = ARRAY_SIZE(ep93xx_clk_parents);
+
+	clk->reg = reg;
+	clk->bit_idx = bit_idx;
+	clk->hw.init = &init;
+
+	return devm_clk_hw_register(priv->dev, &clk->hw);
+}
+
+static unsigned long ep93xx_div_recalc_rate(struct clk_hw *hw,
+					    unsigned long parent_rate)
+{
+	struct ep93xx_clk *clk = ep93xx_clk_from(hw);
+	struct ep93xx_clk_priv *priv = ep93xx_priv_from(clk);
+	u32 val;
+	u8 index;
+
+	regmap_read(priv->map, clk->reg, &val);
+	index = (val & clk->mask) >> clk->shift;
+	if (index > clk->num_div)
+		return 0;
+
+	return DIV_ROUND_CLOSEST(parent_rate, clk->div[index]);
+}
+
+static long ep93xx_div_round_rate(struct clk_hw *hw, unsigned long rate,
+				   unsigned long *parent_rate)
+{
+	struct ep93xx_clk *clk = ep93xx_clk_from(hw);
+	unsigned long best = 0, now;
+	unsigned int i;
+
+	for (i = 0; i < clk->num_div; i++) {
+		if ((rate * clk->div[i]) == *parent_rate)
+			return rate;
+
+		now = DIV_ROUND_CLOSEST(*parent_rate, clk->div[i]);
+		if (!best || is_best(rate, now, best))
+			best = now;
+	}
+
+	return best;
+}
+
+static int ep93xx_div_set_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long parent_rate)
+{
+	struct ep93xx_clk *clk = ep93xx_clk_from(hw);
+	struct ep93xx_clk_priv *priv = ep93xx_priv_from(clk);
+	unsigned int i;
+	u32 val;
+
+	regmap_read(priv->map, clk->reg, &val);
+	val &= ~clk->mask;
+	for (i = 0; i < clk->num_div; i++)
+		if (rate == DIV_ROUND_CLOSEST(parent_rate, clk->div[i])) {
+			val |= i << clk->shift;
+			break;
+		}
+
+	if (i == clk->num_div)
+		return -EINVAL;
+
+	ep93xx_syscon_swlocked_write(priv->map, clk->reg, val);
+
+	return 0;
+}
+
+static const struct clk_ops ep93xx_div_ops = {
+	.enable = ep93xx_clk_enable,
+	.disable = ep93xx_clk_disable,
+	.is_enabled = ep93xx_clk_is_enabled,
+	.recalc_rate = ep93xx_div_recalc_rate,
+	.round_rate = ep93xx_div_round_rate,
+	.set_rate = ep93xx_div_set_rate,
+};
+
+static int clk_hw_register_div(struct ep93xx_clk *clk,
+					  const char *name,
+					  const char *parent_name,
+					  unsigned int reg,
+					  u8 enable_bit,
+					  u8 shift,
+					  u8 width,
+					  const char *clk_divisors,
+					  u8 num_div)
+{
+	struct ep93xx_clk_priv *priv = ep93xx_priv_from(clk);
+	struct clk_parent_data parent_data = { };
+	struct clk_init_data init = { };
+
+	init.name = name;
+	init.ops = &ep93xx_div_ops;
+	init.flags = 0;
+	parent_data.fw_name = parent_name;
+	parent_data.name = parent_name;
+	init.parent_data = &parent_data;
+	init.num_parents = 1;
+
+	clk->reg = reg;
+	clk->bit_idx = enable_bit;
+	clk->mask = GENMASK(shift + width - 1, shift);
+	clk->shift = shift;
+	clk->div = clk_divisors;
+	clk->num_div = num_div;
+	clk->hw.init = &init;
+
+	return devm_clk_hw_register(priv->dev, &clk->hw);
+}
+
+struct ep93xx_gate {
+	unsigned int idx;
+	unsigned int bit;
+	const char *name;
+};
+
+static const struct ep93xx_gate ep93xx_uarts[] = {
+	{ EP93XX_CLK_UART1, EP93XX_SYSCON_DEVCFG_U1EN, "uart1" },
+	{ EP93XX_CLK_UART2, EP93XX_SYSCON_DEVCFG_U2EN, "uart2" },
+	{ EP93XX_CLK_UART3, EP93XX_SYSCON_DEVCFG_U3EN, "uart3" },
+};
+
+static int ep93xx_uart_clock_init(struct ep93xx_clk_priv *priv)
+{
+	struct ep93xx_clk *clk;
+	unsigned int i, ret, clk_uart_div;
+	u32 val;
+
+	regmap_read(priv->map, EP93XX_SYSCON_PWRCNT, &val);
+	if (val & EP93XX_SYSCON_PWRCNT_UARTBAUD)
+		clk_uart_div = 1;
+	else
+		clk_uart_div = 2;
+
+	priv->fixed[0] = clk_hw_register_fixed_factor(NULL, "uart", "xtali", 0, 1, clk_uart_div);
+
+	/* parenting uart gate clocks to uart clock */
+	for (i = 0; i < ARRAY_SIZE(ep93xx_uarts); i++) {
+		clk = &priv->reg[ep93xx_uarts[i].idx];
+		clk->idx = ep93xx_uarts[i].idx;
+		ret = ep93xx_clk_register_gate(clk,
+					ep93xx_uarts[i].name,
+					"uart", CLK_SET_RATE_PARENT,
+					EP93XX_SYSCON_DEVCFG,
+					ep93xx_uarts[i].bit);
+		if (ret)
+			return dev_err_probe(priv->dev, ret, "failed to register dma clock\n");
+	}
+
+	return 0;
+}
+
+static const struct ep93xx_gate ep93xx_dmas[] = {
+	{ EP93XX_CLK_M2M0, EP93XX_SYSCON_PWRCNT_DMA_M2M0, "m2m0" },
+	{ EP93XX_CLK_M2M1, EP93XX_SYSCON_PWRCNT_DMA_M2M1, "m2m1" },
+	{ EP93XX_CLK_M2P0, EP93XX_SYSCON_PWRCNT_DMA_M2P0, "m2p0" },
+	{ EP93XX_CLK_M2P1, EP93XX_SYSCON_PWRCNT_DMA_M2P1, "m2p1" },
+	{ EP93XX_CLK_M2P2, EP93XX_SYSCON_PWRCNT_DMA_M2P2, "m2p2" },
+	{ EP93XX_CLK_M2P3, EP93XX_SYSCON_PWRCNT_DMA_M2P3, "m2p3" },
+	{ EP93XX_CLK_M2P4, EP93XX_SYSCON_PWRCNT_DMA_M2P4, "m2p4" },
+	{ EP93XX_CLK_M2P5, EP93XX_SYSCON_PWRCNT_DMA_M2P5, "m2p5" },
+	{ EP93XX_CLK_M2P6, EP93XX_SYSCON_PWRCNT_DMA_M2P6, "m2p6" },
+	{ EP93XX_CLK_M2P7, EP93XX_SYSCON_PWRCNT_DMA_M2P7, "m2p7" },
+	{ EP93XX_CLK_M2P8, EP93XX_SYSCON_PWRCNT_DMA_M2P8, "m2p8" },
+	{ EP93XX_CLK_M2P9, EP93XX_SYSCON_PWRCNT_DMA_M2P9, "m2p9" },
+};
+
+static int ep93xx_dma_clock_init(struct ep93xx_clk_priv *priv)
+{
+	unsigned int i, idx;
+
+	for (i = 0; i < ARRAY_SIZE(ep93xx_dmas); i++) {
+		idx = ep93xx_dmas[i].idx - EP93XX_CLK_UART;
+		priv->fixed[idx] = devm_clk_hw_register_gate(priv->dev,
+					ep93xx_dmas[i].name,
+					"hclk", 0,
+					priv->base + EP93XX_SYSCON_PWRCNT,
+					ep93xx_dmas[i].bit,
+					0,
+					&priv->lock);
+		if (IS_ERR(priv->fixed[idx]))
+			return PTR_ERR(priv->fixed[idx]);
+	}
+
+	return 0;
+}
+
+static struct clk_hw *ep93xx_clk_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct ep93xx_clk_priv *priv = data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx < EP93XX_CLK_UART)
+		return &priv->reg[idx].hw;
+
+	if (idx < EP93XX_CLK_END)
+		return priv->fixed[idx - EP93XX_CLK_UART];
+
+	return ERR_PTR(-EINVAL);
+}
+
+static const struct soc_device_attribute ep93xx_soc_table[] = {
+	{ .revision = "E2", .data = (void *)1 },
+	{ /* sentinel */ }
+};
+
+static int ep93xx_clk_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	const struct soc_device_attribute *match;
+	struct ep93xx_clk_priv *priv;
+	struct ep93xx_clk *clk;
+	struct device_node *parent;
+	unsigned long clk_spi_div;
+	int ret;
+	u32 value;
+
+	priv = devm_kzalloc(dev, struct_size(priv, reg, EP93XX_CLK_UART), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	spin_lock_init(&priv->lock);
+	priv->dev = dev;
+	parent = of_get_parent(np);
+	if (!parent)
+		return dev_err_probe(dev, -EINVAL, "no syscon parent for clk node\n");
+
+	priv->map = syscon_node_to_regmap(parent);
+	if (IS_ERR(priv->map)) {
+		of_node_put(parent);
+		return dev_err_probe(dev, -EINVAL, "no syscon regmap\n");
+	}
+
+	priv->base = devm_of_iomap(dev, parent, 0, NULL);
+	of_node_put(parent);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	ret = ep93xx_uart_clock_init(priv);
+	if (ret)
+		return ret;
+
+	ret = ep93xx_dma_clock_init(priv);
+	if (ret)
+		return ret;
+
+	/*
+	 * EP93xx SSP clock rate was doubled in version E2. For more information
+	 * see:
+	 *     http://www.cirrus.com/en/pubs/appNote/AN273REV4.pdf
+	 */
+	clk_spi_div = 2;
+	match = soc_device_match(ep93xx_soc_table);
+	if (match)
+		clk_spi_div = (unsigned long)match->data;
+
+	priv->fixed[1] = devm_clk_hw_register_fixed_factor(dev, "ep93xx-spi.0", "xtali",
+							0, 1, clk_spi_div);
+	if (IS_ERR(priv->fixed[1]))
+		return PTR_ERR(priv->fixed[1]);
+
+	/* PWM clock */
+	priv->fixed[2] = devm_clk_hw_register_fixed_factor(dev, "pwm_clk", "xtali", 0, 1, 1);
+	if (IS_ERR(priv->fixed[2]))
+		return PTR_ERR(priv->fixed[2]);
+
+	/* USB clock */
+	priv->fixed[3] = devm_clk_hw_register_gate(priv->dev,
+					"ohci-platform",
+					"usb_clk", 0,
+					priv->base + EP93XX_SYSCON_PWRCNT,
+					EP93XX_SYSCON_PWRCNT_USH_EN,
+					0,
+					&priv->lock);
+	if (IS_ERR(priv->fixed[3]))
+		return PTR_ERR(priv->fixed[3]);
+
+	/* touchscreen/adc clock */
+	clk = &priv->reg[EP93XX_CLK_ADC];
+	clk->idx = EP93XX_CLK_ADC;
+	ret = clk_hw_register_div(clk, "ep93xx-adc", "xtali",
+				EP93XX_SYSCON_KEYTCHCLKDIV,
+				EP93XX_SYSCON_KEYTCHCLKDIV_TSEN,
+				EP93XX_SYSCON_KEYTCHCLKDIV_ADIV,
+				1,
+				adc_divisors,
+				ARRAY_SIZE(adc_divisors));
+
+
+	/* keypad clock */
+	clk = &priv->reg[EP93XX_CLK_KEYPAD];
+	clk->idx = EP93XX_CLK_KEYPAD;
+	ret = clk_hw_register_div(clk, "ep93xx-keypad", "xtali",
+				EP93XX_SYSCON_KEYTCHCLKDIV,
+				EP93XX_SYSCON_KEYTCHCLKDIV_KEN,
+				EP93XX_SYSCON_KEYTCHCLKDIV_KDIV,
+				1,
+				adc_divisors,
+				ARRAY_SIZE(adc_divisors));
+
+	/*
+	 * On reset PDIV and VDIV is set to zero, while PDIV zero
+	 * means clock disable, VDIV shouldn't be zero.
+	 * So i set both dividers to minimum.
+	 */
+	/* ENA - Enable CLK divider. */
+	/* PDIV - 00 - Disable clock */
+	/* VDIV - at least 2 */
+	/* Check and enable video clk registers */
+	regmap_read(priv->map, EP93XX_SYSCON_VIDCLKDIV, &value);
+	value |= BIT(EP93XX_SYSCON_CLKDIV_PDIV_SHIFT) | 2;
+	ep93xx_syscon_swlocked_write(priv->map, EP93XX_SYSCON_VIDCLKDIV, value);
+
+	/* check and enable i2s clk registers */
+	regmap_read(priv->map, EP93XX_SYSCON_I2SCLKDIV, &value);
+	value |= BIT(EP93XX_SYSCON_CLKDIV_PDIV_SHIFT) | 2;
+	/*
+	 * Override the SAI_MSTR_CLK_CFG from the I2S block and use the
+	 * I2SClkDiv Register settings. LRCLK transitions on the falling SCLK
+	 * edge.
+	 */
+	value |= EP93XX_SYSCON_I2SCLKDIV_ORIDE | EP93XX_SYSCON_I2SCLKDIV_SPOL;
+	ep93xx_syscon_swlocked_write(priv->map, EP93XX_SYSCON_I2SCLKDIV, value);
+
+	/* video clk */
+	clk = &priv->reg[EP93XX_CLK_VIDEO];
+	clk->idx = EP93XX_CLK_VIDEO;
+	ret = clk_hw_register_ddiv(clk, "ep93xx-fb",
+				EP93XX_SYSCON_VIDCLKDIV,
+				EP93XX_SYSCON_CLKDIV_ENABLE);
+
+	/* i2s clk */
+	clk = &priv->reg[EP93XX_CLK_I2S_MCLK];
+	clk->idx = EP93XX_CLK_I2S_MCLK;
+	ret = clk_hw_register_ddiv(clk, "mclk",
+				EP93XX_SYSCON_I2SCLKDIV,
+				EP93XX_SYSCON_CLKDIV_ENABLE);
+
+	/* i2s sclk */
+	clk = &priv->reg[EP93XX_CLK_I2S_SCLK];
+	clk->idx = EP93XX_CLK_I2S_SCLK;
+	ret = clk_hw_register_div(clk, "sclk", "mclk",
+				EP93XX_SYSCON_I2SCLKDIV,
+				EP93XX_SYSCON_I2SCLKDIV_SENA,
+				16, /* EP93XX_I2SCLKDIV_SDIV_SHIFT */
+				1,  /* EP93XX_I2SCLKDIV_SDIV_WIDTH */
+				sclk_divisors,
+				ARRAY_SIZE(sclk_divisors));
+
+	/* i2s lrclk */
+	clk = &priv->reg[EP93XX_CLK_I2S_LRCLK];
+	clk->idx = EP93XX_CLK_I2S_LRCLK;
+	ret = clk_hw_register_div(clk, "lrclk", "sclk",
+				EP93XX_SYSCON_I2SCLKDIV,
+				EP93XX_SYSCON_I2SCLKDIV_SENA,
+				17, /* EP93XX_I2SCLKDIV_LRDIV32_SHIFT */
+				2,  /* EP93XX_I2SCLKDIV_LRDIV32_WIDTH */
+				lrclk_divisors,
+				ARRAY_SIZE(lrclk_divisors));
+
+	/* IrDa clk uses same pattern but no init code presents in original clock driver */
+	return devm_of_clk_add_hw_provider(priv->dev, ep93xx_clk_get, priv);
+}
+
+static const struct of_device_id ep93xx_clk_dt_ids[] = {
+	{ .compatible = "cirrus,ep9301-clk" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver ep93xx_clk_driver = {
+	.driver = {
+		.name = "ep93xx-clk",
+		.of_match_table = ep93xx_clk_dt_ids,
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver_probe(ep93xx_clk_driver, ep93xx_clk_probe);
+MODULE_IMPORT_NS(EP93XX_SOC);

-- 
2.39.2

