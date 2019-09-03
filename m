Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FF1A71EC
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2019 19:49:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A3201697;
	Tue,  3 Sep 2019 19:49:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A3201697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567532996;
	bh=onQR2yJC0tj/uRpZJTPbFlm0EhVY52EApp+1l+3Ebcs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oJ0OIXnU7u9Iv7SUrDuJcVlt5Bpu3P/7squppOUPbFxzjUDajzLNeQTj89ghKP3jX
	 isZUICVQmXH0LN/tTpdf8DVpviVIdCvTPVE1z3LFGnct8tRVKJq15Vtii5KEJ2+8Bl
	 uPntfV7qH9yi9AuPBDnwe4kuDlf4FyRBl2m+cV3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65720F8045F;
	Tue,  3 Sep 2019 19:48:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7684F8045F; Tue,  3 Sep 2019 19:48:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 550C5F8011E
 for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2019 19:48:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 550C5F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="oJ1NeYUe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zvy0cmcCS2UqHRB6ROv3+py+lgL7vtVDSDbGP6ppS/Q=; b=oJ1NeYUe3QPF59vT/aorPVMR+
 JYiFvXyF5mjFZEqRUjNCtIKJpxwQ2Fy1ty/ow3ho0KrzoqLyw7xPWsahEk8nCno2KOau9dYfA4lHr
 9zKk7LlbJA+6oisS5wm8o9S8PBsvFclpl684Ji+hRyPHd5gweZvwNoMvwOGm7oxpb0tyA=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i5CuQ-0000uI-0y; Tue, 03 Sep 2019 17:48:02 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 294862740A97; Tue,  3 Sep 2019 18:48:01 +0100 (BST)
Date: Tue, 3 Sep 2019 18:48:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Katsuhiro Suzuki <katsuhiro@katsuster.net>
Message-ID: <20190903174801.GD7916@sirena.co.uk>
References: <20190903165322.20791-1-katsuhiro@katsuster.net>
MIME-Version: 1.0
In-Reply-To: <20190903165322.20791-1-katsuhiro@katsuster.net>
X-Cookie: You will pass away very quickly.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, David Yang <yangxiaohua@everest-semi.com>,
 Daniel Drake <drake@endlessm.com>
Subject: Re: [alsa-devel] [PATCH v3 1/4] ASoC: es8316: judge PCM rate at
	later timing
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
Content-Type: multipart/mixed; boundary="===============1818039628646134265=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1818039628646134265==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rqzD5py0kzyFAOWN"
Content-Disposition: inline


--rqzD5py0kzyFAOWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 04, 2019 at 01:53:19AM +0900, Katsuhiro Suzuki wrote:

> Root cause of this strange behavior is changing constraints list at
> set_sysclk timing. It seems that is too early to determine. So this
> patch does not use constraints list and check PCM rate limit more
> later timing at hw_params.

hw_params is a bit late to impose constraints, you want them to be
available to be available to the application before it gets as far as
picking the parameters it wants so that you don't get hw_params failing
due to an invalid configuration.  That makes everything run more
smoothly, applications should be able to trust the constraints they got
and some will not handle failures well.

The way this works with the variable MCLKs is that you end up in one of
two cases (wm8731 and wm8741 do this):

   1. The system is idle, MCLK is set to 0.  In this case no constraints
      are set and we just set MCLK to whatever is required in hw_params()
      in the machine driver.
   2. One direction is active, MCLK is set to whatever that needed.  In
      this case startup() sets constraints derived from the MCLK.

There are races in this if streams are being started and torn down
simultaneously, there's not much we can do about them with the API the
way it is so we do have to validate in hw_params() anyway but it should
be validation not constraint imposition.

If the system has a fixed MCLK it just sets that on probe then we always
get the constraints applied on startup through the same code that
handles case 2.

--rqzD5py0kzyFAOWN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1up1AACgkQJNaLcl1U
h9BQogf+P2FPf4VyCSSMUsxKQIRYcVqySrIM/8U5LYf3W/Ti2KizQbw7G/N19kU5
Q1USsYI+BktP4bDUdRukW6qnNYp4kQTzVlhdS+JWz8s5sBDrErcKA0gOfBTDzfX2
jtM/LGASFQUhHV7i23g3FYyfmYkLR6fw6As3XI1gTWwZWpwb8L07XWZpy1YPs/ca
4m6Tnt1qb12CSzV1sclwRovoVWpwnDL7XYyTjRV3d2ywl9nyrKjke8TZP+PBKXlB
n+6Q+uBSHmxKBaBOlHkymNojgXP5pNrd2Dsq/Ngf/VBMnHOEAUNh1kWlHZAhqTPq
THnfPYSffJSt83BF5PwCEeRdv66pSg==
=QPbn
-----END PGP SIGNATURE-----

--rqzD5py0kzyFAOWN--

--===============1818039628646134265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1818039628646134265==--
