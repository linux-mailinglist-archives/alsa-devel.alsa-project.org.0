Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1601262E1
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2019 14:06:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44C4E1614;
	Thu, 19 Dec 2019 14:05:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44C4E1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576760774;
	bh=CqnRn6gvtQzW9EsB5qRyfc7QMwHPlawENQV9Tmfc29A=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MSdZjx8/634dO8oDYpURiTPdyOrd+RiADmvBNVkNIMjxiRgQHJ72FKjEyk1L1b9hw
	 Cf1Fdf6895rAst50sjJAPpOL/BauSh9kPKG7mEXniNBTHorpFGN7kM5r9v4HYcCvtk
	 KEe/70aVKPYHiZx0EZpM3xkKuDLIcJhQEXTmyIxI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 021FFF80218;
	Thu, 19 Dec 2019 14:04:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E441F80234; Thu, 19 Dec 2019 14:04:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 8EFECF8014F
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 14:04:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EFECF8014F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D30231B;
 Thu, 19 Dec 2019 05:04:23 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE8113F719;
 Thu, 19 Dec 2019 05:04:22 -0800 (PST)
Date: Thu, 19 Dec 2019 13:04:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20191219130421.GD5047@sirena.org.uk>
References: <20191219100328.14850-1-srinivas.kandagatla@linaro.org>
 <20191219100328.14850-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20191219100328.14850-3-srinivas.kandagatla@linaro.org>
X-Cookie: I smell a RANCID CORN DOG!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 spapothi@codeaurora.org, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, vkoul@kernel.org
Subject: Re: [alsa-devel] [PATCH v9 2/2] ASoC: codecs: add wsa881x amplifier
	support
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
Content-Type: multipart/mixed; boundary="===============3899574895103418956=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3899574895103418956==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5gxpn/Q6ypwruk0T"
Content-Disposition: inline


--5gxpn/Q6ypwruk0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 19, 2019 at 10:03:28AM +0000, Srinivas Kandagatla wrote:

> +#define WSA881X_PA_GAIN_TLV(xname, reg, shift, max, invert, tlv_array) \
> +{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
> +	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
> +		 SNDRV_CTL_ELEM_ACCESS_READWRITE,\
> +	.tlv.p = (tlv_array), \
> +	.info = snd_soc_info_volsw, .get = snd_soc_get_volsw,\
> +	.put = wsa881x_put_pa_gain, \
> +	.private_value = SOC_SINGLE_VALUE(reg, shift, max, invert, 0) }

The get operation isn't going to work here...

> +
> +static struct reg_default wsa881x_defaults[] = {
> +	{WSA881X_CHIP_ID0, 0x00},

Spaces around the { } please.

> +	unsigned int val = 0;
> +
> +	regmap_read(rm, WSA881X_CHIP_ID1, &wsa881x->version);
> +	regmap_register_patch(wsa881x->regmap, wsa881x_rev_2_0,
> +			      ARRAY_SIZE(wsa881x_rev_2_0));
> +	/* Enable software reset output from soundwire slave */
> +	regmap_update_bits(rm, WSA881X_SWR_RESET_EN, 0x07, 0x07);
> +	/* Bring out of analog reset */
> +	regmap_update_bits(rm, WSA881X_CDC_RST_CTL, 0x02, 0x02);
> +	/* Bring out of digital reset */
> +	regmap_update_bits(rm, WSA881X_CDC_RST_CTL, 0x01, 0x01);

Please add some blank lines before the comments for legiblity.

> +static int wsa881x_put_pa_gain(struct snd_kcontrol *kc,
> +			       struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *comp = snd_soc_kcontrol_component(kc);
> +	struct wsa881x_priv *wsa881x = snd_soc_component_get_drvdata(comp);
> +	struct soc_mixer_control *mc =
> +			(struct soc_mixer_control *)kc->private_value;
> +	int max = mc->max;
> +	unsigned int mask = (1 << fls(max)) - 1;
> +
> +	/*
> +	 * program actual register just before compander enable and ensure hw
> +	 * sequence is followed
> +	 */
> +	wsa881x->pa_gain = (max - ucontrol->value.integer.value[0]) & mask;
> +
> +	return 0;
> +}

...this doesn't actually write the value to the register map but we're
using the standard get operation to read the value so the readback will
not show the new value until it happens to get written out to the chip.
This will also silently ignore volume updates until whatever event
triggers the write, I'd expect at least an error if we can't do a write
while the relevant part of the chip is active.

> +			usleep_range(1000, 1010);
> +			wsa881x_ramp_pa_gain(comp, min_gain, max_gain);

The ramp function has exactly one user, may as well just inline it.

--5gxpn/Q6ypwruk0T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl37dVQACgkQJNaLcl1U
h9Awdwf9H+eExALOcQ6fFGoptlARVI5OKmI2m0LHjxYOvilWZXAniiCP8VRMwXCC
QBJBOZSLOnXYqWZGVXwBejtbUnS5oP2yQFnW89dDLMnf2A84Jm2Jg/ZOCP7taKVN
AFDQ8RRacoVz8IlZhcfRi8pbGxA4KOI97igvjSpMg9CtfP8JAXHZ23F4R3xO/bpn
o4wR/JJFMEAy5Udctd2M4AdYEv4cULHEuX7JwJv8dP/YO1GxNElIq4nRJJzGXZh1
iqal7nkc8oqqvjvqZ2PXQTAh9yjX5EpltFYhJuBEzQsnike7urk38ciO6FGYBe/G
/Uex/KK6saSMnfR8PSSA+df4jaZHJQ==
=0NEb
-----END PGP SIGNATURE-----

--5gxpn/Q6ypwruk0T--

--===============3899574895103418956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3899574895103418956==--
