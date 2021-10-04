Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A6142105F
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 15:42:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06C97168F;
	Mon,  4 Oct 2021 15:41:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06C97168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633354923;
	bh=6SV1XQalifoPL2kk0zPpcv6WH1kLKR22yKicUq32jbI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oQ/k6o5SRgkZqVcHEeKByB48vVtTWy+BLG8TlA2tSK5YQnNJKTHGUmRNl6KKQOhwX
	 49Xh+XcTYNU0tfEwSWT1R88qr2JxhIy5bK4jxHmbUd/acuzcvO6lO7zKYgSmyKxH7H
	 Y+DaEI8Yw6AAEKWKztcOveG0WJvImppRflh4FQHg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BE9EF80171;
	Mon,  4 Oct 2021 15:40:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0141AF80240; Mon,  4 Oct 2021 15:40:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E782AF800BA
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 15:40:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E782AF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eNVLb7Ti"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E89D1611C0;
 Mon,  4 Oct 2021 13:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633354833;
 bh=6SV1XQalifoPL2kk0zPpcv6WH1kLKR22yKicUq32jbI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eNVLb7TiInFXnfy6StXzrOGI/Xz2XqBAepSOMWUSBnm+HP4QZg5rKI5abYqHrVjvj
 WU5o9YBNQfmIDB+SqLjVsinQgoXwZzC04ef45SXyuDiYeXwPlGHI3eYkx/xdT1W0dy
 eZksHqfOjjSaiwzErqkDtWMMyO19lwtZYoZ4tcUU/R9b6qLs8TmVGv+qhO2UX5mbJl
 J0CfsnKXaIz2i93qRm5RM0FUKMqqdhvG8L5fD7MW1/ze39YxTBRshJ2wZcMmiDWnxG
 o1KeOVp1CSfZ5uikw/sSuifH/OqzLKZr0gfQgjTyhYt6q2yRlfvHSKjXpyqPritM1E
 qu0aK/ZeS5v8g==
Date: Mon, 4 Oct 2021 14:40:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Ricard Wanderlof <ricardw@axis.com>
Subject: Re: [PATCH 2/2] ASoC: codec: tlv320adc3xxx: New codec driver
Message-ID: <YVsETxqzhZI8Fb6D@sirena.org.uk>
References: <alpine.DEB.2.21.2110041117540.14472@lnxricardw1.se.axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="odvn+xLAW2jj4KRj"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2110041117540.14472@lnxricardw1.se.axis.com>
X-Cookie: If it heals good, say it.
Cc: alsa-devel <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>
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


--odvn+xLAW2jj4KRj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 04, 2021 at 11:19:21AM +0200, Ricard Wanderlof wrote:

There's an awful lot of code in here that just doesn't really look like
a normal Linux driver or follow conventions for ASoC, just from a quick
visual overview without actually reading anything it's fairly clear the
driver needs quite a bit of a refresh for mainline.

> +config SND_SOC_TLV320ADC3XXX
> +	tristate "Texas Instruments TLV320ADC3001/3101 audio ADC"
> +        help
> +	 Enable support for Texas Instruments TLV320ADC3001 and TLV320ADC3101
> +	 ADCs.

Indentation seems weird here?

> +++ b/sound/soc/codecs/tlv320adc3xxx.c
> @@ -0,0 +1,1239 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Based on sound/soc/codecs/tlv320aic3x.c by  Vladimir Barinov

Please make the entire comment a C++ one so things look more
intentional.

> +/***************************** INCLUDES ************************************/
> +

These section markers aren't idiomatic.

> +#define PLL_MODE_TEXT(mode) (mode == ADC3XXX_PLL_ENABLE ? "PLL enable" : \
> +			     (mode == ADC3XXX_PLL_BYPASS ? "PLL bypass" : \
> +							   "PLL auto"))

If you need this please just write it as a function with normal
conditional statements for better legibility and type safety.

> +static bool adc3xxx_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case PAGE_SELECT: /* required by regmap implementation */

This is not required by regmap.

