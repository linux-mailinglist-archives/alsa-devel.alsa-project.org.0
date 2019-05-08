Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D064718362
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 03:52:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3201B1838;
	Thu,  9 May 2019 03:51:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3201B1838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557366741;
	bh=kS5ZXAkDHdfmIR290tGb2ACmw/FqIMmHKGqFht9czEQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UuoNTVU9wqdQPx1O+AS0S9Sq21nzwj+1tRRTfOoKWB4Q8GQPR9RFM5TFRYS242mG0
	 Lwrdb0uUE+gsAO0fLfcHzVr08vKTReoaYxWsVUcRn61MpGZ3+9SeHkgqKA/C+fDIw3
	 S3mU05OkB96EUw18wVN8mlIt1osb/SnKitVK5hL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F8A3F89682;
	Thu,  9 May 2019 03:50:36 +0200 (CEST)
X-Original-To: alsa-devel@Alsa-project.org
Delivered-To: alsa-devel@Alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4120CF89674; Thu,  9 May 2019 03:50:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DATE_IN_PAST_12_24, DKIM_SIGNED,
 DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F121F80796
 for <alsa-devel@Alsa-project.org>; Thu,  9 May 2019 03:50:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F121F80796
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="KjmckKwA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B0Af09SeWDN6E5eUpzR+XyWWeyRhiqh9k8HkO1gWLLQ=; b=KjmckKwARF9zdG5JTqN3uceJ1
 JlM5hqkgbuhr8IVdy3leEGucOPM6jnHY767vNswlrKHDGYXlizcL97VDlcOVhQ8uqs9nwXMGAKMlZ
 erxF4ib1jhp+UlM/1QRjroKFnZtPo+51YWRYaDidOk2u7wr01wQZfSXV+mSHCHCUBdbeY=;
Received: from [2001:268:c0e3:9e6d:fb20:4124:5afd:9c02]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOYCV-0001Mo-7v; Thu, 09 May 2019 01:50:23 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 682B244000C; Wed,  8 May 2019 11:33:13 +0100 (BST)
Date: Wed, 8 May 2019 19:33:13 +0900
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190508103313.GQ14916@sirena.org.uk>
References: <20190508094554.GK14916@sirena.org.uk>
 <s5h4l65s0kr.wl-tiwai@suse.de>
 <20190508103150.GP14916@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20190508103150.GP14916@sirena.org.uk>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@Alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [alsa-devel] [GIT PULL] ASoC fix for v5.2
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
Content-Type: multipart/mixed; boundary="===============1431858815053587906=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1431858815053587906==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LtMyRIzzNoTBiuto"
Content-Disposition: inline


--LtMyRIzzNoTBiuto
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 08, 2019 at 07:31:50PM +0900, Mark Brown wrote:
> On Wed, May 08, 2019 at 12:27:32PM +0200, Takashi Iwai wrote:
> > On Wed, 08 May 2019 11:45:54 +0200,
> > Mark Brown wrote:
>=20
> > > Emil Renner Berthing (1):
> > >       spi: rockchip: turn down tx dma bursts
>=20
> > BTW, is this commit intended to be in sound git repo?
> > Or was it applied to a wrong branch?  Just for confirmation...
>=20
> No, that's a mistake :/

My train's almost arrived, probably the easiest thing to do is if you
rebase it out.

--LtMyRIzzNoTBiuto
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzSsGgACgkQJNaLcl1U
h9AObgf/TVTjcsDsAfyFbKIAowwpx5t+9pS+EGMXx34InfwVLqAxRHLDHdEbz8v0
IdV7mKqLVfpWdp1ku+GYLDIGe9OpuiGZSE0Ur91Iw2eoPcZzRLDo/GIMfyT9uUl1
8/0sM3VZ8xLIMmnq1o1vOKFAemM86FQv766oPa7/nsiQFww3CtyuCMlTfVmuMfeK
rbD41JzI4dcJFEq0Nrx6gEY1GEzk+n4pxvyDHQ7H7EtCXPItnIgLqvmub9U3QG0A
LQq4iLsx3z1Jkw8sooOzLfgBCWVCAp3rLMlj/xzugmPfW8iJmAupWP4GMtsPRIlC
6Leg2VxW/n19v1lAx8UIV910gykapQ==
=OSCB
-----END PGP SIGNATURE-----

--LtMyRIzzNoTBiuto--

--===============1431858815053587906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1431858815053587906==--
