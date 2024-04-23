Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 582868ADCFE
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Apr 2024 06:58:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF18314FD;
	Tue, 23 Apr 2024 06:58:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF18314FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713848329;
	bh=qXitjcyEJ7p33jBDviR8BQEzowXFVz33BTOYRa6lPLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lTGAcT4bDAwoaURH6iMy4lNEedB6aWhTpuhAQG3l0ejefjsQY1HXQJ5J2ZnSm5Pw8
	 j5JYXaMQURNUb9sMyBjOFZ2DXIuunPdHm1p9pO4/3Xf+KF9bwnKhA4lRrXu3h8/HEH
	 3dwdtktYFo8dwbqLKW3Ie6Z815+rRqsMBTeNu3Ss=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE9B8F8057C; Tue, 23 Apr 2024 06:58:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DFCFAF8059F;
	Tue, 23 Apr 2024 06:58:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14C9EF80423; Tue, 23 Apr 2024 06:55:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F16CAF801C0
	for <alsa-devel@alsa-project.org>; Tue, 23 Apr 2024 06:55:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F16CAF801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ahwdBS75
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 39BAACE0E33;
	Tue, 23 Apr 2024 04:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6CD6C116B1;
	Tue, 23 Apr 2024 04:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713848095;
	bh=qXitjcyEJ7p33jBDviR8BQEzowXFVz33BTOYRa6lPLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ahwdBS75uZK6JT6ywphZzfnVtJVLB1GWjaXCtQLIC9jncGr/vBTMwQkQtDQDsXsMg
	 pRE/i8AuRmwrf6bfONAm2/CcEsfyRSu32oUF4Hsx9nRS/IVziMRWKU92MCNeZTl8w8
	 Ib1cu+fQCpQ/7fVGBN7B5D2JIFCPUp+82qnb7Rl6GTbqROqu0RznUxHJyel+oUI6tZ
	 9kjaqVurE48Y7RaPkSbVqDWPQgqg06Zt1cln0Vh2mZNLurUny2azrVPgxXG9gLN1vy
	 W0GDiI8I1whVEZLEbBDr7cfissBVxOr3syJb1TSnO4+xpjcQlvBUrRnWuMmJAllqZM
	 t17yrR3DbRwTQ==
Date: Tue, 23 Apr 2024 13:54:51 +0900
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>
Subject: Re: Missed review / mailing list submission?
Message-ID: <Zic9FJllBhOVtWr3@finisterre.sirena.org.uk>
References: 
 <CAHp75Vf36mOsHCMH2bPCew-7e75SjMQVqxKR4CU+BV1oQPiHmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="un+0FqIHVsBPuVO0"
Content-Disposition: inline
In-Reply-To: 
 <CAHp75Vf36mOsHCMH2bPCew-7e75SjMQVqxKR4CU+BV1oQPiHmA@mail.gmail.com>
X-Cookie: TANSTAAFL
Message-ID-Hash: J7LK43KMYJ4U5QVNXGHUTDPQSJ37YGAV
X-Message-ID-Hash: J7LK43KMYJ4U5QVNXGHUTDPQSJ37YGAV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J7LK43KMYJ4U5QVNXGHUTDPQSJ37YGAV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--un+0FqIHVsBPuVO0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 22, 2024 at 09:28:45PM +0300, Andy Shevchenko wrote:

> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?h=asoc-6.10&id=710f9a3673d6839c485d6a1cd59a2b5078092d47

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

For the benefit of those playing at home (or like me, on a high speed
train) this is the PCM6240 driver.

> I can't find this in the mailing list.

That was like v9 or something, as you later noticed it's been on the
list over a very extended period with many revisions - there has been a
more than adequate opportunity for review here (Pierre did a bunch for
example).

> Moreover, it has an obstacle to be applied, i.e. as per
> https://elixir.bootlin.com/linux/v6.9-rc5/source/include/linux/gpio.h#L5
> the gpio.h must not be included in a new code and brief looking into
> that driver shows that legacy APIs are being used without _any_ good
> reason.

> This has to be fixed (by the author).

Or someone else, for example you could do it if you were so moved.  You
haven't even CCed Shenghao here...  please at least send a mail to him
explaining the issue.

--un+0FqIHVsBPuVO0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYnPxgACgkQJNaLcl1U
h9BYQwf8Dw74+d8TminaOdyz85niIPVfQweLqAatH74Z8H8ooHgmA7ufWy4FCM85
IvBEtQ4P9EYE9RblTB3UxCKEjmQ/xu+dbmTE4yxERKmDFF46xy6sGTROWB+dnCMV
DghetV4ch4fQwnWJVFhsD3QoPGj+IDoAhJacKUwh1We5C0FQXe0DaekW6dZhNit4
N2JYf/29mo6Qj6gQ+IQ04+sjf2aUfGR4xyRvnqtYhFg3dmhNPZG0IUU+vuvgP6Bp
3HLJ2KmY7QYWxY31S+ArtRpGQOMnl64Cs2pwihyjPb1mWySULa4gn9Y95KOcxcpd
xW4IYOpiaFpX2hfsQsRDPoGL2ktbWQ==
=Kbs8
-----END PGP SIGNATURE-----

--un+0FqIHVsBPuVO0--
