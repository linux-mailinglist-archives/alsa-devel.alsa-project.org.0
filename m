Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5114C8D4C
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 15:07:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DD61190F;
	Tue,  1 Mar 2022 15:06:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DD61190F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646143635;
	bh=04NEQj+QzMV3JzBvJ4Q1nfcFLj9lFdSx3Ms0+VTMWb8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Owe6K8qdNFL1o1aj8ygOcsmFTzdsqlLBPY/GC5HtQSCLmWUzJ0ZojwXGnvHy9//MB
	 SfYfbDecYRXpQyTNwXSSdhOLrWGpe3Q5aoantuFOuxKbiSUHTOS9MGkW+b9hNi0pi9
	 Nc7AebUTIs6795kc2fmF6R//445jyNDHdLSJ2qTg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0011CF802D2;
	Tue,  1 Mar 2022 15:06:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4ED54F80227; Tue,  1 Mar 2022 15:06:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BBB0F80054
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 15:06:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BBB0F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="j5Yf7zwl"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1F226B81979;
 Tue,  1 Mar 2022 14:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06176C340EE;
 Tue,  1 Mar 2022 14:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646143561;
 bh=04NEQj+QzMV3JzBvJ4Q1nfcFLj9lFdSx3Ms0+VTMWb8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j5Yf7zwlcGR/8sam7I9mKKloSaJlok3+aubkekyhbx1qytvA/fd0A+eJEg7INQ3Pz
 3nc6/vrGBoqJKfnHQHOpOoCwrAn9xcwGk/JI0sLdxz4eF8waJ5r2yaO5Ws5ocyzWcn
 8DhSQ5Hge5LSLZR3IC2453bL3kyQ6tEEodKlxNSxxf6vWF3ixD1AH/w+Lluj2+EMei
 6vXIvc5etATJpPS+PFw1E37fgIz6unBNscOHYKwlIiNp3bJTrOg8h0+aHmPxuLYqQV
 WFK831RYsEm5/VZPhKvYOZqY9I1ClaRAP9e6yNGJXeC4hCmIBReaSxX+Qq3Bx6O7Km
 qHGBfKb5Qr3sg==
Date: Tue, 1 Mar 2022 14:05:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Add schema for "awinic,aw8738"
Message-ID: <Yh4oRBb2uHf+NvXz@sirena.org.uk>
References: <20220301123742.72146-1-stephan@gerhold.net>
 <20220301123742.72146-2-stephan@gerhold.net>
 <Yh4hYVJFZJBYp3d9@sirena.org.uk> <Yh4lfjsDR4qqnc8Y@gerhold.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Rx93jjjGeYy76A0C"
Content-Disposition: inline
In-Reply-To: <Yh4lfjsDR4qqnc8Y@gerhold.net>
X-Cookie: You have a message from the operator.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Jonathan Albrieux <jonathan.albrieux@gmail.com>
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


--Rx93jjjGeYy76A0C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 01, 2022 at 02:54:06PM +0100, Stephan Gerhold wrote:
> On Tue, Mar 01, 2022 at 01:36:33PM +0000, Mark Brown wrote:
> > On Tue, Mar 01, 2022 at 01:37:41PM +0100, Stephan Gerhold wrote:

> > > +  awinic,mode:
> > > +    description: Amplifier mode (number of pulses for one-wire pulse control)
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    minimum: 1

> > No maximum?

> I wasn't sure if we really want to maintain maxima for several different
> Awinic part numbers here. For the AW8738 the maximum is 7, for the
> AW87318 (note the additional 1 in the name) it would be 10. The driver
> part would be identical for both.

> ... But it's probably cleaner to have the schema check for the real
> maximum of the selected compatible. I will add a "maximum" in v2.

Even if it's just a maximum for any of the supported chips it'd still be
something.

> > > +  sound-name-prefix: true

> > While it's very likely that someone will want to use this it shouldn't
> > be *mandatory* that they do so, there may be no other controls for it to
> > collide with (eg, if none of the other components in the audio path have
> > controls).

> This line just enables the "sound-name-prefix" from the included
> name-prefix.yaml. It's not listed in "required" so it's actually
> already optional.

Of, that's a really confusing way of importing things.

--Rx93jjjGeYy76A0C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIeKEMACgkQJNaLcl1U
h9C/KAf9Gt7awV5WuAyBSjuvdohK/UvqC8PXq0zg84VbkYtjydMMLNZVq5Do/tvY
SgrFFonq2RQJJJ123aSYkDWo4ySAJostbq+r/AXq+laboOOMrObTWZms21rvYI/C
oOE6b2B2lA+R7TaDrzRX9K275tdctZeeisuFwNqLVchIlcnKlWTZsI9Bq/3et7Gy
jtGJ0i9ZfvWwCFKMtV1THWgPutuohATHotqadP8j+ruCVJLX16hwDpEXzcD3/4wc
jOkPheO7cAzUQFquJkewNUBvSURxugPktwAA39VUkCFxzW5rnxDXJoTB7EGbPatB
1BPXQgh25ltoFHe9ykFNxa/NUUqj4A==
=tzMw
-----END PGP SIGNATURE-----

--Rx93jjjGeYy76A0C--
