Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DD8183D4
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 04:35:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BD191869;
	Thu,  9 May 2019 04:34:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BD191869
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557369322;
	bh=6r4P35viTT6ro1aKHo4gxuuO5kcC38Y2Mv+8z4qAsh8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BHxwY7bcDKtY9co1IDTE3jd0YCon782FbDpIYYlTtDILUeavoYasVRy0zZbcDKIlP
	 cgPLK61NFaOlwKWOxse7lL5uXQdfLUARbwtYiua+HMU8Ao2x7tkCfDp2hv/T+ISAMi
	 LYyKXrx3HxkbQZnLjRitRFTfKEiNm6VvkcVlcaSg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA76CF896F9;
	Thu,  9 May 2019 04:33:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F056BF896DA; Thu,  9 May 2019 04:33:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CAB2F89674
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 04:33:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CAB2F89674
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="nJxn1+XU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aZoZ4GWcbpWsgpjTiEUkeXaU+3wLzUphoaDab9rae8o=; b=nJxn1+XUliTegVDvekoQ0KNWi
 QWIyMZvSpqwaKl6IifiVzm93zDTwzj3nhbwM2oUmXF5aPZ1VhFarCZZpl8+zmdd1ixsturLc2TZKX
 BLF1dsM3Pe7G5heyvGXWxVX3Ed3PlMV9AUAAhYG4ReMuNbil/sj4UK02VP95Nb5ZwXGvg=;
Received: from [2001:268:c0e3:9e6d:fb20:4124:5afd:9c02]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOYsO-0001Rk-CJ; Thu, 09 May 2019 02:33:40 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 1AA8244000C; Thu,  9 May 2019 03:33:36 +0100 (BST)
Date: Thu, 9 May 2019 11:33:36 +0900
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Message-ID: <20190509023336.GU14916@sirena.org.uk>
References: <20190508162223.75322-1-tzungbi@google.com>
MIME-Version: 1.0
In-Reply-To: <20190508162223.75322-1-tzungbi@google.com>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, dgreid@google.com, tiwai@suse.com,
 cychiang@google.com
Subject: Re: [alsa-devel] [PATCH] ASoC: max98357a: request GPIO when device
	get probed
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
Content-Type: multipart/mixed; boundary="===============1773904902100778053=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1773904902100778053==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="InWnmNMQ0pNZrrCy"
Content-Disposition: inline


--InWnmNMQ0pNZrrCy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2019 at 12:22:23AM +0800, Tzung-Bi Shih wrote:

>  static int max98357a_component_probe(struct snd_soc_component *component)
>  {
> -	struct gpio_desc *sdmode;
> -
> -	sdmode =3D devm_gpiod_get_optional(component->dev, "sdmode", GPIOD_OUT_=
LOW);
> -	if (IS_ERR(sdmode))
> -		return PTR_ERR(sdmode);
> -
> -	snd_soc_component_set_drvdata(component, sdmode);
> -
>  	return 0;
>  }
> =20

This function is now empty so can just be removed entirely.  Otherwise
this looks good.

--InWnmNMQ0pNZrrCy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzTkX8ACgkQJNaLcl1U
h9DVJgf9GTiFrwdkccDRNoaxGziPUqbdzWANJ1sQ2MzOCWL9SHFm61yVSTmVfbaS
NGyrM10kC8EJA/KorEgW81EmIaARLRFkBHdzZQ2tckGyLE+wbiEgzAnw2+ZdeQRS
BnE5AMNy1kJjCtQhknVv634Jd/T1SorWC6qOplcmmD+xVsomfhJDha4p4FT80q6M
Z5Bes1DZx5XiThcJnEAuN48kbcnnIVEjv6TDvjT5Pg67I+BhgmqLs5pDR6Wd8JjS
Pl3w7xRTjdeObpH8eQGiV9EVWV27tdwHQ1T6BShBGoiUaGZaMjVNuEstIlhvTLDw
IuynYxZtPHz/EU6GR0cLLFiHiccQLg==
=25px
-----END PGP SIGNATURE-----

--InWnmNMQ0pNZrrCy--

--===============1773904902100778053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1773904902100778053==--
