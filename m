Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A212A4C8C9D
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 14:27:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1819018EE;
	Tue,  1 Mar 2022 14:27:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1819018EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646141272;
	bh=1DTqbTc4ulkb0fviBXNsAj3qxd0r1QufWdpYuJIk+fg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JABcjJ+r2zJlxUCj0Yab/cEuidJJaSrAy5e0f2w+BZ8tdq23LuNFMyE5dsqGXLCxC
	 loSUnxRasdwp3lf0AMjN1JXWFILh81+tSs6klhAgLNxQVXrl5NpJACy66hQ/irN6MJ
	 kdAAI2y44Ei9dsCiRaeh5WBsEVvodOWCSZVxhUg8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B1ADF802D2;
	Tue,  1 Mar 2022 14:26:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E9D5F80227; Tue,  1 Mar 2022 14:26:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0DADF80054
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 14:26:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0DADF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IL/g5/Lr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EBD36B818F3;
 Tue,  1 Mar 2022 13:26:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 112BAC340EE;
 Tue,  1 Mar 2022 13:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646141197;
 bh=1DTqbTc4ulkb0fviBXNsAj3qxd0r1QufWdpYuJIk+fg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IL/g5/Lr67CKCze983PhXU7r3WSgt/3c2FqN+IahHY7hEtjJbK3hmMVgRLQ+KYj9w
 BuCvFcnm3kPOtbqxjdF5DeM3jQNiG96/76ZaQFYer74eMo7tyTt4GIdXTGW+mf6Tqa
 BZJ1fWdmZz/jnqT+l0aUjiQgjYezIAUa18c3QsWMHw962VgLhALl2ixTbeNkmltYlS
 AF6ZFg9g9UX9QmDI55cHs39F6clGu48KjisWDRIZ77UR7LUL2rMZu+Eqw2og0oJoer
 L2UDAwWL89DJXt4faq1LXjUR95xrca7JF/eOryOfAqdt3qXZTDKWgUYgayABfo5Txs
 lZTIFxTpdteWw==
Date: Tue, 1 Mar 2022 13:26:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH 2/2] ASoC: codecs: Add Awinic AW8738 audio amplifier driver
Message-ID: <Yh4fCAE41Sc5AjwL@sirena.org.uk>
References: <20220301123742.72146-1-stephan@gerhold.net>
 <20220301123742.72146-3-stephan@gerhold.net>
 <Yh4VziYJ2M2aenjz@sirena.org.uk> <Yh4XOC5+Uam9UMdJ@gerhold.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OHqBp8PbVqqccFla"
Content-Disposition: inline
In-Reply-To: <Yh4XOC5+Uam9UMdJ@gerhold.net>
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


--OHqBp8PbVqqccFla
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 01, 2022 at 01:53:12PM +0100, Stephan Gerhold wrote:
> On Tue, Mar 01, 2022 at 12:47:10PM +0000, Mark Brown wrote:

> > I only have this patch, nothing else from the rest of the series.
> > What's the story with dependencies?

> Hmm, I definitely sent the whole series to you. Let's wait a bit longer
> to see if it will still arrive, otherwise let me know and I can try to
> send it again.

Yes, it's turned up OK now - wonder what delayed the earlier bits.

--OHqBp8PbVqqccFla
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIeHwgACgkQJNaLcl1U
h9BWeAf/Yxb5JebNr2s6Zb7XhaUYHkIHB4qi6c5jEG/QHKrIYgGQJOmxMfXzJewU
QPMY/0A0rgq598SpBrQQKeyWKy6T74kAbz8vW98zCGG4T3Xk82orhS2q8y5NLewQ
pxFodkNSktD4XhgvzGjMhLmTSROF64Uo0JTIgKZ0VuKN0m4Mio2pH7mYWKxR/Qt0
y9NACNV+PisVMsPSrsPCqABg8MstUBNzBsNkPGr8S3C0elXMusOwB+zcPp1PAbF4
MqJhaqNiJ2Hsuoo+Vi2kcKoXeY9Y7Tqn/GuwR+TjjbRjhOCC6eQLgmC2yzlhp41X
GjS4+8plJi3zJ5kuttHepVQGjPaF7A==
=3Fav
-----END PGP SIGNATURE-----

--OHqBp8PbVqqccFla--
