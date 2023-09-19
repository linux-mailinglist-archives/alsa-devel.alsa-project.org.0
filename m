Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9D27A61F3
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 14:02:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F063DF6;
	Tue, 19 Sep 2023 14:01:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F063DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695124929;
	bh=OpELln9bev7YvFyQlfCT6PlWHWOFke53iFI6V2uit4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Hbo+DLPjCp8/Kr+PEVw1a0p2ApG0ZQhBg85DqgSZeMY5vJfPYKLUG13nJUUMZGnqZ
	 7+eJBlr6XQVU7gl8x5dEpq+Q2ZHHhsp1Z6ys+xEdKsHTWgx4FnICU+U3Y/saJTYB6D
	 xDWGaGoWBMDVlAEK7ryTLshMp6rlI5c5bnfBNUro=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BB29F80558; Tue, 19 Sep 2023 14:01:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6B4FF801F5;
	Tue, 19 Sep 2023 14:01:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 273F7F8025A; Tue, 19 Sep 2023 14:01:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2667F80124
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 14:01:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2667F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NILdUKDq
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 0B3A0CE12EB;
	Tue, 19 Sep 2023 12:01:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9699C433C8;
	Tue, 19 Sep 2023 12:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695124863;
	bh=OpELln9bev7YvFyQlfCT6PlWHWOFke53iFI6V2uit4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NILdUKDq95qBwAzFcvCQo/LlDkLX7WP8wjcRk5Vjp2ZunhQz5YD8xtbAWekSFOXpF
	 oxvo8q4MNu6jEOYdFyaKNJIEIlFYuyQgGcZVtlqPm0GOO/DpxSo7ybjQ4tiLBaF1un
	 RZmaVWq1oVx66YZyHsQWPHJprLaRRBWVvFKrzm8q/8IRF3X6dHtKjcitQYnNbytTjR
	 z91ws9fOrl6UDtJiISUVjTHipAgdb5mhbAHo5IlMtCGlNYp9uUb9NVb+rSvXQAyLX5
	 aUx8wfE46uvzIpeggRvNOE2tdnxFJ0SWE0s6xd/DVY7/5n8ToeKLf9XicUtBUsAgQd
	 gPdb3hNdEGhFQ==
Date: Tue, 19 Sep 2023 13:00:57 +0100
From: Mark Brown <broonie@kernel.org>
To: cy_huang@richtek.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Allen Lin <allen_lin@richtek.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: codecs: Add Richtek rtq9128audio amplifier
 support
Message-ID: <87fbcb86-66a2-48e7-91e1-a4d9a6a46114@sirena.org.uk>
References: <1695086301-10376-1-git-send-email-cy_huang@richtek.com>
 <1695086301-10376-3-git-send-email-cy_huang@richtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7Npoeoz3JwMGZ6EV"
Content-Disposition: inline
In-Reply-To: <1695086301-10376-3-git-send-email-cy_huang@richtek.com>
X-Cookie: You buttered your bread, now lie in it.
Message-ID-Hash: RHKIIZJ7JJBOG5X6S32TYCM3G5GLBZYH
X-Message-ID-Hash: RHKIIZJ7JJBOG5X6S32TYCM3G5GLBZYH
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RHKIIZJ7JJBOG5X6S32TYCM3G5GLBZYH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--7Npoeoz3JwMGZ6EV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 09:18:21AM +0800, cy_huang@richtek.com wrote:

> From: ChiYuan Huang <cy_huang@richtek.com>
>=20
> Add Richtek rtq9128 automotive audio amplifier.

Looks mostly good, a few minor points below:

> --- /dev/null
> +++ b/sound/soc/codecs/rtq9128.c
> @@ -0,0 +1,742 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2023 Richtek Technology Corp.

Please make the entire block a C++ comment so things look more
intentional.

> +static const struct regmap_config rtq9128_regmap_config =3D {
> +	.name =3D "rtq9128",
> +	.reg_bits =3D 8,
> +	.val_bits =3D 32,
> +	.val_format_endian =3D REGMAP_ENDIAN_BIG,
> +	.cache_type =3D REGCACHE_RBTREE,

_MAPLE is a better choice for most devices these days.

> +	SOC_ENUM("CH1 SI Select", rtq9128_select_enum[0]),
> +	SOC_ENUM("CH2 SI Select", rtq9128_select_enum[1]),
> +	SOC_ENUM("CH3 SI Select", rtq9128_select_enum[2]),
> +	SOC_ENUM("CH4 SI Select", rtq9128_select_enum[3]),
> +	SOC_ENUM("PWM FREQ Select", rtq9128_select_enum[4]),
> +	SOC_ENUM("OUT2 Phase Select", rtq9128_select_enum[5]),
> +	SOC_ENUM("OUT3 Phase Select", rtq9128_select_enum[6]),
> +	SOC_ENUM("OUT4 Phase Select", rtq9128_select_enum[7]),

Don't use an array of enums with magic numbers like this, it's hard to
read and maintain.  Use individually named variables instead.

> +	/* Turn channel state to Normal or HiZ */
> +	ret =3D snd_soc_component_write_field(comp, RTQ9128_REG_STATE_CTRL, mas=
k,
> +					    event =3D=3D SND_SOC_DAPM_POST_PMU ? 0 : 1);

The ternery operator could just be !=3D here.

--7Npoeoz3JwMGZ6EV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUJjXgACgkQJNaLcl1U
h9Cuugf/eZq0WTD3pnVLm57qMfUiKuc1Ub+ozSYQ1knH23sEnHvjGq663aFhXJVn
DzCojWZ6j9pmMWgT5wTwes5NQD9BoAki95SNcspfNDdFBkPJSCJhxeqkUZyqktio
BrybUk6DnIiMj+NOeMG4tsOw95H2ZKPgoAaRqJ4mNIgR2T6t1uXjw02AObwbBGue
S8pZFoQbVRB3wiM9GAnVE+9gynNc5tyQLaEIuziVmSnS8roIoKdDnoc8G9pAcEfS
sstV2wn2x9pndsxnLPnqeVwShzn2EZyIlSTsKJ4irxZtk1gkPi1iFE/Zu+lR6cAM
V5Axm6nOKlmfOsQ8Bnguf4BanYsP+A==
=C2S8
-----END PGP SIGNATURE-----

--7Npoeoz3JwMGZ6EV--
