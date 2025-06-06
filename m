Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DDEAD027F
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jun 2025 14:47:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9F04601E0;
	Fri,  6 Jun 2025 14:47:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9F04601E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749214071;
	bh=nSWgfvnwiAwV0Rzl7WZm8EkM/Dlc9ylIVH+MDWpLqiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p+DovoGWB+ML19AeDRnMOLGLTf86wkZEvSHteGHSJ/b8j5VnnCw1WpNcGJ64gg4Z9
	 6d1Ay15rNfya4LOc2uHyUkUZaNRK/wQorfuKiok2xMw7JLN+j7wfVgsziIeXCiaWbU
	 mUS5hp9QZdbAVOJsbLbxU9DrmMvUBWaVgjTSyQRM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A3C5F805BD; Fri,  6 Jun 2025 14:47:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 064A6F805B2;
	Fri,  6 Jun 2025 14:47:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A38C6F800F0; Fri,  6 Jun 2025 14:47:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3FFEF800C1
	for <alsa-devel@alsa-project.org>; Fri,  6 Jun 2025 14:47:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3FFEF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sn4lB8Q4
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 578FE61136;
	Fri,  6 Jun 2025 12:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A082C4CEEB;
	Fri,  6 Jun 2025 12:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749214030;
	bh=nSWgfvnwiAwV0Rzl7WZm8EkM/Dlc9ylIVH+MDWpLqiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sn4lB8Q479gGwcVs6Y3hug2OgEQJT7+D9bGtNyR6ODkXL+W3R3QjchR14WRWGe9ai
	 yfa3wrfpFW0yDTbkYTtTJTzgq0wZ67XZo0ghbf9/jxUyyv3Lt48lfZXZEa3yPi1pts
	 5AXONUwmV0jeO3oJKUP3xYk/KGuYd4aD+RhrJd3KLNX1kzvj/WuBupFc6e9T7eHp99
	 E/UEHJwUnjc43vkslseJT6RJ+DrXmFqB6lZ1H8tZ/EjdB6eLq6yrvyyyw56Nrm6Xpa
	 5aUCvQnaL98fNaBLJRHZHwhBGLrnwUEyE2GwLcigIwX1pwubWL+djywRLTjszgsQ1e
	 hmyuadPV9zjeQ==
Date: Fri, 6 Jun 2025 13:47:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: andriy.shevchenko@linux.intel.com, tiwai@suse.de,
	alsa-devel@alsa-project.org, baojun.xu@ti.com, jesse-ji@ti.com,
	shenghao-ding@ti.com, liam.r.girdwood@intel.com, navada@ti.com,
	v-hampiholi@ti.com
Subject: Re: [PATCH v1 1/4] ASoc: tac5x1x: add codec driver tac5x1x family
Message-ID: <5363d3a9-0b2f-4623-92cf-93e8950c024c@sirena.org.uk>
References: <20250606065136.1821-1-niranjan.hy@ti.com>
 <20250606065136.1821-2-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hPdGt8SMMWcIcgc0"
Content-Disposition: inline
In-Reply-To: <20250606065136.1821-2-niranjan.hy@ti.com>
X-Cookie: Stay away from flying saucers today.
Message-ID-Hash: VP334OCYZAJSLVJAQJOXOZLRATOJAYHM
X-Message-ID-Hash: VP334OCYZAJSLVJAQJOXOZLRATOJAYHM
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VP334OCYZAJSLVJAQJOXOZLRATOJAYHM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--hPdGt8SMMWcIcgc0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 06, 2025 at 12:21:33PM +0530, Niranjan H Y wrote:
> tac5x1x family are series of low-power and high performance
> mono/stereo audio codecs consists of ADC and DAC combinations.
> The patch adds supports for Codecs(DAC & ADC), ADC only and
> DAC only configurations available in the tac5x1x family.

There's a few issues below but nothing that's *hugely* structural, the
bulk of the code here looks good.

> +config SND_SOC_TAC5X1X
> +	tristate "Texas Instruments TAC5X1X family codecs"
> +	depends on I2C && REGMAP_I2C
> +
> +config SND_SOC_TAC5X1X_I2C
> +	tristate "Texas Instruments TAC5X1X family driver based on I2C"
> +	depends on I2C && REGMAP_I2C
> +	select SND_SOC_TAC5X1X

