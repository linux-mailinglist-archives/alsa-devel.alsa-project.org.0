Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E687D340C5F
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 19:00:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 736561694;
	Thu, 18 Mar 2021 18:59:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 736561694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616090428;
	bh=cU0Qjel2byoj1Q2sHEJ/oxm+dWiDDSGLEfUQGzIYlzI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f385KayzJdDQDk/syyaSRbyAqyxPoiW72H3Tg3zg8LYA4kdGCJzQiM39mVQCcNVKW
	 Vpg2lm7aso7gfj9oEz9/X/Q5SRXtsXmxo1QxihFK2PWFCq0xOUviOJitKedAzlTFYF
	 HTF2eQEDYJEC6YAVhIPRd0j7BcGTdYdUutzNiEX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAF65F80171;
	Thu, 18 Mar 2021 18:58:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82934F80165; Thu, 18 Mar 2021 18:58:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96630F800E0
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 18:58:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96630F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YYh4R6UQ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7498964EB9;
 Thu, 18 Mar 2021 17:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616090317;
 bh=cU0Qjel2byoj1Q2sHEJ/oxm+dWiDDSGLEfUQGzIYlzI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YYh4R6UQ977A5F+fV+NyU056AbQ0slI5BvKqBqN0AXz7Ck7WECRaWOXMb05gVYWDI
 nn6F1j9TOyAa9Fi8E15g6HUDGy1Hp9EG7AFIYwYgsege3s/2SitMuI8ylfAkEKnW7W
 PZfqkyWut0e34fyXtkaGku7MR3MkyRlwSM61IDfrNhji2yjp3CeD6Mqle0eUE6qHXH
 ucYf1w7EF6WICkOW67dHgdb2FpFOHQssJHhopa45/QikKn9NTWTUPZ4Khxmk96adjV
 fMr1kNvYY4XXOZCZl5bAh5oXvxPugfy6kNrNHtz1Cluhi8TA4qYWHrev2+s8QJd4Z0
 mW9YvJONMlwow==
Date: Thu, 18 Mar 2021 17:58:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v4 1/3] ASoC: Add Rockchip rk817 audio CODEC support
Message-ID: <20210318175833.GN5469@sirena.org.uk>
References: <SN6PR06MB534267976CCAB77E25EF10A9A56A9@SN6PR06MB5342.namprd06.prod.outlook.com>
 <20210318130610.GF5469@sirena.org.uk>
 <SN6PR06MB534246E83550903553C0C380A5699@SN6PR06MB5342.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="YyxzkC/DtE3JUx8+"
Content-Disposition: inline
In-Reply-To: <SN6PR06MB534246E83550903553C0C380A5699@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Cookie: You are false data.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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


--YyxzkC/DtE3JUx8+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 18, 2021 at 10:24:30AM -0500, Chris Morgan wrote:
> On Thu, Mar 18, 2021 at 01:06:10PM +0000, Mark Brown wrote:

> > This should really validate freq_in and freq_out, confirming that
> > they're whatever fixed values this register sequence is for (if you
> > don't know what freq_out actually is it's more OK to skip that than
> > freq_in I guess since the constraints on the DAI link should ensure we
> > end up with a sensible value).

> Unfortunately I don't know which values I should validate.  While the data
> sheet has these fields "documented" it doesn't have the units, so I don't know
> if I'm close in the minimum/maximum range or not.  I will add documentation to
> the routine for each step of what I'm doing at least though. If better
> documentation becomes available or a second implementation presents itself we
> can update this to validate.

> https://rockchip.fr/RK817%20datasheet%20V1.01.pdf

I see...  for freq_in and freq_out you shouldn't need to understand any
of the actual PLL configuration, only what goes in and/or comes out of
it which isn't super clear from the datasheet - there's no clock tree or
anything.  It does say the input clock is "main clk" so it could be the
MCLK pin?  The only other plausible pin I'm seeing is the 32kHz clock.
If you know the output clock then PLL_OUTDIV will tell you the operating
frequency of the PLL.

BTW looking at the driver there's a bunch of other registers so
shouldn't the regmap be done at the MFD level?

--YyxzkC/DtE3JUx8+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBTlMgACgkQJNaLcl1U
h9BobQf+PEYBAmbXSwAB2VJ9AhygV8XyQRLKoU0lv9XjNp5zG5wJE6InM/PxUfqW
Mm7n5kv3Txa/2yN95wmX0UNG9p3nXhXZ89Leyoc//4Yo/Sb4nzxkCavR/kL9Kai8
5GKmyZYHh8Y6C9TOqbJEdAUv2B2COP9w0l6G+/IoSoP7Ec6nbwtaHNu/Jr1BnLwr
Pr+RX46bBJb8J1Jj8WS6CWJclCE91syirEQdpEgnCle4qpZJT/sr4gxRWFE4mLky
Z+bq0uIomkbOwG0kVWDH7qfkUTViHn0+FfgE2dD/IcuwdJMvvPtmaYWUFhsNqQvm
uEIf5qyfhngbtKmN7zE9PgnCx6vHYw==
=qdr5
-----END PGP SIGNATURE-----

--YyxzkC/DtE3JUx8+--
