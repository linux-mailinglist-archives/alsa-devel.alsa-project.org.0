Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DD817F73F
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 13:18:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 725C2166B;
	Tue, 10 Mar 2020 13:17:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 725C2166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583842703;
	bh=tWRu8/U2p303L6P0+/S9ujcN7AWVENqPSrwamrXQISU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DHC/w8BWswAQ+zu+TPQikPcsEuu6HqA4YR8GuM4dAiJEEJQa79HTihE6EWb14iDVi
	 9QmUPmf8feSPI/y9d+0yNWohF6Jt19XGy577UXWi4LJ1/3/vZd0VflNd47T4DPclfb
	 Ej+N5CIZS4lgEyiRNmtyk68t1OENpGZ+P+b5hHeU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86259F80123;
	Tue, 10 Mar 2020 13:16:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84EFCF80217; Tue, 10 Mar 2020 13:16:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id B2904F80123
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 13:16:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2904F80123
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A60230E;
 Tue, 10 Mar 2020 05:16:35 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DA863F67D;
 Tue, 10 Mar 2020 05:16:34 -0700 (PDT)
Date: Tue, 10 Mar 2020 12:16:33 +0000
From: Mark Brown <broonie@kernel.org>
To: "Rhodes, David" <David.Rhodes@cirrus.com>
Subject: Re: [PATCH] MAINTAINERS: Update Cirrus Logic codec driver maintainers
Message-ID: <20200310121633.GB4106@sirena.org.uk>
References: <alpine.DEB.2.21.2003061508150.32557@james-tower>
 <33FB8674-6779-437E-B647-BA651C121A77@cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Content-Disposition: inline
In-Reply-To: <33FB8674-6779-437E-B647-BA651C121A77@cirrus.com>
X-Cookie: In space, no one can hear you fart.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Austin,
 Brian" <Brian.Austin@cirrus.com>, "Handrigan,
 Paul" <Paul.Handrigan@cirrus.com>, "Schulman,
 James" <James.Schulman@cirrus.com>
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


--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 06, 2020 at 09:18:10PM +0000, Rhodes, David wrote:
> Acked-by: David Rhodes <david.rhodes@cirrus.com>
>=20
> Thanks,
> David
>=20
> =EF=BB=BFOn 3/6/20, 3:10 PM, "Schulman, James" <James.Schulman@cirrus.com=
> wrote:
>=20
>     Brian & Paul are no longer active audio codec driver
>     maintainers. Update list to reflect myself and David

Please don't top post and please also look into configuring your mailer
to quote mail in a more standard fashion.

--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5nhSAACgkQJNaLcl1U
h9APQgf7BalprPl+bcpC2Rv2Yf4Yf4BzzZ12qqA6HcS1vKRVvoTX4R+MhlldA/aa
GlSi7klXI2sJcNvo3T87bZ4+U8g/PEfbNE5KjU2DmQQ++dpT6FxVY/4YQcEogdz+
ZfIy0zzRl0/OUtXFY+S9nsBO8UgdtwOBBNKo5MTMu/LPWJ0oaa+re7AKh9xFSeRG
f/3L8s2hwYMgVQomo79bjVcSMIy3eCBEVvnglLRi0uuB+qRuztS7t3CY9UsYc3HU
5/Mpp7SCDg2UpjSHeJZmiVpGu9vbC0pU7EdQAyF1kYO7aOjHBh3NIDaT/z3WxR95
wm+g8bfmyevzwSgjoCwg7Y6V9CkTrg==
=XP1n
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--
