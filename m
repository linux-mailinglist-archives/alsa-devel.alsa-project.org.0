Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 144DB3D7578
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 15:00:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98E181EFD;
	Tue, 27 Jul 2021 14:59:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98E181EFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627390828;
	bh=WTx6+krlzuWrgl0nV5XDZMCOdOzkMR+VPJ9lgNvxnjk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X8i5u2atlId7wHadSngHNuKMuW8mR+ALNAPoumy+Ct9xRy6K513pQ402KJGefdoZr
	 mve0A6GG8R6VZAbjC8lF53e+MfX9jqalmCjc608UChE1+kRqwf2mVXYXfZK86dAbhe
	 qHjyZbgMzfa2FEAtx6vDXVAa4XwwwnGoYXjtdwqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E9BEF8020D;
	Tue, 27 Jul 2021 14:59:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0794AF8026C; Tue, 27 Jul 2021 14:58:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEA04F80212
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 14:58:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEA04F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="e0Spn4dx"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C343608FB;
 Tue, 27 Jul 2021 12:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627390727;
 bh=WTx6+krlzuWrgl0nV5XDZMCOdOzkMR+VPJ9lgNvxnjk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e0Spn4dx1JXU5+iJvdGtsfu/LvEQKOq1MiCfCWI1wuwLCYBQqeY/D6sgWf5xawkIb
 Qu2UvokXqBsgt4+bOR4OTfN/noVAHfhikcR3j/Dbc7+5oa6jipx6gPRBfRwYgTdCX2
 +eoT+4r/a+w9dq4ay3kQRWfUTd6s70IPTpfQIZ9Xs29J3+M09OIKqOzUY/vwSaeFvW
 JdcQq/nsMtJ1PCYrIsakubV0Nvg9li+3eRgbqP8cahB0aA9Nu7Gxz8m9WHn6x0Il8Y
 D1CmHP3jRVpYue+0MJSE19XuArqW1lfEOyLCIfwWU+rscjQIEcrLLMDWN3ykV+20rK
 OKWHNuWYYoRyA==
Date: Tue, 27 Jul 2021 13:58:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH 01/54] ASoC: dt-bindings: Add WM8978 Binding
Message-ID: <20210727125837.GS4670@sirena.org.uk>
References: <20210721140424.725744-1-maxime@cerno.tech>
 <20210721140424.725744-2-maxime@cerno.tech>
 <20210723213251.GA2622319@robh.at.kernel.org>
 <20210726001713.GA8831@sirena.org.uk>
 <885f19af-32d5-d792-84b2-56afb8fcdf6c@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZcSDOt7TZFizttpn"
Content-Disposition: inline
In-Reply-To: <885f19af-32d5-d792-84b2-56afb8fcdf6c@opensource.cirrus.com>
X-Cookie: Vini, vidi, Linux!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Rob Herring <robh@kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 devicetree@vger.kernel.org, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-sunxi@googlegroups.com, Maxime Ripard <maxime@cerno.tech>,
 Chen-Yu Tsai <wens@csie.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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


--ZcSDOt7TZFizttpn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 27, 2021 at 01:21:52PM +0100, Richard Fitzgerald wrote:
> On 26/07/2021 01:17, Mark Brown wrote:
> > On Fri, Jul 23, 2021 at 03:32:51PM -0600, Rob Herring wrote:
> > > On Wed, Jul 21, 2021 at 04:03:31PM +0200, Maxime Ripard wrote:

> > > > Even though we had the wm8978 driver for some time and a number of
> > > > boards using it already, we never had a binding for it. Let's add it
> > > > based on what the driver expects and the boards are providing.

> > > > +maintainers:
> > > > +  - Mark Brown <broonie@kernel.org>

> > > No one from Wolfson cares about this device?

> > > Otherwise,

> > > Reviewed-by: Rob Herring <robh@kernel.org>

> > Well, Wolfson no longer exists since it was bought by Cirrus but copying
> > in the Cirrus people to see if they want to be listed there.

> People, ownership, and email addresses can change. It's always best to
> check MAINTAINERS to see the current support status. In this case it has
> a section to pick up those Wolfson drivers, with the correct email
> address. The list email will be monitored by multiple people.
>=20
> WOLFSON MICROELECTRONICS DRIVERS
> L:	patches@opensource.cirrus.com
> S:	Supported
> <SNIP>
> F:	include/sound/wm????.h
> <SNIP>
> F:	sound/soc/codecs/wm*

Might be worth updating that to cover the DT bindings too (Arizona is
the only sound driver for some reason, wm8974 already exists but is not
covered).

--ZcSDOt7TZFizttpn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEAAvwACgkQJNaLcl1U
h9CAFwf/X/wlMmIJV1UBChO4tum9qfD4LEkYUYRIWfQgU1fhQnifFPwuGMC9ImGL
r7ANJBNId0R/RMl1b6OPGyUFo79f6ksU7jP1zDcJ6ZDUnIPtawgQw8pjt3/ompyr
JX8BgW2BAS9qTtp/KUdzIX78AvS/sFQIoPUV0oveLLVC4o39G2l/OGZaiwrnwhyh
cy9uO8u6jXzX2o1e8Pn0/n0ehmY/fFiDh9z7hix6IxE0JMi8LZjinxudVfrFI6hf
B6IBywxfduN7hB0WmhfrPa7N/04fjEcIaSzN9yJ6pi/QWm5pbCMP05oazrmddYwr
8cJNq9XTGa3DFI0UQpvvhFckaol3uQ==
=nUzl
-----END PGP SIGNATURE-----

--ZcSDOt7TZFizttpn--
