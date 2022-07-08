Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3888B56BE84
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 19:42:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3F72825;
	Fri,  8 Jul 2022 19:41:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3F72825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657302132;
	bh=pbHKGCNqCeDka3isb5wdysuY3yEDRSxRyuMDnwx4WDY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O3Ms0RvSVj5+MxyIthb47D9y1EyO9zhubJlwbJkup3LMgWslIPHQ0r2UkfrF2MTmw
	 1YPoZ2a9vrHLx55a4HWZw227KBHudGVZzRZZw6YUbu9VPF8uM+d7WUjzwIAfH+Q+pY
	 ll3B0dx33lmQxELxkeOkPHHpFCokgFQvh+MGJPzU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50A02F804E7;
	Fri,  8 Jul 2022 19:41:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C6C1F804CF; Fri,  8 Jul 2022 19:41:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84475F80166
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 19:41:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84475F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DBGeLX5S"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 812116242A;
 Fri,  8 Jul 2022 17:41:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 858C2C341C0;
 Fri,  8 Jul 2022 17:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657302062;
 bh=pbHKGCNqCeDka3isb5wdysuY3yEDRSxRyuMDnwx4WDY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DBGeLX5SN5PYPKuOMrkcvoJlwFPwDTDTmb2Ad4odQ2uKedon2GDO/Eq7Hx459Chgq
 x8KVGVBj/zTZ1TCClFxb+xIn+xpPlXvIc0HkyWALBfQvRNkaGZoFXBErsQvCHFfrKB
 Q4PaIXWOuds2q+KRaI+du+s0To8/+Mbat4Xttt95T2wQSmb6so7nPzs2ZAkYiusp+U
 5jttoIt0BpPv5LAtpRqDyBM/okQDFOdHNGuuntXakiiB14kYeXbrMUFnOxQ6pfx0DN
 gntur06ZU3SEL3PQ7B/tdzoKrLXqnckwKHBNk3A3R+N4oAF2ZLuhA7wOGV6kwrQw38
 WRDKwuAgzvj+w==
Date: Fri, 8 Jul 2022 18:40:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhu Ning <zhuning0077@gmail.com>
Subject: Re: [PATCH] ASoC: codecs: add support for ES8326
Message-ID: <YshsKg14M8kPakfy@sirena.org.uk>
References: <20220707011856.10841-1-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tIN0X4XrUyEUVF6K"
Content-Disposition: inline
In-Reply-To: <20220707011856.10841-1-zhuning0077@gmail.com>
X-Cookie: Baby On Board.
Cc: Zhu Ning <zhuning@everest-semi.com>, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com,
 David Yang <yangxiaohua@everest-semi.com>, tiwai@suse.com
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


--tIN0X4XrUyEUVF6K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 07, 2022 at 09:18:56AM +0800, Zhu Ning wrote:

> The ES8326 codec is not compatible with ES8316 and requires a dedicated driver.

There's a bunch of bot reported issues as well as those below.  Other
than the interrupt management this should all be fairly small, the bulk
of the driver looks good:

> +	SOC_ENUM_SINGLE(ES8326_DAC_DSM_4D, 4, 4, dacpol_txt);
> +static const struct soc_enum alc_winsize =
> +	SOC_ENUM_SINGLE(ES8326_ADC_RAMPRATE_2E, 4, 16, winsize);
> +static const struct soc_enum drc_winsize =
> +	SOC_ENUM_SINGLE(ES8326_DRC_WINSIZE_54, 4, 16, winsize);
> +static const struct snd_kcontrol_new es8326_snd_controls[] = {

We needs osme blank lines between declarations here to improve
legibility.

> +/*
> + * Note that this should be called from init rather than from hw_params.
> + */
> +static int es8326_set_dai_sysclk(struct snd_soc_dai *codec_dai,
> +				 int clk_id, unsigned int freq, int dir)

I don't see any reason why it *couldn't* be called from hw_params -
it'll mean the constraints don't take effect but that might be desirable
if it's called from hw_params due to being able to reprogram the input
clock.

> +}
> +static int es8326_probe(struct snd_soc_component *component)

More missing blank lines.

> +	ret = device_property_read_u8(component->dev, "everest,mic1-src", &es8326->mic1_src);
> +	if (ret != 0) {
> +		dev_dbg(component->dev, "mic1-src return %d", ret);
> +		es8326->mic1_src = ES8326_ADC_AMIC;
> +	}
> +	dev_dbg(component->dev, "mic1-src %x", es8326->mic1_src);
> +
> +	ret = device_property_read_u8(component->dev, "everest,mic2-src", &es8326->mic2_src);

This is adding a DT binding, the binding needs to be documented.

> +	if((reg && ES8326_VERSION_B) == 1)

Coding style and I'm not sure the logic there is what's intended?

> +	{
> +		regmap_write(es8326->regmap, ES8326_ANA_VSEL_1C, 0x7F);
> +		regmap_write(es8326->regmap, ES8326_VMIDLOW_22, 0x0F);
> +		regmap_write(es8326->regmap, ES8326_DAC2HPMIX_25, 0xAA);
> +		regmap_write(es8326->regmap, ES8326_HP_DRVIER_24, 0x20);
> +	}

Should there be something similar in the resume path?  I'm also not
seeing anything that manages the register cache over suspend.

> +	/* Enable irq and sync initial jack state */
> +	enable_irq(es8326->irq);
> +	es8326_irq(es8326->irq, es8326);

The driver souldn't need to enable or disable the IRQ by hand, it should
just configure the device to not generate interrupts when not in use.
Enabling and disabling doesn't play nicely with shared interrupts and is
in general typically a warning sign.

> +#ifdef CONFIG_OF
> +static const struct of_device_id es8326_of_match[] = {
> +	{ .compatible = "everest, es8326", },

There shouldn't be a space in the compatible string.

--tIN0X4XrUyEUVF6K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLIbCkACgkQJNaLcl1U
h9D/6Qf+KMyRZQM/8bbJJHI3FB9AfpQL1PUf0sVevITcWLyYdtDNDJxBKs1wcqeU
QrAdz9QqR48MeEJBz0q6JCOq824oscgo4MoRZNFyHRnVS2bdI+J11ZIMEA5GDSce
n69ou58c/H21FJq2IrJhexYg7acMOdHx3afNi4WH0lAUZD87uJLfWH/Q0QWY/SNv
/ROqLltHS8yoqL429DrK5A78vEi11QOIr9x1fOeq83GZXQEJzLskgwefDriU5dF4
eonuvq8odEZ1w42Xa0tene8qo8r7GV77A4pTFbUJ0CovNFdG38K059Soe3YgzzVi
4NmI+vsJD1GKHMW390niDzXggrnV8Q==
=+Iad
-----END PGP SIGNATURE-----

--tIN0X4XrUyEUVF6K--
