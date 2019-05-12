Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6271AD6F
	for <lists+alsa-devel@lfdr.de>; Sun, 12 May 2019 19:09:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C2041739;
	Sun, 12 May 2019 19:08:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C2041739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557680958;
	bh=zV5yxlnpnsGli3gYvyY2aJC2t1g566WUxo/D7TrSeAI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qk71wZm5AHFa4Yas8vVC2XHSL4pjh9A0EZGrlt6GT5PRh2zHxmT9Qo5gkgzbWErue
	 9sgKzL3iAZqHDT3Ok2tp7cgR7/tHkDJDh5qjrFtRdqdk6unrpoJmlHB4HQIcLIPDhq
	 2l+fmW+dv9WLa6t71pCX5dJh9u9jl7n1cdI67xuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27D4EF89732;
	Sun, 12 May 2019 19:05:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9731AF8970B; Sun, 12 May 2019 19:05:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DATE_IN_PAST_06_12, DKIM_SIGNED,
 DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 304A1F896CB
 for <alsa-devel@alsa-project.org>; Sun, 12 May 2019 19:05:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 304A1F896CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="DNjQLn0H"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tRywM4a9d9c7PZ+2utucoWWnFoGTVYSgeCk543qU3wg=; b=DNjQLn0HcLyWHMCGxc1U/jjon
 90yARKt9emU0Mw2Feh4QMiLpHgQD0TtdGUy4AeYuqN8Q8F+unRCTtAoo3KXX+FfqMRxrfB0e3QzVv
 mWARzhHwQTOuXn70FZuas2GfJgAo1gpVjnLvGVPMPjVIVAR6wsycMo2C1QK1D9sSH0VV0=;
Received: from [81.145.206.43] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hPrut-00044S-MT; Sun, 12 May 2019 17:05:39 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 013D5440040; Sun, 12 May 2019 09:06:21 +0100 (BST)
Date: Sun, 12 May 2019 17:06:21 +0900
From: Mark Brown <broonie@kernel.org>
To: Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
Message-ID: <20190512080621.GH21483@sirena.org.uk>
References: <20190416022246.10121-1-derek.fang@realtek.com>
 <20190416153510.GE4834@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B8280116192E@RTITMBSVM07.realtek.com.tw>
 <20190417150518.GB5703@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B828011660AC@RTITEXDAG02.realtek.com.tw>
 <20190508064537.GN14916@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B82805B1144E@RTITMBSVM07.realtek.com.tw>
MIME-Version: 1.0
In-Reply-To: <BC6F7617C38F3E4E8CA887E07B35B82805B1144E@RTITMBSVM07.realtek.com.tw>
X-Cookie: HOST SYSTEM RESPONDING, PROBABLY UP...
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Albert Chen <albertchen@realtek.com>,
 "bard.liao@intel.com" <bard.liao@intel.com>,
 Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rt1308: Add RT1308 amplifier driver
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
Content-Type: multipart/mixed; boundary="===============4697363309510714797=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4697363309510714797==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zq44+AAfm4giZpo5"
Content-Disposition: inline


--zq44+AAfm4giZpo5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 08, 2019 at 01:17:54PM +0000, Derek [=E6=96=B9=E5=BE=B7=E7=BE=
=A9] wrote:

> > The maximum volume can be limited with snd_soc_limit_volume() but if the
> >  limit is for the speaker then that's machine dependent anyway.

> The maximum volume setting is temporarily not machine dependent.
> It avoids harming if any machine doesn't set the limit volume.

I'm confused about what this limit is - is it just some arbatrary limit
imposed in case some board has problems or is it an actual limit that
comes from the chip?  If it's a "just in case" limit then the board
should be the one doing the limiting, yes people can break things but
it's difficult to get decision like that done sensibly in the CODEC
driver in a way that works for everything and the general expectation is
that this is all for use by system integrators rather than end users.

--zq44+AAfm4giZpo5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzX0/0ACgkQJNaLcl1U
h9CW9gf/dGgxm0Ei1luubjgk7yVXL/o4X6YxUmpuqM1XohgzC9RyjgR9lJ1Uybfq
TtzaF1Ebi3TBvcKsd7V9fgkJ+k+a1giGPFjYK7YjQnMXYzfQKEYgfzpJS2zz8kJL
GkyVJmSIVcwEO9I6uHZMsYaC0/NZAxakPxxCy4yCV4XSetzFllE4kU8HvDBHggf2
MaO7lvAYp6RTyGCNq7WAWUBKWyUF/W2/e2KbAdhQRL0Hs/YvvBYU3tLC4coUPeDD
EzfMVQqZNqnxnfmE31BDB5I3DeXoIb05tjMZJuTgKf4xXpPIO/KB0Y/MMchYE0Pb
lD/ESimbo9iI8dyd0ctbE7FphJuzig==
=rbXA
-----END PGP SIGNATURE-----

--zq44+AAfm4giZpo5--

--===============4697363309510714797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4697363309510714797==--
