Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CE66A488D
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Feb 2023 18:48:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3EEA20B;
	Mon, 27 Feb 2023 18:47:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3EEA20B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677520117;
	bh=je6Bz/Pb53L7AJRKDXmLUBTm/Pxb0Qt9+y/hqaITn18=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MnZNItmuUQJl8Mv2ygYzzW7PLBbPxdxc6NwKo1YoP9cCOcJmpXm+QBWKeb4vhLzp7
	 bdufBexGMXd21RMrPOGwOeS00loNJ4QFidYtLCgUUuN+J3Fle+EDY2JSfgXRlZv4KM
	 /klzRopzi/+9T4ywugXc/tXpM9FKGFN1AYcvgP/o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5EE6F802BE;
	Mon, 27 Feb 2023 18:47:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75DD4F8049C; Mon, 27 Feb 2023 18:47:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5006F800FA
	for <alsa-devel@alsa-project.org>; Mon, 27 Feb 2023 18:47:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5006F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XVrT/nnM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7D4E960ED2;
	Mon, 27 Feb 2023 17:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC39C433D2;
	Mon, 27 Feb 2023 17:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677520049;
	bh=je6Bz/Pb53L7AJRKDXmLUBTm/Pxb0Qt9+y/hqaITn18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XVrT/nnMvPYu6UzG9YF0HNpeuGQhj+LuLQX66SXtYRTyunL5K5XjWYt2R/chjUB0L
	 ABjkS9XDUbz9wDdqOS+LzWiXqzB+BWP+5SeZ0xd8oXuKg3b2oR+e40lw9G7nxMMYa/
	 KfPUmbmXpn11A64K2xAUgBFQ2YHGzYaZnFHfv4BAa9Srop7qfPIwxXuBB3p3EBQTdI
	 M3HOHIluptoMazcnOnX2NT0nQ6kEga61TmLI+knHe00KjyiBbhm5ztOsNzkPzj21wI
	 sGpbnMi4PUYZUO2T+1gQ6AQeflLhje8/4QfyuiSGMhlQeK74Dh54v3lESIzpxfyILA
	 5Sjd1BjhM2L6A==
Date: Mon, 27 Feb 2023 17:47:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/2] ASoC: max98363: add soundwire amplifier driver
Message-ID: <Y/zsqjOWFKrpDtl8@sirena.org.uk>
References: <20230224010814.504016-1-ryan.lee.analog@gmail.com>
 <0fb47fe7-719b-0773-fc14-3d62d7d33619@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X8+/QatuS77Fl/Hx"
Content-Disposition: inline
In-Reply-To: <0fb47fe7-719b-0773-fc14-3d62d7d33619@linux.intel.com>
X-Cookie: On the eighth day, God created FORTRAN.
Message-ID-Hash: 2KHSVW67XN34BCFYURQCARM7L5LI2XD7
X-Message-ID-Hash: 2KHSVW67XN34BCFYURQCARM7L5LI2XD7
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: =?utf-8?B?4oCcUnlhbg==?= <ryan.lee.analog@gmail.com>, lgirdwood@gmail.com,
 tiwai@suse.com, krzysztof.kozlowski@linaro.org, rf@opensource.cirrus.com,
 ckeepax@opensource.cirrus.com, herve.codina@bootlin.com,
 wangweidong.a@awinic.com, james.schulman@cirrus.com,
 ajye_huang@compal.corp-partner.google.com, shumingf@realtek.com,
 povik+lin@cutebit.org, flatmax@flatmax.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
 ryans.lee@analog.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2KHSVW67XN34BCFYURQCARM7L5LI2XD7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--X8+/QatuS77Fl/Hx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 27, 2023 at 10:17:45AM -0500, Pierre-Louis Bossart wrote:

