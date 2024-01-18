Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC5F831DF1
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jan 2024 17:57:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CE113E7;
	Thu, 18 Jan 2024 17:57:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CE113E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705597032;
	bh=YSyfdwR1IPYBXzTHw/MjQ4x/9dWs/nW2y8l13r8HVR4=;
	h=From:Date:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f4u7vjz2TotqvM7+bYbHNmNaZXOD0yYesUoFZYr7hQe5VtHKh/qtCw5no2Lyct8DX
	 nCAMYdELjsSNRqXA7Phr9SbQDiMGu17MdVBN/17PQYxjy/inZsZByZZc7o8dkqx4im
	 xsMt5tOdR84PoGrFSw997ttGyqzRFYLlCx16Y/1M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A455F80588; Thu, 18 Jan 2024 17:56:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8895DF8014B;
	Thu, 18 Jan 2024 17:56:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59F78F801F5; Thu, 18 Jan 2024 17:56:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi
 [62.142.5.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36642F80074
	for <alsa-devel@alsa-project.org>; Thu, 18 Jan 2024 17:56:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36642F80074
Received: from localhost (88-113-24-108.elisa-laajakaista.fi [88.113.24.108])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 827d83ef-b622-11ee-b3cf-005056bd6ce9;
	Thu, 18 Jan 2024 18:56:23 +0200 (EET)
From: andy.shevchenko@gmail.com
Date: Thu, 18 Jan 2024 18:56:22 +0200
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lee@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linus.walleij@linaro.org, vkoul@kernel.org, lgirdwood@gmail.com,
	yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/6] pinctrl: cs42l43: Add support for the cs42l43
Message-ID: <ZalYNhWSdf5onBpL@surfacebook.localdomain>
References: <20230804104602.395892-1-ckeepax@opensource.cirrus.com>
 <20230804104602.395892-5-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804104602.395892-5-ckeepax@opensource.cirrus.com>
Message-ID-Hash: 6TKKXWF3DL6R6FIYGXDKPT3YRXB65XFG
X-Message-ID-Hash: 6TKKXWF3DL6R6FIYGXDKPT3YRXB65XFG
X-MailFrom: andy.shevchenko@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6TKKXWF3DL6R6FIYGXDKPT3YRXB65XFG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fri, Aug 04, 2023 at 11:46:00AM +0100, Charles Keepax kirjoitti:
> The CS42L43 is an audio CODEC with integrated MIPI SoundWire interface
> (Version 1.2.1 compliant), I2C, SPI, and I2S/TDM interfaces designed
> for portable applications. It provides a high dynamic range, stereo
> DAC for headphone output, two integrated Class D amplifiers for
> loudspeakers, and two ADCs for wired headset microphone input or
> stereo line input. PDM inputs are provided for digital microphones.
> 
> Add a basic pinctrl driver which supports driver strength for the
> various pins, gpios, and pinmux for the 2 multi-function pins.

GPIOs

...

+ array_size.h

> +#include <linux/module.h>
> +#include <linux/of.h>

 + types.h

...

> +static int cs42l43_pin_set_mux(struct pinctrl_dev *pctldev,
> +			       unsigned int func_idx, unsigned int group_idx)
> +{
> +	struct cs42l43_pin *priv = pinctrl_dev_get_drvdata(pctldev);
> +	unsigned int reg, mask, val;
> +
> +	dev_dbg(priv->dev, "Setting %s to %s\n",
> +		cs42l43_pin_groups[group_idx].name, cs42l43_pin_funcs[func_idx]);
> +
> +	switch (func_idx) {
> +	case CS42L43_FUNC_MIC_SHT:
> +		reg = CS42L43_SHUTTER_CONTROL;
> +		mask = CS42L43_MIC_SHUTTER_CFG_MASK;
> +		val = 0x2 << (group_idx + CS42L43_MIC_SHUTTER_CFG_SHIFT);

BIT(1) ?

> +		break;
> +	case CS42L43_FUNC_SPK_SHT:
> +		reg = CS42L43_SHUTTER_CONTROL;
> +		mask = CS42L43_SPK_SHUTTER_CFG_MASK;
> +		val = 0x2 << (group_idx + CS42L43_SPK_SHUTTER_CFG_SHIFT);

Ditto.

> +		break;
> +	default:
> +		reg = CS42L43_GPIO_FN_SEL;
> +		mask = BIT(group_idx + CS42L43_GPIO1_FN_SEL_SHIFT);
> +		val = (func_idx == CS42L43_FUNC_GPIO) ?
> +				(0x1 << (group_idx + CS42L43_GPIO1_FN_SEL_SHIFT)) : 0;

BIT(0) ?

> +		break;
> +	}
> +
> +	if (priv->shutters_locked && reg == CS42L43_SHUTTER_CONTROL) {
> +		dev_err(priv->dev, "Shutter configuration not available\n");
> +		return -EPERM;
> +	}
> +
> +	return regmap_update_bits(priv->regmap, reg, mask, val);
> +}

...

