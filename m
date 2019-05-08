Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D02EE17591
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 12:01:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5973A1AA8;
	Wed,  8 May 2019 12:00:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5973A1AA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557309680;
	bh=RS2LHBa2yBbxMyUqDMyFybZRChsIJqocPTpcrVSEMX4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TGsYsdaoWTBeYkiI0wfkYqbD+9B5AT62NEPPkHtcsKbXTQP056FcDjMr/XuNKaHzO
	 ImrB0HLT6jAXag4ShCXvYNzu+zPK6s/gFUvAuf0swPDk58gIY9A9QL0wJb/I9rI014
	 ExcQ2FRAucrI/jAsAzOHEFm+QzeMuYWbJcn0sFEg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51530F89715;
	Wed,  8 May 2019 11:59:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75699F8970E; Wed,  8 May 2019 11:59:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CBF4F896FF
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 11:59:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CBF4F896FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="crKgAYqt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RmU8PploaVSTiiODYrnOh9JWiUn3KkJJplHGcSvqmWc=; b=crKgAYqt5mcTxTqU1vbgzpa+3
 DBLlg18UvWmq8f2+2A8BktvwZtLlcB19WeK9saEqeiMeKGsD9HmJJWfbocL+reLPCNdTHFBVzWy5H
 jdveAz9ybw/bbdhggpHprWTQkuMRCRaHyPC0pDFmUR64KwAwYay6ZVnPOaA2Xgo2IeJYE=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOJLr-0007ol-16; Wed, 08 May 2019 09:59:04 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 72F5E44000C; Wed,  8 May 2019 10:48:36 +0100 (BST)
Date: Wed, 8 May 2019 18:48:36 +0900
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Message-ID: <20190508094836.GL14916@sirena.org.uk>
References: <20190507051140.240245-1-tzungbi@google.com>
 <20190508063318.GL14916@sirena.org.uk>
 <CA+Px+wWQpvE5H=vM+0u_c3xpuZ8ivfgy0_xB84Ty_dvMAqBSVg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+Px+wWQpvE5H=vM+0u_c3xpuZ8ivfgy0_xB84Ty_dvMAqBSVg@mail.gmail.com>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Dylan Reid <dgreid@google.com>, tiwai@suse.com,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: max98357a: release GPIO when
	component removing
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
Content-Type: multipart/mixed; boundary="===============6616724082458859819=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6616724082458859819==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wu68CvGel4BZ8z1e"
Content-Disposition: inline


--wu68CvGel4BZ8z1e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 08, 2019 at 05:27:35PM +0800, Tzung-Bi Shih wrote:

> probe().  What do we expect to do in component's probe()?

Only things that really, really need the card.

> As component's probe() is later than device's, I thought we tend to
> put resource allocation in component's probe() for reasons:
> - to speed up the booting *maybe* a little
> - to allocate resources when really need them

No, this is backwards - there's no point in running through the ASoC
level initialization only to find out we don't have some critical
resource.

> I am using devm_gpiod_put() instead of gpiod_put() so that I suppose
> devm_ should take care of the rest of cleanup.  Do you think this is
> still a mess?

The entire point of devm_ is that it does all the cleanup for you.

--wu68CvGel4BZ8z1e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzSpfMACgkQJNaLcl1U
h9Bzmgf+MWD6CGQnDLW009iYmQOxZ2AtXLFHSPWkl/m+Zv8t/2RyWh/DTYTetLpW
oOT507k62Ymfi3bWkYMborHR1rvoWwSi8eHguoL31vjseTvZbm4xxit8rSWkbIW4
uA/KFUDogdxK4kqvNJhjdH3A3Y3LlBeFS/JXNoW4VWa+7dushdlR+euA8A6TlLEb
HGOVMcRd8aoWokidMZXxEivuPSQOTRTz3f4Xejl1eCplhXwIMD7lq/08J6Y/rwk0
DCg+vhLoGafR8pYcJWjqlU926bAo2T2ACZaqCisYsTL6+UdWTlEwVBYEH2aSZX57
7nWR8Qcg49HzJg7ze7DW3CEfnEk5uA==
=sMJM
-----END PGP SIGNATURE-----

--wu68CvGel4BZ8z1e--

--===============6616724082458859819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6616724082458859819==--
