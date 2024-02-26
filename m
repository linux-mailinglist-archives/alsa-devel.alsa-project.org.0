Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB0E867FBA
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Feb 2024 19:23:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFBCAA4B;
	Mon, 26 Feb 2024 19:22:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFBCAA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708971788;
	bh=4HJ7QZmEzbiNDw8RgLII/RxxXuOFtD7S2+44xweOYmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UI2v2Y1G6i9ST2R6I7xaVwNRxyXZnrT3Kq8JyatC7oi1UTsh3/HjOLG3ZGIq4YIOd
	 /IM3XGnQsSgjwxPs5lfIyydSQBigPhYrE7QWzaiWm3Nt8nbb95nLpgcAlBU4hoxFtT
	 xZpI6hllWycdef2F5RBg2v9je0pt6fRAVGAUZ9K0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C63C6F80578; Mon, 26 Feb 2024 19:22:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D2A1F80571;
	Mon, 26 Feb 2024 19:22:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FC8FF80212; Mon, 26 Feb 2024 19:22:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 855B6F80087
	for <alsa-devel@alsa-project.org>; Mon, 26 Feb 2024 19:22:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 855B6F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LZ3F9cbz
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ACE33CE0228;
	Mon, 26 Feb 2024 18:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8CAEC433F1;
	Mon, 26 Feb 2024 18:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708971743;
	bh=4HJ7QZmEzbiNDw8RgLII/RxxXuOFtD7S2+44xweOYmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LZ3F9cbzquR4xcLD4TKdKi4927TF5ehMsNCkIqhYOPGGwQVrRbAMPobMeas7b2wNH
	 LQMLxJ0hlg4PmegcHtr+Hn+cLJGKrIQhGg3FDPXt2HUOrlxCDGDp/czNj7v3OezWNY
	 AFSmaPintXCFy5TLf5GKEvn/5cYT/FYdn5WFCIk8HPsGtm6c86odb82poAA0rfn7VG
	 oricTtk4K/kYGJ55NRWPYdjwVr56KErmzQAQ/C5/vY4H2FSTdlfJYPKR4dcBU3EqLj
	 9Z796+S9Sq74IDc4vXs84uLUHPbCAKZkkSemf+rKTLO/2kiJKhlso38WM3XiXB28Qf
	 njW8zL+z6mCqA==
Date: Mon, 26 Feb 2024 18:22:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 6/6] ASoC: meson: axg-fifo: use FIELD helpers
Message-ID: <33629de8-df96-43d6-864c-a5a3f022edae@sirena.org.uk>
References: <20240223175116.2005407-1-jbrunet@baylibre.com>
 <20240223175116.2005407-7-jbrunet@baylibre.com>
 <a828b4f7-282b-4b83-9a64-04557edf9b6a@sirena.org.uk>
 <1j4jdvdr5l.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q+5S/qvXOwv2kElV"
Content-Disposition: inline
In-Reply-To: <1j4jdvdr5l.fsf@starbuckisacylon.baylibre.com>
X-Cookie: Walk softly and carry a BFG-9000.
Message-ID-Hash: TWWGOMSZH3O24ELCF4TNEDZG4BDHOEAJ
X-Message-ID-Hash: TWWGOMSZH3O24ELCF4TNEDZG4BDHOEAJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TWWGOMSZH3O24ELCF4TNEDZG4BDHOEAJ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--q+5S/qvXOwv2kElV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 07:15:41PM +0100, Jerome Brunet wrote:
> On Mon 26 Feb 2024 at 15:42, Mark Brown <broonie@kernel.org> wrote:

> > /build/stage/linux/sound/soc/meson/axg-fifo.c:207:18: error: implicit d=
eclaratio
> > n of function =E2=80=98FIELD_GET=E2=80=99 [-Werror=3Dimplicit-function-=
declaration]
> >   207 |         status =3D FIELD_GET(STATUS1_INT_STS, status);
> >       |                  ^~~~~~~~~
> > cc1: all warnings being treated as errors

> Ah, I forgot to include <linux/bitfield.h>. Thanks for letting me know.
> I'll fix it

> It was fine when I tested with ARCH=3Darm64 and the default defconfig so
> most likely it got indirectly included.

> Could you tell me which ARCH/defconfig triggered this ?

Probably an x86 allmodconfig.

--q+5S/qvXOwv2kElV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXc1tsACgkQJNaLcl1U
h9BbIwf+JQ2bGsvMg1TLmjMB3qUfEiDX/uoTzuiHGbK9XfKSLd4AHucb1y6162Ex
ukDAHzN22nW0mAffn+iCmWGhOsbi+omeXSurpDUhBprtLom8EdU/XW1sR0jZTyDm
p/o08Ymm7Hi1ZkqkBcEZUPbeWQNJJZ2nCkJ36CRYZsn4Ewu+k4sJgyQqeIEXL3aR
DB5mYXLFGggpOhMtboCw/YaDJew7Vv43z5zdx26jiBpb9RN7GBRrlZ+7qW8te6t7
qmKPnN81WszZRoS36MkLArodIeUwbbxPDZg2g8RLUPbUmLFF2EuYVNejbCHxyuy5
OUseW/HQKoPkQfWc9v9ZFR/QNmtYBg==
=bRmR
-----END PGP SIGNATURE-----

--q+5S/qvXOwv2kElV--
