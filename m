Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9491C31132F
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 22:13:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D8E11676;
	Fri,  5 Feb 2021 22:12:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D8E11676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612559611;
	bh=EaTd+Wuy21AekfWgx1/4UsqU6p4ILwGM/82jequDut4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V+z9ebksyE73GrovY1s//zURLUVvGF8rG+dUrLI54aw7S1cSbqWM86KCSyfSbGGtk
	 4dAI74IA9i4ctqc6Pe8cV5ZBrLoGeU0i2XL8B1n8BW5v8N0E6QAnDiT4amPYpzsAZk
	 sRcpHzVqbVHl+Cc07H+2TvJTA44nyQAP+CwqFzKo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 817CCF8016E;
	Fri,  5 Feb 2021 22:11:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C0D0F8015A; Fri,  5 Feb 2021 22:11:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B61ABF80139
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 22:11:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B61ABF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZTIR9BVM"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1338B64E51;
 Fri,  5 Feb 2021 21:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612559511;
 bh=EaTd+Wuy21AekfWgx1/4UsqU6p4ILwGM/82jequDut4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZTIR9BVMqMvtDjmAa4NSUrz8yO6EQHRLuCy8juHBLzTJRQe1XRCRusgZN4R/jzKRy
 x3Z7aGS54KqCbVJxWAqui662+a+Tl/Y10+9HAnGzNxXwxg25FZ+mzmfCOGYfJyhfgp
 FLTkPLJwUFGoHXt/BHZ9hxzRX+Lpvg2eOeyJedis3Byt/PFchEvQdYs+f6snUyYbA9
 TqhYeq9WkB6gfR5i19RwsguOqVT97h9rhb8LR6cO1HztgrZwaQGTJhi2oOnkcIyu8U
 bETrP/cQB2oWNm1d9X07MkuI7LAo1fBT6KeFIgIFebGEB5NuYc+6KViWGg6oDhT52r
 e4hf+UAlf1kxA==
Date: Fri, 5 Feb 2021 21:11:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 4/5] ASoC: Intel: Add DMI quirk table to
 soc_intel_is_byt_cr()
Message-ID: <20210205211101.GL4720@sirena.org.uk>
References: <20210120214957.140232-1-hdegoede@redhat.com>
 <20210120214957.140232-5-hdegoede@redhat.com>
 <20210204135616.GL2789116@dell>
 <20210204140515.GC4288@sirena.org.uk>
 <20210204150456.GN2789116@dell>
 <20210204151139.GE4288@sirena.org.uk>
 <20210204154058.GP2789116@dell>
 <20210204194213.GG4288@sirena.org.uk>
 <20210205083416.GR2789116@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZrCu0B0FMx3UnjE2"
Content-Disposition: inline
In-Reply-To: <20210205083416.GR2789116@dell>
X-Cookie: Huh?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
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


--ZrCu0B0FMx3UnjE2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 08:34:16AM +0000, Lee Jones wrote:
> On Thu, 04 Feb 2021, Mark Brown wrote:
>=20
> > On Thu, Feb 04, 2021 at 03:40:58PM +0000, Lee Jones wrote:
> > > On Thu, 04 Feb 2021, Mark Brown wrote:
> > > > On Thu, Feb 04, 2021 at 03:04:56PM +0000, Lee Jones wrote:

> > > > > This set has all the Acks we need to proceed.  What's blocking?

> > > > There's the subsystem maintainer...

> > > I assume that was a question and you meant "where's"?

> > > Pierre is listed as the Maintainer.

> > I'm fairly sure you can see what I meant here and why there might be a
> > concern.

> So that should be a Reviewed-by and not an Acked-by then.  That's fine.

No, it's that there's plenty of drivers like this that are listed in
MAINTAINERS but still generally go through subsystem trees - this is
also true of for quite a few MFD drivers, you tend to get a bit annoyed
(quite reasonably) whenever I mistakenly pull MFD changes for them into
one of my trees without syncing with you.

> What do you want to happen with this set then?

> You want it broken up?

I guess, or at least a pull request so it's in my tree and I'll notice
any coverage issues.

--ZrCu0B0FMx3UnjE2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAdtGQACgkQJNaLcl1U
h9BWRwf/ZZn/bM6T8HI5iWDV7jZlHE6LElBXKls2FzlnvKemebzh6PZngZAoL2Ya
pPvJqzu2NzZjQdYQ4jwz4TO6KzMqClml0uX+GCKiklkobgapvDFvNJWcZO/Kp7Sk
40EJ/4FbGPTdGZ1XYAjSlQTBoZ3KF67AfiXWiOK+YzSrUxBtmEq77b9ebpTGssNS
XJtEU5AjWcwDj8QZRzadrnLV7vbQOIZZJVX+Ab5q6qssmuiHaeImEk9t6yAZuB6P
ETCaJKjjSCZJHTFvfP6/b5G0Hb64L8d5MQVxhAKn5aU+xt384pYGA4bCz4Qc93xJ
DbJknEWAKznp4kgImKWNB/39R4YH6Q==
=PeN+
-----END PGP SIGNATURE-----

--ZrCu0B0FMx3UnjE2--
