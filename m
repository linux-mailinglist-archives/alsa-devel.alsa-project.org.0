Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67824424283
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 18:21:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5EE31669;
	Wed,  6 Oct 2021 18:21:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5EE31669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633537313;
	bh=pGzTV3esiIv298q9BXKhGUzD+f9XRjx1SUiQN9dwFBY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PDRBsf9sW/59ud3TffvC8wrYZIvdHsNaLyH1inUZ1i64m9lAEgThVjz108BSFMPx/
	 AWX6N7CSgRQl6JCY03IhMt7ruBrDAE13qMj/h8IA1zRkTeENeVmdvi8sircvC8K4cV
	 Ecyuy2YQAgCpBlC/y7dTzrZ7raT5wEzQJWibkwTc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEECFF800FE;
	Wed,  6 Oct 2021 18:20:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1661F80302; Wed,  6 Oct 2021 18:20:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 594DAF8010B
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 18:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 594DAF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aFzjtpdX"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A7DA610EA;
 Wed,  6 Oct 2021 16:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633537206;
 bh=pGzTV3esiIv298q9BXKhGUzD+f9XRjx1SUiQN9dwFBY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aFzjtpdXCVTqawava5IljBa+/tcy/RpCd62RroTXoFADFrgIN7a7nbqhZR3FNa+5u
 n6vpDB4cL8O0y8JrseDB0TyqzlXdR+W1B7Ofy3p9ULIh4hajefc6MQFJbx6A9fOlKE
 TQXcV2juY27R2xwpm0OHNrAh/RN6Y76ND4wztZIPFRjNY/noEbWVI/l7pcTK4mAYo2
 ZZeqnuk6nWtAJi1bNQxBAxpwNXfMMsYqe0qkO9ps/VXfUM3LFHYHqJ9Fs94tShKJd9
 YArdRonQoxF6gYglcqx/Qj21TcntUkX8vqLTq7BJtHWvP0qWJqp3Pb6bZcUnaIngwf
 OuOpforfcU63w==
Date: Wed, 6 Oct 2021 17:20:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 2/4] ASoC: Intel: bytcr_rt5640: Use temporary variable
 for struct device
Message-ID: <YV3MtOrpziyKqkxA@sirena.org.uk>
References: <20211006150442.16503-1-andriy.shevchenko@linux.intel.com>
 <20211006150442.16503-2-andriy.shevchenko@linux.intel.com>
 <4b81a10dca78e286a9f806464b97111b5a15a91e.camel@perches.com>
 <YV3ER4uIL4aRWBjz@smile.fi.intel.com>
 <YV3FaZ+afuZZSIth@sirena.org.uk>
 <YV3JWzNgGInZ1Bt5@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pvNYqT1s2XmLNWBp"
Content-Disposition: inline
In-Reply-To: <YV3JWzNgGInZ1Bt5@smile.fi.intel.com>
X-Cookie: A is for Apple.
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Joe Perches <joe@perches.com>
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


--pvNYqT1s2XmLNWBp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 06, 2021 at 07:05:47PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 06, 2021 at 04:48:57PM +0100, Mark Brown wrote:
> > On Wed, Oct 06, 2021 at 06:44:07PM +0300, Andy Shevchenko wrote:
> > > On Wed, Oct 06, 2021 at 08:21:01AM -0700, Joe Perches wrote:

> > > > Some will complain about a lack of commit message.

> > > Yeah, sorry for that, it wasn't deliberate. I forgot to run `git msg-filter`
> > > on these three patches to add it.

> > > Mark, do you want me resend entire bunch(es) or just starting from these
> > > patches? Or...?

> > If you're adding a commit message with automation it's probably not
> > adding any value.

> What do you mean? I add it exceptionally for the same (by nature) patches.
> What do you expect to be altered in these three, if the idea behind the change
> is very well the same?

I really don't care if there's a separate changelog for trivial patches
like this, it adds nothing of value.

--pvNYqT1s2XmLNWBp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFdzLMACgkQJNaLcl1U
h9AeiAf/WqCqXROZjxlY7thdJTvoxPef03P18FKvWx2PcZs8ydd2++38FMk9Kt1E
8SY7llTHx97Sy/7MohSU/I5RyxMb/16nBfc6G75elHUzZPpYMscrgNHvDsruNM50
dDl5jgXeah4PA/zkdYnyKdB5PsgDHfUH6fqlen5DdvZkBD8bgcsDmGNm5Au30XPL
fytYGo8lKxq6mbHouLyqw+Cp01n75TVaz/V1v5tCSpYrLX2j5fEIMd58rPy52/hV
mGrt+61/oqOJ6y0vwCH9aw1TRuHUgOX6iUfBV4d5AHpwpqqiNfA79+leR5VjUn0j
7Ax5qxo33fPbRqZQCvBqQDgktUY2Gg==
=I4Dh
-----END PGP SIGNATURE-----

--pvNYqT1s2XmLNWBp--
