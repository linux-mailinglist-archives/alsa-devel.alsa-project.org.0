Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3F2439B46
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 18:13:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B098916CE;
	Mon, 25 Oct 2021 18:12:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B098916CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635178386;
	bh=sgO/yMULZDgchia31sku0GDGJ3Lmp41M6Lw9IM4jwUo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LhwXD7TzjTTUQdH3bGMfXDKuR30DjxkaD+KUmXBO4nM3uOjuYXceKUeq/K/YKf5y7
	 FQPVu0dibq4WR4GMwyA2jAFEv4+3jS9ngh11CH6pMuA2l46YdpH0CdGrMk7b+XXyW/
	 LlMbQIeGsa/ef09ivWvg19ry77nxLRJwpQg36daQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DB2BF80166;
	Mon, 25 Oct 2021 18:11:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEBE0F8025A; Mon, 25 Oct 2021 18:11:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 527A1F80153
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 18:11:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 527A1F80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RJ8EfbXH"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34D6460C41;
 Mon, 25 Oct 2021 16:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635178301;
 bh=sgO/yMULZDgchia31sku0GDGJ3Lmp41M6Lw9IM4jwUo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RJ8EfbXHoS5m/ErCFEAWAN/Wpt215QpxVKmx6LI4DquVUZYepSP5dN6hnujMWKqBd
 A2yoEL/HExMy32HaWP5jRrSBZIc3NWztogodFtTFfBAgz5/BbdO3Hf8oXipfyTl62t
 zWzm+FqnIXJJ/ZeSK7RuqgxXQVTCDAyCTDdShOdJKDx9XvucBiBj6lzm8Se4Ct9aGJ
 zuP8LDwrkEMdEAtTZsnfkfbNEywKJmAHgQm0b+aLev7FsTLUcAtxYwWst6PR8Hpsxo
 g9KLX8/R48S6BVUsgIGz0OPOjW1s+L8CNA4DbTBw0ejMGK2JB3342OLeK0N9w968RY
 0vvJyv9ViNJ/w==
Date: Mon, 25 Oct 2021 17:11:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Ricard Wanderlof <ricardw@axis.com>
Subject: Re: [PATCH 2/2] ASoC: codec: tlv320adc3xxx: New codec driver
Message-ID: <YXbXO1d1XDFwUXqA@sirena.org.uk>
References: <alpine.DEB.2.21.2110041117540.14472@lnxricardw1.se.axis.com>
 <YVsETxqzhZI8Fb6D@sirena.org.uk>
 <alpine.DEB.2.21.2110041716190.14472@lnxricardw1.se.axis.com>
 <YVsu+QMjOQz8pAzY@sirena.org.uk>
 <alpine.DEB.2.21.2110251755410.26101@lnxricardw1.se.axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="1WzhY1iIJc/hoRIB"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2110251755410.26101@lnxricardw1.se.axis.com>
X-Cookie: From concentrate.
Cc: alsa-devel <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>
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


--1WzhY1iIJc/hoRIB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2021 at 06:01:04PM +0200, Ricard Wanderlof wrote:

> I'll add it to the DT configuration, but I can't really see why the havin=
g=20
> an additional runtime control would be a lot of extra work.

> In a completely embedded system where the microphone is part of the=20
> internal design it makes sense not to have it controllable of course, but=
=20
> in a system where the microphone is an external component (i.e. plugged=
=20
> into a microphone connector), the system design might need for it to be=
=20
> user configurable.

In any design we really ought to have some explicit confirmation before
we allow users to go randomly changing voltages, it may cause damage if
someone gets it wrong.  This means that the feature really ought to be
an opt in one if it's going to be there.

--1WzhY1iIJc/hoRIB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmF21zoACgkQJNaLcl1U
h9BRFAf+KR0a8GqKu0WaDfnrI+6es0fSXLiKli25Fz+rxi+X10UAk4+C6s6iPMZk
Obq9pFcoM8Q/eQ93zCh4D0627xv54CkTdo4E+m7TsikErFcvJ2Hfpr5/JOKzQbn/
Geth7Eyd1EO1WDGEPRUisKDm1fV6G6ORITnb9gOgMHBd4g6r92vSryat8333iPVv
T/21eS3n0SMPBsw5B2GOhwhag0GnjfjGI8AQH14NLDaFMXau8MteNK3P7tbhn4mR
qrkVIoxBtxPC3RgsvGCRo+oZ9D9SveuIuyQ2X7IPoFYjRciebUr4I4KYt3zVaCJI
rSGTBnltpFviddPqG4nPU0Co0Z+HMg==
=vV9F
-----END PGP SIGNATURE-----

--1WzhY1iIJc/hoRIB--