> > +static struct reg_default max98363_reg[] = {
> > +	{MAX98363_R0040_SCP_INIT_STAT_1, 0x00},
> > +	{MAX98363_R0041_SCP_INIT_MASK_1, 0x00},
> > +	{MAX98363_R0042_SCP_INIT_STAT_2, 0x00},
> > +	{MAX98363_R0044_SCP_CTRL, 0x00},
> > +	{MAX98363_R0045_SCP_SYSTEM_CTRL, 0x00},
> > +	{MAX98363_R0046_SCP_DEV_NUMBER, 0x00},
> > +	{MAX98363_R004D_SCP_BUS_CLK, 0x00},
> > +	{MAX98363_R0050_SCP_DEV_ID_0, 0x21},
> > +	{MAX98363_R0051_SCP_DEV_ID_1, 0x01},
> > +	{MAX98363_R0052_SCP_DEV_ID_2, 0x9F},
> > +	{MAX98363_R0053_SCP_DEV_ID_3, 0x87},
> > +	{MAX98363_R0054_SCP_DEV_ID_4, 0x08},
> > +	{MAX98363_R0055_SCP_DEV_ID_5, 0x00},

> That seems wrong, why would you declare standard registers that are
> known to the bus and required to be implemented?

This is the register defaults table, it gets used to initialise the
register cache and optimise resync after suspend - all this does is
supply defaults for the cache.  That said...

I would suggest it's better to not supply defaults for ID registers and
read them back from the device otherwise things might get confused.

> > +static const struct regmap_config max98363_sdw_regmap = {
> > +	.reg_bits = 32,
> > +	.val_bits = 8,
> > +	.max_register = MAX98363_R21FF_REV_ID,
> > +	.reg_defaults  = max98363_reg,
> > +	.num_reg_defaults = ARRAY_SIZE(max98363_reg),
> > +	.readable_reg = max98363_readable_register,
> > +	.volatile_reg = max98363_volatile_reg,

> I don't see why the SoundWire standard registers are part of regmap?

...if there's an issue with the SoundWire core modifying the registers
directly then the driver would need to mark all the core registers as
volatile so that they're not cached otherwise there will be collisions.
Or is it the case that we always need to go via the SoundWire core for
the generic registers, so they should just never be written at all?

> > +	if (max98363->dvddio) {
> > +		ret = regulator_enable(max98363->dvddio);
> > +		if (ret < 0)
> > +			return ret;
> > +	}
> > +
> > +	if (max98363->vdd) {
> > +		ret = regulator_enable(max98363->vdd);
> > +		if (ret < 0)
> > +			return ret;
> > +	}

> that is very very odd. It's the first time we see a SoundWire codec
> driver that has a power dependency, and it's quite likely that it's too
> late to enable power resources *AFTER* dealing with all the
> initialization and enumeration.

> It's not even clear to me how this device would be enumerated.

> You'd need to explain what part of the amplifier is controlled by those
> regulator, otherwise it's impossible to review and understand if the
> driver does the 'right thing'

It's also buggy to have regulators treated as optional unless they may
be physically absent.

--X8+/QatuS77Fl/Hx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmP87KkACgkQJNaLcl1U
h9Bv7Qf/YeP3QSU5T9ffyKOEPzEa0RwdpuLjBCjiDvdaCTaKpPSEZ74eMbh7LDJa
Pp+Nl3FhE3e3gYMZgJsU92VB2blKAyJ2ucRVdVon2R4KibZcmQo5uzJMm2Atc65e
psqnyn8ivHkOD7VNLgISErLRKchM+1tWbpchvxGXFrB/1atwRQ0w4I8AAr7tAeya
ArpGpzwcry/mZxUkqNlaVPkvCWnVQ2bSTBFg1VRGPkDAd3Ut97UWE8rN3/JVdUbL
GucL8qXeDkpIQsS9e6oNOgS6smmVpl7tMVOY+P1B1O6K8mZywLJW/1SKvuj9f8fl
yokBKgAoCkD7b0UzeepBdGDDtu7Vkg==
=FsGr
-----END PGP SIGNATURE-----

--X8+/QatuS77Fl/Hx--
