Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 765E190D4AA
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 16:24:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02A2BDEE;
	Tue, 18 Jun 2024 16:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02A2BDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718720650;
	bh=NM2NcZTrPN/wCkiG7KExZgkQ9Nyur+YPu9CUg8Lt8bw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vUEjxCPFq0Kf2FwKagUuUHx7KZiJqmBSgcJiXnAOV2nBOBboH0XDCOZFSMqhr7u4T
	 w+MuHiX8OPD7qYiu1hL/zsNTv/GySZNjsCZWBiLBS8MJhE9+rOINdAGBpOUfFk4IZV
	 043jXZJasv7q3PNqnCXujCSFWG4phM64TeM3puEE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25F58F80681; Tue, 18 Jun 2024 16:22:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 89539F806AB;
	Tue, 18 Jun 2024 16:22:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C07A4F80266; Tue, 18 Jun 2024 16:20:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7ECFF800ED
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 16:17:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7ECFF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Qn3gL0Uu
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8B84ACE1B3B;
	Tue, 18 Jun 2024 13:56:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B19C3277B;
	Tue, 18 Jun 2024 13:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718718989;
	bh=NM2NcZTrPN/wCkiG7KExZgkQ9Nyur+YPu9CUg8Lt8bw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qn3gL0UuckCbot8/D7UEMsODr3nYgfeP+RaoeQ0EIhGXoQmmYTMKZBKkdQhMwS/OQ
	 rFvIDbK2kFAcLgTW/sg9FZljA7Fz6wBX0YRb77DcfSoeQ06gA9NbgwtjsZpkhz1sHJ
	 guo4dAV4yj1RC68zVvU/KffwhsQJtt9Q29XqBzBZMBM5uPvnIKJtbBCIOOdbNN5JyI
	 sIrfIT3F+XnlmoHWYk77xssm8xYcPHrlLwqRHKUZcbRSYQ4ESxT9+31SuLrbdShE55
	 uhCd9cf7h4ie5Q1QIU9FsoE6R30V0etxP3htW1HJyZv2cex8bIgRrKCg+NUaSm9OWZ
	 BOAwfvJMRVmKw==
Date: Tue, 18 Jun 2024 14:56:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	devicetree@vger.kernel.org, Khanh Le <khanh.le.xr@renesas.com>
Subject: Re: [PATCH v2 1/2] ASoC: Add ak4619 codec support
Message-ID: <69e3d946-ec16-4abd-a51f-309da9cf1d3c@sirena.org.uk>
References: <87frtb3x4k.wl-kuninori.morimoto.gx@renesas.com>
 <87ed8v3x44.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kbTE03bOSalrPnRn"
Content-Disposition: inline
In-Reply-To: <87ed8v3x44.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: If you can read this, you're too close.
Message-ID-Hash: XBO2VKM44JNHQGLQZCONHLCVHHCUO4LN
X-Message-ID-Hash: XBO2VKM44JNHQGLQZCONHLCVHHCUO4LN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XBO2VKM44JNHQGLQZCONHLCVHHCUO4LN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--kbTE03bOSalrPnRn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 18, 2024 at 12:36:43AM +0000, Kuninori Morimoto wrote:

Looks mostly good, a few small nits:

> +static int ak4619_put_deemph(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
> +	struct ak4619_priv *ak4619 = snd_soc_component_get_drvdata(component);
> +	int deemph_en = ucontrol->value.integer.value[0];
> +
> +	if (deemph_en > 1)
> +		return -EINVAL;
> +

We should also check for negative values here, those are also out of
range (many other drivers are buggy).

> +	ak4619->deemph_en = deemph_en;
> +	ak4619_set_deemph(component);
> +
> +	return 0;
> +}

This won't return 1 on change so will miss generating events confusing
some UIs, the mixer-test selftest should notice this and the range check
issue.

> +	/* Only slave mode is support */
> +	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> +	case SND_SOC_DAIFMT_CBS_CFS:
> +		break;
> +	default:
> +		return -EINVAL;
> +	}

Please update for the modern names.

> +static const struct regmap_config ak4619_regmap_cfg = {
> +	.reg_bits		= 8,
> +	.val_bits		= 8,
> +	.max_register		= 0x14,
> +	.reg_defaults		= ak4619_reg_defaults,
> +	.num_reg_defaults	= ARRAY_SIZE(ak4619_reg_defaults),
> +	.cache_type		= REGCACHE_RBTREE,
> +};

Unless there's a specific reason it's probably best to use _MAPLE for
the cache, not that it's likely to make a difference to a driver with
such a small regmap.

--kbTE03bOSalrPnRn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZxkggACgkQJNaLcl1U
h9D6bAf/aBH4/lGmkmhQZa1lwdS4HmW8V7ulCYZyziWIDv7UVFwlXvkDp068dnEQ
YpZzpoaT06ojnJOMOC4M+fJorV7Uqgo6X0oCbjgbWOOJdymNvT1+xpmkMDK2e8Xy
1fho2LzBu5zk25jZ2gDiQSeJEW6T053k9FefGVLygDwAvNDI3hd/s4OrShpuPQk5
Uhx9T+cZodto7GlP0ywa+JTARLicmKJcXPkpg/LNL8tXczXEfUTBXVd7bC6+FwRX
GM4ynZP1gHXKJmPrhNGhB7tPV2Glo04AsTQGrA5gQKj88CQX0VI6Oxw/xVNhm4lC
pOUc/vsJ+xdpMeAMBXQPuy9VD/iKrA==
=wIUq
-----END PGP SIGNATURE-----

--kbTE03bOSalrPnRn--
