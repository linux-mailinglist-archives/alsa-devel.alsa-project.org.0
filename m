Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3334D75DD9D
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Jul 2023 19:09:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F2057F4;
	Sat, 22 Jul 2023 19:08:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F2057F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690045751;
	bh=/iMSVKYkBkB+JbZl6yxK9lRoBKdI00tXKXCd54Dp+LQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iNALlPNsQTFu2CYxxwpc9tN77y1aeHLBzkoQV+QCW5OqqZ71FwTImHZNjDsS16pnA
	 aTTjkzb/NeEBgnCdu07aTTa8yiZYI7mJg60pvsuMuXwZ045sXy9fjwlqfoqxlTFIK9
	 gqd7uO6SgK/MFkm6CYWcgI7xJip0ARzXKIVytQM8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48F41F805DA; Sat, 22 Jul 2023 19:05:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10B8BF805D8;
	Sat, 22 Jul 2023 19:05:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACD99F8047D; Fri, 21 Jul 2023 16:14:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B9D5F8027B
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 16:14:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B9D5F8027B
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="351909960"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200";
   d="scan'208";a="351909960"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 07:14:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="794968734"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200";
   d="scan'208";a="794968734"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jul 2023 07:13:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1qMqtH-007oK8-1x;
	Fri, 21 Jul 2023 17:13:55 +0300
Date: Fri, 21 Jul 2023 17:13:55 +0300
From: Andy Shevchenko <andy@kernel.org>
To: nikita.shubin@maquefel.me
Cc: Hartley Sweeten <hsweeten@visionengravers.com>,
	Lennert Buytenhek <kernel@wantstofly.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Lukasz Majewski <lukma@denx.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Sebastian Reichel <sre@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Mark Brown <broonie@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	soc@kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Michael Peters <mpeters@embeddedts.com>,
	Kris Bahnsen <kris@embeddedts.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
	netdev@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
	linux-input@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 07/42] soc: Add SoC driver for Cirrus ep93xx
Message-ID: <ZLqSo6B5cJXVRJS/@smile.fi.intel.com>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-7-3d63a5f1103e@maquefel.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605-ep93xx-v3-7-3d63a5f1103e@maquefel.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-MailFrom: andy@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QQ3WZU4MYCWZ4YDQTD53K3I3EC6GV4OS
X-Message-ID-Hash: QQ3WZU4MYCWZ4YDQTD53K3I3EC6GV4OS
X-Mailman-Approved-At: Sat, 22 Jul 2023 17:03:52 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QQ3WZU4MYCWZ4YDQTD53K3I3EC6GV4OS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 20, 2023 at 02:29:07PM +0300, Nikita Shubin via B4 Relay wrote:
> From: Nikita Shubin <nikita.shubin@maquefel.me>
> 
> This adds an SoC driver for the ep93xx. Currently there
> is only one thing not fitting into any other framework,
> and that is the swlock setting.
> 
> It's used for clock settings and restart.

> +#include <linux/clk-provider.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/sys_soc.h>
> +#include <linux/soc/cirrus/ep93xx.h>

...

> +#define EP93XX_SYSCON_SYSCFG_REV_MASK	0xf0000000

GENMASK() (you will need bits.h, and looking below you seem missed it anyway)

...

> +	spin_lock_irqsave(&ep93xx_swlock, flags);
> +
> +	regmap_read(map, EP93XX_SYSCON_DEVCFG, &val);
> +	val &= ~clear_bits;
> +	val |= set_bits;
> +	regmap_write(map, EP93XX_SYSCON_SWLOCK, EP93XX_SWLOCK_MAGICK);
> +	regmap_write(map, EP93XX_SYSCON_DEVCFG, val);

Is this sequence a must?
I.o.w. can you first supply magic and then update devcfg?

> +	spin_unlock_irqrestore(&ep93xx_swlock, flags);

...

> +void ep93xx_swlocked_update_bits(struct regmap *map, unsigned int reg,
> +				 unsigned int mask, unsigned int val)
> +{

Same Q as above.

> +}

...

> +	int rev = ep93xx_chip_revision(map);
> +
> +	switch (rev) {

	switch(ep93xx_chip_revision(map))

?

> +	case EP93XX_CHIP_REV_D0:
> +		return "D0";
> +	case EP93XX_CHIP_REV_D1:
> +		return "D1";
> +	case EP93XX_CHIP_REV_E0:
> +		return "E0";
> +	case EP93XX_CHIP_REV_E1:
> +		return "E1";
> +	case EP93XX_CHIP_REV_E2:
> +		return "E2";
> +	default:
> +		return "unknown";
> +	}

...

> +static unsigned long __init calc_pll_rate(u64 rate, u32 config_word)
> +{
> +	rate *= ((config_word >> 11) & GENMASK(4, 0)) + 1;	/* X1FBD */
> +	rate *= ((config_word >> 5) & GENMASK(5, 0)) + 1;	/* X2FBD */
> +	do_div(rate, (config_word & GENMASK(4, 0)) + 1);	/* X2IPD */
> +	rate >>= ((config_word >> 16) & 3);			/* PS */

GENMASK()

> +	return rate;
> +}

...

> +	/* Multiplatform guard, only proceed on ep93xx */
> +	if (!of_machine_is_compatible("cirrus,ep9301"))
> +		return 0;

Why?

> +	map = syscon_regmap_lookup_by_compatible("cirrus,ep9301-syscon");
> +	if (IS_ERR(map))
> +		return PTR_ERR(map);

Is this not enough?

...

> +	if (!(value & EP93XX_SYSCON_CLKSET1_NBYP1))
> +		clk_pll1_rate = EP93XX_EXT_CLK_RATE;
> +	else
> +		clk_pll1_rate = calc_pll_rate(EP93XX_EXT_CLK_RATE, value);

Positive conditionals in if-else are easier to be read.

...

> +	clk_f_div = fclk_divisors[(value >> 25) & 0x7];
> +	clk_h_div = hclk_divisors[(value >> 20) & 0x7];
> +	clk_p_div = pclk_divisors[(value >> 18) & 0x3];

GENMASK() in all three?

...

> +	np = of_find_node_by_path("/");
> +	of_property_read_string(np, "model", &machine);
> +	if (machine)
> +		attrs->machine = kstrdup(machine, GFP_KERNEL);

No error check?

> +	of_node_put(np);

Looks like NIH of_flat_dt_get_machine_name(). Can you rather make use of it as
it's done, e.g., here arch/riscv/kernel/setup.c:251?

-- 
With Best Regards,
Andy Shevchenko


