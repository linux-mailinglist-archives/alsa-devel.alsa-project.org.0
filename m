Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E763CBBE3
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 20:31:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0197B1695;
	Fri, 16 Jul 2021 20:30:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0197B1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626460308;
	bh=hEPhcR9kwxTFZylD4Y68zysN1eAKX7bLdXZXi+XBFY4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g4ubL/l2hYjfYg6rV6mdcJ3X7CXK4Vm4KuxtRAjQ9pjCN85YFZ9s3XwRw+69VXV0N
	 LcTGHM6i3tyF45tPv5ofvSOiS1HntFpDVYuYfVVqZrmxhJqcuCExyz5gP3rQu5qCP8
	 2kZQXbf8w6HPRb6xPbgBiaXlMeEzRMVufRjMxckE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 514A5F8025B;
	Fri, 16 Jul 2021 20:30:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE58DF80254; Fri, 16 Jul 2021 20:30:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E30FF8013C
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 20:30:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E30FF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BU0PDKEO"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0628D611AB;
 Fri, 16 Jul 2021 18:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626460207;
 bh=hEPhcR9kwxTFZylD4Y68zysN1eAKX7bLdXZXi+XBFY4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BU0PDKEOL7b1WGwN6VLsvYQ9aXNnLBxJuokkV0U9etfdN7OqKX9ehjBd1FYrm2Mds
 /K0Ng+eelpctxXl98TnOBd3yRBS1gLdeZwcU77XGI6lnYvfXvLJPxkj/FPaN0vZDg3
 cBbI4rkUsUP6ZSYLRJIZyzZL0CpvBuX884p+GOlVxB0GKq7+5uhu+Tuttm2XBSbJN9
 5528PZOh4nqycz6QRsHHLTEMTiFlCLJNqapAZhj9y0OTO7mxweLjsefvthYei75MlB
 IxTPZhX9bJzkadEsu1ehwp331wjNA/OAEtheeL//rR2PBaOzcnbgTjyct33B4/WLf9
 ez1HqtfEQQKYg==
