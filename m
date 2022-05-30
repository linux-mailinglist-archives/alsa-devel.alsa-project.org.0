Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C514537C09
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 15:30:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA7CB1B00;
	Mon, 30 May 2022 15:29:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA7CB1B00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653917427;
	bh=hn2V4qs7yJeXQ+z1F4QlNL0NTXBEMQHkw2eL4vCmNsQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f5dFFC6iHYibsPftSR6KsbY3r8zp1G+2amo4sx6+HN2PeTHPu4dum2gy2YCuBOjdl
	 bhiq7NrXLY2OgT4xdS97UA93ARA9y3zwMlkNPPgeyDmAKqpzT2ijSBtA6Gq/TYGeyo
	 i55T3MPwxPo7la+MhRN2vRWVF4OKgfc3pJ46UUzg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B6F5F80526;
	Mon, 30 May 2022 15:29:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A8E5F80527; Mon, 30 May 2022 15:29:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADBFBF8012F
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 15:29:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADBFBF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nqW2QwXs"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D1540B80DA8;
 Mon, 30 May 2022 13:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21E61C385B8;
 Mon, 30 May 2022 13:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653917356;
 bh=hn2V4qs7yJeXQ+z1F4QlNL0NTXBEMQHkw2eL4vCmNsQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nqW2QwXs+IIYAzIC7M9z8IbQnCN0IPbT4GxRM7Wuiu4T1bj1i6kd0/OcTiorzwWbi
 aIgy99zkIvD+T7gNSNTOjje1o34VwqZ0SNXpER0uuR12T9bqsbnFe2ryDPDJJgs13G
 Y8VaiF85b3DInlhafxR6/EMX9dLyRIQnQZDKtiDNhLq4bFrNhhFQOOmYI8TF7nQVbk
 kJKYq9nLZdyI8UIbg5oCiXsmo2Ox/Kjxic/40Kaibt7G42344uGzN2hFRFBZT2i/BZ
 0Y6Wk/Z1u799A9IxK3rX9nyEQz8Q0gYqLgRJ3AzbB/9e3LEviw9LvoZuJfv1Dc1fud
 AyjPV/zvC/K6Q==
Date: Mon, 30 May 2022 15:29:13 +0200
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3 11/15] ASoC: Intel: avs: Machine board registration
Message-ID: <YpTGqSvaRc0Jm6y8@sirena.org.uk>
References: <20220516101116.190192-1-cezary.rojewski@intel.com>
 <20220516101116.190192-12-cezary.rojewski@intel.com>
 <20220526162443.GA60418@roeck-us.net>
 <Yo+8hvwhvdx7tNGI@sirena.org.uk>
 <20220529054807.uuqpsnt3w6dwlzuj@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RZJEg1LJLcJObZM9"
Content-Disposition: inline
In-Reply-To: <20220529054807.uuqpsnt3w6dwlzuj@pengutronix.de>
X-Cookie: May your camel be as swift as the wind.
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 rad@semihalf.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 hdegoede@redhat.com, lma@semihalf.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, Guenter Roeck <linux@roeck-us.net>
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


--RZJEg1LJLcJObZM9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 29, 2022 at 07:48:07AM +0200, Uwe Kleine-K=F6nig wrote:
> On Thu, May 26, 2022 at 06:44:38PM +0100, Mark Brown wrote:

> > FWIW given how hard the 0-day reports have become to read I'd not rely
> > on people paying attention to things that are clearly pure build
> > coverage based off a 0-day report alone.

> I'm unsure if I understand your sentiment correctly. Are you saying it
> doesn't matter if a patch breaks the build on some arch using a
> randconfig?

It matters, but in practice something that is only reported by an
automated tool with a hard to read report against a a randconfig
on an obscure platform that you need to go find a toolchain for
is a lot more likely to get buried than something that doesn't
have those properties.  Similarly if a tool is sending a lot of
reports with those properties it's a lot easier for even reports
in more important issues from that tool to get dropped on the
floor.

> My position is: The commit under discussion (i.e. beed983621fb ("ASoC:
> Intel: avs: Machine board registration")) breaks an allmodconfig build
> on all platforms where __fls doesn't return a long int (i.e. arc, m68k,
> and sparc). This actively hurts people who do build tests using
> allmodconfig (or allyesconfig) for their patch series (e.g. me).

> I agree that some reports by the 0-day bot are hard to parse. But still,
> if there is a build problem someone should look into that. If you (with
> your maintainer hat on) don't have the resource to do that, that's IMHO
> fine. But I'd wish you'd push back on the patch submitter in that case
> and don't apply the patch until the problem is resolved. If this is a
> corner case randconfig issue, applying might be fine despite the build
> error but breaking allmodconfig on 3 archs is bad.

My general approach here is that I'm expecting the reports from 0
day to be enough so I don't explicitly push back, but I don't
generally apply anything that looks like it has a live issue.  In
this case it looks like what happened was that 0-day only
reported against v2 and not v3 so it wasn't apparent to me that
the report hadn't been addressed in the new version, there
weren't any reports against v3 that I can see.

The other thing here is that if something did get missed and ends
up getting applied it really helps to get an explicit report that
there's a problem in -next, clearly something got missed and it's
much easier to get something dropped just after it gets applied.
TBH I hadn't realised from the followup that this was an
all*config issue, my best guess was that it was a randconfig
thing thatg got missed.

--RZJEg1LJLcJObZM9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKUxqgACgkQJNaLcl1U
h9DVBQf/QnWGVpB8OzmEv1vbvoOlXmttHq9xgW6IDqrSVOBwI0SLnTr5mFLhWEiU
wXQChzIGwAQSMaS8fA2ex0pE/zUtdPEm8zz2AAoN+I0pVBPdGiraeZvWs1fa+0GM
s0xuMKnQNlyLY9ICHWdfbfGu/Ca/cDRnsWR2IO3RfbBpBHKX4XNoNrXos+ir8YXA
2qk0wUyP0IB4Zx3mkQ6ELW8e97btzbDNqX8ADvCPbpWVc8QU+GjWJViU85CU4XSe
12nBtAE2psGqWCivAbfSv3EbfdtSOI4sfeGR1khGTi9u29y9BhoT8v5R2YCJXw5W
pivrDG8cNuBVssFYMrk0KZISRf2pdQ==
=rw5e
-----END PGP SIGNATURE-----

--RZJEg1LJLcJObZM9--
