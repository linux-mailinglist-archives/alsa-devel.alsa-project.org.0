Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B2D175F6B
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Mar 2020 17:20:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7806616B0;
	Mon,  2 Mar 2020 17:19:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7806616B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583166011;
	bh=dYL6nTqeZHKUejVXxapSf7eba824V7g8C5YWACvp+qs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PEtNqfWowDmATD/hJDqCec5NCZ7KkafIkW3Y2KgcF2Tu+lyBh87DL7Y0qSCoK5lj+
	 q+PBn6OGlbo+W3iahlvfCHShrek6nfBknFmrZyaMdPPv6AEpcqAmla1IkGrSa5YuvN
	 853yNhg5VeVqihqbVihjJht1lT5E29wZGQUEJeoo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 810B0F801F5;
	Mon,  2 Mar 2020 17:18:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C10C3F801ED; Mon,  2 Mar 2020 17:18:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 4E371F800E5
 for <alsa-devel@alsa-project.org>; Mon,  2 Mar 2020 17:18:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E371F800E5
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 110732F;
 Mon,  2 Mar 2020 08:18:23 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 855673F534;
 Mon,  2 Mar 2020 08:18:22 -0800 (PST)
Date: Mon, 2 Mar 2020 16:18:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/9] ASoC: Intel: machine driver updates for 5.7
Message-ID: <20200302161821.GG4166@sirena.org.uk>
References: <20200228231204.9026-1-pierre-louis.bossart@linux.intel.com>
 <20200302131138.GD4166@sirena.org.uk>
 <131b84c8-7750-1fdd-5e6f-e26915fa9a46@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rV8arf8D5Dod9UkK"
Content-Disposition: inline
In-Reply-To: <131b84c8-7750-1fdd-5e6f-e26915fa9a46@linux.intel.com>
X-Cookie: Whistler's mother is off her rocker.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
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


--rV8arf8D5Dod9UkK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 02, 2020 at 08:52:01AM -0600, Pierre-Louis Bossart wrote:
> On 3/2/20 7:11 AM, Mark Brown wrote:
> > On Fri, Feb 28, 2020 at 05:11:55PM -0600, Pierre-Louis Bossart wrote:

> > > base-commit: 6941b0b5f919e9839e8c25efaeb53854efee14e5

> > Since for-next gets rebuilt all the time it's not ideal to base things
> > off, for-5.x branches are better.  If you need dependencies it's fine
> > though.

> No dependencies expected, it's just to help buildbots understand what tree
> to use, and for-5.x is just fine indeed. Thanks for the feedback.

It's automated systems that I'm suggesting this for - testing against a
throwaway branch isn't ideal since it doesn't reflect what'll actually
happen with the series by default.

--rV8arf8D5Dod9UkK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5dMcwACgkQJNaLcl1U
h9DbEQf+LMWPOlGCwYtb8P7rBNHDVoX2R9S61QsM4NwcM29Racx/2blLa33CmAT0
uPdjN9+FTFgc9ZX4Xdqjtfl+3iLTJHZVGINMO5XWRtaNqmAo1W4V/brWGl9yQDHD
NjynXERELIgDGR3IdG/C1fOa2SwPURJwXu7bP61dud8xO2Ba4iJQ/KZyEk/rCupJ
Vnr74aQrD8pH9hTjZfHyQXSNJq8muZFYht+jlUPhZWQjCLERZGzPJdw6DvIdpPt9
9ijHD5bArKaQBzUs+fXrDz3ARodnyo8PYn0apZeQtAibRZgOnk9IDJ4nNfq68ims
QwZwDMO9x3rsM69ciDeEIWSz1x4glg==
=OgIA
-----END PGP SIGNATURE-----

--rV8arf8D5Dod9UkK--
