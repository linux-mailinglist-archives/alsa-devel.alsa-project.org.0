Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBDBAE8252
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jun 2025 14:03:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08BF9601F2;
	Wed, 25 Jun 2025 14:03:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08BF9601F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750853032;
	bh=DJYk+nJdrcFqsilvWyvv59lNgAC+uRMgCXISFFCU3eg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iPKB71wGNC6YLj1HF7EoURI+BwZvY6cNb9rJ0Dxdc5V/sT9kHAp8TmnN9BVn7Gjks
	 yRndwnFSVt/j3zf+PI3eBVIoFCz39ODf/niB8C0rzYJr9fCBOjH/prnQb+xKW5ef3O
	 Rk9U6nk+yya8PVR4H08TBbB57emrATq3tfIdh3Ak=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE32CF805CB; Wed, 25 Jun 2025 14:03:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96E6AF805C5;
	Wed, 25 Jun 2025 14:03:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26E8CF804FB; Wed, 25 Jun 2025 14:03:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 261B1F800B6
	for <alsa-devel@alsa-project.org>; Wed, 25 Jun 2025 14:03:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 261B1F800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dgcD3iKg
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD83443D9E;
	Wed, 25 Jun 2025 12:03:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 376B9C4CEEF;
	Wed, 25 Jun 2025 12:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750852989;
	bh=DJYk+nJdrcFqsilvWyvv59lNgAC+uRMgCXISFFCU3eg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dgcD3iKgDWDoL5ICfMeoOY4AZH6a345usG+FHqIpa3kGDtNaPTBb0ojM4uYv5WKtE
	 6sjQtdYupIu5DI9d9QX2TIm3ajufnwRglb1dyKLN5GV0i9TG5Ea3humr3Ozk/0IHkW
	 7NS5zRXPI4r5vdCAikN0c/F1+wF1JE3mA60qdWba+q8hGejg1nj+k1iOPaYlPNRQgS
	 qw4bIn00dFIKuDu7eImrhLFb0gbqUWMy7D42NIiNQuBAtjZ/jrUcqI0BFAQAtuKslg
	 tO9sO74tXYNgPFtqCP/ItYFeAbztpblgdpPb6+7BwvHZNX0EaQjltDbooxQNjtsaer
	 xO9CGXK99aWkA==
Date: Wed, 25 Jun 2025 13:03:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: andriy.shevchenko@linux.intel.com, tiwai@suse.de,
	alsa-devel@alsa-project.org, baojun.xu@ti.com, shenghao-ding@ti.com,
	liam.r.girdwood@intel.com, navada@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v2 1/4] ASoc: tac5x1x: add codec driver tac5x1x family
Message-ID: <6c48c300-2906-42b0-ae2d-fc661f7a3933@sirena.org.uk>
References: <20250624153742.1507-1-niranjan.hy@ti.com>
 <20250624153742.1507-2-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7fYEWLs0r7qCgExF"
Content-Disposition: inline
In-Reply-To: <20250624153742.1507-2-niranjan.hy@ti.com>
X-Cookie: He who hates vices hates mankind.
Message-ID-Hash: PJO3RAF2AHF5PJ4357D2TGZ7AMGU7GF6
X-Message-ID-Hash: PJO3RAF2AHF5PJ4357D2TGZ7AMGU7GF6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PJO3RAF2AHF5PJ4357D2TGZ7AMGU7GF6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--7fYEWLs0r7qCgExF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 24, 2025 at 09:07:39PM +0530, Niranjan H Y wrote:

This looks mostly good, a few issues below but none super substantial.

> +static void process_one_interrupt(struct tac5x1x_priv *tac5x1x, s32 index,
> +				  s32 value)
> +{
> +	u32 map_count, i;
> +	const struct mask_to_txt *map_items;
> +
> +	map_count = intr_info_list[index].count;
> +	map_items = intr_info_list[index].mask_str_map;
> +
> +	for (i = 0; i < map_count; i++) {
> +		if (value & map_items[i].mask)
> +			dev_err(tac5x1x->dev, "Interrupt %s detected\n",
> +				map_items[i].name);
> +	}
> +}

This should probably be a dev_dbg() at most if it's not for a specific
interrupt.

> +	ret = regmap_multi_reg_read(tac5x1x->regmap,
> +				    tac5x1x->irqinfo.latch_regs,
> +				    tac5x1x->irqinfo.latch_data, latch_count);
> +	if (ret) {
> +		dev_err(tac5x1x->dev,
> +			"interrupt: latch register read failed");
> +		return IRQ_HANDLED;
> +	}

IRQ_NONE is probably a better choice for a failed read, that'll mean we
retry (or shut the interrupt off if it fails continually).

