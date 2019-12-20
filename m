Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D01E12804B
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 17:03:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0BC91654;
	Fri, 20 Dec 2019 17:02:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0BC91654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576857825;
	bh=3AagRqHsZg/sGB0z3P0KiyGAX1zFV4w7B6s1Px2zr9I=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uwJ09IyMBrI6wtqGRhC8lNKSypf7ySBLG1o5ZiB9lC1UoOtUOor5Msav3RmNz33lG
	 U20UUFAkOSeSWTapX8JUF6/0gDdYbbmRv9yWh1mZHGg7PggY84nK2RKQPFifwWuK6i
	 CYWIYtTJjhHUr97cpAjfacXTHCHmojtBhvjgk0fc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E4CAF8015A;
	Fri, 20 Dec 2019 17:02:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C03DEF8015A; Fri, 20 Dec 2019 17:01:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 157CFF8014C
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 17:01:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 157CFF8014C
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7B2E106F;
 Fri, 20 Dec 2019 08:01:54 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 004163F6CF;
 Fri, 20 Dec 2019 08:01:53 -0800 (PST)
Date: Fri, 20 Dec 2019 16:01:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20191220160151.GI4790@sirena.org.uk>
References: <20191219213257.366145-1-marex@denx.de>
 <20191220130030.GE4790@sirena.org.uk>
 <8769149d-99c4-f577-bc9b-c621c4f3eba4@denx.de>
 <20191220130250.GG4790@sirena.org.uk>
 <6c387365-2512-d41c-8804-58e31173bc26@denx.de>
MIME-Version: 1.0
In-Reply-To: <6c387365-2512-d41c-8804-58e31173bc26@denx.de>
X-Cookie: I think we're in trouble.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>, alsa-devel@alsa-project.org,
 festevam@gmail.com, Igor Opaniuk <igor.opaniuk@toradex.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: sgtl5000: Fix VDDA and VDDIO
	comparison
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
Content-Type: multipart/mixed; boundary="===============4582379036552005649=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4582379036552005649==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X+nYw8KZ/oNxZ8JS"
Content-Disposition: inline


--X+nYw8KZ/oNxZ8JS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 20, 2019 at 02:10:13PM +0100, Marek Vasut wrote:
> On 12/20/19 2:02 PM, Mark Brown wrote:

> > Like I said above "please add an interface for this if it's needed".

> I'm asking whether such a thing exists already :)

> If not, then I'll add it in V2.

You'll need to add it.

--X+nYw8KZ/oNxZ8JS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl388G4ACgkQJNaLcl1U
h9CTMgf+JfiF7sBgEjfvMog3tmGzy2XEAjuBH4qvE4MW469E1nPy1dF9z6heD1if
QRRMDuX12ztWuexQ41SoLyNE4ijaCdCufhaKUP7GubpPNt5SsLqXEnDy8hQZ9aNB
yA+OkLCFPtBAx4nrXAVYRbp/DSc+4kRU2QTNnus4CV3xyILoHK/wXurez/yJZyVq
Ia/zWmY3sEH9MyDZILgHJv0AfDkBDxCm4AonTDL7U9SSbCGddFv39AxKmR5XTNvt
WTrK3TmKflt758lYpnzo8UnHkwEnvjK9Z0Ge37h8NNdyESi40Z0UYQCEgU4Iy0kJ
NrFEAe2lejuuhtTLrwsn5TpMLl9tAw==
=3a9F
-----END PGP SIGNATURE-----

--X+nYw8KZ/oNxZ8JS--

--===============4582379036552005649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4582379036552005649==--
