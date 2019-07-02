Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCBA5CFAD
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2019 14:41:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A57F5168C;
	Tue,  2 Jul 2019 14:40:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A57F5168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562071262;
	bh=uDX98Z5I93SqF+LXInbO6vsy1F002CX2nE6QFM2H+SM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sr2prECHrPbeQxORzqZ8Jos76j5x+t7502S0EL5g37SwihDLtQqpRMTBub3zUHa6Q
	 Sjsf24eG2huZRIFMLVijLepdSFqj94wQyVxhJsBwWGiqZs6hEVT7Wy4+J7q2KkQ/D2
	 y8J66W/LMMKO0nkJIFRJecMnuc87W0tCWoF7YqKw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AC23F800C5;
	Tue,  2 Jul 2019 14:39:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA2F9F800C9; Tue,  2 Jul 2019 14:39:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_30,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F370F800C5
 for <alsa-devel@alsa-project.org>; Tue,  2 Jul 2019 14:39:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F370F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="DFaNMflK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PMFCKZiXicAQMtquC7bGYI97XiNDd17QRMBMaYxZxWo=; b=DFaNMflKkdpkgjYaxyafPpwGp
 M1sg8/FwV9x40LxrnKuhQZGk8Q64HLvPiVYbm7NRgVc5WKSuFkLzyB1u6m8sHM8Lhhk89JhA49YzL
 Yjy7bZni2ySvnBaZDtDWGe7G0ngUy97ywfTVNErY+hKDg8t9L/ra4PH7vHCKyMh9dUUJA=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hiI3z-0002KZ-G9; Tue, 02 Jul 2019 12:39:11 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 445A3440046; Tue,  2 Jul 2019 13:39:10 +0100 (BST)
Date: Tue, 2 Jul 2019 13:39:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190702123910.GJ2793@sirena.org.uk>
References: <87blyitky2.wl-kuninori.morimoto.gx@renesas.com>
 <871rzetkuo.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
In-Reply-To: <871rzetkuo.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: This sentence no verb.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v2 07/23] ASoC: au1x: psc-ac97.c: use
 devm_snd_soc_register_component()
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
Content-Type: multipart/mixed; boundary="===============1879959332006279851=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1879959332006279851==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VIOdPewhitSMo36n"
Content-Disposition: inline


--VIOdPewhitSMo36n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2019 at 01:08:34PM +0900, Kuninori Morimoto wrote:

> @@ -426,8 +426,6 @@ static int au1xpsc_ac97_drvremove(struct platform_dev=
ice *pdev)
>  {
>  	struct au1xpsc_audio_data *wd =3D platform_get_drvdata(pdev);
> =20
> -	snd_soc_unregister_component(&pdev->dev);
> -
>  	/* disable PSC completely */
>  	__raw_writel(0, AC97_CFG(wd));
>  	wmb(); /* drain writebuffer */

I don't think this is 100% safe - with this change we will turn
off the hardware block before we unregister the component which
means that we might try to interact with it.  If we're converting
to devm then we need to be careful the ordering of the removal
won't be affected.

--VIOdPewhitSMo36n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0bUG0ACgkQJNaLcl1U
h9BAFwf8DW6cBSudo2opgcNsGeY8xGFnPbqd0ajz/RRPlbykaiH8TlHNBVomjtZM
LFyZFlyfUUzwOQZqozrWjSmrB+bzLL3owLqG8ndtIPJla4YWOYSZuDdLNFyhaMpx
bvifOcYwsxBq2lZS6SLmW0BH+dIMm67g8pbf9LIStNLZxKtLZhYoT+rJJilWHVhQ
aVEUvipsP//JSEmZkA2jlfryks+Oz6FdLI6yWm8tshGVKUPe00SmdvRLAgwY4Ifm
FjMhLKZ2sefEZk70vCu9kg+WISRvKRTQQoebVYwKdUwlCeyIX23Gpmoprt4vM15I
T06e2uN40XC6wDU/jya5b43WqUxZfA==
=Vu+5
-----END PGP SIGNATURE-----

--VIOdPewhitSMo36n--

--===============1879959332006279851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1879959332006279851==--
