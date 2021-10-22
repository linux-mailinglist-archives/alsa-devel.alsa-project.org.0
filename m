Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA36437699
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Oct 2021 14:16:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F535166F;
	Fri, 22 Oct 2021 14:15:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F535166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634904987;
	bh=NhL3/kKwjIGKMnIemui+WcnYcYW3jZtzLhHNrcrT0+E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DgnnoGprWHBW8exxR40wFT+EZXthv7fbh5QxEgxP2lIE8iZgkDLG2bS4Rz6nM7zkN
	 VzL7yjWBUYxyjK4S7ak56QD9WAWVTrGF7zjBKpcHV3jolXlln2HmJ0IcQ6etyoVxk8
	 Lf47MabozLVffLzSg7heBAyzi2SHaqfM6pekhRNI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79B17F80253;
	Fri, 22 Oct 2021 14:15:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 699D7F80086; Fri, 22 Oct 2021 14:15:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFAECF80086
 for <alsa-devel@alsa-project.org>; Fri, 22 Oct 2021 14:14:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFAECF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EVGlIgE+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D52716103D;
 Fri, 22 Oct 2021 12:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634904895;
 bh=NhL3/kKwjIGKMnIemui+WcnYcYW3jZtzLhHNrcrT0+E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EVGlIgE+MNlJPYGN5KskVQFIqkYKv0x2GzVr7fB6BEKkKoB9c+wJiWxrJp490Hjxy
 0sapeoyHAc1od9rh715RUfOFBJZuEHjC7AJbc7RO97CKzP4odpswXNoAsdc7ldE+Vi
 T1+Q5Ff4EHbrAUvUXAdvnm5/O1uPekaJZtW+oIvLprvirXgGhEs8Q5KyOlRG24Zyqc
 f+gMc2bOxRCQ9slnHqCPA1h5G9p986mx7/dlqPz4kRqRfYdKndvfl8dpzu+AUt0igf
 KXx6S6ICBLDft2RvvNLnMqhlm+QTjHO0/pwQJKmuOh7Xuluv0x37MVsC4U4IGqoPvK
 I0tgBOGUeIh7Q==
Date: Fri, 22 Oct 2021 13:14:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ASoC: cs42l51: improve error handling in cs42l51_remove()
Message-ID: <YXKrPPpfYMoRr/LQ@sirena.org.uk>
References: <20211021103627.70975-1-u.kleine-koenig@pengutronix.de>
 <YXGzkNEUpil9lsdh@sirena.org.uk>
 <20211021205839.mbknjtfwzkjf3brg@pengutronix.de>
 <YXHcTKSJoABKuJ7J@sirena.org.uk>
 <20211022071217.462qrfutxvufqssc@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zCjxSg93wqyNGIm9"
Content-Disposition: inline
In-Reply-To: <20211022071217.462qrfutxvufqssc@pengutronix.de>
X-Cookie: I program, therefore I am.
Cc: alsa-devel@alsa-project.org, David Rhodes <david.rhodes@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, kernel@pengutronix.de,
 James Schulman <james.schulman@cirrus.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--zCjxSg93wqyNGIm9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 22, 2021 at 09:12:17AM +0200, Uwe Kleine-K=F6nig wrote:
> On Thu, Oct 21, 2021 at 10:31:56PM +0100, Mark Brown wrote:

> > The warning is fine so long as there's no action on it but use regular
> > regulator_bulk_disable() since as you youself said force disable is not
> > appropriate here.

> It's just the documentation of regulator_bulk_force_disable() that
> irritates me. It's behaviour is exactly fine. If a user of several
> regulators goes away, it should try to disable all regulators and if one
> fails to disable it's better to the others instead of keeping all
> enabled.

Well, you definitely don't want force disable since it ignores
refcounting and might impact something else sharing the regulator.
You'd want to add a separate function that just ignored errors, though
bear in mind that a lot of datasheets recommend against having the
device partially powered, warning that it may damage the part.

--zCjxSg93wqyNGIm9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFyqzwACgkQJNaLcl1U
h9D9Fwf/aXvw0KzypBHL+cEIsjT+m4wxRrZdOUxZfThpN0Chzw1F/vQZliXv0n3v
MH37Zb72dQHat739C9jsvnpRJb+zEzdDC/QNOQT05TKoad3117Usv2KudNbvcUi/
0vJyzzNgS6nrQpoxPMCCg99LDBzltFXHqWH/JG4wLNlzbm2cwOo+lfDqsMJFLLqO
jLhAvXHp+mIqjNYqhl5RrzIsIVvFLHQB8S68yEYhJv7DW8W/o/1iyIz1EnGvJmyz
tL19gZIPrcJX5wN1twb/rRf0wa+INSSFPKurkGCuu1qPS/NOR0QqC6HvhTU8Xodj
bHc9QTT2r9sX6fkLF0de1R52ZntzQw==
=ehwc
-----END PGP SIGNATURE-----

--zCjxSg93wqyNGIm9--