> +static s32 tac5x1x_get_GPIO1_gpio(struct snd_kcontrol *kcontrol,
> +				  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	s32 val;
> +
> +	val = snd_soc_component_read(component, TAC5X1X_GPIOVAL);
> +	ucontrol->value.integer.value[0] = !!(val & TAC5X1X_GPIO1_MON);
> +
> +	return 0;
> +};

As I said on the prior version the GPIOs should be exposed via gpiolib.
Please just remove this, if you want to discuss it'd be better to make
it a separate incremental patch so that it doesn't hold up the rest of
the driver.

> +/* PDM Data input pin Selection */
> +static const char *const pdm_pin_text[] = {
> +	"Disable",
> +	"GPIO1",
> +	"GPIO2",
> +	"GPI1",
> +};

This looks like something that should be configured via the DT rather
than from userspace, I'd expected this will be determined by the
hardware design.  It looks like the DT bit is already there so the
controls should just be dropped.

> +static s32 tac5x1x_set_dai_fmt(struct snd_soc_dai *codec_dai, u32 fmt)
> +{
> +	struct snd_soc_component *component = codec_dai->component;
> +	s32 iface_reg_1 = 0;
> +	s32 iface_reg_2 = 0;
> +	s32 iface_reg_3 = 0;
> +
> +	int right_slot = 1;
> +
> +	dev_info(component->dev, "[tac5x1x] %s(), fmt=%d\n", __func__, fmt);

There shouldn't be any dev_info() or higher messages in the normal
playback/record flow.  Error reports are fine, but when things are
working the logs should be quiet so we don't obscure problems.

> +static s32 tac5x1x_reset(struct snd_soc_component *component)
> +{
> +	s32 ret, index;
> +
> +	ret = snd_soc_component_write(component, TAC5X1X_RESET, 1);
> +	if (ret < 0)
> +		return ret;
> +	/* Wait >= 10 ms after entering sleep mode. */
> +	usleep_range(10000, 100000);
> +
> +	for (index = 0; index < ARRAY_SIZE(tac5x1x_reg_defaults); index++) {
> +		ret = snd_soc_component_write(component,
> +					      tac5x1x_reg_defaults[index].reg,
> +					      tac5x1x_reg_defaults[index].def);
> +		if (ret < 0)
> +			return ret;
> +	}

You can use regcache_drop_region() to discard the cache without having
to write out all the values to the hardware, that should speed things up
a lot.

> +	if (!(tac5x1x->codec_type == TAD5212 ||
> +	      tac5x1x->codec_type == TAD5112)) {
> +		ret =
> +		 snd_soc_dapm_new_controls(dapm, tac5x1x_common_widgets,
> +					   ARRAY_SIZE(tac5x1x_common_widgets));
> +		if (ret)
> +			return ret;
> +
> +		ret = snd_soc_dapm_add_routes(dapm, tac_common_routes,
> +					      ARRAY_SIZE(tac_common_routes));
> +		if (ret)
> +			return ret;
> +	} else {

It's better to use switch statements for these, it's easier to extend
for new chips.

> +static int tac5x1x_i2c_probe(struct i2c_client *i2c)
> +{
> +	int ret;
> +	enum tac5x1x_type type;
> +	struct regmap *regmap;
> +	const struct regmap_config *config = &tac5x1x_regmap;
> +
> +	regmap = devm_regmap_init_i2c(i2c, config);
> +	type = (uintptr_t)i2c_get_match_data(i2c);
> +
> +	ret = tac5x1x_probe(&i2c->dev, regmap, type);
> +	if (ret)
> +		dev_err(&i2c->dev, "probe failed");
> +
> +	return ret;
> +}

It'd be better to move the resets, regulator gets and pin configuration
to the I2C probe - that means that even if the sound card doesn't start
for some reason the chip will be in a known good state, and if it takes
some deferred probes for the card to come up we won't be bouncing the
chip on and off.

--7fYEWLs0r7qCgExF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhb5XYACgkQJNaLcl1U
h9Bf9Af/XyKZGENIlPYM6n66Da26k6DQ9uO4abjF96Vogkf1AqUXKG4qQjN1CnFa
A/fwzManFX5zE7N0T+DMaHSLVTqF53sfA3IUpWc4TgbU8D3UMs47UkG95QXTRaCh
MFIfOPf45hUx+bW+sXU2W55qAmsnIBpdgs97aJZcUauZmjfzmFoKqBVodBmN+XEN
dytHJUCU2KzPENnft1I5tfKz5TEC4xiX4Mdwe8WIQxyKHM+rR3uofhptzEeZYLpS
hN9/TzaO8604nUHW1s3Tk1/EDj4vns0EArOHXoPNDD2M0OE3m3QrGECx7CG3VuVq
jKC63pgpBfdrUIyVLkdjUORiIJsc8w==
=ReGo
-----END PGP SIGNATURE-----

--7fYEWLs0r7qCgExF--
