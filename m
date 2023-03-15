Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CD06BBAC9
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 18:24:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 160AF12E3;
	Wed, 15 Mar 2023 18:23:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 160AF12E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678901071;
	bh=lZzlwc8zxhH5APWyxDGhl29gy/xswlLs6jHeP/9s9CQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GiKR8UR5eZ3otfbOTrT0tVZ9xOCXGaZH1eSFgft6cK7wiGrh2QHb50tm9ByNjtvb9
	 GqPl9MpXau6eco7XBJkvtoR3q0cpfJpv5Iu5kbZFMb8Y/9D0gZuQ3omD/36sxhwKPU
	 qiaQ1LKwTbHHYsWjZbTCrlUau+0yNaeqWL7DUFjc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94047F8032D;
	Wed, 15 Mar 2023 18:23:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78FF1F80423; Wed, 15 Mar 2023 18:23:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1EAA8F8016C
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 18:23:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EAA8F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Zhw7gdgZ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5983861E0C;
	Wed, 15 Mar 2023 17:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CDC8C433D2;
	Wed, 15 Mar 2023 17:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678901007;
	bh=lZzlwc8zxhH5APWyxDGhl29gy/xswlLs6jHeP/9s9CQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zhw7gdgZrCnWPxSr7oUS5S/WrEL54N4ttNzpLMxlEupQaMf/8X07/zypAomHd4xRv
	 WQ0h/O1O8Ej1+RXQIboKgA1as9ZS6xLh6YozEakQ8/m+eYMKodJsNdQCb8xCv/1CTo
	 eKQxoJLix9BCvBYO0cH7Rgw2CGt/7n0p1e7d0deBAD/dZBaf/N9lZK5qjKObqUozQ/
	 PLLR6PYyA8H8owJsg649Utwn0EYl8kAtdmY4HAqDtWVw2dX0V1a7bgHzzQTBe138Px
	 4mS/2yqHTHsGiKDwa/K8tPf0T/dqvUuuueZSVv98izSfgnlL24ZQdWgeii5zUgtl6O
	 NoF60pOcq64Yw==
Date: Wed, 15 Mar 2023 17:23:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 000/173] ALSA/ASoC: Convert to platform remove callback
 returning void
Message-ID: <17d833f6-5e7c-4016-9dd5-0305891fddc2@sirena.org.uk>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w0iTOIre5qqfOwqq"
Content-Disposition: inline
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
X-Cookie: "Speed is subsittute fo accurancy."
Message-ID-Hash: W6HHVVT5OKVUF36KLDCFDHOJVRPOKBP6
X-Message-ID-Hash: W6HHVVT5OKVUF36KLDCFDHOJVRPOKBP6
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W6HHVVT5OKVUF36KLDCFDHOJVRPOKBP6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--w0iTOIre5qqfOwqq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 15, 2023 at 04:04:52PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> this series adapts the platform drivers below sound/ to use the .remove_n=
ew()
> callback. Compared to the traditional .remove() callback .remove_new() re=
turns
> no value. This is a good thing because the driver core doesn't (and canno=
t)
> cope for errors during remove. The only effect of a non-zero return value=
 in
> .remove() is that the driver core emits a warning. The device is removed =
anyhow
> and an early return from .remove() usually yields a resource leak.

ALSA and ASoC patches generally get applied to separate trees so it's
probably better to send them separately unless there's dependencies.

--w0iTOIre5qqfOwqq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQR/woACgkQJNaLcl1U
h9AhgAf+MTzClnX6ns6A/tE6OTTK1UxRi2zF6yVfdY3gQ+he/3yG6hkUSuj0aOYq
WO6a9hJnxcrNovIlL2cKS2aoR2MPGx7cJB6meOIELfb2tBn19YrpUzrJR7jGM6VU
cHMpfsRRd1NyD76HnK3HSu+ga77wjY3SfS3x9hlXNmGpLicH0ZzxOJ4C1TYfxp/J
JaoZlC1l9NoGNmXZOlPn0pYuj52hMQ593H2XPi2EiPHV4L3yqH5j/mEosMYgu0OF
pbLWoiuDv2kfrJJz+zFnH/W8kPC6g1nF3ODWWIHB7a9/AWcweWnDRdW4hrFWc3JZ
UTuGD77igL+MxQbe0a0PxfbeJ9O5yQ==
=SWHL
-----END PGP SIGNATURE-----

--w0iTOIre5qqfOwqq--