> +static int cs42l43_gpio_set_direction(struct pinctrl_dev *pctldev,
> +				      struct pinctrl_gpio_range *range,
> +				      unsigned int offset, bool input)
> +{
> +	struct cs42l43_pin *priv = pinctrl_dev_get_drvdata(pctldev);
> +	unsigned int shift = offset + CS42L43_GPIO1_DIR_SHIFT;
> +	int ret;
> +
> +	dev_dbg(priv->dev, "Setting gpio%d to %s\n",
> +		offset + 1, input ? "input" : "output");

Probably candidate for str_input_output() in string_choises.h...

> +	ret = pm_runtime_resume_and_get(priv->dev);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to resume for direction: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_update_bits(priv->regmap, CS42L43_GPIO_CTRL1,
> +				 BIT(shift), !!input << shift);
> +	if (ret)
> +		dev_err(priv->dev, "Failed to set gpio%d direction: %d\n",
> +			offset + 1, ret);

> +	pm_runtime_put(priv->dev);

Can't runtime PM be put before printing message (if needed)?

> +	return ret;
> +}

...

> +static inline int cs42l43_pin_set_drv_str(struct cs42l43_pin *priv, unsigned int pin,
> +					  unsigned int ma)
> +{
> +	const struct cs42l43_pin_data *pdat = cs42l43_pin_pins[pin].drv_data;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(cs42l43_pin_drv_str_ma); i++) {
> +		if (ma == cs42l43_pin_drv_str_ma[i]) {

		if (ma != ...)
			continue;

and one level of indentation less with better readability of the code, no?

> +			if ((i << pdat->shift) > pdat->mask)
> +				goto err;
> +
> +			dev_dbg(priv->dev, "Set drive strength for %s to %d mA\n",
> +				cs42l43_pin_pins[pin].name, ma);
> +
> +			return regmap_update_bits(priv->regmap, pdat->reg,
> +						  pdat->mask, i << pdat->shift);
> +		}
> +	}
> +
> +err:
> +	dev_err(priv->dev, "Invalid drive strength for %s: %d mA\n",
> +		cs42l43_pin_pins[pin].name, ma);
> +	return -EINVAL;
> +}

...

> +static inline int cs42l43_pin_get_db(struct cs42l43_pin *priv, unsigned int pin)

Here and elsewhere these 'inline':s are redundant. Let compiler decide.

...

> +	dev_dbg(priv->dev, "Set debounce %s for %s\n",
> +		str_on_off(us), cs42l43_pin_pins[pin].name);

Probably you wanted to include string_choices.h instead of string_helpers.h?

...

> +	dev_dbg(priv->dev, "Setting gpio%d to %s\n",
> +		offset + 1, value ? "high" : "low");

str_high_low()

...

> +static int cs42l43_pin_probe(struct platform_device *pdev)
> +{

	struct device *dev = &pdev->dev;

will help to make code neater.

> +	struct cs42l43 *cs42l43 = dev_get_drvdata(pdev->dev.parent);
> +	struct cs42l43_pin *priv;
> +	struct pinctrl_dev *pctldev;
> +	struct fwnode_handle *fwnode = dev_fwnode(cs42l43->dev);
> +	int ret;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = &pdev->dev;
> +	priv->regmap = cs42l43->regmap;
> +
> +	priv->shutters_locked = cs42l43->hw_lock;
> +
> +	priv->gpio_chip.request = gpiochip_generic_request;
> +	priv->gpio_chip.free = gpiochip_generic_free;
> +	priv->gpio_chip.direction_input = cs42l43_gpio_direction_in;
> +	priv->gpio_chip.direction_output = cs42l43_gpio_direction_out;
> +	priv->gpio_chip.add_pin_ranges = cs42l43_gpio_add_pin_ranges;
> +	priv->gpio_chip.get = cs42l43_gpio_get;
> +	priv->gpio_chip.set = cs42l43_gpio_set;
> +	priv->gpio_chip.label = dev_name(priv->dev);
> +	priv->gpio_chip.parent = priv->dev;
> +	priv->gpio_chip.can_sleep = true;
> +	priv->gpio_chip.base = -1;
> +	priv->gpio_chip.ngpio = CS42L43_NUM_GPIOS;

...

> +	if (is_of_node(fwnode)) {
> +		fwnode = fwnode_get_named_child_node(fwnode, "pinctrl");
> +
> +		if (fwnode && !fwnode->dev)
> +			fwnode->dev = priv->dev;
> +	}

What the heck is this?
Why devlink field is set customly here? Please, figure out how to get rid of
this (it should be either global solution via devlink or pin control,
individual drivers must not even touch devlink fwnode fields without a huge
reason why.


> +	priv->gpio_chip.fwnode = fwnode;
> +
> +	device_set_node(priv->dev, fwnode);
> +
> +	devm_pm_runtime_enable(priv->dev);
> +	pm_runtime_idle(priv->dev);
> +
> +	pctldev = devm_pinctrl_register(priv->dev, &cs42l43_pin_desc, priv);
> +	if (IS_ERR(pctldev))
> +		return dev_err_probe(priv->dev, PTR_ERR(pctldev),
> +				     "Failed to register pinctrl\n");
> +
> +	ret = devm_gpiochip_add_data(priv->dev, &priv->gpio_chip, priv);
> +	if (ret)
> +		return dev_err_probe(priv->dev, ret,
> +				     "Failed to register gpiochip\n");
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko


