Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE33F87A31
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 14:33:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52D991660;
	Fri,  9 Aug 2019 14:32:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52D991660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565353986;
	bh=Y1rLliZoomUDjzv1GuA/2i0QxnKxaHf+BHnXfjO/47o=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F4D4YTijkgstQNHcQA3Awr7JAoc+uOzRzyAXwxPa0mYQL/rPNgmXvRst6Ib14a5Qk
	 SQCOkr9vn9NZfTuhQauKLmqWqUVeEvGAMEy+kamzp08FyPC+R4syYkqTSSTaV7DLaf
	 HTUSuFrxHajmOAjInF9MUumrUsYzC3nnGvah5yZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0F36F80391;
	Fri,  9 Aug 2019 14:31:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80028F803F3; Fri,  9 Aug 2019 14:31:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEF05F800E4
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 14:31:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEF05F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Wh7hAlHD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pyBBsbalHEvtPhoCExuHav8txrXCNwbsReP97YH2hRk=; b=Wh7hAlHDJXrNQvL2E8vafoxwe
 eXEdpKG1tXNZupk7mE6dJQYL6UgojaSJdJoQsz2L0bWq12zW9kxuI4cVhiPI+T7y5WnwwCG5s2FVl
 ucUNM4/CdbBjNqW5GoFaSjBKISPhvig8gDI5VMLhMzdQRAk5pC7iTmHPwYRzyBeRYrRZ8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hw437-00060J-Ee; Fri, 09 Aug 2019 12:31:13 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 7B2A8274303D; Fri,  9 Aug 2019 13:31:12 +0100 (BST)
Date: Fri, 9 Aug 2019 13:31:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Julia Lawall <julia.lawall@lip6.fr>
Message-ID: <20190809123112.GC3963@sirena.co.uk>
References: <alpine.DEB.2.21.1908091229140.2946@hadrien>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1908091229140.2946@hadrien>
X-Cookie: Klatu barada nikto.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, kbuild-all@01.org
Subject: Re: [alsa-devel] [PATCH] fix odd_ptr_err.cocci warnings
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
Content-Type: multipart/mixed; boundary="===============5866224848001637883=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5866224848001637883==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eHhjakXzOLJAF9wJ"
Content-Disposition: inline


--eHhjakXzOLJAF9wJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 09, 2019 at 12:30:46PM +0200, Julia Lawall wrote:

> tree:   https://github.com/omap-audio/linux-audio peter/ti-linux-4.19.y/w=
ip
> head:   62c9c1442c8f61ca93e62e1a9d8318be0abd9d9a
> commit: 62c9c1442c8f61ca93e62e1a9d8318be0abd9d9a [34/34] j721e new machin=
e driver wip
> :::::: branch date: 20 hours ago
> :::::: commit date: 20 hours ago
>=20
>  j721e-evm.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> --- a/sound/soc/ti/j721e-evm.c
> +++ b/sound/soc/ti/j721e-evm.c
> @@ -283,7 +283,7 @@ static int j721e_get_clocks(struct platf

This file isn't upstream, it's only in the TI BSP.

--eHhjakXzOLJAF9wJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1NZ48ACgkQJNaLcl1U
h9CcMQf+Km4bvdFc5fXpozUNHkhmiDGf5UtThFctMq6C6MK4tB+cTSjQqpLPip75
hihD/NMWNNvcxkJxNaK5pDv4yEWI+F9DLhjLePmCOdUjg68CwYF2e5tLEKs7LAzo
muAywApdJXbOOd+1yGG5lKw0EEoidrU5n9rzBYSbSjKwbtFhf4C1rQ8GO7T15S7U
+0sq47MSOf3Q5fji1RcvGy98RkZbzU9gcheLcTXcQfRZ+eapGu11PmHR+OqgO/GG
owL2DpqbypT+9iLdfmR9AOxwi3ykOWtU93h8uMh1tmDxfT4Auuj5j8leIEVdoCHP
KKhhYS2X70ImKlg4SeUrEJQTcWVntw==
=ykm0
-----END PGP SIGNATURE-----

--eHhjakXzOLJAF9wJ--

--===============5866224848001637883==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5866224848001637883==--
