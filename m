Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DB1532B36
	for <lists+alsa-devel@lfdr.de>; Tue, 24 May 2022 15:25:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE09C16EA;
	Tue, 24 May 2022 15:24:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE09C16EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653398724;
	bh=FbzOFsgYXKH6aDOZJCnvQ/fG6xWXf3DrFICLRtHET4g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=on5vaV/PZsQ11t+Ft6UJD+UMLQHDNTrs9Ctmj8yYo4jv0Tv1TBZMByO6TP6IwQt01
	 06C56+oNaVtTVn/08cuvZN+Z57fuZBNivTN9dPrhh6nGD/FFqulKV2EMtYOEZzU8G0
	 DRq+O6jx+VMDAd3Rz6wbh9Egf+z6UPZFJF+LZwAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34639F804D6;
	Tue, 24 May 2022 15:24:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6D12F804D1; Tue, 24 May 2022 15:24:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E655F800E3
 for <alsa-devel@alsa-project.org>; Tue, 24 May 2022 15:24:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E655F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PPWkChpM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A8B25B817BC;
 Tue, 24 May 2022 13:24:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B758C385AA;
 Tue, 24 May 2022 13:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653398659;
 bh=FbzOFsgYXKH6aDOZJCnvQ/fG6xWXf3DrFICLRtHET4g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PPWkChpMhVjejdkceoX1oFxM4n84bGkizvtoskjdKzqWvnVOkdeIu4/Jnygopbj16
 cbawnfwFYbdZn9eT2POmuXyKz/+xWB/Lz+4uaphgM6UxLjyq1ZOEwXtf/KTUCpv7wE
 GEMIA/256vbvoSVa7z01Vykqm2iQREwsfbvkxhUpAU+rWfI0dTwx6aCYQcn5IezowK
 oWE4dw/4wv4LwC8VGW39Ti6q971+EzLqlJhvRHdpeV4fZlThxFThc9NW0/Em/u4D6Y
 l5DkTr0qMCqeZYXZpIsLdK9XDfWRxUCacga8ljM9RJjpwKEjlA6uKvNDlZP4dL0V5z
 /Y9+kIUnh4DAQ==
Date: Tue, 24 May 2022 14:24:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: About Cleanup ASoC
Message-ID: <YozcfjgvFfQa/HxS@sirena.org.uk>
References: <87fskz5yrr.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sI1hD3+WSJjeSxKd"
Content-Disposition: inline
In-Reply-To: <87fskz5yrr.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: A man's best friend is his dogma.
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--sI1hD3+WSJjeSxKd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 24, 2022 at 04:40:24AM +0000, Kuninori Morimoto wrote:

> I have very interesting to clean up ASoC.
> I think it is still very complex, thus, non flexible.
> I'm thinking that we want to cleanup...
>=20
> 	- Component with multi Card connection

I'm really not certain that we want components in multiple cards at all,
I know the Intel AVS people wanted this but I'm concerned that if a
single component is in multiple cards we'll inevitably have connections
between the cards which each needs to take into consideration, that
could be routing or something else like clock configuration.

> 	- fixed playback vs capture
> 	- fixed CPU vs Codec
> 	- DPCM connection vs normal connection

These all should be clear wins.  The first two are much easier.

> I guess the biggest reason why we have limitation is
> its connections. Text based image is a little bit difficult,
> but if my understanding was correct, current connections are...

> So if rtd have something other connector list, let's say "ep" list here f=
or now,
> instead of "dai", and remove Card <-> Component connection,
> I think the connection can be simple, and the issue can be gone,
> but what do you think ?

There's also the DAPM graph and clocking to consider - if you can route
audio from one DAI to another, or mix audio signals to/from multiple
DAIs then DAPM can end up spanning multiple cards which gets
interesting.  The clocks are probably less of an issue if we move to the
clock API, though there's the potential for disagreements between cards
about clock rates.

--sI1hD3+WSJjeSxKd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKM3H0ACgkQJNaLcl1U
h9BEtQf8CO7WZ40lpulnqjDDVMD5CkpJstMoIG9XFBfBBhKlKw3I+2/OZvmeStuj
SJ2w/4l6DvzqJyf+ClniKbtHOtGOc+rOaQ00NW1XI7EdhElCKSaq2uAuWVkLtWv2
MY3tdlqKvaVOgyCtH6s+dlugZk8dIXpSLe2cpLi0VbGOwHH8+mv6CSU5ghKkfgiG
gk0YWmoOibrfQoYu3SWGrWJuVsVQoHMkGsEslidaw5ZvdonN6riRkuKx+mlSB28p
+6H00KsC+TJS/QQECJJNnLwuGXrX1kIWF+531S9dV9tOcOJm5SvFLfAY21e05g59
BiUxr/Ai5ojQfFqXPAGl5VQqp+MvXg==
=0m8c
-----END PGP SIGNATURE-----

--sI1hD3+WSJjeSxKd--
