Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 211958FB263
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 14:39:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AD7C852;
	Tue,  4 Jun 2024 14:38:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AD7C852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717504749;
	bh=lVJHLHNYsE9oRKKt5QLX2iFeMRW0g1K6AbDrFmW0Utc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=izLoCPTkJXCnER3NviizkuH5TGWj+F29Rqk3mcQ7+yVnLlJOJIxuj/V9Az9fjw/CZ
	 C52df+iGOSfjOS3hkgbEG10/Pbmw2PRJUNqM6LEveZfdSnDAxJXS/GxEqHHEvkU1UB
	 ALIzzR92bHgIxKhGeW4tyB+XULfZtVtt4sCJDUVA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BCDBF805AE; Tue,  4 Jun 2024 14:38:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8692BF8059F;
	Tue,  4 Jun 2024 14:38:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19960F802DB; Tue,  4 Jun 2024 14:38:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A546CF800FA
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 14:38:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A546CF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JcWguw0u
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 36EF66125A;
	Tue,  4 Jun 2024 12:38:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26534C2BBFC;
	Tue,  4 Jun 2024 12:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717504699;
	bh=lVJHLHNYsE9oRKKt5QLX2iFeMRW0g1K6AbDrFmW0Utc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JcWguw0usNV/5OHzAU6dRWa9FEgFMozv8dwqGQe5ZgtHDf76KRcMVmSy8gVkn/67q
	 CO2Sxjd2A6RuRKsmWLZ7pHAOulgZDKLexCWQdL2FN1krum2BjaYUcSY0B/b7qosURo
	 L0PrrXNzPAOx0rs9Pzw+bdR1qkWPoRBG0FADU5ntrGKP7q7Fkqausleko3rWXSbE/T
	 2iIXMlWkn6jCLDIgwjUqw+5/TryWMgXT632EhKwQvo3ooVMMdycY+LYN7K/MZjfHfx
	 W9Xu8IrWyp/a+ZyIjpZIad4YCqq7Ic1hTXktE5mQN8N4qM4GCHCpKMMfmZyPzFeW6m
	 oxM+O7YCr8Ysw==
Date: Tue, 4 Jun 2024 13:38:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Jack Yu <jack.yu@realtek.com>
Cc: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"lars@metafoo.de" <lars@metafoo.de>,
	"Flove(HsinFu)" <flove@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
	Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
Subject: Re: [PATCH] ASoC: rt1318: Add RT1318 audio amplifier driver
Message-ID: <0c681db6-6a5c-416e-9c60-4b72e2eb172d@sirena.org.uk>
References: <c6d0e09de01c4804bfff6efe92fff04c@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5P6l28pAeS6244U3"
Content-Disposition: inline
In-Reply-To: <c6d0e09de01c4804bfff6efe92fff04c@realtek.com>
X-Cookie: Is it clean in other dimensions?
Message-ID-Hash: X3USNDDGWQHVPQCDPAHTK5ZPBZ7F5PUM
X-Message-ID-Hash: X3USNDDGWQHVPQCDPAHTK5ZPBZ7F5PUM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X3USNDDGWQHVPQCDPAHTK5ZPBZ7F5PUM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--5P6l28pAeS6244U3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 04, 2024 at 06:17:02AM +0000, Jack Yu wrote:

> +static int rt1318_init_put(struct snd_kcontrol *kcontrol,
> +		struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
> +	struct rt1318_priv *rt1318 = snd_soc_component_get_drvdata(component);
> +
> +	rt1318->rt1318_init = ucontrol->value.integer.value[0];
> +
> +	if (rt1318->rt1318_init)
> +		rt1318_reg_init(component);
> +
> +	return 0;
> +}

So this control resets the CODEC - what's the story here?  Really it
should be a boolean, and if you run mixer-test it'll tell you you're not
returning 1 for value changes - please run mixer-test, there are a
number of other errors that it will detect here.

> +static int rt1318_dvol_put(struct snd_kcontrol *kcontrol,
> +		struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
> +	struct rt1318_priv *rt1318 = snd_soc_component_get_drvdata(component);
> +
> +	rt1318->rt1318_dvol = ucontrol->value.integer.value[0];
> +
> +	if (rt1318->rt1318_dvol <= RT1318_DVOL_STEP) {
> +		regmap_write(rt1318->regmap, RT1318_DA_VOL_L_8, rt1318->rt1318_dvol >> 8);
> +		regmap_write(rt1318->regmap, RT1318_DA_VOL_L_1_7, rt1318->rt1318_dvol & 0xff);
> +		regmap_write(rt1318->regmap, RT1318_DA_VOL_R_8, rt1318->rt1318_dvol >> 8);
> +		regmap_write(rt1318->regmap, RT1318_DA_VOL_R_1_7, rt1318->rt1318_dvol & 0xff);

This will happily accept negative values which you probably don't want.

> +	} else {
> +		rt1318->rt1318_dvol = RT1318_DVOL_STEP;
> +		dev_err(component->dev, "Unsupported volume gain\n");

The driver shouldn't allow userspace to spam the kernel log like this,
it can be used to mask issues.

> +static const struct snd_kcontrol_new rt1318_snd_controls[] = {
> +	SOC_SINGLE_EXT("rt1318 digital volume", SND_SOC_NOPM, 0, 383, 0,
> +		rt1318_dvol_get, rt1318_dvol_put),

No need to include the part number in controls, users aren't going to
care.  The general style for ALSA controls is capitalised too.

--5P6l28pAeS6244U3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZfCrYACgkQJNaLcl1U
h9CHEQf8C5ZGXuNfmEjd4QRj6YG1MjrUD3hQR4eaQTGB70zEgmcFrSfGpbYaa37y
VlPA0mgQHZ55YNPflFg1MQcXno9NJEkZgvBUReyfVYkCpHpVyafkPu1aq73wILWQ
KCh46EwF+KqBxkzPsW/cF0Zcg4LtcTzJr91VamrbC28XrJGNTdzCLjEyf1NTrP52
5yPlL715BWN4MUxsgESjz8/kr3IewKDz/tM4L7xHLwEO56XfbEtHUulblAMzbnpg
hW0MkDt/rywc41+eJuxQWIHKhoJFWLsrUnn+9pFEuPoLDCR8m6HrZhQItrdHMw9q
MyN6tUUqiix6ncqE3uLYuQ3DTESjgw==
=rIIz
-----END PGP SIGNATURE-----

--5P6l28pAeS6244U3--
