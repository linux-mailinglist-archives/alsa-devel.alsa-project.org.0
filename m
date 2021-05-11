Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F6937A927
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 16:26:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3665A17F6;
	Tue, 11 May 2021 16:25:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3665A17F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620743171;
	bh=cYKm6HVUSnlFpYItm/yTuj98lPr3iKAOjcgTiF6rZq4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R6cPle5WKY3oFSRZMwkf9e1PO8JYyPUiRT7K338OPdDzyjvSdpDl3OZeIm/6pGMoQ
	 zWlqcHhr/Cq3Dphl/UcQR20PYvlUP3vDksgBdFECg7Dv1LXgOeVXgPDjdeZ72pbv5Z
	 3zBk6kh2wQ9stji/zsXtZKoHzMvvWevEh19z6Ky8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E182CF800E9;
	Tue, 11 May 2021 16:25:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24A2BF80279; Tue, 11 May 2021 16:25:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E68B5F80163
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 16:25:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E68B5F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PsG2FuIq"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2336B61376;
 Tue, 11 May 2021 14:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620743113;
 bh=cYKm6HVUSnlFpYItm/yTuj98lPr3iKAOjcgTiF6rZq4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PsG2FuIq3Ck8y3US1ag35agxE88VEuQwZehX6D0TlMq1JASIKEiF9vUNCUO8uw3Px
 Sur8BGfFnnBYgsFCgR6PNaf45yhze1jrDBunl1J/KkoFefP3Tbpp0dJg8vAvfGct96
 6z8rvZVXNcd7Xb7gan2AOYSdOyvuSBzi1XsJ+dSgXm9UghLMSIUwZ+WjuhKoGP6T50
 C43SR9bxDMeSIcryWTuNyKhzHtsMKpyy6ZHUyQFGneP+D59gMaPgFvFOwvmvAuoWs/
 EHJZbHp8114QfSw7g/EP0uuFf+KmwjT7CBzN9sofGC6py/feYBr63nXnlRSMwZtZe1
 HTEA2eG/MNyCQ==
Date: Tue, 11 May 2021 15:24:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 00/14] spi: pxa2xx: Set of cleanups
Message-ID: <20210511142433.GK4496@sirena.org.uk>
References: <20210423182441.50272-1-andriy.shevchenko@linux.intel.com>
 <162072071980.33404.13031284441613044277.b4-ty@kernel.org>
 <CAHp75Vck5izDB4mTRV5hTaknpx5Bm+OA4rNLVznQxVaEwigBZg@mail.gmail.com>
 <20210511134706.GI4496@sirena.org.uk>
 <CAHp75VdPHYEq+Xn5yQ+TyQn5uerc+afcVaHj22OmVzsBW2jcaQ@mail.gmail.com>
 <CAHp75Vca2KT4kd9zw3ECqym1rRDSg2NNbwRRVVA1L7vyD3VCJQ@mail.gmail.com>
 <YJqRBIdTlvnsCYsn@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="IA03tywDYuoVKXrw"
Content-Disposition: inline
In-Reply-To: <YJqRBIdTlvnsCYsn@smile.fi.intel.com>
X-Cookie: Beam me up, Scotty!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 linux-spi <linux-spi@vger.kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Daniel Mack <daniel@zonque.org>
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


--IA03tywDYuoVKXrw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 11, 2021 at 05:13:24PM +0300, Andy Shevchenko wrote:

> Just in case I'll send a v4 with only patches that missed.
> Otherwise it will be the same as in v3 (see above).

Please stop.

--IA03tywDYuoVKXrw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCak6EACgkQJNaLcl1U
h9BzfAf+JkN8G2rlBgCENlamTmALPdNW3irdn7hPyTC4DM9BFCiQ9erqn4QE+bnA
tysguWfrDHJbYsdP69f9edgfJNDbsICh1x0lDWqh5nWrpUXVFoyxe+gwqH+2BsnS
32yNepXNDijBa4thZTEfGO5IRNt6xGRfNZCh3osEOyJUDpvSt6WRaK1HQSJ++f6o
nt2m9dhUM3fvScGGrnGjT95aPynrtHW76YoY48nUTv3dXtJJn8v7DHCGFIKvFmI7
DW4m2xsqQLW5SvuSMe/ikwVkso9MDNOqD1iAy5A/eElH4pCbRAiK7wy+w4Sz5NrM
V39IAC49EXHnhcAUE0wbZoS/M0bz7A==
=69fW
-----END PGP SIGNATURE-----

--IA03tywDYuoVKXrw--
