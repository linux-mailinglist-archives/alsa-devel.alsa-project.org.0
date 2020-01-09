Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B7E136261
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jan 2020 22:20:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0588A177F;
	Thu,  9 Jan 2020 22:19:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0588A177F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578604826;
	bh=to4YpJ+aST9KpZ5VleKWOF4jSXiec+Sdb15guyPu+uk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dFBJvCTjJOFt9AKRUgJZ++4Jitt52TqbPKEC/ketg2+2FATpycDr+iPiVTMrkk15z
	 hhf9iT+2Qev3THyc0aYveOkUfqynYnvAGmzJzIDnkLzZMONerDmLX4J3rz7JmoZHm5
	 j2XREc5qP+sEKfmdjnC9/lXGf3tYBheBN+ieFt0Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B2A5F801EB;
	Thu,  9 Jan 2020 22:18:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52AE5F8015B; Thu,  9 Jan 2020 22:18:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 8756FF800E4
 for <alsa-devel@alsa-project.org>; Thu,  9 Jan 2020 22:18:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8756FF800E4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A28B031B;
 Thu,  9 Jan 2020 13:18:35 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25B623F534;
 Thu,  9 Jan 2020 13:18:35 -0800 (PST)
Date: Thu, 9 Jan 2020 21:18:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <20200109211832.GI3702@sirena.org.uk>
References: <20191219123709.GB5047@sirena.org.uk>
 <aba9f63c-d993-e54e-4daa-9dbc35d0683b@samsung.com>
 <20191219130559.GE5047@sirena.org.uk>
 <a10269be-8caf-6e07-71c6-582a1d2c1458@samsung.com>
 <CGME20191219191651epcas5p2ab8031875093df401d9182e7c491eb3d@epcas5p2.samsung.com>
 <20191219191646.GH5047@sirena.org.uk>
 <b0e57646-8a14-e6c0-9daa-28c353dcb77a@samsung.com>
 <31bde14e-1fef-264a-ba1e-fc3051506bf3@samsung.com>
 <20191220120154.GB4790@sirena.org.uk>
 <aed6ff4e-1c04-e20c-aa55-4f2b05952f38@samsung.com>
MIME-Version: 1.0
In-Reply-To: <aed6ff4e-1c04-e20c-aa55-4f2b05952f38@samsung.com>
X-Cookie: Killing turkeys causes winter.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Dylan Reid <dgreid@google.com>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: max98090: save and restore SHDN
 when changing sensitive registers
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
Content-Type: multipart/mixed; boundary="===============5329569442190191730=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5329569442190191730==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oxV4ZoPwBLqAyY+a"
Content-Disposition: inline


--oxV4ZoPwBLqAyY+a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 08, 2020 at 12:54:30PM +0100, Marek Szyprowski wrote:
> On 20.12.2019 13:01, Mark Brown wrote:

> > OK, thanks - that's definitely not the recent refactorings then but
> > something that's been a problem for a long time.  I'm surprised nobody
> > else ran into anything if that's the case...

> It took me a while to get back into this issue and investigate it in=20
> details. It turned out to be an incorrect helper to get component object=
=20
> in max98090_dapm_put_enum_double() function. Following patches:=20
> https://lkml.org/lkml/2020/1/8/358 fix this and (independent) lockdep=20
> issues.

Great - I already applied those.  Thanks so much for taking the time to
dig into this and figure out what the underlying problem was!

--oxV4ZoPwBLqAyY+a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4XmKgACgkQJNaLcl1U
h9BWQwf7BHTGKaPMG4wpsTigkhm128e94wCef8tBKBif+xS1hZL0TvxZZk0OpSDc
8kG+dxM64qp7AQio2LFSxFxyetR/E2U2NeZDfzQb1i1fsSYDC4SvKd9ah2LOqle4
p0xqJoRUwJT9AH2fT/TEy+H41dT6JLjeI+mU1fOd2U3QzWLn44+K0q9RDjNZr9o/
JGAXz+90+UwsrLgZv2+b12WePS9Meo+9D6uda4pqP8pUsrAyhtm+GwqTEx12nMuI
zecZrvny60em/OskNoClNCBkUEVXwgxQlm43kDxXXcHdHqnE0FS3zERcVyEHWjYK
zqQCFqhBWcY6X4wGKCdMDSeIOLVyaA==
=wRRf
-----END PGP SIGNATURE-----

--oxV4ZoPwBLqAyY+a--

--===============5329569442190191730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5329569442190191730==--
