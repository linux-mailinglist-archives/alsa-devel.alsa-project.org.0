Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF43475DDA3
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Jul 2023 19:10:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E05C7820;
	Sat, 22 Jul 2023 19:09:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E05C7820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690045840;
	bh=FbELastT7DYBDoPM/2fhHxsDjC2+qC8cktMffdxZ1tw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uZapJI67F6sJEYI8CrEHlYF7a1rUpsmcRjglteElbu8KaDzPim4FkShKYwfhT2DEj
	 phHPRpsd5/FC5cMbiOTzO787aMohIO8rjabjNY+ShvqTaOA9jIeUe1BvAUfSGBjKZG
	 pdS9s4tey3DtUqfSmQ7WKMqw0zMNW0/5IqamDLfo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAED0F80617; Sat, 22 Jul 2023 19:06:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C015F80609;
	Sat, 22 Jul 2023 19:06:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E03CF8047D; Fri, 21 Jul 2023 17:31:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C54CF800D2
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 17:30:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C54CF800D2
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="397941535"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200";
   d="scan'208";a="397941535"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 08:30:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="898741295"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200";
   d="scan'208";a="898741295"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 21 Jul 2023 08:30:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1qMs5C-00AR8R-2V;
	Fri, 21 Jul 2023 18:30:18 +0300
Date: Fri, 21 Jul 2023 18:30:18 +0300
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
Subject: Re: [PATCH v3 05/42] pinctrl: add a Cirrus ep93xx SoC pin controller
Message-ID: <ZLqkiqUSgohVLnbo@smile.fi.intel.com>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-5-3d63a5f1103e@maquefel.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605-ep93xx-v3-5-3d63a5f1103e@maquefel.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-MailFrom: andy@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YRVZSLZGO3U4GLHYWORGX53WI62F7CWD
X-Message-ID-Hash: YRVZSLZGO3U4GLHYWORGX53WI62F7CWD
X-Mailman-Approved-At: Sat, 22 Jul 2023 17:04:41 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YRVZSLZGO3U4GLHYWORGX53WI62F7CWD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 20, 2023 at 02:29:05PM +0300, Nikita Shubin via B4 Relay wrote:
> From: Nikita Shubin <nikita.shubin@maquefel.me>
> 
> This adds a pin control (only multiplexing) driver for ep93xx
> SoC so we can fully convert ep93xx to device tree.
> 
> This driver is capable of muxing ep9301/ep9302/ep9307/ep9312/ep9315
> variants, this is chosen based on "compatible" in device tree.

...

> +config PINCTRL_EP93XX
> +	bool
> +	depends on OF && (ARCH_EP93XX || COMPILE_TEST)

The OF seems to be functional dependency and not compile time one.
Thus

	depends on (OF && ARCH_EP93XX) || COMPILE_TEST

> +	select PINMUX
> +	select GENERIC_PINCONF
> +	select MFD_SYSCON

...

> +#define EP93XX_SYSCON_DEVCFG_D1ONG	BIT(30) /* not used */
> +#define EP93XX_SYSCON_DEVCFG_D0ONG	BIT(29) /* not used */
> +#define EP93XX_SYSCON_DEVCFG_IONU2	BIT(28) /* not used */
> +#define EP93XX_SYSCON_DEVCFG_GONK	BIT(27) /* done */
> +#define EP93XX_SYSCON_DEVCFG_TONG	BIT(26) /* not used */
> +#define EP93XX_SYSCON_DEVCFG_MONG	BIT(25) /* not used */
> +#define EP93XX_SYSCON_DEVCFG_A2ONG	BIT(22) /* not used */
> +#define EP93XX_SYSCON_DEVCFG_A1ONG	BIT(21) /* not used */
> +#define EP93XX_SYSCON_DEVCFG_HONIDE	BIT(11) /* done */
> +#define EP93XX_SYSCON_DEVCFG_GONIDE	BIT(10) /* done */
> +#define EP93XX_SYSCON_DEVCFG_PONG	BIT(9) /* done */
> +#define EP93XX_SYSCON_DEVCFG_EONIDE	BIT(8) /* done */
> +#define EP93XX_SYSCON_DEVCFG_I2SONSSP	BIT(7) /* done */
> +#define EP93XX_SYSCON_DEVCFG_I2SONAC97	BIT(6) /* done */
> +#define EP93XX_SYSCON_DEVCFG_RASONP3	BIT(4) /* done */