You need to select REGMAP_I2C if you use it, it can't be turned on
independently.  If the device is I2C only then there's no need to have
the second option for I2C, that's used for devices that support both I2C
and SPI to avoid problems with dependencies on the I2C and SPI core
code.

>  snd-soc-tas2781-i2c-y :=3D tas2781-i2c.o
> +snd-soc-tac5x1x-y :=3D tac5x1x.o
> +snd-soc-tac5x1x-i2c-y :=3D tac5x1x-i2c.o
>  snd-soc-tfa9879-y :=3D tfa9879.o

Please keep these files alphanumerically sorted.

>  obj-$(CONFIG_SND_SOC_LPASS_TX_MACRO)	+=3D snd-soc-lpass-tx-macro.o
> =20
>  # Mux
> -obj-$(CONFIG_SND_SOC_SIMPLE_MUX)	+=3D snd-soc-simple-mux.o
> \ No newline at end of file
> +obj-$(CONFIG_SND_SOC_SIMPLE_MUX)	+=3D snd-soc-simple-mux.o
> diff --git a/sound/soc/codecs/tac5x1x-i2c.c b/sound/soc/codecs/tac5x1x-i2=
c.c

Looks like this whitespace change crept in accidentally.

> +static int tac5x1x_i2c_probe(struct i2c_client *i2c)
> +{
> +	int ret;
> +	enum tac5x1x_type type;
> +	struct regmap *regmap;
> +	const struct regmap_config *config =3D &tac5x1x_regmap;
> +
> +	regmap =3D devm_regmap_init_i2c(i2c, config);
> +	type =3D (uintptr_t)i2c_get_match_data(i2c);
> +
> +	dev_info(&i2c->dev, "probing %s codec_type =3D %d\n",
> +		 i2c->name, type);

Just drop this print, it's probably a bit noisy.

> +static const char * const int_ltch0[] =3D {
> +	"Clock Error",
> +	"PLL Lock",
> +	"Boost Over Temperature",
> +	"Boost Over Current",
> +	"Boost Mode",
> +	"Reserved",
> +	"Reserved",
> +	"Reserved",
> +};

You can just set the maximum value for the enum to be whatever the
maximum valid value is and then not need to list the Reserved entries at
all.

> +static const char * const out_ch2_ltch[] =3D {
> +	"OUT_CH2 OUT2P Short circuit Fault",
> +	"OUT_CH2 OUT2M Short circuit Fault",
> +	"OUT_CH2 DRVRP Virtual Ground Fault",
> +	"OUT_CH2 DRVRM Virtual ground Fault",
> +	"Reserved",
> +	"Reserved",
> +	"AREG SC Fault Mask",
> +	"AREG SC Fault",
> +};

For ones where the reserved values are in the middle of the set of
values you can use _VAL_ENUM() which lets you skip over the values that
are invalid.

> +static s32 tac5x1x_regmap_write(struct tac5x1x_priv *tac5x1x,
> +				u32 reg, u32 value)
> +{
> +	s32 ret;
> +	s32 retry_count =3D 5;
> +
> +	while (retry_count--) {
> +		ret =3D regmap_write(tac5x1x->regmap, reg,
> +				   value);
> +		if (ret >=3D 0)
> +			break;
> +		usleep_range(5000, 5050);
> +	}
> +	if (retry_count =3D=3D -1)
> +		return 3;
> +	else
> +		return ret;
> +}

Is the hardware genuinely so unstable that we need to retry all the I/O?
This seems really concerning.

> +static s32 tac5x1x_regmap_read(struct tac5x1x_priv *tac5x1x,
> +			       u32 reg, u32 *value)
> +{
> +	s32 ret;
> +	s32 retry_count =3D 5;
> +
> +	ret =3D regmap_reinit_cache(tac5x1x->regmap, &tac5x1x_regmap);
> +	if (ret) {
> +		dev_err(tac5x1x->dev, "Failed to reinit reg cache\n");
> +		return ret;
> +	}
> +
> +	while (retry_count--) {
> +		ret =3D regmap_read(tac5x1x->regmap, reg,
> +				  value);
> +		if (ret >=3D 0)
> +			break;
> +		usleep_range(5000, 5050);
> +	}

This seems *really* scary and confusing, why would we reset the register
cache in what looks like a normal read operation.

> +static s32 tac5x1x_dev_read(struct tac5x1x_priv *tac5x1x,
> +			    u32 dev_no, u32 reg,
> +			    u32 *ref_value)
> +{
> +	s32 ret;
> +
> +	guard(mutex)(&tac5x1x->dev_lock);
> +	if (dev_no < tac5x1x->ndev) {
> +		ret =3D tac5x1x_regmap_write(tac5x1x,
> +					   TAC_PAGE_SELECT, 0);
> +		if (ret < 0) {
> +			dev_err(tac5x1x->dev, "%s, E=3D%d\n",
> +				__func__, ret);
> +			return ret;
> +		}

This doesn't actually appear to do anything to support or choose between
multiple devices?  The code all looks like it only supports one device,
and this is only used in the interrupt handler.

> +static void tac5x1x_irq_work_func(struct tac5x1x_priv *tac5x1x)
> +{
> +	u32 reg_val, array_size, i, index =3D 0, bit =3D 0;
> +	s32 rc;
> +
> +	tac5x1x_enable_irq(tac5x1x, false);
> +	array_size =3D  ARRAY_SIZE(int_reg_array);
> +	for (i =3D 0; i < array_size; i++) {
> +		rc =3D tac5x1x_dev_read(tac5x1x, index,
> +				      int_reg_array[i], &reg_val);

=2E..

> +	}
> +	tac5x1x_enable_irq(tac5x1x, true);

The interrupt disabling here seems odd - what's the story there?  I see
this is a work function rather than an irq thread to add some delay and
introduce some debouncing but it's not clear why the disable during
handling.

> +const struct regmap_config tac5x1x_regmap =3D {
> +	.max_register =3D 12 * 128,

> +EXPORT_SYMBOL(tac5x1x_regmap);

EXPORT_SYMBOL_GPL().

> +static s32 tac5x1x_set_GPO1_gpio(struct snd_kcontrol *kcontrol,
> +				 struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	s32 gpio_check, val;
> +
> +	val =3D snd_soc_component_read(component, TAC5X1X_GPO1);
> +	gpio_check =3D ((val & TAC5X1X_GPIOX_CFG_MASK) >> 0);
> +	if (gpio_check !=3D TAC5X1X_GPIO_GPO) {
> +		dev_err(component->dev,
> +			"%s: GPO1 is not configure as a GPO output\n",
> +			__func__);
> +		return -EINVAL;
> +	}
> +
> +	if (ucontrol->value.integer.value[0])
> +		val =3D 0;
> +	else
> +		val =3D TAC5X1X_GPO1_VAL;

This seems to be exposing a GPIO directly to userspace, which will
prevent using that GPIO with other kernel subsystems.  It would be
better to expose this via gpiolib, then if userspace control is needed
that can be done through gpiolib.

> +/* Impedance Selection */
> +static const char *const resistor_text[] =3D {
> +	"5 kOhm",
> +	"10 kOhm",
> +	"40 kOhm",
> +};
> +
> +static SOC_ENUM_SINGLE_DECL(adc1_resistor_enum, TAC5X1X_ADCCH1C0, 4,
> +		resistor_text);
> +static SOC_ENUM_SINGLE_DECL(adc2_resistor_enum, TAC5X1X_ADCCH2C0, 4,
> +		resistor_text);

Is this something that would be adjusted at runtime, or should it be a
device tree setting?

> +static const char *const rx_ch3_asi_cfg_text[] =3D {
> +		"Disable",
> +		"DAC channel data",
> +};

On/off switches should be plain controls ending in "Switch" rather than
enums.

> +static const char *const tac5x1x_slot_select_text[] =3D {
> +	"Slot 0", "Slot 1", "Slot 2", "Slot 3",
> +	"Slot 4", "Slot 5", "Slot 6", "Slot 7",
> +	"Slot 8", "Slot 9", "Slot 10", "Slot 11",
> +	"Slot 12", "Slot 13", "Slot 14", "Slot 15",
> +	"Slot 16", "Slot 17", "Slot 18", "Slot 19",
> +	"Slot 20", "Slot 21", "Slot 22", "Slot 23",
> +	"Slot 24", "Slot 25", "Slot 26", "Slot 27",
> +	"Slot 28", "Slot 29", "Slot 30", "Slot 31",
> +};

TDM slot control would usually be done via set_tdm_slot().

> +static const char *const out2x_vcom_text[] =3D {
> +	"0.6 * Vref",
> +	"AVDD by 2",
> +};
> +
> +static const char *const diag_cfg_text[] =3D {
> +	"0mv", "30mv", "60mv", "90mv",
> +	"120mv", "150mv", "180mv", "210mv",
> +	"240mv", "270mv", "300mv", "330mv",
> +	"360mv", "390mv", "420mv", "450mv",
> +};
> +
> +static const char *const diag_cfg_gnd_text[] =3D {
> +	"0mv", "60mv", "120mv", "180mv",
> +	"240mv", "300mv", "360mv", "420mv",
> +	"480mv", "540mv", "600mv", "660mv",
> +	"720mv", "780mv", "840mv", "900mv",
> +};

Are these controls that should be device tree data?

> +	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {

SND_SOC_DAIFMT_CLOCK_MASK.

> +#ifdef CONFIG_PM
> +static s32 tac5x1x_soc_suspend(struct snd_soc_component *component)
> +{
> +	struct tac5x1x_priv *tac5x1x =3D
> +		snd_soc_component_get_drvdata(component);
> +
> +	regcache_cache_only(tac5x1x->regmap, true);
> +	regcache_mark_dirty(tac5x1x->regmap);
> +
> +	regulator_disable(tac5x1x->supply_avdd);
> +	regulator_disable(tac5x1x->supply_iovdd);

Consider using the regulator_bulk_ APIs - the current code is fine, but
I don't see any cases where you're controlling the regulators separately
so it'd be a little simpler and allows the core to do things like bring
multiple regulators up in parallel.

> +static s32 tac5x1x_soc_resume(struct snd_soc_component *component)
> +{
> +	struct tac5x1x_priv *tac5x1x =3D
> +		snd_soc_component_get_drvdata(component);
> +	s32 ret;
> +
> +	regcache_cache_only(tac5x1x->regmap, false);
> +	snd_soc_component_cache_sync(component);
> +
> +	ret =3D regulator_enable(tac5x1x->supply_avdd);
> +	if (ret) {
> +		regulator_disable(tac5x1x->supply_avdd);
> +		return ret;
> +	}
> +
> +	ret =3D regulator_enable(tac5x1x->supply_iovdd);
> +	if (ret) {
> +		regulator_disable(tac5x1x->supply_iovdd);
> +		return ret;
> +	}

This will try to do the cache sync with the regulators disabled which
won't work if they were actually turned off.

--hPdGt8SMMWcIcgc0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhC40gACgkQJNaLcl1U
h9Bt5Qf+NVwnMDTQ6PreF7H/g27VSKSQPZkxqE6Hr6ZjVAnx+F/X1QGbA/jM9gak
M0DpN5hb5sD7gf/55Cr+63IvS6cwx19pcWNqwsYFHZqQ5+zBuXNyVbzmFz4mV7cO
D34lpfwVSJkhV30YCCeG6DFL7UYOqsm+GqkF7gCtHtSE/5SyMVE/mSb/Me5HyxJj
R7GNW1NQ0nGwSqbtT4Nq99i+78YKWLzFZejNGP8MUA1OHMTsTNM0sGbr6X/StWQ/
nJ/KzVk1BEOv/0KMgZS/u7SKAiwTxoOUSOvfHtheiluK1YcTI2Fdo+DZ60Yj3jOA
VBhXE6Jjvn6vz5Yk3yJTtjnyPpZdAg==
=VAlX
-----END PGP SIGNATURE-----

--hPdGt8SMMWcIcgc0--
