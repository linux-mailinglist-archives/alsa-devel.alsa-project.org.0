Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1AE6E78F3
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 13:50:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D3ACEE8;
	Wed, 19 Apr 2023 13:49:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D3ACEE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681904999;
	bh=efh+5H8A8LPK5xRJMGyzwRgk6UCz+rOpyyurbUGxVnU=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l10G2dE/oICCYrZRvrA91gm+SErqaAzJpkdDyAUCTG5if7VV0ojWVEVlO2vEuDXUv
	 5uQ0tngG9lbEnBBBPpmmoenuwKEZ/kJa9kZUBLdw+MnQpsE7qfCCxHpHnB9UjdOB1k
	 M11NYbgYiAek0UQaWNIFqvzzOopiUa1Db9/5/yhE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C76DBF80149;
	Wed, 19 Apr 2023 13:49:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB45FF80155; Wed, 19 Apr 2023 13:49:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E6157F800D0
	for <alsa-devel@alsa-project.org>; Wed, 19 Apr 2023 13:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6157F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ueKXv7GC
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 28C9360B59;
	Wed, 19 Apr 2023 11:49:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA62C433D2;
	Wed, 19 Apr 2023 11:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681904939;
	bh=efh+5H8A8LPK5xRJMGyzwRgk6UCz+rOpyyurbUGxVnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ueKXv7GCVt8yL+hR9TrL41ieTEw9EOTggudjpbcnvuGLR9PLQynL7SaF9EwgXvxwL
	 B2tMPoV/4XZAdf2hsh+8Xb4vdN9y45oRydcsXweJYCOnZf+ccBsAyuzxqqbxp/YIT7
	 xGBrrMt8UXImSd2e1+BBhSIKqz+CmLT5y8QI9I2ZdW1nvapmlWbjBllh4FEU6jOc7C
	 67IKmTQee50YPDrZJMPJLK8dDcD7P+NC/UoXJQm/7qce0ZkUNyRYvAerucuGiExaDc
	 4FPL0O2sRLYMaZAJQpLixvzpYoFVNEsKtnh+6KiA87oWL20wMBYXqYSsstNspu0pL7
	 73j70xlOIUBRw==
Date: Wed, 19 Apr 2023 12:48:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] ASoC: nau8825: fix delay time range check
Message-ID: <c6bc42c6-4a98-4bb6-9639-acf4c2010b68@sirena.org.uk>
References: <20230419114546.820921-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J8zj3FY9iXJVyBa1"
Content-Disposition: inline
In-Reply-To: <20230419114546.820921-1-arnd@kernel.org>
X-Cookie: This is your fortune.
Message-ID-Hash: BUV7V37HBDJ5OISEP66UTMVDRUZ4OGRK
X-Message-ID-Hash: BUV7V37HBDJ5OISEP66UTMVDRUZ4OGRK
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, David Lin <CTLIN0@nuvoton.com>,
 Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>,
 Peter Rosin <peda@axentia.se>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BUV7V37HBDJ5OISEP66UTMVDRUZ4OGRK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--J8zj3FY9iXJVyBa1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 01:45:39PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> clang points out that the recently added range check is nonsensical:

Someone already sent a patch for tihs.

--J8zj3FY9iXJVyBa1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQ/1SQACgkQJNaLcl1U
h9D4hgf+NsxxGD7IocXiGwI+ClPVOXKW4Sgiuh+nGdVi2M0/itthwOkgwRP43xZE
eQzzwnqIVyXsCjcBZemgyhbotowwatYmISqVBmscT8TwKLIwJw/lygPainFNqwIE
mhqR81sPysEJPJWFnlkSBpOoao5Cs6a5OqHQrogdiHKVg7OjYI3mGknP+x9mcwaB
wGJZ0u1hb7YyzH7rVN2mkdRC90hiCOm/30GsLQir5XEiSGTbJzUaaJ4BSqYpwD7C
E58q7UUnWI3ITddqAuUGU3W9rKppfHgIi766pw1u1jKxJeXbbqAbXfrMH/nfVBka
RCfCaY1J5pupmlUkUIynLuz6YLT4jw==
=Kwn5
-----END PGP SIGNATURE-----

--J8zj3FY9iXJVyBa1--