> +
> +/* The global Register Initialization sequence Array. During the Audio Driver
> + * Initialization, this array will be utilized to perform the default
> + * initialization of the audio Driver.
> + */
> +static const struct adc3xxx_configs adc3xxx_reg_init[] = {
> +	/* The default (out-of-reset) values in the x_PGA_SEL_x registers
> +	 * disable the inputs by default, but also set the input attenuation
> +	 * to -6 dB by default, so we leave the inputs disabled but set
> +	 * the attenuation to a more natural 0 dB.
> +	 */

These are all perfectly fine defaults, just leave them as they are and
expose the configuration to userspace - what makes sense for one system
may not make sense for another so we just leave things at the hardware
defaults and let userspace configure what it needs.  All the code
relating to setting new defaults should be removed.

> + *----------------------------------------------------------------------------
> + * Function : adc3xxx_get_divs
> + * Purpose  : This function is to get required divisor from the "adc3xxx_divs"
> + *            table.
> + *
> + *----------------------------------------------------------------------------
> + */

If you must include comments like this please follow the standard kernel
documentation style, but I'm really struggling to see any value in them.

> +	dev_info(dev, "mclk = %d, rate = %d, clock mode %u\n",
> +		 mclk, rate, pll_mode);

This is way too verbose, it should at most be dev_dbg().  Same for most
dev_info() in the driver.

> +static const char * const micbias_voltage[] = { "off", "2V", "2.5V", "AVDD" };

This should be configured in the DT, it's going to be a property of the
electrical design of the system.

> +static const char * const linein_attenuation[] = { "0db", "-6dB" };

This is a volume control, it should be a standard volume control with
TLV information.

> +static const char * const dither_dc_offset[] = {
> +	"0mV", "15mV", "30mV", "45mV", "60mV", "75mV", "90mV", "105mV",
> +	 "reserved", "-15mV", "-30mV", "-45mV", "-60mV", "-75mV", "-90mV", "-105mV"
> +};

Use a VALUE_ENUM to prevent the selection of invalid values.

> +/* Creates an array of the Single Ended Widgets*/
> +static const struct soc_enum adc3xxx_enum[] = {
> +	SOC_ENUM_SINGLE(MICBIAS_CTRL, 5, 4, micbias_voltage),
> +	SOC_ENUM_SINGLE(MICBIAS_CTRL, 3, 4, micbias_voltage),

Putting all these into an array just makes everything more error prone
and hard to maintain for no benefit.  Just declare them as variables.

> +static const struct snd_kcontrol_new adc3xxx_snd_controls[] = {
> +	SOC_DOUBLE_R_TLV("PGA Gain Volume", LEFT_APGA_CTRL, RIGHT_APGA_CTRL,
> +			 0, 80, 0, pga_tlv),

s/Gain //

> +	SOC_DOUBLE_R("AGC Enable", LEFT_CHN_AGC_1,
> +		     RIGHT_CHN_AGC_1, 7, 1, 0),

On/off controls should use the standard ALSA naming - Switch.

> +/* Left input selection, Single Ended inputs and Differential inputs */
> +static const struct snd_kcontrol_new left_input_mixer_controls[] = {
> +	SOC_DAPM_SINGLE("IN_1L switch", LEFT_PGA_SEL_1, 1, 0x1, 1),

s/switch/Switch/

> +/* Right input selection from switches */
> +	{"Right Input Selection", "IN_1R switch", "IN_1R"},

Indentation is weird here.

> +/* GPIO control. These are only used when the corresponding GPIO pin is
> + * configured accordingly.
> + */
> +static const struct snd_kcontrol_new adc3xxx_gpio1_out_control[] = {
> +	SOC_SINGLE("GPIO1 Output", GPIO1_CTRL, GPIO_CTRL_OUTPUT_CTRL_SHIFT, 1, 0)
> +};

Remove these, if control is needed for the GPIO implement gpiolib support
for it and let the system control it like any other GPIO.

> +	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> +	case SND_SOC_DAIFMT_CBM_CFM:
> +		adc3xxx->master = 1;
> +		clkdir = BCLK_MASTER | WCLK_MASTER;
> +		break;
> +	case SND_SOC_DAIFMT_CBS_CFS:

Please use the modern _CBP_CFP and _CPC_CFC defines.

> +	default:
> +		dev_err(component->dev, "Invalid DAI master/slave interface\n");

Provider/consumer.

> +		/* Switch on NADC Divider */
> +		snd_soc_component_update_bits(component, ADC_NADC,
> +					      ENABLE_NADC, ENABLE_NADC);
> +
> +		/* Switch on MADC Divider */
> +		snd_soc_component_update_bits(component, ADC_MADC,
> +					      ENABLE_MADC, ENABLE_MADC);

Why are these not managed through DAPM?

> +struct snd_soc_dai_driver adc3xxx_dai = {
> +	.name = "tlv320adc3xxx-hifi",
> +	.capture = {
> +		    .stream_name = "Capture",
> +		    .channels_min = 1,
> +		    .channels_max = 2,
> +		    .rates = ADC3xxx_RATES,
> +		    .formats = ADC3xxx_FORMATS,
> +		    },
> +	.ops = &adc3xxx_dai_ops,
> +};
> +EXPORT_SYMBOL_GPL(adc3xxx_dai);

Why is this exported?

> +#define REGISTER_INIT(CODEC, MAP) \
> +	do { \
> +		int i; \
> +		for (i = 0; i < ARRAY_SIZE(MAP); i++) \
> +			snd_soc_component_write(CODEC, MAP[i].reg_offset, \
> +				      MAP[i].reg_val); \
> +	} while (0)

Like I said this code should be removed so it's moot but why s this not
written as a normal function?

> +	}
> +
> +	//adc3xxx_set_bias_level(component, SND_SOC_BIAS_STANDBY);
> +

Just remove commented out code.

> +static int adc3xxx_probe(struct snd_soc_component *component)
> +{
> +	struct adc3xxx_priv *adc3xxx = snd_soc_component_get_drvdata(component);
> +	int ret = 0;
> +
> +	ret = devm_gpio_request(component->dev, adc3xxx->rst_pin, "adc3xxx reset");
> +	if (ret < 0) {

Request resources that are needed at the I2C layer probe so that basic
chip initialisation can happen sooner in boot and so that any probe
deferral doesn't cause us to have to set up and tear down the card.

> +static int adc3xxx_resume(struct snd_soc_component *component)
> +{
> +	snd_soc_component_cache_sync(component);
> +	adc3xxx_set_bias_level(component, SND_SOC_BIAS_STANDBY);

You need to mark the cache as dirty to get the cache sync to do
anything.

> +#if defined(CONFIG_I2C) || defined(CONFIG_I2C_MODULE)
> +/*

Why is this conditional?

> +	adc3xxx->mclk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(adc3xxx->mclk)) {
> +		if (PTR_ERR(adc3xxx->mclk) != -ENOENT)
> +			return PTR_ERR(adc3xxx->mclk);
> +		/* Make a note that there is no mclk specified. */
> +		adc3xxx->mclk = NULL;

Does the device work without a MCLK?

> +static const struct i2c_device_id adc3xxx_i2c_id[] = {
> +	{"tlv320adc3001", ADC3001},
> +	{"tlv320adc3101", ADC3101},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, adc3xxx_i2c_id);

Extra blank line here.

> +static int __init tlv320adc3xxx_init(void)
> +{
> +	return i2c_add_driver(&adc3xxx_i2c_driver);
> +}
> +
> +static void __exit tlv320adc3xxx_exit(void)
> +{
> +	i2c_del_driver(&adc3xxx_i2c_driver);
> +}
> +
> +module_init(tlv320adc3xxx_init);
> +module_exit(tlv320adc3xxx_exit);

module_i2c_driver().

> +/* Page select register */
> +#define PAGE_SELECT			ADC3xxx_REG(0, 0)
> +/* Software reset register */
> +#define RESET				ADC3xxx_REG(0, 1)

These defines pretty much all need namespacing, especially things like
RESET are way too collision prone.

--odvn+xLAW2jj4KRj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFbBE4ACgkQJNaLcl1U
h9AgLAf/VlG5PG2d3Im4ATHmQiiXVDunF/ekEAH6EZhpotMSl8vXPAgeViYiiA8T
7Gs0Lmg3isGUCi6KKUjThtCZ/mDUTc+lRm6qg5xoSDAGIkgqbX/ZI53zbbkvN8pl
lFGtOSk5E8Zjwf3jau4JuT9jsm+jeYQhV9/vbWdpTxuJg7+PIXNMoPqllFUZMfJD
oKlmGRI1+sN2nBE4N+M3jhcx0dYLezC3ZPV4GYoTq6Y/gLCpiD922OuIHHikUXuQ
9lR82Vk7M9NMyyNDOkcI8pkvwjSZoI9Lo92oI/BYp2QO3dbJcUQFm939psZsMzCP
fzJEaALEesU8+cZQIDAbSWpX0l9jZQ==
=XsoU
-----END PGP SIGNATURE-----

--odvn+xLAW2jj4KRj--
