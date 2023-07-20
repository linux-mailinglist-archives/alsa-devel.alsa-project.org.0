Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD50575C24E
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:59:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7CC7E76;
	Fri, 21 Jul 2023 10:58:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7CC7E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689929986;
	bh=ikYOQaIq/TDR00gjOtB+SA6HOwH8tfm8sIMM9tqOCrk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t3oemHi5fLYhPAcTljTqF6Mtm/NYETPA/aubhbYfr2G8LqH/6i10fW65Wt8Cd3QsW
	 cOeqDL/gLusgN2LNDhVL97qst8Q8gvpCLF45PC5TztSEvOlC5qc4sP61T4G7atqMhi
	 OxifbEAHeNtxKemI5RmlOkT0mWM7QDEX0FColfW4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52F86F8065B; Fri, 21 Jul 2023 10:54:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83AA3F80641;
	Fri, 21 Jul 2023 10:54:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05AF6F8047D; Fri, 21 Jul 2023 01:27:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB320F800D2
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 01:27:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB320F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uthAq/6w
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6E79661CA5;
	Thu, 20 Jul 2023 23:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA62FC433C7;
	Thu, 20 Jul 2023 23:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689895667;
	bh=ikYOQaIq/TDR00gjOtB+SA6HOwH8tfm8sIMM9tqOCrk=;
	h=In-Reply-To:References:Subject:From:Cc:List-Id:To:Date:From;
	b=uthAq/6wRe7TZTwVD+xWuvheQAJ4nZB7173qg1WD1fM9nwJaI0uz9d1PCOeeAvsh/
	 jLLB/aQhsBmfyfKA7sj/EHkEDrdoDUjCNV28UZbMygxq8O7kD7UBAfLdDlS9rFI42M
	 /fs4UL2wD6w8QKgpzkSL1exbCDK/iniz9hvaM6vLlMaYPx2ruxz/m5BLc33gHLAR50
	 ERN4D7D3AuPU28MPlZODqrjL0t2GY7QOgmUDf+JCXZrBPYVFdtsQCiwh5ignWrxSx+
	 ftWCkv3q1DUxdHEkzSLa2MxJwfRTLf4OtTsC/YcqGycQBsJO9+7jtNbbLW2ip8BqEK
	 OzBUyvuZZlcdg==
Message-ID: <3fcb760c101c5f7081235290362f5c02.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230605-ep93xx-v3-3-3d63a5f1103e@maquefel.me>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-3-3d63a5f1103e@maquefel.me>
Subject: Re: [PATCH v3 03/42] clk: ep93xx: add DT support for Cirrus EP93xx
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-ide@vger.kernel.org, linux-input@vger.kernel.org,
 alsa-devel@alsa-project.org
To: Alessandro Zummo <a.zummo@towertech.it>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>,
 Damien Le Moal <dlemoal@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 David S. Miller <davem@davemloft.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Guenter Roeck <linux@roeck-us.net>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Jakub Kicinski <kuba@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Kris Bahnsen <kris@embeddedTS.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lennert Buytenhek <kernel@wantstofly.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Lukasz Majewski <lukma@denx.de>,
 Mark Brown <broonie@kernel.org>, Michael Peters <mpeters@embeddedTS.com>,
 Michael Turquette <mturquette@baylibr
 e.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>,
 Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>,
 Olof Johansson <olof@lixom.net>, Paolo Abeni <pabeni@redhat.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Sebastian Reichel <sre@kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, soc@kernel.org
Date: Thu, 20 Jul 2023 16:27:45 -0700
User-Agent: alot/0.10
X-MailFrom: sboyd@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: 4JEGJKMUI7BASJTE3TG76SIVKGF5CQQJ
X-Message-ID-Hash: 4JEGJKMUI7BASJTE3TG76SIVKGF5CQQJ
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:54:07 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4JEGJKMUI7BASJTE3TG76SIVKGF5CQQJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Quoting Nikita Shubin via B4 Relay (2023-07-20 04:29:03)
> diff --git a/drivers/clk/clk-ep93xx.c b/drivers/clk/clk-ep93xx.c
> new file mode 100644
> index 000000000000..7b9b3a0894ab
> --- /dev/null
> +++ b/drivers/clk/clk-ep93xx.c
> @@ -0,0 +1,764 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Clock control for Cirrus EP93xx chips.
> + * Copyright (C) 2021 Nikita Shubin <nikita.shubin@maquefel.me>
> + *
> + * Based on a rewrite of arch/arm/mach-ep93xx/clock.c:
> + * Copyright (C) 2006 Lennert Buytenhek <buytenh@wantstofly.org>
> + */
> +#define pr_fmt(fmt) "ep93xx " KBUILD_MODNAME ": " fmt
> +
> +#include <linux/bits.h>
> +#include <linux/clk-provider.h>
> +#include <linux/clk.h>
> +#include <linux/clkdev.h>

Drop the unused includes.

> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/spinlock.h>
> +#include <linux/string.h>
> +#include <linux/sys_soc.h>
> +
> +#include <linux/soc/cirrus/ep93xx.h>
> +#include <dt-bindings/clock/cirrus,ep93xx-clock.h>
> +
> +#include <asm/div64.h>
> +
> +#define EP93XX_EXT_RTC_RATE            32768
> +
> +#define EP93XX_SYSCON_POWER_STATE      0x00
> +#define EP93XX_SYSCON_PWRCNT           0x04
> +#define EP93XX_SYSCON_PWRCNT_UARTBAUD  BIT(29)
> +#define EP93XX_SYSCON_PWRCNT_USH_EN    28
> +#define EP93XX_SYSCON_PWRCNT_DMA_M2M1  27
> +#define EP93XX_SYSCON_PWRCNT_DMA_M2M0  26
> +#define EP93XX_SYSCON_PWRCNT_DMA_M2P8  25
> +#define EP93XX_SYSCON_PWRCNT_DMA_M2P9  24
> +#define EP93XX_SYSCON_PWRCNT_DMA_M2P6  23
> +#define EP93XX_SYSCON_PWRCNT_DMA_M2P7  22
> +#define EP93XX_SYSCON_PWRCNT_DMA_M2P4  21
> +#define EP93XX_SYSCON_PWRCNT_DMA_M2P5  20
> +#define EP93XX_SYSCON_PWRCNT_DMA_M2P2  19
> +#define EP93XX_SYSCON_PWRCNT_DMA_M2P3  18
> +#define EP93XX_SYSCON_PWRCNT_DMA_M2P0  17
> +#define EP93XX_SYSCON_PWRCNT_DMA_M2P1  16
> +#define EP93XX_SYSCON_DEVCFG           0x80
> +#define EP93XX_SYSCON_DEVCFG_U3EN      24
> +#define EP93XX_SYSCON_DEVCFG_U2EN      20
> +#define EP93XX_SYSCON_DEVCFG_U1EN      18
> +#define EP93XX_SYSCON_VIDCLKDIV                0x84
> +#define EP93XX_SYSCON_CLKDIV_ENABLE    15
> +#define EP93XX_SYSCON_CLKDIV_ESEL      BIT(14)
> +#define EP93XX_SYSCON_CLKDIV_PSEL      BIT(13)
> +#define EP93XX_SYSCON_CLKDIV_MASK      GENMASK(14, 13)
> +#define EP93XX_SYSCON_CLKDIV_PDIV_SHIFT        8
> +#define EP93XX_SYSCON_I2SCLKDIV                0x8c
> +#define EP93XX_SYSCON_I2SCLKDIV_SENA   31
> +#define EP93XX_SYSCON_I2SCLKDIV_ORIDE  BIT(29)
> +#define EP93XX_SYSCON_I2SCLKDIV_SPOL   BIT(19)
> +#define EP93XX_I2SCLKDIV_SDIV          (1 << 16)
> +#define EP93XX_I2SCLKDIV_LRDIV32       (0 << 17)
> +#define EP93XX_I2SCLKDIV_LRDIV64       (1 << 17)
> +#define EP93XX_I2SCLKDIV_LRDIV128      (2 << 17)
> +#define EP93XX_I2SCLKDIV_LRDIV_MASK    (3 << 17)
> +#define EP93XX_SYSCON_KEYTCHCLKDIV     0x90
> +#define EP93XX_SYSCON_KEYTCHCLKDIV_TSEN        31
> +#define EP93XX_SYSCON_KEYTCHCLKDIV_ADIV        16
> +#define EP93XX_SYSCON_KEYTCHCLKDIV_KEN 15
> +#define EP93XX_SYSCON_KEYTCHCLKDIV_KDIV        0
> +#define EP93XX_SYSCON_CHIPID           0x94
> +#define EP93XX_SYSCON_CHIPID_ID                0x9213
> +
> +/* Keeps track of all clocks */
> +static const char adc_divisors[] =3D { 16, 4 };
> +static const char sclk_divisors[] =3D { 2, 4 };
> +static const char lrclk_divisors[] =3D { 32, 64, 128 };
> +
> +#define EP_PARENT(NAME) { .name =3D NAME, .fw_name =3D NAME }
> +
> +static const struct clk_parent_data ep93xx_clk_parents[] =3D {
> +       EP_PARENT("xtali"),
> +       EP_PARENT("pll1"),
> +       EP_PARENT("pll2"),

pll2 and pll1 aren't in the DT binding, so they shouldn't be set for
.fw_name here.

> +};
> +
> +struct ep93xx_clk {
> +       struct clk_hw hw;
> +       u16 idx;
> +       u16 reg;
> +       u32 mask;
> +       u8 bit_idx;
> +       u8 shift;
> +       u8 width;
> +       u8 num_div;
> +       const char *div;
> +};
> +
> +struct ep93xx_clk_priv {
> +       spinlock_t lock;
> +       struct device *dev;
> +       void __iomem *base;
> +       struct regmap *map;
> +       struct clk_hw *fixed[16];
> +       struct ep93xx_clk reg[];
> +};
> +
> +static struct ep93xx_clk *ep93xx_clk_from(struct clk_hw *hw)
> +{
> +       return container_of(hw, struct ep93xx_clk, hw);
> +}
> +
> +static struct ep93xx_clk_priv *ep93xx_priv_from(struct ep93xx_clk *clk)
> +{
> +       return container_of(clk, struct ep93xx_clk_priv, reg[clk->idx]);
> +}
> +
> +static int ep93xx_clk_is_enabled(struct clk_hw *hw)
> +{
> +       struct ep93xx_clk *clk =3D ep93xx_clk_from(hw);
> +       struct ep93xx_clk_priv *priv =3D ep93xx_priv_from(clk);
> +       u32 val;
> +
> +       regmap_read(priv->map, clk->reg, &val);
> +
> +       return !!(val & BIT(clk->bit_idx));
> +}
> +
> +static int ep93xx_clk_enable(struct clk_hw *hw)
> +{
> +       struct ep93xx_clk *clk =3D ep93xx_clk_from(hw);
> +       struct ep93xx_clk_priv *priv =3D ep93xx_priv_from(clk);
> +       unsigned long flags;
> +       u32 val;
> +
> +       spin_lock_irqsave(&priv->lock, flags);
> +
> +       regmap_read(priv->map, clk->reg, &val);
> +       val |=3D BIT(clk->bit_idx);
> +
> +       ep93xx_syscon_swlocked_write(priv->map, clk->reg, val);
> +
> +       spin_unlock_irqrestore(&priv->lock, flags);
> +
> +       return 0;
> +}
> +
> +static void ep93xx_clk_disable(struct clk_hw *hw)
> +{
> +       struct ep93xx_clk *clk =3D ep93xx_clk_from(hw);
> +       struct ep93xx_clk_priv *priv =3D ep93xx_priv_from(clk);
> +       unsigned long flags;
> +       u32 val;
> +
> +       spin_lock_irqsave(&priv->lock, flags);
> +
> +       regmap_read(priv->map, clk->reg, &val);
> +       val &=3D ~BIT(clk->bit_idx);
> +
> +       ep93xx_syscon_swlocked_write(priv->map, clk->reg, val);
> +
> +       spin_unlock_irqrestore(&priv->lock, flags);
> +}
> +
> +static const struct clk_ops clk_ep93xx_gate_ops =3D {
> +       .enable =3D ep93xx_clk_enable,
> +       .disable =3D ep93xx_clk_disable,
> +       .is_enabled =3D ep93xx_clk_is_enabled,
> +};
> +
> +static int ep93xx_clk_register_gate(struct ep93xx_clk *clk,
> +                                       const char *name,
> +                                       const char *parent_name,
> +                                       unsigned long flags,
> +                                       unsigned int reg,
> +                                       u8 bit_idx)
> +{
> +       struct ep93xx_clk_priv *priv =3D ep93xx_priv_from(clk);
> +       struct clk_parent_data parent_data =3D { };
> +       struct clk_init_data init =3D { };
> +
> +       init.name =3D name;
> +       init.ops =3D &clk_ep93xx_gate_ops;
> +       init.flags =3D flags;
> +
> +       parent_data.fw_name =3D parent_name;
> +       parent_data.name =3D parent_name;
> +       init.parent_data =3D &parent_data;
> +       init.num_parents =3D 1;
> +
> +       clk->reg =3D reg;
> +       clk->bit_idx =3D bit_idx;
> +       clk->hw.init =3D &init;
> +
> +       return devm_clk_hw_register(priv->dev, &clk->hw);
> +}
> +
> +static u8 ep93xx_mux_get_parent(struct clk_hw *hw)
> +{
> +       struct ep93xx_clk *clk =3D ep93xx_clk_from(hw);
> +       struct ep93xx_clk_priv *priv =3D ep93xx_priv_from(clk);
> +       u32 val;
> +
> +       regmap_read(priv->map, clk->reg, &val);
> +
> +       val &=3D EP93XX_SYSCON_CLKDIV_MASK;
> +
> +       switch (val) {
> +       case EP93XX_SYSCON_CLKDIV_ESEL:
> +               return 1; // PLL1
> +       case EP93XX_SYSCON_CLKDIV_MASK:
> +               return 2; // PLL2
> +       default:
> +               break;
> +       };
> +
> +       return 0; // XTALI

Please use /* comments like this */

> +}
> +
> +static int ep93xx_mux_set_parent_lock(struct clk_hw *hw, u8 index)
> +{
> +       struct ep93xx_clk *clk =3D ep93xx_clk_from(hw);
> +       struct ep93xx_clk_priv *priv =3D ep93xx_priv_from(clk);
> +       unsigned long flags;
> +       u32 val;
> +
> +       if (index >=3D ARRAY_SIZE(ep93xx_clk_parents))
> +               return -EINVAL;
> +
> +       spin_lock_irqsave(&priv->lock, flags);
> +
> +       regmap_read(priv->map, clk->reg, &val);
> +       val &=3D ~(EP93XX_SYSCON_CLKDIV_MASK);
> +       if (index) {
> +               val |=3D EP93XX_SYSCON_CLKDIV_ESEL;
> +               val |=3D (index - 1) ? EP93XX_SYSCON_CLKDIV_PSEL : 0;
> +       }
> +
> +       ep93xx_syscon_swlocked_write(priv->map, clk->reg, val);
> +
> +       spin_unlock_irqrestore(&priv->lock, flags);
> +
> +       return 0;
> +}
> +
> +static bool is_best(unsigned long rate, unsigned long now,
> +                    unsigned long best)
> +{
> +       return abs(rate - now) < abs(rate - best);

Another case where we need abs_diff() so that it doesn't get confused
when trying to do signed comparison.

> +}
> +
> +static int ep93xx_mux_determine_rate(struct clk_hw *hw,
> +                               struct clk_rate_request *req)
> +{
> +       unsigned long best_rate =3D 0, actual_rate, mclk_rate;
> +       unsigned long rate =3D req->rate;
> +       struct clk_hw *parent_best =3D NULL;
> +       unsigned long parent_rate_best;
> +       unsigned long parent_rate;
> +       int div, pdiv;
> +       unsigned int i;
> +
> +       /*
> +        * Try the two pll's and the external clock
> +        * Because the valid predividers are 2, 2.5 and 3, we multiply
> +        * all the clocks by 2 to avoid floating point math.
> +        *
> +        * This is based on the algorithm in the ep93xx raster guide:
> +        * http://be-a-maverick.com/en/pubs/appNote/AN269REV1.pdf
> +        *
> +        */
> +       for (i =3D 0; i < clk_hw_get_num_parents(hw); i++) {
> +               struct clk_hw *parent =3D clk_hw_get_parent_by_index(hw, =
i);
> +
> +               parent_rate =3D clk_hw_get_rate(parent);
> +               mclk_rate =3D parent_rate * 2;
> +
> +               /* Try each predivider value */
> +               for (pdiv =3D 4; pdiv <=3D 6; pdiv++) {
> +                       div =3D DIV_ROUND_CLOSEST(mclk_rate, rate * pdiv);
> +                       if (div < 1 || div > 127)
> +                               continue;
> +
> +                       actual_rate =3D DIV_ROUND_CLOSEST(mclk_rate, pdiv=
 * div);
> +                       if (is_best(rate, actual_rate, best_rate)) {
> +                               best_rate =3D actual_rate;
> +                               parent_rate_best =3D parent_rate;
> +                               parent_best =3D parent;
> +                       }
> +               }
> +       }
> +
> +       if (!parent_best)
> +               return -EINVAL;
> +
> +       req->best_parent_rate =3D parent_rate_best;
> +       req->best_parent_hw =3D parent_best;
> +       req->rate =3D best_rate;
> +
> +       return 0;
> +}
> +
> +static unsigned long ep93xx_ddiv_recalc_rate(struct clk_hw *hw,
> +                                               unsigned long parent_rate)
> +{
> +       struct ep93xx_clk *clk =3D ep93xx_clk_from(hw);
> +       struct ep93xx_clk_priv *priv =3D ep93xx_priv_from(clk);
> +       unsigned int pdiv, div;
> +       u32 val;
> +
> +       regmap_read(priv->map, clk->reg, &val);
> +       pdiv =3D ((val >> EP93XX_SYSCON_CLKDIV_PDIV_SHIFT) & 0x03);
> +       div =3D val & GENMASK(6, 0);
> +       if (!div)
> +               return 0;
> +
> +       return DIV_ROUND_CLOSEST(parent_rate * 2, (pdiv + 3) * div);
> +}
> +
> +static int ep93xx_ddiv_set_rate(struct clk_hw *hw, unsigned long rate,
> +                               unsigned long parent_rate)
> +{
> +       struct ep93xx_clk *clk =3D ep93xx_clk_from(hw);
> +       struct ep93xx_clk_priv *priv =3D ep93xx_priv_from(clk);
> +       int pdiv, div, npdiv, ndiv;
> +       unsigned long actual_rate, mclk_rate, rate_err =3D ULONG_MAX;
> +       u32 val;
> +
> +       regmap_read(priv->map, clk->reg, &val);
> +       mclk_rate =3D parent_rate * 2;
> +
> +       for (pdiv =3D 4; pdiv <=3D 6; pdiv++) {
> +               div =3D DIV_ROUND_CLOSEST(mclk_rate, rate * pdiv);
> +               if (div < 1 || div > 127)
> +                       continue;
> +
> +               actual_rate =3D DIV_ROUND_CLOSEST(mclk_rate, pdiv * div);
> +               if (abs(actual_rate - rate) < rate_err) {
> +                       npdiv =3D pdiv - 3;
> +                       ndiv =3D div;
> +                       rate_err =3D abs(actual_rate - rate);
> +               }
> +       }
> +
> +       if (rate_err =3D=3D ULONG_MAX)
> +               return -EINVAL;
> +
> +       /* Clear old dividers */
> +       val &=3D ~(GENMASK(9, 0) & ~BIT(7));
> +
> +       /* Set the new pdiv and div bits for the new clock rate */
> +       val |=3D (npdiv << EP93XX_SYSCON_CLKDIV_PDIV_SHIFT) | ndiv;
> +
> +       ep93xx_syscon_swlocked_write(priv->map, clk->reg, val);
> +
> +       return 0;
> +}
> +
> +static const struct clk_ops clk_ddiv_ops =3D {
> +       .enable =3D ep93xx_clk_enable,
> +       .disable =3D ep93xx_clk_disable,
> +       .is_enabled =3D ep93xx_clk_is_enabled,
> +       .get_parent =3D ep93xx_mux_get_parent,
> +       .set_parent =3D ep93xx_mux_set_parent_lock,
> +       .determine_rate =3D ep93xx_mux_determine_rate,
> +       .recalc_rate =3D ep93xx_ddiv_recalc_rate,
> +       .set_rate =3D ep93xx_ddiv_set_rate,
> +};
> +
> +static int clk_hw_register_ddiv(struct ep93xx_clk *clk,
> +                                               const char *name,
> +                                               unsigned int reg,
> +                                               u8 bit_idx)
> +{
> +       struct ep93xx_clk_priv *priv =3D ep93xx_priv_from(clk);
> +       struct clk_init_data init =3D { };
> +
> +       init.name =3D name;
> +       init.ops =3D &clk_ddiv_ops;
> +       init.flags =3D 0;
> +       init.parent_data =3D ep93xx_clk_parents;
> +       init.num_parents =3D ARRAY_SIZE(ep93xx_clk_parents);
> +
> +       clk->reg =3D reg;
> +       clk->bit_idx =3D bit_idx;
> +       clk->hw.init =3D &init;
> +
> +       return devm_clk_hw_register(priv->dev, &clk->hw);
> +}
> +
> +static unsigned long ep93xx_div_recalc_rate(struct clk_hw *hw,
> +                                           unsigned long parent_rate)
> +{
> +       struct ep93xx_clk *clk =3D ep93xx_clk_from(hw);
> +       struct ep93xx_clk_priv *priv =3D ep93xx_priv_from(clk);
> +       u32 val;
> +       u8 index;
> +
> +       regmap_read(priv->map, clk->reg, &val);
> +       index =3D (val & clk->mask) >> clk->shift;
> +       if (index > clk->num_div)
> +               return 0;
> +
> +       return DIV_ROUND_CLOSEST(parent_rate, clk->div[index]);
> +}
> +
> +static long ep93xx_div_round_rate(struct clk_hw *hw, unsigned long rate,
> +                                  unsigned long *parent_rate)
> +{
> +       struct ep93xx_clk *clk =3D ep93xx_clk_from(hw);
> +       unsigned long best =3D 0, now;
> +       unsigned int i;
> +
> +       for (i =3D 0; i < clk->num_div; i++) {
> +               if ((rate * clk->div[i]) =3D=3D *parent_rate)
> +                       return rate;
> +
> +               now =3D DIV_ROUND_CLOSEST(*parent_rate, clk->div[i]);
> +               if (!best || is_best(rate, now, best))
> +                       best =3D now;
> +       }
> +
> +       return best;
> +}
> +
> +static int ep93xx_div_set_rate(struct clk_hw *hw, unsigned long rate,
> +                              unsigned long parent_rate)
> +{
> +       struct ep93xx_clk *clk =3D ep93xx_clk_from(hw);
> +       struct ep93xx_clk_priv *priv =3D ep93xx_priv_from(clk);
> +       unsigned int i;
> +       u32 val;
> +
> +       regmap_read(priv->map, clk->reg, &val);
> +       val &=3D ~clk->mask;
> +       for (i =3D 0; i < clk->num_div; i++)
> +               if (rate =3D=3D DIV_ROUND_CLOSEST(parent_rate, clk->div[i=
])) {
> +                       val |=3D i << clk->shift;
> +                       break;
> +               }
> +
> +       if (i =3D=3D clk->num_div)
> +               return -EINVAL;
> +
> +       ep93xx_syscon_swlocked_write(priv->map, clk->reg, val);
> +
> +       return 0;
> +}
> +
> +static const struct clk_ops ep93xx_div_ops =3D {
> +       .enable =3D ep93xx_clk_enable,
> +       .disable =3D ep93xx_clk_disable,
> +       .is_enabled =3D ep93xx_clk_is_enabled,
> +       .recalc_rate =3D ep93xx_div_recalc_rate,
> +       .round_rate =3D ep93xx_div_round_rate,
> +       .set_rate =3D ep93xx_div_set_rate,
> +};
> +
> +static int clk_hw_register_div(struct ep93xx_clk *clk,
> +                                         const char *name,
> +                                         const char *parent_name,

Please try to pass a direct pointer to the parent clk_hw instead or if
the clk exists outside the controller pass a DT index.

> +                                         unsigned int reg,
> +                                         u8 enable_bit,
> +                                         u8 shift,
> +                                         u8 width,
> +                                         const char *clk_divisors,
> +                                         u8 num_div)
> +{
> +       struct ep93xx_clk_priv *priv =3D ep93xx_priv_from(clk);
> +       struct clk_parent_data parent_data =3D { };
> +       struct clk_init_data init =3D { };
> +
> +       init.name =3D name;
> +       init.ops =3D &ep93xx_div_ops;
> +       init.flags =3D 0;
> +       parent_data.fw_name =3D parent_name;
> +       parent_data.name =3D parent_name;
> +       init.parent_data =3D &parent_data;
> +       init.num_parents =3D 1;
> +
> +       clk->reg =3D reg;
> +       clk->bit_idx =3D enable_bit;
> +       clk->mask =3D GENMASK(shift + width - 1, shift);
> +       clk->shift =3D shift;
> +       clk->div =3D clk_divisors;
[...]
> +
> +static int ep93xx_clk_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct device_node *np =3D dev->of_node;
> +       const struct soc_device_attribute *match;
> +       struct ep93xx_clk_priv *priv;
> +       struct ep93xx_clk *clk;
> +       struct device_node *parent;
> +       unsigned long clk_spi_div;
> +       int ret;
> +       u32 value;
> +
> +       priv =3D devm_kzalloc(dev, struct_size(priv, reg, EP93XX_CLK_UART=
), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       spin_lock_init(&priv->lock);
> +       priv->dev =3D dev;
> +       parent =3D of_get_parent(np);
> +       if (!parent)
> +               return dev_err_probe(dev, -EINVAL, "no syscon parent for =
clk node\n");
> +
> +       priv->map =3D syscon_node_to_regmap(parent);
> +       if (IS_ERR(priv->map)) {
> +               of_node_put(parent);
> +               return dev_err_probe(dev, -EINVAL, "no syscon regmap\n");
> +       }
> +
> +       priv->base =3D devm_of_iomap(dev, parent, 0, NULL);
> +       of_node_put(parent);
> +       if (IS_ERR(priv->base))
> +               return PTR_ERR(priv->base);
> +
> +       ret =3D ep93xx_uart_clock_init(priv);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D ep93xx_dma_clock_init(priv);
> +       if (ret)
> +               return ret;
> +
> +       /*
> +        * EP93xx SSP clock rate was doubled in version E2. For more info=
rmation
> +        * see:
> +        *     http://www.cirrus.com/en/pubs/appNote/AN273REV4.pdf
> +        */
> +       clk_spi_div =3D 2;
> +       match =3D soc_device_match(ep93xx_soc_table);

Why isn't this part of the compatible string for the device? We're able
to introduce new bindings, correct?

> +       if (match)
> +               clk_spi_div =3D (unsigned long)match->data;
