Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B84D42BF42
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Oct 2021 13:53:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E22C11684;
	Wed, 13 Oct 2021 13:52:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E22C11684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634126023;
	bh=9srKXSc+H+Mvb9vA9VVHMoES0gqlfD62e5wGHBu8/O4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NWpBdWfyGbALjLh07W98WLJJsSqQvuzr+b2jZ1OFcAVWf1byag2RGamWhdu/B6u5h
	 wEQ9mDRp1VIP/9uBTtNK2eBMoYLODeZCgQjRpuXU+/ByUGT4/1FBsZcXMFnwAQ5hGN
	 wRx5fV0DmxIR7nNmlfwJj0m5NKcmwPtnvLn8joA8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43487F8028D;
	Wed, 13 Oct 2021 13:52:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FEACF80269; Wed, 13 Oct 2021 13:52:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9F2EF80088
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 13:52:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9F2EF80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="soxyYpTF"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4496760E96;
 Wed, 13 Oct 2021 11:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634125936;
 bh=9srKXSc+H+Mvb9vA9VVHMoES0gqlfD62e5wGHBu8/O4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=soxyYpTFrrzXonWGzVthH0ct8OyUxylfmlL/wdH7MvOxV2sp1Xb3Por5h8J/9DTIc
 QSqKY/godEHg5OcEdu9BolH6XkkulhiKhcpRXYJ/6Tfnp7OOyMvy6id9Ggls2GVCCu
 PrhSG4rqSNk9z2vK9cN0BZdhc7w7ISg9/msn38ou0LeI3Mmh6NSczHMf0uy+dVhcL5
 jZjaYyWf5GWA++VoeNmJymv/HivGOO2YnfAqrFL1nZwrUZJwJNVHd+IJKBy/KSvRtH
 9Vf9LEMH3uEtkIqHdQKUd5EzygMJUCWw4r4tChFDcsLN1yu5pTHLgTOwAcUhiTGnLD
 +emQXH8q4V2lg==
Date: Wed, 13 Oct 2021 12:52:14 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v3] ASoC: rt1011: Fix 'I2S Reference' enum control caused
 error
Message-ID: <YWbIbnRVHGP82N+A@sirena.org.uk>
References: <20211011144518.2518-1-peter.ujfalusi@linux.intel.com>
 <163403898174.2091644.13928014844510803055.b4-ty@kernel.org>
 <b4f96793-de6f-0b0e-346d-f6a53633575f@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uIiCwGekQ5G9FlUJ"
Content-Disposition: inline
In-Reply-To: <b4f96793-de6f-0b0e-346d-f6a53633575f@linux.intel.com>
X-Cookie: Where do you think you're going today?
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 seppo.ingalsuo@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com
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


--uIiCwGekQ5G9FlUJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 12, 2021 at 02:52:11PM +0300, P=E9ter Ujfalusi wrote:
> On 12/10/2021 14:45, Mark Brown wrote:

> > [1/1] ASoC: rt1011: Fix 'I2S Reference' enum control caused error
> >       commit: c3de683c4d1d68ff27f21606b921d92ffdea3352

> I have noted that this patch is not enough to fix the i2s reference
> support and a complete patch has been already sent:

> https://lore.kernel.org/alsa-devel/20211012063113.3754-1-peter.ujfalusi@l=
inux.intel.com/

Are you sure this isn't just b4 thinking your later version matches the
earlier version when it's the later version that got applied (you'll
have got multiple mails with one for the later version as well)?

> What keyword should I use next time to 'block' a patch applied?

You can't, there's a gap between me queueing things and testing and
pushing out and mail sent in that time might not get seen.

You should also take care that when you're sending things you're doing
so in a standard fashion, occasionally I have seen people bury things in
the middle of threads or whatever which causes b4 to think an earlier
version is actually a later one.

--uIiCwGekQ5G9FlUJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFmyG0ACgkQJNaLcl1U
h9Dcbwf9FzjqDDOuqHMQNLnXMq5bS1nuF8n2Cuv7WBl7/U/g4AK/ugpjh/VX4Mr5
dVGXcy6x09pj+ekj+uEwGViwPRGrUjQDfPf1xsH+mEbxAuVepIn8Tfc51cxc8SM8
RqLu2PrMVjbNETc++0zzgE4GK4h99ZkgclUH8SIzsEoxLM/pSnm3Kt7WLKGYX2WL
LO4LKiAyI0R5eS+fsbjdQoleuT0Wb5wOpVg4TNnqu9a2Xq7OrHtQSyaGSglNDYHW
jnHCjaJA7SsQJttJD7kbeMdzb4OiVTmuhYyt4WAfPGICfrauydEicwumukxUn2tP
MQn2o/3UiFsmUyCNcK8l8w2b8QGJsg==
=F84b
-----END PGP SIGNATURE-----

--uIiCwGekQ5G9FlUJ--
