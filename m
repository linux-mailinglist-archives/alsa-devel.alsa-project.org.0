Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC783DF359
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Aug 2021 18:55:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC7181745;
	Tue,  3 Aug 2021 18:54:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC7181745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628009721;
	bh=PUvchLm+7FuFHxH7LFSIQrmsIhTmZ7KnNXzD7wOqJX0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IJ/2w+e10+aWbRU1FqGY/y01ECC6IZtusTkxEUckOwjvJOsGtbKJl7pIjmsfdrAUf
	 tXrgNnuwjRE0JaG1yLOqUw1urBq3SoQANrrSrcHAB+ddq+o8XxEMNyZP0ZDMJgnpBC
	 uVPjOLjFuwAoK2KGUm+7fgOeXGRZIkHj37KbTNCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12E26F8016D;
	Tue,  3 Aug 2021 18:53:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94318F802E8; Tue,  3 Aug 2021 18:53:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08FE3F80082
 for <alsa-devel@alsa-project.org>; Tue,  3 Aug 2021 18:53:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08FE3F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TKJJxwQh"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A05A60230;
 Tue,  3 Aug 2021 16:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628009623;
 bh=PUvchLm+7FuFHxH7LFSIQrmsIhTmZ7KnNXzD7wOqJX0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TKJJxwQh2G7Iy3mtaJUBi7RJgReX5GgTErjIGwNOsSoeEGAjUu5gp0LGVnUoRV6fN
 wQx4tBr2mU4cymZcQWrIQ0XJdZrsC6cObyeCI81dJQNtvLmH0NN2fk80NsV/NmdC+l
 0FBDHSoKRnX06yQojNZj+otfqXMa/mILWBe8q66rc7QUpBIbOCl8WfaFBb8+g/34R4
 5zXSU9UpuIlwuh//EGnqgpv0ip/b0fcNu3cU/g6he5io2pijCZAZTjMmY/APq0YLXE
 3yjJiJ4MnPz/+GLGdmgM4FoKUbBSPAWYTTeq3pSW1CiBcM4B+xdztv+KH+NM+F38m9
 nQMOodE1m3NWA==
Date: Tue, 3 Aug 2021 17:53:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 09/14] ASoC: audio-graph-card2: add Yaml Document
Message-ID: <20210803165328.GO4668@sirena.org.uk>
References: <87a6mhwyqn.wl-kuninori.morimoto.gx@renesas.com>
 <87wnplvk2a.wl-kuninori.morimoto.gx@renesas.com>
 <CAL_JsqJKZ-sjbnihAkdXDk4tW8xVmyhwkHLHWouZg6da0cc99g@mail.gmail.com>
 <87lf60v9xk.wl-kuninori.morimoto.gx@renesas.com>
 <20210721115433.GB4259@sirena.org.uk>
 <87fsw124wn.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZmZU9S7l/XJx5q9b"
Content-Disposition: inline
In-Reply-To: <87fsw124wn.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: There's only one everything.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


--ZmZU9S7l/XJx5q9b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 26, 2021 at 11:19:20AM +0900, Kuninori Morimoto wrote:

> 	audio-graph-card
> (A)	 O: Normal connection
> (B)	 x: DPCM
> 	 -: Multi CPU/Codec
> 	 -: Codec2Codec
>=20
> 	x: Tegra uses is as customize audio-graph-card

TBH I'm not sure this is a bad solution for DPCM - there's the whole
thing with representing DPCM in device tree being fun going on :/

> 	audio-graph-card2
> 	 O: Normal connection
> 	 O: DPCM
> 	 O: Multi CPU/Codec
> 	 O: Codec2Codec

OK, so if there's issues with multi CPU/CODEC due to the representation
of inter-device links not being good enough we definitely need to fix
that and I can see that being a binding change.  For the CODEC<->CODEC
stuff I'd have thought we'd be able to get things working but if we're
changing things anyway perhaps it's not worth it.  It'd probably be
helpful to spell out the specific issues with the multi-device links.

> We need to keep simple-card, I think there is no discussion is needed her=
e.

Yes.

>=20
> About audio-graph-card vs audio-graph-card2,
> I think keeping (A) only on audio-graph-card2 is not super difficult
> (But some message will be indicated. see below).
> Supporting (B) on audio-graph-card2 is difficult.

> I'm not sure detail, but we can do like this ?

> 	step 1)
> 	- add audio-graph-card2 which have (A) compatibility.
> 	- indicate "audio-graph-card will be deprecated" on audio-graph-card

> 	step 2)
> 	- Tegra switch to use audio-graph-card2
> 	- confirm that all existing audio-graph-card user have no problem on
> 	  audio-graph-card2 too.

> 	step 3)
> 	- remove audio-graph-card

I guess one other option is to just keep the two audio graph bindings in
parallel, having it as something like a simple links and rich links
variant?  We're going to have to maintain compatibility I think and it'd
make it clearer what's going on, it wouldn't just be a version number
for the binding that's changed but rather something more descriptive.

> My concerns are...

> 	- I'm not sure how DT is strict.
> 	  If we removed audio-graph-card, but user uses old Tegra DT on it...
> 	  We can't remove audio-graph-card forever if DT was super strict (?).

> 	- The naming of audio-graph-card vs audio-graph-card2 driver file.
> 	  because audio-graph-card will be removed later.

Perhaps the approach above with a descriptive name for the new binding
and just keeping both around in parallel makes that all clearer/easier?

> 	- audio-graph-card2 can keep (A) compatible, but some features
> 	  are not recommended. Existing user will get such message.
> 	  And because of this compatibility, audio-graph-card2 can't remove
> 	  this "un-recommended" feature.

Right, some of this depends on how actively bad those features are - if
they're more just not recommended than actively bad then perhaps it's
not worth bothering to deprecate them.

--ZmZU9S7l/XJx5q9b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEJdIcACgkQJNaLcl1U
h9C1Iwf/eWCbZyb6knVN8DjxlSbe09faeWTeMl9/89HyQPouCPPH/y6DmwDvhTxg
9avYRqQ+YF+Afn5BeKIMsxQetG7fIjsjW26W9UrJHH3GzXBYiBcMJNtFndAzNv7V
u8AZTwzg/KQBD04g3Vn5fNbDIRytG8VpzIVlu9ypfB9RY3DH/ArL4YxjpEKJCHPp
BNwR6ETaFKIZgMrGH231a0YwDWvMa0WuE0MN2R2hZbGKNsg4QqEg0cJOD7UqssWt
KRq4YI7r+mFnosBucpbM1hES12UZD+mFAjDQNhEPmnFwTCr7KJB90wuv3fKBgYdJ
wU/QBesgxxgUoW5zu4PW4niu3M6fiQ==
=YS8b
-----END PGP SIGNATURE-----

--ZmZU9S7l/XJx5q9b--
