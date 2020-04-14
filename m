Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC401A871D
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 19:11:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF01316A4;
	Tue, 14 Apr 2020 19:10:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF01316A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586884290;
	bh=tfWQMN3HWwcRMwkg858F6tGZ2l8oIZUsGOCV046rczo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TleoYP1R3knJeZy7XCDCZPL9WhJXXXpr/RCEO4KtW4aCo1SiwOSNvAxAuNBj1PzBc
	 IFwwwUgWSlfEGvAPHcU9eWq1rz4/oTnYFTBKumlweVwPVNvMpCXfwhaE0s3NfxjoK1
	 RxfnqvDQThgQSWGV+4+YVWncisv1bcpuXxPrvqME=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1811F8014E;
	Tue, 14 Apr 2020 19:09:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C1E4F8013D; Tue, 14 Apr 2020 19:09:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_76,SPF_HELO_PASS,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 141F3F800B9
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 19:09:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 141F3F800B9
IronPort-SDR: U7570wJi2TNi/CEz2O6bpWOvd9Y36/oy2nsuHYU9nhCa1FEgKB3oInum4u9HLsZwF/5YfEYNdf
 oW87EHgy/Fqg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 10:09:35 -0700
IronPort-SDR: 5AIfgOUvd8UvlvuCZCCAm90mtFkrEnCv8mUFyZEuBTYbD/KzyHNJlBJYVb4aqHbfD+tShrdJEX
 Rnnmkmh/38mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; d="scan'208";a="298761048"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Apr 2020 10:09:32 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jOP42-000ZiJ-Nw; Tue, 14 Apr 2020 20:09:34 +0300
Date: Tue, 14 Apr 2020 20:09:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 01/16] ASoC: pcm512x: expose 6 GPIOs
Message-ID: <20200414170934.GA34613@smile.fi.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409195841.18901-2-pierre-louis.bossart@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
 linux-gpio@vger.kernel.org, tiwai@suse.de,
 Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Daniel Matuschek <daniel@hifiberry.com>, Hui Wang <hui.wang@canonical.com>,
 Matthias Reichl <hias@horus.com>, broonie@kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
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

On Thu, Apr 09, 2020 at 02:58:26PM -0500, Pierre-Louis Bossart wrote:
> The GPIOs are used e.g. on HifiBerry DAC+ HATs to control the LED
> (GPIO3) and the choice of the 44.1 (GPIO6) or 48 (GPIO3) kHz
> oscillator (when present).
> 
> Enable basic gpio_chip to get/set values and get/set
> directions. Tested with GPIO_LIB from sys/class/gpio, the LED turns
> on/off as desired.


One question, can this use existing GPIO infrastructure, like bgpio_init()?
Ah, I see, that one operates over MMIO, while we would need something based on
regmap API.

Bartosz, do we have plans to have bgpio_regmap_init() or alike?

...

> +static int pcm512x_gpio_get_direction(struct gpio_chip *chip,
> +				      unsigned int offset)
> +{
> +	struct pcm512x_priv *pcm512x = gpiochip_get_data(chip);
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(pcm512x->regmap, PCM512x_GPIO_EN, &val);
> +	if (ret < 0)
> +		return ret;

> +	val = (val >> offset) & 1;
> +
> +	/* val is 0 for input, 1 for output, return inverted */
> +	return val ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;

This better to read as simple conditional, like

	if (val & BIT(offset))
		return ..._OUT;
	return ..._IN;

> +}

...

> +static int pcm512x_gpio_direction_output(struct gpio_chip *chip,
> +					 unsigned int offset,
> +					 int value)
> +{
> +	struct pcm512x_priv *pcm512x = gpiochip_get_data(chip);
> +	unsigned int reg;
> +	int ret;
> +
> +	/* select Register GPIOx output for OUTPUT_x (1..6) */
> +	reg = PCM512x_GPIO_OUTPUT_1 + offset;

> +	ret = regmap_update_bits(pcm512x->regmap, reg, 0x0f, 0x02);

Magic numbers detected.

> +	if (ret < 0)

Drop unnecessary ' < 0' parts where it makes sense, like here.

> +		return ret;
> +

> +	/* enable output x */

(1)

> +	ret = regmap_update_bits(pcm512x->regmap, PCM512x_GPIO_EN,
> +				 BIT(offset), BIT(offset));
> +	if (ret < 0)
> +		return ret;
> +
> +	/* set value */

(2)

With this (1)->(2) ordering it may be a glitch. So, first set value (if
hardware allows you, otherwise it seems like a broken one), and then switch
it to output.

> +	return regmap_update_bits(pcm512x->regmap, PCM512x_GPIO_CONTROL_1,
> +				  BIT(offset), value << offset);

You are using many times BIT(offset) mask above, perhaps
	int mask = BIT(offset);

Also, more robust is to use ternary here: 'value ? BIT(offset) : 0'.
Rationale: think what happen with value != 1 (theoretical possibility in the
future).

> +}

...

> +static int pcm512x_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{

> +	return (val >> offset) & 1;

Don't forget to use BIT() macro.

	return !!(val & BIT(offset));

> +}

...

> +static void pcm512x_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +			     int value)
> +{
> +	struct pcm512x_priv *pcm512x = gpiochip_get_data(chip);
> +	int ret;
> +
> +	ret = regmap_update_bits(pcm512x->regmap, PCM512x_GPIO_CONTROL_1,
> +				 BIT(offset), value << offset);

value ? BIT(offset) : 0

> +	if (ret < 0)

> +		pr_debug("%s: regmap_update_bits failed: %d\n", __func__, ret);

No __func__ in debug messages.
Use dev_dbg() when we have struct device available.

> +}

...

> +static const struct gpio_chip template_chip = {

Give better name, please. E.g. pcm512x_gpio_chip.

> +	.label			= "pcm512x-gpio",
> +	.names			= pcm512x_gpio_names,
> +	.owner			= THIS_MODULE,
> +	.get_direction		= pcm512x_gpio_get_direction,
> +	.direction_input	= pcm512x_gpio_direction_input,
> +	.direction_output	= pcm512x_gpio_direction_output,
> +	.get			= pcm512x_gpio_get,
> +	.set			= pcm512x_gpio_set,
> +	.base			= -1, /* let gpiolib select the base */
> +	.ngpio			= ARRAY_SIZE(pcm512x_gpio_names),
> +};

...

> +	/* expose 6 GPIO pins, numbered from 1 to 6 */
> +	pcm512x->chip = template_chip;
> +	pcm512x->chip.parent = dev;
> +
> +	ret = devm_gpiochip_add_data(dev, &pcm512x->chip, pcm512x);

> +	if (ret != 0) {

if (ret)

> +		dev_err(dev, "Failed to register gpio chip: %d\n", ret);
> +		goto err;
> +	}

-- 
With Best Regards,
Andy Shevchenko


