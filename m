Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F9C58C7F3
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Aug 2022 13:55:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C084C823;
	Mon,  8 Aug 2022 13:54:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C084C823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659959736;
	bh=gLLzNBC05iprPlwsFTEWWLe63Y1mn8z9yVQgj/RVaB8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lIHvVrtqg6JO4BzBog0GYon6ZlnmFlIKywgtrRm5BICFmO0bvAlqlc8OTh6pN+10Y
	 Hx3qlLm6fE8fiGCYFr9MjI36L0jubKApSTfwVJzRWm676yT+bIYSdcZNyN+MvXBrkJ
	 LU4+a9Tp3M5//D3TvUta2WxOHdjWtHTadRHcFEic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43C46F804B1;
	Mon,  8 Aug 2022 13:54:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A146AF8012B; Mon,  8 Aug 2022 13:54:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DEACF8012B
 for <alsa-devel@alsa-project.org>; Mon,  8 Aug 2022 13:54:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DEACF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="W1OVTS1K"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3F9E2B80E74;
 Mon,  8 Aug 2022 11:54:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BBC2C433C1;
 Mon,  8 Aug 2022 11:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659959669;
 bh=gLLzNBC05iprPlwsFTEWWLe63Y1mn8z9yVQgj/RVaB8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W1OVTS1K2SuOpQvoUPCB0kJJmwR1Ah+OPHp0GNrMWLJwMBwTkAlseYkzYqgSJuaKO
 5X5UbbX61IqK+KwIOEuXEpnShQz2DD6FN6So+2jnClg1qt5qIwGCmToFdBXDA8/VJy
 jdFIuXSk+Z/kYig7JtCsN2ELbzN8IrNfXeDdy1y4s2/6zcEAOVCgbuZwvQloVL96di
 6vJ2wPs8tnN4QTpJubTllf32xa451hUS/QYfHuJts2VFpZwkq1DtEf5PAbd5SgOehx
 G3YhecaIXVnyBBhqTmWH7H8DM6KBFPvIYmDxP8TDdN9yPeomtR0J41GhFCGR48HXh6
 TujpCbYWpWSTA==
Date: Mon, 8 Aug 2022 12:54:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Niklas Carlsson <Niklas.Carlsson@axis.com>
Subject: Re: [PATCH] ASoC: adau1761: Reset codec at probe and shutdown
Message-ID: <YvD5bqFHxB809zl3@sirena.org.uk>
References: <20220805222120.2560501-1-Niklas.Carlsson@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QSoF+Eq+pKrtRG4k"
Content-Disposition: inline
In-Reply-To: <20220805222120.2560501-1-Niklas.Carlsson@axis.com>
X-Cookie: Are we running light with overbyte?
Cc: Niklas Carlsson <niklasc@axis.com>, alsa-devel@alsa-project.org,
 Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
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


--QSoF+Eq+pKrtRG4k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 06, 2022 at 12:21:20AM +0200, Niklas Carlsson wrote:

> +	 * Steps for performing the reset:
> +	 *   1) Make sure that the cache is marked as dirty by writing all
> +	 *      default values directly to the cache.

Why?  If there's some need to mark the cache as dirty there's a function
that directly does that.  Note especially that a cache sync will
explicitly not write any default values to the hardware if it knows
about them.

> +	 *   2) Enable the core clock which is needed for writing all registers
> +	 *      except CLOCK_CONTROL.
> +	 *
> +	 *   3) Use regcache_sync() for synchronizing the dirty cache back to
> +	 *      the hardware.

We then need to disable clock control at the end (which the code does
but the comment doesn't).  It might be better to just have comments next
to the individual steps here.

I'd expect something more like

	enable clock
	for each register except CLOCK_CONTROL write the default
	disable clock

here, no faffing with the cache.  You could use two bulk writes to do
the writes of registers below and above CLOCK_CONTROL if that's the goal
in doing a cache sync.

--QSoF+Eq+pKrtRG4k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLw+W4ACgkQJNaLcl1U
h9DIAgf/St4gbezlXWjOUtVNLyU45bFxcp/bmgJuUwKHbfGeX84Vnt4gJMG25HQZ
wYJq+DXne9HJbaAEY6qXv0weBS6gLauGixrohFxSF0dYCzdPRJr+BfjhCccfE8ud
YmPSS3pw/YOPqz2CW/cgnLU2a7vh/Ni3bIwae0MxA0s8HLqlBW15f9YRjFs/TRnb
aN5Ppv+E4CSWkmehMkv5IRteoxBXqwLJ/Bs8LjsjTg4wEf/nwLSgbey7+bSGmEj3
IevzZULaqlC5MmlomXpbxvIapvKasA/YThkIz688BYpafyvWFloT6nye/gMQ1tax
ktDGKoqaHCHQbRfp5ZomCpJ8QH5yUw==
=pwO8
-----END PGP SIGNATURE-----

--QSoF+Eq+pKrtRG4k--