> +#define PADS_MASK		(GENMASK(30, 25) | BIT(22) | BIT(21) | GENMASK(11, 6) | BIT(4))

Seems better to spell each bit as by definition given above.

...

> +/* Ordered by bit index */
> +static const char * const ep93xx_padgroups[] = {
> +	NULL, NULL, NULL, NULL,
> +	"RasOnP3",
> +	NULL,
> +	"I2SonAC97",
> +	"I2SonSSP",
> +	"EonIDE",
> +	"PonG",
> +	"GonIDE",
> +	"HonIDE",
> +	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
> +	"A1onG",
> +	"A2onG",
> +	NULL, NULL,
> +	"MonG",
> +	"TonG",
> +	"GonK",
> +	"IonU2",
> +	"D0onG",
> +	"D1onG",

Instead of tons of NULLs, use

	[NN] = "...",

which is much less error prone.

> +};

...

> +/** ep9301, ep9302*/

Is it really kernel doc (besides missing space)?
Please, run

	scripts/kernel-doc -v -Wall -none $YOUR_FILE

for each file you contributed in the entire series and fix all warnings.

...

> +static const char *ep93xx_get_group_name(struct pinctrl_dev *pctldev,
> +					 unsigned int selector)
> +{
> +	struct ep93xx_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
> +
> +	switch (pmx->model) {
> +	case EP93XX_9301_PINCTRL:
> +		return ep9301_pin_groups[selector].grp.name;
> +	case EP93XX_9307_PINCTRL:
> +		return ep9307_pin_groups[selector].grp.name;
> +	case EP93XX_9312_PINCTRL:
> +		return ep9312_pin_groups[selector].grp.name;
> +	}

> +	return NULL;

Use default case instead.

> +}

...

> +	/* Which bits changed */
> +	before &= PADS_MASK;
> +	after &= PADS_MASK;
> +	expected = before & ~grp->mask;
> +	expected |= grp->value;
> +	expected &= PADS_MASK;

Instead of above:

	expected = (before & ~grp->mask) | grp->value;

> +	/* Print changed states */
> +	tmp = expected ^ after;

	tmp = (expected ^ after) & PADS_MASK;

> +	for_each_set_bit(i, &tmp, PADS_MAXBIT) {
> +		bool enabled = expected & BIT(i);
> +
> +		dev_err(pmx->dev,
> +			    "pin group %s could not be %s: probably a hardware limitation\n",
> +			    ep93xx_padgroups[i], str_enabled_disabled(enabled));

Wrong indentation.

> +		dev_err(pmx->dev,
> +				"DeviceCfg before: %08x, after %08x, expected %08x\n",
> +				before, after, expected);

Wrong indentation.

I believe this one can go to debug level.

> +	}

...

> +	pmx->model = (int)of_device_get_match_data(dev);

(uintptr_t) is more appropriate here.

...

> +	pmx->pctl = devm_pinctrl_register(dev, &ep93xx_pmx_desc, pmx);
> +	if (IS_ERR(pmx->pctl)) {
> +		dev_err(dev, "could not register pinmux driver\n");
> +		return PTR_ERR(pmx->pctl);

Why not dev_err_probe() as elsewhere?

> +	}

...

> +static int __init ep93xx_pmx_init(void)
> +{
> +	return platform_driver_register(&ep93xx_pmx_driver);
> +}
> +arch_initcall(ep93xx_pmx_init);

+ blank line.

Also add everywhere MODULE_DESCRIPTION() as modpost recently started to
complain (probably with `make W=1` which you should execute anyway for
your new code).

> +MODULE_IMPORT_NS(EP93XX_SOC);

-- 
With Best Regards,
Andy Shevchenko


