Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D38EEF1998
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 16:10:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4364F1699;
	Wed,  6 Nov 2019 16:09:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4364F1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573053035;
	bh=l56INx9qtWZRNXf72Bp+C6AmkU80DWPDvqabFrwLPDY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E2dCyuGTTmhBVOvrgcqzEoaFWPWzjv1mR5hhUF1PI1POV5ZC5Szc8aVI6XPGYwIC+
	 ybWPQg5Flnc1ajAgo6YmlHQ2bx1oXS3+7GzRVfueqBdhkPrwo/VydG/wXLCd+OKhlf
	 2cBKSn5z2wvjLlz7wEgq9F0WOcctz2DfXTQpWj28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 849ECF803F4;
	Wed,  6 Nov 2019 16:08:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95212F803D0; Wed,  6 Nov 2019 15:22:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E318F800F3
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 15:22:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E318F800F3
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 06:22:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; d="scan'208";a="227938330"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by FMSMGA003.fm.intel.com with ESMTP; 06 Nov 2019 06:22:29 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1iSMCY-0004FN-Gs; Wed, 06 Nov 2019 16:22:26 +0200
Date: Wed, 6 Nov 2019 16:22:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Message-ID: <20191106142226.GB32742@smile.fi.intel.com>
References: <cover.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
 <42f40109e2926bca197b30fd9624c609653b23e5.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <42f40109e2926bca197b30fd9624c609653b23e5.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 06 Nov 2019 16:08:47 +0100
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-aspeed@lists.ozlabs.org, David Daney <david.daney@cavium.com>,
 Linus Walleij <linus.walleij@linaro.org>, alsa-devel@alsa-project.org,
 Peter Tyser <ptyser@xes-inc.com>, Thierry Reding <thierry.reding@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Marek Behun <marek.behun@nic.cz>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 bcm-kernel-feedback-list@broadcom.com, Joel Stanley <joel@jms.id.au>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Bamvor Jian Zhang <bamv2005@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-pwm@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, mazziesaccount@gmail.com,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 William Breathitt Gray <vilhelm.gray@gmail.com>, linux-gpio@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Scott Branden <sbranden@broadcom.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Andrew Jeffery <andrew@aj.id.au>, "Enrico Weigelt,
 metux IT consult" <info@metux.net>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Thorsten Scherer <t.scherer@eckelmann.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus.com,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [alsa-devel] [PATCH v2 2/2] gpio: Use new GPIO_LINE_DIRECTION
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Nov 06, 2019 at 10:54:12AM +0200, Matti Vaittinen wrote:
> It's hard for occasional GPIO code reader/writer to know if values 0/1
> equal to IN or OUT. Use defined GPIO_LINE_DIRECTION_IN and
> GPIO_LINE_DIRECTION_OUT to help them out.
> 
> NOTE - for gpio-amd-fch and gpio-bd9571mwv:
> This commit also changes the return value for direction get to equal 1
> for direction INPUT. Prior this commit these drivers might have
> returned some other positive value but 1 for INPUT.

>  drivers/gpio/gpio-ich.c             |  5 ++++-

>  drivers/gpio/gpio-merrifield.c      |  5 ++++-

>  drivers/gpio/gpio-pca953x.c         |  5 ++++-

>  drivers/gpio/gpio-sch.c             |  5 ++++-

>  drivers/gpio/gpio-wcove.c           |  7 +++++--

Since maintainers seems in favour of this and bloat-o-meter shows no difference
on selected module,

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

for the stuff I'm involved in.

Thanks!

> diff --git a/drivers/gpio/gpio-ich.c b/drivers/gpio/gpio-ich.c
> index 90bf7742f9b0..2f086d0aa1f4 100644
> --- a/drivers/gpio/gpio-ich.c
> +++ b/drivers/gpio/gpio-ich.c
> @@ -159,7 +159,10 @@ static bool ichx_gpio_check_available(struct gpio_chip *gpio, unsigned nr)
>  
>  static int ichx_gpio_get_direction(struct gpio_chip *gpio, unsigned nr)
>  {
> -	return ichx_read_bit(GPIO_IO_SEL, nr);
> +	if (ichx_read_bit(GPIO_IO_SEL, nr))
> +		return GPIO_LINE_DIRECTION_IN;
> +
> +	return GPIO_LINE_DIRECTION_OUT;
>  }
>  
>  static int ichx_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)

> diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
> index 2f1e9da81c1e..d4fa6e9560f3 100644
> --- a/drivers/gpio/gpio-merrifield.c
> +++ b/drivers/gpio/gpio-merrifield.c
> @@ -162,7 +162,10 @@ static int mrfld_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
>  {
>  	void __iomem *gpdr = gpio_reg(chip, offset, GPDR);
>  
> -	return !(readl(gpdr) & BIT(offset % 32));
> +	if (readl(gpdr) & BIT(offset % 32))
> +		return GPIO_LINE_DIRECTION_OUT;
> +
> +	return GPIO_LINE_DIRECTION_IN;
>  }
>  
>  static int mrfld_gpio_set_debounce(struct gpio_chip *chip, unsigned int offset,

> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index de5d1383f28d..82122c3c688a 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -449,7 +449,10 @@ static int pca953x_gpio_get_direction(struct gpio_chip *gc, unsigned off)
>  	if (ret < 0)
>  		return ret;
>  
> -	return !!(reg_val & bit);
> +	if (reg_val & bit)
> +		return GPIO_LINE_DIRECTION_IN;
> +
> +	return GPIO_LINE_DIRECTION_OUT;
>  }
>  
>  static void pca953x_gpio_set_multiple(struct gpio_chip *gc,

> diff --git a/drivers/gpio/gpio-sch.c b/drivers/gpio/gpio-sch.c
> index fb143f28c386..c65f35b68202 100644
> --- a/drivers/gpio/gpio-sch.c
> +++ b/drivers/gpio/gpio-sch.c
> @@ -127,7 +127,10 @@ static int sch_gpio_get_direction(struct gpio_chip *gc, unsigned gpio_num)
>  {
>  	struct sch_gpio *sch = gpiochip_get_data(gc);
>  
> -	return sch_gpio_reg_get(sch, gpio_num, GIO);
> +	if (sch_gpio_reg_get(sch, gpio_num, GIO))
> +		return GPIO_LINE_DIRECTION_IN;
> +
> +	return GPIO_LINE_DIRECTION_OUT;
>  }
>  
>  static const struct gpio_chip sch_gpio_chip = {

> diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
> index 444fe9e7f04a..8b481b3c1ebe 100644
> --- a/drivers/gpio/gpio-wcove.c
> +++ b/drivers/gpio/gpio-wcove.c
> @@ -170,13 +170,16 @@ static int wcove_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
>  	int ret, reg = to_reg(gpio, CTRL_OUT);
>  
>  	if (reg < 0)
> -		return 0;
> +		return GPIO_LINE_DIRECTION_OUT;
>  
>  	ret = regmap_read(wg->regmap, reg, &val);
>  	if (ret)
>  		return ret;
>  
> -	return !(val & CTLO_DIR_OUT);
> +	if (val & CTLO_DIR_OUT)
> +		return GPIO_LINE_DIRECTION_OUT;
> +
> +	return GPIO_LINE_DIRECTION_IN;
>  }
>  
>  static int wcove_gpio_get(struct gpio_chip *chip, unsigned int gpio)


-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
