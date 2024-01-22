Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FAD8373B8
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 21:29:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82D3B84D;
	Mon, 22 Jan 2024 21:28:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82D3B84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705955342;
	bh=uN71bCXA30X74Or5WgrlOA05l7pdmTn+Pla2tjReuL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IoxW9jq9Jh+6UsDv5HEEHqoxJZQZH4/6dKvIDXSLvVohmBefy+zkzdOmMElOZt+Pa
	 PVIdMEUP5MbYq0jdVXp34GVsZlJw5OWcrn5gJ704L7PIog25ywK+Y2Hble3VdPv4JF
	 URyEIzQHNiLKwwnX+3xesKMgkK7c9c9pBRhc7NPU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 314C0F8057C; Mon, 22 Jan 2024 21:28:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1D8DF80571;
	Mon, 22 Jan 2024 21:28:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0A36F804E7; Mon, 22 Jan 2024 21:28:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79EC4F802BE
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 21:28:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79EC4F802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OpWIrWI8
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C515461A0A;
	Mon, 22 Jan 2024 20:28:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F62BC43390;
	Mon, 22 Jan 2024 20:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705955292;
	bh=uN71bCXA30X74Or5WgrlOA05l7pdmTn+Pla2tjReuL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OpWIrWI8IvL33sZXeUcci+95ckE29z3Ua0TF4vFRsXSi0rKw5kl/vVirmZDQZMXWO
	 BQsBhzKnIaj4ketTFRUktRInU6T0CA5xBRL9XhQcBCwuPn0McCk7lSW2SauJ1+MbKb
	 FiOS98LPdjjKD8iz7uY5BZvs3wVNBh/Qs8xBESa/SPKJsn6uo8hpFBQ+xFRpOgc2E+
	 tfJuxLVBUJPYdKMke4TbEgYPU67dvPykeLNOf1vjgTYDYmdeQOEU0ivEhG5YJOQX16
	 GYElEYrWLuJ3BgzM+naOhNOznl/B9Rd9tb5acbOR32KrJD9qAKeWHbTN2Yonb6JziD
	 qkwZanZdN4lQQ==
Date: Mon, 22 Jan 2024 20:28:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	robh+dt@kernel.org, conor+dt@kernel.org, YHCHuang@nuvoton.com,
	KCHSU0@nuvoton.com, CTLIN0@nuvoton.com, SJLIN0@nuvoton.com,
	scott6986@gmail.com, supercraig0719@gmail.com, dardar923@gmail.com
Subject: Re: [PATCH 2/2] ASoC: nau8325: new driver
Message-ID: <820c5ff7-4329-46b0-9981-607b1593deb5@sirena.org.uk>
References: <20240122095650.60523-1-wtli@nuvoton.com>
 <20240122095650.60523-2-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QAZjW4H1wKCsCURa"
Content-Disposition: inline
In-Reply-To: <20240122095650.60523-2-wtli@nuvoton.com>
X-Cookie: Nice guys don't finish nice.
Message-ID-Hash: XUPYMXXBHMBLSJFRVZVIFAI32SR62RL2
X-Message-ID-Hash: XUPYMXXBHMBLSJFRVZVIFAI32SR62RL2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XUPYMXXBHMBLSJFRVZVIFAI32SR62RL2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--QAZjW4H1wKCsCURa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 22, 2024 at 05:56:50PM +0800, Seven Lee wrote:

> +++ b/sound/soc/codecs/nau8325.c
> @@ -0,0 +1,896 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * nau8325.c -- Nuvoton NAU8325 audio codec driver
> + *

Please use a C++ comment for the whole block to make things look more
consistent.

> +static int nau8325_clkdet_put(struct snd_kcontrol *kcontrol,
> +			      struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct soc_mixer_control *mc =
> +		(struct soc_mixer_control *)kcontrol->private_value;
> +	struct snd_soc_component *component =
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct nau8325 *nau8325 = snd_soc_component_get_drvdata(component);
> +	unsigned int max = mc->max, min = mc->min, val;
> +	unsigned int mask = (1 << fls(max)) - 1;

AFAICT this will only work well if max is 1, just hard code that.

> +
> +	val = (ucontrol->value.integer.value[0] + min) & mask;
> +	nau8325->clock_detection = val;
> +
> +	if (nau8325->clock_detection)
> +		regmap_update_bits(nau8325->regmap, NAU8325_R40_CLK_DET_CTRL,
> +				   NAU8325_CLKPWRUP_DIS, 0);
> +	else
> +		regmap_update_bits(nau8325->regmap, NAU8325_R40_CLK_DET_CTRL,
> +				   NAU8325_CLKPWRUP_DIS, NAU8325_CLKPWRUP_DIS);
> +
> +	return nau8325->clock_detection;
> +}

Please use mixer-test to verify that your controls conform to the
expected API, the return value here is not what's expected - it should
be a negative value for an error, 0 for no change and 1 for change.

> +	SOC_SINGLE_EXT("Clock Detection", SND_SOC_NOPM, 0, 1, 0,
> +		       nau8325_clkdet_get, nau8325_clkdet_put),

Shouldn't this be a Switch?

> +	SOC_SINGLE("ALC Enable", NAU8325_R2E_ALC_CTRL3,
> +		   NAU8325_ALC_EN_SFT, 1, 0),

ALC Switch.

> +static int nau8325_powerup_event(struct snd_soc_dapm_widget *w,
> +				 struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct nau8325 *nau8325 = snd_soc_component_get_drvdata(component);
> +
> +	if (nau8325->clock_detection)
> +		return 0;
> +

What happens if someone enables clock detection while things are powered
up?

--QAZjW4H1wKCsCURa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWuz9UACgkQJNaLcl1U
h9BQjgf/QLIx/6Vn2gRBlBNbQfnoOasSe3itaUJwtDJ6sVFgb6jjZT0ZlOww4+rf
TX08tOTbrDHhWqh2RCuxxAFCHG9Uu0TYl46QikJIRfZSP/1dWtdY4dptsv+n5Kgh
UQDmnDiewqFaR4mlDBzgzmeDL+Gfr8L+ucedfTpRpwl7YNv1/Mwubh5U/oDGLGVB
+2O7QQ8OKWpdUW4XRvH3Rdh7GYrtx0YUPn+Yicp7wOnyKg7qs1OEvpTBpAQVPPvT
LpE2I+3swtCjetn2maB+cPUgDcOKL6hu9rIj/alple3YU5ux+il+PiJDlfTD5H1C
XNimTSNbAm/gNjZbrUQbShQj05Upcg==
=+I7g
-----END PGP SIGNATURE-----

--QAZjW4H1wKCsCURa--
