Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA0871D3C
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 19:00:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C952318D1;
	Tue, 23 Jul 2019 19:00:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C952318D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563901257;
	bh=KiOYjIGrNg3olgPCdUDltEA3MCP95OLPSdb9MsoUeKY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AjUkJpQO3MqoP6bB3s+tZWVFnMboz4zNaEvKjijrqYi/p/87UP2XzhSmMJc9RgdIj
	 M7x0AgrMZmJHgNXPnt+qUyc0XA1FEpm4d3WPthvZVFIP59UdefDOMFdmeJCWihV0ci
	 /U/GLsOBy16iCfV3tgiIwKpERxZK9Ezp41UqvXvo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E4A2F80447;
	Tue, 23 Jul 2019 18:59:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDF1FF80447; Tue, 23 Jul 2019 18:59:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9052CF800E8
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 18:59:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9052CF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="dMfg0hSx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sYJrw6LzTwJjMp7TjB51hi3sydAFjvm6lGYcWkNBDz0=; b=dMfg0hSxEO0OpcBJfpH7yV1Vl
 DuHsFo36gB0nVHHquXc6TXe75zc+tA87PXIc2+P2bQSuFRq6hmRm2AZPnGI4YBeUebkPdlZYC6CTE
 57NuMH9NZvEyPDDixNwZ8mbRkvyt7aGHg0qrhmghjUcUumQ4AlOHbSLD9JcMmCq3xr9Fs=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpy7y-0004IZ-6x; Tue, 23 Jul 2019 16:59:02 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id DDF762742B59; Tue, 23 Jul 2019 17:59:00 +0100 (BST)
Date: Tue, 23 Jul 2019 17:59:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190723165900.GM5365@sirena.org.uk>
References: <20190720194532.23682-1-cezary.rojewski@intel.com>
 <48015f53-e650-1e77-9217-3a65250673ac@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <48015f53-e650-1e77-9217-3a65250673ac@linux.intel.com>
X-Cookie: Avoid contact with eyes.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 0/5] ASoC: Intel: IPC framework updates
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
Content-Type: multipart/mixed; boundary="===============7493460028597554256=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7493460028597554256==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dzI2QqkSBOAresgT"
Content-Disposition: inline


--dzI2QqkSBOAresgT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 22, 2019 at 04:12:19PM -0500, Pierre-Louis Bossart wrote:

> The rule is that we can't break git bisect. And if you squash the patches
> together, then you have a really complicated patch to review/test, so like I
> said earlier such invasive changes in shared prototypes are really painful.

Yeah, I build test each commit as they get applied (though not
everything gets covered so things can get missed) and it's generally
helpful for people doing things like bisection.

--dzI2QqkSBOAresgT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl03PNQACgkQJNaLcl1U
h9DIugf/VItGBR/q1aSLeIYEatGAGxY34V2ObQlyDtj6eBtJZ1WAKPAtYVUigd/G
0+L+03cfSBOc6i0PLwE/b4JVRIMGyexNGvAR+FmFau0Iborm3Hjcr6h7TygczpCu
4Rz1rM1N1NxwoIN5guE/M/yyluROffSb7hOWFmDHn/S8nMXb4lBMugWgPAlxU+YW
AZ4t4c/HoPXxCPGWSzV9uRI5cuaulDhT0WUP+ug9ViMweAdOss8bM9yVUf3apafr
5O2nrlHjYrTM/DOvN5LPY81h8ee3ktZBMeun9h6UXbcnEHFHnmKOBYUQAXyJacze
tnzajqoAnu1H/aEQRfc7vNRgaoOeCQ==
=uPxN
-----END PGP SIGNATURE-----

--dzI2QqkSBOAresgT--

--===============7493460028597554256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7493460028597554256==--