Date: Fri, 16 Jul 2021 19:30:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Subject: Re: [PATCH] ASoC: nau8821: Add driver for Nuvoton codec chip NAU88L21.
Message-ID: <20210716183004.GE4137@sirena.org.uk>
References: <20210701163500.106358-1-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5oH/S/bF6lOfqCQb"
Content-Disposition: inline
In-Reply-To: <20210701163500.106358-1-wtli@nuvoton.com>
X-Cookie: do {
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: YHCHuang@nuvoton.com, alsa-devel@alsa-project.org, KCHSU0@nuvoton.com,
 lgirdwood@gmail.com, CTLIN0@nuvoton.com
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


--5oH/S/bF6lOfqCQb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 02, 2021 at 12:35:00AM +0800, Seven Lee wrote:
> The driver is for codec NAU88L21 of Nuvoton Technology Corporation.

> --- /dev/null
> +++ b/sound/soc/codecs/nau8821.c
> @@ -0,0 +1,1781 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Nuvoton NAU88L21 audio codec driver

Please make the entire comment a C++ one so things look more
intentional.

> +/**
> + * nau8821_sema_acquire - acquire the semaphore of nau8821
> + * @nau8821:  component to register the codec private data with
> + * @timeout: how long in jiffies to wait before failure or zero to wait
> + * until release

So, this driver looks pretty good apart from this semaphore usage which
is both not very clearly documented centrally (in terms of the purpose
and what it's protecting) and just uses semaphores which is generally
unusual and worrying, there's a push to try to eliminate semaphores from
the kernel and replace them with clearer and more appropriate locking
primitives.

My understanding is that the main goal is to avoid any CODEC operations
running while jack detection runs during resume.  I think this could be
done more cleanly by having a completion in the component level resume
function (not the I2C level one) - the core will resume the card in a
thread without blocking the main resume thread used for the rest of the
system which as far as I can tell is what you're trying to avoid
problems with here.  set_bias_level() or a DAPM _PRE widget might also
serve.  You could possibly even just do the resume and redetection from
the CODEC level resume callback and get the effect you're looking for.

It's possible I've misunderstood exactly what the goal is here so that
might not work, if you could clarify what's going on that might help.
It might be easiest to split this into two patches, one for the main
driver then another adding jack detection (and anything else affected by
the semaphore) - that way the main driver can be reviewed and hopefully
merged quickly while we figure out what's going on with the jack
detection bit.

Otherwise this looks good, a few small issues but nothing major:

> +static int nau8821_digital_mute(struct snd_soc_dai *dai, int mute, int direction)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
> +	unsigned int val;
> +
> +	val = mute ? NAU8821_DAC_SOFT_MUTE : 0;

Please use normal conditional statements to improve legibility.

> +static int nau8821_component_probe(struct snd_soc_component *component)
> +{
> +	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
> +	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
> +
> +	nau8821->dapm = dapm;
> +
> +	snd_soc_dapm_sync(nau8821->dapm);

The core should sync everything at the end of card bringup, no need to
do that in the driver.

> +		"nuvoton,jkdet-enable");
> +	nau8821->jkdet_pull_enable = device_property_read_bool(dev,
> +		"nuvoton,jkdet-pull-enable");
> +	nau8821->jkdet_pull_up = device_property_read_bool(dev,
> +		"nuvoton,jkdet-pull-up");
> +	ret = device_property_read_u32(dev, "nuvoton,jkdet-polarity",
> +		&nau8821->jkdet_polarity);

These properties need a DT binding document.

> +static void nau8821_init_regs(struct nau8821 *nau8821)
> +{
> +	struct regmap *regmap = nau8821->regmap;

> +	/* Disable Boost Driver, Automatic Short circuit protection enable */
> +	regmap_update_bits(regmap, NAU8821_R76_BOOST,
> +		NAU8821_PRECHARGE_DIS | NAU8821_HP_BOOST_DIS |

I'd expect the boost driver disable and some of the other stuff like DAC
disable to be done automatically by DAPM.

> +	/**/
> +	regmap_update_bits(regmap, NAU8821_R13_DMIC_CTRL,

Missing comment?

> +	/* Pull up IRQ pin */
> +	regmap_update_bits(regmap, NAU8821_R0F_INTERRUPT_MASK,
> +		NAU8821_IRQ_PIN_PULL_UP | NAU8821_IRQ_PIN_PULL_EN |
> +		NAU8821_IRQ_OUTPUT_EN, NAU8821_IRQ_PIN_PULL_UP |
> +		NAU8821_IRQ_PIN_PULL_EN | NAU8821_IRQ_OUTPUT_EN);

Should this be a device property?

> +	ret = devm_snd_soc_register_component(&i2c->dev, &nau8821_component_driver,
> +		&nau8821_dai, 1);
> +	pr_err("%s exit ret:%d\n", __func__, ret);
> +	return ret;

Remove the pr_err(), guess it's just leftover debugging.

> +static int nau8821_i2c_remove(struct i2c_client *client)
> +{
> +	return 0;
> +}

This is empty so can be removed.

--5oH/S/bF6lOfqCQb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDx0CsACgkQJNaLcl1U
h9C+WQf9FHkEidq3asIIpk/bf/lZLbohxVueYLuwF8MirWLRVmrEVI9WZjACOqce
F9ZXwJBrmBQ8I/ZQzgPdDH7cXSTT4pR3TxjXNEj5/PmV5Z58vFbvi8MUZfmoa53r
u6MuTOemGulIqhv3MHIMt2UVBtU4JlDYSEy+/Zc/clY5v5JjlvZEhwpp48IyPNW1
EuMuaX51mfG/lODCIK9gbG9AgJkq2zBLdLvEX9VPQFMWsyCvWIzfEu3rTLGBkTJ7
+NMQCVSIBI911E3wRbScUQSfZg033EnP7VDDBTsvrvO6f0gwH/VANWQgPDhX9M3B
XeMk4tzV/Ma9rTpACB8QP8JoDaRbnQ==
=me/t
-----END PGP SIGNATURE-----

--5oH/S/bF6lOfqCQb--
