Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D03B496F56E
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2024 15:33:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51410A4D;
	Fri,  6 Sep 2024 15:33:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51410A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725629591;
	bh=jPQMwo2WkKJKXe6v7Il4chHkFsl4n5PuJaD7noNAQyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hmbQyJYwWTEGQa0Cy8GjPhD9YnPxl06w1rkeUQETO7aGhcucZ6c04WOWXcwm4KJs0
	 +4wXZxsSUM9tqwML+skK6mHjRzC1eC5WcZEYUpAMLKPslazRiLC+VJnMJqWPXHRGh9
	 n76p7jWR/eQtD1rAk+yxaj2XkCMGbNUw3ubk9SmA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C7D8F805A8; Fri,  6 Sep 2024 15:32:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 065C3F805B1;
	Fri,  6 Sep 2024 15:32:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93023F8016C; Fri,  6 Sep 2024 15:32:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E28EF80107
	for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2024 15:32:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E28EF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OXNLGZ+n
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4B51BA44F4D;
	Fri,  6 Sep 2024 13:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24896C4CEC4;
	Fri,  6 Sep 2024 13:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725629551;
	bh=jPQMwo2WkKJKXe6v7Il4chHkFsl4n5PuJaD7noNAQyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OXNLGZ+nH5U9TTxNaaAOiUj5t/kdUlH0S0qzq736x6URBmi7KC4GJBnclZ8kX6L1c
	 EKxUBA2jW/C68E0Dp/vNyYZyL0Ed42nL0iL4IvBmmBuSzZ7UaWLFsOSA3ogRDfuk7K
	 QJhLJ9cZNaHvXC5hVdFNxwGIZxqJNIzf7sbKRbsvCReFvTsmiqW70G6rhCoiJGBJYh
	 gnLF7edxp+9Kg84ioAPNWRtIwlXRggfYp5eLQu4uysKYZU6KEep8fYxD5mUATINB2P
	 EJnVIm+cIs0+8F4Ue0M5rFmdJFjy7tCc0r5Hor5mkbsIV0T2dZPWYDDuIocpNsss+f
	 ao10l0MKZ1QSg==
Date: Fri, 6 Sep 2024 14:32:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: How to handle complex Codec2Codec
Message-ID: <ZtsEZmOAsgaPnlti@finisterre.sirena.org.uk>
References: <8734moq6ca.wl-kuninori.morimoto.gx@renesas.com>
 <31fb2975-4a27-43e5-b9cb-37db3206f5f3@sirena.org.uk>
 <87ed62ogvp.wl-kuninori.morimoto.gx@renesas.com>
 <fe428f02-3eca-4dce-9eef-675cf3e56831@sirena.org.uk>
 <87plpikfgv.wl-kuninori.morimoto.gx@renesas.com>
 <aeb9d0e9-ac50-40c4-88dd-30cfa164d7c8@sirena.org.uk>
 <87seudr89e.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="suCKr30lQO5L7R9u"
Content-Disposition: inline
In-Reply-To: <87seudr89e.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Your love life will be... interesting.
Message-ID-Hash: O4MQMAMLVA32VHNCMEOJQQNJFOO4O4BT
X-Message-ID-Hash: O4MQMAMLVA32VHNCMEOJQQNJFOO4O4BT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O4MQMAMLVA32VHNCMEOJQQNJFOO4O4BT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--suCKr30lQO5L7R9u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2024 at 11:27:41PM +0000, Kuninori Morimoto wrote:

> > Yeah, at a super high level we want to be able to handle digital audio
> > with DAPM like analog audio, the main thing is we'd need to propagate
> > digital parameters along as well as just on/off status, and support
> > conversions.

> Very rough speaking, we don't want to break existing connections
> (normal, DPCM, Codec2Codec, etc), and enable to use new style right ?
> Let's name current style as PCMv1. I think we want to grouping related
> things into one place, let's say soc-pcm.c, in roughly.

Well, long term we'd want to remove DPCM and CODEC 2 CODEC but kind of I
think.

> And make new style (PCMv2) at soc-pcm2.c, for example.
> Then, we can swtich v1 or v2 somehow, like below ?
>=20
> 	-------- soc-pcm.c -----
> 	struct pcm_connection pcm1_connection =3D {
> 		.ver =3D 1,
> 		.new_pcm =3D soc_new_pcm,
> 		...
> 	};
> 	-------- soc-pcm2.c -----
> 	struct pcm_connection pcm2_connection =3D {
> 		.ver =3D 2,
> 		.new_pcm =3D new_pcm,
> 		...
> 	};
> 	-------- soc-core.c -----
> 	if (ver =3D=3D v1)
> 		connection =3D pcm1_connection
> 	else (ver =3D=3D v2)
> 		connection =3D pcm2_connection
>=20
> -	ret =3D soc_new_pcm(rtd, num);
> +	ret =3D connection->new_pcm(rtd, num);

It's not clear to me if we'd need to specify things as an explicitly PCM
link, or if we'd be able to just use a DPCM route to link things and
then have be able to automatically configure the digital bits based on
capabilities of the things being linked.  We would need to provide a lot
more information on the things being connected in order to do that, and
some of them would need digital operations.  Ideally we'd be able to do
things in such a way that we can transparently transition the
implementation used for simpler existing boards without requring them to
be rewriten if they're not using one of the more complex things like
DPCM that we're trying to replace.

> We can create PCMv3, v4, v5... in the future if existing connection
> style was not good enough. ... well... this is almost "ideal" ;P

Doing things as described above means that there's much less information
in the individual drivers, just descriptions of what's connected to what
as much as possible.  To a certain extent the fact that that's not the
case is kind of the problem we're trying to solve here.

--suCKr30lQO5L7R9u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbbBGUACgkQJNaLcl1U
h9BvDAf/QWiThK+TUmbZll6yKG45tV1g/CaUP1WdgXYJksQ70iMArpI/eAICr+bj
cBJGfhFKQTitP8SMdGcv2wsgFO9rfB/jQtSaXUrE8deO06YeP7ensmS3+rJ2TEOm
D72xZHpWFJdu3PEoVNfgPgOqeZlKM3p4iZDXvRlP4BGSyXI3WYNtZEfPkxP5n07a
rQpVsu7V0pUGGhSaK58/D3bTDv7glz25X9LC+dqv0l2kBereHg8SFZMXoQ1sxjUP
ED0Xj7sYeKii25Qwo4FV/mSzNUyPwf7RK2//bEAty1yfwI8UVeTVVYWM8hmT3hrN
0Isfooj34zdhYWanaaqUZrD1g0/RwA==
=0rkv
-----END PGP SIGNATURE-----

--suCKr30lQO5L7R9u--
