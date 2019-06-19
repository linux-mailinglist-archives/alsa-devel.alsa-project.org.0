Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6374C12A
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 21:02:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94655168A;
	Wed, 19 Jun 2019 21:01:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94655168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560970928;
	bh=m+EPh4g4VdCIKQ5SEsrDiGBzcG0umX87FQDdLneLoXg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h53TbioFKEkXKT4kJUUr59Mk1SZ96pPEOnObXJ8dN9Bk2qR6xofsD/6JyQPOlhmnk
	 wc6+nWFuWumw5MJIVt3zhPNzS2XUkCX77zhQEAqzY8tIviGJCOljR4DnjUhgNS9iaV
	 eDXeYHZ1eSG15se5DsEwY/GYxZzUEq0F5dVX2k/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3444AF896B8;
	Wed, 19 Jun 2019 21:00:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01565F896B8; Wed, 19 Jun 2019 21:00:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4D01F80C87
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 21:00:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4D01F80C87
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Fw6SIdv8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WH2ALIozatkzyhg54R3EaETJH7ZgIcoluLGl86FPDPI=; b=Fw6SIdv8vre/232pUtXmPbby4
 lYZkDWbFxhIIuZN0Jy0F3/mVluIxbkbD7pU/yoMh4VSZeuCdzx2+7m8s66I0UEgKChE43iJViK26Y
 mb7Nr7B7aBO4EMjtQkJ1VPy0OWulf87xBSIl09URcZWKCPhVBfbMtKGtTIcWtMuRHDnh4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hdfof-0007nR-GD; Wed, 19 Jun 2019 19:00:17 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id F359B440046; Wed, 19 Jun 2019 20:00:16 +0100 (BST)
Date: Wed, 19 Jun 2019 20:00:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190619190016.GZ5316@sirena.org.uk>
References: <20190619121158.E355D440046@finisterre.sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20190619121158.E355D440046@finisterre.sirena.org.uk>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Applied "ASoC: soc.h: dobj is used only when
 SND_SOC_TOPOLOGY" to the asoc tree
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
Content-Type: multipart/mixed; boundary="===============3036874137180364389=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3036874137180364389==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WSf/+y6apGpKq+5a"
Content-Disposition: inline


--WSf/+y6apGpKq+5a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2019 at 01:11:58PM +0100, Mark Brown wrote:
> The patch
>=20
>    ASoC: soc.h: dobj is used only when SND_SOC_TOPOLOGY
>=20
> has been applied to the asoc tree at
>=20
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git=20

Dropped this, it breaks the build in a lot of configurations since dobj
does have some other users.

--WSf/+y6apGpKq+5a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0KhkAACgkQJNaLcl1U
h9BYLgf/fORxqFPisc/41mAvSIrarhLNbulNMBHfx/k+em30kKwFiqESMiqQQRpU
QVGsqTaYALb05JvPbEtNjLbsWT5P4Su5isY82NyOAlY8hsrfVqIvOXboL6cm03Nx
OR0HxhDnZDntPuKbfI+MktrnuXWToCJgCI25fUzPW4fHb3ziQzqrACAEnKE0fonx
8RS2cHRkc+zhoPsKEObKywl5fQxsGdZxcpNhgKZ6VB7Wyti23rBaXAbM3bChPHdQ
P/Ct2UugeFEla3mdBXCs8jNQr4Nnb4qkHdoJwwk2N/9Hj0vPRmpNDrsAUJ4yQEiY
BV/wHg37ihUyFQVMbss1WclO8m+K5Q==
=/Ik5
-----END PGP SIGNATURE-----

--WSf/+y6apGpKq+5a--

--===============3036874137180364389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3036874137180364389==--
